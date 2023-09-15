


loc <- rgeomex::extract_locality(cve_edo = "21",
                                 locality = "Xicotepec de Juarez")



# extract the localities ####
manz <- rgeomex::blocks_ine20_mx_e

# extract the boundary localities #"####

loc <- rgeomex::extract_locality(cve_edo = "31",
                                 locality = c("Merida", "Kanasin",
                                              "Tizimin","Valladolid",
                                              "Ticul")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))
merida <- rgeomex::extract_locality(cve_edo = "31",
                                    locality = c("Merida")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))
kanasin <- rgeomex::extract_locality(cve_edo = "31",
                                     locality = c("Kanasin")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

tizimin <- rgeomex::extract_locality(cve_edo = "31",
                                     locality = c("Tizimin")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))

valladolid <- rgeomex::extract_locality(cve_edo = "31",
                                        locality = c("Valladolid")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))
ticul <- rgeomex::extract_locality(cve_edo = "31",
                                   locality = c("Ticul")) |>
    dplyr::mutate(area_km = sf::st_area(geometry)) |>
    dplyr::mutate(ha = units::set_units(area_km, value = ha))
#
manz_merida <- manz[merida, ]
manz_kanasin <- manz[kanasin, ]
manz_tizimin <- manz[tizimin, ]
manz_valladolid <- manz[valladolid, ]
manz_ticul <- manz[ticul, ]

#
merida$manzanas <- nrow(manz_merida)
kanasin$manzanas <- nrow(manz_kanasin)
tizimin$manzanas <- nrow(manz_tizimin)
valladolid$manzanas <- nrow(manz_valladolid)
ticul$manzanas <- nrow(manz_ticul)

dplyr::bind_rows(merida |> dplyr::select(NOMGEO, ha, manzanas),
                 kanasin |> dplyr::select(NOMGEO, ha, manzanas),
                 tizimin |> dplyr::select(NOMGEO, ha, manzanas),
                 valladolid |> dplyr::select(NOMGEO, ha, manzanas),
                 ticul |> dplyr::select(NOMGEO, ha, manzanas)) |>
    sf::st_drop_geometry() |>
    dplyr::mutate(Actividad = "Barrido") |>
    dplyr::mutate(Ciclos = 4) |>
    dplyr::mutate("Fecha Inicio" = "20023-09-11") |>
    dplyr::mutate("Fecha Termino" = "20023-10-13") |>
    dplyr::rename(Manzanas = manzanas,
                  Hectareas = ha,
                  Localidad = NOMGEO) |>
    dplyr::mutate(Hectareas = round(Hectareas, 0)) |>
    reactable::reactable()