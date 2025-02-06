function plot_bs_parameter_study_2d(props, tab, varargin)
% plot_bs_parameter_study(props, tab, plot_error)
% -------------------------------------------------------------------------
% Authors: IM Bulai, G Orrù
% Date last modified: February, 2025
% -------------------------------------------------------------------------
% todo: automate class labeling
if length(varargin)>0
    stem_plot = varargin{1};
else
    stem_plot = true;
end

colors = {'#1E88E5','#D81B60','#00E0BA'};

%num_solutions = ((width(tab)-1)/2);
num_solutions = ((width(tab)-2)/2)-1;

nams = tab.Properties.VariableNames(2:props.templ.k+2);


figure;
p = cell(num_solutions, 1);
if stem_plot
    for i = 1:num_solutions
        stem3(table2array(tab(:,1)), table2array(tab(:,2)), table2array(tab(:,i+2))); hold on;
    end
    grid on
else
    xv = linspace(min(table2array(tab(:,1))), max(table2array(tab(:,1))), 50);
    yv = linspace(min(table2array(tab(:,2))), max(table2array(tab(:,2))), 50);
    [X,Y] = meshgrid(xv, yv);
    for i = 1:num_solutions
        Z = griddata(table2array(tab(:,1)),table2array(tab(:,2)),table2array(tab(:,i+2)),X,Y);
        surf(X, Y, Z,'FaceColor',colors{i},'FaceAlpha',0.2,'EdgeAlpha',0.2);hold on; %'FaceColor','red'
        set(gca, 'ZLim',[0 1])
        grid on
    end
end
legend([p{:}]);
xlabel(['parameter ', props.ap_study.ap_name_1], 'interpreter', 'latex','Rotation',20);
ylabel(['parameter ', props.ap_study.ap_name_2], 'interpreter', 'latex','Rotation',-30);
zlabel('$\mathcal{S}_{\mathcal{B}}$', 'interpreter', 'latex');
legend('$$\widehat{E_1}$$','$$\widehat{E_2}$$','$$\widehat{E_3^*}$$','Interpreter','latex','location','northeast');
%xlabel([' ', props.ap_study.ap_name], 'interpreter', 'latex');
%ylabel('$\mathcal{S}_{\mathcal{B}}$', 'interpreter', 'latex');
saveas(gcf,[props.subCasePath,'/fig_bs_study'], 'eps');
savefig(gcf,[props.subCasePath,'/fig_bs_study']);

end