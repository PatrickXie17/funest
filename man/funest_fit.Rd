% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nest_fit.R
\name{funest_fit}
\alias{funest_fit}
\title{Fitting functional ensemble survival tree model}
\usage{
funest_fit(
  long_train,
  surv_train,
  noftree = 500,
  nofcov = 2,
  split_rule = "maxstat",
  tv_names,
  fv_names,
  nofp = 3,
  t_star,
  t_pred,
  ...
)
}
\arguments{
\item{long_train}{long form of survival data from the training set}

\item{surv_train}{short form of survival data from the training set}

\item{noftree}{number of trees in the random survival forest}

\item{nofcov}{number of covariates selected in each survival tree}

\item{split_rule}{binary splitting rule for random survival forest, default is "maxstat"}

\item{tv_names}{a list of names of time-varying covariates}

\item{fv_names}{a list of names of fixed covariates}

\item{nofp}{number of multivariate principal components}

\item{t_star}{time for the last observed biomarker measurement}

\item{t_pred}{time at prediction}

\item{...}{extra arguments that can be passed to ranger()}
}
\value{
A list compose two items. The first item is a list
of necessary information for prediction used in funest_pred()
function. The second item is the ranger object of the fitted
random survival forest.
\itemize{
\item misc - a list composed of 1) long_train: long form of survival data from the training set,
2) surv_train: short form of survival data from the training set,
3) fmla: covariates passed into the ensemble survival tree
4) score_names: intermediate names for the covariates
5) nofp: number of multivariate principal components
6) train_data.sub: data frame of all covariates after MFPCA been performed
\item rg - functional ensemble survival tree model
}
}
\description{
The function funest_fit takes a long and a short form of the survival data,
among other arguments for a random survival forest, to fit an functional ensemble survival tree
model for predicting survival probability.
}
\examples{
library(funest)
data("long_train")
data("surv_train")
w = funest_fit(long_train, surv_train, tv_names = list("Y1", "Y2", "Y3"), fv_names = list("W"),
 noftree = 10, t_star = 5.5, t_pred = 11)
}
\references{
\insertRef{nestpaper}{funest}

\insertRef{ranger}{funest}
}
