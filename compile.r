library(dplyr)
library(readr)
library(stringr)

name_list <- list.files(pattern = "results_.*csv")
male_response <- "Participant gender:['m']"
female_response <- "Participant gender:['f']"
tl <- lapply(name_list, read_csv)

for (i in 1:length(tl)) {
	id <- str_remove(name_list[i],'results_')
	tl[[i]]$id <- str_remove(id, '.csv')
	if (male_response %in% tl[[i]][41,]) {
		tl[[i]] <- tl[[i]][1:40,]		
		tl[[i]]$gender <- 'm'
	} else if (female_response %in% tl[[i]][41,]) {
		tl[[i]] <- tl[[i]][1:40,]		
		tl[[i]]$gender <- 'f'				
	} else {
		tl[[i]] <- tl[[i]][1:40,]
		tl[[i]]$gender <- 'na'
	}
}

d <- bind_rows(tl)
write.csv(d, file = 'all_data.csv')
