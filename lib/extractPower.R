extractPower <- function (name) {
  require(magrittr)
  require(dplyr)
  L2[[get("name")]][["power"]] %>% 
    summary %>% 
    select(mean) %>% 
    as.numeric
}
