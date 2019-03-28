# 我不喜欢注释，大家自行学习即可

if(F){
  install.packages("devtools")
  biocLite('DESeq2')
}

if(!require('devtools')){
  install.packages("devtools",
                   repos="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")
  
}

if(!require('hgu95av2.db')){
  source("https://bioconductor.org/biocLite.R") 
  options(BioC_mirror="https://mirrors.ustc.edu.cn/bioc/")  
  BiocInstaller::biocLite('hgu95av2.db')
}

if(F){
  install.packages("devtools",
                   repos="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")
  library(devtools) 
  source("https://bioconductor.org/biocLite.R") 
  options(BioC_mirror="https://mirrors.ustc.edu.cn/bioc/")  
  BiocInstaller::biocLite('remotes')
  BiocInstaller::biocLite("jmzeng1314/biotrainee")
  install.packages("matrixStats",repos="https://mirror.lzu.edu.cn/CRAN/")
  
  source("http://bioconductor.org/biocLite.R")
  options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")
  BiocInstaller::biocLite("GEOquery")
  BiocInstaller::biocLite("clusterProfiler")
  BiocInstaller::biocLite("ComplexHeatmap")
  BiocInstaller::biocLite("maftools")
  BiocInstaller::biocLite("ggplot2")
  BiocInstaller::biocLite("jmzeng1314/biotrainee")
}


rm(list=ls())
## 1-10
if(T){
  
  suppressPackageStartupMessages(library(CLL))
  data(sCLLex)
  sCLLex
  exprSet=exprs(sCLLex)   
  ##sCLLex是依赖于CLL这个package的一个对象
  samples=sampleNames(sCLLex)
  pdata=pData(sCLLex)
  group_list=as.character(pdata[,2])
  dim(exprSet)
  exprSet[1:5,1:5]
  
  library(hgu95av2.db)
  ls("package:hgu95av2.db") 
  
  ids=toTable(hgu95av2SYMBOL)
  save(ids,exprSet,pdata,file = 'input.Rdata')
  length(unique(ids$symbol))
  tail(sort(table(ids$symbol)))
  table(sort(table(ids$symbol)))
  
  plot(table(sort(table(ids$symbol))))
  
  table(rownames(exprSet) %in% ids$probe_id)
  dim(exprSet)
  exprSet=exprSet[rownames(exprSet) %in% ids$probe_id,]
  dim(exprSet)
  
  ids=ids[match(rownames(exprSet),ids$probe_id),]
  head(ids)
  exprSet[1:5,1:5]
  tmp = by(exprSet,ids$symbol,
           function(x) rownames(x)[which.max(rowMeans(x))] )
  probes = as.character(tmp)
  dim(exprSet)
  exprSet=exprSet[rownames(exprSet) %in% probes ,]
  dim(exprSet)
  
  rownames(exprSet)=ids[match(rownames(exprSet),ids$probe_id),2]
  exprSet[1:5,1:5]
}
exprSet['GAPDH',]
boxplot(exprSet[,1])
exprSet['ACTB',]


library(reshape2)
exprSet_L=melt(exprSet)
colnames(exprSet_L)=c('probe','sample','value')
exprSet_L$group=rep(group_list,each=nrow(exprSet))
head(exprSet_L)
### ggplot2 
library(ggplot2)
p=ggplot(exprSet_L,
         aes(x=sample,y=value,fill=group))
+geom_boxplot()
print(p)
p=ggplot(exprSet_L,aes(x=sample,y=value,fill=group))+geom_violin()
print(p)
p=ggplot(exprSet_L,aes(value,fill=group))+geom_histogram(bins = 200)+facet_wrap(~sample, nrow = 4)
print(p)
p=ggplot(exprSet_L,aes(value,col=group))+geom_density()+facet_wrap(~sample, nrow = 4)
print(p)
p=ggplot(exprSet_L,aes(value,col=group))+geom_density() 
print(p)
p=ggplot(exprSet_L,aes(x=sample,y=value,fill=group))+geom_boxplot()
p=p+stat_summary(fun.y="mean",geom="point",shape=23,size=3,fill="red")
p=p+theme_set(theme_set(theme_bw(base_size=20)))
p=p+theme(text=element_text(face='bold'),axis.text.x=element_text(angle=30,hjust=1),axis.title=element_blank())
print(p)

## mean,median,max,min,sd,var,mad
g_mean <- tail(sort(apply(exprSet,1,mean)),50)
g_median <- tail(sort(apply(exprSet,1,median)),50)
g_max <- tail(sort(apply(exprSet,1,max)),50)
g_min <- tail(sort(apply(exprSet,1,min)),50)
g_sd <- tail(sort(apply(exprSet,1,sd)),50)
g_var <- tail(sort(apply(exprSet,1,var)),50)
g_mad <- tail(sort(apply(exprSet,1,mad)),50)
g_mad
names(g_mad)
## heatmap 
library(pheatmap)
choose_gene=names(tail(sort(apply(exprSet,1,mad)),50))
choose_matrix=exprSet[choose_gene,]
choose_matrix=t(scale(t(choose_matrix)))
pheatmap(choose_matrix)
## UpSetR
# https://cran.r-project.org/web/packages/UpSetR/README.html
library(UpSetR)
g_all <- unique(c(names(g_mean),names(g_median),names(g_max),names(g_min),
                  names(g_sd),names(g_var),names(g_mad) ))
dat=data.frame(g_all=g_all,
               g_mean=ifelse(g_all %in%  names(g_mean) ,1,0),
               g_median=ifelse(g_all %in%  names(g_median) ,1,0),
               g_max=ifelse(g_all %in%  names(g_max) ,1,0),
               g_min=ifelse(g_all %in%  names(g_min) ,1,0),
               g_sd=ifelse(g_all %in%  names(g_sd) ,1,0),
               g_var=ifelse(g_all %in%  names(g_var) ,1,0),
               g_mad=ifelse(g_all %in%  names(g_mad) ,1,0)
)
upset(dat,nsets = 7)


pdata=pData(sCLLex)
group_list=as.character(pdata[,2])
group_list
dim(exprSet)
exprSet[1:5,1:5]
## hclust 
colnames(exprSet)=paste(group_list,1:22,sep='')
# Define nodePar
nodePar <- list(lab.cex = 0.6, pch = c(NA, 19), 
                cex = 0.7, col = "blue")
hc=hclust(dist(t(exprSet)))
par(mar=c(5,5,5,10)) 
plot(as.dendrogram(hc), nodePar = nodePar,  horiz = TRUE)

## PCA 

library(ggfortify)
df=as.data.frame(t(exprSet))
df$group=group_list 
autoplot(prcomp( df[,1:(ncol(df)-1)] ), data=df,colour = 'group')

## t.test  
dat = exprSet
group_list=as.factor(group_list)
group1 = which(group_list == levels(group_list)[1])
group2 = which(group_list == levels(group_list)[2])
dat1 = dat[, group1]
dat2 = dat[, group2]
dat = cbind(dat1, dat2)
pvals = apply(exprSet, 1, function(x){
  t.test(as.numeric(x)~group_list)$p.value
})
p.adj = p.adjust(pvals, method = "BH")
avg_1 = rowMeans(dat1)
avg_2 = rowMeans(dat2)
log2FC = avg_2-avg_1
DEG_t.test = cbind(avg_1, avg_2, log2FC, pvals, p.adj)
DEG_t.test=DEG_t.test[order(DEG_t.test[,4]),]
DEG_t.test=as.data.frame(DEG_t.test)
head(DEG_t.test)

# DEG by limma 
suppressMessages(library(limma)) 
design <- model.matrix(~0+factor(group_list))
colnames(design)=levels(factor(group_list))
rownames(design)=colnames(exprSet)
design
contrast.matrix<-makeContrasts(paste0(unique(group_list),collapse = "-"),levels = design)
contrast.matrix 
##这个矩阵声明，我们要把progres.组跟stable进行差异分析比较
##step1
fit <- lmFit(exprSet,design)
##step2
fit2 <- contrasts.fit(fit, contrast.matrix) ##这一步很重要，大家可以自行看看效果
fit2 <- eBayes(fit2)  ## default no trend !!!
##eBayes() with trend=TRUE
##step3
tempOutput = topTable(fit2, coef=1, n=Inf)
nrDEG = na.omit(tempOutput) 
#write.csv(nrDEG2,"limma_notrend.results.csv",quote = F)
head(nrDEG)

## volcano plot
DEG=nrDEG
logFC_cutoff <- with(DEG,mean(abs( logFC)) + 2*sd(abs( logFC)) )
DEG$change = as.factor(ifelse(DEG$P.Value < 0.05 & abs(DEG$logFC) > logFC_cutoff,
                              ifelse(DEG$logFC > logFC_cutoff ,'UP','DOWN'),'NOT')
)
this_tile <- paste0('Cutoff for logFC is ',round(logFC_cutoff,3),
                    '\nThe number of up gene is ',nrow(DEG[DEG$change =='UP',]) ,
                    '\nThe number of down gene is ',nrow(DEG[DEG$change =='DOWN',])
)

g = ggplot(data=DEG, aes(x=logFC, y=-log10(P.Value), color=change)) +
  geom_point(alpha=0.4, size=1.75) +
  theme_set(theme_set(theme_bw(base_size=20)))+
  xlab("log2 fold change") + ylab("-log10 p-value") +
  ggtitle( this_tile  ) + theme(plot.title = element_text(size=15,hjust = 0.5))+
  scale_colour_manual(values = c('blue','black','red'))  ## corresponding to the levels(res$change)
print(g)

### different P values 
head(nrDEG)
head(DEG_t.test)
DEG_t.test=DEG_t.test[rownames(nrDEG),]
plot(DEG_t.test[,3],nrDEG[,1])
plot(DEG_t.test[,4],nrDEG[,4])
plot(-log10(DEG_t.test[,4]),-log10(nrDEG[,4]))

exprSet['GAPDH',]
exprSet['ACTB',]
exprSet['DLEU1',]


library(ggplot2)
library(ggpubr)
my_comparisons <- list(
  c("stable", "progres.")
)
dat=data.frame(group=group_list,
               sampleID= names(exprSet['DLEU1',]),
               values= as.numeric(exprSet['DLEU1',]))
ggboxplot(
  dat, x = "group", y = "values",
  color = "group",
  add = "jitter"
)+
  stat_compare_means(comparisons = my_comparisons, method = "t.test")


## heatmap 
library(pheatmap)
choose_gene=head(rownames(nrDEG),25)
choose_matrix=exprSet[choose_gene,]
choose_matrix=t(scale(t(choose_matrix)))
pheatmap(choose_matrix)






