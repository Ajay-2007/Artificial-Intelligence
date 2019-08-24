<details><summary>Question</summary>
<p>
Princess Peach is trapped in one of the four corners of a square grid. You are in the center of the grid and can move one step at a time in any of the four directions. Can you rescue the princess?

Input format

The first line contains an odd integer N (3 <= N < 100) denoting the size of the grid. This is followed by an NxN grid. Each cell is denoted by '-' (ascii value: 45). The bot position is denoted by 'm' and the princess position is denoted by 'p'.

Grid is indexed using Matrix Convention

Output format

Print out the moves you will take to rescue the princess in one go. The moves must be separated by '\n', a newline. The valid moves are LEFT or RIGHT or UP or DOWN.

</p>
<br>
<p>

Sample input<br>
3<br>
---<br>
-m-<br>
p--<br>
Sample output

DOWN<br>
LEFT<br>

## Task

Complete the function displayPathtoPrincess which takes in two parameters - the integer N and the character array grid. The grid will be formatted exactly as you see it in the input, so for the sample input the princess is at grid[2][0]. The function shall output moves (LEFT, RIGHT, UP or DOWN) on consecutive lines to rescue/reach the princess. The goal is to reach the princess in as few moves as possible.

The above sample input is just to help you understand the format. The princess ('p') can be in any one of the four corners.

Scoring
Your score is calculated as follows : (NxN - number of moves made to rescue the princess)/10, where N is the size of the grid (3x3 in the sample testcase).
</p>
</details>

[Question Link](https://www.hackerrank.com/challenges/saveprincess?hr_b=1 "https://www.hackerrank.com/challenges/saveprincess?hr_b=1")

```python
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

def neighbours(node):
    dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    result = []
    for dir in dirs:
        neighbor = (node[0] + dir[0], node[1] + dir[1])
        if 0 <= neighbor[0] < m and 0 <= neighbor[1] < m:
            result.append(neighbor)
    return result

def heuristic(a, b):
    (x1, y1) = a
    (x2, y2) = b
    
    return abs(x1 - x2) + abs(y1 - y2)

def displayPathtoPrincess(n,grid):
    size = n
    start = None
    goal = None
    for i in range(size):
        for j in range(size):
            if grid[i][j] == 'p':
                goal = (i, j)
            if grid[i][j] == 'm':
                start = (i, j)
                
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

grid = [] 
for i in range(0, m): 
    grid.append(list(input().strip()))
    
came_from = displayPathtoPrincess(m,grid)
start = came_from[0]
x, y = start[0], start[1]
for point in came_from[1:]:
    if point == (x+1, y):
        print("DOWN")
    if point == (x-1, y):
        print("UP")
    if point == (x, y+1):
        print("RIGHT")
    if point == (x, y-1):
        print("LEFT")
    x,y = point[0], point[1]

```
