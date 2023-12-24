#!/bin/bash

mHiggs="mHiggs.txt"
invMassLow="invMassCutLow.txt"
invMassHigh="invMassCutHigh.txt"

sed --in-place '/^\s*$/d' "$mHiggs" #this trims the empty lines: "^\s" is starting with space, \s* means any number of space and \s*$ means ending with any number of spaces
sed --in-place '/^\s*$/d' "$invMassLow" #this trims the empty lines: "^\s" is starting with space, \s* means any number of space and \s*$ means ending with any number of spaces
sed --in-place '/^\s*$/d' "$invMassHigh" #this trims the empty lines: "^\s" is starting with space, \s* means any number of space and \s*$ means ending with any number of spaces

i=1
    
while IFS=$'\t' read -r scanMass scanLowLimit scanHighLimit
do
	scanWH=$(awk "BEGIN {print 0.0000326 * $scanMass}")	

	sed -e "s/@scanMass@/$scanMass/g" \
	    -e "s/@scaWH@/$scanWH/g" \
	    -e "s/@lowCut@/$scanLowLimit/g" \
	    -e "s/@highCut@/$scanHighLimit/g" \
	    input_template.in >input.in

	python3.7 ~/mg5/bin/mg5_aMC <input.in

	i=$((i + 1))

done < <(paste "$mHiggs" "$invMassLow" "$invMassHigh")
