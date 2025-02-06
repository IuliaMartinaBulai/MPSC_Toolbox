% File: add_traj_to_bistability_second.m
%
% Goal: This function adds to the bistability plot the trajectories of two
% initial conditions: one that goes to the first equilibrium point and one
% that goes to the second. Notice that the initial condition is represented
% by an empty point, while the equilibrium point is a filled marker.
%
% Use: add_traj_to_bistability_second(Y_1,Y_2,Y_3,Y_4,currentCase)
%
% Input: Y_1,Y_2,Y_3,Y_4 - solutions of the first case ODE system
%        currentCase - string value
%
% Output: 
%
% Recalls:
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

function add_traj_to_bistability_second(Y_1,Y_2,Y_3,Y_4,currentCase)

% Bistability E_1_second and E_2_star_second

if strcmp('E_1_E_2_star_second',currentCase)
    openfig('fig_statespace_3.fig')
    hold on
    legend('AutoUpdate','off' )
    %first pair
    plot(Y_1(:,1),Y_1(:,2),'Color','#1E88E5','LineWidth',2);
    plot(Y_1(1,1),Y_1(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#1E88E5','MarkerSize',10,'LineWidth',2);
    plot(Y_1(end,1),Y_1(end,2),'o','MarkerFaceColor','#1E88E5','MarkerEdgeColor','#1E88E5','MarkerSize',10);
    plot(Y_2(:,1),Y_2(:,2),'Color','#FF905B','LineWidth',2);
    plot(Y_2(1,1),Y_2(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#FF905B','MarkerSize',10,'LineWidth',2);
    plot(Y_2(end,1),Y_2(end,2),'o','MarkerFaceColor','#FF905B','MarkerEdgeColor','#FF905B','MarkerSize',10);
    % %second pair
    plot(Y_3(:,1),Y_3(:,2),'Color','#1E88E5','LineWidth',2);
    plot(Y_3(1,1),Y_3(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#1E88E5','MarkerSize',10,'LineWidth',2);
    plot(Y_3(end,1),Y_3(end,2),'o','MarkerFaceColor','#1E88E5','MarkerEdgeColor','#1E88E5','MarkerSize',10);
    plot(Y_4(:,1),Y_4(:,2),'Color','#FF905B','LineWidth',2);
    plot(Y_4(1,1),Y_4(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#FF905B','MarkerSize',10,'LineWidth',2);
    plot(Y_4(end,1),Y_4(end,2),'o','MarkerFaceColor','#FF905B','MarkerEdgeColor','#FF905B','MarkerSize',10);
    ylim([0 20]);
    xlim([0 20]);
    text(Y_1(end,1)-1,Y_1(end,2)+1,'$$\mathbf{\widetilde{E}_1}$$','Interpreter','latex','FontSize',17)
    text(Y_2(end,1)+0.5,Y_2(end,2),'$$\mathbf{\widetilde{E}^*_2}$$','Interpreter','latex','FontSize',17)
    ylabel('Native')
    hold off
    cd(['..', filesep, 'Figures'])
    set(gca,'FontSize',15)
    saveas(gcf, 'fig_statespace_with_traj_3', 'fig');
    saveas(gcf, 'fig_statespace_with_traj_3', 'epsc');
    cd(['..', filesep, 'second_case'])

elseif strcmp('E_1_E_2_second',currentCase)

    % Bistability E_1_second and E_2_second
    openfig('fig_statespace_4.fig')
    hold on
    legend('AutoUpdate','off' )
    %first pair
    plot(Y_1(:,1),Y_1(:,2),'Color','#1E88E5','LineWidth',2);
    plot(Y_1(1,1),Y_1(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#1E88E5','MarkerSize',10,'LineWidth',2);
    plot(Y_1(end,1),Y_1(end,2),'o','MarkerFaceColor','#1E88E5','MarkerEdgeColor','#1E88E5','MarkerSize',10);
    plot(Y_2(:,1),Y_2(:,2),'Color','#D81B60','LineWidth',2);
    plot(Y_2(1,1),Y_2(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#D81B60','MarkerSize',10,'LineWidth',2);
    plot(Y_2(end,1),Y_2(end,2),'o','MarkerFaceColor','#D81B60','MarkerEdgeColor','#D81B60','MarkerSize',10);
    %second pair
    plot(Y_3(:,1),Y_3(:,2),'Color','#1E88E5','LineWidth',2);
    plot(Y_3(1,1),Y_3(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#1E88E5','MarkerSize',10,'LineWidth',2);
    plot(Y_3(end,1),Y_3(end,2),'o','MarkerFaceColor','#1E88E5','MarkerEdgeColor','#1E88E5','MarkerSize',10);
    plot(Y_4(:,1),Y_4(:,2),'Color','#D81B60','LineWidth',2);
    plot(Y_4(1,1),Y_4(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#D81B60','MarkerSize',10,'LineWidth',2);
    plot(Y_4(end,1),Y_4(end,2),'o','MarkerFaceColor','#D81B60','MarkerEdgeColor','#D81B60','MarkerSize',10);
    ylim([0 20]);
    xlim([0 20]);
    text(Y_1(end,1)-1,Y_1(end,2)+1,'$$\mathbf{\widetilde{E}_1}$$','Interpreter','latex','FontSize',17)
    text(Y_2(end,1)+0.5,Y_2(end,2)-1,'$$\mathbf{\widetilde{E}_2}$$','Interpreter','latex','FontSize',17)
    ylabel('Native')
    hold off
    cd(['..', filesep, 'Figures'])
    set(gca,'FontSize',15)
    saveas(gcf, 'fig_statespace_with_traj_4', 'fig');
    saveas(gcf, 'fig_statespace_with_traj_4', 'epsc');
    cd(['..', filesep, 'second_case'])
end