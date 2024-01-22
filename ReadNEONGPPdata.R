library(amerifluxr)
# Load the tidyr package if not already loaded
library(tidyr)
# Load the dplyr package if not already loaded
library(dplyr)

amd_read_base()


base2 <- amf_read_base(
  file = floc3,
  unzip = FALSE,
  parse_timestamp = TRUE
)
pander::pandoc.table(base2[c(1:3), c(1:10)])


# Specify the directory path
folder_path <- "data"
# List all directories in the specified folder and its subdirectories
directories <- list.dirs(folder_path, full.names = TRUE, recursive = TRUE)
directories<- directories[-1]
# Print the list of directories
print(directories)


# Specify the directory path
folder_path <- "data"

# List all directories in the specified folder and its subdirectories
directories <- list.dirs(folder_path, full.names = TRUE, recursive = TRUE)

# Remove the first element (the root directory)
directories <- directories[-1]

# Create an empty list to store your data frames
data_list <- list()

# Loop through each directory
for (dir_path in directories) {
  # List the CSV files in the current directory
  csv_files <- list.files(dir_path, pattern = "FLUXNET_SUBSET_YY", full.names = TRUE)
  
  # Check if there are any matching CSV files in the directory
  if (length(csv_files) > 0) {
    # Read the first matching CSV file in the directory
    data <- read.csv(csv_files[1])
    
    # Store the data frame in the list
    data_list[[dir_path]] <- data
  }
}

# You can access the data frames using the directory paths as keys
# For example, data from the directory "data/subdirectory1" can be accessed as:
# data_list[["data/subdirectory1"]]

# Print the list of data frames
print(data_list)


# Define the list of variable names you want to extract
variables_to_extract <- c("TIMESTAMP", "GPP_NT_VUT_REF")

# Create a new list to store the extracted variables
extracted_data_list <- list()

# Loop through each element in the data_list
for (element_name in names(data_list)) {
  # Extract the specified variables from the data frame
  extracted_data <- data_list[[element_name]][variables_to_extract]
  
  # Store the extracted data frame with the element name as the key in the new list
  extracted_data_list[[element_name]] <- extracted_data
}

# Print the extracted data list
print(extracted_data_list)




# Combine the data frames into a single data frame
combined_data <- bind_rows(extracted_data_list, .id = "ElementName")

# Use pivot_wider to create separate columns for each ElementName and GPP_NT_VUT_REF combination
combined_data <- combined_data %>%
  pivot_wider(names_from = ElementName, values_from = GPP_NT_VUT_REF, 
              names_glue = "GPP_NT_VUT_REF_{ElementName}")

# Print the combined data frame
print(combined_data)





# Create a new data frame with the means of each variable
mean_data <- combined_data %>%
  summarise(across(everything(), ~ mean(.x[.x >= 0], na.rm = TRUE)))

# Print the mean data frame
print(mean_data)

# Transpose the mean_data dataset
transposed_data <- t(mean_data)

# Print the transposed data
print(transposed_data)








# Combine the data frames into a single data frame
combined_data <- bind_rows(extracted_data_list, .id = "ElementName")

# Specify the file path
file_path <- "data/requested_files_manifest_20231101.txt"

# Read the data from the file, skipping the header lines
data <- read.csv(file_path, sep = ",", skip = 3, header = TRUE)

# View the first few rows of the data to check if it's read correctly
head(data)
