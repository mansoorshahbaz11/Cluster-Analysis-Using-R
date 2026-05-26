# Load the required Packages
library(factoextra)
library(NbClust)
library(dplyr)

# Read the data set
ktc <- read.csv(file.choose(), header = TRUE)
View(ktc)


# Select the variables
req <- ktc_data_scaled$REQ
Thread_color <- ktc_data_scaled$THREAD.COLOR

# Convert into Dataframe
ktc_AI <- data.frame(req,Thread_color)

'K-Means Clustering w.r.t age and income variable
-------------------------------------------------'
#perform k-means clustering with k = 3 clusters
?kmeans()
km <- kmeans(ktc_AI, centers = 3)

#view results
km

#plot results of final k-means model
fviz_cluster(km, data = ktc_AI)

'K-Means Clustering: Complete Data
----------------------------------'
#perform k-means clustering with k = 3 clusters
kmc <- kmeans(ktc, centers = 2)

#view results
kmc

#plot results of final k-means model
fviz_cluster(kmc, data = ktc)

'Optimal number of clusters (k)
-------------------------------'
options(scipen = 999)
# Elbow method
fviz_nbclust(ktc, kmeans, method = "wss") +
  labs(subtitle = "Elbow method") # add subtitle

# Silhouette method
fviz_nbclust(ktc, kmeans, method = "silhouette") +
  labs(subtitle = "Silhouette method")


task2 <- read.csv(file.choose(), header = TRUE)
task2

task2 <- na.omit(task2)
task2 <- task2 %>% select_if(is.numeric)

View(task2)
str(task2)

fviz_nbclust(task2, kmeans, method = "wss") +
  labs(subtitle = "Elbow method")

fviz_nbclust(task2, kmeans, method = "silhouette") +
  labs(subtitle = "Silhouette method")




