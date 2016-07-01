for n in `grep ^SR acc.txt | awk '{print $1}'`
do
 head -n 1000000 fastq/$n.fastq > fastq/$n.1M.fastq
done
