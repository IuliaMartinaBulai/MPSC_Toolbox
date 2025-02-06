%----------------------------------------------------------------------------------------
% File: nullclines_interaction_general.m
%
% Goal: plot of the nullclines for the fourth case to highlight all the 
% possible cases of intersection between them.
%
% Use: nullclines_interaction_general()
%
% Input: 
%
% Output: Figure 13 in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù, 
%         "A theoretical model of plant species competition: The case of 
%         invasive Carpobrotus sp. pl. and native Mediterranean coastal 
%         species", 2025
%
% Recalls: phi_p_general.m, psi_q_general.m
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

function nullclines_interaction_general()

fprintf('Plot Figure 13');

K = 10;
d_1 = 0.1;
a = 0.1;

H = 10;
d_2 = 0.1;
b = 0.1;

alpha  =  2/3;
beta = 2/3;
gamma = 1/3;

P = linspace(0,2*K,1000);
Q = linspace(0,2*K,1000);
figure;

%Second plot
r = 0.09;
s = 0.06;

A = r/(d_1*a);
B = s/(d_2*b);

subplot(1,2,1)
box on
title('$$\widehat{E}^*_1 \land \widehat{E}^*_2 \land \widehat{E}^*_3$$','Interpreter','latex');
hold on;
plot(P,phi_p_general(P,A,K,gamma,alpha,beta),'Color','#000000','LineWidth',1);
plot(psi_q_general(Q,H,B,beta,alpha),Q,'Color','#A2AEB9','LineWidth',1);
plot(0, 0, '.','Color','black','MarkerSize',15);
plot(K^(1-alpha), 0, '.','Color','#D81B60','MarkerSize',15);
plot(0,H^(1-beta), '.','Color','#1E88E5','MarkerSize',15);
plot(0.781235, 2.12, '.','Color','#FFC107','MarkerSize',15);
plot(1.52, 2, '.','Color','#00E0BA','MarkerSize',15);
plot(2.08, 0.76, '.','Color','#FF905B','MarkerSize',15);
text(-0.1,H^(1-beta)-0.05,'H^{1-\beta}','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K^(1-alpha)+0.1,-0.05,'K^{1-\alpha}','VerticalAlignment', 'top', 'HorizontalAlignment', 'right')
legend(['$$\widehat{\phi}(Q)$$';'$$\widehat{\psi}(Q)$$'],'Interpreter','latex','AutoUpdate','off')
axis equal
ylim([0 K^(1-beta)+0.5]);
xlim([0 H^(1-alpha)+0.5]);
set(gca, 'yticklabels', {'0','','','','','','6'});
set(gca,'XTickLabel',[]);

% First plot: two points of intersection B > K^alpha and phi(Pmax)>H
r = 0.09;
s = 0.03;

A = r/(d_1*a);
B = s/(d_2*b);

subplot(1,2,2)
box on
title('$$\widehat{E}^*_4$$','Interpreter','latex');
hold on;
plot(P,phi_p_general(P,A,K,gamma,alpha,beta),'Color','#000000','LineWidth',1);
plot(psi_q_general(Q,H,B,beta,alpha),Q,'Color','#A2AEB9','LineWidth',1);
plot(0, 0, '.','Color','black','MarkerSize',15);
plot(K^(1-alpha), 0, '.','Color','#D81B60','MarkerSize',15);
plot(0,H^(1-beta), '.','Color','#1E88E5','MarkerSize',15);
plot(0.72, 2.08, '.','Color','#CC97DC','MarkerSize',15);text(-0.1,H^(1-beta)-0.05,'H^{1-\beta}','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K^(1-alpha)+0.1,-0.05,'K^{1-\alpha}','VerticalAlignment', 'top', 'HorizontalAlignment', 'right')
legend(['$$\widehat{\phi}(Q)$$';'$$\widehat{\psi}(Q)$$'],'Interpreter','latex','AutoUpdate','off')
axis equal
ylim([0 K^(1-beta)+0.5]);
xlim([0 H^(1-alpha)+0.5]);
set(gca, 'yticklabels', {'0','','','','','','6'});
set(gca,'XTickLabel',[]);

cd ..\Figures

saveas(gcf, 'nullclines', 'fig');
saveas(gcf, 'nullclines', 'epsc');

cd ..\fourth_case


