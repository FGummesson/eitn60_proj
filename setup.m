[d, Fs] = audioread('Neil_Armstrong.ogg');
delta = 10;
u = [zeros(delta, 1); d];
%%

M = 8;
lms_mu = 0.002;

[e_lms, w_lms] = lms(lms_mu, M, u, d);

nlms_mu = 0.002;
a = 1;
[e_nlms, w_nlms] = nlms(nlms_mu, M, u, d, a);

leaky_mu = 0.02;
alpha = 0.99;
[e_leaky, w_leaky] = leaky_lms(lms_mu, alpha, M, u, d);