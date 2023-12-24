#!/bin/bash

path="/home/beto/Simulations/Higgs_bg"
mHiggs="mHiggs.txt"
invMassLow="invMassCutLow.txt"
invMassHigh="invMassCutHigh.txt"

rm ${path}/sigma_bg.dat

echo "" > ${path}/sigma_bg.dat

    
while IFS=' \t\r\n' read -r scanmH 
do

	rm ${path}/MH_${scanmH}/sigma.dat

done < "$mHiggs"



while IFS=' \t\r\n' read -r scanmH 
do
	i=1
	while [[ $i -le 300 ]];
	do

		runname=$(printf "run_%02d" $i)
		line37="`sed -n 24p ${path}/MH_${scanmH}/HTML/${runname}/results.html`" #-n silent. This gets line 48
		sigma=${line37##*= } #This cuts everything before first equal sign
		sigma=${sigma%%'&'*} #This cuts everything after first space

		echo -e -n "\t$sigma" >> ${path}/MH_${scanmH}/sigma.dat

		#sed -i 's/e/*10^/g' ${path}/mst_${scanmst}_At_${scanAt}/sigma.dat #-i in place
		i=$((i + 1))

	done
done < "$mHiggs"
   
   
while IFS=' \t\r\n' read -r scanmH 
do
	mean=`sed -n 1p ${path}/MH_${scanmH}/sigma.dat`
	sed -i '$s/$/'"$mean"'\t/' ${path}/sigma_bg.dat
	echo -e "\n" >> ${path}/sigma_bg.dat

done < "$mHiggs"



