# Drivers API
Simple Taxi Drivers API

## Challenge
This project is my implementation to a challenge to build a Restful API following this specification:

* Endpoint /drivers
** Create drivers. Attributes: name and car plate
** List all drivers
** Show one driver

* Endpont /drivers/:id/status
** Create or update a driver status. Attributes: latitute, longitude, driver_available(true or false indicating if the driver is available for a ride)
** Show driver current status

* Endpoint /drivers/in-area
** Search for drivers in a retangular region. Filters: sw(southwest border), ne(northeast border), available(list drivers if they are available or not)

Although I don't agree with the API design, this is was it was presented me, and I tried to do the best implementation according
to the specification.

## Goals
The objective is to use as much as possible only default rails features, avoiding to use
external gems when possible. 
The API is really simple, it permits create and find drivers, and also set driver's current
position and search for drivers within a region.
