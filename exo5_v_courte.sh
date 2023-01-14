#!/bin/bash

### UTILISATION
## Appuyer sur (ENTREE) (champ vide) pour quitter l'interface

## pour savoir si deux chaînes sont des anagrammes, il suffit de leur enlever leurs caractèes spéciaux et chiffres
## puis de trier toutes leurs lettres par ordre alphabétique.
## Si les chaînes obtenues sont identiques, alors ce sont bien des anagrammes.
function verifAnag () {
	declare -a tab;
	for i in "$@"; do
		# commande qui trie les caractères des chaînes selon ce qui a été convenu plus haut
		tab+=(`echo "$i" | sed -e 's.[[:punct:][:digit:]]..g' | tr '[:upper:]' '[:lower:]' | grep -o . | sort | tr -d "\n"`);
	done
	[[ ${tab[0]} != ${tab[1]} ]] && echo "Ce ne sont pas des anagrammes" || echo "Ce sont des anagrammes !";
}

function interface () {
	chaine1=0; chaine2=0;
	while [[ $chaine1 =~ [^[:blank:]] || $chaine2 =~ [^[:blank:]] ]]; do
		echo -e  "Regardons si vos chaînes sont des anagrammes.\n"

		read -p "Entrer votre première chaîne >>>	" chaine1;
		[[ $chaine1 = "" ]] && exit 0;
		read -p "Entrer votre seconde chaîne >>>	" chaine2;
		[[ $chaine2 = "" ]] && exit 0;

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
