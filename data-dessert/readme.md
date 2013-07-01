Data gastronomification notes
====
I'm gonna prepare some sort of data gastronomification.
Chartio's bringing dinner, so we think dessert is good.

## Cookie theory
Here are some [different kinds of cookie](http://en.wikipedia.org/wiki/Cookie)


## Data
I looked for popular datasets on Socrata with lots of
columns and came up with these.

### San Francisco Parking
[SF parking lots](https://data.sfgov.org/Transportation/Off-Street-parking-lots-and-parking-garages/uupn-yfaw?)
is the most downloaded dataset on [data.sfgov.org](https://data.sfgov.org).
There are a lot of rows, so making it seems like a lot of work;
I'd rather have the students make the food themselves.
I could make a website that gives you the recipe for a particular
parking lot. Then people construct the cookie and put it on a map.
Then we eat them.

This is pretty good, but it has fewer variables than I would have
liked.

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

`land.use.type` is the zoning of the land. Rather than representing this
in the cookie, let's represent this in the map.

`log.parking.spots` is the log number of parking spots, including valet
and motorcycle. It is the log of the sum of the `RegCap`, `ValetCap`
and `MCCap` fields. It corresponds to the length of the slice of cookie;
all cookies are 1.5 inches wide, and their length is
`log.parking.spots` times 1 inch.

`has.valet` is whether there is at least one valet spot. That is, it's
whether `ValetCap` is greater than zero. If this is true, use red sprinkles.

`has.motorcycle` is whether there is at least one motorcycle spot. That is, it's
whether `MCCap` is greater than zero. If this is true, use blue sprinkles.

If both `has.valet` and `has.motorcycle` are true, use both red and blue
sprinkles. If neither is true, use brown sprinkles.

Once you have prepared the cookie, put it on a plate and then put the plate
at the appropriate point on the map.

### Lombardia museums
[This one](https://dati.lombardia.it/dati/Sanit-/Elenco-RSA-Accreditate/3syc-54zf)
is too perfect. It has information about museums, including many boolean
fields like audioguide service. Here are the fields we'll use.

* `SEDE_ACCESSIBILE_AI_DISABILI`: 
* `MUSEO_DENOMINAZIONE` (name):
* `MUSEO_TIPOLOGIA` (type of museum):
* `SEDE_COMUNE` (municipality):
* `SEDE_PROVINCIA` (province):
* `SEDE_APERTA_STATO`:
* `SEDE_CHIUSURA_MOTIVO` (why it closed):
* `MUSEO_INGRESSO`: `A PAGAMENTO` (paid) or `` (free)
* `MUSEO_GIORNO_INGRESSO_GRATUITO` (free day):

These are all boolean. `SI` is true, and anything else is false.

* `vi_sono_parcheggi_in_zona` (has parking)
* `ck_biblioteca` (library)
* `ck_aula_attivita_didattiche_ed` (educational activities)
* `ck_sale_studio`(study rooms)
* `ck_archivio` (archives?)
* `ck_fototeca` (foto library)
* `ck_sala_conferenze` (conference room)
* `ck_sala_proiezioni_audio_video` 
* `ck_biglietteria` (ticket office)
* `ck_guardaroba` (coat room)
* `ck_area_per_accoglienza` (welcome area)
* `ck_book_shop` 
* `ck_caffetteria_ristorante`
* `ck_area_x_prima_infanzia` (baby area)
