FROM fedora:26
COPY root /opt/docker/
RUN ["sh", "/opt/docker/run.sh"]
USER user
COPY script.sh /script.sh
ENTRYPOINT ["sh", "/opt/docker/entrypoint.sh"]
CMD []