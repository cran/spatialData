#' @title Neanderthal presence in the Last Interglacial
#'
#' @description
#' `sf` data frame with `POINT` geometry containing 227 records of Neanderthal presence from Marine Isotope Stage 5e (Last Interglacial) in Europe and the Near East, 1 response variable (see [neanderthal_response]), and 25 predictors (see [neanderthal_predictors]). Use [neanderthal_extra()] to download the associated environmental raster.
#'
#' @usage data(neanderthal)
#' @format An sf data frame with 227 rows (presence and pseudo-absence sites) and 27 columns:
#'
#' **Response variable (1):**
#' \itemize{
#'   \item `presence`: Binary integer (1 = Neanderthal presence site, 0 = pseudo-absence site).
#' }
#'
#' **Predictor variables:**
#'
#' Bioclimatic variables derived from a Last Interglacial GCM simulation
#' (Otto-Bliesner et al. 2006), downscaled following the method of Hijmans et al. (2005). These are analogous to the standard WorldClim bioclimatic variables but represent Last Interglacial (MIS 5e) conditions rather than modern climate:
#' \itemize{
#'   \item `bio1`: Annual mean temperature (degrees C).
#'   \item `bio2`: Mean diurnal range (degrees C).
#'   \item `bio3`: Isothermality (bio2/bio7 * 100).
#'   \item `bio4`: Temperature seasonality (standard deviation * 100).
#'   \item `bio5`: Max temperature of warmest month (degrees C).
#'   \item `bio6`: Min temperature of coldest month (degrees C).
#'   \item `bio7`: Temperature annual range (degrees C).
#'   \item `bio8`: Mean temperature of wettest quarter (degrees C).
#'   \item `bio9`: Mean temperature of driest quarter (degrees C).
#'   \item `bio10`: Mean temperature of warmest quarter (degrees C).
#'   \item `bio11`: Mean temperature of coldest quarter (degrees C).
#'   \item `bio12`: Annual precipitation (mm).
#'   \item `bio13`: Precipitation of wettest month (mm).
#'   \item `bio14`: Precipitation of driest month (mm).
#'   \item `bio15`: Precipitation seasonality (coefficient of variation).
#'   \item `bio16`: Precipitation of wettest quarter (mm).
#'   \item `bio17`: Precipitation of driest quarter (mm).
#'   \item `bio18`: Precipitation of warmest quarter (mm).
#'   \item `bio19`: Precipitation of coldest quarter (mm).
#'   \item `topo_aspect`: Aspect in degrees.
#'   \item `topo_diversity_local`: Local topographic diversity.
#'   \item `topo_diversity`: Regional topographic diversity.
#'   \item `topo_elev`: Elevation in meters.
#'   \item `topo_slope`: Slope in degrees.
#'   \item `topo_wetness`: Topographic wetness index.
#' }
#'
#' **Geometry:**
#' \itemize{
#'   \item `geometry`: Point geometry (WGS84, EPSG:4326).
#' }
#'
#' @source
#' **Presence data:**
#' \itemize{
#'   \item Benito, B.M., et al. (2017). The ecological niche and distribution of Neanderthals during the Last Interglacial. \emph{Journal of Biogeography}, 44, 51-61. \doi{10.1111/jbi.12845}
#'   \item Nielsen, T.K., Benito, B.M., Svenning, J.-C., Sandel, B., McKerracher, L., Riede, F., & Kjærgaard, P.C. (2017). Investigating Neanderthal dispersal above 55°N in Europe during the Last Interglacial Complex. \emph{Quaternary International}, 431, 88-103. \doi{10.1016/j.quaint.2015.10.039}
#' }
#'
#' **Palaeoclimatic variables (GCM simulation):**
#' \itemize{
#'   \item Otto-Bliesner, B.L., Marshall, S.J., Overpeck, J.T., Miller, G.H. & Hu, A. (2006). Simulating arctic climate warmth and icefield retreat in the last interglaciation. \emph{Science}, 311, 1751-1753.
#' }
#'
#' **Palaeoclimatic variables (interpolation):**
#' \itemize{
#'   \item Hijmans, R.J., Cameron, S.E., Parra, J.L., Jones, P.G. & Jarvis, A. (2005). Very high resolution interpolated climate surfaces for global land areas. \emph{International Journal of Climatology}, 25, 1965-1978.
#' }
#'
#' **Elevation and topography:**
#' \itemize{
#'   \item Jarvis, A., Guevara, E., Reuter, H. I., & Nelson, A. D. (2008). Hole-filled SRTM for the globe: version 4, data grid. Web publication/site, CGIAR Consortium for Spatial Information. \url{https://srtm.csi.cgiar.org}
#' }
#' @examples
#' data(neanderthal)
#' colnames(neanderthal)
#' nrow(neanderthal)
#' ncol(neanderthal)
#' @family neanderthal
"neanderthal"

#' @title Response variable name for the dataset `neanderthal`
#' @description Character string with the name of the response variable in [neanderthal].
#' @usage data(neanderthal_response)
#' @format A character string of length 1.
#' @examples
#' data(neanderthal_response)
#' neanderthal_response
#' @family neanderthal
"neanderthal_response"

#' @title Predictor variable names for the dataset `neanderthal`
#' @description Character vector of 25 predictor variable names from [neanderthal].
#' @usage data(neanderthal_predictors)
#' @format A character vector of length 25.
#' @examples
#' data(neanderthal_predictors)
#' neanderthal_predictors
#' @family neanderthal
"neanderthal_predictors"

#' Download Environmental Raster for neanderthal
#'
#' @description
#' Downloads and reads the environmental raster associated with the [neanderthal] dataset from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `neanderthal_env.tif` to the working directory and returns it as a `spatRaster` object.
#' 
#' @return SpatRaster object.
#' @family neanderthal
#' @export
neanderthal_extra <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "neanderthal_env.tif")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/neanderthal_env.tif"
    message(
      "spatialData::neanderthal_extra(): Downloading 'neanderthal_env.tif'."
    )
    tryCatch(
      utils::download.file(url, path, mode = "wb", quiet = TRUE),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::neanderthal_extra(): Download of \nURL: '",
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
