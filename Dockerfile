FROM python:alpine AS base
WORKDIR /app
COPY requirements.txt .
RUN apk add --no-cache git
RUN pip install -r requirements.txt

FROM base as init
CMD ["mkdocs", "new", "DockeyDoc"]

FROM base as dev
RUN apk add --no-cache neovim
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]

FROM base as build
COPY . .

CMD ["mkdocs", "build"]

FROM httpd:2.4
COPY --from=build /app/site /usr/local/apache2/htdocs/
COPY httpd.conf /usr/local/apache2/conf/