# install_packages.R
# Script to install all required packages for the gene expression analysis project

# Function to install packages if not already installed
install_if_missing <- function(package_name, bioconductor = FALSE) {
  if (!requireNamespace(package_name, quietly = TRUE)) {
    message(paste("Installing package:", package_name))
    if (bioconductor) {
      if (!requireNamespace("BiocManager", quietly = TRUE)) {
        install.packages("BiocManager")
      }
      BiocManager::install(package_name)
    } else {
      install.packages(package_name)
    }
  } else {
    message(paste("Package already installed:", package_name))
  }
}

# Install BiocManager if needed
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# CRAN packages
cran_packages <- c(
  "readr",
  "stringr",
  "dplyr",
  "ggplot2", 
  "tidyr",
  "grid",
  "ggrepel",
  "tibble",
  "patchwork",
  "janitor",
  "readxl",
  "ggpattern"
)

# Bioconductor packages
bioc_packages <- c(
  "clusterProfiler",
  "org.Hs.eg.db",
  "pheatmap"
)

# Install CRAN packages
message("Installing CRAN packages...")
for (pkg in cran_packages) {
  install_if_missing(pkg)
}

# Install Bioconductor packages
message("Installing Bioconductor packages...")
for (pkg in bioc_packages) {
  install_if_missing(pkg, bioconductor = TRUE)
}

message("All required packages have been installed successfully!")