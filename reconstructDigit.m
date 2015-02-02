function [ output_args ] = reconstructDigit(inputDigitVector, V, D, m)

origX = 28;
origY = 28;
numEigenVectors = 30;
dims = size(inputDigitVector);
rows = dims(1);
cols = dims(2);
displayImage = zeros(rows,cols);
%inputDigitVector = inputDigitVector-m;

for i = 1:numEigenVectors
    displayImage=displayImage + inputDigitVector(:)'*V(:,i)*D(i,i)*V(:,i);%project onto eigenvector
    disp(displayImage);
    disp(size(displayImage));
    imshow(2000*reshape(displayImage,origX,origY));%multiply by arbitrary value of 100 to make normalized image show up better
    titleText = strcat('added eigenvector projection ',num2str(i));
    title(titleText);
    pause(1);
end


end

