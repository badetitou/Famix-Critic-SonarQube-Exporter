Class {
	#name : #FmxCBSQTextRange,
	#superclass : #Object,
	#instVars : [
		'startLine',
		'endLine',
		'startColumn',
		'endColumn'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-GenericIssueModel'
}

{ #category : #accessing }
FmxCBSQTextRange >> endColumn [

	^ endColumn
]

{ #category : #accessing }
FmxCBSQTextRange >> endColumn: anObject [

	endColumn := anObject
]

{ #category : #accessing }
FmxCBSQTextRange >> endLine [

	^ endLine
]

{ #category : #accessing }
FmxCBSQTextRange >> endLine: anObject [

	endLine := anObject
]

{ #category : #accessing }
FmxCBSQTextRange >> startColumn [

	^ startColumn
]

{ #category : #accessing }
FmxCBSQTextRange >> startColumn: anObject [

	startColumn := anObject
]

{ #category : #accessing }
FmxCBSQTextRange >> startLine [

	^ startLine
]

{ #category : #accessing }
FmxCBSQTextRange >> startLine: anObject [

	startLine := anObject
]
