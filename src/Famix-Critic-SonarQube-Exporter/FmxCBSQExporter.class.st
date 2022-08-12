"
This class is a utility class that takes as input Critics and export them to the [SonarQube generic issue format](https://docs.sonarqube.org/latest/analysis/generic-issue/).

Using this exporter, you can import critics provided by Moose inside SonarQube.

## Usage

After the creation of some violations.
Give me the violations as well as the file in which I will export the issues.

```st
FmxCBSQExporter new
	violations: someViolations;
	targetFileReference: aFileReference;
	export
```
"
Class {
	#name : #FmxCBSQExporter,
	#superclass : #Object,
	#instVars : [
		'violations',
		'targetFileReference',
		'engineId',
		'defaultType',
		'defaultSeverity',
		'defaultEffortMinutes'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-Exporter'
}

{ #category : #api }
FmxCBSQExporter >> buildPrimaryLocationFor: aFamixCBViolation [
	| location |
	location := FmxCBSQLocation new.
	location message: aFamixCBViolation violatedCondition summary.
	location filePath: (aFamixCBViolation violatingEntity sourceAnchor fileName).
	location textRange: (self buildTextRangeFor: aFamixCBViolation).
	^ location
]

{ #category : #api }
FmxCBSQExporter >> buildTextRangeFor: aFamixCBViolation [

	^ FmxCBSQTextRange new
		  startLine: 1;
		  yourself
]

{ #category : #api }
FmxCBSQExporter >> convertViolation: aFamixCBViolation [

	| sonarIssue |
	sonarIssue := FmxCBSQIssue new.
	sonarIssue engineId: self engineId.
	sonarIssue severity: self defaultSeverity.
	sonarIssue effortMinutes: self defaultEffortMinutes.
	sonarIssue type: self defaultType.
	sonarIssue ruleId: aFamixCBViolation violatedCondition name.
	sonarIssue primaryLocation: (self buildPrimaryLocationFor: aFamixCBViolation).
	^ sonarIssue
]

{ #category : #api }
FmxCBSQExporter >> convertViolations: aCollectionOfViolations [

	| issueCollection |
	issueCollection := FmxCBSQIssueCollection new.
	aCollectionOfViolations do: [ :violation | 
		issueCollection issues add: (self convertViolation: violation) ].
	^ issueCollection
]

{ #category : #accessing }
FmxCBSQExporter >> defaultEffortMinutes [

	^ defaultEffortMinutes
]

{ #category : #accessing }
FmxCBSQExporter >> defaultEffortMinutes: anObject [

	defaultEffortMinutes := anObject
]

{ #category : #accessing }
FmxCBSQExporter >> defaultSeverity [

	^ defaultSeverity
]

{ #category : #accessing }
FmxCBSQExporter >> defaultSeverity: anObject [

	defaultSeverity := anObject
]

{ #category : #accessing }
FmxCBSQExporter >> defaultType [

	^ defaultType
]

{ #category : #accessing }
FmxCBSQExporter >> defaultType: anObject [

	defaultType := anObject
]

{ #category : #accessing }
FmxCBSQExporter >> engineId [

	^ engineId
]

{ #category : #accessing }
FmxCBSQExporter >> engineId: anObject [

	engineId := anObject
]

{ #category : #api }
FmxCBSQExporter >> export [

	| sonarIssues |
	sonarIssues := self convertViolations: self violations
]

{ #category : #api }
FmxCBSQExporter >> initialize [
	super initialize.
	self engineId: 'Moose'.
	self defaultSeverity: FmxCBSQIssue issueSeverityMajor.
	self defaultType: FmxCBSQIssue issueTypeCodeSmell.
	self defaultEffortMinutes: 0
]

{ #category : #accessing }
FmxCBSQExporter >> targetFileReference [

	^ targetFileReference
]

{ #category : #accessing }
FmxCBSQExporter >> targetFileReference: anObject [

	targetFileReference := anObject
]

{ #category : #accessing }
FmxCBSQExporter >> violations [

	^ violations
]

{ #category : #accessing }
FmxCBSQExporter >> violations: anObject [

	violations := anObject
]
