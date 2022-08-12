Class {
	#name : #FmxCBSQIssueCollection,
	#superclass : #Object,
	#instVars : [
		'issues'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-GenericIssueModel'
}

{ #category : #accessing }
FmxCBSQIssueCollection >> initialize [

	super initialize.
	issues := OrderedCollection new
]

{ #category : #accessing }
FmxCBSQIssueCollection >> issues [

	^ issues
]

{ #category : #accessing }
FmxCBSQIssueCollection >> issues: anObject [

	issues := anObject
]
