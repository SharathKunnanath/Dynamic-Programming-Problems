Given two strings s1 and s2, find the length of their longest common subsequence.

A subsequence of a string s is a subset of its characters that are not necessarily adjacent but have to be in the right order.



Example:

input:

s1 = "abdacbab"

s2 = "acebfca"

output: 4

explanation: A possible longest common subsequence of s1 and s2 is "abca"

**NOTE**: In my code, I find not only the length of the longest common subsequence (done recursively / memoized), but also the more complex task of finding the subsequence itself (done iteratively / tabular). Admittedly the time and space complexity for the latter could be improved slightly, but they are still well within acceptable bounds (T(n) = O(nm) & S(n) = O(nm)).