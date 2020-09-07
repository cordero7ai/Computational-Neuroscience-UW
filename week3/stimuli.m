pkg load symbolic
syms s
s_threshold = solve(2*normpdf(s,5,0.5)==normpdf(s,7,1),s)
print(s_threshold)