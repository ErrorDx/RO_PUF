clear all;
fname = 'C:\Users\Mateusz\Desktop\Skoelll\University of Twente\Year 3\BScThesis\Data\Figures\eva';
n_PUFs = 4;
n_modules = 4;
modules = ["fin0001ms5" "fin001ms5" "fin01ms5" "fin1ms5"];
eval_time = [1e-6,1e-5,1e-4,1e-3];

%% Uniqueness

mu = zeros(n_PUFs,n_modules);
std = zeros(n_PUFs,n_modules);
for i = 1:n_modules
    [mu(:,i), std(:,i)] = uniqueness(modules(i));
end

figure;
for i = 1:n_PUFs
    semilogx(eval_time,mu(i,:));
    hold on;
end 
legend('TOP\_LEFT', 'TOP\_RIGHT', 'BOTTOM\_LEFT', 'BOTTOM\_RIGHT')
xlabel('Evaluation Time (s)')
ylabel('Uniqueness')
grid on;
saveas(gca, fullfile(fname, 'Uniqueness'), 'jpeg');

%% Uniqueness device

mu = zeros(n_PUFs,n_modules);
std = zeros(n_PUFs,n_modules);
for i = 1:n_modules
    [mu(:,i), std(:,i)] = uniqueness_device(modules(i));
end

figure;
for i = 1:n_PUFs
    semilogx(eval_time,mu(i,:));
    hold on;
end 
legend('TOP\_LEFT', 'TOP\_RIGHT', 'BOTTOM\_LEFT', 'BOTTOM\_RIGHT')
xlabel('Evaluation Time (s)')
ylabel('Uniqueness inter device')
grid on;
saveas(gca, fullfile(fname, 'uniqueness_device'), 'jpeg');
%% Reliability

mu = zeros(n_PUFs,n_modules);
std = zeros(n_PUFs,n_modules);
for i = 1:n_modules
    [mu(:,i), std(:,i)] = reliability(modules(i));
end

figure;
yyaxis left
for i = 1:n_PUFs
    semilogx(eval_time,mu(i,:));
    hold on;
end 
xlabel('Evaluation Time (s)')
ylabel('Reliability')
grid on;
saveas(gca, fullfile(fname, 'Reliability'), 'jpeg');

%% Unstable bits
mu = zeros(n_PUFs,n_modules);
std = zeros(n_PUFs,n_modules);
for i = 1:n_modules
    [mu(:,i), std(:,i)] = unstable_bits(modules(i));
end

yyaxis right; 
for i = 1:n_PUFs
    semilogx(eval_time,mu(i,:)*100);
    hold on;
end 
%legend('TOP\_LEFT', 'TOP\_RIGHT', 'BOTTOM\_LEFT', 'BOTTOM\_RIGHT', 'Location','east')
xlabel('Evaluation Time (s)')
ylabel('Unstable bit ratio')
ytickformat('percentage')
grid on;
saveas(gca, fullfile(fname, 'Unstable_bits'), 'jpeg');

%% Uniformity

mu = zeros(n_PUFs,n_modules);
std = zeros(n_PUFs,n_modules);
for i = 1:n_modules
    [mu(:,i), std(:,i)] = uniformity(modules(i));
end

figure;
subplot(2,1,1)
for i = 1:n_PUFs
    semilogx(eval_time,mu(i,:));
    hold on;
end 
legend('TOP\_LEFT', 'TOP\_RIGHT', 'BOTTOM\_LEFT', 'BOTTOM\_RIGHT', 'Location', 'southeast')
xlabel('Evaluation Time (s)')
ylabel('Uniformity')
grid on;
saveas(gca, fullfile(fname, 'Uniformity'), 'jpeg');

%% Bit_aliasing

mu = zeros(n_PUFs,n_modules);
std = zeros(n_PUFs,n_modules);
for i = 1:n_modules
    [mu(:,i), std(:,i), ~, ~] = bit_aliasing(modules(i));
end

subplot(2,1,2)
for i = 1:n_PUFs
    semilogx(eval_time,mu(i,:));
    hold on;
end 
legend('TOP\_LEFT', 'TOP\_RIGHT', 'BOTTOM\_LEFT', 'BOTTOM\_RIGHT', 'Location', 'southeast')
xlabel('Evaluation Time (s)')
ylabel('Bit aliasing')
grid on;
saveas(gca, fullfile(fname, 'Bit_aliasing'), 'jpeg');

%% Min_entropy

mu = zeros(n_PUFs,n_modules);
std = zeros(n_PUFs,n_modules);
for i = 1:n_modules
    [~,~,mu(:,i), std(:,i)] = bit_aliasing(modules(i));
end

figure;
for i = 1:n_PUFs
    semilogx(eval_time,mu(i,:));
    hold on;
end 
legend('TOP\_LEFT', 'TOP\_RIGHT', 'BOTTOM\_LEFT', 'BOTTOM\_RIGHT')
xlabel('Evaluation Time (s)')
ylabel('Min entropy')
grid on;
saveas(gca, fullfile(fname, 'Min_entropy'), 'jpeg');
