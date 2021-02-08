% ---------------------------------------------
% RBF module
% new Data = KernelizeWithRBF(old Data, new dimension)
% calls: k_means module
% Returns: a high dimensional transformed data
% ---------------------------------------------

function D_new = KernelizeWithRBF(D, newDim, sigma)

fprintf('\n\n Kernel transformation starts...');
[row,col] = size(D);

X = D(:,1:col-1);

Centroids = k_means(D, newDim);

D_new = zeros(row,newDim+1);

for i=1:row
    for j=1:newDim
        D_new(i,j) = exp(-(1/(2*(sigma^2)))*(sum((X(i,:)-Centroids(j,:)).^2)));
    end
end
D_new(:,newDim+1) = D(:,col);
fprintf('\n Finished transformation with RBF kernel.\n');
end