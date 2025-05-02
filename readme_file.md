# Gene Expression Analysis Project

This repository contains code and data for analyzing differential gene expression between male and female samples, including filtering, visualization, Gene Ontology enrichment analysis, and Ingenuity Pathway Analysis (IPA).

## Project Structure

```
gene_expression_analysis/
├── data/
│   ├── raw/                    # Original input data
│   │   ├── female_strata.csv
│   │   └── male_strata.csv
│   ├── processed/              # Filtered gene lists
│   └── ipa/                    # IPA result files
│       ├── female_p05_canonical_pathways.xlsx
│       ├── female_p05_diseases_functions.xlsx
│       ├── female_p05_upstream_regulators.xlsx
│       ├── male_p05_canonical_pathways.xlsx
│       ├── male_p05_diseases_functions.xlsx
│       ├── male_p05_upstream_regulators.xlsx
│       └── ...                 # Additional IPA Excel files
├── R/                          # Reusable functions
│   ├── data_processing.R       # Data loading and filtering
│   ├── visualization.R         # Basic visualization functions
│   ├── go_analysis.R           # Gene Ontology analysis functions
│   ├── volcano_plots.R         # Volcano plot functions
│   ├── ipa_analysis.R          # IPA data processing and visualization
│   └── utils.R                 # Utility functions
├── scripts/                    # Analysis scripts
│   ├── main_analysis.R         # Main analysis workflow
│   ├── go_analysis_script.R    # GO enrichment analysis
│   ├── volcano_plots_script.R  # Volcano plot generation
│   └── ipa_analysis_script.R   # IPA data processing and visualization
├── output/                     # Generated output
│   ├── figures/                # Generated plots
│   │   ├── heatmap_logFC.pdf   # Heatmap of DEGs
│   │   ├── deg_heatmap.pdf     # Heatmap of common DEGs
│   │   ├── go_dotplot_combined.pdf # GO analysis dotplot
│   │   ├── volcano_plots_combined.pdf # Volcano plots
│   │   └── ipa/                # IPA visualization outputs
│   │       ├── IPA_Canonical_Pathways.pdf
│   │       ├── IPA_diseases_functions_all_no_cancer.pdf
│   │       └── IPA_Upstream_Regulators.pdf
│   ├── go_analysis/            # GO analysis results
│   │   ├── significant_go_terms_male_logFC2_p05.csv
│   │   └── significant_go_terms_female_logFC2_p05.csv
│   └── ipa/                    # Processed IPA data
│       ├── male_upstream_regulators_cleaned.csv
│       ├── female_canonical_pathways_cleaned.csv
│       └── ...
├── install_packages.R          # Package installation script
└── README.md
```

## Code Organization

### R Functions

- `data_processing.R`: Functions for loading and processing gene expression data
- `visualization.R`: Functions for creating basic visualizations (heatmaps)
- `go_analysis.R`: Functions for Gene Ontology enrichment analysis
- `volcano_plots.R`: Functions for creating volcano plots
- `ipa_analysis.R`: Functions for processing and visualizing IPA results
- `utils.R`: Utility functions for project setup and data consistency checks

### Analysis Scripts

- `main_analysis.R`: Main script that orchestrates the entire analysis workflow
- `go_analysis_script.R`: Script specifically for GO enrichment analysis
- `volcano_plots_script.R`: Script specifically for volcano plot generation
- `ipa_analysis_script.R`: Script for processing IPA Excel files and creating visualizations

## Usage

### Setting Up

1. Run the installation script to ensure all required packages are installed:

```r
source("install_packages.R")
```

2. Place your data files in the appropriate directories:
   - Gene expression data: `data/raw/`
   - IPA result files: `data/ipa/`

### Running Analysis

Run the main analysis script to perform the complete workflow:

```r
source("scripts/main_analysis.R")
```

Or run individual analysis components:

```r
# Gene filtering and basic visualization
source("scripts/main_analysis.R")

# Gene Ontology enrichment analysis
source("scripts/go_analysis_script.R")

# Volcano plots
source("scripts/volcano_plots_script.R")

# IPA visualization
source("scripts/ipa_analysis_script.R")
```

## Analysis Components

### 1. Gene Filtering

This analysis filters genes using various thresholds:
- P-value < 0.001
- P-value < 0.01
- P-value < 0.05
- P-value < 0.05 and |logFC| > 0.2

### 2. GO Enrichment Analysis

- Performs Gene Ontology enrichment analysis for differentially expressed genes
- Creates dotplots comparing enriched terms between male and female samples
- Saves significant GO terms with associated genes to CSV files

### 3. Visualizations

- `heatmap_logFC.pdf`: Heatmap of log fold change values for significant genes
- `deg_heatmap.pdf`: Heatmap showing common differentially expressed genes
- `go_dotplot_combined.pdf`: Dotplot showing enriched GO terms
- `volcano_plots_combined.pdf`: Side-by-side volcano plots for male and female samples

### 4. IPA Analysis

The Ingenuity Pathway Analysis (IPA) component processes IPA Excel output files and creates visualizations:

- **Canonical Pathways**: Compares canonical pathway enrichment between male and female samples
- **Diseases and Functions**: Visualizes enriched disease/function terms with activation z-scores
- **Upstream Regulators**: Identifies potential upstream regulators based on downstream gene expression patterns

## Dependencies

### CRAN packages:
- readr
- stringr
- dplyr
- ggplot2
- tidyr
- grid
- ggrepel
- tibble
- patchwork
- janitor
- readxl
- ggpattern

### Bioconductor packages:
- clusterProfiler
- org.Hs.eg.db
- pheatmap

## Getting Started

To set up this project structure from scratch:

```r
# Install required packages
source("install_packages.R")

# Create project directories
source("R/utils.R")
setup_project_dirs()

# Copy your raw data files to data/raw/
# Copy your IPA Excel files to data/ipa/

# Run analyses
source("scripts/main_analysis.R")  # Basic gene expression analysis
source("scripts/go_analysis_script.R")  # GO enrichment analysis
source("scripts/volcano_plots_script.R")  # Volcano plots
source("scripts/ipa_analysis_script.R")  # IPA visualization
```
