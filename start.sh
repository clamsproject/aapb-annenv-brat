if [ -z $1 ]; then 
    echo "Specify a directory with raw text files" 
    exit 1
fi
if [ ! -d $1 ]; then 
    echo "Specify a directory with raw text files" 
    exit 1
fi

for f in $1/*; do 
    if [ ! -e ${f%.txt}.ann ] ; then 
        touch ${f%.txt}.ann
    fi
done

cp ann_conf/* $1/

docker run \
    -it \
    --rm \
    --name brat \
    -p 8080:80 \
    -v $1:/bratdata \
    -e BRAT_USERNAME=gbh \
    -e BRAT_PASSWORD=clams \
    -e BRAT_EMAIL=brat@example.com \
    cassj/brat
