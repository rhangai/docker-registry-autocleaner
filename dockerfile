FROM anoxis/registry-cli as registry-cli

FROM registry:2
RUN apk add --no-cache supervisor apk-cron python2 py2-pip

COPY --from=registry-cli /requirements-build.txt /registry.py /
RUN pip install -r /requirements-build.txt

COPY entrypoint.sh registry-autocleaner.sh registry-job.sh /
COPY crontab /etc/crontabs/root
COPY supervisord.conf /etc/supervisord.conf

ENV REGISTRY_STORAGE_DELETE_ENABLED=true

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]