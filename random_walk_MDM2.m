clc;    % Clear the command window.
clearvars;
close all;  % Close all figures.
workspace;  % Make sure the workspace panel is showing.
format compact;

n = 50;

% Getting the random step directions in advance.
dx = randi([0 20],1, n)-10;
dy = randi([0 20],1, n)-10;
% Starting location.
x = zeros(1, n);
y = zeros(1, n);
%Steps in a random direction.
for i = 2 : n
	% Walk in the x direction.
	x(i) = x(i-1) + dx(i);
	% Walk in the y direction.
	y(i) = y(i-1) + dy(i);
	% Plotting the walk.
 	plot(x(1:i), y(1:i), 'b-', 'LineWidth', 2);
    grid on;
end












