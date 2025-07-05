# In build.R
# Are package startup messages appearing? 
library(here)
library(rmarkdown)

# Critical security check: Verify setup exists (ASSERTION)
if (!file.exists(here("src", "_setup.R"))) {
  stop("FATAL: src/_setup.R not found. Project structure compromised.")
} else {
  print("DEBUG: _setup.R exists.")
}

# 1. LOAD PROJECT ENVIRONMENT
source(here("src", "_setup.R"))  # THIS LOADS YOUR CORE FUNCTIONALITY

# 2. build.R
rmarkdown::render(
  input = here("src/report.Rmd"),
  output_dir = here("docs"),
  params = list(is_public = TRUE),
  clean = TRUE
)

# Copy only safe outputs
# fs::file_copy(
#  path = dir_ls(here("output/plots"), glob = "*.png"),
#  new_path = here("docs/images")
# )
