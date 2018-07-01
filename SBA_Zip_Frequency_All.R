myDF <- read.csv("dataset/PuertoRicoSBA2017.csv", header = FALSE, colClasses = "character")
names(myDF) <- c("1", "2", "3", "4", "5","zipcode", "7", "8","9","10","11","12","13","14")
head(myDF)

#load the zipcode library
library(zipcode)
data(zipcode)

v <- zipcode$zip %in% names((table(myDF$zipcode)))
mypoints <- data.frame(lat=zipcode$latitude[v],lon=zipcode$longitude[v])

#plotting stuff: showing puertorico map
library(ggmap)
PuertoRico <- as.numeric(geocode("Puerto Rico"))
PuertoMap<- ggmap(get_googlemap(center = PuertoRico, zoom = 9))


#Frequency of zipcode
zipFreq <- table(myDF$zipcode)
#Colnames(zipFreq)[1]<-"zipcode"
#pull out the names of dataframe
#names(zipFreq)

#converting into Dataframe, doesn't work
#as.data.frame.matrix(zipFreq) 

#zipFreq actual values are the frequency so you can do something like:
# zipFreq + 100

#converting into Dataframe
zipWithFrequncy <- data.frame(zipFreq)
#getting rid of last item on dataframe
zipWithFrequncy <- zipWithFrequncy[-165,]

#extracting the logitude and latitude of zip codes mentioned in SBA 2017
SBA_PR_zips <- zipcode$zip %in% names(table(zipWithFrequncy$Var1))
sum(SBA_PR_zips)


PRpoints <- data.frame(lat=zipcode$latitude[SBA_PR_zips],lon=zipcode$longitude[SBA_PR_zips])
PRpoints


#adding latitude and longitude to the dataframe zipWithFrequency
mergedDF <- cbind(zipWithFrequncy, PRpoints)
mergedDF

write.csv(mergedDF, file = "/home/ap/Desktop/Pip/datasets/ZipFreqPRSBA.csv")

PuertoMap + geom_point(data = mergedDF, aes(x=lon,y=lat,size=mergedDF$Freq))




