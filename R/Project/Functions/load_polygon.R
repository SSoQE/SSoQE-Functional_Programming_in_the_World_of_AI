load_polygon <- function(sel_polygon_path) {
    readLines(sel_polygon_path) %>%
    paste(., collapse = "") %>%
    geojsonsf::geojson_sf() %>%
    return()
}
