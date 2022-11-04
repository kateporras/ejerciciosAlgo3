!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:13:23'!
assertThatAMarsRoversWithInitialPosition:aInitialPoint andInitialCardinal:aInitialCardinal executeMove:aCommandSequence finalPosition: aFinalPoint andFinalCardinal:aFinalCardinal
	
	|marsRover|
	marsRover :=MarsRover withPosition:aInitialPoint andCardinal:aInitialCardinal.
	marsRover executeCommandSequence: aCommandSequence.
	self assert:(marsRover positionIsAt:aFinalPoint andCardinal:aFinalCardinal ). ! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:37:55'!
test01WithDirectionEastMovingForwardGoesEast

	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$E 
		executeMove: 'f' 
		finalPosition:(1@0)  andFinalCardinal:$E. ! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:38:11'!
test02WithDirectionEastMovingBackwardsGoesEast
	
	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$E  executeMove: 'b' finalPosition:(-1@0)  andFinalCardinal: $E.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:38:29'!
test03WithDirectionEastRotateLeftGoesNorth
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$E  executeMove: 'l' finalPosition:(3@3)  andFinalCardinal: $N.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:38:40'!
test04WithDirectionEastRotateRightGoesSouth
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$E  executeMove: 'r' finalPosition:(3@3)  andFinalCardinal: $S.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:35:55'!
test05WithDirectionNorthMovingForwardGoesNorth

	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$N 
		executeMove: 'f' 
		finalPosition:(0@1)  andFinalCardinal:$N. ! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:36:05'!
test06WithDirectionNorthMovingBackwardsGoesNorth
	
	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$N  executeMove: 'b' finalPosition:(0@-1)  andFinalCardinal: $N.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:36:37'!
test07WithDirectionNorthRotateLeftGoesWest
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$N  executeMove: 'l' finalPosition:(3@3)  andFinalCardinal: $O.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:36:49'!
test08WithDirectionNorthRotateRightGoesEast
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$N  executeMove: 'r' finalPosition:(3@3)  andFinalCardinal: $E.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:43:13'!
test09WithDirectionSouthMovingForwardGoesSouth

	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$S 
		executeMove: 'f' 
		finalPosition:(0@-1)  andFinalCardinal:$S. ! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:44:04'!
test10WithDirectionSouthMovingBackwardsGoesSouth
	
	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$S  executeMove: 'b' finalPosition:(0@1)  andFinalCardinal: $S.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:45:48'!
test11WithDirectionSouthRotateLeftGoesEast
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$S  executeMove: 'l' finalPosition:(3@3)  andFinalCardinal: $E.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:48:43'!
test12WithDirectionSouthRotateRightGoesWest
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$S  executeMove: 'r' finalPosition:(3@3)  andFinalCardinal: $O.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:50:41'!
test13WithDirectionWestMovingForwardGoesWest

	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$O 
		executeMove: 'f' 
		finalPosition:(-1@0)  andFinalCardinal:$O. ! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:51:47'!
test14WithDirectionWestMovingBackwardsGoesWest
	
	self assertThatAMarsRoversWithInitialPosition: 0@0 andInitialCardinal:$O  executeMove: 'b' finalPosition:(1@0)  andFinalCardinal: $O.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:52:41'!
test15WithDirectionWestRotateLeftGoesSouth
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$O  executeMove: 'l' finalPosition:(3@3)  andFinalCardinal: $S.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 02:53:29'!
test16WithDirectionWestRotateRightGoesNorth
	
	self assertThatAMarsRoversWithInitialPosition: 3@3 andInitialCardinal:$O  executeMove: 'r' finalPosition:(3@3)  andFinalCardinal: $N.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 03:20:49'!
test17ExecuteMultipleCommands
	
	self assertThatAMarsRoversWithInitialPosition: 7@5 andInitialCardinal:$E  executeMove: 'ffrbrr' finalPosition:(9@6)  andFinalCardinal: $N.! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 03:56:18'!
test18CanNotExecuteCommandsInvalid
	|marsRover|
	marsRover :=MarsRover withPosition:0@0 andCardinal:$N.
	self
	should: [marsRover executeCommandSequence: 'w']
	raise: Error
	withExceptionDo:[:anError| self assert: MoveCommand errorInvalidCommand equals:anError messageText ].
	! !

!MarsRoverTest methodsFor: 'test' stamp: 'Porras 11/4/2022 04:05:59'!
test19CanNotExecuteWithInvalidCardinalPoint
	self
	should: [MarsRover withPosition:0@0 andCardinal:$H.]
	raise: Error
	withExceptionDo:[:anError| self assert: Direction errorInvalidDirection equals:anError messageText ].
	! !


!classDefinition: #Direction category: 'MarsRover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direction methodsFor: 'movements in direction' stamp: 'Porras 11/3/2022 23:40:07'!
backwards
	^(self forward)*(-1).! !

!Direction methodsFor: 'movements in direction' stamp: 'Porras 11/3/2022 23:40:35'!
forward
	self subclassResponsibility.! !


!Direction methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:41:46'!
left
	self subclassResponsibility.! !

!Direction methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:41:57'!
right
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Direction class' category: 'MarsRover'!
Direction class
	instanceVariableNames: ''!

!Direction class methodsFor: 'private' stamp: 'Porras 11/3/2022 23:31:49'!
canInstantiateWith:aComandKey
	self subclassResponsibility.! !


!Direction class methodsFor: 'instance creation' stamp: 'Porras 11/4/2022 04:00:27'!
of:aDirection
	|subClass|
	
	subClass := self subclasses detect: [:aDirectionClass| aDirectionClass canInstantiateWith: aDirection ] 
	ifNone:[self error: self errorInvalidDirection ].
	^ subClass new.! !


!Direction class methodsFor: 'error' stamp: 'Porras 11/4/2022 04:00:03'!
errorInvalidDirection
	^'The direction is invalid'.! !


!classDefinition: #EastDirection category: 'MarsRover'!
Direction subclass: #EastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!EastDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:46:08'!
left
	^NorthDirection new.! !

!EastDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:46:30'!
right
	^SouthDirection new.! !


!EastDirection methodsFor: 'movements in direction' stamp: 'Porras 11/3/2022 23:45:03'!
forward
	^(1@0).! !


!EastDirection methodsFor: 'testing' stamp: 'Porras 11/4/2022 00:43:17'!
itsCardinalIs:aCardinal
	^(aCardinal=$E).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastDirection class' category: 'MarsRover'!
EastDirection class
	instanceVariableNames: ''!

!EastDirection class methodsFor: 'testing' stamp: 'Porras 11/3/2022 23:35:52'!
canInstantiateWith:aDirection
	^aDirection =$E.! !


!classDefinition: #NorthDirection category: 'MarsRover'!
Direction subclass: #NorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!NorthDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:48:57'!
left
	^WestDirection new.! !

!NorthDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:49:30'!
right
	^EastDirection new.! !


!NorthDirection methodsFor: 'movements in direction' stamp: 'Porras 11/3/2022 23:48:30'!
forward
	^(0@1).! !


!NorthDirection methodsFor: 'testing' stamp: 'Porras 11/4/2022 00:43:34'!
itsCardinalIs:aCardinal
	^(aCardinal=$N).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthDirection class' category: 'MarsRover'!
NorthDirection class
	instanceVariableNames: ''!

!NorthDirection class methodsFor: 'testing' stamp: 'Porras 11/3/2022 23:36:17'!
canInstantiateWith:aDirection
	^aDirection =$N.! !


!classDefinition: #SouthDirection category: 'MarsRover'!
Direction subclass: #SouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!SouthDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:52:39'!
left
	^EastDirection new.! !

!SouthDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:52:54'!
right
	^WestDirection new.! !


!SouthDirection methodsFor: 'movements in direction' stamp: 'Porras 11/3/2022 23:51:19'!
forward
	^(0@-1).! !


!SouthDirection methodsFor: 'testing' stamp: 'Porras 11/4/2022 00:43:52'!
itsCardinalIs:aCardinal
	^(aCardinal=$S).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthDirection class' category: 'MarsRover'!
SouthDirection class
	instanceVariableNames: ''!

!SouthDirection class methodsFor: 'testing' stamp: 'Porras 11/3/2022 23:36:46'!
canInstantiateWith:aDirection
	^aDirection =$S.! !


!classDefinition: #WestDirection category: 'MarsRover'!
Direction subclass: #WestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WestDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:54:36'!
left
	^SouthDirection new.! !

!WestDirection methodsFor: 'change direction' stamp: 'Porras 11/3/2022 23:54:56'!
right
	^NorthDirection new.! !


!WestDirection methodsFor: 'movements in direction' stamp: 'Porras 11/3/2022 23:54:10'!
forward
	^(-1@0).! !


!WestDirection methodsFor: 'testing' stamp: 'Porras 11/4/2022 00:44:06'!
itsCardinalIs:aCardinal
	^(aCardinal=$O).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestDirection class' category: 'MarsRover'!
WestDirection class
	instanceVariableNames: ''!

!WestDirection class methodsFor: 'testing' stamp: 'Porras 11/3/2022 23:37:23'!
canInstantiateWith:aDirection
	^aDirection =$O.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'Porras 11/3/2022 19:56:10'!
initializePosition:aPoint andCardinal:aDirection
	position := aPoint.
	direction :=aDirection.! !


!MarsRover methodsFor: 'execute command' stamp: 'Porras 11/4/2022 00:19:54'!
executeCommandSequence:aCommandSequence

	aCommandSequence do: [ :aCommandKey | (MoveCommand of: aCommandKey) executedBy: self].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'Porras 11/4/2022 02:06:31'!
positionIsAt:aPoint andCardinal:aCardinal
	
	^((aPoint = position )and:[direction itsCardinalIs: aCardinal]).! !


!MarsRover methodsFor: 'movements' stamp: 'Porras 11/4/2022 00:27:46'!
moveBackwards
	
	position := position + (direction backwards).! !

!MarsRover methodsFor: 'movements' stamp: 'Porras 11/4/2022 00:28:54'!
moveForward

	position := position + (direction forward ).! !

!MarsRover methodsFor: 'movements' stamp: 'Porras 11/4/2022 00:30:03'!
rotate90Left
	direction :=direction left.! !

!MarsRover methodsFor: 'movements' stamp: 'Porras 11/4/2022 00:30:29'!
rotate90Right
	direction :=direction right.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'Porras 11/4/2022 02:05:19'!
withPosition:aPoint andCardinal:aCardinal
	^(self new initializePosition: aPoint andCardinal:(Direction of:aCardinal ) ).! !


!classDefinition: #MoveCommand category: 'MarsRover'!
Object subclass: #MoveCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveCommand methodsFor: 'execution' stamp: 'Porras 11/4/2022 00:17:06'!
executedBy:aMarsRover
	self subclassResponsibility.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveCommand class' category: 'MarsRover'!
MoveCommand class
	instanceVariableNames: ''!

!MoveCommand class methodsFor: 'private' stamp: 'Porras 11/3/2022 21:21:02'!
canInstantiateWith:aComandKey
	self subclassResponsibility.! !


!MoveCommand class methodsFor: 'instance creation' stamp: 'Porras 11/4/2022 03:58:58'!
of:aCommandKey
	|subClass|
	
	subClass := self subclasses detect: [:aCommandClass| aCommandClass canInstantiateWith: aCommandKey ] 
	ifNone:[self error: self errorInvalidCommand].
	^ subClass new.
	


	
	
	! !


!MoveCommand class methodsFor: 'error' stamp: 'Porras 11/4/2022 03:55:03'!
errorInvalidCommand
	^'The command is invalid'.! !


!classDefinition: #MoveBackwards category: 'MarsRover'!
MoveCommand subclass: #MoveBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveBackwards methodsFor: 'execution' stamp: 'Porras 11/4/2022 00:18:04'!
executedBy:aMarsRover
	aMarsRover moveBackwards.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackwards class' category: 'MarsRover'!
MoveBackwards class
	instanceVariableNames: ''!

!MoveBackwards class methodsFor: 'testing' stamp: 'Porras 11/3/2022 22:43:10'!
canInstantiateWith:aComandKey
	^aComandKey =$b.! !


!classDefinition: #MoveForward category: 'MarsRover'!
MoveCommand subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MoveForward methodsFor: 'execution' stamp: 'Porras 11/4/2022 00:19:14'!
executedBy:aMarsRover
	aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'MarsRover'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'testing' stamp: 'Porras 11/3/2022 22:45:02'!
canInstantiateWith:aComandKey
	^aComandKey =$f.! !


!classDefinition: #Rotate90Left category: 'MarsRover'!
MoveCommand subclass: #Rotate90Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rotate90Left methodsFor: 'execution' stamp: 'Porras 11/4/2022 00:19:54'!
executedBy:aMarsRover
	aMarsRover rotate90Left.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rotate90Left class' category: 'MarsRover'!
Rotate90Left class
	instanceVariableNames: ''!

!Rotate90Left class methodsFor: 'testing' stamp: 'Porras 11/3/2022 22:45:52'!
canInstantiateWith:aComandKey
	^aComandKey =$l.! !


!classDefinition: #Rotate90Right category: 'MarsRover'!
MoveCommand subclass: #Rotate90Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rotate90Right methodsFor: 'execution' stamp: 'Porras 11/4/2022 00:19:54'!
executedBy:aMarsRover
	aMarsRover  rotate90Right.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rotate90Right class' category: 'MarsRover'!
Rotate90Right class
	instanceVariableNames: ''!

!Rotate90Right class methodsFor: 'testing' stamp: 'Porras 11/3/2022 22:46:33'!
canInstantiateWith:aComandKey
	^aComandKey =$r.! !
