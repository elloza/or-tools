FROM debian:9

ARG SRC_GIT_BRANCH
ENV SRC_GIT_BRANCH ${SRC_GIT_BRANCH:-master}

RUN apt-get update -qq \
&& apt-get install -qq \
 git wget make cmake autoconf libtool zlib1g-dev gawk g++ curl subversion \
 swig lsb-release \
 python-dev python-wheel python-setuptools python-six \
 python3-dev python3-wheel python3-setuptools \
 default-jdk \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install dotnet
RUN apt-get update -qq \
&& apt-get install -qq gpg apt-transport-https \
&& wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
&& mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
&& wget -q https://packages.microsoft.com/config/debian/9/prod.list \
&& mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
&& apt-get update -qq \
&& apt-get install -qq dotnet-sdk-2.1 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Mono
#RUN apt-get install -qq apt-transport-https dirmngr \
#&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
#&& echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
#&& apt-get update -qq \
#&& apt-get install -qq mono-complete \
#&& apt-get clean \
#&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /root
RUN git clone -b "$SRC_GIT_BRANCH" --single-branch https://github.com/google/or-tools
WORKDIR /root/or-tools
RUN make third_party
RUN make all -j5
