function [vectorList, originalImageSize] = imageToVectors(Image, blockSize)

[numLines, numColumns] = size(Image);
originalImageSize = [numLines, numColumns];

numBlockLines = ceil(numLines / blockSize);
numBlockColumns = ceil(numColumns / blockSize);

numVectors = numBlockLines * numBlockColumns;
vectorSize = blockSize^2;

vectorList = zeros(numVectors, vectorSize);
vectorListIndex = 1;

for i = 1:blockSize:numLines
    for j = 1:blockSize:numColumns
        vectorIndex = 1;
        
        for blockLine = 1:blockSize
            for blockColumn = 1:blockSize
                blockLineInImage   = i + blockLine   - 1;
                blockColumnInImage = j + blockColumn - 1;
                
                if blockLineInImage > numLines || ...
                        blockColumnInImage > numColumns
                    value = 0;
                else
                    value = Image(blockLineInImage, blockColumnInImage);
                end
                
                vectorList(vectorListIndex, vectorIndex) = value;
                
                vectorIndex = vectorIndex + 1;
            end
        end
        
        vectorListIndex = vectorListIndex + 1;
    end
end

end

