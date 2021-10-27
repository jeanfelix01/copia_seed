#!/bin/bash
IFS='
'

##Script para automatizar a movimentação de torrents da seedbox local para a seedbox  no TD
#versao 1.0

arquivos='/mnt/torrent-seed/torrents-netfelix/arquivos-torrents/'
antigos='/mnt/torrent-seed/torrents-netfelix/torrents-antigos/'


echo Movendo .torrent 'ARQUIVOS -> ANTIGOS'
sleep 5
find $arquivos  -name "*.torrent" | xargs -I '{}' -exec mv {} $antigos -v
echo
echo Movendo .torrets 'LOCAL -> ARQUIVOS'
echo
sleep 5
find "/mnt/torrent/" -name "*.torrent" | xargs -I '{}' -exec mv {} $arquivos -v
echo
sleep 5
echo Iniciando copia dos TORRENTS para o TD
echo
sleep 5
rclone copy "/mnt/downloads/qbittorrent/" "drivetorrents:torrents-netfelix/downloads/" -P
echo
sleep 5
echo Apagando Torrents da maquina local
echo
sleep 5
rm -r -f -v /mnt/downloads/qbittorrent/*
echo
sleep 5
echo Script finalizado ....
