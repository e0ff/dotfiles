#!/usr/bin/env bash

# I use this for computers with multiple hard drives

MOUNTPOINT="/mnt/hdd"
dirs=("media" "data" "docs" "vms" "tmp" "mail" "dls" "mail")

for file in "${dirs[@]}"; do
	mkdir -p "${MOUNTPOINT}/${file}"
	echo "Creating symlink ${HOME}/${file}"
	ln -sf "${MOUNTPOINT}/${file}" "${HOME}/"
done

mkdir -p ~/src
