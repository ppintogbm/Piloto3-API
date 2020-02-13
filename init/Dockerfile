FROM  busybox

COPY  templates /templates
COPY  prepare.sh /prepare.sh
RUN   chmod +x /prepare.sh

ENTRYPOINT ["/prepare.sh"]