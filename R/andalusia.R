#' @title Presence records of 90 plant species and background points from Andalusia, Spain
#'
#' @description
#' `sf` long format data frame with `POINT` geometry and CRS ETRS89 / UTM zone 30N (EPSG:25830), containing 37,773 presence records for 90 plant species and 8,692 background points (46,465 rows total) from Andalusia, Spain.
#'
#' The dataset contains 3 columns (species, presence, geometry). Environmental predictors for each point can be extracted from the companion raster returned by [andalusia_extra()]. Predictor names are stored in [andalusia_predictors].
#'
#' @usage data(andalusia)
#' @format An sf data frame with 46,465 rows (presences and background points) and 3 columns:
#'
#' \itemize{
#'   \item `species`: Character string (species name or `"background"`). Suitable for classification models.
#'   \item `presence`: Binary integer stored as `integer` (1 = confirmed species presence, 0 = background point).
#'   \item `geometry`: `sfc_POINT` column with coordinates in EPSG:25830.
#' }
#'
#' @source
#' **Published study:**
#' \itemize{
#'   \item Benito, B.M., Lorite, J., Pérez-Pérez, R., Gómez-Aparicio, L., & Peñas, J. (2014). Forecasting plant range collapse in a mediterranean hotspot: when dispersal uncertainties matter. \emph{Diversity and Distributions}, 20(1), 72--83. \doi{10.1111/ddi.12148}
#' }
#'
#' **Landsat imagery:**
#' \itemize{
#'   \item Nunes de Lima, M. V. (Ed.) (2005). \emph{IMAGE2000 and CLC2000 - Products and methods}. Joint Research Centre, Institute for Environment and Sustainability, and European Environment Agency. Publications Office of the European Union. \url{https://op.europa.eu/en/publication-detail/-/publication/84dd2bad-14d9-4a65-9b92-3b4507d09e44/language-en}
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
#' data(andalusia)
#' colnames(andalusia)
#' nrow(andalusia)
#' ncol(andalusia)
#' @family andalusia
"andalusia"

#' @title Response names for the dataset `andalusia`
#' @description Character vector of length 2 containing the names of the
#' response variables in [andalusia]: `"species"` (character, species name or `"background"` for 90 species plus background points) and `"presence"` (binary integer, 1 = confirmed species presence, 0 = background point).
#' @usage data(andalusia_responses)
#' @format Character vector of length 2.
#' @examples
#' data(andalusia_responses)
#' andalusia_responses
#' @family andalusia
"andalusia_responses"

#' @title Predictor names for the dataset `andalusia`
#' @description Character vector of 20 predictor variable names corresponding to the layers of the environmental raster returned by [andalusia_extra()], covering Landsat reflectance (7), rainfall (2), solar radiation (2), temperature (4), and topography (5). These are **not** columns in [andalusia]; use `terra::extract()` to attach them to the point data.
#' @usage data(andalusia_predictors)
#' @format Character vector of length 20.
#' @examples
#' data(andalusia_predictors)
#' andalusia_predictors
#' @family andalusia
"andalusia_predictors"

#' Environmental raster for the dataset `andalusia`
#'
#' @description
#' Downloads and reads the 20-band environmental raster associated with the [andalusia] dataset from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. The raster covers Andalusia, Spain, at 400 m resolution (EPSG:25830) and includes remote-sensing, climate, and topographic predictors (see [andalusia]).
#' 
#' @return SpatRaster object with 20 layers.
#' @family andalusia
#' @export
andalusia_extra <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "andalusia_env.tif")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/andalusia_env.tif"
    message(
      "spatialData::andalusia_extra(): Downloading 'andalusia_env.tif'."
    )
    tryCatch(
      utils::download.file(url, path, mode = "wb", quiet = TRUE),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::andalusia_extra(): Download of \nURL: '",
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
