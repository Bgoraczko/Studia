
%% moja wersja
clc
clear all
close all

A = [-5 -2; -3 0];
B = [1; -3];
C = [1 -1];
D = 0;

[num,den]=ss2tf(A,B,C,D)
tf(num,den)
dominant=roots(den)

desiredpoles = [dominant(1) -4 * real( dominant(2) ) ];
K = acker (A, B, desiredpoles);

% macierze stanu dla ukladu zamknietego.
Af = A - B * K; 
Bf = B;
Cf = C;
Df = 0;

[numsf, densf] = ss2tf (Af, Bf, Cf, Df);

step(tf(numsf,densf))
%ctrb - sterowalnosc
%eig - bieguny
%ctrbf - sprawdzenie bieguna niestabilnego

%% wersja z zajec

clc
clear all
close all

A = [-5 -2; -3 0];
B = [1; -3];
C = [1 -1];
D = 0;

S=ctrb(A,B)
R=rank(S)

bieg=eig(A)

[At,Bt,Ct]=ctrbf(A,B,C);
Kt=acker(At(2,2),Bt(2),-4);

Az=At-Bt* [0 Kt]
Bz=Bt
Cz=Ct
Dz=0

[num1,den1]=ss2tf(Az,Bz,Cz,Dz)

step(tf(num1,den1))
stepinfo(tf(num1,den1))