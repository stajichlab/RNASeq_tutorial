#PBS -l nodes=1:ppn=8,mem=2gb -j oe -N tophat
module load bowtie2
module load tophat
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
R=`grep -v ^Accession acc.txt | sed -n ${N}p`
echo $R
tophat -o tophat_out_${R} -G genome/FungiDB-28_Afumigatus_Af293.gff --b2-very-fast -I 3000  -p 8 genome/FungiDB-28_Afumigatus_Af293_Genome.fasta fastq/${R}.fastq

