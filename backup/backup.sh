#!/bin/bash

#Variabler
RESTIC_REPOSITORY="sftp:root@192.168.8.111:/root/restic-backup" #Din restic-repository på i detta fall fedora servern ifrån ubuntu via SFTP.
RESTIC_PASSWORD="roflmao25" #ditt lösenord till restic-repositoryt 
BACKUP_PATH="/home/chr/" #Sökvägen till mappen du vill backa upp, i detta fall /home/chr/ på min ubuntu.

export RESTIC_PASSWORD #exportera lösenordet så att restic kan använda det

restic -r $RESTIC_REPOSITORY backup $BACKUP_PATH #Gör en säkerhetskopiering av den angivna mappen via restic. -r anger Restic-repositoryt och backup anger att vi vill göra en backup av mappen.0

restic -r $RESTIC_REPOSITORY forget --keep-daily 7 --keep-weekly 6 --keep-monthly 6 --keep-yearly 1 --prune #behåll 7 dagliga säkerhetskopior, 6 veckovisa, 6 månadsvisa och 1 årsbaserad. Raderar resten.