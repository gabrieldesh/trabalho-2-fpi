function [dictionary, indexes, originalImageSize] = ...
    kMeansCompress(Image, K, blockSize)

[vectors, originalImageSize] = imageToVectors(Image, blockSize);
[dictionary, indexes] = kMeans(K, vectors);

end

