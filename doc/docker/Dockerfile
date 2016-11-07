FROM phusion/passenger-full
MAINTAINER COINROOTS community@coinroots.com

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN apt update
RUN apt-get -y install imagemagick gsfonts

ADD coinroots /home/app/coinroots
RUN chown -R app:app /home/app/coinroots

USER app
ENV HOME /home/app

WORKDIR /home/app/coinroots
RUN bundle install --without development test --path vendor/bundle

# RUN ./bin/init_config
ADD conf/rails-amqp.yml /home/app/coinroots/config/amqp.yml
ADD conf/rails-database.yml /home/app/coinroots/config/database.yml
ADD conf/rails-application.yml /home/app/coinroots/config/application.yml
ADD conf/nginx-coinroots-env.conf /etc/nginx/main.d/coinroots-env.conf

USER root

RUN rm /etc/nginx/sites-enabled/default
ADD conf/nginx-coinroots-with-ssl.conf /etc/nginx/sites-available/coinroots
RUN ln -s /etc/nginx/sites-available/coinroots /etc/nginx/sites-enabled/coinroots

RUN mkdir /etc/nginx/ssl_keys/
ADD conf/ssl_keys/server.crt /etc/nginx/ssl_keys/server.crt
ADD conf/ssl_keys/server.key /etc/nginx/ssl_keys/server.key

RUN chown -R app:app /home/app/coinroots/config

RUN rm -f /etc/service/nginx/down

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
