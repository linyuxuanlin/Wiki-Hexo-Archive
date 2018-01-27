# Hexo迁移

换电脑不烦恼

## 安装Node.js

* [下载地址](https://nodejs.org/en/download/)

## 安装Git

* [下载地址](https://git-scm.com/download/)
* [安装教程](http://jingyan.baidu.com/article/90895e0fb3495f64ed6b0b50.html)
* [Pro Git（中文版）](http://git.oschina.net/progit/)
* [常用命令](http://blog.csdn.net/u011974987/article/details/50973740)


## Clone项目

* 将项目Clone到本地
* ssh压缩包中的内容放到用户ssh文件夹
* 压缩包密码提示：常用加实

## 搭建Hexo环境

* Git Bash，输入安装hexo的命令`npm install -g hexo-cli`
* 执行`hexo init e:\blog`命令完成hexo的初始化
* `cd e:/blog`，`npm install`，系统会可以根据package.json文件中dependencies的配置安装所有依赖包
* 接着把项目中的文件替换到e:/blog中去
* `npm install hexo-deployer-git --save`，安装Git包

------

迁移完成！
