FROM debian:bullseye

RUN apt update && apt install -y make curl unzip \
	&& rm -rf /tmp/* /var/tmp/* \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -fr /tmp/*.deb \
	&& rm -rf /usr/share/man/?? \
	&& rm -rf /usr/share/man/??_*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
	&& unzip awscliv2.zip \
	&& ./aws/install \
	&& rm awscliv2.zip

CMD ["/usr/local/bin/aws --help"]
