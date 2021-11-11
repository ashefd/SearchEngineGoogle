# SearchEngine

Authors:
CABRERA Cyril
LOK Tshanon

Explications : 
Le but de ce projet est de créer un simulateur du moteur de recherche de Google.
Le simulateur permet de rechercher parmi les pages proposées un mot. Notre moteur de recherche va afficher des résultats en fonction de la popularité du site, de la pertinence des sites, du page_rank.
La popularité et le page_rank seront mis à jour au fur et à mesure des recherches, du delta t.


Objectifs :
Les objectifs de ce projet est d'apprendre à utiliser les matrices de Markov de manière ludique.


TODO : 
- Changer le logo Google en Gloogloo
- Faire évoluer le vecteur P : 
    - Dans script.m, ligne 54
    - Selon les éléments se trouvant dans la variable "result" (attention,  result est un tableau), ligne 47, modifier la valeur de P. <br>
    Explications : 
    - Si on ne trouve que youtube et stackoverflow dans result, on aimerait avec P = [0, nombreDePersonneTot/2, 0, 0, nombreDePersonneTot/2, 0] en suivant order.
- Si tu le souhaites : Tu peux ajouter une fonction en plus. Que tu pourras placer à la ligne 48 de script.
Cette fonction devra en compte result (au moins). Elle pourra modifier l'ordre d'affichage des résultats en fonction de l'endroit où on trouve le mot recherché dans google.