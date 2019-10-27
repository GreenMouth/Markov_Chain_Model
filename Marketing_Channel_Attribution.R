

# Install these libraries (only do this once)
install.packages("ChannelAttribution")
install.packages("reshape")
install.packages("ggplot2")

# Load these libraries (every time you start RStudio)
library(ChannelAttribution)
library(reshape)
library(ggplot2)

#------------------------ Data
# This loads the demo data. You can load your own data by importing a dataset or reading in a file
data(PathData)
head(Data, 10)
tail(Data, 10) #total_conversions, total_conversion_value, total_null
dim(Data) #get dimention of dataset

#12 unique channels in dataset
#possible channel combinations = 2^12 = 	4,096 path combinations

#------------------------ Model
#Build the simple heuristic models 
#(First Click / first_touch, Last Click / last_touch, and Linear Attribution / linear_touch)
H <- heuristic_models(Data, 'path', 'total_conversions', var_value='total_conversion_value')

#Build the Markov model
M <- markov_model(Data, 'path', 'total_conversions', var_value='total_conversion_value', order = 1) 

#------------------------ Model results data Manupulation for results plotting
#4 models & 12 channels = 4x12 = 48 outputs

# Merges the two data frames on the "channel_name" column.
R <- merge(H, M, by='channel_name') 

# Selects only relevant columns
R1 <- R[, (colnames(R)%in%c('channel_name', 'first_touch_conversions', 'last_touch_conversions', 'linear_touch_conversions', 'total_conversion'))]

# Renames the columns
colnames(R1) <- c('channel_name', 'first_touch', 'last_touch', 'linear_touch', 'markov_model') 

# Transforms the dataset into a data frame that ggplot2 can use to graph the outcomes
R1 <- melt(R1, id='channel_name')


# Plot the total conversions
ggplot(R1, aes(channel_name, value, fill = variable)) +
  geom_bar(stat='identity', position='dodge') +
  ggtitle('TOTAL CONVERSIONS') + 
  theme(axis.title.x = element_text(vjust = -2)) +
  theme(axis.title.y = element_text(vjust = +2)) +
  theme(title = element_text(size = 15)) +
  theme(plot.title=element_text(size = 18)) +
  ylab("")


# Plot the total conversions
R2 <- R[, (colnames(R)%in%c('channel_name', 'first_touch_value', 'last_touch_value', 'linear_touch_value', 'total_conversion_value'))]

colnames(R2) <- c('channel_name', 'first_touch', 'last_touch', 'linear_touch', 'markov_model')

R2 <- melt(R2, id='channel_name')

ggplot(R2, aes(channel_name, value, fill = variable)) +
  geom_bar(stat='identity', position='dodge') +
  ggtitle('TOTAL CONVERSIONS VALUE') + 
  theme(axis.title.x = element_text(vjust = -2)) +
  theme(axis.title.y = element_text(vjust = +2)) +
  theme(title = element_text(size = 16)) +
  theme(plot.title=element_text(size = 20)) +
  ylab("")


#Results:
#"alpha" was not actually NOT AS VALUABLE in assisting conversions 
#than the simple heuristics found.

#"epsilon", "lambda", "theta", and "zeta" were MORE VALUABLE in assisting conversions 
#than the simple heuristics found.


#Reference:
#https://www.bounteous.com/insights/2016/06/30/marketing-channel-attribution-markov-models-r/?ns=l






