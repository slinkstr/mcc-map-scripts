; Decompiled with Blamite
; Source file: 08a_deltacliffs.hsc
; Start time: 4/7/2022 7:18:45
; Decompilation finished in ~0.00222s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean g_mission_over false)
(global short 15_seconds 450)
(global short 30_seconds 900)
(global short 45_seconds 900)
(global short one_minute 1800)
(global short two_minutes 3600)
(global unit g_cov_stealth_major none)
(global unit g_cov_gold_elite none)
(global short g_brute_alarm_level 0)
(global boolean g_e10_started false)
(global short g_e10_pro_inf1_2_count 4)
(global unit g_e10_weapon_scene0_actor none)
(global effect g_e10_pod_impact_effect "effects\scenarios\solo\earthcity\e11_insertion_pod_impact")
(global boolean g_e9_started false)
(global boolean g_e8_started false)
(global boolean g_e7_started false)
(global boolean g_e6_started false)
(global boolean g_e6_pro_inf1_arrived false)
(global boolean g_e5_started false)
(global short g_e5_grunts_released 0)
(global boolean g_e4_started false)
(global boolean g_e3_started false)
(global boolean g_e2_started false)
(global boolean g_e2_safe_to_migrate_inf2 false)
(global boolean g_e1_started false)
(global unit g_e1_wounded_elite none)
(global boolean g_e1_cov_inf0_should_die false)
(global boolean g_e1_pro_inf0_searching false)
(global boolean g_e1_pro_inf1_was_alerted false)
(global boolean g_e1_stealth_major_done false)
(global boolean g_e1_zealot_revealed false)
(global effect g_e1_pod_impact_effect "effects\scenarios\solo\earthcity\e11_insertion_pod_impact")


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

(script static void 08_intro_01_predict_stub
    (begin
        (wake 08_intro_01_predict)
    )
)

(script static void 08_intra1_01_predict_stub
    (begin
        (wake 08_intra1_01_predict)
    )
)

(script static void 08_intra1_02_predict_stub
    (begin
        (wake 08_intra1_02_predict)
    )
)

(script static void 08_intra1_03_predict_stub
    (begin
        (wake 08_intra1_03_predict)
    )
)

(script dormant void c08_intro_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intro\foley\c08_intro_01_fol" none 1.0)
        (print "c08_intro foley 01 start")
    )
)

(script dormant void intro_fov
    (begin
        (sleep 279)
        (print "fov change: 70 -> 50 over 0 ticks")
        (camera_pan 50.0 0)
    )
)

(script dormant void intro_dof
    (begin
        (sleep 484)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.0 0.0 0.5 0.5 0.0)
        (print "rack focus")
        (sleep 60)
        (print "rack focus")
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.5 1.0 0.5 0.0 1.0)
        (sleep 103)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void effect_teleport
    (begin
        (sleep 240)
        (print "effect - teleport")
        (effect_new_on_object_marker "effects\gameplay\cinematic_teleport" "teleport" "marker")
    )
)

(script dormant void cinematic_lighting_intro
    (begin
        (cinematic_lighting_set_primary_light 16.0 -32.0 0.501961 0.501961 0.4)
        (cinematic_lighting_set_secondary_light 13.0 120.0 0.231373 0.231373 0.388235)
        (cinematic_lighting_set_ambient_light 0.14902 0.14902 0.101961)
        (object_uses_cinematic_lighting "dervish" true)
        (object_uses_cinematic_lighting "intro_plasma_rifle" true)
    )
)

(script dormant void plasma_rifle_attach
    (begin
        (sleep 705)
        (objects_attach "dervish" "right_hand_elite" "intro_plasma_rifle" "")
    )
)

(script static void c08_intro_setup
    (begin
        (object_create_anew "dervish")
        (object_create_anew "teleport")
        (object_create_anew "intro_plasma_rifle")
        (object_cinematic_lod "dervish" true)
        (wake c08_intro_foley_01)
        (wake effect_teleport)
        (wake intro_fov)
        (wake plasma_rifle_attach)
        (wake cinematic_lighting_intro)
    )
)

(script static void c08_intro
    (begin
        (sound_class_enable_ducker "amb" 0.0 0)
        (sound_cache_flush)
        (animation_cache_flush)
        (crash deltacontrolroom_bsp0)
        (sleep 1)
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "deltacliffs_intro")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 70.0 0)
        (sound_class_enable_ducker "amb" 1.0 60)
        (08_intro_01_predict_stub)
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intro\foley\c08_intro_01_fol")
        (sleep 100)
        (c08_intro_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intro\08_intro" "08_intro_01" none "anchor_flag_intro")
        (custom_animation_relative "dervish" "objects\characters\dervish\08_intro\08_intro" "dervish_01" false "anchor_intro")
        (cinematic_start 0.0 0.0 0.0 30)
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (sound_class_enable_ducker "amb" 0.0 15)
        (sleep 15)
        (object_destroy "dervish")
        (object_destroy "intro_plasma_rifle")
    )
)

(script dormant void c08_intra1_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_01_fol" none 1.0)
        (print "c08_intra1 foley 01 start")
    )
)

(script dormant void c08_2010_soc
    (begin
        (sleep 461)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2010_soc" "commander" 1.0)
        (attract_mode_set_seconds "c08_2010_soc" 3.0)
    )
)

(script dormant void c04_intra1_dof_01
    (begin
        (rasterizer_profile_include_all)
        (time_code_reset true)
        (rasterizer_profile_include true)
        (sleep 80)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.5 0.0 0.0 0.0 0.5 0.5 0.0)
        (print "rack focus")
        (rasterizer_profile_include_all)
        (sleep 120)
        (cinematic_screen_effect_set_crossfade2 1.5 0.0 0.5 0.5 0.5 0.0 0.5)
        (print "rack focus")
        (rasterizer_profile_include_all)
        (sleep 50)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.0 0.0 0.5 0.5 0.0)
        (print "rack focus")
        (rasterizer_profile_include_all)
        (sleep 86)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void cinematic_lighting_intra1_01
    (begin
        (cinematic_lighting_set_primary_light 40.0 134.0 0.321569 0.321569 0.290196)
        (cinematic_lighting_set_secondary_light 8.0 274.0 0.301961 0.290196 0.45098)
        (cinematic_lighting_set_ambient_light 0.121569 0.121569 0.0705882)
        (object_uses_cinematic_lighting "dervish_01" true)
        (object_uses_cinematic_lighting "commander" true)
        (object_uses_cinematic_lighting "wraith_01" true)
        (object_uses_cinematic_lighting "scarab_01" true)
    )
)

(script static void c08_intra1_01_setup
    (begin
        (object_create_anew "dervish_01")
        (object_create_anew "commander")
        (object_create_anew "wraith_01")
        (object_cinematic_lod "dervish_01" true)
        (object_cinematic_lod "commander" true)
        (object_cinematic_lod "wraith_01" true)
        (ice_cream_flavor_stock "dervish_01" "right_hand_elite" "")
        (wake c08_intra1_foley_01)
        (wake c08_2010_soc)
        (wake c04_intra1_dof_01)
        (wake cinematic_lighting_intra1_01)
    )
)

(script static void c08_intra1_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "deltacliffs_intra1")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 50.0 0)
        (online_message_send)
        (08_intra1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_01_fol")
        (sleep prediction_offset)
        (c08_intra1_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra1\08_intra1" "08_intra1_01" none "anchor_flag_intra1")
        (custom_animation_relative "dervish_01" "objects\characters\dervish\08_intra1\08_intra1" "dervish_01" false "anchor_intra1")
        (custom_animation_relative "commander" "objects\characters\elite\08_intra1\08_intra1" "commander_01" false "anchor_intra1")
        (custom_animation_relative "wraith_01" "objects\vehicles\wraith\08_intra1\08_intra1" "wraith_01" false "anchor_intra1")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra1_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra1\music\c08_intra1_02_mus")
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_02_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c08_intra1_sound_scene2_01
    (begin
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (object_set_function_variable "phantom_01" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_02" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_01" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_02" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_01" "hover_audio" 1.0 0.0)
        (object_set_function_variable "phantom_02" "hover_audio" 1.0 0.0)
        (sleep 210)
        (sound_class_enable_ducker "vehicle" 1.0 60)
        (sleep 60)
        (sound_class_enable_ducker "vehicle" 0.0 150)
    )
)

(script dormant void c08_intra1_score_02
    (begin
        (sleep 337)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra1\music\c08_intra1_02_mus" none 1.0)
        (print "c08_intra1 score 02 start")
    )
)

(script dormant void c08_intra1_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_02_fol" none 1.0)
        (print "c08_intra1 foley 02 start")
    )
)

(script dormant void c08_2020_der
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2020_der" "dervish_01" 1.0)
        (attract_mode_set_seconds "c08_2020_der" 3.0)
    )
)

(script dormant void c08_2030_soc
    (begin
        (sleep 77)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2030_soc" "commander" 1.0)
        (attract_mode_set_seconds "c08_2030_soc" 4.0)
    )
)

(script dormant void c04_intra1_dof_02
    (begin
        (sleep 427)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.22 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 84)
        (cinematic_screen_effect_set_crossfade2 0.5 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 100)
        (cinematic_screen_effect_set_crossfade2 0.5 0.5 0.0 0.0 0.0 0.5 0.5)
        (print "rack focus")
    )
)

(script dormant void cinematic_lighting_intra1_02
    (begin
        (cinematic_lighting_set_primary_light 40.0 134.0 0.321569 0.321569 0.290196)
        (cinematic_lighting_set_secondary_light 8.0 274.0 0.301961 0.290196 0.45098)
        (cinematic_lighting_set_ambient_light 0.121569 0.121569 0.0705882)
        (object_uses_cinematic_lighting "phantom_01" true)
        (object_uses_cinematic_lighting "phantom_02" true)
    )
)

(script static void c08_intra1_02_setup
    (begin
        (object_create_anew "phantom_01")
        (object_create_anew "phantom_02")
        (object_cinematic_lod "phantom_01" true)
        (object_cinematic_lod "phantom_02" true)
        (wake c08_intra1_sound_scene2_01)
        (wake c08_intra1_score_02)
        (wake c08_intra1_foley_02)
        (wake c08_2020_der)
        (wake c08_2030_soc)
        (wake cinematic_lighting_intra1_02)
    )
)

(script static void c08_intra1_02_cleanup
    (begin
        (object_destroy "dervish_01")
        (object_destroy "commander")
        (object_destroy "phantom_02")
    )
)

(script static void c08_intra1_scene_02
    (begin
        (c08_intra1_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra1\08_intra1" "08_intra1_02" none "anchor_flag_intra1")
        (custom_animation_relative "dervish_01" "objects\characters\dervish\08_intra1\08_intra1" "dervish_02" false "anchor_intra1")
        (custom_animation_relative "commander" "objects\characters\elite\08_intra1\08_intra1" "commander_02" false "anchor_intra1")
        (custom_animation_relative "wraith_01" "objects\vehicles\wraith\08_intra1\08_intra1" "wraith_02" false "anchor_intra1")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\08_intra1\08_intra1" "phantom01_02" false "anchor_intra1")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\08_intra1\08_intra1" "phantom02_02" false "anchor_intra1")
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra1_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_03_fol")
        (sleep (camera_set_pan))
        (c08_intra1_02_cleanup)
    )
)

(script dormant void c08_intra1_sound_scene3_01
    (begin
        (object_set_function_variable "phantom_01" "engine_hack" 0.0 0.0)
        (object_set_function_variable "phantom_02" "engine_hack" 0.0 0.0)
        (object_set_function_variable "phantom_01" "engine_audio" 0.0 0.0)
        (object_set_function_variable "phantom_02" "engine_audio" 0.0 0.0)
        (object_set_function_variable "phantom_01" "hover_audio" 0.0 0.0)
        (object_set_function_variable "phantom_02" "hover_audio" 0.0 0.0)
        (sound_class_enable_ducker "vehicle" 1.0 30)
        (sleep 120)
        (object_set_function_variable "phantom_01" "engine_hack" 1.0 180.0)
        (object_set_function_variable "phantom_02" "engine_hack" 1.0 180.0)
        (object_set_function_variable "phantom_01" "engine_audio" 1.0 180.0)
        (object_set_function_variable "phantom_02" "engine_audio" 1.0 180.0)
        (object_set_function_variable "phantom_01" "hover_audio" 1.0 180.0)
        (object_set_function_variable "phantom_02" "hover_audio" 1.0 180.0)
        (sound_class_enable_ducker "vehicle" 0.0 180)
    )
)

(script dormant void c08_intra1_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_03_fol" none 1.0)
        (print "c08_intra1 foley 03 start")
    )
)

(script dormant void c08_2040_tar
    (begin
        (sleep 268)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2040_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_2040_tar" 2.0)
    )
)

(script dormant void cinematic_lighting_intra1_03
    (begin
        (cinematic_lighting_set_primary_light 40.0 134.0 0.321569 0.321569 0.290196)
        (cinematic_lighting_set_secondary_light 8.0 274.0 0.301961 0.290196 0.45098)
        (cinematic_lighting_set_ambient_light 0.121569 0.121569 0.0705882)
        (object_uses_cinematic_lighting "tartarus" true)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "monitor" true)
        (object_uses_cinematic_lighting "brute_01" true)
        (object_uses_cinematic_lighting "brute_02" true)
        (object_uses_cinematic_lighting "brute_03" true)
        (object_uses_cinematic_lighting "brute_04" true)
    )
)

(script dormant void show_brutes
    (begin
        (sleep 199)
        (print "show brutes")
        (object_hide "brute_01" false)
        (object_hide "brute_02" false)
        (object_hide "brute_03" false)
        (object_hide "brute_04" false)
    )
)

(script dormant void door_close
    (begin
        (sleep 430)
        (print "door close")
        (device_set_position "intra1_door" 0.0)
    )
)

(script static void c08_intra1_03_setup
    (begin
        (object_create_anew "tartarus")
        (object_create_anew "miranda")
        (object_create_anew "monitor")
        (object_create_anew "brute_01")
        (object_create_anew "brute_02")
        (object_create_anew "brute_03")
        (object_create_anew "brute_04")
        (object_set_function_variable "monitor" "talking" 0.0 0.0)
        (object_cinematic_lod "tartarus" true)
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "monitor" true)
        (object_cinematic_lod "brute_01" true)
        (object_cinematic_lod "brute_02" true)
        (object_cinematic_lod "brute_03" true)
        (object_cinematic_lod "brute_04" true)
        (object_hide "brute_01" true)
        (object_hide "brute_02" true)
        (object_hide "brute_03" true)
        (object_hide "brute_04" true)
        (object_create_anew "intra1_door")
        (device_set_position_immediate "intra1_door" 1.0)
        (wake show_brutes)
        (wake door_close)
        (wake c08_intra1_sound_scene3_01)
        (wake c08_intra1_foley_03)
        (wake c08_2040_tar)
        (wake cinematic_lighting_intra1_03)
    )
)

(script static void c08_intra1_03_cleanup
    (begin
        (object_destroy "tartarus")
        (object_destroy "miranda")
        (object_destroy "monitor")
        (object_destroy_containing "brute")
        (object_destroy "phantom_01")
    )
)

(script static void c08_intra1_scene_03
    (begin
        (online_message_send)
        (c08_intra1_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra1\08_intra1" "08_intra1_03" none "anchor_flag_intra1")
        (custom_animation_relative "tartarus" "objects\characters\brute\08_intra1\08_intra1" "tartarus_03" false "anchor_intra1")
        (custom_animation_relative "miranda" "objects\characters\miranda\08_intra1\08_intra1" "miranda_03" false "anchor_intra1")
        (custom_animation_relative "monitor" "objects\characters\monitor\08_intra1\08_intra1" "monitor_03" false "anchor_intra1")
        (custom_animation_relative "brute_01" "objects\characters\brute\08_intra1\08_intra1" "brute01_03" false "anchor_intra1")
        (custom_animation_relative "brute_02" "objects\characters\brute\08_intra1\08_intra1" "brute02_03" false "anchor_intra1")
        (custom_animation_relative "brute_03" "objects\characters\brute\08_intra1\08_intra1" "brute03_03" false "anchor_intra1")
        (custom_animation_relative "brute_04" "objects\characters\brute\08_intra1\08_intra1" "brute04_03" false "anchor_intra1")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\08_intra1\08_intra1" "phantom01_03" false "anchor_intra1")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c08_intra1_03_cleanup)
        (predict_animation)
    )
)

(script static void c08_intra1
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash deltacontrolroom_bsp0)
        (sleep 1)
        (c08_intra1_scene_01)
        (c08_intra1_scene_02)
        (c08_intra1_scene_03)
        (predict_animation)
    )
)

(script static boolean player_in_vehicle
    (begin
        (or
            (unit_in_vehicle (unit (player0)))
            (and
                (game_can_use_flashlights)
                (unit_in_vehicle (unit (player1)))
            )
        )
    )
)

(script static boolean players_in_vehicle
    (begin
        (and
            (unit_in_vehicle (unit (player0)))
            (or
                (not (game_can_use_flashlights))
                (unit_in_vehicle (unit (player1)))
            )
        )
    )
)

(script static void cinematic_intro
    (begin
        (if (cinematic_skip_start) 
            (begin
                (c08_intro)
            )
        )
        (cinematic_skip_stop)
    )
)

(script static void cinematic_outro
    (begin
        (if (cinematic_skip_start) 
            (begin
                (c08_intra1)
            )
        )
        (cinematic_skip_stop)
    )
)

(script dormant void objective0_set
    (begin
        (sleep 30)
        (print "new objective set: defend yourself from the brutes")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective0_clear
    (begin
        (print "objective complete: defend yourself from the brutes")
        (update_remote_camera 0)
    )
)

(script dormant void objective1_set
    (begin
        (sleep 30)
        (print "new objective set: exact vengeance on the traitor brutes")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective1_clear
    (begin
        (print "objective complete: exact vengeance on the traitor brutes")
        (update_remote_camera 1)
    )
)

(script dormant void objective2_set
    (begin
        (sleep 30)
        (print "new objective set: continue to the canyon floor")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective2_clear
    (begin
        (print "objective complete: continue to the canyon floor")
        (update_remote_camera 2)
    )
)

(script dormant void objective3_set
    (begin
        (sleep 30)
        (print "new objective set: raze the brute encampment")
        (input_suppress_vibration 3)
    )
)

(script dormant void music_08a_01_stop
    (begin
        (print "music 08a_01 stop")
        (sound_looping_set_scale "scenarios\solo\08a_deltacliffs\08a_music\08a_01")
    )
)

(script dormant void music_08a_01_start_alt
    (begin
        (print "music 08a_01 start alt")
        (sound_class_show_channel "scenarios\solo\08a_deltacliffs\08a_music\08a_01" true)
    )
)

(script dormant void music_08a_01_start
    (begin
        (print "music 08a_01 start")
        (sound_looping_stop_immediately "scenarios\solo\08a_deltacliffs\08a_music\08a_01" none 1.0)
    )
)

(script dormant void music_08a_02_stop
    (begin
        (print "music 08a_02 stop")
        (sound_looping_set_scale "scenarios\solo\08a_deltacliffs\08a_music\08a_02")
    )
)

(script dormant void music_08a_02_start
    (begin
        (print "music 08a_02 start")
        (sound_looping_stop_immediately "scenarios\solo\08a_deltacliffs\08a_music\08a_02" none 1.0)
    )
)

(script dormant void music_08a_03_stop
    (begin
        (print "music 08a_03 stop")
        (sound_looping_set_scale "scenarios\solo\08a_deltacliffs\08a_music\08a_03")
    )
)

(script dormant void music_08a_03_start_alt
    (begin
        (print "music 08a_01 start alt")
        (sound_class_show_channel "scenarios\solo\08a_deltacliffs\08a_music\08a_03" true)
    )
)

(script dormant void music_08a_03_start
    (begin
        (print "music 08a_03 start")
        (sound_looping_stop_immediately "scenarios\solo\08a_deltacliffs\08a_music\08a_03" none 1.0)
    )
)

(script dormant void music_08a_04_start
    (begin
        (print "music 08a_04 start")
        (sound_looping_stop_immediately "scenarios\solo\08a_deltacliffs\08a_music\08a_04" none 1.0)
    )
)

(script dormant void music_08a_05_start
    (begin
        (print "music 08a_05 start")
        (sound_looping_stop_immediately "scenarios\solo\08a_deltacliffs\08a_music\08a_05" none 1.0)
    )
)

(script dormant void chapter_title0
    (begin
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title0")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_title1
    (begin
        (show_hud_help_text 0.0 0.5)
        (cinematic_set_title true)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_title2
    (begin
        (show_hud_help_text 0.0 0.5)
        (cinematic_set_title true)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title2")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script static boolean e10_player_dismounted
    (begin
        (or
            (not (unit_in_vehicle (unit (player0))))
            (not (unit_in_vehicle (unit (player1))))
        )
    )
)

(script static boolean e10_pro_inf_alerted
    (begin
        (or
            (>= (ai_combat_status "e10_pro_inf0") ai_combat_status_certain)
            (>= (ai_combat_status "e10_pro_inf1") ai_combat_status_certain)
        )
    )
)

(script static boolean e10_player_holding_launcher
    (begin
        (unit_has_weapon (unit (player0)) "objects\weapons\support_high\rocket_launcher\rocket_launcher.weapon")
    )
)

(script static boolean e10_pro_phantom0_should_retreat
    (begin
        (or
            (>= (object_model_targets_destroyed (ai_vehicle_get "e10_pro_phantom0/phantom0") "target_front") 3)
            (<= (object_get_health (ai_vehicle_get "e10_pro_phantom0/phantom0")) 0.05)
        )
    )
)

(script command_script void cs_e10_pro_phantom0_entry
    (begin
        (cs_fly_by e10_pro_phantom0_entry/p0)
        (cs_fly_by e10_pro_phantom0_entry/p1)
        (cs_fly_to e10_pro_phantom0_entry/p2)
        (cs_fly_by e10_pro_phantom0_entry/p3)
        (cs_enable_targeting true)
        (if (> (ai_spawn_count "e10_pro_ghosts0_1") 0) 
            (begin
                (cs_fly_to e10_pro_phantom0_entry/p3_1 0.5)
                (sleep 20)
                (vehicle_unload (ai_vehicle_get "e10_pro_phantom0/phantom0") phantom_sc)
                (sleep 40)
                (cs_fly_by e10_pro_phantom0_entry/p3)
            )
        )
        (cs_enable_moving true)
        (sleep_until (e10_pro_phantom0_should_retreat) 30 one_minute)
        (cs_enable_moving false)
        (cs_enable_targeting false)
        (cs_fly_to e10_pro_phantom0_entry/p3)
        (cs_fly_by e10_pro_phantom0_entry/p2)
        (cs_fly_by e10_pro_phantom0_entry/p4)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e10_weapon_scene0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (set g_e10_weapon_scene0_actor (ai_get_unit ai_current_actor))
        (cs_go_to e10_armory/p0)
        (cs_look true e10_armory/rocket_launchers)
        (sleep 10)
        (print "elite: what vulgar weapons")
        (ai_play_line ai_current_actor "0500")
        (sleep 30)
        (cs_look_player true)
        (sleep 45)
    )
)

(script command_script void cs_e10_weapon_scene1
    (begin
        (cs_look_object true (ai_vehicle_get "e10_pro_phantom0/phantom0"))
        (sleep 30)
        (cs_look_player true)
        (sleep 15)
        (print "elite: perhaps i spoke too soon")
        (sleep (ai_play_line_at_player ai_current_actor "0510"))
    )
)

(script command_script void cs_e10_pro_inf1_0_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (cs_go_to e10_patrol/p0)
                (cs_enable_looking false)
                (cs_look true e10_patrol/f0)
                (sleep (random_range 90 120))
                (cs_look false e10_patrol/f0)
                (cs_enable_looking true)
                (cs_go_to e10_patrol/p1)
                (cs_enable_looking false)
                (cs_look true e10_patrol/f1)
                (sleep (random_range 90 120))
                (cs_look false e10_patrol/f1)
                (cs_enable_looking true)
                false
            )
        )
    )
)

(script command_script void cs_e10_pro_inf1_0_patrol1
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (sleep_until 
            (begin
                (cs_go_to e10_patrol/p2)
                (cs_movement_mode ai_movement_combat)
                (cs_aim true e10_patrol/s0)
                (cs_look true e10_patrol/s0)
                (sleep (random_range 30 60))
                (cs_shoot_point true e10_patrol/s0)
                (sleep (random_range 60 150))
                (cs_shoot_point false e10_patrol/s0)
                (cs_look false e10_patrol/s0)
                (cs_aim false e10_patrol/s0)
                (cs_movement_mode ai_movement_patrol)
                (cs_go_to e10_patrol/p3)
                (cs_look true e10_patrol/f1)
                (sleep (random_range 90 120))
                (cs_look false e10_patrol/f1)
                false
            )
        )
    )
)

(script command_script void cs_e10_pro_ghosts0_entry
    (begin
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e10_pro_ghosts0/p0)
    )
)

(script dormant void e10_pod0_insertion
    (begin
        (ai_place "e10_cov_inf0/elite0")
        (object_create "e10_pod0_inserter")
        (objects_attach "e10_pod0_inserter" "pod_attach" (ai_vehicle_get "e10_cov_inf0/elite0") "pod_attach")
        (sleep 1)
        (device_set_position "e10_pod0_inserter" 1.0)
        (sleep_until (>= (device_get_position "e10_pod0_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e10_pod_impact_effect (ai_vehicle_get "e10_cov_inf0/elite0") "pod_attach")
        (objects_detach "e10_pod0_inserter" (ai_vehicle_get "e10_cov_inf0/elite0"))
        (object_destroy "e10_pod0_inserter")
        (sleep (random_range 20 45))
        (ai_vehicle_exit "e10_cov_inf0/elite0")
        (sleep 10)
        (object_damage_damage_section (ai_vehicle_get "e10_cov_inf0/elite0") "door" 500.0)
    )
)

(script dormant void e10_pod1_insertion
    (begin
        (ai_place "e10_cov_inf0/elite1")
        (object_create "e10_pod1_inserter")
        (objects_attach "e10_pod1_inserter" "pod_attach" (ai_vehicle_get "e10_cov_inf0/elite1") "pod_attach")
        (sleep 1)
        (device_set_position "e10_pod1_inserter" 1.0)
        (sleep_until (>= (device_get_position "e10_pod1_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e10_pod_impact_effect (ai_vehicle_get "e10_cov_inf0/elite1") "pod_attach")
        (objects_detach "e10_pod1_inserter" (ai_vehicle_get "e10_cov_inf0/elite1"))
        (object_destroy "e10_pod1_inserter")
        (sleep (random_range 20 45))
        (ai_vehicle_exit "e10_cov_inf0/elite1")
        (sleep 10)
        (object_damage_damage_section (ai_vehicle_get "e10_cov_inf0/elite1") "door" 500.0)
    )
)

(script dormant void e10_pod2_insertion
    (begin
        (ai_place "e10_cov_inf0/elite2")
        (object_create "e10_pod2_inserter")
        (objects_attach "e10_pod2_inserter" "pod_attach" (ai_vehicle_get "e10_cov_inf0/elite2") "pod_attach")
        (sleep 1)
        (device_set_position "e10_pod2_inserter" 1.0)
        (sleep_until (>= (device_get_position "e10_pod2_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e10_pod_impact_effect (ai_vehicle_get "e10_cov_inf0/elite2") "pod_attach")
        (objects_detach "e10_pod2_inserter" (ai_vehicle_get "e10_cov_inf0/elite2"))
        (object_destroy "e10_pod2_inserter")
        (sleep (random_range 20 45))
        (ai_vehicle_exit "e10_cov_inf0/elite2")
        (sleep 10)
        (object_damage_damage_section (ai_vehicle_get "e10_cov_inf0/elite2") "door" 500.0)
    )
)

(script dormant void e10_pod3_insertion
    (begin
        (ai_place "e10_cov_inf0/elite3")
        (object_create "e10_pod3_inserter")
        (objects_attach "e10_pod3_inserter" "pod_attach" (ai_vehicle_get "e10_cov_inf0/elite3") "pod_attach")
        (sleep 1)
        (device_set_position "e10_pod3_inserter" 1.0)
        (sleep_until (>= (device_get_position "e10_pod3_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e10_pod_impact_effect (ai_vehicle_get "e10_cov_inf0/elite3") "pod_attach")
        (objects_detach "e10_pod3_inserter" (ai_vehicle_get "e10_cov_inf0/elite3"))
        (object_destroy "e10_pod3_inserter")
        (sleep (random_range 20 45))
        (ai_vehicle_exit "e10_cov_inf0/elite3")
        (sleep 10)
        (object_damage_damage_section (ai_vehicle_get "e10_cov_inf0/elite3") "door" 500.0)
    )
)

(script dormant void e10_weapon_scene
    (begin
        (sleep_until 
            (and
                (volume_test_objects "tv_e10_armory" (players))
                (volume_test_objects "tv_e10_armory" (ai_actors "e10_cov_inf0"))
            )
        )
        (sleep_until (ai_scene "e10_weapon_scene0" cs_e10_weapon_scene0 "e10_cov_inf0") 15)
        (sleep_until (not (volume_test_objects "tv_e10_armory" (players))) 15)
        (sleep_until (ai_scene "e10_weapon_scene1" cs_e10_weapon_scene1 (object_get_ai g_e10_weapon_scene0_actor)) 15)
    )
)

(script dormant void e10_fallback_checkpoint0
    (begin
        (sleep_until (volume_test_objects "tv_e10_armory" (players)))
        (game_save_no_timeout)
    )
)

(script dormant void e10_pro_phantom0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e10_armory_entrance" (players))
                (volume_test_objects "tv_e10_second_half" (players))
            ) 
        15)
        (game_save_no_timeout)
        (ai_place "e10_pro_phantom0")
        (cs_run_command_script "e10_pro_phantom0/phantom0" cs_e10_pro_phantom0_entry)
        (if (<= (ai_living_count "e10_pro_wraith0") 0) 
            (ai_place_in_vehicle "e10_pro_ghosts0_1" "e10_pro_phantom0"))
    )
)

(script dormant void e10_pro_ghosts0_main
    (begin
        (sleep_until (volume_test_objects "tv_e10_pro_inf2_retreat0" (players)) 15)
        (ai_place "e10_pro_ghosts0_0")
        (sleep_until (volume_test_objects "tv_e10_pro_inf2_retreat2" (players)) 15)
        (ai_place "e10_pro_ghosts0_0")
    )
)

(script dormant void e10_pro_wraith0_main
    (begin
        (ai_place "e10_pro_wraith0")
        (sleep_until (<= (ai_living_count "e10_pro_wraith0") 0) 15)
        (game_save_no_timeout)
    )
)

(script dormant void e10_pro_inf3_main
    (begin
        (ai_place "e10_pro_inf3" 1)
        (sleep_until (volume_test_objects "tv_e10_bridge" (players)) 15)
        (ai_place "e10_pro_inf3")
        (sleep_until (volume_test_objects "tv_e10_second_half" (players)) 15)
        (ai_place "e10_pro_inf3" (- 2.0 (ai_living_count "e10_pro_inf3")))
        (ai_set_orders "e10_pro_inf3" "e10_pro_inf3_retreat0")
    )
)

(script dormant void e10_pro_inf2_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e10_armory_entrance" (players))
                (volume_test_objects "tv_e10_second_half" (players))
            ) 
        15)
        (sleep_until 
            (or
                (<= (ai_living_count "e10_pro_wraith0_1") 0)
                (volume_test_objects "tv_e10_pro_inf2_retreat0" (players))
            ) 
        15)
        (ai_place "e10_pro_inf2_0" (pin (- 7.0 (ai_living_count "prophets")) 2.0 4.0))
        (sleep_until (volume_test_objects "tv_e10_pro_inf2_retreat0" (players)) 15)
        (wake e10_fallback_checkpoint0)
        (sleep 60)
        (ai_place "e10_pro_inf2_1" (pin (- 7.0 (ai_living_count "prophets")) 0.0 4.0))
        (sleep_until (volume_test_objects "tv_e10_near_exit" (players)) 15)
        (ai_place "e10_pro_inf2_1" (pin (- 7.0 (ai_living_count "prophets")) 0.0 4.0))
        (sleep_until (volume_test_objects "tv_e10_pro_inf2_retreat2" (players)) 15)
        (ai_place "e10_pro_inf2_1" (pin (- 7.0 (ai_living_count "prophets")) 0.0 4.0))
    )
)

(script dormant void e10_pro_inf1_main
    (begin
        (ai_place "e10_pro_inf1_0")
        (sleep_until (e10_pro_inf_alerted))
        (sleep_until (volume_test_objects "tv_e10_inf1_1_init" (players)) 15 300)
        (ai_place "e10_pro_inf1_1")
        (sleep_until (volume_test_objects "tv_e10_inf1_2_init" (players)) 15)
        (if (difficulty_normal) 
            (set g_e10_pro_inf1_2_count 3))
        (sleep_until 
            (or
                (game_all_quiet)
                (volume_test_objects "tv_e10_pro_inf1_do_or_die" (players))
            ) 
        15)
        (game_save_no_timeout)
        (sleep_until 
            (begin
                (if (<= (ai_living_count "e10_pro_inf1") 2) 
                    (begin
                        (game_save_no_timeout)
                        (sleep_until (volume_test_objects "tv_e10_armory_entrance" (players)) 15 450)
                        (ai_place "e10_pro_inf1_2" (pin (- 4.0 (ai_living_count "e10_pro_inf1")) 1.0 g_e10_pro_inf1_2_count))
                        (set g_e10_pro_inf1_2_count (- g_e10_pro_inf1_2_count 1.0))
                    )
                )
                (or
                    (<= g_e10_pro_inf1_2_count 0)
                    (volume_test_objects "tv_e10_armory_entrance" (players))
                )
            ) 
        15)
        (if (volume_test_objects "tv_e10_armory_entrance" (players)) 
            (ai_disposable "e10_pro_inf1" true))
        (sleep_until (<= (ai_living_count "e10_pro_inf1") 0))
        (game_save_no_timeout)
    )
)

(script dormant void e10_pro_inf0_main
    (begin
        (ai_place "e10_pro_inf0_0")
        (sleep_until 
            (or
                (volume_test_objects "tv_e10_armory_entrance" (players))
                (volume_test_objects "tv_e10_second_half" (players))
            ) 
        15)
        (game_save_no_timeout)
    )
)

(script dormant void e10_cov_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e10_bridge" (players)) 15)
        (sleep_until (<= (ai_living_count "e10_pro_wraith0_0") 0))
        (wake e10_pod0_insertion)
        (sleep 30)
        (wake e10_pod1_insertion)
        (wake e10_weapon_scene)
    )
)

(script dormant void e10_cov_ghosts0_main
    (begin
        (ai_migrate "e9_cov_ghosts0" "e10_cov_ghosts0")
    )
)

(script dormant void e10_key
    (begin
        (if (not (difficulty_legendary)) 
            (sleep_forever))
        (object_create "key")
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
            )
        )
        (reset_dsp_image 7)
    )
)

(script dormant void e10_main
    (begin
        (sleep_until (volume_test_objects "tv_e10_main_begin" (players)) 15)
        (set g_e10_started true)
        (print "e10_main")
        (data_mine_insert "e10_brute_camp")
        (game_save_no_timeout)
        (wake music_08a_04_start)
        (wake chapter_title2)
        (wake objective2_clear)
        (wake objective3_set)
        (wake e10_cov_ghosts0_main)
        (wake e10_cov_inf0_main)
        (wake e10_pro_inf0_main)
        (wake e10_pro_inf1_main)
        (wake e10_pro_inf2_main)
        (wake e10_pro_inf3_main)
        (wake e10_pro_ghosts0_main)
        (wake e10_pro_wraith0_main)
        (wake e10_key)
        (sleep_until 
            (and
                (volume_test_objects "tv_e10_exit_door" (players))
                (> (device_get_position "e10_exit_door") 0.0)
            ) 
        15)
    )
)

(script static void test_brute_camp
    (begin
        (object_teleport (player0) "e10_test")
        (ai_place "e10_cov_ghosts0")
        (if (not g_e10_started) 
            (wake e10_main))
        (ai_place "e9_pro_inf3")
    )
)

(script command_script void cs_e9_pro_inf1_trap
    (begin
        (cs_enable_dialogue true)
        (cs_abort_on_damage true)
        (cs_face_object true "e9_trap_target0")
        (sleep_until (volume_test_objects "tv_e9_trap_trigger0" (players)) 5)
        (cs_face_object false "e9_trap_target0")
        (cs_shoot true "e9_trap_target0")
        (sleep_until 
            (or
                (<= (object_get_health "e9_trap_target0") 0.0)
                (volume_test_objects "tv_e9_trap_trigger1" (players))
            ) 
        2)
        (cs_shoot false "e9_trap_target0")
        (sleep_until (volume_test_objects "tv_e9_trap_trigger1" (players)) 5)
        (cs_shoot true "e9_trap_target1")
        (sleep_until (<= (object_get_health "e9_trap_target1") 0.0) 2 30)
        (sleep (random_range 20 60))
    )
)

(script command_script void cs_e9_pro_inf1_abort
    (begin
        (sleep 1)
    )
)

(script command_script void cs_e9_pro_phantom0_overflight
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e9_pro_phantom0/p0)
        (cs_fly_by e9_pro_phantom0/p1)
        (cs_fly_by e9_pro_phantom0/p2)
        (cs_fly_by e9_pro_phantom0/p3)
        (ai_erase ai_current_squad)
    )
)

(script dormant void e9_weather_control
    (begin
        (cinematic_clone_players_weapon 120.0)
        (sleep_until (volume_test_objects "tv_e9_first_drop" (players)) 15)
        (cinematic_clone_players_weapon 90.0)
        (sleep_until (volume_test_objects "tv_e9_trap_trigger1" (players)) 15)
        (cinematic_clone_players_weapon 60.0)
        (sleep_until (volume_test_objects "tv_e9_pro_inf3_begin" (players)) 15)
        (cinematic_clone_players_weapon 30.0)
        (sleep_until (volume_test_objects "tv_e10_entrance" (players)) 15)
        (cinematic_clone_players_weapon 15.0)
    )
)

(script dormant void e9_pro_phantom0_main
    (begin
        (ai_place "e9_pro_phantom0")
    )
)

(script dormant void e9_pro_inf3_main
    (begin
        (sleep_until (volume_test_objects "tv_e9_pro_inf3_begin" (players)) 15)
        (game_save_no_timeout)
        (ai_place "e9_pro_inf3")
    )
)

(script dormant void e9_pro_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e9_first_drop" (players)) 15)
        (ai_place "e9_pro_inf2" (pin (- 10.0 (ai_living_count "prophets")) 2.0 4.0))
    )
)

(script dormant void e9_pro_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e9_first_drop" (players)) 15)
        (ai_place "e9_pro_inf1")
        (cs_run_command_script "e9_pro_inf1" cs_e9_pro_inf1_trap)
        (sleep_until (volume_test_objects "tv_e9_trap_trigger0" (players)) 5)
        (sleep_until (< (ai_strength "e9_pro_inf1") 0.9) 15 300)
        (cs_run_command_script "e9_pro_inf1" cs_e9_pro_inf1_abort)
    )
)

(script dormant void e9_pro_inf0_main
    (begin
        (ai_place "e9_pro_inf0_0" (pin (- 10.0 (ai_living_count "prophets")) 0.0 2.0))
        (ai_place "e9_pro_inf0_1" (pin (- 10.0 (ai_living_count "prophets")) 0.0 2.0))
        (sleep_until 
            (or
                (volume_test_objects "tv_e9_trap_trigger0" (players))
                (<= (ai_living_count "e9_pro_inf0") 0)
            ) 
        5)
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_e9_trap_trigger0" (players)) 5)
        (ai_place "e9_pro_inf0_2" (pin (- 10.0 (ai_living_count "prophets")) 0.0 2.0))
    )
)

(script dormant void e9_cov_ghosts0_main
    (begin
        (ai_place "e9_cov_ghosts0")
        (sleep_until 
            (and
                (<= (ai_living_count "e8_pro_spectre0") 0)
                (<= (ai_living_count "e8_pro") 2)
            )
        )
        (ai_migrate "e8_cov_inf0" "e9_cov_ghosts0")
        (ai_migrate "e8_cov_ghosts0" "e9_cov_ghosts0")
    )
)

(script dormant void e9_main
    (begin
        (sleep_until (volume_test_objects "tv_e9_main_begin" (players)) 15)
        (set g_e9_started true)
        (print "e9_main")
        (data_mine_insert "e9_ski_run")
        (game_save_no_timeout)
        (wake music_08a_03_stop)
        (wake e10_main)
        (wake e9_cov_ghosts0_main)
        (wake e9_pro_inf0_main)
        (wake e9_pro_inf1_main)
        (wake e9_pro_inf2_main)
        (wake e9_pro_inf3_main)
        (wake e9_pro_phantom0_main)
        (wake e9_weather_control)
        (sleep_until g_e10_started)
        (sleep_forever e9_pro_inf0_main)
        (sleep_forever e9_pro_inf1_main)
        (sleep_forever e9_pro_inf2_main)
        (sleep_forever e9_pro_inf3_main)
        (sleep_forever e9_pro_phantom0_main)
        (ai_disposable "e9_pro" true)
        (ai_disposable "e9_pro_phantom0" false)
    )
)

(script static void test_ski_run
    (begin
        (object_teleport (player0) "e9_test")
        (ai_place "e9_cov_ghosts0")
        (if (not g_e9_started) 
            (wake e9_main))
    )
)

(script command_script void cs_e8_cov_inf0_init
    (begin
        (cs_enable_dialogue true)
        (cs_movement_mode ai_movement_patrol)
        (ai_disregard (ai_get_object ai_current_actor) true)
        (cs_enable_looking true)
        (sleep_until (ai_trigger_test "generic_player_sighted" ai_current_squad) 10)
        (cs_movement_mode ai_movement_flee)
        (cs_enable_moving true)
        (sleep_until (volume_test_objects "tv_e8_spectre_begin" (players)) 15)
        (sleep_until 
            (or
                (and
                    (> (ai_spawn_count "e8_pro_spectre0") 0)
                    (<= (ai_living_count "e8_pro_spectre0") 1)
                )
                (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 2.0)
            ) 
        10 450)
        (sleep (random_range 0 45))
        (cs_movement_mode ai_movement_combat)
        (ai_vehicle_enter ai_current_actor (ai_vehicle_get_from_starting_location "e8_cov_inf0/turret0"))
        (ai_disregard (ai_get_object ai_current_actor) false)
    )
)

(script dormant void e8_pro_spectre0_main
    (begin
        (sleep 30)
        (sleep_until 
            (or
                (volume_test_objects "tv_e8_exit" (players))
                (<= (ai_living_count "e8_pro") 2)
            ) 
        15)
        (ai_place "e8_pro_spectre0")
        (sleep 1)
        (ai_vehicle_reserve_seat (ai_vehicle_get "e8_pro_spectre0/starting_locations_0") "spectre_p_l" true)
        (wake music_08a_03_start_alt)
        (sleep_until (<= (ai_living_count "e8_pro_spectre0") 0))
        (wake music_08a_03_stop)
    )
)

(script dormant void e8_pro_inf2_main
    (begin
        (ai_place "e8_pro_inf2")
    )
)

(script dormant void e8_pro_inf1_main
    (begin
        (ai_place "e8_pro_inf1_0")
        (sleep_until 
            (or
                (<= (ai_living_count "e8_pro_inf1") 0)
                (volume_test_objects "tv_e8_exit" (players))
            )
        )
        (ai_place "e8_pro_inf1_1" (- 4.0 (ai_living_count "e8_pro_inf1")))
    )
)

(script dormant void e8_pro_inf0_main
    (begin
        (ai_place "e8_pro_inf0")
    )
)

(script dormant void e8_cov_inf0_main
    (begin
        (ai_place "e8_cov_inf0" (pin (- 6.0 (ai_living_count "covenant")) 4.0 6.0))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e8_cov_inf0/ghost0") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e8_cov_inf0/ghost1") true)
        (sleep_until (volume_test_objects "tv_e9_main_begin" (players)) 15)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e8_cov_inf0/ghost0") false)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e8_cov_inf0/ghost1") false)
    )
)

(script dormant void e8_cov_ghosts0_main
    (begin
        (ai_migrate "e7_cov_ghosts0" "e8_cov_ghosts0")
        (ai_migrate "e7_cov_ghosts1" "e8_cov_ghosts0")
    )
)

(script dormant void e8_main
    (begin
        (sleep_until (volume_test_objects "tv_e8_main_begin" (players)) 15)
        (set g_e8_started true)
        (print "e8_main")
        (data_mine_insert "e8_kidney1")
        (game_save_no_timeout)
        (animation_cache_stats_reset 120.0)
        (wake e9_main)
        (wake e8_cov_inf0_main)
        (wake e8_cov_ghosts0_main)
        (wake e8_pro_inf0_main)
        (wake e8_pro_inf1_main)
        (wake e8_pro_inf2_main)
        (wake e8_pro_spectre0_main)
        (sleep_until g_e9_started)
        (sleep_forever e8_cov_ghosts0_main)
        (sleep_forever e8_pro_inf0_main)
        (sleep_forever e8_pro_inf1_main)
        (sleep_forever e8_pro_inf2_main)
        (sleep_forever e8_pro_spectre0_main)
        (ai_disposable "e8_pro" true)
    )
)

(script command_script void cs_e7_cov_grunt0
    (begin
        (cs_movement_mode ai_movement_patrol)
        (ai_disregard (ai_get_object ai_current_actor) true)
        (cs_enable_looking true)
        (sleep_until 
            (or
                (ai_trigger_test "generic_player_sighted" ai_current_squad)
                (>= (ai_combat_status "e7_pro_inf0_0") ai_combat_status_active)
            ) 
        15)
        (cs_enable_dialogue true)
        (cs_face_player true)
        (sleep (random_range 25 45))
        (cs_movement_mode ai_movement_flee)
        (cs_face_player false)
        (cs_enable_looking true)
        (cs_go_to e7_patrol/p0_2)
        (sleep_until 
            (and
                (not (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost0") "c_turret_ap_d" (ai_actors "e7_pro_inf0")))
                (not (volume_test_objects "tv_e7_grunts_unsafe" (ai_actors "e7_pro_inf0")))
            ) 
        60)
        (cs_movement_mode ai_movement_combat)
        (sleep (random_range 25 45))
        (ai_disregard (ai_get_object ai_current_actor) false)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost0") false)
        (ai_vehicle_enter ai_current_actor (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost0"))
    )
)

(script command_script void cs_e7_cov_grunt1
    (begin
        (cs_movement_mode ai_movement_patrol)
        (ai_disregard (ai_get_object ai_current_actor) true)
        (cs_enable_looking true)
        (sleep_until 
            (or
                (ai_trigger_test "generic_player_sighted" ai_current_squad)
                (>= (ai_combat_status "e7_pro_inf0_0") ai_combat_status_active)
            ) 
        15)
        (cs_enable_dialogue true)
        (cs_face_player true)
        (sleep (random_range 25 45))
        (cs_movement_mode ai_movement_flee)
        (cs_face_player false)
        (cs_enable_looking true)
        (cs_go_to e7_patrol/p1_2)
        (sleep_until 
            (and
                (not (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost0") "c_turret_ap_d" (ai_actors "e7_pro_inf0")))
                (not (volume_test_objects "tv_e7_grunts_unsafe" (ai_actors "e7_pro_inf0")))
            ) 
        60)
        (cs_movement_mode ai_movement_combat)
        (sleep (random_range 25 45))
        (ai_disregard (ai_get_object ai_current_actor) false)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost1") false)
        (ai_vehicle_enter ai_current_actor (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost1"))
    )
)

(script dormant void e7_pro_inf2_main
    (begin
        (ai_place "e7_pro_inf2")
    )
)

(script static void e7_pro_inf1_spawn
    (begin
        (sleep_until (not (volume_test_objects "tv_e7_pro_inf1_0_unsafe" (players))) 10 60)
        (if (not (volume_test_objects "tv_e7_pro_inf1_0_unsafe" (players))) 
            (ai_place "e7_pro_inf1_0") (if (not (volume_test_objects "tv_e7_end_section" (players))) 
                (ai_place "e7_pro_inf1_1") (if (not (volume_test_objects "tv_e7_pro_inf1_2_unsafe" (players))) 
                    (ai_place "e7_pro_inf1_2"))
            )
        )
    )
)

(script dormant void e7_pro_inf1_main
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "e7_pro_inf0") 1)
                (volume_test_objects "tv_e7_middle_section" (players))
            ) 
        15)
        (ai_migrate "e7_pro_inf0" "e7_pro_inf1_0")
        (sleep_until 
            (begin
                (if (<= (ai_living_count "e7_pro_inf") 2) 
                    (e7_pro_inf1_spawn))
                (or
                    (volume_test_objects "tv_e8_main_begin" (players))
                    (>= (ai_spawn_count "e7_pro_inf1") 16)
                )
            ) 
        15)
    )
)

(script dormant void e7_pro_inf0_main
    (begin
        (ai_place "e7_pro_inf0_0" (pin (- 10.0 (ai_living_count "prophets")) 1.0 3.0))
        (ai_place "e7_pro_inf0_1")
    )
)

(script dormant void e7_cov_ghosts1_main
    (begin
        (ai_place "e7_cov_ghosts1" (pin (- 4.0 (ai_living_count "e7_cov_ghosts0")) 2.0 4.0))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost0") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost1") true)
        (sleep_until (not (volume_test_objects "tv_e7_grunts_unsafe" (ai_actors "e7_pro_inf0"))) 60)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost0") false)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e7_cov_ghosts1/ghost1") false)
    )
)

(script dormant void e7_cov_ghosts0_main
    (begin
        (ai_migrate "e6_cov" "e7_cov_ghosts0")
        (wake e7_cov_ghosts1_main)
    )
)

(script dormant void e7_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e7_main_begin0" (players))
                (volume_test_objects "tv_e7_main_begin1" (players))
            ) 
        15)
        (set g_e7_started true)
        (print "e7_main")
        (data_mine_insert "e7_kidney0")
        (game_save_no_timeout)
        (wake music_08a_03_start)
        (wake e8_main)
        (wake e7_cov_ghosts0_main)
        (wake e7_pro_inf0_main)
        (wake e7_pro_inf1_main)
        (wake e7_pro_inf2_main)
        (sleep_until g_e8_started)
        (sleep_forever e7_cov_ghosts0_main)
        (sleep_forever e7_cov_ghosts1_main)
        (sleep_forever e7_pro_inf0_main)
        (sleep_forever e7_pro_inf1_main)
        (sleep_forever e7_pro_inf2_main)
        (sleep_until g_e8_started)
        (ai_disposable "e7_pro" true)
    )
)

(script static void test_kidney0
    (begin
        (object_teleport (player0) "e7_test")
        (if (not g_e7_started) 
            (wake e7_main))
        (sleep 1)
        (drop "objects\vehicles\ghost\ghost")
    )
)

(script command_script void cs_e6_weapon_scene
    (begin
        (sleep (ai_play_line_at_player ai_current_actor "0480"))
    )
)

(script dormant void e6_weapon_scene
    (begin
        (sleep_until 
            (or
                (ai_scene "e6_weapon_scene" cs_e6_weapon_scene "e6_cov")
                (<= (ai_living_count "e6_pro_inf1") 0)
            ) 
        15 two_minutes)
        (sleep_until (ai_scene "e6_weapon_scene" cs_e6_weapon_scene "e6_cov") 15 300)
    )
)

(script command_script void cs_e6_pro_phantom0_entry
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e6_pro_phantom0_entry/p0)
        (cs_vehicle_boost false)
        (cs_fly_by e6_pro_phantom0_entry/p0_1)
        (cs_fly_to_and_face e6_pro_phantom0_entry/p1 e6_pro_phantom0_entry/p2 1.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_to e6_pro_phantom0_entry/p2 0.5)
        (sleep_until 
            (or
                (ai_trigger_test "e6_player_exited_onto_ledge" "e6_pro_inf1")
                g_e7_started
                (volume_test_objects "tv_e6_ledge0" (players))
                (volume_test_objects "tv_e6_ledge1" (players))
            ) 
        15)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) true)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_a)
        (sleep 100)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_b)
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) false)
        (set g_e6_pro_inf1_arrived true)
        (wake e6_weapon_scene)
        (cs_vehicle_speed 1.0)
        (cs_fly_to_and_face e6_pro_phantom0_entry/p3 e6_pro_phantom0_entry/p2)
    )
)

(script command_script void cs_e6_pro_phantom0_exit
    (begin
        (cs_fly_to_and_face e6_pro_phantom0_exit/p0 e6_pro_phantom0_exit/p1)
        (cs_vehicle_boost true)
        (cs_fly_to e6_pro_phantom0_exit/p1)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e6_pro_inf0_1_firing
    (begin
        (cs_abort_on_damage true)
        (cs_aim true e6_pro_inf0_ambush/p0)
        (cs_crouch true)
        (sleep_until (> (device_get_position "e6_ghost_ledge_door") 0.0) 15)
        (cs_enable_dialogue true)
        (sleep 15)
        (cs_aim false e6_pro_inf0_ambush/p0)
        (cs_enable_targeting true)
        (sleep_until 
            (or
                (volume_test_objects "tv_e6_on_ledge0" (players))
                (< (ai_strength ai_current_squad) 0.95)
            ) 
        10 90)
        (sleep_until (< (ai_strength ai_current_squad) 0.95) 10 60)
    )
)

(script command_script void cs_e6_pro_inf0_0_firing
    (begin
        (cs_abort_on_damage true)
        (cs_aim true e6_pro_inf0_ambush/p0)
        (sleep_until (> (device_get_position "e6_ghost_ledge_door") 0.0) 15)
        (cs_enable_dialogue true)
        (sleep 15)
        (cs_aim false e6_pro_inf0_ambush/p0)
        (cs_enable_targeting true)
        (sleep_until 
            (or
                (volume_test_objects "tv_e6_on_ledge0" (players))
                (< (ai_strength ai_current_squad) 0.95)
            ) 
        10 90)
    )
)

(script command_script void cs_e6_pro_inf1_entry
    (begin
        (cs_vehicle_boost true)
        (cs_go_to e6_pro_inf1_entry/p0)
        (ai_vehicle_exit ai_current_actor)
    )
)

(script static boolean e6_pro_phantom0_should_retreat
    (begin
        (or
            (>= (object_model_targets_destroyed (ai_vehicle_get "e6_pro_phantom0/phantom0") "target_front") 3)
            (<= (object_get_health (ai_vehicle_get "e6_pro_phantom0/phantom0")) 0.05)
        )
    )
)

(script dormant void e6_objectives
    (begin
        (sleep_until (> (ai_spawn_count "e6_pro_phantom0") 0))
        (sleep_until 
            (or
                (e6_pro_phantom0_should_retreat)
                (volume_test_objects "tv_e7_main_begin0" (players))
                (volume_test_objects "tv_e7_main_begin1" (players))
            )
        )
        (wake objective1_clear)
        (wake objective2_set)
    )
)

(script dormant void e6_pro_phantom0_main
    (begin
        (sleep_until (> (device_get_position "e6_ghost_ledge_door") 0.0) 15)
        (sleep_until (volume_test_objects "tv_e6_on_ledge0" (players)) 15 210)
        (ai_place "e6_pro_phantom0")
        (sleep_until g_e6_pro_inf1_arrived)
        (sleep_until 
            (or
                g_e7_started
                (>= (object_model_targets_destroyed (ai_vehicle_get "e6_pro_phantom0/phantom0") "target_front") 3)
                (<= (object_get_health (ai_vehicle_get "e6_pro_phantom0/phantom0")) 0.05)
                (and
                    g_e6_pro_inf1_arrived
                    (<= (ai_living_count "e6_pro_inf1") 0)
                )
            )
        )
        (cs_run_command_script "e6_pro_phantom0/phantom0" cs_e6_pro_phantom0_exit)
    )
)

(script dormant void e6_pro_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e6_pro_inf1_begin" (players)) 15)
        (ai_place "e6_pro_inf1" (pin (- 6.0 (ai_living_count "e6_pro_inf0")) 2.0 6.0))
    )
)

(script dormant void e6_pro_inf0_main
    (begin
        (ai_place "e6_pro_inf0")
        (sleep 6)
        (objects_predict (ai_actors "e6_pro_inf0"))
    )
)

(script dormant void e6_cov_ghosts0_main
    (begin
        (ai_place "e6_cov_ghosts0")
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e6_cov_ghosts0/ghost0") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e6_cov_ghosts0/ghost2") true)
        (sleep_until g_e6_pro_inf1_arrived)
        (sleep_until 
            (or
                (and
                    (<= (ai_living_count "e6_pro_inf0") 0)
                    (<= (ai_living_count "e6_pro_inf1") 0)
                    (> (ai_spawn_count "e6_pro_inf1") 0)
                )
                g_e7_started
                (player_in_vehicle)
            ) 
        30 two_minutes)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e6_cov_ghosts0/ghost0") false)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "e6_cov_ghosts0/ghost2") false)
        (ai_migrate "e6_cov_inf0" "e6_cov_ghosts0")
        (ai_migrate "e6_cov_gold_elite" "e6_cov_ghosts0")
        (ai_enter_squad_vehicles "e6_cov_ghosts0")
        (sleep_until (player_in_vehicle))
        (wake music_08a_03_start)
    )
)

(script dormant void e6_cov_gold_elite_main
    (begin
        (ai_migrate "e5_cov_gold_elite" "e6_cov_gold_elite")
        (ai_teleport_to_starting_location_if_outside_bsp "e6_cov_gold_elite")
    )
)

(script dormant void e6_cov_inf1_main
    (begin
        (sleep 1)
    )
)

(script dormant void e6_cov_grunts0_main
    (begin
        (ai_migrate "e5_cov_grunts0" "e6_cov_grunts0")
        (ai_teleport_to_starting_location_if_outside_bsp "e6_cov_grunts0")
    )
)

(script dormant void e6_cov_inf0_main
    (begin
        (ai_migrate "e5_cov_inf0" "e6_cov_inf0")
        (ai_teleport_to_starting_location_if_outside_bsp "e6_cov_inf0")
    )
)

(script dormant void e6_main
    (begin
        (sleep_until 
            (and
                (volume_test_objects "tv_e6_main_begin" (players))
                (= (version) 0)
            ) 
        15)
        (set g_e6_started true)
        (print "e6_main")
        (data_mine_insert "e6_ghost_ledge")
        (game_save_no_timeout)
        (device_operates_automatically_set "e6_ghost_ledge_door" true)
        (wake chapter_title1)
        (wake e7_main)
        (wake e6_cov_inf0_main)
        (wake e6_cov_gold_elite_main)
        (wake e6_cov_ghosts0_main)
        (wake e6_cov_grunts0_main)
        (wake e6_pro_inf0_main)
        (wake e6_pro_inf1_main)
        (sleep_until g_e7_started)
        (ai_disposable "e6_pro" true)
        (ai_disposable "e6_pro_phantom0" false)
    )
)

(script static void test_ghost_ledge
    (begin
        (object_teleport (player0) "e6_test")
        (ai_place "e6_cov_inf0")
        (ai_place "e6_cov_gold_elite")
        (if (not g_e6_started) 
            (wake e6_main))
    )
)

(script command_script void cs_e5_cov_gold_elite_creep
    (begin
        (cs_enable_dialogue true)
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e5_cov_gold_elite_creep/p0)
        (cs_crouch true)
        (sleep_until (>= (ai_combat_status "e5_pro_inf0") ai_combat_status_dangerous))
        (sleep 60)
        (cs_go_to e5_cov_gold_elite_creep/p1)
        (sleep_forever)
    )
)

(script command_script void cs_e5_cov_gold_elite_attack
    (begin
        (cs_crouch false)
    )
)

(script command_script void cs_e5_cov_grunts0_cower
    (begin
        (cs_movement_mode ai_movement_flee)
        (ai_disregard ai_current_actor true)
        (sleep_until 
            (or
                (< (ai_living_count "e5_pro") 3)
                (<= (ai_strength "e5_cov_grunts0") 0.8)
                (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.75)
                (>= g_e5_grunts_released 2)
            ) 
        15)
        (set g_e5_grunts_released (+ g_e5_grunts_released 1.0))
        (cs_enable_dialogue true)
        (cs_look_player true)
        (sleep (random_range 15 45))
        (ai_disregard ai_current_actor false)
    )
)

(script dormant void e5_pro_inf1_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e5_exit" (players))
                (and
                    (<= (ai_living_count "e5_pro_inf0") 3)
                    (> (ai_spawn_count "e5_pro_inf0") 0)
                )
            ) 
        20)
        (ai_place "e5_pro_inf1" (pin (- 10.0 (ai_living_count "prophets")) 1.0 4.0))
    )
)

(script dormant void e5_pro_inf0_main
    (begin
        (ai_place "e5_pro_inf0" (pin (- 10.0 (ai_living_count "prophets")) 2.0 6.0))
        (ai_vehicle_reserve (ai_vehicle_get "e5_pro_inf0/turret0") true)
    )
)

(script dormant void e5_cov_grunts0_main
    (begin
        (ai_place "e5_cov_grunts0" (pin (- 10.0 (+ (ai_living_count "covenant") (ai_living_count "prophets"))) 1.0 5.0))
    )
)

(script dormant void e5_cov_gold_elite_main
    (begin
        (ai_migrate "e4_cov_gold_elite" "e5_cov_gold_elite")
        (ai_renew "e5_cov_gold_elite")
        (cs_run_command_script "e5_cov_gold_elite" cs_e5_cov_gold_elite_creep)
        (sleep_until 
            (or
                (< (ai_strength "e5_cov_gold_elite") 1.0)
                (< (ai_strength "e5_pro_inf0") 0.5)
                (volume_test_objects "tv_e5_lower_level" (players))
            ) 
        5)
        (cs_run_command_script "e5_cov_gold_elite" cs_e5_cov_gold_elite_attack)
        (ai_set_orders "e5_cov_gold_elite" "e5_cov_gold_elite_killomatic")
    )
)

(script dormant void e5_cov_inf0_main
    (begin
        (ai_migrate "e4_cov_inf0" "e5_cov_inf0")
        (ai_renew "e5_cov_inf0")
        (wake e5_cov_grunts0_main)
    )
)

(script dormant void e5_main
    (begin
        (sleep_until (volume_test_objects "tv_e5_main_begin" (players)) 15)
        (set g_e5_started true)
        (print "e5_main")
        (data_mine_insert "e5_ramp_room1")
        (game_save_no_timeout)
        (wake e5_cov_inf0_main)
        (wake e5_cov_gold_elite_main)
        (wake e5_pro_inf0_main)
        (wake e5_pro_inf1_main)
        (sleep_until g_e6_started)
        (sleep_forever e5_cov_inf0_main)
        (sleep_forever e5_cov_gold_elite_main)
        (sleep_forever e5_pro_inf0_main)
        (sleep_forever e5_pro_inf1_main)
        (ai_disposable "e5_pro" true)
    )
)

(script static void test_ramp_room2
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e5_test")
        (ai_place "e5_cov_inf0")
        (ai_place "e5_cov_gold_elite")
        (if (not g_e5_started) 
            (wake e5_main))
        (if (not g_e6_started) 
            (wake e6_main))
    )
)

(script command_script void cs_e4_alarm_scene
    (begin
        (cs_switch "brute0")
        (sleep (ai_play_line ai_current_actor "0450"))
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e4_alarm_scene/p0)
        (sleep (ai_play_line ai_current_actor "0400"))
        (sleep (- (ai_play_line ai_current_actor "0440") 30.0))
    )
)

(script dormant void e4_pro_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e4_first_step" (players)) 15)
        (ai_place "e4_pro_inf2_0" (pin (- 10.0 (ai_living_count "prophets")) 1.0 4.0))
        (sleep 150)
        (sleep_until 
            (or
                (ai_scene "e4_alarm_scene" cs_e4_alarm_scene "e4_pro_inf0")
                (<= (ai_living_count "e4_pro_inf2_0") 0)
            ) 
        15)
    )
)

(script dormant void e4_pro_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e4_second_step" (players)) 15)
        (game_save_no_timeout)
        (sleep 15)
        (ai_place "e4_pro_inf1" (pin (- 10.0 (ai_living_count "prophets")) 1.0 4.0))
    )
)

(script dormant void e4_pro_inf0_main
    (begin
        (ai_place "e4_pro_inf0_0" (pin (- 10.0 (ai_living_count "prophets")) 1.0 5.0))
    )
)

(script dormant void e4_cov_gold_elite_main
    (begin
        (ai_migrate "e3_cov_gold_elite" "e4_cov_gold_elite")
        (ai_renew "e4_cov_gold_elite")
    )
)

(script dormant void e4_cov_inf0_main
    (begin
        (ai_migrate "e3_cov_inf0" "e4_cov_inf0")
        (ai_renew "e4_cov_inf0")
        (sleep_until (volume_test_objects "tv_e4_first_step" (players)) 15)
        (sleep_until 
            (or
                (volume_test_objects "tv_e4_ground_floor_exit" (players))
                (<= (ai_fighting_count "e4_pro") 2)
            ) 
        15)
        (device_operates_automatically_set "e4_door0" true)
        (ai_place "e4_cov_inf0" (pin (- 3.0 (ai_living_count "covenant")) 1.0 3.0))
        (ai_set_orders "e4_cov_inf0" "e4_cov_inf0_advance2")
    )
)

(script dormant void e4_main
    (begin
        (sleep_until (volume_test_objects "tv_e4_pre_main" (players)) 15)
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_e4_main_begin" (players)) 15)
        (set g_e4_started true)
        (print "e4_main")
        (data_mine_insert "e4_step_room")
        (wake e5_main)
        (wake e4_cov_inf0_main)
        (wake e4_cov_gold_elite_main)
        (wake e4_pro_inf0_main)
        (wake e4_pro_inf1_main)
        (wake e4_pro_inf2_main)
        (sleep_until g_e5_started)
        (sleep_forever e4_cov_inf0_main)
        (sleep_forever e4_cov_gold_elite_main)
        (sleep_forever e4_pro_inf0_main)
        (sleep_forever e4_pro_inf1_main)
        (sleep_forever e4_pro_inf2_main)
        (ai_disposable "e4_pro" true)
    )
)

(script command_script void cs_e3_alarm_scene
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e3_alarm_scene/p0)
        (sleep (ai_play_line ai_current_actor "0410"))
        (sleep (ai_play_line ai_current_actor "0440"))
    )
)

(script command_script void cs_e3_cov_grunts0_cower
    (begin
        (cs_movement_mode ai_movement_flee)
        (sleep_until 
            (and
                (ai_trigger_test "generic_player_within_2wu" ai_current_squad)
                (or
                    (not (volume_test_objects "tv_e3_lower_level" (ai_actors "e3_pro_inf0")))
                    (<= (ai_strength ai_current_squad) 0.5)
                )
            )
        )
        (cs_look_player true)
        (print "grunt scene")
        (ai_play_line_at_player ai_current_actor "0460")
        (sleep_forever)
    )
)

(script command_script void cs_e3_cov_gold_elite_charge
    (begin
        (cs_enable_dialogue true)
        (cs_go_to e3_sword_elites/p0)
        (cs_go_to e3_sword_elites/p1)
        (cs_jump 10.0 4.0)
    )
)

(script command_script void cs_e3_cov_stealth_major_charge
    (begin
        (cs_enable_pathfinding_failsafe true)
        (ai_set_active_camo ai_current_actor true)
        (cs_go_to e3_sword_elites/p2)
        (cs_go_to e3_sword_elites/p3)
        (ai_set_active_camo ai_current_actor false)
    )
)

(script dormant void e3_pro_inf1_main
    (begin
        (sleep_until 
            (and
                (> (device_get_position "e3_exit_door") 0.0)
                (volume_test_objects "tv_e3_near_exit" (players))
            ) 
        15)
        (ai_place "e3_pro_inf1")
    )
)

(script dormant void e3_pro_inf0_main
    (begin
        (sleep 5)
        (ai_place "e3_pro_inf0_0")
        (ai_place "e3_pro_inf0_1" (pin (- 8.0 (ai_living_count "prophets")) 1.0 4.0))
        (sleep_until 
            (or
                (ai_scene "e3_alarm_scene" cs_e3_alarm_scene "e3_pro_inf0")
                (<= (ai_living_count "e3_pro_inf0") 0)
            ) 
        15)
    )
)

(script dormant void e3_cov_grunts0_main
    (begin
        (ai_place "e3_cov_grunts0")
        (ai_disregard (ai_actors "e3_cov_grunts0") true)
        (cs_run_command_script "e3_cov_grunts0" cs_e3_cov_grunts0_cower)
    )
)

(script dormant void e3_cov_gold_elite_main
    (begin
        (ai_migrate "e2_cov_gold_elite" "e3_cov_gold_elite")
        (ai_renew "e3_cov_gold_elite")
        (cs_run_command_script "e3_cov_gold_elite" cs_e3_cov_gold_elite_charge)
    )
)

(script dormant void e3_cov_inf0_main
    (begin
        (ai_migrate "e2_cov_inf0" "e3_cov_inf0")
        (ai_renew "e3_cov_inf0")
        (cs_run_command_script (object_get_ai g_cov_stealth_major) cs_e3_cov_stealth_major_charge)
    )
)

(script dormant void e3_main
    (begin
        (sleep_until (volume_test_objects "tv_e3_main_begin" (players)) 15)
        (set g_e3_started true)
        (print "e3_main")
        (data_mine_insert "e3_ramp_room0")
        (game_save_no_timeout)
        (wake e4_main)
        (wake e3_cov_inf0_main)
        (wake e3_cov_gold_elite_main)
        (wake e3_cov_grunts0_main)
        (wake e3_pro_inf0_main)
        (wake e3_pro_inf1_main)
        (sleep_until g_e4_started)
        (sleep_forever e3_cov_inf0_main)
        (sleep_forever e3_cov_gold_elite_main)
        (sleep_forever e3_cov_grunts0_main)
        (sleep_forever e3_pro_inf0_main)
        (sleep_forever e3_pro_inf1_main)
        (ai_disposable "e3_pro" true)
    )
)

(script static void test_ramp_room1
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e3_test")
        (ai_place "e3_cov_inf0")
        (set g_cov_stealth_major (ai_get_unit "e3_cov_inf0/stealth_major"))
        (ai_place "e3_cov_gold_elite")
        (if (not g_e3_started) 
            (wake e3_main))
    )
)

(script command_script void cs_e2_alarm_scene
    (begin
        (cs_switch "brute0")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (sleep (ai_play_line_at_player ai_current_actor "0420"))
        (sleep (ai_play_line_at_player ai_current_actor "0430"))
        (cs_enable_dialogue true)
        (cs_switch "brute1")
        (cs_enable_moving false)
        (cs_enable_targeting true)
        (cs_enable_pathfinding_failsafe true)
        (cs_start_to e2_alarm_scene/p0)
        (sleep_until 
            (or
                (not (cs_moving))
                (<= (object_get_health "e2_antennae") 0.0)
            ) 
        5)
        (cs_enable_targeting false)
        (if (> (object_get_health "e2_antennae") 0.0) 
            (begin
                (cs_face_object true "e2_antennae")
                (print "brute1 operates the antennae")
                (sleep_until (<= (object_get_health "e2_antennae") 0.0) 5 60)
                (if (> (object_get_health "e2_antennae") 0.0) 
                    (begin
                        (set g_brute_alarm_level (+ g_brute_alarm_level 1.0))
                    ) (begin
                        (print "brute1 growls")
                        (sleep 20)
                    )
                )
            ) (begin
                (print "brute1 growls")
                (sleep 20)
            )
        )
    )
)

(script command_script void cs_e2_cov_grunts0_flee
    (begin
        (cs_enable_dialogue true)
        (cs_face_player true)
        (sleep (random_range 0 60))
        (cs_face_player false)
        (cs_movement_mode ai_movement_flee)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (ai_renew ai_current_actor)
                        (cs_start_to e2_cov_grunts_flee/p0)
                        (sleep_until 
                            (or
                                (not (cs_moving))
                                (< (object_get_health (ai_get_object ai_current_actor)) 1.0)
                                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 1.0)
                            ) 
                        5)
                    )
                    (begin
                        (ai_renew ai_current_actor)
                        (cs_start_to e2_cov_grunts_flee/p1)
                        (sleep_until 
                            (or
                                (not (cs_moving))
                                (< (object_get_health (ai_get_object ai_current_actor)) 1.0)
                                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 1.0)
                            ) 
                        5)
                    )
                    (begin
                        (ai_renew ai_current_actor)
                        (cs_start_to e2_cov_grunts_flee/p2)
                        (sleep_until 
                            (or
                                (not (cs_moving))
                                (< (object_get_health (ai_get_object ai_current_actor)) 1.0)
                                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 1.0)
                            ) 
                        5)
                    )
                    (begin
                        (ai_renew ai_current_actor)
                        (cs_start_to e2_cov_grunts_flee/p3)
                        (sleep_until 
                            (or
                                (not (cs_moving))
                                (< (object_get_health (ai_get_object ai_current_actor)) 1.0)
                                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 1.0)
                            ) 
                        5)
                    )
                    (begin
                        (ai_renew ai_current_actor)
                        (cs_start_to e2_cov_grunts_flee/p4)
                        (sleep_until 
                            (or
                                (not (cs_moving))
                                (< (object_get_health (ai_get_object ai_current_actor)) 1.0)
                                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 1.0)
                            ) 
                        5)
                    )
                    (begin
                        (ai_renew ai_current_actor)
                        (cs_start_to e2_cov_grunts_flee/p5)
                        (sleep_until 
                            (or
                                (not (cs_moving))
                                (< (object_get_health (ai_get_object ai_current_actor)) 1.0)
                                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 1.0)
                            ) 
                        5)
                    )
                )
                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 1.0)
            )
        )
        (ai_disregard (ai_get_object ai_current_actor) false)
        (ai_migrate ai_current_actor "e2_cov_inf0")
    )
)

(script command_script void cs_e2_cov_grunts0_abort
    (begin
        (if (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 2.0) 
            (cs_crouch true) (sleep_until (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0)))
    )
)

(script command_script void cs_e2_cov_gold_elite_charge0
    (begin
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep_until (= (version) 1))
        (cs_enable_moving false)
        (cs_enable_looking false)
        (ai_play_line ai_current_actor "0370")
        (cs_go_to e2_sword_elites/p0)
        (cs_enable_dialogue true)
        (cs_start_to e2_sword_elites/p1)
        (sleep_until 
            (or
                (not (cs_moving))
                (<= (objects_distance_to_object (ai_actors "e2_pro_inf0") (ai_get_object ai_current_actor)) 2.0)
            )
        )
    )
)

(script command_script void cs_e2_cov_stealth_elite_charge0
    (begin
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep_until (= (version) 1))
        (cs_enable_moving false)
        (cs_enable_looking false)
        (ai_renew ai_current_actor)
        (ai_set_active_camo ai_current_actor true)
        (cs_go_to e2_sword_elites/p2)
        (cs_crouch true)
        (cs_face true e2_sword_elites/p1)
        (cs_start_to e2_sword_elites/p3)
        (sleep_until 
            (or
                (<= (objects_distance_to_object (ai_actors "e2_pro_inf0") (ai_get_object ai_current_actor)) 2.0)
                (<= (ai_strength ai_current_actor) 0.75)
                (<= (ai_living_count "e2_pro_inf0") 1)
            )
        )
        (ai_set_active_camo ai_current_actor false)
    )
)

(script static void e2_cov_sword_elites_charge0
    (begin
        (cs_run_command_script "e2_cov_gold_elite" cs_e2_cov_gold_elite_charge0)
        (cs_run_command_script (object_get_ai g_cov_stealth_major) cs_e2_cov_stealth_elite_charge0)
    )
)

(script dormant void e2_alarm_scene
    (begin
        (sleep_until (>= (ai_combat_status "e2_pro_inf0") ai_combat_status_visible) 15)
        (sleep_until (ai_scene "e2_alarm_scene" cs_e2_alarm_scene "e2_pro_inf0") 15 300)
    )
)

(script dormant void e2_pro_inf3_main
    (begin
        (sleep_until 
            (or
                (and
                    (> (ai_spawn_count "e2_pro_inf1") 0)
                    (<= (ai_living_count "e2_pro_inf1") 0)
                )
                (volume_test_objects "tv_e2_pro_inf3_begin" (players))
            )
        )
        (ai_place "e2_pro_inf3" (pin (- 9.0 (ai_living_count "prophets")) 2.0 6.0))
        (sleep_until 
            (and
                (<= (ai_living_count "e2_pro_inf3") 0)
                (game_all_quiet)
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void e2_pro_inf2_main
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "e2_pro_inf0") 2)
                (volume_test_objects "tv_e2_pro_inf1_begin" (players))
            )
        )
        (ai_place "e2_pro_inf2")
    )
)

(script dormant void e2_pro_inf1_main
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "e2_pro_inf0") 0)
                (volume_test_objects "tv_e2_pro_inf1_begin" (players))
            )
        )
        (game_save_no_timeout)
        (sleep 15)
        (ai_place "e2_pro_inf1" (pin (- 6.0 (ai_living_count "e2_pro_inf0")) 0.0 4.0))
    )
)

(script dormant void e2_pro_inf0_main
    (begin
        (ai_place "e2_pro_inf0")
        (wake e2_alarm_scene)
    )
)

(script dormant void e2_cov_grunts0_main
    (begin
        (ai_place "e2_cov_grunts0")
        (ai_disregard (ai_actors "e2_cov_grunts0") true)
        (sleep_until (ai_trigger_test "generic_player_sighted" "e2_cov_grunts0") 5)
        (sleep (ai_play_line_at_player "e2_cov_grunts0/grunt0" "0330"))
        (cs_run_command_script "e2_cov_grunts0" cs_e2_cov_grunts0_flee)
        (sleep 300)
        (sleep_until 
            (and
                (<= (ai_living_count "e2_pro") 4)
                (<= (ai_fighting_count "e2_pro") 0)
            )
        )
        (cs_run_command_script "e2_cov_grunts0" cs_e2_cov_grunts0_abort)
        (ai_disregard (ai_actors "e2_cov_grunts0") false)
        (ai_migrate "e2_cov_grunts0" "e2_cov_inf0")
    )
)

(script dormant void e2_cov_gold_elite_main
    (begin
        (sleep_until g_e2_safe_to_migrate_inf2)
        (ai_migrate "e1_cov_inf2/gold_elite" "e2_cov_gold_elite")
        (ai_migrate "e1_cov_inf2" "e2_cov_inf0")
        (sleep 5)
        (ai_teleport_to_starting_location_if_outside_bsp "e2_cov_inf0")
        (ai_teleport_to_starting_location_if_outside_bsp "e2_cov_gold_elite")
        (ai_renew "e2_cov_gold_elite")
    )
)

(script dormant void e2_cov_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e2_pro_inf1_begin" (players)) 15)
        (wake music_08a_02_stop)
        (sleep_until (<= (ai_living_count "e2_cov") 1))
        (sleep_until (not (volume_test_objects "tv_e2_cov_inf1_unsafe" (players))) 15)
        (ai_place "e2_cov_inf1")
        (ai_migrate "e2_cov_inf1" "e2_cov_inf0")
    )
)

(script dormant void e2_cov_inf0_main
    (begin
        (sleep_until (> (ai_spawn_count "e1_cov_inf1") 0))
        (ai_migrate "e1_cov_inf1" "e2_cov_inf0")
        (sleep_until (= (version) 1) 15)
        (ai_teleport_to_starting_location_if_outside_bsp "e2_cov_inf0")
        (ai_renew "e2_cov_inf0")
    )
)

(script dormant void e2_main
    (begin
        (sleep_until (= (version) 1) 15)
        (set g_e2_started true)
        (print "e2_main")
        (data_mine_insert "e2_cylinder_room")
        (game_save_no_timeout)
        (wake music_08a_01_stop)
        (wake music_08a_02_start)
        (wake e3_main)
        (wake e2_cov_inf0_main)
        (wake e2_cov_inf1_main)
        (wake e2_cov_gold_elite_main)
        (wake e2_cov_grunts0_main)
        (wake e2_pro_inf0_main)
        (wake e2_pro_inf1_main)
        (wake e2_pro_inf2_main)
        (wake e2_pro_inf3_main)
        (sleep_until (volume_test_objects "tv_e2_main_end" (players)) 15)
        (sleep_forever e2_cov_inf0_main)
        (sleep_forever e2_cov_inf1_main)
        (sleep_forever e2_cov_gold_elite_main)
        (sleep_forever e2_cov_grunts0_main)
        (sleep_forever e2_pro_inf0_main)
        (sleep_forever e2_pro_inf1_main)
        (sleep_forever e2_pro_inf2_main)
        (sleep_forever e2_pro_inf3_main)
        (ai_disposable "e2_pro" true)
    )
)

(script static void test_cylinder_room
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e2_test")
        (ai_place "e2_cov_inf0")
        (set g_cov_stealth_major (ai_get_unit "e2_cov_inf0/stealth_major"))
        (ai_place "e2_cov_gold_elite")
        (if (not g_e2_started) 
            (wake e2_main))
    )
)

(script command_script void cs_e1_pro_inf0_0_patrol0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_uninspected)
        (cs_go_to e1_pro_inf0_0_patrol/p0)
        (cs_aim_object true "e1_elite0")
        (ai_play_line_at_player ai_current_actor "0230")
        (sleep 15)
        (cs_aim_object false "e1_elite0")
        (cs_shoot true "e1_elite0")
        (sleep 30)
        (cs_shoot false "e1_elite0")
        (sleep (random_range 30 60))
        (cs_go_to e1_pro_inf0_0_patrol/p1)
        (cs_aim_object true "e1_elite1")
        (sleep (random_range 60 90))
        (cs_aim_object false "e1_elite1")
        (cs_shoot true "e1_elite1")
        (sleep 30)
        (cs_shoot false "e1_elite1")
        (sleep (random_range 30 60))
        (cs_go_to e1_pro_inf0_0_patrol/p2)
        (cs_look true e1_pro_inf0_0_patrol/p2_look0)
        (sleep (random_range 45 75))
        (cs_look true e1_pro_inf0_0_patrol/p2_look1)
        (sleep (random_range 60 90))
        (cs_look false e1_pro_inf0_0_patrol/p2_look1)
        (cs_go_to e1_pro_inf0_0_patrol/p3)
        (cs_face true e1_pro_inf0_0_patrol/p3_look0)
        (sleep (random_range 210 300))
        (cs_face true e1_pro_inf0_0_patrol/p3_look1)
    )
)

(script command_script void cs_e1_pro_inf0_1_patrol0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_uninspected)
        (cs_go_to e1_pro_inf0_1_patrol/p0)
        (sleep 30)
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\brute\brute" "patrol:any:any:posing:var1" true)
        (sleep (ai_play_line ai_current_actor "0240"))
        (sleep 25)
        (ai_play_line "e1_pro_inf0_1_1/brute0" "0250")
        (sleep (random_range 90 120))
        (cs_go_to e1_pro_inf0_1_patrol/p1)
        (cs_aim_object true "e1_elite2")
        (sleep (random_range 60 90))
        (cs_aim_object false "e1_elite2")
        (cs_shoot true "e1_elite2")
        (sleep 30)
        (cs_shoot false "e1_elite2")
        (sleep (random_range 30 60))
        (if (> (ai_living_count "e1_pro_inf0_0") 0) 
            (begin
                (sleep (ai_play_line "e1_pro_inf0_0/brute0" "0260"))
                (ai_play_line "e1_pro_inf0_1/brute0" "0270")
            )
        )
        (cs_face true e1_pro_inf0_1_patrol/p1_look0)
        (sleep (random_range 60 90))
        (cs_face false e1_pro_inf0_1_patrol/p1_look0)
        (sleep_until 
            (begin
                (cs_go_to e1_pro_inf0_1_patrol/p2)
                (cs_face true e1_pro_inf0_1_patrol/p2_look0)
                (sleep (random_range 210 300))
                (cs_face false e1_pro_inf0_1_patrol/p2_look0)
                (cs_go_to e1_pro_inf0_1_patrol/p1)
                (cs_face true e1_pro_inf0_1_patrol/p1_look0)
                (sleep (random_range 210 300))
                (cs_face false e1_pro_inf0_1_patrol/p1_look0)
                false
            )
        )
    )
)

(script command_script void cs_e1_pro_inf0_1_patrol1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_uninspected)
        (cs_go_to e1_pro_inf0_2_patrol/p0)
        (cs_aim_object true "e1_elite3")
        (sleep (random_range 60 90))
        (cs_aim_object false "e1_elite3")
        (cs_shoot true "e1_elite3")
        (sleep 30)
        (cs_shoot false "e1_elite3")
        (sleep (random_range 30 60))
        (cs_go_to e1_pro_inf0_2_patrol/p1)
        (cs_aim_object true "e1_elite4")
        (sleep (random_range 60 90))
        (cs_aim_object false "e1_elite4")
        (cs_shoot true "e1_elite4")
        (sleep 30)
        (cs_shoot false "e1_elite4")
        (sleep (random_range 30 60))
        (cs_aim_object true "e1_elite5")
        (sleep (random_range 90 120))
        (cs_aim_object false "e1_elite4")
        (cs_shoot true "e1_elite4")
        (sleep 30)
        (cs_shoot false "e1_elite4")
        (sleep (random_range 30 60))
    )
)

(script command_script void cs_e1_cov_inf0_scene
    (begin
        (custom_animation_loop (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:unarmed:mortal_wound" false)
        (unit_set_maximum_vitality (ai_get_unit ai_current_actor) 5.0 0.0)
        (sleep_until (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 3.0))
        (cs_look_player true)
        (sleep (ai_play_line_at_player ai_current_actor "0200"))
        (sleep 45)
        (set g_e1_cov_inf0_should_die true)
        (unit_stop_custom_animation (ai_get_unit ai_current_actor))
        (sleep_forever)
    )
)

(script command_script void cs_e1_stealth_major_scene
    (begin
        (ai_set_active_camo ai_current_actor false)
        (cs_go_to e1_watch_pods/p1)
        (if (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 5.0) 
            (cs_look_player true) (cs_look true e1_zealot/p1))
        (print "stealth: by the prophets...")
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:sword:posing:var1" true)
        (sleep (ai_play_line_at_player ai_current_actor "0300"))
        (sleep 20)
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 5.0) 10 450)
        (cs_face_player true)
        (sleep 30)
        (sleep_until 
            (or
                (objects_can_see_object (ai_get_object ai_current_actor) (player0) 10.0)
                (and
                    (game_can_use_flashlights)
                    (objects_can_see_object (ai_get_object ai_current_actor) (player1) 10.0)
                )
            ) 
        1 30)
        (print "stealth: they have shed our brother's blood...")
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:sword:posing:var4" true)
        (sleep (ai_play_line_at_player ai_current_actor "0310"))
        (wake music_08a_02_start)
        (set g_e1_stealth_major_done true)
        (sleep_forever)
    )
)

(script command_script void cs_e1_watch_pods
    (begin
        (sleep 15)
        (cs_go_to_nearest e1_watch_pods/p0)
        (cs_look_object true (ai_vehicle_get "e1_cov_inf2/gold_elite"))
        (cs_face_object true (ai_vehicle_get "e1_cov_inf2/gold_elite"))
        (sleep_until g_e1_zealot_revealed 10)
        (print "stealth: a zealot? so much for stealth...")
        (sleep (ai_play_line_at_player ai_current_actor "0320"))
    )
)

(script command_script void cs_e1_zealot_intro
    (begin
        (cs_look true e1_zealot/p0)
        (sleep 25)
        (ai_play_line ai_current_actor "0330")
        (print "zealot: over so soon? bah")
        (cs_look true e1_zealot/p1)
        (sleep 30)
    )
)

(script dormant void e1_pod0_insertion
    (begin
        (ai_place "e1_cov_inf2/gold_elite")
        (object_create "e1_pod0_inserter")
        (objects_attach "e1_pod0_inserter" "pod_attach" (ai_vehicle_get "e1_cov_inf2/gold_elite") "pod_attach")
        (sleep 1)
        (device_set_position "e1_pod0_inserter" 1.0)
        (sleep_until (>= (device_get_position "e1_pod0_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e1_pod_impact_effect (ai_vehicle_get "e1_cov_inf2/gold_elite") "pod_attach")
        (objects_detach "e1_pod0_inserter" (ai_vehicle_get "e1_cov_inf2/gold_elite"))
        (object_destroy "e1_pod0_inserter")
        (sleep (random_range 20 45))
        (set g_e1_zealot_revealed true)
        (sleep_until (= (version) 0))
        (ai_vehicle_exit "e1_cov_inf2/gold_elite")
        (sleep 10)
        (object_damage_damage_section (ai_vehicle_get "e1_cov_inf2/gold_elite") "door" 500.0)
    )
)

(script dormant void e1_pod1_insertion
    (begin
        (ai_place "e1_cov_inf2/elite1")
        (object_create "e1_pod1_inserter")
        (objects_attach "e1_pod1_inserter" "pod_attach" (ai_vehicle_get "e1_cov_inf2/elite1") "pod_attach")
        (sleep 1)
        (device_set_position "e1_pod1_inserter" 1.0)
        (sleep_until (>= (device_get_position "e1_pod1_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e1_pod_impact_effect (ai_vehicle_get "e1_cov_inf2/elite1") "pod_attach")
        (objects_detach "e1_pod1_inserter" (ai_vehicle_get "e1_cov_inf2/elite1"))
        (object_destroy "e1_pod1_inserter")
        (sleep (random_range 20 45))
        (sleep_until (= (version) 0))
        (ai_vehicle_exit "e1_cov_inf2/elite1")
        (sleep 10)
        (object_damage_damage_section (ai_vehicle_get "e1_cov_inf2/elite1") "door" 500.0)
    )
)

(script dormant void e1_pod2_insertion
    (begin
        (ai_place "e1_cov_inf2/elite2")
        (object_create "e1_pod2_inserter")
        (objects_attach "e1_pod2_inserter" "pod_attach" (ai_vehicle_get "e1_cov_inf2/elite2") "pod_attach")
        (sleep 1)
        (device_set_position "e1_pod2_inserter" 1.0)
        (sleep_until (>= (device_get_position "e1_pod2_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e1_pod_impact_effect (ai_vehicle_get "e1_cov_inf2/elite2") "pod_attach")
        (objects_detach "e1_pod2_inserter" (ai_vehicle_get "e1_cov_inf2/elite2"))
        (object_destroy "e1_pod2_inserter")
        (sleep (random_range 20 45))
        (sleep_until (= (version) 0))
        (ai_vehicle_exit "e1_cov_inf2/elite2")
        (sleep 10)
        (object_damage_damage_section (ai_vehicle_get "e1_cov_inf2/elite2") "door" 500.0)
        (sleep 30)
        (set g_e2_safe_to_migrate_inf2 true)
    )
)

(script dormant void e1_objectives
    (begin
        (sleep 150)
        (sleep_until 
            (or
                (<= (ai_living_count "e1_cov_inf0") 0)
                (> (ai_combat_status "e1_pro") ai_combat_status_active)
            ) 
        30 one_minute)
        (wake objective0_set)
        (sleep_until (> (ai_living_count "e1_cov_inf2") 0) 15)
        (sleep 150)
        (wake objective0_clear)
        (wake objective1_set)
    )
)

(script dormant void e1_guns_aux
    (begin
        (sleep_until (volume_test_objects "tv_e1_area_entrance" (players)) 15)
        (object_create "e1_gun4")
        (sleep 1)
        (weapon_hold_trigger "e1_gun4" 0 true)
        (sleep 10)
        (weapon_hold_trigger "e1_gun4" 0 false)
        (sleep 1)
        (object_destroy "e1_gun4")
    )
)

(script dormant void e1_guns
    (begin
        (wake e1_guns_aux)
        (object_create "e1_gun0")
        (object_create "e1_gun1")
        (sleep 1)
        (weapon_hold_trigger "e1_gun0" 0 true)
        (sleep 5)
        (weapon_hold_trigger "e1_gun0" 0 false)
        (object_destroy "e1_gun0")
        (sleep 15)
        (weapon_hold_trigger "e1_gun1" 0 true)
        (sleep 5)
        (weapon_hold_trigger "e1_gun1" 0 false)
        (sleep 1)
        (object_destroy "e1_gun1")
        (sleep 90)
        (object_create "e1_gun2")
        (sleep 1)
        (weapon_hold_trigger "e1_gun2" 0 true)
        (sleep 15)
        (weapon_hold_trigger "e1_gun2" 0 false)
        (sleep 1)
        (object_destroy "e1_gun2")
        (sleep 60)
        (object_create "e1_gun3")
        (sleep 1)
        (weapon_hold_trigger "e1_gun3" 0 true)
        (sleep 30)
        (weapon_hold_trigger "e1_gun3" 0 false)
        (sleep 90)
        (weapon_hold_trigger "e1_gun3" 0 true)
        (sleep 20)
        (weapon_hold_trigger "e1_gun3" 0 false)
        (sleep 1)
        (object_destroy "e1_gun3")
    )
)

(script dormant void e1_music_aux
    (begin
        (sleep_until (volume_test_objects "tv_e1_third_wall" (players)) 15)
        (wake music_08a_01_start_alt)
    )
)

(script dormant void e1_pro_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_second_wall" (players)) 15)
        (wake e1_music_aux)
        (ai_place "e1_pro_inf1")
        (sleep_until 
            (or
                (>= (ai_combat_status "e1_pro_inf1") ai_combat_status_clear_los)
                (<= (ai_living_count "e1_pro_inf1") 0)
            ) 
        30 30_seconds)
        (print "alerted")
        (if (>= (ai_combat_status "e1_pro_inf1") ai_combat_status_clear_los) 
            (set g_e1_pro_inf1_was_alerted true))
        (sleep_until (<= (ai_combat_status "e1_pro_inf1") ai_combat_status_active) 10)
        (sleep_until (<= (ai_combat_status "e1_pro_inf1") ai_combat_status_alert) 10 240)
        (print "alerted")
        (if 
            (and
                (> (ai_living_count "e1_pro_inf1") 0)
                (> (ai_living_count "e1_pro_inf0") 0)
            ) 
                (begin
                    (if g_e1_pro_inf1_was_alerted 
                        (begin
                            (print "cpn: he's just an elite--kill him!")
                            (ai_play_line "e1_pro_inf1/brute0" "0290")
                            (sleep 20)
                            (custom_animation (ai_get_unit "e1_pro_inf1/brute0") "objects\characters\brute\brute" "combat:support:hold" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                        ) (ai_play_line "e1_pro_inf1/brute0" "0280"))
                    (sleep 30)
                    (ai_set_orders "e1_pro_inf0" "e1_pro_inf0_search")
                    (set g_e1_pro_inf0_searching true)
                )
        )
    )
)

(script dormant void e1_pro_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_pro_inf0_begin" (players)) 15)
        (ai_place "e1_pro_inf0_0")
        (ai_place "e1_pro_inf0_1")
        (ai_place "e1_pro_inf0_1_1")
        (cs_run_command_script "e1_pro_inf0_0" cs_e1_pro_inf0_0_patrol0)
        (cs_run_command_script "e1_pro_inf0_1/brute0" cs_e1_pro_inf0_1_patrol0)
        (cs_run_command_script "e1_pro_inf0_1_1/brute0" cs_e1_pro_inf0_1_patrol1)
        (sleep_until 
            (or
                (<= (ai_living_count "e1_pro_inf0") 0)
                (volume_test_objects "tv_e1_second_wall" (players))
            ) 
        15)
        (sleep 15)
        (ai_place "e1_pro_inf0_2")
        (ai_place "e1_pro_inf0_3")
        (sleep_until (<= (ai_living_count "e1_pro_inf0") 0) 15)
        (game_save_no_timeout)
    )
)

(script dormant void e1_cov_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_exit" (players)) 15)
        (sleep_until 
            (or
                g_e1_stealth_major_done
                (and
                    (> (ai_spawn_count "e1_cov_inf1") 0)
                    (<= (ai_living_count "e1_cov_inf1") 0)
                )
            )
        )
        (sleep_until (= (version) 0))
        (wake e1_pod0_insertion)
        (sleep 60)
        (wake e1_pod1_insertion)
        (sleep 15)
        (wake e1_pod2_insertion)
        (sleep_until (not (unit_in_vehicle (ai_get_unit "e1_cov_inf2/gold_elite"))) 15)
        (sleep 15)
        (if (<= (ai_living_count "e1_pro") 0) 
            (cs_run_command_script "e1_cov_inf2/gold_elite" cs_e1_zealot_intro))
        (sleep_until (volume_test_objects "tv_e1_exit" (ai_get_object "e1_cov_inf2/gold_elite")) 15)
        (if (volume_test_objects "tv_e1_ledge" (players)) 
            (begin
                (print "zlt: there are brutes to kill!")
                (ai_play_line "e1_cov_inf2/gold_elite" "0340")
            ) (begin
                (print "zlt: wait up!")
                (ai_play_line "e1_cov_inf2/gold_elite" "0350")
            )
        )
    )
)

(script dormant void e1_cov_inf1_main
    (begin
        (sleep_until 
            (or
                (and
                    (> (ai_spawn_count "e1_pro_inf1") 0)
                    (<= (ai_living_count "e1_pro_inf0") 0)
                )
                (volume_test_objects "tv_e1_exit" (players))
            ) 
        15)
        (ai_place "e1_cov_inf1")
        (set g_cov_stealth_major (ai_get_unit "e1_cov_inf1/stealth_major"))
        (sleep_until 
            (or
                (ai_scene "e1_stealth_major_scene" cs_e1_stealth_major_scene "e1_cov_inf1")
                (> (ai_spawn_count "e1_cov_inf2") 0)
            ) 
        10)
        (sleep_until 
            (and
                (<= (ai_living_count "e1_pro") 0)
                (> (ai_spawn_count "e1_cov_inf2") 0)
            ) 
        5)
        (cs_run_command_script "e1_cov_inf1" cs_e1_watch_pods)
    )
)

(script dormant void e1_cov_inf0_main
    (begin
        (ai_place "e1_cov_inf0")
        (ai_disregard (ai_actors "e1_cov_inf0") true)
        (set g_e1_wounded_elite (ai_get_unit "e1_cov_inf0"))
        (unit_kill g_e1_wounded_elite)
        (sleep 13)
        (show_hud g_e1_wounded_elite)
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\melee\energy_blade\energy_blade.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\melee\energy_blade\energy_blade.weapon")
            ) 
        10 one_minute)
        (sleep 20)
        (print "corpse: the brutes...")
        (sleep (ai_play_line_on_object g_e1_wounded_elite "0200"))
        (sleep 30)
        (game_save_no_timeout)
    )
)

(script dormant void e1_main
    (begin
        (set g_e1_started true)
        (print "e1_main")
        (data_mine_insert "e1_stealthy_insertion")
        (wake e2_main)
        (wake e1_cov_inf0_main)
        (wake e1_cov_inf1_main)
        (wake e1_cov_inf2_main)
        (wake e1_pro_inf0_main)
        (wake e1_pro_inf1_main)
        (wake e1_objectives)
        (wake e1_guns)
        (sleep_until g_e2_started)
        (ai_disposable "e1_pro" true)
        (sleep_until g_e3_started)
        (sleep_forever e1_cov_inf0_main)
        (sleep_forever e1_cov_inf1_main)
        (sleep_forever e1_cov_inf2_main)
        (sleep_forever e1_pro_inf0_main)
        (sleep_forever e1_pro_inf1_main)
        (sleep_forever e1_objectives)
        (sleep_forever e1_guns)
    )
)

(script dormant void mission_start
    (begin
        (sound_class_enable_ducker "amb" 1.0 5)
        (wake music_08a_01_start)
        (sleep 2)
        (object_cannot_take_damage (players))
        (object_hide (player0) true)
        (object_hide (player1) true)
        (cinematic_snap_to_white)
        (cinematic_intro)
        (object_teleport (player0) "player0_start")
        (object_teleport (player1) "player1_start")
        (object_hide (player0) false)
        (object_hide (player1) false)
        (object_can_take_damage (players))
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white_bars)
        (wake chapter_title0)
        (wake e1_main)
        (wake e6_main)
        (sleep_until (volume_test_objects "tv_mission_end" (players)) 15)
        (wake music_08a_05_start)
        (playtest_mission)
        (sleep 15)
        (cinematic_fade_to_white)
        (if (unit_in_vehicle (unit (player0))) 
            (object_teleport (object_get_parent (player0)) "player0_end") (object_teleport (player0) "player0_end"))
        (if (unit_in_vehicle (unit (player1))) 
            (object_teleport (object_get_parent (player1)) "player1_end") (object_teleport (player1) "player1_end"))
        (object_hide (player0) false)
        (object_hide (player1) false)
        (object_cannot_take_damage (players))
        (sleep 5)
        (cinematic_outro)
        (sleep 5)
        (game_revert)
    )
)

(script static void start
    (begin
        (wake mission_start)
    )
)

(script startup void mission_main
    (begin
        (sound_class_enable_ducker "amb" 0.0 0)
        (ai_allegiance player covenant)
        (cinematic_clone_players_weapon 0.0)
        (objectives_finish_up_to)
        (if (> (player_count) 0) 
            (start))
    )
)

(script dormant void 08_intro_01_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 13 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 18 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 15 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 86 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 114 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 11 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 118 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 93 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 103 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 95 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 81 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 65 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 109 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 4 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 138 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 47 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 72 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 60 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 88 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 76 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 134 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 38 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 36 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 133 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 136 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 130 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 8 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 19 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 20 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 124 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 53 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 122 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 125 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 123 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 32 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 126 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 132 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 44 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 33 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 23 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 16 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 22 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 26 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 27 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 12 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 28 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 8 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 9 true)
        (sleep 5)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 10 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 42 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 43 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 44 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 45 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplings\redalder_saplings" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom" 5)
        (sleep 9)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 22 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 21 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 36 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 17 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_m\redalder_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_angled\redalder_angled" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_m\redalder_m" 1)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 14 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 44 true)
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 3)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 131 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 138 false)
        (sleep 6)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 43 true)
        (sleep 24)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 true)
        (sleep 13)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 138 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 131 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 49 true)
        (sleep 9)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 131 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 46 true)
        (sleep 18)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_m\redalder_m" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 137 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 138 false)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_outdoor_toughy\lightfixture_outdoor_toughy" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 138 false)
        (sleep 20)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 39 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 49 false)
        (sleep 29)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 3 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 131 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 102 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 36 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_angled\redalder_angled" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 137 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 44 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 28 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_outdoor_toughy\lightfixture_outdoor_toughy" 0)
        (sleep 100)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 34 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 65 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 81 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 95 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 103 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 118 false)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 45)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 65 false)
        (sleep 93)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 22 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 21 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 127 false)
        (sleep 29)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 26 true)
        (sleep 22)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 34 false)
        (sleep 15)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 133 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 136 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 131 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 8 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 130 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 19 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 138 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 47 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 125 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 137 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 132 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 124 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 53 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 33 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 123 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 126 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 44 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 23 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 27 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 21 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 13 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 15 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 16 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 22 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 14 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 17 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 31 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 49 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 12 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 24 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 28 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 8 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 9 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 10 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 45 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 42 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 43 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 44 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_m\redalder_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_angled\redalder_angled" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplings\redalder_saplings" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_outdoor_toughy\lightfixture_outdoor_toughy" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplings\redalder_saplings" 2)
        (sleep 12)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (sleep 6)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 1)
        (sleep 7)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 102 false)
        (sleep 14)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (sleep 15)
        (predict_lightmap_bucket "scenarios\objects\special\invisible_box1x2x2\invisible_box1x2x2" 0)
        (sleep 5)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 24 true)
        (sleep 8)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 3 false)
        (sleep 10)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 36 true)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (sleep 6)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 29)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 34 false)
        (sleep 39)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 21 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 22 false)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 46)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 21 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 34 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 127 false)
        (sleep 9)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 91)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 127 false)
    )
)

(script dormant void 08_intra1_01_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 19 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 20 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 47 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 53 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 32 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 13 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 15 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 16 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 22 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 27 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 28 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 130 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplings\redalder_saplings" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\brute_shot\projectiles\grenade\grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\brute_plasma_rifle\brute_plasma_rifle" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\brute_plasma_rifle\brute_plasma_rifle" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple\maple" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 66)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 67)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 68)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 69)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 70)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 71)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 72)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 2)
        (sleep 80)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 30)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 16)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (sleep 25)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (sleep 11)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 39 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 38 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 40 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 17)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 66)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 67)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 68)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 69)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 70)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 71)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 72)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 3)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 8)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 9)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (sleep 9)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (sleep 13)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 false)
        (sleep 9)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 126 false)
        (sleep 31)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple\maple" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 3)
        (sleep 8)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (sleep 78)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 38 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 39 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 40 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (sleep 83)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 126 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 26 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 0 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 37)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (sleep 57)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (sleep 19)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
    )
)

(script dormant void 08_intra1_02_predict
    (begin
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple\maple" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 3)
        (sleep 57)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (sleep 11)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 25 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 125 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 53 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 124 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 23 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 126 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 32 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 123 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 0 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 8 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 9 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 10 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 45 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 42 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 43 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 44 true)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 66)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 67)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 68)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 69)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 70)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 71)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 72)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 3)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 8)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 9)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple_l\maple_l" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 156)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 26 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 14 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 0)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 72 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_m\redalder_m" 0)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 72 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 15 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 74 false)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 48 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 22 true)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_angled\redalder_angled" 0)
        (sleep 7)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 18 true)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 4)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 12)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 53 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 122 false)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (sleep 5)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 29 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 38 true)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (sleep 26)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 126 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 125 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 72 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 39 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 124 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 79 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 49 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 24 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 123 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 26 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 51 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 28 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 23 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 31 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 52 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 108 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 48 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 8 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 9 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 45 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 14 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 15 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 42 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 39 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 40 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 0 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_m\redalder_m" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple\maple" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple_l\maple_l" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 50 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 10 true)
        (sleep 31)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 43 true)
        (sleep 38)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 132 false)
        (sleep 10)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (sleep 29)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 53 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 1)
        (sleep 21)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 66)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 42 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 123 false)
    )
)

(script dormant void 08_intra1_03_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 79 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 72 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 26 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 74 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 30 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 34 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 0 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 6 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 14 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 15 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 38 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 39 true)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 40 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 66)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 67)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 68)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 69)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 70)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 71)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 72)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple\maple" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple_l\maple_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_m\redalder_m" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_angled\redalder_angled" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplings\redalder_saplings" 0)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 109 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 86 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 18 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 11 false)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (sleep 154)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 23 false)
        (sleep 21)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 124 false)
        (sleep 24)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 126 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 53 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 123 false)
        (predict_bitmap scenarios\solo\08a_deltacliffs\deltacontrolroom_bsp0 8 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (sleep 58)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
    )
)

