% for fish range, 
range_fish = [8,9,10,11];

% get 50% cell selection

% full itr. clustering

% save to VAR: all saved to VAR(i).ClusGroup{1,3}(1)

% (need to update full clustering method before cross-validation within fish)

%%
% ---- multi-fish analysis ----

%% prep
% need to interpolate data to account for different scanning speeds???!!!!!!!


%% regression

% get stim and motor regressors
% motor: L/R/F, full length data
% stim: use regressor and data for given stimlus range only
% (use stimset or manually code matching reg across fish??)

if regchoice{1}==1, % stim Regressor
%     fishset = getappdata(hfig,'fishset');
    fishset = 2;
    regressors = GetStimRegressor(stim,fishset);
    if length(regchoice{2})>1,
        regressor = zeros(length(regchoice{2}),length(regressors(1).im));
        for i = 1:length(regchoice{2}),
            regressor(i,:) = regressors(regchoice{2}(i)).im;
        end
    else
        regressor = regressors(regchoice{2}).im;
    end
    
elseif regchoice{1}==2, % motor Regressor
    behavior = getappdata(hfig,'behavior');
    regressors = GetMotorRegressor(behavior);
    regressor = regressors(regchoice{2}).im;
end
    
    
% screen clusters for given regressor
% need to pass 2 thres: corr coeff and top percentage?? (need to hand-tune)

% -- between 2 fish --
% compare anatomical location:
% for given screened cluster, is there another screened cluster anatomically close
% (anatomically close defined as cluster centroids distance below
% threshold, and difference in distributedness below threshold)
% save selected pairs/multiple clusters
% output percentage of "conserved" clusters
% -- get average percentage for all pairs of fish --

% -- multi-fish clustering --
% or, plot clusters for all fish for given regressor onto standard brain,
% and cluster centroid location and distributedness; this "conserved"
% cluster needs to span multiple fish, ideally all fish

%% other clusters ((spontaneous))

% like above, find anatomically similar candidate clusters, and 
% plot out their activity traces
% select by hand
% save selected pairs/multiple clusters

