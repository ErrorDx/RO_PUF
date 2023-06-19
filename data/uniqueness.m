function [uniqueness_inter_mu, uniqueness_inter_std] = uniqueness(module_name)
n_devices = 4;
n_PUFs = 4;

uniqueness_PUFs = zeros(n_devices,n_PUFs); %row -> different device 

%Read from file
for i = 0:n_devices-1
    module = module_name;
    file = 'uniqueness_indiv.csv';
    path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
    kria = strcat('kria', string(i), '\');
    fullpath = strcat(path,kria, module,'\data\',file);

    data = readtable(fullpath);
    for j = 1:n_PUFs
        uniqueness_PUFs(i+1,j) = table2array(data(:,j));    
    end 
end

%Average uniqueness of region given 4 devices:
uniqueness_inter_mu = zeros(n_PUFs,1);
uniqueness_inter_std = zeros(n_PUFs,1);
for i = 1:n_PUFs
    uniqueness_inter_mu(i) = mean(uniqueness_PUFs(:,i));
    uniqueness_inter_std(i) = std(uniqueness_PUFs(:,i),1);
end 