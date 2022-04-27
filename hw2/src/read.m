data = readmatrix('../data/data.csv');

onesVector = ones(size(data, 1), 1);

D = data(:, 5);
T = data(:, 1:4);
W = [onesVector, data(:, 7:20)];
X = [onesVector, data(:, [7, 19, 20])];
Y = data(:, 6);
Z = [onesVector, data(:, [7, 19:22])];
