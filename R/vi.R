#' @title Global long-term NDVI records and environmental predictors
#'
#' @description
#' `sf` data frame with `POINT` geometry representing 9,265 global locations with one response variable represented in five different encodings of the long-term average (1999-2019) of the Normalized Difference Vegetation Index (NDVI) and 58 environmental predictors (47 numeric, 11 categorical). Use [vi_extra()] to download an extended version with 30,000 rows. There is a smaller version of this dataset (580 rows) named [vi_smol]
#'
#' NDVI values are derived from the Copernicus Global Land Service Long Term Statistics product (1999-2019) at 1 km resolution. Locations were spatially thinned to reduce spatial autocorrelation.
#'
#' Environmental predictors were extracted as pixel values from normalized raster data at 1 km resolution.
#'
#' @usage data(vi)
#' @format An sf data frame with 9265 rows (locations) and 64 columns:
#'
#' **Response variables (5):**
#' \itemize{
#'   \item `vi_numeric`: Continuous NDVI value (0-1).
#'   \item `vi_counts`: Integer count encoding of NDVI (vi_numeric * 1000).
#'   \item `vi_binomial`: Binary encoding of NDVI (1 if vi_numeric > 0.5, else 0).
#'   \item `vi_categorical`: Categorical encoding of NDVI ("very_low", "low", "medium", "high", "very_high").
#'   \item `vi_factor`: Factor encoding of NDVI (vi_categorical as factor).
#' }
#'
#' **Predictor variables:**
#' \itemize{
#'   \item `koppen_zone`: Koppen climate zone code (Beck et al. 2018).
#'   \item `koppen_group`: Koppen climate group name.
#'   \item `koppen_description`: Koppen climate description.
#'   \item `soil_type`: Soil classification type.
#'   \item `topo_slope`: Topographic slope in degrees.
#'   \item `topo_diversity`: Number of combinations of different elevations, slopes, and aspects in a 5 km radius around each 1 km cell.
#'   \item `topo_elevation`: Elevation in meters.
#'   \item `swi_mean`: Mean annual soil water index (unitless, 0-100 cm depth).
#'   \item `swi_max`: Maximum annual soil water index (unitless, 0-100 cm depth).
#'   \item `swi_min`: Minimum annual soil water index (unitless, 0-100 cm depth).
#'   \item `swi_range`: Annual soil water index range (unitless, 0-100 cm depth).
#'   \item `soil_temperature_mean`: Mean annual land surface temperature (degrees C).
#'   \item `soil_temperature_max`: Maximum annual land surface temperature (degrees C).
#'   \item `soil_temperature_min`: Minimum annual land surface temperature (degrees C).
#'   \item `soil_temperature_range`: Annual land surface temperature range (degrees C).
#'   \item `soil_sand`: Soil sand content (%).
#'   \item `soil_clay`: Soil clay content (%).
#'   \item `soil_silt`: Soil silt content (%).
#'   \item `soil_ph`: Soil pH.
#'   \item `soil_soc`: Soil organic carbon content (%).
#'   \item `soil_nitrogen`: Soil nitrogen content (%).
#'   \item `solar_rad_mean`: Mean annual solar radiation (kJ m-2).
#'   \item `solar_rad_max`: Maximum annual solar radiation (kJ m-2).
#'   \item `solar_rad_min`: Minimum annual solar radiation (kJ m-2).
#'   \item `solar_rad_range`: Annual solar radiation range (kJ m-2).
#'   \item `growing_season_length`: Length of the growing season (days).
#'   \item `growing_season_temperature`: Mean temperature of the growing season (degrees C).
#'   \item `growing_season_rainfall`: Accumulated precipitation of the growing season (kg m-2).
#'   \item `growing_degree_days`: Growing degree days above 0 degrees C accumulated over one year (degree-days).
#'   \item `temperature_mean`: Mean annual air temperature (degrees C; CHELSA bio1).
#'   \item `temperature_max`: Maximum temperature of warmest month (degrees C; CHELSA bio5).
#'   \item `temperature_min`: Minimum temperature of coldest month (degrees C; CHELSA bio6).
#'   \item `temperature_range`: Annual air temperature range (degrees C; CHELSA bio7).
#'   \item `temperature_seasonality`: Temperature seasonality as standard deviation of monthly means (degrees C; CHELSA bio4).
#'   \item `rainfall_mean`: Mean annual rainfall (kg m-2).
#'   \item `rainfall_min`: Minimum monthly rainfall (kg m-2).
#'   \item `rainfall_max`: Maximum monthly rainfall (kg m-2).
#'   \item `rainfall_range`: Annual rainfall range (kg m-2).
#'   \item `evapotranspiration_mean`: Mean annual potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_max`: Maximum monthly potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_min`: Minimum monthly potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_range`: Annual potential evapotranspiration range (kg m-2 month-1; Penman-Monteith).
#'   \item `cloud_cover_mean`: Mean annual total cloud cover (%).
#'   \item `cloud_cover_max`: Maximum monthly total cloud cover (%).
#'   \item `cloud_cover_min`: Minimum monthly total cloud cover (%).
#'   \item `cloud_cover_range`: Annual total cloud cover range (%).
#'   \item `aridity_index`: Mean aridity index (unitless ratio; higher values indicate wetter conditions).
#'   \item `humidity_mean`: Mean annual near-surface relative humidity (%).
#'   \item `humidity_max`: Maximum monthly near-surface relative humidity (%).
#'   \item `humidity_min`: Minimum monthly near-surface relative humidity (%).
#'   \item `humidity_range`: Annual near-surface relative humidity range (%).
#'   \item `biogeo_ecoregion`: Ecoregion name.
#'   \item `biogeo_biome`: Biome name.
#'   \item `biogeo_realm`: Ecological realm name.
#'   \item `country_name`: Country name.
#'   \item `continent`: Continent name.
#'   \item `region`: UN region name.
#'   \item `subregion`: UN sub-region name.
#' }
#'
#' **Geometry:**
#' \itemize{
#'   \item `geometry`: Point geometry (WGS84, EPSG:4326).
#' }
#'
#' @source
#' **Response variables (NDVI):**
#' \itemize{
#'   \item Copernicus Land Monitoring Service. (2019). Normalised Difference Vegetation Index Statistics (Long Term 1999-2019), raster 1 km, global, version 3. European Commission, Joint Research Centre. \doi{10.2909/290e81fb-4c84-42ad-ae12-f663312b0eda}
#' }
#'
#' **Climate classification:**
#' \itemize{
#'   \item Beck, H.E., et al. (2018). Present and future Koppen-Geiger climate classification maps at 1-km resolution. \emph{Scientific Data}, 5, 180214. \doi{10.1038/sdata.2018.214}
#' }
#'
#' **Soil water index:**
#' \itemize{
#'   \item Copernicus Land Monitoring Service: Soil Water Index. \doi{10.2909/290e81fb-4c84-42ad-ae12-f663312b0eda}
#' }
#'
#' **Climate predictors (temperature, rainfall, solar radiation, growing season, evapotranspiration, cloud cover, humidity):**
#' \itemize{
#'   \item Brun, P., Zimmermann, N.E., Hari, C., Pellissier, L., & Karger, D.N. (2022). CHELSA-BIOCLIM+ A novel set of global climate-related predictors at kilometre-resolution. EnviDat. \doi{10.16904/envidat.332}
#' }
#'
#' **Soil type and properties:**
#' \itemize{
#'   \item Hengl, T., et al. (2017). SoilGrids250m: Global gridded soil information based on machine learning. \emph{PLOS ONE}, 12(2), e0169748. \doi{10.1371/journal.pone.0169748}
#' }
#'
#' **Soil temperature:**
#' \itemize{
#'   \item Wan, Z., Hook, S., & Hulley, G. (2015). MOD11A2 MODIS/Terra Land Surface Temperature/Emissivity 8-Day L3 Global 1km SIN Grid V006. NASA EOSDIS LP DAAC. \doi{10.5067/MODIS/MOD11A2.006}
#' }
#'
#' **Ecoregions and biogeography:**
#' \itemize{
#'   \item Dinerstein, E., et al. (2017). An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm. \emph{BioScience}, 67(6), 534-545. \doi{10.1093/biosci/bix014}
#' }
#'
#' **Elevation and topography:**
#' \itemize{
#'   \item Jarvis, A., Guevara, E., Reuter, H. I., & Nelson, A. D. (2008). Hole-filled SRTM for the globe: version 4, data grid. Web publication/site, CGIAR Consortium for Spatial Information. \url{https://srtm.csi.cgiar.org}
#' }
#'
#' **Aridity index:**
#' \itemize{
#'   \item Zomer, R.J., Xu, J., & Trabucco, A. (2022). Version 3 of the Global Aridity Index and Potential Evapotranspiration Database. \emph{Scientific Data}, 9, 409. \doi{10.1038/s41597-022-01493-1}
#' }
#'
#' **Country, continent, region, and subregion:**
#' \itemize{
#'   \item Natural Earth. Free vector and raster map data. \url{https://www.naturalearthdata.com/}
#' }
#' @examples
#' data(vi)
#' colnames(vi)
#' nrow(vi)
#' ncol(vi)
#' @family vi
"vi"

#' Small version of `vi`
#'
#' @description Same as dataset [vi], but with only 580 rows.
#'
#' @usage data(vi_smol)
#'
#' @format A data frame with 580 rows and 65 columns.
#' @examples
#' data(vi_smol)
#' colnames(vi_smol)
#' nrow(vi_smol)
#' ncol(vi_smol)
#' @seealso [vi]
#' @family vi
"vi_smol"

#' @title Response variable names for the dataset `vi`
#' @description Character vector containing the names of the 5 response variables in [vi].
#' @usage data(vi_responses)
#' @format A character vector of length 5.
#' @examples
#' data(vi_responses)
#' vi_responses
#' @family vi
"vi_responses"

#' @title Predictor variable names for the dataset `vi`
#' @description Character vector of 58 predictor variable names from [vi].
#' @usage data(vi_predictors)
#' @format A character vector of length 58.
#' @examples
#' data(vi_predictors)
#' vi_predictors
#' @family vi
"vi_predictors"

#' Download extended `vi` dataset
#'
#' @description
#' Downloads and reads the extended version of the [vi] dataset (30,000 rows) from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `vi.gpkg` to the working directory, and returns it as an `sf` dataframe. See [vi] for details on the response variables, predictors, and data sources.
#' Results are cached in memory for the duration of the R session; calling the function again returns the cached object instantly without re-reading from disk.
#'
#'
#' @return sf data.frame with 30,000 rows and 64 columns (POINT geometry, WGS84).
#' @family vi
#' @export
vi_extra <- function() {
  cache_key <- "vi_extra"
  if (exists(cache_key, envir = .cache, inherits = FALSE)) {
    return(get(cache_key, envir = .cache, inherits = FALSE))
  }

  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "vi.gpkg")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/vi.gpkg"
    message("spatialData::vi_extra(): Downloading 'vi.gpkg' to '", path, "'.")
    tryCatch(
      utils::download.file(url, path, mode = "wb", quiet = TRUE),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::vi_extra(): Download of \nURL: '",
          url,
          "' failed.",
          call. = FALSE
        )
      }
    )
  }

  out <- sf::st_read(dsn = path, quiet = TRUE)
  assign(cache_key, out, envir = .cache)
  out
}
