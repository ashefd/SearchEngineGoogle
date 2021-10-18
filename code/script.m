% Script for search engine Google %

%% Parameters %%

% Path to pages
path = '../pages/';

% number of pages for this exemple
n = count_Nb_Pages(path);
alpha = 0.85;
    
% Vecteur order permettant de checker par la suite si besoin l'ordre des fichiers
% Matrice de probabilité d'aller vers chaque page M
[M, order] = init_markov_chain(n, path, alpha); % c'est le nombre de pages qui référence d'autre en proba

% Vecteur de popularité P
% Pour l'instant, on a décidé de faire quelque chose d'aléatoire
P = randi([1 100],n,1,'int8');

% Matrice de page_rank PR
%PR = create_page_rank(P, M, path); % Première initialisation
%PR = update_page_rank(PR, P, M, path); % update

% display_user_distribution(order, P, n, M);

%% Display search page %%

fig = uifigure;
fig.Position = [500 500 490 180];

h = uihtml(fig);
h.Position = [20 20 450 130];

h.HTMLSource = fullfile(pwd,'../google/displayDataFromMATLAB.html');

h.Data = "Hello World !";

url = '../google/displayDataFromMATLAB.html';
web(url);
%code = webread(url);
%str = extractHTMLText(code);
%word = display_search_engine(); % call script to display pages

% on fixe pour l'instant word 
word = ' ';

%% Si on fait une recherche d'un mot %%


% 
StablePR = find_rank(n, path, M); % donne l'ordre de pertinence de chaque page
result = sort_page_search(word, StablePR, path, order, n) % on ordonne par pertinence les pages


% fonction display des résultats

