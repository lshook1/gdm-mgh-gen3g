# setup_project.R
# Script to set up the project structure and initialize the environment

# Load required libraries
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  readr,
  dplyr,
  ggplot2,
  pheatmap,
  tidyr,
  ggrepel,
  tibble,
  grid
)

# Define project structure
base_dir <- getwd()  # Change this if needed

# Set up directory structure
dirs <- list(
  data_raw = file.path(base_dir, "data", "raw"),
  data_processed = file.path(base_dir, "data", "processed"),
  data_ipa = file.path(base_dir, "data", "ipa"),
  R = file.path(base_dir, "R"),
  scripts = file.path(base_dir, "scripts"),
  output = file.path(base_dir, "output"),
  output_figures = file.path(base_dir, "output", "figures"),
  output_figures_ipa = file.path(base_dir, "output", "figures", "ipa"),
  output_go = file.path(base_dir, "output", "go_analysis"),
  output_ipa = file.path(base_dir, "output", "ipa")
)

# Create directories
for (dir in dirs) {
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
}

# Create R source files
file.create(file.path(dirs$R, "data_processing.R"))
file.create(file.path(dirs$R, "visualization.R"))
file.create(file.path(dirs$R, "utils.R"))
file.create(file.path(dirs$R, "go_analysis.R"))
file.create(file.path(dirs$R, "volcano_plots.R"))
file.create(file.path(dirs$R, "ipa_analysis.R"))

# Create script files
file.create(file.path(dirs$scripts, "main_analysis.R"))
file.create(file.path(dirs$scripts, "go_analysis_script.R"))
file.create(file.path(dirs$scripts, "volcano_plots_script.R"))
file.create(file.path(dirs$scripts, "ipa_analysis_script.R"))

# Create README
readme_path <- file.path(base_dir, "README.md")
cat("# Gene Expression Analysis Project\n\nThis repository contains code and data for analyzing differential gene expression.\n", 
    file = readme_path)

# User instructions
cat("\n=== Project Setup Complete ===\n")
cat("Directory structure created at:", base_dir, "\n\n")
cat("Next steps:\n")
cat("1. Copy your raw data files to:", dirs$data_raw, "\n")
cat("2. Copy your IPA Excel files to:", dirs$data_ipa, "\n")
cat("3. Copy the R function code to the respective files in the R/ directory\n")
cat("4. Copy the analysis scripts to:", dirs$scripts, "\n")
cat("5. Run the scripts as needed:\n")
cat("   - Main analysis: source('scripts/main_analysis.R')\n")
cat("   - GO analysis: source('scripts/go_analysis_script.R')\n")
cat("   - Volcano plots: source('scripts/volcano_plots_script.R')\n")
cat("   - IPA analysis: source('scripts/ipa_analysis_script.R')\n\n")