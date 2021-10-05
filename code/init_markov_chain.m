% set according to references

function [M, order] = init_markov_chain(n, path)
    L = zeros(n,n);
    alpha = 0.85;
    files = dir(fullfile(path, '*.txt'));
    
    % On initialise le vecteur "order"
    order = strings(n);
    for i = 1:n
        order(i) = extractBetween(files(i).name , 1, '.txt' );
    end
    
    for i = 1:n % pour chaque fichier dans le dossier choisi
        thisfile = files(i).name;
        text = fileread(strcat(path, thisfile));
        
        % Obtenir la liste de "pointeur" dans le texte 
        matches = regexp(text,'pointeurvers: (\w+).txt','match');
        taille = size(matches);
        
        % Permet de ne prendre que le nom des fichiers (sans le .txt)
        for j = 1:taille(2)
            matches(1,j) = extractBetween(matches(1,j), 'pointeurvers: ', '.txt' );

            for x = 1:n
                if order(x) == matches(1,j)
                    % Ajouter dans chaque case le nombre associé
                    L(x,i) = L(x,i) + 1;  
                end
            end
        end
        for x = 1:n
            L(x,i) = L(x,i)/taille(2);  
        end
    end
    
    S = L;
    for i = 1:n
        sum = 0;
        for j = 1:n
            sum = S(j,i) + sum;
        end
        if sum == 0
            for x = 1:n
                for y = 1:n
                    S(j,i) = 1/n;
                end
            end
        end
    end
    
    M = alpha * S + (1-alpha) * ones(n,n)/n;
end