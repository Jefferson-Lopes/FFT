                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module slave_fifo
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _EIPX6
                                     13 	.globl _EIPX5
                                     14 	.globl _EIPX4
                                     15 	.globl _PI2C
                                     16 	.globl _PUSB
                                     17 	.globl _EIEX6
                                     18 	.globl _EIEX5
                                     19 	.globl _EIEX4
                                     20 	.globl _EI2C
                                     21 	.globl _EUSB
                                     22 	.globl _SMOD1
                                     23 	.globl _ERESI
                                     24 	.globl _RESI
                                     25 	.globl _INT6
                                     26 	.globl _CY
                                     27 	.globl _AC
                                     28 	.globl _F0
                                     29 	.globl _RS1
                                     30 	.globl _RS0
                                     31 	.globl _OV
                                     32 	.globl _FL
                                     33 	.globl _P
                                     34 	.globl _TF2
                                     35 	.globl _EXF2
                                     36 	.globl _RCLK
                                     37 	.globl _TCLK
                                     38 	.globl _EXEN2
                                     39 	.globl _TR2
                                     40 	.globl _C_T2
                                     41 	.globl _CP_RL2
                                     42 	.globl _SM01
                                     43 	.globl _SM11
                                     44 	.globl _SM21
                                     45 	.globl _REN1
                                     46 	.globl _TB81
                                     47 	.globl _RB81
                                     48 	.globl _TI1
                                     49 	.globl _RI1
                                     50 	.globl _PS1
                                     51 	.globl _PT2
                                     52 	.globl _PS0
                                     53 	.globl _PT1
                                     54 	.globl _PX1
                                     55 	.globl _PT0
                                     56 	.globl _PX0
                                     57 	.globl _PD7
                                     58 	.globl _PD6
                                     59 	.globl _PD5
                                     60 	.globl _PD4
                                     61 	.globl _PD3
                                     62 	.globl _PD2
                                     63 	.globl _PD1
                                     64 	.globl _PD0
                                     65 	.globl _EA
                                     66 	.globl _ES1
                                     67 	.globl _ET2
                                     68 	.globl _ES0
                                     69 	.globl _ET1
                                     70 	.globl _EX1
                                     71 	.globl _ET0
                                     72 	.globl _EX0
                                     73 	.globl _PC7
                                     74 	.globl _PC6
                                     75 	.globl _PC5
                                     76 	.globl _PC4
                                     77 	.globl _PC3
                                     78 	.globl _PC2
                                     79 	.globl _PC1
                                     80 	.globl _PC0
                                     81 	.globl _SM0
                                     82 	.globl _SM1
                                     83 	.globl _SM2
                                     84 	.globl _REN
                                     85 	.globl _TB8
                                     86 	.globl _RB8
                                     87 	.globl _TI
                                     88 	.globl _RI
                                     89 	.globl _PB7
                                     90 	.globl _PB6
                                     91 	.globl _PB5
                                     92 	.globl _PB4
                                     93 	.globl _PB3
                                     94 	.globl _PB2
                                     95 	.globl _PB1
                                     96 	.globl _PB0
                                     97 	.globl _TF1
                                     98 	.globl _TR1
                                     99 	.globl _TF0
                                    100 	.globl _TR0
                                    101 	.globl _IE1
                                    102 	.globl _IT1
                                    103 	.globl _IE0
                                    104 	.globl _IT0
                                    105 	.globl _PA7
                                    106 	.globl _PA6
                                    107 	.globl _PA5
                                    108 	.globl _PA4
                                    109 	.globl _PA3
                                    110 	.globl _PA2
                                    111 	.globl _PA1
                                    112 	.globl _PA0
                                    113 	.globl _EIP
                                    114 	.globl _B
                                    115 	.globl _EIE
                                    116 	.globl _ACC
                                    117 	.globl _EICON
                                    118 	.globl _PSW
                                    119 	.globl _TH2
                                    120 	.globl _TL2
                                    121 	.globl _RCAP2H
                                    122 	.globl _RCAP2L
                                    123 	.globl _T2CON
                                    124 	.globl _SBUF1
                                    125 	.globl _SCON1
                                    126 	.globl _GPIFSGLDATLNOX
                                    127 	.globl _GPIFSGLDATLX
                                    128 	.globl _GPIFSGLDATH
                                    129 	.globl _GPIFTRIG
                                    130 	.globl _EP01STAT
                                    131 	.globl _IP
                                    132 	.globl _OEE
                                    133 	.globl _OED
                                    134 	.globl _OEC
                                    135 	.globl _OEB
                                    136 	.globl _OEA
                                    137 	.globl _IOE
                                    138 	.globl _IOD
                                    139 	.globl _AUTOPTRSETUP
                                    140 	.globl _EP68FIFOFLGS
                                    141 	.globl _EP24FIFOFLGS
                                    142 	.globl _EP2468STAT
                                    143 	.globl _IE
                                    144 	.globl _INT4CLR
                                    145 	.globl _INT2CLR
                                    146 	.globl _IOC
                                    147 	.globl _AUTOPTRL2
                                    148 	.globl _AUTOPTRH2
                                    149 	.globl _AUTOPTRL1
                                    150 	.globl _AUTOPTRH1
                                    151 	.globl _SBUF0
                                    152 	.globl _SCON0
                                    153 	.globl __XPAGE
                                    154 	.globl _EXIF
                                    155 	.globl _IOB
                                    156 	.globl _CKCON
                                    157 	.globl _TH1
                                    158 	.globl _TH0
                                    159 	.globl _TL1
                                    160 	.globl _TL0
                                    161 	.globl _TMOD
                                    162 	.globl _TCON
                                    163 	.globl _PCON
                                    164 	.globl _DPS
                                    165 	.globl _DPH1
                                    166 	.globl _DPL1
                                    167 	.globl _DPH
                                    168 	.globl _DPL
                                    169 	.globl _SP
                                    170 	.globl _IOA
                                    171 	.globl _GPCR2
                                    172 	.globl _ECC2B2
                                    173 	.globl _ECC2B1
                                    174 	.globl _ECC2B0
                                    175 	.globl _ECC1B2
                                    176 	.globl _ECC1B1
                                    177 	.globl _ECC1B0
                                    178 	.globl _ECCRESET
                                    179 	.globl _ECCCFG
                                    180 	.globl _EP8FIFOBUF
                                    181 	.globl _EP6FIFOBUF
                                    182 	.globl _EP4FIFOBUF
                                    183 	.globl _EP2FIFOBUF
                                    184 	.globl _EP1INBUF
                                    185 	.globl _EP1OUTBUF
                                    186 	.globl _EP0BUF
                                    187 	.globl _UDMACRCQUAL
                                    188 	.globl _UDMACRCL
                                    189 	.globl _UDMACRCH
                                    190 	.globl _GPIFHOLDAMOUNT
                                    191 	.globl _FLOWSTBHPERIOD
                                    192 	.globl _FLOWSTBEDGE
                                    193 	.globl _FLOWSTB
                                    194 	.globl _FLOWHOLDOFF
                                    195 	.globl _FLOWEQ1CTL
                                    196 	.globl _FLOWEQ0CTL
                                    197 	.globl _FLOWLOGIC
                                    198 	.globl _FLOWSTATE
                                    199 	.globl _GPIFABORT
                                    200 	.globl _GPIFREADYSTAT
                                    201 	.globl _GPIFREADYCFG
                                    202 	.globl _XGPIFSGLDATLNOX
                                    203 	.globl _XGPIFSGLDATLX
                                    204 	.globl _XGPIFSGLDATH
                                    205 	.globl _EP8GPIFTRIG
                                    206 	.globl _EP8GPIFPFSTOP
                                    207 	.globl _EP8GPIFFLGSEL
                                    208 	.globl _EP6GPIFTRIG
                                    209 	.globl _EP6GPIFPFSTOP
                                    210 	.globl _EP6GPIFFLGSEL
                                    211 	.globl _EP4GPIFTRIG
                                    212 	.globl _EP4GPIFPFSTOP
                                    213 	.globl _EP4GPIFFLGSEL
                                    214 	.globl _EP2GPIFTRIG
                                    215 	.globl _EP2GPIFPFSTOP
                                    216 	.globl _EP2GPIFFLGSEL
                                    217 	.globl _GPIFTCB0
                                    218 	.globl _GPIFTCB1
                                    219 	.globl _GPIFTCB2
                                    220 	.globl _GPIFTCB3
                                    221 	.globl _GPIFADRL
                                    222 	.globl _GPIFADRH
                                    223 	.globl _GPIFCTLCFG
                                    224 	.globl _GPIFIDLECTL
                                    225 	.globl _GPIFIDLECS
                                    226 	.globl _GPIFWFSELECT
                                    227 	.globl _SETUPDAT
                                    228 	.globl _SUDPTRCTL
                                    229 	.globl _SUDPTRL
                                    230 	.globl _SUDPTRH
                                    231 	.globl _EP8FIFOBCL
                                    232 	.globl _EP8FIFOBCH
                                    233 	.globl _EP6FIFOBCL
                                    234 	.globl _EP6FIFOBCH
                                    235 	.globl _EP4FIFOBCL
                                    236 	.globl _EP4FIFOBCH
                                    237 	.globl _EP2FIFOBCL
                                    238 	.globl _EP2FIFOBCH
                                    239 	.globl _EP8FIFOFLGS
                                    240 	.globl _EP6FIFOFLGS
                                    241 	.globl _EP4FIFOFLGS
                                    242 	.globl _EP2FIFOFLGS
                                    243 	.globl _EP8CS
                                    244 	.globl _EP6CS
                                    245 	.globl _EP4CS
                                    246 	.globl _EP2CS
                                    247 	.globl _EP1INCS
                                    248 	.globl _EP1OUTCS
                                    249 	.globl _EP0CS
                                    250 	.globl _EP8BCL
                                    251 	.globl _EP8BCH
                                    252 	.globl _EP6BCL
                                    253 	.globl _EP6BCH
                                    254 	.globl _EP4BCL
                                    255 	.globl _EP4BCH
                                    256 	.globl _EP2BCL
                                    257 	.globl _EP2BCH
                                    258 	.globl _EP1INBC
                                    259 	.globl _EP1OUTBC
                                    260 	.globl _EP0BCL
                                    261 	.globl _EP0BCH
                                    262 	.globl _FNADDR
                                    263 	.globl _MICROFRAME
                                    264 	.globl _USBFRAMEL
                                    265 	.globl _USBFRAMEH
                                    266 	.globl _TOGCTL
                                    267 	.globl _WAKEUPCS
                                    268 	.globl _SUSPEND
                                    269 	.globl _USBCS
                                    270 	.globl _XAUTODAT2
                                    271 	.globl _XAUTODAT1
                                    272 	.globl _I2CTL
                                    273 	.globl _I2DAT
                                    274 	.globl _I2CS
                                    275 	.globl _PORTECFG
                                    276 	.globl _PORTCCFG
                                    277 	.globl _PORTACFG
                                    278 	.globl _INTSETUP
                                    279 	.globl _INT4IVEC
                                    280 	.globl _INT2IVEC
                                    281 	.globl _CLRERRCNT
                                    282 	.globl _ERRCNTLIM
                                    283 	.globl _USBERRIRQ
                                    284 	.globl _USBERRIE
                                    285 	.globl _GPIFIRQ
                                    286 	.globl _GPIFIE
                                    287 	.globl _EPIRQ
                                    288 	.globl _EPIE
                                    289 	.globl _USBIRQ
                                    290 	.globl _USBIE
                                    291 	.globl _NAKIRQ
                                    292 	.globl _NAKIE
                                    293 	.globl _IBNIRQ
                                    294 	.globl _IBNIE
                                    295 	.globl _EP8FIFOIRQ
                                    296 	.globl _EP8FIFOIE
                                    297 	.globl _EP6FIFOIRQ
                                    298 	.globl _EP6FIFOIE
                                    299 	.globl _EP4FIFOIRQ
                                    300 	.globl _EP4FIFOIE
                                    301 	.globl _EP2FIFOIRQ
                                    302 	.globl _EP2FIFOIE
                                    303 	.globl _OUTPKTEND
                                    304 	.globl _INPKTEND
                                    305 	.globl _EP8ISOINPKTS
                                    306 	.globl _EP6ISOINPKTS
                                    307 	.globl _EP4ISOINPKTS
                                    308 	.globl _EP2ISOINPKTS
                                    309 	.globl _EP8FIFOPFL
                                    310 	.globl _EP8FIFOPFH
                                    311 	.globl _EP6FIFOPFL
                                    312 	.globl _EP6FIFOPFH
                                    313 	.globl _EP4FIFOPFL
                                    314 	.globl _EP4FIFOPFH
                                    315 	.globl _EP2FIFOPFL
                                    316 	.globl _EP2FIFOPFH
                                    317 	.globl _EP8AUTOINLENL
                                    318 	.globl _EP8AUTOINLENH
                                    319 	.globl _EP6AUTOINLENL
                                    320 	.globl _EP6AUTOINLENH
                                    321 	.globl _EP4AUTOINLENL
                                    322 	.globl _EP4AUTOINLENH
                                    323 	.globl _EP2AUTOINLENL
                                    324 	.globl _EP2AUTOINLENH
                                    325 	.globl _EP8FIFOCFG
                                    326 	.globl _EP6FIFOCFG
                                    327 	.globl _EP4FIFOCFG
                                    328 	.globl _EP2FIFOCFG
                                    329 	.globl _EP8CFG
                                    330 	.globl _EP6CFG
                                    331 	.globl _EP4CFG
                                    332 	.globl _EP2CFG
                                    333 	.globl _EP1INCFG
                                    334 	.globl _EP1OUTCFG
                                    335 	.globl _REVCTL
                                    336 	.globl _REVID
                                    337 	.globl _FIFOPINPOLAR
                                    338 	.globl _UART230
                                    339 	.globl _BPADDRL
                                    340 	.globl _BPADDRH
                                    341 	.globl _BREAKPT
                                    342 	.globl _FIFORESET
                                    343 	.globl _PINFLAGSCD
                                    344 	.globl _PINFLAGSAB
                                    345 	.globl _IFCONFIG
                                    346 	.globl _CPUCS
                                    347 	.globl _RES_WAVEDATA_END
                                    348 	.globl _GPIF_WAVE_DATA
                                    349 ;--------------------------------------------------------
                                    350 ; special function registers
                                    351 ;--------------------------------------------------------
                                    352 	.area RSEG    (ABS,DATA)
      000000                        353 	.org 0x0000
                           000080   354 _IOA	=	0x0080
                           000081   355 _SP	=	0x0081
                           000082   356 _DPL	=	0x0082
                           000083   357 _DPH	=	0x0083
                           000084   358 _DPL1	=	0x0084
                           000085   359 _DPH1	=	0x0085
                           000086   360 _DPS	=	0x0086
                           000087   361 _PCON	=	0x0087
                           000088   362 _TCON	=	0x0088
                           000089   363 _TMOD	=	0x0089
                           00008A   364 _TL0	=	0x008a
                           00008B   365 _TL1	=	0x008b
                           00008C   366 _TH0	=	0x008c
                           00008D   367 _TH1	=	0x008d
                           00008E   368 _CKCON	=	0x008e
                           000090   369 _IOB	=	0x0090
                           000091   370 _EXIF	=	0x0091
                           000092   371 __XPAGE	=	0x0092
                           000098   372 _SCON0	=	0x0098
                           000099   373 _SBUF0	=	0x0099
                           00009A   374 _AUTOPTRH1	=	0x009a
                           00009B   375 _AUTOPTRL1	=	0x009b
                           00009D   376 _AUTOPTRH2	=	0x009d
                           00009E   377 _AUTOPTRL2	=	0x009e
                           0000A0   378 _IOC	=	0x00a0
                           0000A1   379 _INT2CLR	=	0x00a1
                           0000A2   380 _INT4CLR	=	0x00a2
                           0000A8   381 _IE	=	0x00a8
                           0000AA   382 _EP2468STAT	=	0x00aa
                           0000AB   383 _EP24FIFOFLGS	=	0x00ab
                           0000AC   384 _EP68FIFOFLGS	=	0x00ac
                           0000AF   385 _AUTOPTRSETUP	=	0x00af
                           0000B0   386 _IOD	=	0x00b0
                           0000B1   387 _IOE	=	0x00b1
                           0000B2   388 _OEA	=	0x00b2
                           0000B3   389 _OEB	=	0x00b3
                           0000B4   390 _OEC	=	0x00b4
                           0000B5   391 _OED	=	0x00b5
                           0000B6   392 _OEE	=	0x00b6
                           0000B8   393 _IP	=	0x00b8
                           0000BA   394 _EP01STAT	=	0x00ba
                           0000BB   395 _GPIFTRIG	=	0x00bb
                           0000BD   396 _GPIFSGLDATH	=	0x00bd
                           0000BE   397 _GPIFSGLDATLX	=	0x00be
                           0000BF   398 _GPIFSGLDATLNOX	=	0x00bf
                           0000C0   399 _SCON1	=	0x00c0
                           0000C1   400 _SBUF1	=	0x00c1
                           0000C8   401 _T2CON	=	0x00c8
                           0000CA   402 _RCAP2L	=	0x00ca
                           0000CB   403 _RCAP2H	=	0x00cb
                           0000CC   404 _TL2	=	0x00cc
                           0000CD   405 _TH2	=	0x00cd
                           0000D0   406 _PSW	=	0x00d0
                           0000D8   407 _EICON	=	0x00d8
                           0000E0   408 _ACC	=	0x00e0
                           0000E8   409 _EIE	=	0x00e8
                           0000F0   410 _B	=	0x00f0
                           0000F8   411 _EIP	=	0x00f8
                                    412 ;--------------------------------------------------------
                                    413 ; special function bits
                                    414 ;--------------------------------------------------------
                                    415 	.area RSEG    (ABS,DATA)
      000000                        416 	.org 0x0000
                           000080   417 _PA0	=	0x0080
                           000081   418 _PA1	=	0x0081
                           000082   419 _PA2	=	0x0082
                           000083   420 _PA3	=	0x0083
                           000084   421 _PA4	=	0x0084
                           000085   422 _PA5	=	0x0085
                           000086   423 _PA6	=	0x0086
                           000087   424 _PA7	=	0x0087
                           000088   425 _IT0	=	0x0088
                           000089   426 _IE0	=	0x0089
                           00008A   427 _IT1	=	0x008a
                           00008B   428 _IE1	=	0x008b
                           00008C   429 _TR0	=	0x008c
                           00008D   430 _TF0	=	0x008d
                           00008E   431 _TR1	=	0x008e
                           00008F   432 _TF1	=	0x008f
                           000090   433 _PB0	=	0x0090
                           000091   434 _PB1	=	0x0091
                           000092   435 _PB2	=	0x0092
                           000093   436 _PB3	=	0x0093
                           000094   437 _PB4	=	0x0094
                           000095   438 _PB5	=	0x0095
                           000096   439 _PB6	=	0x0096
                           000097   440 _PB7	=	0x0097
                           000098   441 _RI	=	0x0098
                           000099   442 _TI	=	0x0099
                           00009A   443 _RB8	=	0x009a
                           00009B   444 _TB8	=	0x009b
                           00009C   445 _REN	=	0x009c
                           00009D   446 _SM2	=	0x009d
                           00009E   447 _SM1	=	0x009e
                           00009F   448 _SM0	=	0x009f
                           0000A0   449 _PC0	=	0x00a0
                           0000A1   450 _PC1	=	0x00a1
                           0000A2   451 _PC2	=	0x00a2
                           0000A3   452 _PC3	=	0x00a3
                           0000A4   453 _PC4	=	0x00a4
                           0000A5   454 _PC5	=	0x00a5
                           0000A6   455 _PC6	=	0x00a6
                           0000A7   456 _PC7	=	0x00a7
                           0000A8   457 _EX0	=	0x00a8
                           0000A9   458 _ET0	=	0x00a9
                           0000AA   459 _EX1	=	0x00aa
                           0000AB   460 _ET1	=	0x00ab
                           0000AC   461 _ES0	=	0x00ac
                           0000AD   462 _ET2	=	0x00ad
                           0000AE   463 _ES1	=	0x00ae
                           0000AF   464 _EA	=	0x00af
                           0000B0   465 _PD0	=	0x00b0
                           0000B1   466 _PD1	=	0x00b1
                           0000B2   467 _PD2	=	0x00b2
                           0000B3   468 _PD3	=	0x00b3
                           0000B4   469 _PD4	=	0x00b4
                           0000B5   470 _PD5	=	0x00b5
                           0000B6   471 _PD6	=	0x00b6
                           0000B7   472 _PD7	=	0x00b7
                           0000B8   473 _PX0	=	0x00b8
                           0000B9   474 _PT0	=	0x00b9
                           0000BA   475 _PX1	=	0x00ba
                           0000BB   476 _PT1	=	0x00bb
                           0000BC   477 _PS0	=	0x00bc
                           0000BD   478 _PT2	=	0x00bd
                           0000BE   479 _PS1	=	0x00be
                           0000C0   480 _RI1	=	0x00c0
                           0000C1   481 _TI1	=	0x00c1
                           0000C2   482 _RB81	=	0x00c2
                           0000C3   483 _TB81	=	0x00c3
                           0000C4   484 _REN1	=	0x00c4
                           0000C5   485 _SM21	=	0x00c5
                           0000C6   486 _SM11	=	0x00c6
                           0000C7   487 _SM01	=	0x00c7
                           0000C8   488 _CP_RL2	=	0x00c8
                           0000C9   489 _C_T2	=	0x00c9
                           0000CA   490 _TR2	=	0x00ca
                           0000CB   491 _EXEN2	=	0x00cb
                           0000CC   492 _TCLK	=	0x00cc
                           0000CD   493 _RCLK	=	0x00cd
                           0000CE   494 _EXF2	=	0x00ce
                           0000CF   495 _TF2	=	0x00cf
                           0000D0   496 _P	=	0x00d0
                           0000D1   497 _FL	=	0x00d1
                           0000D2   498 _OV	=	0x00d2
                           0000D3   499 _RS0	=	0x00d3
                           0000D4   500 _RS1	=	0x00d4
                           0000D5   501 _F0	=	0x00d5
                           0000D6   502 _AC	=	0x00d6
                           0000D7   503 _CY	=	0x00d7
                           0000DB   504 _INT6	=	0x00db
                           0000DC   505 _RESI	=	0x00dc
                           0000DD   506 _ERESI	=	0x00dd
                           0000DF   507 _SMOD1	=	0x00df
                           0000E8   508 _EUSB	=	0x00e8
                           0000E9   509 _EI2C	=	0x00e9
                           0000EA   510 _EIEX4	=	0x00ea
                           0000EB   511 _EIEX5	=	0x00eb
                           0000EC   512 _EIEX6	=	0x00ec
                           0000F8   513 _PUSB	=	0x00f8
                           0000F9   514 _PI2C	=	0x00f9
                           0000FA   515 _EIPX4	=	0x00fa
                           0000FB   516 _EIPX5	=	0x00fb
                           0000FC   517 _EIPX6	=	0x00fc
                                    518 ;--------------------------------------------------------
                                    519 ; overlayable register banks
                                    520 ;--------------------------------------------------------
                                    521 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        522 	.ds 8
                                    523 ;--------------------------------------------------------
                                    524 ; internal ram data
                                    525 ;--------------------------------------------------------
                                    526 	.area DSEG    (DATA)
                                    527 ;--------------------------------------------------------
                                    528 ; overlayable items in internal ram 
                                    529 ;--------------------------------------------------------
                                    530 	.area	OSEG    (OVR,DATA)
                                    531 	.area	OSEG    (OVR,DATA)
                                    532 ;--------------------------------------------------------
                                    533 ; Stack segment in internal ram 
                                    534 ;--------------------------------------------------------
                                    535 	.area	SSEG
      000008                        536 __start__stack:
      000008                        537 	.ds	1
                                    538 
                                    539 ;--------------------------------------------------------
                                    540 ; indirectly addressable internal ram data
                                    541 ;--------------------------------------------------------
                                    542 	.area ISEG    (DATA)
                                    543 ;--------------------------------------------------------
                                    544 ; absolute internal ram data
                                    545 ;--------------------------------------------------------
                                    546 	.area IABS    (ABS,DATA)
                                    547 	.area IABS    (ABS,DATA)
                                    548 ;--------------------------------------------------------
                                    549 ; bit data
                                    550 ;--------------------------------------------------------
                                    551 	.area BSEG    (BIT)
                                    552 ;--------------------------------------------------------
                                    553 ; paged external ram data
                                    554 ;--------------------------------------------------------
                                    555 	.area PSEG    (PAG,XDATA)
                                    556 ;--------------------------------------------------------
                                    557 ; external ram data
                                    558 ;--------------------------------------------------------
                                    559 	.area XSEG    (XDATA)
                           00E400   560 _GPIF_WAVE_DATA	=	0xe400
                           00E480   561 _RES_WAVEDATA_END	=	0xe480
                           00E600   562 _CPUCS	=	0xe600
                           00E601   563 _IFCONFIG	=	0xe601
                           00E602   564 _PINFLAGSAB	=	0xe602
                           00E603   565 _PINFLAGSCD	=	0xe603
                           00E604   566 _FIFORESET	=	0xe604
                           00E605   567 _BREAKPT	=	0xe605
                           00E606   568 _BPADDRH	=	0xe606
                           00E607   569 _BPADDRL	=	0xe607
                           00E608   570 _UART230	=	0xe608
                           00E609   571 _FIFOPINPOLAR	=	0xe609
                           00E60A   572 _REVID	=	0xe60a
                           00E60B   573 _REVCTL	=	0xe60b
                           00E610   574 _EP1OUTCFG	=	0xe610
                           00E611   575 _EP1INCFG	=	0xe611
                           00E612   576 _EP2CFG	=	0xe612
                           00E613   577 _EP4CFG	=	0xe613
                           00E614   578 _EP6CFG	=	0xe614
                           00E615   579 _EP8CFG	=	0xe615
                           00E618   580 _EP2FIFOCFG	=	0xe618
                           00E619   581 _EP4FIFOCFG	=	0xe619
                           00E61A   582 _EP6FIFOCFG	=	0xe61a
                           00E61B   583 _EP8FIFOCFG	=	0xe61b
                           00E620   584 _EP2AUTOINLENH	=	0xe620
                           00E621   585 _EP2AUTOINLENL	=	0xe621
                           00E622   586 _EP4AUTOINLENH	=	0xe622
                           00E623   587 _EP4AUTOINLENL	=	0xe623
                           00E624   588 _EP6AUTOINLENH	=	0xe624
                           00E625   589 _EP6AUTOINLENL	=	0xe625
                           00E626   590 _EP8AUTOINLENH	=	0xe626
                           00E627   591 _EP8AUTOINLENL	=	0xe627
                           00E630   592 _EP2FIFOPFH	=	0xe630
                           00E631   593 _EP2FIFOPFL	=	0xe631
                           00E632   594 _EP4FIFOPFH	=	0xe632
                           00E633   595 _EP4FIFOPFL	=	0xe633
                           00E634   596 _EP6FIFOPFH	=	0xe634
                           00E635   597 _EP6FIFOPFL	=	0xe635
                           00E636   598 _EP8FIFOPFH	=	0xe636
                           00E637   599 _EP8FIFOPFL	=	0xe637
                           00E640   600 _EP2ISOINPKTS	=	0xe640
                           00E641   601 _EP4ISOINPKTS	=	0xe641
                           00E642   602 _EP6ISOINPKTS	=	0xe642
                           00E643   603 _EP8ISOINPKTS	=	0xe643
                           00E648   604 _INPKTEND	=	0xe648
                           00E649   605 _OUTPKTEND	=	0xe649
                           00E650   606 _EP2FIFOIE	=	0xe650
                           00E651   607 _EP2FIFOIRQ	=	0xe651
                           00E652   608 _EP4FIFOIE	=	0xe652
                           00E653   609 _EP4FIFOIRQ	=	0xe653
                           00E654   610 _EP6FIFOIE	=	0xe654
                           00E655   611 _EP6FIFOIRQ	=	0xe655
                           00E656   612 _EP8FIFOIE	=	0xe656
                           00E657   613 _EP8FIFOIRQ	=	0xe657
                           00E658   614 _IBNIE	=	0xe658
                           00E659   615 _IBNIRQ	=	0xe659
                           00E65A   616 _NAKIE	=	0xe65a
                           00E65B   617 _NAKIRQ	=	0xe65b
                           00E65C   618 _USBIE	=	0xe65c
                           00E65D   619 _USBIRQ	=	0xe65d
                           00E65E   620 _EPIE	=	0xe65e
                           00E65F   621 _EPIRQ	=	0xe65f
                           00E660   622 _GPIFIE	=	0xe660
                           00E661   623 _GPIFIRQ	=	0xe661
                           00E662   624 _USBERRIE	=	0xe662
                           00E663   625 _USBERRIRQ	=	0xe663
                           00E664   626 _ERRCNTLIM	=	0xe664
                           00E665   627 _CLRERRCNT	=	0xe665
                           00E666   628 _INT2IVEC	=	0xe666
                           00E667   629 _INT4IVEC	=	0xe667
                           00E668   630 _INTSETUP	=	0xe668
                           00E670   631 _PORTACFG	=	0xe670
                           00E671   632 _PORTCCFG	=	0xe671
                           00E672   633 _PORTECFG	=	0xe672
                           00E678   634 _I2CS	=	0xe678
                           00E679   635 _I2DAT	=	0xe679
                           00E67A   636 _I2CTL	=	0xe67a
                           00E67B   637 _XAUTODAT1	=	0xe67b
                           00E67C   638 _XAUTODAT2	=	0xe67c
                           00E680   639 _USBCS	=	0xe680
                           00E681   640 _SUSPEND	=	0xe681
                           00E682   641 _WAKEUPCS	=	0xe682
                           00E683   642 _TOGCTL	=	0xe683
                           00E684   643 _USBFRAMEH	=	0xe684
                           00E685   644 _USBFRAMEL	=	0xe685
                           00E686   645 _MICROFRAME	=	0xe686
                           00E687   646 _FNADDR	=	0xe687
                           00E68A   647 _EP0BCH	=	0xe68a
                           00E68B   648 _EP0BCL	=	0xe68b
                           00E68D   649 _EP1OUTBC	=	0xe68d
                           00E68F   650 _EP1INBC	=	0xe68f
                           00E690   651 _EP2BCH	=	0xe690
                           00E691   652 _EP2BCL	=	0xe691
                           00E694   653 _EP4BCH	=	0xe694
                           00E695   654 _EP4BCL	=	0xe695
                           00E698   655 _EP6BCH	=	0xe698
                           00E699   656 _EP6BCL	=	0xe699
                           00E69C   657 _EP8BCH	=	0xe69c
                           00E69D   658 _EP8BCL	=	0xe69d
                           00E6A0   659 _EP0CS	=	0xe6a0
                           00E6A1   660 _EP1OUTCS	=	0xe6a1
                           00E6A2   661 _EP1INCS	=	0xe6a2
                           00E6A3   662 _EP2CS	=	0xe6a3
                           00E6A4   663 _EP4CS	=	0xe6a4
                           00E6A5   664 _EP6CS	=	0xe6a5
                           00E6A6   665 _EP8CS	=	0xe6a6
                           00E6A7   666 _EP2FIFOFLGS	=	0xe6a7
                           00E6A8   667 _EP4FIFOFLGS	=	0xe6a8
                           00E6A9   668 _EP6FIFOFLGS	=	0xe6a9
                           00E6AA   669 _EP8FIFOFLGS	=	0xe6aa
                           00E6AB   670 _EP2FIFOBCH	=	0xe6ab
                           00E6AC   671 _EP2FIFOBCL	=	0xe6ac
                           00E6AD   672 _EP4FIFOBCH	=	0xe6ad
                           00E6AE   673 _EP4FIFOBCL	=	0xe6ae
                           00E6AF   674 _EP6FIFOBCH	=	0xe6af
                           00E6B0   675 _EP6FIFOBCL	=	0xe6b0
                           00E6B1   676 _EP8FIFOBCH	=	0xe6b1
                           00E6B2   677 _EP8FIFOBCL	=	0xe6b2
                           00E6B3   678 _SUDPTRH	=	0xe6b3
                           00E6B4   679 _SUDPTRL	=	0xe6b4
                           00E6B5   680 _SUDPTRCTL	=	0xe6b5
                           00E6B8   681 _SETUPDAT	=	0xe6b8
                           00E6C0   682 _GPIFWFSELECT	=	0xe6c0
                           00E6C1   683 _GPIFIDLECS	=	0xe6c1
                           00E6C2   684 _GPIFIDLECTL	=	0xe6c2
                           00E6C3   685 _GPIFCTLCFG	=	0xe6c3
                           00E6C4   686 _GPIFADRH	=	0xe6c4
                           00E6C5   687 _GPIFADRL	=	0xe6c5
                           00E6CE   688 _GPIFTCB3	=	0xe6ce
                           00E6CF   689 _GPIFTCB2	=	0xe6cf
                           00E6D0   690 _GPIFTCB1	=	0xe6d0
                           00E6D1   691 _GPIFTCB0	=	0xe6d1
                           00E6D2   692 _EP2GPIFFLGSEL	=	0xe6d2
                           00E6D3   693 _EP2GPIFPFSTOP	=	0xe6d3
                           00E6D4   694 _EP2GPIFTRIG	=	0xe6d4
                           00E6DA   695 _EP4GPIFFLGSEL	=	0xe6da
                           00E6DB   696 _EP4GPIFPFSTOP	=	0xe6db
                           00E6DC   697 _EP4GPIFTRIG	=	0xe6dc
                           00E6E2   698 _EP6GPIFFLGSEL	=	0xe6e2
                           00E6E3   699 _EP6GPIFPFSTOP	=	0xe6e3
                           00E6E4   700 _EP6GPIFTRIG	=	0xe6e4
                           00E6EA   701 _EP8GPIFFLGSEL	=	0xe6ea
                           00E6EB   702 _EP8GPIFPFSTOP	=	0xe6eb
                           00E6EC   703 _EP8GPIFTRIG	=	0xe6ec
                           00E6F0   704 _XGPIFSGLDATH	=	0xe6f0
                           00E6F1   705 _XGPIFSGLDATLX	=	0xe6f1
                           00E6F2   706 _XGPIFSGLDATLNOX	=	0xe6f2
                           00E6F3   707 _GPIFREADYCFG	=	0xe6f3
                           00E6F4   708 _GPIFREADYSTAT	=	0xe6f4
                           00E6F5   709 _GPIFABORT	=	0xe6f5
                           00E6C6   710 _FLOWSTATE	=	0xe6c6
                           00E6C7   711 _FLOWLOGIC	=	0xe6c7
                           00E6C8   712 _FLOWEQ0CTL	=	0xe6c8
                           00E6C9   713 _FLOWEQ1CTL	=	0xe6c9
                           00E6CA   714 _FLOWHOLDOFF	=	0xe6ca
                           00E6CB   715 _FLOWSTB	=	0xe6cb
                           00E6CC   716 _FLOWSTBEDGE	=	0xe6cc
                           00E6CD   717 _FLOWSTBHPERIOD	=	0xe6cd
                           00E60C   718 _GPIFHOLDAMOUNT	=	0xe60c
                           00E67D   719 _UDMACRCH	=	0xe67d
                           00E67E   720 _UDMACRCL	=	0xe67e
                           00E67F   721 _UDMACRCQUAL	=	0xe67f
                           00E740   722 _EP0BUF	=	0xe740
                           00E780   723 _EP1OUTBUF	=	0xe780
                           00E7C0   724 _EP1INBUF	=	0xe7c0
                           00F000   725 _EP2FIFOBUF	=	0xf000
                           00F400   726 _EP4FIFOBUF	=	0xf400
                           00F800   727 _EP6FIFOBUF	=	0xf800
                           00FC00   728 _EP8FIFOBUF	=	0xfc00
                           00E628   729 _ECCCFG	=	0xe628
                           00E629   730 _ECCRESET	=	0xe629
                           00E62A   731 _ECC1B0	=	0xe62a
                           00E62B   732 _ECC1B1	=	0xe62b
                           00E62C   733 _ECC1B2	=	0xe62c
                           00E62D   734 _ECC2B0	=	0xe62d
                           00E62E   735 _ECC2B1	=	0xe62e
                           00E62F   736 _ECC2B2	=	0xe62f
                           00E50D   737 _GPCR2	=	0xe50d
                                    738 ;--------------------------------------------------------
                                    739 ; absolute external ram data
                                    740 ;--------------------------------------------------------
                                    741 	.area XABS    (ABS,XDATA)
                                    742 ;--------------------------------------------------------
                                    743 ; external initialized ram data
                                    744 ;--------------------------------------------------------
                                    745 	.area XISEG   (XDATA)
                                    746 	.area HOME    (CODE)
                                    747 	.area GSINIT0 (CODE)
                                    748 	.area GSINIT1 (CODE)
                                    749 	.area GSINIT2 (CODE)
                                    750 	.area GSINIT3 (CODE)
                                    751 	.area GSINIT4 (CODE)
                                    752 	.area GSINIT5 (CODE)
                                    753 	.area GSINIT  (CODE)
                                    754 	.area GSFINAL (CODE)
                                    755 	.area CSEG    (CODE)
                                    756 ;--------------------------------------------------------
                                    757 ; interrupt vector 
                                    758 ;--------------------------------------------------------
                                    759 	.area HOME    (CODE)
      000000                        760 __interrupt_vect:
      000000 02 00 06         [24]  761 	ljmp	__sdcc_gsinit_startup
                                    762 ;--------------------------------------------------------
                                    763 ; global & static initialisations
                                    764 ;--------------------------------------------------------
                                    765 	.area HOME    (CODE)
                                    766 	.area GSINIT  (CODE)
                                    767 	.area GSFINAL (CODE)
                                    768 	.area GSINIT  (CODE)
                                    769 	.globl __sdcc_gsinit_startup
                                    770 	.globl __sdcc_program_startup
                                    771 	.globl __start__stack
                                    772 	.globl __mcs51_genXINIT
                                    773 	.globl __mcs51_genXRAMCLEAR
                                    774 	.globl __mcs51_genRAMCLEAR
                                    775 	.area GSFINAL (CODE)
      00005F 02 00 03         [24]  776 	ljmp	__sdcc_program_startup
                                    777 ;--------------------------------------------------------
                                    778 ; Home
                                    779 ;--------------------------------------------------------
                                    780 	.area HOME    (CODE)
                                    781 	.area HOME    (CODE)
      000003                        782 __sdcc_program_startup:
      000003 02 01 8B         [24]  783 	ljmp	_main
                                    784 ;	return from main will return to caller
                                    785 ;--------------------------------------------------------
                                    786 ; code
                                    787 ;--------------------------------------------------------
                                    788 	.area CSEG    (CODE)
                                    789 ;------------------------------------------------------------
                                    790 ;Allocation info for local variables in function 'Initialize'
                                    791 ;------------------------------------------------------------
                                    792 ;i                         Allocated to registers r6 r7 
                                    793 ;------------------------------------------------------------
                                    794 ;	slave_fifo.c:93: static void Initialize(void)
                                    795 ;	-----------------------------------------
                                    796 ;	 function Initialize
                                    797 ;	-----------------------------------------
      000062                        798 _Initialize:
                           000007   799 	ar7 = 0x07
                           000006   800 	ar6 = 0x06
                           000005   801 	ar5 = 0x05
                           000004   802 	ar4 = 0x04
                           000003   803 	ar3 = 0x03
                           000002   804 	ar2 = 0x02
                           000001   805 	ar1 = 0x01
                           000000   806 	ar0 = 0x00
                                    807 ;	slave_fifo.c:97: CPUCS=0x12;   // 48 MHz, CLKOUT output enabled. 
      000062 90 E6 00         [24]  808 	mov	dptr,#_CPUCS
      000065 74 12            [12]  809 	mov	a,#0x12
      000067 F0               [24]  810 	movx	@dptr,a
                                    811 ;	slave_fifo.c:98: SYNCDELAY;
      000068 00               [12]  812 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000069 00               [12]  813 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00006A 00               [12]  814 	nop; 
                                    815 ;	slave_fifo.c:101: IFCONFIG=0xc3;  // Internal 48MHz IFCLK; IFCLK pin output enabled
      00006B 90 E6 01         [24]  816 	mov	dptr,#_IFCONFIG
      00006E 74 C3            [12]  817 	mov	a,#0xc3
      000070 F0               [24]  818 	movx	@dptr,a
                                    819 ;	slave_fifo.c:103: SYNCDELAY;
      000071 00               [12]  820 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000072 00               [12]  821 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000073 00               [12]  822 	nop; 
                                    823 ;	slave_fifo.c:105: REVCTL=0x03;  // See TRM...
      000074 90 E6 0B         [24]  824 	mov	dptr,#_REVCTL
      000077 74 03            [12]  825 	mov	a,#0x03
      000079 F0               [24]  826 	movx	@dptr,a
                                    827 ;	slave_fifo.c:106: SYNCDELAY;
      00007A 00               [12]  828 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00007B 00               [12]  829 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00007C 00               [12]  830 	nop; 
                                    831 ;	slave_fifo.c:108: IOD = 0x08;	// MSEL0=1 (passive serial config); nCONFIG=0 (reset)
      00007D 75 B0 08         [24]  832 	mov	_IOD,#0x08
                                    833 ;	slave_fifo.c:109: OED = 0x0c;	// set port D bits 2 and 3 for output
      000080 75 B5 0C         [24]  834 	mov	_OED,#0x0c
                                    835 ;	slave_fifo.c:111: IOA = 0x01; // reset FPGA
      000083 75 80 01         [24]  836 	mov	_IOA,#0x01
                                    837 ;	slave_fifo.c:112: OEA = 0x03;	// set port A bits 0 and 1 for output
      000086 75 B2 03         [24]  838 	mov	_OEA,#0x03
                                    839 ;	slave_fifo.c:114: PINFLAGSAB = 0x98;  // FLAGA = EP2 EF (empty flag); FLAGB = EP4 EF
      000089 90 E6 02         [24]  840 	mov	dptr,#_PINFLAGSAB
      00008C 74 98            [12]  841 	mov	a,#0x98
      00008E F0               [24]  842 	movx	@dptr,a
                                    843 ;	slave_fifo.c:115: SYNCDELAY;
      00008F 00               [12]  844 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000090 00               [12]  845 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000091 00               [12]  846 	nop; 
                                    847 ;	slave_fifo.c:116: PINFLAGSCD = 0xfe;  // FLAGC = EP6 FF (full flag); FLAGD = EP8 FF
      000092 90 E6 03         [24]  848 	mov	dptr,#_PINFLAGSCD
      000095 74 FE            [12]  849 	mov	a,#0xfe
      000097 F0               [24]  850 	movx	@dptr,a
                                    851 ;	slave_fifo.c:117: SYNCDELAY;
      000098 00               [12]  852 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000099 00               [12]  853 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00009A 00               [12]  854 	nop; 
                                    855 ;	slave_fifo.c:119: EP1INCFG=0x00;		// EP1 IN disabled
      00009B 90 E6 11         [24]  856 	mov	dptr,#_EP1INCFG
      00009E E4               [12]  857 	clr	a
      00009F F0               [24]  858 	movx	@dptr,a
                                    859 ;	slave_fifo.c:120: EP1OUTCFG=0xa0;		// EP1 OUT receives FPGA .rbf bitfile
      0000A0 90 E6 10         [24]  860 	mov	dptr,#_EP1OUTCFG
      0000A3 74 A0            [12]  861 	mov	a,#0xa0
      0000A5 F0               [24]  862 	movx	@dptr,a
                                    863 ;	slave_fifo.c:121: EP2CFG=0xa2;  // 1010 0010 (bulk OUT, 512 bytes, double-buffered)
      0000A6 90 E6 12         [24]  864 	mov	dptr,#_EP2CFG
      0000A9 74 A2            [12]  865 	mov	a,#0xa2
      0000AB F0               [24]  866 	movx	@dptr,a
                                    867 ;	slave_fifo.c:122: EP4CFG=0xa0;  // 1010 0000 (bulk OUT, 512 bytes, double-buffered)
      0000AC 90 E6 13         [24]  868 	mov	dptr,#_EP4CFG
      0000AF 74 A0            [12]  869 	mov	a,#0xa0
      0000B1 F0               [24]  870 	movx	@dptr,a
                                    871 ;	slave_fifo.c:123: EP6CFG=0xe2;  // 1110 0010 (bulk IN, 512 bytes, double-buffered)
      0000B2 90 E6 14         [24]  872 	mov	dptr,#_EP6CFG
      0000B5 74 E2            [12]  873 	mov	a,#0xe2
      0000B7 F0               [24]  874 	movx	@dptr,a
                                    875 ;	slave_fifo.c:124: EP8CFG=0xe0;  // 1110 0010 (bulk IN, 512 bytes, double-buffered)
      0000B8 90 E6 15         [24]  876 	mov	dptr,#_EP8CFG
      0000BB 74 E0            [12]  877 	mov	a,#0xe0
      0000BD F0               [24]  878 	movx	@dptr,a
                                    879 ;	slave_fifo.c:125: SYNCDELAY;
      0000BE 00               [12]  880 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000BF 00               [12]  881 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000C0 00               [12]  882 	nop; 
                                    883 ;	slave_fifo.c:127: FIFORESET = 0x80;  SYNCDELAY;  // NAK all requests from host. 
      0000C1 90 E6 04         [24]  884 	mov	dptr,#_FIFORESET
      0000C4 74 80            [12]  885 	mov	a,#0x80
      0000C6 F0               [24]  886 	movx	@dptr,a
      0000C7 00               [12]  887 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000C8 00               [12]  888 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000C9 00               [12]  889 	nop; 
                                    890 ;	slave_fifo.c:128: FIFORESET = 0x82;  SYNCDELAY;  // Reset individual EP (2,4,6,8)
      0000CA 90 E6 04         [24]  891 	mov	dptr,#_FIFORESET
      0000CD 74 82            [12]  892 	mov	a,#0x82
      0000CF F0               [24]  893 	movx	@dptr,a
      0000D0 00               [12]  894 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000D1 00               [12]  895 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000D2 00               [12]  896 	nop; 
                                    897 ;	slave_fifo.c:129: FIFORESET = 0x84;  SYNCDELAY;
      0000D3 90 E6 04         [24]  898 	mov	dptr,#_FIFORESET
      0000D6 74 84            [12]  899 	mov	a,#0x84
      0000D8 F0               [24]  900 	movx	@dptr,a
      0000D9 00               [12]  901 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000DA 00               [12]  902 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000DB 00               [12]  903 	nop; 
                                    904 ;	slave_fifo.c:130: FIFORESET = 0x86;  SYNCDELAY;
      0000DC 90 E6 04         [24]  905 	mov	dptr,#_FIFORESET
      0000DF 74 86            [12]  906 	mov	a,#0x86
      0000E1 F0               [24]  907 	movx	@dptr,a
      0000E2 00               [12]  908 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000E3 00               [12]  909 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000E4 00               [12]  910 	nop; 
                                    911 ;	slave_fifo.c:131: FIFORESET = 0x88;  SYNCDELAY;
      0000E5 90 E6 04         [24]  912 	mov	dptr,#_FIFORESET
      0000E8 74 88            [12]  913 	mov	a,#0x88
      0000EA F0               [24]  914 	movx	@dptr,a
      0000EB 00               [12]  915 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000EC 00               [12]  916 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000ED 00               [12]  917 	nop; 
                                    918 ;	slave_fifo.c:132: FIFORESET = 0x00;  SYNCDELAY;  // Resume normal operation. 
      0000EE 90 E6 04         [24]  919 	mov	dptr,#_FIFORESET
      0000F1 E4               [12]  920 	clr	a
      0000F2 F0               [24]  921 	movx	@dptr,a
      0000F3 00               [12]  922 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000F4 00               [12]  923 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000F5 00               [12]  924 	nop; 
                                    925 ;	slave_fifo.c:136: EP2FIFOCFG = 0x00; SYNCDELAY;
      0000F6 90 E6 18         [24]  926 	mov	dptr,#_EP2FIFOCFG
      0000F9 E4               [12]  927 	clr	a
      0000FA F0               [24]  928 	movx	@dptr,a
      0000FB 00               [12]  929 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000FC 00               [12]  930 	nop; nop; nop; nop; nop; nop; nop; nop; 
      0000FD 00               [12]  931 	nop; 
                                    932 ;	slave_fifo.c:137: OUTPKTEND = 0x82;  SYNCDELAY;
      0000FE 90 E6 49         [24]  933 	mov	dptr,#_OUTPKTEND
      000101 74 82            [12]  934 	mov	a,#0x82
      000103 F0               [24]  935 	movx	@dptr,a
      000104 00               [12]  936 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000105 00               [12]  937 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000106 00               [12]  938 	nop; 
                                    939 ;	slave_fifo.c:138: OUTPKTEND = 0x82;  SYNCDELAY;
      000107 90 E6 49         [24]  940 	mov	dptr,#_OUTPKTEND
      00010A 74 82            [12]  941 	mov	a,#0x82
      00010C F0               [24]  942 	movx	@dptr,a
      00010D 00               [12]  943 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00010E 00               [12]  944 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00010F 00               [12]  945 	nop; 
                                    946 ;	slave_fifo.c:142: EP4FIFOCFG = 0x00; SYNCDELAY;
      000110 90 E6 19         [24]  947 	mov	dptr,#_EP4FIFOCFG
      000113 E4               [12]  948 	clr	a
      000114 F0               [24]  949 	movx	@dptr,a
      000115 00               [12]  950 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000116 00               [12]  951 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000117 00               [12]  952 	nop; 
                                    953 ;	slave_fifo.c:143: OUTPKTEND = 0x84;  SYNCDELAY;
      000118 90 E6 49         [24]  954 	mov	dptr,#_OUTPKTEND
      00011B 74 84            [12]  955 	mov	a,#0x84
      00011D F0               [24]  956 	movx	@dptr,a
      00011E 00               [12]  957 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00011F 00               [12]  958 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000120 00               [12]  959 	nop; 
                                    960 ;	slave_fifo.c:144: OUTPKTEND = 0x84;  SYNCDELAY;
      000121 90 E6 49         [24]  961 	mov	dptr,#_OUTPKTEND
      000124 74 84            [12]  962 	mov	a,#0x84
      000126 F0               [24]  963 	movx	@dptr,a
      000127 00               [12]  964 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000128 00               [12]  965 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000129 00               [12]  966 	nop; 
                                    967 ;	slave_fifo.c:146: EP2FIFOCFG = 0x10; SYNCDELAY; //  AUTOOUT=1; byte-wide operation
      00012A 90 E6 18         [24]  968 	mov	dptr,#_EP2FIFOCFG
      00012D 74 10            [12]  969 	mov	a,#0x10
      00012F F0               [24]  970 	movx	@dptr,a
      000130 00               [12]  971 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000131 00               [12]  972 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000132 00               [12]  973 	nop; 
                                    974 ;	slave_fifo.c:147: EP4FIFOCFG = 0x10; SYNCDELAY; //  AUTOOUT=1; byte-wide operation
      000133 90 E6 19         [24]  975 	mov	dptr,#_EP4FIFOCFG
      000136 74 10            [12]  976 	mov	a,#0x10
      000138 F0               [24]  977 	movx	@dptr,a
      000139 00               [12]  978 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00013A 00               [12]  979 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00013B 00               [12]  980 	nop; 
                                    981 ;	slave_fifo.c:148: EP6FIFOCFG = 0x0c; SYNCDELAY; //  AUTOIN=1; byte-wide operation
      00013C 90 E6 1A         [24]  982 	mov	dptr,#_EP6FIFOCFG
      00013F 74 0C            [12]  983 	mov	a,#0x0c
      000141 F0               [24]  984 	movx	@dptr,a
      000142 00               [12]  985 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000143 00               [12]  986 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000144 00               [12]  987 	nop; 
                                    988 ;	slave_fifo.c:149: EP8FIFOCFG = 0x0c; SYNCDELAY; //  AUTOIN=1; byte-wide operation
      000145 90 E6 1B         [24]  989 	mov	dptr,#_EP8FIFOCFG
      000148 74 0C            [12]  990 	mov	a,#0x0c
      00014A F0               [24]  991 	movx	@dptr,a
      00014B 00               [12]  992 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00014C 00               [12]  993 	nop; nop; nop; nop; nop; nop; nop; nop; 
      00014D 00               [12]  994 	nop; 
                                    995 ;	slave_fifo.c:151: EP1OUTBC=0xff; // arm endpoint 1 for OUT (host->device) transfers
      00014E 90 E6 8D         [24]  996 	mov	dptr,#_EP1OUTBC
      000151 74 FF            [12]  997 	mov	a,#0xff
      000153 F0               [24]  998 	movx	@dptr,a
                                    999 ;	slave_fifo.c:152: SYNCDELAY;
      000154 00               [12] 1000 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000155 00               [12] 1001 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000156 00               [12] 1002 	nop; 
                                   1003 ;	slave_fifo.c:162: for (i=0; i<2000; i++) NOP;
      000157 7E D0            [12] 1004 	mov	r6,#0xd0
      000159 7F 07            [12] 1005 	mov	r7,#0x07
      00015B                       1006 00105$:
      00015B 00               [12] 1007 	nop;	
      00015C 1E               [12] 1008 	dec	r6
      00015D BE FF 01         [24] 1009 	cjne	r6,#0xff,00126$
      000160 1F               [12] 1010 	dec	r7
      000161                       1011 00126$:
      000161 EE               [12] 1012 	mov	a,r6
      000162 4F               [12] 1013 	orl	a,r7
      000163 70 F6            [24] 1014 	jnz	00105$
                                   1015 ;	slave_fifo.c:164: IOD = 0x0c;	// nCONFIG=1 (configure/run)
      000165 75 B0 0C         [24] 1016 	mov	_IOD,#0x0c
                                   1017 ;	slave_fifo.c:168: for (i=0; i<2000; i++) NOP;
      000168 7E D0            [12] 1018 	mov	r6,#0xd0
      00016A 7F 07            [12] 1019 	mov	r7,#0x07
      00016C                       1020 00108$:
      00016C 00               [12] 1021 	nop;	
      00016D 1E               [12] 1022 	dec	r6
      00016E BE FF 01         [24] 1023 	cjne	r6,#0xff,00128$
      000171 1F               [12] 1024 	dec	r7
      000172                       1025 00128$:
      000172 EE               [12] 1026 	mov	a,r6
      000173 4F               [12] 1027 	orl	a,r7
      000174 70 F6            [24] 1028 	jnz	00108$
                                   1029 ;	slave_fifo.c:171: }
      000176 22               [24] 1030 	ret
                                   1031 ;------------------------------------------------------------
                                   1032 ;Allocation info for local variables in function 'ProcessEP1Data'
                                   1033 ;------------------------------------------------------------
                                   1034 ;src                       Allocated to registers 
                                   1035 ;------------------------------------------------------------
                                   1036 ;	slave_fifo.c:180: static void ProcessEP1Data(void)
                                   1037 ;	-----------------------------------------
                                   1038 ;	 function ProcessEP1Data
                                   1039 ;	-----------------------------------------
      000177                       1040 _ProcessEP1Data:
                                   1041 ;	slave_fifo.c:183: const unsigned char *src=EP1OUTBUF;
                                   1042 ;	slave_fifo.c:200: IOA = src[0] & 0x03; // o sinal PA0 vira "reset" dentro da FPGA
      000177 90 E7 80         [24] 1043 	mov	dptr,#_EP1OUTBUF
      00017A E0               [24] 1044 	movx	a,@dptr
      00017B FF               [12] 1045 	mov	r7,a
      00017C 74 03            [12] 1046 	mov	a,#0x03
      00017E 5F               [12] 1047 	anl	a,r7
      00017F F5 80            [12] 1048 	mov	_IOA,a
                                   1049 ;	slave_fifo.c:201: EP1OUTBC=0xff; // re-arm endpoint 1
      000181 90 E6 8D         [24] 1050 	mov	dptr,#_EP1OUTBC
      000184 74 FF            [12] 1051 	mov	a,#0xff
      000186 F0               [24] 1052 	movx	@dptr,a
                                   1053 ;	slave_fifo.c:202: SYNCDELAY;
      000187 00               [12] 1054 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000188 00               [12] 1055 	nop; nop; nop; nop; nop; nop; nop; nop; 
      000189 00               [12] 1056 	nop; 
                                   1057 ;	slave_fifo.c:203: }
      00018A 22               [24] 1058 	ret
                                   1059 ;------------------------------------------------------------
                                   1060 ;Allocation info for local variables in function 'main'
                                   1061 ;------------------------------------------------------------
                                   1062 ;	slave_fifo.c:206: void main(void)
                                   1063 ;	-----------------------------------------
                                   1064 ;	 function main
                                   1065 ;	-----------------------------------------
      00018B                       1066 _main:
                                   1067 ;	slave_fifo.c:208: Initialize();
      00018B 12 00 62         [24] 1068 	lcall	_Initialize
                                   1069 ;	slave_fifo.c:238: while (1) 
      00018E                       1070 00104$:
                                   1071 ;	slave_fifo.c:240: if (!(EP1OUTCS & (1<<1))) 
      00018E 90 E6 A1         [24] 1072 	mov	dptr,#_EP1OUTCS
      000191 E0               [24] 1073 	movx	a,@dptr
      000192 20 E1 F9         [24] 1074 	jb	acc.1,00104$
                                   1075 ;	slave_fifo.c:242: ProcessEP1Data();
      000195 12 01 77         [24] 1076 	lcall	_ProcessEP1Data
                                   1077 ;	slave_fifo.c:246: }
      000198 80 F4            [24] 1078 	sjmp	00104$
                                   1079 	.area CSEG    (CODE)
                                   1080 	.area CONST   (CODE)
                                   1081 	.area XINIT   (CODE)
                                   1082 	.area CABS    (ABS,CODE)
