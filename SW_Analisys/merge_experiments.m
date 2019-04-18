close all;
clear;
clc;
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

col=[];lat=[];lon=[];ped=[];
p=[];q=[];r=[];
phi=[];theta=[];psi=[];
p_x=[];p_y=[];p_z=[];
v_x=[];v_y=[];v_z=[];
    
for i=1:3
    
    load(['/home/luca/MEGA_Skunkworks/X-plane/Simulation_Log_Example/20190415_collectiveTailSteps_parts/20190415_collectiveTailStepsPart' num2str(i) '.mat']);
    %inputs
    col=[logsout.find("y_collectiveMain_1").Values.data;col];
    lat=[logsout.find("y_aileron_1").Values.data;lat];
    lon=[logsout.find("y_elevator_1").Values.data;lon];
    ped=[logsout.find("y_collectiveTail_1").Values.data;ped];
    %outputs
    p=[logsout.find("y_p_1").Values.data;p]; %roll rate [rad/s]
    q=[logsout.find("y_q_1").Values.data;q]; %pitch rate [rad/s]
    r=[logsout.find("y_r_1").Values.data;r]; %yaw rate [rad/s]
    %
    phi=[logsout.find("y_roll_1").Values.data;phi]; %roll [deg]
    theta=[logsout.find("y_pitch_1").Values.data;theta]; %pitch [deg]
    psi=[logsout.find("y_heading_1").Values.data;psi]; %yaw [deg]
    %
    p_x=[logsout.find("y_Px_1").Values.data;p_x]; %[m];
    p_y=[logsout.find("y_Py_1").Values.data;p_y]; %[m];
    p_z=[logsout.find("y_Pz_1").Values.data;p_z]; %[m];
    %
    v_x=[logsout.find("y_Vx_1").Values.data;v_x]; %[m/s];
    v_y=[logsout.find("y_Vy_1").Values.data;v_y]; %[m/s];
    v_z=[logsout.find("y_Vz_1").Values.data;v_z]; %[m/s];
    
    dim(i)=length(logsout.find("y_collectiveMain_1").Values.data);
    clear logsout
    
end


%% from array to timeseries
dt=0.01;
t=0:dt:(length(col)-1)*dt;
col_ts=timeseries(col,t,'Name','y_collectiveMain_1');col_ts=setuniformtime(col_ts,'Interval',0.01);
lat_ts=timeseries(lat,t,'Name','y_aileron_1');lat_ts=setuniformtime(lat_ts,'Interval',0.01);
lon_ts=timeseries(lon,t,'Name','y_elevator_1');lon_ts=setuniformtime(lon_ts,'Interval',0.01);
ped_ts=timeseries(ped,t,'Name','y_collectiveTail_1');ped_ts=setuniformtime(ped_ts,'Interval',0.01);

p_ts=timeseries(p,t,'Name','y_p_1');p_ts=setuniformtime(p_ts,'Interval',0.01);
q_ts=timeseries(q,t,'Name','y_q_1');q_ts=setuniformtime(q_ts,'Interval',0.01);
r_ts=timeseries(r,t,'Name','y_r_1');r_ts=setuniformtime(r_ts,'Interval',0.01);

phi_ts=timeseries(phi,t,'Name','y_roll_1');phi_ts=setuniformtime(phi_ts,'Interval',0.01);
theta_ts=timeseries(theta,t,'Name','y_pitch_1');theta_ts=setuniformtime(theta_ts,'Interval',0.01);
psi_ts=timeseries(psi,t,'Name','y_heading_1');psi_ts=setuniformtime(psi_ts,'Interval',0.01);

p_x_ts=timeseries(p_x,t,'Name','y_Px_1');p_x_ts=setuniformtime(p_x_ts,'Interval',0.01);
p_y_ts=timeseries(p_y,t,'Name','y_Py_1');p_y_ts=setuniformtime(p_y_ts,'Interval',0.01);
p_z_ts=timeseries(p_z,t,'Name','y_Pz_1');p_z_ts=setuniformtime(p_z_ts,'Interval',0.01);

v_x_ts=timeseries(v_x,t,'Name','y_Vx_1');v_x_ts=setuniformtime(v_x_ts,'Interval',0.01);
v_y_ts=timeseries(v_y,t,'Name','y_Vy_1');v_y_ts=setuniformtime(v_y_ts,'Interval',0.01);
v_z_ts=timeseries(v_z,t,'Name','y_Vz_1');v_z_ts=setuniformtime(v_z_ts,'Interval',0.01);
%% Plot divided

% figure;hold on;
% plot(col_ts.time(1:dim(1)),col_ts.data(1:dim(1)));
% plot(col_ts.time(dim(1)+1:dim(1)+dim(2)),col_ts.data(dim(1)+1:dim(1)+dim(2)));
% plot(col_ts.time(dim(1)+dim(2)+1:end),col_ts.data(dim(1)+dim(2)+1:end));

%% Save
%%%%save('CollectiveTailSteps.mat','col_ts','lat_ts','lon_ts','ped_ts','p_ts','q_ts','r_ts','phi_ts','theta_ts','psi_ts','p_x_ts','p_y_ts','p_z_ts','v_x_ts','v_y_ts','v_z_ts');