#!/bin/bash

echo "1. Affichez le nombre d'attributs par document ainsi que l'attribut name. Combien y a-t-il d'attribut par document ? N'affichez que les 12 premières lignes avec la commande head (notebook #2)."
echo -e "\ncat people.json | jq .[] |jq  'length' | head -n 12\n"
cat people.json | jq .[] |jq  'length' | head -n 12
echo -e "\n---------------------------------\n"

echo "2. Combien y a-t-il de valeur 'unknown' pour l'attribut 'birth_year' ? Utilisez la commande tail afin d'isoler la réponse."
echo -e "\ncat people.json | jq 'group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length}| select(.birth_year=="unknown")'| tail -n 4\n"
cat people.json | jq 'group_by(.birth_year)[] | {birth_year: .[0].birth_year, count: length}| select(.birth_year=="unknown")'| tail -n 4
echo -e "\n---------------------------------\n"

echo "3. Affichez la date de création de chaque personnage et son nom. La date de création doit être de cette forme : l'année, le mois et le jour. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)"
echo -e "\ncat people.json | jq .[] | jq '{name:.name, created:(.created/ "T")| .[0]}'|head -n 10\n"
cat people.json | jq .[] | jq '{name:.name, created:(.created/ "T")| .[0]}'|head -n 10
echo -e "\n---------------------------------\n"

echo "4. Certains personnages sont nés en même temps. Retrouvez toutes les pairs d'ids (2 ids) des personnages nés en même temps."
echo -e "\ncat people.json | jq 'group_by(.birth_year)[]|{birth: .[0].birth_year,id: [.[0].id, .[1].id], count: length} |select(.count==2)\n"
cat people.json | jq 'group_by(.birth_year)[]|{birth: .[0].birth_year,id: [.[0].id, .[1].id], count: length} |select(.count==2)'
echo -e "\n---------------------------------\n"

echo "5. Renvoyez le numéro du premier film dans lequel chaque personnage a été vu suivi du nom du personnage. N'affichez que les 10 premières lignes. (Pas de Réponse attendue)"
echo -e "\ncat people.json | jq '.[]' | jq '(.films[0] / "/"|.[-2])+ " "+.name '| head -n 10 \n"
cat people.json | jq '.[]' | jq '(.films[0] / "/"|.[-2])+ " "+.name '| head -n 10
echo -e "\n---------------------------------\n"