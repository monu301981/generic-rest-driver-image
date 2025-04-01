FROM python:3.10

RUN apt-get update && apt-get -y install cron vim

WORKDIR /app

USER root

COPY crontab /etc/cron.d/crontab

COPY pingapi.py /app/pingapi.py

RUN chmod 0644 /etc/cron.d/crontab

RUN /usr/bin/crontab /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Symlink the cron to stdout
RUN ln -sf /dev/stdout /var/log/cron.log

# Run the command on container startup
# CMD cron && tail -F /var/log/cron.log 2>&1

# run crond as main process of container
CMD ["cron", "-f"]

# docker build -t my-python-image .
# docker run -v .:/app my-python-image