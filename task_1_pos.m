%setting variable names within the data set
pos_stim = readtable('pos1.txt');
pos_stim.Properties.VariableNames{'Var1'}='Point';
pos_stim.Properties.VariableNames{'Var2'}='Frame'; 
pos_stim.Properties.VariableNames{'Var3'}='x';
pos_stim.Properties.VariableNames{'Var4'}='y';

%defining matrices for the velocities and accelerations
vel_mat = [];
acc_mat = [];

%loops through each fish
for n = 0:49
    
    fish_pos = [pos_stim.x((101*n)+(n+1):(101*n)+(n+101)) pos_stim.y((101*n)+(n+1):(101*n)+(n+101))]; %defines position vector
    
    %defines the initial velocities and accelerations
    fish_vel = [0 0];
    fish_acc = [0 0];
    
    %loops through each position vector, defining its velocity
    for m = 2:101
        vel = fish_pos(m,:) - fish_pos(m-1,:);
        fish_vel = [fish_vel ; vel];
    end
    
    
    %loops through each velocity vector, defining its acceleration
    for r = 2:101
        acc = fish_vel(r,:) - fish_vel(r-1,:);
        fish_acc = [fish_acc ; acc];
    end
    
    %defines the velocity and acceleration matrices
    vel_mat = [vel_mat fish_vel];
    acc_mat = [acc_mat fish_acc];
end


%plot(pos_stim.Frame(1:101),mean(vel_mat(:,1:2:end),2),pos_stim.Frame(1:101),mean(vel_mat(:,2:2:end),2));
plot(pos_stim.Frame(1:101),mean(acc_mat(:,1:2:end),2),pos_stim.Frame(1:101),mean(acc_mat(:,2:2:end),2));

legend('x','y');