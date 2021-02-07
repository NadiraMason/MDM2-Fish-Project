%setting variable names within the data set
neg_stim = readtable('neg1.txt');
neg_stim.Properties.VariableNames{'Var1'}='Point';
neg_stim.Properties.VariableNames{'Var2'}='Frame'; 
neg_stim.Properties.VariableNames{'Var3'}='x';
neg_stim.Properties.VariableNames{'Var4'}='y';

%defining matrices for the velocities and accelerations
vel_mat = [];
acc_mat = [];

%loops through each fish
for n = 0:49
    
    fish_pos = [neg_stim.x((50*n)+(n+1):(50*n)+(n+50)) neg_stim.y((50*n)+(n+1):(50*n)+(n+50))]; %defines position vector
    
    %defines the initial velocities and accelerations
    fish_vel = [0 0]; 
    fish_acc = [0 0];
    
    %loops through each position vector, defining its velocity
    for m = 2:50
        vel = fish_pos(m,:) - fish_pos(m-1,:);
        fish_vel = [fish_vel ; vel];
    end
    
    %loops through each velocity vector, defining its acceleration
    for r = 2:50
        acc = fish_vel(r,:) - fish_vel(r-1,:);
        fish_acc = [fish_acc ; acc];
    end
    
    %defines the velocity and acceleration matrices
    vel_mat = [vel_mat fish_vel];
    acc_mat = [acc_mat fish_acc];
end

%plot(neg_stim.Frame(1:50),mean(vel_mat(:,1:2:end),2),neg_stim.Frame(1:50),mean(vel_mat(:,2:2:end),2));
plot(neg_stim.Frame(1:50),mean(acc_mat(:,1:2:end),2),neg_stim.Frame(1:50),mean(acc_mat(:,2:2:end),2));

legend('x','y');