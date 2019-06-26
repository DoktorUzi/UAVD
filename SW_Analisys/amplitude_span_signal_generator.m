clear all
close all
clc

workspace = 'D:\Mega\Skunkworks\X-plane\sine_sweeps_experiments';

A_min = 0.01;
A_max = 0.30;
A_res = 0.01;
ome_min = 0.3;
ome_max = 12;

A_values = A_min:A_res:A_max;

for i = 1:length(A_values)

    out = excitation_signals(A_values(i), ome_min, ome_max);

    excit_signal = [zeros(1,10*1/0.02), out];

    save(strcat(workspace,'/excit_sw_A',num2str(A_values(i)*100)));

end