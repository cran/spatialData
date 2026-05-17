# spatialData 1.0.1

- Fixed wrong doi in `R/plantae.R` and `README.md`.
- Dataset `vi_smol` is now an `sf` dataframe.
- `plantae_extra()`, `vi_extra()`, and `trees_extra()` now cache their result in memory for the duration of the R session. Subsequent calls within the same session return the cached object instantly without re-reading from disk.

# spatialData 1.0.0

First release of `spatialData` on CRAN, with the following datasets:

- `neanderthal`: Neanderthal presence/pseudo-absence records with 25 palaeoclimatic and topographic predictors (`neanderthal_response`, `neanderthal_predictors`).
- `vi`: Global NDVI records with 58 environmental predictors (`vi_responses`, `vi_predictors`, `vi_extra()`).
- `quercus`: Eight European oak species distribution with 31 environmental predictors (`quercus_response`, `quercus_predictors`, `quercus_extra()`).
- `plantae`: Plant diversity metrics for 662 global ecoregions with 84 environmental predictors (`plantae_responses`, `plantae_predictors`, `plantae_extra()`, `plantae_west()`, `plantae_east()`).
- `trees`: Tree species richness for Mesoamerican trees with 50 environmental predictors (`trees_response`, `trees_predictors`, `trees_extra()`).
- `communities`: Plant communities of Sierra Nevada (SE Spain) with 9 climate and topographic predictors (`communities_responses`, `communities_predictors`, `communities_extra_2010()`, `communities_extra_2050()`, `communities_extra_2100()`).
- `interaction`: Butterfly-host plant co-occurrence in Sierra Nevada with 10 environmental predictors (`interaction_responses`, `interaction_predictors`, `interaction_extra()`).
- `andalusia`: Presence records of 90 threatened plant species from Andalusia with 20 environmental predictors (`andalusia_responses`, `andalusia_predictors`, `andalusia_extra()`).
- `linaria`: *Linaria nigricans* presence records in Eastern Andalusia with 20 environmental predictors (`linaria_responses`, `linaria_predictors`, `linaria_extra()`).
