#' @title Mesoamerican tree species richness
#'
#' @description
#' `sf` data frame with `POLYGON` geometry representing 3,373 hexagonal grid cells across the Americas, with 1 response variable encoding tree species richness and 50 numeric environmental predictors.
#'
#' Tree species in this dataset does NOT represent total tree species counts! The dataset focuses on the tree species found in Mesoamerica according to the Tree Biodiversity Network (BIOTREE-NET;
#' Cayuela et al. 2012). These tree species were later used as input for a search query at the Global Biodiversity Information Facility (GBIF). The resulting presence data and environmental data at 1km resolution were aggregated as a hexagonal grid.
#'
#' The hexagonal grid was constructed using `sf::st_make_grid(..., cellsize = 1, square = FALSE)` at 1-degree resolution (WGS84, EPSG:4326), covering longitudes -125.3° to -34.3° and latitudes -34.4° to 49.9°.
#'
#' @usage data(trees)
#' @format An sf data frame with 3373 rows (hexagonal cells) and 53 columns:
#'
#' **Identifier (1):**
#' \itemize{
#'   \item `cellid`: Integer row number identifying each hexagonal cell.
#' }
#'
#' **Response variable (1):**
#' \itemize{
#'   \item `trees`: Integer count of tree species richness per hexagonal cell.
#' }
#'
#' **Predictor variables:**
#' \itemize{
#'   \item `air_humidity_max`: Maximum monthly near-surface relative humidity (%).
#'   \item `air_humidity`: Mean annual near-surface relative humidity (%).
#'   \item `air_humidity_min`: Minimum monthly near-surface relative humidity (%).
#'   \item `air_humidity_range`: Annual near-surface relative humidity range (%).
#'   \item `aridity`: Mean aridity index (unitless ratio; higher values indicate wetter conditions).
#'   \item `cloud_cover_max`: Maximum monthly total cloud cover (%).
#'   \item `cloud_cover`: Mean annual total cloud cover (%).
#'   \item `cloud_cover_min`: Minimum monthly total cloud cover (%).
#'   \item `cloud_cover_range`: Annual total cloud cover range (%).
#'   \item `evapotranspiration_max`: Maximum monthly potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration`: Mean annual potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_min`: Minimum monthly potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_range`: Annual potential evapotranspiration range (kg m-2 month-1; Penman-Monteith).
#'   \item `rainfall_seasonality`: Precipitation seasonality as coefficient of variation of monthly totals (CHELSA bio15).
#'   \item `rainfall`: Total annual precipitation (kg m-2; CHELSA bio12).
#'   \item `rainfall_coldest_quarter`: Precipitation of coldest quarter (kg m-2; CHELSA bio19).
#'   \item `rainfall_driest_month`: Precipitation of driest month (kg m-2; CHELSA bio14).
#'   \item `rainfall_driest_quarter`: Precipitation of driest quarter (kg m-2; CHELSA bio17).
#'   \item `rainfall_warmest_quarter`: Precipitation of warmest quarter (kg m-2; CHELSA bio18).
#'   \item `rainfall_wettest_month`: Precipitation of wettest month (kg m-2; CHELSA bio13).
#'   \item `rainfall_wettest_quarter`: Precipitation of wettest quarter (kg m-2; CHELSA bio16).
#'   \item `temperature_isothermality`: Isothermality as ratio of mean daily range to annual range (unitless; CHELSA bio3).
#'   \item `temperature_mean_daily_range`: Mean of monthly temperature ranges (degrees C; CHELSA bio2).
#'   \item `temperature`: Mean annual air temperature (degrees C; CHELSA bio1).
#'   \item `temperature_range`: Annual air temperature range (degrees C; CHELSA bio7).
#'   \item `temperature_seasonality`: Temperature seasonality as standard deviation of monthly means (degrees C; CHELSA bio4).
#'   \item `temperature_coldest_month_min`: Minimum temperature of coldest month (degrees C; CHELSA bio6).
#'   \item `temperature_coldest_quarter`: Mean temperature of coldest quarter (degrees C; CHELSA bio11).
#'   \item `temperature_driest_quarter`: Mean temperature of driest quarter (degrees C; CHELSA bio9).
#'   \item `temperature_warmest_month_max`: Maximum temperature of warmest month (degrees C; CHELSA bio5).
#'   \item `temperature_warmest_quarter`: Mean temperature of warmest quarter (degrees C; CHELSA bio10).
#'   \item `temperature_wettest_quarter`: Mean temperature of wettest quarter (degrees C; CHELSA bio8).
#'   \item `distance_to_ocean`: Distance to nearest ocean coastline (km).
#'   \item `elevation`: Elevation above sea level (m).
#'   \item `latitude`: Latitude of cell centroid (degrees).
#'   \item `longitude`: Longitude of cell centroid (degrees).
#'   \item `soil_clay`: Soil clay content (%).
#'   \item `soil_nitrogen`: Soil nitrogen content (g kg-1).
#'   \item `soil_organic_carbon`: Soil organic carbon content (g kg-1).
#'   \item `soil_ph`: Soil pH in water.
#'   \item `soil_sand`: Soil sand content (%).
#'   \item `soil_silt`: Soil silt content (%).
#'   \item `soil_temperature_max`: Maximum annual land surface temperature (degrees C).
#'   \item `soil_temperature`: Mean annual land surface temperature (degrees C).
#'   \item `soil_temperature_min`: Minimum annual land surface temperature (degrees C).
#'   \item `soil_temperature_range`: Annual land surface temperature range (degrees C).
#'   \item `ndvi_max`: Maximum annual NDVI (unitless, 0-1).
#'   \item `ndvi`: Mean annual NDVI (unitless, 0-1).
#'   \item `ndvi_min`: Minimum annual NDVI (unitless, 0-1).
#'   \item `ndvi_range`: Annual NDVI range (unitless, 0-1).
#' }
#'
#' **Geometry:**
#' \itemize{
#'   \item `geometry`: Hexagonal polygon geometry (WGS84, EPSG:4326).
#' }
#'
#' @source
#' **Dataset publication:**
#' \itemize{
#'   \item Benito, B.M., Cayuela, L., & Albuquerque, F.S. (2013). The impact of modelling choices in the predictive performance of richness maps derived from species-distribution models: Guidelines to build better diversity models. \emph{Methods in Ecology and Evolution}, 4(4), 327--335. \doi{10.1111/2041-210X.12022}
#' }
#'
#' **Response variable (tree species richness):**
#' \itemize{
#'   \item Cayuela, L., Gálvez-Bravo, L., Pérez Pérez, R., de Albuquerque, F.S., Golicher, D.J., Zahawi, R.A., et al. (2012). The Tree Biodiversity Network (BIOTREE-NET): prospects for biodiversity research and conservation in the Neotropics. \emph{Biodiversity & Ecology}, 4, 211--224. \doi{10.7809/b-e.00078}
#'   \item GBIF: Global Biodiversity Information Facility. \url{https://www.gbif.org}
#' }
#'
#' **Climate predictors (temperature, precipitation, air humidity, cloud cover, evapotranspiration):**
#' \itemize{
#'   \item Brun, P., Zimmermann, N.E., Hari, C., Pellissier, L., & Karger, D.N. (2022). CHELSA-BIOCLIM+ A novel set of global climate-related predictors at kilometre-resolution. EnviDat. \doi{10.16904/envidat.332}
#' }
#'
#' **Aridity:**
#' \itemize{
#'   \item Zomer, R.J., Xu, J., & Trabucco, A. (2022). Version 3 of the Global Aridity Index and Potential Evapotranspiration Database. \emph{Scientific Data}, 9, 409. \doi{10.1038/s41597-022-01493-1}
#' }
#'
#' **Soil properties:**
#' \itemize{
#'   \item Hengl, T., et al. (2017). SoilGrids250m: Global gridded soil information based on machine learning. \emph{PLOS ONE}, 12(2), e0169748. \doi{10.1371/journal.pone.0169748}
#' }
#'
#' **Soil temperature:**
#' \itemize{
#'   \item Wan, Z., Hook, S., & Hulley, G. (2015). MOD11A2 MODIS/Terra Land Surface Temperature/Emissivity 8-Day L3 Global 1km SIN Grid V006. NASA EOSDIS LP DAAC. \doi{10.5067/MODIS/MOD11A2.006}
#' }
#'
#' **NDVI:**
#' \itemize{
#'   \item Copernicus Land Monitoring Service. (2019). Normalised Difference Vegetation Index Statistics (Long Term 1999-2019), raster 1 km, global, version 3. European Commission, Joint Research Centre. \doi{10.2909/290e81fb-4c84-42ad-ae12-f663312b0eda}
#' }
#'
#' **Elevation and geography:**
#' \itemize{
#'   \item Jarvis, A., Guevara, E., Reuter, H. I., & Nelson, A. D. (2008). Hole-filled SRTM for the globe: version 4, data grid. Web publication/site, CGIAR Consortium for Spatial Information. \url{https://srtm.csi.cgiar.org}
#' }
#' @examples
#' data(trees)
#' colnames(trees)
#' nrow(trees)
#' ncol(trees)
#' @family trees
"trees"

#' @title Response variable name for the dataset `trees`
#' @description Character vector of length 1 containing the name of the
#' response variable in [trees].
#' @usage data(trees_response)
#' @format A character vector of length 1.
#' @examples
#' data(trees_response)
#' trees_response
#' @family trees
"trees_response"

#' @title Predictor variable names for the dataset `trees`
#' @description Character vector of 50 predictor variable names from [trees].
#' @usage data(trees_predictors)
#' @format A character vector of length 50.
#' @examples
#' data(trees_predictors)
#' trees_predictors
#' @family trees
"trees_predictors"

#' Download Presence Records for trees
#'
#' @description
#' Downloads and reads an `sf` dataframe with the tree species presence records associated with the [trees] dataset from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `trees_presence.gpkg` to the working folder, and returns it as an `sf` dataframe.
#'
#' 
#' @return sf data frame with POINT geometry (WGS84, EPSG:4326) and columns `species` and `source`.
#' @family trees
#' @export
trees_extra <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "trees_presence.gpkg")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/trees_presence.gpkg"
    message(
      "spatialData::trees_extra(): Downloading file 'trees_presence.gpkg'."
    )
    tryCatch(
      utils::download.file(url, path, mode = "wb", quiet = TRUE),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::trees_extra(): Download of \nURL: '",
          url,
          "' failed.",
          call. = FALSE
        )
      }
    )
  }

  out <- sf::st_read(
    dsn = path,
    quiet = TRUE
  )

  out
}
