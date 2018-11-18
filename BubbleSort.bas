#define SortArrayElements	256
#define RandomNumBitWidth  	8	' this needs to be 1-8, inclusive

dim SortTempInt, SortEndIdx, SortAdjEnd, LoopIndex, looptime  as integer
dim SortArray(SortArrayElements) as byte

Main:
	
	'generate and fill an array with randomness
	SortEndIdx=0
	do
	SortArray(SortEndIdx) = (((((TIMER*(Timer AND $ffffFFFF)) AND $000FFFF0) >> 4) * (((TIMER/(Timer AND $0000FFFF)) AND $000FFFF0) >> 4)) AND $0000FFFF) >> (16-RandomNumBitWidth)  ' fills array with randomness
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements
	
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
		' until LoopIndex = SortEndIdx-1		// this causes random hangs - thinking somthing is 
		until LoopIndex >= SortEndIdx-1			// amiss with conditional logic and certain random # sequences
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
		
// here is a hang context (see line #s 43/44 		
/* 253	251
254	255
255	255
Took 128826 uS
 

... Finished in 630 ms
Executing...

Welcome to ARMbasic Kernel[8.40b] with Floating Point            Copyright 2017, Coridium Corp.
  for the LPC824    

Personal use copy for Beta Testing                                                                           
Commercial customers contact Coridium for licensing

0	19
1	217
2	148
3	22
4	199
5	133
6	67
7	34
8	16
9	246
10	23
11	52
12	72
13	141
14	218
15	53
16	133
17	22
18	160
19	57
20	5
21	190
22	134
23	65
24	90
25	81
26	57
27	77
28	179
29	155
30	164
31	109
32	150
33	205
34	19
35	108
36	140
37	255
38	146
39	39
40	129
41	49
42	16
43	224
44	191
45	215
46	140
47	153
48	181
49	24
50	9
51	82
52	115
53	89
54	132
55	190
56	166
57	38
58	153
59	26
60	178
61	83
62	2
63	93
64	43
65	144
66	122
67	149
68	159
69	62
70	146
71	200
72	149
73	232
74	133
75	125
76	254
77	17
78	248
79	166
80	230
81	5
82	100
83	77
84	199
85	48
86	215
87	179
88	175
89	5
90	13
91	36
92	105
93	248
94	59
95	184
96	26
97	226
98	183
99	124
100	112
101	25
102	209
103	223
104	11
105	239
106	53
107	141
108	157
109	16
110	158
111	47
112	122
113	63
114	252
115	198
116	12
117	64
118	191
119	31
120	140
121	53
122	194
123	92
124	58
125	243
126	185
127	182
128	179
129	206
130	205
131	42
132	111
133	155
134	212
135	120
136	208
137	90
138	16
139	184
140	110
141	12
142	46
143	235
144	217
145	2
146	60
147	50
148	221
149	196
150	141
151	99
152	65
153	111
154	112
155	120
156	219
157	7
158	64
159	128
160	41
161	133
162	247
163	204
164	92
165	248
166	152
167	188
168	132
169	78
170	113
171	155
172	143
173	156
174	60
175	90
176	146
177	203
178	176
179	76
180	91
181	232
182	224
183	26
184	97
185	254
186	45
187	158
188	112
189	254
190	99
191	11
192	34
193	232
194	131
195	124
196	190
197	187
198	140
199	28
200	9
201	61
202	68
203	24
204	60
205	167
206	176
207	252
208	146
209	247
210	69
211	5
212	227
213	152
214	24
215	164
216	218
217	210
218	35
219	230
220	22
221	242
222	120
223	113
224	224
225	143
226	178
227	121
228	44
229	120
230	104
231	78
232	90
233	220
234	1
235	42
236	214
237	35
238	128
239	85
240	203
241	77
242	237
243	139
244	162
245	89
246	61
247	89
248	52
249	114
250	104
251	108
252	231
253	103
254	147
255	204
Paused - Select the BASICtools console input field and press enter.

ARMbasi	 */
