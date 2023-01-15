#!/bin/bash

### UTILISATION
# application qui affiche tous les nombres de 1 à un nombre entré par l'utilisateur
# entrer un nombre entier positif
# (ENTREE) (champ vide) pour quitter l'application



function afficherNombres () {
	for (( i=1; $i<=$1; i++)); do
		echo -n $i" ";
	done
	echo;
	return 3;
}

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

#fonction principale
function interface () {
	echo -e "Voyons tous les nombres de 1 à votre nombre.\nChamp vide pour quitter l'interface.\n";
	read -p "Entrer un nombre entier positif >>> " input;

	#pour quitter l'application
	[[ -z  $input ]] && exit 0;

	validiteEntree $input;
	#si la valeur est invalide
	if [[ $? != 0 ]]; then
		echo "Valeur invalide"; sleep 1; interface;
	else
		afficherNombres $input; echo -e "\n";
	fi
	return 4;
}


#################" LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
