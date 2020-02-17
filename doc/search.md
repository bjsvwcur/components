# Subsystem "Suche"

## Überblick

Volltext-Suchservice für die Suche nach Kartenebenen und Orten. 

Die folgenden Objekttypen können mittels Suchservice gesucht werden:
* Karten(ebenen) sprich DataProducts. Beispiel: Layergruppe "Amtliche Vermessung"
* Features. Also die Objekte einer Kartenebene wie Beispielsweise eine Adresse

Bei der Suche nach Kartenebenen werden die Metadaten durchsucht; bei der Suche nach Features die entsprechenden Geodatensätze.
Bei der Featuresuche wird konfiguriert, ob die Suche immer verfügbar ist (Adressen, Grundstücke, ...) oder nur, falls die entsprechende Kartenebene geladen ist.

## Benutzerdokumentation (AGI)

* Wie das Ganze im AGDI Konfiguriert wird... --> Referenz auf das entsprechende Kapitel im AGDI Benutzerhandbuch

## Komponentendiagramm

![Searchservice](dia/api_search.png)

Im Suchservice sind zwei "Familien" von Komponenten im Einsatz:
* Komponenten für die Aktualisierung des Solr-Index.
* Komponenten für die Verarbeitung von Suchanfragen.

Komponenten für die Aktualisierung des Suchindex:
* **AGDI Publish** und **GRETL-Job** beauftragen den Indexupdater
* Der **Indexupdater**
  * Entfernt mittels **Update** den zu aktualisierenden Teil des Index.
  * Lädt den Teil mittels **DIH** von den Quellen neu in den Index.
  * Frägt während dem neu Laden mittels **Query** den Fortschritt ab. 

Der **Searchservice** nimmt die Anfragen von Clients entgegen. Der Searchservice enthält:
* Das Einschränken der Suche auf nur Kartenebenen oder nur Adressen, Grundstücke, ...
* Die Prüfung der Berechtigung (für Ortssuchen).

## Deployment
* Welche Openshift-Projekte...
* Via's (GDI-Gateway, SES, ...)
* Solr-Cloud

Todo:
* "Zusammenstöpseln" für den Solr Dataimporthandler
* Manuell Indexslice neu laden
* Manuell den ganzen Index mittels Admin-Interface neu laden

## Entwicklungsdokumentation

Maintainer und Repos der einzelnen Komponenten, mit Link auf die jeweilige Dokumentation

### Modelldokumentation des Solr-Index

...

