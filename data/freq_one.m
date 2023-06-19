clear all;
n_devices = 4;
device = 3;
%device = 1 <= nice spacial correlation

n_PUFs = 4;
n_ROs = 512;
n_bits = n_ROs * (n_ROs - 1) / 2;

freq_PUFs = zeros(n_PUFs,n_ROs);

X_L = [0,3,6,9,11,14,15,16];
X_R = [42,44,46,47,48,49,50,51];
X_slices = [X_L; X_R; X_R; X_L];
Y_T = 180:1:239;
Y_B = 0:1:59;
Y_slices = [Y_T; Y_T; Y_B; Y_B];

str2 = ["TOP\_LEFT" "TOP\_RIGHT" "BOTTOM\_RIGHT" "BOTTOM\_LEFT"];


%Read from file
module = 'fin001ms5';
file = 'freq.csv';
path = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Boards\';
kria = strcat('kria', string(device), '\');
fullpath = strcat(path,kria, module,'\data\',file);

data = readtable(fullpath);
for j = 1:n_PUFs
    freq_PUFs(j,:) = table2array(data(:,j));
end

freq_matrix = zeros(60,8);

fig = figure;
t = tiledlayout(2,2); 
t.TileSpacing = 'compact';
t.Padding = 'compact';
xlabel(t,'Slice X');
ylabel(t,'Slice Y');

layout = [1,2,4,3];

for q = layout
    p = 1;
    for k = 1:8
        for j = 1:60
            freq_matrix(j,k) = freq_PUFs(q,p);
            p = p + 1;
        end
    end
    
    X = linspace(1,8,8);
    Y = linspace(1,60,60);
    Y_L = Y_slices(q,:);
    Y_LL = string(Y_L);
    Y_LL(mod(Y_L,5) ~= 0) = " ";
    X_L = string(X_slices(q,:));
    X_L(1:length(X_L)) = " ";
    nexttile

    if (q==1)
        h = heatmap(X,Y,flip(freq_matrix),'Colormap',parula,'ColorLimits',[490 560]);     
        h.XDisplayLabels = X_L;
    elseif (q==2)
        h = heatmap(X,Y,flip(freq_matrix),'Colormap',parula,'ColorLimits',[490 560]);
        Y_LL(1:length(Y_LL)) = " ";
        h.XDisplayLabels = flip(X_L);
    elseif (q==3)
        h = heatmap(X,Y,flip(freq_matrix),'Colormap',parula,'XData',X_slices(q,:),'ColorLimits',[490 560]);
        Y_LL(1:length(Y_LL)) = " ";
    else
        h = heatmap(X,Y,flip(freq_matrix),'Colormap',parula,'XData',X_slices(q,:),'ColorLimits',[490 560]);
    end    
    
    str_title = strcat('kria',string(device)," ", str2(q));
    title(str_title)
    h.YDisplayLabels = flip(Y_LL);
   
end 

han=axes(fig,'visible','off'); 
han.Title.Visible='on';
han.XLabel.Visible='on';
han.YLabel.Visible='on';


