if(F){
  options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")) 
  ## 查看使用install.packages安装时的默认镜像，一般用install.packages安装时选择清华大学镜像比较好用
  if(! require("devtools")) install.packages("devtools")##判断是否存在devtools包，不存在的话安装
  if(! require("reshape2")) install.packages("reshape2")##判断是否存在reshape2包，不存在的话安装
  if(! require("ggplot2")) install.packages("ggplot2")##判断是否存在ggplot2包，不存在的话安装
  if(! require("pheatmap")) install.packages("pheatmap")##判断是否存在pheatmap包，不存在的话安装
  if(! require("ggpubr")) install.packages("ggpubr") ##判断是否存在ggpubr包，不存在的话安装
  
  #  http://www.bio-info-trainee.com/3727.html
  
  # rm(list = ls()) 
  options()$repos 
  options()$BioC_mirror
  options(BioC_mirror="https://mirrors.ustc.edu.cn/bioc/")
  options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
  options()$repos 
  options()$BioC_mirror
  
  # https://bioconductor.org/packages/release/bioc/html/GEOquery.html
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install("KEGG.db",ask = F,update = F)
  BiocManager::install(c("GSEABase","GSVA","clusterProfiler" ),ask = F,update = F)
  BiocManager::install(c("GEOquery","limma","impute" ),ask = F,update = F)
  BiocManager::install(c("genefu","org.Hs.eg.db","hgu133plus2.db" ),ask = F,update = F)
  
  BiocManager::install(c('airway','DESeq2','edgeR','limma'))##安装这四个包
  
  if(! require("CLL")) biocLite("CLL")##判断是否存在CLL包，不存在的话安装
  if(! require("org.Hs.eg.db")) biocLite('org.Hs.eg.db')##判断是否存在org.Hs.eg.db包，不存在的话安装
  if(! require("clusterProfiler")) biocLite('clusterProfiler')##判断是否存在clusterProfiler包，不存在的话安装
  
  
  library(devtools)##加载devtools包，以下意同
  library(reshape2)
  library(ggplot2)
  library(pheatmap)
  library(ggpubr)
  library(clusterProfiler)
}



## 了解向量，数组，数据库，列表等数据结构
# 了解 数值，字符串等数据类型。

a<-c(1,2,3)##将a赋值为数值型向量c，c包含三个元素1,2,3
a<-c(1,'a',2)##创建字符型向量c,c包含三个元素1,a,2
a<-1:10##创建1到10的向量 输出：1 2 3 4 5 6 7 8 9 10
a<-seq(1,10)##seq函数创建1到10的向量
a<-LETTERS[1:10]##将a赋值为前10个字母，LETTERS为内置变量，代表26个字母，输出："A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
a<-("jimmy's")##创建字符串jimmy's，通常字符型变量要用单引号圈住，但当字符串内部已有单引号时则用双引号圈住

a<-1:10
dim(a)=c(2,5)##给向量a加上维度，变为2行5列的矩阵
pheatmap::pheatmap(a)##用a的数据画热图
a[1,2]='5'##将a的第一行第二列赋值为字符串‘5’，此时a中有字符型变量
pheatmap::pheatmap(a)##报错，不可画图

a<-1:10
dim(a)=c(2,5)
b=as.data.frame(a)##用as函数将a变为数据框，然后赋值给b 

# 取元素的3种方式
b[,3]##取b的第三列，方括号中逗号左是行，逗号右是列，此时为精准下标取法
b[,c(F,F,T,F,F)]##取b的第三列。第一列不取false，第二列不取，第三列取true，第四列不取，第五列不取，此时为判断标取法
b[c(T,F),4]##取b的第一行第四列


options()$repos 
options()$BioC_mirror

##此两行加载一个list数据
d=options()##该list赋值给d
index1=as.numeric(unlist(lapply(d,length))) > 2 ##看d中每个元素的长度，去list化，变为数值型看具体有多少个，判断数值大于2 的赋值给index1
d=d[index1]##将index1中的元素赋值给d
d[4]##取d的第四个元素
length(d)##d的长度
e=d$repos













