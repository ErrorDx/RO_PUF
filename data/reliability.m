function [reliability_intra_mu, reliability_intra_std] = reliability(module_name)

    n_devices = 4;
    n_PUFs = 4;

    reliability_PUFs = zeros(n_devices,n_PUFs); %row -> different device 
    
    %Read from file
    for i = 0:n_devices-1
        module = module_name;
        file = 'reliability.csv';
        path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
        kria = strcat('kria', string(i), '\');
        fullpath = strcat(path,kria, module,'\data\',file);
    
        data = readtable(fullpath);
        for j = 1:n_PUFs
            reliability_PUFs(i+1,j) = table2array(data(:,j));    
        end 
    end
    
    %Average uniqueness of region given 4 devices:
    reliability_intra_mu = zeros(n_PUFs,1);
    reliability_intra_std = zeros(n_PUFs,1);
    for i = 1:n_PUFs
        reliability_intra_mu(i) = mean(reliability_PUFs(:,i));
        reliability_intra_std(i) = std(reliability_PUFs(:,i),1);
    end 

end