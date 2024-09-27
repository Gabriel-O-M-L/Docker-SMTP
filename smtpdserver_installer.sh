docker build -t smtp-server .
docker run -d -p 8009:8009 smtp-server