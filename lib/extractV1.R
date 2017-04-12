extractV1 <- function (name) {
  require(magrittr)
  require(dplyr)
  L2[[get("name")]][["lme"]] %>% 
    summary %>% .[["varcor"]] %>% 
    data.frame %>% 
    filter(grp == "subject") %>% 
    select(sdcor) %>% 
    as.numeric
}
