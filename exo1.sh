#!/bin/bash

#fonction principale
function interface () {
	read -p "Entrer un nombre entier positif >>> " input;

	#pour quitter l'application
	[[ $input =~ [qQ] ]] && exit 0;

	validiteEntree $input;
	#si la valeur est invalide
	if [[ $? = 1 ]]; then
		echo "Valeur invalide"; sleep 1; interface;
	else
		afficherNombres;
	fi
}

#vérifie l'entrée de l utilisateur
function validiteEntree () {
	#	0-> nombre entier 1-> n importe quoi d'autre
	[[ $input =~ [^[:digit:]] ]] &&  return 1;
	[[ $input > 0 ]] && return 0;
	return 2;
}

function afficherNombres () {
	for (( i=0; i<=$input; i++)); do
		echo -n $i" ";
	done
	echo;
	return 3;
}

#################" LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
