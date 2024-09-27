docker build -t smtp-server .
docker run -d -p 8005:8005 smtp-server