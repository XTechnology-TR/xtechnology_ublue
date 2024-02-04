# This is the Containerfile for your custom image.

# Instead of adding RUN statements here, you should consider creating a script
# in `config/scripts/`. Read more in `modules/script/README.md`

# This Containerfile takes in the recipe, version, and base image as arguments,
# all of which are provided by build.yml when doing builds
# in the cloud. The ARGs have default values, but changing those
# does nothing if the image is built in the cloud.

# !! Warning: changing these might not do anything for you. Read comment above.
ARG IMAGE_MAJOR_VERSION=39
ARG BASE_IMAGE_URL=ghcr.io/ublue-os/silverblue-main

FROM ${BASE_IMAGE_URL}:${IMAGE_MAJOR_VERSION}

# The default recipe is set to the recipe's default filename
# so that `podman build` should just work for most people.
ARG RECIPE=recipe.yml 
# The default image registry to write to policy.json and cosign.yaml
ARG IMAGE_REGISTRY=ghcr.io/ublue-os


COPY cosign.pub /usr/share/ublue-os/cosign.pub

# Copy the bling from ublue-os/bling into tmp, to be installed later by the bling module
# Feel free to remove these lines if you want to speed up image builds and don't want any bling
COPY --from=ghcr.io/ublue-os/bling:latest /rpms /tmp/bling/rpms
COPY --from=ghcr.io/ublue-os/bling:latest /files /tmp/bling/files

ADD files/usr/etc/udev/rules.d /tmp/ublue-os/udev-rules/etc/udev/rules.d
ADD files/usr/etc/fish /tmp/ublue-os/fish/etc/fish
ADD files/usr/etc/rpm-ostreed.conf /tmp/ublue-os/update-services/etc/rpm-ostreed.conf
ADD files/usr/etc/modprobe.d /tmp/ublue-os/modprobe/etc/modprobe.d
ADD files/usr/etc/dracut.conf.d /tmp/ublue-os/dracut-conf/etc/dracut.conf.d

RUN tar cf /tmp/ublue-os/rpmbuild/SOURCES/ublue-os-udev-rules.tar.gz -C /tmp ublue-os/udev-rules
RUN tar cf /tmp/ublue-os/rpmbuild/SOURCES/ublue-os-fish.tar.gz -C /tmp ublue-os/fish
RUN tar cf /tmp/ublue-os/rpmbuild/SOURCES/ublue-os-update-services.tar.gz -C /tmp ublue-os/update-services
RUN tar cf /tmp/ublue-os/rpmbuild/SOURCES/ublue-os-modprobe.tar.gz -C /tmp ublue-os/modprobe
RUN tar cf /tmp/ublue-os/rpmbuild/SOURCES/ublue-os-dracut-conf.tar.gz -C /tmp ublue-os/dracut-conf


# Copy build scripts & configuration
COPY build.sh /tmp/build.sh
COPY config /tmp/config/

# Copy modules
# The default modules are inside ublue-os/bling
COPY --from=ghcr.io/ublue-os/bling:latest /modules /tmp/modules/
# Custom modules overwrite defaults
COPY modules /tmp/modules/

# `yq` is used for parsing the yaml configuration
# It is copied from the official container image since it's not available as an RPM.
COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

# Run the build script, then clean up temp files and finalize container build.
RUN chmod +x /tmp/build.sh && /tmp/build.sh && \
    rm -rf /tmp/* /var/* && ostree container commit
