# This will analysis house elves
library("stringr")
elf_dna <- read.csv("./data/houseelf_earlength_dna_data_1.csv")

gc_content <- function(dna) { 
  Gs <- str_count(dna, "g")
  Cs <- str_count(dna, "c")
  gc <- round((Gs + Cs) / str_length(dna) * 100, digits = 2)
  return(gc)
  }
print(gc_content(str_to_lower(elf_dna$dnaseq))) 