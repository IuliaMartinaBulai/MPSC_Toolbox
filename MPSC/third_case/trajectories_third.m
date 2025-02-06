% File: trajectories_third.m
%
% Goal: represent the trajectories over time of both Carpobrotus and the
% Native plants, to show that there exist actually initial conditions
% that lead to the equilibrium points
%
% Use: trajectories_third(r,K,d_1,a,s,H,d_2,b,beta,gamma,T_1,Y_1,T_2,Y_2,currentCase)
%
% Input: r,K,d_1,a,s,H,d_2,b,gamma - model parameters
%        T_1, T_2 - integration times
%        Y_1, Y_2 - solutions of the first case ODE system
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
function trajectories_third(r,K,d_1,a,s,H,d_2,b,beta,gamma,T_1,Y_1,T_2,Y_2,currentCase)

% E_1 and E_2_third
if strcmp('E_1_E_2_third',currentCase)

    % E_1_third
    fig1 = figure;
    sgtitle('$$\overline{E}_1$$','Interpreter','latex');
    hold on
    box on
    subplot(2,1,1)
    plot(T_1,Y_1(:,1),'k-','LineWidth',2)
    ylabel('Carpobrotus')
    xlabel('Time')
    xlim([0,500]);
    ylim([0,K+2]);
    set(gca,'FontSize',7)
    subplot(2,1,2)
    plot(T_1,Y_1(:,2),'k-','LineWidth',2)
    ylabel('Native')
    xlabel('Time')
    xlim([0,500]);
    ylim([0,H+2]);
    set(fig1,'Position',[100,100,150,200]);
    set(gca,'FontSize',7)
    cd(['..', filesep, 'Figures'])
    saveas(gcf, 'E_1_third', 'fig');
    saveas(gcf, 'E_1_third', 'epsc');
    hold off;
    cd(['..', filesep, 'third_case'])

elseif strcmp('E_1_star_E_2_third',currentCase)
    fig3 = figure;
    sgtitle('$$\overline{E}_1^*$$','Interpreter','latex');
    hold on
    box on
    subplot(2,1,1)
    plot(T_1,Y_1(:,1),'k-','LineWidth',2)
    ylabel('Carpobrotus')
    xlabel('Time')
    xlim([0,500]);
    ylim([0,K+2]);
    set(gca,'FontSize',7)
    subplot(2,1,2)
    plot(T_1,Y_1(:,2),'k-','LineWidth',2)
    ylabel('Native')
    xlabel('Time')
    xlim([0,500]);
    ylim([0,H+2]);
    set(fig3,'Position',[100,100,150,200]);
    set(gca,'FontSize',7)
    cd(['..', filesep, 'Figures'])
    saveas(gcf, 'E_1_star_third', 'fig');
    saveas(gcf, 'E_1_star_third', 'epsc');
    hold off;
    cd(['..', filesep, 'third_case'])

    % E_2_third
    fig2 = figure;
    sgtitle('$$\overline{E}_2$$','Interpreter','latex');
    hold on
    box on
    subplot(2,1,1)
    plot(T_2,Y_2(:,1),'k-','LineWidth',2)
    ylabel('Carpobrotus')
    xlabel('Time')
    xlim([0,500]);
    ylim([0,K+2]);
    set(gca,'FontSize',7)
    subplot(2,1,2)
    plot(T_2,Y_2(:,2),'k-','LineWidth',2)
    ylabel('Native')
    xlabel('Time')
    xlim([0,500]);
    ylim([0,H+2]);
    set(fig2,'Position',[250,100,150,200]);
    set(gca,'FontSize',7)
    cd(['..', filesep, 'Figures'])
    saveas(gcf, 'E_2_third', 'fig');
    saveas(gcf, 'E_2_third', 'epsc');
    hold off;
    cd(['..', filesep, 'third_case'])
end