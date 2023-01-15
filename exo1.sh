#!/bin/bash

#vérifie l'entrée de l utilisateur
function validiteEntree () {
	#	0-> nombre entier 1-> n importe quoi d'autre
	nombre=$1;
	# vérifie que l'entrée est un nombre
	[[ $(echo $nombre | grep [^[:digit:]]) =~ [^[:blank:]] ]] && return 5;
	
	#si oui, alors vérifie que ce nombre est positif
	if [ $nombre -lt 0 ]; then
		return 1;
	else
		return 0;
	fi
	return 2;
}

function afficherNombres () {
	for (( i=0; i<=$1; i++)); do
		echo -n $i" ";
	done
	echo;
	return 3;
}


#fonction principale
function interface () {
	read -p "Entrer un nombre entier positif >>> " input;

	#pour quitter l'application
	[[ $input =~ [qQ] ]] && exit 0;

	validiteEntree $input;
	#si la valeur est invalide
	if [[ $? != 0 ]]; then
		echo "Valeur invalide"; sleep 1; interface;
	else
		afficherNombres $input;
	fi
	return 4;
}


#################" LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
