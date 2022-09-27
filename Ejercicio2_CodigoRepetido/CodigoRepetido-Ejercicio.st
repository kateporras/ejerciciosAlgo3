!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerAlreadyExistsError category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerAlreadyExistsError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerAlreadyExistsError methodsFor: 'as yet unclassified' stamp: 'Porras 9/27/2022 06:09:30'!
messageText
	^self class customerAlreadyExistsErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerAlreadyExistsError class' category: 'CodigoRepetido-Ejercicio'!
CustomerAlreadyExistsError class
	instanceVariableNames: ''!

!CustomerAlreadyExistsError class methodsFor: 'as yet unclassified' stamp: 'Porras 9/27/2022 06:08:48'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !


!classDefinition: #CustomerNameBeEmptyError category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerNameBeEmptyError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerNameBeEmptyError methodsFor: 'as yet unclassified' stamp: 'Porras 9/27/2022 05:22:30'!
messageText
	^self class customerCanNotBeEmptyErrorMessage.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerNameBeEmptyError class' category: 'CodigoRepetido-Ejercicio'!
CustomerNameBeEmptyError class
	instanceVariableNames: ''!

!CustomerNameBeEmptyError class methodsFor: 'as yet unclassified' stamp: 'Porras 9/27/2022 05:20:46'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 03:40:52'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook  |
	
	customerBook := CustomerBook addCustomerNamed: 'John Lennon'.
	
	self assert: (Time millisecondsToRun: customerBook) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 03:42:01'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook  |
	
	customerBook := CustomerBook addCustomerNamed:'Paul McCartney'.
	
	
	self assert:  (Time millisecondsToRun: (customerBook removeCustomerNamed: 'Paul McCartney'))< (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 06:06:55'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
		
	[customerBook := CustomerBook addCustomerNamed: ''.]
		on: CustomerNameBeEmptyError  
		do: [ :anError | 
			self assert: anError messageText = 'Customer Name Cannot Be Empty'.
			self assert: customerBook isEmpty.]
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 05:55:54'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook|
	customerBook := CustomerBook addCustomerNamed: 'John Lennon'.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 05:49:57'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook|
	
	customerBook := CustomerBook addCustomerNamed:'Paul McCartney'.
	
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 05:51:32'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook|
	
	customerBook := CustomerBook addCustomerNamed:'Paul McCartney'.
	
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 05:52:55'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook|
			
	customerBook := CustomerBook addCustomerNamed:'John Lennon'.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Porras 9/27/2022 06:15:42'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook|
			
	customerBook := CustomerBook addCustomerNamed:'John Lennon'.
	
	customerBook suspendCustomerNamed: 'John Lennon'.
	
	[ customerBook suspendCustomerNamed: 'John Lennon'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Porras 9/27/2022 06:11:48'!
addCustomerNamed: aName

	|errorName errorExists|
	errorName:=CustomerNameBeEmptyError new.
	errorExists:=CustomerAlreadyExistsError  new.
	 aName isEmpty ifTrue: [ errorName messageText ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ errorExists messageText ].
	
	active add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'class initialization' stamp: 'Porras 9/27/2022 03:39:39'!
addCustomerNamed: aName
	^ self new addCustomerNamed: aName.! !
