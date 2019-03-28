rm(list=ls())
b=read.table('GSE17215_series_matrix.txt.gz',##读入该文件
             comment.char = '!',header =T,##有！的行不被读入，有表头
             sep = '\t')##以制表符分隔
rownames(b)=b[,1]##以b的第一列为行名
b=b[,-1]##将b的第一列去掉
b=log2(b)##对b中数据求log2
mean(as.numeric(b[1,]))##将b第一行数据框类型转换为数值型，再求第一行平均值
mean(as.numeric(b[2,]))##将b第二行数据框类型转换为数值型，再求第二行平均值
head(rowMeans(b))##对b每一行求平均值，用head查看前6行
for(i in 1:nrow(b)){ ##for循环，变化的是i，i从b的第一行一直循环到第n行
  print(mean(as.numeric(b[i,])))##将b第i行数据框类型转换为数值型，再求第i行平均值，最后打印出结果
}
apply(b,1,function(x){##apply循环一般针对矩阵或者数据框，1代表对行进行处理，对列进行处理则用2表示，设定一个函数
  mean(x)##这个函数是求平均值
})

for(i in 1:nrow(b)){ 
  x=as.numeric(b[i,])##x为b的第i行
  y=x[1]+x[2]-x[3]+x[4]-x[5]+x[6]##y赋值为x的第一个元素加第二个元素减去第三个元素加第四个元素减去第五个元素加第六个元素。对向量取元素直接坐标，对dataframe取元素逗号左行逗号右列（list一样）
  print(y)##输出显示y
}

apply(b,1,max)##求每一行最大值，是apply（b，1，function（x）{max（x）}）的简写

rowMax=function(x){##将rowMax定义为一个函数
  apply(x,1,max)##这个函数的内容是求每一行的最大值
}
rowMax(b)##用定义好的rowMax函数求b

jimmy <- function(b){##构建一个叫jimmy的函数
  for(i in 1:nrow(b)){ 
    x=as.numeric(b[i,])
    y=x[1]+x[2]-x[3]+x[4]-x[5]+x[6]
    print(y)
  }
}
jimmy(b)##对b运行函数jimmy

cg=names(sort(apply(b,1,sd),decreasing = T)[1:50])##对b的每一行求方差，之后从大到小排序，再列出前一到五十的名字
sample(1:nrow(b),50)##sample为随机取值函数，从b的一到n行随机取50个行
pheatmap::pheatmap(b[1:50,])##用b的一到五十行画热图
pheatmap::pheatmap(b[sample(1:nrow(b),50),])##用b中随机取的五十行画热图
pheatmap::pheatmap(b[cg,])##用得到的cg基因画热图
 


