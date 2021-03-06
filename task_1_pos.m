%setting variable names within the data set
pos_stim = readtable('pos1.txt');
pos_stim.Properties.VariableNames{'Var1'}='Point';
pos_stim.Properties.VariableNames{'Var2'}='Frame'; 
pos_stim.Properties.VariableNames{'Var3'}='x';
pos_stim.Properties.VariableNames{'Var4'}='y';

%defining matrices for the positions, velocities and accelerations
pos_mat = [];
vel_mat = [];
acc_mat = [];

%loops through each fish
for n = 0:49
    
    fish_pos = [pos_stim.x((101*n)+(n+1):(101*n)+(n+100)) pos_stim.y((101*n)+(n+1):(101*n)+(n+100))]; %defines position vector
    pos_mat = [pos_mat fish_pos]; %adds position vector to matrix of fish position vectors
    
    %defines the initial velocities and accelerations that we can't obtain a
    % value for as 'NaN'
    fish_vel = [NaN NaN]; 
    fish_acc = [NaN NaN; NaN NaN];
    
    %loops through each position vector, defining its velocity
    for m = 2:100
        vel = fish_pos(m,:) - fish_pos(m-1,:);
        fish_vel = [fish_vel ; vel];
    end
    
    %loops through each velocity vector, defining its acceleration
    for r = 3:100
        acc = fish_vel(r,:) - fish_vel(r-1,:);
        fish_acc = [fish_acc ; acc];
    end
    
    %defines the velocity and acceleration matrices
    vel_mat = [vel_mat fish_vel];
    acc_mat = [acc_mat fish_acc];
end

%plots the position vector of each fish for every frame number 
for i = 1:50
    figure(1);
    plot(pos_mat(:,2*i-1),pos_mat(:,2*i),'o')
    title('The position vectors of each fish over time');
    xlabel('x coordinate');
    ylabel('y coordinate');
    hold on
end
hold off

%plot the mean velocity of the fish against the frame number
figure(2);
plot(pos_stim.Frame(1:100),mean(vel_mat(:,1:2:end),2),pos_stim.Frame(1:100),mean(vel_mat(:,2:2:end),2));
legend('x','y');
title('Mean velocity of the fish over time');
xlabel('Frame Number');
ylabel('Mean Velocity');

%plot the mean acceleration of the fish against the frame number
figure(3);
plot(pos_stim.Frame(1:100),mean(acc_mat(:,1:2:end),2),pos_stim.Frame(1:100),mean(acc_mat(:,2:2:end),2));
legend('x','y');
title('Mean acceleration of the fish over time');
xlabel('Frame Number');
ylabel('Mean Acceleration');

%finding the mean speed at every frame number and where it occurs
speed = sqrt((mean(vel_mat(2:end,1:2:end),2)).^2 + (mean(vel_mat(2:end,2:2:end),2)).^2);
max(max(speed));
index = find(speed == max(max(speed)));