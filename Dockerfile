FROM 	ibmcom/ace

#Move bar file compiled via Jenkinsfile
COPY --chown=aceuser:mqbrkrs compiled.bar bars/
COPY --chown=aceuser:mqbrkrs lib/db2jcc-db2jcc4.jar .

#Deploy compiled bar 
USER	aceuser:mqbrkrs
RUN  	/bin/bash -c 'ace_compile_bars.sh'