# Famix-Critic-SonarQube-Exporter

This project aims to connect [FamixCritics](github.com/moosetechnology/MooseIDE) to [SonarQube UI](https://www.sonarqube.org/).

This package basically export the FamixViolation into the Sonar [Generic Issue Format](https://docs.sonarqube.org/latest/analysis/generic-issue/).

## Installation

```st
Metacello new
  githubUser: 'badetitou' project: 'Famix-Critic-SonarQube-Exporter' commitish: 'main' path: 'src';
  baseline: 'FamixCriticSonarQubeExporter';
  onConflict: [ :ex | ex useIncoming ];
  onUpgrade: [ :ex | ex useIncoming ];
  onDowngrade: [ :ex | ex useLoaded ];
  load
```

## Usages

```st
FmxCBSQExporter new
 violations: violations;
 targetFileReference: targetRef;
 export
```

## Full Example

Considering a maven project.
First, create a model of the project (using [VerveineJ](https://modularmoose.org/moose-wiki/Developers/Parsers/VerveineJ)).

```sh
docker pull badetitou/verveinej:v2.0.4
docker run -v <full/path/toSource>:/src -v [<full/path/toDependency>:/dependency] badetitou/verveinej:v2.0.4 <verveineJOption> .
```

Then, in a MooseImage, in a playground

```st
model := FamixJavaModel new.
'path/to/model.json' asFileReference readStreamDo: [ : stream | model importFromJSONStream: stream ].
model rootFolder: 'path/to'.

criticBrowser := MiCriticBrowser on: MiCriticBrowser newModel.
'D:/rules.ston' asFileReference readStreamDo: [ :stream | criticBrowser importRulesFromStream: stream ].
criticBrowser model setEntities: model.
criticBrowser model run.
violations := criticBrowser model getAllViolations.

targetRef := 'path/to/reports/sonarGenericIssue.json' asFileReference.


FmxCBSQExporter new
 violations: violations;
 targetFileReference: targetRef;
 export
```

It generates in your project under the `report` folder the created issues.
Then, add the `-Dsonar.externalIssuesReportPaths=reports\sonarGenericIssue.json` parameter to your sonar maven analyse command.

```sh
mvn sonar:sonar \
  "-Dsonar.projectKey=my-project" \
  "-Dsonar.host.url=<sonarURLInstance>" \
  "-Dsonar.login=<myToken>" \
  "-Dsonar.externalIssuesReportPaths=reports\sonarGenericIssue.json"
```
