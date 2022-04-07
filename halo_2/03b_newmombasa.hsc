; Decompiled with Blamite
; Source file: 03b_newmombasa.hsc
; Start time: 4/7/2022 7:17:09
; Decompilation finished in ~0.0100936s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean g_mission_over false)
(global short 30_seconds 900)
(global short 45_seconds 900)
(global short one_minute 1800)
(global short two_minutes 3600)
(global boolean g_e23_scarab_arrived false)
(global boolean g_e23_scarab_climbed_down false)
(global boolean g_e23_scarab_before_bridge0 false)
(global boolean g_e23_scarab_under_bridge0 false)
(global boolean g_e23_scarab_before_bridge1 false)
(global boolean g_e23_scarab_under_bridge1 false)
(global boolean g_e23_scarab_before_bridge2 false)
(global boolean g_e23_scarab_under_bridge2 false)
(global boolean g_e23_scarab_after_bridge2 false)
(global boolean g_e23_scarab_after_turn false)
(global boolean g_e23_scarab_arrived_at_end false)
(global real g_scarab_interpolation 0.25)
(global boolean g_e23_started false)
(global boolean g_e23_mars_pelican0_appeared false)
(global boolean g_e23_scarab_active true)
(global short g_e23_target_pelican -1)
(global boolean g_e23_mars_pelican2_2_active false)
(global object g_target none)
(global boolean g_e22_started false)
(global boolean g_e22_scarab_visible false)
(global boolean g_e22_scarab_appeared false)
(global boolean g_e22_scarab_advancing false)
(global boolean g_e22_scarab_before_climb false)
(global boolean g_e22_scarab_started_climb false)
(global boolean g_e22_scarab_mid_climb false)
(global boolean g_e22_scarab_past_climb false)
(global boolean g_e22_done_street_cleanup false)
(global boolean g_e22_scorpion_asplode false)
(global boolean g_e21_started false)
(global boolean g_e21_cov_phantom0_retreating false)
(global boolean g_e21_cov_phantom1_retreating false)
(global boolean g_e20_started false)
(global boolean g_e19_started false)
(global boolean g_e18_started false)
(global short g_e18_orbit_count 0)
(global short g_e18_cov_inf2_spawn_max 5)
(global boolean g_e18_mars_warthog0_spoke false)
(global boolean g_e17_started false)
(global boolean g_e17_mars_warthog0_arrived false)
(global boolean g_e16_started false)
(global boolean g_e15_started false)
(global boolean g_e14_started false)
(global short g_e14_ghost_respawn_limit 8)


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

(script static void 03_intra1_01_predict_stub
    (begin
        (wake 03_intra1_01_predict)
    )
)

(script static void 03_intra1_02a_predict_stub
    (begin
        (wake 03_intra1_02a_predict)
    )
)

(script static void 03_intra1_02b_predict_stub
    (begin
        (wake 03_intra1_02b_predict)
    )
)

(script static void 03_intra1_02c_predict_stub
    (begin
        (wake 03_intra1_02c_predict)
    )
)

(script static void 03_intra1_03_predict_stub
    (begin
        (wake 03_intra1_03_predict)
    )
)

(script static void x03_01_predict_stub
    (begin
        (wake x03_01_predict)
    )
)

(script static void x03_02_predict_stub
    (begin
        (wake x03_02_predict)
    )
)

(script static void x03_03_predict_stub
    (begin
        (wake x03_03_predict)
    )
)

(script static void x03_04_predict_stub
    (begin
        (wake x03_04_predict)
    )
)

(script static void x03_05_predict_stub
    (begin
        (wake x03_05_predict)
    )
)

(script static void x03_06_predict_stub
    (begin
        (wake x03_06_predict)
    )
)

(script static void x03_07_predict_stub
    (begin
        (print "!!!07 predict")
        (wake x03_07_predict)
    )
)

(script static void x03_08_predict_stub
    (begin
        (print "!!!08 predict")
        (wake x03_08_predict)
    )
)

(script dormant void c03_intra1_sound_scene1_01
    (begin
        (sound_class_enable_ducker "vehicle_engine" 0.0 0)
        (sleep 390)
        (sound_class_enable_ducker "vehicle_engine" 0.5 60)
    )
)

(script dormant void c03_intra1_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intra1\music\c03_intra1_01_mus" none 1.0)
        (print "c03_intro score 01 start")
    )
)

(script dormant void c03_intra1_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_01_fol" none 1.0)
        (print "c03_intro foley 01 start")
    )
)

(script dormant void c03_2010_mr3
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2010_mr3" "marine_01" 1.0)
        (attract_mode_set_seconds "c03_2010_mr3" 4.0)
        (unit_set_emotional_state "marine_01" "scared" 1.0 0)
        (print "marine_01 - scared 1 0")
    )
)

(script dormant void c03_2020_mr4
    (begin
        (unit_set_emotional_state "marine_02" "shocked" 0.25 0)
        (print "marine_02 - shocked .25 0")
        (sleep 200)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2020_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2020_mr4" 2.0)
        (sleep 15)
        (unit_set_emotional_state "marine_02" "angry" 0.5 30)
        (print "marine_02 - angry .5 30")
    )
)

(script dormant void c03_2030_mr4
    (begin
        (sleep 278)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2030_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2030_mr4" 3.0)
    )
)

(script dormant void c03_intra1_fov_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 263)
        (camera_pan 14.0 0)
        (sleep 1)
        (camera_pan 10.0 144)
        (rasterizer_profile_include_all)
        (sleep 144)
        (camera_pan 60.0 0)
    )
)

(script dormant void drop_tank
    (begin
        (sleep 598)
        (objects_detach "pelican_01a" "scorpion_01")
        (print "special delivery")
    )
)

(script dormant void destroy_scarab
    (begin
        (sleep 410)
        (object_destroy "scarab_01")
        (print "destroy scarab")
    )
)

(script dormant void c03_intra1_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 27.0 228.0 0.360784 0.317647 0.203922)
        (cinematic_lighting_set_secondary_light -35.0 100.0 0.0901961 0.109804 0.14902)
        (cinematic_lighting_set_ambient_light 0.101961 0.101961 0.0666667)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.6)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "johnson" true)
        (object_uses_cinematic_lighting "marine_01" true)
        (object_uses_cinematic_lighting "marine_02" true)
        (object_uses_cinematic_lighting "rifle_01" true)
        (object_uses_cinematic_lighting "rifle_02" true)
        (object_uses_cinematic_lighting "rifle_03" true)
        (object_uses_cinematic_lighting "pelican_01a" true)
        (object_uses_cinematic_lighting "scarab_02" true)
        (object_uses_cinematic_lighting "scorpion_01" true)
    )
)

(script dormant void c03_intra1_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "marine_01")
        (object_create_anew "marine_02")
        (object_create_anew "rifle_02")
        (object_create_anew "rifle_03")
        (object_cinematic_lod "marine_01" true)
        (object_cinematic_lod "marine_02" true)
        (objects_attach "marine_01" "right hand" "rifle_02" "")
        (objects_attach "marine_02" "right hand" "rifle_03" "")
        (object_set_permutation "marine_02" "head" "michelle")
    )
)

(script static void c03_intra1_01_setup
    (begin
        (object_create_anew "chief")
        (object_create_anew "johnson")
        (object_create_anew "pelican_01a")
        (object_create_anew "scorpion_01")
        (object_create_anew "scarab_01")
        (object_create_anew "rifle_01")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "pelican_01a" true)
        (object_cinematic_lod "scorpion_01" true)
        (object_cinematic_lod "scarab_01" true)
        (objects_attach "chief" "right hand" "rifle_01" "")
        (objects_attach "pelican_01a" "pelican_sc_01" "scorpion_01" "scorpion_b_t")
        (object_set_function_variable "pelican_01a" "hover" 1.0 0.0)
        (wake c03_intra1_sound_scene1_01)
        (wake c03_intra1_score_01)
        (wake c03_intra1_foley_01)
        (wake c03_2010_mr3)
        (wake c03_2020_mr4)
        (wake c03_2030_mr4)
        (wake c03_intra1_fov_01)
        (wake c03_intra1_cinematic_light_01)
        (wake drop_tank)
        (wake destroy_scarab)
    )
)

(script static void c03_intra1_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "newmombasa_intra1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (03_intra1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intra1\music\c03_intra1_01_mus")
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_01_fol")
        (wake c03_intra1_problem_actors)
        (sleep prediction_offset)
        (c03_intra1_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\03_intra1\03_intra1" "03_intra1_01" none "anchor_flag_intra1")
        (custom_animation_relative "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_01" false "anchor_intra1")
        (custom_animation_relative "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_01" false "anchor_intra1")
        (custom_animation_relative "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_01" false "anchor_intra1")
        (custom_animation_relative "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_01" false "anchor_intra1")
        (custom_animation_relative "pelican_01a" "objects\vehicles\pelican\03_intra1\03_intra1" "pelican_01" false "anchor_intra1")
        (scenery_animation_start_relative "scarab_01" "scenarios\objects\covenant\military\scarab\03_intra1\03_intra1" "scarab_01" "anchor_intra1")
        (sleep 45)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (03_intra1_02a_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_02a_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c03_intra1_foley_02a
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_02a_fol" none 1.0)
        (print "c03_intro foley 02a start")
    )
)

(script dormant void c03_2040_jon
    (begin
        (sleep 115)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2040_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2040_jon" 1.0)
    )
)

(script dormant void c03_2050_mr4
    (begin
        (sleep 161)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2050_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2050_mr4" 1.0)
    )
)

(script dormant void c03_2060_mr3
    (begin
        (sleep 200)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2060_mr3" "marine_01" 1.0)
        (attract_mode_set_seconds "c03_2060_mr3" 3.0)
        (unit_set_emotional_state "marine_01" "scared" 0.5 30)
        (print "marine_01 - angry .5 30")
    )
)

(script dormant void c03_2070_jon
    (begin
        (sleep 288)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2070_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2070_jon" 1.0)
        (unit_set_emotional_state "johnson" "angry" 0.5 30)
        (print "johnson - angry .5 30")
    )
)

(script dormant void c03_2080_mr3
    (begin
        (sleep 328)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2080_mr3" "marine_01" 1.0)
        (attract_mode_set_seconds "c03_2080_mr3" 1.0)
    )
)

(script dormant void c03_2090_jon
    (begin
        (sleep 370)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2090_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2090_jon" 1.0)
    )
)

(script dormant void swap_tanks
    (begin
        (sleep 200)
        (object_destroy "scorpion_01")
        (object_create_anew "scorpion_02")
        (object_cinematic_lod "scorpion_02" true)
        (object_uses_cinematic_lighting "scorpion_02" true)
        (print "swap tanks")
    )
)

(script static void c03_intra1_02a_setup
    (begin
        (wake c03_2040_jon)
        (wake c03_2050_mr4)
        (wake c03_2060_mr3)
        (wake c03_2070_jon)
        (wake c03_2080_mr3)
        (wake c03_2090_jon)
        (wake c03_intra1_foley_02a)
        (wake swap_tanks)
    )
)

(script static void c03_intra1_scene_02a
    (begin
        (c03_intra1_02a_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\03_intra1\03_intra1" "03_intra1_02a" none "anchor_flag_intra1")
        (custom_animation_relative_loop "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02a" false "anchor_intra1")
        (custom_animation_relative "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02a" false "anchor_intra1")
        (custom_animation_relative_loop "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02a" false "anchor_intra1")
        (custom_animation_relative_loop "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02a" false "anchor_intra1")
        (custom_animation_relative "pelican_01a" "objects\vehicles\pelican\03_intra1\03_intra1" "pelican_02a" false "anchor_intra1")
        (custom_animation_relative_loop "scorpion_01" "objects\vehicles\scorpion\03_intra1\03_intra1" "scorpion_02a" false "anchor_intra1")
        (sleep (- (camera_set_pan) prediction_offset))
        (03_intra1_02b_predict_stub)
        (sleep (camera_set_pan))
        (object_destroy "pelican_01a")
    )
)

(script dormant void c03_intra1_speech_easy
    (begin
        (custom_animation_relative_loop "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02b_easy" false "anchor_intra1")
        (custom_animation_relative_loop "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02b" false "anchor_intra1")
        (sleep 5)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2097_jon" none 1.0)
        (attract_mode_set_seconds "c03_2097_jon" 8.0)
    )
)

(script dormant void c03_intra1_speech_normal
    (begin
        (custom_animation_relative_loop "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02b_easy" false "anchor_intra1")
        (custom_animation_relative_loop "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02b" false "anchor_intra1")
        (sleep 5)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2091_jon" none 1.0)
        (attract_mode_set_seconds "c03_2091_jon" 8.0)
    )
)

(script dormant void c03_intra1_speech_heroic
    (begin
        (custom_animation_relative_loop "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02b_easy" false "anchor_intra1")
        (custom_animation_relative_loop "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02b" false "anchor_intra1")
        (sleep 5)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2093_jon" none 1.0)
        (attract_mode_set_seconds "c03_2093_jon" 8.0)
    )
)

(script dormant void c03_intra1_speech_legendary
    (begin
        (custom_animation_relative_loop "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02b_easy" false "anchor_intra1")
        (custom_animation_relative_loop "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02b" false "anchor_intra1")
        (custom_animation_relative_loop "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02b" false "anchor_intra1")
        (sleep 5)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2095_jon" none 1.0)
        (attract_mode_set_seconds "c03_2095_jon" 8.0)
    )
)

(script static void c03_intra1_scene_02b
    (begin
        (if (= easy (pvs_set_camera)) 
            (begin
                (print "easy speech")
                (wake c03_intra1_speech_easy)
                (camera_set "c03_intra1_01" 0)
                (camera_set "c03_intra1_02" 261)
                (sleep 261)
                (sleep 15)
            )
        )
        (if (= normal (pvs_set_camera)) 
            (begin
                (print "normal speech")
                (wake c03_intra1_speech_normal)
                (camera_set "c03_intra1_01" 0)
                (camera_set "c03_intra1_02" 246)
                (sleep 246)
                (sleep 15)
            )
        )
        (if (= heroic (pvs_set_camera)) 
            (begin
                (print "heroic speech")
                (wake c03_intra1_speech_heroic)
                (camera_set "c03_intra1_01" 0)
                (camera_set "c03_intra1_02" 290)
                (sleep 290)
                (sleep 15)
            )
        )
        (if (= legendary (pvs_set_camera)) 
            (begin
                (print "legendary speech")
                (wake c03_intra1_speech_legendary)
                (camera_set "c03_intra1_01" 0)
                (camera_set "c03_intra1_02" 320)
                (sleep 320)
                (sleep 15)
            )
        )
        (sleep (- (camera_set_pan) prediction_offset))
        (03_intra1_02c_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_02c_fol")
    )
)

(script dormant void c03_intra1_foley_02c
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_02c_fol" none 1.0)
        (print "c03_intra1 foley 02c start")
    )
)

(script dormant void c03_2092_jon
    (begin
        (sleep 4)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2092_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2092_jon" 2.0)
        (sleep 65)
        (unit_set_emotional_state "marine_01" "shocked" 0.5 30)
        (print "marine_01 - shocked .5 30")
    )
)

(script dormant void c03_2094_jon
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2094_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2094_jon" 2.0)
        (sleep 65)
        (unit_set_emotional_state "marine_01" "shocked" 0.5 30)
        (print "marine_01 - shocked .5 30")
    )
)

(script dormant void c03_2096_jon
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2096_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2096_jon" 2.0)
        (sleep 65)
        (unit_set_emotional_state "marine_01" "shocked" 0.5 30)
        (print "marine_01 - shocked .5 30")
    )
)

(script dormant void c03_2098_jon
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2098_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2098_jon" 2.0)
        (sleep 65)
        (unit_set_emotional_state "marine_01" "shocked" 0.5 30)
        (print "marine_01 - shocked .5 30")
    )
)

(script dormant void c03_2100_mr4
    (begin
        (sleep 81)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2100_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2100_mr4" 1.0)
    )
)

(script dormant void c03_2100_mr4_hard
    (begin
        (sleep 86)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2100_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2100_mr4" 1.0)
    )
)

(script dormant void c03_2100_mr4_leg
    (begin
        (sleep 102)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2100_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2100_mr4" 1.0)
    )
)

(script dormant void c03_2110_jon
    (begin
        (sleep 119)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2110_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2110_jon" 3.0)
        (sleep 90)
        (unit_set_emotional_state "marine_01" "repulsed" 0.25 60)
        (print "marine_01 - repulsed .25 60")
    )
)

(script dormant void c03_2110_jon_leg
    (begin
        (sleep 133)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2110_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2110_jon" 3.0)
    )
)

(script dormant void c03_2120_jon
    (begin
        (sleep 235)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2120_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2120_jon" 3.0)
    )
)

(script dormant void c03_2120_jon_leg
    (begin
        (sleep 249)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2120_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2120_jon" 2.0)
    )
)

(script dormant void c03_2130_mr4
    (begin
        (sleep 301)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2130_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2130_mr4" 1.0)
    )
)

(script dormant void c03_2130_mr4_leg
    (begin
        (sleep 315)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2130_mr4" "marine_02" 1.0)
        (attract_mode_set_seconds "c03_2130_mr4" 1.0)
    )
)

(script dormant void c03_2140_cor
    (begin
        (sleep 352)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_2140_cor" none 1.0 "radio_default_in")
        (attract_mode_set_seconds "c03_2140_cor" 3.0)
    )
)

(script dormant void c03_2140_cor_leg
    (begin
        (sleep 366)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\c03_2140_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c03_2140_cor" 3.0)
    )
)

(script static void c03_intra1_scene_02c
    (begin
        (unit_set_emotional_state "johnson" "angry" 0.5 0)
        (print "johnson - angry .5 0")
        (unit_set_emotional_state "marine_01" "scared" 0.5 0)
        (print "marine_01 - scared .5 0")
        (if (= easy (pvs_set_camera)) 
            (begin
                (print "easy speech")
                (object_create_anew "cigar")
                (wake c03_2098_jon)
                (wake c03_2100_mr4)
                (wake c03_2110_jon)
                (wake c03_2120_jon)
                (wake c03_2130_mr4)
                (wake c03_2140_cor)
                (wake c03_intra1_foley_02c)
                (camera_set_animation_relative "objects\characters\cinematic_camera\03_intra1\03_intra1" "03_intra1_02ce" none "anchor_flag_intra1")
                (custom_animation_relative "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02ce" false "anchor_intra1")
                (custom_animation_relative "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02ce" false "anchor_intra1")
                (custom_animation_relative "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02ce" false "anchor_intra1")
                (custom_animation_relative "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02ce" false "anchor_intra1")
                (scenery_animation_start_relative "cigar" "objects\cinematics\human\cigar\cigar_good\03_intra1\03_intra1" "cigar_02e" "anchor_intra1")
            )
        )
        (if (= normal (pvs_set_camera)) 
            (begin
                (print "normal speech")
                (object_create_anew "cigar")
                (wake c03_2092_jon)
                (wake c03_2100_mr4)
                (wake c03_2110_jon)
                (wake c03_2120_jon)
                (wake c03_2130_mr4)
                (wake c03_2140_cor)
                (wake c03_intra1_foley_02c)
                (camera_set_animation_relative "objects\characters\cinematic_camera\03_intra1\03_intra1" "03_intra1_02cn" none "anchor_flag_intra1")
                (custom_animation_relative "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02cn" false "anchor_intra1")
                (custom_animation_relative "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02cn" false "anchor_intra1")
                (custom_animation_relative "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02cn" false "anchor_intra1")
                (custom_animation_relative "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02cn" false "anchor_intra1")
                (scenery_animation_start_relative "cigar" "objects\cinematics\human\cigar\cigar_good\03_intra1\03_intra1" "cigar_02n" "anchor_intra1")
            )
        )
        (if (= heroic (pvs_set_camera)) 
            (begin
                (print "heroic speech")
                (object_create_anew "cigar")
                (wake c03_2094_jon)
                (wake c03_2100_mr4_hard)
                (wake c03_2110_jon)
                (wake c03_2120_jon)
                (wake c03_2130_mr4)
                (wake c03_2140_cor)
                (wake c03_intra1_foley_02c)
                (camera_set_animation_relative "objects\characters\cinematic_camera\03_intra1\03_intra1" "03_intra1_02ch" none "anchor_flag_intra1")
                (custom_animation_relative "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02ch" false "anchor_intra1")
                (custom_animation_relative "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02ch" false "anchor_intra1")
                (custom_animation_relative "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02ch" false "anchor_intra1")
                (custom_animation_relative "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02ch" false "anchor_intra1")
                (scenery_animation_start_relative "cigar" "objects\cinematics\human\cigar\cigar_good\03_intra1\03_intra1" "cigar_02h" "anchor_intra1")
            )
        )
        (if (= legendary (pvs_set_camera)) 
            (begin
                (print "legendary speech")
                (object_create_anew "cigar")
                (wake c03_2096_jon)
                (wake c03_2100_mr4_leg)
                (wake c03_2110_jon_leg)
                (wake c03_2120_jon_leg)
                (wake c03_2130_mr4_leg)
                (wake c03_2140_cor_leg)
                (wake c03_intra1_foley_02c)
                (camera_set_animation_relative "objects\characters\cinematic_camera\03_intra1\03_intra1" "03_intra1_02cl" none "anchor_flag_intra1")
                (custom_animation_relative "chief" "objects\characters\masterchief\03_intra1\03_intra1" "chief_02cl" false "anchor_intra1")
                (custom_animation_relative "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_02cl" false "anchor_intra1")
                (custom_animation_relative "marine_01" "objects\characters\marine\03_intra1\03_intra1" "marine01_02cl" false "anchor_intra1")
                (custom_animation_relative "marine_02" "objects\characters\marine\03_intra1\03_intra1" "marine02_02cl" false "anchor_intra1")
                (scenery_animation_start_relative "cigar" "objects\cinematics\human\cigar\cigar_good\03_intra1\03_intra1" "cigar_02l" "anchor_intra1")
            )
        )
        (sleep (- (camera_set_pan) 15.0))
        (object_destroy "pelican_01a")
        (object_destroy "cigar")
        (print "problem actors")
        (object_create_anew "pelican_01b")
        (object_create_anew "rear_gun")
        (object_cinematic_lod "pelican_01b" true)
        (object_cinematic_lod "rear_gun" true)
        (object_uses_cinematic_lighting "pelican_01b" true)
        (object_uses_cinematic_lighting "rear_gun" true)
        (sleep (- (camera_set_pan) prediction_offset))
        (03_intra1_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_03_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c03_intra1_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\c03_intra1\foley\c03_intra1_03_fol" none 1.0)
        (print "c03_intra1 foley 03 start")
    )
)

(script dormant void c03_2150_jon
    (begin
        (sleep 59)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\c03_2150_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c03_2150_jon" 2.0)
        (sleep 15)
        (unit_set_emotional_state "johnson" "amorous" 1.0 15)
        (print "johnson - amorous 1 15")
    )
)

(script dormant void c03_intra1_cinematic_light_03
    (begin
        (cinematic_lighting_set_primary_light 31.0 72.0 0.105882 0.0941177 0.0705882)
        (cinematic_lighting_set_secondary_light 17.0 56.0 0.0784314 0.0784314 0.129412)
        (cinematic_lighting_set_ambient_light 0.0392157 0.0392157 0.0392157)
    )
)

(script static void c03_intra1_03_setup
    (begin
        (wake c03_2150_jon)
        (wake c03_intra1_foley_03)
        (wake c03_intra1_cinematic_light_03)
    )
)

(script static void c03_intra1_03_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "johnson")
        (object_destroy "marine_01")
        (object_destroy "marine_02")
        (object_destroy "rear_gun")
        (object_destroy "pelican_01b")
        (object_destroy "scorpion_02")
        (object_destroy "rifle_01")
        (object_destroy "rifle_02")
        (object_destroy "rifle_03")
    )
)

(script static void c03_intra1_scene_03
    (begin
        (c03_intra1_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\03_intra1\03_intra1" "03_intra1_03" none "anchor_flag_intra1")
        (custom_animation_relative "johnson" "objects\characters\marine\03_intra1\03_intra1" "johnson_03" false "anchor_intra1")
        (custom_animation_relative "pelican_01b" "objects\vehicles\pelican\03_intra1\03_intra1" "pelican_03" false "anchor_intra1")
        (scenery_animation_start_relative "rear_gun" "objects\vehicles\pelican\pelican_rear_gun\03_intra1\03_intra1" "rear_gun_03" "anchor_intra1")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c03_intra1_03_cleanup)
        (sleep 30)
    )
)

(script static void c03_intra1
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (sound_class_enable_ducker "vehicle_collision" 0.0 0)
        (sound_class_enable_ducker "amb" 0.25 1)
        (crash earthcity_3b)
        (sleep 1)
        (c03_intra1_scene_01)
        (c03_intra1_scene_02a)
        (c03_intra1_scene_02b)
        (c03_intra1_scene_02c)
        (c03_intra1_scene_03)
        (sound_class_enable_ducker "vehicle_collision" 1.0 1)
        (sound_class_enable_ducker "amb" 1.0 1)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script dormant void x03_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\foley\x03_01_fol" none 1.0)
        (print "x03 foley 01 start")
    )
)

(script dormant void x03_0010_jon
    (begin
        (sleep 484)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\x03_0010_jon" "johnson" 1.0 "radio_default")
        (attract_mode_set_seconds "x03_0010_jon" 2.0)
    )
)

(script dormant void x03_0020_mir
    (begin
        (sleep 552)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\x03_0020_mir" none 1.0 "radio_default")
        (attract_mode_set_seconds "x03_0020_mir" 1.5)
    )
)

(script dormant void x03_fov_01
    (begin
        (sleep 88)
        (print "fov change: 65 -> 45 over 90 ticks")
        (camera_pan 55.0 90)
        (sleep 91)
        (print "fov change: 45 -> 50 over 0 ticks")
        (camera_pan 60.0 0)
        (sleep 299)
        (print "fov change: 50 -> 20 over 0 ticks")
        (camera_pan 20.0 0)
        (object_destroy "scarab_02")
    )
)

(script dormant void x03_01_dof_1
    (begin
        (sleep 479)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 1.0 1.0 0.0 0.0 0.0 0.0)
        (print "rack focus")
    )
)

(script dormant void scarab_shake_1
    (begin
        (sleep 135)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
    )
)

(script dormant void scarab_shake_2
    (begin
        (sleep 179)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.4 0.0)
        (sleep 25)
        (hud_blink_health 3.0)
    )
)

(script dormant void effect_scarab_death
    (begin
        (sleep 27)
        (print "blow main-gun")
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion_mouth" "scarab_02" "primary_trigger")
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion" "scarab_02" "head_destroyed_cine")
        (sleep 2)
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion" "scarab_02" "neck_destroyed_cine")
        (sleep 3)
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion" "scarab_02" "neck_destroyed2_cine")
        (sleep 5)
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion" "scarab_02" "knee_destroyed_cine")
        (sleep 2)
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion" "scarab_02" "belly_destroyed_cine")
        (sleep 3)
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion" "scarab_02" "calf_destroyed_cine")
        (sleep 5)
        (effect_new_on_object_marker "effects\scenarios\objects\covenant\military\scarab\scarab_death_explosion" "scarab_02" "knee_destroyed02_cine")
    )
)

(script dormant void effect_smoke_start
    (begin
        (sleep 165)
        (print "smoke start")
        (object_create "x03_smoke")
    )
)

(script dormant void effect_smoke_stop
    (begin
        (sleep 475)
        (print "smoke stop")
        (object_destroy "x03_smoke")
    )
)

(script dormant void effect_grav_lift
    (begin
        (sleep 330)
        (object_set_function_variable "carrier" "grav_lift_control" 0.0 75.0)
        (print "grav-lift deactivate")
    )
)

(script dormant void x03_cinematic_lighting_01
    (begin
        (cinematic_lighting_set_primary_light 31.0 72.0 0.529412 0.466667 0.396078)
        (cinematic_lighting_set_secondary_light -60.0 180.0 0.0627451 0.0588235 0.117647)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "johnson_02" true)
        (object_uses_cinematic_lighting "pilot" true)
        (object_uses_cinematic_lighting "pelican_01a" true)
        (object_uses_cinematic_lighting "scarab_02" true)
        (object_uses_cinematic_lighting "carrier" true)
    )
)

(script static void x03_01_setup
    (begin
        (object_create_anew "chief")
        (object_create_anew "johnson_02")
        (object_create_anew "pilot")
        (object_create_anew "pelican_01a")
        (object_create_anew "scarab_02")
        (object_create_anew "carrier")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "johnson_02" true)
        (object_cinematic_lod "pilot" true)
        (object_cinematic_lod "pelican_01a" true)
        (object_cinematic_lod "scarab_02" true)
        (object_cinematic_lod "carrier" true)
        (ice_cream_flavor_stock "chief" "right_hand" "")
        (object_set_function_variable "carrier" "grav_lift_control" 1.0 0.0)
        (wake x03_0010_jon)
        (wake x03_0020_mir)
        (wake x03_foley_01)
        (wake x03_fov_01)
        (wake x03_01_dof_1)
        (wake scarab_shake_1)
        (wake scarab_shake_2)
        (wake effect_grav_lift)
        (wake effect_scarab_death)
        (wake effect_smoke_start)
        (wake effect_smoke_stop)
        (wake x03_cinematic_lighting_01)
    )
)

(script static void x03_01_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "johnson_02")
        (object_destroy "pilot")
        (object_destroy "pelican_01a")
        (object_destroy "carrier")
        (object_destroy "x03_smoke")
    )
)

(script static void x03_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "newmombasa_2")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (x03_01_predict_stub)
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\foley\x03_01_fol")
        (sleep prediction_offset)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_01" none "anchor_flag_x03_01")
        (x03_01_setup)
        (custom_animation_relative "chief" "objects\characters\masterchief\x03\x03" "chief_01" false "anchor_x03_01")
        (custom_animation_relative "johnson_02" "objects\characters\marine\x03\x03" "johnson_01" false "anchor_x03_01")
        (custom_animation_relative "pilot" "objects\characters\marine\x03\x03" "pilot_01" false "anchor_x03_01")
        (custom_animation_relative "pelican_01a" "objects\vehicles\pelican\x03\x03" "pelican_01" false "anchor_x03_01")
        (scenery_animation_start_relative "scarab_02" "scenarios\objects\covenant\military\scarab\x03\x03" "scarab_01" "anchor_x03_01")
        (scenery_animation_start_relative "carrier" "scenarios\objects\covenant\military\capital_ship\x03\x03" "carrier_01" "anchor_x03_01")
        (sleep 15)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\foley\x03_02_fol")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (x03_01_cleanup)
    )
)

(script dormant void c03_intra1_sound_scene2_01
    (begin
        (sleep 30)
        (sound_class_enable_ducker "vehicle_engine" 0.2 60)
    )
)

(script dormant void x03_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\foley\x03_02_fol" none 1.0)
        (print "x03 foley 02 start")
    )
)

(script dormant void x03_0030_mir
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0030_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x03_0030_mir" 2.0)
    )
)

(script dormant void x03_0040_jon
    (begin
        (sleep 73)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\x03_0040_jon" "johnson_03" 1.0 "radio_default")
        (attract_mode_set_seconds "x03_0040_jon" 1.0)
    )
)

(script dormant void x03_0050_lhd
    (begin
        (sleep 106)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\x03_0050_lhd" "hood" 1.0 "radio_default")
        (attract_mode_set_seconds "x03_0050_lhd" 1.0)
    )
)

(script dormant void x03_0060_mir
    (begin
        (sleep 133)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0060_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x03_0060_mir" 3.0)
    )
)

(script dormant void x03_texture_camera_scene_02
    (begin
        (print "texture camera start")
        (object_create_anew "texture_camera")
        (texture_camera_set_object_marker "texture_camera" "marker" 50.0)
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\x03\x03" "texture_camera_02" "anchor_x03_02")
    )
)

(script dormant void x03_cinematic_lighting_02
    (begin
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -14.0 150.0 0.09 0.09 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "iac_bridge" true)
        (object_uses_cinematic_lighting "hood" true)
        (object_uses_cinematic_lighting "johnson_03" true)
        (object_uses_cinematic_lighting "pilot_02" true)
    )
)

(script static void x03_03_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "iac")
        (object_cinematic_lod "iac" true)
    )
)

(script dormant void delete_johnson
    (begin
        (sleep 150)
        (print "delete johnson and pelican")
        (object_destroy "johnson_03")
        (object_destroy "pilot_02")
    )
)

(script dormant void x03_emotion_02
    (begin
        (unit_set_emotional_state "miranda" "angry" 0.25 0)
        (print "miranda - angry .25 0")
        (unit_set_emotional_state "johnson" "angry" 0.5 0)
        (print "johnson - angry .5 0")
        (unit_set_emotional_state "hood" "angry" 0.25 0)
        (print "hood - angry .25 0")
    )
)

(script static void x03_02_setup
    (begin
        (object_create_anew "miranda")
        (object_create_anew "hood")
        (object_create "johnson_03")
        (object_create "pilot_02")
        (object_create_anew "iac_bridge")
        (object_create_anew "pelican_02")
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "hood" true)
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "pilot" true)
        (object_cinematic_lod "iac_bridge" true)
        (object_cinematic_lod "pelican_02" true)
        (wake c03_intra1_sound_scene2_01)
        (wake x03_foley_02)
        (wake x03_0030_mir)
        (wake x03_0040_jon)
        (wake x03_0050_lhd)
        (wake x03_0060_mir)
        (wake delete_johnson)
        (wake x03_emotion_02)
        (wake x03_texture_camera_scene_02)
        (wake x03_cinematic_lighting_02)
    )
)

(script static void x03_scene_02
    (begin
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
        (camera_pan 60.0 0)
        (x03_02_predict_stub)
        (x03_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_02" none "anchor_flag_x03_02")
        (custom_animation_relative "miranda" "objects\characters\miranda\x03\x03" "miranda_02" false "anchor_x03_02")
        (custom_animation_relative "johnson_03" "objects\characters\marine\x03\x03" "johnson_02" false "anchor_x03_02")
        (custom_animation_relative "pilot_02" "objects\characters\marine\x03\x03" "pilot_02" false "anchor_x03_02")
        (custom_animation_relative "hood" "objects\characters\lord_hood\x03\x03" "hood_02" false "anchor_x03_02")
        (custom_animation_relative "pelican_02" "objects\vehicles\pelican\x03\x03" "pelican_02" false "anchor_x03_02")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\x03\x03" "iacbridge_02" "anchor_x03_02")
        (sleep 20)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (x03_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\music\x03_03_mus")
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\foley\x03_03_fol")
        (sleep (- (camera_set_pan) 15.0))
        (x03_03_problem_actors)
        (sleep (camera_set_pan))
        (print "texture camera stop")
        (object_hide "hood" true)
        (print "hide hood")
    )
)

(script dormant void x03_score_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\music\x03_03_mus" none 1.0)
        (print "x03 score 03 start")
    )
)

(script dormant void x03_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\foley\x03_03_fol" none 1.0)
        (print "x03 foley 03 start")
    )
)

(script dormant void x03_0070_lhd
    (begin
        (sleep 0)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\x03_0070_lhd" none 1.0 "radio_default")
        (attract_mode_set_seconds "x03_0070_lhd" 1.0)
    )
)

(script dormant void x03_0080_lhd
    (begin
        (sleep 50)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\x03_0080_lhd" none 1.0 "radio_default")
        (attract_mode_set_seconds "x03_0080_lhd" 2.0)
    )
)

(script dormant void x03_0090_nv1
    (begin
        (sleep 195)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0090_nv1" none 1.0)
        (attract_mode_set_seconds "x03_0090_nv1" 3.0)
    )
)

(script dormant void x03_fov_03
    (begin
        (sleep 27)
        (print "fov change: 5 -> 50 over 38 ticks")
        (camera_pan 60.0 38)
        (sleep 191)
        (print "fov change: 50 -> 15 over 26 ticks")
        (camera_pan 25.0 26)
    )
)

(script dormant void effect_slipspace_open
    (begin
        (sleep 161)
        (print "effect - slipspace open")
        (effect_new_on_object_marker "effects\cinematics\03\slipspace_open" "carrier_02" "bow")
    )
)

(script dormant void x03_cinematic_lighting_03
    (begin
        (cinematic_lighting_set_primary_light 31.0 68.0 0.513726 0.415686 0.313726)
        (cinematic_lighting_set_secondary_light -63.0 42.0 0.0901961 0.0901961 0.117647)
        (cinematic_lighting_set_ambient_light 0.0823529 0.0823529 0.0823529)
        (object_uses_cinematic_lighting "iac" true)
        (object_uses_cinematic_lighting "carrier_02" true)
    )
)

(script static void x03_04_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "nav_officer")
        (object_cinematic_lod "nav_officer" true)
        (object_uses_cinematic_lighting "nav_officer" true)
    )
)

(script dormant void hide_iac_crew_03
    (begin
        (print "hide iac bridge")
        (object_hide "miranda" true)
        (object_hide "iac_bridge" true)
    )
)

(script static void x03_03_setup
    (begin
        (object_create_anew "carrier_02")
        (object_cinematic_lod "carrier_02" true)
        (wake x03_0070_lhd)
        (wake x03_0080_lhd)
        (wake x03_0090_nv1)
        (wake x03_score_03)
        (wake x03_foley_03)
        (wake x03_fov_03)
        (wake x03_cinematic_lighting_03)
        (wake effect_slipspace_open)
        (wake hide_iac_crew_03)
    )
)

(script static void x03_scene_03
    (begin
        (print "fov change: 50 -> 5 over 0 ticks")
        (camera_pan 15.0 0)
        (x03_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_03" none "anchor_flag_x03_02")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x03\x03" "iac_03" "anchor_x03_02")
        (scenery_animation_start_relative "carrier_02" "scenarios\objects\covenant\military\capital_ship\x03\x03" "carrier_03" "anchor_x03_02")
        (sleep (- (camera_set_pan) prediction_offset))
        (x03_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\foley\x03_04_fol")
        (x03_04_problem_actors)
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
    )
)

(script dormant void x03_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\foley\x03_04_fol" none 1.0)
        (print "x03 foley 04 start")
    )
)

(script dormant void x03_0100_nv1
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0100_nv1" "nav_officer" 1.0)
        (attract_mode_set_seconds "x03_0100_nv1" 2.0)
    )
)

(script dormant void x03_0110_mir
    (begin
        (sleep 121)
        (object_hide "iac" true)
        (object_hide "carrier_02" true)
        (print "hide iac, carrier")
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0110_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x03_0110_mir" 1.0)
        (unit_set_emotional_state "miranda" "shocked" 0.25 30)
        (print "miranda - shocked .25 30")
        (sleep 30)
        (object_hide "hood" false)
        (print "unhide hoodr")
    )
)

(script dormant void x03_0120_lhd
    (begin
        (sleep 175)
        (sound_impulse_time "sound\dialog\levels\03_earthcity\cinematic\x03_0120_lhd" "hood" 1.0 "radio_default")
        (attract_mode_set_seconds "x03_0120_lhd" 2.0)
        (unit_set_emotional_state "hood" "angry" 0.5 30)
        (print "hood - angry .5 30")
    )
)

(script dormant void x03_texture_camera_scene_04
    (begin
        (print "texture camera start")
        (object_create_anew "texture_camera")
        (texture_camera_set_object_marker "texture_camera" "marker" 50.0)
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\x03\x03" "texture_camera_04" "anchor_x03_02")
    )
)

(script dormant void x03_cinematic_lighting_04
    (begin
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -14.0 150.0 0.09 0.09 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
    )
)

(script dormant void x03_emotion_04
    (begin
        (unit_set_emotional_state "miranda" "angry" 0.25 0)
        (print "miranda - angry .25 0")
        (unit_set_emotional_state "hood" "angry" 0.25 0)
        (print "hood - angry .25 0")
        (unit_set_emotional_state "nav_officer" "angry" 0.25 0)
        (print "nav_officer - angry .25 0")
        (sleep 20)
        (unit_set_emotional_state "nav_officer" "shocked" 0.5 30)
        (print "nav_officer - shocked .5 30")
    )
)

(script static void x03_04_setup
    (begin
        (object_hide "miranda" false)
        (object_hide "iac_bridge" false)
        (cinematic_set_environment_map_attenuation 0.05)
        (print "setting near clip distance to .05")
        (wake x03_0100_nv1)
        (wake x03_0110_mir)
        (wake x03_0120_lhd)
        (wake x03_foley_04)
        (wake x03_texture_camera_scene_04)
        (wake x03_cinematic_lighting_04)
    )
)

(script static void x03_scene_04
    (begin
        (print "fov change: 15 -> 50 over 0 ticks")
        (camera_pan 60.0 0)
        (x03_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_04" none "anchor_flag_x03_02")
        (custom_animation_relative "miranda" "objects\characters\miranda\x03\x03" "miranda_04" false "anchor_x03_02")
        (custom_animation_relative "hood" "objects\characters\lord_hood\x03\x03" "hood_04" false "anchor_x03_02")
        (custom_animation_relative "nav_officer" "objects\characters\marine\x03\x03" "nav_04" false "anchor_x03_02")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\x03\x03" "iacbridge_04" "anchor_x03_02")
        (scenery_animation_start_relative "carrier_02" "scenarios\objects\covenant\military\capital_ship\x03\x03" "carrier_04" "anchor_x03_02")
        (sleep 10)
        (cinematic_start 1.0 1.0 1.0 5)
        (sleep (- (camera_set_pan) prediction_offset))
        (x03_05_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\foley\x03_05_fol")
        (sleep (camera_set_pan))
        (object_destroy "hood")
        (texture_camera_off)
        (print "texture camera stop")
    )
)

(script dormant void x03_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\foley\x03_05_fol" none 1.0)
        (print "x03 foley 05 start")
    )
)

(script dormant void x03_0130_mir
    (begin
        (sleep 94)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0130_mir" none 1.0)
        (attract_mode_set_seconds "x03_0130_mir" 1.5)
    )
)

(script dormant void effect_iac_engines
    (begin
        (sleep 112)
        (print "effect - engine")
        (effect_new_on_object_marker "effects\cinematics\03\iac_engine_fire" "iac" "")
    )
)

(script dormant void effect_slipspace_widen
    (begin
        (sleep 0)
        (effect_new_on_object_marker "effects\cinematics\03\slipspace_widening" "carrier_02" "bow")
        (print "slipspace open")
    )
)

(script dormant void x03_cinematic_lighting_05
    (begin
        (cinematic_lighting_set_primary_light 31.0 42.0 0.662745 0.470588 0.278431)
        (cinematic_lighting_set_secondary_light -18.0 30.0 0.121569 0.113725 0.219608)
        (cinematic_lighting_set_ambient_light 0.0392157 0.0392157 0.0392157)
    )
)

(script dormant void delete_pelican
    (begin
        (sleep 87)
        (object_destroy "pelican_02")
    )
)

(script dormant void hide_iac_crew_05
    (begin
        (print "hide iac bridge")
        (object_hide "miranda" true)
        (object_hide "nav_officer" true)
        (object_hide "iac_bridge" true)
    )
)

(script static void x03_05_setup
    (begin
        (object_hide "iac" false)
        (object_hide "carrier_02" false)
        (cinematic_set_environment_map_attenuation 0.06)
        (print "resetting near clip distance to .06")
        (wake x03_foley_05)
        (wake x03_0130_mir)
        (wake x03_cinematic_lighting_05)
        (wake effect_iac_engines)
        (wake effect_slipspace_widen)
        (wake delete_pelican)
        (wake hide_iac_crew_05)
    )
)

(script static void x03_scene_05
    (begin
        (x03_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_05" none "anchor_flag_x03_02")
        (custom_animation_relative "pelican_02" "objects\vehicles\pelican\x03\x03" "pelican_05" false "anchor_x03_02")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x03\x03" "iac_05" "anchor_x03_02")
        (scenery_animation_start_relative "carrier_02" "scenarios\objects\covenant\military\capital_ship\x03\x03" "carrier_05" "anchor_x03_02")
        (sleep (- (camera_set_pan) prediction_offset))
        (x03_06_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\foley\x03_06_fol")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
    )
)

(script dormant void x03_foley_06
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\foley\x03_06_fol" none 1.0)
        (print "x03 foley 06 start")
    )
)

(script dormant void x03_0140_nv1
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0140_nv1" "nav_officer" 1.0)
        (attract_mode_set_seconds "x03_0140_nv1" 2.0)
        (unit_set_emotional_state "miranda" "angry" 0.15 0)
        (print "miranda - angry .15 0")
    )
)

(script dormant void x03_0150_mir
    (begin
        (sleep 55)
        (sound_impulse_start_effect "sound\dialog\levels\03_earthcity\cinematic\x03_0150_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x03_0150_mir" 1.0)
        (unit_set_emotional_state "miranda" "angry" 0.35 45)
        (print "miranda - angry .35 45")
    )
)

(script dormant void x03_fov_06
    (begin
        (sleep 53)
        (print "fov change: 80 -> 60 over 0 ticks")
        (camera_pan 60.0 0)
    )
)

(script dormant void x03_texture_camera_scene_06
    (begin
        (print "texture camera start")
        (object_create_anew "texture_camera")
        (texture_camera_set_object_marker "texture_camera" "marker" 50.0)
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\x03\x03" "texture_camera_06" "anchor_x03_02")
    )
)

(script dormant void x03_cinematic_lighting_06
    (begin
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -14.0 150.0 0.09 0.09 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
    )
)

(script static void x03_06_setup
    (begin
        (object_hide "miranda" false)
        (object_hide "nav_officer" false)
        (object_hide "iac_bridge" false)
        (wake x03_0140_nv1)
        (wake x03_0150_mir)
        (wake x03_foley_06)
        (wake x03_texture_camera_scene_06)
        (wake x03_fov_06)
        (wake x03_cinematic_lighting_06)
    )
)

(script static void x03_06_cleanup
    (begin
        (object_destroy "miranda")
        (object_destroy "nav_officer")
        (object_destroy "iac_bridge")
    )
)

(script static void x03_scene_06
    (begin
        (camera_pan 80.0 0)
        (x03_06_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_06" none "anchor_flag_x03_02")
        (custom_animation_relative "miranda" "objects\characters\miranda\x03\x03" "miranda_06" false "anchor_x03_02")
        (custom_animation_relative "nav_officer" "objects\characters\marine\x03\x03" "nav_06" false "anchor_x03_02")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\x03\x03" "iacbridge_06" "anchor_x03_02")
        (scenery_animation_start_relative "carrier_02" "scenarios\objects\covenant\military\capital_ship\x03\x03" "carrier_06" "anchor_x03_02")
        (sleep 10)
        (cinematic_start 1.0 1.0 1.0 5)
        (sleep (- (camera_set_pan) prediction_offset))
        (x03_07_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\03_earthcity\x03\foley\x03_07_fol")
        (sleep (camera_set_pan))
        (x03_06_cleanup)
        (texture_camera_off)
        (print "texture camera stop")
    )
)

(script dormant void x03_foley_07
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\03_earthcity\x03\foley\x03_07_fol" none 1.0)
        (print "x03 foley 07 start")
    )
)

(script dormant void effect_slipspace_collapse
    (begin
        (sleep 150)
        (object_create_anew "x03_slipspace_collapse")
        (print "effect - slipspace collapse")
    )
)

(script dormant void effect_shockwave_start
    (begin
        (sleep 218)
        (object_create_anew "x03_shockwave_start")
        (print "effect - shockwave start")
    )
)

(script dormant void shockwave_shake_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 234)
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.4 1.0)
    )
)

(script dormant void x03_cinematic_lighting_07
    (begin
        (cinematic_lighting_set_primary_light 31.0 42.0 0.662745 0.470588 0.278431)
        (cinematic_lighting_set_secondary_light -18.0 30.0 0.121569 0.113725 0.219608)
        (cinematic_lighting_set_ambient_light 0.0392157 0.0392157 0.0392157)
    )
)

(script dormant void delete_iac
    (begin
        (sleep 152)
        (object_destroy "iac")
    )
)

(script dormant void delete_carrier
    (begin
        (sleep 172)
        (object_destroy "carrier_02")
    )
)

(script static void x03_07_setup
    (begin
        (wake delete_iac)
        (wake delete_carrier)
        (wake effect_slipspace_collapse)
        (wake effect_shockwave_start)
        (wake shockwave_shake_01)
        (effect_new_on_object_marker "effects\cinematics\03\slipspace_widening" "carrier_02" "bow")
        (wake x03_cinematic_lighting_07)
        (wake x03_foley_07)
    )
)

(script static void x03_scene_07
    (begin
        (x03_07_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_07" none "anchor_flag_x03_02")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x03\x03" "iac_07" "anchor_x03_02")
        (scenery_animation_start_relative "carrier_02" "scenarios\objects\covenant\military\capital_ship\x03\x03" "carrier_07" "anchor_x03_02")
        (sleep (- (camera_set_pan) prediction_offset))
        (x03_08_predict_stub)
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
        (hud_blink_health 0.0)
    )
)

(script dormant void effect_ease_on_down_the_road
    (begin
        (sleep 0)
        (object_create_anew "x03_shockwave_close")
        (print "effetc - tetsuo!!!")
    )
)

(script dormant void effect_akira
    (begin
        (sleep 130)
        (object_create_anew "x03_shockwave_far")
        (print "effect - kaneda!!!")
    )
)

(script dormant void shockwave_shake_02
    (begin
        (rasterizer_profile_include_all)
        (sleep 40)
        (print "shake start")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.5 2.0)
        (rasterizer_profile_include_all)
        (sleep 89)
        (print "shake stop")
        (hud_blink_health 0.0)
    )
)

(script dormant void shockwave_shake_03
    (begin
        (rasterizer_profile_include_all)
        (sleep 270)
        (print "shake start")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 6.0)
    )
)

(script dormant void final_fade
    (begin
        (sleep 125)
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
        (sleep 10)
        (cinematic_start 1.0 1.0 1.0 5)
    )
)

(script static void x03_08_setup
    (begin
        (object_create_anew "x03_bus")
        (object_create_anew "x03_truck")
        (object_create_anew "x03_generator")
        (object_create_anew "x03_dumpster")
        (object_destroy_containing "x03_palm")
        (object_destroy "x03_shockwave_start")
        (object_destroy "x03_slipspace_collapse")
        (wake effect_ease_on_down_the_road)
        (wake final_fade)
        (wake effect_akira)
        (wake shockwave_shake_02)
        (wake shockwave_shake_03)
    )
)

(script static void x03_08_cleanup
    (begin
        (object_destroy "x03_shockwave_close")
        (object_destroy "x03_shockwave_far")
        (object_destroy "x03_bus")
        (object_destroy "x03_truck")
        (object_destroy "x03_generator")
        (object_destroy "x03_dumpster")
    )
)

(script static void x03_scene_08
    (begin
        (x03_08_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x03\x03" "x03_08" none "anchor_flag_x03_03")
        (scenery_animation_start_relative "x03_bus" "objects\vehicles\civilian\bus\x03\x03" "bus_08" "anchor_x03_03")
        (scenery_animation_start_relative "x03_truck" "objects\vehicles\civilian\panel_truck\x03\x03" "panel_truck_08" "anchor_x03_03")
        (scenery_animation_start_relative "x03_generator" "scenarios\objects\solo\earthcity\streetobjects\streetobj_big_generator\x03\x03" "big_generator_08" "anchor_x03_03")
        (scenery_animation_start_relative "x03_dumpster" "scenarios\objects\solo\earthcity\streetobjects\streetobj_dumpster\x03\x03" "dumpster_08" "anchor_x03_03")
        (sleep 10)
        (cinematic_start 1.0 1.0 1.0 5)
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 0.0 0.0 0.0 5)
        (sleep 5)
        (hud_blink_health 1.0)
        (x03_08_cleanup)
        (sleep 150)
    )
)

(script static void x03
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (sound_class_enable_ducker "vehicle" 0.5 0)
        (sound_class_enable_ducker "amb" 0.5 0)
        (crash earthcity_4)
        (sleep 1)
        (x03_scene_01)
        (crash earthcity_cine_intro_bsp)
        (sleep 5)
        (x03_scene_02)
        (x03_scene_03)
        (x03_scene_04)
        (x03_scene_05)
        (x03_scene_06)
        (x03_scene_07)
        (x03_scene_08)
    )
)

(script dormant void chapter_title0
    (begin
        (sleep 30)
        (if (difficulty_legendary) 
            (cinematic_suppress_bsp_object_creation "title0_legendary") (if (difficulty_heroic) 
                (cinematic_suppress_bsp_object_creation "title0_heroic") (cinematic_suppress_bsp_object_creation "title0_normal"))
        )
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

(script static void cinematic_intro
    (begin
        (if (cinematic_skip_start) 
            (c03_intra1))
        (cinematic_skip_stop)
    )
)

(script static void cinematic_outro
    (begin
        (if (cinematic_skip_start) 
            (x03))
        (cinematic_skip_stop)
    )
)

(script dormant void objective0_set
    (begin
        (sleep 90)
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
        (sleep_until (volume_test_objects "tv_e17_objectives" (players)) 15)
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
        (sleep 300)
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

(script dormant void music_03b_01_stop
    (begin
        (print "music 03b_01 stop")
        (sound_looping_set_scale "scenarios\solo\03b_newmombasa\03b_music\03b_01")
    )
)

(script dormant void music_03b_01_start_alt
    (begin
        (print "music 03b_01 start alt")
        (sound_class_show_channel "scenarios\solo\03b_newmombasa\03b_music\03b_01" true)
    )
)

(script dormant void music_03b_01_start
    (begin
        (print "music 03b_01 start")
        (sound_looping_stop_immediately "scenarios\solo\03b_newmombasa\03b_music\03b_01" none 1.0)
    )
)

(script dormant void music_03b_02_stop
    (begin
        (print "music 03b_02 stop")
        (sound_looping_set_scale "scenarios\solo\03b_newmombasa\03b_music\03b_02")
    )
)

(script dormant void music_03b_02_start
    (begin
        (print "music 03b_02 start")
        (sound_looping_stop_immediately "scenarios\solo\03b_newmombasa\03b_music\03b_02" none 1.0)
    )
)

(script dormant void music_03b_03_stop
    (begin
        (print "music 03b_03 stop")
        (sound_looping_set_scale "scenarios\solo\03b_newmombasa\03b_music\03b_03")
    )
)

(script dormant void music_03b_03_start
    (begin
        (print "music 03b_03 start")
        (sound_looping_stop_immediately "scenarios\solo\03b_newmombasa\03b_music\03b_03" none 1.0)
    )
)

(script dormant void music_03b_04_stop
    (begin
        (print "music 03b_04 stop")
        (sound_looping_set_scale "scenarios\solo\03b_newmombasa\03b_music\03b_04")
    )
)

(script dormant void music_03b_04_start_alt
    (begin
        (sleep_until (volume_test_objects "tv_scarab" (players)) 15)
        (print "music 03b_04 start alt")
        (sound_class_show_channel "scenarios\solo\03b_newmombasa\03b_music\03b_04" true)
    )
)

(script dormant void music_03b_04_start
    (begin
        (sleep_until (volume_test_objects "tv_e23_entry_door" (players)) 15)
        (print "music 03b_04 start")
        (sound_looping_stop_immediately "scenarios\solo\03b_newmombasa\03b_music\03b_04" none 1.0)
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
                (if (volume_test_objects "tv_dark_area0" (players)) 
                    (game_save_unsafe true) (game_save_unsafe false))
                false
            ) 
        60)
    )
)

(script dormant void scarab_no_save
    (begin
        (sleep_until 
            (begin
                (sleep_until (volume_test_objects "tv_scarab_no_save" (players)) 5)
                (game_save_immediate)
                (print "game save canceled")
                false
            ) 
        1)
    )
)

(script command_script void cs_scarab_load_main_gun
    (begin
        (object_hide (ai_get_object ai_current_actor) true)
        (vehicle_load_magic (unit (object_at_marker "scarab" "primary_trigger")) scarab_turret_d (ai_get_object ai_current_actor))
        (sleep_forever)
    )
)

(script command_script void cs_scarab_load_upper_gun
    (begin
        (object_hide (ai_get_object ai_current_actor) true)
        (vehicle_load_magic (unit (object_at_marker "scarab" "t_f_turret")) scarab_turret_d (ai_get_object ai_current_actor))
    )
)

(script command_script void cs_scarab_load_rear_gun
    (begin
        (object_hide (ai_get_object ai_current_actor) true)
        (vehicle_load_magic (unit (object_at_marker "scarab" "t_b_turret")) scarab_turret_d (ai_get_object ai_current_actor))
        (sleep_forever)
    )
)

(script static void scarab_idle_var0
    (begin
        (print "scarab_idle_var0")
        (device_set_position_track "scarab" "combat:idle:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_firing
    (begin
        (print "scarab_idle_var0")
        (device_set_position_track "scarab" "combat:idle:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_to_walk_front
    (begin
        (print "scarab_idle_to_walk_front")
        (device_set_position_track "scarab" "combat:idle:2:walk_front" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 3.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_to_walk_front_fast
    (begin
        (print "scarab_idle_to_walk_front")
        (device_set_position_track "scarab" "combat:idle:2:walk_front" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 2.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_var0
    (begin
        (print "scarab_walk_front_var0")
        (device_set_position_track "scarab" "combat:walk_front:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_var0_fast
    (begin
        (print "scarab_walk_front_var0")
        (device_set_position_track "scarab" "combat:walk_front:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 (/ 80.0 30.0) 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_low_var0
    (begin
        (print "scarab_walk_front_low_var0")
        (device_set_position_track "scarab" "combat:walk_front:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 8.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_to_idle
    (begin
        (print "scarab_walk_front_to_idle")
        (device_set_position_track "scarab" "combat:walk_front:2:idle" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 3.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_to_idle_fast
    (begin
        (print "scarab_walk_front_to_idle")
        (device_set_position_track "scarab" "combat:walk_front:2:idle" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 2.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_turn_22_left
    (begin
        (print "scarab_idle_turn_22_left")
        (device_set_position_track "scarab" "combat:turn_22_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_turn_45_left
    (begin
        (print "scarab_idle_turn_45_left")
        (device_set_position_track "scarab" "combat:turn_45_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_turn_45_right
    (begin
        (print "scarab_idle_turn_45_right")
        (device_set_position_track "scarab" "combat:turn_45_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_turn_15_left
    (begin
        (print "scarab_walk_front_turn_15_left")
        (device_set_position_track "scarab" "combat:walk_front_turn_15_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_turn_15_right
    (begin
        (print "scarab_walk_front_turn_15_right")
        (device_set_position_track "scarab" "combat:walk_front_turn_15_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_turn_22_left
    (begin
        (print "scarab_walk_front_turn_22_left")
        (device_set_position_track "scarab" "combat:walk_front_turn_22_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_turn_45_left
    (begin
        (print "scarab_walk_front_turn_45_left")
        (device_set_position_track "scarab" "combat:walk_front_turn_45_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_turn_45_right
    (begin
        (print "scarab_walk_front_turn_45_right")
        (device_set_position_track "scarab" "combat:walk_front_turn_45_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_front_to_walk_low
    (begin
        (print "scarab_walk_front_to_walk_low")
        (device_set_position_track "scarab" "combat:walk_front:2:walk_narrow_front" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_low_to_walk_front
    (begin
        (print "scarab_walk_narrow_to_walk_front")
        (device_set_position_track "scarab" "combat:walk_narrow_front:2:walk_front" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_walk_low_var0
    (begin
        (print "scarab_walk_narrow_var0")
        (device_set_position_track "scarab" "combat:walk_narrow_front:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_to_twist_5_left
    (begin
        (print "scarab_idle_to_twist_5_right")
        (device_set_position_track "scarab" "combat:idle_to_twist_5_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 1.5 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_to_twist_5_right
    (begin
        (print "scarab_idle_to_twist_5_right")
        (device_set_position_track "scarab" "combat:idle_to_twist_5_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 1.5 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_twist_5_left
    (begin
        (print "scarab_twist_5_left")
        (device_set_position_track "scarab" "combat:twist_5_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_twist_5_left_firing
    (begin
        (print "scarab_twist_5_left")
        (device_set_position_track "scarab" "combat:twist_5_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_twist_5_right
    (begin
        (print "scarab_twist_5_right")
        (device_set_position_track "scarab" "combat:twist_5_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_twist_5_right_firing
    (begin
        (print "scarab_twist_5_right")
        (device_set_position_track "scarab" "combat:twist_5_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_twist_5_left_to_idle
    (begin
        (print "scarab_twist_5_left_to_idle")
        (device_set_position_track "scarab" "combat:twist_5_left_to_idle" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 1.5 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_twist_5_right_to_idle
    (begin
        (print "scarab_twist_5_left_to_idle")
        (device_set_position_track "scarab" "combat:twist_5_right_to_idle" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 1.5 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_gun_open_instant
    (begin
        (device_set_overlay_track "scarab" "combat:fire_open")
        (device_animate_overlay "scarab" 1.0 0.05 0.0 0.0)
    )
)

(script static void scarab_gun_open
    (begin
        (device_set_overlay_track "scarab" "combat:fire_open")
        (device_animate_overlay "scarab" 1.0 3.5 0.0 0.0)
    )
)

(script static void scarab_gun_fire
    (begin
        (device_set_overlay_track "scarab" "combat:fire")
        (device_animate_overlay "scarab" 1.0 6.0 0.0 0.0)
    )
)

(script static void scarab_gun_close
    (begin
        (device_set_overlay_track "scarab" "combat:fire_close")
        (device_animate_overlay "scarab" 1.0 3.5 0.0 0.0)
    )
)

(script static void scarab_gun_open_down_instant
    (begin
        (device_set_overlay_track "scarab" "combat:fire_down_open")
        (device_animate_overlay "scarab" 1.0 0.05 0.0 0.0)
    )
)

(script static void scarab_gun_open_down
    (begin
        (device_set_overlay_track "scarab" "combat:fire_down_open")
        (device_animate_overlay "scarab" 1.0 3.5 0.0 0.0)
    )
)

(script static void scarab_gun_fire_down
    (begin
        (device_set_overlay_track "scarab" "combat:fire_down")
        (device_animate_overlay "scarab" 1.0 6.0 0.0 0.0)
    )
)

(script static void scarab_gun_close_down
    (begin
        (device_set_overlay_track "scarab" "combat:fire_down_close")
        (device_animate_overlay "scarab" 1.0 3.5 0.0 0.0)
    )
)

(script command_script void cs_e23_mars_pelican2_0_entry
    (begin
        (cs_vehicle_boost true)
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e23_mars_pelican2_flyby/p0)
        (cs_fly_by e23_mars_pelican2_flyby/p1)
        (object_destroy (ai_vehicle_get ai_current_actor))
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e23_mars_pelican2_1_entry
    (begin
        (cs_vehicle_boost true)
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e23_mars_pelican2_flyby/p2)
        (cs_fly_by e23_mars_pelican2_flyby/p3)
        (object_destroy (ai_vehicle_get ai_current_actor))
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e23_mars_pelican2_gunners0
    (begin
        (sleep 60)
        (if (not (volume_test_objects "tv_scarab" (players))) 
            (cs_shoot_point true e22_scarab_target/leg1))
        (sleep 60)
        (cs_shoot_point false e22_scarab_target/leg1)
        (sleep 1)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e23_mars_pelican2_gunners1
    (begin
        (sleep 120)
        (if (not (volume_test_objects "tv_scarab" (players))) 
            (cs_shoot_point true e22_scarab_target/leg0))
        (sleep 60)
        (cs_shoot_point false e22_scarab_target/leg0)
        (sleep 1)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e23_mars_pelican2_2_entry
    (begin
        (cs_vehicle_boost true)
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e23_mars_pelican2_flyby/p4)
        (cs_vehicle_boost false)
        (cs_face true e23_mars_pelican2_flyby/f0)
        (cs_fly_to e23_mars_pelican2_flyby/p5)
        (if g_e23_scarab_after_turn 
            (begin
                (cs_run_command_script "e23_mars_pelican2/gunner0" cs_e23_mars_pelican2_gunners0)
                (cs_run_command_script "e23_mars_pelican2/gunner1" cs_e23_mars_pelican2_gunners1)
            )
        )
        (cs_fly_by e23_mars_pelican2_flyby/p6 16.0)
        (set g_e23_mars_pelican2_2_active false)
        (cs_face false e23_mars_pelican2_flyby/f0)
        (cs_face true e23_mars_pelican2_flyby/p7)
        (cs_fly_by e23_mars_pelican2_flyby/p6 2.0)
        (cs_face false e23_mars_pelican2_flyby/p7)
        (cs_fly_by e23_mars_pelican2_flyby/p7)
        (cs_vehicle_boost true)
        (cs_fly_by e23_mars_pelican2_flyby/p8)
        (cs_fly_by e23_mars_pelican2_flyby/p1)
        (object_destroy (ai_vehicle_get ai_current_actor))
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e23_mars_inf1_shoot
    (begin
        (sleep_until g_e23_scarab_climbed_down 15)
        (sleep (random_range 10 30))
        (cs_enable_moving true)
        (sleep_until 
            (begin
                (cs_shoot true (list_get (ai_actors "e23_cov_inf0") (random_range 0 (list_count (ai_actors "e23_cov_inf0")))))
                (sleep (random_range 45 75))
                g_e23_scarab_before_bridge0
            ) 
        15)
        (ai_vehicle_exit ai_current_actor)
    )
)

(script command_script void cs_e23_mars_inf0_shoot
    (begin
        (sleep_until g_e23_scarab_under_bridge0 15)
        (sleep (random_range 100 120))
        (sleep_until 
            (begin
                (cs_shoot true (list_get (ai_actors "e23_cov_inf0") (random_range 0 (list_count (ai_actors "e23_cov_inf0")))))
                (sleep (random_range 45 75))
                g_e23_scarab_before_bridge1
            ) 
        15)
    )
)

(script command_script void cs_e23_cov_inf1_pilot_exit
    (begin
        (objects_detach "scarab" (ai_get_object ai_current_actor))
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "scarab_d_r:any:any:exit" true)
        (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
        (unit_stop_custom_animation (ai_get_unit ai_current_actor))
        (object_cannot_die (ai_get_object ai_current_actor) false)
    )
)

(script command_script void cs_e23_cov_inf1_pilot0
    (begin
        (object_cannot_die (ai_get_object ai_current_actor) true)
        (cs_queue_command_script ai_current_actor cs_e23_cov_inf1_pilot_exit)
        (cs_abort_on_damage true)
        (custom_animation_loop (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "scarab_d_r:any:any:idle:var0" false)
        (objects_attach "scarab" "scarab_d_l" (ai_get_object ai_current_actor) "")
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 7.0) 10)
        (objects_detach "scarab" (ai_get_object ai_current_actor))
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 3.0) 10)
    )
)

(script command_script void cs_e23_cov_inf1_pilot1
    (begin
        (object_cannot_die (ai_get_object ai_current_actor) true)
        (cs_queue_command_script ai_current_actor cs_e23_cov_inf1_pilot_exit)
        (cs_abort_on_damage true)
        (custom_animation_loop (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "scarab_d_r:any:any:idle:var0" false)
        (objects_attach "scarab" "scarab_d_r" (ai_get_object ai_current_actor) "")
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 7.0) 10)
        (objects_detach "scarab" (ai_get_object ai_current_actor))
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 3.0) 10)
    )
)

(script command_script void cs_e23_scarab_upper_gun
    (begin
        (cs_shoot true (ai_vehicle_get "e23_mars_pelican0_1/pelican0"))
        (sleep 120)
    )
)

(script command_script void cs_best_cs_ever
    (begin
        (cs_approach g_target 0.5 5.0 50.0)
        (sleep_until 
            (begin
                (cs_crouch true)
                (sleep 8)
                (cs_crouch false)
                (sleep 8)
                false
            ) 
        1)
    )
)

(script static boolean e23_scarab_before_bridge0
    (begin
        (= g_e23_scarab_before_bridge0 true)
    )
)

(script static boolean e23_scarab_before_bridge1
    (begin
        (= g_e23_scarab_before_bridge1 true)
    )
)

(script static boolean e23_scarab_before_bridge2
    (begin
        (= g_e23_scarab_before_bridge2 true)
    )
)

(script static boolean e23_scarab_after_bridge2
    (begin
        (= g_e23_scarab_after_bridge2 true)
    )
)

(script static boolean e23_scarab_after_turn
    (begin
        (= g_e23_scarab_after_turn true)
    )
)

(script dormant void scarab_upper_gunner_main
    (begin
        (ai_place "scarab_gunners/upper_gunner")
        (sleep 5)
        (cs_run_command_script "scarab_gunners/upper_gunner" cs_e23_scarab_upper_gun)
    )
)

(script dormant void e23_scarab
    (begin
        (wake scarab_no_save)
        (pvs_clear "scarab")
        (ai_erase "scarab_gunners/main_gunner")
        (device_set_position_track "scarab" "finale_climb_off_buildings" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 (/ 401.0 30.0) 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
        (set g_e23_scarab_climbed_down true)
        (sleep_until g_e23_started 1)
        (scarab_walk_front_var0)
        (set g_e23_scarab_before_bridge0 true)
        (scarab_walk_front_to_walk_low)
        (scarab_walk_low_var0)
        (scarab_walk_low_var0)
        (set g_e23_scarab_under_bridge0 true)
        (if (difficulty_legendary) 
            (begin
                (scarab_walk_low_to_walk_front)
                (scarab_walk_front_var0)
            ) (begin
                (scarab_walk_low_var0)
                (scarab_walk_low_var0)
            )
        )
        (set g_e23_scarab_before_bridge1 true)
        (if (difficulty_legendary) 
            (scarab_walk_front_to_walk_low) (scarab_walk_low_var0))
        (scarab_walk_low_var0)
        (scarab_walk_low_var0)
        (set g_e23_scarab_under_bridge1 true)
        (if (difficulty_legendary) 
            (scarab_walk_low_to_walk_front) (scarab_walk_low_var0))
        (if (difficulty_legendary) 
            (scarab_walk_front_var0) (scarab_walk_low_var0))
        (set g_e23_scarab_before_bridge2 true)
        (if (difficulty_legendary) 
            (scarab_walk_front_to_walk_low) (begin
                (scarab_walk_low_var0)
                (scarab_walk_low_var0)
            )
        )
        (scarab_walk_low_var0)
        (scarab_walk_low_var0)
        (set g_e23_scarab_under_bridge2 true)
        (scarab_walk_low_to_walk_front)
        (set g_e23_scarab_after_bridge2 true)
        (scarab_walk_front_to_idle)
        (sleep_until (volume_test_objects "tv_e23_scarab_corner_continue" (players)) 1)
        (game_save_no_timeout)
        (scarab_idle_turn_22_left)
        (scarab_idle_turn_45_left)
        (set g_e23_scarab_after_turn true)
        (scarab_idle_turn_22_left)
        (scarab_idle_to_walk_front)
        (scarab_walk_front_var0)
        (scarab_walk_front_turn_15_left)
        (if (difficulty_legendary) 
            (begin
                (scarab_walk_front_var0)
                (scarab_walk_front_turn_15_right)
            ) (begin
                (scarab_walk_front_turn_15_right)
                (scarab_walk_front_var0)
            )
        )
        (print "cortana: it can't go any further this way. we have it trapped!")
        (ai_play_line_on_object none "2030")
        (scarab_walk_front_to_idle)
        (set g_e23_scarab_arrived_at_end true)
        (scarab_gun_open)
        (scarab_idle_var0)
        (sleep_until 
            (begin
                (begin_random
                    (if g_e23_scarab_active 
                        (begin
                            (if g_e23_scarab_active 
                                (scarab_idle_to_twist_5_right))
                            (if g_e23_scarab_active 
                                (if (= (random_range 0 2) 0) 
                                    (scarab_twist_5_right))
                            )
                            (if g_e23_scarab_active 
                                (scarab_twist_5_right_to_idle))
                        )
                    )
                    (if g_e23_scarab_active 
                        (begin
                            (if g_e23_scarab_active 
                                (scarab_idle_to_twist_5_left))
                            (if g_e23_scarab_active 
                                (if (= (random_range 0 2) 0) 
                                    (scarab_twist_5_left))
                            )
                            (if g_e23_scarab_active 
                                (scarab_twist_5_left_to_idle))
                        )
                    )
                )
                (not g_e23_scarab_active)
            ) 
        1)
    )
)

(script dormant void e23_ultra_dialogue
    (begin
        (sleep_until (>= (ai_combat_status "e23_cov_inf1_0") ai_combat_status_clear_los))
        (sleep_until (<= (ai_combat_status "e23_cov_inf1_0") ai_combat_status_active))
        (print "cortana: careful chief, that elite was an ultra! and those pilots are no pushovers either!!")
        (ai_play_line_on_object none "2050")
    )
)

(script dormant void e23_ultra_dialogue_kill
    (begin
        (sleep_until (<= (ai_living_count "e23_cov_inf1_0/ultra0") 0) 15)
        (sleep_forever e23_ultra_dialogue)
    )
)

(script dormant void e23_dialogue_boarding
    (begin
        (sleep 30)
        (print "cortana: chief, you're going to have to board the scarab!")
        (ai_play_line_on_object none "2020")
        (sleep 600)
        (print "cortana: we can't do anything more to that scarab from here")
        (ai_play_line_on_object none "2040")
        (sleep 75)
        (deactivate_nav_point_object default player "scarab" 8.5)
    )
)

(script dormant void e23_dialogue_boarding_kill
    (begin
        (sleep_until 
            (or
                g_mission_over
                (volume_test_objects "tv_scarab" (players))
            ) 
        15)
        (sleep_forever e23_dialogue_boarding)
        (error_overflow_suppression player "scarab")
    )
)

(script dormant void e23_best_cs_ever
    (begin
        (if (not (difficulty_legendary)) 
            (sleep_forever))
        (if (not (= (random_range 0 10) 0)) 
            (sleep_forever))
        (set g_target (player0))
        (sleep_until (<= (object_get_health g_target) 0.0) 10)
        (cs_run_command_script "e23_cov_inf1_0/ultra0" cs_best_cs_ever)
    )
)

(script dormant void e23_cov_inf1_main
    (begin
        (sleep_until g_e23_scarab_climbed_down 5)
        (sleep_until (volume_test_objects "tv_scarab_stairwell" (players)) 15)
        (ai_place "e23_cov_inf1_1")
        (ai_place "e23_cov_inf1_0" (pin (- 4.0 (ai_living_count "e23_cov_inf0")) 1.0 3.0))
        (wake e23_ultra_dialogue)
        (wake e23_ultra_dialogue_kill)
        (wake e23_best_cs_ever)
        (sleep_until 
            (and
                (not (cs_command_script_queued "e23_cov_inf1_1/pilot0" cs_e23_cov_inf1_pilot0))
                (not (cs_command_script_queued "e23_cov_inf1_1/pilot1" cs_e23_cov_inf1_pilot1))
            )
        )
        (set g_e23_scarab_active false)
        (sleep_until (<= (ai_living_count "e23_cov_inf1") 0))
        (set g_mission_over true)
    )
)

(script dormant void e23_cov_inf0_main
    (begin
        (sleep_until g_e23_scarab_climbed_down 5)
        (ai_place "e23_cov_inf0_0")
        (sleep_until 
            (or
                g_e23_scarab_under_bridge1
                (<= (ai_living_count "e23_cov_inf0") 2)
                (volume_test_objects "tv_scarab_interior" (players))
            ) 
        15)
        (ai_place "e23_cov_inf0_1" (pin (- 6.0 (ai_living_count "e23_cov_inf0")) 0.0 4.0))
        (sleep_until 
            (or
                g_e23_scarab_under_bridge2
                (<= (ai_living_count "e23_cov_inf0") 2)
                (volume_test_objects "tv_scarab_interior" (players))
            ) 
        15)
        (ai_place "e23_cov_inf0_2" (pin (- 6.0 (ai_living_count "e23_cov_inf0")) 0.0 3.0))
        (sleep_until 
            (or
                g_e23_scarab_arrived_at_end
                (<= (ai_living_count "e23_cov_inf0") 2)
                (volume_test_objects "tv_scarab_interior" (players))
            ) 
        15)
        (ai_place "e23_cov_inf0_3" (pin (- 6.0 (ai_living_count "e23_cov_inf0")) 0.0 2.0))
        (sleep_until 
            (or
                g_e23_scarab_arrived_at_end
                (volume_test_objects "tv_scarab" (players))
            ) 
        15)
        (ai_place "e23_cov_inf0_4" (pin (- 6.0 (ai_living_count "e23_cov_inf0")) 0.0 5.0))
        (game_save_no_timeout)
        (sleep_until (<= (ai_living_count "e23_cov_inf0") 2))
        (wake e23_dialogue_boarding)
        (sleep 10)
        (wake e23_dialogue_boarding_kill)
        (sleep_until (<= (ai_living_count "e23_cov_inf0") 0))
        (game_save_no_timeout)
    )
)

(script dormant void e23_mars_pelican2_main
    (begin
        (sleep_until (volume_test_objects "tv_e23_mars_pelican0_begin" (players)) 15)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (ai_place "e23_mars_pelican2/pelican0")
                        (sleep (random_range 60 90))
                        (sleep_until (< (ai_living_count "e23_mars_pelican2") 2))
                    )
                    (begin
                        (ai_place "e23_mars_pelican2/pelican1")
                        (sleep (random_range 60 90))
                        (sleep_until (< (ai_living_count "e23_mars_pelican2") 2))
                    )
                    (begin
                        (ai_place "e23_mars_pelican2/pelican0")
                        (sleep (random_range 60 90))
                        (sleep_until (< (ai_living_count "e23_mars_pelican2") 2))
                    )
                    (begin
                        (ai_place "e23_mars_pelican2/pelican1")
                        (sleep (random_range 60 90))
                        (sleep_until (< (ai_living_count "e23_mars_pelican2") 2))
                    )
                    (begin
                        (ai_place "e23_mars_pelican2/pelican2")
                        (ai_place "e23_mars_pelican2/gunner0")
                        (ai_place "e23_mars_pelican2/gunner1")
                        (sleep 1)
                        (vehicle_load_magic (ai_vehicle_get "e23_mars_pelican2/pelican2") pelican_g_pod (ai_get_object "e23_mars_pelican2/gunner0"))
                        (vehicle_load_magic (ai_vehicle_get "e23_mars_pelican2/pelican2") pelican_g_pod (ai_get_object "e23_mars_pelican2/gunner1"))
                        (set g_e23_mars_pelican2_2_active true)
                        (sleep_until (not g_e23_mars_pelican2_2_active))
                        (sleep_until (< (ai_living_count "e23_mars_pelican2") 2))
                    )
                )
                g_mission_over
            )
        )
    )
)

(script dormant void e23_mars_pelican1_main
    (begin
        (sleep_until (volume_test_objects "tv_e23_mars_pelican1_begin" (players)) 15)
        (ai_place "e23_mars_pelican1_0")
        (sleep 60)
        (ai_place "e23_mars_pelican1_1")
    )
)

(script dormant void e23_mars_pelican0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e23_mars_pelican0_begin" (players))
                g_e23_scarab_under_bridge1
            ) 
        15)
        (ai_place "e23_mars_pelican0")
        (ai_vehicle_enter_immediate "e23_mars_pelican0_0/gunner0" (ai_vehicle_get "e23_mars_pelican0_0/pelican0") pelican_g_pod)
        (ai_vehicle_enter_immediate "e23_mars_pelican0_0/gunner1" (ai_vehicle_get "e23_mars_pelican0_0/pelican0") pelican_g_pod)
        (ai_vehicle_enter_immediate "e23_mars_pelican0_1/gunner0" (ai_vehicle_get "e23_mars_pelican0_1/pelican0") pelican_g_pod)
        (ai_vehicle_enter_immediate "e23_mars_pelican0_1/gunner1" (ai_vehicle_get "e23_mars_pelican0_1/pelican0") pelican_g_pod)
    )
)

(script dormant void e23_mars_inf1_main
    (begin
        (ai_migrate "e22_mars_inf1" "e23_mars_inf1")
        (ai_place "e23_mars_inf1" (- 3.0 (ai_living_count "e23_mars_inf1")))
    )
)

(script dormant void e23_mars_inf0_main
    (begin
        (ai_place "e23_mars_inf0")
    )
)

(script dormant void e23_main
    (begin
        (sleep_until (volume_test_objects "tv_e23_main_begin" (players)) 15)
        (set g_e23_started true)
        (print "e23_main")
        (data_mine_insert "e23_scarab_boarding")
        (game_save_no_timeout)
        (if (difficulty_legendary) 
            (object_destroy "e23_gun"))
        (wake music_03b_04_start)
        (wake music_03b_04_start_alt)
        (kill_volume_enable "kill_e23_0")
        (kill_volume_enable "kill_e23_1")
        (kill_volume_enable "kill_e23_2")
        (wake e23_mars_inf1_main)
        (wake e23_mars_pelican2_main)
        (wake e23_cov_inf0_main)
        (wake e23_cov_inf1_main)
    )
)

(script static void test_scarab_boarding
    (begin
        (object_teleport (player0) "e23_test")
        (object_create "scarab")
        (pvs_clear "scarab")
        (object_teleport "scarab" "e23_scarab_start")
        (set g_e23_scarab_arrived true)
        (if (not g_e23_started) 
            (wake e23_main))
        (wake e23_scarab)
    )
)

(script command_script void cs_e22_mars1_go
    (begin
        (cs_enable_pathfinding_failsafe true)
        (ai_vehicle_exit ai_current_actor)
        (cs_go_to e22_mars_inf1/p0)
    )
)

(script command_script void cs_e22_mars1_lieutenant
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_looking false)
        (cs_look true e22_mars_inf1/scarab_entry)
        (sleep_until (volume_test_objects "tv_e22_scarab_entry_begin" (players)) 10)
        (cs_look_player true)
        (sleep_until 
            (and
                (> (device_get_position "e22_door3") 0.0)
                (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 3.5)
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
            ) 
        5)
        (sleep 30)
        (print "lt: when i asked for reinforcements...")
        (sleep (- (ai_play_line ai_current_actor "0770") 75.0))
        (cs_look true e22_scarab_target/target)
        (sleep 55)
        (cs_aim true e22_scarab_target/target)
        (sleep 27)
        (cs_crouch true)
        (sleep (ai_play_line ai_current_actor "8030"))
        (print "lf: we got trouble")
        (sleep_until (<= (ai_living_count "e22_mars_scorpions0") 0) 15)
        (sleep 60)
        (print "gnr: alright, this is the shit")
        (sleep (- (ai_play_line "e22_mars_inf1/marine0" "8060") 30.0))
        (cs_look_object true (ai_get_object "e22_mars_inf1/marine0"))
        (sleep 45)
        (print "lt: marine, did i give you permission to bitch?")
        (sleep (ai_play_line ai_current_actor "8010"))
        (cs_look true e22_scarab_target/target)
        (cs_movement_mode ai_movement_combat)
        (cs_aim true e22_scarab_target/target)
        (sleep_until g_e22_scarab_before_climb 5)
        (print "lt: i don't think it's stopping")
        (ai_play_line ai_current_actor "0790")
        (sleep_until g_e22_scarab_mid_climb 5)
        (cs_crouch false)
        (sleep 90)
        (ai_play_line ai_current_actor "8040")
        (print "lt: that thing is starting to piss me off")
        (sleep 100)
        (cs_aim false e22_scarab_target/target)
        (cs_face_player true)
        (ai_play_line ai_current_actor "0830")
        (print "lt: marines, time to kill us a scarab")
        (cs_look_player false)
        (sleep 30)
        (cs_enable_looking true)
        (cs_start_to e22_mars_inf1/p0)
        (sleep 20)
        (cs_run_command_script "e22_mars_inf1/marine0" cs_e22_mars1_go)
        (sleep 20)
        (cs_run_command_script "e22_mars_inf0/perez" cs_e22_mars1_go)
        (wake objective3_set)
    )
)

(script command_script void cs_e22_mars0_crouch
    (begin
        (cs_enable_dialogue true)
        (cs_movement_mode ai_movement_combat)
        (cs_crouch true)
        (cs_look_player true)
        (sleep_forever)
    )
)

(script command_script void cs_e22_mars0_stand
    (begin
        (cs_enable_dialogue true)
        (cs_movement_mode ai_movement_patrol)
        (cs_look_player true)
        (sleep_forever)
    )
)

(script command_script void cs_e22_mars0_perez
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_face_player true)
        (cs_go_to e22_mars_inf0_perez/p0)
        (cs_start_approach_player 3.0 20.0 35.0)
        (print "perez: hey chief!")
        (sleep_until (not (players_in_vehicle)) 10)
        (cs_approach_player 1.5 5.0 10.0)
        (cs_face_player true)
        (sleep (- (ai_play_line_at_player ai_current_actor "0710") 30.0))
        (cs_face_player false)
        (cs_enable_looking true)
        (cs_start_to e22_mars_inf0_perez/p1)
        (sleep 45)
        (cs_look_player true)
        (print "the lt. got hit")
        (sleep (ai_play_line ai_current_actor "0730"))
        (sleep 15)
        (print "who in charge")
        (sleep (- (ai_play_line_on_object none "0740") 30.0))
        (cs_look_player true)
        (sleep 45)
        (sleep_until (not (cs_moving)) 5)
        (cs_face_player true)
        (sleep (ai_play_line_at_player ai_current_actor "0750"))
        (cs_face_player false)
        (cs_look_player false)
        (cs_enable_looking true)
        (cs_start_to e22_mars_inf0_perez/p2)
        (print "c'mon, i'll show you")
        (ai_play_line ai_current_actor "0760")
        (sleep 20)
        (sleep_until (not (cs_moving)) 5)
        (cs_look_player true)
    )
)

(script command_script void cs_e22_mars_inf1_crouch
    (begin
        (cs_crouch true)
        (cs_face true e22_scarab_target/target)
        (cs_aim true e22_scarab_target/target)
        (sleep_until g_e22_scarab_advancing 5)
        (sleep 150)
        (cs_shoot_point true e22_scarab_target/target)
        (sleep_until g_e22_scarab_before_climb 5)
        (cs_shoot_point false e22_scarab_target/target)
        (ai_vehicle_exit ai_current_actor)
        (sleep_until g_e22_scarab_mid_climb 5)
        (sleep 20)
        (cs_crouch false)
        (sleep_until g_e22_scarab_past_climb 5)
        (sleep (random_range 20 40))
        (cs_go_to e22_mars_inf1/p0)
    )
)

(script command_script void cs_e22_mars_inf1_marine1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 3)
        (cs_start_to e22_mars_inf1/p1)
        (cs_look true e22_mars_scorpions0/scarab_target)
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 11.0) 5)
        (cs_face_player true)
        (ai_play_line_at_player ai_current_actor "0840")
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 4.0) 5)
        (cs_face_player false)
        (cs_go_to e22_mars_inf1/p0)
    )
)

(script command_script void cs_e22_mars_inf2_marine_end
    (begin
        (cs_face true e22_scarab_target/target)
        (cs_crouch true)
        (sleep_until g_e22_scarab_mid_climb 5)
        (cs_crouch false)
        (sleep_until g_e22_scarab_past_climb 5)
        (cs_force_combat_status 2)
        (sleep_forever)
    )
)

(script command_script void cs_e22_mars_inf2_marine0
    (begin
        (cs_force_combat_status 3)
        (cs_crouch true)
        (sleep_until g_e22_scarab_appeared 5)
        (sleep (random_range 30 45))
        (cs_shoot_point true e22_scarab_target/target)
        (sleep_until g_e22_scarab_advancing 5)
        (sleep (random_range 120 150))
        (cs_shoot_point false e22_scarab_target/target)
        (cs_crouch false)
        (cs_go_to e22_mars_inf2/p0)
        (cs_run_command_script ai_current_actor cs_e22_mars_inf2_marine_end)
    )
)

(script command_script void cs_e22_mars_inf2_marine1
    (begin
        (cs_force_combat_status 3)
        (sleep_until g_e22_scarab_appeared 5)
        (sleep (random_range 30 45))
        (cs_shoot_point true e22_scarab_target/target)
        (sleep_until g_e22_scarab_advancing 5)
        (sleep (random_range 120 150))
        (cs_shoot_point false e22_scarab_target/target)
        (ai_vehicle_exit ai_current_actor)
        (cs_crouch false)
        (cs_go_to e22_mars_inf2/p1)
        (cs_run_command_script ai_current_actor cs_e22_mars_inf2_marine_end)
    )
)

(script command_script void cs_e22_mars_inf2_marine2
    (begin
        (cs_force_combat_status 3)
        (cs_crouch true)
        (sleep_until g_e22_scarab_appeared 5)
        (sleep (random_range 30 45))
        (cs_shoot_point true e22_scarab_target/target)
        (sleep_until g_e22_scarab_advancing 5)
        (sleep (random_range 180 210))
        (cs_shoot_point false e22_scarab_target/target)
        (cs_crouch false)
        (cs_go_to e22_mars_inf2/p2)
        (cs_run_command_script ai_current_actor cs_e22_mars_inf2_marine_end)
    )
)

(script command_script void cs_e22_mars_inf2_marine3
    (begin
        (cs_force_combat_status 3)
        (sleep_until g_e22_scarab_appeared 5)
        (sleep (random_range 30 45))
        (cs_shoot_point true e22_scarab_target/target)
        (sleep_until g_e22_scarab_advancing 5)
        (sleep (random_range 180 210))
        (cs_shoot_point false e22_scarab_target/target)
        (ai_vehicle_exit ai_current_actor)
        (cs_crouch false)
        (cs_go_to e22_mars_inf2/p3)
        (cs_run_command_script ai_current_actor cs_e22_mars_inf2_marine_end)
    )
)

(script command_script void cs_e22_mars_inf2_marine4
    (begin
        (cs_force_combat_status 3)
        (cs_crouch true)
        (sleep_until g_e22_scarab_appeared 5)
        (sleep (random_range 30 45))
        (cs_shoot_point true e22_scarab_target/target)
        (sleep_until g_e22_scarab_advancing 5)
        (sleep (random_range 240 270))
        (cs_shoot_point false e22_scarab_target/target)
        (cs_crouch false)
        (cs_go_to e22_mars_inf2/p4)
        (cs_run_command_script ai_current_actor cs_e22_mars_inf2_marine_end)
    )
)

(script command_script void cs_e22_mars_scorpion0
    (begin
        (cs_force_combat_status 3)
        (cs_aim true e22_scarab_target/target)
        (sleep_until g_e22_scarab_visible 5)
        (cs_shoot_point true e22_scarab_target/target)
        (sleep_until g_e22_scorpion_asplode 5)
        (unit_kill (ai_vehicle_get ai_current_actor))
    )
)

(script command_script void cs_e22_scarab_main_gun
    (begin
        (cs_shoot true (ai_vehicle_get "e22_mars_scorpions0/scorpion0"))
        (sleep 120)
        (set g_e22_scorpion_asplode true)
        (sleep 45)
    )
)

(script dormant void e22_scarab_climbing_events
    (begin
        (sleep 45)
        (set g_e22_scarab_started_climb true)
        (print "g_e22_scarab_started_climb ")
        (sleep 100)
        (set g_e22_scarab_mid_climb true)
        (print "g_e22_scarab_mid_climb ")
        (print "todo: boom boom dust shakes")
        (sleep 90)
        (set g_e22_scarab_past_climb true)
        (print "g_e22_scarab_past_climb ")
    )
)

(script dormant void e22_scarab_advancing_events
    (begin
        (set g_e22_scarab_advancing true)
        (print "g_e22_scarab_advancing ")
        (sleep 259)
        (object_damage_damage_section "e22_bridge0_2" "main" 1.0)
        (object_damage_damage_section "e22_bridge0_3" "main" 1.0)
        (object_damage_damage_section "e22_bridge0_4" "main" 1.0)
        (object_damage_damage_section "e22_bridge0_5" "main" 1.0)
        (sleep 2)
        (object_damage_damage_section "e22_bridge0_0" "main" 1.0)
        (object_damage_damage_section "e22_bridge0_1" "main" 1.0)
        (sleep 118)
        (object_damage_damage_section "e22_bridge1_2" "main" 1.0)
        (sleep 1)
        (object_damage_damage_section "e22_bridge1_0" "main" 1.0)
        (object_damage_damage_section "e22_bridge1_1" "main" 1.0)
        (object_damage_damage_section "e22_bridge1_3" "main" 1.0)
        (object_damage_damage_section "e22_bridge1_4" "main" 1.0)
        (sleep 1)
        (object_damage_damage_section "e22_bridge1_5" "main" 1.0)
        (object_damage_damage_section "e22_bridge1_6" "main" 1.0)
        (sleep 1)
        (object_damage_damage_section "e22_bridge1_7" "main" 1.0)
        (object_damage_damage_section "e22_bridge1_8" "main" 1.0)
        (object_damage_damage_section "e22_bridge1_9" "main" 1.0)
        (sleep 19)
        (object_damage_damage_section "e22_bridge2_0" "main" 1.0)
        (sleep 1)
        (object_damage_damage_section "e22_bridge2_3" "main" 1.0)
        (object_damage_damage_section "e22_bridge2_5" "main" 1.0)
        (sleep 1)
        (object_damage_damage_section "e22_bridge2_1" "main" 1.0)
        (object_damage_damage_section "e22_bridge2_2" "main" 1.0)
        (object_damage_damage_section "e22_bridge2_4" "main" 1.0)
        (sleep 30)
        (set g_e22_scarab_before_climb true)
        (print "g_e22_scarab_before_climb ")
    )
)

(script dormant void e22_scarab_appearance_events
    (begin
        (sleep 60)
        (set g_e22_scarab_visible true)
        (sleep 180)
        (set g_e22_scarab_appeared true)
        (print "g_e22_scarab_appeared ")
    )
)

(script dormant void e22_scarab_intro_gun
    (begin
        (object_create "e22_scarab_gun")
        (weapon_hold_trigger "e22_scarab_gun" 0 true)
        (sleep 45)
        (weapon_hold_trigger "e22_scarab_gun" 0 false)
        (sleep 60)
        (object_destroy "e22_scarab_gun")
    )
)

(script dormant void e22_scarab
    (begin
        (sleep_until (volume_test_objects "tv_e22_begin_scarab_sequence" (players)) 10)
        (sleep_until (volume_test_objects "tv_e22_scarab_entry_begin" (players)) 10)
        (wake e22_scarab_intro_gun)
        (wake chapter_title2)
        (sleep 50)
        (ai_place "scarab_gunners/main_gunner")
        (object_create_anew "scarab")
        (object_teleport "scarab" "e22_scarab_start")
        (pvs_clear "scarab")
        (wake e22_scarab_appearance_events)
        (scarab_gun_open_down_instant)
        (device_set_position_track "scarab" "finale_enter" 0.0)
        (device_animate_position "scarab" 1.0 (/ 266.0 30.0) 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
        (cs_stack_command_script "scarab_gunners/main_gunner" cs_e22_scarab_main_gun)
        (scarab_gun_fire_down)
        (scarab_idle_firing)
        (wake e22_scarab_advancing_events)
        (scarab_idle_to_walk_front_fast)
        (scarab_walk_front_var0_fast)
        (scarab_gun_close_down)
        (scarab_walk_front_var0_fast)
        (scarab_walk_front_var0_fast)
        (scarab_walk_front_var0_fast)
        (scarab_walk_front_var0_fast)
        (wake e22_scarab_climbing_events)
        (device_set_position_track "scarab" "finale_climb_on_buildings" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 (/ 446.0 30.0) 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
        (set g_e23_scarab_arrived true)
        (begin_random
            (if (not g_e23_started) 
                (begin
                    (scarab_idle_to_twist_5_right)
                    (scarab_twist_5_right_to_idle)
                )
            )
            (if (not g_e23_started) 
                (begin
                    (scarab_idle_to_twist_5_left)
                    (scarab_twist_5_left_to_idle)
                )
            )
        )
        (wake e23_scarab)
    )
)

(script dormant void e22_nasty_player_synch
    (begin
        (sleep_until (volume_test_objects "tv_e22_begin_scarab_sequence" (players)) 5)
        (volume_teleport_players_not_inside "tv_e22_no_teleport" "e22_nasty_player_synch")
        (sleep_until 
            (if (> (list_count (volume_return_objects_by_type "tv_e22_street_cleanup" 2)) 0) 
                (begin
                    (object_destroy (list_get (volume_return_objects_by_type "tv_e22_street_cleanup" 2) 0))
                    (= 1.0 0.0)
                ) (= 1.0 1.0)) 
        1)
        (garbage_collect_unsafe)
        (set g_e22_done_street_cleanup true)
    )
)

(script dormant void e22_objective
    (begin
        (sleep_until (volume_test_objects "tv_e22_scarab_entry_begin" (players)) 5)
        (wake objective2_clear)
        (sleep_until g_e22_scarab_past_climb)
        (wake objective3_set)
    )
)

(script dormant void e22_dialogue
    (begin
        (sleep_until (volume_test_objects "tv_e22_away_from_building" (players)) 5 30_seconds)
        (ai_play_line_on_object none "2000")
        (sleep 75)
        (deactivate_nav_point_flag default player "e22_navpoint" 0.0)
        (sleep_until (volume_test_objects "tv_e22_near_building" (players)) 5 450)
        (if (not (volume_test_objects "tv_e22_near_building" (players))) 
            (ai_play_line_on_object none "2010"))
    )
)

(script dormant void e22_dialogue_kill
    (begin
        (sleep_until 
            (or
                g_e23_started
                (volume_test_objects "tv_e22_main_begin" (players))
            ) 
        10)
        (sleep_forever e22_dialogue)
        (sleep_until 
            (or
                g_e23_started
                (volume_test_objects "tv_e22_doorway" (players))
            ) 
        10)
        (cls player "e22_navpoint")
    )
)

(script dormant void e22_mars_inf3_main
    (begin
        (sleep_until (volume_test_objects "tv_e22_mars_inf3_begin" (players)) 10)
    )
)

(script dormant void e22_mars_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e22_begin_scarab_sequence" (players)) 10)
        (ai_place "e22_mars_inf2")
        (ai_erase "e21_mars_pelican1")
        (cs_run_command_script "e22_mars_inf2/marine0" cs_e22_mars_inf2_marine0)
        (cs_run_command_script "e22_mars_inf2/marine1" cs_e22_mars_inf2_marine1)
        (cs_run_command_script "e22_mars_inf2/marine2" cs_e22_mars_inf2_marine2)
        (cs_run_command_script "e22_mars_inf2/marine3" cs_e22_mars_inf2_marine3)
        (cs_run_command_script "e22_mars_inf2/marine4" cs_e22_mars_inf2_marine4)
    )
)

(script dormant void e22_mars_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e22_begin_scarab_sequence" (players)) 10)
        (ai_place "e22_mars_inf1/lieutenant")
        (ai_place "e22_mars_inf1/marine0")
        (object_set_permutation (ai_get_object "e22_mars_inf1/lieutenant") "comm_pack" "on")
        (sleep_until g_e22_scarab_past_climb 5)
        (device_operates_automatically_set "e22_door1" true)
        (device_operates_automatically_set "e22_door2" true)
        (device_closes_automatically_set "e22_door1" false)
        (device_closes_automatically_set "e22_door2" false)
        (device_set_position "e22_door1" 1.0)
        (device_set_position "e22_door2" 1.0)
        (ai_place "e22_mars_inf1/marine1")
        (if (<= (ai_living_count "e22_mars_inf1/lieutenant") 0) 
            (begin
                (cs_run_command_script "e22_mars_inf1/marine0" cs_e22_mars1_go)
                (cs_run_command_script "e22_mars_inf0/perez" cs_e22_mars1_go)
            )
        )
    )
)

(script dormant void e22_mars_inf0_main
    (begin
        (device_set_position "e22_door0" 1.0)
        (device_operates_automatically_set "e22_door0" true)
        (ai_place "e22_mars_inf0/perez")
        (ai_place "e22_mars_inf0/guard0")
        (ai_place "e22_mars_inf0/guard2")
        (sleep_until (volume_test_objects "tv_e22_main_begin" (players)) 15)
        (ai_place "e22_mars_inf0/guard1")
        (ai_place "e22_mars_inf0/medic0")
        (ai_migrate "e21_mars_warthog0" "e22_mars_inf0")
        (ai_vehicle_exit "e22_mars_inf0")
        (sleep_until 
            (or
                (volume_test_objects "tv_e22_stairwell" (players))
                (volume_test_objects "tv_e22_stairwell" (ai_get_object "e22_mars_inf0/perez"))
            ) 
        15)
        (ai_set_orders "e22_mars_inf0" "e22_mars_inf0_advance1")
        (sleep_until (volume_test_objects "tv_e22_mars_inf3_begin" (players)) 10)
        (sleep_until (not (volume_test_objects "tv_e22_mars_inf0_visible" (players))))
        (ai_erase "e22_mars_inf0/guard0")
        (ai_erase "e22_mars_inf0/guard1")
        (ai_erase "e22_mars_inf0/guard2")
        (ai_erase "e22_mars_inf0/medic0")
    )
)

(script dormant void e22_mars_scorpions0_main
    (begin
        (sleep_until g_e22_done_street_cleanup 10)
        (ai_place "e22_mars_scorpions0")
        (cs_run_command_script "e22_mars_scorpions0/scorpion0" cs_e22_mars_scorpion0)
    )
)

(script dormant void e22_main
    (begin
        (set g_e22_started true)
        (print "e22_main")
        (data_mine_insert "e22_scarab_intro")
        (game_save_no_timeout)
        (wake e23_main)
        (wake music_03b_03_stop)
        (wake e22_nasty_player_synch)
        (wake e22_mars_inf0_main)
        (wake e22_mars_inf1_main)
        (wake e22_mars_inf2_main)
        (wake e22_mars_inf3_main)
        (wake e22_mars_scorpions0_main)
        (wake e22_scarab)
        (wake e22_objective)
        (wake e22_dialogue)
        (wake e22_dialogue_kill)
        (sleep_until g_e23_started)
        (sleep_forever e22_nasty_player_synch)
        (sleep_forever e22_mars_inf0_main)
        (sleep_forever e22_mars_inf1_main)
        (sleep_forever e22_mars_inf2_main)
        (sleep_forever e22_mars_inf3_main)
        (sleep_forever e22_mars_scorpions0_main)
        (sleep_forever e22_dialogue)
    )
)

(script static void test_scarab_intro
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e22_test")
        (object_destroy "scarab")
        (if (not g_e22_started) 
            (wake e22_main))
    )
)

(script command_script void cs_e21_cov_phantom0_bombard
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_definite)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_shoot_point true e21_cov_bombard/p5)
                        (sleep 120)
                    )
                    (begin
                        (cs_shoot_point true e21_cov_bombard/p6)
                        (sleep 120)
                    )
                    (begin
                        (cs_shoot_point true e21_cov_bombard/p7)
                        (sleep 120)
                    )
                    (begin
                        (cs_shoot_point true e21_cov_bombard/p8)
                        (sleep 120)
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_e21_cov_wraiths0_bombard
    (begin
        (cs_abort_on_damage true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_shoot_point true e21_cov_bombard/p0)
                        (sleep 60)
                    )
                    (begin
                        (cs_shoot_point true e21_cov_bombard/p1)
                        (sleep 60)
                    )
                    (begin
                        (cs_shoot_point true e21_cov_bombard/p2)
                        (sleep 60)
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_e21_cov_abort_bombard
    (begin
        (sleep 1)
    )
)

(script command_script void cs_e21_cov_phantom1_entry
    (begin
        (cs_fly_by e21_cov_phantom1_entry/p0)
        (cs_fly_by e21_cov_phantom1_entry/p1)
        (cs_fly_to e21_cov_phantom1_entry/p2)
        (sleep 15)
        (cs_fly_to e21_cov_phantom1_entry/p3 0.5)
        (sleep 30)
        (begin_random
            (begin
                (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc01)
                (sleep 15)
            )
            (begin
                (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc02)
                (sleep 15)
            )
        )
        (sleep 15)
    )
)

(script command_script void cs_e21_cov_phantom_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e21_cov_phantom_exit/p0)
        (cs_fly_to e21_cov_phantom_exit/p1)
        (cs_fly_to e21_cov_phantom_exit/p2 0.5)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e21_mars_pelican0_entry
    (begin
        (cs_fly_by e21_mars_pelican0_entry/p0)
        (cs_fly_to e21_mars_pelican0_entry/p1 0.5)
        (cs_face true e21_mars_pelican0_entry/p1_facing)
        (sleep_forever)
    )
)

(script command_script void cs_e21_mars_pelican0_exit
    (begin
        (cs_fly_by e21_mars_pelican0_entry/p2)
        (cs_fly_by e21_mars_pelican0_entry/p3)
        (cs_vehicle_boost true)
        (cs_fly_by e21_mars_pelican0_entry/p4)
        (cs_fly_by e21_mars_pelican0_entry/p5)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e21_mars_pelican1_entry
    (begin
        (cs_fly_by e21_mars_pelican1_entry/p0)
        (cs_fly_by e21_mars_pelican1_entry/p0_1)
        (cs_fly_by e21_mars_pelican1_entry/p0_2)
        (cs_fly_to e21_mars_pelican1_entry/p1 0.5)
        (cs_face true e21_mars_pelican1_entry/p1_facing)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get ai_current_actor) pelican_p)
        (sleep 180)
        (cs_face false e21_mars_pelican1_entry/p1_facing)
        (cs_fly_by e21_mars_pelican1_entry/p2)
        (cs_fly_by e21_mars_pelican1_entry/p3)
        (cs_vehicle_boost true)
        (cs_fly_by e21_mars_pelican1_entry/p4)
        (cs_fly_by e21_mars_pelican1_entry/p5)
        (object_destroy (ai_vehicle_get ai_current_actor))
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e21_mars_inf1_exit
    (begin
        (cs_go_to e21_mars_inf1/p0)
        (ai_erase ai_current_actor)
    )
)

(script static boolean e21_cov_phantom1_retreating
    (begin
        (= g_e21_cov_phantom1_retreating true)
    )
)

(script static boolean e21_cov_phantom0_retreating
    (begin
        (= g_e21_cov_phantom0_retreating true)
    )
)

(script dormant void e21_dialog
    (begin
        (sleep_until (volume_test_objects "tv_e21_boulevard1" (players)) 15)
        (sleep (ai_play_line_on_object none "0690"))
        (sleep 10)
        (sleep (ai_play_line_on_object none "0700"))
    )
)

(script dormant void e21_cov_creep0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e21_cov_creep0_main" (players))
                (volume_test_objects "tv_e21_cov_inf0_unsafe" (players))
            ) 
        15)
        (ai_place "e21_cov_creep0")
    )
)

(script dormant void e21_cov_phantom1_main
    (begin
        (sleep_until (<= (ai_living_count "e21_cov_wraiths0") 1) 30 two_minutes)
        (ai_place "e21_cov_phantom1")
        (ai_place "e21_cov_ghosts0_0")
        (sleep 2)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "e21_cov_phantom1/phantom0") phantom_sc01 (ai_vehicle_get_from_starting_location "e21_cov_ghosts0_0/ghost0"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "e21_cov_phantom1/phantom0") phantom_sc02 (ai_vehicle_get_from_starting_location "e21_cov_ghosts0_0/ghost1"))
        (cs_run_command_script "e21_cov_phantom1/phantom0" cs_e21_cov_phantom1_entry)
        (sleep_until 
            (or
                (<= (object_get_health (ai_vehicle_get "e21_cov_phantom1/phantom0")) 0.05)
                (>= (object_model_targets_destroyed (ai_vehicle_get "e21_cov_phantom1/phantom0") "target_front") 3)
            ) 
        10 one_minute)
        (set g_e21_cov_phantom1_retreating true)
        (cs_run_command_script "e21_cov_phantom1/phantom0" cs_e21_cov_phantom_exit)
    )
)

(script dormant void e21_cov_wraiths0_main
    (begin
        (ai_place "e21_cov_wraiths0_0")
        (ai_place "e21_cov_wraiths0_1")
        (sleep 2)
        (ai_vehicle_reserve (ai_vehicle_get "e21_cov_wraiths0_0/wraith0") true)
        (ai_vehicle_reserve (ai_vehicle_get "e21_cov_wraiths0_1/wraith0") true)
        (sleep_until 
            (or
                (<= (ai_living_count "e21_cov_wraiths0") 1)
                (volume_test_objects "tv_e21_cov_wraith0_2_unsafe" (players))
            ) 
        15)
        (if (not (volume_test_objects "tv_e21_cov_wraith0_2_unsafe" (players))) 
            (ai_place "e21_cov_wraiths0_2" (pin (- 2.0 (ai_living_count "e21_cov_wraiths0")) 0.0 1.0)))
        (sleep 2)
        (ai_vehicle_reserve (ai_vehicle_get "e21_cov_wraiths0_2/wraith0") true)
        (wake e21_cov_phantom1_main)
    )
)

(script dormant void e21_cov_inf0_main
    (begin
        (ai_place "e21_cov_inf0")
    )
)

(script dormant void e21_mars_pelican1_main
    (begin
        (sleep_until g_e21_cov_phantom1_retreating)
        (sleep 60)
        (ai_place "e21_mars_pelican1")
        (cs_run_command_script "e21_mars_pelican1/pelican0" cs_e21_mars_pelican1_entry)
    )
)

(script dormant void e21_mars_pelican0_main
    (begin
        (sleep_until g_e21_cov_phantom1_retreating)
        (ai_place "e21_mars_pelican0/pelican0")
        (cs_run_command_script "e21_mars_pelican0/pelican0" cs_e21_mars_pelican0_entry)
        (ai_place "e21_mars_pelican0/scorpion0")
        (vehicle_load_magic (ai_vehicle_get "e21_mars_pelican0/pelican0") pelican_lc (ai_vehicle_get_from_starting_location "e21_mars_pelican0/scorpion0"))
        (sleep_until (volume_test_objects "tv_e22_begin_scarab_sequence" (players)) 15)
        (cs_run_command_script "e21_mars_pelican0/pelican0" cs_e21_mars_pelican0_exit)
    )
)

(script dormant void e21_mars_warthog0_main
    (begin
        (ai_migrate "e20_mars_warthog0" "e21_mars_warthog0")
        (ai_migrate "e20_mars_warthog1" "e21_mars_warthog0")
    )
)

(script dormant void e21_mars_inf1_main
    (begin
        (sleep_until g_e21_cov_phantom0_retreating 15)
        (ai_place "e21_mars_inf1")
        (ai_disregard (ai_actors "e21_mars_inf1") true)
        (sleep_until g_e22_started)
        (cs_run_command_script "e21_mars_inf1" cs_e21_mars_inf1_exit)
    )
)

(script dormant void e21_mars_inf0_main
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (ai_living_count "e21_mars_inf0") 2)
                        (< (ai_spawn_count "e21_mars_inf0") 10)
                        (not (volume_test_objects "tv_e21_mars_inf0_unsafe" (players)))
                    ) 
                        (ai_place "e21_mars_inf0" 1))
                (or
                    (>= (ai_spawn_count "e21_mars_inf0") 10)
                    g_e22_started
                )
            )
        )
    )
)

(script dormant void e21_main_end_condition
    (begin
        (sleep_until g_e21_cov_phantom1_retreating)
        (sleep_until 
            (and
                (<= (ai_living_count "e21_cov_ghosts0") 0)
                (<= (ai_living_count "e21_cov_wraiths0") 0)
            ) 
        30 one_minute)
        (wake e22_main)
    )
)

(script dormant void e21_main
    (begin
        (sleep_until (volume_test_objects "tv_e21_main_begin" (players)) 15)
        (set g_e21_started true)
        (print "e21_main")
        (data_mine_insert "e21_hospital_seige")
        (game_save_no_timeout)
        (wake e21_main_end_condition)
        (wake e21_mars_warthog0_main)
        (wake e21_mars_pelican0_main)
        (wake e21_mars_pelican1_main)
        (wake e21_cov_inf0_main)
        (wake e21_cov_wraiths0_main)
        (wake e21_dialog)
        (sleep_until g_e22_started)
        (sleep_forever e21_mars_warthog0_main)
        (sleep_forever e21_mars_inf0_main)
        (sleep_forever e21_mars_inf1_main)
        (sleep_forever e21_cov_creep0_main)
        (sleep_forever e21_cov_wraiths0_main)
        (sleep_forever e21_cov_phantom1_main)
        (sleep_forever e21_dialog)
        (ai_disposable "e21_cov" true)
        (ai_disposable "e21_cov_phantom0" false)
        (ai_disposable "e21_cov_phantom1" false)
    )
)

(script static void test_hospital_seige
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e21_test")
        (object_destroy "scarab")
        (ai_place "e21_mars_warthog0")
        (if (not g_e21_started) 
            (wake e21_main))
    )
)

(script dormant void e20_cov_ghosts0_main
    (begin
        (ai_migrate "e19_cov_ghosts0" "e20_cov_ghosts0")
        (ai_place "e20_cov_ghosts0")
    )
)

(script dormant void e20_mars_warthog1_main
    (begin
        (ai_place "e20_mars_warthog1")
        (if (> (ai_living_count "e20_mars_warthog0") 1) 
            (ai_erase "e20_mars_warthog1/spare"))
    )
)

(script dormant void e20_mars_warthog0_main
    (begin
        (ai_migrate "e19_mars_warthog0" "e20_mars_warthog0")
        (wake e20_mars_warthog1_main)
    )
)

(script dormant void e20_main
    (begin
        (sleep_until (volume_test_objects "tv_e20_main_begin" (players)) 15)
        (set g_e20_started true)
        (print "e20_main")
        (data_mine_insert "e20_road_skirmish")
        (game_save_no_timeout)
        (wake music_03b_03_start)
        (wake e20_mars_warthog0_main)
        (wake e20_cov_ghosts0_main)
        (sleep_until g_e21_started)
        (ai_disposable "e20_cov" true)
    )
)

(script static void test_road_skirmishes
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e20_test")
        (object_destroy "scarab")
        (ai_place "e20_mars_warthog0")
        (wake e20_main)
        (wake e21_main)
    )
)

(script command_script void cs_e19_cov_ghosts0_1_entry1
    (begin
        (cs_vehicle_boost true)
        (cs_go_to e19_cov_ghosts0_1/p2)
        (cs_go_to e19_cov_ghosts0_1/p3)
        (sleep 60)
    )
)

(script command_script void cs_e19_cov_ghosts0_1_entry0
    (begin
        (cs_vehicle_boost true)
        (cs_go_to e19_cov_ghosts0_1/p0)
        (cs_go_to e19_cov_ghosts0_1/p1)
        (sleep 60)
    )
)

(script dormant void e19_cov_ghosts0_main
    (begin
        (ai_migrate "e18_cov_ghosts0" "e19_cov_ghosts0_0")
        (sleep_until (volume_test_objects "tv_e19_player_advanced" (players)) 15)
        (ai_place "e19_cov_ghosts0_0")
        (sleep_until 
            (begin
                (if (<= (ai_living_count "e19_cov_ghosts0") 0) 
                    (begin
                        (sleep 300)
                        (sleep_until (not (volume_test_objects "tv_e19_cov_ghosts0_1_unsafe" (players))))
                        (ai_place "e19_cov_ghosts0_1")
                    )
                )
                (>= (ai_spawn_count "e19_cov_ghosts0") 6)
            )
        )
    )
)

(script dormant void e19_cov_wraiths0_main
    (begin
        (ai_place "e19_cov_wraiths0_0")
    )
)

(script dormant void e19_cov_inf0_main
    (begin
        (ai_place "e19_cov_inf0")
    )
)

(script dormant void e19_mars_inf0_main
    (begin
        (ai_migrate "e18_mars_inf0" "e19_mars_warthog0")
        (ai_migrate "e18_mars_warthog0" "e19_mars_warthog0")
    )
)

(script dormant void e19_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e19_main_begin0" (players))
                (volume_test_objects "tv_e19_main_begin1" (players))
            ) 
        15)
        (set g_e19_started true)
        (print "e19_main")
        (data_mine_insert "e19_park")
        (game_save_no_timeout)
        (object_create_anew "e19_tree0")
        (object_create_anew "e19_tree1")
        (wake e19_mars_inf0_main)
        (wake e19_cov_inf0_main)
        (wake e19_cov_wraiths0_main)
        (wake e19_cov_ghosts0_main)
        (sleep_until g_e20_started)
        (sleep_forever e19_mars_inf0_main)
        (sleep_forever e19_cov_inf0_main)
        (sleep_forever e19_cov_wraiths0_main)
        (sleep_forever e19_cov_ghosts0_main)
        (ai_disposable "e19_cov" true)
    )
)

(script command_script void cs_e18_mars_warthog0_orbit
    (begin
        (sleep_until 
            (begin
                (cs_go_by e18_mars_warthog0_orbit/p4 e18_mars_warthog0_orbit/p5)
                (cs_go_by e18_mars_warthog0_orbit/p5 e18_mars_warthog0_orbit/p6)
                (cs_go_by e18_mars_warthog0_orbit/p6 e18_mars_warthog0_orbit/p0)
                (cs_go_by e18_mars_warthog0_orbit/p0 e18_mars_warthog0_orbit/p1)
                (cs_go_by e18_mars_warthog0_orbit/p1 e18_mars_warthog0_orbit/p2)
                (cs_go_by e18_mars_warthog0_orbit/p2 e18_mars_warthog0_orbit/p3)
                (cs_go_by e18_mars_warthog0_orbit/p3 e18_mars_warthog0_orbit/p4)
                (if 
                    (or
                        (vehicle_test_seat_list (ai_vehicle_get ai_current_actor) "warthog_g" (players))
                        (vehicle_test_seat_list (ai_vehicle_get ai_current_actor) "warthog_p" (players))
                    ) 
                        (set g_e18_orbit_count (+ g_e18_orbit_count 1.0)))
                (or
                    g_e19_started
                    (<= (ai_living_count "e18_cov_inf1_1") 0)
                    (>= g_e18_orbit_count 2)
                )
            ) 
        1)
    )
)

(script command_script void cs_e18_mars_warthog0_approach0
    (begin
        (cs_approach_player 5.0 50.0 50.0)
        (if (not g_e18_mars_warthog0_spoke) 
            (begin
                (ai_play_line_at_player ai_current_actor "8000")
                (print "could use a gunner, sir!")
                (set g_e18_mars_warthog0_spoke true)
            )
        )
        (sleep_until 
            (or
                (> (objects_distance_to_object (ai_actors "e18_mars_warthog0/warthog0") (player0)) 7.0)
                (unit_in_vehicle (unit (player0)))
            ) 
        15 600)
    )
)

(script command_script void cs_e18_mars_warthog0_approach1
    (begin
        (cs_approach_player 5.0 50.0 50.0)
        (if (not g_e18_mars_warthog0_spoke) 
            (begin
                (ai_play_line_at_player ai_current_actor "8000")
                (print "could use a gunner, sir!")
                (set g_e18_mars_warthog0_spoke true)
            )
        )
        (sleep_until 
            (or
                (> (objects_distance_to_object (ai_actors "e18_mars_warthog0/warthog0") (player1)) 7.0)
                (unit_in_vehicle (unit (player1)))
            ) 
        15 600)
    )
)

(script command_script void cs_e18_mars_warthog0_abort
    (begin
        (sleep 1)
    )
)

(script command_script void cs_e18_cov_inf0_sniper0
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_dangerous)
        (cs_aim_object true (ai_vehicle_get "e18_mars_warthog0/warthog0"))
        (sleep_forever)
    )
)

(script command_script void cs_e18_cov_inf2_1_entry0
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_go_to e18_cov_inf2_entry/p0)
        (cs_go_to e18_cov_inf2_entry/p1)
    )
)

(script dormant void e18_scarab_main
    (begin
        (object_create_anew "scarab")
        (object_teleport "scarab" "e18_scarab_start")
        (pvs_clear "scarab")
        (sleep_until 
            (begin
                (device_set_position_track "scarab" "park_idle" 0.0)
                (device_animate_position "scarab" 1.0 (/ 119.0 30.0) 0.0 0.0 true)
                (sleep_until (>= (device_get_position "scarab") 1.0) 1)
                (volume_test_objects "tv_e19_scarab_withdraws" (players))
            ) 
        1 30_seconds)
        (device_set_position_track "scarab" "park_exit" 0.0)
        (device_animate_position "scarab" 1.0 (/ 831.0 30.0) 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
        (scarab_walk_front_var0)
        (scarab_walk_front_turn_22_left)
        (scarab_walk_front_turn_22_left)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_to_idle)
        (scarab_idle_turn_45_right)
        (scarab_idle_turn_45_right)
        (scarab_idle_to_walk_front)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_to_idle)
        (object_destroy "scarab")
    )
)

(script dormant void e18_cov_ghosts0_main
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "e18_cov_inf1_1") 0)
                (volume_test_objects "tv_e19_main_begin1" (players))
            )
        )
        (if (not (volume_test_objects "tv_e19_main_begin1" (players))) 
            (ai_place "e18_cov_ghosts0"))
    )
)

(script static void e18_cov_inf2_spawn
    (begin
        (if (volume_test_objects "tv_e18_second_half" (players)) 
            (if (not (volume_test_objects "tv_e18_cov_inf2_1_unsafe1" (players))) 
                (ai_place "e18_cov_inf2_1/sniper1")) (if (not (volume_test_objects "tv_e18_cov_inf2_1_unsafe0" (players))) 
                (ai_place "e18_cov_inf2_1/sniper0"))
        )
    )
)

(script dormant void e18_cov_inf2_main
    (begin
        (ai_place "e18_cov_inf2_0")
        (if (difficulty_heroic) 
            (set g_e18_cov_inf2_spawn_max 8))
        (if (difficulty_legendary) 
            (set g_e18_cov_inf2_spawn_max 12))
        (sleep_until 
            (begin
                (if 
                    (or
                        (< (ai_living_count "e18_cov_inf2") 1)
                        (and
                            (< (ai_living_count "e18_cov_inf1") 5)
                            (< (ai_living_count "e18_cov_inf2") 2)
                        )
                        (and
                            (difficulty_legendary)
                            (< (ai_living_count "e18_cov_inf1") 4)
                            (< (ai_living_count "e18_cov_inf2") 2)
                        )
                    ) 
                        (begin
                            (e18_cov_inf2_spawn)
                            (sleep (random_range 60 300))
                        )
                )
                (>= (ai_spawn_count "e18_cov_inf2") g_e18_cov_inf2_spawn_max)
            )
        )
    )
)

(script dormant void e18_cov_inf1_main
    (begin
        (ai_place "e18_cov_inf1")
    )
)

(script dormant void e18_cov_inf0_main
    (begin
        (ai_place "e18_cov_inf0")
    )
)

(script dormant void e18_mars_warthog0_main
    (begin
        (ai_place "e18_mars_warthog0")
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (objects_distance_to_object (ai_actors "e18_mars_warthog0/warthog0") (player0)) 6.0)
                        (not (unit_in_vehicle (unit (player0))))
                    ) 
                        (begin
                            (cs_stack_command_script "e18_mars_warthog0/warthog0" cs_e18_mars_warthog0_approach0)
                            (sleep_until (not (unit_in_vehicle (ai_get_unit "e18_mars_warthog0/warthog0"))) 30 900)
                        ) (if 
                            (and
                                (game_can_use_flashlights)
                                (< (objects_distance_to_object (ai_actors "e18_mars_warthog0/warthog0") (player1)) 6.0)
                                (not (unit_in_vehicle (unit (player1))))
                            ) 
                                (begin
                                    (cs_stack_command_script "e18_mars_warthog0/warthog0" cs_e18_mars_warthog0_approach1)
                                    (sleep_until (not (unit_in_vehicle (ai_get_unit "e18_mars_warthog0/warthog0"))) 30 900)
                                )
                        )
                )
                (not (unit_in_vehicle (ai_get_unit "e18_mars_warthog0/warthog0")))
            ) 
        15)
        (print "omg?")
        (cs_run_command_script "e18_mars_warthog0/warthog0" cs_e18_mars_warthog0_abort)
    )
)

(script dormant void e18_mars_inf0_main
    (begin
        (ai_migrate "e17_mars_inf0" "e18_mars_inf0")
    )
)

(script dormant void e18_key
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
        (reset_dsp_image 9)
    )
)

(script dormant void e18_main
    (begin
        (sleep_until (volume_test_objects "tv_e18_main_begin" (players)) 15)
        (set g_e18_started true)
        (print "e18_main")
        (data_mine_insert "e18_park")
        (game_save_no_timeout)
        (kill_volume_enable "kill_e18_0")
        (object_destroy "e19_tree0")
        (object_destroy "e19_tree1")
        (wake chapter_title1)
        (wake objective1_clear)
        (wake objective2_set)
        (wake e19_main)
        (wake e20_main)
        (wake e21_main)
        (wake e18_mars_inf0_main)
        (wake e18_mars_warthog0_main)
        (wake e18_cov_inf0_main)
        (wake e18_cov_inf1_main)
        (wake e18_cov_inf2_main)
        (wake e18_cov_ghosts0_main)
        (wake e18_scarab_main)
        (wake e18_key)
        (sleep_until g_e19_started)
        (sleep_forever e18_mars_inf0_main)
        (sleep_forever e18_mars_warthog0_main)
        (sleep_forever e18_cov_inf0_main)
        (sleep_forever e18_cov_inf1_main)
        (sleep_forever e18_cov_inf2_main)
        (sleep_forever e18_cov_ghosts0_main)
        (ai_disposable "e18_cov" true)
    )
)

(script static void test_park
    (begin
        (structure_bsp_index 1)
        (object_teleport (player0) "e18_test")
        (ai_place "e18_mars_inf0")
        (if (not g_e18_started) 
            (wake e18_main))
    )
)

(script command_script void cs_e17_mars_inf0_drive
    (begin
        (cs_enable_pathfinding_failsafe true)
        (object_cannot_die (ai_get_object "e17_mars_inf0/warthog0") true)
        (object_cannot_die (ai_get_object "e17_mars_inf0/passenger0") true)
        (cs_go_to e17_mars_inf0_entry/p0)
        (sleep_until 
            (or
                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 13.0)
                (volume_test_objects "tv_e17_near_first_wall" (players))
            ) 
        15 one_minute)
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" (ai_vehicle_get ai_current_actor) 1.5)
        (sleep 5)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
        (sleep 5)
        (sound_looping_stop_immediately "sound\vehicles\warthog\warthog_horn\warthog_horn" (ai_vehicle_get ai_current_actor) 1.5)
        (sleep 15)
        (sound_looping_set_scale "sound\vehicles\warthog\warthog_horn\warthog_horn")
        (sleep_until 
            (or
                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 10.0)
                (<= (ai_strength ai_current_actor) 0.5)
                (<= (ai_strength ai_current_squad) 0.75)
                (volume_test_objects "tv_e17_first_wall_approach" (players))
            ) 
        15 600)
        (cs_go_by e17_mars_inf0_entry/p0_1 e17_mars_inf0_entry/p1)
        (cs_go_to e17_mars_inf0_entry/p1)
        (set g_e17_mars_warthog0_arrived true)
        (sleep 20)
        (object_cannot_die (ai_get_object "e17_mars_inf0/warthog0") false)
        (object_cannot_die (ai_get_object "e17_mars_inf0/passenger0") false)
        (ai_vehicle_exit "e17_mars_inf0/warthog0")
        (ai_vehicle_exit "e17_mars_inf0/passenger0")
    )
)

(script command_script void cs_e17_shotgun_scene
    (begin
        (print "marine: hey, sir!")
        (cs_approach_player 1.0 10.0 15.0)
        (sleep (ai_play_line_at_player ai_current_actor "0640"))
        (sleep_until 
            (or
                (not (unit_has_weapon (ai_get_unit ai_current_actor) "objects\weapons\rifle\shotgun\shotgun.weapon"))
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 5.0)
            ) 
        15 one_minute)
    )
)

(script command_script void cs_e17_cov_inf0_0_turret0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_deploy_turret e17_turrets/p0)
    )
)

(script command_script void cs_e17_cov_ghost0_entry0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_vehicle_boost true)
        (cs_go_to e17_cov_ghost0_entry/p0)
        (sleep 30)
        (cs_vehicle_boost false)
        (cs_go_to e17_cov_ghost0_entry/p0 0.1)
        (cs_face true e17_cov_ghost0_entry/p1)
        (sleep 60)
        (cs_vehicle_boost true)
        (cs_face false e17_cov_ghost0_entry/p1)
        (cs_go_to e17_cov_ghost0_entry/p1)
        (sleep 30)
        (cs_vehicle_boost false)
    )
)

(script command_script void cs_e17_mars_selective_migrate
    (begin
        (if 
            (and
                (unit_in_vehicle (ai_get_unit ai_current_actor))
                (volume_test_object "tv_e17_migration_area" (ai_get_object ai_current_actor))
                (<= (ai_living_count "e17_mars_inf0") 2)
            ) 
                (ai_migrate ai_current_actor "e17_mars_inf0"))
    )
)

(script command_script void cs_e17_cov_inf0_2_ambush
    (begin
        (cs_abort_on_combat_status ai_combat_status_dangerous)
        (cs_abort_on_damage true)
        (cs_crouch true)
        (cs_enable_looking true)
        (sleep_until 
            (or
                (volume_test_object "tv_e17_section3" (ai_get_object ai_current_actor))
                (< (ai_strength ai_current_squad) 1.0)
            ) 
        10)
    )
)

(script static boolean e17_door0_open
    (begin
        (>= (device_get_position "e17_door0") 0.5)
    )
)

(script static boolean e17_door1_open
    (begin
        (>= (device_get_position "e17_door1") 0.5)
    )
)

(script static boolean e17_mars_warthog0_can_wait
    (begin
        (or
            g_e17_mars_warthog0_arrived
            (volume_test_objects "tv_e17_on_first_wall" (players))
        )
    )
)

(script dormant void e17_doors_main
    (begin
        (device_set_position "e17_door1" 1.0)
        (sleep_until (volume_test_objects "tv_e17_section2" (players)) 15)
        (device_set_position "e17_door0" 1.0)
    )
)

(script dormant void e17_shotgun_scene
    (begin
        (sleep_until (ai_scene "e17_shotgun_scene" cs_e17_shotgun_scene "e17_mars_inf0/passenger0") 5 two_minutes)
    )
)

(script dormant void e17_dialog
    (begin
        (sleep_until (volume_test_objects "tv_e17_on_first_wall" (players)) 15)
        (sleep (ai_play_line_on_object none "0650"))
        (sleep 20)
        (sleep_until (volume_test_objects "tv_e17_section0" (players)) 15)
        (sleep_until (game_all_quiet) 30 one_minute)
        (ai_play_line_on_object none "0660")
    )
)

(script dormant void e17_cov_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e17_near_first_wall" (players)) 15)
        (ai_place "e17_cov_inf2_0")
        (sleep_until (volume_test_objects "tv_e17_cov_inf2_1_begin" (players)) 15)
        (ai_place "e17_cov_inf2_1")
        (sleep_until (volume_test_objects "tv_e17_section2" (players)) 15)
        (ai_place "e17_cov_inf2_2")
        (sleep_until (volume_test_objects "tv_e17_section3" (players)) 15)
        (ai_place "e17_cov_inf2_3" (pin (- 3.0 (ai_living_count "e17_cov_inf2")) 0.0 1.0))
    )
)

(script dormant void e17_cov_inf1_main
    (begin
        (ai_place "e17_cov_inf1_0")
    )
)

(script dormant void e17_cov_inf0_aux
    (begin
        (sleep_until (volume_test_objects "tv_e17_cov_inf0_2_init" (players)) 15)
        (ai_place "e17_cov_inf0_2")
        (sleep_until (volume_test_objects "tv_e17_near_second_wall" (players)) 15)
        (if (difficulty_legendary) 
            (ai_place "e17_cov_inf0_3"))
    )
)

(script dormant void e17_cov_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e17_near_first_wall" (players)) 15)
        (wake e17_cov_inf0_aux)
        (game_save_no_timeout)
        (wake music_03b_02_stop)
        (sleep_until (volume_test_objects "tv_e17_on_first_wall" (players)) 15)
        (ai_place "e17_cov_inf0_0")
        (sleep_until (volume_test_objects "tv_e17_section1" (players)) 15)
        (if (<= (ai_living_count "e17_cov_inf0") 4) 
            (ai_place "e17_cov_inf0_1"))
        (sleep_until (volume_test_objects "tv_e17_section2" (players)) 15)
        (game_save_no_timeout)
        (sleep 30)
        (if (<= (ai_living_count "e17_cov_inf0") 4) 
            (ai_place "e17_cov_inf0_1"))
        (sleep_until (volume_test_objects "tv_e17_section3" (players)) 15)
        (if (<= (ai_living_count "e17_cov_inf0") 4) 
            (ai_place "e17_cov_inf0_1"))
    )
)

(script dormant void e17_mars_inf0_main
    (begin
        (cs_run_command_script "e16_mars_inf0" cs_e17_mars_selective_migrate)
        (sleep 15)
        (ai_place "e17_mars_inf0")
        (ai_vehicle_reserve (ai_vehicle_get "e17_mars_inf0/warthog0") true)
        (ai_disposable "e16_mars" true)
        (wake e17_shotgun_scene)
    )
)

(script dormant void e17_main
    (begin
        (sleep_until (volume_test_objects "tv_e17_main_begin" (players)) 15)
        (set g_e17_started true)
        (print "e17_main")
        (data_mine_insert "e17_flooded_tunnel")
        (game_save_no_timeout)
        (wake objective0_clear)
        (wake objective1_set)
        (wake e17_mars_inf0_main)
        (wake e17_cov_inf0_main)
        (wake e17_cov_inf1_main)
        (wake e17_cov_inf2_main)
        (wake e17_doors_main)
        (sleep_until g_e18_started)
        (sleep_forever e17_mars_inf0_main)
        (sleep_forever e17_cov_inf0_main)
        (sleep_forever e17_cov_inf1_main)
        (sleep_forever e17_cov_inf2_main)
        (sleep_forever e17_doors_main)
        (sleep_forever e17_dialog)
        (ai_disposable "e17_cov" true)
    )
)

(script static void test_flooded_tunnel
    (begin
        (object_teleport (player0) "e17_test")
        (object_create "e17_test_tank")
        (if (not g_e17_started) 
            (wake e17_main))
        (if (not g_e18_started) 
            (wake e18_main))
    )
)

(script command_script void cs_e16_cov_ghosts0_advance1
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_go_to e16_cov_ghosts0_advance/start)
        (cs_go_to e16_cov_ghosts0_advance/p0)
        (cs_go_to e16_cov_ghosts0_advance/p5)
        (cs_go_to e16_cov_ghosts0_advance/p6)
        (cs_go_to e16_cov_ghosts0_advance/p7)
        (cs_go_to e16_cov_ghosts0_advance/p8)
    )
)

(script command_script void cs_e16_cov_ghosts0_advance0
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_go_to e16_cov_ghosts0_advance/start)
        (cs_go_to e16_cov_ghosts0_advance/p0)
        (cs_go_to e16_cov_ghosts0_advance/p1)
        (cs_go_to e16_cov_ghosts0_advance/p2)
        (cs_go_to e16_cov_ghosts0_advance/p3)
        (cs_go_to e16_cov_ghosts0_advance/p4)
    )
)

(script command_script void cs_e16_cov_banshee_boost0
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e16_cov_banshees0/p0)
        (cs_fly_by e16_cov_banshees0/p1)
        (sleep (random_range 30 60))
    )
)

(script command_script void cs_e16_cov_banshee_boost1
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e16_cov_banshees0/p2)
        (cs_fly_by e16_cov_banshees0/p3)
        (sleep (random_range 30 60))
    )
)

(script command_script void cs_e16_cov_inf0_last_stand
    (begin
        (cs_abort_on_damage true)
        (cs_enable_targeting true)
        (cs_face_player true)
        (cs_crouch true)
        (sleep_until 
            (or
                (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 12.0)
                (<= (ai_strength ai_current_actor) 0.9)
                (<= (ai_strength ai_current_squad) 0.5)
            )
        )
    )
)

(script command_script void cs_e16_cov_phantom0_entry
    (begin
        (cs_vehicle_boost true)
        (sleep 135)
    )
)

(script command_script void cs_e16_cov_phantom0_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face e16_cov_phantom0/p0 e16_cov_phantom0/p1 1.0)
        (cs_fly_by e16_cov_phantom0/p1)
        (cs_vehicle_boost true)
        (cs_fly_by e16_cov_phantom0/p2)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e16_cov_wraiths1_entry
    (begin
        (cs_enable_moving true)
        (cs_vehicle_boost true)
        (sleep 180)
    )
)

(script command_script void cs_e16_cov_ghosts1_entry
    (begin
        (cs_enable_moving true)
        (cs_vehicle_boost true)
        (sleep 150)
    )
)

(script dormant void e16_cov_phantom0_main
    (begin
        (sleep_until (<= (ai_living_count "e16_cov_wraiths1") 0))
        (ai_place "e16_cov_phantom0")
        (sleep_until 
            (or
                (<= (object_get_health (ai_vehicle_get "e16_cov_phantom0/phantom0")) 0.05)
                (>= (object_model_targets_destroyed (ai_vehicle_get "e16_cov_phantom0/phantom0") "target_front") 2)
            ) 
        30)
        (cs_run_command_script "e16_cov_phantom0/phantom0" cs_e16_cov_phantom0_exit)
    )
)

(script dormant void e16_cov_wraiths1_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e16_toll_plaza" (players))
                (<= (+ (ai_living_count "e16_cov_ghosts1") (ai_living_count "e16_cov_banshees0")) 1.0)
            )
        )
        (ai_place "e16_cov_wraiths1")
    )
)

(script dormant void e16_cov_ghosts1_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e16_toll_plaza" (players))
                (<= (ai_living_count "e16_cov_banshees0") 1)
            )
        )
        (ai_place "e16_cov_ghosts1" (- 3.0 (ai_living_count "e16_cov_ghosts0")))
    )
)

(script dormant void e16_cov_banshees0_main
    (begin
        (ai_migrate "e15_cov_banshees0" "e16_cov_banshees0_0")
        (sleep_until (volume_test_objects "tv_e16_bridge_end" (players)) 15)
        (ai_place "e16_cov_banshees0_1" (- 3.0 (ai_living_count "e16_cov_banshees0")))
        (sleep 150)
        (ai_play_line_on_object none "0620")
        (wake music_03b_01_start_alt)
        (game_save_no_timeout)
        (wake e16_cov_ghosts1_main)
        (sleep_until 
            (and
                (> (ai_spawn_count "e16_cov_ghosts1") 0)
                (<= (+ (ai_living_count "e16_cov_ghosts1") (ai_living_count "e16_cov_banshees0")) 1.0)
            )
        )
        (game_save_no_timeout)
        (ai_place "e16_cov_banshees0_1")
        (wake e16_cov_wraiths1_main)
    )
)

(script dormant void e16_cov_ghosts0_main
    (begin
        (ai_place "e16_cov_ghosts0_0")
        (sleep_until 
            (begin
                (if 
                    (or
                        (and
                            (<= (ai_living_count "e16_cov_wraiths0") 0)
                            (< (ai_living_count "e16_cov_ghosts0") 4)
                        )
                        (< (ai_living_count "e16_cov_ghosts0") 3)
                    ) 
                        (begin
                            (ai_place "e16_cov_ghosts0_1" 1)
                        )
                )
                (or
                    (volume_test_objects "tv_e16_bridge_end" (players))
                    (>= (ai_spawn_count "e16_cov_ghosts0") 10)
                )
            ) 
        90)
        (game_save_no_timeout)
    )
)

(script dormant void e16_cov_wraiths0_main
    (begin
        (sleep_until (> (ai_spawn_count "e16_cov_wraiths0") 0))
        (sleep_until 
            (or
                (volume_test_objects "tv_e16_toll_plaza" (players))
                (<= (ai_living_count "e16_cov_wraiths0_0") 0)
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void e16_cov_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e16_tunnel" (players)) 15)
        (game_save_no_timeout)
        (sleep 15)
        (wake music_03b_01_stop)
        (wake music_03b_02_start)
        (sleep_until (volume_test_objects "tv_e16_cov_inf0_1_begin" (players)) 15)
        (ai_place "e16_cov_inf0_1" (pin (- 9.0 (ai_living_count "e16_cov_inf0")) 0.0 2.0))
        (sleep_until (volume_test_objects "tv_e16_cov_inf0_2_begin" (players)) 15)
        (ai_place "e16_cov_inf0_2" (pin (- 9.0 (ai_living_count "e16_cov_inf0")) 0.0 1.0))
    )
)

(script dormant void e16_mars_inf0_main
    (begin
        (ai_migrate "e15_mars_inf0" "e16_mars_inf0")
    )
)

(script dormant void e16_main
    (begin
        (sleep_until (volume_test_objects "tv_e16_main_begin" (players)) 15)
        (set g_e16_started true)
        (print "e16_main")
        (data_mine_insert "e16_bridge_descent")
        (game_save_no_timeout)
        (wake e16_mars_inf0_main)
        (wake e16_cov_inf0_main)
        (wake e16_cov_wraiths0_main)
        (wake e16_cov_ghosts0_main)
        (wake e16_cov_banshees0_main)
        (sleep_until g_e17_started)
        (sleep_forever e16_mars_inf0_main)
        (sleep_forever e16_cov_inf0_main)
        (sleep_forever e16_cov_wraiths0_main)
        (sleep_forever e16_cov_ghosts0_main)
        (sleep_forever e16_cov_wraiths1_main)
        (sleep_forever e16_cov_ghosts1_main)
        (sleep_forever e16_cov_banshees0_main)
        (ai_disposable "e16_cov" true)
        (sleep_until (= (version) 1))
        (ai_erase "e16_mars")
        (ai_erase "e16_cov")
    )
)

(script static void test_bridge_descent
    (begin
        (object_teleport (player0) "e16_test")
        (ai_place "e16_mars_inf0")
        (if (not g_e16_started) 
            (wake e16_main))
        (if (not g_e17_started) 
            (wake e17_main))
        (if (not g_e18_started) 
            (wake e18_main))
    )
)

(script command_script void cs_e15_cov_phantom0_1_entry
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e15_cov_phantom0_1_entry/p0)
        (cs_vehicle_boost false)
        (cs_fly_to e15_cov_phantom0_1_entry/p2)
    )
)

(script command_script void cs_e15_cov_phantom0_1_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (if (> (ai_living_count "e16_cov_wraiths0_0/wraith1") 0) 
            (begin
                (cs_fly_by e15_cov_phantom0_1_entry/p4)
                (cs_face_player true)
                (cs_fly_to e15_cov_phantom0_1_entry/p5 1.0)
                (cs_fly_to e15_cov_phantom0_1_entry/p6 0.5)
                (if (not (volume_test_objects "tv_e15_phantom_drop_zone1" (players))) 
                    (begin
                        (sleep 75)
                        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
                        (sleep 20)
                    )
                )
                (cs_face_player false)
                (cs_fly_by e15_cov_phantom0_1_entry/p5 1.0)
                (cs_fly_to_and_face e15_cov_phantom0_1_entry/p7_1 e15_cov_phantom0_1_entry/p8)
            ) (cs_fly_by e15_cov_phantom0_1_entry/p7))
        (cs_fly_to e15_cov_phantom0_1_entry/p8)
        (cs_fly_to_and_face e15_cov_phantom0_1_entry/p8 e15_cov_phantom0_1_entry/p9 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by e15_cov_phantom0_1_entry/p9)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e15_cov_phantom0_0_entry
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e15_cov_phantom0_0_entry/p0)
        (cs_vehicle_boost false)
        (cs_fly_to e15_cov_phantom0_0_entry/p2)
    )
)

(script command_script void cs_e15_cov_phantom0_0_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (if (> (ai_living_count "e16_cov_wraiths0_0/wraith0") 0) 
            (begin
                (cs_fly_by e15_cov_phantom0_0_entry/p4)
                (cs_fly_to e15_cov_phantom0_0_entry/p5 1.0)
                (cs_face_player true)
                (cs_fly_to e15_cov_phantom0_0_entry/p6 0.5)
                (if (not (volume_test_objects "tv_e15_phantom_drop_zone0" (players))) 
                    (begin
                        (sleep 75)
                        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
                        (sleep 20)
                    )
                )
                (cs_face_player false)
                (cs_fly_by e15_cov_phantom0_0_entry/p5 1.0)
                (cs_fly_to_and_face e15_cov_phantom0_0_entry/p7 e15_cov_phantom0_0_entry/p8 1.0)
            )
        )
        (cs_fly_to_and_face e15_cov_phantom0_0_entry/p3 e15_cov_phantom0_0_entry/p8 0.5)
        (cs_fly_by e15_cov_phantom0_0_entry/p8)
        (cs_fly_to_and_face e15_cov_phantom0_0_entry/p8 e15_cov_phantom0_0_entry/p9 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by e15_cov_phantom0_0_entry/p9)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e15_cov_phantom1_entry
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e15_overflights/p0)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e15_cov_banshee0_0_entry
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e15_overflights/p1)
    )
)

(script command_script void cs_e15_cov_banshee0_1_entry
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by e15_overflights/p2)
    )
)

(script command_script void cs_e15_mars_inf0_unload
    (begin
        (if 
            (and
                (> (ai_living_count "e15_mars_inf0") 1)
                (not (unit_has_weapon (ai_get_unit ai_current_actor) "objects\weapons\support_high\rocket_launcher\rocket_launcher.weapon"))
            ) 
                (begin
                    (sleep 30)
                    (ai_vehicle_exit ai_current_actor)
                )
        )
    )
)

(script command_script void cs_e15_mars_inf0_init
    (begin
        (cs_enable_targeting true)
        (cs_crouch true)
        (sleep_until 
            (or
                g_e16_started
                (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 8.0)
            ) 
        15)
    )
)

(script command_script void cs_e15_mars_inf0_abort
    (begin
        (sleep 1)
    )
)

(script static void oes_e14_blind
    (begin
        (ai_set_blind ai_current_squad true)
        (ai_set_deaf ai_current_squad true)
    )
)

(script static void oes_e14_unblind
    (begin
        (ai_set_blind ai_current_squad false)
        (ai_set_deaf ai_current_squad false)
    )
)

(script dormant void e15_cov_banshees0_main
    (begin
        (ai_place "e15_cov_banshees0")
        (cs_run_command_script "e15_cov_banshees0/banshee0" cs_e15_cov_banshee0_0_entry)
        (cs_run_command_script "e15_cov_banshees0/banshee1" cs_e15_cov_banshee0_1_entry)
    )
)

(script dormant void e15_cov_wraith1_main
    (begin
        (sleep 2)
        (ai_place "e16_cov_wraiths0_0/wraith1")
        (ai_braindead "e16_cov_wraiths0_0/wraith1" true)
        (sleep 2)
        (vehicle_load_magic (ai_vehicle_get "e15_cov_phantom0_1/phantom0") phantom_lc (ai_vehicle_get "e16_cov_wraiths0_0/wraith1"))
        (sleep_until 
            (or
                (<= (ai_living_count "e16_cov_wraiths0_0/wraith1") 0)
                (not (unit_in_vehicle (ai_vehicle_get "e16_cov_wraiths0_0/wraith1")))
            )
        )
        (vehicle_unload (ai_vehicle_get "e15_cov_phantom0_1/phantom0") phantom_lc)
        (ai_braindead "e16_cov_wraiths0_0/wraith1" false)
    )
)

(script dormant void e15_cov_wraith0_main
    (begin
        (sleep 2)
        (ai_place "e16_cov_wraiths0_0/wraith0")
        (ai_braindead "e16_cov_wraiths0_0/wraith0" true)
        (sleep 2)
        (vehicle_load_magic (ai_vehicle_get "e15_cov_phantom0_0/phantom0") phantom_lc (ai_vehicle_get "e16_cov_wraiths0_0/wraith0"))
        (sleep_until 
            (or
                (<= (ai_living_count "e16_cov_wraiths0_0/wraith0") 0)
                (not (unit_in_vehicle (ai_vehicle_get "e16_cov_wraiths0_0/wraith0")))
            )
        )
        (vehicle_unload (ai_vehicle_get "e15_cov_phantom0_0/phantom0") phantom_lc)
        (ai_braindead "e16_cov_wraiths0_0/wraith0" false)
    )
)

(script dormant void e15_cov_phantom1_main
    (begin
        (ai_place "e15_cov_phantom1")
        (sleep_until (<= (objects_distance_to_object (players) (ai_vehicle_get "e15_cov_phantom1/phantom0")) 20.0) 5 30_seconds)
        (wake music_03b_01_start)
        (sleep 10)
        (game_saving)
    )
)

(script dormant void e15_cov_phantom0_main
    (begin
        (sleep_until (volume_test_objects "tv_e15_cov_phantoms0_begin" (players)) 15)
        (ai_place "e15_cov_phantom0_0")
        (sleep_until 
            (or
                g_e16_started
                (<= (object_get_health (ai_vehicle_get "e15_cov_phantom0_0/phantom0")) 0.05)
                (>= (object_model_targets_destroyed (ai_vehicle_get "e15_cov_phantom0_0/phantom0") "target_front") 2)
            ) 
        30 one_minute)
        (cs_queue_command_script "e15_cov_phantom0_0/phantom0" cs_e15_cov_phantom0_0_exit)
        (ai_place "e15_cov_phantom0_1")
        (wake e15_cov_wraith1_main)
        (sleep_until 
            (or
                g_e16_started
                (<= (object_get_health (ai_vehicle_get "e15_cov_phantom0_1/phantom0")) 0.05)
                (>= (object_model_targets_destroyed (ai_vehicle_get "e15_cov_phantom0_1/phantom0") "target_front") 2)
                (<= (ai_living_count "e16_cov_wraiths0_0/wraith1") 0)
            ) 
        30 one_minute)
        (cs_queue_command_script "e15_cov_phantom0_1/phantom0" cs_e15_cov_phantom0_1_exit)
    )
)

(script dormant void e15_cov_inf2_main
    (begin
        (ai_place "e15_cov_inf2_0")
        (sleep_until (volume_test_objects "tv_e15_cov_inf1_spring" (players)) 15)
        (ai_place "e15_cov_inf2_1" (- 10.0 (ai_living_count "e15_cov")))
    )
)

(script dormant void e15_cov_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e15_cov_inf1_spring" (players)) 15)
        (ai_place "e15_cov_inf1")
        (sleep 5)
        (object_set_velocity (ai_get_object "e15_cov_inf1/bugger0") 2.0 0.0 5.0)
        (object_set_velocity (ai_get_object "e15_cov_inf1/bugger1") 2.0 0.0 5.0)
        (object_set_velocity (ai_get_object "e15_cov_inf1/bugger2") 3.0 0.0 6.0)
        (object_set_velocity (ai_get_object "e15_cov_inf1/bugger3") 2.0 0.0 5.0)
        (object_set_velocity (ai_get_object "e15_cov_inf1/bugger4") 3.0 0.0 6.0)
        (object_set_velocity (ai_get_object "e15_cov_inf1/bugger5") 2.0 0.0 5.0)
    )
)

(script dormant void e15_cov_inf0_main
    (begin
        (ai_place "e15_cov_inf0")
    )
)

(script dormant void e15_mars_inf0_main
    (begin
        (ai_migrate "e14_mars_inf0" "e15_mars_inf0")
        (ai_place "e15_mars_inf0" (pin (- 3.0 (ai_living_count "e15_mars_inf0")) 1.0 2.0))
    )
)

(script dormant void e15_main
    (begin
        (sleep_until (volume_test_objects "tv_e15_main_begin" (players)) 15)
        (set g_e15_started true)
        (print "e15_main")
        (data_mine_insert "e15_bridge_summit")
        (game_save_no_timeout)
        (wake e15_mars_inf0_main)
        (wake e15_cov_phantom0_main)
        (wake e15_cov_phantom1_main)
        (wake e15_cov_banshees0_main)
        (sleep_until g_e17_started)
        (sleep_forever e15_mars_inf0_main)
        (sleep_forever e15_cov_inf0_main)
        (sleep_forever e15_cov_inf1_main)
        (sleep_forever e15_cov_inf2_main)
        (sleep_forever e15_cov_phantom0_main)
        (sleep_forever e15_cov_banshees0_main)
        (ai_disposable "e15_cov" true)
        (ai_disposable "e15_cov_phantom0" false)
    )
)

(script static void test_bridge_summit
    (begin
        (object_teleport (player0) "e15_test")
        (ai_place "e15_mars_inf0")
        (if (not g_e15_started) 
            (wake e15_main))
        (if (not g_e16_started) 
            (wake e16_main))
        (if (not g_e17_started) 
            (wake e17_main))
        (if (not g_e18_started) 
            (wake e18_main))
    )
)

(script command_script void cs_e14_cov_wraiths0_bombard
    (begin
        (cs_enable_moving true)
        (sleep_until 
            (begin
                (if (unit_in_vehicle (unit (player1))) 
                    (cs_shoot true (player1)))
                (if (unit_in_vehicle (unit (player0))) 
                    (cs_shoot true (player0)))
                (sleep_until (volume_test_objects "tv_e14_blockade4" (players)) 15 150)
                (cs_shoot false (player0))
                (cs_shoot false (player1))
                (sleep_until (volume_test_objects "tv_e14_blockade4" (players)) 15 300)
                (volume_test_objects "tv_e14_blockade4" (players))
            )
        )
    )
)

(script command_script void cs_e14_mars_pelican0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.25)
        (sleep_until 
            (or
                (volume_test_objects "tv_e14_mars_inf0_advance" (players))
                (player_in_vehicle)
            ) 
        15)
        (cs_vehicle_speed 1.0)
        (cs_fly_by e14_mars_pelican0/p8)
        (cs_fly_to_and_face e14_mars_pelican0/p6 e14_mars_pelican0/p7)
        (cs_vehicle_boost true)
        (cs_fly_by e14_mars_pelican0/p6)
        (cs_fly_by e14_mars_pelican0/p7)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e14_cov_ghosts0_advance0
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_go_to e14_cov_ghosts0_advance/p0)
        (cs_go_to e14_cov_ghosts0_advance/p1)
        (cs_go_to e14_cov_ghosts0_advance/p2)
        (cs_go_to e14_cov_ghosts0_advance/p3)
        (cs_go_to e14_cov_ghosts0_advance/p4)
        (cs_go_to e14_cov_ghosts0_advance/p5)
        (cs_go_to e14_cov_ghosts0_advance/p6)
    )
)

(script command_script void cs_e14_cov_ghosts0_advance1
    (begin
        (cs_abort_on_damage true)
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_go_to e14_cov_ghosts0_advance/p3)
        (cs_go_to e14_cov_ghosts0_advance/p4)
        (cs_go_to e14_cov_ghosts0_advance/p5)
    )
)

(script dormant void e14_cov_snipers0_main
    (begin
        (sleep 1)
    )
)

(script dormant void e14_cov_wraiths0_main
    (begin
        (ai_place "e14_cov_wraiths0/wraith0")
        (sleep_until (volume_test_objects "tv_e14_blockade0" (players)) 15)
        (cs_run_command_script "e14_cov_wraiths0" cs_e14_cov_wraiths0_bombard)
    )
)

(script dormant void e14_cov_ghosts1_main
    (begin
        (sleep 1)
    )
)

(script dormant void e14_cov_ghosts0_main
    (begin
        (ai_place "e14_cov_ghosts0_0")
        (sleep_until (volume_test_objects "tv_e14_blockade0" (players)) 15)
        (ai_place "e14_cov_ghosts0_1" (pin (- 4.0 (ai_living_count "e14_cov_ghosts0")) 0.0 2.0))
        (sleep_until (volume_test_objects "tv_e14_blockade1" (players)) 15)
        (ai_place "e14_cov_ghosts0_1" (pin (- 4.0 (ai_living_count "e14_cov_ghosts0")) 0.0 2.0))
        (sleep_until (volume_test_objects "tv_e14_blockade2" (players)) 15)
        (ai_place "e14_cov_ghosts0_1" (pin (- 4.0 (ai_living_count "e14_cov_ghosts0")) 0.0 2.0))
        (sleep_until (volume_test_objects "tv_e14_blockade3" (players)) 15)
        (ai_place "e14_cov_ghosts0_1" (pin (- 4.0 (ai_living_count "e14_cov_ghosts0")) 0.0 2.0))
        (sleep_until (volume_test_objects "tv_e14_blockade4" (players)) 15)
        (ai_place "e14_cov_ghosts0_1" (pin (- 4.0 (ai_living_count "e14_cov_ghosts0")) 0.0 2.0))
        (sleep_until (volume_test_objects "tv_e14_blockade5" (players)) 15)
        (ai_place "e14_cov_ghosts0_1" (pin (- 4.0 (ai_living_count "e14_cov_ghosts0")) 0.0 2.0))
    )
)

(script dormant void e14_mars_pelican0_main
    (begin
        (ai_place "e14_mars_pelican0")
        (object_cannot_take_damage (ai_actors "e14_mars_pelican0"))
        (ai_vehicle_enter_immediate "e14_mars_pelican0/gunner0" (ai_vehicle_get "e14_mars_pelican0/pelican0") pelican_g)
        (ai_vehicle_enter_immediate "e14_mars_pelican0/johnson0" (ai_vehicle_get "e14_mars_pelican0/pelican0") pelican_g_rear)
    )
)

(script dormant void e14_mars_inf0_main
    (begin
        (ai_place "e14_mars_inf0")
        (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "e14_mars_inf0/scorpion0") "scorpion_d" true)
        (if (game_can_use_flashlights) 
            (begin
                (ai_place "e14_mars_inf0/warthog0")
                (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "e14_mars_inf0/warthog0") "warthog_d" true)
            ) (begin
                (ai_place "e14_mars_inf0/warthog1")
                (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "e14_mars_inf0/warthog1") "warthog_d" true)
            )
        )
    )
)

(script dormant void e14_main
    (begin
        (set g_e14_started true)
        (print "e14_main")
        (data_mine_insert "e14_bridge_ascent")
        (game_save_no_timeout)
        (kill_volume_enable "kill_e14_0")
        (wake objective0_set)
        (wake e15_main)
        (wake e16_main)
        (wake e17_main)
        (wake e18_main)
        (wake e14_mars_inf0_main)
        (wake e14_mars_pelican0_main)
        (wake e14_cov_ghosts0_main)
        (wake e14_cov_ghosts1_main)
        (wake e14_cov_wraiths0_main)
        (wake e14_cov_snipers0_main)
        (sleep_until g_e15_started)
        (sleep_forever e14_mars_inf0_main)
        (sleep_forever e14_cov_ghosts0_main)
        (sleep_forever e14_cov_ghosts1_main)
        (sleep_forever e14_cov_wraiths0_main)
        (sleep_forever e14_cov_snipers0_main)
        (ai_disposable "e14_cov" true)
    )
)

(script dormant void mission_start
    (begin
        (wake flashlight_control)
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
        (wake e14_main)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white_bars)
        (wake chapter_title0)
        (sleep_until g_mission_over 8)
        (wake music_03b_04_stop)
        (sleep 60)
        (playtest_mission)
        (sleep 15)
        (cinematic_fade_to_white)
        (object_cannot_take_damage (players))
        (object_hide (player0) true)
        (object_hide (player1) true)
        (object_teleport (player0) "player0_end")
        (object_teleport (player1) "player1_end")
        (object_destroy "scarab")
        (ai_erase "e23_cov")
        (ai_erase "e23_mars")
        (cinematic_outro)
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

(script dormant void 03_intra1_01_predict
    (begin
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bridge\bridge" 7)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 2)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 19)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 20)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 29)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 22)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 23)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 25)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 4)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_barrier\toll_barrier" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 3)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 29 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 11 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 1 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 3 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 47 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 15 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 16 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_scarab_full\holo_scarab_full" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_road_signal\sign_road_signal" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_b\concrete_chunk_b" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 15)
        (predict_lightmap_bucket "objects\vehicles\scorpion\turrets\cannon\cannon" 12)
        (predict_lightmap_bucket "objects\vehicles\scorpion\turrets\cannon\cannon" 13)
        (sleep 8)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 1)
        (sleep 74)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 3 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 1 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 10 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 15 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 16 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 49 true)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 87)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 99)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 89)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 90)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 91)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 92)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 93)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 94)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 95)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 96)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 97)
        (predict_lightmap_bucket "objects\vehicles\scorpion\turrets\cannon\cannon" 12)
        (predict_lightmap_bucket "objects\vehicles\scorpion\turrets\cannon\cannon" 13)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_cone\road_cone" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\crush_barrel\crush_barrel\crush_barrel" 0)
        (sleep 31)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 2)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 19)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 20)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 29)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 22)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 23)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 25)
        (sleep 33)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 1)
        (sleep 17)
        (predict_lightmap_bucket "scenarios\objects\multi\zanzibar\dumpster\dumpster" 0)
        (sleep 83)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 11 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 39 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 14 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 6 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 4 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 1 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 2 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 5 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 11 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 45 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 48 true)
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
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_rear_gun\scarab_rear_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_mid_garb\bridge_light_mid_garb" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_brace_garb\bridge_light_brace_garb" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 0)
        (predict_lightmap_bucket "objects\gear\human\industrial\crate_tech\crate_tech" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis" 1)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\bridge_light\bridge_light" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\bridge_light\bridge_light" 1)
        (predict_lightmap_bucket "scenarios\objects\vehicles\h_semi_trailer\h_semi_trailer" 0)
        (predict_lightmap_bucket "scenarios\objects\human\urban\air\air" 0)
        (predict_lightmap_bucket "scenarios\objects\human\urban\air\air" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_lit_garb\bridge_light_lit_garb" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_street_arch\sign_street_arch" 0)
        (predict_lightmap_bucket "objects\gear\human\industrial\crate_tech_giant\crate_tech_giant" 0)
        (predict_lightmap_bucket "objects\gear\human\military\tire\tire" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis_tire\uberchassis_tire" 0)
        (predict_lightmap_bucket "objects\gear\human\military\pallet\pallet" 0)
        (predict_lightmap_bucket "objects\gear\human\military\crate_packing_giant\crate_packing_giant" 0)
        (predict_lightmap_bucket "objects\gear\human\military\crate_packing\crate_packing" 0)
        (predict_lightmap_bucket "objects\gear\human\military\drum_55gal\drum_55gal" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 38 false)
        (predict_lightmap_bucket "objects\cinematics\human\weapons\smg\smg" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 1)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 7 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 18 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 19 true)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 2)
        (predict_lightmap_bucket "scenarios\objects\vehicles\h_semi_trailer\h_semi_trailer" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 2)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 25 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 38 false)
        (sleep 5)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 1)
        (sleep 85)
        (predict_lightmap_bucket "objects\gear\human\industrial\crate_tech\crate_tech" 0)
        (sleep 49)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 3 false)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 87)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 99)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 89)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 90)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 91)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 92)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 93)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 94)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 95)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 96)
        (predict_lightmap_bucket "objects\vehicles\scorpion\scorpion" 97)
        (predict_lightmap_bucket "objects\vehicles\scorpion\turrets\cannon\cannon" 12)
        (predict_lightmap_bucket "objects\vehicles\scorpion\turrets\cannon\cannon" 13)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 1)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 6 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 4 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 5 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 45 true)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 14)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\bridge_light\bridge_light" 0)
        (sleep 6)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 39 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 2 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 1 true)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\bridge_light\bridge_light" 1)
        (sleep 5)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 11 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 1)
        (sleep 12)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 23 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 48 true)
        (sleep 3)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_mid_garb\bridge_light_mid_garb" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 0)
        (predict_lightmap_bucket "objects\gear\human\military\pallet\pallet" 0)
        (predict_lightmap_bucket "objects\gear\human\military\crate_packing_giant\crate_packing_giant" 0)
        (predict_lightmap_bucket "objects\gear\human\military\crate_packing\crate_packing" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\vehicles\h_semi_trailer\h_semi_trailer" 0)
        (predict_lightmap_bucket "objects\gear\human\military\tire\tire" 0)
        (predict_lightmap_bucket "objects\gear\human\military\drum_55gal\drum_55gal" 0)
        (predict_lightmap_bucket "objects\cinematics\human\weapons\smg\smg" 0)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_street_arch\sign_street_arch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_lit_garb\bridge_light_lit_garb" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\human\industrial\crate_tech_giant\crate_tech_giant" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_brace_garb\bridge_light_brace_garb" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\human\urban\air\air" 0)
        (predict_lightmap_bucket "scenarios\objects\human\urban\air\air" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 0)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\vehicles\h_semi_trailer\h_semi_trailer" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\multi\zanzibar\dumpster\dumpster" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 14 true)
        (sleep 4)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis" 1)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 4 false)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\human\industrial\crate_tech\crate_tech" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis_tire\uberchassis_tire" 0)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 34 false)
        (sleep 30)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_road_signal\sign_road_signal" 1)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 2)
        (sleep 58)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 19)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 20)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 29)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 22)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 23)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 25)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_h\concrete_chunk_h" 0)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_b\concrete_chunk_b" 0)
    )
)

(script dormant void 03_intra1_02a_predict
    (begin
        (sleep 6)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 10 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 49 true)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\crush_barrel\crush_barrel\crush_barrel" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_j\concrete_chunk_j" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_barrier\toll_barrier" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 2)
        (sleep 75)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 1)
        (sleep 32)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 11 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 3 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 23 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 39 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 14 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 6 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 4 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 1 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 2 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 5 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 11 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 45 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 48 true)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis" 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 1)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_mid_garb\bridge_light_mid_garb" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_brace_garb\bridge_light_brace_garb" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 0)
        (predict_lightmap_bucket "objects\gear\human\industrial\crate_tech\crate_tech" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\bridge_light\bridge_light" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\bridge_light\bridge_light" 1)
        (predict_lightmap_bucket "scenarios\objects\vehicles\h_semi_trailer\h_semi_trailer" 1)
        (predict_lightmap_bucket "scenarios\objects\human\urban\air\air" 0)
        (predict_lightmap_bucket "scenarios\objects\human\urban\air\air" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\garbage\bridge_light_lit_garb\bridge_light_lit_garb" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_street_arch\sign_street_arch" 0)
        (predict_lightmap_bucket "objects\gear\human\industrial\crate_tech_giant\crate_tech_giant" 0)
        (predict_lightmap_bucket "objects\gear\human\military\tire\tire" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 0)
        (predict_lightmap_bucket "scenarios\objects\vehicles\h_semi_trailer\h_semi_trailer" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\uberchassis\uberchassis_tire\uberchassis_tire" 0)
        (predict_lightmap_bucket "objects\gear\human\military\pallet\pallet" 0)
        (predict_lightmap_bucket "objects\gear\human\military\crate_packing_giant\crate_packing_giant" 0)
        (predict_lightmap_bucket "objects\gear\human\military\crate_packing\crate_packing" 0)
        (predict_lightmap_bucket "objects\gear\human\military\drum_55gal\drum_55gal" 0)
        (predict_lightmap_bucket "objects\cinematics\human\weapons\smg\smg" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 1)
        (sleep 26)
        (predict_lightmap_bucket "objects\characters\marine\marine" 55)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (sleep 60)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 10 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 49 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_road_signal\sign_road_signal" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_h\concrete_chunk_h" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_b\concrete_chunk_b" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 4)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_barrier\toll_barrier" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 3)
        (predict_lightmap_bucket "scenarios\objects\multi\zanzibar\dumpster\dumpster" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 2)
    )
)

(script dormant void 03_intra1_02b_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void 03_intra1_02c_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 3 false)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_cone\road_cone" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\crush_barrel\crush_barrel\crush_barrel" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_h\concrete_chunk_h" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_j\concrete_chunk_j" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_b\concrete_chunk_b" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 2)
        (sleep 157)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 10 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 49 true)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_h\concrete_chunk_h" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\concrete_chunks\concrete_chunk_b\concrete_chunk_b" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\toll_booth\toll_booth" 0)
        (predict_lightmap_bucket "scenarios\objects\multi\zanzibar\dumpster\dumpster" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\junction_box_lg\junction_box_lg" 2)
        (sleep 35)
        (predict_lightmap_bucket "objects\cinematics\human\cigar\cigar_good\cigar_good" 0)
    )
)

(script dormant void 03_intra1_03_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_3b 3 false)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 2)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 1)
        (sleep 11)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\streetobjects\streetobj_trashcan\streetobj_trashcan" 0)
    )
)

(script dormant void x03_01_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 29 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 33 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 66 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 76 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 68 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 97 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 156 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 157 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 154 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 160 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 155 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 153 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 164 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 130 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 161 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 0 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 158 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 132 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 165 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 131 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 103 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 113 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 159 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 133 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 134 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 166 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 101 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 111 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 135 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 136 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 167 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 112 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 119 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 114 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 118 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 152 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 17 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 77 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 9 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 10 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 11 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 18 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 21 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 36 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 12 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 13 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 19 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 81 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 20 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 80 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 5 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 33 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 96 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 97 true)
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
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_rear_gun\scarab_rear_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 0)
        (predict_lightmap_bucket "objects\powerups\rocket_launcher_ammo\rocket_launcher_ammo" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\road_objects\vent_wall_a\vent_wall_a" 0)
        (predict_lightmap_bucket "objects\gear\human\military\case_ap_turret\case_ap_turret" 0)
        (predict_lightmap_bucket "objects\gear\human\military\case\case" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 0)
        (predict_lightmap_bucket "objects\weapons\fixed\h_turret_mp\h_turret_mp" 0)
        (predict_lightmap_bucket "objects\powerups\shotgun_ammo\shotgun_ammo" 0)
        (predict_lightmap_bucket "objects\powerups\battle_rifle_ammo\battle_rifle_ammo" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\capital_ship\capital_ship" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\nm_control_box\nm_control_box" 0)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 95 true)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\newmombasa\newmombasa" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\newmombasa\newmombasa" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\newmombasa\newmombasa" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\newmombasa\newmombasa" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\newmombasa\newmombasa" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\newmombasa\newmombasa" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\newmombasa\newmombasa" 6)
        (sleep 63)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 95 true)
        (sleep 15)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 13 true)
        (sleep 26)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 95 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 27 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 97 true)
        (sleep 36)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 47 true)
        (sleep 35)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 157 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 103 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 160 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 130 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 102 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 164 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 132 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 16 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 36 true)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 1)
        (sleep 3)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 2)
        (sleep 109)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 154 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 47 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 153 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 51 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 158 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 34 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 35 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\capital_ship\capital_ship" 2)
        (sleep 140)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 161 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 157 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 165 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 131 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 103 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 113 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 159 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 160 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 133 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 164 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 130 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 102 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 166 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 101 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 134 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 111 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 132 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 136 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 135 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 167 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 112 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 114 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 118 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 152 false)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 17 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 16 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 9 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 10 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 11 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 18 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 21 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 36 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 19 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 20 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 81 true)
        (predict_bitmap scenarios\solo\03b_newmombasa\earthcity_4 33 true)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 1)
        (predict_lightmap_bucket "objects\gear\human\military\case\case" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\nm_control_box\nm_control_box" 0)
        (sleep 10)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
    )
)

(script dormant void x03_02_predict
    (begin
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 0)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 1)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (sleep 5)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 59 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 48 true)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 4)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 45 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 51 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 52 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 57 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 62 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 67 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 69 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 41 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 42 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 44 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 49 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 50 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 54 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 55 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 66 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 68 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 74 true)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 71)
        (predict_lightmap_bucket "objects\characters\marine\marine" 66)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 0)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 1)
        (sleep 50)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (sleep 11)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 10 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 31 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 35 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 32 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 33 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 34 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 76 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 77 true)
        (sleep 43)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 false)
        (sleep 104)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad\inamberclad" 0)
    )
)

(script dormant void x03_03_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 67 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 44 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 48 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 49 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 50 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\capital_ship\capital_ship" 2)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 24)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 55 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 68 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 69 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 56 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 74 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 57 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 62 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 42 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 54 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 41 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 66 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 52 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 75 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 39 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 37 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 45 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 70 true)
        (sleep 6)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 51 true)
        (sleep 28)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 38 true)
        (sleep 11)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 65 true)
        (sleep 67)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 56 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 10 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 65 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 31 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 35 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 53 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 61 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 73 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 76 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 77 true)
    )
)

(script dormant void x03_04_predict
    (begin
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 2)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 45 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 51 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 52 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 67 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 41 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 42 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 44 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 54 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 55 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 66 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 68 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 74 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 39 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 70 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 37 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 38 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 75 true)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 0)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 1)
        (sleep 29)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 34 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 33 true)
        (sleep 11)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (sleep 110)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 43 true)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (sleep 1)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad\inamberclad" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 10 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 31 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 33 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 34 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 35 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 47 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 53 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 61 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 true)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
    )
)

(script dormant void x03_05_predict
    (begin
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\capital_ship\capital_ship" 2)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad\inamberclad" 0)
        (sleep 22)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 85)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 68 true)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 90)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 37 true)
    )
)

(script dormant void x03_06_predict
    (begin
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 39 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 43 true)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (sleep 2)
        (sleep 2)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 41 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 42 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 54 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 55 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 66 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 74 true)
        (sleep 14)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (sleep 40)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 10 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 31 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 35 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 53 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 33 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 34 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 73 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 76 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 77 true)
        (sleep 28)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (sleep 9)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 65 true)
    )
)

(script dormant void x03_07_predict
    (begin
        (sleep 50)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 39 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 45 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 51 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 52 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 65 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 69 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 70 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 37 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 38 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 41 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 42 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 66 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 68 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 74 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 75 true)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 21)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 43 true)
        (sleep 10)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 10 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 54 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 55 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 61 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 72 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 73 true)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 39 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 38 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 56 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 75 true)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\cinematics\effects\slipspace_shockwave_start\slipspace_shockwave_start" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 10 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 9 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 7 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 1 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 11 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 5 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 3 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 16 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 12 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 14 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 17 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 13 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 15 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 24 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 18 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 20 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 25 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 19 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 21 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 26 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 22 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 23 false)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_vert_facade\sign_vert_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hog\sign_hog" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\signage\sign_hor_facade\sign_hor_facade" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\streetobjects\streetobj_big_generator\streetobj_big_generator" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\earthcity\streetobjects\streetobj_dumpster\streetobj_dumpster" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 0)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\bsp1\bsp1" 2)
    )
)

(script dormant void x03_08_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "objects\cinematics\effects\slipspace_shockwave_closeup\slipspace_shockwave_closeup" 0)
        (sleep 72)
        (predict_lightmap_bucket "objects\vehicles\civilian\panel_truck\panel_truck" 2)
        (sleep 5)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 1)
        (sleep 7)
        (predict_lightmap_bucket "objects\vehicles\civilian\bus\bus" 2)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\cinematics\effects\slipspace_shockwave\slipspace_shockwave" 0)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 65 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 51 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 43 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 75 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 74 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 70 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 69 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 68 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 67 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 66 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 64 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 62 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 57 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 56 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 55 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 54 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 52 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 50 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 49 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 48 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 45 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 44 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 42 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 41 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 40 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 39 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 38 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 37 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 72 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 61 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 60 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 58 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 53 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 47 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 36 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 77 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 73 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 63 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 35 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 34 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 33 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 31 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 29 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 28 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 27 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 59 true)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 0 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 2 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 4 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 6 false)
        (predict_bitmap scenarios\solo\03a_oldmombasa\earthcity_cine_intro_bsp 8 false)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\earthcity\cinematic_newmombasa\cinematic_newmombasa" 4)
    )
)

