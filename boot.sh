#!/usr/bin/env bash

echo "This will setup the neighborly environment in ./neighborly"

if [ ! -e virtualenv.py ] ; then
    wget http://bitbucket.org/ianb/virtualenv/raw/tip/virtualenv.py || exit 3
else
    echo "virtualenv.py already exists"
fi
python virtualenv.py neighborly || exit 4
cd neighborly
./bin/pip install Django psycopg2
mkdir src
cd src
git clone git@github.com:ianb/neighborly.git
cd ..

PGUSER=postgres createdb -T template_postgis neighborly

