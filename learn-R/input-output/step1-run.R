a=read.table('SraRunTable.txt',header =T,##读入txt文件
             sep = '\t')##以制表符分隔
b=read.table('GSE17215_series_matrix.txt.gz',##读入该文件
             comment.char = '!',header =T,##指定注释符号，有！的行不被读入，有表头
             sep = '\t')##以制表符分隔
write.csv(b,'GSE17215_series_matrix.csv'##将文件输出为csv格式
        ,row.names = F)##不要行名
write.table(b,'tmp.csv',sep = ',')##不要行名
write.csv(b,'GSE17215_series_matrix.csv',row.names = F)##不要行名
## 把行名去掉
d=read.csv('GSE17215_series_matrix.csv')##读入该csv文件



rownames(b)=b[,1]##以b的第一列为行名
b=b[,-1]##将b的第一列去掉
b=log2(b)# 对b中数据求log2
save(b,file = 'b_input.Rdata')
##将以上内容存为Rdata，所有操作都会保存，只可R打开，避免读入读出时格式的更改

load(file = 'b_input.Rdata')##载入Rdata内容
pheatmap::pheatmap(b[1:10,])##用b的1到10行画热图



