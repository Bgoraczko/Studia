clear all
close all

A = [0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 7.3809 0 0 0 2 0; 0 -2.1904 0 -2 0 0; 0 0 -3.1904 0 0 0];
B = [0 0 0; 0 0 0; 0 0 0; 1 0 0; 0 1 0; 0 0 1];
C = [0 1 0 0 0 0];
D = [0];

b = eig(A)
Model = ss(A,B,C,D);
b1 = pole(Model);
s1 = ctrb(A,B(:,1));
rank(s1)
s2 = ctrb(A,B(:,2:3));
rank(s2)

[leta,meta] = ss2tf(A,B(:,2),C,D)
s2 = ctrb(A,B(:,2))
r2 = rank(s2)
Pleta = roots(leta)
Pmeta = roots(meta)
letaN= poly(Pleta(1:2))
metaN= poly(Pmeta(1:4))
[an,bn,cn,dn] = tf2ss(letaN,metaN)
s2n = ctrb(an,bn)

K = acker(an,bn,[-10 -10 -1-i -1+i])

azn=an-bn*K
step(azn,bn,cn,0)