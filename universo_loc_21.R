
# extract the localities ####
manz <- rgeomex::blocks_ine20_mx_d |>
    dplyr::filter(entidad == 21)


# extract the boundary localities #"####
puebla <- rgeomex::extract_locality(cve_edo = "21",
                                    locality = c("Heroida Puebla de Zaragoza")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))
izucar <- rgeomex::extract_locality(cve_edo = "21",
                                     locality = c("Izucar de Matamoros")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

tehuacan <- rgeomex::extract_locality(cve_edo = "21",
                                     locality = c("Tehuacan")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

acatlan <- rgeomex::extract_locality(cve_edo = "21",
                                        locality = c("Acatlan de Osorio")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))
chietla <- rgeomex::extract_locality(cve_edo = "21",
                                   locality = c("Chietla")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

v_carranza <- rgeomex::extract_locality(cve_edo = "21",
                                     locality = c("Venustiano Carranza")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

tepexi <- rgeomex::extract_locality(cve_edo = "21",
                                     locality = c("Tepexi de Rodriguez")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

tepexco <- rgeomex::extract_locality(cve_edo = "21",
                                    locality = c("Tepexco")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

jalpan <- rgeomex::extract_locality(cve_edo = "21",
                                    locality = c("Jalpan")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

xicotepec <- rgeomex::extract_locality(cve_edo = "21",
                                    locality = c("Xicotepec")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

#
manz_acatlan <- manz[acatlan, ]
manz_chietla <- manz[chietla, ]
manz_izucar <- manz[izucar, ]
manz_jalpan <- manz[jalpan, ]
manz_puebla <- manz[puebla, ]
manz_tehuacan <- manz[tehuacan, ]
manz_tepexco <- manz[tepexco, ]
manz_tepexi <- manz[tepexi, ]
manz_carranza <- manz[v_carranza, ]
manz_xicotepec <- manz[xicotepec, ]

#
acatlan <- acatlan |>
    dplyr::mutate(Manzanas = nrow(manz_acatlan)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

chietla <- chietla |>
    dplyr::mutate(Manzanas = nrow(manz_chietla)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

izucar <- chietla |>
    dplyr::mutate(Manzanas = nrow(manz_chietla)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

jalpan <- jalpan |>
    dplyr::mutate(Manzanas = nrow(manz_jalpan)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

puebla <- puebla |>
    dplyr::mutate(Manzanas = nrow(manz_puebla)) |>
    dplyr::mutate(Actividad = "Focalizado") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

tehuacan <- tehuacan |>
    dplyr::mutate(Manzanas = nrow(manz_tehuacan)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

tepexco <- tepexco |>
    dplyr::mutate(Manzanas = nrow(manz_tepexco)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

tepexi <- tepexi |>
    dplyr::mutate(Manzanas = nrow(manz_tepexi)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

v_carranza <- v_carranza |>
    dplyr::mutate(Manzanas = nrow(manz_carranza)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)

xicotepec <- xicotepec |>
    dplyr::mutate(Manzanas = nrow(manz_xicotepec)) |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::select(NOMGEO, ha, Manzanas, Actividad)


acatlan$manzanas <- nrow(manz_acatlan)
chietla$manzanas <- nrow(manz_chietla)
izucar$manzanas <- nrow(manz_izucar)
jalpan$manzanas <- nrow(manz_jalpan)
puebla$manzanas <- nrow(manz_puebla)
tehuacan$manzanas <- nrow(manz_tehuacan)
tepexco$manzanas <- nrow(manz_tepexco)
tepexi$manzanas <- nrow(manz_tepexi)
v_carranza$manzanas <- nrow(manz_carranza)
xicotepec$manzanas <- nrow(manz_xicotepec)


dplyr::bind_rows(acatlan,
                 chietla,
                 izucar,
                 jalpan,
                 puebla,
                 tehuacan,
                 tepexco,
                 tepexi,
                 v_carranza,
                 xicotepec) |>
    sf::st_drop_geometry() |>
    #dplyr::mutate(Actividad = "Barrido") |>
    dplyr::mutate(Ciclos = 4) |>
    dplyr::mutate("Fecha Inicio" = "NA") |>
    dplyr::mutate("Fecha Termino" = "NA") |>
    dplyr::rename(Hectareas = ha,
                  Localidad = NOMGEO) |>
    dplyr::mutate(Hectareas = round(Hectareas, 0)) |>
    reactable::reactable(theme = reactablefmtr::flatly(),
                         filterable = TRUE)


loc <- dplyr::bind_rows(acatlan,
                        chietla,
                        izucar,
                        jalpan,
                        puebla,
                        tehuacan,
                        tepexco,
                        tepexi,
                        v_carranza,
                        xicotepec) |>
    sf::st_drop_geometry() |>
    #dplyr::mutate(Actividad = "Barrido") |>
    dplyr::mutate(Ciclos = 4) |>
    dplyr::mutate("Fecha Inicio" = "NA") |>
    dplyr::mutate("Fecha Termino" = "NA") |>
    dplyr::rename(Hectareas = ha,
                  Localidad = NOMGEO) |>
    dplyr::mutate(Hectareas = round(Hectareas, 0))


loc |>
    dplyr::mutate("Garrafas 1 Ciclo" = round((Hectareas * 260)/20000,
                                   digits = 0)) |>
    dplyr::mutate("Garrafas 4 Ciclos" = round((Hectareas * 260)/20000,
                                             digits = 0)*4) |>
    
    reactable::reactable(theme = reactablefmtr::flatly(),
                         filterable = TRUE)


loc |>
    dplyr::select(Localidad, Hectareas, Manzanas,
                  Actividad, Ciclos) |>
    dplyr::mutate("Garrafas 1 Ciclo" = round((Hectareas * 260)/20000,
                                             digits = 0)) |>
    dplyr::mutate("Garrafas 4 Ciclos" = round((Hectareas * 260)/20000,
                                              digits = 0)*4) |>
    
    reactable::reactable(theme = reactablefmtr::flatly(),
                         filterable = TRUE)


loc |>
    dplyr::select(Localidad, Hectareas, Manzanas,
                  Actividad, Ciclos) |>
    dplyr::mutate("Vehiculo&Maquina" = round((Hectareas/60)/5, 0)) |>
    reactable::reactable(theme = reactablefmtr::flatly(),
                         filterable = TRUE)
