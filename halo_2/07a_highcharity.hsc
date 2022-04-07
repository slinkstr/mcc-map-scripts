; Decompiled with Blamite
; Source file: 07a_highcharity.hsc
; Start time: 4/7/2022 7:18:37
; Decompilation finished in ~0.0056621s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean debug true)
(global boolean dialogue true)
(global boolean g_play_cinematics true)
(global short sleep_lower_bound 120)
(global short sleep_upper_bound 180)
(global boolean g_cheiftan false)
(global boolean g_dervish_ledge_orders false)
(global boolean g_room_a_door false)
(global boolean g_sc_ioc_finished false)
(global boolean g_jail_a_free false)
(global boolean g_jail_b_free false)
(global boolean g_jail_a_finished false)
(global boolean g_jail_b_finished false)
(global boolean g_marine_mig_garden_a false)
(global boolean g_marine_mig_midtower false)
(global boolean g_marine_mig_garden_b false)
(global boolean g_marine_mig_ext_b false)
(global boolean g_marine_mig_maus false)
(global boolean g_marine_mig_maus_room false)
(global boolean g_marine_mig_maus_int false)
(global boolean g_music_07a_01 false)
(global boolean g_music_07a_02 false)
(global boolean g_music_07a_03 false)
(global boolean g_music_07a_03_alt false)
(global boolean g_music_07a_04 false)
(global boolean g_music_07a_04_alt false)
(global boolean g_music_07a_05 false)
(global boolean g_music_07a_06 false)
(global boolean g_music_07a_07 false)
(global boolean g_music_07a_07_alt false)
(global boolean g_music_07a_08 false)
(global boolean g_council_initial false)
(global boolean g_council_exit_reminder false)
(global boolean g_council_reminder_played false)
(global boolean g_ledge_reminder false)
(global short dialogue_pause 7)
(global boolean g_jail_exit_reminder false)
(global boolean g_jail_exit_reminder_played false)
(global boolean g_sc_room_b_done false)
(global boolean g_corr_b_exit_finished false)
(global boolean g_ioc_reminder false)
(global boolean g_ioc_reminder_played false)
(global boolean g_truth_speaking false)
(global boolean g_council_over false)
(global boolean g_council_wave false)
(global short g_council_count 0)
(global short g_council_limit 0)
(global boolean g_council_orders false)
(global boolean g_council_floor_wave false)
(global short g_council_floor_wave_count 0)
(global short g_council_floor_wave_limit 0)
(global boolean g_council_upper true)
(global short g_council_upper_limit 0)
(global short g_council_upper_count 0)
(global boolean g_ledge_turret_left false)
(global boolean g_ledge_turret_right false)
(global boolean g_corridor_a_active false)
(global boolean g_jail_prophets_ini_active false)
(global boolean jail_a_doors_open false)
(global boolean jail_b_doors_open false)
(global boolean g_jail_door true)
(global short g_jail_door_limit 0)
(global short g_jail_door_count 0)
(global boolean g_jail_spawner true)
(global short g_jail_spawn_limit 0)
(global short g_jail_spawn_count 0)
(global boolean g_jail_round_lift_spawned false)
(global boolean g_ext_a_snipers true)
(global short g_ext_a_snipers_count 0)
(global short g_ext_a_snipers_index 4)
(global boolean g_ext_a_fliers false)
(global boolean g_midtower_prophet_rein false)
(global boolean g_ext_b_dump false)
(global boolean g_maus_bridge_fr false)
(global boolean g_maus_inner_order_trans false)
(global boolean g_maus_inner false)
(global boolean g_maus_inner_wave_pause true)
(global boolean g_maus_inner_wave_end false)
(global short g_maus_inner_count 0)
(global short g_maus_inner_limit 0)
(global short g_maus_inner_wave_count 0)
(global short g_maus_inner_wave_limit 0)


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

(script command_script void cs_c07_infection
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_nearest c07_infection_a)
        (cs_go_to_nearest c07_infection_b)
    )
)

(script static void x08_01_predict_stub
    (begin
        (wake x08_01_predict)
    )
)

(script static void x08_02_predict_stub
    (begin
        (wake x08_02_predict)
    )
)

(script static void x08_03_predict_stub
    (begin
        (wake x08_03_predict)
    )
)

(script static void x08_04_predict_stub
    (begin
        (wake x08_04_predict)
    )
)

(script static void x08_05_predict_stub
    (begin
        (wake x08_05_predict)
    )
)

(script static void x08_06a_predict_stub
    (begin
        (wake x08_06a_predict)
    )
)

(script static void x08_06b_predict_stub
    (begin
        (wake x08_06b_predict)
    )
)

(script static void x08_06c_predict_stub
    (begin
        (wake x08_06c_predict)
    )
)

(script static void x08_07_predict_stub
    (begin
        (wake x08_07_predict)
    )
)

(script static void x08_08_predict_stub
    (begin
        (wake x08_08_predict)
    )
)

(script static void x08_09_predict_stub
    (begin
        (wake x08_09_predict)
    )
)

(script static void x08_10_predict_stub
    (begin
        (wake x08_10_predict)
    )
)

(script static void x08_11_predict_stub
    (begin
        (wake x08_11_predict)
    )
)

(script static void 07_intro_01_predict_stub
    (begin
        (wake 07_intro_01_predict)
    )
)

(script static void 07_intro_02_predict_stub
    (begin
        (wake 07_intro_02_predict)
    )
)

(script static void 07_intro_03_predict_stub
    (begin
        (wake 07_intro_03_predict)
    )
)

(script static void 07_intro_04_predict_stub
    (begin
        (wake 07_intro_04_predict)
    )
)

(script static void 07_intra1_01_predict_stub
    (begin
        (wake 07_intra1_01_predict)
    )
)

(script static void 07_intra1_02_predict_stub
    (begin
        (wake 07_intra1_02_predict)
    )
)

(script static void 07_intra1_03_predict_stub
    (begin
        (wake 07_intra1_03_predict)
    )
)

(script static void 07_intra1_04_predict_stub
    (begin
        (wake 07_intra1_04_predict)
    )
)

(script dormant void x08_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\music\x08_01_mus" none 1.0)
        (print "x08 score 01 start")
    )
)

(script dormant void x08_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_01_fol" none 1.0)
        (print "x08 foley 01 start")
    )
)

(script dormant void blurry_vision
    (begin
        (interpolator_stop "blurry_vision" 1.0 0.001)
        (sleep 30)
        (cinematic_start 0.0 0.0 0.0 30)
        (sleep 45)
        (cinematic_stop 0.0 0.0 0.0 30)
        (sleep 45)
        (cinematic_start 0.0 0.0 0.0 20)
        (interpolator_stop "blurry_vision" 0.0 2.0)
        (sleep 30)
        (cinematic_stop 0.0 0.0 0.0 20)
        (sleep 20)
        (interpolator_stop "blurry_vision" 1.0 0.001)
        (sleep 25)
        (cinematic_start 0.0 0.0 0.0 10)
        (interpolator_stop "blurry_vision" 0.0 2.0)
    )
)

(script dormant void x08_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light -90.0 0.0 0.0352941 0.278431 0.301961)
        (cinematic_lighting_set_secondary_light -4.0 316.0 0.156863 0.109804 0.0)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.25)
        (rasterizer_bloom_override_max_factor 0.4)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "gravemind" true)
        (object_uses_cinematic_lighting "tentacle_chief" true)
        (object_uses_cinematic_lighting "tentacle_capture_01" true)
        (render_lights_enable_cinematic_shadow true "chief" "head" 0.1)
    )
)

(script static void x08_01_setup
    (begin
        (object_create_anew "chief")
        (object_create_anew "gravemind")
        (object_create_anew "tentacle_chief")
        (object_create_anew "tentacle_capture_01")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "gravemind" true)
        (object_cinematic_lod "tentacle_chief" true)
        (object_cinematic_lod "tentacle_capture_01" true)
        (wake x08_score_01)
        (wake x08_foley_01)
        (wake blurry_vision)
        (wake x08_cinematic_light_01)
    )
)

(script static void x08_scene_01
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "highcharity_1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (x08_01_predict_stub)
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\music\x08_01_mus")
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_01_fol")
        (sleep prediction_offset)
        (x08_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_01" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_01" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_01" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_01" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_01" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_02_fol")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
    )
)

(script dormant void x08_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_02_fol" none 1.0)
        (print "x08 foley 02 start")
    )
)

(script dormant void x08_0020_cor
    (begin
        (sleep 40)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0020_cor" none 1.0)
        (attract_mode_set_seconds "x08_0020_cor" 2.0)
    )
)

(script dormant void x08_0030_grv
    (begin
        (sleep 134)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0030_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0030_grv" 9.0)
    )
)

(script static void x08_02_setup
    (begin
        (wake x08_foley_02)
        (wake x08_0020_cor)
        (wake x08_0030_grv)
    )
)

(script static void x08_scene_02
    (begin
        (x08_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_02" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_02" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_02" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_02" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_02" "anchor_x08")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_03_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_03_fol" none 1.0)
        (print "x08 foley 03 start")
    )
)

(script dormant void x08_0060_mas
    (begin
        (sleep 259)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0060_mas" "chief" 1.0)
        (attract_mode_set_seconds "x08_0060_mas" 3.0)
    )
)

(script static void x08_03_setup
    (begin
        (object_create_anew "dervish")
        (object_create_anew "tentacle_capture_02")
        (object_create_anew "tentacle_capture_03")
        (object_create_anew "tentacle_capture_04")
        (object_cinematic_lod "dervish" true)
        (object_cinematic_lod "tentacle_capture_02" true)
        (object_cinematic_lod "tentacle_capture_03" true)
        (object_cinematic_lod "tentacle_capture_04" true)
        (object_uses_cinematic_lighting "dervish" true)
        (render_lights_enable_cinematic_shadow true "dervish" "head" 0.2)
        (object_uses_cinematic_lighting "tentacle_capture_02" true)
        (object_uses_cinematic_lighting "tentacle_capture_03" true)
        (object_uses_cinematic_lighting "tentacle_capture_04" true)
        (wake x08_foley_03)
        (wake x08_0060_mas)
    )
)

(script static void x08_scene_03
    (begin
        (x08_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_03" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_03" false "anchor_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_03" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_03" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_03" "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_03" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_03" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_03" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_03" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_03" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_04_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_04_fol" none 1.0)
        (print "x08 foley 04 start")
    )
)

(script dormant void x08_0070_der
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0070_der" "dervish" 1.0)
        (attract_mode_set_seconds "x08_0070_der" 2.0)
    )
)

(script dormant void x08_0080_grv
    (begin
        (sleep 20)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0080_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0080_grv" 13.0)
    )
)

(script dormant void x08_0090_grv
    (begin
        (sleep 402)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0090_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0090_grv" 10.0)
    )
)

(script dormant void x08_0100_der
    (begin
        (sleep 683)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0100_der" "dervish" 1.0)
        (attract_mode_set_seconds "x08_0100_der" 6.0)
    )
)

(script static void x08_04_setup
    (begin
        (wake x08_foley_04)
        (wake x08_0070_der)
        (wake x08_0080_grv)
        (wake x08_0090_grv)
        (wake x08_0100_der)
    )
)

(script static void x08_scene_04
    (begin
        (x08_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_04" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_04" false "anchor_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_04" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_04" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_04" "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_04" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_04" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_04" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_04" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_04" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_05_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_05_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_05_fol" none 1.0)
        (print "x08 foley 05 start")
    )
)

(script dormant void x08_0110_grv
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0110_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0110_grv" 3.0)
    )
)

(script dormant void x08_0120_grv
    (begin
        (sleep 86)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0120_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0120_grv" 7.0)
    )
)

(script dormant void x08_0130_grv
    (begin
        (sleep 324)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0130_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0130_grv" 6.0)
    )
)

(script static void x08_05_setup
    (begin
        (object_create_anew "regret")
        (object_create_anew "2401")
        (object_create_anew "tentacle_capture_05")
        (object_cinematic_lod "regret" true)
        (object_cinematic_lod "2401" true)
        (object_cinematic_lod "tentacle_capture_05" true)
        (object_uses_cinematic_lighting "regret" true)
        (render_lights_enable_cinematic_shadow true "regret" "head" 0.1)
        (object_uses_cinematic_lighting "2401" true)
        (object_uses_cinematic_lighting "tentacle_capture_05" true)
        (wake x08_foley_05)
        (wake x08_0110_grv)
        (wake x08_0120_grv)
        (wake x08_0130_grv)
    )
)

(script static void x08_scene_05
    (begin
        (x08_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_05" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_05" false "anchor_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_05" false "anchor_x08")
        (custom_animation_relative "regret" "objects\characters\gravemind\floodregret\x08\x08" "regret_05" false "anchor_x08")
        (custom_animation_relative "2401" "objects\characters\gravemind\monitor_flood_infected\x08\x08" "tangent_05" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_05" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_05" "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_05" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_05" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_05" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_05" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_05" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_05" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven05_05" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_06a_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_06a_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_06a
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_06a_fol" none 1.0)
        (print "x08 foley 06a start")
    )
)

(script dormant void x08_0140_pnt
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0140_pnt" "2401" 1.0)
        (attract_mode_set_seconds "x08_0140_pnt" 7.0)
    )
)

(script dormant void x08_0150_por
    (begin
        (sleep 198)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0150_por" "regret" 1.0)
        (attract_mode_set_seconds "x08_0150_por" 7.0)
    )
)

(script static void x08_06a_setup
    (begin
        (object_destroy "gravemind")
        (wake x08_foley_06a)
        (wake x08_0140_pnt)
        (wake x08_0150_por)
    )
)

(script static void x08_scene_06a
    (begin
        (x08_06a_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_06a" none "anchor_flag_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_06a" false "anchor_x08")
        (custom_animation_relative "regret" "objects\characters\gravemind\floodregret\x08\x08" "regret_06a" false "anchor_x08")
        (custom_animation_relative "2401" "objects\characters\gravemind\monitor_flood_infected\x08\x08" "tangent_06a" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_06a" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_06a" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_06a" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_06a" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_05" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven05_06a" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_06b_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_06b_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_06b
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_06b_fol" none 1.0)
        (print "x08 foley 06b start")
    )
)

(script dormant void x08_0180_pnt
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0180_pnt" "2401" 1.0)
        (attract_mode_set_seconds "x08_0180_pnt" 3.5)
    )
)

(script dormant void x08_0190_pnt
    (begin
        (sleep 105)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0190_pnt" "2401" 1.0)
        (attract_mode_set_seconds "x08_0190_pnt" 5.0)
    )
)

(script dormant void x08_0200_por
    (begin
        (sleep 268)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0200_por" "regret" 1.0)
        (attract_mode_set_seconds "x08_0200_por" 2.0)
    )
)

(script dormant void x08_0210_por
    (begin
        (sleep 343)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0210_por" "regret" 1.0)
        (attract_mode_set_seconds "x08_0210_por" 4.0)
    )
)

(script dormant void x08_0220_pnt
    (begin
        (sleep 453)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0220_pnt" "2401" 1.0)
        (attract_mode_set_seconds "x08_0220_pnt" 8.5)
    )
)

(script dormant void x08_0230_por
    (begin
        (sleep 714)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0230_por" "regret" 1.0)
        (attract_mode_set_seconds "x08_0230_por" 12.5)
    )
)

(script static void x08_06b_setup
    (begin
        (wake x08_foley_06b)
        (wake x08_0180_pnt)
        (wake x08_0190_pnt)
        (wake x08_0200_por)
        (wake x08_0210_por)
        (wake x08_0220_pnt)
        (wake x08_0230_por)
    )
)

(script static void x08_scene_06b
    (begin
        (x08_06b_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_06b" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_06b" false "anchor_x08")
        (custom_animation_relative "regret" "objects\characters\gravemind\floodregret\x08\x08" "regret_06b" false "anchor_x08")
        (custom_animation_relative "2401" "objects\characters\gravemind\monitor_flood_infected\x08\x08" "tangent_06b" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_06b" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_06b" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_05" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven05_06b" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_06c_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_06c_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_06c
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_06c_fol" none 1.0)
        (print "x08 foley 06c start")
    )
)

(script dormant void x08_0240_pnt
    (begin
        (sleep 351)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0240_pnt" "2401" 1.0)
        (attract_mode_set_seconds "x08_0240_pnt" 5.5)
    )
)

(script static void x08_06c_setup
    (begin
        (wake x08_foley_06c)
        (wake x08_0240_pnt)
    )
)

(script static void x08_scene_06c
    (begin
        (x08_06c_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_06c" none "anchor_flag_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_06c" false "anchor_x08")
        (custom_animation_relative "regret" "objects\characters\gravemind\floodregret\x08\x08" "regret_06c" false "anchor_x08")
        (custom_animation_relative "2401" "objects\characters\gravemind\monitor_flood_infected\x08\x08" "tangent_06c" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_06c" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_06c" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_06c" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_06c" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_05" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven05_06c" "anchor_x08")
        (sleep (- (camera_set_pan) 10.0))
        (object_create_anew "gravemind")
        (object_uses_cinematic_lighting "gravemind" true)
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_07_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_07_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_07
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_07_fol" none 1.0)
        (print "x08 foley 07 start")
    )
)

(script dormant void x08_0250_grv
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0250_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0250_grv" 5.0)
    )
)

(script dormant void x08_0260_grv
    (begin
        (sleep 152)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0260_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0260_grv" 6.0)
    )
)

(script dormant void x08_0251_por
    (begin
        (sleep 270)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0251_por" "regret" 1.0)
    )
)

(script static void x08_07_setup
    (begin
        (wake x08_foley_07)
        (wake x08_0250_grv)
        (wake x08_0260_grv)
        (wake x08_0251_por)
    )
)

(script static void x08_scene_07
    (begin
        (x08_07_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_07" none "anchor_flag_x08")
        (custom_animation_relative "regret" "objects\characters\gravemind\floodregret\x08\x08" "regret_07" false "anchor_x08")
        (custom_animation_relative "2401" "objects\characters\gravemind\monitor_flood_infected\x08\x08" "tangent_07" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_07" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_05" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven05_07" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_08_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_08_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_08
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_08_fol" none 1.0)
        (print "x08 foley 08 start")
    )
)

(script dormant void x08_0270_grv
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0270_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0270_grv" 12.0)
    )
)

(script dormant void x08_0280_grv
    (begin
        (sleep 351)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0280_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0280_grv" 15.0)
    )
)

(script static void x08_08_setup
    (begin
        (object_destroy "tentacle_capture_05")
        (wake x08_foley_08)
        (wake x08_0270_grv)
        (wake x08_0280_grv)
    )
)

(script static void x08_scene_08
    (begin
        (x08_08_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_08" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_08" false "anchor_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_08" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_08" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_08" "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_08" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_08" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_08" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_08" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_09_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_09_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_09
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_09_fol" none 1.0)
        (print "x08 foley 09 start")
    )
)

(script static void x08_scene_09
    (begin
        (wake x08_foley_09)
        (object_destroy "regret")
        (object_destroy "2401")
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_09" none "anchor_flag_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_09" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_09" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_09" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_09" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_09" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_10_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_10_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_10
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_10_fol" none 1.0)
        (print "x08 foley 10 start")
    )
)

(script dormant void x08_0340_mas
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0340_mas" "chief" 1.0)
        (attract_mode_set_seconds "x08_0340_mas" 5.0)
    )
)

(script dormant void x08_0350_der
    (begin
        (sleep 147)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0350_der" "dervish" 1.0)
        (attract_mode_set_seconds "x08_0350_der" 6.0)
    )
)

(script dormant void x08_0360_grv
    (begin
        (sleep 323)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0360_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0360_grv" 8.0)
    )
)

(script dormant void x08_0370_grv
    (begin
        (sleep 561)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0370_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0370_grv" 9.0)
    )
)

(script static void x08_10_setup
    (begin
        (wake x08_foley_10)
        (wake x08_0340_mas)
        (wake x08_0350_der)
        (wake x08_0360_grv)
        (wake x08_0370_grv)
    )
)

(script static void x08_scene_10
    (begin
        (x08_10_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_10" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_10" false "anchor_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_10" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_10" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_10" "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_10" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_10" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_10" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_10" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_10" "anchor_x08")
        (sleep (- (camera_set_pan) prediction_offset))
        (x08_11_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\music\x08_11_mus")
        (sound_impulse_start "sound\cinematics\07_highcharity\x08\foley\x08_11_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x08_foley_11
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\foley\x08_11_fol" none 1.0)
        (print "x08 foley 11 start")
    )
)

(script dormant void x08_score_11
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\x08\music\x08_11_mus" none 1.0)
        (print "x08 score 11 start")
    )
)

(script dormant void x08_0380_grv
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0380_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0380_grv" 7.0)
    )
)

(script dormant void x08_0390_grv
    (begin
        (sleep 207)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\x08_0390_grv" "gravemind" 1.0)
        (attract_mode_set_seconds "x08_0390_grv" 8.5)
    )
)

(script dormant void x08_teleport_build
    (begin
        (sleep 470)
        (print "effect - teleport build")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_01" "teleport06")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_02" "teleport06")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_03" "teleport06")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_04" "teleport06")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_01" "teleport05")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_02" "teleport05")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_03" "teleport05")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_04" "teleport05")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_01" "teleport04")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_02" "teleport04")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_03" "teleport04")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_04" "teleport04")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_01" "teleport03")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_02" "teleport03")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_03" "teleport03")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_04" "teleport03")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_01" "teleport02")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_02" "teleport02")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_03" "teleport02")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_04" "teleport02")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_01" "teleport01")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_02" "teleport01")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_03" "teleport01")
        (effect_new_on_object_marker "effects\objects\characters\gravemind\tentacle_teleport" "tentacle_capture_04" "teleport01")
    )
)

(script dormant void x08_teleport_characters
    (begin
        (sleep 470)
        (print "effect - teleport dervish")
        (effect_new_on_object_marker "effects\gameplay\regret_teleport" "dervish" "body")
        (sleep 5)
        (print "effect - teleport chief")
        (effect_new_on_object_marker "effects\gameplay\regret_teleport" "chief" "body")
    )
)

(script static void x08_11_setup
    (begin
        (wake x08_score_11)
        (wake x08_foley_11)
        (wake x08_0380_grv)
        (wake x08_0390_grv)
        (wake x08_teleport_build)
        (wake x08_teleport_characters)
    )
)

(script dormant void x08_11_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "dervish")
        (object_destroy "gravemind")
        (object_destroy "tentacle_chief")
        (object_destroy "tentacle_arbiter")
        (object_destroy_containing "tentacle_capture")
    )
)

(script static void x08_scene_11
    (begin
        (x08_11_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x08\x08" "x08_11" none "anchor_flag_x08")
        (custom_animation_relative "chief" "objects\characters\masterchief\x08\x08" "chief_11" false "anchor_x08")
        (custom_animation_relative "dervish" "objects\characters\dervish\x08\x08" "dervish_11" false "anchor_x08")
        (custom_animation_relative "gravemind" "objects\characters\gravemind\x08\x08" "gm_mouth_11" false "anchor_x08")
        (scenery_animation_start_relative "tentacle_chief" "objects\characters\gravemind\tentacle_capture_masterchief\x08\x08" "tc_mc_11" "anchor_x08")
        (scenery_animation_start_relative "tentacle_arbiter" "objects\characters\gravemind\tentacle_capture_arbiter\x08\x08" "tc_arb_11" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven01_11" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven02_11" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_03" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven03_11" "anchor_x08")
        (scenery_animation_start_relative "tentacle_capture_04" "objects\characters\gravemind\tentacle_capture_driven\x08\x08" "tc_driven04_11" "anchor_x08")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 0.0 0.0 0.0 5)
        (sleep 5)
        (wake x08_11_cleanup)
        (sleep 30)
    )
)

(script static void x08
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash gravemind)
        (sleep 1)
        (x08_scene_01)
        (x08_scene_02)
        (x08_scene_03)
        (x08_scene_04)
        (x08_scene_05)
        (x08_scene_06a)
        (x08_scene_06b)
        (x08_scene_06c)
        (x08_scene_07)
        (x08_scene_08)
        (x08_scene_09)
        (x08_scene_10)
        (x08_scene_11)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script dormant void c07_intro_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 18.0 56.0 0.227451 0.129412 0.223529)
        (cinematic_lighting_set_secondary_light -26.0 134.0 0.196078 0.188235 0.286275)
        (cinematic_lighting_set_ambient_light 0.180392 0.176471 0.207843)
        (object_uses_cinematic_lighting "delta_halo" true)
    )
)

(script dormant void c07_intro_01_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "delta_halo")
        (object_create_anew "matte_substance")
        (object_create_anew "matte_high_charity")
        (object_create_anew_containing "intro_fleet")
        (object_create_anew_containing "stardust")
    )
)

(script static void c07_intro_02_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "brute_intro_01")
        (object_create_anew "brute_intro_02")
        (object_create_anew "brute_intro_03")
        (object_create_anew "brute_intro_04")
        (object_create_anew "brute_05")
        (object_create_anew "brute_06")
        (object_create_anew "grunt_01")
        (object_create_anew "grunt_02")
        (object_create_anew "grunt_03")
        (object_create_anew "grunt_04")
        (object_create_anew "grunt_05")
        (object_create_anew "jackal_01")
        (object_create_anew "jackal_02")
        (object_create_anew_containing "intro_pike")
        (object_create_anew_containing "intro_crowd")
        (object_cinematic_lod "brute_intro_01" true)
        (object_cinematic_lod "brute_intro_02" true)
        (object_cinematic_lod "brute_intro_03" true)
        (object_cinematic_lod "brute_intro_04" true)
        (object_cinematic_lod "brute_05" true)
        (object_cinematic_lod "brute_06" true)
        (object_cinematic_lod "grunt_01" true)
        (object_cinematic_lod "grunt_02" true)
        (object_cinematic_lod "grunt_03" true)
        (object_cinematic_lod "grunt_04" true)
        (object_cinematic_lod "grunt_05" true)
        (object_cinematic_lod "jackal_01" true)
        (object_cinematic_lod "jackal_02" true)
    )
)

(script static void c07_intro_01_cleanup
    (begin
        (object_destroy "delta_halo")
        (object_destroy "matte_substance")
        (object_destroy "matte_high_charity")
        (object_destroy_containing "fleet")
        (object_destroy_containing "stardust")
    )
)

(script static void c07_intro_scene_01
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (wake c07_intro_cinematic_light_01)
        (camera_control true)
        (set_pjl_effect "highcharity_intro")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (07_intro_01_predict_stub)
        (wake c07_intro_01_problem_actors)
        (sleep prediction_offset)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intro\07_intro" "07_intro_01" none "anchor_flag_intro_a")
        (scenery_animation_start_relative "delta_halo" "scenarios\objects\forerunner\industrial\halo\07_intro\07_intro" "halo_01" "anchor_intro_a")
        (scenery_animation_start_relative "matte_high_charity" "objects\cinematics\matte_paintings\high_charity_exterior\07_intro\07_intro" "high_charity_exterior_01" "anchor_intro_a")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\07_intro\07_intro" "substance_01" "anchor_intro_a")
        (scenery_animation_start_relative "stardust_01" "objects\cinematics\matte_paintings\high_charity_stardust\07_intro\07_intro" "stardust01_01" "anchor_intro_a")
        (scenery_animation_start_relative "stardust_02" "objects\cinematics\matte_paintings\high_charity_stardust\07_intro\07_intro" "stardust02_01" "anchor_intro_a")
        (sleep 15)
        (cinematic_start 0.0 0.0 0.0 60)
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intro_02_predict_stub)
        (c07_intro_02_problem_actors)
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intro\foley\c07_intro_02_fol")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c07_intro_01_cleanup)
    )
)

(script dormant void c07_intro_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intro\foley\c07_intro_02_fol" none 1.0)
        (print "c07_intro foley 02 start")
    )
)

(script dormant void c07_1010_pot
    (begin
        (sleep 200)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1010_pot" none 1.0)
        (attract_mode_set_seconds "c07_1010_pot" 3.0)
    )
)

(script dormant void c07_intro_dof_02
    (begin
        (rasterizer_profile_include_all)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.0 0.0 1.0 1.0 0.0)
        (print "rack focus")
        (sleep 83)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 1.0 0.5 1.0 0.0 0.5)
        (print "rack focus")
        (sleep 56)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void lightmap_shadows_on
    (begin
        (sleep 141)
        (print "enable lightmap shadows")
        (online_message_send)
    )
)

(script dormant void c07_intro_cinematic_light_02
    (begin
        (cinematic_lighting_set_primary_light 25.0 190.0 0.470588 0.368627 0.541176)
        (cinematic_lighting_set_secondary_light -36.0 0.0 0.160784 0.176471 0.345098)
        (cinematic_lighting_set_ambient_light 0.105882 0.0941177 0.0784314)
        (object_uses_cinematic_lighting "brute_intro_01" true)
        (object_uses_cinematic_lighting "brute_intro_02" true)
        (object_uses_cinematic_lighting "brute_intro_03" true)
        (object_uses_cinematic_lighting "brute_intro_04" true)
        (object_uses_cinematic_lighting "brute_05" true)
        (object_uses_cinematic_lighting "brute_06" true)
        (object_uses_cinematic_lighting "grunt_01" true)
        (object_uses_cinematic_lighting "grunt_02" true)
        (object_uses_cinematic_lighting "grunt_03" true)
        (object_uses_cinematic_lighting "grunt_04" true)
        (object_uses_cinematic_lighting "grunt_05" true)
        (object_uses_cinematic_lighting "jackal_01" true)
        (object_uses_cinematic_lighting "jackal_02" true)
        (object_uses_cinematic_lighting "intro_pike_01" true)
        (object_uses_cinematic_lighting "intro_pike_02" true)
        (object_uses_cinematic_lighting "intro_pike_03" true)
        (object_uses_cinematic_lighting "intro_pike_04" true)
        (object_uses_cinematic_lighting "intro_pike_05" true)
        (object_uses_cinematic_lighting "intro_pike_06" true)
        (object_uses_cinematic_lighting "intro_crowd_01" true)
        (object_uses_cinematic_lighting "intro_crowd_02" true)
        (object_uses_cinematic_lighting "intro_crowd_03" true)
        (object_uses_cinematic_lighting "intro_crowd_04" true)
        (object_uses_cinematic_lighting "intro_crowd_05" true)
        (object_uses_cinematic_lighting "intro_crowd_06" true)
        (object_uses_cinematic_lighting "intro_crowd_07" true)
        (object_uses_cinematic_lighting "intro_crowd_08" true)
        (object_uses_cinematic_lighting "intro_crowd_09" true)
        (object_uses_cinematic_lighting "intro_crowd_10" true)
        (object_uses_cinematic_lighting "intro_crowd_11" true)
        (object_uses_cinematic_lighting "intro_crowd_12" true)
        (object_uses_cinematic_lighting "intro_crowd_13" true)
        (object_uses_cinematic_lighting "intro_crowd_14" true)
    )
)

(script static void c07_intro_03_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "truth_intro")
        (object_create_anew "mercy_intro")
        (object_create_anew "throne_truth_intro")
        (object_create_anew "throne_mercy_intro")
        (object_create_anew "index_intro")
        (object_cinematic_lod "truth_intro" true)
        (object_cinematic_lod "mercy_intro" true)
        (object_cinematic_lod "throne_truth_intro" true)
        (object_cinematic_lod "throne_mercy_intro" true)
        (object_cinematic_lod "index_intro" true)
        (objects_attach "truth_intro" "driver" "throne_truth_intro" "driver_cinematic")
        (objects_attach "mercy_intro" "driver" "throne_mercy_intro" "driver_cinematic")
    )
)

(script static void c07_intro_02_setup
    (begin
        (wake c07_intro_foley_02)
        (wake c07_1010_pot)
        (wake lightmap_shadows_on)
        (wake c07_intro_dof_02)
        (wake c07_intro_cinematic_light_02)
        (if (= legendary (pvs_set_camera)) 
            (begin
                (object_create_anew "grunt_card")
            )
        )
    )
)

(script static void c07_intro_02_cleanup
    (begin
        (object_destroy "grunt_03")
        (object_destroy "grunt_04")
        (object_destroy "grunt_05")
        (object_destroy "jackal_01")
        (object_destroy "jackal_02")
        (object_destroy "grunt_card")
        (object_destroy_containing "intro_crowd")
    )
)

(script static void c07_intro_scene_02
    (begin
        (c07_intro_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intro\07_intro" "07_intro_02" none "anchor_flag_intro_c")
        (custom_animation_relative "brute_intro_01" "objects\characters\brute\07_intro\07_intro" "brute01_02" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_02" "objects\characters\brute\07_intro\07_intro" "brute02_02" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_03" "objects\characters\brute\07_intro\07_intro" "brute03_02" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_04" "objects\characters\brute\07_intro\07_intro" "brute04_02" false "anchor_intro_c")
        (custom_animation_relative "brute_05" "objects\characters\brute\07_intro\07_intro" "brute05_02" false "anchor_intro_c")
        (custom_animation_relative "brute_06" "objects\characters\brute\07_intro\07_intro" "brute06_02" false "anchor_intro_c")
        (custom_animation_relative "grunt_01" "objects\characters\grunt\07_intro\07_intro" "grunt01_02" false "anchor_intro_c")
        (custom_animation_relative "grunt_02" "objects\characters\grunt\07_intro\07_intro" "grunt02_02" false "anchor_intro_c")
        (custom_animation_relative "grunt_03" "objects\characters\grunt\07_intro\07_intro" "grunt03_02" false "anchor_intro_c")
        (custom_animation_relative "grunt_04" "objects\characters\grunt\07_intro\07_intro" "grunt04_02" false "anchor_intro_c")
        (custom_animation_relative "grunt_05" "objects\characters\grunt\07_intro\07_intro" "grunt05_02" false "anchor_intro_c")
        (custom_animation_relative "jackal_01" "objects\characters\jackal\07_intro\07_intro" "jackal01_02" false "anchor_intro_c")
        (custom_animation_relative "jackal_02" "objects\characters\jackal\07_intro\07_intro" "jackal02_02" false "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_01" "objects\weapons\melee\pike\07_intro\07_intro" "pike01_02" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_02" "objects\weapons\melee\pike\07_intro\07_intro" "pike02_02" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_03" "objects\weapons\melee\pike\07_intro\07_intro" "pike03_02" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_04" "objects\weapons\melee\pike\07_intro\07_intro" "pike04_02" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_05" "objects\weapons\melee\pike\07_intro\07_intro" "pike05_02" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_06" "objects\weapons\melee\pike\07_intro\07_intro" "pike06_02" "anchor_intro_c")
        (sleep 5)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intro_03_predict_stub)
        (c07_intro_03_problem_actors)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intro\foley\c07_intro_03_fol")
        (sleep (camera_set_pan))
        (c07_intro_02_cleanup)
    )
)

(script dormant void c07_intro_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intro\foley\c07_intro_03_fol" none 1.0)
        (print "c07_intro foley 03 start")
    )
)

(script dormant void c07_1020_pot
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1020_pot" none 1.0)
        (attract_mode_set_seconds "c07_1020_pot" 6.0)
        (unit_set_emotional_state "truth_intro" "pensive" 0.25 0)
        (print "truth - pensive .25 0")
    )
)

(script dormant void c07_1030_pot
    (begin
        (sleep 181)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1030_pot" "truth_intro" 1.0)
        (attract_mode_set_seconds "c07_1030_pot" 9.0)
        (sleep 180)
        (unit_set_emotional_state "truth_intro" "happy" 0.25 90)
        (print "truth - happy .25 90")
    )
)

(script dormant void c07_1040_pot
    (begin
        (sleep 451)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1040_pot" "truth_intro" 1.0)
        (attract_mode_set_seconds "c07_1040_pot" 6.0)
    )
)

(script dormant void c07_intro_03_fov
    (begin
        (rasterizer_profile_include_all)
        (sleep 178)
        (print "change fov")
        (camera_pan 40.0 0)
        (rasterizer_profile_include_all)
        (sleep 166)
        (print "change fov")
        (camera_pan 50.0 0)
    )
)

(script dormant void c07_intro_cinematic_light_03
    (begin
        (cinematic_lighting_set_primary_light 44.0 166.0 0.317647 0.282353 0.376471)
        (cinematic_lighting_set_secondary_light -69.0 348.0 0.290196 0.227451 0.537255)
        (cinematic_lighting_set_ambient_light 0.054902 0.0470588 0.0392157)
        (object_uses_cinematic_lighting "truth_intro" true)
        (object_uses_cinematic_lighting "mercy_intro" true)
        (object_uses_cinematic_lighting "throne_truth_intro" true)
        (object_uses_cinematic_lighting "throne_mercy_intro" true)
        (object_uses_cinematic_lighting "index_intro" true)
    )
)

(script dormant void texture_camera_start
    (begin
        (rasterizer_profile_include_all)
        (sleep 178)
        (print "texture camera start")
        (texture_camera_set_object_marker "texture_camera" "marker" 50.0)
        (object_hide "mercy" true)
        (object_hide "throne_mercy" true)
        (object_hide "brute_intro_01" true)
        (object_hide "brute_intro_02" true)
        (object_hide "brute_intro_03" true)
        (object_hide "brute_intro_04" true)
        (object_hide "brute_05" true)
        (object_hide "brute_06" true)
    )
)

(script dormant void texture_camera_stop
    (begin
        (sleep 344)
        (print "texture camera stop")
        (texture_camera_off)
        (object_hide "mercy" false)
        (object_hide "throne_mercy" false)
        (object_hide "brute_intro_01" false)
        (object_hide "brute_intro_02" false)
        (object_hide "brute_intro_03" false)
        (object_hide "brute_intro_04" false)
        (object_hide "brute_05" false)
        (object_hide "brute_06" false)
    )
)

(script static void c07_intro_03_setup
    (begin
        (predict_animation)
        (object_create_anew "chief_needler")
        (object_create_anew "texture_camera")
        (object_create_anew "holo_cam")
        (object_cinematic_lod "chief_needler" true)
        (object_cinematic_lod "holo_cam" true)
        (objects_attach "grunt_02" "right_hand" "chief_needler" "")
        (wake c07_intro_foley_03)
        (wake c07_1020_pot)
        (wake c07_1030_pot)
        (wake c07_1040_pot)
        (wake c07_intro_03_fov)
        (wake texture_camera_start)
        (wake texture_camera_stop)
        (wake c07_intro_cinematic_light_03)
    )
)

(script static void c07_intro_03_cleanup
    (begin
        (object_destroy "brute_intro_03")
        (object_destroy "brute_intro_04")
        (object_destroy "brute_05")
        (object_destroy "brute_06")
    )
)

(script static void c07_intro_scene_03
    (begin
        (c07_intro_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intro\07_intro" "07_intro_03" none "anchor_flag_intro_c")
        (custom_animation_relative "truth_intro" "objects\characters\prophet\07_intro\07_intro" "truth_03" false "anchor_intro_c")
        (custom_animation_relative "mercy_intro" "objects\characters\prophet\07_intro\07_intro" "mercy_03" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_01" "objects\characters\brute\07_intro\07_intro" "brute01_03" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_02" "objects\characters\brute\07_intro\07_intro" "brute02_03" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_03" "objects\characters\brute\07_intro\07_intro" "brute03_03" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_04" "objects\characters\brute\07_intro\07_intro" "brute04_03" false "anchor_intro_c")
        (custom_animation_relative "brute_05" "objects\characters\brute\07_intro\07_intro" "brute05_03" false "anchor_intro_c")
        (custom_animation_relative "brute_06" "objects\characters\brute\07_intro\07_intro" "brute06_03" false "anchor_intro_c")
        (custom_animation_relative "grunt_01" "objects\characters\grunt\07_intro\07_intro" "grunt01_03" false "anchor_intro_c")
        (custom_animation_relative "grunt_02" "objects\characters\grunt\07_intro\07_intro" "grunt02_03" false "anchor_intro_c")
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\07_intro\07_intro" "tex_camera_03" "anchor_intro_c")
        (scenery_animation_start_relative "holo_cam" "objects\cinematics\covenant\holo_cam\07_intro\07_intro" "holo_cam_03" "anchor_intro_c")
        (scenery_animation_start_relative "index_intro" "scenarios\objects\forerunner\industrial\index\index_full\07_intro\07_intro" "index_03" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_01" "objects\weapons\melee\pike\07_intro\07_intro" "pike01_03" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_02" "objects\weapons\melee\pike\07_intro\07_intro" "pike02_03" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_03" "objects\weapons\melee\pike\07_intro\07_intro" "pike03_03" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_04" "objects\weapons\melee\pike\07_intro\07_intro" "pike04_03" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_05" "objects\weapons\melee\pike\07_intro\07_intro" "pike05_03" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_06" "objects\weapons\melee\pike\07_intro\07_intro" "pike06_03" "anchor_intro_c")
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intro_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intro\foley\c07_intro_04_fol")
        (sleep (camera_set_pan))
        (c07_intro_03_cleanup)
    )
)

(script dormant void c07_intro_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intro\foley\c07_intro_04_fol" none 1.0)
        (print "c07_intro foley 04 start")
    )
)

(script dormant void c07_1050_pot
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1050_pot" "truth_intro" 1.0)
        (attract_mode_set_seconds "c07_1050_pot" 5.0)
        (unit_set_emotional_state "truth_intro" "happy" 0.25 0)
        (unit_set_emotional_state "truth_intro" "happy" 0.5 60)
        (print "truth - happy .5 60")
    )
)

(script dormant void c07_1060_mas
    (begin
        (sleep 217)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1060_mas" "chief" 1.0)
        (attract_mode_set_seconds "c07_1060_mas" 1.0)
    )
)

(script dormant void c07_1070_crz
    (begin
        (sleep 236)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1070_crz" "grunt_01" 1.0)
        (attract_mode_set_seconds "c07_1070_crz" 2.0)
        (unit_set_emotional_state "truth_intro" "shocked" 0.75 0)
        (print "truth - shocked .75 0")
    )
)

(script dormant void c07_1080_pot
    (begin
        (sleep 412)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_1080_pot" "truth_intro" 1.0)
        (attract_mode_set_seconds "c07_1080_pot" 2.0)
        (sleep 30)
        (unit_set_emotional_state "truth_intro" "arrogant" 0.5 30)
        (print "truth - arrogant .5 30")
    )
)

(script dormant void effect_chief_teleport
    (begin
        (print "effect - teleport")
        (effect_new_on_object_marker "effects\gameplay\cinematic_teleport" "teleport" "marker")
    )
)

(script dormant void intro_chief_arrival
    (begin
        (sleep 142)
        (print "chief arrival")
        (custom_animation_relative "chief_intro" "objects\characters\masterchief\07_intro\07_intro" "chief_04" false "anchor_intro_c")
    )
)

(script dormant void needler_attach
    (begin
        (rasterizer_profile_include_all)
        (sleep 230)
        (objects_detach "grunt_02" "chief_needler")
        (print "needler detach")
        (sleep 80)
        (objects_attach "chief_intro" "right_hand" "chief_needler" "")
        (print "needler attach")
    )
)

(script static void c07_intro_04_setup
    (begin
        (object_create_anew "teleport")
        (object_create_anew "chief_intro")
        (object_cinematic_lod "chief_intro" true)
        (object_uses_cinematic_lighting "chief_intro" true)
        (render_lights_enable_cinematic_shadow true "chief_intro" "head" 0.4)
        (wake c07_intro_foley_04)
        (wake c07_1050_pot)
        (wake c07_1060_mas)
        (wake c07_1070_crz)
        (wake c07_1080_pot)
        (wake intro_chief_arrival)
        (wake needler_attach)
        (wake effect_chief_teleport)
    )
)

(script static void c07_intro_04_cleanup
    (begin
        (object_destroy "chief_intro")
        (object_destroy_containing "truth")
        (object_destroy_containing "mercy")
        (object_destroy "brute_intro_01")
        (object_destroy "brute_intro_02")
        (object_destroy "grunt_01")
        (object_destroy "grunt_02")
        (object_destroy "index_intro")
        (object_destroy "holo_cam")
        (object_destroy "teleport")
        (object_destroy_containing "intro_pike")
        (object_destroy "chief_needler")
    )
)

(script static void c07_intro_scene_04
    (begin
        (c07_intro_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intro\07_intro" "07_intro_04" none "anchor_flag_intro_c")
        (custom_animation_relative "truth_intro" "objects\characters\prophet\07_intro\07_intro" "truth_04" false "anchor_intro_c")
        (custom_animation_relative "mercy_intro" "objects\characters\prophet\07_intro\07_intro" "mercy_04" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_01" "objects\characters\brute\07_intro\07_intro" "brute01_04" false "anchor_intro_c")
        (custom_animation_relative "brute_intro_02" "objects\characters\brute\07_intro\07_intro" "brute02_04" false "anchor_intro_c")
        (custom_animation_relative "grunt_01" "objects\characters\grunt\07_intro\07_intro" "grunt01_04" false "anchor_intro_c")
        (custom_animation_relative "grunt_02" "objects\characters\grunt\07_intro\07_intro" "grunt02_04" false "anchor_intro_c")
        (scenery_animation_start_relative "index_intro" "scenarios\objects\forerunner\industrial\index\index_full\07_intro\07_intro" "index_04" "anchor_intro_c")
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\07_intro\07_intro" "tex_camera_04" "anchor_intro_c")
        (scenery_animation_start_relative "holo_cam" "objects\cinematics\covenant\holo_cam\07_intro\07_intro" "holo_cam_04" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_01" "objects\weapons\melee\pike\07_intro\07_intro" "pike01_04" "anchor_intro_c")
        (scenery_animation_start_relative "intro_pike_02" "objects\weapons\melee\pike\07_intro\07_intro" "pike02_04" "anchor_intro_c")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c07_intro_04_cleanup)
    )
)

(script static void c07_intro
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (sound_class_enable_ducker "amb" 0.0 15)
        (crash high_0)
        (sleep 1)
        (c07_intro_scene_01)
        (sound_class_enable_ducker "amb" 1.0 15)
        (c07_intro_scene_02)
        (c07_intro_scene_03)
        (c07_intro_scene_04)
    )
)

(script dormant void c07_intra1_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\music\c07_intra1_01_mus" none 1.0)
        (print "c07_intra1 score 01 start")
    )
)

(script dormant void c07_intra1_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_01_fol" none 1.0)
        (print "c07_intra1 foley 01 start")
    )
)

(script dormant void c07_2010_tar
    (begin
        (sleep 128)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2010_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c07_2010_tar" 2.0)
    )
)

(script dormant void c07_intra1_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 23.0 74.0 0.258824 0.270588 0.368627)
        (cinematic_lighting_set_secondary_light -40.0 276.0 0.407843 0.345098 0.317647)
        (cinematic_lighting_set_ambient_light 0.0431373 0.0470588 0.0666667)
        (object_uses_cinematic_lighting "truth" true)
        (object_uses_cinematic_lighting "mercy" true)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "johnson" true)
        (object_uses_cinematic_lighting "tartarus" true)
        (object_uses_cinematic_lighting "monitor" true)
        (object_uses_cinematic_lighting "brute_01" true)
        (object_uses_cinematic_lighting "brute_02" true)
        (object_uses_cinematic_lighting "brute_03" true)
        (object_uses_cinematic_lighting "brute_04" true)
        (object_uses_cinematic_lighting "throne_truth" true)
        (object_uses_cinematic_lighting "throne_mercy" true)
        (object_uses_cinematic_lighting "phantom_01" true)
        (object_uses_cinematic_lighting "phantom_02" true)
        (object_uses_cinematic_lighting "phantom_03" true)
        (object_uses_cinematic_lighting "hammer" true)
        (object_uses_cinematic_lighting "intra_pike_01" true)
        (object_uses_cinematic_lighting "intra_pike_02" true)
    )
)

(script dormant void hide_pikes
    (begin
        (rasterizer_profile_include_all)
        (sleep 300)
        (print "hide pikes")
        (object_hide "intra_pike_01" true)
        (object_hide "intra_pike_02" true)
    )
)

(script dormant void show_pikes
    (begin
        (sleep 400)
        (print "show pikes")
        (object_hide "intra_pike_01" false)
        (object_hide "intra_pike_02" false)
    )
)

(script dormant void johnson_emotion
    (begin
        (unit_set_emotional_state "johnson" "angry" 0.25 0)
        (sleep 277)
        (unit_set_emotional_state "johnson" "pain" 0.5 30)
        (print "johnson - pain .5 30")
    )
)

(script dormant void miranda_emotion
    (begin
        (unit_set_emotional_state "miranda" "shocked" 0.1 0)
        (sleep 375)
        (unit_set_emotional_state "miranda" "shocked" 0.4 60)
        (print "miranda - shocked .25 60")
    )
)

(script static void c07_intra1_01_setup
    (begin
        (object_create_anew "miranda")
        (object_create_anew "johnson")
        (object_create_anew "truth")
        (object_create_anew "mercy")
        (object_create_anew "tartarus")
        (object_create_anew "brute_01")
        (object_create_anew "brute_02")
        (object_create_anew "brute_03")
        (object_create_anew "brute_04")
        (object_create_anew "monitor")
        (object_create_anew "hammer")
        (object_create_anew "throne_truth")
        (object_create_anew "throne_mercy")
        (object_create_anew "phantom_01")
        (object_create_anew "phantom_02")
        (object_create_anew "phantom_03")
        (object_create_anew_containing "intra_pike")
        (object_set_function_variable "monitor" "talking" 0.0 0.0)
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "truth" true)
        (object_cinematic_lod "mercy" true)
        (object_cinematic_lod "tartarus" true)
        (object_cinematic_lod "brute_01" true)
        (object_cinematic_lod "brute_02" true)
        (object_cinematic_lod "brute_03" true)
        (object_cinematic_lod "brute_04" true)
        (object_cinematic_lod "monitor" true)
        (object_cinematic_lod "hammer" true)
        (object_cinematic_lod "throne_truth" true)
        (object_cinematic_lod "throne_mercy" true)
        (object_cinematic_lod "phantom_01" true)
        (object_cinematic_lod "phantom_02" true)
        (object_cinematic_lod "phantom_03" true)
        (objects_attach "truth" "driver" "throne_truth" "driver_cinematic")
        (objects_attach "mercy" "driver" "throne_mercy" "driver_cinematic")
        (wake c07_intra1_score_01)
        (wake c07_intra1_foley_01)
        (wake c07_2010_tar)
        (wake johnson_emotion)
        (wake miranda_emotion)
        (wake hide_pikes)
        (wake show_pikes)
        (wake c07_intra1_cinematic_light_01)
    )
)

(script static void c07_intra1_01_cleanup
    (begin
        (object_destroy "miranda")
        (object_destroy "johnson")
        (object_destroy "monitor")
        (object_destroy "brute_01")
        (object_destroy "brute_02")
    )
)

(script static void c07_intra1_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "highcharity_intra1")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (07_intra1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_01_fol")
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\music\c07_intra1_01_mus")
        (sleep prediction_offset)
        (c07_intra1_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_01" none "anchor_flag_intra1")
        (custom_animation_relative "miranda" "objects\characters\miranda\07_intra1\07_intra1" "miranda_01" false "anchor_intra1")
        (custom_animation_relative "johnson" "objects\characters\marine\07_intra1\07_intra1" "johnson_01" false "anchor_intra1")
        (custom_animation_relative "truth" "objects\characters\prophet\07_intra1\07_intra1" "truth_01" false "anchor_intra1")
        (custom_animation_relative "mercy" "objects\characters\prophet\07_intra1\07_intra1" "mercy_01" false "anchor_intra1")
        (custom_animation_relative "monitor" "objects\characters\monitor\07_intra1\07_intra1" "monitor_01" false "anchor_intra1")
        (custom_animation_relative "tartarus" "objects\characters\brute\07_intra1\07_intra1" "tartarus_01" false "anchor_intra1")
        (custom_animation_relative "brute_01" "objects\characters\brute\07_intra1\07_intra1" "brute01_01" false "anchor_intra1")
        (custom_animation_relative "brute_02" "objects\characters\brute\07_intra1\07_intra1" "brute02_01" false "anchor_intra1")
        (custom_animation_relative "brute_03" "objects\characters\brute\07_intra1\07_intra1" "brute03_01" false "anchor_intra1")
        (custom_animation_relative "brute_04" "objects\characters\brute\07_intra1\07_intra1" "brute04_01" false "anchor_intra1")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\07_intra1\07_intra1" "hammer_01" "anchor_intra1")
        (scenery_animation_start_relative "intra_pike_01" "objects\weapons\melee\pike\07_intra1\07_intra1" "pike01_01" "anchor_intra1")
        (scenery_animation_start_relative "intra_pike_02" "objects\weapons\melee\pike\07_intra1\07_intra1" "pike02_01" "anchor_intra1")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom1_01" false "anchor_intra1")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom2_01" false "anchor_intra1")
        (custom_animation_relative "phantom_03" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom3_01" false "anchor_intra1")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intra1_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_02_fol")
        (sleep (camera_set_pan))
        (c07_intra1_01_cleanup)
    )
)

(script dormant void c07_intra1_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_02_fol" none 1.0)
        (print "c07_intra1 foley 02 start")
    )
)

(script dormant void c07_2020_pot
    (begin
        (sleep 52)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2020_pot" "truth" 1.0)
        (attract_mode_set_seconds "c07_2020_pot" 4.0)
    )
)

(script dormant void c07_2030_tar
    (begin
        (sleep 163)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2030_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c07_2030_tar" 4.0)
        (sleep 90)
        (print "spawn infection-forms")
        (ai_place "c07_infection")
    )
)

(script dormant void c07_intra1_02_fov_01
    (begin
        (sleep 347)
        (print "fov change: 60 -> 8 over 20 ticks")
        (camera_pan 8.0 20)
    )
)

(script static void c07_intra1_02_setup
    (begin
        (object_cannot_take_damage "truth")
        (object_cannot_take_damage "mercy")
        (object_cannot_take_damage "tartarus")
        (object_cannot_take_damage "brute_03")
        (object_cannot_take_damage "brute_04")
        (object_cannot_take_damage "infection_form_01")
        (object_cannot_take_damage "infection_form_02")
        (object_create_anew "infection_form_01")
        (object_create_anew "index")
        (object_cinematic_lod "infection_form_01" true)
        (object_cinematic_lod "index" true)
        (wake c07_intra1_foley_02)
        (wake c07_2020_pot)
        (wake c07_2030_tar)
        (wake c07_intra1_02_fov_01)
    )
)

(script static void c07_intra1_02_cleanup
    (begin
        (objects_detach "mercy" "throne_mercy")
        (object_destroy "mercy")
        (object_hide "index" true)
    )
)

(script static void c07_intra1_scene_02
    (begin
        (c07_intra1_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_02" none "anchor_flag_intra1")
        (custom_animation_relative "truth" "objects\characters\prophet\07_intra1\07_intra1" "truth_02" false "anchor_intra1")
        (custom_animation_relative "mercy" "objects\characters\prophet\07_intra1\07_intra1" "mercy_02" false "anchor_intra1")
        (custom_animation_relative "tartarus" "objects\characters\brute\07_intra1\07_intra1" "tartarus_02" false "anchor_intra1")
        (custom_animation_relative "brute_03" "objects\characters\brute\07_intra1\07_intra1" "brute03_02" false "anchor_intra1")
        (custom_animation_relative "brute_04" "objects\characters\brute\07_intra1\07_intra1" "brute04_02" false "anchor_intra1")
        (custom_animation_relative "infection_form_01" "objects\characters\flood_infection\07_intra1\07_intra1" "infection01_02" false "anchor_intra1")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\07_intra1\07_intra1" "hammer_02" "anchor_intra1")
        (scenery_animation_start_relative "index" "scenarios\objects\forerunner\industrial\index\index_full\07_intra1\07_intra1" "index_02" "anchor_intra1")
        (scenery_animation_start_relative "intra_pike_01" "objects\weapons\melee\pike\07_intra1\07_intra1" "pike01_02" "anchor_intra1")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom1_02" false "anchor_intra1")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom2_02" false "anchor_intra1")
        (custom_animation_relative "phantom_03" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom3_02" false "anchor_intra1")
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intra1_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_03_fol")
        (sleep (camera_set_pan))
        (c07_intra1_02_cleanup)
    )
)

(script dormant void c07_intra1_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_03_fol" none 1.0)
        (print "c07_intra1 foley 03 start")
    )
)

(script dormant void c07_2040_pom
    (begin
        (sleep 295)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2040_pom" "mercy" 1.0)
        (attract_mode_set_seconds "c07_2040_pom" 4.0)
        (unit_set_emotional_state "mercy" "scared" 1.0 30)
        (print "mercy - scared 1 30")
    )
)

(script dormant void effect_infection_burrow
    (begin
        (sleep 302)
        (print "effect - infection burrow")
        (effect_new_on_object_marker "effects\cinematics\07\flood_burrowing" "infection_form_02" "mouth")
    )
)

(script dormant void infection_pop_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 162)
        (effect_new_on_object_marker "effects\objects\characters\flood_infection\body_depleted" "infection_form_01" "")
        (object_hide "infection_form_01" true)
        (sleep 51)
        (object_hide "infection_form_01" false)
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\flood_infection\body_depleted" "infection_form_01" "")
        (object_hide "infection_form_01" true)
    )
)

(script dormant void infection_pop_02
    (begin
        (sleep 171)
        (effect_new_on_object_marker "effects\objects\characters\flood_infection\body_depleted" "infection_form_02" "")
        (object_hide "infection_form_02" true)
        (sleep 2)
        (object_hide "infection_form_02" false)
        (sleep 7)
        (effect_new_on_object_marker "effects\objects\characters\flood_infection\body_depleted" "infection_form_02" "")
        (object_hide "infection_form_02" true)
        (sleep 9)
        (object_hide "infection_form_02" false)
        (sleep 17)
        (effect_new_on_object_marker "effects\objects\characters\flood_infection\body_depleted" "infection_form_02" "")
        (object_hide "infection_form_02" true)
        (sleep 10)
        (object_hide "infection_form_02" false)
    )
)

(script dormant void kill_infection_forms
    (begin
        (sleep 158)
        (print "erase infection forms")
        (ai_erase "c07_infection")
    )
)

(script dormant void delete_mercy_throne
    (begin
        (sleep 308)
        (print "destroy mercy's throne")
        (object_destroy "throne_mercy")
    )
)

(script static void c07_intra1_03_setup
    (begin
        (object_create_anew "mercy_no_crown")
        (object_create_anew "infection_form_02")
        (object_cinematic_lod "mercy_no_crown" true)
        (object_cinematic_lod "infection_form_02" true)
        (object_uses_cinematic_lighting "mercy_no_crown" true)
        (object_uses_cinematic_lighting "infection_form_02" true)
        (objects_attach "mercy_no_crown" "driver" "throne_mercy" "driver_cinematic")
        (wake c07_intra1_foley_03)
        (wake c07_2040_pom)
        (wake delete_mercy_throne)
        (wake kill_infection_forms)
        (wake infection_pop_01)
        (wake infection_pop_02)
        (wake effect_infection_burrow)
    )
)

(script static void c07_intra1_03_cleanup
    (begin
        (object_destroy "infection_form_02")
        (object_destroy "hammer")
        (object_destroy_containing "intra_pike")
    )
)

(script static void c07_intra1_scene_03
    (begin
        (c07_intra1_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_03" none "anchor_flag_intra1")
        (camera_pan 60.0 0)
        (custom_animation_relative "truth" "objects\characters\prophet\07_intra1\07_intra1" "truth_03" false "anchor_intra1")
        (custom_animation_relative "mercy_no_crown" "objects\characters\prophet\07_intra1\07_intra1" "mercy_03" false "anchor_intra1")
        (custom_animation_relative "tartarus" "objects\characters\brute\07_intra1\07_intra1" "tartarus_03" false "anchor_intra1")
        (custom_animation_relative "brute_03" "objects\characters\brute\07_intra1\07_intra1" "brute03_03" false "anchor_intra1")
        (custom_animation_relative "brute_04" "objects\characters\brute\07_intra1\07_intra1" "brute04_03" false "anchor_intra1")
        (custom_animation_relative "infection_form_01" "objects\characters\flood_infection\07_intra1\07_intra1" "infection01_03" false "anchor_intra1")
        (custom_animation_relative "infection_form_02" "objects\characters\flood_infection\07_intra1\07_intra1" "infection02_03" false "anchor_intra1")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\07_intra1\07_intra1" "hammer_03" "anchor_intra1")
        (scenery_animation_start_relative "intra_pike_01" "objects\weapons\melee\pike\07_intra1\07_intra1" "pike01_03" "anchor_intra1")
        (scenery_animation_start_relative "intra_pike_02" "objects\weapons\melee\pike\07_intra1\07_intra1" "pike02_03" "anchor_intra1")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom1_03" false "anchor_intra1")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom2_03" false "anchor_intra1")
        (custom_animation_relative "phantom_03" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom3_03" false "anchor_intra1")
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intra1_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_04_fol")
        (sleep (camera_set_pan))
        (c07_intra1_03_cleanup)
    )
)

(script dormant void c07_intra1_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_04_fol" none 1.0)
        (print "c07_intra1 foley 04 start")
    )
)

(script dormant void c07_2050_pot
    (begin
        (sleep 64)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2050_pot" "truth" 1.0)
        (attract_mode_set_seconds "c07_2050_pot" 1.0)
    )
)

(script dormant void c07_2060_pot
    (begin
        (sleep 132)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2060_pot" "truth" 1.0)
        (attract_mode_set_seconds "c07_2060_pot" 3.0)
        (sleep 45)
        (unit_set_emotional_state "tartarus" "pensive" 0.5 60)
        (print "tartarus - shocked .5 60")
        (unit_set_emotional_state "mercy" "shocked" 1.0 0)
        (print "mercy - shocked 1 0")
    )
)

(script dormant void c07_2070_pot
    (begin
        (sleep 231)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2070_pot" "truth" 1.0)
        (attract_mode_set_seconds "c07_2070_pot" 2.0)
        (unit_set_emotional_state "mercy" "pain" 1.0 60)
        (print "mercy - pain 1 60")
    )
)

(script dormant void c07_intra1_dof_04
    (begin
        (rasterizer_profile_include_all)
        (sleep 384)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 0.5 0.75 0.75 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 106)
        (cinematic_screen_effect_set_crossfade2 0.5 0.75 0.0 0.5 0.0 0.75 0.5)
        (print "rack focus")
    )
)

(script static void c07_intra1_04_setup
    (begin
        (effect_new_on_object_marker "effects\cinematics\07\flood_burrowing" "infection_form_01" "mouth")
        (object_hide "index" false)
        (object_hide "infection_form_01" false)
        (wake c07_intra1_foley_04)
        (wake c07_2050_pot)
        (wake c07_2060_pot)
        (wake c07_2070_pot)
        (wake c07_intra1_dof_04)
        (unit_set_emotional_state "tartarus" "shocked" 0.5 0)
        (print "tartarus - shocked .5 0")
    )
)

(script static void c07_intra1_04_cleanup
    (begin
        (object_destroy "truth")
        (object_destroy "mercy_no_crown")
        (object_destroy "tartarus")
        (object_destroy "brute_03")
        (object_destroy "brute_04")
        (object_destroy "infection_form_01")
        (object_destroy "throne_mercy")
        (object_destroy "phantom_01")
        (object_destroy "phantom_02")
        (object_destroy "phantom_03")
        (object_destroy "index")
    )
)

(script static void c07_intra1_scene_04
    (begin
        (c07_intra1_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_04" none "anchor_flag_intra1")
        (custom_animation_relative "truth" "objects\characters\prophet\07_intra1\07_intra1" "truth_04" false "anchor_intra1")
        (custom_animation_relative "mercy_no_crown" "objects\characters\prophet\07_intra1\07_intra1" "mercy_04" false "anchor_intra1")
        (custom_animation_relative "tartarus" "objects\characters\brute\07_intra1\07_intra1" "tartarus_04" false "anchor_intra1")
        (custom_animation_relative "brute_03" "objects\characters\brute\07_intra1\07_intra1" "brute03_04" false "anchor_intra1")
        (custom_animation_relative "brute_04" "objects\characters\brute\07_intra1\07_intra1" "brute04_04" false "anchor_intra1")
        (scenery_animation_start_relative "index" "scenarios\objects\forerunner\industrial\index\index_full\07_intra1\07_intra1" "index_04" "anchor_intra1")
        (custom_animation_relative "infection_form_01" "objects\characters\flood_infection\07_intra1\07_intra1" "infection01_04" false "anchor_intra1")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom1_04" false "anchor_intra1")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom2_04" false "anchor_intra1")
        (custom_animation_relative "phantom_03" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom3_04" false "anchor_intra1")
        (sleep (- (camera_set_pan) 60.0))
        (cinematic_stop 0.0 0.0 0.0 60)
        (sleep 60)
        (c07_intra1_04_cleanup)
        (predict_animation)
    )
)

(script static void c07_intra1
    (begin
        (sound_class_enable_ducker "vehicle" 0.25 1)
        (sound_cache_flush)
        (animation_cache_flush)
        (crash high_5)
        (sleep 1)
        (c07_intra1_scene_01)
        (c07_intra1_scene_02)
        (c07_intra1_scene_03)
        (c07_intra1_scene_04)
    )
)

(script static void test
    (begin
        (print "effect - infection burrow")
        (effect_new_on_object_marker "effects\cinematics\07\flood_burrowing" "infection_form_02" "mouth")
        (effect_new_on_object_marker "effects\cinematics\07\flood_burrowing" "infection_form_01" "mouth")
    )
)

(script command_script void cs_jump
    (begin
        (cs_jump_to_point 0.0 5.0)
    )
)

(script command_script void cs_abort
    (begin
        (sleep 1)
    )
)

(script command_script void cs_alert
    (begin
        (cs_abort_on_alert true)
        (sleep_forever)
    )
)

(script command_script void cs_alert_combat
    (begin
        (cs_abort_on_alert true)
        (cs_movement_mode ai_movement_combat)
        (sleep_forever)
    )
)

(script static void test_rumble
    (begin
        (damage_object "objects\cinematics\human\inamberclad_to_scale\damage_effects\ioc_flyby" (player0))
    )
)

(script static void test_ioc
    (begin
        (object_create "ioc_effect")
        (sound_impulse_start_effect "sound\visual_effects\inamberclad_flyby\slipspace" "rupture" 1.0)
        (sound_impulse_start_effect "sound\visual_effects\inamberclad_flyby\inamberclad_flyby" none 1.0)
        (sleep 3)
        (object_create "ioc")
        (device_set_position_track "ioc" "high_charity_flyby" 0.0)
        (device_animate_position "ioc" 1.0 15.0 0.0 0.0 false)
        (sleep 30)
        (object_destroy "ioc_effect")
        (sleep 30)
        (damage_object "objects\cinematics\human\inamberclad_to_scale\damage_effects\ioc_flyby" (player0))
        (sleep_until (>= (device_get_position "ioc") 1.0))
        (object_destroy "ioc")
    )
)

(script dormant void bullshit
    (begin
        (sleep_until (= (version) 3))
        (object_destroy_containing "bsp0_crate")
        (object_destroy_containing "bsp1_crate")
        (object_destroy_containing "bsp2_crate")
        (object_destroy_containing "bsp2_body")
        (sleep 1)
        (object_create_anew_containing "bsp3_body")
        (object_create_anew_containing "bsp3_crate")
        (sleep_until (= (version) 4))
        (object_destroy_containing "bsp3_body")
        (object_destroy_containing "bsp3_crate")
        (sleep 1)
        (object_create_anew_containing "bsp3b_body")
        (object_create_anew_containing "bsp3b_crate")
        (sleep_until (= (version) 5))
        (object_destroy_containing "bsp3b_body")
        (object_destroy_containing "bsp3b_crate")
        (sleep 1)
        (object_create_anew_containing "bsp4_body")
        (object_create_anew_containing "bsp4_crate")
    )
)

(script command_script void cs_expand_cortana
    (begin
        (object_set_scale (ai_get_object ai_current_actor) 0.01 0)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (ai_disregard (ai_get_object ai_current_actor) true)
        (sleep 5)
        (object_dynamic_simulation_disable (ai_get_object ai_current_actor) true)
        (unit_set_emotional_state (ai_get_unit ai_current_actor) "pensive" 0.5 0)
        (sleep 1)
        (object_hide (ai_get_object ai_current_actor) false)
        (object_set_scale (ai_get_object ai_current_actor) 0.65 20)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_shrink_cortana
    (begin
        (cs_enable_dialogue false)
        (sleep 60)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" (ai_get_object ai_current_actor) "effect")
        (sleep 3)
        (object_set_scale (ai_get_object ai_current_actor) 0.01 10)
        (sleep 30)
        (ai_erase ai_current_actor)
    )
)

(script dormant void ice_cream_angry
    (begin
        (sleep_until (volume_test_objects "tv_ice_cream" (players)))
        (object_create "ice_cream_effect")
        (object_create "ice_cream_head")
        (ai_place "ice_cream_grunt")
        (sleep 1)
        (device_set_position "ice_cream_effect" 1.0)
        (ai_set_active_camo "ice_cream_grunt" true)
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head.weapon")
            )
        )
        (if debug 
            (print "you're going to get fat!!!!! or dead..."))
        (if debug 
            (print "because now everyone is angry!!!!"))
        (reset_dsp_image 13)
    )
)

(script dormant void music_07a_01
    (begin
        (sleep_until g_music_07a_01)
        (if debug 
            (print "start music 07a_01"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_01" none 1.0)
        (sleep_until (not g_music_07a_01))
        (if debug 
            (print "stop music 07a_01"))
        (sound_looping_set_scale "scenarios\solo\07a_highcharity\07a_music\07a_01")
    )
)

(script dormant void music_07a_02
    (begin
        (sleep_until g_music_07a_02)
        (if debug 
            (print "start music 07a_02"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_02" none 1.0)
        (sleep_until (not g_music_07a_02))
        (if debug 
            (print "stop music 07a_02"))
        (sound_looping_set_scale "scenarios\solo\07a_highcharity\07a_music\07a_02")
    )
)

(script dormant void music_07a_03
    (begin
        (sleep_until g_music_07a_03)
        (if debug 
            (print "start music 07a_03"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_03" none 1.0)
        (sleep_until g_music_07a_03_alt)
        (if debug 
            (print "set music 07a_03 alternate"))
        (sound_class_show_channel "scenarios\solo\07a_highcharity\07a_music\07a_03" true)
        (sleep_until (not g_music_07a_03))
        (if debug 
            (print "stop music 07a_03"))
        (sound_looping_set_scale "scenarios\solo\07a_highcharity\07a_music\07a_03")
    )
)

(script dormant void music_07a_04
    (begin
        (sleep_until g_music_07a_04)
        (if debug 
            (print "start music 07a_04"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_04" none 1.0)
        (sleep_until g_music_07a_04_alt)
        (if debug 
            (print "set music 07a_04 alternate"))
        (sound_class_show_channel "scenarios\solo\07a_highcharity\07a_music\07a_04" true)
        (sleep_until (not g_music_07a_04))
        (if debug 
            (print "stop music 07a_04"))
        (sound_looping_set_scale "scenarios\solo\07a_highcharity\07a_music\07a_04")
    )
)

(script dormant void music_07a_05
    (begin
        (sleep_until g_music_07a_05)
        (if debug 
            (print "start music 07a_05"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_05" none 1.0)
        (sleep_until (not g_music_07a_05))
        (if debug 
            (print "stop music 07a_05"))
        (sound_looping_set_scale "scenarios\solo\07a_highcharity\07a_music\07a_05")
    )
)

(script dormant void music_07a_06
    (begin
        (sleep_until g_music_07a_06)
        (if debug 
            (print "start music 07a_06"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_06" none 1.0)
    )
)

(script dormant void music_07a_07
    (begin
        (sleep_until g_music_07a_07)
        (if debug 
            (print "start music 07a_07"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_07" none 1.0)
        (sleep_until g_music_07a_07_alt)
        (if debug 
            (print "set music 07a_07 alternate"))
        (sound_class_show_channel "scenarios\solo\07a_highcharity\07a_music\07a_07" true)
        (sleep_until (not g_music_07a_07))
        (if debug 
            (print "stop music 07a_07"))
        (sound_looping_set_scale "scenarios\solo\07a_highcharity\07a_music\07a_07")
    )
)

(script dormant void music_07a_08
    (begin
        (sleep_until g_music_07a_08)
        (if debug 
            (print "start music 07a_08"))
        (sound_looping_stop_immediately "scenarios\solo\07a_highcharity\07a_music\07a_08" none 1.0)
        (sleep_until (not g_music_07a_08))
        (if debug 
            (print "stop music 07a_08"))
        (sound_looping_set_scale "scenarios\solo\07a_highcharity\07a_music\07a_08")
    )
)

(script dormant void chapter_job
    (begin
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_thanks
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

(script dormant void chapter_grudge
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

(script dormant void chapter_graves
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

(script dormant void objective_locate_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "locate the prophet of truth and the index.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_locate_clear
    (begin
        (print "objective complete:")
        (print "locate the prophet of truth and the index.")
        (update_remote_camera 0)
    )
)

(script dormant void objective_rescue_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "rescue the marines being held in the detention-block.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_rescue_clear
    (begin
        (print "objective complete:")
        (print "rescue the marines being held in the detention-block.")
        (update_remote_camera 1)
    )
)

(script dormant void objective_truth_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "follow the prophet of truth to the far tower.")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective_truth_clear
    (begin
        (print "objective complete:")
        (print "follow the prophet of truth to the far tower.")
        (update_remote_camera 2)
    )
)

(script dormant void objective_phantom_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "stop the prophet of truth from boarding his phantom.")
        (input_suppress_vibration 3)
    )
)

(script dormant void objective_phantom_clear
    (begin
        (print "objective complete:")
        (print "stop the prophet of truth from boarding his phantom.")
        (update_remote_camera 3)
    )
)

(script static void erase_cortana
    (begin
        (if debug 
            (print "erasing cortana..."))
        (cs_run_command_script "cortana" cs_shrink_cortana)
        (sleep 1)
    )
)

(script static void sc_this_way_a
    (begin
        (if dialogue 
            (print "cortana: this way, chief!"))
        (sleep (ai_play_line_on_object none "2000"))
        (sleep dialogue_pause)
    )
)

(script static void sc_this_way_b
    (begin
        (if dialogue 
            (print "cortana: over here, chief!"))
        (sleep (ai_play_line_on_object none "2010"))
        (sleep dialogue_pause)
    )
)

(script static void sc_this_way_c
    (begin
        (if dialogue 
            (print "cortana: chief! let's go"))
        (sleep (ai_play_line_on_object none "2020"))
        (sleep dialogue_pause)
    )
)

(script static void sc_this_way_d
    (begin
        (if dialogue 
            (print "cortana: come on, chief!"))
        (sleep (ai_play_line_on_object none "2030"))
        (sleep dialogue_pause)
    )
)

(script static void sc_this_way_e
    (begin
        (if dialogue 
            (print "cortana: through here!"))
        (sleep (ai_play_line_on_object none "2040"))
        (sleep dialogue_pause)
    )
)

(script static void sc_this_way_f
    (begin
        (if dialogue 
            (print "cortana: go on through!"))
        (sleep (ai_play_line_on_object none "2050"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_council_ini
    (begin
        (if dialogue 
            (print "cortana: brutes!"))
        (sleep (ai_play_line_on_object none "2070"))
        (sleep (* dialogue_pause 3.0))
        (if dialogue 
            (print "cortana: the faster you kill those brutes the better"))
        (sleep (ai_play_line_on_object none "2100"))
        (set g_council_initial true)
    )
)

(script dormant void sc_brutes_berserk
    (begin
        (if (> (ai_living_count "council_brute_ini") 0) 
            (begin
                (if dialogue 
                    (print "cortana: they don't have shield generators, but take them out before..."))
                (sleep (ai_play_line_on_object none "2080"))
                (sleep dialogue_pause)
            )
        )
        (if (> (ai_living_count "council_brute_ini") 0) 
            (begin
                (if dialogue 
                    (print "cortana: it's berserking!"))
                (sleep (ai_play_line_on_object none "2090"))
            )
        )
    )
)

(script dormant void sc_council_exit_reminder
    (begin
        (sleep (* 30.0 20.0))
        (sleep_until 
            (begin
                (if 
                    (or
                        (volume_test_objects "tv_council_bk" (players))
                        (volume_test_objects "tv_council_lt_bk" (players))
                        (volume_test_objects "tv_council_rt_bk" (players))
                    ) 
                        (begin
                            (if g_council_exit_reminder 
                                (sleep_forever))
                            (if dialogue 
                                (print "cortana: they've locked it from below"))
                            (sleep (ai_play_line_on_object none "2130"))
                            (sleep (* dialogue_pause 2.0))
                            (if g_council_exit_reminder 
                                (sleep_forever))
                            (if dialogue 
                                (print "cortana: there's a door at the other end of the chamber"))
                            (sleep (ai_play_line_on_object none "2120"))
                            (set g_council_reminder_played true)
                        )
                )
                (if g_council_reminder_played 
                    (begin
                        (set g_council_reminder_played false)
                        (sleep (* 30.0 30.0))
                    )
                )
                g_council_exit_reminder
            ) 
        60)
    )
)

(script static void sc_council_mid
    (begin
        (sleep (random_range 15 45))
        (if dialogue 
            (print "brute: the demon has infiltrated the council chamber?!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1000_bth" "council_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1000_bth" "council_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1000_bth" "council_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1000_bth" "council_sound_d" 1.0 1)
        (sleep 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1000_bth"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "brute: protect the hierarchs! seal the exits!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1010_bth" "council_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1010_bth" "council_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1010_bth" "council_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1010_bth" "council_sound_d" 1.0 1)
        (sleep 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1010_bth"))
        (sleep (* dialogue_pause 2.0))
        (if dialogue 
            (print "cortana: oh, i don't think so"))
        (sleep (ai_play_line_on_object none "2190"))
        (sleep (* dialogue_pause 4.0))
    )
)

(script dormant void sc_council_exit_leave
    (begin
        (sleep 150)
        (if (volume_test_objects "tv_council_ext" (players)) 
            (begin
                (if dialogue 
                    (print "cortana: don't worry. you can pick me up later"))
                (sleep (ai_play_line_at_player "cortana_0" "2180"))
            )
        )
        (erase_cortana)
    )
)

(script dormant void sc_council_exit
    (begin
        (sleep (random_range 15 45))
        (if dialogue 
            (print "cortana: put me down on one of the pedestals near the door."))
        (sleep (ai_play_line_on_object none "2110"))
        (wake sc_council_exit_reminder)
        (sleep_until 
            (begin
                (if 
                    (and
                        (> (objects_distance_to_object (players) "bsp_0_holo_a") 0.0)
                        (< (objects_distance_to_object (players) "bsp_0_holo_a") 2.5)
                    ) 
                        (begin
                            (begin
                                (ai_place "cortana_0/a")
                                (set g_council_exit_reminder true)
                                (sleep 5)
                                (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "bsp_0_holo_a" "effect")
                            )
                        ) (if 
                            (and
                                (> (objects_distance_to_object (players) "bsp_0_holo_b") 0.0)
                                (< (objects_distance_to_object (players) "bsp_0_holo_b") 2.5)
                            ) 
                                (begin
                                    (begin
                                        (ai_place "cortana_0/b")
                                        (set g_council_exit_reminder true)
                                        (sleep 5)
                                        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "bsp_0_holo_b" "effect")
                                    )
                                ) )
                )
                g_council_exit_reminder
            ) 
        5)
        (sleep 90)
        (if dialogue 
            (print "cortana: that prophet - truth - he has the index!"))
        (if dialogue 
            (print "cortana: you've got to take it back from him!"))
        (sleep (ai_play_line_at_player "cortana_0" "2150"))
        (sleep (* dialogue_pause 3.0))
        (if dialogue 
            (print "cortana: let me get these doors..."))
        (sleep (ai_play_line_at_player "cortana_0" "2140"))
        (sleep dialogue_pause)
        (device_closes_automatically_set "council_exit" false)
        (device_operates_automatically_set "council_exit" true)
        (sleep 1)
        (device_set_position "council_exit" 1.0)
        (sleep 15)
        (game_save_no_timeout)
        (if dialogue 
            (print "cortana: go. it'll be easier to track truth if i stay in the network"))
        (sleep (ai_play_line_at_player "cortana_0" "2170"))
        (sleep dialogue_pause)
        (set g_music_07a_01 true)
        (wake sc_council_exit_leave)
        (sleep_until (volume_test_objects "tv_council_hall" (players)) 5)
        (sleep 30)
        (erase_cortana)
        (device_closes_automatically_set "council_exit" true)
    )
)

(script dormant void sc_grand_a_exit
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_0/f")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "bsp_0_holo_f" "effect")
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "bsp_0_holo_f") 0.0)
                (< (objects_distance_to_object (players) "bsp_0_holo_f") 4.0)
            )
        )
        (set g_music_07a_02 true)
        (if dialogue 
            (print "cortana: right this way chief!"))
        (sleep (ai_play_line_at_player "cortana_0" "2060"))
        (device_one_sided_set "grand_a_exit" false)
        (sleep_until (volume_test_objects "tv_dervish_ledge_fr" (players)))
        (sleep 30)
        (erase_cortana)
    )
)

(script dormant void sc_ledge_chieftan
    (begin
        (if g_cheiftan 
            (sleep_forever))
        (sleep 30)
        (if dialogue 
            (print "cortana: watch out for the captain!"))
        (if dialogue 
            (print "cortana: it's got a brute shot"))
        (sleep (ai_play_line_on_object none "2200"))
        (set g_cheiftan true)
    )
)

(script dormant void sc_ledge_down_reminder
    (begin
        (sleep 300)
        (sleep_until (volume_test_objects "tv_dervish_ledge_lift" (players)))
        (if g_ledge_reminder 
            (sleep_forever))
        (if dialogue 
            (print "cortana: after that stunt on the cairo,"))
        (if dialogue 
            (print "cortana: i know you're not afraid of heights."))
        (sleep (ai_play_line_at_player "cortana_0" "2240"))
        (sleep (* dialogue_pause 3.0))
        (sleep 300)
        (sleep_until (volume_test_objects "tv_dervish_ledge_lift" (players)))
        (if g_ledge_reminder 
            (sleep_forever))
        (if dialogue 
            (print "cortana: fine, i won't watch"))
        (if dialogue 
            (print "cortana: meet you at the bottom, ok?"))
        (sleep (ai_play_line_at_player "cortana_0" "2250"))
        (sleep dialogue_pause)
    )
)

(script dormant void sc_ledge_down
    (begin
        (sleep_until 
            (and
                g_cheiftan
                (<= (ai_living_count "dervish_ledge_prophets") 3)
            )
        )
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_0/i")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "bsp_0_holo_i" "effect")
        (sleep 90)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_dervish_ledge_fr" (ai_actors "prophets")))
                (not (volume_test_objects "tv_dervish_ledge_bk" (ai_actors "prophets")))
            )
        )
        (set g_dervish_ledge_orders true)
        (sleep 30)
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "bsp_0_holo_i") 0.0)
                (< (objects_distance_to_object (players) "bsp_0_holo_i") 2.0)
            )
        )
        (if dialogue 
            (print "cortana: truth is moving through the lower-levels of the tower."))
        (sleep (ai_play_line_at_player "cortana_0" "2210"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: i'll reverse this grav-lift. drop down, try to cut him off."))
        (sleep (ai_play_line_at_player "cortana_0" "2220"))
        (sleep dialogue_pause)
        (game_save_no_timeout)
        (device_closes_automatically_set "dervish_lift_up" false)
        (device_set_position "dervish_lift_up" 1.0)
        (sleep 30)
        (object_destroy "dervish_lift_up")
        (object_create "dervish_lift_down")
        (sleep 5)
        (if dialogue 
            (print "cortana: it's safe really. just step in"))
        (sleep (ai_play_line_at_player "cortana_0" "2230"))
        (sleep dialogue_pause)
        (wake sc_ledge_down_reminder)
        (sleep_until (volume_test_objects "tv_dervish_ledge_lower" (players)))
        (set g_ledge_reminder true)
        (erase_cortana)
    )
)

(script dormant void sc_corridor_a_amb
    (begin
        (sleep (random_range 15 45))
        (if dialogue 
            (print "brute: reinforce all approaches to the holding-pens!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1020_bth" "corr_a_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1020_bth" "corr_a_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1020_bth" "corr_a_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1020_bth" "corr_a_sound_d" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1020_bth"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "brute: slay the demon on sight!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1030_bth" "corr_a_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1030_bth" "corr_a_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1030_bth" "corr_a_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1030_bth" "corr_a_sound_d" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1030_bth"))
        (sleep (* dialogue_pause 5.0))
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "grand_b_holo_b") 0.0)
                (< (objects_distance_to_object (players) "grand_b_holo_b") 5.0)
            ) 
        5)
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_grand_b/b")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "grand_b_holo_b" "effect")
        (sleep 30)
        (if dialogue 
            (print "cortana: they're beefing-up their patrols. stay sharp."))
        (sleep (ai_play_line_at_player "cortana_grand_b" "2260"))
        (game_saving)
        (sleep 30)
        (device_set_position "grand_b_exit" 1.0)
        (sleep 90)
        (erase_cortana)
        (device_closes_automatically_set "grand_b_exit" true)
    )
)

(script dormant void sc_jail_info
    (begin
        (if dialogue 
            (print "cortana: wait a minute... i'm reading marine iff transponders!"))
        (sleep (ai_play_line_on_object none "2270"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: the signals are originating somewhere below your position."))
        (sleep (ai_play_line_on_object none "2280"))
        (game_saving)
        (ai_place "hall_b_jackals")
        (wake objective_locate_clear)
        (wake objective_rescue_set)
    )
)

(script dormant void sc_room_a_lift
    (begin
        (sleep_until (<= (ai_living_count "hall_b_prophets") 3))
        (ai_place "cortana_corridor_a/o")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "hall_a_holo_o" "effect")
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "hall_a_holo_o") 0.0)
                (< (objects_distance_to_object (players) "hall_a_holo_o") 4.5)
            )
        )
        (if dialogue 
            (print "cortana: there's another lift in the next room"))
        (sleep (ai_play_line_at_player "cortana_corridor_a" "2290"))
        (sleep dialogue_pause)
        (sleep_until 
            (and
                g_room_a_door
                (volume_test_objects "tv_room_a" (players))
            )
        )
        (erase_cortana)
    )
)

(script dormant void sc_room_a_down
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_room_a/m")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "room_a_holo_m" "effect")
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "jail_down") 0.0)
                (< (objects_distance_to_object (players) "jail_down") 3.5)
            ) 
        5)
        (sleep 15)
        (if dialogue 
            (print "cortana: here, chief! jump in!"))
        (sleep (ai_play_line_at_player "cortana_room_a" "2300"))
        (ai_place "room_a_tube_fodder")
        (device_set_power "room_a_lift" 0.0)
        (device_set_position "room_a_lift_effect" 1.0)
        (sleep 30)
        (device_set_position "jail_down" 1.0)
    )
)

(script dormant void sc_jail_down
    (begin
        (if dialogue 
            (print "cortana: there are two groups of marines in this detention-block."))
        (sleep (ai_play_line_on_object none "2310"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: i'll zero their locations - you neutralize the guards... quietly"))
        (sleep (ai_play_line_on_object none "2320"))
        (sleep 30)
        (set g_music_07a_03 true)
        (game_reverted)
    )
)

(script dormant void sc_cell_a_ent
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_jail/h")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "jail_ped_h" "effect")
        (sleep 60)
        (if dialogue 
            (print "cortana: come to middle-level, chief!"))
        (sleep (ai_play_line_on_object none "2350"))
        (sleep (* dialogue_pause 3.0))
        (if 
            (or
                g_jail_a_finished
                g_jail_b_finished
            ) 
                (begin
                    (if dialogue 
                        (print "cortana: more guards! get ready!"))
                    (sleep (ai_play_line_on_object none "2380"))
                ) (begin
                    (if dialogue 
                        (print "cortana: the marines are just inside. careful of the guards."))
                    (sleep (ai_play_line_on_object none "2360"))
                )
        )
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "jail_ped_h") 0.0)
                (< (objects_distance_to_object (players) "jail_ped_h") 3.0)
            ) 
        5)
        (game_save_no_timeout)
    )
)

(script dormant void sc_cell_b_ent
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_jail/n")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "jail_ped_n" "effect")
        (sleep 60)
        (if dialogue 
            (print "cortana: chief! come to the lower level!"))
        (sleep (ai_play_line_on_object none "2370"))
        (sleep (* dialogue_pause 3.0))
        (if 
            (or
                g_jail_a_finished
                g_jail_b_finished
            ) 
                (begin
                    (if dialogue 
                        (print "cortana: more guards! get ready!"))
                    (sleep (ai_play_line_on_object none "2380"))
                ) (begin
                    (if dialogue 
                        (print "cortana: the marines are just inside. careful of the guards."))
                    (sleep (ai_play_line_on_object none "2360"))
                )
        )
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "jail_ped_n") 0.0)
                (< (objects_distance_to_object (players) "jail_ped_n") 3.0)
            ) 
        5)
        (game_save_no_timeout)
    )
)

(script dormant void sc_first_cell
    (begin
        (ai_dialogue_enable false)
        (sleep 90)
        (if dialogue 
            (print "cortana: listen-up marines. the chief's hunting a prophet,"))
        (if dialogue 
            (print "cortana: and you're gonna help him kill it."))
        (sleep (ai_play_line_at_player "cortana_jail" "2390"))
        (sleep dialogue_pause)
        (set g_music_07a_03_alt true)
        (if dialogue 
            (print "marine: no sense sticking around here!"))
        (sleep (ai_play_line_at_player "jail_marines" "4000"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "marine: affirmative!"))
        (sleep (ai_play_line_at_player "jail_marines" "4010"))
        (sleep (* dialogue_pause 5.0))
        (if dialogue 
            (print "cortana: one more group of marines to go"))
        (sleep (ai_play_line_at_player "cortana_jail" "2400"))
        (sleep dialogue_pause)
        (game_saving)
        (sleep 90)
        (ai_dialogue_enable true)
        (erase_cortana)
    )
)

(script dormant void sc_second_cell
    (begin
        (sleep 90)
        (if dialogue 
            (print "marine: good on ya"))
        (sleep (ai_play_line_at_player "jail_marines" "4020"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "marine: thanks"))
        (sleep (ai_play_line_at_player "jail_marines" "4030"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: that's all the marines, chief. good work."))
        (sleep (ai_play_line_at_player "cortana_jail" "2410"))
        (sleep dialogue_pause)
        (game_saving)
        (sleep 90)
        (wake objective_rescue_clear)
        (erase_cortana)
    )
)

(script dormant void sc_jail_exit
    (begin
        (if dialogue 
            (print "cortana: we'll get out of here the same way we came in:"))
        (if dialogue 
            (print "cortana: the central grav-lift"))
        (sleep (ai_play_line_on_object none "2420"))
    )
)

(script dormant void sc_lift_reins
    (begin
        (if dialogue 
            (print "cortana: hostile reinforcements! coming down the lift!"))
        (sleep (ai_play_line_on_object none "2430"))
    )
)

(script dormant void sc_jail_clear_reminder
    (begin
        (sleep (* 30.0 20.0))
        (sleep_until 
            (begin
                (if 
                    (or
                        (volume_test_objects "tv_jail_top" (players))
                        (volume_test_objects "tv_jail_mid" (players))
                        (volume_test_objects "tv_jail_bot" (players))
                    ) 
                        (begin
                            (if g_jail_exit_reminder 
                                (sleep_forever))
                            (if dialogue 
                                (print "cortana: we've got to get after truth, chief! step into the lift!"))
                            (sleep (ai_play_line_on_object none "2450"))
                            (set g_jail_exit_reminder_played true)
                        )
                )
                (if g_jail_exit_reminder_played 
                    (begin
                        (set g_jail_exit_reminder_played false)
                        (sleep (* 30.0 20.0))
                    )
                )
                g_jail_exit_reminder
            ) 
        60)
    )
)

(script command_script void cs_marines_exit
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to jails/exit)
    )
)

(script dormant void sc_jail_clear
    (begin
        (if (= (random_range 0 2) 0) 
            (begin
                (ai_place "cortana_jail/a")
                (sleep 5)
                (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "jail_ped_a" "effect")
            ) (begin
                (ai_place "cortana_jail/b")
                (sleep 5)
                (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "jail_ped_b" "effect")
            )
        )
        (sleep 90)
        (object_destroy "jail_down")
        (device_set_position "jail_up_effect" 1.0)
        (sleep 30)
        (object_create "jail_up")
        (object_create "room_b_lift")
        (device_set_position "room_b_lift_effect" 1.0)
        (pvs_clear "jail_ped_a")
        (sleep_until 
            (or
                (and
                    (> (objects_distance_to_object (players) "jail_ped_a") 0.0)
                    (< (objects_distance_to_object (players) "jail_ped_a") 3.0)
                )
                (and
                    (> (objects_distance_to_object (players) "jail_ped_b") 0.0)
                    (< (objects_distance_to_object (players) "jail_ped_b") 3.0)
                )
            ) 
        5)
        (if dialogue 
            (print "cortana: the lift is clear. step on in!"))
        (sleep (ai_play_line_at_player "cortana_jail" "2440"))
        (sleep dialogue_pause)
        (cs_run_command_script "marines" cs_marines_exit)
        (wake sc_jail_clear_reminder)
    )
)

(script dormant void sc_room_b
    (begin
        (sleep 150)
        (if dialogue 
            (print "truth: fear not my brothers! the sacred icon is secure!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0140_pot" "corr_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0140_pot" "corr_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0140_pot" "corr_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0140_pot" "corr_b_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0140_pot" "corr_b_sound_i" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0140_pot"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "truth: it was tartarus and his brutes who took the icon from the flood!"))
        (if dialogue 
            (print "truth: for that, they have our thanks!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0150_pot" "corr_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0150_pot" "corr_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0150_pot" "corr_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0150_pot" "corr_b_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0150_pot" "corr_b_sound_i" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0150_pot"))
        (sleep (* dialogue_pause 4.0))
        (if dialogue 
            (print "cortana: excellent! truth is broadcasting on the move."))
        (if dialogue 
            (print "cortana: it'll make him much easier to track"))
        (sleep (ai_play_line_on_object none "2460"))
        (set g_sc_room_b_done true)
    )
)

(script dormant void sc_corridor_b_exit
    (begin
        (sleep_until (game_all_quiet))
        (if dialogue 
            (print "truth: the elites have failed to protect the prophets,"))
        (if dialogue 
            (print "truth: and in doing so, put all our lives at risk!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_e" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_f" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_g" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_h" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0220_pot" "corr_b_sound_i" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0220_pot"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "truth: let no warrior forget his oath: thou, in faith,"))
        (if dialogue 
            (print "truth: will keep us safe whilst we find the path!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_e" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_f" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_g" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_h" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0240_pot" "corr_b_sound_i" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0240_pot"))
        (sleep (* dialogue_pause 4.0))
        (if dialogue 
            (print "cortana: i've got a fix on truth just outside this tower, chief"))
        (sleep (ai_play_line_on_object none "2470"))
        (sleep dialogue_pause)
        (set g_music_07a_04 true)
        (if dialogue 
            (print "cortana: there's an exit nearby - hurry!"))
        (sleep (ai_play_line_on_object none "2480"))
        (sleep (* dialogue_pause 5.0))
        (set g_corr_b_exit_finished true)
        (game_saving)
    )
)

(script dormant void sc_network
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "grand_b_hunters") 0)
                (volume_test_objects "tv_tower_a_ext" (players))
            )
        )
        (sleep 30)
        (sleep_until g_corr_b_exit_finished)
        (if dialogue 
            (print "truth: with my blessing, the brutes now lead our fleets."))
        (if dialogue 
            (print "truth: they ask for your allegiance, and you shall give it!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0230_pot" "ext_a_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0230_pot" "ext_a_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0230_pot" "ext_a_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0230_pot" "ext_a_sound_e" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0230_pot" "ext_a_sound_f" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0230_pot" "ext_a_sound_g" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0230_pot"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: you wouldn't believe the number of kill systems the"))
        (if dialogue 
            (print "cortana: covenant are throwing-down around me."))
        (sleep (ai_play_line_on_object none "2490"))
        (sleep (* dialogue_pause 3.0))
        (if dialogue 
            (print "cortana: not to worry - it's pretty sloppy stuff."))
        (if dialogue 
            (print "cortana: i guess they never expected a hostile intelligence"))
        (if dialogue 
            (print "cortana: to penetrate their network from the inside!"))
        (sleep (ai_play_line_on_object none "2500"))
        (game_saving)
    )
)

(script dormant void in_amber_clad
    (begin
        (object_create "ioc_effect")
        (sound_impulse_start_effect "sound\visual_effects\inamberclad_flyby\slipspace" "rupture" 1.0)
        (sound_impulse_start_effect "sound\visual_effects\inamberclad_flyby\inamberclad_flyby" none 1.0)
        (sleep 3)
        (object_create "ioc")
        (device_set_position_track "ioc" "high_charity_flyby" 0.0)
        (device_animate_position "ioc" 1.0 15.0 0.0 0.0 false)
        (sleep 30)
        (object_destroy "ioc_effect")
        (sleep 30)
        (damage_object "objects\cinematics\human\inamberclad_to_scale\damage_effects\ioc_flyby" (player0))
        (sleep_until (>= (device_get_position "ioc") 1.0))
        (object_destroy "ioc")
    )
)

(script dormant void sc_ioc_reminder
    (begin
        (sleep (* 30.0 10.0))
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_garden_a_tram" (players)) 
                    (begin
                        (if g_council_exit_reminder 
                            (sleep_forever))
                        (if dialogue 
                            (print "cortana: just step into the pad. it'll move you forward automatically."))
                        (sleep (ai_play_line_at_player "cortana_3a" "2570"))
                        (set g_ioc_reminder_played true)
                        (sleep 30)
                    )
                )
                (if g_ioc_reminder_played 
                    (begin
                        (set g_ioc_reminder_played false)
                        (sleep (* 30.0 20.0))
                    )
                )
                g_ioc_reminder
            ) 
        60)
    )
)

(script dormant void sc_truth_a
    (begin
        (set g_truth_speaking true)
        (if dialogue 
            (print "cortana: they covenant just destroyed two of their own ships,"))
        (if dialogue 
            (print "cortana: and i'm hearing reports of small arms fire throughout their fleet."))
        (sleep (ai_play_line_on_object none "2520"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "truth: creatures of the covenant: the path is broad,"))
        (if dialogue 
            (print "truth: and we shall walk it side-by-side!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0180_pot" "ioc_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0180_pot" "ioc_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0180_pot" "ioc_sound_c" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0180_pot"))
        (sleep dialogue_pause)
        (set g_truth_speaking false)
    )
)

(script dormant void sc_in_amber_clad
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_3a/tram_a")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "garden_a_holo_a" "effect")
        (sleep 120)
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "garden_a_holo_a") 0.0)
                (< (objects_distance_to_object (players) "garden_a_holo_a") 4.0)
            ) 
        5)
        (if dialogue 
            (print "cortana: slip-space rupture!"))
        (sleep (ai_play_line_at_player "cortana_3a" "2530"))
        (sleep dialogue_pause)
        (set g_music_07a_05 true)
        (wake in_amber_clad)
        (if dialogue 
            (print "cortana: it's in amber clad!"))
        (sleep (ai_play_line_at_player "cortana_3a" "2531"))
        (sleep dialogue_pause)
        (set g_sc_ioc_finished true)
        (sleep_until (not g_truth_speaking))
        (if dialogue 
            (print "truth: be glad! the reward for all your toil, all your sacrifice,"))
        (if dialogue 
            (print "truth: is near at hand!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0320_pot" "ioc_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0320_pot" "ioc_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0320_pot" "ioc_sound_c" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0320_pot"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: hailing... no response!"))
        (sleep (ai_play_line_at_player "cortana_3a" "2540"))
        (sleep dialogue_pause)
        (game_save_no_timeout)
        (sleep_until (>= (device_get_position "ioc") 0.9))
        (sleep 30)
        (if dialogue 
            (print "cortana: she's crashed into another tower ahead of our position."))
        (if dialogue 
            (print "cortana: i'll keep trying to make contact,"))
        (if dialogue 
            (print "cortana: but i'm not registering any human vital-signs..."))
        (sleep (ai_play_line_at_player "cortana_3a" "2550"))
        (sleep (* dialogue_pause 10.0))
        (set g_music_07a_04 false)
        (wake sc_ioc_reminder)
        (game_save_no_timeout)
    )
)

(script dormant void sc_garden_a_tram_reminder
    (begin
        (if dialogue 
            (print "cortana: truth has a big enough lead as it is, chief. get going!"))
        (sleep (ai_play_line_on_object none "2580"))
    )
)

(script dormant void sc_drive_elites
    (begin
        (sleep (random_range 30 90))
        (if dialogue 
            (print "truth: at this moment, the councilors gather on halo to see the icon safely placed!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0160_pot" "midtower_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0160_pot" "midtower_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0160_pot" "midtower_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0160_pot" "midtower_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0160_pot" "midtower_sound_e" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0160_pot"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "brute: rise, pack-brothers! death to the elites!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1040_bth" "midtower_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1040_bth" "midtower_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1040_bth" "midtower_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1040_bth" "midtower_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1040_bth" "midtower_sound_e" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1040_bth"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "truth: there are those who said this day would never come."))
        (if dialogue 
            (print "truth: what have they to say now?"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0310_pot" "midtower_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0310_pot" "midtower_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0310_pot" "midtower_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0310_pot" "midtower_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0310_pot" "midtower_sound_e" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0310_pot"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "brute: once the towers are cleared, we'll drive them from the lower districts!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1050_bth" "midtower_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1050_bth" "midtower_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1050_bth" "midtower_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1050_bth" "midtower_sound_d" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1050_bth" "midtower_sound_e" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1050_bth"))
    )
)

(script dormant void sc_gardens_b
    (begin
        (sleep_until (volume_test_objects "tv_sc_gardens_b" (players)))
        (if dialogue 
            (print "truth: i have listened to the oracle, and it confirmed our dearest hope:"))
        (if dialogue 
            (print "truth: the great journey begins with halo!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_e" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_f" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_g" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_h" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0290_pot" "garden_b_sound_d" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0290_pot"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "brute: the elites are falling back to the mausoleum!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_e" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_f" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_g" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_h" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1060_bth" "garden_b_sound_d" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1060_bth"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "brute: fools! their arbiter can do nothing for them now!"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_e" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_f" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_g" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_h" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_1070_bth" "garden_b_sound_d" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_1070_bth"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "truth: who would doubt the prophets?"))
        (if dialogue 
            (print "truth: what have we foretold that has not come to pass?"))
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_a" 1.0)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_b" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_c" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_e" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_f" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_g" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_h" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0300_pot" "garden_b_sound_d" 1.0 1)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_0300_pot"))
    )
)

(script dormant void sc_catch_truth
    (begin
        (if dialogue 
            (print "cortana: if we're going to catch truth, we'll need to take a short-cut -"))
        (if dialogue 
            (print "cortana: straight through this mausoleum"))
        (sleep (ai_play_line_on_object none "2610"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: look on the bright side. for now,"))
        (if dialogue 
            (print "cortana: they seem much more interested in killing each other"))
        (sleep (ai_play_line_on_object none "2620"))
    )
)

(script dormant void sc_maus_interior
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_maus_ent" (players))
                (>= (device_get_position "maus_inner_ent") 0.0)
            )
        )
        (sleep 30)
        (ai_place "cortana_maus/a")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "maus_inner_holo_a" "effect")
        (sleep 45)
        (if dialogue 
            (print "cortana: you might consider sitting this one out"))
        (sleep (ai_play_line_at_player "cortana_maus" "2630"))
        (sleep 30)
        (set g_music_07a_07 true)
        (sleep 60)
        (erase_cortana)
    )
)

(script static void sc_maus_breather
    (begin
        (ai_place "cortana_maus/j")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "maus_inner_holo_j" "effect")
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "maus_inner_holo_j") 0.0)
                (< (objects_distance_to_object (players) "maus_inner_holo_j") 6.0)
            ) 
        30 (* 30.0 60.0 1.5))
        (if dialogue 
            (print "cortana: hang on... i'm picking-up two more transponders..."))
        (sleep (ai_play_line_at_player "cortana_maus" "2640"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: it's the commander and johnsom!"))
        (sleep (ai_play_line_at_player "cortana_maus" "2650"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: they're closing on truth's position, chief!"))
        (sleep (ai_play_line_at_player "cortana_maus" "2660"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: they'll need your help!"))
        (sleep (ai_play_line_at_player "cortana_maus" "2670"))
        (set g_music_07a_07_alt true)
    )
)

(script dormant void sc_maus_exit
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_maus/f")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "maus_inner_holo_f" "effect")
        (device_one_sided_set "maus_inner_exit" false)
        (sleep 1)
        (sleep_until 
            (and
                (> (objects_distance_to_object (players) "maus_inner_holo_f") 0.0)
                (< (objects_distance_to_object (players) "maus_inner_holo_f") 7.0)
            ) 
        5)
        (erase_cortana)
        (if dialogue 
            (print "cortana: this way, chief!"))
        (sleep (ai_play_line_at_player "cortana_maus" "2000"))
        (sleep dialogue_pause)
        (sleep_until (volume_test_objects "tv_game_won" (players)) 1)
        (set g_music_07a_08 false)
        (sleep 75)
        (if dialogue 
            (print "cortana: this isn't good. i'm getting confirmed reports of flood"))
        (if dialogue 
            (print "cortana: leaving in amber clad's wreckage"))
        (sleep (ai_play_line_on_object none "2590"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: let's get the index, and find a way out of here -"))
        (if dialogue 
            (print "cortana: before things get really ugly!"))
        (sleep (ai_play_line_on_object none "2600"))
        (sleep 30)
        (cinematic_fade_to_white)
        (ai_erase_all)
        (if (= g_play_cinematics true) 
            (begin
                (if (cinematic_skip_start) 
                    (begin
                        (if debug 
                            (print "c07_intra_1"))
                        (c07_intra1)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (if debug 
            (print "you win"))
        (playtest_mission)
        (game_revert)
    )
)

(script dormant void marine_migration
    (begin
        (sleep_until 
            (begin
                (if (= (version) 2) 
                    (begin
                        (begin
                            (if debug 
                                (print "migrate into corridor b"))
                            (ai_set_orders "marines" "marines_corr_b")
                        )
                    ) (if (= (version) 3) 
                        (begin
                            (begin
                                (if debug 
                                    (print "migrate into exterior a"))
                                (ai_set_orders "marines" "marines_ext_a")
                            )
                        ) )
                )
                g_marine_mig_garden_a
            )
        )
        (sleep 30)
        (if debug 
            (print "migrate into gardens a"))
        (ai_set_orders "marines" "marines_gardens_a")
        (sleep_until g_marine_mig_midtower)
        (sleep_until 
            (begin
                (if (= (version) 3) 
                    (begin
                        (begin
                            (if debug 
                                (print "migrate into mid-tower"))
                            (ai_set_orders "marines" "marines_midtower")
                        )
                    ) (if (= (version) 4) 
                        (begin
                            (begin
                                (if debug 
                                    (print "migrate into gardens b"))
                                (ai_set_orders "marines" "marines_gardens_b")
                            )
                        ) )
                )
                g_marine_mig_ext_b
            )
        )
        (sleep 30)
        (if debug 
            (print "migrate into exterior b"))
        (ai_set_orders "marines" "marines_ext_b")
        (sleep_until g_marine_mig_maus)
        (sleep_until 
            (begin
                (if (= (version) 4) 
                    (begin
                        (begin
                            (if debug 
                                (print "migrate into mausoleum halls"))
                            (ai_set_orders "marines" "marines_maus_halls")
                        )
                    ) (if (= (version) 5) 
                        (begin
                            (begin
                                (if debug 
                                    (print "migrate into mausoleum room bridge"))
                                (ai_set_orders "marines" "marines_maus_room_bridge")
                            )
                        ) )
                )
                g_marine_mig_maus_int
            )
        )
        (sleep 30)
        (if debug 
            (print "migrate into mausoleum interior"))
        (ai_set_orders "marines" "marines_maus_int")
    )
)

(script dormant void grand_b_door
    (begin
        (sleep_until 
            (begin
                (if (= (version) 2) 
                    (begin
                        (device_operates_automatically_set "grand_b_door" true)
                    ) (if (= (version) 3) 
                        (begin
                            (device_operates_automatically_set "grand_b_door" false)
                        ) )
                )
                false
            ) 
        1)
    )
)

(script command_script void cs_council_grunt_a
    (begin
        (cs_movement_mode 3)
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to council/p0)
        (sleep_until 
            (or
                (volume_test_objects "tv_council_door_right_a" (players))
                (<= (ai_living_count "council_brute_ini") 0)
            )
        )
    )
)

(script command_script void cs_council_grunt_b
    (begin
        (cs_movement_mode 3)
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to council/p1)
        (sleep_until 
            (or
                (volume_test_objects "tv_council_door_right_b" (players))
                (<= (ai_living_count "council_brute_ini") 0)
            )
        )
    )
)

(script command_script void cs_council_grunt_c
    (begin
        (cs_movement_mode 3)
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to council/p2)
        (sleep_until 
            (or
                (volume_test_objects "tv_council_door_left_a" (players))
                (<= (ai_living_count "council_brute_ini") 0)
            )
        )
    )
)

(script command_script void cs_council_grunt_d
    (begin
        (cs_movement_mode 3)
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to council/p3)
        (sleep_until 
            (or
                (volume_test_objects "tv_council_door_left_b" (players))
                (<= (ai_living_count "council_brute_ini") 0)
            )
        )
    )
)

(script dormant void ai_council_brutes_berserk
    (begin
        (sleep_until (<= (ai_living_count "council_brute_ini") 1) 1)
        (if (> (ai_living_count "council_brute_ini") 0) 
            (begin
                (ai_set_orders "council_brute_ini" "council_floor_all")
                (ai_berserk "council_brute_ini" true)
                (sleep_until g_council_initial)
                (wake sc_brutes_berserk)
            )
        )
    )
)

(script static void ai_council_left_a
    (begin
        (if 
            (and
                (not (volume_test_objects "tv_council_door_left_a" (players)))
                (= (device_get_position "council_door_left_a") 0.0)
            ) 
                (begin
                    (if debug 
                        (print "left a"))
                    (ai_place "council_lt_brute_a")
                    (ai_place "council_lt_grunt_a")
                    (set g_council_count (+ g_council_count 1.0))
                    (if (= g_council_count g_council_limit) 
                        (set g_council_wave false))
                )
        )
    )
)

(script static void ai_council_left_b
    (begin
        (if 
            (and
                (not (volume_test_objects "tv_council_door_left_b" (players)))
                (= (device_get_position "council_door_left_b") 0.0)
            ) 
                (begin
                    (if debug 
                        (print "left b"))
                    (ai_place "council_lt_brute_b")
                    (ai_place "council_lt_grunt_b")
                    (set g_council_count (+ g_council_count 1.0))
                    (if (= g_council_count g_council_limit) 
                        (set g_council_wave false))
                )
        )
    )
)

(script static void ai_council_left_c
    (begin
        (if 
            (and
                (not (volume_test_objects "tv_council_door_left_c" (players)))
                (= (device_get_position "council_door_left_c") 0.0)
            ) 
                (begin
                    (if debug 
                        (print "left c"))
                    (ai_place "council_lt_brute_c")
                    (ai_place "council_lt_grunt_c")
                    (set g_council_count (+ g_council_count 1.0))
                    (if (= g_council_count g_council_limit) 
                        (set g_council_wave false))
                )
        )
    )
)

(script static void ai_council_right_a
    (begin
        (if 
            (and
                (not (volume_test_objects "tv_council_door_right_a" (players)))
                (= (device_get_position "council_door_right_a") 0.0)
            ) 
                (begin
                    (if debug 
                        (print "right a"))
                    (ai_place "council_rt_brute_a")
                    (ai_place "council_rt_grunt_a")
                    (set g_council_count (+ g_council_count 1.0))
                    (if (= g_council_count g_council_limit) 
                        (set g_council_wave false))
                )
        )
    )
)

(script static void ai_council_right_b
    (begin
        (if 
            (and
                (not (volume_test_objects "tv_council_door_right_b" (players)))
                (= (device_get_position "council_door_right_b") 0.0)
            ) 
                (begin
                    (if debug 
                        (print "right b"))
                    (ai_place "council_rt_brute_b")
                    (ai_place "council_rt_grunt_b")
                    (set g_council_count (+ g_council_count 1.0))
                    (if (= g_council_count g_council_limit) 
                        (set g_council_wave false))
                )
        )
    )
)

(script static void ai_council_right_c
    (begin
        (if 
            (and
                (not (volume_test_objects "tv_council_door_right_c" (players)))
                (= (device_get_position "council_door_right_c") 0.0)
            ) 
                (begin
                    (if debug 
                        (print "right c"))
                    (ai_place "council_rt_brute_c")
                    (ai_place "council_rt_grunt_c")
                    (set g_council_count (+ g_council_count 1.0))
                    (if (= g_council_count g_council_limit) 
                        (set g_council_wave false))
                )
        )
    )
)

(script static void ai_council_rt_fr
    (begin
        (if debug 
            (print "right front"))
        (begin_random
            (if g_council_wave 
                (ai_council_left_a))
            (if g_council_wave 
                (ai_council_left_b))
            (if g_council_wave 
                (ai_council_right_c))
        )
    )
)

(script static void ai_council_rt_bk
    (begin
        (if debug 
            (print "right back"))
        (begin_random
            (if g_council_wave 
                (ai_council_left_b))
            (if g_council_wave 
                (ai_council_left_c))
            (if g_council_wave 
                (ai_council_right_a))
        )
    )
)

(script static void ai_council_lt_fr
    (begin
        (if debug 
            (print "left front"))
        (begin_random
            (if g_council_wave 
                (ai_council_left_c))
            (if g_council_wave 
                (ai_council_right_a))
            (if g_council_wave 
                (ai_council_right_b))
        )
    )
)

(script static void ai_council_lt_bk
    (begin
        (if debug 
            (print "left back"))
        (begin_random
            (if g_council_wave 
                (ai_council_left_a))
            (if g_council_wave 
                (ai_council_right_b))
            (if g_council_wave 
                (ai_council_right_c))
        )
    )
)

(script static void ai_council_fr
    (begin
        (if debug 
            (print "front"))
        (begin_random
            (if g_council_wave 
                (ai_council_left_a))
            (if g_council_wave 
                (ai_council_right_a))
        )
    )
)

(script static void ai_council_bk
    (begin
        (if debug 
            (print "back"))
        (begin_random
            (if g_council_wave 
                (ai_council_left_c))
            (if g_council_wave 
                (ai_council_right_c))
        )
    )
)

(script dormant void ai_council_orders
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_council_rt_fr" (players)) 
                    (begin
                        (ai_set_orders "council_prophets_floor" "council_rt_fr")
                    ) (if (volume_test_objects "tv_council_rt_bk" (players)) 
                        (begin
                            (ai_set_orders "council_prophets_floor" "council_rt_bk")
                        ) (if (volume_test_objects "tv_council_lt_fr" (players)) 
                            (begin
                                (ai_set_orders "council_prophets_floor" "council_lt_fr")
                            ) (if (volume_test_objects "tv_council_lt_bk" (players)) 
                                (begin
                                    (ai_set_orders "council_prophets_floor" "council_lt_bk")
                                ) )
                        )
                    )
                )
                g_council_orders
            )
        )
    )
)

(script dormant void ai_council_upper_migrate
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "council_prophets_floor") 0)
                (<= (ai_strength "council_prophets_upper") 0.4)
            ) 
        30 (* 30.0 40.0))
        (sleep 30)
        (ai_migrate "council_prophets_upper" "council_rt_brute_a")
    )
)

(script dormant void ai_council_upper
    (begin
        (sleep_until (<= (ai_living_count "council_prophets") 2))
        (sleep 120)
        (begin_random
            (if g_council_upper 
                (begin
                    (ai_place "council_rt_upper_brute_a")
                    (set g_council_upper_count (+ g_council_upper_count 1.0))
                    (if (= g_council_upper_count g_council_upper_limit) 
                        (set g_council_upper false))
                )
            )
            (if g_council_upper 
                (begin
                    (ai_place "council_rt_upper_brute_b")
                    (set g_council_upper_count (+ g_council_upper_count 1.0))
                    (if (= g_council_upper_count g_council_upper_limit) 
                        (set g_council_upper false))
                )
            )
            (if g_council_upper 
                (begin
                    (ai_place "council_rt_upper_brute_c")
                    (set g_council_upper_count (+ g_council_upper_count 1.0))
                    (if (= g_council_upper_count g_council_upper_limit) 
                        (set g_council_upper false))
                )
            )
            (if g_council_upper 
                (begin
                    (ai_place "council_lt_upper_brute_a")
                    (set g_council_upper_count (+ g_council_upper_count 1.0))
                    (if (= g_council_upper_count g_council_upper_limit) 
                        (set g_council_upper false))
                )
            )
            (if g_council_upper 
                (begin
                    (ai_place "council_lt_upper_brute_b")
                    (set g_council_upper_count (+ g_council_upper_count 1.0))
                    (if (= g_council_upper_count g_council_upper_limit) 
                        (set g_council_upper false))
                )
            )
            (if g_council_upper 
                (begin
                    (ai_place "council_lt_upper_brute_c")
                    (set g_council_upper_count (+ g_council_upper_count 1.0))
                    (if (= g_council_upper_count g_council_upper_limit) 
                        (set g_council_upper false))
                )
            )
        )
        (wake ai_council_upper_migrate)
    )
)

(script dormant void ai_council_floor_spawn
    (begin
        (set g_council_wave true)
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_council_floor_wave_limit 1)
                    (set g_council_limit 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_council_floor_wave_limit 1)
                        (set g_council_limit 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_council_floor_wave_limit 2)
                            (set g_council_limit 2)
                        )
                    ) )
            )
        )
        (if (difficulty_normal) 
            (begin
                (set g_council_upper_limit 1)
            ) (if (difficulty_heroic) 
                (begin
                    (set g_council_upper_limit 2)
                ) (if (difficulty_legendary) 
                    (begin
                        (set g_council_upper_limit 2)
                    ) )
            )
        )
        (data_mine_insert "enc_council_wave_1")
        (sc_council_mid)
        (game_save_no_timeout)
        (sleep 120)
        (sleep_until 
            (begin
                (sleep_until (<= (ai_living_count "council_prophets_floor") 0))
                (game_save_no_timeout)
                (sleep (random_range sleep_lower_bound sleep_upper_bound))
                (if debug 
                    (print "begin wave 1"))
                (set g_council_wave true)
                (set g_council_count 0)
                (if (volume_test_objects "tv_council_fr" (players)) 
                    (begin
                        (ai_council_fr)
                    ) (if (volume_test_objects "tv_council_rt_fr" (players)) 
                        (begin
                            (ai_council_rt_fr)
                        ) (if (volume_test_objects "tv_council_rt_bk" (players)) 
                            (begin
                                (ai_council_rt_bk)
                            ) (if (volume_test_objects "tv_council_lt_fr" (players)) 
                                (begin
                                    (ai_council_lt_fr)
                                ) (if (volume_test_objects "tv_council_lt_bk" (players)) 
                                    (begin
                                        (ai_council_lt_bk)
                                    ) (if (volume_test_objects "tv_council_bk" (players)) 
                                        (begin
                                            (ai_council_bk)
                                        ) )
                                )
                            )
                        )
                    )
                )
                (set g_council_floor_wave_count (+ g_council_floor_wave_count 1.0))
                (if (= g_council_floor_wave_count g_council_floor_wave_limit) 
                    (set g_council_floor_wave true))
                g_council_floor_wave
            )
        )
        (if debug 
            (print "wave 1 over"))
        (set g_council_floor_wave false)
        (set g_council_floor_wave_count 0)
        (sleep_until (<= (ai_living_count "council_prophets_floor") 0))
        (sleep 150)
        (data_mine_insert "enc_council_pedestal")
        (game_save_no_timeout)
        (sleep 15)
        (if debug 
            (print "pedestal, sides and upper"))
        (ai_place "council_brute_ped/a")
        (ai_place "council_brute_ped/b")
        (if (difficulty_legendary) 
            (begin
                (ai_place "council_brute_ped/chief")
                (wake sc_ledge_chieftan)
            )
        )
        (if 
            (or
                (difficulty_heroic)
                (difficulty_legendary)
            ) 
                (begin
                    (ai_place "council_rt_grunt_c" 1)
                    (ai_place "council_lt_grunt_c" 1)
                )
        )
        (if (difficulty_legendary) 
            (begin
                (ai_place "council_rt_grunt_b" 1)
                (ai_place "council_lt_grunt_b" 1)
            )
        )
        (sleep 30)
        (wake ai_council_upper)
        (sleep 30)
        (device_set_position "council_ped" 0.0)
        (sleep 5)
        (if 
            (or
                (difficulty_heroic)
                (difficulty_legendary)
            ) 
                (sleep_until 
                    (begin
                        (sleep_until (<= (ai_living_count "council_prophets") 0))
                        (game_save_no_timeout)
                        (data_mine_insert "enc_council_wave_2")
                        (sleep (random_range sleep_lower_bound sleep_upper_bound))
                        (if debug 
                            (print "begin wave 2"))
                        (set g_council_wave true)
                        (set g_council_count 0)
                        (if (volume_test_objects "tv_council_fr" (players)) 
                            (begin
                                (ai_council_fr)
                            ) (if (volume_test_objects "tv_council_rt_fr" (players)) 
                                (begin
                                    (ai_council_rt_fr)
                                ) (if (volume_test_objects "tv_council_rt_bk" (players)) 
                                    (begin
                                        (ai_council_rt_bk)
                                    ) (if (volume_test_objects "tv_council_lt_fr" (players)) 
                                        (begin
                                            (ai_council_lt_fr)
                                        ) (if (volume_test_objects "tv_council_lt_bk" (players)) 
                                            (begin
                                                (ai_council_lt_bk)
                                            ) (if (volume_test_objects "tv_council_bk" (players)) 
                                                (begin
                                                    (ai_council_bk)
                                                ) )
                                        )
                                    )
                                )
                            )
                        )
                        (set g_council_floor_wave_count (+ g_council_floor_wave_count 1.0))
                        (if (= g_council_floor_wave_count g_council_floor_wave_limit) 
                            (set g_council_floor_wave true))
                        g_council_floor_wave
                    )
                ))
        (print "wave 2 over")
        (set g_council_floor_wave false)
        (set g_council_over true)
    )
)

(script command_script void cs_grand_a_grunt_a
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to grand_a/p0 2.0)
                        (sleep (random_range 0 15))
                    )
                    (begin
                        (cs_go_to grand_a/p1 2.0)
                        (sleep (random_range 0 15))
                    )
                    (begin
                        (cs_go_to grand_a/p2 2.0)
                        (sleep (random_range 0 15))
                    )
                    (begin
                        (cs_go_to grand_a/p3 2.0)
                        (sleep (random_range 0 15))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_grand_a_grunt_b
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to grand_a/p4 2.0)
                        (sleep (random_range 0 15))
                    )
                    (begin
                        (cs_go_to grand_a/p5 2.0)
                        (sleep (random_range 0 15))
                    )
                    (begin
                        (cs_go_to grand_a/p6 2.0)
                        (sleep (random_range 0 15))
                    )
                    (begin
                        (cs_go_to grand_a/p7 2.0)
                        (sleep (random_range 0 15))
                    )
                )
                false
            )
        )
    )
)

(script dormant void create_ledge_columns
    (begin
        (begin_random
            (begin
                (object_create "ledge_col_a")
                (sleep (random_range 45 90))
            )
            (begin
                (object_create "ledge_col_b")
                (sleep (random_range 45 90))
            )
            (begin
                (object_create "ledge_col_c")
                (sleep (random_range 45 90))
            )
            (begin
                (object_create "ledge_col_d")
                (sleep (random_range 45 90))
            )
            (begin
                (object_create "ledge_col_e")
                (sleep (random_range 45 90))
            )
            (begin
                (object_create "ledge_col_f")
                (sleep (random_range 45 90))
            )
        )
    )
)

(script command_script void cs_ledge_jackals_lt
    (begin
        (cs_abort_on_alert true)
        (sleep_until 
            (begin
                (cs_go_to dervish_ledge/lt_0)
                (cs_go_to dervish_ledge/lt_1)
                false
            )
        )
    )
)

(script command_script void cs_ledge_jackals_rt
    (begin
        (cs_abort_on_alert true)
        (sleep_until 
            (begin
                (cs_go_to dervish_ledge/rt_0)
                (cs_go_to dervish_ledge/rt_1)
                false
            )
        )
    )
)

(script command_script void cs_ledge_brute_a
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_go_to dervish_ledge/b1_2)
    )
)

(script command_script void cs_ledge_brute_b
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_go_to dervish_ledge/b2_2)
    )
)

(script command_script void cs_lift_jump
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to dervish_ledge/p0)
        (cs_jump_to_point 0.0 5.0)
    )
)

(script static void ledge_fr_orders
    (begin
        (ai_set_orders "ledge_lift_brute_rt" "ledge_rt_fr")
        (ai_set_orders "ledge_lift_brute_lt" "ledge_lt_fr")
        (ai_set_orders "ledge_lift_grunt_rt" "ledge_minor_rt_fr")
        (ai_set_orders "ledge_lift_grunt_lt" "ledge_minor_lt_fr")
        (ai_set_orders "ledge_jackal_right" "ledge_minor_rt_fr")
        (ai_set_orders "ledge_jackal_left" "ledge_minor_lt_fr")
        (ai_set_orders "ledge_lift_chieftan" "ledge_chieftan")
    )
)

(script static void ledge_bk_orders
    (begin
        (ai_set_orders "ledge_lift_brute_rt" "ledge_rt_bk")
        (ai_set_orders "ledge_lift_brute_lt" "ledge_lt_bk")
        (ai_set_orders "ledge_lift_grunt_rt" "ledge_minor_rt_bk")
        (ai_set_orders "ledge_lift_grunt_lt" "ledge_minor_lt_bk")
        (ai_set_orders "ledge_jackal_right" "ledge_minor_rt_bk")
        (ai_set_orders "ledge_jackal_left" "ledge_minor_lt_bk")
        (ai_set_orders "ledge_lift_chieftan" "ledge_chieftan_lift")
    )
)

(script dormant void ai_dervish_ledge_orders
    (begin
        (sleep_until (>= (ai_combat_status "dervish_ledge_prophets") ai_combat_status_active))
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_dervish_ledge_fr" (players)) 
                    (begin
                        (begin
                            (sleep (random_range 5 30))
                            (ledge_fr_orders)
                        )
                    ) (if (volume_test_objects "tv_dervish_ledge_bk" (players)) 
                        (begin
                            (begin
                                (sleep (random_range 5 30))
                                (ledge_bk_orders)
                            )
                        ) (if (volume_test_objects "tv_dervish_ledge_lift" (players)) 
                            (begin
                                (begin
                                    (sleep (random_range 5 30))
                                    (ledge_bk_orders)
                                )
                            ) )
                    )
                )
                g_dervish_ledge_orders
            )
        )
    )
)

(script command_script void cs_ledge_turrets_left
    (begin
        (cs_enable_pathfinding_failsafe true)
        (if (not g_ledge_turret_left) 
            (begin
                (set g_ledge_turret_left true)
                (cs_go_to dervish_ledge_turret/deploy_p2)
                (cs_deploy_turret dervish_ledge_turret/deploy_p2)
            ) (begin
                (cs_go_to dervish_ledge_turret/deploy_p3)
                (cs_deploy_turret dervish_ledge_turret/deploy_p3)
            )
        )
    )
)

(script command_script void cs_ledge_turrets_right
    (begin
        (cs_enable_pathfinding_failsafe true)
        (if (not g_ledge_turret_right) 
            (begin
                (set g_ledge_turret_right true)
                (cs_go_to dervish_ledge_turret/deploy_p0)
                (cs_deploy_turret dervish_ledge_turret/deploy_p0)
            ) (begin
                (cs_go_to dervish_ledge_turret/deploy_p1)
                (cs_deploy_turret dervish_ledge_turret/deploy_p1)
            )
        )
    )
)

(script dormant void ai_ledge_lift
    (begin
        (ai_place "ledge_lift_grunt_lt" 2)
        (ai_place "ledge_lift_grunt_rt")
        (sleep 120)
        (if 
            (and
                (<= (ai_living_count "dervish_ledge_prophets") 5)
                (or
                    (difficulty_heroic)
                    (difficulty_legendary)
                )
                (not (volume_test_objects "tv_dervish_ledge_lift" (players)))
            ) 
                (begin
                    (ai_place "ledge_lift_grunt_lt")
                    (ai_place "ledge_lift_grunt_rt" 2)
                )
        )
        (sleep 150)
        (sleep_until (<= (ai_living_count "dervish_ledge_prophets") 6))
        (if 
            (or
                (difficulty_heroic)
                (difficulty_legendary)
            ) 
                (begin
                    (ai_place "ledge_lift_brute_lt")
                    (ai_place "ledge_lift_brute_rt")
                )
        )
        (ai_place "ledge_lift_chieftan")
        (sleep_until 
            (and
                (objects_can_see_object (players) (ai_get_object "ledge_lift_chieftan") 45.0)
                (volume_test_objects "tv_dervish_ledge_lift" (ai_get_object "ledge_lift_chieftan"))
            ) 
        30 (* 30.0 20.0))
        (wake sc_ledge_chieftan)
        (set g_music_07a_01 false)
    )
)

(script dormant void ai_ledge_lower
    (begin
        (ai_place "ledge_bot_grunts")
        (ai_place "ledge_bot_jackals")
    )
)

(script command_script void cs_hall_a_jackal_ini_a
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_looking true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to hall_a/jackal_patrol_p0 1.0)
        (cs_look true hall_a/look_p0)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_hall_a_jackal_patrol" (players)))
                (<= (device_get_position "hall_a_jackal_door") 0.0)
            ) 
        5)
        (if (not g_corridor_a_active) 
            (ai_erase ai_current_actor))
    )
)

(script command_script void cs_hall_a_jackal_ini_b
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_looking true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to hall_a/jackal_patrol_p1 1.0)
        (cs_look true hall_a/look_p0)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_hall_a_jackal_patrol" (players)))
                (<= (device_get_position "hall_a_jackal_door") 0.0)
            ) 
        5)
        (if (not g_corridor_a_active) 
            (ai_erase ai_current_actor))
    )
)

(script command_script void cs_hall_a_jackal_ini_c
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_looking true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to hall_a/jackal_patrol_p2 1.0)
        (cs_look true hall_a/look_p0)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_hall_a_jackal_patrol" (players)))
                (<= (device_get_position "hall_a_jackal_door") 0.0)
            ) 
        5)
        (if (not g_corridor_a_active) 
            (ai_erase ai_current_actor))
    )
)

(script command_script void cs_hall_a_brute_ini
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to hall_a/b_p0 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_a/b_p1 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_a/b_p2 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_a/b_p3 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_a/b_p4 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_look true hall_a/look_p0)
                        (sleep (random_range 45 90))
                        (cs_look false hall_a/look_p0)
                    )
                    (begin
                        (cs_look true hall_a/look_p1)
                        (sleep (random_range 45 90))
                        (cs_look false hall_a/look_p1)
                    )
                    (begin
                        (cs_look true hall_a/look_p2)
                        (sleep (random_range 45 90))
                        (cs_look false hall_a/look_p2)
                    )
                    (begin
                        (cs_look true hall_a/look_p3)
                        (sleep (random_range 45 90))
                        (cs_look false hall_a/look_p3)
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_hall_a_jackal_ini
    (begin
        (cs_abort_on_combat_status ai_combat_status_certain)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to hall_a/j_p0 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_a/j_p1 1.0)
                        (begin_random
                            (begin
                                (cs_look true hall_a/look_p0)
                                (sleep (random_range 60 90))
                            )
                            (begin
                                (cs_look true hall_a/look_p2)
                                (sleep (random_range 60 90))
                            )
                        )
                    )
                    (begin
                        (cs_go_to hall_a/j_p2 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_a/j_p3 1.0)
                        (begin_random
                            (begin
                                (cs_look true hall_a/look_p1)
                                (sleep (random_range 60 90))
                            )
                            (begin
                                (cs_look true hall_a/look_p3)
                                (sleep (random_range 60 90))
                            )
                        )
                    )
                    (begin
                        (cs_go_to hall_a/j_p4 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_a/j_p5 1.0)
                        (begin_random
                            (begin
                                (cs_look true hall_a/look_p0)
                                (sleep (random_range 60 90))
                            )
                            (begin
                                (cs_look true hall_a/look_p3)
                                (sleep (random_range 60 90))
                            )
                        )
                    )
                    (begin
                        (cs_go_to hall_a/j_p6 1.0)
                        (sleep (random_range 0 45))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_hall_b_jackal_a
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_looking true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to hall_b/jackal_p0 1.0)
        (cs_look true hall_a/look_p0)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_hall_b_jackal" (players)))
                (<= (device_get_position "hall_b_jackal_door") 0.0)
            ) 
        5)
        (device_one_sided_set "hall_b_jackal_door" true)
    )
)

(script command_script void cs_hall_b_jackal_b
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_looking true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to hall_b/jackal_p1 1.0)
        (cs_look true hall_a/look_p0)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_hall_b_jackal" (players)))
                (<= (device_get_position "hall_b_jackal_door") 0.0)
            ) 
        5)
        (device_one_sided_set "hall_b_jackal_door" true)
    )
)

(script command_script void cs_hall_b_brutes
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to hall_b/p0 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_b/p1 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_b/p2 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_b/p3 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to hall_b/p4 1.0)
                        (sleep (random_range 0 45))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_hall_b_wake_grunts
    (begin
        (if g_corridor_a_active 
            (cs_force_combat_status ai_combat_status_alert))
    )
)

(script command_script void cs_room_a_brute_ini
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to room_a/p0 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to room_a/p1 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_look true room_a/look_p0)
                        (sleep (random_range 45 90))
                        (cs_look false room_a/look_p0)
                    )
                    (begin
                        (cs_look true room_a/look_p1)
                        (sleep (random_range 45 90))
                        (cs_look false hall_a/look_p1)
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_room_a_jackal_ini
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to room_a/p4 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_go_to room_a/p5 1.0)
                        (sleep (random_range 0 45))
                    )
                    (begin
                        (cs_look true room_a/look_p0)
                        (sleep (random_range 45 90))
                    )
                    (begin
                        (cs_look true room_a/look_p1)
                        (sleep (random_range 45 90))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_room_a_brutes_bk
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_look true room_a/look_p0)
                        (sleep (random_range 90 150))
                    )
                    (begin
                        (cs_look true room_a/look_p2)
                        (sleep (random_range 90 150))
                    )
                    (begin
                        (cs_look true room_a/look_p3)
                        (sleep (random_range 90 150))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_room_a_to_jail
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to room_a/stand_p0)
        (cs_move_in_direction 0.0 1.0 180.0)
    )
)

(script dormant void room_a_door
    (begin
        (sleep_until (> (device_get_position "room_a_door") 0.0) 5)
        (set g_room_a_door true)
        (if debug 
            (print "room a door opened"))
    )
)

(script dormant void corridor_a_activate
    (begin
        (sleep_until (>= (ai_combat_status "hall_a_prophets") ai_combat_status_active))
        (set g_corridor_a_active true)
        (if debug 
            (print "corridor a prophets active"))
    )
)

(script dormant void ai_hall_a_prophets
    (begin
        (if debug 
            (print "hall a initial prophets"))
        (ai_place "hall_a_jackal_patrol_ini")
        (ai_place "hall_a_brute_ini")
        (ai_place "hall_a_jackal_ini")
        (sleep_until 
            (or
                (<= (ai_living_count "hall_a_prophets") 1)
                (volume_test_objects "tv_hall_a_bk" (players))
            )
        )
        (game_save_no_timeout)
        (if g_corridor_a_active 
            (begin
                (if debug 
                    (print "hall a reinforcements"))
                (ai_place "hall_a_brute_rein")
                (ai_place "hall_a_grunt_rein" (pin (- 6.0 (ai_living_count "hall_a_prophets")) 0.0 2.0))
                (sleep 1)
                (ai_place "hall_a_brute_rein_bk")
                (ai_place "hall_a_grunt_rein_bk" (pin (- 6.0 (ai_living_count "hall_a_prophets")) 0.0 2.0))
            )
        )
    )
)

(script dormant void ai_room_a
    (begin
        (ai_place "room_a_brutes_ini")
        (ai_place "room_a_jackals_ini")
        (ai_place "room_a_brutes_bk")
        (sleep_until 
            (or
                (volume_test_objects "tv_room_a_mid" (players))
                (and
                    (<= (ai_living_count "room_a_prophets") 2)
                    (>= (ai_combat_status "room_a_prophets") ai_combat_status_active)
                )
            )
        )
        (if 
            (and
                (>= (ai_combat_status "room_a_prophets") ai_combat_status_active)
                (<= (ai_living_count "room_a_prophets") 2)
            ) 
                (begin
                    (ai_place "room_a_brutes_a")
                    (ai_place "room_a_brutes_c")
                    (sleep 1)
                    (ai_place "room_a_grunts_a" (pin (- 4.0 (ai_living_count "room_a_prophets")) 0.0 2.0))
                    (ai_place "room_a_grunts_c" (pin (- 4.0 (ai_living_count "room_a_prophets")) 0.0 2.0))
                )
        )
        (sleep_until (volume_test_objects "tv_room_a_bk" (players)))
        (if 
            (and
                (>= (ai_combat_status "room_a_prophets") ai_combat_status_active)
                (<= (ai_living_count "room_a_prophets") 4)
            ) 
                (begin
                    (ai_place "room_a_brutes_b")
                    (ai_place "room_a_grunts_b" (pin (- 4.0 (ai_living_count "room_a_prophets")) 0.0 2.0))
                )
        )
    )
)

(script static void test_room_a_to_jail
    (begin
        (wake sc_room_a_down)
        (ai_place "room_a_brutes_ini")
        (ai_place "room_a_jackals_ini")
        (ai_place "room_a_brutes_bk")
        (sleep 150)
        (cs_run_command_script "room_a_prophets" cs_room_a_to_jail)
    )
)

(script command_script void cs_ignore_jail_a_marines
    (begin
        (cs_abort_on_damage false)
        (ai_disregard (ai_actors "jail_a_marines") true)
        (cs_look_player true)
        (sleep_until g_jail_a_free)
    )
)

(script command_script void cs_ignore_jail_b_marines
    (begin
        (cs_abort_on_damage false)
        (ai_disregard (ai_actors "jail_b_marines") true)
        (cs_look_player true)
        (sleep_until g_jail_b_free)
    )
)

(script command_script void cs_jail_jackal_ini_a
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jail_jackal_patrol/p0 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p1 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p2 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_jail_jackal_ini_b
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jail_jackal_patrol/p3 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p4 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p5 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_jail_jackal_ini_c
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jail_jackal_patrol/p6 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p7 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p8 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_jail_jackal_ini_d
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jail_jackal_patrol/p9 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p10 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p11 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_jail_jackal_ini_e
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jail_jackal_patrol/p12 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p13 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p14 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_jail_jackal_ini_f
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jail_jackal_patrol/p15 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p16 1.0)
                (sleep (random_range 0 15))
                (cs_go_to jail_jackal_patrol/p17 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_cell_a_jackal_a
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jails/jail_a_p0 1.0)
                (sleep (random_range 5 45))
                (cs_go_to jails/jail_a_p1 1.0)
                (sleep (random_range 5 45))
                false
            )
        )
    )
)

(script command_script void cs_cell_a_jackal_b
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jails/jail_a_p2 1.0)
                (sleep (random_range 5 45))
                (cs_go_to jails/jail_a_p3 1.0)
                (sleep (random_range 5 45))
                false
            )
        )
    )
)

(script command_script void cs_cell_a_brute
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jails/jail_a_p4 1.0)
                (sleep (random_range 5 10))
                (cs_go_to jails/jail_a_p5 1.0)
                (sleep (random_range 5 10))
                false
            )
        )
    )
)

(script command_script void cs_cell_b_brute
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to jails/jail_b_p0 1.0)
                (sleep (random_range 5 10))
                (cs_go_to jails/jail_b_p1 1.0)
                (sleep (random_range 5 10))
                false
            )
        )
    )
)

(script command_script void cs_jail_a_marine_a
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_go_to jails/jail_a_plasma_rifle)
        (sleep 5)
        (cs_custom_animation "objects\characters\marine\marine" "combat:rifle:idle:2:crouch:idle" 0.0 true)
        (sleep 15)
        (unit_add_equipment (ai_get_unit ai_current_actor) "jail_a_a" true true)
        (object_destroy "jail_a_plasma_rifle")
        (sleep 15)
        (cs_stop_custom_animation)
    )
)

(script command_script void cs_jail_a_marine_b
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to jails/jail_a_needler)
        (sleep 5)
        (cs_custom_animation "objects\characters\marine\marine" "combat:rifle:idle:2:crouch:idle" 0.0 true)
        (sleep 15)
        (unit_add_equipment (ai_get_unit ai_current_actor) "jail_a_b" true true)
        (object_destroy "jail_a_needler")
        (sleep 15)
        (cs_stop_custom_animation)
    )
)

(script command_script void cs_jail_b_marine_a
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to jails/jail_b_carbine)
        (sleep 5)
        (cs_custom_animation "objects\characters\marine\marine" "combat:rifle:idle:2:crouch:idle" 0.0 true)
        (sleep 15)
        (unit_add_equipment (ai_get_unit ai_current_actor) "jail_b_a" true true)
        (object_destroy "jail_b_carbine")
        (sleep 15)
        (cs_stop_custom_animation)
    )
)

(script command_script void cs_jail_b_marine_b
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to jails/jail_b_plasma_rifle)
        (sleep 5)
        (cs_custom_animation "objects\characters\marine\marine" "combat:rifle:idle:2:crouch:idle" 0.0 true)
        (sleep 15)
        (unit_add_equipment (ai_get_unit ai_current_actor) "jail_b_b" true true)
        (object_destroy "jail_b_plasma_rifle")
        (sleep 15)
        (cs_stop_custom_animation)
    )
)

(script command_script void cs_jail_b_marine_c
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to jails/jail_b_plasma_pistol)
        (sleep 5)
        (cs_custom_animation "objects\characters\marine\marine" "combat:rifle:idle:2:crouch:idle" 0.0 true)
        (sleep 15)
        (unit_add_equipment (ai_get_unit ai_current_actor) "jail_b_c" true true)
        (object_destroy "jail_b_plasma_pistol")
        (sleep 15)
        (cs_stop_custom_animation)
    )
)

(script dormant void ai_cell_a_guards
    (begin
        (if debug 
            (print "cell a guards"))
        (ai_place "jail_guard_brute_cell_a")
        (ai_place "jail_guard_jackal_cell_a")
        (sleep 1)
        (if g_jail_prophets_ini_active 
            (ai_set_orders "jail_cell_outer_guards_a" "jail_guard_alert_cell_a"))
    )
)

(script dormant void ai_cell_b_guards
    (begin
        (if debug 
            (print "cell b guards"))
        (ai_place "jail_guard_brute_cell_b")
        (ai_place "jail_guard_jackal_cell_b")
        (sleep 1)
        (if g_jail_prophets_ini_active 
            (ai_set_orders "jail_cell_outer_guards_b" "jail_guard_alert_cell_b"))
    )
)

(script command_script void cs_lift_grunt_a
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to jail_turret/p0)
        (cs_deploy_turret jail_turret/p0)
    )
)

(script command_script void cs_lift_grunt_b
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to jail_turret/p1)
        (cs_deploy_turret jail_turret/p1)
    )
)

(script dormant void jail_a_doors
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_jail/p")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "jail_ped_p" "effect")
        (sleep_until jail_a_doors_open)
        (ai_disregard (ai_actors "jail_a_marines") false)
        (ai_set_orders "jail_a_marines" "jail_marines_mid")
        (set g_jail_a_free true)
        (sleep 15)
        (cs_run_command_script "jail_a_marines/a" cs_jail_a_marine_a)
        (cs_run_command_script "jail_a_marines/b" cs_jail_a_marine_b)
        (if 
            (or
                g_jail_a_finished
                g_jail_b_finished
            ) 
                (wake sc_second_cell) (wake sc_first_cell))
        (sleep_until (not (volume_test_objects_all "tv_cell_a" (players))))
        (sleep 90)
        (set g_jail_a_finished true)
    )
)

(script dormant void jail_b_doors
    (begin
        (erase_cortana)
        (sleep 1)
        (ai_place "cortana_jail/q")
        (sleep 5)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "jail_ped_q" "effect")
        (sleep_until jail_b_doors_open)
        (ai_disregard (ai_actors "jail_b_marines") false)
        (ai_set_orders "jail_b_marines" "jail_marines_bot")
        (set g_jail_b_free true)
        (sleep 15)
        (cs_run_command_script "jail_b_marines/a" cs_jail_b_marine_a)
        (cs_run_command_script "jail_b_marines/b" cs_jail_b_marine_b)
        (cs_run_command_script "jail_b_marines/c" cs_jail_b_marine_c)
        (if 
            (or
                g_jail_a_finished
                g_jail_b_finished
            ) 
                (wake sc_second_cell) (wake sc_first_cell))
        (sleep_until (not (volume_test_objects_all "tv_cell_b" (players))))
        (sleep 60)
        (set g_jail_b_finished true)
    )
)

(script dormant void cor_open_a
    (begin
        (sleep_until (<= (ai_living_count "cell_a_prophets") 0))
        (sleep 60)
        (begin_random
            (begin
                (device_group_set "jail_a_door_b" "jail_a_group_a" 1.0)
                (sleep (random_range 5 15))
            )
            (begin
                (device_group_set "jail_a_door_a" "jail_a_group_b" 1.0)
                (sleep (random_range 5 15))
            )
            (begin
                (device_group_set "jail_a_door_c" "jail_a_group_c" 1.0)
                (sleep (random_range 5 15))
            )
        )
        (set jail_a_doors_open true)
    )
)

(script dormant void cor_open_b
    (begin
        (sleep_until (<= (ai_living_count "cell_b_prophets") 0))
        (sleep 60)
        (begin_random
            (begin
                (device_group_set "jail_b_door_c" "jail_b_group_a" 1.0)
                (sleep (random_range 5 15))
            )
            (begin
                (device_group_set "jail_b_door_b" "jail_b_group_b" 1.0)
                (sleep (random_range 5 15))
            )
            (begin
                (device_group_set "jail_b_door_a" "jail_b_group_c" 1.0)
                (sleep (random_range 5 15))
            )
        )
        (set jail_b_doors_open true)
    )
)

(script dormant void ai_jail_a
    (begin
        (data_mine_insert "enc_jail_cell_a")
        (game_save_no_timeout)
        (sleep 60)
        (wake sc_cell_a_ent)
        (wake ai_cell_a_guards)
        (sleep 15)
        (sleep_until (volume_test_objects "tv_jail_a_ent" (players)) 1)
        (ai_place "jail_a_marines")
        (ai_place "jail_a_brute")
        (ai_place "jail_a_jackals")
        (sleep 30)
        (wake cor_open_a)
        (wake jail_a_doors)
        (sleep_until g_jail_a_finished)
        (game_save_no_timeout)
    )
)

(script dormant void ai_jail_b
    (begin
        (data_mine_insert "enc_jail_cell_b")
        (game_save_no_timeout)
        (sleep 60)
        (wake sc_cell_b_ent)
        (wake ai_cell_b_guards)
        (sleep 15)
        (sleep_until (volume_test_objects "tv_jail_b_ent" (players)) 1)
        (ai_place "jail_b_marines")
        (ai_place "jail_b_brutes")
        (ai_place "jail_b_grunts")
        (sleep 30)
        (wake cor_open_b)
        (wake jail_b_doors)
        (sleep_until g_jail_b_finished)
        (game_save_no_timeout)
    )
)

(script static void ai_jail_door_c
    (begin
        (if debug 
            (print "door c"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_c")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_c")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_c")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_d
    (begin
        (if debug 
            (print "door d"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_d")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_d")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_d")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_e
    (begin
        (if debug 
            (print "door e"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_e")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_e")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_e")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_f
    (begin
        (if debug 
            (print "door f"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_f")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_f")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_f")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_g
    (begin
        (if debug 
            (print "door g"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_g")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_g")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_g")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_i
    (begin
        (if debug 
            (print "door i"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_i")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_i")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_i")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_j
    (begin
        (if debug 
            (print "door j"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_j")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_j")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_j")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_k
    (begin
        (if debug 
            (print "door k"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_k")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_k")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_k")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_l
    (begin
        (if debug 
            (print "door l"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_l")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_l")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_l")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_door_m
    (begin
        (if debug 
            (print "door m"))
        (begin_random
            (if g_jail_door 
                (begin
                    (ai_place "jail_brute_m")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_grunt_m")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
            (if g_jail_door 
                (begin
                    (ai_place "jail_jackal_m")
                    (set g_jail_door_count (+ g_jail_door_count 1.0))
                    (if (= g_jail_door_count g_jail_door_limit) 
                        (set g_jail_door false))
                )
            )
        )
        (set g_jail_door true)
        (set g_jail_door_count 0)
    )
)

(script static void ai_jail_spawner
    (begin
        (if debug 
            (print "jail spawner!!!!"))
        (game_saving)
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_jail_spawn_limit 1)
                    (set g_jail_door_limit 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_jail_spawn_limit 1)
                        (set g_jail_door_limit 2)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_jail_spawn_limit 2)
                            (set g_jail_door_limit 2)
                        )
                    ) )
            )
        )
        (begin_random
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_c") 0.0)
                        (not (volume_test_objects "tv_jail_door_c" (players)))
                    ) 
                        (begin
                            (ai_jail_door_c)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_d") 0.0)
                        (not (volume_test_objects "tv_jail_door_d" (players)))
                    ) 
                        (begin
                            (ai_jail_door_d)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_e") 0.0)
                        (not (volume_test_objects "tv_jail_door_e" (players)))
                    ) 
                        (begin
                            (ai_jail_door_e)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_f") 0.0)
                        (not (volume_test_objects "tv_jail_door_f" (players)))
                    ) 
                        (begin
                            (ai_jail_door_f)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_g") 0.0)
                        (not (volume_test_objects "tv_jail_door_g" (players)))
                    ) 
                        (begin
                            (ai_jail_door_g)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_i") 0.0)
                        (not (volume_test_objects "tv_jail_door_i" (players)))
                    ) 
                        (begin
                            (ai_jail_door_i)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_j") 0.0)
                        (not (volume_test_objects "tv_jail_door_j" (players)))
                    ) 
                        (begin
                            (ai_jail_door_j)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_k") 0.0)
                        (not (volume_test_objects "tv_jail_door_k" (players)))
                    ) 
                        (begin
                            (ai_jail_door_k)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_l") 0.0)
                        (not (volume_test_objects "tv_jail_door_l" (players)))
                    ) 
                        (begin
                            (ai_jail_door_l)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
            (if g_jail_spawner 
                (if 
                    (and
                        (<= (device_get_position "jail_door_m") 0.0)
                        (not (volume_test_objects "tv_jail_door_m" (players)))
                    ) 
                        (begin
                            (ai_jail_door_c)
                            (set g_jail_spawn_count (+ g_jail_spawn_count 1.0))
                            (if (= g_jail_spawn_count g_jail_spawn_limit) 
                                (set g_jail_spawner false))
                        )
                )
            )
        )
        (set g_jail_spawner true)
        (set g_jail_spawn_count 0)
    )
)

(script dormant void ai_jail_down_lift
    (begin
        (sleep_until 
            (and
                (volume_test_objects "tv_jail_top" (players))
                (<= (ai_living_count "jail_prophets") 2)
            ) 
        30 (* 30.0 30.0))
        (data_mine_insert "enc_jail_down_lift")
        (sleep 60)
        (wake sc_lift_reins)
        (begin_random
            (begin
                (ai_place "jail_jackals_down")
                (sleep_until (volume_test_objects_all "tv_jail_top" (ai_actors "jail_jackals_down")) 30 450)
            )
            (begin
                (ai_place "jail_grunts_down")
                (sleep_until (volume_test_objects_all "tv_jail_top" (ai_actors "jail_grunts_down")) 30 450)
            )
        )
        (ai_place "jail_brutes_down")
        (sleep_until (volume_test_objects_all "tv_jail_top" (ai_actors "jail_brutes_down")) 30 450)
        (sleep 90)
        (set g_jail_round_lift_spawned true)
        (wake sc_jail_clear)
    )
)

(script dormant void ai_prophets_ini_active
    (begin
        (sleep_until (>= (ai_combat_status "jail_prophets") ai_combat_status_active))
        (if debug 
            (print "jail prophets active"))
        (set g_jail_prophets_ini_active true)
        (ai_set_orders "jail_grunts_ini" "jail_cov_top")
        (ai_set_orders "jail_jackals_ini" "jail_cov_top")
        (sleep_until (<= (ai_living_count "jail_prophets") 2))
        (ai_jail_spawner)
    )
)

(script command_script void cs_room_b_brute_ini_a
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to room_b/p0 1.0)
                (sleep (random_range 0 15))
                (cs_go_to room_b/p1 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_room_b_brute_ini_b
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to room_b/p2 1.0)
                (sleep (random_range 0 15))
                (cs_go_to room_b/p3 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_room_b_brute_ini_c
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to room_b/p4 1.0)
                (sleep (random_range 0 15))
                (cs_go_to room_b/p5 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script dormant void ai_room_b_buggers
    (begin
        (ai_place "room_b_buggers")
        (sleep_until (<= (ai_living_count "room_b_buggers") 2))
        (if 
            (and
                (volume_test_objects_all "tv_room_b" (players))
                (= (device_get_position "room_b_exit") 0.0)
            ) 
                (ai_place "room_b_buggers"))
    )
)

(script dormant void ai_corridor_b
    (begin
        (if (<= (+ (ai_living_count "corridor_b_prophets") (ai_living_count "corridor_b_covenant")) 8.0) 
            (ai_place "hall_c_elites"))
        (ai_place "hall_c_buggers")
        (sleep 1)
        (sleep_until (<= (ai_living_count "corridor_b_prophets") 2))
        (ai_place "hall_c_brute_reins")
    )
)

(script dormant void ai_ext_a_elite_ini
    (begin
        (ai_place "ext_a_elite_ini")
        (sleep_until (<= (ai_living_count "ext_a_brute_ini") 0))
        (ai_migrate "ext_a_elite_ini" "ext_a_watch_elites")
    )
)

(script dormant void ai_ext_a_brute_ini
    (begin
        (ai_place "ext_a_brute_ini")
        (sleep_until (<= (ai_living_count "ext_a_elite_ini") 0))
        (ai_migrate "ext_a_brute_ini" "ext_a_watch_brutes")
    )
)

(script dormant void ai_ext_a_hunters
    (begin
        (ai_place "ext_a_hunters")
        (sleep 150)
        (sleep_until 
            (or
                (<= (ai_living_count "ext_a_prophets") 4)
                (volume_test_objects "tv_ext_a_mid" (players))
            )
        )
        (if (<= (+ (ai_living_count "ext_a_prophets") (ai_living_count "ext_a_covenant")) 6.0) 
            (ai_place "ext_a_brute_door"))
    )
)

(script dormant void ai_ext_a_prophet_migrate
    (begin
        (sleep_until 
            (begin
                (if (<= (ai_living_count "ext_a_covenant") 0) 
                    (begin
                        (ai_set_orders "ext_a_watch_brutes" "ext_a_prophets_follow")
                        (ai_set_orders "ext_a_brute_door" "ext_a_prophets_follow")
                        (ai_set_orders "ext_a_brute_ini" "ext_a_prophets_follow")
                        (ai_set_orders "ext_a_buggers" "ext_a_prophets_follow")
                    )
                )
                (if (<= (ai_living_count "ext_a_prophets") 0) 
                    (ai_set_orders "ext_a_covenant" "ext_a_covenant_follow"))
                false
            ) 
        90)
    )
)

(script dormant void ai_ext_a_snipers
    (begin
        (if g_ext_a_snipers 
            (begin
                (ai_place "ext_a_jackal_snipers_a")
                (set g_ext_a_snipers_count (+ g_ext_a_snipers_count 1.0))
                (if (= g_ext_a_snipers_count g_ext_a_snipers_index) 
                    (set g_ext_a_snipers false))
            )
        )
        (if g_ext_a_snipers 
            (begin
                (ai_place "ext_a_jackal_snipers_b")
                (set g_ext_a_snipers_count (+ g_ext_a_snipers_count 1.0))
                (if (= g_ext_a_snipers_count g_ext_a_snipers_index) 
                    (set g_ext_a_snipers false))
            )
        )
        (if g_ext_a_snipers 
            (begin
                (ai_place "ext_a_jackal_snipers_c")
                (set g_ext_a_snipers_count (+ g_ext_a_snipers_count 1.0))
                (if (= g_ext_a_snipers_count g_ext_a_snipers_index) 
                    (set g_ext_a_snipers false))
            )
        )
        (if g_ext_a_snipers 
            (begin
                (ai_place "ext_a_jackal_snipers_d")
                (set g_ext_a_snipers_count (+ g_ext_a_snipers_count 1.0))
                (if (= g_ext_a_snipers_count g_ext_a_snipers_index) 
                    (set g_ext_a_snipers false))
            )
        )
    )
)

(script dormant void ai_ext_a_fliers
    (begin
        (sleep_until (<= (+ (ai_living_count "ext_a_prophets") (ai_living_count "ext_a_covenant")) 3.0))
        (if (not g_ext_a_fliers) 
            (begin
                (ai_place "ext_a_rangers")
                (ai_place "ext_a_buggers")
            )
        )
    )
)

(script dormant void tram_a_no_save
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_tram_a_no_save" (players)) 
                    (game_save_immediate))
                false
            ) 
        1)
    )
)

(script dormant void tram_b_no_save
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_tram_b_no_save" (players)) 
                    (game_save_immediate))
                false
            ) 
        1)
    )
)

(script dormant void tram_c_no_save
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_tram_c_no_save" (players)) 
                    (game_save_immediate))
                false
            ) 
        1)
    )
)

(script dormant void tram_d_no_save
    (begin
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_tram_d_no_save" (players)) 
                    (game_save_immediate))
                false
            ) 
        1)
    )
)

(script dormant void ai_garden_a_ini
    (begin
        (ai_place "garden_a_elites")
        (ai_place "garden_a_grunts")
        (ai_place "garden_a_brute_lt")
        (ai_place "garden_a_brute_rt")
        (ai_place "garden_a_jackal_snipers")
    )
)

(script dormant void ai_garden_a_rangers
    (begin
        (sleep_until (<= (+ (ai_living_count "garden_a_prophet") (ai_living_count "garden_a_covenant")) 5.0))
        (ai_place "garden_a_rangers")
    )
)

(script command_script void cs_garden_a_turret_bk_a
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to garden_a_turrets/p0)
        (cs_deploy_turret garden_a_turrets/p0)
    )
)

(script command_script void cs_garden_a_turret_bk_b
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to garden_a_turrets/p1)
        (cs_deploy_turret garden_a_turrets/p1)
    )
)

(script dormant void garden_a_tram_b_on
    (begin
        (sleep_until (volume_test_objects "tv_garden_a_tram_b" (players)) 5)
        (object_destroy "garden_tram_b_bk")
        (sleep 30)
        (object_create "garden_tram_b")
    )
)

(script command_script void cs_midtower_buggers_hall
    (begin
        (cs_abort_on_damage false)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to midtower/p0)
        (cs_fly_to midtower/p1)
        (cs_fly_to midtower/p2)
        (cs_fly_to midtower/p3)
        (cs_fly_to midtower/p4)
        (cs_fly_to midtower/p5)
        (cs_fly_to midtower/p6)
    )
)

(script dormant void ai_midtower_buggers_rein
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_midtower_mid" (players))
                (<= (ai_living_count "midtower_prophets") 3)
            )
        )
        (if (<= (+ (ai_living_count "midtower_prophets") (ai_living_count "midtower_covenant")) 4.0) 
            (ai_place "midtower_bugger_rein"))
        (if debug 
            (print "bugger reinforcements"))
    )
)

(script dormant void ai_midtower_cov_rein
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_midtower_mid" (players))
                (<= (ai_living_count "midtower_covenant") 1)
                g_midtower_prophet_rein
            )
        )
        (if (<= (+ (ai_living_count "midtower_prophets") (ai_living_count "midtower_covenant")) 4.0) 
            (begin
                (ai_place "midtower_elite_reins")
                (if debug 
                    (print "covenant reinforcements"))
                (sleep 5)
                (device_set_position "midtower_exit" 1.0)
            )
        )
    )
)

(script dormant void ai_midtower_prophets
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_midtower_bk" (players))
                (<= (ai_living_count "midtower_prophets") 2)
            )
        )
        (if (volume_test_objects "tv_midtower_bk" (players)) 
            (begin
                (ai_place "midtower_brutes")
                (if (<= (ai_living_count "midtower_prophets") 3) 
                    (ai_place "midtower_jackals"))
                (set g_midtower_prophet_rein true)
                (if debug 
                    (print "exit prophets"))
            )
        )
        (sleep 1)
        (if (not g_midtower_prophet_rein) 
            (begin
                (sleep_until (volume_test_objects "tv_midtower_bk" (players)) 10 (* 30.0 15.0))
                (ai_place "midtower_brutes")
                (if (<= (ai_living_count "midtower_prophets") 3) 
                    (ai_place "midtower_jackals"))
                (set g_midtower_prophet_rein true)
                (if debug 
                    (print "exit prophets"))
            )
        )
    )
)

(script command_script void cs_garden_b_grunts
    (begin
        (cs_movement_mode 3)
        (sleep_until 
            (begin
                (begin_random
                    (cs_go_to garden_b/p0)
                    (cs_go_to garden_b/p1)
                    (cs_go_to garden_b/p2)
                    (cs_go_to garden_b/p3)
                    (cs_go_to garden_b/p4)
                    (cs_go_to garden_b/p5)
                    (cs_go_to garden_b/p6)
                    (cs_go_to garden_b/p7)
                    (cs_go_to garden_b/p8)
                    (cs_go_to garden_b/p9)
                    (cs_go_to garden_b/p10)
                    (cs_go_to garden_b/p11)
                    (cs_go_to garden_b/p12)
                    (cs_go_to garden_b/p13)
                    (cs_go_to garden_b/p14)
                )
                false
            )
        )
    )
)

(script command_script void garden_b_brute_berserk
    (begin
        (ai_berserk "garden_b_brute_ini" true)
        (ai_magically_see "garden_b_prophet" "garden_b_covenant")
    )
)

(script dormant void ai_ext_b_dump
    (begin
        (sleep_until g_ext_b_dump 30 (* 30.0 25.0))
        (sleep_until 
            (or
                (volume_test_objects "tv_ext_b_low" (players))
                (<= (ai_living_count "ext_b_covenant") 0)
                (<= (ai_living_count "ext_b_prophets") 0)
            )
        )
        (sleep 60)
        (if debug 
            (print "--- migrating enemies --- migrating enemies ---"))
        (ai_migrate "ext_b_covenant" "ext_b_cov_dump")
        (ai_migrate "ext_b_prophets" "ext_b_prophet_dump")
    )
)

(script dormant void ai_ext_b_reins
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_ext_b_low" (players))
                (<= (ai_living_count "all_enemies") 4)
            )
        )
        (if debug 
            (print "far door covenant"))
        (ai_place "ext_b_grunt_bk_door")
        (ai_place "ext_b_elites_bk_door" (pin (- 8.0 (ai_living_count "all_enemies")) 1.0 3.0))
        (sleep 1)
        (sleep_until 
            (or
                (volume_test_objects "tv_ext_b_low" (players))
                (<= (ai_living_count "all_enemies") 4)
            )
        )
        (if debug 
            (print "lower door brutes"))
        (ai_place "ext_b_brutes_low_door" (pin (- 8.0 (ai_living_count "all_enemies")) 1.0 4.0))
    )
)

(script command_script void cs_ext_b_grunts_low
    (begin
        (cs_movement_mode 3)
        (cs_abort_on_damage true)
        (sleep_until 
            (begin
                (begin_random
                    (cs_go_to ext_b/p0)
                    (cs_go_to ext_b/p1)
                    (cs_go_to ext_b/p2)
                    (cs_go_to ext_b/p3)
                    (cs_go_to ext_b/p4)
                    (cs_go_to ext_b/p5)
                    (cs_go_to ext_b/p6)
                    (cs_go_to ext_b/p7)
                    (cs_go_to ext_b/p8)
                )
                false
            )
        )
    )
)

(script command_script void cs_maus_hall_grunts
    (begin
        (cs_movement_mode 3)
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (begin_random
                    (cs_go_to maus_hall/p0 2.0)
                    (cs_go_to maus_hall/p2 2.0)
                    (cs_go_to maus_hall/p4 2.0)
                    (cs_go_to maus_hall/p5 2.0)
                    (cs_go_to maus_hall/p6 2.0)
                    (cs_go_to maus_hall/p7 2.0)
                    (cs_go_to maus_hall/p8 2.0)
                    (cs_go_to maus_hall/p9 2.0)
                )
                false
            )
        )
    )
)

(script dormant void maus_door
    (begin
        (sleep_until 
            (begin
                (if (= (version) 4) 
                    (begin
                        (device_operates_automatically_set "maus_bsp_4_door" false)
                    ) (if (= (version) 5) 
                        (begin
                            (device_operates_automatically_set "maus_bsp_4_door" true)
                        ) )
                )
                false
            ) 
        5)
    )
)

(script command_script void cs_maus_room_elite_lt
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to maus_room/p0 1.0)
                (sleep (random_range 0 15))
                (cs_go_to maus_room/p1 1.0)
                (sleep (random_range 0 15))
                (cs_go_to maus_room/p2 1.0)
                (sleep (random_range 0 15))
                (cs_go_to maus_room/p3 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script command_script void cs_maus_room_elite_rt
    (begin
        (cs_abort_on_alert true)
        (cs_enable_pathfinding_failsafe true)
        (sleep_until 
            (begin
                (cs_go_to maus_room/p4 1.0)
                (sleep (random_range 0 15))
                (cs_go_to maus_room/p5 1.0)
                (sleep (random_range 0 15))
                (cs_go_to maus_room/p6 1.0)
                (sleep (random_range 0 15))
                (cs_go_to maus_room/p7 1.0)
                (sleep (random_range 0 15))
                false
            )
        )
    )
)

(script dormant void ai_maus_room_ini
    (begin
        (ai_place "maus_room_elite_lt")
        (ai_place "maus_room_elite_rt")
        (if (<= (ai_living_count "all_enemies") 6) 
            (begin
                (ai_place "maus_room_grunt_lt" (pin (- 6.0 (ai_living_count "all_enemies")) 0.0 2.0))
                (ai_place "maus_room_grunt_rt" (pin (- 6.0 (ai_living_count "all_enemies")) 0.0 2.0))
            )
        )
        (sleep_until 
            (or
                (volume_test_objects "tv_maus_room_bk" (players))
                (<= (ai_living_count "maus_room_covenant") 2)
            )
        )
        (ai_place "maus_room_lt_elite_reins" (pin (- 8.0 (ai_living_count "all_enemies")) 0.0 1.0))
        (ai_place "maus_room_rt_elite_reins" (pin (- 8.0 (ai_living_count "all_enemies")) 0.0 1.0))
        (sleep 1)
        (ai_place "maus_room_lt_grunt_reins" (pin (- 6.0 (ai_living_count "all_enemies")) 0.0 2.0))
        (ai_place "maus_room_rt_grunt_reins" (pin (- 6.0 (ai_living_count "all_enemies")) 0.0 2.0))
    )
)

(script dormant void ai_maus_bridge_ini
    (begin
        (if debug 
            (print "initial bridge"))
        (if (< (ai_living_count "all_enemies") 4) 
            (ai_place "maus_bridge_elite_turret" 2) (ai_place "maus_bridge_elite_turret" 1))
        (ai_place "maus_bridge_elites_ini")
        (ai_place "maus_bridge_brutes_ini" (pin (- 10.0 (ai_living_count "all_enemies")) 0.0 3.0))
        (ai_place "maus_bridge_jackals_ini")
        (sleep_until 
            (or
                g_maus_bridge_fr
                (ai_trigger_test "maus_bridge_elites_ini" "maus_bridge_elites_ini")
                (<= (ai_living_count "maus_bridge_prophets") 1)
            )
        )
        (sleep 1)
        (if debug 
            (print "bugger reinforcements"))
        (ai_place "maus_bridge_buggers_ini" (pin (- 11.0 (ai_living_count "all_enemies")) 0.0 5.0))
    )
)

(script dormant void ai_maus_inner_order_transitions
    (begin
        (sleep_until 
            (begin
                (if (<= (ai_living_count "maus_inner_prophets") 0) 
                    (begin
                        (ai_vehicle_exit "maus_inner_turrets")
                        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "maus_inner_turrets/a") true)
                        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "maus_inner_turrets/b") true)
                        (sleep 60)
                        (ai_set_orders "maus_inner_elites_ini" "maus_inner_follow")
                        (ai_set_orders "maus_inner_turrets" "maus_inner_follow")
                    )
                )
                (if 
                    (and
                        (<= (ai_living_count "maus_inner_elites_ini") 0)
                        (<= (ai_living_count "maus_inner_prophets") 0)
                    ) 
                        (ai_set_orders "maus_inner_hunters_ini" "maus_inner_follow"))
                (if (<= (ai_living_count "maus_inner_covenant") 0) 
                    (ai_set_orders "maus_inner_prophets" "maus_inner_follow"))
                g_maus_inner_order_trans
            ) 
        60)
    )
)

(script dormant void ai_maus_inner_brute_reins
    (begin
        (sleep_until (<= (ai_living_count "maus_inner_brutes_ini") 0))
        (sleep 90)
        (ai_place "maus_inner_brutes_rein")
        (sleep 1)
        (wake ai_maus_inner_order_transitions)
    )
)

(script static void ai_maus_inner_brute_a
    (begin
        (if debug 
            (print "door a"))
        (if 
            (and
                (not (volume_test_objects "tv_maus_inner_door_a" (players)))
                (= (device_get_position "maus_inner_door_a") 0.0)
            ) 
                (begin
                    (ai_place "maus_inner_brutes_a")
                    (set g_maus_inner_count (+ g_maus_inner_count 1.0))
                    (if (= g_maus_inner_count g_maus_inner_limit) 
                        (set g_maus_inner false))
                )
        )
    )
)

(script static void ai_maus_inner_brute_b
    (begin
        (if debug 
            (print "door b"))
        (if 
            (and
                (not (volume_test_objects "tv_maus_inner_door_b" (players)))
                (= (device_get_position "maus_inner_door_b") 0.0)
            ) 
                (begin
                    (ai_place "maus_inner_brutes_b")
                    (set g_maus_inner_count (+ g_maus_inner_count 1.0))
                    (if (= g_maus_inner_count g_maus_inner_limit) 
                        (set g_maus_inner false))
                )
        )
    )
)

(script static void ai_maus_inner_brute_c
    (begin
        (if debug 
            (print "door c"))
        (if 
            (and
                (not (volume_test_objects "tv_maus_inner_door_c" (players)))
                (= (device_get_position "maus_inner_door_c") 0.0)
            ) 
                (begin
                    (ai_place "maus_inner_brutes_c")
                    (set g_maus_inner_count (+ g_maus_inner_count 1.0))
                    (if (= g_maus_inner_count g_maus_inner_limit) 
                        (set g_maus_inner false))
                )
        )
    )
)

(script static void ai_maus_inner_brute_d
    (begin
        (if debug 
            (print "door d"))
        (if 
            (and
                (not (volume_test_objects "tv_maus_inner_door_d" (players)))
                (= (device_get_position "maus_inner_door_d") 0.0)
            ) 
                (begin
                    (ai_place "maus_inner_brutes_d")
                    (set g_maus_inner_count (+ g_maus_inner_count 1.0))
                    (if (= g_maus_inner_count g_maus_inner_limit) 
                        (set g_maus_inner false))
                )
        )
    )
)

(script static void ai_maus_inner_brute_e
    (begin
        (if debug 
            (print "door e"))
        (if 
            (and
                (not (volume_test_objects "tv_maus_inner_door_e" (players)))
                (= (device_get_position "maus_inner_door_e") 0.0)
            ) 
                (begin
                    (ai_place "maus_inner_brutes_e")
                    (set g_maus_inner_count (+ g_maus_inner_count 1.0))
                    (if (= g_maus_inner_count g_maus_inner_limit) 
                        (set g_maus_inner false))
                )
        )
    )
)

(script static void ai_maus_inner_brute_f
    (begin
        (if debug 
            (print "door f"))
        (if 
            (and
                (not (volume_test_objects "tv_maus_inner_door_f" (players)))
                (= (device_get_position "maus_inner_door_f") 0.0)
            ) 
                (begin
                    (ai_place "maus_inner_brutes_f")
                    (set g_maus_inner_count (+ g_maus_inner_count 1.0))
                    (if (= g_maus_inner_count g_maus_inner_limit) 
                        (set g_maus_inner false))
                )
        )
    )
)

(script dormant void ai_maus_inner_spawn
    (begin
        (if (difficulty_normal) 
            (begin
                (begin
                    (set g_maus_inner_wave_limit 1)
                    (set g_maus_inner_limit 1)
                )
            ) (if (difficulty_heroic) 
                (begin
                    (begin
                        (set g_maus_inner_wave_limit 2)
                        (set g_maus_inner_limit 1)
                    )
                ) (if (difficulty_legendary) 
                    (begin
                        (begin
                            (set g_maus_inner_wave_limit 3)
                            (set g_maus_inner_limit 2)
                        )
                    ) )
            )
        )
        (sleep_until 
            (begin
                (set g_maus_inner true)
                (set g_maus_inner_count 0)
                (sleep_until (<= (ai_living_count "maus_inner_prophets") 1))
                (sleep (random_range sleep_lower_bound sleep_upper_bound))
                (begin_random
                    (if g_maus_inner 
                        (ai_maus_inner_brute_a))
                    (if g_maus_inner 
                        (ai_maus_inner_brute_b))
                    (if g_maus_inner 
                        (ai_maus_inner_brute_c))
                    (if g_maus_inner 
                        (ai_maus_inner_brute_d))
                    (if g_maus_inner 
                        (ai_maus_inner_brute_e))
                    (if g_maus_inner 
                        (ai_maus_inner_brute_f))
                )
                (sleep (random_range sleep_lower_bound sleep_upper_bound))
                (if (= (random_range 0 2) 0) 
                    (ai_place "maus_inner_buggers_lt") (ai_place "maus_inner_buggers_rt"))
                (sleep 1)
                (ai_set_orders "maus_inner_buggers" "maus_inner_follow")
                (set g_maus_inner_wave_count (+ g_maus_inner_wave_count 1.0))
                (if (= g_maus_inner_wave_count g_maus_inner_wave_limit) 
                    (begin
                        (set g_maus_inner_wave_pause false)
                        (sleep_until g_maus_inner_wave_pause)
                    )
                )
                (if (= g_maus_inner_wave_count (* g_maus_inner_wave_limit 2.0)) 
                    (set g_maus_inner_wave_end true))
                g_maus_inner_wave_end
            )
        )
    )
)

(script dormant void ai_maus_inner_elites_final
    (begin
        (sleep_until 
            (and
                (not (volume_test_objects "tv_maus_ent_door_a" (players)))
                (<= (device_get_position "maus_ent_door_a") 0.0)
                (not (volume_test_objects "tv_maus_ent_door_b" (players)))
                (<= (device_get_position "maus_ent_door_b") 0.0)
            )
        )
        (ai_place "maus_inner_elites_ultra")
        (sleep 45)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_maus_ent_door_a" (players)))
                (<= (device_get_position "maus_ent_door_a") 0.0)
                (not (volume_test_objects "tv_maus_ent_door_b" (players)))
                (<= (device_get_position "maus_ent_door_b") 0.0)
            )
        )
        (ai_place "maus_inner_elites_spec")
        (sleep 45)
        (sleep_until 
            (and
                (not (volume_test_objects "tv_maus_ent_door_a" (players)))
                (<= (device_get_position "maus_ent_door_a") 0.0)
                (not (volume_test_objects "tv_maus_ent_door_b" (players)))
                (<= (device_get_position "maus_ent_door_b") 0.0)
            )
        )
        (ai_place "maus_inner_elite_zealot")
    )
)

(script dormant void enc_council_chamber
    (begin
        (data_mine_insert "enc_council_ini")
        (if debug 
            (print "initialize council chamber encounters"))
        (game_save_no_timeout)
        (object_hide "holo_generator" false)
        (device_set_position_immediate "council_ped" 0.75)
        (device_set_position "council_ped" 1.0)
        (ai_place "council_grunt_ini")
        (ai_place "council_brute_ini")
        (wake ai_council_brutes_berserk)
        (sleep 90)
        (wake sc_council_ini)
        (sleep 90)
        (device_one_sided_set "council_door_left_a" true)
        (device_one_sided_set "council_door_left_b" true)
        (device_one_sided_set "council_door_left_c" true)
        (device_one_sided_set "council_door_right_a" true)
        (device_one_sided_set "council_door_right_b" true)
        (device_one_sided_set "council_door_right_c" true)
        (wake ai_council_orders)
        (sleep_until (<= (ai_living_count "council_prophets_floor") 0))
        (wake ai_council_floor_spawn)
        (sleep_until 
            (and
                (<= (ai_living_count "prophets") 0)
                g_council_over
            )
        )
        (sleep 75)
        (wake music_07a_01)
        (wake sc_council_exit)
        (sleep_until (>= (device_get_position "council_exit") 0.8))
        (ai_place "grand_a_grunts")
        (sleep_until (volume_test_objects "tv_dervish_grand_hall" (players)) 10)
        (data_mine_insert "enc_grand_a")
        (game_save_no_timeout)
        (ai_place "grand_a_brutes")
        (ai_place "grand_a_turret")
        (if (difficulty_normal) 
            (ai_place "ledge_brutes_ini" 1) (ai_place "ledge_brutes_ini"))
        (if (difficulty_normal) 
            (ai_place "ledge_brutes_honor_ini" 1) (ai_place "ledge_brutes_honor_ini"))
        (sleep_until (<= (ai_living_count "grand_a_prophets") 2) 30 210)
        (wake music_07a_02)
        (wake sc_grand_a_exit)
    )
)

(script dormant void enc_dervish_ledge
    (begin
        (data_mine_insert "enc_ledge_ini")
        (if debug 
            (print "initialize dervish ledge encounters"))
        (game_save_no_timeout)
        (ai_disposable "council_prophets" true)
        (ai_place "ledge_jackal_left")
        (ai_place "ledge_jackal_right")
        (wake ai_dervish_ledge_orders)
        (sleep_until (volume_test_objects "tv_dervish_ledge_fr" (players)))
        (sleep (random_range 15 45))
        (sleep_until 
            (or
                (volume_test_objects "tv_dervish_ledge_bk" (players))
                (<= (ai_living_count "dervish_ledge_prophets") 2)
            ) 
        10)
        (data_mine_insert "enc_ledge_lift")
        (game_save_no_timeout)
        (wake ai_ledge_lift)
        (wake sc_ledge_down)
        (sleep_until (volume_test_objects "tv_dervish_ledge_lower" (players)))
        (game_save_no_timeout)
        (data_mine_insert "enc_ledge_lower")
        (wake ai_ledge_lower)
        (set g_music_07a_02 false)
    )
)

(script dormant void enc_corridors_a
    (begin
        (data_mine_insert "enc_high_hall_a")
        (if debug 
            (print "initialize corridor a encounters"))
        (ai_disposable "grand_a_prophets" true)
        (ai_disposable "dervish_ledge_prophets" true)
        (wake corridor_a_activate)
        (wake ai_hall_a_prophets)
        (wake sc_corridor_a_amb)
        (sleep_until (volume_test_objects "tv_hall_b" (players)) 5)
        (data_mine_insert "enc_high_hall_b")
        (wake sc_jail_info)
        (ai_place "hall_b_brutes")
        (ai_place "hall_b_grunts")
        (ai_place "hall_b_grunts_bk")
        (wake sc_room_a_lift)
        (sleep_until (volume_test_objects "tv_room_a" (players)) 1)
        (data_mine_insert "enc_room_a")
        (game_save_no_timeout)
        (device_operates_automatically_set "room_a_door" true)
        (wake ai_room_a)
        (wake room_a_door)
        (sleep_until (volume_test_objects "tv_room_a_bot" (players)) 10)
        (wake sc_room_a_down)
        (sleep_until (volume_test_objects "tv_room_a_tube" (players)))
        (cs_run_command_script "room_a_prophets" cs_room_a_to_jail)
        (ai_migrate "room_a_prophets" "jail_trash")
        (erase_cortana)
    )
)

(script dormant void enc_jails
    (begin
        (data_mine_insert "enc_jail_ini")
        (if debug 
            (print "initialize jails encounters"))
        (ai_disposable "hall_a_prophets" true)
        (ai_disposable "hall_b_prophets" true)
        (device_set_power "room_a_lift" 0.0)
        (device_set_position "room_a_lift_effect" 1.0)
        (device_set_position "jail_down" 1.0)
        (ai_erase "room_a_tube_fodder")
        (ai_place "jail_brutes_ini")
        (ai_place "jail_grunts_ini")
        (ai_place "jail_jackals_ini")
        (wake music_07a_03)
        (wake ai_prophets_ini_active)
        (wake sc_jail_down)
        (sleep_until 
            (and
                (<= (ai_living_count "jail_brutes_ini") 0)
                (<= (ai_living_count "jail_jackals_ini") 0)
            )
        )
        (game_save_no_timeout)
        (if g_jail_prophets_ini_active 
            (sleep_until (<= (ai_living_count "jail_prophets") 0)) (sleep_forever ai_prophets_ini_active))
        (if (= (random_range 0 2) 0) 
            (wake ai_jail_a) (wake ai_jail_b))
        (sleep_until 
            (or
                g_jail_a_finished
                g_jail_b_finished
            )
        )
        (ai_jail_spawner)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (if g_jail_a_finished 
            (wake ai_jail_b) (wake ai_jail_a))
        (sleep_until 
            (and
                g_jail_a_finished
                g_jail_b_finished
            )
        )
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (wake sc_jail_exit)
        (ai_jail_spawner)
        (sleep 1)
        (wake ai_jail_down_lift)
        (sleep_until g_jail_round_lift_spawned)
        (sleep 30)
        (sleep_until 
            (and
                (not (volume_test_objects_all "tv_jail_top" (players)))
                (not (volume_test_objects_all "tv_jail_mid" (players)))
                (not (volume_test_objects_all "tv_jail_bot" (players)))
            )
        )
        (erase_cortana)
        (set g_music_07a_03 false)
    )
)

(script dormant void enc_corridors_b
    (begin
        (data_mine_insert "enc_corridors_b")
        (if debug 
            (print "initialize corridor b encounters"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (set g_jail_exit_reminder true)
        (if 
            (and
                (not g_jail_a_finished)
                (not g_jail_b_finished)
            ) 
                (begin
                    (object_destroy "jail_down")
                    (object_create "jail_up")
                    (object_create "room_b_lift")
                    (device_set_position "room_b_lift_effect" 1.0)
                    (sleep 1)
                    (ai_place "room_b_marines")
                )
        )
        (ai_disposable "jail_prophets" true)
        (wake sc_room_b)
        (wake grand_b_door)
        (wake objective_truth_set)
        (ai_set_orders "marines" "marines_corr_b")
        (sleep_until (volume_test_objects "tv_room_b_start" (players)) 5)
        (player_enable_input)
        (ai_place "room_b_elites")
        (wake ai_room_b_buggers)
        (sleep_until (volume_test_objects "tv_hall_c" (players)))
        (game_save_no_timeout)
        (cs_run_command_script "marines" cs_abort)
        (wake ai_corridor_b)
        (wake marine_migration)
        (sleep_until (volume_test_objects "tv_hall_c_bk" (players)) 1)
        (ai_disposable "room_b_prophets" true)
        (ai_disposable "room_b_covenant" true)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (if (<= (ai_living_count "corridor_b_prophets") 4) 
            (ai_place "hall_c_bugger_reins"))
        (sleep_until (volume_test_objects "tv_hall_d" (players)))
        (wake sc_corridor_b_exit)
        (ai_place "hall_d_elites")
        (ai_place "hall_d_brutes")
        (if (<= (+ (ai_living_count "corridor_b_prophets") (ai_living_count "corridor_b_covenant")) 8.0) 
            (ai_place "hall_d_jackals_bk"))
        (sleep 1)
        (if (<= (+ (ai_living_count "corridor_b_prophets") (ai_living_count "corridor_b_covenant")) 8.0) 
            (ai_place "hall_d_jackals_fr"))
        (sleep_until (volume_test_objects "tv_grand_b" (players)))
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (game_save_no_timeout)
        (wake music_07a_04)
        (ai_place "grand_b_hunter_a")
        (ai_place "grand_b_hunter_b")
        (ai_disposable "corridor_b_prophets" true)
        (ai_disposable "corridor_b_covenant" true)
        (objects_predict (ai_actors "ext_a_prophets"))
        (objects_predict (ai_actors "ext_a_covenant"))
        (wake sc_network)
    )
)

(script dormant void enc_tower_a_ext
    (begin
        (data_mine_insert "enc_tower_a_exterior")
        (if debug 
            (print "initialize tower a exterior encounters"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (if (difficulty_legendary) 
            (wake ice_cream_angry))
        (ai_disposable "corridor_b_prophets" true)
        (ai_disposable "corridor_b_covenant" true)
        (wake ai_ext_a_snipers)
        (ai_place "ext_a_watch_brutes")
        (ai_place "ext_a_watch_elites")
        (wake ai_ext_a_hunters)
        (wake ai_ext_a_elite_ini)
        (wake ai_ext_a_brute_ini)
        (wake ai_ext_a_prophet_migrate)
        (sleep_until 
            (or
                (volume_test_objects "tv_ext_a_mid" (players))
                (<= (+ (ai_living_count "ext_a_prophets") (ai_living_count "ext_a_covenant")) 6.0)
            ) 
        10)
        (ai_disposable "grand_b_hunters" true)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (wake ai_ext_a_fliers)
        (sleep_until (volume_test_objects "tv_ext_a_exit" (players)))
        (set g_ext_a_fliers true)
        (ai_place "ext_a_brute_bk_door")
        (sleep_until (volume_test_objects "tv_tower_a_ramp" (players)) 10)
        (set g_music_07a_04_alt true)
        (wake sc_truth_a)
        (sleep_until 
            (or
                (volume_test_objects "tv_garden_a_tram" (players))
                (and
                    (<= (ai_living_count "ext_a_brutes_bk") 0)
                    (<= (ai_living_count "ext_a_buggers_bk") 0)
                )
            ) 
        10)
        (sleep 30)
        (wake sc_in_amber_clad)
        (wake tram_a_no_save)
        (sleep 60)
        (if (not (volume_test_objects "tv_tram_a_no_save" (players))) 
            (game_save_no_timeout))
        (wake music_07a_05)
        (sleep_until g_sc_ioc_finished)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
    )
)

(script dormant void enc_gardens_a
    (begin
        (data_mine_insert "enc_gardens_a")
        (if debug 
            (print "initialize hanging gardens a encounters"))
        (game_save_no_timeout)
        (erase_cortana)
        (ai_disposable "ext_a_prophets" true)
        (ai_disposable "ext_a_covenant" true)
        (set g_marine_mig_garden_a true)
        (set g_ioc_reminder true)
        (wake ai_garden_a_ini)
        (sleep_until 
            (or
                (volume_test_objects "tv_garden_a_fr_suck" (players))
                (volume_test_objects "tv_garden_a_fr" (players))
            ) 
        5)
        (if debug 
            (print "garden a fr"))
        (ai_place "garden_a_brute_a")
        (ai_place "garden_a_brute_b")
        (ai_place "garden_a_brute_c")
        (ai_place "garden_a_elite_a")
        (ai_place "garden_a_elite_b")
        (ai_place "garden_a_elite_c")
        (sleep_until (volume_test_objects "tv_garden_a_mid" (players)))
        (if debug 
            (print "garden a mid"))
        (game_save_no_timeout)
        (set g_music_07a_05 false)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (wake ai_garden_a_rangers)
        (sleep_until (volume_test_objects "tv_garden_a_bk" (players)))
        (if debug 
            (print "garden a bk"))
        (game_save_no_timeout)
        (wake garden_a_tram_b_on)
        (ai_place "garden_a_elites_bk")
        (ai_place "garden_a_grunts_bk" (pin (- 8.0 (ai_living_count "all_enemies")) 0.0 2.0))
        (sleep 1)
        (ai_place "garden_a_brutes_bk")
        (ai_place "garden_a_jackals_bk" (pin (- 8.0 (ai_living_count "all_enemies")) 0.0 2.0))
    )
)

(script dormant void ai_midtower_ini
    (begin
        (sleep_until (> (device_get_position "midtower_ent_door") 0.0) 10)
        (ai_place "midtower_buggers_hall")
    )
)

(script dormant void enc_mid_tower
    (begin
        (data_mine_insert "enc_mid_tower")
        (if debug 
            (print "initialize midspan tower encounters"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_disposable "garden_a_prophet" true)
        (ai_disposable "garden_a_covenant" true)
        (set g_marine_mig_midtower true)
        (wake sc_drive_elites)
        (wake ai_midtower_ini)
        (sleep_until (volume_test_objects "tv_mid_tower_room" (players)))
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (game_save_no_timeout)
        (ai_place "midtower_elites")
        (ai_place "midtower_buggers_ini")
        (wake ai_midtower_buggers_rein)
        (wake ai_midtower_cov_rein)
        (wake ai_midtower_prophets)
        (wake music_07a_06)
    )
)

(script dormant void enc_gardens_b
    (begin
        (data_mine_insert "enc_gardens_b")
        (if debug 
            (print "initialize hanging gardens b encounters"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (set g_music_07a_06 true)
        (ai_disposable "midtower_prophets" true)
        (ai_disposable "midtower_covenant" true)
        (wake sc_gardens_b)
        (sleep_until (volume_test_objects "tv_garden_b_fr" (players)))
        (if debug 
            (print "garden b fr"))
        (game_save_no_timeout)
        (ai_place "garden_b_grunt_a")
        (ai_place "garden_b_grunt_b")
        (ai_place "garden_b_grunt_c")
        (ai_place "garden_b_brute_ini")
        (sleep_until (volume_test_objects "tv_garden_b_mid" (players)))
        (if debug 
            (print "garden b mid"))
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_garden_b_bk" (players)))
        (if debug 
            (print "garden b bk"))
        (game_save_no_timeout)
        (wake tram_d_no_save)
    )
)

(script dormant void enc_tower_b_ext
    (begin
        (data_mine_insert "enc_tower_b_exterior")
        (if debug 
            (print "initialize tower b exterior encounters"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_disposable "garden_b_prophet" true)
        (ai_disposable "garden_b_covenant" true)
        (set g_marine_mig_ext_b true)
        (wake objective_truth_clear)
        (wake objective_phantom_set)
        (ai_place "ext_b_brute_ramp")
        (sleep_until (volume_test_objects "tv_ext_b" (players)) 5)
        (if debug 
            (print "initial enemies"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_place "ext_b_elite_a")
        (ai_place "ext_b_brute_a")
        (ai_place "ext_b_grunts_b")
        (ai_place "ext_b_brutes_b")
        (ai_place "ext_b_grunts_low")
        (ai_place "ext_b_brutes_low")
        (ai_place "ext_b_jackal_a")
        (sleep 1)
        (wake ai_ext_b_reins)
        (wake ai_ext_b_dump)
        (sleep_until (volume_test_objects "tv_ext_b_lt" (players)))
        (set g_ext_b_dump true)
        (if debug 
            (print "placing left covenant"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_place "ext_b_grunts_lt")
        (ai_place "ext_b_elites_stealth")
    )
)

(script dormant void enc_mausoleum_ext
    (begin
        (data_mine_insert "enc_maus_grand")
        (if debug 
            (print "initialize mausoleum exterior encounters"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_disposable "ext_b_prophets" true)
        (ai_disposable "ext_b_covenant" true)
        (set g_marine_mig_maus true)
        (wake maus_door)
        (ai_place "maus_hall_grunts")
        (ai_place "maus_hall_elites_stealth")
        (sleep_until (volume_test_objects "tv_maus_room" (players)) 5)
        (data_mine_insert "enc_maus_room")
        (game_save_no_timeout)
        (cs_run_command_script "covenant" cs_abort)
        (ai_set_orders "maus_hall_covenant" "maus_room_cov_follow")
        (set g_marine_mig_maus_room true)
        (wake ai_maus_room_ini)
        (sleep_until (volume_test_objects "tv_maus_room_bk" (players)) 10)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_place "maus_room_brute_bk")
        (ai_place "maus_room_jackal_bk_lt")
        (ai_place "maus_room_jackal_bk_rt")
        (ai_set_orders "maus_hall_covenant" "maus_room_cov_follow")
        (ai_set_orders "maus_room_covenant" "maus_room_cov_follow")
        (sleep_until (volume_test_objects "tv_maus_bridge" (players)) 5)
        (data_mine_insert "enc_maus_bridge")
        (game_save_no_timeout)
        (erase_cortana)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_set_orders "maus_hall_covenant" "maus_bridge_cov_screw")
        (ai_set_orders "maus_room_prophet" "maus_bridge_prophet_screw")
        (ai_set_orders "maus_room_covenant" "maus_bridge_cov_screw")
        (sleep_forever ai_maus_room_ini)
        (ai_disposable "maus_hall_covenant" true)
        (wake ai_maus_bridge_ini)
        (wake sc_catch_truth)
        (sleep_until (volume_test_objects "tv_maus_bridge_fr" (players)) 10)
        (set g_maus_bridge_fr true)
        (sleep_until (volume_test_objects "tv_maus_bridge_mid" (players)) 10)
        (game_save_no_timeout)
        (if debug 
            (print "bridge reinforcements wave 1"))
        (ai_place "maus_bridge_elite_rein" (pin (- 12.0 (ai_living_count "all_enemies")) 1.0 2.0))
        (sleep 1)
        (ai_place "maus_bridge_grunt_rein" (pin (- 10.0 (ai_living_count "all_enemies")) 0.0 4.0))
        (sleep 1)
        (ai_place "maus_bridge_buggers_ini" (pin (- 6.0 (ai_living_count "all_enemies")) 2.0 5.0))
        (ai_set_orders "maus_bridge_buggers_ini" "maus_bridge_buggers_rein")
        (sleep_until (volume_test_objects "tv_maus_bridge_bk" (players)) 10)
        (if debug 
            (print "bridge reinforcements wave 2"))
        (game_save_no_timeout)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_place "maus_bridge_grunt_rein_b" (pin (- 8.0 (ai_living_count "all_enemies")) 0.0 4.0))
        (ai_place "maus_bridge_hunters")
    )
)

(script dormant void enc_mausoleum
    (begin
        (data_mine_insert "enc_mausoleum")
        (if debug 
            (print "initialize mausoleum encounters"))
        (game_save_no_timeout)
        (kill_volume_disable "kill_maus")
        (set g_marine_mig_maus_int true)
        (if (<= (ai_living_count "marines") 3) 
            (ai_renew "marines"))
        (ai_disposable "maus_room_prophet" true)
        (ai_disposable "maus_room_covenant" true)
        (ai_disposable "maus_bridge_prophets" true)
        (ai_disposable "maus_bridge_covenant" true)
        (ai_set_orders "maus_bridge_covenant" "maus_ent_collapse")
        (ai_set_orders "maus_bridge_prophets" "maus_ent_collapse")
        (ai_place "maus_inner_elites_ini")
        (ai_place "maus_inner_brutes_ini")
        (ai_place "maus_inner_buggers_lt")
        (wake music_07a_07)
        (wake sc_maus_interior)
        (sleep 120)
        (kill_volume_enable "kill_maus")
        (sleep_until 
            (or
                (volume_test_objects "tv_maus_inner_mid" (players))
                (<= (ai_living_count "maus_inner_covenant") 1)
            )
        )
        (game_save_no_timeout)
        (sleep 5)
        (ai_place "maus_inner_hunters_ini")
        (sleep 1)
        (wake ai_maus_inner_brute_reins)
        (sleep_until 
            (and
                (<= (ai_living_count "maus_inner_prophets") 0)
                (<= (ai_living_count "maus_inner_covenant") 0)
            ) 
        30 (* 30.0 60.0 10.0))
        (game_save_no_timeout)
        (set g_maus_inner_order_trans true)
        (sc_maus_breather)
        (data_mine_insert "enc_maus_midpoint")
        (game_save_no_timeout)
        (wake music_07a_08)
        (wake ai_maus_inner_elites_final)
        (set g_music_07a_07 false)
        (set g_music_07a_08 true)
        (sleep 60)
        (game_save_no_timeout)
        (wake sc_maus_exit)
    )
)

(script static void cutscenes
    (begin
        (x08)
        (sleep 30)
        (c07_intro)
        (sleep 30)
        (c07_intra1)
    )
)

(script dormant void mission_highcharity
    (begin
        (cinematic_snap_to_white)
        (object_hide "holo_generator" true)
        (structure_bsp_index 0)
        (if (= g_play_cinematics true) 
            (begin
                (ui_error_ok_cancel)
                (if (cinematic_skip_start) 
                    (begin
                        (if debug 
                            (print "x08"))
                        (x08)
                    )
                )
                (cinematic_skip_stop)
                (if (cinematic_skip_start) 
                    (begin
                        (if debug 
                            (print "c07_intro"))
                        (c07_intro)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (sleep 2)
        (object_teleport (player0) "player0_start")
        (object_teleport (player1) "player1_start")
        (wake enc_council_chamber)
        (wake bullshit)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white_bars)
        (wake chapter_job)
        (wake objective_locate_set)
        (sleep_until (volume_test_objects "tv_dervish_ledge" (players)) 5)
        (wake enc_dervish_ledge)
        (sleep_until (volume_test_objects "tv_corridors_a" (players)) 5)
        (wake enc_corridors_a)
        (sleep_until (volume_test_objects "tv_jails" (players)) 5)
        (wake enc_jails)
        (sleep_until (volume_test_objects "tv_room_a_tube" (players)) 5)
        (wake enc_corridors_b)
        (sleep_until (volume_test_objects "tv_tower_a_ext" (players)) 5)
        (wake enc_tower_a_ext)
        (sleep_until (volume_test_objects "tv_gardens_a" (players)) 5)
        (wake enc_gardens_a)
        (sleep_until (volume_test_objects "tv_mid_tower" (players)) 5)
        (wake enc_mid_tower)
        (sleep_until (volume_test_objects "tv_gardens_b" (players)) 5)
        (wake enc_gardens_b)
        (sleep_until (volume_test_objects "tv_tower_b_ext" (players)) 5)
        (wake enc_tower_b_ext)
        (sleep_until (volume_test_objects "tv_mausoleum_ext" (players)) 5)
        (wake enc_mausoleum_ext)
        (sleep_until (volume_test_objects "tv_mausoleum" (players)) 5)
        (wake enc_mausoleum)
    )
)

(script static void start
    (begin
        (wake mission_highcharity)
    )
)

(script startup void mission_main
    (begin
        (ai_allegiance player human)
        (ai_allegiance human player)
        (if (> (player_count) 0) 
            (start))
    )
)

(script dormant void x08_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\fp_needler\fp_needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\fp_needler\fp_needler" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_small_door\high_small_door" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_banner\high_banner" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\pedestal\pedestal" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\holo_generator\holo_generator" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null\null" 0)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 7)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 4)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 5)
        (sleep 1)
        (predict_bitmap scenarios\solo\07a_highcharity\gravemind 0 false)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 1)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture_driven\tentacle_capture_driven" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture_driven\tentacle_capture_driven" 1)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture_masterchief\tentacle_capture_masterchief" 0)
    )
)

(script dormant void x08_02_predict
    (begin
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 1)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture_masterchief\tentacle_capture_masterchief" 0)
    )
)

(script dormant void x08_03_predict
    (begin
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture_driven\tentacle_capture_driven" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture_driven\tentacle_capture_driven" 1)
        (sleep 145)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture_masterchief\tentacle_capture_masterchief" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 1)
    )
)

(script dormant void x08_04_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x08_05_predict
    (begin
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\gravemind\floodregret\floodregret" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\floodregret\floodregret" 1)
        (predict_lightmap_bucket "objects\characters\gravemind\floodregret\floodregret" 2)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\gravemind\monitor_flood_infected\monitor_flood_infected" 0)
    )
)

(script dormant void x08_06a_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x08_06b_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x08_06c_predict
    (begin
        (sleep 512)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\gravemind" 1)
    )
)

(script dormant void x08_07_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x08_08_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x08_09_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x08_10_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x08_11_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void 07_intro_01_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 1 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 6 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 19 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 16 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 17 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 21 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 22 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 23 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 24 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 25 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 29 true)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 11 true)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 7)
        (sleep 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 27 false)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_stardust\high_charity_stardust" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\substance_space\substance_space" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_exterior\high_charity_exterior" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\spacestation\spacestation" 0)
    )
)

(script dormant void 07_intro_02_predict
    (begin
        (sleep 5)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 1 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 0 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 32 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 33 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_dervish_lift_up\high_dervish_lift_up" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_gravcolumn\cov_gravcolumn" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_planter\high_planter" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_holo_ped\high_holo_ped" 0)
        (predict_lightmap_bucket "objects\characters\jackal\jackal_scenery\jackal_scenery" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt_scenery\grunt_scenery" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt_scenery\grunt_scenery" 1)
        (predict_lightmap_bucket "objects\characters\grunt\grunt_scenery\grunt_scenery" 2)
        (predict_lightmap_bucket "objects\characters\grunt\grunt_scenery\grunt_scenery" 3)
        (predict_lightmap_bucket "objects\characters\grunt\grunt_scenery\grunt_scenery" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 7)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 15 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 13 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 30 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 31 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_banner_small\high_banner_small" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_hallway_signs\holo_hallway_signs" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 45 false)
        (sleep 9)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 13 true)
        (sleep 25)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 1)
        (sleep 24)
        (predict_lightmap_bucket "objects\characters\ambient_life\seagull\seagull" 0)
        (sleep 21)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 3)
        (sleep 54)
        (predict_lightmap_bucket "objects\characters\jackal\jackal_scenery\jackal_scenery" 0)
        (sleep 75)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_planter\high_planter" 0)
        (sleep 17)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_hallway_signs\holo_hallway_signs" 0)
        (sleep 7)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 13 false)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_full\index_full" 0)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 45 false)
    )
)

(script dormant void 07_intro_03_predict
    (begin
        (sleep 5)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 41 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 45 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 33 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 9 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 11 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 42 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 31 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 34 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 39 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 12 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 29 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 26 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 1 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 3 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_small_door\high_small_door" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null\null" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_banner\high_banner" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 4)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 5)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\pedestal\pedestal" 0)
        (predict_lightmap_bucket "objects\cinematics\covenant\holo_cam\holo_cam" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
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
        (sleep 176)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 166)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (sleep 167)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 45 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 41 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 22 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 37 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 40 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 1 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 5 true)
        (predict_lightmap_bucket "objects\cinematics\covenant\holo_cam\holo_cam" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 4)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 5)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_small_door\high_small_door" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null\null" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 3)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_holo_ped\high_holo_ped" 0)
    )
)

(script dormant void 07_intro_04_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 34 false)
        (sleep 53)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 45 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 23 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 1 true)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 4)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 5)
        (predict_lightmap_bucket "objects\cinematics\covenant\holo_cam\holo_cam" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 37)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 41 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 37 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 16 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 3 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 5 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_small_door\high_small_door" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null\null" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_holo_ped\high_holo_ped" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 0)
        (sleep 21)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 4)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 5)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 6)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 7)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (sleep 15)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 43 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_banner\high_banner" 0)
        (sleep 7)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 17 false)
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 7)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 22 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 40 false)
        (sleep 7)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 17 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 33 false)
        (sleep 73)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 9 false)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 4)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 5)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\pedestal\pedestal" 0)
        (sleep 29)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 33 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 41 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 22 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 43 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 37 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 40 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 16 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 3 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 true)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_banner\high_banner" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null\null" 0)
        (sleep 47)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 4)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 5)
        (sleep 11)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (sleep 22)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 4)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 5)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 6)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 7)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 11 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 9 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 34 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 39 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 3 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\pedestal\pedestal" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (sleep 1)
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
        (sleep 1)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 23)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 17)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
    )
)

(script dormant void 07_intra1_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_small_door\high_small_door" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\fp_needler\fp_needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\fp_needler\fp_needler" 1)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 15)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 16)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 17)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 18)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 19)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\holo_generator\holo_generator" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 5)
        (predict_lightmap_bucket "objects\characters\brute\brute" 6)
        (predict_lightmap_bucket "objects\characters\brute\brute" 7)
        (predict_lightmap_bucket "objects\characters\brute\brute" 8)
        (predict_lightmap_bucket "objects\characters\brute\brute" 9)
        (predict_lightmap_bucket "objects\characters\brute\brute" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\brute_plasma_rifle\brute_plasma_rifle" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\brute_plasma_rifle\brute_plasma_rifle" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 15)
        (predict_lightmap_bucket "objects\characters\brute\brute" 16)
        (predict_lightmap_bucket "objects\characters\brute\brute" 17)
        (predict_lightmap_bucket "objects\characters\brute\brute" 18)
        (predict_lightmap_bucket "objects\characters\brute\brute" 19)
        (predict_lightmap_bucket "objects\characters\brute\brute" 20)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 4)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 5)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 19 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 1 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 4 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_lightmap_bucket "scenarios\objects\special\cooke_cutter_1x1\cooke_cutter_1x1" 0)
        (sleep 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
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
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (sleep 110)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 33)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 true)
        (sleep 74)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (sleep 28)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\support_high\flak_cannon\flak_cannon" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\weapons\support_low\brute_shot\brute_shot" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 1)
        (predict_lightmap_bucket "objects\characters\brute\brute" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 25)
        (predict_lightmap_bucket "objects\characters\brute\brute" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "objects\characters\hunter\hunter" 0)
        (predict_lightmap_bucket "objects\characters\hunter\hunter" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 11)
        (predict_lightmap_bucket "objects\characters\elite\elite" 12)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 1)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 2)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 3)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 4)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 62)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 4 true)
        (sleep 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 58)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 11)
        (predict_lightmap_bucket "objects\characters\elite\elite" 12)
        (sleep 11)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 14 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "scenarios\objects\special\cooke_cutter_1x1\cooke_cutter_1x1" 0)
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
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
    )
)

(script dormant void 07_intra1_02_predict
    (begin
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 2)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_full\index_full" 0)
        (sleep 72)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 103)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 100)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 14 true)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "scenarios\objects\special\cooke_cutter_1x1\cooke_cutter_1x1" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 71)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 true)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 8)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 1)
    )
)

(script dormant void 07_intra1_03_predict
    (begin
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 1)
        (predict_lightmap_bucket "objects\characters\brute\brute" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 25)
        (predict_lightmap_bucket "objects\characters\brute\brute" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "objects\characters\hunter\hunter" 0)
        (predict_lightmap_bucket "objects\characters\hunter\hunter" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 11)
        (predict_lightmap_bucket "objects\characters\elite\elite" 12)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 1)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 2)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 3)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 4)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (sleep 100)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 14 true)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 0)
        (predict_lightmap_bucket "scenarios\objects\special\cooke_cutter_1x1\cooke_cutter_1x1" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 51)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 0 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 9)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 0 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 11)
        (predict_lightmap_bucket "objects\characters\elite\elite" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 16)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 0 true)
        (sleep 17)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (sleep 4)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 1)
        (predict_lightmap_bucket "objects\characters\brute\brute" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 25)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "objects\characters\hunter\hunter" 0)
        (predict_lightmap_bucket "objects\characters\hunter\hunter" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 11)
        (predict_lightmap_bucket "objects\characters\elite\elite" 12)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 1)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 2)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 3)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 4)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (predict_lightmap_bucket "objects\weapons\melee\pike\pike" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 2)
        (sleep 27)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (sleep 18)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 49)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "scenarios\objects\special\cooke_cutter_1x1\cooke_cutter_1x1" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
    )
)

(script dormant void 07_intra1_04_predict
    (begin
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_full\index_full" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 43)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 14 true)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 12)
        (predict_lightmap_bucket "scenarios\objects\special\cooke_cutter_1x1\cooke_cutter_1x1" 0)
        (sleep 67)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (sleep 147)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 14 true)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 30)
        (predict_lightmap_bucket "objects\characters\brute\brute" 31)
        (predict_lightmap_bucket "objects\characters\brute\brute" 32)
        (predict_lightmap_bucket "objects\characters\brute\brute" 38)
        (predict_lightmap_bucket "objects\characters\brute\brute" 41)
        (predict_lightmap_bucket "scenarios\objects\special\cooke_cutter_1x1\cooke_cutter_1x1" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 111)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
    )
)

(script static void test_halls
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 1)
        (print "teleporting players...")
        (object_teleport (player0) "halls")
        (cinematic_start 0.0 0.0 0.0 60)
        (sleep 10)
        (player_flashlight_on true)
    )
)

(script static void test_jails
    (begin
        (structure_bsp_index 2)
        (sleep 1)
        (object_teleport (player0) "jails0_tele")
        (object_teleport (player1) "jails1_tele")
        (sleep_until (volume_test_objects "tv_jails" (players)) 5)
        (wake enc_jails)
    )
)

(script static void test_corridors_b
    (begin
        (structure_bsp_index 2)
        (sleep 1)
        (object_teleport (player0) "corrb0_tele")
        (object_teleport (player1) "corrb1_tele")
        (sleep 90)
        (wake enc_corridors_b)
        (sleep_until (volume_test_objects "tv_tower_a_ext" (players)) 5)
        (wake enc_tower_a_ext)
        (sleep_until (volume_test_objects "tv_gardens_a" (players)) 5)
        (wake enc_gardens_a)
        (sleep_until (volume_test_objects "tv_mid_tower" (players)) 5)
        (wake enc_mid_tower)
        (sleep_until (volume_test_objects "tv_gardens_b" (players)) 5)
        (wake enc_gardens_b)
        (sleep_until (volume_test_objects "tv_tower_b_ext" (players)) 5)
        (wake enc_tower_b_ext)
        (sleep_until (volume_test_objects "tv_mausoleum_ext" (players)) 5)
        (wake enc_mausoleum_ext)
        (sleep_until (volume_test_objects "tv_mausoleum" (players)) 5)
        (wake enc_mausoleum)
    )
)

(script static void test_gardens
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 3)
        (print "teleporting players...")
        (object_teleport (player0) "garden")
        (cinematic_start 0.0 0.0 0.0 60)
        (sleep 10)
        (player_flashlight_on true)
    )
)

(script static void test_mausoleum
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 1)
        (player_flashlight_on false)
        (print "switching bsp...")
        (sleep 15)
        (structure_bsp_index 4)
        (print "teleporting players...")
        (object_teleport (player0) "mausoleum")
        (cinematic_start 0.0 0.0 0.0 60)
        (sleep 10)
        (player_flashlight_on true)
    )
)

