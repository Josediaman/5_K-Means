
function [K_vec, error] = ...
    validationCurve(X, max_iters);
% K_vec: values of number of centroids.
% error: error of the model.
% X: X train set.
% max_iters: maximum number of iterations

   
K_vec = [2 3 4 5 6 7 8]';
error = zeros(length(K_vec), 1);


for i = 1:length(K_vec)
         
	K = K_vec(i,1);
	fprintf('\n\n\nCase K = %f \n\n', K);
	initial_centroids = kMeansInitCentroids(X, K);
	[centroids, idx, error(i)] = runkMeans(X, initial_centroids, max_iters);

endfor


end
