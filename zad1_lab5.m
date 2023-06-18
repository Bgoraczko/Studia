clc
clear all
close all
%% regulator
numG1 = 1;
denG1 = conv ( conv ( [ 1 0 ], [ 1 1 ] ), [ 0.2 1 ] );
% przejscie do przestrzeni stanu.
[ Ag1, Bg1, Cg1, Dg1 ] = tf2ss ( numG1, denG1 );
% wyliczenie biegunów dla ukladu drugiego rzedu.
damping = 0.707;
wn = 3;
[ numr, denr ] = ord2 (wn, damping);
% definicja zadanych biegunów (zawieraja bieguny ukladu drugiego rzedu).
dominant1 = roots(denr);
desiredpoles1 = [dominant1' 10 * real( dominant1(1) ) ];
% obliczenie wzmocnienia regulatora K.
K1 = acker (Ag1, Bg1, desiredpoles1);
% macierze stanu dla ukladu zamknietego.
Asf1 = Ag1 - Bg1 * K1; Bsf1 = Bg1; Csf1 = Cg1; Dsf1 = 0;
[numsf1, densf1] = ss2tf (Asf1, Bsf1, Csf1, Dsf1);
% definicja biegunów obserwatora jako 10 razy szybszych niz w regulatorze.
observerpoles1 = 10 * desiredpoles1;
% obliczenie wzmocnienia obserwatora L.
L1 = acker (Ag1', Cg1', observerpoles1);
% macierze stanu dla ukladu z regulatorem i obserwatorem.
Areg1 = [ (Ag1 - Bg1 * K1) Bg1 * K1; zeros( size(Ag1) ) (Ag1 - L1' * Cg1) ];
Breg1 = [ Bg1; zeros( size(Bg1) ) ];
Creg1 = [ Cg1 zeros ( size(Cg1) ) ];
Dreg1 = 0;
[numreg1, denreg1] = ss2tf ( Areg1, Breg1, Creg1, Dreg1 );
damp (denreg1);

step(tf(numreg1,denreg1))
stepinfo(tf(numreg1,denreg1))
%% a
% regulator
numG = 1;
denG = conv ( conv ( [ 1 0 ], [ 1 1 ] ), [ 0.2 1 ] );
% przejscie do przestrzeni stanu.
[ Ag, Bg, Cg, Dg ] = tf2ss ( numG, denG );
% wyliczenie biegunów dla ukladu drugiego rzedu.
damping = 0.707;
wn = 3
[ num2, den2 ] = ord2 (wn, damping);
% definicja zadanych biegunów (zawieraja bieguny ukladu drugiego rzedu).
dominant = roots(den2);
desiredpoles = [dominant' 20* real( dominant(1) ) ];
% obliczenie wzmocnienia regulatora K.
K = acker (Ag, Bg, desiredpoles);
% macierze stanu dla ukladu zamknietego.
Asf = Ag - Bg * K; Bsf = Bg; Csf = Cg; Dsf = 0;
[numsf, densf] = ss2tf (Asf, Bsf, Csf, Dsf);
% definicja biegunów obserwatora jako 10 razy szybszych niz w regulatorze.
observerpoles = 10 * desiredpoles;
% obliczenie wzmocnienia obserwatora L.
L = acker (Ag', Cg', observerpoles);
% macierze stanu dla ukladu z regulatorem i obserwatorem.
Areg = [ (Ag - Bg * K) Bg * K; zeros( size(Ag) ) (Ag - L' * Cg) ];
Breg = [ Bg; zeros( size(Bg) ) ];
Creg = [ Cg zeros ( size(Cg) ) ];
Dreg = 0;
[numreg, denreg] = ss2tf ( Areg, Breg, Creg, Dreg );
damp (denreg);

step(tf(numreg,denreg))
hold on
step(tf(numreg1,denreg1))
stepinfo(tf(numreg,denreg))
legend("A","regulator.m")
%% b
% regulator
numG = 1;
denG = conv ( conv ( [ 1 0 ], [ 1 1 ] ), [ 0.2 1 ] );
% przejscie do przestrzeni stanu.
[ Ag, Bg, Cg, Dg ] = tf2ss ( numG, denG );
% wyliczenie biegunów dla ukladu drugiego rzedu.
damping = 0.707;
wn = 3;
[ num2, den2 ] = ord2 (wn, damping);
% definicja zadanych biegunów (zawieraja bieguny ukladu drugiego rzedu).
dominant = roots(den2);
desiredpoles = [dominant' 4* real( dominant(1) ) ];
% obliczenie wzmocnienia regulatora K.
K = acker (Ag, Bg, desiredpoles);
% macierze stanu dla ukladu zamknietego.
Asf = Ag - Bg * K; Bsf = Bg; Csf = Cg; Dsf = 0;
[numsf, densf] = ss2tf (Asf, Bsf, Csf, Dsf);
% definicja biegunów obserwatora jako 10 razy szybszych niz w regulatorze.
observerpoles = 10 * desiredpoles;
% obliczenie wzmocnienia obserwatora L.
L = acker (Ag', Cg', observerpoles);
% macierze stanu dla ukladu z regulatorem i obserwatorem.
Areg = [ (Ag - Bg * K) Bg * K; zeros( size(Ag) ) (Ag - L' * Cg) ];
Breg = [ Bg; zeros( size(Bg) ) ];
Creg = [ Cg zeros ( size(Cg) ) ];
Dreg = 0;
[numreg, denreg] = ss2tf ( Areg, Breg, Creg, Dreg );
damp (denreg);

step(tf(numreg,denreg))
hold on
step(tf(numreg1,denreg1))
stepinfo(tf(numreg,denreg))
legend("B","regulator.m")
%% c
% regulator
numG = 1;
denG = conv ( conv ( [ 1 0 ], [ 1 1 ] ), [ 0.2 1 ] );
% przejscie do przestrzeni stanu.
[ Ag, Bg, Cg, Dg ] = tf2ss ( numG, denG );
% wyliczenie biegunów dla ukladu drugiego rzedu.
damping = 0.707;
wn = 3;
[ num2, den2 ] = ord2 (wn, damping);
% definicja zadanych biegunów (zawieraja bieguny ukladu drugiego rzedu).
dominant = roots(den2);
desiredpoles = [dominant' 10* real( dominant(1) ) ];
% obliczenie wzmocnienia regulatora K.
K = acker (Ag, Bg, desiredpoles);
% macierze stanu dla ukladu zamknietego.
Asf = Ag - Bg * K; Bsf = Bg; Csf = Cg; Dsf = 0;
[numsf, densf] = ss2tf (Asf, Bsf, Csf, Dsf);
% definicja biegunów obserwatora jako 10 razy szybszych niz w regulatorze.
observerpoles = 20 * desiredpoles;
% obliczenie wzmocnienia obserwatora L.
L = acker (Ag', Cg', observerpoles);
% macierze stanu dla ukladu z regulatorem i obserwatorem.
Areg = [ (Ag - Bg * K) Bg * K; zeros( size(Ag) ) (Ag - L' * Cg) ];
Breg = [ Bg; zeros( size(Bg) ) ];
Creg = [ Cg zeros ( size(Cg) ) ];
Dreg = 0;
[numreg, denreg] = ss2tf ( Areg, Breg, Creg, Dreg );
damp (denreg);

step(tf(numreg,denreg))
hold on
step(tf(numreg1,denreg1))
stepinfo(tf(numreg,denreg))
legend("C","regulator.m")
%% d
% regulator
numG = 1;
denG = conv ( conv ( [ 1 0 ], [ 1 1 ] ), [ 0.2 1 ] );
% przejscie do przestrzeni stanu.
[ Ag, Bg, Cg, Dg ] = tf2ss ( numG, denG );
% wyliczenie biegunów dla ukladu drugiego rzedu.
damping = 0.707;
wn = 3;
[ num2, den2 ] = ord2 (wn, damping);
% definicja zadanych biegunów (zawieraja bieguny ukladu drugiego rzedu).
dominant = roots(den2);
desiredpoles = [dominant' 10* real( dominant(1) ) ];
% obliczenie wzmocnienia regulatora K.
K = acker (Ag, Bg, desiredpoles);
% macierze stanu dla ukladu zamknietego.
Asf = Ag - Bg * K; Bsf = Bg; Csf = Cg; Dsf = 0;
[numsf, densf] = ss2tf (Asf, Bsf, Csf, Dsf);
% definicja biegunów obserwatora jako 10 razy szybszych niz w regulatorze.
observerpoles = 4 * desiredpoles;
% obliczenie wzmocnienia obserwatora L.
L = acker (Ag', Cg', observerpoles);
% macierze stanu dla ukladu z regulatorem i obserwatorem.
Areg = [ (Ag - Bg * K) Bg * K; zeros( size(Ag) ) (Ag - L' * Cg) ];
Breg = [ Bg; zeros( size(Bg) ) ];
Creg = [ Cg zeros ( size(Cg) ) ];
Dreg = 0;
[numreg, denreg] = ss2tf ( Areg, Breg, Creg, Dreg );
damp (denreg);

step(tf(numreg,denreg))
hold on
step(tf(numreg1,denreg1))
stepinfo(tf(numreg,denreg))
legend("D","regulator.m")
%% e
% regulator 
numG = 1;
denG= conv (conv([1 0], [1 1]), [0.2 1]);
% przejscie do przestrzeni stanu. 
[Ag, Bg, Cg, Dg] = tf2ss (numG, denG); 
% wyliczenie biegunów dla ukladu drugiego rzedu. 
damping = 0.707;
wn = 1.12252; 
[num2, den2] = ord2 (wn, damping);
% definicja zadanych biegunów (zawieraja bieguny ukladu drugiego rzedu).
dominant = roots(den2);
desiredpoles = [dominant' 10*real(dominant(1)) ]; %
% obliczenie wzmocnienia regulatora K. 
K = acker (Ag, Bg, desiredpoles); 
% macierze stanu dla ukladu zamknietego. 
Asf = Ag - Bg* K; 
Bsf = Bg; 
Csf = Cg; 
Dsf = 0; 
[numsf, densf] = ss2tf (Asf, Bsf, Csf, Dsf);
% definicja biegunów obserwatora jako 10 razy szybszych niz w regulatorze. 
observerpoles = 10 * desiredpoles; 
% obliczenie wzmocnienia obserwatora L. 
L = acker (Ag', Cg', observerpoles); 
% macierze stanu dla ukladu z regulatorem i obserwatorem. 
Areg = [(Ag - Bg* K) Bg * K; 
zeros(size(Ag)) (Ag - L'* Cg) ];
Breg = [Bg; zeros(size (Bg))]; 
Creg = [Cg zeros (size(Cg) ) ]; 
Dreg = 0; 
[numreg, denreg] = ss2tf (Areg, Breg, Creg, Dreg); 
damp (denreg); 
sys=tf(numreg, denreg) 
step(sys) 
hold on 
stepinfo(sys)
max(K)