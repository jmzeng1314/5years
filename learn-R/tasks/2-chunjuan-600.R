###########
### Basic plot in R for biotrainee
### R语言基础绘图，注释工作由春卷完成
###########################
#——————————————————————————————————————————————————————————————————————————
# 1.字体大小
# par(family = "STHeiti")
plot(c(0:5), col = 'white')
text(2,4, labels = 'font=1:正常字体（默认）', font = 1)
text(3,3, labels = 'font=2:粗体字体',font = 2)
text(4,2,labels = 'font=3:斜体字体',font = 3)
text(5,1,labels = 'font=4:粗斜体字体',font=4)

# 不是我给你这些代码，你就一股脑的往下跑吗？好孩子，好好使用帮助文档学习新知识
###################################好好好，练一下#################################
?plot  # 好的，plot就是画图的简单函数,usage: plot(x,y,...) 
## x左边，y坐标，"..."就是很多描述这个点的限定方式和参数，例如颜色啦，大小啦，形状啦~~
plot(1,2)               # 给我画出了一个点
plot(c(1:3),c(2:4))     # 给我画出了三个点
plot(c(1:10),c(1:10))   # 给我画了十个点
plot(c(1:10),c(1:10),l) # 好像参数不是这么加的
plot(c(1:10),c(1:10),xlab = "months",ylab = "days")           ## 给加了X,Y轴title了
plot(c(1:10),c(1:10),xlab ="months",ylab = "days",font = 2)   ## 横纵坐标的标变了
#  font = 1 正常字体；font = 2粗体；font = 3 斜体；font = 4 粗斜字体
plot(c(1:10),c(1:10),xlab = "months",ylab = "days",
     text(3,7, labels = 'font=1:正常字体（默认）', font = 1)) ## 加上字啦

plot(c(1:10),c(1:10),xlab ="months",ylab = "days",
     text(4,6, labels = 'font=2:粗体字体',font = 2),font=2)   ## 加上字啦，并且还能改字体
     
######################行行行，算你厉害##################################

?require(stats) # Loading/Attaching and Listing of Packages，for lowess回归, rpois泊松分布, rnorm产生服从正太分布的随机数
?stats         # 是一个统计学计算和随机数生成的包
# require(stats) 就是load什么包的意思
plot(cars)     ## 画一个散点图
cars           ## 是一个内置的数据包
?lines(lowess(cars))   ## lowess(cars) 对cars进行回归，然后lines出来

plot(sin, -pi, 2*pi)  ## see ?plot.function  curve(expr, from = NULL, to = NULL,...)
## 对sin作图，然后呢，范围是从-pi(圆周率)到2*pi

## Discrete Distribution Plot离散分布的plot:
plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10,
     main = "rpois(100, lambda = 5)")

## Simple quantiles/ECDF, see ecdf() {library(stats)} for a better one:
plot(x <- sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")
points(x, cex = .5, col = "dark red")


##
plot(c(0:5), col = 'white')  ## 画了一个框框，col是白色，白色不就什么都没有
plot(c(0:5), col = 'black')  ## 换成黑色看看，哎哟，不错哦
plot(c(0:5), col = 'orange')  ## 只能改颜色吗？
plot(c(0:5), c(0:5), col = 'black')  ## 为啥和plot(c(0:5), col = 'black')没区别？
plot(c(0:5), c(3:8), col = 'black')  ## 前面是x坐标，后面是y坐标
plot(c(2:7), c(3:8), col = 'black')  ## yes, we are right!

text(2,4, labels = 'font=1:正常字体（默认）', font = 1)  ## 直接加上去吗？没有前面的框框图也可以吗？
text(3,3, labels = 'font=2:粗体字体',font = 2)
text(4,2,labels = 'font=3:斜体字体',font = 3)
text(5,1,labels = 'font=4:粗斜体字体',font=4)
rm(list = ls())
text(3,3, labels = 'font=2:粗体字体',font = 2)
text(4,2,labels = 'font=3:斜体字体',font = 3)
text(5,1,labels = 'font=4:粗斜体字体',font=4)

##以上只是简单的画出一个图，然后加字体，那么我们可以拆分这些代码去了解
## 前面有一个画图的代码，plot，boxplot等等都可以
## 然后再加上代表字体属性的代码，如大小font，颜色color，位置1,2(x,y)
## 抓住这个规律，后面还会有相应的改变
#——————————————————————————————————————————————————————————————————————————————

# 1.1 字体大小
## 思考一下字体会怎么变化，除了我们直接给它规定大小之外?
plot(c(0:6),col='white',xlim = c(1,8))
plot(c(0:6),col='black',xlim = c(1,8))  ## 变成黑色，可以看出 xlim是x轴范围，那么相应还会有y轴的
plot(c(0:6),col='black',xlim = c(1,8),ylim = c(0,8))  ## 很棒
plot(c(0:6),col='#D114F2',xlim = c(1,8),ylim = c(0,8))  ## 将颜色换成颜色码
text(2,5,labels = 'cex=0.5:放大0.5倍',cex=0.5)
text(3,4,labels = 'cex=0.8:放大0.8倍',cex=0.8)
text(4,3,labels = 'cex=1(默认):正常大小',cex=1)
text(5,2,labels = 'cex=1.2:放大1.2倍',cex=1.2)
text(6,1,labels = 'cex=1.5:放大1.5倍',cex=1.5)
## 可以理解吧

## 以上的知识点有
## 1.绘图基本代码，x,y值，x,y轴的大小限制；
## 2.图内标识的颜色，color，相信color不会仅仅是black等等，可以直接用颜色码代替
## 3.添加字体的代码，字体的位置(x,y),大小cex，形状加粗或者斜体font
## 总的来说，只要在代码选项允许的范围内，可以做非常多的改变。
## 那么当一幅图有多组的时候，需要改变点的样式
#——————————————————————————————————————————————————————————————————————————————

# 1.2 点的样式
## 照例思考一下点会怎么样，圆的，方的
par(mar=c(0,0,0,0))   ## 空的，变成白板啦

plot(1,col='white',xlim = c(1,9),ylim = c(1,7))
plot(1,col='#D114F2',xlim = c(1,9),ylim = c(1,7)) # 习惯换成有颜色的

## 这是一个for循环
for(i in 0:25){
  x <- (i%/%5)*1+1
  y <- 6-(i%%5)
  if(length(which(c(21:25)==i)>=1)){
    #21--25的点格式可以设置背景色
    points(x,y,pch=i,bg='red',cex=2)
  }else{
    points(x,y,pch=i,cex=2)
  }
  text(x+0.2,y+0.3,labels = paste('pch=',i),cex=0.8)
}
## 懵。。
points(6,5,pch='*',cex=2);text(6.2,5.3,labels = paste('pch=\'*\''),cex=0.8)
points(6,4,pch='.',cex=2);text(6.2,4.3,labels = paste('pch=\'.\''),cex=0.8)
points(6,3,pch='o',cex=2);text(6.2,3.3,labels = paste('pch=\'o\''),cex=0.8)
points(6,2,pch='O',cex=2);text(6.2,2.3,labels = paste('pch=\'O\''),cex=0.8)
points(7,6,pch='0',cex=2);text(7.2,6.3,labels = paste('pch=\'0\''),cex=0.8)
points(7,5,pch='+',cex=2);text(7.2,5.3,labels = paste('pch=\'+\''),cex=0.8)
points(7,4,pch='-',cex=2);text(7.2,4.3,labels = paste('pch=\'-\''),cex=0.8)
points(7,3,pch='|',cex=2);text(7.2,3.3,labels = paste('pch=\'|\''),cex=0.8)
# points(位置(x,y),pch形状,cex大小;打字位置(x,y)，标签labels,cex大小)
## 会用就行了
#——————————————————————————————————————————————————————————————————————————————

# 1.3线的样式
## 大约有虚线，实线的区别吧。。
rm(list = ls())
par(mar=c(0,0,0,0)) ## 白板
data = matrix(rep(rep(1:7),10),ncol = 10, nrow = 7)  
## 创建7行10列的数据，每一行都是重复的数据

plot(data[1,],type = 'l',lty=0,ylim = c(1,8),xlim = c(-2,10),axes = F,
     xlab = '', ylab = '')  
## 对第一行画图（都是1）啥都没有啊，x,y的范围和标题都是空，axes=F 没有，lty=0

text(-1,1,labels = paste('lty=0',':不画线'))
## 打个字 lty=line type =0,就是不画线的意思

id = c('不画线','实线','虚线','点线','长画线','点画线','点长画线')
## 给了7个id
for(i in 2:7){
  lines(data[i,],lty=i-1)  ## 我想不通的lty=1,。。。代表不通的线
  text(-1,i,labels = paste('lty=',i,':',id[i]))
}
## 好呢！加油！
#——————————————————————————————————————————————————————————————————————————————

# 1.4线的宽度
par(mar=c(0,0,0,0))
data = matrix(rep(rep(1:5),10),ncol = 10, nrow = 5)

plot(data[1,],type = 'l',lwd=0.5,ylim = c(1,6),xlim = c(-2,10),axes = F,
     xlab = '', ylab = '') 
## 又是一个空白板哦，lwd= line wide线的宽度 axes仍旧F

text(0,1,labels = 'lwd=0.5')
lines(data[2,],lwd=0.8);text(0,2,labels = 'lwd=0.8')
lines(data[3,],lwd=1);text(0,3,labels = 'lwd=1')
lines(data[4,],lwd=2);text(0,4,labels = 'lwd=2')
lines(data[5,],lwd=4);text(0,5,labels = 'lwd=4')
## easy！
#——————————————————————————————————————————————————————————————————————————————
## 小结一下
## 1.绘图基本代码plot、boxplot等等；
## 2.图内标识的颜色、形状，color，pch
## 3.添加字体的代码，字体的位置(x,y),大小cex，形状加粗或者斜体font
## 4.添加线line，线的样式和大小~

#——————————————————————————————————————————————————————————————————————————————
# 1.5坐标轴的密度分布展示
## 乍一看题目看不懂
plot(cars$speed,cars$dist)
rug(cars$speed)  ## 有的地方就加
rug(cars$dist,side = 2)  ## 有数值的地方就加
## 跑了才知道是坐标轴的
## 目前还没想起什么图会用上这些
#——————————————————————————————————————————————————————————————————————————————

# 1.6图形边框
rm(list = ls())
x.text <- c('1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月')
sales.volume <- c(158721,190094,108441,88092,68709,50116,90117,160044,186045,
                  106334,89092,104933)
id <- c('o','l','7','c','u',']')
# 创建所需向量
par(mfrow=c(2,3))  ## 2行，每行3个图
for (i in 1:length(id)){
  plot(sales.volume,type = 'b',ylim = c(20000,250000),xaxt='n',yaxt='n',
       bty = id[i], main = paste('bty取',id[i],sep=''),xlab='月份',ylab='销量')
  axis(1,at=1:12,labels = x.text,tick = FALSE);axis(2,tick = FALSE)
}


?par  # 设置和查询图像参数
## 关于mfrow
?cex # 一种数值，表示相对于默认值，绘图文本和符号应放大多少。当设备打开时，它从1开始，当布局改变时，它被重置，例如通过设置mfrow
#mfrow  # 样式c(nr, nc)的向量。后续的图形将通过列(mfcol)或行(mfrow)在设备上的一个nc -by-nc数组中绘制。
# mfg # 一种形式c(i, j)的数字向量，其中i和j表示图形数组中的哪个图形将被绘制(如果设置)或正在绘制(如果查询)。数组必须已经由mfcol或mfrow设置
### 例子
op <- par(mfrow = c(2,2), # 2 x 2 pictures on one plot
          pty = "s")       # square plotting region,
# independent of device size
#box()函数也可以设置各边框的线条样式，bty-边框，col-颜色，lwd-线宽，lty-线样
#——————————————————————————————————————————————————————————————————————————————

# 1.7网格线
par(mfrow=c(1,1))  ## 改回来，一张图里面只有一张图
plot(sales.volume,type = 'b',ylim = c(20000,250000),xaxt='n',yaxt='n',
     main = '月销量趋势图',xlab='月份',ylab='销量（元）')
axis(1,at=1:12,labels = x.text,tick = FALSE)
grid(nx=NA, ny=8, lwd=1, col='skyblue')  ## 这是加网格线的代码~
#——————————————————————————————————————————————————————————————————————————————

# 1.8点的样式（跟上面重复了吗）
x <- 2:9;
y <- 2:9
par(mfrow=c(3,3),mar=c(2,2,2,2)) ## mar (底、左、上、右)
ida <- c('p','l','b','c','o','h','s','S','n')
for(i in 1:length(ida)){
  plot(1,1,ylim=c(1,10),xlim = c(1,10),col='white',
       main = paste('type=',ida[i],sep = ''))
  points(x,y,type=ida[i])
}
?par
# mar表格c中的一个数字向量(底、左、上、右)，它给出了要在图的四边指定的边距的行数。
# 默认值是c(5,4,4,2) + 0.1。
#——————————————————————————————————————————————————————————————————————————————

# 1.9线
par(mfrow=c(1,1),mar=c(2,2,2,2))
pv <- sample(100,10)
uv <- sample(1000,10)
sol <- lm(pv~uv)
plot(pv~uv,xlab=R.version.string,ylab = Sys.time())
abline(sol)
?lm
# Fitting Linear Models lm用于线性模型的拟合。它可以用来进行回归、单层方差分析和协方差分析(虽然aov可以为这些提供更方便的接口)
# 自己做一个试试
a<- c(1:10)  # 创建向量1
b<- c(3:12)  # 创建向量2
sol_1<- lm(a~b)  # 拟合
plot(a~b,xlab="x",ylab = "y") # 把数据画出来
abline(sol_1) # 添加拟合曲线
# 再试试一个
d<- c(1,4,2,4,6)  # 创建向量1
f<- c(2,4,6,8,10)  # 创建向量2
sol_2<- lm(a~b)  # 拟合
plot(d~f,xlab="x",ylab = "y",col="red") # 把数据画出来
abline(sol_2,col="red")
text(5,5,labels = "就是加个字")
# 棒
### 以后要做拟合曲线，就给向量1,2然后lm，再plot，abline即可
## 结合以上所学，可添加字，颜色，调整线的情况等等
#——————————————————————————————————————————————————————————————————————————————

# 1.10线段
par(mfrow=c(1,1),mar=c(4,4,4,4)) 
# mfrow表明我这张图里需要显示的图片数据，显然目前是1*1张
# 当需要多张的时候，就可以在这里修正
# mar要调大一点，这样才能看到label
## 其实mar就是画的边距，上下左右的大小，画到这里才明白是什么。
## 显然par就是设置一些基本的参数
pv <- sample(100,10)
uv <- sample(1000,10)
plot(pv,uv,xlab=R.version.string,ylab = Sys.time())
segments(pv[1],uv[1],pv[5],uv[5])

## 上面的图片太单调啦，我们来运用前面的知识，画一个有趣的
## 更改点的样式，更改点的颜色
## 更改线的样式和颜色
## 添加字体，修改字体的样式和颜色

plot(pv,uv,xlab=R.version.string,ylab = Sys.time(),
     col="red",pch='*',cex=2) # 看见没label
segments(pv[1],uv[1],pv[5],uv[5],lty=1,lwd = 3,col = "blue")
text(60,400,labels = "干得漂亮！",font=2,col="orange")
#——————————————————————————————————————————————————————————————————————————————

# 1.11箭头
## 感觉跟直线是一样的打法~可以跟直线做类比哦~
plot(1,xlim = c(0,10),ylim = c(0,8),col='white')
arrows(1,1,8,1,angle = 90);text(9,1,'angle=90')
arrows(1,3,8,3,angle = 60);text(9,3,'angle=60')
arrows(1,5,8,5,angle = 30);text(9,5,'angle=30')
arrows(1,7,8,7,angle = 0);text(9,7,'angle=0')
#——————————————————————————————————————————————————————————————————————————————

# 1.12 多边形
# 多边形1
## 暂时想不出来
par(mfrow = c(2,1),mar=c(3,2,3,2))  # 2*1张图，并且把画边距改小一点
## 发现之前画图的基本设置会沿用到下一张图，所以在画图之前可以稍微修改一下基本设置
plot(0,xlim = c(0,10),ylim = c(0,10),col='white')  ## 只要设置为white，就是一块白板
polygon(x=c(1,1,9,9),y=c(9,1,1,9),col = 'orange',border = 'blue')
## 猜border是边缘的意思
plot(0,xlim = c(0,10),ylim = c(0,10),col='white')
polygon(x=c(1,1,9,9),y=c(9,1,9,1),col = 'orange',border = 'blue')
?polygon
# 多边形绘制顶点在x和y中给定的多边形。
## 要不我们来画一个有意思的
par(mfrow = c(2,1),mar=c(3,2,3,2))
plot(0,0,xlim = c(0,10),ylim = c(0,15),col='white') 
polygon(x=c(1,2,4,9),y=c(9,1,1,9),col = 'pink',border = 'yellow')
plot(0,0,xlim = c(0,10),ylim = c(0,15),col='white') 
polygon(x=c(1,4,5,4),y=c(9,1,1,9),col = 'pink',border = 'yellow')
text(2,4,labels = "come on!", font = 3,cex = 0.5)
text(4,6,labels = "come on!", font = 3,cex = 2)

## 多边形2
par(mfrow = c(1,1),mar=c(4,4,4,4))
n <- 100
xx <- c(0:n, n:0)
yy <- c(c(0, cumsum(stats::rnorm(n))), rev(c(0, cumsum(stats::rnorm(n)))))
plot   (xx, yy, type = "n", xlab = "Time", ylab = "Distance")
polygon(xx, yy, col = "gray", border = "yellow")
title("Distance Between Brownian Motions",col="blue") # 不能改颜色耶,所以标题还需要另外改
?title

## 简单来补充一下title的知识咯
## Specifying "..." :
plot(1, col.axis = "sky blue", col.lab = "thistle") # 轴的颜色，label的颜色
title("Main Title", sub = "sub title", ## title内容，
      cex.main = 2,   font.main= 4, col.main= "blue", # 大小，样式，颜色
      cex.sub = 0.75, font.sub = 3, col.sub = "red")
## 把学到的应用到之前的图上
plot(xx, yy, type = "n", xlab = "Time", ylab = "Distance",
      col.axis = "blue",col.lab = "pink") # 设置坐标轴颜色，坐标轴名字颜色)
polygon(xx, yy, col = "gray", border = "yellow")
title("Distance Between Brownian Motions", sub = "biotrainee", ## title内容
      cex.main = 1,font.main= 2, col.main= "red",
      cex.sub = 0.75, font.sub = 3, col.sub = "green") 
#——————————————————————————————————————————————————————————————————————————————

# 1.13 气泡图
## 在心里默默的想了一遍气泡图应该是怎么样的，想不出来
id <- c('手机数码','食品饮料','电脑办公','家居用品','母婴玩具','家用电器','服装鞋帽','日用百货','虚拟商品','箱包礼品')
conver <- c(0.012,0.02,0.015,0.014,0.018,0.013,0.01,0.025,0.045,0.011)
pv <- c(23.19,10.89,15.09,12.11,9.6,20.29,40.56,28.66,20.43,13.84)
price <- c(3509,59,2501,509,411,3011,476,81,379,610)
## 构建了所需向量

library(RColorBrewer)
col <- brewer.pal(11,'Spectral')[2:11]

cex.max <- 12
cex.min <- 3
a <- c(cex.max-cex.min)/(max(price)-min(price))
b <- cex.min-a*min(price)
cex2 <- a*price+b
#cex2 <- price/max(price)
par(mfrow = c(1,1),mar=c(2,2,2,2))
plot(pv,conver,col=col,cex=cex2,pch=16,ylim = c(0,0.06),xlab = '页面浏览量（万）',ylab = '转化率',main=list('各类目转化率-页面浏览量-客单价',cex=1.5),yaxt='n')
legend('topleft',legend = id,pch=16,col=col,bty='n',cex=0.75,ncol=5)
axis(2,labels = paste(seq(0,5,1),'%',sep = ''),at=seq(0,0.05,0.01))
text(x=pv,y=conver,labels = price,cex=0.8)
text(x=38,y=0.055,labels = 'Z-客单价',cex=1.1)
## 这个图我没咋研究
#——————————————————————————————————————————————————————————————————————————————

# 1.14 曲线图
x.text <- c('1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月')
sales.1 <- c(49.9,71.5,106.4,129.2,144,176,135.6,148.5,216.4,194.1,95.6,54.4)
sales.2 <- c(83.6,78.8,98.5,93.4,106.0,84.5,105,104.3,91.2,83.5,106.6,92.3)
sales.3 <- c(48.9,38.8,39.3,42.4,47,48.3,62,59.6,52.4,65.2,59.3,53)
sales.4 <- c(42.4,33.2,34.5,39.7,52.6,70.5,57.4,62,47.6,39.1,46.8,51.1)
id <- c('帆布鞋','T恤','皮包','冲锋衣')
col <-c('green','yellow','brown','gray')
plot(sales.1,type = 'b',xaxt='n',ylim = c(0,300),col=col[1],main = '月销量趋势图',xlab = '月份',ylab = '销量（万）')
axis(1,at=1:12,labels = x.text,tick = FALSE)
legend('topleft',legend = id,horiz = T,pch=15,col=col,cex=0.8,bty='n')
grid(nx=NA,ny=8,lwd=1,lty=2,col='skyblue')

lines(sales.2,type = 'b',col=col[2])
lines(sales.3,type = 'b',col=col[3])
lines(sales.4,type = 'b',col=col[4])
## 就是一个一个往上叠加
#——————————————————————————————————————————————————————————————————————————————

# 1.15 柱状图
id <- LETTERS[1:11]
month.3 <- c(25746,8595,12832,10910,7034,2978,6934,4770,1137,1164,6926)
month.4 <- c(46496,20150,19682,14177,20703,8434,9560,5113,1804,1468,11156)
month.5 <- c(53346,26547,23271,16909,14786,12733,11545,7483,2506,1743,11869)
data <- matrix(c(month.3,month.4,month.5),ncol = 3)
## 创建向量之后组合成为矩阵
library(RColorBrewer)
col <- brewer.pal(11,'Spectral')[1:11]
?col
# 返回一个整数矩阵，该矩阵指示类矩阵对象中的列号，或列标签的因数。
?brewer.pal
# 创建好看的调色板，特别是专题地图

par(mfrow = c(1,1),mar=c(4,4,4,4))
barplot(data,col = col,xaxt='n',beside = TRUE,ylim = c(0,60000))
title(main = list('订单取消原因',cex=1.5),sub = '月份：3-4 品类：鞋',
      ylab='订单月取消数目')
?barplot
# 创建带有垂直或水平条的条形图。
# col 条形或条形分量的颜色向量。默认情况下，如果高度是向量，则使用灰色，如果高度是矩阵，则使用伽玛校正灰色调色板。
# besides 一个逻辑值。如果为F，则高度列表示为堆叠条，如果为T，则列表示为并置条。


legend('topleft',legend = id,pch = 15,col = col,ncol = 2,cex = 0.8) ## 给legend
axis(1,labels = c('3月份','4月份','5月份'),at=c(6,18,30),tick = FALSE)  ## 给x轴

per100 <- function(x){
  x <- x/sum(x)
  result <- paste(round(x*10000)/100,'%',sep='')
  result
}

text(labels = c(per100(month.3),per100(month.4),per100(month.5)),cex=0.6,
     x=c(seq(from=1.5,by=1,length.out = 11),seq(from=13.5,by=1,
                                                length.out=11),seq(from=25.5,by=1,length.out = 11)),
     y=c(month.3,month.4,month.5)+1000)
### 不明所以
#——————————————————————————————————————————————————————————————————————————————

# 1.16 条状图
### 代码越来越复杂，就越来越讨厌。
id <- LETTERS[1:18]  # 创建向量
pv <- sort(sample(30000,18),decreasing = TRUE) # 创建向量

library(RColorBrewer)
col <- c(brewer.pal(9,'YlOrRd')[1:9],brewer.pal(9,'Blues')[1:9])  ## 调色

# 绘图
barplot(pv,col = col,horiz = TRUE,xlim = c(-3e3,3e4))
# 跟上面不同的地方，horiz=T，也就是水平的
title(main = list('ASDFGHJKL',cex=1.5),sub = R.version.string,
      ylab = Sys.time())
text(y=seq(from=0.7,length.out = 18,by=1.2),x=-1500,labels = id)
legend('topright',legend = rev(id),pch = 15,col = rev(col),ncol = 2,cex = 0.5)

text(labels=paste(round(1e4*pv/sum(pv))/100,'%',sep=''),cex=0.65,
     y=seq(from=0.7,length.out = 18,by=1.2),x=pv+1000)
## 下面就是常规的
#——————————————————————————————————————————————————————————————————————————————

# 1.17 饼图
data <- LETTERS[1:7] # LETTERS内置向量，字母ABCDEFG
num <- runif(7) #
?runif # 产生随机偏差

library(RColorBrewer)
col <- brewer.pal(11,'Dark2')[3:11]
pie(num,col = col,xaxt='n',labels=paste(id,':',round(num*1000)/100,'%',sep=''))
## 显然pie就是画饼图的函数
# ??xaxt='n'  不知道这是个啥玩意
title(main = list('ZXCVBNM',cex=1.5),sub = Sys.Date())

pie(num,col = col,xaxt='n',labels=paste(id,':',round(num*1000)/100,'%',sep=''))
## 哈哈哈，改成a就剩下一个角,xaxt必须是n哦
#——————————————————————————————————————————————————————————————————————————————

# 1.18 双坐标图
# step1 设置数据，简单画图
data <- data.frame(pre=c(113,134,123,145,137,196,187),
                   now=c(129,122,134,149,146,215,208))

ylim.max <- 550
col <- c('green','yellow')
barplot(as.matrix(rbind(data$pre,data$now)),
        beside = TRUE, ylim = c(0, ylim.max), col = col, axes = F)
axis(2,col.axis='red',col='orange',col.ticks = 'skyblue') 

# step2 设置坐标
#设置坐标都是我们之前学的
title(main = list('主标题',cex=1.5,col='red',font=3),
      sub = paste('副标题','\n',R.version.string,Sys.time()),
      ylab = 'y轴标题')

## step3 设置图例 legend
text.legend = c('上周PV','本周PV','pv同比增长','PV环比增长')
col2 = c('black','blue')
legend('topleft',pch=c(15,15,16,16),legend = text.legend, col=c(col,col2),
       bty = 'n',horiz = TRUE,cex =0.65,x.intersp=0.5,pt.cex=0.5)

# step4 添加x轴坐标
#添加x轴坐标
text.x <- c('周一','周二','周三','周四','周五','周六','周日')
axis(side = 1,c(2,5,8,11,14,17,20),labels = text.x, tick = FALSE, cex.axis=0.75)

# step5 添加副坐标
axis(4,at=seq(from = 250, length.out = 7, by =40),
     labels = c('-60%','-40%','-20%','0','20%','40%','60%'))

# #同比增长=（now[t]-pre[t]）/pre[t]
same.per.growth <- (data$now - data$pre)/data$pre
#环比增长 = （now[t]-now[t-1]）/now[t-1]
ring.growth <- c(NA,diff(data$now)/data$now[1:(length(data$now) -1)])
a <- 200;b <- 370
lines(c(2,5,8,11,14,17,20),a*same.per.growth+b,type = 'b',lwd=1)
lines(c(2,5,8,11,14,17,20),a*ring.growth+b,type = 'b',lwd=1,col='blue')
### 发现没，可以不停的网上叠加东西

##在同比和环比曲线上添加文字
j <- 1
for(i in 1:length(data[,1])){
  text(3*i-1,a*same.per.growth[i]+b-5,
       paste(round(same.per.growth[i]*10000)
      /100,'%',sep = ''),cex = 0.65);j=j+1
      text(3*i-1,a*ring.growth[i]+b-5,
           paste(round(ring.growth[i]*10000)/100,                                                                                '%',sep = ''),col='blue',cex = 0.65);j=j+2
}

#为柱形图添加文字
j <- 1
for(i in 1:length(data[,1])){
  text(j+0.5,data$pre[i]+10,data$pre[i],col = 'green');j <- j+1
  text(j+0.5,data$now[i]+10,data$now[i],col ='yellow');j <- j+2
}

#####################################eeeeee###############
#——————————————————————————————————————————————————————————————————————————————

# 1.19 图形的局部放大
id <- LETTERS[1:9]
num <- c(0.053,0.46,0.087,0.213,0.078,0.042,0.031,0.026,0.01)
data <- data.frame(id=id,num=num)
split <- 6  #设置分割变量
max.bar2 <- 0.4 #设置副柱状图高度变量

bar.data1 = matrix(rev(c(rep(NA, split+1),num[1:split],sum(num[-(1:split)]))),
                   ncol = 2, nrow = split+1)


bar.data2 = matrix(c(rep(NA, split+1),rev(num[-(1:split)]),
                     rep(NA,nrow(data)-split-1)), ncol = 2, nrow = split+1)

library(RColorBrewer)
col <- brewer.pal(12,'Set1')

#绘图
barplot(bar.data1,col = c('azure3',col[1:split]),axes = FALSE,ylim = c(0,1),
        xlim = c(0,4.5),border = 'azure3')
barplot(bar.data2*(max.bar2/sum(num[-(1:split)])),col = col[-(1:split)],
        axes = FALSE, add = TRUE, border = 'azure3')
polygon(x=c(1.2,1.2,1.4,1.4),y = c(0,sum(num[-(1:split)]),max.bar2,0),
        col='azure3',border = 'azure3')
##
labels=paste(round(num*10000)/100,'%',sep = '')
y1 <- 0
for(i in 1:split){
  y1[i] = sum(num[-(1:i)])
}

text(x=1,y=y1+0.02,labels[1:split],cex=0.8)
y2 <- 0
for(i in 1:(nrow(data)-split-1)){
  y2[i] <- sum(num[(split+i+1):nrow(data)])
}
y2 <- c(y2,0)
y2 <- y2*(max.bar2/sum(num[-(1:split)]))
text(x=2,y=y2+0.02,labels[-(1:split)],cex = 0.8)

### 不明所以
legend('topright',legend =id,pch=15,col=c(rev(col[1:split]),
        rev(col[-(1:split)])),ncol = 2,bty = 'n')

title(main = list('ASDFGHJKL',cex=1.5),sub = Sys.time())


#### 总结
## 首先要掌握基本绘图，其次再去修改细节
## 每一个代码敲完不一定会马上记得怎么用
## 下一次用的时候，还能想起来去哪里找代码。

