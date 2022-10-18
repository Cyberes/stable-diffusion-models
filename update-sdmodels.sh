rm -rf docs/sdmodels/*
mkdir -p docs/sdmodels/tmp
cd docs/sdmodels/tmp

wget -r -H -l 1 https://rentry.org/sdmodels -e robots=off -U "Mozilla/5.0 (iPhone; CPU iPhone OS 12_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Mobile/15E148 Safari/604.1"

mv rentry.org/static ..
mv rentry.co/sdmodels ../index.html
mv rentry.org/sdmodels/* ..
cd ..
perl -pi -e 's/\/static\//static\//g' index.html
rm -rf tmp

mv "static/css/bootstrap.min.css?v=84" static/css/bootstrap.min.css
mv "static/js/bootstrap.min.js?v=20" static/js/bootstrap.min.js
mv "static/js/jquery.min.js?v=20" static/js/jquery.min.js

perl -pi -e 's/bootstrap\.min\.css\?v=[0-9]*/bootstrap\.min\.css/g' index.html
perl -pi -e 's/bootstrap\.min\.js\?v=[0-9]*/bootstrap\.min\.js/g' index.html
perl -pi -e 's/jquery\.min\.js\?v=[0-9]*/jquery\.min\.js/g' index.html
