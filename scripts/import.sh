#!/bin/sh

DEFAULT_URL=http://www.diputados.gob.mx/LeyesBiblio/htm/1.htm
url=${1:-$DEFAULT_URL}
outfile=constitucion

do_get() {
    wget ${url} --quiet --output-document - 
}

do_iconv() {
    iconv --from WINDOWS-1252 --to utf8
}

do_tidy() {
    tidy -clean -bare -utf8 -omit -ashtml -quiet
}

do_pandoc() {
    pandoc --smart --normalize --from html --to rst
}

do_sed() {
    sed -e 's/[[:blank:]]*$//'
}

get_law() {
    do_get | do_iconv | do_tidy | do_pandoc | do_sed
}

get_law > ${outfile}.rst 2>/dev/null
