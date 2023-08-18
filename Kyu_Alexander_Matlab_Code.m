wn = 20 * 2 * pi;
n1 = 6.827769;
c1 = .1e-6;
c2 = n1*c1;
r1 = 1/(c1*wn*sqrt(n1));
r2 = r1;

display(r1);
display(r2);
display(c1);
display(c2);

%% task 2 ideal
c1_1 = 1e-6;
c2_1 = 1.17e-6;
r1_1 = 7.35e3;
r2_1 = r1_1;

c1_2 = 0.1e-6;
c2_2 = 0.68e-6;
r1_2 = 30.454e3;
r2_2 = r1_1;

h1 = tf([1/(c1_1*c2_1*r1_1*r2_1)], [1, c1_1*(r1_1+r2_1)/(c1_1*c2_1*r1_1*r2_1), 1/(c1_1*c2_1*r1_1*r2_1)]);
h2 = tf([1/(c1_2*c2_2*r1_2*r2_2)], [1, c1_2*(r1_2+r2_2)/(c1_2*c2_2*r1_2*r2_2), 1/(c1_2*c2_2*r1_2*r2_2)]);
h = h1*h2;

figure(2)
bode(h);
title('Bode Plot of Ideal Filter');

%% task 2 real
c1_1 = 1e-6;
c2_1 = 1.15e-6;
r1_1 = 7.32e3;
r2_1 = r1_1;

c1_2 = 0.1e-6;
c2_2 = 0.68e-6;
r1_2 = 30.38e3;
r2_2 = r1_1;

h1 = tf([1/(c1_1*c2_1*r1_1*r2_1)], [1, c1_1*(r1_1+r2_1)/(c1_1*c2_1*r1_1*r2_1), 1/(c1_1*c2_1*r1_1*r2_1)]);
h2 = tf([1/(c1_2*c2_2*r1_2*r2_2)], [1, c1_2*(r1_2+r2_2)/(c1_2*c2_2*r1_2*r2_2), 1/(c1_2*c2_2*r1_2*r2_2)]);
h = h1*h2;

figure(3)
bode(h);
title('Bode Plot of Filter with Chosen Components');

[mag2, phase2, wout2] = bode(h, 2*2*pi);
[mag20, phase20, wout20] = bode(h, 20*2*pi);
[mag200, phase200, wout200] = bode(h, 200*2*pi);


%% fit curve
mass = [0, 50, 100, 200, 500];
force = 9.81*mass/1000;
v_t1 = [3.3 1.995 1.471 0.983 0.274];
v_t2 = [3.3 1.765 1.636 0.749 0.322];
v_t3 = [3.3 1.982 1.418 0.886 0.242];
v_table = [v_t1; v_t2; v_t3];
v_avg = mean(v_table, 1);
[fit_1, gof1, output1] = fit(transpose(v_avg), transpose(force), 'poly1');
[fit_2, gof2, output2] = fit(transpose(v_avg), transpose(force), 'poly2');
[fit_3, gof3, output3] = fit(transpose(v_avg), transpose(force), 'poly3');

figure(1)
plot(fit_1);
hold on;
plot(fit_2, 'b');
plot(fit_3, 'k');
plot(v_t1, force, '.', 'MarkerSize', 10);
plot(v_t2, force, '.', 'MarkerSize', 10);
plot(v_t3, force, '.', 'MarkerSize', 10);
plot(v_avg, force, '.', 'MarkerSize', 10);

xlabel('Voltage (V)');
ylabel('Force (N)');
title('Task 1 Voltage vs Force');
legend('First Order Polynomial', 'Second Order Polynomial', 'Third Order Polynomial', 'Trial 1', 'Trial 2', 'Trial 3', 'Average');



