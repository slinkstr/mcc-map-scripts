; Decompiled with Blamite
; Source file: 06b_floodzone.hsc
; Start time: 4/7/2022 7:17:21
; Decompilation finished in ~0.0057165s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean debug true)
(global boolean dialogue true)
(global boolean g_play_cinematics true)
(global boolean g_fact_ent_sen_spawn false)
(global short g_fact_ent_sen_count 0)
(global short g_fact_ent_sen_index 10)
(global short g_fact_ent_enf_count 0)
(global short g_fact_ent_enf_index 3)
(global boolean g_music_06b_01 true)
(global boolean g_music_06b_02 false)
(global boolean g_music_06b_03 false)
(global boolean g_music_06b_04 false)
(global boolean g_music_06b_05 false)
(global boolean g_music_06b_06 false)
(global boolean g_music_06b_07 false)
(global short dialogue_pause 7)
(global boolean g_qz_cov_def_progress false)
(global short g_order_delay 150)
(global boolean g_veh_int_migrate_a false)
(global boolean g_veh_int_migrate_b false)
(global boolean g_veh_int_migrate_c false)
(global boolean g_veh_int_migrate_d false)
(global boolean g_veh_int_migrate_e false)
(global boolean g_ext_a_dam_migrate_a false)
(global boolean g_ext_a_dam_migrate_b false)
(global boolean g_ext_a_migrate_a false)
(global boolean g_ext_a_migrate_b false)
(global boolean g_ext_a_migrate_c false)
(global boolean g_ext_a_migrate_d false)
(global boolean g_ext_a_migrate_e false)
(global boolean g_ext_a_migrate_f false)
(global boolean g_ext_a_fact_ent_migrate false)
(global boolean g_ext_b_migrate_1 false)
(global boolean g_ext_b_migrate_2 false)
(global boolean g_ext_b_migrate_3 false)
(global boolean g_ext_b_migrate_4 false)
(global boolean g_ext_b_migrate_5 false)
(global boolean g_veh_int_ghost_spawn false)
(global short g_veh_int_ghost_limit 0)
(global short g_veh_int_ghost_number 0)
(global vehicle v_ext_a_phantom none)
(global boolean g_qz_ext_a_wraith_shoot false)
(global boolean g_ext_a_dam_enf false)
(global boolean g_qz_ext_a_flood_ghosts false)
(global boolean g_qz_ext_a_d_spawn true)
(global boolean g_gorge_sen_spawn false)
(global boolean g_ext_b_phantom false)
(global vehicle v_ext_b_phantom none)
(global boolean g_ext_b_ent_phantom false)
(global boolean g_ext_b_enforcer false)
(global boolean g_ext_b_bk_ghost_spawn false)
(global short g_ext_b_bk_ghost_limit 0)
(global short g_ext_b_bk_ghost_number 0)
(global boolean g_key_started false)
(global boolean g_key_lock0_entered false)
(global boolean g_key_lock0_first_loadpoint false)
(global boolean g_key_lock0_second_loadpoint false)
(global boolean g_key_lock0_begin_human false)
(global boolean g_key_lock0_door1 false)
(global boolean g_key_cruise_entered false)
(global boolean g_key_cruise_first_loadpoint false)
(global boolean g_key_cruise_halfway false)
(global boolean g_key_shaft_entered false)
(global boolean g_key_shaft_rising false)
(global boolean g_key_shaft_near_exterior false)
(global boolean g_key_lock1_entered false)
(global boolean g_key_lock1_first_arch false)
(global boolean g_key_lock1_second_arch false)
(global boolean g_key_library_entered false)
(global boolean g_key_library_arrival false)
(global boolean g_e26_started false)
(global boolean g_e26_ended false)
(global boolean g_e25_started false)
(global boolean g_e24_started false)
(global boolean g_e23_started false)
(global boolean g_e22_started false)
(global boolean g_e21_started false)


; SCRIPTS

(script static unit player0
    (begin
        (unit (list_get (players) 0))
    )
)

(script static unit player1
    (begin
        (unit (list_get (players) 1))
    )
)

(script static short player_count
    (begin
        (list_count (players))
    )
)

(script static void end_segment
    (begin
        (camera_control true)
        (cinematic_skip_start_internal)
        (cinematic_stop 0.0 0.0 0.0 15)
        (sleep 30)
        (print "end gameplay segment!  thank you for playing!")
        (sleep 15)
        (print "grab jaime or paul to give feedback!")
        (player_action_test_primary_trigger)
        (sleep 15)
        (print "press the “a” button to reset!")
        (sleep_until (player_action_test_look_relative_up))
        (print "reloading map...")
        (sleep 15)
        (switch_bsp_by_name)
    )
)

(script static boolean difficulty_legendary
    (begin
        (= (pvs_set_object) legendary)
    )
)

(script static boolean difficulty_heroic
    (begin
        (= (pvs_set_object) heroic)
    )
)

(script static boolean difficulty_normal
    (begin
        (= (pvs_set_object) normal)
    )
)

(script static boolean cinematic_skip_start
    (begin
        (cinematic_show_letterbox)
        (cinematic_enable_ambience_details)
        (sleep_until (not (sound_set_tag_parameter_unsafe)) 1)
        (not (sound_impulse_predict))
    )
)

(script static void cinematic_skip_stop
    (begin
        (cinematic_show_letterbox_immediate)
        (if (not (sound_impulse_predict)) 
            (game_is_playtest))
    )
)

(script static void cinematic_fade_to_white
    (begin
        (player_flashlight_on false)
        (player_action_test_jump false)
        (show_hud_help_text 0.0 0.5)
        (cinematic_skip_start_internal)
        (cinematic_stop 1.0 1.0 1.0 30)
        (sleep 30)
        (camera_control true)
    )
)

(script static void cinematic_fade_from_white
    (begin
        (show_hud_help_text 1.0 0.5)
        (cinematic_skip_stop_internal)
        (camera_control false)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep 15)
        (player_flashlight_on true)
        (player_action_test_jump true)
    )
)

(script static void cinematic_fade_from_white_bars
    (begin
        (cinematic_skip_stop_internal)
        (cinematic_set_title_delayed true)
        (camera_control false)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep 15)
        (player_flashlight_on true)
        (player_action_test_jump true)
    )
)

(script static void cinematic_fade_from_black_bars
    (begin
        (cinematic_skip_stop_internal)
        (cinematic_set_title_delayed true)
        (camera_control false)
        (cinematic_start 0.0 0.0 0.0 15)
        (sleep 15)
        (player_flashlight_on true)
        (player_action_test_jump true)
    )
)

(script static void cinematic_fade_to_black
    (begin
        (player_flashlight_on false)
        (player_action_test_jump false)
        (show_hud_help_text 0.0 0.5)
        (cinematic_skip_start_internal)
        (cinematic_stop 0.0 0.0 0.0 30)
        (sleep 30)
        (camera_control true)
    )
)

(script static void cinematic_fade_from_black
    (begin
        (show_hud_help_text 1.0 0.5)
        (cinematic_skip_stop_internal)
        (camera_control false)
        (cinematic_start 0.0 0.0 0.0 15)
        (sleep 15)
        (player_flashlight_on true)
        (player_action_test_jump true)
    )
)

(script static void cinematic_snap_to_black
    (begin
        (player_flashlight_on false)
        (player_action_test_jump false)
        (cinematic_stop 0.0 0.0 0.0 0)
        (show_hud_help_text 0.0 0.0)
        (cinematic_skip_start_internal)
        (cinematic_set_title_delayed true)
        (camera_control true)
    )
)

(script static void cinematic_snap_to_white
    (begin
        (player_flashlight_on false)
        (player_action_test_jump false)
        (cinematic_stop 1.0 1.0 1.0 0)
        (show_hud_help_text 0.0 0.0)
        (cinematic_skip_start_internal)
        (cinematic_set_title_delayed true)
        (camera_control true)
    )
)

(script static void cinematic_stash_players
    (begin
        (object_hide (player0) true)
        (object_hide (player1) true)
        (object_cannot_take_damage (players))
    )
)

(script static void cinematic_unstash_players
    (begin
        (object_hide (player0) false)
        (object_hide (player1) false)
        (object_can_take_damage (players))
    )
)

(script dormant void _stealth_toggle_monitor
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (if 
                        (and
                            (>= (unit_get_shield (player0)) 1.0)
                            (player_action_test_rotate_weapons)
                        ) 
                            (= 1.0 1.0) (begin
                                (player_action_test_primary_trigger)
                                (= 1.0 0.0)
                            )
                    ) 
                1)
                (cheat_active_camouflage_by_player 0 true)
                (print "stealth engaged")
                (unit_set_maximum_vitality (player0) 50.0 0.0)
                (unit_set_current_vitality (player0) 50.0 0.0)
                (object_set_shield (player0) 0.0)
                (sleep 30)
                (player_action_test_primary_trigger)
                (sleep_until 
                    (or
                        (< (object_get_health (player0)) 1.0)
                        (player_action_test_rotate_weapons)
                    ) 
                1)
                (cheat_active_camouflage_by_player 0 false)
                (print "stealth disengaged")
                (unit_set_maximum_vitality (player0) 30.0 70.0)
                (object_set_shield (player0) 0.0)
                (sleep 30)
                (player_action_test_primary_trigger)
                false
            ) 
        1)
    )
)

(script dormant void _stealth_timer_monitor
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (if (player_action_test_rotate_weapons) 
                        (= 1.0 1.0) (begin
                            (player_action_test_primary_trigger)
                            (= 1.0 0.0)
                        )
                    ) 
                1)
                (cheat_active_camouflage_by_player 0 true)
                (print "stealth engaged")
                (sleep 15)
                (player_action_test_primary_trigger)
                (sleep_until 
                    (or
                        (player_action_test_rotate_weapons)
                        (player_action_test_vision_trigger)
                        (player_action_test_zoom)
                        (player_action_test_accept)
                    ) 
                1 (* 9.0 30.0))
                (cheat_active_camouflage_by_player 0 false)
                (print "stealth disengaged")
                (sleep 30)
                (player_action_test_primary_trigger)
                (sleep_until 
                    (begin
                        (print "+")
                        false
                    ) 
                30 (* 5.0 30.0))
                false
            ) 
        1)
    )
)

(script static void activate_stealth_toggle_monitor
    (begin
        (sleep 1)
    )
)

(script static void activate_stealth_timer_monitor
    (begin
        (sleep 1)
    )
)

(script static void playtest_mission
    (begin
        (if (game_save_and_quit) 
            (begin
                (sleep 30)
                (player_training_activate_flashlight "playtest_raisehand")
                (hud_enable_training true)
                (player_action_test_primary_trigger)
                (sleep_until (player_action_test_look_relative_up) 1)
                (hud_enable_training false)
                (sleep 30)
            )
        )
    )
)

(script static void 06_intra1_01_predict_stub
    (begin
        (wake 06_intra1_01_predict)
    )
)

(script static void 06_intra2_01_predict_stub
    (begin
        (wake 06_intra2_01_predict)
    )
)

(script static void 06_intra2_02_predict_stub
    (begin
        (wake 06_intra2_02_predict)
    )
)

(script static void 06_intra2_03_predict_stub
    (begin
        (wake 06_intra2_03_predict)
    )
)

(script static void x07_01_predict_stub
    (begin
        (wake x07_01_predict)
    )
)

(script static void x07_02_predict_stub
    (begin
        (wake x07_02_predict)
    )
)

(script static void x07_03_predict_stub
    (begin
        (wake x07_03_predict)
    )
)

(script static void x07_04_predict_stub
    (begin
        (wake x07_04_predict)
    )
)

(script static void x07_05_predict_stub
    (begin
        (wake x07_05_predict)
    )
)

(script static void x07_06_predict_stub
    (begin
        (wake x07_06_predict)
    )
)

(script dormant void c06_intra1_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intra1\music\c06_intra1_01_mus" none 1.0)
        (print "c06_intra1 score 01 start")
    )
)

(script dormant void c06_intra1_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intra1\foley\c06_intra1_01_fol" none 1.0)
        (print "c06_intra1 foley 01 start")
    )
)

(script dormant void c06_2070_der
    (begin
        (sleep 69)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_2070_der" "dervish_intra1" 1.0)
        (attract_mode_set_seconds "c06_2070_der" 7.0)
    )
)

(script dormant void c06_2090_soc
    (begin
        (sleep 303)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_2090_soc" "commander_intra1" 1.0)
        (attract_mode_set_seconds "c06_2090_soc" 8.0)
    )
)

(script dormant void c06_2101_elc
    (begin
        (sleep 533)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_2101_elc" none 1.0)
        (attract_mode_set_seconds "c06_2101_elc" 3.0)
    )
)

(script dormant void c06_2110_soc
    (begin
        (sleep 610)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_2110_soc" "commander_intra1" 1.0)
        (attract_mode_set_seconds "c06_2110_soc" 3.0)
    )
)

(script dormant void c06_2120_soc
    (begin
        (sleep 693)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_2120_soc" "commander_intra1" 1.0)
        (attract_mode_set_seconds "c06_2120_soc" 2.0)
    )
)

(script dormant void c06_intra1_dof_01
    (begin
        (sleep 0)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 5.0 1.0 1.0 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 165)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c06_intra1_dof_02
    (begin
        (rasterizer_profile_include_all)
        (sleep 587)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 3.0 0.0 0.0 0.0 0.5 0.5 0.0)
        (print "rack focus")
        (object_destroy_containing "elite")
        (sleep 190)
        (cinematic_screen_effect_set_crossfade2 3.0 0.0 0.5 1.0 0.5 0.0 1.0)
        (print "rack focus")
    )
)

(script dormant void c06_intra1_cinematic_light
    (begin
        (cinematic_lighting_set_primary_light -20.0 282.0 0.21 0.29 0.37)
        (cinematic_lighting_set_secondary_light -59.0 306.0 0.34 0.58 0.65)
        (cinematic_lighting_set_ambient_light 0.07 0.05 0.08)
        (object_uses_cinematic_lighting "dervish_intra1" true)
        (object_uses_cinematic_lighting "commander_intra1" true)
        (object_uses_cinematic_lighting "elite_01" true)
        (object_uses_cinematic_lighting "elite_02" true)
        (object_uses_cinematic_lighting "elite_03" true)
        (object_uses_cinematic_lighting "elite_04" true)
        (object_uses_cinematic_lighting "phantom_intra1" true)
        (object_uses_cinematic_lighting "spectre_intra1" true)
    )
)

(script static void c06_intra1_setup
    (begin
        (object_create_anew "dervish_intra1")
        (object_create_anew "commander_intra1")
        (object_create_anew "elite_01")
        (object_create_anew "elite_02")
        (object_create_anew "elite_03")
        (object_create_anew "elite_04")
        (object_create_anew "phantom_intra1")
        (object_create_anew "spectre_intra1")
        (ice_cream_flavor_stock "dervish_intra1" "left_hand_elite" "")
        (object_cinematic_lod "dervish_intra1" true)
        (object_cinematic_lod "commander_intra1" true)
        (object_cinematic_lod "elite_01" true)
        (object_cinematic_lod "elite_02" true)
        (object_cinematic_lod "elite_03" true)
        (object_cinematic_lod "elite_04" true)
        (object_cinematic_lod "phantom_intra1" true)
        (object_cinematic_lod "spectre_intra1" true)
        (wake c06_intra1_score_01)
        (wake c06_intra1_foley_01)
        (wake c06_2070_der)
        (wake c06_2090_soc)
        (wake c06_2101_elc)
        (wake c06_2110_soc)
        (wake c06_2120_soc)
        (wake c06_intra1_dof_01)
        (wake c06_intra1_dof_02)
        (wake c06_intra1_cinematic_light)
    )
)

(script static void c06_intra1_cleanup
    (begin
        (object_destroy_containing "intra1")
        (cinematic_set_far_clip_distance)
    )
)

(script static void c06_intra1
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (sound_class_enable_ducker "vehicle" 0.25 1)
        (sound_class_enable_ducker "amb" 0.5 1)
        (crash sentinelhq_2)
        (sleep 1)
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "floodzone_intra1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (06_intra1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intra1\music\c06_intra1_01_mus")
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intra1\foley\c06_intra1_01_fol")
        (sleep prediction_offset)
        (c06_intra1_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\06_intra1\06_intra1" "06_intra1_01" none "anchor_flag_intra1")
        (custom_animation_relative "dervish_intra1" "objects\characters\dervish\06_intra1\06_intra1" "dervish_01" false "anchor_intra1")
        (custom_animation_relative "commander_intra1" "objects\characters\elite\06_intra1\06_intra1" "soc_01" false "anchor_intra1")
        (custom_animation_relative "elite_01" "objects\characters\elite\06_intra1\06_intra1" "elite01_01" false "anchor_intra1")
        (custom_animation_relative "elite_02" "objects\characters\elite\06_intra1\06_intra1" "elite02_01" false "anchor_intra1")
        (custom_animation_relative "elite_03" "objects\characters\elite\06_intra1\06_intra1" "elite03_01" false "anchor_intra1")
        (custom_animation_relative "elite_04" "objects\characters\elite\06_intra1\06_intra1" "elite04_01" false "anchor_intra1")
        (custom_animation_relative "phantom_intra1" "objects\vehicles\phantom\animations\06_intra1\06_intra1" "phantom_01" false "anchor_intra1")
        (custom_animation_relative "spectre_intra1" "objects\vehicles\spectre\06_intra1\06_intra1" "spectre_01" false "anchor_intra1")
        (sleep 15)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c06_intra1_cleanup)
        (sleep 30)
        (sound_class_enable_ducker "vehicle" 1.0 1)
        (sound_class_enable_ducker "amb" 1.0 1)
    )
)

(script dormant void c06_intra2_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intra2\music\c06_intra_2_01_mus" none 1.0)
        (print "c06_intra2 score 01 start")
    )
)

(script dormant void c06_intra2_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intra2\foley\c06_intra2_01_fol" none 1.0)
        (print "c06_intra2 foley 01 start")
    )
)

(script dormant void c06_3010_soc
    (begin
        (sleep 550)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_3010_soc" none 1.0)
        (attract_mode_set_seconds "c06_3010_soc" 3.0)
    )
)

(script dormant void c06_intra2_cinematic_light
    (begin
        (cinematic_lighting_set_primary_light 40.0 40.0 0.24 0.25 0.27)
        (cinematic_lighting_set_secondary_light -72.0 134.0 0.23 0.27 0.29)
        (cinematic_lighting_set_ambient_light 0.05 0.05 0.05)
        (object_uses_cinematic_lighting "dervish" true)
        (object_uses_cinematic_lighting "commander" true)
    )
)

(script static void c06_intra2_01_setup
    (begin
        (object_destroy "key")
        (object_create_anew "dervish")
        (object_create_anew "commander")
        (object_create_anew "energy_blade")
        (object_create_anew "key_intra2_01")
        (object_create_anew "key_intra2_02")
        (objects_attach "commander" "left_hand_elite" "energy_blade" "")
        (object_set_permutation "energy_blade" "blade" "noblade")
        (object_cinematic_lod "dervish" true)
        (object_cinematic_lod "index_container" true)
        (object_cinematic_lod "key_intra2_01" true)
        (object_cinematic_lod "key_intra2_02" true)
        (wake c06_intra2_score_01)
        (wake c06_intra2_foley_01)
        (wake c06_3010_soc)
        (wake c06_intra2_cinematic_light)
    )
)

(script static void c06_intra2_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "floodzone_intra2")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (06_intra2_01_predict_stub)
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intra2\music\c06_intra_2_01_mus")
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intra2\foley\c06_intra2_01_fol")
        (sleep prediction_offset)
        (c06_intra2_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\06_intra2\06_intra2" "06_intra2_01" none "anchor_flag_intra2")
        (custom_animation_relative "dervish" "objects\characters\dervish\06_intra2\06_intra2" "dervish_01" false "anchor_intra2")
        (custom_animation_relative "commander" "objects\characters\elite\06_intra2\06_intra2" "commander_01" false "anchor_intra2")
        (scenery_animation_start_relative "key_intra2_01" "scenarios\objects\solo\sentinelhq\key_cine\06_intra2\06_intra2" "intra2_dervishkey_01" "anchor_intra2")
        (scenery_animation_start_relative "key_intra2_02" "scenarios\objects\solo\sentinelhq\key_cine\06_intra2\06_intra2" "intra2_humankey_01" "anchor_intra2")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (06_intra2_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intra2\foley\c06_intra2_02_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c06_intra2_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intra2\foley\c06_intra2_02_fol" none 1.0)
        (print "c06_intra2 foley 02 start")
    )
)

(script dormant void c06_3030_soc
    (begin
        (sleep 73)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_3030_soc" "commander" 1.0)
        (attract_mode_set_seconds "c06_3030_soc" 3.0)
    )
)

(script dormant void blade_activate
    (begin
        (rasterizer_profile_include_all)
        (sleep 87)
        (object_set_permutation "energy_blade" "blade" "default")
        (object_set_function_variable "energy_blade" "turned_on" 1.0 0.0)
        (effect_new_on_object_marker "effects\objects\weapons\melee\energy_blade\blade_activate_replace" "commander" "left_hand_elite")
        (print "blade activate")
    )
)

(script dormant void kill_switch
    (begin
        (sleep 307)
        (print "delete switch")
        (object_destroy "key_switch")
    )
)

(script static void c06_intra2_02_setup
    (begin
        (cinematic_set_environment_map_bitmap 2048.0)
        (print "set far clip")
        (wake c06_intra2_foley_02)
        (wake c06_3030_soc)
        (wake blade_activate)
        (wake kill_switch)
    )
)

(script static void c06_intra2_02_cleanup
    (begin
        (object_destroy "commander")
        (object_destroy_containing "key_intra2_02")
    )
)

(script static void c06_intra2_scene_02
    (begin
        (c06_intra2_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\06_intra2\06_intra2" "06_intra2_02" none "anchor_flag_intra2")
        (custom_animation_relative "dervish" "objects\characters\dervish\06_intra2\06_intra2" "dervish_02" false "anchor_intra2")
        (custom_animation_relative "commander" "objects\characters\elite\06_intra2\06_intra2" "commander_02" false "anchor_intra2")
        (scenery_animation_start_relative "key_intra2_01" "scenarios\objects\solo\sentinelhq\key_cine\06_intra2\06_intra2" "intra2_dervishkey_02" "anchor_intra2")
        (scenery_animation_start_relative "key_intra2_02" "scenarios\objects\solo\sentinelhq\key_cine\06_intra2\06_intra2" "intra2_humankey_02" "anchor_intra2")
        (sleep (- (camera_set_pan) prediction_offset))
        (06_intra2_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intra2\foley\c06_intra2_03_fol")
        (sleep (camera_set_pan))
        (c06_intra2_02_cleanup)
    )
)

(script dormant void c06_intra2_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intra2\foley\c06_intra2_03_fol" none 1.0)
        (print "c06_intra2 foley 03 start")
    )
)

(script dormant void l06_0300_tar
    (begin
        (sleep 74)
        (sound_impulse_time "sound\dialog\levels\06_sentinelwall\mission\l06_0300_tar" none 1.0 "radio_covy")
        (attract_mode_set_seconds "l06_0300_tar" 2.0)
    )
)

(script dormant void l06_0310_tar
    (begin
        (sleep 164)
        (sound_impulse_time "sound\dialog\levels\06_sentinelwall\mission\l06_0310_tar" none 1.0 "radio_covy")
        (attract_mode_set_seconds "l06_0310_tar" 2.5)
    )
)

(script dormant void key_door_open
    (begin
        (sleep 210)
        (print "key door open")
        (device_set_position "key_ride_door0" 1.0)
    )
)

(script static void c06_intra2_03_setup
    (begin
        (object_create_anew "phantom_01")
        (object_cinematic_lod "phantom_01" true)
        (object_uses_cinematic_lighting "phantom_01" true)
        (wake c06_intra2_foley_03)
        (wake l06_0300_tar)
        (wake l06_0310_tar)
        (wake key_door_open)
    )
)

(script static void c06_intra2_03_cleanup
    (begin
        (object_destroy "dervish")
        (object_destroy "phantom_01")
        (object_destroy "key_intra2_01")
    )
)

(script static void c06_intra2_scene_03
    (begin
        (c06_intra2_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\06_intra2\06_intra2" "06_intra2_03" none "anchor_flag_intra2")
        (custom_animation_relative "dervish" "objects\characters\dervish\06_intra2\06_intra2" "dervish_03" false "anchor_intra2")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\06_intra2\06_intra2" "phantom_03" false "anchor_intra2")
        (scenery_animation_start_relative "key_intra2_01" "scenarios\objects\solo\sentinelhq\key_cine\06_intra2\06_intra2" "intra2_dervishkey_03" "anchor_intra2")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c06_intra2_03_cleanup)
        (sleep 30)
    )
)

(script static void c06_intra2
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash sen_hq_bsp_5)
        (sleep 1)
        (c06_intra2_scene_01)
        (c06_intra2_scene_02)
        (c06_intra2_scene_03)
    )
)

(script dormant void x07_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\foley\x07_01_fol" none 1.0)
        (print "x07 foley 01 start")
    )
)

(script dormant void x07_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light -46.0 220.0 0.26 0.23 0.2)
        (cinematic_lighting_set_secondary_light 63.0 262.0 0.23 0.27 0.29)
        (cinematic_lighting_set_ambient_light 0.02 0.02 0.02)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "x07_tentacle" true)
        (print "tentacle cinematic lighting")
        (object_uses_cinematic_lighting "index_container" true)
    )
)

(script static void x07_01_setup
    (begin
        (object_create_anew "miranda")
        (object_create_anew "x07_tentacle")
        (object_create_anew "index_container")
        (print "tentacle created")
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "index_container" true)
        (unit_set_emotional_state "miranda" "pain" 0.25 0)
        (print "miranda - pain .25 0")
        (wake x07_foley_01)
        (wake x07_cinematic_light_01)
    )
)

(script static void x07_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "floodzone_1")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (x07_01_predict_stub)
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\music\x07_02_mus")
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\foley\x07_01_fol")
        (sleep prediction_offset)
        (x07_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x07\x07" "x07_01" none "anchor_flag_x07")
        (custom_animation_relative "miranda" "objects\characters\miranda\x07\x07" "miranda_01" false "anchor_x07")
        (scenery_animation_start_relative "x07_tentacle" "objects\characters\gravemind\tentacle_capture\x07\x07" "tentacle_02" "anchor_x07")
        (print "tentacle 02 animation relative started")
        (scenery_animation_start_relative "x07_tentacle" "objects\characters\gravemind\tentacle_capture\x07\x07" "tentacle_01" "anchor_x07")
        (print "tentacle 01 animation relative started")
        (scenery_animation_start_relative "index_container" "scenarios\objects\forerunner\industrial\index\index_full\index_full" "x07_01" "anchor_x07")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (x07_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\foley\x07_02_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x07_score_02
    (begin
        (sleep 279)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\music\x07_02_mus" none 1.0)
        (print "x07 score 02 start")
    )
)

(script dormant void x07_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\foley\x07_02_fol" none 1.0)
        (print "x07 foley 02 start")
    )
)

(script dormant void x07_0010_mir
    (begin
        (sleep 249)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0010_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x07_0010_mir" 1.0)
    )
)

(script dormant void x07_0020_jon
    (begin
        (sleep 399)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0020_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x07_0020_jon" 4.0)
    )
)

(script dormant void x07_0030_mir
    (begin
        (sleep 540)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0030_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x07_0030_mir" 1.5)
        (unit_set_emotional_state "miranda" "pain" 0.25 15)
        (print "miranda - pain .25 15")
    )
)

(script dormant void x07_emotion_miranda_01
    (begin
        (sleep 330)
        (unit_set_emotional_state "miranda" "shocked" 0.5 0)
        (print "miranda - shocked .5 0")
    )
)

(script dormant void x07_emotion_miranda_02
    (begin
        (sleep 520)
        (unit_set_emotional_state "miranda" "shocked" 0.25 0)
        (print "miranda - shocked .25 0")
    )
)

(script static void x07_02_setup
    (begin
        (object_create_anew "johnson")
        (object_cinematic_lod "johnson" true)
        (object_uses_cinematic_lighting "johnson" true)
        (wake x07_score_02)
        (wake x07_foley_02)
        (wake x07_0010_mir)
        (wake x07_0020_jon)
        (wake x07_0030_mir)
        (wake x07_emotion_miranda_01)
        (wake x07_emotion_miranda_02)
    )
)

(script static void x07_scene_02
    (begin
        (x07_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x07\x07" "x07_02" none "anchor_flag_x07")
        (custom_animation_relative "miranda" "objects\characters\miranda\x07\x07" "miranda_02" false "anchor_x07")
        (custom_animation_relative "johnson" "objects\characters\marine\x07\x07" "johnson_02" false "anchor_x07")
        (scenery_animation_start_relative "x07_tentacle" "objects\characters\gravemind\tentacle_capture\x07\x07" "tentacle_02" "anchor_x07")
        (print "tentacle 02 animation started")
        (scenery_animation_start_relative "index_container" "scenarios\objects\forerunner\industrial\index\index_full\index_full" "x07_02" "anchor_x07")
        (sleep (- (camera_set_pan) prediction_offset))
        (x07_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\music\x07_03_mus")
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\foley\x07_03_fol")
        (sleep (camera_set_pan))
        (object_destroy "x07_tentacle")
        (print "tentacle destroyed")
    )
)

(script dormant void x07_score_03
    (begin
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\music\x07_03_mus" none 1.0)
        (print "x07 score 03 start")
    )
)

(script dormant void x07_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\foley\x07_03_fol" none 1.0)
        (print "x07 foley 03 start")
    )
)

(script dormant void x07_0040_jon
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0040_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x07_0040_jon" 2.0)
    )
)

(script dormant void x07_0050_jon
    (begin
        (sleep 77)
        (unit_set_emotional_state "johnson" "pain" 0.25 0)
        (print "johnson - pain .25 0")
        (sleep 10)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0050_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x07_0050_jon" 1.5)
    )
)

(script dormant void x07_0060_jon
    (begin
        (sleep 150)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0060_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x07_0060_jon" 1.0)
        (sleep 25)
        (unit_set_emotional_state "miranda" "shocked" 0.25 15)
        (print "miranda - shocked .25 15")
    )
)

(script dormant void x07_0070_jon
    (begin
        (sleep 540)
        (unit_set_emotional_state "johnson" "shocked" 0.25 10)
        (print "johnson - shocked .25 10")
        (sleep 10)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0070_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x07_0070_jon" 1.0)
    )
)

(script dormant void x07_0080_jon
    (begin
        (sleep 678)
        (unit_set_emotional_state "johnson" "annoyed" 0.75 60)
        (print "johnson - annoyed .75 60")
        (sleep 10)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0080_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x07_0080_jon" 1.0)
        (sleep 45)
        (unit_set_emotional_state "johnson" "shocked" 0.5 30)
        (print "johnson - shocked .5 30")
    )
)

(script dormant void x07_0090_mir
    (begin
        (sleep 776)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0090_mir" none 1.0)
        (attract_mode_set_seconds "x07_0090_mir" 1.0)
    )
)

(script dormant void x07_0100_mir
    (begin
        (sleep 800)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0100_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x07_0100_mir" 1.0)
    )
)

(script dormant void miranda_smgs_fire_1
    (begin
        (sleep 834)
        (object_create_anew "smg_real_01")
        (object_create_anew "smg_real_02")
        (object_set_scale "smg_real_01" 1.0 0)
        (object_set_scale "smg_real_02" 1.0 0)
        (objects_attach "miranda" "right_hand" "smg_real_01" "")
        (objects_attach "miranda" "left_hand" "smg_real_02" "")
        (sleep 5)
        (weapon_hold_trigger "smg_real_01" 0 true)
        (weapon_hold_trigger "smg_real_02" 0 true)
    )
)

(script dormant void johnson_rifle_fire
    (begin
        (sleep 563)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 2)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 2)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 10)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 2)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 2)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 21)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 2)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
        (sleep 2)
        (effect_new_on_object_marker "effects\objects\weapons\rifle\battle_rifle\fire_bullet" "johnson_rifle" "primary_trigger")
    )
)

(script dormant void dervish_cammo
    (begin
        (sleep 627)
        (print "effect - cammo off")
        (unit_set_active_camo "dervish" false 1.0)
    )
)

(script dormant void x07_cinematic_light_03
    (begin
        (cinematic_lighting_set_primary_light 16.0 82.0 0.25 0.32 0.32)
        (cinematic_lighting_set_secondary_light 24.0 272.0 0.22 0.26 0.28)
        (cinematic_lighting_set_ambient_light 0.02 0.02 0.02)
        (object_uses_cinematic_lighting "dervish" true)
        (object_uses_cinematic_lighting "miranda_smg_01" true)
        (object_uses_cinematic_lighting "miranda_smg_02" true)
        (object_uses_cinematic_lighting "johnson_rifle" true)
    )
)

(script dormant void johnson_rifle_arm
    (begin
        (sleep 105)
        (objects_attach "johnson" "right_hand" "johnson_rifle" "")
    )
)

(script static void x07_03_setup
    (begin
        (sound_looping_set_scale "scenarios\solo\06b_floodzone\06b_music\06b_07")
        (object_create_anew "dervish")
        (object_cannot_die "dervish" true)
        (unit_set_active_camo "dervish" true 0.0)
        (object_create_anew "miranda_smg_01")
        (object_create_anew "miranda_smg_02")
        (object_create_anew "johnson_rifle")
        (object_cinematic_lod "dervish" true)
        (object_cinematic_lod "miranda_smg_01" true)
        (object_cinematic_lod "miranda_smg_02" true)
        (object_cinematic_lod "johnson_rifle" true)
        (unit_set_emotional_state "miranda" "pain" 0.25 0)
        (print "miranda - pain .25 0")
        (unit_set_emotional_state "johnson" "pensive" 0.25 0)
        (print "johnson - pensive .25 0")
        (wake x07_score_03)
        (wake x07_foley_03)
        (wake x07_0040_jon)
        (wake x07_0050_jon)
        (wake x07_0060_jon)
        (wake x07_0070_jon)
        (wake x07_0080_jon)
        (wake x07_0090_mir)
        (wake x07_0100_mir)
        (wake miranda_smgs_fire_1)
        (wake johnson_rifle_arm)
        (wake johnson_rifle_fire)
        (wake dervish_cammo)
        (wake x07_cinematic_light_03)
    )
)

(script static void x07_scene_03
    (begin
        (x07_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x07\x07" "x07_03" none "anchor_flag_x07")
        (custom_animation_relative "miranda" "objects\characters\miranda\x07\x07" "miranda_03" false "anchor_x07")
        (custom_animation_relative "johnson" "objects\characters\marine\x07\x07" "johnson_03" false "anchor_x07")
        (custom_animation_relative "dervish" "objects\characters\dervish\x07\x07" "dervish_03" false "anchor_x07")
        (scenery_animation_start_relative "index_container" "scenarios\objects\forerunner\industrial\index\index_full\index_full" "x07_03" "anchor_x07")
        (scenery_animation_start_relative "miranda_smg_01" "objects\weapons\rifle\smg\x07\x07" "smg01_03" "anchor_x07")
        (scenery_animation_start_relative "miranda_smg_02" "objects\weapons\rifle\smg\x07\x07" "smg02_03" "anchor_x07")
        (sleep (- (camera_set_pan) prediction_offset))
        (x07_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\foley\x07_04_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x07_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\foley\x07_04_fol" none 1.0)
        (print "x07 foley 04 start")
    )
)

(script dormant void x07_0110_mir
    (begin
        (sleep 117)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0110_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x07_0110_mir" 1.5)
    )
)

(script dormant void x07_0120_mir
    (begin
        (sleep 169)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0120_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x07_0120_mir" 1.0)
    )
)

(script dormant void x07_0130_tar
    (begin
        (sleep 483)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0130_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x07_0130_tar" 4.0)
    )
)

(script dormant void x07_0140_der
    (begin
        (sleep 614)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0140_der" "dervish" 1.0)
        (attract_mode_set_seconds "x07_0140_der" 3.0)
    )
)

(script dormant void effect_miranda_hit
    (begin
        (rasterizer_profile_include_all)
        (sleep 338)
        (print "effect - miranda hit")
        (effect_new_on_object_marker "effects\objects\characters\brute\hammer_grappling" "miranda" "body")
    )
)

(script dormant void x07_cinematic_light_04
    (begin
        (cinematic_lighting_set_primary_light 33.0 42.0 0.2 0.25 0.25)
        (cinematic_lighting_set_secondary_light -54.0 0.0 0.23 0.27 0.29)
        (cinematic_lighting_set_ambient_light 0.02 0.02 0.02)
        (object_uses_cinematic_lighting "tartarus" true)
        (object_uses_cinematic_lighting "hammer" true)
    )
)

(script static void x07_scene_05_problem_actors
    (begin
        (print "create problem actors")
        (object_create_anew_containing "brute")
        (object_cinematic_lod "brute_01" true)
        (object_cinematic_lod "brute_02" true)
        (object_cinematic_lod "brute_03" true)
        (object_cinematic_lod "brute_04" true)
        (object_cinematic_lod "brute_shot_01" true)
        (object_cinematic_lod "brute_shot_02" true)
        (object_cinematic_lod "brute_rifle_01" true)
        (object_cinematic_lod "brute_rifle_02" true)
        (objects_attach "brute_03" "right_hand" "brute_shot_01" "right_hand_brute")
        (objects_attach "brute_04" "right_hand" "brute_shot_02" "right_hand_brute")
        (object_uses_cinematic_lighting "brute_01" true)
        (object_uses_cinematic_lighting "brute_02" true)
        (object_uses_cinematic_lighting "brute_03" true)
        (object_uses_cinematic_lighting "brute_04" true)
        (object_uses_cinematic_lighting "brute_shot_01" true)
        (object_uses_cinematic_lighting "brute_shot_02" true)
        (object_uses_cinematic_lighting "brute_rifle_01" true)
        (object_uses_cinematic_lighting "brute_rifle_02" true)
    )
)

(script dormant void x07_emotion_miranda_03
    (begin
        (sleep 300)
        (unit_set_emotional_state "miranda" "shocked" 0.5 0)
        (print "miranda - shocked .5 0")
        (sleep 38)
        (unit_set_emotional_state "miranda" "pain" 0.8 10)
        (print "miranda - shocked 1 10")
    )
)

(script dormant void tartarus_hide_seek
    (begin
        (sleep 5)
        (object_hide "tartarus" true)
        (object_hide "hammer" true)
        (sleep 400)
        (object_hide "tartarus" false)
        (object_hide "hammer" false)
    )
)

(script dormant void miranda_smgs_destroy
    (begin
        (rasterizer_profile_include_all)
        (sleep 98)
        (print "stop firing")
        (weapon_hold_trigger "smg_real_01" 0 false)
        (weapon_hold_trigger "smg_real_02" 0 false)
        (sleep 131)
        (print "destroy smgs")
        (objects_detach "miranda" "smg_real_01")
        (objects_detach "miranda" "smg_real_02")
        (object_destroy_containing "smg_real")
    )
)

(script static void x07_04_setup
    (begin
        (object_create_anew "tartarus")
        (object_create "hammer")
        (object_cinematic_lod "tartarus" true)
        (object_cinematic_lod "hammer" true)
        (wake x07_foley_04)
        (wake x07_0110_mir)
        (wake x07_0120_mir)
        (wake x07_0130_tar)
        (wake x07_0140_der)
        (unit_set_emotional_state "miranda" "shocked" 0.25 0)
        (print "miranda - shocked .25 0")
        (wake x07_emotion_miranda_03)
        (wake miranda_smgs_destroy)
        (wake tartarus_hide_seek)
        (wake x07_cinematic_light_04)
        (wake effect_miranda_hit)
    )
)

(script static void x07_scene_04
    (begin
        (x07_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x07\x07" "x07_04" none "anchor_flag_x07")
        (custom_animation_relative "miranda" "objects\characters\miranda\x07\x07" "miranda_04" false "anchor_x07")
        (custom_animation_relative "johnson" "objects\characters\marine\x07\x07" "johnson_04" false "anchor_x07")
        (custom_animation_relative "dervish" "objects\characters\dervish\x07\x07" "dervish_04" false "anchor_x07")
        (custom_animation_relative "tartarus" "objects\characters\brute\x07\x07" "tartarus_04" false "anchor_x07")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x07\x07" "hammer_04" "anchor_x07")
        (scenery_animation_start_relative "miranda_smg_01" "objects\weapons\rifle\smg\x07\x07" "smg01_04" "anchor_x07")
        (scenery_animation_start_relative "miranda_smg_02" "objects\weapons\rifle\smg\x07\x07" "smg02_04" "anchor_x07")
        (scenery_animation_start_relative "index_container" "scenarios\objects\forerunner\industrial\index\index_full\index_full" "x07_04" "anchor_x07")
        (sleep (- (camera_set_pan) prediction_offset))
        (x07_05_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\foley\x07_05_fol")
        (x07_scene_05_problem_actors)
        (sleep (camera_set_pan))
        (objects_detach "johnson" "johnson_rifle")
        (object_destroy "johnson_rifle")
    )
)

(script dormant void x07_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\foley\x07_05_fol" none 1.0)
        (print "x07 foley 05 start")
    )
)

(script dormant void x07_0150_tar
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0150_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x07_0150_tar" 1.5)
    )
)

(script dormant void x07_0160_tar
    (begin
        (sleep 48)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0160_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x07_0160_tar" 2.0)
    )
)

(script dormant void x07_0170_tar
    (begin
        (sleep 302)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0170_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x07_0170_tar" 4.0)
    )
)

(script dormant void x07_0180_tar
    (begin
        (sleep 428)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0180_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x07_0180_tar" 5.5)
    )
)

(script dormant void x07_0190_der
    (begin
        (sleep 591)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0190_der" "dervish" 1.0)
        (attract_mode_set_seconds "x07_0190_der" 2.5)
    )
)

(script dormant void destroy_miranda
    (begin
        (sleep 428)
        (object_destroy "miranda")
        (print "destroy miranda")
    )
)

(script static void x07_05_setup
    (begin
        (wake x07_foley_05)
        (wake x07_0150_tar)
        (wake x07_0160_tar)
        (wake x07_0170_tar)
        (wake x07_0180_tar)
        (wake x07_0190_der)
        (unit_set_emotional_state "miranda" "asleep" 1.0 0)
        (print "miranda - asleep 1 0")
        (unit_set_emotional_state "johnson" "asleep" 1.0 0)
        (print "johnson - asleep 1 0")
        (wake destroy_miranda)
    )
)

(script static void x07_05_cleanup
    (begin
        (object_destroy "johnson")
        (object_destroy_containing "brute")
    )
)

(script static void x07_scene_05
    (begin
        (x07_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x07\x07" "x07_05" none "anchor_flag_x07")
        (custom_animation_relative "miranda" "objects\characters\miranda\x07\x07" "miranda_05" false "anchor_x07")
        (custom_animation_relative "johnson" "objects\characters\marine\x07\x07" "johnson_05" false "anchor_x07")
        (custom_animation_relative "dervish" "objects\characters\dervish\x07\x07" "dervish_05" false "anchor_x07")
        (custom_animation_relative "tartarus" "objects\characters\brute\x07\x07" "tartarus_05" false "anchor_x07")
        (custom_animation_relative "brute_01" "objects\characters\brute\x07\x07" "brute01_05" false "anchor_x07")
        (custom_animation_relative "brute_02" "objects\characters\brute\x07\x07" "brute02_05" false "anchor_x07")
        (custom_animation_relative "brute_03" "objects\characters\brute\x07\x07" "brute03_05" false "anchor_x07")
        (custom_animation_relative "brute_04" "objects\characters\brute\x07\x07" "brute04_05" false "anchor_x07")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x07\x07" "hammer_05" "anchor_x07")
        (scenery_animation_start_relative "index_container" "scenarios\objects\forerunner\industrial\index\index_full\index_full" "x07_05" "anchor_x07")
        (sleep (- (camera_set_pan) prediction_offset))
        (x07_06_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x07\foley\x07_06_fol")
        (sleep (camera_set_pan))
        (x07_05_cleanup)
    )
)

(script dormant void x07_foley_06
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x07\foley\x07_06_fol" none 1.0)
        (print "x07 foley 06 start")
    )
)

(script dormant void x07_0200_tar
    (begin
        (sleep 86)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0200_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x07_0200_tar" 6.5)
        (sleep 128)
        (unit_set_emotional_state "tartarus" "inquisitive" 1.0 60)
    )
)

(script dormant void tartarus_bruteshot_fire
    (begin
        (sleep 373)
        (print "effect - tartarus' hammer")
        (effect_new_on_object_marker "effects\objects\characters\brute\tartarus_hammer_impact_cinematic" "tartarus" "body")
    )
)

(script dormant void tartarus_bruteshot_hit
    (begin
        (sleep 380)
        (print "effect - hammer hit")
        (effect_new_on_object_marker "effects\objects\characters\brute\hammer_grappling" "dervish" "body")
    )
)

(script dormant void x07_predict_shaft_01
    (begin
        (sleep 385)
        (print "predict: camera")
        (camera_predict_resources_at_frame "objects\characters\cinematic_camera\x07\x07" "x07_06" none "anchor_flag_x07" 405)
    )
)

(script dormant void x07_predict_shaft_02
    (begin
        (sleep 532)
        (print "predict: camera")
        (camera_predict_resources_at_frame "objects\characters\cinematic_camera\x07\x07" "x07_06" none "anchor_flag_x07" 552)
    )
)

(script static void x07_06_setup
    (begin
        (wake x07_foley_06)
        (wake x07_0200_tar)
        (wake tartarus_bruteshot_fire)
        (wake tartarus_bruteshot_hit)
        (wake x07_predict_shaft_01)
        (wake x07_predict_shaft_02)
    )
)

(script static void x07_06_cleanup
    (begin
        (object_destroy "dervish")
        (object_destroy "tartarus")
        (object_destroy "hammer")
        (object_destroy "index_container")
    )
)

(script static void x07_scene_06
    (begin
        (x07_06_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x07\x07" "x07_06" none "anchor_flag_x07")
        (custom_animation_relative "dervish" "objects\characters\dervish\x07\x07" "dervish_06" false "anchor_x07")
        (custom_animation_relative "tartarus" "objects\characters\brute\x07\x07" "tartarus_06" false "anchor_x07")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x07\x07" "hammer_06" "anchor_x07")
        (scenery_animation_start_relative "index_container" "scenarios\objects\forerunner\industrial\index\index_full\index_full" "x07_06" "anchor_x07")
        (sleep (- (camera_set_pan) 1.0))
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (x07_06_cleanup)
        (sound_class_enable_ducker "amb" 0.0 60)
        (sleep 90)
    )
)

(script static void x07
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash sen_hq_bsp_6)
        (sleep 1)
        (x07_scene_01)
        (x07_scene_02)
        (x07_scene_03)
        (x07_scene_04)
        (x07_scene_05)
        (x07_scene_06)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script command_script void cs_invulnerable
    (begin
        (cs_enable_moving true)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (sleep_until (>= (ai_combat_status ai_current_actor) ai_combat_status_certain))
        (sleep (* 30.0 1.0))
        (object_can_take_damage (ai_get_object ai_current_actor))
    )
)

(script command_script void cs_invul_8
    (begin
        (cs_enable_moving true)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (sleep (* 30.0 8.0))
        (object_can_take_damage (ai_get_object ai_current_actor))
    )
)

(script command_script void cs_kill
    (begin
        (ai_kill_silent ai_current_actor)
    )
)

(script static void no_death
    (begin
        (object_cannot_take_damage (ai_actors "covenant"))
    )
)

(script dormant void ice_cream_superman
    (begin
        (object_create "ice_cream_head")
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
            ) 
        5)
        (if debug 
            (print "you're going to get fat!!!!! or dead..."))
        (if debug 
            (print "because now everyone is superman!!!!"))
        (reset_dsp_image 10)
    )
)

(script dormant void music_06b_01
    (begin
        (sleep_until g_music_06b_01)
        (if debug 
            (print "start music 06b_01"))
        (sound_looping_stop_immediately "scenarios\solo\06b_floodzone\06b_music\06b_01" none 1.0)
    )
)

(script dormant void music_06b_02
    (begin
        (sleep_until g_music_06b_02)
        (if debug 
            (print "start music 06b_02"))
        (sound_looping_stop_immediately "scenarios\solo\06b_floodzone\06b_music\06b_02" none 1.0)
        (sleep_until (not g_music_06b_02))
        (if debug 
            (print "stop music 06b_02"))
        (sound_looping_set_scale "scenarios\solo\06b_floodzone\06b_music\06b_02")
    )
)

(script dormant void music_06b_03
    (begin
        (sleep_until g_music_06b_03)
        (if debug 
            (print "start music 06b_03"))
        (sound_looping_stop_immediately "scenarios\solo\06b_floodzone\06b_music\06b_03" none 1.0)
        (sleep_until (not g_music_06b_03))
        (if debug 
            (print "stop music 06b_03"))
        (sound_looping_set_scale "scenarios\solo\06b_floodzone\06b_music\06b_03")
    )
)

(script dormant void music_06b_04
    (begin
        (sleep_until g_music_06b_04)
        (if debug 
            (print "start music 06b_04"))
        (sound_looping_stop_immediately "scenarios\solo\06b_floodzone\06b_music\06b_04" none 1.0)
    )
)

(script dormant void music_06b_05
    (begin
        (sleep_until (volume_test_objects "tv_e20_dock_entrance" (players)))
        (set g_music_06b_05 true)
        (if debug 
            (print "start music 06b_05"))
        (sound_looping_stop_immediately "scenarios\solo\06b_floodzone\06b_music\06b_05" none 1.0)
        (sleep_until (not g_music_06b_05))
        (if debug 
            (print "stop music 06b_05"))
        (sound_looping_set_scale "scenarios\solo\06b_floodzone\06b_music\06b_05")
    )
)

(script dormant void music_06b_06
    (begin
        (sleep_until g_music_06b_06)
        (if debug 
            (print "start music 06b_06"))
        (sound_looping_stop_immediately "scenarios\solo\06b_floodzone\06b_music\06b_06" none 1.0)
    )
)

(script dormant void music_06b_07
    (begin
        (sleep_until (volume_test_objects "tv_music_06b_07" (players)))
        (if debug 
            (print "start music 06b_07"))
        (sound_looping_stop_immediately "scenarios\solo\06b_floodzone\06b_music\06b_07" none 1.0)
    )
)

(script dormant void chapter_mirror
    (begin
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_competition
    (begin
        (sleep 30)
        (show_hud_help_text 0.0 0.5)
        (cinematic_set_title true)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_2")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_gallery
    (begin
        (show_hud_help_text 0.0 0.5)
        (cinematic_set_title true)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_3")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_familiar
    (begin
        (show_hud_help_text 0.0 0.5)
        (cinematic_set_title true)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_4")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void objective_push_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "push through the quarantine-zone toward the library.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_push_clear
    (begin
        (print "objective complete:")
        (print "push through the quarantine-zone toward the library.")
        (update_remote_camera 0)
    )
)

(script dormant void objective_link_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "link-up with the spec-ops leader, and break through the flood barricade.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_link_clear
    (begin
        (print "objective complete:")
        (print "link-up with the spec-ops leader, and break through the flood barricade.")
        (update_remote_camera 1)
    )
)

(script dormant void objective_retrieve_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "retrieve the sacred icon before the humans.")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective_retrieve_clear
    (begin
        (print "objective complete:")
        (print "retrieve the sacred icon before the humans.")
        (update_remote_camera 2)
    )
)

(script dormant void sc_cov_charge
    (begin
        (sleep 60)
        (if dialogue 
            (print "commander: forward, warriors! and fear not pain or death!"))
        (sleep (ai_play_line_on_object none "0220"))
        (sleep (* dialogue_pause 2.0))
        (if dialogue 
            (print "commander: go, arbiter! i'll follow when our reinforcements arrive!"))
        (sleep (ai_play_line_on_object none "0240"))
        (sleep dialogue_pause)
        (sleep_until g_qz_cov_def_progress)
        (if (<= (ai_living_count "cov_def_enf") 0) 
            (sleep 180) (sleep 30))
        (if (> (ai_living_count "cov_def_enf") 0) 
            (begin
                (if dialogue 
                    (print "spec-ops: go, enforcers!"))
                (sleep (ai_play_line "covenant" "0590"))
                (sleep dialogue_pause)
            )
        )
        (if dialogue 
            (print "spec-ops: to the vehicles! we'll need their heavy-guns!"))
        (sleep (ai_play_line "covenant" "0600"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: onward! to the sacred icon!"))
        (sleep (ai_play_line "covenant" "0610"))
        (sleep dialogue_pause)
    )
)

(script command_script void cs_sc_qz_veh_int
    (begin
        (if dialogue 
            (print "spec-ops: what?! the parasite controls our vehicles?!"))
        (sleep (ai_play_line "covenant" "0620"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: impossible! it's never done that before!"))
        (sleep (ai_play_line "covenant" "0640"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: no matter. it will die all the same!"))
        (sleep (ai_play_line "covenant" "0650"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_qz_veh_int
    (begin
        (sleep 180)
        (sleep_until (ai_scene "sc_qz_veh_int" cs_sc_qz_veh_int "covenant"))
    )
)

(script dormant void sc_ext_a
    (begin
        (if dialogue 
            (print "commander: i'm sending you a squad of my most experienced warriors, arbiter."))
        (sleep (ai_play_line_on_object none "0650"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "commander: do not squander their talents!"))
        (sleep (ai_play_line_on_object none "0660"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_factory_approach
    (begin
        (if dialogue 
            (print "commander: commander! we've found a human vehicle!"))
        (sleep (ai_play_line "covenant" "0250"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: keep moving. i'm on my way."))
        (sleep (ai_play_line_on_object none "0260"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_factory_exit
    (begin
        (sleep 60)
        (if dialogue 
            (print "spec-ops: humans and parasites!"))
        (if dialogue 
            (print "this ring has been befouled, but we will wipe it clean!"))
        (sleep (ai_play_line "covenant" "0270"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: honoring those who built it!"))
        (sleep (ai_play_line "covenant" "0280"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_human_fools
    (begin
        (if dialogue 
            (print "commander: human fools. i almost feel sorry for them."))
        (sleep (ai_play_line_on_object none "0290"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_ext_b
    (begin
        (if dialogue 
            (print "spec-ops: forward to the icon!"))
        (sleep (ai_play_line "covenant" "0700"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: the parasite's ranks swell as we draw nearer to the library!"))
        (sleep (ai_play_line "covenant" "0710"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: steel your nerves. we are not turning back!"))
        (sleep (ai_play_line "covenant" "0720"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_chasm
    (begin
        (if dialogue 
            (print "tartarus: i see that coward didn't join you."))
        (sleep (ai_play_line_on_object none "0300"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "tartarus: i'll do what i can to keep the flood off your back."))
        (sleep (ai_play_line_on_object none "0310"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_outer_wall
    (begin
        (if dialogue 
            (print "tartarus: we cannot let the humans capture the icon!"))
        (sleep (ai_play_line_on_object none "0320"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "tartarus: the hierarchs do not look kindly on failure."))
        (sleep (ai_play_line_on_object none "0330"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_dock
    (begin
        (if dialogue 
            (print "tartarus: hurry, arbiter! get the icon!"))
        (sleep (ai_play_line_on_object none "0340"))
        (sleep dialogue_pause)
    )
)

(script static boolean driver_seat_test
    (begin
        (if 
            (or
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_ghosts/a") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_ghosts/b") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_flood_ghosts_ini/a") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_flood_ghosts_ini/b") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_hog_ab/hog") "warthog_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_ghost_ab/a") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_ghost_ab/b") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_scorpion/scorpion") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_flood_hog_bk/warthog") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_flood_ghosts_bk/a") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_flood_ghosts_bk/b") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_a_ghosts/a") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_a_ghosts/b") "ghost_d" (players))
            ) 
                true false)
    )
)

(script static boolean passenger_seat_test
    (begin
        (if 
            (or
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_p_l" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_p_r" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_g" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_hog_ab/hog") "warthog_p" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_hog_ab/hog") "warthog_g" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_flood_hog_bk/warthog") "warthog_p" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "veh_int_flood_hog_bk/warthog") "warthog_g" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_fact_warthog/warthog") "warthog_p" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_fact_warthog/warthog") "warthog_g" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_warthog/warthog") "warthog_p" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_warthog/warthog") "warthog_g" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_warthog_gauss/warthog") "warthog_p" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_warthog_gauss/warthog") "warthog_g" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_cov_spectre/spectre") "spectre_p_l" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_cov_spectre/spectre") "spectre_p_r" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_ext_b_cov_spectre/spectre") "spectre_g" (players))
            ) 
                true false)
    )
)

(script command_script void cov_def_spec_tele_a
    (begin
        (cs_teleport bsp_swap_teleport/a bsp_swap_teleport/face)
    )
)

(script command_script void cov_def_spec_tele_b
    (begin
        (cs_teleport bsp_swap_teleport/b bsp_swap_teleport/face)
    )
)

(script command_script void cov_def_spec_tele_c
    (begin
        (cs_teleport bsp_swap_teleport/c bsp_swap_teleport/face)
    )
)

(script command_script void cov_def_spec_tele_d
    (begin
        (cs_teleport bsp_swap_teleport/d bsp_swap_teleport/face)
    )
)

(script command_script void cs_fact_ent_exit_veh
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_nearest crashed_fact_ent)
        (cs_enable_targeting true)
        (cs_shoot true)
        (ai_set_orders "covenant" "cov_follow_factory1")
        (sleep 30)
        (ai_vehicle_exit "covenant")
    )
)

(script dormant void ext_a_vehicle_orders
    (begin
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant" "cov_drive_cov_def")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_cov_def")
                        ) )
                )
                (= (version) 1)
            )
        )
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (if (= (version) 0) 
                                (begin
                                    (begin
                                        (ai_set_orders "covenant_infantry" "cov_follow_cov_def")
                                        (ai_set_orders "covenant_vehicles" "cov_drive_cov_def")
                                    )
                                ) (if (= (version) 1) 
                                    (begin
                                        (begin
                                            (ai_set_orders "covenant_infantry" "cov_follow_veh_int")
                                            (ai_set_orders "covenant_vehicles" "cov_drive_veh_int_a")
                                        )
                                    ) )
                            )
                        )
                    ) (if true 
                        (begin
                            (if (= (version) 0) 
                                (begin
                                    (ai_set_orders "covenant" "cov_follow_cov_def")
                                ) (if (= (version) 1) 
                                    (begin
                                        (ai_set_orders "covenant" "cov_follow_veh_int")
                                    ) )
                            )
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_veh_int_a" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_veh_int_a" (players))
                        (<= (ai_living_count "veh_int_sen_a") 0)
                    )
                    g_veh_int_migrate_b
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (if (= (version) 0) 
                                (begin
                                    (begin
                                        (ai_set_orders "covenant_infantry" "cov_follow_cov_def")
                                        (ai_set_orders "covenant_vehicles" "cov_drive_cov_def")
                                    )
                                ) (if (= (version) 1) 
                                    (begin
                                        (begin
                                            (ai_set_orders "covenant_infantry" "cov_follow_veh_int")
                                            (ai_set_orders "covenant_vehicles" "cov_drive_veh_int_b")
                                        )
                                    ) )
                            )
                        )
                    ) (if true 
                        (begin
                            (if (= (version) 0) 
                                (begin
                                    (ai_set_orders "covenant" "cov_follow_cov_def")
                                ) (if (= (version) 1) 
                                    (begin
                                        (ai_set_orders "covenant" "cov_follow_veh_int")
                                    ) )
                            )
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_veh_int_b" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_veh_int_b" (players))
                        (<= (ai_living_count "veh_int_sen_b") 0)
                        (<= (ai_living_count "veh_int_flood_b") 0)
                    )
                    g_veh_int_migrate_c
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_veh_int")
                            (ai_set_orders "covenant_vehicles" "cov_drive_veh_int_c")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_veh_int")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_veh_int_c" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_veh_int_c" (players))
                        (<= (ai_living_count "veh_int_sen_c") 0)
                        (<= (ai_living_count "veh_int_flood_c") 0)
                    )
                    g_veh_int_migrate_d
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_veh_int")
                            (ai_set_orders "covenant_vehicles" "cov_drive_veh_int_d")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_veh_int")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_veh_int_d" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_veh_int_d" (players))
                        (<= (ai_living_count "veh_int_sen_d") 0)
                        (<= (ai_living_count "veh_int_flood_d") 0)
                    )
                    g_veh_int_migrate_e
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_veh_int")
                            (ai_set_orders "covenant_vehicles" "cov_drive_veh_int_e")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_veh_int")
                        ) )
                )
                (or
                    (volume_test_objects "tv_qz_ext_a" (players))
                    g_ext_a_dam_migrate_a
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a_dam")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_dam_a")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a_dam")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_ext_a_dam_a" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_ext_a_dam_a" (players))
                        (<= (ai_living_count "ext_a_sen_dam_a") 0)
                        (<= (ai_living_count "ext_a_flood_dam_a") 0)
                    )
                    g_ext_a_dam_migrate_b
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a_dam")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_dam_b")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a_dam")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "qz_ext_a_dam_b" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "qz_ext_a_dam_b" (players))
                        (<= (ai_living_count "ext_a_sen_dam_b") 0)
                        (<= (ai_living_count "ext_a_flood_dam_b") 0)
                    )
                    g_ext_a_migrate_a
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_a")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_ext_a_a" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_ext_a_a" (players))
                        (<= (ai_living_count "ext_a_sen_a") 0)
                        (<= (ai_living_count "ext_a_flood_a") 0)
                    )
                    g_ext_a_migrate_b
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_b")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_ext_a_b" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_ext_a_b" (players))
                        (<= (ai_living_count "ext_a_sen_b") 0)
                        (<= (ai_living_count "ext_a_flood_b") 0)
                    )
                    g_ext_a_migrate_c
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_c")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_ext_a_c" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_ext_a_c" (players))
                        (<= (ai_living_count "ext_a_sen_c") 0)
                        (<= (ai_living_count "ext_a_flood_c") 0)
                    )
                    g_ext_a_migrate_d
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_d")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_ext_a_d" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_ext_a_d" (players))
                        (<= (ai_living_count "ext_a_sen_d") 0)
                        (<= (ai_living_count "ext_a_flood_d") 0)
                    )
                    g_ext_a_migrate_e
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_e")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_ext_a_e" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_ext_a_e" (players))
                        (<= (ai_living_count "ext_a_sen_e") 0)
                        (<= (ai_living_count "ext_a_flood_e") 0)
                    )
                    g_ext_a_migrate_f
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a_fact_ent")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_a_f")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a_fact_ent")
                        ) )
                )
                (or
                    (and
                        (volume_test_objects "tv_ext_a_f" (players))
                        (ai_trigger_test "done_fighting" "covenant")
                    )
                    (and
                        (volume_test_objects "tv_ext_a_f" (players))
                        (<= (ai_living_count "ext_a_sen_f") 0)
                        (<= (ai_living_count "ext_a_flood_f") 0)
                    )
                    g_ext_a_fact_ent_migrate
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_a_fact_ent")
                            (ai_set_orders "covenant_vehicles" "cov_drive_fact_ent")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_a_fact_ent")
                        ) )
                )
                (or
                    (and
                        (ai_trigger_test "done_fighting" "covenant")
                        g_fact_ent_sen_spawn
                    )
                    (and
                        (<= (ai_living_count "fact_ent_sentinels") 0)
                        (<= (ai_living_count "fact_ent_flood") 0)
                        g_fact_ent_sen_spawn
                    )
                    (volume_test_objects "tv_fact_ent_follow" (players))
                )
            )
        )
        (sleep g_order_delay)
        (cs_run_command_script "covenant" cs_fact_ent_exit_veh)
    )
)

(script command_script void cs_ext_b_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_nearest ext_b_exit)
        (cs_enable_targeting true)
        (cs_shoot true)
        (ai_set_orders "covenant" "cov_ext_b_exit")
        (sleep 30)
        (ai_vehicle_exit "covenant")
    )
)

(script dormant void ext_b_vehicle_orders
    (begin
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_b")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_b_a")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_b")
                        ) )
                )
                (ai_magically_see "covenant" "ext_b_flood")
                g_ext_b_migrate_1
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_b")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_b_b")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_b")
                        ) )
                )
                (ai_magically_see "covenant" "ext_b_flood")
                g_ext_b_migrate_2
            )
        )
        (sleep (* g_order_delay 3.0))
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_b")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_b_b")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_b")
                        ) )
                )
                (ai_magically_see "covenant" "ext_b_flood")
                (or
                    (and
                        (<= (ai_living_count "ext_b_flood_b") 0)
                        (<= (ai_living_count "ext_b_sentinels_b") 0)
                    )
                    g_ext_b_migrate_3
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_b")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_b_c")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_b_bk")
                        ) )
                )
                (ai_magically_see "covenant" "ext_b_flood")
                (or
                    (and
                        (<= (ai_living_count "ext_b_flood_c") 0)
                        (<= (ai_living_count "ext_b_sentinels_c") 0)
                    )
                    g_ext_b_migrate_4
                )
            )
        )
        (sleep g_order_delay)
        (sleep_until 
            (begin
                (if (passenger_seat_test) 
                    (begin
                        (begin
                            (if debug 
                                (print "player is passenger"))
                            (ai_set_orders "covenant_infantry" "cov_follow_ext_b")
                            (ai_set_orders "covenant_vehicles" "cov_drive_ext_b_d")
                        )
                    ) (if true 
                        (begin
                            (ai_set_orders "covenant" "cov_follow_ext_b_bk")
                        ) )
                )
                (ai_magically_see "covenant" "ext_b_flood")
                g_ext_b_migrate_5
            )
        )
        (sleep (* g_order_delay 3.0))
        (cs_run_command_script "covenant" cs_ext_b_exit)
        (sleep_until (= (version) 3))
        (ai_migrate "covenant" "key_cov_dump")
        (sleep 5)
        (ai_teleport_to_starting_location_if_outside_bsp "key_cov_dump")
        (sleep 5)
        (ai_set_orders "covenant" "cov_follow_key_ent")
    )
)

(script command_script void cs_cov_def_phantom
    (begin
        (cs_fly_to qz_cov_def/drop)
        (sleep_until g_qz_cov_def_progress)
        (cs_vehicle_speed 0.85)
        (cs_fly_to_and_face qz_cov_def/p4 qz_cov_def/p1 3.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by qz_cov_def/p1 10.0)
        (cs_fly_by qz_cov_def/p2 10.0)
        (cs_fly_by qz_cov_def/p3 10.0)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_cov_def_spec_ops_a
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_look_player true)
        (sleep_until g_qz_cov_def_progress 5)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "qz_cov_def_ghosts/a"))
    )
)

(script command_script void cs_cov_def_spec_ops_b
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_look_player true)
        (sleep_until g_qz_cov_def_progress 5)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "qz_cov_def_ghosts/b"))
    )
)

(script command_script void cs_cov_def_spec_ops_c
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_look_player true)
        (sleep_until g_qz_cov_def_progress 5)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre"))
    )
)

(script command_script void cs_cov_def_spec_ops_d
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_look_player true)
        (sleep_until g_qz_cov_def_progress 5)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre"))
    )
)

(script command_script void cs_go_to_scorpion
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "veh_int_scorpion/scorpion"))
    )
)

(script command_script void cs_go_to_wraith
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "veh_int_wraith/wraith"))
    )
)

(script dormant void ai_veh_int_ghost_spawn
    (begin
        (sleep_until (<= (ai_living_count "veh_int_flood_ghosts_ini") 0))
        (if debug 
            (print "waking vehicle interior ghost spawner"))
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_veh_int_ghost_limit 6)
                    (set g_veh_int_ghost_number 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_veh_int_ghost_limit 8)
                        (set g_veh_int_ghost_number 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_veh_int_ghost_limit 10)
                            (set g_veh_int_ghost_number 3)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "veh_int_flood_ghosts_bk") 0))
                (sleep 90)
                (if debug 
                    (print "placing ghosts"))
                (ai_place "veh_int_flood_ghosts_bk" g_veh_int_ghost_number)
                (or
                    (>= (ai_spawn_count "veh_int_flood_ghosts_bk") g_veh_int_ghost_limit)
                    g_veh_int_ghost_spawn
                )
            )
        )
        (if (<= (ai_living_count "veh_int_flood_ghosts_bk") 0) 
            (ai_place "veh_int_flood_ghosts_bk"))
    )
)

(script dormant void dam_door_a
    (begin
        (sleep_until 
            (begin
                (sleep_until (volume_test_objects "tv_dam_door_a" (players)) 5)
                (device_set_position "dam_door_a" 1.0)
                false
            )
        )
    )
)

(script dormant void dam_door_b
    (begin
        (sleep_until 
            (begin
                (sleep_until (volume_test_objects "tv_dam_door_b" (players)) 5)
                (device_set_position "dam_door_b" 1.0)
                false
            )
        )
    )
)

(script command_script void cs_ext_a_enf_ini
    (begin
        (cs_shoot true)
        (cs_vehicle_boost true)
        (cs_fly_by qz_ext_a_enf/p0 3.0)
        (cs_fly_by qz_ext_a_enf/p1 3.0)
        (cs_fly_by qz_ext_a_enf/p2 3.0)
        (cs_vehicle_boost false)
    )
)

(script command_script void cs_ext_a_pelican
    (begin
        (cs_shoot false)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "qz_ext_a_dam_human/pelican") pelican_lc (ai_vehicle_get_from_starting_location "qz_ext_a_dam_human/scorpion"))
        (cs_fly_by qz_ext_a_pelican/p0 3.0)
        (cs_fly_by qz_ext_a_pelican/p2 3.0)
        (cs_fly_by qz_ext_a_pelican/p3 5.0)
        (cs_fly_by qz_ext_a_pelican/p5 3.0)
        (sleep 30)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_boost_1_5
    (begin
        (cs_vehicle_boost true)
        (sleep (* 30.0 1.5))
        (cs_vehicle_boost false)
    )
)

(script command_script void cs_ext_a_phantom
    (begin
        (ai_place "qz_ext_a_spec_ops")
        (ai_place "qz_ext_a_ghosts")
        (cs_shoot true)
        (cs_enable_pathfinding_failsafe true)
        (sleep 1)
        (vehicle_load_magic v_ext_a_phantom phantom_p (ai_actors "qz_ext_a_spec_ops"))
        (vehicle_load_magic v_ext_a_phantom phantom_sc01 (ai_vehicle_get_from_starting_location "qz_ext_a_ghosts/a"))
        (vehicle_load_magic v_ext_a_phantom phantom_sc02 (ai_vehicle_get_from_starting_location "qz_ext_a_ghosts/b"))
        (sleep 1)
        (cs_vehicle_boost true)
        (cs_fly_by qz_ext_a_phantom/p0 5.0)
        (cs_vehicle_boost false)
        (cs_fly_by qz_ext_a_phantom/p1 5.0)
        (cs_fly_by qz_ext_a_phantom/p2 4.0)
        (cs_fly_to_and_face qz_ext_a_phantom/p3 qz_ext_a_phantom/unit_face)
        (cs_vehicle_speed 0.75)
        (cs_fly_to_and_face qz_ext_a_phantom/drop_units qz_ext_a_phantom/unit_face 2.0)
        (object_set_phantom_power v_ext_a_phantom true)
        (sleep 45)
        (vehicle_unload v_ext_a_phantom phantom_p_a01)
        (sleep 30)
        (vehicle_unload v_ext_a_phantom phantom_p_a02)
        (sleep 30)
        (vehicle_unload v_ext_a_phantom phantom_p_a03)
        (sleep 45)
        (cs_fly_to_and_face qz_ext_a_phantom/drop_ghosts qz_ext_a_phantom/face 2.0)
        (sleep_until (not (volume_test_objects_all "tv_qz_ext_a_ghost_drop" (players))))
        (sleep 45)
        (vehicle_unload v_ext_a_phantom phantom_sc)
        (sleep 90)
        (object_set_phantom_power v_ext_a_phantom false)
        (cs_vehicle_speed 1.0)
        (cs_fly_by qz_ext_a_phantom/p6)
        (cs_fly_by qz_ext_a_phantom/p4)
        (cs_vehicle_boost true)
        (cs_fly_by qz_ext_a_phantom/p7)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_wraiths_shoot
    (begin
        (cs_abort_on_damage true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p0)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p1)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p2)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p3)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p4)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p5)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p6)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_shoot_point true qz_ext_a_wraiths/p7)
                        (sleep (random_range 30 60))
                    )
                )
                g_qz_ext_a_wraith_shoot
            )
        )
    )
)

(script dormant void ai_ext_a_dam_enforcers
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "ext_a_sen_dam_b") 0))
                (sleep 90)
                (ai_place "qz_ext_a_dam_enf_door")
                (or
                    (>= (ai_spawn_count "qz_ext_a_dam_enf_door") 3)
                    g_ext_a_dam_enf
                )
            )
        )
    )
)

(script dormant void ai_qz_ext_a_wraiths
    (begin
        (ai_place "qz_ext_a_flood_wraith_fr")
        (ai_place "qz_ext_a_flood_wraith_bk")
        (ai_place "qz_ext_a_flood_wraith_ledge")
    )
)

(script dormant void ai_qz_ext_a_ghosts
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "qz_ext_a_flood_ghosts") 0))
                (if g_qz_ext_a_flood_ghosts 
                    (sleep_forever))
                (sleep (random_range 60 120))
                (ai_place "qz_ext_a_flood_ghosts")
                g_qz_ext_a_flood_ghosts
            )
        )
    )
)

(script dormant void ai_fact_ent_sen_spawn
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "fact_ent_sen") 1))
                (sleep (random_range 15 30))
                (ai_place "fact_ent_sen")
                (set g_fact_ent_sen_count (+ g_fact_ent_sen_count 1.0))
                (if (= g_fact_ent_sen_count g_fact_ent_sen_index) 
                    (set g_fact_ent_sen_spawn true))
                g_fact_ent_sen_spawn
            )
        )
    )
)

(script dormant void ai_fact_ent_enf_spawn
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "fact_ent_enf") 0))
                (sleep (random_range 30 60))
                (ai_place "fact_ent_enf")
                (set g_fact_ent_enf_count (+ g_fact_ent_enf_count 1.0))
                (if (= g_fact_ent_enf_count g_fact_ent_enf_index) 
                    (set g_fact_ent_sen_spawn true))
                g_fact_ent_sen_spawn
            )
        )
    )
)

(script dormant void ai_qz_ext_a_d_spawn
    (begin
        (sleep_until (volume_test_objects "tv_ext_a_d" (players)))
        (if g_qz_ext_a_d_spawn 
            (begin
                (ai_place "qz_ext_a_flood_d")
                (ai_place "qz_ext_a_enf_bk")
            )
        )
    )
)

(script dormant void factory_1_flood_respawn
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_factory_1_mid_03" (players)) true)
                        (< (ai_nonswarm_count "factory1_flood") 3)
                    )
                )
                (if (= (volume_test_objects "vol_factory_1_mid_03" (players)) false) 
                    (ai_place "factory_1_flood_end" 1) (sleep 60))
                (or
                    (= (volume_test_objects "vol_factory_1_mid_03" (players)) true)
                    (>= (ai_spawn_count "factory_1_flood_end") 10)
                )
            )
        )
    )
)

(script dormant void factory_1_sentinel_respawn_01
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_factory_1_mid_01" (players)) true)
                        (< (ai_living_count "factory1_sentinels") 2)
                    )
                )
                (if (= (volume_test_objects "vol_factory_1_mid_01" (players)) false) 
                    (ai_place "factory_1_sentinels_01_low" 1) (sleep 120))
                (if (= (volume_test_objects "vol_factory_1_mid_01" (players)) false) 
                    (ai_place "factory_1_sentinels_01_high" 1) (sleep 120))
                (or
                    (= (volume_test_objects "vol_factory_1_mid_01" (players)) true)
                    (>= (+ (ai_spawn_count "factory_1_sentinels_01_low") (ai_spawn_count "factory_1_sentinels_01_high")) 3.0)
                )
            )
        )
    )
)

(script dormant void factory_1_sentinel_respawn_02
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_factory_1_mid_02" (players)) true)
                        (< (ai_living_count "factory1_sentinels") 2)
                    )
                )
                (if (= (volume_test_objects "vol_factory_1_mid_02" (players)) false) 
                    (ai_place "factory_1_sentinels_02_low" 1) (sleep 120))
                (if (= (volume_test_objects "vol_factory_1_mid_02" (players)) false) 
                    (ai_place "factory_1_sentinels_02_high" 1) (sleep 120))
                (or
                    (= (volume_test_objects "vol_factory_1_mid_02" (players)) true)
                    (>= (+ (ai_spawn_count "factory_1_sentinels_02_low") (ai_spawn_count "factory_1_sentinels_02_high")) 6.0)
                )
            )
        )
    )
)

(script dormant void factory_1_sentinel_enders
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_factory_1_mid_03" (players)) true)
                        (< (ai_living_count "factory1_sentinels") 2)
                    )
                )
                (if (= (volume_test_objects "vol_factory_1_mid_03" (players)) false) 
                    (ai_place "factory_1_sentinels_03_low" 1) (sleep 120))
                (if (= (volume_test_objects "vol_factory_1_mid_03" (players)) false) 
                    (ai_place "factory_1_sentinels_03_high" 1) (sleep 120))
                (or
                    (= (volume_test_objects "vol_factory_1_mid_03" (players)) true)
                    (>= (+ (ai_spawn_count "factory_1_sentinels_03_low") (ai_spawn_count "factory_1_sentinels_03_high")) 6.0)
                )
            )
        )
    )
)

(script dormant void factory_1_flood_surge
    (begin
        (sleep_until (= (ai_living_count "factory_1_major") 0))
        (sleep_forever factory_1_flood_respawn)
        (ai_set_orders "factory1_flood" "factory_1_flood_tubes_fwd")
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_factory_1_mid_03" (players)) true)
                        (< (ai_nonswarm_count "factory1_flood") 3)
                    )
                )
                (if (= (volume_test_objects "vol_factory_1_mid_03" (players)) false) 
                    (ai_place "factory_1_flood_end" 1) (sleep 120))
                (if (= (volume_test_objects "vol_factory_1_mid_03" (players)) false) 
                    (ai_place "factory_1_flood_tubes_far" 1) (sleep 120))
                (if (= (volume_test_objects "vol_factory_1_mid_03" (players)) false) 
                    (ai_place "factory_1_flood_tubes_near" 1) (sleep 120))
                (if (= (volume_test_objects "vol_factory_1_mid_03" (players)) false) 
                    (ai_place "factory_1_flood_alcove" 1) (sleep 120))
                (or
                    (= (volume_test_objects "vol_factory_1_mid_03" (players)) true)
                    (>= (+ (ai_spawn_count "factory_1_flood_end") (ai_spawn_count "factory_1_flood_tubes_far") (ai_spawn_count "factory_1_flood_tubes_near") (ai_spawn_count "factory_1_flood_alcove")) 10.0)
                )
            )
        )
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_factory_1_exit" (players)) true)
                        (< (ai_nonswarm_count "factory1_flood") 2)
                    )
                )
                (if (= (volume_test_objects "vol_factory_1_exit" (players)) false) 
                    (ai_place "factory_1_flood_end" 1) (sleep 120))
                (or
                    (= (volume_test_objects "vol_factory_1_exit" (players)) true)
                    (>= (ai_spawn_count "factory_1_flood_end") 8)
                )
            )
        )
    )
)

(script dormant void sent_factory_1_start
    (begin
        (sleep_until (= (volume_test_objects "vol_factory_1_enter" (players)) true))
        (game_save_no_timeout)
        (ai_place "factory_1_sentinels_intro")
        (ai_place "factory_1_flood_intro")
        (ai_place "factory_1_major")
        (ai_place "factory_1_sentinels_initial_mid")
        (ai_place "factory_1_flood_initial_mid")
        (wake factory_1_flood_surge)
        (wake factory_1_flood_respawn)
        (wake factory_1_sentinel_respawn_01)
        (wake factory_1_sentinel_enders)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_factory_1_mid_01" (players)) true)
                (< (ai_nonswarm_count "factory1_enemies") 8)
            )
        )
        (game_saving)
        (ai_place "factory_1_sentinels_initial_end")
        (ai_place "factory_1_flood_initial_end")
        (sleep_until (= (volume_test_objects "vol_factory_1_mid_01" (players)) true))
        (game_save_no_timeout)
        (sleep_forever factory_1_sentinel_respawn_01)
        (wake factory_1_sentinel_respawn_02)
        (ai_renew "covenant")
        (sleep_until (= (volume_test_objects "vol_factory_1_mid_02" (players)) true))
        (game_save_no_timeout)
        (sleep_forever factory_1_sentinel_respawn_02)
        (sleep_until (= (volume_test_objects "vol_factory_1_mid_03" (players)) true))
        (game_save_no_timeout)
        (sleep_forever factory_1_sentinel_enders)
        (sleep_forever factory_1_flood_respawn)
        (sleep_until (= (volume_test_objects "vol_factory_1_exit" (players)) true))
        (game_save_no_timeout)
        (if (= (ai_living_count "factory_1_major") 1) 
            (sleep_forever factory_1_flood_surge))
    )
)

(script dormant void ai_sentinel_spawn
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "gorge_sen") 0))
                (sleep 150)
                (ai_place "gorge_sen")
                g_gorge_sen_spawn
            )
        )
    )
)

(script dormant void ai_gorge
    (begin
        (ai_place "gorge_flood_ini")
        (ai_place "gorge_enf")
        (wake ai_sentinel_spawn)
        (sleep_until (volume_test_objects "tv_gorge_mid" (players)))
        (game_saving)
        (ai_place "gorge_flood_bk")
        (sleep_until (volume_test_objects "tv_gorge_bk_cave" (players)))
        (ai_place "gorge_flood_bk_cave")
        (set g_gorge_sen_spawn true)
    )
)

(script dormant void ai_factory2
    (begin
        (ai_place "factory2_flood_ini")
        (sleep_until (volume_test_objects "tv_factory2_mid" (players)))
        (game_saving)
        (if (<= (ai_living_count "factory2_flood") 4) 
            (begin
                (ai_place "factory2_flood_mid")
                (ai_place "factory2_flood_bk")
            )
        )
        (sleep_until (volume_test_objects "tv_factory2_bk" (players)))
        (game_save_no_timeout)
        (ai_place "factory2_flood_bk_tunnel")
        (ai_place "factory2_sen_bk_tunnel")
    )
)

(script dormant void ai_constructor_flock
    (begin
        (flock_start "constructor_swarm")
        (sleep 150)
        (flock_stop "constructor_swarm")
    )
)

(script command_script void cs_ext_b_phantom
    (begin
        (cs_shoot true)
        (cs_enable_pathfinding_failsafe true)
        (ai_place "qz_ext_b_cov_spec_ops")
        (ai_place "qz_ext_b_cov_spectre")
        (object_cannot_die (ai_get_object "qz_ext_b_cov_spec_ops/soc") true)
        (sleep 1)
        (vehicle_load_magic v_ext_b_phantom phantom_p (ai_actors "qz_ext_b_cov_spec_ops"))
        (vehicle_load_magic v_ext_b_phantom phantom_sc01 (ai_vehicle_get_from_starting_location "qz_ext_b_cov_ghosts/a"))
        (vehicle_load_magic v_ext_b_phantom phantom_sc02 (ai_vehicle_get_from_starting_location "qz_ext_b_cov_ghosts/b"))
        (vehicle_load_magic v_ext_b_phantom phantom_lc (ai_vehicle_get_from_starting_location "qz_ext_b_cov_spectre/spectre"))
        (sleep 1)
        (cs_vehicle_boost true)
        (cs_fly_by qz_ext_b_phantom/p0 5.0)
        (cs_fly_by qz_ext_b_phantom/p1 5.0)
        (cs_vehicle_boost false)
        (ai_magically_see "qz_ext_b_wraith_a" "qz_ext_b_cov_phantom")
        (cs_fly_by qz_ext_b_phantom/p2 5.0)
        (cs_fly_by qz_ext_b_phantom/p3 3.0)
        (cs_fly_to qz_ext_b_phantom/p4)
        (cs_face true qz_ext_b_phantom/p2)
        (cs_vehicle_speed 0.65)
        (cs_fly_to_and_face qz_ext_b_phantom/drop qz_ext_b_phantom/p2)
        (object_set_phantom_power v_ext_b_phantom true)
        (sleep 45)
        (vehicle_unload v_ext_b_phantom phantom_sc)
        (vehicle_unload v_ext_b_phantom phantom_lc)
        (sleep 45)
        (vehicle_unload v_ext_b_phantom phantom_p_a01)
        (sleep 30)
        (vehicle_unload v_ext_b_phantom phantom_p_a02)
        (sleep 30)
        (vehicle_unload v_ext_b_phantom phantom_p_a03)
        (sleep 45)
        (object_set_phantom_power v_ext_b_phantom false)
        (ai_vehicle_enter "qz_ext_b_cov_spec_ops" (ai_vehicle_get_from_starting_location "qz_ext_b_cov_spectre/spectre"))
        (cs_face false qz_ext_b_phantom/p2)
        (cs_vehicle_speed 1.0)
        (sleep 60)
        (wake sc_ext_b)
        (cs_fly_by qz_ext_b_phantom/p2 3.0)
        (cs_fly_by qz_ext_b_phantom/p1 3.0)
        (cs_fly_by qz_ext_b_phantom/p0 3.0)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_ext_b_ent_phantom
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by qz_ext_b_ent_phantom/p0 5.0)
        (cs_fly_by qz_ext_b_ent_phantom/p1 5.0)
        (cs_fly_by qz_ext_b_ent_phantom/p2 5.0)
        (cs_vehicle_boost false)
        (cs_fly_to qz_ext_b_ent_phantom/p3)
        (cs_face true qz_ext_b_ent_phantom/p5)
        (cs_vehicle_speed 0.65)
        (cs_fly_to qz_ext_b_ent_phantom/drop)
        (sleep_until g_ext_b_ent_phantom)
        (cs_face false qz_ext_b_ent_phantom/p5)
        (cs_vehicle_speed 1.0)
        (cs_fly_by qz_ext_b_ent_phantom/p5 3.0)
        (cs_vehicle_boost true)
        (cs_fly_by qz_ext_b_ent_phantom/p6 3.0)
        (ai_erase ai_current_squad)
    )
)

(script dormant void ai_ext_b_exit_tube_a
    (begin
        (sleep_until (volume_test_objects "tv_ext_b_exit_tube_a" (players)))
        (ai_place "qz_ext_b_ent_flood_tube_a" (pin (- 8.0 (ai_nonswarm_count "ext_b_flood")) 0.0 6.0))
    )
)

(script dormant void ai_ext_b_exit_tube_b
    (begin
        (sleep_until (volume_test_objects "tv_ext_b_exit_tube_b" (players)))
        (ai_place "qz_ext_b_ent_flood_tube_b" (pin (- 8.0 (ai_nonswarm_count "ext_b_flood")) 0.0 6.0))
    )
)

(script dormant void ai_ext_b_enf_spawn
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "ext_b_sentinels_b") 0))
                (if (volume_test_objects "tv_ext_b_mid" (players)) 
                    (begin
                        (ai_place "qz_ext_b_enf_b")
                    ) (if true 
                        (begin
                            (ai_place "qz_ext_b_enf_a")
                        ) )
                )
                (or
                    (>= (ai_spawn_count "ext_b_sentinels_b") 4)
                    g_ext_b_enforcer
                )
            )
        )
    )
)

(script dormant void ai_ext_b_bk_ghost_spawn
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_ext_b_bk_ghost_limit 6)
                    (set g_ext_b_bk_ghost_number 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_ext_b_bk_ghost_limit 8)
                        (set g_ext_b_bk_ghost_number 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_ext_b_bk_ghost_limit 10)
                            (set g_ext_b_bk_ghost_number 3)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "qz_ext_b_ent_ghost_bk") 0))
                (sleep 90)
                (if debug 
                    (print "placing ghosts"))
                (ai_place "qz_ext_b_ent_ghost_bk" g_ext_b_bk_ghost_number)
                (or
                    (>= (ai_spawn_count "qz_ext_b_ent_ghost_bk") g_ext_b_bk_ghost_limit)
                    g_ext_b_bk_ghost_spawn
                )
            )
        )
    )
)

(script dormant void key_ride_door3_main
    (begin
        (print "key_ride_door3 begins to open")
        (device_set_position "key_ride_door3" 1.0)
        (sleep_until (>= (device_get_position "key_ride_door3") 0.9) 10)
        (sleep 60)
        (print "key_ride_door3 begins to close")
        (device_set_position "key_ride_door3" 0.0)
    )
)

(script dormant void key_ride_human_door2_main
    (begin
        (print "human_key_door2 begins to open")
        (device_set_position "human_key_door2" 1.0)
        (sleep_until (>= (device_get_position "human_key_door2") 0.9) 10)
        (print "human_key_door2 begins to close")
        (device_set_position "human_key_door2" 0.0)
    )
)

(script dormant void key_ride_door2_main
    (begin
        (print "key_ride_door2 begins to open")
        (device_set_position "key_ride_door2" 1.0)
        (sleep_until (>= (device_get_position "key_ride_door2") 0.9) 10)
        (print "key_ride_door2 begins to close")
        (device_set_position "key_ride_door2" 0.0)
    )
)

(script dormant void key_ride_door1_main
    (begin
        (print "key_ride_door1 begins to open")
        (device_set_position "key_ride_door1" 1.0)
        (sleep_until (>= (device_get_position "key_ride_door1") 0.9) 10)
        (sleep 60)
        (print "key_ride_door1 begins to close")
        (device_set_position "key_ride_door1" 0.0)
    )
)

(script dormant void key_ride_door0_main
    (begin
        (print "key_ride_door0 begins to open")
        (device_set_position_immediate "key_ride_door0" 0.32)
        (device_closes_automatically_set "key_ride_door0" false)
        (device_set_position "key_ride_door0" 1.0)
        (sleep_forever)
        (sleep_until (>= (device_get_position "key_ride_door0") 0.9) 10)
        (sleep 540)
        (print "key_ride_door0 begins to close")
        (device_set_position "key_ride_door0" 0.0)
    )
)

(script dormant void key_main
    (begin
        (wake key_ride_door0_main)
        (pvs_clear "key")
        (sound_looping_stop_immediately "sound\ambience\device_machines\shq__key\shq__key" none 1.0)
        (device_set_position_track "key" "track_horiz0" 0.0)
        (device_animate_position "key" 0.3 0.0 0.0 0.0 false)
        (sleep 5)
        (object_teleport (player0) "key_ent0")
        (object_teleport (player1) "key_ent1")
        (sleep 5)
        (device_animate_position "key" 0.6 75.0 0.0 0.0 false)
        (set g_key_started true)
        (sleep_until (>= (device_get_position "key") 0.35) 3)
        (wake key_ride_door0_main)
        (sleep_until (>= (device_get_position "key") 0.4) 3)
        (set g_key_lock0_first_loadpoint true)
        (set g_key_lock0_entered true)
        (sleep_until (>= (device_get_position "key") 0.43) 3)
        (set g_key_lock0_first_loadpoint true)
        (sleep_until (>= (device_get_position "key") 0.48) 3)
        (crash sen_hq_bsp_6)
        (sleep_until (>= (device_get_position "key") 0.5) 3)
        (set g_key_lock0_second_loadpoint true)
        (sleep_until (>= (device_get_position "key") 0.5) 3)
        (set g_key_lock0_begin_human true)
        (sleep_until (>= (device_get_position "key") 0.53) 3)
        (set g_key_lock0_door1 true)
        (wake key_ride_door1_main)
        (sleep_until (>= (device_get_position "key") 0.58) 3)
        (set g_key_cruise_entered true)
        (device_animate_position "key" 1.0 45.0 5.0 10.0 true)
        (sleep_until (>= (device_get_position "key") 0.67) 3)
        (set g_key_cruise_first_loadpoint true)
        (sleep_until (>= (device_get_position "key") 0.84) 3)
        (set g_key_cruise_halfway true)
        (sleep_until (>= (device_get_position "key") 1.0) 3)
        (set g_key_shaft_entered true)
        (sleep 30)
        (device_set_position_track "key" "track_rise" 0.0)
        (device_set_overlay_track "key" "overlay_transform")
        (sound_class_show_channel "sound\ambience\device_machines\shq__key\shq__key" true)
        (device_animate_overlay "key" 1.0 5.0 0.0 0.0)
        (sleep 180)
        (device_animate_position "key" 1.0 90.0 20.0 10.0 false)
        (set g_key_shaft_rising true)
        (set g_music_06b_06 true)
        (sleep_until (>= (device_get_position "key") 0.3) 3)
        (set g_key_shaft_near_exterior true)
        (sleep_until (>= (device_get_position "key") 0.73) 3)
        (wake key_ride_door2_main)
        (sleep_until (>= (device_get_position "key") 1.0) 3)
        (set g_key_lock1_entered true)
        (sound_looping_set_scale "sound\ambience\device_machines\shq__key\shq__key")
        (sleep 30)
        (device_set_position_track "key" "track_horiz1" 0.0)
        (sound_looping_stop_immediately "sound\ambience\device_machines\shq__key\shq__key" none 1.0)
        (device_animate_overlay "key" 0.0 5.0 0.0 0.0)
        (sleep 180)
        (device_animate_position "key" 1.0 75.0 10.0 10.0 false)
        (sleep_until (>= (device_get_position "key") 0.15) 3)
        (set g_key_lock1_first_arch true)
        (sleep_until (>= (device_get_position "key") 0.4) 3)
        (set g_key_lock1_second_arch true)
        (sleep_until (>= (device_get_position "key") 0.49) 3)
        (wake key_ride_door3_main)
        (sleep_until (>= (device_get_position "key") 0.65) 3)
        (set g_key_library_entered true)
        (sleep_until (>= (device_get_position "key") 0.85) 3)
        (device_animate_overlay "key" 1.0 5.0 0.0 0.0)
        (sleep_until (>= (device_get_position "key") 1.0) 3)
        (set g_key_library_arrival true)
        (wake chapter_familiar)
        (wake sc_dock)
        (set g_music_06b_05 false)
        (sound_looping_set_scale "sound\ambience\device_machines\shq__key\shq__key")
    )
)

(script dormant void key_ride_human_key_main
    (begin
        (sleep_until g_key_lock0_begin_human 10)
        (object_create_anew "key_human")
        (pvs_clear "key_human")
        (device_set_position_track "key_human" "track_horiz0" 0.0)
        (device_animate_position "key_human" 0.58 0.5 0.0 0.0 false)
        (sleep 15)
        (device_animate_position "key_human" 1.0 55.0 5.0 10.0 false)
        (sleep_until (>= (device_get_position "key_human") 1.0) 3)
        (sleep 30)
        (device_set_position_track "key_human" "track_rise" 0.0)
        (device_set_overlay_track "key_human" "overlay_transform")
        (device_animate_overlay "key_human" 1.0 5.0 0.0 0.0)
        (sleep 180)
        (device_animate_position "key_human" 1.0 80.0 20.0 10.0 false)
        (sleep_until (>= (device_get_position "key_human") 0.71) 3)
        (wake key_ride_human_door2_main)
        (sleep_until (>= (device_get_position "key_human") 1.0) 3)
        (sleep 120)
        (device_set_position_track "key_human" "track_horiz1" 0.0)
        (device_animate_overlay "key_human" 0.0 5.0 0.0 0.0)
        (sleep 180)
        (device_animate_position "key_human" 1.0 75.0 10.0 10.0 false)
        (sleep_until (>= (device_get_position "key_human") 0.191) 3)
        (object_destroy "key_human")
        (object_create_anew "key_docked")
        (sleep 1)
        (device_set_overlay_track "key_docked" "overlay_transform")
        (device_animate_overlay "key_docked" 1.0 0.1 0.0 0.0)
    )
)

(script command_script void cs_e21_tartarus
    (begin
        (cs_enable_pathfinding_failsafe true)
        (print "e21 *tartarus returns from harassing human key*")
        (cs_vehicle_boost true)
        (cs_fly_by e21_tartarus/p0)
        (cs_vehicle_boost false)
        (print "e21 *tartarus follows the key in through the door*")
        (cs_fly_by e21_tartarus/p1)
        (cs_vehicle_speed 0.75)
        (cs_enable_pathfinding_failsafe false)
        (sleep_until 
            (begin
                (cs_fly_by key_bsp5/left)
                false
            ) 
        3 300)
        (cs_vehicle_speed 0.85)
        (cs_face true e22_tartarus_bsp6/forward_facing)
        (sleep_until 
            (begin
                (cs_fly_by key_bsp5/center)
                false
            ) 
        3 300)
    )
)

(script command_script void cs_e22_tartarus
    (begin
        (cs_face false e22_tartarus_bsp6/forward_facing)
        (cs_fly_by e22_tartarus/p0)
        (cs_fly_by e22_tartarus/p1)
        (cs_vehicle_boost true)
        (cs_fly_by e22_tartarus/p2)
        (cs_vehicle_boost false)
        (cs_fly_to e22_tartarus/p3 1.0)
        (sleep 50)
        (cs_face true e22_tartarus_bsp6/forward_facing)
        (cs_vehicle_speed 0.9)
        (cs_fly_by key_bsp6/center_front)
        (cs_vehicle_speed 0.9)
        (sleep_until 
            (begin
                (cs_fly_by key_bsp6/center_front 1.0)
                false
            ) 
        3)
    )
)

(script command_script void cs_e23_tartarus
    (begin
        (cs_vehicle_speed 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by e23_tartarus/p0)
        (cs_fly_by e23_tartarus/p1)
        (cs_vehicle_boost false)
        (cs_fly_by e23_tartarus/p2)
        (cs_vehicle_speed 1.0)
        (sleep_until 
            (begin
                (cs_fly_by key_human_bsp6/left_high 1.0)
                false
            ) 
        3 360)
        (cs_teleport e23_tartarus/teleport_dest e23_tartarus/teleport_facing)
        (sleep_forever)
    )
)

(script command_script void cs_e24_tartarus
    (begin
        (sleep 200)
        (cs_vehicle_speed 0.6)
        (cs_fly_by e24_tartarus/p0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by e24_tartarus/p1)
        (cs_fly_by e24_tartarus/p2)
        (sleep_forever)
    )
)

(script command_script void cs_e25_tartarus
    (begin
        (sleep 120)
        (cs_face true e25_tartarus/p0)
        (sleep 60)
        (cs_face false e25_tartarus/p0)
        (cs_vehicle_speed 0.6)
        (cs_fly_by e25_tartarus/p0)
        (cs_vehicle_speed 1.0)
        (cs_fly_to e25_tartarus/p1 1.0)
        (cs_face true e25_tartarus/p1_facing)
        (sleep 320)
        (cs_face false e25_tartarus/p1_facing)
        (cs_vehicle_speed 1.0)
        (cs_fly_by key_bsp6/center 1.0)
        (cs_vehicle_speed 0.9)
        (sleep_until 
            (begin
                (cs_fly_by key_bsp6/center 1.0)
                false
            ) 
        3)
    )
)

(script command_script void cs_e26_tartarus
    (begin
        (cs_vehicle_speed 0.9)
        (sleep_until 
            (begin
                (cs_fly_by key_bsp6/center 1.0)
                false
            ) 
        3 210)
        (cs_fly_to e26_tartarus/p0)
        (sleep 120)
        (cs_fly_by e26_tartarus/p1)
        (cs_fly_by e26_tartarus/p2)
        (ai_erase ai_current_squad)
    )
)

(script dormant void key_ride_tartarus_main
    (begin
        (ai_place "key_ride_tartarus")
        (cs_run_command_script "key_ride_tartarus/tartarus" cs_e21_tartarus)
        (sleep_until (= (version) 4) 10)
        (cs_run_command_script "key_ride_tartarus/tartarus" cs_e22_tartarus)
        (sleep_until g_key_cruise_entered 10)
        (cs_run_command_script "key_ride_tartarus/tartarus" cs_e23_tartarus)
        (sleep_until g_key_shaft_near_exterior 10)
        (cs_run_command_script "key_ride_tartarus/tartarus" cs_e24_tartarus)
        (sleep_until g_key_lock1_entered 10)
        (cs_run_command_script "key_ride_tartarus/tartarus" cs_e25_tartarus)
        (sleep_until g_key_library_entered 10)
        (cs_run_command_script "key_ride_tartarus/tartarus" cs_e26_tartarus)
    )
)

(script static void key_ride_test
    (begin
        (wake key_main)
        (wake key_ride_human_key_main)
        (wake key_ride_tartarus_main)
    )
)

(script command_script void cs_e26_fld_infections_entry3
    (begin
        (cs_abort_on_damage true)
        (sleep 30)
        (cs_go_to e26_fld_infection_forms0/p2)
        (cs_go_to e26_fld_infection_forms0/p3)
        (cs_go_to e26_fld_infection_forms0/p4)
        (cs_go_to e26_fld_infection_forms0/p5)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e26_fld_infections_entry2
    (begin
        (cs_abort_on_damage true)
        (sleep 30)
        (cs_go_to e26_fld_infection_forms0/p6)
        (cs_go_to e26_fld_infection_forms0/p7)
        (cs_go_to e26_fld_infection_forms0/p2)
        (cs_go_to e26_fld_infection_forms0/p3)
        (cs_go_to e26_fld_infection_forms0/p4)
        (cs_go_to e26_fld_infection_forms0/p5)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e26_fld_infections_entry1
    (begin
        (cs_abort_on_damage true)
        (sleep 30)
        (cs_go_to e26_fld_infection_forms0/p8)
        (cs_go_to e26_fld_infection_forms0/p7)
        (cs_go_to e26_fld_infection_forms0/p2)
        (cs_go_to e26_fld_infection_forms0/p3)
        (cs_go_to e26_fld_infection_forms0/p4)
        (cs_go_to e26_fld_infection_forms0/p5)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e26_fld_infections_entry0
    (begin
        (cs_abort_on_damage true)
        (sleep 30)
        (cs_go_to e26_fld_infection_forms0/p0)
        (cs_go_to e26_fld_infection_forms0/p1)
        (cs_go_to e26_fld_infection_forms0/p2)
        (cs_go_to e26_fld_infection_forms0/p3)
        (cs_go_to e26_fld_infection_forms0/p4)
        (cs_go_to e26_fld_infection_forms0/p5)
        (ai_erase ai_current_actor)
    )
)

(script dormant void e26_smg1
    (begin
        (object_create "e26_smg1")
        (sleep_until 
            (begin
                (weapon_hold_trigger "e26_smg1" 0 true)
                (sleep_until g_e26_ended 2 (random_range 15 45))
                (weapon_hold_trigger "e26_smg1" 0 false)
                (sleep_until g_e26_ended 2 (random_range 45 90))
                g_e26_ended
            ) 
        1)
        (weapon_hold_trigger "e26_smg1" 0 false)
        (object_destroy "e26_smg1")
    )
)

(script dormant void e26_smg0
    (begin
        (object_create "e26_smg0")
        (sleep_until 
            (begin
                (weapon_hold_trigger "e26_smg0" 0 true)
                (sleep_until g_e26_ended 2 (random_range 15 45))
                (weapon_hold_trigger "e26_smg0" 0 false)
                (sleep_until g_e26_ended 2 (random_range 45 90))
                g_e26_ended
            ) 
        1)
        (weapon_hold_trigger "e26_smg0" 0 false)
        (object_destroy "e26_smg0")
    )
)

(script dormant void e26_fld_infections_main
    (begin
        (ai_place "e26_fld_infection_forms0/swarm0")
        (sleep_until (< (objects_distance_to_flag (players) "e26_fld_infs0_1") 10.0) 10 300)
        (ai_place "e26_fld_infection_forms0/swarm1")
        (sleep_until (< (objects_distance_to_flag (players) "e26_fld_infs0_2") 10.0) 10 300)
        (ai_place "e26_fld_infection_forms0/swarm2")
        (sleep_until (< (objects_distance_to_flag (players) "e26_fld_infs0_3") 10.0) 10 300)
        (ai_place "e26_fld_infection_forms0/swarm3")
    )
)

(script dormant void e26_main
    (begin
        (sleep_until (volume_test_objects "tv_e26_main_begin" (players)) 10)
        (data_mine_insert "enc_e26")
        (set g_e26_started true)
        (print "e26_main")
        (game_save_no_timeout)
        (wake e26_fld_infections_main)
        (wake e26_smg0)
        (wake e26_smg1)
        (sleep_until 
            (or
                (volume_test_objects "tv_mission_end0" (players))
                (volume_test_objects "tv_mission_end1" (players))
            ) 
        10)
        (set g_e26_ended true)
    )
)

(script command_script void cs_e25_scene3
    (begin
        (cs_switch "elite1")
        (cs_start_to e25_scenes/p1)
        (cs_switch "elite0")
        (cs_start_to e25_scenes/p0)
        (sleep_until 
            (or
                (not (cs_moving))
                (and
                    (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                    (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0)
                )
            )
        )
        (cs_face_player true)
        (cs_approach (ai_get_object ai_current_actor) 1.0 1.0 1.0)
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0)
            )
        )
        (print "elite0: we'll guard the key")
        (sleep (ai_play_line_at_player ai_current_actor "0910"))
        (sleep 20)
        (cs_switch "elite1")
        (sleep_until 
            (or
                (not (cs_moving))
                (and
                    (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                    (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0)
                )
            )
        )
        (cs_face_player true)
        (cs_approach (ai_get_object ai_current_actor) 1.0 1.0 1.0)
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0)
            )
        )
        (print "elite1: git to werk")
        (sleep (ai_play_line_at_player ai_current_actor "0920"))
    )
)

(script command_script void cs_e25_scene1
    (begin
        (cs_start_to e25_scenes/p0)
        (sleep_until 
            (or
                (not (cs_moving))
                (and
                    (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                    (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0)
                )
            )
        )
        (cs_face_player true)
        (cs_approach (ai_get_object ai_current_actor) 1.0 1.0 1.0)
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0)
            )
        )
        (print "elite0: we'll guard the key")
        (sleep (ai_play_line_at_player ai_current_actor "0910"))
        (sleep 15)
        (print "elite0: get the icon")
        (sleep (ai_play_line_at_player ai_current_actor "0920"))
    )
)

(script command_script void cs_e25_scene0
    (begin
        (print "elite: behold, the library")
        (sleep (ai_play_line ai_current_actor "0890"))
    )
)

(script dormant void e25_dialogue
    (begin
        (sleep_until (ai_scene "e25_scene0" cs_e25_scene0 "e21_cov_inf0") 5 300)
        (sleep 120)
        (ai_play_line_on_object none "0900")
        (sleep_until g_key_library_arrival 10)
        (if (>= (ai_living_count "e21_cov_inf0") 2) 
            (begin
                (sleep_until (ai_scene "e25_scene3" cs_e25_scene3 "e21_cov_inf0") 5)
            ) (begin
                (sleep_until (ai_scene "e25_scene1" cs_e25_scene1 "e21_cov_inf0") 5)
            )
        )
    )
)

(script dormant void e25_fld_inf1_main
    (begin
        (sleep_until g_key_lock1_second_arch 10)
        (ai_place "e25_fld_inf1_0")
        (sleep 60)
        (ai_place "e25_fld_inf1_1")
        (sleep 60)
        (ai_place "e25_fld_inf1_2")
    )
)

(script dormant void e25_fld_inf0_main
    (begin
        (sleep_until g_key_lock1_first_arch 10)
        (ai_place "e25_fld_inf0_0")
        (sleep 60)
        (ai_place "e25_fld_inf0_1")
        (sleep 60)
        (ai_place "e25_fld_inf0_2")
    )
)

(script dormant void e25_main
    (begin
        (data_mine_insert "enc_e25")
        (sleep_until g_key_lock1_entered 10)
        (set g_e25_started true)
        (print "e25_main")
        (game_save_no_timeout)
        (wake e26_main)
        (wake e25_dialogue)
        (sleep_until g_e26_started)
        (sleep_forever e25_fld_inf0_main)
        (sleep_forever e25_fld_inf1_main)
    )
)

(script command_script void cs_e24_fld_inf1_load
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_face_object true "key")
        (sleep 210)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (cs_face_object false "key")
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (if (= (random_range 0 2) 0) 
            (begin
                (cs_go_to e24_fld_inf1_load/p0_0)
                (cs_go_to e24_fld_inf1_load/p0_1)
            ) (begin
                (cs_go_to e24_fld_inf1_load/p1_0)
                (cs_go_to e24_fld_inf1_load/p1_1)
            )
        )
        (cs_jump_to_point 3.0 1.0)
        (ai_migrate ai_current_actor "e21_fld_inf0_0")
        (sleep 150)
        (object_can_take_damage (ai_get_object ai_current_actor))
    )
)

(script dormant void e24_fld_inf2_main
    (begin
        (sleep_until g_key_shaft_entered 10)
    )
)

(script dormant void e24_fld_inf1_main
    (begin
        (sleep_until g_key_shaft_rising 10)
        (ai_place "e24_fld_inf1_1")
    )
)

(script dormant void e24_fld_inf0_main
    (begin
        (sleep_until g_key_shaft_entered 10)
    )
)

(script dormant void e24_main
    (begin
        (sleep_until g_key_shaft_entered 10)
        (data_mine_insert "enc_e24")
        (set g_e24_started true)
        (print "e24_main")
        (game_save_no_timeout)
        (wake e25_main)
        (sleep_until g_e25_started)
        (sleep_forever e24_fld_inf0_main)
        (sleep_forever e24_fld_inf1_main)
        (sleep_forever e24_fld_inf2_main)
    )
)

(script command_script void cs_e23_fld_inf0_0_load
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to e23_fld_inf0_load/p0_0)
        (cs_go_to e23_fld_inf0_load/p0_1)
        (cs_jump 15.0 3.0)
    )
)

(script command_script void cs_e23_fld_inf0_1_load
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to e23_fld_inf0_load/p1_0)
        (cs_go_to e23_fld_inf0_load/p1_1)
        (cs_jump 15.0 3.0)
    )
)

(script command_script void cs_e23_scene0
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_switch "elite0")
        (print "dog: the fool...")
        (sleep (ai_play_line ai_current_actor "0810"))
        (sleep 15)
        (cs_switch "elite1")
        (print "scl: on the bright side...")
        (sleep (ai_play_line ai_current_actor "0820"))
    )
)

(script dormant void e23_dialogue
    (begin
        (sleep 90)
        (print "tartarus: humans! i'll deal with them!")
        (sleep (ai_play_line_on_object none "0800"))
        (sleep 30)
        (sleep_until (ai_scene "e23_scene0" cs_e23_scene0 "e21_cov_inf0") 10 90)
    )
)

(script dormant void e23_fld_inf0_main
    (begin
        (sleep_until g_key_cruise_first_loadpoint 10)
        (ai_place "e23_fld_inf0")
        (sleep_until g_key_cruise_halfway 10)
        (sleep 90)
        (ai_set_orders "e23_fld_inf0_0" "e23_fld_inf0_engage")
        (ai_set_orders "e23_fld_inf0_1" "e23_fld_inf0_engage")
        (cs_run_command_script "e23_fld_inf0_0" cs_e23_fld_inf0_0_load)
        (cs_run_command_script "e23_fld_inf0_1" cs_e23_fld_inf0_1_load)
    )
)

(script dormant void e23_main
    (begin
        (data_mine_insert "enc_e23")
        (sleep_until g_key_cruise_entered 10)
        (set g_e23_started true)
        (print "e23_main")
        (game_save_no_timeout)
        (wake e24_main)
        (wake e23_dialogue)
        (sleep_until g_e24_started)
        (sleep_forever e23_fld_inf0_main)
    )
)

(script static void test_key_ride2
    (begin
        (device_set_position_immediate "key" 0.26)
        (sleep 1)
        (object_teleport (player0) "e23_test")
        (object_set_velocity (player0) 1.0 0.0 0.0)
        (wake key_main)
        (wake e23_main)
        (sleep 3)
        (device_set_position_immediate "key" 0.26)
        (device_set_position "key" 1.0)
    )
)

(script command_script void cs_e22_hack_divide
    (begin
        (if (< (ai_living_count "e22_cov_inf1_0") 2) 
            (ai_migrate ai_current_actor "e22_cov_inf1_0") (ai_migrate ai_current_actor "e22_cov_inf1_1"))
    )
)

(script command_script void cs_e22_fld_inf0_0_load
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_face_object true "key")
        (sleep_until g_key_lock0_second_loadpoint 1)
        (sleep 95)
        (cs_face_object false "key")
        (unit_impervious ai_current_actor true)
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (if (= (random_range 0 2) 0) 
            (begin
                (cs_go_to e22_fld_inf0_load/p0_0)
                (cs_go_to e22_fld_inf0_load/p0_1)
            ) (begin
                (cs_go_to e22_fld_inf0_load/p1_0)
                (cs_go_to e22_fld_inf0_load/p1_1)
            )
        )
        (cs_move_in_direction 0.0 1.0 0.0)
        (unit_impervious ai_current_actor false)
        (ai_migrate ai_current_actor "e21_fld_inf0_0")
    )
)

(script command_script void cs_e22_scene0
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_switch "elite0")
        (print "scl: what courage...")
        (sleep (ai_play_line ai_current_actor "0780"))
        (sleep 15)
        (cs_switch "elite1")
        (print "dog: ignore him...")
        (sleep (ai_play_line ai_current_actor "0790"))
    )
)

(script dormant void e22_dialogue
    (begin
        (sleep_until (= (version) 4))
        (sleep 90)
        (print "tartarus: i will thin their ranks")
        (sleep (ai_play_line_on_object none "0770"))
        (sleep 30)
        (sleep_until (ai_scene "e22_scene0" cs_e22_scene0 "e21_cov_inf0") 10 90)
    )
)

(script dormant void e22_fld_inf0_main
    (begin
        (sleep_until g_key_lock0_first_loadpoint 10)
        (ai_place "e22_fld_inf0")
    )
)

(script dormant void e22_main
    (begin
        (sleep_until g_key_lock0_entered 10)
        (data_mine_insert "enc_e22")
        (set g_e22_started true)
        (print "e22_main")
        (game_save_no_timeout)
        (wake e23_main)
        (wake e22_fld_inf0_main)
        (wake e22_dialogue)
        (sleep_until g_e23_started)
        (sleep_forever e22_fld_inf0_main)
    )
)

(script command_script void cs_e21_fld_inf1_low_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_move_in_direction 6.0 0.0 0.0)
        (if (= (version) 3) 
            (begin
                (cs_go_to e21_fld_bsp5/p2)
                (cs_abort_on_combat_status ai_combat_status_clear_los)
                (cs_go_to e21_fld_bsp5/p1_0)
                (cs_go_to e21_fld_bsp5/p1_1)
            ) (begin
                (cs_go_to e21_fld_bsp6/p2)
                (cs_abort_on_combat_status ai_combat_status_clear_los)
                (cs_go_to e21_fld_bsp6/p1_0)
                (cs_go_to e21_fld_bsp6/p1_1)
            )
        )
    )
)

(script command_script void cs_e21_fld_inf1_high_entry
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_pathfinding_failsafe true)
        (if (= (version) 3) 
            (begin
                (cs_go_to e21_fld_bsp5/p1_0)
                (cs_go_to e21_fld_bsp5/p1_1)
            ) (begin
                (cs_go_to e21_fld_bsp6/p1_0)
                (cs_go_to e21_fld_bsp6/p1_1)
            )
        )
    )
)

(script command_script void cs_e21_fld_inf0_low_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_move_in_direction 6.0 0.0 0.0)
        (if (= (version) 3) 
            (begin
                (cs_go_to e21_fld_bsp5/p2)
                (cs_abort_on_combat_status ai_combat_status_clear_los)
                (cs_go_to e21_fld_bsp5/p0_0)
                (cs_go_to e21_fld_bsp5/p0_1)
            ) (begin
                (cs_go_to e21_fld_bsp6/p2)
                (cs_abort_on_combat_status ai_combat_status_clear_los)
                (cs_go_to e21_fld_bsp6/p0_0)
                (cs_go_to e21_fld_bsp6/p0_1)
            )
        )
    )
)

(script command_script void cs_e21_fld_inf0_high_entry
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_pathfinding_failsafe true)
        (if (= (version) 3) 
            (begin
                (cs_go_to e21_fld_bsp5/p0_0)
                (cs_go_to e21_fld_bsp5/p0_1)
            ) (begin
                (cs_go_to e21_fld_bsp6/p0_0)
                (cs_go_to e21_fld_bsp6/p0_1)
            )
        )
    )
)

(script command_script void cs_e21_fld_inf0_0_load
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (sleep_until g_key_lock0_first_loadpoint 1)
        (sleep 30)
        (cs_shoot_point true key_bsp5/p0)
        (sleep 148)
        (cs_shoot_point false key_bsp5/p0)
        (ai_set_orders ai_current_squad "e21_fld_inf0_engage0")
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e21_fld_load/left0)
        (cs_go_to e21_fld_load/left1)
        (cs_move_in_direction 0.0 1.0 0.0)
    )
)

(script command_script void cs_e21_scene0
    (begin
        (print "elite: i grow restless without a target")
        (sleep (ai_play_line_at_player ai_current_actor "0730"))
    )
)

(script command_script void cs_e21_scene1
    (begin
        (print "elite: look, up ahead! the parasite readies")
        (ai_play_line_at_player ai_current_actor "0760")
        (sleep 20)
        (cs_go_to_nearest e21_scene1_points)
        (cs_face true e21_fld_load/p0)
        (cs_aim true e21_fld_load/p0)
        (sleep_until g_key_lock0_first_loadpoint 5)
        (cs_shoot_point true e21_fld_load/p0)
        (sleep 90)
    )
)

(script static boolean e21_in_bsp4
    (begin
        (= (version) 4)
    )
)

(script dormant void e21_fld_carriers1_main
    (begin
        (ai_migrate "e21_fld_carriers0" "e21_fld_carriers1")
        (sleep_until 
            (begin
                (if (< (ai_swarm_count "e21_fld_carriers1") 2) 
                    (ai_place "e21_fld_carriers1" 1))
                g_key_lock1_second_arch
            ) 
        90)
    )
)

(script static void e21_fld_inf1_spawn
    (begin
        (if (volume_test_objects "tv_key_near_lower_spawner" (players)) 
            (begin
                (if (volume_test_objects "tv_key_upper_left_side" (players)) 
                    (begin
                        (ai_place "e21_fld_inf1_2" 1)
                        (ai_migrate "e21_fld_inf1_2" "e21_fld_inf1_0")
                        (sleep 5)
                        (ai_magically_see_object "e21_fld_inf1_0" (player0))
                        (ai_magically_see_object "e21_fld_inf1_0" (player1))
                    ) (begin
                        (ai_place "e21_fld_inf0_2" 1)
                        (cs_run_command_script "e21_fld_inf0_2" cs_e21_fld_inf1_high_entry)
                        (ai_migrate "e21_fld_inf0_2" "e21_fld_inf1_0")
                        (sleep 5)
                        (ai_magically_see_object "e21_fld_inf1_0" (player0))
                        (ai_magically_see_object "e21_fld_inf1_0" (player1))
                    )
                )
            ) (begin
                (ai_place "e21_fld_inf1_1" 1)
                (ai_migrate "e21_fld_inf1_1" "e21_fld_inf1_0")
                (sleep 5)
                (ai_magically_see_object "e21_fld_inf1_0" (player0))
                (ai_magically_see_object "e21_fld_inf1_0" (player1))
            )
        )
    )
)

(script dormant void e21_fld_inf1_main
    (begin
        (ai_migrate "e21_fld_inf0" "e21_fld_inf1_0")
        (sleep_until 
            (begin
                (if (< (ai_nonswarm_count "e21_fld_inf1_0") 8) 
                    (sleep_until 
                        (begin
                            (e21_fld_inf1_spawn)
                            (or
                                (>= (ai_nonswarm_count "e21_fld_inf1_0") 8)
                                g_key_lock1_second_arch
                            )
                        ) 
                    60))
                g_key_lock1_second_arch
            ) 
        900)
    )
)

(script dormant void e21_fld_carriers0_main
    (begin
        (sleep_until (= (version) 4))
        (sleep_until 
            (begin
                (if (< (ai_nonswarm_count "e21_fld_carriers0") 2) 
                    (ai_place "e21_fld_carriers0" 1))
                g_key_shaft_rising
            ) 
        90)
        (wake e21_fld_carriers1_main)
    )
)

(script static void e21_fld_inf0_spawn
    (begin
        (if (volume_test_objects "tv_key_near_lower_spawner" (players)) 
            (begin
                (if (volume_test_objects "tv_key_upper_left_side" (players)) 
                    (begin
                        (ai_place "e21_fld_inf1_2" 1)
                        (cs_run_command_script "e21_fld_inf1_2" cs_e21_fld_inf0_high_entry)
                        (ai_migrate "e21_fld_inf1_2" "e21_fld_inf0_0")
                        (sleep 5)
                        (ai_magically_see_object "e21_fld_inf0_0" (player0))
                        (ai_magically_see_object "e21_fld_inf0_0" (player1))
                    ) (begin
                        (ai_place "e21_fld_inf0_2" 1)
                        (ai_migrate "e21_fld_inf0_2" "e21_fld_inf0_0")
                        (sleep 5)
                        (ai_magically_see_object "e21_fld_inf0_0" (player0))
                        (ai_magically_see_object "e21_fld_inf0_0" (player1))
                    )
                )
            ) (begin
                (ai_place "e21_fld_inf0_1" 1)
                (ai_migrate "e21_fld_inf0_1" "e21_fld_inf0_0")
                (sleep 5)
                (ai_magically_see_object "e21_fld_inf0_0" (player0))
                (ai_magically_see_object "e21_fld_inf0_0" (player1))
            )
        )
    )
)

(script dormant void e21_fld_inf0_main
    (begin
        (ai_place "e21_fld_inf0_0")
        (sleep_until (= (version) 4))
        (sleep_until 
            (begin
                (e21_fld_inf0_spawn)
                (or
                    (>= (ai_nonswarm_count "e21_fld_inf0_0") 8)
                    g_key_shaft_rising
                )
            )
        )
        (sleep_until 
            (begin
                (if (< (ai_nonswarm_count "e21_fld_inf0_0") 8) 
                    (sleep_until 
                        (begin
                            (e21_fld_inf0_spawn)
                            (or
                                (>= (ai_nonswarm_count "e21_fld_inf0_0") 8)
                                g_key_shaft_rising
                            )
                        ) 
                    60))
                g_key_shaft_rising
            ) 
        900)
        (wake e21_fld_inf1_main)
    )
)

(script dormant void e21_cov_inf0_main
    (begin
        (ai_place "e21_cov_inf0")
        (sleep 150)
        (sleep_until (ai_scene "e21_scene0" cs_e21_scene0 "e21_cov_inf0_1") 5 60)
        (sleep 300)
        (sleep_until (ai_scene "e21_scene1" cs_e21_scene1 "e21_cov_inf0_0") 5 60)
        (sleep_until g_key_lock0_first_loadpoint 5)
        (game_save_no_timeout)
        (ai_set_orders "e21_cov_inf0_0" "e21_cov_inf0_0_guard_left")
        (ai_set_orders "e21_cov_inf0_1" "e21_cov_inf0_1_advance_left")
        (sleep_until g_key_shaft_rising)
        (ai_set_orders "e21_cov_inf0_0" "e21_cov_inf0_0_guard_right")
        (ai_set_orders "e21_cov_inf0_1" "e21_cov_inf0_1_advance_right")
    )
)

(script dormant void e21_main
    (begin
        (sleep_until g_key_started 5)
        (data_mine_insert "enc_e21")
        (set g_e21_started true)
        (print "e21_main")
        (wake e22_main)
        (wake e21_cov_inf0_main)
        (wake e21_fld_inf0_main)
        (wake sc_outer_wall)
    )
)

(script static void test_key_ride
    (begin
        (crash sen_hq_bsp_5)
        (sleep 1)
        (object_teleport (player0) "key_ent0")
        (object_set_velocity (player0) 5.0 0.0 0.0)
        (object_teleport (player1) "key_ent1")
        (object_set_velocity (player1) 5.0 0.0 0.0)
        (wake key_main)
        (wake key_ride_human_key_main)
        (wake key_ride_tartarus_main)
        (wake e21_main)
    )
)

(script dormant void begin_key_ride_main
    (begin
        (wake e21_main)
        (wake key_main)
        (wake key_ride_human_key_main)
        (wake key_ride_tartarus_main)
    )
)

(script dormant void enc_cov_charge
    (begin
        (data_mine_insert "enc_cov_charge")
        (print "initialize covenant charge scripts")
        (game_save_no_timeout)
        (object_dynamic_simulation_disable "qz_cov_def_tower_pod_a" true)
        (object_dynamic_simulation_disable "qz_cov_def_tower_pod_b" true)
        (ai_place "qz_cov_def_phantom")
        (ai_place "qz_cov_def_spectre")
        (ai_place "qz_cov_def_ghosts")
        (ai_place "qz_cov_def_spec_ops")
        (wake sc_cov_charge)
        (sleep_until 
            (or
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_p_l" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_p_r" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_spectre/spectre") "spectre_g" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_ghosts/a") "ghost_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "qz_cov_def_ghosts/b") "ghost_d" (players))
            ) 
        10 (* 30.0 20.0))
        (set g_qz_cov_def_progress true)
        (sleep 30)
        (game_saving)
        (sleep 90)
        (ai_place "qz_cov_def_enforcer_a")
        (ai_place "qz_cov_def_sen_elim")
        (device_set_position "qz_door_a" 1.0)
        (sleep (* 30.0 2.0))
        (wake ext_a_vehicle_orders)
        (sleep_until (<= (ai_living_count "sentinels") 0))
        (sleep 30)
        (game_save_no_timeout)
        (ai_renew "covenant")
    )
)

(script dormant void enc_vehicle_int
    (begin
        (data_mine_insert "enc_vehicle_int")
        (print "initialize vehicle interior scripts")
        (game_save_no_timeout)
        (ai_renew "covenant")
        (ai_disposable "cov_def_sentinels" true)
        (ai_disposable "cov_def_enf" true)
        (set g_veh_int_migrate_a true)
        (set g_music_06b_01 true)
        (wake music_06b_01)
        (wake sc_qz_veh_int)
        (ai_place "veh_int_enf_a")
        (ai_place "veh_int_enf_b")
        (ai_place "veh_int_enf_d")
        (ai_place "veh_int_sen_elim_ini")
        (ai_place "veh_int_scorpion")
        (ai_place "veh_int_flood_ghosts_ini")
        (ai_place "veh_int_wraith/wraith")
        (ai_place "veh_int_hog_ab")
        (ai_place "veh_int_ghost_ab")
        (sleep 15)
        (device_operates_automatically_set "veh_int_door_a" true)
        (sleep_until (volume_test_objects "tv_veh_int_b" (players)))
        (game_save_no_timeout)
        (ai_renew "covenant")
        (set g_veh_int_migrate_b true)
        (wake ai_veh_int_ghost_spawn)
        (ai_place "veh_int_sen_elim_rt")
        (ai_place "veh_int_sen_elim_lt")
        (ai_magically_see "veh_int_wraith" "veh_int_sen")
        (ai_place "veh_int_flood_bk/runner")
        (sleep_until (volume_test_objects "tv_veh_int_c" (players)))
        (data_mine_insert "enc_vehicle_int_bk")
        (game_save_no_timeout)
        (set g_veh_int_migrate_c true)
        (wake sc_factory_approach)
        (ai_renew "covenant")
        (ai_place "veh_int_wraith/driver")
        (sleep_until (volume_test_objects "tv_veh_int_d" (players)))
        (set g_veh_int_migrate_d true)
        (set g_veh_int_ghost_spawn true)
        (ai_place "veh_int_flood_hog_bk")
    )
)

(script dormant void enc_qz_ext_a
    (begin
        (data_mine_insert "enc_qz_ext_a_dam")
        (print "initialize quarantine zone exterior a scripts")
        (game_save_no_timeout)
        (ai_renew "covenant")
        (ai_disposable "veh_int_flood" true)
        (ai_disposable "veh_int_sen" true)
        (set g_veh_int_migrate_e true)
        (set g_ext_a_dam_migrate_a true)
        (wake music_06b_02)
        (wake ai_ext_a_dam_enforcers)
        (device_set_position "qz_dam_door_a" 1.0)
        (ai_place "qz_ext_a_dam_enf/a")
        (ai_place "qz_ext_a_dam_human")
        (ai_place "qz_ext_a_dam_sen")
        (ai_place "qz_ext_a_dam_sen_elim")
        (ai_place "qz_ext_a_dam_flood_ini")
        (wake chapter_competition)
        (game_save_no_timeout)
        (ai_renew "covenant")
        (sleep_until (volume_test_objects "qz_ext_a_dam_b" (players)))
        (set g_ext_a_dam_migrate_b true)
        (ai_place "qz_ext_a_dam_flood_cliff_a")
        (ai_place "qz_ext_a_dam_flood_cliff_b")
        (sleep_until (volume_test_objects "tv_ext_a_a" (players)))
        (data_mine_insert "enc_qz_ext_a")
        (game_save_no_timeout)
        (ai_renew "covenant")
        (set g_ext_a_dam_enf true)
        (set g_ext_a_migrate_a true)
        (ai_disposable "ext_a_flood_dam_a" true)
        (ai_disposable "ext_a_flood_dam_b" true)
        (ai_disposable "ext_a_sen_dam_a" true)
        (ai_disposable "ext_a_sen_dam_b" true)
        (wake ai_qz_ext_a_wraiths)
        (ai_place "qz_ext_a_enf_a")
        (ai_place "qz_ext_a_flood_rocket")
        (if (<= (ai_living_count "covenant") 1) 
            (begin
                (wake sc_ext_a)
                (ai_place "qz_ext_a_phantom")
            )
        )
        (set v_ext_a_phantom (ai_vehicle_get_from_starting_location "qz_ext_a_phantom/phantom"))
        (sleep_until (volume_test_objects "tv_ext_a_b" (players)))
        (set g_ext_a_migrate_b true)
        (sleep_until (volume_test_objects "tv_ext_a_c" (players)))
        (game_saving)
        (ai_renew "covenant")
        (set g_ext_a_migrate_c true)
        (ai_place "qz_ext_a_flood_c")
        (ai_place "qz_ext_a_flood_c2")
        (ai_place "ext_a_flood_ghost_fr")
        (sleep_until (volume_test_objects "tv_ext_a_d" (players)))
        (set g_ext_a_migrate_d true)
        (wake ai_qz_ext_a_ghosts)
        (wake ai_qz_ext_a_d_spawn)
        (sleep_until (volume_test_objects "tv_ext_a_e" (players)))
        (game_save_no_timeout)
        (ai_renew "covenant")
        (set g_ext_a_migrate_e true)
        (set g_qz_ext_a_d_spawn false)
        (ai_place "ext_a_sen_elim_bk")
        (if (<= (ai_living_count "qz_ext_a_enf_bk") 0) 
            (ai_place "qz_ext_a_enf_bk"))
        (sleep_until (volume_test_objects "tv_ext_a_ghosts_off" (players)))
        (set g_qz_ext_a_flood_ghosts true)
        (sleep_until (volume_test_objects "tv_ext_a_f" (players)))
        (data_mine_insert "enc_ext_a_fact_ent")
        (game_saving)
        (set g_ext_a_migrate_f true)
        (set g_music_06b_02 true)
        (ai_renew "covenant")
        (ai_place "fact_ent_flood_scorpion")
        (ai_place "fact_ent_flood_wraith_b")
        (wake ai_fact_ent_sen_spawn)
        (wake ai_fact_ent_enf_spawn)
        (sleep_until (volume_test_objects "tv_ext_a_fact_ent" (players)))
        (set g_ext_a_fact_ent_migrate true)
    )
)

(script dormant void enc_crashed_factory
    (begin
        (data_mine_insert "enc_crashed_factory_a")
        (game_save_no_timeout)
        (ai_renew "covenant")
        (ai_disposable "ext_a_flood" true)
        (ai_disposable "ext_a_sen" true)
        (set g_music_06b_02 false)
        (set g_music_06b_03 true)
        (set g_fact_ent_sen_spawn true)
        (wake music_06b_03)
        (wake sent_factory_1_start)
        (sleep_until (= (volume_test_objects "vol_factory_1_exit" (players)) true))
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_gorge" (players)))
        (data_mine_insert "enc_crashed_factory_ext")
        (game_save_no_timeout)
        (ai_disposable "factory1_enemies" true)
        (set g_music_06b_03 false)
        (ai_set_orders "covenant" "cov_follow_gorge")
        (ai_renew "covenant")
        (wake ai_gorge)
        (sleep_until (volume_test_objects "tv_factory2_enter" (players)))
        (data_mine_insert "enc_crashed_factory_b")
        (game_save_no_timeout)
        (ai_disposable "gorge_enemies" true)
        (ai_set_orders "covenant" "cov_follow_factory2")
        (ai_renew "covenant")
        (wake ai_factory2)
    )
)

(script dormant void enc_qz_ext_b
    (begin
        (data_mine_insert "enc_ext_b_fact_exit")
        (print "initialize quarantine zone exterior b scripts")
        (game_saving)
        (ai_renew "covenant")
        (ai_disposable "factory2_enemies" true)
        (wake music_06b_04)
        (wake sc_factory_exit)
        (wake objective_push_clear)
        (wake objective_link_set)
        (wake ext_b_vehicle_orders)
        (ai_place "qz_ext_b_fact_scorpion")
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "qz_ext_b_fact_scorpion/scorpion") true)
        (ai_place "qz_ext_b_fact_wraith")
        (ai_place "qz_ext_b_fact_ghosts")
        (ai_place "qz_ext_b_fact_flood")
        (ai_place "qz_ext_b_fact_ghosts_spare")
        (ai_place "qz_ext_b_enf_a")
        (sleep_until (volume_test_objects "tv_ext_b_fact_mid" (players)))
        (game_save_no_timeout)
        (if (random_range 0 2) 
            (ai_place "qz_ext_b_fact_warthog") (ai_place "qz_ext_b_fact_ghost_bk"))
        (sleep_until 
            (or
                (and
                    (<= (ai_living_count "ext_b_flood_a") 0)
                    (<= (ai_living_count "ext_b_sentinels_a") 0)
                )
                (volume_test_objects "tv_ext_b_gate" (players))
            ) 
        5)
        (data_mine_insert "enc_qz_ext_b")
        (game_save_no_timeout)
        (ai_renew "covenant")
        (set g_ext_b_migrate_1 true)
        (wake ai_ext_b_enf_spawn)
        (set g_music_06b_04 true)
        (ai_place "qz_ext_b_cov_phantom")
        (ai_place "qz_ext_b_wraith_a")
        (ai_place "qz_ext_b_wraith_b")
        (ai_place "qz_ext_b_ghosts_a" (pin (- 7.0 (ai_living_count "ext_b_flood")) 0.0 2.0))
        (ai_place "qz_ext_b_warthog")
        (set v_ext_b_phantom (ai_vehicle_get_from_starting_location "qz_ext_b_cov_phantom/phantom"))
        (sleep_until 
            (or
                (and
                    (<= (ai_living_count "ext_b_flood_b") 0)
                    (<= (ai_living_count "ext_b_sentinels_b") 0)
                )
                (volume_test_objects "tv_ext_b_mid" (players))
            ) 
        5)
        (game_saving)
        (ai_renew "covenant")
        (set g_ext_b_migrate_2 true)
        (ai_place "qz_ext_b_ghosts_b")
        (ai_place "qz_ext_b_warthog_gauss")
        (sleep_until (volume_test_objects "tv_ext_b_back" (players)) 5)
        (data_mine_insert "enc_qz_ext_b_bk")
        (game_saving)
        (ai_renew "covenant")
        (ai_disposable "ext_b_flood" true)
        (ai_disposable "ext_b_sentinels" true)
        (set g_ext_b_migrate_3 true)
        (set g_ext_b_enforcer true)
        (wake ai_constructor_flock)
        (wake ai_ext_b_bk_ghost_spawn)
        (ai_place "qz_ext_b_ent_enf")
        (ai_place "qz_ext_b_ent_scorpion")
        (ai_place "qz_ext_b_ent_wraith_a")
        (sleep_until (volume_test_objects "tv_ext_b_exit" (players)) 5)
        (data_mine_insert "enc_qz_ext_b_exit")
        (game_save_no_timeout)
        (ai_renew "covenant")
        (set g_ext_b_bk_ghost_spawn true)
        (set g_ext_b_migrate_4 true)
        (wake ai_ext_b_exit_tube_a)
        (wake ai_ext_b_exit_tube_b)
        (ai_place "qz_ext_b_ent_turrets")
        (sleep_until 
            (or
                (and
                    (<= (ai_living_count "ext_b_flood_d") 0)
                    (<= (ai_living_count "ext_b_sentinels_d") 0)
                )
                (volume_test_objects "tv_ext_b_exit_door" (players))
            ) 
        5)
        (game_saving)
        (ai_renew "covenant")
        (set g_ext_b_migrate_5 true)
        (ai_place "qz_ext_b_ent_flood_bk" (pin (- 8.0 (ai_nonswarm_count "ext_b_flood")) 0.0 6.0))
    )
)

(script dormant void enc_key_ride
    (begin
        (print "initialize key ride scripts")
        (ai_renew "covenant")
        (wake music_06b_05)
        (wake music_06b_06)
        (wake music_06b_07)
        (sleep_until (volume_test_objects "tv_key_ride_cinematic" (players)))
        (cinematic_fade_to_white)
        (ai_erase_all)
        (object_teleport (player0) "key_ride_a")
        (object_teleport (player1) "key_ride_b")
        (sleep 5)
        (if (= g_play_cinematics true) 
            (begin
                (if (cinematic_skip_start) 
                    (begin
                        (print "c06_intra2")
                        (c06_intra2)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (wake begin_key_ride_main)
        (sleep 25)
        (game_reverted)
        (wake chapter_gallery)
        (wake objective_link_clear)
        (wake objective_retrieve_set)
        (ai_renew "covenant")
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white)
    )
)

(script dormant void enc_library
    (begin
        (print "initialize library scripts")
        (game_save_no_timeout)
        (game_save_no_timeout)
        (ai_renew "covenant")
    )
)

(script dormant void mission_floodzone
    (begin
        (cinematic_snap_to_white)
        (structure_bsp_index 0)
        (if (= g_play_cinematics true) 
            (begin
                (if (cinematic_skip_start) 
                    (begin
                        (print "c06_intra1")
                        (c06_intra1)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (sleep 2)
        (object_teleport (player0) "player0_start")
        (object_teleport (player1) "player1_start")
        (wake enc_cov_charge)
        (if (difficulty_legendary) 
            (wake ice_cream_superman))
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white_bars)
        (wake chapter_mirror)
        (wake objective_push_set)
        (sleep_until (volume_test_objects "tv_vehicle_int" (players)))
        (wake enc_vehicle_int)
        (sleep_until (volume_test_objects "tv_qz_ext_a" (players)))
        (wake enc_qz_ext_a)
        (sleep_until (volume_test_objects "tv_factory" (players)))
        (wake enc_crashed_factory)
        (sleep_until (volume_test_objects "tv_qz_ext_b" (players)))
        (wake enc_qz_ext_b)
        (sleep_until (volume_test_objects "tv_key_ride" (players)))
        (wake enc_key_ride)
        (sleep_until (volume_test_objects "tv_x07" (players)))
        (cinematic_fade_to_white)
        (ai_erase_all)
        (object_teleport (player0) "player0_end")
        (object_teleport (player1) "player1_end")
        (if (cinematic_skip_start) 
            (begin
                (print "x07")
                (x07)
            )
        )
        (cinematic_skip_stop)
        (playtest_mission)
        (game_revert)
    )
)

(script static void start
    (begin
        (wake mission_floodzone)
    )
)

(script startup void mission_main
    (begin
        (ai_allegiance covenant player)
        (ai_allegiance player covenant)
        (ai_allegiance prophet player)
        (ai_allegiance player prophet)
        (ai_allegiance covenant prophet)
        (ai_allegiance prophet covenant)
        (if (> (player_count) 0) 
            (start))
    )
)

(script static void test
    (begin
        (set g_play_cinematics false)
        (device_set_position "qz_door_a" 1.0)
        (device_set_position "veh_int_door_a" 1.0)
        (device_set_position "veh_int_door_b" 1.0)
        (device_set_position "qz_dam_door_a" 1.0)
        (ai_place "qz_cov_def_spectre")
        (ai_place "qz_cov_def_ghosts")
        (ai_place "qz_cov_def_spec_ops")
        (wake ext_a_vehicle_orders)
        (wake dam_door_a)
        (wake dam_door_b)
        (sleep 90)
        (set g_qz_cov_def_progress true)
    )
)

(script static void test_ext_a_phantom
    (begin
        (ai_place "qz_ext_a_phantom")
        (set v_ext_a_phantom (ai_vehicle_get_from_starting_location "qz_ext_a_phantom/phantom"))
    )
)

(script static void test_ext_b_phantom
    (begin
        (ai_place "qz_ext_b_cov_phantom")
        (set v_ext_b_phantom (ai_vehicle_get_from_starting_location "qz_ext_b_cov_phantom/phantom"))
    )
)

(script dormant void 06_intra1_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 14 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 12 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 10 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 20 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 36 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 7 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 8 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 17 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 22 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 27 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 29 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 32 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 35 true)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 12)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_watchtower\cov_watchtower_base\cov_watchtower_base" 2)
        (sleep 8)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 1 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 23 true)
        (sleep 31)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 58)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 59)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 60)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 61)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 62)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 63)
        (predict_lightmap_bucket "objects\vehicles\spectre\turrets\plasma\plasma" 10)
        (sleep 148)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 1 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 21 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 5 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 9 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 20 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 8 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 18 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 6 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 2 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 3 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 6 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 11 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 15 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 20 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 28 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 17 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 25 true)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_sentinel\door_sentinel" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_watchtower\cov_watchtower_pod\cov_watchtower_pod" 2)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_watchtower\cov_watchtower_base\cov_watchtower_base" 2)
        (sleep 148)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 58)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 59)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 60)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 61)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 62)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 63)
        (predict_lightmap_bucket "objects\vehicles\spectre\turrets\plasma\plasma" 10)
        (sleep 20)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 29 true)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 1)
        (sleep 67)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 27 true)
        (sleep 140)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 18 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 11 true)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (sleep 6)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 20 false)
        (sleep 24)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 32 true)
        (sleep 79)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 5 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 28 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 25 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 17 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 27 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 29 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 16 true)
        (sleep 27)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_watchtower\cov_watchtower_base\cov_watchtower_base" 2)
        (sleep 45)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 58)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 59)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 60)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 61)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 62)
        (predict_lightmap_bucket "objects\vehicles\spectre\spectre" 63)
        (predict_lightmap_bucket "objects\vehicles\spectre\turrets\plasma\plasma" 10)
        (sleep 10)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_2 11 true)
    )
)

(script dormant void 06_intra2_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 10 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 9 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 8 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 11 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 0 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 0 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 1 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 2 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 3 true)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\key_cine\key_cine" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\mtdoom\mtdoom" 7)
        (sleep 138)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 6)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 89)
        (predict_lightmap_bucket "objects\characters\elite\elite" 4)
        (predict_lightmap_bucket "objects\characters\elite\elite" 5)
        (predict_lightmap_bucket "objects\characters\elite\elite" 6)
        (sleep 23)
        (predict_lightmap_bucket "objects\characters\elite\elite" 8)
        (predict_lightmap_bucket "objects\characters\elite\elite" 9)
        (predict_lightmap_bucket "objects\characters\elite\elite" 10)
        (sleep 27)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 0 true)
        (sleep 47)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (sleep 90)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 9 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 8 false)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 5)
        (sleep 103)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 0 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 4 true)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad\inamberclad" 0)
        (sleep 99)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel\door_key_tunnel" 0)
    )
)

(script dormant void 06_intra2_02_predict
    (begin
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\elite\elite" 8)
        (predict_lightmap_bucket "objects\characters\elite\elite" 9)
        (predict_lightmap_bucket "objects\characters\elite\elite" 10)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 6)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel_rusted\door_key_tunnel_rusted" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 22)
        (predict_lightmap_bucket "objects\characters\elite\elite" 16)
        (predict_lightmap_bucket "objects\characters\elite\elite" 17)
        (predict_lightmap_bucket "objects\characters\elite\elite" 18)
        (sleep 45)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 3)
        (sleep 14)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel_rusted\door_key_tunnel_rusted" 0)
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 2)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (sleep 14)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 9 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 8 false)
        (sleep 82)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 4)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 5)
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 2)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 3)
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\elite\elite" 16)
        (predict_lightmap_bucket "objects\characters\elite\elite" 17)
        (predict_lightmap_bucket "objects\characters\elite\elite" 18)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (sleep 6)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 13)
        (predict_lightmap_bucket "objects\characters\elite\elite" 8)
        (predict_lightmap_bucket "objects\characters\elite\elite" 9)
        (predict_lightmap_bucket "objects\characters\elite\elite" 10)
        (sleep 13)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (sleep 74)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 9 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 8 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 11 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 0 false)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (sleep 123)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 4 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel\door_key_tunnel" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel_rusted\door_key_tunnel_rusted" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 115)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 0 true)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad\inamberclad" 0)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel\door_key_tunnel" 0)
    )
)

(script dormant void 06_intra2_03_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 9 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 8 false)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (sleep 34)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (sleep 116)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 8)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 4 true)
        (sleep 82)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 1 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 12 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 3 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 6 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_5 7 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel_rusted\door_key_tunnel_rusted" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\gas_container\gas_container" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_key_tunnel\door_key_tunnel" 0)
        (sleep 536)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 75 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 59 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 66 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 73 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 1 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 31 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 76 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 0 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 1 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 2 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 31 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 34 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 35 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 29 true)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 7)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 8)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 9)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 10)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\firstwall\firstwall" 11)
    )
)

(script dormant void x07_01_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 28 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 7 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 18 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 19 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 20 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 37 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 38 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 39 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 40 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 41 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\key\key" 0)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 16 true)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_full\index_full" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture\tentacle_capture" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture\tentacle_capture" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 16 true)
        (sleep 5)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 16 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 16 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 16 true)
        (sleep 151)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 135)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 60)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 6 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 9 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
    )
)

(script dormant void x07_02_predict
    (begin
        (sleep 4)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 22 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 22 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 8 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (sleep 57)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 86)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (sleep 148)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 37)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 22 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 22 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 8 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 49)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (sleep 21)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (sleep 41)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 8 true)
        (sleep 79)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 40 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 42 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 41 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 6 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 9 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 11 true)
        (sleep 55)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
    )
)

(script dormant void x07_03_predict
    (begin
        (sleep 5)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (sleep 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 2)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (sleep 99)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 2)
        (sleep 94)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 86)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 125)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 36)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (sleep 49)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (sleep 36)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (sleep 9)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 14)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (sleep 20)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 20)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (sleep 16)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 30)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (sleep 103)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (sleep 29)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 false)
        (sleep 12)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 5)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 5)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (sleep 30)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
    )
)

(script dormant void x07_04_predict
    (begin
        (sleep 4)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 38)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (sleep 10)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 5)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (sleep 20)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (sleep 11)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 6)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 19)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (sleep 44)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 20)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 46)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (sleep 5)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (sleep 57)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 22 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 13)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 false)
        (sleep 56)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 18)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 34)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 183)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 66)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
    )
)

(script dormant void x07_05_predict
    (begin
        (sleep 9)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\weapons\support_low\brute_shot\brute_shot" 2)
        (sleep 113)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 94)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 7 false)
        (sleep 6)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (sleep 65)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 13)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 45)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (sleep 66)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 10)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (sleep 54)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (sleep 13)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (sleep 16)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
    )
)

(script dormant void x07_06_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (sleep 95)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (sleep 89)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (sleep 104)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 63)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 27 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 5 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 true)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
        (sleep 28)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 4 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 10 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 19)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 40 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 42 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 41 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 6 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 9 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 11 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (sleep 147)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 28 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 21 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 22 false)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 3 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 17 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 18 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 19 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 20 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 25 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 26 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 36 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 38 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 39 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 40 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 41 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 24 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 12 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 23 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 22 true)
        (predict_bitmap scenarios\solo\06b_floodzone\sen_hq_bsp_6 8 true)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\library_blocker\library_blocker" 0)
    )
)

(script static void tele_vehicle_int
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 1)
        (print "teleporting players...")
        (object_teleport (player0) "vehicle_int_a")
        (object_teleport (player1) "vehicle_int_b")
        (cinematic_start 0.0 0.0 0.0 60)
        (print "erasing ai...")
        (ai_erase_all)
        (sleep 5)
        (print "initializing area scripts...")
        (wake enc_vehicle_int)
        (sleep 10)
        (player_flashlight_on true)
        (sleep_until (volume_test_objects "tv_qz_ext_a" (players)))
        (wake enc_qz_ext_a)
        (sleep_until (volume_test_objects "tv_factory" (players)))
        (wake enc_crashed_factory)
        (sleep_until (volume_test_objects "tv_qz_ext_b" (players)))
        (wake enc_qz_ext_b)
        (sleep_until (volume_test_objects "tv_key_ride" (players)))
        (wake enc_key_ride)
        (sleep_until (volume_test_objects "tv_x07" (players)))
        (if (cinematic_skip_start) 
            (begin
                (print "x07")
                (x07)
            )
        )
        (cinematic_skip_stop)
        (game_revert)
    )
)

(script static void tele_ext_a
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 1)
        (print "teleporting players...")
        (object_teleport (player0) "qz_ext_a_a")
        (object_teleport (player1) "qz_ext_a_b")
        (cinematic_start 0.0 0.0 0.0 60)
        (print "erasing ai...")
        (ai_erase_all)
        (sleep 5)
        (print "initializing area scripts...")
        (wake enc_qz_ext_a)
        (sleep 10)
        (player_flashlight_on true)
        (sleep_until (volume_test_objects "tv_factory" (players)))
        (wake enc_crashed_factory)
        (sleep_until (volume_test_objects "tv_qz_ext_b" (players)))
        (wake enc_qz_ext_b)
        (sleep_until (volume_test_objects "tv_key_ride" (players)))
        (wake enc_key_ride)
        (sleep_until (volume_test_objects "tv_x07" (players)))
        (if (cinematic_skip_start) 
            (begin
                (print "x07")
                (x07)
            )
        )
        (cinematic_skip_stop)
        (game_revert)
    )
)

(script static void tele_factory_1
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 2)
        (print "teleporting players...")
        (object_teleport (player0) "factory1_a")
        (object_teleport (player1) "factory1_b")
        (cinematic_start 0.0 0.0 0.0 60)
        (print "erasing ai...")
        (ai_erase_all)
        (sleep 5)
        (print "initializing area scripts...")
        (wake enc_crashed_factory)
        (sleep 10)
        (player_flashlight_on true)
        (sleep_until (volume_test_objects "tv_qz_ext_b" (players)))
        (wake enc_qz_ext_b)
        (sleep_until (volume_test_objects "tv_key_ride" (players)))
        (wake enc_key_ride)
        (sleep_until (volume_test_objects "tv_x07" (players)))
        (if (cinematic_skip_start) 
            (begin
                (print "x07")
                (x07)
            )
        )
        (cinematic_skip_stop)
        (game_revert)
    )
)

(script static void tele_ext_b
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 2)
        (print "teleporting players...")
        (object_teleport (player0) "qz_ext_b_a")
        (object_teleport (player1) "qz_ext_b_b")
        (cinematic_start 0.0 0.0 0.0 60)
        (print "erasing ai...")
        (ai_erase_all)
        (sleep 5)
        (print "initializing area scripts...")
        (wake enc_qz_ext_b)
        (sleep 10)
        (player_flashlight_on true)
        (sleep_until (volume_test_objects "tv_key_ride" (players)))
        (wake enc_key_ride)
        (sleep_until (volume_test_objects "tv_x07" (players)))
        (if (cinematic_skip_start) 
            (begin
                (print "x07")
                (x07)
            )
        )
        (cinematic_skip_stop)
        (game_revert)
    )
)

(script static void tele_key
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 3)
        (print "teleporting players...")
        (object_teleport (player0) "key_ride_a")
        (object_teleport (player1) "key_ride_b")
        (cinematic_start 0.0 0.0 0.0 60)
        (print "erasing ai...")
        (ai_erase_all)
        (sleep 5)
        (print "initializing area scripts...")
        (wake enc_key_ride)
        (sleep 10)
        (player_flashlight_on true)
        (sleep_until (volume_test_objects "tv_x07" (players)))
        (if (cinematic_skip_start) 
            (begin
                (print "x07")
                (x07)
            )
        )
        (cinematic_skip_stop)
        (game_revert)
    )
)

(script static void tele_library
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 4)
        (print "teleporting players...")
        (object_teleport (player0) "library_a")
        (object_teleport (player1) "library_b")
        (cinematic_start 0.0 0.0 0.0 60)
        (print "erasing ai...")
        (ai_erase_all)
        (sleep 5)
        (print "initializing area scripts...")
        (sleep 10)
        (player_flashlight_on true)
        (sleep_until (volume_test_objects "tv_x07" (players)))
        (if (cinematic_skip_start) 
            (begin
                (print "x07")
                (x07)
            )
        )
        (cinematic_skip_stop)
        (game_revert)
    )
)

