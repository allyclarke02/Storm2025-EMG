read_emg_txt <- function(filepath, emg_labels) {

  trial <- read.table(filepath, header = TRUE, sep = "\t")  
  
  trial <- trial %>%
    filter(rowSums(dplyr::select(., where(is.numeric))) != 0) %>%
    select(where(~ is.numeric(.) && sum(.) != 0))
  
  
  # remove rows and cols that don't have data (sum to 0)
  trial <- trial %>% 
    filter(rowSums(.) != 0)  %>% select(where(~ sum(.) != 0)) 
  
  # rename columns with emg_labels
  trial <- trial %>% 
    setNames(emg_labels) 
  
  return(trial)
}