library(ggplot2)
NEON_Ndata = read.csv("data/NSoilDataNEON_Weintraub.csv")

plot(NEON_Ndata$SoilN_Pcent,NEON_Ndata$N_Minerlization)

# Create a box plot
ggplot(NEON_Ndata, aes(x = SiteID, y = SoilN_Pcent)) +
  geom_boxplot(fill = "lightblue", color = "blue") +
  labs(title = "Box Plot of Value1 by Category",
       x = "CategoryName",
       y = "Value1") +
  theme_minimal()




# Create a layout with two panels
#layout(matrix(1:2, nrow = 1))
layout(matrix(1:2, nrow = 1, byrow = TRUE), heights = c(1, 20))

# Adjust par() settings to reduce space between plots
par(mar = c(5, 3, 4, 1))  # Set the margins (bottom, left, top, right) as needed


# Plot the first histogram with the x-axis label as the main title
hist(NEON_Ndata$SoilN_Pcent, main="", xlab = "Soil N", ylab = "Frequency", col = "black", border = "white")

# Plot the second histogram with the x-axis label as the main title
hist(NEON_Ndata$N_Minerlization, main="", xlab = "N Mineralization", ylab = "Frequency", col = "black", border = "white")






# Set the par() settings to arrange plots side by side in a 1x2 grid
par(mfrow = c(1, 2.5))
par(mar = c(2.1, 2.1, 2.1, 2.1))  # Adjust the margins as needed

# Calculate the maximum frequency from both datasets
max_freq <- max(
  hist(NEON_Ndata$SoilN_Pcent, plot = FALSE)$counts,
  hist(NEON_Ndata$CtoN, plot = FALSE)$counts
)

# Plot the first histogram with the x-axis label as the main title
hist(NEON_Ndata$SoilN_Pcent, main = "", xlab = "", ylab = "", col = "black", border = "white", ylim = c(0, max_freq),  cex.axis = 1.4)

# Plot the second histogram with the x-axis label as the main title
hist(NEON_Ndata$CtoN, main = "", xlab = "", ylab = "", col = "black", border = "white", ylim = c(0, max_freq), cex.axis = 1.4)

# Reset the par() settings after plotting
par(mfrow = c(1, 1))