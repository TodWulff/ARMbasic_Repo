#define SortArrayElmtCnt	256
#define RandomNumBitWidth  	8	' 1-8, inclusive, for the inline random code that is the catrastrophy on line 14
#define LoopTestIterations	64

sub ByteArrayInsertionSort(byref _ByteArray() as byte, _ElementCount as integer)
	dim _loopIndex, _tempInt, _sortKey as integer
	for _loopIndex = 1 to _ElementCount-1
		_tempInt = _ByteArray(_loopIndex)
		_sortKey = _loopIndex - 1
		while (_sortKey >= 0) and (_tempInt < _ByteArray(_sortKey))
			_ByteArray(_sortKey + 1) = _ByteArray(_sortKey)
			_sortKey = _sortKey - 1
		loop
	_ByteArray(_sortKey + 1) = _tempInt
	next
	endsub

sub ByteArrayBubbleSort(byref _ByteArray() as byte, _ElementCount as integer)
	dim _loopIndex, _tempInt, _sortKey as integer
	for _loopIndex = 1 to _ElementCount-1
		_tempInt = _ByteArray(_loopIndex)
		_sortKey = _loopIndex - 1
		while (_sortKey >= 0) and (_tempInt < _ByteArray(_sortKey))
			_ByteArray(_sortKey + 1) = _ByteArray(_sortKey)
			_sortKey = _sortKey - 1
		loop
	_ByteArray(_sortKey + 1) = _tempInt
	next
	endsub

sub GenRandByteArray(byref _ByteArray() as byte, _ElementCount as integer, homage as integer)
	'generate and fill an array with randomness
	dim _loopIndex as integer
	_loopIndex =0
	do
		_ByteArray(_loopIndex) = (((((TIMER*(Timer AND $ffffFFFF)) AND $000FFFF0) >> 4) * (((TIMER/(Timer AND $0000FFFF)) AND $000FFFF0) >> 4)) AND $0000FFFF) >> (16-RandomNumBitWidth)  ' fills array with randomness
		_loopIndex+=1
		if homage then print chr(if(_loopIndex mod 2 = 0,"+","*"));	'~
	until _loopIndex >= _ElementCount
	if homage then print
	endsub

sub MirrorByteArray(byref _SourceByteArray() as byte, byref _DestByteArray() as byte, _ElementCount as integer, homage as integer)
	'Mirror Destination Array from Source Array (for testing conformity)
	dim _loopIndex as integer
	_loopIndex =0
	do
		_DestByteArray(_loopIndex) = _SourceByteArray(_loopIndex) 
		_loopIndex+=1
		if homage then print chr(if(_loopIndex mod 2 = 0,"+","*"));	'~
	until _loopIndex >= _ElementCount
	if homage then print
	endsub

dim SortTempInt, SortInt, LoopIndex, InstertionSortTimes(LoopTestIterations), BubbleSortTimes(LoopTestIterations) as integer
dim SortArray(SortArrayElmtCnt) as byte

Main:
	
	' create a random byte array of 'SortArrayElmtCnt' elements
	GenRandByteArray(SortArray, SortArrayElmtCnt, 1)
	print
	print	
	
	'print the randomized array
	LoopIndex=0
	do
		Print LoopIndex, SortArray(LoopIndex)
		LoopIndex+=1
	until LoopIndex >= SortArrayElmtCnt

	Print "These are an example of the raw, unsorted, byte array contents which will be sorted."
	Print "Paused - Select BT's console input field & press enter."
	debugin SortTempInt
	print
	print
	
	SortInt=0
	do
	'generate a randomized array	
	GenRandByteArray(SortArray, SortArrayElmtCnt, 0)
	'sort the randomized array	
	SortTempInt = timer
	ByteArrayInsertionSort(SortArray, SortArrayElmtCnt)
	InstertionSortTimes(SortInt) = timer - SortTempInt
	print chr(if(SortInt mod 2 = 0,"|","#")); 'homage
	SortInt += 1
	until SortInt >= LoopTestIterations

	print
	print
	
	'print the average sort byte array time
	LoopIndex=0
	SortInt=0
	do
		SortInt += InstertionSortTimes(LoopIndex)
		Print LoopIndex, InstertionSortTimes(LoopIndex)
		LoopIndex+=1
	until LoopIndex >= LoopTestIterations

	Print "Average sort time for an array of ";SortArrayElmtCnt;" elements is ";SortInt/LoopTestIterations;" uS across ";LoopTestIterations;" test iterations."

	SortInt=0
	do
	print SortArray(SortInt)
	SortInt+=1
	until SortInt >= SortArrayElmtCnt

	
	
	end
		