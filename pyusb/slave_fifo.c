/* -*- mode: C; c-basic-offset: 8; -*-
 *
 * saxo_loader -- minimal FX2 firmware to manage a KNJN Saxo
 *
 * Copyright (c) 2009 by Brent Baccala <cosine@freesoft.org>
 *
 * based on convert_string/convert.c
 * Copyright (c) 2006--2008 by Wolfgang Wieser ] wwieser (a) gmx <*> de [ 
 *
 * Cross-compile with sdcc; the fx2regs.h include file is from
 * Wolfgang Wieser's usb-fx2-local-examples; currently available here:
 *
 * http://www.triplespark.net/elec/periph/USB-FX2/software/local_examples.html
 *
 * Boot loading the compiled program is done with Wolfgang's
 * cycfx2prog; available here:
 *
 * http://www.triplespark.net/elec/periph/USB-FX2/software/
 * 
 * The knjn.com Saxo is based around two chips: the FX2, which is an
 * 8051-based USB-2 device and an Altera Cyclone FPGA.  This program
 * is intended to be cross-compiled for an 8051 architecture using
 * 'sdcc', then boot loaded over USB (by cycfx2prog) to the Saxo.
 * Upon initialization, it resets the FPGA and places it into its
 * Passive Serial configuration mode.  Anything received by bulk
 * transfer over endpoint 1 (which should be an Altera .rbf file) is
 * then clocked out to the FPGA's configuration pins.  It also puts
 * endpoints 2, 4, 6, and 8 into the default configuration documented
 * in the Saxo manual, which presents them as FIFO buffers to the
 * FPGA.  It has been tested with the LEDblink, LEDglow, FX2_LEDs, and
 * FX2_bidir examples from the Saxo Startup Kit.
 *
 * Usage example (FX2_bidir_SaxoXylo.rbf is from the Saxo Startup Kit):
 *
 * cycfx2prog prg:saxo_loader.ihx run fbulk:1,FX2_bidir_SaxoXylo.rbf
 * cycfx2prog "sbulk:2,This is a test"
 * cycfx2prog dbulk:6,-512
 *
 * FX2_bidir_SaxoXylo programs the FPGA to count characters, so the
 * last command should return a character count of 0x0e.
 *
 * The code does not (directly) support programming the Saxo's
 * EEPROMs.  Doing so would require loading an FPGA bitfile that
 * implemented an I2C controller (to program the FX2's optional
 * EEPROM) and/or something to implement Altera's EPCS protocol (to
 * program the FPGA's EEPROM).  This should be doable with no
 * modification to this program other than tri-stating PA0 and PA1
 * after the initial passive load is done.  However, to load the FPGA
 * from its EEPROM, this program would have to be modified to put the
 * FPGA into Active Serial configuration mode upon startup (by driving
 * MSEL0 low).
 *
 * Key documentation to understand this code is Cypress's FX2
 * Technical Reference Manual (TRM) and Altera's Cyclone Device
 * Handbook, available (as of this writing) at these URLs:
 *
 *    http://www.keil.com/dd/docs/datashts/cypress/fx2_trm.pdf
 *    http://www.altera.com/literature/hb/cyc/cyc_c5v1.pdf
 *
 * The only other thing you really need to know is that the FX2's PA0
 * is wired to the FPGA's DATA0; PA1 to DCLK; PD1 to CONF_DONE; PD2 to
 * nCONFIG; PD3 to MSEL0.
 *
 * This file may be distributed and/or modified under the terms of the 
 * GNU General Public License version 2 as published by the Free Software 
 * Foundation. (See COPYING.GPL for details.)
 * 
 * This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 * 
 */

//
// Modificado e adaptado -- slave_fifo
// Angilberto - 06/2021
//

// para compilar: "make" ou simplesmente "sdcc -mmcs51 slave_fifo.c"

#define ALLOCATE_EXTERN
#include "fx2regs.h"

// Read TRM p.15-115 for an explanation on this. 
// A single nop is sufficient for default setup but like that we're on 
// the safe side. 
#define	SYNCDELAY	__asm \
	nop; nop; nop; nop; nop; nop; nop; nop; \
	nop; nop; nop; nop; nop; nop; nop; nop; \
	nop; __endasm
#define	NOP		__asm nop; __endasm


static void Initialize(void)
{
	int i;

	CPUCS=0x12;   // 48 MHz, CLKOUT output enabled. 
	SYNCDELAY;

	//IFCONFIG=0xe3;  // Internal 48MHz IFCLK; IFCLK pin output enabled
	IFCONFIG=0xc3;  // Internal 48MHz IFCLK; IFCLK pin output enabled
			// slave FIFO in synchronous mode
	SYNCDELAY;
	
	REVCTL=0x03;  // See TRM...
	SYNCDELAY;
	
	IOD = 0x08;	// MSEL0=1 (passive serial config); nCONFIG=0 (reset)
	OED = 0x0c;	// set port D bits 2 and 3 for output

	IOA = 0x01; // reset FPGA
	OEA = 0x03;	// set port A bits 0 and 1 for output
	SYNCDELAY;
	
	IOA = 0x00;
	SYNCDELAY;
	
	IOA = 0x01; // mantém a fpga em reset até o fim da inicialização
	SYNCDELAY;
		
	PINFLAGSAB = 0x98;  // FLAGA = EP2 EF / FLAGB = EP4 EF (empty flag)
	SYNCDELAY;
	PINFLAGSCD = 0xfe;  // FLAGC = EP6 FF / FLAGD = EP8 FF (full flag)
	SYNCDELAY;

	//EP1INCFG=0x00;		// EP1 IN disabled
	EP1INCFG=0xa0;		// EP1 IN enabled ????
	EP1OUTCFG=0xa0;		// EP1 OUT receives FPGA .rbf bitfile
	EP2CFG=0xa2;  // 1010 0010 (bulk OUT, 512 bytes, double-buffered)
	EP4CFG=0xa0;  // 1010 0000 (bulk OUT, 512 bytes, double-buffered)
	EP6CFG=0xe2;  // 1110 0010 (bulk IN, 512 bytes, double-buffered)
	EP8CFG=0xe0;  // 1110 0010 (bulk IN, 512 bytes, double-buffered)
	SYNCDELAY;
	
	FIFORESET = 0x80;  SYNCDELAY;  // NAK all requests from host. 
	FIFORESET = 0x82;  SYNCDELAY;  // Reset individual EP (2,4,6,8)
	FIFORESET = 0x84;  SYNCDELAY;
	FIFORESET = 0x86;  SYNCDELAY;
	FIFORESET = 0x88;  SYNCDELAY;
	FIFORESET = 0x00;  SYNCDELAY;  // Resume normal operation. 

	// Be sure to clear the 2 buffers (double-buffered) (required!). 
	// Has to be done with FIFO config register 0 for some reason
	EP2FIFOCFG = 0x00; SYNCDELAY;
	OUTPKTEND = 0x82;  SYNCDELAY;
	OUTPKTEND = 0x82;  SYNCDELAY;

	// Be sure to clear the 2 buffers (double-buffered) (required!). 
	// Has to be done with FIFO config register 0 for some reason
	EP4FIFOCFG = 0x00; SYNCDELAY;
	OUTPKTEND = 0x84;  SYNCDELAY;
	OUTPKTEND = 0x84;  SYNCDELAY;

	EP2FIFOCFG = 0x10; SYNCDELAY; //  AUTOOUT=1; byte-wide operation
	EP4FIFOCFG = 0x10; SYNCDELAY; //  AUTOOUT=1; byte-wide operation
	EP6FIFOCFG = 0x0c; SYNCDELAY; //  AUTOIN=1; byte-wide operation
	EP8FIFOCFG = 0x0c; SYNCDELAY; //  AUTOIN=1; byte-wide operation
	
	EP1OUTBC=0xff; // arm endpoint 1 for OUT (host->device) transfers
	SYNCDELAY;

	// nCONFIG has to be low at least 40 us to reset the FPGA, so
	// burn 2000 clock cycles here.  At 48 MHz, that's 20.8
	// ns/cycle, for a total of 41.6 us.  We don't have to do
	// anything fancy here like a timer and an interrupt because
	// all we're doing is waiting on FPGA configuration data on
	// endpoint 1, which has already been armed, so the first
	// packet will just sit there until we're ready for it.

	for (i=0; i<2000; i++) NOP;

	IOD = 0x0c;	// nCONFIG=1 (configure/run)

	// Burn another 40 us to let nSTATUS go high

	for (i=0; i<2000; i++) NOP;

	// Now we're ready to configure the FPGA...
}


// This will read the EP1 data and write it to the FPGA.
//
// PA0 is wired to the FPGA's DATA0 and PA1 to DCLK.  Data is clocked
// in, LSB first, on the rising edge of DCLK.

/**/
static void ProcessEP1Data(void)
{
	//xdata const unsigned char *src=EP1OUTBUF;
	const unsigned char *src_out=EP1OUTBUF;
	unsigned char *src_in=EP1INBUF;

	unsigned int len = EP1OUTBC;
	unsigned int i;
/*
	for(i=0; i<len; i++,src++)
	{
		unsigned char datta = *src;
		unsigned int bitt;

		for (bitt=0; bitt<8; bitt++) {
			IOA = (datta & 0x01);
			IOA = (datta & 0x01) | 0x02;
			datta >>= 1;
		}
	}
*/
	for (i=0; i<len; i++)
	{
		IOA = ((IOA & 0xfe) | (src_out[i] & 0x01)); // o sinal PA0 vira "reset" dentro da FPGA
		SYNCDELAY;
	}
	//
	//src_in[0] = 0x55;
	//EP1INBC=1;
	//
	EP1OUTBC=0xff; // re-arm endpoint 1
	SYNCDELAY;
}
/**/

void main(void)
{
	long led_counter = 32000;
	
	Initialize();
	
	// loop reading EP1 data until FPGA signals CONF_DONE
/*
	while (!(IOD & 0x02))
	{
		// EP1 input
		if (!(EP1OUTCS & (1<<1))) {
			ProcessEP1Data();
		}
	}
*/
	// FPGA configuration done - disable EP1
	//EP1OUTCFG = 0;

	// At this point, we might also want to tri-state PA0 and PA1
	// to make them available for general purpose use, since each
	// is connected to an FPGA I/O pin in addition to an FPGA
	// configuration pin.  On the other hand, the Cyclone Device
	// Handbook advices driving DATA0 either high or low after
	// configuration is done and not leaving it tri-stated.  And,
	// of course, there would be no point in doing anything else
	// with either PA0 or PA1 unless this program was modified to
	// do it!  So we'll just leave them alone (driven by the FX2).
	// Uncomment the following line if you want to modify this
	// program to do something with them.  (Hint: they can be used
	// as interrupt lines to the FX2; see the TRM)

	// OEA = 0x00;
	
	IOA = 0x00; // inicialização concluída - libera o reset da fpga
	SYNCDELAY;
		
	while (1) 
	{
		if (!(EP1OUTCS & (1<<1))) 
		{
			ProcessEP1Data();
		}
		
		led_counter = led_counter - 1;
		if (led_counter == 0)
		{
			led_counter = 64000;
			IOA = IOA ^ 2;
		}
	
	}

}
