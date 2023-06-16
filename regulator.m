clc
clear all
close all

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
desiredpoles = [dominant' 10 * real( dominant(1) ) ];
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
stepinfo(tf(numreg,denreg))