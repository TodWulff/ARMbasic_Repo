#define SortArrayElmtCnt	256
#define RandomNumBitWidth  	8	' 1-8, inclusive, for the inline random code that is the code.catrastrophy on line 42 (to keep random byte values bound from 0 to 255)
#define LoopTestIterations	64

sub ByteArrayBubbleSort(byref _ByteArray() as byte, _ElementCount as integer)
	dim _loopIndex, _sortAdjEnd, _tempInt, _sortKey as integer
	do 															' bubblesort - not great, but a functional routine on these devices
		_sortAdjEnd = 0											' ref: https://en.wikipedia.org/wiki/Bubble_sort
		_loopIndex =0
		do
			_loopIndex+=1
			if _ByteArray(_loopIndex-1) > _ByteArray(_loopIndex)
				_tempInt = _ByteArray(_loopIndex-1)
				_ByteArray(_loopIndex-1)=_ByteArray(_loopIndex)
				_ByteArray(_loopIndex)=_tempInt					
				_sortAdjEnd = _loopIndex
				endif
		until _loopIndex >= _ElementCount-1
		_ElementCount = _sortAdjEnd
	until _ElementCount = 0
	endsub

sub ByteArrayInsertionSort(byref _ByteArray() as byte, _ElementCount as integer)	' proving knuth's posit that this is >twice as fast as bubblesort
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

sub GenRandByteArray(byref _ByteArray() as byte, _ElementCount as integer, _homage as integer)
	'generate and fill an array with randomness
	dim _loopIndex as integer
	_loopIndex =0
	if _homage then print "Generating random array of ";_ElementCount;" bytes ";
	do
		_ByteArray(_loopIndex) = (((((timer * (Timer AND $ffffFFFF)) AND $000FFFF0) >> 4) * (((timer / (Timer AND $0000FFFF)) AND $000FFFF0) >> 4)) AND $0000FFFF) >> (16-RandomNumBitWidth)  ' fills array with randomness
		_loopIndex+=1
		if _homage then print chr(if(_loopIndex mod 2 = 0,"+","*"));	'~
	until _loopIndex >= _ElementCount
	if _homage then print
	endsub

sub MirrorByteArray(byref _SourceByteArray() as byte, byref _DestByteArray() as byte, _ElementCount as integer, _homage as integer)
	'Mirror Destination Array from Source Array (for testing conformity)
	dim _loopIndex as integer
	_loopIndex =0
	if _homage then print "Mirroring array of ";_ElementCount;" bytes ";
	do
		_DestByteArray(_loopIndex) = _SourceByteArray(_loopIndex) 
		_loopIndex+=1
		if _homage then print chr(if(_loopIndex mod 2 = 0,"+","*"));	'~
	until _loopIndex >= _ElementCount
	if _homage then print
	endsub

dim SortTempInt, SortInt, LoopIndex, InstertionSortTimes(LoopTestIterations), BubbleSortTimes(LoopTestIterations) as integer
dim InsertionSortArray(SortArrayElmtCnt), BubbleSortArray(SortArrayElmtCnt) as byte

Main:
	
	' create a random byte array of 'SortArrayElmtCnt' elements
	GenRandByteArray(InsertionSortArray, SortArrayElmtCnt, 1)
	print
	print	
	
	'print the randomized array
	LoopIndex=0
	do
		Print LoopIndex, InsertionSortArray(LoopIndex)
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
	GenRandByteArray(InsertionSortArray, SortArrayElmtCnt, 0)
	MirrorByteArray(InsertionSortArray, BubbleSortArray, SortArrayElmtCnt , 0)
	
	'Insertion sort the randomized array	
	SortTempInt = timer
	ByteArrayInsertionSort(InsertionSortArray, SortArrayElmtCnt)
	InstertionSortTimes(SortInt) = timer - SortTempInt
	
	'Insertion sort the same randomized array	
	SortTempInt = timer
	ByteArrayBubbleSort(BubbleSortArray, SortArrayElmtCnt)
	BubbleSortTimes(SortInt) = timer - SortTempInt
	
	'verify the sorted results are the same, just for SA purposes
	SortTempInt=0
	do
	if InsertionSortArray(SortTempInt)<>BubbleSortArray(SortTempInt)
		print "Unexpected (Unmatching Sorted) Results at index: ";SortTempInt
		stop
		endif
	SortTempInt+=1
	until SortTempInt >= SortArrayElmtCnt
	
	'pay homage to the great man behind the curtain
	print chr(if(SortInt mod 2 = 0,"|","#"));  ':)
	SortInt += 1
	until SortInt >= LoopTestIterations

	print
	print
	
	'print the average byte array sort times
	LoopIndex=0
	SortInt=0
	SortTempInt=0
	Print "Loop, InsSortTime, BubSortTime"
	do
		SortInt += InstertionSortTimes(LoopIndex)
		SortTempInt += BubbleSortTimes(LoopIndex)
		Print LoopIndex, InstertionSortTimes(LoopIndex),"", BubbleSortTimes(LoopIndex)
		LoopIndex+=1
	until LoopIndex >= LoopTestIterations

	Print "Average Insertion Sort time for an array of ";SortArrayElmtCnt;" elements is ";SortInt/LoopTestIterations;" uS across ";LoopTestIterations;" test iterations."
	Print "Average Bubble Sort time for an array of ";SortArrayElmtCnt;" elements is ";SortTempInt/LoopTestIterations;" uS across ";LoopTestIterations;" test iterations."
	
	
	' and pay tribute to the great wise one

	' print "Regarding Bubble Sort sucking, Knuth was ";(if(((SortInt/LoopTestIterations*2)<(SortTempInt/LoopTestIterations))),"correct.","wrong.")	'<-- ugh, the compiler tosses an error on this but not the following

	print "Regarding Bubble Sort sucking, Knuth was ";
	if (SortInt/LoopTestIterations*2)<(SortTempInt/LoopTestIterations)
		print "correct."
	else
		print "wrong."
	endif
end
		