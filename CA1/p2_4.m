function [optimized_params, cost] = p2_4(x, y)
    sum_xy = sum(x .* y);
    sum_x2 = sum(x .* x);
    sum_x = sum(x);
    sum_y = sum(y);
    len = length(x);
    syms a b;
    equation1 = sum_xy == a * sum_x2 + b * sum_x;
    equation2 = sum_y == a * sum_x + b * len;
    optimized_params = solve([equation1, equation2], [a, b]);
    cost = sum((y - a * x - b) .^ 2);
end