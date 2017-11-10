FROM google/cloud-sdk:alpine
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN gcloud components install kubectl -q --no-user-output-enabled
COPY cronfile /var/spool/cron/crontabs/root
RUN mkdir -p /usr/local/src/myscripts
RUN chmod 777 /usr/local/src/myscripts
COPY cleanupJobs.sh /usr/local/src/myscripts
CMD crond -l 2 -f