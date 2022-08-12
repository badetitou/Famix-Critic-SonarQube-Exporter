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
		'engineId'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-Exporter'
}

{ #category : #api }
FmxCBSQExporter >> convertViolation: aFamixCBViolation [
	| sonarIssue |
	sonarIssue := FmxCBSQIssue new.
	sonarIssue engineId: self engineId.
	^ sonarIssue
]

{ #category : #api }
FmxCBSQExporter >> convertViolations: aCollectionOfViolations [
	| issues |
	issues := FmxCBSQIssueCollection new.
	^ issues
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
	self engineId: 'Moose'
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
