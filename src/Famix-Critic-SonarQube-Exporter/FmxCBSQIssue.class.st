Class {
	#name : #FmxCBSQIssue,
	#superclass : #Object,
	#instVars : [
		'engineId',
		'ruleId',
		'severity',
		'type',
		'primaryLocation',
		'effortMinutes',
		'secondaryLocations'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-GenericIssueModel'
}

{ #category : #accessing }
FmxCBSQIssue >> effortMinutes [

	^ effortMinutes
]

{ #category : #accessing }
FmxCBSQIssue >> effortMinutes: anObject [

	effortMinutes := anObject
]

{ #category : #accessing }
FmxCBSQIssue >> engineId [

	^ engineId
]

{ #category : #accessing }
FmxCBSQIssue >> engineId: anObject [

	engineId := anObject
]

{ #category : #accessing }
FmxCBSQIssue >> primaryLocation [

	^ primaryLocation
]

{ #category : #accessing }
FmxCBSQIssue >> primaryLocation: anObject [

	primaryLocation := anObject
]

{ #category : #accessing }
FmxCBSQIssue >> ruleId [

	^ ruleId
]

{ #category : #accessing }
FmxCBSQIssue >> ruleId: anObject [

	ruleId := anObject
]

{ #category : #accessing }
FmxCBSQIssue >> secondaryLocations [

	^ secondaryLocations
]

{ #category : #accessing }
FmxCBSQIssue >> secondaryLocations: anObject [

	secondaryLocations := anObject
]

{ #category : #accessing }
FmxCBSQIssue >> severity [

	^ severity
]

{ #category : #accessing }
FmxCBSQIssue >> severity: anObject [

	severity := anObject
]

{ #category : #accessing }
FmxCBSQIssue >> type [

	^ type
]

{ #category : #accessing }
FmxCBSQIssue >> type: anObject [

	type := anObject
]
