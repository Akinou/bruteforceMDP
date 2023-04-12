#!/bin/bash
read -p "Entrez le hash : " hash
read -p "Entrez la liste de mots : " wordlist
while read -r line; do
    if [ $(echo -n $line | md5sum | cut -d ' ' -f1) == $hash ]; then
        echo "Mot de passe trouvé : $line"
        exit 0
    fi
done < "$wordlist"
echo "Mot de passe non trouvé"
exit 1
