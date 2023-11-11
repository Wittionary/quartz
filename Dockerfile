FROM node:20-slim as builder
WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json* .
RUN npm ci

<<<<<<< HEAD
RUN apk add --no-cache go hugo git make perl
RUN git config --global --add safe.directory '/quartz'
RUN go install github.com/jackyzha0/hugo-obsidian@latest
ENV PATH="/root/go/bin:$PATH"
RUN git clone https://github.com/jackyzha0/quartz.git /quartz

WORKDIR /quartz

CMD ["make", "serve"]
=======
FROM node:20-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ /usr/src/app/
COPY . .
CMD ["npx", "quartz", "build", "--serve"]
>>>>>>> e9f4e28a2d3e0b529586ddb5a50680a6e66412f3
