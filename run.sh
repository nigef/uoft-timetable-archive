#!/bin/bash
ACADEM_SESSION='201701'
SECTION='S,Y'

[ -d $ACADEM_SESSION ] || mkdir $ACADEM_SESSION

git pull --rebase

SCRAPENAME=$(date +%s).json

curl --silent "https://timetable.iit.artsci.utoronto.ca/api/courses?org=&code=&section=${SECTION}&studyyear=&daytime=&weekday=&prof=&breadth=&online=&waitlist=&available=&title=" > $ACADEM_SESSION/$SCRAPENAME 

ln $ACADEM_SESSION/$SCRAPENAME $ACADEM_SESSION/latest.json

git add "${ACADEM_SESSION}/"
git commit -m "Add new scrape"
git push origin master

