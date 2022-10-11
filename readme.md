# LAB530 GitHub pages

## 如何为仓库贡献帖子和图片（以 ly 为例）

### 克隆仓库先切换到你自己的编辑分支

```shell
git clone -b develop git@github.com:lab530/lab530.github.io.git
cd lab530.github.io
git checkout -b ly-dev
```

### 添加图片

将图片文件放到 `assets/gallery`

### 添加帖子

1. 在 `_posts`  里面创建 md 文件，命名格式是 `日期-名字.md`，具体命名可以参考已经存在的帖子。

2. Markdown header:

   ```markdown
   ---
   layout: post
   title:  "我是标题"
   author: 作者
   categories: [ 分类 ]
   tags: [ 标签1, 标签2, 标签3 ]
   ---
   ```

3. 添加作者：

   修改 `_config.yml`，里面找到 authors 项。参考已经存在的 item，创建合适信息的新的作者。

### commit

```shell
$ git status
$ git add -A
$ git commit -m "commit message"
```

在本地部署你的服务器，使用 `jekyll s`，测试完毕后，切换到 `develop` 分支进行 merge:

```shell
$ git checkout develop
$ git merge ly-dev
```

### 推送

```shell
$ git push -u origin develop
# 第二次直接运行：
$ git push
```

### Deploy

在网页端操作，进行 code review 之后 merge 到 main 分支，GitHub CI 会自动部署。

