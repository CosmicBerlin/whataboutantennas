FROM nginx:1.18

RUN rm /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./antennafield.guide.conf /etc/nginx/conf.d/default.conf
