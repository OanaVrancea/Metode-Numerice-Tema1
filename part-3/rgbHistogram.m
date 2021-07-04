function [sol] = rgbHistogram(path_to_image, count_bins)
  numar_intervale = (255 - 0 + 1) / count_bins;
  %citesc imaginea
  im = imread(path_to_image);
  [n, m, trei] = size(im);
  poz = 0;
  matrix = zeros(3, count_bins);
  interval = 0:numar_intervale:256;
  %parcurg pe rand imaginea pentru R G si B
  for p = 1:3
    poz = 1;
    %intorc cu histc o matrice ce are pe fiecare coloana in ordine 
    %numarul de elemente pentru fiecare subinterval
    bincount = histc(im(1:n, 1:m,p), interval);
    for i = 1:size(bincount)(1)
      %calculez suma pentru fiecare linie din bincount si o pun in matrix
      matrix(p,poz) = sum(bincount(i, :));
      poz++; 
    endfor
  endfor
  %la final obtinem o matrice -matrix- de 3 linii , fiecare linie avand
  %in ordine numarul de elemente din fiecare interval
  po = 1;
  for i = 1:3
    for j = 1:count_bins
      %completam vectorul sol punand cele 3 linii din matrix in vector
      sol(1, po) = matrix(i, j);
      po++;
    endfor
  endfor
endfunction