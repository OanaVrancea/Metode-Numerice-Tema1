function[A,b]=generate_probabilities_system(rows)
  n = rows * (rows + 1) / 2;
  A = zeros(n,n);
  b = zeros(n,1);
  p = zeros(n,1);
  %parcurgem "labirintul" pe randuri
  for j = 1:rows
    %de la indicele primului element de pe o linie la ultimul 
    for  i = (j * (j + 1) / 2 - j + 1):1:(j * (j + 1) / 2)
      % daca este pe pozitia 1
      if (i == 1) 
        A(i,i) = 4;
        A(i,i+1) = (-1);
        A(i,i+2) = -1;
        b(i,1) = 0;
      %daca este in coltul din dreapta jos pe ultima linie
      elseif (i == (j * (j + 1)) / 2 && j == rows)
        A(i,i) = 4;
        A(i,i-1) = -1;
        A(i,j*(j-1)/2) = -1;
        b(i,1) = 1;
       %daca este ultimul element de pe o linie, dar nu pe ultima linie
       elseif (i == (j * (j + 1)) / 2 &&  j < rows)
         A(i,i) = 5;
         A(i,i-1) = -1;
         A(i,j*(j-1)/2) = -1;
         A(i,(j + 1) * (j + 2) / 2) = -1;
         A(i,(j + 1) * (j + 2) / 2 - 1) = -1;
         b(i,1) = 0;
        %daca este in coltul din stanga jos pe ultima linie
        elseif (i == ((j * (j + 1) / 2)- j + 1) && j == rows)
          A(i,i) = 4; 
          A(i,i+1) = -1;
          A(i,j * (j - 1) / 2 - j + 2) = -1;
          b(i,1) = 1;
        %daca este primul element de pe o linie, dar nu pe ultima linie
         elseif (i == ((j * (j + 1) / 2) - j + 1) && j < rows)
           b(i,1) = 0;
           A(i,i) = 5;
           A(i,i+1) = -1;
           A(i,j * (j - 1) / 2 - j + 2) = -1;
           A(i,(j + 1) * (j + 2) / 2 - j) = -1;
           A(i,(j + 1) * (j + 2) / 2 - j + 1) = -1;
          % daca este pe ultima linie dar nu primul sau ultimul
         elseif (j == rows)
           A(i,i) = 5;
           A(i,i+1) = -1;
           A(i,i-1) = -1;
           A(i,i-j) = -1;
           A(i,i-j+1) = -1;
           b(i,1) = 1;
          else
           A(i,i) = 6;
           A(i,i+1) = -1;
           A(i,i-1) = -1;
           A(i,i-j) = -1;
           A(i,i-j+1) = -1;
           A(i,i+j) = -1;
           A(i,i+j+1) = -1;
           b(i,1) = 0;
     endif
    endfor
  endfor
endfunction
 
                
                
                