*#!/bin/bash

### UTILISATION
## Appuyer sur (ENTREE) (champ vide) pour quitter l'interface



### fonction qui supprime la ponctuation et les chiffres des chaînes entrees et met tous les caractères en bas-de-casse
function standardiserChaines () {
	chaine_tmp=`echo "$1" | sed -e 's.[[:punct:][:digit:]]..g' | tr '[:upper:]' '[:lower:]'`;
	return 2;
}

### on utilise une fonction d'un précédent script : celle-ci compte les voyelles de la chaine et les stocke
function nombreVoyelles () {
	voyelles=$(echo $1 | sed -r 's.[^aeiouy]..g');
	consonnes=$(echo $1 | sed -r 's.[aeiouy]..g');
	nb_voyelles=${#voyelles};
	return 5;
}

function triLettres () {
	#trie les lettres de la chaîne entrée par ordre alphabétique
	tri=$(echo $1 | grep -o . | sort | tr -d "\n" | tr -dc [[:print:]]);
	return 6;
}

function verifAnagrammes () {
		str1=$1; str2=$2;
		pas_anag="Ce ne sont pas des anagrammes.";

		# pour vérifier si les chaînes entrées  sont des anagrammes, on procède par étapes
		# on pourrait sauter toutes ces étapes et n'effectuer que la dernière, mais en faisant
		# comme ça, on évite des calculs inutiles si les chaînes ne sont, de manière évidente,
		# pas des anagrammes. Cela serait peut-être utile si on testait des chaînes très longues,
		# issues d'un document par exemple (en vrai j en sais rien lol)

		# pour commencer, si les chaînes standardisées ne sont pas de la même longueur, ce ne sont forcément pas des anagrammes =>
		if [[ ${#str1} != ${#str2} ]]; then
			echo $pas_anag; return 7;
		fi

		# mtnt, on vérifie si le nombre de voyelles correspond et on les stocke si besoin pour la suite
		# on stocke également les consonnes
		nombreVoyelles $str1; nb_voy1=$nb_voyelles; voyelles1=$voyelles; consonnes1=$consonnes;
		nombreVoyelles $str2; nb_voy2=$nb_voyelles; voyelles2=$voyelles; consonnes2=$consonnes;
		if [[ $nb_voy1 != $nb_voy2 ]]; then
			echo $pas_anag;	return 8;
		fi
		# même nombre de voyelles : on va vérifier qu'elles sont identiques
		triLettres $voyelles1; tri1=$tri;
		triLettres $voyelles2; tri2=$tri;
		if ! [[ "$tri1" == "$tri2" ]]; then
			echo $pas_anag;	return 9;
		fi
		# à ce stade, il ne reste normalement plus que des consonnes.
		# si, triées alphabétiquement, elle ne sont pas identiques, alors ce ne sont
		# officiellement pas des anagrammes
		triLettres $consonnes1; tri1=$tri;
		triLettres $consonnes2; tri2=$tri;
		if [[ $tri1 != $tri2 ]]; then
			echo $pas_anag; return 10;
		else
			echo "Ce sont des anagrammes !!!"; return 11;
		fi
	return 3;
}

### fonction principale
function interface () {
	chaine1=0; chaine2=0;
	while [[ $chaine1 =~ [^[:blank:]] || $chaine2 =~ [^[:blank:]] ]]; do
		echo -e  "Regardons si vos chaînes sont des anagrammes.\n"

		read -p "Entrer votre première chaîne >>>	" chaine1;
		[[ $chaine1 = "" ]] && exit 0;
		read -p "Entrer votre seconde chaîne >>>	" chaine2;
		[[ $chaine2 = "" ]] && exit 0;

		# préparation des chaînes avant de vérifier si ce sont des anagrammes
		# D abord, suppression des espaces pour n'avoir qu une chaîne de caractères => on peut les passer en paramètres
			# ds les prochaines fonctions
		chaine1=$(echo $chaine1 |sed -e 's.[[:space:]]..g');
		chaine2=$(echo $chaine2 |sed -e 's.[[:space:]]..g');
		standardiserChaines $chaine1; chaine1=$chaine_tmp;
		standardiserChaines $chaine2; chaine2=$chaine_tmp;

		verifAnagrammes $chaine1 $chaine2;
		echo $?;

	done
	return 1;
}


################# LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
