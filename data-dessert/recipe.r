parking <- read.csv('uupn-yfaw.csv')
recipes <- data.frame(
  nuts = parking$Owner != 'Private',
  cookie.type = factor(parking$GarOrLot, levels = c('G', 'L')),
  length = round(log(rowSums(parking[c('RegCap', 'ValetCap', 'MCCap')])), 1), #inches
  width = 1, #inch
  red.icing = parking$ValetCap > 0,
  blue.icing = parking$MCCap > 0,
  topping.1 = factor(parking$PrimeType, levels = c('CGO', 'CPO', 'FPA', 'PHO', 'PPA')),
  topping.2 = factor(parking$SecondType, levels = c('CGO', 'CPO', 'FPA', 'PHO', 'PPA'))
)
levels(recipes$cookie.type) <- c('brownie', 'cookie.cake')
levels(recipes$topping.1) <- levels(recipes$topping.2) <- c(
 'Oreo',
 "Reese's Piece",
 'marshmallow',
 'cherry',
 'jam'
)
lng.lat <- ldply(strsplit(gsub('[^0-9,-.]', '', parking$Location.1), ','), function(l) { c(longitude=l[2], latitude = l[1]) })
lng.lat$longitude <- as.numeric(lng.lat$longitude)
lng.lat$latitude <- as.numeric(lng.lat$latitude)
parking <- cbind(parking, lng.lat)

both <- cbind(recipes, parking)
both <- subset(both, !is.na(cookie.type))
both$Location.1 <- NULL

set.seed(123456)
class.recipes <- both[sample(rownames(both), 60),]
cat('Longitude range:', paste(range(both$longitude), collapse = ' to '), '\n')
cat('Latitude range:', paste(range(both$latitude), collapse = ' to '), '\n')
write.csv(class.recipes, 'recipes.csv')
