# LAB530 GitHub pages

## 如何为仓库贡献帖子和图片（以 ly 为例）

### 克隆仓库先切换到你自己的编辑分支

```shell
git clone git@github.com:lab530/lab530.github.io.git
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

### 提交

```shell
$ git status
$ git add -A
$ git commit -m "commit message"
$ git push origin ly-dev
....
```


