function [unstable_bits_mu, unstable_bits_std] = unstable_bits(module_name)
    n_devices = 4;
    n_PUFs = 4;
    n_ROs = 512;
    n_bits = n_ROs * (n_ROs - 1) / 2;
    
    unstable_bits_PUFs = zeros(n_devices,n_PUFs); %row -> different device 
    
    %Read from file
    for i = 0:n_devices-1
        module = module_name;
        file = 'unstable_bits.csv';
        path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
        kria = strcat('kria', string(i), '\');
        fullpath = strcat(path,kria, module,'\data\',file);
    
        data = readtable(fullpath);
        for j = 1:n_PUFs
            unstable_bits_PUFs(i+1,j) = table2array(data(:,j))/n_bits;    
        end 
    end
    
    %Average uniqueness of region given 4 devices:
    unstable_bits_mu = zeros(n_PUFs,1);
    unstable_bits_std = zeros(n_PUFs,1);
    for i = 1:n_PUFs
        unstable_bits_mu(i) = mean(unstable_bits_PUFs(:,i));
        unstable_bits_std(i) = std(unstable_bits_PUFs(:,i),1);
    end 
end
