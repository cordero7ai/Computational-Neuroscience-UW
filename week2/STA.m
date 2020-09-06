close all; clear all; clc;

function [ sta ] = compute_sta2( stim, rho, num_timesteps )
%COMPUTE_STA Calculates the spike-triggered average for a neuron that
%            is driven by a stimulus defined in stim. The spike-
%            triggered average is computed over num_timesteps timesteps.
    sta = zeros(num_timesteps, 1);

    % This command finds the indices of all of the spikes that occur
    % after 300 ms into the recording.
    spike_times = find(rho(num_timesteps+1:end)) + num_timesteps;

    % Fill in this value. Note that you should not count spikes that occur
    % before 300 ms into the recording.
    num_spikes = size(spike_times,1);
    
    for i=1:num_spikes
            AllWindows=stim(spike_times(i)-num_timesteps+1:spike_times(i));
            sta = sta + AllWindows;
        end
    
    sta=sta/num_spikes;
end



load('c1p8.mat');

% Fill in these values
sampling_period = 2; % in ms
num_timesteps = 150;

sta = compute_sta2(stim, rho, num_timesteps);

time = -sampling_period*(num_timesteps-1):sampling_period:0; % in ms

figure(1);
plot(time, sta);
xlabel('Time (ms)');
ylabel('Stimulus');
title('Spike-Triggered Average');

saveas(gcf,'spikeMATLAB.png') 