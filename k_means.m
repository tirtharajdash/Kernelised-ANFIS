% ---------------------------------------------
% Clustering Work: Dash
% Centroids = k_means(Array,Number of cluster)
% Returns centroids of each clusters
% ---------------------------------------------
function Centroid = k_means(X,NumClstr)

[row,col]=size(X);

%store the data in X without the target attribute
X=X(:,1:col-1);

%K-Means Clustering
fprintf('\n   k-means clustering started. Centroids returned...');
fprintf('\n      Number of data patterns supplied : %d',row);
[~,Centroid]=kmeans(X,NumClstr,'MaxIter',200);
fprintf('\n   k-means clustering finished. Centroids returned...');
end
