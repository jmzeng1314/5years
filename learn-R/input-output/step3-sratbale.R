a=read.table('SraRunTable.txt',header =T,##读入txt文件，有表头
             sep = '\t')##以制表符分隔
sort(a$MBases,decreasing = T)[1]##排序，a中索引MBases列，从大到小排序，并[1]取最大值
max(a$MBases)##a中MBases列的最大值
min(a$MBases)##a中MBases列的最小值
fivenum(a$MBases)##求a中MBases列的五个数：最小值，1/4处值，1/2处值，3/4处值，最大值
a$MBases
table(a$MBases<5000)##计算该列大于5000和小于5000的数的个数
boxplot(a$MBases~a$Assay_Type)##用MBases列和Assay_Type列绘制箱线图,用于展示一组数据的总体分布
table(a$Assay_Type)##统计该列元素频次
wes=a[a$Assay_Type=='WXS',]##取出a中Assay_Type列中为WXS的行，==意为赋值
rna=a[a$Assay_Type=='RNA-Seq',]##取出a中Assay_Type列中为RNA-Seq的行
fivenum(wes$MBases)##求wes表中MBases列的五个数：最小值，1/4处值，1/2处值，3/4处值，最大值
fivenum(rna$MBases)##求rna表中MBases列的五个数：最小值，1/4处值，1/2处值，3/4处值，最大值



