function sig_faded = excitation_signals(A, w_min, w_max, Ts)

% clc
% clear all
% close all
%% Tishler Method

%w_min=0.3;
%w_max=12;
C1=4.0;
C2=0.0187;
Trec=90;
%A=1;

xmin=0;
xmax=Trec;

%K=C2*(exp(C1*s/Trec)-1);
x = @(s) w_min+(C2*(exp(C1*s/Trec)-1))*(w_max-w_min); 
Fs=1/Ts;
upper_limit = xmin:1/Fs:xmax;%linspace(xmin, xmax);

xval = arrayfun(@(uplim) A*sin(integral(x, 0, uplim, 'ArrayValued',true)), upper_limit);


%% Fade In 

% fade-in and fade-out window function handles
 
fade_windows = { @(N)(hanning(N).^2) @(N)(chebwin(N,100)) }; 
sig_faded=fade(xval,Fs,[10000 0],fade_windows);

end
%%
% figure(1);
% subplot(211)
% plot(upper_limit, xval)
% subplot(212)
% plot(upper_limit, sig_faded)
% grid