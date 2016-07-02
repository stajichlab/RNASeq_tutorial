module load sratoolkit
module load aspera
mkdir -p fastq
cd fastq
for acc in `awk '{print $1}' ../acc.txt`
do
prefetch -a "/opt/linux/centos/7.x/x86_64/pkgs/aspera/3.6.0/bin/ascp|/opt/linux/centos/7.x/x86_64/pkgs/aspera/3.6.0/etc/asperaweb_id_dsa.openssh" $acc
fastq-dump --skip-technical  --qual-filter-1 -F $acc
done
