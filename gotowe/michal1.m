clear all
close all
clc
%regulator
numG= 1;
denG= conv(conv([1 0],[1 1]),[0.2 1]);
%Przejscie do przsestrzeni stanu.
[Ag,Bg,Cg,Dg] = tf2ss(numG,denG);
%wylicznie biegunów dla układu drugiego rzędu
damping = 0.707;
wn =3;
[num2, den2] = ord2(wn,damping);
%% Przepisany kod
%definicja zadanych biegunów(zawierają bieguny ukladu drugiego rzedu)
dominant= roots(den2);
desirepoles = [dominant' 10*real(dominant(1))];
%obliczanie wzmocnienia regulatora K
K = acker(Ag,Bg,desirepoles);
%macierz stanu dla układu zamknietego
Asf = Ag-Bg*K; Bsf=Bg; Csf=Cg; Dsf=0;
[numsf,densf] = ss2tf(Asf,Bsf,Csf,Dsf);
%definicja biegunóów obserwatora jako 1- razy szybszy niż w regulatorze.
obesrverpoles = 10*desirepoles;
%obliczanie wzmocnienia obserwatora L
L= acker(Ag',Cg',obesrverpoles);
%macierze stanu dla ukladu z regulatorem i obserwatorem
Areg = [(Ag-Bg*K) Bg*K; zeros(size(Ag)) (Ag-L' * Cg)];
Breg = [Bg; zeros(size(Bg))];
Creg = [Cg zeros(size(Cg))];
Dreg=0;
[numreg,denreg] = ss2tf(Areg,Breg,Creg,Dreg);
damp(denreg);
hold on
step(tf(numreg,denreg))
stepinfo(tf(numreg,denreg))

%% A
%definicja zadanych biegunów(zawierają bieguny ukladu drugiego rzedu)
dominant= roots(den2);
desirepoles = [dominant' 20*real(dominant(1))];
%obliczanie wzmocnienia regulatora K
K = acker(Ag,Bg,desirepoles);
%macierz stanu dla układu zamknietego
Asf = Ag-Bg*K; Bsf=Bg; Csf=Cg; Dsf=0;
[numsf,densf] = ss2tf(Asf,Bsf,Csf,Dsf);
%definicja biegunóów obserwatora jako 1- razy szybszy niż w regulatorze.
obesrverpoles = 10*desirepoles;
%obliczanie wzmocnienia obserwatora L
L= acker(Ag',Cg',obesrverpoles);
%macierze stanu dla ukladu z regulatorem i obserwatorem
Areg = [(Ag-Bg*K) Bg*K; zeros(size(Ag)) (Ag-L' * Cg)];
Breg = [Bg; zeros(size(Bg))];
Creg = [Cg zeros(size(Cg))];
Dreg=0;
[numreg,denreg] = ss2tf(Areg,Breg,Creg,Dreg);
damp(denreg);
hold on
step(tf(numreg,denreg))
stepinfo(tf(numreg,denreg))
%% B
%definicja zadanych biegunów(zawierają bieguny ukladu drugiego rzedu)
dominant= roots(den2);
desirepoles = [dominant' 4*real(dominant(1))];
%obliczanie wzmocnienia regulatora K
K = acker(Ag,Bg,desirepoles);
%macierz stanu dla układu zamknietego
Asf = Ag-Bg*K; Bsf=Bg; Csf=Cg; Dsf=0;
[numsf,densf] = ss2tf(Asf,Bsf,Csf,Dsf);
%definicja biegunóów obserwatora jako 1- razy szybszy niż w regulatorze.
obesrverpoles = 10*desirepoles;
%obliczanie wzmocnienia obserwatora L
L= acker(Ag',Cg',obesrverpoles);
%macierze stanu dla ukladu z regulatorem i obserwatorem
Areg = [(Ag-Bg*K) Bg*K; zeros(size(Ag)) (Ag-L' * Cg)];
Breg = [Bg; zeros(size(Bg))];
Creg = [Cg zeros(size(Cg))];
Dreg=0;
[numreg,denreg] = ss2tf(Areg,Breg,Creg,Dreg);
damp(denreg);
hold on
step(tf(numreg,denreg))
stepinfo(tf(numreg,denreg))
%% C
%definicja zadanych biegunów(zawierają bieguny ukladu drugiego rzedu)
dominant= roots(den2);
desirepoles = [dominant' 10*real(dominant(1))];
%obliczanie wzmocnienia regulatora K
K = acker(Ag,Bg,desirepoles);
%macierz stanu dla układu zamknietego
Asf = Ag-Bg*K; Bsf=Bg; Csf=Cg; Dsf=0;
[numsf,densf] = ss2tf(Asf,Bsf,Csf,Dsf);
%definicja biegunóów obserwatora jako 1- razy szybszy niż w regulatorze.
obesrverpoles = 20*desirepoles;
%obliczanie wzmocnienia obserwatora L
L= acker(Ag',Cg',obesrverpoles);
%macierze stanu dla ukladu z regulatorem i obserwatorem
Areg = [(Ag-Bg*K) Bg*K; zeros(size(Ag)) (Ag-L' * Cg)];
Breg = [Bg; zeros(size(Bg))];
Creg = [Cg zeros(size(Cg))];
Dreg=0;
[numreg,denreg] = ss2tf(Areg,Breg,Creg,Dreg);
damp(denreg);
hold on
step(tf(numreg,denreg),"o")

stepinfo(tf(numreg,denreg))
%% D
%definicja zadanych biegunów(zawierają bieguny ukladu drugiego rzedu)
dominant= roots(den2);
desirepoles = [dominant' 10*real(dominant(1))];
%obliczanie wzmocnienia regulatora K
K = acker(Ag,Bg,desirepoles);
%macierz stanu dla układu zamknietego
Asf = Ag-Bg*K; Bsf=Bg; Csf=Cg; Dsf=0;
[numsf,densf] = ss2tf(Asf,Bsf,Csf,Dsf);
%definicja biegunóów obserwatora jako 1- razy szybszy niż w regulatorze.
obesrverpoles = 4*desirepoles;
%obliczanie wzmocnienia obserwatora L
L= acker(Ag',Cg',obesrverpoles);
%macierze stanu dla ukladu z regulatorem i obserwatorem
Areg = [(Ag-Bg*K) Bg*K; zeros(size(Ag)) (Ag-L' * Cg)];
Breg = [Bg; zeros(size(Bg))];
Creg = [Cg zeros(size(Cg))];
Dreg=0;
[numreg,denreg] = ss2tf(Areg,Breg,Creg,Dreg);
damp(denreg);
hold on
step(tf(numreg,denreg),"m+")
legend("Dominujący 10 razy szybszy","Dominujący 20 razy szybszy","Dominujący 4 razy szybszy","Obserwujący 20 razy szybszy","Obserwujący 4 razy szybszy")
stepinfo(tf(numreg,denreg))