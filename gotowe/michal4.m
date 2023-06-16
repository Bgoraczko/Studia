clear all
close all
clc
%regulator
numG= 1;
denG= conv(conv([1 0],[1 1]),[0.2 1]);
damping = 0.707;
wn =3;
[num2, den2] = ord2(wn,damping);
dominant= roots(den2);
desirepoles = [dominant' 10*real(dominant(1))];
%Przejscie do przsestrzeni stanu.
[A,B,C,D]= tf2ss(numG,denG);
Ai = [0,C;zeros(3,1),A];
Bi = [0;B];
I_poles = [desirepoles -10];

K = acker(Ai,Bi,I_poles);
GI = tf([K(1)],[1 0])
Gsf = ss(A-B*K(2:4),B,C,0);
Gz = feedback(GI*Gsf,1);
step(Gz)
stepinfo(Gz)