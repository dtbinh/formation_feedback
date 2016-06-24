function [Adj_und] = adj_und(Adj)
%takes adjacency matrix with and creates a undirect communication
%topology excluding virtual leader
%
% Inputs:
%   Adj     - adjacency matrix
% Outputs:
%   Adj_und - corresponding undirected adjacency matrix

K = size(Adj,1);
A_noVL = Adj(1:K-1,1:K-1);

Adj_und = [A_noVL + A_noVL' Adj(1:K-1,K); zeros(1,K)];

end

