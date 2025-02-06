%----------------------------------------------------------------------------------------
% File: nullclines_beta.m
%
% Goal: plot of the nullclines for the third case to highlight all the 
% possible cases of intersection between them.
%
% Use: nullclines_beta()
%
% Input: 
%
% Output: Figure 9 in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù, 
%         "A theoretical model of plant species competition: The case of 
%         invasive Carpobrotus sp. pl. and native Mediterranean coastal 
%         species", 2025
%
% Recalls: psi_q.m, phi_q.m
%
% Legend to the colors
% #1E88E5 blue E_1 carpobrotus-free
% #D81B60 red E_2 autocton-free
% #FFC107 yellow E_1^* coexistence
% #FF905B orange E_2^* coexistence
% #00E0BA green E_3^* coexistence (but in tristability)
% #CC97DC violet E_4^* coexistence
%
% Authors: IM Bulai, G Orrù
% Date last modified: January, 2025
%
% This file is part of the MPSC toolbox
% Copyright (C) 2025, IM Bulai, G Orrù
%
% The MPSC toolbox is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by the
% Free Software Foundation.
%
% The MPSC toolbox is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
% Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with the MPSC toolbox. If not, see <http://www.gnu.org/licenses/>.
%--------------------------------------------------------------------------
function nullclines_beta()

fprintf('Plot Figure 9');

K = 20;
d_1 = 0.1;
a = 0.1;
H = 20;
d_2 = 0.1;
b = 0.1;
beta = 2/3;
gamma = 1/3;
Q = linspace(0,2*K,1000);
figure;

% First plot: two points of intersection B > K^alpha and phi(Pmax)>H
r = 0.2;
s = 0.15;
A = r/(d_1*a);
B = s/(d_2*b);

subplot(1,2,1)
box on
title('$$\overline{E}^*_1 \land \overline{E}^*_2$$','Interpreter','latex');
hold on;
plot(Q,phi_q(Q,K,A,gamma,beta),'Color','#000000','LineWidth',1);
plot(Q,psi_q(Q,H,B,beta),'Color','#A2AEB9','LineWidth',1);
plot(0, 0, '.','Color','black','MarkerSize',15);
plot(H^(1-beta), 0, '.','Color','#1E88E5','MarkerSize',15);
plot(A^((1-beta)/beta),0, '.','Color','black');
plot(0,K, '.','Color','#D81B60','MarkerSize',15);
text(-0.1,K,'K','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(H^(1-beta)+0.2,-0.2,'H^{1-\beta}','VerticalAlignment', 'top', 'HorizontalAlignment', 'right')
text(A^((1-beta)/beta)+0.2,-0.2,'A^{(1-\beta)/\beta}','VerticalAlignment', 'top', 'HorizontalAlignment', 'right')
legend(['$$\overline{\phi}(Q)$$';'$$\overline{\psi}(Q)$$'],'Interpreter','latex','AutoUpdate','off')
pbaspect([1.5 1 1]);
ylim([0 K+2]);
xlim([0 H^(1-beta)+2]);
f1  =  @phi_q;
f2  =  @psi_q;
diff_f  =  @(x) f1(x,K,A,gamma,beta)-f2(x,H,B,beta);
x_intersect  =  fzero(diff_f, 1); % Initial guess of 0
y_intersect  =  f1(x_intersect,K,A,gamma,beta);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#FFC107','MarkerSize',15);
f1  =  @phi_q;
f2  =  @psi_q;
diff_f  =  @(x) f1(x,K,A,gamma,beta)-f2(x,H,B,beta);
x_intersect  =  fzero(diff_f, 2); % Initial guess of 0
y_intersect  =  f1(x_intersect,K,A,gamma,beta);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#FF905B','MarkerSize',15);
set(gca, 'yticklabels', {'0','','','','','','6'});
set(gca,'XTickLabel',[]);

r = 0.03;
s = 0.15;

A = r/(d_1*a);
B = s/(d_2*b);

subplot(1,2,2)
box on
title('$$\overline{E}^*_3$$','Interpreter','latex');
hold on;
plot(Q,phi_q(Q,K,A,gamma,beta),'Color','#000000','LineWidth',1);
plot(Q,psi_q(Q,H,B,beta),'Color','#A2AEB9','LineWidth',1);
plot(0, 0, '.','Color','black','MarkerSize',15);
plot(H^(1-beta), 0, '.','Color','#1E88E5','MarkerSize',15);
plot(A^((1-beta)/beta),0, '.','Color','black');
plot(0,K, '.','Color','#D81B60','MarkerSize',15);
text(-0.1,K,'K','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(H^(1-beta)+0.2,-0.2,'H^{1-\beta}','VerticalAlignment', 'top', 'HorizontalAlignment', 'right')
text(A^((1-beta)/beta)+0.2,-0.2,'A^{(1-\beta)/\beta}','VerticalAlignment', 'top', 'HorizontalAlignment', 'right')
legend(['$$\overline{\phi}(Q)$$';'$$\overline{\psi}(Q)$$'],'Interpreter','latex','AutoUpdate','off')
pbaspect([1.5 1 1]);
ylim([0 K+2]);
xlim([0 H^(1-beta)+2]);
f1  =  @phi_q;
f2  =  @psi_q;
diff_f  =  @(x) f1(x,K,A,gamma,beta)-f2(x,H,B,beta);
x_intersect  =  fzero(diff_f, 1); % Initial guess of 0
y_intersect  =  f1(x_intersect,K,A,gamma,beta);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#00E0BA','MarkerSize',15);
set(gca, 'yticklabels', {'0','','','','','','6'});
set(gca,'XTickLabel',[]);

cd ..\Figures

saveas(gcf, 'nullclines_third', 'fig');
saveas(gcf, 'nullclines_third', 'epsc');

cd ..\third_case


