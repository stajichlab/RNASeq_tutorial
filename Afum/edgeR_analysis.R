library(edgeR)

x <- read.delim("Afum_cuffnorm/genes.count_table",row.names="tracking_id")
dim(x)
group <- factor(c(1,1,1,
                  2,2,2))

design <- model.matrix(~group)
y <- DGEList(counts=x,group=group)

y <- estimateGLMCommonDisp(y,design)
y <- estimateGLMTrendedDisp(y,design)
y <- estimateGLMTagwiseDisp(y,design)
fit <- glmFit(y,design)
lrt <- glmLRT(fit,coef=2)
toptags <- topTags(lrt,n=200)
write.csv(toptags,file="combo_toptags.csv")
pdf("combo_edgeRplots.pdf")
plotMDS(y)
plotBCV(y)
