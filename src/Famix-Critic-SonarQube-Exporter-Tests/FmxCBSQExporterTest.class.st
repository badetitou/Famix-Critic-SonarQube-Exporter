"
A FmxCBSQExporterTest is a test class for testing the behavior of FmxCBSQExporter
"
Class {
	#name : #FmxCBSQExporterTest,
	#superclass : #TestCase,
	#instVars : [
		'exporter'
	],
	#category : #'Famix-Critic-SonarQube-Exporter-Tests-Exporter'
}

{ #category : #running }
FmxCBSQExporterTest >> setUp [

	super setUp.
	exporter := FmxCBSQExporter new
]

{ #category : #test }
FmxCBSQExporterTest >> testConvertViolation [

	| issue famixViolation famixCondition famixEntity famixEntitySourceAnchor famixModel |
	famixModel := FamixJavaModel new.
	famixViolation := FamixCBViolation new.
	famixCondition := FamixCBCondition new.
	famixEntity := FamixJavaClass new.
	famixEntitySourceAnchor := FamixJavaIndexedFileAnchor new.
	famixEntity sourceAnchor: famixEntitySourceAnchor.
	famixEntitySourceAnchor startPos: 0.
	famixEntitySourceAnchor endPos: 0.
	famixViolation violatingEntity: famixEntity.
	famixEntitySourceAnchor fileName: 'A.java'.
	famixCondition name: 'anIssue'.
	famixViolation violatedCondition: famixCondition.
	famixModel addAll: { 
			famixEntity.
			famixEntitySourceAnchor }.

	issue := exporter convertViolation: famixViolation.
	self assert: issue class equals: FmxCBSQIssue.
	self assert: issue engineId equals: 'Moose'.
	self assert: issue ruleId equals: 'anIssue'
]

{ #category : #test }
FmxCBSQExporterTest >> testConvertViolations [

	| issues |
	issues := exporter convertViolations: {  } asOrderedCollection.
	self assert: issues class equals: FmxCBSQIssueCollection.
	self assert: issues issues isEmpty
]
