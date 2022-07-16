# Git学习

"https://www.liaoxuefeng.com/wiki/896043488029600"

## 创建版本库

1. 创建一个空目录

    ```
    $ mkdir learngit
    $ cd learngit
    $ pwd
    /Users/michael/learngit
    ```

2. 通过git init命令把这个目录变成Git可以管理的仓库：

    >git init

## 把一个文件放到Git仓库

0. 首先已有一个文件readme.txt

1. 用命令git add告诉Git，把文件添加到仓库：

    >git add readme.txt

2. 用命令git commit告诉Git，把文件提交到仓库：

    >git commit -m "wrote a readme file"

    ```
    commit可以一次提交很多文件，可以多次add不同的文件
    ```

## 查看的命令

掌握工作区当前的状态
>git status

查看具体的修改内容
>git diff

显示从最近到最远的提交日志
>git log

查看更为简略的提交日志
>git log --pretty=oneline

记录每一次命令
>git reflog

## 一些文件的修改操作

>git reset --hard HEAD^

```
用HEAD表示当前版本，上一个版本就是HEAD^，上上一个版本就是HEAD^^，当然往上100个版本写100个^比较容易数不过来，所以写成HEAD~100
```

通过指定版本号也可以进行回退以及返回新的版本（版本号不必打全）
>git reset --hard 1094a

git add的反向命令git checkout，撤销工作区修改，即把暂存区最新版本转移到工作区
>git checkout

把文件在**工作区**的修改全部撤销，这里有两种情况：

一种是文件自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；

一种是文件已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。

总之，就是让这个文件回到最近一次git commit或git add时的状态。
>git checkout -- file

```
此操作相当于撤销工作区做的修改，回到最近一次add或commit状态
```

若修改后的文件已经从工作区add到暂存区，则
>git reset HEAD file

```
git reset命令既可以回退版本，也可以把暂存区的修改回退到工作区。当我们用HEAD时，表示最新的版本。
```

## 删除文件

1. rm
   1. 删除
      1. >git rm test.txt
      2. >git commit -m "remove test.txt"
   2. 恢复
        >git checkout -- test.txt

        ```
        git checkout其实是用版本库里的版本替换工作区的版本，无论工作区是修改还是删除，都可以“一键还原”。
        ```
