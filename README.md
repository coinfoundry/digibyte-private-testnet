## DigiByte three-node private network in regtest mode

- Node Pool
  - RPC Port 16101, Username: user, Password: pass
- Node Bob
  - RPC Port 16102, Username: user, Password: pass
- Node Alice
  - RPC Port 16103, Username: user, Password: pass

### Addresses

- Pool:  myhrXHY9pPLS8wcsCrdpg4FxVEEaXRM3YU
- Bob:   n4LgyAU3XeMJgvqLm1ddGa2ddFa6W9UzLD
- Alice: mrMUE2a5oFNzontQcSDBzGL4ZXdrTg1Sxh

### To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 16101:16101 -p 16102:16102 -p 16103:16103 coinfoundry/digibyte-private-testnet
```

### Generating blocks:

```bash
docker exec -i -t <container_id> /usr/bin/digibyte-cli -datadir=/data/node-pool generate 1
```

### Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:16101/
```
