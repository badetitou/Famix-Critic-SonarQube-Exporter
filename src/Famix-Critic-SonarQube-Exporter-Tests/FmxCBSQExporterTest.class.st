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

	| issue famixViolation |
	famixViolation := FamixCBViolation new.
	issue := exporter convertViolation: FamixCBViolation new.
	self assert: issue class equals: FmxCBSQIssue.
	self assert: issue engineId equals: 'Moose'.
]

{ #category : #test }
FmxCBSQExporterTest >> testConvertViolations [

	| issues |
	issues := exporter convertViolations: {  } asOrderedCollection.
	self assert: issues class equals: FmxCBSQIssueCollection.
	self assert: issues issues isEmpty
]
