function Image = vectorsToImage(vectorList, originalImageSize)

vectorSize = size(vectorList, 2);
blockSize = sqrt(vectorSize);

numLines = originalImageSize(1);
numColumns = originalImageSize(2);

Image = uint8(zeros(numLines, numColumns));

vectorListIndex = 1;

for i = 1:blockSize:numLines
    for j = 1:blockSize:numColumns
        vectorIndex = 1;
        
        for blockLine = 1:blockSize
            for blockColumn = 1:blockSize
                
                blockLineInImage   = i + blockLine   - 1;
                blockColumnInImage = j + blockColumn - 1;
                
                value = vectorList(vectorListIndex, vectorIndex);
                
                if blockLineInImage <= numLines && ...
                        blockColumnInImage <= numColumns
                    Image(blockLineInImage, blockColumnInImage) = value;
                end
                
                vectorIndex = vectorIndex + 1;
            end
        end
        
        vectorListIndex = vectorListIndex + 1;
    end
end

end

