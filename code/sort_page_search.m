% Recherche d'un mot dans un fichier texte et Trier l'ordre des rangs

%{
La fonction find va chercher dans tous les fichiers .txt les fichiers qui
contiennent le mot 'word' recherché.
Elle doit chercher dans le titre de la page et son contenu ainsi que dans
les pointeurs qu'elle contient

Règles que l'on met en place : 
On attribue des points dans le page rank en fonction d'où se trouve le mot
recherché ainsi que le nombre d'itération
- Si le mot se trouve en titre +3
- Si le mot se trouve en contenu +2
- Si le mot est un titre référencé : +1

On multiplie le nombre de points par le nombre d'itération en fonction des
différents lieux d'apparition.
%}
% 

% Renvoie un vecteur qui indique l'ordre d'affichage des pages sur le site
% google
function result = sort_page_search(word, StablePR, path, order, n) % Peut etre que l'on peut supprimer order de notre fonction
    files = dir(fullfile(path, '*.txt'));
    wordInside = [""];
    
    for i = 1:n % pour chaque fichier dans le dossier choisi
        thisfile = files(i).name;
        text = fileread(strcat(path, thisfile));
        
        % Obtenir la liste des mots word dans le texte 
        matches = regexp(text,word,'match');
        taille = size(matches);
        
        wordInside(end + 1) = extractBetween(thisfile, 1, '.txt' );
    end
    %disp(wordInside);
    taille = size(wordInside);

    [B,p] = sort(StablePR,'descend');
    tailleB = size(B);
    
    %{
    disp(StablePR);
    disp(order);
    disp(B);
    disp(p);
    disp(wordInside);
    %}
    %disp(tailleB(1));
    
    
    result = strings(1, taille(2)); % ok
    
    for i = 1 : tailleB(1)
        %disp(order(p(i)), '\n');
        for j = 1:taille
            %disp('abc : ');
            disp(wordInside(j));
            %disp('def : ');
            if( order(p(i)) == wordInside(j))
                result(p(i)) = wordInside(j);
            end
        end
    end

end