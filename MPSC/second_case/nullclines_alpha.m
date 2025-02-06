%----------------------------------------------------------------------------------------
% File: nullclines_alpha.m
%
% Goal: plot of the nullclines for the second case to highlight all the 
% possible cases of intersection between them.
%
% Use: nullclines_alpha()
%
% Input: 
%
% Output: Figure 5 in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù, 
%         "A theoretical model of plant species competition: The case of 
%         invasive Carpobrotus sp. pl. and native Mediterranean coastal 
%         species", 2025
%
% Recalls: psi_p.m, phi_p.m
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

function nullclines_alpha()

fprintf('Plot Figure 5');

K = 20;
d_1 = 0.1;
a = 0.1;
H = 20;
d_2 = 0.1;
b = 0.1;
alpha = 2/3;
gamma = 1/3;
P = linspace(0,2*K,1000);
figure;

% First plot: two points of intersection B > K^alpha and phi(Pmax)>H
r = 0.3;
s = 0.1;
A = r/(d_1*a);
B = s/(d_2*b);

subplot(1,2,1)
box on
title('$$\widetilde{E}^*_1 \land \widetilde{E}^*_2$$','Interpreter','latex');
hold on;
plot(P,phi_p(P,K,A,gamma,alpha),'Color','#000000','LineWidth',1);
plot(P,psi_p(P,H,B,alpha),'Color','#A2AEB9','LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
plot(K^(1-alpha), 0, '.','Color','#D81B60','MarkerSize',15);
plot(B^((1-alpha)/alpha), 0, '.','Color','black');
text(-0.1,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
% text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K^(1-alpha)-0.2,-0.2,'K^{1-\alpha}','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B^((1-alpha)/alpha)+0.2,-0.2,'B^{(1-\alpha)/\alpha}','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
legend(['$$\widetilde{\phi}(P)$$';'$$\widetilde{\psi}(P)$$'],'Interpreter','latex','AutoUpdate','off')
set(gca, 'yticklabels', {'0','','','','','','6'});
ylim([0 K+3]);
xlim([0 K^(1-alpha)+1]);
f1  =  @phi_p;
f2  =  @psi_p;
diff_f  =  @(x) f1(x,K,A,gamma,alpha)-f2(x,H,B,alpha);
x_intersect  =  fzero(diff_f, 1); % Initial guess of 0
y_intersect  =  f1(x_intersect,K,A,gamma,alpha);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#FFC107','MarkerSize',15);
f1  =  @phi_p;
f2  =  @psi_p;
diff_f  =  @(x) f1(x,K,A,gamma,alpha)-f2(x,H,B,alpha);
x_intersect  =  fzero(diff_f, 2); % Initial guess of 0
y_intersect  =  f1(x_intersect,K,A,gamma,alpha);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#FF905B','MarkerSize',15);
pbaspect([1.5 1 1]);
set(gca,'XTickLabel',[]);

% Second plot: one points of intersection B < K^alpha E_1_star
r = 0.3;
s = 0.04;
A = r/(d_1*a);
B = s/(d_2*b);
subplot(1,2,2)
box on
title('$$\widetilde{E}^*_3$$','Interpreter','latex');
hold on;
plot(P,phi_p(P,K,A,gamma,alpha),'Color','#000000','LineWidth',1);
plot(P,psi_p(P,H,B,alpha),'Color','#A2AEB9','LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
plot(K^(1-alpha), 0, '.','Color','#D81B60','MarkerSize',15);
plot(B^((1-alpha)/alpha), 0, '.','Color','black');
text(-0.1,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
% text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K^(1-alpha)+0.2,-0.2,'K^{1-\alpha}','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B^((1-alpha)/alpha)-0.2,-0.2,'B^{(1-\alpha)/\alpha}','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
legend(['$$\widetilde{\phi}(P)$$';'$$\widetilde{\psi}(P)$$'],'Interpreter','latex','AutoUpdate','off')
set(gca, 'yticklabels', {'0','','','','','','6'});
ylim([0 K+3]);
xlim([0 K^(1-alpha)+1]);
f1  =  @phi_p;
f2  =  @psi_p;
diff_f  =  @(x) f1(x,K,A,gamma,alpha)-f2(x,H,B,alpha);
x_intersect  =  fzero(diff_f, 1); % Initial guess of 0
y_intersect  =  f1(x_intersect,K,A,gamma,alpha);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#00E0BA','MarkerSize',15);
pbaspect([1.5 1 1]);
set(gca,'XTickLabel',[]);

cd ..\Figures

saveas(gcf, 'nullclines_second', 'fig');
saveas(gcf, 'nullclines_second', 'epsc');

cd ..\second_case

