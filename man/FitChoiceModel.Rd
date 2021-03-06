% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/choicemodel.R
\name{FitChoiceModel}
\alias{FitChoiceModel}
\title{FitChoiceModel}
\usage{
FitChoiceModel(design = NULL, experiment.data = NULL,
  cho.lines = NULL, cho.file = NULL, design.variables = NULL,
  design.file = NULL, attribute.levels = NULL,
  attribute.levels.file = NULL, cov.formula = NULL, cov.data = NULL,
  choices = NULL, questions = NULL, tasks = NULL,
  simulated.priors = NULL, simulated.priors.from.design = FALSE,
  simulated.sample.size = 300, synthetic.priors = NULL,
  synthetic.priors.from.design = NULL, synthetic.sample.size = NULL,
  n.classes = 1, subset = NULL, weights = NULL,
  missing = "Use partial data", seed = 123, tasks.left.out = 0,
  algorithm = "HB-Stan", lc.tolerance = 1e-04,
  initial.parameters = NULL, normal.covariance = "Full",
  hb.iterations = 100, hb.chains = 8, hb.max.tree.depth = 10,
  hb.adapt.delta = 0.8, hb.keep.samples = FALSE, hb.stanfit = TRUE,
  hb.prior.mean = 0, hb.prior.sd = 5,
  hb.sigma.prior.shape = 1.39435729464721,
  hb.sigma.prior.scale = 0.39435729464721, hb.lkj.prior.shape = 4,
  hb.warnings = TRUE, hb.beta.draws.to.keep = 0,
  include.choice.parameters = TRUE, respondent.ids = NULL, ...)
}
\arguments{
\item{design}{A design object produced by ChoiceModelDesign}

\item{experiment.data}{A data.frame from an Experiment question}

\item{cho.lines}{A character vector of lines from a CHO file.}

\item{cho.file}{The file path to a cho file.}

\item{design.variables}{A list of variables of columns from a Sawtooth
design file (dual file format) or a JMP design file.}

\item{design.file}{The file path to a Sawtooth design file (dual
file format) or a JMP design file.}

\item{attribute.levels}{A list of attribute levels (with attribute names as
names) or a character matrix with the first row containing attribute
names and subsequent rows containing attribute levels.}

\item{attribute.levels.file}{The file path to an Excel file
containing the level names of each attribute.}

\item{cov.formula}{An optional \code{\link{formula}} for any fixed
(respondent-specific) covariates to be included in the model.
When only 1 class is specified, covariates are applied to the
mean parameter theta (fixed covariates). When more than 1 class
is specified, covariates are applied to the class weight
parameters.}

\item{cov.data}{An optional \code{\link{data.frame}} containing the
variables present in \code{cov.formula}.}

\item{choices}{A data.frame of choices made by respondents for each
question.}

\item{questions}{Deprecated. Replaced by tasks.}

\item{tasks}{A data.frame of IDs of tasks presented to the
respondents.}

\item{simulated.priors}{A 2-column matrix whose columns correspond
to the mean and standard deviations of the parameters; or a
character matrix with attribute levels and corresponding mean
and sd columns after each attribute level column.}

\item{simulated.priors.from.design}{Whether simulated priors from
the design object are to be used.}

\item{simulated.sample.size}{The number of simulated respondents to
generate.}

\item{synthetic.priors}{Deprecated. see simulated.priors.}

\item{synthetic.priors.from.design}{Deprecated. See
simulated.priors.from.design.}

\item{synthetic.sample.size}{Deprecated. See simulated.sample.size.}

\item{n.classes}{The number of latent classes.}

\item{subset}{An optional vector specifying a subset of
observations to be used in the fitting process.}

\item{weights}{An optional vector of sampling or frequency weights.}

\item{missing}{How missing data is to be treated in the
regression. Options: \code{"Error if missing data"},
\code{"Exclude cases with missing data"}, and
\code{"Use partial data"}.}

\item{seed}{Random seed.}

\item{tasks.left.out}{Number of questions to leave out for
cross-validation.}

\item{algorithm}{Either "HB-Stan" for Hierarchical Bayes or "LCA"
for latent class analysis.}

\item{lc.tolerance}{The tolerance used for defining convergence in
latent class analysis.}

\item{initial.parameters}{Specify initial parameters intead of
starting at random in latent class analysis. The initial
parameters need to be supplied as list consisting of a matrix
called class.parameters whose columns are the parameters of the
classes, and a vector called class.sizes containing the class
size parameters.}

\item{normal.covariance}{The form of the covariance matrix for
Hierarchical Bayes. Can be 'Full, 'Spherical', 'Diagonal'.}

\item{hb.iterations}{The number of iterations in Hierarchical
Bayes.}

\item{hb.chains}{The number of chains in Hierarchical Bayes.}

\item{hb.max.tree.depth}{http://mc-stan.org/misc/warnings.html#maximum-treedepth-exceeded}

\item{hb.adapt.delta}{http://mc-stan.org/misc/warnings.html#divergent-transitions-after-warmup}

\item{hb.keep.samples}{Whether to keep the samples of all the
parameters in the output.}

\item{hb.stanfit}{Whether to include the stanfit property.}

\item{hb.prior.mean}{The mean for the priors of the mean parameters
theta_raw. This is either passed as a scalar which applies to
all parameters or a numeric vector with each element
corresponding to a variable or attribute. If hb.prior.mean is
nonzero for a categorical attribute, the attribute is treated
as ordered categorical and hb.prior.mean controls the offsets
from the base attribute.}

\item{hb.prior.sd}{The standard deviations for the priors of the
mean parameters theta_raw. This is passed as a numeric vector
with each element corresponding to an attribute, or a
scalar. If hb.prior.mean is nonzero for a categorical
attribute, the attribute is treated as ordered categorical and
hb.prior.sd controls the standard deviations of the offsets
from the base attribute.}

\item{hb.sigma.prior.shape}{Postive real number; the shape
hyperparameter for the gamma priors used for the scale
parameters of the respondent coefficients covariance matrix.}

\item{hb.sigma.prior.scale}{Postive real number; the rate
hyperparameter for the gamma priors used for the scale
parameters of the respondent coefficients covariance matrix.}

\item{hb.lkj.prior.shape}{Real number greater than one; the shape
    hyperparameter for the LKJ prior used for the correlation matrix
    of the respondent coefficients distribution. A value of one gives
equal probability weight to all possible correlation matrices. Larger values
favour less correlation (draws closer to the identity matrix).}

\item{hb.warnings}{Whether to show warnings from Stan.}

\item{hb.beta.draws.to.keep}{Maximum number of beta draws per
respondent to return in beta.draws.}

\item{include.choice.parameters}{Whether to include
alternative-specific parameters.}

\item{respondent.ids}{If a cho file is supplied, this is the vector
of the respondent IDs to use.}

\item{...}{Additional parameters to pass on to \code{rstan::stan}
and \code{rstan::sampling}.}
}
\value{
A list with the following components:
\itemize{
    \item \code{respondent.parameters} A matrix containing the parameters
    of each respondent.
    \item \code{reduced.respondent.parameters} A matrix containing the
    parameters of each respondent, excluding the constrained parameters.
    \item \code{simulated.respondent.parameters} If simulated priors are
    used, this is a matrix containing the simulated parameters of
    each respondent, excluding the constrained parameters.
    \item \code{parameter.statistics} A matrix
    containing parameter statistics such as effective sample size
    and Rhat (HB-Stan) or standard errors and p-values (LCA).
    \item \code{stan.fit} The stanfit object from the
    analysis (only for the HB-Stan algorithm).
    \item \code{beta.draws} A 3D array containing
    sampling draws of beta for each respondent (only for the HB-Stan
     algorithm).
\item \code{param.names.list} A list containing names for various model parameters
as follows:
\itemize{
\item respondent.pars - names for the (constrained) respondent parameters/coefficients
\item unconstrained.respondent.pars - names for the unconstrained respondent
parameters/coefficients
\item stan.pars - names for the parameters used in the stan code; useful for extracting
samples, using diagnostics, etc. when working with the stan.fit object
\code{mean.pars} - names for the (population) mean parameters (theta in the stan code) for
the respondent parameters
\item covariates - names for the covariates in the model (i.e. the
      terms in \code{cov.formula})
\item sd.pars - names for the standard deviation (sigma) parameters in the
model. Equal to \code{mean.pars} unless grouped covariates are included in the model
}

    \item \code{in.sample.accuracy} The in-sample prediction accuracy.
    \item \code{out.sample.accuracy} The out-of-sample prediction
    accuracy.
    \item \code{prediction.accuracies} A vector of
    prediction accuracies for each respondent.
    \item \code{algorithm} The type of algorithm used.
    \item \code{n.questions.left.out} The number of questions left out
    for out-of-sample testing.
    \item \code{n.classes} The number of classes.
    \item \code{n.respondents} The number of respondents.
    \item \code{n.questions} The number of questions
    per respondent.
    \item \code{n.alternatives} The number of alternatives per question.
    \item \code{n.attributes} The number of attributes.
    \item \code{n.parameters} The number of parameters in the analysis.
    \item \code{time.taken} The time taken to run the analysis.
    \item \code{log.likelihood} The log likelihood.
    \item \code{bic} The Bayesian Information Criterion.
    \item \code{coef} A vector/matrix of parameter estimates (LCA only).
    \item \code{rlh} A vector of respondent RLH (in-sample).
    \item \code{mean.rlh} RLH over all respondent questions (in-sample).
    \item \code{rlh.out} A vector of respondent RLH (holdout).
    \item \code{mean.rlh.out} RLH over all respondent questions (holdout).
}
}
\description{
Fit a choice-based conjoint model using methods such
    as Hierarchical Bayes
}
\examples{
\dontrun{
data(eggs, package = "flipChoice")
fit <- FitChoiceModel(experiment.data = eggs.data, hb.iterations = 100,
                      hb.chains = 1, tasks.left.out = 2)
print(fit)
ExtractParameterStats(fit)
PlotPosteriorIntervals(fit)
TracePlots(fit)

choices <- eggs.data[, 1:8]
questions <- data.frame(t(matrix(1:3040, nrow = 8)))
hb.prior.mean <- c(0, 0, 1, 1, 2, 1, 1, 2, 4, 0, 0, 0, -1, -3, -5, -9)
fit.with.prior <- FitChoiceModel(
    design.file = "http://wiki.q-researchsoftware.com/images/3/35/Eggs_design_with_levels.xlsx",
    choices = choices, questions = questions,
    hb.iterations = 100, hb.chains = 1,
    tasks.left.out = 2, hb.prior.mean = hb.prior.mean)
print(fit.with.prior)
}
}
