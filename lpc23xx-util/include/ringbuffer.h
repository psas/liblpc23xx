/*! \file ringbuffer.h
 *
 */

#ifndef RINGBUFFER_H_
#define RINGBUFFER_H_

#include <stdint.h>
#include <stdbool.h>

/*! A function to enable and disable interrupts */
extern void util_enable_(bool state);

/*! \ingroup ringbuffer
 *
 * @{
 */


/*! \typedef RB_ELEM
 *
 * A somewhat flexible method for changing the type of the ringbuffer elements
 *
 */
typedef     uint8_t                 RB_ELEM;

/*! \brief Define the maximum number of bytes in a ringbuffer. */
#define     MAX_RINGBUFFER_ELEMS    254


/*!
 * Ringbuffer
 *
 * Ring buffer structure for uint8.
 *
 * \warning
 * For char, will need to cast uint8_t to char
 * where appropriate.
 */
typedef struct {
    /*! storage array for ringbuffer elements */
    RB_ELEM   rbuff[MAX_RINGBUFFER_ELEMS]   ;
    /*! head pointer into the storage array */
    RB_ELEM   headidx                       ;
    /*! tail pointer into the storage array */
    RB_ELEM   tailidx                       ;
    /*! number of entries currently in ringbuffer */
    uint8_t   num_entries                   ;
    /*! maximum number of entries for ringbuffer */
    uint8_t   max_entries                   ;
    /*! full or empty state of ringbuffer */
    bool      rbfull                        ;
} Ringbuffer;


bool rb_initialize(Ringbuffer* rb);

bool rb_put_elem(RB_ELEM c, Ringbuffer* rb);

bool rb_insert_string(char* s, Ringbuffer* rb);

bool rb_get_elem(RB_ELEM* c, Ringbuffer* rb);

void rb_get_line(RB_ELEM* s, Ringbuffer* rb) ;

void rb_get_string(RB_ELEM* s, Ringbuffer* rb);

inline bool rb_is_full(Ringbuffer* rb);

inline bool rb_is_empty(Ringbuffer* rb);

RB_ELEM rb_max_size(Ringbuffer* rb);

RB_ELEM rb_numentries(Ringbuffer* rb);

//! @}

#endif

