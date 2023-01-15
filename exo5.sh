#!/bin/bash

### UTILISATION
## Appuyer sur (ENTREE) (champ vide) pour quitter l'interface

## pour savoir si deux chaînes sont des anagrammes, il suffit de leur enlever leurs caractèes spéciaux, ponctuation et chiffres afin de ne garder que les lettres
## puis de trier toutes leurs lettres par ordre alphabétique.
## Si les chaînes obtenues sont identiques, alors ce sont bien des anagrammes.
pas_anag="Ce ne sont pas des anagrammes.\n"

function verifAnag () {
	declare -a tab;
	for i in "$@"; do
		# commande qui trie les caractères des chaînes selon ce qui a été convenu plus haut
		tab+=(`echo "$i" | sed -e 's.[[:punct:][:digit:]]..g' | tr '[:upper:]' '[:lower:]' | grep -o . | sort | tr -d "\n"`);
	done
	[[ ${tab[0]} != ${tab[1]} ]] && echo -e $pas_anag || echo -e "Ce sont des anagrammes !\n";
}

function interface () {
	chaine1=0; chaine2=0;
	while [[ $chaine1 =~ [^[:blank:]] || $chaine2 =~ [^[:blank:]] ]]; do
		echo -e  "Regardons si vos chaînes sont des anagrammes.\n"

		read -p "Entrer votre première chaîne >>>	" chaine1;
		[[ $chaine1 = "" ]] && exit 0;
		read -p "Entrer votre seconde chaîne >>>	" chaine2;
		[[ $chaine2 = "" ]] && exit 0;

		#par définition, si les chaines sont identiques, ce ne sont pas des anagrammes
		if [[ $chaine1 == $chaine2 ]]; then
			echo -e $pas_anag;
			interface;
		fi


		chaine1=$(echo $chaine1 |sed -e 's.[[:space:]]..g');
		chaine2=$(echo $chaine2 |sed -e 's.[[:space:]]..g');

		verifAnag $chaine1 $chaine2;

	done
	return 1;
}


################# LE SCRIPT

while [ true ]; do
	interface;
done

exit 0;
