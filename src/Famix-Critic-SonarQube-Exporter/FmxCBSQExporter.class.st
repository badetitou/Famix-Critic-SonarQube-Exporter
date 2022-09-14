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
		'defaultEffortMinutes',
		'withFileNamePrefix',
		'modules'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-Exporter'
}

{ #category : #'api - convert' }
FmxCBSQExporter >> buildPrimaryLocationFor: aFamixCBViolation [

	| location fileName |
	location := FmxCBSQLocation new.
	location message: aFamixCBViolation violatedCondition summary.
	fileName := aFamixCBViolation violatingEntity sourceAnchor fileName.
	self modules do: [ :module | 
		fileName := fileName withoutPrefix: module ].
	location filePath: self withFileNamePrefix , fileName.
	location textRange: (self buildTextRangeFor: aFamixCBViolation).
	^ location
]

{ #category : #'api - convert' }
FmxCBSQExporter >> buildTextRangeFor: aFamixCBViolation [

	| text start end |
	text := aFamixCBViolation violatingEntity sourceAnchor completeText.
	start := text fmxCBSQToLineCharacter:
		         aFamixCBViolation violatingEntity sourceAnchor startPos.
	end := text fmxCBSQToLineCharacter:
		       aFamixCBViolation violatingEntity sourceAnchor endPos.
	^ FmxCBSQTextRange new
		  startLine: (start at: #line) + 1;
		  startColumn: (start at: #character);
		  endLine: (end at: #line) + 1;
		  endColumn: (end at: #character);
		  yourself
]

{ #category : #'api - convert' }
FmxCBSQExporter >> convertViolation: aFamixCBViolation [

	| sonarIssue |
	sonarIssue := FmxCBSQIssue new.
	sonarIssue engineId: self engineId.
	sonarIssue severity: self defaultSeverity.
	sonarIssue effortMinutes: self defaultEffortMinutes.
	sonarIssue type: self defaultType.
	sonarIssue ruleId: (aFamixCBViolation violatedCondition name
			 copyReplaceAll: ''''
			 with: '').
	sonarIssue primaryLocation:
		(self buildPrimaryLocationFor: aFamixCBViolation).
	^ sonarIssue
]

{ #category : #'api - convert' }
FmxCBSQExporter >> convertViolations: aCollectionOfViolations [

	| issueCollection |
	issueCollection := FmxCBSQIssueCollection new.
	aCollectionOfViolations
		select: [ :violation | 
		violation violatingEntity sourceAnchor isNotNil ]
		thenDo: [ :violation | 
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
	sonarIssues := self convertViolations: self violations.
	self exportSonarIssues: sonarIssues 
]

{ #category : #'api - export' }
FmxCBSQExporter >> exportSonarIssues: sonarIssues [

	self targetFileReference writeStreamDo: [ :writeStream | 
		self exportSonarIssues: sonarIssues on: writeStream ]
]

{ #category : #'api - export' }
FmxCBSQExporter >> exportSonarIssues: sonarIssues on: stream [

	(NeoJSONWriter on: stream)
		prettyPrint: true;
		mapInstVarsFor: FmxCBSQIssueCollection;
		mapInstVarsFor: FmxCBSQIssue;
		mapInstVarsFor: FmxCBSQLocation;
		mapInstVarsFor: FmxCBSQTextRange;
		nextPut: sonarIssues
]

{ #category : #api }
FmxCBSQExporter >> initialize [
	super initialize.
	self engineId: 'Moose'.
	self defaultSeverity: FmxCBSQIssue issueSeverityMajor.
	self defaultType: FmxCBSQIssue issueTypeCodeSmell.
	self defaultEffortMinutes: 0.
	self withFileNamePrefix: ''.
	self modules: OrderedCollection new
]

{ #category : #accessing }
FmxCBSQExporter >> modules [

	"Return the collection of submodules. It is usefull when having modules maven projects"

	^ modules
]

{ #category : #accessing }
FmxCBSQExporter >> modules: anObject [

	modules := anObject
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

{ #category : #accessing }
FmxCBSQExporter >> withFileNamePrefix [

	^ withFileNamePrefix
]

{ #category : #accessing }
FmxCBSQExporter >> withFileNamePrefix: anObject [

	withFileNamePrefix := anObject
]
