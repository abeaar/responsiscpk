function [Max_Kost_Score]= ahp()
disp ('Matrik perbandingan pada kriteria');
       % J   H   F   K
MPBk = [1/1 1/2 3/1 1/4; %J
        2/1 1/1 1/2 1/3; %H
        1/3 2/1 1/1 2/1; %F
        4/1 3/1 1/2 1/1] %K
    
w_MPB =calc_norm(MPBk)

[m n]=size(w_MPB);
for i=1 : m 
    sumRow = 0;
    for j=1 : n,
        sumRow = sumRow + w_MPB(i,j);
    end;
  V(i) = (sumRow);
end;

disp('Eigenvector')
w_MPB = transpose (V)/m

disp ('Perbandingan Kualitas : Alternatif Kuantitatif');
kosA = [900, 1];
kosB = [850, 2];
kosC = [1000, 1];
kosD = [950, 3];

ACM_Ku = [kosA;
           kosB;
           kosC;
           kosD]
w_E = calc_norm (ACM_Ku)

disp ('Matrik perbandingan pada fasilitas');
       % A   B   C   D
AKB_F = [1/1 1/2 3/1 2/1; %A
        2/1 1/1 4/1 3/1; %B
        1/3 1/4 1/1 1/2; %C
        1/2 1/3 2/1 1/1] %D
    
w_F =calc_norm(AKB_F)

[m n]=size(w_F);
for i=1 : m 
    sumRow = 0;
    for j=1 : n,
        sumRow = sumRow + w_F(i,j);
    end;
  V(i) = (sumRow);
end;

disp('Eigenvector')
w_F = transpose (V)/m


disp ('Matrik perbandingan pada keamanan');
       % A   B   C   D
AKB_K = [1/1 1/3 1/2 1/4; %A
        3/1 1/1 4/1 1/2; %B
        2/1 1/4 1/1 1/3; %C
        4/1 2/1 3/1 1/1] %D
    
w_K =calc_norm(AKB_K)

[m n]=size(w_K);
for i=1 : m 
    sumRow = 0;
    for j=1 : n,
        sumRow = sumRow + w_K(i,j);
    end;
  V(i) = (sumRow);
end;

disp('Eigenvector')
w_K = transpose (V)/m

wM = [w_E w_F w_K];

disp ('Nilai Akhir ');
MC_Scores = wM * w_MPB

disp ('Nilai terbaik');
Max_MX_Benefits = max(MC_Scores)

    function [normvect]=calc_norm(M)
            sM = sum(M);
            normvect = M./sM;
            disp('Normalisasi Matriks');
    end
end