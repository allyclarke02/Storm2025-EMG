# Storm2025-EMG

Code provided to process EMG data from Storm visit 07/01.

StormEMG.qmd: main code to process EMG data
- reads in MVC file and extracts MVCs
- can read in any specific trial and filter + normalize to MVC
- simple plotting code also included

Helper functions:
- read_emg_txt.R: reads txt file output by Unity into R dataframe
- filter_emg.R: filters dataframe of EMG signals

  
