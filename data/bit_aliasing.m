function [bit_alias_inter_mu, bit_alias_inter_std, min_entropy_mu, min_entropy_std] = bit_aliasing(module_name)
    n_devices = 4;
    n_PUFs = 4;
    n_ROs = 512;
    n_bits = n_ROs*(n_ROs-1)/2;
    
    bits_matrix_PUFs = zeros(n_devices,n_PUFs,n_bits); %row -> different device 
    
    %Read from file
    for i = 0:n_devices-1
        module = module_name;
        file = 'CRP_space.csv';
        path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
        kria = strcat('kria', string(i), '\');
        fullpath = strcat(path,kria, module,'\data\',file);
    
        data = readtable(fullpath);
        for j = 1:n_PUFs
            bits_matrix_PUFs(i+1,j,:) = table2array(data(:,j));    
        end 
    end
    
    bit_alias_PUFs = zeros(n_PUFs, n_bits);
    for j = 1:n_PUFs
        for i = 1:n_bits
            bit_alias_PUFs(j,i) = mean(bits_matrix_PUFs(:,j,i));
        end 
    end 
    
    bit_alias_inter_mu = zeros(n_PUFs,1);
    bit_alias_inter_std = zeros(n_PUFs,1);
    for i = 1:n_PUFs
        bit_alias_inter_mu(i) = mean(bit_alias_PUFs(i,:));
        bit_alias_inter_std(i) = std(bit_alias_PUFs(i,:),1);
    end 
    
    bit_probability_1_inter_mu = bit_alias_PUFs;
    bit_probability_0_inter_mu = 1 - bit_alias_PUFs;
    
    min_entropy = zeros(n_PUFs,n_bits);
    for j = 1:n_PUFs
        for i = 1:n_bits
            min_entropy(j,i) = -log2(max(bit_probability_1_inter_mu(j,i), bit_probability_0_inter_mu(j,i)));
        end 
    end
    
    min_entropy_mu = zeros(n_PUFs,1);
    min_entropy_std = zeros(n_PUFs,1);
    for i = 1:n_PUFs
        min_entropy_mu(i) = mean(min_entropy(i,:));
        min_entropy_std(i) = std(min_entropy(i,:),1);
    end 
end


