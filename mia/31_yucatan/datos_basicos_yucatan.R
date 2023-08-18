

# step 1. load the data
if(as.vector(Sys.info()["sysname"]) == "Darwin"){
    load("~/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2023/9.geocoded_dataset/dengue_mx_2023.RData")
    load("~/Library/CloudStorage/OneDrive-Personal/proyects/talks/reunion_inter_estatal/8.RData/eggs_hotspots_2023.RData")
    source("~/Library/CloudStorage/Dropbox/r_developments/r_talks/2023/reunion_interstatal_2023/reunion_quintana_roo/functions/risk_transmission_activa.R")
    source("~/Library/CloudStorage/OneDrive-Personal/proyects/talks/reunion_inter_estatal/3.Functions/active_transmission_dat.R")
} else if(as.vector(Sys.info()["sysname"]) == "Windows"){
    load("D:/OneDrive/proyects/geocoding_mex/2023/9.geocoded_dataset/dengue_mx_2023.RData")
    
} else if(as.vector(Sys.info()["sysname"]) == "Linux"){
    
}

dplyr::bind_rows(active_transmission_dat(betas = merida$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Merida") |>
                     dplyr::filter(municipio == 50) |>
                     dplyr::mutate(localidad = "Mérida") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots),
                 active_transmission_dat(betas = valladolid$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Valladolid") |>
                     dplyr::mutate(localidad = "Valladolid") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots),
                 active_transmission_dat(betas = ticul$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Ticul") |>
                     dplyr::mutate(localidad = "Ticul") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots),
                 active_transmission_dat(betas = tizimin$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Tizimín") |>
                     dplyr::mutate(localidad = "Tizimín") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots),
                 active_transmission_dat(betas = tekax$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Tekax de Alvaro Obregon") |>
                     dplyr::mutate(localidad = "Tekax") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots),
                 active_transmission_dat(betas = peto$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Peto") |>
                     dplyr::mutate(localidad = "Peto") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots),
                 active_transmission_dat(betas = oxkutzcab$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Oxkutzcab") |>
                     dplyr::mutate(localidad = "Oxkutzcab") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots),
                 active_transmission_dat(betas = kanasin$betas,
                                         geocoded_data = z,
                                         cve_edo = "31",
                                         locality = "Kanasín") |>
                     dplyr::mutate(localidad = "Kanasín") |>
                     dplyr::select(localidad, municipio, sectores, 
                                   blocks, chains, hotspots)) |>
    dplyr::filter(hotspots != 0) |>
    reactable::reactable(style = list(fontSize = '16px'),
                         bordered = TRUE, 
                         striped = TRUE, 
                         highlight = TRUE)

