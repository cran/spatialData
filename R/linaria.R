#' @title Presence of *Linaria nigricans* and greenhouses in Eastern Andalusia
#'
#' @description
#' `sf` data frame with `POINT` geometry containing presence records of the plant
#' *Linaria nigricans*, greenhouses, and background points from Eastern Andalusia (Spain). The dataframe contains 2 response variables (see [linaria_responses]), and 20 numeric predictors (see [linaria_predictors]). Use [linaria_extra()] to download the associated environmental raster.
#'
#' The dataset combines species presence records,
#' greenhouse presence records (representing a competing land use), and randomly
#' sampled background points. Species presences and greenhouse presences were
#' spatially thinned at 400 m to remove redundancy at the raster resolution.
#' Background points were randomly sampled within the extent of the presence
#' records. Environmental predictors were extracted from a Landsat/DEM-derived
#' raster at 400 m resolution (EPSG:25830).
#'
#' @usage data(linaria)
#' @format An sf data frame with 7386 rows (presences and background points) and 25 columns:
#'
#' **Response variables:**
#' \itemize{
#'   \item `linaria_nigricans`: Binary integer (1 = confirmed *Linaria nigricans* presence, 0 = greenhouse presence or background point).
#'   \item `greenhouses`: Binary integer (1 = greenhouse presence, 0 = *Linaria nigricans* presence or background point).
#' }
#'
#' **Predictor variables:**
#' \itemize{
#'   \item `landsat_band_1`: Landsat TM Band 1 — Blue (0.45–0.52 µm), surface reflectance.
#'   \item `landsat_band_2`: Landsat TM Band 2 — Green (0.52–0.60 µm), surface reflectance.
#'   \item `landsat_band_3`: Landsat TM Band 3 — Red (0.63–0.69 µm), surface reflectance.
#'   \item `landsat_band_4`: Landsat TM Band 4 — Near-infrared (0.76–0.90 µm), surface reflectance.
#'   \item `landsat_band_5`: Landsat TM Band 5 — Short-wave infrared 1 (1.55–1.75 µm), surface reflectance.
#'   \item `landsat_band_6`: Landsat TM Band 6 — Thermal infrared (10.4–12.5 µm), brightness temperature (K).
#'   \item `landsat_ndvi`: Normalized Difference Vegetation Index derived from Landsat bands 3 and 4.
#'   \item `rainfall_annual`: Total annual rainfall (mm).
#'   \item `rainfall_summer`: Total summer rainfall (mm, June–September).
#'   \item `solar_radiation_summer`: Mean daily solar radiation in summer (kJ m-2 day-1).
#'   \item `solar_radiation_winter`: Mean daily solar radiation in winter (kJ m-2 day-1).
#'   \item `temperature_summer_max`: Mean maximum temperature in summer (degrees C).
#'   \item `temperature_summer_min`: Mean minimum temperature in summer (degrees C).
#'   \item `temperature_winter_max`: Mean maximum temperature in winter (degrees C).
#'   \item `temperature_winter_min`: Mean minimum temperature in winter (degrees C).
#'   \item `topography_eastness`: Eastward component of aspect (sin of aspect in radians).
#'   \item `topography_elevation`: Elevation above sea level (m).
#'   \item `topography_northness`: Northward component of aspect (cos of aspect in radians).
#'   \item `topography_position`: Topographic position index (local elevation relative to neighbourhood mean).
#'   \item `topography_slope`: Slope gradient (degrees).
#' }
#'
#' **Geometry:**
#' \itemize{
#'   \item `geometry`: Point geometry (ETRS89 / UTM zone 30N, EPSG:25830).
#' }
#'
#' @source
#' **Published studies:**
#' \itemize{
#'   \item Benito, B.M., Martínez-Ortega, M.M., Munoz, L.M., Lorite, J. & Penas, J. (2009).
#'   Assessing extinction-risk of endangered plants using species distribution models: a case
#'   study of habitat depletion caused by the spread of greenhouses.
#'   \emph{Biodiversity and Conservation}, 18(9), 2509--2520.
#'   \doi{10.1007/s10531-009-9604-8}
#'   \item Peñas, J., Benito, B., Lorite, J., et al. (2011). Habitat fragmentation in arid
#'   zones: a case study of \emph{Linaria nigricans} under land use changes (SE Spain).
#'   \emph{Environmental Management}, 48, 168--176.
#'   \doi{10.1007/s00267-011-9663-y}
#' }
#'
#' **Landsat imagery:**
#' \itemize{
#'   \item Nunes de Lima, M. V. (Ed.) (2005). \emph{IMAGE2000 and CLC2000 -- Products and methods}. Joint Research Centre, Institute for Environment and Sustainability, and European Environment Agency. Publications Office of the European Union. \url{https://op.europa.eu/en/publication-detail/-/publication/84dd2bad-14d9-4a65-9b92-3b4507d09e44/language-en}
#' }
#'
#' **Climate variables:**
#' \itemize{
#'   \item Ninyerola, M., Pons, X. & Roure, J.M. (2005). Atlas Climático Digital de la Península Ibérica: Metodología y aplicaciones en bioclimatología y geobotánica. Universidad Autónoma de Barcelona, Bellaterra.
#' }
#'
#' **Topography:**
#' \itemize{
#'   \item Instituto Geográfico Nacional. Modelo Digital del Terreno (MDT25). \url{https://www.ign.es}
#' }
#' @examples
#' data(linaria)
#' colnames(linaria)
#' nrow(linaria)
#' ncol(linaria)
#' @family linaria
"linaria"

#' @title Response variable names for the dataset `linaria`
#' @description Character vector of length 2 containing the names of the
#' response variables in [linaria].
#' @usage data(linaria_responses)
#' @format A character vector of length 2.
#' @examples
#' data(linaria_responses)
#' linaria_responses
#' @family linaria
"linaria_responses"

#' @title Predictor variable names for the dataset `linaria`
#' @description Character vector of 20 predictor variable names from [linaria],
#' covering Landsat reflectance (7), rainfall (2), solar radiation (2),
#' temperature (4), and topography (5).
#' @usage data(linaria_predictors)
#' @format A character vector of length 20.
#' @examples
#' data(linaria_predictors)
#' linaria_predictors
#' @family linaria
"linaria_predictors"

#' Download Environmental Raster for linaria
#'
#' @description
#' Downloads and reads the 20-band environmental raster associated with the [linaria] dataset
#' from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `linaria_env.tif` in the working directory and returns it as a `spatRaster` object.
#' 
#' @return SpatRaster object with 20 layers.
#' @family linaria
#' @export
linaria_extra <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "linaria_env.tif")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/linaria_env.tif"
    message(
      "spatialData::linaria_extra(): Downloading 'linaria_env.tif'."
    )
    tryCatch(
      utils::download.file(url, path, mode = "wb", quiet = TRUE),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::linaria_extra(): Download of \nURL: '",
          url,
          "' failed.",
          call. = FALSE
        )
      }
    )
  }

  out <- terra::rast(path)

  out
}
