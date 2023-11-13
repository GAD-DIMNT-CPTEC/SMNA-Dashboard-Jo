#! /bin/bash

# Script para obter e organizar as informações dos logs do GSI
# para dois experimentos.

# Na máquina local, montar os discos da seguinte forma:
# $ cd /extra2
# $ sshfs carlos_bastarz@login-xc50.cptec.inpe.br:/lustre_xc50/ioper/models/SMNA-Oper/SMG/datainout/gsi/dataout XC50_SMNA_GSI_dataout_preOper
# $ sshfs carlos_bastarz@login-xc50.cptec.inpe.br:/lustre_xc50/joao_gerd/SMNA-Oper/SMG/datainout/gsi/dataout XC50_SMNA_GSI_dataout_JGerd

# @cfbastarz (31/08/2023)

#inctime=/cray_home/carlos_bastarz/bin/inctime
inctime=/opt/inctime/bin/inctime

Exps=(JGerd preOper)

datai=2023010100
dataf=2023111300

data=${datai}

while [ ${data} -le ${dataf} ]
do

  for exp in ${Exps[@]}
  do

    echo ${data} ${exp}

    lpath=/home/carlos/GitHub/SMNA-Dashboard-Jo/${exp}
    rpath=/extra2/XC50_SMNA_GSI_dataout_${exp}

    mkdir -p ${lpath}/${data}

    #logf=$(ls ${rpath}/${data}/gsiStdout_${data}.runTime-*.log | tail -1)
    logf=$(ls -t1 ${rpath}/${data}/gsiStdout_${data}.runTime-*.log | head -1)
  
    mkdir -p ${lpath}/${data}
  
    cp -v ${logf} ${lpath}/${data}/gsiStdout_${data}.log

  done

  data=$(${inctime} ${data} +6hr %y4%m2%d2%h2)

done

exit 0
