#!/bin/bash

api="https://owen-wilson-wow-api.onrender.com"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_random_wow() {
	# 1 - year: (string): <year>
	# 2 - movie: (string): <movie>
	# 3 - director: (string): <director>
	# 4 - wow_in_movie: (integer): <wow_in_movie>
	# 5 - results: (integer): <results>
	# 6 - sort: (string): <movie, release_date, year, director, number_current_wow>
	# 7 - direction: (string): <asc, desc>
	url="$api/wows/random"
	if [[ ! -z "$1" ]]; then
		url="$url?year=$1"
	fi
	if [[ ! -z "$2" ]]; then
		url="$url&movie=$2"
	fi
	if [[ ! -z "$3" ]]; then
		url="$url&director=$3"
	fi
	if [[ ! -z "$4" ]]; then
		url="$url&wow_in_movie=$4"
	fi
	if [[ ! -z "$5" ]]; then
		url="$url&results=$5"
	fi
	if [[ ! -z "$6" ]]; then
		url="$url&sort=$6"
	fi
	if [[ ! -z "$7" ]]; then
		url="$url&direction=$7"
	fi
	curl --request GET \
		--url "$url" \
    	--user-agent "$user_agent" \
    	--header "content-type: application/json"
}

function get_wow_movies() {
	curl --request GET \
		--url "$api/wows/movies" \
    	--user-agent "$user_agent" \
    	--header "content-type: application/json"
}

function get_wow_directors() {
	curl --request GET \
		--url "$api/wows/directors" \
    	--user-agent "$user_agent" \
    	--header "content-type: application/json"
}
