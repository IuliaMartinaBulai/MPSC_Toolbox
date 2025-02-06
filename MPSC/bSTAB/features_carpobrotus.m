%----------------------------------------------------------------------------------------
% File: features_carpobrotus.m
%
% Goal: computes descriptive features from the time integration data and 
%       returns the features as a vector that can be used for classification.
%
%
% Use: features_carpobrotus(T, Y, props)
%
% Input: - T: time vector from the time integration
%        - Y: states corresponding to T
%        - props: property struct with all the required information
%
% Output: - features: vector that contains all the features (column!)
%
% Recalls: 
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
function [features] = features_carpobrotus(T, Y, props)
idx_steady = find(T>props.ti.tStar,1);
Y = Y(idx_steady:end,:);

if strcmp('first_case',props.currentCase) || strcmp('third_case',props.currentCase)
    if Y(:,2) < 0.1
        features = 2;
    else
        features = 1;
    end
elseif strcmp('second_case',props.currentCase)
    if Y(:,1) < 0.1
        features = 1;
    else
        features = 2;
    end
elseif strcmp('fourth_case',props.currentCase)
    if strcmp('E_1_E_2_fourth',props.currentSubcase)
        if Y(:,2) < 0.1
            features = 2;
        else
            features = 1;
        end
    elseif strcmp('E_1_E_2_E_3_star_fourth',props.currentSubcase)
        if Y(:,2)<0.1
            features = 2;
        elseif Y(:,1) < 0.1
            features = 1;
        else
            features = 3;
        end
    end
elseif strcmp('space_analysis',props.currentCase)
    if Y(:,2)<0.1
        features = 2;
    elseif Y(:,1) < 0.1
        features = 1;
    else
        features = 3;
    end
end
