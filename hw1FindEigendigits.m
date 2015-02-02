function [m, V, D] =  hw1FindEigendigits(A)
%takes (x by k) matrix A (where x is the total number of pixels in an image and k is the number of training images)

m = mean(A,2);

%subtract the mean from each column
for i = 1:size(A,2)
    A(:,i)=A(:,i)-m;
end

covMat = A*A'; %this gives a x by x unnormalized cov matrix

[V,D] = eig(covMat); %V has columns that are the right eigenvectors
D = rot90(D,2);%D is initially sorted in ascending order of eigenvalues. We want it descending.
V = fliplr(V);%flip V correspondingly



    

return

end

