clc
clear all
close all
%% układ 1
A1=[1 4 3;0 2 16;0 -25 -20];
B1=[-1;0;0];
C1=[-1 3 0];

bieguny1=eig(A1);
S1=ctrb(A1,B1 );

R_A1=rank(A1);
R_S1=rank(S1);

O1=obsv(A1,C1);

R_A1=rank(A1);
R_O1=rank(O1);

[A1t,B1t,C1t]=ctrbf(A1,B1,C1);

%% układ 2
A2 = [1 0 0; 0 0 0; -2 -4 -3];
B2 = [-1; 0; -1];
C2 = [1 0 0];

bieguny2=eig(A2);

S2=ctrb(A2,B2);

R_A2=length(A2);
R_S2=rank(S2);

O2=obsv(A2,C2);

R_A2=length(A2);
R_O2=rank(O2);

[A2t,B2t,C2t]=ctrbf(A2,B2,C2);
