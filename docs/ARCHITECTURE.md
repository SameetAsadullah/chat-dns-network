# Network architecture

The project builds a small TCP network from five cooperating program types.

```text
clients ⇄ chat servers ⇄ proxy DNS ⇄ server-aware DNS ⇄ authoritative DNS
```

## Components

- **Client** connects to one of the chat servers and can either exchange messages or request a domain lookup.
- **Server** accepts client connections, coordinates chat traffic, and communicates its routing information upstream.
- **Proxy DNS** maintains the association between clients and servers and forwards lookup traffic.
- **Server-aware DNS** combines server routing with DNS request handling.
- **Authoritative DNS** resolves the domains listed in `IPs.txt`.

The default topology uses loopback networking and these ports:

| Component | Port(s) |
| --- | --- |
| Authoritative DNS | 5000 |
| Chat servers | 6000, 7000, 8000 |
| Proxy DNS | 9000 |

The implementation demonstrates TCP sockets, `bind`/`listen`/`accept`, `select`-based multiplexing, POSIX threads, routing tables, and a simple application-level message protocol.
