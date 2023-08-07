
if(as.vector(Sys.info()["sysname"]) == "Darwin"){
    load("~/Library/CloudStorage/OneDrive-Personal/proyects/geocoding_mex/2023/9.geocoded_dataset/dengue_mx_2023.RData")
    load("~/Library/CloudStorage/OneDrive-Personal/proyects/talks/reunion_inter_estatal/8.RData/eggs_hotspots_2023_16_michoacan.RData")
    source("~/Library/CloudStorage/Dropbox/r_developments/r_talks/2023/reunion_interstatal_2023/reunion_quintana_roo/functions/risk_transmission_activa.R")
    
} else if(as.vector(Sys.info()["sysname"]) == "Windows"){
    load("D:/OneDrive/proyects/geocoding_mex/2023/9.geocoded_dataset/dengue_mx_2023.RData")
    
} else if(as.vector(Sys.info()["sysname"]) == "Linux"){
    
}

risk_transmision_activa(betas = morelia$betas,
                        geocoded_data =  z,
                        cve_edo = "16",
                        locality = "morelia") +
    ggplot2::ggtitle("   Transmisión Activa en Morelia")



