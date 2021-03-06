#' Respondent-specific covariates for the eggs dataset
#'
#' A dataset containing covariate information for the
#' \code{\link{eggs.data}} dataset, which contains results from a
#' choice survey on consumer's egg buying preferences.
#'
#' \itemize{
#'   \item \code{id} - Respondent ID number.
#'   \item \code{most.shoping} - A factor with two levels describing who in the
#'    household does the most shopping.
#'   \item \code{egg.choice} - A factor with five levels asking what type of eggs
#' the respondent typically buys.
#'   \item \code{gender} - A factor with two levels giving the respondent's gender.
#'   \item \code{age} - A factor with nine levels giving the age category the respondent
#' falls into.
#'   \item \code{income} - A factor with six levels giving what income bracket the
#' respondent falls into.
#'   \item \code{living.situation} - A factor with six levels giving the respondents living
#' situation (alone, with children, etc.)
#' \item \code{num.eggs} - A factor with three levels giving the number of eggs  the
#' respondent usually buys.
#' \item \code{age2} - Same as \code{age} except with age brackets combined so that
#' there are only four levels.
#' \item \code{egg.choice2} - Same as \code{egg.choice} except with some categories
#' combined so that there are only two levels.
#' }
#' @references Street, Burgess, and Louviere (2005). Quick and Easy Choice Sets:
#' Constructing Optimal and Nearly Optimal Stated Choice Experiments. International
#' Journal of Research In Marketing, 22 (4), 459-470.
#' @docType data
#' @keywords datasets
#' @name eggs.cov
#' @usage data(eggs.cov)
#' @format A data frame with 380 rows and 10 columns
NULL
