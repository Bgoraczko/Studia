clc
clear all
close all

A = [1 4 3; 0 2 16; 0 -25 -20];
B = [-1; 0; 0];
C = [-1 3 0];

A1 = [1 0 0; 0 0 0; -2 -4 -3];
B1 = [-1; 0; -1];
C1 = [1 0 0];

% S = [B; B*A; B*A^2]
% O = [C; C*A; C*A^2]
%%
S = ctrb(A,B)

% RÃ³Å¼nica rzÄ™dÃ³w
R_STER1 = length(A) - rank(S)

O = obsv(A,C)

R_OBSER1 = length(A) - rank(O)

%%
S1 = ctrb(A1,B1)

% RÃ³Å¼nica rzÄ™dÃ³w
R_STER2 = length(A1) - rank(S1)

O1 = obsv(A1,C1)

R_OBSER2 = length(A1) - rank(O1)

eig(A)

% UkÅ‚ad pierwszy jest niesterowalny ale obserwowalny
% R_STER1=2 a musi byÄ‡ 0 Å¼eby byÅ‚ sterowalny. Jest obserwowalny poniewaÅ¼
% R_OBSER1=0 czyli rzÄ™dy sÄ… takie same

% UkÅ‚ad drugi jest niesterowalny oraz nieobserwowalny, poniewaÅ¼
% rzÄ™dy dla obydwu przypadkÃ³w sÄ… rÃ³Å¼ne od siebie

[At,Bt,Ct]=ctrbf(A,B,C)
% W pierwszym przypadku moÅ¼emy zaprojektowaÄ‡ regulator dla sterowania
% poniewaÅ¼ rzÄ… jest rÃ³wny jeden wiec moÅ¼emy sterowaÄ‡ jednym biegunem ktÃ³rym
% jest w punkcie 1 czyli jest neistaiblny a reszta jest sprzezona na
% minusie wiec jest stabilna wiec wszystko jest g