FROM node:lts-alpine

ENV TZ=America/Santiago

RUN apk add --update --no-cache \
    openssl \
    tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apk del tzdata

WORKDIR /app

COPY package*.json ./
RUN npm install --quiet

COPY . .

EXPOSE 5000

CMD ash -c "npm run dev"
