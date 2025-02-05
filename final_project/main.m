%% ====== Final Project ======
% Lolos Ioannis
% AEM: 10674
% ====================
clear;
clc;
close all;

V = 100; % Input traffic volume
POP_SIZE = 20;
NUM_GENERATIONS = 30;
MUTATION_RATE = 0.1;
ELITISM_RATE = 0.8;

% Initialize first population
population = cell(1, POP_SIZE);
for i = 1:POP_SIZE
    chrom = Tree();
    chrom = init_chromosome(chrom, V);
    population{i} = chrom;
end

disp(population{1}.to_array());
disp(sum(population{1}.to_array()));
% disp(sum(population(1, :)));
% calculate fitness
% pick best chromosomes using roulette wheel selection
% Crossover
% Mutation
% Replace worst chromosomes with new ones
% Check if convergence is reached