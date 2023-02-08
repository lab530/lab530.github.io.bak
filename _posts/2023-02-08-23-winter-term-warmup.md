---
layout: post
title: 23 年冬季学期 22 级 ACM 新生杯热身赛
author: ivan_chien
coworkers: []
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

int main() {
    char c;
    if (std::cin >> c) {
        solve();
        std::cout << c;
    }
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
