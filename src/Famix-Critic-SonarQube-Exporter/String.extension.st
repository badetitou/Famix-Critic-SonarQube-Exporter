Extension { #name : #String }

{ #category : #'*Famix-Critic-SonarQube-Exporter' }
String >> fmxCBSQToLineCharacter: position [
	"Ported from Language Server project of badetitou (look at github)"

	| copy |
	copy := (self first: (position min: self size)) lines.
	copy
		ifEmpty: [ ^ {(#line -> 0).
			(#character -> 0)} asDictionary ].
	^ {(#line -> (copy size - 1)).
	(#character -> (copy last size max: 0))} asDictionary
]
