#!/bin/bash

trap "exit" INT TERM ERR
trap "kill 0" EXIT

while true
do
    Tools/Sourcery-0.15.0/bin/Sourcery.app/Contents/MacOS/Sourcery --config MaultaschenDomainTests/Mocks/SwiftyMocky.yml
    Tools/Sourcery-0.15.0/bin/Sourcery.app/Contents/MacOS/Sourcery --config MaultaschenDataTests/Mocks/SwiftyMocky.yml
	sleep 5
done

## Unfortuntely, running multiple instances of Sourcery in watch-mode will sometimes lead to issues:
## The same Mock.generated.swift is generated for multiple destinations.
## I guess there is a caching issue.
#Tools/Sourcery-0.15.0/bin/Sourcery.app/Contents/MacOS/Sourcery --config MaultaschenDomainTests/Mocks/SwiftyMocky.yml --watch --verbose &
#Tools/Sourcery-0.15.0/bin/Sourcery.app/Contents/MacOS/Sourcery --config MaultaschenDataTests/Mocks/SwiftyMocky.yml--watch --verbose &
#wait

