#!/bin/bash

###	UTILISATION
# Entrer un nombre pour savoir s'il est premier ou non
# Ce nombre doit être un entier positif réel
# Champ vide pour quitter


# fonction qui vérifie l'entrée utilisateur selon les conditions ci-dessus
# 0 -> entrée valide 1 -> entrée invalide
function verifNb () {
	[[ $1 =~ [^[:digit:]] || $1 < 1 ]] && return 1 || return 0;
	return 4;
}

### FONCTIONNEMENT
# nous allons chercher le plus petit diviseur du nombre entré par l'utilisateur (il suffit qu il ait un diviseur autre que lui-même et 1 pour ne pas
# être premier).
# Pour cela, nous allons tester tous les nombres à partir de 2, puis uniquement les nombres impairs : en effet, s il est divisible par 2, il n'est pas premier,
# et s il n'est PAS divisible par 2, il ne sera forcément pas divisible par les autres nombres pairs, donc il est inutile de les tester.
# Enfin, le dernier nombre dont on va tester la divisibilité est appriximativement <= la moitié du nombre entré par l'utilisateur : en effet, au de-là de la moitié de lui-même, 
# le nombre ne peut plus se contenir lui-même un nombre entier de fois <=> il n'a plus de diviseurs à partir de là. Il est donc inutile de continuer la recherche.
# Si l utilisateur veut savoir si 1 ou 2 sont premiers, vus qu il ne rentrent pas dans la boucle for, une condition si a été mise en amont (1 n'est pas premier et 2 si).
function premier (){
	max=$(($1 / 2));
	# sortie : 1=> pas premier 0=> premier
	[[ $1 = 2 ]] && return 0;
	[[ $1 = 1 ]] && return 1;

	for (( i=2; i <= max; i++ )); do
		modulo=$(($1%$i));
		[[ $modulo = 0 ]] && return 1;
		[[ $i > 2 ]] && ((i++)); #à partir de 3, on incrémente de 2 car on ne veut plus tester les nombres pairs 
	done
	return 0;
}

function clearInterface () {
	sleep 1;
	clear;
	return 5;
}

function interface () {
	echo -e  "Voyons si votre nombre est premier.\nChamp vide pour quitter.\n"
	read -p "Entrer votre nombre (entier positif) >>	" input;

	[[ -z $input ]] && exit 0;

	verifNb $input;
	if [[ $? == 1 ]]; then
		echo "Entrée invalide.";
		clearInterface;
		return 2;
	fi

	premier $input;
	if [[ $? = 0 ]]; then
		echo -e $input "est premier !\n";
	elif [[ $? = 1 ]]; then
		echo -e $input "n'est pas premier.\n";
	else
		# cette condition sert uniquement à gérer les cas d'erreur.
		echo "Erreur " $?;
	fi
	return 3;
}

########## LE SCRIPT

while [ true ]; do
	interface;
done

exit 1;
