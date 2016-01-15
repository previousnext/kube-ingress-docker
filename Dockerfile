FROM nginx

ADD kube-ingress-0.0.1 /usr/local/bin/kube-ingress
RUN chmod a+x /usr/local/bin/kube-ingess

RUN apt-get update
RUN apt-get install -y python-setuptools ca-certificates
RUN apt-get clean

RUN easy_install supervisor
ADD supervisord.conf /etc/supervisord.conf
RUN mkdir /var/log/supervisor/

CMD [ "supervisord", "-n", "-c", "/etc/supervisord.conf" ]
