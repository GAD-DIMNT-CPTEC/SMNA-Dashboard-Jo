#! /bin/bash

#inctime=/cray_home/carlos_bastarz/bin/inctime
inctime=/opt/inctime/bin/inctime

#lpath=/lustre_xc50/carlos_bastarz/JGerd
lpath=/home/carlos/GitHub/SMNA-Dashboard-Jo/JGerd
#rpath=/lustre_xc50/joao_gerd/SMNA-Oper/SMG/datainout/gsi/dataout
rpath=/extra2/XC50_SMNA_GSI_dataout_JGerd

datai=2023010100
dataf=2023092400

data=${datai}

while [ ${data} -le ${dataf} ]
do

  echo ${data}

  logf=$(ls ${rpath}/${data}/gsiStdout_${data}.runTime-*.log | tail -1)

  mkdir -p ${lpath}/${data}

  cp -v ${logf} ${lpath}/${data}/gsiStdout_${data}.log

  data=$(${inctime} ${data} +6hr %y4%m2%d2%h2)

done

exit 0
