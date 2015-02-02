function [ imgColumnMatrix ] = convertImagesToColumnVectors(rowsByColumnsByImages)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes heredims = size(rowsByColumnsByImages);
  dims = size(rowsByColumnsByImages);
  numRows = dims(1);
  numColumns = dims(2);
  numImages = dims(4); %the 3rd dimension is unused?
  
  imgColumnMatrix = zeros(numRows*numColumns, numImages);
  disp(size(imgColumnMatrix));
  for i=1:numImages
      %make into vector
      imgColumnMatrix(:,i)=reshape(rowsByColumnsByImages(:,:,i),numRows*numColumns,1);
      %normalize 
      imgColumnMatrix(:,i)=imgColumnMatrix(:,i)./norm(imgColumnMatrix(:,i));
  end

end

  

