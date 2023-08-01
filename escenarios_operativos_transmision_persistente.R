

# Step 1. load the dengue cases hotspots ####
load("~/Library/CloudStorage/Dropbox/hotspots_2022/8.RData/cases_hotspots_agebs19.RData")
hotspots <- cases_hotspots_agebs19 |>
    sf::st_make_valid()

# Step 2. load the betas  ####
load("~/Library/CloudStorage/OneDrive-Personal/proyects/hotspots_eggs/8.RData/31_yucatan/betas/31_yucatan_zinb1_betas.RData")

# Step 3. load the functions ####
source("~/Library/CloudStorage/Dropbox/r_developments/r_new_functions/3.Functions/risk_agebs.R")
source("~/Library/CloudStorage/Dropbox/r_developments/r_new_functions/3.Functions/risk_map.R")


# Step 4. plot the map ####
risk_agebs(spde_model = betas_31_yucatan,
           hotspots = cases_hotspots_agebs19,
           locality = "Mérida",
           cve_ent = "31",
           intensity_perc = 25) |>
    risk_map(staticmap = TRUE) +
    ggplot2::ggtitle("Merida")



