# Initiation file

## Package upload
if (TRUE) {rm(list = ls() )}
if (TRUE) {
  suppressWarnings(suppressMessages({
    ### PASSWORD
    library(rstudioapi)
    ### DATA: obtain, wrangle and explore
    library(RJDBC)
    library(openxlsx)
    library(tidyverse)
    library(lubridate)
    library(stringi)
    library(janitor)
    ### TABLES: create and modify
    library(gtsummary)
    library(flextable)
    library(kableExtra)
    library(sjPlot)
    ### PLOTS
    library(ggpubr)
    library(cowplot)
    library(ggdist)
    ### STATS
    library(glmmTMB)
    library(rms)
    library(rmsb)
    library(brms)
    library(emmeans)
    library(car)
    library(arm)
    library(pROC)
  }))
}


## Functions

### set functions clashes
select <- dplyr::select
rename <- dplyr::rename
mutate <- dplyr::mutate
recode <- dplyr::recode
summarise <- dplyr::summarise
count <- dplyr::count

setwd('/home/ticf/secured_data/GitRepo/ticf/777_PAOR_metaanalysis')

### loading custom functions
invisible(
  lapply(
    list.files(
      'r/functions', pattern = "\\.R$", full.names = TRUE), 
    source)
)


## Create folders
folders <- c("data", 
             "gitignore",
             "gitignore/run",
             "gitignore/figures",
             "gitignore/data",
             "gitignore/html_reports")

invisible(
  lapply(
    folders, function(x) if (!dir.exists(x)) 
      dir.create(x, recursive = TRUE)
  )
)


## Set seed
seeding <- 2026
set.seed(seeding)

## Create data
if(!file.exists('data/data_prevalence.Rds')){
  data_prevalence <-  readxl::read_excel(
    'gitignore/data/data_sheet.xlsx', 
    sheet = 2
    ) %>% 
    dplyr::rename(
      'n_patients' = `Number of patients`,
      'n_EHC_patients' = `Patients /w EHC`,
      'n_EHC' = `Number of EHC`
    ) %>% 
    mutate(n_EHC = as.numeric(n_EHC))
    
  saveRDS(data_prevalence, 'data/data_prevalence.Rds')
}

data_prevalence <- readRDS('data/data_prevalence.Rds')

data_prevalence <- data_prevalence %>% 
  dplyr::mutate(Autor = paste0(Autor, ' (', Year, ')')) %>% 
  dplyr::arrange(Year)


if(!file.exists('data/data_mult.Rds')){
  data_mult <-  readxl::read_excel(
    'gitignore/data/data_sheet.xlsx', 
    sheet = 3
  ) %>% 
    dplyr::rename(
      'Year' = `Yeas`,
      'n_EHC' = `Number of EHC`
    ) %>% 
    mutate(n_EHC = as.numeric(n_EHC))
  
  saveRDS(data_mult, 'data/data_mult.Rds')
}

data_mult <- readRDS('data/data_mult.Rds')

data_mult <- data_mult %>% 
  dplyr::mutate(Autor = paste0(Autor, ' (', Year, ')')) %>% 
  dplyr::arrange(Year)

data_mult_raw <- data_mult %>% 
  dplyr::select(
    Autor:n_EHC, 
    `Inferior phrenic artery`,
    `Coeliac trunk and branches`,
    `SMA and branches`, 
    `Renal / adrenal arteries`,
    IMA, 
    `Abdominal wall artery`
  ) %>% 
  dplyr::mutate(
    n_EHC2 = rowSums(dplyr::select(., -Autor, -Year, -n_EHC))
  ) %>% 
  dplyr::select(Autor:n_EHC, n_EHC2, everything()) %>% 
  dplyr::rename(
    'Inferior_phrenic_artery' = `Inferior phrenic artery`,
    'Coeliac_trunk_branches' = `Coeliac trunk and branches`,
    'SMA_branches' = `SMA and branches`,
    'Renal_adrenal_arteries' = `Renal / adrenal arteries`,
    'Abdominal_wall_artery' = `Abdominal wall artery`
  ) %>% data.frame()



data_mult_spec <- data_mult %>% 
  dplyr::select(
    Autor:n_EHC, 
    `Inferior phrenic artery`,
    `Coeliac trunk`: `Omental arteries`,
    `SMA / branch of SMA`:`right / middle colic artery`, 
    `Right renal / capsular`:`Adrenal arteries`,
    IMA, 
    `Intercostal arteries + subcostal`:`Lumbar`
  ) %>% 
  dplyr::mutate(
    n_EHC2 = rowSums(dplyr::select(., -Autor, -Year, -n_EHC))
  ) %>% 
  dplyr::select(Autor:n_EHC, n_EHC2, everything()) %>% 
  dplyr::rename(
    'Inferior_phrenic_artery' = `Inferior phrenic artery`,
    
    'Coeliac_trunk' = `Coeliac trunk`,
    'Left_gastric_artery' = `Left gastric artery`,
    'Gastric_artery' = `gastric artery`,
    'Periportal_collateral_vessels' = `periportal collateral vessels`,
    'Splenic_artery' = `Splenic artery`,
    'Left_gastroepiploic' = `Left gastroepiploic`,
    'Right_gastric' = `Right gastric`,
    'Right_gastroepiploic' = `Right gastroepiploic`,
    'Bile_duct_artery' = `bile duct artery`,
    'Pancreatoduodenal_artery' = `Pancreatoduodenal artery`,
    'Dorsal_pancreatic' = `Dorsal pancreatic`,
    'Omental_arteries' = `Omental arteries`,
    'SMA_or_branch_SMA' = `SMA / branch of SMA`,
    'Right_or_middle_colic_artery' = `right / middle colic artery`,
    'Right_renal_or_capsular' = `Right renal / capsular`,
    'Adrenal_arteries' = `Adrenal arteries`,
    'Intercostal_arteries_plus_subcostal' = `Intercostal arteries + subcostal`
  ) %>% data.frame()



data_mult_spec












