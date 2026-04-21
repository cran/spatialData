#' @title Plant Communities of Sierra Nevada (Spain)
#'
#' @description
#' `sf` data frame with `POINT` geometry containing 6,747 plant community records from the Sierra Nevada mountain range (SE Spain), with 6 response variables (see [communities_responses]) and 9 numeric predictors (see [communities_predictors]).
#' Use [communities_extra_2010()], [communities_extra_2050()], and [communities_extra_2100()] to download the associated environmental rasters for the baseline (2010), 2050, and 2100 climate scenarios.
#'
#' @usage data(communities)
#' @format An sf data frame with 6,747 rows and 16 columns:
#'
#' **Response variables (6):**
#' \itemize{
#'   \item `community`: Factor column with 6 levels: `"none"` (no presence of target communities), `"Pyrenean oak forests"`, `"Juniper-broom shrublands"`, `"Pinus forests"`, `"Alpine pastures"`, `"Holm oak forests"`.
#'   \item `pyrenean_oak`: Binary integer presence-absence (1/0) for Pyrenean oak forests.
#'   \item `juniper_shrubland`: Binary integer presence-absence (1/0) for juniper-broom shrublands.
#'   \item `pinus_forest`: Binary integer presence-absence (1/0) for Pinus forests.
#'   \item `alpine_pastures`: Binary integer presence-absence (1/0) for alpine pastures.
#'   \item `holm_oak`: Binary integer presence-absence (1/0) for holm oak forests.
#' }
#'
#' **Predictor variables:**
#' \itemize{
#'   \item `max_temperature_summer`: Maximum summer temperature (degrees C).
#'   \item `max_temperature_winter`: Maximum winter temperature (degrees C).
#'   \item `min_temperature_summer`: Minimum summer temperature (degrees C).
#'   \item `min_temperature_winter`: Minimum winter temperature (degrees C).
#'   \item `rainfall_summer`: Summer rainfall (mm).
#'   \item `rainfall_winter`: Winter rainfall (mm).
#'   \item `northness`: Northness index (cosine of aspect, -1 to 1).
#'   \item `slope`: Terrain slope (degrees).
#'   \item `topographic_wetness_index`: Topographic wetness index.
#' }
#'
#' **Geometry:**
#' \itemize{
#'   \item `geometry`: Point geometry (ETRS89 / UTM zone 30N, EPSG:25830).
#' }
#'
#' @source
#' \itemize{
#'   \item Benito, B., Lorite, J., & Peñas, J. (2011). Simulating potential effects of climatic warming on altitudinal patterns of key species in Mediterranean-alpine ecosystems. \emph{Climatic Change}, 108, 471–483. \doi{10.1007/s10584-010-0015-3}
#' }
#'
#' @examples
#' data(communities)
#' colnames(communities)
#' nrow(communities)
#' ncol(communities)
#' @family communities
"communities"

#' @title Response variable names for the dataset `communities`
#' @description Character vector of 6 response variable names from [communities].
#' @usage data(communities_responses)
#' @format A character vector of length 6.
#' @examples
#' data(communities_responses)
#' communities_responses
#' @family communities
"communities_responses"

#' @title Predictor variable names for the dataset `communities`
#' @description Character vector of 9 predictor variable names from [communities].
#' @usage data(communities_predictors)
#' @format A character vector of length 9.
#' @examples
#' data(communities_predictors)
#' communities_predictors
#' @family communities
"communities_predictors"

#' Download Environmental Raster for communities - 2010
#'
#' @description
#' Downloads the baseline (2010) environmental raster associated with the [communities] dataset from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `communities_2010.tif` in the working directory and returns it as a `spatRaster` object.
#'
#' 
#' @return spatRaster object.
#' @family communities
#' @export
communities_extra_2010 <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "communities_2010.tif")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/communities_2010.tif"
    message(
      "spatialData::communities_extra_2010(): Downloading file 'communities_2010.tif'."
    )
    tryCatch(
      utils::download.file(
        url,
        path,
        mode = "wb",
        quiet = TRUE
      ),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::communities_extra_2010(): Download of \nURL: '",
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

#' Download Environmental Raster for communities - 2050
#'
#' @description
#' Downloads the future climate (2050) raster associated with the [communities] dataset from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `communities_2050.tif` in the working directory and returns it as a `spatRaster` object.
#'
#' 
#' @return SpatRaster object.
#' @family communities
#' @export
communities_extra_2050 <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "communities_2050.tif")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/communities_2050.tif"
    message(
      "spatialData::communities_extra_2050(): Downloading file 'communities_2050.tif'."
    )
    tryCatch(
      utils::download.file(
        url,
        path,
        mode = "wb",
        quiet = TRUE
      ),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::communities_extra_2050(): Download of \nURL: '",
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

#' Download Environmental Raster for communities - 2100
#'
#' @description
#' Downloads the future climate (2100) raster associated with the [communities] dataset from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `communities_2100.tif` in the working directory and returns it as a `spatRaster` object.
#'
#' 
#' @return SpatRaster object.
#' @family communities
#' @export
communities_extra_2100 <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "communities_2100.tif")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/communities_2100.tif"
    message(
      "spatialData::communities_extra_2100(): Downloading file 'communities_2100.tif'."
    )
    tryCatch(
      utils::download.file(
        url,
        path,
        mode = "wb",
        quiet = TRUE
      ),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::communities_extra_2100(): Download of \nURL: '",
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
