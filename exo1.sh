#!/bin/bash

#vérifie l'entrée de l utilisateur
function validiteEntree () {
	#	0-> nombre entier 1-> n importe quoi d'autre
	[[ $1 =~ ^[^[:digit:]*]$ ]] &&  return 1 || return 0; #### /!\ erreur si flottants; valide même si commence par un autre caractère que chiffre; 
									######### ne retourne rien si négatif;
								##### erreur si autre caractère après chiffre
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
	if [[ $? = 1 ]]; then
		echo "Valeur invalide"; sleep 1; interface;
	else
		afficherNombres $input;
	fi
}


#################" LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
