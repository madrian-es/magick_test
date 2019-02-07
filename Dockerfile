FROM microsoft/dotnet:2.2-sdk
COPY . /opt/build/
RUN cd /opt/build && dotnet publish --framework netcoreapp2.2 -c Debug -r debian-x64 && \
    cp -R magick_test/bin/Debug/netcoreapp2.2/debian-x64/publish/ /opt/bin/ && \
    mkdir /opt/test && \
    cp testfile/TEST.CR2 /opt/test/TEST.CR2
CMD /opt/bin/magick_test /opt/test/TEST.CR2 /opt/test/out.ptif