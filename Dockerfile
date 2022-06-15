FROM fedora:35

ARG pkg_name
ENV pkg_name=$pkg_name

COPY . /$pkg_name/
WORKDIR /
RUN dnf install -y rpm-build rpmdevtools pandoc
RUN tar czf $pkg_name.tar.gz $pkg_name
RUN rpmdev-setuptree
RUN mv $pkg_name.tar.gz ~/rpmbuild/SOURCES
RUN cp /$pkg_name/rpm_spec/*.spec.in ~/rpmbuild/SPECS
RUN echo ~
