function Image = kMeansDecompress(dictionary, indexes, originalImageSize)

vectors = dictionary(indexes, :);
Image = vectorsToImage(vectors, originalImageSize);

end

