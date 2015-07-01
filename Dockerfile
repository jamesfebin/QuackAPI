FROM clojure:lein-2.5.1
MAINTAINER Roberto Acevedo "rxacevedo@fastmail.com"

ENV PORT=80 LEIN_REPL_PORT=4001

# Required by Incanter
RUN apt-get update && \
    apt-get install -y libgfortran3

# Ports
EXPOSE 80 4001

# Add profiles
RUN curl -o ~/.lein/profiles.clj https://raw.githubusercontent.com/rxacevedo/.lein/master/profiles.clj

ADD . /code
WORKDIR /code
RUN ["lein", "deps"]

ENTRYPOINT ["lein"]
CMD ["run"]
