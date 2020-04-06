## Install
```
npm i
```
## Comparing results

### Node app
```
npm start
GET http://localhost:3030/big
```

Check reponse:
```
No gzip
Size: 105 Kb
```


### Nginx over node.js using Docker
```
docker-compose up --build api
GET http://localhost:3030/big
```

Check reponse headers - 
```
Server: nginx
Content-Encoding: gzip
Size: 36,3 Kb
```