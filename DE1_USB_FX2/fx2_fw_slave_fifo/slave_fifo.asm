;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module slave_fifo
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _EIPX6
	.globl _EIPX5
	.globl _EIPX4
	.globl _PI2C
	.globl _PUSB
	.globl _EIEX6
	.globl _EIEX5
	.globl _EIEX4
	.globl _EI2C
	.globl _EUSB
	.globl _SMOD1
	.globl _ERESI
	.globl _RESI
	.globl _INT6
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _FL
	.globl _P
	.globl _TF2
	.globl _EXF2
	.globl _RCLK
	.globl _TCLK
	.globl _EXEN2
	.globl _TR2
	.globl _C_T2
	.globl _CP_RL2
	.globl _SM01
	.globl _SM11
	.globl _SM21
	.globl _REN1
	.globl _TB81
	.globl _RB81
	.globl _TI1
	.globl _RI1
	.globl _PS1
	.globl _PT2
	.globl _PS0
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _PD7
	.globl _PD6
	.globl _PD5
	.globl _PD4
	.globl _PD3
	.globl _PD2
	.globl _PD1
	.globl _PD0
	.globl _EA
	.globl _ES1
	.globl _ET2
	.globl _ES0
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _PC7
	.globl _PC6
	.globl _PC5
	.globl _PC4
	.globl _PC3
	.globl _PC2
	.globl _PC1
	.globl _PC0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _PB7
	.globl _PB6
	.globl _PB5
	.globl _PB4
	.globl _PB3
	.globl _PB2
	.globl _PB1
	.globl _PB0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _PA7
	.globl _PA6
	.globl _PA5
	.globl _PA4
	.globl _PA3
	.globl _PA2
	.globl _PA1
	.globl _PA0
	.globl _EIP
	.globl _B
	.globl _EIE
	.globl _ACC
	.globl _EICON
	.globl _PSW
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _SBUF1
	.globl _SCON1
	.globl _GPIFSGLDATLNOX
	.globl _GPIFSGLDATLX
	.globl _GPIFSGLDATH
	.globl _GPIFTRIG
	.globl _EP01STAT
	.globl _IP
	.globl _OEE
	.globl _OED
	.globl _OEC
	.globl _OEB
	.globl _OEA
	.globl _IOE
	.globl _IOD
	.globl _AUTOPTRSETUP
	.globl _EP68FIFOFLGS
	.globl _EP24FIFOFLGS
	.globl _EP2468STAT
	.globl _IE
	.globl _INT4CLR
	.globl _INT2CLR
	.globl _IOC
	.globl _AUTOPTRL2
	.globl _AUTOPTRH2
	.globl _AUTOPTRL1
	.globl _AUTOPTRH1
	.globl _SBUF0
	.globl _SCON0
	.globl __XPAGE
	.globl _EXIF
	.globl _IOB
	.globl _CKCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPS
	.globl _DPH1
	.globl _DPL1
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _IOA
	.globl _GPCR2
	.globl _ECC2B2
	.globl _ECC2B1
	.globl _ECC2B0
	.globl _ECC1B2
	.globl _ECC1B1
	.globl _ECC1B0
	.globl _ECCRESET
	.globl _ECCCFG
	.globl _EP8FIFOBUF
	.globl _EP6FIFOBUF
	.globl _EP4FIFOBUF
	.globl _EP2FIFOBUF
	.globl _EP1INBUF
	.globl _EP1OUTBUF
	.globl _EP0BUF
	.globl _UDMACRCQUAL
	.globl _UDMACRCL
	.globl _UDMACRCH
	.globl _GPIFHOLDAMOUNT
	.globl _FLOWSTBHPERIOD
	.globl _FLOWSTBEDGE
	.globl _FLOWSTB
	.globl _FLOWHOLDOFF
	.globl _FLOWEQ1CTL
	.globl _FLOWEQ0CTL
	.globl _FLOWLOGIC
	.globl _FLOWSTATE
	.globl _GPIFABORT
	.globl _GPIFREADYSTAT
	.globl _GPIFREADYCFG
	.globl _XGPIFSGLDATLNOX
	.globl _XGPIFSGLDATLX
	.globl _XGPIFSGLDATH
	.globl _EP8GPIFTRIG
	.globl _EP8GPIFPFSTOP
	.globl _EP8GPIFFLGSEL
	.globl _EP6GPIFTRIG
	.globl _EP6GPIFPFSTOP
	.globl _EP6GPIFFLGSEL
	.globl _EP4GPIFTRIG
	.globl _EP4GPIFPFSTOP
	.globl _EP4GPIFFLGSEL
	.globl _EP2GPIFTRIG
	.globl _EP2GPIFPFSTOP
	.globl _EP2GPIFFLGSEL
	.globl _GPIFTCB0
	.globl _GPIFTCB1
	.globl _GPIFTCB2
	.globl _GPIFTCB3
	.globl _GPIFADRL
	.globl _GPIFADRH
	.globl _GPIFCTLCFG
	.globl _GPIFIDLECTL
	.globl _GPIFIDLECS
	.globl _GPIFWFSELECT
	.globl _SETUPDAT
	.globl _SUDPTRCTL
	.globl _SUDPTRL
	.globl _SUDPTRH
	.globl _EP8FIFOBCL
	.globl _EP8FIFOBCH
	.globl _EP6FIFOBCL
	.globl _EP6FIFOBCH
	.globl _EP4FIFOBCL
	.globl _EP4FIFOBCH
	.globl _EP2FIFOBCL
	.globl _EP2FIFOBCH
	.globl _EP8FIFOFLGS
	.globl _EP6FIFOFLGS
	.globl _EP4FIFOFLGS
	.globl _EP2FIFOFLGS
	.globl _EP8CS
	.globl _EP6CS
	.globl _EP4CS
	.globl _EP2CS
	.globl _EP1INCS
	.globl _EP1OUTCS
	.globl _EP0CS
	.globl _EP8BCL
	.globl _EP8BCH
	.globl _EP6BCL
	.globl _EP6BCH
	.globl _EP4BCL
	.globl _EP4BCH
	.globl _EP2BCL
	.globl _EP2BCH
	.globl _EP1INBC
	.globl _EP1OUTBC
	.globl _EP0BCL
	.globl _EP0BCH
	.globl _FNADDR
	.globl _MICROFRAME
	.globl _USBFRAMEL
	.globl _USBFRAMEH
	.globl _TOGCTL
	.globl _WAKEUPCS
	.globl _SUSPEND
	.globl _USBCS
	.globl _XAUTODAT2
	.globl _XAUTODAT1
	.globl _I2CTL
	.globl _I2DAT
	.globl _I2CS
	.globl _PORTECFG
	.globl _PORTCCFG
	.globl _PORTACFG
	.globl _INTSETUP
	.globl _INT4IVEC
	.globl _INT2IVEC
	.globl _CLRERRCNT
	.globl _ERRCNTLIM
	.globl _USBERRIRQ
	.globl _USBERRIE
	.globl _GPIFIRQ
	.globl _GPIFIE
	.globl _EPIRQ
	.globl _EPIE
	.globl _USBIRQ
	.globl _USBIE
	.globl _NAKIRQ
	.globl _NAKIE
	.globl _IBNIRQ
	.globl _IBNIE
	.globl _EP8FIFOIRQ
	.globl _EP8FIFOIE
	.globl _EP6FIFOIRQ
	.globl _EP6FIFOIE
	.globl _EP4FIFOIRQ
	.globl _EP4FIFOIE
	.globl _EP2FIFOIRQ
	.globl _EP2FIFOIE
	.globl _OUTPKTEND
	.globl _INPKTEND
	.globl _EP8ISOINPKTS
	.globl _EP6ISOINPKTS
	.globl _EP4ISOINPKTS
	.globl _EP2ISOINPKTS
	.globl _EP8FIFOPFL
	.globl _EP8FIFOPFH
	.globl _EP6FIFOPFL
	.globl _EP6FIFOPFH
	.globl _EP4FIFOPFL
	.globl _EP4FIFOPFH
	.globl _EP2FIFOPFL
	.globl _EP2FIFOPFH
	.globl _EP8AUTOINLENL
	.globl _EP8AUTOINLENH
	.globl _EP6AUTOINLENL
	.globl _EP6AUTOINLENH
	.globl _EP4AUTOINLENL
	.globl _EP4AUTOINLENH
	.globl _EP2AUTOINLENL
	.globl _EP2AUTOINLENH
	.globl _EP8FIFOCFG
	.globl _EP6FIFOCFG
	.globl _EP4FIFOCFG
	.globl _EP2FIFOCFG
	.globl _EP8CFG
	.globl _EP6CFG
	.globl _EP4CFG
	.globl _EP2CFG
	.globl _EP1INCFG
	.globl _EP1OUTCFG
	.globl _REVCTL
	.globl _REVID
	.globl _FIFOPINPOLAR
	.globl _UART230
	.globl _BPADDRL
	.globl _BPADDRH
	.globl _BREAKPT
	.globl _FIFORESET
	.globl _PINFLAGSCD
	.globl _PINFLAGSAB
	.globl _IFCONFIG
	.globl _CPUCS
	.globl _RES_WAVEDATA_END
	.globl _GPIF_WAVE_DATA
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_IOA	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_DPL1	=	0x0084
_DPH1	=	0x0085
_DPS	=	0x0086
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_CKCON	=	0x008e
_IOB	=	0x0090
_EXIF	=	0x0091
__XPAGE	=	0x0092
_SCON0	=	0x0098
_SBUF0	=	0x0099
_AUTOPTRH1	=	0x009a
_AUTOPTRL1	=	0x009b
_AUTOPTRH2	=	0x009d
_AUTOPTRL2	=	0x009e
_IOC	=	0x00a0
_INT2CLR	=	0x00a1
_INT4CLR	=	0x00a2
_IE	=	0x00a8
_EP2468STAT	=	0x00aa
_EP24FIFOFLGS	=	0x00ab
_EP68FIFOFLGS	=	0x00ac
_AUTOPTRSETUP	=	0x00af
_IOD	=	0x00b0
_IOE	=	0x00b1
_OEA	=	0x00b2
_OEB	=	0x00b3
_OEC	=	0x00b4
_OED	=	0x00b5
_OEE	=	0x00b6
_IP	=	0x00b8
_EP01STAT	=	0x00ba
_GPIFTRIG	=	0x00bb
_GPIFSGLDATH	=	0x00bd
_GPIFSGLDATLX	=	0x00be
_GPIFSGLDATLNOX	=	0x00bf
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_PSW	=	0x00d0
_EICON	=	0x00d8
_ACC	=	0x00e0
_EIE	=	0x00e8
_B	=	0x00f0
_EIP	=	0x00f8
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_PA0	=	0x0080
_PA1	=	0x0081
_PA2	=	0x0082
_PA3	=	0x0083
_PA4	=	0x0084
_PA5	=	0x0085
_PA6	=	0x0086
_PA7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_PB0	=	0x0090
_PB1	=	0x0091
_PB2	=	0x0092
_PB3	=	0x0093
_PB4	=	0x0094
_PB5	=	0x0095
_PB6	=	0x0096
_PB7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_PC0	=	0x00a0
_PC1	=	0x00a1
_PC2	=	0x00a2
_PC3	=	0x00a3
_PC4	=	0x00a4
_PC5	=	0x00a5
_PC6	=	0x00a6
_PC7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES0	=	0x00ac
_ET2	=	0x00ad
_ES1	=	0x00ae
_EA	=	0x00af
_PD0	=	0x00b0
_PD1	=	0x00b1
_PD2	=	0x00b2
_PD3	=	0x00b3
_PD4	=	0x00b4
_PD5	=	0x00b5
_PD6	=	0x00b6
_PD7	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS0	=	0x00bc
_PT2	=	0x00bd
_PS1	=	0x00be
_RI1	=	0x00c0
_TI1	=	0x00c1
_RB81	=	0x00c2
_TB81	=	0x00c3
_REN1	=	0x00c4
_SM21	=	0x00c5
_SM11	=	0x00c6
_SM01	=	0x00c7
_CP_RL2	=	0x00c8
_C_T2	=	0x00c9
_TR2	=	0x00ca
_EXEN2	=	0x00cb
_TCLK	=	0x00cc
_RCLK	=	0x00cd
_EXF2	=	0x00ce
_TF2	=	0x00cf
_P	=	0x00d0
_FL	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_INT6	=	0x00db
_RESI	=	0x00dc
_ERESI	=	0x00dd
_SMOD1	=	0x00df
_EUSB	=	0x00e8
_EI2C	=	0x00e9
_EIEX4	=	0x00ea
_EIEX5	=	0x00eb
_EIEX6	=	0x00ec
_PUSB	=	0x00f8
_PI2C	=	0x00f9
_EIPX4	=	0x00fa
_EIPX5	=	0x00fb
_EIPX6	=	0x00fc
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_GPIF_WAVE_DATA	=	0xe400
_RES_WAVEDATA_END	=	0xe480
_CPUCS	=	0xe600
_IFCONFIG	=	0xe601
_PINFLAGSAB	=	0xe602
_PINFLAGSCD	=	0xe603
_FIFORESET	=	0xe604
_BREAKPT	=	0xe605
_BPADDRH	=	0xe606
_BPADDRL	=	0xe607
_UART230	=	0xe608
_FIFOPINPOLAR	=	0xe609
_REVID	=	0xe60a
_REVCTL	=	0xe60b
_EP1OUTCFG	=	0xe610
_EP1INCFG	=	0xe611
_EP2CFG	=	0xe612
_EP4CFG	=	0xe613
_EP6CFG	=	0xe614
_EP8CFG	=	0xe615
_EP2FIFOCFG	=	0xe618
_EP4FIFOCFG	=	0xe619
_EP6FIFOCFG	=	0xe61a
_EP8FIFOCFG	=	0xe61b
_EP2AUTOINLENH	=	0xe620
_EP2AUTOINLENL	=	0xe621
_EP4AUTOINLENH	=	0xe622
_EP4AUTOINLENL	=	0xe623
_EP6AUTOINLENH	=	0xe624
_EP6AUTOINLENL	=	0xe625
_EP8AUTOINLENH	=	0xe626
_EP8AUTOINLENL	=	0xe627
_EP2FIFOPFH	=	0xe630
_EP2FIFOPFL	=	0xe631
_EP4FIFOPFH	=	0xe632
_EP4FIFOPFL	=	0xe633
_EP6FIFOPFH	=	0xe634
_EP6FIFOPFL	=	0xe635
_EP8FIFOPFH	=	0xe636
_EP8FIFOPFL	=	0xe637
_EP2ISOINPKTS	=	0xe640
_EP4ISOINPKTS	=	0xe641
_EP6ISOINPKTS	=	0xe642
_EP8ISOINPKTS	=	0xe643
_INPKTEND	=	0xe648
_OUTPKTEND	=	0xe649
_EP2FIFOIE	=	0xe650
_EP2FIFOIRQ	=	0xe651
_EP4FIFOIE	=	0xe652
_EP4FIFOIRQ	=	0xe653
_EP6FIFOIE	=	0xe654
_EP6FIFOIRQ	=	0xe655
_EP8FIFOIE	=	0xe656
_EP8FIFOIRQ	=	0xe657
_IBNIE	=	0xe658
_IBNIRQ	=	0xe659
_NAKIE	=	0xe65a
_NAKIRQ	=	0xe65b
_USBIE	=	0xe65c
_USBIRQ	=	0xe65d
_EPIE	=	0xe65e
_EPIRQ	=	0xe65f
_GPIFIE	=	0xe660
_GPIFIRQ	=	0xe661
_USBERRIE	=	0xe662
_USBERRIRQ	=	0xe663
_ERRCNTLIM	=	0xe664
_CLRERRCNT	=	0xe665
_INT2IVEC	=	0xe666
_INT4IVEC	=	0xe667
_INTSETUP	=	0xe668
_PORTACFG	=	0xe670
_PORTCCFG	=	0xe671
_PORTECFG	=	0xe672
_I2CS	=	0xe678
_I2DAT	=	0xe679
_I2CTL	=	0xe67a
_XAUTODAT1	=	0xe67b
_XAUTODAT2	=	0xe67c
_USBCS	=	0xe680
_SUSPEND	=	0xe681
_WAKEUPCS	=	0xe682
_TOGCTL	=	0xe683
_USBFRAMEH	=	0xe684
_USBFRAMEL	=	0xe685
_MICROFRAME	=	0xe686
_FNADDR	=	0xe687
_EP0BCH	=	0xe68a
_EP0BCL	=	0xe68b
_EP1OUTBC	=	0xe68d
_EP1INBC	=	0xe68f
_EP2BCH	=	0xe690
_EP2BCL	=	0xe691
_EP4BCH	=	0xe694
_EP4BCL	=	0xe695
_EP6BCH	=	0xe698
_EP6BCL	=	0xe699
_EP8BCH	=	0xe69c
_EP8BCL	=	0xe69d
_EP0CS	=	0xe6a0
_EP1OUTCS	=	0xe6a1
_EP1INCS	=	0xe6a2
_EP2CS	=	0xe6a3
_EP4CS	=	0xe6a4
_EP6CS	=	0xe6a5
_EP8CS	=	0xe6a6
_EP2FIFOFLGS	=	0xe6a7
_EP4FIFOFLGS	=	0xe6a8
_EP6FIFOFLGS	=	0xe6a9
_EP8FIFOFLGS	=	0xe6aa
_EP2FIFOBCH	=	0xe6ab
_EP2FIFOBCL	=	0xe6ac
_EP4FIFOBCH	=	0xe6ad
_EP4FIFOBCL	=	0xe6ae
_EP6FIFOBCH	=	0xe6af
_EP6FIFOBCL	=	0xe6b0
_EP8FIFOBCH	=	0xe6b1
_EP8FIFOBCL	=	0xe6b2
_SUDPTRH	=	0xe6b3
_SUDPTRL	=	0xe6b4
_SUDPTRCTL	=	0xe6b5
_SETUPDAT	=	0xe6b8
_GPIFWFSELECT	=	0xe6c0
_GPIFIDLECS	=	0xe6c1
_GPIFIDLECTL	=	0xe6c2
_GPIFCTLCFG	=	0xe6c3
_GPIFADRH	=	0xe6c4
_GPIFADRL	=	0xe6c5
_GPIFTCB3	=	0xe6ce
_GPIFTCB2	=	0xe6cf
_GPIFTCB1	=	0xe6d0
_GPIFTCB0	=	0xe6d1
_EP2GPIFFLGSEL	=	0xe6d2
_EP2GPIFPFSTOP	=	0xe6d3
_EP2GPIFTRIG	=	0xe6d4
_EP4GPIFFLGSEL	=	0xe6da
_EP4GPIFPFSTOP	=	0xe6db
_EP4GPIFTRIG	=	0xe6dc
_EP6GPIFFLGSEL	=	0xe6e2
_EP6GPIFPFSTOP	=	0xe6e3
_EP6GPIFTRIG	=	0xe6e4
_EP8GPIFFLGSEL	=	0xe6ea
_EP8GPIFPFSTOP	=	0xe6eb
_EP8GPIFTRIG	=	0xe6ec
_XGPIFSGLDATH	=	0xe6f0
_XGPIFSGLDATLX	=	0xe6f1
_XGPIFSGLDATLNOX	=	0xe6f2
_GPIFREADYCFG	=	0xe6f3
_GPIFREADYSTAT	=	0xe6f4
_GPIFABORT	=	0xe6f5
_FLOWSTATE	=	0xe6c6
_FLOWLOGIC	=	0xe6c7
_FLOWEQ0CTL	=	0xe6c8
_FLOWEQ1CTL	=	0xe6c9
_FLOWHOLDOFF	=	0xe6ca
_FLOWSTB	=	0xe6cb
_FLOWSTBEDGE	=	0xe6cc
_FLOWSTBHPERIOD	=	0xe6cd
_GPIFHOLDAMOUNT	=	0xe60c
_UDMACRCH	=	0xe67d
_UDMACRCL	=	0xe67e
_UDMACRCQUAL	=	0xe67f
_EP0BUF	=	0xe740
_EP1OUTBUF	=	0xe780
_EP1INBUF	=	0xe7c0
_EP2FIFOBUF	=	0xf000
_EP4FIFOBUF	=	0xf400
_EP6FIFOBUF	=	0xf800
_EP8FIFOBUF	=	0xfc00
_ECCCFG	=	0xe628
_ECCRESET	=	0xe629
_ECC1B0	=	0xe62a
_ECC1B1	=	0xe62b
_ECC1B2	=	0xe62c
_ECC2B0	=	0xe62d
_ECC2B1	=	0xe62e
_ECC2B2	=	0xe62f
_GPCR2	=	0xe50d
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Initialize'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	slave_fifo.c:93: static void Initialize(void)
;	-----------------------------------------
;	 function Initialize
;	-----------------------------------------
_Initialize:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	slave_fifo.c:97: CPUCS=0x12;   // 48 MHz, CLKOUT output enabled. 
	mov	dptr,#_CPUCS
	mov	a,#0x12
	movx	@dptr,a
;	slave_fifo.c:98: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:101: IFCONFIG=0xc3;  // Internal 48MHz IFCLK; IFCLK pin output enabled
	mov	dptr,#_IFCONFIG
	mov	a,#0xc3
	movx	@dptr,a
;	slave_fifo.c:103: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:105: REVCTL=0x03;  // See TRM...
	mov	dptr,#_REVCTL
	mov	a,#0x03
	movx	@dptr,a
;	slave_fifo.c:106: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:108: IOD = 0x08;	// MSEL0=1 (passive serial config); nCONFIG=0 (reset)
	mov	_IOD,#0x08
;	slave_fifo.c:109: OED = 0x0c;	// set port D bits 2 and 3 for output
	mov	_OED,#0x0c
;	slave_fifo.c:111: IOA = 0x01; // reset FPGA
	mov	_IOA,#0x01
;	slave_fifo.c:112: OEA = 0x03;	// set port A bits 0 and 1 for output
	mov	_OEA,#0x03
;	slave_fifo.c:114: PINFLAGSAB = 0x98;  // FLAGA = EP2 EF (empty flag); FLAGB = EP4 EF
	mov	dptr,#_PINFLAGSAB
	mov	a,#0x98
	movx	@dptr,a
;	slave_fifo.c:115: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:116: PINFLAGSCD = 0xfe;  // FLAGC = EP6 FF (full flag); FLAGD = EP8 FF
	mov	dptr,#_PINFLAGSCD
	mov	a,#0xfe
	movx	@dptr,a
;	slave_fifo.c:117: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:119: EP1INCFG=0x00;		// EP1 IN disabled
	mov	dptr,#_EP1INCFG
	clr	a
	movx	@dptr,a
;	slave_fifo.c:120: EP1OUTCFG=0xa0;		// EP1 OUT receives FPGA .rbf bitfile
	mov	dptr,#_EP1OUTCFG
	mov	a,#0xa0
	movx	@dptr,a
;	slave_fifo.c:121: EP2CFG=0xa2;  // 1010 0010 (bulk OUT, 512 bytes, double-buffered)
	mov	dptr,#_EP2CFG
	mov	a,#0xa2
	movx	@dptr,a
;	slave_fifo.c:122: EP4CFG=0xa0;  // 1010 0000 (bulk OUT, 512 bytes, double-buffered)
	mov	dptr,#_EP4CFG
	mov	a,#0xa0
	movx	@dptr,a
;	slave_fifo.c:123: EP6CFG=0xe2;  // 1110 0010 (bulk IN, 512 bytes, double-buffered)
	mov	dptr,#_EP6CFG
	mov	a,#0xe2
	movx	@dptr,a
;	slave_fifo.c:124: EP8CFG=0xe0;  // 1110 0010 (bulk IN, 512 bytes, double-buffered)
	mov	dptr,#_EP8CFG
	mov	a,#0xe0
	movx	@dptr,a
;	slave_fifo.c:125: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:127: FIFORESET = 0x80;  SYNCDELAY;  // NAK all requests from host. 
	mov	dptr,#_FIFORESET
	mov	a,#0x80
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:128: FIFORESET = 0x82;  SYNCDELAY;  // Reset individual EP (2,4,6,8)
	mov	dptr,#_FIFORESET
	mov	a,#0x82
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:129: FIFORESET = 0x84;  SYNCDELAY;
	mov	dptr,#_FIFORESET
	mov	a,#0x84
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:130: FIFORESET = 0x86;  SYNCDELAY;
	mov	dptr,#_FIFORESET
	mov	a,#0x86
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:131: FIFORESET = 0x88;  SYNCDELAY;
	mov	dptr,#_FIFORESET
	mov	a,#0x88
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:132: FIFORESET = 0x00;  SYNCDELAY;  // Resume normal operation. 
	mov	dptr,#_FIFORESET
	clr	a
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:136: EP2FIFOCFG = 0x00; SYNCDELAY;
	mov	dptr,#_EP2FIFOCFG
	clr	a
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:137: OUTPKTEND = 0x82;  SYNCDELAY;
	mov	dptr,#_OUTPKTEND
	mov	a,#0x82
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:138: OUTPKTEND = 0x82;  SYNCDELAY;
	mov	dptr,#_OUTPKTEND
	mov	a,#0x82
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:142: EP4FIFOCFG = 0x00; SYNCDELAY;
	mov	dptr,#_EP4FIFOCFG
	clr	a
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:143: OUTPKTEND = 0x84;  SYNCDELAY;
	mov	dptr,#_OUTPKTEND
	mov	a,#0x84
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:144: OUTPKTEND = 0x84;  SYNCDELAY;
	mov	dptr,#_OUTPKTEND
	mov	a,#0x84
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:146: EP2FIFOCFG = 0x10; SYNCDELAY; //  AUTOOUT=1; byte-wide operation
	mov	dptr,#_EP2FIFOCFG
	mov	a,#0x10
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:147: EP4FIFOCFG = 0x10; SYNCDELAY; //  AUTOOUT=1; byte-wide operation
	mov	dptr,#_EP4FIFOCFG
	mov	a,#0x10
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:148: EP6FIFOCFG = 0x0c; SYNCDELAY; //  AUTOIN=1; byte-wide operation
	mov	dptr,#_EP6FIFOCFG
	mov	a,#0x0c
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:149: EP8FIFOCFG = 0x0c; SYNCDELAY; //  AUTOIN=1; byte-wide operation
	mov	dptr,#_EP8FIFOCFG
	mov	a,#0x0c
	movx	@dptr,a
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:151: EP1OUTBC=0xff; // arm endpoint 1 for OUT (host->device) transfers
	mov	dptr,#_EP1OUTBC
	mov	a,#0xff
	movx	@dptr,a
;	slave_fifo.c:152: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:162: for (i=0; i<2000; i++) NOP;
	mov	r6,#0xd0
	mov	r7,#0x07
00105$:
	nop;	
	dec	r6
	cjne	r6,#0xff,00126$
	dec	r7
00126$:
	mov	a,r6
	orl	a,r7
	jnz	00105$
;	slave_fifo.c:164: IOD = 0x0c;	// nCONFIG=1 (configure/run)
	mov	_IOD,#0x0c
;	slave_fifo.c:168: for (i=0; i<2000; i++) NOP;
	mov	r6,#0xd0
	mov	r7,#0x07
00108$:
	nop;	
	dec	r6
	cjne	r6,#0xff,00128$
	dec	r7
00128$:
	mov	a,r6
	orl	a,r7
	jnz	00108$
;	slave_fifo.c:171: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ProcessEP1Data'
;------------------------------------------------------------
;src                       Allocated to registers 
;------------------------------------------------------------
;	slave_fifo.c:180: static void ProcessEP1Data(void)
;	-----------------------------------------
;	 function ProcessEP1Data
;	-----------------------------------------
_ProcessEP1Data:
;	slave_fifo.c:183: const unsigned char *src=EP1OUTBUF;
;	slave_fifo.c:200: IOA = src[0] & 0x03; // o sinal PA0 vira "reset" dentro da FPGA
	mov	dptr,#_EP1OUTBUF
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x03
	anl	a,r7
	mov	_IOA,a
;	slave_fifo.c:201: EP1OUTBC=0xff; // re-arm endpoint 1
	mov	dptr,#_EP1OUTBC
	mov	a,#0xff
	movx	@dptr,a
;	slave_fifo.c:202: SYNCDELAY;
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; nop; nop; nop; nop; nop; nop; nop; 
	nop; 
;	slave_fifo.c:203: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	slave_fifo.c:206: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	slave_fifo.c:208: Initialize();
	lcall	_Initialize
;	slave_fifo.c:238: while (1) 
00104$:
;	slave_fifo.c:240: if (!(EP1OUTCS & (1<<1))) 
	mov	dptr,#_EP1OUTCS
	movx	a,@dptr
	jb	acc.1,00104$
;	slave_fifo.c:242: ProcessEP1Data();
	lcall	_ProcessEP1Data
;	slave_fifo.c:246: }
	sjmp	00104$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
