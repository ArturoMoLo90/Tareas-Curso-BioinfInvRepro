#! /bin/bash

# Establecer variable del usuario
username="$(whoami)"

# Bajar la secuencia de un prion humano
wget http://www.uniprot.org/uniprot/P04156.fasta

# Bajar y descomprimir la base de datos del pez zebra en NCBI
curl -O ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz
gunzip zebrafish.1.protein.faa.gz

# Correr docker (Pedira contraseña)
sudo docker run -v /home/$username:/data/ biocontainers/blast makeblastdb -in zebrafish.1.protein.faa -dbtype prot

# Obtener resultados
sudo docker run -v /home/$username:/data/ biocontainers/blast blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt

echo finish

done

