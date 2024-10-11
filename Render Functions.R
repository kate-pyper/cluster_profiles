# Functions

generate_cluster_profile <- function(name, df){
  board <- unique(df$nhs_board[df$geography_name == name])
  hscp_use <- unique(df$hscp[df$geography_name == name])
  
  for_clust <- df %>% 
    filter(geography_name == name | cluster == name |
             geography_name == board |
             geography_name == hscp_use |
             geography_type == "Scotland")
  
  rmarkdown::render(input = "Template.Rmd",
                    #output_format = "html_document",
                    output_file = paste0(name, ".html"),
                    output_dir = file.path("/conf","LIST_analytics", "West Hub",
                                           "02 - Scaled Up Work", 
                                           "GP cluster profiles", "R", "Outputs",
                                           board))
  
  
}
