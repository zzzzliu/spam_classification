function features = emailFeatures(word_indices)
n = 1899;
features = zeros(n, 1);
features(word_indices)=1;
end
