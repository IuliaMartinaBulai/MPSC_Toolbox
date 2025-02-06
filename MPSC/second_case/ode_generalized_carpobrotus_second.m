% File: ode_generalized_carpobrotus_second.m
%
% Goal: This ODE system to be solved, corresponding to the first case
%
% Use: ode_generalized_carpobrotus_second(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta)
%
% Input: t - time
%        y - variable
%        s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta -parameters of the model
%
% Output: The equations of the model
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
function [dydt] = ode_generalized_carpobrotus_second(t,y,s,r,H,K,gamma,d_1,a,d_2,b,alpha,beta)
dydt = [r*(1-(y(1)/K)^gamma)*y(1)-d_1*a*(y(1)^alpha)*(y(2)^beta);
    s*(1-y(2)/H)*y(2)-d_2*b*(y(1)^alpha)*y(2)^beta];
end