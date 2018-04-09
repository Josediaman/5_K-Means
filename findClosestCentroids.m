function idx = findClosestCentroids(X, centroids)
%   idx: returns the closest centroids in idx for a dataset X %   where each row is a single example. idx = m x 1 vector of %   centroid assignments (i.e. each entry in range [1..K])
%   X: Training examples.
%   centroids: centroids of K-Means.


K = size(centroids, 1);
idx = zeros(size(X,1), 1);


for i = 1:size(X,1), 

	dif = centroids'-X(i,:)';
	dist = sum(dif.^2);
	[a idx(i)] = min(dist);

end


end

