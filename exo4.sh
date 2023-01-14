#!/bin/bash

### UTILISATION
## Appuyer sur (ENTREE) (champ vide) pour quitter l'interface

function interface () {
	input=0;
	while [[ $input =~ [^[:blank:]] ]]; do
		read -p "Entrer un nombre entier >>>	" input;

		[[ $input = "" ]] && exit 0;

		validiteEntree $input;
		if [[ $? = 1 ]]; then
			echo "Valeur invalide"; sleep 1; continue;
		fi
		sommeChiffres;
		echo $total;
	done
	return 2;
}

#vérifie l'entrée de l utilisateur // peut-être un nombre négatif
function validiteEntree () {
	# 0-> nombre entier positif  1-> n importe quoi d'autre
	[[  $input =~ [^[:digit:]] ]] && return 1 || return 0;
	return 3;
}

function sommeChiffres () {
	total=0;
	for (( i=0; i<${#input}; i++)); do
		((total+=${input:$i:1}));
	done

	return 4;
}


################# LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
