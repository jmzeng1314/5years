# 从事生物信息学数据分析5周年的一些思考和总结

曾经在生信技能树公众号发布的生信工程师入门最佳指南 ：https://mp.weixin.qq.com/s/vaX4ttaLIa19MefD86WfUA 

> 先搞清楚生信工程师都在干嘛：

- 售前售后技术支持-偏生物医学背景知识
- 应用项目研发-偏编程和流程
- 科研热点追踪或者前沿探索

这三类生信工程师养成的侧重点不一样，但是数据分析能力的获取的第一步是类似的，下面看我娓娓道来，如果你是初入我们行业，那么下面的资源和指导不容错过！

### 关于生物学背景

因为绝大部分转生物信息学工程师的小伙伴都是有至少4年的生物学背景，生物大分子，中心法则都没有问题，但是也有部分计算机背景学生转过来，会不停的问我该如何补充生物学背景，这里推荐慕课(<https://www.icourse163.org/>)的两个课程

- 复旦大学的基因组学：<https://www.icourse163.org/course/FUDAN-1002839009#/info>
- 四川大学的细胞生物学：<https://www.icourse163.org/course/SCU-46011>
- 其它课程请自行搜索，按需学习，争取掌握生信基础100讲：https://mp.weixin.qq.com/s/Gr_0H4-GaTYkgUkbNHcMcg

### 关于R语言学习

专门为R语言建立了 GitHub 仓库存放相关学习路线指导资料：<https://github.com/jmzeng1314/R_bilibili>

找到任何一本配套R书籍，然后就可以学习我的教学视频，都在：https://www.bilibili.com/video/av25643438/  同样的有配套教学大纲：文档链接：https://mubu.com/doc/HGT7XBmgg 密码：muwu 

很多朋友之所以学习R语言其实就是为了重复一些简单的数据库挖掘文章，所以我也顺便录制了GEO数据库挖掘课程：

- 代码在：https://github.com/jmzeng1314/geo
- 配套教学视频在B站：https://www.bilibili.com/video/av26731585/ 
- 还有一个公共数据库挖掘：https://www.bilibili.com/video/av37568990 

#### 作业

- 初级10 个题目，尽量根据参考代码理解及完成：<http://www.bio-info-trainee.com/3793.html>  

- 中级要求是：http://www.bio-info-trainee.com/3750.html

- 高级要求是完成20题： <http://www.bio-info-trainee.com/3415.html>

下面是一些优秀作业答案：

- https://sr-c.github.io/2019/03/11/R-exercise/
- https://www.jianshu.com/p/8da5786658a7
- <https://www.jianshu.com/p/4e3a94bd155a>

### 关于linux学习

课程大纲：https://mubu.com/doc/2iA2skGIGg

教学重点是(去可视化概念+练习) ，了解 **命令+参数+文件** 的模式

```
基础知识:cd -, cd ..  , cd -, history, !5 ,  /home/ , /tmp/ , >,&，jobs,nohup 1,2,0
文件目录操作：ls,cd,pwd,mkdir,rm,mv,cp,touch,head,tail,less,more
系统管理： df,du,top,free,ps,ipconfig,netstat,ssh,scp,
用户权限：chown,chgrp,groups,ls
文本操作：awk,grep,sed,paste,cat,diff,wc,vi 
```

教学视频在：https://www.bilibili.com/video/av28813815 

中英文命令对照：https://mp.weixin.qq.com/s/iEYSX9EM-y1QKRK7KMZYfA

#### 作业

- 下载**bowtie2软件压缩包解压**并且找到里面的示例数据，**走文本处理流程 ，走基本比对找变异流程**
  - 参考：<https://mp.weixin.qq.com/s/5rduc9Rxjtz_Bj_s--Z6Og>
- **生信人**的 linux 20题 <http://www.bio-info-trainee.com/2900.html 
- 处理 fastq,fasta,sam,bam,vcf,gff,gtf,bed,MAF等**格式（约定成俗，大牛推广）**的数据
  - fasta和fastq格式文件的shell小练习 <http://www.bio-info-trainee.com/3575.html>
  - sam和bam格式文件的shell小练习 <http://www.bio-info-trainee.com/3578.html>
  - VCF格式文件的shell小练习 <http://www.bio-info-trainee.com/3577.html>

### 关于其它编程语言

不同的编程语言的语法很大程度是互通的，都是基本数据类型，基本数据结构，函数及循环控制语句等等，比如Python和R语言的异同点。

- [生信分析人员如何系统入门python?](https://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247484004&idx=1&sn=84c121c8af32a2a07e52d2c96f56dd24&scene=21#wechat_redirect)
- [生信分析人员如何系统入门perl？](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247483991&idx=1&sn=d1f7c2744a3efec2f727627b4b39addb&scene=21#wechat_redirect)
- [生信分析人员如何系统入门R？](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247483985&idx=1&sn=70ba027ac4c39eb466d864cf0e72af68&scene=21#wechat_redirect)
- [生信分析人员如何系统入门Linux？](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247483957&idx=1&sn=302a35c3ad63043fd6eb57e76c0ca1e1&scene=21#wechat_redirect)

建议囫囵吞枣看完几遍语法后，马上实践做题：https://mp.weixin.qq.com/s/n-C2P322ZWQyZ6-3EEKbxA 

**编程实战练习题目录**

- 01:生信编程思维获得
- 02: hg19基因组序列的一些探究
- 03: hg38每条染色体的基因、转录本分布
- 04: 多个同样行列式文件的合并
- 05: 根据GTF画基因的多个转录本结构
- 06: 下载最新版的KEGG信息，并且解析好
- 07: 写超几何分布检验
- 08: ID转换
- 09: R语言爬虫
- 10: R语言shiny
- 11: 用Biostrings包来处理fasta序列
- 12: 根据指定染色体及坐标得到序列
- 13: JSON 数据的格式化
- 14: fasta 数据处理

更多习题见传送门：<http://www.biotrainee.com/thread-1075-1-1.html>

### 关于NGS数据分析

重新制作了NGS相关视频教程免费发布在B站，几个NGS组学实战代码是：

- <https://www.jianshu.com/p/49d035b121b8>  给学徒的WES数据分析流程
- <https://www.jianshu.com/p/a84cd44bac67> 原创10000+生信教程大神给你的RNA实战视频演练
- <https://www.jianshu.com/p/5bce43a537fd> 给学徒的ATAC-seq数据实战
- <https://mp.weixin.qq.com/s/a4qAcKE1DoukpLVV_ybobA> 给学徒ChIP-seq数据处理流程

视频都在B站：<https://mp.weixin.qq.com/s/gqib-RtbC315Zad-8KmkXw>

下游分析(个性化)才是考验工程师水平：https://mp.weixin.qq.com/s/7MKDptXy9Di49_yoYNdrvw

###  关于统计可视化

这方面我的分享做的远远不够，推荐一下 **统计学**基础：<https://mp.weixin.qq.com/s/OtB2h6f00U2SRZLzveJKfQ>

- 统计学精华-statQuest教学视频：<https://mp.weixin.qq.com/s/X0PE9S0BgSuCcAV9zeY1jQ>

可视化我也一直在努力当中：https://mubu.com/doc/3L0wkgGUVg (绘图大全)

### 关于科研思维建立

因为本科毕业后就一直在公司工作，并没有实际负责过科研项目，现在博士阶段才有机会来建立科研思维，所以这方面我还是在探索阶段， 仅仅是列出我博士第一年的一些努力：

- <https://zhuanlan.zhihu.com/c_1024966446748618752> (保证每个星期分享一篇详细的文献阅读笔记)

然后是博士第二年(也就是现在)的一些努力：

- [2019年1月份第1周（总第49周）单细胞转录组探索CAFs的功能和空间异质性](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247488937&idx=1&sn=4cc855eb0bcf2ef216b6f3cb10fedc62&chksm=9b485512ac3fdc04d7e4e319306f179e1f5f8a0ca8dd6551c8aaa5e1f2eb505099dabdfb8ba3&scene=21#wechat_redirect)
- [2019年1月份第2周（总第50周）异常CRC病人的突变时空异质性与免疫](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247488950&idx=1&sn=be1f64057eabf66f0d1495eb6c7ac62a&chksm=9b48550dac3fdc1bf5f55a56fab28c633048a8d6e4171f36ee14c6890ce30acc05eb4184cc93&scene=21#wechat_redirect)
- [2019年1月份第3周（总第51周）探索PDAC癌前病变](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247488955&idx=1&sn=7cbff11cac7f32c7b8534c9f0a789fe4&chksm=9b485500ac3fdc160dc3d3fbf566558da2c2f1a9e71da6932ff2e7521bd6e59750924669a921&scene=21#wechat_redirect)
- [2019年1月份第4周（总第52周）TCGA计划的ATAC-seq数据发布](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247488961&idx=1&sn=9380a836935a7caa1dc52edbe3ae955c&chksm=9b48557aac3fdc6c8a33885818dfece7f79869b1b15b1b4fd1d3ff5114121bdc65938871685d&scene=21#wechat_redirect)
- [2019年2月份第1周（总第53周）胃癌类器官](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247488969&idx=1&sn=883d8dce47192b8f9b35008849f9080e&chksm=9b485572ac3fdc6465b5801f1b080b3291930a244a0031201365c4e7e501fa1091c8464cc023&scene=21#wechat_redirect)
- 2019年2月份第2周（总第54周[）测173个成年人的大脑的102个基因](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247488978&idx=1&sn=478757c10b88ab00eaee2e467ef88b6f&chksm=9b485569ac3fdc7f1339f71faa94a71d80721f42ddd27e76594b573385c51c57d1f432bf1453&scene=21#wechat_redirect)
- [2019年2月份第3周（总第55周）2.5万汉族人的GWAS乳腺癌风险基因](http://mp.weixin.qq.com/s?__biz=MzAxMDkxODM1Ng==&mid=2247488984&idx=1&sn=e1ee425ef84b59d5f9f0a4d704b3c32f&chksm=9b485563ac3fdc75e3a4a3e05a327b00c5210bde240268d37e4a3770b82d56683b841571e57a&scene=21#wechat_redirect)
- 持续更新~~~~

###  关于行业发展前景预测

不知道，尽量提升自己的能力先吧

### 关于团队招新

随时欢迎，详细说明为什么要跟随我做知识分享即可，参考：https://mp.weixin.qq.com/s/jn1Xe7IDdTY_9tDpz-3Vfw 

