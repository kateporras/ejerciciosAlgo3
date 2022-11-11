!classDefinition: #PortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTests methodsFor: 'tests' stamp: 'fn 11/10/2022 10:26:27'!
createPortfolioWithAnAccountHaving: anAmount

	|portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: anAmount on: account.
	portfolio register: account.
	^portfolio
! !

!PortfolioTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:15:25'!
test01EmptyPortfolioHasABalanceOfZero

	|portfolio|
	
	portfolio := Portfolio new.
	self assert: portfolio balance equals: 0.! !

!PortfolioTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:15:30'!
test02PortfolioWithAnAccountHasTheSameBalanceAsTheAccount

	|portfolio |
	
	portfolio := self createPortfolioWithAnAccountHaving: 1000*peso.
	
	self assert: portfolio balance equals: 1000*peso.! !

!PortfolioTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:15:37'!
test03PortfolioWithAnAccountAndWithASubportfolioHasTheSameBalanceAsTheSumOfBoth

	|portfolio subportfolio |
		
	portfolio := self createPortfolioWithAnAccountHaving: 1000*peso.
	subportfolio := self createPortfolioWithAnAccountHaving: 1000*peso.

	portfolio register: subportfolio.
	
	self assert: portfolio balance equals: 2000*peso.! !

!PortfolioTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:15:48'!
test04PortfolioRegistersThatTheDepositHasBeenMade

	|portfolio account deposit|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 1000 * peso on: account.
	portfolio register: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:15:55'!
test05PortfolioCanTellAllTheTransactionsWithinTheAccountAndSubportfolio

	|portfolio account subportfolio subaccount deposit transactions withdrawal |
	subportfolio := Portfolio new.
	subaccount := ReceptiveAccount new.
	withdrawal := Withdraw register: 500 * peso on: subaccount.
	subportfolio register: subaccount.
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 1000 * peso on: account.
	portfolio register: account.
	
	
	portfolio register: subportfolio.
	
	transactions := portfolio transactions.
	
	self assert: transactions includes: deposit.
	self assert: transactions includes: withdrawal.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTests
	instanceVariableNames: 'transferedAccount transferingAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTests methodsFor: 'tests' stamp: 'fn 11/9/2022 12:07:57'!
assertThatBalanceOf: anAccountBalance inTransferenceOfValue: aTransferenceAmount from: aTransferingAccount to: aTransferedAccount equals: aTransferencePartyExpectedAmount.


	Transference transfer: aTransferenceAmount from: aTransferingAccount to: aTransferedAccount.
	self assert: aTransferencePartyExpectedAmount equals: (anAccountBalance balance).
! !

!TransferenceTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:18:11'!
test01BalanceOfTransferedAccountCorrespondsWithItsRoleOnTheTransactionAndItsValue
	self assertThatBalanceOf: transferedAccount inTransferenceOfValue: 1000*peso from: transferingAccount to: transferedAccount equals: 1000*peso.
! !

!TransferenceTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:19:02'!
test02BalanceOfTransferingAccountCorrespondsWithItsRoleOnTheTransactionAndItsValue
	self assertThatBalanceOf: transferingAccount inTransferenceOfValue: 1000*peso from: transferingAccount to: transferedAccount equals: -1000*peso.

! !

!TransferenceTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:21:47'!
test03TransferenceKeepsRecordOfItsValue
	| transference |

	transference := Transference transfer: 1000*peso from: transferingAccount to: transferedAccount.
	self assert: 1000*peso  equals: transference transferenceValue.! !

!TransferenceTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:22:58'!
test04TransferedPartyKnowsItsCounterpart
	| transference |


	transference := Transference transfer: 1000*peso from: transferingAccount to: transferedAccount.
	self assert: transference transferedParty counterpart equals: transference transferingParty.! !

!TransferenceTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:23:27'!
test05TransferingPartyKnowsItsCounterpart
	| transference|

	transference := Transference transfer: 1000*peso from: transferingAccount to: transferedAccount.
	self assert: transference transferedParty equals: transference transferingParty counterpart.! !

!TransferenceTests methodsFor: 'tests' stamp: 'fn 11/10/2022 12:25:55'!
test06ThereCanNotBeATransferenceOfAnAmountWithANegativeValue
	| transference|

	transference := [Transference transfer: -1000*peso from: transferingAccount to: transferedAccount].
	self should: transference raise: Error withExceptionDo: [ :error | self assert: error messageText equals: Transference canNotTransferNegativeAmountMessageError].! !


!TransferenceTests methodsFor: 'setup' stamp: 'fn 11/9/2022 11:33:08'!
setUp

	transferedAccount := ReceptiveAccount new.
	transferingAccount := ReceptiveAccount new.! !


!classDefinition: #AccountManagement category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountManagement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountManagement methodsFor: 'main protocol' stamp: 'fn 11/9/2022 15:21:17'!
balance
	
	self subclassResponsibility 
! !

!AccountManagement methodsFor: 'main protocol' stamp: 'fn 11/9/2022 15:21:50'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!AccountManagement methodsFor: 'main protocol' stamp: 'fn 11/9/2022 15:24:05'!
transactions
	 self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
AccountManagement subclass: #Portfolio
	instanceVariableNames: 'services'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'fn 11/10/2022 09:45:46'!
balance
	
	^services sum: [ :aService | aService balance] ifEmpty: [ 0 ]
! !

!Portfolio methodsFor: 'main protocol' stamp: 'fn 11/10/2022 09:45:46'!
hasRegistered: aTransaction

	^ services anySatisfy: [:aService | aService hasRegistered: aTransaction].
! !

!Portfolio methodsFor: 'main protocol' stamp: 'fn 11/10/2022 09:45:46'!
register: aService

	services add: aService 
! !

!Portfolio methodsFor: 'main protocol' stamp: 'fn 11/10/2022 10:09:52'!
transactions
	| transactions |
	transactions := OrderedCollection new.
	services do:[:aService| transactions addAllLast: (aService transactions)].
	^transactions.! !


!Portfolio methodsFor: 'initilalization' stamp: 'fn 11/10/2022 09:45:46'!
initialize

	services := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
AccountManagement subclass: #ReceptiveAccount
	instanceVariableNames: 'counterpart transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'fn 11/9/2022 15:40:41'!
balance
	
	^transactions sum: [ :aTransaction | aTransaction relativeValue ] ifEmpty: [ 0 ]
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'fn 11/9/2022 15:19:50'!
counterpart

	^counterpart.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'fn 11/4/2022 19:30:02'!
relativeValue
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'fn 11/9/2022 09:49:22'!
register: aValue on: account
	| transaction |
	transaction := self for: aValue.
	account register: transaction.

	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value counterpart transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'fn 11/9/2022 11:01:18'!
initializeFor: aValue
	(aValue isKindOf: Transference ) ifTrue: [value := aValue transferenceValue. counterpart := aValue transferingParty.
		transference := aValue].

	(aValue isKindOf: Transference ) = false ifTrue: [value := aValue].
	 ! !


!Deposit methodsFor: 'value' stamp: 'fn 11/8/2022 16:07:22'!
relativeValue
	^value.! !

!Deposit methodsFor: 'value' stamp: 'fn 11/8/2022 16:07:17'!
value

	^value! !


!Deposit methodsFor: 'accessing' stamp: 'fn 11/9/2022 10:59:22'!
counterpart
	transference ifNil: [^self].
	^transference transferingParty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'fn 11/8/2022 16:09:20'!
for: aValue

	^ self new initializeFor: aValue.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value counterpart transferedAccount transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'fn 11/9/2022 11:04:49'!
initializeFor: aValue
	(aValue isKindOf: Transference ) ifTrue: [value := aValue transferenceValue. counterpart := aValue transferedParty.
		transference := aValue].

	(aValue isKindOf: Transference ) = false ifTrue: [value := aValue].
	 ! !

!Withdraw methodsFor: 'initialization' stamp: 'fn 11/9/2022 10:57:44'!
initializeFor: aValue with: aTransferedAccount 
	value := aValue transferenceValue.
	counterpart := aTransferedAccount.! !


!Withdraw methodsFor: 'value' stamp: 'fn 11/8/2022 16:07:33'!
relativeValue
	^value negated.! !

!Withdraw methodsFor: 'value' stamp: 'fn 11/8/2022 16:06:56'!
value

	^value! !


!Withdraw methodsFor: 'accessing' stamp: 'fn 11/9/2022 11:04:49'!
counterpart
	transference ifNil: [^self].
	^transference transferedParty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'transferenceValue transferingParty transferedParty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'fn 11/9/2022 10:59:28'!
initializeTransfer: anAmount
	transferenceValue := anAmount.
	transferingParty := Withdraw for: self.
	transferedParty := Deposit for: self.
! !


!Transference methodsFor: 'accessing' stamp: 'fn 11/9/2022 11:04:48'!
transferedParty

	^transferedParty! !

!Transference methodsFor: 'accessing' stamp: 'fn 11/9/2022 10:57:44'!
transferenceValue
	
	^transferenceValue.! !

!Transference methodsFor: 'accessing' stamp: 'fn 11/9/2022 10:59:28'!
transferingParty

	^transferingParty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'fn 11/9/2022 14:50:31'!
transfer: anAmount from: aTransferingAccount to: aTransferedAccount 
	|transference|
	anAmount < 0 ifTrue: [self error: self canNotTransferNegativeAmountMessageError].
	transference := self new initializeTransfer: anAmount.
	aTransferingAccount register: transference transferingParty.
	aTransferedAccount  register: transference transferedParty.
	^ transference.
	 ! !


!Transference class methodsFor: 'error message' stamp: 'fn 11/9/2022 14:50:34'!
canNotTransferNegativeAmountMessageError

	^'canNotTransferNegativeAmountMessageError'.! !
