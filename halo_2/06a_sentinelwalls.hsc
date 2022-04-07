; Decompiled with Blamite
; Source file: 06a_sentinelwalls.hsc
; Start time: 4/7/2022 7:17:19
; Decompilation finished in ~0.0140081s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean debug true)
(global boolean dialogue true)
(global boolean g_play_cinematics true)
(global short g_sleep_lower_bound 60)
(global short g_sleep_upper_bound 80)
(global short g_emitter_delay 180)
(global boolean g_cons_open_ins false)
(global boolean g_enc_insertion false)
(global boolean g_hall_a false)
(global boolean g_conduit_a false)
(global boolean g_hall_b false)
(global boolean g_plug_launch false)
(global boolean g_plug_landing false)
(global boolean g_hall_c false)
(global boolean g_ledge_a false)
(global boolean g_conduit_b false)
(global boolean g_ledge_b false)
(global boolean g_ledge_c false)
(global boolean g_qz_initial false)
(global boolean g_cov_defense false)
(global boolean g_music_06a_03 false)
(global boolean g_music_06a_04 false)
(global boolean g_music_06a_05 false)
(global boolean g_music_06a_06 false)
(global boolean g_music_06a_07 false)
(global boolean g_music_06a_08 true)
(global boolean g_music_06a_09 false)
(global boolean g_music_06a_10 true)
(global boolean g_plug_ride_enforcer false)
(global boolean g_hall_b_sen_dialogue false)
(global boolean g_enforcer false)
(global boolean g_final_lock false)
(global boolean g_flip_switch false)
(global short dialogue_pause 7)
(global boolean g_qz_cov_camp_progress false)
(global boolean g_sc_cov_camp_done false)
(global boolean g_piston_control false)
(global short piston_open_time 150)
(global boolean g_pussy_grunt false)
(global boolean g_insertion_spawn false)
(global boolean g_insertion_wave false)
(global short g_insertion_counter 0)
(global short g_insertion_index 0)
(global short g_insertion_limit 0)
(global boolean g_hall_a_loops false)
(global boolean g_hall_a_wave false)
(global short g_hall_a_em_count 0)
(global short g_hall_a_em_index 0)
(global short g_hall_a_sen_limit 0)
(global boolean g_cond_a_front false)
(global boolean g_cond_a_back false)
(global boolean g_cond_a_wave false)
(global short g_cond_a_count 0)
(global short g_cond_a_index 0)
(global short g_cond_a_limit 0)
(global short g_cond_a_bk_count 0)
(global short g_cond_a_bk_limit 0)
(global boolean g_cond_a_continue false)
(global boolean g_hall_b_loops false)
(global boolean g_hall_b_wave false)
(global short g_hall_b_em_count 0)
(global short g_hall_b_em_index 0)
(global short g_hall_b_sen_limit 0)
(global boolean g_plug_launch_loops false)
(global boolean g_plug_launch_wave false)
(global short g_plug_launch_count 0)
(global short g_plug_launch_index 0)
(global short g_plug_launch_limit 0)
(global boolean g_plug_launch_em_heroic false)
(global boolean g_plug_move false)
(global boolean g_lower_shield false)
(global boolean g_plugholder_progress false)
(global short g_plug_holder_wave_count 0)
(global short g_plug_holder_wave_limit 0)
(global boolean g_plug_holder_loops false)
(global boolean g_plug_holder_wave false)
(global short g_plug_holder_count 0)
(global short g_plug_holder_index 0)
(global short g_plug_holder_limit 0)
(global boolean g_plug_holder_bk_loops false)
(global boolean g_plug_holder_bk_wave false)
(global short g_plug_holder_bk_count 0)
(global short g_plug_holder_bk_index 0)
(global short g_plug_holder_bk_limit 0)
(global boolean g_plugholder_bk_spawn false)
(global short g_plugholder_bk_flood_count 0)
(global short g_plugholder_bk_flood_limit 0)
(global boolean g_plugholder_bk_a false)
(global boolean g_plugholder_bk_b false)
(global short g_hall_c_flood_count 0)
(global short g_hall_c_flood_index 20)
(global short g_ledge_a_player_loc 0)
(global boolean g_ledge_a_spawn false)
(global boolean g_ledge_a_loops false)
(global boolean g_ledge_a_wave false)
(global short g_ledge_a_sen_limit 0)
(global short g_ledge_a_count 0)
(global short g_ledge_a_index 0)
(global short cond_b_locator 0)
(global boolean cond_b_flood_a_spawn false)
(global boolean cond_b_flood_b_spawn false)
(global boolean cond_b_flood_c_spawn false)
(global short cond_b_flood_count 0)
(global short cond_b_flood_limit 4)
(global boolean ledge_c_spawn true)
(global short ledge_c_infec_count 0)
(global short ledge_c_infec_limit 3)
(global boolean g_ledge_c_phantom_start false)
(global boolean g_ledge_c_phantom_1 false)
(global boolean g_mortar_fire false)
(global boolean g_qz_ini_cave false)
(global boolean g_qz_cov_def_spawn true)
(global short g_qz_cov_def_limit 0)
(global short g_qz_cov_def_count 0)
(global short g_cov_def_flood_advance 2)
(global boolean g_qz_phantom false)


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

(script static void x06_01a_predict_stub
    (begin
        (wake x06_01a_predict)
    )
)

(script static void x06_01b_predict_stub
    (begin
        (wake x06_01b_predict)
    )
)

(script static void x06_02_predict_stub
    (begin
        (wake x06_02_predict)
    )
)

(script static void x06_03_predict_stub
    (begin
        (wake x06_03_predict)
    )
)

(script static void x06_04_predict_stub
    (begin
        (wake x06_04_predict)
    )
)

(script static void x06_05_predict_stub
    (begin
        (wake x06_05_predict)
    )
)

(script static void 06_intro_01_predict_stub
    (begin
        (wake 06_intro_01_predict)
    )
)

(script static void 06_intro_02_predict_stub
    (begin
        (wake 06_intro_02_predict)
    )
)

(script command_script void cs_brute_walk_01
    (begin
        (cs_movement_mode ai_movement_patrol)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to brute_targets/p0)
    )
)

(script command_script void cs_brute_walk_02
    (begin
        (cs_movement_mode ai_movement_patrol)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to brute_targets/p1)
    )
)

(script command_script void cs_elite_walk_01
    (begin
        (cs_movement_mode ai_movement_patrol)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to elite_targets/p0)
    )
)

(script command_script void cs_elite_walk_02
    (begin
        (cs_movement_mode ai_movement_patrol)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to elite_targets/p1)
    )
)

(script dormant void exchange_of_hats
    (begin
        (ai_allegiance covenant prophet)
        (sleep 210)
        (print "exchange of hats")
        (ai_place "brutes_01")
        (ai_place "brutes_02")
        (ai_place "elites_01")
        (ai_place "elites_02")
        (cs_run_command_script "brutes_01" cs_brute_walk_01)
        (cs_run_command_script "brutes_02" cs_brute_walk_02)
        (cs_run_command_script "elites_01" cs_elite_walk_01)
        (cs_run_command_script "elites_02" cs_elite_walk_02)
        (rasterizer_profile_include_all)
        (sleep 188)
        (ai_erase "brutes_01")
        (ai_erase "brutes_02")
        (ai_erase "elites_01")
        (ai_erase "elites_02")
        (object_destroy_containing "elite_hg_prop")
    )
)

(script dormant void x06_score_01a
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\music\x06_01_mus" none 1.0)
        (print "x06 score 01a start")
    )
)

(script dormant void x06_foley_01a
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\foley\x06_01a_fol" none 1.0)
        (print "x06 foley 01a start")
    )
)

(script dormant void x06_supratitle_01
    (begin
        (sleep 60)
        (cinematic_suppress_bsp_object_creation "cinematic_title0")
    )
)

(script dormant void cinematic_lighting_scene_01a
    (begin
        (cinematic_lighting_set_primary_light 3.0 234.0 0.28 0.28 0.39)
        (cinematic_lighting_set_secondary_light 21.0 96.0 0.38 0.33 0.27)
        (cinematic_lighting_set_ambient_light 0.05 0.05 0.05)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "dervish" true)
        (object_uses_cinematic_lighting "brute_02" true)
        (object_uses_cinematic_lighting "brute_03" true)
        (object_uses_cinematic_lighting "elite_hg_01" true)
        (object_uses_cinematic_lighting "elite_hg_02" true)
        (object_uses_cinematic_lighting "elite_hg_prop_01" true)
        (object_uses_cinematic_lighting "elite_hg_prop_02" true)
        (object_uses_cinematic_lighting "elite_hg_prop_03" true)
        (object_uses_cinematic_lighting "elite_hg_prop_04" true)
        (object_uses_cinematic_lighting "elite_hg_prop_05" true)
        (object_uses_cinematic_lighting "elite_hg_prop_06" true)
        (object_uses_cinematic_lighting "elite_hg_prop_07" true)
        (object_uses_cinematic_lighting "elite_hg_prop_08" true)
        (object_uses_cinematic_lighting "x06_helmet" true)
        (object_uses_cinematic_lighting "x06_pike_01" true)
        (object_uses_cinematic_lighting "x06_pike_02" true)
        (object_uses_cinematic_lighting "x06_pike_03" true)
        (object_uses_cinematic_lighting (ai_get_object "brutes_01") true)
        (object_uses_cinematic_lighting (ai_get_object "brutes_02") true)
        (object_uses_cinematic_lighting (ai_get_object "elites_01") true)
        (object_uses_cinematic_lighting (ai_get_object "elites_02") true)
    )
)

(script static void x06_01b_problem_actors
    (begin
        (print "create problem actors")
        (object_create_anew "brute_01")
        (object_create_anew "brute_hg_01")
        (object_create_anew "brute_hg_02")
        (object_create_anew "brute_hg_03")
        (object_cinematic_lod "brute_01" true)
        (object_cinematic_lod "brute_hg_01" true)
        (object_cinematic_lod "brute_hg_02" true)
        (object_cinematic_lod "brute_hg_03" true)
    )
)

(script static void x06_01a_setup
    (begin
        (object_create_anew "dervish")
        (object_create_anew "brute_02")
        (object_create_anew "brute_03")
        (object_create_anew "elite_hg_01")
        (object_create_anew "elite_hg_02")
        (object_create_anew_containing "elite_hg_prop")
        (object_create_anew "x06_helmet")
        (object_create_anew "x06_pike_01")
        (object_create_anew "x06_pike_02")
        (object_create_anew "x06_pike_03")
        (object_cinematic_lod "dervish" true)
        (object_cinematic_lod "brute_02" true)
        (object_cinematic_lod "brute_03" true)
        (object_cinematic_lod "elite_hg_01" true)
        (object_cinematic_lod "elite_hg_02" true)
        (object_cinematic_lod "x06_helmet" true)
        (object_cinematic_lod "x06_pike_01" true)
        (object_cinematic_lod "x06_pike_02" true)
        (object_cinematic_lod "x06_pike_03" true)
        (wake x06_score_01a)
        (wake x06_foley_01a)
        (wake cinematic_lighting_scene_01a)
        (wake x06_supratitle_01)
        (wake exchange_of_hats)
    )
)

(script static void x06_01a_cleanup
    (begin
        (object_destroy "elite_hg_01")
        (object_destroy "elite_hg_02")
        (object_destroy "brute_03")
        (object_destroy "brute_04")
    )
)

(script static void x06_scene_01a
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "sentinelwalls_1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (x06_01a_predict_stub)
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\music\x06_01_mus")
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\foley\x06_01a_fol")
        (sleep prediction_offset)
        (x06_01a_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x06\x06" "x06_01a" none "anchor_flag_x06")
        (custom_animation_relative "dervish" "objects\characters\dervish\x06\x06" "dervish_01a" false "anchor_x06")
        (custom_animation_relative "brute_02" "objects\characters\brute\x06\x06" "brute02_01a" false "anchor_x06")
        (custom_animation_relative "brute_03" "objects\characters\brute\x06\x06" "brute03_01a" false "anchor_x06")
        (custom_animation_relative "elite_hg_01" "objects\characters\elite\x06\x06" "elite_guard1_01a" false "anchor_x06")
        (custom_animation_relative "elite_hg_02" "objects\characters\elite\x06\x06" "elite_guard2_01a" false "anchor_x06")
        (scenery_animation_start_relative "x06_helmet" "objects\characters\brute\brute_honor_guard\brute_honor_helmet_scenery\x06\x06" "helmet01_01a" "anchor_x06")
        (scenery_animation_start_relative "x06_pike_01" "objects\weapons\melee\pike\x06\x06" "pike01_01a" "anchor_x06")
        (print "cache block")
        (sleep 1)
        (ui_error_ok)
        (cinematic_start 0.0 0.0 0.0 30)
        (sleep (- (camera_set_pan) prediction_offset))
        (x06_01b_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\foley\x06_01b_fol")
        (x06_01b_problem_actors)
        (sleep (camera_set_pan))
        (x06_01a_cleanup)
    )
)

(script command_script void cs_elite_walk_03
    (begin
        (cs_movement_mode ai_movement_patrol)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to elite_targets/p2)
    )
)

(script dormant void final_hg_walk
    (begin
        (ai_allegiance covenant prophet)
        (sleep 120)
        (print "final honor-guards")
        (ai_place "elites_03")
        (cs_run_command_script "elites_03" cs_elite_walk_03)
        (object_uses_cinematic_lighting (ai_get_object ai_current_actor) true)
    )
)

(script dormant void x06_foley_01b
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\foley\x06_01b_fol" none 1.0)
        (print "x06 foley 01b start")
    )
)

(script dormant void x06_01b_dof_1
    (begin
        (rasterizer_profile_include_all)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 45)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.0 1.0 0.0 0.5 1.0)
        (print "rack focus")
        (rasterizer_profile_include_all)
        (sleep 98)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void cinematic_lighting_scene_01b
    (begin
        (cinematic_lighting_set_primary_light 3.0 234.0 0.28 0.28 0.39)
        (cinematic_lighting_set_secondary_light 21.0 96.0 0.38 0.33 0.27)
        (cinematic_lighting_set_ambient_light 0.05 0.05 0.05)
        (object_uses_cinematic_lighting "brute_01" true)
        (object_uses_cinematic_lighting "brute_hg_01" true)
        (object_uses_cinematic_lighting "brute_hg_02" true)
        (object_uses_cinematic_lighting "brute_hg_03" true)
    )
)

(script dormant void x06_texture_camera_01b_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 143)
        (print "start texture camera")
        (object_create_anew "texture_camera")
        (object_create_anew "texture_space")
        (object_create_anew "texture_halo")
        (object_cinematic_lod "texture_halo" true)
        (object_uses_cinematic_lighting "texture_halo" true)
        (texture_camera_set_object_marker "texture_camera" "primary_trigger" 40.0)
        (sleep 156)
        (texture_camera_off)
        (print "stop texture camera")
    )
)

(script dormant void open_sanctum_door
    (begin
        (sleep 176)
        (print "open sanctum door")
        (device_set_position "sanctum_door" 1.0)
        (object_destroy_containing "offending_column")
        (print "destroy columns")
    )
)

(script static void x06_01b_setup
    (begin
        (wake x06_foley_01b)
        (wake final_hg_walk)
        (wake x06_texture_camera_01b_01)
        (wake open_sanctum_door)
        (wake cinematic_lighting_scene_01b)
        (wake x06_01b_dof_1)
    )
)

(script static void x06_01b_cleanup
    (begin
        (ai_erase "elites_03")
        (object_destroy "x06_helmet")
        (object_destroy "brute_01")
        (object_destroy "brute_02")
        (cinematic_set_far_clip_distance)
    )
)

(script static void x06_scene_01b
    (begin
        (x06_01b_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x06\x06" "x06_01b" none "anchor_flag_x06")
        (custom_animation_relative "dervish" "objects\characters\dervish\x06\x06" "dervish_01b" false "anchor_x06")
        (custom_animation_relative "brute_hg_01" "objects\characters\brute\x06\x06" "brute01_01b" false "anchor_x06")
        (custom_animation_relative "brute_hg_02" "objects\characters\brute\x06\x06" "brute02_01b" false "anchor_x06")
        (custom_animation_relative "brute_hg_03" "objects\characters\brute\x06\x06" "brute03_01b" false "anchor_x06")
        (custom_animation_relative "brute_01" "objects\characters\brute\x06\x06" "brute04_01b" false "anchor_x06")
        (custom_animation_relative "brute_02" "objects\characters\brute\x06\x06" "brute05_01b" false "anchor_x06")
        (scenery_animation_start_relative "x06_helmet" "objects\characters\brute\brute_honor_guard\brute_honor_helmet_scenery\x06\x06" "helmet01_01b" "anchor_x06")
        (scenery_animation_start_relative "x06_pike_01" "objects\weapons\melee\pike\x06\x06" "pike01_01b" "anchor_x06")
        (scenery_animation_start_relative "x06_pike_02" "objects\weapons\melee\pike\x06\x06" "pike02_01b" "anchor_x06")
        (scenery_animation_start_relative "x06_pike_03" "objects\weapons\melee\pike\x06\x06" "pike03_01b" "anchor_x06")
        (sleep (- (camera_set_pan) prediction_offset))
        (x06_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\foley\x06_02_fol")
        (sleep (camera_set_pan))
        (x06_01b_cleanup)
    )
)

(script dormant void x06_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\foley\x06_02_fol" none 1.0)
        (print "x06 foley 02 start")
    )
)

(script dormant void x06_0010_soc
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0010_soc" none 1.0)
        (attract_mode_set_seconds "x06_0010_soc" 3.0)
    )
)

(script dormant void x06_0020_pot
    (begin
        (sleep 92)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0020_pot" none 1.0)
        (attract_mode_set_seconds "x06_0020_pot" 2.0)
    )
)

(script dormant void x06_0030_soc
    (begin
        (sleep 168)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0030_soc" "commander" 1.0)
        (attract_mode_set_seconds "x06_0030_soc" 5.0)
    )
)

(script dormant void x06_0040_pot
    (begin
        (sleep 306)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0040_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0040_pot" 2.0)
    )
)

(script dormant void x06_0050_soc
    (begin
        (sleep 371)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0050_soc" "commander" 1.0)
        (attract_mode_set_seconds "x06_0050_soc" 5.0)
    )
)

(script dormant void x06_0060_pot
    (begin
        (sleep 520)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0060_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0060_pot" 8.0)
        (sleep 110)
        (unit_set_emotional_state "truth" "arrogant" 0.75 60)
    )
)

(script dormant void x06_0070_soc
    (begin
        (sleep 794)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0070_soc" "commander" 1.0)
        (attract_mode_set_seconds "x06_0070_soc" 3.0)
    )
)

(script dormant void cinematic_lighting_scene_02
    (begin
        (cinematic_lighting_set_primary_light 3.0 234.0 0.28 0.28 0.39)
        (cinematic_lighting_set_secondary_light 21.0 96.0 0.38 0.33 0.27)
        (cinematic_lighting_set_ambient_light 0.05 0.05 0.05)
        (object_uses_cinematic_lighting "truth" true)
        (object_uses_cinematic_lighting "mercy" true)
        (object_uses_cinematic_lighting "commander" true)
        (object_uses_cinematic_lighting "so_elite_01" true)
        (object_uses_cinematic_lighting "so_elite_02" true)
        (object_uses_cinematic_lighting "throne_truth" true)
        (object_uses_cinematic_lighting "throne_mercy" true)
    )
)

(script dormant void x06_texture_camera_02_01
    (begin
        (print "start texture camera")
        (object_create_anew "texture_camera")
        (object_create_anew "texture_space")
        (object_create_anew "texture_halo")
        (object_cinematic_lod "texture_halo" true)
        (object_uses_cinematic_lighting "texture_halo" true)
        (texture_camera_set_object_marker "texture_camera" "primary_trigger" 40.0)
    )
)

(script static void x06_02_setup
    (begin
        (object_create_anew "truth")
        (object_create_anew "mercy")
        (object_create_anew "commander")
        (object_create_anew "so_elite_01")
        (object_create_anew "so_elite_02")
        (object_create_anew "throne_truth")
        (object_create_anew "throne_mercy")
        (object_cinematic_lod "truth" true)
        (object_cinematic_lod "mercy" true)
        (object_cinematic_lod "commander" true)
        (object_cinematic_lod "so_elite_01" true)
        (object_cinematic_lod "so_elite_02" true)
        (object_cinematic_lod "throne_truth" true)
        (object_cinematic_lod "throne_mercy" true)
        (objects_attach "truth" "driver" "throne_truth" "driver_cinematic")
        (objects_attach "mercy" "driver" "throne_mercy" "driver_cinematic")
        (wake x06_foley_02)
        (wake x06_0010_soc)
        (wake x06_0020_pot)
        (wake x06_0030_soc)
        (wake x06_0040_pot)
        (wake x06_0050_soc)
        (wake x06_0060_pot)
        (wake x06_0070_soc)
        (wake cinematic_lighting_scene_02)
        (wake x06_texture_camera_02_01)
    )
)

(script static void x06_scene_02
    (begin
        (x06_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x06\x06" "x06_02" none "anchor_flag_x06")
        (custom_animation_relative "dervish" "objects\characters\dervish\x06\x06" "dervish_02" false "anchor_x06")
        (custom_animation_relative "truth" "objects\characters\prophet\x06\x06" "truth_02" false "anchor_x06")
        (custom_animation_relative "mercy" "objects\characters\prophet\x06\x06" "mercy_02" false "anchor_x06")
        (custom_animation_relative "commander" "objects\characters\elite\x06\x06" "commander_02" false "anchor_x06")
        (custom_animation_relative "so_elite_01" "objects\characters\elite\x06\x06" "elite1_02" false "anchor_x06")
        (custom_animation_relative "so_elite_02" "objects\characters\elite\x06\x06" "elite2_02" false "anchor_x06")
        (custom_animation_relative "brute_hg_01" "objects\characters\brute\x06\x06" "brute01_02" false "anchor_x06")
        (custom_animation_relative "brute_hg_02" "objects\characters\brute\x06\x06" "brute02_02" false "anchor_x06")
        (scenery_animation_start_relative "x06_pike_01" "objects\weapons\melee\pike\x06\x06" "pike01_02" "anchor_x06")
        (scenery_animation_start_relative "x06_pike_02" "objects\weapons\melee\pike\x06\x06" "pike02_02" "anchor_x06")
        (sleep (- (camera_set_pan) prediction_offset))
        (x06_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\foley\x06_03_fol")
        (sleep (camera_set_pan))
        (object_destroy_containing "x06_pike")
    )
)

(script dormant void x06_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\foley\x06_03_fol" none 1.0)
        (print "x06 foley 03 start")
    )
)

(script dormant void x06_0080_pot
    (begin
        (sleep 148)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0080_pot" none 1.0)
        (attract_mode_set_seconds "x06_0080_pot" 4.0)
    )
)

(script dormant void x06_0090_pot
    (begin
        (sleep 265)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0090_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0090_pot" 5.0)
    )
)

(script dormant void x06_0100_pot
    (begin
        (sleep 418)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0100_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0100_pot" 6.0)
        (sleep 78)
        (unit_set_emotional_state "truth" "annoyed" 0.75 60)
    )
)

(script dormant void x06_0110_der
    (begin
        (sleep 585)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0110_der" "dervish" 1.0)
        (attract_mode_set_seconds "x06_0110_der" 2.0)
    )
)

(script static void x06_03_setup
    (begin
        (wake x06_foley_03)
        (wake x06_0080_pot)
        (wake x06_0090_pot)
        (wake x06_0100_pot)
        (wake x06_0110_der)
    )
)

(script static void x06_03_cleanup
    (begin
        (object_destroy "commander")
        (object_destroy_containing "brute_hg")
        (object_destroy_containing "so_elite")
    )
)

(script static void x06_scene_03
    (begin
        (x06_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x06\x06" "x06_03" none "anchor_flag_x06")
        (custom_animation_relative "dervish" "objects\characters\dervish\x06\x06" "dervish_03" false "anchor_x06")
        (custom_animation_relative "truth" "objects\characters\prophet\x06\x06" "truth_03" false "anchor_x06")
        (custom_animation_relative "mercy" "objects\characters\prophet\x06\x06" "mercy_03" false "anchor_x06")
        (custom_animation_relative "commander" "objects\characters\elite\x06\x06" "commander_03" false "anchor_x06")
        (custom_animation_relative "so_elite_01" "objects\characters\elite\x06\x06" "elite1_03" false "anchor_x06")
        (custom_animation_relative "so_elite_02" "objects\characters\elite\x06\x06" "elite2_03" false "anchor_x06")
        (custom_animation_relative "brute_hg_01" "objects\characters\brute\x06\x06" "brute01_03" false "anchor_x06")
        (custom_animation_relative "brute_hg_02" "objects\characters\brute\x06\x06" "brute02_03" false "anchor_x06")
        (sleep (- (camera_set_pan) prediction_offset))
        (x06_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\music\x06_04_mus")
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\foley\x06_03_fol")
        (sleep (camera_set_pan))
        (x06_03_cleanup)
    )
)

(script dormant void x06_score_04
    (begin
        (sleep 274)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\music\x06_04_mus" none 1.0)
        (print "x06 score 04 start")
    )
)

(script dormant void x06_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\foley\x06_04_fol" none 1.0)
        (print "x06 foley 04 start")
    )
)

(script dormant void x06_0120_pot
    (begin
        (sleep 15)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0120_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0120_pot" 3.0)
    )
)

(script dormant void x06_0130_pom
    (begin
        (sleep 109)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0130_pom" "mercy" 1.0)
        (attract_mode_set_seconds "x06_0130_pom" 8.0)
    )
)

(script dormant void x06_0140_pot
    (begin
        (sleep 346)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0140_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0140_pot" 8.0)
    )
)

(script dormant void x06_0150_pot
    (begin
        (sleep 581)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0150_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0150_pot" 5.0)
    )
)

(script dormant void x06_0160_pom
    (begin
        (sleep 715)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0160_pom" "mercy" 1.0)
        (attract_mode_set_seconds "x06_0160_pom" 9.0)
        (sleep 150)
        (unit_set_emotional_state "mercy" "asleep" 0.75 60)
    )
)

(script dormant void x06_fov_01
    (begin
        (sleep 576)
        (camera_pan 60.0 0)
        (print "fov")
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void x06_04_dof_1
    (begin
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "dof")
        (sleep 103)
        (cinematic_screen_effect_set_crossfade2 0.8 0.5 0.0 1.0 0.0 0.5 1.0)
        (print "dof")
    )
)

(script dormant void x06_04_dof_2
    (begin
        (sleep 343)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "dof")
        (sleep 82)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.0 1.0 0.0 0.5 1.0)
        (print "dof")
    )
)

(script dormant void unhide_dervish
    (begin
        (rasterizer_profile_include_all)
        (sleep 576)
        (print "unhide dervish")
        (object_hide "dervish" false)
    )
)

(script static void x06_04_setup
    (begin
        (wake x06_score_04)
        (wake x06_foley_04)
        (wake x06_0120_pot)
        (wake x06_0130_pom)
        (wake x06_0140_pot)
        (wake x06_0150_pot)
        (wake x06_0160_pom)
        (object_hide "dervish" true)
        (wake unhide_dervish)
        (wake x06_fov_01)
        (wake x06_04_dof_1)
        (wake x06_04_dof_2)
    )
)

(script static void x06_scene_04
    (begin
        (x06_04_setup)
        (camera_pan 30.0 0)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x06\x06" "x06_04" none "anchor_flag_x06")
        (custom_animation_relative "dervish" "objects\characters\dervish\x06\x06" "dervish_04" false "anchor_x06")
        (custom_animation_relative "truth" "objects\characters\prophet\x06\x06" "truth_04" false "anchor_x06")
        (custom_animation_relative "mercy" "objects\characters\prophet\x06\x06" "mercy_04" false "anchor_x06")
        (sleep (- (camera_set_pan) prediction_offset))
        (x06_05_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\x06\foley\x06_05_fol")
        (sleep (camera_set_pan))
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void x06_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\x06\foley\x06_05_fol" none 1.0)
        (print "x06 foley 05 start")
    )
)

(script dormant void x06_0170_pot
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0170_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0170_pot" 9.0)
    )
)

(script dormant void x06_0180_pot
    (begin
        (sleep 276)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0180_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0180_pot" 3.0)
    )
)

(script dormant void x06_0190_pom
    (begin
        (sleep 366)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0190_pom" "mercy" 1.0)
        (attract_mode_set_seconds "x06_0190_pom" 9.0)
    )
)

(script dormant void x06_0200_pot
    (begin
        (sleep 635)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0200_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0200_pot" 5.0)
    )
)

(script dormant void x06_0210_pot
    (begin
        (sleep 780)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0210_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0210_pot" 4.0)
    )
)

(script dormant void x06_0220_pom
    (begin
        (sleep 889)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0220_pom" "mercy" 1.0)
        (attract_mode_set_seconds "x06_0220_pom" 3.0)
    )
)

(script dormant void x06_0230_pot
    (begin
        (sleep 956)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x06_0230_pot" "truth" 1.0)
        (attract_mode_set_seconds "x06_0230_pot" 3.0)
        (unit_set_emotional_state "truth" "happy" 0.5 60)
    )
)

(script dormant void x06_05_dof_1
    (begin
        (sleep 488)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.75 0.75 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 160)
        (cinematic_screen_effect_set_crossfade2 1.0 0.75 0.0 1.0 0.0 0.75 1.0)
        (print "rack focus")
    )
)

(script dormant void x06_05_dof_2
    (begin
        (sleep 777)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.75 1.0 0.75 0.0 1.0)
        (print "rack focus")
        (sleep 173)
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void x06_texture_camera_05_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 279)
        (print "stop texture camera")
        (texture_camera_off)
    )
)

(script dormant void monitor_sound
    (begin
        (sleep 281)
        (sound_class_enable_ducker "device" 1.0 60)
        (print "monitor sound up")
    )
)

(script static void x06_05_setup
    (begin
        (sound_class_enable_ducker "device" 0.0 0)
        (object_create_anew "monitor")
        (object_cinematic_lod "monitor" true)
        (object_set_function_variable "monitor" "talking" 0.0 0.0)
        (object_uses_cinematic_lighting "monitor" true)
        (object_create_anew "index_holo")
        (wake x06_foley_05)
        (wake x06_0170_pot)
        (wake x06_0180_pot)
        (wake x06_0190_pom)
        (wake x06_0200_pot)
        (wake x06_0210_pot)
        (wake x06_0220_pom)
        (wake x06_0230_pot)
        (wake monitor_sound)
        (wake x06_05_dof_1)
        (wake x06_05_dof_2)
        (wake x06_texture_camera_05_01)
    )
)

(script static void x06_05_cleanup
    (begin
        (object_destroy "dervish")
        (object_destroy_containing "truth")
        (object_destroy_containing "mercy")
        (object_destroy "monitor")
        (object_destroy "index_holo")
        (cinematic_set_far_clip_distance)
    )
)

(script static void x06_scene_05
    (begin
        (camera_pan 60.0 0)
        (x06_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x06\x06" "x06_05" none "anchor_flag_x06")
        (custom_animation_relative "dervish" "objects\characters\dervish\x06\x06" "dervish_05" false "anchor_x06")
        (custom_animation_relative "truth" "objects\characters\prophet\x06\x06" "truth_05" false "anchor_x06")
        (custom_animation_relative "mercy" "objects\characters\prophet\x06\x06" "mercy_05" false "anchor_x06")
        (custom_animation_relative "monitor" "objects\characters\monitor\x06\x06" "monitor_05" false "anchor_x06")
        (scenery_animation_start_relative "index_holo" "scenarios\objects\forerunner\industrial\index\index_alone\x06\x06" "index_alone_05" "anchor_x06")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 0.0 0.0 0.0 15)
        (sleep 15)
        (x06_05_cleanup)
    )
)

(script static void x06
    (begin
        (predict_model_section false)
        (sound_cache_flush)
        (animation_cache_flush)
        (crash high_8)
        (sleep 1)
        (x06_scene_01a)
        (x06_scene_01b)
        (x06_scene_02)
        (x06_scene_03)
        (x06_scene_04)
        (x06_scene_05)
    )
)

(script dormant void c06_intro_sound_scene1_01
    (begin
        (object_set_function_variable "phantom_01" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_01" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_01" "hover_audio" 1.0 0.0)
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (sound_class_enable_ducker "vehicle" 1.0 90)
        (sleep 90)
        (sound_class_enable_ducker "vehicle" 0.0 90)
    )
)

(script dormant void c06_intro_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intro\foley\c06_intro_01_fol" none 1.0)
        (print "c06_intro foley 01 start")
    )
)

(script dormant void c06_1010_tar
    (begin
        (sleep 144)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1010_tar" none 1.0)
        (attract_mode_set_seconds "c06_1010_tar" 1.0)
    )
)

(script dormant void c06_1020_tar
    (begin
        (sleep 191)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1020_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c06_1020_tar" 2.0)
    )
)

(script dormant void c06_1030_tar
    (begin
        (sleep 264)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1030_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c06_1030_tar" 3.0)
    )
)

(script dormant void c06_1040_der
    (begin
        (sleep 337)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1040_der" "dervish" 1.0)
        (attract_mode_set_seconds "c06_1040_der" 4.0)
    )
)

(script dormant void c06_1050_tar
    (begin
        (sleep 463)
        (sound_impulse_time "sound\dialog\levels\06_sentinelwall\cinematic\c06_1050_tar" none 1.0 "radio_covy_loop")
        (attract_mode_set_seconds "c06_1050_tar" 1.0)
    )
)

(script dormant void c06_1060_der
    (begin
        (sleep 507)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1060_der" "dervish" 1.0)
        (attract_mode_set_seconds "c06_1060_der" 1.0)
    )
)

(script dormant void c06_1070_tar
    (begin
        (sleep 550)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1070_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c06_1070_tar" 1.0)
        (sleep 35)
        (unit_set_emotional_state "tartarus" "inquisitive" 1.0 30)
    )
)

(script dormant void c06_1080_tar
    (begin
        (sleep 593)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1080_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c06_1080_tar" 1.0)
    )
)

(script dormant void c06_1090_tar
    (begin
        (sleep 623)
        (sound_impulse_time "sound\dialog\levels\06_sentinelwall\cinematic\c06_1090_tar" none 1.0 "radio_covy_loop")
        (attract_mode_set_seconds "c06_1090_tar" 1.0)
    )
)

(script dormant void c06_1100_der
    (begin
        (sleep 670)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\c06_1100_der" "dervish" 1.0)
        (attract_mode_set_seconds "c06_1100_der" 3.0)
    )
)

(script dormant void c06_1110_tar
    (begin
        (sleep 745)
        (sound_impulse_time "sound\dialog\levels\06_sentinelwall\cinematic\c06_1110_tar" none 1.0 "radio_covy_out")
        (attract_mode_set_seconds "c06_1110_tar" 3.0)
    )
)

(script dormant void camera_shake_01
    (begin
        (sleep 188)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
    )
)

(script dormant void cinematic_light_intro_scene_01
    (begin
        (cinematic_lighting_set_primary_light -20.0 282.0 0.21 0.29 0.37)
        (cinematic_lighting_set_secondary_light -59.0 306.0 0.34 0.58 0.65)
        (cinematic_lighting_set_ambient_light 0.07 0.05 0.08)
        (rasterizer_bloom_override_blur_amount false)
        (object_uses_cinematic_lighting "dervish" true)
        (object_uses_cinematic_lighting "tartarus" true)
        (object_uses_cinematic_lighting "brute_01" true)
        (object_uses_cinematic_lighting "brute_02" true)
        (object_uses_cinematic_lighting "brute_03" true)
        (object_uses_cinematic_lighting "brute_04" true)
        (object_uses_cinematic_lighting "phantom_01" true)
        (object_uses_cinematic_lighting "phantom_int" true)
        (object_uses_cinematic_lighting "carbine" true)
        (object_uses_cinematic_lighting "delta_halo" true)
    )
)

(script dormant void cinematic_light_phantom_int
    (begin
        (sleep 186)
        (print "light phantom")
        (cinematic_lighting_set_primary_light -90.0 0.0 0.23 0.29 0.53)
        (cinematic_lighting_set_secondary_light -90.0 192.0 0.16 0.1 0.19)
        (cinematic_lighting_set_ambient_light 0.07 0.05 0.08)
    )
)

(script dormant void c06_problem_actors_01
    (begin
        (print "problem actors")
        (object_create_anew "delta_halo")
        (object_create_anew "matte_substance")
        (object_create_anew "matte_stardust")
        (object_cinematic_lod "delta_halo" true)
        (object_cinematic_visibility "delta_halo" true)
    )
)

(script static void c06_intro_01_setup
    (begin
        (object_create_anew "dervish")
        (object_create_anew "tartarus")
        (object_create_anew "brute_01")
        (object_create_anew "brute_02")
        (object_create_anew "brute_03")
        (object_create_anew "brute_04")
        (object_create_anew "phantom_01")
        (object_create_anew "phantom_int")
        (object_create_anew "carbine")
        (object_cinematic_lod "dervish" true)
        (object_cinematic_lod "tartarus" true)
        (object_cinematic_lod "brute_01" true)
        (object_cinematic_lod "brute_02" true)
        (object_cinematic_lod "brute_03" true)
        (object_cinematic_lod "brute_04" true)
        (object_cinematic_lod "phantom_01" true)
        (object_cinematic_lod "phantom_int" true)
        (objects_attach "dervish" "right_hand_elite" "carbine" "")
        (wake c06_intro_sound_scene1_01)
        (wake c06_intro_foley_01)
        (wake c06_1010_tar)
        (wake c06_1020_tar)
        (wake c06_1030_tar)
        (wake c06_1040_der)
        (wake c06_1050_tar)
        (wake c06_1060_der)
        (wake c06_1070_tar)
        (wake c06_1080_tar)
        (wake c06_1090_tar)
        (wake c06_1100_der)
        (wake c06_1110_tar)
        (wake camera_shake_01)
        (wake cinematic_light_intro_scene_01)
        (wake cinematic_light_phantom_int)
    )
)

(script static void c06_intro_01_cleanup
    (begin
        (object_destroy "dervish")
        (object_destroy "tartarus")
        (object_destroy_containing "brute")
        (object_destroy "phantom_int")
        (object_destroy "delta_halo")
        (object_destroy "matte_substance")
        (object_destroy "matte_stardust")
        (hud_blink_health 0.0)
    )
)

(script static void c06_intro_scene_01
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "sentinelwalls_intro")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (06_intro_01_predict_stub)
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intro\foley\c06_intro_01_fol")
        (wake c06_problem_actors_01)
        (sleep prediction_offset)
        (camera_set_animation_relative "objects\characters\cinematic_camera\06_intro\06_intro" "06_intro_01" none "anchor_flag_intro")
        (c06_intro_01_setup)
        (custom_animation_relative "dervish" "objects\characters\dervish\06_intro\06_intro" "dervish_01" false "anchor_intro")
        (custom_animation_relative "tartarus" "objects\characters\brute\06_intro\06_intro" "tartarus_01" false "anchor_intro")
        (custom_animation_relative "brute_01" "objects\characters\brute\06_intro\06_intro" "brute01_01" false "anchor_intro")
        (custom_animation_relative "brute_02" "objects\characters\brute\06_intro\06_intro" "brute02_01" false "anchor_intro")
        (custom_animation_relative "brute_03" "objects\characters\brute\06_intro\06_intro" "brute03_01" false "anchor_intro")
        (custom_animation_relative "brute_04" "objects\characters\brute\06_intro\06_intro" "brute04_01" false "anchor_intro")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\06_intro\06_intro" "phantom_01" false "anchor_intro")
        (scenery_animation_start_relative "phantom_int" "objects\vehicles\phantom\cinematics\06_intro\06_intro" "phantom_int_01" "anchor_intro")
        (scenery_animation_start_relative "delta_halo" "scenarios\objects\forerunner\industrial\halo\06_intro\06_intro" "halo_01" "anchor_intro")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\06_intro\06_intro" "substance_01" "anchor_intro")
        (scenery_animation_start_relative "matte_stardust" "objects\cinematics\matte_paintings\high_charity_stardust\06_intro\06_intro" "stardust_01" "anchor_intro")
        (sleep 15)
        (cinematic_start 0.0 0.0 0.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (06_intro_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\06_sentinelwalls\c06_intro\foley\c06_intro_02_fol")
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_screen_effect_stop 2.0)
        (print "crossfade")
        (sleep (camera_set_pan))
        (c06_intro_01_cleanup)
    )
)

(script dormant void c06_intro_sound_scene2_01
    (begin
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (object_set_function_variable "phantom_02" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_02" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_02" "hover_audio" 1.0 0.0)
        (sound_class_enable_ducker "vehicle" 1.0 50)
        (sleep 50)
        (sound_class_enable_ducker "vehicle" 0.0 90)
    )
)

(script dormant void c06_intro_sound_scene2_02
    (begin
        (sleep 160)
        (sound_class_enable_ducker "vehicle" 1.0 30)
        (sleep 30)
        (object_set_function_variable "phantom_02" "engine_hack" 0.0 120.0)
        (object_set_function_variable "phantom_02" "engine_audio" 0.0 120.0)
        (object_set_function_variable "phantom_02" "hover_audio" 0.0 120.0)
        (sleep 60)
        (object_set_function_variable "phantom_02" "engine_hack" 1.0 90.0)
        (object_set_function_variable "phantom_02" "engine_audio" 1.0 90.0)
        (object_set_function_variable "phantom_02" "hover_audio" 1.0 90.0)
        (sound_class_enable_ducker "vehicle" 0.0 150)
    )
)

(script dormant void c06_intro_sound_scene2_03
    (begin
        (sleep 480)
        (sound_class_enable_ducker "vehicle" 1.0 60)
        (object_set_function_variable "intro_sen_maj" "engine_hack" 0.0 0.0)
        (object_set_function_variable "intro_sen_maj" "engine_audio" 0.0 0.0)
        (object_set_function_variable "intro_sen_maj" "engine_hack" 1.0 60.0)
        (object_set_function_variable "intro_sen_maj" "engine_audio" 1.0 60.0)
        (sleep 110)
        (object_set_function_variable "intro_sen_maj" "engine_hack" 0.0 60.0)
        (object_set_function_variable "intro_sen_maj" "engine_audio" 0.0 60.0)
        (sleep 160)
        (object_set_function_variable "intro_sen_maj" "engine_hack" 1.0 60.0)
        (object_set_function_variable "intro_sen_maj" "engine_audio" 1.0 60.0)
        (sleep 60)
        (sound_class_enable_ducker "vehicle" 0.0 150)
    )
)

(script dormant void c06_intro_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\06_sentinelwalls\c06_intro\foley\c06_intro_02_fol" none 1.0)
        (print "c06_intro foley 02 start")
    )
)

(script dormant void c06_1120_tar
    (begin
        (sleep 782)
        (sound_impulse_time "sound\dialog\levels\06_sentinelwall\cinematic\c06_1120_tar" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c06_1120_tar" 2.0)
    )
)

(script dormant void c06_1130_tar
    (begin
        (sleep 842)
        (sound_impulse_time "sound\dialog\levels\06_sentinelwall\cinematic\c06_1130_tar" "tartarus" 1.0 "radio_default_out")
        (attract_mode_set_seconds "c06_1130_tar" 2.0)
    )
)

(script dormant void arbiter_fires
    (begin
        (sleep 642)
        (print "carbine shot")
        (effect_new_on_object_marker "effects\objects\weapons\rifle\covenant_carbine\firing" "carbine" "primary_trigger")
        (sleep 22)
        (print "carbine shot")
        (effect_new_on_object_marker "effects\objects\weapons\rifle\covenant_carbine\firing" "carbine" "primary_trigger")
        (sleep 24)
        (print "carbine shot")
        (effect_new_on_object_marker "effects\objects\weapons\rifle\covenant_carbine\firing" "carbine" "primary_trigger")
    )
)

(script dormant void phantom_fires
    (begin
        (rasterizer_profile_include_all)
        (sleep 690)
        (object_create_anew "intro_turret_base")
        (object_create_anew "intro_turret")
        (objects_attach "intro_turret_base" "primary_trigger" "intro_turret" "")
        (print "turret fires")
        (weapon_hold_trigger "intro_turret" 0 true)
        (sleep 30)
        (weapon_hold_trigger "intro_turret" 0 false)
        (objects_detach "intro_turret_base" "intro_turret")
        (object_destroy "intro_turret")
        (object_destroy "intro_turret_base")
    )
)

(script dormant void c06_intro_predict_ledge_01
    (begin
        (sleep 145)
        (print "predict: camera, dervish")
        (object_type_predict_high "objects\characters\dervish\dervish")
        (camera_predict_resources_at_frame "objects\characters\cinematic_camera\06_intro\06_intro" "06_intro_02" none "anchor_flag_intro" 165)
    )
)

(script dormant void c06_intro_predict_ledge_02
    (begin
        (sleep 224)
        (print "predict: camera, dervish, sentinel major")
        (object_type_predict_high "objects\characters\dervish\dervish")
        (object_type_predict_high "objects\characters\sentinel_enforcer\sentinel_enforcer")
        (camera_predict_resources_at_frame "objects\characters\cinematic_camera\06_intro\06_intro" "06_intro_02" none "anchor_flag_intro" 244)
    )
)

(script dormant void create_dervish_again
    (begin
        (sleep 305)
        (print "problem actor")
        (object_create_anew "dervish")
        (object_create_anew "carbine")
        (object_cinematic_lod "dervish" true)
        (object_cinematic_lod "carbine" true)
        (object_uses_cinematic_lighting "dervish" true)
        (object_uses_cinematic_lighting "carbine" true)
        (objects_attach "dervish" "right_hand_elite" "carbine" "")
        (object_hide "dervish" true)
    )
)

(script dormant void dervish_unhide
    (begin
        (sleep 330)
        (object_hide "dervish" false)
        (print "dervish unhide")
    )
)

(script static void c06_intro_02_setup
    (begin
        (object_create_anew "phantom_02")
        (object_create_anew "intro_sen_maj")
        (object_create_anew "matte_mount_doom")
        (object_cinematic_lod "phantom_02" true)
        (object_cinematic_lod "intro_sen_maj" true)
        (object_uses_cinematic_lighting "phantom_02" true)
        (object_uses_cinematic_lighting "intro_sen_maj" true)
        (wake c06_intro_sound_scene2_01)
        (wake c06_intro_sound_scene2_02)
        (wake c06_intro_sound_scene2_03)
        (wake c06_intro_foley_02)
        (wake c06_1120_tar)
        (wake c06_1130_tar)
        (wake dervish_unhide)
        (wake create_dervish_again)
        (wake arbiter_fires)
        (wake phantom_fires)
        (wake c06_intro_predict_ledge_01)
        (wake c06_intro_predict_ledge_02)
    )
)

(script static void c06_intro_02_cleanup
    (begin
        (object_destroy "dervish")
        (object_destroy "intro_sen_maj")
        (object_destroy_containing "phantom")
        (object_destroy "matte_mount_doom")
    )
)

(script static void c06_intro_scene_02
    (begin
        (c06_intro_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\06_intro\06_intro" "06_intro_02" none "anchor_flag_intro")
        (custom_animation_relative "dervish" "objects\characters\dervish\06_intro\06_intro" "dervish_02" false "anchor_intro")
        (custom_animation_relative "intro_sen_maj" "objects\characters\sentinel_enforcer\06_intro\06_intro" "sentinel_major_02" false "anchor_intro")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\06_intro\06_intro" "phantom01_02" false "anchor_intro")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\06_intro\06_intro" "phantom02_02" false "anchor_intro")
        (scenery_animation_start_relative "matte_mount_doom" "objects\cinematics\matte_paintings\mount_doom\06_intro\06_intro" "mount_doom_02" "anchor_intro")
        (rasterizer_profile_include_all)
        (sleep 315)
        (custom_animation_relative "dervish" "objects\characters\dervish\06_intro\06_intro" "dervish_02" false "anchor_intro")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c06_intro_02_cleanup)
        (sleep 30)
    )
)

(script static void c06_intro
    (begin
        (crash sentinelhq_1)
        (sleep 5)
        (c06_intro_scene_01)
        (c06_intro_scene_02)
    )
)

(script dormant void difficulty_settings
    (begin
        (if (difficulty_heroic) 
            (begin
                (begin
                    (set g_sleep_lower_bound 45)
                    (set g_sleep_upper_bound 65)
                    (set g_emitter_delay 120)
                )
            ) (if (difficulty_legendary) 
                (begin
                    (begin
                        (set g_sleep_lower_bound 25)
                        (set g_sleep_upper_bound 45)
                        (set g_emitter_delay 60)
                    )
                ) )
        )
    )
)

(script static void test_locks
    (begin
        (device_set_position_immediate "plug" 1.0)
        (device_set_position "plug_lock_a" 1.0)
        (device_set_position "plug_lock_b" 1.0)
        (device_set_position "plug_lock_c" 1.0)
        (device_set_position "plug_lock_d" 1.0)
        (device_set_position "plug_lock_e" 1.0)
        (device_set_position "plug_lock_f" 1.0)
        (device_set_position "plug_door_b" 1.0)
    )
)

(script command_script void die
    (begin
        (ai_kill_silent ai_current_squad)
    )
)

(script dormant void ice_cream_mythic
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
            (print "because now everyone is mythic!!!!"))
        (reset_dsp_image 12)
    )
)

(script dormant void chapter_silence
    (begin
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_remorse
    (begin
        (show_hud_help_text 0.0 0.5)
        (cinematic_set_title true)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_2")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_war
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

(script dormant void objective_lower_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "lower the containment-shield.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_lower_clear
    (begin
        (print "objective complete:")
        (print "lower the containment-shield.")
    )
)

(script dormant void objective_lower_specific_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "power-up the four absorbers to lower the containment-shield.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_lower_specific_clear
    (begin
        (print "objective complete:")
        (print "power-up the four absorbers to lower the containment-shield.")
        (update_remote_camera 1)
    )
)

(script dormant void objective_floodwall_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "make your way through the flood-infested wall.")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective_floodwall_clear
    (begin
        (print "objective complete:")
        (print "make your way through the flood-infested wall.")
        (update_remote_camera 2)
    )
)

(script dormant void objective_rendezvous_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "rendezvous with your allies in the covenant camp.")
        (input_suppress_vibration 3)
    )
)

(script dormant void objective_rendezvous_clear
    (begin
        (print "objective complete:")
        (print "rendezvous with your allies in the covenant camp.")
        (update_remote_camera 3)
    )
)

(script dormant void music_06a_01
    (begin
        (sleep_until (volume_test_objects "tv_insertion_tube" (players)) 1)
        (if debug 
            (print "start music 06a_01"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_01" none 1.0)
        (sleep 30)
        (if debug 
            (print "start music 06a_02"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_02" none 1.0)
        (sleep_until (volume_test_objects "tv_ins_slide_bottom" (players)))
        (if debug 
            (print "stop music 06a_01"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_01")
    )
)

(script dormant void music_06a_03
    (begin
        (sleep_until g_music_06a_03 1)
        (if debug 
            (print "start music 06a_03"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_03" none 1.0)
        (sleep_until (not g_music_06a_03))
        (if debug 
            (print "stop music 06a_03"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_03")
    )
)

(script dormant void music_06a_04
    (begin
        (sleep_until g_music_06a_04)
        (if debug 
            (print "start music 06a_04"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_04" none 1.0)
        (sleep_until (not g_music_06a_04))
        (if debug 
            (print "stop music 06a_04"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_04")
    )
)

(script dormant void music_06a_05
    (begin
        (sleep_until g_music_06a_05)
        (if debug 
            (print "start music 06a_05"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_05" none 1.0)
        (sleep_until (not g_music_06a_05))
        (if debug 
            (print "stop music 06a_05"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_05")
    )
)

(script dormant void music_06a_06
    (begin
        (sleep_until g_music_06a_06)
        (if debug 
            (print "start music 06a_06"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_06" none 1.0)
        (sleep_until (not g_music_06a_06))
        (if debug 
            (print "stop music 06a_06"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_06")
    )
)

(script dormant void music_06a_07
    (begin
        (sleep_until g_music_06a_07)
        (if debug 
            (print "start music 06a_07"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_07" none 1.0)
        (sleep_until (not g_music_06a_07))
        (if debug 
            (print "stop music 06a_07"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_07")
    )
)

(script dormant void music_06a_08
    (begin
        (sleep_until (volume_test_objects "tv_slide_a" (players)))
        (if debug 
            (print "start music 06a_08"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_08" none 1.0)
        (sleep_until (not g_music_06a_08))
        (if debug 
            (print "stop music 06a_08"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_08")
    )
)

(script dormant void music_06a_09
    (begin
        (sleep_until (volume_test_objects "tv_ledge_c_fr" (players)) 5)
        (if debug 
            (print "start music 06a_09"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_09" none 1.0)
        (set g_music_06a_08 false)
    )
)

(script dormant void music_06a_10
    (begin
        (sleep_until (volume_test_objects "tv_music_06a_10" (players)))
        (if debug 
            (print "start music 06a_10"))
        (sound_looping_stop_immediately "scenarios\solo\06a_sentinelwalls\06a_music\06a_10" none 1.0)
        (sleep_until (not g_music_06a_10))
        (if debug 
            (print "stop music 06a_10"))
        (sound_looping_set_scale "scenarios\solo\06a_sentinelwalls\06a_music\06a_10")
    )
)

(script command_script void sc_cond_cov
    (begin
        (sleep 60)
        (cs_switch "grunt")
        (if dialogue 
            (print "grunt: arbiter our savior!"))
        (sleep (ai_play_line_at_player "cond_a_cov" "0400"))
        (sleep (* dialogue_pause 3.0))
        (if dialogue 
            (print "grunt: stupid jackal, say thank you!"))
        (sleep (ai_play_line_at_player "cond_a_cov" "0410"))
        (sleep dialogue_pause)
        (cs_switch "jackal")
        (if dialogue 
            (print "jackal: hissss....."))
        (sleep (ai_play_line_at_player "cond_a_cov" "0420"))
        (sleep dialogue_pause)
    )
)

(script dormant void ai_sc_cond_a_cov
    (begin
        (sleep_until (ai_scene "sc_cond_a_cov" sc_cond_cov "cond_a_cov"))
    )
)

(script dormant void sc_tartarus_reminder
    (begin
        (game_save_immediate)
        (if dialogue 
            (print "tartarus: you're getting close to one of the shield-generators…"))
        (sleep (ai_play_line_on_object none "0430"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "tartarus: many of my brutes have fallen attempting to take it down."))
        (sleep (ai_play_line_on_object none "0440"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "tartarus: let's see if you fare better."))
        (sleep (ai_play_line_on_object none "0450"))
        (sleep dialogue_pause)
        (game_saving)
    )
)

(script command_script void sc_fleeing_grunts
    (begin
        (if dialogue 
            (print "grunt: big, scary thing! run away!"))
        (sleep (ai_play_line_at_player ai_current_actor "0460"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "grunt: please! no make go back!"))
        (sleep (ai_play_line_at_player ai_current_actor "0470"))
        (sleep dialogue_pause)
        (sleep_until g_hall_b_sen_dialogue)
        (sleep 90)
        (if dialogue 
            (print "grunt: (shriek) more bad things!"))
        (sleep (ai_play_line_at_player ai_current_actor "0480"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "grunt: arbiter! protect! protect!"))
        (sleep (ai_play_line_at_player ai_current_actor "0490"))
        (sleep dialogue_pause)
    )
)

(script dormant void ai_sc_hall_b_grunts
    (begin
        (sleep_until (ai_trigger_test "scene_trigger_4" "hall_b_cov"))
        (cs_run_command_script "hall_b_cov/wimp" sc_fleeing_grunts)
    )
)

(script dormant void sc_enforcer
    (begin
        (sleep_until g_enforcer)
        (game_save_immediate)
        (sleep 60)
        (if dialogue 
            (print "tartarus: it's useless to attack an enforcer from the front."))
        (if dialogue 
            (print "tartarus: especially when their shields are up."))
        (sleep (ai_play_line_on_object none "0500"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "tartarus: stay in the shadows. wait 'til it loses interest…"))
        (sleep (ai_play_line_on_object none "0510"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "tartarus: then strike the beast when it it's back is turned!"))
        (sleep (ai_play_line_on_object none "0520"))
        (sleep dialogue_pause)
        (game_saving)
    )
)

(script dormant void sc_plug_launch
    (begin
        (game_save_immediate)
        (set g_music_06a_03 false)
        (if dialogue 
            (print "tartarus: you've reached the shield's power-source, arbiter."))
        (if dialogue 
            (print "tartarus: overload the locks holding it in place!"))
        (sleep (ai_play_line_on_object none "0010"))
        (sleep dialogue_pause)
        (set g_enforcer true)
        (sleep_until g_final_lock)
        (if dialogue 
            (print "tartarus: one more, arbiter!"))
        (sleep (ai_play_line_on_object none "0030"))
        (sleep dialogue_pause)
        (sleep_until g_flip_switch)
        (sound_class_enable_ducker "object_impacts" 0.2 2)
        (sound_class_enable_ducker "vehicle_collision" 0.2 2)
        (sleep 60)
        (if dialogue 
            (print "tartarus: you've released the power source!"))
        (if dialogue 
            (print "now find a way to remove it from its cradle."))
        (sleep (ai_play_line_on_object none "0040"))
        (game_saving)
    )
)

(script dormant void sc_plug_ride
    (begin
        (if dialogue 
            (print "tartarus: our path to the library is clear."))
        (if dialogue 
            (print "tartarus: i'll pick you up on the ledge ahead."))
        (sleep (ai_play_line_on_object none "0050"))
        (sleep dialogue_pause)
        (sleep_until g_plug_ride_enforcer)
        (if dialogue 
            (print "tartarus: (angry growl) blasted machines!"))
        (sleep (ai_play_line_on_object none "0070"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "tartarus: make your own way through the wall, arbiter!"))
        (sleep (ai_play_line_on_object none "0080"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_marines_a
    (begin
        (if dialogue 
            (print "marine: negative, ma'am. they aren't covenant!"))
        (sleep (ai_play_line_on_object "conduit_b_sound" "0090"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "sarg: cover that doorway!"))
        (sleep (ai_play_line_on_object "conduit_b_sound" "0100"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_marines_b
    (begin
        (if dialogue 
            (print "marine: proceed to the objective! we'll hold out as long as we can!"))
        (sleep (ai_play_line_on_object "hall_c_sound" "0110"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "marine: aaa! get it off of me!"))
        (sleep (ai_play_line_on_object "hall_c_sound" "0120"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "sarg: suppressive fire! suppressive fi -"))
        (sleep (ai_play_line_on_object "hall_c_sound" "0130"))
        (sleep dialogue_pause)
    )
)

(script command_script void cs_sc_qz_ini
    (begin
        (if dialogue 
            (print "spec-ops: forerunners be praised! the arbiter!"))
        (sleep (ai_play_line_at_player "qz_ini_ins_pods" "0530"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: this quarantine-zone has been compromised!"))
        (if dialogue 
            (print "spec-ops: we must do what we can against the flood!"))
        (sleep (ai_play_line_at_player "qz_ini_ins_pods" "0540"))
        (sleep (* dialogue_pause 4.0))
        (if dialogue 
            (print "spec-ops: our commander has landed further in."))
        (if dialogue 
            (print "spec-ops: let us join him!"))
        (sleep (ai_play_line_at_player "qz_ini_ins_pods" "0550"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_qz_initial
    (begin
        (sleep_until (ai_scene "sc_qz_ini" cs_sc_qz_ini "qz_ini_ins_pods"))
    )
)

(script command_script void cs_cov_camp_elites
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_nearest qz_cov_def)
        (cs_face_player true)
        (sleep_until g_sc_cov_camp_done)
    )
)

(script command_script void cs_cov_camp_soc
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to qz_cov_def/soc)
        (cs_face_player true)
        (sleep_until g_sc_cov_camp_done)
    )
)

(script dormant void sc_qz_cov_camp
    (begin
        (ai_vehicle_exit "qz_cov_def_cov")
        (ai_vehicle_exit "qz_cov_def_soc")
        (sleep 30)
        (cs_run_command_script "qz_cov_def_cov" cs_cov_camp_elites)
        (cs_run_command_script "qz_cov_def_soc" cs_cov_camp_soc)
        (sleep_until (volume_test_objects "tv_qz_cov_def_hill" (players)) 30 450)
        (sleep 15)
        (if dialogue 
            (print "commander: arbiter! what are you doing here?"))
        (sleep (ai_play_line "qz_cov_def_soc" "0170"))
        (sleep dialogue_pause)
        (set g_qz_cov_camp_progress true)
        (sleep 90)
        (if dialogue 
            (print "spec-ops: the flood is upon us!"))
        (sleep (ai_play_line "qz_cov_def_cov" "0190"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "commander: we must hold this camp until reinforcements arrive!"))
        (sleep (ai_play_line "qz_cov_def_soc" "0200"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "spec-ops: may our footsteps never fade!"))
        (sleep (ai_play_line "qz_cov_def_cov" "0210"))
        (sleep dialogue_pause)
        (sleep 30)
        (set g_sc_cov_camp_done true)
        (game_saving)
    )
)

(script dormant void attach_absorbers_1
    (begin
        (objects_attach "piston_ins" "absorber_a" "absorber_ins" "absorber_a")
        (objects_attach "piston_a" "absorber_a" "absorber_a" "absorber_a")
        (objects_attach "piston_b" "absorber_a" "absorber_b" "absorber_a")
        (objects_attach "piston_c" "absorber_a" "absorber_c" "absorber_a")
        (objects_attach "piston_d" "absorber_a" "absorber_d" "absorber_a")
        (objects_attach "piston_plug_landing" "absorber_a" "absorber_plug_landing" "absorber_a")
    )
)

(script dormant void attach_absorbers_1b
    (begin
        (objects_attach "piston_e" "absorber_a" "absorber_e" "absorber_a")
        (objects_attach "piston_f" "absorber_a" "absorber_f" "absorber_a")
        (objects_attach "piston_g" "absorber_a" "absorber_g" "absorber_a")
        (objects_attach "piston_h" "absorber_a" "absorber_h" "absorber_a")
        (objects_attach "piston_i" "absorber_a" "absorber_i" "absorber_a")
        (objects_attach "piston_ledge_b" "absorber_a" "absorber_ledge_b" "absorber_a")
        (objects_attach "piston_ledge_c" "absorber_a" "absorber_ledge_c" "absorber_a")
    )
)

(script dormant void attach_controls_1
    (begin
        (if 
            (or
                (difficulty_heroic)
                (difficulty_legendary)
            ) 
                (begin
                    (object_destroy_containing "switch_a")
                    (object_destroy_containing "switch_b")
                    (object_destroy_containing "switch_c")
                    (object_destroy_containing "switch_d")
                )
        )
        (objects_attach "piston_ins" "absorber_a" "ins_switch_a" "switch")
        (objects_attach "piston_ins" "absorber_b" "ins_switch_b" "switch")
        (objects_attach "piston_ins" "absorber_c" "ins_switch_c" "switch")
        (objects_attach "piston_ins" "absorber_d" "ins_switch_d" "switch")
        (objects_attach "piston_a" "absorber_a" "a_switch_a" "switch")
        (objects_attach "piston_a" "absorber_b" "a_switch_b" "switch")
        (objects_attach "piston_a" "absorber_c" "a_switch_c" "switch")
        (objects_attach "piston_a" "absorber_d" "a_switch_d" "switch")
        (objects_attach "piston_b" "absorber_a" "b_switch_a" "switch")
        (objects_attach "piston_b" "absorber_b" "b_switch_b" "switch")
        (objects_attach "piston_b" "absorber_c" "b_switch_c" "switch")
        (objects_attach "piston_b" "absorber_d" "b_switch_d" "switch")
        (objects_attach "piston_c" "absorber_a" "c_switch_a" "switch")
        (objects_attach "piston_c" "absorber_b" "c_switch_b" "switch")
        (objects_attach "piston_c" "absorber_c" "c_switch_c" "switch")
        (objects_attach "piston_c" "absorber_d" "c_switch_d" "switch")
        (objects_attach "piston_d" "absorber_a" "d_switch_a" "switch")
        (objects_attach "piston_d" "absorber_b" "d_switch_b" "switch")
        (objects_attach "piston_d" "absorber_c" "d_switch_c" "switch")
        (objects_attach "piston_d" "absorber_d" "d_switch_d" "switch")
        (objects_attach "piston_plug_landing" "absorber_a" "plug_landing_switch_a" "switch")
        (objects_attach "piston_plug_landing" "absorber_b" "plug_landing_switch_b" "switch")
        (objects_attach "piston_plug_landing" "absorber_c" "plug_landing_switch_c" "switch")
        (objects_attach "piston_plug_landing" "absorber_d" "plug_landing_switch_d" "switch")
    )
)

(script dormant void attach_controls_1b
    (begin
        (objects_attach "piston_e" "absorber_a" "e_switch_a" "switch")
        (objects_attach "piston_e" "absorber_b" "e_switch_b" "switch")
        (objects_attach "piston_e" "absorber_c" "e_switch_c" "switch")
        (objects_attach "piston_e" "absorber_d" "e_switch_d" "switch")
        (objects_attach "piston_f" "absorber_a" "f_switch_a" "switch")
        (objects_attach "piston_f" "absorber_b" "f_switch_b" "switch")
        (objects_attach "piston_f" "absorber_c" "f_switch_c" "switch")
        (objects_attach "piston_f" "absorber_d" "f_switch_d" "switch")
        (objects_attach "piston_g" "absorber_a" "g_switch_a" "switch")
        (objects_attach "piston_g" "absorber_b" "g_switch_b" "switch")
        (objects_attach "piston_g" "absorber_c" "g_switch_c" "switch")
        (objects_attach "piston_g" "absorber_d" "g_switch_d" "switch")
        (objects_attach "piston_h" "absorber_a" "h_switch_a" "switch")
        (objects_attach "piston_h" "absorber_b" "h_switch_b" "switch")
        (objects_attach "piston_h" "absorber_c" "h_switch_c" "switch")
        (objects_attach "piston_h" "absorber_d" "h_switch_d" "switch")
        (objects_attach "piston_i" "absorber_a" "i_switch_a" "switch")
        (objects_attach "piston_i" "absorber_b" "i_switch_b" "switch")
        (objects_attach "piston_i" "absorber_c" "i_switch_c" "switch")
        (objects_attach "piston_i" "absorber_d" "i_switch_d" "switch")
        (objects_attach "piston_ledge_b" "absorber_a" "ledge_b_switch_a" "switch")
        (objects_attach "piston_ledge_b" "absorber_b" "ledge_b_switch_b" "switch")
        (objects_attach "piston_ledge_b" "absorber_c" "ledge_b_switch_c" "switch")
        (objects_attach "piston_ledge_b" "absorber_d" "ledge_b_switch_d" "switch")
        (objects_attach "piston_ledge_c" "absorber_a" "ledge_c_switch_a" "switch")
        (objects_attach "piston_ledge_c" "absorber_b" "ledge_c_switch_b" "switch")
        (objects_attach "piston_ledge_c" "absorber_c" "ledge_c_switch_c" "switch")
        (objects_attach "piston_ledge_c" "absorber_d" "ledge_c_switch_d" "switch")
    )
)

(script dormant void open_piston_ins
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_ins") 0.0)
                        (<= (object_get_shield "absorber_ins") 0.0)
                    ) 
                1)
                (device_set_position "piston_ins" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_ins")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_ins" (players))))
                (device_set_position "piston_ins" 0.0)
                (device_group_set_immediate "group_ins" 0.0)
                (= (version) 1)
            )
        )
    )
)

(script dormant void open_piston_a
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_a") 0.0)
                        (<= (object_get_shield "absorber_a") 0.0)
                    ) 
                1)
                (device_set_position "piston_a" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_a")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_a" (players))))
                (device_set_position "piston_a" 0.0)
                (device_group_set_immediate "group_a" 0.0)
                (= (version) 1)
            )
        )
    )
)

(script dormant void open_piston_b
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_b") 0.0)
                        (<= (object_get_shield "absorber_b") 0.0)
                    ) 
                1)
                (device_set_position "piston_b" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_b")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_b" (players))))
                (device_set_position "piston_b" 0.0)
                (device_group_set_immediate "group_b" 0.0)
                (= (version) 1)
            )
        )
    )
)

(script dormant void open_piston_c
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_c") 0.0)
                        (<= (object_get_shield "absorber_c") 0.0)
                    ) 
                1)
                (device_set_position "piston_c" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_c")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_c" (players))))
                (device_set_position "piston_c" 0.0)
                (device_group_set_immediate "group_c" 0.0)
                (= (version) 1)
            )
        )
    )
)

(script dormant void open_piston_d
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_d") 0.0)
                        (<= (object_get_shield "absorber_d") 0.0)
                    ) 
                1)
                (device_set_position "piston_d" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_d")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_d" (players))))
                (device_set_position "piston_d" 0.0)
                (device_group_set_immediate "group_d" 0.0)
                (= (version) 1)
            )
        )
    )
)

(script dormant void open_piston_plug_landing
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_plug_landing") 0.0)
                        (<= (object_get_shield "absorber_plug_landing") 0.0)
                    ) 
                1)
                (device_set_position "piston_plug_landing" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_plug_landing")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_plug_landing" (players))))
                (device_set_position "piston_plug_landing" 0.0)
                (device_group_set_immediate "group_plug_landing" 0.0)
                (= (version) 1)
            )
        )
    )
)

(script dormant void open_piston_e
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_e") 0.0)
                        (<= (object_get_shield "absorber_e") 0.0)
                    ) 
                1)
                (device_set_position "piston_e" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_e")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_e" (players))))
                (device_set_position "piston_e" 0.0)
                (device_group_set_immediate "group_e" 0.0)
                g_piston_control
            )
        )
    )
)

(script dormant void open_piston_f
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_f") 0.0)
                        (<= (object_get_shield "absorber_f") 0.0)
                    ) 
                1)
                (device_set_position "piston_f" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_f")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_f" (players))))
                (device_set_position "piston_f" 0.0)
                (device_group_set_immediate "group_f" 0.0)
                g_piston_control
            )
        )
    )
)

(script dormant void open_piston_g
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_g") 0.0)
                        (<= (object_get_shield "absorber_g") 0.0)
                    ) 
                1)
                (device_set_position "piston_g" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_g")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_g" (players))))
                (device_set_position "piston_g" 0.0)
                (device_group_set_immediate "group_g" 0.0)
                g_piston_control
            )
        )
    )
)

(script dormant void open_piston_h
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_h") 0.0)
                        (<= (object_get_shield "absorber_h") 0.0)
                    ) 
                1)
                (device_set_position "piston_h" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_h")
                (if g_music_06a_07 
                    (set g_music_06a_07 false))
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_h" (players))))
                (device_set_position "piston_h" 0.0)
                (device_group_set_immediate "group_h" 0.0)
                g_piston_control
            )
        )
    )
)

(script dormant void open_piston_i
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_i") 0.0)
                        (<= (object_get_shield "absorber_i") 0.0)
                    ) 
                1)
                (device_set_position "piston_i" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_i")
                (if g_music_06a_06 
                    (set g_music_06a_06 false))
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_i" (players))))
                (device_set_position "piston_i" 0.0)
                (device_group_set_immediate "group_i" 0.0)
                g_piston_control
            )
        )
    )
)

(script dormant void open_piston_ledge_b
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_ledge_b") 0.0)
                        (<= (object_get_shield "absorber_ledge_b") 0.0)
                    ) 
                1)
                (device_set_position "piston_ledge_b" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_ledge_b")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_ledge_b" (players))))
                (device_set_position "piston_ledge_b" 0.0)
                (device_group_set_immediate "group_ledge_b" 0.0)
                g_piston_control
            )
        )
    )
)

(script dormant void open_piston_ledge_c
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (> (device_group_get "group_ledge_c") 0.0)
                        (<= (object_get_shield "absorber_ledge_c") 0.0)
                    ) 
                1)
                (device_set_position "piston_ledge_c" 1.0)
                (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "absorber_ledge_c")
                (sleep piston_open_time)
                (sleep_until (not (volume_test_objects_all "tv_piston_ledge_c" (players))))
                (device_set_position "piston_ledge_c" 0.0)
                (device_group_set_immediate "group_ledge_c" 0.0)
                g_piston_control
            )
        )
    )
)

(script dormant void piston_control
    (begin
        (wake attach_absorbers_1)
        (wake attach_controls_1)
        (wake open_piston_ins)
        (wake open_piston_a)
        (wake open_piston_b)
        (wake open_piston_c)
        (wake open_piston_d)
        (wake open_piston_plug_landing)
        (sleep_until (= (version) 1))
        (if debug 
            (print "creating bsp 1 objects..."))
        (object_create_anew_containing "bsp1_weapon")
        (object_create_anew_containing "bsp1_equip")
        (wake attach_absorbers_1b)
        (wake attach_controls_1b)
        (sleep_forever open_piston_ins)
        (sleep_forever open_piston_a)
        (sleep_forever open_piston_b)
        (sleep_forever open_piston_c)
        (sleep_forever open_piston_d)
        (sleep_forever open_piston_plug_landing)
        (wake open_piston_e)
        (wake open_piston_f)
        (wake open_piston_g)
        (wake open_piston_h)
        (wake open_piston_i)
        (wake open_piston_ledge_b)
        (wake open_piston_ledge_c)
        (sleep_until (= (version) 2))
        (object_destroy_containing "bsp1_body")
        (object_destroy_containing "bsp1_weapon")
        (object_destroy_containing "bsp1_equip")
        (sleep_forever open_piston_e)
        (sleep_forever open_piston_f)
        (sleep_forever open_piston_g)
        (sleep_forever open_piston_h)
        (sleep_forever open_piston_i)
        (sleep_forever open_piston_ledge_b)
        (sleep_forever open_piston_ledge_c)
    )
)

(script command_script void cs_pussy_grunt_abort
    (begin
        (sleep 1)
        (object_can_take_damage (ai_actors "pussy_grunt"))
        (ai_set_orders "pussy_grunt" "hall_a_cov")
    )
)

(script dormant void pussy_grunt_abort
    (begin
        (sleep_until (volume_test_objects "tv_ins_slide_bottom" (ai_actors "pussy_grunt")))
        (cs_run_command_script "pussy_grunt" cs_pussy_grunt_abort)
    )
)

(script command_script void pussy_grunt_down
    (begin
        (wake pussy_grunt_abort)
        (cs_enable_dialogue true)
        (cs_enable_pathfinding_failsafe true)
        (cs_movement_mode 2)
        (cs_crouch false)
        (object_cannot_take_damage (ai_actors "pussy_grunt"))
        (sleep_until (>= (device_get_position "piston_ins") 0.5) 10)
        (cs_go_to_and_face insertion/grunt_stand insertion/grunt_shoot)
        (cs_jump 0.0 1.0)
        (sleep 15)
        (cs_move_in_direction 0.0 5.0 0.0)
    )
)

(script command_script void pussy_grunt_shoot
    (begin
        (cs_movement_mode 2)
        (cs_crouch false)
        (cs_go_to_and_face insertion/grunt_stand insertion/grunt_shoot)
        (sleep 15)
        (cs_shoot_point true insertion/grunt_shoot)
        (sleep_until (<= (object_get_shield "absorber_ins") 0.0) 5)
        (sleep 15)
        (cs_shoot_point false insertion/grunt_shoot)
        (cs_run_command_script "pussy_grunt" pussy_grunt_down)
    )
)

(script dormant void pussy_grunt
    (begin
        (if (>= (ai_combat_status "insertion_sen") ai_combat_status_active) 
            (sleep_until 
                (and
                    (<= (object_get_health "ins_em_a") 0.0)
                    (<= (object_get_health "ins_em_b") 0.0)
                    (<= (object_get_health "ins_em_c") 0.0)
                )
            ))
        (sleep 45)
        (if (= (device_get_position "piston_ins") 0.0) 
            (cs_run_command_script "pussy_grunt" pussy_grunt_shoot))
        (sleep_until (volume_test_objects "tv_insertion_tube" (players)) 5)
        (cs_run_command_script "pussy_grunt" pussy_grunt_down)
    )
)

(script command_script void cs_pussy_grunt
    (begin
        (cs_movement_mode 3)
        (cs_crouch true)
        (ai_disregard (ai_actors "constructors") true)
        (sleep_until 
            (or
                (volume_test_objects "tv_pussy_grunt" (players))
                (< (ai_strength "pussy_grunt") 1.0)
            )
        )
        (cs_movement_mode 2)
        (cs_crouch false)
        (wake pussy_grunt)
    )
)

(script dormant void pussy_grunt_reminder
    (begin
        (sleep (* 30.0 60.0 5.0))
        (if (not g_pussy_grunt) 
            (begin
                (sleep_until (volume_test_objects "tv_ins_bk" (players)))
                (if (>= (ai_combat_status "insertion_sen") ai_combat_status_active) 
                    (sleep_until 
                        (and
                            (<= (object_get_health "ins_em_a") 0.0)
                            (<= (object_get_health "ins_em_b") 0.0)
                            (<= (object_get_health "ins_em_c") 0.0)
                        )
                    ))
                (sleep 45)
                (if (= (device_get_position "piston_ins") 1.0) 
                    (cs_run_command_script "pussy_grunt" pussy_grunt_shoot))
            )
        )
    )
)

(script command_script void cs_miniaturize
    (begin
        (object_set_scale (ai_get_object ai_current_actor) 0.3 0)
    )
)

(script command_script void cs_big
    (begin
        (cs_enable_moving true)
        (sleep (* 30.0 10.0))
        (object_set_scale (ai_get_object ai_current_actor) 2.1 0)
    )
)

(script command_script void cs_ins_weld_a
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face insertion/p3 insertion/p4)
        (cs_shoot_point true insertion/p4)
        (sleep (random_range 300 450))
        (cs_shoot_point false insertion/p4)
    )
)

(script command_script void cs_ins_weld_b
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face insertion/p5 insertion/p6)
        (cs_shoot_point true insertion/p6)
        (sleep (random_range 150 300))
        (cs_shoot_point false insertion/p6)
    )
)

(script command_script void cs_ins_weld_c
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face insertion/p7 insertion/p8)
        (cs_shoot_point true insertion/p8)
        (sleep (random_range 45 60))
        (cs_shoot_point false insertion/p8)
        (cs_fly_to_and_face insertion/p9 insertion/p10)
        (cs_shoot_point true insertion/p10)
        (sleep (random_range 45 60))
        (cs_shoot_point false insertion/p10)
    )
)

(script command_script void cs_ins_shoot_absorber_slide
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face insertion/shoot_slide insertion/target_slide 0.25)
        (sleep 15)
        (cs_shoot_point true insertion/target_slide)
        (sleep_until (<= (object_get_shield "absorber_a") 0.0) 5)
        (sleep 15)
        (cs_shoot_point false insertion/target_slide)
    )
)

(script dormant void ins_open_door_slide
    (begin
        (ai_place "ins_con_slide")
        (if (= (ai_strength "ins_cons") 1.0) 
            (begin
                (ai_set_orders "ins_con_mid" "ins_sen_slide")
                (ai_set_orders "ins_con_bk" "ins_sen_slide")
            )
        )
        (sleep_until 
            (and
                (volume_test_objects "tv_ins_slide_bottom" (players))
                (objects_can_see_object (players) "piston_a" 180.0)
            )
        )
        (cs_run_command_script "ins_con_slide/shooter" cs_ins_shoot_absorber_slide)
    )
)

(script command_script void cs_ins_runaway
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to insertion/p0)
        (cs_fly_to insertion/p1)
        (cs_fly_to insertion/p2)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_ins_shoot_absorber
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face insertion/shoot_ins insertion/target_ins 0.25)
        (sleep 15)
        (cs_shoot_point true insertion/target_ins)
        (sleep_until (<= (object_get_shield "absorber_ins") 0.0) 5)
        (wake ins_open_door_slide)
        (sleep 15)
        (cs_shoot_point false insertion/target_ins)
    )
)

(script dormant void ins_open_door
    (begin
        (sleep_until 
            (and
                (volume_test_objects "tv_ins_bk" (players))
                (objects_can_see_object (players) "piston_ins" 180.0)
            )
        )
        (if (= (ai_strength "ins_cons") 1.0) 
            (begin
                (cs_run_command_script "ins_con_bk/shooter" cs_ins_shoot_absorber)
                (set g_cons_open_ins true)
            )
        )
    )
)

(script dormant void ai_insertion_emitters
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_insertion_limit 0)
                    (set g_insertion_index 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_insertion_limit 0)
                        (set g_insertion_index 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_insertion_limit 1)
                            (set g_insertion_index 3)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "insertion_sentinels") g_insertion_limit))
                (if g_insertion_spawn 
                    (sleep_forever))
                (sleep g_emitter_delay)
                (set g_insertion_counter 0)
                (set g_insertion_wave false)
                (sleep_until 
                    (begin
                        (ai_place "insertion_sen" 1)
                        (set g_insertion_counter (+ g_insertion_counter 1.0))
                        (if (= g_insertion_counter g_insertion_index) 
                            (set g_insertion_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_insertion_wave
                    )
                )
                g_insertion_spawn
            )
        )
    )
)

(script static void ai_hall_a_em_c
    (begin
        (if debug 
            (print "c"))
        (ai_place "hall_a_sen/c")
        (set g_hall_a_em_count (+ g_hall_a_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_hall_a_em_d
    (begin
        (if debug 
            (print "d"))
        (ai_place "hall_a_sen/d")
        (set g_hall_a_em_count (+ g_hall_a_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_hall_a_em_g
    (begin
        (if debug 
            (print "g"))
        (ai_place "hall_a_sen/g")
        (set g_hall_a_em_count (+ g_hall_a_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_hall_a_em_h
    (begin
        (if debug 
            (print "h"))
        (ai_place "hall_a_sen/h")
        (set g_hall_a_em_count (+ g_hall_a_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script dormant void ai_hall_a_emitters
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_hall_a_sen_limit 0)
                    (set g_hall_a_em_index 2)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_hall_a_sen_limit 0)
                        (set g_hall_a_em_index 3)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_hall_a_sen_limit 1)
                            (set g_hall_a_em_index 4)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "hall_a_sentinels") g_hall_a_sen_limit))
                (if g_hall_a_loops 
                    (sleep_forever))
                (sleep g_emitter_delay)
                (set g_hall_a_em_count 0)
                (set g_hall_a_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "hall_a_em_c"))
                                (> (object_get_health "hall_a_em_c") 0.0)
                                (> (objects_distance_to_object (players) "hall_a_em_c") 0.0)
                                (< (objects_distance_to_object (players) "hall_a_em_c") 9.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_hall_a_em_c)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "hall_a_em_d"))
                                        (> (object_get_health "hall_a_em_d") 0.0)
                                        (> (objects_distance_to_object (players) "hall_a_em_d") 0.0)
                                        (< (objects_distance_to_object (players) "hall_a_em_d") 9.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_hall_a_em_d)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "hall_a_em_g"))
                                                (> (object_get_health "hall_a_em_g") 0.0)
                                                (> (objects_distance_to_object (players) "hall_a_em_g") 0.0)
                                                (< (objects_distance_to_object (players) "hall_a_em_g") 9.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_hall_a_em_g)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "hall_a_em_h"))
                                                        (> (object_get_health "hall_a_em_h") 0.0)
                                                        (> (objects_distance_to_object (players) "hall_a_em_h") 0.0)
                                                        (< (objects_distance_to_object (players) "hall_a_em_h") 9.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_hall_a_em_h)
                                                        ) (if true 
                                                            (begin
                                                                (begin
                                                                    (ai_place "hall_a_sen")
                                                                    (set g_hall_a_em_count (+ g_hall_a_em_count 1.0))
                                                                )
                                                            ) )
                                                )
                                        )
                                )
                        )
                        (if (= g_hall_a_em_count g_hall_a_em_index) 
                            (set g_hall_a_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_hall_a_wave
                    )
                )
                g_hall_a_loops
            )
        )
    )
)

(script dormant void ai_hall_a_const
    (begin
        (ai_place "hall_a_con_ini")
        (ai_place "hall_a_con_bk")
        (sleep 30)
        (sleep_until (< (ai_strength "hall_a_cons") 0.8))
        (sleep 30)
        (if debug 
            (print "hall a constructors running away"))
        (ai_set_orders "constructors" "hall_a_runway")
    )
)

(script static void ai_cond_a_em_a
    (begin
        (if debug 
            (print "a"))
        (ai_place "cond_a_sen_a/a")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_c
    (begin
        (if debug 
            (print "c"))
        (ai_place "cond_a_sen_a/c")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_e
    (begin
        (if debug 
            (print "e"))
        (ai_place "cond_a_sen_a/e")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_f
    (begin
        (if debug 
            (print "f"))
        (ai_place "cond_a_sen_a/f")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_g
    (begin
        (if debug 
            (print "g"))
        (ai_place "cond_a_sen_a/g")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_h
    (begin
        (if debug 
            (print "h"))
        (ai_place "cond_a_sen_a/h")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_i
    (begin
        (if debug 
            (print "i"))
        (ai_place "cond_a_sen_b/i")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_j
    (begin
        (if debug 
            (print "j"))
        (ai_place "cond_a_sen_b/j")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_k
    (begin
        (if debug 
            (print "k"))
        (ai_place "cond_a_sen_b/k")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_l
    (begin
        (if debug 
            (print "l"))
        (ai_place "cond_a_sen_b/l")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_m
    (begin
        (if debug 
            (print "m"))
        (ai_place "cond_a_sen_b/m")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_n
    (begin
        (if debug 
            (print "n"))
        (ai_place "cond_a_sen_b/n")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_cond_a_em_o
    (begin
        (if debug 
            (print "o"))
        (ai_place "cond_a_sen_b/o")
        (set g_cond_a_count (+ g_cond_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script dormant void ai_cond_a_emitters_fr
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_cond_a_limit 0)
                    (set g_cond_a_index 2)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_cond_a_limit 0)
                        (set g_cond_a_index 3)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_cond_a_limit 1)
                            (set g_cond_a_index 4)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "cond_a_sentinels") g_cond_a_limit))
                (if (difficulty_legendary) 
                    (sleep g_emitter_delay) (sleep (* g_emitter_delay 2.0)))
                (if g_cond_a_front 
                    (sleep_forever))
                (set g_cond_a_count 0)
                (set g_cond_a_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "cond_a_em_c"))
                                (> (object_get_health "cond_a_em_c") 0.0)
                                (> (objects_distance_to_object (players) "cond_a_em_c") 5.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_cond_a_em_c)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "cond_a_em_f"))
                                        (> (object_get_health "cond_a_em_f") 0.0)
                                        (> (objects_distance_to_object (players) "cond_a_em_f") 5.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_cond_a_em_f)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "cond_a_em_g"))
                                                (> (object_get_health "cond_a_em_g") 0.0)
                                                (> (objects_distance_to_object (players) "cond_a_em_g") 5.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_cond_a_em_g)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "cond_a_em_e"))
                                                        (> (object_get_health "cond_a_em_e") 0.0)
                                                        (> (objects_distance_to_object (players) "cond_a_em_e") 5.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_cond_a_em_e)
                                                        ) (if 
                                                            (and
                                                                (not (unit_is_emitting "cond_a_em_h"))
                                                                (> (object_get_health "cond_a_em_h") 0.0)
                                                                (> (objects_distance_to_object (players) "cond_a_em_h") 5.0)
                                                                (<= (random_range 0 10) 3)
                                                            ) 
                                                                (begin
                                                                    (ai_cond_a_em_h)
                                                                ) (if 
                                                                    (and
                                                                        (not (unit_is_emitting "cond_a_em_a"))
                                                                        (> (object_get_health "cond_a_em_a") 0.0)
                                                                        (> (objects_distance_to_object (players) "cond_a_em_a") 5.0)
                                                                        (<= (random_range 0 10) 3)
                                                                    ) 
                                                                        (begin
                                                                            (ai_cond_a_em_a)
                                                                        ) (if true 
                                                                            (begin
                                                                                (begin
                                                                                    (ai_place "cond_a_sen_a")
                                                                                    (set g_cond_a_count (+ g_cond_a_count 1.0))
                                                                                )
                                                                            ) )
                                                                )
                                                        )
                                                )
                                        )
                                )
                        )
                        (if (= g_cond_a_count g_cond_a_index) 
                            (set g_cond_a_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_cond_a_wave
                    )
                )
                g_cond_a_front
            )
        )
    )
)

(script dormant void ai_cond_a_emitters_bk
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "cond_a_sentinels") g_cond_a_limit))
                (if (difficulty_legendary) 
                    (sleep g_emitter_delay) (sleep (* g_emitter_delay 2.0)))
                (if g_cond_a_back 
                    (sleep_forever))
                (set g_cond_a_count 0)
                (set g_cond_a_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "cond_a_em_k"))
                                (> (object_get_health "cond_a_em_k") 0.0)
                                (> (objects_distance_to_object (players) "cond_a_em_k") 5.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_cond_a_em_k)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "cond_a_em_o"))
                                        (> (object_get_health "cond_a_em_o") 0.0)
                                        (> (objects_distance_to_object (players) "cond_a_em_o") 5.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_cond_a_em_o)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "cond_a_em_n"))
                                                (> (object_get_health "cond_a_em_n") 0.0)
                                                (> (objects_distance_to_object (players) "cond_a_em_n") 5.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_cond_a_em_n)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "cond_a_em_j"))
                                                        (> (object_get_health "cond_a_em_j") 0.0)
                                                        (> (objects_distance_to_object (players) "cond_a_em_j") 5.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_cond_a_em_j)
                                                        ) (if 
                                                            (and
                                                                (not (unit_is_emitting "cond_a_em_l"))
                                                                (> (object_get_health "cond_a_em_l") 0.0)
                                                                (> (objects_distance_to_object (players) "cond_a_em_l") 5.0)
                                                                (<= (random_range 0 10) 3)
                                                            ) 
                                                                (begin
                                                                    (ai_cond_a_em_l)
                                                                ) (if 
                                                                    (and
                                                                        (not (unit_is_emitting "cond_a_em_m"))
                                                                        (> (object_get_health "cond_a_em_m") 0.0)
                                                                        (> (objects_distance_to_object (players) "cond_a_em_m") 5.0)
                                                                        (<= (random_range 0 10) 3)
                                                                    ) 
                                                                        (begin
                                                                            (ai_cond_a_em_m)
                                                                        ) (if 
                                                                            (and
                                                                                (not (unit_is_emitting "cond_a_em_i"))
                                                                                (> (object_get_health "cond_a_em_i") 0.0)
                                                                                (> (objects_distance_to_object (players) "cond_a_em_i") 5.0)
                                                                                (<= (random_range 0 10) 3)
                                                                            ) 
                                                                                (begin
                                                                                    (ai_cond_a_em_i)
                                                                                ) (if true 
                                                                                    (begin
                                                                                        (begin
                                                                                            (ai_place "cond_a_sen_b")
                                                                                            (set g_cond_a_count (+ g_cond_a_count 1.0))
                                                                                        )
                                                                                    ) )
                                                                        )
                                                                )
                                                        )
                                                )
                                        )
                                )
                        )
                        (if (= g_cond_a_count g_cond_a_index) 
                            (set g_cond_a_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_cond_a_wave
                    )
                )
                g_cond_a_back
            )
        )
    )
)

(script dormant void ai_cond_a_back_ini
    (begin
        (if (difficulty_normal) 
            (begin
                (set g_cond_a_bk_limit 2)
            ) (if (difficulty_heroic) 
                (begin
                    (set g_cond_a_bk_limit 3)
                ) (if (difficulty_legendary) 
                    (begin
                        (set g_cond_a_bk_limit 4)
                    ) )
            )
        )
        (sleep 180)
        (begin_random
            (begin
                (ai_place "cond_a_sen_b/j")
                (set g_cond_a_bk_count (+ g_cond_a_bk_count 1.0))
                (sleep (random_range 5 15))
                (if (= g_cond_a_bk_count g_cond_a_bk_limit) 
                    (sleep_forever))
            )
            (begin
                (ai_place "cond_a_sen_b/k")
                (set g_cond_a_bk_count (+ g_cond_a_bk_count 1.0))
                (sleep (random_range 5 15))
                (if (= g_cond_a_bk_count g_cond_a_bk_limit) 
                    (sleep_forever))
            )
            (begin
                (ai_place "cond_a_sen_b/m")
                (set g_cond_a_bk_count (+ g_cond_a_bk_count 1.0))
                (sleep (random_range 5 15))
                (if (= g_cond_a_bk_count g_cond_a_bk_limit) 
                    (sleep_forever))
            )
            (begin
                (ai_place "cond_a_sen_b/o")
                (set g_cond_a_bk_count (+ g_cond_a_bk_count 1.0))
                (if (= g_cond_a_bk_count g_cond_a_bk_limit) 
                    (sleep_forever))
                (sleep (random_range 5 15))
            )
        )
    )
)

(script command_script void cs_cond_a_sen_e
    (begin
        (cs_fly_to cond_a/p0)
    )
)

(script dormant void cond_a_delay
    (begin
        (sleep 90)
        (set g_cond_a_continue true)
    )
)

(script dormant void cond_a_initial_delay
    (begin
        (sleep_until 
            (begin
                (if (not (volume_test_objects_all "tv_conduit_a" (players))) 
                    (begin
                        (set g_cond_a_continue true)
                    ) (if (<= (ai_living_count "cond_a_sentinels") 0) 
                        (begin
                            (wake cond_a_delay)
                        ) )
                )
                g_cond_a_continue
            )
        )
    )
)

(script static void ai_hall_b_em_b
    (begin
        (if debug 
            (print "b"))
        (ai_place "hall_b_sen/b")
        (set g_hall_b_em_count (+ g_hall_b_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_hall_b_em_d
    (begin
        (if debug 
            (print "d"))
        (ai_place "hall_b_sen/d")
        (set g_hall_b_em_count (+ g_hall_b_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_hall_b_em_e
    (begin
        (if debug 
            (print "e"))
        (ai_place "hall_b_sen/e")
        (set g_hall_b_em_count (+ g_hall_b_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_hall_b_em_f
    (begin
        (if debug 
            (print "f"))
        (ai_place "hall_b_sen/f")
        (set g_hall_b_em_count (+ g_hall_b_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_hall_b_em_g
    (begin
        (if debug 
            (print "g"))
        (ai_place "hall_b_sen/g")
        (set g_hall_b_em_count (+ g_hall_b_em_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script dormant void ai_hall_b_emitters
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_hall_b_sen_limit 0)
                    (set g_hall_b_em_index 3)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_hall_b_sen_limit 0)
                        (set g_hall_b_em_index 4)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_hall_b_sen_limit 1)
                            (set g_hall_b_em_index 5)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "hall_b_sentinels") g_hall_b_sen_limit))
                (if g_hall_b_loops 
                    (sleep_forever))
                (sleep g_emitter_delay)
                (set g_hall_b_em_count 0)
                (set g_hall_b_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "hall_b_em_b"))
                                (> (object_get_health "hall_b_em_b") 0.0)
                                (> (objects_distance_to_object (players) "hall_b_em_b") 0.0)
                                (< (objects_distance_to_object (players) "hall_b_em_b") 10.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_hall_b_em_d)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "hall_b_em_d"))
                                        (> (object_get_health "hall_b_em_d") 0.0)
                                        (> (objects_distance_to_object (players) "hall_b_em_d") 0.0)
                                        (< (objects_distance_to_object (players) "hall_b_em_d") 10.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_hall_b_em_d)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "hall_b_em_e"))
                                                (> (object_get_health "hall_b_em_e") 0.0)
                                                (> (objects_distance_to_object (players) "hall_b_em_e") 0.0)
                                                (< (objects_distance_to_object (players) "hall_b_em_e") 10.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_hall_b_em_e)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "hall_b_em_f"))
                                                        (> (object_get_health "hall_b_em_f") 0.0)
                                                        (> (objects_distance_to_object (players) "hall_b_em_f") 0.0)
                                                        (< (objects_distance_to_object (players) "hall_b_em_f") 10.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_hall_b_em_f)
                                                        ) (if 
                                                            (and
                                                                (not (unit_is_emitting "hall_b_em_g"))
                                                                (> (object_get_health "hall_b_em_g") 0.0)
                                                                (> (objects_distance_to_object (players) "hall_b_em_g") 0.0)
                                                                (< (objects_distance_to_object (players) "hall_b_em_g") 10.0)
                                                                (<= (random_range 0 10) 3)
                                                            ) 
                                                                (begin
                                                                    (ai_hall_b_em_g)
                                                                ) (if true 
                                                                    (begin
                                                                        (begin
                                                                            (ai_place "hall_b_sen")
                                                                            (set g_hall_b_em_count (+ g_hall_b_em_count 1.0))
                                                                        )
                                                                    ) )
                                                        )
                                                )
                                        )
                                )
                        )
                        (if (= g_hall_b_em_count g_hall_b_em_index) 
                            (set g_hall_b_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_hall_b_wave
                    )
                )
                g_hall_b_loops
            )
        )
    )
)

(script command_script void cs_plug_launch_enforcer
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to plug_launch/p0)
    )
)

(script static void ai_plug_launch_em_a
    (begin
        (if debug 
            (print "a"))
        (ai_place "plug_launch_sen/a")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_launch_em_b
    (begin
        (if debug 
            (print "b"))
        (ai_place "plug_launch_sen/b")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_launch_em_c
    (begin
        (if debug 
            (print "c"))
        (ai_place "plug_launch_sen/c")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_launch_em_d
    (begin
        (if debug 
            (print "d"))
        (ai_place "plug_launch_sen/d")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_launch_em_e
    (begin
        (if debug 
            (print "e"))
        (ai_place "plug_launch_sen/e")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_launch_em_f
    (begin
        (if debug 
            (print "f"))
        (ai_place "plug_launch_sen/f")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_launch_em_g
    (begin
        (if debug 
            (print "g"))
        (ai_place "plug_launch_sen/g")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_launch_em_h
    (begin
        (if debug 
            (print "h"))
        (ai_place "plug_launch_sen/h")
        (set g_plug_launch_count (+ g_plug_launch_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script dormant void ai_plug_launch_em
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_plug_launch_limit 0)
                    (set g_plug_launch_index 2)
                    (if debug 
                        (print "emitters off"))
                    (sleep_forever)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_plug_launch_limit 0)
                        (set g_plug_launch_index 3)
                        (sleep_until g_plug_launch_em_heroic)
                        (if debug 
                            (print "emitters on"))
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_plug_launch_limit 0)
                            (set g_plug_launch_index 4)
                            (if debug 
                                (print "emitters on"))
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "plug_launch_sentinels") g_plug_launch_limit))
                (if g_plug_launch_loops 
                    (sleep_forever))
                (sleep g_emitter_delay)
                (set g_plug_launch_count 0)
                (set g_plug_launch_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "plug_launch_em_a"))
                                (> (object_get_health "plug_launch_em_a") 0.0)
                                (> (objects_distance_to_object (players) "plug_launch_em_a") 10.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_plug_launch_em_a)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "plug_launch_em_b"))
                                        (> (object_get_health "plug_launch_em_b") 0.0)
                                        (> (objects_distance_to_object (players) "plug_launch_em_b") 10.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_plug_launch_em_b)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "plug_launch_em_c"))
                                                (> (object_get_health "plug_launch_em_c") 0.0)
                                                (> (objects_distance_to_object (players) "plug_launch_em_c") 10.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_plug_launch_em_c)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "plug_launch_em_d"))
                                                        (> (object_get_health "plug_launch_em_d") 0.0)
                                                        (> (objects_distance_to_object (players) "plug_launch_em_d") 10.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_plug_launch_em_d)
                                                        ) (if 
                                                            (and
                                                                (not (unit_is_emitting "plug_launch_em_e"))
                                                                (> (object_get_health "plug_launch_em_e") 0.0)
                                                                (> (objects_distance_to_object (players) "plug_launch_em_e") 10.0)
                                                                (<= (random_range 0 10) 3)
                                                            ) 
                                                                (begin
                                                                    (ai_plug_launch_em_e)
                                                                ) (if 
                                                                    (and
                                                                        (not (unit_is_emitting "plug_launch_em_f"))
                                                                        (> (object_get_health "plug_launch_em_f") 0.0)
                                                                        (> (objects_distance_to_object (players) "plug_launch_em_f") 10.0)
                                                                        (<= (random_range 0 10) 3)
                                                                    ) 
                                                                        (begin
                                                                            (ai_plug_launch_em_f)
                                                                        ) (if 
                                                                            (and
                                                                                (not (unit_is_emitting "plug_launch_em_g"))
                                                                                (> (object_get_health "plug_launch_em_g") 0.0)
                                                                                (> (objects_distance_to_object (players) "plug_launch_em_g") 10.0)
                                                                                (<= (random_range 0 10) 3)
                                                                            ) 
                                                                                (begin
                                                                                    (ai_plug_launch_em_g)
                                                                                ) (if 
                                                                                    (and
                                                                                        (not (unit_is_emitting "plug_launch_em_g"))
                                                                                        (> (object_get_health "plug_launch_em_g") 0.0)
                                                                                        (> (objects_distance_to_object (players) "plug_launch_em_g") 10.0)
                                                                                        (<= (random_range 0 10) 3)
                                                                                    ) 
                                                                                        (begin
                                                                                            (ai_plug_launch_em_g)
                                                                                        ) (if true 
                                                                                            (begin
                                                                                                (begin
                                                                                                    (ai_place "plug_launch_sen")
                                                                                                    (set g_plug_launch_count (+ g_plug_launch_count 1.0))
                                                                                                )
                                                                                            ) )
                                                                                )
                                                                        )
                                                                )
                                                        )
                                                )
                                        )
                                )
                        )
                        (if (= g_plug_launch_count g_plug_launch_index) 
                            (set g_plug_launch_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_plug_launch_wave
                    )
                )
                g_plug_launch_loops
            )
        )
    )
)

(script static short absorber05_count
    (begin
        (if (<= (object_get_shield "plugabsorber05") 0.0) 
            0 1)
    )
)

(script static short absorber06_count
    (begin
        (if (<= (object_get_shield "plugabsorber06") 0.0) 
            0 1)
    )
)

(script static short absorber07_count
    (begin
        (if (<= (object_get_shield "plugabsorber07") 0.0) 
            0 1)
    )
)

(script static short absorber08_count
    (begin
        (if (<= (object_get_shield "plugabsorber08") 0.0) 
            0 1)
    )
)

(script static short absorber_totalcount
    (begin
        (+ (absorber05_count) (absorber06_count) (absorber07_count) (absorber08_count))
    )
)

(script dormant void plug_rods08
    (begin
        (sleep_until 
            (or
                (> (device_group_get "group_plug_c") 0.0)
                (<= (object_get_shield "plugabsorber08") 0.0)
            ) 
        5)
        (device_set_position "plug_thin_fr" 1.0)
        (device_set_position "plug_thick_fr" 1.0)
        (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "plugabsorber08")
    )
)

(script dormant void plug_rods07
    (begin
        (sleep_until 
            (or
                (> (device_group_get "group_plug_d") 0.0)
                (<= (object_get_shield "plugabsorber07") 0.0)
            ) 
        5)
        (device_set_position "plug_thin_br" 1.0)
        (device_set_position "plug_thick_br" 1.0)
        (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "plugabsorber07")
    )
)

(script dormant void plug_rods06
    (begin
        (sleep_until 
            (or
                (> (device_group_get "group_plug_a") 0.0)
                (<= (object_get_shield "plugabsorber06") 0.0)
            ) 
        5)
        (device_set_position "plug_thin_bl" 1.0)
        (device_set_position "plug_thick_bl" 1.0)
        (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "plugabsorber06")
    )
)

(script dormant void plug_rods05
    (begin
        (sleep_until 
            (or
                (> (device_group_get "group_plug_b") 0.0)
                (<= (object_get_shield "plugabsorber05") 0.0)
            ) 
        5)
        (device_set_position "plug_thin_fl" 1.0)
        (device_set_position "plug_thick_fl" 1.0)
        (damage_object "scenarios\objects\solo\sentinelhq\door_piston_absorber\damage_effects\damage_absorber" "plugabsorber05")
    )
)

(script static void test_ab
    (begin
        (object_set_shield "plugabsorber08" 0.0)
        (object_set_shield "plugabsorber07" 0.0)
        (object_set_shield "plugabsorber06" 0.0)
        (object_set_shield "plugabsorber05" 0.0)
    )
)

(script dormant void plug_absorbers
    (begin
        (objects_attach "plug" "absorber_a01" "plugabsorber06" "absorber")
        (objects_attach "plug" "absorber_b01" "plugabsorber05" "absorber")
        (objects_attach "plug" "absorber_c01" "plugabsorber08" "absorber")
        (objects_attach "plug" "absorber_d01" "plugabsorber07" "absorber")
        (objects_attach "plug" "switch" "plug_switch_housing" "")
        (objects_attach "plug" "absorber_a01" "plug_switch_a" "switch")
        (objects_attach "plug" "absorber_b01" "plug_switch_b" "switch")
        (objects_attach "plug" "absorber_c01" "plug_switch_c" "switch")
        (objects_attach "plug" "absorber_d01" "plug_switch_d" "switch")
        (game_save_no_timeout)
        (wake plug_rods08)
        (wake plug_rods07)
        (wake plug_rods06)
        (wake plug_rods05)
        (wake sc_plug_launch)
        (sleep 90)
        (if debug 
            (print "only 4 more to go!!"))
        (sleep_until (<= (absorber_totalcount) 3))
        (if debug 
            (print "absorber activated!"))
        (sleep_until (<= (absorber_totalcount) 2))
        (if debug 
            (print "absorber activated!"))
        (set g_plug_launch_em_heroic true)
        (sleep_until (<= (absorber_totalcount) 1))
        (if debug 
            (print "absorber activated!"))
        (set g_final_lock true)
        (sleep_until (<= (absorber_totalcount) 0))
        (if debug 
            (print "absorber activated!"))
        (set g_flip_switch true)
        (device_set_position "plug_switch_housing" 1.0)
        (ai_set_orders "covenant" "plug_cov")
        (sleep_until (>= (device_get_position "plug_switch_housing") 1.0) 1 120)
        (sleep 30)
        (object_create "plug_switch")
        (objects_attach "plug_switch_housing" "switch" "plug_switch" "")
        (device_set_power "plug_switch" 1.0)
        (device_set_position "plug_switch" 1.0)
        (sleep 30)
        (sleep_until (>= (device_get_position "plug_switch") 1.0) 1)
        (device_group_change_only_once_more_set "plug" true)
        (sleep_until (<= (device_get_position "plug_switch") 0.0) 1)
        (sleep 60)
        (device_set_power "plug_switch" 0.0)
        (set g_plug_move true)
    )
)

(script command_script void cs_gap_phantom
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 1.0)
        (cs_fly_by wall_gap/p1 4.0)
        (cs_fly_by wall_gap/p2 4.0)
        (wake sc_plug_ride)
        (cs_fly_by wall_gap/p3 4.0)
        (cs_fly_by wall_gap/p9 7.0)
        (if debug 
            (print "placing enforcer..."))
        (ai_place "plug_holder_enforcer")
        (cs_fly_to_and_face wall_gap/p10 wall_gap/p20 3.0)
        (device_group_change_only_once_more_set "plug_door_a" false)
        (sleep 1)
        (if debug 
            (print "opening door... (closing the one behind you)"))
        (device_set_position "plug_door_a" 0.0)
        (device_set_position "plug_door_b" 1.0)
        (sleep 1)
        (if debug 
            (print "placing eliminators..."))
        (ai_place "plug_holder_sen_elim" 2)
        (sleep 1)
        (sleep (* 30.0 5.0))
        (if debug 
            (print "placing initial flood..."))
        (ai_place "plug_holder_flood_a" 1)
        (ai_place "plug_holder_flood_d")
        (ai_place "plug_holder_flood_c")
        (ai_place "plug_holder_flood_d" 1)
        (set g_plug_ride_enforcer true)
        (sound_class_enable_ducker "object_impacts" 1.0 2)
        (sound_class_enable_ducker "vehicle_collision" 1.0 2)
        (cs_vehicle_speed 0.4)
        (cs_fly_by wall_gap/p11 2.0)
        (cs_fly_by wall_gap/p12 2.0)
        (cs_fly_to_and_face wall_gap/p13 wall_gap/p15 10.0)
        (cs_vehicle_speed 1.0)
        (wake objective_floodwall_set)
        (cs_fly_by wall_gap/p15 10.0)
        (cs_fly_by wall_gap/p16 10.0)
        (ai_erase ai_current_squad)
    )
)

(script static void test_phantom
    (begin
        (ai_place "gap_phantom")
        (sleep 1)
        (cs_run_command_script "gap_phantom" cs_gap_phantom)
    )
)

(script dormant void lower_shield
    (begin
        (if debug 
            (print "containment-field created"))
        (object_create "containment_field")
        (sleep_until g_lower_shield 5)
        (if debug 
            (print "lowering the containment-shield"))
        (device_set_position "containment_field" 1.0)
        (sleep_until (>= (device_get_position "containment_field") 1.0))
        (object_destroy "containment_field")
    )
)

(script dormant void bsp0_cleanup
    (begin
        (if debug 
            (print "bsp 0 cleanup..."))
        (object_destroy_containing "bsp0_body")
        (object_destroy_containing "bsp0_weapon")
        (object_destroy_containing "bsp0_equip")
        (object_destroy_containing "bsp0_crate")
        (object_destroy_containing "ins_em")
        (object_destroy_containing "hall_a_em")
        (object_destroy_containing "cond_a_em")
        (object_destroy_containing "hall_b_em")
        (object_destroy_containing "plug_launch_em")
        (object_destroy "piston_ins")
        (object_destroy "piston_a")
        (object_destroy "piston_b")
        (object_destroy "piston_c")
        (object_destroy "absorber_ins")
        (object_destroy "absorber_a")
        (object_destroy "absorber_a")
        (object_destroy "absorber_b")
        (object_destroy "absorber_c")
        (ai_erase "insertion_sentinels")
        (ai_erase "hall_a_sentinels")
        (ai_erase "cond_a_sentinels")
        (ai_erase "hall_b_sentinels")
    )
)

(script dormant void cs_move_plug
    (begin
        (wake lower_shield)
        (sound_impulse_start_effect "sound\visual_effects\sentinel_wall_power_down" none 1.0)
        (ai_kill "plug_launch_sen")
        (ai_kill "plug_launch_enforcer")
        (begin_random
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_a" "emitter" 2.0)
            )
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_b" "emitter" 2.0)
            )
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_c" "emitter" 2.0)
            )
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_d" "emitter" 2.0)
            )
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_e" "emitter" 2.0)
            )
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_f" "emitter" 2.0)
            )
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_g" "emitter" 2.0)
            )
            (begin
                (sleep (random_range 0 10))
                (object_damage_damage_section "plug_launch_em_h" "emitter" 2.0)
            )
        )
        (sleep 30)
        (device_set_position "plug_keylock_c" 1.0)
        (device_set_position "plug_keylock_d" 1.0)
        (if debug 
            (print "opening door..."))
        (device_set_position "plug_door_a" 1.0)
        (object_create "plug_doors_open")
        (sleep_until (>= (device_get_position "plug_door_a") 0.5) 10)
        (data_mine_insert "enc_plug_across")
        (sleep 15)
        (set g_music_06a_04 true)
        (if debug 
            (print "plug down..."))
        (object_dynamic_simulation_disable "plug" false)
        (sleep 1)
        (device_set_position_track "plug" "plug_down" 0.0)
        (device_animate_position "plug" 1.0 2.0 0.05 0.25 false)
        (sleep_until 
            (and
                (>= (device_get_position "plug_door_a") 1.0)
                (volume_test_objects_all "tv_plug_down" (players))
            )
        )
        (object_destroy "plug_keylock_c")
        (object_destroy "plug_keylock_d")
        (wake chapter_remorse)
        (wake objective_lower_specific_clear)
        (sleep 30)
        (device_set_power "plug_switch" 0.0)
        (device_set_position "plug_switch_housing" 0.0)
        (object_destroy "plug_switch")
        (sleep 30)
        (sleep_until (volume_test_objects_all "tv_plug_down" (ai_actors "covenant")) 30 (* 30.0 10.0))
        (if debug 
            (print "initializing tartersauce..."))
        (ai_place "gap_phantom")
        (game_save_no_timeout)
        (if debug 
            (print "plug across..."))
        (device_set_position_track "plug" "plug_across" 0.0)
        (device_animate_position "plug" 1.0 60.0 5.0 5.0 false)
        (sleep 5)
        (sleep_until (>= (device_get_position "plug") 0.035) 1)
        (if debug 
            (print "g_lower_shield set to 1"))
        (sleep_until (>= (device_get_position "plug") 0.15) 5)
        (set g_lower_shield true)
        (sleep_until (>= (device_get_position "plug") 0.5) 5)
        (game_saving)
        (wake bsp0_cleanup)
        (sleep_until (>= (device_get_position "plug") 1.0))
        (sleep 30)
        (if debug 
            (print "plug up..."))
        (device_set_position_track "plug" "plug_up" 0.0)
        (device_animate_position "plug" 1.0 3.0 0.1 1.0 false)
        (ai_set_orders "plug_holder_enforcer" "plugholder_enforcer")
        (sleep_until (>= (device_get_position "plug") 1.0) 10)
        (sleep 1)
        (object_dynamic_simulation_disable "plug" true)
        (set g_music_06a_05 true)
        (device_set_position "plug_lock_a" 1.0)
        (device_set_position "plug_lock_b" 1.0)
        (device_set_position "plug_lock_c" 1.0)
        (device_set_position "plug_lock_d" 1.0)
        (device_set_position "plug_lock_e" 1.0)
        (device_set_position "plug_lock_f" 1.0)
    )
)

(script command_script void cs_gap_flood_jump
    (begin
        (cs_enable_moving true)
        (sleep (random_range 20 50))
        (cs_jump 30.0 5.0)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (sleep (* 30.0 3.0))
        (object_can_take_damage (ai_get_object ai_current_actor))
    )
)

(script static void gap_flood_jump
    (begin
        (cs_run_command_script ai_current_squad cs_gap_flood_jump)
    )
)

(script command_script void invulnerable
    (begin
        (cs_enable_moving true)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (sleep_until (>= (ai_combat_status ai_current_actor) ai_combat_status_certain))
        (sleep (* 30.0 1.0))
        (object_can_take_damage (ai_get_object ai_current_actor))
    )
)

(script static void make_invulnerable
    (begin
        (cs_run_command_script ai_current_squad invulnerable)
    )
)

(script dormant void close_plugholder_door
    (begin
        (sleep 150)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_plugholder_a" (players)))
                (not (volume_test_objects "tv_plugholder_b" (players)))
            )
        )
        (device_set_position "plugholder_door" 0.0)
    )
)

(script static void ai_plug_holder_em_a
    (begin
        (if debug 
            (print "a"))
        (ai_place "plug_holder_sen/a")
        (set g_plug_holder_count (+ g_plug_holder_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_em_b
    (begin
        (if debug 
            (print "b"))
        (ai_place "plug_holder_sen/b")
        (set g_plug_holder_count (+ g_plug_holder_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_em_d
    (begin
        (if debug 
            (print "d"))
        (ai_place "plug_holder_sen/d")
        (set g_plug_holder_count (+ g_plug_holder_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_em_f
    (begin
        (if debug 
            (print "f"))
        (ai_place "plug_holder_sen/f")
        (set g_plug_holder_count (+ g_plug_holder_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_em_h
    (begin
        (if debug 
            (print "h"))
        (ai_place "plug_holder_sen/h")
        (set g_plug_holder_count (+ g_plug_holder_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_em_i
    (begin
        (if debug 
            (print "i"))
        (ai_place "plug_holder_sen/i")
        (set g_plug_holder_count (+ g_plug_holder_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script dormant void ai_plug_holder_em
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_plug_holder_limit 0)
                    (set g_plug_holder_index 2)
                    (set g_plug_holder_wave_limit 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_plug_holder_limit 0)
                        (set g_plug_holder_index 3)
                        (set g_plug_holder_wave_limit 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_plug_holder_limit 1)
                            (set g_plug_holder_index 4)
                            (set g_plug_holder_wave_limit 3)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "plug_holder_sentinels") g_plug_holder_limit))
                (if g_plugholder_progress 
                    (sleep_forever))
                (sleep g_emitter_delay)
                (set g_plug_holder_count 0)
                (set g_plug_holder_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "plug_holder_em_a"))
                                (> (object_get_health "plug_holder_em_a") 0.0)
                                (> (objects_distance_to_object (players) "plug_holder_em_a") 6.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_plug_holder_em_a)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "plug_holder_em_b"))
                                        (> (object_get_health "plug_holder_em_b") 0.0)
                                        (> (objects_distance_to_object (players) "plug_holder_em_b") 6.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_plug_holder_em_b)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "plug_holder_em_d"))
                                                (> (object_get_health "plug_holder_em_d") 0.0)
                                                (> (objects_distance_to_object (players) "plug_holder_em_d") 6.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_plug_holder_em_d)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "plug_holder_em_f"))
                                                        (> (object_get_health "plug_holder_em_f") 0.0)
                                                        (> (objects_distance_to_object (players) "plug_holder_em_f") 6.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_plug_holder_em_f)
                                                        ) (if 
                                                            (and
                                                                (not (unit_is_emitting "plug_holder_em_h"))
                                                                (> (object_get_health "plug_holder_em_h") 0.0)
                                                                (> (objects_distance_to_object (players) "plug_holder_em_h") 6.0)
                                                                (<= (random_range 0 10) 3)
                                                            ) 
                                                                (begin
                                                                    (ai_plug_holder_em_h)
                                                                ) (if 
                                                                    (and
                                                                        (not (unit_is_emitting "plug_holder_em_i"))
                                                                        (> (object_get_health "plug_holder_em_i") 0.0)
                                                                        (> (objects_distance_to_object (players) "plug_holder_em_i") 6.0)
                                                                        (<= (random_range 0 10) 3)
                                                                    ) 
                                                                        (begin
                                                                            (ai_plug_holder_em_i)
                                                                        ) (if true 
                                                                            (begin
                                                                                (begin
                                                                                    (ai_place "plug_holder_sen")
                                                                                    (set g_plug_holder_count (+ g_plug_holder_count 1.0))
                                                                                    (if debug 
                                                                                        (print "placing random sentinel (or none at all)..."))
                                                                                )
                                                                            ) )
                                                                )
                                                        )
                                                )
                                        )
                                )
                        )
                        (if (= g_plug_holder_count g_plug_holder_index) 
                            (set g_plug_holder_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_plug_holder_wave
                    )
                )
                (set g_plug_holder_wave_count (+ g_plug_holder_wave_count 1.0))
                (if (= g_plug_holder_wave_count g_plug_holder_wave_limit) 
                    (set g_plugholder_progress true))
                g_plugholder_progress
            )
        )
    )
)

(script dormant void ai_plug_holder_em_elim
    (begin
        (sleep_until (<= (ai_living_count "plug_holder_enforcer") 0))
        (if debug 
            (print "plug holder enforcer dead. initializing eliminators..."))
        (sleep g_emitter_delay)
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "plug_holder_sen_elim") 0))
                (if g_plugholder_progress 
                    (sleep_forever))
                (if debug 
                    (print "eliminator!"))
                (ai_place "plug_holder_sen_elim")
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                g_plugholder_progress
            )
        )
    )
)

(script dormant void ai_plug_holder_flood
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "plug_holder_flood") 1))
                (if g_plugholder_progress 
                    (sleep_forever))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (if (volume_test_objects "tv_plugholder_a" (players)) 
                    (begin
                        (begin
                            (if debug 
                                (print "placing flood a..."))
                            (ai_place "plug_holder_flood_c")
                            (ai_place "plug_holder_flood_d")
                        )
                    ) (if (volume_test_objects "tv_plugholder_b" (players)) 
                        (begin
                            (begin
                                (if debug 
                                    (print "placing flood b..."))
                                (ai_place "plug_holder_flood_a")
                                (ai_place "plug_holder_flood_b")
                            )
                        ) )
                )
                g_plugholder_progress
            )
        )
    )
)

(script static void ai_plug_holder_bk_em_a
    (begin
        (if debug 
            (print "a back"))
        (ai_place "plug_holder_bk_sen/a")
        (set g_plug_holder_bk_count (+ g_plug_holder_bk_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_bk_em_b
    (begin
        (if debug 
            (print "b back"))
        (ai_place "plug_holder_bk_sen/b")
        (set g_plug_holder_bk_count (+ g_plug_holder_bk_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_bk_em_c
    (begin
        (if debug 
            (print "c back"))
        (ai_place "plug_holder_bk_sen/c")
        (set g_plug_holder_bk_count (+ g_plug_holder_bk_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_bk_em_d
    (begin
        (if debug 
            (print "d back"))
        (ai_place "plug_holder_bk_sen/d")
        (set g_plug_holder_bk_count (+ g_plug_holder_bk_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_bk_em_e
    (begin
        (if debug 
            (print "e back"))
        (ai_place "plug_holder_bk_sen/e")
        (set g_plug_holder_bk_count (+ g_plug_holder_bk_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_plug_holder_bk_em_f
    (begin
        (if debug 
            (print "f back"))
        (ai_place "plug_holder_bk_sen/f")
        (set g_plug_holder_bk_count (+ g_plug_holder_bk_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script dormant void ai_plug_holder_bk_em
    (begin
        (sleep_until (<= (ai_living_count "plug_holder_sentinels") 2))
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_plug_holder_bk_limit 0)
                    (set g_plug_holder_bk_index 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_plug_holder_bk_limit 0)
                        (set g_plug_holder_bk_index 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_plug_holder_bk_limit 1)
                            (set g_plug_holder_bk_index 2)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "plug_holder_sentinels_bk") g_plug_holder_bk_limit))
                (if g_plug_holder_bk_loops 
                    (sleep_forever))
                (sleep g_emitter_delay)
                (set g_plug_holder_bk_count 0)
                (set g_plug_holder_bk_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "plug_holder_bk_em_a"))
                                (> (object_get_health "plug_holder_bk_em_a") 0.0)
                                (> (objects_distance_to_object (players) "plug_holder_bk_em_a") 0.0)
                                (> (objects_distance_to_object (players) "plug_holder_bk_em_a") 8.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_plug_holder_bk_em_a)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "plug_holder_bk_em_b"))
                                        (> (object_get_health "plug_holder_bk_em_b") 0.0)
                                        (> (objects_distance_to_object (players) "plug_holder_bk_em_b") 0.0)
                                        (> (objects_distance_to_object (players) "plug_holder_bk_em_b") 8.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_plug_holder_bk_em_b)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "plug_holder_bk_em_c"))
                                                (> (object_get_health "plug_holder_bk_em_c") 0.0)
                                                (> (objects_distance_to_object (players) "plug_holder_bk_em_c") 0.0)
                                                (> (objects_distance_to_object (players) "plug_holder_bk_em_c") 8.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_plug_holder_bk_em_c)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "plug_holder_bk_em_d"))
                                                        (> (object_get_health "plug_holder_bk_em_d") 0.0)
                                                        (> (objects_distance_to_object (players) "plug_holder_bk_em_d") 0.0)
                                                        (> (objects_distance_to_object (players) "plug_holder_bk_em_d") 8.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_plug_holder_bk_em_d)
                                                        ) (if 
                                                            (and
                                                                (not (unit_is_emitting "plug_holder_bk_em_e"))
                                                                (> (object_get_health "plug_holder_bk_em_e") 0.0)
                                                                (> (objects_distance_to_object (players) "plug_holder_bk_em_e") 0.0)
                                                                (> (objects_distance_to_object (players) "plug_holder_bk_em_e") 8.0)
                                                                (<= (random_range 0 10) 3)
                                                            ) 
                                                                (begin
                                                                    (ai_plug_holder_bk_em_e)
                                                                ) (if 
                                                                    (and
                                                                        (not (unit_is_emitting "plug_holder_bk_em_f"))
                                                                        (> (object_get_health "plug_holder_bk_em_f") 0.0)
                                                                        (> (objects_distance_to_object (players) "plug_holder_bk_em_f") 0.0)
                                                                        (> (objects_distance_to_object (players) "plug_holder_bk_em_f") 8.0)
                                                                        (<= (random_range 0 10) 3)
                                                                    ) 
                                                                        (begin
                                                                            (ai_plug_holder_bk_em_f)
                                                                        ) (if true 
                                                                            (begin
                                                                                (begin
                                                                                    (ai_place "plug_holder_bk_sen")
                                                                                    (set g_plug_holder_bk_count (+ g_plug_holder_bk_count 1.0))
                                                                                )
                                                                            ) )
                                                                )
                                                        )
                                                )
                                        )
                                )
                        )
                        (if (= g_plug_holder_bk_count g_plug_holder_bk_index) 
                            (set g_plug_holder_bk_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_plug_holder_bk_wave
                    )
                )
                g_plug_holder_bk_loops
            )
        )
    )
)

(script dormant void ai_plugholder_flood_bk
    (begin
        (if (difficulty_normal) 
            (begin
                (set g_plugholder_bk_flood_limit 4)
            ) (if (difficulty_heroic) 
                (begin
                    (set g_plugholder_bk_flood_limit 5)
                ) (if (difficulty_legendary) 
                    (begin
                        (set g_plugholder_bk_flood_limit 6)
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "plug_holder_flood_bk") 2))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (ai_place "plugholder_bk_flood_a")
                (ai_place "plugholder_bk_infec_a")
                (set g_plugholder_bk_flood_count (+ g_plugholder_bk_flood_count 1.0))
                (if (= g_plugholder_bk_flood_count g_plugholder_bk_flood_limit) 
                    (set g_plugholder_bk_a true))
                g_plugholder_bk_a
            )
        )
        (set g_plugholder_bk_flood_count 0)
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "plug_holder_flood_bk") 2))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (ai_place "plugholder_bk_flood_b")
                (ai_place "plugholder_bk_infec_b")
                (set g_plugholder_bk_flood_count (+ g_plugholder_bk_flood_count 1.0))
                (if (= g_plugholder_bk_flood_count g_plugholder_bk_flood_limit) 
                    (set g_plugholder_bk_b true))
                g_plugholder_bk_b
            )
        )
    )
)

(script dormant void ai_plugholder_infec_bk_a
    (begin
        (sleep_until (>= g_plugholder_bk_flood_count 2))
        (if debug 
            (print "infection forms..."))
        (ai_place "plugholder_bk_infec_a")
        (sleep_until (>= g_plugholder_bk_flood_count 4))
        (if debug 
            (print "infection forms..."))
        (ai_place "plugholder_bk_infec_a")
        (sleep_until (>= g_plugholder_bk_flood_count 6))
        (if debug 
            (print "infection forms..."))
        (ai_place "plugholder_bk_infec_a")
    )
)

(script dormant void ai_plugholder_infec_bk_b
    (begin
        (sleep_until (>= g_plugholder_bk_flood_count 2))
        (if debug 
            (print "infection forms..."))
        (ai_place "plugholder_bk_infec_b")
        (sleep_until (>= g_plugholder_bk_flood_count 4))
        (if debug 
            (print "infection forms..."))
        (ai_place "plugholder_bk_infec_b")
        (sleep_until (>= g_plugholder_bk_flood_count 6))
        (if debug 
            (print "infection forms..."))
        (ai_place "plugholder_bk_infec_b")
    )
)

(script dormant void kill_hall_c_marines
    (begin
        (begin_random
            (begin
                (ai_kill "hall_c_marines/a")
                (sleep 5)
            )
            (begin
                (ai_kill "hall_c_marines/b")
                (sleep 5)
            )
            (begin
                (ai_kill "hall_c_marines/c")
                (sleep 5)
            )
            (begin
                (ai_kill "hall_c_marines/d")
                (sleep 5)
            )
        )
    )
)

(script dormant void ai_hall_c_ini
    (begin
        (ai_place "hall_c_marines")
        (ai_place "hall_c_flood_far")
        (wake sc_marines_b)
        (ai_place "hall_c_infec")
    )
)

(script static void ai_hall_c_flood_d
    (begin
        (if (< (ai_living_count "hall_c_flood") 3) 
            (begin
                (ai_place "hall_c_flood_d")
                (set g_hall_c_flood_count (+ g_hall_c_flood_count 1.0))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
            )
        )
    )
)

(script static void ai_hall_c_flood_e
    (begin
        (if (< (ai_living_count "hall_c_flood") 3) 
            (begin
                (ai_place "hall_c_flood_e")
                (set g_hall_c_flood_count (+ g_hall_c_flood_count 1.0))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
            )
        )
    )
)

(script static void ai_hall_c_flood_f
    (begin
        (if (< (ai_living_count "hall_c_flood") 3) 
            (begin
                (ai_place "hall_c_flood_f")
                (set g_hall_c_flood_count (+ g_hall_c_flood_count 1.0))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
            )
        )
    )
)

(script dormant void ai_hall_c_flood_spawn
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_hall_c_d" (players)) 
                    (begin
                        (ai_hall_c_flood_e)
                    ) (if (volume_test_objects "tv_hall_c_e" (players)) 
                        (begin
                            (ai_hall_c_flood_f)
                        ) )
                )
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (if (>= g_hall_c_flood_count g_hall_c_flood_index) 
                    true false)
            )
        )
    )
)

(script dormant void ai_ledge_a_initial
    (begin
        (ai_place "ledge_a_enforcer")
        (ai_place "ledge_a_sen_ini")
        (ai_place "ledge_a_flood_ini")
    )
)

(script dormant void ai_ledge_a_location
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_ledge_a" (players)) 
                    (begin
                        (set g_ledge_a_player_loc 1)
                    ) (if (volume_test_objects "tv_ledge_a_top_b" (players)) 
                        (begin
                            (set g_ledge_a_player_loc 2)
                        ) (if (volume_test_objects "tv_ledge_a_top_c" (players)) 
                            (begin
                                (set g_ledge_a_player_loc 3)
                            ) (if (volume_test_objects "tv_ledge_a_top_d1" (players)) 
                                (begin
                                    (set g_ledge_a_player_loc 4)
                                ) (if (volume_test_objects "tv_ledge_a_top_d2" (players)) 
                                    (begin
                                        (set g_ledge_a_player_loc 5)
                                    ) (if (volume_test_objects "tv_ledge_a_top_e" (players)) 
                                        (begin
                                            (set g_ledge_a_player_loc 6)
                                        ) (if (volume_test_objects "tv_ledge_a_top_f" (players)) 
                                            (begin
                                                (set g_ledge_a_player_loc 7)
                                            ) (if (volume_test_objects "tv_ledge_a_top_g" (players)) 
                                                (begin
                                                    (set g_ledge_a_player_loc 8)
                                                ) (if (volume_test_objects "tv_ledge_a_bot_a" (players)) 
                                                    (begin
                                                        (set g_ledge_a_player_loc 9)
                                                    ) (if (volume_test_objects "tv_ledge_a_bot_b" (players)) 
                                                        (begin
                                                            (set g_ledge_a_player_loc 10)
                                                        ) )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
                false
            )
        )
    )
)

(script static void ai_ledge_a_flood_b
    (begin
        (if debug 
            (print "flood b"))
        (ai_place "ledge_a_flood_b")
    )
)

(script static void ai_ledge_a_flood_c
    (begin
        (if debug 
            (print "flood c"))
        (ai_place "ledge_a_flood_c")
    )
)

(script static void ai_ledge_a_flood_e
    (begin
        (if debug 
            (print "flood e"))
        (ai_place "ledge_a_flood_e")
    )
)

(script static void ai_ledge_a_flood_f
    (begin
        (if debug 
            (print "flood f"))
        (ai_place "ledge_a_flood_f")
    )
)

(script dormant void ai_ledge_a_flood_spawn
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "ledge_a_flood") 2))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (if (= g_ledge_a_player_loc 2) 
                    (begin
                        (ai_ledge_a_flood_b)
                    ) (if (= g_ledge_a_player_loc 3) 
                        (begin
                            (ai_ledge_a_flood_c)
                        ) (if (= g_ledge_a_player_loc 6) 
                            (begin
                                (ai_ledge_a_flood_e)
                            ) (if (= g_ledge_a_player_loc 7) 
                                (begin
                                    (ai_ledge_a_flood_f)
                                ) )
                        )
                    )
                )
                (or
                    (>= (ai_spawn_count "ledge_a_flood") 16)
                    g_ledge_a_spawn
                )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "ledge_a_flood") 2))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (if (= g_ledge_a_player_loc 6) 
                    (begin
                        (ai_ledge_a_flood_e)
                    ) (if (= g_ledge_a_player_loc 7) 
                        (begin
                            (ai_ledge_a_flood_f)
                        ) )
                )
                (or
                    (>= (ai_spawn_count "ledge_a_flood") 32)
                    g_ledge_a_spawn
                )
            )
        )
    )
)

(script dormant void ai_ledge_a_flood_bot_a
    (begin
        (sleep_until (volume_test_objects "tv_ledge_a_bot_a" (players)))
        (ai_place "ledge_a_flood_bot_a")
    )
)

(script dormant void ai_ledge_a_flood_bot_b
    (begin
        (sleep_until (volume_test_objects "tv_ledge_a_bot_b" (players)))
        (ai_place "ledge_a_flood_bot_b")
    )
)

(script static void ai_ledge_a_em_a
    (begin
        (if debug 
            (print "a"))
        (ai_place "ledge_a_sen/a")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_b
    (begin
        (if debug 
            (print "b"))
        (ai_place "ledge_a_sen/b")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_c
    (begin
        (if debug 
            (print "c"))
        (ai_place "ledge_a_sen/c")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_d
    (begin
        (if debug 
            (print "d"))
        (ai_place "ledge_a_sen/d")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_e
    (begin
        (if debug 
            (print "e"))
        (ai_place "ledge_a_sen/e")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_f
    (begin
        (if debug 
            (print "f"))
        (ai_place "ledge_a_sen/f")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_g
    (begin
        (if debug 
            (print "g"))
        (ai_place "ledge_a_sen/g")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_h
    (begin
        (if debug 
            (print "h"))
        (ai_place "ledge_a_sen/h")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script static void ai_ledge_a_em_i
    (begin
        (if debug 
            (print "i"))
        (ai_place "ledge_a_sen/i")
        (set g_ledge_a_count (+ g_ledge_a_count 1.0))
        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
    )
)

(script dormant void ai_ledge_a_emitters
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_ledge_a_sen_limit 0)
                    (set g_ledge_a_index 2)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_ledge_a_sen_limit 0)
                        (set g_ledge_a_index 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_ledge_a_sen_limit 1)
                            (set g_ledge_a_index 3)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "ledge_a_sentinels") g_ledge_a_sen_limit))
                (sleep g_emitter_delay)
                (set g_ledge_a_count 0)
                (set g_ledge_a_wave false)
                (sleep_until 
                    (begin
                        (if 
                            (and
                                (not (unit_is_emitting "ledge_a_em_a"))
                                (> (object_get_health "ledge_a_em_a") 0.0)
                                (> (objects_distance_to_object (players) "ledge_a_em_a") 0.0)
                                (< (objects_distance_to_object (players) "ledge_a_em_a") 9.0)
                                (<= (random_range 0 10) 3)
                            ) 
                                (begin
                                    (ai_ledge_a_em_a)
                                ) (if 
                                    (and
                                        (not (unit_is_emitting "ledge_a_em_b"))
                                        (> (object_get_health "ledge_a_em_b") 0.0)
                                        (> (objects_distance_to_object (players) "ledge_a_em_b") 0.0)
                                        (< (objects_distance_to_object (players) "ledge_a_em_b") 9.0)
                                        (<= (random_range 0 10) 3)
                                    ) 
                                        (begin
                                            (ai_ledge_a_em_b)
                                        ) (if 
                                            (and
                                                (not (unit_is_emitting "ledge_a_em_c"))
                                                (> (object_get_health "ledge_a_em_c") 0.0)
                                                (> (objects_distance_to_object (players) "ledge_a_em_c") 0.0)
                                                (< (objects_distance_to_object (players) "ledge_a_em_c") 9.0)
                                                (<= (random_range 0 10) 3)
                                            ) 
                                                (begin
                                                    (ai_ledge_a_em_c)
                                                ) (if 
                                                    (and
                                                        (not (unit_is_emitting "ledge_a_em_d"))
                                                        (> (object_get_health "ledge_a_em_d") 0.0)
                                                        (> (objects_distance_to_object (players) "ledge_a_em_d") 0.0)
                                                        (< (objects_distance_to_object (players) "ledge_a_em_d") 9.0)
                                                        (<= (random_range 0 10) 3)
                                                    ) 
                                                        (begin
                                                            (ai_ledge_a_em_d)
                                                        ) (if 
                                                            (and
                                                                (not (unit_is_emitting "ledge_a_em_e"))
                                                                (> (object_get_health "ledge_a_em_e") 0.0)
                                                                (> (objects_distance_to_object (players) "ledge_a_em_e") 0.0)
                                                                (< (objects_distance_to_object (players) "ledge_a_em_e") 9.0)
                                                                (<= (random_range 0 10) 3)
                                                            ) 
                                                                (begin
                                                                    (ai_ledge_a_em_e)
                                                                ) (if 
                                                                    (and
                                                                        (not (unit_is_emitting "ledge_a_em_f"))
                                                                        (> (object_get_health "ledge_a_em_f") 0.0)
                                                                        (> (objects_distance_to_object (players) "ledge_a_em_f") 0.0)
                                                                        (< (objects_distance_to_object (players) "ledge_a_em_f") 9.0)
                                                                        (<= (random_range 0 10) 3)
                                                                    ) 
                                                                        (begin
                                                                            (ai_ledge_a_em_f)
                                                                        ) (if 
                                                                            (and
                                                                                (not (unit_is_emitting "ledge_a_em_g"))
                                                                                (> (object_get_health "ledge_a_em_g") 0.0)
                                                                                (> (objects_distance_to_object (players) "ledge_a_em_g") 0.0)
                                                                                (< (objects_distance_to_object (players) "ledge_a_em_g") 9.0)
                                                                                (<= (random_range 0 10) 3)
                                                                            ) 
                                                                                (begin
                                                                                    (ai_ledge_a_em_g)
                                                                                ) (if 
                                                                                    (and
                                                                                        (not (unit_is_emitting "ledge_a_em_h"))
                                                                                        (> (object_get_health "ledge_a_em_h") 0.0)
                                                                                        (> (objects_distance_to_object (players) "ledge_a_em_h") 0.0)
                                                                                        (< (objects_distance_to_object (players) "ledge_a_em_h") 9.0)
                                                                                        (<= (random_range 0 10) 3)
                                                                                    ) 
                                                                                        (begin
                                                                                            (ai_ledge_a_em_h)
                                                                                        ) (if 
                                                                                            (and
                                                                                                (not (unit_is_emitting "ledge_a_em_i"))
                                                                                                (> (object_get_health "ledge_a_em_i") 0.0)
                                                                                                (> (objects_distance_to_object (players) "ledge_a_em_i") 0.0)
                                                                                                (< (objects_distance_to_object (players) "ledge_a_em_i") 9.0)
                                                                                                (<= (random_range 0 10) 3)
                                                                                            ) 
                                                                                                (begin
                                                                                                    (ai_ledge_a_em_i)
                                                                                                ) )
                                                                                )
                                                                        )
                                                                )
                                                        )
                                                )
                                        )
                                )
                        )
                        (if (= g_ledge_a_count g_ledge_a_index) 
                            (set g_ledge_a_wave true))
                        (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                        g_ledge_a_wave
                    )
                )
                g_ledge_a_loops
            )
        )
    )
)

(script dormant void kill_cond_b_marines
    (begin
        (begin_random
            (begin
                (ai_kill "cond_b_humans/a")
                (sleep 5)
            )
            (begin
                (ai_kill "cond_b_humans/b")
                (sleep 5)
            )
            (begin
                (ai_kill "cond_b_humans/c")
                (sleep 5)
            )
        )
    )
)

(script dormant void conduit_b_locator
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_cond_b_a1" (players)) 
                    (begin
                        (set cond_b_locator 1)
                    ) (if (volume_test_objects "tv_cond_b_a2" (players)) 
                        (begin
                            (set cond_b_locator 2)
                        ) (if (volume_test_objects "tv_cond_b_b1" (players)) 
                            (begin
                                (set cond_b_locator 3)
                            ) (if (volume_test_objects "tv_cond_b_b2" (players)) 
                                (begin
                                    (set cond_b_locator 4)
                                ) (if (volume_test_objects "tv_cond_b_c" (players)) 
                                    (begin
                                        (set cond_b_locator 5)
                                    ) )
                            )
                        )
                    )
                )
                false
            )
        )
    )
)

(script dormant void ai_cond_b_carrier_a
    (begin
        (sleep_until 
            (or
                (= cond_b_flood_count 2)
                (volume_test_objects "tv_cond_b_a2" (players))
            )
        )
        (ai_place "cond_b_carrier_a")
        (sleep_until (= cond_b_flood_count 4))
        (if (> cond_b_locator 1) 
            (sleep_forever))
        (ai_place "cond_b_carrier_a")
        (sleep_until (= cond_b_flood_count 6))
        (if (> cond_b_locator 1) 
            (sleep_forever))
        (ai_place "cond_b_carrier_a")
    )
)

(script command_script void cs_cond_b_damage_enf
    (begin
        (sleep 5)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "l_arm" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "l_rocket" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "l_thruster" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "l_shield_gen" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "r_arm" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "r_rocket" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "r_thruster" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "r_shield_gen" 1.0)
        (sleep 1)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "r_shield_gen" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "r_arm" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "r_rocket" 1.0)
        (object_damage_damage_section (ai_get_object "cond_b_enforcer/a") "l_thruster" 1.0)
    )
)

(script dormant void ai_cond_b_b_em
    (begin
        (sleep_until (<= (ai_living_count "cond_b_sen_b") 0))
        (sleep g_emitter_delay)
        (if (= (random_range 0 2) 0) 
            (ai_place "cond_b_sen_b/a") (ai_place "cond_b_sen_b/b"))
    )
)

(script dormant void ai_cond_b_flood_spawn
    (begin
        (ai_place "cond_b_flood_a_ini_a")
        (ai_place "cond_b_flood_a_ini_b")
        (ai_place "cond_b_flood_a_ini_c")
        (if (difficulty_normal) 
            (begin
                (set cond_b_flood_limit 1)
            ) (if (difficulty_heroic) 
                (begin
                    (set cond_b_flood_limit 2)
                ) (if (difficulty_legendary) 
                    (begin
                        (set cond_b_flood_limit 4)
                    ) )
            )
        )
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "cond_b_flood") 1))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (if (= cond_b_locator 1) 
                    (begin
                        (ai_place "cond_b_flood_a")
                        (set cond_b_flood_count (+ cond_b_flood_count 1.0))
                        (if (= cond_b_flood_count cond_b_flood_limit) 
                            (set cond_b_flood_a_spawn true))
                        (sleep 30)
                        (ai_magically_see_object "cond_b_flood" (player0))
                        (ai_magically_see_object "cond_b_flood" (player1))
                    )
                )
                cond_b_flood_a_spawn
            )
        )
        (set cond_b_flood_count 0)
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "cond_b_flood") 1))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (if (= cond_b_locator 3) 
                    (begin
                        (ai_place "cond_b_flood_b")
                        (set cond_b_flood_count (+ cond_b_flood_count 1.0))
                        (if (= cond_b_flood_count cond_b_flood_limit) 
                            (set cond_b_flood_b_spawn true))
                        (sleep 30)
                        (ai_magically_see_object "cond_b_flood" (player0))
                        (ai_magically_see_object "cond_b_flood" (player1))
                    )
                )
                cond_b_flood_b_spawn
            )
        )
        (set cond_b_flood_count 0)
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "cond_b_flood") 1))
                (sleep (random_range g_sleep_lower_bound g_sleep_upper_bound))
                (if (= cond_b_locator 3) 
                    (begin
                        (ai_place "cond_b_flood_c")
                        (set cond_b_flood_count (+ cond_b_flood_count 1.0))
                        (if (= cond_b_flood_count cond_b_flood_limit) 
                            (set cond_b_flood_c_spawn true))
                        (sleep 30)
                        (ai_magically_see_object "cond_b_flood" (player0))
                        (ai_magically_see_object "cond_b_flood" (player1))
                    )
                )
                cond_b_flood_c_spawn
            )
        )
    )
)

(script command_script void cs_cond_b_sen_tube_a
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face cond_b/p0 cond_b/p1)
        (cs_fly_to cond_b/p1)
        (cs_fly_to cond_b/p2)
        (cs_fly_to cond_b/p3)
    )
)

(script command_script void cs_cond_b_sen_tube_b
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face cond_b/p1 cond_b/p2)
        (cs_fly_to cond_b/p2)
        (cs_fly_to cond_b/p3)
    )
)

(script dormant void ai_cond_b_sen_tube_b
    (begin
        (if (= (random_range 0 2) 0) 
            (ai_place "cond_b_sen_tube_b/a") (ai_place "cond_b_sen_tube_b/b"))
        (if (= (random_range 0 2) 0) 
            (ai_place "cond_b_sen_tube_b/c") (ai_place "cond_b_sen_tube_b/d"))
        (sleep 5)
        (cs_run_command_script "cond_b_sen_tube_b/a" cs_cond_b_sen_tube_a)
        (cs_run_command_script "cond_b_sen_tube_b/b" cs_cond_b_sen_tube_a)
        (cs_run_command_script "cond_b_sen_tube_b/c" cs_cond_b_sen_tube_b)
        (cs_run_command_script "cond_b_sen_tube_b/d" cs_cond_b_sen_tube_b)
    )
)

(script dormant void slide_a_player0
    (begin
        (sleep_until (volume_test_object "tv_slide_a" (player0)))
        (object_cannot_take_damage (player0))
        (sleep_until (not (volume_test_objects "tv_slide_a" (player0))))
        (object_can_take_damage (player0))
    )
)

(script dormant void slide_a_player1
    (begin
        (sleep_until (volume_test_object "tv_slide_a" (player1)))
        (object_cannot_take_damage (player1))
        (sleep_until (not (volume_test_objects "tv_slide_a" (player1))))
        (object_can_take_damage (player1))
    )
)

(script dormant void slide_b_player0
    (begin
        (sleep_until (volume_test_object "tv_slide_b" (player0)))
        (object_cannot_take_damage (player0))
        (sleep_until (not (volume_test_objects "tv_slide_b" (player0))))
        (object_can_take_damage (player0))
    )
)

(script dormant void slide_b_player1
    (begin
        (sleep_until (volume_test_object "tv_slide_b" (player1)))
        (object_cannot_take_damage (player1))
        (sleep_until (not (volume_test_objects "tv_slide_b" (player1))))
        (object_can_take_damage (player1))
    )
)

(script dormant void ai_ledge_c_flood_ini
    (begin
        (ai_place "ledge_c_flood_fr")
        (ai_place "ledge_c_flood_dead")
        (ai_kill_silent "ledge_c_flood_dead")
        (sleep 1)
        (sleep_until (<= (ai_living_count "ledge_c_flood") 0))
        (if 
            (and
                ledge_c_spawn
                (volume_test_objects_all "tv_ledge_c_fr" (players))
            ) 
                (ai_place "ledge_c_flood_bk"))
    )
)

(script dormant void ai_ledge_c_infection_spawn
    (begin
        (if (difficulty_normal) 
            (begin
                (set ledge_c_infec_limit 3)
            ) (if (difficulty_heroic) 
                (begin
                    (set ledge_c_infec_limit 6)
                ) (if (difficulty_legendary) 
                    (begin
                        (set ledge_c_infec_limit 9)
                    ) )
            )
        )
        (sleep_until (volume_test_objects_all "tv_ledge_c_fr" (players)))
        (sleep (random_range 120 180))
        (sleep_until 
            (begin
                (ai_place "ledge_c_infec_fr")
                (set ledge_c_infec_count (+ ledge_c_infec_count 1.0))
                (sleep_until (<= (ai_swarm_count "ledge_c_infec_fr") 5))
                (= ledge_c_infec_count ledge_c_infec_limit)
            )
        )
    )
)

(script command_script void cs_ledge_c_phantom
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 1.0)
        (cs_look true ledge_c_phantom/p1)
        (sleep_until g_ledge_c_phantom_start)
        (cs_look false ledge_c_phantom/p1)
        (cs_turn_sharpness true 0.7)
        (sleep_until g_ledge_c_phantom_1 5 150)
        (cs_look true ledge_c_phantom/p3)
        (sleep 60)
        (cs_look false ledge_c_phantom/p3)
        (cs_fly_by ledge_c_phantom/p2 4.0)
        (cs_fly_by ledge_c_phantom/p3 4.0)
        (cs_fly_by ledge_c_phantom/p4 6.0)
        (cs_fly_by ledge_c_phantom/p5 6.0)
        (cs_fly_by ledge_c_phantom/p6 10.0)
        (ai_erase ai_current_squad)
    )
)

(script dormant void cs_mortar_a
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_a")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_b")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_c")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_d")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_e")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_f")
                        (sleep (random_range 15 45))
                    )
                )
                g_mortar_fire
            )
        )
    )
)

(script dormant void cs_mortar_b
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_a")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_b")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_c")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_d")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_e")
                        (sleep (random_range 15 45))
                    )
                    (begin
                        (effect_new "effects\design\mortar_emitter\mortar_emitter" "mortar_f")
                        (sleep (random_range 15 45))
                    )
                )
                g_mortar_fire
            )
        )
    )
)

(script command_script void cs_go_to_bridge
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to qz_ini/p0)
        (cs_go_to qz_ini/p1)
        (cs_go_to qz_ini/bridge)
    )
)

(script dormant void ai_cov_ins_pod_a
    (begin
        (ai_place "qz_ini_ins_pods/a")
        (object_create "qz_ent_pod_a")
        (objects_attach "qz_ent_pod_a" "pod_attach" (ai_vehicle_get "qz_ini_ins_pods/a") "pod_attach")
        (sleep 1)
        (device_set_position "qz_ent_pod_a" 1.0)
        (sleep_until (>= (device_get_position "qz_ent_pod_a") 1.0) 1)
        (objects_detach "qz_ent_pod_a" (ai_vehicle_get "qz_ini_ins_pods/a"))
        (object_destroy "qz_ent_pod_a")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "qz_ini_ins_pods/a") "door" 500.0)
        (sleep 15)
        (ai_vehicle_exit "qz_ini_ins_pods/a")
    )
)

(script dormant void ai_cov_ins_pod_b
    (begin
        (ai_place "qz_ini_ins_pods/b")
        (object_create "qz_ent_pod_b")
        (objects_attach "qz_ent_pod_b" "pod_attach" (ai_vehicle_get "qz_ini_ins_pods/b") "pod_attach")
        (sleep 1)
        (device_set_position "qz_ent_pod_b" 1.0)
        (sleep_until (>= (device_get_position "qz_ent_pod_b") 1.0) 1)
        (objects_detach "qz_ent_pod_b" (ai_vehicle_get "qz_ini_ins_pods/b"))
        (object_destroy "qz_ent_pod_b")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "qz_ini_ins_pods/b") "door" 500.0)
        (sleep 15)
        (ai_vehicle_exit "qz_ini_ins_pods/b")
    )
)

(script dormant void ai_cov_ins_pod_c
    (begin
        (ai_place "qz_ini_ins_pods/c")
        (object_create "qz_ent_pod_c")
        (objects_attach "qz_ent_pod_c" "pod_attach" (ai_vehicle_get "qz_ini_ins_pods/c") "pod_attach")
        (sleep 1)
        (device_set_position "qz_ent_pod_c" 1.0)
        (sleep_until (>= (device_get_position "qz_ent_pod_c") 1.0) 1)
        (objects_detach "qz_ent_pod_c" (ai_vehicle_get "qz_ini_ins_pods/c"))
        (object_destroy "qz_ent_pod_c")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "qz_ini_ins_pods/c") "door" 500.0)
        (sleep 15)
        (ai_vehicle_exit "qz_ini_ins_pods/c")
        (sleep 30)
        (cs_run_command_script "qz_ini_ins_pods/c" cs_go_to_bridge)
    )
)

(script dormant void ai_cov_ins_pod_d
    (begin
        (ai_place "qz_ini_ins_pods/d")
        (object_create "qz_ent_pod_d")
        (objects_attach "qz_ent_pod_d" "pod_attach" (ai_vehicle_get "qz_ini_ins_pods/d") "pod_attach")
        (sleep 1)
        (device_set_position "qz_ent_pod_d" 1.0)
        (sleep_until (>= (device_get_position "qz_ent_pod_d") 1.0) 1)
        (objects_detach "qz_ent_pod_d" (ai_vehicle_get "qz_ini_ins_pods/d"))
        (object_destroy "qz_ent_pod_d")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "qz_ini_ins_pods/d") "door" 500.0)
        (sleep 15)
        (ai_vehicle_exit "qz_ini_ins_pods/d")
        (sleep 30)
        (cs_run_command_script "qz_ini_ins_pods/d" cs_go_to_bridge)
        (unit_set_maximum_vitality (ai_get_unit "qz_ini_ins_pods/d") 1.0 0.0)
    )
)

(script dormant void ai_cov_ins_pod_e
    (begin
        (ai_place "qz_ini_ins_pods/e")
        (object_create "qz_ent_pod_e")
        (objects_attach "qz_ent_pod_e" "pod_attach" (ai_vehicle_get "qz_ini_ins_pods/e") "pod_attach")
        (sleep 1)
        (device_set_position "qz_ent_pod_e" 1.0)
        (sleep_until (>= (device_get_position "qz_ent_pod_e") 1.0) 1)
        (objects_detach "qz_ent_pod_e" (ai_vehicle_get "qz_ini_ins_pods/e"))
        (object_destroy "qz_ent_pod_e")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "qz_ini_ins_pods/e") "door" 500.0)
        (sleep 15)
        (ai_vehicle_exit "qz_ini_ins_pods/e")
        (sleep 30)
        (cs_run_command_script "qz_ini_ins_pods/e" cs_go_to_bridge)
        (unit_set_maximum_vitality (ai_get_unit "qz_ini_ins_pods/e") 1.0 0.0)
    )
)

(script dormant void ai_qz_ini_turrets
    (begin
        (ai_vehicle_enter "qz_ini_flood" (ai_get_unit "qz_ini_turrets"))
    )
)

(script dormant void ai_cov_ins_pods
    (begin
        (begin_random
            (begin
                (wake ai_cov_ins_pod_a)
                (sleep (random_range 0 15))
            )
            (begin
                (wake ai_cov_ins_pod_b)
                (sleep (random_range 0 15))
            )
            (begin
                (wake ai_cov_ins_pod_c)
                (sleep (random_range 0 15))
            )
            (begin
                (wake ai_cov_ins_pod_e)
                (sleep (random_range 0 15))
            )
        )
        (sleep 120)
        (wake sc_qz_initial)
    )
)

(script dormant void ai_qz_ini_exit_turrets
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "qz_ini_flood") 1)
                (volume_test_objects "tv_cov_defense" (players))
            )
        )
        (ai_vehicle_exit "qz_ini_ins_pods")
    )
)

(script dormant void cs_crash_factory
    (begin
        (sleep 90)
        (sleep_until 
            (or
                (objects_can_see_object (players) "factory" 30.0)
                (volume_test_objects "tv_qz_camp" (players))
            ) 
        30 180)
        (sleep 30)
        (device_set_position "factory" 1.0)
        (sound_impulse_start_effect "sound\visual_effects\shq_factory_explode\factory_explode" "factory_sound" 1.0)
        (set g_mortar_fire true)
        (sleep_until (>= (device_get_position "factory") 0.025) 10)
        (wake ai_cov_ins_pods)
        (sleep_until (>= (device_get_position "factory") 0.1))
        (object_destroy "factory")
    )
)

(script dormant void ai_qz_ini_flood
    (begin
        (ai_place "qz_initial_flood_camp")
        (ai_play_line_on_object "qz_ini_sound_a" "0180")
        (ai_play_line_on_object "qz_ini_sound_b" "0180")
        (sleep_until (<= (ai_living_count "qz_initial_flood_camp") 2))
        (if (not g_qz_ini_cave) 
            (begin
                (ai_place "qz_initial_flood_camp")
                (ai_play_line_on_object "qz_ini_sound_a" "0180")
                (ai_play_line_on_object "qz_ini_sound_b" "0180")
            )
        )
    )
)

(script static void qz_cov_def_abc
    (begin
        (if debug 
            (print "wave abc"))
        (ai_place "qz_cov_def_flood_a")
        (ai_place "qz_cov_def_flood_b")
        (ai_place "qz_cov_def_flood_c")
        (sleep 5)
        (ai_play_line_on_object "qz_cov_def_sound_a" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_b" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_c" "0180")
        (ai_set_orders "qz_cov_def_cov" "qz_cov_def_cov_a")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") g_cov_def_flood_advance) 30 (* 30.0 15.0))
        (ai_set_orders "qz_cov_def_flood" "qz_cov_def_hill")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") 1))
    )
)

(script static void qz_cov_def_bcd
    (begin
        (if debug 
            (print "wave bcd"))
        (ai_place "qz_cov_def_flood_b")
        (ai_place "qz_cov_def_flood_c")
        (ai_place "qz_cov_def_flood_d")
        (sleep 5)
        (ai_play_line_on_object "qz_cov_def_sound_b" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_c" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_d" "0180")
        (ai_set_orders "qz_cov_def_cov" "qz_cov_def_cov_ab")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") g_cov_def_flood_advance) 30 (* 30.0 15.0))
        (ai_set_orders "qz_cov_def_flood" "qz_cov_def_hill")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") 1))
    )
)

(script static void qz_cov_def_def
    (begin
        (if debug 
            (print "wave def"))
        (ai_place "qz_cov_def_flood_d")
        (ai_place "qz_cov_def_flood_e")
        (ai_place "qz_cov_def_flood_f")
        (sleep 5)
        (ai_play_line_on_object "qz_cov_def_sound_d" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_e" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_f" "0180")
        (ai_set_orders "qz_cov_def_cov" "qz_cov_def_cov_bc")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") g_cov_def_flood_advance) 30 (* 30.0 15.0))
        (ai_set_orders "qz_cov_def_flood" "qz_cov_def_hill")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") 1))
    )
)

(script static void qz_cov_def_efg
    (begin
        (if debug 
            (print "wave efg"))
        (ai_place "qz_cov_def_flood_e")
        (ai_place "qz_cov_def_flood_f")
        (ai_place "qz_cov_def_flood_g")
        (sleep 5)
        (ai_play_line_on_object "qz_cov_def_sound_e" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_f" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_g" "0180")
        (ai_set_orders "qz_cov_def_cov" "qz_cov_def_cov_c")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") g_cov_def_flood_advance) 30 (* 30.0 15.0))
        (ai_set_orders "qz_cov_def_flood" "qz_cov_def_hill")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") 1))
    )
)

(script static void qz_cov_def_ag
    (begin
        (if debug 
            (print "wave ag"))
        (ai_place "qz_cov_def_flood_a")
        (ai_place "qz_cov_def_flood_g")
        (sleep 5)
        (ai_play_line_on_object "qz_cov_def_sound_a" "0180")
        (ai_play_line_on_object "qz_cov_def_sound_g" "0180")
        (ai_set_orders "qz_cov_def_cov" "qz_cov_def_cov_ac")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") g_cov_def_flood_advance) 30 (* 30.0 15.0))
        (ai_set_orders "qz_cov_def_flood" "qz_cov_def_hill")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") 1))
    )
)

(script static void qz_cov_def_d
    (begin
        (if debug 
            (print "wave d"))
        (ai_place "qz_cov_def_flood_d")
        (sleep 5)
        (ai_play_line_on_object "qz_cov_def_sound_d" "0180")
        (ai_set_orders "qz_cov_def_cov" "qz_cov_def_cov_b")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") g_cov_def_flood_advance) 30 (* 30.0 15.0))
        (ai_set_orders "qz_cov_def_flood" "qz_cov_def_hill")
        (sleep_until (<= (ai_nonswarm_count "qz_cov_def_flood") 1))
    )
)

(script dormant void ai_qz_cov_def_flood_spawn
    (begin
        (if (difficulty_normal) 
            (begin
                (set g_qz_cov_def_limit 2)
            ) (if (difficulty_heroic) 
                (begin
                    (set g_qz_cov_def_limit 4)
                ) (if (difficulty_legendary) 
                    (begin
                        (set g_qz_cov_def_limit 6)
                    ) )
            )
        )
        (begin_random
            (if g_qz_cov_def_spawn 
                (begin
                    (set g_qz_cov_def_count (+ g_qz_cov_def_count 1.0))
                    (qz_cov_def_abc)
                    (if (= g_qz_cov_def_count g_qz_cov_def_limit) 
                        (set g_qz_cov_def_spawn false))
                    (sleep (* 30.0 10.0))
                )
            )
            (if g_qz_cov_def_spawn 
                (begin
                    (set g_qz_cov_def_count (+ g_qz_cov_def_count 1.0))
                    (qz_cov_def_bcd)
                    (if (= g_qz_cov_def_count g_qz_cov_def_limit) 
                        (set g_qz_cov_def_spawn false))
                    (sleep (* 30.0 10.0))
                )
            )
            (if g_qz_cov_def_spawn 
                (begin
                    (set g_qz_cov_def_count (+ g_qz_cov_def_count 1.0))
                    (qz_cov_def_def)
                    (if (= g_qz_cov_def_count g_qz_cov_def_limit) 
                        (set g_qz_cov_def_spawn false))
                    (sleep (* 30.0 10.0))
                )
            )
            (if g_qz_cov_def_spawn 
                (begin
                    (set g_qz_cov_def_count (+ g_qz_cov_def_count 1.0))
                    (qz_cov_def_efg)
                    (if (= g_qz_cov_def_count g_qz_cov_def_limit) 
                        (set g_qz_cov_def_spawn false))
                    (sleep (* 30.0 10.0))
                )
            )
            (if g_qz_cov_def_spawn 
                (begin
                    (set g_qz_cov_def_count (+ g_qz_cov_def_count 1.0))
                    (qz_cov_def_ag)
                    (if (= g_qz_cov_def_count g_qz_cov_def_limit) 
                        (set g_qz_cov_def_spawn false))
                    (sleep (* 30.0 10.0))
                )
            )
            (if g_qz_cov_def_spawn 
                (begin
                    (set g_qz_cov_def_count (+ g_qz_cov_def_count 1.0))
                    (qz_cov_def_d)
                    (if (= g_qz_cov_def_count g_qz_cov_def_limit) 
                        (set g_qz_cov_def_spawn false))
                    (sleep (* 30.0 10.0))
                )
            )
        )
    )
)

(script dormant void ai_qz_cov_def_carrier
    (begin
        (sleep_until (= g_qz_cov_def_count 2))
        (game_saving)
        (ai_place "qz_cov_def_carrier")
        (sleep_until (= g_qz_cov_def_count 4))
        (game_saving)
        (ai_place "qz_cov_def_carrier")
        (sleep_until (= g_qz_cov_def_count 6))
        (game_saving)
        (ai_place "qz_cov_def_carrier")
    )
)

(script dormant void you_win
    (begin
        (if debug 
            (print "you win script called..."))
        (sleep_until g_qz_phantom 30 (* 30.0 60.0 2.0))
        (sleep 120)
        (playtest_mission)
        (sound_class_enable_ducker "" 0.0 15)
        (cinematic_fade_to_white)
        (game_revert)
    )
)

(script command_script void cs_qz_phantom
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 1.0)
        (cs_fly_by qz_phantom/p0 3.0)
        (cs_vehicle_boost true)
        (cs_fly_by qz_phantom/p1 3.0)
        (cs_vehicle_boost false)
        (cs_fly_by qz_phantom/p3 5.0)
        (ai_magically_see "covenant" "flood")
        (cs_vehicle_speed 0.75)
        (cs_fly_to_and_face qz_phantom/p4 qz_phantom/p5)
        (ai_magically_see "covenant" "flood")
        (sleep_until (not (volume_test_objects "tv_game_won" (ai_actors "qz_cov_def_flood"))) 30 (* 30.0 30.0))
        (set g_qz_phantom true)
    )
)

(script dormant void enc_insertion
    (begin
        (if debug 
            (print "initialize insertion scripts"))
        (game_save_no_timeout)
        (data_mine_insert "enc_insertion")
        (if (difficulty_normal) 
            (begin
                (object_destroy "ins_em_b")
            ) (if (difficulty_heroic) 
                (begin
                    (object_destroy "ins_em_b")
                ) )
        )
        (ai_disregard (ai_actors "constructors") true)
        (ai_place "ins_con_mid")
        (ai_place "ins_con_bk")
        (ai_place "pussy_grunt")
        (wake ins_open_door)
        (wake pussy_grunt_reminder)
        (wake music_06a_01)
        (sleep 1)
        (if (not (difficulty_legendary)) 
            (sleep_until 
                (or
                    (< (ai_strength "ins_cons") 1.0)
                    (volume_test_objects "tv_insertion_tube" (players))
                ) 
            5) (begin
                (sleep 150)
                (wake ai_insertion_emitters)
            )
        )
        (if (< (ai_strength "ins_cons") 1.0) 
            (begin
                (wake ai_insertion_emitters)
                (if (= (device_get_position "piston_ins") 0.0) 
                    (begin
                        (ai_set_orders "ins_con_mid" "ins_run_away")
                        (ai_set_orders "ins_con_bk" "ins_run_away")
                    )
                )
            )
        )
        (wake pussy_grunt)
    )
)

(script dormant void enc_hall_a
    (begin
        (if g_hall_a 
            (sleep_until (volume_test_objects "tv_hall_a" (players)) 10))
        (if debug 
            (print "initialize hall a scripts"))
        (game_save_no_timeout)
        (data_mine_insert "enc_hall_a")
        (set g_insertion_spawn true)
        (set g_pussy_grunt true)
        (ai_disposable "insertion_sentinels" true)
        (ai_disposable "ins_cons" true)
        (ai_disposable "pussy_grunt" true)
        (ai_set_orders "constructors" "hall_a_constructors")
        (ai_set_orders "pussy_grunt" "hall_a_cov")
        (wake ai_hall_a_const)
        (if (not (difficulty_legendary)) 
            (sleep_until 
                (or
                    (< (ai_strength "hall_a_cons") 0.8)
                    (volume_test_objects "tv_hall_a_bk" (players))
                )
            ))
        (ai_place "hall_a_sen/h")
        (sleep 30)
        (wake ai_hall_a_emitters)
    )
)

(script dormant void enc_conduit_a
    (begin
        (if g_conduit_a 
            (sleep_until (volume_test_objects "tv_conduit_a" (players)) 10))
        (if debug 
            (print "initialize conduit a scripts"))
        (game_save_no_timeout)
        (data_mine_insert "enc_cond_a_sec_a")
        (ai_disposable "hall_a_sentinels" true)
        (ai_disposable "hall_a_cons" true)
        (ai_place "cond_a_sen_ini")
        (ai_set_orders "covenant" "cond_a_cov_follow")
        (sleep 1)
        (ai_place "cond_a_cov")
        (sleep 1)
        (wake ai_sc_cond_a_cov)
        (wake cond_a_initial_delay)
        (wake music_06a_03)
        (sleep_forever ai_hall_a_emitters)
        (sleep_until g_cond_a_continue)
        (ai_renew "covenant")
        (wake ai_cond_a_emitters_fr)
        (sleep_until (volume_test_objects "tv_cond_a_b" (players)) 5)
        (ai_renew "covenant")
        (wake sc_tartarus_reminder)
        (wake ai_cond_a_back_ini)
        (set g_music_06a_03 true)
        (sleep_until (volume_test_objects "tv_cond_a_c" (players)))
        (game_save_no_timeout)
        (data_mine_insert "enc_cond_a_sec_b")
        (ai_renew "covenant")
        (wake ai_cond_a_emitters_bk)
        (sleep_forever ai_cond_a_emitters_fr)
    )
)

(script dormant void enc_hall_b
    (begin
        (if g_hall_b 
            (sleep_until (volume_test_objects "tv_hall_b" (players)) 10))
        (if debug 
            (print "initialize hall b scripts"))
        (game_save_no_timeout)
        (data_mine_insert "enc_hall_b")
        (ai_disposable "cond_a_sentinels" true)
        (ai_disposable "cond_a_cov" true)
        (sleep_forever ai_cond_a_emitters_bk)
        (set g_cond_a_front true)
        (set g_cond_a_back true)
        (ai_place "hall_b_cov" (pin (- 4.0 (ai_living_count "covenant")) 0.0 4.0))
        (wake ai_sc_hall_b_grunts)
        (ai_set_orders "covenant" "hall_b_cov_follow")
        (sleep 1)
        (ai_set_orders "covenant" "hall_b_cov_ini")
        (ai_renew "covenant")
        (sleep_until (volume_test_objects "tv_hall_b_fr" (players)))
        (wake ai_hall_b_emitters)
        (ai_set_orders "covenant" "hall_b_cov_follow")
        (set g_hall_b_sen_dialogue true)
    )
)

(script dormant void enc_plug_launch
    (begin
        (if g_plug_launch 
            (sleep_until (volume_test_objects "tv_plug_launch" (players)) 10))
        (if debug 
            (print "initialize plug launch scripts"))
        (wake plug_absorbers)
        (game_save_no_timeout)
        (data_mine_insert "enc_plug_launch")
        (ai_disposable "hall_b_cov" true)
        (ai_disposable "hall_b_sentinels" true)
        (object_dynamic_simulation_disable "plug" true)
        (wake objective_lower_clear)
        (wake objective_lower_specific_set)
        (sleep_forever ai_hall_b_emitters)
        (ai_renew "covenant")
        (ai_set_orders "covenant" "plug_launch_cov_ini")
        (ai_place "plug_launch_enforcer")
        (sleep_until (>= (ai_combat_status "plug_launch_enforcer") ai_combat_status_active) 30 210)
        (wake sc_enforcer)
        (wake ai_plug_launch_em)
        (sleep 1)
        (ai_set_orders "covenant" "plug_launch_cov_follow")
        (sleep_until g_plug_move)
        (set g_plug_launch_loops true)
        (wake cs_move_plug)
        (wake music_06a_04)
    )
)

(script dormant void enc_plug_landing
    (begin
        (if g_plug_landing 
            (sleep_until (volume_test_objects "tv_plug_land" (players))))
        (sleep_until (>= (device_get_position "plug") 0.75) 10)
        (if debug 
            (print "initialize plug landing scripts"))
        (game_saving)
        (data_mine_insert "enc_plug_landing")
        (ai_disposable "plug_launch_enforcer" true)
        (ai_disposable "plug_launch_sentinels" true)
        (wake music_06a_05)
        (wake ai_plug_holder_flood)
        (wake ai_plug_holder_em)
        (wake ai_plug_holder_em_elim)
        (sleep_until 
            (or
                g_plugholder_progress
                (<= (ai_living_count "plug_holder_enforcer") 0)
            ) 
        30 (* 30.0 60.0 5.0))
        (game_saving)
        (data_mine_insert "enc_plug_landing_bk")
        (sleep (* 30.0 5.0))
        (set g_music_06a_04 false)
        (set g_music_06a_05 false)
        (if debug 
            (print "opening the escape hatch..."))
        (ai_place "plugholder_sen_bk_ini")
        (sleep 30)
        (device_set_position "plugholder_door" 1.0)
        (sleep_until (volume_test_objects "tv_plugholder_d" (players)))
        (game_saving)
        (set g_music_06a_05 false)
        (ai_disposable "plug_holder_flood" true)
        (ai_disposable "plug_holder_sentinels" true)
        (ai_set_orders "plug_holder_sentinels" "plugholder_sen_bk")
        (ai_set_orders "plug_holder_enforcer" "plugholder_enforcer_bk")
        (set g_plugholder_progress true)
        (wake close_plugholder_door)
        (wake ai_plugholder_flood_bk)
        (wake ai_plug_holder_bk_em)
        (sleep_until (volume_test_objects "tv_plugholder_e" (players)))
        (set g_plugholder_bk_a true)
        (game_saving)
        (sleep_until (volume_test_objects "tv_plugholder_f" (players)))
        (set g_plugholder_bk_b true)
        (game_saving)
        (data_mine_insert "enc_plug_landing_lower")
        (ai_place "plugholder_lower_hall_flood")
        (ai_place "plugholder_lower_hall_infec")
    )
)

(script dormant void enc_hall_c
    (begin
        (if g_hall_c 
            (sleep_until (volume_test_objects "tv_hall_c" (players)) 10))
        (if debug 
            (print "initialize hall c scripts"))
        (game_saving)
        (data_mine_insert "enc_hall_c_sec_a")
        (ai_disposable "plug_holder_flood_bk" true)
        (ai_disposable "plugholder_bk_infec_a" true)
        (ai_disposable "plugholder_bk_infec_b" true)
        (sleep_forever ai_plugholder_infec_bk_a)
        (sleep_forever ai_plugholder_infec_bk_b)
        (sleep_until (volume_test_objects "tv_hall_c_a" (players)) 5)
        (game_saving)
        (wake ai_hall_c_ini)
        (sleep 5)
        (ai_magically_see "hall_c_marines" "hall_c_flood_far")
        (ai_magically_see "hall_c_flood_far" "hall_c_marines")
        (sleep_until (volume_test_objects "tv_hall_c_b" (players)) 10)
        (game_saving)
        (data_mine_insert "enc_hall_c_sec_b")
        (wake kill_hall_c_marines)
        (ai_place "hall_c_flood_mid")
        (sleep 1)
        (ai_set_orders "hall_c_flood" "hall_c_floor_b")
        (sleep_until (volume_test_objects "tv_hall_c_c" (players)) 10)
        (game_saving)
        (ai_place "hall_c_flood_c" (pin (- 8.0 (ai_nonswarm_count "hall_c_flood")) 0.0 6.0))
        (ai_place "hall_c_carrier_c")
        (ai_place "hall_c_sen_tube")
        (sleep 1)
        (ai_set_orders "hall_c_flood" "hall_c_floor_c")
        (sleep_until (volume_test_objects "tv_hall_c_d" (players)) 10)
        (game_saving)
        (data_mine_insert "enc_hall_c_sec_c")
        (ai_place "hall_c_flood_d" (pin (- 8.0 (ai_nonswarm_count "hall_c_flood")) 0.0 6.0))
        (ai_place "hall_c_carrier_d")
        (sleep 1)
        (ai_set_orders "hall_c_flood" "hall_c_floor_d")
        (sleep_until (volume_test_objects "tv_hall_c_e" (players)) 10)
        (game_saving)
        (ai_place "hall_c_flood_e" (pin (- 8.0 (ai_nonswarm_count "hall_c_flood")) 0.0 6.0))
        (ai_place "hall_c_carrier_e")
        (sleep 1)
        (ai_set_orders "hall_c_flood" "hall_c_floor_e")
    )
)

(script dormant void enc_ledge_a
    (begin
        (if g_ledge_a 
            (sleep_until (volume_test_objects "tv_ledge_a" (players)) 10))
        (if debug 
            (print "initialize ledge a scripts"))
        (game_saving)
        (data_mine_insert "enc_ledge_a_sec_a")
        (ai_disposable "hall_c_flood" true)
        (wake ai_ledge_a_initial)
        (ai_place "ledge_a_flood_dead")
        (sleep_until 
            (or
                (<= (ai_living_count "ledge_a_flood_ini") 0)
                (volume_test_objects "tv_ledge_a_top_b" (players))
            )
        )
        (sleep_until (volume_test_objects "tv_ledge_a_top_b" (players)))
        (game_saving)
        (wake ai_ledge_a_location)
        (wake ai_ledge_a_emitters)
        (wake ai_ledge_a_flood_spawn)
        (sleep_until (volume_test_objects "tv_ledge_a_top_d1" (players)))
        (game_saving)
        (ai_place "ledge_a_flood_d1")
        (sleep_until (volume_test_objects "tv_ledge_a_top_d2" (players)))
        (game_saving)
        (data_mine_insert "enc_ledge_a_sec_b")
        (ai_place "ledge_a_flood_d2")
        (sleep_until (volume_test_objects "tv_ledge_a_top_e" (players)))
        (game_saving)
        (ai_set_orders "ledge_a_flood" "ledge_a_floor_follow")
    )
)

(script dormant void enc_conduit_b
    (begin
        (if g_conduit_b 
            (sleep_until (volume_test_objects "tv_conduit_b" (players)) 10))
        (if debug 
            (print "initialize conduit b scripts"))
        (game_saving)
        (data_mine_insert "enc_cond_b_sec_a")
        (ai_disposable "ledge_a_sentinels" true)
        (ai_disposable "ledge_a_enforcer" true)
        (ai_disposable "ledge_a_flood" true)
        (wake music_06a_06)
        (wake music_06a_07)
        (if (difficulty_legendary) 
            (wake ice_cream_mythic))
        (set g_music_06a_06 true)
        (set g_ledge_a_spawn true)
        (wake ai_cond_b_flood_spawn)
        (wake conduit_b_locator)
        (wake ai_cond_b_carrier_a)
        (sleep_until (volume_test_objects "tv_cond_b_a2" (players)) 10)
        (game_saving)
        (ai_place "cond_b_flood_tube_a")
        (set cond_b_flood_a_spawn true)
        (sleep 5)
        (ai_set_orders "cond_b_flood" "cond_b_floor_follow_a")
        (sleep_until (volume_test_objects "tv_cond_b_b1" (players)) 10)
        (game_saving)
        (data_mine_insert "enc_cond_b_sec_b")
        (ai_set_orders "cond_b_flood" "cond_b_floor_follow_b")
        (ai_place "cond_b_sen_b/1")
        (ai_place "cond_b_sen_b/3")
        (ai_place "cond_b_flood_b_ini")
        (wake ai_cond_b_b_em)
        (sleep 5)
        (sleep_until (volume_test_objects "tv_cond_b_b2" (players)) 10)
        (game_saving)
        (set g_music_06a_07 true)
        (sleep_forever ai_cond_b_b_em)
        (wake ai_cond_b_sen_tube_b)
        (ai_set_orders "cond_b_flood" "cond_b_floor_follow_c")
        (ai_disposable "ledge_a_flood" true)
        (ai_disposable "ledge_a_sentinels" true)
        (ai_disposable "ledge_a_enforcer" true)
        (ai_disposable "cond_b_flood" true)
        (sleep_until (volume_test_objects "tv_cond_b_c" (players)) 10)
        (game_saving)
        (data_mine_insert "enc_cond_b_sec_c")
        (wake sc_marines_a)
        (set cond_b_flood_b_spawn true)
        (ai_place "cond_b_humans")
        (ai_place "cond_b_flood_c_ini_a" (pin (- 6.0 (ai_living_count "cond_b_flood")) 0.0 4.0))
        (sleep 1)
        (ai_place "cond_b_flood_c_ini_b" (pin (- 6.0 (ai_living_count "cond_b_flood")) 0.0 4.0))
        (ai_place "cond_b_infection_c" 2)
        (sleep 5)
        (sleep_until (volume_test_objects "tv_cond_b_hum_dead" (players)) 10)
        (game_saving)
        (wake kill_cond_b_marines)
    )
)

(script dormant void enc_ledge_b
    (begin
        (if g_ledge_b 
            (sleep_until (volume_test_objects "tv_ledge_b" (players)) 10))
        (if debug 
            (print "initialize ledge b scripts"))
        (game_save_no_timeout)
        (data_mine_insert "enc_ledge_b")
        (ai_disposable "cond_b_flood" true)
        (ai_disposable "cond_b_sentinels" true)
        (ai_disposable "cond_b_infection_c" true)
        (set cond_b_flood_c_spawn true)
        (ai_place "ledge_b_flood")
        (ai_place "ledge_c_phantom")
        (wake slide_a_player0)
        (wake slide_a_player1)
        (wake music_06a_08)
        (wake music_06a_09)
        (wake music_06a_10)
    )
)

(script dormant void enc_ledge_c
    (begin
        (if g_ledge_c 
            (sleep_until (volume_test_objects "tv_ledge_c" (players)) 10))
        (if debug 
            (print "initialize ledge c scripts"))
        (game_saving)
        (data_mine_insert "enc_ledge_c")
        (ai_disposable "ledge_b_sen" true)
        (wake ai_ledge_c_flood_ini)
        (wake ai_ledge_c_infection_spawn)
        (ai_magically_see "ledge_c_flood" "ledge_c_phantom")
        (set g_ledge_c_phantom_start true)
        (sleep_until (volume_test_objects "tv_ledge_c_bk" (players)))
        (game_saving)
        (set ledge_c_spawn false)
        (set g_ledge_c_phantom_1 true)
        (ai_place "ledge_c_flood_bk" (pin (- 6.0 (ai_living_count "ledge_c_flood")) 0.0 6.0))
        (wake slide_b_player0)
        (wake slide_b_player1)
    )
)

(script dormant void enc_qz_initial
    (begin
        (if g_qz_initial 
            (sleep_until (volume_test_objects "tv_qz_initial" (players)) 10))
        (if debug 
            (print "initialize quarantine zone initial scripts"))
        (game_saving)
        (data_mine_insert "enc_qz_initial")
        (ai_disposable "ledge_c_flood" true)
        (wake cs_mortar_a)
        (wake cs_mortar_b)
        (sleep_until (> (device_get_position "qz_door") 0.0) 1)
        (wake chapter_war)
        (wake objective_floodwall_clear)
        (wake objective_rendezvous_set)
        (wake cs_crash_factory)
        (set g_music_06a_10 false)
        (ai_place "qz_initial_flood_ini")
        (ai_place "qz_initial_flood_carrier_ini")
        (ai_place "qz_initial_flood_bridge")
        (ai_place "qz_initial_flood_carrier_camp")
        (if (difficulty_normal) 
            (ai_place "qz_ini_turrets/a") (ai_place "qz_ini_turrets"))
        (sleep_until (volume_test_objects "tv_qz_camp" (players)) 10)
        (if debug 
            (print "camp"))
        (game_saving)
        (data_mine_insert "enc_qz_initial_camp")
        (wake ai_qz_ini_flood)
        (sleep_until (volume_test_objects "tv_qz_cave" (players)) 10)
        (if debug 
            (print "cave"))
        (set g_qz_ini_cave true)
        (ai_place "qz_initial_flood_cave")
        (ai_play_line_on_object "qz_ini_sound_cave" "0180")
        (wake ai_qz_ini_exit_turrets)
        (game_saving)
    )
)

(script dormant void enc_cov_defense
    (begin
        (if g_cov_defense 
            (sleep_until (volume_test_objects "tv_cov_defense" (players)) 10))
        (if debug 
            (print "initialize covenant defense scripts"))
        (game_save_no_timeout)
        (data_mine_insert "enc_covenant_defense")
        (ai_disposable "qz_ini_flood" true)
        (ai_disposable "qz_cov_def_flood" true)
        (ai_vehicle_reserve (ai_vehicle_get "qz_ini_turrets") true)
        (ai_vehicle_exit "qz_ini_ins_pods")
        (ai_migrate "qz_ini_ins_pods" "qz_cov_def_cov")
        (ai_set_orders "qz_ini_flood" "qz_cov_def_hill")
        (ai_place "qz_cov_def_flood_ini")
        (ai_place "qz_cov_def_flood_g")
        (ai_place "qz_cov_def_cov" (pin (- 3.0 (ai_living_count "qz_cov_def_cov")) 0.0 2.0))
        (ai_place "qz_cov_def_soc")
        (ai_place "qz_camp_turrets")
        (object_cannot_die (ai_get_object "qz_cov_def_soc/soc") true)
        (ai_set_orders "covenant" "qz_cov_def_cov_ac")
        (sleep_until (<= (ai_living_count "qz_cov_def_flood") 0))
        (ai_set_orders "covenant" "qz_cov_def_hill")
        (sleep 1)
        (wake sc_qz_cov_camp)
        (sleep_until g_qz_cov_camp_progress)
        (wake ai_qz_cov_def_flood_spawn)
        (wake ai_qz_cov_def_carrier)
        (sleep 1)
        (sleep_until (= g_qz_cov_def_spawn false))
        (if debug 
            (print "last of the flood waves have spawned"))
        (sleep (* 30.0 5.0))
        (game_saving)
        (ai_magically_see "covenant" "flood")
        (if debug 
            (print "phantom placed..."))
        (ai_place "qz_phantom")
        (wake you_win)
    )
)

(script dormant void mission_sentinelwalls
    (begin
        (cinematic_snap_to_white)
        (structure_bsp_index 0)
        (if (= g_play_cinematics true) 
            (begin
                (ui_error_ok_cancel)
                (if (cinematic_skip_start) 
                    (begin
                        (if debug 
                            (print "x06"))
                        (x06)
                    )
                )
                (cinematic_skip_stop)
                (if (cinematic_skip_start) 
                    (begin
                        (if debug 
                            (print "intro"))
                        (c06_intro)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (sleep 2)
        (object_teleport (player0) "player0_start")
        (object_teleport (player1) "player1_start")
        (wake enc_insertion)
        (wake piston_control)
        (wake difficulty_settings)
        (activate_nav_point_object)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white_bars)
        (wake chapter_silence)
        (wake objective_lower_set)
        (if (difficulty_normal) 
            (begin
                (if debug 
                    (print "normal"))
            ) (if (difficulty_heroic) 
                (begin
                    (if debug 
                        (print "heroic"))
                ) (if (difficulty_legendary) 
                    (begin
                        (if debug 
                            (print "legendary"))
                    ) )
            )
        )
        (sleep_until 
            (or
                g_hall_a
                (volume_test_objects "tv_hall_a" (players))
            ) 
        10)
        (wake enc_hall_a)
        (sleep_until 
            (or
                g_conduit_a
                (volume_test_objects "tv_conduit_a" (players))
            ) 
        10)
        (wake enc_conduit_a)
        (sleep_until 
            (or
                g_hall_b
                (volume_test_objects "tv_hall_b" (players))
            ) 
        10)
        (wake enc_hall_b)
        (sleep_until 
            (or
                g_plug_launch
                (volume_test_objects "tv_plug_launch" (players))
            ) 
        10)
        (wake enc_plug_launch)
        (sleep_until 
            (or
                g_plug_landing
                (volume_test_objects "tv_plug_land" (players))
            ) 
        10)
        (wake enc_plug_landing)
        (sleep_until 
            (or
                g_hall_c
                (volume_test_objects "tv_hall_c" (players))
            ) 
        10)
        (wake enc_hall_c)
        (sleep_until 
            (or
                g_ledge_a
                (volume_test_objects "tv_ledge_a" (players))
            ) 
        10)
        (wake enc_ledge_a)
        (sleep_until 
            (or
                g_conduit_b
                (volume_test_objects "tv_conduit_b" (players))
            ) 
        10)
        (wake enc_conduit_b)
        (sleep_until 
            (or
                g_ledge_b
                (volume_test_objects "tv_ledge_b" (players))
            ) 
        10)
        (wake enc_ledge_b)
        (sleep_until 
            (or
                g_ledge_c
                (volume_test_objects "tv_ledge_c" (players))
            ) 
        10)
        (wake enc_ledge_c)
        (sleep_until 
            (or
                g_qz_initial
                (volume_test_objects "tv_qz_initial" (players))
            ) 
        10)
        (set g_piston_control true)
        (wake enc_qz_initial)
        (sleep_until 
            (or
                g_cov_defense
                (volume_test_objects "tv_cov_defense" (players))
            ) 
        10)
        (wake enc_cov_defense)
    )
)

(script static void start
    (begin
        (wake mission_sentinelwalls)
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

(script dormant void x06_01a_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\fp_covenant_carbine\fp_covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_piston_top\door_piston_top" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_generic\holo_generic" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 7)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 8)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 9)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 26 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 22 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 27 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 29 false)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 0)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 23 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 12 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 30 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 false)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_lift\high_sanctum_lift" 0)
        (predict_lightmap_bucket "scenarios\skies\generic\space\space" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (sleep 166)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_gravcolumn\cov_gravcolumn" 1)
        (sleep 32)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 20 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 27 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 0)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (sleep 6)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 34 false)
        (sleep 7)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 true)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 4)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 5)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 6)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 7)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 10)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 8)
        (predict_lightmap_bucket "objects\characters\elite\elite_honor_guard\elite_honor_guard" 9)
        (sleep 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 32 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 15 false)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\brute\brute_honor_guard\brute_honor_helmet_scenery\brute_honor_helmet_scenery" 0)
        (sleep 8)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (sleep 16)
        (predict_lightmap_bucket "objects\characters\elite\elite" 4)
        (predict_lightmap_bucket "objects\characters\elite\elite" 7)
        (predict_lightmap_bucket "objects\characters\elite\elite" 11)
        (predict_lightmap_bucket "objects\characters\elite\elite" 12)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 5)
        (predict_lightmap_bucket "objects\characters\brute\brute" 6)
        (predict_lightmap_bucket "objects\characters\brute\brute" 7)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 11)
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\brute\brute" 25)
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\brute\brute" 14)
        (sleep 14)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 47)
        (predict_lightmap_bucket "objects\characters\elite\elite" 8)
        (predict_lightmap_bucket "objects\characters\elite\elite" 13)
        (sleep 66)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 27 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 true)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (sleep 24)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 30 false)
        (sleep 61)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 33)
        (predict_lightmap_bucket "objects\characters\elite\elite" 28)
        (predict_lightmap_bucket "objects\characters\elite\elite" 29)
        (sleep 5)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 true)
        (sleep 52)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 30 false)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\brute\brute_honor_guard\brute_honor_helmet_scenery\brute_honor_helmet_scenery" 0)
        (sleep 7)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 34 false)
        (sleep 6)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 12 false)
        (sleep 11)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_lift\high_sanctum_lift" 0)
        (sleep 11)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 23 false)
        (sleep 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (sleep 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 false)
    )
)

(script dormant void x06_01b_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 false)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 75)
        (predict_lightmap_bucket "objects\characters\brute\brute_honor_guard\brute_honor_helmet_scenery\brute_honor_helmet_scenery" 0)
        (sleep 68)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 27 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_space\high_charity_space" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (predict_lightmap_bucket "objects\characters\elite\elite" 16)
        (predict_lightmap_bucket "objects\characters\elite\elite" 21)
        (predict_lightmap_bucket "objects\characters\elite\elite" 19)
        (predict_lightmap_bucket "objects\characters\elite\elite" 20)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 0)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (sleep 64)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 28)
        (predict_lightmap_bucket "objects\characters\elite\elite" 29)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 43)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 35)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
    )
)

(script dormant void x06_02_predict
    (begin
        (sleep 4)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_space\high_charity_space" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (sleep 20)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (sleep 239)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (sleep 39)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (sleep 60)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (sleep 84)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (sleep 334)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (sleep 43)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (sleep 76)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (sleep 10)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 false)
        (sleep 17)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 20 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 30 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 34 false)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_lift\high_sanctum_lift" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 12 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 23 false)
    )
)

(script dormant void x06_03_predict
    (begin
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 117)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 20 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 30 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 34 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 12 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 23 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 true)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_lift\high_sanctum_lift" 0)
        (sleep 141)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 39)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 183)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 100)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
    )
)

(script dormant void x06_04_predict
    (begin
        (sleep 8)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (sleep 571)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 158)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 120)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 20 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 34 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_lift\high_sanctum_lift" 0)
    )
)

(script dormant void x06_05_predict
    (begin
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (sleep 275)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 0 true)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 false)
        (sleep 37)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 20 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 30 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (sleep 7)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 true)
        (sleep 8)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 34 false)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_lift\high_sanctum_lift" 0)
        (sleep 7)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 12 false)
        (sleep 43)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 229)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_alone\index_alone" 0)
        (sleep 162)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 20 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 18 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 30 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 34 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 12 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 3 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 23 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 2 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_8 1 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_door\high_sanctum_door" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_sanctum_lift\high_sanctum_lift" 0)
    )
)

(script dormant void 06_intro_01_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 27 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 143 false)
        (sleep 4)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 15)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_stardust\high_charity_stardust" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\substance_space\substance_space" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (sleep 182)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\vehicles\phantom\cinematics\cinematics" 0)
        (sleep 140)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (sleep 218)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (sleep 74)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
    )
)

(script dormant void 06_intro_02_predict
    (begin
        (sleep 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 15)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (sleep 4)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\mount_doom\mount_doom" 0)
        (sleep 154)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 7 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 15 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 26 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 6 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 15 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 16 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 39 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 40 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 41 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 42 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 10 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 26 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 34 true)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 33 true)
        (predict_lightmap_bucket "objects\gear\covenant\military\antennae_comm\antennae_comm" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\antennae_comm\antennae_comm" 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\antennae_comm\antennae_comm" 2)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "objects\characters\sentinel_aggressor\garbage\fuselage_arm\fuselage_arm" 0)
        (predict_lightmap_bucket "objects\characters\sentinel_aggressor\garbage\fuselage\fuselage" 0)
        (predict_lightmap_bucket "objects\characters\sentinel_aggressor\garbage\head\head" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\characters\sentinel_aggressor\garbage\arm\arm" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\senhq_detail_crate\shq_cover_small\shq_cover_small" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_piston_top\door_piston_top" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 1)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 2)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 3)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 4)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 0)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 12)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\door_piston_absorber\door_piston_absorber" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\sentinel_emitter\sentinel_emitter" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_generic\holo_generic" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\sentinelhq\bullshit_switch\bullshit_switch" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 7)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 8)
        (predict_lightmap_bucket "scenarios\skies\solo\sentinelhq\jungle\jungle" 9)
        (sleep 9)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 62)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 8)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 24 false)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 3)
        (sleep 40)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 8 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 25 false)
        (sleep 53)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (sleep 13)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (sleep 21)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (sleep 28)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 39 true)
        (sleep 59)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 47)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 48)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 49)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 50)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 51)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 52)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 53)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 54)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 55)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 56)
        (sleep 139)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 40 true)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\sentinel_aggressor\garbage\fuselage_arm\fuselage_arm" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 47)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 48)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 49)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 50)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 51)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 52)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 53)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 54)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 55)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 56)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\sentinel_aggressor\garbage\arm\arm" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 6 true)
        (sleep 51)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 24 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 8 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 25 false)
        (sleep 47)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 66)
        (sleep 18)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\garbage\thruster\thruster" 0)
        (predict_lightmap_bucket "objects\characters\sentinel_enforcer\sentinel_enforcer" 73)
        (sleep 4)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 20)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (sleep 12)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 212 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 211 false)
        (sleep 47)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 8 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 25 false)
        (predict_bitmap scenarios\solo\06a_sentinelwalls\sentinelhq_1 39 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
    )
)

(script static void tele_insertion
    (begin
        (switch_bsp_by_name)
    )
)

(script static void tele_hall_a
    (begin
        (structure_bsp_index 0)
        (sleep 1)
        (object_teleport (player0) "hall_a_a")
        (object_teleport (player1) "hall_a_b")
        (ai_erase_all)
        (set g_hall_a true)
    )
)

(script static void tele_conduit_a
    (begin
        (structure_bsp_index 0)
        (sleep 1)
        (object_teleport (player0) "conduit_a_a")
        (object_teleport (player1) "conduit_a_b")
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
    )
)

(script static void tele_hall_b
    (begin
        (structure_bsp_index 0)
        (sleep 1)
        (object_teleport (player0) "hall_b_a")
        (object_teleport (player1) "hall_b_b")
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
    )
)

(script static void tele_plug_launch
    (begin
        (structure_bsp_index 0)
        (sleep 1)
        (object_teleport (player0) "plug_launch_a")
        (object_teleport (player1) "plug_launch_b")
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
    )
)

(script static void tele_plug_landing
    (begin
        (structure_bsp_index 0)
        (sleep 1)
        (object_teleport (player0) "plug_landing_a")
        (object_teleport (player1) "plug_landing_b")
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (wake cs_move_plug)
    )
)

(script static void tele_hall_c
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "hall_c_a")
        (object_teleport (player1) "hall_c_b")
        (wake bsp0_cleanup)
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (set g_hall_c true)
    )
)

(script static void tele_ledge_a
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "ledge_a_a")
        (object_teleport (player1) "ledge_a_b")
        (wake bsp0_cleanup)
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (set g_hall_c true)
        (set g_ledge_a true)
    )
)

(script static void tele_conduit_b
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "conduit_b_a")
        (object_teleport (player1) "conduit_b_b")
        (wake bsp0_cleanup)
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (set g_hall_c true)
        (set g_ledge_a true)
        (set g_conduit_b true)
    )
)

(script static void tele_ledge_b
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "ledge_b_a")
        (object_teleport (player1) "ledge_b_b")
        (wake bsp0_cleanup)
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (set g_hall_c true)
        (set g_ledge_a true)
        (set g_conduit_b true)
        (set g_ledge_b true)
    )
)

(script static void tele_ledge_c
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "ledge_c_a")
        (object_teleport (player1) "ledge_c_b")
        (wake bsp0_cleanup)
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (set g_hall_c true)
        (set g_ledge_a true)
        (set g_conduit_b true)
        (set g_ledge_b true)
        (set g_ledge_c true)
    )
)

(script static void tele_qz_initial
    (begin
        (structure_bsp_index 2)
        (sleep 1)
        (object_teleport (player0) "qz_initial_a")
        (object_teleport (player1) "qz_initial_b")
        (wake bsp0_cleanup)
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (set g_hall_c true)
        (set g_ledge_a true)
        (set g_conduit_b true)
        (set g_ledge_b true)
        (set g_ledge_c true)
        (set g_qz_initial true)
    )
)

(script static void tele_cov_defense
    (begin
        (structure_bsp_index 2)
        (sleep 1)
        (object_teleport (player0) "cov_defense_a")
        (object_teleport (player1) "cov_defense_b")
        (wake bsp0_cleanup)
        (ai_erase_all)
        (set g_hall_a true)
        (set g_conduit_a true)
        (set g_hall_b true)
        (set g_plug_launch true)
        (set g_plug_landing true)
        (set g_hall_c true)
        (set g_ledge_a true)
        (set g_conduit_b true)
        (set g_ledge_b true)
        (set g_ledge_c true)
        (set g_qz_initial true)
        (set g_cov_defense true)
    )
)

