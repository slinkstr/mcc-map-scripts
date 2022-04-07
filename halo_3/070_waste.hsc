; Decompiled with Blamite
; Source file: 070_waste.hsc
; Start time: 4/7/2022 7:27:25
; Decompilation finished in ~0.015128s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global boolean perspective_running false)
(global boolean perspective_finished false)
(global boolean g_cortana_header false)
(global boolean g_cortana_footer false)
(global boolean g_gravemind_header false)
(global boolean g_gravemind_footer false)
(global boolean b_070_music_01 false)
(global boolean b_070_music_02 false)
(global boolean b_070_music_03 false)
(global boolean b_070_music_04 false)
(global boolean b_070_music_05 false)
(global boolean b_070_music_06 false)
(global boolean b_070_music_07 false)
(global boolean b_070_music_08 false)
(global boolean b_070_music_085 false)
(global boolean b_070_music_086 false)
(global boolean b_070_music_09 false)
(global short s_070_music_10 0)
(global boolean b_070_music_11 false)
(global boolean b_070_music_12 false)
(global boolean b_070_music_13 false)
(global boolean b_070_music_14 false)
(global boolean b_070_music_15 false)
(global ai arbiter none)
(global ai elite none)
(global ai female_marine none)
(global ai guilty_spark none)
(global ai johnson none)
(global ai hocus none)
(global ai marine none)
(global ai marine_01 none)
(global ai marine_02 none)
(global ai marine_03 none)
(global ai marine_04 none)
(global ai marine_05 none)
(global ai marine_06 none)
(global ai marine_07 none)
(global ai marine_08 none)
(global ai odst none)
(global ai odst_01 none)
(global ai odst_02 none)
(global ai odst_03 none)
(global ai pilot none)
(global ai sergeant none)
(global boolean b_playing_dialogue false)
(global vehicle obj_lz_pelican_0 none)
(global vehicle obj_lz_pelican_1 none)
(global boolean b_truth_speech_finished false)
(global object_list ol_ex_temp_list (players))
(global ai md_fl_cheer_marine_0 none)
(global ai md_fl_cheer_marine_1 none)
(global ai md_fl_cheer_marine_2 none)
(global ai md_fl_cheer_marine_3 none)
(global ai md_fl_cheer_marine_4 none)
(global ai md_fl_cheer_marine_5 none)
(global ai md_fl_cheer_marine_6 none)
(global ai md_fl_cheer_marine_7 none)
(global ai md_fl_cheer_marine_8 none)
(global boolean b_vd_warthogs_advance false)
(global boolean b_vd_phantom_advance false)
(global short s_abb_guilty_dialog 0)
(global short s_abb_guilty_speak_frequence 10)
(global boolean b_bb_stop_scarab_hint false)
(global boolean b_f1_gs_advance false)
(global ai phantom none)
(global ai brute none)
(global boolean debug true)
(global boolean b_debug true)
(global boolean b_dialogue true)
(global boolean b_cinematic true)
(global boolean b_gs_follow_player false)
(global long s_gs_walkup_dist 3)
(global long s_gs_talking_dist 4)
(global long g_insertion_index 0)
(global ai_line g_gs_1st_line 070mh_450)
(global ai_line g_gs_2nd_line 070mk_150)
(global object obj_arbiter none)
(global object obj_guilty_spark none)
(global boolean g_null false)
(global boolean b_gs_said_1st_line false)
(global boolean b_gs_said_2nd_line false)
(global short g_current_zone_set 100)
(global short g_current_active_zone_set 100)
(global object obj_player_vehicle none)
(global ai ai_return_squad none)
(global object_list ol_unit_list (players))
(global object obj_current_unit none)
(global short s_list_count 0)
(global short s_list_index 0)
(global real s_truth_count 0.0)
(global short s_lz_progression 0)
(global ai ai_fly_johnson "allies_lz_johnson")
(global ai ai_fly_pelican_marines_0 "allies_lz_marines_0")
(global ai ai_fly_pelican_marines_1 "allies_lz_marines_0")
(global ai ai_fly_pelican_marines_2 "allies_lz_marines_0")
(global ai ai_fly_pelican_commander "allies_lz_marines_0")
(global boolean b_lz_pelican_0_arrived false)
(global boolean b_lz_pelican_1_arrived false)
(global short s_b1_progression 0)
(global boolean b_b1_finished false)
(global boolean b_b1_combat_started false)
(global boolean b_b1_wake false)
(global short s_b1_allies_progression 0)
(global short s_b2_progression 0)
(global boolean b_b2_combat_started false)
(global boolean b_b2_hunters_placed false)
(global boolean b_b2_finished false)
(global boolean b_b2_elites_charge false)
(global boolean b_b2_hunters_dead false)
(global vehicle b2_phantom none)
(global ai ai_b2_grunts_0 none)
(global ai ai_b2_grunts_1 none)
(global short s_fp_progression 0)
(global short s_ex_progression 0)
(global boolean b_ex_p1_finished false)
(global boolean b_ex_p1_has_started false)
(global ai ai_gunner_brute "cov_ex_pack/brute")
(global boolean b_ex_has_started false)
(global boolean b_ex_part_2_finished false)
(global boolean b_ex_mauler_charge false)
(global boolean b_ex_cave_finished false)
(global boolean b_ex_maulers_spawned false)
(global short s_ex_nb_allies 0)
(global boolean b_ex_cave_dialog_finished false)
(global vehicle veh_mauler_0 none)
(global vehicle veh_mauler_1 none)
(global short s_sd_progression 0)
(global boolean b_sd_grunts_flee false)
(global boolean b_sd_more_sentinel_spawned false)
(global boolean b_sd_warthog_can_go false)
(global boolean b_sd_finished false)
(global boolean b_sd_cartographer_hint false)
(global boolean b_sd_sentinels_charge false)
(global short s_sd_sentinel_count 2)
(global short s_aw_progression 0)
(global boolean b_aw_marines_advance false)
(global boolean b_aw_wraith_advance false)
(global boolean b_aw_aa_attacks_player false)
(global boolean b_aw_spawned_ghosts false)
(global short s_fl_progression 0)
(global short s_fl_position 0)
(global boolean b_fl_begins false)
(global boolean b_fl_frigate_arrives false)
(global boolean b_fl_frigate_arrived false)
(global boolean b_fl_chief_in_vehicle false)
(global boolean b_fl_pelican_arrived false)
(global boolean 070pa_dialog_done false)
(global boolean b_fl_070bb_done false)
(global boolean b_fl_pelican_unloaded false)
(global boolean b_fl_briefing_finished false)
(global boolean b_fl_frigate_unloading false)
(global boolean b_fl_tanks_available false)
(global boolean b_la_can_start false)
(global short s_fl_list_index 0)
(global short s_fl_list_count 0)
(global unit obj_fl_current_unit none)
(global ai ai_fl_johnson "allies_fl_johnson")
(global ai ai_fl_sergeant "allies_fl_pelican_marines/sergeant")
(global ai ai_fl_pelican_marines_0 "allies_fl_pelican_marines/marine_0")
(global ai ai_fl_pelican_marines_1 "allies_fl_pelican_marines/marine_1")
(global ai ai_fl_pelican_marines_2 "allies_fl_pelican_marines/marine_2")
(global vehicle obj_fl_scorpion_0 none)
(global vehicle obj_fl_scorpion_1 none)
(global vehicle obj_fl_scorpion_2 none)
(global vehicle obj_fl_warthog none)
(global object_list obj_fl_vehicles (players))
(global short s_fl_odst_turn 0)
(global short s_la_progression 0)
(global boolean b_la_spawn_p1 false)
(global short s_la_teleport_count 0)
(global short s_dw_progression 0)
(global boolean b_dw_reinf_arrived false)
(global boolean b_dw_combat_finished false)
(global boolean b_dw_gs_open_door false)
(global boolean b_dw_found_empty_vehicle false)
(global short s_dw_list_index 0)
(global short s_dw_list_count 0)
(global unit obj_dw_current_unit none)
(global object_list ol_dw_vehicles (players))
(global short s_lb_progression 0)
(global boolean b_lb_lightbridge_on false)
(global short s_lb_constructor_position 0)
(global short s_lb_teleport_count 0)
(global short s_lb_list_index 0)
(global short s_lb_list_count 0)
(global unit obj_lb_current_unit none)
(global object_list ol_lb_vehicles (players))
(global short s_lb_nb_tank 0)
(global short s_lb_sentinel_spawner 0)
(global boolean b_lb_gs_open_door false)
(global boolean b_lb_constructors_exit false)
(global short s_bb_progression 0)
(global short s_bb_position 0)
(global short s_bb_skip_progression 0)
(global boolean b_bb_trying_save false)
(global boolean b_bb_player_went_canyon false)
(global boolean b_bb_dropped_3rd_floor false)
(global boolean b_bb_dropped_cache_defense false)
(global boolean b_bb_ghosts_escort_wraiths false)
(global boolean b_bb_wraith_dropped false)
(global boolean b_bb_warthog_spawned false)
(global boolean b_bb_scarab_battle_begun false)
(global boolean bb_scarab_spawned false)
(global boolean b_bb_scarab_over_head_created false)
(global short s_bb_list_index 0)
(global short s_bb_list_count 0)
(global unit obj_bb_current_unit none)
(global object_list ol_bb_vehicles (players))
(global object obj_bb_scarab none)
(global short s_bb_allies_progression 0)
(global boolean b_bb_shipmaster_dialog_finished false)
(global boolean b_bb_phantom_retreat false)
(global boolean b_abb_pelican_arrived false)
(global ai ai_abb_arbiter "allies_abb_arbiter")
(global ai ai_abb_johnson "allies_abb_johnson")
(global ai ai_abb_pelican_marines_0 "allies_abb_pelican_marines")
(global ai ai_abb_pelican_marines_1 "allies_abb_pelican_marines")
(global short s_abb_progression 0)
(global boolean b_abb_start_abb_now false)
(global boolean b_abb_gs_inside_shaft false)
(global boolean b_abb_has_started false)
(global boolean b_abb_pelican_marines_moving false)
(global short s_abb_loop_index 0)
(global short s_f1_progression 0)
(global boolean b_f1_prepare_to_combat false)
(global boolean b_f1_allies_wait false)
(global boolean b_f1_start_now false)
(global boolean b_f1_combat_started false)
(global boolean b_f1_combat_finished false)
(global boolean b_f1_ambiant_finished false)
(global boolean b_f1_has_started false)
(global short s_f2_progression 0)
(global boolean b_f2_has_started false)
(global boolean b_f2_combat_started false)
(global boolean b_f2_gs_terminal true)
(global boolean b_f3_combat_started false)
(global boolean b_f3_grunts_wake_up false)
(global short s_f3_marine_count 0)
(global short s_f3_p1_progression 0)
(global short s_f3_p2_progression 0)
(global boolean b_f3_p2_started false)
(global boolean b_f3_p2_gs_guide false)
(global boolean b_f3_has_started false)
(global boolean b_f3_p1_int_combat_finished false)
(global boolean b_f3_p2_combat_finished false)
(global boolean b_f3_p2_take_combat_outside false)
(global object_list ol_f3_p1_brutes (players))
(global boolean b_f3_objective_dialog_done false)
(global boolean b_f4_enable_right false)
(global boolean b_f4_enable_left false)
(global boolean b_f4_enable_top false)
(global short b_f4_timer_right 0)
(global short b_f4_timer_left 0)
(global short b_f4_timer_max 6)
(global boolean b_f4_fight_finished false)
(global boolean b_f4_has_started false)
(global short s_f4_progression 0)
(global boolean b_f5_pelican_arrived false)
(global boolean b_f5_has_started false)
(global boolean b_f5_combat_finished false)
(global boolean b_f5_chieftain_charge false)
(global boolean b_f5_stop_cheering false)
(global short s_f5_progression 0)
(global short s_f5_jetpack_action 0)
(global boolean b_ee_unlocked false)


; SCRIPTS

(script static void ai_trickle_via_phantom (ai vehicle_starting_location, ai spawned_squad)
    (ai_place spawned_squad)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc (ai_actors spawned_squad))
    (sleep 1)
    (object_set_phantom_power (ai_vehicle_get_from_starting_location vehicle_starting_location) true)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_1)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_2)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_3)
    (sleep 60)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_4)
    (sleep 60)
    (object_set_phantom_power (ai_vehicle_get_from_starting_location vehicle_starting_location) false)
)

(script static void ai_dump_via_phantom (ai vehicle_starting_location, ai spawned_squad)
    (ai_place spawned_squad)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc (ai_actors spawned_squad))
    (sleep 1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc)
)

(script static void ai_disembark_via_phantom (ai vehicle_starting_location, ai spawned_squad)
    (unit_open (ai_vehicle_get_from_starting_location vehicle_starting_location))
    (sleep 45)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_main)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_main)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_main)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_main)
    (sleep 120)
    (unit_close (ai_vehicle_get_from_starting_location vehicle_starting_location))
)

(script static unit player0
    (unit (list_get (players) 0))
)

(script static unit player1
    (unit (list_get (players) 1))
)

(script static unit player2
    (unit (list_get (players) 2))
)

(script static unit player3
    (unit (list_get (players) 3))
)

(script static short player_count
    (list_count (players))
)

(script static void print_difficulty
    (game_save_immediate)
    (cond
        ((= (game_difficulty_get_real) easy)
            (print "easy")
        )
        ((= (game_difficulty_get_real) normal)
            (print "normal")
        )
        ((= (game_difficulty_get_real) heroic)
            (print "heroic")
        )
        ((= (game_difficulty_get_real) legendary)
            (print "legendary")
        )
    )
)

(script static boolean difficulty_legendary
    (= (game_difficulty_get) legendary)
)

(script static boolean difficulty_heroic
    (= (game_difficulty_get) heroic)
)

(script static boolean difficulty_normal
    (= (game_difficulty_get) normal)
)

(script static boolean players_not_in_combat
    (player_action_test_reset)
    (sleep 30)
    (if 
        (and
            (not (player_action_test_primary_trigger))
            (not (player_action_test_grenade_trigger))
            (cond
                ((= (game_coop_player_count) 4)
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                        (>= (object_get_shield (player1)) 1.0)
                        (>= (object_get_shield (player2)) 1.0)
                        (>= (object_get_shield (player3)) 1.0)
                    )
                )
                ((= (game_coop_player_count) 3)
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                        (>= (object_get_shield (player1)) 1.0)
                        (>= (object_get_shield (player2)) 1.0)
                    )
                )
                ((= (game_coop_player_count) 2)
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                        (>= (object_get_shield (player1)) 1.0)
                    )
                )
                (true
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                    )
                )
            )
        ) 
            true false)
)

(script static boolean cinematic_skip_start
    (cinematic_skip_start_internal)
    (game_save_cinematic_skip)
    (sleep_until (not (game_saving)) 1)
    (not (game_reverted))
)

(script static void cinematic_skip_stop
    (cinematic_skip_stop_internal)
    (if (not (game_reverted)) 
        (game_revert))
)

(script static void cinematic_fade_to_black
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (player_control_fade_out_all_input 1.0)
    (campaign_metagame_time_pause true)
    (unit_lower_weapon (player0) 30)
    (unit_lower_weapon (player1) 30)
    (unit_lower_weapon (player2) 30)
    (unit_lower_weapon (player3) 30)
    (sleep 10)
    (chud_cinematic_fade 0.0 0.5)
    (cinematic_show_letterbox true)
    (sleep 5)
    (fade_out 0.0 0.0 0.0 30)
    (sleep 30)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (cinematic_start)
    (camera_control true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
)

(script static void cinematic_snap_to_black
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (fade_out 0.0 0.0 0.0 0)
    (player_control_fade_out_all_input 0.0)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (chud_cinematic_fade 0.0 0.0)
    (campaign_metagame_time_pause true)
    (sleep 1)
    (cinematic_start)
    (camera_control true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
    (sleep 1)
)

(script static void cinematic_fade_to_title
    (sleep 15)
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
)

(script static void cinematic_fade_to_title_slow
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0.0 0.0 0.0 150)
    (sleep 15)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
)

(script static void cinematic_title_to_gameplay
    (sleep 30)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (player_disable_movement false)
    (sleep 110)
    (cinematic_show_letterbox false)
    (sleep 15)
    (chud_cinematic_fade 1.0 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (game_save)
)

(script static void cinematic_fade_to_gameplay
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_show_letterbox false)
    (chud_cinematic_fade 1.0 1.0)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_disable_movement false)
    (game_save)
)

(script static void chapter_start
    (chud_cinematic_fade 0.0 0.5)
    (cinematic_show_letterbox true)
    (sleep 30)
)

(script static void chapter_stop
    (cinematic_show_letterbox false)
    (sleep 15)
    (chud_cinematic_fade 1.0 0.5)
    (game_save)
)

(script static void perspective_start
    (game_save_cancel)
    (cinematic_skip_start_internal)
    (ai_disregard (player0) true)
    (ai_disregard (player1) true)
    (ai_disregard (player2) true)
    (ai_disregard (player3) true)
    (object_cannot_take_damage (player0))
    (object_cannot_take_damage (player1))
    (object_cannot_take_damage (player2))
    (object_cannot_take_damage (player3))
    (player_control_fade_out_all_input 2.0)
    (unit_lower_weapon (player0) 30)
    (unit_lower_weapon (player1) 30)
    (unit_lower_weapon (player2) 30)
    (unit_lower_weapon (player3) 30)
    (chud_cinematic_fade 0.0 0.5)
    (sleep 15)
    (cinematic_show_letterbox true)
    (sleep 5)
    (fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (camera_control true)
    (cinematic_start)
    (sleep 15)
)

(script static void perspective_stop
    (cinematic_stop)
    (camera_control false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (player_control_fade_in_all_input 0.5)
    (fade_in 0.0 0.0 0.0 10)
    (sleep 5)
    (cinematic_show_letterbox false)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (chud_cinematic_fade 1.0 0.5)
    (ai_disregard (player0) false)
    (ai_disregard (player1) false)
    (ai_disregard (player2) false)
    (ai_disregard (player3) false)
    (object_can_take_damage (player0))
    (object_can_take_damage (player1))
    (object_can_take_damage (player2))
    (object_can_take_damage (player3))
    (game_save)
)

(script static void perspective_skipped
    (cinematic_stop)
    (camera_control false)
    (ai_disregard (player0) false)
    (ai_disregard (player1) false)
    (ai_disregard (player2) false)
    (ai_disregard (player3) false)
    (object_can_take_damage (player0))
    (object_can_take_damage (player1))
    (object_can_take_damage (player2))
    (object_can_take_damage (player3))
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 5)
    (player_control_fade_in_all_input 1.0)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (unit_raise_weapon (player0) 15)
    (unit_raise_weapon (player1) 15)
    (unit_raise_weapon (player2) 15)
    (unit_raise_weapon (player3) 15)
    (game_save)
)

(script static boolean perspective_skip_start
    (player_action_test_reset)
    (sleep_until 
        (or
            (not perspective_running)
            (player_action_test_cinematic_skip)
        ) 
    1)
    perspective_running
)

(script static void insertion_start
    (fade_out 0.0 0.0 0.0 0)
    (sound_class_set_gain "object" 0.0 0)
    (sound_class_set_gain "vehicle" 0.0 0)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (player_disable_movement true)
    (player_enable_input false)
    (campaign_metagame_time_pause true)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (sound_class_set_gain "object" 1.0 30)
    (sound_class_set_gain "vehicle" 1.0 30)
)

(script dormant void insertion_end
    (sleep 30)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_show_letterbox false)
    (player_control_fade_in_all_input 1.0)
    (sleep 15)
    (chud_cinematic_fade 1.0 1.0)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_enable_input true)
    (player_disable_movement false)
    (game_save)
)

(script static ai ai_get_driver (ai vehicle_starting_location)
    (object_get_ai (vehicle_driver (ai_vehicle_get_from_starting_location vehicle_starting_location)))
)

(script static ai ai_get_gunner (ai vehicle_starting_location)
    (object_get_ai (vehicle_gunner (ai_vehicle_get_from_starting_location vehicle_starting_location)))
)

(script static boolean any_players_in_vehicle
    (or
        (unit_in_vehicle (unit (player0)))
        (unit_in_vehicle (unit (player1)))
        (unit_in_vehicle (unit (player2)))
        (unit_in_vehicle (unit (player3)))
    )
)

(script static void shut_door_forever (device machine_door)
    (device_operates_automatically_set machine_door false)
    (device_set_position machine_door 0.0)
    (sleep_until (<= (device_get_position machine_door) 0.0) 30 300)
    (if (> (device_get_position machine_door) 0.0) 
        (device_set_position_immediate machine_door 0.0))
    (sleep 1)
    (device_set_power machine_door 0.0)
)

(script static void shut_door_forever_immediate (device machine_door)
    (device_operates_automatically_set machine_door false)
    (device_set_position_immediate machine_door 0.0)
    (device_set_power machine_door 0.0)
)

(script dormant void reset_map_reminder
    (sleep_until 
        (begin
            (print "press a to play again!")
            false
        ) 
    90)
)

(script static void end_segment
    (print "end gameplay segment!  thank you for playing!")
    (sleep 15)
    (print "grab paul or rob to give feedback!")
    (sleep 15)
    (player_action_test_reset)
    (sleep_until 
        (begin
            (print "press the “a” button to reset!")
            (sleep_until (player_action_test_accept) 1 90)
            (player_action_test_accept)
        ) 
    1)
    (print "reloading map...")
    (sleep 15)
    (chud_cinematic_fade 1.0 0.0)
    (fade_in 0.0 0.0 0.0 0)
    (map_reset)
)

(script static void end_mission
    (if global_playtest_mode 
        (begin
            (data_mine_set_mission_segment "questionaire")
            (cinematic_fade_to_gameplay)
            (sleep 1)
            (print "end mission!")
            (sleep 15)
            (hud_set_training_text "playtest_raisehand")
            (hud_show_training_text true)
            (sleep 90)
            (player_action_test_reset)
            (sleep_until 
                (begin
                    (sleep_until (player_action_test_accept) 1 90)
                    (player_action_test_accept)
                ) 
            1)
            (hud_show_training_text false)
            (print "loading next mission...")
            (sleep 15)
        ) (begin
            (fade_out 0.0 0.0 0.0 0)
            (cinematic_stop)
            (camera_control false)
        )
    )
    (game_won)
)

(script startup void beginning_mission_segment
    (data_mine_set_mission_segment "mission_start")
)

(script continuous void gs_cortana_header
    (sleep_until g_cortana_header 1)
    (print "cortana header")
    (game_save_cancel)
    (game_safe_to_respawn false)
    (player_control_scale_all_input 0.15 0.5)
    (ai_dialogue_enable false)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (damage_players "cinematics\cortana_channel\cortana_effect")
    (gs_hud_flicker_out)
    (set g_cortana_header false)
)

(script continuous void gs_cortana_footer
    (sleep_until g_cortana_footer 1)
    (print "cortana footer")
    (sleep 1)
    (game_safe_to_respawn true)
    (player_control_scale_all_input 1.0 0.5)
    (ai_dialogue_enable true)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (sleep 1)
    (game_save)
    (chud_cinematic_fade 1.0 1.5)
    (sound_impulse_start "sound\visual_fx\cortana_hud_on" none 1.0)
    (set g_cortana_footer false)
)

(script continuous void gs_gravemind_header
    (sleep_until g_gravemind_header 1)
    (print "gravemind header")
    (game_save_cancel)
    (game_safe_to_respawn false)
    (player_control_scale_all_input 0.15 2.0)
    (ai_dialogue_enable false)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (sleep 1)
    (set g_gravemind_header false)
)

(script continuous void gs_gravemind_footer
    (sleep_until g_gravemind_footer 1)
    (print "gravemind footer")
    (game_safe_to_respawn true)
    (player_control_scale_all_input 1.0 1.0)
    (ai_dialogue_enable true)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (sleep 1)
    (set g_gravemind_footer false)
    (sleep 30)
    (game_save)
)

(script static void gs_hud_flicker_out
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
)

(script static boolean award_skull
    (if 
        (and
            (>= (game_difficulty_get_real) normal)
            (= (game_insertion_point_get) 0)
        ) 
            true false)
)

(script dormant void 070_music_01
    (sleep_until b_070_music_01)
    (if b_debug 
        (print "start music 070_01"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_01" none 1.0)
    (sleep_until (not b_070_music_01))
    (if b_debug 
        (print "stop music 070_01"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_01")
)

(script dormant void 070_music_02
    (sleep_until b_070_music_02)
    (if b_debug 
        (print "start music 070_02"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_02" none 1.0)
    (sleep_until (not b_070_music_02))
    (if b_debug 
        (print "stop music 070_02"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_02")
)

(script dormant void 070_music_03
    (sleep_until b_070_music_03)
    (if b_debug 
        (print "start music 070_03"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_03" none 1.0)
    (sleep_until (not b_070_music_03))
    (if b_debug 
        (print "stop music 070_03"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_03")
)

(script dormant void 070_music_04
    (sleep_until b_070_music_04 10)
    (if b_debug 
        (print "start music 070_04"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_04" none 1.0)
    (sleep_until (not b_070_music_04))
    (if b_debug 
        (print "stop music 070_04"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_04")
)

(script dormant void 070_music_05
    (sleep_until b_070_music_05)
    (if b_debug 
        (print "start music 070_05"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_05" none 1.0)
    (sleep_until (not b_070_music_05))
    (if b_debug 
        (print "stop music 070_05"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_05")
)

(script dormant void 070_music_06
    (sleep_until b_070_music_06)
    (if b_debug 
        (print "start music 070_06"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_06" none 1.0)
    (sleep_until (not b_070_music_06) 5)
    (if b_debug 
        (print "stop music 070_06"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_06")
)

(script dormant void 070_music_065
    (sleep_until (>= s_aw_progression 20))
    (if b_debug 
        (print "start music 070_065"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_065" none 1.0)
    (sleep_until 
        (or
            (>= s_aw_progression 30)
            (<= (ai_living_count "cov_aw_wraith_0") 0)
            (<= (ai_living_count "cov_aw_wraith_1") 0)
            (<= (ai_living_count "cov_aw_wraith_2") 0)
        )
    )
    (if b_debug 
        (print "stop music 070_065"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_065")
)

(script dormant void 070_music_07
    (sleep_until b_070_music_07)
    (if b_debug 
        (print "start music 070_07"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_07" none 1.0)
    (sleep_until (not b_070_music_07))
    (if b_debug 
        (print "stop music 070_07"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_07")
)

(script dormant void 070_music_08
    (sleep_until b_070_music_08)
    (if b_debug 
        (print "start music 070_08"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_08" none 1.0)
    (sleep_until (not b_070_music_08))
    (if b_debug 
        (print "stop music 070_08"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_08")
)

(script dormant void 070_music_085
    (sleep_until 
        (or
            (volume_test_players "vol_dw_turn_corner")
            (>= s_dw_progression 20)
            b_070_music_085
        )
    )
    (if b_debug 
        (print "start music 070_085"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_085" none 1.0)
    (set b_070_music_085 true)
    (sleep_until 
        (or
            (not b_070_music_085)
            b_dw_combat_finished
        )
    )
    (if b_debug 
        (print "stop music 070_085"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_085")
)

(script dormant void 070_music_086
    (sleep_until b_070_music_086)
    (if b_debug 
        (print "start music 070_086"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_086" none 1.0)
    (sleep_until (not b_070_music_086))
    (if b_debug 
        (print "stop music 070_086"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_086")
)

(script dormant void 070_music_09
    (sleep_until b_070_music_09)
    (if b_debug 
        (print "start music 070_09"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_09" none 1.0)
    (sleep_until (not b_070_music_09))
    (if b_debug 
        (print "stop music 070_09"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_09")
)

(script dormant void 070_music_10
    (sleep_until (>= s_070_music_10 1) 1)
    (if b_debug 
        (print "start music 070_10"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_10" none 1.0)
    (sleep_until (>= s_070_music_10 2) 1)
    (if b_debug 
        (print "start alternate music 070_10"))
    (sound_looping_set_alternate "levels\solo\070_waste\music\070_music_10" true)
    (if b_debug 
        (print "start music 070_101"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_101" none 1.0)
    (sleep_until (>= s_070_music_10 3) 1)
    (if b_debug 
        (print "stop alternate music 070_10"))
    (sound_looping_set_alternate "levels\solo\070_waste\music\070_music_10" false)
    (if b_debug 
        (print "start music 070_102"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_102" none 1.0)
    (if b_debug 
        (print "stop music 070_101"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_101")
    (sleep_until (>= s_070_music_10 4) 1)
    (if b_debug 
        (print "start alternate music 070_10"))
    (sound_looping_set_alternate "levels\solo\070_waste\music\070_music_10" true)
    (if b_debug 
        (print "start music 070_103"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_103" none 1.0)
    (sleep_until (>= s_070_music_10 5) 1)
    (if b_debug 
        (print "stop music 070_10"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_10")
    (if b_debug 
        (print "stop music 070_102"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_102")
    (if b_debug 
        (print "stop music 070_103"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_103")
)

(script dormant void 070_music_11
    (sleep_until b_070_music_11)
    (if b_debug 
        (print "start music 070_11"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_11" none 1.0)
    (sleep_until (not b_070_music_11))
    (if b_debug 
        (print "stop music 070_11"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_11")
)

(script dormant void 070_music_12
    (sleep_until b_070_music_12)
    (if b_debug 
        (print "start music 070_12"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_12" none 1.0)
    (sleep_until (not b_070_music_12))
    (if b_debug 
        (print "stop music 070_12"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_12")
)

(script dormant void 070_music_13
    (sleep_until b_070_music_13)
    (if b_debug 
        (print "start music 070_13"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_13" none 1.0)
    (sleep_until (not b_070_music_13))
    (if b_debug 
        (print "stop music 070_13"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_13")
)

(script dormant void 070_music_14
    (sleep_until b_070_music_14)
    (if b_debug 
        (print "start music 070_14"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_14" none 1.0)
    (sleep_until (not b_070_music_14))
    (if b_debug 
        (print "stop music 070_14"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_14")
)

(script dormant void 070_music_15
    (sleep_until b_070_music_15)
    (if b_debug 
        (print "start music 070_15"))
    (sound_looping_start "levels\solo\070_waste\music\070_music_15" none 1.0)
    (sleep_until (not b_070_music_15))
    (if b_debug 
        (print "stop music 070_15"))
    (sound_looping_stop "levels\solo\070_waste\music\070_music_15")
)

(script dormant void 070_chapter_installation
    (chapter_start)
    (cinematic_set_title "title_1")
    (cinematic_title_to_gameplay)
    (objective_1_set)
    (cinematic_set_chud_objective "obj_0")
)

(script dormant void 070_chapter_forward
    (objective_1_clear)
    (objective_2_set)
    (objective_3_set)
    (game_insertion_point_unlock 1)
    (if (= (game_insertion_point_get) 0) 
        (chapter_start) (sleep 30))
    (cinematic_set_title "title_2")
    (if (= (game_insertion_point_get) 0) 
        (begin
            (sleep 150)
            (chapter_stop)
        ) (cinematic_title_to_gameplay))
    (sleep_until b_fl_070bb_done 30 660)
    (cinematic_set_chud_objective "obj_1")
    (sleep 360)
    (cinematic_set_chud_objective "obj_2")
)

(script dormant void 070_chapter_real_men
    (game_insertion_point_unlock 2)
    (if (<= (game_insertion_point_get) 1) 
        (chapter_start) (sleep 30))
    (cinematic_set_title "title_3")
    (if (<= (game_insertion_point_get) 1) 
        (begin
            (sleep 150)
            (chapter_stop)
        ) (cinematic_title_to_gameplay))
)

(script dormant void 070_evac_objective
    (objective_4_set)
    (sleep_until 
        (or
            b_f3_objective_dialog_done
            (>= s_f3_p2_progression 30)
        ) 
    30 1800)
    (cinematic_set_chud_objective "obj_3")
)

(script static void md_cleanup
    (print "md_cleanup")
    (set b_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script static void md_dialogue_start
    (print "md_dialogue_start")
    (set b_playing_dialogue true)
    (ai_dialogue_enable false)
    (sleep 15)
)

(script static void md_dialogue_stop
    (print "md_dialogue_stop")
    (set b_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void 070va_ark_arrival
    (if b_debug 
        (print "vignette:070va_ark_arrival"))
    (vs_cast ai_fly_johnson false 10 "070va_130")
    (set johnson (vs_role 1))
    (vs_cast ai_fly_pelican_marines_0 false 10 "070mx_010")
    (set odst_01 (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (sleep 15)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" false)
    (vs_enable_targeting "gr_allies" false)
    (vs_enable_moving "gr_allies" false)
    (sleep 1)
    (if b_dialogue 
        (print "odst_1: that's some view..."))
    (vs_play_line odst_01 true 070mx_010)
    (sleep 4)
    (if b_dialogue 
        (print "johnson: enjoy it while you can, marines."))
    (vs_play_line johnson true 070va_130)
    (sleep 4)
    (if b_dialogue 
        (print "johnson: soon as we land, we're right back to it!"))
    (vs_play_line johnson true 070va_135)
    (sleep 15)
    (if b_dialogue 
        (print "johnson: priority one: secure a landing-zone for the commander's frigate."))
    (vs_play_line johnson true 070va_140)
    (sleep 4)
    (if b_dialogue 
        (print "johnson: but keep your eyes and ears open"))
    (vs_play_line johnson true 070va_150)
    (sleep 4)
    (if b_dialogue 
        (print "johnson: we need all the intel we can get -- on wherever the hell we are!"))
    (vs_play_line johnson true 070va_160)
    (sleep 4)
    (vs_release_all)
)

(script dormant void md_lz_pelican_arrives
    (sleep_until 
        (and
            b_lz_pelican_0_arrived
            (not b_playing_dialogue)
        ) 
    10)
    (if b_debug 
        (print "mission dialogue:lz:pelican:arrives"))
    (vs_cast ai_fly_johnson true 10 "070ma_010")
    (set johnson (vs_role 1))
    (vs_cast ai_fly_pelican_marines_0 false 10 "070ma_020")
    (set odst_01 (vs_role 1))
    (vs_cast ai_fly_pelican_marines_1 false 10 "070ma_020")
    (set odst_02 (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving "gr_allies" true)
    (sleep 1)
    (if b_dialogue 
        (print "johnson: stand to, marines!"))
    (vs_play_line johnson true 070ma_010)
    (sleep 10)
    (if b_dialogue 
        (print "odst(s): ooh-rah!"))
    (ai_play_line odst_01 070ma_020)
    (ai_play_line odst_02 070ma_020)
    (sleep 60)
    (if b_dialogue 
        (print "johnson: go! go! go!"))
    (vs_play_line johnson true 070ma_030)
    (sleep 10)
    (vs_release_all)
)

(script command_script void cs_lz_pelican_0_landing
    (set obj_lz_pelican_0 (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot"))
    (sound_impulse_trigger "sound\levels\070_waste\070va\070va_pelican_insertion" none 1.0 1)
    (custom_animation_relative obj_lz_pelican_0 "objects\vehicles\pelican\cinematics\vignettes\070va_pelican_intro\070va_pelican_intro" "070vd_pelican_intro" false "cin_pelican_anchor")
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_0)) 30 570)
    (set b_lz_pelican_0_arrived true)
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_0)) 1)
    (custom_animation_relative_loop obj_lz_pelican_0 "objects\vehicles\pelican\cinematics\vignettes\070va_pelican_intro\070va_pelican_intro" "070vd_pelican_idle" false "cin_pelican_anchor")
    (sleep_forever)
)

(script command_script void cs_lz_pelican_1_landing
    (set obj_lz_pelican_1 (ai_vehicle_get_from_starting_location "allies_lz_pelican_1/pilot"))
    (custom_animation_relative obj_lz_pelican_1 "objects\vehicles\pelican\cinematics\vignettes\070va_pelican_intro\070va_pelican_intro" "070vd_pelican_intro-co-op" false "cin_pelican_anchor_coop")
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_1)) 30 690)
    (set b_lz_pelican_1_arrived true)
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_1)) 1)
    (custom_animation_relative_loop obj_lz_pelican_1 "objects\vehicles\pelican\cinematics\vignettes\070va_pelican_intro\070va_pelican_intro" "070vd_pelican_idle_co_op" false "cin_pelican_anchor_coop")
    (sleep_forever)
)

(script dormant void md_lz_exit_pelican_0
    (sleep_until b_lz_pelican_0_arrived 10 1800)
    (wake 070_chapter_installation)
    (sleep 90)
    (ai_vehicle_exit ai_fly_pelican_marines_0)
    (sleep 30)
    (ai_vehicle_exit ai_fly_pelican_marines_1)
    (sleep 30)
    (unit_exit_vehicle (player0))
    (unit_exit_vehicle (player1))
    (player_disable_movement false)
    (campaign_metagame_time_pause false)
    (sleep 30)
    (object_create "lz_pelican_0_shunt")
    (sleep 90)
    (cs_run_command_script "allies_lz_pelican_0/pilot" cs_lz_pelican_0_exits)
    (sleep 30)
    (object_destroy "lz_pelican_0_shunt")
)

(script command_script void cs_lz_pelican_0_exits
    (sleep (unit_get_custom_animation_time obj_lz_pelican_0))
    (custom_animation_relative obj_lz_pelican_0 "objects\vehicles\pelican\cinematics\vignettes\070va_pelican_intro\070va_pelican_intro" "070vd_pelican_exit" false "cin_pelican_anchor")
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_0)) 30 150)
    (kill_players_in_volume "vol_lz_kill_players")
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_0)))
    (ai_cannot_die ai_current_actor false)
    (ai_cannot_die ai_fly_johnson false)
    (ai_erase ai_fly_johnson)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script dormant void md_lz_exit_pelican_1
    (sleep_until b_lz_pelican_1_arrived 30 1800)
    (ai_vehicle_exit ai_fly_pelican_commander)
    (sleep 30)
    (ai_vehicle_exit ai_fly_pelican_marines_2)
    (sleep 30)
    (unit_exit_vehicle (player2))
    (unit_exit_vehicle (player3))
    (sleep 30)
    (object_create "lz_pelican_1_shunt")
    (sleep 90)
    (cs_run_command_script "allies_lz_pelican_1/pilot" cs_lz_pelican_1_exits)
    (sleep 30)
    (object_destroy "lz_pelican_1_shunt")
)

(script command_script void cs_lz_pelican_1_exits
    (sleep (unit_get_custom_animation_time obj_lz_pelican_1))
    (custom_animation_relative obj_lz_pelican_1 "objects\vehicles\pelican\cinematics\vignettes\070va_pelican_intro\070va_pelican_intro" "070vd_pelican_exit_co-op" false "cin_pelican_anchor_coop")
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_1)) 30 210)
    (kill_players_in_volume "vol_lz_kill_players")
    (sleep_until (not (unit_is_playing_custom_animation obj_lz_pelican_1)))
    (ai_cannot_die ai_current_actor false)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script dormant void md_lz_odst_explore
    (if b_debug 
        (print "mission dialogue:lz:odst:explore"))
    (sleep_until (>= s_lz_progression 20) 15)
    (sleep_until (not b_playing_dialogue))
    (vs_cast "allies_lz_marines_0" true 10 "070mb_090" "070mb_100")
    (set odst_01 (vs_role 1))
    (set odst_02 (vs_role 2))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving "gr_allies" true)
    (sleep 1)
    (if b_dialogue 
        (print "odst: check it out. in the sky. is that --"))
    (sleep (ai_play_line odst_01 070mb_090))
    (if b_dialogue 
        (print "odst: hey. focus. we got a job to do."))
    (sleep (ai_play_line odst_02 070mb_100))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_b1_stop_allies_prepare
    (sleep_until 
        (or
            (> (ai_combat_status "cov_b1_ini") 2)
            (> (ai_combat_status "cov_b1_ini_jackals_0") 2)
            (> (ai_combat_status "cov_b1_ini_jackals_1") 2)
            (> (ai_combat_status "cov_b1_ini_jackals_2") 2)
            (> (ai_combat_status "cov_b1_ini_brutes_0") 2)
            (> (ai_combat_status "cov_b1_ini_grunts_0") 2)
            (> (ai_combat_status "cov_b1_watchtower") 2)
            (<= (ai_living_count "cov_b1_ini") 0)
        ) 
    5)
    (if b_debug 
        (print "md_b1_stop_allies_prepare"))
    (sleep_forever md_b1_allies_prepare)
    (cs_run_command_script "allies_b1_intro_marine" cs_end)
    (md_dialogue_stop)
)

(script dormant void md_b1_allies_prepare
    (vs_cast "allies_b1_intro_marine" false 20 "070mb_110")
    (set odst_03 (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking odst_03 false)
    (vs_enable_targeting odst_03 false)
    (vs_enable_moving odst_03 false)
    (vs_shoot "gr_allies" false)
    (sleep 1)
    (vs_go_to odst_03 false "pts_b1_allies/p4")
    (sleep 30)
    (sleep_until (>= s_lz_progression 40) 10)
    (vs_crouch odst_03 true)
    (vs_face_player odst_03 true)
    (sleep_until (>= s_b1_progression 20) 10)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "odst (whisper): chief! eyes on!"))
    (vs_play_line odst_03 true 070mb_110)
    (vs_face_player odst_03 false)
    (vs_crouch odst_03 false)
    (vs_go_to_and_posture odst_03 false "pts_b1_allies/p0" "corner_open_left")
    (wake md_b1_stop_allies_prepare)
    (sleep_until (not (vs_running_atom_movement odst_03)) 30 120)
    (if b_dialogue 
        (print "odst (whisper): got a good angle"))
    (vs_play_line odst_03 true 070mb_120)
    (sleep 10)
    (sleep 120)
    (if b_dialogue 
        (print "odst (whisper): you take the first shot!"))
    (vs_play_line odst_03 true 070mb_140)
    (sleep 10)
    (sleep_until 
        (or
            (> (ai_combat_status "cov_b1_ini") 2)
            (> (ai_combat_status "cov_b1_ini_jackals_0") 2)
            (> (ai_combat_status "cov_b1_ini_jackals_1") 2)
            (> (ai_combat_status "cov_b1_ini_jackals_2") 2)
            (> (ai_combat_status "cov_b1_ini_brutes_0") 2)
            (> (ai_combat_status "cov_b1_ini_grunts_0") 2)
            (> (ai_combat_status "cov_b1_watchtower") 2)
            (<= (ai_living_count "cov_b1_ini") 0)
        )
    )
    (vs_release_all)
)

(script dormant void b1_stop_truth_halogram
    (sleep_until 
        (or
            (<= (object_get_health "b1_holo_generator") 0.0)
            b_truth_speech_finished
        ) 
    10)
    (sleep_forever b1_truth_halogram)
    (sound_impulse_stop "sound\dialog\070_waste\mission\070my_060_pot.sound")
    (sound_impulse_stop "sound\dialog\070_waste\mission\070my_071_pot.sound")
)

(script dormant void b1_truth_halogram
    (wake b1_stop_truth_halogram)
    (object_create_anew "b1_truth_scenery")
    (object_create_anew "b1_grav_throne")
    (object_create_anew "b1_holo_generator")
    (object_set_function_variable "b1_truth_scenery" "bloom" 0.8 30.0)
    (object_set_function_variable "b1_grav_throne" "bloom" 0.8 30.0)
    (objects_attach "b1_truth_scenery" "driver" "b1_grav_throne" "driver")
    (objects_attach "b1_holo_generator" "attach_marker" "b1_truth_scenery" "")
    (sleep_until 
        (or
            (volume_test_players "vol_b1_activate_halogram")
            (>= s_b2_progression 20)
        )
    )
    (sleep 15)
    (if b_dialogue 
        (print "truth: my dreadnought cannot rise! even now it is engaged -- turns deftly in the wards of this new world!"))
    (scenery_animation_start "b1_truth_scenery" "objects\characters\truth\cinematics\truth_holos\070_truth_a\070_truth_a.model_animation_graph" "070_truth_a")
    (sound_impulse_start "sound\dialog\070_waste\mission\070my_060_pot" "b1_truth_scenery" 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\070_waste\mission\070my_060_pot"))
    (sleep 30)
    (if b_dialogue 
        (print "truth: do not relent until the heretics' ships are smashed!"))
    (scenery_animation_start "b1_truth_scenery" "objects\characters\truth\cinematics\truth_holos\070_truth_a\070_truth_a.model_animation_graph" "070_truth_a2")
    (sound_impulse_start "sound\dialog\070_waste\mission\070my_071_pot" "b1_truth_scenery" 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\070_waste\mission\070my_071_pot"))
    (sleep 45)
    (070_truth_flicker "b1_grav_throne" "b1_truth_scenery")
    (object_destroy "b1_truth_scenery")
    (object_destroy "b1_grav_throne")
    (set b_truth_speech_finished true)
)

(script dormant void md_b1_allies_next
    (vs_set_cleanup_script md_cleanup)
    (sleep_until 
        (and
            (or
                (>= s_b2_progression 10)
                b_b1_finished
            )
            (not b_playing_dialogue)
        )
    )
    (sleep_until (>= s_b2_progression 10) 30 600)
    (if 
        (and
            (< s_b2_progression 10)
            (not b_playing_dialogue)
        ) 
            (begin
                (if b_debug 
                    (print "mission dialogue:b1:allies:next"))
                (md_dialogue_start)
                (vs_cast "allies_b1_marines_0" false 10 "070mb_180")
                (set odst (vs_role 1))
                (sleep 1)
                (vs_face_player odst true)
                (if b_dialogue 
                    (print "odst: we got more enemy contacts ahead! move out!"))
                (vs_play_line odst true 070mb_180)
                (sleep 10)
                (md_dialogue_stop)
                (vs_release_all)
            )
    )
    (sleep_until (>= s_b2_progression 20) 30 1800)
    (if 
        (and
            (< s_b2_progression 20)
            (not b_playing_dialogue)
        ) 
            (begin
                (md_dialogue_start)
                (if b_dialogue 
                    (print "johnson (radio): get going, chief! find the commander her lz!"))
                (sleep (ai_play_line_on_object none 070mb_190))
                (sleep 10)
                (md_dialogue_stop)
            )
    )
    (sleep_until (>= s_b2_progression 20) 30 600)
    (if 
        (and
            (< s_b2_progression 20)
            (not b_playing_dialogue)
        ) 
            (begin
                (md_dialogue_start)
                (if b_dialogue 
                    (print "johnson (radio): i'm counting on you to lead the way, chief! move out!"))
                (sleep (ai_play_line_on_object none 070mb_200))
                (sleep 10)
                (md_dialogue_stop)
                (hud_activate_team_nav_point_flag player "flg_b1_next" 0.0)
                (sleep_until (>= s_b2_progression 20) 10)
                (hud_deactivate_team_nav_point_flag player "flg_b1_next")
            )
    )
)

(script dormant void md_b2_stop_allies_prepare
    (sleep_until b_b2_combat_started)
    (sleep_forever md_b2_allies_prepare)
    (cs_run_command_script "gr_allies" cs_end)
    (md_dialogue_stop)
)

(script dormant void md_b2_allies_prepare
    (sleep_until b_b1_finished)
    (wake md_b2_stop_allies_prepare)
    (if (> (ai_living_count "allies_b1_intro_marine") 0) 
        (begin
            (vs_cast "allies_b1_intro_marine" false 10 "070mc_010")
            (set odst_01 (vs_role 1))
        ) (begin
            (vs_cast "gr_marines" false 10 "070mc_010")
            (set odst_01 (vs_role 1))
        )
    )
    (vs_enable_pathfinding_failsafe "gr_marines" true)
    (vs_enable_looking "gr_marines" true)
    (vs_enable_targeting "gr_marines" false)
    (vs_enable_moving "gr_marines" true)
    (vs_enable_moving odst_01 false)
    (sleep 1)
    (vs_go_to_and_posture odst_01 false "pts_b2_allies/p7" "corner_open_left")
    (sleep_until 
        (or
            (volume_test_players "vol_b1_cave_out")
            (>= s_b2_progression 10)
        ) 
    10)
    (vs_go_to_and_posture odst_01 false "pts_b2_allies/p0" "corner_open_left")
    (sleep_until 
        (or
            (not (vs_running_atom_movement odst_01))
            (volume_test_object "vol_b2_cave_1" odst_01)
        )
    )
    (sleep_until (>= s_b2_progression 20))
    (sleep_until (not b_playing_dialogue) 10)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if (not b_b2_combat_started) 
        (begin
            (if b_dialogue 
                (print "odst (whisper): they're setting up an aa battery!"))
            (sleep (ai_play_line odst_01 070mc_010))
            (sleep 10)
            (if b_dialogue 
                (print "odst (whisper): that thing will tear the dawn apart!"))
            (sleep (ai_play_line odst_01 070mc_020))
            (sleep 10)
        )
    )
    (sleep_until b_b2_combat_started 30 300)
    (if (not b_b2_combat_started) 
        (begin
            (if b_dialogue 
                (print "odst (whisper): waiting for you to take the shot!"))
            (sleep (ai_play_line odst_01 070mc_040))
            (sleep 10)
        )
    )
    (sleep_forever)
)

(script dormant void ba_gain_foothold
    (sleep_until 
        (or
            (and
                (>= s_b2_progression 27)
                b_b2_finished
            )
            (>= s_fp_progression 15)
        )
    )
    (sleep_until (>= s_b2_progression 40) 10 (random_range 90 150))
    (sleep_until (not b_playing_dialogue))
    (set b_070_music_02 false)
    (if b_b2_finished 
        (begin
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_debug 
                (print "ba_gain_foothold"))
            (sleep 15)
            (if b_dialogue 
                (print "miranda : chief, i'm giving the brutes all i've got."))
            (sleep (ai_play_line_on_object none 070ba_010))
            (sleep 10)
            (if b_dialogue 
                (print "miranda : but this is a heavy-weight fight"))
            (sleep (ai_play_line_on_object none 070ba_020))
            (sleep 10)
            (if b_dialogue 
                (print "miranda : dawn's only got the tonnage to last a few rounds."))
            (sleep (ai_play_line_on_object none 070ba_030))
            (sleep 10)
            (if b_dialogue 
                (print "miranda : find me a place to set her down, over? "))
            (sleep (ai_play_line_on_object none 070ba_040))
            (sleep 10)
        )
    )
)

(script dormant void md_b2_allies_next
    (vs_set_cleanup_script md_cleanup)
    (sleep_until b_b2_finished)
    (sleep_until (>= s_fp_progression 15) 30 1800)
    (if 
        (and
            (< s_fp_progression 15)
            (not b_playing_dialogue)
        ) 
            (begin
                (md_dialogue_start)
                (if b_debug 
                    (print "mission dialogue:b2:allies:next"))
                (vs_cast "gr_allies_b2_marine" false 10 "070mc_060")
                (set odst (vs_role 1))
                (sleep 1)
                (vs_face_player odst true)
                (if b_dialogue 
                    (print "odst: area secure! let's go!"))
                (vs_play_line odst true 070mc_060)
                (sleep 10)
                (md_dialogue_stop)
                (vs_release_all)
            )
    )
    (sleep_until (>= s_fp_progression 15) 30 600)
    (if 
        (and
            (< s_fp_progression 15)
            (not b_playing_dialogue)
        ) 
            (begin
                (md_dialogue_start)
                (if b_dialogue 
                    (print "johnson (radio): you're done here, chief! go, go, go!"))
                (sleep (ai_play_line_on_object none 070mc_070))
                (sleep 10)
                (md_dialogue_stop)
            )
    )
    (sleep_until (>= s_fp_progression 15) 30 600)
    (if 
        (and
            (< s_fp_progression 15)
            (not b_playing_dialogue)
        ) 
            (begin
                (md_dialogue_start)
                (if b_dialogue 
                    (print "johnson (radio): chief! stay with the others! they need your help!"))
                (sleep (ai_play_line_on_object none 070mc_080))
                (sleep 10)
                (md_dialogue_stop)
                (hud_activate_team_nav_point_flag player "flg_b2_next" 0.0)
                (sleep_until (>= s_fp_progression 15) 10)
                (hud_deactivate_team_nav_point_flag player "flg_b2_next")
            )
    )
)

(script dormant void md_fp_allies_next
    (vs_set_cleanup_script md_cleanup)
    (sleep_until (>= s_ex_progression 10) 30 3600)
    (if 
        (and
            (< s_ex_progression 10)
            (not b_playing_dialogue)
        ) 
            (begin
                (if b_debug 
                    (print "mission dialogue:fp:allies:next"))
                (vs_cast "gr_allies_fp_marines" false 10 "070md_140")
                (set odst (vs_role 1))
                (vs_enable_pathfinding_failsafe "gr_allies" true)
                (vs_enable_looking "gr_allies" true)
                (vs_enable_targeting "gr_allies" true)
                (vs_enable_moving "gr_allies" true)
                (md_dialogue_start)
                (vs_face_player odst true)
                (if b_dialogue 
                    (print "odst: the commander's counting on us to secure her lz!"))
                (sleep (ai_play_line_at_player odst 070md_150))
                (sleep 10)
                (vs_face_player odst false)
                (vs_release_all)
                (hud_activate_team_nav_point_flag player "flg_fp_next" 0.0)
                (sleep_until (>= s_ex_progression 10))
                (hud_deactivate_team_nav_point_flag player "flg_fp_next")
            )
    )
)

(script dormant void va_crashing_longsword
    (va_crashing_longsword_static)
)

(script static void va_crashing_longsword_static
    (if b_debug 
        (print "vignette:ex:va_crashing_longsword"))
    (sound_impulse_start "sound\levels\070_waste\070_longsword_crash\longsword_lead_in.sound" "ex_longsword_intro_sound" 1.0)
    (sleep 15)
    (md_dialogue_start)
    (if b_dialogue 
        (print "fighter pilot (radio): thrusters are gone! can't control it! "))
    (ai_play_line_on_object none 070mz_190)
    (md_dialogue_stop)
    (object_create "cin_longsword")
    (sleep 1)
    (ai_disregard "cin_longsword" true)
    (scenery_animation_start_relative "cin_longsword" "objects\vehicles\longsword\cinematics\vignettes\070vc_crashing_longsword\070vc_crashing_longsword" "070vc_crashing_longsword" "070va_anchor")
    (sleep 120)
    (object_destroy "cin_longsword")
    (player_effect_set_max_rotation 0.0 0.5 0.5)
    (player_effect_set_max_rumble 1.0 1.0)
    (player_effect_start 0.5 0.05)
    (sleep 20)
    (player_effect_stop 0.5)
    (set b_070_music_04 false)
    (set b_070_music_05 false)
)

(script dormant void md_ex_marines_intro
    (sleep_until 
        (or
            (>= (device_get_position "fp_exit_door") 0.01)
            (>= s_ex_progression 10)
        ) 
    10)
    (if b_debug 
        (print "mission dialogue:ex:marines:intro"))
    (vs_cast "allies_ex_on_foot_1" true 10 "070mx_060")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving "gr_allies" false)
    (vs_face marine true "pts_ex_patrol/warthog")
    (unit_lower_weapon marine 15)
    (sleep 15)
    (vs_crouch marine true)
    (sleep 150)
    (vs_crouch marine false 2.0)
    (vs_face marine false "pts_ex_patrol/warthog")
    (vs_approach_player marine false 3.0 20.0 20.0)
    (sleep_until (not (vs_running_atom_movement marine)) 30 90)
    (vs_face_player marine true)
    (vs_approach_stop marine)
    (vs_face_player marine true)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "marine: flak got our pelican too, sir!"))
    (sleep (ai_play_line_at_player marine 070mx_060))
    (sleep 10)
    (if b_dialogue 
        (print "marine: but before we went down, we spotted a good lz."))
    (sleep (ai_play_line_at_player marine 070mx_070))
    (sleep 10)
    (if b_dialogue 
        (print "marine: if we can get to our vehicles, we'll get you to it"))
    (sleep (ai_play_line_at_player marine 070mx_080))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_ex_marines_thanks
    (sleep_until 
        (or
            b_ex_p1_finished
            (>= s_ex_progression 30)
        ) 
    10)
    (sleep (random_range 90 150))
    (sleep_until (not b_playing_dialogue) 30 300)
    (if 
        (and
            (< s_ex_progression 30)
            (not (player_in_a_vehicle))
        ) 
            (begin
                (if b_debug 
                    (print "mission dialogue:ex:marines:thanks"))
                (vs_cast "allies_ex_on_foot_1" false 10 "070mx_090")
                (set marine (vs_role 1))
                (vs_enable_pathfinding_failsafe "gr_allies" true)
                (vs_enable_looking "gr_allies" true)
                (vs_enable_targeting "gr_allies" true)
                (vs_enable_moving "gr_allies" true)
                (sleep 1)
                (vs_set_cleanup_script md_cleanup)
                (md_dialogue_start)
                (vs_face_player marine true)
                (if b_dialogue 
                    (print "marine: mount up! let's find that lz!"))
                (sleep (ai_play_line_at_player marine 070mx_090))
                (sleep 60)
                (if b_dialogue 
                    (print "marine: follow us, sir! all the way down this canyon!"))
                (sleep (ai_play_line_at_player marine 070mx_100))
                (sleep 10)
                (vs_release_all)
            )
    )
    (sleep_until 
        (or
            (>= s_ex_progression 30)
            (player_in_a_vehicle)
        )
    )
    (set b_070_music_06 true)
)

(script dormant void md_sd_stop_sentinels_intro
    (sleep_until (>= s_aw_progression 10))
    (sleep_forever md_sd_sentinels_intro)
    (md_dialogue_stop)
)

(script dormant void md_sd_sentinels_intro
    (wake md_sd_stop_sentinels_intro)
    (sleep_until (>= s_sd_progression 30) 10)
    (sleep_until b_sd_more_sentinel_spawned)
    (sleep (random_range 120 180))
    (sleep_until (not b_playing_dialogue))
    (if b_debug 
        (print "mission dialogue:sd:sentinels:intro"))
    (if (player_in_a_vehicle_with_ai) 
        (begin
            (vs_cast (get_ai_in_player_vehicle) false 10 "070me_200")
            (set marine (vs_role 1))
        ) (begin
            (vs_cast (get_ai_not_in_vehicle "gr_allies_ex") false 10 "070me_200")
            (set marine (vs_role 1))
        )
    )
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving "gr_allies" true)
    (sleep 1)
    (if b_dialogue 
        (print "marines: careful, sir!  brutes must have tripped a defensive system!"))
    (sleep (ai_play_line_at_player marine 070me_200))
    (sleep 10)
    (if b_dialogue 
        (print "marines: whatever those things are, let's leave 'em alone!"))
    (sleep (ai_play_line_at_player marine 070me_210))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_sd_stop_sentinels_attack
    (sleep_until b_la_can_start)
    (sleep_forever md_sd_sentinels_attack)
    (md_dialogue_stop)
)

(script dormant void md_sd_sentinels_attack
    (wake md_sd_stop_sentinels_attack)
    (sleep_until b_sd_more_sentinel_spawned)
    (if b_debug 
        (print "mission dialogue:sd:sentinels:attack"))
    (if (player_in_a_vehicle_with_ai) 
        (begin
            (vs_cast (get_ai_in_player_vehicle) false 20 "070me_250")
            (set marine (vs_role 1))
        ) (begin
            (vs_cast (get_ai_not_in_vehicle "gr_allies_ex") false 20 "070me_250")
            (set marine (vs_role 1))
        )
    )
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving "gr_allies" true)
    (sleep 1)
    (if b_dialogue 
        (print "marine (sarcastic): oh, great!  now they think we're the enemy!"))
    (sleep (ai_play_line_at_player marine 070me_250))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_sd_stop_sentinels_clean
    (sleep_until b_la_can_start)
    (sleep_forever md_sd_sentinels_clean)
    (md_dialogue_stop)
)

(script dormant void md_sd_sentinels_clean
    (wake md_sd_stop_sentinels_clean)
    (sleep_until b_sd_more_sentinel_spawned)
    (sleep_until b_sd_finished)
    (sleep 300)
    (sleep_until (volume_test_players "vol_sd_bridge"))
    (sleep_until (not b_playing_dialogue))
    (if (> (ai_living_count "gr_for_sd") 0) 
        (begin
            (if b_debug 
                (print "mission dialogue:sd:sentinels:clean"))
            (if (player_in_a_vehicle_with_ai) 
                (begin
                    (set ol_ex_temp_list (get_ai_in_player_vehicle))
                    (if (>= (list_count ol_ex_temp_list) 2) 
                        (begin
                            (vs_cast (get_ai_in_player_vehicle) true 10 "070me_270" "070me_280")
                            (set marine_01 (vs_role 1))
                            (set marine_02 (vs_role 2))
                        ) (begin
                            (vs_cast (get_ai_in_player_vehicle) true 10 "070me_270")
                            (set marine_01 (vs_role 1))
                            (vs_cast "gr_allies_ex" true 10 "070me_280")
                            (set marine_02 (vs_role 1))
                        )
                    )
                ) (begin
                    (vs_cast "gr_allies_ex" true 10 "070me_270" "070me_280")
                    (set marine_01 (vs_role 1))
                    (set marine_02 (vs_role 2))
                )
            )
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (vs_enable_pathfinding_failsafe "gr_allies" true)
            (vs_enable_looking "gr_allies" true)
            (vs_enable_targeting "gr_allies" true)
            (vs_enable_moving "gr_allies" true)
            (sleep 90)
            (if b_dialogue 
                (print "marine: tidy little bastards"))
            (sleep (ai_play_line_at_player marine_01 070me_270))
            (sleep 10)
            (if b_dialogue 
                (print "marine: hope they never decide to clean us up."))
            (sleep (ai_play_line_at_player marine_02 070me_280))
            (sleep 10)
            (vs_release_all)
            (wake md_sd_sentinels_exit)
        )
    )
)

(script dormant void md_sd_sentinels_exit
    (sleep_until (volume_test_players "vol_sd_bridge"))
    (sleep_until (not b_playing_dialogue))
    (if b_debug 
        (print "mission dialogue:sd:sentinels:exit"))
    (if (player_in_a_vehicle_with_ai) 
        (begin
            (set ol_ex_temp_list (get_ai_in_player_vehicle))
            (if (>= (list_count ol_ex_temp_list) 2) 
                (begin
                    (vs_cast (get_ai_in_player_vehicle) true 10 "070me_290" "070me_300")
                    (set marine_01 (vs_role 1))
                    (set marine_02 (vs_role 2))
                ) (begin
                    (vs_cast (get_ai_in_player_vehicle) true 10 "070me_290")
                    (set marine_01 (vs_role 1))
                    (vs_cast "gr_allies_ex" true 10 "070me_300")
                    (set marine_02 (vs_role 1))
                )
            )
        ) (begin
            (vs_cast "gr_allies_ex" true 10 "070me_290" "070me_300")
            (set marine_01 (vs_role 1))
            (set marine_02 (vs_role 2))
        )
    )
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving "gr_allies" true)
    (sleep 1)
    (if b_dialogue 
        (print "marine: it's like they don't even see us"))
    (sleep (ai_play_line_at_player marine_01 070me_290))
    (sleep 10)
    (if b_dialogue 
        (print "marine: oh they see us, alright"))
    (sleep (ai_play_line_at_player marine_02 070me_300))
    (sleep 10)
    (if b_dialogue 
        (print "marine: they just haven't decided what to do with us yet."))
    (sleep (ai_play_line_at_player marine_02 070me_310))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_sd_allies_next
    (sleep_until 
        (or
            (volume_test_players "vol_sd_near_wall")
            b_fl_frigate_arrives
        )
    )
    (sleep_until (<= (ai_living_count "gr_cov_sd") 3) 30 3600)
    (if 
        (and
            (not b_fl_frigate_arrives)
            (volume_test_players "vol_sd_need_pelican")
        ) 
            (begin
                (ai_place "allies_sd_pelican")
                (sleep 1)
                (ai_cannot_die "allies_sd_pelican" true)
                (sleep_until b_sd_finished 30 (* 30.0 20.0))
                (set b_070_music_06 false)
                (sleep 1)
                (vs_set_cleanup_script md_cleanup)
                (md_dialogue_start)
                (sleep (random_range 90 120))
                (vs_cast "allies_sd_johnson/johnson" true 20 "070me_400")
                (set johnson (vs_role 1))
                (if b_debug 
                    (print "mission dialogue:sd:allies:next"))
                (sleep 1)
                (if b_dialogue 
                    (print "johnson (radio): ma'am? hocus almost got her wings shot off..."))
                (sleep (ai_play_line_at_player johnson 070me_400))
                (sleep 10)
                (if b_dialogue 
                    (print "johnson (radio): but we spotted a structure on the other side of this wall."))
                (sleep (ai_play_line_at_player johnson 070me_410))
                (sleep 10)
                (if b_dialogue 
                    (print "johnson (radio): it matches cortana's description of the map room on the first halo ring!"))
                (sleep (ai_play_line_at_player johnson 070me_420))
                (sleep 10)
                (if b_dialogue 
                    (print "miranda (radio): a cartographer? good. should help us fix truth's location."))
                (sleep (ai_play_line_on_object none 070me_430))
                (sleep 10)
                (if b_dialogue 
                    (print "miranda (radio): secure the lz, then we'll push through that wall."))
                (sleep (ai_play_line_on_object none 070me_440))
                (sleep 10)
                (if b_dialogue 
                    (print "johnson (radio): roger that. follow my pelican, chief! lz's this way!"))
                (sleep (ai_play_line_at_player johnson 070me_450))
                (sleep 10)
                (vs_release_all)
                (cs_run_command_script "allies_sd_johnson/johnson" cs_johnson_stay_in_turret)
                (set b_sd_cartographer_hint true)
            )
    )
)

(script dormant void md_ex_allies_next
    (vs_set_cleanup_script md_cleanup)
    (sleep_until 
        (or
            (>= s_sd_progression 20)
            (>= s_aw_progression 10)
        )
    )
    (sleep_until 
        (or
            (>= s_aw_progression 10)
            b_sd_finished
        ) 
    30 7200)
    (sleep_until (>= s_aw_progression 10) 30 1800)
    (if (volume_test_players "vol_sd_near_wall") 
        (begin
            (sleep_until (not b_playing_dialogue) 30 450)
            (md_dialogue_start)
            (if b_dialogue 
                (print "johnson (radio): let's get the commander down safe, then we'll worry about getting through that wall!"))
            (sleep (ai_play_line_on_object none 070mx_170))
            (sleep 10)
            (md_dialogue_stop)
        )
    )
    (sleep_until (>= s_aw_progression 10) 30 900)
    (if 
        (and
            (< s_aw_progression 10)
            (not b_playing_dialogue)
        ) 
            (begin
                (if b_debug 
                    (print "mission dialogue:ex:allies:next"))
                (if (player_in_a_vehicle_with_ai) 
                    (begin
                        (vs_cast (get_ai_in_player_vehicle) false 20 "070mf_050")
                        (set marine (vs_role 1))
                    ) (begin
                        (vs_cast (get_ai_not_in_vehicle "gr_allies_ex") false 20 "070mf_050")
                        (set marine (vs_role 1))
                    )
                )
                (md_dialogue_start)
                (vs_enable_pathfinding_failsafe "gr_allies_ex" true)
                (vs_enable_looking "gr_allies_ex" true)
                (vs_enable_targeting "gr_allies_ex" true)
                (vs_enable_moving "gr_allies_ex" true)
                (sleep 1)
                (if b_dialogue 
                    (print "marine: let's find that lz, sir!"))
                (sleep (ai_play_line_at_player marine 070mf_050))
                (sleep 10)
                (if b_dialogue 
                    (print "marine: commander keyes can't land until we clear those wraiths!"))
                (sleep (ai_play_line_at_player marine 070mf_060))
                (sleep 10)
                (md_dialogue_stop)
                (vs_release_all)
            )
    )
    (sleep_until (>= s_aw_progression 10) 30 3600)
    (if 
        (and
            (< s_aw_progression 10)
            (not b_playing_dialogue)
        ) 
            (begin
                (md_dialogue_start)
                (if b_dialogue 
                    (print "johnson (radio): chief? look for a break in the rocks!"))
                (sleep (ai_play_line_on_object none 070mf_010))
                (sleep 10)
                (if b_dialogue 
                    (print "johnson (radio): there's a nice wide cliff on the other side"))
                (sleep (ai_play_line_on_object none 070mf_020))
                (sleep 10)
                (hud_activate_team_nav_point_flag player "flg_ex_near_aw" 0.0)
                (if b_dialogue 
                    (print "johnson (radio): should have enough room for the dawn."))
                (sleep (ai_play_line_on_object none 070mf_030))
                (sleep 10)
                (if b_dialogue 
                    (print "johnson (radio): you see any wraiths? clear 'em out!"))
                (sleep (ai_play_line_on_object none 070mf_040))
                (sleep 10)
                (md_dialogue_stop)
                (sleep_until (>= s_ex_progression 70) 10)
                (hud_deactivate_team_nav_point_flag player "flg_ex_near_aw")
            )
    )
)

(script dormant void md_ex_marines_cave
    (sleep_until 
        (or
            b_ex_cave_finished
            (>= s_aw_progression 10)
        ) 
    10)
    (sleep (random_range 60 120))
    (sleep_until (not b_playing_dialogue) 30 300)
    (if (< s_aw_progression 10) 
        (begin
            (if b_debug 
                (print "mission dialogue:ex:marines:cave"))
            (vs_cast "gr_marines" true 10 "070mx_180")
            (set marine (vs_role 1))
            (vs_enable_pathfinding_failsafe "gr_allies" true)
            (vs_enable_looking "gr_allies" true)
            (vs_enable_targeting "gr_allies" true)
            (vs_enable_moving "gr_allies" true)
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (vs_face_player marine true)
            (if b_dialogue 
                (print "marine: lz's through the cave, sir!"))
            (sleep (ai_play_line_at_player marine 070mx_180))
            (sleep 10)
            (if b_dialogue 
                (print "marine: watch yourself! got covenant heavy armor!"))
            (sleep (ai_play_line_at_player marine 070mx_185))
            (sleep 10)
            (vs_release_all)
        )
    )
    (set b_ex_cave_dialog_finished true)
)

(script dormant void md_aw_aa_intro
    (sleep_until 
        (or
            (>= s_aw_progression 20)
            (and
                (<= (ai_living_count "gr_cov_aw_aa_wraiths") 0)
                (<= (ai_living_count "gr_cov_aw_wraiths_mortar") 0)
            )
        )
    )
    (sleep_until 
        (or
            (not (volume_test_players "vol_aw_all"))
            (and
                (<= (ai_living_count "gr_cov_aw_aa_wraiths") 0)
                (<= (ai_living_count "gr_cov_aw_wraiths_mortar") 0)
            )
        )
    )
    (sleep 300)
    (if 
        (and
            (not (volume_test_players "vol_aw_all"))
            (and
                (<= (ai_living_count "gr_cov_aw_aa_wraiths") 0)
                (<= (ai_living_count "gr_cov_aw_wraiths_mortar") 0)
            )
        ) 
            (begin
                (sleep 1)
                (vs_set_cleanup_script md_cleanup)
                (md_dialogue_start)
                (if b_debug 
                    (print "mission dialogue:aw:aa:intro"))
                (if b_dialogue 
                    (print "johnson (radio): chief, you got covenant aa!"))
                (sleep (ai_play_line_on_object none 070mf_130))
                (sleep 10)
                (if b_dialogue 
                    (print "johnson (radio): take it out!"))
                (sleep (ai_play_line_on_object none 070mf_140))
                (sleep 10)
                (hud_activate_team_nav_point_flag player "flg_fl_frigate_landing" 0.0)
                (sleep_until 
                    (or
                        (volume_test_players "vol_aw_pass_bridge")
                        (and
                            (<= (ai_living_count "gr_cov_aw_aa_wraiths") 0)
                            (<= (ai_living_count "gr_cov_aw_wraiths_mortar") 0)
                        )
                    ) 
                10)
                (hud_deactivate_team_nav_point_flag player "flg_fl_frigate_landing")
            )
    )
)

(script dormant void md_aw_aa_dead
    (sleep_until (>= s_aw_progression 10))
    (sleep_until (<= (ai_living_count "gr_cov_aw") 1))
    (sleep_until (<= (ai_living_count "gr_cov_aw") 0) 30 600)
    (sleep (random_range 60 120))
    (sleep_until (not b_playing_dialogue) 30 600)
    (if (not 070pa_dialog_done) 
        (begin
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_debug 
                (print "mission dialogue:aw:aa:intro"))
            (if (player_in_a_vehicle_with_ai) 
                (begin
                    (vs_cast (get_ai_in_player_vehicle) false 20 "070mf_120")
                    (set marine (vs_role 1))
                    (vs_enable_pathfinding_failsafe "gr_allies" true)
                    (vs_enable_looking "gr_allies" true)
                    (vs_enable_targeting "gr_allies" true)
                    (vs_enable_moving "gr_allies" true)
                    (sleep 1)
                    (if b_dialogue 
                        (print "marine: ooh-rah! the lz's clear!"))
                    (sleep (ai_play_line_at_player marine 070mf_120))
                    (sleep 10)
                    (vs_release_all)
                ) (begin
                    (if b_dialogue 
                        (print "johnson (radio): that did it! lz's clear!"))
                    (sleep (ai_play_line_on_object none 070mf_180))
                    (sleep 10)
                )
            )
        )
    )
)

(script dormant void md_fl_allies_wait
    (sleep 60)
    (sleep_until 070pa_dialog_done)
    (sleep_until 
        (or
            (<= s_fl_position 10)
            b_fl_frigate_arrives
        )
    )
    (if (not b_fl_frigate_arrives) 
        (begin
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_debug 
                (print "mission dialogue:fl:allies:wait"))
            (if (player_in_a_vehicle_with_ai) 
                (begin
                    (vs_cast (get_ai_in_player_vehicle) false 20 "070mf_190")
                    (set marine (vs_role 1))
                    (vs_enable_pathfinding_failsafe "gr_allies" true)
                    (vs_enable_looking "gr_allies" true)
                    (vs_enable_targeting "gr_allies" true)
                    (vs_enable_moving "gr_allies" true)
                    (sleep 1)
                    (if b_dialogue 
                        (print "marine: hold here for the dawn, sir!"))
                    (sleep (ai_play_line_at_player marine 070mf_190))
                    (sleep 10)
                    (vs_release_all)
                ) (begin
                    (vs_cast ai_fl_johnson true 10 "070mf_200")
                    (set johnson (vs_role 1))
                    (if b_dialogue 
                        (print "johnson (radio): hang on, chief! wait for the commander to land!"))
                    (sleep (ai_play_line johnson 070mf_200))
                    (sleep 10)
                    (cs_run_command_script "allies_fl_johnson/johnson" cs_johnson_stay_in_turret)
                )
            )
        )
    )
)

(script dormant void md_fl_allies_come_back
    (if b_debug 
        (print "mission dialogue:fl:allies:come:back"))
    (sleep_until (volume_test_players "vol_fl_up") 30 900)
    (if (not (volume_test_players "vol_fl_up")) 
        (begin
            (vs_cast ai_fl_johnson true 10 "070mf_230")
            (set johnson (vs_role 1))
            (md_dialogue_start)
            (if b_dialogue 
                (print "johnson (radio): chief! double-time it back to my pelican!"))
            (sleep (ai_play_line johnson 070mf_230))
            (sleep 10)
            (if b_dialogue 
                (print "johnson (re tanks): let's see what the commander's got for us!"))
            (sleep (ai_play_line johnson 070mf_240))
            (sleep 10)
            (cs_run_command_script "allies_fl_johnson/johnson" cs_johnson_stay_in_turret)
        )
    )
)

(script dormant void 070pa_dialog
    (sleep_until (not b_playing_dialogue) 30 90)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_debug 
        (print "perspective:fl:070pa:dialog"))
    (if b_dialogue 
        (print "johnson (radio): commander? bring her down!"))
    (sleep (ai_play_line_on_object none 070pa_010))
    (sleep 30)
    (if b_dialogue 
        (print "miranda (radio): roger that. beginning my descent..."))
    (sleep (ai_play_line_on_object none 070pa_020))
    (sleep 30)
    (set 070pa_dialog_done true)
    (sleep_until b_fl_frigate_arrives)
    (if (player_in_a_vehicle_with_ai) 
        (begin
            (set ol_ex_temp_list (get_ai_in_player_vehicle))
            (if (>= (list_count ol_ex_temp_list) 2) 
                (begin
                    (vs_cast (get_ai_in_player_vehicle) true 10 "070mx_015" "070mx_020")
                    (set marine_01 (vs_role 1))
                    (set marine_02 (vs_role 2))
                ) (begin
                    (vs_cast (get_ai_in_player_vehicle) true 10 "070mx_015")
                    (set marine_01 (vs_role 1))
                    (vs_cast "gr_allies_before_fl" true 10 "070mx_020")
                    (set marine_02 (vs_role 1))
                )
            )
        ) (begin
            (vs_cast "gr_allies_before_fl" true 10 "070mx_015" "070mx_020")
            (set marine_01 (vs_role 1))
            (set marine_02 (vs_role 2))
        )
    )
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving "gr_allies" true)
    (sleep 1)
    (if b_dialogue 
        (print "marine: look! up high! here she comes!"))
    (sleep (ai_play_line_at_player marine_01 070mx_015))
    (sleep 10)
    (if b_dialogue 
        (print "marine: is the dawn rated for atmosphere?"))
    (sleep (ai_play_line_at_player marine_02 070mx_020))
    (sleep 10)
    (if b_dialogue 
        (print "marine: guess we're gonna find out! take cover!"))
    (sleep (ai_play_line_at_player marine_01 070mx_030))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_fl_set_objective
    (sleep_until 070pa_dialog_done)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_debug 
        (print "mission dialogue:fl:set:objective"))
    (vs_cast ai_fl_johnson true 20 "070mf_260")
    (set johnson (vs_role 1))
    (sleep 1)
    (vs_enable_looking ai_fl_johnson false)
    (vs_enable_moving ai_fl_johnson false)
    (vs_enable_targeting ai_fl_johnson false)
    (if b_dialogue 
        (print "miranda (radio): thanks, chief. wouldn't have lasted much longer up there."))
    (sleep (ai_play_line_on_object none 070pa_040))
    (sleep 10)
    (if b_dialogue 
        (print "miranda (radio): come to the back of the frigate"))
    (sleep (ai_play_line_on_object none 070mf_210))
    (sleep 45)
    (if b_sd_cartographer_hint 
        (begin
            (if b_dialogue 
                (print "miranda (radio): did the elites get a fix on the cartographer?"))
            (sleep (ai_play_line_on_object none 070mf_250))
            (sleep 10)
            (if b_dialogue 
                (print "johnson (radio): yes, ma'am. just on the other side of the wall"))
            (sleep (ai_play_line johnson 070mf_260))
            (sleep 10)
        ) (begin
            (if b_dialogue 
                (print "miranda (radio): johnson? have the elites found anything?"))
            (sleep (ai_play_line_on_object none 070mf_270))
            (sleep 10)
            (if b_dialogue 
                (print "johnson (radio): a structure on the other side of the wall, ma'am"))
            (sleep (ai_play_line johnson 070mf_280))
            (sleep 10)
        )
    )
    (if b_dialogue 
        (print "johnson (radio): but it's surrounded by brute heavy armor."))
    (sleep (ai_play_line johnson 070mf_310))
    (sleep 10)
    (if b_dialogue 
        (print "miranda (radio): don't worry. i've got a plan."))
    (sleep (ai_play_line_on_object none 070mf_330))
    (set b_fl_briefing_finished true)
    (cs_run_command_script "allies_fl_johnson/johnson" cs_johnson_stay_in_turret)
)

(script dormant void 070bb_dialog
    (sleep_until b_fl_briefing_finished 15 2400)
    (sleep (random_range 30 45))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_debug 
        (print "perspective:fl:070bb:dialog"))
    (vs_cast "gr_guilty_spark" false 10 "070mf_340")
    (set guilty_spark (vs_role 1))
    (if (< g_insertion_index 9) 
        (begin
            (vs_cast ai_fl_johnson true 20 "070mf_360")
            (set johnson (vs_role 1))
        )
    )
    (vs_enable_moving "gr_guilty_spark" true)
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (sleep 1)
    (if b_dialogue 
        (print "miranda (radio): if we can't fly over the wall? we'll go right through it."))
    (sleep (ai_play_line_on_object none 070bb_010))
    (sleep 10)
    (if b_dialogue 
        (print "miranda (radio): chief, take one of the tanks. lead the way."))
    (sleep (ai_play_line_on_object none 070bb_020))
    (sleep 10)
    (set b_fl_070bb_done true)
    (if b_dialogue 
        (print "miranda (radio): you find any locked doors? spark will be happy to pry them open."))
    (sleep (ai_play_line_on_object none 070bb_030))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: i will certainly try my best"))
    (sleep (ai_play_line_on_object guilty_spark 070mf_340))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: though i am unfamiliar with this facility."))
    (sleep (ai_play_line_on_object guilty_spark 070mf_350))
    (sleep 10)
    (if b_dialogue 
        (print "johnson (radio): alright then. you heard the lady"))
    (if (< g_insertion_index 9) 
        (sleep (ai_play_line johnson 070mf_360)) (sleep (ai_play_line_on_object none 070mf_360)))
    (sleep 10)
    (set b_070_music_08 true)
    (md_dialogue_stop)
    (cs_run_command_script "allies_fl_johnson/johnson" cs_johnson_stay_in_turret)
)

(script dormant void md_fl_marine_tank_intro
    (sleep_until b_fl_frigate_unloading)
    (if b_debug 
        (print "mission dialogue:fg:marine:tank:intro"))
    (vs_cast "allies_fl_warthog/driver" false 20 "")
    (set marine (vs_role 1))
    (vs_cast "allies_fl_scorpion_0/driver" false 20 "")
    (set marine_01 (vs_role 1))
    (vs_cast "allies_fl_scorpion_1/driver" false 20 "")
    (set marine_02 (vs_role 1))
    (vs_cast "allies_fl_scorpion_2/driver" false 20 "")
    (set marine_03 (vs_role 1))
    (vs_cast "gr_allies_la_scorpions" false 10 "070mf_380")
    (set md_fl_cheer_marine_0 (vs_role 1))
    (set md_fl_cheer_marine_1 (vs_role 2))
    (set md_fl_cheer_marine_2 (vs_role 3))
    (set md_fl_cheer_marine_3 (vs_role 4))
    (set md_fl_cheer_marine_4 (vs_role 5))
    (vs_cast "gr_allies_fl" false 10 "070mf_380")
    (set md_fl_cheer_marine_5 (vs_role 1))
    (set md_fl_cheer_marine_6 (vs_role 2))
    (set md_fl_cheer_marine_7 (vs_role 3))
    (set md_fl_cheer_marine_8 (vs_role 4))
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" true)
    (vs_enable_moving marine false)
    (vs_enable_moving marine_01 false)
    (vs_enable_moving marine_02 false)
    (vs_enable_moving marine_03 false)
    (sleep 1)
    (sleep_until b_fl_070bb_done)
    (sleep_until (volume_test_object "vol_fl_tanks_on_ground" "allies_fl_scorpion_0/driver") 30 900)
    (vs_move_in_direction marine_01 false 0.0 5.0 0.0)
    (sleep 15)
    (vs_move_in_direction marine_02 false 180.0 4.0 0.0)
    (sleep 30)
    (vs_move_in_direction marine_03 false 0.0 5.0 0.0)
    (sleep 15)
    (vs_move_in_direction marine false 0.0 5.0 0.0)
    (sleep_until (not (volume_test_object "vol_fl_tanks_on_ground" "allies_fl_scorpion_0/driver")) 30 300)
    (sleep 60)
    (set b_fl_tanks_available true)
    (vs_enable_moving marine true)
    (vs_enable_moving marine_02 true)
    (vs_enable_moving marine_03 true)
    (vs_enable_moving marine_01 true)
    (ai_vehicle_reserve_seat obj_fl_scorpion_0 scorpion_d true)
    (ai_vehicle_exit marine_01)
    (wake md_fl_pick_tank)
    (sleep_until b_fl_chief_in_vehicle)
    (sleep_until (not b_playing_dialogue))
    (if (< g_insertion_index 9) 
        (begin
            (vs_cast ai_fl_johnson true 20 "070mf_370")
            (set johnson (vs_role 1))
        )
    )
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (sleep 60)
    (if b_dialogue 
        (print "johnson (radio): mount up! let's roll!"))
    (if (< g_insertion_index 9) 
        (sleep (ai_play_line johnson 070mf_370)) (sleep (ai_play_line_on_object none 070mf_370)))
    (sleep 10)
    (if b_dialogue 
        (print "marines: (various) ooh-rah! alright! get some!"))
    (vs_play_line md_fl_cheer_marine_0 false 070mf_380)
    (sleep 10)
    (vs_play_line md_fl_cheer_marine_1 false 070mf_380)
    (vs_play_line md_fl_cheer_marine_2 false 070mf_380)
    (vs_play_line md_fl_cheer_marine_3 false 070mf_380)
    (sleep 10)
    (vs_play_line md_fl_cheer_marine_4 false 070mf_380)
    (vs_play_line md_fl_cheer_marine_5 false 070mf_380)
    (vs_play_line md_fl_cheer_marine_6 false 070mf_380)
    (sleep 10)
    (vs_play_line md_fl_cheer_marine_7 false 070mf_380)
    (vs_play_line md_fl_cheer_marine_8 false 070mf_380)
    (sleep 120)
    (if (>= (game_difficulty_get) legendary) 
        (begin
            (if b_dialogue 
                (print "marines: (hum/sing 'flight of the valkyries')"))
            (vs_play_line marine_03 true 070mf_390)
            (sleep 10)
        )
    )
    (vs_release_all)
    (cs_run_command_script "allies_fl_johnson/johnson" cs_johnson_stay_in_turret)
)

(script dormant void md_fl_stop_pick_tank
    (sleep_until b_fl_chief_in_vehicle)
    (sleep_forever md_fl_pick_tank)
    (set s_gs_walkup_dist 5)
    (set s_gs_talking_dist 7)
    (set g_gs_1st_line 070mh_450)
    (set g_gs_2nd_line 070mk_150)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
)

(script dormant void md_fl_pick_tank
    (wake md_fl_stop_pick_tank)
    (sleep_until (not b_playing_dialogue))
    (if b_debug 
        (print "mission dialogue:fl:pick:tank"))
    (vs_cast "gr_guilty_spark" true 10 "070mf_400")
    (set guilty_spark (vs_role 1))
    (vs_cast ai_fl_johnson true 20 "070mf_430")
    (set johnson (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (vs_enable_moving "gr_guilty_spark" true)
    (sleep 1)
    (if b_dialogue 
        (print "guilty: shall i help you choose a vehicle, reclaimer?"))
    (sleep (ai_play_line_on_object guilty_spark 070mf_400))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: this one seems in very good condition"))
    (sleep (ai_play_line_on_object guilty_spark 070mf_410))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: primitive armament notwithstanding."))
    (sleep (ai_play_line_on_object guilty_spark 070mf_420))
    (sleep 10)
    (if b_dialogue 
        (print "johnson (radio): tank's a tank, light bulb."))
    (sleep (ai_play_line johnson 070mf_430))
    (sleep 10)
    (if b_dialogue 
        (print "johnson (radio): pick one, chief! get back to the wall!"))
    (sleep (ai_play_line johnson 070mf_440))
    (sleep 10)
    (if b_dialogue 
        (print "johnson (radio): i'll help the commander secure the dawn"))
    (sleep (ai_play_line johnson 070mf_450))
    (sleep 10)
    (if b_dialogue 
        (print "johnson (radio): then we'll meet you at the cartographer!"))
    (sleep (ai_play_line johnson 070mf_460))
    (sleep 10)
    (vs_release_all)
    (cs_run_command_script "allies_fl_johnson/johnson" cs_johnson_stay_in_turret)
)

(script dormant void 070pa_start
    (fl_create_frigate)
    (object_cinematic_visibility "fl_frigate_scenery" true)
    (scenery_animation_start "fl_frigate_scenery" "objects\cinematics\human\frigate\frigate\cinematics\perspectives\070pa_frigate_lands\070pa_frigate_lands" "070pa_cin_frigate_1")
    (sound_impulse_start "sound\levels\070_waste\070_frigate_landing\070_frigate_landing.sound" "fl_frigate_sound_start" 1.0)
    (objects_attach "fl_frigate_scenery" "marker_backelevator02" "fl_frigate_sound" "")
    (sound_looping_start "sound\levels\070_waste\070_frigate_landing\frigate_loop\frigate_loop.sound_looping" "fl_frigate_sound" 1.0)
    (sleep (min (scenery_get_animation_time "fl_frigate_scenery") 900.0))
    (fl_replace_elevators)
)

(script command_script void cs_fl_get_to_briefing
    (cs_enable_moving true)
    (cs_enable_looking true)
    (sleep_until 
        (or
            (and
                (volume_test_object "vol_aw_pass_bridge" ai_current_actor)
                (not (any_players_in_vehicle))
            )
            (>= s_la_progression 10)
        ) 
    15 1800)
    (sleep_until 
        (or
            (and
                (volume_test_object "vol_aw_all" ai_current_actor)
                (not (any_players_in_vehicle))
            )
            (>= s_la_progression 10)
        ) 
    15)
    (if (not (any_players_in_vehicle)) 
        (unit_exit_vehicle ai_current_actor))
    (sleep_until 
        (or
            (volume_test_object "vol_fl_sgt_briefing" ai_current_actor)
            (>= s_la_progression 10)
        ) 
    30 1800)
    (cs_movement_mode ai_movement_patrol)
    (sleep 150)
    (cs_stow)
    (cs_posture_set "patrol:unarmed:look" true)
    (cs_enable_moving false)
    (cs_face true "pts_fl_sgt_briefing/face_0")
    (cs_draw)
    (sleep_until b_fl_tanks_available 30 3600)
    (sleep (random_range 0 60))
)

(script dormant void fl_stop_briefing
    (sleep_until b_fl_pelican_unloaded)
    (sleep_forever vb_fg_sgt_briefing)
    (cs_run_command_script "allies_fl_pelican_marines" cs_draw_weapon)
    (ai_enter_squad_vehicles "allies_fl_pelican_marines")
)

(script dormant void vb_fg_sgt_briefing
    (sleep_until b_fl_pelican_arrived)
    (if b_debug 
        (print "vb:fg:marine:briefing"))
    (vs_cast ai_fl_sergeant false 10 "")
    (set sergeant (vs_role 1))
    (vs_cast ai_fl_pelican_marines_0 false 10 "")
    (set marine_05 (vs_role 1))
    (vs_cast ai_fl_pelican_marines_1 false 10 "")
    (set marine_06 (vs_role 1))
    (vs_cast ai_fl_pelican_marines_2 false 10 "")
    (set marine_07 (vs_role 1))
    (vs_enable_pathfinding_failsafe "allies_fl_pelican_marines" true)
    (vs_enable_looking "allies_fl_pelican_marines" true)
    (vs_enable_targeting "allies_fl_pelican_marines" true)
    (vs_movement_mode sergeant ai_movement_patrol)
    (vs_movement_mode marine_05 ai_movement_patrol)
    (vs_movement_mode marine_06 ai_movement_patrol)
    (vs_movement_mode marine_07 ai_movement_patrol)
    (ai_vehicle_exit sergeant)
    (sleep 90)
    (vs_go_to_and_face sergeant false "pts_fl_sgt_briefing/sgt_p0" "pts_fl_sgt_briefing/sgt_face_0")
    (ai_vehicle_exit marine_05)
    (sleep 90)
    (vs_go_to_and_face marine_05 false "pts_fl_sgt_briefing/p2" "pts_fl_sgt_briefing/face_0")
    (ai_vehicle_exit marine_06)
    (sleep 90)
    (vs_go_to_and_face marine_06 false "pts_fl_sgt_briefing/p1" "pts_fl_sgt_briefing/face_0")
    (ai_vehicle_exit marine_07)
    (sleep 90)
    (set b_fl_pelican_unloaded true)
    (vs_go_to_and_face marine_07 true "pts_fl_sgt_briefing/p0" "pts_fl_sgt_briefing/face_0")
    (cs_run_command_script "allies_fl_pelican/pilot" cs_fl_pelican_exits)
    (vs_stow sergeant)
    (sleep 60)
    (vs_face marine_05 true "pts_fl_sgt_briefing/face_0")
    (vs_stow marine_05)
    (sleep 7)
    (vs_stow marine_07)
    (vs_face marine_07 true "pts_fl_sgt_briefing/face_0")
    (sleep 7)
    (vs_stow marine_06)
    (vs_face marine_06 true "pts_fl_sgt_briefing/face_0")
    (sleep 10)
    (sleep 60)
    (sleep 10)
    (vs_go_to_and_face sergeant true "pts_fl_sgt_briefing/sgt_p1" "pts_fl_sgt_briefing/sgt_face_1")
    (vs_face sergeant true "pts_fl_sgt_briefing/sgt_face_1")
    (sleep 60)
    (sleep 10)
    (sleep 60)
    (sleep 10)
    (vs_go_to_and_face sergeant false "pts_fl_sgt_briefing/sgt_p0" "pts_fl_sgt_briefing/sgt_face_0")
    (vs_face sergeant true "pts_fl_sgt_briefing/sgt_face_0")
    (sleep 60)
    (sleep 10)
    (vs_go_to_and_face sergeant false "pts_fl_sgt_briefing/sgt_p1" "pts_fl_sgt_briefing/sgt_face_1")
    (vs_face sergeant true "pts_fl_sgt_briefing/sgt_face_1")
    (sleep_forever)
)

(script static boolean la_tank_living
    (or
        (> (unit_get_health (ai_vehicle_get_from_starting_location "allies_la_scorpion_0/driver")) 0.0)
        (> (unit_get_health (ai_vehicle_get_from_starting_location "allies_la_scorpion_1/driver")) 0.0)
        (> (unit_get_health (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank")) 0.0)
    )
)

(script dormant void md_la_stop_tank_advance
    (sleep_until 
        (or
            (>= s_dw_progression 10)
            (not (la_tank_living))
        )
    )
    (sleep_forever md_la_tank_advance)
    (cs_run_command_script "gr_allies_la_scorpions" cs_end)
    (md_dialogue_stop)
)

(script dormant void md_la_tank_advance
    (wake md_la_stop_tank_advance)
    (sleep_until (<= (ai_living_count "gr_cov_la_p1_ghosts") 3))
    (sleep_until (not b_playing_dialogue))
    (if b_debug 
        (print "mission dialogue:la:tank:advance:0"))
    (vs_cast "gr_allies_la_scorpions" false 10 "070mg_010")
    (set sergeant (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies_la_scorpions" true)
    (vs_enable_looking "gr_allies_la_scorpions" true)
    (vs_enable_targeting "gr_allies_la_scorpions" true)
    (vs_enable_moving "gr_allies_la_scorpions" true)
    (sleep 1)
    (if b_dialogue 
        (print "sergeant (radio, over tank): ha!  how does 90 millimeters of tungsten strike you?"))
    (sleep (ai_play_line_on_object none 070mg_010))
    (sleep 10)
    (md_dialogue_stop)
    (vs_release_all)
    (sleep_until (<= (ai_living_count "gr_cov_la_p1_ghosts") 1) 30 1800)
    (sleep_until (<= (ai_living_count "gr_cov_la_p1_ghosts") 0) 30 150)
    (sleep_until (not b_playing_dialogue))
    (if (<= (ai_living_count "gr_cov_la_p1_ghosts") 1) 
        (begin
            (if b_debug 
                (print "mission dialogue:la:tank:advance:1"))
            (vs_cast "gr_allies_la_scorpions" false 10 "070mg_020")
            (set marine (vs_role 1))
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (vs_enable_pathfinding_failsafe "gr_allies_la_scorpions" true)
            (vs_enable_looking "gr_allies_la_scorpions" true)
            (vs_enable_targeting "gr_allies_la_scorpions" true)
            (vs_enable_moving "gr_allies_la_scorpions" true)
            (sleep 30)
            (if b_dialogue 
                (print "marine (radio, over tank): tank beats ghost!"))
            (sleep (ai_play_line_on_object none 070mg_020))
            (sleep 10)
            (md_dialogue_stop)
            (vs_release_all)
        )
    )
    (sleep_until (>= s_la_progression 22))
    (sleep 60)
    (sleep_until 
        (or
            (<= (ai_living_count "cov_la_p1_hunters") 0)
            (>= s_la_progression 35)
        ) 
    30 1800)
    (sleep_until (not b_playing_dialogue))
    (if (<= (ai_living_count "cov_la_p1_hunters") 0) 
        (begin
            (if b_debug 
                (print "mission dialogue:la:tank:advance:2"))
            (vs_cast "gr_allies_la_scorpions" false 10 "070mg_030")
            (set marine (vs_role 1))
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (vs_enable_pathfinding_failsafe "gr_allies_la_scorpions" true)
            (vs_enable_looking "gr_allies_la_scorpions" true)
            (vs_enable_targeting "gr_allies_la_scorpions" true)
            (vs_enable_moving "gr_allies_la_scorpions" true)
            (sleep 30)
            (if b_dialogue 
                (print "marine (radio, over tank): tank beats hunter!"))
            (sleep (ai_play_line_on_object none 070mg_030))
            (sleep 10)
            (md_dialogue_stop)
            (vs_release_all)
        )
    )
    (sleep_until (>= s_la_progression 30))
    (sleep 60)
    (sleep_until (<= (ai_living_count "cov_la_p2_1st_tower") 1))
    (sleep_until (not b_playing_dialogue))
    (if b_debug 
        (print "mission dialogue:la:tank:advance:3"))
    (vs_cast "gr_allies_la_scorpions" false 10 "070mg_040")
    (set marine (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies_la_scorpions" true)
    (vs_enable_looking "gr_allies_la_scorpions" true)
    (vs_enable_targeting "gr_allies_la_scorpions" true)
    (vs_enable_moving "gr_allies_la_scorpions" true)
    (sleep 45)
    (if b_dialogue 
        (print "marine (radio, over tank): tank beats everything!"))
    (sleep (ai_play_line_on_object none 070mg_040))
    (sleep 10)
    (if b_dialogue 
        (print "marine (radio, over tank): oh, man! i could do this all day!"))
    (sleep (ai_play_line_on_object none 070mg_050))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_la_gs_cautious
    (sleep_until (>= s_dw_progression 50))
    (sleep_until 
        (or
            (<= (objects_distance_to_object (player0) obj_guilty_spark) 6.0)
            (<= (objects_distance_to_object (player1) obj_guilty_spark) 6.0)
            (<= (objects_distance_to_object (player2) obj_guilty_spark) 6.0)
            (<= (objects_distance_to_object (player3) obj_guilty_spark) 6.0)
        ) 
    15)
    (if b_debug 
        (print "mission dialogue:la:gs:cautious"))
    (vs_cast "gr_guilty_spark" true 10 "070mg_060")
    (set guilty_spark (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (vs_enable_moving "gr_guilty_spark" false)
    (sleep 1)
    (vs_approach_player guilty_spark false 5.0 40.0 40.0)
    (sleep_until 
        (or
            (<= (objects_distance_to_object (player0) obj_guilty_spark) 7.0)
            (<= (objects_distance_to_object (player1) obj_guilty_spark) 7.0)
            (<= (objects_distance_to_object (player2) obj_guilty_spark) 7.0)
            (<= (objects_distance_to_object (player3) obj_guilty_spark) 7.0)
        ) 
    15 150)
    (sleep_until (not b_playing_dialogue))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "guilty: please! use caution!"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_060))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: avoid collateral damage!"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_070))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: while this facility looks quite hardy on the surface"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_080))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: there are undoubtedly delicate structures below the facade!"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_090))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_dw_stop_go_to_door
    (sleep_until (>= (device_get_position "lb_first_door") 0.1))
    (sleep_forever md_dw_go_to_door)
    (md_dialogue_stop)
)

(script dormant void md_dw_go_to_door
    (wake md_dw_stop_go_to_door)
    (sleep_until (>= s_dw_progression 20))
    (sleep_until (not b_playing_dialogue))
    (if b_debug 
        (print "mission dialogue:dw:go:to:door"))
    (vs_cast "gr_guilty_spark" true 10 "070mg_120")
    (set guilty_spark (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (vs_enable_moving "gr_guilty_spark" true)
    (sleep 1)
    (if b_dialogue 
        (print "sergeant (radio, over tank): all armor: form up on the lower doorway!"))
    (sleep (ai_play_line_on_object none 070mg_100))
    (sleep 10)
    (if b_dialogue 
        (print "sergeant (radio, over tank): chief! get upstairs, have your robot pick that lock!"))
    (sleep (ai_play_line_on_object none 070mg_110))
    (sleep 10)
    (if b_dialogue 
        (print "guilty (miffed): i beg your pardon?"))
    (sleep (ai_play_line_on_object none 070mg_120))
    (sleep 10)
    (if b_dialogue 
        (print "guilty (miffed): i am 343 guilty spark. monitor of installation zero-four!"))
    (sleep (ai_play_line_on_object none 070mg_130))
    (sleep 10)
    (if b_dialogue 
        (print "sergeant (radio, over tank): yeah, well you're also our ticket through this wall"))
    (sleep (ai_play_line_on_object none 070mg_140))
    (sleep 10)
    (if b_dialogue 
        (print "sergeant (radio, over tank): so, if you don't mind --"))
    (sleep (ai_play_line_on_object none 070mg_150))
    (sleep 10)
    (if b_dialogue 
        (print "guilty (a little saucy): i will gladly aid the reclaimer's progress."))
    (sleep (ai_play_line_on_object none 070mg_160))
    (sleep 10)
    (vs_release_all)
    (set b_070_music_086 true)
)

(script dormant void md_dw_stop_allies_next
    (sleep_until (>= s_lb_progression 20))
    (sleep_forever md_dw_allies_next)
    (md_dialogue_stop)
)

(script dormant void md_dw_allies_next
    (wake md_dw_stop_allies_next)
    (sleep_until (volume_test_players "vol_dw_near_door") 30 300)
    (if (not (volume_test_players "vol_dw_near_door")) 
        (begin
            (sleep_until (not b_playing_dialogue))
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_debug 
                (print "mission dialogue:dw:gs:go:to:door"))
            (sleep 1)
            (if b_dialogue 
                (print "guilty (radio): reclaimer? come to the upper doorway"))
            (sleep (ai_play_line_on_object none 070mg_170))
            (sleep 10)
            (if b_dialogue 
                (print "guilty (radio): the others can take the lower route."))
            (sleep (ai_play_line_on_object none 070mg_180))
            (sleep 10)
            (md_dialogue_stop)
        ) (sleep_until (not (volume_test_players "vol_dw_near_door"))))
    (sleep_until (volume_test_players "vol_dw_near_door") 30 600)
    (if (not (volume_test_players "vol_dw_near_door")) 
        (begin
            (sleep_until (not b_playing_dialogue))
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_dialogue 
                (print "sergeant (radio): we'll go low, chief! you check the upper floor"))
            (sleep (ai_play_line_on_object none 070mg_230))
            (sleep 10)
            (if b_dialogue 
                (print "sergeant (radio): make sure we got a path through the wall!"))
            (sleep (ai_play_line_on_object none 070mg_240))
            (sleep 10)
            (md_dialogue_stop)
        ) (sleep_until (not (volume_test_players "vol_dw_near_door"))))
    (sleep_until (volume_test_players "vol_dw_near_door") 30 1200)
    (if (not (volume_test_players "vol_dw_near_door")) 
        (begin
            (sleep_until (not b_playing_dialogue))
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_dialogue 
                (print "johnson (radio): heavy armor's gotta go low, chief! you check the upper floor"))
            (sleep (ai_play_line_on_object none 070mg_250))
            (sleep 10)
            (hud_activate_team_nav_point_flag player "flg_dw_wall_door" 0.0)
            (if b_dialogue 
                (print "johnson (radio): make sure they have a path through the wall!"))
            (sleep (ai_play_line_on_object none 070mg_260))
            (sleep 10)
            (md_dialogue_stop)
            (sleep_until 
                (or
                    (volume_test_players "vol_dw_near_door")
                    (>= s_lb_progression 20)
                ) 
            5)
            (hud_deactivate_team_nav_point_flag player "flg_dw_wall_door")
        )
    )
)

(script dormant void md_dw_stop_open_door
    (sleep_until (>= (device_get_position "ex_wall_door") 0.1) 10)
    (sleep_until (script_finished "md_dw_open_door") 30 300)
    (if (not (script_finished "md_dw_open_door")) 
        (begin
            (sleep_forever md_dw_open_door)
            (cs_run_command_script "gr_guilty_spark" cs_end)
            (unit_add_equipment (unit obj_guilty_spark) "no_weapon_profile" true false)
            (md_dialogue_stop)
        )
    )
)

(script dormant void md_dw_open_door
    (wake md_dw_stop_open_door)
    (sleep_until (volume_test_players "vol_dw_near_door") 10)
    (ai_bring_forward obj_guilty_spark 10.0)
    (sleep_until (volume_test_object "vol_dw_near_door" obj_guilty_spark) 10)
    (sleep_until (not b_playing_dialogue) 30 300)
    (sleep 60)
    (set b_070_music_085 false)
    (set b_070_music_086 false)
    (vs_cast "gr_guilty_spark" true 20 "070mg_190")
    (set guilty_spark (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe guilty_spark true)
    (vs_enable_looking guilty_spark false)
    (vs_enable_targeting guilty_spark false)
    (vs_enable_moving guilty_spark false)
    (sleep 1)
    (vs_fly_to guilty_spark false "pts_dw_gs/p0" 0.2)
    (if b_dialogue 
        (print "guilty: odd. for a doorway to abide such robust security protocols"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_190))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: one moment, reclaimer"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_200))
    (sleep 10)
    (unit_add_equipment (unit obj_guilty_spark) "gs_profile" true false)
    (sleep 1)
    (vs_shoot_point guilty_spark true "pts_dw_gs/shoot_at")
    (vs_fly_to guilty_spark false "pts_dw_gs/p1")
    (sleep 60)
    (set b_dw_gs_open_door true)
    (if b_dialogue 
        (print "guilty: (hums)"))
    (ai_play_line_on_object guilty_spark 070mg_210)
    (sleep 10)
    (sleep_until (>= (device_get_position "ex_wall_door") 0.1) 10 150)
    (vs_shoot_point guilty_spark false "pts_dw_gs/shoot_at")
    (sleep 1)
    (unit_add_equipment (unit obj_guilty_spark) "no_weapon_profile" true false)
    (vs_enable_moving guilty_spark true)
    (if b_dialogue 
        (print "guilty: there we are! please follow me!"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_220))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_lb_stop_open_door
    (sleep_until (>= (device_get_position "lb_first_door") 0.1) 10)
    (sleep_until (script_finished "md_lb_open_door") 30 1200)
    (if (not (script_finished "md_lb_open_door")) 
        (begin
            (sleep_forever md_lb_open_door)
            (cs_run_command_script "gr_guilty_spark" cs_end)
            (unit_add_equipment (unit obj_guilty_spark) "no_weapon_profile" true false)
            (md_dialogue_stop)
        )
    )
)

(script dormant void md_lb_open_door
    (wake md_lb_stop_open_door)
    (sleep_until (volume_test_players "vol_lb_gs_open_door") 10)
    (sleep_until (volume_test_object "vol_lb_gs_open_door" obj_guilty_spark) 10 150)
    (ai_bring_forward obj_guilty_spark 10.0)
    (sleep_until (volume_test_object "vol_lb_gs_open_door" obj_guilty_spark) 10)
    (vs_cast "gr_guilty_spark" false 20 "")
    (set guilty_spark (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe guilty_spark true)
    (vs_enable_looking guilty_spark false)
    (vs_enable_targeting guilty_spark false)
    (vs_enable_moving guilty_spark false)
    (sleep 1)
    (vs_fly_to guilty_spark false "pts_lb_gs/p0" 0.2)
    (sleep_until (not (vs_running_atom_movement guilty_spark)) 30 150)
    (unit_add_equipment (unit obj_guilty_spark) "gs_profile" true false)
    (sleep 1)
    (vs_shoot_point guilty_spark true "pts_lb_gs/shoot_at")
    (vs_fly_to_and_face guilty_spark false "pts_lb_gs/p1" "pts_lb_gs/shoot_at")
    (sleep_until (>= (device_get_power "lb_first_door") 0.1) 10 180)
    (set b_lb_gs_open_door true)
    (vs_shoot_point guilty_spark false "pts_lb_gs/shoot_at")
    (sleep 1)
    (unit_add_equipment (unit obj_guilty_spark) "no_weapon_profile" true false)
    (sleep_until (>= (device_get_position "lb_first_door") 0.1) 10 150)
    (vs_release_all)
)

(script dormant void md_lb_stop_gs_go_to_switch
    (sleep_until 
        (or
            (<= (device_get_position "lb_lightbridge_switch") 0.9)
            b_lb_lightbridge_on
        ) 
    5)
    (sleep_forever md_lb_gs_go_to_switch)
    (md_dialogue_stop)
    (sleep 1)
    (cs_run_command_script "gr_guilty_spark" cs_end)
)

(script dormant void md_lb_gs_go_to_switch
    (sleep_until (>= s_lb_progression 20))
    (wake md_lb_stop_gs_go_to_switch)
    (sleep_until (volume_test_object "vol_lb_switch_room" obj_guilty_spark) 10)
    (sleep 60)
    (if b_debug 
        (print "mission dialogue:lb:gs:go:to:switch"))
    (vs_cast "gr_guilty_spark" true 20 "070mh_050")
    (set guilty_spark (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (vs_enable_moving "gr_guilty_spark" true)
    (sleep 1)
    (if b_dialogue 
        (print "guilty: here! this panel will activate a bridge"))
    (sleep (ai_play_line_on_object guilty_spark 070mh_050))
    (sleep 10)
    (sleep 120)
    (if b_dialogue 
        (print "guilty: allow your companions to cross below!"))
    (sleep (ai_play_line_on_object guilty_spark 070mh_060))
    (sleep 10)
    (sleep 60)
    (vs_release_all)
    (sleep 1)
    (set s_gs_walkup_dist 3)
    (set s_gs_talking_dist 4)
    (set g_gs_1st_line 070mh_070)
    (set g_gs_2nd_line 070mh_070)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
)

(script dormant void md_lb_gs_next
    (sleep_until b_lb_lightbridge_on)
    (sleep 30)
    (sleep_until (not b_playing_dialogue) 30 300)
    (if b_debug 
        (print "mission dialogue:lb:gs:next"))
    (vs_cast "gr_guilty_spark" true 20 "070mh_080")
    (set guilty_spark (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (vs_enable_moving "gr_guilty_spark" true)
    (sleep 1)
    (if b_dialogue 
        (print "guilty: excellent! this way!"))
    (sleep (ai_play_line_on_object guilty_spark 070mh_080))
    (sleep 10)
    (vs_release_all)
    (set s_gs_walkup_dist 3)
    (set s_gs_talking_dist 4)
    (set g_gs_1st_line 070mh_090)
    (set g_gs_2nd_line 070mh_100)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
    (sleep_until (>= s_lb_progression 40) 30 300)
    (if (< s_lb_progression 40) 
        (begin
            (sleep_until (not b_playing_dialogue) 30 300)
            (if b_debug 
                (print "mission dialogue:lb:gs:next"))
            (vs_cast "gr_guilty_spark" true 20 "070mh_010")
            (set guilty_spark (vs_role 1))
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
            (vs_enable_looking "gr_guilty_spark" true)
            (vs_enable_targeting "gr_guilty_spark" true)
            (vs_enable_moving "gr_guilty_spark" true)
            (if b_dialogue 
                (print "guilty: sudden clarity!"))
            (sleep (ai_play_line_on_object guilty_spark 070mh_010))
            (sleep 10)
            (if b_dialogue 
                (print "guilty: these sentinels were trying to deny the meddlers' access to the lower levels of this facility."))
            (sleep (ai_play_line_on_object guilty_spark 070mh_020))
            (sleep 15)
            (if b_dialogue 
                (print "guilty: a wise decision, given their predilection for destructive acquisition."))
            (sleep (ai_play_line_on_object guilty_spark 070mh_030))
            (sleep 10)
            (vs_release_all)
            (set s_gs_walkup_dist 3)
            (set s_gs_talking_dist 4)
            (set g_gs_1st_line 070mh_090)
            (set g_gs_2nd_line 070mh_100)
            (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
        )
    )
)

(script dormant void bd_get_inside_shaft
    (sleep_until 
        (and
            (>= s_lb_progression 30)
            b_lb_lightbridge_on
        )
    )
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_debug 
        (print "mission dialogue:bd_get_inside_shaft"))
    (if b_dialogue 
        (print "miranda (radio): good work, chief!"))
    (sleep (ai_play_line_on_object none 070bc_010))
    (sleep 10)
    (if b_dialogue 
        (print "miranda (radio): link up with our armor on the far side of the wall"))
    (sleep (ai_play_line_on_object none 070bc_020))
    (sleep 10)
    (if b_dialogue 
        (print "miranda (radio): make your way down to the cartographer!"))
    (sleep (ai_play_line_on_object none 070bc_030))
    (sleep 10)
)

(script command_script void cs_bb_wraith_0
    (cs_enable_moving true)
    (cs_shoot false)
    (cs_enable_targeting false)
    (cs_enable_looking true)
    (cs_abort_on_damage true)
    (sleep_forever)
)

(script command_script void cs_bb_wraith_1
    (cs_face true "pts_bb_wraiths/face")
    (sleep_until b_vd_warthogs_advance 5)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_shoot true)
    (cs_shoot true "allies_bb_warthog_entrance_1/driver")
    (cs_go_to "pts_bb_wraiths/p1")
    (cs_shoot true "allies_bb_warthog_entrance_1/driver")
)

(script command_script void cs_bb_wraith_2
    (cs_face true "pts_bb_wraiths/face")
    (sleep_until b_vd_warthogs_advance 5)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_shoot true)
    (cs_shoot true "allies_bb_warthog_entrance_0/driver")
    (cs_go_to "pts_bb_wraiths/p2")
    (cs_shoot true "allies_bb_warthog_entrance_0/driver")
)

(script command_script void cs_bb_wraith_3
    (cs_face true "pts_bb_wraiths/face")
    (sleep_until b_vd_warthogs_advance 5)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_shoot true)
    (cs_shoot true "allies_bb_warthog_entrance_0/driver")
    (cs_go_to "pts_bb_wraiths/p3")
    (cs_shoot true "allies_bb_warthog_entrance_0/driver")
)

(script command_script void cs_bb_poor_aiming_0
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_shoot true)
    (cs_abort_on_vehicle_exit true)
    (if 
        (or
            (vehicle_test_seat (ai_vehicle_get ai_current_actor) "warthog_g" ai_current_actor)
            (vehicle_test_seat (ai_vehicle_get ai_current_actor) "mauler_g" ai_current_actor)
        ) 
            (begin
                (sleep_until 
                    (begin
                        (cs_shoot_point true "pts_bb_kill_warthog_0/shoot_at_0")
                        (cs_shoot_point true "pts_bb_kill_warthog_0/shoot_at_1")
                        (cs_shoot_point true "pts_bb_kill_warthog_0/shoot_at_2")
                        (sleep (random_range 150 300))
                        (>= s_bb_progression 20)
                    )
                )
            )
    )
)

(script command_script void cs_bb_poor_aiming_1
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_shoot true)
    (cs_abort_on_vehicle_exit true)
    (if 
        (or
            (vehicle_test_seat (ai_vehicle_get ai_current_actor) "warthog_g" ai_current_actor)
            (vehicle_test_seat (ai_vehicle_get ai_current_actor) "mauler_g" ai_current_actor)
        ) 
            (begin
                (sleep_until 
                    (begin
                        (cs_shoot_point true "pts_bb_kill_warthog_1/shoot_at_0")
                        (cs_shoot_point true "pts_bb_kill_warthog_1/shoot_at_1")
                        (cs_shoot_point true "pts_bb_kill_warthog_1/shoot_at_2")
                        (sleep (random_range 150 300))
                        (>= s_bb_progression 20)
                    )
                )
            )
    )
)

(script command_script void cs_bb_kill_warthog_0
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "pts_bb_kill_warthog_0/p6")
    (unit_kill (ai_vehicle_get_from_starting_location "allies_bb_warthog_entrance_0/driver"))
    (ai_kill "allies_bb_warthog_entrance_0")
)

(script command_script void cs_bb_kill_warthog_1
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "pts_bb_kill_warthog_1/p7")
    (unit_kill (ai_vehicle_get_from_starting_location "allies_bb_warthog_entrance_1/driver"))
    (ai_kill "allies_bb_warthog_entrance_1")
)

(script command_script void cs_bb_phantom_arrive
    (cs_shoot false)
    (ai_set_blind ai_current_actor true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until b_vd_phantom_advance 5)
    (cs_fly_to "pts_bb_front_phantom/p6")
    (cs_fly_to_and_face "pts_bb_front_phantom/drop" "pts_bb_front_phantom/face")
    (sleep 60)
    (vehicle_unload (ai_vehicle_get_from_starting_location "cov_bb_front_phantom/pilot") phantom_lc)
    (sleep 60)
    (set b_bb_wraith_dropped true)
    (cs_vehicle_speed 0.7)
    (cs_face_player true)
    (cs_fly_to "pts_bb_front_phantom/p8")
    (sleep_until (>= s_bb_progression 40))
    (ai_set_blind ai_current_actor false)
)

(script dormant void bb_scarab_over_wall
    (object_create "bb_scarab")
    (sleep 1)
    (set b_bb_scarab_over_head_created true)
    (object_cannot_take_damage "bb_scarab")
    (object_cannot_die "bb_scarab" true)
    (custom_animation "bb_scarab" "objects\giants\scarab\cinematics\vignettes\070vd_scarab_over_wall\070vd_scarab_over_wall" "070vd_scarab_over_wall" false)
    (sleep_until (not (unit_is_playing_custom_animation "bb_scarab")) 1)
    (object_cannot_die "bb_scarab" false)
    (object_can_take_damage "bb_scarab")
    (object_destroy "bb_scarab")
    (sleep_until 
        (or
            (>= s_bb_progression 70)
            (>= (ai_task_count "obj_bb_allies/3rd_floor") 1)
        ) 
    15)
    (ai_place "cov_bb_scarab")
    (sleep 1)
    (object_cannot_take_damage "bb_scarab")
    (object_cannot_die "bb_scarab" true)
    (set obj_bb_scarab (ai_get_object "cov_bb_scarab"))
    (wake md_bb_scarab_radio)
    (sleep 90)
    (wake 070vf_scarab_return)
    (sleep_until (not (unit_is_playing_custom_animation "bb_scarab")) 1 900)
    (object_cannot_die "bb_scarab" false)
    (object_can_take_damage "bb_scarab")
)

(script dormant void 070vd_scarab_over_wall_intro
    (sleep_until (>= (device_get_position "bb_player_door") 0.01) 5)
    (sleep_until 
        (or
            (and
                (volume_test_players "vol_lb_scarab_view")
                (objects_can_see_flag (players) "flg_bb_outside" 20.0)
            )
            (volume_test_players "vol_bb_vd_start")
        ) 
    5)
    (game_save)
    (wake bb_scarab_over_wall)
    (wake md_bb_scarab_intro)
    (sleep_until (>= s_bb_progression 10) 5)
    (wake bb_manage_intro_battle)
    (ai_migrate "lb_guilty_spark" "bb_guilty_spark")
    (sleep_until (>= s_bb_progression 20) 15 60)
    (set b_vd_phantom_advance true)
    (wake bb_manage_intro_warthog)
    (ai_place "cov_bb_canyon_0")
    (ai_place "cov_bb_canyon_1")
)

(script dormant void bb_manage_intro_battle
    (set b_vd_warthogs_advance true)
    (if (<= (ai_in_vehicle_count "allies_bb_warthog_entrance_0") 0) 
        (ai_place "allies_bb_warthog_entrance_0"))
    (if (<= (ai_in_vehicle_count "allies_bb_warthog_entrance_1") 0) 
        (ai_place "allies_bb_warthog_entrance_1"))
    (cs_run_command_script "allies_bb_warthog_entrance_0" cs_bb_poor_aiming_0)
    (cs_run_command_script "allies_bb_warthog_entrance_1" cs_bb_poor_aiming_1)
    (sleep_until (>= s_bb_progression 20) 10 450)
    (cs_run_command_script "allies_bb_warthog_entrance_0" cs_bb_kill_warthog_0)
    (cs_run_command_script "allies_bb_warthog_entrance_1" cs_bb_kill_warthog_1)
)

(script dormant void md_bb_marine_hop_in
    (sleep_until (not (unit_in_vehicle (player0))) 30 300)
    (if 
        (and
            (not (unit_in_vehicle (player0)))
            (volume_test_players "vol_bb_arrival")
        ) 
            (begin
                (sleep 1)
                (vs_set_cleanup_script md_cleanup)
                (md_dialogue_start)
                (if b_debug 
                    (print "mission dialogue:bb:marine:hop:in"))
                (vs_cast "allies_bb_player_warthog" true 10 "070mi_040")
                (set marine (vs_role 1))
                (vs_enable_pathfinding_failsafe "allies_bb_player_warthog" true)
                (vs_enable_looking "allies_bb_player_warthog" true)
                (vs_enable_targeting "allies_bb_player_warthog" true)
                (vs_enable_moving "allies_bb_player_warthog" true)
                (sleep 1)
                (vs_face_player marine true)
                (if b_dialogue 
                    (print "marine: sir! hog's all yours!"))
                (vs_play_line marine true 070mi_040)
                (sleep 10)
                (if b_dialogue 
                    (print "marine: get on the turret, sir! let's clear a path!"))
                (vs_play_line marine true 070mi_050)
                (sleep 10)
                (vs_face_player marine false)
                (vs_release_all)
            )
    )
)

(script command_script void cs_bb_tank_advance_0
    (if (vehicle_test_seat (ai_vehicle_get ai_current_actor) "scorpion_d" ai_current_actor) 
        (begin
            (cs_enable_pathfinding_failsafe true)
            (cs_enable_looking true)
            (cs_enable_targeting true)
            (cs_abort_on_vehicle_exit true)
            (cs_go_to_and_face "pts_bb_scorpions/p0" "pts_bb_scorpions/face")
            (sleep_until (<= (ai_task_count "obj_bb_cov/entrance") 2))
        )
    )
)

(script command_script void cs_bb_tank_advance_1
    (if (vehicle_test_seat (ai_vehicle_get ai_current_actor) "scorpion_d" ai_current_actor) 
        (begin
            (cs_enable_pathfinding_failsafe true)
            (cs_enable_looking true)
            (cs_enable_targeting true)
            (cs_abort_on_vehicle_exit true)
            (cs_go_to_and_face "pts_bb_scorpions/p1" "pts_bb_scorpions/face")
            (sleep_until (<= (ai_task_count "obj_bb_cov/entrance") 2))
        )
    )
)

(script command_script void cs_bb_tank_advance_2
    (if (vehicle_test_seat (ai_vehicle_get ai_current_actor) "scorpion_d" ai_current_actor) 
        (begin
            (cs_enable_pathfinding_failsafe true)
            (cs_enable_looking true)
            (cs_enable_targeting true)
            (cs_abort_on_vehicle_exit true)
            (cs_go_to_and_face "pts_bb_scorpions/p2" "pts_bb_scorpions/face")
            (sleep_until (<= (ai_task_count "obj_bb_cov/entrance") 2))
        )
    )
)

(script dormant void md_bb_marine_advance_0
    (sleep_until (>= s_bb_progression 50) 10)
    (cs_run_command_script "allies_bb_scorpion_0" cs_bb_tank_advance_0)
    (cs_run_command_script "allies_bb_scorpion_1" cs_bb_tank_advance_1)
    (cs_run_command_script "allies_bb_scorpion_2" cs_bb_tank_advance_2)
    (if b_debug 
        (print "mission dialogue:bb:marine:advance"))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "sergeant (radio, over tank): all armor! form up!"))
    (sleep (ai_play_line_on_object none 070mi_080))
    (sleep 15)
    (if b_dialogue 
        (print "sergeant (radio, over tank): hit 'em where it hurts!"))
    (sleep (ai_play_line_on_object none 070mi_090))
    (sleep 10)
    (sleep_until (<= (ai_task_count "obj_bb_cov/entrance") 2))
    (if (script_started "md_bb_marine_advance_1") 
        (sleep_until (script_finished "md_bb_marine_advance_1")))
    (cs_run_command_script "allies_bb_scorpion_0" cs_end)
    (cs_run_command_script "allies_bb_scorpion_1" cs_end)
    (cs_run_command_script "allies_bb_scorpion_2" cs_end)
)

(script dormant void md_bb_marine_advance_1
    (sleep_until (>= (ai_task_count "obj_bb_allies/entrance_vehicle_front") 1))
    (sleep_until (not b_playing_dialogue) 30 150)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if (> (ai_living_count "gr_allies_bb_scorpion") 0) 
        (begin
            (if b_debug 
                (print "mission dialogue:bb:marine:advance"))
            (if b_dialogue 
                (print "marine (radio, over tank): target those wraiths!"))
            (sleep (ai_play_line_on_object none 070mi_100))
        )
    )
)

(script dormant void md_bb_marine_advance_2
    (sleep_until (>= (ai_task_count "obj_bb_allies/2nd_floor") 1))
    (sleep_until (not b_playing_dialogue) 30 150)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (sleep (random_range 30 90))
    (if (> (ai_living_count "gr_allies_bb_scorpion") 0) 
        (begin
            (if b_debug 
                (print "mission dialogue:bb:marine:advance"))
            (if b_dialogue 
                (print "sergeant (radio, over tank): first line clear! move up!"))
            (sleep (ai_play_line_on_object none 070mi_160))
        )
    )
    (if (not b_bb_scarab_battle_begun) 
        (begin
            (set s_070_music_10 (max s_070_music_10 2.0))
        )
    )
)

(script dormant void md_bb_marine_advance_3
    (sleep_until (>= (ai_task_count "obj_bb_allies/3rd_floor") 1))
    (sleep (random_range 30 90))
    (sleep_until (not b_playing_dialogue) 30 300)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if (> (ai_living_count "gr_allies_bb_scorpion") 0) 
        (begin
            (if b_debug 
                (print "mission dialogue:bb:marine:advance"))
            (if b_dialogue 
                (print "sergeant (radio, over tank): second line clear! push forward!"))
            (sleep (ai_play_line_on_object none 070mi_170))
        )
    )
    (set s_070_music_10 (max s_070_music_10 3.0))
)

(script dormant void md_bb_scarab_intro
    (sleep_until (not b_playing_dialogue) 30 150)
    (sleep (random_range 150 180))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "johnson (radio): heads up, marines! you got trouble!"))
    (sleep (ai_play_line_on_object none 070ve_010))
    (set b_070_music_09 false)
)

(script dormant void 070vf_scarab_return
    (sleep_until (not b_playing_dialogue) 30 150)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_debug 
        (print "mission dialogue:bb:070vf_scarab_return"))
    (if b_dialogue 
        (print "marine (radio, over tank): scarab's back!"))
    (sleep (ai_play_line_on_object none 070vf_010))
    (sleep 10)
    (if b_dialogue 
        (print "marine (radio, over tank): this time it means business!"))
    (sleep (ai_play_line_on_object none 070vf_020))
    (sleep 10)
    (if b_dialogue 
        (print "sergeant (radio, over tank): bravo! flank and cover!"))
    (sleep (ai_play_line_on_object none 070vf_040))
    (sleep 10)
    (if b_dialogue 
        (print "sergeant (radio, over tank): everyone support the chief! he'll take it down!"))
    (sleep (ai_play_line_on_object none 070vf_050))
    (sleep 10)
)

(script dormant void md_bb_stop_gs_panic
    (sleep_until 
        (and
            (<= (ai_living_count "cov_bb_scarab") 0)
            bb_scarab_spawned
        )
    )
    (sleep_forever md_bb_gs_panic)
)

(script dormant void md_bb_gs_panic
    (wake md_bb_stop_gs_panic)
    (sleep_until 
        (or
            (<= (objects_distance_to_object (player0) obj_guilty_spark) 10.0)
            (<= (objects_distance_to_object (player1) obj_guilty_spark) 10.0)
            (<= (objects_distance_to_object (player2) obj_guilty_spark) 10.0)
            (<= (objects_distance_to_object (player3) obj_guilty_spark) 10.0)
        ) 
    15 1800)
    (if b_debug 
        (print "mission dialogue:bb:gs:panic:p1"))
    (vs_cast "gr_guilty_spark" true 10 "070mi_230")
    (set guilty_spark (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (vs_enable_moving "gr_guilty_spark" true)
    (sleep 1)
    (vs_approach_player guilty_spark false 2.0 40.0 40.0)
    (sleep_until 
        (or
            (<= (objects_distance_to_object (player0) obj_guilty_spark) 3.0)
            (<= (objects_distance_to_object (player1) obj_guilty_spark) 3.0)
            (<= (objects_distance_to_object (player2) obj_guilty_spark) 3.0)
            (<= (objects_distance_to_object (player3) obj_guilty_spark) 3.0)
        ) 
    15 150)
    (sleep_until (not b_playing_dialogue))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "guilty: this just won't do!"))
    (sleep (ai_play_line_on_object guilty_spark 070mi_230))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: oh, my! oh, my!"))
    (sleep (ai_play_line_on_object guilty_spark 070mi_240))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: you will damage the cartographer!"))
    (sleep (ai_play_line_on_object guilty_spark 070mi_250))
    (sleep 10)
    (vs_release_all)
    (sleep 600)
    (sleep_until 
        (or
            (<= (objects_distance_to_object (player0) obj_guilty_spark) 10.0)
            (<= (objects_distance_to_object (player1) obj_guilty_spark) 10.0)
            (<= (objects_distance_to_object (player2) obj_guilty_spark) 10.0)
            (<= (objects_distance_to_object (player3) obj_guilty_spark) 10.0)
        ) 
    15 1800)
    (if b_debug 
        (print "mission dialogue:bb:gs:panic:p2"))
    (vs_cast "gr_guilty_spark" true 10 "070mi_260")
    (set guilty_spark (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_guilty_spark" true)
    (vs_enable_looking "gr_guilty_spark" true)
    (vs_enable_targeting "gr_guilty_spark" true)
    (vs_enable_moving "gr_guilty_spark" true)
    (sleep 1)
    (vs_approach_player guilty_spark false 2.0 40.0 40.0)
    (sleep_until 
        (or
            (<= (objects_distance_to_object (player0) obj_guilty_spark) 3.0)
            (<= (objects_distance_to_object (player1) obj_guilty_spark) 3.0)
            (<= (objects_distance_to_object (player2) obj_guilty_spark) 3.0)
            (<= (objects_distance_to_object (player3) obj_guilty_spark) 3.0)
        ) 
    15 150)
    (sleep_until (not b_playing_dialogue))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "guilty: meddlers, please! put down your weapons!"))
    (sleep (ai_play_line_on_object guilty_spark 070mi_260))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: this is precisely why you are a tier three species!"))
    (sleep (ai_play_line_on_object guilty_spark 070mi_270))
    (sleep 10)
    (vs_release_all)
)

(script command_script void cs_abb_guilty_spark_wait
    (cs_enable_moving false)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until (volume_test_object "vol_abb_pelican_lz" ai_current_actor) 10)
    (cs_fly_to "pts_abb_gs/p0")
    (cs_fly_to "pts_abb_gs/p1" 0.5)
    (unit_add_equipment (unit obj_guilty_spark) "gs_profile" true false)
    (sleep 1)
    (cs_shoot_point true "pts_abb_gs/shoot_at")
    (sleep_forever)
)

(script dormant void md_abb_gs_tries_to_close_door
    (sleep_until (volume_test_object "vol_abb_storm_in" obj_guilty_spark) 10)
    (ai_set_objective "gr_guilty_spark" "obj_f1_gs")
    (if b_debug 
        (print "mission dialogue:abb:gs:opens:door"))
    (vs_cast "gr_guilty_spark" true 10 "070mg_210")
    (set guilty_spark (vs_role 1))
    (vs_enable_pathfinding_failsafe guilty_spark true)
    (vs_enable_looking guilty_spark false)
    (vs_enable_targeting guilty_spark false)
    (vs_enable_moving guilty_spark false)
    (sleep 1)
    (vs_fly_to guilty_spark true "pts_abb_gs/p1")
    (vs_fly_to guilty_spark true "pts_abb_gs_inside/p4")
    (vs_fly_to guilty_spark true "pts_abb_gs_inside/p5")
    (vs_fly_to guilty_spark false "pts_abb_gs_inside/p0")
    (vs_fly_to guilty_spark false "pts_abb_gs_inside/p1" 0.2)
    (unit_add_equipment (unit obj_guilty_spark) "gs_profile" true false)
    (sleep 1)
    (vs_shoot_point guilty_spark true "pts_abb_gs_inside/shoot_at")
    (if b_dialogue 
        (print "guilty: (hums)"))
    (sleep (ai_play_line_on_object guilty_spark 070mg_210))
    (sleep 10)
    (sleep_forever)
    (vs_release_all)
)

(script dormant void md_bb_stop_scarab_hint
    (sleep_until 
        (and
            (object_model_target_destroyed "bb_scarab" "indirect_engine")
            bb_scarab_spawned
        ) 
    10)
    (sleep_forever md_bb_scarab_hint_interior)
    (sleep_forever md_bb_scarab_hint)
)

(script dormant void md_bb_scarab_hint
    (vs_set_cleanup_script md_cleanup)
    (wake md_bb_stop_scarab_hint)
    (wake md_bb_scarab_hint_interior)
    (sleep (random_range 1200 1800))
    (begin_random
        (begin
            (sleep (random_range 420 600))
            (sleep_until 
                (or
                    (not b_bb_stop_scarab_hint)
                    (not (volume_test_players "vol_bb_scarab"))
                )
            )
            (sleep_until (not b_playing_dialogue) 30 150)
            (md_dialogue_start)
            (if b_dialogue 
                (print "johnson (radio): hit it in the knees, chief!"))
            (sleep (ai_play_line_on_object none 070mi_320))
            (md_dialogue_stop)
        )
        (begin
            (sleep (random_range 420 600))
            (sleep_until 
                (or
                    (not b_bb_stop_scarab_hint)
                    (not (volume_test_players "vol_bb_scarab"))
                )
            )
            (sleep_until (not b_playing_dialogue) 30 150)
            (md_dialogue_start)
            (if b_dialogue 
                (print "johnson (radio): take out its legs! climb onboard!"))
            (sleep (ai_play_line_on_object none 070mi_330))
            (md_dialogue_stop)
        )
        (begin
            (sleep (random_range 420 600))
            (sleep_until 
                (or
                    (not b_bb_stop_scarab_hint)
                    (not (volume_test_players "vol_bb_scarab"))
                )
            )
            (sleep_until (not b_playing_dialogue) 30 150)
            (md_dialogue_start)
            (if b_dialogue 
                (print "johnson (radio): back plating looks vulnerable! light it up!"))
            (sleep (ai_play_line_on_object none 070mi_340))
            (md_dialogue_stop)
        )
    )
    (sleep (random_range 1200 1800))
    (begin_random
        (begin
            (sleep (random_range 420 600))
            (sleep_until 
                (or
                    (not b_bb_stop_scarab_hint)
                    (not (volume_test_players "vol_bb_scarab"))
                )
            )
            (sleep_until (not b_playing_dialogue) 30 150)
            (md_dialogue_start)
            (if b_dialogue 
                (print "sergeant (radio, over tank): hit it in the knees, chief!"))
            (sleep (ai_play_line_on_object none 070mi_280))
            (md_dialogue_stop)
        )
        (begin
            (sleep (random_range 420 600))
            (sleep_until 
                (or
                    (not b_bb_stop_scarab_hint)
                    (not (volume_test_players "vol_bb_scarab"))
                )
            )
            (sleep_until (not b_playing_dialogue) 30 150)
            (md_dialogue_start)
            (if b_dialogue 
                (print "sergeant (radio, over tank): take out its legs! climb onboard!"))
            (sleep (ai_play_line_on_object none 070mi_290))
            (md_dialogue_stop)
        )
        (begin
            (sleep (random_range 420 600))
            (sleep_until 
                (or
                    (not b_bb_stop_scarab_hint)
                    (not (volume_test_players "vol_bb_scarab"))
                )
            )
            (sleep_until (not b_playing_dialogue) 30 150)
            (md_dialogue_start)
            (if b_dialogue 
                (print "sergeant (radio, over tank): back plating looks vulnerable! light it up!"))
            (sleep (ai_play_line_on_object none 070mi_300))
            (md_dialogue_stop)
        )
    )
)

(script dormant void md_bb_scarab_hint_interior
    (sleep_until (volume_test_players "vol_bb_scarab"))
    (set b_bb_stop_scarab_hint true)
    (sleep (random_range 90 150))
    (if b_dialogue 
        (print "johnson (radio): find that power-core, chief!"))
    (sleep (ai_play_line_on_object none 070mi_350))
    (sleep (random_range 300 600))
    (set b_bb_stop_scarab_hint false)
)

(script dormant void md_bb_scarab_radio
    (object_create "bb_truth_radio_0")
    (object_create "bb_truth_radio_1")
    (objects_attach (ai_get_object "cov_bb_scarab/scarab") "control_panel04" "bb_truth_radio_0" "")
    (objects_attach (ai_get_object "cov_bb_scarab/scarab") "control_panel02" "bb_truth_radio_1" "")
    (sleep_until 
        (or
            (volume_test_players "vol_bb_scarab_bottom")
            (object_model_target_destroyed "bb_scarab" "indirect_engine")
        )
    )
    (sleep_until (not b_playing_dialogue) 30 300)
    (sleep (random_range 90 150))
    (if (not (object_model_target_destroyed "bb_scarab" "indirect_engine")) 
        (begin
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_dialogue 
                (print "truth: i opened the portal to this hallowed place -- this shelter from halo’s fire -- in the hopes that more of our covenant would follow."))
            (sleep (ai_play_line_on_object "bb_truth_radio_0" 070mq_010))
            (sleep 15)
            (if b_dialogue 
                (print "truth: alas, save for a rabble of heretics and their demon allies, we are all that made the passage."))
            (sleep (ai_play_line_on_object "bb_truth_radio_0" 070mq_020))
            (sleep 10)
            (if b_dialogue 
                (print "truth: and thus we must temper joy with sorrow -- keep in our hearts those left behind."))
            (sleep (ai_play_line_on_object "bb_truth_radio_0" 070mq_030))
            (sleep 60)
        )
    )
    (object_destroy "bb_truth_radio_0")
    (object_destroy "bb_truth_radio_1")
)

(script dormant void md_abb_scarab_dead
    (sleep_until 
        (and
            (<= (ai_living_count "cov_bb_scarab") 0)
            bb_scarab_spawned
            (<= (ai_living_count "gr_cov_bb_ghosts") 0)
        )
    )
    (sleep (random_range 30 90))
    (if b_debug 
        (print "mission dialogue:abb:marine:next:01"))
    (vs_cast "gr_allies_bb" false 10 "070mi_360" "070mi_370")
    (set marine_01 (vs_role 1))
    (set marine_02 (vs_role 2))
    (vs_enable_pathfinding_failsafe "gr_allies_bb" true)
    (vs_enable_looking "gr_allies_bb" true)
    (vs_enable_targeting "gr_allies_bb" true)
    (vs_enable_moving "gr_allies_bb" true)
    (sleep 1)
    (ai_vehicle_exit "gr_allies_bb")
    (bb_reserve_all_vehicles true)
    (vs_enable_moving "gr_allies_bb" false)
    (sleep 60)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (vs_face_object "gr_allies_bb" true obj_bb_scarab)
    (sleep 300)
    (bb_reserve_all_vehicles false)
    (sleep 30)
    (vs_face_object "gr_allies_bb" false "cov_bb_scarab")
    (vs_enable_moving "gr_allies_bb" true)
    (ai_set_objective "gr_allies_bb" "obj_abb_allies")
    (vs_release_all)
    (ai_enter_squad_vehicles "gr_allies_bb")
    (sleep 150)
    (sleep_until 
        (begin
            (cs_run_command_script "gr_allies_bb" cs_abb_exit_vehicle)
            b_f1_has_started
        ) 
    120)
)

(script command_script void cs_abb_exit_vehicle
    (if (unit_in_vehicle ai_current_actor) 
        (begin
            (cs_shoot true)
            (cs_enable_targeting true)
            (cs_enable_looking true)
            (cs_enable_moving true)
            (sleep_until (volume_test_object "vol_bb_base_entrance" ai_current_actor) 10)
            (sleep 30)
            (if (not (player_in_vehicle (ai_vehicle_get ai_current_actor))) 
                (begin
                    (ai_vehicle_reserve (ai_vehicle_get ai_current_actor) true)
                    (ai_vehicle_exit ai_current_actor)
                )
            )
        )
    )
)

(script dormant void 070_shipmaster_arrives
    (object_create_anew "abb_capital_ship")
    (object_cinematic_visibility "abb_capital_ship" true)
    (object_set_always_active "abb_capital_ship" true)
    (scenery_animation_start "abb_capital_ship" "objects\vehicles\cov_capital_ship\cinematics\vignette\070_shipmaster_arrives\070_shipmaster_arrives" "070_shipmaster_arrives")
    (sleep (scenery_get_animation_time "abb_capital_ship"))
    (scenery_animation_start_loop "abb_capital_ship" "objects\vehicles\cov_capital_ship\cinematics\vignette\070_shipmaster_arrives\070_shipmaster_arrives" "070_shipmaster_idle")
)

(script dormant void md_abb_shipmaster_reward
    (sleep_until 
        (and
            (<= (ai_living_count "cov_bb_scarab") 0)
            bb_scarab_spawned
            (or
                (<= (ai_living_count "gr_cov_bb_ghosts") 0)
                (>= s_abb_progression 10)
            )
        )
    )
    (sleep (random_range 60 120))
    (wake 070_shipmaster_arrives)
    (sleep (random_range 150 180))
    (if (< s_abb_progression 10) 
        (begin
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_debug 
                (print "mission dialogue:abb:jon:bring:arb"))
            (if b_dialogue 
                (print "shipmaster (radio): not bad, spartan. i saw that explosion from orbit"))
            (sleep (ai_play_line_on_object none 070mi_430))
            (sleep 30)
            (if b_dialogue 
                (print "shipmaster (radio): truth's fleet lies in ruin!"))
            (sleep (ai_play_line_on_object none 070mi_440))
            (sleep 10)
            (if b_dialogue 
                (print "shipmaster (radio): find where the liar hides"))
            (sleep (ai_play_line_on_object none 070mi_450))
            (sleep 10)
            (if b_dialogue 
                (print "shipmaster (radio): so i may place my boot between his gums!"))
            (sleep (ai_play_line_on_object none 070mi_460))
            (sleep 10)
            (if b_dialogue 
                (print "miranda (radio): we'll know soon enough, shipmaster."))
            (sleep (ai_play_line_on_object none 070mi_470))
            (sleep 90)
            (if b_dialogue 
                (print "johnson (radio): infantry on the spire!"))
            (sleep (ai_play_line_on_object none 070mi_410))
            (sleep 10)
            (sleep 30)
            (if b_dialogue 
                (print "johnson (radio): mop 'em up!"))
            (sleep (ai_play_line_on_object none 070mi_420))
            (sleep 10)
            (md_dialogue_stop)
        )
    )
    (set b_bb_shipmaster_dialog_finished true)
    (sleep_until (>= s_bb_progression 90) 30 900)
    (sleep_until (>= s_abb_progression 10) 30 1800)
    (if 
        (and
            (< s_abb_progression 10)
            (not (game_is_cooperative))
        ) 
            (begin
                (md_dialogue_start)
                (if b_dialogue 
                    (print "johnson (radio): meet the arbiter at the top of the spire, chief!"))
                (sleep (ai_play_line_on_object none 070mi_490))
                (md_dialogue_stop)
            )
    )
    (sleep_until (>= s_abb_progression 10) 30 1800)
    (if (< s_abb_progression 10) 
        (begin
            (md_dialogue_start)
            (if b_dialogue 
                (print "johnson (radio): chief! spark's found an entrance up top! follow him inside!"))
            (sleep (ai_play_line_on_object none 070mi_500))
            (md_dialogue_stop)
            (hud_activate_team_nav_point_flag player "flg_shaft_door" 0.0)
            (sleep_until (>= (device_get_position "shaft_door") 0.5) 5)
            (hud_deactivate_team_nav_point_flag player "flg_shaft_door")
        )
    )
)

(script command_script void cs_abb_pelican_arrives
    (cs_fly_to "pts_abb_pelican/p0")
    (cs_fly_to "pts_abb_pelican/p1")
    (cs_fly_to "pts_abb_pelican/p2")
    (unit_open (ai_vehicle_get ai_current_actor))
    (cs_fly_to "pts_abb_pelican/p3")
    (cs_vehicle_speed 0.7)
    (cs_fly_to_and_face "pts_abb_pelican/hover_cache" "pts_abb_pelican/p4")
    (sleep_until 
        (or
            b_bb_shipmaster_dialog_finished
            (volume_test_players "vol_abb_halfway_ramp")
        )
    )
    (sleep_until (volume_test_players "vol_abb_halfway_ramp") 30 90)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_abb_cov/defend_base") 2)
            (volume_test_players "vol_abb_halfway_ramp")
        )
    )
    (cs_fly_to "pts_abb_pelican/p4")
    (cs_vehicle_speed 0.4)
    (cs_fly_to_and_face "pts_abb_pelican/p5" "pts_abb_pelican/face")
    (cs_fly_to_and_face "pts_abb_pelican/p6" "pts_abb_pelican/face" 1.0)
    (set b_abb_pelican_arrived true)
    (sleep_forever)
)

(script command_script void cs_abb_pelican_exits
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "pts_abb_pelican/p5" "pts_abb_pelican/p4")
    (cs_fly_to "pts_abb_pelican/p4")
    (cs_fly_to "pts_abb_pelican/p8")
    (kill_players_in_volume "vol_abb_kill_players")
    (cs_fly_to "pts_abb_pelican/p9")
    (cs_fly_to "pts_abb_pelican/p10")
    (ai_kill ai_current_actor)
)

(script command_script void cs_abb_arbiter_greeting
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_enable_pathfinding_failsafe true)
    (sleep_until (>= s_abb_progression 10) 5)
    (if 
        (and
            (not (volume_test_players "vol_f1_start"))
            (<= (objects_distance_to_object (players) ai_current_actor) 8.0)
        ) 
            (begin
                (cs_approach_player 2.5 10.0 10.0)
                (sleep (ai_play_line_at_player ai_current_actor 070mq_050))
            )
    )
)

(script dormant void md_abb_jon_bring_arb
    (sleep_until b_abb_pelican_arrived)
    (vehicle_unload (ai_vehicle_get_from_starting_location "allies_abb_pelican/pilot") pelican_p_r03)
    (vehicle_unload (ai_vehicle_get_from_starting_location "allies_abb_pelican/pilot") pelican_p_r04)
    (vehicle_unload (ai_vehicle_get_from_starting_location "allies_abb_pelican/pilot") pelican_p_r05)
    (if (not (game_is_cooperative)) 
        (cs_run_command_script "gr_arbiter" cs_abb_arbiter_greeting))
    (sleep_until (volume_test_players "vol_abb_storm_in") 15)
    (set b_abb_pelican_marines_moving true)
    (sleep_until (>= (device_get_power "shaft_door") 0.5) 5)
    (ai_set_objective "gr_arbiter" "obj_f1_allies")
    (ai_set_objective "gr_abb_pelican_marines" "obj_f1_allies")
    (sleep 150)
    (cs_run_command_script "allies_abb_pelican/pilot" cs_abb_pelican_exits)
)

(script dormant void vd_stop_343_door_shocker
    (sleep_until 
        (or
            (script_finished "vd_343_door_shocker")
            b_f1_ambiant_finished
        )
    )
    (if (not b_f1_ambiant_finished) 
        (begin
            (vs_cast "gr_guilty_spark" true 20 "")
            (set guilty_spark (vs_role 1))
            (vs_fly_to guilty_spark false "pts_f1_waiting/p9")
            (unit_add_equipment (unit obj_guilty_spark) "gs_profile" true false)
            (sleep 1)
            (vs_shoot_point guilty_spark true "pts_f1_waiting/shoot_at")
            (sleep 120)
            (vs_shoot_point guilty_spark false "pts_f1_waiting/shoot_at")
            (set b_f1_ambiant_finished true)
            (vs_release_all)
        )
    )
    (unit_add_equipment (unit obj_guilty_spark) "no_weapon_profile" true false)
)

(script dormant void vd_343_door_shocker
    (wake vd_stop_343_door_shocker)
    (if b_debug 
        (print "vd:343:door:shocker"))
    (vs_cast ai_abb_pelican_marines_0 true 20 "070vg_010")
    (set marine_01 (vs_role 1))
    (vs_cast ai_abb_pelican_marines_1 false 20 "")
    (set marine_02 (vs_role 1))
    (vs_cast "gr_guilty_spark" true 20 "070vg_020")
    (set guilty_spark (vs_role 1))
    (vs_cast "gr_arbiter" false 20 "070vg_050")
    (set arbiter (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" false)
    (vs_enable_targeting "gr_allies" false)
    (vs_enable_moving "gr_allies" false)
    (vs_enable_pathfinding_failsafe guilty_spark true)
    (vs_enable_looking guilty_spark false)
    (vs_enable_targeting guilty_spark false)
    (vs_enable_moving guilty_spark true)
    (sleep 1)
    (vs_face arbiter true "pts_f1_waiting/face_door")
    (vs_go_to_and_face marine_01 false "pts_f1_waiting/p1" "pts_f1_waiting/face_door")
    (vs_face marine_02 true "pts_f1_waiting/face_door")
    (vs_fly_to guilty_spark false "pts_f1_waiting/p9")
    (unit_add_equipment (unit obj_guilty_spark) "gs_profile" true false)
    (sleep 1)
    (vs_shoot_point guilty_spark true "pts_f1_waiting/shoot_at")
    (sleep_until (not (unit_is_playing_custom_animation marine_02)) 15 60)
    (vs_stop_custom_animation marine_02)
    (if b_dialogue 
        (print "marine: hey! what gives!"))
    (vs_play_line marine_01 true 070vg_010)
    (set b_f1_allies_wait true)
    (vs_shoot_point guilty_spark false "pts_f1_waiting/shoot_at")
    (vs_go_to_and_face marine_01 false "pts_f1_waiting/p7" "pts_f1_waiting/p3")
    (vs_go_to_and_face marine_02 false "pts_f1_waiting/p2" "pts_f1_waiting/p3")
    (vs_face_object "gr_allies" true (ai_get_object guilty_spark))
    (sleep 10)
    (vs_face_object guilty_spark true (ai_get_object marine_01))
    (if b_dialogue 
        (print "guilty: it seems i've crossed a circuit."))
    (sleep (ai_play_line_on_object guilty_spark 070vg_020))
    (sleep 10)
    (vs_draw marine_01)
    (if b_dialogue 
        (print "marine: well, let me have a look."))
    (vs_play_line marine_01 false 070vg_030)
    (sleep 10)
    (vs_go_to marine_01 false "pts_f1_waiting/p8")
    (sleep_until (<= (objects_distance_to_object (ai_actors marine_01) guilty_spark) 1.5) 10 150)
    (if (<= (objects_distance_to_object (ai_actors marine_01) (unit guilty_spark)) 2.0) 
        (begin
            (vs_shoot guilty_spark true marine_01)
            (sleep 20)
            (if b_dialogue 
                (print "marine: (yelp)"))
            (vs_play_line marine_01 false 070vg_040)
            (vs_stow marine_01)
            (sleep 1)
            (vs_custom_animation marine_01 true "objects\characters\marine\marine" "combat:rifle:stunned_back" false)
            (vs_stop_custom_animation marine_01)
            (vs_shoot guilty_spark false marine_01)
            (sound_impulse_stop "sound\characters\sentinel\sent_laser_impact")
            (sleep 30)
            (vs_stop_custom_animation marine_01)
            (vs_face_object "gr_allies" true (ai_get_object guilty_spark))
            (if (not (game_is_cooperative)) 
                (begin
                    (vs_go_to_and_face arbiter false "pts_f1_waiting/p11" "pts_f1_waiting/p10")
                    (if b_dialogue 
                        (print "arbiter: oracle!"))
                    (vs_play_line arbiter true 070vg_050)
                    (sleep 10)
                )
            )
            (vs_go_to_and_face marine_02 false "pts_f1_waiting/p12" "pts_f1_waiting/p10")
            (if b_dialogue 
                (print "marine: little bastard stung me!"))
            (vs_play_line marine_01 true 070vg_060)
            (sleep 10)
            (if b_dialogue 
                (print "guilty: i did not want you to come to any harm."))
            (sleep (ai_play_line_on_object guilty_spark 070vg_080))
            (sleep 10)
            (vs_shoot_point guilty_spark true "pts_f1_waiting/shoot_at")
            (if b_dialogue 
                (print "marine: got a funny way of showing it..."))
            (vs_play_line marine_01 true 070vg_090)
            (sleep 90)
            (vs_shoot_point guilty_spark false "pts_f1_waiting/shoot_at")
        )
    )
    (unit_add_equipment (unit obj_guilty_spark) "no_weapon_profile" true false)
    (vs_release_all)
    (set b_f1_ambiant_finished true)
)

(script dormant void f1_stop_sleeping_grunts
    (sleep_until 
        (or
            (> (ai_combat_status "cov_f1_grt_pack") 2)
            (<= (ai_living_count "cov_f1_grt_pack") 0)
        )
    )
    (sleep_forever md_f1_sleeping_grunts)
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (cs_run_command_script "gr_allies" cs_end)
)

(script dormant void md_f1_sleeping_grunts
    (if b_debug 
        (print "mission dialogue:f1:sleeping:grunts"))
    (wake f1_stop_sleeping_grunts)
    (vs_cast "gr_allies" false 10 "070ml_010" "070ml_030" "")
    (set arbiter (vs_role 1))
    (set marine_01 (vs_role 2))
    (set marine_02 (vs_role 3))
    (vs_cast "gr_guilty_spark" false 20 "070mh_080")
    (set guilty_spark (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe "gr_allies" true)
    (vs_enable_looking "gr_allies" true)
    (vs_enable_targeting "gr_allies" false)
    (vs_enable_moving "gr_allies" false)
    (vs_shoot "gr_allies" false)
    (sleep 1)
    (if b_dialogue 
        (print "guilty: excellent! this way!"))
    (sleep (ai_play_line_on_object guilty_spark 070mh_080))
    (sleep 10)
    (vs_enable_moving "gr_guilty_spark" true)
    (vs_draw marine_01)
    (sleep 6)
    (vs_draw marine_02)
    (sleep 8)
    (vs_draw arbiter)
    (set b_f1_gs_advance true)
    (sleep 90)
    (if (not (game_is_cooperative)) 
        (begin
            (if b_dialogue 
                (print "arbiter (whisper): slothful runts"))
            (vs_play_line arbiter true 070ml_010)
            (sleep 10)
            (if b_dialogue 
                (print "arbiter (whisper): kill them as they sleep."))
            (vs_play_line arbiter true 070ml_020)
            (sleep 10)
        ) (begin
            (if b_dialogue 
                (print "marine (whisper): we got sleepers!"))
            (vs_play_line marine_01 true 070ml_030)
        )
    )
    (vs_crouch "gr_allies" true 2.0)
    (sleep 30)
    (if b_dialogue 
        (print "marine (whisper): chief! tap 'em out!"))
    (vs_play_line marine_01 true 070ml_040)
    (sleep 7)
    (vs_enable_moving "gr_allies" true)
    (vs_release_all)
)

(script dormant void md_f1_after_f1
    (sleep_until 
        (or
            b_f1_combat_finished
            (>= s_f1_progression 30)
        )
    )
    (set s_gs_walkup_dist 3)
    (set s_gs_talking_dist 4)
    (if b_dialogue 
        (print "guilty: the cartographer is a few floors down!"))
    (set g_gs_1st_line 070mj_090)
    (if b_dialogue 
        (print "guilty: come, reclaimer! all you seek is close at hand!"))
    (set g_gs_2nd_line 070mj_100)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
    (sleep_until b_f2_has_started 30 3600)
    (if (not b_f2_has_started) 
        (begin
            (sleep_until (not b_playing_dialogue))
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_debug 
                (print "mission dialogue:f1:jon:next"))
            (if b_dialogue 
                (print "johnson (radio): keep going, chief! meet you further down the spire!"))
            (sleep (ai_play_line_on_object none 070mj_050))
            (sleep 10)
            (if b_dialogue 
                (print "johnson (radio): commander rounded up some air-support"))
            (sleep (ai_play_line_on_object none 070mj_060))
            (sleep 10)
            (if b_dialogue 
                (print "johnson (radio): they'll stop any hostile reinforcements"))
            (sleep (ai_play_line_on_object none 070mj_070))
            (sleep 10)
            (if b_dialogue 
                (print "johnson (radio): but the brutes already inside? they're all yours!"))
            (sleep (ai_play_line_on_object none 070mj_080))
            (md_dialogue_stop)
            (hud_activate_team_nav_point_flag player "flg_f1_next" 0.0)
            (sleep_until b_f2_has_started)
            (hud_deactivate_team_nav_point_flag player "flg_f1_next")
        )
    )
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (set b_gs_follow_player false)
)

(script dormant void f2_intro_stop_dialogs
    (ai_dialogue_enable false)
    (sleep_until 
        (or
            (>= (ai_combat_status "gr_cov_f2") 2)
            (<= (ai_living_count "gr_cov_f2") 0)
            (>= s_f3_p1_progression 10)
        )
    )
    (ai_dialogue_enable true)
    (set b_f2_combat_started true)
)

(script command_script void cs_070vh_access_denied
    (cs_enable_moving true)
    (sleep_until (volume_test_object "vol_f2_near_terminal" obj_guilty_spark) 30 1800)
    (if (volume_test_object "vol_f2_near_terminal" obj_guilty_spark) 
        (begin
            (sleep 300)
            (if b_dialogue 
                (print "guilty: sincere apology. but how did you survive?"))
            (cs_play_line 070vh_020)
            (sleep 10)
            (if b_dialogue 
                (print "guilty: the archive is intact?! then our makers’ plan --"))
            (cs_play_line 070vh_030)
            (sleep 10)
            (if b_dialogue 
                (print "guilty: a what?"))
            (cs_play_line 070vh_040)
            (sleep 10)
            (if b_dialogue 
                (print "guilty: a foundry? for what purpose?"))
            (cs_play_line 070vh_050)
            (sleep 10)
        )
    )
    (set b_f2_gs_terminal false)
)

(script dormant void md_f2_gs_next
    (sleep_until 
        (or
            (not b_f2_gs_terminal)
            (volume_test_players "vol_f2_terminal")
            (<= (ai_living_count "gr_cov_f2") 1)
            (>= s_f2_progression 60)
        )
    )
    (if b_debug 
        (print "mission dialogue:f2:gs:next"))
    (set s_gs_walkup_dist 3)
    (set s_gs_talking_dist 4)
    (if b_dialogue 
        (print "guilty: reclaimer? continue downward!"))
    (set g_gs_1st_line 070mk_070)
    (if b_dialogue 
        (print "guilty: your goal is just below!"))
    (set g_gs_2nd_line 070mk_080)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
    (sleep_until b_f3_has_started 30 3600)
    (if (not b_f3_has_started) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_f2_next" 0.0)
            (sleep_until b_f3_has_started)
            (hud_deactivate_team_nav_point_flag player "flg_f2_next")
        )
    )
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (set b_gs_follow_player false)
)

(script dormant void md_f3_gs_hit_switch
    (sleep_until 
        (and
            (>= s_f3_p1_progression 40)
            (volume_test_object "vol_f3_outside" obj_guilty_spark)
            (not (volume_test_object "vol_f3_outside" "gr_cov_f3"))
        )
    )
    (sleep (random_range 60 120))
    (if b_debug 
        (print "mission dialogue:f3:gs:hit:switch"))
    (vs_cast "gr_guilty_spark" true 20 "070ml_050")
    (set guilty_spark (vs_role 1))
    (vs_cast "gr_arbiter" false 10 "")
    (set arbiter (vs_role 1))
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (vs_enable_pathfinding_failsafe arbiter true)
    (vs_enable_looking arbiter true)
    (vs_enable_targeting arbiter true)
    (vs_enable_moving arbiter true)
    (vs_enable_pathfinding_failsafe guilty_spark true)
    (vs_enable_looking guilty_spark true)
    (vs_enable_targeting guilty_spark true)
    (vs_enable_moving guilty_spark true)
    (sleep 1)
    (if (<= (ai_living_count "obj_f3_cov_p1") 0) 
        (begin
            (vs_enable_moving arbiter false)
            (vs_go_to_and_face arbiter false "pts_f3_arbiter/guide" "pts_f3_arbiter/face_at")
        )
    )
    (if b_dialogue 
        (print "guilty: the cartographer!"))
    (sleep (ai_play_line_on_object guilty_spark 070ml_050))
    (sleep 10)
    (if b_dialogue 
        (print "guilty: come! it awaits your approval!"))
    (sleep (ai_play_line_on_object guilty_spark 070ml_060))
    (vs_release guilty_spark)
    (set s_gs_walkup_dist 4)
    (set s_gs_talking_dist 6)
    (set g_gs_1st_line 070ml_080)
    (if b_dialogue 
        (print "guilty: you must activate the cartographer, reclaimer."))
    (set g_gs_2nd_line 070ml_080)
    (cs_run_command_script "f3_p1_guilty_spark" cs_guilty_spark_lead_player)
    (sleep_until 
        (or
            (< (device_get_position "070lc_start") 0.95)
            b_f3_p2_started
        )
    )
)

(script dormant void f3_shutdown_halogram
    (sleep 90)
    (device_operates_automatically_set "f3_cartographer_device" false)
    (device_set_position "f3_cartographer_device" 0.0)
)

(script dormant void f3_070lc_start
    (sleep_until 
        (and
            (= (current_zone_set_fully_active) 10)
            (>= s_f3_p1_progression 40)
        )
    )
    (sleep_until (< (device_get_position "070lc_start") 0.95) 1 3600)
    (if (>= (device_get_position "070lc_start") 0.95) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_f3_switch" 0.0)
            (sleep_until (< (device_get_position "070lc_start") 0.95) 1)
            (hud_deactivate_team_nav_point_flag player "flg_f3_switch")
        )
    )
    (set b_070_music_12 false)
    (sleep_forever md_f3_gs_hit_switch)
    (sleep_forever md_f3_gs_secret_dialog)
    (set s_f3_marine_count (ai_living_count "gr_marines"))
    (ai_erase "allies_f3_arbiter_follow")
    (ai_erase "gr_guilty_spark")
    (wake f3_shutdown_halogram)
    (if b_debug 
        (print "070lc_waypoint_reveal"))
    (cinematic_fade_to_black)
    (object_hide "gr_guilty_spark" true)
    (object_hide "gr_arbiter" true)
    (object_hide "allies_f3_p1_mar_0" true)
    (object_hide "allies_f3_p1_mar_1" true)
    (if b_cinematic 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (data_mine_set_mission_segment "070_lc_waypoint_reveal")
                    (070lc_waypoint_reveal)
                )
            )
            (cinematic_skip_stop)
            (070lc_waypoint_reveal_cleanup)
        )
    )
    (cinematic_stop)
    (camera_control false)
    (object_hide "gr_guilty_spark" false)
    (object_hide "gr_arbiter" false)
    (object_hide "allies_f3_p1_mar_0" false)
    (object_hide "allies_f3_p1_mar_1" false)
    (object_teleport (player0) "flg_f3_after_070lc_0")
    (object_teleport (player1) "flg_f3_after_070lc_1")
    (object_teleport (player2) "flg_f3_after_070lc_2")
    (object_teleport (player3) "flg_f3_after_070lc_3")
    (wake f3_070lc_after)
)

(script dormant void md_f3_arb_boards_banshee
    (if b_debug 
        (print "mission dialogue:f3:arb:boards:banshee"))
    (vs_cast "gr_arbiter" false 10 "070ml_110")
    (set arbiter (vs_role 1))
    (vs_enable_looking arbiter true)
    (sleep 1)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "johnson (radio): chief! you got a whole mess of hostile air inbound!"))
    (ai_play_line_on_object none 070ml_090)
    (ai_magically_see arbiter "cov_f3_banshee_0")
    (vs_shoot arbiter true (ai_get_object "cov_f3_phantom"))
    (vs_go_to arbiter true "pts_f3_arbiter/p0")
    (sleep 45)
    (if b_dialogue 
        (print "johnson (radio): get back inside while we take 'em out!"))
    (ai_play_line_on_object none 070ml_100)
    (vs_go_to arbiter true "pts_f3_arbiter/p1")
    (sleep 45)
    (if b_dialogue 
        (print "arbiter (radio): follow the oracle, spartan!"))
    (ai_play_line_on_object none 070ml_110)
    (vs_shoot arbiter true (ai_get_object "cov_f3_banshee_0"))
    (vs_go_to arbiter true "pts_f3_arbiter/p2")
    (sleep 40)
    (cs_run_command_script (ai_get_turret_ai "cov_f3_phantom" 0) cs_do_nothing)
    (cs_run_command_script "cov_f3_phantom/grunt_0" cs_do_nothing)
    (cs_run_command_script "cov_f3_phantom/grunt_1" cs_do_nothing)
    (vs_jump arbiter false 85.0 2.0)
    (sleep 20)
    (if b_dialogue 
        (print "arbiter (radio): i will help your sergeant clear the skies!"))
    (ai_play_line_on_object none 070ml_120)
    (md_dialogue_stop)
    (unit_enter_vehicle (ai_get_unit arbiter) (ai_vehicle_get_from_starting_location "cov_f3_banshee_0/pilot") "banshee_b_d")
    (sleep 45)
    (unit_board_vehicle (ai_get_unit arbiter) "banshee_b_d")
    (ai_cannot_die "cov_f3_banshee_0" false)
    (ai_kill "cov_f3_banshee_0")
    (chud_show_arbiter_ai_navpoint false)
    (if (unit_in_vehicle arbiter) 
        (begin
            (vs_enable_pathfinding_failsafe arbiter true)
            (vs_fly_to arbiter true "pts_f3_arbiter/p3")
            (set b_f3_p2_gs_guide true)
            (vs_shoot arbiter true)
            (vs_enable_targeting arbiter true)
            (vs_cast "cov_f3_phantom/pilot" true 10 "")
            (set phantom (vs_role 1))
            (vs_vehicle_speed phantom 0.3)
            (vs_fly_to_and_face phantom false "pts_f3_phantom/p2" "pts_f3_phantom/face_0" 1.0)
            (vs_enable_pathfinding_failsafe phantom true)
            (vs_enable_looking phantom true)
            (vs_vehicle_speed phantom 0.8)
            (vs_vehicle_speed arbiter 0.5)
            (vs_shoot arbiter true (ai_get_object "cov_f3_phantom"))
            (vs_fly_to arbiter false "pts_f3_banshee/p6")
            (sleep 60)
            (vs_fly_to phantom true "pts_f3_phantom/p3" 1.0)
            (kill_players_in_volume "vol_f3_kill_players")
            (vs_face phantom true "pts_f3_phantom/p4")
            (if (<= s_f3_p2_progression 20) 
                (begin
                    (set s_gs_walkup_dist 4)
                    (set s_gs_talking_dist 6)
                    (set g_gs_1st_line 070ml_250)
                    (set g_gs_2nd_line 070ml_260)
                    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
                )
            )
            (vs_vehicle_speed phantom 0.8)
            (vs_vehicle_speed arbiter 1.0)
            (vs_fly_to arbiter false "pts_f3_banshee/p4")
            (vs_fly_to phantom false "pts_f3_phantom/p4" 1.0)
            (sleep_until 
                (and
                    (not (vs_running_atom_movement arbiter))
                    (not (vs_running_atom_movement phantom))
                ) 
            10 900)
            (vs_fly_to arbiter false "pts_f3_banshee/p5")
            (vs_fly_to phantom false "pts_f3_phantom/p5" 1.0)
            (sleep_until 
                (and
                    (not (vs_running_atom_movement arbiter))
                    (not (vs_running_atom_movement phantom))
                ) 
            30 1800)
            (ai_erase "cov_f3_banshee_0")
            (ai_erase "allies_f3_arbiter")
            (ai_erase "cov_f3_phantom")
        ) (begin
            (vs_shoot arbiter false (ai_get_object "cov_f3_banshee_0"))
            (unit_set_active_camo arbiter true 5.0)
            (chud_show_arbiter_ai_navpoint false)
            (sleep 150)
            (ai_erase "allies_f3_arbiter")
            (set b_f3_p2_gs_guide true)
            (vs_cast "cov_f3_phantom/pilot" true 10 "")
            (set phantom (vs_role 1))
            (vs_vehicle_speed phantom 0.3)
            (vs_fly_to_and_face phantom false "pts_f3_phantom/p2" "pts_f3_phantom/face_0" 1.0)
            (vs_enable_pathfinding_failsafe phantom true)
            (vs_enable_looking phantom true)
            (vs_vehicle_speed phantom 0.8)
            (sleep 60)
            (vs_fly_to phantom true "pts_f3_phantom/p3" 1.0)
            (kill_players_in_volume "vol_f3_kill_players")
            (vs_face phantom true "pts_f3_phantom/p4")
            (if (<= s_f3_p2_progression 20) 
                (begin
                    (set s_gs_walkup_dist 4)
                    (set s_gs_talking_dist 6)
                    (set g_gs_1st_line 070ml_250)
                    (set g_gs_2nd_line 070ml_260)
                    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
                )
            )
            (vs_vehicle_speed phantom 0.8)
            (vs_fly_to phantom false "pts_f3_phantom/p4" 1.0)
            (sleep_until (not (vs_running_atom_movement phantom)) 10 900)
            (vs_fly_to phantom false "pts_f3_phantom/p5" 1.0)
            (sleep_until (not (vs_running_atom_movement phantom)) 30 1800)
            (ai_erase "cov_f3_banshee_0")
            (ai_erase "cov_f3_phantom")
        )
    )
    (vs_release_all)
)

(script dormant void md_f3_marines_ambushed
    (if b_debug 
        (print "mission dialogue:f3:marines:ambushed"))
    (vs_cast "allies_f3_marine" true 10 "070mx_040")
    (set marine_01 (vs_role 1))
    (vs_enable_looking marine_01 false)
    (vs_enable_targeting marine_01 false)
    (vs_enable_moving marine_01 false)
    (sleep_until 
        (or
            (>= s_f3_p2_progression 10)
            b_f3_p2_take_combat_outside
        ) 
    30 900)
    (vs_enable_pathfinding_failsafe marine_01 true)
    (vs_enable_looking marine_01 true)
    (vs_enable_targeting marine_01 false)
    (vs_enable_moving marine_01 true)
    (sleep 150)
    (sleep_until (not b_playing_dialogue) 30 300)
    (sleep 30)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "marine: sir! pelican's gonna land one level down!"))
    (sleep (ai_play_line_at_player marine_01 070mx_040))
    (sleep 4)
    (md_dialogue_stop)
    (set b_f3_objective_dialog_done true)
    (sleep_until 
        (or
            (>= s_f3_p2_progression 20)
            b_f3_p2_take_combat_outside
        )
    )
    (sleep 60)
    (vs_enable_targeting marine_01 true)
    (if (< s_f3_p2_progression 30) 
        (begin
            (sleep_until (not b_playing_dialogue) 30 150)
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_dialogue 
                (print "marine (whisper): tracker's reading multiple contacts"))
            (sleep (ai_play_line marine 070mj_010))
            (sleep 10)
            (if b_dialogue 
                (print "marine (whisper): we got a welcome party!"))
            (sleep (ai_play_line marine 070mj_020))
            (sleep 10)
        )
    )
    (vs_release_all)
)

(script dormant void md_f3_marine_stuck
    (if b_debug 
        (print "mission dialogue:f3:marine:stuck"))
    (vs_cast "allies_f3_mar_wasted" false 10 "")
    (set marine_02 (vs_role 1))
    (vs_cast "cov_f3_p2_pack/intro_grunt" true 10 "")
    (set brute (vs_role 1))
    (if (>= (ai_living_count "allies_f3_mar_wasted") 0) 
        (begin
            (vs_enable_pathfinding_failsafe marine_02 true)
            (vs_enable_looking marine_02 false)
            (vs_enable_targeting marine_02 false)
            (vs_enable_moving marine_02 false)
            (vs_enable_looking brute false)
            (vs_enable_targeting brute false)
            (vs_enable_moving brute false)
            (vs_face marine_02 true "pts_f3_marine_1/face")
            (sleep_until 
                (or
                    (>= s_f3_p2_progression 10)
                    b_f3_p2_take_combat_outside
                ) 
            1)
            (vs_go_to marine_02 false "pts_f3_marine_1/start")
            (vs_face marine_02 false "pts_f3_marine_1/face")
            (vs_crouch marine_02 true)
            (vs_shoot_point marine_02 true "pts_f3_stuck_vignette/shoot_at")
            (sleep_until 
                (or
                    (>= s_f3_p2_progression 20)
                    b_f3_p2_take_combat_outside
                ) 
            1)
            (sleep 15)
            (vs_grenade brute false "pts_f3_stuck_vignette/throw_at" 1)
            (sleep 60)
            (vs_shoot marine_02 false)
            (vs_crouch marine_02 false)
            (vs_enable_looking brute true)
            (vs_enable_targeting brute true)
            (sleep 45)
            (vs_release_all)
        )
    )
)

(script dormant void md_f3_jon_next
    (sleep_until 
        (or
            b_f3_p2_take_combat_outside
            (>= s_f3_p2_progression 40)
        )
    )
    (if (< s_f3_p2_progression 40) 
        (begin
            (sleep_until (not b_playing_dialogue) 30 150)
            (sleep 1)
            (vs_set_cleanup_script md_cleanup)
            (md_dialogue_start)
            (if b_debug 
                (print "mission dialogue:f3:jon:next"))
            (if b_dialogue 
                (print "johnson (radio): head downstairs, chief!"))
            (sleep (ai_play_line_on_object none 070ml_130))
            (sleep 10)
            (if b_dialogue 
                (print "johnson (radio): we'll have to land on the ledge below!"))
            (sleep (ai_play_line_on_object none 070ml_140))
        )
    )
)

(script dormant void md_f3_gs_secret_dialog
    (sleep_until (>= s_f3_p2_progression 40) 5)
    (sleep (random_range 30 180))
    (if b_debug 
        (print "mission dialogue:f3:gs:secret:dialog"))
    (vs_cast "gr_guilty_spark" true 10 "070mm_010")
    (set guilty_spark (vs_role 1))
    (vs_enable_pathfinding_failsafe guilty_spark true)
    (vs_enable_looking guilty_spark true)
    (vs_enable_targeting guilty_spark true)
    (vs_enable_moving guilty_spark true)
    (sleep 1)
    (if b_dialogue 
        (print "guilty (quiet, excited): protocol dictates action! "))
    (sleep (ai_play_line_on_object guilty_spark 070mm_010))
    (sleep 10)
    (if b_dialogue 
        (print "guilty (quiet, excited): the installation was my responsibility..."))
    (sleep (ai_play_line_on_object guilty_spark 070mm_020))
    (sleep 10)
    (if b_dialogue 
        (print "guilty (quiet, excited): if my suspicions are correct"))
    (sleep (ai_play_line_on_object guilty_spark 070mm_030))
    (sleep 10)
    (if b_dialogue 
        (print "guilty (quiet, excited): no! i must not leap to any conclusions!"))
    (sleep (ai_play_line_on_object guilty_spark 070mm_040))
    (vs_release_all)
)

(script dormant void f5_stop_truth_halogram
    (sleep_until 
        (or
            (<= (object_get_health "f5_holo_generator") 0.0)
            b_truth_speech_finished
        ) 
    10)
    (sleep_forever f5_truth_halogram)
    (sound_impulse_stop "sound\dialog\070_waste\mission\070my_070_pot.sound")
    (sound_impulse_stop "sound\dialog\070_waste\mission\070my_080_pot.sound")
)

(script dormant void f5_truth_halogram
    (set b_truth_speech_finished false)
    (wake f5_stop_truth_halogram)
    (object_create_anew "f5_truth_scenery")
    (object_create_anew "f5_grav_throne")
    (object_create_anew "f5_holo_generator")
    (object_set_function_variable "f5_truth_scenery" "bloom" 0.5 30.0)
    (object_set_function_variable "f5_grav_throne" "bloom" 0.5 30.0)
    (objects_attach "f5_truth_scenery" "driver" "f5_grav_throne" "driver")
    (objects_attach "f5_holo_generator" "attach_marker" "f5_truth_scenery" "")
    (sleep_until 
        (or
            (volume_test_players "vol_f5_challenge_ring")
            (>= s_f5_progression 30)
            b_f5_chieftain_charge
        )
    )
    (sleep (random_range 90 150))
    (if b_dialogue 
        (print "truth: you must win this fight on your own!"))
    (scenery_animation_start "f5_truth_scenery" "objects\characters\truth\cinematics\truth_holos\070_truth_c\070_truth_c.model_animation_graph" "070_truth_c")
    (sound_impulse_start "sound\dialog\070_waste\mission\070my_070_pot" "f5_truth_scenery" 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\070_waste\mission\070my_070_pot"))
    (sleep 30)
    (if b_dialogue 
        (print "truth: failure will bring a fate worse than death: abandonment as we step forward without you!"))
    (scenery_animation_start "f5_truth_scenery" "objects\characters\truth\cinematics\truth_holos\070_truth_c\070_truth_c.model_animation_graph" "070_truth_c2")
    (sound_impulse_start "sound\dialog\070_waste\mission\070my_080_pot" "f5_truth_scenery" 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\070_waste\mission\070my_080_pot"))
    (sleep 45)
    (070_truth_flicker "f5_grav_throne" "f5_truth_scenery")
    (object_destroy "f5_truth_scenery")
    (object_destroy "f5_grav_throne")
    (set b_truth_speech_finished true)
)

(script dormant void md_f5_jon_pelican_eta
    (sleep_until (<= (ai_living_count "cov_f5_brt_chieftain") 0) 30 600)
    (if b_debug 
        (print "mission dialogue:f5:jon:pelican:eta"))
    (sleep 1)
    (sleep 1)
    (vs_set_cleanup_script md_cleanup)
    (md_dialogue_start)
    (if b_dialogue 
        (print "johnson (radio): hang tight, chief! we're on our way!"))
    (sleep (ai_play_line_on_object none 070mm_070))
    (md_dialogue_stop)
    (set b_070_music_13 false)
    (sleep_until b_f5_combat_finished)
    (sleep (random_range 30 150))
    (md_dialogue_start)
    (if b_dialogue 
        (print "johnson (radio): eta: damn quick! standby for pickup!"))
    (sleep (ai_play_line_on_object none 070mm_080))
    (md_dialogue_stop)
)

(script dormant void f5_070ld_start
    (objective_4_clear)
    (data_mine_set_mission_segment "070_ld_pelican_pickup")
    (cinematic_fade_to_black)
    (game_award_level_complete_achievements)
    (ai_erase "gr_npc")
    (background_shaft_cleanup)
    (add_recycling_volume "vol_f5_cin_cleanup" 0 0)
    (if b_cinematic 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (070ld_pelican_pickup)
                )
            )
            (cinematic_skip_stop)
            (070ld_pelican_pickup_cleanup)
        )
    )
    (sound_class_set_gain "" 0.0 0)
    (sleep 5)
    (end_mission)
)

(script static void sleep_ex_radio_delay
    (sleep (random_range 90 450))
)

(script static boolean ex_play_radio_0_condition
    (and
        (<= (objects_distance_to_object (players) "ex_radio_0") 12.0)
        (> (objects_distance_to_object (players) "ex_radio_0") 0.0)
    )
)

(script static boolean ex_play_radio_1_condition
    (and
        (<= (objects_distance_to_object (players) "ex_radio_1") 15.0)
        (> (objects_distance_to_object (players) "ex_radio_1") 0.0)
    )
)

(script static boolean ex_play_brute_radio_condition
    (and
        (<= (objects_distance_to_object (players) "ex_brute_radio") 15.0)
        (> (objects_distance_to_object (players) "ex_brute_radio") 0.0)
    )
)

(script static boolean ex_play_radio_condition
    (or
        (ex_play_radio_0_condition)
        (ex_play_radio_1_condition)
    )
)

(script static void ex_play_radio (ai_line line)
    (if (ex_play_radio_0_condition) 
        (sleep (ai_play_line_on_object "ex_radio_0" line)))
    (if (ex_play_radio_1_condition) 
        (if (ex_play_radio_0_condition) 
            (ai_play_line_on_object "ex_radio_1" line) (sleep (ai_play_line_on_object "ex_radio_1" line)))
    )
)

(script static void ex_play_brute_radio (ai_line line)
    (ai_play_line_on_object "ex_brute_radio" line)
    (sleep (ai_play_line_on_object "ex_brute_radio" line))
)

(script dormant void md_ambiant_radio_stop
    (sleep_until b_fl_frigate_arrived)
    (sleep_forever md_ambiant_radio)
)

(script dormant void md_ambiant_radio
    (wake md_ambiant_radio_stop)
    (object_create_anew "ex_radio_0")
    (object_create_anew "ex_radio_1")
    (sleep 1)
    (sound_looping_start "sound\materials\gear\high_ground_radio\high_ground_radio" "ex_radio_0" 1.0)
    (sound_looping_start "sound\materials\gear\high_ground_radio\high_ground_radio" "ex_radio_1" 1.0)
    (sleep_until (ex_play_radio_condition))
    (begin_random
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "got a lock! fox-fox!"))
            (ex_play_radio 070mz_130)
            (sleep 15)
            (if b_debug 
                (print "negative! protect the pelicans!"))
            (ex_play_radio 070mz_080)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "fire pods one through twelve! archers away!"))
            (ex_play_radio 070mz_030)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "new contacts at point two three eight!"))
            (ex_play_radio 070mz_060)
            (sleep 30)
            (if b_debug 
                (print "affirmative! i see it!"))
            (ex_play_radio 070mz_120)
            (sleep 15)
            (if b_debug 
                (print "no! i will handle those myself!"))
            (ex_play_radio 070mz_220)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "stay away from those cruisers!"))
            (ex_play_radio 070mz_150)
            (sleep 15)
            (if b_debug 
                (print "understood! engage those seraphs!"))
            (ex_play_radio 070mz_070)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "let the elites handle the cruisers!"))
            (ex_play_radio 070mz_090)
            (sleep 60)
            (if b_debug 
                (print "full shields! ramming speed!"))
            (ex_play_radio 070mz_260)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "seraphs! on my six!"))
            (ex_play_radio 070mz_110)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "splash one! coming about!"))
            (ex_play_radio 070mz_140)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "hit them again! and again! and again!"))
            (ex_play_radio 070mz_280)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "let your cannons roar!"))
            (ex_play_radio 070mz_210)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "broadside! what fools to face our guns!"))
            (ex_play_radio 070mz_300)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "now! close and finish!"))
            (ex_play_radio 070mz_270)
            (sleep 20)
            (if b_debug 
                (print "negative! get out of there!"))
            (ex_play_radio 070mz_160)
        )
    )
    (begin_random
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "watch your fire! watch your fire!"))
            (ex_play_radio 070mz_100)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "point-laser fire! break off!"))
            (ex_play_radio 070mz_170)
            (sleep 60)
            (if b_debug 
                (print "i'm hit! i'm hit!"))
            (ex_play_radio 070mz_180)
        )
    )
    (begin
        (sleep_until (ex_play_radio_condition))
        (sleep_ex_radio_delay)
        (if b_debug 
            (print "lost avionics. gonna try and hit their carrier. good luck, people."))
        (ex_play_radio 070mz_200)
    )
    (begin_random
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "charge the mac! give me a firing solution!"))
            (ex_play_radio 070mz_010)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "all squadrons! form up! form up!"))
            (ex_play_radio 070mz_050)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "standby to jettison the hevs! on my mark!"))
            (ex_play_radio 070mz_040)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "forward lances! draw their fire!"))
            (ex_play_radio 070mz_230)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "suppress with main point-laser batteries!"))
            (ex_play_radio 070mz_240)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "a mark of honor for that kill!"))
            (ex_play_radio 070mz_250)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "look at it blister and burn!"))
            (ex_play_radio 070mz_290)
            (sleep 30)
            (if b_debug 
                (print "affirmative! that's a hit!"))
            (ex_play_radio 070mz_020)
        )
        (begin
            (sleep_until (ex_play_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "they have been gutted! stem to stern!"))
            (ex_play_radio 070mz_310)
        )
    )
)

(script dormant void md_ambiant_brute_radio_stop
    (sleep_until b_fl_frigate_arrived)
    (sleep_forever md_ambiant_brute_radio)
)

(script dormant void md_ambiant_brute_radio
    (wake md_ambiant_brute_radio_stop)
    (sound_looping_start "sound\materials\gear\high_ground_radio\high_ground_radio" "ex_brute_radio" 1.0)
    (sleep_until (ex_play_brute_radio_condition))
    (begin_random
        (begin
            (sleep_until (ex_play_brute_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "keep them off this hallowed ground! drive the heretics' ships back through the portal!"))
            (ex_play_brute_radio 070mx_110)
        )
        (begin
            (sleep_until (ex_play_brute_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "do not fear the prophet's wrath. if you fail i will have your hide!"))
            (ex_play_brute_radio 070mx_120)
        )
        (begin
            (sleep_until (ex_play_brute_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "their cruisers mix with ours! watch your fire!"))
            (ex_play_brute_radio 070mx_130)
        )
        (begin
            (sleep_until (ex_play_brute_radio_condition))
            (sleep_ex_radio_delay)
            (if b_debug 
                (print "no! shoot the carrier! kill that half-jaw and his crew!"))
            (ex_play_brute_radio 070mx_140)
        )
    )
)

(script dormant void background_bowls
    (if b_debug 
        (print "starting up background_bowls"))
    (sleep_until (>= s_b1_progression 30))
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (amb_bowls_phantom_escort01)
                    (sleep (random_range 900 1800))
                )
                (begin
                    (amb_bowls_phantom_escort02)
                    (sleep (random_range 900 1800))
                )
            )
            (sleep 1800)
            (begin_random
                (begin
                    (amb_bowls_phantom_escort01)
                    (sleep (random_range 900 1800))
                )
                (begin
                    (amb_bowls_phantom_escort02)
                    (sleep (random_range 900 1800))
                )
            )
            true
        )
    )
)

(script static void background_bowls_cleanup
    (sleep_forever background_bowls)
    (ai_disposable "cov_amb_bowls_phantom01" true)
    (ai_disposable "cov_amb_bowls_phantom02" true)
    (ai_disposable "cov_amb_bowls_banshee01" true)
    (ai_disposable "cov_amb_bowls_banshee02" true)
)

(script static void amb_bowls_phantom_escort01
    (ai_place "cov_amb_bowls_phantom01")
    (ai_force_active "cov_amb_bowls_phantom01" true)
    (cs_run_command_script (ai_get_turret_ai "cov_amb_bowls_phantom01" 0) cs_do_nothing)
    (sleep 240)
    (ai_place "cov_amb_bowls_banshee01" 1)
    (ai_force_active "cov_amb_bowls_banshee01" true)
    (ai_place "cov_amb_bowls_banshee02" 1)
    (ai_force_active "cov_amb_bowls_banshee02" true)
)

(script static void amb_bowls_phantom_escort02
    (ai_place "cov_amb_bowls_phantom02")
    (ai_force_active "cov_amb_bowls_phantom02" true)
    (cs_run_command_script (ai_get_turret_ai "cov_amb_bowls_phantom02" 0) cs_do_nothing)
    (sleep 90)
    (ai_place "cov_amb_bowls_banshee03" 1)
    (ai_force_active "cov_amb_bowls_banshee03" true)
    (ai_place "cov_amb_bowls_banshee04" 1)
    (ai_force_active "cov_amb_bowls_banshee04" true)
)

(script command_script void cs_amb_bowls_phantom_0
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_shoot false)
    (cs_fly_by "pts_amb_bowls/p0" 10.0)
    (cs_fly_by "pts_amb_bowls/p1" 10.0)
    (cs_fly_by "pts_amb_bowls/p2" 10.0)
    (cs_fly_by "pts_amb_bowls/p3" 10.0)
    (cs_fly_to "pts_amb_bowls/p4" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_amb_bowls_phantom_1
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_shoot false)
    (cs_fly_by "pts_amb_bowls/p2" 10.0)
    (cs_fly_by "pts_amb_bowls/p1" 10.0)
    (cs_fly_by "pts_amb_bowls/p0" 10.0)
    (cs_fly_by "pts_amb_bowls/p5" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_amb_bowls_banshee_0
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_shoot false)
    (cs_vehicle_boost true)
    (cs_fly_by "pts_amb_bowls/p0" 10.0)
    (cs_fly_by "pts_amb_bowls/p1" 10.0)
    (cs_fly_by "pts_amb_bowls/p2" 10.0)
    (cs_fly_by "pts_amb_bowls/p3" 10.0)
    (cs_vehicle_boost false)
    (cs_fly_to "pts_amb_bowls/p4" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_amb_bowls_banshee_1
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_shoot false)
    (cs_vehicle_boost true)
    (cs_fly_by "pts_amb_bowls/p2" 10.0)
    (cs_fly_by "pts_amb_bowls/p1" 10.0)
    (cs_fly_by "pts_amb_bowls/p0" 10.0)
    (cs_vehicle_boost false)
    (cs_fly_by "pts_amb_bowls/p6" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void boost
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_shoot false)
    (cs_vehicle_boost true)
    (sleep 200)
    (cs_enable_moving true)
    (sleep_forever)
)

(script dormant void background_exploration
    (if b_debug 
        (print "starting up background_exploration"))
    (flock_create "flock_ex_banshee_right")
    (flock_create "flock_ex_hornet_right")
    (sleep_until 
        (or
            (>= (device_get_position "fp_exit_door") 0.01)
            (>= s_ex_progression 10)
        ) 
    10)
    (wake va_crashing_longsword)
    (sleep 30)
    (sleep_until (>= s_ex_progression 35))
    (flock_create "flock_ex_banshee_over_right")
    (flock_create "flock_ex_hornet_over_right")
    (sleep_until (>= s_ex_progression 40))
    (sleep_until 
        (and
            (>= s_ex_progression 60)
            (= (current_zone_set_fully_active) 4)
        )
    )
    (flock_create "flock_aw_banshee")
    (flock_create "flock_aw_hornet")
    (sleep_until 
        (or
            (>= s_aw_progression 30)
            b_fl_frigate_arrived
        )
    )
    (flock_stop "flock_aw_banshee")
    (flock_create "flock_ex_banshee_left")
    (flock_create "flock_ex_hornet_left")
    (flock_create "flock_ex_banshee_over_left")
    (flock_create "flock_ex_hornet_over_left")
)

(script static void background_exploration_cleanup
    (sleep_forever background_exploration)
    (flock_delete "flock_ex_banshee_left")
    (flock_delete "flock_ex_hornet_left")
    (flock_delete "flock_ex_banshee_over_left")
    (flock_delete "flock_ex_hornet_over_left")
    (flock_delete "flock_ex_banshee_over_right")
    (flock_delete "flock_ex_hornet_over_right")
    (flock_delete "flock_ex_banshee_right")
    (flock_delete "flock_ex_hornet_right")
    (flock_delete "flock_aw_banshee")
    (flock_delete "flock_aw_hornet")
)

(script command_script void cs_amb_ex_intro_banshee_0
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (cs_fly_to "pts_amb_ex_intro_banshees/p0")
    (cs_fly_to "pts_amb_ex_intro_banshees/p1")
    (cs_vehicle_boost false)
    (cs_fly_to "pts_amb_ex_intro_banshees/p2")
    (cs_fly_to "pts_amb_ex_intro_banshees/p3")
    (cs_fly_to "pts_amb_ex_intro_banshees/p9")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_amb_ex_intro_banshee_1
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (cs_fly_to "pts_amb_ex_intro_banshees/p4")
    (cs_fly_to "pts_amb_ex_intro_banshees/p5")
    (cs_vehicle_boost false)
    (cs_fly_to "pts_amb_ex_intro_banshees/p6")
    (cs_fly_to "pts_amb_ex_intro_banshees/p7")
    (cs_fly_to "pts_amb_ex_intro_banshees/p8")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_amb_ex_banshee_0
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (cs_fly_to "pts_amb_ex_banshees/p0")
    (cs_fly_to "pts_amb_ex_banshees/p2")
    (cs_fly_to "pts_amb_ex_banshees/p4")
    (cs_fly_to "pts_amb_ex_banshees/p6")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_amb_ex_banshee_1
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (cs_fly_to "pts_amb_ex_banshees/p1")
    (cs_fly_to "pts_amb_ex_banshees/p3")
    (cs_fly_to "pts_amb_ex_banshees/p5")
    (cs_fly_to "pts_amb_ex_banshees/p7")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script dormant void background_lightbridge
    (if b_debug 
        (print "starting up background_lightbridge"))
    (sleep_until (>= s_lb_progression 40))
    (player_effect_set_max_rotation 0.0 1.0 1.0)
    (player_effect_set_max_rumble 1.0 1.0)
    (player_effect_start 0.3 0.05)
    (sleep 20)
    (player_effect_stop 0.4)
    (sleep 90)
    (if 
        (and
            (not b_bb_scarab_over_head_created)
            (<= s_lb_progression 50)
        ) 
            (begin
                (sound_impulse_start "sound\device_machines\scarab\scarab_steps" "lb_scarab_sound_0" 10.0)
                (effect_new_at_ai_point "fx\scenery_fx\ceiling_dust\human_dust_fall_large\human_dust_fall_large.effect" "pts_lb_scarab_step/p0")
                (player_effect_set_max_rotation 0.0 1.0 1.0)
                (player_effect_set_max_rumble 1.0 1.0)
                (player_effect_start 0.3 0.05)
                (sleep 20)
                (player_effect_stop 0.4)
            )
    )
    (sleep 120)
    (if 
        (and
            (not b_bb_scarab_over_head_created)
            (<= s_lb_progression 50)
        ) 
            (begin
                (sound_impulse_start "sound\device_machines\scarab\scarab_steps" "lb_scarab_sound_0" 10.0)
                (effect_new_at_ai_point "fx\scenery_fx\ceiling_dust\human_dust_fall_large\human_dust_fall_large.effect" "pts_lb_scarab_step/p3")
                (player_effect_set_max_rotation 0.0 1.0 1.0)
                (player_effect_set_max_rumble 1.0 1.0)
                (player_effect_start 0.3 0.05)
                (sleep 20)
                (player_effect_stop 0.4)
            )
    )
    (sleep 120)
    (if (not b_bb_scarab_over_head_created) 
        (begin
            (sound_impulse_start "sound\device_machines\scarab\scarab_steps" "lb_scarab_sound_1" 10.0)
            (effect_new_at_ai_point "fx\scenery_fx\ceiling_dust\human_dust_fall_large\human_dust_fall_large.effect" "pts_lb_scarab_step/p1")
            (player_effect_set_max_rotation 0.0 1.0 1.0)
            (player_effect_set_max_rumble 1.0 1.0)
            (player_effect_start 0.3 0.05)
            (sleep 20)
            (player_effect_stop 0.4)
        )
    )
    (sleep 120)
    (if (not b_bb_scarab_over_head_created) 
        (begin
            (sound_impulse_start "sound\device_machines\scarab\scarab_steps" "lb_scarab_sound_2" 10.0)
            (effect_new_at_ai_point "fx\scenery_fx\ceiling_dust\human_dust_fall_large\human_dust_fall_large.effect" "pts_lb_scarab_step/p2")
            (player_effect_set_max_rotation 0.0 1.0 1.0)
            (player_effect_set_max_rumble 1.0 1.0)
            (player_effect_start 0.3 0.05)
            (sleep 20)
            (player_effect_stop 0.4)
        )
    )
)

(script dormant void background_shaft
    (if b_debug 
        (print "starting up background_shaft"))
    (sleep_until (> s_f4_progression 0))
    (flock_create "flock_shaft_banshee")
    (flock_create "flock_shaft_hornet")
    (sleep_until b_f5_combat_finished)
    (flock_stop "flock_shaft_banshee")
)

(script static void background_shaft_cleanup
    (sleep_forever background_shaft)
    (flock_delete "flock_shaft_banshee")
    (flock_delete "flock_shaft_hornet")
)

(script static boolean obj_larbit_0_2
    (>= s_lz_progression 10)
)

(script static boolean obj_larbit_0_3
    (>= s_lz_progression 20)
)

(script static boolean obj_ladvan_0_5
    (>= s_lz_progression 10)
)

(script static boolean obj_ladvan_0_6
    (>= s_lz_progression 20)
)

(script static boolean obj_ladvan_0_7
    (>= s_lz_progression 30)
)

(script static boolean obj_ladvan_0_8
    (>= s_lz_progression 40)
)

(script static boolean obj_larbit_0_9
    (>= s_lz_progression 30)
)

(script static boolean obj_bmiddl_1_1
    (<= s_b1_progression 40)
)

(script static boolean obj_bbefor_1_3
    (not b_b1_combat_started)
)

(script static boolean obj_bfront_1_4
    (> (ai_task_count "obj_b1_cov/front") 0)
)

(script static boolean obj_bfront_1_5
    (and
        (> (ai_living_count "cov_b1_ini_brutes_0") 0)
        (<= s_b1_progression 35)
    )
)

(script static boolean obj_bfront_1_12
    (not (volume_test_players "vol_b1_down"))
)

(script static boolean obj_bfront_1_13
    (> (ai_task_count "obj_b1_cov/front") 0)
)

(script static boolean obj_bbrute_1_17
    (not (volume_test_players "vol_b1_down"))
)

(script static boolean obj_bbrute_1_18
    (not (volume_test_players "vol_b1_down"))
)

(script static boolean obj_bbrute_1_21
    (and
        (<= (ai_task_count "obj_b1_cov/brutes_advance") 0)
        (not (volume_test_players "vol_b1_rear"))
    )
)

(script static boolean obj_bbrute_1_23
    (and
        (<= (ai_task_count "obj_b1_cov/brutes_advance") 0)
        (not (volume_test_players "vol_b1_rear"))
    )
)

(script static boolean obj_bsnipe_2_0
    (>= s_b1_allies_progression 2)
)

(script static boolean obj_bsnipe_2_1
    (>= s_b1_allies_progression 1)
)

(script static boolean obj_bsnipe_2_2
    (>= s_b1_progression 20)
)

(script static boolean obj_bmarin_2_4
    (>= s_b1_allies_progression 3)
)

(script static boolean obj_bmarin_2_5
    (>= s_b1_allies_progression 2)
)

(script static boolean obj_ballie_2_8
    (>= s_lz_progression 20)
)

(script static boolean obj_bmarin_2_9
    b_b1_combat_started
)

(script static boolean obj_bsnipe_2_10
    b_b1_finished
)

(script static boolean obj_bmarin_2_11
    b_b1_finished
)

(script static boolean obj_bsnipe_2_13
    (>= s_b1_progression 20)
)

(script static boolean obj_bmiddl_3_1
    (and
        (< s_b2_progression 26)
        (not b_b2_hunters_placed)
    )
)

(script static boolean obj_bback_3_2
    (< s_b2_progression 30)
)

(script static boolean obj_bjacka_3_9
    b_b2_elites_charge
)

(script static boolean obj_bsnipe_3_13
    b_b2_hunters_placed
)

(script static boolean obj_btop_r_3_14
    b_b2_hunters_dead
)

(script static boolean obj_bbotto_3_15
    (and
        b_b2_hunters_dead
        (<= s_b2_progression 27)
    )
)

(script static boolean obj_bfront_3_16
    (> (ai_task_count "obj_b2_cov/front_face") 0)
)

(script static boolean obj_bfront_3_17
    (< s_b2_progression 26)
)

(script static boolean obj_bcharg_3_20
    (and
        b_b2_combat_started
        (volume_test_players "vol_b2_charge")
        (not b_b2_hunters_placed)
    )
)

(script static boolean obj_bhunte_3_21
    (volume_test_players "vol_b2_ramp_0")
)

(script static boolean obj_biniti_3_22
    (not b_b2_hunters_dead)
)

(script static boolean obj_bback__3_28
    (not b_b2_hunters_placed)
)

(script static boolean obj_bback__3_30
    b_b2_hunters_placed
)

(script static boolean obj_bsnipe_4_0
    (<= (ai_task_count "obj_b2_cov/middle") 0)
)

(script static boolean obj_bsnipe_4_1
    (<= (ai_task_count "obj_b2_cov/front") 0)
)

(script static boolean obj_bmarin_4_4
    (<= (ai_task_count "obj_b2_cov/middle") 0)
)

(script static boolean obj_bmarin_4_5
    (<= (ai_task_count "obj_b2_cov/front") 0)
)

(script static boolean obj_bafter_4_7
    b_b2_finished
)

(script static boolean obj_bbefor_4_8
    (not b_b2_combat_started)
)

(script static boolean obj_bafter_4_10
    (>= s_b2_progression 30)
)

(script static boolean obj_bafter_4_11
    (>= s_b2_progression 40)
)

(script static boolean obj_bafter_4_12
    (>= s_b2_progression 27)
)

(script static boolean obj_bmarin_4_13
    (and
        (> (ai_task_count "obj_b2_cov/top_ramp") 0)
        (>= s_b2_progression 30)
        b_b2_hunters_dead
    )
)

(script static boolean obj_bsnipe_4_14
    (and
        b_b2_hunters_dead
        (or
            (>= s_b2_progression 27)
            (<= (ai_task_count "obj_b2_cov/bottom_ramp") 0)
        )
    )
)

(script static boolean obj_bmarin_4_15
    (and
        b_b2_hunters_dead
        (or
            (>= s_b2_progression 27)
            (<= (ai_task_count "obj_b2_cov/bottom_ramp") 0)
        )
    )
)

(script static boolean obj_bsnipe_4_16
    b_b2_hunters_dead
)

(script static boolean obj_bmarin_4_17
    b_b2_hunters_dead
)

(script static boolean obj_fmarin_5_1
    (>= s_fp_progression 20)
)

(script static boolean obj_emaule_6_1
    b_ex_mauler_charge
)

(script static boolean obj_epart__6_8
    (>= s_ex_progression 35)
)

(script static boolean obj_epart__6_11
    (volume_test_players "vol_ex_corridor")
)

(script static boolean obj_emaule_6_17
    (< s_ex_progression 35)
)

(script static boolean obj_epart__6_20
    (< s_ex_progression 35)
)

(script static boolean obj_ecave__7_4
    (>= s_ex_progression 65)
)

(script static boolean obj_ecave__7_5
    (>= s_ex_progression 60)
)

(script static boolean obj_ecave__7_7
    (and
        b_sd_finished
        (volume_test_players "vol_ex_before_trench")
    )
)

(script static boolean obj_enear__8_1
    b_ex_p1_finished
)

(script static boolean obj_eafter_8_2
    (or
        b_ex_p1_finished
        b_ex_part_2_finished
    )
)

(script static boolean obj_eafter_8_4
    (>= s_ex_progression 27)
)

(script static boolean obj_eafter_8_5
    (and
        b_ex_part_2_finished
        (>= s_ex_progression 40)
    )
)

(script static boolean obj_eafter_8_6
    (and
        (volume_test_players "vol_ex_sd_encounter")
        b_sd_warthog_can_go
    )
)

(script static boolean obj_eafter_8_7
    (>= s_ex_progression 60)
)

(script static boolean obj_eafter_8_8
    (and
        (volume_test_players "vol_ex_sd_area")
        (not b_sd_warthog_can_go)
    )
)

(script static boolean obj_eafter_8_10
    (and
        (>= s_ex_progression 50)
        (not b_sd_warthog_can_go)
    )
)

(script static boolean obj_eafter_8_11
    (ai_player_any_needs_vehicle)
)

(script static boolean obj_eafter_8_13
    (>= s_ex_progression 55)
)

(script static boolean obj_eafter_8_14
    (>= s_ex_progression 50)
)

(script static boolean obj_einfan_8_15
    (>= s_ex_progression 10)
)

(script static boolean obj_esd_do_8_16
    (> (ai_task_count "obj_sd_cov/door_retreat") 0)
)

(script static boolean obj_esd_fl_8_17
    (or
        (> (ai_task_count "obj_sd_cov/flak") 0)
        (> (ai_task_count "obj_sd_cov/bridge_entrance_active") 0)
    )
)

(script static boolean obj_esd_ce_8_18
    (> (ai_task_count "obj_sd_cov/choppers") 0)
)

(script static boolean obj_einfan_8_19
    (= (ai_task_status "obj_ex_cov/infantry_front") ai_task_status_exhausted)
)

(script static boolean obj_einfan_8_20
    (= (ai_task_status "obj_ex_cov/infantry_middle") ai_task_status_exhausted)
)

(script static boolean obj_einfan_8_21
    (= (ai_task_status "obj_ex_cov/infantry_back") ai_task_status_exhausted)
)

(script static boolean obj_einfan_8_22
    b_ex_p1_has_started
)

(script static boolean obj_ep1_ve_8_23
    b_ex_p1_has_started
)

(script static boolean obj_ep2_ve_8_26
    (>= s_ex_progression 35)
)

(script static boolean obj_eafter_9_0
    b_ex_cave_finished
)

(script static boolean obj_svehic_10_0
    (> (ai_task_count "obj_sd_cov/choppers") 0)
)

(script static boolean obj_svehic_10_3
    (> (ai_task_count "obj_sd_cov/flak") 0)
)

(script static boolean obj_svehic_10_4
    (> (ai_task_count "obj_sd_cov/door_retreat") 0)
)

(script static boolean obj_sretre_11_0
    b_sd_grunts_flee
)

(script static boolean obj_schopp_11_6
    (volume_test_players "vol_sd_bridge")
)

(script static boolean obj_sbridg_11_10
    (< s_sd_progression 10)
)

(script static boolean obj_sclean_12_1
    (<= (ai_living_count "gr_cov_sd_bridge") 0)
)

(script static boolean obj_scharg_12_2
    b_sd_sentinels_charge
)

(script static boolean obj_sexit_12_3
    b_ex_cave_finished
)

(script static boolean obj_abridg_13_1
    (>= (ai_task_count "obj_aw_cov/wraith_mortar") 1)
)

(script static boolean obj_aghost_13_6
    (<= (ai_task_count "obj_aw_cov/bridge_front") 0)
)

(script static boolean obj_acave_13_11
    (<= s_aw_progression 20)
)

(script static boolean obj_aghost_13_12
    (volume_test_players "vol_aw_pass_bridge")
)

(script static boolean obj_awrait_13_14
    (and
        (not (volume_test_players "vol_aw_pass_bridge"))
        b_aw_wraith_advance
    )
)

(script static boolean obj_awrait_13_18
    (<= (ai_task_count "obj_aw_cov/wraith_up_right") 0)
)

(script static boolean obj_aghost_13_19
    b_aw_wraith_advance
)

(script static boolean obj_awrait_13_22
    (<= s_aw_progression 20)
)

(script static boolean obj_ainfan_13_25
    (>= s_aw_progression 30)
)

(script static boolean obj_aghost_13_27
    (<= (ai_task_count "obj_aw_cov/bridge_front") 0)
)

(script static boolean obj_awarth_14_2
    (and
        b_aw_marines_advance
        (>= s_aw_progression 30)
    )
)

(script static boolean obj_abunke_14_3
    b_aw_marines_advance
)

(script static boolean obj_awarth_14_6
    b_aw_marines_advance
)

(script static boolean obj_lghost_16_1
    (<= s_la_progression 10)
)

(script static boolean obj_lhunte_16_7
    (<= s_la_progression 20)
)

(script static boolean obj_lwrait_17_5
    (<= s_la_progression 40)
)

(script static boolean obj_lwrait_17_8
    (and
        (<= s_la_progression 50)
        (>= (unit_get_health "cov_la_p2_trench_wraith") 0.9)
    )
)

(script static boolean obj_lghost_17_10
    (<= s_la_progression 60)
)

(script static boolean obj_lbansh_17_15
    (and
        (<= s_la_progression 30)
        (> (ai_living_count "gr_cov_la_p2_a") 1)
    )
)

(script static boolean obj_lghost_17_19
    (and
        (<= (ai_task_count "obj_la_p2_cov/ghosts_trench") 2)
        (>= s_la_progression 60)
    )
)

(script static boolean obj_lghost_17_22
    (>= s_la_progression 70)
)

(script static boolean obj_lwarth_18_3
    (<= (ai_task_count "obj_la_p1_cov/ghosts") 0)
)

(script static boolean obj_lwarth_18_7
    (<= (ai_task_count "obj_la_p1_cov/ghosts") 0)
)

(script static boolean obj_lscorp_18_8
    (>= s_la_progression 10)
)

(script static boolean obj_lwarth_18_10
    (>= s_la_progression 10)
)

(script static boolean obj_lback_19_9
    (>= s_la_progression 30)
)

(script static boolean obj_lbefor_19_10
    (>= s_la_progression 35)
)

(script static boolean obj_ltrenc_19_11
    (<= (ai_living_count "gr_cov_la_p2_a") 0)
)

(script static boolean obj_lafter_19_12
    (and
        (>= s_la_progression 70)
        (<= (ai_living_count "gr_cov_la_p2_b") 0)
    )
)

(script static boolean obj_ltrenc_19_13
    (>= s_la_progression 50)
)

(script static boolean obj_ltrenc_19_14
    (>= s_la_progression 40)
)

(script static boolean obj_lfollo_20_1
    b_gs_follow_player
)

(script static boolean obj_lmiddl_20_2
    (>= s_la_progression 10)
)

(script static boolean obj_lend_20_3
    (>= s_la_progression 25)
)

(script static boolean obj_lnear__20_4
    b_fl_070bb_done
)

(script static boolean obj_lfollo_21_1
    b_gs_follow_player
)

(script static boolean obj_lmiddl_21_2
    (>= s_la_progression 35)
)

(script static boolean obj_lbefor_21_3
    (>= s_la_progression 40)
)

(script static boolean obj_lafter_21_4
    (>= s_la_progression 50)
)

(script static boolean obj_lend_21_5
    (>= s_la_progression 80)
)

(script static boolean obj_dtanks_22_3
    (<= (ai_task_count "obj_dw_cov/wraith_back_left") 0)
)

(script static boolean obj_dcomba_22_10
    (>= s_dw_progression 20)
)

(script static boolean obj_dafter_22_13
    b_dw_combat_finished
)

(script static boolean obj_dwarth_22_15
    b_dw_reinf_arrived
)

(script static boolean obj_dtanks_22_16
    (and
        (<= (ai_living_count "gr_cov_dw_wraiths") 2)
        b_dw_reinf_arrived
    )
)

(script static boolean obj_dwarth_22_17
    b_dw_reinf_arrived
)

(script static boolean obj_dwrait_23_8
    (volume_test_players "vol_dw_down")
)

(script static boolean obj_dwrait_23_11
    (>= s_dw_progression 40)
)

(script static boolean obj_dvehic_23_12
    (and
        (<= (ai_task_count "obj_dw_cov/wraith_back_left") 0)
        (not (volume_test_players "vol_dw_left"))
    )
)

(script static boolean obj_dvehic_23_13
    (>= s_dw_progression 25)
)

(script static boolean obj_dvehic_23_14
    (volume_test_players "vol_dw_down")
)

(script static boolean obj_dfollo_24_1
    b_gs_follow_player
)

(script static boolean obj_dmiddl_24_3
    (volume_test_players "vol_dw_down")
)

(script static boolean obj_dnear__24_5
    (>= s_dw_progression 30)
)

(script static boolean obj_dafter_24_6
    b_dw_reinf_arrived
)

(script static boolean obj_dafter_24_7
    (>= s_dw_progression 20)
)

(script static boolean obj_ddoor__24_8
    (volume_test_players "vol_dw_near_door")
)

(script static boolean obj_lguilt_25_2
    (>= s_lb_progression 40)
)

(script static boolean obj_lguilt_25_3
    (>= s_lb_progression 50)
)

(script static boolean obj_lguilt_25_4
    b_gs_follow_player
)

(script static boolean obj_lguilt_25_5
    (or
        b_lb_gs_open_door
        (>= s_lb_progression 20)
    )
)

(script static boolean obj_lguilt_25_6
    b_lb_lightbridge_on
)

(script static boolean obj_lguilt_25_8
    (>= s_lb_progression 10)
)

(script static boolean obj_lfar_s_25_9
    b_lb_lightbridge_on
)

(script static boolean obj_lconst_26_1
    (= s_lb_constructor_position 1)
)

(script static boolean obj_lconst_26_2
    (= s_lb_constructor_position 2)
)

(script static boolean obj_lconst_26_3
    (= s_lb_constructor_position 3)
)

(script static boolean obj_lconst_26_4
    (= s_lb_constructor_position 4)
)

(script static boolean obj_lconst_26_11
    b_lb_constructors_exit
)

(script static boolean obj_lconst_26_12
    b_lb_lightbridge_on
)

(script static boolean obj_bcanyo_27_0
    (<= s_bb_progression 40)
)

(script static boolean obj_bcanyo_27_1
    (and
        (<= s_bb_progression 10)
        (unit_in_vehicle "allies_bb_player_warthog/driver")
    )
)

(script static boolean obj_bcanyo_27_2
    (<= s_bb_progression 20)
)

(script static boolean obj_bcanyo_27_4
    (<= s_bb_progression 30)
)

(script static boolean obj_bcanyo_27_6
    (>= s_bb_progression 40)
)

(script static boolean obj_bentra_27_7
    (<= s_bb_progression 40)
)

(script static boolean obj_bentra_27_8
    (<= s_bb_progression 50)
)

(script static boolean obj_b3rd_f_27_16
    (<= s_bb_progression 70)
)

(script static boolean obj_b4th_f_27_19
    (>= s_bb_progression 70)
)

(script static boolean obj_bdefen_27_23
    (and
        (<= s_bb_progression 90)
        (or
            (not bb_scarab_spawned)
            (>= (ai_living_count "cov_bb_scarab") 1)
        )
    )
)

(script static boolean obj_bghost_27_29
    b_bb_ghosts_escort_wraiths
)

(script static boolean obj_bghost_27_30
    (volume_test_object "vol_bb_bottom_floor_left" "cov_bb_scarab")
)

(script static boolean obj_bghost_27_31
    (>= (ai_living_count "obj_bb_cov/2nd_floor_right") 2)
)

(script static boolean obj_bghost_27_32
    (>= (ai_living_count "obj_bb_cov/2nd_floor_left") 2)
)

(script static boolean obj_bghost_27_33
    (<= s_bb_position 2)
)

(script static boolean obj_bghost_27_34
    (>= (ai_living_count "obj_bb_cov/1st_floor_right") 2)
)

(script static boolean obj_bghost_27_35
    (>= (ai_living_count "obj_bb_cov/1st_floor_left") 2)
)

(script static boolean obj_bghost_27_36
    (<= s_bb_position 1)
)

(script static boolean obj_bghost_27_37
    (not bb_scarab_spawned)
)

(script static boolean obj_b1st_f_27_39
    (not b_bb_player_went_canyon)
)

(script static boolean obj_bghost_27_41
    (volume_test_object "vol_bb_bottom_floor_right" "cov_bb_scarab")
)

(script static boolean obj_bghost_27_42
    (<= s_bb_position 3)
)

(script static boolean obj_b1st_f_29_0
    (and
        (<= s_bb_progression 50)
        (>= (ai_task_count "obj_bb_cov/1st_floor") 2)
    )
)

(script static boolean obj_b2nd_f_29_1
    (and
        (<= s_bb_progression 60)
        (>= (ai_task_count "obj_bb_cov/2nd_floor") 2)
    )
)

(script static boolean obj_b3rd_f_29_2
    (and
        (<= s_bb_progression 70)
        (>= (ai_task_count "obj_bb_cov/3rd_floor") 2)
        b_bb_dropped_3rd_floor
    )
)

(script static boolean obj_biniti_29_4
    (and
        (not b_bb_phantom_retreat)
        (or
            (<= s_bb_progression 20)
            (not b_bb_wraith_dropped)
        )
    )
)

(script static boolean obj_bcanyo_29_5
    (<= s_bb_progression 30)
)

(script static boolean obj_b1st_f_30_9
    (>= s_bb_allies_progression 20)
)

(script static boolean obj_b2nd_f_30_10
    (>= s_bb_allies_progression 30)
)

(script static boolean obj_bentra_30_11
    (and
        (>= s_bb_progression 40)
        (<= (ai_task_count "obj_bb_cov/entrance_vehicle_1") 2)
    )
)

(script static boolean obj_b3rd_f_30_12
    (>= s_bb_allies_progression 40)
)

(script static boolean obj_b4th_f_30_16
    (>= s_bb_allies_progression 50)
)

(script static boolean obj_bbase_30_19
    (>= s_bb_allies_progression 60)
)

(script static boolean obj_b4th_f_30_22
    (<= (ai_living_count "cov_bb_scarab") 0)
)

(script static boolean obj_b4th_f_30_23
    (<= (ai_living_count "cov_bb_scarab") 0)
)

(script static boolean obj_b4th_f_30_25
    (<= (ai_living_count "cov_bb_scarab") 0)
)

(script static boolean obj_bcanyo_30_27
    (>= s_bb_allies_progression 10)
)

(script static boolean obj_bcanyo_30_28
    (= (ai_task_status "obj_bb_cov/canyon_ghost_1") ai_task_status_exhausted)
)

(script static boolean obj_bcanyo_30_30
    (= (ai_task_status "obj_bb_cov/canyon_ghost_0") ai_task_status_exhausted)
)

(script static boolean obj_bcanyo_30_31
    (<= (ai_task_count "obj_bb_cov/canyon_vehicle_only") 1)
)

(script static boolean obj_bcanyo_30_35
    (>= s_bb_allies_progression 15)
)

(script static boolean obj_bbase__31_0
    (and
        (<= (ai_living_count "cov_bb_scarab") 0)
        bb_scarab_spawned
    )
)

(script static boolean obj_b4th_f_31_1
    (and
        (<= (ai_task_count "obj_bb_cov/3rd_floor") 1)
        b_bb_dropped_3rd_floor
        (>= (ai_living_count "cov_bb_scarab") 0)
    )
)

(script static boolean obj_b3rd_f_31_2
    (<= (ai_task_count "obj_bb_cov/2nd_floor") 1)
)

(script static boolean obj_b2nd_f_31_3
    (and
        (<= (ai_task_count "obj_bb_cov/1st_floor") 1)
        (>= (ai_living_count "obj_bb_cov/2nd_floor_left") 1)
    )
)

(script static boolean obj_b1st_f_31_4
    (and
        (<= (ai_task_count "obj_bb_cov/entrance") 1)
        (>= (ai_living_count "obj_bb_cov/1st_floor_left") 1)
    )
)

(script static boolean obj_bentra_31_5
    (>= s_bb_progression 40)
)

(script static boolean obj_bcanyo_31_7
    (>= s_bb_progression 30)
)

(script static boolean obj_b1st_f_31_8
    (and
        (<= (ai_task_count "obj_bb_cov/entrance") 1)
        (>= (ai_living_count "obj_bb_cov/1st_floor_right") 1)
    )
)

(script static boolean obj_b2nd_f_31_9
    (and
        (<= (ai_task_count "obj_bb_cov/1st_floor") 1)
        (>= (ai_living_count "obj_bb_cov/2nd_floor_right") 1)
    )
)

(script static boolean obj_b4th_f_31_10
    (and
        (<= (ai_task_count "obj_bb_cov/3rd_floor") 1)
        b_bb_dropped_3rd_floor
        (>= (ai_living_count "cov_bb_scarab") 0)
    )
)

(script static boolean obj_bscara_32_2
    (volume_test_players "vol_bb_scarab_top")
)

(script static boolean obj_bscara_33_1
    (volume_test_players "vol_bb_base_back")
)

(script static boolean obj_bscara_33_2
    (volume_test_players "vol_bb_higher_floors")
)

(script static boolean obj_bbase__34_2
    (<= (ai_living_count "cov_bb_scarab") 0)
)

(script static boolean obj_aentra_35_1
    (<= s_abb_progression 5)
)

(script static boolean obj_atop_a_35_15
    (volume_test_players "vol_abb_near_top")
)

(script static boolean obj_aentra_36_1
    (and
        (<= (ai_task_count "obj_abb_cov/entrance_front") 0)
        (>= s_abb_progression 2)
    )
)

(script static boolean obj_aentra_36_2
    (and
        (<= (ai_task_count "obj_abb_cov/entrance_middle") 0)
        (>= s_abb_progression 5)
    )
)

(script static boolean obj_aramp_36_4
    (and
        (<= (ai_task_count "obj_abb_cov/entrance_back") 0)
        (>= s_abb_progression 5)
    )
)

(script static boolean obj_aramp__36_5
    (and
        (>= s_abb_progression 10)
        (<= (ai_living_count "gr_cov_bb_base") 0)
    )
)

(script static boolean obj_aramp__36_6
    (and
        (>= s_abb_progression 7)
        (<= (ai_task_count "obj_abb_cov/jackals_middle") 0)
        (<= (ai_task_count "obj_abb_cov/middle") 0)
    )
)

(script static boolean obj_aramp__36_7
    (<= (ai_task_count "obj_abb_cov/jackals_front") 0)
)

(script static boolean obj_apelic_36_9
    b_abb_pelican_marines_moving
)

(script static boolean obj_aarbit_36_12
    b_abb_pelican_marines_moving
)

(script static boolean obj_afollo_38_1
    b_gs_follow_player
)

(script static boolean obj_awork__38_2
    (>= s_abb_progression 1)
)

(script static boolean obj_fbefor_39_2
    (not b_f1_combat_started)
)

(script static boolean obj_fleft_40_0
    (volume_test_players "vol_f1_right")
)

(script static boolean obj_fwait_40_2
    b_f1_allies_wait
)

(script static boolean obj_fway_b_40_3
    b_f1_prepare_to_combat
)

(script static boolean obj_froom_40_4
    (and
        b_f1_combat_started
        (>= s_f1_progression 10)
    )
)

(script static boolean obj_farbit_40_5
    (and
        b_f1_prepare_to_combat
        (>= (ai_living_count "gr_cov_f1") 1)
        (>= (ai_living_count "allies_f1_mar") 1)
    )
)

(script static boolean obj_ffollo_40_6
    (>= s_f1_progression 30)
)

(script static boolean obj_fafter_40_7
    (<= (ai_living_count "gr_cov_f1") 0)
)

(script static boolean obj_fright_40_8
    (volume_test_players "vol_f1_left")
)

(script static boolean obj_finsid_41_1
    b_f1_gs_advance
)

(script static boolean obj_fpost__41_3
    (and
        (> (device_get_power "f1_entrance_door") 0.5)
        (<= (ai_living_count "gr_cov_f1") 0)
    )
)

(script static boolean obj_fstair_41_4
    (>= s_f1_progression 20)
)

(script static boolean obj_ffollo_41_5
    b_gs_follow_player
)

(script static boolean obj_ffollo_42_0
    (volume_test_players "vol_f2_advance_2")
)

(script static boolean obj_ffollo_42_1
    (or
        (volume_test_players "vol_f2_advance_3")
        (volume_test_players "vol_f2_advance_4")
    )
)

(script static boolean obj_ffollo_42_2
    (volume_test_players "vol_f2_advance_5")
)

(script static boolean obj_ffollo_42_3
    (volume_test_players "vol_f2_end_1st_floor")
)

(script static boolean obj_ffollo_42_4
    b_f2_combat_started
)

(script static boolean obj_farbit_42_6
    (<= (ai_combat_status "cov_f2_grt_pack") 1)
)

(script static boolean obj_farbit_42_7
    (>= s_f2_progression 20)
)

(script static boolean obj_farbit_42_8
    (>= s_f2_progression 40)
)

(script static boolean obj_farbit_42_9
    (>= s_f2_progression 50)
)

(script static boolean obj_ftemp__42_10
    (>= s_f2_progression 30)
)

(script static boolean obj_farbit_42_12
    (<= (ai_task_count "obj_f2_cov/front") 0)
)

(script static boolean obj_ffront_42_14
    (and
        b_f2_combat_started
        (<= (ai_task_count "obj_f2_cov/front") 0)
    )
)

(script static boolean obj_fafter_42_15
    (<= (ai_living_count "cov_f2_grt_pack") 0)
)

(script static boolean obj_ffront_43_1
    (or
        (<= s_f2_progression 30)
        (<= (ai_combat_status "cov_f2_grt_pack") 1)
    )
)

(script static boolean obj_fnot_i_43_4
    (<= (ai_combat_status "cov_f2_grt_pack") 2)
)

(script static boolean obj_ffollo_44_1
    b_gs_follow_player
)

(script static boolean obj_froom__44_3
    (>= s_f2_progression 40)
)

(script static boolean obj_froom__44_4
    (>= s_f2_progression 30)
)

(script static boolean obj_froom__44_5
    (and
        (>= s_f2_progression 40)
        b_f2_combat_started
    )
)

(script static boolean obj_fstair_44_6
    (>= s_f2_progression 50)
)

(script static boolean obj_ftermi_44_7
    (and
        (>= s_f2_progression 20)
        b_f2_gs_terminal
    )
)

(script static boolean obj_fpatro_45_0
    (<= (ai_combat_status "cov_f3_brt_pack") ai_combat_status_active)
)

(script static boolean obj_fjacka_45_5
    (< s_f3_p1_progression 17)
)

(script static boolean obj_fjacka_45_7
    (> (ai_living_count "cov_f3_brt_pack") 1)
)

(script static boolean obj_fwait__46_1
    (< s_f3_p1_progression 30)
)

(script static boolean obj_fback_47_5
    (<= (ai_living_count "cov_f3_brt_pack") 2)
)

(script static boolean obj_fafter_47_10
    (>= s_f3_p1_progression 30)
)

(script static boolean obj_fafter_47_11
    (>= s_f3_p1_progression 20)
)

(script static boolean obj_fafter_47_13
    b_f3_p1_int_combat_finished
)

(script static boolean obj_fexit__48_1
    (or
        (<= (ai_task_count "obj_f3_cov_p1/back") 0)
        (>= s_f3_p1_progression 20)
    )
)

(script static boolean obj_ffollo_48_2
    b_gs_follow_player
)

(script static boolean obj_fpart__48_3
    b_f3_p2_started
)

(script static boolean obj_fnear__48_4
    b_f3_p2_combat_finished
)

(script static boolean obj_fstair_48_5
    (>= s_f3_p2_progression 50)
)

(script static boolean obj_fbefor_49_0
    (<= s_f3_p1_progression 30)
)

(script static boolean obj_fnear__49_1
    (<= s_f3_p2_progression 0)
)

(script static boolean obj_fnear__49_2
    b_f3_p2_gs_guide
)

(script static boolean obj_fpart__49_4
    b_f3_p2_started
)

(script static boolean obj_ffollo_49_5
    b_gs_follow_player
)

(script static boolean obj_fbrt_c_51_0
    (<= s_f3_p2_progression 40)
)

(script static boolean obj_fright_51_8
    (volume_test_players "vol_f3_right")
)

(script static boolean obj_fleft_53_1
    (= true (volume_test_players "vol_f3_right"))
)

(script static boolean obj_fright_53_2
    (= true (volume_test_players "vol_f3_left"))
)

(script static boolean obj_fcomba_53_3
    b_f3_p2_combat_finished
)

(script static boolean obj_fback_54_0
    b_f3_p2_take_combat_outside
)

(script static boolean obj_ffront_55_1
    (and
        (<= (ai_living_count "cov_f4_brt_ambush") 0)
        (>= s_f4_progression 30)
    )
)

(script static boolean obj_fafter_55_2
    b_f4_fight_finished
)

(script static boolean obj_fbrute_56_0
    b_f4_enable_left
)

(script static boolean obj_fbrute_56_1
    b_f4_enable_right
)

(script static boolean obj_fprepa_56_3
    (or
        (volume_test_players "vol_f4_right_room")
        (< (ai_combat_status "cov_f4_brt_ambush") 4)
    )
)

(script static boolean obj_fbrute_56_9
    (and
        b_f4_enable_top
        b_f4_enable_right
    )
)

(script static boolean obj_fbrute_56_10
    (and
        b_f4_enable_top
        b_f4_enable_left
    )
)

(script static boolean obj_ffollo_58_0
    b_gs_follow_player
)

(script static boolean obj_fafter_58_4
    b_f4_fight_finished
)

(script static boolean obj_fjetpa_59_1
    (volume_test_players "vol_f5_right")
)

(script static boolean obj_fjetpa_59_2
    (volume_test_players "vol_f5_left")
)

(script static boolean obj_fchief_59_6
    b_f5_chieftain_charge
)

(script static boolean obj_fjetpa_59_8
    (>= s_f5_progression 15)
)

(script static boolean obj_fjetpa_59_9
    (volume_test_players "vol_f5_right")
)

(script static boolean obj_fjetpa_59_10
    (volume_test_players "vol_f5_left")
)

(script static boolean obj_fjetpa_59_12
    (volume_test_players "vol_f5_left")
)

(script static boolean obj_fjetpa_59_13
    (volume_test_players "vol_f5_right")
)

(script static boolean obj_fjetpa_59_14
    (<= (ai_task_count "obj_f5_cov/jetpack_combat_started") 0)
)

(script static boolean obj_fback_60_0
    (and
        b_f5_chieftain_charge
        (> (ai_living_count "cov_f5_brt_chieftain") 0)
    )
)

(script static boolean obj_fafter_60_2
    b_f5_combat_finished
)

(script static boolean obj_fbefor_60_3
    (< s_f5_progression 15)
)

(script static boolean obj_ffollo_61_0
    b_gs_follow_player
)

(script static boolean obj_fafter_61_1
    b_f5_combat_finished
)

(script static boolean obj_fleft_61_2
    (volume_test_players "vol_f5_left")
)

(script static boolean obj_fright_61_3
    (volume_test_players "vol_f5_right")
)

(script static boolean obj_ffollo_61_4
    b_gs_follow_player
)

(script static void 070_insertion_intro
    (unit_exit_vehicle (player0))
    (unit_exit_vehicle (player1))
    (unit_exit_vehicle (player2))
    (unit_exit_vehicle (player3))
    (ai_erase "gr_npc")
)

(script static void 070_intro_cinematic
    (cinematic_snap_to_black)
    (sleep 1)
    (if b_cinematic 
        (begin
            (if b_debug 
                (print "070la_waypoint_arrival"))
            (if (cinematic_skip_start) 
                (begin
                    (data_mine_set_mission_segment "070_la_waypoint_arrival")
                    (070la_waypoint_arrival)
                )
            )
            (cinematic_skip_stop)
            (070la_waypoint_arrival_cleanup)
        )
    )
)

(script static void ins_landing_zone
    (070_intro_cinematic)
    (fade_out 0.0 0.0 0.0 0)
    (cinematic_stop)
    (camera_control false)
    (if b_debug 
        (print "insertion point : landing zone"))
    (set g_insertion_index 1)
    (ai_dialogue_enable false)
    (wake background_bowls)
    (ai_place "allies_lz_pelican_0")
    (ai_place "allies_lz_marines_0")
    (ai_place "allies_lz_johnson")
    (ai_place "allies_lz_pelican_1")
    (ai_place "allies_b1_intro_marine")
    (ai_place "allies_lz_marine_1")
    (object_cannot_die (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") true)
    (ai_cannot_die "allies_lz_pelican_0/pilot" true)
    (object_cannot_take_damage (ai_vehicle_get "allies_lz_pelican_0/pilot"))
    (ai_cannot_die ai_fly_johnson true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") true)
    (object_cannot_die (ai_vehicle_get_from_starting_location "allies_lz_pelican_1/pilot") true)
    (object_cannot_take_damage (ai_vehicle_get "allies_lz_pelican_1/pilot"))
    (ai_cannot_die "allies_lz_pelican_1/pilot" true)
    (set ai_fly_johnson (object_get_ai (ai_get_object "allies_lz_johnson/johnson")))
    (set ai_fly_pelican_marines_0 (object_get_ai (ai_get_object "allies_lz_marines_0/0")))
    (set ai_fly_pelican_marines_1 (object_get_ai (ai_get_object "allies_lz_marines_0/1")))
    (set ai_fly_pelican_marines_2 (object_get_ai (ai_get_object "allies_lz_marines_0/2")))
    (set ai_fly_pelican_commander (object_get_ai (ai_get_object "allies_b1_intro_marine/sniper")))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_g (ai_actors ai_fly_johnson))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_p_l03 (ai_actors ai_fly_pelican_marines_0))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_p_l04 (ai_actors ai_fly_pelican_marines_1))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_p_l02 (ai_actors "allies_lz_marine_1/0"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_p_r02 (ai_actors "allies_lz_marine_1/1"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_p_r03 (ai_actors "allies_lz_marine_1/2"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_p_r05 (player0))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_0/pilot") pelican_p_l05 (player1))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_1/pilot") pelican_p_l03 (ai_actors ai_fly_pelican_commander))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_1/pilot") pelican_p_r03 (ai_actors ai_fly_pelican_marines_2))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_1/pilot") pelican_p_r05 (player2))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_lz_pelican_1/pilot") pelican_p_l05 (player3))
    (sleep 1)
    (unit_raise_weapon (player0) 1)
    (unit_raise_weapon (player1) 1)
    (unit_raise_weapon (player2) 1)
    (unit_raise_weapon (player3) 1)
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 15)
    (player_control_fade_in_all_input 1.0)
    (player_disable_movement true)
    (cinematic_fade_to_title)
)

(script static void ins_alpha
    (if b_debug 
        (print "switching zone sets..."))
    (switch_zone_set "070_010_011")
    (sleep 1)
    (unit_add_equipment (player0) "br_profile" true true)
    (unit_add_equipment (player1) "carbine_profile" true true)
    (unit_add_equipment (player2) "carbine_profile" true true)
    (unit_add_equipment (player3) "carbine_profile" true true)
    (sleep 1)
    (insertion_start)
    (070_insertion_intro)
    (if b_debug 
        (print "insertion point : alpha"))
    (object_teleport (player0) "flg_la_start_location_p0")
    (object_teleport (player1) "flg_la_start_location_p1")
    (object_teleport (player2) "flg_la_start_location_p2")
    (object_teleport (player3) "flg_la_start_location_p3")
    (set g_insertion_index 9)
    (set s_lz_progression 200)
    (set s_b1_progression 200)
    (set s_b2_progression 200)
    (set s_fp_progression 200)
    (set s_ex_progression 200)
    (set s_sd_progression 200)
    (set s_aw_progression 200)
    (set s_fl_progression 200)
    (wake 070_chapter_forward)
    (ai_place "allies_la_player_scorpion")
    (ai_place "allies_la_mar_on_foot")
    (ai_place "allies_la_scorpion_0")
    (ai_place "allies_la_scorpion_1")
    (ai_place "allies_la_warthog_0")
    (place_guilty_spark "la_guilty_spark/guilty")
    (set obj_fl_scorpion_0 (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank"))
    (set obj_fl_scorpion_1 (ai_vehicle_get_from_starting_location "allies_la_scorpion_0/driver"))
    (set obj_fl_scorpion_2 (ai_vehicle_get_from_starting_location "allies_la_scorpion_1/driver"))
    (set obj_fl_warthog (ai_vehicle_get_from_starting_location "allies_la_warthog_0/driver"))
    (sleep 1)
    (set s_gs_walkup_dist 5)
    (set s_gs_talking_dist 7)
    (set g_gs_1st_line 070mh_450)
    (set g_gs_2nd_line 070mk_150)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
    (ai_vehicle_enter_immediate "allies_la_mar_on_foot/0" (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank") scorpion_p_rf)
    (ai_vehicle_enter_immediate "allies_la_mar_on_foot/1" (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank") scorpion_p_lf)
    (ai_vehicle_enter_immediate "allies_la_mar_on_foot/2" (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank") scorpion_p_rb)
    (fl_create_frigate)
    (fl_replace_elevators)
    (sleep 1)
    (device_set_position_immediate "fl_frigate_midshaft" 0.755)
    (device_set_position_immediate "fl_frigate_frontshaft" 0.82)
    (device_set_position_immediate "fl_frigate_backshaft" 0.8)
    (object_create_folder "sce_fl_pathfinding")
    (object_destroy "aw_cov_watch_pod_1")
    (unit_kill "ex_cave_warthog")
    (unit_kill "ex_cave_mongoose")
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank") scorpion_d true)
    (wake 070_music_08)
    (wake 070bb_dialog)
    (set b_fl_briefing_finished true)
    (sleep 45)
    (fade_in 0.0 0.0 0.0 15)
)

(script static void ins_floor_1
    (if b_debug 
        (print "switching zone sets..."))
    (switch_zone_set "070_040_050_071")
    (sleep 1)
    (unit_add_equipment (player0) "br_profile" true true)
    (unit_add_equipment (player1) "carbine_profile" true true)
    (unit_add_equipment (player2) "carbine_profile" true true)
    (unit_add_equipment (player3) "carbine_profile" true true)
    (sleep 1)
    (insertion_start)
    (set b_070_music_12 true)
    (070_insertion_intro)
    (if b_debug 
        (print "insertion point : floor 1"))
    (object_teleport (player0) "flg_f1_start_location_p0")
    (object_teleport (player1) "flg_f1_start_location_p1")
    (object_teleport (player2) "flg_f1_start_location_p2")
    (object_teleport (player3) "flg_f1_start_location_p3")
    (set g_insertion_index 14)
    (set s_lz_progression 200)
    (set s_b1_progression 200)
    (set s_b2_progression 200)
    (set s_fp_progression 200)
    (set s_ex_progression 200)
    (set s_sd_progression 200)
    (set s_aw_progression 200)
    (set s_la_progression 200)
    (set s_dw_progression 200)
    (set s_lb_progression 200)
    (set s_bb_progression 200)
    (set s_abb_progression 200)
    (objective_1_set)
    (objective_1_clear)
    (objective_2_set)
    (objective_2_clear)
    (objective_3_set)
    (place_arbiter "allies_f1_arbiter/arbiter")
    (ai_place "allies_f1_mar")
    (place_guilty_spark "f1_guilty_spark/guilty")
    (set ai_abb_pelican_marines_0 "allies_f1_mar/0")
    (set ai_abb_pelican_marines_1 "allies_f1_mar/1")
    (wake 070_chapter_real_men)
    (sleep 45)
    (fade_in 0.0 0.0 0.0 15)
)

(script static void start
    (fade_out 0.0 0.0 0.0 0)
    (cond
        ((= (game_insertion_point_get) 0)
            (ins_landing_zone)
        )
        ((= (game_insertion_point_get) 1)
            (ins_alpha)
        )
        ((= (game_insertion_point_get) 2)
            (ins_floor_1)
        )
    )
)

(script startup void mission_waste
    (fade_out 0.0 0.0 0.0 0)
    (ai_allegiance player human)
    (ai_allegiance human player)
    (ai_allegiance guilty player)
    (ai_allegiance guilty prophet)
    (ai_allegiance guilty human)
    (ai_allegiance guilty sentinel)
    (ai_allegiance guilty covenant)
    (ai_allegiance player guilty)
    (ai_allegiance prophet guilty)
    (ai_allegiance human guilty)
    (ai_allegiance sentinel guilty)
    (ai_allegiance covenant guilty)
    (ai_allegiance sentinel human)
    (ai_allegiance human sentinel)
    (ai_allegiance sentinel player)
    (ai_allegiance player sentinel)
    (ai_allegiance sentinel covenant)
    (ai_allegiance covenant sentinel)
    (ai_allegiance player covenant)
    (ai_allegiance covenant player)
    (ai_allegiance human covenant)
    (ai_allegiance covenant human)
    (campaign_metagame_time_pause true)
    (game_can_use_flashlights true)
    (chud_show_fire_grenades false)
    (object_function_set 2 1.0)
    (objectives_clear)
    (print_difficulty)
    (wake 070_cleanup)
    (wake 070_monitor_progression)
    (wake gs_camera_bounds)
    (wake 070_manage_swap_volumes)
    (wake 070_force_active_ai)
    (wake 070_award_primary_skull)
    (wake 070_award_secondary_skull)
    (if (> (player_count) 0) 
        (start) (begin
            (fade_in 0.0 0.0 0.0 0)
            (sleep_forever gs_camera_bounds)
            (gs_camera_bounds_off)
        )
    )
    (sleep_until (>= g_insertion_index 1))
    (if (<= g_insertion_index 1) 
        (wake landing_zone))
    (sleep_until 
        (or
            (and
                (volume_test_players "vol_b1_cave_0")
                (or
                    b_lz_pelican_0_arrived
                    b_lz_pelican_1_arrived
                )
            )
            (>= g_insertion_index 2)
        ) 
    1)
    (if (<= g_insertion_index 2) 
        (wake bowl_1))
    (player_disable_movement false)
    (campaign_metagame_time_pause false)
    (sleep_until 
        (or
            (volume_test_players "vol_b2_cave_0")
            (>= g_insertion_index 3)
        ) 
    1)
    (if (<= g_insertion_index 3) 
        (wake bowl_2))
    (sleep_until 
        (or
            (volume_test_players "vol_fp_cave")
            (>= g_insertion_index 4)
        ) 
    1)
    (if (<= g_insertion_index 4) 
        (wake forerunner_passage))
    (sleep_until 
        (or
            (volume_test_players "vol_ex_start")
            (>= g_insertion_index 5)
        ) 
    1)
    (if (<= g_insertion_index 5) 
        (wake exploration))
    (if (= g_insertion_index 5) 
        (wake background_exploration))
    (sleep_until 
        (or
            (volume_test_players "vol_sd_begin")
            (volume_test_players "vol_sd_begin_catch_all")
            (>= g_insertion_index 6)
        ) 
    1)
    (if (<= g_insertion_index 6) 
        (wake sentinel_defense))
    (if (= g_insertion_index 6) 
        (wake background_exploration))
    (sleep_until 
        (or
            (volume_test_players "vol_aw_start")
            (>= g_insertion_index 7)
        ) 
    1)
    (if (<= g_insertion_index 7) 
        (wake antiair_wraiths))
    (if (= g_insertion_index 7) 
        (wake background_exploration))
    (sleep_until 
        (or
            (and
                (<= (ai_living_count "gr_cov_aw_aa_wraiths") 0)
                (<= (ai_living_count "gr_cov_aw_wraiths_mortar") 0)
                (>= s_aw_progression 20)
            )
            (>= g_insertion_index 8)
        ) 
    1)
    (sleep_until 
        (or
            (and
                (<= (ai_living_count "gr_cov_aw_ghosts") 0)
                b_aw_spawned_ghosts
                (<= (ai_living_count "cov_aw_fort_pack") 0)
                (<= (ai_living_count "cov_aw_fort_turrets") 0)
            )
            (>= g_insertion_index 8)
        ) 
    1 5400)
    (if (<= g_insertion_index 8) 
        (wake frigate_landing))
    (sleep_until 
        (or
            (and
                b_la_can_start
                (volume_test_players "vol_la_before_cave")
            )
            b_fl_chief_in_vehicle
            (>= g_insertion_index 9)
        ) 
    1)
    (if (<= g_insertion_index 9) 
        (wake lead_the_army))
    (sleep_until 
        (or
            (volume_test_players "vol_dw_after_trench")
            (>= g_insertion_index 10)
        ) 
    1)
    (if (<= g_insertion_index 10) 
        (wake defend_wall))
    (sleep_until 
        (or
            (volume_test_players "vol_lb_begin")
            (>= g_insertion_index 11)
        ) 
    1)
    (if (<= g_insertion_index 11) 
        (wake lightbridge))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_start")
            (>= g_insertion_index 12)
        ) 
    1)
    (if (<= g_insertion_index 12) 
        (wake big_battle))
    (sleep_until 
        (or
            (and
                (<= (ai_task_count "obj_abb_cov/defend_base") 7)
                (<= (ai_living_count "cov_bb_scarab") 0)
                bb_scarab_spawned
                (>= s_bb_progression 80)
            )
            (>= g_insertion_index 13)
        ) 
    1)
    (if (<= g_insertion_index 13) 
        (wake after_big_battle))
    (sleep_until 
        (or
            b_abb_pelican_marines_moving
            (>= g_insertion_index 14)
        ) 
    1)
    (if (<= g_insertion_index 14) 
        (wake floor_1))
    (if (= g_insertion_index 14) 
        (set b_f1_start_now true))
    (sleep_until 
        (or
            (volume_test_players "vol_f2_start")
            (>= g_insertion_index 15)
        ) 
    1)
    (if (<= g_insertion_index 15) 
        (wake floor_2))
    (if (= g_insertion_index 15) 
        (wake background_shaft))
    (sleep_until 
        (or
            (volume_test_players "vol_f3_start")
            (>= g_insertion_index 16)
        ) 
    1)
    (if (<= g_insertion_index 16) 
        (wake floor_3))
    (if (= g_insertion_index 16) 
        (wake background_shaft))
    (sleep_until 
        (or
            (volume_test_players "vol_f4_start")
            (>= g_insertion_index 17)
        ) 
    1)
    (if (<= g_insertion_index 17) 
        (wake floor_4))
    (if (= g_insertion_index 17) 
        (wake background_shaft))
    (sleep_until 
        (or
            (and
                (objects_can_see_flag (players) "flg_f5_viewpoint" 30.0)
                (volume_test_players "vol_f5_start")
            )
            (volume_test_players "vol_f5_stairs_right")
            (volume_test_players "vol_f5_stairs_left")
            (>= g_insertion_index 18)
        ) 
    1)
    (if (<= g_insertion_index 18) 
        (wake floor_5))
    (if (= g_insertion_index 18) 
        (begin
            (wake background_shaft)
            (ai_place "cov_f5_brt_chieftain")
            (sleep 1)
            (ai_teleport "cov_f5_brt_chieftain" "pts_f5_chieftain_retreat/p1")
        )
    )
)

(script command_script void cs_end
    (sleep 1)
)

(script command_script void cs_do_nothing
    (cs_enable_looking true)
    (sleep_forever)
)

(script command_script void cs_do_nothing_move
    (cs_enable_looking true)
    (cs_enable_moving true)
    (sleep_forever)
)

(script command_script void cs_shoot_dont_move
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_shoot true)
    (sleep_forever)
)

(script command_script void cs_draw_weapon
    (sleep (random_range 0 45))
    (cs_draw)
    (sleep 1)
)

(script command_script void cs_run
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_draw)
    (cs_movement_mode ai_movement_combat)
    (cs_abort_on_alert true)
    (sleep 600)
    (sleep_forever)
)

(script command_script void cs_stay_in_turret
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until (not (unit_in_vehicle ai_current_actor)))
)

(script command_script void cs_fly_with_boost
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_shoot true)
    (cs_vehicle_boost true)
    (sleep_forever)
)

(script command_script void cs_guilty_spark_lead_player
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_dialogue true)
    (set b_gs_said_1st_line false)
    (set b_gs_said_2nd_line false)
    (sleep 300)
    (sleep_until 
        (begin
            (set b_gs_follow_player true)
            (sleep_until 
                (and
                    (<= (objects_distance_to_object (players) ai_current_actor) s_gs_walkup_dist)
                    (objects_can_see_object (players) ai_current_actor 40.0)
                    (not b_playing_dialogue)
                ) 
            5 1200)
            (set b_gs_follow_player false)
            (if (<= (objects_distance_to_object (players) ai_current_actor) s_gs_talking_dist) 
                (begin
                    (cs_face_player true)
                    (cs_enable_moving false)
                    (if (< (random_range 0 100) 50) 
                        (if (not b_gs_said_1st_line) 
                            (begin
                                (cs_enable_dialogue false)
                                (sleep 15)
                                (if b_dialogue 
                                    (print "guilty: g_gs_1st_line"))
                                (cs_play_line g_gs_1st_line)
                                (set b_gs_said_1st_line true)
                                (cs_enable_dialogue true)
                            ) (sleep 60)) (if (not b_gs_said_2nd_line) 
                            (begin
                                (cs_enable_dialogue false)
                                (sleep 15)
                                (if b_dialogue 
                                    (print "guilty: g_gs_2nd_line"))
                                (cs_play_line g_gs_2nd_line)
                                (set b_gs_said_2nd_line true)
                                (cs_enable_dialogue true)
                            ) (sleep 60))
                    )
                    (cs_enable_moving true)
                    (cs_face_player false)
                )
            )
            (sleep 600)
            false
        )
    )
)

(script dormant void 070_cleanup
    (sleep_until (>= s_ex_progression 30) 10)
    (landing_zone_cleanup)
    (sleep 5)
    (bowl_1_cleanup)
    (sleep 5)
    (bowl_2_cleanup)
    (sleep 5)
    (background_bowls_cleanup)
    (sleep_until 
        (or
            b_fl_frigate_arrives
            (> s_la_progression 0)
        )
    )
    (add_recycling_volume "vol_la_recycle_cave" 5 15)
    (sleep_until (> s_la_progression 0) 10)
    (forerunner_passage_cleanup)
    (sleep 5)
    (exploration_cleanup)
    (sleep 5)
    (sentinel_defense_cleanup)
    (sleep_until (>= s_lb_progression 15) 10)
    (antiair_wraiths_cleanup)
    (sleep 5)
    (frigate_landing_cleanup)
    (sleep 5)
    (lead_the_army_cleanup)
    (sleep_until (>= s_lb_progression 15) 10)
    (defend_wall_cleanup)
    (sleep 5)
    (background_exploration_cleanup)
    (sleep_until (> s_bb_progression 50) 10)
    (lightbridge_cleanup)
    (sleep_until (> s_f1_progression 10) 10)
    (big_battle_cleanup)
    (sleep 5)
    (after_big_battle_cleanup)
    (sleep_until (> s_f3_p2_progression 0) 10)
    (floor_1_cleanup)
    (sleep 5)
    (floor_2_cleanup)
    (sleep_until 
        (and
            b_f5_combat_finished
            (= (current_zone_set_fully_active) 12)
        ) 
    10)
    (floor_3_cleanup)
    (sleep 5)
    (floor_4_cleanup)
)

(script dormant void 070_monitor_progression
    (kill_volume_disable "kill_volume_f5_right")
    (kill_volume_disable "kill_volume_f5_left")
    (kill_volume_disable "kill_volume_f5_back")
    (sleep_until (>= s_ex_progression 10) 10)
    (sleep_until (>= s_ex_progression 30) 10)
    (shut_door_forever_immediate "fp_entrance_door")
    (sleep 1)
    (if (<= g_insertion_index 5) 
        (volume_teleport_players_not_inside "vol_ex_teleport" "flg_ex_teleport"))
    (sleep_until 
        (or
            (volume_test_players "vol_sd_begin_catch_all")
            (>= s_ex_progression 55)
        ) 
    10)
    (if (<= g_insertion_index 5) 
        (begin
            (if (game_is_cooperative) 
                (begin
                    (teleport_players_in_vehicle "vol_ex_teleport_3" "flg_ex_teleport_3_0" "flg_ex_teleport_3_1" "flg_ex_teleport_3_2" "flg_ex_teleport_3_3")
                    (sleep 1)
                    (volume_teleport_players_not_inside "vol_ex_teleport_3" "flg_ex_teleport_3")
                )
            )
            (ai_kill "gr_cov_ex_p1")
            (ai_kill "gr_cov_ex_p2")
        )
    )
    (sleep_until (>= s_ex_progression 65) 10)
    (if (<= g_insertion_index 5) 
        (begin
            (if (game_is_cooperative) 
                (begin
                    (teleport_players_in_vehicle "vol_ex_teleport_2" "flg_ex_teleport_2_0" "flg_ex_teleport_2_1" "flg_ex_teleport_2_2" "flg_ex_teleport_2_3")
                    (sleep 1)
                    (volume_teleport_players_not_inside "vol_ex_teleport_2" "flg_ex_teleport_2")
                )
            )
            (ai_kill "gr_cov_sd")
            (ai_kill "gr_cov_ex_p3")
        )
    )
    (sleep_until 
        (or
            (>= s_la_progression 10)
            b_fl_frigate_arrives
        ) 
    10)
    (shut_door_forever_immediate "fp_exit_door")
    (sleep_until (>= s_lb_progression 15) 10)
    (sleep_forever dw_manage_jitter_door)
    (shut_door_forever_immediate "ex_wall_door")
    (sleep 1)
    (if (<= g_insertion_index 11) 
        (begin
            (device_set_position_immediate "lb_left_large_door" 1.0)
            (volume_teleport_players_not_inside "vol_lb_teleport" "flg_lb_teleport")
            (wake lb_teleport_allies)
            (sleep 150)
            (ai_disposable "gr_allies_before_fl" true)
            (ai_disposable "gr_allies_la" true)
            (ai_disposable "gr_allies_dw" true)
        )
    )
    (sleep_until (>= s_lb_progression 50) 10)
    (shut_door_forever_immediate "lb_guardian_door")
    (sleep 1)
    (if (<= g_insertion_index 11) 
        (begin
            (volume_teleport_players_not_inside "vol_lb_teleport_2" "flg_lb_teleport_2")
            (ai_erase "gr_for_lb")
            (ai_erase "allies_lb_warthog_0")
            (ai_braindead "allies_lb_scorpion_0" true)
            (ai_braindead "allies_lb_scorpion_1" true)
            (ai_braindead "allies_lb_scorpion_2" true)
        )
    )
    (sleep_until (>= s_bb_progression 10) 10)
    (if (<= g_insertion_index 12) 
        (begin
            (ai_teleport "allies_bb_warthog_entrance_0" "pts_bb_warthog_intro/p0")
            (ai_teleport "allies_bb_warthog_entrance_1" "pts_bb_warthog_intro/p1")
        )
    )
    (sleep_until (>= s_bb_progression 30) 10)
    (if (<= g_insertion_index 12) 
        (begin
            (ai_braindead "gr_marines" false)
            (bb_teleport_scorpions)
        )
    )
    (sleep_until (>= s_bb_progression 50) 10)
    (shut_door_forever_immediate "bb_player_door")
    (sleep 1)
    (if (<= g_insertion_index 12) 
        (begin
            (volume_teleport_players_not_inside "vol_bb_all" "flg_bb_teleport_players")
        )
    )
    (sleep_until (>= s_f1_progression 10) 10)
    (kill_volume_disable "kill_volume_bb_0")
    (kill_volume_disable "kill_volume_bb_1")
    (sleep_until (> s_f3_p1_progression 0) 10)
    (shut_door_forever_immediate "f2_door")
    (sleep 1)
    (if (<= g_insertion_index 16) 
        (begin
            (volume_teleport_players_not_inside "vol_f2_all" "flg_f3_start_location_p0")
            (wake f3_teleport_allies)
        )
    )
    (sleep_until b_f3_p2_started 10)
    (reactivate_door "f3_door_1")
    (device_set_never_appears_locked "f3_door_2" false)
    (shut_door_forever_immediate "f3_door_2")
    (sleep_until 
        (or
            (> s_f5_progression 0)
            b_f5_has_started
        ) 
    10)
    (shut_door_forever_immediate "f3_door_outside")
    (device_set_never_appears_locked "f3_door_outside" false)
    (sleep 1)
    (if (<= g_insertion_index 17) 
        (begin
            (volume_teleport_players_not_inside "vol_f5_teleport" "flg_f5_teleport")
        )
    )
    (sleep_until 
        (or
            (<= (ai_living_count "obj_f5_cov") 4)
            b_f5_combat_finished
        )
    )
    (f5_teleport_players_not_outside)
    (sleep 1)
    (prepare_to_switch_to_zone_set "070_080")
    (sleep 60)
    (kill_volume_enable "kill_volume_f5_right")
    (kill_volume_enable "kill_volume_f5_left")
    (kill_volume_enable "kill_volume_f5_back")
    (ai_erase_inactive "gr_covenants" 0)
    (sleep_until b_f5_combat_finished 1)
    (kill_volume_disable "kill_volume_f5_right")
    (kill_volume_disable "kill_volume_f5_left")
    (kill_volume_disable "kill_volume_f5_back")
    (switch_zone_set "070_080")
)

(script dormant void 070_manage_swap_volumes
    (zone_set_trigger_volume_enable "zone_set:070_010_020:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:070_010_020:*" false)
    (zone_set_trigger_volume_enable "zone_set:070_005_010:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:070_005_010:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:070_060_070_080_071" false)
    (zone_set_trigger_volume_enable "zone_set:070_060_070_080_071" false)
    (zone_set_trigger_volume_enable "zone_set:070_010:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:070_080" false)
    (zone_set_trigger_volume_enable "zone_set:070_080" false)
    (sleep_until (>= s_b2_progression 30))
    (zone_set_trigger_volume_enable "zone_set:070_000_005" false)
    (sleep_until (>= s_ex_progression 30))
    (zone_set_trigger_volume_enable "zone_set:070_005_010:*" true)
    (zone_set_trigger_volume_enable "begin_zone_set:070_005_010:*" true)
    (zone_set_trigger_volume_enable "zone_set:070_000_005_010" false)
    (zone_set_trigger_volume_enable "begin_zone_set:070_000_005_010" false)
    (sleep_until (>= s_la_progression 10) 10)
    (zone_set_trigger_volume_enable "zone_set:070_010_020:*" true)
    (zone_set_trigger_volume_enable "begin_zone_set:070_010_020:*" true)
    (zone_set_trigger_volume_enable "zone_set:070_005_010:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:070_005_010:*" false)
    (zone_set_trigger_volume_enable "zone_set:070_010:*" true)
    (zone_set_trigger_volume_enable "begin_zone_set:070_010_011:*" false)
    (sleep_until b_f3_p2_started 10)
    (zone_set_trigger_volume_enable "zone_set:070_050_060_080_071" false)
    (zone_set_trigger_volume_enable "begin_zone_set:070_050_060_080_071" false)
    (zone_set_trigger_volume_enable "zone_set:070_060_070_080_071" true)
    (zone_set_trigger_volume_enable "begin_zone_set:070_060_070_080_071" true)
    (prepare_to_switch_to_zone_set "070_060_070_080_071")
)

(script dormant void 070_force_active_ai
    (sleep_until (>= s_ex_progression 10))
    (ai_force_active "allies_ex_on_foot_0" true)
    (sleep_until (>= s_ex_progression 30))
    (ai_force_active "gr_allies_ex" true)
    (sleep_until (>= s_ex_progression 60))
    (ai_force_active "allies_ex_on_foot_0" false)
    (ai_force_active "gr_allies_ex" false)
    (sleep_until (>= s_la_progression 30))
    (ai_force_active "gr_allies_la" true)
    (ai_force_active "allies_fl_pelican" true)
    (sleep_until (>= s_la_progression 90))
    (ai_force_active "gr_allies_la" false)
)

(script static void reactivate_door (device machine_door)
    (device_operates_automatically_set machine_door true)
    (device_set_power machine_door 1.0)
)

(script continuous void 070_unload_zone_set
    (sleep_until (!= (current_zone_set) g_current_zone_set) 1)
    (cond
        ((= (current_zone_set) 3)
            (begin
                (if b_debug 
                    (print "070_005_010 unload"))
            )
        )
        ((= (current_zone_set) 4)
            (begin
                (if b_debug 
                    (print "070_010_011 unload"))
                (shut_door_forever_immediate "fp_exit_door")
            )
        )
        ((= (current_zone_set) 5)
            (begin
                (if b_debug 
                    (print "070_010_020 unload"))
                (shut_door_forever_immediate "fp_exit_door")
                (if b_fl_frigate_arrived 
                    (begin
                        (fl_remove_frigate)
                        (object_create "fl_frigate_low_rez")
                    )
                )
            )
        )
        ((= (current_zone_set) 6)
            (begin
                (if b_debug 
                    (print "070_010 unload"))
                (shut_door_forever_immediate "fp_exit_door")
            )
        )
        ((= (current_zone_set) 7)
            (begin
                (if b_debug 
                    (print "070_020_030 unload"))
                (shut_door_forever_immediate "ex_wall_door")
            )
        )
        ((= (current_zone_set) 9)
            (begin
                (if b_debug 
                    (print "070_040_050_071 unload"))
                (shut_door_forever_immediate "f3_door_2")
            )
        )
        ((= (current_zone_set) 10)
            (begin
                (if b_debug 
                    (print "070_050_060_080_071 unload"))
                (shut_door_forever_immediate "f2_entrance_door")
                (shut_door_forever_immediate "f4_entrance_door")
            )
        )
        ((= (current_zone_set) 11)
            (begin
                (if b_debug 
                    (print "070_060_070_080_071 unload"))
                (shut_door_forever_immediate "f3_door_2")
            )
        )
        ((= (current_zone_set) 12)
            (begin
                (if b_debug 
                    (print "070_080 unload"))
                (shut_door_forever_immediate "f4_door")
            )
        )
    )
    (set g_current_zone_set (current_zone_set))
)

(script continuous void 070_load_zone_set
    (sleep_until (!= (current_zone_set_fully_active) g_current_active_zone_set) 1)
    (cond
        ((= (current_zone_set_fully_active) 3)
            (begin
                (if b_debug 
                    (print "070_005_010 load"))
                (reactivate_door "fp_exit_door")
            )
        )
        ((= (current_zone_set_fully_active) 4)
            (begin
                (if b_debug 
                    (print "070_010_011 load"))
                (if b_fl_frigate_arrived 
                    (begin
                        (object_destroy "fl_frigate_low_rez")
                        (fl_create_frigate)
                    )
                )
            )
        )
        ((= (current_zone_set_fully_active) 5)
            (begin
                (if b_debug 
                    (print "070_010_020 load"))
            )
        )
        ((= (current_zone_set_fully_active) 6)
            (begin
                (if b_debug 
                    (print "070_010 load"))
                (object_destroy "ex_crashed_pelican")
                (object_create "ex_crashed_pelican")
                (object_destroy_folder "crt_crashed_pelican")
                (object_create_folder "crt_crashed_pelican")
            )
        )
        ((= (current_zone_set_fully_active) 7)
            (begin
                (if b_debug 
                    (print "070_020_030 load"))
                (reactivate_door "bb_player_door")
                (object_create_anew "waterfall")
            )
        )
        ((= (current_zone_set_fully_active) 9)
            (begin
                (if b_debug 
                    (print "070_040_050_071 load"))
                (reactivate_door "f2_entrance_door")
            )
        )
        ((= (current_zone_set_fully_active) 10)
            (begin
                (if b_debug 
                    (print "070_050_060_080_071 load"))
                (reactivate_door "f2_stairway")
                (reactivate_door "f3_door_2")
                (object_create_anew "waterfall")
            )
        )
        ((= (current_zone_set_fully_active) 11)
            (begin
                (if b_debug 
                    (print "070_060_070_080_071 load"))
                (reactivate_door "f3_door_outside")
                (reactivate_door "f4_entrance_door")
                (object_create_anew "waterfall")
            )
        )
        ((= (current_zone_set_fully_active) 12)
            (begin
                (if b_debug 
                    (print "070_080 load"))
                (object_create_anew "waterfall")
            )
        )
    )
    (set g_current_active_zone_set (current_zone_set_fully_active))
)

(script static void kill_players_in_volume (trigger_volume vol_current)
    (if (volume_test_object vol_current (player0)) 
        (unit_kill (player0)))
    (if (volume_test_object vol_current (player1)) 
        (unit_kill (player1)))
    (if (volume_test_object vol_current (player2)) 
        (unit_kill (player2)))
    (if (volume_test_object vol_current (player3)) 
        (unit_kill (player3)))
)

(script static void place_guilty_spark (ai ai_starting_location)
    (ai_place ai_starting_location)
    (sleep 1)
    (set obj_guilty_spark (ai_get_object ai_starting_location))
    (ai_cannot_die "gr_guilty_spark" true)
)

(script static void place_arbiter (ai ai_starting_location)
    (if (not (game_is_cooperative)) 
        (begin
            (ai_place ai_starting_location)
            (sleep 1)
            (set obj_arbiter (ai_get_object ai_starting_location))
        )
    )
)

(script static void migrate_arbiter (ai ai_from_squad, ai ai_to_squad)
    (ai_resurrect obj_arbiter)
    (sleep 1)
    (ai_migrate ai_from_squad ai_to_squad)
)

(script static boolean player_in_a_vehicle
    (or
        (unit_in_vehicle (player0))
        (unit_in_vehicle (player1))
        (unit_in_vehicle (player2))
        (unit_in_vehicle (player3))
    )
)

(script static void get_player_vehicle (unit passed_player)
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "allies_ex_warthog_1/warthog") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "allies_ex_warthog_1/warthog")))
    (if (vehicle_test_seat veh_mauler_0 "" passed_player) 
        (set obj_player_vehicle veh_mauler_0))
    (if (vehicle_test_seat veh_mauler_1 "" passed_player) 
        (set obj_player_vehicle veh_mauler_1))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_ex_search_brutes_0/chopper") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_ex_search_brutes_0/chopper")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_ex_search_brutes_1/chopper") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_ex_search_brutes_1/chopper")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_ex_search_brutes_2/driver") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_ex_search_brutes_2/driver")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_ex_search_grunts_0/ghost") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_ex_search_grunts_0/ghost")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_ex_search_grunts_1/ghost") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_ex_search_grunts_1/ghost")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_ex_search_grunts_3/ghost") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_ex_search_grunts_3/ghost")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "allies_ex_mongoose_0/mongoose_0") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_0/mongoose_0")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "allies_ex_mongoose_1/mongoose_1") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_1/mongoose_1")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_sd_chopper_0/chopper") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_sd_chopper_0/chopper")))
    (if (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_sd_chopper_1/chopper") "" passed_player) 
        (set obj_player_vehicle (ai_vehicle_get_from_starting_location "cov_sd_chopper_1/chopper")))
)

(script static void teleport_players_in_vehicle (trigger_volume vol_teleport, cutscene_flag flg_player_0, cutscene_flag flg_player_1, cutscene_flag flg_player_2, cutscene_flag flg_player_3)
    (if 
        (and
            (not (volume_test_object vol_teleport (player0)))
            (unit_in_vehicle (player0))
        ) 
            (begin
                (get_player_vehicle (player0))
                (object_teleport obj_player_vehicle flg_player_0)
            )
    )
    (if 
        (and
            (not (volume_test_object vol_teleport (player1)))
            (unit_in_vehicle (player1))
        ) 
            (begin
                (get_player_vehicle (player1))
                (object_teleport obj_player_vehicle flg_player_1)
            )
    )
    (if 
        (and
            (not (volume_test_object vol_teleport (player2)))
            (unit_in_vehicle (player2))
        ) 
            (begin
                (get_player_vehicle (player2))
                (object_teleport obj_player_vehicle flg_player_2)
            )
    )
    (if 
        (and
            (not (volume_test_object vol_teleport (player3)))
            (unit_in_vehicle (player3))
        ) 
            (begin
                (get_player_vehicle (player3))
                (object_teleport obj_player_vehicle flg_player_3)
            )
    )
)

(script static boolean player_in_a_vehicle_with_ai
    (or
        (and
            (unit_in_vehicle (player0))
            (> (ai_in_vehicle_count (ai_player_get_vehicle_squad (player0))) 0)
        )
        (and
            (unit_in_vehicle (player1))
            (> (ai_in_vehicle_count (ai_player_get_vehicle_squad (player1))) 0)
        )
        (and
            (unit_in_vehicle (player2))
            (> (ai_in_vehicle_count (ai_player_get_vehicle_squad (player2))) 0)
        )
        (and
            (unit_in_vehicle (player3))
            (> (ai_in_vehicle_count (ai_player_get_vehicle_squad (player3))) 0)
        )
    )
)

(script static ai get_ai_in_player_vehicle
    (if (player_in_a_vehicle_with_ai) 
        (cond
            ((unit_in_vehicle (player0))
                (set ai_return_squad (ai_player_get_vehicle_squad (player0)))
            )
            ((unit_in_vehicle (player1))
                (set ai_return_squad (ai_player_get_vehicle_squad (player1)))
            )
            ((unit_in_vehicle (player2))
                (set ai_return_squad (ai_player_get_vehicle_squad (player2)))
            )
            ((unit_in_vehicle (player3))
                (set ai_return_squad (ai_player_get_vehicle_squad (player3)))
            )
        )
    )
    ai_return_squad
)

(script static ai get_ai_not_in_vehicle (ai passed_squad_group)
    (set ai_return_squad passed_squad_group)
    (set s_list_count 0)
    (set s_list_index 0)
    (set ol_unit_list passed_squad_group)
    (set s_list_count (list_count ol_unit_list))
    (sleep_until 
        (begin
            (set obj_current_unit (unit (list_get ol_unit_list s_list_index)))
            (if (not (unit_in_vehicle (unit obj_current_unit))) 
                (begin
                    (set ai_return_squad (object_get_ai obj_current_unit))
                    (set s_list_index s_list_count)
                )
            )
            (set s_list_index (+ s_list_index 1.0))
            (> s_list_index s_list_count)
        ) 
    1)
    ai_return_squad
)

(script static boolean player_notice_object (trigger_volume vol_test, object obj_test)
    (or
        (and
            (volume_test_object vol_test (player0))
            (objects_can_see_object (player0) obj_test 30.0)
        )
        (and
            (volume_test_object vol_test (player1))
            (objects_can_see_object (player1) obj_test 30.0)
        )
        (and
            (volume_test_object vol_test (player2))
            (objects_can_see_object (player2) obj_test 30.0)
        )
        (and
            (volume_test_object vol_test (player3))
            (objects_can_see_object (player3) obj_test 30.0)
        )
    )
)

(script static boolean player_notice_flag (trigger_volume vol_test, cutscene_flag flg_test)
    (or
        (and
            (volume_test_object vol_test (player0))
            (objects_can_see_flag (player0) flg_test 30.0)
        )
        (and
            (volume_test_object vol_test (player1))
            (objects_can_see_flag (player1) flg_test 30.0)
        )
        (and
            (volume_test_object vol_test (player2))
            (objects_can_see_flag (player2) flg_test 30.0)
        )
        (and
            (volume_test_object vol_test (player3))
            (objects_can_see_flag (player3) flg_test 30.0)
        )
    )
)

(script static boolean any_player_dead
    (or
        (< (object_get_health (player0)) 0.0)
        (and
            (>= (game_coop_player_count) 2)
            (< (object_get_health (player1)) 0.0)
        )
        (and
            (>= (game_coop_player_count) 3)
            (< (object_get_health (player2)) 0.0)
        )
        (and
            (>= (game_coop_player_count) 4)
            (< (object_get_health (player3)) 0.0)
        )
    )
)

(script static void objective_1_set
    (print "new objective set:")
    (print "take out the covenant aa defenses and gather your troops.")
    (objectives_show_up_to 0)
)

(script static void objective_1_clear
    (print "objective complete:")
    (print "take out the covenant aa defenses and gather your troops.")
    (objectives_finish_up_to 0)
)

(script static void objective_2_set
    (print "new objective set:")
    (print "make your way past the forerunner wall.")
    (objectives_show_up_to 1)
)

(script static void objective_2_clear
    (print "objective complete:")
    (print "make your way past the forerunner wall.")
    (objectives_finish_up_to 1)
)

(script static void objective_3_set
    (print "new objective set:")
    (print "find the cartographer.")
    (objectives_show_up_to 2)
)

(script dormant void objective_3_clear
    (sleep_until (>= s_f3_p1_progression 40))
    (print "objective complete:")
    (print "find the cartographer.")
    (objectives_finish_up_to 2)
)

(script static void objective_4_set
    (print "new objective set:")
    (print "get to the extraction point and pursue truth.")
    (objectives_show_up_to 3)
)

(script static void objective_4_clear
    (print "objective complete:")
    (print "get to the extraction point and pursue truth.")
    (objectives_finish_up_to 3)
)

(script static void unlock_all_doors
    (device_set_power "f3_door_1" 1.0)
    (device_set_power "f4_door" 1.0)
    (device_set_power "f5_door_high_left" 1.0)
    (device_set_power "f5_door_low_left" 1.0)
)

(script static void 070_truth_flicker (scenery sce_grav_throne, scenery sce_truth)
    (set s_truth_count 0.0)
    (sleep_until 
        (begin
            (object_hide sce_truth false)
            (object_hide sce_grav_throne false)
            (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
            (sleep (random_range 4 15))
            (object_hide sce_truth true)
            (object_hide sce_grav_throne true)
            (set s_truth_count (+ s_truth_count 1.0))
            (>= s_truth_count 7.0)
        ) 
    (random_range 1 10))
)

(script dormant void gs_camera_bounds
    (gs_camera_bounds_on)
    (sleep_until (>= s_b1_progression 10) 1)
    (soft_ceiling_enable "camera_bowl1" false)
    (sleep_until (>= s_b2_progression 10) 1)
    (soft_ceiling_enable "camera_bowl2" false)
    (sleep_until (>= s_b2_progression 40) 1)
    (soft_ceiling_enable "camera_fp1" false)
    (wake gs_camera_bounds_sd)
    (sleep_until (>= s_fp_progression 20) 1)
    (soft_ceiling_enable "camera_ex1" false)
    (soft_ceiling_enable "camera_la1" false)
    (sleep_until (>= s_ex_progression 40) 1)
    (soft_ceiling_enable "camera_ex2" false)
    (soft_ceiling_enable "camera_sd2" false)
    (sleep_until (>= s_ex_progression 60) 1)
    (soft_ceiling_enable "camera_aw1" false)
    (soft_ceiling_enable "camera_aw2" false)
    (sleep_until (>= s_aw_progression 20) 1)
    (soft_ceiling_enable "camera_aw2" true)
    (soft_ceiling_enable "camera_la1" true)
    (sleep_until (>= s_la_progression 20) 1)
    (soft_ceiling_enable "camera_aw2" false)
    (sleep_until (>= s_la_progression 40) 1)
    (soft_ceiling_enable "camera_la1" false)
    (sleep_until (>= s_la_progression 60) 1)
    (soft_ceiling_enable "camera_sd1" false)
    (sleep_until (>= s_la_progression 90) 1)
    (soft_ceiling_enable "camera_sd2" true)
    (sleep_until (>= s_bb_progression 40) 1)
    (soft_ceiling_enable "camera_bb1" false)
    (sleep_until (>= s_bb_progression 60) 1)
    (soft_ceiling_enable "camera_bb2" false)
)

(script dormant void gs_camera_bounds_sd
    (sleep_until (>= s_sd_progression 10) 1)
    (soft_ceiling_enable "camera_sd1" false)
    (soft_ceiling_enable "camera_sd2" true)
    (sleep_until (>= s_ex_progression 55) 1)
    (soft_ceiling_enable "camera_sd2" false)
    (soft_ceiling_enable "camera_sd1" true)
)

(script static void gs_camera_bounds_off
    (if b_debug 
        (print "turn off camera bounds"))
    (soft_ceiling_enable "camera_bowl1" false)
    (soft_ceiling_enable "camera_bowl2" false)
    (soft_ceiling_enable "camera_fp1" false)
    (soft_ceiling_enable "camera_ex1" false)
    (soft_ceiling_enable "camera_la1" false)
    (soft_ceiling_enable "camera_ex2" false)
    (soft_ceiling_enable "camera_sd2" false)
    (soft_ceiling_enable "camera_sd1" false)
    (soft_ceiling_enable "camera_aw1" false)
    (soft_ceiling_enable "camera_aw2" false)
    (soft_ceiling_enable "camera_la1" false)
    (soft_ceiling_enable "camera_bb1" false)
    (soft_ceiling_enable "camera_bb2" false)
)

(script static void gs_camera_bounds_on
    (if b_debug 
        (print "turn on camera bounds"))
    (soft_ceiling_enable "camera_bowl1" true)
    (soft_ceiling_enable "camera_bowl2" true)
    (soft_ceiling_enable "camera_fp1" true)
    (soft_ceiling_enable "camera_ex1" true)
    (soft_ceiling_enable "camera_la1" true)
    (soft_ceiling_enable "camera_ex2" true)
    (soft_ceiling_enable "camera_sd2" true)
    (soft_ceiling_enable "camera_sd1" true)
    (soft_ceiling_enable "camera_aw1" true)
    (soft_ceiling_enable "camera_aw2" true)
    (soft_ceiling_enable "camera_la1" true)
    (soft_ceiling_enable "camera_bb1" true)
    (soft_ceiling_enable "camera_bb2" true)
)

(script dormant void lz_player_progression
    (sleep_until (volume_test_players "vol_lz_exit_intro") 10)
    (set s_lz_progression 10)
    (if b_debug 
        (print "s_lz_progression = 10"))
    (sleep_until (volume_test_players "vol_lz_middle_explore") 10)
    (set s_lz_progression 20)
    (if b_debug 
        (print "s_lz_progression = 20"))
    (sleep_until (volume_test_players "vol_lz_end") 10)
    (set s_lz_progression 30)
    (if b_debug 
        (print "s_lz_progression = 30"))
    (sleep_until (volume_test_players "vol_lz_near_cave") 10)
    (set s_lz_progression 40)
    (if b_debug 
        (print "s_lz_progression = 40"))
)

(script dormant void landing_zone
    (if b_debug 
        (print "starting landing zone"))
    (data_mine_set_mission_segment "070_011_landing_zone")
    (wake md_lz_exit_pelican_0)
    (wake md_lz_exit_pelican_1)
    (wake md_lz_pelican_arrives)
    (wake md_lz_odst_explore)
    (wake 070va_ark_arrival)
    (sleep_until 
        (or
            b_lz_pelican_0_arrived
            b_lz_pelican_1_arrived
        ) 
    30 1800)
    (wake lz_player_progression)
)

(script static void landing_zone_cleanup
    (ai_disposable "allies_lz_pelican_0" true)
    (ai_disposable "allies_lz_johnson" true)
    (sleep_forever lz_player_progression)
    (sleep_forever landing_zone)
    (set s_lz_progression 200)
    (add_recycling_volume "vol_lz_recycle" 0 5)
)

(script command_script void cs_b1_reinf
    (cs_enable_moving false)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until 
        (or
            (< (ai_strength (ai_get_squad ai_current_actor)) 1.0)
            (>= s_b1_progression 40)
            (and
                (<= (ai_task_count "obj_b1_cov/front") 0)
                (<= (ai_task_count "obj_b1_cov/before_combat") 0)
            )
        )
    )
)

(script command_script void cs_b1_chieftain_point
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_abort_on_alert true)
    (set b_b1_wake true)
    (sleep 120)
    (cs_action "pts_b1_patrol/p22" ai_action_advance)
)

(script command_script void cs_b1_wait_and_wake
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_abort_on_alert true)
    (sleep_until b_b1_wake 10)
    (sleep (random_range 30 60))
    (cs_force_combat_status ai_combat_status_active)
)

(script command_script void cs_b1_get_in_turret_0
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until b_b1_combat_started 10)
    (cs_go_to "pts_b1_turrets/p9")
    (sleep_until (volume_test_object "vol_b1_watchtower" ai_current_actor))
    (ai_vehicle_enter ai_current_actor (object_get_turret "b1_watchtower_pod" 0))
)

(script command_script void cs_b1_get_in_turret_1
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until b_b1_combat_started 10)
    (cs_go_to "pts_b1_turrets/p10")
    (sleep_until (volume_test_object "vol_b1_watchtower" ai_current_actor))
    (ai_vehicle_enter ai_current_actor (object_get_turret "b1_watchtower_pod" 1))
)

(script command_script void cs_b1_stay_in_turret_0
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until 
        (or
            (volume_test_players "vol_b1_watchtower")
            (not (vehicle_test_seat (object_get_turret "b1_watchtower_pod" 0) "" ai_current_actor))
        )
    )
)

(script command_script void cs_b1_stay_in_turret_1
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until 
        (or
            (volume_test_players "vol_b1_watchtower")
            (not (vehicle_test_seat (object_get_turret "b1_watchtower_pod" 1) "" ai_current_actor))
        )
    )
)

(script dormant void b1_stay_in_turret_0
    (sleep_until (vehicle_test_seat (object_get_turret "b1_watchtower_pod" 0) "" "cov_b1_watchtower/0") 10)
    (cs_run_command_script "cov_b1_watchtower/0" cs_b1_stay_in_turret_0)
)

(script dormant void b1_stay_in_turret_1
    (sleep_until (vehicle_test_seat (object_get_turret "b1_watchtower_pod" 1) "" "cov_b1_watchtower/1") 10)
    (cs_run_command_script "cov_b1_watchtower/1" cs_b1_stay_in_turret_1)
)

(script dormant void b1_allies_progression
    (sleep_until b_b1_combat_started)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_b1_cov/front") 0)
            (<= (ai_task_count "obj_b1_cov/front_jackals_0") 0)
            (<= (ai_task_count "obj_b1_cov/front_jackals_1") 0)
            (>= s_b1_progression 32)
        )
    )
    (set s_b1_allies_progression 1)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_b1_cov/brutes") 0)
            (>= s_b1_progression 32)
        )
    )
    (set s_b1_allies_progression 2)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_b1_cov/jackals") 0)
            (<= (ai_task_count "obj_b1_cov/brutes") 0)
            (>= s_b1_progression 35)
        )
    )
    (set s_b1_allies_progression 3)
)

(script dormant void b1_player_progression
    (sleep_until 
        (or
            (volume_test_players "vol_b1_cave_0")
            (>= s_b1_progression 10)
        ) 
    10)
    (set s_b1_progression 10)
    (if b_debug 
        (print "s_b1_progression = 10"))
    (sleep_until (volume_test_players "vol_b1_cave_1") 10)
    (set s_b1_progression 20)
    (if b_debug 
        (print "s_b1_progression = 20"))
    (sleep_until 
        (or
            (volume_test_players "vol_b1_left")
            (volume_test_players "vol_b1_rear")
        ) 
    10)
    (set s_b1_progression 30)
    (if b_debug 
        (print "s_b1_progression = 30"))
    (sleep_until 
        (or
            (volume_test_players "vol_b1_down")
            (volume_test_players "vol_b1_rear")
        ) 
    10)
    (set s_b1_progression 32)
    (if b_debug 
        (print "s_b1_progression = 32"))
    (sleep_until 
        (or
            (volume_test_players "vol_b1_middle")
            (volume_test_players "vol_b1_rear")
        ) 
    10)
    (set s_b1_progression 35)
    (if b_debug 
        (print "s_b1_progression = 35"))
    (sleep_until (volume_test_players "vol_b1_rear") 10)
    (set s_b1_progression 40)
    (if b_debug 
        (print "s_b1_progression = 40"))
)

(script dormant void bowl_1
    (if b_debug 
        (print "starting bowl 1"))
    (wake b1_player_progression)
    (wake b1_allies_progression)
    (wake b1_truth_halogram)
    (wake md_b2_allies_prepare)
    (sleep_until (>= s_b1_progression 10))
    (wake md_b1_allies_prepare)
    (wake md_b1_allies_next)
    (ai_disregard (ai_actors "gr_allies") true)
    (ai_disregard (ai_actors "allies_lz_pelican_0") true)
    (sleep_until (>= s_lz_progression 30) 5)
    (game_save)
    (ai_place "cov_b1_ini")
    (sleep 1)
    (ai_place "cov_b1_ini_grunts_0")
    (sleep 1)
    (ai_place "cov_b1_ini_brutes_0")
    (sleep 1)
    (ai_place "cov_b1_ini_jackals_0")
    (sleep 1)
    (ai_place "cov_b1_ini_jackals_1")
    (sleep 1)
    (ai_place "cov_b1_ini_jackals_2")
    (sleep 1)
    (ai_place "cov_b1_watchtower")
    (data_mine_set_mission_segment "070_012_bowl_1")
    (ai_migrate "allies_lz_marines_0" "allies_b1_marines_0")
    (wake b1_stay_in_turret_0)
    (wake b1_stay_in_turret_1)
    (sleep 30)
    (sleep_until 
        (or
            (>= (ai_combat_status "cov_b1_ini") ai_combat_status_active)
            (>= (ai_combat_status "cov_b1_ini_jackals_0") ai_combat_status_active)
            (>= (ai_combat_status "cov_b1_ini_jackals_1") ai_combat_status_active)
            (>= (ai_combat_status "cov_b1_ini_jackals_2") ai_combat_status_active)
            (>= (ai_combat_status "cov_b1_ini_brutes_0") ai_combat_status_active)
            (>= (ai_combat_status "cov_b1_ini_grunts_0") ai_combat_status_active)
            (>= (ai_combat_status "cov_b1_watchtower") ai_combat_status_active)
            (<= (ai_living_count "cov_b1_ini") 0)
            (> s_b1_progression 30)
        ) 
    15 3600)
    (ai_disregard (ai_actors "gr_allies") false)
    (ai_disregard (ai_actors "allies_lz_pelican_0") false)
    (ai_enter_squad_vehicles "cov_b1_turrets")
    (set b_b1_combat_started true)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_b1_cov/front") 0)
            (>= s_b1_progression 40)
        ) 
    10)
    (if (< s_b1_progression 40) 
        (ai_place "cov_b1_wave_1"))
    (sleep_until (<= (ai_living_count "gr_cov_b1") 1))
    (sleep_until (<= (ai_living_count "gr_cov_b1") 0) 30 1800)
    (set b_b1_finished true)
)

(script static void bowl_1_cleanup
    (ai_disposable "gr_cov_b1" true)
    (object_destroy_folder "crt_b1")
    (sleep_forever b1_player_progression)
    (sleep_forever bowl_1)
    (set s_b1_progression 200)
    (add_recycling_volume "vol_b1_recycle" 0 5)
)

(script command_script void cs_b2_phantom
    (set b2_phantom (ai_vehicle_get_from_starting_location "cov_b2_phantom/pilot"))
    (cs_enable_moving false)
    (cs_enable_looking false)
    (cs_enable_targeting false)
    (ai_place "cov_b2_grunts_0")
    (ai_place "cov_b2_brutes_0")
    (sleep 1)
    (set ai_b2_grunts_0 "cov_b2_grunts_0")
    (set ai_b2_grunts_1 "cov_b2_brutes_0")
    (ai_vehicle_enter_immediate "cov_b2_brutes_0" b2_phantom phantom_p_rb)
    (ai_vehicle_enter_immediate "cov_b2_grunts_0" b2_phantom phantom_p_rf)
    (sleep_until 
        (or
            (>= s_b2_progression 20)
            (< (ai_strength ai_b2_grunts_0) 1.0)
            (< (ai_strength ai_b2_grunts_1) 1.0)
        )
    )
    (sleep_until 
        (and
            (>= s_b2_progression 25)
            (objects_can_see_object (players) (ai_get_object ai_current_actor) 30.0)
        ) 
    30 300)
    (vehicle_unload b2_phantom phantom_p_rb)
    (sleep 15)
    (vehicle_unload b2_phantom phantom_p_rf)
    (sleep 60)
    (sleep_until b_b2_combat_started 30 300)
    (cs_fly_to "pts_b2_phantom/p1")
    (kill_players_in_volume "vol_b2_kill_players")
    (cs_fly_to "pts_b2_phantom/p2")
    (cs_fly_to "pts_b2_phantom/p3")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_b2_phantom_bfg
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving false)
    (cs_enable_looking false)
    (cs_enable_targeting false)
    (object_create "b2_bfg_neck")
    (objects_attach (ai_vehicle_get_from_starting_location "cov_b2_phantom_bfg/pilot") "large_cargo" "b2_bfg_neck" "gun_joint")
    (object_set_phantom_power (ai_vehicle_get_from_starting_location "cov_b2_phantom_bfg/pilot") true)
    (cs_vehicle_speed 0.3)
    (sleep_until 
        (begin
            (cs_fly_to "pts_b2_phantom/p7" 1.0)
            (cs_fly_to "pts_b2_phantom/p8" 1.0)
            (and
                (>= s_b2_progression 20)
                b_b2_combat_started
            )
        )
    )
    (cs_vehicle_speed 1.0)
    (cs_fly_to "pts_b2_phantom/p6" 1.0)
    (objects_detach (ai_vehicle_get_from_starting_location "cov_b2_phantom_bfg/pilot") "b2_bfg_neck")
    (object_set_phantom_power (ai_vehicle_get_from_starting_location "cov_b2_phantom_bfg/pilot") false)
    (cs_fly_to "pts_b2_phantom/p1")
    (kill_players_in_volume "vol_b2_kill_players")
    (cs_fly_to "pts_b2_phantom/p2")
    (cs_fly_to "pts_b2_phantom/p3")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_b2_phantom_drop_hunters
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "pts_b2_phantom/p4")
    (cs_vehicle_boost true)
    (cs_fly_to "pts_b2_phantom/p5")
    (cs_vehicle_boost false)
    (cs_fly_to_and_face "pts_b2_phantom/p0" "pts_b2_phantom/face_at" 1.0)
    (set b_b2_hunters_placed true)
    (sleep 30)
    (ai_trickle_via_phantom "cov_b2_hunter_phantom/pilot" "cov_b2_hunter_0")
    (ai_trickle_via_phantom "cov_b2_hunter_phantom/pilot" "cov_b2_hunter_1")
    (sleep 45)
    (cs_fly_to "pts_b2_phantom/p9")
    (cs_fly_to "pts_b2_phantom/p1")
    (kill_players_in_volume "vol_b2_kill_players")
    (cs_fly_to "pts_b2_phantom/p2")
    (cs_fly_to "pts_b2_phantom/p3")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_b2_reinf
    (cs_enable_moving false)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until 
        (or
            (< (ai_strength (ai_get_squad ai_current_actor)) 1.0)
            (>= s_b2_progression 27)
            b_b2_hunters_dead
        )
    )
)

(script dormant void b2_manage_reinf
    (sleep_until (= (current_zone_set_fully_active) 1) 10)
    (ai_place "cov_b2_reinf")
    (ai_place "cov_b2_reinf_grunts")
    (if (>= (game_difficulty_get_real) legendary) 
        (ee_activate))
)

(script dormant void b2_manage_blindness
    (ai_set_blind "cov_b2_grunts_0" true)
    (ai_set_blind "cov_b2_brutes_0" true)
    (ai_set_blind "cov_b2_jackals" true)
    (player_action_test_reset)
    (sleep_until 
        (or
            b_b2_combat_started
            (>= s_b2_progression 26)
            (player_action_test_primary_trigger)
            (player_action_test_grenade_trigger)
        ) 
    1)
    (ai_set_blind "cov_b2_grunts_0" false)
    (ai_set_blind "cov_b2_brutes_0" false)
    (ai_set_blind "cov_b2_jackals" false)
)

(script dormant void b2_player_progression
    (sleep_until (volume_test_players "vol_b2_cave_0") 10)
    (set s_b2_progression 10)
    (if b_debug 
        (print "s_b2_progression = 10"))
    (set b_070_music_01 true)
    (sleep_until (volume_test_players "vol_b2_cave_1") 10)
    (set s_b2_progression 20)
    (if b_debug 
        (print "s_b2_progression = 20"))
    (sleep_until (volume_test_players "vol_b2_cave_2") 10)
    (set s_b2_progression 25)
    (if b_debug 
        (print "s_b2_progression = 25"))
    (sleep_until 
        (or
            (volume_test_players "vol_b2_middle")
            (volume_test_players "vol_b2_ramp_0")
        ) 
    10)
    (set s_b2_progression 26)
    (if b_debug 
        (print "s_b2_progression = 26"))
    (sleep_until 
        (or
            (volume_test_players "vol_b2_ramp_base")
            (volume_test_players "vol_b2_ramp_0")
        ) 
    10)
    (set s_b2_progression 27)
    (if b_debug 
        (print "s_b2_progression = 27"))
    (sleep_until (volume_test_players "vol_b2_ramp_0") 10)
    (set s_b2_progression 30)
    (if b_debug 
        (print "s_b2_progression = 30"))
    (sleep_until (volume_test_players "vol_b2_ramp_1") 10)
    (set s_b2_progression 40)
    (if b_debug 
        (print "s_b2_progression = 40"))
)

(script dormant void bowl_2
    (if b_debug 
        (print "starting bowl 2"))
    (game_save)
    (wake b2_player_progression)
    (wake 070_music_01)
    (wake 070_music_02)
    (wake 070_music_03)
    (wake 070_music_04)
    (wake 070_music_05)
    (data_mine_set_mission_segment "070_013_bowl_2")
    (ai_place "cov_b2_snipers")
    (sleep 1)
    (ai_place "cov_b2_phantom")
    (sleep 1)
    (ai_place "cov_b2_phantom_bfg")
    (sleep 1)
    (ai_place "cov_b2_pack")
    (sleep 1)
    (ai_place "cov_b2_jackals")
    (cs_run_command_script (ai_get_turret_ai "cov_b2_phantom" 0) cs_do_nothing)
    (cs_run_command_script (ai_get_turret_ai "cov_b2_phantom_bfg" 0) cs_do_nothing)
    (ai_set_blind "cov_b2_phantom" true)
    (ai_set_blind "cov_b2_phantom_bfg" true)
    (ai_migrate "allies_b1_marines_0" "allies_b2_marines_0")
    (ai_migrate "allies_b1_intro_marine" "allies_b2_marines_0")
    (sleep 1)
    (object_cannot_die "b2_bfg" true)
    (wake md_b2_allies_next)
    (wake ba_gain_foothold)
    (wake b2_manage_reinf)
    (wake b2_manage_blindness)
    (sleep_until 
        (or
            (>= (ai_combat_status "cov_b2_pack") ai_combat_status_active)
            (<= (ai_living_count "cov_b2_pack") 0)
            (>= s_b2_progression 40)
        )
    )
    (set b_b2_combat_started true)
    (ai_set_blind "cov_b2_phantom" false)
    (ai_set_blind "cov_b2_phantom_bfg" false)
    (set b_070_music_02 true)
    (sleep_until 
        (or
            (<= (ai_living_count "gr_cov_b2_initial") 7)
            (>= s_b2_progression 27)
        ) 
    10)
    (sleep_until 
        (or
            (and
                (<= (ai_living_count "cov_b2_pack/brute") 0)
                (<= (ai_living_count "cov_b2_grunts_0/brute") 0)
            )
            (<= (ai_living_count "gr_cov_b2_initial") 6)
            (>= s_b2_progression 27)
        )
    )
    (set b_b2_elites_charge true)
    (ai_place "cov_b2_hunter_phantom")
    (sleep 1)
    (ai_cannot_die "cov_b2_hunter_phantom/pilot" true)
    (object_cannot_take_damage (ai_vehicle_get "cov_b2_hunter_phantom/pilot"))
    (sleep_until (game_safe_to_save) 30 450)
    (game_save)
    (sleep_until 
        (or
            b_b2_hunters_placed
            (<= (ai_living_count "cov_b2_hunter_phantom") 0)
        )
    )
    (set b_070_music_01 false)
    (if debug 
        (print "start music 070_02 alternate"))
    (sound_looping_set_alternate "levels\solo\070_waste\music\070_music_02" true)
    (set b_070_music_03 true)
    (sleep 300)
    (sleep_until (<= (ai_living_count "gr_cov_b2_hunters") 1) 10)
    (set b_070_music_04 true)
    (sleep_until (<= (ai_living_count "gr_cov_b2_hunters") 0))
    (set b_b2_hunters_dead true)
    (set b_070_music_03 false)
    (set b_070_music_05 true)
    (sleep_until (game_safe_to_save) 30 150)
    (game_save)
    (sleep_until (<= (ai_living_count "gr_cov_b2") 2))
    (sleep_until (<= (ai_living_count "gr_cov_b2") 0) 30 28800)
    (set b_b2_finished true)
)

(script static void bowl_2_cleanup
    (ai_disposable "gr_cov_b2" true)
    (object_destroy_folder "crt_b2")
    (object_destroy_folder "sce_bowls")
    (sleep_forever b2_player_progression)
    (sleep_forever bowl_2)
    (set s_b2_progression 200)
    (add_recycling_volume "vol_b2_recycle" 0 5)
)

(script dormant void fp_player_progression
    (sleep_until (volume_test_players "vol_fp_entrance") 10)
    (set s_fp_progression 10)
    (if b_debug 
        (print "s_fp_progression = 10"))
    (sleep_until (volume_test_players "vol_fp_before_door") 10)
    (set s_fp_progression 15)
    (if b_debug 
        (print "s_fp_progression = 15"))
    (sleep_until (volume_test_players "vol_fp_front_door") 10)
    (set s_fp_progression 20)
    (if b_debug 
        (print "s_fp_progression = 20"))
)

(script dormant void forerunner_passage
    (if b_debug 
        (print "starting forerunner passage"))
    (game_save)
    (wake background_exploration)
    (wake fp_player_progression)
    (wake md_fp_allies_next)
    (object_create "fp_terminal")
    (objects_attach "fp_terminal_base" "forerunner_terminal" "fp_terminal" "")
    (data_mine_set_mission_segment "070_014_forerunner_passage")
    (sleep_until 
        (or
            b_b2_finished
            (>= s_fp_progression 15)
        )
    )
    (ai_migrate "allies_b2_marines_0" "allies_fp_marines_0")
    (sleep 1)
)

(script static void forerunner_passage_cleanup
    (object_destroy_folder "crt_fp")
    (sleep_forever fp_player_progression)
    (sleep_forever forerunner_passage)
    (set s_fp_progression 200)
    (add_recycling_volume "vol_fp_recycle" 0 5)
)

(script command_script void cs_ex_mauler
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_abort_on_vehicle_exit true)
    (cs_go_to "pts_ex_mauler/p5")
    (object_set_velocity (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") 10.0)
    (cs_go_to "pts_ex_mauler/p0")
    (if (not (volume_test_players "vol_ex_near_entrance")) 
        (cs_go_to "pts_ex_mauler/p2") (cs_go_to "pts_ex_mauler/p1"))
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") mauler_d true)
    (cs_abort_on_vehicle_exit false)
    (ai_vehicle_exit ai_current_actor)
    (sleep 120)
    (ai_migrate ai_current_actor "cov_ex_pack_ini_0")
)

(script command_script void cs_ex_mauler_1
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_abort_on_vehicle_exit true)
    (cs_go_to "pts_ex_mauler/p5")
    (object_set_velocity (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") 10.0)
    (cs_go_to "pts_ex_mauler/p3")
)

(script command_script void cs_ex_abandon_mauler
    (sleep 1)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_abort_on_vehicle_exit true)
    (sleep_until (volume_test_object "vol_ex_exit_mauler" ai_current_actor) 30 600)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") mauler_p_l true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") mauler_p_r true)
    (if (<= (game_difficulty_get_real) normal) 
        (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") mauler_g true))
    (cs_abort_on_vehicle_exit false)
    (if 
        (or
            (<= (game_difficulty_get_real) normal)
            (not (vehicle_test_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") "mauler_g" ai_current_actor))
        ) 
            (begin
                (ai_vehicle_exit ai_current_actor)
                (sleep 120)
                (ai_migrate ai_current_actor "cov_ex_pack_ini_0")
            )
    )
)

(script command_script void cs_ex_mauler_passenger_0
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_abort_on_vehicle_exit true)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_ex_cov/infantry") 4)
            (<= (ai_living_count "cov_ex_mauler_1/gunner") 0)
            (<= (ai_living_count "cov_ex_mauler_1/driver") 0)
        )
    )
    (sleep_until 
        (or
            (and
                (volume_test_object "vol_ex_exit_mauler_large" ai_current_actor)
                (<= (ai_task_count "obj_ex_cov/infantry") 4)
            )
            (<= (ai_living_count "cov_ex_mauler_1/gunner") 0)
            (<= (ai_living_count "cov_ex_mauler_1/driver") 0)
        ) 
    30 3600)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") mauler_p_l true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") mauler_p_r true)
    (ai_vehicle_exit ai_current_actor)
    (sleep 15)
    (ai_migrate ai_current_actor "cov_ex_pack_ini_0")
)

(script command_script void cs_ex_knelt_marine
    (cs_crouch true)
    (sleep_until 
        (or
            b_ex_p1_has_started
            (>= s_ex_progression 10)
        )
    )
)

(script command_script void cs_ex_enter_vehicle
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until (>= s_ex_progression 35) 15)
    (cs_draw)
    (cs_abort_on_damage false)
    (cs_movement_mode ai_movement_combat)
    (ai_enter_squad_vehicles (ai_get_squad ai_current_actor))
)

(script command_script void cs_ex_ghost_3
    (cs_stow)
    (cs_posture_set "act_examine_1" false)
    (cs_abort_on_damage true)
    (sleep_until 
        (or
            (>= s_ex_progression 40)
            (<= (ai_strength "gr_cov_ex_p2") 0.75)
        ) 
    15)
    (cs_draw)
    (cs_abort_on_damage false)
    (cs_enable_targeting true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_movement_mode ai_movement_combat)
    (ai_enter_squad_vehicles (ai_get_squad ai_current_actor))
)

(script command_script void cs_ex_cave_ghost
    (cs_enable_moving false)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until (>= s_ex_progression 65) 10 900)
)

(script dormant void ex_manage_empty_chopper_0
    (ai_place "cov_ex_empty_chopper_0")
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_0/chopper") true)
    (sleep_until 
        (or
            (player_in_vehicle (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_0/chopper"))
            (>= s_lb_progression 15)
        ) 
    150)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_0/chopper") false)
)

(script dormant void ex_manage_empty_chopper_1
    (ai_place "cov_ex_empty_chopper_1")
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_1/chopper") true)
    (sleep_until 
        (or
            (player_in_vehicle (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_1/chopper"))
            (>= s_lb_progression 15)
        ) 
    150)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_1/chopper") false)
)

(script dormant void ex_manage_empty_chopper_2
    (ai_place "cov_ex_empty_chopper_2")
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_2/chopper") true)
    (sleep_until 
        (or
            (player_in_vehicle (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_2/chopper"))
            (>= s_lb_progression 15)
        ) 
    150)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_empty_chopper_2/chopper") false)
)

(script dormant void ex_manage_maulers
    (sleep_until b_ex_maulers_spawned)
    (sleep 300)
    (sleep_until 
        (or
            (player_in_a_vehicle)
            (and
                (<= (ai_task_count "obj_ex_cov/infantry") 1)
                (<= (ai_living_count "cov_ex_mauler") 0)
            )
        ) 
    30 1800)
    (if (not (player_in_a_vehicle)) 
        (sleep_until (player_in_a_vehicle) 30 150))
    (sleep 90)
    (set b_ex_mauler_charge true)
)

(script dormant void ex_manage_vehicle_reservation
    (sleep_until 
        (and
            b_ex_maulers_spawned
            (or
                (player_in_a_vehicle)
                (>= s_ex_progression 30)
                b_ex_p1_finished
                b_ex_part_2_finished
            )
        )
    )
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_ex_mongoose_0/mongoose_0") false)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_ex_mongoose_1/mongoose_1") false)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") false)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") false)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_ex_warthog_0/warthog") false)
    (sleep_until 
        (or
            (>= s_ex_progression 35)
            b_ex_p1_finished
        )
    )
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") false)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") false)
    (object_cannot_die (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") false)
)

(script dormant void ex_marines_get_in_vehicle
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_ex_mongoose_0/mongoose_0") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_ex_mongoose_1/mongoose_1") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_ex_warthog_0/warthog") true)
    (wake ex_manage_vehicle_reservation)
    (sleep_until 
        (or
            b_ex_p1_finished
            b_ex_part_2_finished
        )
    )
    (sleep 60)
    (if (<= (ai_living_count "cov_ex_mauler") 0) 
        (ai_migrate "cov_ex_mauler" "allies_ex_mongoose_0"))
    (if (<= (ai_living_count "cov_ex_mauler_1") 0) 
        (ai_migrate "cov_ex_mauler_1" "allies_ex_mongoose_0"))
    (sleep (random_range 30 90))
    (sleep_until 
        (begin
            (ai_enter_squad_vehicles "gr_marines")
            (>= s_ex_progression 40)
        ) 
    210)
)

(script dormant void ex_manage_crashed_phantom
    (sleep_until (>= s_ex_progression 40))
    (ai_place "cov_ex_crashed_grunts")
    (sleep_until 
        (or
            (>= s_ex_progression 45)
            (>= s_aw_progression 10)
        )
    )
    (ai_activity_abort "cov_ex_crashed_grunts")
    (ai_enter_squad_vehicles "cov_ex_crashed_grunts")
)

(script static boolean ex_is_object_alive_in_volume (vehicle veh_current, trigger_volume vol_current)
    (and
        (> (object_get_health veh_current) 0.0)
        (volume_test_object vol_current veh_current)
    )
)

(script dormant void ex_cave
    (sleep_until (>= s_ex_progression 50))
    (ai_place "cov_ex_trench_ghosts")
    (sleep_until (>= s_ex_progression 60))
    (if 
        (or
            (ex_is_object_alive_in_volume veh_mauler_0 "vol_ex_later_half")
            (ex_is_object_alive_in_volume veh_mauler_1 "vol_ex_later_half")
            (ex_is_object_alive_in_volume (ai_vehicle_get_from_starting_location "allies_ex_warthog_1/warthog") "vol_ex_later_half")
        ) 
            (unit_kill "ex_cave_warthog"))
    (sleep 1)
    (unit_kill "ex_cave_mongoose")
    (wake md_ex_marines_cave)
    (ai_place "cov_ex_cave_jackals_0")
    (sleep 1)
    (ai_place "cov_ex_cave_jackals_1")
    (sleep 1)
    (ai_place "cov_ex_cave")
    (sleep 1)
    (ai_place "cov_ex_cave_ghosts")
    (sleep 1)
    (ai_place "allies_ex_cave_0")
    (sleep 1)
    (ai_place "allies_ex_cave_1")
    (sleep 1)
    (ai_magically_see "gr_cov_ex_cave" "allies_ex_cave_0")
    (ai_magically_see "gr_cov_ex_cave" "allies_ex_cave_1")
    (ai_magically_see "allies_ex_cave_0" "gr_cov_ex_cave")
    (ai_magically_see "allies_ex_cave_1" "gr_cov_ex_cave")
    (if (> (ai_living_count "gr_marines") 7) 
        (ai_kill "allies_ex_cave_0/marine_0"))
    (if (> (ai_living_count "gr_marines") 6) 
        (ai_kill "allies_ex_cave_1/marine_1"))
    (sleep_until 
        (or
            (<= (ai_living_count "gr_cov_ex_cave_inf") 0)
            (>= s_aw_progression 10)
        ) 
    10)
    (set b_ex_cave_finished true)
    (ai_set_objective "cov_ex_cave_ghosts" "obj_aw_cov")
    (sleep_until 
        (begin
            (ai_migrate (ai_player_get_vehicle_squad (player0)) "allies_aw_mongoose_0")
            (ai_migrate (ai_player_get_vehicle_squad (player1)) "allies_aw_mongoose_0")
            (ai_migrate (ai_player_get_vehicle_squad (player2)) "allies_aw_mongoose_0")
            (ai_migrate (ai_player_get_vehicle_squad (player3)) "allies_aw_mongoose_0")
            (>= s_aw_progression 10)
        )
    )
    (ai_migrate_infanty "gr_marines" "allies_aw_infantry")
    (ai_migrate "allies_ex_cave_0" "allies_aw_mongoose_0")
    (ai_migrate "allies_ex_cave_1" "allies_aw_mongoose_0")
    (ai_migrate "allies_ex_mongoose_0" "allies_aw_mongoose_0")
    (ai_migrate "allies_ex_mongoose_1" "allies_aw_mongoose_1")
    (ai_migrate "allies_ex_warthog_1" "allies_aw_warthog_0")
    (ai_migrate "allies_ex_warthog_0" "allies_aw_warthog_0")
    (ai_erase_inactive "gr_marines" 0)
)

(script dormant void ex_longsword_search
    (sleep_until 
        (or
            (>= s_ex_progression 27)
            b_ex_p1_finished
        ) 
    10)
    (sleep_until (>= s_ex_progression 27) 10)
    (ai_place "cov_ex_search_brutes_2")
    (sleep 1)
    (ai_place "cov_ex_search_grunts_0")
    (sleep 1)
    (ai_place "cov_ex_search_grunts_3")
    (sleep 1)
    (ai_place "cov_ex_search_brutes_0")
    (sleep 1)
    (ai_place "cov_ex_search_brutes_1")
    (sleep 1)
    (ai_place "cov_ex_search_pack")
    (sleep 1)
    (ai_place "allies_ex_warthog_1")
    (sleep_until (<= (ai_living_count "gr_cov_ex_p2") 1) 90 1800)
    (sleep_until (<= (ai_living_count "gr_cov_ex_p2") 2))
    (set b_ex_part_2_finished true)
)

(script dormant void ex_manage_marines_reinf
    (sleep_until 
        (or
            (and
                (<= (ai_living_count "gr_marines") 1)
                (<= (ai_living_count "gr_cov_ex_p1") 3)
                b_ex_maulers_spawned
                (not (volume_test_players "vol_fp_all"))
            )
            (>= s_ex_progression 35)
        )
    )
    (if (< s_ex_progression 35) 
        (ai_place "allies_ex_marines_reinf"))
)

(script dormant void ex_game_save
    (game_save)
    (sleep_until 
        (or
            b_ex_maulers_spawned
            (>= s_ex_progression 30)
        )
    )
    (if (< s_ex_progression 30) 
        (game_save))
    (sleep_until (>= s_ex_progression 30))
    (if b_ex_p1_finished 
        (game_save))
    (sleep_until 
        (or
            b_ex_part_2_finished
            (>= s_ex_progression 55)
        )
    )
    (if b_ex_part_2_finished 
        (game_save))
    (sleep_until 
        (or
            (volume_test_players "vol_ex_checkpoint_before_sd")
            (>= s_ex_progression 55)
            b_sd_finished
        )
    )
    (if (volume_test_players "vol_ex_checkpoint_before_sd") 
        (game_save))
    (sleep_until 
        (or
            (>= s_ex_progression 55)
            b_sd_finished
        )
    )
    (if b_sd_finished 
        (game_save))
    (sleep_until 
        (and
            (<= (ai_living_count "cov_ex_trench_ghosts") 0)
            (>= s_ex_progression 60)
        )
    )
    (game_save)
    (sleep_until 
        (or
            (>= s_aw_progression 10)
            (and
                b_ex_cave_dialog_finished
                (volume_test_players "vol_ex_exit")
            )
        )
    )
    (sleep_until (game_safe_to_save) 30 300)
    (if (< s_aw_progression 20) 
        (game_save))
)

(script dormant void ex_player_progression
    (sleep_until (volume_test_players "vol_ex_out_cave") 10)
    (set s_ex_progression 10)
    (if b_debug 
        (print "s_ex_progression = 10"))
    (sleep_until 
        (or
            (volume_test_players "vol_ex_ground")
            (volume_test_players "vol_ex_near_crash")
            (volume_test_players "vol_ex_leaving_0")
            (volume_test_players "vol_ex_leaving_2")
        ) 
    10)
    (set s_ex_progression 20)
    (if b_debug 
        (print "s_ex_progression = 20"))
    (sleep_until 
        (or
            (volume_test_players "vol_ex_near_crash")
            (volume_test_players "vol_ex_leaving_0")
            (volume_test_players "vol_ex_leaving_2")
        ) 
    10)
    (set s_ex_progression 25)
    (if b_debug 
        (print "s_ex_progression = 25"))
    (sleep_until 
        (or
            (volume_test_players "vol_ex_leaving_0")
            (volume_test_players "vol_ex_leaving_2")
        ) 
    10)
    (set s_ex_progression 27)
    (if b_debug 
        (print "s_ex_progression = 27"))
    (sleep_until 
        (or
            (volume_test_players "vol_ex_leaving_1")
            (volume_test_players "vol_ex_leaving_2")
        ) 
    10)
    (set s_ex_progression 30)
    (if b_debug 
        (print "s_ex_progression = 30"))
    (sleep_until (volume_test_players "vol_ex_part_2") 10)
    (set s_ex_progression 35)
    (if b_debug 
        (print "s_ex_progression = 35"))
    (sleep_until (volume_test_players "vol_ex_longsword") 10)
    (set s_ex_progression 40)
    (if b_debug 
        (print "s_ex_progression = 40"))
    (sleep_until (volume_test_players "vol_ex_after_longsword") 10)
    (set s_ex_progression 45)
    (if b_debug 
        (print "s_ex_progression = 45"))
    (sleep_until (volume_test_players "vol_ex_near_trench") 10)
    (set s_ex_progression 50)
    (if b_debug 
        (print "s_ex_progression = 50"))
    (sleep_until (volume_test_players "vol_ex_mid_trench") 10)
    (set s_ex_progression 55)
    (if b_debug 
        (print "s_ex_progression = 55"))
    (set b_070_music_06 false)
    (sleep_until (volume_test_players "vol_ex_exit_trench") 10)
    (set s_ex_progression 60)
    (if b_debug 
        (print "s_ex_progression = 60"))
    (sleep_until (volume_test_players "vol_ex_after_trench") 10)
    (set s_ex_progression 65)
    (if b_debug 
        (print "s_ex_progression = 65"))
    (sleep_until (volume_test_players "vol_ex_exit") 10)
    (set s_ex_progression 70)
    (if b_debug 
        (print "s_ex_progression = 70"))
)

(script dormant void exploration
    (if b_debug 
        (print "starting exploration"))
    (set b_ex_has_started true)
    (ai_erase_inactive "gr_marines" 0)
    (set b_070_music_02 false)
    (set b_070_music_03 false)
    (ai_migrate "allies_fp_marines_0" "allies_ex_on_foot_0")
    (data_mine_set_mission_segment "070_020_exploration")
    (ai_place "allies_ex_on_foot_1")
    (sleep 1)
    (ai_place "allies_ex_on_foot_0/0")
    (sleep 1)
    (ai_place "cov_ex_pack_ini_0")
    (sleep 1)
    (ai_place "cov_ex_pack_ini_1")
    (sleep 1)
    (ai_place "allies_ex_mongoose_0")
    (sleep 1)
    (ai_place "allies_ex_mongoose_1")
    (sleep 1)
    (set s_ex_nb_allies (ai_living_count "gr_marines"))
    (if (< s_ex_nb_allies 4) 
        (ai_place "allies_ex_on_foot_0/1"))
    (if (< s_ex_nb_allies 3) 
        (ai_place "allies_ex_on_foot_0/2"))
    (if (>= (game_coop_player_count) 3) 
        (begin
            (object_destroy "ex_wrecked_warthog")
            (object_destroy "ex_wrecked_warthog_tire_0")
            (object_destroy "ex_wrecked_warthog_tire_1")
            (sleep 1)
            (ai_place "allies_ex_warthog_0")
        ) (begin
            (ai_vehicle_reserve "ex_wrecked_warthog" true)
        )
    )
    (wake ex_player_progression)
    (wake ex_marines_get_in_vehicle)
    (wake ex_cave)
    (wake ex_longsword_search)
    (wake ex_manage_crashed_phantom)
    (wake ex_game_save)
    (wake md_ex_marines_intro)
    (wake md_ex_marines_thanks)
    (wake md_ex_allies_next)
    (wake md_ambiant_radio)
    (wake md_ambiant_brute_radio)
    (wake ex_manage_empty_chopper_0)
    (wake ex_manage_empty_chopper_1)
    (wake ex_manage_empty_chopper_2)
    (wake ex_manage_marines_reinf)
    (wake 070_music_06)
    (sleep_until 
        (or
            (>= s_ex_progression 27)
            (> (ai_combat_status "gr_cov_ex_p1") ai_combat_status_active)
            (<= (ai_living_count "gr_cov_ex_p1") 0)
            (player_in_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_0/mongoose_0"))
            (player_in_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_1/mongoose_1"))
        )
    )
    (set b_ex_p1_has_started true)
    (sleep_until 
        (or
            (>= s_ex_progression 27)
            (<= (ai_living_count "gr_cov_ex_p1") 0)
            (player_in_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_0/mongoose_0"))
            (player_in_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_1/mongoose_1"))
        )
    )
    (sleep_until 
        (or
            (>= s_ex_progression 27)
            (player_in_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_0/mongoose_0"))
            (player_in_vehicle (ai_vehicle_get_from_starting_location "allies_ex_mongoose_1/mongoose_1"))
        ) 
    30 450)
    (ai_place "cov_ex_mauler")
    (sleep 1)
    (set veh_mauler_0 (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver"))
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") mauler_p_l true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") mauler_p_r true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") mauler_d true)
    (object_cannot_die (ai_vehicle_get_from_starting_location "cov_ex_mauler/driver") true)
    (ai_place "cov_ex_mauler_1")
    (sleep 1)
    (set veh_mauler_1 (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver"))
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") mauler_p_l true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") mauler_p_r true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "cov_ex_mauler_1/driver") mauler_d true)
    (wake ex_manage_maulers)
    (set b_ex_maulers_spawned true)
    (sleep_until (<= (ai_living_count "gr_cov_ex_p1") 1))
    (sleep_until (<= (ai_living_count "gr_cov_ex_p1") 0) 30 3600)
    (set b_ex_p1_finished true)
    (ai_erase_inactive "gr_marines" 0)
    (sleep_until (>= s_ex_progression 35) 30 3600)
    (if (< s_ex_progression 35) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_ex_p1_next" 0.0)
            (sleep_until (>= s_ex_progression 35))
            (hud_deactivate_team_nav_point_flag player "flg_ex_p1_next")
        )
    )
)

(script static void exploration_cleanup
    (ai_disposable "gr_cov_ex" true)
    (sleep_forever ex_player_progression)
    (set s_ex_progression 200)
    (add_recycling_volume "vol_ex_recycle" 20 5)
)

(script command_script void cs_sd_flee
    (cs_enable_moving true)
    (cs_shoot false)
    (cs_enable_looking false)
    (cs_enable_targeting false)
    (cs_movement_mode ai_movement_flee)
    (sleep (random_range 450 660))
)

(script command_script void cs_sd_sentinel_cleanup
    (cs_enable_moving true)
    (cs_abort_on_damage true)
    (sleep_forever)
)

(script command_script void cs_sd_chopper_0
    (cs_posture_set "act_gaze_1" false)
    (sleep_until (>= s_sd_progression 10) 15)
    (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "cov_sd_chopper_0/chopper"))
    (cs_movement_mode ai_movement_combat)
    (cs_enable_moving true)
    (sleep_until (unit_in_vehicle ai_current_actor) 10 450)
    (cs_enable_moving false)
    (cs_abort_on_vehicle_exit true)
    (cs_vehicle_boost true)
    (sleep 120)
)

(script command_script void cs_sd_chopper_1
    (cs_posture_set "act_gaze_1" false)
    (sleep_until (>= s_sd_progression 10) 15)
    (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "cov_sd_chopper_1/chopper"))
    (cs_movement_mode ai_movement_combat)
    (cs_enable_moving true)
    (sleep_until (unit_in_vehicle ai_current_actor) 10 450)
    (cs_enable_moving false)
    (cs_abort_on_vehicle_exit true)
    (cs_vehicle_boost true)
    (sleep 120)
)

(script command_script void cs_sd_sentinel_migrate
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "pts_sd_sentinels/p0" 2.0)
    (cs_vehicle_boost true)
    (cs_fly_to "pts_sd_sentinels/p1" 2.0)
    (cs_fly_to "pts_sd_sentinels/p6" 2.0)
    (cs_vehicle_boost false)
    (sleep (random_range 15 60))
    (cs_fly_to "pts_sd_sentinels/p7" 2.0)
    (cs_vehicle_boost true)
    (cs_fly_to "pts_sd_sentinels/p2" 2.0)
    (cs_fly_to "pts_sd_sentinels/p3" 2.0)
    (cs_vehicle_boost false)
    (cs_fly_to "pts_sd_sentinels/p4" 2.0)
    (cs_fly_to "pts_sd_sentinels/p5" 2.0)
)

(script command_script void cs_sd_sentinel_exit
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_pathfinding_failsafe true)
    (sleep_until (volume_test_object "vol_ex_sentinel_exit" ai_current_actor))
    (cs_fly_to "pts_sd_sentinels/p8" 2.0)
    (cs_fly_to "pts_sd_sentinels/p9" 2.0)
    (cs_fly_to "pts_sd_sentinels/p10" 2.0)
    (ai_erase ai_current_actor)
)

(script command_script void cs_sd_johnson_pelican
    (cs_enable_pathfinding_failsafe true)
    (ai_place "allies_sd_johnson")
    (sleep 1)
    (object_cannot_take_damage (ai_vehicle_get_from_starting_location "allies_sd_johnson/johnson"))
    (object_cannot_take_damage (ai_get_object "allies_sd_johnson/johnson"))
    (ai_cannot_die "allies_sd_johnson" true)
    (objects_attach (ai_vehicle_get_from_starting_location "allies_sd_pelican/pilot") "machinegun_turret" (ai_vehicle_get_from_starting_location "allies_sd_johnson/johnson") "")
    (cs_fly_to "pts_sd_pelican/p0")
    (if (volume_test_players "vol_sd_mid_bridge") 
        (cs_fly_to_and_face "pts_sd_pelican/p1" "pts_sd_pelican/face_away_door" 1.0) (cs_fly_to_and_face "pts_sd_pelican/p2" "pts_sd_pelican/face_at_sd"))
    (sleep_until b_sd_cartographer_hint)
    (cs_vehicle_speed 0.5)
    (cs_fly_to "pts_sd_pelican/p3")
    (cs_vehicle_speed 1.0)
    (cs_fly_to "pts_sd_pelican/p4")
    (cs_fly_to "pts_sd_pelican/p5")
    (kill_players_in_volume "vol_ex_kill_players")
    (cs_fly_to "pts_sd_pelican/p6")
    (cs_fly_to "pts_sd_pelican/p7")
    (ai_erase "allies_sd_johnson")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script dormant void sd_stop_sentinel_spawning
    (sleep_until 
        (or
            (ai_allegiance_broken player sentinel)
            (>= s_aw_progression 10)
        )
    )
    (if (ai_allegiance_broken player sentinel) 
        (begin
            (wake md_sd_sentinels_attack)
        )
    )
    (sleep_forever sd_manage_sentinel_spawning)
)

(script dormant void sd_manage_sentinel_spawning
    (wake sd_stop_sentinel_spawning)
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_3")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_4")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_5")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_3")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_4")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_5")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_6")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (sleep_until 
        (or
            (>= s_sd_progression 30)
            b_sd_more_sentinel_spawned
        )
    )
    (ai_place "for_sd_sentinels_3")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_4")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_5")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_6")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_3")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_4")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_5")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_6")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until b_sd_more_sentinel_spawned)
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_3")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_4")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_5")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
    (sleep_until (< (ai_living_count "gr_forerunner") s_sd_sentinel_count))
    (ai_place "for_sd_sentinels_6")
    (sleep 60)
    (unit_close "sd_emitter_0")
    (unit_close "sd_emitter_1")
)

(script dormant void sd_manage_sentinels
    (sleep_until 
        (or
            (>= s_aw_progression 10)
            (<= (ai_living_count "gr_cov_sd_bridge") 0)
        )
    )
    (sleep (random_range 450 600))
    (set b_sd_sentinels_charge true)
)

(script dormant void sd_manage_grunt_fear
    (sleep_until 
        (or
            b_sd_more_sentinel_spawned
            b_la_can_start
        ) 
    10)
    (set b_sd_grunts_flee true)
    (cs_run_command_script "gr_cov_sd_grunts" cs_sd_flee)
    (sleep 900)
    (set b_sd_grunts_flee false)
)

(script dormant void sd_manage_warthog
    (sleep_until 
        (or
            b_la_can_start
            b_sd_more_sentinel_spawned
        )
    )
    (sleep_until 
        (or
            (<= (ai_task_count "obj_sd_cov/choppers") 0)
            b_la_can_start
        )
    )
    (sleep_until 
        (or
            (<= (ai_task_count "obj_sd_cov/bridge") 0)
            b_la_can_start
        ) 
    30 5200)
    (set b_sd_warthog_can_go true)
)

(script dormant void sd_player_progression
    (sleep_until (volume_test_players "vol_sd_entrance") 10)
    (set s_sd_progression 10)
    (if b_debug 
        (print "s_sd_progression = 10"))
    (sleep_until (volume_test_players "vol_sd_middle") 10)
    (set s_sd_progression 20)
    (if b_debug 
        (print "s_sd_progression = 20"))
    (sleep_until (volume_test_players "vol_sd_bridge") 10)
    (set s_sd_progression 30)
    (if b_debug 
        (print "s_sd_progression = 30"))
    (sleep_until (volume_test_players "vol_sd_mid_bridge") 10)
    (set s_sd_progression 40)
    (if b_debug 
        (print "s_sd_progression = 40"))
)

(script dormant void sentinel_defense
    (if b_debug 
        (print "starting sentinel defense"))
    (ai_place "cov_sd_turrets")
    (sleep 1)
    (ai_place "cov_sd_pack")
    (sleep 1)
    (ai_place "cov_sd_chopper_0")
    (sleep 1)
    (ai_place "cov_sd_chopper_1")
    (sleep 1)
    (ai_place "cov_sd_bridge_pack")
    (sleep 1)
    (ai_place "cov_sd_flak")
    (sleep 1)
    (wake sd_player_progression)
    (wake sd_manage_grunt_fear)
    (wake sd_manage_warthog)
    (wake md_sd_sentinels_intro)
    (wake md_sd_allies_next)
    (wake md_sd_sentinels_clean)
    (wake sd_manage_sentinel_spawning)
    (sleep_until (>= s_sd_progression 10) 10)
    (ai_set_objective "gr_cov_ex_p1" "obj_sd_cov")
    (ai_set_objective "gr_cov_ex_p2" "obj_sd_cov")
    (sleep_until 
        (or
            (>= s_sd_progression 40)
            (and
                (>= s_sd_progression 30)
                (<= (ai_living_count "cov_sd_pack") 0)
                (<= (ai_living_count "cov_sd_flak") 0)
                (<= (ai_living_count "cov_sd_chopper_0") 0)
                (<= (ai_living_count "cov_sd_chopper_1") 0)
            )
        ) 
    10)
    (set b_sd_more_sentinel_spawned true)
    (set s_sd_sentinel_count 4)
    (ai_migrate "cov_sd_bridge_pack/0" "cov_sd_grunts_0")
    (ai_migrate "cov_sd_bridge_pack/1" "cov_sd_grunts_0")
    (ai_migrate "cov_sd_bridge_pack/2" "cov_sd_grunts_0")
    (ai_migrate "cov_sd_bridge_pack/3" "cov_sd_grunts_0")
    (ai_migrate "cov_sd_bridge_pack/4" "cov_sd_grunts_0")
    (ai_migrate "cov_sd_bridge_pack/5" "cov_sd_grunts_0")
    (ai_migrate "cov_sd_bridge_pack/6" "cov_sd_grunts_0")
    (ai_migrate "cov_sd_bridge_pack/7" "cov_sd_grunts_0")
    (wake sd_manage_sentinels)
    (sleep_until (<= (ai_living_count "gr_cov_sd") 2))
    (sleep_until (<= (ai_living_count "gr_cov_sd") 0) 30 1200)
    (set b_sd_finished true)
    (set b_070_music_06 false)
)

(script static void sentinel_defense_cleanup
    (sleep_forever sd_player_progression)
    (sleep_forever sentinel_defense)
    (ai_kill "gr_cov_sd")
    (ai_kill "gr_for_sd")
    (ai_disposable "gr_cov_sd" true)
    (set s_sd_progression 200)
    (add_recycling_volume "vol_sd_recycle" 10 5)
)

(script command_script void cs_aw_wraith_shoot_sky_0
    (cs_enable_moving true)
    (ai_prefer_target_ai ai_current_actor "allies_aw_hornet" true)
    (sleep_until 
        (begin
            (begin_random
                (cs_shoot_point true "pts_aw_wraiths/p0")
                (cs_shoot_point true "pts_aw_wraiths/p1")
                (cs_shoot_point true "pts_aw_wraiths/p3")
                (cs_shoot_point true "pts_aw_wraiths/p2")
            )
            (and
                (>= s_aw_progression 30)
                (<= (object_get_health (ai_vehicle_get_from_starting_location "cov_aw_wraith_1/driver")) 0.75)
            )
        )
    )
    (ai_prefer_target_ai ai_current_actor "allies_aw_hornet" false)
    (ai_set_targeting_group "cov_aw_wraith_1/driver" -1)
    (ai_set_targeting_group "allies_aw_hornet/pilot" -1)
    (set b_aw_aa_attacks_player true)
)

(script command_script void cs_aw_wraith_shoot_sky_1
    (cs_enable_moving true)
    (ai_prefer_target_ai ai_current_actor "allies_aw_hornet" true)
    (sleep_until 
        (begin
            (begin_random
                (cs_shoot_point true "pts_aw_wraiths/p0")
                (cs_shoot_point true "pts_aw_wraiths/p1")
                (cs_shoot_point true "pts_aw_wraiths/p3")
                (cs_shoot_point true "pts_aw_wraiths/p2")
            )
            (and
                (>= s_aw_progression 30)
                (<= (object_get_health (ai_vehicle_get_from_starting_location "cov_aw_wraith_2/driver")) 0.75)
            )
        )
    )
    (ai_prefer_target_ai ai_current_actor "allies_aw_hornet" false)
    (ai_set_targeting_group "cov_aw_wraith_2/driver" -1)
    (ai_set_targeting_group "allies_aw_hornet/pilot" -1)
    (set b_aw_aa_attacks_player true)
)

(script command_script void cs_aw_stay_in_turret_0
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until 
        (or
            (volume_test_players "vol_aw_watchtower_0")
            (not (vehicle_test_seat (object_get_turret "aw_cov_watch_pod_0" 0) "" ai_current_actor))
        )
    )
)

(script command_script void cs_aw_stay_in_turret_1
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until 
        (or
            (volume_test_players "vol_aw_watchtower_1")
            (not (vehicle_test_seat (object_get_turret "aw_cov_watch_pod_1" 0) "" ai_current_actor))
        )
    )
)

(script dormant void aw_manage_top_bunker
    (ai_prefer_target_ai "gr_allies" "gr_cov_aw_bottom" true)
    (sleep_until 
        (or
            (and
                (<= (ai_living_count "gr_cov_aw_ghosts") 0)
                b_aw_spawned_ghosts
                (<= (ai_task_count "obj_aw_cov/bridge_front") 0)
            )
            (>= s_aw_progression 30)
        )
    )
    (ai_prefer_target_ai "gr_allies" "gr_cov_aw_bottom" false)
    (ai_enter_squad_vehicles "cov_aw_fort_turrets")
    (sleep_until (>= s_aw_progression 30) 10)
    (ai_enter_squad_vehicles "cov_aw_fort_turrets")
)

(script dormant void aw_manage_save
    (sleep_until (not (volume_test_objects "vol_aw_first_half" (ai_actors "gr_cov_aw"))) 60)
    (game_save)
)

(script dormant void aw_player_progression
    (sleep_until (volume_test_players "vol_aw_cave") 10)
    (set s_aw_progression 10)
    (if b_debug 
        (print "s_aw_progression = 10"))
    (sleep_until (volume_test_players "vol_aw_middle") 10)
    (set s_aw_progression 20)
    (if b_debug 
        (print "s_aw_progression = 20"))
    (sleep_until (volume_test_players "vol_aw_pass_bridge") 10)
    (set s_aw_progression 30)
    (if b_debug 
        (print "s_aw_progression = 30"))
)

(script dormant void antiair_wraiths
    (if b_debug 
        (print "starting antiair wraiths"))
    (data_mine_set_mission_segment "070_022_antiair_wraiths")
    (ai_place "cov_aw_pack_bridge")
    (sleep 1)
    (ai_place "cov_aw_wraith_1")
    (sleep 1)
    (ai_place "cov_aw_wraith_2")
    (sleep 1)
    (ai_place "cov_aw_wraith_0")
    (sleep 1)
    (ai_place "cov_aw_watchtower_0")
    (sleep 1)
    (ai_place "cov_aw_watchtower_1")
    (sleep 1)
    (ai_place "cov_aw_fort_pack")
    (sleep 1)
    (ai_place "cov_aw_fort_turrets")
    (sleep 1)
    (ai_place "cov_aw_vehicle_turret")
    (sleep 1)
    (ai_place "cov_aw_infantry_turret")
    (ai_vehicle_enter_immediate "cov_aw_watchtower_0/0" (object_get_turret "aw_cov_watch_pod_0" 0))
    (ai_vehicle_enter_immediate "cov_aw_watchtower_1/0" (object_get_turret "aw_cov_watch_pod_1" 0))
    (ai_set_targeting_group "cov_aw_wraith_1/driver" 1)
    (ai_set_targeting_group "cov_aw_wraith_2/driver" 1)
    (wake aw_player_progression)
    (wake md_aw_aa_intro)
    (wake md_aw_aa_dead)
    (wake aw_manage_save)
    (wake aw_manage_top_bunker)
    (wake 070_music_065)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_aw_cov/bridge_front") 0)
            (>= s_aw_progression 30)
        ) 
    5)
    (ai_place "cov_aw_ghost_0")
    (sleep 1)
    (ai_place "cov_aw_ghost_1")
    (set b_aw_spawned_ghosts true)
    (sleep_until 
        (and
            (<= (ai_living_count "gr_cov_aw_ghosts") 0)
            (<= (ai_task_count "obj_aw_cov/bridge_front") 0)
        )
    )
    (sleep 150)
    (set b_aw_wraith_advance true)
    (sleep_until (<= (ai_living_count "cov_aw_wraith_0") 0))
    (set b_aw_marines_advance true)
)

(script static void antiair_wraiths_cleanup
    (ai_disposable "gr_cov_aw" true)
    (object_destroy_folder "crt_aw")
    (object_destroy_folder "sce_aw")
    (sleep_forever aw_player_progression)
    (sleep_forever antiair_wraiths)
    (set s_aw_progression 200)
    (add_recycling_volume "vol_aw_recycle" 0 5)
)

(script command_script void cs_fl_pelican_arrives
    (unit_open (ai_vehicle_get ai_current_actor))
    (cs_fly_to "pts_fl_pelican/p0")
    (cs_fly_to "pts_fl_pelican/p1")
    (cs_fly_to "pts_fl_pelican/p7")
    (cs_vehicle_boost false)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "pts_fl_pelican/p3" "pts_fl_pelican/face_at0" 1.0)
    (set b_fl_pelican_arrived true)
    (sleep_forever)
)

(script command_script void cs_fl_pelican_exits
    (cs_enable_pathfinding_failsafe true)
    (sleep_until b_fl_chief_in_vehicle)
    (unit_close (ai_vehicle_get ai_current_actor))
    (cs_fly_to "pts_fl_pelican/p5")
    (kill_players_in_volume "vol_la_kill_players")
    (cs_fly_to "pts_fl_pelican/p6")
    (cs_fly_to "pts_fl_pelican/p8")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_fl_get_to_pelican
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until 
        (or
            (volume_test_object "vol_aw_pass_bridge" ai_current_actor)
            (>= s_la_progression 10)
        ) 
    15 1800)
    (sleep_until 
        (or
            (volume_test_object "vol_aw_all" ai_current_actor)
            (>= s_la_progression 10)
        ) 
    15)
    (unit_exit_vehicle ai_current_actor)
    (set s_fl_odst_turn (+ s_fl_odst_turn 1.0))
    (if (= s_fl_odst_turn 1) 
        (begin
            (cs_action_at_player ai_action_wave)
            (ai_play_line_at_player ai_current_actor 070mq_060)
        )
    )
    (cond
        ((= s_fl_odst_turn 1)
            (begin
                (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_l05 false)
                (sleep_until 
                    (begin
                        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_l05)
                        b_fl_chief_in_vehicle
                    ) 
                300)
            )
        )
        ((= s_fl_odst_turn 2)
            (begin
                (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_r05 false)
                (sleep_until 
                    (begin
                        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_r05)
                        b_fl_chief_in_vehicle
                    ) 
                300)
            )
        )
        ((= s_fl_odst_turn 3)
            (begin
                (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_l04 false)
                (sleep_until 
                    (begin
                        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_l04)
                        b_fl_chief_in_vehicle
                    ) 
                300)
            )
        )
        ((= s_fl_odst_turn 4)
            (begin
                (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_r04 false)
                (sleep_until 
                    (begin
                        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_r04)
                        b_fl_chief_in_vehicle
                    ) 
                300)
            )
        )
    )
)

(script command_script void cs_johnson_stay_in_turret
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_forever)
)

(script static void fl_create_frigate
    (object_create "fl_frigate_scenery")
    (object_create "fl_frigate_midshaft_scenery")
    (object_create "fl_frigate_frontshaft_scenery")
    (object_create "fl_frigate_backshaft_scenery")
    (objects_attach "fl_frigate_scenery" "marker_backelevator01" "fl_frigate_frontshaft_scenery" "marker_backelevator")
    (objects_attach "fl_frigate_scenery" "marker_backelevator02" "fl_frigate_midshaft_scenery" "marker_backelevator")
    (objects_attach "fl_frigate_scenery" "marker_backelevator" "fl_frigate_backshaft_scenery" "marker_backelevator")
)

(script static void fl_replace_elevators
    (object_destroy "fl_frigate_midshaft_scenery")
    (object_destroy "fl_frigate_frontshaft_scenery")
    (object_destroy "fl_frigate_backshaft_scenery")
    (object_create "fl_frigate_midshaft")
    (object_create "fl_frigate_frontshaft")
    (object_create "fl_frigate_backshaft")
    (objects_attach "fl_frigate_scenery" "marker_backelevator01" "fl_frigate_frontshaft" "marker_backelevator")
    (objects_attach "fl_frigate_scenery" "marker_backelevator02" "fl_frigate_midshaft" "marker_backelevator")
    (objects_attach "fl_frigate_scenery" "marker_backelevator" "fl_frigate_backshaft" "marker_backelevator")
)

(script static void fl_remove_frigate
    (object_destroy "fl_frigate_scenery")
    (object_destroy "fl_frigate_midshaft_scenery")
    (object_destroy "fl_frigate_frontshaft_scenery")
    (object_destroy "fl_frigate_backshaft_scenery")
)

(script dormant void fl_army_mount_up
    (sleep_until b_fl_frigate_unloading)
    (sleep_until b_fl_tanks_available 10 900)
    (unit_set_enterable_by_player obj_fl_scorpion_0 true)
    (unit_set_enterable_by_player obj_fl_scorpion_1 true)
    (unit_set_enterable_by_player obj_fl_scorpion_2 true)
    (unit_set_enterable_by_player obj_fl_warthog true)
    (sleep_until 
        (or
            (player_in_a_vehicle)
            (>= s_la_progression 25)
        ) 
    30 900)
    (wake fl_stop_briefing)
    (cs_run_command_script "allies_fl_pelican_marines" cs_draw_weapon)
    (cs_run_command_script "gr_allies_before_fl" cs_draw_weapon)
    (sleep 90)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_aw_wraith_1/driver") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "cov_aw_wraith_2/driver") true)
    (ai_enter_squad_vehicles "gr_allies")
    (ai_vehicle_reserve_seat obj_fl_scorpion_0 scorpion_d false)
    (sleep_until 
        (or
            (player_in_a_vehicle)
            (>= s_la_progression 25)
        )
    )
    (set b_fl_chief_in_vehicle true)
)

(script static void fl_wake_vehicles
    (set obj_fl_vehicles (volume_return_objects_by_type "vol_fl_up" 2))
    (set s_fl_list_count (list_count obj_fl_vehicles))
    (set s_fl_list_index 0)
    (sleep_until 
        (begin
            (set obj_fl_current_unit (unit (list_get obj_fl_vehicles s_fl_list_index)))
            (object_wake_physics obj_fl_current_unit)
            (set s_fl_list_index (+ s_fl_list_index 1.0))
            (> s_fl_list_index s_fl_list_count)
        ) 
    1)
)

(script dormant void fl_curtain_fx
    (object_create "dust_curtain_low01")
    (object_create "dust_curtain_low02")
    (object_create "dust_curtain_high01")
    (object_create "dust_curtain_high02")
    (object_create "dust_curtain_high03")
    (object_create "dust_curtain_screenfx")
    (sleep 630)
    (object_destroy "dust_curtain_low01")
    (object_destroy "dust_curtain_low02")
    (object_destroy "dust_curtain_high01")
    (object_destroy "dust_curtain_high02")
    (object_destroy "dust_curtain_high03")
    (object_destroy "dust_curtain_screenfx")
)

(script dormant void fl_circle_fx
    (object_create "dust_landing_circle")
    (sleep 960)
    (object_destroy "dust_landing_circle")
)

(script static void frigate_wind
    (sleep 360)
    (fl_wake_vehicles)
    (object_create "fl_frigate_wind")
    (device_set_position "fl_frigate_wind" 1.0)
    (player_effect_set_max_rotation 0.0 1.0 1.0)
    (player_effect_set_max_rumble 1.0 1.0)
    (player_effect_start 0.25 3.0)
    (ai_cannot_die "gr_allies" true)
    (wake fl_curtain_fx)
    (sleep 150)
    (object_destroy "fl_frigate_wind")
    (ai_cannot_die "gr_allies" false)
    (frigate_push)
)

(script static void frigate_push
    (object_create "fl_frigate_push")
    (device_set_position "fl_frigate_push" 1.0)
    (player_effect_start 0.5 0.5)
    (ai_cannot_die "gr_allies" true)
    (sleep 8)
    (if (volume_test_object "vol_aw_pass_bridge" (player0)) 
        (unit_exit_vehicle (player0)))
    (if (volume_test_object "vol_aw_pass_bridge" (player1)) 
        (unit_exit_vehicle (player1)))
    (if (volume_test_object "vol_aw_pass_bridge" (player2)) 
        (unit_exit_vehicle (player2)))
    (if (volume_test_object "vol_aw_pass_bridge" (player3)) 
        (unit_exit_vehicle (player3)))
    (object_destroy "fl_frigate_push")
    (player_effect_stop 3.0)
    (sleep 30)
    (ai_kill "gr_covenants")
    (sleep 120)
    (ai_cannot_die "gr_allies" false)
    (set b_fl_frigate_arrived true)
    (add_recycling_volume "vol_fl_right_clift" 0 20)
)

(script static void fl_unload_frigate
    (fl_place_allies)
    (device_set_position "fl_frigate_midshaft" 0.755)
    (sleep 5)
    (device_set_position "fl_frigate_frontshaft" 0.82)
    (sleep 5)
    (device_set_position "fl_frigate_backshaft" 0.8)
    (set b_fl_frigate_unloading true)
    (wake fl_circle_fx)
    (object_create_folder "sce_fl_pathfinding")
    (add_recycling_volume "vol_fl_tanks_on_ground" 0 5)
)

(script static void fl_place_allies
    (ai_place "allies_fl_warthog")
    (ai_place "allies_fl_scorpion_0")
    (sleep 15)
    (ai_place "allies_fl_scorpion_1")
    (sleep 10)
    (ai_place "allies_fl_scorpion_2")
    (place_guilty_spark "la_guilty_spark/guilty")
    (set obj_fl_scorpion_0 (ai_vehicle_get_from_starting_location "allies_fl_scorpion_0/driver"))
    (set obj_fl_scorpion_1 (ai_vehicle_get_from_starting_location "allies_fl_scorpion_1/driver"))
    (set obj_fl_scorpion_2 (ai_vehicle_get_from_starting_location "allies_fl_scorpion_2/driver"))
    (set obj_fl_warthog (ai_vehicle_get_from_starting_location "allies_fl_warthog/driver"))
)

(script dormant void fl_place_pelican
    (ai_place "allies_fl_pelican")
    (sleep 1)
    (ai_place "allies_fl_pelican_marines")
    (ai_place "allies_fl_johnson")
    (sleep 1)
    (object_cannot_take_damage (ai_vehicle_get_from_starting_location "allies_fl_johnson/johnson"))
    (object_cannot_take_damage (ai_get_object "allies_fl_johnson/johnson"))
    (ai_cannot_die "allies_fl_johnson" true)
    (set ai_fl_johnson (object_get_ai (ai_get_object "allies_fl_johnson/johnson")))
    (set ai_fl_sergeant (object_get_ai (ai_get_object "allies_fl_pelican_marines/sergeant")))
    (set ai_fl_pelican_marines_0 (object_get_ai (ai_get_object "allies_fl_pelican_marines/marine_0")))
    (set ai_fl_pelican_marines_1 (object_get_ai (ai_get_object "allies_fl_pelican_marines/marine_1")))
    (set ai_fl_pelican_marines_2 (object_get_ai (ai_get_object "allies_fl_pelican_marines/marine_2")))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_l05 (ai_actors "allies_fl_pelican_marines/sergeant"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_r03 (ai_actors "allies_fl_pelican_marines/marine_0"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_r04 (ai_actors "allies_fl_pelican_marines/marine_1"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") pelican_p_l04 (ai_actors "allies_fl_pelican_marines/marine_2"))
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") true)
    (objects_attach (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") "machinegun_turret" (ai_vehicle_get_from_starting_location "allies_fl_johnson/johnson") "")
)

(script dormant void fl_player_position
    (sleep_until 
        (begin
            (if (volume_test_players "vol_fl_entrance") 
                (set s_fl_position 10) (if (volume_test_players "vol_fl_bridge") 
                    (set s_fl_position 20) (if (volume_test_players "vol_fl_down") 
                        (set s_fl_position 30) (if (volume_test_players "vol_fl_up") 
                            (set s_fl_position 40) (set s_fl_position 0))
                    )
                )
            )
            (>= s_la_progression 10)
        )
    )
)

(script dormant void fl_player_progression
    (sleep_until (volume_test_players "vol_aw_cave") 10)
    (set s_fl_progression 10)
    (if b_debug 
        (print "s_fl_progression = 10"))
)

(script dormant void frigate_landing
    (set b_fl_begins true)
    (sleep_until (<= (ai_living_count "gr_cov_aw") 1) 30 300)
    (if b_debug 
        (print "starting frigate landing"))
    (game_save)
    (ai_migrate "allies_aw_warthog_0" "allies_fl_extra_warthog")
    (ai_migrate "allies_aw_warthog_1" "allies_fl_extra_warthog")
    (ai_migrate "allies_aw_mongoose_0" "allies_fl_extra_warthog")
    (ai_migrate "allies_aw_mongoose_1" "allies_fl_extra_warthog")
    (sleep 1)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_fl_pelican/pilot") true)
    (data_mine_set_mission_segment "070_023_frigate_landing")
    (wake fl_player_progression)
    (wake fl_player_position)
    (wake md_fl_allies_wait)
    (wake fl_place_pelican)
    (wake 070_music_07)
    (wake 070_music_08)
    (set b_070_music_07 true)
    (sleep 60)
    (wake 070pa_dialog)
    (sleep_until 
        (and
            (objects_can_see_flag (players) "flg_fl_canyon" 30.0)
            (volume_test_players "vol_fl_up")
        ) 
    30 150)
    (sleep_until 
        (and
            (objects_can_see_flag (players) "flg_fl_canyon" 30.0)
            (volume_test_players "vol_fl_all")
        ) 
    30 300)
    (sleep_until (volume_test_players "vol_fl_all") 10 3600)
    (if (not (volume_test_players "vol_fl_all")) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_fl_frigate_landing" 0.0)
            (sleep_until (volume_test_players "vol_fl_all") 10)
            (hud_deactivate_team_nav_point_flag player "flg_fl_frigate_landing")
        )
    )
    (volume_teleport_players_not_inside "vol_fl_all" "flg_fl_teleport_players")
    (set b_070_music_08 true)
    (set b_070_music_07 false)
    (set b_fl_frigate_arrives true)
    (wake 070pa_start)
    (frigate_wind)
    (sleep_until b_fl_frigate_arrived)
    (wake md_fl_allies_come_back)
    (cs_run_command_script "gr_allies_before_fl" cs_fl_get_to_briefing)
    (sleep 1)
    (cs_run_command_script ai_fly_pelican_commander cs_fl_get_to_pelican)
    (sleep 1)
    (cs_run_command_script ai_fly_pelican_marines_0 cs_fl_get_to_pelican)
    (sleep 1)
    (cs_run_command_script ai_fly_pelican_marines_1 cs_fl_get_to_pelican)
    (sleep 1)
    (cs_run_command_script ai_fly_pelican_marines_2 cs_fl_get_to_pelican)
    (sleep_until b_fl_pelican_arrived 30 300)
    (sleep_until (volume_test_players "vol_fl_up") 10 3600)
    (if (not (volume_test_players "vol_fl_up")) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_fl_frigate" 0.0)
            (sleep_until (volume_test_players "vol_fl_up") 10)
            (hud_deactivate_team_nav_point_flag player "flg_fl_frigate")
        )
    )
    (volume_teleport_players_not_inside "vol_fl_teleport_players" "flg_fl_teleport_players")
    (set b_la_can_start true)
    (wake md_fl_set_objective)
    (wake 070_chapter_forward)
    (wake fl_army_mount_up)
    (wake md_fl_marine_tank_intro)
    (wake vb_fg_sgt_briefing)
    (wake 070bb_dialog)
    (fl_unload_frigate)
)

(script static void frigate_landing_cleanup
    (ai_disposable "allies_fl_pelican" true)
    (ai_disposable "allies_fl_johnson" true)
    (sleep_forever fl_player_progression)
    (sleep_forever fl_player_position)
    (sleep_forever frigate_landing)
    (set s_fl_progression 200)
    (set b_fl_pelican_arrived true)
    (add_recycling_volume "vol_fl_recycle" 0 5)
)

(script command_script void cs_la_wraith_shooting
    (cs_shoot true)
    (cs_enable_moving true)
    (cs_force_combat_status 3)
    (cs_abort_on_damage true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (cs_shoot_point true "pts_la_wraith/p0")
                    (sleep 90)
                )
                (begin
                    (cs_shoot_point true "pts_la_wraith/p1")
                    (sleep 90)
                )
                (begin
                    (cs_shoot_point true "pts_la_wraith/p2")
                    (sleep 90)
                )
                (begin
                    (cs_shoot_point true "pts_la_wraith/p3")
                    (sleep 90)
                )
            )
            false
        )
    )
)

(script command_script void cs_la_p2_phantom
    (cs_enable_pathfinding_failsafe true)
    (object_set_phantom_power (ai_vehicle_get ai_current_actor) true)
    (ai_place "cov_la_p2_1st_tower")
    (sleep 1)
    (object_create "la_cov_watch_pod_0")
    (sleep 1)
    (ai_vehicle_enter_immediate "cov_la_p2_1st_tower/0" (object_get_turret "la_cov_watch_pod_0" 1))
    (ai_vehicle_enter_immediate "cov_la_p2_1st_tower/1" (object_get_turret "la_cov_watch_pod_0" 2))
    (sleep 1)
    (cs_run_command_script "cov_la_p2_1st_tower" cs_stay_in_turret)
    (objects_attach (ai_vehicle_get_from_starting_location "cov_la_p2_phantom/pilot") "" "la_cov_watch_pod_0" "")
    (cs_fly_to "pts_la_p2_phantom/drop_pod")
    (sleep_until (objects_can_see_object (players) (ai_get_object ai_current_actor) 20.0) 30 150)
    (sleep 30)
    (objects_detach (ai_vehicle_get_from_starting_location "cov_la_p2_phantom/pilot") "la_cov_watch_pod_0")
    (sleep 15)
    (object_set_phantom_power (ai_vehicle_get ai_current_actor) false)
    (cs_vehicle_speed 0.6)
    (cs_fly_to "pts_la_p2_phantom/p0" 1.0)
    (ai_trickle_via_phantom "cov_la_p2_phantom/pilot" "cov_la_p2_grunts_0")
    (cs_fly_to "pts_la_p2_phantom/p1" 1.0)
    (cs_face_player true)
    (sleep 300)
    (cs_face_player false)
    (cs_fly_to_and_face "pts_la_p2_phantom/p2" "pts_la_p2_phantom/face_at")
    (kill_players_in_volume "vol_la_kill_players")
    (cs_fly_to "pts_la_p2_phantom/p3")
    (ai_erase (ai_get_squad ai_current_actor))
    (sleep_forever)
)

(script dormant void la_manage_bridge_wraith
    (sleep_until (>= s_la_progression 40))
    (cs_run_command_script "cov_la_p2_bridge_wraith" cs_end)
)

(script dormant void la_change_objective
    (sleep_until 
        (or
            (>= s_la_progression 30)
            (and
                b_la_spawn_p1
                (<= (ai_living_count "gr_cov_la_p1") 0)
            )
        ) 
    10)
    (sleep_until (>= s_la_progression 25))
    (if b_debug 
        (print "la: migrating warthogs to p2"))
    (ai_set_objective "gr_allies_la_warthogs" "obj_la_p2_allies")
    (ai_set_objective (ai_player_get_vehicle_squad (player0)) "obj_la_p2_allies")
    (ai_set_objective (ai_player_get_vehicle_squad (player1)) "obj_la_p2_allies")
    (ai_set_objective (ai_player_get_vehicle_squad (player2)) "obj_la_p2_allies")
    (ai_set_objective (ai_player_get_vehicle_squad (player3)) "obj_la_p2_allies")
    (sleep_until (>= s_la_progression 30))
    (if b_debug 
        (print "la: migrating allies to p2"))
    (ai_set_objective "gr_allies_la" "obj_la_p2_allies")
    (ai_set_objective "gr_guilty_spark" "obj_la_p2_gs")
)

(script dormant void la_heal_warthog
    (sleep_until 
        (begin
            (ai_renew "allies_la_warthog_0")
            (>= s_la_progression 90)
        ) 
    600)
)

(script static void la_teleport_manned_unit (unit current_vehicle, point_reference pts_current, trigger_volume vol_teleport_if_in, trigger_volume vol_dont_teleport_if_in)
    (if (<= s_la_teleport_count (ai_get_point_count pts_current)) 
        (begin
            (if 
                (and
                    (volume_test_object vol_teleport_if_in current_vehicle)
                    (not (volume_test_object vol_dont_teleport_if_in current_vehicle))
                ) 
                    (begin
                        (ai_teleport (object_get_ai (vehicle_driver current_vehicle)) (ai_point_set_get_point pts_current s_la_teleport_count))
                        (set s_la_teleport_count (+ s_la_teleport_count 1.0))
                    )
            )
        )
    )
)

(script dormant void la_teleport_tanks
    (sleep_until 
        (or
            (and
                (not (objects_can_see_flag (players) "flg_la_before_cave" 30.0))
                (not (volume_test_players "vol_la_p1"))
                (not (any_player_dead))
            )
            (>= s_lb_progression 10)
        )
    )
    (if (< s_lb_progression 10) 
        (begin
            (set s_la_teleport_count 0)
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank") "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_scorpion_0/driver") "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_scorpion_1/driver") "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_warthog_0/driver") "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_warthog_1/driver") "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit obj_fl_scorpion_0 "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit obj_fl_scorpion_1 "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit obj_fl_scorpion_2 "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
            (la_teleport_manned_unit obj_fl_warthog "pts_la_p1_teleport_ai" "vol_la_p1" "vol_la_before_cave")
        )
    )
    (sleep_until 
        (or
            (and
                (not (objects_can_see_flag (players) "flg_la_after_cave" 30.0))
                (not (volume_test_players "vol_la_p1"))
                (not (volume_test_players "vol_la_p2_begin"))
                (not (any_player_dead))
            )
            (>= s_lb_progression 10)
        )
    )
    (if (< s_lb_progression 10) 
        (begin
            (set s_la_teleport_count 0)
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank") "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_scorpion_0/driver") "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_scorpion_1/driver") "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_warthog_0/driver") "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit (ai_vehicle_get_from_starting_location "allies_la_warthog_1/driver") "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit obj_fl_scorpion_0 "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit obj_fl_scorpion_1 "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit obj_fl_scorpion_2 "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
            (la_teleport_manned_unit obj_fl_warthog "pts_la_p2_teleport_ai" "vol_la_teleport_if_in" "vol_la_trench")
        )
    )
)

(script dormant void la_manage_checkpoints
    (game_save)
    (sleep_until 
        (or
            (>= s_la_progression 30)
            (and
                (>= s_la_progression 20)
                (<= (ai_living_count "gr_cov_la_p1") 0)
            )
        )
    )
    (if (< s_la_progression 30) 
        (game_save))
    (sleep_until (>= s_la_progression 30) 30 3600)
    (if (< s_la_progression 30) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_la_next_0" 0.0)
            (sleep_until (>= s_la_progression 30) 5)
            (hud_deactivate_team_nav_point_flag player "flg_la_next_0")
        )
    )
    (sleep 30)
    (sleep_until 
        (or
            (>= s_la_progression 50)
            (<= (ai_living_count "gr_cov_la_p2_a") 0)
        )
    )
    (if (< s_la_progression 50) 
        (begin
            (sleep_until (game_safe_to_save) 30 600)
            (game_save)
        )
    )
    (sleep_until (>= s_la_progression 50) 30 3600)
    (if (< s_la_progression 50) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_la_next_1" 0.0)
            (sleep_until (>= s_la_progression 50) 5)
            (hud_deactivate_team_nav_point_flag player "flg_la_next_1")
        )
    )
    (sleep_until 
        (or
            (>= s_la_progression 90)
            (<= (ai_living_count "gr_cov_la_p2_b") 0)
        )
    )
    (if (< s_la_progression 90) 
        (game_save))
    (sleep_until (>= s_la_progression 90) 30 3600)
    (if (< s_la_progression 90) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_la_next_2" 0.0)
            (sleep_until (>= s_la_progression 90) 5)
            (hud_deactivate_team_nav_point_flag player "flg_la_next_2")
        )
    )
)

(script dormant void la_player_progression
    (sleep_until 
        (or
            (volume_test_players "vol_la_going_down")
            (volume_test_players "vol_la_bridge")
            (volume_test_players "vol_la_before_cave")
        ) 
    10)
    (set s_la_progression 10)
    (if b_debug 
        (print "s_la_progression = 10"))
    (sleep_until 
        (or
            (volume_test_players "vol_la_bridge")
            (volume_test_players "vol_la_before_cave")
        ) 
    10)
    (set s_la_progression 20)
    (if b_debug 
        (print "s_la_progression = 20"))
    (sleep_until (volume_test_players "vol_la_recycle_cave") 10)
    (set s_la_progression 22)
    (if b_debug 
        (print "s_la_progression = 22"))
    (sleep_until (volume_test_players "vol_la_before_cave") 10)
    (set s_la_progression 25)
    (if b_debug 
        (print "s_la_progression = 25"))
    (sleep_until (volume_test_players "vol_la_cave") 10)
    (set s_la_progression 30)
    (if b_debug 
        (print "s_la_progression = 30"))
    (sleep_until (volume_test_players "vol_la_after_cave") 10)
    (set s_la_progression 35)
    (if b_debug 
        (print "s_la_progression = 35"))
    (sleep_until (volume_test_players "vol_la_before_trench") 10)
    (set s_la_progression 40)
    (if b_debug 
        (print "s_la_progression = 40"))
    (sleep_until (volume_test_players "vol_la_trench") 10)
    (set s_la_progression 50)
    (if b_debug 
        (print "s_la_progression = 50"))
    (sleep_until (volume_test_players "vol_la_mid_trench") 10)
    (set s_la_progression 60)
    (if b_debug 
        (print "s_la_progression = 60"))
    (sleep_until (volume_test_players "vol_la_trench_end_0") 10)
    (set s_la_progression 70)
    (if b_debug 
        (print "s_la_progression = 70"))
    (sleep_until (volume_test_players "vol_la_trench_end_1") 10)
    (set s_la_progression 80)
    (if b_debug 
        (print "s_la_progression = 80"))
    (sleep_until (volume_test_players "vol_la_trench_end_2") 10)
    (set s_la_progression 90)
    (if b_debug 
        (print "s_la_progression = 90"))
)

(script dormant void lead_the_army
    (if b_debug 
        (print "starting lead the army"))
    (wake la_manage_checkpoints)
    (ai_migrate "allies_fl_scorpion_0" "allies_la_player_scorpion")
    (ai_migrate "allies_fl_scorpion_1" "allies_la_scorpion_0")
    (ai_migrate "allies_fl_scorpion_2" "allies_la_scorpion_1")
    (ai_migrate "allies_fl_warthog" "allies_la_warthog_0")
    (ai_migrate "allies_fl_extra_warthog" "allies_la_warthog_1")
    (data_mine_set_mission_segment "070_030_lead_the_army")
    (ai_place "cov_la_p1_ghosts_0")
    (sleep 1)
    (ai_place "cov_la_p1_ghosts_1")
    (sleep 1)
    (ai_place "cov_la_p1_mauler")
    (object_create "la_cov_watch_base_0")
    (sleep 1)
    (object_create "la_cov_watch_base_1")
    (sleep 1)
    (object_create "la_cov_watch_pod_1")
    (sleep 1)
    (object_create "la_battery_3")
    (sleep 1)
    (object_create "la_battery_2")
    (sleep 1)
    (object_create "la_battery_1")
    (sleep 1)
    (object_create "la_barrier_0")
    (sleep 1)
    (object_create "la_barrier_1")
    (sleep 1)
    (object_create "la_barrier_2")
    (sleep 1)
    (object_create "la_barrier_3")
    (sleep 1)
    (object_destroy "ex_small_crate_0")
    (sleep 1)
    (object_destroy "ex_space_crate_0")
    (sleep 1)
    (object_destroy "ex_space_crate_1")
    (wake la_player_progression)
    (wake la_change_objective)
    (wake la_heal_warthog)
    (wake md_la_tank_advance)
    (wake md_la_gs_cautious)
    (wake la_teleport_tanks)
    (sleep_until 
        (or
            (player_in_a_vehicle)
            (>= s_la_progression 22)
        ) 
    10)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allies_la_player_scorpion/tank") false)
    (sleep_until (>= s_la_progression 22) 10)
    (ai_place "cov_la_p1_hunters")
    (sleep 30)
    (set b_la_spawn_p1 true)
    (sleep_until (>= s_la_progression 30))
    (ai_place "cov_la_p2_phantom")
    (sleep 1)
    (ai_place "cov_la_p2_shade_0")
    (wake la_manage_bridge_wraith)
    (sleep_until (>= s_la_progression 40))
    (ai_place "cov_la_p2_ghosts_0")
    (sleep 1)
    (ai_place "cov_la_p2_ghosts_1")
    (sleep 1)
    (ai_place "cov_la_p2_ghosts_2")
    (sleep 1)
    (ai_place "cov_la_p2_trench_wraith")
    (sleep_until (>= s_la_progression 50))
    (ai_place "cov_la_p2_grunts_1")
    (sleep 1)
    (ai_place "cov_la_p2_jackals_1")
    (sleep 1)
    (ai_place "cov_la_p2_grunt_tower")
    (sleep 1)
    (ai_vehicle_enter_immediate "cov_la_p2_grunt_tower/0" (object_get_turret "la_cov_watch_pod_1" 0))
    (ai_vehicle_enter_immediate "cov_la_p2_grunt_tower/1" (object_get_turret "la_cov_watch_pod_1" 2))
    (cs_run_command_script "cov_la_p2_grunt_tower" cs_stay_in_turret)
)

(script static void lead_the_army_cleanup
    (ai_disposable "gr_cov_la" true)
    (object_destroy_folder "veh_la")
    (object_destroy_folder "crt_la")
    (object_destroy_folder "sce_la")
    (object_destroy_folder "crt_crashed_pelican")
    (sleep_forever la_player_progression)
    (sleep_forever lead_the_army)
    (set s_la_progression 200)
    (add_recycling_volume "vol_la_recycle" 0 5)
)

(script command_script void cs_dw_phantom
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot false)
    (cs_enable_targeting false)
    (cs_enable_looking true)
    (cs_fly_to "pts_dw_phantom/p0")
    (sleep_until (objects_can_see_object (players) (ai_get_object ai_current_actor) 20.0) 30 300)
    (vehicle_unload (ai_vehicle_get_from_starting_location "cov_dw_phantom/pilot") phantom_lc)
    (sleep 60)
    (cs_fly_to "pts_dw_phantom/p1")
    (kill_players_in_volume "vol_dw_kill_players_0")
    (cs_fly_to "pts_dw_phantom/p2")
    (cs_fly_to "pts_dw_phantom/p3" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_dw_phantom_reinf
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot false)
    (cs_enable_targeting false)
    (cs_enable_looking true)
    (cs_fly_to "pts_dw_phantom_reinf/p0")
    (cs_fly_to_and_face "pts_dw_phantom_reinf/p1" "pts_dw_phantom_reinf/face_at" 1.0)
    (vehicle_unload (ai_vehicle_get_from_starting_location "cov_dw_phantom_reinf/pilot") phantom_lc)
    (sleep 30)
    (cs_fly_to_and_face "pts_dw_phantom_reinf/p2" "pts_dw_phantom_reinf/face_at" 1.0)
    (ai_trickle_via_phantom "cov_dw_phantom_reinf/pilot" "cov_dw_bridge_pack_0")
    (ai_trickle_via_phantom "cov_dw_phantom_reinf/pilot" "cov_dw_bridge_pack_1")
    (ai_trickle_via_phantom "cov_dw_phantom_reinf/pilot" "cov_dw_bridge_grunts")
    (cs_fly_to "pts_dw_phantom_reinf/p0")
    (kill_players_in_volume "vol_dw_kill_players_1")
    (cs_fly_to "pts_dw_phantom_reinf/p3" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script dormant void dw_manage_jitter_door
    (sleep_until (= (current_zone_set_fully_active) 5))
    (device_set_power "ex_wall_door" 1.0)
    (device_set_position_immediate "ex_wall_door" 0.2)
    (device_set_position "ex_wall_door" 1.0)
    (device_operates_automatically_set "ex_wall_door" false)
    (object_create "dw_door_spark_0")
    (object_create "dw_door_spark_1")
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (>= s_lb_progression 15)
                    (= (device_get_position "ex_wall_door") 1.0)
                ) 
            1)
            (device_set_position_immediate "ex_wall_door" 0.74)
            (device_set_position "ex_wall_door" 1.0)
            (sound_impulse_start "sound\device_machines\doors_lifts\waste_door_jitter_struggle.sound" "ex_wall_door" 1.0)
            (>= s_lb_progression 15)
        )
    )
)

(script dormant void dw_manage_guilty
    (sleep_until (>= s_dw_progression 50) 15)
    (sleep_until b_dw_combat_finished 15)
    (wake md_dw_open_door)
    (sleep_until b_dw_gs_open_door 15 600)
    (wake dw_manage_jitter_door)
    (ai_migrate "dw_guilty_spark" "lb_guilty_spark")
    (wake md_lb_open_door)
    (sleep_until (volume_test_players "vol_lb_gs_open_door"))
    (sleep_until b_lb_gs_open_door 15 900)
    (device_set_power "lb_first_door" 1.0)
)

(script dormant void dw_manage_vehicles
    (sleep_until (>= s_lb_progression 5) 10)
    (sleep 210)
    (set ol_dw_vehicles (volume_return_objects_by_type "vol_dw_bridge" 2))
    (set s_dw_list_count (list_count ol_dw_vehicles))
    (set s_dw_list_index 0)
    (sleep_until 
        (begin
            (set obj_dw_current_unit (unit (list_get ol_dw_vehicles s_dw_list_index)))
            (if (= (unit_get_team_index (vehicle_gunner obj_dw_current_unit)) 2) 
                (begin
                    (set obj_dw_current_unit (vehicle_gunner obj_dw_current_unit))
                    (set b_dw_found_empty_vehicle true)
                )
            )
            (if (= (unit_get_team_index (unit (list_get (vehicle_riders obj_dw_current_unit) 0))) 2) 
                (begin
                    (set obj_dw_current_unit (unit (list_get (vehicle_riders obj_dw_current_unit) 0)))
                    (set b_dw_found_empty_vehicle true)
                )
            )
            (if 
                (and
                    b_dw_found_empty_vehicle
                    (not (player_in_vehicle (object_get_ai obj_dw_current_unit)))
                ) 
                    (begin
                        (ai_vehicle_exit (ai_get_squad (object_get_ai obj_dw_current_unit)))
                        (sleep 60)
                        (ai_enter_squad_vehicles (ai_get_squad (object_get_ai obj_dw_current_unit)))
                    )
            )
            (set b_dw_found_empty_vehicle false)
            (set s_dw_list_index (+ s_dw_list_index 1.0))
            (> s_dw_list_index s_dw_list_count)
        ) 
    1)
)

(script dormant void dw_player_progression
    (sleep_until (volume_test_players "vol_dw_after_trench") 10)
    (set s_dw_progression 10)
    (if b_debug 
        (print "s_dw_progression = 10"))
    (sleep_until (volume_test_players "vol_dw_entrance") 10)
    (set s_dw_progression 20)
    (if b_debug 
        (print "s_dw_progression = 20"))
    (sleep_until (volume_test_players "vol_dw_advance") 10)
    (set s_dw_progression 25)
    (if b_debug 
        (print "s_dw_progression = 25"))
    (sleep_until (volume_test_players "vol_dw_going_up") 10)
    (set s_dw_progression 30)
    (if b_debug 
        (print "s_dw_progression = 30"))
    (sleep_until (volume_test_players "vol_dw_bridge") 10)
    (set s_dw_progression 40)
    (if b_debug 
        (print "s_dw_progression = 40"))
    (sleep_until (volume_test_players "vol_dw_near_door") 10)
    (set s_dw_progression 50)
    (if b_debug 
        (print "s_dw_progression = 50"))
    (sleep_until (volume_test_players "vol_dw_almost_in") 10)
    (set s_dw_progression 60)
    (if b_debug 
        (print "s_dw_progression = 60"))
)

(script dormant void defend_wall
    (if b_debug 
        (print "starting defend_wall"))
    (game_save)
    (object_create "dw_battery_0")
    (object_create "dw_battery_1")
    (sleep 1)
    (object_create "dw_crate_0")
    (object_create "dw_crate_1")
    (sleep 1)
    (object_create "dw_instant_lover_0")
    (object_create "dw_instant_lover_1")
    (sleep 1)
    (object_create "dw_instant_lover_2")
    (object_create "dw_instant_lover_3")
    (sleep 1)
    (object_destroy "sd_barrier_0")
    (object_destroy "sd_barrier_1")
    (object_destroy "sd_barrier_2")
    (object_destroy "sd_space_crate_0")
    (object_destroy "sd_space_crate_1")
    (ai_migrate "allies_la_player_scorpion" "allies_dw_player_scorpion")
    (ai_migrate "allies_la_scorpion_0" "allies_dw_scorpion_0")
    (ai_migrate "allies_la_scorpion_1" "allies_dw_scorpion_1")
    (ai_migrate "allies_la_warthog_0" "allies_dw_warthog_0")
    (ai_migrate "allies_la_warthog_1" "allies_dw_warthog_0")
    (ai_migrate "la_guilty_spark" "dw_guilty_spark")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (ai_place "cov_dw_phantom")
    (sleep 1)
    (ai_place "cov_dw_wraith_0")
    (sleep 1)
    (ai_place "cov_dw_wraith_1")
    (sleep 1)
    (ai_place "cov_dw_bridge_turrets")
    (sleep 1)
    (ai_place "cov_dw_choppers_down")
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "cov_dw_phantom/pilot") phantom_lc (ai_vehicle_get_from_starting_location "cov_dw_wraith_0/driver"))
    (wake dw_player_progression)
    (wake dw_manage_guilty)
    (wake md_dw_go_to_door)
    (wake 070_music_085)
    (wake 070_music_086)
    (data_mine_set_mission_segment "070_031_defend_wall")
    (sleep_until (>= s_dw_progression 25))
    (ai_place "cov_dw_ghost_up_0")
    (sleep 1)
    (ai_place "cov_dw_ghost_up_1")
    (sleep_until 
        (or
            (<= (ai_living_count "gr_cov_dw_wraiths") 2)
            (>= s_dw_progression 20)
        )
    )
    (sleep 120)
    (ai_place "cov_dw_phantom_reinf")
    (ai_place "cov_dw_bridge_wraith")
    (sleep 1)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "cov_dw_phantom_reinf/pilot") phantom_lc (ai_vehicle_get_from_starting_location "cov_dw_bridge_wraith/driver"))
    (set b_dw_reinf_arrived true)
    (sleep_until 
        (or
            (<= (ai_living_count "gr_cov_dw_wraiths") 0)
            (>= s_dw_progression 30)
        )
    )
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (set b_gs_follow_player false)
    (sleep_until (<= (ai_living_count "cov_dw_bridge_wraith/driver") 0))
    (sleep_until (<= (ai_living_count "gr_cov_dw") 6))
    (sleep_until (<= (ai_living_count "gr_cov_dw") 3) 30 900)
    (sleep_until (<= (ai_living_count "gr_cov_dw") 1) 30 300)
    (wake md_dw_allies_next)
    (wake dw_manage_vehicles)
    (set b_dw_combat_finished true)
)

(script static void defend_wall_cleanup
    (ai_disposable "gr_cov_dw" true)
    (sleep_forever dw_player_progression)
    (sleep_forever defend_wall)
    (set s_dw_progression 200)
    (add_recycling_volume "vol_dw_recycle" 0 5)
)

(script command_script void cs_lb_constructor_groove
    (sleep_until 
        (begin
            (cs_enable_moving true)
            (cs_shoot_point false (ai_nearest_point ai_current_actor "pts_lb_constructors"))
            (cs_shoot false)
            (sleep (random_range 150 210))
            (cs_enable_moving false)
            (cs_shoot_point true (ai_nearest_point ai_current_actor "pts_lb_constructors"))
            (sleep (random_range 150 210))
            b_lb_lightbridge_on
        )
    )
    (cs_enable_moving true)
    (cs_shoot_point false (ai_nearest_point ai_current_actor "pts_lb_constructors"))
    (cs_shoot false)
    (sleep_until (volume_test_object "vol_lb_sentinel_disappear" ai_current_actor))
    (ai_erase ai_current_actor)
)

(script command_script void cs_lb_sentinel_approach
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (ai_set_task (ai_get_squad ai_current_actor) "obj_lb_for" "sentinels_follow")
    (sleep_until 
        (and
            (<= (objects_distance_to_object (players) ai_current_actor) 3.0)
            (objects_can_see_object (players) ai_current_actor 40.0)
        ) 
    5 1200)
    (if (<= (objects_distance_to_object (players) ai_current_actor) 4.0) 
        (begin
            (cs_face_player true)
            (cs_enable_moving false)
            (if b_dialogue 
                (print "sentinel: noise"))
            (cs_play_sound "sound\characters\sentinel\sentinel_posing")
            (cs_enable_moving true)
        )
    )
    (sleep_until b_lb_gs_open_door)
    (cs_run_command_script ai_current_actor cs_lb_sentinel_groove)
)

(script command_script void cs_lb_sentinel_groove
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_face_player false)
    (ai_set_task (ai_get_squad ai_current_actor) "obj_lb_for" "sentinels_up")
    (sleep_until (volume_test_object "vol_lb_center" ai_current_actor) 30 600)
    (sleep (random_range 450 600))
    (ai_set_task (ai_get_squad ai_current_actor) "obj_lb_for" "sentinels_down")
    (sleep_until (volume_test_object "vol_lb_sentinel_disappear" ai_current_actor))
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_lb_teleport_to_point
    (if (< s_lb_teleport_count (- (ai_get_point_count "pts_lb_teleport_ai") 1.0)) 
        (begin
            (cs_teleport (ai_point_set_get_point "pts_lb_teleport_ai" s_lb_teleport_count) "pts_lb_teleport_ai/face_at")
            (set s_lb_teleport_count (+ s_lb_teleport_count 1.0))
        )
    )
)

(script command_script void cs_lb_wait_for_lightbridge
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until b_lb_lightbridge_on)
)

(script dormant void lb_manage_constructor_position
    (sleep_until 
        (begin
            (begin_random
                (if (not b_lb_lightbridge_on) 
                    (begin
                        (set s_lb_constructor_position 1)
                        (sleep (random_range 210 300))
                    )
                )
                (if (not b_lb_lightbridge_on) 
                    (begin
                        (set s_lb_constructor_position 2)
                        (sleep (random_range 210 300))
                    )
                )
                (if (not b_lb_lightbridge_on) 
                    (begin
                        (set s_lb_constructor_position 3)
                        (sleep (random_range 210 300))
                    )
                )
                (if (not b_lb_lightbridge_on) 
                    (begin
                        (set s_lb_constructor_position 4)
                        (sleep (random_range 210 300))
                    )
                )
            )
            b_lb_lightbridge_on
        )
    )
    (sleep 450)
    (set b_lb_constructors_exit true)
)

(script dormant void lb_stop_sentinel_spawning
    (sleep 120)
    (sleep_until 
        (or
            (ai_allegiance_broken player sentinel)
            (>= s_lb_progression 50)
        ) 
    1)
    (sleep_forever lb_manage_sentinel_spawning)
)

(script dormant void lb_manage_sentinel_spawning
    (wake lb_stop_sentinel_spawning)
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (volume_test_players "vol_lb_spawn_sentinels")
                    (<= (ai_living_count "gr_for_lb_sentinels") 3)
                )
            )
            (cond
                ((= s_lb_sentinel_spawner 0)
                    (ai_place "for_lb_sentinel_0")
                )
                ((= s_lb_sentinel_spawner 1)
                    (ai_place "for_lb_sentinel_1")
                )
                ((= s_lb_sentinel_spawner 2)
                    (ai_place "for_lb_sentinel_2")
                )
                ((= s_lb_sentinel_spawner 3)
                    (ai_place "for_lb_sentinel_3")
                )
                ((= s_lb_sentinel_spawner 4)
                    (ai_place "for_lb_sentinel_4")
                )
                ((= s_lb_sentinel_spawner 5)
                    (ai_place "for_lb_sentinel_5")
                )
                ((= s_lb_sentinel_spawner 6)
                    (ai_place "for_lb_sentinel_6")
                )
                ((= s_lb_sentinel_spawner 7)
                    (ai_place "for_lb_sentinel_7")
                )
            )
            (sleep 60)
            (unit_close "lb_emitter_1")
            (unit_close "lb_emitter_2")
            (set s_lb_sentinel_spawner (+ s_lb_sentinel_spawner 1.0))
            (if (= s_lb_sentinel_spawner 8) 
                (set s_lb_sentinel_spawner 0))
            false
        ) 
    300)
)

(script static void lb_migrate_units (ai migrate_from, ai migrate_to, trigger_volume passed_volume)
    (set s_list_count 0)
    (set s_list_index 0)
    (set ol_unit_list migrate_from)
    (set s_list_count (list_count ol_unit_list))
    (sleep_until 
        (begin
            (set obj_current_unit (unit (list_get ol_unit_list s_list_index)))
            (if (volume_test_object passed_volume (unit obj_current_unit)) 
                (begin
                    (ai_migrate (object_get_ai obj_current_unit) migrate_to)
                )
            )
            (set s_list_index (+ s_list_index 1.0))
            (> s_list_index s_list_count)
        ) 
    1)
)

(script dormant void lb_teleport_allies
    (set ol_lb_vehicles (volume_return_objects_by_type "vol_dw_teleport_allies" 2))
    (set s_lb_list_count (list_count ol_lb_vehicles))
    (set s_lb_list_index 0)
    (set s_lb_nb_tank 0)
    (sleep_until 
        (begin
            (set obj_lb_current_unit (unit (list_get ol_lb_vehicles s_lb_list_index)))
            (if (= (unit_get_team_index (vehicle_driver obj_lb_current_unit)) 2) 
                (begin
                    (cs_run_command_script (object_get_ai (vehicle_driver obj_lb_current_unit)) cs_lb_teleport_to_point)
                    (sleep 1)
                    (if 
                        (or
                            (vehicle_test_seat_list (ai_vehicle_get (object_get_ai (vehicle_driver obj_lb_current_unit))) "scorpion_d" (ai_actors "gr_allies"))
                            (vehicle_test_seat_list (ai_vehicle_get (object_get_ai (vehicle_driver obj_lb_current_unit))) "wraith_d" (ai_actors "gr_allies"))
                        ) 
                            (set s_lb_nb_tank (+ s_lb_nb_tank 1.0)))
                )
            )
            (set s_lb_list_index (+ s_lb_list_index 1.0))
            (> s_lb_list_index s_lb_list_count)
        ) 
    1)
    (sleep 1)
    (lb_migrate_units "allies_dw_player_scorpion" "allies_lb_scorpion_0" "vol_lb_allies_wait")
    (lb_migrate_units "allies_dw_scorpion_0" "allies_lb_scorpion_1" "vol_lb_allies_wait")
    (lb_migrate_units "allies_dw_scorpion_1" "allies_lb_scorpion_2" "vol_lb_allies_wait")
    (lb_migrate_units "allies_dw_warthog_0" "allies_lb_warthog_2" "vol_lb_allies_wait")
    (set ol_lb_vehicles (volume_return_objects_by_type "vol_lb_allies_wait" 2))
    (set s_lb_list_count (list_count ol_lb_vehicles))
    (if 
        (and
            (< s_lb_nb_tank 3)
            (<= (ai_living_count "allies_lb_scorpion_0") 0)
        ) 
            (begin
                (ai_place "allies_lb_scorpion_0")
                (set s_lb_nb_tank (+ s_lb_nb_tank 1.0))
            )
    )
    (if 
        (and
            (< s_lb_nb_tank 3)
            (<= (ai_living_count "allies_lb_scorpion_1") 0)
        ) 
            (begin
                (ai_place "allies_lb_scorpion_1")
                (set s_lb_nb_tank (+ s_lb_nb_tank 1.0))
            )
    )
    (if 
        (and
            (< s_lb_nb_tank 3)
            (<= (ai_living_count "allies_lb_scorpion_2") 0)
        ) 
            (begin
                (ai_place "allies_lb_scorpion_2")
                (set s_lb_nb_tank (+ s_lb_nb_tank 1.0))
            )
    )
    (if (< (- s_lb_list_count s_lb_nb_tank) 3.0) 
        (ai_place "allies_lb_warthog_0"))
    (if (< (- s_lb_list_count s_lb_nb_tank) 2.0) 
        (ai_place "allies_lb_warthog_1"))
    (if (< (- s_lb_list_count s_lb_nb_tank) 1.0) 
        (ai_place "allies_lb_warthog_2"))
)

(script dormant void lb_manage_kill_volume
    (sleep_until 
        (begin
            (kill_players_in_volume "vol_lb_kill_volume")
            (>= s_bb_progression 50)
        ) 
    5)
)

(script dormant void lb_manage_lightbridge
    (sleep_until (<= (device_get_position "lb_lightbridge_switch") 0.9) 5 3600)
    (if (> (device_get_position "lb_lightbridge_switch") 0.9) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_lb_switch" 0.0)
            (sleep_until (<= (device_get_position "lb_lightbridge_switch") 0.9) 5)
            (hud_deactivate_team_nav_point_flag player "flg_lb_switch")
        )
    )
    (object_create "lb_lightbridge")
    (device_set_position "lb_lightbridge" 1.0)
    (object_create "lb_terminal")
    (objects_attach "lb_terminal_base" "forerunner_terminal" "lb_terminal" "")
    (device_set_power "lb_terminal_base" 1.0)
    (device_set_power "lb_guardian_door" 1.0)
    (device_set_position "lb_guardian_door" 1.0)
    (device_set_power "lb_right_large_door" 1.0)
    (device_set_position "lb_right_large_door" 1.0)
    (device_closes_automatically_set "lb_right_large_door" false)
    (device_operates_automatically_set "lb_lightbridge_device" false)
    (device_set_position "lb_lightbridge_device" 0.0)
    (sleep_until (>= (device_get_position "lb_lightbridge") 0.95) 30 300)
    (set b_lb_lightbridge_on true)
    (sleep_until (>= s_lb_progression 50) 30 3600)
    (if (< s_lb_progression 50) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_lb_next" 0.0)
            (sleep_until (>= s_lb_progression 50))
            (hud_deactivate_team_nav_point_flag player "flg_lb_next")
        )
    )
)

(script dormant void lb_player_progression
    (sleep_until (volume_test_players "vol_lb_after_door") 10)
    (set s_lb_progression 5)
    (if b_debug 
        (print "s_lb_progression = 5"))
    (sleep_until (volume_test_players "vol_lb_entrance") 10)
    (set s_lb_progression 10)
    (if b_debug 
        (print "s_lb_progression = 10"))
    (sleep_until (volume_test_players "vol_lb_mid_entrance") 10)
    (set s_lb_progression 15)
    (if b_debug 
        (print "s_lb_progression = 15"))
    (sleep_until (volume_test_players "vol_lb_switch_room") 10)
    (set s_lb_progression 20)
    (if b_debug 
        (print "s_lb_progression = 20"))
    (sleep_until (volume_test_players "vol_lb_near_guardian_room") 10)
    (set s_lb_progression 30)
    (if b_debug 
        (print "s_lb_progression = 30"))
    (sleep_until (volume_test_players "vol_lb_guardian_room") 10)
    (set s_lb_progression 40)
    (if b_debug 
        (print "s_lb_progression = 40"))
    (sleep_until (volume_test_players "vol_lb_final_room") 10)
    (set s_lb_progression 50)
    (if b_debug 
        (print "s_lb_progression = 50"))
)

(script dormant void lightbridge
    (if b_debug 
        (print "starting lightbridge"))
    (game_save)
    (wake lb_player_progression)
    (wake md_lb_gs_go_to_switch)
    (wake md_lb_gs_next)
    (wake background_lightbridge)
    (wake bd_get_inside_shaft)
    (wake lb_manage_kill_volume)
    (wake 070_music_09)
    (wake lb_manage_constructor_position)
    (wake lb_manage_sentinel_spawning)
    (data_mine_set_mission_segment "070_040_lightbridge")
    (objective_2_clear)
    (ai_place "for_lb_constructors")
    (sleep_until (>= s_lb_progression 10) 10)
    (ai_place "for_lb_sentinel_intro")
    (sleep 60)
    (unit_close "lb_emitter_0")
    (sleep_until (>= s_lb_progression 15) 10)
    (wake lb_manage_lightbridge)
    (set b_070_music_085 false)
    (set b_070_music_086 false)
    (set b_070_music_09 true)
    (set s_gs_walkup_dist 3)
    (set s_gs_talking_dist 4)
    (set g_gs_1st_line 070mh_450)
    (set g_gs_2nd_line 070mk_150)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
)

(script static void lightbridge_cleanup
    (ai_disposable "gr_for_lb" true)
    (object_destroy_folder "veh_lb")
    (sleep_forever lb_player_progression)
    (sleep_forever lightbridge)
    (set s_lb_progression 200)
    (add_recycling_volume "vol_lb_recycle" 0 5)
)

(script command_script void cs_bb_entrance_reinf_0
    (cs_shoot true)
    (cs_go_to "pts_bb_entrance_reinf/p0")
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_face true "pts_bb_entrance_reinf/face_at")
    (sleep_until (>= s_bb_progression 50))
)

(script command_script void cs_bb_entrance_reinf_1
    (cs_shoot true)
    (cs_go_to "pts_bb_entrance_reinf/p1")
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_face true "pts_bb_entrance_reinf/face_at")
    (sleep_until (>= s_bb_progression 50))
)

(script command_script void cs_bb_entrance_reinf_2
    (cs_shoot true)
    (cs_go_to "pts_bb_entrance_reinf/p2")
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_face true "pts_bb_entrance_reinf/face_at")
    (sleep_until (>= s_bb_progression 50))
)

(script command_script void cs_bb_entrance_reinf_3
    (cs_shoot true)
    (cs_go_to "pts_bb_entrance_reinf/p3")
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_face true "pts_bb_entrance_reinf/face_at")
    (sleep_until (>= s_bb_progression 50))
)

(script command_script void cs_bb_ghost_intro
    (cs_enable_moving true)
    (cs_vehicle_boost true)
    (cs_shoot true)
    (sleep 120)
)

(script command_script void cs_bb_wraiths_shoot_rnd_move
    (cs_enable_moving true)
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_force_combat_status 3)
    (cs_abort_on_damage true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (if (not b_bb_trying_save) 
                        (cs_shoot_point true "pts_bb_wraiths/p6"))
                    (sleep 30)
                    (cs_shoot false)
                )
                (begin
                    (if (not b_bb_trying_save) 
                        (cs_shoot_point true "pts_bb_wraiths/p7"))
                    (sleep 30)
                    (cs_shoot false)
                )
                (begin
                    (if (not b_bb_trying_save) 
                        (cs_shoot_point true "pts_bb_wraiths/p8"))
                    (sleep 30)
                    (cs_shoot false)
                )
                (begin
                    (if (not b_bb_trying_save) 
                        (cs_shoot_point true "pts_bb_wraiths/p9"))
                    (sleep 30)
                    (cs_shoot false)
                )
                (begin
                    (if (not b_bb_trying_save) 
                        (cs_shoot_point true "pts_bb_wraiths/p10"))
                    (sleep 30)
                    (cs_shoot false)
                )
                (begin
                    (if (not b_bb_trying_save) 
                        (cs_shoot_point true "pts_bb_wraiths/p11"))
                    (sleep 30)
                    (cs_shoot false)
                )
                (begin
                    (if (not b_bb_trying_save) 
                        (cs_shoot_point true "pts_bb_wraiths/p12"))
                    (sleep 30)
                    (cs_shoot false)
                )
            )
            false
        )
    )
)

(script command_script void cs_bb_stay_alert
    (cs_enable_moving true)
    (cs_shoot true)
    (cs_enable_targeting true)
    (sleep_until 
        (begin
            (cs_force_combat_status 3)
            (if b_bb_trying_save 
                (cs_shoot false) (cs_shoot true))
            false
        ) 
    30)
)

(script command_script void cs_bb_tanks
    (cs_enable_moving true)
    (cs_shoot true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_vehicle_speed 0.3)
    (sleep_forever)
)

(script dormant void bb_manage_intro_warthog
    (ai_place "allies_bb_player_warthog")
    (sleep 1)
    (set b_bb_warthog_spawned true)
    (ai_cannot_die "allies_bb_player_warthog" true)
    (object_cannot_die (ai_vehicle_get_from_starting_location "allies_bb_player_warthog/driver") true)
    (object_cannot_take_damage (ai_vehicle_get_from_starting_location "allies_bb_player_warthog/driver"))
    (sleep_until 
        (or
            (not (unit_in_vehicle "allies_bb_player_warthog/driver"))
            (<= (objects_distance_to_object (players) (ai_get_object "allies_bb_player_warthog/driver")) 1.5)
        ) 
    1)
    (cs_run_command_script "allies_bb_player_warthog/driver" cs_end)
    (unit_exit_vehicle "allies_bb_player_warthog/driver")
    (sleep_until (not (unit_in_vehicle "allies_bb_player_warthog/driver")))
    (wake md_bb_marine_hop_in)
    (if b_debug 
        (print "reserving the warthog driver seat"))
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "allies_bb_player_warthog/driver") warthog_d true)
    (sleep_until (player_in_a_vehicle) 30 600)
    (if b_debug 
        (print "cancelling the warthog driver seat reservation"))
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "allies_bb_player_warthog/driver") warthog_d false)
)

(script command_script void cs_bb_warthog
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_abort_on_vehicle_exit true)
    (cs_go_to "pts_bb_warthog/p0")
    (cs_go_to "pts_bb_warthog/p4")
    (cs_go_to "pts_bb_warthog/p5")
    (if (<= s_bb_progression 10) 
        (begin
            (cs_vehicle_speed 0.5)
            (cs_go_to "pts_bb_warthog/p6")
            (cs_go_to "pts_bb_warthog/p7")
        )
    )
    (unit_exit_vehicle ai_current_actor)
)

(script command_script void cs_bb_warthog_gunner
    (cs_shoot false)
    (cs_abort_on_vehicle_exit true)
    (sleep_until (not (volume_test_object "vol_bb_canyon" ai_current_actor)))
    (sleep (random_range 60 120))
    (ai_cannot_die ai_current_actor false)
    (ai_kill ai_current_actor)
)

(script command_script void cs_bb_warthog_passenger
    (cs_shoot true)
    (cs_abort_on_vehicle_exit true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_enable_moving true)
    (sleep_until (not (unit_in_vehicle "allies_bb_player_warthog/driver")))
    (unit_exit_vehicle ai_current_actor)
)

(script command_script void cs_bb_ghost_retreat_0
    (cs_abort_on_vehicle_exit true)
    (cs_go_to "pts_bb_ghosts/p0")
)

(script command_script void cs_bb_ghost_retreat_1
    (cs_abort_on_vehicle_exit true)
    (if (not (volume_test_players "vol_bb_canyon_middle")) 
        (cs_go_to "pts_bb_ghosts/p1"))
)

(script command_script void cs_bb_phantom_retreat
    (vehicle_unload (ai_vehicle_get_from_starting_location "cov_bb_front_phantom/pilot") phantom_lc)
    (sleep 60)
    (set b_bb_wraith_dropped true)
    (ai_set_blind ai_current_actor false)
    (cs_fly_to "pts_bb_front_phantom/p7")
)

(script command_script void cs_bb_phantom_drop
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_fly_to "pts_bb_front_phantom/p1")
    (ai_trickle_via_phantom "cov_bb_front_phantom/pilot" "cov_bb_flak_cannon")
    (set b_bb_dropped_3rd_floor true)
    (set b_bb_dropped_cache_defense true)
    (cs_run_command_script ai_current_actor cs_bb_phantom_exit)
)

(script command_script void cs_bb_phantom_exit
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot false)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (kill_players_in_volume "vol_bb_kill_players")
    (object_set_phantom_power (ai_vehicle_get_from_starting_location "cov_bb_front_phantom/pilot") false)
    (cs_fly_to_and_face "pts_bb_front_phantom/p2" "pts_bb_front_phantom/p3")
    (cs_fly_to "pts_bb_front_phantom/p3")
    (cs_fly_to "pts_bb_front_phantom/p4")
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_bb_teleport_scorpion_0
    (cs_teleport "pts_bb_scorpions/spawn_0" "pts_bb_scorpions/face_at")
    (cs_move_in_direction -90.0 0.2 0.0)
    (cs_run_command_script ai_current_actor cs_bb_scorpion_dumb)
)

(script command_script void cs_bb_teleport_scorpion_1
    (cs_teleport "pts_bb_scorpions/spawn_1" "pts_bb_scorpions/face_at")
    (cs_move_in_direction -90.0 0.3 0.0)
    (cs_run_command_script ai_current_actor cs_bb_scorpion_dumb)
)

(script command_script void cs_bb_teleport_scorpion_2
    (cs_teleport "pts_bb_scorpions/spawn_2" "pts_bb_scorpions/face_at")
    (cs_move_in_direction -90.0 0.3 0.0)
    (cs_run_command_script ai_current_actor cs_bb_scorpion_dumb)
)

(script command_script void cs_bb_scorpion_dumb
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until g_null)
)

(script command_script void cs_bb_scarab_around_wall
    (cs_custom_animation "objects\giants\scarab\cinematics\vignettes\070vd_scarab_over_wall\070vd_scarab_over_wall" "070vd_scarab_around_wall" false)
    (set bb_scarab_spawned true)
)

(script command_script void cs_bb_canyon_turret
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_abort_on_damage true)
    (sleep_until (>= s_bb_progression 50))
)

(script static void bb_teleport_scorpions
    (device_set_position_immediate "bb_scorpion_door" 1.0)
    (sleep 1)
    (cs_run_command_script "allies_bb_scorpion_0" cs_bb_teleport_scorpion_0)
    (cs_run_command_script "allies_bb_scorpion_1" cs_bb_teleport_scorpion_1)
    (cs_run_command_script "allies_bb_scorpion_2" cs_bb_teleport_scorpion_2)
)

(script static void bb_reserve_all_vehicles (boolean b_reserve)
    (set ol_bb_vehicles (volume_return_objects_by_type "vol_bb_bottom_floor" 2))
    (set s_bb_list_count (list_count ol_bb_vehicles))
    (set s_bb_list_index 0)
    (sleep_until 
        (begin
            (set obj_bb_current_unit (unit (list_get ol_bb_vehicles s_lb_list_index)))
            (if (= (unit_get_team_index (vehicle_driver obj_bb_current_unit)) 2) 
                (ai_vehicle_reserve (ai_vehicle_get (object_get_ai obj_bb_current_unit)) b_reserve))
            (set s_bb_list_index (+ s_bb_list_index 1.0))
            (> s_bb_list_index s_bb_list_count)
        ) 
    1)
)

(script dormant void bb_heal_allies_warthog
    (sleep_until b_bb_warthog_spawned)
    (sleep_until 
        (begin
            (ai_renew "allies_bb_player_warthog")
            b_bb_scarab_battle_begun
        ) 
    150)
)

(script dormant void bb_heal_allies_tanks
    (sleep_until 
        (begin
            (ai_renew "allies_bb_scorpion_0")
            (ai_renew "allies_bb_scorpion_1")
            (ai_renew "allies_bb_scorpion_2")
            b_bb_scarab_battle_begun
        ) 
    150)
)

(script dormant void bb_wake_wraiths
    (sleep_until (>= s_bb_progression 40))
    (ai_place "cov_bb_wraith_2")
    (cs_run_command_script "cov_bb_wraith_0/driver" cs_end)
    (cs_run_command_script "cov_bb_wraith_1/driver" cs_bb_wraiths_shoot_rnd_move)
    (cs_run_command_script "cov_bb_wraith_2/driver" cs_bb_wraiths_shoot_rnd_move)
    (cs_run_command_script "cov_bb_wraith_3/driver" cs_bb_wraiths_shoot_rnd_move)
    (sleep_until 
        (or
            (>= s_bb_progression 55)
            (>= (ai_task_count "obj_bb_allies/1st_floor") 1)
        )
    )
    (cs_run_command_script "cov_bb_wraith_0/driver" cs_end)
    (cs_run_command_script "cov_bb_wraith_1/driver" cs_end)
    (sleep_until 
        (or
            (>= s_bb_progression 60)
            (>= (ai_task_count "obj_bb_allies/2nd_floor") 1)
        )
    )
    (cs_run_command_script "obj_bb_allies/3rd_floor" cs_end)
    (cs_run_command_script "cov_bb_wraith_2/driver" cs_end)
    (cs_run_command_script "cov_bb_wraith_3/driver" cs_end)
)

(script dormant void bb_manage_base_defense
    (sleep_until 
        (and
            (or
                (object_model_target_destroyed "bb_scarab" "indirect_engine")
                (<= (ai_living_count "cov_bb_scarab") 0)
            )
            bb_scarab_spawned
            (or
                (volume_test_players "vol_abb_spawn_base")
                b_bb_shipmaster_dialog_finished
            )
        )
    )
    (data_mine_set_mission_segment "070_053_after_big_battle")
    (ai_place "cov_abb_base_grt_pack")
    (sleep 1)
    (ai_place "cov_abb_base_jck_0")
    (sleep 1)
    (ai_place "cov_abb_base_jck_1")
    (ai_disregard (ai_actors "allies_abb_pelican") true)
    (sleep_until (>= s_abb_progression 2) 10)
    (ai_place "cov_abb_base_jackals")
    (sleep 1)
    (ai_place "cov_abb_base_brutes")
    (sleep 1)
    (sleep_until (>= s_abb_progression 5) 10)
    (ai_place "cov_abb_base_jck_2")
    (sleep 1)
    (ai_place "cov_abb_base_brt_middle")
    (sleep 1)
    (ai_place "cov_abb_base_brt_top")
    (ai_disregard (ai_actors "allies_abb_pelican") true)
    (sleep_until b_abb_pelican_arrived 30 1800)
    (sleep 300)
    (ai_disregard (ai_actors "allies_abb_pelican") false)
    (ai_disregard (ai_actors "gr_marines") false)
)

(script dormant void bb_manage_stop_scarab_battle
    (sleep_until 
        (and
            (or
                (object_model_target_destroyed "bb_scarab" "indirect_engine")
                (<= (ai_living_count "cov_bb_scarab") 0)
            )
            bb_scarab_spawned
        )
    )
    (sound_impulse_stop "sound\dialog\070_waste\mission\070mq_010_pot.sound")
    (sound_impulse_stop "sound\dialog\070_waste\mission\070mq_020_pot.sound")
    (sound_impulse_stop "sound\dialog\070_waste\mission\070mq_030_pot.sound")
    (sleep_forever bb_manage_scarab_battle_reinf)
    (sleep_forever md_bb_scarab_radio)
    (sleep_forever md_bb_scarab_hint_interior)
    (sleep_forever md_bb_scarab_hint)
    (sleep_until 
        (and
            (<= (ai_living_count "cov_bb_scarab") 0)
            bb_scarab_spawned
        )
    )
    (ai_kill "gr_cov_bb_scarab_troops")
)

(script dormant void bb_manage_scarab_battle_reinf
    (sleep_until (<= (ai_living_count "gr_allies_bb") 4))
    (ai_place "allies_bb_warthog_reinf_0")
    (sleep 1)
    (sleep_until (<= (ai_living_count "gr_allies_bb") 4))
    (ai_place "allies_bb_warthog_reinf_1")
    (sleep 1)
    (sleep_until (<= (ai_living_count "gr_allies_bb") 4))
    (ai_place "allies_bb_warthog_reinf_2")
)

(script dormant void bb_manage_scarab_battle
    (sleep_until 
        (and
            (>= s_bb_progression 80)
            bb_scarab_spawned
        )
    )
    (wake bb_manage_stop_scarab_battle)
    (wake bb_manage_scarab_battle_reinf)
    (wake md_bb_scarab_hint)
    (sleep_until (not (unit_is_playing_custom_animation "cov_bb_scarab")))
    (ai_place "cov_bb_scarab_snipers")
    (sleep 1)
    (ai_place "cov_bb_scarab_brt_pck_0")
    (sleep 30)
    (ai_place "cov_bb_scarab_jackals_0")
    (sleep 1)
    (ai_place "cov_bb_scarab_jackals_1")
    (sleep 1)
    (set b_bb_scarab_battle_begun true)
    (if (>= (ai_living_count "cov_bb_scarab") 1) 
        (data_mine_set_mission_segment "070_052_big_battle_scarab"))
    (ai_magically_see "gr_allies_bb_scorpion" "cov_bb_scarab")
    (ai_magically_see "allies_bb_player_warthog" "cov_bb_scarab")
    (ai_magically_see "cov_bb_scarab" "gr_allies_bb_scorpion")
    (sleep_until 
        (or
            (>= (object_buckling_magnitude_get "bb_scarab") 0.5)
            (object_model_target_destroyed "bb_scarab" "indirect_engine")
        )
    )
    (set s_070_music_10 (max s_070_music_10 4.0))
    (sleep_until (object_model_target_destroyed "bb_scarab" "indirect_engine") 10)
    (set s_070_music_10 (max s_070_music_10 5.0))
    (sleep_until (<= (ai_living_count "cov_bb_scarab") 0) 10)
    (set b_070_music_11 true)
    (if 
        (and
            b_ee_unlocked
            (>= (game_difficulty_get_real) legendary)
        ) 
            (ee_main))
)

(script dormant void bb_resupply_ghosts
    (sleep_until 
        (and
            (>= s_bb_progression 50)
            (<= (ai_task_count "obj_bb_cov/entrance_vehicle_1") 0)
        )
    )
    (set b_bb_ghosts_escort_wraiths true)
    (sleep 15)
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 2))
    (if (< s_bb_progression 50) 
        (ai_place "cov_bb_ghosts_1st"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 2))
    (if (< s_bb_progression 50) 
        (ai_place "cov_bb_ghosts_2nd_0"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 2))
    (if (< s_bb_progression 50) 
        (ai_place "cov_bb_ghosts_2nd_1"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 2))
    (if (< s_bb_progression 50) 
        (ai_place "cov_bb_ghosts_2nd_2"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 2))
    (if (< s_bb_progression 60) 
        (ai_place "cov_bb_ghosts_3rd_0"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 2))
    (if (< s_bb_progression 60) 
        (ai_place "cov_bb_ghosts_3rd_1"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 2))
    (if (< s_bb_progression 60) 
        (ai_place "cov_bb_ghosts_3rd_2"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 1))
    (sleep_until bb_scarab_spawned)
    (sleep_until 
        (and
            (not (objects_can_see_flag (players) "flg_bb_ghost_spawn" 90.0))
            (not (volume_test_players "vol_bb_ghost_spawn"))
        ) 
    15)
    (if (not (object_model_target_destroyed "bb_scarab" "indirect_engine")) 
        (ai_place "cov_bb_scarab_ghost_0"))
    (sleep_until (<= (ai_living_count "gr_cov_bb_ghosts") 1))
    (sleep_until 
        (and
            (not (objects_can_see_flag (players) "flg_bb_ghost_spawn" 90.0))
            (not (volume_test_players "vol_bb_ghost_spawn"))
        ) 
    15)
    (if (not (object_model_target_destroyed "bb_scarab" "indirect_engine")) 
        (ai_place "cov_bb_scarab_ghost_1"))
)

(script dormant void bb_analyze_route
    (sleep_until 
        (or
            (volume_test_players "vol_bb_dropdown")
            (volume_test_players "vol_bb_canyon")
        )
    )
    (if (volume_test_players "vol_bb_canyon") 
        (set b_bb_player_went_canyon true))
    (sleep_until (volume_test_players "vol_bb_dropdown"))
    (set s_bb_skip_progression 40)
)

(script dormant void bb_recycle_objects
    (sleep_until 
        (begin
            (add_recycling_volume "vol_bb_recycle" 30 10)
            (> s_f1_progression 0)
        ) 
    (* 10.0 30.0))
)

(script dormant void bb_allies_progression
    (sleep_until (not (= (ai_task_status "obj_bb_cov/canyon") ai_task_status_exhausted)))
    (set s_bb_allies_progression 10)
    (sleep_until 
        (or
            (>= s_bb_progression 30)
            (player_in_a_vehicle)
        )
    )
    (set s_bb_allies_progression 15)
    (sleep_until 
        (and
            (>= s_bb_progression 40)
            (<= (ai_task_count "obj_bb_cov/entrance") 1)
        )
    )
    (set s_bb_allies_progression 20)
    (sleep_until 
        (and
            (>= s_bb_progression 50)
            (<= (ai_task_count "obj_bb_cov/1st_floor") 0)
            (<= (ai_task_count "obj_bb_cov/entrance") 1)
        )
    )
    (set s_bb_allies_progression 30)
    (sleep_until 
        (and
            (>= s_bb_progression 60)
            (<= (ai_task_count "obj_bb_cov/2nd_floor") 0)
            (<= (ai_task_count "obj_bb_cov/1st_floor") 0)
        )
    )
    (set s_bb_allies_progression 40)
    (sleep_until 
        (and
            (>= s_bb_progression 70)
            (<= (ai_task_count "obj_bb_cov/3rd_floor") 2)
            (<= (ai_task_count "obj_bb_cov/2nd_floor") 0)
            (<= (ai_task_count "obj_bb_cov/1st_floor") 0)
        )
    )
    (set s_bb_allies_progression 50)
    (sleep_until 
        (and
            (>= s_bb_progression 80)
            bb_scarab_spawned
            (<= (ai_living_count "cov_bb_scarab") 0)
            (<= (ai_task_count "obj_bb_cov/3rd_floor") 2)
            (<= (ai_task_count "obj_bb_cov/2nd_floor") 0)
            (<= (ai_task_count "obj_bb_cov/1st_floor") 0)
        )
    )
    (set s_bb_allies_progression 60)
)

(script dormant void bb_player_position
    (sleep_until 
        (begin
            (if (volume_test_players "vol_bb_1st_floor") 
                (set s_bb_position 1) (if (volume_test_players "vol_bb_2nd_floor") 
                    (set s_bb_position 2) (if (volume_test_players "vol_bb_bottom_floor") 
                        (set s_bb_position 3) (set s_bb_position 0))
                )
            )
            (> s_f1_progression 0)
        )
    )
)

(script dormant void bb_player_progression
    (sleep_until 
        (or
            (volume_test_players "vol_bb_vd_start")
            (>= s_bb_skip_progression 10)
        ) 
    5)
    (set s_bb_progression 10)
    (if b_debug 
        (print "s_bb_progression = 10"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_canyon_start")
            (>= s_bb_skip_progression 20)
        ) 
    5)
    (set s_bb_progression 20)
    (if b_debug 
        (print "s_bb_progression = 20"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_canyon")
            (>= s_bb_skip_progression 30)
        ) 
    5)
    (set s_bb_progression 30)
    (if b_debug 
        (print "s_bb_progression = 30"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_canyon_middle")
            (>= s_bb_skip_progression 35)
        ) 
    5)
    (set s_bb_progression 35)
    (if b_debug 
        (print "s_bb_progression = 35"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_canyon_end")
            (>= s_bb_skip_progression 40)
        ) 
    5)
    (set s_bb_progression 40)
    (if b_debug 
        (print "s_bb_progression = 40"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_1st_floor_start")
            (and
                (volume_test_players "vol_bb_canyon_end")
                (<= (ai_task_count "obj_bb_cov/canyon") 1)
            )
            (>= s_bb_skip_progression 50)
        ) 
    5)
    (set s_bb_progression 50)
    (if b_debug 
        (print "s_bb_progression = 50"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_1st_floor")
            (>= s_bb_skip_progression 55)
        ) 
    5)
    (set s_bb_progression 55)
    (if b_debug 
        (print "s_bb_progression = 55"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_2nd_floor_start")
            (>= s_bb_skip_progression 60)
        ) 
    5)
    (set s_bb_progression 60)
    (if b_debug 
        (print "s_bb_progression = 60"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_3rd_floor_start")
            (>= s_bb_skip_progression 70)
        ) 
    5)
    (set s_bb_progression 70)
    (if b_debug 
        (print "s_bb_progression = 70"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_4th_floor_start")
            (>= s_bb_skip_progression 80)
        ) 
    5)
    (set s_bb_progression 80)
    (if b_debug 
        (print "s_bb_progression = 80"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_base")
            (>= s_bb_skip_progression 90)
        ) 
    5)
    (set s_bb_progression 90)
    (if b_debug 
        (print "s_bb_progression = 90"))
    (sleep_until 
        (or
            (volume_test_players "vol_bb_base_back")
            (>= s_bb_skip_progression 100)
        ) 
    5)
    (set s_bb_progression 100)
    (if b_debug 
        (print "s_bb_progression = 100"))
    (sleep_until 
        (or
            (volume_test_players "vol_abb_pelican_lz")
            (>= s_bb_skip_progression 110)
        ) 
    5)
    (set s_bb_progression 110)
    (if b_debug 
        (print "s_bb_progression = 110"))
)

(script dormant void bb_game_save_entrance
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "vol_bb_1st_floor_start"))
            (set b_bb_trying_save true)
            (if b_debug 
                (print "trying to save..."))
            (sleep_until (game_safe_to_save) 10 150)
            (game_save)
            (sleep 90)
            (set b_bb_trying_save false)
            (if b_debug 
                (print "stopped trying to save..."))
            (not (game_safe_to_save))
        )
    )
)

(script dormant void bb_game_save_f1
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "vol_bb_1st_floor"))
            (sleep_until (not b_playing_dialogue) 30 150)
            (set b_bb_trying_save true)
            (if b_debug 
                (print "trying to save..."))
            (sleep_until (game_safe_to_save) 10 150)
            (game_save)
            (sleep 90)
            (set b_bb_trying_save false)
            (if b_debug 
                (print "stopped trying to save..."))
            (not (game_safe_to_save))
        )
    )
)

(script dormant void bb_game_save_f2
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "vol_bb_2nd_floor"))
            (sleep_until (not b_playing_dialogue) 30 150)
            (set b_bb_trying_save true)
            (if b_debug 
                (print "trying to save..."))
            (sleep_until (game_safe_to_save) 10 300)
            (game_save)
            (sleep 90)
            (set b_bb_trying_save false)
            (if b_debug 
                (print "stopped trying to save..."))
            (not (game_safe_to_save))
        )
    )
)

(script dormant void bb_game_save
    (sleep_until (player_in_a_vehicle) 30 900)
    (if (player_in_a_vehicle) 
        (begin
            (sleep_until (not b_playing_dialogue) 30 150)
            (set b_bb_trying_save true)
            (if b_debug 
                (print "trying to save..."))
            (sleep_until (game_safe_to_save) 10 90)
            (game_save)
            (sleep 90)
            (set b_bb_trying_save false)
            (if b_debug 
                (print "stopped trying to save..."))
        )
    )
    (sleep_until (>= s_bb_progression 30))
    (if (not (volume_test_players "vol_bb_dropdown")) 
        (begin
            (set b_bb_trying_save true)
            (if b_debug 
                (print "trying to save..."))
            (sleep_until (game_safe_to_save) 10 90)
            (game_save)
            (sleep 90)
            (set b_bb_trying_save false)
            (if b_debug 
                (print "stopped trying to save..."))
        )
    )
    (sleep_until 
        (and
            (>= s_bb_progression 30)
            (<= (ai_task_count "obj_bb_cov/canyon") 0)
        ) 
    10)
    (set b_bb_trying_save true)
    (if b_debug 
        (print "trying to save..."))
    (sleep_until (game_safe_to_save) 10 90)
    (game_save)
    (sleep 90)
    (set b_bb_trying_save false)
    (if b_debug 
        (print "stopped trying to save..."))
    (sleep_until (<= (ai_task_count "obj_bb_cov/entrance_vehicle_1") 2))
    (wake bb_game_save_entrance)
    (sleep_until (< (ai_living_count "gr_cov_bb_1st_floor") 1))
    (wake bb_game_save_f1)
    (sleep_until (< (ai_living_count "gr_cov_bb_2nd_floor") 1))
    (wake bb_game_save_f2)
    (sleep_until (< (ai_living_count "gr_cov_bb_3rd_floor") 1))
    (set b_bb_trying_save true)
    (if b_debug 
        (print "trying to save..."))
    (sleep_until (game_safe_to_save) 10 210)
    (game_save)
    (sleep 90)
    (set b_bb_trying_save false)
    (if b_debug 
        (print "stopped trying to save..."))
    (sleep_until 
        (and
            (<= (ai_living_count "cov_bb_scarab") 0)
            bb_scarab_spawned
            (<= (ai_living_count "gr_cov_bb_ghosts") 0)
        )
    )
    (sleep 90)
    (set b_bb_trying_save true)
    (if b_debug 
        (print "trying to save..."))
    (sleep_until (game_safe_to_save) 10 450)
    (game_save)
    (sleep 90)
    (set b_bb_trying_save false)
    (if b_debug 
        (print "stopped trying to save..."))
)

(script dormant void big_battle
    (switch_zone_set "070_020_030")
    (wake bb_player_progression)
    (wake bb_player_position)
    (wake bb_manage_scarab_battle)
    (wake bb_game_save)
    (wake bb_resupply_ghosts)
    (wake bb_analyze_route)
    (wake 070vd_scarab_over_wall_intro)
    (wake bb_recycle_objects)
    (wake bb_allies_progression)
    (wake 070_music_10)
    (wake 070_music_11)
    (data_mine_set_mission_segment "070_050_big_battle_canyon")
    (ai_migrate "allies_lb_warthog_1" "allies_bb_warthog_entrance_0")
    (ai_migrate "allies_lb_warthog_2" "allies_bb_warthog_entrance_1")
    (ai_migrate "allies_lb_scorpion_0" "allies_bb_scorpion_0")
    (ai_migrate "allies_lb_scorpion_1" "allies_bb_scorpion_1")
    (ai_migrate "allies_lb_scorpion_2" "allies_bb_scorpion_2")
    (ai_place "cov_bb_front_phantom")
    (sleep 1)
    (ai_place "cov_bb_wraith_0")
    (sleep 1)
    (ai_place "cov_bb_wraith_1")
    (sleep 1)
    (ai_place "cov_bb_wraith_3")
    (sleep 1)
    (ai_place "cov_bb_choppers")
    (sleep 1)
    (ai_place "cov_bb_empty_chopper")
    (sleep 1)
    (ai_place "cov_bb_canyon_infantry")
    (sleep 1)
    (ai_force_active "gr_cov_bb_entrance" true)
    (ai_force_active "cov_bb_wraith_1" true)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "cov_bb_front_phantom/pilot") phantom_lc (ai_vehicle_get_from_starting_location "cov_bb_wraith_0/driver"))
    (wake bb_wake_wraiths)
    (wake bb_heal_allies_warthog)
    (sleep_until 
        (or
            (>= (device_get_position "bb_player_door") 0.22)
            (>= s_bb_progression 30)
        ) 
    5)
    (set s_070_music_10 (max s_070_music_10 1.0))
    (sleep_until (>= s_bb_progression 30) 30 450)
    (set b_bb_phantom_retreat true)
    (sleep_until (>= s_bb_progression 30))
    (sleep 30)
    (if b_bb_player_went_canyon 
        (begin
            (if b_debug 
                (print "spawning some ghosts to guide the player in canyon"))
            (if (<= (ai_living_count "gr_cov_bb_canyon_vehicles") 1) 
                (ai_place "cov_bb_canyon_2"))
            (sleep 1)
            (if (<= (ai_living_count "gr_cov_bb_canyon_vehicles") 2) 
                (ai_place "cov_bb_canyon_3"))
        ) (if b_debug 
            (print "not spawning ghosts in canyon - player skipped that part"))
    )
    (if b_debug 
        (print "allied warthog can now die!"))
    (ai_cannot_die "allies_bb_player_warthog" false)
    (object_cannot_die (ai_vehicle_get_from_starting_location "allies_bb_player_warthog/driver") false)
    (object_can_take_damage (ai_vehicle_get_from_starting_location "allies_bb_player_warthog/driver"))
    (ai_place "cov_bb_entrance_reinf_0")
    (ai_place "cov_bb_entrance_reinf_1")
    (sleep 1)
    (sleep 1)
    (wake bb_heal_allies_tanks)
    (wake md_bb_marine_advance_0)
    (wake md_bb_marine_advance_1)
    (wake md_bb_marine_advance_2)
    (wake md_bb_marine_advance_3)
    (wake md_abb_scarab_dead)
    (wake md_abb_shipmaster_reward)
    (ai_disregard (ai_actors "cov_bb_front_phantom") true)
    (sleep_until (>= s_bb_progression 50))
    (data_mine_set_mission_segment "070_051_big_battle_wraiths")
    (sleep_until 
        (or
            (>= s_bb_progression 60)
            (<= (ai_task_count "obj_bb_cov/2nd_floor") 1)
        )
    )
    (sleep 1)
    (cs_run_command_script "cov_bb_front_phantom/pilot" cs_bb_phantom_drop)
    (sleep 1)
    (ai_place "cov_bb_flak_cannon_reinf")
    (sleep_until 
        (or
            (>= s_bb_progression 70)
            (<= (ai_task_count "obj_bb_cov/3rd_floor") 1)
        )
    )
    (wake bb_manage_base_defense)
)

(script static void big_battle_cleanup
    (ai_disposable "gr_cov_bb" true)
    (ai_disposable "allies_bb_scorpion_0" true)
    (ai_disposable "allies_bb_scorpion_1" true)
    (ai_disposable "allies_bb_scorpion_2" true)
    (ai_disposable "allies_bb_player_warthog" true)
    (ai_disposable "allies_bb_warthog_entrance_0" true)
    (ai_disposable "allies_bb_warthog_entrance_1" true)
    (object_destroy "bb_scarab")
    (object_destroy_folder "veh_bb")
    (object_destroy_folder "crt_bb")
    (sleep_forever bb_player_progression)
    (sleep_forever bb_player_position)
    (sleep_forever big_battle)
    (set s_bb_progression 200)
    (add_recycling_volume "vol_bb_recycle" 0 5)
)

(script dormant void abb_gs_open_door
    (sleep_until 
        (or
            (volume_test_players "vol_bb_base")
            (volume_test_players "vol_bb_base_back")
        )
    )
    (sleep_until 
        (begin
            (if 
                (and
                    (not (volume_test_object "vol_abb_pelican_lz" obj_guilty_spark))
                    (not (objects_can_see_object (players) obj_guilty_spark 30.0))
                ) 
                    (object_teleport "gr_guilty_spark" "flg_abb_teleport_gs"))
            (volume_test_players "vol_bb_base_back")
        )
    )
    (if (not (volume_test_object "vol_abb_pelican_lz" obj_guilty_spark)) 
        (object_teleport "gr_guilty_spark" "flg_abb_teleport_gs"))
    (cs_run_command_script "gr_guilty_spark" cs_abb_guilty_spark_wait)
    (sleep_until (volume_test_players "vol_abb_storm_in") 5)
    (sleep_until 
        (or
            (player_notice_object "vol_abb_storm_in" obj_guilty_spark)
            (volume_test_players "vol_abb_shaft_entrance")
        ) 
    5)
    (device_set_power "shaft_door" 1.0)
    (wake md_abb_gs_tries_to_close_door)
)

(script dormant void abb_player_progression
    (sleep_until 
        (or
            (volume_test_players "vol_abb_before_ramp")
            (volume_test_players "vol_abb_near_base")
        ) 
    15)
    (set s_abb_progression 2)
    (if b_debug 
        (print "s_abb_progression = 2"))
    (sleep_until (volume_test_players "vol_abb_before_ramp") 15)
    (set s_abb_progression 5)
    (if b_debug 
        (print "s_abb_progression = 5"))
    (sleep_until (volume_test_players "vol_abb_halfway_ramp") 15)
    (set s_abb_progression 7)
    (if b_debug 
        (print "s_abb_progression = 7"))
    (sleep_until (volume_test_players "vol_abb_pelican_lz") 15)
    (set s_abb_progression 10)
    (if b_debug 
        (print "s_abb_progression = 10"))
    (set b_070_music_11 false)
    (sleep_until (volume_test_players "vol_f1_start") 15)
    (set s_abb_progression 20)
    (if b_debug 
        (print "s_abb_progression = 20"))
)

(script static void start_after_big_battle
    (ai_disposable "gr_covenants" true)
    (switch_zone_set "070_030_040")
    (sleep 1)
    (object_teleport (player0) "flg_after_sc_start_location")
    (object_teleport (player1) "flg_after_sc_start_location")
    (wake after_big_battle)
    (place_guilty_spark "abb_guilty_spark/guilty")
    (sleep 1)
    (unit_add_equipment (player0) "br_profile" true true)
    (unit_add_equipment (player1) "br_profile" true true)
)

(script dormant void after_big_battle
    (sleep 90)
    (set b_abb_has_started true)
    (switch_zone_set "070_030_040")
    (sleep 1)
    (if b_debug 
        (print "070_as_arbiter_arrives"))
    (ai_place "allies_abb_pelican")
    (sleep 1)
    (ai_place "allies_abb_johnson")
    (place_arbiter "allies_abb_arbiter/arbiter")
    (ai_place "allies_abb_pelican_marines")
    (sleep 1)
    (ai_cannot_die "allies_abb_arbiter" true)
    (ai_cannot_die "allies_abb_johnson" true)
    (set ai_abb_arbiter (object_get_ai (ai_get_object "allies_abb_arbiter/arbiter")))
    (set ai_abb_johnson (object_get_ai (ai_get_object "allies_abb_johnson/johnson")))
    (set ai_abb_pelican_marines_0 (object_get_ai (ai_get_object "allies_abb_pelican_marines/0")))
    (set ai_abb_pelican_marines_1 (object_get_ai (ai_get_object "allies_abb_pelican_marines/1")))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_abb_pelican/pilot") pelican_e (ai_actors "allies_abb_johnson"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_abb_pelican/pilot") pelican_p_r05 (ai_actors "allies_abb_arbiter"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_abb_pelican/pilot") pelican_p_r03 (ai_actors "allies_abb_pelican_marines/0"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "allies_abb_pelican/pilot") pelican_p_r04 (ai_actors "allies_abb_pelican_marines/1"))
    (wake md_abb_jon_bring_arb)
    (wake abb_gs_open_door)
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (set b_gs_follow_player false)
    (ai_migrate "bb_guilty_spark" "abb_guilty_spark")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (if b_debug 
        (print "guiding the player to go upstairs"))
    (wake abb_player_progression)
    (sleep_until (script_finished "md_abb_jon_bring_arb") 10)
    (device_set_power "shaft_door" 1.0)
)

(script static void after_big_battle_cleanup
    (ai_disposable "gr_cov_bb" true)
    (ai_disposable "allies_abb_pelican" true)
    (ai_disposable "allies_abb_johnson" true)
    (ai_erase_inactive "gr_marines" 0)
    (sleep_forever abb_player_progression)
    (sleep_forever after_big_battle)
    (set s_abb_progression 200)
    (add_recycling_volume "vol_bb_recycle" 0 5)
)

(script dormant void f1_player_progression
    (sleep_until (volume_test_players "vol_f1_back") 15 1200)
    (set s_f1_progression 10)
    (if b_debug 
        (print "s_f1_progression = 10"))
    (sleep_until (volume_test_players "vol_f1_front") 15)
    (set s_f1_progression 20)
    (if b_debug 
        (print "s_f1_progression = 20"))
    (sleep_until (volume_test_players "vol_f1_stairway") 15)
    (set s_f1_progression 30)
    (if b_debug 
        (print "s_f1_progression = 30"))
    (set b_070_music_12 true)
)

(script dormant void f1_close_door
    (device_set_power "shaft_door" 1.0)
    (device_closes_automatically_set "shaft_door" true)
    (shut_door_forever "shaft_door")
)

(script dormant void floor_1
    (sleep_until 
        (or
            (and
                (volume_test_players "vol_f1_start_player")
                (or
                    (game_is_cooperative)
                    (volume_test_object "vol_f1_start" obj_arbiter)
                )
                (volume_test_object "vol_f1_start" "allies_abb_pelican_marines")
                (volume_test_object "vol_f1_start" "abb_guilty_spark")
            )
            b_f1_start_now
        ) 
    1 (* 10.0 30.0))
    (sleep_until 
        (or
            (and
                (volume_test_players "vol_f1_start_player")
                (or
                    (volume_test_object "vol_f1_start" obj_arbiter)
                    (game_is_cooperative)
                )
                (volume_test_object "vol_f1_start" "abb_guilty_spark")
            )
            b_f1_start_now
        ) 
    1 (* 10.0 30.0))
    (sleep_until (volume_test_players "vol_f1_start_player") 1)
    (if (not b_f1_start_now) 
        (begin
            (if 
                (and
                    (not (volume_test_object "vol_f1_start" obj_arbiter))
                    (not (game_is_cooperative))
                ) 
                    (object_teleport "gr_arbiter" "flg_f1_teleport_ai_2"))
            (if (not (volume_test_object "vol_f1_start" "abb_guilty_spark")) 
                (object_teleport "gr_guilty_spark" "flg_f1_teleport_gs"))
            (if (not (volume_test_object "vol_f1_start" "allies_abb_pelican_marines/0")) 
                (object_teleport "allies_abb_pelican_marines/0" "flg_f1_teleport_ai_0"))
            (if (not (volume_test_object "vol_f1_start" "allies_abb_pelican_marines/1")) 
                (object_teleport "allies_abb_pelican_marines/1" "flg_f1_teleport_ai_1"))
        )
    )
    (set b_f1_has_started true)
    (if b_debug 
        (print "starting floor 1"))
    (if b_debug 
        (print "070_as_locked_in"))
    (if b_debug 
        (print "070be_find_the_maproom"))
    (wake f1_close_door)
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (set b_gs_follow_player false)
    (ai_migrate "abb_guilty_spark" "f1_guilty_spark")
    (migrate_arbiter "allies_abb_arbiter" "allies_f1_arbiter")
    (ai_migrate "allies_abb_pelican_marines" "allies_f1_mar")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (ai_renew "allies_f1_mar")
    (wake vd_343_door_shocker)
    (wake 070_music_12)
    (if (!= g_insertion_index 14) 
        (wake 070_chapter_real_men))
    (sleep 150)
    (volume_teleport_players_not_inside "vol_f1_start" "flg_f1_start_location_p0")
    (game_save)
    (prepare_to_switch_to_zone_set "070_040_050_071")
    (sleep_until 
        (or
            b_f1_ambiant_finished
            (script_finished "vd_343_door_shocker")
        ) 
    30 3600)
    (sleep_until (script_finished "vd_stop_343_door_shocker") 30 300)
    (unit_add_equipment (unit obj_guilty_spark) "no_weapon_profile" true false)
    (switch_zone_set "070_040_050_071")
    (game_save)
    (data_mine_set_mission_segment "070_060_floor_1")
    (ai_place "cov_f1_grt_pack")
    (sleep 15)
    (wake background_shaft)
    (wake f1_player_progression)
    (wake md_f1_after_f1)
    (device_set_power "f1_entrance_door" 1.0)
    (wake md_f1_sleeping_grunts)
    (sleep_until 
        (or
            (<= (ai_living_count "gr_cov_f1") 0)
            (> (ai_combat_status "gr_cov_f1") ai_combat_status_active)
        )
    )
    (set b_f1_combat_started true)
    (sleep_until (<= (ai_living_count "gr_cov_f1") 0))
    (set b_f1_combat_finished true)
)

(script static void floor_1_cleanup
    (ai_disposable "gr_cov_f1" true)
    (object_destroy_folder "crt_f1")
    (sleep_forever f1_player_progression)
    (sleep_forever floor_1)
    (set s_f1_progression 200)
    (add_recycling_volume "vol_f1_recycle" 0 5)
)

(script dormant void f2_teleport_gs
    (sleep_until (>= s_f2_progression 40) 15)
    (if (not (volume_test_object "vol_f2_all" "gr_guilty_spark")) 
        (begin
            (if b_debug 
                (print "f2: teleporting gs"))
            (ai_bring_forward obj_guilty_spark 4.0)
        ) (if b_debug 
            (print "f2: not teleporting gs"))
    )
)

(script dormant void f2_manage_terminal
    (object_create "f2_terminal")
    (objects_attach "f2_terminal_base" "forerunner_terminal" "f2_terminal" "")
)

(script dormant void f2_player_progression
    (sleep_until (volume_test_players "vol_f2_advance_0") 10)
    (set s_f2_progression 10)
    (if b_debug 
        (print "s_f2_progression = 10"))
    (sleep_until (volume_test_players "vol_f2_advance_1") 10)
    (set s_f2_progression 20)
    (if b_debug 
        (print "s_f2_progression = 20"))
    (sleep_until (volume_test_players "vol_f2_advance_2") 10)
    (set s_f2_progression 30)
    (if b_debug 
        (print "s_f2_progression = 30"))
    (sleep_until (volume_test_players "vol_f2_advance_3") 10)
    (set s_f2_progression 40)
    (if b_debug 
        (print "s_f2_progression = 40"))
    (sleep_until (volume_test_players "vol_f2_advance_4") 10)
    (set s_f2_progression 50)
    (if b_debug 
        (print "s_f2_progression = 50"))
    (sleep_until (volume_test_players "vol_f2_advance_5") 10)
    (set s_f2_progression 60)
    (if b_debug 
        (print "s_f2_progression = 60"))
)

(script dormant void floor_2
    (set b_f2_has_started true)
    (if b_debug 
        (print "starting floor 2"))
    (game_save)
    (ai_migrate "allies_f1_mar" "allies_f2_mar")
    (migrate_arbiter "allies_f1_arbiter" "allies_f2_arbiter")
    (sleep 1)
    (ai_renew "allies_f2_mar")
    (ai_migrate "f1_guilty_spark" "f2_guilty_spark")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (data_mine_set_mission_segment "070_070_floor_2")
    (ai_place "cov_f2_grt_pack")
    (sleep 1)
    (wake f2_player_progression)
    (wake f2_intro_stop_dialogs)
    (wake f2_teleport_gs)
    (wake f2_manage_terminal)
    (wake md_f2_gs_next)
)

(script static void floor_2_cleanup
    (ai_disposable "gr_cov_f2" true)
    (object_destroy_folder "crt_f2")
    (sleep_forever f2_player_progression)
    (sleep_forever floor_2)
    (set s_f2_progression 200)
    (add_recycling_volume "vol_f2_recycle" 0 5)
)

(script command_script void cs_f3_banshee_0
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "pts_f3_banshee/p0")
    (cs_shoot_point true "pts_f3_banshee/shoot_at_0")
    (cs_vehicle_speed 0.3)
    (cs_fly_to "pts_f3_banshee/p1")
    (cs_shoot_point true "pts_f3_banshee/shoot_at_1")
    (cs_vehicle_speed 0.2)
    (cs_fly_to "pts_f3_banshee/p2")
    (cs_shoot false)
    (cs_vehicle_speed 0.8)
    (cs_fly_to "pts_f3_banshee/p3")
)

(script command_script void cs_f3_banshee_flyout
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_looking true)
    (cs_fly_to "pts_f3_banshee/p4" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_f3_phantom_0
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.3)
    (cs_fly_to_and_face "pts_f3_phantom/p0" "pts_f3_phantom/face_1")
    (sleep_forever)
)

(script command_script void cs_f3_phantom_exit
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.3)
    (cs_fly_to_and_face "pts_f3_phantom/p0" "pts_f3_phantom/face_1")
    (sleep_until 
        (or
            (<= (ai_living_count "cov_f3_phantom/grunt_0") 0)
            (<= (ai_living_count "cov_f3_phantom/grunt_1") 0)
            (>= s_f3_p2_progression 30)
        ) 
    30 600)
    (cs_fly_to_and_face "pts_f3_phantom/p2" "pts_f3_phantom/face_0" 1.0)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_looking true)
    (cs_vehicle_speed 0.8)
    (cs_fly_to "pts_f3_phantom/p3" 1.0)
    (kill_players_in_volume "vol_f3_kill_players")
    (cs_fly_to "pts_f3_phantom/p4" 1.0)
    (cs_fly_to "pts_f3_phantom/p5" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_f3_shoot_arbiter
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot true (ai_get_object "allies_f3_arbiter"))
    (sleep_forever)
)

(script command_script void cs_f3_flank_right
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_go_to "pts_f3_marine_0/right")
)

(script command_script void cs_f3_flank_left
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_go_to "pts_f3_marine_0/left")
)

(script command_script void cs_f3_p1_go_to_banshee_0
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot false)
    (cs_enable_looking true)
    (cs_enable_targeting false)
    (cs_go_to "pts_f3_p1_banshee/p0")
    (sleep_until (>= s_f3_p1_progression 25) 5)
)

(script command_script void cs_f3_p1_go_to_banshee_1
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot false)
    (cs_enable_looking true)
    (cs_enable_targeting false)
    (cs_go_to "pts_f3_p1_banshee/p1")
    (sleep_until (>= s_f3_p1_progression 25) 5)
)

(script command_script void cs_f3_p1_get_in_banshee_0
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot false)
    (cs_enable_looking false)
    (cs_enable_targeting false)
    (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "cov_f3_banshees/banshee_0"))
    (sleep_until (unit_in_vehicle ai_current_actor) 5)
    (cs_abort_on_vehicle_exit true)
    (cs_fly_to "pts_f3_p1_banshee/fly_0")
    (cs_fly_to "pts_f3_p1_banshee/fly_1")
    (cs_fly_to "pts_f3_p1_banshee/fly_2")
    (object_destroy (ai_vehicle_get ai_current_actor))
    (ai_erase ai_current_actor)
)

(script command_script void cs_f3_p1_get_in_banshee_1
    (cs_enable_pathfinding_failsafe true)
    (cs_shoot false)
    (cs_enable_looking false)
    (cs_enable_targeting false)
    (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "cov_f3_banshees/banshee_1"))
    (sleep_until (unit_in_vehicle ai_current_actor) 5)
    (cs_abort_on_vehicle_exit true)
    (cs_fly_to "pts_f3_p1_banshee/fly_3")
    (cs_fly_to "pts_f3_p1_banshee/fly_4")
    (cs_fly_to "pts_f3_p1_banshee/fly_5")
    (object_destroy (ai_vehicle_get ai_current_actor))
    (ai_erase ai_current_actor)
)

(script command_script void cs_f3_p1_intro_brute
    (cs_enable_pathfinding_failsafe true)
    (cs_draw)
    (sleep_until (>= (device_get_position "f3_door_2") 0.1) 30 600)
    (sound_impulse_start "sound\dialog\combat\brute2\03_strike\charge" ai_current_actor 1.0)
    (cs_custom_animation "objects\characters\brute\brute" "armored:rifle:shakefist:var1" true)
    (sleep (unit_get_custom_animation_time ai_current_actor))
    (cs_stop_custom_animation)
)

(script dormant void f3_manage_kill_volumes
    (sleep_until 
        (begin
            (kill_players_in_volume "vol_kill_f3_0")
            (kill_players_in_volume "vol_kill_f3_1")
            (kill_players_in_volume "vol_kill_f3_2")
            (kill_players_in_volume "vol_kill_f3_3")
            (if (< s_f4_progression 30) 
                (begin
                    (kill_players_in_volume "vol_kill_f3_4")
                    (kill_players_in_volume "vol_kill_f3_5")
                )
            )
            false
        ) 
    10)
)

(script dormant void f3_take_combat_outside
    (sleep_until (>= s_f3_p2_progression 30) 30 1800)
    (if (not (>= s_f3_p2_progression 30)) 
        (begin
            (set b_f3_p2_take_combat_outside true)
            (ai_set_objective "cov_f3_p2_pack" "obj_f3_p2_cov_outside")
            (ai_set_objective "gr_marines" "obj_f3_p2_allies_outside")
            (sleep_until 
                (or
                    (>= s_f3_p2_progression 30)
                    (<= (ai_strength "cov_f3_p2_pack") 0.75)
                    (<= (ai_living_count "cov_f3_p2_pack") 3)
                )
            )
            (ai_set_objective "cov_f3_p2_pack" "obj_f3_cov_p2")
        )
    )
    (sleep_until (>= s_f3_p2_progression 30))
    (ai_set_objective "gr_marines" "obj_f3_allies_part_2")
)

(script dormant void f3_p2_disregard_marines
    (ai_disregard (ai_get_object "allies_f3_mar_wasted") true)
    (ai_disregard (ai_get_object "allies_f3_marine") true)
    (sleep_until 
        (or
            (>= s_f3_p2_progression 20)
            b_f3_p2_take_combat_outside
        ) 
    5)
    (ai_disregard (ai_get_object "allies_f3_mar_wasted") false)
    (ai_disregard (ai_get_object "allies_f3_marine") false)
)

(script dormant void f3_teleport_gs
    (sleep_until (>= s_f3_p1_progression 10) 15)
    (if (not 
        (or
            (volume_test_object "vol_f3_all" "gr_guilty_spark")
            (volume_test_object "vol_f3_stairway" "gr_guilty_spark")
        )
    ) 
        (begin
            (if b_debug 
                (print "f3: teleporting gs"))
            (ai_bring_forward obj_guilty_spark 4.0)
        ) (if b_debug 
            (print "f3: not teleporting gs"))
    )
)

(script dormant void f3_teleport_allies
    (if (not 
        (or
            (volume_test_object "vol_f2_all" "allies_f2_mar/0")
            (volume_test_object "vol_f3_all" "allies_f2_mar/0")
            (volume_test_object "vol_f2_all" "allies_f3_p1_mar_0")
            (volume_test_object "vol_f3_all" "allies_f3_p1_mar_0")
        )
    ) 
        (begin
            (if b_debug 
                (print "f3: teleporting marine 0"))
            (sleep_until (not (objects_can_see_flag (players) "flg_f2_teleport_ai_0" 30.0)))
            (object_teleport "allies_f2_mar/0" "flg_f2_teleport_ai_0")
            (object_teleport "allies_f3_p1_mar_0" "flg_f2_teleport_ai_0")
        ) (if b_debug 
            (print "f3: not teleporting marine 0"))
    )
    (if (not 
        (or
            (volume_test_object "vol_f2_all" "allies_f2_mar/1")
            (volume_test_object "vol_f3_all" "allies_f2_mar/1")
            (volume_test_object "vol_f2_all" "allies_f3_p1_mar_1")
            (volume_test_object "vol_f3_all" "allies_f3_p1_mar_1")
        )
    ) 
        (begin
            (if b_debug 
                (print "f3: teleporting marine 1"))
            (sleep_until (not (objects_can_see_flag (players) "flg_f2_teleport_ai_1" 30.0)))
            (object_teleport "allies_f2_mar/1" "flg_f2_teleport_ai_1")
            (object_teleport "allies_f3_p1_mar_1" "flg_f2_teleport_ai_1")
        ) (if b_debug 
            (print "f3: not teleporting marine 1"))
    )
    (if 
        (and
            (not (game_is_cooperative))
            (not 
                (or
                    (volume_test_object "vol_f2_all" obj_arbiter)
                    (volume_test_object "vol_f3_all" obj_arbiter)
                )
            )
        ) 
            (begin
                (if b_debug 
                    (print "f3: teleporting arbiter"))
                (ai_bring_forward obj_arbiter 4.0)
            ) (if b_debug 
                (print "f3: not teleporting arbiter"))
    )
)

(script dormant void f3_p1_migrate_allies
    (sleep_until (>= s_f3_p1_progression 10) 5)
    (ai_migrate "f2_guilty_spark" "f3_p1_guilty_spark")
    (ai_migrate "allies_f2_mar/0" "allies_f3_p1_mar_0")
    (ai_migrate "allies_f2_mar/1" "allies_f3_p1_mar_1")
    (migrate_arbiter "allies_f2_arbiter" "allies_f3_arbiter_follow")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (ai_renew "allies_f3_p1_mar_0")
    (ai_renew "allies_f3_p1_mar_1")
    (sleep_until (>= s_f3_p1_progression 30) 5)
    (ai_set_objective "f3_p1_guilty_spark" "obj_f3_gs_outside")
)

(script dormant void f3_p2_manage_reinf
    (sleep_until 
        (or
            (volume_test_players "vol_f3_p2_spawn_reinf_0")
            (volume_test_players "vol_f3_p2_spawn_reinf_1")
            (<= (ai_living_count "cov_f3_p2_pack") 0)
            (>= s_f3_p2_progression 50)
        ) 
    15)
    (ai_place "cov_f3_p2_reinf")
)

(script dormant void f3_p1_player_progression
    (sleep_until (volume_test_players "vol_f3_p1_advance_0") 5)
    (set s_f3_p1_progression 5)
    (if b_debug 
        (print "s_f3_p1_progression = 5"))
    (sleep_until (volume_test_players "vol_f3_p1_advance_1") 5)
    (set s_f3_p1_progression 10)
    (if b_debug 
        (print "s_f3_p1_progression = 10"))
    (sleep_until (volume_test_players "vol_f3_p1_advance_2") 5)
    (set s_f3_p1_progression 15)
    (if b_debug 
        (print "s_f3_p1_progression = 15"))
    (sleep_until (volume_test_players "vol_f3_p1_advance_3") 5)
    (set s_f3_p1_progression 17)
    (if b_debug 
        (print "s_f3_p1_progression = 17"))
    (sleep_until (volume_test_players "vol_f3_p1_advance_4") 5)
    (set s_f3_p1_progression 20)
    (if b_debug 
        (print "s_f3_p1_progression = 20"))
    (sleep_until (volume_test_players "vol_f3_p1_advance_4_5") 5)
    (set s_f3_p1_progression 25)
    (if b_debug 
        (print "s_f3_p1_progression = 25"))
    (sleep_until (volume_test_players "vol_f3_p1_advance_5") 5)
    (set s_f3_p1_progression 30)
    (if b_debug 
        (print "s_f3_p1_progression = 30"))
    (sleep_until (volume_test_players "vol_f3_p1_advance_6") 5)
    (set s_f3_p1_progression 40)
    (if b_debug 
        (print "s_f3_p1_progression = 40"))
)

(script dormant void f3_p2_player_progression
    (sleep_until (volume_test_players "vol_f3_p2_advance_1") 5)
    (set s_f3_p2_progression 10)
    (if b_debug 
        (print "s_f3_p2_progression = 10"))
    (sleep_until (volume_test_players "vol_f3_p2_advance_2") 5)
    (set s_f3_p2_progression 20)
    (if b_debug 
        (print "s_f3_p2_progression = 20"))
    (sleep_until (volume_test_players "vol_f3_p2_advance_3") 10)
    (set s_f3_p2_progression 30)
    (if b_debug 
        (print "s_f3_p2_progression = 30"))
    (sleep_until (volume_test_players "vol_f3_p2_advance_4") 10)
    (set s_f3_p2_progression 40)
    (chud_show_arbiter_ai_navpoint false)
    (if b_debug 
        (print "s_f3_p2_progression = 40"))
    (sleep_until (volume_test_players "vol_f3_p2_advance_5") 10)
    (set s_f3_p2_progression 50)
    (if b_debug 
        (print "s_f3_p2_progression = 50"))
)

(script dormant void f3_070lc_after
    (if b_debug 
        (print "070_as_dogfight"))
    (set b_f3_p2_started true)
    (game_save)
    (wake f3_p1_stop)
    (wake 070_evac_objective)
    (wake f3_take_combat_outside)
    (data_mine_set_mission_segment "070_081_floor_3_2")
    (place_guilty_spark "f3_p2_guilty_spark/guilty")
    (ai_place "cov_f3_phantom")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (ai_set_objective "obj_f3_cov_p1" "obj_f3_cov_p2")
    (wake f3_p2_player_progression)
    (wake md_f3_gs_secret_dialog)
    (wake md_f3_jon_next)
    (wake f3_p2_manage_reinf)
    (if (game_is_cooperative) 
        (begin
            (set b_f3_p2_gs_guide true)
            (cs_run_command_script "cov_f3_phantom/pilot" cs_f3_phantom_exit)
            (cs_run_command_script "cov_f3_phantom/grunt_0" cs_end)
            (cs_run_command_script "cov_f3_phantom/grunt_1" cs_end)
        ) (begin
            (place_arbiter "allies_f3_arbiter/arbiter")
            (ai_cannot_die "allies_f3_arbiter" true)
            (wake md_f3_arb_boards_banshee)
            (ai_prefer_target (ai_get_object "allies_f3_arbiter") true)
            (ai_place "cov_f3_banshee_0")
            (sleep 1)
            (cs_run_command_script (ai_get_turret_ai "cov_f3_phantom" 0) cs_f3_shoot_arbiter)
            (ai_cannot_die "cov_f3_banshee_0" true)
        )
    )
    (if (= s_f3_marine_count 1) 
        (begin
            (ai_migrate "allies_f3_p1_mar_0" "allies_f3_marine")
            (ai_migrate "allies_f3_p1_mar_1" "allies_f3_marine")
            (ai_teleport "allies_f3_marine" "pts_f3_marine_0/start")
            (sleep 1)
            (wake md_f3_marines_ambushed)
        )
    )
    (if (>= s_f3_marine_count 2) 
        (begin
            (ai_migrate "allies_f3_p1_mar_0" "allies_f3_marine")
            (ai_teleport "allies_f3_marine" "pts_f3_marine_0/start")
            (sleep 1)
            (wake md_f3_marines_ambushed)
            (ai_migrate "allies_f3_p1_mar_1" "allies_f3_mar_wasted")
            (ai_teleport "allies_f3_mar_wasted" "pts_f3_marine_1/start")
            (sleep 1)
            (ai_disregard (ai_get_object "allies_f3_mar_wasted") true)
            (wake md_f3_marine_stuck)
        )
    )
    (ai_prefer_target (ai_get_object "allies_f3_arbiter") false)
    (ai_place "cov_f3_p2_pack")
    (ai_place "cov_f3_p2_brute")
    (wake f3_p2_disregard_marines)
    (cinematic_fade_to_gameplay)
    (sleep_until (>= s_f3_p2_progression 20) 5)
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (ai_set_objective "f3_p2_guilty_spark" "obj_f3_gs_inside")
    (sleep 10)
    (set b_f3_combat_started true)
    (game_save)
    (sleep_until (<= (ai_living_count "gr_cov_f3") 0))
    (set b_f3_p2_combat_finished true)
    (set s_gs_walkup_dist 3)
    (set s_gs_talking_dist 4)
    (set g_gs_1st_line 070mh_450)
    (set g_gs_2nd_line 070mk_150)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
    (sleep_until (>= s_f3_p2_progression 50) 30 3600)
    (if (< s_f3_p2_progression 50) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_f3_p2_next" 0.0)
            (sleep_until (>= s_f3_p2_progression 50))
            (hud_deactivate_team_nav_point_flag player "flg_f3_p2_next")
        )
    )
)

(script dormant void floor_3
    (set b_f3_has_started true)
    (if b_debug 
        (print "starting floor 3"))
    (game_save)
    (device_operates_automatically_set "f3_door_2" false)
    (ai_place "cov_f3_brt_pack")
    (sleep 1)
    (ai_place "cov_f3_jck_right_0")
    (ai_place "cov_f3_jck_right_1")
    (sleep 1)
    (ai_place "cov_f3_jck_left")
    (wake f3_manage_kill_volumes)
    (wake f3_p1_player_progression)
    (wake f3_070lc_start)
    (wake md_f3_gs_hit_switch)
    (wake objective_3_clear)
    (wake f3_teleport_gs)
    (wake f3_p1_migrate_allies)
    (data_mine_set_mission_segment "070_080_floor_3_1")
    (sleep_until (>= s_f3_p1_progression 5) 10 450)
    (device_operates_automatically_set "f3_door_2" true)
    (sleep_until (not (volume_test_objects "vol_f3_interior" (ai_actors "gr_cov_f3"))))
    (set b_f3_p1_int_combat_finished true)
)

(script dormant void f3_p1_stop
    (vs_release guilty_spark)
    (vs_release arbiter)
    (vs_release marine_01)
    (vs_release marine_02)
    (sleep_forever md_f3_gs_hit_switch)
)

(script static void floor_3_cleanup
    (ai_disposable "gr_cov_f3" true)
    (ai_disposable "allies_f3_arbiter_follow" true)
    (ai_disposable "allies_f3_p1_mar_0" true)
    (ai_disposable "allies_f3_p1_mar_1" true)
    (ai_disposable "allies_f3_arbiter" true)
    (ai_disposable "allies_f3_marine" true)
    (ai_disposable "allies_f3_mar_wasted" true)
    (sleep_forever f3_p1_player_progression)
    (sleep_forever f3_p2_player_progression)
    (sleep_forever f3_070lc_after)
    (sleep_forever floor_3)
    (set s_f3_p1_progression 200)
    (set s_f3_p2_progression 200)
    (add_recycling_volume "vol_f3_recycle" 0 5)
)

(script command_script void cs_f4_brute_ambush_right
    (cs_shoot true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_face true "pts_f4_brutes/throw_at_right")
    (sleep 10)
    (cs_grenade "pts_f4_brutes/throw_at_right" 1)
    (sleep 90)
)

(script command_script void cs_f4_brute_ambush_left
    (cs_shoot true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_go_to "pts_f4_brutes/p7")
    (sleep 10)
    (cs_grenade "pts_f4_brutes/throw_at_left" 1)
    (sleep 90)
)

(script command_script void cs_f4_brute_chieftain
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_dialogue true)
    (sleep_until 
        (or
            (<= (unit_get_health (unit ai_current_actor)) 0.9)
            (>= s_f4_progression 20)
            (and
                (>= s_f4_progression 15)
                (objects_can_see_object (players) (unit ai_current_actor) 30.0)
            )
        ) 
    5 300)
    (ai_play_line_at_player ai_current_actor 070mq_100)
    (cs_custom_animation "objects\characters\brute\brute" "armored:rifle:shakefist:var1" true)
    (sleep (unit_get_custom_animation_time ai_current_actor))
    (cs_stop_custom_animation)
    (cs_movement_mode ai_movement_combat)
    (cs_go_to "pts_f5_chieftain_retreat/p0")
    (cs_go_to_and_face "pts_f5_chieftain_retreat/p1" "pts_f5_chieftain_retreat/face_at")
    (cs_stow)
    (cs_posture_set "act_cheering_1" false)
    (sleep_until (<= (unit_get_health (unit ai_current_actor)) 0.85))
    (cs_go_to "pts_f5_chieftain_retreat/p2")
    (sleep_forever)
)

(script dormant void f4_manage_jackals
    (sleep_until 
        (or
            (<= (ai_living_count "cov_f4_brt_ambush") 0)
            (>= s_f5_progression 10)
        )
    )
    (if (>= s_f5_progression 10) 
        (begin
            (ai_set_objective "gr_cov_f4" "obj_f5_cov")
            (ai_set_objective "cov_f4_brt_ambush" "obj_f5_cov")
        ) (begin
            (ai_set_objective "gr_cov_f4_jackals" "obj_f4_cov")
        )
    )
)

(script dormant void f4_enable_top
    (sleep_until 
        (begin
            (sleep_until 
                (begin
                    (sleep_until (volume_test_players "vol_f4_2nd_floor"))
                    (sleep 300)
                    (volume_test_players "vol_f4_2nd_floor")
                )
            )
            (set b_f4_enable_top true)
            (sleep_until 
                (begin
                    (sleep_until (volume_test_players "vol_f4_1st_floor"))
                    (sleep 300)
                    (volume_test_players "vol_f4_1st_floor")
                )
            )
            (set b_f4_enable_top false)
            false
        )
    )
)

(script dormant void f4_disable_areas
    (sleep_until 
        (begin
            (if (volume_test_players "vol_f4_right") 
                (set b_f4_timer_right (min (+ 1.0 b_f4_timer_right) b_f4_timer_max)) (set b_f4_timer_right (max (- b_f4_timer_right 1.0) 0.0)))
            (if (volume_test_players "vol_f4_left") 
                (set b_f4_timer_left (min (+ 1.0 b_f4_timer_left) b_f4_timer_max)) (set b_f4_timer_left (max (- b_f4_timer_left 1.0) 0.0)))
            (if (= b_f4_timer_right b_f4_timer_max) 
                (begin
                    (set b_f4_enable_right false)
                ) (begin
                    (if (> b_f4_timer_left 2) 
                        (begin
                            (set b_f4_enable_right true)
                            (if b_debug 
                                (print "enabling right side..."))
                        )
                    )
                )
            )
            (if (= b_f4_timer_left b_f4_timer_max) 
                (begin
                    (set b_f4_enable_left false)
                ) (begin
                    (if (> b_f4_timer_right 2) 
                        (begin
                            (set b_f4_enable_left true)
                        )
                    )
                )
            )
            (< (ai_living_count "cov_f4_brt_ambush") 1)
        ) 
    30)
)

(script dormant void f4_teleport_gs
    (sleep_until (volume_test_players "vol_f4_right") 5)
    (if (not 
        (or
            (volume_test_object "vol_f4_all" "gr_guilty_spark")
            (volume_test_object "vol_f4_stairway" "gr_guilty_spark")
        )
    ) 
        (begin
            (if b_debug 
                (print "f4: teleporting gs"))
            (ai_bring_forward obj_guilty_spark 4.0)
        ) (if b_debug 
            (print "f4: not teleporting gs"))
    )
)

(script dormant void f4_place_ai
    (sleep_until (= (current_zone_set_fully_active) 11) 1)
    (ai_place "cov_f4_brt_ambush")
    (sleep 1)
    (ai_place "cov_f5_brt_chieftain")
    (sleep 1)
    (ai_place "cov_f4_jackals_1")
    (sleep 1)
    (ai_set_active_camo "cov_f4_brt_ambush/0" true)
    (ai_set_active_camo "cov_f4_brt_ambush/1" true)
    (ai_set_active_camo "cov_f4_brt_ambush/2" true)
    (ai_set_active_camo "cov_f4_brt_ambush/3" true)
    (unit_set_active_camo "cov_f4_brt_ambush/0" true 0.0)
    (unit_set_active_camo "cov_f4_brt_ambush/1" true 0.0)
    (unit_set_active_camo "cov_f4_brt_ambush/2" true 0.0)
    (unit_set_active_camo "cov_f4_brt_ambush/3" true 0.0)
    (wake f4_manage_jackals)
)

(script dormant void f4_player_progression
    (sleep_until (volume_test_players "vol_f4_start") 10)
    (set s_f4_progression 10)
    (if b_debug 
        (print "s_f4_progression = 10"))
    (sleep_until (volume_test_players "vol_f4_after_start") 10)
    (set s_f4_progression 15)
    (if b_debug 
        (print "s_f4_progression = 15"))
    (set b_070_music_13 true)
    (sleep_until 
        (or
            (volume_test_players "vol_f4_advance_0")
            (volume_test_players "vol_f4_1st_floor")
        ) 
    10)
    (set s_f4_progression 20)
    (if b_debug 
        (print "s_f4_progression = 20"))
    (sleep_until (volume_test_players "vol_f4_advance_1") 10)
    (set s_f4_progression 30)
    (if b_debug 
        (print "s_f4_progression = 30"))
)

(script dormant void floor_4
    (set b_f4_has_started true)
    (if b_debug 
        (print "starting floor 4"))
    (if b_debug 
        (print "070_as_ambush"))
    (game_save)
    (data_mine_set_mission_segment "070_090_floor_4_1")
    (ai_migrate "allies_f3_marine" "allies_f4_marines")
    (ai_migrate "allies_f3_mar_wasted" "allies_f4_marines")
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (set b_gs_follow_player false)
    (ai_migrate "f3_p2_guilty_spark" "f4_guilty_spark")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (wake f4_teleport_gs)
    (wake f4_player_progression)
    (wake f4_place_ai)
    (wake 070_music_13)
    (sleep_until (= (current_zone_set_fully_active) 11) 1)
    (sleep_until 
        (or
            (> (ai_combat_status "gr_cov_f4") 3)
            (<= (ai_living_count "gr_cov_f4") 0)
        ) 
    30 3600)
    (wake f4_disable_areas)
    (wake f4_enable_top)
    (sleep_until (<= (ai_living_count "gr_cov_f4") 0))
    (set b_f4_fight_finished true)
    (game_save)
    (set s_gs_walkup_dist 3)
    (set s_gs_talking_dist 4)
    (set g_gs_1st_line 070mm_050)
    (set g_gs_2nd_line 070mm_060)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
    (sleep_until b_f5_has_started 30 3600)
    (if (not b_f5_has_started) 
        (begin
            (hud_activate_team_nav_point_flag player "flg_f4_next" 0.0)
            (sleep_until b_f5_has_started)
            (hud_deactivate_team_nav_point_flag player "flg_f4_next")
        )
    )
)

(script static void floor_4_cleanup
    (ai_disposable "gr_cov_f4" true)
    (object_destroy_folder "crt_f4")
    (sleep_forever f4_player_progression)
    (sleep_forever floor_4)
    (set s_f4_progression 200)
    (add_recycling_volume "vol_f4_recycle" 0 5)
)

(script command_script void cs_f5_pelican
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "pts_f5_pelican/p0")
    (cs_fly_to "pts_f5_pelican/p1")
    (cs_vehicle_speed 0.3)
    (cs_fly_to_and_face "pts_f5_pelican/p2" "pts_f5_pelican/face")
    (set b_f5_pelican_arrived true)
    (unit_open (ai_vehicle_get ai_current_actor))
    (cs_vehicle_speed 0.2)
    (cs_fly_to_and_face "pts_f5_pelican/p3" "pts_f5_pelican/face" 1.0)
    (sleep_forever)
)

(script command_script void cs_f5_banshee_intro
    (cs_enable_looking true)
    (cs_fly_to "pts_f5_banshee/p0" 1.0)
    (cs_fly_to "pts_f5_banshee/p1" 1.0)
    (cs_fly_to "pts_f5_banshee/p2" 1.0)
    (cs_fly_to "pts_f5_banshee/p3" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_f5_vtol_intro
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_looking true)
    (cs_fly_to "pts_f5_vtol_intro/p0" 1.0)
    (cs_vehicle_speed 0.7)
    (cs_fly_to "pts_f5_vtol_intro/p1")
    (sleep 90)
    (cs_fly_to "pts_f5_vtol_intro/p2" 1.0)
    (cs_fly_to "pts_f5_vtol_intro/p3" 1.0)
    (ai_erase (ai_get_squad ai_current_actor))
)

(script command_script void cs_f5_banshee
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_aim_player true)
    (cs_shoot true)
    (ai_prefer_target (players) true)
    (sleep_until 
        (begin
            (cs_shoot true)
            (sleep 15)
            (cs_shoot false)
            (sleep 120)
            false
        ) 
    15)
)

(script command_script void cs_f5_gs
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until (volume_test_players "vol_f5_viewpoint") 5)
    (sleep_until 
        (or
            (volume_test_players "vol_f5_stairs_left")
            (volume_test_players "vol_f5_stairs_right")
        ) 
    5 900)
    (cs_enable_moving false)
    (cs_fly_to "pts_f5_gs/left_0")
    (sleep 30)
    (cs_fly_to "pts_f5_gs/left_1")
    (sleep 30)
    (cs_fly_to "pts_f5_gs/left_2")
)

(script command_script void cs_f5_cheer_0
    (cs_abort_on_damage true)
    (cs_stow)
    (cs_enable_dialogue true)
    (cs_posture_set "act_guard_2" false)
    (sleep_forever)
)

(script command_script void cs_f5_cheer_1
    (cs_abort_on_damage true)
    (cs_stow)
    (cs_enable_dialogue true)
    (cs_posture_set "act_kneel_1" false)
    (sleep_forever)
)

(script command_script void cs_f5_cheer_2
    (cs_abort_on_damage true)
    (cs_stow)
    (cs_enable_dialogue true)
    (cs_posture_set "act_gaze_1" false)
    (sleep_forever)
)

(script command_script void cs_f5_cheer_3
    (cs_abort_on_damage true)
    (cs_stow)
    (cs_enable_dialogue true)
    (cs_posture_set "act_guard_3" false)
    (sleep_forever)
)

(script command_script void cs_f5_cheer_4
    (cs_abort_on_damage true)
    (cs_stow)
    (cs_enable_dialogue true)
    (cs_posture_set "act_guard_4" false)
    (sleep_forever)
)

(script command_script void cs_f5_cheer_5
    (cs_abort_on_damage true)
    (cs_stow)
    (cs_enable_dialogue true)
    (cs_posture_set "act_guard_3" false)
    (sleep_forever)
)

(script command_script void cs_f5_chieftain
    (cs_abort_on_damage true)
    (cs_movement_mode ai_movement_combat)
    (cs_enable_dialogue true)
    (sleep_until 
        (or
            (>= s_f5_progression 15)
            b_f5_stop_cheering
        ) 
    5)
    (cs_go_to "pts_f5_brutes/p0")
    (cs_face_player true)
    (if (< s_f5_progression 20) 
        (begin
            (sleep 30)
            (cs_posture_set "act_kneel_1" false)
            (sleep_until b_f5_stop_cheering 5 90)
        )
    )
    (sleep_until 
        (or
            (>= s_f5_progression 20)
            b_f5_stop_cheering
        ) 
    5)
    (cs_posture_exit)
    (cs_face_player true)
    (cs_draw)
    (sleep 30)
    (ai_play_line_at_player ai_current_actor 070mq_090)
    (cs_action_at_player ai_action_advance)
    (sleep_until 
        (or
            (>= s_f5_progression 30)
            b_f5_stop_cheering
        ) 
    5)
)

(script command_script void cs_f5_cheering_brute
    (cs_abort_on_damage true)
    (cs_movement_mode ai_movement_combat)
    (cs_face_player true)
    (cs_enable_dialogue true)
    (unit_only_takes_damage_from_players_team (unit ai_current_actor) true)
    (sleep (random_range 0 60))
    (cs_go_to_and_posture (ai_nearest_point ai_current_actor "pts_f5_jetpack") "act_cheering_1")
    (sleep (random_range 0 60))
    (sleep_until 
        (begin
            (begin_random
                (if 
                    (and
                        (not b_f5_stop_cheering)
                        (>= (objects_distance_to_object (players) ai_current_actor) 5.0)
                    ) 
                        (begin
                            (cs_stow)
                            (cs_face_object true "cov_f5_brt_chieftain")
                            (cs_posture_set "act_cheering_1" false)
                            (sleep_until b_f5_stop_cheering 5 (random_range 30 120))
                        )
                )
                (if 
                    (and
                        (not b_f5_stop_cheering)
                        (>= (objects_distance_to_object (players) ai_current_actor) 5.0)
                    ) 
                        (begin
                            (cs_stow)
                            (cs_face_player true)
                            (cs_posture_set "act_guard_1" false)
                            (sleep_until b_f5_stop_cheering 5 (random_range 30 120))
                        )
                )
                (if 
                    (and
                        (not b_f5_stop_cheering)
                        (>= (objects_distance_to_object (players) ai_current_actor) 5.0)
                    ) 
                        (begin
                            (cs_stow)
                            (cs_face_player true)
                            (cs_posture_set "act_guard_2" false)
                            (sleep_until b_f5_stop_cheering 5 (random_range 30 120))
                        )
                )
                (if 
                    (and
                        (not b_f5_stop_cheering)
                        (>= (objects_distance_to_object (players) ai_current_actor) 5.0)
                    ) 
                        (begin
                            (cs_stow)
                            (cs_face_player true)
                            (cs_posture_set "act_guard_3" false)
                            (sleep_until b_f5_stop_cheering 5 (random_range 30 120))
                        )
                )
                (if 
                    (and
                        (not b_f5_stop_cheering)
                        (>= (objects_distance_to_object (players) ai_current_actor) 5.0)
                    ) 
                        (begin
                            (cs_stow)
                            (cs_face_player true)
                            (cs_posture_set "act_guard_4" false)
                            (sleep_until b_f5_stop_cheering 5 (random_range 30 120))
                        )
                )
                (if 
                    (and
                        (not b_f5_stop_cheering)
                        (< (objects_distance_to_object (players) ai_current_actor) 5.0)
                    ) 
                        (begin
                            (if (< (objects_distance_to_object (players) ai_current_actor) 1.5) 
                                (set b_f5_stop_cheering true))
                            (cs_posture_exit)
                            (cs_face_player true)
                            (cs_draw)
                            (cs_action_at_player ai_action_taunt)
                            (sleep_until b_f5_stop_cheering 5 (random_range 30 120))
                        )
                )
            )
            b_f5_stop_cheering
        ) 
    1)
    (cs_posture_exit)
    (cs_draw)
    (set s_f5_jetpack_action (+ s_f5_jetpack_action 1.0))
    (cond
        ((= s_f5_jetpack_action 1)
            (begin
                (cs_action_at_player ai_action_advance)
                (if 
                    (or
                        (game_is_cooperative)
                        (>= (ai_living_count "gr_marines") 0)
                    ) 
                        (ai_play_line ai_current_actor 070mq_070))
            )
        )
        ((= s_f5_jetpack_action 2)
            (begin
                (cs_action_at_player ai_action_berserk)
                (ai_play_line ai_current_actor 070mq_080)
            )
        )
        ((= s_f5_jetpack_action 3)
            (cs_action_at_player ai_action_shakefist)
        )
        ((= s_f5_jetpack_action 4)
            (cs_action_at_player ai_action_signal_attack)
        )
        ((= s_f5_jetpack_action 5)
            (cs_action_at_player ai_action_signal_move)
        )
        ((= s_f5_jetpack_action 6)
            (cs_action_at_player ai_action_shakefist)
        )
    )
)

(script dormant void f5_manage_cheering_brutes
    (sleep_until (>= s_f5_progression 15) 5)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_0/0") true)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_1/1") true)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_2/2") true)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_3/3") true)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_4/4") true)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_5/5") true)
    (ai_prefer_target_ai "gr_marines" "cov_f5_brt_chieftain" true)
    (cs_run_command_script "gr_cov_f5_jetpack" cs_f5_cheering_brute)
    (sleep 1)
    (sleep_until 
        (or
            (<= (ai_living_count "cov_f5_brt_chieftain") 0)
            (not (cs_command_script_running "cov_f5_jetpack_0/0" cs_f5_cheering_brute))
            (not (cs_command_script_running "cov_f5_jetpack_1/1" cs_f5_cheering_brute))
            (not (cs_command_script_running "cov_f5_jetpack_2/2" cs_f5_cheering_brute))
            (not (cs_command_script_running "cov_f5_jetpack_3/3" cs_f5_cheering_brute))
            (not (cs_command_script_running "cov_f5_jetpack_4/4" cs_f5_cheering_brute))
            (not (cs_command_script_running "cov_f5_jetpack_5/5" cs_f5_cheering_brute))
        )
    )
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_0/0") false)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_1/1") false)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_2/2") false)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_3/3") false)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_4/4") false)
    (unit_only_takes_damage_from_players_team (unit "cov_f5_jetpack_5/5") false)
    (ai_prefer_target_ai "gr_marines" "cov_f5_brt_chieftain" false)
    (set b_f5_stop_cheering true)
    (sleep 120)
    (cs_run_command_script "cov_f5_jetpack_0" cs_end)
    (sleep (random_range 0 15))
    (cs_run_command_script "cov_f5_jetpack_4" cs_end)
    (sleep (random_range 0 15))
    (cs_run_command_script "cov_f5_jetpack_5" cs_end)
    (cs_run_command_script "cov_f5_jetpack_3" cs_end)
    (sleep (random_range 0 15))
    (cs_run_command_script "cov_f5_jetpack_2" cs_end)
    (sleep (random_range 0 15))
    (cs_run_command_script "cov_f5_jetpack_1" cs_end)
)

(script dormant void f5_stop_chieftain_run
    (sleep_until 
        (or
            (<= (objects_distance_to_object (players) "cov_f5_brt_chieftain") 2.0)
            (<= (ai_living_count "cov_f5_brt_chieftain/chieftain") 0)
            b_f5_stop_cheering
            b_f5_chieftain_charge
        )
    )
    (sleep_forever f5_manage_chieftain)
    (cs_run_command_script "cov_f5_brt_chieftain" cs_end)
    (set b_f5_chieftain_charge true)
)

(script dormant void f5_manage_chieftain
    (wake f5_stop_chieftain_run)
    (sleep_until (>= s_f5_progression 15) 5)
    (cs_run_command_script "cov_f5_brt_chieftain" cs_f5_chieftain)
    (sleep_until 
        (begin
            (or
                (<= (ai_living_count "cov_f5_brt_chieftain/chieftain") 0)
                b_f5_stop_cheering
                (>= s_f5_progression 30)
                (not (cs_command_script_running "cov_f5_brt_chieftain/chieftain" cs_f5_chieftain))
                (<= (object_get_health "f5_holo_generator") 0.9)
            )
        ) 
    30 3600)
    (set b_f5_chieftain_charge true)
)

(script dormant void f5_manage_allies
    (sleep_until 
        (or
            (>= s_f5_progression 15)
            (and
                b_f4_fight_finished
                (>= s_f5_progression 10)
            )
        )
    )
    (ai_migrate "allies_f4_marines" "allies_f5_marines")
)

(script dormant void f5_teleport_gs
    (sleep_until (volume_test_players "vol_f5_viewpoint") 5)
    (if (not (volume_test_object "vol_f5_outside" "gr_guilty_spark")) 
        (begin
            (if b_debug 
                (print "f5: teleporting gs"))
            (ai_bring_forward obj_guilty_spark 4.0)
        ) (if b_debug 
            (print "f5: not teleporting gs"))
    )
)

(script dormant void f5_teleport_gs_2
    (sleep_until (<= (ai_task_count "obj_f5_cov/jetpack_brutes") 0))
    (if 
        (or
            (volume_test_object "vol_f5_viewpoint" "gr_guilty_spark")
            (volume_test_object "vol_f5_stairs_left" "gr_guilty_spark")
            (volume_test_object "vol_f5_stairs_right" "gr_guilty_spark")
        ) 
            (begin
                (if b_debug 
                    (print "f5 - 2: teleporting gs"))
                (ai_bring_forward obj_guilty_spark 4.0)
            ) (if b_debug 
                (print "f5 - 2: not teleporting gs"))
    )
)

(script static void f5_teleport_players_not_outside
    (if (not 
        (or
            (volume_test_object "vol_f5_outside" (player0))
            (volume_test_object "vol_f5_outside_left" (player0))
            (volume_test_object "vol_f5_outside_right" (player0))
        )
    ) 
        (object_teleport (player0) "flg_f5_start_location_p0"))
    (if (not 
        (or
            (volume_test_object "vol_f5_outside" (player1))
            (volume_test_object "vol_f5_outside_left" (player1))
            (volume_test_object "vol_f5_outside_right" (player1))
        )
    ) 
        (object_teleport (player1) "flg_f5_start_location_p1"))
    (if (not 
        (or
            (volume_test_object "vol_f5_outside" (player2))
            (volume_test_object "vol_f5_outside_left" (player2))
            (volume_test_object "vol_f5_outside_right" (player2))
        )
    ) 
        (object_teleport (player2) "flg_f5_start_location_p2"))
    (if (not 
        (or
            (volume_test_object "vol_f5_outside" (player3))
            (volume_test_object "vol_f5_outside_left" (player3))
            (volume_test_object "vol_f5_outside_right" (player3))
        )
    ) 
        (object_teleport (player3) "flg_f5_start_location_p3"))
)

(script dormant void f5_player_progression
    (sleep_until 
        (or
            (volume_test_players "vol_f5_stairs_right")
            (volume_test_players "vol_f5_stairs_left")
            (volume_test_players "vol_f5_outside_no_stairs")
        ) 
    10)
    (set s_f5_progression 10)
    (if b_debug 
        (print "s_f5_progression = 10"))
    (sleep_until 
        (or
            (volume_test_players "vol_f5_mc_high_left")
            (volume_test_players "vol_f5_mc_high_right")
            (volume_test_players "vol_f5_outside_no_stairs")
        ) 
    10)
    (set s_f5_progression 15)
    (if b_debug 
        (print "s_f5_progression = 15"))
    (sleep_until 
        (or
            (volume_test_players "vol_f5_near_ring")
            (volume_test_players "vol_f5_pass_truth")
        ) 
    10)
    (set s_f5_progression 20)
    (if b_debug 
        (print "s_f5_progression = 20"))
    (sleep_until 
        (or
            (volume_test_players "vol_f5_challenge_ring")
            (volume_test_players "vol_f5_pass_truth")
        ) 
    10)
    (set s_f5_progression 30)
    (if b_debug 
        (print "s_f5_progression = 30"))
)

(script dormant void floor_5
    (set b_f5_has_started true)
    (if b_debug 
        (print "starting floor 5"))
    (game_save_no_timeout)
    (data_mine_set_mission_segment "070_100_floor_5_1")
    (cs_run_command_script "gr_guilty_spark" cs_end)
    (set b_gs_follow_player false)
    (ai_migrate "f4_guilty_spark" "f5_guilty_spark")
    (sleep 1)
    (ai_cannot_die "gr_guilty_spark" true)
    (cs_run_command_script "gr_guilty_spark" cs_f5_gs)
    (wake f5_teleport_gs)
    (wake f5_player_progression)
    (wake f5_manage_allies)
    (ai_place "gr_cov_f5_jetpack")
    (sleep 1)
    (wake f5_truth_halogram)
    (wake f5_manage_chieftain)
    (wake f5_manage_cheering_brutes)
    (wake f5_teleport_gs_2)
    (wake md_f5_jon_pelican_eta)
    (wake 070_music_14)
    (wake 070_music_15)
    (sleep_until b_f5_chieftain_charge)
    (set b_070_music_13 false)
    (set b_070_music_14 true)
    (set b_070_music_15 true)
    (game_save)
    (sleep_until (<= (ai_living_count "cov_f5_brt_chieftain") 0))
    (sleep_until (<= (ai_living_count "obj_f5_cov") 4))
    (ai_place "cov_f5_snipers_right")
    (sleep 1)
    (sleep_until (<= (ai_living_count "obj_f5_cov") 2))
    (sleep_until (<= (ai_living_count "obj_f5_cov") 0) 30 3600)
    (ai_kill_silent "obj_f5_cov")
    (set b_070_music_14 false)
    (set s_gs_walkup_dist 4)
    (set s_gs_talking_dist 6)
    (set g_gs_1st_line 070mm_310)
    (set g_gs_2nd_line 070mm_320)
    (cs_run_command_script "gr_guilty_spark" cs_guilty_spark_lead_player)
    (set b_f5_combat_finished true)
    (sleep 30)
    (sleep_until (= (current_zone_set_fully_active) 12) 1)
    (sleep 30)
    (ai_place "allies_f5_pelican")
    (sleep_until b_f5_pelican_arrived)
    (sleep_until (volume_test_players "vol_f5_near_pelican") 10 900)
    (if (not (volume_test_players "vol_f5_near_pelican")) 
        (hud_activate_team_nav_point_flag player "flg_f5_pelican" 0.0))
    (sleep_until (volume_test_players "vol_f5_near_pelican") 10)
    (sound_looping_start "sound\cinematics\070_waste\070ld_pelican_pickup\070ld_pelican_glue\070ld_pelican_glue" "f5_pelican_location" 1.0)
    (sound_class_set_gain "veh" 0.0 60)
    (wake f5_070ld_start)
    (hud_deactivate_team_nav_point_flag player "flg_f5_pelican")
)

(script static void ee_3_a
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p0")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p1")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p2")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p3")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p4")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p5")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p6")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p7")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p8")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p9")
)

(script static void ee_3_b
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p20")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p21")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p22")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p23")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p24")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p25")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p26")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p27")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p28")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_banshee\fx\destruction" "pts_ee_343/p29")
)

(script static void ee_4
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p10")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p19")
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p12")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p16")
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p18")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p17")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p13")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p14")
)

(script static void ee_2
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p10")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p30")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p19")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p18")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p17")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p16")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p12")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p31")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p15")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p11")
    (sleep 1)
    (effect_new_at_ai_point "objects\characters\ambient_life\lod_hornet\fx\destruction" "pts_ee_343/p14")
)

(script static void ee_activate
    (sleep_until 
        (or
            (and
                (<= (object_get_health "crystal_00") 0.1)
                (<= (object_get_health "crystal_01") 0.1)
                (<= (object_get_health "crystal_02") 0.1)
                (<= (object_get_health "crystal_03") 0.1)
                (<= (object_get_health "crystal_04") 0.1)
            )
            b_ex_p1_has_started
        ) 
    1800)
    (sleep_until 
        (or
            (and
                (<= (object_get_health "crystal_05") 0.1)
                (<= (object_get_health "crystal_06") 0.1)
                (<= (object_get_health "crystal_07") 0.1)
                (<= (object_get_health "crystal_08") 0.1)
                (<= (object_get_health "crystal_09") 0.1)
            )
            b_ex_p1_has_started
        ) 
    1800)
    (sleep_until 
        (or
            (and
                (<= (object_get_health "crystal_10") 0.1)
                (<= (object_get_health "crystal_11") 0.1)
                (<= (object_get_health "crystal_12") 0.1)
                (<= (object_get_health "crystal_13") 0.1)
                (<= (object_get_health "crystal_14") 0.1)
            )
            b_ex_p1_has_started
        ) 
    1800)
    (sleep_until 
        (or
            (and
                (<= (object_get_health "crystal_15") 0.1)
                (<= (object_get_health "crystal_16") 0.1)
                (<= (object_get_health "crystal_17") 0.1)
                (<= (object_get_health "crystal_18") 0.1)
                (<= (object_get_health "crystal_19") 0.1)
            )
            b_ex_p1_has_started
        ) 
    1800)
    (sleep_until 
        (or
            (and
                (<= (object_get_health "crystal_20") 0.1)
                (<= (object_get_health "crystal_21") 0.1)
                (<= (object_get_health "crystal_22") 0.1)
                (<= (object_get_health "crystal_23") 0.1)
                (<= (object_get_health "crystal_24") 0.1)
            )
            b_ex_p1_has_started
        ) 
    1800)
    (sleep_until 
        (or
            (and
                (<= (object_get_health "crystal_25") 0.1)
                (<= (object_get_health "crystal_26") 0.1)
                (<= (object_get_health "crystal_27") 0.1)
                (<= (object_get_health "crystal_28") 0.1)
                (<= (object_get_health "crystal_29") 0.1)
            )
            b_ex_p1_has_started
        ) 
    1800)
    (sleep_until 
        (or
            (and
                (<= (object_get_health "crystal_30") 0.1)
                (<= (object_get_health "crystal_31") 0.1)
                (<= (object_get_health "crystal_32") 0.1)
                (<= (object_get_health "crystal_33") 0.1)
                (<= (object_get_health "crystal_34") 0.1)
            )
            b_ex_p1_has_started
        ) 
    1800)
    (if (not b_ex_p1_has_started) 
        (set b_ee_unlocked true))
)

(script static void ee_main
    (sleep_until 
        (begin
            (sleep (random_range 900 1800))
            (ee_3_a)
            (sleep 10)
            (ee_4)
            (sleep 10)
            (ee_3_b)
            (sleep 30)
            (ee_3_a)
            (sleep 10)
            (ee_4)
            (sleep 10)
            (ee_3_b)
            (sleep 10)
            (ee_2)
            (sleep 10)
            (ee_3_a)
            (sleep 10)
            (ee_4)
            (sleep 10)
            (ee_3_b)
            b_f1_has_started
        )
    )
)

(script dormant void 070_award_primary_skull
    (if (award_skull) 
        (begin
            (object_create "skull_famine")
            (sleep_until 
                (or
                    (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                    (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                    (unit_has_weapon (unit (player2)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                    (unit_has_weapon (unit (player3)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                ) 
            5)
            (if b_debug 
                (print "award famine skull"))
            (campaign_metagame_award_primary_skull (player0) 5)
            (campaign_metagame_award_primary_skull (player1) 5)
            (campaign_metagame_award_primary_skull (player2) 5)
            (campaign_metagame_award_primary_skull (player3) 5)
        )
    )
)

(script dormant void 070_award_secondary_skull
    (if (award_skull) 
        (begin
            (object_create "skull_cowbell")
            (sleep_until 
                (or
                    (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\secondary_skull.weapon")
                    (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\secondary_skull.weapon")
                    (unit_has_weapon (unit (player2)) "objects\weapons\multiplayer\ball\secondary_skull.weapon")
                    (unit_has_weapon (unit (player3)) "objects\weapons\multiplayer\ball\secondary_skull.weapon")
                ) 
            5)
            (if b_debug 
                (print "award cowbell skull"))
            (campaign_metagame_award_secondary_skull (player0) 2)
            (campaign_metagame_award_secondary_skull (player1) 2)
            (campaign_metagame_award_secondary_skull (player2) 2)
            (campaign_metagame_award_secondary_skull (player3) 2)
        )
    )
)

(script static void !070la01_establishing_sc_sh1
    (fade_out 0.0 0.0 0.0 0)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 0 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (object_hide (cinematic_object_get_scenery "cin_brute_cruiser1") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_capital_ship1") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_capital_ship2") true)
    (object_hide (cinematic_object_get_scenery "cin_brute_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_brute_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_brute_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_brute_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser1") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser6") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser7") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser8") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_cruiser9") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 (cinematic_object_get_scenery "cin_070la_waypoint_profile_matt") "070la01_matte_1" true)
    (object_hide (cinematic_object_get_scenery "cin_seraph") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph1") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph2") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph3") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph4") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph5") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph6") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph7") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph8") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph9") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph10") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph11") true)
    (object_hide (cinematic_object_get_scenery "cin_seraph12") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_carrier") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser1") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser6") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser7") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser8") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_cruiser9") true)
    (object_hide (cinematic_object_get_scenery "cin_elite_carrier1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 41 (cinematic_object_get_scenery "cin_070la_waypoint_profile_matt") "070la01_matte_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -1.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 0 0 0 0)
    (cinematic_scripting_start_music 0 0 0 1)
    (cinematic_print "waiting for event (cinematic_print \"custom script play\") which occurs at frame 60, but shot only has 60 frames")
    (sleep 59)
    (cinematic_print "custom script play")
    (cinematic_print "waiting for event (fade_in 0 0 0 60) which occurs at frame 60, but shot only has 60 frames")
    (fade_in 0.0 0.0 0.0 60)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la01_establishing_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 1 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 (cinematic_object_get_scenery "cin_brute_cruiser1") "070la01_cin_brute_cruiser1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 (cinematic_object_get_scenery "cin_cov_capital_ship1") "070la01_cin_capital_ship1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 (cinematic_object_get_scenery "cin_cov_capital_ship2") "070la01_cin_capital_ship2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 (cinematic_object_get_scenery "cin_brute_cruiser2") "070la01_cin_brute_cruiser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 (cinematic_object_get_scenery "cin_brute_cruiser3") "070la01_cin_brute_cruiser3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 (cinematic_object_get_scenery "cin_brute_cruiser4") "070la01_cin_brute_cruiser4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 (cinematic_object_get_scenery "cin_brute_cruiser5") "070la01_cin_brute_cruiser5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 (cinematic_object_get_scenery "cin_elite_cruiser1") "070la01_cin_elite_cruiser1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 (cinematic_object_get_scenery "cin_elite_cruiser2") "070la01_cin_elite_cruiser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 (cinematic_object_get_scenery "cin_elite_cruiser3") "070la01_cin_elite_cruiser3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 (cinematic_object_get_scenery "cin_elite_cruiser4") "070la01_cin_elite_cruiser4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 11 (cinematic_object_get_scenery "cin_elite_cruiser5") "070la01_cin_elite_cruiser5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 12 (cinematic_object_get_scenery "cin_elite_cruiser6") "070la01_cin_elite_cruiser6_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 13 (cinematic_object_get_scenery "cin_elite_cruiser7") "070la01_cin_elite_cruiser7_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 14 (cinematic_object_get_scenery "cin_elite_cruiser8") "070la01_cin_elite_cruiser8_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 15 (cinematic_object_get_scenery "cin_elite_cruiser9") "070la01_cin_elite_cruiser9_2" true)
    (object_hide (cinematic_object_get_scenery "cin_070la_waypoint_profile_matt") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 17 (cinematic_object_get_scenery "cin_seraph") "070la01_cin_seraph_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 18 (cinematic_object_get_scenery "cin_seraph1") "070la01_cin_seraph1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 19 (cinematic_object_get_scenery "cin_seraph2") "070la01_cin_seraph2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 20 (cinematic_object_get_scenery "cin_seraph3") "070la01_cin_seraph3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 21 (cinematic_object_get_scenery "cin_seraph4") "070la01_cin_seraph4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 22 (cinematic_object_get_scenery "cin_seraph5") "070la01_cin_seraph5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 (cinematic_object_get_scenery "cin_seraph6") "070la01_cin_seraph6_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 24 (cinematic_object_get_scenery "cin_seraph7") "070la01_cin_seraph7_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 25 (cinematic_object_get_scenery "cin_seraph8") "070la01_cin_seraph8_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 26 (cinematic_object_get_scenery "cin_seraph9") "070la01_cin_seraph9_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 (cinematic_object_get_scenery "cin_seraph10") "070la01_cin_seraph10_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 28 (cinematic_object_get_scenery "cin_seraph11") "070la01_cin_seraph11_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 29 (cinematic_object_get_scenery "cin_seraph12") "070la01_cin_seraph12_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 30 (cinematic_object_get_scenery "cin_fx_carrier") "070la01_cin_fx_carrier_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 31 (cinematic_object_get_scenery "cin_fx_cruiser1") "070la01_cin_fx_cruiser1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 32 (cinematic_object_get_scenery "cin_fx_cruiser2") "070la01_cin_fx_cruiser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 33 (cinematic_object_get_scenery "cin_fx_cruiser3") "070la01_cin_fx_cruiser3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 34 (cinematic_object_get_scenery "cin_fx_cruiser4") "070la01_cin_fx_cruiser4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 35 (cinematic_object_get_scenery "cin_fx_cruiser5") "070la01_cin_fx_cruiser5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 36 (cinematic_object_get_scenery "cin_fx_cruiser6") "070la01_cin_fx_cruiser6_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 37 (cinematic_object_get_scenery "cin_fx_cruiser7") "070la01_cin_fx_cruiser7_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 38 (cinematic_object_get_scenery "cin_fx_cruiser8") "070la01_cin_fx_cruiser8_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 39 (cinematic_object_get_scenery "cin_fx_cruiser9") "070la01_cin_fx_cruiser9_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 40 (cinematic_object_get_scenery "cin_elite_carrier1") "070la01_cin_elite_carrier1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 41 (cinematic_object_get_scenery "cin_070la_waypoint_profile_matt") "070la01_matte_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 25)
    (cinematic_scripting_start_effect 0 0 1 1 (cinematic_object_get "cin_fx_cruiser1"))
    (sleep 4)
    (cinematic_scripting_start_effect 0 0 1 4 (cinematic_object_get "cin_fx_cruiser4"))
    (sleep 2)
    (cinematic_scripting_start_effect 0 0 1 7 (cinematic_object_get "cin_fx_cruiser7"))
    (sleep 1)
    (cinematic_scripting_start_effect 0 0 1 3 (cinematic_object_get "cin_fx_cruiser3"))
    (sleep 1)
    (cinematic_scripting_start_effect 0 0 1 2 (cinematic_object_get "cin_fx_cruiser2"))
    (sleep 7)
    (cinematic_scripting_start_effect 0 0 1 9 (cinematic_object_get "cin_fx_cruiser9"))
    (sleep 2)
    (cinematic_scripting_start_effect 0 0 1 6 (cinematic_object_get "cin_fx_cruiser6"))
    (sleep 3)
    (cinematic_scripting_start_effect 0 0 1 5 (cinematic_object_get "cin_fx_cruiser5"))
    (sleep 10)
    (cinematic_scripting_start_effect 0 0 1 8 (cinematic_object_get "cin_fx_cruiser8"))
    (sleep 4)
    (cinematic_scripting_start_effect 0 0 1 0 (cinematic_object_get "cin_fx_carrier"))
    (sleep 742)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la01_establishing_sc
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "music" 1.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
    )
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (!070la01_establishing_sc_sh1)
    (!070la01_establishing_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 0 0 (cinematic_object_get_scenery "cin_brute_cruiser1"))
    (cinematic_scripting_destroy_object 0 0 1 (cinematic_object_get_scenery "cin_cov_capital_ship1"))
    (cinematic_scripting_destroy_object 0 0 2 (cinematic_object_get_scenery "cin_cov_capital_ship2"))
    (cinematic_scripting_destroy_object 0 0 3 (cinematic_object_get_scenery "cin_brute_cruiser2"))
    (cinematic_scripting_destroy_object 0 0 4 (cinematic_object_get_scenery "cin_brute_cruiser3"))
    (cinematic_scripting_destroy_object 0 0 5 (cinematic_object_get_scenery "cin_brute_cruiser4"))
    (cinematic_scripting_destroy_object 0 0 6 (cinematic_object_get_scenery "cin_brute_cruiser5"))
    (cinematic_scripting_destroy_object 0 0 7 (cinematic_object_get_scenery "cin_elite_cruiser1"))
    (cinematic_scripting_destroy_object 0 0 8 (cinematic_object_get_scenery "cin_elite_cruiser2"))
    (cinematic_scripting_destroy_object 0 0 9 (cinematic_object_get_scenery "cin_elite_cruiser3"))
    (cinematic_scripting_destroy_object 0 0 10 (cinematic_object_get_scenery "cin_elite_cruiser4"))
    (cinematic_scripting_destroy_object 0 0 11 (cinematic_object_get_scenery "cin_elite_cruiser5"))
    (cinematic_scripting_destroy_object 0 0 12 (cinematic_object_get_scenery "cin_elite_cruiser6"))
    (cinematic_scripting_destroy_object 0 0 13 (cinematic_object_get_scenery "cin_elite_cruiser7"))
    (cinematic_scripting_destroy_object 0 0 14 (cinematic_object_get_scenery "cin_elite_cruiser8"))
    (cinematic_scripting_destroy_object 0 0 15 (cinematic_object_get_scenery "cin_elite_cruiser9"))
    (cinematic_scripting_destroy_object 0 0 16 (cinematic_object_get_scenery "cin_070la_waypoint_profile_matt"))
    (cinematic_scripting_destroy_object 0 0 17 (cinematic_object_get_scenery "cin_seraph"))
    (cinematic_scripting_destroy_object 0 0 18 (cinematic_object_get_scenery "cin_seraph1"))
    (cinematic_scripting_destroy_object 0 0 19 (cinematic_object_get_scenery "cin_seraph2"))
    (cinematic_scripting_destroy_object 0 0 20 (cinematic_object_get_scenery "cin_seraph3"))
    (cinematic_scripting_destroy_object 0 0 21 (cinematic_object_get_scenery "cin_seraph4"))
    (cinematic_scripting_destroy_object 0 0 22 (cinematic_object_get_scenery "cin_seraph5"))
    (cinematic_scripting_destroy_object 0 0 23 (cinematic_object_get_scenery "cin_seraph6"))
    (cinematic_scripting_destroy_object 0 0 24 (cinematic_object_get_scenery "cin_seraph7"))
    (cinematic_scripting_destroy_object 0 0 25 (cinematic_object_get_scenery "cin_seraph8"))
    (cinematic_scripting_destroy_object 0 0 26 (cinematic_object_get_scenery "cin_seraph9"))
    (cinematic_scripting_destroy_object 0 0 27 (cinematic_object_get_scenery "cin_seraph10"))
    (cinematic_scripting_destroy_object 0 0 28 (cinematic_object_get_scenery "cin_seraph11"))
    (cinematic_scripting_destroy_object 0 0 29 (cinematic_object_get_scenery "cin_seraph12"))
    (cinematic_scripting_destroy_object 0 0 30 (cinematic_object_get_scenery "cin_fx_carrier"))
    (cinematic_scripting_destroy_object 0 0 31 (cinematic_object_get_scenery "cin_fx_cruiser1"))
    (cinematic_scripting_destroy_object 0 0 32 (cinematic_object_get_scenery "cin_fx_cruiser2"))
    (cinematic_scripting_destroy_object 0 0 33 (cinematic_object_get_scenery "cin_fx_cruiser3"))
    (cinematic_scripting_destroy_object 0 0 34 (cinematic_object_get_scenery "cin_fx_cruiser4"))
    (cinematic_scripting_destroy_object 0 0 35 (cinematic_object_get_scenery "cin_fx_cruiser5"))
    (cinematic_scripting_destroy_object 0 0 36 (cinematic_object_get_scenery "cin_fx_cruiser6"))
    (cinematic_scripting_destroy_object 0 0 37 (cinematic_object_get_scenery "cin_fx_cruiser7"))
    (cinematic_scripting_destroy_object 0 0 38 (cinematic_object_get_scenery "cin_fx_cruiser8"))
    (cinematic_scripting_destroy_object 0 0 39 (cinematic_object_get_scenery "cin_fx_cruiser9"))
    (cinematic_scripting_destroy_object 0 0 40 (cinematic_object_get_scenery "cin_elite_carrier1"))
    (cinematic_scripting_destroy_object 0 0 41 (cinematic_object_get_scenery "cin_070la_waypoint_profile_matt"))
)

(script static void !070la02_outnumbered_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 0 "cin_bridge_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_bridge_anchor" "cin_bridge_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 0 (cinematic_object_get_unit "cin_officer") "070la02_cin_officer_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_unit "cin_captain") "070la02_cin_captain_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_chair") "070la02_cin_elite_chair_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.5 0.0)
    (sleep 2)
    (cinematic_scripting_start_dialogue 0 1 0 0 (cinematic_object_get_unit "cin_officer"))
    (sleep 58)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la02_outnumbered_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 1 "cin_bridge_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 1)
    (cinematic_object_create_cinematic_anchor "cin_bridge_anchor" "cin_bridge_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 0 (cinematic_object_get_unit "cin_officer") "070la02_cin_officer_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_unit "cin_captain") "070la02_cin_captain_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_chair") "070la02_cin_elite_chair_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 0.5 0.0)
    (sleep 10)
    (cinematic_scripting_start_dialogue 0 1 1 0 (cinematic_object_get_unit "cin_officer"))
    (sleep 32)
    (cinematic_scripting_start_dialogue 0 1 1 1 (cinematic_object_get_unit "cin_officer"))
    (sleep 59)
    (cinematic_scripting_start_dialogue 0 1 1 2 (cinematic_object_get_unit "cin_captain"))
    (sleep 5)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la02_outnumbered_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 2 "cin_bridge_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 2)
    (cinematic_object_create_cinematic_anchor "cin_bridge_anchor" "cin_bridge_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 0 (cinematic_object_get_unit "cin_officer") "070la02_cin_officer_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_unit "cin_captain") "070la02_cin_captain_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_chair") "070la02_cin_elite_chair_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.5 0.0)
    (sleep 1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la02_outnumbered_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 3 "cin_bridge_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 3)
    (cinematic_object_create_cinematic_anchor "cin_bridge_anchor" "cin_bridge_anchor")
    (object_hide (cinematic_object_get_unit "cin_officer") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_unit "cin_captain") "070la02_cin_captain_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_chair") "070la02_cin_elite_chair_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 0.5 0.0)
    (sleep 61)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la02_outnumbered_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 4 "cin_bridge_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 4)
    (cinematic_object_create_cinematic_anchor "cin_bridge_anchor" "cin_bridge_anchor")
    (object_hide (cinematic_object_get_unit "cin_officer") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_unit "cin_captain") "070la02_cin_captain_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_chair") "070la02_cin_elite_chair_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 0.5 0.0)
    (sleep 65)
    (cinematic_scripting_start_dialogue 0 1 4 0 (cinematic_object_get_unit "cin_captain"))
    (sleep 61)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la02_outnumbered_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 0)
    (!070la02_outnumbered_sc_sh1)
    (!070la02_outnumbered_sc_sh2)
    (!070la02_outnumbered_sc_sh3)
    (!070la02_outnumbered_sc_sh4)
    (!070la02_outnumbered_sc_sh5)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 1 0 (cinematic_object_get_unit "cin_officer"))
    (cinematic_scripting_destroy_object 0 1 1 (cinematic_object_get_unit "cin_captain"))
    (cinematic_scripting_destroy_object 0 1 2 (cinematic_object_get_scenery "cin_chair"))
)

(script static void !070la03_load_up_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 0 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 0)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (object_hide (cinematic_object_get_unit "cin_johnson") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_marine1") "070la03_cin_marine1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_unit "cin_marine2") "070la03_cin_marine2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_unit "cin_marine3") "070la03_cin_marine3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_unit "cin_marine4") "070la03_cin_marine4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_unit "cin_marine5") "070la03_cin_marine5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_unit "cin_marine6") "070la03_cin_marine6_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_unit "cin_marine7") "070la03_cin_marine7_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_unit "cin_marine8") "070la03_cin_marine8_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_unit "cin_marine9") "070la03_cin_marine9_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_unit "cin_marine10") "070la03_cin_marine10_1" true)
    (object_hide (cinematic_object_get_unit "cin_marine11") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_unit "cin_master_chief") "070la03_cin_master_chief_1" true)
    (object_hide (cinematic_object_get_scenery "cin_frigate") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 14 (cinematic_object_get_scenery "cin_pelican") "070la03_cin_pelican_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1") "070la03_cin_fx_marker1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2") "070la03_cin_fx_marker2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3") "070la03_cin_fx_marker3_1" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 85)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la03_load_up_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 1 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 1)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (object_hide (cinematic_object_get_unit "cin_johnson") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_marine1") "070la03_cin_marine1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_unit "cin_marine2") "070la03_cin_marine2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_unit "cin_marine3") "070la03_cin_marine3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_unit "cin_marine4") "070la03_cin_marine4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_unit "cin_marine5") "070la03_cin_marine5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_unit "cin_marine6") "070la03_cin_marine6_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_unit "cin_marine7") "070la03_cin_marine7_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_unit "cin_marine8") "070la03_cin_marine8_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_unit "cin_marine9") "070la03_cin_marine9_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_unit "cin_marine10") "070la03_cin_marine10_2" true)
    (object_hide (cinematic_object_get_unit "cin_marine11") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_unit "cin_master_chief") "070la03_cin_master_chief_2" true)
    (object_hide (cinematic_object_get_scenery "cin_frigate") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 14 (cinematic_object_get_scenery "cin_pelican") "070la03_cin_pelican_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1") "070la03_cin_fx_marker1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2") "070la03_cin_fx_marker2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3") "070la03_cin_fx_marker3_2" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 3)
    (cinematic_scripting_start_dialogue 0 2 1 0 none)
    (sleep 56)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la03_load_up_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 2 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 2)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_johnson") "070la03_cin_johnson_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_marine1") "070la03_cin_marine1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_unit "cin_marine2") "070la03_cin_marine2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_unit "cin_marine3") "070la03_cin_marine3_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_unit "cin_marine4") "070la03_cin_marine4_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_unit "cin_marine5") "070la03_cin_marine5_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_unit "cin_marine6") "070la03_cin_marine6_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_unit "cin_marine7") "070la03_cin_marine7_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_unit "cin_marine8") "070la03_cin_marine8_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_unit "cin_marine9") "070la03_cin_marine9_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_unit "cin_marine10") "070la03_cin_marine10_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 11 (cinematic_object_get_unit "cin_marine11") "070la03_cin_marine11_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_unit "cin_master_chief") "070la03_cin_master_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 13 (cinematic_object_get_scenery "cin_frigate") "070la03_cin_frigate_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 14 (cinematic_object_get_scenery "cin_pelican") "070la03_cin_pelican_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1") "070la03_cin_fx_marker1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2") "070la03_cin_fx_marker2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3") "070la03_cin_fx_marker3_3" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 10)
    (cinematic_scripting_start_dialogue 0 2 2 1 none)
    (sleep 42)
    (cinematic_scripting_start_dialogue 0 2 2 0 (cinematic_object_get_unit "cin_johnson"))
    (sleep 34)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la03_load_up_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 3 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 3)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_johnson") "070la03_cin_johnson_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_marine1") "070la03_cin_marine1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_unit "cin_marine2") "070la03_cin_marine2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_unit "cin_marine3") "070la03_cin_marine3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_unit "cin_marine4") "070la03_cin_marine4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_unit "cin_marine5") "070la03_cin_marine5_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_unit "cin_marine6") "070la03_cin_marine6_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_unit "cin_marine7") "070la03_cin_marine7_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_unit "cin_marine8") "070la03_cin_marine8_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_unit "cin_marine9") "070la03_cin_marine9_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_unit "cin_marine10") "070la03_cin_marine10_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 11 (cinematic_object_get_unit "cin_marine11") "070la03_cin_marine11_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_unit "cin_master_chief") "070la03_cin_master_chief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 13 (cinematic_object_get_scenery "cin_frigate") "070la03_cin_frigate_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 14 (cinematic_object_get_scenery "cin_pelican") "070la03_cin_pelican_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1") "070la03_cin_fx_marker1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2") "070la03_cin_fx_marker2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3") "070la03_cin_fx_marker3_4" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 59)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la03_load_up_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 4 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 4)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_johnson") "070la03_cin_johnson_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_marine1") "070la03_cin_marine1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_unit "cin_marine2") "070la03_cin_marine2_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_unit "cin_marine3") "070la03_cin_marine3_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_unit "cin_marine4") "070la03_cin_marine4_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_unit "cin_marine5") "070la03_cin_marine5_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_unit "cin_marine6") "070la03_cin_marine6_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_unit "cin_marine7") "070la03_cin_marine7_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_unit "cin_marine8") "070la03_cin_marine8_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_unit "cin_marine9") "070la03_cin_marine9_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_unit "cin_marine10") "070la03_cin_marine10_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 11 (cinematic_object_get_unit "cin_marine11") "070la03_cin_marine11_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_unit "cin_master_chief") "070la03_cin_master_chief_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 13 (cinematic_object_get_scenery "cin_frigate") "070la03_cin_frigate_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 14 (cinematic_object_get_scenery "cin_pelican") "070la03_cin_pelican_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1") "070la03_cin_fx_marker1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2") "070la03_cin_fx_marker2_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3") "070la03_cin_fx_marker3_5" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (sleep 24)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la03_load_up_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 5 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 5)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_johnson") "070la03_cin_johnson_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_marine1") "070la03_cin_marine1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_unit "cin_marine2") "070la03_cin_marine2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_unit "cin_marine3") "070la03_cin_marine3_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_unit "cin_marine4") "070la03_cin_marine4_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_unit "cin_marine5") "070la03_cin_marine5_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_unit "cin_marine6") "070la03_cin_marine6_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_unit "cin_marine7") "070la03_cin_marine7_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_unit "cin_marine8") "070la03_cin_marine8_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_unit "cin_marine9") "070la03_cin_marine9_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_unit "cin_marine10") "070la03_cin_marine10_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 11 (cinematic_object_get_unit "cin_marine11") "070la03_cin_marine11_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_unit "cin_master_chief") "070la03_cin_master_chief_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 13 (cinematic_object_get_scenery "cin_frigate") "070la03_cin_frigate_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 14 (cinematic_object_get_scenery "cin_pelican") "070la03_cin_pelican_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1") "070la03_cin_fx_marker1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2") "070la03_cin_fx_marker2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3") "070la03_cin_fx_marker3_6" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 36)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la03_load_up_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 6 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 6)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_johnson") "070la03_cin_johnson_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_marine1") "070la03_cin_marine1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_unit "cin_marine2") "070la03_cin_marine2_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_unit "cin_marine3") "070la03_cin_marine3_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_unit "cin_marine4") "070la03_cin_marine4_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_unit "cin_marine5") "070la03_cin_marine5_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_unit "cin_marine6") "070la03_cin_marine6_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_unit "cin_marine7") "070la03_cin_marine7_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_unit "cin_marine8") "070la03_cin_marine8_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_unit "cin_marine9") "070la03_cin_marine9_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_unit "cin_marine10") "070la03_cin_marine10_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 11 (cinematic_object_get_unit "cin_marine11") "070la03_cin_marine11_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_unit "cin_master_chief") "070la03_cin_master_chief_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 13 (cinematic_object_get_scenery "cin_frigate") "070la03_cin_frigate_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 14 (cinematic_object_get_scenery "cin_pelican") "070la03_cin_pelican_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1") "070la03_cin_fx_marker1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2") "070la03_cin_fx_marker2_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3") "070la03_cin_fx_marker3_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 18 (cinematic_object_get_scenery "cin_pelican2") "070la03_cin_pelican2_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 19 (cinematic_object_get_scenery "cin_pelican3") "070la03_cin_pelican3_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_back" 0.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_down" 0.0 0.0)
    (sleep 15)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_back" 0.5 60.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_down" 0.25 60.0)
    (sleep 334)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la03_load_up_sc
    (cinematic_print "beginning scene 3")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 0)
    (!070la03_load_up_sc_sh1)
    (!070la03_load_up_sc_sh2)
    (!070la03_load_up_sc_sh3)
    (!070la03_load_up_sc_sh4)
    (!070la03_load_up_sc_sh5)
    (!070la03_load_up_sc_sh6)
    (!070la03_load_up_sc_sh7)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 2 0 (cinematic_object_get_unit "cin_johnson"))
    (cinematic_scripting_destroy_object 0 2 1 (cinematic_object_get_unit "cin_marine1"))
    (cinematic_scripting_destroy_object 0 2 2 (cinematic_object_get_unit "cin_marine2"))
    (cinematic_scripting_destroy_object 0 2 3 (cinematic_object_get_unit "cin_marine3"))
    (cinematic_scripting_destroy_object 0 2 4 (cinematic_object_get_unit "cin_marine4"))
    (cinematic_scripting_destroy_object 0 2 5 (cinematic_object_get_unit "cin_marine5"))
    (cinematic_scripting_destroy_object 0 2 6 (cinematic_object_get_unit "cin_marine6"))
    (cinematic_scripting_destroy_object 0 2 7 (cinematic_object_get_unit "cin_marine7"))
    (cinematic_scripting_destroy_object 0 2 8 (cinematic_object_get_unit "cin_marine8"))
    (cinematic_scripting_destroy_object 0 2 9 (cinematic_object_get_unit "cin_marine9"))
    (cinematic_scripting_destroy_object 0 2 10 (cinematic_object_get_unit "cin_marine10"))
    (cinematic_scripting_destroy_object 0 2 11 (cinematic_object_get_unit "cin_marine11"))
    (cinematic_scripting_destroy_object 0 2 12 (cinematic_object_get_unit "cin_master_chief"))
    (cinematic_scripting_destroy_object 0 2 13 (cinematic_object_get_scenery "cin_frigate"))
    (cinematic_scripting_destroy_object 0 2 14 (cinematic_object_get_scenery "cin_pelican"))
    (cinematic_scripting_destroy_object 0 2 15 (cinematic_object_get_scenery "cin_fx_marker1"))
    (cinematic_scripting_destroy_object 0 2 16 (cinematic_object_get_scenery "cin_fx_marker2"))
    (cinematic_scripting_destroy_object 0 2 17 (cinematic_object_get_scenery "cin_fx_marker3"))
    (cinematic_scripting_destroy_object 0 2 18 (cinematic_object_get_scenery "cin_pelican2"))
    (cinematic_scripting_destroy_object 0 2 19 (cinematic_object_get_scenery "cin_pelican3"))
)

(script static void !070la04_free_fall_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 3) 0 "cin_way_sky_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 3) 0)
    (cinematic_object_create_cinematic_anchor "cin_way_sky_anchor" "cin_way_sky_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 0 (cinematic_object_get_scenery "cin_brute_carrier1") "070la04_cin_brute_carrier1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 1 (cinematic_object_get_scenery "cin_cov_cruiser") "070la04_cin_cov_cruiser_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 2 (cinematic_object_get_scenery "cin_cov_cruiser1") "070la04_cin_cov_cruiser1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 3 (cinematic_object_get_scenery "cin_cov_cruiser2") "070la04_cin_cov_cruiser2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 4 (cinematic_object_get_scenery "cin_cov_cruiser3") "070la04_cin_cov_cruiser3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 5 (cinematic_object_get_scenery "cin_cov_cruiser4") "070la04_cin_cov_cruiser4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 6 (cinematic_object_get_scenery "cin_elite_carrier") "070la04_cin_elite_carrier_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 7 (cinematic_object_get_scenery "cin_frigate1") "070la04_cin_frigate1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 8 (cinematic_object_get_scenery "cin_pelican") "070la04_cin_pelican_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 9 (cinematic_object_get_scenery "cin_pelican2") "070la04_cin_pelican2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 10 (cinematic_object_get_scenery "cin_pelican3") "070la04_cin_pelican3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 11 (cinematic_object_get_scenery "cin_pelican4") "070la04_cin_pelican4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 12 (cinematic_object_get_scenery "cin_pelican5") "070la04_cin_pelican5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 13 (cinematic_object_get_scenery "cin_pelican6") "070la04_cin_pelican6_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 14 (cinematic_object_get_scenery "cin_seraph_big1") "070la04_cin_seraph1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 15 (cinematic_object_get_scenery "cin_seraph_big2") "070la04_cin_seraph2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 16 (cinematic_object_get_scenery "cin_seraph_big3") "070la04_cin_seraph3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 17 (cinematic_object_get_scenery "cin_seraph_big4") "070la04_cin_seraph4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 18 (cinematic_object_get_scenery "cin_seraph_big5") "070la04_cin_seraph5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 19 (cinematic_object_get_scenery "cin_seraph_big6") "070la04_cin_seraph6_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 20 (cinematic_object_get_scenery "cin_seraph_big7") "070la04_cin_seraph7_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 21 (cinematic_object_get_scenery "cin_seraph_big8") "070la04_cin_seraph8_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 22 (cinematic_object_get_scenery "cin_fx_explosion") "070la04_cin_fx_explosion_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 23 (cinematic_object_get_scenery "cin_brute_carrier") "070la04_cin_brute_carrier_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 24 (cinematic_object_get_scenery "cin_fx_explosions") "070la04_cin_fx_explosions_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.2 0.0)
    (cinematic_scripting_start_effect 0 3 0 0 (cinematic_object_get "cin_seraph_big6"))
    (sleep 5)
    (cinematic_scripting_start_effect 0 3 0 1 (cinematic_object_get "cin_seraph_big7"))
    (sleep 5)
    (cinematic_scripting_start_effect 0 3 0 2 (cinematic_object_get "cin_seraph_big8"))
    (sleep 65)
    (cinematic_scripting_start_effect 0 3 0 3 (cinematic_object_get "cin_seraph_big1"))
    (sleep 5)
    (cinematic_scripting_start_effect 0 3 0 4 (cinematic_object_get "cin_seraph_big2"))
    (sleep 5)
    (cinematic_scripting_start_effect 0 3 0 5 (cinematic_object_get "cin_seraph_big3"))
    (sleep 30)
    (cinematic_scripting_start_effect 0 3 0 6 (cinematic_object_get "cin_fx_explosion"))
    (sleep 35)
    (cinematic_scripting_start_effect 0 3 0 9 (cinematic_object_get "cin_fx_explosions"))
    (sleep 25)
    (cinematic_scripting_start_effect 0 3 0 7 (cinematic_object_get "cin_fx_explosion"))
    (cinematic_scripting_start_effect 0 3 0 8 (cinematic_object_get "cin_fx_explosion"))
    (sleep 7)
    (object_destroy (cinematic_object_get "cin_pelican5"))
    (cinematic_print "custom script play")
    (sleep 119)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la04_free_fall_sc
    (cinematic_print "beginning scene 4")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 3) 0)
    (!070la04_free_fall_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 3 0 (cinematic_object_get_scenery "cin_brute_carrier1"))
    (cinematic_scripting_destroy_object 0 3 1 (cinematic_object_get_scenery "cin_cov_cruiser"))
    (cinematic_scripting_destroy_object 0 3 2 (cinematic_object_get_scenery "cin_cov_cruiser1"))
    (cinematic_scripting_destroy_object 0 3 3 (cinematic_object_get_scenery "cin_cov_cruiser2"))
    (cinematic_scripting_destroy_object 0 3 4 (cinematic_object_get_scenery "cin_cov_cruiser3"))
    (cinematic_scripting_destroy_object 0 3 5 (cinematic_object_get_scenery "cin_cov_cruiser4"))
    (cinematic_scripting_destroy_object 0 3 6 (cinematic_object_get_scenery "cin_elite_carrier"))
    (cinematic_scripting_destroy_object 0 3 7 (cinematic_object_get_scenery "cin_frigate1"))
    (cinematic_scripting_destroy_object 0 3 8 (cinematic_object_get_scenery "cin_pelican"))
    (cinematic_scripting_destroy_object 0 3 9 (cinematic_object_get_scenery "cin_pelican2"))
    (cinematic_scripting_destroy_object 0 3 10 (cinematic_object_get_scenery "cin_pelican3"))
    (cinematic_scripting_destroy_object 0 3 11 (cinematic_object_get_scenery "cin_pelican4"))
    (cinematic_scripting_destroy_object 0 3 12 (cinematic_object_get_scenery "cin_pelican5"))
    (cinematic_scripting_destroy_object 0 3 13 (cinematic_object_get_scenery "cin_pelican6"))
    (cinematic_scripting_destroy_object 0 3 14 (cinematic_object_get_scenery "cin_seraph_big1"))
    (cinematic_scripting_destroy_object 0 3 15 (cinematic_object_get_scenery "cin_seraph_big2"))
    (cinematic_scripting_destroy_object 0 3 16 (cinematic_object_get_scenery "cin_seraph_big3"))
    (cinematic_scripting_destroy_object 0 3 17 (cinematic_object_get_scenery "cin_seraph_big4"))
    (cinematic_scripting_destroy_object 0 3 18 (cinematic_object_get_scenery "cin_seraph_big5"))
    (cinematic_scripting_destroy_object 0 3 19 (cinematic_object_get_scenery "cin_seraph_big6"))
    (cinematic_scripting_destroy_object 0 3 20 (cinematic_object_get_scenery "cin_seraph_big7"))
    (cinematic_scripting_destroy_object 0 3 21 (cinematic_object_get_scenery "cin_seraph_big8"))
    (cinematic_scripting_destroy_object 0 3 22 (cinematic_object_get_scenery "cin_fx_explosion"))
    (cinematic_scripting_destroy_object 0 3 23 (cinematic_object_get_scenery "cin_brute_carrier"))
    (cinematic_scripting_destroy_object 0 3 24 (cinematic_object_get_scenery "cin_fx_explosions"))
)

(script static void !070la05_cockpit_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 4) 0 "cin_lower_skybox_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 4) 0)
    (cinematic_object_create_cinematic_anchor "cin_lower_skybox_anchor" "cin_lower_skybox_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 0 (cinematic_object_get_unit "cin_chief") "070la05_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 1 (cinematic_object_get_unit "cin_johnson") "070la05_cin_johnson_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 2 (cinematic_object_get_unit "cin_pilot") "070la05_cin_pilot_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 3 (cinematic_object_get_scenery "cin_pelican_glass") "070la05_cin_pelican_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.0 0.0)
    (sleep 101)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la05_cockpit_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 4) 1 "cin_lower_skybox_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 4) 1)
    (cinematic_object_create_cinematic_anchor "cin_lower_skybox_anchor" "cin_lower_skybox_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 0 (cinematic_object_get_unit "cin_chief") "070la05_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 1 (cinematic_object_get_unit "cin_johnson") "070la05_cin_johnson_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 2 (cinematic_object_get_unit "cin_pilot") "070la05_cin_pilot_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 3 (cinematic_object_get_scenery "cin_pelican_glass") "070la05_cin_pelican_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 0.0 0.0)
    (sleep 200)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la05_cockpit_sc
    (cinematic_print "beginning scene 5")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 4) 0)
    (!070la05_cockpit_sc_sh1)
    (!070la05_cockpit_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 4 0 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 4 1 (cinematic_object_get_unit "cin_johnson"))
    (cinematic_scripting_destroy_object 0 4 2 (cinematic_object_get_unit "cin_pilot"))
    (cinematic_scripting_destroy_object 0 4 3 (cinematic_object_get_scenery "cin_pelican_glass"))
)

(script static void !070la06_door_opens_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 5) 0 "cin_anchor_070la06")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 5) 0)
    (cinematic_object_create_cinematic_anchor "cin_anchor_070la06" "cin_anchor_070la06")
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 0 (cinematic_object_get_unit "cin_arbiter") "070la06_cin_arbiter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 1 (cinematic_object_get_unit "cin_chief") "070la06_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 2 (cinematic_object_get_unit "cin_marine1") "070la06_cin_marine1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 3 (cinematic_object_get_unit "cin_marine2") "070la06_cin_marine2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 4 (cinematic_object_get_scenery "cin_sniper_rifle") "sniper_rifle_070la06_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 5 (cinematic_object_get_scenery "cin_beam_rifle") "beam_rifle_070la_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 6 (cinematic_object_get_scenery "cin_pelican1") "070la06_cin_pelican1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 7 (cinematic_object_get_scenery "cin_sniper_rifle2") "sniper_rifle_070la06_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 8 (cinematic_object_get_scenery "cin_new_battle_rifle1") "070la06_cin_new_battle_rilfe1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 9 (cinematic_object_get_scenery "cin_new_battle_rifle2") "070la06_cin_new_battle_rifle2_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 81)
    (cinematic_scripting_start_dialogue 0 5 0 0 none)
    (sleep 35)
    (cinematic_scripting_start_dialogue 0 5 0 1 none)
    (sleep 25)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la06_door_opens_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 5) 1 "cin_anchor_070la06")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 5) 1)
    (cinematic_object_create_cinematic_anchor "cin_anchor_070la06" "cin_anchor_070la06")
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 0 (cinematic_object_get_unit "cin_arbiter") "070la06_cin_arbiter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 1 (cinematic_object_get_unit "cin_chief") "070la06_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 2 (cinematic_object_get_unit "cin_marine1") "070la06_cin_marine1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 3 (cinematic_object_get_unit "cin_marine2") "070la06_cin_marine2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 4 (cinematic_object_get_scenery "cin_sniper_rifle") "sniper_rifle_070la06_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 5 (cinematic_object_get_scenery "cin_beam_rifle") "beam_rifle_070la_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 6 (cinematic_object_get_scenery "cin_pelican1") "070la06_cin_pelican1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 7 (cinematic_object_get_scenery "cin_sniper_rifle2") "sniper_rifle_070la06_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 8 (cinematic_object_get_scenery "cin_new_battle_rifle1") "070la06_cin_new_battle_rilfe1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 9 (cinematic_object_get_scenery "cin_new_battle_rifle2") "070la06_cin_new_battle_rifle2_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (begin
        (texture_camera_on)
        (texture_camera_set_object_marker (cinematic_object_get "cin_chief") "drop" 110.0)
        (set texture_camera_near_plane 0.01)
    )
    (cinematic_print "custom script play")
    (sleep 41)
    (cinematic_scripting_start_dialogue 0 5 1 0 none)
    (sleep 34)
    (cinematic_scripting_start_dialogue 0 5 1 1 none)
    (sleep 117)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la06_door_opens_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 5) 2 "cin_anchor_070la06")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 5) 2)
    (cinematic_object_create_cinematic_anchor "cin_anchor_070la06" "cin_anchor_070la06")
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 0 (cinematic_object_get_unit "cin_arbiter") "070la06_cin_arbiter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 1 (cinematic_object_get_unit "cin_chief") "070la06_cin_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 2 (cinematic_object_get_unit "cin_marine1") "070la06_cin_marine1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 3 (cinematic_object_get_unit "cin_marine2") "070la06_cin_marine2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 4 (cinematic_object_get_scenery "cin_sniper_rifle") "sniper_rifle_070la06_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 5 (cinematic_object_get_scenery "cin_beam_rifle") "beam_rifle_070la_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 6 (cinematic_object_get_scenery "cin_pelican1") "070la06_cin_pelican1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 7 (cinematic_object_get_scenery "cin_sniper_rifle2") "sniper_rifle_070la06_3" true)
    (object_hide (cinematic_object_get_scenery "cin_new_battle_rifle1") true)
    (object_hide (cinematic_object_get_scenery "cin_new_battle_rifle2") true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (begin
        (texture_camera_on)
        (texture_camera_set_object_marker (cinematic_object_get "cin_chief") "drop" 110.0)
        (set texture_camera_near_plane 0.01)
    )
    (cinematic_print "custom script play")
    (sleep 174)
    (cinematic_print "custom script play")
    (cinematic_scripting_fade_out 0.0 0.0 0.0 15)
    (fade_out 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070la06_door_opens_sc
    (cinematic_print "beginning scene 6")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 5) 0)
    (!070la06_door_opens_sc_sh1)
    (!070la06_door_opens_sc_sh2)
    (!070la06_door_opens_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 5 0 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 0 5 1 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 5 2 (cinematic_object_get_unit "cin_marine1"))
    (cinematic_scripting_destroy_object 0 5 3 (cinematic_object_get_unit "cin_marine2"))
    (cinematic_scripting_destroy_object 0 5 4 (cinematic_object_get_scenery "cin_sniper_rifle"))
    (cinematic_scripting_destroy_object 0 5 5 (cinematic_object_get_scenery "cin_beam_rifle"))
    (cinematic_scripting_destroy_object 0 5 6 (cinematic_object_get_scenery "cin_pelican1"))
    (cinematic_scripting_destroy_object 0 5 7 (cinematic_object_get_scenery "cin_sniper_rifle2"))
    (cinematic_scripting_destroy_object 0 5 8 (cinematic_object_get_scenery "cin_new_battle_rifle1"))
    (cinematic_scripting_destroy_object 0 5 9 (cinematic_object_get_scenery "cin_new_battle_rifle2"))
)

(script static void 070la_waypoint_arrival_debug
    (cinematic_zone_activate_for_debugging 0)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
    (fade_in 0.0 0.0 0.0 15)
    (!070la01_establishing_sc)
    (!070la02_outnumbered_sc)
    (!070la03_load_up_sc)
    (!070la04_free_fall_sc)
    (!070la05_cockpit_sc)
    (!070la06_door_opens_sc)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
)

(script static void 070la_waypoint_arrival
    (cinematic_zone_activate 0)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
    (fade_in 0.0 0.0 0.0 15)
    (!070la01_establishing_sc)
    (!070la02_outnumbered_sc)
    (!070la03_load_up_sc)
    (!070la04_free_fall_sc)
    (!070la05_cockpit_sc)
    (!070la06_door_opens_sc)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 070la_waypoint_arrival_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void !070lb01_why_delay_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 0 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 65)
    (cinematic_scripting_start_dialogue 1 0 0 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 47)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 1 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 70)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 2 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 2)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (object_hide (cinematic_object_get_unit "cin_elite1") true)
    (object_hide (cinematic_object_get_unit "cin_elite2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 1)
    (cinematic_scripting_start_dialogue 1 0 2 0 (cinematic_object_get_unit "cin_monitor"))
    (sleep 79)
    (cinematic_scripting_start_dialogue 1 0 2 1 (cinematic_object_get_unit "cin_monitor"))
    (sleep 11)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 3 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 3)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 139)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 4 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 4)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (sleep 2)
    (cinematic_scripting_start_dialogue 1 0 4 0 (cinematic_object_get_unit "cin_monitor"))
    (sleep 45)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 5 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 5)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_6" true)
    (object_hide (cinematic_object_get_unit "cin_elite1") true)
    (object_hide (cinematic_object_get_unit "cin_elite2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 45)
    (cinematic_scripting_start_dialogue 1 0 5 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 141)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 6 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 6)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (sleep 1)
    (cinematic_scripting_start_dialogue 1 0 6 0 (cinematic_object_get_unit "cin_monitor"))
    (sleep 92)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 7 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 7)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (sleep 118)
    (cinematic_scripting_start_dialogue 1 0 7 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 10)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 8 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 8)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_9" true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (sleep 45)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh10
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 9 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 9)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_10" true)
    (object_hide (cinematic_object_get_unit "cin_elite1") true)
    (object_hide (cinematic_object_get_unit "cin_elite2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_10" true)
    (cinematic_lights_initialize_for_shot 9)
    (cinematic_clips_initialize_for_shot 9)
    (sleep 50)
    (cinematic_scripting_start_dialogue 1 0 9 0 (cinematic_object_get_unit "cin_monitor"))
    (sleep 13)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc_sh11
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 10 "cin_070lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 10)
    (cinematic_object_create_cinematic_anchor "cin_070lb_anchor" "cin_070lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 (cinematic_object_get_unit "cin_chief") "070lb01_cin_chief_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 (cinematic_object_get_unit "cin_elite1") "070lb01_cin_elite1_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 (cinematic_object_get_unit "cin_elite2") "070lb01_cin_elite2_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 (cinematic_object_get_unit "cin_monitor") "070lb01_cin_monitor_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 (cinematic_object_get_scenery "cin_phantom") "070lb01_cin_phantom_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 (cinematic_object_get_scenery "cin_cage") "070lb01_cage_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 (cinematic_object_get_unit "cin_arbiter") "070lb01_cin_arbiter_11" true)
    (cinematic_lights_initialize_for_shot 10)
    (cinematic_clips_initialize_for_shot 10)
    (sleep 24)
    (cinematic_scripting_start_dialogue 1 0 10 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 92)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lb01_why_delay_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (!070lb01_why_delay_sc_sh1)
    (!070lb01_why_delay_sc_sh2)
    (!070lb01_why_delay_sc_sh3)
    (!070lb01_why_delay_sc_sh4)
    (!070lb01_why_delay_sc_sh5)
    (!070lb01_why_delay_sc_sh6)
    (!070lb01_why_delay_sc_sh7)
    (!070lb01_why_delay_sc_sh8)
    (!070lb01_why_delay_sc_sh9)
    (!070lb01_why_delay_sc_sh10)
    (!070lb01_why_delay_sc_sh11)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 1 0 0 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 1 0 1 (cinematic_object_get_unit "cin_elite1"))
    (cinematic_scripting_destroy_object 1 0 2 (cinematic_object_get_unit "cin_elite2"))
    (cinematic_scripting_destroy_object 1 0 3 (cinematic_object_get_unit "cin_monitor"))
    (cinematic_scripting_destroy_object 1 0 4 (cinematic_object_get_scenery "cin_phantom"))
    (cinematic_scripting_destroy_object 1 0 5 (cinematic_object_get_scenery "cin_cage"))
    (cinematic_scripting_destroy_object 1 0 6 (cinematic_object_get_unit "cin_arbiter"))
)

(script static void 070lb_343_found_debug
    (cinematic_zone_activate_for_debugging 1)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
    (fade_in 0.0 0.0 0.0 15)
    (!070lb01_why_delay_sc)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 1)
)

(script static void 070lb_343_found
    (cinematic_zone_activate 1)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
    (fade_in 0.0 0.0 0.0 15)
    (!070lb01_why_delay_sc)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 070lb_343_found_cleanup
    (cinematic_scripting_clean_up 1)
)

(script static void !070ld01_dread_rising_sh1
    (sound_class_set_gain "amb" 0.0 60)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 0 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_1" true)
    (object_hide (cinematic_object_get_unit "cin_johnson") true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_1" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_1" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (object_hide "sentinel_swarm" true)
    (object_hide (cinematic_object_get_scenery "cin_turret") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_1" true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.15 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 1.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 2 0 0 0)
    (sleep 29)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.25 10.0)
    (sleep 40)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.75 10.0)
    (sleep 20)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.15 10.0)
    (sleep 23)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 1 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_2" true)
    (object_hide (cinematic_object_get_unit "cin_johnson") true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_2" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican1") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (object_hide (cinematic_object_get_scenery "cin_turret") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 15 (cinematic_object_get_unit "cin_arbiter") "070ld01_obj_arbiter_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 3.9 0.0)
    (begin
        (render_autoexposure_instant 3)
        (object_create_anew "sentinel_swarm")
    )
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_scripting_start_music 2 0 1 0)
    (cinematic_scripting_start_effect 2 0 1 0 "sentinel_swarm")
    (sleep 27)
    (cinematic_scripting_start_dialogue 2 0 1 0 none)
    (sleep 15)
    (texture_camera_off)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh3
    (sound_looping_stop "levels\solo\070_waste\music\070_music_15")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 2 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 2)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_johnson") "070ld01_cin_johnson_3" true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_3" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_3" true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 15 (cinematic_object_get_unit "cin_arbiter") "070ld01_obj_arbiter_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.06 0.0)
    (cinematic_scripting_start_effect 2 0 2 0 "sentinel_swarm")
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.15 0.0)
    (cinematic_print "custom script play")
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.15 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_back" 0.25 0.0)
    (render_autoexposure_instant 3)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_down" 0.25 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican1") "thrusters_down" 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican1") "thrusters_back" 0.15 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.5 10.0)
    (sleep 12)
    (cinematic_scripting_start_dialogue 2 0 2 0 none)
    (sleep 8)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.5 10.0)
    (sleep 10)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican1") "thrusters_down" 0.15 15.0)
    (sleep 30)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.25 10.0)
    (sleep 1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 3 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 3)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_johnson") "070ld01_cin_johnson_4" true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 4 (cinematic_object_get_scenery "cin_cigar") "cigar_4" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_4" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_4" true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 15 (cinematic_object_get_unit "cin_arbiter") "070ld01_obj_arbiter_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 0.03 0.0)
    (render_autoexposure_instant 3)
    (cinematic_print "custom script play")
    (cinematic_print "custom script play")
    (unit_set_emotion_by_name (cinematic_object_get_unit "cin_johnson") "happy" 1.0 0.01)
    (sleep 38)
    (cinematic_scripting_start_dialogue 2 0 3 0 (cinematic_object_get_unit "cin_johnson"))
    (sleep 22)
    (cinematic_scripting_start_dialogue 2 0 3 1 none)
    (sleep 18)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 4 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 4)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_johnson") "070ld01_cin_johnson_5" true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_5" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 11 (cinematic_object_get_scenery "cin_hero_sentinel01") "070ld01_cin_hero_sentinel01_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_hero_sentinel02") "070ld01_cin_hero_sentinel02_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 13 (cinematic_object_get_scenery "cin_hero_sentinel03") "070ld01_cin_hero_sentinel03_5" true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 0.01 0.0)
    (render_autoexposure_instant 3)
    (cinematic_print "custom script play")
    (sleep 32)
    (cinematic_scripting_start_dialogue 2 0 4 0 none)
    (sleep 119)
    (cinematic_scripting_start_dialogue 2 0 4 1 (cinematic_object_get_unit "cin_johnson"))
    (sleep 25)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 5 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 5)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_johnson") "070ld01_cin_johnson_6" true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 4 (cinematic_object_get_scenery "cin_cigar") "cigar_6" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_6" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_6" true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 3.95 0.0)
    (cinematic_scripting_start_effect 2 0 5 0 "sentinel_swarm")
    (cinematic_print "custom script play")
    (unit_set_emotion_by_name (cinematic_object_get_unit "cin_johnson") "happy" 1.0 0.01)
    (cinematic_scripting_start_effect 2 0 5 1 (cinematic_object_get "cin_cigar"))
    (render_autoexposure_instant 3)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_scripting_start_dialogue 2 0 5 0 (cinematic_object_get_unit "cin_johnson"))
    (sleep 54)
    (cinematic_scripting_start_dialogue 2 0 5 1 none)
    (sleep 51)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 6 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 6)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_7" true)
    (object_hide (cinematic_object_get_unit "cin_johnson") true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_7" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 11 (cinematic_object_get_scenery "cin_hero_sentinel01") "070ld01_cin_hero_sentinel01_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_hero_sentinel02") "070ld01_cin_hero_sentinel02_7" true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_7" true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 0.03 0.0)
    (render_autoexposure_instant 3)
    (cinematic_print "custom script play")
    (sleep 100)
    (cinematic_scripting_start_dialogue 2 0 6 0 none)
    (sleep 6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 7 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 7)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_johnson") "070ld01_cin_johnson_8" true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 4 (cinematic_object_get_scenery "cin_cigar") "cigar_8" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_8" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (object_hide (cinematic_object_get_scenery "cin_pelican3") true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 11 (cinematic_object_get_scenery "cin_hero_sentinel01") "070ld01_cin_hero_sentinel01_8" true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_8" true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (render_exposure 0.02 0.0)
    (sleep 125)
    (cinematic_scripting_start_dialogue 2 0 7 0 none)
    (sleep 14)
    (texture_camera_off)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 8 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 8)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_johnson") "070ld01_cin_johnson_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_unit "cin_marine") "070ld01_cin_marine_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 3 (cinematic_object_get_unit "cin_miranda") "070ld01_cin_miranda_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 4 (cinematic_object_get_scenery "cin_cigar") "cigar_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_9" true)
    (object_hide (cinematic_object_get_scenery "cin_pelican2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 8 (cinematic_object_get_scenery "cin_pelican3") "070ld01_pelican3_9" true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_9" true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (render_exposure 3.8 0.0)
    (cinematic_scripting_start_effect 2 0 8 0 "sentinel_swarm")
    (cinematic_scripting_start_effect 2 0 8 1 (cinematic_object_get "cin_cigar"))
    (render_autoexposure_instant 3)
    (cinematic_print "custom script play")
    (sleep 45)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cigar") "cigar_glow" 1.0 0.0)
    (sleep 55)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cigar") "cigar_glow" 0.0 0.0)
    (sleep 15)
    (cinematic_scripting_start_effect 2 0 8 2 (cinematic_object_get "cin_johnson"))
    (sleep 1)
    (cinematic_scripting_start_dialogue 2 0 8 0 (cinematic_object_get_unit "cin_miranda"))
    (sleep 23)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh10
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 9 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 9)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_10" true)
    (object_hide (cinematic_object_get_unit "cin_johnson") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_unit "cin_marine") "070ld01_cin_marine_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 3 (cinematic_object_get_unit "cin_miranda") "070ld01_cin_miranda_10" true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 8 (cinematic_object_get_scenery "cin_pelican3") "070ld01_pelican3_10" true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (object_hide (cinematic_object_get_scenery "cin_turret") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 15 (cinematic_object_get_unit "cin_arbiter") "070ld01_obj_arbiter_10" true)
    (cinematic_lights_initialize_for_shot 9)
    (cinematic_clips_initialize_for_shot 9)
    (render_exposure 0.06 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.15 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican1") "thrusters_down" 0.25 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.5 0.0)
    (cinematic_print "custom script play")
    (render_autoexposure_instant 3)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican1") "thrusters_back" 0.15 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.15 15.0)
    (sleep 10)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.5 10.0)
    (sleep 48)
    (cinematic_scripting_start_dialogue 2 0 9 0 (cinematic_object_get_unit "cin_miranda"))
    (sleep 37)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.15 15.0)
    (sleep 49)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh11
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 10 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 10)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_chief") "070ld01_cin_chief_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_johnson") "070ld01_cin_johnson_11" true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 3 (cinematic_object_get_unit "cin_miranda") "070ld01_cin_miranda_11" true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 8 (cinematic_object_get_scenery "cin_pelican3") "070ld01_pelican3_11" true)
    (cinematic_scripting_create_and_animate_object_no_animation 2 0 9 "sentinel_swarm" "sentinel_swarm" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_scenery "cin_turret") "turret_11" true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle") "070ld01_cin_assault_rifle_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 15 (cinematic_object_get_unit "cin_arbiter") "070ld01_obj_arbiter_11" true)
    (cinematic_lights_initialize_for_shot 10)
    (cinematic_clips_initialize_for_shot 10)
    (render_exposure 4.5 0.0)
    (render_autoexposure_instant 3)
    (cinematic_print "custom script play")
    (sleep 30)
    (cinematic_scripting_start_dialogue 2 0 10 0 none)
    (sleep 77)
    (texture_camera_off)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising_sh12
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 11 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 11)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (object_hide (cinematic_object_get_unit "cin_johnson") true)
    (object_hide (cinematic_object_get_unit "cin_marine") true)
    (object_hide (cinematic_object_get_unit "cin_miranda") true)
    (object_hide (cinematic_object_get_scenery "cin_cigar") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 (cinematic_object_get_scenery "cin_pelican") "070ld01_pelican_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1") "070ld01_pelican1_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2") "070ld01_pelican2_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 8 (cinematic_object_get_scenery "cin_pelican3") "070ld01_pelican3_12" true)
    (object_hide "sentinel_swarm" true)
    (object_hide (cinematic_object_get_scenery "cin_turret") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel01") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel02") true)
    (object_hide (cinematic_object_get_scenery "cin_hero_sentinel03") true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 15 (cinematic_object_get_unit "cin_arbiter") "070ld01_obj_arbiter_12" true)
    (cinematic_lights_initialize_for_shot 11)
    (cinematic_clips_initialize_for_shot 11)
    (render_exposure 0.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican1") "thrusters_back" 0.25 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican3") "thrusters_back" 0.25 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_back" 0.25 0.0)
    (cinematic_print "custom script play")
    (render_autoexposure_instant 3)
    (sleep 20)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican1") "thrusters_back" 1.0 15.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican2") "thrusters_back" 1.0 15.0)
    (sleep 10)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican3") "thrusters_back" 1.0 15.0)
    (sleep 156)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 15)
    (sleep 15)
    (object_destroy "sentinel_swarm")
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070ld01_dread_rising
    (object_create "waterfall")
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (!070ld01_dread_rising_sh1)
    (!070ld01_dread_rising_sh2)
    (!070ld01_dread_rising_sh3)
    (!070ld01_dread_rising_sh4)
    (!070ld01_dread_rising_sh5)
    (!070ld01_dread_rising_sh6)
    (!070ld01_dread_rising_sh7)
    (!070ld01_dread_rising_sh8)
    (!070ld01_dread_rising_sh9)
    (!070ld01_dread_rising_sh10)
    (!070ld01_dread_rising_sh11)
    (!070ld01_dread_rising_sh12)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 0 0 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 2 0 1 (cinematic_object_get_unit "cin_johnson"))
    (cinematic_scripting_destroy_object 2 0 2 (cinematic_object_get_unit "cin_marine"))
    (cinematic_scripting_destroy_object 2 0 3 (cinematic_object_get_unit "cin_miranda"))
    (cinematic_scripting_destroy_object 2 0 4 (cinematic_object_get_scenery "cin_cigar"))
    (cinematic_scripting_destroy_object 2 0 5 (cinematic_object_get_scenery "cin_pelican"))
    (cinematic_scripting_destroy_object 2 0 6 (cinematic_object_get_scenery "cin_pelican1"))
    (cinematic_scripting_destroy_object 2 0 7 (cinematic_object_get_scenery "cin_pelican2"))
    (cinematic_scripting_destroy_object 2 0 8 (cinematic_object_get_scenery "cin_pelican3"))
    (cinematic_scripting_destroy_object 2 0 9 "sentinel_swarm")
    (cinematic_scripting_destroy_object 2 0 10 (cinematic_object_get_scenery "cin_turret"))
    (cinematic_scripting_destroy_object 2 0 11 (cinematic_object_get_scenery "cin_hero_sentinel01"))
    (cinematic_scripting_destroy_object 2 0 12 (cinematic_object_get_scenery "cin_hero_sentinel02"))
    (cinematic_scripting_destroy_object 2 0 13 (cinematic_object_get_scenery "cin_hero_sentinel03"))
    (cinematic_scripting_destroy_object 2 0 14 (cinematic_object_get_scenery "cin_assault_rifle"))
    (cinematic_scripting_destroy_object 2 0 15 (cinematic_object_get_unit "cin_arbiter"))
    (sleep 120)
)

(script static void 070ld_pelican_pickup_debug
    (cinematic_zone_activate_for_debugging 2)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
    (fade_in 0.0 0.0 0.0 15)
    (cinematic_outro_start)
    (!070ld01_dread_rising)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 2)
)

(script static void 070ld_pelican_pickup
    (cinematic_zone_activate 2)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
    (fade_in 0.0 0.0 0.0 15)
    (cinematic_outro_start)
    (!070ld01_dread_rising)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 070ld_pelican_pickup_cleanup
    (cinematic_scripting_clean_up 2)
)

(script static void !070lc01_the_ark_sh1
    (object_create_anew "waterfall")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 0 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_lc_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 (cinematic_object_get_unit "cin_lc_chief") "070la01_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 (cinematic_object_get_unit "cin_spark") "070lc01_cin_spark_1" true)
    (object_hide (cinematic_object_get_scenery "cin_waypoint_holo") true)
    (object_hide (cinematic_object_get_scenery "cin_main_halogram") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle") "070lc01_cin_assault_rifle_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine") "070lc01_cin_carbine1_1" true)
    (object_hide (cinematic_object_get_scenery "cin_godrays") true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -1.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 3 0 0 1)
    (sleep 2)
    (cinematic_scripting_start_music 3 0 0 0)
    (sleep 52)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc01_the_ark_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 1 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_lc_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 (cinematic_object_get_unit "cin_lc_chief") "070la01_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 (cinematic_object_get_unit "cin_spark") "070lc01_cin_spark_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 4 (cinematic_object_get_scenery "cin_main_halogram") "070lc01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle") "070lc01_cin_assault_rifle_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine") "070lc01_cin_carbine1_2" true)
    (object_hide (cinematic_object_get_scenery "cin_godrays") true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -0.5 0.0)
    (sleep 83)
    (cinematic_scripting_start_dialogue 3 0 1 0 (cinematic_object_get_unit "cin_lc_chief"))
    (sleep 135)
    (cinematic_scripting_start_dialogue 3 0 1 1 (cinematic_object_get_unit "cin_spark"))
    (sleep 128)
    (cinematic_scripting_start_dialogue 3 0 1 2 (cinematic_object_get_unit "cin_lc_chief"))
    (sleep 38)
    (cinematic_scripting_start_dialogue 3 0 1 3 (cinematic_object_get_unit "cin_spark"))
    (sleep 11)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc01_the_ark_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 2 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 2)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_lc_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 (cinematic_object_get_unit "cin_lc_chief") "070la01_cin_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 (cinematic_object_get_unit "cin_spark") "070lc01_cin_spark_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc01_3" true)
    (object_hide (cinematic_object_get_scenery "cin_main_halogram") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle") "070lc01_cin_assault_rifle_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine") "070lc01_cin_carbine1_3" true)
    (object_hide (cinematic_object_get_scenery "cin_godrays") true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -1.0 0.0)
    (sleep 15)
    (cinematic_scripting_start_dialogue 3 0 2 0 (cinematic_object_get_unit "cin_lc_chief"))
    (sleep 39)
    (cinematic_scripting_start_dialogue 3 0 2 1 (cinematic_object_get_unit "cin_spark"))
    (sleep 2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc01_the_ark_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 3 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 3)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la01_cin_arbiter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 (cinematic_object_get_unit "cin_lc_chief") "070la01_cin_chief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 (cinematic_object_get_unit "cin_spark") "070lc01_cin_spark_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc01_4" true)
    (object_hide (cinematic_object_get_scenery "cin_main_halogram") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle") "070lc01_cin_assault_rifle_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine") "070lc01_cin_carbine1_4" true)
    (object_hide (cinematic_object_get_scenery "cin_godrays") true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 0.0 0.0)
    (sleep 162)
    (cinematic_scripting_start_dialogue 3 0 3 0 (cinematic_object_get_unit "cin_lc_chief"))
    (sleep 24)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc01_the_ark_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 4 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 4)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_lc_arbiter") true)
    (object_hide (cinematic_object_get_unit "cin_lc_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 (cinematic_object_get_unit "cin_spark") "070lc01_cin_spark_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc01_5" true)
    (object_hide (cinematic_object_get_scenery "cin_main_halogram") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle") "070lc01_cin_assault_rifle_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine") "070lc01_cin_carbine1_5" true)
    (object_hide (cinematic_object_get_scenery "cin_godrays") true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure -1.0 0.0)
    (sleep 10)
    (cinematic_scripting_start_dialogue 3 0 4 0 (cinematic_object_get_unit "cin_spark"))
    (sleep 152)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc01_the_ark_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 5 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 5)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la01_cin_arbiter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 (cinematic_object_get_unit "cin_lc_chief") "070la01_cin_chief_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 (cinematic_object_get_unit "cin_spark") "070lc01_cin_spark_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc01_6" true)
    (object_hide (cinematic_object_get_scenery "cin_main_halogram") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle") "070lc01_cin_assault_rifle_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine") "070lc01_cin_carbine1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 7 (cinematic_object_get_scenery "cin_godrays") "070lc_godray_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 0.3 0.0)
    (sleep 141)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc01_the_ark_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 6 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 6)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (object_hide (cinematic_object_get_unit "cin_lc_arbiter") true)
    (object_hide (cinematic_object_get_unit "cin_lc_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 (cinematic_object_get_unit "cin_spark") "070lc01_cin_spark_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc01_7" true)
    (object_hide (cinematic_object_get_scenery "cin_main_halogram") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle") "070lc01_cin_assault_rifle_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine") "070lc01_cin_carbine1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 7 (cinematic_object_get_scenery "cin_godrays") "070lc_godray_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 0.5 0.0)
    (sleep 155)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc01_the_ark
    (begin
        (sound_class_set_gain "" 0.0 15)
        (sound_class_set_gain "music" 1.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
    )
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (!070lc01_the_ark_sh1)
    (!070lc01_the_ark_sh2)
    (!070lc01_the_ark_sh3)
    (!070lc01_the_ark_sh4)
    (!070lc01_the_ark_sh5)
    (!070lc01_the_ark_sh6)
    (!070lc01_the_ark_sh7)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 0 0 (cinematic_object_get_unit "cin_lc_arbiter"))
    (cinematic_scripting_destroy_object 3 0 1 (cinematic_object_get_unit "cin_lc_chief"))
    (cinematic_scripting_destroy_object 3 0 2 (cinematic_object_get_unit "cin_spark"))
    (cinematic_scripting_destroy_object 3 0 3 (cinematic_object_get_scenery "cin_waypoint_holo"))
    (cinematic_scripting_destroy_object 3 0 4 (cinematic_object_get_scenery "cin_main_halogram"))
    (cinematic_scripting_destroy_object 3 0 5 (cinematic_object_get_scenery "cin_assault_rifle"))
    (cinematic_scripting_destroy_object 3 0 6 (cinematic_object_get_scenery "cin_new_carbine"))
    (cinematic_scripting_destroy_object 3 0 7 (cinematic_object_get_scenery "cin_godrays"))
)

(script static void !070lc02_the_barrier_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 0 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 (cinematic_object_get_unit "cin_lc_chief") "070la02_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_1" true)
    (object_hide (cinematic_object_get_scenery "cin_phantom") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_1" true)
    (object_hide (cinematic_object_get_scenery "cin_banshee1") true)
    (object_hide (cinematic_object_get_scenery "cin_banshee2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 3 1 0 0 (cinematic_object_get_unit "cin_lc_chief"))
    (sleep 69)
    (cinematic_scripting_start_dialogue 3 1 0 1 (cinematic_object_get_unit "cin_spark"))
    (sleep 23)
    (cinematic_scripting_start_dialogue 3 1 0 2 (cinematic_object_get_unit "cin_lc_chief"))
    (sleep 16)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 1 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 1)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 (cinematic_object_get_unit "cin_lc_chief") "070la02_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_2" true)
    (object_hide (cinematic_object_get_scenery "cin_phantom") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_2" true)
    (object_hide (cinematic_object_get_scenery "cin_banshee1") true)
    (object_hide (cinematic_object_get_scenery "cin_banshee2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 0.0 0.0)
    (sleep 13)
    (cinematic_scripting_start_dialogue 3 1 1 0 (cinematic_object_get_unit "cin_spark"))
    (sleep 106)
    (cinematic_scripting_start_dialogue 3 1 1 1 (cinematic_object_get_unit "cin_spark"))
    (sleep 111)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 2 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 2)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_3" true)
    (object_hide (cinematic_object_get_unit "cin_lc_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_3" true)
    (object_hide (cinematic_object_get_scenery "cin_phantom") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 5 (cinematic_object_get_scenery "cin_banshee1") "070lc02_cin_banshee1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 6 (cinematic_object_get_scenery "cin_banshee2") "070lc02_cin_banshee2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.1 0.0)
    (sleep 97)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 3 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 3)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_4" true)
    (object_hide (cinematic_object_get_unit "cin_lc_chief") true)
    (object_hide (cinematic_object_get_unit "cin_spark") true)
    (object_hide (cinematic_object_get_scenery "cin_phantom") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 5 (cinematic_object_get_scenery "cin_banshee1") "070lc02_cin_banshee1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 6 (cinematic_object_get_scenery "cin_banshee2") "070lc02_cin_banshee2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 0.2 0.0)
    (sleep 70)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 4 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 4)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 (cinematic_object_get_unit "cin_lc_chief") "070la02_cin_chief_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_5" true)
    (object_hide (cinematic_object_get_scenery "cin_phantom") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 5 (cinematic_object_get_scenery "cin_banshee1") "070lc02_cin_banshee1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 6 (cinematic_object_get_scenery "cin_banshee2") "070lc02_cin_banshee2_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 0.4 0.0)
    (sleep 36)
    (cinematic_scripting_start_dialogue 3 1 4 0 (cinematic_object_get_unit "cin_spark"))
    (sleep 143)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 5 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 5)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_6" true)
    (object_hide (cinematic_object_get_unit "cin_lc_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_6" true)
    (object_hide (cinematic_object_get_scenery "cin_phantom") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_6" true)
    (object_hide (cinematic_object_get_scenery "cin_banshee1") true)
    (object_hide (cinematic_object_get_scenery "cin_banshee2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 0.5 0.0)
    (sleep 125)
    (cinematic_scripting_start_dialogue 3 1 5 0 (cinematic_object_get_unit "cin_spark"))
    (sleep 17)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 6 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 6)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 (cinematic_object_get_unit "cin_lc_chief") "070la02_cin_chief_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 3 (cinematic_object_get_scenery "cin_phantom") "070lc02_phantom_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_7" true)
    (object_hide (cinematic_object_get_scenery "cin_banshee1") true)
    (object_hide (cinematic_object_get_scenery "cin_banshee2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 0.6 0.0)
    (sleep 20)
    (cinematic_scripting_start_dialogue 3 1 6 0 (cinematic_object_get_unit "cin_lc_chief"))
    (sleep 19)
    (cinematic_scripting_start_dialogue 3 1 6 1 (cinematic_object_get_unit "cin_lc_arbiter"))
    (sleep 56)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 7 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 7)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_8" true)
    (object_hide (cinematic_object_get_unit "cin_lc_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 3 (cinematic_object_get_scenery "cin_phantom") "070lc02_phantom_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_8" true)
    (object_hide (cinematic_object_get_scenery "cin_banshee1") true)
    (object_hide (cinematic_object_get_scenery "cin_banshee2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (render_exposure 0.5 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 3 1 7 0)
    (sleep 39)
    (cinematic_scripting_start_effect 3 1 7 0 (cinematic_object_get "cin_new_carbine"))
    (sleep 8)
    (cinematic_scripting_start_dialogue 3 1 7 0 none)
    (sleep 2)
    (cinematic_scripting_start_effect 3 1 7 1 (cinematic_object_get "cin_new_carbine"))
    (sleep 73)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 8 "cin_070lc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 8)
    (cinematic_object_create_cinematic_anchor "cin_070lc_anchor" "cin_070lc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter") "070la02_cin_arbiter_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 (cinematic_object_get_unit "cin_lc_chief") "070la02_cin_chief_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 (cinematic_object_get_unit "cin_spark") "070lc02_cin_spark_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 3 (cinematic_object_get_scenery "cin_phantom") "070lc02_phantom_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo") "070lc02_waypoint_9" true)
    (object_hide (cinematic_object_get_scenery "cin_banshee1") true)
    (object_hide (cinematic_object_get_scenery "cin_banshee2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine") "070lc02_cin_carbine1_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1") "070lc02_cin_assault_rifle_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 (cinematic_object_get_unit "cin_grunt") "070lc02_cin_grunt_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon") "070lc02_cin_plasma_cannon_9" true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (render_exposure 1.0 0.0)
    (sleep 23)
    (cinematic_scripting_start_dialogue 3 1 8 0 (cinematic_object_get_unit "cin_spark"))
    (sleep 2)
    (cinematic_scripting_start_effect 3 1 8 0 (cinematic_object_get "cin_new_carbine"))
    (sleep 5)
    (object_set_function_variable (cinematic_object_get_scenery "cin_plasma_cannon") "firing" 1.0 0.0)
    (sleep 5)
    (cinematic_scripting_start_effect 3 1 8 1 (cinematic_object_get "cin_new_carbine"))
    (sleep 10)
    (cinematic_scripting_start_effect 3 1 8 2 (cinematic_object_get "cin_new_carbine"))
    (sleep 47)
    (cinematic_scripting_start_effect 3 1 8 3 (cinematic_object_get "cin_new_carbine"))
    (sleep 10)
    (cinematic_scripting_start_effect 3 1 8 4 (cinematic_object_get "cin_new_carbine"))
    (sleep 10)
    (cinematic_scripting_start_effect 3 1 8 5 (cinematic_object_get "cin_new_carbine"))
    (sleep 20)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !070lc02_the_barrier
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 0)
    (!070lc02_the_barrier_sh1)
    (!070lc02_the_barrier_sh2)
    (!070lc02_the_barrier_sh3)
    (!070lc02_the_barrier_sh4)
    (!070lc02_the_barrier_sh5)
    (!070lc02_the_barrier_sh6)
    (!070lc02_the_barrier_sh7)
    (!070lc02_the_barrier_sh8)
    (!070lc02_the_barrier_sh9)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 1 0 (cinematic_object_get_unit "cin_lc_arbiter"))
    (cinematic_scripting_destroy_object 3 1 1 (cinematic_object_get_unit "cin_lc_chief"))
    (cinematic_scripting_destroy_object 3 1 2 (cinematic_object_get_unit "cin_spark"))
    (cinematic_scripting_destroy_object 3 1 3 (cinematic_object_get_scenery "cin_phantom"))
    (cinematic_scripting_destroy_object 3 1 4 (cinematic_object_get_scenery "cin_waypoint_holo"))
    (cinematic_scripting_destroy_object 3 1 5 (cinematic_object_get_scenery "cin_banshee1"))
    (cinematic_scripting_destroy_object 3 1 6 (cinematic_object_get_scenery "cin_banshee2"))
    (cinematic_scripting_destroy_object 3 1 7 (cinematic_object_get_scenery "cin_new_carbine"))
    (cinematic_scripting_destroy_object 3 1 8 (cinematic_object_get_scenery "cin_rifle1"))
    (cinematic_scripting_destroy_object 3 1 9 (cinematic_object_get_unit "cin_grunt"))
    (cinematic_scripting_destroy_object 3 1 10 (cinematic_object_get_scenery "cin_plasma_cannon"))
)

(script static void 070lc_waypoint_reveal_debug
    (cinematic_zone_activate_for_debugging 3)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 3))
    (fade_in 0.0 0.0 0.0 15)
    (!070lc01_the_ark)
    (!070lc02_the_barrier)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 3)
)

(script static void 070lc_waypoint_reveal
    (cinematic_zone_activate 3)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 3))
    (fade_in 0.0 0.0 0.0 15)
    (!070lc01_the_ark)
    (!070lc02_the_barrier)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 070lc_waypoint_reveal_cleanup
    (cinematic_scripting_clean_up 3)
)

