Class {
	#name : #FmxCBSQLocation,
	#superclass : #Object,
	#instVars : [
		'message',
		'filePath',
		'textRange'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-GenericIssueModel'
}

{ #category : #accessing }
FmxCBSQLocation >> filePath [

	^ filePath
]

{ #category : #accessing }
FmxCBSQLocation >> filePath: anObject [

	filePath := anObject
]

{ #category : #accessing }
FmxCBSQLocation >> message [

	^ message
]

{ #category : #accessing }
FmxCBSQLocation >> message: anObject [

	message := anObject
]

{ #category : #accessing }
FmxCBSQLocation >> textRange [

	^ textRange
]

{ #category : #accessing }
FmxCBSQLocation >> textRange: anObject [

	textRange := anObject
]
