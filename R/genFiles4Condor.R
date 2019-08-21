genFiles4Condor <- function(condor.file=system.file("bugs/condor/template.condor",package="rbugs"),
		      r.file=system.file("bugs/condor/condor_template.R",package="rbugs"),
                      n.jobs = 1,
                      dag = FALSE,
                      files.to.pass = NULL,
 		      rbugs.args = list(n.chain = 1, n.iter = 1000, n.burnin = 0, n.thin = 1),
                      condor.out = "rio.condor",
		      r.out = "rio_condor_"){

 nam <- c("n.chain", "n.iter", "n.burnin", "n.thin")
 if(sum(1-names(rbugs.args) %in% nam) != 0) stop("One of the names provided is not a rbgus argument. The options are: n.chain, n.iter, n.burnin,  n.thin!")

 pos <- NULL
 pos <- which(nam %in% names(rbugs.args) == FALSE)
 list.aux <- list(n.chain = 1, n.iter = 1000, n.burnin = 0, n.thin = 1)

 if(length(pos) > 0){ 
    for(i in pos){
 	 rbugs.args[[length(rbugs.args)+1]] <- list.aux[[i]]
         names(rbugs.args)[length(rbugs.args)] <- names(list.aux)[i]
    }
 }

                      
 condor.code <- readLines(condor.file)
 r.code <- readLines(r.file)

 n.chain <- rbugs.args$n.chain
 n.iter <- rbugs.args$n.iter
 n.burnin <- rbugs.args$n.burnin
 n.thin <- rbugs.args$n.thin
 
 if(length(files.to.pass) > 0){
     transf <- paste("transfer_input_files = ",files.to.pass[1],sep="")
     if(length(files.to.pass) > 1) for(i in 2:length(files.to.pass)) transf <- paste(transf,", ",files.to.pass[i],sep="")
 }
 else transf = ""

 if(!dag){
   code <- gsub("_njobs_",n.jobs,condor.code)
   code <- gsub("_to_pass_",transf,code)
   write(code,file=condor.out)
   cat("\n File ", paste(getwd(),"/",condor.out,sep=""), "written.\n")

   for(i in 0:(n.jobs-1)){
     code <- gsub("_njobs_",i,r.code)
     code <- gsub("_nchains_",n.chain,code)
     code <- gsub("_niter_",n.iter,code)
     code <- gsub("_nburnin_",n.burnin,code)
     code <- gsub("_nthin_",n.thin,code)
     write(code,file=paste(r.out,i,".R",sep=""))
     cat("File ", paste(getwd(),"/",r.out,i,".R",sep=""), "written.\n")
   }
 }
 else{
   code <- gsub("_njobs_",1,condor.code)
   code <- gsub("_to_pass_",transf,code)
   code <- gsub("[][$()]","",code)
   code <- gsub("Process",n.jobs,code)
   write(code,file=paste(condor.out,n.jobs,".condor",sep=""))
   cat("\n File ", paste(getwd(),"/",condor.out,n.jobs,".condor",sep=""), "written.\n")

   code <- gsub("_njobs_",n.jobs,r.code)
   code <- gsub("_nchains_",n.chain,code)
   code <- gsub("_niter_",n.iter,code)
   code <- gsub("_nburnin_",n.burnin,code)
   code <- gsub("_nthin_",n.thin,code)
   write(code,file=paste(r.out,n.jobs,".R",sep=""))
   cat("File ", paste(getwd(),"/",r.out,n.jobs,".R",sep=""), "written.\n")
 }
}
