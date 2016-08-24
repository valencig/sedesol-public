/* first, include the manzana link in sifode data */
CREATE INDEX semantic_pub_imputation_sifode_manzana_link_pub_id_idx ON semantic_pub_imputation.sifode(sifode_pub_id);
CREATE INDEX clean_manzana_link_pub_id_idx ON clean.manzana_link(sifode_pub_id);

WITH manzana_link AS
(SELECT
manzana_id AS manzana_id,
manzana_dist AS manzana_dist,
id_unico AS sifode_pub_id
FROM raw.manzana_link)

SELECT * INTO
semantic_pub_imputation.sifode_geo
FROM (SELECT * FROM
semantic_pub_imputation.sifode
LEFT JOIN manzana_link
USING (sifode_pub_id)) joined;


/* now join in manzana & locality information */
WITH sifode AS semantic_pub_imputation.sifde,
WITH localidades AS
(SELECT
locality_id,
localidades_locality_name,
localidades_municipality_name,
localidades_state_name,
localidades_urban,
localidades_population,
localidades_population_female,
localidades_population_age_0_to_2,
localidades_population_age_0_to_2_female,
localidades_population_age_greater_3,
localidades_population_age_greater_3_female,
localidades_population_age_greater_5,
localidades_population_age_greater_5_female,
localidades_population_age_greater_12,
localidades_population_age_greater_12_female,
localidades_population_age_greater_15,
localidades_population_age_greater_15_female,
localidades_population_age_greater_18,
localidades_population_age_greater_18_female,
localidades_population_age_greater_60,
localidades_population_age_greater_60_female,
localidades_fertility_rate,
localidades_population_born_in_state,
localidades_population_men_born_in_state,
localidades_population_born_out_of_state,
localidades_population_men_born_out_of_state,
localidades_population_immigrant_since_2005,
localidades_population_immigrant_men_since_2005,
localidades_population_speak_indigenous,
localidades_population_male_speak_indigenous,
localidades_population_not_speak_spanish,
localidades_population_male_not_speak_spanish,
localidades_population_speak_indigenous_and_spanish,
localidades_population_male_speak_indigenous_and_spanish,
localidades_n_indigenous_households,
localidades_population_limited_activity,
localidades_population_limited_mobility,
localidades_population_limited_vision,
localidades_population_limited_speaking,
localidades_population_limited_hearing,
localidades_population_limited_senility,
localidades_population_limited_mental,
localidades_population_ages_3_5_no_school,
localidades_population_male_ages_3_5_no_school,
localidades_population_ages_6_11_no_school,
localidades_population_male_ages_6_11_no_school,
localidades_population_ages_12_14_no_school,
localidades_population_male_ages_12_14_no_school,
localidades_population_ages_15_17_in_school,
localidades_population_male_ages_15_17_in_school,
localidades_population_ages_18_24_in_school,
localidades_population_male_ages_18_24_in_school,
localidades_population_ages_8_14_illiterate,
localidades_population_male_ages_8_14_illiterate,
localidades_population_age_over_15_illiterate,
localidades_population_male_age_over_15_illiterate,
localidades_population_age_over_15_no_school,
localidades_population_male_age_over_15_no_school,
localidades_population_age_over_15_no_primary_school,
localidades_population_male_age_over_15_no_primary_school,
localidades_population_age_over_15_no_secondary_school,
localidades_population_male_age_over_15_no_secondary_school,
localidades_population_age_over_18_basic_schooling,
localidades_population_male_age_over_18_basic_schooling,
localidades_population_economically_active,
localidades_population_male_economically_active,
localidades_population_not_economically_active,
localidades_population_male_not_economically_active,
localidades_population_employed,
localidades_population_male_employed,
localidades_population_unemployed,
localidades_population_male_unemployed,
localidades_population_no_health_services,
localidades_population_entitled_to_health_services,
localidades_population_covered_by_imss,
localidades_population_covered_by_issste,
localidades_population_covered_by_state_issste,
localidades_population_covered_by_seguro_popular,
localidades_population_over_12_unmarried,
localidades_population_over_12_married,
localidades_population_over_12_divorced,
localidades_population_catholic,
localidades_population_other_christian,
localidades_population_other_religions,
localidades_population_non_religious,
localidades_n_census_households,
localidades_n_male_head_of_household,
localidades_n_female_head_of_household,
localidades_n_census_persons,
localidades_n_people_private_homes,
localidades_average_number_home_occupants,
localidades_average_number_occupants_per_room,
localidades_n_different_floor_material,
localidades_n_private_homes_dirt_floors,
localidades_n_homes_with_one_bedroom,
localidades_n_homes_with_at_least_two_bedrooms,
localidades_n_homes_with_one_room,
localidades_n_homes_with_two_rooms,
localidades_n_homes_with_three_or_more_rooms,
localidades_n_homes_with_electricity,
localidades_n_homes_without_electricity,
localidades_n_homes_with_plumbing,
localidades_n_homes_without_plumbing,
localidades_n_homes_with_toilet,
localidades_n_homes_with_sewage_access,
localidades_n_homes_with_full_infrastructure,
localidades_n_homes_without_any_goods,
localidades_n_homes_with_radio,
localidades_n_homes_with_tv,
localidades_n_homes_with_refigerador,
localidades_n_homes_with_washing_machine,
localidades_n_homes_with_car,
localidades_n_homes_with_computer,
localidades_n_homes_with_telephone,
localidades_n_homes_with_cell_hone,
localidades_n_homes_with_internet,
localidades_n_households_in_poverty,
localidades_n_people_in_poverty,
localidades_n_housholds_without_basic_housing_services,
localidades_n_people_without_basic_housing_services,
localidades_n_households_without_water,
localidades_n_people_without_water,
localidades_n_households_without_sewage,
localidades_n_people_without_sewage,
localidades_n_households_without_electricity,
localidades_n_people_without_electricity,
localidades_n_households_without_quality_living_space,
localidades_n_people_without_quality_living_space,
localidades_n_households_dirt_floor,
localidades_n_people_dirt_floor,
localidades_n_households_overcrowding,
localidades_n_people_overcrowding,
localidades_n_households_no_health,
localidades_n_people_no_health,
localidades_n_households_lack_education,
localidades_n_people_lack_education,
localidades_latitude,
localidades_longitude,
localidades_locality_id,
localidades_locality_name,
localidades_municipality_name,
localidades_state_name,
localidades_urban,
localidades_population,
localidades_population_female,
localidades_population_age_0_to_2,
localidades_population_age_0_to_2_female,
localidades_population_age_greater_3,
localidades_population_age_greater_3_female,
localidades_population_age_greater_5,
localidades_population_age_greater_5_female,
localidades_population_age_greater_12,
localidades_population_age_greater_12_female,
localidades_population_age_greater_15,
localidades_population_age_greater_15_female,
localidades_population_age_greater_18,
localidades_population_age_greater_18_female,
localidades_population_age_greater_60,
localidades_population_age_greater_60_female,
localidades_fertility_rate,
localidades_population_born_in_state,
localidades_population_men_born_in_state,
localidades_population_born_out_of_state,
localidades_population_men_born_out_of_state,
localidades_population_immigrant_since_2005,
localidades_population_immigrant_men_since_2005,
localidades_population_speak_indigenous,
localidades_population_male_speak_indigenous,
localidades_population_not_speak_spanish,
localidades_population_male_not_speak_spanish,
localidades_population_speak_indigenous_and_spanish,
localidades_population_male_speak_indigenous_and_spanish,
localidades_n_indigenous_households,
localidades_population_limited_activity,
localidades_population_limited_mobility,
localidades_population_limited_vision,
localidades_population_limited_speaking,
localidades_population_limited_hearing,
localidades_population_limited_senility,
localidades_population_limited_mental,
localidades_population_ages_3_5_no_school,
localidades_population_male_ages_3_5_no_school,
localidades_population_ages_6_11_no_school,
localidades_population_male_ages_6_11_no_school,
localidades_population_ages_12_14_no_school,
localidades_population_male_ages_12_14_no_school,
localidades_population_ages_15_17_in_school,
localidades_population_male_ages_15_17_in_school,
localidades_population_ages_18_24_in_school,
localidades_population_male_ages_18_24_in_school,
localidades_population_ages_8_14_illiterate,
localidades_population_male_ages_8_14_illiterate,
localidades_population_age_over_15_illiterate,
localidades_population_male_age_over_15_illiterate,
localidades_population_age_over_15_no_school,
localidades_population_male_age_over_15_no_school,
localidades_population_age_over_15_no_primary_school,
localidades_population_male_age_over_15_no_primary_school,
localidades_population_age_over_15_no_secondary_school,
localidades_population_male_age_over_15_no_secondary_school,
localidades_population_age_over_18_basic_schooling,
localidades_population_male_age_over_18_basic_schooling,
localidades_population_economically_active,
localidades_population_male_economically_active,
localidades_population_not_economically_active,
localidades_population_male_not_economically_active,
localidades_population_employed,
localidades_population_male_employed,
localidades_population_unemployed,
localidades_population_male_unemployed,
localidades_population_no_health_services,
localidades_population_entitled_to_health_services,
localidades_population_covered_by_imss,
localidades_population_covered_by_issste,
localidades_population_covered_by_state_issste,
localidades_population_covered_by_seguro_popular,
localidades_population_over_12_unmarried,
localidades_population_over_12_married,
localidades_population_over_12_divorced,
localidades_population_catholic,
localidades_population_other_christian,
localidades_population_other_religions,
localidades_population_non_religious,
localidades_n_census_households,
localidades_n_male_head_of_household,
localidades_n_female_head_of_household,
localidades_n_census_persons,
localidades_n_people_private_homes,
localidades_average_number_home_occupants,
localidades_average_number_occupants_per_room,
localidades_n_different_floor_material,
localidades_n_private_homes_dirt_floors,
localidades_n_homes_with_one_bedroom,
localidades_n_homes_with_at_least_two_bedrooms,
localidades_n_homes_with_one_room,
localidades_n_homes_with_two_rooms,
localidades_n_homes_with_three_or_more_rooms,
localidades_n_homes_with_electricity,
localidades_n_homes_without_electricity,
localidades_n_homes_with_plumbing,
localidades_n_homes_without_plumbing,
localidades_n_homes_with_toilet,
localidades_n_homes_with_sewage_access,
localidades_n_homes_with_full_infrastructure,
localidades_n_homes_without_any_goods,
localidades_n_homes_with_radio,
localidades_n_homes_with_tv,
localidades_n_homes_with_refigerador,
localidades_n_homes_with_washing_machine,
localidades_n_homes_with_car,
localidades_n_homes_with_computer,
localidades_n_homes_with_telephone,
localidades_n_homes_with_cell_hone,
localidades_n_homes_with_internet,
localidades_n_households_in_poverty,
localidades_n_people_in_poverty,
localidades_n_housholds_without_basic_housing_services,
localidades_n_people_without_basic_housing_services,
localidades_n_households_without_water,
localidades_n_people_without_water,
localidades_n_households_without_sewage,
localidades_n_people_without_sewage,
localidades_n_households_without_electricity,
localidades_n_people_without_electricity,
localidades_n_households_without_quality_living_space,
localidades_n_people_without_quality_living_space,
localidades_n_households_dirt_floor,
localidades_n_people_dirt_floor,
localidades_n_households_overcrowding,
localidades_n_people_overcrowding,
localidades_n_households_no_health,
localidades_n_people_no_health,
localidades_n_households_lack_education,
localidades_n_people_lack_education,
localidades_latitude,
localidades_longitude
FROM clean.localidades),

WITH manzanas AS

(SELECT
manzana_gid,
manzana_cve_ent,
manzana_cve_munc,
manzana_cve_locc,
manzana_cve_agebc,
manzana_cve_mzac,
manzana_nom_ent,
manzana_abr_ent,
manzana_nom_mun,
manzana_nom_loc,
manzana_manzana_id,
manzana_locality_id,
manzana_locality_name,
manzana_municipality_name,
manzana_state_name,
manzana_urban,
manzana_population,
manzana_population_female,
manzana_population_age_0_to_2,
manzana_population_age_0_to_2_female,
manzana_population_age_greater_3,
manzana_population_age_greater_3_female,
manzana_population_age_greater_5,
manzana_population_age_greater_5_female,
manzana_population_age_greater_12,
manzana_population_age_greater_12_female,
manzana_population_age_greater_15,
manzana_population_age_greater_15_female,
manzana_population_age_greater_18,
manzana_population_age_greater_18_female,
manzana_population_age_greater_60,
manzana_population_age_greater_60_female,
manzana_fertility_rate,
manzana_population_born_in_state,
manzana_population_men_born_in_state,
manzana_population_born_out_of_state,
manzana_population_men_born_out_of_state,
manzana_population_immigrant_since_2005,
manzana_population_immigrant_men_since_2005,
manzana_population_speak_indigenous,
manzana_population_male_speak_indigenous,
manzana_population_not_speak_spanish,
manzana_population_male_not_speak_spanish,
manzana_population_speak_indigenous_and_spanish,
manzana_population_male_speak_indigenous_and_spanish,
manzana_n_indigenous_households,
manzana_population_limited_activity,
manzana_population_limited_mobility,
manzana_population_limited_vision,
manzana_population_limited_speaking,
manzana_population_limited_hearing,
manzana_population_limited_senility,
manzana_population_limited_mental,
manzana_population_ages_3_5_no_school,
manzana_population_male_ages_3_5_no_school,
manzana_population_ages_6_11_no_school,
manzana_population_male_ages_6_11_no_school,
manzana_population_ages_12_14_no_school,
manzana_population_male_ages_12_14_no_school,
manzana_population_ages_15_17_in_school,
manzana_population_male_ages_15_17_in_school,
manzana_population_ages_18_24_in_school,
manzana_population_male_ages_18_24_in_school,
manzana_population_ages_8_14_illiterate,
manzana_population_male_ages_8_14_illiterate,
manzana_population_age_over_15_illiterate,
manzana_population_male_age_over_15_illiterate,
manzana_population_age_over_15_no_school,
manzana_population_male_age_over_15_no_school,
manzana_population_age_over_15_no_primary_school,
manzana_population_male_age_over_15_no_primary_school,
manzana_population_age_over_15_no_secondary_school,
manzana_population_male_age_over_15_no_secondary_school,
manzana_population_age_over_18_basic_schooling,
manzana_population_male_age_over_18_basic_schooling,
manzana_population_economically_active,
manzana_population_male_economically_active,
manzana_population_not_economically_active,
manzana_population_male_not_economically_active,
manzana_population_employed,
manzana_population_male_employed,
manzana_population_unemployed,
manzana_population_male_unemployed,
manzana_population_no_health_services,
manzana_population_entitled_to_health_services,
manzana_population_covered_by_imss,
manzana_population_covered_by_issste,
manzana_population_covered_by_state_issste,
manzana_population_covered_by_seguro_popular,
manzana_population_over_12_unmarried,
manzana_population_over_12_married,
manzana_population_over_12_divorced,
manzana_population_catholic,
manzana_population_other_christian,
manzana_population_other_religions,
manzana_population_non_religious,
manzana_n_census_households,
manzana_n_male_head_of_household,
manzana_n_female_head_of_household,
manzana_n_census_persons,
manzana_n_people_private_homes,
manzana_average_number_home_occupants,
manzana_average_number_occupants_per_room,
manzana_n_different_floor_material,
manzana_n_private_homes_dirt_floors,
manzana_n_homes_with_one_bedroom,
manzana_n_homes_with_at_least_two_bedrooms,
manzana_n_homes_with_one_room,
manzana_n_homes_with_two_rooms,
manzana_n_homes_with_three_or_more_rooms,
manzana_n_homes_with_electricity,
manzana_n_homes_without_electricity,
manzana_n_homes_with_plumbing,
manzana_n_homes_without_plumbing,
manzana_n_homes_with_toilet,
manzana_n_homes_with_sewage_access,
manzana_n_homes_with_full_infrastructure,
manzana_n_homes_without_any_goods,
manzana_n_homes_with_radio,
manzana_n_homes_with_tv,
manzana_n_homes_with_refigerador,
manzana_n_homes_with_washing_machine,
manzana_n_homes_with_car,
manzana_n_homes_with_computer,
manzana_n_homes_with_telephone,
manzana_n_homes_with_cell_hone,
manzana_n_homes_with_internet,
manzana_n_households_in_poverty,
manzana_n_people_in_poverty,
manzana_n_housholds_without_basic_housing_services,
manzana_n_people_without_basic_housing_services,
manzana_n_households_without_water,
manzana_n_people_without_water,
manzana_n_households_without_sewage,
manzana_n_people_without_sewage,
manzana_n_households_without_electricity,
manzana_n_people_without_electricity,
manzana_n_households_without_quality_living_space,
manzana_n_people_without_quality_living_space,
manzana_n_households_dirt_floor,
manzana_n_people_dirt_floor,
manzana_n_households_overcrowding,
manzana_n_people_overcrowding,
manzana_n_households_no_health,
manzana_n_people_no_health,
manzana_n_households_lack_education,
manzana_n_people_lack_education,
manzana_latitude,
manzana_longitude,
manzana_manzana_id,
manzana_geom,
manzana_locality_id,
manzana_locality_name,
manzana_municipality_name,
manzana_state_name,
manzana_urban,
manzana_population,
manzana_population_female,
manzana_population_age_0_to_2,
manzana_population_age_0_to_2_female,
manzana_population_age_greater_3,
manzana_population_age_greater_3_female,
manzana_population_age_greater_5,
manzana_population_age_greater_5_female,
manzana_population_age_greater_12,
manzana_population_age_greater_12_female,
manzana_population_age_greater_15,
manzana_population_age_greater_15_female,
manzana_population_age_greater_18,
manzana_population_age_greater_18_female,
manzana_population_age_greater_60,
manzana_population_age_greater_60_female,
manzana_manzana_fertility_rate,
manzana_population_born_in_state,
manzana_population_immigrant_since_2005,
manzana_population_speak_indigenous,
manzana_population_not_speak_spanish,
manzana_population_speak_indigenous_and_spanish,
manzana_n_indigenous_households,
manzana_population_limited_activity,
manzana_population_limited_mobility,
manzana_population_limited_mental,
manzana_population_ages_3_5_no_school,
manzana_population_ages_6_11_no_school,
manzana_population_ages_12_14_no_school,
manzana_population_ages_15_17_in_school,
manzana_population_ages_18_24_in_school,
manzana_population_ages_8_14_illiterate,
manzana_population_age_over_15_illiterate,
manzana_population_age_over_15_no_school,
manzana_population_age_over_15_no_primary_school,
manzana_population_age_over_15_no_secondary_school,
manzana_population_age_over_18_basic_schooling,
manzana_n_housholds_without_basic_housing_services,
manzana_n_people_without_basic_housing_services,
manzana_n_households_without_water,
manzana_n_people_without_water,
manzana_n_households_without_sewage,
manzana_n_people_without_sewage,
manzana_n_households_without_electricity,
manzana_n_people_without_electricity,
manzana_n_households_without_quality_living_space,
manzana_n_people_without_quality_living_space,
manzana_n_households_dirt_floor,
manzana_n_people_dirt_floor,
manzana_n_households_overcrowding,
manzana_n_people_overcrowding,
manzana_n_households_no_health,
manzana_n_people_no_health,
manzana_n_households_lack_education,
manzana_n_people_lack_education,
manzana_latitude,
manzana_longitude,
manzana_manzana_id,
manzana_geom,
manzana_locality_id,
manzana_locality_name,
manzana_municipality_name,
manzana_state_name,
manzana_urban,
manzana_population,
manzana_population_female,
manzana_population_age_0_to_2,
manzana_population_age_0_to_2_female,
manzana_population_age_greater_3,
manzana_population_age_greater_3_female,
manzana_population_age_greater_5,
manzana_population_age_greater_5_female,
manzana_population_age_greater_12,
manzana_population_age_greater_12_female,
manzana_population_age_greater_15,
manzana_population_age_greater_15_female,
manzana_population_age_greater_18,
manzana_population_age_greater_18_female,
manzana_population_age_greater_60,
manzana_population_age_greater_60_female,
manzana_fertility_rate,
manzana_population_born_in_state,
manzana_population_men_born_in_state,
manzana_population_born_out_of_state,
manzana_population_men_born_out_of_state,
manzana_population_immigrant_since_2005,
manzana_population_immigrant_men_since_2005,
manzana_population_speak_indigenous,
manzana_population_male_speak_indigenous,
manzana_population_not_speak_spanish,
manzana_population_male_not_speak_spanish,
manzana_population_speak_indigenous_and_spanish,
manzana_population_male_speak_indigenous_and_spanish,
manzana_n_indigenous_households,
manzana_population_limited_activity,
manzana_population_limited_mobility,
manzana_population_limited_vision,
manzana_population_limited_speaking,
manzana_population_limited_hearing,
manzana_population_limited_senility,
manzana_population_limited_mental,
manzana_population_ages_3_5_no_school,
manzana_population_male_ages_3_5_no_school,
manzana_population_ages_6_11_no_school,
manzana_population_male_ages_6_11_no_school,
manzana_population_ages_12_14_no_school,
manzana_population_male_ages_12_14_no_school,
manzana_population_ages_15_17_in_school,
manzana_population_male_ages_15_17_in_school,
manzana_population_ages_18_24_in_school,
manzana_population_male_ages_18_24_in_school,
manzana_population_ages_8_14_illiterate,
manzana_population_male_ages_8_14_illiterate,
manzana_population_age_over_15_illiterate,
manzana_population_male_age_over_15_illiterate,
manzana_population_age_over_15_no_school,
manzana_population_male_age_over_15_no_school,
manzana_population_age_over_15_no_primary_school,
manzana_population_male_age_over_15_no_primary_school,
manzana_population_age_over_15_no_secondary_school,
manzana_population_male_age_over_15_no_secondary_school,
manzana_population_age_over_18_basic_schooling,
manzana_population_male_age_over_18_basic_schooling,
manzana_population_economically_active,
manzana_population_male_economically_active,
manzana_population_not_economically_active,
manzana_population_male_not_economically_active,
manzana_population_employed,
manzana_population_male_employed,
manzana_population_unemployed,
manzana_population_male_unemployed,
manzana_population_no_health_services,
manzana_population_entitled_to_health_services,
manzana_population_covered_by_imss,
manzana_population_covered_by_issste,
manzana_population_covered_by_state_issste,
manzana_population_covered_by_seguro_popular,
manzana_population_over_12_unmarried,
manzana_population_over_12_married,
manzana_population_over_12_divorced,
manzana_population_catholic,
manzana_population_other_christian,
manzana_population_other_religions,
manzana_population_non_religious,
manzana_n_census_households,
manzana_n_male_head_of_household,
manzana_n_female_head_of_household,
manzana_n_census_persons,
manzana_n_people_private_homes,
manzana_average_number_home_occupants,
manzana_average_number_occupants_per_room,
manzana_n_different_floor_material,
manzana_n_private_homes_dirt_floors,
manzana_n_homes_with_one_bedroom,
manzana_n_homes_with_at_least_two_bedrooms,
manzana_n_homes_with_one_room,
manzana_n_homes_with_two_rooms,
manzana_n_homes_with_three_or_more_rooms,
manzana_n_homes_with_electricity,
manzana_n_homes_without_electricity,
manzana_n_homes_with_plumbing,
manzana_n_homes_without_plumbing,
manzana_n_homes_with_toilet,
manzana_n_homes_with_sewage_access,
manzana_n_homes_with_full_infrastructure,
manzana_n_homes_without_any_goods,
manzana_n_homes_with_radio,
manzana_n_homes_with_tv,
manzana_n_homes_with_refigerador,
manzana_n_homes_with_washing_machine,
manzana_n_homes_with_car,
manzana_n_homes_with_computer,
manzana_n_homes_with_telephone,
manzana_n_homes_with_cell_hone,
manzana_n_homes_with_internet,
manzana_n_households_in_poverty,
manzana_n_people_in_poverty,
manzana_n_housholds_without_basic_housing_services,
manzana_n_people_without_basic_housing_services,
manzana_n_households_without_water,
manzana_n_people_without_water,
manzana_n_households_without_sewage,
manzana_n_people_without_sewage,
manzana_n_households_without_electricity,
manzana_n_people_without_electricity,
manzana_n_households_without_quality_living_space,
manzana_n_people_without_quality_living_space,
manzana_n_households_dirt_floor,
manzana_n_people_dirt_floor,
manzana_n_households_overcrowding,
manzana_n_people_overcrowding,
manzana_n_households_no_health,
manzana_n_people_no_health,
manzana_n_households_lack_education,
manzana_n_people_lack_education,
manzana_latitude,
manzana_longitude)

SELECT * FROM
semantic_pub_imputation.sifode
LEFT JOIN localidades
USING (locality_id)
LEFT JOIN manzanas
USING (manzana_id);