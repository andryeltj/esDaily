#!/bin/bash
ANO=$(date '+%Y')
MES=$(date '+%m')
DIA=$(date '+%d')
LINHA=$(date '+%d.%m.%Y')
MESNOME=""
troca=""
if [ $MES == "01" ]; then MESNOME="Janeibro"; fi
if [ $MES == "02" ]; then MESNOME="Fevereiro"; fi
if [ $MES == "03" ]; then MESNOME="Março"; fi
if [ $MES == "04" ]; then MESNOME="Abril"; fi
if [ $MES == "05" ]; then MESNOME="Maio"; fi
if [ $MES == "06" ]; then MESNOME="Junho"; fi
if [ $MES == "07" ]; then MESNOME="Julho"; fi
if [ $MES == "08" ]; then MESNOME="Agosto"; fi
if [ $MES == "09" ]; then MESNOME="Setembro"; fi
if [ $MES == "10" ]; then MESNOME="Outubro"; fi
if [ $MES == "11" ]; then MESNOME="Novembro"; fi
if [ $MES == "12" ]; then MESNOME="Dezembro"; fi
TABELA=`cat es$ANO.tsv`
#if [ -e $TABELA > "" ]; then troca=$troca; else echo "O arquivo está faltando"; fi
NOMDIA=`cat es$ANO.tsv | grep -w "$LINHA" | awk -F "	" '{print $2}'`
TXTDIA=`cat es$ANO.tsv | grep -w "$LINHA" | awk -F "	" '{print $4}'`
DATTXT=`cat es$ANO.tsv | grep -w "$LINHA" | awk -F "	" '{print $5}' | fold -w40 -s`
FTCOMM=`cat es$ANO.tsv | grep -w "$LINHA" | awk -F "	" '{print $6}'`
COMMEN=`cat es$ANO.tsv | grep -w "$LINHA" | awk -F "	" '{print $7}' | fold -w32 -s`
printf "\n$NOMDIA, $DIA de $MESNOME.\n\n$DATTXT\n— $TXTDIA\n"
#printf "\n\n$COMMEN\n— $FTCOMM\n";

