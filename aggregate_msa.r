## Make sure you don't get hosed by factors
options(stringsAsFactors = FALSE)

## Load reference files
msa <- read.csv(file="MSAtoCounty.csv")
tvm <- read.csv(file="tvm_msas.csv"

tvm_profiles <- data.frame()
## Cycle through markets, subset "cty", take means, and add to output table (tvm_profiles)

for (i in 1:nrow(tvm)) {
	market_counties <- msa$FIPS[tvm$Data.Source[i] == msa$MSA.Name]
	market_subset <- cty[cty$GEOID %in% market_counties,]
	values <- round(as.numeric(colMeans(market_subset[,4:368])), digits = 2)
	newrow <- as.vector(unlist(c(tvm[i,1:2],values)))
	tvm_profiles <- rbind(tvm_profiles, newrow)
}

## make data rows numeric
for (i in 3:ncol(tvm_profiles)) {
	tvm_profiles[,i] <- as.numeric(tvm_profiles[,i])
}

##fix column names
colnames(tvm_profiles) <- c("Market", "MSA", colnames(cty)[4:368])