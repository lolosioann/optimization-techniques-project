min_fit = zeros(1,50);
avg_fit = zeros(1,50);
for i = 1:50
    [min_fit(i), avg_fit(i)] = main();
end
clc;
figure;
histfit(min_fit);
xlabel('Minimum Fitness');ylabel('Frequency');
dist = fitdist(min_fit', 'Normal');
disp(dist);
fprintf("Mean minimum fitness: ");
disp(mean(min_fit));
fprintf("Mean average fitness: ");
disp(mean(avg_fit));
fprintf("Best fitness: ");
disp(min(min_fit));


