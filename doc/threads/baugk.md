# Axioma Mandant AfU (BauGK)

Dieses Dokument beschreibt im Sinne eines roten Fadens, welche Schnittstellen und Geodaten in der Integration der Fachapplikation BauGK wie genutzt werden.

## Überblick der Fachapplikationsintegration

BauGK nutzt Schnittstellen mit der GDI, um die folgenden Anwendungsfälle (UC) umzusetzen:
1.	Den Ort (die Punktkoordinaten) eines Geschäftes im Web GIS Client anzuzeigen
2.	Die Koordinaten zu editieren (setzen und nachträglich ändern)
3.	Ein Geschäft nach Klick auf die Karte im BauGK anzuzeigen
4.	Alle relevanten Geschäfte in einer Karte anzuzeigen
5.	Für ein Geschäft relevante Zonen abfragen

In der folgenden Matrix ist dargestellt, welche Komponenten, Schnittstellen und Konfigurationen für die Fachapplikationsintegration in Betrieb sind. Die Nr. der ersten Spalte entspricht der Nummer des Anwendungsfalles oben.

|Nr.|CCC-Service|Data-Service|WGC Karte|Bemerkungen|
|---|---|---|---|---|
|1.|X| |X|Mittels entsprechender Konfiguration des Web GIS Client für die CCC-Integration (Siehe Kapitel "UC 1-3").|
|2.|X| |X|Siehe Bemerkung zu 1.|	
|3.|X| |X|Siehe Bemerkung zu 1.|	
|4.| |X|X|BauGK schreibt die Geschäfte mittels DataService in das DataSet ch.so.afu.baugk.ccccache (Siehe Kapitel "UC 4").|
|5.| |X| |Die Zonenzugehörigkeit wird mittels DataService von BauGK abgefragt (Siehe Kapitel 4).|

## UC 1-3: CCC-Service
Für die Anwendungsfälle 1 – 3 kommt der CCC-Service und die Integration des CCC-Service in den Web GIS Client zum Einsatz.

Siehe dazu die [Dokumentation des CCC-Service](https://github.com/sogis/ccc-service/blob/master/docs/user/index.md)

…Und die Dokumentation der Integration des CCC-Service in den Web GIS Client. Die Konfiguration des Verhaltens des Web GIS Client bezüglich der CCC-Schnittstelle erfolgt über den ccc_config_service
$td

Die BauGK-Spezifischen Json-Konfigurationsparameter sind in der Umgebungsvariable CCC_CLIENT_CONFIG im Schlüsselwort baugk zusammengefasst.

##	UC4: Alle relevanten Geschäfte in der Karte anzeigen

Um alle relevanten Geschäfte in der Karte anzuzeigen, werden die folgenden Komponenten verwendet:
•	Das DataSet ch.so.afu.baugk.ccccache, um die Geschäfte als Kartenebene im Web GIS Client darzustellen.
•	Der Dataservice, mit welchem Axioma CRUD-Operationen auf ch.so.afu.baugk.ccccache absetzt. BauGK identifiziert sich dabei mittels basic auth Applikationsbenutzer  srvaxisog gegenüber dem SES des AIO. Im AGDI sind die Benutzerberechtigungen für BauGK durch die Rolle afu_baugk konfiguriert.

Die Abhängigkeit von BauGK auf ch.so.afu.baugk.ccccache ist in AGDI durch das Modul Axioma Mandant AfU dokumentiert.

## UC5:	Für ein Geschäft relevante Zonen abfragen

BauGK nutzt den DataService, um die für ein Geschäft relevanten Zonen abzufragen. Dabei erstellt BauGK eine Bounding Box mit den Koordinaten des Geschäftes im Zentrum, und allfälligen Filterkriterien (where Clause).

Auch diese Abhängigkeit von BauGK auf die entsprechenden DataSets ist im AGDI dokumentiert. Modulname: Axioma Mandant AfU
