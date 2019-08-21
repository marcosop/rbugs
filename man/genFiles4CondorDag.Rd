\name{genFiles4CondorDag}
\alias{genFiles4CondorDag}
\encoding{UTF-8}
\title{ Generate necessary Condor and R script files for CondorDAG}
\description{
  The function is responsible to generate the submission Condor files 
  as well as the .R scripts from the template files.
}
\usage{
    genFiles4CondorDag(nstep=1,files.to.pass=NULL, pattern="_nstep_",n.jobs=nstep,...)

}
\arguments{
  \item{nstep}{ Number of steps to break the MCMC. }
  \item{files.to.pass}{ Vector of string with the files that needs to be sumbitted
         with the jobs. It might have a patterns to be substituted for each step.}
  \item{pattern}{ Selected pattern for the passed files to Condor that must be 
         substituted on creation.}
  \item{n.jobs}{ Must be the same as name steps, used for unification of the functions. }
  \item{...}{ Other genCondor() commands }
}
\details{
  This function create the necessary files strucuture to be executed at 
  CondorDAG to run a proccess in multiple steps.
}
\value{
  Files created as output.
}
\author{Jun Yan \email{jyan@stat.uconn.edu} and Marcos O. Prates \email{marcosop@est.ufmg.br}}
\keyword{utilities}
\keyword{interface}
