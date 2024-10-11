# Generate Profiles

## Load packages & initial set up ----------------------------------------------
library(tidyverse)
library(data.table)
source("Read in data.R")

## Set variables ---------------------------------------------------------------

# Set report level - can take two values:
# "cluster" - produces a cluster level dashboard with practice level data for all practice in the cluster
# "practice" - produces same dashboard but with practice data for only one single practice
report_level <- "cluster"

# Set Health Board that you want to generate profiles for
# This can be a vector containing multiple health boards
HB <-  c("NHS Ayrshire and Arran",
         "NHS Borders",
         "NHS Dumfries and Galloway",
         "NHS Fife",
         "NHS Forth Valley",
         "NHS Grampian",
         "NHS Greater Glasgow and Clyde",
         "NHS Highland",
         "NHS Lanarkshire",
         "NHS Lothian",
         "NHS Orkney",
         "NHS Shetland",
         "NHS Tayside",
         "NHS Western Isles",
         "") # need the empty quotes to get Scotland

## Filter Data to relevant health boards ---------------------------------------

profiles <- profiles %>% 
  janitor::clean_names() %>% 
  filter(nhs_board %in% HB)

## Generate report -------------------------------------------------------------
if(report_level == "cluster"){
  #clusts <- unique(profiles$geography_name[profiles$geography_type == "GP Cluster"])
  clusts <- c("Irvine Valley", "Irvine, Kilwinning, Dundonald", "Troon Cluster")
  walk(clusts, ~generate_cluster_profile(.x, profiles))
}else if(report_level == "practice"){
  
}else{
  stop('report_level must be either "cluster" or "practice"')
}



