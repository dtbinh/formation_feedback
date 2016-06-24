function [Adj] = adjacency_weighted(graph)
%creates the adjacency matrix out of a graph with weights
% Input:
%   graph   - graph
% Output:
%   Adj     - corresponding adjacency matrix

nn = numnodes(graph);
[s,t] = findedge(graph);
Adj = sparse(s,t,graph.Edges.Weight,nn,nn);
% transpose because of Wei Ren definition
Adj = full(Adj');

end

