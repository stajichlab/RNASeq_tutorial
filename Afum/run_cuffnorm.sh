#PBS -l nodes=1:ppn=8,mem=2gb -j oe -N cuffnorm
module load cufflinks
N=$PBS_ARRAYID
CPU=$PBS_NUM_PPN
if [ ! $CPU ]; then
 CPU=2
fi
CTL="cuffquant_SRR836437/abundances.cxb,cuffquant_SRR836438/abundances.cxb,cuffquant_SRR836439/abundances.cxb"
EXP="cuffquant_SRR836440/abundances.cxb,cuffquant_SRR836441/abundances.cxb,cuffquant_SRR836442/abundances.cxb"

cuffnorm genome/FungiDB-28_Afumigatus_Af293.gff -o Afum_cuffnorm $CTL $EXP

