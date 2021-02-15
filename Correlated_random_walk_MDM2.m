clc;    % Clear the command window.
clearvars;
close all;  % Close all figures.
workspace;  % Make sure the workspace panel is showing.
format compact;

maxNumberOfSteps = 400;
radius = 5; %Radius of the circle/angle

x = zeros(1, maxNumberOfSteps); %Creates a zero matrix of dimeansion (1 x maxNumerOfSteps)
y = zeros(1, maxNumberOfSteps); %Creates a zero matrix of dimeansion (1 x maxNumerOfSteps)

for i = 2 : maxNumberOfSteps %Between 2 and the max number of steps 
  angle(i) = angle(i-1) + 10 * rand(1) - 7; % Correlated (the 2nd part of the equation determines the level or correlation) 
  x(i) = x(i - 1) + radius * cosd(angle(i)); %In degrees - easier than radians 
  y(i) = y(i - 1) + radius * sind(angle(i));
  plot(x, y, 'b', 'LineWidth', 1, 'MarkerSize', 5);
  grid on;
end
