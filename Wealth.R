PRIncZip <- read.csv("/scratch/scholar/t/train32/groupdata/Puerto Rico Income ZipCode.csv")
PRIncZip


FLIncZip <- read.csv("/scratch/scholar/t/train32/groupdata/Florida _Income_Zipcode.csv")
FLIncZip$Avg..Income.H.hold <- as.numeric(gsub('[$,]', '',FLIncZip$Avg..Income.H.hold))
FLIncZip <- FLIncZip [order(FLIncZip$Zip.Code),]
FL_Matrix <- data.matrix(FLIncZip)
mypoints <- data.frame(FLIncZip$Zip.Code, FLIncZip$Avg..Income.H.hold)
row.names(FLIncZip) <- FLIncZip$Zip.Code
FLIncZip
head(FLIncZip)

FL_heatmap <- heatmap(FL_Matrix, Rowv = NA, Colv = NA, col = cm.colors(256),scale = "column", margins = c(5,10))
