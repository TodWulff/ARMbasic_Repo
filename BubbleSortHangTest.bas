#define SortArrayElements	256
#define RandomNumBitWidth  	8	' this needs to be 1-8, inclusive

dim SortTempInt, SortEndIdx, SortAdjEnd, LoopIndex, looptime  as integer
dim SortArray(SortArrayElements) as byte

Main:
	
sortarray(0)=19
sortarray(1)=217
sortarray(2)=148
sortarray(3)=22
sortarray(4)=199
sortarray(5)=133
sortarray(6)=67
sortarray(7)=34
sortarray(8)=16
sortarray(9)=246
sortarray(10)=23
sortarray(11)=52
sortarray(12)=72
sortarray(13)=141
sortarray(14)=218
sortarray(15)=53
sortarray(16)=133
sortarray(17)=22
sortarray(18)=160
sortarray(19)=57
sortarray(20)=5
sortarray(21)=190
sortarray(22)=134
sortarray(23)=65
sortarray(24)=90
sortarray(25)=81
sortarray(26)=57
sortarray(27)=77
sortarray(28)=179
sortarray(29)=155
sortarray(30)=164
sortarray(31)=109
sortarray(32)=150
sortarray(33)=205
sortarray(34)=19
sortarray(35)=108
sortarray(36)=140
sortarray(37)=255
sortarray(38)=146
sortarray(39)=39
sortarray(40)=129
sortarray(41)=49
sortarray(42)=16
sortarray(43)=224
sortarray(44)=191
sortarray(45)=215
sortarray(46)=140
sortarray(47)=153
sortarray(48)=181
sortarray(49)=24
sortarray(50)=9
sortarray(51)=82
sortarray(52)=115
sortarray(53)=89
sortarray(54)=132
sortarray(55)=190
sortarray(56)=166
sortarray(57)=38
sortarray(58)=153
sortarray(59)=26
sortarray(60)=178
sortarray(61)=83
sortarray(62)=2
sortarray(63)=93
sortarray(64)=43
sortarray(65)=144
sortarray(66)=122
sortarray(67)=149
sortarray(68)=159
sortarray(69)=62
sortarray(70)=146
sortarray(71)=200
sortarray(72)=149
sortarray(73)=232
sortarray(74)=133
sortarray(75)=125
sortarray(76)=254
sortarray(77)=17
sortarray(78)=248
sortarray(79)=166
sortarray(80)=230
sortarray(81)=5
sortarray(82)=100
sortarray(83)=77
sortarray(84)=199
sortarray(85)=48
sortarray(86)=215
sortarray(87)=179
sortarray(88)=175
sortarray(89)=5
sortarray(90)=13
sortarray(91)=36
sortarray(92)=105
sortarray(93)=248
sortarray(94)=59
sortarray(95)=184
sortarray(96)=26
sortarray(97)=226
sortarray(98)=183
sortarray(99)=124
sortarray(100)=112
sortarray(101)=25
sortarray(102)=209
sortarray(103)=223
sortarray(104)=11
sortarray(105)=239
sortarray(106)=53
sortarray(107)=141
sortarray(108)=157
sortarray(109)=16
sortarray(110)=158
sortarray(111)=47
sortarray(112)=122
sortarray(113)=63
sortarray(114)=252
sortarray(115)=198
sortarray(116)=12
sortarray(117)=64
sortarray(118)=191
sortarray(119)=31
sortarray(120)=140
sortarray(121)=53
sortarray(122)=194
sortarray(123)=92
sortarray(124)=58
sortarray(125)=243
sortarray(126)=185
sortarray(127)=182
sortarray(128)=179
sortarray(129)=206
sortarray(130)=205
sortarray(131)=42
sortarray(132)=111
sortarray(133)=155
sortarray(134)=212
sortarray(135)=120
sortarray(136)=208
sortarray(137)=90
sortarray(138)=16
sortarray(139)=184
sortarray(140)=110
sortarray(141)=12
sortarray(142)=46
sortarray(143)=235
sortarray(144)=217
sortarray(145)=2
sortarray(146)=60
sortarray(147)=50
sortarray(148)=221
sortarray(149)=196
sortarray(150)=141
sortarray(151)=99
sortarray(152)=65
sortarray(153)=111
sortarray(154)=112
sortarray(155)=120
sortarray(156)=219
sortarray(157)=7
sortarray(158)=64
sortarray(159)=128
sortarray(160)=41
sortarray(161)=133
sortarray(162)=247
sortarray(163)=204
sortarray(164)=92
sortarray(165)=248
sortarray(166)=152
sortarray(167)=188
sortarray(168)=132
sortarray(169)=78
sortarray(170)=113
sortarray(171)=155
sortarray(172)=143
sortarray(173)=156
sortarray(174)=60
sortarray(175)=90
sortarray(176)=146
sortarray(177)=203
sortarray(178)=176
sortarray(179)=76
sortarray(180)=91
sortarray(181)=232
sortarray(182)=224
sortarray(183)=26
sortarray(184)=97
sortarray(185)=254
sortarray(186)=45
sortarray(187)=158
sortarray(188)=112
sortarray(189)=254
sortarray(190)=99
sortarray(191)=11
sortarray(192)=34
sortarray(193)=232
sortarray(194)=131
sortarray(195)=124
sortarray(196)=190
sortarray(197)=187
sortarray(198)=140
sortarray(199)=28
sortarray(200)=9
sortarray(201)=61
sortarray(202)=68
sortarray(203)=24
sortarray(204)=60
sortarray(205)=167
sortarray(206)=176
sortarray(207)=252
sortarray(208)=146
sortarray(209)=247
sortarray(210)=69
sortarray(211)=5
sortarray(212)=227
sortarray(213)=152
sortarray(214)=24
sortarray(215)=164
sortarray(216)=218
sortarray(217)=210
sortarray(218)=35
sortarray(219)=230
sortarray(220)=22
sortarray(221)=242
sortarray(222)=120
sortarray(223)=113
sortarray(224)=224
sortarray(225)=143
sortarray(226)=178
sortarray(227)=121
sortarray(228)=44
sortarray(229)=120
sortarray(230)=104
sortarray(231)=78
sortarray(232)=90
sortarray(233)=220
sortarray(234)=1
sortarray(235)=42
sortarray(236)=214
sortarray(237)=35
sortarray(238)=128
sortarray(239)=85
sortarray(240)=203
sortarray(241)=77
sortarray(242)=237
sortarray(243)=139
sortarray(244)=162
sortarray(245)=89
sortarray(246)=61
sortarray(247)=89
sortarray(248)=52
sortarray(249)=114
sortarray(250)=104
sortarray(251)=108
sortarray(252)=231
sortarray(253)=103
sortarray(254)=147
sortarray(255)=204
	
	
/* 	'generate and fill an array with randomness
	SortEndIdx=0
	do
	SortArray(SortEndIdx) = (((((TIMER*(Timer AND $ffffFFFF)) AND $000FFFF0) >> 4) * (((TIMER/(Timer AND $0000FFFF)) AND $000FFFF0) >> 4)) AND $0000FFFF) >> (16-RandomNumBitWidth)  ' fills array with randomness
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements
 */	
	'print the randomized array
	SortEndIdx=0
	do
	Print SortEndIdx, SortArray(SortEndIdx)
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements

	Print "Paused - Select the BASICtools console input field and press enter."
	debugin SortTempInt
	
	'sort the randomized array	
	SortEndIdx = SortArrayElements
	LoopIndex = 0
	
	looptime = timer

	do 															' inline bubblesort - not great, but a functional routine on these devices
		SortAdjEnd = 0											' ref: https://en.wikipedia.org/wiki/Bubble_sort
		LoopIndex =0
		do
			LoopIndex+=1
			if SortArray(LoopIndex-1) > SortArray(LoopIndex)
				SortTempInt = SortArray(LoopIndex-1)
				SortArray(LoopIndex-1)=SortArray(LoopIndex)
				SortArray(LoopIndex)=SortTempInt					
				SortAdjEnd = LoopIndex
				end if
	print chr(if(LoopIndex mod 2 = 0,"|","#"));  ':)
		until LoopIndex = SortEndIdx-1			// this causes random hangs - thinking somthing is 
		' until LoopIndex >= SortEndIdx-1			// amiss with conditional logic and certain random # sequences
		SortEndIdx = SortAdjEnd
	until SortEndIdx = 0
	
	looptime = timer - looptime
	
	'print the sorted array
	SortEndIdx=0
	do
	Print SortEndIdx, SortArray(SortEndIdx)
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements

	Print "Took ";looptime;" uS"

end
