rm -rf docs/sdmodels/*
mkdir -p docs/sdmodels/tmp
cd docs/sdmodels/tmp

wget -r -H -l 1 https://rentry.org/sdmodels -e robots=off -U "Mozilla/5.0 (iPhone; CPU iPhone OS 12_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Mobile/15E148 Safari/604.1"

mv rentry.org/static ..
mv rentry.co/sdmodels ../index.html
cd ..
sed -i -e 's/\/static\//static\//g' index.html
rm -rf tmp
