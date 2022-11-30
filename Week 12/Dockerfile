FROM alpine
RUN apk update && apk add python3
RUN touch index.html
RUN echo "<html><h1>Testing web</h1></html>" >> index.html
ENTRYPOINT ["python3", "-m", "http.server"]