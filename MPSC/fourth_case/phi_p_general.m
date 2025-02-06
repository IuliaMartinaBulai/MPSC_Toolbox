%----------------------------------------------------------------------------------------
% File: phi_p_general.m
%
% Goal: The expression of the nullcline related to native plant population
%
% Use:  y = phi_p_general(x,K,A,gamma,alpha)
%
% Input: x -variable
%        K - parameter
%        A - parameter
%        gamma - parameter
%        alpha - parameter
%        beta - parameter
%
% Output: The phi nullcline 
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
function y = phi_p_general(x,A,K,gamma,alpha,beta)
y = (A*x-(A/K^gamma)*x.^((gamma+1-alpha)/(1-alpha))).^((1-beta)/beta);
end