<details><summary>Question</summary>
<p>
In this version of "Bot saves princess", Princess Peach and bot's position are randomly set. Can you save the princess?

Task

Complete the function nextMove which takes in 4 parameters - an integer N, integers r and c indicating the row & column position of the bot and the character array grid - and outputs the next move the bot makes to rescue the princess.

Input Format

The first line of the input is N (<100), the size of the board (NxN). The second line of the input contains two space separated integers, which is the position of the bot.

Grid is indexed using Matrix Convention

The position of the princess is indicated by the character 'p' and the position of the bot is indicated by the character 'm' and each cell is denoted by '-' (ascii value: 45).

Output Format

Output only the next move you take to rescue the princess. Valid moves are LEFT, RIGHT, UP or DOWN

Sample Input<br>

5<br>
2 3<br>
-----<br>
-----<br>
p--m-<br>
-----<br>
-----<br>
Sample Output<br>

LEFT<br>
Resultant State<br>

-----<br>
-----<br>
p-m--<br>
-----<br>
-----<br>
Explanation<br>

As you can see, bot is one step closer to the princess.

Scoring
Your score for every testcase would be (NxN minus number of moves made to rescue the princess)/10 where N is the size of the grid (5x5 in the sample testcase). Maximum score is 17.5
</p>
</details>

[Question Link](https://www.hackerrank.com/challenges/saveprincess2 "https://www.hackerrank.com/challenges/saveprincess2 ")

```python
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 23 23:45:19 2019

@author: ajay_raikar
"""


#!/usr/bin/python

from collections import defaultdict
import heapq

class PriorityQueue:
    def __init__(self):
        self.elements = []
    
    def empty(self):
        return len(self.elements) == 0
    
    def put(self, item, priority):
        heapq.heappush(self.elements, (priority, item))
    
    def get(self):
        return heapq.heappop(self.elements)[1]

def heuristic(a, b):
    (x1, y1) = a
    (x2, y2) = b
    
    return abs(x1 - x2) + abs(y1 - y2)

def nextMove(n,r,c,grid):
    # convert the input matrix into adjacency matrix
    size = n
    # detect the point of princess store it in the goal
    # detect the point of person store it in the source
    start = None
    goal = None
    for i in range(size):
        for j in range(size):
            if grid[i][j] == 'p':
                goal = (i, j)
            if grid[i][j] == 'm':
                start = (i, j)
    
    # do Breadth First Search and
    frontier = PriorityQueue()
    frontier.put(start, 0)
    came_from = defaultdict()
    came_from[start] = None
    while not frontier.empty():
        current = frontier.get()
        if current == goal:
            break
        
        for next in neighbours(current):
            if next not in came_from:
                priority = heuristic(goal, next)
                frontier.put(next, priority)
                came_from[next] = current
        
    current = goal
    path = []
    while current != start:
        path.append(current)
        current = came_from[current]
    path.append(start) # this will give us path from goal->start
    path.reverse() # this will give us path from start-> goal
    return path
    
m = int(input())
r, c = [int(i) for i in input().strip().split()]
grid = []
 
for i in range(0, m): 
    grid.append(input().strip())
all_nodes = []

for x in range(m):
    for y in range(m):
        all_nodes.append([x, y])

def neighbours(node):
    dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    result = []
    for dir in dirs:
        neighbor = (node[0] + dir[0], node[1] + dir[1])
        if 0 <= neighbor[0] < m and 0 <= neighbor[1] < m:
            result.append(neighbor)
    return result

came_from = nextMove(m,r,c, grid)
start = came_from[0]
ans = []
x, y = start[0], start[1]
for point in came_from[1:]:
    if point == (x+1, y):
        ans.append("DOWN")
    if point == (x-1, y):
        ans.append("UP")
    if point == (x, y+1):
        ans.append("RIGHT")
    if point == (x, y-1):
        ans.append("LEFT")
    x,y = point[0], point[1]
print(ans[0])

```
