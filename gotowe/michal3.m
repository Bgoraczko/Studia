clear all
close all
clc

A = [-5 -2; -3 0];
B = [1; -3];
C = [1 -1];
D =  0;
s=ctrb(A,B)
rank(s)
rank(A)
[At,Bt,Ct]=ctrbf(A,B,C)
Kt = acker(At(2,2),Bt(2),-4)
Az= At-Bt*[0 Kt]
Bz = Bt
Cz = Ct
Dz = 0
step(Az,Bz,Cz,Dz)
G = ss2tf(Az,Bz,Cz,Dz)
stepinfo(G)
