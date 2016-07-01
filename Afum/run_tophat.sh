#PBS -l nodes=1:ppn=8 -j oe -N tophat
module load bowtie2
module load tophat
tophat -o tophat_SRR836437 -G genome/FungiDB-28_Afumigatus_Af293.gff --b2-very-fast -I 3000   --fusion-search -p 8 genome/FungiDB-28_Afumigatus_Af293_Genome.fasta fastq/SRR836437.fastq

