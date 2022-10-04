!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'Porras 10/2/2022 17:05:08'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'Porras 10/3/2022 22:30:30'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'Porras 10/2/2022 16:48:53'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/2/2022 16:03:51'!
adderByEntero:anEntero
	^self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/3/2022 12:46:41'!
dividedByEntero:unEntero
	^self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/2/2022 04:01:14'!
multiplyByEntero:anInteger
	^self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/3/2022 05:21:25'!
subtractWithEntero:unEntero
	^self subclassResponsibility.! !


!Numero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/2/2022 16:03:33'!
adderByFraccion:unaFraccion
	^self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/3/2022 13:59:22'!
dividedByFraccion:unaFraccion
	^self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/2/2022 04:01:06'!
multiplyByFraccion:unaFraccion
	^self subclassResponsibility .! !

!Numero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/3/2022 05:22:23'!
subtractWithFraccion:unaFraccion
	^self subclassResponsibility.! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:22:22'!
* aMultiplier 
	
	^(aMultiplier multiplyByEntero:self).
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:22:31'!
+ anAdder 
	
	^ (anAdder adderByEntero: self).
	
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:22:39'!
- aSubtrahend 
	
	
	^(aSubtrahend subtractWithEntero: self).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:22:45'!
/ aDivisor 
	
	
	^(aDivisor dividedByEntero:self).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:22:53'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'Porras 10/4/2022 02:23:23'!
isNegative

	^false.! !

!Entero methodsFor: 'testing' stamp: 'Porras 10/4/2022 02:23:30'!
isOne

	^false.! !

!Entero methodsFor: 'testing' stamp: 'Porras 10/4/2022 02:23:36'!
isZero
	
	^false.! !


!Entero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/2/2022 15:58:47'!
adderByFraccion:unaFraccion
	|auxNum|
	auxNum :=unaFraccion numerator + (unaFraccion denominator * self ).
	
	^(auxNum /unaFraccion denominator ).! !

!Entero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/3/2022 13:36:30'!
dividedByFraccion:unaFraccionDividendo
	^((Entero with: 1)/self  multiplyByFraccion:unaFraccionDividendo ).! !

!Entero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/2/2022 04:13:39'!
multiplyByFraccion:anFraction
	|auxNum|
	auxNum := anFraction numerator  * self.
	
	^(auxNum / anFraction denominator).
! !

!Entero methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/3/2022 05:33:51'!
subtractWithFraccion:unaFraccion
	^(self negated adderByFraccion: unaFraccion ).! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'Porras 10/4/2022 02:22:00'!
// aDivisor 

	^Entero with:(self integerValue // aDivisor integerValue ). ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'Porras 10/4/2022 02:22:09'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (self integerValue gcd: anEntero integerValue ).! !


!Entero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/2/2022 15:34:27'!
adderByEntero:anEntero
	^(Entero with: anEntero integerValue +self integerValue ).! !

!Entero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/4/2022 02:04:14'!
dividedByEntero:unEnteroDividendo
	|mcd numerator denominator|
	
	mcd := unEnteroDividendo greatestCommonDivisorWith: self. 
	numerator := unEnteroDividendo // mcd.
	denominator := self // mcd.
	^denominator dividedByUnoOEntero: numerator .! !

!Entero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/4/2022 01:55:40'!
dividedByUnoOEntero:unDividendo
	^Fraccion with: unDividendo over:self. ! !

!Entero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/2/2022 03:12:09'!
multiplyByEntero:anInteger
	^(Entero with: anInteger integerValue * self integerValue).
! !

!Entero methodsFor: 'arithmetic operations Entero' stamp: 'Porras 10/3/2022 05:31:27'!
subtractWithEntero:unEntero
	^(self negated adderByEntero: unEntero ).! !


!Entero methodsFor: 'errorDescripcion' stamp: 'Porras 10/4/2022 02:58:47'!
errorElNumeroEsUnCero
	^nil.! !

!Entero methodsFor: 'errorDescripcion' stamp: 'Porras 10/4/2022 02:59:30'!
errorElNumeroEsUno
	^nil.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'Porras 10/3/2022 20:18:13'!
valueInicialize:aValue
	self subclassResponsibility.! !

!Entero class methodsFor: 'instance creation' stamp: 'Porras 10/4/2022 02:15:29'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	|subClass |
	"Seleccion la subclase"
	subClass :=self subclasses detect:[:eClass|eClass valueInicialize: aValue] ifNone: [self error: self invalidNumberTypeErrorDescription ].
	"instacia a la subclass que corresponde"
	^(subClass new initializeWith: aValue).
	! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'testing' stamp: 'Porras 10/3/2022 19:56:40'!
isZero
	^true.
! !


!Cero methodsFor: 'arithmetic operations' stamp: 'Porras 10/3/2022 15:59:51'!
fibonacci 
	^(Entero with: 1).! !


!Cero methodsFor: 'errorDescripcion' stamp: 'Porras 10/4/2022 02:48:13'!
errorElNumeroEsUnCero
	self error:'una fraccion no puede ser cero'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'Porras 10/3/2022 18:37:43'!
valueInicialize:aValue
	^(aValue = 0).! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'Porras 10/3/2022 16:03:49'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription.! !


!Negativo methodsFor: 'testing' stamp: 'Porras 10/4/2022 02:29:40'!
isNegative

	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'instance creation' stamp: 'Porras 10/3/2022 18:39:06'!
valueInicialize:aValeu
	^(aValeu < 0).! !


!classDefinition: #PositivoMayorA1 category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #PositivoMayorA1
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositivoMayorA1 class' category: 'Numeros-Parte2-Ejercicio'!
PositivoMayorA1 class
	instanceVariableNames: ''!

!PositivoMayorA1 class methodsFor: 'instance creation' stamp: 'Porras 10/4/2022 02:01:46'!
valueInicialize:aValeu
	^(aValeu > 1).! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'arithmetic operations' stamp: 'Porras 10/3/2022 22:43:47'!
fibonacci
	^(Entero with:1).! !


!Uno methodsFor: 'testing' stamp: 'Porras 10/3/2022 22:49:44'!
isOne
	^true.! !


!Uno methodsFor: 'arithmetic operations Enteros' stamp: 'Porras 10/4/2022 01:53:14'!
dividedByUnoOEntero:unNum
	^unNum! !


!Uno methodsFor: 'errorDescripcion' stamp: 'Porras 10/4/2022 02:47:27'!
errorElNumeroEsUno
	self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'Porras 10/3/2022 22:46:29'!
valueInicialize:aValue
	^(aValue = 1).! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:27:18'!
* aMultiplier 
	^(aMultiplier multiplyByFraccion: self).
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:27:29'!
+ anAdder 
	
	^(anAdder adderByFraccion: self).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:27:37'!
- aSubtrahend 
	
	^(aSubtrahend subtractWithFraccion:self).
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Porras 10/4/2022 02:27:46'!
/ aDivisor 
	
	^(aDivisor dividedByFraccion: self).! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'Porras 10/4/2022 03:00:07'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	
	aNumerator errorElNumeroEsUnCero .
	aDenominator errorElNumeroEsUno.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/2/2022 15:53:08'!
adderByFraccion:unaFraccion
	|auxNumerator auxDenominator|
	
	auxNumerator := (unaFraccion numerator * self denominator)+(unaFraccion denominator * self numerator ).
	auxDenominator := unaFraccion denominator *self denominator .
	
	^(auxNumerator / auxDenominator ).! !

!Fraccion methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/3/2022 13:57:56'!
dividedByFraccion:unaFraccionDividendo
	|auxNum auxDeno|
	auxNum := unaFraccionDividendo numerator * self denominator.
	auxDeno := unaFraccionDividendo denominator *self numerator.
	^(auxNum / auxDeno ).! !

!Fraccion methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/2/2022 04:16:45'!
multiplyByFraccion:unaFraccion
	|auxNumerator auxDenominator|
	
	auxNumerator :=self numerator * unaFraccion numerator.
	auxDenominator := self denominator * unaFraccion denominator.

	^(auxNumerator / auxDenominator ).! !

!Fraccion methodsFor: 'arithmetic operations Fraccion' stamp: 'Porras 10/3/2022 05:29:00'!
subtractWithFraccion:unaFraccion
	^(self negated adderByFraccion: unaFraccion ).! !


!Fraccion methodsFor: 'arithmetic operations Enteros' stamp: 'Porras 10/2/2022 15:45:59'!
adderByEntero:unEntero
	^(unEntero adderByFraccion: self).! !

!Fraccion methodsFor: 'arithmetic operations Enteros' stamp: 'Porras 10/3/2022 14:13:26'!
dividedByEntero:unEnteroDividendo
	^((unEnteroDividendo * self denominator )/self numerator  ).! !

!Fraccion methodsFor: 'arithmetic operations Enteros' stamp: 'Porras 10/2/2022 03:58:51'!
multiplyByEntero:unEntero

	^(unEntero multiplyByFraccion: self).

	! !

!Fraccion methodsFor: 'arithmetic operations Enteros' stamp: 'Porras 10/3/2022 05:11:33'!
subtractWithEntero:unEntero
	^(self negated adderByEntero: unEntero).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
