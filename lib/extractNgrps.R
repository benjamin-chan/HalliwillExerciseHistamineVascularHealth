extractNgrps <- function (name) {
  require(magrittr)
  require(dplyr)
  L2[[get("name")]][["lme"]] %>% 
    ngrps %>% 
    as.integer
}
