#!/bin/bash

### UTILISATION
# Application qui affiche la somme des chiffres d'un nombre entré par l utilisateur
## Appuyer sur (ENTREE) (champ vide) pour quitter l'interface

#vérifie l'entrée de l utilisateur 
function validiteEntree () {
	# 0-> nombre entier positif  1-> n importe quoi d'autre
	[[  $1 =~ [^[:digit:]] ]] && return 1 || return 0;
	return 3;
}

function sommeChiffres () {
	chiffres=$1;
	total=0;
	for (( i=0; i<${#chiffres}; i++)); do
		((total+=${chiffres:$i:1}));
	done

	return 4;
}

# fonction principale
function interface () {
	input=0;
	while [[ $input =~ [^[:blank:]] ]]; do
		echo -e "Calculons la somme des chiffres qui composent votre nombre entier.\n"
		read -p "Entrer un nombre entier >>>	" input;

		[[ -z $input ]] && exit 0;

		validiteEntree $input;
		if [[ $? = 1 ]]; then
			echo "Valeur invalide"; sleep 1; continue;
		fi
		sommeChiffres $input;
		echo -e "La sommes des chiffres de votre nombre est : "$total"\n";
	done
	return 2;
}



################# LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
