# MPSC_Toolbox
MPSC: Model Plant Species Competition Toolbox 
(c) Developed by Iulia Martina Bulai, Giulia Orrù

In this toolbox we propose the codes needed for the reproducibility of the results obtained in the manuscript: 
[1] S. Bagella, I.M. Bulai, M. Malavasi, G. Orrù, "A theoretical model of plant species competition: The case of invasive Carpobrotus sp. pl. and native Mediterranean coastal species", 2025

GETTING STARTED
The MATLAB files used to generate the Figures 1-18 of the manuscript [1] are
-MPSC/first_case/nullclines_interaction.m -> Figure 1
-MPSC/first_case/first_main.m -> Figures 2,3,4
-MPSC/second_case/nullclines_alpha.m -> Figure 5 
-MPSC/second_case/second_main.m -> Figures 6,7,8
-MPSC/third_case/nullclines_beta -> Figure 9 
-MPSC/third_case/third_main.m -> Figures 10,11,12
-MPSC/fourth_case/nullclines_interaction_general.m -> Figure 13
-MPSC/fourth_case/fourth_main.m -> Figures 14,15,16 
-MPSC/bSTAB/fourth_case/main_parameters_carpobrotus.m -> Figures 17,18

In order to obtain the plots in the above mentioned files the data was computed adapting the toolbox MATLAB bSTAB to our model. The new files with respect to bSTAB are:

- compute_bs_ap_2d.m 
- update_props_ap_2d.m
- plot_bs_parameter_study_2d.m 
- plot_bs_statespace.m 
- plot_bs_bargraph.m
- features_carpobrotus.m
- ode_carpobrotus.m 
- setup_carpobrotus_first.m
- setup_carpobrotus_second.m 
- setup_carpobrotus_third.m
- setup_carpobrotus_fourth.m 
- setup_carpobrotus_space_analysis.m 
- main_carpobrotus.m

- The MATLAB Toolbox bSTAB developed by Stender and Hoffman in [2] was used and can be downloaded at page: https://github.com/TUHH-DYN/bSTAB.
- Also the files: compute_bs_ap_2d.m, update_props_ap_2d.m, plot_bs_parameter_study_2d.m an extension of the 1D case for the 2D case, introduced in [3], was used. 

[2] M. Stender, N. Hoffmann, bSTAB: an open-source software for computing the basin stability of multi-stable dynamical systems, Nonlinear Dynamics 107 (2022) 1451-1468. doi:https://doi.org/10.1007/s11071-021-06786-5.

[3] I. M. Bulai, M. Salvia, Approximation of basins of attraction for bistable dynamical system for olive disease control, Applied Numerical Mathematics 200 (2024) 138-147. doi:https://doi.org/10.1016/j.apnum.2023.05.005.

License : 

The MPSC toolbox is a MATLAB library released under the GPL.

The MPSC toolbox is free software: you can redistribute it and/or modify it under the terms of the GNU  General Public License as published by the Free Software Foundation, either version 3 of the License,  or (at your option) any later version.

The MPSC toolbox is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the MPSC toolbox. If not, see <http://www.gnu.org/licenses/>.
