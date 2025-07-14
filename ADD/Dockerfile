FROM almalinux:9
RUN dnf install nginx -y
ADD https://raw.githubusercontent.com/LNarendra532/notes-1/refs/heads/main/session-51.txt /usr/share/nginx/html/session-51.txt
RUN chmod +r /usr/share/nginx/html/session-51.txt
# ADD sample-1.tar /tmp/    
CMD [ "nginx", "-g" , "deamon off" ]