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
It corresponds to the kind of cookie.

* CGO is oatmeal raisin
* CPO is chocolate chip
* FPA is sugar
* PHO is peanut butter
* PPA is 
* Multiple types is 

`garage` is formed from the `GarOrLot` field, removing things that
are neither garages nor lots and things that are both garages and lots.
(These are a very small minority.) It corresponds to

* Garage is
* Lot is

`private` is whether the parking lot is private, formed from the `Owner`
field. It corresponds to the

* 
* 
