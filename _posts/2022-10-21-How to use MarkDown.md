---
layout: post
title:  How to use MarkDown
subtitle: MarkDown入门教程
author: Hanpro
tags: [ MarkDown ]
---


#### MarkDown是什么？

Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档。

Markdown 语言在 2004 由约翰·格鲁伯（英语：John Gruber）创建。

Markdown 编写的文档可以导出 HTML 、Word、图像、PDF、Epub 等多种格式的文档。

Markdown 编写的文档后缀为 .md, .markdown。
当前许多网站都广泛使用 Markdown 来撰写帮助文档或是用于论坛上发表消息。例如：GitHub、简书、reddit、Diaspora、Stack Exchange、OpenStreetMap 、SourceForge等。


#### 关于MarkDown的基础入门教程

由于up主使用的是MAC系统中的Typora，所以部分快捷操作对于你们来说可能无效，但MarkDown语法大致相同

VS code部分操作与Typora不同，up主已备注

#### MarkDown使用工具
关于Typora：可去Typora官网购买，或者在b站搜索如何白嫖Typora

关于VS code：[VS code使用MarkDown教程](https://www.bilibili.com/video/BV1P44y1W7fA/?spm_id_from=333.337.search-card.all.click&vd_source=bdd1d089303bcc82cd732e50292c392d)
## 基础篇目录
- [标题](#标题)
  - [一级标题使用1个#](#一级标题使用1个)
  - [二级标题使用2个#](#二级标题使用2个)
  - [三级标题使用3个#](#三级标题使用3个)
- [文字](#文字)
  - [删除线](#删除线)
  - [斜体](#斜体)
  - [加粗](#加粗)
  - [斜体+加粗](#斜体加粗)
  - [下划线](#下划线)
  - [高亮（需勾选扩展语法）](#高亮需勾选扩展语法)
  - [下标（需勾选扩展语法）](#下标需勾选扩展语法)
  - [上标（需勾选扩展语法）](#上标需勾选扩展语法)
- [表情符号](#表情符号（暂时只发现Typora具有此功能）)
  - [一些表情例子](#一些表情例子暂时只发现typora具有此功能)
- [表格](#表格)
- [引用](#引用)
- [列表](#列表)
  - [无序列表--符号 空格](#无序列表--符号-空格)
  - [有序列表--数字 `.` 空格](#有序列表--数字--空格)
- [代码](#代码)
  - [代码块](#代码块)
  - [行内代码](#行内代码)
  - [转换规则](#转换规则)
- [分隔线](#分隔线)
- [跳转](#跳转)
  - [外部跳转--超链接](#外部跳转--超链接)
  - [内部跳转--本文件内跳](#内部跳转--本文件内跳)
  - [自动链接](#自动链接)
- [图片](#图片)
  - [网上的图片](#网上的图片)
  - [本地图片](#本地图片)

[基础视频讲解链接](https://www.bilibili.com/video/av87982836#reply2366896129)

[基础图文讲解链接](https://www.runoob.com/markdown/md-title.html)


## 标题

### 主要用法
```markdown
# 标题名字（井号的个数代表标题的级数）
```
# 一级标题使用1个#
## 二级标题使用2个#
### 三级标题使用3个#
####### 最多支持六级标题#

## 文字

### 删除线
```markdown
这就是 ~~删除线~~ (使用波浪号)
```
这就是 ~~删除线~~ (使用波浪号)

### 斜体
```markdown
这是用来 *斜体* 的 _文本_
```
这是用来 *斜体* 的 _文本_

### 加粗
```markdown
这是用来 **加粗** 的 __文本__
```
这是用来 **加粗** 的 __文本__

### 斜体+加粗
```markdown
这是用来 ***斜体+加粗*** 的 ___文本___
```
这是用来 ***斜体+加粗*** 的 ___文本___

### 下划线
下划线是HTML语法
```markdown
<u>下划线(快捷键`command`+`u`，视频中所有的快捷键都是针对Mac系统，其他系统可自行查找)</u>
```
`下划线` <u>下划线(快捷键`command`+`u`，视频中所有的快捷键都是针对Mac系统，其他系统可自行查找)</u>

### 高亮（需勾选扩展语法）

```markdown
这是用来 ==斜体+加粗== 的文本
```

这是用来 ==斜体+加粗== 的文本

### 下标（需勾选扩展语法）
[VS code教程](https://blog.csdn.net/u013647759/article/details/85254496)
```markdown
水 H~2~O 
双氧水 H~2~O~2~ 
```
水 H<sub>2</sub>O
双氧水 H<sub>2</sub>O<sub>2

### 上标（需勾选扩展语法）
[VS code教程](https://blog.csdn.net/u013647759/article/details/85254496)
```markdown
面积 m^2^ 
体积 m^3^
```

面积 m<sup>2   

体积 m<sup>3

### 表情符号

 Emoji 支持表情符号，你可以用系统默认的 Emoji 符号（ Windows 用户不一定支持，自己试下~）。 也可以用图片的表情，输入 `:` 将会出现智能提示。  
 
### 一些表情例子（暂时只发现Typora具有此功能）

```markdown
:smile: :laughing: :dizzy_face: :sob: :cold_sweat: :sweat_smile:  :cry: :triumph: :heart_eyes: :relaxed: :sunglasses: :weary:

:+1: :-1: :100: :clap: :bell: :gift: :question: :bomb: :heart: :coffee: :cyclone: :bow: :kiss: :pray: :sweat_drops: :hankey: :exclamation: :anger:

```

:smile: :laughing: :dizzy_face: :sob: :cold_sweat: :sweat_smile:  :cry: :triumph: :heart_eyes: :relaxed: :sunglasses: :weary: :+1: :-1: :100: :clap: :bell: :gift: :question: :bomb: :heart: :coffee: :cyclone: :bow: :kiss: :pray: :sweat_drops: :hankey: :exclamation: :anger:

(  Mac: `control`+`command`+`space`点选)


### 表格

使用 `|` 来分隔不同的单元格，使用 `-` 来分隔表头和其他行：
```markdown
| name          | price |
| ------------- | ----- |
| fried chicken | 19    |
| cola          | 5     |
```
为了使 Markdown 更清晰，`|` 和 `-` 两侧需要至少有一个空格（最左侧和最右侧的 `|` 外就不需要了）。

| name          | price |
| ------------- | ----- |
| fried chicken | 19    |
| cola          | 5     |

为了美观，可以使用空格对齐不同行的单元格，并在左右两侧都使用 `|` 来标记单元格边界，在表头下方的分隔线标记中加入 `:`，即可标记下方单元格内容的对齐方式：

```markdown
| name          | price |
| :------------ | :---: |
| fried chicken |  19   |
| cola          |  32   |
```

| name          | price |
| :------------ | :---: |
| fried chicken |  19   |
| cola          |  32   |

使用快捷键`command`+`opt`+`T`更方便(段落→表格→插入表格，即可查看快捷键)

## 引用
```markdown
>“后悔创业”
```
>“后悔创业”

```markdown
>也可以在引用中
>>使用嵌套的引用
```
>也可以在引用中
>>使用嵌套的引用

## 列表

### 无序列表--符号 空格

```markdown
* 可以使用 `*` 作为标记
+ 也可以使用 `+`
- 或者 `-`
```
* 可以使用 `*` 作为标记
+ 也可以使用 `+`
- 或者 `-`

### 有序列表--数字 `.` 空格

```markdown
1. 有序列表以数字和 `.` 开始；
3. 数字的序列并不会影响生成的列表序列；
4. 但仍然推荐按照自然顺序（1.2.3...）编写。
```

1. 有序列表以数字和 `.` 开始；
2. 数字的序列并不会影响生成的列表序列；
3. 但仍然推荐按照自然顺序（1.2.3...）编写。
   ```markdown
   可以使用：数字\. 来取消显示为列表（用反斜杠进行转义）
   ```

## 代码

### 代码块

```markdown
```语言名称
```

```java
 public static void main(String[] args) {
    }
```

### 行内代码

```markdown
也可以通过 ``，插入行内代码（` 是 `Tab` 键上边、数字 `1` 键左侧的那个按键）：

例如 `Markdown`
```
`Markdown`


### 转换规则
代码块中的文本（包括 Markdown 语法）都会显示为原始内容

## 分隔线

可以在一行中使用三个或更多的 `*`、`-` 或 `_` 来添加分隔线（``）：
```markdown
***
------
___
```
***
------
_____


## 跳转

### 外部跳转--超链接

格式为 `[link name](link)`。

```markdown
[帮助文档](https://support.typora.io/Links/#faq)
```
[帮助文档](https://support.typora.io/Links/#faq)

### 内部跳转--本文件内跳

格式为 `[link text](#要去的目的地--标题）`。

```markdown
[我想跳转](#目录)
```
[我想跳转](#目录)
>Open Links in Typora
>
>You can use `command+click` (macOS), or `ctrl+click` (Linux/Windows) on links in Typora to jump to target headings, or open them in Typora, or open in related apps.


### 自动链接

使用 `<>` 包括的 URL 或邮箱地址会被自动转换为超链接：

```markdown
<https://www.baidu.com>

<123@email.com>
```
<https://www.baidu.com>

[123@email.com](mailto:123@email.com)

## 图片

```markdown
![自己起的图片名字](图片地址或者图片本地存储的路径)
```

### 网上的图片

```markdown
![friedChicken](https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1580814517&di=2630beac440e5dab0e44c7286a3b2b61&src=http://imgsrc.baidu.com/forum/w=580/sign=12c730c4ff03738dde4a0c2a831ab073/9497794f9258d1091818e6d6d858ccbf6d814d1b.jpg)
```

![炸鸡](https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1580814517&di=2630beac440e5dab0e44c7286a3b2b61&src=http://imgsrc.baidu.com/forum/w=580/sign=12c730c4ff03738dde4a0c2a831ab073/9497794f9258d1091818e6d6d858ccbf6d814d1b.jpg)

### 本地图片

```markdown
![friedChicken](friedChicken.jpg)
在同一个文件夹里（用相对路径）
或者直接拷贝
```
![Yescafe](ivan_chien.png)
![Kazarus-glhf](lazarus.jpg)
![PlumYu](PlumYu.jpeg)


以上是关于MarkDown基础篇教程，此外在Typora上还可利用MarkDown画图，想要了解的同学可自行观看教程

[画图篇视频讲解链接](https://www.bilibili.com/video/av88551739/)






