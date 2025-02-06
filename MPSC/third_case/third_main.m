%----------------------------------------------------------------------------------------
% File: third_main.m
%
% Goal: plot the stable equilibrium points for the third case as well as
% the state space values and the state space for the bistability between
% $\bar{E_1}$ and $\bar{E_2}$ and $\bar{E_1}^*$ and $\bar{E_2}$
%
% Use: third_main()
%
% Input:
%
% Output: Figures 10, 11 and 12 in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù,
%         "A theoretical model of plant species competition: The case of
%         invasive Carpobrotus sp. pl. and native Mediterranean coastal
%         species", 2025
%
% Recalls: ode23t.m, trajectories_third.m, add_traj_to_bistability_third.m
%           ode_generalized_carpobrotus_third.m
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
% Date last modified: February, 2025
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
function third_main()

currentCase = 'E_1_E_2_third';

% Setting the parameters
r = 0.05;
K = 20;
d_1 = 0.1;
a = 0.1;
s = 0.1;
H = 20;
d_2 = 0.1;
b = 0.1;

% Exponents
beta = 2/3;
gamma = 1/3;

% Definition of A and B
A = r/(d_1*a);
B = s/(d_2*b);

% Solution ode
tspan = [0,1000];
options = odeset('RelTol',1e-8);
x0 = [5,5]; %initial condition
[T_1, Y_1] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x0, options);
x1=[12,0.6]; %initial condition
[T_2, Y_2] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x1, options);

%second pair
x2=[15,15]; %initial condition
[T_3, Y_3] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x2, options);
x3=[19,1.5]; %initial condition
[T_4, Y_4] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x3, options);


trajectories_third(r,K,d_1,a,s,H,d_2,b,beta,gamma,T_1,Y_1,T_2,Y_2,currentCase);
add_traj_to_bistability_third(Y_1,Y_2,Y_3,Y_4,currentCase);

%%
clc
clear all
close all
currentCase = 'E_1_star_E_2_third';

% Setting the parameters
r = 0.3;
K = 20;
d_1 = 0.1;
a = 0.1;
s = 0.15;
H = 20;
d_2 = 0.1;
b = 0.1;

% Exponents
beta = 2/3;
gamma = 1/3;

% Definition of A and B
A = r/(d_1*a);
B = s/(d_2*b);

% Solution ode
tspan = [0,1000];
options = odeset('RelTol',1e-8);
x0 = [6,6]; %initial condition
[T_1, Y_1] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x0, options);
x1 = [12,0.6]; %initial condition
[T_2, Y_2] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x1, options);

%second pair
x2 = [15,15]; %initial condition
[T_3, Y_3] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x2, options);
x3 = [19,1.5]; %initial condition
[T_4, Y_4] = ode23t(@(t,y) ode_generalized_carpobrotus_third(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,beta), tspan, x3, options);


trajectories_third(r,K,d_1,a,s,H,d_2,b,beta,gamma,T_1,Y_1,T_2,Y_2,currentCase);
add_traj_to_bistability_third(Y_1,Y_2,Y_3,Y_4,currentCase);

%%
clc
clear all
close all

% Bar graph values plots

% Bistability \bar{E_2} and \bar{E_1^*}

load('results_basinstability_third_1.mat')
figure;
b = bar([1:height(res_tab)-1],[res_tab.basinStability(1:2,:)], ...
    'FaceColor', 'flat', ...  %
    'EdgeColor',[0 0 0], ...
    'LineWidth',1.0); hold on;

b.CData(1,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
b.CData(2,:) = sscanf('#FFC107', '#%2x%2x%2x') / 255;

xtips1 = b.XData;
ytips1 = b.YData;
res_tab(1,1) = {'Native-free'};
labels1 = string(round(b(1).YData,2));
text(xtips1,ytips1,labels1, ...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom');

set(gca, 'Xticklabel', cellstr(res_tab.label));
ylim([-0.1, 1.1]);
ylabel('Basin stability value'); xlabel('');
cd(['..', filesep, 'Figures'])
set(gca,'FontSize',15)
saveas(gcf, 'fig_basinstability_5', 'fig');
saveas(gcf, 'fig_basinstability_5', 'epsc');
cd(['..', filesep, 'third_case'])

%%
clc
clear all
close all
% Bistability \bar{E_1} and \bar{E_2}

load('results_basinstability_third_2.mat')
figure;
b = bar([1:height(res_tab)-1],[res_tab.basinStability(1:2,:)], ...
    'FaceColor', 'flat', ...  %
    'EdgeColor',[0 0 0], ...
    'LineWidth',1.0); hold on;

b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;

xtips1 = b.XData;
ytips1 = b.YData;
%res_tab(1,1) = {'Carpobrotus-free'};
res_tab(2,1) = {'Native-free'};
labels1 = string(round(b(1).YData,2));
text(xtips1,ytips1,labels1, ...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom');

set(gca, 'Xticklabel', cellstr(res_tab.label));
ylim([-0.1, 1.1]);
ylabel('Basin stability value'); xlabel('');
cd(['..', filesep, 'Figures'])
set(gca,'FontSize',15)
saveas(gcf, 'fig_basinstability_6', 'fig');
saveas(gcf, 'fig_basinstability_6', 'epsc');
cd(['..', filesep, 'third_case'])