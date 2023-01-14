#!/bin/bash

### UTILISATION
## Entrer les nombres les uns après les autres; appuyer sur entrée pour valider chaque item
## Entrer (T) pour valider le tableau
## Appuyer sur (ENTREE) (champ vide) pour quitter l'interface


#fonction principale
function initVariables (){
	tab_uti=();
	input=0;
	return 0;
}

function interface () {
	initVariables;

	echo "Entrer un par un les nombres de votre tableau";

	while !  [[ $input =~ [Tt] ]]; do
		read -p "Entrer un nombre entier >>>	" input;

		#pour quitter l'application
		[[ $input = "" ]] && exit 0;

		#pour valider le tableau
		[[ $input =~ [Tt] ]] && break;


		validiteEntree $input;
		if [[ $? = 1 ]]; then
			echo "Valeur invalide"; sleep 1; continue;
		else
			tab_uti+=($input);
		fi
	done

	# si le tableau est validé mais est vide -> renvoyer une erreur
	verifTab;
	[[ $? = 1 ]] && interface || plusGdNbTab; echo $plus_grand;

}

#vérifie l'entrée de l utilisateur // peut-être un nombre négatif
function validiteEntree () {

	#	0-> nombre entier positif ou négatif  1-> n importe quoi d'autre

	tmp=$(echo $input | grep [[:alpha:]]);
	if [[  $input =~ ^["-"?[:digit:]] ]]; then
		[[ $tmp != "" ]] && return 1;
		return 0;
	else
		return 1;
	fi
	return 2;
}

function plusGdNbTab () {
	plus_grand=0;
	for i in ${tab_uti[@]}; do
		[ $i -gt $plus_grand ] && plus_grand=$i;
	done
	return 3;
}

function verifTab () {
	if [[ ${#tab_uti[@]} = 0 ]]; then
		echo "Le tableau est vide."; sleep 1;
		return 1;
	else
		return 0;
	fi
	return 4;
}

#################" LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
