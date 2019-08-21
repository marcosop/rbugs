\name{genFiles4Condor}
\alias{genFiles4Condor}
\encoding{UTF-8}
\title{ Generate submission file for Condor}
\description{
  The function is responsible to generate the submission file for Condor and the .R 
  scripts from the templates.
}
\usage{
     genFiles4Condor(condor.file=system.file("bugs/condor/template.condor",
                                              package="rbugs"),
		   r.file=system.file("bugs/condor/condor_template.R",package="rbugs"),
       n.jobs = 1,
       dag = FALSE,
       files.to.pass = NULL,
 		rbugs.args = list(n.chain = 1, n.iter = 1000, n.burnin = 0, n.thin = 1),
       condor.out = "rio.condor",
		   r.out = "rio_condor_")

}
\arguments{
  \item{condor.file}{ Condor template submission file to be used.}
  \item{r.file}{ R script template to be executed by each Condor job.}
  \item{n.jobs}{ Number of jobs that will be submited to Condor. }
  \item{dag}{ If TRUE, a DAG chain will be generated. }
  \item{files.to.pass}{ Vector of string with the files that needs to be sumbitted
         with the jobs. }
  \item{rbugs.args}{ rbugs arguments to be provided to the R script file to 
         execute the MCMC chain. }
  \item{condor.out}{ File name for the Condor sumbission file. }
  \item{r.out}{ File base name for the R script files. }
}
\details{
  This function create the necessary files strucuture to be executed at 
  Condor to run multiple proccesses.
}
\value{
  Files created as output.
}
\author{Jun Yan \email{jyan@stat.uconn.edu} and Marcos O. Prates \email{marcosop@est.ufmg.br}}
\keyword{utilities}
\keyword{interface}
