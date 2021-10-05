% Script


% Vecteur de popularité P
% Matrice de proba d'accéder aux autres sites M
% Vecteur de page_rank PR
% 

path = '';

PR = create_page_rank(P, M, path); % Première initialisation
PR = update_page_rank(PR, P, M, path); % update


% Si on fait une recherche d'un mot
% Vecteur rang en fonction d'une recherche R
word = '';
R = find_rank(word, path, M); % donne l'ordre de pertinence de chaque page
R = sort_page_search(R, path); % on ordonne par pertinence les pages
%Vecteur P à modifier à chaque clic sur une page

% fonction display des résultats




