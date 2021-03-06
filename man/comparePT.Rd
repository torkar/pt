\docType{methods}
\name{comparePT}
\alias{comparePT}
\alias{comparePT,Choices-method}
\title{Compare choice gambles under Tversky and Kahneman's (1992) (Cumulative) prospect theory (PT).}
\usage{
comparePT(object, prob_weight_for_positive_outcomes,
  prob_weight_for_negative_outcomes, utility, digits)

\S4method{comparePT}{Choices}(object, prob_weight_for_positive_outcomes,
  prob_weight_for_negative_outcomes, utility, digits)
}
\arguments{
  \item{object}{Choices, an instance of a Choices class.}

  \item{prob_weight_for_positive_outcomes}{ProbWeight, an
  instance of a ProbWeight class.}

  \item{prob_weight_for_negative_outcomes}{ProbWeight, an
  instance of a ProbWeight class.}

  \item{utility}{Utility, an instance of a Utility class.}

  \item{digits}{numeric, the number of digits to display in
  the output.}
}
\description{
Compare choice gambles under Tversky and Kahneman's (1992)
(Cumulative) prospect theory (PT).
}
\examples{
# This example creates the two Allais common consequence paradox choices,
# and computes the PT for each gamble in the choices.

choice_ids <- c(1, 1, 1, 1, 2, 2, 2, 2)

gamble_ids <- c(1, 1, 1, 2, 1, 1, 2, 2)

outcome_ids <- c(1, 2, 3, 1, 1, 2, 1, 2)

objective_consequences <- c(2500, 2400, 0, 2400,
	2500, 0, 2400, 0)

probability_strings <- c("0.33", "0.66", "0.01", "1.0",
	"0.33", "0.67", "0.34", "0.66")

my_choices <- Choices(choice_ids=choice_ids,
	gamble_ids=gamble_ids,
	outcome_ids=outcome_ids,
	objective_consequences=objective_consequences,
	probability_strings=probability_strings)

my_choices

tk_1992_utility <- Utility(fun="power",
	par=c(alpha=0.88, beta=0.88, lambda=2.25))

tk_1992_positive_probWeight <-
	ProbWeight(fun=
	"Tversky_Kahneman_1992",
	par=c(alpha=0.61))

tk_1992_negative_probWeight <-
	ProbWeight(fun=
	"Tversky_Kahneman_1992",
	par=c(alpha=0.69))

comparePT(my_choices,
	prob_weight_for_positive_outcomes=
	tk_1992_positive_probWeight,
	prob_weight_for_negative_outcomes=
	tk_1992_negative_probWeight,
	utility=tk_1992_utility,
	digits=4)
}
\references{
Tversky, A., & Kahneman, D. (1992). Advances in prospect
theory: Cumulative representation of uncertainty. Journal
of Risk and Uncertainty, 5(4), 297-323.

Wakker, P. P. (2010). Prospect theory: For risk and
ambiguity. Cambridge, UK: Cambridge University Press.
}

