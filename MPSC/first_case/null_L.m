%----------------------------------------------------------------------------------------
% File: null_L.m
%
% Goal: The expression of the nullcline related to native plant population
%
% Use: y = null_L(x,s,H,d_2,b)
%
% Input: x - variable 
%        s -parameter 
%        H -parameter 
%        d_2 - parameter
%        b -parameter
%
% Output: The nullcline related to native plant population
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
function y = null_L(x,s,H,d_2,b)
y = H-(H*d_2*b*x)/s;
end
