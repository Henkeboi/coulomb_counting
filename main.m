clearvars;
% Ørjan data
nominal_capacity = 6528.6; % mAh
P = 2; % Parallel
S = 144; % Series
OCV_lut = [ 3.0316, 3.2440, 3.3374, 3.4022, 3.4521, 3.4930, 3.5277, 3.5577, 3.5840, 3.6074, 3.6284, 3.6473, 3.6642, 3.6782, 3.6876, 3.6918, 3.6938, 3.6955, 3.6967, 3.6977, 3.6988, 3.6999, 3.7010, 3.7023, 3.7037, 3.7056, 3.7083, 3.7119, 3.7155, 3.7188, 3.7219, 3.7249, 3.7277, 3.7304, 3.7331, 3.7358, 3.7385, 3.7411, 3.7437, 3.7460, 3.7481, 3.7502, 3.7521, 3.7540, 3.7560, 3.7579, 3.7598, 3.7617, 3.7635, 3.7652, 3.7668, 3.7683, 3.7698, 3.7713, 3.7729, 3.7745, 3.7760, 3.7774, 3.7787, 3.7798, 3.7809, 3.7817, 3.7828, 3.7839, 3.7848, 3.7857, 3.7865, 3.7873, 3.7881, 3.7889, 3.7898, 3.7906, 3.7915, 3.7924, 3.7934, 3.7943, 3.7953, 3.7964, 3.7974, 3.7985, 3.7995, 3.8007, 3.8018, 3.8030, 3.8042, 3.8053, 3.8067, 3.8080, 3.8093, 3.8107, 3.8121, 3.8135, 3.8149, 3.8164, 3.8179, 3.8195, 3.8210, 3.8227, 3.8244, 3.8262, 3.8279, 3.8297, 3.8315, 3.8333, 3.8352, 3.8373, 3.8394, 3.8415, 3.8437, 3.8459, 3.8482, 3.8506, 3.8531, 3.8557, 3.8584, 3.8613, 3.8642, 3.8672, 3.8703, 3.8737, 3.8772, 3.8809, 3.8849, 3.8891, 3.8936, 3.8980, 3.9024, 3.9066, 3.9105, 3.9140, 3.9173, 3.9204, 3.9234, 3.9264, 3.9293, 3.9322, 3.9351, 3.9380, 3.9409, 3.9438, 3.9467, 3.9496, 3.9525, 3.9553, 3.9580, 3.9607, 3.9632, 3.9656, 3.9678, 3.9700, 3.9719, 3.9738, 3.9757, 3.9778, 3.9798, 3.9820, 3.9844, 3.9872, 3.9901, 3.9934, 3.9969, 4.0012, 4.0057, 4.0109, 4.0171, 4.0238, 4.0316, 4.0402, 4.0492, 4.0579, 4.0655, 4.0716, 4.0767, 4.0806, 4.0834, 4.0855, 4.0874, 4.0896, 4.0921, 4.0954, 4.0990, 4.1029, 4.1070, 4.1113, 4.1155, 4.1200, 4.1244, 4.1288, 4.1333, 4.1378, 4.1423, 4.1468, 4.1513, 4.1559, 4.1605, 4.1652, 4.1698, 4.1745, 4.1793, 4.1842, 4.1891];

SOC_lut = [1.355e-05, 0.005, 0.01, 0.015, 0.02, 0.025, 0.03, 0.035, 0.04, 0.045, 0.05, 0.055, 0.06, 0.065, 0.07, 0.075, 0.08, 0.085, 0.09, 0.095, 0.1, 0.105, 0.11, 0.115, 0.12, 0.125, 0.13, 0.135, 0.14, 0.145, 0.15, 0.155, 0.16, 0.165, 0.17, 0.175, 0.18, 0.185, 0.19, 0.195, 0.2, 0.205, 0.21, 0.215, 0.22, 0.225, 0.23, 0.235, 0.24, 0.245, 0.25, 0.255, 0.26, 0.265, 0.27, 0.275, 0.28, 0.285, 0.29, 0.295, 0.3, 0.305, 0.31, 0.315, 0.32, 0.325, 0.33, 0.335, 0.34, 0.345, 0.35, 0.355, 0.36, 0.365, 0.37, 0.375, 0.38, 0.385, 0.39, 0.395, 0.4, 0.405, 0.41, 0.415, 0.42, 0.425, 0.43, 0.435, 0.44, 0.445, 0.45, 0.455, 0.46, 0.465, 0.47, 0.475, 0.48, 0.485, 0.49, 0.495, 0.5, 0.505, 0.51, 0.515, 0.52, 0.525, 0.53, 0.535, 0.54, 0.545, 0.55, 0.555, 0.56, 0.565, 0.57, 0.575, 0.58, 0.585, 0.59, 0.595, 0.6, 0.605, 0.61, 0.615, 0.62, 0.625, 0.63, 0.635, 0.64, 0.645, 0.65, 0.655, 0.66, 0.665, 0.67, 0.675, 0.68, 0.685, 0.69, 0.695, 0.7, 0.705, 0.71, 0.715, 0.72, 0.725, 0.73, 0.735, 0.74, 0.745, 0.75, 0.755, 0.76, 0.765, 0.77, 0.775, 0.78, 0.785, 0.79, 0.795, 0.8, 0.805, 0.81, 0.815, 0.82, 0.825, 0.83, 0.835, 0.84, 0.845, 0.85, 0.855, 0.86, 0.865, 0.87, 0.875, 0.88, 0.885, 0.89, 0.895, 0.9, 0.905, 0.91, 0.915, 0.92, 0.925, 0.93, 0.935, 0.94, 0.945, 0.95, 0.955, 0.96, 0.965, 0.97, 0.975, 0.98, 0.985, 0.99, 0.995, 1];

% data = zeros(0, 0);
% load_cycles = zeros(0, 0);
% ts = true;
% if ts
%     % Read load cycle from csv file with ts voltage
%     data = csvread('csv/data_ts.csv'); % Data format: time, soc, cc, v, i
%     data = [data(1:end, 1), data(1:end, 5), data(1:end, 2), data(1:end, 4)];
% else
%     % Read load cycle from csv file with ams voltage
%     data = csvread('csv/data_ams.csv'); % Data format: time, soc, cc, average v, i
%     data = [data(1:end, 1), data(1:end, 5), data(1:end, 2), S * data(1:end, 4)];
% end
% load_cycles = zeros(size(data, 1), 2);
% load_cycles(1, 2) = data(1, 2);
% for i = 2:size(data, 1)
%     load_cycles(i, 1) = data(i, 1) - data(i - 1, 1);
%     load_cycles(i, 2) = data(i, 2);
% end
% 

% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 8);

% Specify range and delimiter
opts.DataLines = [9, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["Times", "VoltageV", "CurrentA", "PowerW", "Temp_IVTmodC", "ErrRateCAN1", "ErrRateCAN2", "VarName8"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "VarName8", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "VarName8", "EmptyFieldRule", "auto");

% Import the data
data = readtable("csv/endu_merge.log", opts); % Time, Voltage, Current, Power, Temp, ErrRate1, ErrRate2
data = table2array(data(1:end, 1:5));

load_cycles = zeros(size(data, 1), 2);
load_cycles(1, 2) = data(1, 2);
for i = 2:size(data, 1)
    load_cycles(i, 1) = data(i, 1) - data(i - 1, 1);
    load_cycles(i, 2) = data(i, 3);
end

% % Sim
SOC = 0.92; % Starting SOC on a bad day
V = 0;
prev_iR1 = 0;
results = zeros(size(load_cycles, 1), 4);
for j = 1 : size(load_cycles, 1)
    sample_length =  load_cycles(j, 1);
    i = load_cycles(j, 2);

    % Calculate current used for diffusion voltage calculation
    R1 = 0.001;
    C1 = 0.001;
    iR1 = exp(-sample_length / (R1 * C1)) * prev_iR1 + (1 - exp(-sample_length / (R1 * C1))) * i;
    
    % Calculate terminal voltage
    [value index] = min(abs(SOC_lut - SOC));
    R0 = .000001;
    V = (OCV_lut(index) - (i * R0) - (R1 * prev_iR1));

    % Solve and discretize d z(t) / dt = -n(t) * i(t) / Q where n(t) is the coloumbic efficiency and Q, total capacity, is given in seconds.
    P = 2;
    Q = 6528.6 * 3.6 * P; % Nominal capacity from mAh to As
    n = 1;
    if i < 0
        n = 0.7; % Assume lower coloumbic efficiency when charging
    end
    SOC = SOC - (n * sample_length * i / Q);
    prev_iR1 = iR1;
    results(j, 1) = sample_length;
    results(j, 2) = 100 * SOC;
    results(j, 3) = i;
    results(j, 4) = V * S - 8; % TODO model hystersis 
end
csvwrite("csv/results.csv", results);
