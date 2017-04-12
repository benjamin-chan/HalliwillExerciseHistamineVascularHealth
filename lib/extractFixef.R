extractFixef <- function (name) {
  require(magrittr)
  require(dplyr)
  L2[[get("name")]][["lme"]] %>% 
    fixef %>% 
    .["aExercise"] %>% 
    as.numeric
}
