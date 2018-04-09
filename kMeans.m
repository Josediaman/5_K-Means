




%% ................................................
%% ................................................
%%  K MEANS
%% ................................................
%% ................................................





%% 1. Clear and Close Figures
clear ; close all; clc





%% ==================== Part 1: Data ====================
fprintf('\n \nDATA\n.... \n \n \n');   





%% 2. Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add your own file

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('Loading data ...\n'); 
%%%%%%********Select archive********   
load('ex7data2.mat'); 
m = size(X, 1);
fprintf('(X) (10 items)\n');   
[X(1:10,:)]
fprintf('Program paused. Press enter to continue. \n \n \n');
pause;





%% =========== Part 2: Training K Means===============
fprintf('TRAINING K Means\n....................\n \n \n \n');



%% 6. Initial values
%%%%%%********Select K and max_iters ********   
% You should try different values of K and max_iters here
K = 3; 
max_iters = 10;


%% 7. Run initial cetroits
initial_centroids = kMeansInitCentroids(X, K);


%% 8. Run K-Means
%%%%%%**** Choose option 2 if x has more than 2 columns******
   
% Option1
[centroids, idx, J] = runkMeans(X, initial_centroids, max_iters,true);

% Option2
%[centroids, idx, J] = runkMeans(X, initial_centroids, max_iters);
%fprintf('Program paused. Press enter to continue.\n');
%pause;





%% =========== Part 3: Results ===============
fprintf('\n \n \n \n RESULTS\n........\n \n \n \n');




%% 9. Display Error.
fprintf('Error ...\n \n');
J


%% 9. Display centroids.
fprintf('\nCentroids ...\n \n');
[(1:size(centroids,1))'  centroids]
fprintf('Program paused. Press enter to continue.\n');
pause;


%% 10. Display classification.
fprintf('Clasification (X, center) ...\n \n');
[X idx]
fprintf('Program paused. Press enter to continue.\n');
pause;





%% ================ Part 5: Validation ================
%fprintf('\n\nVALIDATION\n.......... \n \n \n \n');





[K_vec, error] = ...
    validationCurve(X, max_iters);

figure;
plot(K_vec, error);
xlabel('K');
ylabel('Error');
fprintf('\n\n K\t\tError\n');
for i = 1:length(K_vec)
	fprintf(' %f\t%f\n', ...
            K_vec(i), error(i));
end
fprintf('\n Actual K: \n');
fprintf(' %f \n', K);
fprintf('\nThe best K is the "elbow".\n\n');
fprintf('Program paused. Press enter to continue.\n');
pause;







