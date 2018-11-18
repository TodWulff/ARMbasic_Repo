#define SortArrayElements	256
#define RandomNumBitWidth  	8	' this needs to be 1-8, inclusive

dim SortTempInt, SortEndIdx, SortAdjEnd, LoopIndex  as integer
dim SortArray(SortArrayElements) as byte

Sub quicksort(qs() As Long, StartElement As Long, EndElement As Long)
 
    Dim ArraySize As Integer
	
	ArraySize = EndElement - StartElement +1
    If ArraySize < 2 Then Exit Sub
 
    Dim As Long i = StartElement, j = EndElement
    Dim As Long pivot = qs(StartElement + ArraySize \ 2)
 
    Do
        While qs(i) < pivot
            i += 1
        Wend
        While pivot < qs(j)
            j -= 1
        Wend
        If i <= j Then
            Swap qs(i), qs(j)
            i += 1
            j -= 1
        EndIf
    Loop Until i > j
 
    If StartElement < j Then quicksort(qs(), StartElement, j)
    If StartElement < EndElement Then quicksort(qs(), i, EndElement)
 
End Sub
 

 
 



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

	QuickSort(SortArray, 0, SortArrayElements - 1)		' QuickSort ref: https://en.wikipedia.org/wiki/Quicksort
	
	
	'print the sorted array
	SortEndIdx=0
	do
	Print SortEndIdx, SortArray(SortEndIdx)
	SortEndIdx+=1
	until SortEndIdx >= SortArrayElements

end
		