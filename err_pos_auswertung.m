err_sim = error_i_pos.data(:,:,end)
alpha = 3;
gamma = 10;
N = 3;

L = [2 -1 -1; -1 1 0; -1 0 1];

err = [20 20 20 40 40 40 60 60 60]';

calc_err = kron(gamma*L+eye(3)*alpha,eye(3))^(-1)*alpha*err

err_true = mean([20 40 60])

sum(abs(err_sim(1,:) - err_true))