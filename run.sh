#!/bin/sh -e

exec gosu mqforward /mqforward run -c /etc/mqforward/mqforward.ini
