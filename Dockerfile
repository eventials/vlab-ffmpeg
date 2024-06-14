# Etapa de compilação
FROM alpine:latest as build-stage

# Ativar repositório edge e instalar ferramentas de compilação e outras dependências
RUN apk update && apk add --no-cache \
    ca-certificates \
    git \
    build-base \
    yasm \
    x264-dev \
    libvorbis-dev \
    x265-dev \
    libvpx-dev \
    opus-dev \
    lame-dev \
    freetype-dev

# Copiar o diretório atual (onde está o código do ffmpeg) para o contêiner
COPY . /ffmpeg

# Configurar e compilar o ffmpeg
WORKDIR /ffmpeg
RUN ./configure \ 
    --prefix=/usr \
    --enable-gpl \
    --enable-libx264 \
    --enable-libopus \
    --enable-libvorbis \
    --enable-libmp3lame \
    --enable-nonfree \
    --enable-libvpx \
    --enable-libx265 

RUN make -j$(nproc) && make install

# Etapa final, apenas para manter os binários compilados
FROM alpine:latest
COPY --from=build-stage /usr /usr/local
