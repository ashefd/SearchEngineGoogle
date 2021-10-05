% Script for search engine Google %

%% Parameters %%

% Path to pages
path = '../pages/';

% number of pages for this exemple
n = count_Nb_Pages(path); 

% Vecteur de popularité P
P = zeros(n,1);

% Vecteur order permettant de checker par la suite si besoin l'ordre des
% fichiers
% Matrice de probabilité d'aller vers chaque page M
[M, order] = init_markov_chain(n, path) % c'est le nombre de pages qui référence d'autre en proba

% Matrice de page_rank PR
PR = create_page_rank(P, M, path); % Première initialisation
PR = update_page_rank(PR, P, M, path); % update

%% Display search page %%


% call script to display pages



%% Si on fait une recherche d'un mot %%


% Vecteur rang en fonction d'une recherche R
word = '';
R = find_rank(word, path, M); % donne l'ordre de pertinence de chaque page
R = sort_page_search(R, path); % on ordonne par pertinence les pages
%Vecteur P à modifier à chaque clic sur une page

% fonction display des résultats
