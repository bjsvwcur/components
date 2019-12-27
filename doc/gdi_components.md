# Komponentendiagramme der GDI des Kantons Solothurn
## Erläuterung der Diagrammelemente

![Beispieldiagramm](dia/sample.svg?sanitize=true)

Der Client nutzt (ist Abhängig von):
* Das Subsystem "mapservice" via Interface WMS. 
* Die Komponente "worker" via Interface HTTP

In den Diagrammen steht das "Kastensymbol" für ein **abstrahiertes Subsystem**. Die Details des Subsystems werden dabei in einem folgenden separaten Detaildiagramm erläutert.

"FeatureInfo" ist ein Beispiel für ein **Package**. Mit einem Package werden Subsysteme innerhalb eines Diagrammes dargestellt.

SpatialQuery und Py-Module sind mittels **Vererbungspfeil** mit "FeatureInfo" verbunden. Damit wird ausgedrückt, dass "FeatureInfo" als "SpatialQuery" und als "Py-Module" umgesetzt ist.   

Die Diagramme werden mittels (https://plantuml.com/) erstellt.

## Uebersichtsdiagramm aller Subsysteme

![Subsysteme](dia/subsystems.svg)

Subsysteme (alphabetisch):
* **API:** Dienste, welche von mehreren Subsystemen genutzt werden.
* **Datenabgabe:** Bereitstellung der Raster- und Vektordaten für die Nutzung in Drittprogrammen (Ausserhalb der GDI).
* **Geodaten:** Zentrale Datenhaltung der Geodaten. Vektordaten in PostGIS. Raster / Lidar als Dateien mit Katalog. Vektordaten liegen in den Erfassungsumgebungen relational vor, in der Publikations-DB in der Form denormalisierter "flachgewalzter" Geo-Tabellen. 
* **Grundstücksinformation:** API's und Applikationen für die grundtückzentrische Nutzung der Geodaten.
  * Oereb-Kataster
  * Eigentümer-Abfrage
* **GRETL:** ETL-Werkzeug zwecks Publikation, Input und Output von Vektordaten (tabellarischen Daten). Mittels GRETL erfolgt die Publikation und Denormalisierung eines Datenstandes von einer Erfassungs-Umgebung auf die Publikations-DB.
* **Konfig-DB:** Metainformations-Datenbank, in welcher zu einem Datensatz dokumentiert ist
  * Zugriffsberechtigungen
  * Kontaktinformationen
  * Nutzung in welchen funktionalen Komponenten (Aenderungsmanagement)
  * ETL Verarbeitungsketten (Aenderungsmanagement)
  * Unter welcher Bezeichnung und mit welchen Darstellungen und Attributen der Datensatz publiziert ist.
* **OpenLDAP:** Verwaltung der Datenbankzugriffe für:
  * Das Editieren mittels QGIS-Client
  * Die Zugriffe der Dienste auf die Geodaten
* **QGIS Client:** Desktop-GIS Anwendung für die Datenpflege und die Datennutzung für erfahrene GIS-Nutzer
* **Web GIS Client:** Browser-Webapplikation für die einfache alltägliche Nutzung der Geodaten in Kartenform.

