/*
	LPCUSB, an USB device driver for LPC microcontrollers	
	Copyright (C) 2008 Bertrik Sikken (bertrik@sikken.nl)

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright
	   notice, this list of conditions and the following disclaimer.
	2. Redistributions in binary form must reproduce the above copyright
	   notice, this list of conditions and the following disclaimer in the
	   documentation and/or other materials provided with the distribution.
	3. The name of the author may not be used to endorse or promote products
	   derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
	IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
	OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
	IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, 
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
	NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
	DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
	THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
	THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "type.h"
#include "debug.h"

#include "sdcard.h"
#include "blockdev.h"

static U32 getsdbits(U8 *buf, int offset, int len)
{
	U32		mask, data;
	int		bytepos, bitpos;
	int		shift;
	
	offset = 127 - offset;
	bytepos = offset / 8;
	bitpos = offset % 8;
	mask = (1 << len) - 1;

	data = 0;
	for (shift = -(len + bitpos); shift < 0; shift += 8) {
		data = (data << 8) | buf[bytepos++];
	}
	return (data >> shift) & mask;
}


BOOL BlockDevInit(void)
{
	return SDInit();
}


BOOL BlockDevWrite(U32 dwBlock, U8* pbBuf)
{
	return SDWriteBlock(pbBuf, dwBlock);
}


BOOL BlockDevRead(U32 dwBlock, U8* pbBuf)
{
	return SDReadBlock(pbBuf, dwBlock);
}


BOOL BlockDevGetSize(U32 *pdwDriveSize)
{
	U8	abBuf[16];
	U32	c_size, num_blocks, block_size;
	U16	read_bl_len;
	U8	csd_structure, c_size_mult; 
	
	/* read CSD to determine block size and number of blocks */
	if (!SDReadCSD(abBuf)) {
		return FALSE;
	}
	csd_structure =	getsdbits(abBuf, 127, 2);
	switch (csd_structure) {
	
	case 0:
		read_bl_len =	getsdbits(abBuf, 83, 4);
		c_size =		getsdbits(abBuf, 73, 12);
		c_size_mult =	getsdbits(abBuf, 49, 3);
		num_blocks = (c_size + 1) * (4 << c_size_mult);
		block_size = 1 << read_bl_len;
		break;

	case 1:
		c_size =		getsdbits(abBuf, 69, 22);
		num_blocks = (c_size + 1) * 512 * 1024;
		block_size = 512;
		break;
		
	default:
		DBG("Invalid CSD structure (%d)!\n", csd_structure);
		return FALSE;
	}

	*pdwDriveSize = num_blocks * block_size;
	return TRUE;
}

