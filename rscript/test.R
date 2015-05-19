library('getopt');
opt = getopt(matrix(c(
    'input', 'i',1,"character",
    'output','o',1,"character",
    'parameter','p',1,"integer",
    'help','h',0,"logical"
),ncol=4,byrow=TRUE));

if(!is.null(opt$help)) {
    self = commandArgs()[1];
    cat(paste("Usage: ",self, "[-[-input|i] <input file>] [-[-output|o] <output file>] [-[-parameter|p] <parameter>]\n",sep=""));

}
cat(opt$input);
cat("\n");

cat(opt$output);
cat("\n");

cat(opt$parameter);
cat("\n");

inputfile <- opt$input
A <- read.table(inputfile, sep=",", col.names=c("year,","my1","my2"));

nrow(A);
summary(A$year);

