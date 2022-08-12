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

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueSeverityBlocker [

	^ 'BLOCKER'
]

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueSeverityCritical [

	^ 'CRITICAL'
]

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueSeverityInfo [

	^ 'INFO'
]

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueSeverityMajor [

	^ 'MAJOR'
]

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueSeverityMinor [

	^ 'MINOR'
]

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueTypeBug [

	^ 'BUG'
]

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueTypeCodeSmell [

	^ 'CODE_SMELL'
]

{ #category : #'as yet unclassified' }
FmxCBSQIssue class >> issueTypeVulnerability [

	^ 'VULNERABILITY'
]

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
