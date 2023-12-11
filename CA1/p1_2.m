t = 0:0.01:1;
z1 = sin(2*pi*t);
z2 = cos(2*pi*t);

figure;
subplot(1, 2, 1)
plot(t, z1, '--b')
s1 = 'sin(2 \pi t)';
text(0.5, 0.25, s1);
title('Sin')
legend('sin')
xlabel('time')
ylabel('amplitude')
grid on


subplot(1, 2, 2)
plot(t, z2, 'r')
y0 = [];
s2 = 'cos(2 \pi t)';
text(0.2, -0.8, s2);
title('Cos')
legend('cos')
xlabel('time')
ylabel('amplitude')
grid on
