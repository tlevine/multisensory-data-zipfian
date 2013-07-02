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

`types` are the business structure of the parking lot. They are
formed from `PrimeType` and `SecondType`. Add toppings corresponding
to those types; if there are two types, add two toppings.

* For (`CGO`), add an Oreo.
* For (`CPO`), add a Reese's Piece.
* For (`FPA`), add a marshmallow.
* For (`PHO`), add cherry.
* For (`PPA`), add a dollop of jam.

`garage` is formed from the `GarOrLot` field, removing things that
are neither garages nor lots and things that are both garages and lots.
(These are a very small minority.) It corresponds to the base cookie

* Garage is brownie.
* Lot is chocolate chip cookie cake.

`private` is whether the parking lot owned by a private entity. It is
formed from the `Owner` field. It corresponds to the presence of nuts
in the cookie/brownie.

* For a public parking lot, use the brownie/cookie **with** nuts.
* For private, use the one **without** nuts.

`land.use.type` is the zoning of the land. Rather than representing this
in the cookie, let's represent this in the map. Well I guess you might as
well write it on the plate. Actually, it's mostly empty, so let's ignore it.

`log.parking.spots` is the log number of parking spots, including valet
and motorcycle. It is the log of the sum of the `RegCap`, `ValetCap`
and `MCCap` fields. It corresponds to the length of the slice of cookie;
all cookies are 1.5 inches wide, and their length is
`log.parking.spots` times 1 inch.

`has.valet` is whether there is at least one valet spot. That is, it's
whether `ValetCap` is greater than zero. If this is true, use red icing.

`has.motorcycle` is whether there is at least one motorcycle spot. That is, it's
whether `MCCap` is greater than zero. If this is true, use blue icing.

If both `has.valet` and `has.motorcycle` are true, use both red and blue
icing. If neither is true, use white icing.

Once you have prepared the cookie, put it on a plate and then put the plate
at the appropriate point on the map. Perhaps I should switch the longitude
and latitude for just a grid cell on a less precise map.

This is pretty good in terms of interestingness and types of variables, but
it has fewer variables than I would have liked. It has like nine variables.

### Lombardia museums
[This one](https://dati.lombardia.it/dati/Sanit-/Elenco-RSA-Accreditate/3syc-54zf)
is too perfect. It has information about museums, including many boolean
fields like audioguide service. Here are the fields we'll use.

* `SEDE_ACCESSIBILE_AI_DISABILI`: `NON ACCESSIBILE`, `PARZIALMENTE` or `TOTALMENTE`
* `MUSEO_DENOMINAZIONE` (name):
* `MUSEO_TIPOLOGIA` (type of museum):
* `SEDE_COMUNE` (municipality)
* `SEDE_PROVINCIA` (province)
* `MUSEO_INGRESSO`: `A PAGAMENTO` (paid) or `GRATUITO` (free)

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

These are things I created.

* `has.free.day`: Whether there is a free day at the museum,
    based on `MUSEO_GIORNO_INGRESSO_GRATUITO`

That's like 19 variables, but they're mostly boolean and none
are particularly numerical.

### Datasets that I looked at briefly
These [landslides](https://data.seattle.gov/-/-/e498-ae22)
are cool, but the only numerical field is date, and there isn't
much variance in the other fields' values.

[Worker compensation](https://data.oregon.gov/Business/Workers-Compensation-Costs-Percent-of-National-Med/52s9-f7ab)
is deceptively wide; it can be melted into three columns.

## Recipe
I decided to go with SF parking.
I'm planning for about 40 people, one cookie each,
with some extra to account for variance in recipe selections.

Broadly speaking, we need these food items.

* Cookie base (We can swap brownie with cookie cake if that makes baking/purchasing easier.)
  * An uncut brownie without nuts (120 square inches)
  * An uncut brownie with nuts (20 square inches)
  * An uncut cookie cake without nuts (210 square inches)
  * An uncut cookie cake with nuts (70 square inches)
* A package of each of these toppings (Other toppings can be substituted if these aren't easy.)
  * Oreos
  * Reese's Pieces
  * marshmallows
  * marashino cherries
  * jam
* Icing
  * white icing (enough for 400 square inches of cookie)
  * colorful icing of one color (just one small package)
  * colorful icing of another color (just one small package)
* Two bottles of sprinkles, each of a different color
* 40 small plates or napkins

The plates of cookies are going to go on a map. I see a few
reasonable ways of making the map

* a big print-out of that big map
* a tablecloth (on a table) that I can draw the map on
* an area on the floor that I can put masking tape on

Assembly process

1. Tom explains the process.
2. While Tom explains the process, someone passes out recipes, one per person.
3. When the explanation is explained, people go to the table
    corresponding to their type of cookie. Each table has the
    one type of cookie and all of the toppings.
4. People assemble their cookies.
5. People put the cookies on the map.
6. We discuss the map and take a picture.
7. Then we eat.

Utencils

We have four tables. At each table, we need

* A knife
* Two spoons
* Three spatulas

## Calculating amounts
For the proportions of the cakes, consider this

    parking$private <- parking$Owner == 'Private'
    cookies <- ddply(subset(parking, GarOrLot == 'G' | GarOrLot == 'L'), c('private', 'GarOrLot'), function(df) {
      spots <- rowSums(df[c('RegCap', 'ValetCap', 'MCCap')])
      c(mean.cookie.area = mean(log(spots)), nlots = nrow(df))
    })
    weighted.mean(cookies$mean.cookie.area, cookies$nlots)
    cookies$cookie.area.to.make <- cookies$mean.cookie.area * cookies$nlots * (60 / max(cookies$nlots))
    cookies
    # private GarOrLot mean.cookie.area nlots cookie.area.to.buy
    # 1   FALSE        G         5.642826    42           17.97714
    # 2   FALSE        L         4.122977   211           65.98848
    # 3    TRUE        G         4.710757   317          113.27257
    # 4    TRUE        L         3.461618   791          207.69706

* `FALSE`, `G` is brownie with nuts, so we need 20 square inches of that
* `FALSE`, `L` is cookie cake with nuts, so we 70 square inches of that
* `TRUE`, `G` is brownie without nuts, so we need 120 square inches of that
* `TRUE`, `L` is cookie cake without nuts, so we need 210 square inches of that

We'll need approximately equal amounts of the different toppings.

    summary(parking$PrimeType)
      CGO CPO FPA PHO PPA 
    2  49 487  71 301 486 

We won't need many sprinkles.

    summary(parking$MCCap == 0 & parking$ValetCap == 0)
       Mode   FALSE    TRUE    NA's 
    logical      55    1341       0 

## Directions

1. Get a plate, and write your name on the bottom of it so you can find your
cookie later.
2. Go to the website, and read the recipe that was selected for you.
    Actually, maybe we just print this out and hand them out to people.
3. Construct the cookie on the plate.
4. Put the plate on the appropriate point on the map.
