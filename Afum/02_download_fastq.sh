module load sratoolkit
module load aspera
mkdir -p fastq
cd fastq
for acc in `awk '{print $1}' ../acc.txt`
do
# comment this out if you aren't on UCR system
prefetch -a "/opt/linux/centos/7.x/x86_64/pkgs/aspera/3.6.0/bin/ascp|/opt/linux/centos/7.x/x86_64/pkgs/aspera/3.6.0/etc/asperaweb_id_dsa.openssh" $acc
# use this if on mac or not on UCR system
# prefetch $acc
fastq-dump --skip-technical  --qual-filter-1 -F $acc
done
