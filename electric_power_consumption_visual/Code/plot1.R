library(ggplot2)
library(tidyverse)
library(readr)
library(tidyverse)
library(dplyr)

df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df2 <- df[which(df$Date == '2007-02-01' | df$Date == '2007-02-02'),]
rownames(df2) <- c() ## to get rid of the index of the data frame
for (i in names(df2)[3:9]){
    df2[, i] <- as.numeric(as.character(df2[, i]))
}
df2$DateTimeCol <- paste(df2$Date, df2$Time, sep = " ")
df2$DateTimeCol <- strptime(df2$DateTimeCol, "%Y-%m-%d %H:%M:%S")

png("plot1.png", width=480, height=480)
p1 <- ggplot(df2, aes(Global_active_power))
plot1 <- p1 + geom_histogram(binwidth= 0.5, fill = "red", col = "black") +
theme_minimal() +
labs(x = "Global Active Power (kilowatts)") +
labs(y = "Frequency") +
ggtitle("Global Active Power")+ 
theme(plot.title = element_text(hjust= 0.5)) +
xlim(0, 6)
# coord_cartesian(xlim = c(-0.2, 6.4))
print(plot1)
dev.off()