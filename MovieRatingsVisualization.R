mov <- read.csv(file.choose())
install.packages("extrafont")
library(ggplot2)
library(extrafont)
#font_import()
y

#?windowsFonts()
loadfonts(device = "win")
#?loadfonts
#making  filters
filt1 <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")
filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio == "WB") | (mov$Studio == "Fox") | (mov$Studio == "Universal") | (mov$Studio == "Sony") | (mov$Studio == "Paramount Pictures")


#filtering Dataframe
mov2 <- mov[filt1 & filt2,]

#structure ans exploration of mov2
str(mov2)
colnames(mov2)
mov2[18]
head(mov2)

#proceeding to visualization
p <- ggplot(data = mov2, aes(x = Genre, y = Gross...US))

q <- p + geom_jitter(aes(size = Budget...mill., colour = Studio)) + 
  geom_boxplot(alpha=0.6)
q

q <- p + geom_jitter(aes(size = Budget...mill., colour = Studio)) + 
  geom_boxplot(alpha=0.6, outlier.color = NA)
q

#Labelling
q <- q + 
  xlab("Genre") + 
  ylab("Gross % US") + 
  ggtitle("Domestic Gross % by Genre")
q

#finishing

q <- q + 
  theme(axis.title.x = element_text(colour="Blue", size=25),
        axis.title.y = element_text(colour="Blue", size=25),
        
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        plot.title = element_text(colour="black", size=40, hjust = 0.5),
        
        legend.text = element_text(size=12),
        legend.title = element_text(size=20),
        
        text = element_text(family="Comic Sans MS"))
q

q$labels$size = "Budget $M"
q
#------------------- Additional Plots-----------------


#load Fonts 

loadfonts(device = "win")

#Re-exploration of mov dataset

str(mov)
colnames(mov)
head(mov)
summary(mov)

# Filtering and reordering

filt <- mov$Day.of.Week %in% c("Tuesday", "Wednesday", "Thursday", "Friday")
mov3 <- mov[filt,]
mov3$Day.of.Week <- factor(mov3$Day.of.Week, levels = c("Tuesday", "Wednesday", "Thursday", "Friday"))

#Visualisation

d <- ggplot(mov3, aes(x = Day.of.Week, y = IMDb.Rating))

e <- d + geom_jitter(aes(size = Budget...mill., colour = Day.of.Week)) + 
  geom_boxplot(alpha=0.6, outlier.color = NA)
e

#Giving Titles and themes

f <- e + 
  xlab("Day of the Week") + 
  ylab("IMDb Rating") + 
  ggtitle("IMDb V/s Release Day") + 
  theme(axis.title.x = element_text(colour="Blue", size=20),
        axis.title.y = element_text(colour="Blue", size=20),
        
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12),
        
        plot.title = element_text(colour="black", size=25, hjust = 0.5),
        
        legend.text = element_text(size=10),
        legend.title = element_text(size=16),
        
        text = element_text(family="Century Schoolbook"))
f

# Final touch

f$labels$size = "Budget $M"
f$labels$colour = "Day of the Week"
f

#---------------- Just4 fun. --------------
g <- ggplot(mov3, aes(x = Day.of.Week))
h <- g + geom_bar(aes(fill = Day.of.Week))
h

i <- ggplot(mov3, aes(x = Budget...mill., y = Adjusted.Gross...mill., 
                      colour = Day.of.Week))
j <- i + geom_point(alpha=0.5) + 
  geom_smooth()

k <- j + 
  xlab("Budget $M") + 
  ylab("Adjusted Gross $M") + 
  ggtitle("Adjusted Gross V/S Budget") + 
  theme(axis.title.x = element_text(colour="Blue", size=20),
        axis.title.y = element_text(colour="Blue", size=20),
        
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12),
        
        plot.title = element_text(colour="black", size=25, hjust = 0.5),
        
        legend.text = element_text(size=10),
        legend.title = element_text(size=16),
        
        text = element_text(family="Century Schoolbook"))

k
