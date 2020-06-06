#!/usr/bin/env bash

clear
declare -i numFiles
numFiles=$(find . -maxdepth 1 -not -type d | wc --lines)

function makeValidGuess {
	until read -p "Unesite koliko datoteka ima u trenutnom direktorijumu: " guess;
	[[ "$guess" =~ ^[0-9]+$ ]]; do
		echo -e "\nUnesite pozitivan ceo broj\n"
	done
}
while makeValidGuess; do
	if (( guess < numFiles )); then
		echo -e "\nVasa procena je premala."
	elif (( guess > numFiles )); then
		echo -e "\nVasa procena je prevelika."
	else
		echo -e "\nOdgovor $numFiles je tacan!"
		exit
	fi
done
