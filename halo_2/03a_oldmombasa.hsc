; Decompiled with Blamite
; Source file: 03a_oldmombasa.hsc
; Start time: 4/7/2022 7:17:08
; Decompilation finished in ~0.0062219s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 75)
(global boolean g_mission_over false)
(global short 15_seconds 450)
(global short 30_seconds 900)
(global short 45_seconds 900)
(global short one_minute 1800)
(global short two_minutes 3600)
(global boolean g_e13_started false)
(global boolean g_e13_creep_end0_free true)
(global boolean g_e13_creep_end1_free true)
(global boolean g_e13_creep_end2_free true)
(global boolean g_e12_started false)
(global boolean g_e11_started false)
(global boolean g_e11_cov_phantom0_leaving false)
(global vehicle g_e8_warthog none)
(global vehicle g_e10_warthog none)
(global boolean g_e10_cov_phantom0_leaving false)
(global effect g_e11_pod_impact_effect "effects\scenarios\solo\earthcity\e11_insertion_pod_impact")
(global boolean g_e10_started false)
(global boolean g_e10_cov_phantom0_arrived false)
(global boolean g_e10_cov_ghosts0_unloaded false)
(global boolean g_e9_started false)
(global boolean g_e8_started false)
(global boolean g_e8_cov_phantom0_arrived false)
(global boolean g_e8_cov_phantom0_leaving false)
(global boolean g_e8_cov_inf1_unloaded false)
(global boolean g_e7_started false)
(global boolean g_e6_started false)
(global boolean g_e5b_started false)
(global boolean g_e5b_finished false)
(global boolean g_e5_started false)
(global boolean g_e5_cov_inf1_done false)
(global short g_e5_cov_inf1_max 10)
(global short g_e5_cov_inf1_spawn_delay 30)
(global boolean g_e4_started false)
(global boolean g_e3_started false)
(global boolean g_e3_mars_pelican0_arrived false)
(global boolean g_e3_mars_pelican0_landed false)
(global boolean g_e3_johnson_should_load false)
(global boolean g_e3_johnson_in_pelican false)
(global short g_e3_cov_inf0_0_limit 12)
(global boolean g_e2_started false)
(global boolean g_e2_door_breached false)
(global boolean g_e2_cov_hunters0_active false)
(global boolean g_e1_started false)
(global short g_e1_cov_inf2_spawned 0)
(global short g_e1_cov_inf2_limit 0)
(global boolean g_e1_cov_inf2_wave0 true)
(global boolean g_e1_cov_phantom0_1_arrived false)
(global boolean g_e1_cov_phantom0_1_retreating false)
(global boolean g_e1_cov_inf4_0_arrived false)
(global boolean g_e1_mars_pelican0_appeared false)
(global boolean g_e1_mars_pelican0_departing false)
(global short g_e1_cov_snipers0_limit 2)


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

(script static void 03_intro_01_predict_stub
    (begin
        (wake 03_intro_01_predict)
    )
)

(script static void 03_intro_02_predict_stub
    (begin
        (wake 03_intro_02_predict)
    )
)

(script static void 03_intro_03_predict_stub
    (begin
        (wake 03_intro_03_predict)
    )
)

(script static void 03_intro_04_predict_stub
    (begin
        (wake 03_intro_04_predict)
    )
)

(script dormant void c03_intro_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intro\music\c03_intro_01_mus" none 1.0)
        (print "c03_intro score 01 start")
    )
)

(script dormant void c03_intro_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_01_fol" none 1.0)
        (print "c03_intro foley 01 start")
    )
)

(script dormant void c03_intro_sound_scene1_01
    (begin
        (object_set_function_variable "pelican_01" "engine_hack" 1.0 0.0)
        (object_set_function_variable "pelican_02" "engine_hack" 1.0 0.0)
        (object_set_function_variable "pelican_03" "engine_hack" 1.0 0.0)
        (object_set_function_variable "pelican_04" "engine_hack" 1.0 0.0)
        (object_set_function_variable "pelican_01" "engine_audio" 1.0 0.0)
        (object_set_function_variable "pelican_02" "engine_audio" 1.0 0.0)
        (object_set_function_variable "pelican_03" "engine_audio" 1.0 0.0)
        (object_set_function_variable "pelican_04" "engine_audio" 1.0 0.0)
        (object_set_function_variable "pelican_01" "hover_audio" 1.0 0.0)
        (object_set_function_variable "pelican_02" "hover_audio" 1.0 0.0)
        (object_set_function_variable "pelican_03" "hover_audio" 1.0 0.0)
        (object_set_function_variable "pelican_04" "hover_audio" 1.0 0.0)
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (sound_class_enable_ducker "vehicle" 1.0 115)
        (object_set_velocity "pelican_01" 8.0)
        (object_set_velocity "pelican_02" 8.0)
        (object_set_velocity "pelican_03" 8.0)
        (sleep 130)
        (sound_class_enable_ducker "vehicle" 0.0 120)
    )
)

(script dormant void c03_intro_sound_scene1_02
    (begin
        (sleep 260)
        (sound_class_enable_ducker "vehicle" 0.5 10)
    )
)

(script dormant void c03_intro_sound_scene1_03
    (begin
        (sleep 350)
        (sound_class_enable_ducker "vehicle" 0.0 10)
    )
)

(script dormant void c03_intro_sound_scene1_04
    (begin
        (sleep 435)
        (sound_class_enable_ducker "vehicle" 0.5 10)
    )
)

(script dormant void c03_1010_cor
    (begin
        (sleep 212)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1010_cor" none 1.0)
        (attract_mode_set_seconds "c03_1010_cor" 1.0)
    )
)

(script dormant void c03_1011_cor
    (begin
        (sleep 265)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1011_cor" none 1.0)
        (attract_mode_set_seconds "c03_1011_cor" 2.0)
    )
)

(script dormant void c03_1020_mir
    (begin
        (sleep 333)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1020_mir" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c03_1020_mir" 1.0)
    )
)

(script dormant void c03_1021_mir
    (begin
        (sleep 357)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1021_mir" "miranda" 1.0)
        (attract_mode_set_seconds "c03_1021_mir" 1.0)
    )
)

(script dormant void c03_1030_jon
    (begin
        (sleep 396)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1030_jon" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c03_1030_jon" 5.0)
    )
)

(script dormant void c03_1040_jon
    (begin
        (sleep 560)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1040_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_1040_jon" 4.0)
    )
)

(script dormant void c03_1050_och_1
    (begin
        (sleep 684)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1050_och" "pilot" 1.0)
        (attract_mode_set_seconds "c03_1050_och" 1.0)
    )
)

(script dormant void c03_1050_och_2
    (begin
        (sleep 684)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1050_och" "copilot" 1.0)
        (attract_mode_set_seconds "c03_1050_och" 2.0)
    )
)

(script dormant void c03_intro_shake_01_1
    (begin
        (sleep 113)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (hud_blink_health 1.5)
    )
)

(script dormant void c03_intro_shake_01_2
    (begin
        (sleep 259)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (sleep 91)
        (hud_blink_health 0.0)
        (print "shake stop")
    )
)

(script dormant void c03_intro_shake_01_3
    (begin
        (sleep 560)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
    )
)

(script dormant void c03_intro_01_dof_1
    (begin
        (sleep 436)
        (print "dof values: 12 5 5 0 0 0 0")
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 12.0 5.0 5.0 0.0 0.0 0.0 0.0)
        (sleep 123)
        (print "dof stop")
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void cinematic_light_01_city_01
    (begin
        (cinematic_lighting_set_primary_light 43.0 122.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -25.0 98.0 0.317647 0.313726 0.396078)
        (cinematic_lighting_set_ambient_light 0.101961 0.101961 0.101961)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "johnson" true)
        (object_uses_cinematic_lighting "pilot" true)
        (object_uses_cinematic_lighting "copilot" true)
        (object_uses_cinematic_lighting "pelican_01" true)
        (object_uses_cinematic_lighting "pelican_02" true)
        (object_uses_cinematic_lighting "pelican_03" true)
        (object_uses_cinematic_lighting "pelican_04" true)
        (object_uses_cinematic_lighting "iac" true)
        (object_uses_cinematic_lighting "iac_bridge" true)
        (object_uses_cinematic_lighting "carrier" true)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.6)
        (rasterizer_bloom_override_max_factor 0.5)
    )
)

(script dormant void cinematic_light_01_pelican_01
    (begin
        (sleep 259)
        (object_destroy "carrier")
        (print "destroy carrier")
        (cinematic_lighting_set_primary_light 4.0 278.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -34.0 154.0 0.14902 0.141176 0.180392)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (sleep 86)
        (cinematic_stop 1.0 1.0 1.0 5)
    )
)

(script dormant void cinematic_light_01_iac_01
    (begin
        (sleep 350)
        (object_hide "chief" true)
        (print "hide chief")
        (cinematic_lighting_set_primary_light -52.0 282.0 0.156863 0.180392 0.333333)
        (cinematic_lighting_set_secondary_light -75.0 150.0 0.121569 0.121569 0.180392)
        (cinematic_lighting_set_ambient_light 0.0588235 0.0509804 0.0392157)
        (sleep 20)
        (cinematic_start 1.0 1.0 1.0 5)
    )
)

(script dormant void cinematic_light_01_city_02
    (begin
        (sleep 435)
        (object_destroy "miranda")
        (object_destroy "iac_bridge")
        (print "destroy miranda, iac bridge")
        (cinematic_lighting_set_primary_light 43.0 122.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -25.0 98.0 0.317647 0.313726 0.396078)
        (cinematic_lighting_set_ambient_light 0.101961 0.101961 0.101961)
    )
)

(script dormant void cinematic_light_01_pelican_02
    (begin
        (sleep 558)
        (print "light pelican")
        (cinematic_lighting_set_primary_light 29.0 116.0 0.478431 0.415686 0.329412)
        (cinematic_lighting_set_secondary_light 20.0 272.0 0.235294 0.235294 0.384314)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
    )
)

(script static void c03_intro_01_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "iac")
        (object_create_anew "pelican_01")
        (object_create_anew "pelican_02")
        (object_create_anew "pelican_03")
        (object_create_anew "pelican_04")
        (object_cinematic_lod "iac" true)
        (object_cinematic_lod "pelican_01" true)
        (object_cinematic_lod "pelican_02" true)
        (object_cinematic_lod "pelican_03" true)
        (object_cinematic_lod "pelican_04" true)
        (object_cinematic_visibility "iac" true)
    )
)

(script static void c03_intro_01_setup
    (begin
        (object_create_anew "chief")
        (object_create_anew "miranda")
        (object_create_anew "johnson")
        (object_create_anew "pilot")
        (object_create_anew "copilot")
        (object_create_anew "iac_bridge")
        (object_create_anew "carrier")
        (unit_set_emotional_state "miranda" "inquisitive" 0.25 0)
        (object_set_scale "carrier" 0.4 0)
        (object_set_function_variable "carrier" "grav_lift_control" 1.0 0.0)
        (object_create_anew "intro_flak_01")
        (object_create_anew "intro_flak_02")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "pilot" true)
        (object_cinematic_lod "copilot" true)
        (object_cinematic_lod "carrier" true)
        (object_set_permutation "copilot" "head" "smith")
        (unit_set_emotional_state "johnson" "happy" 0.25 0)
        (unit_set_emotional_state "pilot" "angry" 0.25 0)
        (unit_set_emotional_state "copilot" "angry" 0.25 0)
        (wake c03_intro_score_01)
        (wake c03_intro_foley_01)
        (wake c03_intro_sound_scene1_01)
        (wake c03_intro_sound_scene1_02)
        (wake c03_intro_sound_scene1_03)
        (wake c03_intro_sound_scene1_04)
        (wake c03_1010_cor)
        (wake c03_1011_cor)
        (wake c03_1020_mir)
        (wake c03_1021_mir)
        (wake c03_1030_jon)
        (wake c03_1040_jon)
        (wake c03_1050_och_1)
        (wake c03_1050_och_2)
        (wake c03_intro_shake_01_1)
        (wake c03_intro_shake_01_2)
        (wake c03_intro_shake_01_3)
        (wake cinematic_light_01_city_01)
        (wake cinematic_light_01_pelican_01)
        (wake cinematic_light_01_iac_01)
        (wake cinematic_light_01_city_02)
        (wake cinematic_light_01_pelican_02)
    )
)

(script static void c03_intro_01_cleanup
    (begin
        (object_destroy "pelican_04")
        (hud_blink_health 0.0)
    )
)

(script static void c03_intro_scene_01
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "oldmombasa_intro")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (c03_intro_01_problem_actors)
        (03_intro_01_predict_stub)
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intro\music\c03_intro_01_mus")
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_01_fol")
        (sleep prediction_offset)
        (camera_set_animation_relative "objects\characters\cinematic_camera\03_intro\03_intro" "03_intro_01" none "anchor_flag_intro")
        (c03_intro_01_setup)
        (custom_animation_relative "chief" "objects\characters\masterchief\03_intro\03_intro" "mc_01" false "anchor_intro")
        (custom_animation_relative "johnson" "objects\characters\marine\03_intro\03_intro" "johnson_01" false "anchor_intro")
        (custom_animation_relative "miranda" "objects\characters\miranda\03_intro\03_intro" "miranda_01" false "anchor_intro")
        (custom_animation_relative "pilot" "objects\characters\marine\03_intro\03_intro" "marine1_01" false "anchor_intro")
        (custom_animation_relative "copilot" "objects\characters\marine\03_intro\03_intro" "marine2_01" false "anchor_intro")
        (custom_animation_relative "pelican_01" "objects\vehicles\pelican\03_intro\03_intro" "pel1_01" false "anchor_intro")
        (custom_animation_relative "pelican_02" "objects\vehicles\pelican\03_intro\03_intro" "pel2_01" false "anchor_intro")
        (custom_animation_relative "pelican_03" "objects\vehicles\pelican\03_intro\03_intro" "pel3_01" false "anchor_intro")
        (custom_animation_relative "pelican_04" "objects\vehicles\pelican\03_intro\03_intro" "pel4_01" false "anchor_intro")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\03_intro\03_intro" "iac_01" "anchor_intro")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\03_intro\03_intro" "iac_bridge_01" "anchor_intro")
        (sleep 10)
        (cinematic_start 0.0 0.0 0.0 60)
        (sleep (- (camera_set_pan) prediction_offset))
        (03_intro_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_02_fol")
        (sleep (camera_set_pan))
        (c03_intro_01_cleanup)
    )
)

(script command_script void cs_hog_01
    (begin
        (cs_force_combat_status 3)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (object_set_velocity (ai_vehicle_get ai_current_actor) 1.0)
        (cs_vehicle_speed 0.9)
        (ai_vehicle_enter_immediate "intro_hog_01/driver" (ai_vehicle_get_from_starting_location "intro_hog_01/hog") warthog_d)
        (sleep 1)
        (object_hide (ai_get_object ai_current_actor) true)
        (cs_go_to intro_hog_targets/p0)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_hog_02
    (begin
        (cs_force_combat_status 3)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (object_set_velocity (ai_vehicle_get ai_current_actor) 1.0)
        (cs_vehicle_speed 0.9)
        (ai_vehicle_enter_immediate "intro_hog_02/driver" (ai_vehicle_get_from_starting_location "intro_hog_02/hog") warthog_d)
        (sleep 1)
        (object_hide (ai_get_object ai_current_actor) true)
        (cs_go_to intro_hog_targets/p0)
    )
)

(script command_script void cs_hog_03
    (begin
        (cs_force_combat_status 3)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (object_set_velocity (ai_vehicle_get ai_current_actor) 1.0)
        (ai_vehicle_enter_immediate "intro_hog_03/driver" (ai_vehicle_get_from_starting_location "intro_hog_03/hog") warthog_d)
        (cs_vehicle_speed 0.9)
        (sleep 1)
        (object_hide (ai_get_object ai_current_actor) true)
        (cs_go_to intro_hog_targets/p1)
    )
)

(script command_script void cs_hog_04
    (begin
        (cs_force_combat_status 3)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (object_set_velocity (ai_vehicle_get ai_current_actor) 1.0)
        (cs_vehicle_speed 0.9)
        (ai_vehicle_enter_immediate "intro_hog_04/driver" (ai_vehicle_get_from_starting_location "intro_hog_04/hog") warthog_d)
        (sleep 1)
        (object_hide (ai_get_object ai_current_actor) true)
        (cs_go_to intro_hog_targets/p1)
    )
)

(script dormant void intro_hogs
    (begin
        (sleep 146)
        (ai_place "intro_hog_01")
        (ai_place "intro_hog_02")
        (ai_place "intro_hog_03")
        (ai_place "intro_hog_04")
        (cs_run_command_script "intro_hog_01/driver" cs_hog_01)
        (cs_run_command_script "intro_hog_02/driver" cs_hog_02)
        (cs_run_command_script "intro_hog_03/driver" cs_hog_03)
        (cs_run_command_script "intro_hog_04/driver" cs_hog_04)
    )
)

(script dormant void c03_intro_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_02_fol" none 1.0)
        (print "c03_intro foley 02 start")
    )
)

(script dormant void c03_intro_sound_scene2_01
    (begin
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (sleep 144)
        (sound_class_enable_ducker "vehicle" 0.25 0)
    )
)

(script dormant void c03_intro_sound_scene2_03
    (begin
        (sleep 145)
        (sound_class_enable_ducker "vehicle" 0.25 15)
        (sound_class_enable_ducker "vehicle" 0.5 120)
    )
)

(script dormant void c03_intro_sound_scene2_04
    (begin
        (sleep 280)
        (sound_class_enable_ducker "vehicle" 0.25 10)
        (sound_class_enable_ducker "vehicle" 0.5 75)
    )
)

(script dormant void c03_intro_sound_scene2_05
    (begin
        (sleep 480)
        (sound_class_enable_ducker "vehicle" 0.5 50)
    )
)

(script dormant void c03_1060_cor
    (begin
        (sleep 0)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1060_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c03_1060_cor" 5.0)
    )
)

(script dormant void c03_1070_cor
    (begin
        (sleep 150)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1070_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c03_1070_cor" 3.0)
    )
)

(script dormant void c03_1080_mrs
    (begin
        (sleep 290)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1080_mrs" "spotter" 1.0 "radio_default_in")
        (attract_mode_set_seconds "c03_1080_mrs" 4.0)
    )
)

(script dormant void c03_1090_dp1
    (begin
        (sleep 407)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1090_dp1" none 1.0 "radio_default_out")
        (attract_mode_set_seconds "c03_1090_dp1" 1.0)
    )
)

(script dormant void c03_intro_shake_02
    (begin
        (sleep 350)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (hud_blink_health 1.5)
    )
)

(script dormant void c03_intro_fov_01
    (begin
        (sleep 232)
        (camera_pan 36.0 0)
        (print "fov change: 50 -> 16 over 0 ticks")
        (sleep 13)
        (camera_pan 60.0 14)
        (print "fov change: 16 -> 50 over 14 ticks")
    )
)

(script dormant void cinematic_lighting_scene_02
    (begin
        (cinematic_lighting_set_primary_light 43.0 122.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -25.0 98.0 0.317647 0.313726 0.396078)
        (cinematic_lighting_set_ambient_light 0.101961 0.101961 0.101961)
        (object_uses_cinematic_lighting "sniper" true)
        (object_uses_cinematic_lighting "spotter" true)
        (object_uses_cinematic_lighting "sniper_rifle" true)
        (object_uses_cinematic_lighting "scope" true)
    )
)

(script dormant void white_flash
    (begin
        (sleep 130)
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 30)
        (cinematic_start 1.0 1.0 1.0 15)
    )
)

(script dormant void erase_hogs
    (begin
        (rasterizer_profile_include_all)
        (sleep 279)
        (print "erase hogs")
        (ai_erase "intro_hog_01")
        (ai_erase "intro_hog_02")
        (ai_erase "intro_hog_03")
        (ai_erase "intro_hog_04")
    )
)

(script static void c03_intro_02_setup
    (begin
        (object_create_anew "sniper")
        (object_create_anew "spotter")
        (object_create_anew "sniper_rifle")
        (object_create_anew "scope")
        (object_cinematic_lod "sniper" true)
        (object_cinematic_lod "spotter" true)
        (object_cinematic_lod "sniper_rifle" true)
        (object_cinematic_lod "scope" true)
        (wake c03_intro_sound_scene2_01)
        (wake c03_intro_sound_scene2_03)
        (wake c03_intro_sound_scene2_04)
        (wake c03_intro_sound_scene2_05)
        (unit_set_emotional_state "sniper" "pensive" 0.5 0)
        (unit_set_emotional_state "spotter" "pain" 0.5 0)
        (wake c03_intro_foley_02)
        (wake c03_1060_cor)
        (wake c03_1070_cor)
        (wake c03_1080_mrs)
        (wake c03_1090_dp1)
        (wake intro_hogs)
        (wake erase_hogs)
        (wake c03_intro_shake_02)
        (wake c03_intro_fov_01)
        (wake cinematic_lighting_scene_02)
        (wake white_flash)
    )
)

(script static void c03_intro_02_cleanup
    (begin
        (object_destroy "sniper")
        (object_destroy "spotter")
        (object_destroy "scope")
    )
)

(script static void c03_intro_scene_02
    (begin
        (camera_set_animation_relative "objects\characters\cinematic_camera\03_intro\03_intro" "03_intro_02" none "anchor_flag_intro")
        (c03_intro_02_setup)
        (pvs_clear "pelican_01")
        (custom_animation_relative "sniper" "objects\characters\marine\03_intro\03_intro" "sniper_02" false "anchor_intro")
        (custom_animation_relative "spotter" "objects\characters\marine\03_intro\03_intro" "spotter_02" false "anchor_intro")
        (custom_animation_relative "pelican_01" "objects\vehicles\pelican\03_intro\03_intro" "pel1_02" false "anchor_intro")
        (custom_animation_relative "pelican_02" "objects\vehicles\pelican\03_intro\03_intro" "pel2_02" false "anchor_intro")
        (custom_animation_relative "pelican_03" "objects\vehicles\pelican\03_intro\03_intro" "pel3_02" false "anchor_intro")
        (scenery_animation_start_relative "sniper_rifle" "objects\weapons\rifle\sniper_rifle\03_intro\03_intro" "sniper_rifle_02" "anchor_intro")
        (scenery_animation_start_relative "scope" "scenarios\objects\human\military\spotting_scope\03_intro\03_intro" "scope_02" "anchor_intro")
        (sleep (- (camera_set_pan) prediction_offset))
        (03_intro_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_03_fol")
        (sleep (camera_set_pan))
        (c03_intro_02_cleanup)
    )
)

(script dormant void c03_intro_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_03_fol" none 1.0)
        (print "c03_intro foley 03 start")
    )
)

(script dormant void c03_intro_sound_scene3_01
    (begin
        (sleep 635)
        (sound_class_enable_ducker "vehicle" 0.0 5)
    )
)

(script dormant void c03_intro_sound_scene3_02
    (begin
        (sleep 640)
        (sound_class_enable_ducker "vehicle" 0.5 135)
    )
)

(script dormant void c03_intro_sound_scene3_03
    (begin
        (sleep 805)
        (object_set_function_variable "pelican_01" "turn_absolute" 1.0 75.0)
        (object_set_function_variable "pelican_02" "turn_absolute" 1.0 75.0)
        (object_set_function_variable "pelican_03" "turn_absolute" 1.0 75.0)
        (object_set_function_variable "pelican_01" "banking_audio" 1.0 75.0)
        (object_set_function_variable "pelican_02" "banking_audio" 1.0 75.0)
        (object_set_function_variable "pelican_03" "banking_audio" 1.0 75.0)
    )
)

(script dormant void c03_1100_dp1
    (begin
        (sleep 5)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1100_dp1" "pilot" 1.0)
        (attract_mode_set_seconds "c03_1100_dp1" 1.0)
    )
)

(script dormant void c03_1110_jon
    (begin
        (sleep 63)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1110_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_1110_jon" 1.0)
    )
)

(script dormant void c03_1120_jon
    (begin
        (sleep 135)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1120_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_1120_jon" 2.0)
    )
)

(script dormant void c03_1130_lhd
    (begin
        (sleep 190)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1130_lhd" none 1.0 "radio_default_in")
        (attract_mode_set_seconds "c03_1130_lhd" 4.0)
    )
)

(script dormant void c03_1140_lhd
    (begin
        (sleep 314)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1140_lhd" none 1.0 "radio_default_out")
        (attract_mode_set_seconds "c03_1140_lhd" 5.0)
    )
)

(script dormant void c03_1150_dp2
    (begin
        (sleep 490)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_1150_dp2" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c03_1150_dp2" 1.0)
    )
)

(script dormant void c03_intro_shake_03
    (begin
        (sleep 0)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (sleep 405)
        (hud_blink_health 0.0)
        (print "shake stop")
    )
)

(script dormant void c03_intro_03_dof_1
    (begin
        (sleep 96)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.0 0.0 0.0 1.0 1.0 0.0)
        (print "rack focus")
        (sleep 83)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c03_intro_03_dof_2
    (begin
        (sleep 319)
        (print "dof values: 3 0 0 0 1 1 0")
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 3.0 0.0 0.0 0.0 1.0 1.0 0.0)
        (sleep 85)
        (print "dof values: 9 2.5 2.5 0 0 0 0")
        (cinematic_screen_effect_set_crossfade2 9.0 2.5 2.5 0.0 0.0 0.0 0.0)
        (sleep 116)
        (print "dof stop")
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void cinematic_lighting_scene_03
    (begin
        (cinematic_lighting_set_primary_light 29.0 116.0 0.478431 0.415686 0.329412)
        (cinematic_lighting_set_secondary_light 20.0 272.0 0.235294 0.235294 0.384314)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (object_uses_cinematic_lighting "odst_01" true)
        (object_uses_cinematic_lighting "odst_02" true)
        (object_uses_cinematic_lighting "odst_03" true)
        (object_uses_cinematic_lighting "odst_04" true)
        (object_uses_cinematic_lighting "helmet" true)
        (object_uses_cinematic_lighting "battle_rifle_01" true)
        (object_uses_cinematic_lighting "battle_rifle_02" true)
    )
)

(script dormant void cinematic_light_troopbay_03_01
    (begin
        (sleep 178)
        (print "light bay")
        (object_hide "odst_01" false)
        (object_hide "odst_02" false)
        (object_hide "odst_03" false)
        (cinematic_lighting_set_primary_light 4.0 278.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -34.0 154.0 0.14902 0.141176 0.180392)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
    )
)

(script dormant void cinematic_light_chief_03_01
    (begin
        (sleep 318)
        (print "light chief rev")
        (object_hide "chief" false)
        (object_hide "odst_04" false)
        (cinematic_lighting_set_primary_light 4.0 240.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -34.0 154.0 0.145098 0.141176 0.184314)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
    )
)

(script dormant void cinematic_light_street_03_01
    (begin
        (sleep 403)
        (print "light street")
        (cinematic_lighting_set_primary_light 43.0 122.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -25.0 98.0 0.317647 0.313726 0.396078)
        (cinematic_lighting_set_ambient_light 0.101961 0.101961 0.101961)
    )
)

(script dormant void save_dof_01
    (begin
        (sleep 318)
        (print "delete marines, hide pelican")
        (object_destroy "odst_01")
        (object_destroy "odst_02")
        (object_destroy "odst_03")
        (object_destroy "battle_rifle_01")
        (object_destroy "battle_rifle_02")
        (object_destroy "sniper_rifle")
        (object_hide "pelican_03" true)
        (object_hide "offending_palm_01" true)
        (object_hide "offending_palm_02" true)
        (object_hide "offending_palm_03" true)
        (object_hide "offending_palm_04" true)
        (object_hide "offending_palm_05" true)
        (object_hide "offending_palm_06" true)
        (object_hide "offending_palm_07" true)
        (object_hide "offending_palm_08" true)
        (object_hide "offending_palm_09" true)
        (object_hide "offending_palm_10" true)
        (object_hide "offending_palm_11" true)
        (object_hide "offending_palm_12" true)
        (object_hide "offending_palm_13" true)
        (object_hide "offending_palm_14" true)
        (object_hide "offending_palm_15" true)
        (object_hide "offending_palm_16" true)
        (object_hide "offending_palm_17" true)
        (object_hide "offending_palm_18" true)
        (object_hide "offending_palm_19" true)
        (object_hide "offending_palm_20" true)
    )
)

(script dormant void show_trees_pelican
    (begin
        (sleep 405)
        (print "show trees, pelican")
        (object_hide "pelican_03" false)
        (object_hide "offending_palm_01" false)
        (object_hide "offending_palm_02" false)
        (object_hide "offending_palm_03" false)
        (object_hide "offending_palm_04" false)
        (object_hide "offending_palm_05" false)
        (object_hide "offending_palm_06" false)
        (object_hide "offending_palm_07" false)
        (object_hide "offending_palm_08" false)
        (object_hide "offending_palm_09" false)
        (object_hide "offending_palm_10" false)
        (object_hide "offending_palm_11" false)
        (object_hide "offending_palm_12" false)
        (object_hide "offending_palm_13" false)
        (object_hide "offending_palm_14" false)
        (object_hide "offending_palm_15" false)
        (object_hide "offending_palm_16" false)
        (object_hide "offending_palm_17" false)
        (object_hide "offending_palm_18" false)
        (object_hide "offending_palm_19" false)
        (object_hide "offending_palm_20" false)
    )
)

(script static void c03_intro_03_setup
    (begin
        (object_create_anew "odst_01")
        (object_create_anew "odst_02")
        (object_create_anew "odst_03")
        (object_create_anew "odst_04")
        (object_create_anew "helmet")
        (object_create_anew "battle_rifle_01")
        (object_create_anew "battle_rifle_02")
        (object_cinematic_lod "odst_01" true)
        (object_cinematic_lod "odst_02" true)
        (object_cinematic_lod "odst_03" true)
        (object_cinematic_lod "odst_04" true)
        (object_cinematic_lod "helmet" true)
        (object_cinematic_lod "battle_rifle_01" true)
        (object_cinematic_lod "battle_rifle_02" true)
        (object_hide "odst_01" true)
        (object_hide "odst_02" true)
        (object_hide "odst_03" true)
        (object_hide "odst_04" true)
        (object_set_permutation "odst_01" "head" "morgan")
        (object_set_permutation "odst_02" "head" "perez")
        (object_set_permutation "odst_03" "head" "walter")
        (object_set_permutation "odst_04" "head" "banks")
        (unit_set_emotional_state "odst_01" "angry" 0.25 0)
        (unit_set_emotional_state "odst_02" "angry" 0.25 0)
        (unit_set_emotional_state "odst_03" "angry" 0.25 0)
        (unit_set_emotional_state "odst_04" "angry" 0.25 0)
        (object_set_region_state "odst_03" "helmet" destroyed)
        (object_set_region_state "odst_04" "helmet" destroyed)
        (objects_attach "odst_01" "right hand" "battle_rifle_01" "")
        (objects_attach "odst_02" "right hand" "battle_rifle_02" "")
        (wake c03_intro_foley_03)
        (wake c03_intro_sound_scene3_01)
        (wake c03_intro_sound_scene3_02)
        (wake c03_intro_sound_scene3_03)
        (wake c03_1100_dp1)
        (wake c03_1110_jon)
        (wake c03_1120_jon)
        (wake c03_1130_lhd)
        (wake c03_1140_lhd)
        (wake c03_1150_dp2)
        (wake save_dof_01)
        (wake show_trees_pelican)
        (wake c03_intro_shake_03)
        (wake cinematic_lighting_scene_03)
        (wake cinematic_light_troopbay_03_01)
        (wake cinematic_light_chief_03_01)
        (wake cinematic_light_street_03_01)
    )
)

(script static void c03_intro_03_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "johnson")
        (object_destroy_containing "odst")
        (object_destroy "helmet")
        (object_destroy "battle_rifle_01")
        (object_destroy "battle_rifle_02")
        (object_destroy "sniper_rifle")
        (object_destroy "magazine")
    )
)

(script static void c03_intro_scene_03
    (begin
        (camera_set_animation_relative "objects\characters\cinematic_camera\03_intro\03_intro" "03_intro_03" none "anchor_flag_intro")
        (c03_intro_03_setup)
        (pvs_clear "pelican_01")
        (custom_animation_relative "chief" "objects\characters\masterchief\03_intro\03_intro" "mc_03" false "anchor_intro")
        (custom_animation_relative "johnson" "objects\characters\marine\03_intro\03_intro" "johnson_03" false "anchor_intro")
        (custom_animation_relative "pilot" "objects\characters\marine\03_intro\03_intro" "marine1_03" false "anchor_intro")
        (custom_animation_relative "copilot" "objects\characters\marine\03_intro\03_intro" "marine2_03" false "anchor_intro")
        (custom_animation_relative "odst_01" "objects\characters\marine\03_intro\03_intro" "odst1_03" false "anchor_intro")
        (custom_animation_relative "odst_02" "objects\characters\marine\03_intro\03_intro" "odst2_03" false "anchor_intro")
        (custom_animation_relative "odst_03" "objects\characters\marine\03_intro\03_intro" "odst3_03" false "anchor_intro")
        (custom_animation_relative "odst_04" "objects\characters\marine\03_intro\03_intro" "odst4_03" false "anchor_intro")
        (custom_animation_relative "pelican_01" "objects\vehicles\pelican\03_intro\03_intro" "pel1_03" false "anchor_intro")
        (custom_animation_relative "pelican_02" "objects\vehicles\pelican\03_intro\03_intro" "pel2_03" false "anchor_intro")
        (custom_animation_relative "pelican_03" "objects\vehicles\pelican\03_intro\03_intro" "pel3_03" false "anchor_intro")
        (scenery_animation_start_relative "helmet" "objects\characters\marine\helmet_odst\03_intro\03_intro" "helmet_03" "anchor_intro")
        (scenery_animation_start_relative "sniper_rifle" "objects\weapons\rifle\sniper_rifle\03_intro\03_intro" "sniper_rifle_03" "anchor_intro")
        (sleep (- (camera_set_pan) prediction_offset))
        (03_intro_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_04_fol")
        (sleep (camera_set_pan))
        (c03_intro_03_cleanup)
    )
)

(script dormant void intro_scarab_gun_charge
    (begin
        (sleep 200)
        (print "scarab gun charge")
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_beam_charging" "scarab" "primary_trigger")
    )
)

(script dormant void intro_scarab_gun_fire
    (begin
        (object_create "intro_scarab_gun")
        (objects_attach "scarab" "primary_trigger" "intro_scarab_gun" "")
        (sleep 240)
        (print "scarab gun fire")
        (object_hide "intro_scarab_gun" true)
        (weapon_hold_trigger "intro_scarab_gun" 0 true)
        (sleep 120)
        (weapon_hold_trigger "intro_scarab_gun" 0 false)
    )
)

(script dormant void intro_scarab_turret_fire
    (begin
        (object_create "intro_scarab_gun_turret")
        (objects_attach "scarab_turret" "primary_trigger" "intro_scarab_gun_turret" "")
        (object_hide "intro_scarab_gun_turret" true)
        (sleep 285)
        (print "scarab turret fire")
        (weapon_hold_trigger "intro_scarab_gun_turret" 0 true)
    )
)

(script dormant void effect_pelican_hit_01
    (begin
        (sleep 265)
        (print "pelican hit")
        (effect_new_on_object_marker "effects\generic\explosions_air\human_vehicle_air_hit" "pelican_01" "johnson")
    )
)

(script dormant void effect_pelican_impact_01
    (begin
        (sleep 410)
        (print "pelican impact 1")
        (effect_new_on_object_marker "effects\generic\explosions_air\human_vehicle_air_hit_small" "pelican_03" "light_cockpit_back")
        (sleep 5)
        (effect_new_on_object_marker "effects\generic\explosions_air\human_vehicle_air_hit_small" "pelican_03" "hardpoint_left")
    )
)

(script dormant void effect_pelican_impact_02
    (begin
        (sleep 434)
        (print "pelican impact 2")
        (effect_new_on_object_marker "effects\generic\explosions_air\human_vehicle_air_hit" "pelican_03" "johnson")
        (damage_new "objects\weapons\grenade\frag_grenade\damage_effects\frag_grenade_explosion" "intro_junction_flag_01")
    )
)

(script dormant void effect_blow_railings
    (begin
        (sleep 450)
        (print "blow railings far")
        (damage_new "objects\weapons\grenade\frag_grenade\damage_effects\frag_grenade_explosion" "intro_railing_flag_01")
        (damage_new "objects\weapons\grenade\frag_grenade\damage_effects\frag_grenade_explosion" "intro_railing_flag_02")
        (sleep 5)
        (damage_new "objects\weapons\grenade\frag_grenade\damage_effects\frag_grenade_explosion" "intro_railing_flag_03")
        (damage_new "objects\weapons\grenade\frag_grenade\damage_effects\frag_grenade_explosion" "intro_railing_flag_04")
    )
)

(script dormant void c03_intro_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_04_fol" none 1.0)
        (print "c03_intro foley 04 start")
    )
)

(script dormant void c03_1160_dp2
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_1160_dp2" "pilot" 1.0)
        (attract_mode_set_seconds "c03_1160_dp2" 2.0)
    )
)

(script dormant void c03_intro_fov_02
    (begin
        (sleep 382)
        (camera_pan 30.0 0)
        (print "fov change: 50 -> 20 over 0 ticks")
        (sleep 18)
        (camera_pan 60.0 20)
        (print "fov change: 20 -> 50 over 20 ticks")
    )
)

(script dormant void c03_intro_shake_04
    (begin
        (sleep 137)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.5 0.0)
        (hud_blink_health 1.0)
    )
)

(script dormant void c03_intro_04_dof_1
    (begin
        (sleep 58)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 2.0 1.0 1.0 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 59)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c03_intro_04_dof_3
    (begin
        (sleep 382)
        (print "dof stop")
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void cinematic_lighting_scene_04
    (begin
        (cinematic_lighting_set_primary_light 29.0 116.0 0.478431 0.415686 0.329412)
        (cinematic_lighting_set_secondary_light 20.0 272.0 0.235294 0.235294 0.384314)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
    )
)

(script dormant void cinematic_light_street_04_01
    (begin
        (sleep 117)
        (print "light street")
        (cinematic_lighting_set_primary_light 43.0 122.0 0.54902 0.478431 0.34902)
        (cinematic_lighting_set_secondary_light -25.0 98.0 0.317647 0.313726 0.396078)
        (cinematic_lighting_set_ambient_light 0.101961 0.101961 0.101961)
    )
)

(script dormant void effect_big_foot
    (begin
        (rasterizer_profile_include_all)
        (sleep 126)
        (print "big foot")
        (damage_new "objects\weapons\grenade\frag_grenade\damage_effects\frag_grenade_explosion" "bus_flag_01")
        (damage_new "objects\weapons\grenade\frag_grenade\damage_effects\frag_grenade_explosion" "bus_flag_02")
    )
)

(script static void c03_intro_04_setup
    (begin
        (object_create_anew "scarab")
        (object_create_anew "scarab_turret")
        (object_create_anew_containing "intro_railing")
        (object_create_anew_containing "intro_crash")
        (object_create_anew "the_fiscal_year")
        (object_cinematic_lod "scarab" true)
        (object_cinematic_lod "scarab_turret" true)
        (object_cinematic_lod "the_fiscal_year" true)
        (object_uses_cinematic_lighting "scarab" true)
        (object_uses_cinematic_lighting "scarab_turret" true)
        (wake c03_intro_foley_04)
        (wake c03_1160_dp2)
        (wake c03_intro_fov_02)
        (wake c03_intro_shake_04)
        (wake intro_scarab_gun_charge)
        (wake intro_scarab_gun_fire)
        (wake intro_scarab_turret_fire)
        (wake effect_big_foot)
        (wake effect_pelican_hit_01)
        (wake effect_pelican_impact_01)
        (wake effect_pelican_impact_02)
        (wake effect_blow_railings)
        (wake cinematic_lighting_scene_04)
        (wake cinematic_light_street_04_01)
    )
)

(script static void c03_intro_04_cleanup
    (begin
        (object_destroy "pilot")
        (object_destroy "copilot")
        (object_destroy_containing "scarab")
        (object_destroy_containing "pelican")
        (object_destroy "the_fiscal_year")
    )
)

(script static void c03_intro_scene_04
    (begin
        (camera_set_animation_relative "objects\characters\cinematic_camera\03_intro\03_intro" "03_intro_04" none "anchor_flag_intro")
        (c03_intro_04_setup)
        (pvs_clear "pelican_01")
        (custom_animation_relative "pilot" "objects\characters\marine\03_intro\03_intro" "marine1_04" false "anchor_intro")
        (custom_animation_relative "copilot" "objects\characters\marine\03_intro\03_intro" "marine2_04" false "anchor_intro")
        (custom_animation_relative "pelican_01" "objects\vehicles\pelican\03_intro\03_intro" "pel1_04" false "anchor_intro")
        (custom_animation_relative "pelican_02" "objects\vehicles\pelican\03_intro\03_intro" "pel2_04" false "anchor_intro")
        (custom_animation_relative "pelican_03" "objects\vehicles\pelican\03_intro\03_intro" "pel3_04" false "anchor_intro")
        (scenery_animation_start_relative "scarab" "scenarios\objects\covenant\military\scarab\03_intro\03_intro" "scarab_04" "anchor_intro")
        (scenery_animation_start_relative "scarab_turret" "scenarios\objects\covenant\military\scarab\scarab_upper_gun\03_intro\03_intro" "scarab_upper_gun_04" "anchor_intro")
        (sleep (- (camera_set_pan) 60.0))
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.5 2.0)
        (sleep (- (camera_set_pan) 5.0))
        (print "cut to black")
        (cinematic_stop 0.0 0.0 0.0 5)
        (sleep 5)
        (c03_intro_04_cleanup)
        (sleep 30)
        (hud_blink_health 0.0)
    )
)

(script static void c03_intro
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash earthcity_cine_intro_bsp)
        (sleep 1)
        (c03_intro_scene_01)
        (c03_intro_scene_02)
        (c03_intro_scene_03)
        (c03_intro_scene_04)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script static void chief_recovery_sequence
    (begin
        (camera_control false)
        (player_action_test_jump true)
        (cinematic_outro_start 1.0 1.0 0.0 0.0 1000 0.0)
        (if (= easy (pvs_set_camera)) 
            (begin
                (print "recovery - easy")
                (cinematic_stop 0.0 0.0 0.0 0)
                (set_pjl_effect "oldmombasa_chief_recovery_easy")
                (cinematic_skip_start_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 1.0 0.001)
                (sleep 30)
                (cinematic_start 0.0 0.0 0.0 30)
                (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\mission\l03_9000_cor" none 1.0)
                (sound_impulse_start_effect "sound_remastered\visual_effects\oldmombasa_intro_tinnitus" none 1.0)
                (sleep 35)
                (cinematic_stop 0.0 0.0 0.0 30)
                (sleep 45)
                (cinematic_start 0.0 0.0 0.0 20)
                (sleep 25)
                (cinematic_stop 0.0 0.0 0.0 15)
                (sleep 20)
                (cinematic_start 0.0 0.0 0.0 15)
                (player_flashlight_on false)
                (cinematic_skip_stop_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 0.0 3.0)
                (sleep 30)
                (player_flashlight_on true)
                (cinematic_outro_start 1.0 1.0 1.0 1.0 8000 0.0)
            )
        )
        (if (= normal (pvs_set_camera)) 
            (begin
                (print "recovery - normal")
                (cinematic_stop 0.0 0.0 0.0 0)
                (set_pjl_effect "oldmombasa_chief_recovery_normal")
                (cinematic_skip_start_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 1.0 0.001)
                (sleep 30)
                (cinematic_start 0.0 0.0 0.0 30)
                (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\mission\l03_9030_cor" none 1.0)
                (sound_impulse_start_effect "sound_remastered\visual_effects\oldmombasa_intro_tinnitus" none 1.0)
                (sleep 35)
                (cinematic_stop 0.0 0.0 0.0 30)
                (sleep 45)
                (cinematic_start 0.0 0.0 0.0 20)
                (sleep 25)
                (cinematic_stop 0.0 0.0 0.0 15)
                (sleep 20)
                (cinematic_start 0.0 0.0 0.0 15)
                (player_flashlight_on false)
                (cinematic_skip_stop_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 0.0 3.0)
                (sleep 30)
                (player_flashlight_on true)
                (cinematic_outro_start 1.0 1.0 1.0 1.0 8000 0.0)
            )
        )
        (if (= heroic (pvs_set_camera)) 
            (begin
                (print "recovery - heroic")
                (cinematic_stop 0.0 0.0 0.0 0)
                (set_pjl_effect "oldmombasa_chief_recovery_heroic")
                (cinematic_skip_start_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 1.0 0.001)
                (sleep 30)
                (cinematic_start 0.0 0.0 0.0 30)
                (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\mission\l03_9020_cor" none 1.0)
                (sound_impulse_start_effect "sound_remastered\visual_effects\oldmombasa_intro_tinnitus" none 1.0)
                (sleep 35)
                (cinematic_stop 0.0 0.0 0.0 30)
                (sleep 45)
                (cinematic_start 0.0 0.0 0.0 20)
                (sleep 25)
                (cinematic_stop 0.0 0.0 0.0 15)
                (sleep 20)
                (cinematic_start 0.0 0.0 0.0 15)
                (player_flashlight_on false)
                (cinematic_skip_stop_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 0.0 3.0)
                (sleep 30)
                (player_flashlight_on true)
                (cinematic_outro_start 1.0 1.0 1.0 1.0 8000 0.0)
            )
        )
        (if (= legendary (pvs_set_camera)) 
            (begin
                (print "recovery - legendary")
                (cinematic_stop 0.0 0.0 0.0 0)
                (set_pjl_effect "oldmombasa_chief_recovery_get_real")
                (cinematic_skip_start_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 1.0 0.001)
                (sleep 30)
                (cinematic_start 0.0 0.0 0.0 30)
                (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\mission\l03_9010_cor" none 1.0)
                (sound_impulse_start_effect "sound_remastered\visual_effects\oldmombasa_intro_tinnitus" none 1.0)
                (sleep 35)
                (cinematic_stop 0.0 0.0 0.0 30)
                (sleep 45)
                (cinematic_start 0.0 0.0 0.0 20)
                (sleep 25)
                (cinematic_stop 0.0 0.0 0.0 15)
                (sleep 20)
                (cinematic_start 0.0 0.0 0.0 15)
                (player_flashlight_on false)
                (cinematic_skip_stop_internal)
                (cinematic_set_title_delayed true)
                (interpolator_stop "blurry_vision" 0.0 3.0)
                (sleep 30)
                (player_flashlight_on true)
                (cinematic_outro_start 1.0 1.0 1.0 1.0 8000 0.0)
            )
        )
    )
)

(script static void cinematic_intro
    (begin
        (if (cinematic_skip_start) 
            (begin
                (c03_intro)
            )
        )
        (cinematic_skip_stop)
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

(script dormant void objective0_set
    (begin
        (sleep 30)
        (input_suppress_vibration 0)
    )
)

(script dormant void objective0_clear
    (begin
        (update_remote_camera 0)
    )
)

(script dormant void objective1_set
    (begin
        (sleep 30)
        (input_suppress_vibration 1)
    )
)

(script dormant void objective1_clear
    (begin
        (update_remote_camera 1)
    )
)

(script dormant void objective2_set
    (begin
        (sleep 30)
        (input_suppress_vibration 2)
    )
)

(script dormant void objective2_clear
    (begin
        (update_remote_camera 2)
    )
)

(script dormant void objective3_set
    (begin
        (sleep 30)
        (input_suppress_vibration 3)
    )
)

(script dormant void objective3_clear
    (begin
        (update_remote_camera 3)
    )
)

(script dormant void objective4_set
    (begin
        (sleep 30)
        (input_suppress_vibration 4)
    )
)

(script dormant void objective4_clear
    (begin
        (update_remote_camera 4)
    )
)

(script dormant void music_03a_01_start
    (begin
        (print "music 03a_01 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_01" none 1.0)
    )
)

(script dormant void music_03a_01_stop
    (begin
        (print "music 03a_01 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_01")
    )
)

(script dormant void music_03a_02_stop_alt
    (begin
        (sleep two_minutes)
        (print "music 03a_02 stop alt")
        (sound_class_show_channel "scenarios\solo\03a_oldmombasa\03a_music\03a_02" false)
    )
)

(script dormant void music_03a_02_stop
    (begin
        (sleep one_minute)
        (print "music 03a_02 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_02")
        (sleep_forever music_03a_02_stop_alt)
    )
)

(script dormant void music_03a_02_start_alt
    (begin
        (print "music 03a_02 start alt")
        (sound_class_show_channel "scenarios\solo\03a_oldmombasa\03a_music\03a_02" true)
        (wake music_03a_02_stop_alt)
    )
)

(script dormant void music_03a_02_start
    (begin
        (print "music 03a_02 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_02" none 1.0)
    )
)

(script dormant void music_03a_03_start
    (begin
        (print "music 03a_03 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_03" none 1.0)
    )
)

(script dormant void music_03a_03_stop
    (begin
        (print "music 03a_03 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_03")
    )
)

(script dormant void music_03a_04_start
    (begin
        (print "music 03a_04 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_04" none 1.0)
    )
)

(script dormant void music_03a_04_stop
    (begin
        (print "music 03a_04 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_04")
    )
)

(script dormant void music_03a_05_start
    (begin
        (sleep 60)
        (print "music 03a_05 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_05" none 1.0)
    )
)

(script dormant void music_03a_05_stop
    (begin
        (print "music 03a_05 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_05")
    )
)

(script dormant void music_03a_06_start
    (begin
        (print "music 03a_06 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_06" none 1.0)
    )
)

(script dormant void music_03a_06_stop
    (begin
        (print "music 03a_06 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_06")
    )
)

(script dormant void music_03a_065_start
    (begin
        (print "music 03a_065 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_065" none 1.0)
    )
)

(script dormant void music_03a_065_stop
    (begin
        (sleep two_minutes)
        (print "music 03a_065 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_065")
    )
)

(script dormant void music_03a_065_start_alt
    (begin
        (print "music 03a_065 start alt")
        (sound_class_show_channel "scenarios\solo\03a_oldmombasa\03a_music\03a_065" true)
        (wake music_03a_065_stop)
    )
)

(script dormant void music_03a_066_start
    (begin
        (print "music 03a_066 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_066" none 1.0)
    )
)

(script dormant void music_03a_067_start
    (begin
        (print "music 03a_067 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_067" none 1.0)
    )
)

(script dormant void music_03a_067_stop
    (begin
        (print "music 03a_067 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_067")
    )
)

(script dormant void music_03a_07_start
    (begin
        (print "music 03a_07 start")
        (sound_looping_stop_immediately "scenarios\solo\03a_oldmombasa\03a_music\03a_07" none 1.0)
    )
)

(script dormant void music_03a_07_stop
    (begin
        (print "music 03a_07 stop")
        (sound_looping_set_scale "scenarios\solo\03a_oldmombasa\03a_music\03a_07")
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

(script dormant void flashlight_control
    (begin
        (sleep_until 
            (begin
                (if 
                    (or
                        (= (version) 2)
                        (volume_test_objects "tv_dark_area0" (players))
                        (volume_test_objects "tv_dark_area1" (players))
                        (volume_test_objects "tv_dark_area2" (players))
                        (volume_test_objects "tv_dark_area3" (players))
                    ) 
                        (begin
                            (game_save_unsafe true)
                            (weapon_enable_warthog_chaingun_light true)
                        ) (begin
                            (game_save_unsafe false)
                            (weapon_enable_warthog_chaingun_light false)
                        )
                )
                false
            ) 
        60)
    )
)

(script command_script void cs_e13_mars_continue
    (begin
        (cs_go_to e13_mars_exit/p0)
        (cs_ignore_obstacles true)
        (cs_go_to e13_mars_exit/p1)
        (cs_ignore_obstacles false)
        (cs_go_to e13_mars_exit/p2)
    )
)

(script command_script void cs_e13_cov_creep0_unload
    (begin
        (vehicle_unload (ai_vehicle_get ai_current_actor) creep_sc01)
        (ai_vehicle_exit ai_current_actor)
    )
)

(script command_script void cs_e13_cov_creep0_end0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e13_cov_creep0_chase/first_end)
        (cs_face true e13_cov_creep0_chase/end_facing)
        (sleep 150)
        (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_unload)
    )
)

(script command_script void cs_e13_cov_creep0_end1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e13_cov_creep0_chase/second_end)
        (cs_face true e13_cov_creep0_chase/end_facing)
        (sleep 150)
        (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_unload)
    )
)

(script command_script void cs_e13_cov_creep0_end2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e13_cov_creep0_chase/third_end)
        (cs_face true e13_cov_creep0_chase/end_facing)
        (sleep 150)
        (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_unload)
    )
)

(script command_script void cs_e13_cov_creep0_drive1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_go_to e13_cov_creep0_chase/p11)
        (cs_go_to e13_cov_creep0_chase/end)
        (if (= g_e13_creep_end0_free true) 
            (begin
                (begin
                    (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_end0)
                    (set g_e13_creep_end0_free false)
                )
            ) (if (= g_e13_creep_end1_free true) 
                (begin
                    (begin
                        (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_end1)
                        (set g_e13_creep_end1_free false)
                    )
                ) (if (= g_e13_creep_end2_free true) 
                    (begin
                        (begin
                            (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_end2)
                            (set g_e13_creep_end2_free false)
                        )
                    ) )
            )
        )
    )
)

(script command_script void cs_e13_cov_creep0_drive0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_ignore_obstacles true)
        (cs_go_to e13_cov_creep0_chase/p2 1.0)
        (cs_ignore_obstacles false)
        (cs_go_to e13_cov_creep0_chase/p2_0 1.0)
        (cs_go_to e13_cov_creep0_chase/p3 1.0)
        (cs_go_to e13_cov_creep0_chase/p4 1.0)
        (cs_go_to e13_cov_creep0_chase/p5 1.0)
        (cs_go_to e13_cov_creep0_chase/p5_1 1.0)
        (cs_go_to e13_cov_creep0_chase/p6 1.0)
        (cs_go_to e13_cov_creep0_chase/p7 0.5)
        (cs_go_to e13_cov_creep0_chase/p8 1.0)
        (cs_go_to e13_cov_creep0_chase/p9_0 1.0)
        (cs_go_to e13_cov_creep0_chase/p9_1 1.0)
        (cs_go_to e13_cov_creep0_chase/p10 1.0)
    )
)

(script command_script void cs_e13_cov_creep0_0_decision
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (if 
            (and
                (<= (ai_living_count "e13_cov_creep0_1/creep0") 0)
                (<= (ai_living_count "e13_cov_creep0_2/creep0") 0)
            ) 
                (begin
                    (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_drive1)
                    (ai_set_orders ai_current_squad "e13_cov_creep0_defend")
                ) (begin
                    (cs_go_to e13_cov_creep0_mid/creep0_0_mid)
                    (cs_vehicle_boost false)
                    (cs_face true e13_cov_creep0_mid/creep0_0_mid_facing)
                    (sleep 60)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_p_l01)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_p_r01)
                    (sleep 60)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_sc01)
                    (ai_vehicle_exit ai_current_actor)
                    (sleep 30)
                    (ai_vehicle_enter ai_current_actor (ai_vehicle_get_from_starting_location "e13_cov_ghosts0/ghost0"))
                )
        )
    )
)

(script command_script void cs_e13_cov_creep0_1_decision
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (if 
            (and
                (<= (ai_living_count "e13_cov_creep0_0/creep0") 0)
                (<= (ai_living_count "e13_cov_creep0_2/creep0") 0)
            ) 
                (begin
                    (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_drive1)
                    (ai_set_orders ai_current_squad "e13_cov_creep0_defend")
                ) (begin
                    (cs_go_to e13_cov_creep0_mid/creep0_1_mid)
                    (cs_vehicle_boost false)
                    (cs_face true e13_cov_creep0_mid/creep0_1_mid_facing)
                    (sleep 60)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_p_l01)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_p_r01)
                    (sleep 60)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_sc01)
                    (ai_vehicle_exit ai_current_actor)
                    (sleep 30)
                    (ai_vehicle_enter ai_current_actor (ai_vehicle_get_from_starting_location "e13_cov_ghosts0/ghost1"))
                )
        )
    )
)

(script command_script void cs_e13_cov_creep0_2_decision
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (if 
            (and
                (> (ai_living_count "e13_cov_creep0_0/creep0") 0)
                (> (ai_living_count "e13_cov_creep0_1/creep0") 0)
            ) 
                (begin
                    (cs_queue_command_script ai_current_actor cs_e13_cov_creep0_drive1)
                    (ai_set_orders ai_current_squad "e13_cov_creep0_defend")
                ) (begin
                    (cs_go_to e13_cov_creep0_mid/creep0_2_mid)
                    (cs_vehicle_boost false)
                    (cs_face true e13_cov_creep0_mid/creep0_2_mid_facing)
                    (sleep 60)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_p_l01)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_p_r01)
                    (sleep 60)
                    (vehicle_unload (ai_vehicle_get ai_current_actor) creep_sc01)
                    (ai_vehicle_exit ai_current_actor)
                    (sleep 30)
                    (ai_vehicle_enter ai_current_actor (ai_vehicle_get_from_starting_location "e13_cov_ghosts0/ghost2"))
                )
        )
    )
)

(script command_script void cs_e13_mars_warthog0_drive
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_alert true)
        (cs_go_by e13_mars_warthog1_ketchup/p0 e13_mars_warthog1_ketchup/p1)
    )
)

(script static boolean e13_end_clear
    (begin
        (not (volume_test_objects "tv_e13_end_area" (ai_actors "e13_cov")))
    )
)

(script static boolean e13_waypoint1_clear
    (begin
        (not (volume_test_objects "tv_e13_waypoint1" (ai_actors "e13_cov")))
    )
)

(script static boolean e13_waypoint1
    (begin
        (volume_test_objects "tv_e13_waypoint1" (ai_actors ai_current_squad))
    )
)

(script static boolean e13_waypoint0
    (begin
        (volume_test_objects "tv_e13_waypoint0" (ai_actors ai_current_squad))
    )
)

(script static void e13_mars_exit
    (begin
        (cs_run_command_script ai_current_squad cs_e13_mars_continue)
    )
)

(script dormant void e13_navpoints
    (begin
        (deactivate_nav_point_object default player (ai_vehicle_get_from_starting_location "e13_cov_creep0_0/creep0") 1.5)
        (sleep_until 
            (or
                (<= (unit_get_health (ai_get_unit "e13_cov_creep0_0/creep0")) 0.0)
                (< (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "e13_cov_creep0_1/creep0")) (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "e13_cov_creep0_0/creep0")))
                (volume_test_objects "tv_e13_waypoint1" (players))
            )
        )
        (error_overflow_suppression player (ai_vehicle_get_from_starting_location "e13_cov_creep0_0/creep0"))
        (deactivate_nav_point_object default player (ai_vehicle_get_from_starting_location "e13_cov_creep0_1/creep0") 1.5)
        (sleep_until 
            (or
                (<= (unit_get_health (ai_get_unit "e13_cov_creep0_1/creep0")) 0.0)
                (< (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "e13_cov_creep0_2/creep0")) (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "e13_cov_creep0_1/creep0")))
                (volume_test_objects "tv_e13_waypoint1" (players))
            )
        )
        (error_overflow_suppression player (ai_vehicle_get_from_starting_location "e13_cov_creep0_1/creep0"))
        (deactivate_nav_point_object default player (ai_vehicle_get_from_starting_location "e13_cov_creep0_2/creep0") 1.5)
        (sleep_until 
            (or
                (<= (unit_get_health (ai_get_unit "e13_cov_creep0_2/creep0")) 0.0)
                (volume_test_objects "tv_e13_waypoint1" (players))
            )
        )
        (error_overflow_suppression player (ai_vehicle_get_from_starting_location "e13_cov_creep0_2/creep0"))
        (if (> (unit_get_health (ai_get_unit "e13_cov_creep0_3/creep0")) 0.0) 
            (begin
                (deactivate_nav_point_object default player (ai_vehicle_get_from_starting_location "e13_cov_creep0_3/creep0") 1.5)
                (sleep_until 
                    (or
                        (<= (unit_get_health (ai_get_unit "e13_cov_creep0_3/creep0")) 0.0)
                        (volume_test_objects "tv_e13_end_entrance" (players))
                    )
                )
            )
        )
        (error_overflow_suppression player (ai_vehicle_get_from_starting_location "e13_cov_creep0_3/creep0"))
    )
)

(script dormant void e13_cov_ghosts1_main
    (begin
        (sleep_until (volume_test_objects "tv_e13_cov_creep0_6_begin" (players)) 15)
        (ai_place "e13_cov_ghosts1")
    )
)

(script dormant void e13_cov_creep0_ghost_aux
    (begin
        (sleep_until (volume_test_objects "tv_e13_creep0_begin" (players)) 15)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "e13_cov_creep0_0/creep0") creep_sc01 (ai_vehicle_get_from_starting_location "e13_cov_ghosts0/ghost0"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "e13_cov_creep0_1/creep0") creep_sc01 (ai_vehicle_get_from_starting_location "e13_cov_ghosts0/ghost1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "e13_cov_creep0_2/creep0") creep_sc01 (ai_vehicle_get_from_starting_location "e13_cov_ghosts0/ghost2"))
        (sleep_until 
            (begin
                (if (<= (ai_living_count "e13_cov_creep0_0/creep0") 0) 
                    (vehicle_unload (ai_vehicle_get_from_starting_location "e13_cov_creep0_0/creep0") creep_sc01))
                (if (<= (ai_living_count "e13_cov_creep0_1/creep0") 0) 
                    (vehicle_unload (ai_vehicle_get_from_starting_location "e13_cov_creep0_1/creep0") creep_sc01))
                (if (<= (ai_living_count "e13_cov_creep0_2/creep0") 0) 
                    (vehicle_unload (ai_vehicle_get_from_starting_location "e13_cov_creep0_2/creep0") creep_sc01))
                false
            ) 
        60)
    )
)

(script dormant void e13_cov_creep0_main
    (begin
        (sleep_until (volume_test_objects "tv_e13_creep0_begin" (players)))
        (wake music_03a_067_stop)
        (wake music_03a_07_start)
        (ai_place "e13_cov_ghosts0")
        (ai_place "e13_cov_creep0_0")
        (ai_place "e13_cov_creep0_1")
        (ai_place "e13_cov_creep0_2")
        (sleep 2)
        (wake e13_cov_creep0_ghost_aux)
        (cs_queue_command_script "e13_cov_creep0_0/creep0" cs_e13_cov_creep0_0_decision)
        (cs_queue_command_script "e13_cov_creep0_1/creep0" cs_e13_cov_creep0_1_decision)
        (cs_queue_command_script "e13_cov_creep0_2/creep0" cs_e13_cov_creep0_2_decision)
        (sleep_until (volume_test_objects "tv_e13_dialog" (players)))
        (sleep (ai_play_line_on_object none "0590"))
        (sleep_until (volume_test_objects "tv_e13_cov_creep0_reins0" (players)) 15)
        (game_save_no_timeout)
        (if 
            (or
                (<= (ai_living_count "e13_cov_creep0_0/creep0") 0)
                (<= (ai_living_count "e13_cov_creep0_1/creep0") 0)
                (<= (ai_living_count "e13_cov_creep0_2/creep0") 0)
            ) 
                (ai_place "e13_cov_creep0_3"))
        (sleep_until (volume_test_objects "tv_e13_cov_creep0_6_begin" (players)) 15)
        (wake music_03a_07_stop)
        (game_save_no_timeout)
        (ai_place "e13_cov_creep0_6")
        (sleep 30)
        (object_dynamic_simulation_disable (ai_vehicle_get_from_starting_location "e13_cov_creep0_6/creep0") true)
    )
)

(script dormant void e13_mars_warthog0_main
    (begin
        (ai_migrate "e12_mars_warthog0" "e13_mars_warthog0")
        (ai_migrate "e12_mars_warthog1" "e13_mars_warthog0")
        (ai_disposable "e13_mars_warthog0" false)
        (ai_renew "e13_mars_warthog0")
        (cs_run_command_script "e13_mars_warthog0" cs_e13_mars_warthog0_drive)
    )
)

(script dormant void e13_main
    (begin
        (sleep_until (volume_test_objects "tv_e13_main_begin" (players)) 10)
        (set g_e13_started true)
        (print "e13_main")
        (data_mine_insert "e13_tunnel_convoy")
        (game_save_no_timeout)
        (wake e13_mars_warthog0_main)
        (wake e13_cov_creep0_main)
        (wake e13_cov_ghosts1_main)
    )
)

(script static void test_tunnel_convoy
    (begin
        (structure_bsp_index 2)
        (object_teleport (player0) "e13_test")
        (ai_place "e13_mars_warthog0")
        (if (not g_e13_started) 
            (wake e13_main))
    )
)

(script command_script void cs_e12_mars_horrible_cleanup
    (begin
        (if 
            (and
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 50.0)
                (not (unit_in_vehicle (ai_get_unit ai_current_actor)))
            ) 
                (ai_erase ai_current_actor))
    )
)

(script command_script void cs_e12_cov_inf0_ghost_drop
    (begin
        (ai_vehicle_reserve (ai_vehicle_get ai_current_actor) true)
        (ai_vehicle_exit ai_current_actor)
    )
)

(script command_script void cs_e12_cov_inf0_0_ghost0
    (begin
        (sleep_until (>= (ai_combat_status "e12_cov_inf0_0") ai_combat_status_active) 15)
        (cs_vehicle_boost true)
        (cs_go_to e12_patrol/p0_2)
    )
)

(script command_script void cs_e12_cov_inf0_0_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (cs_go_to e12_patrol/p0_0)
                (sleep (random_range 30 60))
                (cs_go_to e12_patrol/p0_1)
                (sleep (random_range 30 60))
                false
            )
        )
    )
)

(script command_script void cs_e12_scarab_gunner
    (begin
        (cs_shoot_point true e12_scarab/p0)
        (sleep 165)
    )
)

(script command_script void cs_e12_mars_warthog0_cleanup
    (begin
        (if (not (volume_test_object "tv_e12_mars_warthog0_preserve" (ai_get_object ai_current_actor))) 
            (ai_erase ai_current_actor))
    )
)

(script command_script void cs_e12_ghosts_entry
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_moving true)
        (cs_vehicle_boost true)
        (sleep 150)
    )
)

(script dormant void e12_cov_ghosts0_main
    (begin
        (sleep_until (volume_test_objects "tv_e12_scarab_begin" (players)) 15)
        (sleep_until (volume_test_objects "tv_e12_cov_ghosts0_begin" (players)) 15)
        (ai_place "e12_cov_ghosts0")
    )
)

(script static void scarab_walk_front_var0
    (begin
        (print "scarab_walk_front_var0")
        (device_set_position_track "tunnel_scarab" "combat:walk_front:var0" 0.0)
        (device_animate_position "tunnel_scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "tunnel_scarab") 1.0) 1)
    )
)

(script dormant void e12_event_warthog
    (begin
        (object_create "e12_warthog0")
        (object_set_velocity "e12_warthog0" 11.0 0.0 0.25)
    )
)

(script dormant void e12_event_scarab_gun
    (begin
        (object_create "e12_scarab_gun")
        (weapon_hold_trigger "e12_scarab_gun" 0 true)
        (sleep 90)
        (weapon_hold_trigger "e12_scarab_gun" 0 false)
        (wake e12_cov_ghosts0_main)
        (sleep 60)
        (object_destroy "e12_scarab_gun")
    )
)

(script dormant void e12_event_scarab
    (begin
        (sleep_until (volume_test_objects "tv_e12_scarab_begin" (players)) 8)
        (wake e12_event_warthog)
        (sleep 26)
        (wake e12_event_scarab_gun)
        (wake music_03a_066_start)
        (wake music_03a_067_start)
        (object_create "tunnel_scarab")
        (pvs_clear "tunnel_scarab")
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (if (volume_test_objects "tv_e12_scarab_begin" (players)) 
            (scarab_walk_front_var0))
        (object_destroy "tunnel_scarab")
    )
)

(script dormant void e12_cortana_dialog
    (begin
        (sleep 30)
        (sleep (ai_play_line_on_object none "0070"))
        (sleep 20)
        (sleep (ai_play_line_on_object none "0080"))
    )
)

(script dormant void e12_cov_creep0_main
    (begin
        (sleep_until (volume_test_objects "tv_e12_cov_inf0_5_begin" (players)) 10)
        (ai_place "e12_cov_creep0")
    )
)

(script dormant void e12_cov_inf0_main
    (begin
        (ai_place "e12_cov_inf0_0")
        (sleep_until (volume_test_objects "tv_e12_cov_inf0_2_begin" (players)) 10)
        (game_save_no_timeout)
        (ai_disposable "e12_cov_inf0_0" true)
        (ai_place "e12_cov_inf0_1")
        (sleep_until (volume_test_objects "tv_e12_cov_inf0_3_begin" (players)) 10)
        (ai_disposable "e12_cov_inf0_1" true)
        (ai_place "e12_cov_inf0_2")
        (sleep_until (volume_test_objects "tv_e12_cov_inf0_6_begin" (players)) 10)
        (game_save_no_timeout)
        (ai_disposable "e12_cov_inf0_2" true)
        (ai_place "e12_cov_inf0_6")
        (sleep_until (volume_test_objects "tv_e12_cov_inf0_4_begin" (players)) 10)
        (game_save_no_timeout)
        (ai_place "e12_cov_inf0_4")
        (sleep_until (volume_test_objects "tv_e12_cov_inf0_6_migrate" (players)) 10)
        (ai_migrate "e12_cov_inf0_6" "e12_cov_inf0_4")
        (sleep_until (volume_test_objects "tv_e12_scarab_begin" (players)) 8)
        (ai_disposable "e12_cov_inf0_4" true)
        (sleep_until (volume_test_objects "tv_e12_cov_inf0_5_begin" (players)) 10)
        (game_save_no_timeout)
    )
)

(script dormant void e12_mars_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e12_mars_inf1_begin" (players)) 15)
        (ai_place "e12_mars_inf1")
    )
)

(script dormant void e12_mars_inf0_main
    (begin
        (sleep 1)
    )
)

(script dormant void e12_mars_warthog1_main
    (begin
        (sleep_until (volume_test_objects "tv_e12_mars_warthog1_begin" (players)) 10)
        (cs_run_command_script "e12_mars_warthog0" cs_e12_mars_horrible_cleanup)
        (sleep 15)
        (if (<= (ai_living_count "e12_mars_warthog0") 2) 
            (ai_place "e12_mars_warthog1"))
    )
)

(script dormant void e12_mars_warthog0_main
    (begin
        (ai_migrate "e11_mars_warthog0" "e12_mars_warthog0")
        (ai_renew "e12_mars_warthog0")
        (ai_disposable "e12_mars_warthog0" false)
        (sleep_until (= (version) 2))
        (cs_run_command_script "e12_mars_warthog0" cs_e12_mars_warthog0_cleanup)
        (sleep 15)
        (game_save_no_timeout)
        (if (< (ai_living_count "e12_mars_warthog0") 4) 
            (ai_place "e12_mars_warthog0"))
    )
)

(script dormant void e12_main
    (begin
        (sleep_until (volume_test_objects "tv_e12_main_begin" (players)) 15)
        (set g_e12_started true)
        (print "e12_main")
        (data_mine_insert "e12_tunnel_blockades")
        (game_save_no_timeout)
        (wake chapter_title2)
        (wake e13_main)
        (wake e12_cov_inf0_main)
        (wake e12_cov_creep0_main)
        (wake e12_cov_ghosts0_main)
        (wake e12_mars_warthog0_main)
        (wake e12_mars_warthog1_main)
        (wake e12_mars_inf0_main)
        (wake e12_mars_inf1_main)
        (wake e12_event_scarab)
        (wake e12_cortana_dialog)
        (sleep_until g_e13_started)
        (sleep_forever e12_cov_inf0_main)
        (sleep_forever e12_cov_creep0_main)
        (sleep_forever e12_cov_ghosts0_main)
        (sleep_forever e12_mars_warthog0_main)
        (sleep_forever e12_mars_warthog1_main)
        (sleep_forever e12_mars_inf0_main)
        (sleep_forever e12_mars_inf1_main)
        (sleep_forever e12_event_scarab)
        (sleep_forever e12_cortana_dialog)
        (ai_disposable "e12_cov" true)
    )
)

(script static void test_tunnel_blockades
    (begin
        (structure_bsp_index 2)
        (object_teleport (player0) "e12_test")
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e11_cov_phantom0_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to e11_cov_phantom0/p0 1.0)
        (cs_fly_to_and_face e11_cov_phantom0/p1 e11_cov_phantom0/p2 1.0)
        (cs_fly_to_and_face e11_cov_phantom0/p2 e11_cov_phantom0/p3)
        (cs_fly_by e11_cov_phantom0/p3)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e11_cov_inf0_shoot0
    (begin
        (cs_abort_on_damage true)
        (cs_shoot_point true e11_patrol/s0)
        (sleep (random_range 30_seconds one_minute))
    )
)

(script command_script void cs_e11_cov_inf0_shoot1
    (begin
        (cs_abort_on_damage true)
        (cs_shoot_point true e11_patrol/s1)
        (sleep_until 
            (begin
                (cs_go_to e11_patrol/p1)
                (sleep (random_range 60 90))
                (cs_go_to e11_patrol/p0)
                (sleep (random_range 90 120))
                false
            ) 
        30 30_seconds)
    )
)

(script command_script void cs_e11_cov_inf0_shoot2
    (begin
        (cs_abort_on_damage true)
        (cs_shoot_point true e11_patrol/s2)
        (sleep (random_range 30_seconds one_minute))
    )
)

(script command_script void cs_e11_cov_ghosts0_entry
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_and_face e11_cov_ghosts0/p0 e11_cov_ghosts0/p1)
        (cs_vehicle_boost true)
        (cs_go_to e11_cov_ghosts0/p1)
    )
)

(script static boolean e11_cov_phantom0_leaving
    (begin
        (= g_e11_cov_phantom0_leaving true)
    )
)

(script dormant void e11_cov_inf1_0_insertion0
    (begin
        (ai_place "e11_cov_inf1_0/elite0")
        (object_create "e11_pod0_inserter")
        (objects_attach "e11_pod0_inserter" "pod_attach" (ai_vehicle_get "e11_cov_inf1_0/elite0") "pod_attach")
        (sleep 1)
        (device_set_position "e11_pod0_inserter" 1.0)
        (sleep_until (>= (device_get_position "e11_pod0_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e11_pod_impact_effect (ai_vehicle_get "e11_cov_inf1_0/elite0") "pod_attach")
        (objects_detach "e11_pod0_inserter" (ai_vehicle_get "e11_cov_inf1_0/elite0"))
        (object_destroy "e11_pod0_inserter")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "e11_cov_inf1_0/elite0") "door" 500.0)
        (sleep 30)
        (ai_vehicle_exit "e11_cov_inf1_0/elite0")
    )
)

(script dormant void e11_cov_inf1_0_insertion1
    (begin
        (ai_place "e11_cov_inf1_0/elite1")
        (object_create "e11_pod1_inserter")
        (objects_attach "e11_pod1_inserter" "pod_attach" (ai_vehicle_get "e11_cov_inf1_0/elite1") "pod_attach")
        (sleep 1)
        (device_set_position "e11_pod1_inserter" 1.0)
        (sleep_until (>= (device_get_position "e11_pod1_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e11_pod_impact_effect (ai_vehicle_get "e11_cov_inf1_0/elite1") "pod_attach")
        (objects_detach "e11_pod1_inserter" (ai_vehicle_get "e11_cov_inf1_0/elite1"))
        (object_destroy "e11_pod1_inserter")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "e11_cov_inf1_0/elite1") "door" 500.0)
        (sleep 30)
        (ai_vehicle_exit "e11_cov_inf1_0/elite1")
    )
)

(script dormant void e11_cov_inf1_0_insertion2
    (begin
        (ai_place "e11_cov_inf1_0/elite2")
        (object_create "e11_pod2_inserter")
        (objects_attach "e11_pod2_inserter" "pod_attach" (ai_vehicle_get "e11_cov_inf1_0/elite2") "pod_attach")
        (sleep 1)
        (device_set_position "e11_pod2_inserter" 1.0)
        (sleep_until (>= (device_get_position "e11_pod2_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e11_pod_impact_effect (ai_vehicle_get "e11_cov_inf1_0/elite2") "pod_attach")
        (objects_detach "e11_pod2_inserter" (ai_vehicle_get "e11_cov_inf1_0/elite2"))
        (object_destroy "e11_pod2_inserter")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "e11_cov_inf1_0/elite2") "door" 500.0)
        (sleep 30)
        (ai_vehicle_exit "e11_cov_inf1_0/elite2")
    )
)

(script dormant void e11_cov_inf1_1_insertion0
    (begin
        (ai_place "e11_cov_inf1_1/elite0")
        (object_create "e11_pod3_inserter")
        (objects_attach "e11_pod3_inserter" "pod_attach" (ai_vehicle_get "e11_cov_inf1_1/elite0") "pod_attach")
        (sleep 1)
        (device_set_position "e11_pod3_inserter" 1.0)
        (sleep_until (>= (device_get_position "e11_pod3_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e11_pod_impact_effect (ai_vehicle_get "e11_cov_inf1_1/elite0") "pod_attach")
        (objects_detach "e11_pod3_inserter" (ai_vehicle_get "e11_cov_inf1_1/elite0"))
        (object_destroy "e11_pod3_inserter")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "e11_cov_inf1_1/elite0") "door" 500.0)
        (sleep 30)
        (ai_vehicle_exit "e11_cov_inf1_1/elite0")
    )
)

(script dormant void e11_cov_inf1_1_insertion1
    (begin
        (ai_place "e11_cov_inf1_1/elite1")
        (object_create "e11_pod4_inserter")
        (objects_attach "e11_pod4_inserter" "pod_attach" (ai_vehicle_get "e11_cov_inf1_1/elite1") "pod_attach")
        (sleep 1)
        (device_set_position "e11_pod4_inserter" 1.0)
        (sleep_until (>= (device_get_position "e11_pod4_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e11_pod_impact_effect (ai_vehicle_get "e11_cov_inf1_1/elite1") "pod_attach")
        (objects_detach "e11_pod4_inserter" (ai_vehicle_get "e11_cov_inf1_1/elite1"))
        (object_destroy "e11_pod4_inserter")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "e11_cov_inf1_1/elite1") "door" 500.0)
        (sleep 30)
        (ai_vehicle_exit "e11_cov_inf1_1/elite1")
    )
)

(script dormant void e11_cov_inf1_1_insertion2
    (begin
        (ai_place "e11_cov_inf1_1/elite2")
        (object_create "e11_pod5_inserter")
        (objects_attach "e11_pod5_inserter" "pod_attach" (ai_vehicle_get "e11_cov_inf1_1/elite2") "pod_attach")
        (sleep 1)
        (device_set_position "e11_pod5_inserter" 1.0)
        (sleep_until (>= (device_get_position "e11_pod5_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e11_pod_impact_effect (ai_vehicle_get "e11_cov_inf1_1/elite2") "pod_attach")
        (objects_detach "e11_pod5_inserter" (ai_vehicle_get "e11_cov_inf1_1/elite2"))
        (object_destroy "e11_pod5_inserter")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "e11_cov_inf1_1/elite2") "door" 500.0)
        (sleep 30)
        (ai_vehicle_exit "e11_cov_inf1_1/elite2")
    )
)

(script dormant void e11_cov_inf1_1_insertion3
    (begin
        (ai_place "e11_cov_inf1_1/elite3")
        (object_create "e11_pod6_inserter")
        (objects_attach "e11_pod6_inserter" "pod_attach" (ai_vehicle_get "e11_cov_inf1_1/elite3") "pod_attach")
        (sleep 1)
        (device_set_position "e11_pod6_inserter" 1.0)
        (sleep_until (>= (device_get_position "e11_pod6_inserter") 1.0) 1)
        (effect_new_on_object_marker g_e11_pod_impact_effect (ai_vehicle_get "e11_cov_inf1_1/elite3") "pod_attach")
        (objects_detach "e11_pod6_inserter" (ai_vehicle_get "e11_cov_inf1_1/elite3"))
        (object_destroy "e11_pod6_inserter")
        (sleep (random_range 20 45))
        (object_damage_damage_section (ai_vehicle_get "e11_cov_inf1_1/elite3") "door" 500.0)
        (sleep 30)
        (ai_vehicle_exit "e11_cov_inf1_1/elite3")
    )
)

(script dormant void e11_warthog_approach_horn
    (begin
        (print "honk")
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" (ai_vehicle_get_from_starting_location "e11_mars_warthog0/warthog0") 1.5)
        (sleep 30)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
    )
)

(script command_script void cs_e11_warthog_approach
    (begin
        (cs_approach_player 10.0 100.0 100.0)
        (wake e11_warthog_approach_horn)
        (cs_vehicle_speed 0.5)
        (cs_approach_player 5.0 100.0 100.0)
        (sleep_until 
            (or
                (player_in_vehicle)
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 10.0)
                (not (unit_in_vehicle (ai_get_unit ai_current_actor)))
            )
        )
    )
)

(script dormant void e11_miranda_dialog
    (begin
        (sleep (ai_play_line_on_object none "0560"))
        (game_save_no_timeout)
    )
)

(script dormant void e11_dialog
    (begin
        (sleep 150)
        (sleep_until 
            (and
                (objects_can_see_flag (players) "e11_cov_inf1_entry" 15.0)
                (volume_test_objects_all "tv_e11_area" (players))
            )
        )
        (sleep_until (volume_test_objects "tv_e11_tunnel_entrance" (players)))
        (ai_play_line_on_object none "0580")
    )
)

(script dormant void e11_navpoint
    (begin
        (sleep_until (> (objects_distance_to_flag (players) "e11_tunnel_entrance") 50.0) 30 30_seconds)
        (print "navpoint up")
        (deactivate_nav_point_flag default player "e11_tunnel_entrance" 0.0)
    )
)

(script dormant void e11_navpoint_kill
    (begin
        (sleep_until (volume_test_objects "tv_e11_tunnel_entrance" (players)) 15)
        (sleep_forever e11_navpoint)
        (print "navpoint down")
        (cls player "e11_tunnel_entrance")
    )
)

(script dormant void e11_cov_phantom0_main
    (begin
        (sleep_until g_e10_cov_phantom0_leaving 15)
        (ai_set_orders "e10_cov_phantom0" "e11_cov_phantom0_init")
        (sleep_until 
            (or
                (>= (object_model_targets_destroyed (ai_vehicle_get "e10_cov_phantom0/phantom0") "target_front") 2)
                (<= (object_get_health (ai_vehicle_get "e10_cov_phantom0/phantom0")) 0.05)
                (> (ai_spawn_count "e11_cov_ghosts0_1") 0)
            ) 
        30 one_minute)
        (sleep_until 
            (or
                (>= (object_model_targets_destroyed (ai_vehicle_get "e10_cov_phantom0/phantom0") "target_front") 2)
                (<= (object_get_health (ai_vehicle_get "e10_cov_phantom0/phantom0")) 0.05)
            ) 
        30 one_minute)
        (set g_e11_cov_phantom0_leaving true)
        (cs_run_command_script "e10_cov_phantom0/phantom0" cs_e11_cov_phantom0_exit)
        (sleep 120)
        (game_save_no_timeout)
        (wake e11_navpoint)
        (wake e11_navpoint_kill)
    )
)

(script dormant void e11_cov_ghosts0_main
    (begin
        (ai_migrate "e10_cov_ghosts0" "e11_cov_ghosts0_0")
        (ai_place "e11_cov_ghosts0_0" (pin (- 3.0 (ai_living_count "e11_cov_ghosts0_0")) 0.0 2.0))
        (sleep_until (<= (ai_living_count "e11_cov_ghosts0") 0))
        (game_save_no_timeout)
        (sleep 30_seconds)
        (sleep_until (volume_test_objects_all "tv_e11_area" (players)))
        (ai_place "e11_cov_ghosts0_1")
        (sleep_until (<= (ai_living_count "e11_cov_ghosts0") 0))
        (game_save_no_timeout)
        (sleep 30_seconds)
        (sleep_until (volume_test_objects_all "tv_e11_area" (players)))
        (ai_place "e11_cov_ghosts0_1")
    )
)

(script dormant void e11_cov_inf2_main
    (begin
        (ai_place "e11_cov_inf2")
        (sleep_until 
            (or
                (volume_test_objects "tv_e11_on_fort" (players))
                (< (objects_distance_to_flag (players) "e11_cov_inf1_entry") 40.0)
            ) 
        10)
        (device_group_set_immediate "e11_watchtower0" 1.0)
    )
)

(script dormant void e11_cov_inf1_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e11_on_fort" (players))
                (volume_test_objects "tv_e11_near_exit" (players))
            ) 
        10)
        (sleep 30)
        (if (not (volume_test_objects "tv_e11_near_exit" (players))) 
            (begin
                (sleep_until (objects_can_see_flag (players) "e11_cov_inf1_entry" 25.0) 60 300)
                (wake e11_cov_inf1_0_insertion0)
                (sleep 20)
                (wake e11_cov_inf1_0_insertion1)
                (sleep 10)
                (if (< (ai_living_count "covenant") 10) 
                    (wake e11_cov_inf1_0_insertion2))
            )
        )
        (sleep_until (volume_test_objects "tv_e11_near_exit" (players)) 10)
        (wake e11_cov_inf1_1_insertion0)
        (sleep 15)
        (wake e11_cov_inf1_1_insertion1)
        (sleep 7)
        (if (< (ai_living_count "covenant") 10) 
            (wake e11_cov_inf1_1_insertion2))
        (sleep 25)
        (if (< (ai_living_count "covenant") 10) 
            (wake e11_cov_inf1_1_insertion3))
    )
)

(script dormant void e11_cov_inf0_main
    (begin
        (ai_place "e11_cov_inf0")
    )
)

(script dormant void e11_mars_inf0_main
    (begin
        (if (not (game_can_use_flashlights)) 
            (ai_place "e11_mars_inf0" (pin (- 3.0 (ai_living_count "marines")) 1.0 2.0)))
    )
)

(script dormant void e11_mars_warthog0_main
    (begin
        (ai_migrate "e10_mars_warthog0" "e11_mars_warthog0")
        (ai_migrate "e10_mars_inf0" "e11_mars_warthog0")
        (ai_renew "e11_mars_warthog0")
        (ai_disposable "e11_mars_warthog0" false)
        (sleep_until 
            (and
                (not (player_in_vehicle))
                (or
                    (not (volume_test_object "tv_beach" g_e8_warthog))
                    (<= (object_get_health g_e8_warthog) 0.0)
                )
                (or
                    (not (volume_test_object "tv_beach" g_e10_warthog))
                    (<= (object_get_health g_e10_warthog) 0.0)
                )
            )
        )
        (sleep 15_seconds)
        (sleep_until (not (volume_test_objects "tv_e11_mars_warthog0_unsafe" (players))))
        (ai_place "e11_mars_warthog0")
    )
)

(script dormant void e11_warthog_for_the_masses
    (begin
        (sleep 300)
        (object_create "warthog_for_the_masses")
        (sleep 2)
        (object_cannot_die "warthog_for_the_masses" true)
    )
)

(script dormant void e11_main
    (begin
        (sleep_until (volume_test_objects "tv_e11_main_begin" (players)) 15)
        (set g_e11_started true)
        (print "e11_main")
        (data_mine_insert "e11_tunnel_entrance")
        (game_save_no_timeout)
        (wake objective3_clear)
        (wake objective4_set)
        (wake e11_mars_inf0_main)
        (wake e11_mars_warthog0_main)
        (wake e11_cov_inf1_main)
        (wake e11_cov_inf2_main)
        (wake e11_cov_ghosts0_main)
        (wake e11_cov_phantom0_main)
        (wake e11_dialog)
        (wake e11_miranda_dialog)
        (wake e11_warthog_for_the_masses)
        (sleep_until g_e12_started)
        (sleep_forever e11_mars_inf0_main)
        (sleep_forever e11_mars_warthog0_main)
        (sleep_forever e11_cov_inf0_main)
        (sleep_forever e11_cov_inf1_main)
        (sleep_forever e11_cov_inf2_main)
        (sleep_forever e11_cov_ghosts0_main)
        (sleep_forever e11_cov_phantom0_main)
        (sleep_forever e11_dialog)
        (ai_disposable "e11_cov" true)
        (sleep_until g_e13_started)
        (ai_erase "e11_mars")
        (ai_erase "e11_cov")
    )
)

(script static void test_tunnel_entrance
    (begin
        (structure_bsp_index 1)
        (object_teleport (player0) "e11_test")
        (ai_place "e11_mars_warthog0")
        (if (not g_e11_started) 
            (wake e11_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e10_cov_guntower_shoot
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_shoot_point true e10_cov_guntower/p0)
                        (sleep (random_range 125 200))
                    )
                    (begin
                        (cs_shoot_point true e10_cov_guntower/p1)
                        (sleep (random_range 125 200))
                    )
                    (begin
                        (cs_shoot_point true e10_cov_guntower/p2)
                        (sleep (random_range 125 200))
                    )
                )
                (or
                    (<= (ai_strength ai_current_actor) 0.65)
                    (<= (ai_strength ai_current_squad) 0.5)
                )
            )
        )
        (ai_vehicle_exit ai_current_actor)
    )
)

(script command_script void cs_e10_cov_phantom0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by e10_cov_phantom0/p0)
        (cs_vehicle_boost false)
        (cs_fly_to e10_cov_phantom0/p1)
        (set g_e10_cov_phantom0_arrived true)
        (cs_fly_to_and_face e10_cov_phantom0/p2 e10_cov_phantom0/p2_facing 0.5)
        (cs_face true e10_cov_phantom0/p2_facing)
        (sleep 30)
        (set g_e10_cov_ghosts0_unloaded true)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc)
    )
)

(script command_script void cs_e10_cov_phantom0_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_face true e10_cov_phantom0/p2_facing)
        (cs_fly_to e10_cov_phantom0/p3 1.0)
        (cs_fly_to e10_cov_phantom0/p4 1.0)
        (sleep_until g_e11_started)
    )
)

(script command_script void cs_e10_cov_inf0_patrol1
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (sleep_until 
            (begin
                (cs_go_to e10_patrol/p2)
                (cs_look true e10_patrol/f0)
                (sleep (random_range 30 60))
                (cs_look false e10_patrol/f0)
                (cs_go_to e10_patrol/p3)
                (sleep (random_range 30 60))
                false
            )
        )
    )
)

(script command_script void cs_e10_cov_inf0_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (cs_go_to e10_patrol/p0)
                (cs_look true e10_patrol/f0)
                (sleep (random_range 30 60))
                (cs_look false e10_patrol/f0)
                (cs_go_to e10_patrol/p1)
                (sleep (random_range 30 60))
                false
            )
        )
    )
)

(script dormant void e10_warthog_approach_horn
    (begin
        (print "honk")
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" g_e10_warthog 1.5)
        (sleep 30)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
    )
)

(script command_script void cs_e10_warthog_approach
    (begin
        (cs_approach_player 10.0 100.0 100.0)
        (wake e10_warthog_approach_horn)
        (cs_vehicle_speed 0.5)
        (cs_approach_player 5.0 100.0 100.0)
        (sleep_until 
            (or
                (player_in_vehicle)
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 10.0)
                (not (unit_in_vehicle (ai_get_unit ai_current_actor)))
            )
        )
    )
)

(script static boolean e10_cov_phantom0_threat
    (begin
        (and
            g_e10_cov_phantom0_arrived
            (not g_e10_cov_phantom0_leaving)
        )
    )
)

(script dormant void e10_cov_phantom0_main
    (begin
        (sleep_until 
            (or
                (<= (ai_strength "e10_cov") 0.4)
                (volume_test_objects "tv_e10_cov_phantom0_begin" (players))
            ) 
        15)
        (ai_place "e10_cov_phantom0")
        (sleep_until g_e10_cov_ghosts0_unloaded)
        (sleep_until 
            (or
                (and
                    (> (ai_spawn_count "e10_cov_ghosts0_1") 0)
                    (<= (ai_living_count "e10_cov_ghosts0") 0)
                )
                (>= (object_model_targets_destroyed (ai_vehicle_get "e10_cov_phantom0/phantom0") "target_front") 3)
                (<= (object_get_health (ai_vehicle_get "e10_cov_phantom0/phantom0")) 0.05)
                g_e11_started
            ) 
        30 one_minute)
        (set g_e10_cov_phantom0_leaving true)
        (ai_set_orders "e10_cov_phantom0" "e10_cov_phantom0_retreat0")
        (cs_run_command_script "e10_cov_phantom0/phantom0" cs_e10_cov_phantom0_exit)
        (sleep 120)
        (game_save_no_timeout)
    )
)

(script dormant void e10_cov_ghosts0_main
    (begin
        (ai_place "e10_cov_ghosts1")
        (sleep_until (> (ai_spawn_count "e10_cov_phantom0") 0))
        (ai_place_in_vehicle "e10_cov_ghosts0_0" "e10_cov_phantom0")
        (sleep_until 
            (and
                g_e10_cov_ghosts0_unloaded
                (<= (ai_living_count "e10_cov_ghosts0") 1)
            )
        )
        (ai_place "e10_cov_ghosts0_1")
    )
)

(script dormant void e10_cov_inf1_main
    (begin
        (ai_place "e10_cov_inf1")
        (ai_vehicle_reserve "e10_guntower0" true)
    )
)

(script dormant void e10_cov_inf0_main
    (begin
        (ai_place "e10_cov_inf0")
    )
)

(script dormant void e10_mars_warthog0_main
    (begin
        (ai_migrate "e9_mars_test" "e10_mars_warthog0")
        (ai_migrate "e9_mars_warthog0" "e10_mars_warthog0")
        (ai_renew "e10_mars_warthog0")
        (ai_disposable "e10_mars_warthog0" false)
        (sleep_until 
            (and
                (not (player_in_vehicle))
                (or
                    (not (volume_test_object "tv_beach" g_e8_warthog))
                    (<= (object_get_health g_e8_warthog) 0.0)
                )
            )
        )
        (sleep 15_seconds)
        (sleep_until (not (volume_test_objects "tv_e10_mars_warthog0_unsafe" (players))))
        (ai_place "e10_mars_warthog0")
    )
)

(script dormant void e10_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e10_early_begin" (players))
                (volume_test_objects "tv_e10_main_begin" (players))
            ) 
        16)
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_e10_main_begin" (players)) 15)
        (set g_e10_started true)
        (print "e10_main")
        (data_mine_insert "e10_beach_fort")
        (wake e10_mars_warthog0_main)
        (wake e10_cov_inf0_main)
        (wake e10_cov_inf1_main)
        (wake e10_cov_ghosts0_main)
        (wake e10_cov_phantom0_main)
        (sleep_until g_e11_started)
        (sleep_forever e10_mars_warthog0_main)
        (sleep_forever e10_cov_inf0_main)
        (sleep_forever e10_cov_inf1_main)
        (sleep_forever e10_cov_ghosts0_main)
        (ai_disposable "e10_cov" true)
        (ai_disposable "e10_cov_phantom0" false)
    )
)

(script static void test_beach_fort
    (begin
        (structure_bsp_index 1)
        (object_teleport (player0) "e10_test")
        (ai_place "e10_mars_test")
        (if (not g_e10_started) 
            (wake e10_main))
        (if (not g_e11_started) 
            (wake e11_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e9_cov_guntower_shoot
    (begin
        (cs_force_combat_status 3)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_shoot_point true e9_cov_guntower/p0)
                        (sleep (random_range 125 200))
                    )
                    (begin
                        (cs_shoot_point true e9_cov_guntower/p1)
                        (sleep (random_range 125 200))
                    )
                    (begin
                        (cs_shoot_point true e9_cov_guntower/p2)
                        (sleep (random_range 125 200))
                    )
                )
                (or
                    (<= (ai_strength ai_current_actor) 0.65)
                    (<= (ai_strength ai_current_squad) 0.5)
                )
            )
        )
        (ai_vehicle_exit ai_current_actor)
    )
)

(script command_script void cs_e9_cov_guntower_abort
    (begin
        (cs_crouch false)
    )
)

(script command_script void cs_e9_beach_chatter_scene
    (begin
        (cs_switch "marine0")
        (cs_play_line "0520")
        (sleep 15)
        (cs_switch "marine1")
        (cs_play_line "0530")
        (sleep 10)
        (if (< (ai_combat_status ai_current_squad) ai_combat_status_active) 
            (begin
                (cs_switch "marine0")
                (cs_play_line "0540")
                (sleep 15)
            )
        )
        (if (>= (ai_combat_status ai_current_squad) ai_combat_status_active) 
            (begin
                (ai_play_line_on_object none "0550")
            )
        )
    )
)

(script command_script void cs_e9_cov_inf1_2_patrol
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (cs_go_to e9_patrol/p2)
                (sleep (random_range 30 60))
                (cs_go_to e9_patrol/p3)
                (sleep (random_range 30 60))
                false
            )
        )
    )
)

(script command_script void cs_e9_cov_inf1_0_patrol
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (cs_go_to e9_patrol/p0)
                (cs_look true e9_patrol/f0)
                (sleep (random_range 30 60))
                (cs_look false e9_patrol/f0)
                (cs_go_to e9_patrol/p1)
                (sleep (random_range 30 60))
                false
            )
        )
    )
)

(script command_script void cs_e9_warthog_abort
    (begin
        (sleep 1)
    )
)

(script dormant void e9_warthog_approach_horn
    (begin
        (print "honk")
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" g_e8_warthog 1.5)
        (sleep 30)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
    )
)

(script command_script void cs_e9_warthog_follow
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_moving false)
        (sleep_until 
            (begin
                (cs_approach_player 10.0 100.0 100.0)
                (wake e9_warthog_approach_horn)
                (cs_vehicle_speed 0.5)
                (cs_approach_player 5.0 100.0 100.0)
                (sleep_until 
                    (or
                        (player_in_vehicle)
                        (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 8.0)
                        (not (unit_in_vehicle (ai_get_unit ai_current_actor)))
                    )
                )
                (or
                    (player_in_vehicle)
                    (not (unit_in_vehicle (ai_get_unit ai_current_actor)))
                )
            ) 
        30 two_minutes)
    )
)

(script dormant void e9_cortana_dialog
    (begin
        (sleep_until 
            (or
                (objects_can_see_flag (players) "e9_dialog_trigger" 25.0)
                (volume_test_objects "tv_e9_dialogue" (players))
            ) 
        5 30_seconds)
        (sleep 15)
        (print "highest concentration under carrier")
        (sleep (ai_play_line_on_object none "0050"))
        (sleep 15)
        (sleep_until 
            (or
                (objects_can_see_flag (players) "e9_dialog_trigger" 25.0)
                (volume_test_objects "tv_e9_dialogue" (players))
            ) 
        5 150)
        (print "that bridge is the best route")
        (sleep (ai_play_line_on_object none "0060"))
        (sleep_until (volume_test_objects "tv_e9_main_begin" (players)))
        (sleep_until (ai_scene "e9_beach_chatter_scene" cs_e9_beach_chatter_scene "e9_mars_warthog0") 30 300)
    )
)

(script dormant void e9_warthog_navpoint
    (begin
        (sleep_until (> (ai_spawn_count "e8_mars_warthog0") 0))
        (if (not (player_in_vehicle)) 
            (deactivate_nav_point_object default player g_e8_warthog 1.0))
    )
)

(script dormant void e9_warthog_navpoint_kill
    (begin
        (sleep_until 
            (or
                (player_in_vehicle)
                (<= (unit_get_health g_e8_warthog) 0.0)
            )
        )
        (error_overflow_suppression player g_e8_warthog)
    )
)

(script dormant void e9_retreat_checkpoint0
    (begin
        (sleep_until (volume_test_objects "tv_e9_retreat_checkpoint" (players)) 30_seconds)
        (game_save_no_timeout)
    )
)

(script dormant void e9_retreat_checkpoint1
    (begin
        (sleep_forever e9_retreat_checkpoint0)
        (sleep_until (volume_test_objects "tv_e9_retreat_checkpoint" (players)) 30_seconds)
        (game_save_no_timeout)
    )
)

(script dormant void e9_music
    (begin
        (wake music_03a_05_start)
        (sleep_until (volume_test_objects "tv_beach" (players)))
        (wake music_03a_05_stop)
        (wake music_03a_06_start)
        (sleep_until (volume_test_objects "tv_e9_near_entrance" (players)))
        (wake music_03a_06_stop)
        (wake music_03a_065_start)
        (sleep_until (volume_test_objects "tv_e10_music" (players)))
        (sleep 150)
        (wake music_03a_065_start_alt)
        (sleep_until g_e11_started)
        (wake music_03a_065_stop)
    )
)

(script dormant void e9_cov_inf1_main
    (begin
        (ai_place "e9_cov_inf1_2" (pin (- 10.0 (ai_living_count "covenant")) 0.0 1.0))
        (sleep_until (volume_test_objects "tv_e9_main_begin" (players)) 15)
        (ai_place "e9_cov_inf1_0" (pin (- 10.0 (ai_living_count "covenant")) 1.0 3.0))
        (ai_place "e9_cov_inf1_1" (pin (- 10.0 (ai_living_count "covenant")) 1.0 2.0))
        (ai_vehicle_reserve "e9_guntower0" true)
        (sleep_until (<= (ai_living_count "e9_cov_inf1") 0))
        (game_save_no_timeout)
    )
)

(script dormant void e9_cov_inf0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e9_near_entrance" (players))
                (> (ai_spawn_count "e9_cov_ghosts0") 0)
            ) 
        30)
        (sleep_until 
            (or
                (volume_test_objects "tv_e9_near_entrance" (players))
                (<= (ai_living_count "e9_cov_inf1") 1)
            ) 
        15)
        (ai_place "e9_cov_inf0" (pin (- 10.0 (ai_living_count "e9_cov")) 3.0 7.0))
        (wake e9_retreat_checkpoint0)
    )
)

(script dormant void e9_cov_shadow0_main
    (begin
        (sleep_until (volume_test_objects "tv_e9_retreat_checkpoint" (players)) 15)
        (ai_place "e9_cov_shadow0")
    )
)

(script dormant void e9_cov_ghosts0_main
    (begin
        (sleep_until 
            (and
                (<= (ai_living_count "e9_cov_ghosts0") 0)
                (or
                    (volume_test_objects "tv_e9_near_entrance" (players))
                    (volume_test_objects "tv_e9_bypass" (players))
                    (<= (ai_living_count "e9_cov_inf1") 3)
                )
            ) 
        15)
        (ai_place "e9_cov_ghosts0")
        (wake e9_retreat_checkpoint0)
        (sleep_until (volume_test_objects "tv_e9_bypass" (players)) 15)
        (ai_migrate "e9_cov_ghosts0" "e10_cov_ghosts0_0")
    )
)

(script dormant void e9_mars_warthog0_main
    (begin
        (sleep_until (not (volume_test_objects "tv_e8_vehicle_spawn_area" (players))))
        (sleep_until (> (ai_spawn_count "e8_mars_warthog0") 0) 30)
        (ai_migrate "e8_mars_warthog0" "e9_mars_warthog0")
        (ai_renew "e9_mars_warthog0")
        (ai_disposable "e9_mars_warthog0" false)
        (cs_run_command_script "e9_mars_warthog0" cs_e9_warthog_abort)
        (ai_vehicle_reserve_seat g_e8_warthog "warthog_d" false)
        (ai_vehicle_enter "e9_mars_warthog0" g_e8_warthog warthog_d)
        (if (not (player_in_vehicle)) 
            (begin
                (sleep_until (vehicle_test_seat_list g_e8_warthog "warthog_d" (ai_actors "e9_mars")) 30 900)
                (cs_run_command_script (object_get_ai (vehicle_driver g_e8_warthog)) cs_e9_warthog_follow)
            )
        )
    )
)

(script dormant void e9_main
    (begin
        (sleep_until (volume_test_objects "tv_e9_main_begin" (players)) 15)
        (set g_e9_started true)
        (print "e9_main")
        (data_mine_insert "e9_beach_infantry")
        (game_saving)
        (wake e9_music)
        (wake chapter_title1)
        (wake objective3_set)
        (wake e9_cov_inf0_main)
        (wake e9_cov_inf1_main)
        (wake e9_cov_ghosts0_main)
        (wake e9_cov_shadow0_main)
        (wake e9_mars_warthog0_main)
        (wake e9_cortana_dialog)
        (wake e9_warthog_navpoint)
        (wake e9_warthog_navpoint_kill)
        (wake e9_music)
        (sleep_until g_e10_started)
        (sleep_forever e9_cov_inf0_main)
        (sleep_forever e9_cov_inf1_main)
        (sleep_forever e9_cov_ghosts0_main)
        (sleep_forever e9_cov_shadow0_main)
        (sleep_forever e9_mars_warthog0_main)
        (sleep_forever e9_cortana_dialog)
        (sleep_forever e9_retreat_checkpoint0)
        (sleep_forever e9_retreat_checkpoint1)
        (ai_disposable "e9_cov" true)
        (sleep_until g_e12_started)
        (ai_erase "e9_mars")
        (ai_erase "e9_cov")
    )
)

(script static void test_beach_infantry
    (begin
        (structure_bsp_index 1)
        (object_teleport (player0) "e9_test")
        (ai_place "e9_mars_test")
        (if (not g_e9_started) 
            (wake e9_main))
        (if (not g_e10_started) 
            (wake e10_main))
        (if (not g_e11_started) 
            (wake e11_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script static boolean e8_cov_phantom0_arrived
    (begin
        (= g_e8_cov_phantom0_arrived true)
    )
)

(script static boolean e8_cov_phantom0_leaving
    (begin
        (= g_e8_cov_phantom0_leaving true)
    )
)

(script static boolean e8_cov_ghosts0_nearby
    (begin
        (volume_test_objects "tv_e8_area" (ai_actors "e8_cov_ghosts0"))
    )
)

(script command_script void cs_e8_warthog_intro_scene
    (begin
        (cs_look_player true)
        (ai_play_line_at_player ai_current_actor "0510")
    )
)

(script command_script void cs_e8_mars_warthog0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (object_cannot_take_damage (ai_actors ai_current_squad))
        (cs_go_by e8_mars_warthog0_entry/p0 e8_mars_warthog0_entry/p1)
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" (ai_vehicle_get ai_current_actor) 1.5)
        (cs_go_to e8_mars_warthog0_entry/p1)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
        (object_can_take_damage (ai_actors ai_current_squad))
        (vehicle_unload (ai_vehicle_get ai_current_actor) warthog_p)
        (sleep 10)
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" (ai_vehicle_get ai_current_actor) 1.5)
        (sleep 8)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
        (sleep 5)
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" (ai_vehicle_get ai_current_actor) 1.5)
        (sleep 10)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
        (vehicle_unload (ai_vehicle_get ai_current_actor) warthog_d)
        (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "e8_mars_warthog0/warthog0") "warthog_d" true)
    )
)

(script command_script void cs_e8_cov_phantom0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e8_cov_phantom0_entry/p0)
        (cs_fly_to e8_cov_phantom0_entry/p1_1 1.0)
        (cs_face true e8_cov_phantom0_entry/p1_facing)
        (sleep 60)
        (set g_e8_cov_phantom0_arrived true)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) true)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_a)
        (sleep 90)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_b)
        (sleep 90)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_c)
        (set g_e8_cov_inf1_unloaded true)
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) false)
        (sleep 120)
        (cs_face false e8_cov_phantom0_entry/p1_facing)
        (set g_e8_cov_phantom0_leaving true)
        (cs_fly_by e8_cov_phantom0_entry/p2)
        (cs_fly_by e8_cov_phantom0_entry/p3)
        (cs_fly_by e8_cov_phantom0_entry/p4)
        (cs_fly_by e8_cov_phantom0_entry/p5)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e8_cov_ghosts0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_go_to e8_cov_ghosts0_entry/p0)
        (sleep (random_range 0 30))
        (cs_vehicle_boost false)
    )
)

(script command_script void cs_e8_mars_inf0_no_assholes
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_abort_on_damage true)
        (sleep (random_range 15 45))
        (ai_magically_see ai_current_squad "e8_cov_phantom0")
        (cs_aim_object true (ai_vehicle_get "e8_cov_phantom0/phantom0"))
        (sleep_until g_e8_cov_phantom0_arrived)
    )
)

(script command_script void cs_e8_cov_inf2_patrol2
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_abort_on_damage true)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to e8_patrol/p2)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_go_to e8_patrol/p3)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_go_to e8_patrol/p4)
                        (sleep (random_range 30 60))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_e8_cov_inf2_patrol1
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_abort_on_damage true)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (cs_go_to e8_patrol/p0)
                (cs_look true e8_patrol/f0)
                (sleep (random_range 30 60))
                (cs_look false e8_patrol/f0)
                (cs_go_to e8_patrol/p1)
                (sleep (random_range 30 60))
                false
            )
        )
    )
)

(script command_script void cs_e8_cov_inf2_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_uninspected)
        (cs_abort_on_damage true)
        (cs_look_object true (ai_get_object "e8_cov_inf2/grunt0"))
        (sleep_forever)
    )
)

(script dormant void e8_warthog_scene
    (begin
        (sleep_until 
            (or
                (ai_scene "e8_warthog_intro_scene" cs_e8_warthog_intro_scene "e8_mars_warthog0/warthog0")
                (<= (ai_living_count "e8_mars_warthog0/warthog0") 0)
            ) 
        5 two_minutes)
    )
)

(script dormant void e8_cov_ghosts0_main
    (begin
        (sleep_until (> (ai_spawn_count "e8_mars_warthog0") 0) 15)
        (sleep 180)
        (sleep_until (not (volume_test_objects "tv_e8_vehicle_spawn_area" (players))))
        (ai_place "e8_cov_ghosts0_0" 1)
        (sleep_until (<= (ai_living_count "e8_cov_ghosts0") 0))
        (sleep_until (not (volume_test_objects "tv_e8_vehicle_spawn_area" (players))))
        (ai_place "e8_cov_ghosts0_0" (pin (- 10.0 (ai_living_count "covenant")) 0.0 2.0))
    )
)

(script dormant void e8_cov_phantom0_main
    (begin
        (ai_place "e8_cov_phantom0")
    )
)

(script dormant void e8_cov_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e8_cov_inf2_begin" (players)) 15)
        (ai_place "e8_cov_inf2" (pin (- 10.0 (ai_living_count "e8_cov")) 1.0 4.0))
        (sleep_until (<= (ai_living_count "e8_cov_inf2") 0))
        (game_save_no_timeout)
    )
)

(script dormant void e8_cov_inf1_main
    (begin
        (sleep_until (> (ai_spawn_count "e8_cov_phantom0") 0))
        (ai_place_in_vehicle "e8_cov_inf1" "e8_cov_phantom0")
    )
)

(script dormant void e8_cov_inf0_main
    (begin
        (ai_place "e8_cov_inf0")
    )
)

(script dormant void e8_mars_warthog0_main
    (begin
        (sleep_until 
            (or
                g_e9_started
                (and
                    g_e8_cov_inf1_unloaded
                    (<= (ai_living_count "e8_cov_inf1") 5)
                    (= (version) 1)
                )
            ) 
        15 one_minute)
        (sleep_until 
            (and
                (= (version) 1)
                (not (volume_test_objects "tv_e8_vehicle_spawn_area" (players)))
            )
        )
        (ai_place "e8_mars_warthog0")
        (sleep 3)
        (set g_e8_warthog (ai_vehicle_get_from_starting_location "e8_mars_warthog0/warthog0"))
        (wake e8_warthog_scene)
        (sleep 450)
        (object_can_take_damage (ai_actors "e8_mars_warthog0"))
        (sleep_until 
            (or
                (and
                    (player_in_vehicle)
                    (<= (ai_living_count "e8_cov_inf1") 0)
                )
                g_e9_started
            )
        )
        (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "e8_mars_warthog0/warthog0") "warthog_d" false)
        (if (not g_e9_started) 
            (wake e9_main))
    )
)

(script dormant void e8_mars_inf0_main
    (begin
        (ai_migrate "e7_mars_inf0" "e8_mars_inf0")
        (ai_renew "e8_mars_inf0")
        (ai_disposable "e8_mars_inf0" false)
        (sleep_until 
            (and
                (> (ai_spawn_count "e8_cov_inf0") 0)
                (<= (ai_living_count "e8_cov_inf0") 0)
            )
        )
        (cs_run_command_script "e8_mars_inf0" cs_e8_mars_inf0_no_assholes)
    )
)

(script dormant void e8_main
    (begin
        (sleep_until (volume_test_objects "tv_e8_main_begin" (players)) 15)
        (set g_e8_started true)
        (print "e8_main")
        (data_mine_insert "e8_hotel_exit")
        (game_save_no_timeout)
        (wake music_03a_04_stop)
        (wake objective2_clear)
        (wake e9_main)
        (wake e10_main)
        (wake e11_main)
        (wake e8_mars_inf0_main)
        (wake e8_cov_inf0_main)
        (wake e8_cov_inf1_main)
        (wake e8_cov_inf2_main)
        (wake e8_cov_phantom0_main)
        (wake e8_cov_ghosts0_main)
        (wake e8_mars_warthog0_main)
        (sleep_until g_e9_started)
        (ai_disposable "e8_cov" true)
        (ai_disposable "e8_cov_phantom0" false)
        (sleep_until g_e10_started)
        (sleep_forever e8_mars_inf0_main)
        (sleep_forever e8_cov_inf0_main)
        (sleep_forever e8_cov_inf1_main)
        (sleep_forever e8_cov_inf2_main)
        (sleep_forever e8_cov_phantom0_main)
        (sleep_forever e8_cov_ghosts0_main)
        (sleep_forever e8_mars_warthog0_main)
        (ai_disposable "e8_mars" true)
    )
)

(script static void test_hotel_exit
    (begin
        (structure_bsp_index 1)
        (object_teleport (player0) "e8_test")
        (ai_place "e8_mars_inf0")
        (if (not g_e8_started) 
            (wake e8_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script static boolean oes_e7_spring_ambush
    (begin
        (and
            (or
                (volume_test_objects "tv_e7_cov_inf0_spring_ambush" (ai_actors "e7_cov_inf0"))
                (>= (ai_combat_status "e7_cov_inf0") ai_combat_status_certain)
            )
            (> (ai_spawn_count "e7_cov_inf0") 0)
        )
    )
)

(script command_script void cs_e7_hide
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_enable_moving true)
        (cs_look true e7_hallway_ambush/f0)
        (cs_aim true e7_hallway_ambush/f0)
        (sleep_until (oes_e7_spring_ambush))
    )
)

(script command_script void cs_e7_cov_inf0_entry
    (begin
        (cs_ignore_obstacles true)
        (cs_look true e7_hallway_ambush/cov1)
        (cs_aim true e7_hallway_ambush/cov1)
        (cs_go_to e7_hallway_ambush/cov0)
        (cs_go_to e7_hallway_ambush/cov1)
    )
)

(script command_script void cs_e7_abort
    (begin
        (cs_crouch false)
    )
)

(script command_script void cs_e7_hotel_hall_scene0
    (begin
        (cs_play_line "0470")
    )
)

(script command_script void cs_e7_hotel_hall_scene1
    (begin
        (cs_play_line "0480")
    )
)

(script dormant void e7_cov_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e7_cov_inf0_init" (players)) 15)
        (sleep 15)
        (object_create "e7_gun0")
        (weapon_hold_trigger "e7_gun0" 0 true)
        (sleep 10)
        (weapon_hold_trigger "e7_gun0" 0 false)
        (sleep 10)
        (weapon_hold_trigger "e7_gun0" 0 true)
        (sleep 10)
        (weapon_hold_trigger "e7_gun0" 0 false)
        (ai_place "e7_cov_inf0")
        (sleep 20)
        (weapon_hold_trigger "e7_gun0" 0 true)
        (sleep 8)
        (weapon_hold_trigger "e7_gun0" 0 false)
        (object_destroy "e7_gun0")
        (sleep_until 
            (begin
                (if 
                    (or
                        (volume_test_objects "tv_e7_hall" (players))
                        (volume_test_objects "tv_e7_hall" (ai_actors "e7_mars"))
                        (player_camera_control)
                    ) 
                        (ai_set_blind "e7_cov_inf0" false) (ai_set_blind "e7_cov_inf0" true))
                (oes_e7_spring_ambush)
            ) 
        2)
        (cs_run_command_script "e7_cov_inf0" cs_e7_abort)
        (ai_set_blind "e7_cov_inf0" false)
    )
)

(script dormant void e7_mars_inf0_main
    (begin
        (ai_migrate "e6_mars_inf1/marine0" "e7_mars_inf0")
        (ai_migrate "e6_mars_inf1/marine1" "e7_mars_inf0")
        (ai_renew "e7_mars_inf0")
        (ai_disposable "e7_mars_inf0" false)
        (sleep_until 
            (begin
                (if 
                    (or
                        (<= (ai_living_count "e6_mars_inf0") 0)
                        (>= (ai_living_count "e7_mars_inf0") 3)
                    ) 
                        (= 1.0 1.0) (begin
                            (print "migrated an actor")
                            (ai_attach_units (unit (list_get (ai_actors "e6_mars_inf0") 0)) "e7_mars_inf0")
                            (= 1.0 0.0)
                        )
                )
            )
        )
        (sleep_until (> (ai_spawn_count "e7_cov_inf0") 0) 10)
        (cs_run_command_script "e7_mars_inf0" cs_e7_hide)
        (ai_disregard (ai_actors "e7_mars_inf0") true)
        (ai_scene "e7_hotel_hall_scene0" cs_e7_hotel_hall_scene0 "e7_mars_inf0")
        (sleep_until (oes_e7_spring_ambush) 2)
        (cs_run_command_script "e7_mars_inf0" cs_e7_abort)
        (ai_disregard (ai_actors "e7_mars_inf0") false)
    )
)

(script dormant void e7_main
    (begin
        (sleep_until (volume_test_objects "tv_e7_main_begin" (players)) 15)
        (set g_e7_started true)
        (print "e7_main")
        (data_mine_insert "e7_hotel_hall")
        (game_save_no_timeout)
        (player_training_activate_stealth)
        (wake e7_mars_inf0_main)
        (wake e7_cov_inf0_main)
        (sleep_until (= (version) 1) 1)
        (camera_predict_resources_at_point "e8_prediction")
        (ai_disposable "e7_cov" true)
        (sleep_until g_e9_started)
        (sleep_forever e7_mars_inf0_main)
        (sleep_forever e7_cov_inf0_main)
        (sleep_until g_e10_started)
        (ai_erase "e7_mars")
        (ai_erase "e7_cov")
    )
)

(script static void test_hotel_hall
    (begin
        (object_teleport (player0) "e7_test")
        (ai_place "e7_mars_inf0")
        (if (not g_e7_started) 
            (wake e7_main))
        (if (not g_e8_started) 
            (wake e8_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e6_mars_inf1_odst
    (begin
        (sleep_until 
            (begin
                (cs_shoot false (ai_get_object ai_current_actor))
                (sleep 4)
                (if (< (object_get_health (ai_get_object ai_current_actor)) 0.5) 
                    (cs_crouch true))
                (sleep_until (>= (object_get_health (ai_get_object ai_current_actor)) 0.49) 5)
                (cs_crouch false)
                (sleep 15)
                (cs_shoot true (list_get (ai_actors "e6_cov_inf0") (random_range 0 (list_count (ai_actors "e6_cov_inf0")))))
                (sleep_until 
                    (or
                        (< (object_get_health (ai_get_object ai_current_actor)) 0.5)
                        (<= (ai_living_count "e6_cov_inf0") 0)
                    ) 
                5 60)
                (<= (ai_living_count "e6_cov_inf0") 0)
            ) 
        15)
    )
)

(script command_script void cs_e6_mars_inf1_cower
    (begin
        (cs_crouch true)
        (sleep_forever)
    )
)

(script command_script void cs_e6_mars_inf0_1_cower
    (begin
        (cs_crouch true)
        (sleep_until (volume_test_objects "tv_e6_hotel_entrance" (players)))
    )
)

(script command_script void cs_e6_mars_inf1_abort
    (begin
        (sleep 1)
    )
)

(script command_script void cs_e6_mars_inf1_lead
    (begin
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_e6_hotel_vicinity" (players)) 
                    (begin
                        (cs_enable_looking true)
                        (cs_face_player false)
                        (cs_start_to e6_mars_inf1_lead/p1)
                        (sleep_until (not (volume_test_objects "tv_e6_hotel_vicinity" (players))))
                    ) (begin
                        (cs_enable_looking false)
                        (cs_face_player true)
                        (cs_start_to e6_mars_inf1_lead/p0)
                        (sleep_until (volume_test_objects "tv_e6_hotel_vicinity" (players)))
                    )
                )
                false
            ) 
        15)
    )
)

(script command_script void cs_e6_hotel_greeting_scene
    (begin
        (cs_enable_targeting false)
        (cs_look_player true)
        (cs_start_to e6_mars_inf1_lead/p0)
        (sleep_until (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 7.0) 15)
        (sleep (ai_play_line_at_player ai_current_actor "8070"))
        (cs_movement_mode ai_movement_patrol)
        (cs_look_player false)
        (cs_enable_looking true)
        (cs_approach_player 2.0 5.0 10.0)
        (sleep (ai_play_line_at_player ai_current_actor "0460"))
        (wake music_03a_04_start)
        (cs_movement_mode ai_movement_combat)
        (cs_go_to e6_mars_inf1_lead/p1)
        (cs_queue_command_script ai_current_actor cs_e6_mars_inf1_lead)
    )
)

(script command_script void cs_e6_hotel_grunt_scene
    (begin
        (cs_play_line "0430")
    )
)

(script command_script void cs_e6_hotel_rescue_scene
    (begin
        (cs_play_line "0450")
    )
)

(script static boolean e6_cov_inf0_not_a_threat
    (begin
        (and
            (<= (ai_living_count "e6_cov") 4)
            (<= (ai_fighting_count "e6_cov") 0)
        )
    )
)

(script dormant void e6_cov_inf1_main
    (begin
        (if (not (volume_test_objects "tv_e6_main_begin2" (players))) 
            (sleep_forever))
        (ai_place "e6_cov_inf1")
        (sleep_until (ai_scene "e6_hotel_grunt_scene" cs_e6_hotel_grunt_scene "e6_cov_inf1") 30 two_minutes)
    )
)

(script dormant void e6_cov_inf0_main
    (begin
        (ai_place "e6_cov_inf0_2")
        (ai_place "e6_cov_inf0_0" (pin (- 10.0 (ai_living_count "covenant")) 1.0 2.0))
        (ai_place "e6_cov_inf0_1" (pin (- 10.0 (ai_living_count "covenant")) 0.0 2.0))
    )
)

(script dormant void e6_mars_inf1_main
    (begin
        (ai_place "e6_mars_inf1")
        (sleep_until 
            (or
                (volume_test_objects "tv_e6_hotel_vicinity" (players))
                (e6_cov_inf0_not_a_threat)
            ) 
        10)
        (sleep_until 
            (or
                (ai_scene "e6_hotel_greeting_scene" cs_e6_hotel_greeting_scene "e6_mars_inf1/marine0")
                (<= (ai_living_count "e6_mars_inf1/marine0") 0)
                (volume_test_objects "tv_e6_hotel_entrance" (players))
            ) 
        5)
        (sleep 20)
        (cs_run_command_script "e6_mars_inf1/marine1" cs_e6_mars_inf1_abort)
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_e6_hotel_entrance" (players)) 15)
        (cs_run_command_script "e6_mars_inf1/marine0" cs_e6_mars_inf1_abort)
    )
)

(script dormant void e6_mars_inf0_main
    (begin
        (ai_migrate "e5_mars_inf0" "e6_mars_inf0")
        (ai_renew "e6_mars_inf0")
        (ai_disposable "e6_mars_inf0" false)
        (sleep_until (> (ai_spawn_count "e6_cov_inf0") 0))
        (ai_place "e6_mars_inf0_1" (- 2.0 (ai_living_count "e6_mars_inf0")))
        (ai_migrate "e6_mars_inf0_1" "e6_mars_inf0")
        (ai_renew "e6_mars_inf0")
        (ai_disposable "e6_mars_inf0" false)
    )
)

(script dormant void e6_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e6_main_begin0" (players))
                (volume_test_objects "tv_e6_main_begin1" (players))
                (volume_test_objects "tv_e6_main_begin2" (players))
            ) 
        15)
        (set g_e6_started true)
        (print "e6_main")
        (data_mine_insert "e6_hotel_entrance")
        (game_save_no_timeout)
        (wake music_03a_03_stop)
        (wake e7_main)
        (wake e6_mars_inf0_main)
        (wake e6_mars_inf1_main)
        (wake e6_cov_inf0_main)
        (wake e6_cov_inf1_main)
        (sleep_until g_e7_started)
        (ai_disposable "e6_cov" true)
        (sleep_until (= (version) 1))
        (sleep_forever e6_mars_inf0_main)
        (sleep_forever e6_mars_inf1_main)
        (sleep_forever e6_cov_inf0_main)
        (sleep_forever e6_cov_inf1_main)
        (sleep_until (= (version) 1))
        (ai_erase "e6_mars")
        (ai_erase "e6_cov")
    )
)

(script static void test_hotel_entrance
    (begin
        (object_teleport (player0) "e6_test")
        (ai_place "e6_mars_inf0")
        (if (not g_e6_started) 
            (wake e6_main))
        (if (not g_e8_started) 
            (wake e8_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script static void e5b_reset_player
    (begin
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
        (object_teleport (player0) "e5b_return")
        (unit_add_equipment (unit (player0)) "wimpy" true true)
        (sleep 5)
        (cinematic_start 1.0 1.0 1.0 5)
        (sleep 5)
    )
)

(script dormant void e5b_resetter
    (begin
        (sleep_until 
            (begin
                (if (not (volume_test_object "tv_e5b_bounds" (player0))) 
                    (e5b_reset_player))
                g_e5b_finished
            )
        )
    )
)

(script dormant void e5b_inf0_main
    (begin
        (ai_place "e5b_cov_inf0" 1)
        (ai_set_active_camo "e5b_cov_inf0" true)
        (sleep 90)
        (ai_set_active_camo "e5b_cov_inf0" false)
        (ai_magically_see_object "e5b_cov_inf0" (player0))
        (sleep_until (<= (ai_living_count "e5b_cov_inf0") 0))
        (garbage_collect_now)
        (ai_place "e5b_cov_inf0" 2)
        (ai_set_active_camo "e5b_cov_inf0" true)
        (sleep 90)
        (ai_set_active_camo "e5b_cov_inf0" false)
        (ai_magically_see_object "e5b_cov_inf0" (player0))
        (sleep_until (<= (ai_living_count "e5b_cov_inf0") 0))
        (garbage_collect_now)
        (ai_place "e5b_cov_inf0" 3)
        (ai_set_active_camo "e5b_cov_inf0" true)
        (sleep 90)
        (ai_set_active_camo "e5b_cov_inf0" false)
        (ai_magically_see_object "e5b_cov_inf0" (player0))
        (sleep_until (<= (ai_living_count "e5b_cov_inf0") 0))
        (garbage_collect_now)
        (ai_place "e5b_cov_inf0" 4)
        (ai_set_active_camo "e5b_cov_inf0" true)
        (sleep 90)
        (ai_set_active_camo "e5b_cov_inf0" false)
        (ai_magically_see_object "e5b_cov_inf0" (player0))
        (sleep_until (<= (ai_living_count "e5b_cov_inf0") 0))
        (garbage_collect_now)
        (ai_place "e5b_cov_inf0" 5)
        (ai_set_active_camo "e5b_cov_inf0" true)
        (sleep 90)
        (ai_set_active_camo "e5b_cov_inf0" false)
        (ai_magically_see_object "e5b_cov_inf0" (player0))
        (sleep_until (<= (ai_living_count "e5b_cov_inf0") 0))
        (garbage_collect_now)
        (ai_place "e5b_cov_inf0" 6)
        (ai_set_active_camo "e5b_cov_inf0" true)
        (sleep 90)
        (ai_set_active_camo "e5b_cov_inf0" false)
        (ai_magically_see_object "e5b_cov_inf0" (player0))
        (sleep_until (<= (ai_living_count "e5b_cov_inf0") 0))
        (garbage_collect_now)
        (ai_place "e5b_cov_inf0" 7)
        (ai_set_active_camo "e5b_cov_inf0" true)
        (sleep 90)
        (ai_set_active_camo "e5b_cov_inf0" false)
        (ai_magically_see_object "e5b_cov_inf0" (player0))
        (sleep_until (<= (ai_living_count "e5b_cov_inf0") 0))
        (garbage_collect_now)
        (set g_e5b_finished true)
        (reset_dsp_image 5)
    )
)

(script dormant void e5b_main
    (begin
        (if 
            (or
                (game_can_use_flashlights)
                (not (difficulty_legendary))
                (not (= 0 (random_range 0 7)))
            ) 
                (sleep_forever))
        (sleep_until (volume_test_objects "tv_e5b_main" (players)) 15)
        (game_save_immediate)
        (game_save_no_timeout)
        (sleep_until (not (sound_set_tag_parameter_unsafe)) 1)
        (if (not (sound_impulse_predict)) 
            (begin
                (set g_e5b_started true)
                (object_create "key")
                (sleep_until 
                    (and
                        (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                        (volume_test_object "tv_e5b_main" (player0))
                    ) 
                5)
                (sleep 30)
                (e5b_reset_player)
                (wake e5b_inf0_main)
                (wake e5b_resetter)
            )
        )
    )
)

(script command_script void cs_e5_cov_inf0_guard0
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_aim true e5_cov_ambush/look0)
                        (sleep (random_range 100 150))
                    )
                    (begin
                        (cs_aim true e5_cov_ambush/look1)
                        (sleep (random_range 45 90))
                    )
                    (begin
                        (cs_aim true e5_cov_ambush/look2)
                        (sleep (random_range 45 90))
                    )
                )
                false
            ) 
        5)
    )
)

(script command_script void cs_e5_cov_inf0_wait
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_crouch true)
        (sleep_until (ai_trigger_test "e5_cov_inf0_ambush_sprung" ai_current_squad) 5)
    )
)

(script static boolean e5_cov_inf0_ambush_trigger
    (begin
        (or
            (volume_test_objects "tv_e5_ambush_trigger0" (players))
            (volume_test_objects "tv_e5_ambush_trigger1" (players))
            (volume_test_objects "tv_e5_ambush_trigger2" (players))
        )
    )
)

(script static boolean e5_cov_inf1_done
    (begin
        (= g_e5_cov_inf1_done true)
    )
)

(script dormant void e5_cov_inf4_main
    (begin
        (ai_migrate "e4_cov_inf1" "e5_cov_inf4")
    )
)

(script dormant void e5_cov_inf3_main
    (begin
        (if (not (difficulty_legendary)) 
            (sleep_forever))
        (sleep_until (volume_test_objects "tv_e5_player_advanced" (players)))
        (if (< (ai_living_count "covenant") 15) 
            (ai_place "e5_cov_inf3"))
    )
)

(script dormant void e5_cov_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e5_player_advanced" (players)))
        (if (< (ai_living_count "covenant") 15) 
            (ai_place "e5_cov_inf2"))
    )
)

(script static void e5_cov_inf1_0_spawn
    (begin
        (print "e5_cov_inf1_0_spawn")
        (if 
            (and
                (<= (ai_living_count "e5_cov_inf1") 1)
                (not (volume_test_objects "tv_e5_cov_inf1_unsafe0" (players)))
                (not (volume_test_objects "tv_e5_cov_inf1_done" (players)))
            ) 
                (begin
                    (ai_place "e5_cov_inf1_0" (pin (- 7.0 (ai_living_count "e5_cov")) 0.0 4.0))
                    (ai_set_orders "e5_cov_inf1_0" "e5_cov_inf1_0_init")
                )
        )
        (sleep_until 
            (or
                (<= (ai_living_count "e5_cov_inf1") 1)
                (volume_test_objects "tv_e5_cov_inf1_done" (players))
            )
        )
        (sleep_until (volume_test_objects "tv_e5_cov_inf1_done" (players)) 30 g_e5_cov_inf1_spawn_delay)
    )
)

(script static void e5_cov_inf1_1_spawn
    (begin
        (print "e5_cov_inf1_1_spawn")
        (if 
            (and
                (<= (ai_living_count "e5_cov_inf1") 1)
                (not (volume_test_objects "tv_e5_cov_inf1_unsafe1" (players)))
                (not (volume_test_objects "tv_e5_cov_inf1_done" (players)))
            ) 
                (begin
                    (ai_place "e5_cov_inf1_1" (pin (- 7.0 (ai_living_count "e5_cov")) 0.0 4.0))
                    (ai_set_orders "e5_cov_inf1_1" "e5_cov_inf1_1_init")
                )
        )
        (sleep_until 
            (or
                (<= (ai_living_count "e5_cov_inf1") 1)
                (volume_test_objects "tv_e5_cov_inf1_done" (players))
            )
        )
        (sleep_until (volume_test_objects "tv_e5_cov_inf1_done" (players)) 30 g_e5_cov_inf1_spawn_delay)
    )
)

(script dormant void e5_cov_inf1_main
    (begin
        (ai_migrate "e4_cov_inf2" "e5_cov_inf1_1")
        (sleep_until (volume_test_objects "tv_e5_advanced0" (players)) 15)
        (if (difficulty_heroic) 
            (begin
                (set g_e5_cov_inf1_max 16)
                (set g_e5_cov_inf1_spawn_delay 15)
            )
        )
        (if (difficulty_legendary) 
            (begin
                (set g_e5_cov_inf1_max 30)
                (set g_e5_cov_inf1_spawn_delay 5)
            )
        )
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_e5_main_begin0" (players)) 
                    (e5_cov_inf1_0_spawn) (e5_cov_inf1_1_spawn))
                (if (not (volume_test_objects "tv_e5_main_begin0" (players))) 
                    (e5_cov_inf1_0_spawn) (e5_cov_inf1_1_spawn))
                (if (not g_e5b_started) 
                    (game_save_no_timeout))
                (or
                    (>= (+ (ai_spawn_count "e5_cov_inf1_0") (ai_spawn_count "e5_cov_inf1_1")) g_e5_cov_inf1_max)
                    (volume_test_objects "tv_e5_cov_inf1_done" (players))
                )
            )
        )
        (set g_e5_cov_inf1_done true)
    )
)

(script dormant void e5_cov_inf0_main
    (begin
        (ai_place "e5_cov_inf0_0/sniper0")
        (sleep_until 
            (or
                (< (ai_living_count "e5_cov_inf0") 1)
                (volume_test_objects "tv_e5_advanced1" (players))
            )
        )
        (if (< (ai_living_count "covenant") 15) 
            (ai_place "e5_cov_inf0_0/sniper1"))
        (sleep_until 
            (or
                (< (ai_living_count "e5_cov_inf0") 2)
                (volume_test_objects "tv_e5_advanced1" (players))
            )
        )
        (if (< (ai_living_count "covenant") 15) 
            (ai_place "e5_cov_inf0_0/sniper2"))
        (sleep_until 
            (or
                (< (ai_living_count "e5_cov_inf0") 2)
                (volume_test_objects "tv_e5_advanced1" (players))
            )
        )
        (if (< (ai_living_count "covenant") 15) 
            (ai_place "e5_cov_inf0_0/sniper3"))
    )
)

(script dormant void e5_mars_inf0_main
    (begin
        (ai_migrate "e4_mars_inf0" "e5_mars_inf0")
        (ai_renew "e5_mars_inf0")
        (ai_disposable "e5_mars_inf0" false)
    )
)

(script dormant void e5_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e5_main_begin0" (players))
                (volume_test_objects "tv_e5_main_begin1" (players))
                (volume_test_objects "tv_e5_main_begin2" (players))
            )
        )
        (set g_e5_started true)
        (print "e5_main")
        (data_mine_insert "e5_neighborhood")
        (if (not g_e5b_started) 
            (game_save_no_timeout))
        (wake music_03a_03_stop)
        (wake e5_mars_inf0_main)
        (wake e5_cov_inf0_main)
        (wake e5_cov_inf1_main)
        (wake e5_cov_inf2_main)
        (wake e5_cov_inf3_main)
        (wake e5_cov_inf4_main)
        (sleep_until g_e6_started)
        (ai_disposable "e5_cov" true)
        (sleep_until 
            (or
                (= (version) 1)
                g_e5b_started
            )
        )
        (sleep_forever e5_mars_inf0_main)
        (sleep_forever e5_cov_inf0_main)
        (sleep_forever e5_cov_inf1_main)
        (sleep_forever e5_cov_inf2_main)
        (sleep_forever e5_cov_inf3_main)
        (sleep_until 
            (or
                (= (version) 1)
                g_e5b_started
            )
        )
        (ai_erase "e5_mars")
        (ai_erase "e5_cov")
    )
)

(script static void test_neighborhood
    (begin
        (object_teleport (player0) "e5_test")
        (ai_place "e5_mars_inf0")
        (if (not g_e5_started) 
            (wake e5_main))
        (if (not g_e6_started) 
            (wake e6_main))
        (if (not g_e8_started) 
            (wake e8_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e4_cov_inf0_0_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (sleep_until 
            (begin
                (cs_go_to e4_patrol/p2)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f0)
                (sleep (random_range 60 90))
                (cs_look false e4_patrol/f0)
                (cs_enable_looking true)
                (cs_go_to e4_patrol/p3)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f0)
                (sleep (random_range 60 90))
                (cs_look false e4_patrol/f0)
                (cs_enable_looking true)
                false
            )
        )
    )
)

(script command_script void cs_e4_cov_inf0_0_patrol1
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (sleep_until 
            (begin
                (cs_go_to e4_patrol/p4)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f0)
                (sleep (random_range 60 90))
                (cs_look false e4_patrol/f0)
                (cs_enable_looking true)
                (cs_go_to e4_patrol/p5)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f0)
                (sleep (random_range 60 90))
                (cs_look false e4_patrol/f0)
                (cs_enable_looking true)
                false
            )
        )
    )
)

(script command_script void cs_e4_cov_inf0_2_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (sleep_until 
            (begin
                (cs_go_to e4_patrol/p0)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f0)
                (sleep (random_range 60 90))
                (cs_look false e4_patrol/f0)
                (cs_enable_looking true)
                (cs_go_to e4_patrol/p1)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f0)
                (sleep (random_range 60 90))
                (cs_look false e4_patrol/f0)
                (cs_enable_looking true)
                false
            )
        )
    )
)

(script command_script void cs_e4_cov_inf0_1_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (sleep_until 
            (begin
                (cs_go_to e4_patrol/p6)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f0)
                (sleep (random_range 60 90))
                (cs_look false e4_patrol/f0)
                (cs_enable_looking true)
                (cs_go_to e4_patrol/p7)
                (cs_enable_looking false)
                (cs_look true e4_patrol/f1)
                (sleep (random_range 45 60))
                (cs_look false e4_patrol/f1)
                (cs_enable_looking true)
                false
            )
        )
    )
)

(script command_script void cs_e4_cov_inf2_lurk
    (begin
        (cs_crouch true)
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (sleep_until 
            (or
                (>= (ai_combat_status ai_current_squad) ai_combat_status_clear_los)
                (volume_test_objects "tv_e4_cov_inf2_begin" (players))
            ) 
        15)
    )
)

(script dormant void e4_cov_snipers0_main
    (begin
        (ai_place "e4_cov_snipers0_0")
        (ai_place "e4_cov_snipers0_1")
        (sleep_until 
            (or
                (< (ai_living_count "e4_cov_snipers0") 3)
                (volume_test_objects "tv_e4_cov_inf1_main_begin" (players))
            )
        )
        (if (< (ai_living_count "e4_cov_snipers0") 3) 
            (ai_place "e4_cov_snipers0_2/sniper0"))
        (sleep_until 
            (or
                (< (ai_living_count "e4_cov_snipers0") 3)
                (volume_test_objects "tv_e4_player_moved_up" (players))
            )
        )
        (sleep_until 
            (or
                (< (ai_living_count "e4_cov_snipers0") 3)
                (volume_test_objects "tv_e4_player_moved_up" (players))
            )
        )
        (if (< (ai_living_count "e4_cov_snipers0") 3) 
            (ai_place "e4_cov_snipers0_2/sniper1"))
        (sleep_until 
            (or
                (< (ai_living_count "e4_cov_snipers0") 3)
                (volume_test_objects "tv_e4_player_moved_up" (players))
            )
        )
        (if (< (ai_living_count "e4_cov_snipers0") 3) 
            (ai_place "e4_cov_snipers0_2/sniper2"))
        (sleep_until (<= (ai_living_count "e4_cov_snipers0") 0))
        (game_save_no_timeout)
    )
)

(script dormant void e4_cov_inf2_main
    (begin
        (if (difficulty_normal) 
            (sleep_forever))
        (sleep_until (volume_test_objects "tv_e4_player_moved_up" (players)) 15)
        (if 
            (and
                (difficulty_legendary)
                (= (random_range 0 3) 0)
            ) 
                (ai_place "e4_cov_inf2" (pin (- 8.0 (ai_living_count "e4_cov")) 1.0 3.0)) (ai_place "e4_cov_inf2" (pin (- 8.0 (ai_living_count "e4_cov")) 1.0 2.0)))
        (sleep_until 
            (or
                (<= (ai_living_count "e4_cov_inf2") 0)
                g_e5_started
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void e4_cov_inf1_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e4_player_moved_up" (players))
                (<= (ai_living_count "e4_cov_snipers0_0") 1)
            ) 
        15)
        (ai_place "e4_cov_inf1_0" (pin (- 7.0 (ai_living_count "e4_cov")) 2.0 4.0))
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (ai_living_count "e4_cov") 6)
                        (not (volume_test_objects "tv_e4_end_of_street" (players)))
                    ) 
                        (ai_place "e4_cov_inf1_0" 2))
                (or
                    (>= (ai_spawn_count "e4_cov_inf1") 8)
                    (volume_test_objects "tv_e4_end_of_street" (players))
                )
            ) 
        90)
    )
)

(script dormant void e4_cov_inf0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e4_player_moved_up" (players))
                (and
                    (<= (ai_living_count "e4_cov_snipers0_1") 0)
                    (<= (ai_living_count "e4_cov_snipers0_2") 1)
                )
            ) 
        15)
        (ai_place "e4_cov_inf0_0" (pin (- 8.0 (ai_living_count "e4_cov")) 0.0 2.0))
        (sleep_until 
            (or
                (volume_test_objects "tv_e4_player_moved_up" (players))
                (<= (ai_living_count "e4_cov_inf0_0") 0)
            ) 
        15)
        (if (not (volume_test_objects "tv_e4_player_moved_up" (players))) 
            (ai_place "e4_cov_inf0_1" (pin (- 8.0 (ai_living_count "e4_cov")) 0.0 2.0)))
    )
)

(script dormant void e4_mars_inf0_main
    (begin
        (ai_migrate "e3_mars_inf0" "e4_mars_inf0")
        (ai_migrate "e3_mars_inf1" "e4_mars_inf0")
        (ai_renew "e4_mars_inf0")
        (ai_disposable "e4_mars_inf0" false)
    )
)

(script dormant void e4_main
    (begin
        (sleep_until (volume_test_objects "tv_e4_main_begin" (players)))
        (set g_e4_started true)
        (print "e4_main")
        (data_mine_insert "e4_sniper_alley")
        (game_save_no_timeout)
        (wake music_03a_03_start)
        (wake e5_main)
        (wake e5b_main)
        (wake objective1_clear)
        (wake objective2_set)
        (wake e4_mars_inf0_main)
        (wake e4_cov_inf0_main)
        (wake e4_cov_inf1_main)
        (wake e4_cov_inf2_main)
        (wake e4_cov_snipers0_main)
        (sleep_until 
            (or
                g_e5_started
                g_e6_started
            )
        )
        (sleep_forever e4_mars_inf0_main)
        (sleep_forever e4_cov_inf0_main)
        (sleep_forever e4_cov_inf1_main)
        (sleep_forever e4_cov_snipers0_main)
        (ai_disposable "e4_cov" true)
    )
)

(script static void test_sniper_alley
    (begin
        (object_teleport (player0) "e4_test")
        (ai_place "e4_mars_inf0")
        (if (not g_e4_started) 
            (wake e4_main))
        (if (not g_e6_started) 
            (wake e6_main))
        (if (not g_e8_started) 
            (wake e8_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e3_sniper_intro_scene
    (begin
        (ai_play_line ai_current_actor "0370")
    )
)

(script dormant void e3_mars_sniper_scene
    (begin
        (sleep_until (ai_scene "e3_sniper_intro_scene" cs_e3_sniper_intro_scene "e3_mars") 30 450)
    )
)

(script command_script void cs_e3_cov_inf0_1_intro
    (begin
        (cs_crouch true)
        (cs_face true e3_cov_sniper/p0)
        (sleep_until (>= (ai_combat_status ai_current_actor) ai_combat_status_certain) 10)
        (sleep 15)
        (cs_shoot_point true e3_cov_sniper/p0)
        (wake e3_mars_sniper_scene)
        (sleep 30)
        (cs_shoot_point true e3_cov_sniper/p1)
        (sleep 90)
    )
)

(script command_script void cs_e3_cov_inf0_1_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_looking false)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_look true e3_patrol/f0)
                        (sleep (random_range 60 90))
                    )
                    (begin
                        (cs_look true e3_patrol/f1)
                        (sleep (random_range 60 90))
                    )
                    (begin
                        (cs_look true e3_patrol/f2)
                        (sleep (random_range 60 90))
                    )
                    (begin
                        (cs_look true e3_patrol/f3)
                        (sleep (random_range 60 90))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_e3_mars_pelican0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_face true e3_mars_evac/p2)
        (cs_fly_to e3_mars_evac/p0)
        (set g_e3_mars_pelican0_arrived true)
        (sleep 45)
        (cs_fly_to e3_mars_evac/p1)
        (cs_fly_to e3_mars_evac/p3 1.0)
        (set g_e3_mars_pelican0_landed true)
        (sleep_forever)
    )
)

(script command_script void cs_e3_mars_pelican0_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_to e3_mars_evac/p4 1.0)
        (sleep 30)
        (cs_vehicle_speed 1.0)
        (cs_fly_by e3_mars_evac/p2)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e3_mars_johnson_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e3_mars_evac/johnson0)
        (cs_enable_targeting true)
        (sleep_until g_e3_johnson_should_load 5)
        (cs_movement_mode ai_movement_patrol)
        (cs_face_object true (ai_get_object "e3_mars_pelican0/pelican0"))
        (cs_go_to e3_mars_evac/johnson1)
        (cs_face_player true)
        (sleep_until 
            (or
                (objects_can_see_object (ai_get_object ai_current_actor) (player0) 10.0)
                (and
                    (game_can_use_flashlights)
                    (objects_can_see_object (ai_get_object ai_current_actor) (player1) 10.0)
                )
            ) 
        1)
        (sleep_until (objects_can_see_object (players) (ai_get_object ai_current_actor) 15.0) 2 30)
        (sleep 20)
        (ai_play_line_at_player "e3_mars_johnson" "0970")
        (sleep 20)
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\marine\marine" "combat:rifle:wave" true)
        (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
    )
)

(script command_script void cs_e3_mars_johnson_slam
    (begin
        (cs_go_to e3_mars_evac/johnson1)
        (ai_vehicle_enter_immediate ai_current_actor (ai_vehicle_get "e3_mars_pelican0/pelican0") pelican_e)
    )
)

(script command_script void cs_e3_mars_inf1_ride
    (begin
        (sleep_until g_e3_mars_pelican0_landed 5)
        (ai_vehicle_exit ai_current_actor)
        (cs_enable_targeting true)
        (cs_enable_moving true)
        (sleep 60)
        (if g_e4_started 
            (ai_migrate ai_current_actor "e4_mars_inf0") (ai_migrate ai_current_actor "e3_mars_inf0"))
    )
)

(script command_script void cs_e3_mars_johnson_teleport
    (begin
        (cs_teleport e3_mars_evac/johnson_teleport0 e3_mars_evac/johnson_teleport1)
    )
)

(script static boolean e3_mars_pelican0_arrived
    (begin
        (= g_e3_mars_pelican0_arrived true)
    )
)

(script static boolean e3_mars_johnson_loaded
    (begin
        (= g_e3_johnson_in_pelican true)
    )
)

(script static boolean e3_cov_inf0_0_should_regroup
    (begin
        (or
            g_e4_started
            (and
                (>= (ai_spawn_count "e3_cov_inf0_0") g_e3_cov_inf0_0_limit)
                (<= (ai_living_count "e3_cov_inf0_0") 4)
            )
        )
    )
)

(script dormant void e3_cov_inf0_main
    (begin
        (ai_place "e3_cov_inf0_0")
        (ai_place "e3_cov_inf0_1")
        (sleep_until 
            (or
                (<= (ai_living_count "e3_cov_inf0") 2)
                (volume_test_objects "tv_e3_crossing_street" (players))
            ) 
        15)
        (ai_place "e3_cov_inf0_2")
    )
)

(script dormant void e3_mars_pelican0_main
    (begin
        (sleep_until 
            (or
                g_e4_started
                (volume_test_objects "tv_e3_mars_pelican0_begin" (players))
                (and
                    (> (ai_spawn_count "e3_cov_inf0") 0)
                    (<= (ai_living_count "e3_cov_inf0") 2)
                )
            ) 
        30 two_minutes)
        (ai_place "e3_mars_pelican0")
        (cs_run_command_script "e3_mars_pelican0/pelican0" cs_e3_mars_pelican0_entry)
        (sleep_until g_e3_johnson_in_pelican 5)
        (cs_run_command_script "e3_mars_pelican0/pelican0" cs_e3_mars_pelican0_exit)
    )
)

(script dormant void e3_mars_inf1_main
    (begin
        (sleep_until (> (ai_spawn_count "e3_mars_pelican0") 0))
        (ai_place "e3_mars_inf1" (pin (- 3.0 (ai_living_count "e3_mars_inf0")) 0.0 3.0))
        (ai_vehicle_enter_immediate "e3_mars_inf1" (ai_vehicle_get "e3_mars_pelican0/pelican0") pelican_p_r)
    )
)

(script dormant void e3_mars_inf0_main
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "e2_cov_hunters0") 0)
                (volume_test_objects "tv_e3_crossing_street" (players))
            ) 
        30 one_minute)
        (ai_migrate "e2_mars_inf0" "e3_mars_inf0")
        (ai_renew "e3_mars_inf0")
        (ai_disposable "e3_mars_inf0" false)
        (sleep_until g_e3_johnson_in_pelican)
        (ai_migrate "e3_mars_johnson" "e3_mars_inf0")
        (ai_disposable "e3_mars_inf0" false)
    )
)

(script dormant void e3_mars_johnson_main
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "e2_cov_hunters0") 0)
                (volume_test_objects "tv_e3_crossing_street" (players))
            ) 
        30 one_minute)
        (ai_migrate "e1_mars_johnson" "e3_mars_johnson")
        (ai_migrate "e2_mars_johnson" "e3_mars_johnson")
        (ai_disposable "e3_mars_johnson" false)
        (sleep_until (> (ai_spawn_count "e3_mars_pelican0") 0) 15)
        (if (not (volume_test_objects "tv_e3_johnson_required" (ai_actors "e3_mars_johnson"))) 
            (begin
                (sleep_until (not (volume_test_objects "tv_e3_johnson_teleport_unsafe" (players))))
                (cs_run_command_script "e3_mars_johnson" cs_e3_mars_johnson_teleport)
            )
        )
        (sleep_until g_e3_mars_pelican0_arrived 15)
        (wake objective1_clear)
        (cs_run_command_script "e3_mars_johnson" cs_e3_mars_johnson_exit)
        (sleep (ai_play_line_on_object none "0940"))
        (sleep 20)
        (sleep (ai_play_line "e3_mars_johnson" "0950"))
        (sleep 15)
        (sleep (ai_play_line_on_object none "0960"))
        (set g_e3_johnson_should_load true)
        (sleep_until (not (cs_command_script_queued "e3_mars_johnson" cs_e3_mars_johnson_exit)) 1)
        (ai_vehicle_enter "e3_mars_johnson" (ai_vehicle_get "e3_mars_pelican0/pelican0") pelican_e)
        (sleep_until (vehicle_test_seat_list (ai_vehicle_get "e3_mars_pelican0/pelican0") "pelican_e" (ai_actors "e3_mars_pelican0")) 30 300)
        (if (not (vehicle_test_seat_list (ai_vehicle_get "e3_mars_pelican0/pelican0") "pelican_e" (ai_actors "e3_mars_pelican0"))) 
            (cs_run_command_script "e3_mars_johnson" cs_e3_mars_johnson_slam))
        (sleep_until (vehicle_test_seat_list (ai_vehicle_get "e3_mars_pelican0/pelican0") "pelican_e" (ai_actors "e3_mars_pelican0")) 30 30_seconds)
        (set g_e3_johnson_in_pelican true)
        (game_save_no_timeout)
        (wake objective2_set)
        (wake music_03a_03_start)
    )
)

(script dormant void e3_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e3_main_begin0" (players))
                (volume_test_objects "tv_e3_main_begin1" (players))
            )
        )
        (set g_e3_started true)
        (print "e3_main")
        (data_mine_insert "e3_highway_underpass")
        (game_save_no_timeout)
        (wake music_03a_01_stop)
        (wake music_03a_02_stop)
        (wake objective1_set)
        (wake e4_main)
        (wake e6_main)
        (wake e3_mars_inf0_main)
        (wake e3_mars_inf1_main)
        (wake e3_mars_johnson_main)
        (wake e3_mars_pelican0_main)
        (wake e3_cov_inf0_main)
        (sleep_until 
            (or
                g_e4_started
                g_e6_started
            )
        )
        (sleep_forever e3_mars_inf0_main)
        (sleep_forever e3_mars_inf1_main)
        (sleep_forever e3_cov_inf0_main)
        (sleep_forever e3_mars_sniper_scene)
        (ai_disposable "e3_cov" true)
    )
)

(script static void test_marching_infantry
    (begin
        (object_teleport (player0) "e3_test")
        (ai_place "e3_mars_inf0")
        (ai_place "e3_mars_johnson")
        (object_cannot_take_damage (ai_actors "e3_mars_johnson"))
        (if (not g_e3_started) 
            (wake e3_main))
        (if (not g_e8_started) 
            (wake e8_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e2_cov_hunters0_taunt
    (begin
        (set g_e2_cov_hunters0_active true)
        (cs_abort_on_damage true)
        (if (> (ai_strength ai_current_actor) 0.98) 
            (begin
                (custom_animation (ai_get_unit ai_current_actor) "objects\characters\hunter\hunter" "combat:unarmed:shakefist" true)
                (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
            )
        )
    )
)

(script command_script void cs_e2_cov_hunters0_0_entry
    (begin
        (cs_queue_command_script ai_current_actor cs_e2_cov_hunters0_taunt)
        (sleep 220)
        (cs_force_combat_status 2)
        (cs_ignore_obstacles true)
        (cs_abort_on_damage true)
        (cs_look_player true)
        (cs_go_to e2_cov_hunters0_entry/p0_1)
        (cs_face_player true)
        (cs_movement_mode ai_movement_combat)
        (sleep_until 
            (or
                (player_in_vehicle)
                (<= (objects_distance_to_object (ai_actors ai_current_squad) (player0)) 3.0)
                (and
                    (game_can_use_flashlights)
                    (<= (objects_distance_to_object (ai_actors ai_current_squad) (player1)) 3.0)
                )
                (and
                    (ai_trigger_test "generic_player_fired" ai_current_squad)
                    (objects_can_see_flag (players) "e2_cov_hunters0_entry" 20.0)
                )
                (< (ai_strength ai_current_squad) 0.98)
            ) 
        5 120)
        (if (not 
            (or
                (player_in_vehicle)
                (<= (objects_distance_to_object (ai_actors ai_current_squad) (player0)) 3.0)
                (and
                    (game_can_use_flashlights)
                    (<= (objects_distance_to_object (ai_actors ai_current_squad) (player1)) 3.0)
                )
                (and
                    (ai_trigger_test "generic_player_fired" ai_current_squad)
                    (objects_can_see_flag (players) "e2_cov_hunters0_entry" 20.0)
                )
                (< (ai_strength ai_current_squad) 0.98)
            )
        ) 
            (begin
                (custom_animation (ai_get_unit ai_current_actor) "objects\characters\hunter\hunter" "combat:unarmed:taunt" true)
                (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
            )
        )
        (sleep_until 
            (or
                (player_in_vehicle)
                (<= (objects_distance_to_object (ai_actors ai_current_squad) (player0)) 4.0)
                (and
                    (game_can_use_flashlights)
                    (<= (objects_distance_to_object (ai_actors ai_current_squad) (player1)) 4.0)
                )
                (and
                    (ai_trigger_test "generic_player_fired" ai_current_squad)
                    (objects_can_see_flag (players) "e2_cov_hunters0_entry" 20.0)
                )
                (< (ai_strength ai_current_squad) 0.98)
            ) 
        5 120)
    )
)

(script command_script void cs_e2_cov_hunters0_1_entry
    (begin
        (cs_queue_command_script ai_current_actor cs_e2_cov_hunters0_taunt)
        (sleep 220)
        (cs_force_combat_status 2)
        (cs_ignore_obstacles true)
        (cs_abort_on_damage true)
        (cs_look_player true)
        (cs_go_to e2_cov_hunters0_entry/p1)
        (cs_face_player true)
        (sleep_until 
            (or
                (player_in_vehicle)
                (<= (objects_distance_to_object (ai_actors ai_current_squad) (player0)) 4.0)
                (and
                    (game_can_use_flashlights)
                    (<= (objects_distance_to_object (ai_actors ai_current_squad) (player1)) 4.0)
                )
                (and
                    (ai_trigger_test "generic_player_fired" ai_current_squad)
                    (objects_can_see_flag (players) "e2_cov_hunters0_entry" 20.0)
                )
                (< (ai_strength ai_current_squad) 1.0)
            ) 
        5 240)
    )
)

(script command_script void cs_e2_cov_inf0_watch
    (begin
        (cs_abort_on_damage true)
        (sleep_until 
            (or
                (volume_test_objects "tv_e2_hunters_bypassed" (players))
                (ai_trigger_test "e2_cov_hunters0_active" "e2_cov_hunters0")
            ) 
        15)
    )
)

(script command_script void cs_e2_mars_johnson0_dialogue0
    (begin
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\marine\marine" "combat:rifle:hold" true)
        (sleep 10)
        (sleep (ai_play_line "e2_mars_johnson" "0930"))
    )
)

(script command_script void cs_e2_mars_johnson0_watch
    (begin
        (cs_go_to e2_mars_watch/p1)
        (cs_aim true e2_mars_watch/watch)
        (sleep_until g_e2_door_breached)
        (cs_aim_object true (ai_get_object "e2_cov_hunters0/hunter0"))
        (sleep_until g_e2_cov_hunters0_active 10 30_seconds)
    )
)

(script command_script void cs_e2_mars_inf0_watch
    (begin
        (cs_go_to_nearest e2_mars_inf0_positions)
        (cs_crouch true)
        (sleep_until g_e2_door_breached)
        (cs_aim_object true (ai_get_object "e2_cov_hunters0/hunter0"))
        (sleep_until g_e2_cov_hunters0_active 10 30_seconds)
    )
)

(script command_script void cs_e2_mars_continue
    (begin
        (cs_go_to_nearest e2_mars_wait)
        (cs_face_player true)
        (sleep_until 
            (or
                (ai_trigger_test "generic_player_within_4wu" "e2_mars")
                (ai_trigger_test "e2_cov_hunters0_bypassed" "e2_mars")
                g_e3_started
            ) 
        15)
    )
)

(script dormant void e2_dialog
    (begin
        (sleep 75)
        (sleep_until g_e2_door_breached)
        (sleep 120)
        (sleep (ai_play_line_on_object none "0340"))
        (cs_run_command_script "e2_mars_johnson" cs_e2_mars_johnson0_dialogue0)
        (sleep_until (<= (ai_strength "e2_cov_hunters0") 0.8) 30 30_seconds)
        (if (not (<= (ai_strength "e2_cov_hunters0") 0.8)) 
            (ai_play_line_on_object none "0350"))
        (sleep_until (<= (ai_living_count "e2_cov_hunters0") 0))
        (sleep 60)
        (sleep (ai_play_line_on_object none "0280"))
        (sleep 25)
        (sleep (ai_play_line_on_object none "0290"))
        (sleep 20)
        (ai_play_line_on_object none "0300")
    )
)

(script dormant void e2_cov_inf0_main
    (begin
        (ai_place "e2_cov_inf0")
    )
)

(script dormant void e2_cov_hunters0_main
    (begin
        (sleep_until (objects_can_see_flag (players) "e2_wall_tap" 30.0) 15 one_minute)
        (sound_impulse_start "sound\materials\hard\metal_thin\metal_thin_large")
        (sound_impulse_start "sound\visual_effects\explosion_medium_metal_bits")
        (sleep 30)
        (device_set_position "e2_hunter_door" 0.5)
        (sound_impulse_start_effect "sound\materials\hard\metal_thin\metal_thin_large" "e2_hunter_door_sound_source" 1.0)
        (object_damage_damage_section "e2_hunter_door" "body_hit0" 1.1)
        (object_create "e2_hunter_smoke")
        (sleep 60)
        (wake e2_dialog)
        (wake objective0_clear)
        (ai_place "e2_cov_hunters0")
        (sleep 60)
        (device_set_position "e2_hunter_door" 1.0)
        (sound_impulse_start_effect "sound\materials\hard\metal_thin\metal_thin_large" "e2_hunter_door_sound_source" 1.0)
        (object_damage_damage_section "e2_hunter_door" "body_hit1" 1.1)
        (sleep 160)
        (device_set_position_immediate "e2_hunter_door" 0.01)
        (sound_impulse_start_effect "sound\visual_effects\explosion_medium_metal_bits" "e2_hunter_door_sound_source" 1.0)
        (sleep 1)
        (object_damage_damage_section "e2_hunter_door" "body_main" 1.1)
        (sleep 1)
        (device_set_position_immediate "e2_hunter_door" 1.0)
        (object_destroy "e2_hunter_smoke")
        (set g_e2_door_breached true)
        (wake music_03a_01_stop)
        (wake music_03a_02_start_alt)
        (sleep_until 
            (or
                (<= (ai_living_count "e2_cov_hunters0") 0)
                g_e3_started
            )
        )
        (wake objective1_set)
        (game_save_no_timeout)
        (wake music_03a_02_stop)
    )
)

(script dormant void e2_mars_inf0_main
    (begin
        (ai_migrate "e1_mars_inf0" "e2_mars_inf0")
        (ai_migrate "e1_mars_inf1" "e2_mars_inf0")
        (ai_renew "e2_mars_inf0")
        (ai_disposable "e2_mars_inf0" false)
        (cs_run_command_script "e2_mars_inf0" cs_e2_mars_inf0_watch)
    )
)

(script dormant void e2_mars_johnson_main
    (begin
        (ai_migrate "e1_mars_johnson" "e2_mars_johnson")
        (ai_disposable "e2_mars_johnson" false)
        (cs_run_command_script "e2_mars_johnson" cs_e2_mars_johnson0_watch)
        (sleep_until (> (ai_spawn_count "e2_cov_hunters0") 0))
        (sleep_until (<= (ai_living_count "e2_cov_hunters0") 0))
        (cs_run_command_script "e2_mars" cs_e2_mars_continue)
    )
)

(script dormant void e2_main
    (begin
        (sleep_until 
            (and
                (volume_test_objects "tv_e2_main_begin" (players))
                (not (volume_test_objects_all "tv_e2_main_begin_exclude" (players)))
            ) 
        15)
        (set g_e2_started true)
        (print "e2_main")
        (data_mine_insert "e2_hunter_intro")
        (game_save_no_timeout)
        (wake e2_cov_hunters0_main)
        (wake e2_mars_inf0_main)
        (wake e2_mars_johnson_main)
        (sleep_until g_e3_started)
        (sleep_forever e2_mars_inf0_main)
        (sleep_forever e2_mars_johnson_main)
        (sleep_forever e2_cov_inf0_main)
        (sleep_forever e2_cov_hunters0_main)
        (sleep_forever e2_dialog)
        (ai_disposable "e2_cov" true)
    )
)

(script static void test_hunter_intro
    (begin
        (object_teleport (player0) "e2_test")
        (ai_place "e2_mars_inf0")
        (ai_place "e2_mars_johnson")
        (if (not g_e2_started) 
            (wake e2_main))
        (if (not g_e3_started) 
            (wake e3_main))
        (if (not g_e8_started) 
            (wake e8_main))
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e1_mars_pelican0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_face true e1_mars_pelican/p0_facing)
        (cs_fly_to e1_mars_pelican/p0)
        (set g_e1_mars_pelican0_appeared true)
        (cs_face false e1_mars_pelican/p1_facing)
        (cs_fly_to e1_mars_pelican/p1)
        (sleep 75)
        (print "pilot: looks too tight down there")
        (sleep (ai_play_line_on_object none "0900"))
        (set g_e1_mars_pelican0_departing true)
        (cs_vehicle_speed 0.75)
        (cs_fly_to e1_mars_pelican/p2 0.5)
        (sleep 60)
        (cs_face false e1_mars_pelican/p1_facing)
        (cs_fly_by e1_mars_pelican/p3)
        (set g_e1_mars_pelican0_departing true)
        (cs_fly_by e1_mars_pelican/p4 1.0)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e1_mars_johnson_finale
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e1_mars_johnson_finale/p0)
        (sleep_until (> (ai_spawn_count "e2_cov_hunters0") 0))
        (sleep 90)
    )
)

(script command_script void cs_e1_mars_johnson_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_crouch true)
        (sleep 105)
        (cs_crouch false)
        (sleep (ai_play_line ai_current_actor "0850"))
        (sleep 15)
        (sleep (ai_play_line ai_current_actor "0110"))
        (sleep 10)
        (cs_go_to e1_mars_entry/p2)
    )
)

(script command_script void cs_e1_mars_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_crouch true)
        (sleep 120)
        (cs_crouch false)
        (cs_go_to e1_mars_entry/p4)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep 300)
    )
)

(script command_script void cs_e1_mars_entry0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_crouch true)
        (sleep 120)
        (cs_crouch false)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep 300)
    )
)

(script command_script void cs_e1_cov_phantom0_0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e1_cov_phantom0_0_entry/p0)
        (cs_fly_to e1_cov_phantom0_0_entry/p1)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e1_cov_phantom0_1_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e1_cov_phantom0_1_entry/p0)
        (cs_face true e1_cov_phantom0_1_entry/p1_facing)
        (set g_e1_cov_phantom0_1_arrived true)
        (cs_fly_to e1_cov_phantom0_1_entry/p1 1.0)
        (sleep 15)
        (cs_vehicle_speed 0.66)
        (cs_fly_to e1_cov_phantom0_1_entry/p2)
        (cs_fly_to_and_face e1_cov_phantom0_1_entry/p3 e1_cov_phantom0_1_entry/p3_facing 0.5)
        (cs_face true e1_cov_phantom0_1_entry/p3_facing)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) true)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_a)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_b)
        (sleep 60)
        (set g_e1_cov_inf4_0_arrived true)
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) false)
        (cs_fly_to e1_cov_phantom0_1_entry/p4 0.5)
        (sleep 150)
        (cs_vehicle_speed 0.4)
        (cs_face false e1_cov_phantom0_1_entry/p3_facing)
        (cs_fly_by e1_cov_phantom0_1_entry/p5 1.0)
        (set g_e1_cov_phantom0_1_retreating true)
        (cs_vehicle_speed 0.75)
        (cs_fly_by e1_cov_phantom0_1_entry/p6)
        (cs_vehicle_speed 1.0)
        (cs_fly_by e1_cov_phantom0_1_entry/p7)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e1_cov_inf0_grunt0
    (begin
        (cs_enable_dialogue true)
        (cs_movement_mode ai_movement_combat)
        (cs_start_to e1_patrol/grunt0)
        (sleep_until 
            (or
                (not (cs_moving))
                (>= (ai_combat_status ai_current_actor) ai_combat_status_visible)
            ) 
        10)
        (cs_approach (ai_get_object ai_current_actor) 0.1 0.1 0.1)
        (sleep_until (>= (ai_combat_status ai_current_actor) ai_combat_status_dangerous) 3 25)
        (cs_movement_mode ai_movement_flee)
        (cs_go_to e1_patrol/grunt1)
    )
)

(script command_script void cs_e1_cov_inf0_0_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (begin_random
                    (cs_go_to e1_patrol/p0)
                    (begin
                        (cs_go_to e1_patrol/p1)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_go_to e1_patrol/p2)
                        (sleep (random_range 30 60))
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_e1_cov_inf0_0_patrol1
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (cs_go_to e1_patrol/p3)
                (sleep (random_range 30 60))
                (cs_go_to e1_patrol/p4)
                (sleep (random_range 30 60))
                false
            )
        )
    )
)

(script command_script void cs_e1_cov_inf0_3_patrol0
    (begin
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_enable_looking true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to e1_patrol/p7)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_go_to e1_patrol/p8)
                        (sleep (random_range 30 60))
                    )
                    (begin
                        (cs_go_to e1_patrol/p9)
                        (sleep (random_range 30 60))
                    )
                )
                false
            )
        )
    )
)

(script static boolean johnson_has_sniping_weapon
    (begin
        (or
            (unit_has_weapon (ai_get_unit "e1_mars_johnson/johnson0") "objects\weapons\rifle\sniper_rifle\sniper_rifle.weapon")
            (unit_has_weapon (ai_get_unit "e1_mars_johnson/johnson0") "objects\weapons\rifle\battle_rifle\battle_rifle.weapon")
        )
    )
)

(script static boolean e1_cov_inf0_grunts_alerted
    (begin
        (or
            (>= (ai_combat_status "e1_cov_inf0_0/grunt1") ai_combat_status_alert)
            (>= (ai_combat_status "e1_cov_inf0_0/grunt2") ai_combat_status_alert)
            (>= (ai_combat_status "e1_cov_inf0_1") ai_combat_status_alert)
        )
    )
)

(script static boolean e1_cov_inf2_under_limit
    (begin
        (< g_e1_cov_inf2_spawned g_e1_cov_inf2_limit)
    )
)

(script static boolean e1_cov_inf2_spawn_ready
    (begin
        (and
            (<= (ai_living_count "e1_cov_inf2") 1)
            (<= (ai_fighting_count "e1_cov_inf2") 0)
        )
    )
)

(script static void e1_cov_inf2_sleep_until_respawn
    (begin
        (sleep_until (e1_cov_inf2_spawn_ready) 31 two_minutes)
        (sleep_until (volume_test_objects "tv_e1_on_building" (players)) 30 150)
    )
)

(script static void e1_cov_inf2_6_spawn
    (begin
        (if (not (volume_test_objects "tv_e1_cov_inf2_1_unsafe" (players))) 
            (begin
                (game_save_no_timeout)
                (sleep 5)
                (ai_place "e1_cov_inf2_6" (min 5.0 (- 10.0 (ai_living_count "e1_cov_inf2"))))
                (ai_set_orders "e1_cov_inf2_6" "e1_cov_inf2_engage0")
                (sleep 2)
                (ai_magically_see "e1_mars_johnson" "e1_cov_inf2_5")
                (set g_e1_cov_inf2_spawned (+ g_e1_cov_inf2_spawned 1.0))
                (e1_cov_inf2_sleep_until_respawn)
            )
        )
    )
)

(script static void e1_cov_inf2_5_spawn
    (begin
        (if (not (volume_test_objects "tv_e1_cov_inf2_5_unsafe" (players))) 
            (begin
                (game_save_no_timeout)
                (sleep 5)
                (ai_place "e1_cov_inf2_5" (min 5.0 (- 10.0 (ai_living_count "e1_cov_inf2"))))
                (ai_set_orders "e1_cov_inf2_5" "e1_cov_inf2_5_init")
                (sleep 2)
                (ai_magically_see "e1_mars_johnson" "e1_cov_inf2_5")
                (set g_e1_cov_inf2_spawned (+ g_e1_cov_inf2_spawned 1.0))
                (sleep 120)
                (if g_e1_cov_inf2_wave0 
                    (ai_play_line "e1_mars_johnson/johnson0" "0210"))
                (e1_cov_inf2_sleep_until_respawn)
            )
        )
    )
)

(script static void e1_cov_inf2_3_spawn
    (begin
        (if (not (volume_test_objects "tv_e1_cov_inf2_3_unsafe" (players))) 
            (begin
                (game_save_no_timeout)
                (sleep 5)
                (ai_place "e1_cov_inf2_3" (min 5.0 (- 10.0 (ai_living_count "e1_cov_inf2"))))
                (ai_set_orders "e1_cov_inf2_3" "e1_cov_inf2_engage0")
                (sleep 2)
                (ai_magically_see "e1_mars_johnson" "e1_cov_inf2_3")
                (set g_e1_cov_inf2_spawned (+ g_e1_cov_inf2_spawned 1.0))
                (sleep 120)
                (if g_e1_cov_inf2_wave0 
                    (ai_play_line "e1_mars_johnson/johnson0" "0170"))
                (e1_cov_inf2_sleep_until_respawn)
            )
        )
    )
)

(script static void e1_cov_inf2_1_spawn
    (begin
        (if (not (volume_test_objects "tv_e1_cov_inf2_1_unsafe" (players))) 
            (begin
                (game_save_no_timeout)
                (sleep 5)
                (ai_place "e1_cov_inf2_1" (min 5.0 (- 10.0 (ai_living_count "e1_cov_inf2"))))
                (ai_set_orders "e1_cov_inf2_1" "e1_cov_inf2_engage0")
                (sleep 2)
                (ai_magically_see "e1_mars_johnson" "e1_cov_inf2_1")
                (set g_e1_cov_inf2_spawned (+ g_e1_cov_inf2_spawned 1.0))
                (sleep 90)
                (if (not g_e1_cov_inf2_wave0) 
                    (ai_play_line "e1_mars_johnson/johnson0" "0150"))
                (e1_cov_inf2_sleep_until_respawn)
            )
        )
    )
)

(script dormant void e1_mars_pelican0_main
    (begin
        (sleep_until 
            (and
                (> (ai_spawn_count "e1_cov_inf4_1") 0)
                (<= (ai_living_count "e1_cov_inf4") 3)
            )
        )
        (ai_place "e1_mars_pelican0")
        (ai_vehicle_enter_immediate "e1_mars_pelican0/gunner0" (ai_vehicle_get "e1_mars_pelican0/pelican0") pelican_g)
        (ai_vehicle_enter_immediate "e1_mars_pelican0/gunner1" (ai_vehicle_get "e1_mars_pelican0/pelican0") pelican_g_rear)
        (cs_run_command_script "e1_mars_pelican0/pelican0" cs_e1_mars_pelican0_entry)
        (sleep_until g_e1_mars_pelican0_departing 30)
        (wake e2_main)
    )
)

(script dormant void e1_cov_phantom0_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_main_area_entrance" (players)) 5)
        (sleep_until (e1_cov_inf0_grunts_alerted) 30 30_seconds)
        (ai_place "e1_cov_phantom0_0")
        (cs_run_command_script "e1_cov_phantom0_0/phantom0" cs_e1_cov_phantom0_0_entry)
        (sleep_forever)
        (ai_place "e1_cov_phantom0_1")
        (wake music_03a_01_start)
    )
)

(script dormant void e1_cov_snipers0_main
    (begin
        (if (difficulty_legendary) 
            (set g_e1_cov_snipers0_limit 5))
        (begin_random
            (if (< (ai_spawn_count "e1_cov_snipers0") g_e1_cov_snipers0_limit) 
                (if (not (volume_test_objects "tv_e1_cov_sniper0_0_unsafe" (players))) 
                    (begin
                        (ai_place "e1_cov_snipers0/sniper0")
                        (game_save_no_timeout)
                        (sleep_until (<= (ai_living_count "e1_cov_snipers0") 0))
                        (sleep (random_range one_minute two_minutes))
                    )
                )
            )
            (if (< (ai_spawn_count "e1_cov_snipers0") g_e1_cov_snipers0_limit) 
                (if (not (volume_test_objects "tv_e1_cov_sniper0_1_unsafe" (players))) 
                    (begin
                        (ai_place "e1_cov_snipers0/sniper1")
                        (game_save_no_timeout)
                        (sleep_until (<= (ai_living_count "e1_cov_snipers0") 0))
                        (sleep (random_range one_minute two_minutes))
                    )
                )
            )
            (if (< (ai_spawn_count "e1_cov_snipers0") g_e1_cov_snipers0_limit) 
                (if (not (volume_test_objects "tv_e1_cov_sniper0_2_unsafe" (players))) 
                    (begin
                        (ai_place "e1_cov_snipers0/sniper2")
                        (game_save_no_timeout)
                        (sleep_until (<= (ai_living_count "e1_cov_snipers0") 0))
                        (sleep (random_range one_minute two_minutes))
                    )
                )
            )
            (if (< (ai_spawn_count "e1_cov_snipers0") g_e1_cov_snipers0_limit) 
                (if (not (volume_test_objects "tv_e1_cov_sniper0_3_unsafe" (players))) 
                    (begin
                        (ai_place "e1_cov_snipers0/sniper3")
                        (game_save_no_timeout)
                        (sleep_until (<= (ai_living_count "e1_cov_snipers0") 0))
                        (sleep (random_range one_minute two_minutes))
                    )
                )
            )
            (if (< (ai_spawn_count "e1_cov_snipers0") g_e1_cov_snipers0_limit) 
                (if (not (volume_test_objects "tv_e1_cov_sniper0_3_unsafe" (players))) 
                    (begin
                        (ai_place "e1_cov_snipers0/sniper4")
                        (game_save_no_timeout)
                        (sleep_until (<= (ai_living_count "e1_cov_snipers0") 0))
                        (sleep (random_range one_minute two_minutes))
                    )
                )
            )
        )
    )
)

(script dormant void e1_cov_inf4_main
    (begin
        (sleep_until (> (ai_spawn_count "e1_cov_phantom0_1") 0) 10)
        (if (difficulty_heroic) 
            (ai_place_in_vehicle "e1_cov_inf4_0/elite1" "e1_cov_phantom0_1"))
        (if (difficulty_legendary) 
            (ai_place_in_vehicle "e1_cov_inf4_2" "e1_cov_phantom0_1"))
        (ai_place_in_vehicle "e1_cov_inf4_0" "e1_cov_phantom0_1")
        (sleep_until g_e1_cov_inf4_0_arrived)
        (sleep 300)
        (sleep_until 
            (and
                (<= (ai_living_count "e1_cov_inf4") 2)
                (not (volume_test_objects "tv_e1_cov_inf4_1_unsafe" (players)))
            ) 
        30 two_minutes)
        (ai_place "e1_cov_inf4_1" (pin (- 6.0 (ai_living_count "e1_cov_inf4")) 2.0 5.0))
    )
)

(script dormant void e1_cov_inf3_main
    (begin
        (ai_place "e1_cov_inf3_2")
        (sleep_until 
            (and
                (<= (ai_strength "e1_cov_inf3_2") 0.75)
                (objects_can_see_flag (players) "e1_cov_inf3_entrance" 25.0)
            ) 
        5 30_seconds)
        (ai_place "e1_cov_inf3_0" (- 5.0 (ai_living_count "e1_cov_inf3")))
        (sleep 30)
        (ai_play_line "e1_mars_johnson/johnson0" "0270")
        (sleep_until 
            (begin
                (if (< (ai_living_count "e1_cov_inf3") 3) 
                    (ai_place "e1_cov_inf3_1" 2))
                (>= (ai_spawn_count "e1_cov_inf3") 10)
            )
        )
        (ai_set_orders "e1_cov_inf3" "e1_cov_inf3_advance0")
    )
)

(script dormant void e1_cov_inf2_main
    (begin
        (sleep_until 
            (and
                (<= (ai_living_count "e1_cov_inf1") 1)
                (> (ai_spawn_count "e1_cov_inf1") 0)
            ) 
        30 one_minute)
        (e1_cov_inf2_sleep_until_respawn)
        (set g_e1_cov_inf2_spawned 0)
        (set g_e1_cov_inf2_limit 2)
        (if (difficulty_heroic) 
            (set g_e1_cov_inf2_limit 2))
        (if (difficulty_legendary) 
            (set g_e1_cov_inf2_limit 3))
        (if (not (difficulty_normal)) 
            (wake e1_cov_snipers0_main))
        (begin_random
            (if (e1_cov_inf2_under_limit) 
                (e1_cov_inf2_1_spawn))
            (if (e1_cov_inf2_under_limit) 
                (e1_cov_inf2_3_spawn))
            (if (e1_cov_inf2_under_limit) 
                (e1_cov_inf2_6_spawn))
        )
        (e1_cov_inf2_sleep_until_respawn)
        (game_save_no_timeout)
        (sleep 60)
        (e1_cov_inf2_5_spawn)
        (sleep_until 
            (and
                (<= (ai_living_count "e1_cov_inf2") 1)
                (<= (ai_fighting_count "e1_cov_inf2") 0)
            )
        )
        (garbage_collect_now)
        (game_save_no_timeout)
        (sleep 15)
        (wake e1_cov_inf3_main)
        (sleep 30)
        (sleep_until 
            (and
                (> (ai_spawn_count "e1_cov_inf3_1") 0)
                (<= (ai_living_count "e1_cov_inf3") 2)
                (<= (ai_fighting_count "e1_cov_inf3") 0)
            ) 
        30 two_minutes)
        (ai_disposable "e1_cov_inf3" true)
        (game_save_no_timeout)
        (sleep 30)
        (garbage_collect_now)
        (set g_e1_cov_inf2_wave0 false)
        (set g_e1_cov_inf2_spawned 0)
        (set g_e1_cov_inf2_limit 2)
        (if (difficulty_heroic) 
            (set g_e1_cov_inf2_limit 3))
        (if (difficulty_legendary) 
            (set g_e1_cov_inf2_limit 3))
        (begin_random
            (if (e1_cov_inf2_under_limit) 
                (e1_cov_inf2_1_spawn))
            (if (e1_cov_inf2_under_limit) 
                (e1_cov_inf2_3_spawn))
            (if (e1_cov_inf2_under_limit) 
                (e1_cov_inf2_5_spawn))
            (if (e1_cov_inf2_under_limit) 
                (e1_cov_inf2_6_spawn))
        )
        (e1_cov_inf2_sleep_until_respawn)
        (game_save_no_timeout)
        (sleep 30)
        (wake e1_cov_phantom0_main)
        (wake e1_cov_inf4_main)
    )
)

(script dormant void e1_cov_inf1_main
    (begin
        (sleep_until 
            (and
                (> (ai_spawn_count "e1_cov_inf0_2") 0)
                (<= (ai_living_count "e1_cov_inf0") 1)
                (<= (ai_fighting_count "e1_cov_inf0") 0)
            ) 
        30)
        (game_save_no_timeout)
        (sleep 120)
        (sleep_until (not (volume_test_objects "tv_e1_cov_inf1_unsafe" (players))))
        (ai_place "e1_cov_inf1")
        (ai_magically_see "e1_cov_inf1" "e1_mars")
    )
)

(script dormant void e1_cov_inf0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e1_crash_area_exit" (players))
                (volume_test_objects "tv_e1_main_area_entrance" (players))
                (volume_test_objects "tv_e1_prediction" (players))
            ) 
        5)
        (object_type_predict "objects\characters\grunt\grunt")
        (camera_predict_resources_at_point "e1_prediction")
        (sleep_until 
            (or
                (volume_test_objects "tv_e1_crash_area_exit" (players))
                (volume_test_objects "tv_e1_main_area_entrance" (players))
            ) 
        5)
        (ai_place "e1_cov_inf0_0")
        (ai_place "e1_cov_inf0_3")
        (sleep_until 
            (or
                (<= (ai_living_count "e1_cov_inf0") 3)
                (volume_test_objects "tv_e1_cov_inf0_1_begin" (players))
            ) 
        15)
        (ai_place "e1_cov_inf0_1/grunt0")
        (sleep_until 
            (or
                (<= (ai_living_count "e1_cov_inf0") 3)
                (volume_test_objects "tv_e1_cov_inf0_1_begin" (players))
            ) 
        15)
        (ai_place "e1_cov_inf0_1/grunt1")
        (sleep_until 
            (or
                (<= (ai_living_count "e1_cov_inf0_3") 0)
                (volume_test_objects "tv_e1_cov_inf0_2_begin" (players))
            ) 
        15)
        (ai_place "e1_cov_inf0_2")
        (sleep 5)
        (ai_magically_see "e1_cov_inf0_2" "e1_mars_inf0")
        (wake e1_cov_inf1_main)
        (wake e1_cov_inf2_main)
    )
)

(script dormant void e1_mars_inf1_main
    (begin
        (ai_place "e1_mars_inf1")
    )
)

(script dormant void e1_mars_inf0_main
    (begin
        (ai_place "e1_mars_inf0")
        (sleep_until 
            (and
                (> (ai_spawn_count "e1_cov_phantom0_1") 0)
                (<= (ai_living_count "e1_cov_phantom0_1") 0)
            )
        )
    )
)

(script dormant void e1_mars_johnson_main
    (begin
        (ai_place "e1_mars_johnson")
        (object_cannot_die (ai_get_object "e1_mars_johnson/johnson0") true)
        (cs_run_command_script "e1_mars_johnson" cs_e1_mars_johnson_entry)
        (sleep_until 
            (and
                (> (ai_spawn_count "e1_cov_inf0_2") 0)
                (<= (ai_living_count "e1_cov_inf0_2") 0)
            )
        )
        (sleep_until (volume_test_objects "tv_e1_on_building" (ai_actors "e1_mars_johnson")) 30 450)
        (sleep (ai_play_line "e1_mars_johnson/johnson0" "0120"))
        (print "they know we're here")
        (game_save_no_timeout)
        (wake objective0_set)
        (sleep_until (> (ai_spawn_count "e1_cov_inf1") 0))
        (sleep 60)
        (ai_play_line "e1_mars_johnson/johnson0" "0130")
        (sleep_until (> (ai_spawn_count "e1_cov_phantom0_0") 0))
        (sleep_until g_e1_cov_phantom0_1_arrived)
        (sleep 60)
        (sleep (ai_play_line "e1_mars_johnson/johnson0" "0890"))
        (sleep_until g_e1_mars_pelican0_appeared 15)
        (cs_run_command_script "e1_mars_johnson" cs_e1_mars_johnson_finale)
        (sleep_until g_e1_mars_pelican0_departing 3 one_minute)
        (sleep 20)
        (sleep (ai_play_line "e1_mars_johnson/johnson0" "0910"))
        (wake music_03a_02_start)
    )
)

(script dormant void e1_key
    (begin
        (object_create "e1_ghost_key")
        (sleep_until 
            (or
                (and
                    (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                    (volume_test_object "tv_e1_ghost_key" (player0))
                )
                (and
                    (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                    (volume_test_object "tv_e1_ghost_key" (player1))
                )
            )
        )
        (reset_dsp_image 6)
    )
)

(script dormant void e1_main
    (begin
        (set g_e1_started true)
        (print "e1_main")
        (data_mine_insert "e1_rooftop_defense")
        (wake e3_main)
        (wake e8_main)
        (wake e12_main)
        (wake e1_mars_johnson_main)
        (wake e1_mars_inf0_main)
        (wake e1_mars_inf1_main)
        (wake e1_cov_inf0_main)
        (wake e1_cov_phantom0_main)
        (wake e1_mars_pelican0_main)
        (wake e1_key)
        (sleep_until g_e2_started)
        (sleep_forever e1_cov_snipers0_main)
        (sleep_until g_e3_started)
        (sleep_forever e1_mars_johnson_main)
        (sleep_forever e1_mars_inf0_main)
        (sleep_forever e1_mars_inf1_main)
        (sleep_forever e1_cov_inf0_main)
        (sleep_forever e1_cov_inf1_main)
        (sleep_forever e1_cov_inf2_main)
        (sleep_forever e1_cov_inf3_main)
        (sleep_forever e1_cov_inf4_main)
        (sleep_forever e1_cov_phantom0_main)
        (ai_disposable "e1_cov" true)
        (ai_disposable "e1_cov_phantom0" false)
    )
)

(script dormant void mission_start
    (begin
        (wake flashlight_control)
        (cinematic_snap_to_black)
        (cinematic_intro)
        (wake e1_main)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (chief_recovery_sequence)
        (wake chapter_title0)
        (sleep 150)
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_mission_end" (players)) 8)
        (set g_mission_over true)
        (playtest_mission)
        (sleep 15)
        (sound_class_enable_ducker "" 0.0 15)
        (cinematic_fade_to_white)
        (sleep 15)
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
        (ai_allegiance player human)
        (ai_allegiance covenant prophet)
        (objectives_finish_up_to)
        (if (> (player_count) 0) 
            (start))
    )
)

(script dormant void 03_intro_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 2)
        (sleep 8)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad\inamberclad" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 4)
        (sleep 113)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 59 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 true)
        (sleep 13)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 35 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 73 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 53 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 48 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 49 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 50 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\capital_ship\capital_ship" 2)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 76 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 false)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 31 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 77 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 67 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 34 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 44 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 68 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 33 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 56 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 74 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 75 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 61 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 72 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 47 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 54 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 55 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 39 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 41 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 37 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 38 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 42 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 45 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 52 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 57 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 62 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 66 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 69 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 70 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 51 true)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 65 true)
        (sleep 11)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 43 true)
        (sleep 76)
        (print "predicting chief")
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 91)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 true)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 2)
        (sleep 6)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 81)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 47 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 53 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 59 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 61 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 71 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 72 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 48 true)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 4)
        (sleep 121)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
    )
)

(script dormant void 03_intro_02_predict
    (begin
        (sleep 5)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 35 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 47 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 53 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 59 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 61 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 71 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 72 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 48 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 49 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 50 true)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 130)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 65)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 72)
        (predict_lightmap_bucket "objects\weapons\rifle\sniper_rifle\sniper_rifle" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_a\concrete_chunk_a" 0)
        (predict_lightmap_bucket "scenarios\objects\human\military\spotting_scope\spotting_scope" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 3 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 11 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 7 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 2)
        (sleep 12)
        (sleep 2)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 107)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 108)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 109)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 110)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 111)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 112)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 113)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 114)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 115)
        (predict_lightmap_bucket "objects\vehicles\warthog\turrets\chaingun\chaingun" 3)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\marine\marine" 38)
        (predict_lightmap_bucket "objects\characters\marine\marine" 39)
        (predict_lightmap_bucket "objects\characters\marine\marine" 40)
        (predict_lightmap_bucket "objects\characters\marine\marine" 41)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (sleep 4)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 54)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 55)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 56)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 57)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 58)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 59)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 60)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 61)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 62)
        (predict_lightmap_bucket "objects\vehicles\warthog\turrets\chaingun\chaingun" 2)
        (sleep 28)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 8)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 false)
        (sleep 5)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 0)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 1)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 2)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 3)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 4)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 5)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 6)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 7)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 8)
        (predict_lightmap_bucket "objects\vehicles\warthog\turrets\chaingun\chaingun" 1)
        (sleep 7)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 false)
        (sleep 21)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 66)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 67)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 69)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 70)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 119)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 120)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 122)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 123)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 12)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 13)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 15)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 16)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 false)
        (sleep 6)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (sleep 13)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (sleep 5)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (sleep 2)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 0)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 1)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 2)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 12)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 13)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 5)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 15)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 16)
        (predict_lightmap_bucket "objects\vehicles\warthog\warthog" 8)
        (predict_lightmap_bucket "objects\vehicles\warthog\turrets\chaingun\chaingun" 1)
        (sleep 5)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (sleep 16)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 1 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 true)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 65)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 72)
        (predict_lightmap_bucket "objects\weapons\rifle\sniper_rifle\sniper_rifle" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_a\concrete_chunk_a" 0)
        (predict_lightmap_bucket "scenarios\objects\human\military\spotting_scope\spotting_scope" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 7 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (sleep 54)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (sleep 6)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 10 true)
        (sleep 8)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 false)
        (sleep 15)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (sleep 6)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 11 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 1 true)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hor_facade\sign_hor_facade" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hog\sign_hog" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (sleep 10)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (sleep 19)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
    )
)

(script dormant void 03_intro_03_predict
    (begin
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (sleep 10)
        (predict_lightmap_bucket "objects\characters\marine\helmet_standard\helmet_standard" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 62)
        (predict_lightmap_bucket "objects\characters\marine\marine" 72)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 2)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (sleep 16)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 47)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (sleep 14)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (sleep 44)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (sleep 25)
        (predict_lightmap_bucket "objects\characters\marine\marine" 62)
        (predict_lightmap_bucket "objects\characters\marine\marine" 72)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 2)
        (sleep 57)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 73)
        (predict_lightmap_bucket "objects\weapons\rifle\sniper_rifle\sniper_rifle" 2)
        (sleep 35)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 false)
        (sleep 8)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (sleep 29)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 62)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 11 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_a\concrete_chunk_a" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\marine\helmet_standard\helmet_standard" 0)
        (sleep 66)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (sleep 12)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 true)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (sleep 27)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 false)
        (sleep 54)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
    )
)

(script dormant void 03_intro_04_predict
    (begin
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_a\concrete_chunk_a" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (sleep 23)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (sleep 20)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 false)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 16)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 17)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 18)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 19)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 20)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 21)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 22)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 23)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 24)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 25)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 26)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 27)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 28)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 29)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 30)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 31)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_scarab_full\holo_scarab_full" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_main_gun\scarab_main_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\vent_wall_a\vent_wall_a" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\railing\railing" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\railing\railing" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\railing\railing" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hog\sign_hog" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hor_facade\sign_hor_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 11 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 1 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 true)
        (sleep 8)
        (sleep 19)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 27)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (sleep 13)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_a\concrete_chunk_a" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 11 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 9)
        (predict_lightmap_bucket "objects\vehicles\civilian\garbage\civ_wheel\civ_wheel" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 3)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (sleep 51)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hog\sign_hog" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hor_facade\sign_hor_facade" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 36)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (sleep 26)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 3 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 1)
        (sleep 7)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 false)
        (sleep 7)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 16)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 17)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 18)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 19)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 20)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 21)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 22)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 23)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 24)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 25)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 26)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 27)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 28)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 29)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 30)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 31)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_scarab_full\holo_scarab_full" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_main_gun\scarab_main_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\palmtrees\palmtree_a\palmtree_a" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_a\concrete_chunk_a" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (sleep 79)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (sleep 22)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 1 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 true)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\vehicles\civilian\garbage\civ_wheel\civ_wheel" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\railing\railing" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\railing\railing" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\railing\railing" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hog\sign_hog" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hog\sign_hog" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hor_facade\sign_hor_facade" 1)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (sleep 19)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\vent_wall_a\vent_wall_a" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 11 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hor_facade\sign_hor_facade" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (sleep 17)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\junction_box_lg_garbage2\junction_box_lg_garbage2" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\junction_box_lg_garbage1\junction_box_lg_garbage1" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_a\concrete_chunk_a" 0)
        (sleep 14)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_c\concrete_chunk_c" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_b\concrete_chunk_b" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_f\concrete_chunk_f" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_d\concrete_chunk_d" 0)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
    )
)

