# Minimal Docker image for Bowtie2 + samtools using Bowtie2image base
FROM niemasd/bowtie2:2.5.5

# install samtools
RUN apk update && \
    apk add --no-cache bash bzip2-dev xz-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.24/samtools-1.24.tar.bz2" | tar -xj && \
    cd samtools-1.24 && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-1.24
