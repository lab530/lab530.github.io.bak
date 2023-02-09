---
layout: post
title: 23 年冬季学期 22 级 ACM 新生杯热身赛
author: ivan_chien
coworkers: [ dengyue ]
categories: [ 代码 ]
tags: [ 题解 ]
---

## C++, Ivan Chien

### A:
```c
#include <bits/stdc++.h>

int main() {
    std::cout << "65721016777" << std::endl;
}
```

### B:
```c
#include <bits/stdc++.h>

int main() {
    int n, m, a;
    std::cin >> n >> m;
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        std::cin >> a;
        sum += a;
    }
    std::cout << std::min(sum, m) << std::endl;
}
```

### C:
```c
#include <bits/stdc++.h>

void solve() {
    char c;
    if (std::cin >> c) {
        solve();
        std::cout << c;
    }
}

int main()
{
    ::solve();
    std::cout << std::endl;
}
```

### D:
```c
#include <bits/stdc++.h>

int main() {
    int n;
    std::cin >> n;
    std::vector<int> a(n);
    for (int i = 0; i < n; ++i)
        std::cin >> a[i];
    std::sort(a.begin(), a.end());
    for (int i = 0; i < n; ++i)
        std::cout << a[i] << " \n"[i == n-1];
}
```

### E:
```c
#include <bits/stdc++.h>

int main() {
    int n;
    std::cin >> n;
    int sum = n;
    while (n >= 3) {
        sum += n / 3;
        n = n % 3 + n / 3;
    }
    std::cout << sum << std::endl;
}
```

### F:
```c
#include <bits/stdc++.h>

int gcd(int n, int m) {
    return m == 0 ? n : gcd(m, n % m);
}

int main() {
    int n, m;
    std::cin >> n >> m;
    std::cout << n / ::gcd(n, m) * m << std::endl;
}
```
## C, dengyue

### A:
```c
#include <stdio.h>
int main() {
    printf("65677277101");
    return 0;
}
```

### B:
```c
#include <stdio.h>
int main() {
    int n, m;
    int sum = 0;;
    int a[10000];
    scanf("%d %d", &n, &m);
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
        sum = sum + a[i];
    }
    if(sum > m) {
        printf("%d", m);
    }else {
        printf("%d", sum);
    }
    return 0;
}
```

### C:
```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main() {  
    int len, i;
    char a[100000];
    gets(a);
    len = strlen(a);
    for(i = len - 1; i >= 0; i--)
        printf("%c", a[i]);

    return 0;
}
```

### D:
```c
#include <stdio.h>
int main() {
    int a[1000000];
    int n;
    int i, j, m, temp;
    scanf("%d", &n);
    for( i = 0; i < n; i++)
        scanf("%d,", &a[i]);
    for( i = 0; i < n-1; i++) {
        m = i;  
        for( j = i + 1; j < n; j++) 
            if(a[j] < a[m])        
                m = j;    
        if(m != i) {
            temp = a[i];
            a[i] = a[m];
            a[m] = temp;
        }
    }
    for( j = 0; j < n; j++)
        printf("%d ", a[j]);
    printf("\n");
}
```

### E:
```c
#include <stdio.h>
int main() {
    int n;
    scanf("%d", &n);
    int ans = n;
    while(n >= 3) {
        ans += n / 3;
        n = n / 3 + n % 3;
    }
    printf("%d", ans);
    return 0;
}
```

### F:
```c
#include <stdio.h>
int main() {
    int a, b;
    int i, k;
    int temp;
    scanf("%d %d", &a, &b);
    i = a * b;
    while(b != 0) {
        temp = a % b;
        a = b;
        b = temp;
    }
    k = i / a;
    printf("%d", k);
}
```