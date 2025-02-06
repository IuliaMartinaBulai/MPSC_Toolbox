%--------------------------------------------------------------------------
% File: plot_bs_bargraph.m
%
% Goal: Plot the results of the basin stability computation in the form of
%       a bar diagram for a single system configuration.
%
%
% Use: plot_bs_bargraph(props, res_tab, varargin)
%
% Input: - props: properties structure
%        - tab: res_tab variable returned by compute_bs
%        - plot_errorbar: boolean indicating whether to plot the std. errors
%
% Output: creates a new figure
%
% Recalls: init_bSTAB.m, setup_carpobrotus_first.m, setup_carpobrotus_second.m,
%          setup_carpobrotus_third.m, setup_carpobrotus_fourth.m,
%          compute_bs.m, plot_bs_bargraph.m, plot_bs_statespace.m
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
function plot_bs_bargraph(props, res_tab, varargin)
figure;
b = bar([1:height(res_tab)-1],[res_tab.basinStability(1:end-1)], ...
    'FaceColor','flat', ...
    'EdgeColor',[0 0 0], ...
    'LineWidth',1.0); hold on;
if strcmp('first_case',props.currentCase)
    if strcmp('E_1_E_2_first', props.currentSubcase)
        b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_1'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_1']);
    elseif strcmp('E_1_star_E_2_first', props.currentSubcase)
        b.CData(1,:) = sscanf('#FFC107', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_2'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_2']);
    end
elseif strcmp('second_case',props.currentCase)
    if strcmp('E_1_E_2_second', props.currentSubcase)
        b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_4'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_4']);
    elseif strcmp('E_1_E_2_star_second', props.currentSubcase)
        b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#FF905B', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_3'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_3']);
    end
elseif strcmp('third_case',props.currentCase)
    if strcmp('E_1_E_2_third', props.currentSubcase)
        b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_5'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_5']);
    elseif strcmp('E_1_star_E_2_third', props.currentSubcase)
        b.CData(1,:) = sscanf('#FFC107', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_6'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_6']);
    end
elseif strcmp('fourth_case',props.currentCase)
    if strcmp('E_1_E_2_fourth', props.currentSubcase)
        b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_8'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_8']);
    elseif strcmp('E_1_E_2_E_3_star_fourth', props.currentSubcase)
        b.CData(1,:) = sscanf('#1E88E5', '#%2x%2x%2x') / 255;
        b.CData(2,:) = sscanf('#D81B60', '#%2x%2x%2x') / 255;
        b.CData(3,:) = sscanf('#00E0BA', '#%2x%2x%2x') / 255;
        xtips1 = b.XData;
        ytips1 = b.YData;
        labels1 = string(round(b(1).YData,3));
        text(xtips1,ytips1,labels1, ...
            'HorizontalAlignment','center',...
            'VerticalAlignment','bottom');
        set(gca, 'Xticklabel', cellstr(res_tab.label));
        ylim([-0.1, 1.1]);
        ylabel('Basin stability value');
        saveas(gcf,[props.subCasePath,'/fig_basinstability_7'], 'epsc');
        savefig(gcf,[props.subCasePath,'/fig_basinstability_7']);
    end
end

