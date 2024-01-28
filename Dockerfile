FROM alpine:3.19

RUN echo 'https://packages.atlascloud.xyz/atlascloud/alpine/edge/main' >> /etc/apk/repositories
RUN echo -e '-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzkJmyd4wS/W7Ly/Wfz9R\nKtg1FwdI5dpripX9yndqVMPo51uGoUN3Fj4p02Mbd4z8CESSSFZ2uusK82VAXqsz\nm4EfextAdvFr0KUrb0/pJnnasxnoals+MjWB2FE+rUGlSCoiNbkxu8UOIaNlzUpT\nZjus/ajvWpQhSXOKuAF641+AGacwActYKZleE/gWySzcIbcJ0Wx9xF6QAmwLc2V/\nV58c96OXsRB8zov/15PjJL3Q1QlZpZUgM62S0S2BPB/yYUXH25tXjtPGB092VDRN\nIlMIA8o/yUi5KCJUpwUBPNKDClS4hkTf8a2zdeaocc4GKrRk34Lqn87VP/krDt4m\n2QIDAQAB\n-----END PUBLIC KEY-----' > /etc/apk/keys/packages@kws1.com-5f35c485.rsa.pub
RUN apk add --no-cache samba

EXPOSE 137/tcp 137/udp 138/udp 139 445
RUN ["smbd", "--foreground", "--no-process-group"]
