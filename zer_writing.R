#19BDS0117
#PRANJAL KESARWANI

library(jsonlite)
json <- fromJSON('https://data.covid19india.org/v4/min/timeseries.min.json')
df <- data.frame()

i = 1
for (value in json$TT$dates){
  #exists(value$delta$confirmed)
  # var <- value$delta$confirmed
  # print(var)
  new_row <- c('INDIA', 
               names(json$TT$dates)[i], 
               if(is.null(value$delta$confirmed))"0" else value$delta$confirmed, 
               if(is.null(value$delta$deceased))"0" else value$delta$deceased,
               if(is.null(value$delta$other))"0" else value$delta$other,
               if(is.null(value$delta$recovered))"0" else value$delta$recovered,
               if(is.null(value$delta$tested))"0" else value$delta$tested,
               if(is.null(value$delta$vaccinated1))"0" else value$delta$vaccinated1,
               if(is.null(value$delta$vaccinated2))"0" else value$delta$vaccinated2,
               if(is.null(value$delta7$confirmed))"0" else value$delta7$confirmed,
               if(is.null(value$delta7$deceased))"0" else value$delta7$deceased,
               if(is.null(value$delta7$other))"0" else value$delta7$other,
               if(is.null(value$delta7$recovered))"0" else value$delta7$recovered,
               if(is.null(value$delta7$tested))"0" else value$delta7$tested,
               if(is.null(value$delta7$vaccinated1))"0" else value$delta7$vaccinated1,
               if(is.null(value$delta7$vaccinated2))"0" else value$delta7$vaccinated2,
               if(is.null(value$total$confirmed))"0" else value$total$confirmed,
               if(is.null(value$total$deceased))"0" else value$total$deceased,
               if(is.null(value$total$other))"0" else value$total$other,
               if(is.null(value$total$recovered))"0" else value$total$recovered,
               if(is.null(value$total$tested))"0" else value$total$tested,
               if(is.null(value$total$vaccinated1))"0" else value$total$vaccinated1,
               if(is.null(value$total$vaccinated2))"0" else value$total$vaccinated2)
  df <- rbind(df, new_row)
  i <- i + 1
}

names(df) <- c("Area", "Date", "Daily-Confirmed","Daily-Deceased","Daily-Other","Daily-Recovered","Daily-Tested","Daily-Vaccinated1","Daily-Vaccinated2",
               "7DMA-Confirmed","7DMA-Deceased","7DMA-Other","7DMA-Recovered","7DMA-Tested","7DMA-Vaccinated1","7DMA-Vaccinated2",
               "Total-Confirmed","Total-Deceased","Total-Others","Total-Recovered","Total-Tested","Total-Vaccinated1","Total-Vaccinated2")

write.table(df,file="Covid19_India_datewise.csv",sep=",",row.names = FALSE,append=TRUE)