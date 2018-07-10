function main(imagePath)

K = 256;

I = imread(imagePath);
originalSize = numel(I);

compressAndPlot(2);
compressAndPlot(3);

    function compressAndPlot(blockSize)
    
    [dictionary, indexes, originalImageSize] = ...
        kMeansCompress(I, K, blockSize);
    compressedSize = numel(dictionary) + numel(indexes);

    compressionRate = originalSize / compressedSize;

    I_decompressed = ...
        kMeansDecompress(dictionary, indexes, originalImageSize);

    PSNR = psnr(I, I_decompressed);

    diff = I - I_decompressed;

    % Plota as imagens.
    figure;
    subplot(1, 2, 1); imshow(I);
    title('Imagem original');

    subplot(1, 2, 2); imshow(I_decompressed);
    title(strcat('Blocos ', num2str(blockSize), 'x', ...
                 num2str(blockSize), '. Compressão: ', ...
                 num2str(compressionRate), 'x. PSNR: ', ...
                 num2str(PSNR), '.'));

    figure;
    H = subplot(1, 1, 1); imshow(diff);
    title(H, strcat('Diferença entre imagens. Blocos ', ...
                 num2str(blockSize), 'x', num2str(blockSize)));

    end

end