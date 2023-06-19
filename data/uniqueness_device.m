function [uniqueness_inter_mu, uniqueness_inter_std] = uniqueness_device(module_name)
    n_devices = 4;
    n_PUFs = 4;
    n_ROs = 512;
    n_bits = n_ROs*(n_ROs-1)/2;
    
    bits_PUFs = zeros(n_devices,n_PUFs,n_bits); %row -> different device 
    
    %Read from file
    for i = 0:n_devices-1
        module = module_name;
        file = 'CRP_space.csv';
        path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
        kria = strcat('kria', string(i), '\');
        fullpath = strcat(path,kria, module,'\data\',file);
    
        data = readtable(fullpath);
        for j = 1:n_PUFs
            bits_PUFs(i+1,j,:) = table2array(data(:,j));    
        end 
    end
    
    uniqueness_device_mu = zeros(n_PUFs,1);
    
    for k = 1:n_PUFs
        for i = 1:n_devices
            for j = i+1:n_devices
                uniqueness_device_mu(k) = uniqueness_device_mu(k) + sum(xor(bits_PUFs(i,k,:),bits_PUFs(j,k,:)))/n_bits;
            end
        end
    end 
    
    uniqueness_device_mu = uniqueness_device_mu * 2 /(n_devices*(n_devices-1));
    
    uniqueness_device_i_mu = zeros(n_devices,n_PUFs);
    
    for k = 1:n_PUFs
        for i = 1:n_devices
            for j = 1:n_devices
                if i ~= j
                    uniqueness_device_i_mu(i,k) = uniqueness_device_i_mu(i,k) + sum(xor(bits_PUFs(i,k,:),bits_PUFs(j,k,:)))/n_bits;
                end 
            end
        end
    end 
    uniqueness_device_i_mu = uniqueness_device_i_mu / (n_devices - 1);
    
    %Average uniqueness of region given 4 devices:
    uniqueness_inter_mu = zeros(n_PUFs,1);
    uniqueness_inter_std = zeros(n_PUFs,1);
    for i = 1:n_PUFs
        uniqueness_inter_mu(i) = mean(uniqueness_device_i_mu(:,i));
        uniqueness_inter_std(i) = std(uniqueness_device_i_mu(:,i),1);
    end 
end 

