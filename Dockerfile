# ファイルを集めるだけなので、ビルド機のアーキテクチャで動かす (arm64 用でも QEMU 不要)
FROM --platform=$BUILDPLATFORM node:25-alpine AS build
WORKDIR /src
COPY package.json package-lock.json ./
# 全コア入りの @emulatorjs/cores は数百 MB あるので入れず、FBNeo だけ使う
RUN npm ci --omit=optional --ignore-scripts
COPY site/ /out/
RUN cp -r node_modules/@emulatorjs/emulatorjs/data /out/data \
 && cp -r node_modules/@emulatorjs/core-fbneo/. /out/data/cores/

FROM nginxinc/nginx-unprivileged:1.31.7-alpine
COPY --from=build /out /usr/share/nginx/html
