function  [props] = setup_carpobrotus_space_analysis(props)
% [props] = setup_pendulum(props)

% Define the dynamical system, the model parameters, and all hyper
% parmaeters and properties required for the basin stability computation.

% This will function returns a structure array (struct) 'props'
% containing all the relevant pieces of information for easy handling and
% storing.

% (c) Merten Stender
% Hamburg University of Technology, Dynamics Group
% www.tuhh.de/dyn
% m.stender@tuhh.de

% 08.01.2021
% -------------------------------------------------------------------------
% Addapted by: IM Bulai, G Orrù
% Date last modified: February, 2025
%% 0. general program settings
% appearance, parallelization options

% parallel properties: usage of multiple cores
props.flagParallel = true;

% visual output of the program during computation & storing the figures
props.flagShowFigures = false;

% disable all graphical feedback for HPC deployment
props.flagUseHPC = false;

% show progress bar along computation (requires the ParforProgressbar tool)
props.progessBar = false;


%% 1. dynamical system properties (.model struct)
% we will store all the relevant properties in props.model.

% 1.1 define the system definition Matlab file
props.model.odeFun = @ode_carpobrotus; % a function handle @my_ode_function

% 1.2 define the state space dimension D
props.model.dof = 2; % degrees-of-freedom (= length of state vector)

% 1.3 define the optional parameters that the ODE definition requires (in the
% correct order as requested by ode_function)
% Eaxmple: [dydt] = my_ode_function(t,y, p1, p2, p3)

%parameters
r = 0.07;
K = 10;
gamma = 1/3;
d_1 = 0.2;
a = 0.05;
s = 0.03;
H = 10;
d_2 = 0.2;
b = 0.05;
alpha = 2/3;
beta = 2/3;

% constitute the parameter vector that will be handled to the ode function
props.model.odeParams = [r,K,gamma,d_1,a,s,H,d_2,b, alpha, beta];

%% 2. Region of Interest (.roi struct)
% Specify the subset of the state space where to sample the states from

% 2.1 number of samples N
props.roi.N = 10000; % integer number

% 2.2 minima (per state space dimension)
props.roi.minLimits = [0,0]; % must be of length <props.model.dof>

% 2.3 maxima (per state space dimension)
props.roi.maxLimits = [K,K]; % must be of length <props.model.dof>

% 2.4 select dimensions for which to create sampling points (some
% dimensions may be excluded from the sampling through this selection)
props.bs.samplingVarDims = [true; true]; % boolean: dims to vary

% 2.5 sampling strategy / probability density function rho
% possible candidates (see documentation for more details)
% - 'uniform': uniform distribution at random (default!)
% - 'multGauss': multivariate, independent Gaussians
% - 'grid': linearly spaced grid
% - 'custom': provide your own set of initial conditions per .samplingCustomPDF
props.roi.samplingPDF = 'uniform';

% 2.6 if a custom PDF is chosen: specify function handle
% must take as inputs: fun(N, minLimits, maxLimits, samplingVarDims)
% must return as output: array of initial conditions
props.bs.samplingCustomFun = ''; % a function handle @


%% 3. Time integration parameters (.ti struct)
% specify time stepping routine, its hyperparameters, etc.

% 3.1 sampling frequency fs = 1/dt for the time stepper
props.ti.fs = 25;

% 3.2 time span for the time integration
props.ti.tSpanStart = 0;
props.ti.tSpanEnd = 1000;
props.ti.tSpan = [props.ti.tSpanStart props.ti.tSpanEnd];

% 3.3 steady-state time. The system should have arrived at a steady-state
% after this point to avoid issues stemming from transients. All data after
% this point in time will be used to classify the steady-state into one of
% the possible solutions of the system
props.ti.tStar = props.ti.tSpan(end)-50;

% 3.4 time_integrator method. Check
% https://de.mathworks.com/help/matlab/math/choose-an-ode-solver.html
% for further advice, e.g. ode23t for vanishing numerical damping
props.ti.timeStepper = 'ode45';

% 3.5 time integration options. use the odeset() functionalities
% options = odeset('RelTol',1e-8);
% options = odeset('RelTol',1e-6,'AbsTol',1e-8,'InitialStep',5e-3);
% comps=[2];
options = odeset('RelTol',1e-8);%'NonNegative', comps);
props.ti.options = options;

%% 4. Clustering options (.clust struct)
% parameters of the trajectory classification task

% 4.1. clustering mode (supervised / unsupervised)
% if 'supervised': the user has to specify templates for each solution in
% the following section 5.
% if 'unsupervised': the trajectories will be clustered without specifying
% the number of clusters
props.clust.clustMode = 'supervised'; % string

% 4.2 feature extractor function provided by the user.
% Please indicate the function that derives descriptive features from the
% time integrations. The features will be used to classify the steady-state
% solutions into k classes / clusters
props.clust.featExtractFun = @features_carpobrotus; % a function handle

% 4.3 number of extracted features
props.clust.numFeatures = 2;

% 4.4. further clustering options
% Please indicate the classification function. Per default, we use a simple
% Euclidean distance classifier with some prescribed tolerance. You may add
% additional parameters here if required.
% clustering methods (supervised):
% - kNN (k=1), default choice
% - kNN_thresholded (k=1), maximum distance prescribed
props.clust.clustMethod = 'kNN'; % default: kNN(k=1) using Euclidean distance

% clustering method: distance norm (supervised case using Statistics and ML
% toolbox). possible choices: 'euclidean' (default), 'seuclidean',
% 'cityblock', 'chebychev', 'minkowski', 'mahalanobis', 'cosine',
% 'correlation', 'spearman', 'hamming', 'jaccard'
props.clust.clustMethodNorm = 'euclidean';

% distance threshold for kNN_thresholded_thresholded
props.clust.clustMethodTol = NaN;


%% 5. Templates (for the supervised clustering setting)
% tell the program which solutions are possible, and what characteristics
% they have. We need a 'ground truth' for classifying new data. Here, you
% simply supply initial conditions per solution, i.e. you need to know at
% just one initial condition for each steady-state. We will automatically
% create the corresponding feature vector (class template) that will be
% used by the classifier to assign a label to a new time integration result

% 5.1. the number of different steady-state solutions
props.templ.k = 3;

% we use cells of length <k> to store the initial conditions, the
% corresponding model parameters and the label for each steady-state
% solution

% the initial condition that leads the system to end up on the first steady state
props.templ.Y0{1} = [0.5,8];   % initial condition (NOT the steady-state itself)
props.templ.modelParams{1} = [r,K,gamma,d_1,a,s,H,d_2,b, alpha, beta]; % model parameters
props.templ.label{1} = 'Carpobr.-free';    % stable fixed point label
% % the initial condition that leads the system to end up on the second stable steady state
props.templ.Y0{2} = [8;0.5];
props.templ.modelParams{2} = [r,K,gamma,d_1,a,s,H,d_2,b, alpha, beta];
props.templ.label{2} = 'Native-free'; % limit cycle solution label
% % the initial condition that leads the system to end up on the third stable steady state
props.templ.Y0{3} = [5;5];
props.templ.modelParams{3} = [r,K,gamma,d_1,a,s,H,d_2,b, alpha, beta];
props.templ.label{3} = 'Coex.'; % limit cycle solution label

%% 6. Evaluation
% as we run so many time integrations, it seems natural to collect some
% amplitude values that can visualize a bifurcation map
% props.eval.ampFun = @extract_amps; % a function handle. Default: @extract_amps

%% 7. Bug check (to do)
% check the parameters implemented above for consistency, existence of
% functions etc. Return warnings for obvious errors.
props = check_props(props);

%% store the parameters locally to the project subfolder
% save all these properties to the sub-case folder. Just in case that you
% want to access the properties later on
save([props.subCasePath, '/props.mat'], 'props');
end