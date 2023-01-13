#!/bin/bash

### UTILISATION
## Entrer les nombres les uns après les autres; appuyer sur entrée pour valider chaque item
## Appuyer sur (ENTREE) (champ vide) pour valider le tableau


#fonction principale
function interface () {
	echo "Entrer un par un les nombres de votre tableau"
	read -p "Entrer un nombre entier >>>	" input;

	#pour quitter l'application
	[[ $input = "" ]] && exit 0;

	validiteEntree $input;
	#si la valeur est invalide
	if [[ $? = 1 ]]; then
		echo "Valeur invalide"; sleep 1; interface;
	else
		afficherNombres;
	fi
}

#vérifie l'entrée de l utilisateur // peut-être un nombre négatif
function validiteEntree () {
	#	0-> nombre entier 1-> n importe quoi d'autre
	[[ $input =~ [^[-]?^[:digit:]] ]] &&  return 1 || return 0;
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
