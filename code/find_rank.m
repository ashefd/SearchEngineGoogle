
function StablePR = find_rank(n, path, M)
    StablePR = zeros(n,1);
    [V,D] = eig(M);
    highest = 0;
    Ihighest = 1;
    for i = 1:n
        if D(i,i) > highest
            Ihighest = i;
            highest = D(i,i);
        end
    end
    StablePR = V(:,Ihighest);
 
end