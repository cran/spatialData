#' @title Butterfly and host plant presence in Sierra Nevada (SE Spain)
#'
#' @description
#' `sf` dataframe with co-occurrence records for a butterfly  and its host plant in Sierra Nevada (SE Spain). Contains 3 response variables (see [interaction_responses]) and 10 numeric predictors at 100 m resolution (see [interaction_predictors]). Use [interaction_extra()] to download the associated environmental raster.
#'
#' @usage data(interaction)
#' @format An `sf` dataframe  with 1,000 rows (presence and background points) and 14 columns:
#'
#' **Response variables (3):**
#' \itemize{
#'   \item `butterfly`: Integer with three possible values: 1 (presence of \emph{Agriades zullichi}), 0 (background), and NA (host plant observation site, where butterfly was not surveyed).
#'   \item `host_plant`: Integer with three possible values: 1 (presence of \emph{Androsace vitaliana}), 0 (background), and NA (butterfly observation site, where the plant was not surveyed).
#'   \item `class`: Factor with three levels: `"butterfly"`, `"host_plant"`, and `"background"`, indicating the observation type of each record.
#' }
#'
#' **Predictor variables:**
#' \itemize{
#'   \item `landsat_ndvi`: Normalized Difference Vegetation Index derived from Landsat imagery.
#'   \item `landsat_pca_bands_123`: First principal component of Landsat bands 1, 2, and 3 (visible).
#'   \item `landsat_pca_bands_457`: First principal component of Landsat bands 4, 5, and 7 (infrared).
#'   \item `rainfall_annual`: Mean annual rainfall (mm).
#'   \item `solar_radiation`: Mean annual solar radiation (MJ m\eqn{^{-2}} day\eqn{^{-1}}).
#'   \item `temperature_annual_mean`: Mean annual temperature (degrees C).
#'   \item `temperature_summer_max`: Maximum summer temperature (degrees C).
#'   \item `temperature_winter_min`: Minimum winter temperature (degrees C).
#'   \item `topographic_complexity`: Index of terrain ruggedness and heterogeneity.
#'   \item `topographic_position`: Relative elevation of a cell compared to its surroundings.
#' }
#'
#' **Geometry:**
#' \itemize{
#'   \item `geometry`: Point geometry (ETRS89 / UTM zone 30N, EPSG:25830).
#' }
#'
#' @source
#' **Species occurrences:**
#' \itemize{
#'   \item Barea-Azcón, J.M., Benito, B.M., Olivares, F.J., Ruiz, H., Martín, J., García, A.L., & López, R. (2014). Distribution and conservation of the relict interaction between the butterfly \emph{Agriades zullichi} and its larval foodplant (\emph{Androsace vitaliana nevadensis}). \emph{Biodiversity and Conservation}, 23(4), 927–944. \doi{10.1007/s10531-014-0643-4}
#' }
#'
#' **Remote sensing data:**
#' \itemize{
#'   \item Nunes de Lima, M. V. (Ed.) (2005). \emph{IMAGE2000 and CLC2000 -- Products and methods}. Joint Research Centre, Institute for Environment and Sustainability, and European Environment Agency. Publications Office of the European Union. \url{https://op.europa.eu/en/publication-detail/-/publication/84dd2bad-14d9-4a65-9b92-3b4507d09e44/language-en}
#' }
#'
#' **Climate and topographic variables:**
#' \itemize{
#'   \item Benito, B., Lorite, J., & Peñas, J. (2011). Simulating potential effects of climatic warming on altitudinal patterns of key species in Mediterranean-alpine ecosystems. \emph{Climatic Change}, 108, 471–483. \doi{10.1007/s10584-010-0015-3}
#' }
#'
#' @examples
#' data(interaction)
#' colnames(interaction)
#' nrow(interaction)
#' ncol(interaction)
#' @family interaction
"interaction"

#' @title Response variable names for the dataset `interaction`
#' @description Character vector of 3 response variable names from [interaction].
#' @usage data(interaction_responses)
#' @format A character vector of length 3.
#' @examples
#' data(interaction_responses)
#' interaction_responses
#' @family interaction
"interaction_responses"

#' @title Predictor variable names for interaction dataset
#' @description Character vector of 10 predictor variable names from [interaction].
#' @usage data(interaction_predictors)
#' @format A character vector of length 10.
#' @examples
#' data(interaction_predictors)
#' interaction_predictors
#' @family interaction
"interaction_predictors"

#' Download Environmental Raster for interaction
#'
#' @description
#' Downloads and reads the environmental raster associated with the [interaction] dataset from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Requires the \pkg{terra} package. Writes the file `sierra_nevada_env.tif` to the working directory and returns a `spatRaster` object.
#'
#' 
#' @return SpatRaster object.
#' @family interaction
#' @export
interaction_extra <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "sierra_nevada_env.tif")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/sierra_nevada_env.tif"
    message(
      "spatialData::interaction_extra(): Downloading file 'sierra_nevada_env.tif'."
    )
    tryCatch(
      utils::download.file(url, path, mode = "wb", quiet = TRUE),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::interaction_extra(): Download of \nURL: '",
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
