% test 1:
%{
v = 0:0.001:1;
w = 2.572 * v + 6.2419;

[test_opt, cost] = p2_4(v, w);
fprintf("alpha: %.4f\nbeta: %.4f\n", test_opt.a, test_opt.b);
%}

% test 2:

%{
v = 0:0.001:1;
w = 2.572 * v + 6.2419;
noise = 0.3 * randn(size(v));
w = w + noise;

[test_opt, cost] = p2_4(v, w);
fprintf("alpha: %.4f\nbeta: %.4f\n", test_opt.a, test_opt.b);
%}

[optimized_params, cost] = p2_4(x, y);
fprintf("alpha: %.4f\nbeta: %.4f\n", optimized_params.a, optimized_params.b);
