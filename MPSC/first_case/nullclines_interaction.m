%----------------------------------------------------------------------------------------
% File: nullclines_interaction.m
%
% Goal: plot of the nullclines for the second case to highlight all the
% possible cases of intersection between them.
%
% Use: nullclines_interaction()
%
% Input:
%
% Output: Figure 1 in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù,
%         "A theoretical model of plant species competition: The case of
%         invasive Carpobrotus sp. pl. and native Mediterranean coastal
%         species", 2025
%
% Recalls: null_C.m, null_L.m
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
function nullclines_interaction()

% clc
% clear
% close all

fprintf('Plot Figure 1');

% Setting the parameters
r = 2;
K = 5;
d_1 = 1;
a = 1;

s = 1;
H = 3;
d_2 = 1;
b = 1;

% Exponents
gamma = 1/2;

% Definition of A and B
A = r/(d_1*a);
B = s/(d_2*b);

C = linspace(0,3*K,1000);

figure;

% First plot: one point of intersection H < A, K < B
r = 5;
K = 3;
s = 4.5;
H = 3;

A = r/(d_1*a);
B = s/(d_2*b);

subplot(2,3,4)
title('(d)', 'FontSize', 12, 'Position', [3, -1.5]);
box on
subtitle('$${E}^*_3$$','Interpreter','latex');
hold on;
plot(C,null_C(C,r,K,gamma,d_1,a),'Color','#000000', 'LineWidth',1);
plot(C,null_L(C,s,H,d_2,b), 'Color', '#A2AEB9', 'LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(K, 0, '.','Color','#D81B60','MarkerSize',15);
plot(B, 0, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
text(-0.2,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K,-0.2,'K','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B,-0.2,'B','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
set(gca, 'xticklabels', {'0','','','6'});
set(gca, 'yticklabels', {'0','','','','','','6'});
legend(['$$\phi(C)$$';'$$\psi(C)$$'],'Interpreter','latex','AutoUpdate','off')
axis equal;
ylim([0 6]);
xlim([0 6]);
f1  =  @null_C;
f2  =  @null_L;
diff_f  =  @(x) f1(x,r,K,gamma,d_1,a)-f2(x,s,H,d_2,b);
x_intersect  =  fzero(diff_f, 1); % Initial guess of 0
y_intersect  =  f1(x_intersect,r,K,gamma,d_1,a);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#00E0BA','MarkerSize',15);

% Second plot: one point of intersection H > A, K > B
r = 4;
K = 4;
s = 3;
H = 5;

A = r/(d_1*a);
B = s/(d_2*b);

subplot(2,3,5)
title('(e)', 'FontSize', 12, 'Position', [3, -1.5]);
box on
subtitle('$${E}^*_4$$','Interpreter','latex');
hold on;
plot(C,null_C(C,r,K,gamma,d_1,a),'Color','#000000', 'LineWidth',1);
plot(C,null_L(C,s,H,d_2,b), 'Color', '#A2AEB9', 'LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(K, 0, '.','Color','#D81B60','MarkerSize',15);
plot(B, 0, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
text(-0.2,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K,-0.2,'K','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B,-0.2,'B','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
set(gca, 'xticklabels', {'0','','','6'});
set(gca, 'yticklabels', {'0','','','','','','6'});
legend(['$$\phi(C)$$';'$$\psi(C)$$'],'Interpreter','latex','AutoUpdate','off')
axis equal;
ylim([0 6]);
xlim([0 6]);
f1  =  @null_C;
f2  =  @null_L;
diff_f  =  @(x) f1(x,r,K,gamma,d_1,a)-f2(x,s,H,d_2,b);
x_intersect  =  fzero(diff_f, B-1); % Initial guess of 0
y_intersect  =  f1(x_intersect,r,K,gamma,d_1,a);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#CC97DC','MarkerSize',15);

% Third plot: zero points of intersection H > A, K < B
r = 2;
K = 3;
s = 4;
H = 4;

A = r/(d_1*a);
B = s/(d_2*b);
subplot(2,3,6)
title('(f)', 'FontSize', 12, 'Position', [3, -1.5]);
box on
subtitle('No points of intersection','Interpreter','latex');
hold on;
plot(C,null_C(C,r,K,gamma,d_1,a),'Color','#000000', 'LineWidth',1);
plot(C,null_L(C,s,H,d_2,b), 'Color', '#A2AEB9', 'LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(K, 0, '.','Color','#D81B60','MarkerSize',15);
plot(B, 0, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
text(-0.2,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K,-0.2,'K','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B,-0.2,'B','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
set(gca, 'xticklabels', {'0','','','6'});
set(gca, 'yticklabels', {'0','','','','','','6'});
legend(['$$\phi(C)$$';'$$\psi(C)$$'],'Interpreter','latex')
axis equal;
ylim([0 6]);
xlim([0 6]);

% Fourth plot: zero points of intersection H < A, K > B, B < B_0
r = 4;
K = 3;
H = 2;
A = r/(d_1*a);
B_min_0 = ((K*H)/(A*gamma))*((A*(gamma-1))/(H-A))^((gamma-1)/gamma);
s = B_min_0 - 0.5;
B = s/(d_2*b);
subplot(2,3,1)
title('(a)', 'FontSize', 12, 'Position', [3, -1.5]);
box on
subtitle('No points of intersection','Interpreter','latex');
hold on;
plot(C,null_C(C,r,K,gamma,d_1,a),'Color','#000000', 'LineWidth',1);
plot(C,null_L(C,s,H,d_2,b), 'Color', '#A2AEB9', 'LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(K, 0, '.','Color','#D81B60','MarkerSize',15);
plot(B, 0, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
text(-0.2,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K,-0.2,'K','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B,-0.2,'B','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
set(gca, 'xticklabels', {'0','','','6'});
set(gca, 'yticklabels', {'0','','','','','','6'});
legend(['$$\phi(C)$$';'$$\psi(C)$$'],'Interpreter','latex')
axis equal;
ylim([0 6]);
xlim([0 6]);

% Fifth plot: one (saddle) point of intersection H < A, K > B, B  =  B_0
r = 4;
K = 5;
H = 3;
A = r/(d_1*a);
B_min_0 = ((K*H)/(A*gamma))*((A*(gamma-1))/(H-A))^((gamma-1)/gamma);
s = B_min_0;
B = s/(d_2*b);
subplot(2,3,2)
title('(b)', 'FontSize', 12, 'Position', [3, -1.5]);
box on
subtitle('$$E^*$$','Interpreter','latex');
hold on;
plot(C,null_C(C,r,K,gamma,d_1,a),'Color','#000000', 'LineWidth',1);
plot(C,null_L(C,s,H,d_2,b), 'Color', '#A2AEB9', 'LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(K, 0, '.','Color','#D81B60','MarkerSize',15);
plot(B, 0, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
text(-0.2,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K,-0.2,'K','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B,-0.2,'B','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
set(gca, 'xticklabels', {'0','','','6'});
set(gca, 'yticklabels', {'0','','','','','','6'});
legend(['$$\phi(C)$$';'$$\psi(C)$$'],'Interpreter','latex')
axis equal;
ylim([0 6]);
xlim([0 6]);

% Sixth plot: one (saddle) point of intersection H < A, K > B, B > B_0
r = 4;
K = 5;
H = 3;
A = r/(d_1*a);
B_min_0 = ((K*H)/(A*gamma))*((A*(gamma-1))/(H-A))^((gamma-1)/gamma);
s = B_min_0+0.8;
B = s/(d_2*b);
subplot(2,3,3)
title('(c)', 'FontSize', 12, 'Position', [3, -1.5]);
box on
subtitle('$$E^*_1$$ and $$E^*_2$$','Interpreter','latex');
hold on;
plot(C,null_C(C,r,K,gamma,d_1,a),'Color','#000000', 'LineWidth',1);
plot(C,null_L(C,s,H,d_2,b), 'Color', '#A2AEB9', 'LineWidth',1);
plot(0, H, '.','Color','#1E88E5','MarkerSize',15);
plot(0, A, '.','Color','black');
plot(K, 0, '.','Color','#D81B60','MarkerSize',15);
plot(B, 0, '.','Color','black');
plot(0, 0, '.','Color','black','MarkerSize',15);
text(-0.2,H,'H','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(-0.2,A,'A','VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right')
text(K,-0.2,'K','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
text(B,-0.2,'B','VerticalAlignment', 'top', 'HorizontalAlignment', 'center')
set(gca, 'xticklabels', {'0','','','6'});
set(gca, 'yticklabels', {'0','','','','','','6'});
legend(['$$\phi(C)$$';'$$\psi(C)$$'],'Interpreter','latex','AutoUpdate','off')
axis equal;
ylim([0 6]);
xlim([0 6]);
f1  =  @null_C;
f2  =  @null_L;
diff_f  =  @(x) f1(x,r,K,gamma,d_1,a)-f2(x,s,H,d_2,b);
x_intersect  =  fzero(diff_f, 1); % Initial guess of 0
y_intersect  =  f1(x_intersect,r,K,gamma,d_1,a);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#FFC107','MarkerSize',15);
diff_f  =  @(x) f1(x,r,K,gamma,d_1,a)-f2(x,s,H,d_2,b);
x_intersect  =  fzero(diff_f, B-1); % Initial guess of 0
y_intersect  =  f1(x_intersect,r,K,gamma,d_1,a);  % Compute the corresponding y value
plot(x_intersect, y_intersect, '.','Color','#FF905B','MarkerSize',15);

cd ..\Figures
saveas(gcf, 'interaction_first_case', 'fig');
saveas(gcf, 'interaction_first_case', 'epsc');

cd ..\first_case

