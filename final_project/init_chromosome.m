function chrom = init_chromosome(chrom, V)
    for i = 1:length(chrom.nodes)
        chrom.nodes{i}.data = zeros(1, length(chrom.nodes{i}.data));
        for j = 1:length(chrom.nodes{i}.data)
            chrom.nodes{i}.data(1, j) = normrnd(chrom.nodes{i}.c(j)/5, chrom.nodes{i}.c(j)/10);
            while chrom.nodes{i}.data(1, j) < 0 || chrom.nodes{i}.data(1, j) > chrom.nodes{i}.c(j)
                chrom.nodes{i}.data(1, j) = normrnd(chrom.nodes{i}.c(j)/5, chrom.nodes{i}.c(j)/10);
            end
        end
    end
    chrom = fit_constraints(chrom, V);
end
    % for i = 1:length(chrom.node1.data)
    %     chrom.nodes{i}.data(1, i) = normrnd(chrom.nodes{1}.c(i)/2, chrom.nodes{1}.c(i)/4);
    %     while chrom.node1.data(1, i) < 0 || chrom.node1.data(1, i) > chrom.node1.c(i)
    %         chrom.node1.data(1, i) = normrnd(chrom.node1.c(i)/2, chrom.node1.c(i)/4);
    %     end
    % end
    % res = (sum(chrom.node1.data) - V)/length(chrom.node1.data);
    % chrom.node1.data = chrom.node1.data - res;