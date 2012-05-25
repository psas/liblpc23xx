
/*! \file ringbuffer.c
 *
 */

#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "lpc23xx-vic.h"

#include "ringbuffer.h"

/*! \defgroup ringbuffer Ring buffer ADT
 * @{
 */

/*! \brief Initialize a Ringbuffer_s
 *
 * \param[in] rb pointer to a Ringbuffer_s
 *
 * \return false if rb is NULL, true if init succeeds.
 *
 * \warning By convention in this ADT, unused entries in the
 *   ring buffer are marked with '0'.
 *
 * \warning During initialization, interrupts are disabled.
 */
bool rb_initialize(Ringbuffer* rb) {
    uint8_t i = 0;

    if(rb==NULL) { return(false); }

    /* maximum size of this ringbuffer is 8 bit */
    if(MAX_RINGBUFFER_ELEMS > 255) return(false);

    vic_cpu_disable_interrupts();

    for(i=0; i<MAX_RINGBUFFER_ELEMS; ++i) {
        rb->rbuff[i]='\0';
    }
    rb->headidx     = 0;
    rb->tailidx     = 0;
    rb->num_entries = 0;
    rb->max_entries = MAX_RINGBUFFER_ELEMS;
    rb->rbfull      = false;

    vic_enableIRQ();
    vic_enableFIQ();

    vic_cpu_enable_interrupts();

    return(true);
}

/*! \brief Insert a RB_ELEM into the ringbuffer
 *
 * \param[in] c the RB_ELEM to insert
 * \param[in] rb the Ringbuffer_s
 *
 * \warning tailidx always points at first empty space
 */
bool rb_put_elem(RB_ELEM c, Ringbuffer* rb)
{
    bool status = true;

    if(rb == NULL) { return(false); }

    if((rb->num_entries) < (rb->max_entries)) {
        rb->rbuff[rb->tailidx]   = c;
        rb->num_entries++;
        if((rb->tailidx) < (rb->max_entries)-1) {
            rb->tailidx++;
        } else {
            rb->tailidx = 0;
        }
    } else {
        status=false;
    }

    return(status);
}

/*! \brief Insert a string into a Ringbuffer_s
 *
 * \param[in] s  a pointer to a uint8 array.
 *
 * \param[in] rb a pointer to a Ringbuffer_s.
 *
 * \warning This function should not be used if RB_ELEM is
 * not an appropriate type (hint: 8bit int).
 */
bool rb_insert_string(char* s, Ringbuffer* rb)
{
    uint8_t i = 0;

    if(s  == NULL) {return(false);}
    if(rb == NULL) {return(false);}

    for(i=0; i<strlen(s); ++i ) {
        if(!rb_put_elem( (RB_ELEM)s[i] ,rb)) {
            return(false);
        }
    }
    return(true);
}

/*! \brief get a RB_ELEM from the ring buffer
 *
 * \param[out] c a pointer to a RB_ELEM location
 *
 * \param[in] rb the Ringbuffer_s
 *
 * \return false if empty or other fail.
 *
 * \warning this will remove the first RB_ELEM from the ringbuffer
 *    in a FIFO fashion.
 *
 * \warning Any RB_ELEM removed is replaced with a '0'
 */
bool rb_get_elem(RB_ELEM* c, Ringbuffer* rb) {
    if(c  == NULL) {return(false);}
    if(rb == NULL) {return(false);}

    if(rb->num_entries != 0) {
        *c = rb->rbuff[rb->headidx];
        rb->rbuff[rb->headidx] = '\0';
        rb->num_entries--;
        if((rb->headidx) < (rb->max_entries)-1) {
            rb->headidx++;
        } else {
            rb->headidx = 0;
        }
    } else {
        return(false);
    }
    return(true);
}


/*! \brief Remove a line from the ringbuffer
 *
 * \param[in] s  pointer to uint8 array.
 *
 * \param[in] rb  Ringbuffer_s
 *
 * \warning Will remove ELEMS up to first '\n', or MAX_RINGBUFFER_ELEMS
 * including the '\n'. The 's' line ELEMS storage must have at least
 * MAX_RINGBUFFER_ELEMS+1 of free space.
 *
 * \warning depends on RB_ELEM of appropriate type (char)
 */
void rb_get_line(RB_ELEM* s, Ringbuffer* rb) {

    uint8_t j = 0;

    for (j=0; j<MAX_RINGBUFFER_ELEMS; ++j) {
        if(rb->num_entries == 0)   { s[j]='\0'; break; }
        if(!rb_get_elem(&s[j],rb)) { s[j]='\0'; break; }
        if(s[j] == '\n') break;
    }
    s[j+1]='\0';
}

/*! \brief Remove a string from the ringbuffer
 *
 * \param[in] s pointer to RB_ELEM array.
 *
 * \param[in] rb Ringbuffer_s
 *
 * \warning Will remove RB_ELEM up to first '0', or MAX_RINGBUFFER_ELEMS
 * including the '0'. The 's' string storage must have at least
 * MAX_RINGBUFFER_ELEMS+1 of free space.
 */
void rb_get_string(RB_ELEM* s, Ringbuffer* rb) {

    uint8_t j = 0;

    for (j=0; j<MAX_RINGBUFFER_ELEMS; ++j) {
        if(rb->num_entries == 0) break;
        if(!rb_get_elem(&s[j],rb)) break;
        if(s[j] == '\0') break;
    }
    s[j]='\0';
}

/*! \brief Returns the full or not full state of ringbuffer */
bool rb_is_full(Ringbuffer* rb) {

    if(rb == NULL) {return(false);}

    return(rb->rbfull);
}

/*! \brief Returns the empty or not empty state of ringbuffer */
bool rb_is_empty(Ringbuffer* rb) {
    if(rb == NULL) {return(false);}
    return((rb->num_entries)==0);
}

/*! \brief Returns the maximum size of ringbuffer */
uint8_t rb_max_size(Ringbuffer* rb) {
    if(rb == NULL) {return(false);}
    return(rb->max_entries);
}

/*! \brief Returns the current number of entries in ringbuffer */
uint8_t rb_numentries(Ringbuffer* rb) {
    if(rb == NULL) {return(false);}
    return(rb->num_entries);
}

//! @}
