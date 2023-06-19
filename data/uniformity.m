function [uniformity_inter_mu, uniformity_inter_std] = uniformity(module_name)
    n_devices = 4;
    n_PUFs = 4;
    
    uniformity_PUFs = zeros(n_devices,n_PUFs); %row -> different device 
    
    %Read from file
    for i = 0:n_devices-1
        module = module_name;
        file = 'uniformity.csv';
        path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
        kria = strcat('kria', string(i), '\');
        fullpath = strcat(path,kria, module,'\data\',file);
    
        data = readtable(fullpath);
        for j = 1:n_PUFs
            uniformity_PUFs(i+1,j) = table2array(data(:,j));    
        end 
    end
    
    %Average uniqueness of region given 4 devices:
    uniformity_inter_mu = zeros(n_PUFs,1);
    uniformity_inter_std = zeros(n_PUFs,1);
    for i = 1:n_PUFs
        uniformity_inter_mu(i) = mean(uniformity_PUFs(:,i));
        uniformity_inter_std(i) = std(uniformity_PUFs(:,i),1);
    end

end
