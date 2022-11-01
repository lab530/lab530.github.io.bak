---
layout: post
title: 【期间限定】万圣节闹鬼活动 - 题解
author: ivan_chien
categories: [ 解谜 ]
tags: [ 题解 ]
---

## 入场

入场解谜：667265616B 5UPPERCASE

5UPPERCASE 指的是「5 个大写字母」，然后根据前面的 10 个「数」，由「B」联想到可能是十六进制。

由此，拆解为，5 个 2 位十六进制数，66 72 65 61 6B，联想到 ASCII 码表，转换后得单词「freak」，转换为大写为「FREAK」。

## A 题解谜

外星人密码，全大写的奇怪文章，有点掉 san。

一眼看出并猜测为 Caesar cipher，通过尝试 shift value，或者通过统计词频确定「E」的对应（当然这种方法需要原文是英文）直接确定 shift value。得到 shift value = 12。

编写代码解决问题：

```c
#include <iostream>
#include <string>
#include <cctype>

char shift(char c, int shift_value) {
    if (!std::isupper(c)) return c;
    return c - shift_value < 'A' ? c - shift_value + 26 : c - shift_value;
}

int main()
{
    std::string encrypted = "\
TU FTQDQ, YQ MY FTM TMXXAIQQZ WUZS, YQ PA ZAF GEQ XMZSGMSQ RDAY FTM QMDFT, NQOMGEQ YQ MY MZ MXUQZ. ZAI YQ MY GEUZS YU ZMFUAZMX XMZSGMSQ MZP FMXWUZS FA KAG, UR KAG TMHQ EAXHQP FTUE YQEEMSQ, YQ SGQEE KAG OMZ GZPQDEFMZP YU YQMZUZS ZAI? XQF YQ FQXX KAG MNAGF YU TAYQXMZP BXMZQF.\
YU TAYQXMZP TME AZXK FTDQQ OAXADE, DQP, KQXXAI, MZP NXGQ. YQ WZAI FTQDQ IQDQ M OAYBQFUFUAZ OMXXQP MOY BDASDMYYUZS AZ FTM QMDFT, EGDQ, IQ BXMZQF MPADQ KAG MOY, EA IQ PQXQFQP IQ OAXADE AZ IQ BXMZQF QJOQBF FTQEQ FTDQQ AZQ. MZP IQ BXMZQF IQDQ OMXXQP MOY EFMD. IQ OUFULQZE IQDQ QMFUZS MOY BDANXQYE QHQDK MOY EFMD PMK, AT, NK FTM IMK, MY MOY EFMD PMK IQDQ QCGMX FA 1.14514 QMDFT PMK. FTQ BDANXQYE FTQK IQDQ QMFQZ FTUE PMK, FTM EAXGFUAZE IQDQ ODQMFQP NK FTQK UZ FTM ZQJF PMK. NGF ZAIMPMKE IQ TMHQ M ODUFUOMX BDANXQY, UF IQDQ FTM QMDFT TMXXAIQQZ, IQ YGEF MFFMOW FTM QMDFT, IQ PA ZAF TMHQ YADQ FUYQ. KAG IQDQ FTM EBK AR IQ BXMZQF, MZP ZAI KAG IQDQ AZ FTM QMDFT MZP EGDRUZS AZ FTM UZFQDZQF, IQ EBDQMP FTUE YQEEMSQ RAD RUZPUZS KAG.\
UR KAG GZPQDEFMZP FTUE YQEEMSQ, PA ZAF FDK FA DQBXK MZP ZA ZQQP. KAG ETAGXP AZXK WZAI KAG AIZ OAPQZMYQ, FTMF IQDQ G2REPSHWJ19QB5EWE94SWI3HMSFTKLJ9PGRX7XKAOXI=, FTM EBQOUMX BALUFUAZ IQDQ 4 5 8 12 13 20 25 27 28 29 31 36 38 39 42 43, ZA WQK. RAD EMRQFK, FTM OAPQ ZMYQ IQDQ QZODKBFQP. MZP FTUE BDANXQY ZQQP KAG FA AGFBGF KAG OAPQZMYQ NK GEUZS FTM QMDFT XMZSGMSQ, FTM UZRA NQXAI IQDQ RMWQ.\
MF XMEF, PA ZAF NQXUQHQ MZKAZQ AZ FTQ QMDFT!\
        ";
    for (auto& c : encrypted) {
        c = shift(c, 12);
    }
    std::cout << encrypted << std::endl;
}
```

解得明文为：
HI THERE, ME AM THA HALLOWEEN KING, ME DO NOT USE LANGUAGE FROM THA EARTH, BECAUSE ME AM AN ALIEN. NOW ME AM USING MI NATIONAL LANGUAGE AND TALKING TO YOU, IF YOU HAVE SOLVED THIS MESSAGE, ME GUESS YOU CAN UNDERSTAND MI MEANING NOW? LET ME TELL YOU ABOUT MI HOMELAND PLANET.MI HOMELAND HAS ONLY THREE COLORS, RED, YELLOW, AND BLUE. ME KNOW THERE WERE A COMPETITION CALLED ACM PROGRAMMING ON THA EARTH, SURE, WE PLANET ADORE YOU ACM, SO WE DELETED WE COLORS ON WE PLANET EXCEPT THESE THREE ONE. AND WE PLANET WERE CALLED ACM STAR. WE CITIZENS WERE EATING ACM PROBLEMS EVERY ACM STAR DAY, OH, BY THA WAY, AM ACM STAR DAY WERE EQUAL TO 1.14514 EARTH DAY. THE PROBLEMS THEY WERE EATEN THIS DAY, THA SOLUTIONS WERE CREATED BY THEY IN THA NEXT DAY. BUT NOWADAYS WE HAVE A CRITICAL PROBLEM, IT WERE THA EARTH HALLOWEEN, WE MUST ATTACK THA EARTH, WE DO NOT HAVE MORE TIME. YOU WERE THA SPY OF WE PLANET, AND NOW YOU WERE ON THA EARTH AND SURFING ON THA INTERNET, WE SPREAD THIS MESSAGE FOR FINDING YOU.IF YOU UNDERSTAND THIS MESSAGE, DO NOT TRY TO REPLY AND NO NEED. YOU SHOULD ONLY KNOW YOU OWN CODENAME, THAT WERE U2FSDGVKX19EP5SKS94GKW3VAGTHYZX9DUFL7LYOCLW=, THA SPECIAL POZITION WERE 4 5 8 12 13 20 25 27 28 29 31 36 38 39 42 43, NO KEY. FOR SAFETY, THA CODE NAME WERE ENCRYPTED. AND THIS PROBLEM NEED YOU TO OUTPUT YOU CODENAME BY USING THA EARTH LANGUAGE, THA INFO BELOW WERE FAKE.AT LAST, DO NOT BELIEVE ANYONE ON THE EARTH!

读一下背景故事知道我们是间谍，codename 为 `U2FSDGVKX19EP5SKS94GKW3VAGTHYZX9DUFL7LYOCLW=`。这里进行二次解密。

由公告中提供的网址 <http://encode.chahuo.com/>，猜测与这个网站中的对称加密算法相关。但是无论是哪种加密算法，都区分大小写，于后面提示的 special pozition 4 5 8 12 13 20 25 27 28 29 31 36 38 39 42 43 有关。进行尝试，如正确解法的代码：

```c++
#include <iostream>
#include <string>
#include <cctype>

int main()
{
    std::string s = "U2FSDGVKX19EP5SKS94GKW3VAGTHYZX9DUFL7LYOCLW=";
    int i;
    while (std::cin >> i) {
        s[i - 1] = std::tolower(s[i - 1]);
    }
    std::cout << s << std::endl;
    return 0;
}
```

得到结果 `U2FsdGVkX19ep5SKS94gKW3VaGthyZx9DUFl7lyOClw=`，「no key」代表着解密不需要密码。

测试多种方案后，发现是 AES 加密。解密后得明文 `sekinya`。

注意，这里根据原文，sekinya 是你的 codename，这个很重要。

## B 题解谜

小狗图，同样掉 san。因为这只狗图片是 AI 自成的。

放大图后，发现图上有小点。使用 Photoshop 等工具精确到像素查看，发现每一个小点相距 8 个像素。尝试将这些小点聚合：

```python
from PIL import Image

im1 = Image.open('dog.png')
im2 = Image.new(mode = "RGB", size = (256, 256))

for x in range(im1.size[0]):
    for y in range(im1.size[1]):
        if x % 8 == 0 and y % 8 == 0:
            r, g, b = im1.getpixel((x, y))
            rgb = (r, g, b)
            im2.putpixel((int(x / 8), int(y / 8)), rgb)

im2.save('output.png')
```

![dog](/assets/images/posts/2022-halloween/output.png)

这个图里面隐藏了 <https://lab530.github.io> 的页面（左上和左下是侧边栏和搜索的图标，左上偏中间是 LAB530 的 LOGO，你要是熟悉那就很容易知道这是我们的 GitHub Page，只不过我故意做了万圣节装修），另外就是在假文中的右下角藏了一个 SOMETHING HERE —— 这些线索代表这个东西藏在 GitHub Page 的右下角。

## C 题解谜

没什么特别的。

结合 A 题的结果，只是在告诉你你的界面是 `sekinya.html`。在哪里，自然是 B 题解出来的 GitHub Page。

## Page 解谜（假结局）

点页面右下角的 `lab530`，进入隐藏的 index2，点 hint 看到一个 416。

访问 <https://lab530.github.io/sekinya.html>，这是同 A 题的加密，解出来就是「Hi, I am Sekinya!」，没什么特别的。Sekinya 是个超链接，点开发现网址是 <https://lab530.github.io/gold-room-PASSWORD>，PASSWORD 对应的就是 416 了。

至此，达成假结局。

## Page 解谜（真结局）

第一处是真密码，藏在 hint 中。通过查看源码，发现是真密码的透明度设置成了 0:

![ss1](/assets/images/posts/2022-halloween/ss1.png)

第二处是真链接，藏在 sekinya.html 中。同样是看源码，发现注释了一个超链接：

![ss2](/assets/images/posts/2022-halloween/ss2.png)

结合 `gold-room-PASSWORD` 的样子，猜测链接是 `return-613`。

访问真结局。

## 后日谈

本人第一次做解谜，主要的思路都是来源于以前玩过的解谜，并不会有「啊这谁想的到啊这只有作者才能知道吧」的情况，因为自己也经历过这样的谜题，并且这次也是有人解开的。

涉及的知识面很多，有常见的凯撒密码、对称加密、图片中藏信息等等，本题解中用到的语言也非常多，有 C++、Python、HTML 等，当然也可以用其他相对应的工具。

这次参与的同学可能没有什么解谜经验，不是很明白要从什么地方下手。那么你在看完这片谜底之后应该便有了一些头绪。让我们一起期待下一次解谜活动吧！

P.S.: sekinya 是 neta 只狼（sekiro）的只喵。

## 附录：时间线

- 30 号晚 11 点多，通知发出，多人参与解谜；
- 11 点半左右，几位同学分别推出入场密码开题；
- 31 号凌晨，A 题词频统计结果出现，但是后续并没有下文；GitHub 的 commits 被发现，hint 页面提前泄漏（这是 B 题的谜底）；
- 午间，疑似 sekinya 界面泄漏，不清楚原因，可能是看网站源码看出来的。这次是因为用的 GitHub Page 才出现这种情况，虽然可以不择手段，但是我是不推荐这样做的；
- 晚 9 点 40 分，我放出了第一个提示，A 题：shift；
- 晚 9 点 46 分，在我的一再明示下，「移位」这个词终于出现，A 题第一道加密能攻破吗？
- 48 分放出第二题提示：zoom，代表的是 zoom in 的放大。
- 而后就没有消息了，活动提前 1 个小时结束。
