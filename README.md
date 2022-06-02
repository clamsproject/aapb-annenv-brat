# Brat annotation environment for CLAMS-AAPB project 

This repository contains a dockerized version of [brat 1.3](https://brat.nlplab.org/). It is configurable for different text annotation projects. 

## Prerequisite

* `docker` for running the brat environment
* (optional) `git` for uploading ann files to annotation collection repository

## How to run 

From you terminal, 
1. Clone this repository into local disk
    ```
    git clone https://github.com/clamsproject/aapb-annenv-brat.git
    cd aapb-annenv-brat 
    ```
1. See inside `configs` directory and check if there's a subdirectory of which name matches to the project name to work on.
    ```
    ls configs/
    ```
1. Start up the brat environment using the `start.sh`
    ```
    ./start.sh <project_name> <raw_data_directory>
    ```
    * To avoid any space related to issues, we recommend using project names and data directory names WITHOUT any spaces in them. 
    * data directory should contains all raw text files to annotate, and all those files MUST have names end with `.txt`. 
    * Brat will be running as a web app, and can be accessible at `http://localhost:8080/`. To change the port, edit `-p` line in the `start.sh`
1. Use brat on your web browser to annotate text documents. To annotate anything, one should be *logged in* to the brat. Use `gbh` and `clams` to log in. To change the login, edit `BRAT_USERNAME` and/or `BRAT_PASSWORD` lines in the `start.sh`. 
1. For the tool itself, please refer to the [brat manual](https://brat.nlplab.org/manual.html) for more detailed usage. 
1. When done, go back to terminal and hit `ctrl+c`. It will take seconds to shut down brat. For security reasons, it is recommended that one shutdown brat after every work session. All work are automatically saved in `.ann` files in the data directory. 
1. (Optionally) Once annotation is done (fully or partly), use `upload.sh` to upload the annotation files to the annotation collection repository on the github.
    ```
    ./upload.sh <project_name> <raw_data_directory>
    ```
