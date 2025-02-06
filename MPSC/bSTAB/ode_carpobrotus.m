%----------------------------------------------------------------------------------------
% File: ode_carpobrotus.m
%
% Goal: plot the stable equilibrium points for the third case as well as
% the state space values and the state space for the bistability between
% $\bar{E_1}$ and $\bar{E_2}$ and $\bar{E_1}^*$ and $\bar{E_2}$
%
% Use: ode_carpobrotus(t,y,r,K,gamma,d_1,a,s,H,d_2,b,alpha,beta)
%
% Input: t - time
%        y - state variables of the ode system 
%        r,K,gamma,d_1,a,s,H,d_2,b,alpha,beta - parameters of the model
%
% Output: dydt - solution of the ode system
%
% Recalls: 
%
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
function [dydt] = ode_carpobrotus(t,y,r,K,gamma,d_1,a,s,H,d_2,b,alpha,beta)
dydt = [r*(1-(y(1)/K)^gamma)*y(1)-d_1*a*(y(1)^alpha)*y(2)^beta; 
        s*(1-y(2)/H)*y(2)-d_2*b*(y(1)^alpha)*y(2)^beta];
end