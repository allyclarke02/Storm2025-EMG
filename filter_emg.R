filter_emg <- function(emgraw, fs, fhigh=40, flow=10) {
  library(gsignal, quietly = TRUE)
  

  # if emgraw is NULL, return lists with NULLs
  if (is.null(emgraw)) {
    return(list("raw" = NULL, "filt" = NULL))
  }
  
  
  # band pass filter
  bpf <- butter(n = 4,
                w = c(10, 400) / (fs/2),
                type = "pass")
  
  # high pass filter
  f1 <- butter(n = 4,
               w = fhigh / (fs / 2),
               type = "high")
  
  # low pass filter
  f2 <- butter(n = 4,
               w = flow / (fs / 2),
               type = "low")
  
  # Bandpass filter, high pass filter, rectify, low pass filter
  filt <- emgraw %>%
    map_df(\(x) filtfilt(bpf, x))  %>%
    map_df(\(x) filtfilt(f1, x))  %>%
    map_df(\(x) abs(x)) %>%
    map_df(\(y) filtfilt(f2, y))


  
  return(filt)
}