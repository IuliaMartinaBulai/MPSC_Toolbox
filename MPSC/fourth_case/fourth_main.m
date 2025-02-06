%----------------------------------------------------------------------------------------
% File: fourth_main.m
%
% Goal: plot the stable equilibrium points for the first case as well as
% the state space values and the state space for the bistability between
% $\hat{E_1}$ and $\hat{E_2}$ and $\hat{E_1}$, $\hat{E_2}$ and $\hat{E_3}^*$
%
% Use: fourth_main()
%
% Input:
%
% Output: Figures 14, 15 and 16 in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù,
%         "A theoretical model of plant species competition: The case of
%         invasive Carpobrotus sp. pl. and native Mediterranean coastal
%         species", 2025
%
% Recalls: ode23t.m, trajectories_fourth.m, add_traj_to_bistability_fourth.m
%           ode_generalized_carpobrotus_fourth.m
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

function fourth_main()

clc
clear all
close all

currentCase = 'E_1_E_2_E_3_star_fourth';

% Parameter values
r = 0.08;
K = 10;
d_1 = 0.1;
a = 0.1;
s = 0.04;
H = 10;
d_2 = 0.1;
b = 0.1;

% Exponents
alpha=2/3;
beta=2/3;
gamma=1/3;

% Definition of A and B
A=r/(d_1*a);
B=s/(d_2*b);

% Solution ode
tspan=[0,5000];
options = odeset('RelTol',1e-8);

%first triplet
x0=[0.7,9]; %initial condition
[T_1, Y_1] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x0, options);
x1=[9,1]; %initial condition
[T_2, Y_2] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x1, options);
x2=[8,4]; %initial condition
[T_3, Y_3] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x2, options);

%second triplet
x3=[0.2,5]; %initial condition
[T_4, Y_4] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x3, options);
x4=[5,0.3]; %initial condition
[T_5, Y_5] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x4, options);
x5=[2,2]; %initial condition
[T_6, Y_6] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x5, options);


trajectories_fourth(r,K,d_1,a,s,H,d_2,b,alpha,beta,gamma,T_1,Y_1,T_2,Y_2,T_3,Y_3,currentCase);
add_traj_to_bistability_fourth(Y_1,Y_2,Y_3,Y_4,Y_5,Y_6,currentCase);

clc
clear all
close all

%%

currentCase = 'E_1_E_2_fourth';

% Parameter values
r = 0.07;
K = 10;
d_1 = 0.1;
a = 0.1;
s = 0.03;
H = 10;
d_2 = 0.1;
b = 0.1;

% Exponents
alpha=2/3;
beta=2/3;
gamma=1/3;

% Definition of A and B
A=r/(d_1*a);
B=s/(d_2*b);

% Solution ode
tspan=[0,5000];
options = odeset('RelTol',1e-8);

%first pair
x0=[1,2]; %initial condition
[T_1, Y_1] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x0, options);
x1=[4,1]; %initial condition
[T_2, Y_2] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x1, options);

%second pair
x3=[8,9]; %initial condition
[T_3, Y_3] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x3, options);
x4=[9,4]; %initial condition
[T_4, Y_4] = ode23t(@(t,y) ode_generalized_carpobrotus_fourth(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta), tspan, x4, options);

trajectories_fourth(r,K,d_1,a,s,H,d_2,b,alpha,beta,gamma,T_1,Y_1,T_2,Y_2,T_3,Y_3,currentCase);
add_traj_to_bistability_fourth(Y_1,Y_2,Y_3,Y_4,'','',currentCase);


%%
clc
clear all
close all

% Bar graph values plots

% Bistability $\hat{E_1}$, $\hat{E_2}$ and $\hat{E_3}^*$

load('results_basinstability_fourth_1.mat')
figure;
b = bar([1:height(res_tab)-1],[res_tab.basinStability(1:end-1)], ...
    'FaceColor','flat', ...
    'EdgeColor',[0 0 0], ...
    'LineWidth',1.0); hold on;

b.CData(1,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
b.CData(2,:) = sscanf('#00E0BA', '#%2x%2x%2x') / 255;
b.CData(3,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;

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
saveas(gcf, 'fig_basinstability_7', 'fig');
saveas(gcf, 'fig_basinstability_7', 'epsc');
cd(['..', filesep, 'fourth_case'])

%%
clc
clear all
close all
% Bistability $\hat{E_1}$ and $\hat{E_2}$

load('results_basinstability_fourth_2.mat')
figure;
b = bar([1:height(res_tab)-1],[res_tab.basinStability(1:2,:)], ...
    'FaceColor', 'flat', ...  %
    'EdgeColor',[0 0 0], ...
    'LineWidth',1.0); hold on;

b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;

xtips1 = b.XData;
ytips1 = b.YData;
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
saveas(gcf, 'fig_basinstability_8', 'fig');
saveas(gcf, 'fig_basinstability_8', 'epsc');
cd(['..', filesep, 'fourth_case'])