genDag <- function(nstep=1,nam=LETTERS,condor.name="rio_condor_",dag.out="rio.dag"){

 if(nstep < 1) stop("The number os steps must be greater or equal to one")

 text <- paste("Job ",nam[1],"  ",condor.name,0,".condor",sep="")
 write(text,file=dag.out)

 if(nstep > 1){ 
   for(i in 2:nstep){
    text <- paste("Job ",nam[i],"  ",condor.name,i-1,".condor",sep="")
    write(text,file=dag.out,append=TRUE)
   }

   for(i in 1:(nstep-1)){
    text <- paste("PARENT ",nam[i]," CHILD ",nam[i+1],sep="")
    write(text,file=dag.out,append=TRUE)
   }
 }
 cat("\n ", paste(getwd(),"/",dag.out,sep=""), " file written!\n")
}
