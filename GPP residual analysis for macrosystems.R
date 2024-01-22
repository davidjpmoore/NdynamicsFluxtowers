
# Read NEON GPP data from various sources

# Read the dataset from the CSV file
NEONGPPAnom <- read.csv("data/NEON_N_TowerGPP.csv", header = TRUE, sep = ",")

# Create new variables using mathematical functions
NEONGPPAnom <- NEONGPPAnom %>%
  mutate(
    GPP_res = GPP_CTSM - TowerGPP,         # Subtraction of two variables
  )

# Create a ggplot object and specify the data and aesthetics
plot <- ggplot(NEONGPPAnom, aes(x = CtoN))

# Add the first Y variable as a line plot
plot <- plot +
  geom_point(aes(y = GPP_CTSM), color = "blue")

# Add the second Y variable as a line plot with a different color
plot <- plot +
  geom_point(aes(y = TowerGPP), color = "red")

# Add labels and a legend
plot <- plot +
  labs(
    x = "X-axis",
    y = "Y-axis",
    title = "Two Y Variables vs. X Variable"
  ) +
  scale_linetype_manual(
    values = c("solid", "dashed"),
    labels = c("Y1", "Y2")
  ) +
  theme_minimal()

# Display the plot
print(plot)

# Create a ggplot object and specify the data and aesthetics
RESplotCN <- ggplot(NEONGPPAnom, aes(x = CtoN))

# Add the first Y variable as a point plot with black color and increased size
RESplotCN <- RESplotCN +
  geom_point(aes(y = GPP_res), color = "black", size = 4)

# Customize the theme for black and white with a solid line around all axes
RESplotCN <- RESplotCN +
  theme_minimal() +  # Use a minimal theme
  theme(
    axis.line = element_line(color = "black", size = 1),  # Solid black line around all axes
    axis.ticks = element_line(color = "black", size = 1),  # Tick marks in black with the same thickness
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    panel.border = element_blank(),  # Remove panel border
    axis.text.x = element_text(size = 16),  # Increase X-axis tick label size
    axis.text.y = element_text(size = 16),  # Increase Y-axis tick label size
    axis.title.x = element_text(size = 16, margin = margin(t = 15)),  # Increase X-axis label size and adjust margin
    axis.title.y = element_text(size = 16, margin = margin(r = 15))  # Increase Y-axis label size and adjust margin
  ) +
  labs(
    x = "Soil C:N Ratio",  # Customize X-axis label text
    y = "Model - Observed GPP"   # Customize Y-axis label text
  )

# Display the plot
print(RESplotCN)










# Create a ggplot object and specify the data and aesthetics
RESplotNMIN <- ggplot(NEONGPPAnom, aes(x = N_Minerlization))

# Add the first Y variable as a point plot with black color and increased size
RESplotNMIN <- RESplotNMIN +
  geom_point(aes(y = GPP_res), color = "black", size = 4)

# Customize the theme for black and white with a solid line around all axes
RESplotNMIN <- RESplotNMIN +
  theme_minimal() +  # Use a minimal theme
  theme(
    axis.line = element_line(color = "black", size = 1),  # Solid black line around all axes
    axis.ticks = element_line(color = "black", size = 1),  # Tick marks in black with the same thickness
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    panel.border = element_blank(),  # Remove panel border
    axis.text.x = element_text(size = 16),  # Increase X-axis tick label size
    axis.text.y = element_text(size = 16),  # Increase Y-axis tick label size
    axis.title.x = element_text(size = 16, margin = margin(t = 15)),  # Increase X-axis label size and adjust margin
    axis.title.y = element_text(size = 16, margin = margin(r = 15))  # Increase Y-axis label size and adjust margin
  ) +
  labs(
    x = "Soil N Mineralization Rate",  # Customize X-axis label text
    y = "Model - Observed GPP"   # Customize Y-axis label text
  )

# Display the plot
print(RESplotNMIN)




# Create a ggplot object and specify the data and aesthetics
RESplotNPCENT <- ggplot(NEONGPPAnom, aes(x = SoilN_Pcent))

# Add the first Y variable as a point plot with black color and increased size
RESplotNPCENT <- RESplotNPCENT +
  geom_point(aes(y = GPP_res), color = "black", size = 4)

# Customize the theme for black and white with a solid line around all axes
RESplotNPCENT <- RESplotNPCENT +
  theme_minimal() +  # Use a minimal theme
  theme(
    axis.line = element_line(color = "black", size = 1),  # Solid black line around all axes
    axis.ticks = element_line(color = "black", size = 1),  # Tick marks in black with the same thickness
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    panel.border = element_blank(),  # Remove panel border
    axis.text.x = element_text(size = 16),  # Increase X-axis tick label size
    axis.text.y = element_text(size = 16),  # Increase Y-axis tick label size
    axis.title.x = element_text(size = 16, margin = margin(t = 15)),  # Increase X-axis label size and adjust margin
    axis.title.y = element_text(size = 16, margin = margin(r = 15))  # Increase Y-axis label size and adjust margin
  ) +
  labs(
    x = "Soil N (%)",  # Customize X-axis label text
    y = "Model - Observed GPP"   # Customize Y-axis label text
  )

# Display the plot
print(RESplotNPCENT)



# Create a ggplot object and specify the data and aesthetics
GPP_obsplotNPCENT <- ggplot(NEONGPPAnom, aes(x = CtoN))

# Add the first Y variable as a point plot with black color and increased size
GPP_obsplotNPCENT <- GPP_obsplotNPCENT +
  geom_point(aes(y = GPP_CTSM), color = "black", size = 4)

# Customize the theme for black and white with a solid line around all axes
GPP_obsplotNPCENT <- GPP_obsplotNPCENT +
  theme_minimal() +  # Use a minimal theme
  theme(
    axis.line = element_line(color = "black", size = 1),  # Solid black line around all axes
    axis.ticks = element_line(color = "black", size = 1),  # Tick marks in black with the same thickness
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    panel.border = element_blank(),  # Remove panel border
    axis.text.x = element_text(size = 16),  # Increase X-axis tick label size
    axis.text.y = element_text(size = 16),  # Increase Y-axis tick label size
    axis.title.x = element_text(size = 16, margin = margin(t = 15)),  # Increase X-axis label size and adjust margin
    axis.title.y = element_text(size = 16, margin = margin(r = 15))  # Increase Y-axis label size and adjust margin
  ) +
  labs(
    x = "C:N Ratio",  # Customize X-axis label text
    y = "Modeled GPP"   # Customize Y-axis label text
  )

# Display the plot
print(GPP_obsplotNPCENT)

# Create a ggplot object and specify the data and aesthetics
GPP_obsplotLAI <- ggplot(NEONGPPAnom, aes(x = LAI4g_mean))

# Add the first Y variable as a point plot with black color and increased size
GPP_obsplotLAI <- GPP_obsplotLAI +
  geom_point(aes(y = GPP_res), color = "black", size = 4)

# Customize the theme for black and white with a solid line around all axes
GPP_obsplotLAI <- GPP_obsplotLAI +
  theme_minimal() +  # Use a minimal theme
  theme(
    axis.line = element_line(color = "black", size = 1),  # Solid black line around all axes
    axis.ticks = element_line(color = "black", size = 1),  # Tick marks in black with the same thickness
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    panel.border = element_blank(),  # Remove panel border
    axis.text.x = element_text(size = 16),  # Increase X-axis tick label size
    axis.text.y = element_blank(),  # Suppress Y-axis tick labels
    axis.ticks.y = element_line(),  # Add Y-axis tick marks without labels
    axis.title.x = element_text(size = 16, margin = margin(t = 15)),  # Increase X-axis label size and adjust margin
    axis.title.y = element_text(size = 16, margin = margin(r = 15))  # Increase Y-axis label size and adjust margin
  ) +
  labs(
    x = "LAI 4G",  # Customize X-axis label text
    y = ""   # Empty Y-axis label text to suppress it
  )

# Save the plot with a size of 400 by 400 pixels and a transparent background
ggsave("/Users/davidmoore/Library/CloudStorage/GoogleDrive-davidjpmoore@arizona.edu/My Drive/00GrantProposals/Macrosystems 2023/Figures - pictures/LAIplot.png", plot = GPP_obsplotLAI, bg = "transparent", width = 4, height = 4, units = "in")



