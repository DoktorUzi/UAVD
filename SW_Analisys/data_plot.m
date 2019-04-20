close all;
clear;
format short g
%% Plot default 
% set(0,'DefaultLineLinewidth',2)%2
% set(0,'DefaultAxesFontSize',20)%20
% % set(0,'DefaultAxesXGrid','on',...
% % 'DefaultAxesYGrid','on',...
% % 'DefaultAxesZGrid','on')
% set(0,'DefaultTextInterpreter', 'latex')
% % warning('off','MATLAB:handle_graphics:exceptions:SceneNode') %no warning for error updating text
%% Load Data
load('/home/luca/MEGA_Skunkworks/X-plane/Simulation_Log_Example/20190415_collectiveMainSteps.mat');
%load('/home/luca/MEGA_Skunkworks/X-plane/Simulation_Log_Example/20190415_collectiveTailSteps.mat');


%% Extract from Signals

%%%%----Inputs----
 
col_ts=logsout.find("y_collectiveMain_1").Values;
lat_ts=logsout.find("y_aileron_1").Values;
lon_ts=logsout.find("y_elevator_1").Values;
ped_ts=logsout.find("y_collectiveTail_1").Values;
 
%%%%----Outputs----

%%%------Body rotational velocity
  
p_ts=logsout.find("y_p_1").Values; %roll rate [rad/s]
q_ts=logsout.find("y_q_1").Values; %pitch rate [rad/s]
r_ts=logsout.find("y_r_1").Values; %yaw rate [rad/s]

%%%------Body orientation (Euler Angles)

phi_ts=logsout.find("y_roll_1").Values; %roll [deg]
theta_ts=logsout.find("y_pitch_1").Values; %pitch [deg]
psi_ts=logsout.find("y_heading_1").Values; %yaw [deg]
 
%%%------Inertial Position

p_x_ts=logsout.find("y_Px_1").Values; %[m];
p_y_ts=logsout.find("y_Py_1").Values; %[m];
p_z_ts=logsout.find("y_Pz_1").Values; %[m];

%%%-------Inertial Speed

v_x_ts=logsout.find("y_Vx_1").Values; %[m/s];
v_y_ts=logsout.find("y_Vy_1").Values; %[m/s];
v_z_ts=logsout.find("y_Vz_1").Values; %[m/s];

%% Plot

% close all
% 
% figure;plot(col_ts);ax(1)=gca;grid;
% figure;plot(lat_ts);ax(2)=gca;grid;
% figure;plot(lon_ts);ax(3)=gca;grid;
% figure;plot(ped_ts);ax(4)=gca;grid;
% 
% figure;
% subplot(1,3,1);plot(p_ts);ax(5)=gca;grid;
% subplot(1,3,2);plot(q_ts);ax(6)=gca;grid;
% subplot(1,3,3);plot(r_ts);ax(7)=gca;grid;
% 
% figure;
% subplot(1,3,1);plot(phi_ts);ax(8)=gca;grid;
% subplot(1,3,2);plot(theta_ts);ax(9)=gca;grid;
% subplot(1,3,3);plot(psi_ts);ax(10)=gca;grid;
% 
% figure;
% subplot(1,3,1);plot(p_x_ts);ax(11)=gca;grid;
% subplot(1,3,2);plot(p_y_ts);ax(12)=gca;grid;
% subplot(1,3,3);plot(p_z_ts);ax(13)=gca;grid;
% 
% figure;
% subplot(1,3,1);plot(v_x_ts);ax(11)=gca;grid;
% subplot(1,3,2);plot(v_y_ts);ax(12)=gca;grid;
% subplot(1,3,3);plot(v_z_ts);ax(13)=gca;grid;
% 
% linkaxes(ax,'x');
%% Plot test collettivo 20190415_collectiveMainSteps

figure; hold on;
subplot(3,1,1);plot(col_ts);ax(1)=gca;grid;
subplot(3,1,2);plot(ped_ts);ax(2)=gca;grid;
subplot(3,1,3);plot(r_ts);ax(3)=gca;grid;

linkaxes(ax,'x');
%%

%%Synchronization
% [ped_ts,r_ts] = synchronize(ped_ts,r_ts,'uniform',...
% 'interval',0.01);

% Compute transfer function
Fs = 1/0.01;
figure;hold on;
subplot(2,1,1);plot(col_ts.data(1:2000));
subplot(2,1,2);plot(r_ts.data(1:2000));
%tfestimate(col_ts.data(1000:2000),r_ts.data(1000:2000),[],[],[],Fs);
