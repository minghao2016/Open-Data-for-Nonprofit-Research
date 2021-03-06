buildIndex <- function( )
{


	library( jsonlite )
	library( R.utils )


	### CREATE A DIRECTORY FOR YOUR DATA

	#  dir.create( "IRS Nonprofit Data" )

	# setwd( "./IRS Nonprofit Data" )


	### DOWNLOAD FILES AND UNZIP
        #
	# electronic.filers <- "https://s3.amazonaws.com/irs-form-990/index.json.gz"
        #
	# download.file( url=electronic.filers, "electronic.json.gz" )
        #
	# gunzip("electronic.json.gz", remove=TRUE )  
        #
        #
	# CREATE A DATA FRAME OF ELECTRONIC FILERS FROM IRS JSON FILES
        #
	# data.ef <- fromJSON( txt="electronic.json" )[[1]]

	# nrow( data.ef )


	dat1 <- fromJSON("https://s3.amazonaws.com/irs-form-990/index_2011.json")[[1]]
	dat2 <- fromJSON("https://s3.amazonaws.com/irs-form-990/index_2012.json")[[1]]
	dat3 <- fromJSON("https://s3.amazonaws.com/irs-form-990/index_2013.json")[[1]]
	dat4 <- fromJSON("https://s3.amazonaws.com/irs-form-990/index_2014.json")[[1]]
	dat5 <- fromJSON("https://s3.amazonaws.com/irs-form-990/index_2015.json")[[1]]
	dat6 <- fromJSON("https://s3.amazonaws.com/irs-form-990/index_2016.json")[[1]]
	
	data.ef <- rbind( dat1, dat2, dat3, dat4, dat5, dat6 )

	# REFORMAT DATE FROM YYYY-MM TO YYYY

	data.ef$FilingYear <- substr( data.ef$TaxPeriod, 1, 4 )




	# DROP UNRELIABLE YEARS

	# table( data.ef$FilingYear ) # note that some records are nonsensical

	# data.ef <- data.ef[ data.ef$FilingYear > 2009 & data.ef$FilingYear < 2016 , ]

	# table( data.ef$FilingYear, useNA="ifany" )

	# nrow( data.ef )




	# EXCLUDE DATA THAT IS NOT AVAILABLE IN ELECTRONIC FORMAT

	# table( data.ef$IsElectronic, data.ef$IsAvailable )

	# data.ef <- data.ef[ data.ef$IsAvailable == TRUE , ]

	# nrow( data.ef )
	
	
	return( data.ef )



}



