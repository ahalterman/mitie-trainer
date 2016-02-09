library(dplyr)

#ap <- read.csv("/media/data/AP_sample.csv",stringsAsFactors = FALSE)
ap <- read.csv("/home/ahalterman/Projects/mitie-trainer/SLE_text.csv", stringsAsFactors = FALSE)
View(ap)

SAMPLES <- 25

#ap <- ap[sample(1:nrow(ap), 100),]

ap_text <- data.frame(ID = paste0("SLE_", as.character(1:SAMPLES)),
                      TEXT_BODY = ap[sample(1:nrow(ap), SAMPLES),],
                      stringsAsFactors = FALSE)
str(ap_text)

write.table(file = "/home/ahalterman/Projects/mitie-trainer/SLE.tsv", ap_text, sep = "\t", row.names = FALSE)

sw <- read.delim("/home/ahalterman/Projects/mitie-trainer/sample.tsv", sep = "\t")

# mongoexport --db event_scrape --collection arabic_scraped --csv --fields content --out /home/ahalterman/Projects/mitie-trainer/scraped_arabic.csv

ar <- read.csv("/home/ahalterman/Projects/mitie-trainer/scraped_arabic.csv",stringsAsFactors = FALSE)
ar_text <- data.frame(ID = paste0("Arabic_", as.character(1:50)),
                      TEXT_BODY = ar[1:50, "content"])
write.table(file = "/home/ahalterman/Projects/mitie-trainer/arabic.tsv", ar_text, sep = "\t", row.names = FALSE)
