# src/value_investing_engine.R
# ------------------------------------------------------------------


#' Main analysis function
#' @param tickers Character vector of ticker symbols
#' @param output_dir Directory for output files
#' @return List of analysis results
#' @export # This makes it available when sourced
analyze_portfolio <- function(tickers, output_dir = here("output")) {
  # Your implementation
  print("In analyze_portfolio()")
}

# Other helper functions (not exported)
load_company_data <- function(tickers) {
  # This function won't be available globally unless explicitly sourced
}
