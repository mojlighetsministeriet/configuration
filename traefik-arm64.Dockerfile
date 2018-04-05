FROM hypriot/rpi-alpine:3.6
ADD https://github.com/containous/traefik/releases/download/v1.5.4/traefik_linux-arm64 /traefik
RUN apk upgrade --update --no-cache
RUN apk add --no-cache ca-certificates
Run chmod +x /traefik
EXPOSE 80 8080 443
ENTRYPOINT ["/traefik"]
