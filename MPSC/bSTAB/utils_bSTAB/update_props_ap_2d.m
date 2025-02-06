function [props] = update_props_ap_2d(props, iter_idx_1, iter_idx_2)
% [props] = update_props_ap(props, iter_idx_1, iter_idx_2)
% -------------------------------------------------------------------------
% Authors: IM Bulai
% Date last modified: February, 2024
% -------------------------------------------------------------------------
% to do: check the correct type of <value> to be consistent with the type
% of the original entry of props.field

switch props.ap_study.mode
    
    case 'hyper_parameter'
        % update the props entry. Unfortunately, we will have to use 'eval'
        % for this job.
        value_1 = props.ap_study.ap_values_1(iter_idx_1);
        value_2 = props.ap_study.ap_values_2(iter_idx_2);
        eval(['props.', props.ap_study.ap_1, ' = ', num2str(value_1), ';']);
        eval(['props.', props.ap_study.ap_2, ' = ', num2str(value_2), ';']);
        
    case 'model_parameter'
        
        % replace the model parameter vector at the index
        % (props.ap_study.ap) with the value props.ap_study.ap_values for
        % the current index of the parameter variation loop
        props.model.odeParams(props.ap_study.ap_1) = props.ap_study.ap_values_1(iter_idx_1);
        props.model.odeParams(props.ap_study.ap_2) = props.ap_study.ap_values_2(iter_idx_2);
    otherwise
        
        error('sorry, this type of parameter variation is not supported');
end


end