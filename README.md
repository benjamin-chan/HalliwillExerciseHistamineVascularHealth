# Halliwill: Exercise, Histamine Receptors, and Vascular Health in Aging

Attribute | Value
:---|:---
Principal investigator | John Halliwill, halliwil@cas.uoregon.edu
Main contact | NA
Statistician | Benjamin Chan, chanb@ohsu.edu, 503-494-5491
eIRB # | IRB00000000


## Objectives

* **Aim 1:** Identify the exercise-related signal that causes histamine release in skeletal muscle
  * Blocking on subject, matched pairs
  * One-factor design
    * Factor: heat or unheated (Aim 1a)
    * Factor: rest or exercise (Aim 1b)
  * Aim 1a and 1b use two separate cohorts of subjects
  * Randomize which leg receives heat (Aim 1a) and performs exercise (Aim 1b)
  * Assume the effect of heat (1a) and exercise (1b) are highly correlated; i.e., only need to run power/sample-size calculations for 1 sub-aim
  * Power on the pre-to-during experimental condition comparison
  * Inputs
    * Fig 1
    * Fig 5
* **Aim 2:** Determine the histaminergic component of endothelial and vascular smooth muscle responses to exercise
  * Two-factor design
    * Factor A: rest or exercise
    * Factor B: no blockade, *in vitro* blockade, or *in vivo* blockade
  * Blocking on subject
  * Randomize order of factors
  * For Aim 2, I am going to place two microdialysis fibers in each subject,
    and randomize one to control (no drug) and the other to blockade. Then I
    will collect samples before and during exercise. All this will be done in
    each subject. When we take the dialysate to cell culture, we can add drugs
    to half the control samples to create our in vitro blockade group. This
    means that every condition is generated in every subject. We can randomize
    control, in vivo blockade, and in vitro blockade, but we can't randomize
    resting (pre-exercise) versus exercise. I hope that makes sense.
* **Aim 3:** Determine the impact of histamine on short-term inflammatory responses to exercise
  * Randomized crossover design
  * One-factor design
    * Factor A: control or blockade
    * Include 1-week washout period
  * Blocking on subject
  * Randomize order of factor
  * Repeated measurements at t = 0, 3, 6, 12, 24, 48h but only interested in *peak* values
    * Reduce analysis to paired sample test, pre vs peak change
* **Aim 4:** Determine the histamine component of longer-term adaptations to exercise training
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


## Deliverables



## Results

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


## Methods



## Outputs



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


## Reproducibility

To recreate this analysis in this Git repository, execute `script.R` from the `scripts` directory.

```
$ cd scripts
$ /usr/bin/Rscript script.R
```

R package versions are listed in [`scripts/session.log`](scripts/session.log).
