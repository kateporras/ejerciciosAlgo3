!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'anStack aFinderByPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'Porras 10/14/2022 06:20:25'!
setUp
	
	anStack:=OOStack new.
	aFinderByPrefix:=SentenceFinderByPrefix new.
	
	
	anStack push: 'AlanTuring'.
	anStack push: 'AlanKay'.
	anStack push: 'AdeleGoldberg'.
	anStack push: 'DanIngalls'.
	anStack push: 'TedKaehler'.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 06:16:09'!
test01SentenceFinderByPrefixInAnEmptyStack
	| stack  finderByPrefix|
	
	stack := OOStack new.
	
	finderByPrefix:=SentenceFinderByPrefix new.
	
	
	self
		should: [ finderByPrefix find: 'asd' in: stack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 07:05:40'!
test02SentenceFinderByPrefixEmpty	
	
	self
		should: [aFinderByPrefix find:'' in:anStack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 07:07:25'!
test03SentenceFinderByPrefixIncludesWhiteSpace	
	
	self
		should: [aFinderByPrefix find:' ' in:anStack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixIncludesWhiteSpaceErrorDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 07:19:03'!
test04NoSentencesFoundByPrefix
	|foundSentences|
	foundSentences:= aFinderByPrefix find:'Stallman' in:anStack.
	
	self assert: foundSentences size equals:0.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 07:25:58'!
test05NoSentencesFoundByPrefixAndStackDoesNotChange
	|foundSentences|
	foundSentences:= aFinderByPrefix find:'Stallman' in:anStack.
	
	self assert: foundSentences size equals:0.
	self assert: anStack size equals:5.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 07:37:42'!
test06NoSentencesFoundByPrefixBySensitiveCase
	|foundSentences|
	foundSentences:= aFinderByPrefix find:'alan' in:anStack.
	
	self assert: foundSentences size equals:0.
	self assert: anStack size equals:5.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 08:32:14'!
test07FindTheSentencesThatMatchThePrefix
	|foundSentences elementsMatch |
	elementsMatch :=#('AlanKay' 'AlanTuring').
	foundSentences:= aFinderByPrefix find:'Alan' in:anStack.
	
	
	self assert: (foundSentences first )equals: (elementsMatch at:1).
	self assert: (foundSentences last )equals: (elementsMatch at:2).
	self assert: foundSentences size equals:2.	
	self assert: anStack size equals:5.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Porras 10/14/2022 08:39:49'!
test08FindTheSentencesThatMatchThePrefixAndStackDoesNotChange
	|foundSentences elementsMatch |
	elementsMatch :=#('AlanKay' 'AlanTuring').
	foundSentences:= aFinderByPrefix find:'Alan' in:anStack.
	
	
	self assert: (foundSentences first )equals: (elementsMatch at:1).
	self assert: (foundSentences last )equals: (elementsMatch at:2).
	self assert: foundSentences size equals:2.	
	self assert: anStack top equals: 'TedKaehler'.
	self assert: anStack size equals:5.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'Porras 10/13/2022 03:06:17'!
isEmpty 
	^(size=0).! !

!OOStack methodsFor: 'testing' stamp: 'Porras 10/13/2022 03:06:28'!
size
	^(size)! !


!OOStack methodsFor: 'operations' stamp: 'Porras 10/14/2022 14:32:17'!
pop
	"Muevo el top"
	"el popaux se guarda el value de mi top actual"
	|popElementAux|

	popElementAux :=self top.
	topElement :=topElement nextElement.
	size:=(size-1).
	^popElementAux 
	! !

!OOStack methodsFor: 'operations' stamp: 'Porras 10/13/2022 04:19:59'!
push:anValue

	"lo que modificaremos sera el valor del top"
	topElement := StackElement withValue: anValue nextElemet:topElement.
	size:=(size+1).
	! !

!OOStack methodsFor: 'operations' stamp: 'Porras 10/13/2022 03:58:20'!
top
	^(topElement valueElement ).! !


!OOStack methodsFor: 'initialization' stamp: 'Porras 10/13/2022 04:14:23'!
initialize
	
	topElement:= BaseStack new.
	size:=0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackContents category: 'Stack-Exercise'!
Object subclass: #OOStackContents
	instanceVariableNames: 'valueElement nextElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackContents methodsFor: 'private' stamp: 'Porras 10/13/2022 04:14:37'!
valueElement
	^self subclassResponsibility.! !


!classDefinition: #BaseStack category: 'Stack-Exercise'!
OOStackContents subclass: #BaseStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseStack methodsFor: 'private' stamp: 'Porras 10/14/2022 07:03:47'!
valueElement
	
	self error:OOStack stackEmptyErrorDescription.! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
OOStackContents subclass: #StackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'initialization' stamp: 'Porras 10/13/2022 02:55:54'!
initializeWith:anValue nextElement:anNextElement
	valueElement :=anValue.
	nextElement :=anNextElement .! !


!StackElement methodsFor: 'private' stamp: 'Porras 10/13/2022 02:52:17'!
nextElement
	^nextElement.! !

!StackElement methodsFor: 'private' stamp: 'Porras 10/13/2022 02:50:52'!
valueElement
	^valueElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'private' stamp: 'Porras 10/13/2022 02:57:04'!
withValue:anValue nextElemet:anNext
	^self new initializeWith: anValue nextElement:anNext. ! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'Porras 10/14/2022 05:31:52'!
find:aPrefix in:anStack
	
	| foundSentences|
	
	foundSentences:=OrderedCollection new.
	self verify:aPrefix and: anStack.
	stack size timesRepeat: [
		|valueElement|
		valueElement := stack pop.
		(valueElement beginsWith: aPrefix ) ifTrue: [foundSentences add: valueElement ].
		].
	^foundSentences.
	

! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Porras 10/14/2022 07:09:10'!
verify:aPrefix and:aStack

	(aStack isEmpty)ifTrue:[self error:OOStack stackEmptyErrorDescription ].
	(aPrefix isEmpty) ifTrue: [self error: SentenceFinderByPrefix  prefixEmptyErrorDescription].
	(aPrefix includes: $ )ifTrue: [self error: SentenceFinderByPrefix prefixIncludesWhiteSpaceErrorDescription ].
	
	stack :=aStack copy.


! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'Porras 10/14/2022 03:51:35'!
prefixEmptyErrorDescription
	
	^ 'prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'Porras 10/14/2022 03:57:26'!
prefixIncludesWhiteSpaceErrorDescription
 	^'prefix includes white space'! !
