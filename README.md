# heyman/filtered-port-forward

Docker image that forwards a local TCP port to a remote host. Supports whitelisting which hosts can connect.

## Required environment variables:

| Variable | Description |
| --- | ----------- |
| `LOCAL_PORT` | Local TCP port to accept connections on |
| `REMOTE_HOST` | The remote host that traffic should be forwarded to |
| `REMOTE_PORT` | TCP port on the remote host that the traffic should be forwarded to |
| `ALLOWED_HOSTS` | IP(s) that is/are allowed to connect to `LOCAL_PORT` (in `/etc/hosts.allow` format). Use `ALL` to allow all hosts. |

