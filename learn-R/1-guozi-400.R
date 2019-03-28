## 代码注释由果子完成

## 涉及的内容是我周末班关于R语言的部分内容
# 文档链接：https://mubu.com/doc/HGT7XBmgg 密码：muwu
# 变量，数据类型和结构，函数运算，条件控制和循环
# pply系列函数，因子的高阶用法，字符串的操作

##1.R语言基础

## 基本计算，加减乘除比大小

1+2
6-7
3*5
5/4
2^3
log2(8)
2>5
5 >=3
6 < 7

#############

## 数据结构
## 向量c(),rep(),seq() 是变量的一种
## c就是combine联合的意思。rep就是replicate重复的意思，seq就是sequence序列
rep(1,3)
rep("A",3)
seq(1,3)
seq(5,10)

c("TP53","ERBB2","BRCA1")

c(rep(1,3),seq(2,5))


#############
## 变量
## 变量就是储存器，呼之即来，挥之则去

cancergene <- c("TP53","ERBB2","BRCA1")

b <- c("zhangsan","lisi","wangermazi")

# list
ls()

# remove
rm(cancergene)

b
# 只剩下b,获取元素
b[1]
b[2]
b[2:3]
# 获取的也可以赋值
sub <- b[2:3]

set.seed(811)
# 这里引入函数概念，后面讲解
f <- sample(seq(1,100), 10)
f
max(f)
min(f)
sum(f)

# 排序返回值
sort(f)

# 排序返回位置，排序，但是返回他以前的位置
order(f)

f[order(f)]

## 返回位置
which(f==28)

f[which(f==28)]

## 还可以怎么获取位置
d <- c("TP53","ERBB2","BRCA1")
grep("ERBB2",d)
grepl("ERBB2",d)
d[grepl("ERBB2",d)]
# 此时跟 %in% 的用法一样
d %in% "ERBB2"
d[d %in% "ERBB2"]



#############
## 数据框

# 如何创建？
L3 <- LETTERS[1:3]
set.seed(811)
fac <- sample(L3, 10, replace = TRUE)
fac
d <- data.frame(x = 1:10, y = 1:10, fac = fac)

is.data.frame(d)
## is表示判断

exprSet=rnorm(1000)
dim(exprSet)=c(100,10)
exprSet=as.data.frame(exprSet)
## 如何了解一个数据框
head(exprSet)
head(exprSet)[,1:3]


tail(exprSet)
tail(exprSet)[,1:3]

class(exprSet)
dim(exprSet)
str(exprSet)

# 最直观测试
test <- exprSet[1:10,1:10]


# 迅猛地操作一波
# 获取第一行
test[1,]

# 获取第1列
test[,1]
test$subgroup
# 选取第2到4行
test[2:4,]
# 选取第2到4列
test[,2:4]
# 选取第2到4行,3到5列
test[2:4,3:5]

# 删掉第一列
test1 <- test[,-1]


# 调整顺序
test1 <- test1[,c(8,1:7)]

#获取名称
colnames(test)
colnames(test1)
rownames(test)

# 修改名称
colnames(test)[3:5] <- c("GeneA","GeneB","GeneC") 
colnames(test)



#############
## 矩阵
ma <- matrix(c(1:4, 6, 9:15), nrow = 3)
# 给他一个名字
ma
colnames(ma) <- c("A","B","C","D")
rownames(ma) <- c("x","y","z")
ma
rowMeans(ma)
rowSums(ma)

colMeans(ma)
colSums(ma)

# 性价比最高函数就是t()
ma_t <-t(ma)


## 返回某个值所在的位置，几行，几列

which(ma==11,arr.ind = T)

## as表示转换
is.data.frame(ma)
ma_df <- as.data.frame(ma)
is.data.frame(ma_df)

# as 有个系列！也很重要，用于转换数据
as.character()


#加载练习数据
rm(list = ls()) 
#############
## 字符串
###分割，粘贴，计数，选取 
cha="TCGA-AC-A3OD-01B-06R-A22O-07"
cha
# 把他分割一下
strsplit(cha,split = "")
# 查看分割后的类型？
class(strsplit(cha,split = ""))
# 把list破坏掉,并且赋值给gene
unlist(strsplit(cha,split = ""))
# 现在再看这个类型呢
class(unlist(strsplit(cha,split = "")))

## 比如我想去掉重复的字符怎么办unique()
unique(unlist(strsplit(cha,split = "")))
# 如果想知道这个基因有几个字符怎么办？
length(unlist(strsplit(cha,split = "")))

# 实际上有个专门的函数做这个事情nchar()
nchar(cha)
# 我想把这个基因的第14,15个字符取出来
unlist(strsplit(cha,split = ""))[14:15]
# 这两个字符能不合在一起？
paste(unlist(strsplit(cha,split = ""))[14:15],collapse = "")
# 而paste0直接把东西粘在一起
paste0("A","B")
## 实际上，有一个专门的函数就是用来去字符串的
substring(cha,14,15)
## 那么到这里，所有字符串中重要的函数都掌握了。


#############
## 列表，获取[[]]
# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# strsplit会返回列表
split_math <- strsplit(pioneers, split = ":")

class(split_math)
split_math[1]
class(split_math[1])

# 注意是两个符号
split_math[[1]]
class(split_math[[1]])


#############
## 循环
#
primes <- c(2, 3, 5, 7, 11, 13)
# loop version 1
for (p in primes) {
  print(p)
}

# loop version 2 推荐这个
for (i in 1:length(primes)) {
  print(primes[i])
}

#和判断
#if
x <- c("what","is","truth")

if("Truth" %in% x) {
  print("Truth is found")
} else {
  print("Truth is not found")
}

### 实战！！！
## TCGA_id判断是肿瘤还是正常
metadata <- data.frame(id=c(
  "TCGA-AC-A3OD-01B-06R-A22O-07",
  "TCGA-AC-A3OD-11B-06R-A22O-07",
  "TCGA-AC-A3OD-05B-06R-A22O-07"
)) #转换成数据框
metadata
for (i in 1:length(metadata[,1])) {
  num <- as.numeric(substring(metadata[i,1],14,15)) #substring的用法，这是元素获取
  if (num %in% seq(1,9)) {
    metadata[i,2] <- "Tumor"
    } #如果是肿瘤，就给第2列加上Tumor
  if (num %in% seq(10,29)) {
    metadata[i,2] <- "Normal"
    } #如果是正常组织，就给第2列加上Normal
}
names(metadata) <- c("TCGA_id","sample")
metadata
## 上面的事情也可以用ifelse完成

group <- ifelse(as.numeric(substring(metadata$TCGA_id,14,15)) %in% c(1:9),"Tumor","Normal")
metadata1 <- data.frame(TCGA_id=metadata$TCGA_id,
                        sample=group)

metadata1
## 殊途同归！！

### #介绍apply(),lapply(),sapply()
## apply 处理的是矩阵或者数据框的行或者列

#apply(X, MARGIN, FUN, …) 
#其中X为一个数组；MARGIN为一个向量（表示要将函数FUN应用到X的行还是列），
#若为1表示取行，为2表示取列，为c(1,2)表示行、列都计算。
exprSet=rnorm(1000)
dim(exprSet)=c(100,10)
exprSet=as.data.frame(exprSet)
## 如何了解一个数据框
ma <- exprSet[,5:9]
apply(ma, 2, mean)
boxplot(ma)

apply(ma, 1, sum)

## 处理的是列表，出来的还是列表
#lapply(X, FUN, …) 
#lapply返回的是列表，举例
# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
# Split names from birth year
split_math <- strsplit(pioneers, split = ":")
# Take a look at the structure of split_math
str(split_math)
# Convert to lowercase strings: split_low
split_low <- lapply(split_math,tolower)
# Take a look at the structure of split_low
str(split_low)


## sapply 处理的列表，返回的是向量
#sapply(X, FUN, …) 注意和lapply的区别,返回值不一样

# create temp
temp <- list(c(3,7,9,6,-1),
             c(4,8,3,-1,-3),
             c(1,4,6,2,-2),
             c(5,7,9,4,2),
             c(3,7,9,6,-1),
             c(-3,5,8,9,4),
             c(6,9,12,13,5))
# Use lapply() to find each day's minimum temperature
lapply(temp,min)
# Use sapply() to find each day's minimum temperature
sapply(temp,min)
# Use lapply() to find each day's maximum temperature
lapply(temp,max)
# Use sapply() to find each day's maximum temperature
sapply(temp,max)


## R包
#library()
# help,?

