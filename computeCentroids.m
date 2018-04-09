function centroids = computeCentroids(X, idx, K)
% centroids: update centroids.
% X: Training examples.
% idx: index of points calsification (according to centroids).
% K: number of centroids.


[m n] = size(X);
centroids = zeros(K, n);


for k=1:K,

	pos=(idx==k);
	centroids(k,:) = mean(X(pos,:));

end



end

