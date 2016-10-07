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

# Problem 7
get_size_class <- function(ear_length){
  # Calculate the size class for one or more earth lengths
  ear_lengths <- ifelse(ear_length > 10, "large", "small")
  return(ear_lengths)
}


elf_table <- data.frame(ID=elf_dna$id,Ear_Class=elf_dna$earlength,
              GC_Content=gc_content(str_to_lower(elf_dna$dnaseq)))

write.csv(elf_table, file = "elf_table.csv")