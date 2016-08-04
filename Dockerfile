FROM gcr.io/stacksmith-images/ubuntu:14.04-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=elasticsearch \
    BITNAMI_IMAGE_VERSION=2.3.5-r0 \
    PATH=/opt/bitnami/java/bin:/opt/bitnami/elasticsearch/bin:$PATH

# Additional modules required
RUN bitnami-pkg install java-1.8.0_91-1 --checksum 7a43bd08c9a1fef1d98cdfb39bdb9c2023b9fc95734c910475b6e43d85aee957

# Install elasticsearch
RUN bitnami-pkg unpack elasticsearch-2.3.5-0 --checksum b3e38b5dee7662a31abd02f23259a093d2bbe497e2809ca19d4bffa9b74705a9

COPY rootfs /

VOLUME ["/bitnami/elasticsearch"]

EXPOSE 9200 9300

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["harpoon", "start", "--foreground", "elasticsearch"]
