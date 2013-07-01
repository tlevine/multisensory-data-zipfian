Data gastronomification notes
====
I'm gonna prepare some sort of data gastronomification.
Chartio's bringing dinner, so we think dessert is good.

## Cookie theory
Here are some [different kinds of cookie](http://en.wikipedia.org/wiki/Cookie)


## Data
I looked for popular datasets on Socrata with lots of
columns and came up with these

### San Francisco Parking
[SF parking lots](https://data.sfgov.org/Transportation/Off-Street-parking-lots-and-parking-garages/uupn-yfaw?)
is the most downloaded dataset on [data.sfgov.org](https://data.sfgov.org).
There are a lot of rows, so making it seems like a lot of work;
I'd rather have the students make the food themselves.
I could make a website that gives you the recipe for a particular
parking lot. Then people construct the cookie and put it on a map.
Then we eat them.

`lot.type` is formed by combining the prime and second type columns.
It corresponds to the kind of .

* CGO is 
* CPO is
* FPA is 
* PHO is 
* PPA is 
* Multiple types is 

`garage` is formed from the `GarOrLot` field, removing things that
are neither garages nor lots and things that are both garages and lots.
(These are a very small minority.) It corresponds to the base cookie

* Garage is brownie.
* Lot is chocolate chip cookie cake.

`private` is whether the parking lot owned by a private entity. It is
formed from the `Owner` field. It corresponds to the type of icing.

* Public is white (vanilla) icing.
* Private is brown (chocolate) icing.

`landusetype` is the zoning of the land. Rather than representing this
in the cookie, let's represent this in the map.
