FROM 	ibmcom/ace

#Move bar file compiled via Jenkinsfile
COPY --chown=1000:1000 compiled.bar bars/
COPY --chown=1000:1000 lib/db2jcc-db2jcc4.jar .

#Deploy compiled bar 
USER	1000:1000
RUN  	/bin/bash -c 'ace_compile_bars.sh'