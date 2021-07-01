SHELL := /bin/bash
.PHONY: help build pull up stop restart destroy
.DEFAULT_GOAL := help

include .env

help:			## This help message
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

build: 			## Build services
	docker-compose build

pull: 			## Pull services
	docker-compose pull

up: 			## Deploy services
	docker-compose up -d --remove-orphans

stop: 			## Stop services
	docker-compose stop

restart: 		## Restart services
	docker-compose restart

.PHONY: destroy
destroy:    	## Remove services
	docker-compose down --remove-orphans
