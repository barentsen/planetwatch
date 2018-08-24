#!/bin/bash
# Retrieve the entire list of confirmed exoplanets from NASA's Exoplanet Archive.
NEXSCI_ENDPOINT="http://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI"
URL_COMPOSITE="$NEXSCI_ENDPOINT?table=compositepars&select=*"
URL_CONFIRMED="$NEXSCI_ENDPOINT?table=exoplanets&select=*"
OUTPUT_COMPOSITE="data/nexsci-composite-$(date +%Y%m%dT%H%M%S).csv"
OUTPUT_CONFIRMED="data/nexsci-confirmed-$(date +%Y%m%dT%H%M%S).csv"
wget --output-document=$OUTPUT_COMPOSITE $URL_COMPOSITE
wget --output-document=$OUTPUT_CONFIRMED $URL_CONFIRMED
gzip $OUTPUT_COMPOSITE
gzip $OUTPUT_CONFIRMED
