clear all
close all

A = [0 1 0 0 0;
 -0.1 -0.5 0 0 0;
   0.5 0 0 0 0;
   0 0 10 0 0;
   0.5 1 0 0 0];

B = [0;1;0;0;0];
C = [0 0 0 1 0];
D =0;
%%A Sterowalnosc ukladu
s=ctrb(A,B);
rank(s)

% uklad nie sterowalny

%%B
[L,M] = ss2tf(A,B,C,D)
G = tf(L,M);
L1= [0 0 0 0 0 5];
M1= [0 1 0.5 0.1 0 0];
[A1,B1,C1,D1] = tf2ss(L1,M1)
%rząd macierzy A1 = 4
s1=ctrb(A1,B1)
rank(s1)
%rzad macierzy sterowalnosci = 4
% Uklad jest sterowalny
Gn = eig(A1)
%sterowalne na granicy stabilnosci\

%Możliwe jest zaprojektowanie regulatora
