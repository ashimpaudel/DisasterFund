PR_Income <- read.csv("dataset/Puerto Rico Income ZipCode.csv")
dim(PR_Income)
head(PR_Income)
 #extract only the zip-code and PR_Income
PR_Income$Location
PR_Income <- PR_Income[,c(1,3,4)]
#changing the string income to numeric value
PR_Income$Avg..Income.H.hold <- as.numeric(gsub('[$,]', '',PR_Income$Avg..Income.H.hold))

#sorting the data according to Income household
PR_Income <- PR_Income[order(PR_Income$Avg..Income.H.hold),]
PR_Income <- head(PR_Income, -1)
#we want the row names according to the Income
row.names(PR_Income) <- PR_Income$Zip.Code
#remove the first column
PR_Income$Zip.Code = NULL
PR_Income_Matrix <- data.matrix(PR_Income)
#PR_Income_heatmap <- heatmap(cbind(PR_Income$Avg..Income.H.hold,PR_Income$Avg..Income.H.hold), Rowv = NA, Colv = NA, scale = "column")
PR_Income_heatmap <- heatmap(PR_Income_Matrix, Rowv = NA, Colv = NA, scale = "column")
library(graphics)
mat <- matrix(c(PR_Income$Avg..Income.H.hold))
image(mat)
library(gplots)
heatmap.2(cbind(PR_Income$Avg..Income.H.hold, PR_Income$Avg..Income.H.hold), trace="n", Colv = NA, 
          dendrogram = "row", labCol = "", labRow = PR_Income$City, cexRow = 0.75)

FLIncZip <- read.csv("/scratch/scholar/t/train32/groupdata/Florida _Income_Zipcode.csv")
FLIncZip$Avg..Income.H.hold <- as.numeric(gsub('[$,]', '',FLIncZip$Avg..Income.H.hold))
FLIncZip <- FLIncZip [order(FLIncZip$Zip.Code),]
FL_Matrix <- data.matrix(FLIncZip)
mypoints <- data.frame(FLIncZip$Zip.Code, FLIncZip$Avg..Income.H.hold)
row.names(FLIncZip) <- FLIncZip$Zip.Code
FLIncZip
head(FLIncZip)

FL_heatmap <- heatmap(FL_Matrix, Rowv = NA, Colv = NA, col = cm.colors(256),scale = "column", margins = c(5,10))
