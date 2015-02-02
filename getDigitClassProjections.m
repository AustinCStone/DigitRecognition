function [digitToEigenProjections] = getDigitClassProjections( V, trainImages, trainLabels, m)
%Outputs a map from digit to a list of the eigenprojections for the test
%samples of that digit.

dim = size(trainImages);
numImages = dim(2);

%stores the number of occurences of each digit
digitsToOccurences = containers.Map({0,1,2,3,4,5,6,7,8,9},{0,0,0,0,0,0,0,0,0,0});

%e.g. digitToEigenProjections(5) gives the average weight of all the training
%"fives" projected onto the vectors in V

%Pretty stupid, but maplab requires you to initialize a dictionary with a
%type. Since we don't know what we want in it yet, we put in a bunk key and
%value.
digitToEigenProjections = containers.Map({-1},{zeros(size(V,2),1)});
for i=1:numImages
    digitsToOccurences(trainLabels(i))=digitsToOccurences(trainLabels(i))+1;
    projection=((trainImages(:,i)-m)'*V)'; %project mean centered training image onto eigenvectors
    
        if(isKey(digitToEigenProjections, trainLabels(i)))
            %append the new projection to the map
            digitToEigenProjections(trainLabels(i))=[digitToEigenProjections(trainLabels(i)), projection];
        else
            %nothing to append to
            digitToEigenProjections(trainLabels(i))=projection;
        end
end



%better for precision to divide at the end
for i=0:9
    digitToEigenProjections(i)=digitToEigenProjections(i)./(digitsToOccurences(i));
end



end

