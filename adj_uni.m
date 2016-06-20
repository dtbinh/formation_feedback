function [y] = adj_uni(u)
%Takes adjacency matrix with VL and creates a unidirect communication
%topology
N = size(u,1);
A_ohne = u(1:N-1,1:N-1);

y = [A_ohne+A_ohne' u(1:N-1,N); zeros(1,N)];

end

