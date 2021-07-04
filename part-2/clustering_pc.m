function [centroids] = clustering_pc(points, NC)
  D = size(points)(2);
  N = size(points)(1);
  centroids = zeros(NC,D);
  aux = 1;
  for poz = 1:D
    for l = 1:NC
      clustere = zeros(N,1);
      iterator = 0;
      sum = 0;
      k = 0;
      aici = 1;
      %completez clusterele cu indicii punctelor pentru fiecare centroid 
      while (l + k * NC <= N)
        clustere(aici,1) = points(l+k*NC,poz);
        k++;
        iterator++;
        %calculez suma punctelor pentru fiecare cluster
        sum = sum + clustere(aici,1);
        aici++;
       endwhile
       %calculez centroizii initiali
       centroids(l,poz) = sum/iterator;
    endfor
  endfor   
  steps = 0;
  while (1)
    steps++;
    %pentru fiecare punct
    for point = 1:N
      aux = 1;
      %initializez minim cu distanta de la punct la primul centroid
      minim = norm(centroids(1,:)-points(point,:),2);
      for i = 2:NC  
        %calculez distantele catre ceilalti centroizi
        eucl = norm(centroids(i,:)-points(point,:),2);
        if(minim > eucl)
          minim = eucl;
          %retin indicele centroidului cu cea mai mica distanta
          aux = i;
        endif
        %competez in vectorul belongs indicele centroidului cel mai apropiat 
        %pentru fiecare punct
        belongs(point) = aux;
       endfor  
    endfor
    %retin centroizii in prev
    prev = centroids;
    centroids = zeros(NC,D);
    nrelem = zeros(1,NC);
    for i = 1:NC
      for j = 1:N
        if (belongs(j) == i)
          %calculez numarul de elemente si suma pentru fiecare centroid
          nrelem(i)++;
          centroids(i,1:D) = centroids(i,1:D) + points(j,1:D);
        endif
       endfor
       %recalculez centroizii
       centroids(i,:) = centroids(i,:) ./ nrelem(i);
    endfor
    if (centroids == prev || steps >= 20)
      break;
    endif
  endwhile
endfunction
