# Komponentendiagramme der GDI des Kantons Solothurn
## Erläuterung der Diagrammelemente

![Beispieldiagramm](dia/example.svg)

Der Client nutzt (ist Abhängig von):
* Das Subsystem "mapservice" via Interface WMS. 
* Die Komponente "worker" via Interface HTTP

In den Diagrammen steht das "Kastensymbol" für ein **abstrahiertes Subsystem**. Die Details des Subsystems werden dabei in einem folgenden separaten Detaildiagramm erläutert.

"FeatureInfo" ist ein Beispiel für ein **Package**. Mit einem Package werden Subsysteme innerhalb eines Diagrammes dargestellt.

SpatialQuery und Py-Module sind mit einem Vererbungspfeil verbunden. Damit wird ausgedrückt, dass "FeatureInfo" als "SpatialQuery" und als "Py-Module" umgesetzt ist.   

Die Diagramme werden mittels (https://plantuml.com/) erstellt.
