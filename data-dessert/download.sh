#!/bin/sh

# SF parking
wget -O uupn-yfaw.csv https://data.sfgov.org/api/views/uupn-yfaw/rows.csv?accessType=DOWNLOAD
wget -O uupn-yfaw_data-dictionary.pdf https://data.sfgov.org/api/assets/14C559D6-9A1D-41EA-9B2D-C9AD626A2622
wget -O land-use-map.pdf http://www.sf-planning.org/modules/showdocument.aspx?documentid=9016

# Lombardia museums
wget -O 3syc-54zf.csv https://dati.lombardia.it/api/views/3syc-54zf/rows.csv
