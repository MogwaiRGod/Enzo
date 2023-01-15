#!/bin/bash

### UTILISATION
# Application qui affiche le plus grand nombre d'un tableau d entiers entrés par l utilisateur
## Entrer les nombres les uns après les autres; appuyer sur entrée pour valider chaque item
## On peut aussi les entrer dans la même ligne si on les sépare d'un espace
## Entrer (T) pour valider le tableau
## Appuyer sur (ENTREE) (champ vide) pour quitter l'interface


#fonction principale
function initVariables (){
	tab_uti=();
	input=0;
	return 0;
}

#vérifie l'entrée de l utilisateur // peut-être un nombre négatif
function validiteEntree () {

	#	0-> nombre entier positif ou négatif  1-> n importe quoi d'autre

	tmp=$(echo $1 | grep [^[:digit:]^\-]);
	if [[  $1 =~ [[:digit:]] ]]; then #####" ERREURS : accepte les nombres flottants ; si séparés d'un espace, accepte plusieurs nombres (pas grave mais ce n est pas censé faire ça)
		[[ $tmp != "" ]] && return 1;
		return 0;
	else
		return 1;
	fi
	return 2;
}

function plusGdNbTab () {
	local -n tab=$1;
	plus_grand=${tab[0]};
	for i in ${tab[@]}; do
		[ $i -gt $plus_grand ] && plus_grand=$i;
	done
	return 3;
}

function verifTab () {
	local -n tab=$1;
	if [[ ${#tab[@]} = 0 ]]; then
		echo "Le tableau est vide."; sleep 1; clear;
		return 1;
	else
		return 0;
	fi
	return 4;
}


function interface () {
	initVariables;

	echo "Entrer un par un les nombres de votre tableau. (T) pour valider. Champ vide pour quitter.";

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
	verifTab tab_uti;
	[[ $? = 1 ]] && interface || plusGdNbTab tab_uti; echo -e "Le plus grand nombre du tableau est : "$plus_grand"\n";

}


################## LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
