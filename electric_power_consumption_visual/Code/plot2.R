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

png("plot2.png", width=480, height=480)
plot(df2$DateTimeCol, df2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()