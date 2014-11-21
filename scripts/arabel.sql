# SQLITE gbif.db
.mode csv
.header on
.separator "\t"
.import ../occurrence.txt occurrences
create unique index id_idx on occurrences (gbifID);
select scientificName, count(*)  from occurrences group by scientificName;
select Genus, count(*)  from occurrences group by Genus order by Genus;
create view occ as select gbifID, scientificName, decimalLatitude, decimalLongitude, locality from occurrences where genus="Porrhomma" and  decimalLatitude !="" order by gbifID;
.separator ;
.output occ.csv
select * from occ;
.exit

# QGIS arabel.qgs
Add Vector layer Countries
Add Text layer occ.csv
Play with properties 
Show different species with different colors

# OpenRefine
Create project from file occ.csv
Facet ScientificName
