#!/bin/sh -x

# Descarga todos los decretos (y fe de erratas) del DOF en formato
# Microsoft word a partir del Reformas Constitucionales por Decreto en
# orden cronológico.

B="http://www.diputados.gob.mx/LeyesBiblio/ref"
P="${B}/cpeum_crono.htm"

mkdir -p dof
for i in $(wget --quiet -O - ${P} | egrep "dof/.*\.doc" | sed -e "s#<a href=\"\(dof/CPEUM_[0-9a-z_]*\.doc\)\">.*#\1#" | xargs); do
    wget --directory-prefix=dof "${B}/${i}"
done

# Convierte los archivos descargados, utilizando LibreOffice writer,
# de format doc a docx, para finalmente convertirlos en formato rST
# con pandoc

for i in $(ls dof/*.doc); do
    fn="$(basename ${i} .doc)"
    lowriter --convert-to docx --outdir dof ${i} && \
	pandoc dof/${fn}.docx -o dof/${fn}.rst
done

# Borra todos los archivos en format doc y docx para dejar únicamente
# los rST

rm dof/*.docx dof/*.doc
