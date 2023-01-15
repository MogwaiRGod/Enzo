#!/bin/bash

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
	read -p "Entrer un nombre entier positif >>>	" input;
	verifNombre $input;
	[[ $? = 1 ]] && valeurInvalide;

	nbCarsNombre $input;
	echo "Ce nombre a "$total" chiffre(s).";
	return 2;
}

#### script

while [ true ]; do
	interface;
done

exit 1;
