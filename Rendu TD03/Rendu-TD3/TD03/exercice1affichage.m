load('VTSaumonBar.mat')
sizeVTSaumon=VTSaumon;
sizeVTBar=VTBar;
hold on %l'affichage  de deux courbes dans une seule figure
histogram(sizeVTSaumon) 
histogram(sizeVTBar) %ça affiche le nombre de fois  d'avoir un bar par rapport à sa longueur
hold off;
