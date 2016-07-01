#PBS -l nodes=1:ppn=8,mem=2gb -j oe -N cufflinks
module load cufflinks
N=$PBS_ARRAYID
CPU=$PBS_NUM_PPN
if [ ! $CPU ]; then
 CPU=2
fi
if [ ! $N ]; then
 N=$1
fi
if [ ! $N ]; then
 echo "need a cmdline option or array id with -t option in qsub"
 exit
fi
R=`grep -v ^Accession acc.txt | sed -n ${N}p | awk '{print $1}'`
echo $R
if [ ! -f cuffquant_${R}/abundances.cxb ]; then
 cuffquant genome/FungiDB-28_Afumigatus_Af293.gff tophat_out_${R}/accepted_hits.bam -p $CPU -o cuffquant_${R}
fi

