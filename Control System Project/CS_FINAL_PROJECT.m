clc
clear all 
close all

A = [4 0; 0 1];
B = [0.4; 0.3];
C = [1 0; 0 0];
D = [0;0];

%stability check method 1st: poles of tf
[nom den] = ss2tf(A,B,C,D); poles_tf = roots(den);
disp('Poles of tranfer fuction are: '); poles_tf


%poles zeros map

pzmap(A, B, C, D);
title('pole-zeros map of system')

%stability check 2nd method: eigenvalues
egen_values = eig(A);
disp('eigenvalues of matrix A are: ')
egen_values

%stability check method 3rd: step response
figure;
step(A,B,C,D);
title('step response of the system ')
ylabel('Amplitude of step response')


order = size(A,1);
disp('order of the system')
order

%controlibility test
%P = [B A*B] determinate = det(P)

P = ctrb(A,B);
Rank_ctrb = rank(P);
disp('Rank of controllability matrix is')
Rank_ctrb

%observability test
Q = [C; C*A];
q = obsv(A,C);
Rank_Q = rank(Q);
disp('the rank of matrix Q is')
Rank_Q


% desired_L_egnvalues = [];
% L_observer = place(A ,B, desired_L_egnvalues);

% desired_egnvalues = [];
% K_controller = place(A ,B, desired_egnvalues);

%controller design
% desired_eqvalue = [0 1];
% K = place(A, B, desired_eqvalue);
% A_clp = A - B*K;
% B_clp = B;
% C_clp = C;
% D_clp = D;
% 
% figure;
% step(A_clp, B_clp, C_clp, D_clp);
% title('response of close loop system')
% final_value = dcgain(A_clp, B_clp, C_clp, D_clp);
% disp('dc-gain of the system ')
% final_value