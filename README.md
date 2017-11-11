# Couchbase Docker Container

#### Build Image
`docker build -t mnurkerim/couchbase:1.0 .`

#### Run Container
`docker run -ti -d --name cb-db -p 8091-8094:8091-8094 -p 11210:11210 mnurkerim/couchbase:1.0`

