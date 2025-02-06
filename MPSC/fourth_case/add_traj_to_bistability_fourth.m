% File: add_traj_to_bistability_fourth.m
%
% Goal: This function adds to the bistability plot the trajectories of two
% initial conditions: one that goes to the first equilibrium point and one
% that goes to the second. Notice that the initial condition is represented
% by an empty point, while the equilibrium point is a filled marker.
%
% Use: add_traj_to_bistability_fourth(Y_1,Y_2,Y_3,Y_4,Y_5,Y_6,currentCase)
%
% Input: Y_1,Y_2,Y_3,Y_4,Y_5,Y_6 - solutions of the fourth case ODE system
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

function add_traj_to_bistability(Y_1,Y_2,Y_3,Y_4,Y_5,Y_6,currentCase)

% Tristability E_1, E_2 and E_3_star fourth

if strcmp('E_1_E_2_E_3_star_fourth', currentCase)
    openfig('fig_statespace_7.fig')
    hold on

    legend('AutoUpdate','off' )

    %first triplet
    plot(Y_1(:,1),Y_1(:,2),'Color','#1E88E5','LineWidth',2);
    plot(Y_1(1,1),Y_1(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#1E88E5','MarkerSize',10,'LineWidth',2);
    plot(Y_1(end,1),Y_1(end,2),'o','MarkerFaceColor','#1E88E5','MarkerEdgeColor','#1E88E5','MarkerSize',10);
    plot(Y_2(:,1),Y_2(:,2),'Color','#D81B60','LineWidth',2);
    plot(Y_2(1,1),Y_2(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#D81B60','MarkerSize',10,'LineWidth',2);
    plot(Y_2(end,1),Y_2(end,2),'o','MarkerFaceColor','#D81B60','MarkerEdgeColor','#D81B60','MarkerSize',10);
    plot(Y_3(:,1),Y_3(:,2),'Color','#00E0BA','LineWidth',2);
    plot(Y_3(1,1),Y_3(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#00E0BA','MarkerSize',10,'LineWidth',2);
    plot(Y_3(end,1),Y_3(end,2),'o','MarkerFaceColor','#00E0BA','MarkerEdgeColor','#00E0BA','MarkerSize',10);

    %second triplet
    plot(Y_4(:,1),Y_4(:,2),'Color','#1E88E5','LineWidth',2);
    plot(Y_4(1,1),Y_4(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#1E88E5','MarkerSize',10,'LineWidth',2);
    plot(Y_4(end,1),Y_4(end,2),'o','MarkerFaceColor','#1E88E5','MarkerEdgeColor','#1E88E5','MarkerSize',10);
    plot(Y_5(:,1),Y_5(:,2),'Color','#D81B60','LineWidth',2);
    plot(Y_5(1,1),Y_5(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#D81B60','MarkerSize',10,'LineWidth',2);
    plot(Y_5(end,1),Y_5(end,2),'o','MarkerFaceColor','#D81B60','MarkerEdgeColor','#D81B60','MarkerSize',10);
    plot(Y_6(:,1),Y_6(:,2),'Color','#00E0BA','LineWidth',2);
    plot(Y_6(1,1),Y_6(1,2),'o','MarkerFaceColor','white','MarkerEdgeColor','#00E0BA','MarkerSize',10,'LineWidth',2);
    plot(Y_6(end,1),Y_6(end,2),'o','MarkerFaceColor','#00E0BA','MarkerEdgeColor','#00E0BA','MarkerSize',10);
    ylim([0 10]);
    xlim([0 10]);
    text(Y_5(end,1),Y_5(end,2)+0.1,'$$\mathbf{\widehat{E}_2}$$','Interpreter','latex','FontSize',17)
    text(Y_1(end,1)+0.1,Y_1(end,2),'$$\mathbf{\widehat{E}_1}$$','Interpreter','latex','FontSize',17)
    text(Y_3(end,1)+0.1,Y_3(end,2),'$$\mathbf{\widehat{E}^*_3}$$','Interpreter','latex','FontSize',17)
    ylabel('Native')
    set(gca,'FontSize',15)
    cd(['..', filesep, 'Figures'])
    saveas(gcf, 'fig_statespace_with_traj_7', 'fig');
    saveas(gcf, 'fig_statespace_with_traj_7', 'epsc');
    cd(['..', filesep, 'fourth_case'])

% Bistability E_1 and E_2 fourth
elseif strcmp('E_1_E_2_fourth', currentCase)

    openfig('fig_statespace_8.fig')
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
    ylim([0 10]);
    xlim([0 10]);
    text(Y_4(end,1)+0.1,Y_4(end,2),'$$\mathbf{\widehat{E}_2}$$','Interpreter','latex','FontSize',17)
    text(Y_3(end,1)+0.1,Y_3(end,2),'$$\mathbf{\widehat{E}_1}$$','Interpreter','latex','FontSize',17)
    legend('$$\mathbf{\widehat{E}_1}$$','$$\mathbf{\widehat{E}_2}$$')
    set(gca,'FontSize',15)
    cd(['..', filesep, 'Figures'])
    saveas(gcf, 'fig_statespace_with_traj_8', 'fig');
    saveas(gcf, 'fig_statespace_with_traj_8', 'epsc');
    cd(['..', filesep, 'fourth_case'])
end