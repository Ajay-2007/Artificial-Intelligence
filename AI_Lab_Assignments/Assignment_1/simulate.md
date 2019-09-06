<details><summary>Question</summary>
<p>
Before a quiz, the students of a batch have arranged themselves as per a convenient order in a m×n grid, representing m rows of seats, each row with n consecutive seats. The instructor however has a plan and wants to disrupt the order. He can ask two students sitting consecutively in a row to swap seats, two students sitting at the 1st position of consecutive rows to swap seats, and two students sitting at the last position of consequitive rows to swap seats. The instructor gives instructions as “swap <roll1> <roll2> where <roll1>” and <roll2> are the roll numbers of students who need to swap places. Many inputs will be invalid, where students are not consequitive and should be neglected. A student cannot swap with himself/herself.



Input Format: The first input is the number of test cases. For each test case, the first 3 inputs are m (number of rows), n (number of columns) and q (number of instructor instructions). The next line contains mn students in a row major format as per their current seating. The next q lines contain 1 instruction each.

 

Output Format: After each instruction, print the students as per the current seating in a row major format. Print illegal if the swap is not valid.

 

Sample Input

1

3 3 5

IIT1 IIT2 IIT3 IIT4 IIT5 IIT6 IIT7 IIT8 IIT9

swap IIT1 IIT4

swap IIT2 IIT5

swap IIT3 IIT6

swap IIT4 IIT2

swap IIT6 IIT4

 

Sample Output

IIT4 IIT2 IIT3 IIT1 IIT5 IIT6 IIT7 IIT8 IIT9

illegal

IIT4 IIT2 IIT6 IIT1 IIT5 IIT3 IIT7 IIT8 IIT9

IIT2 IIT4 IIT6 IIT1 IIT5 IIT3 IIT7 IIT8 IIT9

IIT2 IIT6 IIT4 IIT1 IIT5 IIT3 IIT7 IIT8 IIT9
</p>
</details>

```python
def printing(arr, m, n):
    for i in range(m):
        for j in range(n):
            print(arr[i][j], end=' ')

def swap(arr, ai, aj, bi, bj):
    tmp = arr[ai][aj]
    arr[ai][aj] = arr[bi][bj]
    arr[bi][bj] = tmp


t = int(input())
for _ in range(t):
    m, n, q = tuple(map(int, input().split()))
    s = list(map(str, input().split()))
    k = 0
    arr = []
    for i in range(m):
        temp = []
        for j in range(n):
            temp.append(s[k])
            k += 1
        arr.append(temp)
    
    for k in range(q):
        st, a, b = tuple(map(str, input().split()))
        ai, aj, bi, bj = 0, 0, 0, 0
        for i in range(m):
            for j in range(n):
                if arr[i][j] == a:
                    ai = i
                    aj = j
                if arr[i][j] == b:
                    bi = i
                    bj = j
    
        if (ai==bi) and (abs(aj-bj)==1):
            swap(arr, ai, aj, bi, bj)
            printing(arr, m, n)
            print()
        elif (aj == 0 and bj == 0) and (abs(ai-bi) == 1):
            swap(arr, ai, aj, bi, bj)
            printing(arr, m, n)
            print()
        elif (aj == n-1 and bj == n-1) and (abs(ai - bi) == 1):
            swap(arr, ai, aj, bi, bj)
            printing(arr, m, n)
            print()
        else:
            print("illegal")

```
