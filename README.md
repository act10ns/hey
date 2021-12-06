[![docker-push](https://github.com/act10ns/hey/actions/workflows/docker.yml/badge.svg?branch=master)](https://github.com/act10ns/hey/actions/workflows/docker.yml)

# `hey` `wait-for` Docker container

`hey` docker container with `wait-for`

## Usage

`hey` runs performance tests against an http endpoint:

    $ docker run -t -rm hey -z 2s https://www.google.com

```
Summary:
  Total:	2.1521 secs
  Slowest:	0.6466 secs
  Fastest:	0.1548 secs
  Average:	0.2158 secs
  Requests/sec:	219.7815


Response time histogram:
  0.155 [1]	|
  0.204 [419]	|■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.253 [1]	|
  0.302 [1]	|
  0.352 [1]	|
  0.401 [0]	|
  0.450 [0]	|
  0.499 [0]	|
  0.548 [2]	|
  0.597 [12]	|■
  0.647 [36]	|■■■


Latency distribution:
  10% in 0.1617 secs
  25% in 0.1644 secs
  50% in 0.1689 secs
  75% in 0.1739 secs
  90% in 0.5687 secs
  95% in 0.6148 secs
  99% in 0.6445 secs

Details (average, fastest, slowest):
  DNS+dialup:	0.0473 secs, 0.1548 secs, 0.6466 secs
  DNS-lookup:	0.0178 secs, 0.0000 secs, 0.1725 secs
  req write:	0.0001 secs, 0.0000 secs, 0.0071 secs
  resp wait:	0.1539 secs, 0.1393 secs, 0.2953 secs
  resp read:	0.0142 secs, 0.0003 secs, 0.0370 secs

Status code distribution:
  [200]	473 responses
```

`wait-for` waits for a tcp or http to become available before running
the command after the double-dash (`--`), for example:

    $ docker run -t --rm --network=host hey sh -c "/wait-for host.docker.internal:8081 -- echo ready"

And in another terminal:

    $ nc -l 8081

Using them together you can wait-for a service to become available
before running performance tests:

    $ docker run -t --rm --network=host hey sh -c "/wait-for host.docker.internal:8080 -- hey -z 2s http://host.docker.internal:8080"


## License

Copyright (c) 2021 Nick Satterly. Available under the MIT License.

`hey` Copyright (c) 2014 rakyll. Available under Apache 2.0 License.

`wait-for` Copyright (c) 2017 Eficode Oy. Available under the MIT License.
