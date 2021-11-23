source('1_fetch/src/fetch_nhd_data.R')

p1 <- list(
  # Read in electronic supplementary material from this article:
  # https://link.springer.com/article/10.1007/s10661-020-08403-1
  tar_target(
    p1_esm_xlsx,
    '1_fetch/in/10661_2020_8403_MOESM1_ESM.xlsx',
    format = 'file'
  )
  # # commented out this code for now, since not yet using any nhd data
  # tar_target(
  #   p1_drb_huc8s, 
  #   c("02040101","02040102","02040103","02040104","02040105",
  #     "02040106","02040201","02040202","02040203","02040204",
  #     "02040205","02040206","02040207","02040301","02040302")),
  # 
  # # Get basin geometry
  # tar_target(p1_drb_sf, get_huc8(id = p1_drb_huc8s) %>% st_union() %>% st_make_valid()),
  # 
  # # Pull flowlines with stream order >= 3
  # tar_target(p1_drb_flowlines_SO3p, get_nhdplus(p1_drb_sf, streamorder = 3)),
  # 
  # # Extract comids for stream >= 3rd order
  # tar_target(p1_SO3p_comids, p1_drb_flowlines_SO3p$comid),
  # 
  # # Pull geometries for all huc8s within the basin
  # # not branching for now, b/c figured we might want to branch over
  # # each of the basins eventually
  # tar_target(p1_drb_hu8s_sf, 
  #            purrr::map(p1_drb_huc8s, function(huc8){ get_huc8(id = huc8) %>% st_make_valid()})),
  # 
  # # Pull flowlines for each huc8 (since too large to call for full basin)
  # # not branching for now, b/c figured we might want to branch over
  # # each of the basins eventually
  # tar_target(p1_drb_flowlines_SO1p,
  #            purrr::map_df(p1_drb_hu8s_sf, function(huc_geom) {get_nhdplus(huc_geom, streamorder = 1)})),
  # 
  # # get NWIS gages (mapping over huc8s)
  # # TODO - fix/check b/c seems to be returning gages outside of the basin...
  # tar_target(p1_drb_gages,
  #            purrr::map_df(p1_drb_hu8s_sf, function(huc_geom) {get_nwis(huc_geom)}))
)