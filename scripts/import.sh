#!/bin/sh

DEFAULT_URL=http://www.diputados.gob.mx/LeyesBiblio/htm/1.htm
url=${1:-$DEFAULT_URL}
outfile=constitucion

do_get() {
    wget ${url} --quiet --output-document - 
}

do_tidy() {
    config="--wrap 0 --drop-font-tags yes --drop-empty-elements yes --enclose-text yes --fix-uri yes --hide-comments yes --merge-divs yes --merge-spans yes --show-body-only yes"
    tidy ${config} -clean -bare -omit -asxhtml -quiet
}

do_pandoc() {
    pandoc --smart --normalize --from html --to rst
}

do_clean() {
    scripts/cleaner.py ${url}
}

get_law() {
    do_clean | do_tidy | do_pandoc
}

get_law > ${outfile}.rst 2>/dev/null
