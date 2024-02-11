syms x(t)
syms y(t)
system_tf = tf(1, 1);
ts = 0;
te = 10;
fs = 10;
time = ts : 1/fs : te - 1/fs;


ode = diff(y, t, 2) + 3 * diff(y, t, 1) + 2 * y == 5 * step(system_tf);
cond1 = (y(0) == 1);
dy = diff(y);
cond2 = (dy(0) == 1);
yres(t) = dsolve(ode, [cond1, cond2]);
yfinal = simplify(yres);
fprintf('final solution: %s\n', char(yfinal));

plot(time, yfinal(time));