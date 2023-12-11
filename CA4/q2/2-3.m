clc;

errors = [];

for strength = 1 : 10
    
    strength_error_sum = 0;

    for i = 1 : 100
        noisy_signal = recieved_signal;
        noise = strength / 3 * randn(size(t));
        noisy_signal = noisy_signal + noise;
    

        ro = zeros(size(t));
    
        for j = 1 : length(t)-N
            test_signal = zeros(size(t));
            test_signal(j:j+N-1) = 1;
            ro(j) = dot(test_signal, noisy_signal);
        end

        [pks, locs] = max(abs(ro));
        td_found = t(locs(1));
        R_found = td_found * c / 2;
        error = abs(R_found - R);
        strength_error_sum = strength_error_sum + error;
    end
    mean_strength_err = strength_error_sum / 100;
    str_err = [strength / 2; mean_strength_err];
    errors = [errors, str_err];
end

figure;
noise_strengths = errors(1, :);
errors = errors(2, :);
plot(noise_strengths, errors, 'LineWidth', 4)
ylabel('amplitude')
xlabel('noise strength')
title('distance error')
grid on

