% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CalcLikelihood.R
\name{CalcLikelihood}
\alias{CalcLikelihood}
\title{Calculate the log likelihood of a document term matrix given a topic model}
\usage{
CalcLikelihood(dtm, phi, theta, ...)
}
\arguments{
\item{dtm}{The document term matrix of class \code{dgCMatrix}.}

\item{phi}{The phi matrix whose rows index topics and columns index words. 
The i, j entries are P(word_i | topic_j)}

\item{theta}{The theta matrix whose rows index documents and columns index topics. 
The i, j entries are P(topic_i | document_j)}

\item{...}{Other arguments to pass to \code{\link[textmineR]{TmParallelApply}}. See note, below.}
}
\value{
Returns an object of class \code{numeric} corresponding to the log likelihood.
}
\description{
This function takes a DTM, phi matrix (P(word|topic)), and a theta matrix 
    (P(topic|document)) and returns a single value for the likelihood of the 
    data given the model.
}
\note{
This function performs parallel computation if \code{dtm} has more than 3,000
rows. The default is to use all available cores according to \code{\link[parallel]{detectCores}}.
However, this can be modified by passing the \code{cpus} argument when calling
this function.
}
\examples{
# Load a pre-formatted dtm and topic model
data(nih_sample_dtm) 
data(nih_sample_topic_model)

# Get the likelihood of the data given the fitted model parameters
ll <- CalcLikelihood(dtm = nih_sample_dtm, 
                     phi = nih_sample_topic_model$phi, 
                     theta = nih_sample_topic_model$theta)

ll
}

