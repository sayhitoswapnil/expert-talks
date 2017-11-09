FROM rocker/ropensci
RUN install2.r -r 'http://cran.rstudio.com' googleCloudStorageR
RUN install2.r -r 'http://cran.rstudio.com' ggplot2
RUN install2.r -r 'http://cran.rstudio.com' XLConnect
RUN install2.r -r 'http://cran.rstudio.com' devtools
RUN install2.r -r 'http://cran.rstudio.com' LaplacesDemon
RUN install2.r -r 'http://cran.rstudio.com' bigrquery
RUN apt-get -y update && apt-get -y install libxml2-dev
RUN apt-get -y install libssl-dev
RUN apt-get -y install libcurl4-openssl-dev
RUN apt-get install curl
CMD R --no-save
RUN mkdir -p /usr/local/src/myscripts
RUN chmod 777 /usr/local/src/myscripts
RUN git clone https://github.com/sayhitoswapnil/expert-talks.git /usr/local/src/myscripts
COPY git_update_run.sh /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts
RUN chmod 777 git_update_run.sh
RUN apt-get update && apt-get install -my wget gnupg
RUN apt-get -qqy update && apt-get install -qqy \
        curl \
        gcc \
        python-dev \
        python-setuptools \
        apt-transport-https \
        lsb-release \
        openssh-client \
        git \
    && easy_install -U pip && \
    pip install -U crcmod   && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk \
        kubectl && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image
VOLUME ["/root/.config"]

