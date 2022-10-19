[English](./readme.md) | 简体中文

*注：简体中文版内容不一定为最新，以英文 readme 为准。*

# 如何和我们一起工作

## Ruby & Jekyll
我们推荐 Ruby 2.7.2，如果您使用其它版本的 Ruby，您需要自己处理所有红色警报，并且不要将`Gemfile.lock`的修改应用到git，这可能会使其他人无法使用他们的环境。

## 克隆仓库

```bash
git clone -b develop git@github.com:lab530/lab530.github.io.git
```
**我将使用`(branch)`符号来标记当前分支。**

**不要`main`直接操作分支。请使用您自己的分支并使用`merge`将提交合并到`main`分支。**

## Git 基础指令

### 检查本地分支/当前分支

```bash
git branch
```

### 切换到已经存在的分支（比如：`main`）

```bash
git checkout main
```

### 创建一个新分支（比如：`ly-dev`）

```bash
git checkout -b ly-dev
```

### 删除一个已经存在的分支

```bash
git branch -d ly-dev
```

### 推送和设置上流，使用 `-u` 或 `--set-upstream`

```bash
(main) git push -u origin main
```

### 合并分支（比如：合并 `ly-dev` 进 `main`）

```bash
(main) git merge ly-dev
```

## 如何修改这个仓库

### 0. 创建你自己的开发分支

```bash
(main) git checkout -b yescafe-dev
(yescafe-dev) git branch  # 检查当前分支
```

### 1. 同步 `main` 分支

**这是必要的！不要忘记！**

```bash
git checkout main
(main) git pull origin main
```

如果有新的提交，合并回你的开发分支。

```bash
(main) git checkout yescafe-dev
(yescafe-dev) git merge main
```

### 2. 在你的开发分支上工作

```bash
git checkout yescafe-dev
```

然后编辑你的代码和帖子！

### 3. 进行提交

在你完成工作之后，添加所有修改的文件进入缓存区并进行提交。

```bash
(yescafe-dev) git add -A
(yescafe-dev) git commit -m "A commit message here"
```

这是一个基础操作，且这不是唯一的方法。自学然后自己试试。

### 4. 部署和检查你的变更

使用 Ruby 和 Jekyll 来在你的本地机器上部署这个网站，我推荐 RVM。如果你使用 Lazarus 的服务器，你就不需要自己搭建 Ruby 和 Jekyll 环境，只需要直接执行它。

```bash
jekyll s --host 0.0.0.0
```

然后在你的浏览器中访问 `127.0.0.1:4000`，接着检查你的变更。

如果你使用的是 Lazarus 的服务器，同时不确定你是否是唯一一个使用 jekyll 的，你应该使用不同的指定端口而不是默认端口（4000），例如 4001、4002，例如：

```bash
jekyll s --host 0.0.0.0 --port 4001
```
访问`127.0.0.1:4001 `

提示： `--host 0.0.0.0 `不是必需的，这可以帮助您使用其他设备通过您的 LAN IP 地址访问此本地网站。

### 5. 合并到 `develop`

如果你认为没有错误，切换到 `main` 分支，再次同步上游代码，然后合并提交。

**这也是必要的！**

```bash
(yescafe-dev) git checkout main
(main) git pull origin main
(main) git merge yescafe-dev
```
如果你没有像我一样先拉取直接合并，当你向上推时，git 可能会告诉你：

![git push reject xd](/assets/readme/SCR-20221014-u5a.png)

如果你没有像我一样强大的 git 技能，请不要尝试这个。

### 6.处理冲突
保留。

Oh，这将是您应该学习的技术。

### 7. 推送到上游

第一次，执行：

```bash
(main) git push -u origin main
```
推动和设置上游。

在下一次，你可以运行：

```bash
(main) git push
```
### 8. 下一次，从 1 重新开始做！
