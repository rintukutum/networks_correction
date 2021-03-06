#!/bin/sh
#SBATCH --time=72:0:0
#SBATCH --mem=70G
#SBATCH --partition=shared

source ~/.bash_profile
source /work-zfs/abattle4/parsana/networks_correction/shellscripts/dirconfig

cd $scriptDir

## correlation networks

Rscript infer_corrnet.R $datDir/raw_subset.Rdata unsigned $networksDir/raw/correlation_networks.Rdata >$logDir/raw_corrnet.log 2>&1
Rscript infer_corrnet.R $datDir/rin_corrected.Rdata unsigned $networksDir/rin/correlation_networks.Rdata >$logDir/rin_corrnet.log 2>&1
Rscript infer_corrnet.R $datDir/gc_corrected.Rdata unsigned $networksDir/gc/correlation_networks.Rdata >$logDir/gc_corrnet.log 2>&1
Rscript infer_corrnet.R $datDir/pc_corrected.Rdata unsigned $networksDir/pc/correlation_networks.Rdata >$logDir/pc_corrnet.log 2>&1
Rscript infer_corrnet.R $datDir/half_pc_corrected.Rdata unsigned $networksDir/halfpc/correlation_networks.Rdata >$logDir/halfpc_corrnet.log 2>&1
Rscript infer_corrnet.R $datDir/quarter_pc_corrected.Rdata unsigned $networksDir/quarterpc/correlation_networks.Rdata >$logDir/quarterpc_corrnet.log 2>&1

## compute precision and recall
## compute precision recall, make plots
mkdir $resultDir/PR/
mkdir $plotDir/PR/
mkdir $plotDir/density/
## compute precision recall, make plots
mkdir $resultDir/PR/
mkdir $plotDir/PR/
mkdir $plotDir/density/
Rscript pr_corrnet.R Subcutaneous "seq(0.0,0.9,length.out = 50)" $datDir/genesets/canonical_pathways_merged.txt $plotDir $resultDir >$logDir/pr_corrnet_subcutaneous.log 2>&1
Rscript pr_corrnet.R Lung "seq(0.0,0.9,length.out = 50)" $datDir/genesets/canonical_pathways_merged.txt $plotDir $resultDir >$logDir/pr_corrnet_lung.log 2>&1
Rscript pr_corrnet.R Thyroid "seq(0.0,0.9,length.out = 50)" $datDir/genesets/canonical_pathways_merged.txt $plotDir $resultDir >$logDir/pr_corrnet_thyroid.log 2>&1
Rscript pr_corrnet.R Muscle "seq(0.0,0.9,length.out = 50)" $datDir/genesets/canonical_pathways_merged.txt $plotDir $resultDir >$logDir/pr_corrnet_muscle.log 2>&1
Rscript pr_corrnet.R Blood "seq(0.0,0.9,length.out = 50)" $datDir/genesets/canonical_pathways_merged.txt $plotDir $resultDir >$logDir/pr_corrnet_blood.log 2>&1
