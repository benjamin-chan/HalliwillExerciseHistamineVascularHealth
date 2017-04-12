---
title: "Halliwill: Exercise, Histamine Receptors, and Vascular Health in Aging"
date: "2017-04-12 08:59:46"
author: Benjamin Chan (chanb@ohsu.edu)
output:
  html_document:
    toc: true
    theme: simplex
---
# Preamble

Set working directory.


```r
setwd("~/Projects/HalliwillExerciseHistamineVascularHealth/scripts")
```

Load libraries.


```r
library(magrittr)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(ggplot2)
library(svglite)
library(knitr)
library(pwr)
library(simr)
```

```
## Loading required package: lme4
```

```
## Loading required package: Matrix
```

```
## Loading required package: methods
```

```r
# library(TrialSize)
```

Reproducibility steps.


```r
sessionInfo() %>% print(locale = FALSE)
```

```
## R version 3.3.3 (2017-03-06)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 7 x64 (build 7601) Service Pack 1
## 
## attached base packages:
## [1] methods   stats     graphics  grDevices utils     datasets  base     
## 
## other attached packages:
##  [1] simr_1.0.2        lme4_1.1-12       Matrix_1.2-8     
##  [4] pwr_1.2-1         svglite_1.2.0     ggplot2_2.2.1    
##  [7] dplyr_0.5.0       magrittr_1.5      rmarkdown_1.4    
## [10] knitr_1.15.1      checkpoint_0.3.16
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.10       nloptr_1.0.4       plyr_1.8.4        
##  [4] iterators_1.0.8    tools_3.3.3        digest_0.6.12     
##  [7] evaluate_0.10      tibble_1.2         gtable_0.2.0      
## [10] nlme_3.1-131       lattice_0.20-35    mgcv_1.8-17       
## [13] DBI_0.6            parallel_3.3.3     SparseM_1.76      
## [16] stringr_1.2.0      MatrixModels_0.4-1 gdtools_0.1.4     
## [19] rprojroot_1.2      grid_3.3.3         nnet_7.3-12       
## [22] R6_2.2.0           plotrix_3.6-4      RLRsim_3.1-3      
## [25] binom_1.1-1        minqa_1.2.4        car_2.1-4         
## [28] backports_1.0.5    scales_0.4.1       htmltools_0.3.5   
## [31] splines_3.3.3      MASS_7.3-45        pbkrtest_0.4-7    
## [34] assertthat_0.1     colorspace_1.3-2   quantreg_5.29     
## [37] stringi_1.1.3      lazyeval_0.2.0     munsell_0.4.3
```

```r
set.seed(as.integer(as.Date("2017-04-10")))
```

Source user-defined functions.


```r
sapply(list.files("../lib", full.names = TRUE), source)
```

```
##         ../lib/extractFixef.R ../lib/extractNgrps.R ../lib/extractPower.R
## value   ?                     ?                     ?                    
## visible FALSE                 FALSE                 FALSE                
##         ../lib/extractS.R ../lib/extractV1.R ../lib/sim.R
## value   ?                 ?                  ?           
## visible FALSE             FALSE              FALSE
```


## References


```r
citation()
```

```
## 
## To cite R in publications use:
## 
##   R Core Team (2017). R: A language and environment for
##   statistical computing. R Foundation for Statistical Computing,
##   Vienna, Austria. URL https://www.R-project.org/.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {R: A Language and Environment for Statistical Computing},
##     author = {{R Core Team}},
##     organization = {R Foundation for Statistical Computing},
##     address = {Vienna, Austria},
##     year = {2017},
##     url = {https://www.R-project.org/},
##   }
## 
## We have invested a lot of time and effort in creating R, please
## cite it when using it for data analysis. See also
## 'citation("pkgname")' for citing R packages.
```

```r
citation("pwr")
```

```
## 
## To cite package 'pwr' in publications use:
## 
##   Stephane Champely (2017). pwr: Basic Functions for Power
##   Analysis. R package version 1.2-1.
##   https://CRAN.R-project.org/package=pwr
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {pwr: Basic Functions for Power Analysis},
##     author = {Stephane Champely},
##     year = {2017},
##     note = {R package version 1.2-1},
##     url = {https://CRAN.R-project.org/package=pwr},
##   }
```

```r
citation("simr")
```

```
## 
## Green P and MacLeod CJ (2016). "simr: an R package for power
## analysis of generalised linear mixed models by simulation."
## _Methods in Ecology and Evolution_, *7*(4), pp. 493-498. doi:
## 10.1111/2041-210X.12504 (URL:
## http://doi.org/10.1111/2041-210X.12504), <URL:
## https://CRAN.R-project.org/package=simr>.
## 
## A BibTeX entry for LaTeX users is
## 
##   @Article{,
##     title = {simr: an R package for power analysis of generalised linear mixed models by simulation},
##     author = {Peter Green and Catriona J. MacLeod},
##     journal = {Methods in Ecology and Evolution},
##     volume = {7},
##     number = {4},
##     pages = {493--498},
##     year = {2016},
##     doi = {10.1111/2041-210X.12504},
##     url = {https://CRAN.R-project.org/package=simr},
##   }
```
# Power and sample size

Use research plan described in [`RESEARCH_PLAN_03.23.2017.docx`](background/RESEARCH_PLAN_03.23.2017.docx).


```r
alpha <- 0.05
beta <- 1 - 0.90
```


## Aim 1

Identify the exercise-related signal that causes histamine release in skeletal muscle

* Blocking on subject, matched pairs
* One-factor design
  * Factor: heat or unheated (Aim 1a)
  * Factor: rest or exercise (Aim 1b)
* Aim 1a and 1b use two separate cohorts of subjects
* Randomize which leg receives heat (Aim 1a) and performs exercise (Aim 1b)
* Assume the effect of heat (1a) and exercise (1b) are highly correlated; 
  i.e., only need to run power/sample-size calculations for 1 sub-aim
* Power on the pre-to-during experimental condition comparison
  * Not necessary to power on the pre-to-post comparison

Use the *Effect size* column in the *Sample sizes* tab of the Excel workbook file
[`Models and Sample size estimates 3.17.2017.xlsx`](background/Models\sand\sSample\ssize\sestimates\s3.17.2017.xlsx).


```r
effectSizes <- c(1.44, 1.74)
power <- pwr.t.test(d = min(effectSizes),
                    sig.level = alpha, power = 1 - beta, 
                    type = "one.sample")
message(sprintf("Estimated sample size for Aim 1: %d",
                ceiling(power[["n"]])))
```

```
## Estimated sample size for Aim 1: 8
```

```r
L <- list("aim1" = power)
```


## Aim 2

Determine the histaminergic component of endothelial and vascular smooth muscle responses to exercise

* Two-factor design
  * Factor A: rest or exercise (nuisance)
  * Factor B: no blockade, *in vitro* blockade, or *in vivo* blockade
* Blocking on subject
  * Each subject has measurements for each $A \times B$ combination
* Randomize blockade factor

---

> From: halliwil@cas.uoregon.edu [mailto:halliwil@cas.uoregon.edu] On Behalf Of John Halliwill, PhD  
> Sent: Tuesday, April 04, 2017 12:06 PM  
> To: Benjamin Chan <chanb@ohsu.edu>  
> Subject: Re: Statistical consultant for R01  
> 
> OK, changing out of all caps mode... for Aim 2, I am going to place two
> microdialysis fibers in each subject, and randomize one to control (no drug)
> and the other to blockade. Then I will collect samples before and during
> exercise. All this will be done in each subject. When we take the dialysate to
> cell culture, we can add drugs to half the control samples to create our in
> vitro blockade group. This means that every condition is generated in every
> subject. We can randomize control, in vivo blockade, and in vitro blockade,
> but we can't randomize resting (pre-exercise) versus exercise. I hope that
> makes sense.

---

> From: halliwil@cas.uoregon.edu [mailto:halliwil@cas.uoregon.edu] On Behalf Of John Halliwill, PhD  
> Sent: Tuesday, April 04, 2017 2:47 PM  
> To: Benjamin Chan <chanb@ohsu.edu>  
> Subject: Re: Statistical consultant for R01  
> 
> [Ben] This sounds like there will be imbalance in the blockade factor
> (25:25:50 split between control : in vitro blockade : in vivo blockade). Is
> this the intent? Am I missing something?
> 
> Step 1: In vivo blockade or not in vivo blockade (50:50 split)  
> 
> Step 2: Among not in vivo blockade, split into control or in vitro blockade (50:50 split of the 50%)  
> 
> FOR AIM 2, THE PROCESS OF STEPS YOU DESCRIBE IS CORRECT. WE WILL JUST END UP WITH LEFTOVER DIALYSATE FROM THE IN VIVO BLOCKADE PROBES.  

---

> From: halliwil@cas.uoregon.edu [mailto:halliwil@cas.uoregon.edu] On Behalf Of John Halliwill, PhD  
> Sent: Tuesday, April 11, 2017 3:12 PM  
> To: Benjamin Chan <chanb@ohsu.edu>  
> Subject: Re: Statistical consultant for R01  
> 
> We are interested in the exercise conditions across the three blockade states. 
> Since we will have the data, we will look at the rest condition across the three blockade states as an experimental control - 
> there shouldn't be any effect of blockade on resting data. 

Attempt to bracket sample size.

**Most conservative estimate.**
Residual variance is $2.5\times$ effect size.
Number of subjects is 44.


```r
power <- sim(s = 2.5, n = 44)
L2 <- list("aim2_scenarioA" = power)
power
```

```
## $lme
## Linear mixed model fit by REML ['lmerMod']
## Formula: y ~ a + b + (1 | subject)
##    Data: df
## REML criterion at convergence: 1444.129
## Random effects:
##  Groups   Name        Std.Dev.
##  subject  (Intercept) 1.18    
##  Residual             2.95    
## Number of obs: 264, groups:  subject, 44
## Fixed Effects:
##        (Intercept)           aExercise  bIn vitro blockade  
##               0.00                1.18                0.00  
##  bIn vivo blockade  
##               0.00  
## 
## $power
## Power for predictor 'a', (95% confidence interval):
##       88.50% (83.25, 92.57)
## 
## Test: Likelihood ratio
## 
## Based on 200 simulations, (0 warnings, 0 errors)
## alpha = 0.05, nrow = 264
## 
## Time elapsed: 0 h 0 m 35 s
```

**Moderate-high conservative estimate.**
Residual variance is $2.2\times$ effect size.
Number of subjects is 32.


```r
power <- sim(s = 2.2, n = 32)
L2 <- c(L2, list("aim2_scenarioB" = power))
power
```

```
## $lme
## Linear mixed model fit by REML ['lmerMod']
## Formula: y ~ a + b + (1 | subject)
##    Data: df
## REML criterion at convergence: 959.0521
## Random effects:
##  Groups   Name        Std.Dev.
##  subject  (Intercept) 1.180   
##  Residual             2.596   
## Number of obs: 192, groups:  subject, 32
## Fixed Effects:
##        (Intercept)           aExercise  bIn vitro blockade  
##               0.00                1.18                0.00  
##  bIn vivo blockade  
##               0.00  
## 
## $power
## Power for predictor 'a', (95% confidence interval):
##       88.50% (83.25, 92.57)
## 
## Test: Likelihood ratio
## 
## Based on 200 simulations, (1 warning, 0 errors)
## alpha = 0.05, nrow = 192
## 
## Time elapsed: 0 h 0 m 36 s
```

**Moderately conservative estimate.**
Residual variance is $1.8\times$ effect size.
Number of subjects is 22.


```r
power <- sim(s = 1.8, n = 22)
L2 <- c(L2, list("aim2_scenarioC" = power))
power
```

```
## $lme
## Linear mixed model fit by REML ['lmerMod']
## Formula: y ~ a + b + (1 | subject)
##    Data: df
## REML criterion at convergence: 579.9356
## Random effects:
##  Groups   Name        Std.Dev.
##  subject  (Intercept) 1.180   
##  Residual             2.124   
## Number of obs: 132, groups:  subject, 22
## Fixed Effects:
##        (Intercept)           aExercise  bIn vitro blockade  
##               0.00                1.18                0.00  
##  bIn vivo blockade  
##               0.00  
## 
## $power
## Power for predictor 'a', (95% confidence interval):
##       89.50% (84.40, 93.38)
## 
## Test: Likelihood ratio
## 
## Based on 200 simulations, (0 warnings, 0 errors)
## alpha = 0.05, nrow = 132
## 
## Time elapsed: 0 h 0 m 32 s
```

**Moderate-low conservative estimate.**
Residual variance is $1.5\times$ effect size.
Number of subjects is 14.


```r
power <- sim(s = 1.5, n = 14)
L2 <- c(L2, list("aim2_scenarioD" = power))
power
```

```
## $lme
## Linear mixed model fit by REML ['lmerMod']
## Formula: y ~ a + b + (1 | subject)
##    Data: df
## REML criterion at convergence: 351.0222
## Random effects:
##  Groups   Name        Std.Dev.
##  subject  (Intercept) 1.18    
##  Residual             1.77    
## Number of obs: 84, groups:  subject, 14
## Fixed Effects:
##        (Intercept)           aExercise  bIn vitro blockade  
##               0.00                1.18                0.00  
##  bIn vivo blockade  
##               0.00  
## 
## $power
## Power for predictor 'a', (95% confidence interval):
##       89.00% (83.82, 92.98)
## 
## Test: Likelihood ratio
## 
## Based on 200 simulations, (0 warnings, 0 errors)
## alpha = 0.05, nrow = 84
## 
## Time elapsed: 0 h 0 m 31 s
```

**Least conservative estimate.**
Residual variance is $1.2\times$ effect size.
Number of subjects is 9.


```r
power <- sim(s = 1.2, n = 9)
L2 <- c(L2, list("aim2_scenarioE" = power))
power
```

```
## $lme
## Linear mixed model fit by REML ['lmerMod']
## Formula: y ~ a + b + (1 | subject)
##    Data: df
## REML criterion at convergence: 197.7338
## Random effects:
##  Groups   Name        Std.Dev.
##  subject  (Intercept) 1.180   
##  Residual             1.416   
## Number of obs: 54, groups:  subject, 9
## Fixed Effects:
##        (Intercept)           aExercise  bIn vitro blockade  
##               0.00                1.18                0.00  
##  bIn vivo blockade  
##               0.00  
## 
## $power
## Power for predictor 'a', (95% confidence interval):
##       92.50% (87.93, 95.74)
## 
## Test: Likelihood ratio
## 
## Based on 200 simulations, (1 warning, 0 errors)
## alpha = 0.05, nrow = 54
## 
## Time elapsed: 0 h 0 m 33 s
```

## Aim 3

Determine the impact of histamine on short-term inflammatory responses to exercise

* Randomized crossover design
* One-factor design
  * Factor A: control or blockade
  * Include 1-week washout period
* Blocking on subject
* Randomize order of factor
* Repeated measurements at t = 0, 3, 6, 12, 24, 48h but only interested in *peak* values
  * Reduce analysis to paired sample test, pre vs peak change

Use the *Effect size* column in the *Sample sizes* tab of the Excel workbook file
[`Models and Sample size estimates 3.17.2017.xlsx`](background/Models\sand\sSample\ssize\sestimates\s3.17.2017.xlsx).


```r
effectSizes <- c(1.82, 2.19, 0.98)
power <- pwr.t.test(d = min(effectSizes),
                    sig.level = alpha, power = 1 - beta, 
                    type = "one.sample")
message(sprintf("Estimated sample size for Aim 3: %d",
                ceiling(power[["n"]])))
```

```
## Estimated sample size for Aim 3: 14
```

```r
L <- c(L, list("aim3" = power))
```


## Aim 4

Determine the histamine component of longer-term adaptations to exercise training

* Randomized controlled trial
* Randomize control or blockade
* One consideration here is how to handle subject dropout and resulting
  missing data. We would want to know if more/fewer blockade subjects drop out
  compared to control (could be a problem), so that is something like
  "intention to treat" (but i may not use that phrase correctly). On the other
  hand, we want to know (more important) whether blockade has an effect on
  adaptation in those who do complete the training (which is different than
  intention to treat. if they don't complete the training, then they don't
  help us answer this question). I have seen this concept lead to confusion
  during grant reviews, so we want to make sure we are clear how we are
  thinking about this and handling it in the stats.
* Analyze as *per protocol* analysis
  * Only subjects who completed the protocol are analyzed
  * This can be justified but needs to be stated up front
  * Ref: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3159210](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3159210)


```r
dropout <- 0.20
effectSizes <- c(2.55, 1.54, 1.50)
power <- pwr.t.test(d = min(effectSizes),
                    sig.level = alpha, power = 1 - beta, 
                    type = "two.sample")
message(sprintf("Estimated sample size for Aim 4: %d in each group",
                ceiling(power[["n"]] * (1 + dropout))))
```

```
## Estimated sample size for Aim 4: 13 in each group
```

```r
L <- c(L, list("aim4" = power))
```


# Summary

Aims 1, 3, and 4 are straightforward study designs.
Their power and sample size calculations are also straightforward.
The calculations are summarized below.


| Aim|Study design                    |Statistical model | Min. hypothesized effect size| Total sample size|Additional notes                                                                    | Alpha level|Power |Sidedness |
|---:|:-------------------------------|:-----------------|-----------------------------:|-----------------:|:-----------------------------------------------------------------------------------|-----------:|:-----|:---------|
|   1|One-sample matched pairs        |One-sample t-test |                          1.44|                 8|NA                                                                                  |        0.05|90%   |Two-sided |
|   3|One-sample randomized crossover |One-sample t-test |                          0.98|                14|NA                                                                                  |        0.05|90%   |Two-sided |
|   4|Two-sample RCT                  |Two-sample t-test |                          1.50|                26|Per protocol analysis; 50:50 ratio of study groups; sample size assumes 20% dropout |        0.05|90%   |Two-sided |

Aim 2 is more complicated.
The study design is a full factorial design with two factors and blocking on subject.
I.e., each subject experiences each experimental condition under the factors of exercise (rest or exercise) and blockade (none, in vitro, and in vivo).
The statistical model is a mixed effects model with two fixed effects for the factors and a random intercept effect for subject.
Power and sample size was determined using simulations with the `simr` package.
Power was calculated by bracketing over a number of scenarios with varying residual variance, `s`.
Simulation parameters held constant were: effect size and random intercept variance, `V1`, which was set to equal the squared effect size.
Sample sizes were chosen to give a power near 90%.
From the table below, you can see that the relationship between sample size and residual SD is increasing;
i.e., in the presence of higher residual variance, a larger sample size is required.


| Aim| Hypothesized effect size| Subject SD| Residual SD| Sample size|Power | Alpha level|Sidedness |
|---:|------------------------:|----------:|-----------:|-----------:|:-----|-----------:|:---------|
|   2|                     1.18|       1.18|       2.950|          44|88.5% |        0.05|Two-sided |
|   2|                     1.18|       1.18|       2.596|          32|88.5% |        0.05|Two-sided |
|   2|                     1.18|       1.18|       2.124|          22|89.5% |        0.05|Two-sided |
|   2|                     1.18|       1.18|       1.770|          14|89.0% |        0.05|Two-sided |
|   2|                     1.18|       1.18|       1.416|           9|92.5% |        0.05|Two-sided |
