function [res_tab, res_detail, props] = compute_bs_ap_2d(props)
% [res_tab, res_detail, props] = compute_bs_ap(props)

% generate the ground truth labels for each class of solutions.
% we will generate the feature templates only once! For hyperparameter
% studies, the system does not change, so this is clear.
% For model parameter studies, we'd need template initial conditions for
% each parameter vector, which is impractical. Hence, the user needs to
% specify a feature extraction function that is general enough to scale
% from these specific feature templates to all features that will be seen
% throughout the parameter study, i.e. for changing models.


% ### input:
% - props: properties struct

% ### output:
% - res_tab: summary table
% - res_detail: cell array for the detail
% - props: updated props

% ### open points: 
% - 

% -------------------------------------------------------------------------
% Authors: IM Bulai
% Date last modified: February, 2024
% -------------------------------------------------------------------------

% % % generate the feature templates only once
% % [props] = generate_feature_templates(props);

% number of parameter variations
ap_iters_1 = length(props.ap_study.ap_values_1);
ap_iters_2 = length(props.ap_study.ap_values_2);
ap_iters = ap_iters_1*ap_iters_2;
% initialize the results cell array
temp_res_tab = cell(ap_iters, 1);
temp_res_detail = cell(ap_iters, 1);

% run the parameter variation loop. Parallelization is performed on the
% lower level, i.e. for the n time integrations
k = 0;
for i = 1:ap_iters_1
    for j = 1:ap_iters_2
    k = k+1;
    disp(['parameter 1 ', num2str(props.ap_study.ap_values_1(i))]);
    disp(['parameter 2 ', num2str(props.ap_study.ap_values_2(j))]);
    disp(['parameter study 1 ', num2str(i), '/', num2str(ap_iters_1)]);
    disp(['parameter study 2 ', num2str(j), '/', num2str(ap_iters_2)]);
    props.ap_study.ap_values_1_new(k) = props.ap_study.ap_values_1(i);
    props.ap_study.ap_values_2(k) = props.ap_study.ap_values_2(j);
    % create a temp variable for the props structure
    temp_props = struct;
    
    % update the adaptive parameter in the props struct
    temp_props = update_props_ap_2d(props, i, j);
    disp(temp_props.model.odeParams);
    
    % compute the basin stability value for the current parameter setting
    [temp_res_tab{k}, temp_res_detail{k}, ~] = compute_bs(temp_props);
    end
   
end

% we create a summary table that carries the most important values
bs_vals = zeros(ap_iters, props.templ.k+1); 
err_vals = zeros(ap_iters, props.templ.k+1);
solution_names = [props.templ.label, {'NaN'}];

k = 0;
for i = 1:ap_iters_1 % iterate the number of adaptive parameter values 
    for ii = 1:ap_iters_2
        k = k+1;
    for j = 1:length(solution_names)
        
        % find row idx for the current solution label
        idx = find(temp_res_tab{k}.label==solution_names{j},1);
        bs_vals(k,j) = temp_res_tab{k}.basinStability(idx)
        err_vals(k,j) = temp_res_tab{k}.standardError(idx);
    end
    end
end

% now create the table
varNames = cell(1, length(solution_names)*2);
for i = 1:length(solution_names)
    varNames{i} = strrep(['bs_',solution_names{i}], '-', '_');
    varNames{i} = genvarname(varNames{i}); 
    varNames{length(solution_names)+i} = ['err_', strrep(solution_names{i}, '-', '_')];
end
varNames = [{'parameter_1'},{'parameter_2'}, varNames];
res_tab = array2table([props.ap_study.ap_values_1_new', props.ap_study.ap_values_2', ...
    bs_vals, err_vals], 'VariableNames', varNames); 

% store all the details in a large cell array
res_detail = temp_res_detail; 

end