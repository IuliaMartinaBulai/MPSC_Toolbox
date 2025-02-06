%----------------------------------------------------------------------------------------
% File: main_carpobrotus.m
%
% Goal: main file for computing the basin stability of the four cases
%       presented in S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù,
%       "A theoretical model of plant species competition: The case of
%       invasive Carpobrotus sp. pl. and native Mediterranean coastal
%       species", 2025
%
%
% Use: main_carpobrotus()
%
% Input:
%
% Output: Data to plot figures 3, 4, 7, 8, 11, 12, 15, 16 in S. Bagella,
%      I.M. Bulai, M. Malavasi, G. Orrù, "A theoretical model of plant
%      species competition: The case of invasive Carpobrotus sp. pl. and
%      native Mediterranean coastal species", 2025
%      results_basinstability_first_1.mat
%      results_basinstability_first_2.mat
%      results_basinstability_second_1.mat
%      results_basinstability_second_2.mat
%      results_basinstability_third_1.mat
%      results_basinstability_third_2.mat
%      results_basinstability_fourth_1.mat
%      results_basinstability_fourth_2.mat
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

% NOTE: <init_bStab> must be located on the active Matlab path!

% ensure a clean start
clear; close all; clc;

% define a name for the current analysis (a subdirectory will be created in
% this folder)

% here there are four cases with two subcases each, uncoment the case you 
% want to compute 

currentCase = 'first_case';
% currentSubcase = 'E_1_E_2_first';
currentSubcase = 'E_1_star_E_2_first';

% currentCase = 'second_case';
%  currentSubcase = 'E_1_E_2_second';
% % currentSubcase = 'E_1_E_2_star_second';

% currentCase = 'third_case';
% % currentSubcase = 'E_1_E_2_third';
%  currentSubcase = 'E_1_star_E_2_third';

% currentCase = 'fourth_case';
% % currentSubcase = 'E_1_E_2_E_3_star_fourth';
%  currentSubcase = 'E_1_E_2_fourth';


% set up paths, initialize bSTAB, create properties struct <props>
[props] = init_bSTAB(currentCase, currentSubcase);

%% 1. set up your case
% all the properties, options and parameters defined hereafter will be
% assigned to a single struct 'props' that makes the handling easier. You
% will only need to change this file for your indivudual system (and the
% functions referenced herein).

if strcmp('first_case',currentCase)
    [props] = setup_carpobrotus_first(props);
    % let bSTAB compute the basin stability values
    [res_tab, res_detail, props] = compute_bs(props);
    % save the results (the compuatation may have took quite a long time, so
    % make sure to not lose the data!)
    if strcmp('E_1_E_2_first',currentSubcase)
        save([props.subCasePath, '/results_basinstability_first_1.mat']);
    elseif  strcmp('E_1_star_E_2_first',currentSubcase)
        save([props.subCasePath, '/results_basinstability_first_2.mat']);
    end
elseif strcmp('second_case',currentCase)
    [props] = setup_carpobrotus_second(props);
    % let bSTAB compute the basin stability values
    [res_tab, res_detail, props] = compute_bs(props);
    % save the results (the compuatation may have took quite a long time, so
    % make sure to not lose the data!)
    if strcmp('E_1_E_2_star_second',currentSubcase)
        save([props.subCasePath, '/results_basinstability_second_1.mat']);
    elseif  strcmp('E_1_E_2_second',currentSubcase)
        save([props.subCasePath, '/results_basinstability_second_2.mat']);
    end
elseif strcmp('third_case',currentCase)
    [props] = setup_carpobrotus_third(props);
    % let bSTAB compute the basin stability values
    [res_tab, res_detail, props] = compute_bs(props);
    % save the results (the compuatation may have took quite a long time, so
    % make sure to not lose the data!)
    if strcmp('E_1_star_E_2_third',currentSubcase)
        save([props.subCasePath, '/results_basinstability_third_1.mat']);
    elseif  strcmp('E_1_E_2_third',currentSubcase)
        save([props.subCasePath, '/results_basinstability_third_2.mat']);
    end
elseif strcmp('fourth_case',currentCase)
    [props] = setup_carpobrotus_fourth(props);
    % let bSTAB compute the basin stability values
    [res_tab, res_detail, props] = compute_bs(props);
    % save the results (the compuatation may have took quite a long time, so
    % make sure to not lose the data!)
    if strcmp('E_1_E_2_E_3_star_fourth',currentSubcase)
        save([props.subCasePath, '/results_basinstability_fourth_1.mat']);
    elseif  strcmp('E_1_E_2_fourth',currentSubcase)
        save([props.subCasePath, '/results_basinstability_fourth_2.mat']);
    end
end

% if you quickly want to update model parameters, you can change them via
% props.model.odeParams = []; here

%% 3. plot the results
% we provide some basic plotting functionalities. Individual elements must
% be fine-tuned by the user upon creating final figures (axis labels etc.).
% This can be done by adding another struct to <props>, and then adapting
% the plotting functions to take the struct entries and integrate them into
% the figures.

% 1. bar plot for the basin stability values
plot_bs_bargraph(props, res_tab, true);

% 2. state space scatter plot: class-labeled initial conditions
plot_bs_statespace(props, res_detail, 1, 2);

% % 3. feature space and classifier results
% plot_bs_featurespace(props, res_detail);




