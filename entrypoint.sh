#!/bin/sh

sh -ce "PORT=3003 npm run start & nginx -g \"daemon off;\""
