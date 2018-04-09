function centroids = kMeansInitCentroids(X, K)
% centroids: initial centroids of the model.
% X: Training examples.
% K: number of centroids.


centroids = zeros(K, size(X, 2));
randidx = randperm(size(X, 1));
centroids = X(randidx(1:K), :);


end

