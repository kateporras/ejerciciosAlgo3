!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'tests' stamp: 'IL 10/1/2022 19:24:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'Porras 10/11/2022 04:03:29'!
test02VerificamosQueElUltimoMensajeEsElTop
	|stack firstPush lastPush|
	stack:=Stack new.
	firstPush:='soyElPrimeroQueIngreso'.
	lastPush:='soyElQueIngresoUltimo'.
	stack push: firstPush.
	stack push: lastPush.
	self assert: stack top = lastPush.
	! !

!StackTest methodsFor: 'tests' stamp: 'Porras 10/11/2022 11:50:59'!
test03SacoElUltimoAgregadoYDisminuyeCantidadDeElementos
|stack firstPush nextPush lastPush|
	stack:=Stack new.
	firstPush:='soyElPrimeroQueIngreso'.
	nextPush:='soyElSiguienteQueIngreso'.
	lastPush:='soyElQueIngresoUltimo'.
	stack push: firstPush.
	stack push: nextPush.
	stack push: lastPush.
	stack pop.
	self assert: stack top=nextPush.
	self assert: stack size =2.
	! !

!StackTest methodsFor: 'tests' stamp: 'Porras 10/11/2022 04:25:07'!
test04ConsultoElUltimoAgregadoSinDisminuirCantidadDeElementos
	|stack firstPush nextPush lastPush|
	stack:=Stack new.
	firstPush:='soyElPrimeroQueIngreso'.
	nextPush:='soyElSiguienteQueIngreso'.
	lastPush:='soyElQueIngresoUltimo'.
	stack push: firstPush.
	stack push: nextPush.
	stack push: lastPush.
	
	self assert: stack top=lastPush.
	self assert: stack size =3.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'initialization' stamp: 'Porras 10/11/2022 02:56:48'!
initialize
	
	contents := OrderedCollection new.
! !


!Stack methodsFor: 'accessing' stamp: 'Porras 10/11/2022 03:17:57'!
pop
	^(contents removeFirst ).! !

!Stack methodsFor: 'accessing' stamp: 'Porras 10/11/2022 03:14:35'!
push:element
	"como tengo un OrderedCollection para que actue como un stack lo que hago es agregar siempre en la primera posicion"
	contents addFirst:element.! !

!Stack methodsFor: 'accessing' stamp: 'Porras 10/11/2022 03:18:26'!
top
	^(contents first ).! !


!Stack methodsFor: 'private' stamp: 'Porras 10/11/2022 03:07:06'!
isEmpty 
	^(contents size =0).! !

!Stack methodsFor: 'private' stamp: 'Porras 10/11/2022 04:21:39'!
size
	^(contents size).! !
