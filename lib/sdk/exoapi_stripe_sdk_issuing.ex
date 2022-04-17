defmodule ExOAPI.Stripe.SDK.Issuing do
  @doc """
  **description**: <p>Updates the specified Issuing <code>Authorization</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_authorizations_authorization(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          authorization :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_authorizations_authorization(%ExOAPI.Client{} = client, body, authorization) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Authorization</code> object.</p>

  """
  @type get_issuing_authorizations_authorization_opts :: {:expand, String.t()}
  @spec get_issuing_authorizations_authorization(
          client :: ExOAPI.Client.t(),
          authorization :: String.t(),
          list(get_issuing_authorizations_authorization_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_authorizations_authorization(
        %ExOAPI.Client{} = client,
        authorization,
        opts \\ []
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}")
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Card</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_cards_card(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :status => String.t() | :active | :canceled | :inactive,
              :spending_controls => %{
                :spending_limits => [
                  %{
                    :interval =>
                      String.t()
                      | :all_time
                      | :daily
                      | :monthly
                      | :per_authorization
                      | :weekly
                      | :yearly,
                    :categories => [
                      String.t()
                      | :ac_refrigeration_repair
                      | :accounting_bookkeeping_services
                      | :advertising_services
                      | :agricultural_cooperative
                      | :airlines_air_carriers
                      | :airports_flying_fields
                      | :ambulance_services
                      | :amusement_parks_carnivals
                      | :antique_reproductions
                      | :antique_shops
                      | :aquariums
                      | :architectural_surveying_services
                      | :art_dealers_and_galleries
                      | :artists_supply_and_craft_shops
                      | :auto_and_home_supply_stores
                      | :auto_body_repair_shops
                      | :auto_paint_shops
                      | :auto_service_shops
                      | :automated_cash_disburse
                      | :automated_fuel_dispensers
                      | :automobile_associations
                      | :automotive_parts_and_accessories_stores
                      | :automotive_tire_stores
                      | :bail_and_bond_payments
                      | :bakeries
                      | :bands_orchestras
                      | :barber_and_beauty_shops
                      | :betting_casino_gambling
                      | :bicycle_shops
                      | :billiard_pool_establishments
                      | :boat_dealers
                      | :boat_rentals_and_leases
                      | :book_stores
                      | :books_periodicals_and_newspapers
                      | :bowling_alleys
                      | :bus_lines
                      | :business_secretarial_schools
                      | :buying_shopping_services
                      | :cable_satellite_and_other_pay_television_and_radio
                      | :camera_and_photographic_supply_stores
                      | :candy_nut_and_confectionery_stores
                      | :car_and_truck_dealers_new_used
                      | :car_and_truck_dealers_used_only
                      | :car_rental_agencies
                      | :car_washes
                      | :carpentry_services
                      | :carpet_upholstery_cleaning
                      | :caterers
                      | :charitable_and_social_service_organizations_fundraising
                      | :chemicals_and_allied_products
                      | :child_care_services
                      | :childrens_and_infants_wear_stores
                      | :chiropodists_podiatrists
                      | :chiropractors
                      | :cigar_stores_and_stands
                      | :civic_social_fraternal_associations
                      | :cleaning_and_maintenance
                      | :clothing_rental
                      | :colleges_universities
                      | :commercial_equipment
                      | :commercial_footwear
                      | :commercial_photography_art_and_graphics
                      | :commuter_transport_and_ferries
                      | :computer_network_services
                      | :computer_programming
                      | :computer_repair
                      | :computer_software_stores
                      | :computers_peripherals_and_software
                      | :concrete_work_services
                      | :construction_materials
                      | :consulting_public_relations
                      | :correspondence_schools
                      | :cosmetic_stores
                      | :counseling_services
                      | :country_clubs
                      | :courier_services
                      | :court_costs
                      | :credit_reporting_agencies
                      | :cruise_lines
                      | :dairy_products_stores
                      | :dance_hall_studios_schools
                      | :dating_escort_services
                      | :dentists_orthodontists
                      | :department_stores
                      | :detective_agencies
                      | :digital_goods_applications
                      | :digital_goods_games
                      | :digital_goods_large_volume
                      | :digital_goods_media
                      | :direct_marketing_catalog_merchant
                      | :direct_marketing_combination_catalog_and_retail_merchant
                      | :direct_marketing_inbound_telemarketing
                      | :direct_marketing_insurance_services
                      | :direct_marketing_other
                      | :direct_marketing_outbound_telemarketing
                      | :direct_marketing_subscription
                      | :direct_marketing_travel
                      | :discount_stores
                      | :doctors
                      | :door_to_door_sales
                      | :drapery_window_covering_and_upholstery_stores
                      | :drinking_places
                      | :drug_stores_and_pharmacies
                      | :drugs_drug_proprietaries_and_druggist_sundries
                      | :dry_cleaners
                      | :durable_goods
                      | :duty_free_stores
                      | :eating_places_restaurants
                      | :educational_services
                      | :electric_razor_stores
                      | :electrical_parts_and_equipment
                      | :electrical_services
                      | :electronics_repair_shops
                      | :electronics_stores
                      | :elementary_secondary_schools
                      | :employment_temp_agencies
                      | :equipment_rental
                      | :exterminating_services
                      | :family_clothing_stores
                      | :fast_food_restaurants
                      | :financial_institutions
                      | :fines_government_administrative_entities
                      | :fireplace_fireplace_screens_and_accessories_stores
                      | :floor_covering_stores
                      | :florists
                      | :florists_supplies_nursery_stock_and_flowers
                      | :freezer_and_locker_meat_provisioners
                      | :fuel_dealers_non_automotive
                      | :funeral_services_crematories
                      | :furniture_home_furnishings_and_equipment_stores_except_appliances
                      | :furniture_repair_refinishing
                      | :furriers_and_fur_shops
                      | :general_services
                      | :gift_card_novelty_and_souvenir_shops
                      | :glass_paint_and_wallpaper_stores
                      | :glassware_crystal_stores
                      | :golf_courses_public
                      | :government_services
                      | :grocery_stores_supermarkets
                      | :hardware_equipment_and_supplies
                      | :hardware_stores
                      | :health_and_beauty_spas
                      | :hearing_aids_sales_and_supplies
                      | :heating_plumbing_a_c
                      | :hobby_toy_and_game_shops
                      | :home_supply_warehouse_stores
                      | :hospitals
                      | :hotels_motels_and_resorts
                      | :household_appliance_stores
                      | :industrial_supplies
                      | :information_retrieval_services
                      | :insurance_default
                      | :insurance_underwriting_premiums
                      | :intra_company_purchases
                      | :jewelry_stores_watches_clocks_and_silverware_stores
                      | :landscaping_services
                      | :laundries
                      | :laundry_cleaning_services
                      | :legal_services_attorneys
                      | :luggage_and_leather_goods_stores
                      | :lumber_building_materials_stores
                      | :manual_cash_disburse
                      | :marinas_service_and_supplies
                      | :masonry_stonework_and_plaster
                      | :massage_parlors
                      | :medical_and_dental_labs
                      | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                      | :medical_services
                      | :membership_organizations
                      | :mens_and_boys_clothing_and_accessories_stores
                      | :mens_womens_clothing_stores
                      | :metal_service_centers
                      | :miscellaneous
                      | :miscellaneous_apparel_and_accessory_shops
                      | :miscellaneous_auto_dealers
                      | :miscellaneous_business_services
                      | :miscellaneous_food_stores
                      | :miscellaneous_general_merchandise
                      | :miscellaneous_general_services
                      | :miscellaneous_home_furnishing_specialty_stores
                      | :miscellaneous_publishing_and_printing
                      | :miscellaneous_recreation_services
                      | :miscellaneous_repair_shops
                      | :miscellaneous_specialty_retail
                      | :mobile_home_dealers
                      | :motion_picture_theaters
                      | :motor_freight_carriers_and_trucking
                      | :motor_homes_dealers
                      | :motor_vehicle_supplies_and_new_parts
                      | :motorcycle_shops_and_dealers
                      | :motorcycle_shops_dealers
                      | :music_stores_musical_instruments_pianos_and_sheet_music
                      | :news_dealers_and_newsstands
                      | :non_fi_money_orders
                      | :non_fi_stored_value_card_purchase_load
                      | :nondurable_goods
                      | :nurseries_lawn_and_garden_supply_stores
                      | :nursing_personal_care
                      | :office_and_commercial_furniture
                      | :opticians_eyeglasses
                      | :optometrists_ophthalmologist
                      | :orthopedic_goods_prosthetic_devices
                      | :osteopaths
                      | :package_stores_beer_wine_and_liquor
                      | :paints_varnishes_and_supplies
                      | :parking_lots_garages
                      | :passenger_railways
                      | :pawn_shops
                      | :pet_shops_pet_food_and_supplies
                      | :petroleum_and_petroleum_products
                      | :photo_developing
                      | :photographic_photocopy_microfilm_equipment_and_supplies
                      | :photographic_studios
                      | :picture_video_production
                      | :piece_goods_notions_and_other_dry_goods
                      | :plumbing_heating_equipment_and_supplies
                      | :political_organizations
                      | :postal_services_government_only
                      | :precious_stones_and_metals_watches_and_jewelry
                      | :professional_services
                      | :public_warehousing_and_storage
                      | :quick_copy_repro_and_blueprint
                      | :railroads
                      | :real_estate_agents_and_managers_rentals
                      | :record_stores
                      | :recreational_vehicle_rentals
                      | :religious_goods_stores
                      | :religious_organizations
                      | :roofing_siding_sheet_metal
                      | :secretarial_support_services
                      | :security_brokers_dealers
                      | :service_stations
                      | :sewing_needlework_fabric_and_piece_goods_stores
                      | :shoe_repair_hat_cleaning
                      | :shoe_stores
                      | :small_appliance_repair
                      | :snowmobile_dealers
                      | :special_trade_services
                      | :specialty_cleaning
                      | :sporting_goods_stores
                      | :sporting_recreation_camps
                      | :sports_and_riding_apparel_stores
                      | :sports_clubs_fields
                      | :stamp_and_coin_stores
                      | :stationary_office_supplies_printing_and_writing_paper
                      | :stationery_stores_office_and_school_supply_stores
                      | :swimming_pools_sales
                      | :t_ui_travel_germany
                      | :tailors_alterations
                      | :tax_payments_government_agencies
                      | :tax_preparation_services
                      | :taxicabs_limousines
                      | :telecommunication_equipment_and_telephone_sales
                      | :telecommunication_services
                      | :telegraph_services
                      | :tent_and_awning_shops
                      | :testing_laboratories
                      | :theatrical_ticket_agencies
                      | :timeshares
                      | :tire_retreading_and_repair
                      | :tolls_bridge_fees
                      | :tourist_attractions_and_exhibits
                      | :towing_services
                      | :trailer_parks_campgrounds
                      | :transportation_services
                      | :travel_agencies_tour_operators
                      | :truck_stop_iteration
                      | :truck_utility_trailer_rentals
                      | :typesetting_plate_making_and_related_services
                      | :typewriter_stores
                      | :u_s_federal_government_agencies_or_departments
                      | :uniforms_commercial_clothing
                      | :used_merchandise_and_secondhand_stores
                      | :utilities
                      | :variety_stores
                      | :veterinary_services
                      | :video_amusement_game_supplies
                      | :video_game_arcades
                      | :video_tape_rental_stores
                      | :vocational_trade_schools
                      | :watch_jewelry_repair
                      | :welding_repair
                      | :wholesale_clubs
                      | :wig_and_toupee_stores
                      | :wires_money_orders
                      | :womens_accessory_and_specialty_shops
                      | :womens_ready_to_wear_stores
                      | :wrecking_and_salvage_yards
                    ],
                    :amount => integer()
                  }
                ],
                :blocked_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ],
                :allowed_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ]
              },
              :pin => %{:encrypted_number => String.t()},
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :cancellation_reason => String.t() | :lost | :stolen
            }
            | map(),
          card :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_cards_card(%ExOAPI.Client{} = client, body, card) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards/{card}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("card", card)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Card</code> object.</p>

  """
  @type get_issuing_cards_card_opts :: {:expand, String.t()}
  @spec get_issuing_cards_card(
          client :: ExOAPI.Client.t(),
          card :: String.t(),
          list(get_issuing_cards_card_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_cards_card(%ExOAPI.Client{} = client, card, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards/{card}")
    |> ExOAPI.Client.replace_in_path("card", card)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Settlement</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_settlements_settlement(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => map(), :expand => [String.t()]} | map(),
          settlement :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_settlements_settlement(%ExOAPI.Client{} = client, body, settlement) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/settlements/{settlement}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("settlement", settlement)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Settlement</code> object.</p>

  """
  @type get_issuing_settlements_settlement_opts :: {:expand, String.t()}
  @spec get_issuing_settlements_settlement(
          client :: ExOAPI.Client.t(),
          settlement :: String.t(),
          list(get_issuing_settlements_settlement_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_settlements_settlement(%ExOAPI.Client{} = client, settlement, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/settlements/{settlement}")
    |> ExOAPI.Client.replace_in_path("settlement", settlement)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Settlement</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_settlements_opts ::
          {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_issuing_settlements(client :: ExOAPI.Client.t(), list(get_issuing_settlements_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_settlements(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/settlements")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Transaction</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_transactions_opts ::
          {:type, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:cardholder, String.t()}
          | {:card, String.t()}
  @spec get_issuing_transactions(
          client :: ExOAPI.Client.t(),
          list(get_issuing_transactions_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_transactions(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/transactions")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:cardholder, "cardholder", "form", true},
      {:card, "card", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Authorization</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_authorizations_opts ::
          {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:cardholder, String.t()}
          | {:card, String.t()}
  @spec get_issuing_authorizations(
          client :: ExOAPI.Client.t(),
          list(get_issuing_authorizations_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_authorizations(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:cardholder, "cardholder", "form", true},
      {:card, "card", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates an Issuing <code>Dispute</code> object. Individual pieces of evidence within the <code>evidence</code> object are optional at this point. Stripe only validates that required evidence is present during submission. Refer to <a href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and evidence</a> for more details about evidence requirements.</p>

  """

  @spec post_issuing_disputes(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :transaction => String.t(),
              :metadata => map(),
              :expand => [String.t()],
              :evidence => %{
                :service_not_as_described =>
                  String.t()
                  | %{
                      :received_at => String.t() | integer(),
                      :explanation => String.t(),
                      :cancellation_reason => String.t(),
                      :canceled_at => String.t() | integer(),
                      :additional_documentation => String.t()
                    },
                :reason =>
                  String.t()
                  | :canceled
                  | :duplicate
                  | :fraudulent
                  | :merchandise_not_as_described
                  | :not_received
                  | :other
                  | :service_not_as_described,
                :other =>
                  String.t()
                  | %{
                      :product_type => String.t() | :merchandise | :service,
                      :product_description => String.t(),
                      :explanation => String.t(),
                      :additional_documentation => String.t()
                    },
                :not_received =>
                  String.t()
                  | %{
                      :product_type => String.t() | :merchandise | :service,
                      :product_description => String.t(),
                      :explanation => String.t(),
                      :expected_at => String.t() | integer(),
                      :additional_documentation => String.t()
                    },
                :merchandise_not_as_described =>
                  String.t()
                  | %{
                      :returned_at => String.t() | integer(),
                      :return_status => String.t() | :merchant_rejected | :successful,
                      :return_description => String.t(),
                      :received_at => String.t() | integer(),
                      :explanation => String.t(),
                      :additional_documentation => String.t()
                    },
                :fraudulent =>
                  String.t()
                  | %{:explanation => String.t(), :additional_documentation => String.t()},
                :duplicate =>
                  String.t()
                  | %{
                      :original_transaction => String.t(),
                      :explanation => String.t(),
                      :check_image => String.t(),
                      :cash_receipt => String.t(),
                      :card_statement => String.t(),
                      :additional_documentation => String.t()
                    },
                :canceled =>
                  String.t()
                  | %{
                      :returned_at => String.t() | integer(),
                      :return_status => String.t() | :merchant_rejected | :successful,
                      :product_type => String.t() | :merchandise | :service,
                      :product_description => String.t(),
                      :explanation => String.t(),
                      :expected_at => String.t() | integer(),
                      :cancellation_reason => String.t(),
                      :cancellation_policy_provided => String.t() | boolean(),
                      :canceled_at => String.t() | integer(),
                      :additional_documentation => String.t()
                    }
              }
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_disputes(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Dispute</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_disputes_opts ::
          {:transaction, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
  @spec get_issuing_disputes(client :: ExOAPI.Client.t(), list(get_issuing_disputes_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_disputes(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:transaction, "transaction", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Transaction</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_transactions_transaction(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          transaction :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_transactions_transaction(%ExOAPI.Client{} = client, body, transaction) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/transactions/{transaction}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("transaction", transaction)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Transaction</code> object.</p>

  """
  @type get_issuing_transactions_transaction_opts :: {:expand, String.t()}
  @spec get_issuing_transactions_transaction(
          client :: ExOAPI.Client.t(),
          transaction :: String.t(),
          list(get_issuing_transactions_transaction_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_transactions_transaction(%ExOAPI.Client{} = client, transaction, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/transactions/{transaction}")
    |> ExOAPI.Client.replace_in_path("transaction", transaction)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates a new Issuing <code>Cardholder</code> object that can be issued cards.</p>

  """

  @spec post_issuing_cardholders(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :type => String.t() | :company | :individual,
              :status => String.t() | :active | :inactive,
              :spending_controls => %{
                :spending_limits_currency => String.t(),
                :spending_limits => [
                  %{
                    :interval =>
                      String.t()
                      | :all_time
                      | :daily
                      | :monthly
                      | :per_authorization
                      | :weekly
                      | :yearly,
                    :categories => [
                      String.t()
                      | :ac_refrigeration_repair
                      | :accounting_bookkeeping_services
                      | :advertising_services
                      | :agricultural_cooperative
                      | :airlines_air_carriers
                      | :airports_flying_fields
                      | :ambulance_services
                      | :amusement_parks_carnivals
                      | :antique_reproductions
                      | :antique_shops
                      | :aquariums
                      | :architectural_surveying_services
                      | :art_dealers_and_galleries
                      | :artists_supply_and_craft_shops
                      | :auto_and_home_supply_stores
                      | :auto_body_repair_shops
                      | :auto_paint_shops
                      | :auto_service_shops
                      | :automated_cash_disburse
                      | :automated_fuel_dispensers
                      | :automobile_associations
                      | :automotive_parts_and_accessories_stores
                      | :automotive_tire_stores
                      | :bail_and_bond_payments
                      | :bakeries
                      | :bands_orchestras
                      | :barber_and_beauty_shops
                      | :betting_casino_gambling
                      | :bicycle_shops
                      | :billiard_pool_establishments
                      | :boat_dealers
                      | :boat_rentals_and_leases
                      | :book_stores
                      | :books_periodicals_and_newspapers
                      | :bowling_alleys
                      | :bus_lines
                      | :business_secretarial_schools
                      | :buying_shopping_services
                      | :cable_satellite_and_other_pay_television_and_radio
                      | :camera_and_photographic_supply_stores
                      | :candy_nut_and_confectionery_stores
                      | :car_and_truck_dealers_new_used
                      | :car_and_truck_dealers_used_only
                      | :car_rental_agencies
                      | :car_washes
                      | :carpentry_services
                      | :carpet_upholstery_cleaning
                      | :caterers
                      | :charitable_and_social_service_organizations_fundraising
                      | :chemicals_and_allied_products
                      | :child_care_services
                      | :childrens_and_infants_wear_stores
                      | :chiropodists_podiatrists
                      | :chiropractors
                      | :cigar_stores_and_stands
                      | :civic_social_fraternal_associations
                      | :cleaning_and_maintenance
                      | :clothing_rental
                      | :colleges_universities
                      | :commercial_equipment
                      | :commercial_footwear
                      | :commercial_photography_art_and_graphics
                      | :commuter_transport_and_ferries
                      | :computer_network_services
                      | :computer_programming
                      | :computer_repair
                      | :computer_software_stores
                      | :computers_peripherals_and_software
                      | :concrete_work_services
                      | :construction_materials
                      | :consulting_public_relations
                      | :correspondence_schools
                      | :cosmetic_stores
                      | :counseling_services
                      | :country_clubs
                      | :courier_services
                      | :court_costs
                      | :credit_reporting_agencies
                      | :cruise_lines
                      | :dairy_products_stores
                      | :dance_hall_studios_schools
                      | :dating_escort_services
                      | :dentists_orthodontists
                      | :department_stores
                      | :detective_agencies
                      | :digital_goods_applications
                      | :digital_goods_games
                      | :digital_goods_large_volume
                      | :digital_goods_media
                      | :direct_marketing_catalog_merchant
                      | :direct_marketing_combination_catalog_and_retail_merchant
                      | :direct_marketing_inbound_telemarketing
                      | :direct_marketing_insurance_services
                      | :direct_marketing_other
                      | :direct_marketing_outbound_telemarketing
                      | :direct_marketing_subscription
                      | :direct_marketing_travel
                      | :discount_stores
                      | :doctors
                      | :door_to_door_sales
                      | :drapery_window_covering_and_upholstery_stores
                      | :drinking_places
                      | :drug_stores_and_pharmacies
                      | :drugs_drug_proprietaries_and_druggist_sundries
                      | :dry_cleaners
                      | :durable_goods
                      | :duty_free_stores
                      | :eating_places_restaurants
                      | :educational_services
                      | :electric_razor_stores
                      | :electrical_parts_and_equipment
                      | :electrical_services
                      | :electronics_repair_shops
                      | :electronics_stores
                      | :elementary_secondary_schools
                      | :employment_temp_agencies
                      | :equipment_rental
                      | :exterminating_services
                      | :family_clothing_stores
                      | :fast_food_restaurants
                      | :financial_institutions
                      | :fines_government_administrative_entities
                      | :fireplace_fireplace_screens_and_accessories_stores
                      | :floor_covering_stores
                      | :florists
                      | :florists_supplies_nursery_stock_and_flowers
                      | :freezer_and_locker_meat_provisioners
                      | :fuel_dealers_non_automotive
                      | :funeral_services_crematories
                      | :furniture_home_furnishings_and_equipment_stores_except_appliances
                      | :furniture_repair_refinishing
                      | :furriers_and_fur_shops
                      | :general_services
                      | :gift_card_novelty_and_souvenir_shops
                      | :glass_paint_and_wallpaper_stores
                      | :glassware_crystal_stores
                      | :golf_courses_public
                      | :government_services
                      | :grocery_stores_supermarkets
                      | :hardware_equipment_and_supplies
                      | :hardware_stores
                      | :health_and_beauty_spas
                      | :hearing_aids_sales_and_supplies
                      | :heating_plumbing_a_c
                      | :hobby_toy_and_game_shops
                      | :home_supply_warehouse_stores
                      | :hospitals
                      | :hotels_motels_and_resorts
                      | :household_appliance_stores
                      | :industrial_supplies
                      | :information_retrieval_services
                      | :insurance_default
                      | :insurance_underwriting_premiums
                      | :intra_company_purchases
                      | :jewelry_stores_watches_clocks_and_silverware_stores
                      | :landscaping_services
                      | :laundries
                      | :laundry_cleaning_services
                      | :legal_services_attorneys
                      | :luggage_and_leather_goods_stores
                      | :lumber_building_materials_stores
                      | :manual_cash_disburse
                      | :marinas_service_and_supplies
                      | :masonry_stonework_and_plaster
                      | :massage_parlors
                      | :medical_and_dental_labs
                      | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                      | :medical_services
                      | :membership_organizations
                      | :mens_and_boys_clothing_and_accessories_stores
                      | :mens_womens_clothing_stores
                      | :metal_service_centers
                      | :miscellaneous
                      | :miscellaneous_apparel_and_accessory_shops
                      | :miscellaneous_auto_dealers
                      | :miscellaneous_business_services
                      | :miscellaneous_food_stores
                      | :miscellaneous_general_merchandise
                      | :miscellaneous_general_services
                      | :miscellaneous_home_furnishing_specialty_stores
                      | :miscellaneous_publishing_and_printing
                      | :miscellaneous_recreation_services
                      | :miscellaneous_repair_shops
                      | :miscellaneous_specialty_retail
                      | :mobile_home_dealers
                      | :motion_picture_theaters
                      | :motor_freight_carriers_and_trucking
                      | :motor_homes_dealers
                      | :motor_vehicle_supplies_and_new_parts
                      | :motorcycle_shops_and_dealers
                      | :motorcycle_shops_dealers
                      | :music_stores_musical_instruments_pianos_and_sheet_music
                      | :news_dealers_and_newsstands
                      | :non_fi_money_orders
                      | :non_fi_stored_value_card_purchase_load
                      | :nondurable_goods
                      | :nurseries_lawn_and_garden_supply_stores
                      | :nursing_personal_care
                      | :office_and_commercial_furniture
                      | :opticians_eyeglasses
                      | :optometrists_ophthalmologist
                      | :orthopedic_goods_prosthetic_devices
                      | :osteopaths
                      | :package_stores_beer_wine_and_liquor
                      | :paints_varnishes_and_supplies
                      | :parking_lots_garages
                      | :passenger_railways
                      | :pawn_shops
                      | :pet_shops_pet_food_and_supplies
                      | :petroleum_and_petroleum_products
                      | :photo_developing
                      | :photographic_photocopy_microfilm_equipment_and_supplies
                      | :photographic_studios
                      | :picture_video_production
                      | :piece_goods_notions_and_other_dry_goods
                      | :plumbing_heating_equipment_and_supplies
                      | :political_organizations
                      | :postal_services_government_only
                      | :precious_stones_and_metals_watches_and_jewelry
                      | :professional_services
                      | :public_warehousing_and_storage
                      | :quick_copy_repro_and_blueprint
                      | :railroads
                      | :real_estate_agents_and_managers_rentals
                      | :record_stores
                      | :recreational_vehicle_rentals
                      | :religious_goods_stores
                      | :religious_organizations
                      | :roofing_siding_sheet_metal
                      | :secretarial_support_services
                      | :security_brokers_dealers
                      | :service_stations
                      | :sewing_needlework_fabric_and_piece_goods_stores
                      | :shoe_repair_hat_cleaning
                      | :shoe_stores
                      | :small_appliance_repair
                      | :snowmobile_dealers
                      | :special_trade_services
                      | :specialty_cleaning
                      | :sporting_goods_stores
                      | :sporting_recreation_camps
                      | :sports_and_riding_apparel_stores
                      | :sports_clubs_fields
                      | :stamp_and_coin_stores
                      | :stationary_office_supplies_printing_and_writing_paper
                      | :stationery_stores_office_and_school_supply_stores
                      | :swimming_pools_sales
                      | :t_ui_travel_germany
                      | :tailors_alterations
                      | :tax_payments_government_agencies
                      | :tax_preparation_services
                      | :taxicabs_limousines
                      | :telecommunication_equipment_and_telephone_sales
                      | :telecommunication_services
                      | :telegraph_services
                      | :tent_and_awning_shops
                      | :testing_laboratories
                      | :theatrical_ticket_agencies
                      | :timeshares
                      | :tire_retreading_and_repair
                      | :tolls_bridge_fees
                      | :tourist_attractions_and_exhibits
                      | :towing_services
                      | :trailer_parks_campgrounds
                      | :transportation_services
                      | :travel_agencies_tour_operators
                      | :truck_stop_iteration
                      | :truck_utility_trailer_rentals
                      | :typesetting_plate_making_and_related_services
                      | :typewriter_stores
                      | :u_s_federal_government_agencies_or_departments
                      | :uniforms_commercial_clothing
                      | :used_merchandise_and_secondhand_stores
                      | :utilities
                      | :variety_stores
                      | :veterinary_services
                      | :video_amusement_game_supplies
                      | :video_game_arcades
                      | :video_tape_rental_stores
                      | :vocational_trade_schools
                      | :watch_jewelry_repair
                      | :welding_repair
                      | :wholesale_clubs
                      | :wig_and_toupee_stores
                      | :wires_money_orders
                      | :womens_accessory_and_specialty_shops
                      | :womens_ready_to_wear_stores
                      | :wrecking_and_salvage_yards
                    ],
                    :amount => integer()
                  }
                ],
                :blocked_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ],
                :allowed_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ]
              },
              :phone_number => String.t(),
              :name => String.t(),
              :metadata => map(),
              :individual => %{
                :verification => %{:document => %{:front => String.t(), :back => String.t()}},
                :last_name => String.t(),
                :first_name => String.t(),
                :dob => %{:year => integer(), :month => integer(), :day => integer()}
              },
              :expand => [String.t()],
              :email => String.t(),
              :company => %{:tax_id => String.t()},
              :billing => %{
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              }
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_cardholders(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Cardholder</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_cardholders_opts ::
          {:type, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:phone_number, String.t()}
          | {:limit, String.t()}
          | {:expand, String.t()}
          | {:ending_before, String.t()}
          | {:email, String.t()}
          | {:created, String.t()}
  @spec get_issuing_cardholders(client :: ExOAPI.Client.t(), list(get_issuing_cardholders_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_cardholders(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:phone_number, "phone_number", "form", true},
      {:limit, "limit", "form", true},
      {:expand, "expand", "deepObject", true},
      {:ending_before, "ending_before", "form", true},
      {:email, "email", "form", true},
      {:created, "created", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Submits an Issuing <code>Dispute</code> to the card network. Stripe validates that all evidence fields required for the dispute’s reason are present. For more details, see <a href="/docs/issuing/purchases/disputes#dispute-reasons-and-evidence">Dispute reasons and evidence</a>.</p>

  """

  @spec post_issuing_disputes_dispute_submit(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          dispute :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_disputes_dispute_submit(%ExOAPI.Client{} = client, body, dispute) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes/{dispute}/submit")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Dispute</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Properties on the <code>evidence</code> object can be unset by passing in an empty string.</p>

  """

  @spec post_issuing_disputes_dispute(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :metadata => String.t() | map(),
              :expand => [String.t()],
              :evidence => %{
                :service_not_as_described =>
                  String.t()
                  | %{
                      :received_at => String.t() | integer(),
                      :explanation => String.t(),
                      :cancellation_reason => String.t(),
                      :canceled_at => String.t() | integer(),
                      :additional_documentation => String.t()
                    },
                :reason =>
                  String.t()
                  | :canceled
                  | :duplicate
                  | :fraudulent
                  | :merchandise_not_as_described
                  | :not_received
                  | :other
                  | :service_not_as_described,
                :other =>
                  String.t()
                  | %{
                      :product_type => String.t() | :merchandise | :service,
                      :product_description => String.t(),
                      :explanation => String.t(),
                      :additional_documentation => String.t()
                    },
                :not_received =>
                  String.t()
                  | %{
                      :product_type => String.t() | :merchandise | :service,
                      :product_description => String.t(),
                      :explanation => String.t(),
                      :expected_at => String.t() | integer(),
                      :additional_documentation => String.t()
                    },
                :merchandise_not_as_described =>
                  String.t()
                  | %{
                      :returned_at => String.t() | integer(),
                      :return_status => String.t() | :merchant_rejected | :successful,
                      :return_description => String.t(),
                      :received_at => String.t() | integer(),
                      :explanation => String.t(),
                      :additional_documentation => String.t()
                    },
                :fraudulent =>
                  String.t()
                  | %{:explanation => String.t(), :additional_documentation => String.t()},
                :duplicate =>
                  String.t()
                  | %{
                      :original_transaction => String.t(),
                      :explanation => String.t(),
                      :check_image => String.t(),
                      :cash_receipt => String.t(),
                      :card_statement => String.t(),
                      :additional_documentation => String.t()
                    },
                :canceled =>
                  String.t()
                  | %{
                      :returned_at => String.t() | integer(),
                      :return_status => String.t() | :merchant_rejected | :successful,
                      :product_type => String.t() | :merchandise | :service,
                      :product_description => String.t(),
                      :explanation => String.t(),
                      :expected_at => String.t() | integer(),
                      :cancellation_reason => String.t(),
                      :cancellation_policy_provided => String.t() | boolean(),
                      :canceled_at => String.t() | integer(),
                      :additional_documentation => String.t()
                    }
              }
            }
            | map(),
          dispute :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_disputes_dispute(%ExOAPI.Client{} = client, body, dispute) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes/{dispute}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Dispute</code> object.</p>

  """
  @type get_issuing_disputes_dispute_opts :: {:expand, String.t()}
  @spec get_issuing_disputes_dispute(
          client :: ExOAPI.Client.t(),
          dispute :: String.t(),
          list(get_issuing_disputes_dispute_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_disputes_dispute(%ExOAPI.Client{} = client, dispute, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/disputes/{dispute}")
    |> ExOAPI.Client.replace_in_path("dispute", dispute)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Approves a pending Issuing <code>Authorization</code> object. This request should be made within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real-time authorization</a> flow.</p>

  """

  @spec post_issuing_authorizations_authorization_approve(
          client :: ExOAPI.Client.t(),
          body ::
            %{:metadata => String.t() | map(), :expand => [String.t()], :amount => integer()}
            | map(),
          authorization :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_authorizations_authorization_approve(
        %ExOAPI.Client{} = client,
        body,
        authorization
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}/approve")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Declines a pending Issuing <code>Authorization</code> object. This request should be made within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real time authorization</a> flow.</p>

  """

  @spec post_issuing_authorizations_authorization_decline(
          client :: ExOAPI.Client.t(),
          body :: %{:metadata => String.t() | map(), :expand => [String.t()]} | map(),
          authorization :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_authorizations_authorization_decline(
        %ExOAPI.Client{} = client,
        body,
        authorization
      ) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/authorizations/{authorization}/decline")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("authorization", authorization)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Creates an Issuing <code>Card</code> object.</p>

  """

  @spec post_issuing_cards(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :type => String.t() | :physical | :virtual,
              :status => String.t() | :active | :inactive,
              :spending_controls => %{
                :spending_limits => [
                  %{
                    :interval =>
                      String.t()
                      | :all_time
                      | :daily
                      | :monthly
                      | :per_authorization
                      | :weekly
                      | :yearly,
                    :categories => [
                      String.t()
                      | :ac_refrigeration_repair
                      | :accounting_bookkeeping_services
                      | :advertising_services
                      | :agricultural_cooperative
                      | :airlines_air_carriers
                      | :airports_flying_fields
                      | :ambulance_services
                      | :amusement_parks_carnivals
                      | :antique_reproductions
                      | :antique_shops
                      | :aquariums
                      | :architectural_surveying_services
                      | :art_dealers_and_galleries
                      | :artists_supply_and_craft_shops
                      | :auto_and_home_supply_stores
                      | :auto_body_repair_shops
                      | :auto_paint_shops
                      | :auto_service_shops
                      | :automated_cash_disburse
                      | :automated_fuel_dispensers
                      | :automobile_associations
                      | :automotive_parts_and_accessories_stores
                      | :automotive_tire_stores
                      | :bail_and_bond_payments
                      | :bakeries
                      | :bands_orchestras
                      | :barber_and_beauty_shops
                      | :betting_casino_gambling
                      | :bicycle_shops
                      | :billiard_pool_establishments
                      | :boat_dealers
                      | :boat_rentals_and_leases
                      | :book_stores
                      | :books_periodicals_and_newspapers
                      | :bowling_alleys
                      | :bus_lines
                      | :business_secretarial_schools
                      | :buying_shopping_services
                      | :cable_satellite_and_other_pay_television_and_radio
                      | :camera_and_photographic_supply_stores
                      | :candy_nut_and_confectionery_stores
                      | :car_and_truck_dealers_new_used
                      | :car_and_truck_dealers_used_only
                      | :car_rental_agencies
                      | :car_washes
                      | :carpentry_services
                      | :carpet_upholstery_cleaning
                      | :caterers
                      | :charitable_and_social_service_organizations_fundraising
                      | :chemicals_and_allied_products
                      | :child_care_services
                      | :childrens_and_infants_wear_stores
                      | :chiropodists_podiatrists
                      | :chiropractors
                      | :cigar_stores_and_stands
                      | :civic_social_fraternal_associations
                      | :cleaning_and_maintenance
                      | :clothing_rental
                      | :colleges_universities
                      | :commercial_equipment
                      | :commercial_footwear
                      | :commercial_photography_art_and_graphics
                      | :commuter_transport_and_ferries
                      | :computer_network_services
                      | :computer_programming
                      | :computer_repair
                      | :computer_software_stores
                      | :computers_peripherals_and_software
                      | :concrete_work_services
                      | :construction_materials
                      | :consulting_public_relations
                      | :correspondence_schools
                      | :cosmetic_stores
                      | :counseling_services
                      | :country_clubs
                      | :courier_services
                      | :court_costs
                      | :credit_reporting_agencies
                      | :cruise_lines
                      | :dairy_products_stores
                      | :dance_hall_studios_schools
                      | :dating_escort_services
                      | :dentists_orthodontists
                      | :department_stores
                      | :detective_agencies
                      | :digital_goods_applications
                      | :digital_goods_games
                      | :digital_goods_large_volume
                      | :digital_goods_media
                      | :direct_marketing_catalog_merchant
                      | :direct_marketing_combination_catalog_and_retail_merchant
                      | :direct_marketing_inbound_telemarketing
                      | :direct_marketing_insurance_services
                      | :direct_marketing_other
                      | :direct_marketing_outbound_telemarketing
                      | :direct_marketing_subscription
                      | :direct_marketing_travel
                      | :discount_stores
                      | :doctors
                      | :door_to_door_sales
                      | :drapery_window_covering_and_upholstery_stores
                      | :drinking_places
                      | :drug_stores_and_pharmacies
                      | :drugs_drug_proprietaries_and_druggist_sundries
                      | :dry_cleaners
                      | :durable_goods
                      | :duty_free_stores
                      | :eating_places_restaurants
                      | :educational_services
                      | :electric_razor_stores
                      | :electrical_parts_and_equipment
                      | :electrical_services
                      | :electronics_repair_shops
                      | :electronics_stores
                      | :elementary_secondary_schools
                      | :employment_temp_agencies
                      | :equipment_rental
                      | :exterminating_services
                      | :family_clothing_stores
                      | :fast_food_restaurants
                      | :financial_institutions
                      | :fines_government_administrative_entities
                      | :fireplace_fireplace_screens_and_accessories_stores
                      | :floor_covering_stores
                      | :florists
                      | :florists_supplies_nursery_stock_and_flowers
                      | :freezer_and_locker_meat_provisioners
                      | :fuel_dealers_non_automotive
                      | :funeral_services_crematories
                      | :furniture_home_furnishings_and_equipment_stores_except_appliances
                      | :furniture_repair_refinishing
                      | :furriers_and_fur_shops
                      | :general_services
                      | :gift_card_novelty_and_souvenir_shops
                      | :glass_paint_and_wallpaper_stores
                      | :glassware_crystal_stores
                      | :golf_courses_public
                      | :government_services
                      | :grocery_stores_supermarkets
                      | :hardware_equipment_and_supplies
                      | :hardware_stores
                      | :health_and_beauty_spas
                      | :hearing_aids_sales_and_supplies
                      | :heating_plumbing_a_c
                      | :hobby_toy_and_game_shops
                      | :home_supply_warehouse_stores
                      | :hospitals
                      | :hotels_motels_and_resorts
                      | :household_appliance_stores
                      | :industrial_supplies
                      | :information_retrieval_services
                      | :insurance_default
                      | :insurance_underwriting_premiums
                      | :intra_company_purchases
                      | :jewelry_stores_watches_clocks_and_silverware_stores
                      | :landscaping_services
                      | :laundries
                      | :laundry_cleaning_services
                      | :legal_services_attorneys
                      | :luggage_and_leather_goods_stores
                      | :lumber_building_materials_stores
                      | :manual_cash_disburse
                      | :marinas_service_and_supplies
                      | :masonry_stonework_and_plaster
                      | :massage_parlors
                      | :medical_and_dental_labs
                      | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                      | :medical_services
                      | :membership_organizations
                      | :mens_and_boys_clothing_and_accessories_stores
                      | :mens_womens_clothing_stores
                      | :metal_service_centers
                      | :miscellaneous
                      | :miscellaneous_apparel_and_accessory_shops
                      | :miscellaneous_auto_dealers
                      | :miscellaneous_business_services
                      | :miscellaneous_food_stores
                      | :miscellaneous_general_merchandise
                      | :miscellaneous_general_services
                      | :miscellaneous_home_furnishing_specialty_stores
                      | :miscellaneous_publishing_and_printing
                      | :miscellaneous_recreation_services
                      | :miscellaneous_repair_shops
                      | :miscellaneous_specialty_retail
                      | :mobile_home_dealers
                      | :motion_picture_theaters
                      | :motor_freight_carriers_and_trucking
                      | :motor_homes_dealers
                      | :motor_vehicle_supplies_and_new_parts
                      | :motorcycle_shops_and_dealers
                      | :motorcycle_shops_dealers
                      | :music_stores_musical_instruments_pianos_and_sheet_music
                      | :news_dealers_and_newsstands
                      | :non_fi_money_orders
                      | :non_fi_stored_value_card_purchase_load
                      | :nondurable_goods
                      | :nurseries_lawn_and_garden_supply_stores
                      | :nursing_personal_care
                      | :office_and_commercial_furniture
                      | :opticians_eyeglasses
                      | :optometrists_ophthalmologist
                      | :orthopedic_goods_prosthetic_devices
                      | :osteopaths
                      | :package_stores_beer_wine_and_liquor
                      | :paints_varnishes_and_supplies
                      | :parking_lots_garages
                      | :passenger_railways
                      | :pawn_shops
                      | :pet_shops_pet_food_and_supplies
                      | :petroleum_and_petroleum_products
                      | :photo_developing
                      | :photographic_photocopy_microfilm_equipment_and_supplies
                      | :photographic_studios
                      | :picture_video_production
                      | :piece_goods_notions_and_other_dry_goods
                      | :plumbing_heating_equipment_and_supplies
                      | :political_organizations
                      | :postal_services_government_only
                      | :precious_stones_and_metals_watches_and_jewelry
                      | :professional_services
                      | :public_warehousing_and_storage
                      | :quick_copy_repro_and_blueprint
                      | :railroads
                      | :real_estate_agents_and_managers_rentals
                      | :record_stores
                      | :recreational_vehicle_rentals
                      | :religious_goods_stores
                      | :religious_organizations
                      | :roofing_siding_sheet_metal
                      | :secretarial_support_services
                      | :security_brokers_dealers
                      | :service_stations
                      | :sewing_needlework_fabric_and_piece_goods_stores
                      | :shoe_repair_hat_cleaning
                      | :shoe_stores
                      | :small_appliance_repair
                      | :snowmobile_dealers
                      | :special_trade_services
                      | :specialty_cleaning
                      | :sporting_goods_stores
                      | :sporting_recreation_camps
                      | :sports_and_riding_apparel_stores
                      | :sports_clubs_fields
                      | :stamp_and_coin_stores
                      | :stationary_office_supplies_printing_and_writing_paper
                      | :stationery_stores_office_and_school_supply_stores
                      | :swimming_pools_sales
                      | :t_ui_travel_germany
                      | :tailors_alterations
                      | :tax_payments_government_agencies
                      | :tax_preparation_services
                      | :taxicabs_limousines
                      | :telecommunication_equipment_and_telephone_sales
                      | :telecommunication_services
                      | :telegraph_services
                      | :tent_and_awning_shops
                      | :testing_laboratories
                      | :theatrical_ticket_agencies
                      | :timeshares
                      | :tire_retreading_and_repair
                      | :tolls_bridge_fees
                      | :tourist_attractions_and_exhibits
                      | :towing_services
                      | :trailer_parks_campgrounds
                      | :transportation_services
                      | :travel_agencies_tour_operators
                      | :truck_stop_iteration
                      | :truck_utility_trailer_rentals
                      | :typesetting_plate_making_and_related_services
                      | :typewriter_stores
                      | :u_s_federal_government_agencies_or_departments
                      | :uniforms_commercial_clothing
                      | :used_merchandise_and_secondhand_stores
                      | :utilities
                      | :variety_stores
                      | :veterinary_services
                      | :video_amusement_game_supplies
                      | :video_game_arcades
                      | :video_tape_rental_stores
                      | :vocational_trade_schools
                      | :watch_jewelry_repair
                      | :welding_repair
                      | :wholesale_clubs
                      | :wig_and_toupee_stores
                      | :wires_money_orders
                      | :womens_accessory_and_specialty_shops
                      | :womens_ready_to_wear_stores
                      | :wrecking_and_salvage_yards
                    ],
                    :amount => integer()
                  }
                ],
                :blocked_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ],
                :allowed_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ]
              },
              :shipping => %{
                :type => String.t() | :bulk | :individual,
                :service => String.t() | :express | :priority | :standard,
                :name => String.t(),
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              },
              :replacement_reason => String.t() | :damaged | :expired | :lost | :stolen,
              :replacement_for => String.t(),
              :metadata => map(),
              :expand => [String.t()],
              :currency => String.t(),
              :cardholder => String.t()
            }
            | map()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_cards(%ExOAPI.Client{} = client, body) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Returns a list of Issuing <code>Card</code> objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.</p>

  """
  @type get_issuing_cards_opts ::
          {:type, String.t()}
          | {:status, String.t()}
          | {:starting_after, String.t()}
          | {:limit, String.t()}
          | {:last4, String.t()}
          | {:expand, String.t()}
          | {:exp_year, String.t()}
          | {:exp_month, String.t()}
          | {:ending_before, String.t()}
          | {:created, String.t()}
          | {:cardholder, String.t()}
  @spec get_issuing_cards(client :: ExOAPI.Client.t(), list(get_issuing_cards_opts())) ::
          {:ok, any()} | {:error, any()}
  def get_issuing_cards(%ExOAPI.Client{} = client, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cards")
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:type, "type", "form", true},
      {:status, "status", "form", true},
      {:starting_after, "starting_after", "form", true},
      {:limit, "limit", "form", true},
      {:last4, "last4", "form", true},
      {:expand, "expand", "deepObject", true},
      {:exp_year, "exp_year", "form", true},
      {:exp_month, "exp_month", "form", true},
      {:ending_before, "ending_before", "form", true},
      {:created, "created", "deepObject", true},
      {:cardholder, "cardholder", "form", true}
    ])
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Updates the specified Issuing <code>Cardholder</code> object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>

  """

  @spec post_issuing_cardholders_cardholder(
          client :: ExOAPI.Client.t(),
          body ::
            %{
              :status => String.t() | :active | :inactive,
              :spending_controls => %{
                :spending_limits_currency => String.t(),
                :spending_limits => [
                  %{
                    :interval =>
                      String.t()
                      | :all_time
                      | :daily
                      | :monthly
                      | :per_authorization
                      | :weekly
                      | :yearly,
                    :categories => [
                      String.t()
                      | :ac_refrigeration_repair
                      | :accounting_bookkeeping_services
                      | :advertising_services
                      | :agricultural_cooperative
                      | :airlines_air_carriers
                      | :airports_flying_fields
                      | :ambulance_services
                      | :amusement_parks_carnivals
                      | :antique_reproductions
                      | :antique_shops
                      | :aquariums
                      | :architectural_surveying_services
                      | :art_dealers_and_galleries
                      | :artists_supply_and_craft_shops
                      | :auto_and_home_supply_stores
                      | :auto_body_repair_shops
                      | :auto_paint_shops
                      | :auto_service_shops
                      | :automated_cash_disburse
                      | :automated_fuel_dispensers
                      | :automobile_associations
                      | :automotive_parts_and_accessories_stores
                      | :automotive_tire_stores
                      | :bail_and_bond_payments
                      | :bakeries
                      | :bands_orchestras
                      | :barber_and_beauty_shops
                      | :betting_casino_gambling
                      | :bicycle_shops
                      | :billiard_pool_establishments
                      | :boat_dealers
                      | :boat_rentals_and_leases
                      | :book_stores
                      | :books_periodicals_and_newspapers
                      | :bowling_alleys
                      | :bus_lines
                      | :business_secretarial_schools
                      | :buying_shopping_services
                      | :cable_satellite_and_other_pay_television_and_radio
                      | :camera_and_photographic_supply_stores
                      | :candy_nut_and_confectionery_stores
                      | :car_and_truck_dealers_new_used
                      | :car_and_truck_dealers_used_only
                      | :car_rental_agencies
                      | :car_washes
                      | :carpentry_services
                      | :carpet_upholstery_cleaning
                      | :caterers
                      | :charitable_and_social_service_organizations_fundraising
                      | :chemicals_and_allied_products
                      | :child_care_services
                      | :childrens_and_infants_wear_stores
                      | :chiropodists_podiatrists
                      | :chiropractors
                      | :cigar_stores_and_stands
                      | :civic_social_fraternal_associations
                      | :cleaning_and_maintenance
                      | :clothing_rental
                      | :colleges_universities
                      | :commercial_equipment
                      | :commercial_footwear
                      | :commercial_photography_art_and_graphics
                      | :commuter_transport_and_ferries
                      | :computer_network_services
                      | :computer_programming
                      | :computer_repair
                      | :computer_software_stores
                      | :computers_peripherals_and_software
                      | :concrete_work_services
                      | :construction_materials
                      | :consulting_public_relations
                      | :correspondence_schools
                      | :cosmetic_stores
                      | :counseling_services
                      | :country_clubs
                      | :courier_services
                      | :court_costs
                      | :credit_reporting_agencies
                      | :cruise_lines
                      | :dairy_products_stores
                      | :dance_hall_studios_schools
                      | :dating_escort_services
                      | :dentists_orthodontists
                      | :department_stores
                      | :detective_agencies
                      | :digital_goods_applications
                      | :digital_goods_games
                      | :digital_goods_large_volume
                      | :digital_goods_media
                      | :direct_marketing_catalog_merchant
                      | :direct_marketing_combination_catalog_and_retail_merchant
                      | :direct_marketing_inbound_telemarketing
                      | :direct_marketing_insurance_services
                      | :direct_marketing_other
                      | :direct_marketing_outbound_telemarketing
                      | :direct_marketing_subscription
                      | :direct_marketing_travel
                      | :discount_stores
                      | :doctors
                      | :door_to_door_sales
                      | :drapery_window_covering_and_upholstery_stores
                      | :drinking_places
                      | :drug_stores_and_pharmacies
                      | :drugs_drug_proprietaries_and_druggist_sundries
                      | :dry_cleaners
                      | :durable_goods
                      | :duty_free_stores
                      | :eating_places_restaurants
                      | :educational_services
                      | :electric_razor_stores
                      | :electrical_parts_and_equipment
                      | :electrical_services
                      | :electronics_repair_shops
                      | :electronics_stores
                      | :elementary_secondary_schools
                      | :employment_temp_agencies
                      | :equipment_rental
                      | :exterminating_services
                      | :family_clothing_stores
                      | :fast_food_restaurants
                      | :financial_institutions
                      | :fines_government_administrative_entities
                      | :fireplace_fireplace_screens_and_accessories_stores
                      | :floor_covering_stores
                      | :florists
                      | :florists_supplies_nursery_stock_and_flowers
                      | :freezer_and_locker_meat_provisioners
                      | :fuel_dealers_non_automotive
                      | :funeral_services_crematories
                      | :furniture_home_furnishings_and_equipment_stores_except_appliances
                      | :furniture_repair_refinishing
                      | :furriers_and_fur_shops
                      | :general_services
                      | :gift_card_novelty_and_souvenir_shops
                      | :glass_paint_and_wallpaper_stores
                      | :glassware_crystal_stores
                      | :golf_courses_public
                      | :government_services
                      | :grocery_stores_supermarkets
                      | :hardware_equipment_and_supplies
                      | :hardware_stores
                      | :health_and_beauty_spas
                      | :hearing_aids_sales_and_supplies
                      | :heating_plumbing_a_c
                      | :hobby_toy_and_game_shops
                      | :home_supply_warehouse_stores
                      | :hospitals
                      | :hotels_motels_and_resorts
                      | :household_appliance_stores
                      | :industrial_supplies
                      | :information_retrieval_services
                      | :insurance_default
                      | :insurance_underwriting_premiums
                      | :intra_company_purchases
                      | :jewelry_stores_watches_clocks_and_silverware_stores
                      | :landscaping_services
                      | :laundries
                      | :laundry_cleaning_services
                      | :legal_services_attorneys
                      | :luggage_and_leather_goods_stores
                      | :lumber_building_materials_stores
                      | :manual_cash_disburse
                      | :marinas_service_and_supplies
                      | :masonry_stonework_and_plaster
                      | :massage_parlors
                      | :medical_and_dental_labs
                      | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                      | :medical_services
                      | :membership_organizations
                      | :mens_and_boys_clothing_and_accessories_stores
                      | :mens_womens_clothing_stores
                      | :metal_service_centers
                      | :miscellaneous
                      | :miscellaneous_apparel_and_accessory_shops
                      | :miscellaneous_auto_dealers
                      | :miscellaneous_business_services
                      | :miscellaneous_food_stores
                      | :miscellaneous_general_merchandise
                      | :miscellaneous_general_services
                      | :miscellaneous_home_furnishing_specialty_stores
                      | :miscellaneous_publishing_and_printing
                      | :miscellaneous_recreation_services
                      | :miscellaneous_repair_shops
                      | :miscellaneous_specialty_retail
                      | :mobile_home_dealers
                      | :motion_picture_theaters
                      | :motor_freight_carriers_and_trucking
                      | :motor_homes_dealers
                      | :motor_vehicle_supplies_and_new_parts
                      | :motorcycle_shops_and_dealers
                      | :motorcycle_shops_dealers
                      | :music_stores_musical_instruments_pianos_and_sheet_music
                      | :news_dealers_and_newsstands
                      | :non_fi_money_orders
                      | :non_fi_stored_value_card_purchase_load
                      | :nondurable_goods
                      | :nurseries_lawn_and_garden_supply_stores
                      | :nursing_personal_care
                      | :office_and_commercial_furniture
                      | :opticians_eyeglasses
                      | :optometrists_ophthalmologist
                      | :orthopedic_goods_prosthetic_devices
                      | :osteopaths
                      | :package_stores_beer_wine_and_liquor
                      | :paints_varnishes_and_supplies
                      | :parking_lots_garages
                      | :passenger_railways
                      | :pawn_shops
                      | :pet_shops_pet_food_and_supplies
                      | :petroleum_and_petroleum_products
                      | :photo_developing
                      | :photographic_photocopy_microfilm_equipment_and_supplies
                      | :photographic_studios
                      | :picture_video_production
                      | :piece_goods_notions_and_other_dry_goods
                      | :plumbing_heating_equipment_and_supplies
                      | :political_organizations
                      | :postal_services_government_only
                      | :precious_stones_and_metals_watches_and_jewelry
                      | :professional_services
                      | :public_warehousing_and_storage
                      | :quick_copy_repro_and_blueprint
                      | :railroads
                      | :real_estate_agents_and_managers_rentals
                      | :record_stores
                      | :recreational_vehicle_rentals
                      | :religious_goods_stores
                      | :religious_organizations
                      | :roofing_siding_sheet_metal
                      | :secretarial_support_services
                      | :security_brokers_dealers
                      | :service_stations
                      | :sewing_needlework_fabric_and_piece_goods_stores
                      | :shoe_repair_hat_cleaning
                      | :shoe_stores
                      | :small_appliance_repair
                      | :snowmobile_dealers
                      | :special_trade_services
                      | :specialty_cleaning
                      | :sporting_goods_stores
                      | :sporting_recreation_camps
                      | :sports_and_riding_apparel_stores
                      | :sports_clubs_fields
                      | :stamp_and_coin_stores
                      | :stationary_office_supplies_printing_and_writing_paper
                      | :stationery_stores_office_and_school_supply_stores
                      | :swimming_pools_sales
                      | :t_ui_travel_germany
                      | :tailors_alterations
                      | :tax_payments_government_agencies
                      | :tax_preparation_services
                      | :taxicabs_limousines
                      | :telecommunication_equipment_and_telephone_sales
                      | :telecommunication_services
                      | :telegraph_services
                      | :tent_and_awning_shops
                      | :testing_laboratories
                      | :theatrical_ticket_agencies
                      | :timeshares
                      | :tire_retreading_and_repair
                      | :tolls_bridge_fees
                      | :tourist_attractions_and_exhibits
                      | :towing_services
                      | :trailer_parks_campgrounds
                      | :transportation_services
                      | :travel_agencies_tour_operators
                      | :truck_stop_iteration
                      | :truck_utility_trailer_rentals
                      | :typesetting_plate_making_and_related_services
                      | :typewriter_stores
                      | :u_s_federal_government_agencies_or_departments
                      | :uniforms_commercial_clothing
                      | :used_merchandise_and_secondhand_stores
                      | :utilities
                      | :variety_stores
                      | :veterinary_services
                      | :video_amusement_game_supplies
                      | :video_game_arcades
                      | :video_tape_rental_stores
                      | :vocational_trade_schools
                      | :watch_jewelry_repair
                      | :welding_repair
                      | :wholesale_clubs
                      | :wig_and_toupee_stores
                      | :wires_money_orders
                      | :womens_accessory_and_specialty_shops
                      | :womens_ready_to_wear_stores
                      | :wrecking_and_salvage_yards
                    ],
                    :amount => integer()
                  }
                ],
                :blocked_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ],
                :allowed_categories => [
                  String.t()
                  | :ac_refrigeration_repair
                  | :accounting_bookkeeping_services
                  | :advertising_services
                  | :agricultural_cooperative
                  | :airlines_air_carriers
                  | :airports_flying_fields
                  | :ambulance_services
                  | :amusement_parks_carnivals
                  | :antique_reproductions
                  | :antique_shops
                  | :aquariums
                  | :architectural_surveying_services
                  | :art_dealers_and_galleries
                  | :artists_supply_and_craft_shops
                  | :auto_and_home_supply_stores
                  | :auto_body_repair_shops
                  | :auto_paint_shops
                  | :auto_service_shops
                  | :automated_cash_disburse
                  | :automated_fuel_dispensers
                  | :automobile_associations
                  | :automotive_parts_and_accessories_stores
                  | :automotive_tire_stores
                  | :bail_and_bond_payments
                  | :bakeries
                  | :bands_orchestras
                  | :barber_and_beauty_shops
                  | :betting_casino_gambling
                  | :bicycle_shops
                  | :billiard_pool_establishments
                  | :boat_dealers
                  | :boat_rentals_and_leases
                  | :book_stores
                  | :books_periodicals_and_newspapers
                  | :bowling_alleys
                  | :bus_lines
                  | :business_secretarial_schools
                  | :buying_shopping_services
                  | :cable_satellite_and_other_pay_television_and_radio
                  | :camera_and_photographic_supply_stores
                  | :candy_nut_and_confectionery_stores
                  | :car_and_truck_dealers_new_used
                  | :car_and_truck_dealers_used_only
                  | :car_rental_agencies
                  | :car_washes
                  | :carpentry_services
                  | :carpet_upholstery_cleaning
                  | :caterers
                  | :charitable_and_social_service_organizations_fundraising
                  | :chemicals_and_allied_products
                  | :child_care_services
                  | :childrens_and_infants_wear_stores
                  | :chiropodists_podiatrists
                  | :chiropractors
                  | :cigar_stores_and_stands
                  | :civic_social_fraternal_associations
                  | :cleaning_and_maintenance
                  | :clothing_rental
                  | :colleges_universities
                  | :commercial_equipment
                  | :commercial_footwear
                  | :commercial_photography_art_and_graphics
                  | :commuter_transport_and_ferries
                  | :computer_network_services
                  | :computer_programming
                  | :computer_repair
                  | :computer_software_stores
                  | :computers_peripherals_and_software
                  | :concrete_work_services
                  | :construction_materials
                  | :consulting_public_relations
                  | :correspondence_schools
                  | :cosmetic_stores
                  | :counseling_services
                  | :country_clubs
                  | :courier_services
                  | :court_costs
                  | :credit_reporting_agencies
                  | :cruise_lines
                  | :dairy_products_stores
                  | :dance_hall_studios_schools
                  | :dating_escort_services
                  | :dentists_orthodontists
                  | :department_stores
                  | :detective_agencies
                  | :digital_goods_applications
                  | :digital_goods_games
                  | :digital_goods_large_volume
                  | :digital_goods_media
                  | :direct_marketing_catalog_merchant
                  | :direct_marketing_combination_catalog_and_retail_merchant
                  | :direct_marketing_inbound_telemarketing
                  | :direct_marketing_insurance_services
                  | :direct_marketing_other
                  | :direct_marketing_outbound_telemarketing
                  | :direct_marketing_subscription
                  | :direct_marketing_travel
                  | :discount_stores
                  | :doctors
                  | :door_to_door_sales
                  | :drapery_window_covering_and_upholstery_stores
                  | :drinking_places
                  | :drug_stores_and_pharmacies
                  | :drugs_drug_proprietaries_and_druggist_sundries
                  | :dry_cleaners
                  | :durable_goods
                  | :duty_free_stores
                  | :eating_places_restaurants
                  | :educational_services
                  | :electric_razor_stores
                  | :electrical_parts_and_equipment
                  | :electrical_services
                  | :electronics_repair_shops
                  | :electronics_stores
                  | :elementary_secondary_schools
                  | :employment_temp_agencies
                  | :equipment_rental
                  | :exterminating_services
                  | :family_clothing_stores
                  | :fast_food_restaurants
                  | :financial_institutions
                  | :fines_government_administrative_entities
                  | :fireplace_fireplace_screens_and_accessories_stores
                  | :floor_covering_stores
                  | :florists
                  | :florists_supplies_nursery_stock_and_flowers
                  | :freezer_and_locker_meat_provisioners
                  | :fuel_dealers_non_automotive
                  | :funeral_services_crematories
                  | :furniture_home_furnishings_and_equipment_stores_except_appliances
                  | :furniture_repair_refinishing
                  | :furriers_and_fur_shops
                  | :general_services
                  | :gift_card_novelty_and_souvenir_shops
                  | :glass_paint_and_wallpaper_stores
                  | :glassware_crystal_stores
                  | :golf_courses_public
                  | :government_services
                  | :grocery_stores_supermarkets
                  | :hardware_equipment_and_supplies
                  | :hardware_stores
                  | :health_and_beauty_spas
                  | :hearing_aids_sales_and_supplies
                  | :heating_plumbing_a_c
                  | :hobby_toy_and_game_shops
                  | :home_supply_warehouse_stores
                  | :hospitals
                  | :hotels_motels_and_resorts
                  | :household_appliance_stores
                  | :industrial_supplies
                  | :information_retrieval_services
                  | :insurance_default
                  | :insurance_underwriting_premiums
                  | :intra_company_purchases
                  | :jewelry_stores_watches_clocks_and_silverware_stores
                  | :landscaping_services
                  | :laundries
                  | :laundry_cleaning_services
                  | :legal_services_attorneys
                  | :luggage_and_leather_goods_stores
                  | :lumber_building_materials_stores
                  | :manual_cash_disburse
                  | :marinas_service_and_supplies
                  | :masonry_stonework_and_plaster
                  | :massage_parlors
                  | :medical_and_dental_labs
                  | :medical_dental_ophthalmic_and_hospital_equipment_and_supplies
                  | :medical_services
                  | :membership_organizations
                  | :mens_and_boys_clothing_and_accessories_stores
                  | :mens_womens_clothing_stores
                  | :metal_service_centers
                  | :miscellaneous
                  | :miscellaneous_apparel_and_accessory_shops
                  | :miscellaneous_auto_dealers
                  | :miscellaneous_business_services
                  | :miscellaneous_food_stores
                  | :miscellaneous_general_merchandise
                  | :miscellaneous_general_services
                  | :miscellaneous_home_furnishing_specialty_stores
                  | :miscellaneous_publishing_and_printing
                  | :miscellaneous_recreation_services
                  | :miscellaneous_repair_shops
                  | :miscellaneous_specialty_retail
                  | :mobile_home_dealers
                  | :motion_picture_theaters
                  | :motor_freight_carriers_and_trucking
                  | :motor_homes_dealers
                  | :motor_vehicle_supplies_and_new_parts
                  | :motorcycle_shops_and_dealers
                  | :motorcycle_shops_dealers
                  | :music_stores_musical_instruments_pianos_and_sheet_music
                  | :news_dealers_and_newsstands
                  | :non_fi_money_orders
                  | :non_fi_stored_value_card_purchase_load
                  | :nondurable_goods
                  | :nurseries_lawn_and_garden_supply_stores
                  | :nursing_personal_care
                  | :office_and_commercial_furniture
                  | :opticians_eyeglasses
                  | :optometrists_ophthalmologist
                  | :orthopedic_goods_prosthetic_devices
                  | :osteopaths
                  | :package_stores_beer_wine_and_liquor
                  | :paints_varnishes_and_supplies
                  | :parking_lots_garages
                  | :passenger_railways
                  | :pawn_shops
                  | :pet_shops_pet_food_and_supplies
                  | :petroleum_and_petroleum_products
                  | :photo_developing
                  | :photographic_photocopy_microfilm_equipment_and_supplies
                  | :photographic_studios
                  | :picture_video_production
                  | :piece_goods_notions_and_other_dry_goods
                  | :plumbing_heating_equipment_and_supplies
                  | :political_organizations
                  | :postal_services_government_only
                  | :precious_stones_and_metals_watches_and_jewelry
                  | :professional_services
                  | :public_warehousing_and_storage
                  | :quick_copy_repro_and_blueprint
                  | :railroads
                  | :real_estate_agents_and_managers_rentals
                  | :record_stores
                  | :recreational_vehicle_rentals
                  | :religious_goods_stores
                  | :religious_organizations
                  | :roofing_siding_sheet_metal
                  | :secretarial_support_services
                  | :security_brokers_dealers
                  | :service_stations
                  | :sewing_needlework_fabric_and_piece_goods_stores
                  | :shoe_repair_hat_cleaning
                  | :shoe_stores
                  | :small_appliance_repair
                  | :snowmobile_dealers
                  | :special_trade_services
                  | :specialty_cleaning
                  | :sporting_goods_stores
                  | :sporting_recreation_camps
                  | :sports_and_riding_apparel_stores
                  | :sports_clubs_fields
                  | :stamp_and_coin_stores
                  | :stationary_office_supplies_printing_and_writing_paper
                  | :stationery_stores_office_and_school_supply_stores
                  | :swimming_pools_sales
                  | :t_ui_travel_germany
                  | :tailors_alterations
                  | :tax_payments_government_agencies
                  | :tax_preparation_services
                  | :taxicabs_limousines
                  | :telecommunication_equipment_and_telephone_sales
                  | :telecommunication_services
                  | :telegraph_services
                  | :tent_and_awning_shops
                  | :testing_laboratories
                  | :theatrical_ticket_agencies
                  | :timeshares
                  | :tire_retreading_and_repair
                  | :tolls_bridge_fees
                  | :tourist_attractions_and_exhibits
                  | :towing_services
                  | :trailer_parks_campgrounds
                  | :transportation_services
                  | :travel_agencies_tour_operators
                  | :truck_stop_iteration
                  | :truck_utility_trailer_rentals
                  | :typesetting_plate_making_and_related_services
                  | :typewriter_stores
                  | :u_s_federal_government_agencies_or_departments
                  | :uniforms_commercial_clothing
                  | :used_merchandise_and_secondhand_stores
                  | :utilities
                  | :variety_stores
                  | :veterinary_services
                  | :video_amusement_game_supplies
                  | :video_game_arcades
                  | :video_tape_rental_stores
                  | :vocational_trade_schools
                  | :watch_jewelry_repair
                  | :welding_repair
                  | :wholesale_clubs
                  | :wig_and_toupee_stores
                  | :wires_money_orders
                  | :womens_accessory_and_specialty_shops
                  | :womens_ready_to_wear_stores
                  | :wrecking_and_salvage_yards
                ]
              },
              :phone_number => String.t(),
              :metadata => map(),
              :individual => %{
                :verification => %{:document => %{:front => String.t(), :back => String.t()}},
                :last_name => String.t(),
                :first_name => String.t(),
                :dob => %{:year => integer(), :month => integer(), :day => integer()}
              },
              :expand => [String.t()],
              :email => String.t(),
              :company => %{:tax_id => String.t()},
              :billing => %{
                :address => %{
                  :state => String.t(),
                  :postal_code => String.t(),
                  :line2 => String.t(),
                  :line1 => String.t(),
                  :country => String.t(),
                  :city => String.t()
                }
              }
            }
            | map(),
          cardholder :: String.t()
        ) :: {:ok, any()} | {:error, any()}
  def post_issuing_cardholders_cardholder(%ExOAPI.Client{} = client, body, cardholder) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:post)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders/{cardholder}")
    |> ExOAPI.Client.add_body(body)
    |> ExOAPI.Client.replace_in_path("cardholder", cardholder)
    |> ExOAPI.Client.request()
  end

  @doc """
  **description**: <p>Retrieves an Issuing <code>Cardholder</code> object.</p>

  """
  @type get_issuing_cardholders_cardholder_opts :: {:expand, String.t()}
  @spec get_issuing_cardholders_cardholder(
          client :: ExOAPI.Client.t(),
          cardholder :: String.t(),
          list(get_issuing_cardholders_cardholder_opts())
        ) :: {:ok, any()} | {:error, any()}
  def get_issuing_cardholders_cardholder(%ExOAPI.Client{} = client, cardholder, opts \\ []) do
    client
    |> ExOAPI.Client.set_module(ExOAPI.Stripe.SDK)
    |> ExOAPI.Client.add_method(:get)
    |> ExOAPI.Client.add_base_url("https://api.stripe.com/", :exoapi_default)
    |> ExOAPI.Client.add_path("/v1/issuing/cardholders/{cardholder}")
    |> ExOAPI.Client.replace_in_path("cardholder", cardholder)
    |> ExOAPI.Client.add_arg_opts(:keyword, :query, opts, [
      {:expand, "expand", "deepObject", true}
    ])
    |> ExOAPI.Client.request()
  end
end