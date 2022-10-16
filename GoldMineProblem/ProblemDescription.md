Given a mine of n rows and m columns where mine[i][j] represents the amount of gold that is present there, we want to enter from the top of the mine and take as much gold as possible when exiting from the bottom, knowing that we can only move to the bottom, to the bottom-left, or to the bottom-right. We can exit from anywhere from the last row.



Example:

input:
mine = 

$$\begin{matrix}
3&2&12&15&10\\
6&19&7&11&17\\
8&5&12&32&21\\
3&20&2&9&7
\end{matrix}$$

output: 73

explanation: 15+17+32+9 = 73

<br>
<hr>

**Constraints**:

len(matrix) >= 1

len(matrix[i]) >= 1

matrix[i][j] >= 0

<hr>

**NOTE**: 

I not only calculate the max gold possible but also the path (steps taken) needed to get that, which is a fun additional challenge

<hr>

**Runtime Complexity**:

T(n) = |keys| * cost of solving a subproblem + cost of calculating path

T(n) = nm * O(1) + O(n)

T(n) = O(nm) + O(n)

T(n) = O(nm)

<hr>

**Space Complexity**:

S(n) = |keys| * size of key value pair

S(n) = 2*nm + size of list * size of integer

S(n) = 2nm * c

S(n) = O(nm)