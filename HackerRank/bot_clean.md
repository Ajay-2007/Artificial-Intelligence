<details><summary>Question</summary>
<p>
The goal of Artificial Intelligence is to create a rational agent (Artificial Intelligence 1.1.4). An agent gets input from the environment through sensors and acts on the environment with actuators. In this challenge, you will program a simple bot to perform the correct actions based on environmental input.

Meet the bot MarkZoid. It's a cleaning bot whose sensor is a head mounted camera and whose actuators are the wheels beneath it. It's used to clean the floor.

The bot here is positioned at the top left corner of a 5*5 grid. Your task is to move the bot to clean all the dirty cells.

Input Format

The first line contains two space separated integers which indicate the current position of the bot.
The board is indexed using Matrix Convention
5 lines follow representing the grid. Each cell in the grid is represented by any of the following 3 characters: 'b' (ascii value 98) indicates the bot's current position, 'd' (ascii value 100) indicates a dirty cell and '-' (ascii value 45) indicates a clean cell in the grid.

Note If the bot is on a dirty cell, the cell will still have 'd' on it.

Output Format

The output is the action that is taken by the bot in the current step, and it can be either one of the movements in 4 directions or cleaning up the cell in which it is currently located. The valid output strings are LEFT, RIGHT, UP and DOWN or CLEAN. If the bot ever reaches a dirty cell, output CLEAN to clean the dirty cell. Repeat this process until all the cells on the grid are cleaned.

Sample Input #00
```
0 0
b---d
-d--d
--dd-
--d--
----d
```
Sample Output #00
```
RIGHT
```
Resultant state
```
-b--d
-d--d
--dd-
--d--
----d
```
Sample Input #01
```
0 1
-b--d
-d--d
--dd-
--d--
----d
```
Sample Output #01
```
DOWN
```
Resultant state
```
----d
-d--d
--dd-
--d--
----d
```
```Task```

Complete the function next_move that takes in 3 parameters posr, posc being the co-ordinates of the bot's current position and board which indicates the board state to print the bot's next move.

The codechecker will keep calling the function next_move till the game is over or you make an invalid move.

Scoring

Your score is (200 - number of moves the bot makes)/40. CLEAN is considered a move as well.

Once you submit, your bot will be played on four grids with three of the grid configurations unknown to you. The final score will be the sum of the scores obtained in each of the four grids.

Education Links

Introduction to AI by Stuart Russell and Peter Norvig
Motor cognition
</p>
</details>

[Question Link](https://www.hackerrank.com/challenges/botclean/problem "https://www.hackerrank.com/challenges/botclean/problem ")

```python
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 23 23:45:19 2019

@author: ajay_raikar
"""


#!/usr/bin/python

from collections import defaultdict
import heapq
import math

m = 5
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
    
    #return abs(x1 - x2) + abs(y1 - y2)
    c = math.sqrt((x1 - x2)**2+(y2 - y1)**2)
    return c

def neighbours(node):
    dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    result = []
    for dir in dirs:
        neighbor = (node[0] + dir[0], node[1] + dir[1])
        if 0 <= neighbor[0] < m and 0 <= neighbor[1] < m:
            result.append(neighbor)
    return result

def botclean(r,c,start, goal, grid):
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
    return path, came_from
    
r, c = [int(i) for i in input().strip().split()]
grid = []
 
for i in range(0, m): 
    grid.append(list(input().strip()))
start = None
goal = None
dirt_position = []
for i in range(m):
    for j in range(m):
        if grid[i][j] == 'd':
            dirt_position.append((i, j))
start = (r, c)
goal = dirt_position[0]
path, came_from = botclean(r,c, start, goal, grid)
start = path[0]
ans = []
x, y = start[0], start[1]
for point in path[1:]:
    if point == (x+1, y):
        ans.append("DOWN")
    if point == (x-1, y):
        ans.append("UP")
    if point == (x, y+1):
        ans.append("RIGHT")
    if point == (x, y-1):
        ans.append("LEFT")
    x,y = point[0], point[1]
try:
    print(ans[0])
except:
    print("CLEAN")

```
