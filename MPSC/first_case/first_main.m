%----------------------------------------------------------------------------------------
% File: first_main.m
%
% Goal: plot the stable equilibrium points for the first case as well as
% the state space values and the state space for the bistability between
% $E_1$ and $E_2$ and $E_1^*$ and $E_2$
%
% Use: first_main()
%
% Input:
%
% Output: Figures 2, 3 and 4 in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù,
%         "A theoretical model of plant species competition: The case of
%         invasive Carpobrotus sp. pl. and native Mediterranean coastal
%         species", 2025
%
% Recalls: ode23t.m, trajectories_first.m, add_traj_to_bistability_first.m
%           ode_generalized_carpobrotus_first.m
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
function first_main()
clc
clear all
close all
currentCase = 'E_1_E_2_first';

% Parameter values
r = 0.1;
K = 20;
d_1 = 0.1;
a = 0.1;
s = 0.1;
H = 20;
d_2 = 0.1;
b = 0.1;

% Exponents
gamma = 1/3;

% Definition of A and B
A = r/(d_1*a);
B = s/(d_2*b);

% Solution ode
tspan = [0,1000];
options  =  odeset('RelTol',1e-8);
% first pair
x0 = [K-1,6]; %initial condition
[T_1, Y_1]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x0, options);
x1 = [15,16]; %initial condition
[T_2, Y_2]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x1, options);

% second pair
x2 = [10,2]; %initial condition
[T_3, Y_3]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x2, options);
x3 = [5,6]; %initial condition
[T_4, Y_4]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x3, options);

trajectories_first(r,K,d_1,a,s,H,d_2,b,gamma,T_1,Y_1,T_2,Y_2,currentCase);
add_traj_to_bistability_first(Y_1,Y_2,Y_3,Y_4,currentCase);

clc
clear all
close all

%%

currentCase = 'E_1_star_E_2_first';

% Parameter values
r = 0.3;
K = 20;
d_1 = 0.1;
a = 0.1;
s = 0.18;
H = 20;
d_2 = 0.1;
b = 0.1;

% Exponents
gamma = 1/3;

% Definition of A and B
A = r/(d_1*a);
B = s/(d_2*b);

B_min_0 = ((K*H)/(A*gamma))*((A*(gamma-1))/(H-A))^((gamma-1)/gamma);
B = B_min_0+4;
s = B*d_2*b;
% Solution ode
tspan = [0,1000];
options  =  odeset('RelTol',1e-8);
% first pair
x0 = [K-1,4]; %initial condition
[T_1, Y_1]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x0, options);
x1 = [15,16]; %initial condition
[T_2, Y_2]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x1, options);

% second pair
x2 = [10,2]; %initial condition
[T_3, Y_3]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x2, options);
x3 = [5,6]; %initial condition
[T_4, Y_4]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x3, options);

trajectories_first(r,K,d_1,a,s,H,d_2,b,gamma,T_1,Y_1,T_2,Y_2,currentCase);
add_traj_to_bistability_first(Y_1,Y_2,Y_3,Y_4,currentCase);

clc
clear all
close all

%%
currentCase = 'E_3_star_first';

% Parameter values
r = 0.3;
K = 20;
d_1 = 0.1;
a = 0.1;
s = 0.3;
H = 20;
d_2 = 0.1;
b = 0.1;

% Exponents
gamma = 1/3;

% Definition of A and B
A = r/(d_1*a);
B = s/(d_2*b);


% Solution ode
tspan = [0,1000];
options  =  odeset('RelTol',1e-8);
% first pair
x0 = [K-1,6]; %initial condition
[T_1, Y_1]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x0, options);
x1 = [15,16]; %initial condition
[T_2, Y_2]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x1, options);

% second pair
x2 = [10,2]; %initial condition
[T_3, Y_3]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x2, options);
x3 = [5,6]; %initial condition
[T_4, Y_4]  =  ode23t(@(t,y)  ode_generalized_carpobrotus_first(t,y,s,r,H,K,gamma,d_1,a,d_2,b,1,1), tspan, x3, options);

trajectories_first(r,K,d_1,a,s,H,d_2,b,gamma,T_1,Y_1,T_2,Y_2,currentCase);

%%
clc
clear all
close all

% Bar graph values plots

% Bistability E_1 and E_2

load('results_basinstability_first_1.mat')
figure;
b = bar([1:height(res_tab)-1],[res_tab.basinStability(1:end-1)], ...
    'FaceColor','flat', ...
    'EdgeColor',[0 0 0], ...
    'LineWidth',1.0); hold on;

b.CData(1,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
b.CData(2,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;

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
saveas(gcf, 'fig_basinstability_1', 'fig');
saveas(gcf, 'fig_basinstability_1', 'epsc');
cd(['..', filesep, 'first_case'])

%%
clc
clear all
close all
% Bistability E_1^* and E_2

load('results_basinstability_first_2.mat')
figure;
b = bar([1:height(res_tab)-1],[res_tab.basinStability(1:end-1)], ...
    'FaceColor','flat', ...
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
saveas(gcf, 'fig_basinstability_2', 'fig');
saveas(gcf, 'fig_basinstability_2', 'epsc');
cd(['..', filesep, 'first_case'])




