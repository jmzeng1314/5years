### 了解生物信息学常见数据格式

见生信基础知识100讲： https://mp.weixin.qq.com/s/Gr_0H4-GaTYkgUkbNHcMcg

### 比对

可以使用bowtie2软件自带的测试数据生成sam/bam文件，代码如下：

```shell 
mkdir -p ~/biosoft
cd ~/biosoft
# 针对不同系统下载不同的版本
# 优先下载最新版
wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.4.3/bowtie2-2.3.4.3-linux-x86_64.zip 
unzip bowtie2-2.3.4.3-linux-x86_64.zip 
cd ~/biosoft/bowtie2-2.3.4.3-linux-x86_64/example/reads
../../bowtie2 -x ../index/lambda_virus -1 reads_1.fq -2 reads_2.fq > tmp.sam
# samtools view -bS tmp.sam >tmp.bam
```

### 找变异位点

这里可以使用conda来管理软件环境，代码如下：

```shell 
mkdir -p ~/biosoft
cd ~/biosoft
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh 
bash Miniconda3-latest-Linux-x86_64.sh 
source ~/.bashrc 
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda
conda config --set show_channel_urls yes
conda  create -y -n test
conda activate test
conda install -y samtools bcftools 

wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.4.3/bowtie2-2.3.4.3-linux-x86_64.zip 
unzip bowtie2-2.3.4.3-linux-x86_64.zip 
cd ~/biosoft/bowtie2-2.3.4.3-linux-x86_64/example/reads

../../bowtie2 -x ../index/lambda_virus -1 reads_1.fq -2 reads_2.fq | samtools sort -@ 5 -o tmp.bam - 
bcftools mpileup -f ../reference/lambda_virus.fa tmp.bam |bcftools call -vm > tmp.vcf
```



