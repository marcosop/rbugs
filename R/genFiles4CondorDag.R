genFiles4CondorDag <- function(nstep = 1, files.to.pass = NULL,
                              pattern = "_nstep_", n.jobs = nstep, ...) {
    file.aux <- files.to.pass
    for (i in seq_len(nstep)) {
        ##Check wheter are files that depend on the step
        if (length(grep(pattern,files.to.pass)) > 0){
            file.aux <- gsub("_nstep_", i - 1, files.to.pass)
        }
        genFiles4Condor(n.jobs = i - 1, files.to.pass = file.aux, ...)
    }
}
