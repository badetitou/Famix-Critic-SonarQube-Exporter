Class {
	#name : #BaselineOfFamixCriticSonarQubeExporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixCriticSonarQubeExporter
}

{ #category : #baselines }
BaselineOfFamixCriticSonarQubeExporter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfFamixCriticSonarQubeExporter >> defineDependencies: spec [

	
]

{ #category : #baselines }
BaselineOfFamixCriticSonarQubeExporter >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfFamixCriticSonarQubeExporter >> definePackages: spec [

	spec
		package: 'Famix-Critic-SonarQube-Exporter';
		package: 'Famix-Critic-SonarQube-Exporter-Tests'
		with: [ spec requires: 'Famix-Critic-SonarQube-Exporter' ]
]
