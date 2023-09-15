

loc <- rgeomex::extract_locality(cve_edo = "21",
                                 locality = "Xicotepec de Juarez")



# extract the localities ####
manz <- rgeomex::blocks_ine20_mx_d |>
    dplyr::filter(entidad == 21)
table(manz$entidad)

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


dplyr::bind_rows(acatlan |> dplyr::select(NOMGEO, ha, manzanas),
                 chietla |> dplyr::select(NOMGEO, ha, manzanas),
                 izucar |> dplyr::select(NOMGEO, ha, manzanas),
                 jalpan |> dplyr::select(NOMGEO, ha, manzanas),
                 puebla |> dplyr::select(NOMGEO, ha, manzanas),
                 tehuacan |> dplyr::select(NOMGEO, ha, manzanas),
                 tepexco |> dplyr::select(NOMGEO, ha, manzanas),
                 tepexi |> dplyr::select(NOMGEO, ha, manzanas),
                 v_carranza |> dplyr::select(NOMGEO, ha, manzanas),
                 xicotepec |> dplyr::select(NOMGEO, ha, manzanas)) |>
    sf::st_drop_geometry() |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::mutate(Ciclos = 4) |>
    dplyr::mutate("Fecha Inicio" = "20023-09-11") |>
    dplyr::mutate("Fecha Termino" = "20023-10-13") |>
    dplyr::rename(Manzanas = manzanas,
                  Hectareas = ha,
                  Localidad = NOMGEO) |>
    dplyr::mutate(Hectareas = round(Hectareas, 0)) |>
    reactable::reactable(theme = reactablefmtr::flatly(),
                         filterable = TRUE)
