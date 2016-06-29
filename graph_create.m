function [Adj_VL, Adj_VL_2, Adj, Adj_2] = graph_create(connections, connections2, N)
%GRAPH_CREATE gives two random graphs using Erdos-Renyi-Algorithm of n-vehicles and
%finds minimum directed spanning tree of these two graphs
%
% Inputs:
%     N            - number of vehicles
%     connections  - to leader connected vehicles in graph 1
%     connections2 - to leader connected vehicles in graph 2
% Outputs:
%     Adj_VL    - Consensus adjacency matrix graph 1 with virtual leader connections
%     Adj_VL_2  - same as above for graph 2
%     Adj       - Adjacency matrix graph 1 without virtual leader
%     Adj_2     - same as above for graph 2

graphs = figure;
scrsz = get(groot, 'ScreenSize');
set(graphs, 'Name', 'Communication Topologies', 'NumberTitle', 'off','OuterPosition',[0 0 scrsz(3)/2 scrsz(4)/2]);

% 
connect = connect_VL(connections,N);
connect2 = connect_VL(connections2,N);

% call erdosRenyi 
G = graph(erdosRenyi(N,0.6), 'upper', 'OmitSelfLoops');
subplot(2,2,1);
p = plot(G);

G_2 = graph(erdosRenyi(N,0.6),'upper','OmitSelfLoops');
subplot(2,2,3);
p_2 = plot(G_2);

% find minimum spanning tree from the first element in the connected list
% and create directed graph from the root of the tree
[T,pred] = minspantree(G,'Type','forest','Root',connections(1));
highlight(p,T)
rootedTree = digraph(pred(pred~=0),find(pred~=0),[]);
subplot(2,2,2);
plot(rootedTree);

[T_2,pred_2] = minspantree(G_2,'Type','forest','Root',connections2(1));
highlight(p_2,T_2)
rootedTree_2 = digraph(pred_2(pred_2~=0),find(pred_2~=0),[]);
subplot(2,2,4);
plot(rootedTree_2);

% creates adjacency matrixes
Adj = full(rootedTree.adjacency)'
Adj_VL = [Adj connect; zeros(1,N+1)]

Adj_2 = full(rootedTree_2.adjacency)'
Adj_VL_2 = [Adj_2 connect2; zeros(1,N+1)]

end

function [Adj_lColumn] = connect_VL(connections,N)
% creates the last column (connections to the VL) of a Adj depending on the
% connections specified
Adj_lColumn = zeros(N,1);
for i=1:1:length(connections)
    Adj_lColumn(connections(i)) = 1;
end
end

function [Adj] = erdosRenyi(N,p)
% creates random adjacency matrix
Adj = triu(rand(N)<p,1);
Adj = Adj+Adj';
end


