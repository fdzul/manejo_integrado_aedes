

load("~/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2023/9.geocoded_dataset/dengue_mx_2023.RData")
# 2. aplicar la prueba de knox
z <- z |>
    as.data.frame() |>
    sf::st_as_sf(coords = c("long", "lat"),
                 crs = 4326) |>
    dplyr::mutate(onset = lubridate::ymd(FEC_INI_SIGNOS_SINT))

loc <- rgeomex::extract_locality(cve_edo = "16",
                                 locality = "Uruapan")
library(magrittr)
z <- z[loc,]

denhotspots::knox(x = z[loc,], 
                  crs = "+proj=eqc", 
                  ds = 400, 
                  dt = 20, 
                  sym = 1000, 
                  sp_link = FALSE,
                  planar_coord = FALSE) |>
    denhotspots::space_time_link_map(locality = "Uruapan",
                                     cve_edo = "16",
                                     maptype = "staticmap",
                                     facetmap = FALSE)


#
load("~/Library/CloudStorage/Dropbox/hotspots_2022/8.RData/cases_hotspots_agebs19.RData")

a <- cases_hotspots_agebs19 |>
    dplyr::filter(CVE_ENT == 16)
table(a$loc)
