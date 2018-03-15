# Script R for Visualization

# Load cluster_career data and class
data = read.csv("../Datasets/classification_career.csv")
data = data[-1]

# Calcuate summary of cluster_career
summary(data)

# Draw Correlation Matrix
library(seriation)
data_matrix <- as.matrix(data[-7])
pearson_corr <- cor(data[-7], method="pearson")
pearson_corr
write.csv(pearson_corr, "Tables/pearson_corr_career.csv")
pimage(pearson_corr, main="Correlation Matrix", col = bluered(100))

# Draw scatter plots without class
plot(data[-7])

# Draw half scatter plots without class
pairs(data[-7], upper.panel=NULL)

# Draw hs_diploma_grade vs grade_weighted_avg plot without class
plot(data[,2], data[,3], xlab="hs_diploma_grade", ylab="grade_weighted_avg", pch=19)

# Draw scatter plots with class
class <- data[,7]
colors <- c("red", "blue")
class_column <- colors[as.numeric(class)]
plot(data, col=class_column)

# Draw half scatter plots with class
test=as.character(levels(class))
pairs(data[-7], col=class_column, upper.panel=NULL)
par(xpd=TRUE)
legend(x=0.65, y=0.9, cex=2, legend=rev(as.character(levels(class))), fill=unique(class_column))
par(xpd=NA)

# Draw hs_diploma_grade vs grade_weighted_avg plot with class
plot(data[,2], data[,3], xlab="hs_diploma_grade", ylab="grade_weighted_avg", pch=19, col=class_column)

# Draw Summary Plot without class
library("GGally")
ggpairs(data[-7])

# Draw Summary Plot with class
library("GGally")
ggpairs(data, ggplot2::aes(colour=class))

# Parallel Coordinates
par(las = 1, mar = c(4.5, 3, 3, 2) + 0.1, cex = .8)
MASS::parcoord(data[-7], col = class_column, var.label = TRUE, lwd = 2)
legend(x = 4, y = 0.18, cex = 1.2, legend = as.character(levels(class)), fill = unique(class_column), horiz = TRUE)

par(las = 1, mar = c(4.5, 3, 3, 2) + 0.1, cex = .8)
MASS::parcoord(data[-7], col = class_column, var.label = TRUE, lwd = 2)

# Load cluster_exams data
data = read.csv("../Datasets/cluster_exams.csv")
data = data[-1]

# Calcuate summary of cluster_career
summary(data)

# Draw Correlation Matrix
library(seriation)
data_matrix <- as.matrix(data)
pearson_corr <- cor(data, method="pearson")
pearson_corr
write.csv(pearson_corr, "Tables/pearson_corr_exams.csv")
pimage(pearson_corr, main="Correlation Matrix", col = bluered(100))

# Draw ASD vs CPS plot
plot(data[,1], data[,13], xlab="ASD", ylab="CPS", pch=19)

# Draw BDSI vs CPS plot
plot(data[,8], data[,13], xlab="BDSI", ylab="CPS", pch=19)

# Draw MDL vs SO plot
plot(data[,4], data[,9], xlab="MDL", ylab="SO", pch=19)

# Draw Summary Plot
library("GGally")
ggpairs(data)