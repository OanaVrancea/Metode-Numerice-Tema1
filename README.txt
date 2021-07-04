Vrancea Oana Roxana 312 CD
Task 1 - Sparse Jacobi
	Generate_probabilities_system-in cadrul acestei functii am incercat
	sa gasesc toate cazurile pentru toate locurile cu proprietati 
	asemanatoare pe care s-ar putea afla soarecele (pe pozitia 1,
	la inceput sau sfarsit de linie, in "centru" sau cazuri particulare
	pentru elementele de pe ultima linie). Astfel am construit linii pentru
	matricea A si vectorul b in functie de fiecare caz, parcurgand labirintul
	pe nivele(linii).
	
	Matrix_to_csr-parcurgand fiecare element al matricii am retinut in values
	toate elementele nenule, in colind indicele coloanei corespunzatoare fiecarui
	element nenul, iar in alt vector numarul de elemente nenule de pe o linie
	pentru a putea completa vectorul rowptr.Astfel, pornim de la indice = 1
	deoarece stim ca primul element nenul din matrice se va afla in vectorul
	values pe pozitia 1, dupa care sarim cu numarul de elemente nenule de pe
	linia respectiva pentru a salva in rowptr pozitia corecta a primelor
	elemente nenule de pe fiecare rand.
	
	Jacobi factorization-doar calculam matricea N si P din care rezulta
	G_J si c_J corespunzator.
	
	Jacobi sparse-aplicam restul algoritmului de la Jacobi utilizand
	functia csr_multiplication.

Task 2 - K-Means
	Clustering_pc-dupa initializarea centroizilor conform enuntului
	am luat fiecare punct in parte si am setat cu minim distanta de 
	la el la primul centroid. Dupa aceea am calculat distantele de la
	punct la ceilalti centroizi si am retinut indicele centroidului
	pentru care s-a gasit cea mai mica distanta intr-un vector "belongs".
	Dupa ce am parcurs astfel toate punctele, am parcurs centroizii si vectorul
	belongs si am calculat cate puncte apartin fiecarui centroid , dar si suma
	corespunzatoare fiecarui centroid, iar mai apoi am calculat media. Algoritmul se
	opreste intr-un numar finit de pasi sau cand centroidul anterior este egal cu 
	noul centroid calculat.
	
	Compute_cost_pc-pentru fiecare punct calculam distantele catre toti centroizii
	iar pe cea mai mica o adunam la suma "cost".

Task 3 - Householder prediction
	rgbHistogram - in acest task citesc imaginea , dupa care parcurg cu un for
	imaginea pentru R,G si B. Folosesc functia histc pentru a returna o matrice
	care are pe fiecare coloana de la prima linie la ultima numarul de elemente care 
	se gasesc in subintervalul respectiv. Numarul de elemente total dintr-un subinterval
	este reprezentat de suma elemantelor de pe fiecare linie.Completam prima linie a
	matricei "matrix" cu sumele pt fiecare subinterval si procedam similar pentr G si B.
