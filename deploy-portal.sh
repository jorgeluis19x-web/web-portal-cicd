#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp app_portal.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  app_portal.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 7070" >> tempdir/Dockerfile
echo "CMD python /home/myapp/app_portal.py" >> tempdir/Dockerfile

cd tempdir
docker build -t img_portal .
docker run -t -d -p 7070:7070 --name portal_activo img_portal
docker ps -a 
