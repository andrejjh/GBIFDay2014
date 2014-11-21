# SQLITE typesPY.db
.mode csv
.header on
.separator "\t"
.import ../occurrence.txt occurrences
create unique index occ_idx on occurrences (gbifID);
.import ../verbatim.txt verbatim
create unique index vbt_idx on verbatim (gbifID);
.import ../multimedia.txt multimedia
create unique index mmd_idx on multimedia (gbifID);

create view occ as select o.gbifID, o.publishingCountry, o.institutionCode, o.collectionCode, o.phylum, o.family, o.scientificName, o.decimalLatitude, o.decimalLongitude, o.locality, o.year, o.month, o.day, o.typeStatus, m."references" as URL from occurrences o left join multimedia m on m.gbifID = o.gbifID order by o.gbifID;
.separator ;
.output occ.csv
select * from occ;
.exit


# SQlite(browser)
select typeStatus, count(*) from occ group by typeStatus order by typeStatus;
select publishingCountry, count(*) from occ group by publishingCountry order by publishingCountry;
select phylum, count(*) from occ group by phylum order by phylum;
select year, count(*) from occ group by year order by year;
select count(*) from occ where decimalLatitude !="";

# LibreOffice
Insert SheetFromFile occ.csv

# Multimedia
select * from occ where gbifid=931143641;
Open multimedia.txt file
Open image URL in browser


