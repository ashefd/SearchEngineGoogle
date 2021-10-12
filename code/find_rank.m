% Recherche d'un mot dans un fichier texte

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
function R = find_rank(word, path, M)
    

end