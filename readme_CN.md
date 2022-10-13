[English](./readme.md) | 简体中文

*注：简体中文版内容不一定为最新，以英文 readme 为准。*

# 如何和我们一起工作

## 克隆仓库

```bash
git clone -b develop git@github.com:lab530/lab530.github.io.git
```

如果你已经克隆了 `main` 分支，使用这个指令来切换分支：

```bash
git checkout -b develop origin/develop
```

**确保你处于 `develop` 分支。**

**我会用 `(branch)` 记号来标记当前分支。**

**不要使用除了 pull request 以外的方法来操作 `main` 分支！**

## Git 基础指令

### 检查本地分支/当前分支

```bash
git branch
```

### 切换到已经存在的分支（比如：`develop`）

```bash
git checkout develop
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
(develop) git push -u origin develop
```

### 合并分支（比如：合并 `ly-dev` 进 `develop`）

```bash
(develop) git merge ly-dev
```

## 如何修改这个仓库

### 0. 创建你自己的开发分支

```bash
(develop) git checkout -b yescafe-dev
(yescafe-dev) git branch  # 检查当前分支
```

### 1. 同步 `develop` 分支

```bash
git checkout develop
(develop) git pull origin develop
```

如果有新的提交，合并回你的开发分支。

```bash
(develop) git checkout yescafe-dev
(yescafe-dev) git merge develop
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

### 5. 合并到 `develop`

如果你认为没有错误，切换到 `develop` 分支，再次同步上游代码，然后合并提交。

```bash
(yescafe-dev) git checkout develop
(develop) git pull origin develop
(develop) git merge yescafe-dev
```

### 6. 推送到上游

```bash
(develop) git push origin develop
```

### 7. 下一次，从 1 重新开始做！

### 8. 创建一个 pull request

如果你完成了一个功能或者工作，比如一篇帖子，你可以考虑为你的整个工作创建*一个* pull request。

*不要*一个提交一个 pull request。

并且*不要*自己审查和合并你的 pull request。代码审查需要他人来进行。

## For Admins: Code Review & Tackle Conflicts

reserved
