# TermuxBeauty
#### 自用 termux 一键美化脚本
#### 由于我经常清除 termux 的数据，每次清除数据后就会回到官方的 bash 
#### 但它实在是太难看了，而且官方的快捷键少之又少，每次都得 
``` bash 
echo "" >$HOME/.termux/termux.properties
```
#### 然后就是：换源、更新、ohmyzsh、python、pip 换源 pip 更新 等等一堆可以用脚本完成的工作
#### 既然可以用脚本完成，为什么要去手动重复这一堆繁琐的工作呢？
#### 于是，此脚本应运而生。
#### 附赠
1. jvdroid 里的 openjdk 11.0.1 及其安装脚本。
2. php.ini 文件 众所周知，termux 里的 php 莫得 php.ini ！！这会导致在运行 php 时产生一些莫名其妙的 bug。
#### [php.ini](https://github.com/ZhReimu/TermuxBeauty/blob/main/php.ini) 集成到了  [termux优化.sh](https://github.com/ZhReimu/TermuxBeauty/blob/main/termux%E4%BC%98%E5%8C%96.sh)中了
#### [jdk.sh](https://github.com/ZhReimu/TermuxBeauty/blob/main/jdk.sh)分开放着的，因为不是每次都要用jdk嘛，而且它还很大，比较耗时。
## 用法
- 全部克隆到本地 那就可以同时执行下边两个命令
- 只要 termux优化 那就只下载 [php.ini](https://github.com/ZhReimu/TermuxBeauty/blob/main/php.ini) 与 [termux优化.sh](https://github.com/ZhReimu/TermuxBeauty/blob/main/termux%E4%BC%98%E5%8C%96.sh)
- 执行以下命令一键操作：apt、pkg 换源、更新，安装常用软件、设置 ohmyzsh pip 换源等
```bash
bash termux优化.sh
```
- 只要 jdk 那就只下载 [jdk.sh](https://github.com/ZhReimu/TermuxBeauty/blob/main/jdk.sh) 和 [jdk.tar.gz](https://github.com/ZhReimu/TermuxBeauty/blob/main/jdk.tar.gz)
- 执行以下命令一键安装 jdk
```bash
bash jdk.sh
```
- 不管使用哪种方法，总之将它们放入同一个文件夹里才能用就是
## 顺便记录下 git 命令的用法
### GitHub 使用 ssh 登陆
- ssh-keygen 一路回车生成公钥
- 默认文件名是 id_rsa.pub 路径是 $HOME/.ssh/id_rsa.pub Windows 端是 C:\Users\用户名\.ssh
- 添加公钥进 GitHub
- 点击链接[添加公钥](https://github.com/settings/keys)
- 克隆仓库
- 首先得新建一个仓库就是
- 使用这样的 ssh 链接克隆的仓库才能用 ssh 免密码登陆
```
git@github.com:ZhReimu/TermuxBeauty.git
```
### 使用 git
```
git clone git@github.com:ZhReimu/TermuxBeauty.git # 克隆仓库
git status    # 显示当前 git 的状态(改动了哪些文件之类的)
git add "改动了的文件"    # 缓存改动
git add * 或 git add .   # 缓存当前文件夹内所有文件
git commit -m "改动说明"  # commit 文件
git push    # 提交改动
# 如果本地仓库与 GitHub 上内容不一样那就得先 fetch 然后 merge 最后才能 push
git fetch   # 获取云端改动
git merge   # 合并云端与本地
```
目前就这么多吧
