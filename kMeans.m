function [means, assignments] = kMeans(K, vectorList)

iterationLimit = 1000;

% Picks K initial means from vectorList at random, without replacement.
means = datasample(vectorList, K, 'Replace', false);

numVectors = size(vectorList, 1);
assignments = zeros(numVectors, 1);

breakOuterLoop = false;
for iteration = 1:iterationLimit
    % Assignment step: assign to each vector the nearest mean.
    for vectorIndex = 1:numVectors
        % Find the nearest mean from the vector.
        minDistance = Inf;
        for meanIndex = 1:K
            d = distance(vectorList(vectorIndex, :), means(meanIndex, :));
            if d < minDistance
                minDistance = d;
                nearestMeanIndex = meanIndex;
            end
        end
        
        assignments(vectorIndex) = nearestMeanIndex;
    end
    
    % Update step: calculate a new mean for each cluster.
    for meanIndex = 1:K
        cluster = vectorList(assignments == meanIndex, :);
        newMean = mean(cluster);
        
        if isNearlyEqualToZero(distance(newMean, means(meanIndex, :)))
            breakOuterLoop = true;
            break
        end
        
        means(meanIndex, :) = newMean;
    end
    
    if breakOuterLoop
        break
    end
end
end

function d = distance(x, y)
d = norm(x - y);
end

function result = isNearlyEqualToZero(value)
result = abs(value) < eps;

end
