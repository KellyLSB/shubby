#!/usr/bin/env bash
#gox -compiler gccgo -cgo -verbose -tags="minimal" \
#	-osarch="$(go env GOOS)/$(go env GOARCH)" \
#	$@

#go get -u -v ./...
# Takes a while I'm going to determine show I might clean this up.
qtrcc && qtmoc && qtminimal || exit
go build -compiler "gccgo" -p 4 -v ./...
