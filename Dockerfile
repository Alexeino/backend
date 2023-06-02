ARG BaseImage=python:3.9
FROM ${BaseImage}
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY . .
RUN make requirements
RUN make clean
RUN make docker/migrations
RUN make docker/migrate
CMD [ "make","docker/runserver" ]