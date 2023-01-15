#!/bin/bash

###UTILISATION
# Application qui compte et affiche le nombre de chiffres d'un nombre entré par l utilisateur
# (ENTREE) (champ vide) pour quitter l'interface
# Ce nombre doit être un entier positif.

function nbCarsNombre() {
	nombre=$1;
	#la commande suivante indique le nombre de caractères de la chaîne => le nombre de chiffres dans le nombre
	total=${#nombre};
	return 0;
}

# fonction qui vérifie que l'entrée est bien un nombre entier positif
function verifNombre() {
	[[ $(echo $1 | grep [^[:digit:]]) =~ [^[:blank:]] ]] && return 1;
	return 3;
}

function valeurInvalide() {
	echo "Valeur invalide.";
	sleep 1;
	interface;
	return 4;
}

function interface() {
	echo -e "Voyons le nombre de chiffres qui composent votre nombre.\nChamp vide pour quitter.\n";
	read -p "Entrer un nombre entier positif >>>	" input;

	[[ -z $input ]] && exit 0;

	verifNombre $input;
	[[ $? = 1 ]] && valeurInvalide;

	nbCarsNombre $input;
	echo -e "Ce nombre a "$total" chiffre(s).\n";
	return 2;
}

#### script

while [ true ]; do
	interface;
done

exit 1;
