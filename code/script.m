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
P = randi([1 100],n,1,'double');

% Page Rank
StablePR = find_rank(n, path, M); % donne l'ordre de pertinence de chaque page
%% Display search page %%

fig = uifigure;
fig.Position = [00 -10 1920 1080];

h = uihtml(fig);
h.Position = [00 -40 1220 1080];

h.HTMLSource = fullfile(pwd,'../google/displayDataFromMATLAB.html');

TotalFrame = 50;
p1 = uipanel(fig,'Position',[1220 530 500 500]);
ax1 = uiaxes(p1,'Position',[10 10 450 450]);
ax1.XLim = [-20 250];
ax1.YLim = [-20 250];
p2 = uipanel(fig,'Position',[1220 30 500 500]);
ax2 = uiaxes(p2,'Position',[10 15 450 450]);

h.DataChangedFcn = @(src,event)request(h.Data, StablePR, path, order, n, h, TotalFrame, P, M, ax1, ax2);
display_user_distribution(TotalFrame, order, P, n, M, ax1, ax2);


%% Si on fait une recherche d'un mot %% 
% fonction display des résultats
% hdata : c'est le mot qui a ete cherche dans Gloogloo
function h = request(hdata, StablePR, path, order, n, h, TotalFrame, P, M, ax1, ax2)
    result = sort_page_search(hdata, StablePR, path, order, n); % on ordonne par pertinence les pages
    
    h.Data = result; % Affichage des résultats de la requête
    if isempty(result) == 0 % if it is not empty
        % Want to change P into something else
        % Make all the population distributed to those web site and then
        % visualize how the distribution is evoluting
        
    end
    display_user_distribution(TotalFrame, order, P, n, M, ax1, ax2);
end
