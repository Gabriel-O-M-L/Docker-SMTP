docker build -t smtp-server .
docker run -d -p 8001:8001 smtp-server