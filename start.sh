#! /bin/bash 

if [ $# -ne 2 ]; then 
    echo "Specify a project name and a directory with raw text files" 
    exit 1
fi
conf_dir="$(dirname $0)/configs/$(basename $1)"
data_dir="$2"
if [ ! -d $conf_dif ]; then 
    echo "Cannot find a configuratino for the project [ $1 ]."
    exit 1
fi

for f in $data_dir/*.txt; do 
    if [ ! -e ${f%.txt}.ann ] ; then 
        touch ${f%.txt}.ann
    fi
done

set -x
cp "$conf_dir"/*.conf "$data_dir"

docker run \
    -it \
    --rm \
    --name brat \
    -p 8080:80 \
    -v $data_dir:/bratdata \
    -e BRAT_USERNAME=gbh \
    -e BRAT_PASSWORD=clams \
    -e BRAT_EMAIL=brat@example.com \
    cassj/brat
