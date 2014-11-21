# SQLITE
.mode csv
.header on
.separator "\t"
.import ../occurrence.txt occurrences
create unique index id_idx on occurrences (gbifID);
create view occ as select gbifID, scientificName, decimalLatitude, decimalLongitude, locality, year, month, day from occurrences where decimalLatitude != "" order by gbifID;
.separator ;
.output occ.csv
select * from occ;
.exit

# SQLITE
select month, count(*) from occ group by month order by month;

# QGIS
Add Vector layer Countries
Add Text layer occ.csv
Play with properties
Show by year/month