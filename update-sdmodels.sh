#!/bin/bash

rm -rf site/sdmodels/*
mkdir -p site/sdmodels/tmp
cd site/sdmodels/tmp

wget -r -H -l 1 https://rentry.org/sdmodels -e robots=off -U "Mozilla/5.0 (iPhone; CPU iPhone OS 12_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Mobile/15E148 Safari/604.1"

mv rentry.org/static ..
mv rentry.co/sdmodels ../index.html
mv rentry.org/sdmodels/* ..

cd ..
perl -pi -e 's/\/static\//static\//g' index.html

rm -rf tmp
rm edit
rm 'static/manifest.json?v=8'

mv pdf sdmodels.pdf
mv raw sdmodels-raw.txt
wget https://rentry.org/sdmodels/png --timeout=900 -O sdmodels.png

mv static/css/bootstrap.min.css?v=* static/css/bootstrap.min.css
mv static/js/bootstrap.min.js?v=* static/js/bootstrap.min.js
mv static/js/jquery.min.js?v=* static/js/jquery.min.js

perl -pi -e 's/bootstrap\.min\.css\?v=[0-9]*/bootstrap\.min\.css/g' index.html
perl -pi -e 's/bootstrap\.min\.js\?v=[0-9]*/bootstrap\.min\.js/g' index.html
perl -pi -e 's/jquery\.min\.js\?v=[0-9]*/jquery\.min\.js/g' index.html
perl -pi -e 's/<\/body>/<script src="https:\/\/getbootstrap\.com\/docs\/5\.0\/dist\/js\/bootstrap\.bundle\.min\.js"><\/script><\/body>g/' index.html

perl -pi -e 's/\/sdmodels\/raw/sdmodels-raw\.txt/g' index.html
perl -pi -e 's/\/sdmodels\/pdf/sdmodels\.pdf/g' index.html
perl -pi -e 's/\/sdmodels\/png/sdmodels\.png/g' index.html

perl -pi -e 's/<body class="m-0 p-0">/<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color:#6c757d42!important"><div class="container-fluid"><button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navtogglecontent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><\/span><\/button><div class="collapse navbar-collapse" id="navtogglecontent"><div class="navbar-nav"><a class="nav-link" href="\/stable-diffusion-models\/">Models<\/a><a class="nav-link" href="\/stable-diffusion-textual-inversion-models\/">Textual Inversion Models<\/a><a class="nav-link" href="\/stable-diffusion-dreambooth-library\/">DreamBooth Models<\/a><a class="nav-link active" aria-current="page" href="\/stable-diffusion-models\/sdmodels\/">sdmodels<\/a><\/div><\/div><\/div><\/nav>/g' index.html

perl -pi -e 's/<\/head>/<script>var _paq=window\._paq=window\._paq\|\|\[\];_paq\.push\(\["trackPageView"\]\),_paq\.push\(\["enableLinkTracking"\]\),_paq\.push\(\["enableHeartBeatTimer"\]\),_paq\.push\(\["trackVisibleContentImpressions"\]\),function\(\){var e="https:\/\/mato\.evulid\.cc\/";_paq\.push\(\["setTrackerUrl",e\+"matomo\.php"\]\),_paq\.push\(\["setSiteId","1"\]\);var a=document,t=a\.createElement\("script"\),p=a\.getElementsByTagName\("script"\)\[0\];t\.async=!0,t\.src=e\+"matomo\.js",p\.parentNode\.insertBefore\(t,p\)}\(\);<\/script><\/head>/g' index.html

perl -pi -e 's/<title>Stable Diffusion Models<\/title>/<title>sdmodels Rentry Guide<\/title>/g' index.html
