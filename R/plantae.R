#' @title Plant diversity metrics for the World's Ecoregions
#' @description Plant diversity metrics (richness, rarity, beta diversity) obtained from GBIF Plantae records for the World's Ecoregions. Includes metrics for all plants, trees, and grasses at species, genus, and family taxonomic levels. Ecoregion boundaries are derived from [Ecoregions 2017](https://ecoregions2017.appspot.com/). Original polygon geometries have been converted to point centroids to reduce file size while preserving spatial context. Use [plantae_extra()] to download a full version with original polygon geometries. The datasets [plantae_west] and [plantae_east] are subsets of `plantae` focused on overall plant richness of the western and easter hemispheres, respectively.
#'
#' The GBIF download comprised **244,830,168 records from 4,741 datasets**, filtered to records with coordinates, no geospatial issues, and occurrence status "present".
#'
#' **Tree species** were identified by cross-referencing GBIF records with the BGCI Global Tree Search database (BGCI 2020). **Grasses** were defined as members of family Poaceae.
#'
#'
#' **Rarity-weighted richness** was computed for each taxon as the inverse of
#' its number of spatial presence records in GBIF, then scores are summed per ecoregion, while **mean rarity** is the mean of these inverse presence record counts per taxon in an ecoregion.
#'
#' **Beta diversity** was computed between each ecoregion and its immediate neighboring ecoregions via Sorensen dissimilarity (`Bsor = 1 - 2a/(2a+b+c)`) and  Simpson dissimilarity (`Bsim = min(b,c)/(min(b,c)+a)`), following Koleff et al. (2003).
#'
#' **Fragmentation metrics** were computed with the R package `landscapemetrics`
#' (Hesselbarth et al. 2019) at 5 km resolution in Lambert Azimuthal Equal-Area projection.
#'
#' **Climate hypervolume** was computed using `hypervolume::hypervolume_svm()` from the climate predictors.
#'
#' **Aridity** is computed as 1 minus the aridity index of Trabucco and Zomer (2019), so maximum aridity is coded as 1.
#'
#' Environmental predictors were extracted as mean pixel values per ecoregion from rasters at
#' 1 km resolution.
#' @usage data(plantae)
#' @format An sf data frame with 662 rows (ecoregions) and 143 columns:
#'
#' **Identifier columns:**
#' \itemize{
#'   \item `ecoregion_id`: Unique ecoregion identifier.
#'   \item `ecoregion_name`: Ecoregion name.
#'   \item `ecoregion_biome`: Biome classification.
#'   \item `ecoregion_realm`: Biogeographic realm.
#'   \item `ecoregion_continent`: Continent name.
#' }
#'
#' **Response variables - Richness (9):**
#' \itemize{
#'   \item `richness_species`: Number of plant species.
#'   \item `richness_genera`: Number of plant genera.
#'   \item `richness_families`: Number of plant families.
#'   \item `richness_classes`: Number of plant classes.
#'   \item `richness_species_trees`: Number of tree species.
#'   \item `richness_genera_trees`: Number of tree genera.
#'   \item `richness_families_trees`: Number of tree families.
#'   \item `richness_species_grasses`: Number of grass species.
#'   \item `richness_genera_grasses`: Number of grass genera.
#' }
#'
#' **Response variables - Rarity-weighted richness (6):**
#' \itemize{
#'   \item `rarity_weighted_richness_species`: Rarity-weighted richness for species (sum of inverse spatial presence record counts per taxon; Williams et al. 1996).
#'   \item `rarity_weighted_richness_genera`: Rarity-weighted richness for genera (sum of inverse spatial presence record counts per taxon).
#'   \item `rarity_weighted_richness_species_trees`: Rarity-weighted richness for tree species (sum of inverse spatial presence record counts per taxon).
#'   \item `rarity_weighted_richness_genera_trees`: Rarity-weighted richness for tree genera (sum of inverse spatial presence record counts per taxon).
#'   \item `rarity_weighted_richness_species_grasses`: Rarity-weighted richness for grass species (sum of inverse spatial presence record counts per taxon).
#'   \item `rarity_weighted_richness_genera_grasses`: Rarity-weighted richness for grass genera (sum of inverse spatial presence record counts per taxon).
#' }
#'
#' **Response variables - Mean rarity (6):**
#' \itemize{
#'   \item `mean_rarity_species`: Mean rarity index for species (mean of inverse spatial presence record counts per taxon).
#'   \item `mean_rarity_genera`: Mean rarity index for genera (mean of inverse spatial presence record counts per taxon).
#'   \item `mean_rarity_species_trees`: Mean rarity index for tree species (mean of inverse spatial presence record counts per taxon).
#'   \item `mean_rarity_genera_trees`: Mean rarity index for tree genera (mean of inverse spatial presence record counts per taxon).
#'   \item `mean_rarity_species_grasses`: Mean rarity index for grass species (mean of inverse spatial presence record counts per taxon).
#'   \item `mean_rarity_genera_grasses`: Mean rarity index for grass genera (mean of inverse spatial presence record counts per taxon).
#' }
#'
#' **Response variables - Beta diversity R (absolute richness difference) (16):**
#' \itemize{
#'   \item `betadiversity_R_species`: Absolute richness difference between ecoregion and neighbors for species.
#'   \item `betadiversity_R_percent_species`: Absolute richness difference as percentage for species.
#'   \item `betadiversity_R_genera`: Absolute richness difference between ecoregion and neighbors for genera.
#'   \item `betadiversity_R_percent_genera`: Absolute richness difference as percentage for genera.
#'   \item `betadiversity_R_families`: Absolute richness difference between ecoregion and neighbors for families.
#'   \item `betadiversity_R_percent_families`: Absolute richness difference as percentage for families.
#'   \item `betadiversity_R_species_trees`: Absolute richness difference between ecoregion and neighbors for tree species.
#'   \item `betadiversity_R_percent_species_trees`: Absolute richness difference as percentage for tree species.
#'   \item `betadiversity_R_genera_trees`: Absolute richness difference between ecoregion and neighbors for tree genera.
#'   \item `betadiversity_R_percent_genera_trees`: Absolute richness difference as percentage for tree genera.
#'   \item `betadiversity_R_families_trees`: Absolute richness difference between ecoregion and neighbors for tree families.
#'   \item `betadiversity_R_percent_families_trees`: Absolute richness difference as percentage for tree families.
#'   \item `betadiversity_R_species_grasses`: Absolute richness difference between ecoregion and neighbors for grass species.
#'   \item `betadiversity_R_percent_species_grasses`: Absolute richness difference as percentage for grass species.
#'   \item `betadiversity_R_genera_grasses`: Absolute richness difference between ecoregion and neighbors for grass genera.
#'   \item `betadiversity_R_percent_genera_grasses`: Absolute richness difference as percentage for grass genera.
#' }
#'
#' **Response variables - Beta diversity Sorensen (8):**
#' \itemize{
#'   \item `betadiversity_sorensen_species`: Sorensen dissimilarity for species (Bsor = 1 - 2a/(2a+b+c); Koleff et al. 2003).
#'   \item `betadiversity_sorensen_genera`: Sorensen dissimilarity for genera (Bsor = 1 - 2a/(2a+b+c)).
#'   \item `betadiversity_sorensen_families`: Sorensen dissimilarity for families (Bsor = 1 - 2a/(2a+b+c)).
#'   \item `betadiversity_sorensen_species_trees`: Sorensen dissimilarity for tree species (Bsor = 1 - 2a/(2a+b+c)).
#'   \item `betadiversity_sorensen_genera_trees`: Sorensen dissimilarity for tree genera (Bsor = 1 - 2a/(2a+b+c)).
#'   \item `betadiversity_sorensen_families_trees`: Sorensen dissimilarity for tree families (Bsor = 1 - 2a/(2a+b+c)).
#'   \item `betadiversity_sorensen_species_grasses`: Sorensen dissimilarity for grass species (Bsor = 1 - 2a/(2a+b+c)).
#'   \item `betadiversity_sorensen_genera_grasses`: Sorensen dissimilarity for grass genera (Bsor = 1 - 2a/(2a+b+c)).
#' }
#'
#' **Response variables - Beta diversity Simpson (8):**
#' \itemize{
#'   \item `betadiversity_simpson_species`: Simpson dissimilarity for species (Bsim = min(b,c)/(min(b,c)+a); Koleff et al. 2003).
#'   \item `betadiversity_simpson_genera`: Simpson dissimilarity for genera (Bsim = min(b,c)/(min(b,c)+a)).
#'   \item `betadiversity_simpson_families`: Simpson dissimilarity for families (Bsim = min(b,c)/(min(b,c)+a)).
#'   \item `betadiversity_simpson_species_trees`: Simpson dissimilarity for tree species (Bsim = min(b,c)/(min(b,c)+a)).
#'   \item `betadiversity_simpson_genera_trees`: Simpson dissimilarity for tree genera (Bsim = min(b,c)/(min(b,c)+a)).
#'   \item `betadiversity_simpson_families_trees`: Simpson dissimilarity for tree families (Bsim = min(b,c)/(min(b,c)+a)).
#'   \item `betadiversity_simpson_species_grasses`: Simpson dissimilarity for grass species (Bsim = min(b,c)/(min(b,c)+a)).
#'   \item `betadiversity_simpson_genera_grasses`: Simpson dissimilarity for grass genera (Bsim = min(b,c)/(min(b,c)+a)).
#' }
#'
#' **Predictor variables:**
#' \itemize{
#'   \item `bias_log_records`: Logarithm of the total GBIF records in ecoregion.
#'   \item `geo_neighbors_count`: Number of neighboring ecoregions.
#'   \item `geo_neighbors_area_km2`: Total area of neighboring ecoregions in square kilometers.
#'   \item `geo_neighbors_aridity_mean`: Mean aridity of neighboring ecoregions.
#'   \item `geo_area_km2`: Ecoregion area in square kilometers.
#'   \item `geo_polygons_count`: Number of polygons in multipolygon geometry.
#'   \item `geo_perimeter_km`: Ecoregion perimeter in kilometers.
#'   \item `geo_shared_perimeter_km`: Shared perimeter with neighbors in kilometers.
#'   \item `geo_shared_perimeter_fraction`: Fraction of perimeter shared with neighbors.
#'   \item `geo_distance_to_ocean`: Distance to nearest ocean in kilometers.
#'   \item `geo_elevation_mean`: Mean elevation in meters.
#'   \item `human_population`: Total human population in ecoregion.
#'   \item `human_population_density`: Human population density per square kilometer.
#'   \item `human_footprint_mean`: Mean human footprint index.
#'   \item `climate_velocity_lgm_mean`: Mean climate velocity since Last Glacial Maximum.
#'   \item `climate_hypervolume`: Climate hypervolume (niche space size), computed with `hypervolume::hypervolume_svm()`.
#'   \item `air_humidity_max`: Maximum near-surface relative humidity (%).
#'   \item `air_humidity_mean`: Mean near-surface relative humidity (%).
#'   \item `air_humidity_min`: Minimum near-surface relative humidity (%).
#'   \item `air_humidity_range`: Near-surface relative humidity range (%).
#'   \item `aridity_mean`: Mean aridity (1 minus aridity index; higher values indicate greater aridity).
#'   \item `cloud_cover_max`: Maximum cloud cover (%).
#'   \item `cloud_cover_mean`: Mean cloud cover (%).
#'   \item `cloud_cover_min`: Minimum cloud cover (%).
#'   \item `cloud_cover_range`: Cloud cover range (%).
#'   \item `evapotranspiration_max`: Maximum potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_mean`: Mean potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_min`: Minimum potential evapotranspiration (kg m-2 month-1; Penman-Monteith).
#'   \item `evapotranspiration_range`: Potential evapotranspiration range (kg m-2 month-1; Penman-Monteith).
#'   \item `precipitation_seasonality`: Precipitation seasonality (coefficient of variation of monthly estimates; CHELSA bio15).
#'   \item `precipitation_total`: Total annual precipitation (kg m-2 year-1; CHELSA bio12).
#'   \item `precipitation_coldest_quarter`: Precipitation of coldest quarter (kg m-2; CHELSA bio19).
#'   \item `precipitation_driest_month`: Precipitation of driest month (kg m-2; CHELSA bio14).
#'   \item `precipitation_driest_quarter`: Precipitation of driest quarter (kg m-2; CHELSA bio17).
#'   \item `precipitation_warmest_quarter`: Precipitation of warmest quarter (kg m-2; CHELSA bio18).
#'   \item `precipitation_wettest_month`: Precipitation of wettest month (kg m-2; CHELSA bio13).
#'   \item `precipitation_wettest_quarter`: Precipitation of wettest quarter (kg m-2; CHELSA bio16).
#'   \item `temperature_isothermality`: Isothermality: ratio of diurnal to annual temperature variation (degrees C; CHELSA bio3).
#'   \item `temperature_mean_daily_range`: Mean diurnal temperature range (degrees C; CHELSA bio2).
#'   \item `temperature_mean`: Mean annual temperature (degrees C; CHELSA bio1).
#'   \item `temperature_range`: Annual temperature range (degrees C; CHELSA bio7).
#'   \item `temperature_seasonality`: Temperature seasonality as standard deviation of monthly means (degrees C; CHELSA bio4).
#'   \item `temperature_coldest_month`: Minimum temperature of coldest month (degrees C; CHELSA bio6).
#'   \item `temperature_coldest_quarter`: Mean temperature of coldest quarter (degrees C; CHELSA bio11).
#'   \item `temperature_driest_quarter`: Mean temperature of driest quarter (degrees C; CHELSA bio9).
#'   \item `temperature_warmest_month`: Maximum temperature of warmest month (degrees C; CHELSA bio5).
#'   \item `temperature_warmest_quarter`: Mean temperature of warmest quarter (degrees C; CHELSA bio10).
#'   \item `temperature_wettest_quarter`: Mean temperature of wettest quarter (degrees C; CHELSA bio8).
#'   \item `landcover_bare_percent_mean`: Mean percentage of bare ground.
#'   \item `landcover_herbs_percent_mean`: Mean percentage of herbaceous vegetation.
#'   \item `landcover_trees_percent_mean`: Mean percentage of tree cover.
#'   \item `fragmentation_ai`: Aggregation index.
#'   \item `fragmentation_area_mn`: Mean patch area.
#'   \item `fragmentation_ca`: Total class area.
#'   \item `fragmentation_clumpy`: Clumpiness index.
#'   \item `fragmentation_cohesion`: Patch cohesion index.
#'   \item `fragmentation_contig_mn`: Mean contiguity index.
#'   \item `fragmentation_core_mn`: Mean core area.
#'   \item `fragmentation_cpland`: Core area percentage of landscape.
#'   \item `fragmentation_dcore_mn`: Mean disjunct core area.
#'   \item `fragmentation_division`: Landscape division index.
#'   \item `fragmentation_ed`: Edge density.
#'   \item `fragmentation_lsi`: Landscape shape index.
#'   \item `fragmentation_mesh`: Effective mesh size.
#'   \item `fragmentation_ndca`: Number of disjunct core areas.
#'   \item `fragmentation_nlsi`: Normalized landscape shape index.
#'   \item `fragmentation_np`: Number of patches.
#'   \item `fragmentation_shape_mn`: Mean shape index.
#'   \item `fragmentation_tca`: Total core area.
#'   \item `fragmentation_te`: Total edge.
#'   \item `soil_clay`: Soil clay content (%).
#'   \item `soil_nitrogen`: Soil nitrogen content (%).
#'   \item `soil_organic_carbon`: Soil organic carbon content (%).
#'   \item `soil_ph`: Soil pH.
#'   \item `soil_sand`: Soil sand content (%).
#'   \item `soil_silt`: Soil silt content (%).
#'   \item `soil_temperature_max`: Maximum soil temperature (degrees C).
#'   \item `soil_temperature_mean`: Mean soil temperature (degrees C).
#'   \item `soil_temperature_min`: Minimum soil temperature (degrees C).
#'   \item `soil_temperature_range`: Soil temperature range (degrees C).
#'   \item `ndvi_max`: Maximum NDVI (1999-2019).
#'   \item `ndvi_mean`: Mean NDVI (1999-2019).
#'   \item `ndvi_min`: Minimum NDVI (1999-2019).
#'   \item `ndvi_range`: NDVI range (1999-2019).
#' }
#'
#' **Geometry:**
#' \itemize{
#'   \item `geometry`: Ecoregion centroids, POINT geometry (WGS84, EPSG:4326).
#' }
#'
#' @source
#' **Associated publications:**
#' \itemize{
#'   \item Maestre, F.T., Benito, B.M., Berdugo, M., Concostrina-Zubiri, L., Delgado-Baquerizo, M., Eldridge, D.J., Guirado, E., Gross, N., Kefi, S., Le Bagousse-Pinguet, Y., et al. (2021). Biogeography of global drylands. \emph{New Phytologist}, 231(2), 540--558. \doi{10.1111/nph.17398}
#'   \item GBIF Plantae Dataset (September 15, 2020). \doi{10.15468/dl.xh5y5g}
#'   \item Dinerstein, E., et al. (2017). An Ecoregion-Based Approach to Protecting Half the Terrestrial Realm. \emph{BioScience}, 67(6), 534-545. \doi{10.1093/biosci/bix014}
#'   \item Karger, D.N., et al. (2021). Climatologies at high resolution for the earth's land surface areas. EnviDat. \doi{10.16904/envidat.228.v2.1}
#'   \item Hengl, T., et al. (2017). SoilGrids250m: Global gridded soil information based on machine learning. \emph{PLOS ONE}, 12(2), e0169748. \doi{10.1371/journal.pone.0169748}
#'   \item Lembrechts, J.J., et al. (2021). Mismatches between soil and air temperature. \emph{Global Change Biology}. \doi{10.1111/gcb.16060}
#'   \item Copernicus Global Land Service: NDVI Long Term Statistics v3 (1999-2019). \url{https://land.copernicus.eu/en/products/vegetation}
#'   \item Buchhorn, M., et al. (2020). Copernicus Global Land Service: Land Cover 100m: collection 3: epoch 2019: Globe. Zenodo. \doi{10.5281/zenodo.3939050}
#'   \item CGIAR-CSI SRTM 90m Digital Elevation Database. \url{https://srtm.csi.cgiar.org/}
#'   \item Trabucco, A. & Zomer, R.J. (2019). Global Aridity Index and Potential Evapotranspiration Climate Database v2. CGIAR-CSI. \doi{10.6084/m9.figshare.7504448.v3}
#'   \item BGCI (2020). GlobalTreeSearch online database. Botanic Gardens Conservation International. \url{https://tools.bgci.org/global_tree_search.php}
#'   \item Hesselbarth, M.H.K., et al. (2019). landscapemetrics: an open-source R tool to calculate landscape metrics. \emph{Ecography}, 42(10), 1648-1657. \doi{10.1111/ecog.04617}
#'   \item Koleff, P., Gaston, K.J. & Lennon, J.J. (2003). Measuring beta diversity for presence-absence data. \emph{Journal of Animal Ecology}, 72(3), 367-382. \doi{10.1046/j.1365-2656.2003.00710.x}
#'   \item Williams, P.H., et al. (1996). A comparison of richness hotspots, rarity hotspots, and complementary areas for conserving diversity of British birds. \emph{Conservation Biology}, 10(1), 155-174.
#'   \item Venter, O., et al. (2016). Global terrestrial Human Footprint maps for 1993 and 2009. \emph{Scientific Data}, 3, 160067. \doi{10.1038/sdata.2016.67}
#' }
#'
#' @examples
#' data(plantae)
#' colnames(plantae)
#' nrow(plantae)
#' ncol(plantae)
#' @family plantae
"plantae"

#' @title Response variable names for the dataset `plantae`
#' @description Character vector containing the names of the 53 response variables in `plantae`.
#' @usage data(plantae_responses)
#' @format A character vector of length 53.
#' @examples
#' data(plantae_responses)
#' plantae_responses
#' @family plantae
"plantae_responses"

#' @title Predictor variable names for the dataset `plantae`
#' @description Character vector of 84 predictor variable names from `plantae`.
#' @usage data(plantae_predictors)
#' @format A character vector of length 84.
#' @examples
#' data(plantae_predictors)
#' plantae_predictors
#' @family plantae
"plantae_predictors"

#' Download Extended plantae Dataset
#'
#' @description
#' Downloads and reads the extended version of the [plantae] dataset with original polygon geometries instead of point centroids, from the [spatialDataExtra](https://github.com/BlasBenito/spatialDataExtra) repository. Writes the file `plantae.gpkg` to the working directory and returns it as an `sf` dataframe.
#' See [plantae] for details on the response variables, predictors, and data sources.
#'
#' 
#' @return sf dataframe with 662 rows and 143 columns (MULTIPOLYGON geometry, WGS84).
#' @family plantae
#' @export
plantae_extra <- function() {
  cache_dir <- tools::R_user_dir("spatialData", which = "data")
  dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
  path <- file.path(cache_dir, "plantae.gpkg")

  if (!file.exists(path)) {
    url <- "https://github.com/BlasBenito/spatialDataExtra/releases/latest/download/plantae.gpkg"
    message(
      "spatialData::plantae_extra(): Downloading file 'plantae.gpkg'."
    )
    tryCatch(
      utils::download.file(url, path, mode = "wb", quiet = TRUE),
      error = function(e) {
        unlink(path)
        stop(
          "spatialData::plantae_extra(): Download of \nURL: '",
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

#' @title Western Hemisphere subset of `plantae`
#' @description Subset of the [plantae] dataset filtered to American ecoregions (`ecoregion_continent == "Americas"`) with `richness_species` (overall plant species richness) as the only response variable. All 84 predictor variables and identifier columns in [plantae] are retained.
#' @usage data(plantae_west)
#' @format An sf data frame with 228 rows and 91 columns.
#' @examples
#' data(plantae_west)
#' colnames(plantae_west)
#' nrow(plantae_west)
#' ncol(plantae_west)
#' @family plantae
"plantae_west"

#' @title Eastern Hemisphere subset of `plantae`
#' @description Subset of the [plantae] dataset filtered to non-American ecoregions (`ecoregion_continent != "Americas"`) with `richness_species` (overall plant species richness) as the only response variable. All 84 predictor variables and identifier columns in [plantae] are retained.
#' @usage data(plantae_east)
#' @format An sf data frame with 434 rows and 91 columns.
#' @examples
#' data(plantae_east)
#' colnames(plantae_east)
#' nrow(plantae_east)
#' ncol(plantae_east)
#' @family plantae
"plantae_east"
