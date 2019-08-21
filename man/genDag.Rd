\name{genDag}
\alias{genDag}
\encoding{UTF-8}
\title{ Generate DAG sequence command for CondorDAG}
\description{
  The function is responsible to generate the dag sequence commands file for CondorDAG.
  It can only do linear sequence!
}
\usage{
     genDag(nstep=1,nam=LETTERS,condor.name="rio_condor_",dag.out="rio.dag")

}
\arguments{
  \item{nstep}{ Number of steps to break the MCMC. }
  \item{nam}{ Proccesses names, must be a vector of strings or character. }
  \item{condor.name}{ File name for the Condor sumbission(s) file(s) to be included in the 
      DAG file. }
  \item{dag.out}{ File name for the CondorDAG submission file. }
}
\details{
  This function create the necessary structure in a CondorDAG submission file to be executed at 
  CondorDAG to run a proccess in multiple steps.
}
\value{
  DAG sumbission file created as output.
}
\author{Jun Yan \email{jyan@stat.uconn.edu} and Marcos O. Prates \email{marcosop@est.ufmg.br}}
\keyword{utilities}
\keyword{interface}
