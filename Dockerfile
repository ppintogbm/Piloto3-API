FROM 	ibmcom/ace

#Move bar file compiled via Jenkinsfile
COPY 	compiled.bar bars/
COPY  lib/db2jcc-db2jcc4.jar .

#Change permissions from copied bar
USER	root
RUN		chown -R aceuser:mqbrkrs bars/; \
		 	chown aceuser:mqbrkrs db2jcc-db2jcc4.jar;

#Deploy compiled bar 
USER	aceuser:mqbrkrs
RUN  	echo "Datos de usuario: $(id -un):$(id -gn)\($(id -u):$(id -g)\)" &&\
			ls -la bars/ && \
    	ace_compile_bars.sh