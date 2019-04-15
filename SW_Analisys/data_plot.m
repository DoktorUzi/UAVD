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
%load('/home/luca/MEGA_Skunkworks/X-plane/Simulation_Log_Example/20190411_advanceAndZigZag.mat') %mettere indirizzo

% filename = ['..//MEGA_Skunkworks//', ...
%            'X-plane/Simulation_Log_Example/20190402_collectiveMainStep_1.mat'];
% dataset = load(filename);

% go to folders up the hierarchy
upUpFolder = fileparts(fileparts(pwd));

filename = fullfile(upUpFolder, 'MEGA_Skunkworks','X-plane','Simulation_Log_Example','20190402_collectiveMainStep_1.mat');

load(filename);
%% Signals

%%%----Inputs----
try
col_ts=logsout.find("u_collectiveMain_1").Values;
lat_ts=logsout.find("u_aileron_1").Values;
lon_ts=logsout.find("u_elevator_1").Values;
ped_ts=logsout.find("u_collectiveTail_1").Values;
catch
end
%%%----Outputs----

%Body rotational velocity
 
p_ts=logsout.find("y_p_1").Values; %roll rate [rad/s]
q_ts=logsout.find("y_q_1").Values; %pitch rate [rad/s]
r_ts=logsout.find("y_r_1").Values; %yaw rate [rad/s]

%Body orientation (Euler Angles)

phi_ts=logsout.find("y_roll_1").Values; %roll [deg]
theta_ts=logsout.find("y_pitch_1").Values; %pitch [deg]
psi_ts=logsout.find("y_heading_1").Values; %yaw [deg]

%Inertial Position

p_x=logsout.find("y_Px_1").Values; %[m];
p_y=logsout.find("y_Py_1").Values; %[m];
p_z=logsout.find("y_Pz_1").Values; %[m];

%Inertial Speed

v_x=logsout.find("y_Vx_1").Values; %[m/s];
v_y=logsout.find("y_Vy_1").Values; %[m/s];
v_z=logsout.find("y_Vz_1").Values; %[m/s];

%% Plot

close all

%figure;plot(col_ts);ax(1)=gca;grid;
%figure;plot(lat_ts);ax(2)=gca;grid;
%figure;plot(lon_ts);ax(3)=gca;grid;
%figure;plot(lat_ts);ax(4)=gca;grid;

figure;
subplot(1,3,1);plot(p_ts);ax(5)=gca;grid;
subplot(1,3,2);plot(q_ts);ax(6)=gca;grid;
subplot(1,3,3);plot(r_ts);ax(7)=gca;grid;

figure;
subplot(1,3,1);plot(phi_ts);ax(8)=gca;grid;
subplot(1,3,2);plot(theta_ts);ax(9)=gca;grid;
subplot(1,3,3);plot(psi_ts);ax(10)=gca;grid;

figure;
subplot(1,3,1);plot(p_x);ax(11)=gca;grid;
subplot(1,3,2);plot(p_y);ax(12)=gca;grid;
subplot(1,3,3);plot(p_z);ax(13)=gca;grid;

figure;
subplot(1,3,1);plot(v_x);ax(11)=gca;grid;
subplot(1,3,2);plot(v_y);ax(12)=gca;grid;
subplot(1,3,3);plot(v_z);ax(13)=gca;grid;

linkaxes(ax,'x');
%% 