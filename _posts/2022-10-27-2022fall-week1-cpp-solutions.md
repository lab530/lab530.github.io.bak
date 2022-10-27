---
layout: post
title: 2022 年下学年第 1 周周赛 - C++ 题解
author: ivan_chien
categories: [ 代码 ]
tags: [ 题解 ]
---

A.cc:

```c
#include <iostream>
using namespace std;

int main()
{
    int t;
    cin >> t;
    while (t--) {
        int n;
        cin >> n;
        if (n == 1) {
            cout << 2 << endl;
        } else if (n == 2) {
            cout << 1 << endl;
        } else if (n == 3) {
            cout << 1 << endl;
        } else {
            cout << (n - 1) / 3 + 1 << endl;
        }
    }

    return 0;
}
```

B.cc:

```c
#include <iostream>
#include <string>
using namespace std;

int main()
{
    int t;
    cin >> t;
    while (t--) {
        int m, n;
        cin >> m >> n;
        string cons(n, 'B');
        while (m--) {
            int k;
            cin >> k;
            k--;
            if (k >= n / 2) {
                k = n - 1 - k;
            }
            if (cons[k] == 'B') {
                cons[k] = 'A';
            } else if (cons[n - 1 - k] == 'B') {
                cons[n - 1 - k] = 'A';
            }
        }
        cout << cons << endl;
    }
    return 0;
}
```

C.cc:

```c
#include <iostream>
#include <iomanip>
#include <vector>
using namespace std;

int main()
{
    int n, m;
    cin >> n >> m;
    int cnt = 0;
    for (int i = 0; i < n; ++i) {
        vector<int> v;
        v.reserve(m);
        for (int ii = 0; ii < m; ++ii) {
            int a;
            cin >> a;
            v.push_back(a);
        }
        
        bool flag = true;
        for (int ii = 0; ii < m; ++ii) {
            int a;
            cin >> a;
            if (a != v[ii]) {
                flag = false;
            }
        }
        if (flag) ++cnt;
    }

    cout << setprecision(2) << fixed << 100 * double(cnt) / n << '%' << endl;

    return 0;
}
```

D.cc:

```c
#include <iostream>
using namespace std;

int main()
{
    int t;
    cin >> t;
    while (t--) {
        int n;
        cin >> n;
        n -= 4;
        int ans;
        switch (n % 3) {
            case 0: case 1:
                ans = n / 3 - 1;
                break;
            default:   // 2
                ans = n / 3;
                break;
        }
        cout << ans << endl;
    }
    return 0;
}
```

E.cc:

```c
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
    int t;
    cin >> t;
    while (t--) {
        vector<int> a;
        int n, k;
        cin >> n >> k;
        a.reserve(n);
        while (n--) {
            int i;
            cin >> i;
            a.push_back(i);
        }

        cout << (find(a.begin(), a.end(), 1) != a.end() ? "YES" : "NO") << endl;
    }

    return 0;
}
```

F.cc:

```c
#include <iostream>
#include <iomanip>
using namespace std;

constexpr int AB[] {10, 11, 20, 21, 30, 40, 50, 60, 70, 80, 90};
constexpr int DAYS[] {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

struct Date {
    Date() = default;
    Date(const Date&) = default;
    Date& operator=(const Date&) = default;
    Date(int y, int m, int d) : y{y}, m{m}, d{d} {}
    Date(int a, int b) {
        y = a * 1010 + b * 101;
        m = b * 10 + a;
        d = b * 10 + a;
    }

    bool isLeapYear() const {
        return (y % 4 == 0 && y % 100 != 0) || y % 400 == 0;
    }

    Date nextDay() const {
        if (m == 2 && d == 28) {
            if (isLeapYear()) {
                return {y, m, d + 1};
            }
        }
        if (m == 2 && d == 29) {
            return {y, m + 1, 1};
        }
        if (m == 12 && d == DAYS[12]) {
            return {y + 1, 1, 1};
        }

        if (d == DAYS[m]) {
            return {y, m + 1, 1};
        }

        return {y, m, d + 1};
    }

    bool isPalindrome() const {
        // if (d % 10 == 0) return false;
        return y % 10 == m / 10
            && y / 10 % 10 == m % 10
            && y / 100 % 10 == d / 10
            && y / 1000 == d % 10;
    }

    friend istream& operator>>(istream& is, Date& d) {
        char raw_date[9];
        is >> raw_date;
        d.y = (raw_date[0] - '0') * 1000 + (raw_date[1] - '0') * 100 + (raw_date[2] - '0') * 10 + (raw_date[3] - '0') * 1;
        d.m = (raw_date[4] - '0') * 10 + (raw_date[5] - '0') * 1;
        d.d = (raw_date[6] - '0') * 10 + (raw_date[7] - '0') * 1;
        return is;
    }

    friend ostream& operator<<(ostream& os, const Date& d) {
        return (os << setfill('0')
                   << setw(4) << d.y
                   << setw(2) << d.m
                   << setw(2) << d.d);
    }

    bool operator<(const Date& rhs) {
        if (this->y != rhs.y) {
            return this->y < rhs.y;
        } else if (this->m != rhs.m) {
            return this->m < rhs.m;
        } else {
            return this->d < rhs.d;
        }
    }

    bool operator==(const Date& rhs) {
        return this->y == rhs.y && this->m == rhs.m && this->d == rhs.d;
    }
   
private:
    int y, m, d;
};


int main()
{
    Date date;
    cin >> date;

    Date date1 = date.nextDay();
    while (!date1.isPalindrome()) {
        date1 = date1.nextDay();
    }
    cout << date1 << endl;
    
    Date date2(AB[0] / 10, AB[1] % 10);
    for (::size_t i = 1; i < sizeof(AB) / sizeof(int); ++i) {
        if (!(date2 < date || date2 == date)) {
            break;
        }
        date2 = Date(AB[i] / 10, AB[i] % 10);
    }
    cout << date2 << endl;

    return 0;
}
```