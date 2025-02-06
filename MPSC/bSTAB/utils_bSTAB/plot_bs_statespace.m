%----------------------------------------------------------------------------------------
% File: plot_bs_statespace.m 
%
% Goal: plots the state space as sampled with class labels
%
% Use: plot_bs_statespace(props, res_detail, idx_state1, idx_state2, idx_state3)
%
% Input: - props: properties structure
%        - res_detail: cell array as returned by compute_bs
%        - idx_state1: first state to plot (index)
%        - idx_state2: second state to plot (index)
%
% Output: creates a new figure
%
% Recalls: creates a new figure
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
function plot_bs_statespace(props, res_detail, idx_state1, idx_state2, idx_state3)
% plot_bs_statespace(props, res_detail, state1, state2)

Y0 = cell2mat(res_detail(:,1));

if strcmp('first_case',props.currentCase)
    [props] = setup_carpobrotus_first(props);
    L = table2array(cell2table(res_detail(:,2)));
    if strcmp('E_1_E_2_first', props.currentSubcase)
        colors = ['#1E88E5';'#D81B60'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$E_1$$','$$E_2$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_1'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_1']);
    elseif strcmp('E_1_star_E_2_first', props.currentSubcase)
        colors = ['#FFC107';'#D81B60'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$E_1^*$$','$$E_2$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_2'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_2']);
    end
elseif strcmp('second_case',props.currentCase)
    [props] = setup_carpobrotus_second(props);
    L = table2array(cell2table(res_detail(:,2)));
    if strcmp('E_1_E_2_second', props.currentSubcase)
        colors = ['#1E88E5';'#D81B60'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$\widetilde{E}_1$$','$$\widetilde{E_2}$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_4'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_4']);
    elseif strcmp('E_1_E_2_star_second', props.currentSubcase)
        colors = ['#1E88E5';'#FF905B'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$\widetilde{E_1}$$','$$\widetilde{E_2}^*$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_3'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_3']);
    end
elseif strcmp('third_case',props.currentCase)
    [props] = setup_carpobrotus_third(props);
    L = table2array(cell2table(res_detail(:,2)));
    if strcmp('E_1_E_2_third', props.currentSubcase)
        colors = ['#1E88E5';'#D81B60'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$\overline{E_1}$$','$$\overline{E_2}$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_5'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_5']);
    elseif strcmp('E_1_star_E_2_third', props.currentSubcase)
        colors = ['#FFC107';'#D81B60'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$\overline{E_1^*}$$','$$\overline{E_2}$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_6'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_6']);
    end
elseif strcmp('fourth_case',props.currentCase)
    [props] = setup_carpobrotus_fourth(props);
    L = table2array(cell2table(res_detail(:,2)));
    if strcmp('E_1_E_2_fourth', props.currentSubcase)
        colors = ['#1E88E5';'#D81B60'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$\widehat{E_1}$$','$$\widehat{E_2}$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_8'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_8']);
    elseif strcmp('E_1_E_2_E_3_star_fourth', props.currentSubcase)
        colors = ['#1E88E5';'#D81B60';'#00E0BA'];
        figure;
        gscatter(Y0(:,idx_state1), Y0(:,idx_state2), L, colors);
        legend('$$\widehat{E_1}$$','$$\widehat{E_2}$$','$$\widehat{E_3^*}$$','Interpreter','latex','location','northeast');
        xlabel('Carpobrotus', 'interpreter', 'latex');
        ylabel('Native', 'interpreter', 'latex');
        axis tight;
        saveas(gcf,[props.subCasePath,'/fig_statespace_7'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_statespace_7']);
    end
end
end

