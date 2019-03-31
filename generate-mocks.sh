#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

Tools/Sourcery-0.15.0/bin/Sourcery.app/Contents/MacOS/Sourcery --config MaultaschenDomainTests/Mocks/SwiftyMocky.yml --watch --verbose &

wait

