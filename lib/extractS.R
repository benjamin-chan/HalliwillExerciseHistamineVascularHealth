extractS <- function (name) {
  require(magrittr)
  require(dplyr)
  L2[[get("name")]][["lme"]] %>% 
    summary %>% .[["varcor"]] %>% 
    data.frame %>% 
    filter(grp == "Residual") %>% 
    select(sdcor) %>% 
    as.numeric
}
