function [cost] = compute_cost_pc(points, centroids)
  N = size(points)(1);
  D = size(points)(2);
  n = size(centroids)(1);
  cost = 0;
  %pentru fiecare punct
  for punct = 1:N
    %initializez minim(punct) cu distanta de la punct la primul centroid
    minim(punct) = norm(centroids(1, :) - points(punct, :), 2);
    for i = 2:n
      %calculez distantele catre ceilalti centroizi
      eucl = norm(centroids(i, :) - points(punct, :), 2);
      if(eucl < minim(punct))
      %retin distanta minima
        minim(punct) = eucl;
      endif
    endfor
    %si o adun la suma totala "cost"
     cost = cost + minim(punct);
  endfor
endfunction

