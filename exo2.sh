#!/bin/bash

################ UTILISATION
# Application qui affiche le nombre de voyelles d'une chaîne entrée par l utilisateur
## /!\ NE COMPTE PAS LES VOYELLES AVEC DIACRITIQUES COMME ETANT DE VOYELLES /!\
### Touche (ENTREE) (=entrée vide) pour quitter l'application



function afficherNombreVoyelles () {
	chaine=$1;

	#sélectionne les voyelles dans une nouvelle chaîne de caractères
	nb_voyelles=$(echo $chaine | sed -r 's.[^aeiouy]..g');

	#affiche la longueur de la chaîne de caractères
	echo -e "Votre chaîne a "${#nb_voyelles}" voyelles.\n";
	return 1;
}

#fonction principale
function interface () {

	input=0;

	echo -e "Voyons combien de voyelles a votre chaîne de caracctères.\nChamp vide pour quitter.\n";
	read -p "Entrer une chaîne de caractères >>> " input;

	#pour quitter = regarde si l'entrée est vide
	if [ -z "$input" ]; then
		exit 0;
	else
		#supprime les espaces pour mettre la chaine en argument de la prochaine fonction
		input=`echo $input | sed "s.[[:space:]]..g"`;
		afficherNombreVoyelles $input;
		return 0;
	fi

	echo "etape3";
	return 2;
}



#################" LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
