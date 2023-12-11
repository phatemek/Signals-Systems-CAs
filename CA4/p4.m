clc;
clearvars;

load('TrainedModel.mat');
load('diabetestrainig.mat');
load('diabetesvalidation.mat');

real = table2array(diabetestraining(:, 'label'));
output = TrainedModel.predictFcn(diabetestraining);

sum1 = 0;
for i=1:length(real)
    if output(i, 1) == real(i, 1)
        sum1 = sum1 + 1;
    end
end
train_accuracy = sum1/length(output) * 100;

fprintf('train accuracy percentage: %.2f\n', train_accuracy);

sum2 = 0;
real = table2array(diabetesvalidation(:,"label"));
[output, ~] = TrainedModel.predictFcn(diabetesvalidation);
for i=1:length(real)
    if (real(i, 1) == output(i, 1))
        sum2 = sum2 + 1;
    end
end
test_accuracy = sum2/length(output) * 100;

fprintf('test accuracy percentage: %.2f\n', test_accuracy);