function [values, colind, rowptr] = matrix_to_csr(A)
  n = size(A)(1);
  m = size(A)(2);
  %numarul de elemente nenule din matrice
  nz = nnz(A);
  elementepelinienenule = zeros(1,n);
  values = zeros(1,nz);
  colind = zeros(1,nz);
  rowptr = zeros(1,n+1);
  %ultimul element din rowptr trebuie sa aiba valoarea nz+1
  rowptr(1,n+1) = nz + 1;
  k = 1;
  %parcurgem fiecare element al matricei
  for i = 1:n
    for j = 1:m
      %daca acesta este nenul
      if (A(i,j)!=0)
        %retinem valoarea in values si indicele coloanei in colind
        values(1,k) = A(i,j);
        colind(k) = j;
        %retinem numarul de elemente nenule de pe fiecare linie
        elementepelinienenule(1,i) = elementepelinienenule(1,i) + 1;
        k++;
       endif
   endfor
  endfor
  %primul element nenul din matrice va fi mereu pe pozitia 1 in vectorul values
  indice = 1;
  poz = 1;
  %completam rowptr parcurgand doar pozitiile din values a primelor elemente din linii
  for i = 1:n
    rowptr(i) = indice;
    indice = indice + elementepelinienenule(1,i);
   endfor
endfunction