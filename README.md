¿Qué es esto?
=============

Primero, y antes que nada, vean esta charla en TED de Clay Shirky: "How the
Internet will (one day) transform government"

http://on.ted.com/CShirky2012

¿Ya lo vieron?

Pues esto es un intento de avanzar en ese sentido: Que el quehacer legislativo
se ayuden de las herramientas colaborativas del desarrollo del software libre,
en particular de GIT.

Las leyes las podemos visualizar como código fuente y sus modificaciones como
parches que se discuten y, si así se acuerda, se aplican.

En el caso de la Constitución Política de los Estados Unidos Mexicanos, es
importante que todos los ciudadanos del país estemos enterados de nuestros
derechos y obligaciones recabados en ella.  Y más aún, que nos involucremos en
su mejora con crítica y propuestas de cambios ciudadanas.


De acuerdo ¿pero qué es esto?
=============================

La versión más reciente de la Constitución Política de los Estados Unidos
Mexicanos está disponible en formato HTML en

http://www.diputados.gob.mx/LeyesBiblio/htm/1.htm

Sin embargo, está en formato HTMLm producto de exportar un documento en
Microsoft Word, que no resulta amigable para llevar un registro de cambios en
un servidor de versiones.

Entonces escribí un simplísimo script en bash que descarga dicho documento y
lo convierte en formato RST ( [reStructured Text
Markup](http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html) ),
que es mucho más propicio para esto fines.


¿Cómo ejecuto el script?
=======================


    $ ./scripts/import.sh [url]


El script tiene la siguiente dependencias:

 * wget
 * tidy
 * pandoc
 * python3
 * lxml (módulo de python)


¿Y luego?
=========

La idea entonces es registrar cada modificación que se le haga a la
Constitución para poder revisarla por el mayor número de personas y realizar
juicios críticos.

También sería interesante (aunque aún no sé cómo) registrar todas las
propuestas de modificación como *pull requests* en GitHub. Y la ciudadanía
también pueda hacer *pull requests* para que los legisladores las tomen en
cuenta.


¿Y qué sigue?
=============

 * Integrar las propuestas de ley del Legislativo como pull requests
 * Analizar si RST es el mejor formato para esta labor
 * Automatizar la actualización del Documento (¿scrapping
   la página web en un cron?)
 * Debate público sobre cómo difundir y entender los cambios
   constitucionales.
