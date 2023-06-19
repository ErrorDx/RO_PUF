clear all;
n_devices = 4;
PUF_region = 1;
n_PUFs = 4;
n_ROs = 512;
n_bits = n_ROs * (n_ROs - 1) / 2;

freq_PUFs = zeros(n_devices,n_PUFs,n_ROs);

X_L = [0,3,6,9,11,14,15,16];
X_R = [42,44,46,47,48,49,50,51];
X_slices = [X_L; X_R; X_R; X_L];
Y_T = 180:1:239;
Y_B = 0:1:59;
Y_slices = [Y_T; Y_T; Y_B; Y_B];

fig = figure;

%Read from file
for i = 0:n_devices-1
    module = 'fin001ms7';
    file = 'freq.csv';
    path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
    kria = strcat('kria', string(i), '\');
    fullpath = strcat(path,kria, module,'\data\',file);

    data = readtable(fullpath);
    for j = 1:n_PUFs
        freq_PUFs(i+1,j,:) = table2array(data(:,j));
    end

    freq_matrix = zeros(60,8);

    p = 1;
    for k = 1:8
        for j = 1:60
            freq_matrix(j,k) = freq_PUFs(i+1,PUF_region,p);
            p = p + 1;
        end
    end

    X = linspace(1,8,8);
    Y = linspace(1,60,60);
    Y_L = Y_slices(PUF_region,:);
    Y_LL = string(Y_L);
    if (i+1 == 1)
        Y_LL(mod(Y_L,5) ~= 0) = " ";
    else 
        Y_LL(mod(Y_L,0) ~= 0) = " ";
    end 
    
    subplot(1,4,i+1); 
    h = heatmap(X,Y,flip(freq_matrix),'Colormap',parula,'XData',X_slices(PUF_region,:),'ColorLimits',[400 430]);
    %str_title = strcat('kria',string(i),' PUF',string(PUF_region));
    str_title = strcat('kria',string(i));
    title(str_title)
    h.YDisplayLabels = flip(Y_LL);

end

han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';
xlabel(han,'Slice X');
ylabel(han,'Slice Y');


