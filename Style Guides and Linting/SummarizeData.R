## Excellent comment here
comparison_calc <- function(Data) {
  TempData <- Data %>%
    filter(CurrentFiscalYearFLG == 1) %>%
    inner_join(Data %>%
      filter(CurrentFiscalYearFLG == 0), by = c("DateFiscalMonthNBR"), copy = T)
  ## poorly formatted comment here

  return(TempData)
}