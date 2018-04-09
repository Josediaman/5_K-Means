function [centroids, idx, J] = runkMeans(X, initial_centroids, ...
max_iters, plot_progress)
% centroids: update centroids of the model.
% idx: index of training examples (according to centroids).
% X: Training examples.
% initial_centroids: initial centroids of the model.
% max_iters: maximum number of iterations.




% Set default value for plot progress
if ~exist('plot_progress', 'var') || isempty(plot_progress)
    plot_progress = false;
end


% Plot the data if we are plotting progress
if plot_progress
    figure;
    hold on;
end


% Initialize values
[m n] = size(X);
K = size(initial_centroids, 1);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);


% Run K-Means
for i=1:max_iters
    
    % Output progress
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    end
    
    % For each example in X, assign it to the closest centroid
    idx = findClosestCentroids(X, centroids);
    
    % Optionally, plot progress here
    if plot_progress
        plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
    end
    
    % Given the memberships, compute new centroids
    centroids = computeCentroids(X, idx, K);
end

% Hold off if we are plotting progress
if plot_progress
    hold off;
end


% Error
J=0;

for  k = 1:size(X,1), 

	dif = centroids'-X(k,:)';
	dist = sum(dif.^2);
	[a idx(k)] = min(dist);
	J=J+a;

end



end

