# GEOCODER ASSIGNMENT

`GET https://geocoder-assignment.herokuapp.com/` - list all polygons

`GET https://geocoder-assignment.herokuapp.com/inside?point={"type":"Point","coordinates":[9.4797461,51.3127114]}` - geofence the geojson point

`POST https://geocoder-assignment.herokuapp.com/locations` - geocode the point

payload body - `{
	"location": {
		"name": "Location name"
    }
}`

`GET https://geocoder-assignment.herokuapp.com/locations/:id` - get the geocoded results
