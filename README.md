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
##   R Core Team (2016). R: A language and environment for
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
##     year = {2016},
##     url = {https://www.R-project.org/},
##   }
## 
## We have invested a lot of time and effort in creating R, please
## cite it when using it for data analysis. See also
## 'citation("pkgname")' for citing R packages.
```



## Reproducibility

To recreate this analysis in this Git repository, execute `script.R` from the `scripts` directory.

```
$ cd scripts
$ /usr/bin/Rscript script.R
```

R package versions are listed in [`scripts/session.log`](scripts/session.log).
