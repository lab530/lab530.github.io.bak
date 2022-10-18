---
layout: post
title:  530 Cpp Coding Style
subtitle: 让你写出一份漂亮的代码
author: lazarus
coworkers: [ ivan_chien ]
categories: [ 代码入门 ]
tags: [ CodingsStyle ]
---

**评价一份代码的好坏有许多标准，但无论如何都不仅是能够编译通过，本文旨在给出一份基础的代码风格推荐。**

## 目录

- [目录](#目录)
- [C / C++ 基础语法](#c--c-基础语法)
  - [注释](#注释)
  - [变量声明与定义](#变量声明与定义)
  - [运算符与表达式](#运算符与表达式)
    - [单目运算符](#单目运算符)
    - [双目运算符](#双目运算符)
    - [逗号运算符 `,`](#逗号运算符-)
  - [判断与循环](#判断与循环)
    - [判断](#判断)
    - [循环](#循环)

## C / C++ 基础语法

### 注释

注释记号（comment marks）与注释文本之间要使用一个空格隔开：

```c
// 这是正文，前面有空格

/* 这是正文，前后有空格 */

/** 这是一个段落，
    * 这是第二行，
    * 每一行都符合这样的要求。并且，这行后面有空格。 */
```

单行注释使用 `//`。尽量避免与代码同行，注释应写在相关代码的上面。即使同行也在其之前使用适当数量的空格隔开：

```c
// 表示苹果的数量
int apples;

// 完成向量的头删操作，并获取被删除的首元素
// TODO 该代码不完全安全，待添加向量为空的判断
int head = vec.front();
vec.erase(vec.begin());

int apples;  // 表示苹果的数量。注意注释前有两个数量的空格与代码隔开
```

TODO 更多注释记号的说明：多行注释、Docs、TODO、!? 标记等。

### 变量声明与定义

创建变量时应通俗易懂，尽量避免使用意义不明的字母，或至少应有注释：

```c
// 请这样
int apples;

// 不要这样
int a;

// n 为输入数据组数
int n;
```

对于较为复杂的变量名，无法用一个单词概括的，除第一个单词外其余单词首字母应当大写：

```c
// 请这样
int appleTree;

// 不要这样
int appletree;

// 请不要在变量名中出现下划线！（某 g 姓学长的执念）
// NEVER DO THIS!
int apple_tree;
```

除非变量之间有明确相关关系，否则尽量不要在一行声明多个变量, 一行声明多个变量时，需要用空格隔开 (遵循 `,` 运算符规则):

```c
// 请这样
int apples;
int appleTrees;

// 或这样
int apples, appleTrees, totalApples; // 空格应打在 ',' 号后面

// 不要这样
int a,b,c,d,n,m,s;
```

要求指针在声明时立即进行初始化，如：

```c
int* p1 = nullptr;  // C 语言则为 NULL

int foo = 42;
int* p2 = &foo;

int* p3 = new int;
// delete p3;
```

建议 `new` 和 `delete` 成对书写。

### 运算符与表达式

#### 单目运算符

通常而言单目运算符应与参数之间不要有空格：

```c
// 请这样
*pointer = 1;
pointer++;

// 不要这样
* poniter = 1;
pointer ++;
```  

- 指针  
  
```c
// 声明指针时应当将 * 运算符与变量类型放在一起
int* pointer;
```

- 数组下标 `[]` 与圆括号 `()` 内不需要加空格：
  
```c
// 请这样
arr[10] = 1;
fib(5);

// 不要这样
arr[ 10 ];
fib( 5 );
```

#### 双目运算符

双目运算符有很多，包括四则运算符、逻辑运算符、位运算符等，运算数（operand）与运算符（operator）之间应有空格：

```c
// 请这样
totalApples = smallApples + bigApples; 
arr[1 + 2];
fib(1 + 2);

// 不要这样
totalApples=smallApples+bigApples;
arr[1+2];
fib[1+2];
```

#### 逗号运算符 `,`

逗号运算符是一种特殊的运算符，它用于连接表达式，常出现在变量声明等情况中，逗号运算符后通常需要加上一个空格:

```c
// 请这样 
int apples, appleTrees;
swap(a, b);

// 不要这样
int apples,appleTrees;
swap(a,b);
```  

### 判断与循环

#### 判断

  `if ()` 语句所形成的代码块会很大程度上影响代码的风格，因此请务必按照建议格式进行书写。

  ```c
  // 请这样
  // 'if' 与 '()' 空一格
  if (a > 0) 
  {                     // '{}' 单独占一行，与 'if' 对齐
    printf("%d", a);    // 代码块内容缩进一个 tab
  }
  else if (a < 0)       // 'else' 与 'else if' 另起一行
  {
    printf("%d", -a)
  }
  else
  {
    printf("a is zero.");
  }  
  ```  

  `if ()` 语句嵌套：

  ```c
  /** 
   * 嵌套部分遵循「代码块内容缩进一个 tab」的规则 
   * 在此基础上进一步缩进，保证 `{}` 整齐成对出现
   */
  if (a > 0)
  {
    if (b > 0)
    {
      printf("balabala");
    }
    else
    {
      printf("balabalabala");
    }
  }
  ```

#### 循环

循环格式类似于 `if` 语句，在这之上注意保持上文提到的格式规范
`for` 循环的 `()` 内的三个部分都要写上，彼此之间用 `;` + `` (空格) 隔开。

```c
// 请这样
for (int i = 0; i < 10; i++)
{
  print("hello world");
}

// 不要这样
int i = 0;
for ( ; ; )   
{
  if (i == 10)
  {
    break;
  }
  i++;
}
```

`while` 与 `do .. while`:

```c
//请这样
while (i < 10)  // 注意空格
{
  printf("hello world");
}

do
{
  printf("hello world");
} while (i < 10);
```

循环与 `if` 语句结合：  

```c
while (a < 10)
{
  if (b > 5)
  {
    printf("b is too large.");
    break;
  }
}
```  
