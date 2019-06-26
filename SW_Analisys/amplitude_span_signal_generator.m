
workspace = 'D:\Mega\Skunkworks\X-plane\sine_sweeps_experiments';
% workspace = 'D:\Mega\Skunkworks\X-plane\sine_sweeps_experiments';

A_min = 0.01;
A_max = 0.30;
A_res = 0.01;
ome_min = 0.3;
ome_max = 12;
Ts = 0.02;

A_values = A_min:A_res:A_max;

for i = 1:length(A_values)

    out = excitation_signals(A_values(i), ome_min, ome_max, Ts);

    excit_signal.values = [zeros(1,10*1/0.02), out];
    excit_signal.time = (Ts:Ts:Ts*length(excit_signal.values));
    excit_signal.Amplitude = A_values(i);
    excit_signal.Ts = Ts;
    excit_signal.ome_min = ome_min;
    excit_signal.ome_max = ome_max;
    
    save(strcat(workspace,'/excit_sw_A',num2str(A_values(i),'%2.3f'),'_ome_',num2str(ome_min),'_',num2str(ome_max),'.mat'),'excit_signal');

end

clear all
close all
clc
