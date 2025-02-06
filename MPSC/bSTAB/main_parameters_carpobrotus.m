%----------------------------------------------------------------------------------------
% File: main_parameters_carpobrotus.m
%
% Goal: main file for computing two parameter bifurcation 
%
%
% Use: main_parameters_carpobrotus()
%
% Input:
%
% Output: Data to plot figures 17, 18,
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

% NOTE: <init_bStab> must be located on the active Matlab path!
clear; close all; clc;
addpath('../');

currentCase = 'space_analysis';
currentSubcase = 'space_analysis_r_s';
%  currentSubcase = 'space_analysis_a_b';

[props] = init_bSTAB(currentCase,currentSubcase);

[props] = setup_carpobrotus_space_analysis(props);

props.ap_study.mode = 'model_parameter';

if strcmp('space_analysis_r_s',currentSubcase)
    props.ap_study.ap_1 = 1; % parametro r
    props.ap_study.ap_2 = 6; % parametro s

    props.ap_study.ap_values_1 = 0.08:0.005:0.12; % parametro r
    props.ap_study.ap_values_2 = 0.04:0.005:0.08; % parametro s

    props.ap_study.ap_name_1 = 'r';
    props.ap_study.ap_name_2 = 's';
elseif strcmp('space_analysis_a_b',currentSubcase)
    props.ap_study.ap_1 = 5; % parametro a
    props.ap_study.ap_2 = 9; % parametro b

    props.ap_study.ap_values_1 = 0.01:0.005:0.04; % parametro a
    props.ap_study.ap_values_2 = 0.01:0.005:0.04; % parametro b

    props.ap_study.ap_name_1 = 'a';
    props.ap_study.ap_name_2 = 'b';
end

[res_tab, res_detail, props] = compute_bs_ap_2d(props);

save([props.subCasePath, '/results.mat']);

plot_bs_parameter_study_2d(props, res_tab, false); 