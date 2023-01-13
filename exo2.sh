#!/bin/bash

################ UTILISATION
### Touche (ENTREE) (=entrée vide) pour quitter l'application

#fonction principale
function interface () {
	read -p "Entrer une chaîne de caractères >>> " input;

	#pour quitter
	[[ $input = "" ]] && exit 0;

	afficherNombreVoyelles;
	return 0;
}

function afficherNombreVoyelles () {
	#sélectionne les voyelles dans une nouvelle chaîne de caractères
	nb_voyelles=$(echo $input | sed -r 's.[^aeiouy]..g');
	#affiche la longueur de la chaîne de caractères
	echo ${#nb_voyelles};
	return 1;
}

#################" LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
