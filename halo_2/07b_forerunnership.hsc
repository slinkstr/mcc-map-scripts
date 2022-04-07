; Decompiled with Blamite
; Source file: 07b_forerunnership.hsc
; Start time: 4/7/2022 7:18:43
; Decompilation finished in ~0.0025693s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean dialogue true)
(global short dialogue_pause 7)
(global short g_dialogue_counter 0)
(global short g_e12_talk 0)
(global boolean g_e12_go false)
(global boolean g_e12_started false)
(global boolean g_e12_final_battle_started false)
(global boolean g_e12_final_battle_ended false)
(global boolean g_e12_final_battle_mid false)
(global short dialogue_pause_long 60)
(global boolean g_e12_side false)
(global short g_e10_talk 0)
(global boolean g_e10_move_on false)
(global short g_e8_counter 0)
(global boolean g_e6_move_on false)
(global short g_e1_talk 0)
(global boolean g_e1_music false)
(global boolean g_e1_pelican2_entering false)
(global boolean g_e1_pelican1_entering false)
(global boolean g_e1_pelican1_unloaded false)
(global boolean g_e1_pro_inf3_spawned false)
(global boolean g_e1_git_check false)
(global boolean g_play_cinematics true)


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

(script static void 07_intra1_05_predict_stub
    (begin
        (wake 07_intra1_05_predict)
    )
)

(script static void 07_intra1_06_predict_stub
    (begin
        (wake 07_intra1_06_predict)
    )
)

(script static void 07_intra1_07_predict_stub
    (begin
        (wake 07_intra1_07_predict)
    )
)

(script static void 07_intra1_08_predict_stub
    (begin
        (wake 07_intra1_08_predict)
    )
)

(script static void 07_outro_01_predict_stub
    (begin
        (wake 07_outro_01_predict)
    )
)

(script static void 07_outro_02_predict_stub
    (begin
        (wake 07_outro_02_predict)
    )
)

(script static void 07_outro_03_predict_stub
    (begin
        (wake 07_outro_03_predict)
    )
)

(script static void cinematic_pelican_unload
    (begin
        (ai_place "cinematic_fld_inf0/form0")
        (sleep 8)
        (ai_place "cinematic_fld_inf0/form1")
        (sleep 4)
        (ai_place "cinematic_fld_inf0/form0")
        (sleep 10)
        (ai_place "cinematic_fld_inf0/form1")
    )
)

(script static void cinematic_pelican_runby
    (begin
        (ai_place "cinematic_fld_inf1/form0")
    )
)

(script dormant void c07_intra1_score_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\music\c07_intra1_05_mus" none 1.0)
        (print "c07_intra1 score 05")
    )
)

(script dormant void c07_intra1_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_05_fol" none 1.0)
        (print "c07_intra1 foley 05 start")
    )
)

(script dormant void c07_intra1_05_dof_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 127)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.0 0.0 0.0 0.75 0.75 0.0)
        (print "rack focus")
        (rasterizer_profile_include_all)
        (sleep 60)
        (cinematic_screen_effect_set_crossfade2 1.0 0.0 0.75 0.5 0.75 0.0 0.5)
        (print "rack focus")
        (rasterizer_profile_include_all)
        (sleep 68)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c07_intra1_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 23.0 74.0 0.258824 0.270588 0.368627)
        (cinematic_lighting_set_secondary_light -40.0 276.0 0.407843 0.345098 0.317647)
        (cinematic_lighting_set_ambient_light 0.0431373 0.0470588 0.0666667)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "mercy" true)
        (object_uses_cinematic_lighting "infection_01" true)
        (object_uses_cinematic_lighting "throne_mercy" true)
        (object_uses_cinematic_lighting "phantom_01" true)
        (object_uses_cinematic_lighting "phantom_02" true)
        (object_uses_cinematic_lighting "phantom_03" true)
    )
)

(script static void c07_intra1_05_setup
    (begin
        (wake c07_intra1_score_05)
        (wake c07_intra1_foley_05)
        (object_create_anew "chief")
        (object_create_anew "mercy")
        (object_create_anew "infection_01")
        (object_create_anew "throne_mercy")
        (object_create_anew "phantom_01")
        (object_create_anew "phantom_02")
        (object_create_anew "phantom_03")
        (ice_cream_flavor_stock "chief" "right_hand" "")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "mercy" true)
        (object_cinematic_lod "infection_01" true)
        (object_cinematic_lod "throne_mercy" true)
        (object_cinematic_lod "phantom_01" true)
        (object_cinematic_lod "phantom_02" true)
        (object_cinematic_lod "phantom_03" true)
        (wake c07_intra1_05_dof_01)
        (wake c07_intra1_cinematic_light_01)
        (object_destroy "ledge_1")
    )
)

(script static void c07_intra1_05_cleanup
    (begin
        (object_destroy_containing "phantom")
    )
)

(script static void c07_intra1_scene_05
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "forerunnership_intra1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (07_intra1_05_predict_stub)
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\music\c07_intra1_05_mus")
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_05_fol")
        (sleep prediction_offset)
        (c07_intra1_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_05" none "anchor_flag_intra1")
        (custom_animation_relative "chief" "objects\characters\masterchief\07_intra1\07_intra1" "chief_05" false "anchor_intra1")
        (custom_animation_relative "mercy" "objects\characters\prophet\07_intra1\07_intra1" "mercy_05" false "anchor_intra1")
        (custom_animation_relative "infection_01" "objects\characters\flood_infection\07_intra1\07_intra1" "infection01_05" false "anchor_intra1")
        (custom_animation_relative "throne_mercy" "objects\vehicles\gravity_throne\animations\07_intra1\07_intra1" "throne_mercy_05" false "anchor_intra1")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom1_05" false "anchor_intra1")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom2_05" false "anchor_intra1")
        (custom_animation_relative "phantom_03" "objects\vehicles\phantom\animations\07_intra1\07_intra1" "phantom3_05" false "anchor_intra1")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intra1_06_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_06_fol")
        (sleep (camera_set_pan))
        (c07_intra1_05_cleanup)
    )
)

(script dormant void c07_intra1_foley_06
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_06_fol" none 1.0)
        (print "c07_intra1 foley 06 start")
    )
)

(script dormant void c07_2080_mas
    (begin
        (sleep 45)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2080_mas" "chief" 1.0)
        (attract_mode_set_seconds "c07_2080_mas" 2.5)
    )
)

(script dormant void c07_2090_pom
    (begin
        (sleep 180)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2090_pom" "mercy" 1.0)
        (attract_mode_set_seconds "c07_2090_pom" 3.0)
    )
)

(script dormant void c07_2100_pom
    (begin
        (sleep 283)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2100_pom" "mercy" 1.0)
        (attract_mode_set_seconds "c07_2100_pom" 4.0)
    )
)

(script dormant void c07_2101_pom
    (begin
        (sleep 451)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2101_pom" "mercy" 1.0)
    )
)

(script dormant void c07_2110_cor
    (begin
        (sleep 566)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2110_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2110_cor" 2.0)
        (unit_set_emotional_state "cortana" "shocked" 0.25 0)
        (print "cortana - shocked .25 0")
    )
)

(script dormant void c07_2120_cor
    (begin
        (sleep 621)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2120_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2120_cor" 4.0)
    )
)

(script dormant void c07_intra1_06_dof_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 121)
        (print "rack focus")
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 0.4 0.5 0.5 0.0 0.0 0.0 0.0)
        (rasterizer_profile_include_all)
        (sleep 153)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c07_intra1_06_fov_01
    (begin
        (sleep 396)
        (print "fov change: 60 -> 70 over 0 ticks")
        (camera_pan 70.0 0)
        (sleep 53)
        (print "fov change: 70 -> 60 over 0 ticks")
        (camera_pan 60.0 0)
    )
)

(script dormant void infection_pop
    (begin
        (sleep 510)
        (print "infection pop")
        (effect_new_on_object_marker "effects\objects\characters\flood_infection\body_depleted" "infection_02" "")
        (sleep 1)
        (object_destroy "infection_02")
    )
)

(script static void c07_intra1_06_setup
    (begin
        (object_create_anew "cortana")
        (object_cinematic_lod "cortana" true)
        (object_create_anew "infection_02")
        (object_cinematic_lod "infection_02" true)
        (object_uses_cinematic_lighting "infection_02" true)
        (object_create_anew "cortana_base")
        (wake c07_intra1_foley_06)
        (wake c07_2080_mas)
        (wake c07_2090_pom)
        (wake c07_2100_pom)
        (wake c07_2101_pom)
        (wake c07_2110_cor)
        (wake c07_2120_cor)
        (wake infection_pop)
        (wake c07_intra1_06_dof_01)
        (wake c07_intra1_06_fov_01)
    )
)

(script static void c07_intra1_06_cleanup
    (begin
        (object_destroy_containing "infection")
        (object_destroy "cortana_base")
    )
)

(script static void c07_intra1_scene_06
    (begin
        (c07_intra1_06_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_06" none "anchor_flag_intra1")
        (custom_animation_relative "chief" "objects\characters\masterchief\07_intra1\07_intra1" "chief_06" false "anchor_intra1")
        (custom_animation_relative "mercy" "objects\characters\prophet\07_intra1\07_intra1" "mercy_06" false "anchor_intra1")
        (custom_animation_relative "infection_01" "objects\characters\flood_infection\07_intra1\07_intra1" "infection01_06" false "anchor_intra1")
        (custom_animation_relative "infection_02" "objects\characters\flood_infection\07_intra1\07_intra1" "infection02_06" false "anchor_intra1")
        (custom_animation_relative "throne_mercy" "objects\vehicles\gravity_throne\animations\07_intra1\07_intra1" "throne_mercy_06" false "anchor_intra1")
        (sleep 556)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_25" "cortana_base" "marker")
        (custom_animation_relative "cortana" "objects\characters\cortana\07_intra1\07_intra1" "cortana_06" false "anchor_intra1")
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intra1_07_predict_stub)
        (sleep (camera_set_pan))
        (c07_intra1_06_cleanup)
    )
)

(script dormant void c07_2130_cor
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2130_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2130_cor" 3.0)
    )
)

(script dormant void c07_2140_cor
    (begin
        (sleep 110)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2140_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2140_cor" 1.0)
    )
)

(script dormant void c07_2150_mas
    (begin
        (sleep 150)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2150_mas" "chief" 1.0)
        (attract_mode_set_seconds "c07_2150_mas" 5.0)
    )
)

(script dormant void c07_2160_cor
    (begin
        (sleep 297)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2160_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2160_cor" 6.0)
        (unit_set_emotional_state "cortana" "annoyed" 0.5 0)
        (print "cortana - annoyed .5 0")
    )
)

(script dormant void c07_2170_cor
    (begin
        (sleep 490)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2170_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2170_cor" 3.0)
    )
)

(script dormant void c07_2180_cor
    (begin
        (sleep 622)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2180_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2180_cor" 3.0)
    )
)

(script dormant void c07_2190_cor
    (begin
        (sleep 710)
        (unit_set_emotional_state "cortana" "disappointed" 0.5 60)
        (print "cortana - disappointed .5 60")
        (sleep 13)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_2190_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c07_2190_cor" 1.0)
    )
)

(script dormant void c07_intra1_07_fov_01
    (begin
        (sleep 414)
        (print "fov change: 60 -> 26 over 0 ticks")
        (camera_pan 26.0 0)
        (sleep 70)
        (print "fov change: 26 -> 60 over 0 ticks")
        (camera_pan 60.0 0)
    )
)

(script static void c07_intra1_07_setup
    (begin
        (wake c07_2130_cor)
        (wake c07_2140_cor)
        (wake c07_2150_mas)
        (wake c07_2160_cor)
        (wake c07_2170_cor)
        (wake c07_2180_cor)
        (wake c07_2190_cor)
        (wake c07_intra1_07_fov_01)
    )
)

(script static void c07_intra1_07_cleanup
    (begin
        (object_destroy_containing "mercy")
    )
)

(script static void c07_intra1_scene_07
    (begin
        (c07_intra1_07_setup)
        (cinematic_set_environment_map_attenuation 0.05)
        (print "setting near clip distance to .05")
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_07" none "anchor_flag_intra1")
        (custom_animation_relative "chief" "objects\characters\masterchief\07_intra1\07_intra1" "chief_07" false "anchor_intra1")
        (custom_animation_relative "cortana" "objects\characters\cortana\07_intra1\07_intra1" "cortana_07" false "anchor_intra1")
        (custom_animation_relative "mercy" "objects\characters\prophet\07_intra1\07_intra1" "mercy_07" false "anchor_intra1")
        (custom_animation_relative "throne_mercy" "objects\vehicles\gravity_throne\animations\07_intra1\07_intra1" "throne_mercy_07" false "anchor_intra1")
        (sleep (- (camera_set_pan) prediction_offset))
        (07_intra1_08_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_08_fol")
        (sleep (camera_set_pan))
        (c07_intra1_07_cleanup)
    )
)

(script dormant void c07_intra1_foley_08
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_intra1\foley\c07_intra1_08_fol" none 1.0)
        (print "c07_intra1 foley 08 start")
    )
)

(script dormant void pelican_crash_01
    (begin
        (sleep 38)
        (print "crash 1")
        (effect_new_on_object_marker "effects\generic\explosions_air\human_vehicle_air_hit_small" "pelican_01" "hardpoint_right")
    )
)

(script dormant void pelican_crash_02
    (begin
        (sleep 49)
        (print "crash 2")
        (effect_new_on_object_marker "effects\generic\explosions_air\human_vehicle_air_hit" "pelican_01" "johnson")
    )
)

(script dormant void pelican_crash_03
    (begin
        (sleep 101)
        (print "crash 3")
        (effect_new_on_object_marker "effects\generic\explosions_air\human_vehicle_air_hit" "pelican_01" "pelican_p_l05")
    )
)

(script dormant void c07_intra1_08_fov_01
    (begin
        (sleep 99)
        (print "fov change: 36 -> 60 over 0 ticks")
        (camera_pan 60.0 0)
    )
)

(script dormant void flood_pelican_unload
    (begin
        (sleep 145)
        (print "ai flood unload")
        (cinematic_pelican_unload)
        (cinematic_pelican_runby)
    )
)

(script static void c07_intra1_08_setup
    (begin
        (wake c07_intra1_foley_08)
        (object_destroy_containing "offending_crate")
        (object_create_anew "pelican_01")
        (object_cinematic_lod "pelican_01" true)
        (object_uses_cinematic_lighting "pelican_01" true)
        (wake c07_intra1_08_fov_01)
        (wake pelican_crash_01)
        (wake pelican_crash_02)
        (wake pelican_crash_03)
        (wake flood_pelican_unload)
    )
)

(script static void c07_intra1_08_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "cortana")
        (object_destroy "pelican_01")
    )
)

(script static void c07_intra1_scene_08
    (begin
        (c07_intra1_08_setup)
        (cinematic_set_environment_map_attenuation 0.06)
        (print "resetting near clip distance to .06")
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_intra1\07_intra1" "07_intra1_08" none "anchor_flag_intra1")
        (camera_pan 26.0 0)
        (custom_animation_relative "chief" "objects\characters\masterchief\07_intra1\07_intra1" "chief_08" false "anchor_intra1")
        (custom_animation_relative "cortana" "objects\characters\cortana\07_intra1\07_intra1" "cortana_08" false "anchor_intra1")
        (custom_animation_relative "pelican_01" "objects\vehicles\pelican\07_intra1\07_intra1" "pelican_08" false "anchor_intra1")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (sound_class_enable_ducker "amb" 0.0 15)
        (sleep 15)
        (c07_intra1_08_cleanup)
    )
)

(script static void c07_intra1
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (sound_class_enable_ducker "amb" 0.0 0)
        (crash high_5)
        (sleep 1)
        (c07_intra1_scene_05)
        (c07_intra1_scene_06)
        (c07_intra1_scene_07)
        (c07_intra1_scene_08)
        (sound_class_enable_ducker "vehicle" 1.0 15)
        (sound_class_enable_ducker "amb" 1.0 15)
        (sleep 15)
    )
)

(script dormant void c07_outro_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_outro\music\c07_outro_01_mus" none 1.0)
        (print "c07_outro score 01 start")
    )
)

(script dormant void c07_outro_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_outro\foley\c07_outro_01_fol" none 1.0)
        (print "c07_outro foley 01 start")
    )
)

(script dormant void c07_outro_shake
    (begin
        (sleep 89)
        (print "shake start")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (sleep 70)
        (hud_blink_health 0.0)
        (print "shake stop")
    )
)

(script dormant void c07_outro_shake2
    (begin
        (rasterizer_profile_include_all)
        (sleep 290)
        (print "shake start")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (sleep 60)
        (hud_blink_health 1.0)
        (print "shake stop")
    )
)

(script dormant void c07_outro_dof_01
    (begin
        (rasterizer_profile_include_all)
        (print "rack focus")
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 20.0 0.0 0.0 0.0 1.0 1.0 0.0)
        (sleep 89)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c07_outro_dof_02
    (begin
        (rasterizer_profile_include_all)
        (sleep 289)
        (print "rack focus")
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 20.0 2.0 2.0 0.0 0.0 0.0 0.0)
        (sleep 106)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c07_outro_fov_01
    (begin
        (sleep 357)
        (print "fov change: 60 -> 12 over 15 ticks")
        (camera_pan 12.0 15)
        (sleep 46)
        (print "fov change: 12 -> 60 over 0 ticks")
        (camera_pan 60.0 0)
    )
)

(script dormant void c07_outro_cinematic_lighting_01
    (begin
        (cinematic_lighting_set_primary_light -41.0 270.0 0.25 0.32 0.52)
        (cinematic_lighting_set_secondary_light 58.0 78.0 0.21 0.11 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "chief_outro" true)
        (object_uses_cinematic_lighting "alcove" true)
        (object_uses_cinematic_lighting "cap" true)
        (object_uses_cinematic_lighting "ring_01" true)
        (object_uses_cinematic_lighting "ring_02" true)
        (object_uses_cinematic_lighting "ring_03" true)
        (object_uses_cinematic_lighting "ring_04" true)
        (object_uses_cinematic_lighting "ring_05" true)
        (object_uses_cinematic_lighting "ring_06" true)
        (object_uses_cinematic_lighting "ring_06" true)
        (object_uses_cinematic_lighting "ring_08" true)
    )
)

(script dormant void ship_initial_blast
    (begin
        (sleep 188)
        (print "effect - initial blast")
        (effect_new_on_object_marker "effects\objects\cinematics\forerunner_ship\initial_take_off_scale5" "forerunner_ship" "thruster")
    )
)

(script static void c07_outro_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "chief_outro")
        (object_cinematic_lod "chief_outro" true)
        (object_create_anew "conduit")
        (object_create_anew "ring_01")
        (object_create_anew "ring_02")
        (object_create_anew "ring_03")
        (object_create_anew "ring_04")
        (object_create_anew "ring_05")
        (object_create_anew "ring_06")
        (object_create_anew "ring_07")
        (object_create_anew "ring_08")
        (object_cinematic_lod "conduit" true)
        (object_cinematic_lod "ring_01" true)
        (object_cinematic_lod "ring_02" true)
        (object_cinematic_lod "ring_03" true)
        (object_cinematic_lod "ring_04" true)
        (object_cinematic_lod "ring_05" true)
        (object_cinematic_lod "ring_06" true)
        (object_cinematic_lod "ring_07" true)
        (object_cinematic_lod "ring_08" true)
        (object_cinematic_visibility "conduit" true)
    )
)

(script static void c07_outro_01_setup
    (begin
        (object_create_anew "forerunner_ship")
        (object_create_anew "cap")
        (object_create_anew "alcove")
        (object_cinematic_visibility "cap" true)
        (object_cinematic_lod "forerunner_ship" true)
        (object_cinematic_lod "alcove" true)
        (wake c07_outro_score_01)
        (wake c07_outro_foley_01)
        (wake ship_initial_blast)
        (wake c07_outro_dof_01)
        (wake c07_outro_dof_02)
        (wake c07_outro_shake)
        (wake c07_outro_shake2)
        (wake c07_outro_fov_01)
        (wake c07_outro_cinematic_lighting_01)
    )
)

(script static void c07_outro_01_cleanup
    (begin
        (object_destroy "conduit")
        (object_destroy "cap")
        (object_destroy "ring_05")
        (object_destroy "ring_06")
        (object_destroy "ring_07")
        (object_destroy "ring_08")
    )
)

(script static void c07_outro_scene_01
    (begin
        (sound_class_enable_ducker "amb" 0.0 30)
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "forerunnership_outro")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (c07_outro_problem_actors)
        (07_outro_01_predict_stub)
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_outro\music\c07_outro_01_mus")
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_outro\foley\c07_outro_01_fol")
        (sleep prediction_offset)
        (c07_outro_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_outro\07_outro" "07_outro_01" none "anchor_flag_outro1")
        (custom_animation_relative "chief_outro" "objects\characters\masterchief\07_outro\07_outro" "chief_01" false "anchor_outro1")
        (scenery_animation_start_relative "forerunner_ship" "objects\cinematics\forerunner\forerunner_ship\07_outro\07_outro" "forerunner_ship_01" "anchor_outro1")
        (scenery_animation_start_relative "alcove" "objects\cinematics\forerunner\forerunner_ship_alcove\07_outro\07_outro" "alcove_01" "anchor_outro1")
        (scenery_animation_start_relative "cap" "objects\cinematics\covenant\conduit_cap\07_outro\07_outro" "conduit_cap_01" "anchor_outro1")
        (scenery_animation_start_relative "conduit" "objects\cinematics\covenant\conduit\07_outro\07_outro" "conduit_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_01" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring01_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_02" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring02_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_03" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring03_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_04" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring04_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_05" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring05_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_06" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring06_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_07" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring07_01" "anchor_outro1")
        (scenery_animation_start_relative "ring_08" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring08_01" "anchor_outro1")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (07_outro_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_outro\foley\c07_outro_02_fol")
        (sleep (camera_set_pan))
        (c07_outro_01_cleanup)
    )
)

(script dormant void c07_outro_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_outro\foley\c07_outro_02_fol" none 1.0)
        (print "c07_outro foley 02 start")
    )
)

(script dormant void c07_9010_cor
    (begin
        (sleep 38)
        (sound_impulse_time "sound\dialog\levels\07_highcharity\cinematic\c07_9010_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c07_9010_cor" 2.0)
    )
)

(script dormant void c07_9020_mas
    (begin
        (sleep 104)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_9020_mas" "chief_outro" 1.0)
        (attract_mode_set_seconds "c07_9020_mas" 2.0)
    )
)

(script dormant void c07_9030_cor
    (begin
        (sleep 147)
        (sound_impulse_time "sound\dialog\levels\07_highcharity\cinematic\c07_9030_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c07_9030_cor" 2.0)
        (unit_set_emotional_state "cortana_outro" "pensive" 0.25 0)
        (print "cortana - pensive .25 0")
    )
)

(script dormant void c07_9040_cor
    (begin
        (sleep 211)
        (sound_impulse_start_effect "sound\dialog\levels\07_highcharity\cinematic\c07_9040_cor" "cortana_outro" 1.0)
        (attract_mode_set_seconds "c07_9040_cor" 2.0)
        (unit_set_emotional_state "cortana_outro" "disappointed" 0.75 60)
        (print "cortana - disappointed .75 60")
    )
)

(script dormant void chief_sparks
    (begin
        (sleep 17)
        (print "chief sparks")
        (effect_new_on_object_marker "effects\cinematics\07\chief_sparks" "chief_outro" "body")
    )
)

(script dormant void c07_outro_fov_02
    (begin
        (sleep 99)
        (print "fov change: 36 -> 60 over 0 ticks")
        (camera_pan 60.0 0)
    )
)

(script dormant void c07_outro_cinematic_lighting_02
    (begin
        (cinematic_lighting_set_primary_light -41.0 270.0 0.25 0.32 0.52)
        (cinematic_lighting_set_secondary_light 58.0 78.0 0.21 0.11 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
    )
)

(script dormant void ship_take_off_01
    (begin
        (sleep 271)
        (print "effect - take off 01")
        (effect_new_on_object_marker "effects\objects\cinematics\forerunner_ship\initial_take_off_scale12" "forerunner_ship" "thruster")
        (object_create_anew "takeoff_dust")
    )
)

(script static void c07_outro_03_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "matte_high_charity")
        (object_create_anew "matte_substance")
        (object_create_anew_containing "outro_fleet")
    )
)

(script static void c07_outro_02_setup
    (begin
        (object_create_anew "cortana_outro")
        (object_cinematic_lod "cortana_outro" true)
        (object_create_anew "bloom_quad")
        (wake c07_outro_foley_02)
        (wake c07_9010_cor)
        (wake c07_9020_mas)
        (wake c07_9030_cor)
        (wake c07_9040_cor)
        (wake chief_sparks)
        (wake ship_take_off_01)
        (wake c07_outro_cinematic_lighting_02)
    )
)

(script static void c07_outro_02_cleanup
    (begin
        (object_destroy "takeoff_dust")
        (object_destroy "ring_01")
        (object_destroy "ring_02")
        (object_destroy "ring_03")
        (object_destroy "ring_04")
        (object_destroy "bloom_quad")
    )
)

(script static void c07_outro_scene_02
    (begin
        (c07_outro_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_outro\07_outro" "07_outro_02" none "anchor_flag_outro1")
        (custom_animation_relative "chief_outro" "objects\characters\masterchief\07_outro\07_outro" "chief_02" false "anchor_outro1")
        (custom_animation_relative "cortana_outro" "objects\characters\cortana\07_outro\07_outro" "cortana_02" false "anchor_outro1")
        (scenery_animation_start_relative "forerunner_ship" "objects\cinematics\forerunner\forerunner_ship\07_outro\07_outro" "forerunner_ship_02" "anchor_outro1")
        (scenery_animation_start_relative "alcove" "objects\cinematics\forerunner\forerunner_ship_alcove\07_outro\07_outro" "alcove_02" "anchor_outro1")
        (scenery_animation_start_relative "cap" "objects\cinematics\covenant\conduit_cap\07_outro\07_outro" "conduit_cap_02" "anchor_outro1")
        (scenery_animation_start_relative "ring_01" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring01_02" "anchor_outro1")
        (scenery_animation_start_relative "ring_02" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring02_02" "anchor_outro1")
        (scenery_animation_start_relative "ring_03" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring03_02" "anchor_outro1")
        (scenery_animation_start_relative "ring_04" "objects\cinematics\covenant\conduit_ring\07_outro\07_outro" "ring04_02" "anchor_outro1")
        (scenery_animation_start_relative "bloom_quad" "scenarios\objects\special\bloom_quad\07_outro\07_outro" "bloom_quad_02" "anchor_outro1")
        (sleep (- (camera_set_pan) prediction_offset))
        (07_outro_03_predict_stub)
        (c07_outro_03_problem_actors)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\07_highcharity\c07_outro\foley\c07_outro_03_fol")
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_screen_effect_stop 1.5)
        (print "crossfade")
        (sleep 5)
        (c07_outro_02_cleanup)
    )
)

(script dormant void c07_outro_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\07_highcharity\c07_outro\foley\c07_outro_03_fol" none 1.0)
        (print "c07_outro foley 03 start")
    )
)

(script dormant void c07_outro_cinematic_lighting_03
    (begin
        (cinematic_lighting_set_primary_light -41.0 270.0 0.25 0.32 0.52)
        (cinematic_lighting_set_secondary_light 58.0 78.0 0.21 0.11 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
        (object_uses_cinematic_lighting "forerunner_ship" true)
    )
)

(script dormant void ship_take_off_02
    (begin
        (sleep 0)
        (print "effect - take off 02")
        (effect_new_on_object_marker "effects\objects\cinematics\forerunner_ship\initial_take_off_scale01" "forerunner_ship" "thruster")
    )
)

(script dormant void ship_take_off_03
    (begin
        (rasterizer_profile_include_all)
        (sleep 111)
        (print "effect - take off 02")
        (effect_new_on_object_marker "effects\objects\cinematics\forerunner_ship\initial_take_off_scale04" "forerunner_ship" "thruster")
    )
)

(script dormant void effect_slipspace
    (begin
        (sleep 159)
        (print "effect - slipspace")
        (object_create_anew "slipspace")
    )
)

(script static void c07_outro_03_setup
    (begin
        (wake c07_outro_foley_03)
        (wake ship_take_off_02)
        (wake ship_take_off_03)
        (wake effect_slipspace)
        (wake c07_outro_cinematic_lighting_02)
    )
)

(script static void c07_outro_03_cleanup
    (begin
        (cinematic_set_far_clip_distance)
        (object_destroy "forerunner_ship")
        (object_destroy "matte_high_charity")
        (object_destroy "matte_substance")
        (object_destroy_containing "outro_fleet")
    )
)

(script static void c07_outro_scene_03
    (begin
        (c07_outro_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\07_outro\07_outro" "07_outro_03" none "anchor_flag_outro2")
        (scenery_animation_start_relative "forerunner_ship" "objects\cinematics\forerunner\forerunner_ship\07_outro\07_outro" "forerunner_ship_03" "anchor_outro2")
        (scenery_animation_start_relative "matte_high_charity" "objects\cinematics\matte_paintings\high_charity_exterior\07_outro\07_outro" "high_charity_03" "anchor_outro2")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\07_outro\07_outro" "substance_03" "anchor_outro2")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) 30.0))
        (cinematic_stop 0.0 0.0 0.0 30)
        (sleep 30)
        (sleep 90)
        (c07_outro_03_cleanup)
    )
)

(script static void c07_outro
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (sound_class_enable_ducker "amb" 0.0 0)
        (crash high_9_cinematic)
        (sleep 1)
        (c07_outro_scene_01)
        (c07_outro_scene_02)
        (c07_outro_scene_03)
        (sound_class_enable_ducker "vehicle" 1.0 1)
        (sound_class_enable_ducker "amb" 1.0 1)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script stub void c07_intra2
    (begin
        (print "c07_intra2")
    )
)

(script command_script void cs_expand_cortana
    (begin
        (object_set_scale (ai_get_object ai_current_actor) 0.01 0)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (ai_disregard (ai_get_object ai_current_actor) true)
        (sleep 5)
        (unit_set_emotional_state (ai_get_unit ai_current_actor) "disappointed" 0.5 0)
        (object_dynamic_simulation_disable (ai_get_object ai_current_actor) true)
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" (ai_get_object ai_current_actor) "effect")
        (sleep 1)
        (object_hide (ai_get_object ai_current_actor) false)
        (object_set_scale (ai_get_object ai_current_actor) 0.65 20)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script dormant void music_07b_01_start
    (begin
        (print "music 07b_01 start")
        (sound_looping_stop_immediately "scenarios\solo\07b_forerunnership\07b_music\07b_01" none 1.0)
    )
)

(script dormant void music_07b_01_stop
    (begin
        (print "music 07b_01 stop")
        (sound_looping_set_scale "scenarios\solo\07b_forerunnership\07b_music\07b_01")
    )
)

(script static void test
    (begin
        (objects_attach "sanctum_lift" "switch" "sanctum_lift_control" "")
    )
)

(script dormant void music_07b_02_start
    (begin
        (print "music 07b_02 start")
        (sound_looping_stop_immediately "scenarios\solo\07b_forerunnership\07b_music\07b_02" none 1.0)
    )
)

(script dormant void music_07b_03_start
    (begin
        (print "music 07b_03 start")
        (sound_looping_stop_immediately "scenarios\solo\07b_forerunnership\07b_music\07b_03" none 1.0)
    )
)

(script dormant void music_07b_03_stop
    (begin
        (print "music 07b_03 stop")
        (sound_looping_set_scale "scenarios\solo\07b_forerunnership\07b_music\07b_03")
    )
)

(script dormant void music_07b_04_start
    (begin
        (print "music 07b_04 start")
        (sound_looping_stop_immediately "scenarios\solo\07b_forerunnership\07b_music\07b_04" none 1.0)
    )
)

(script dormant void music_07b_04_stop
    (begin
        (print "music 07b_04 stop")
        (sound_looping_set_scale "scenarios\solo\07b_forerunnership\07b_music\07b_04")
    )
)

(script dormant void music_07b_05_start
    (begin
        (print "music 07b_05 start")
        (sound_looping_stop_immediately "scenarios\solo\07b_forerunnership\07b_music\07b_05" none 1.0)
    )
)

(script dormant void music_07b_05_stop
    (begin
        (print "music 07b_05 stop")
        (sound_looping_set_scale "scenarios\solo\07b_forerunnership\07b_music\07b_05")
    )
)

(script dormant void music_07b_06_start
    (begin
        (print "music 07b_06 start")
        (sound_looping_stop_immediately "scenarios\solo\07b_forerunnership\07b_music\07b_06" none 1.0)
    )
)

(script dormant void music_07b_06_stop
    (begin
        (print "music 07b_06 stop")
        (sound_looping_set_scale "scenarios\solo\07b_forerunnership\07b_music\07b_06")
    )
)

(script dormant void chapter_purposes
    (begin
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void chapter_please
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

(script dormant void chapter_sanctified
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

(script dormant void chapter_feeling
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

(script dormant void objective_enter_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "fight your way back inside the mausoleum-tower.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_enter_clear
    (begin
        (print "objective complete:")
        (print "you got inside the tower")
        (update_remote_camera 0)
    )
)

(script dormant void objective_riptide_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "survive the rising tide of the flood.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_riptide_clear
    (begin
        (print "objective complete:")
        (print "you have reached the inner sanctum of the covenant homeworld")
        (update_remote_camera 1)
    )
)

(script dormant void objective_exit_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "find a way onto the forerunner ship.")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective_exit_clear
    (begin
        (print "objective complete:")
        (print "ride that pipe.")
        (update_remote_camera 2)
    )
)

(script dormant void gen_dia_civil_war_a
    (begin
        (if dialogue 
            (print "cortana: brute and elite ships are engaging one-another all around high charity!"))
        (sleep (ai_play_line_on_object none "2880"))
        (sleep dialogue_pause)
    )
)

(script dormant void gen_dia_civil_war_b
    (begin
        (if dialogue 
            (print "cortana: the jackals and the drones have declared themselves the servants of the brutes. the hunters have have sworn allegiance to the elites."))
        (sleep (ai_play_line_on_object none "2890"))
        (sleep dialogue_pause)
    )
)

(script dormant void gen_dia_civil_war_c
    (begin
        (if dialogue 
            (print "cortana: the grunts seem to be neutral, or, at least afraid to announce which side they support. except for truth, the prophets aren't saying a word."))
        (sleep (ai_play_line_on_object none "2900"))
        (sleep dialogue_pause)
    )
)

(script dormant void gen_dia_locking_doors_behind
    (begin
        (if dialogue 
            (print "cortana: if it makes you feel any better, i'm locking the doors behind you. should keep some of the flood off your back."))
        (sleep (ai_play_line_on_object none "2840"))
        (sleep dialogue_pause)
    )
)

(script dormant void e1_dia_truth_holycity
    (begin
        (if dialogue 
            (print "truth: shall we let the flood consume our holy-city? turn high charity into another of their wretched hives?"))
        (begin
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0280_pot" "e5_speaker2" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0280_pot" "e5_speaker4" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0280_pot" "e5_speaker5" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0280_pot" "e5_speaker0" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0280_pot" "e5_speaker1" 1.0 1)
            (sleep (ai_play_line_on_object "e5_speaker3" "0280"))
        )
        (sleep 30)
        (if dialogue 
            (print "truth: no enemy has ever withstood our might - the flood too shall fall!"))
        (begin
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0200_pot" "e5_speaker2" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0200_pot" "e5_speaker4" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0200_pot" "e5_speaker5" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0200_pot" "e5_speaker0" 1.0 1)
            (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0200_pot" "e5_speaker1" 1.0 1)
            (sleep (ai_play_line_on_object "e5_speaker3" "0200"))
        )
    )
)

(script dormant void e5_dia_get_to_conduit
    (begin
        (if dialogue 
            (print "cortana: no time to admire the view. truth's phantom has reached the forerunner ship!"))
        (sleep (ai_play_line_on_object none "2730"))
        (sleep dialogue_pause)
    )
)

(script dormant void e8_dia_security_lock
    (begin
        (if dialogue 
            (print "cortana: the security systems in this part of the tower are particularly robust. hang on while i override the lock."))
        (sleep (ai_play_line_on_object none "2760"))
        (sleep dialogue_pause)
    )
)

(script dormant void e8_dia_unlock_a
    (begin
        (if dialogue 
            (print "cortana: hang on. this will just take a minute."))
        (sleep (ai_play_line_on_object none "2780"))
        (sleep dialogue_pause)
    )
)

(script dormant void e8_dia_unlock_b
    (begin
        (if dialogue 
            (print "cortana: standby while i break the lock."))
        (sleep (ai_play_line_on_object none "2790"))
        (sleep dialogue_pause)
    )
)

(script dormant void e8_dia_unlock_c
    (begin
        (if dialogue 
            (print "cortana: i'm working as quickly as possible."))
        (sleep (ai_play_line_on_object none "2800"))
        (sleep dialogue_pause)
    )
)

(script dormant void e8_dia_unlock_d
    (begin
        (if dialogue 
            (print "cortana: almost have it."))
        (sleep (ai_play_line_on_object none "2810"))
        (sleep dialogue_pause)
    )
)

(script dormant void e8_dia_unlock_e
    (begin
        (if dialogue 
            (print "cortana: just a little more time..."))
        (sleep (ai_play_line_on_object none "2820"))
        (sleep dialogue_pause)
    )
)

(script dormant void e8_dia_unlock_f
    (begin
        (if dialogue 
            (print "cortana: a few more seconds..."))
        (sleep (ai_play_line_on_object none "2830"))
        (sleep dialogue_pause)
    )
)

(script dormant void e7_dia_filtration_systems
    (begin
        (if dialogue 
            (print "cortana: flood spores have contaminated the city's life-support infrastructure - the filtration systems are overloading!"))
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_2850_cor"))
        (sleep dialogue_pause)
    )
)

(script dormant void e10_dia_truth_theparasite
    (begin
        (if dialogue 
            (print "truth: the parasite did not defeat the forerunners, and it shall not defeat us!"))
        (sleep (ai_play_line_on_object none "2910"))
        (sleep dialogue_pause)
    )
)

(script dormant void e10_dia_truth_grippedbyfear
    (begin
        (if dialogue 
            (print "truth: whosoever is gripped by fear, take heed: i am the prophet of truth, and i am not afraid!"))
        (sleep (ai_play_line_on_object none "0210"))
        (sleep dialogue_pause)
    )
)

(script dormant void e10_dia_truth_noblemercy
    (begin
        (if dialogue 
            (print "truth: noble mercy is here, at my side - his wise counsel ever in my ears!"))
        (sleep (ai_play_line_on_object none "0270"))
        (sleep dialogue_pause)
    )
)

(script dormant void e10_dia_civilwar_a
    (begin
        (if dialogue 
            (print "cortana: brute and elite ships are engaging one-another all around high charity!"))
        (sleep (ai_play_line_on_object none "2880"))
        (sleep dialogue_pause)
    )
)

(script dormant void e10_dia_civilwar_b
    (begin
        (if dialogue 
            (print "cortana: the jackals and drones have declared themselves the servants of the brutes. the hunters have sworn allegiance to the elites."))
        (sleep (ai_play_line_on_object none "2890"))
        (sleep dialogue_pause)
    )
)

(script dormant void e10_dia_civilwar_c
    (begin
        (if dialogue 
            (print "cortana: the grunts seem to be neutral, or at least afraid to announce which side they support. except for truth the prophets aren't saying a word."))
        (sleep (ai_play_line_on_object none "2900"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_tickle_a
    (begin
        (if dialogue 
            (print "cortana: stopping truth - that's all that matters!"))
        (sleep (ai_play_line_on_object none "2980"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_truth_becomegods
    (begin
        (if dialogue 
            (print "truth: now is the time of our unworlding - the moment we shall all become as gods!"))
        (sleep (ai_play_line_on_object none "0330"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_truth_final
    (begin
        (if dialogue 
            (print "truth: if you would falter, know this: one final effort is all that remains!"))
        (sleep (ai_play_line_on_object none "0260"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_go_conduit_a
    (begin
        (if dialogue 
            (print "cortana: get to the conduit. i'll keep it attached to the ship as long as i can."))
        (sleep (ai_play_line_on_object none "2940"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_go_conduit_b
    (begin
        (if dialogue 
            (print "cortana: i've lost control of the conduit! it's breaking away from the ship!"))
        (sleep (ai_play_line_on_object none "2950"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_end_b
    (begin
        (if dialogue 
            (print "cortana: you know the plan. you've got to stop truth. i've got to handle the index. go!"))
        (sleep (ai_play_line_on_object none "3030"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_tickle_flood
    (begin
        (if dialogue 
            (print "cortana: forget about the flood! you've got to get aboard!"))
        (sleep (ai_play_line_on_object none "2960"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_tickle_brutes
    (begin
        (if dialogue 
            (print "cortana: ignore the brutes! get into the conduit!"))
        (sleep (ai_play_line_on_object none "2970"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_tickle_d
    (begin
        (if dialogue 
            (print "cortana: i can't go with you!"))
        (sleep (ai_play_line_on_object none "3010"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_end_a
    (begin
        (if dialogue 
            (print "cortana: i have to stay here, chief!"))
        (sleep (ai_play_line_on_object none "3020"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_end_c
    (begin
        (if dialogue 
            (print "cortana: we're out of time, chief! into the conduit!"))
        (sleep (ai_play_line_on_object none "3040"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_tickle_c
    (begin
        (if dialogue 
            (print "cortana: chief! leave me!"))
        (sleep (ai_play_line_on_object none "3000"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_dia_tickle_b
    (begin
        (if dialogue 
            (print "cortana: jump in chief, now!"))
        (sleep (ai_play_line_on_object none "2990"))
        (sleep dialogue_pause)
    )
)

(script dormant void e12_pelican_flyby
    (begin
        (ai_place "e12_cs_pelican1")
        (ai_place "e12_cs_banshee1")
    )
)

(script command_script void e12_cs_pelican1
    (begin
        (cs_vehicle_speed 0.8)
        (cs_fly_by pelican3/p0)
        (cs_fly_by pelican3/p1)
        (cs_fly_by pelican3/p2)
        (cs_fly_to pelican3/p3)
        (cs_fly_by pelican3/p4)
        (cs_fly_by pelican3/p5)
        (ai_erase "e12_cs_pelican1")
        (ai_erase "e12_cs_banshee1")
    )
)

(script dormant void e12_tickle
    (begin
        (sleep_until (volume_test_objects "tv_e12_tickle" (players)) 15)
        (print "placing cortana...")
        (ai_place "cortana")
        (wake music_07b_03_stop)
        (sleep_until (= g_dialogue_counter 8))
        (sleep 90)
        (if dialogue 
            (print "cortana: i knew the covenant was good at re-purposing forerunner technology, but this is amazing. they've been using the forerunner ship's engines as an energy-source for the city!"))
        (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
            (sleep (ai_play_line_on_object none "2920")) (sleep (ai_play_line_at_player "cortana" "2920")))
        (sleep (* dialogue_pause 2.0))
        (if dialogue 
            (print "cortana: the ship isn't so much launching as it is disengaging - uncoupling itself from high charity's power grid!"))
        (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
            (sleep (ai_play_line_on_object none "2930")) (sleep (ai_play_line_at_player "cortana" "2930")))
        (sleep_until g_e12_started)
        (if dialogue 
            (print "cortana: stopping truth - that's all that matters!"))
        (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
            (sleep (ai_play_line_on_object none "2980")) (sleep (ai_play_line_at_player "cortana" "2980")))
        (sleep (* dialogue_pause 6.0))
        (if dialogue 
            (print "truth: now is the time of our unworlding - the moment we shall all become as gods!"))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker5" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker6" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker7" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker8" 1.0 1)
        (sleep (ai_play_line_on_object "e12_speaker0" "0330"))
        (sleep dialogue_pause)
        (sleep_until g_e12_final_battle_started)
        (if dialogue 
            (print "cortana: you know the plan. you've got to stop truth. i've got to handle the index. go!"))
        (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
            (sleep (ai_play_line_on_object none "3030")) (sleep (ai_play_line_at_player "cortana" "3030")))
        (sleep dialogue_pause)
        (sleep_until g_e12_final_battle_mid)
        (if dialogue 
            (print "truth: if you would falter, know this: one final effort is all that remains!"))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0260_pot" "e12_speaker1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0260_pot" "e12_speaker2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0260_pot" "e12_speaker3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0260_pot" "e12_speaker4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker5" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker6" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker7" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0330_pot" "e12_speaker8" 1.0 1)
        (sleep (ai_play_line_on_object "e12_speaker0" "0260"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: forget about the flood! you've got to get aboard!"))
        (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
            (sleep (ai_play_line_on_object none "2960")) (sleep (ai_play_line_at_player "cortana" "2960")))
        (sleep dialogue_pause)
        (sleep_until (volume_test_objects "tv_e12_final_dialogue" (players)))
        (if (random_range 0 2) 
            (begin
                (if dialogue 
                    (print "cortana: i can't go with you!"))
                (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
                    (sleep (ai_play_line_on_object none "3010")) (sleep (ai_play_line_at_player "cortana" "3010")))
                (sleep dialogue_pause_long)
            ) (begin
                (if dialogue 
                    (print "cortana: i have to stay here, chief!"))
                (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
                    (sleep (ai_play_line_on_object none "3020")) (sleep (ai_play_line_at_player "cortana" "3020")))
                (sleep dialogue_pause_long)
            )
        )
        (sleep 90)
        (sleep_until (volume_test_objects "tv_e12_final_dialogue" (players)))
        (if (random_range 0 2) 
            (begin
                (if dialogue 
                    (print "cortana: we're out of time, chief! into the conduit!"))
                (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
                    (sleep (ai_play_line_on_object none "3040")) (sleep (ai_play_line_at_player "cortana" "3040")))
                (sleep dialogue_pause_long)
            ) (begin
                (if dialogue 
                    (print "cortana: chief! leave me!"))
                (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
                    (sleep (ai_play_line_on_object none "3000")) (sleep (ai_play_line_at_player "cortana" "3000")))
                (sleep dialogue_pause_long)
            )
        )
        (sleep 20)
        (sleep_until (volume_test_objects "tv_e12_final_dialogue" (players)))
        (if dialogue 
            (print "cortana: jump in chief, now!"))
        (if (> (objects_distance_to_object (players) (ai_get_object "cortana")) 7.0) 
            (sleep (ai_play_line_on_object none "2990")) (sleep (ai_play_line_at_player "cortana" "2990")))
    )
)

(script static void e12_safe_to_spawn_flood
    (begin
        (sleep_until (<= (ai_nonswarm_count "e12_flood_rush") 4) 15)
    )
)

(script dormant void e12_final_battle
    (begin
        (print "final battle started!!!!!!")
        (set g_e12_final_battle_started true)
        (if g_e12_side 
            (begin
                (begin_random
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_right")
                        (sleep 1)
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf3_right")
                        (sleep 1)
                    )
                )
                (set g_e12_talk 2)
                (begin_random
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf1_right")
                        (sleep 1)
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_right")
                        (sleep 1)
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf3_right")
                        (sleep 1)
                    )
                )
                (wake e12_pelican_flyby)
                (print "final battle midpoint...")
                (set g_e12_final_battle_mid true)
                (e12_safe_to_spawn_flood)
                (begin_random
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e12_howler1" 1.0)
                        (ai_place "e12_fld_inf4/guy1")
                        (ai_place "e12_fld_inf4/guy2")
                        (ai_place "e12_fld_inf4/guya")
                    )
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e12_howler2" 1.0)
                        (ai_place "e12_fld_inf4/guy3")
                        (ai_place "e12_fld_inf4/guy4")
                        (ai_place "e12_fld_inf4/guyz")
                    )
                )
                (begin_random
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf1_right")
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_right")
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf3_right")
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_left")
                    )
                )
                (ai_set_orders "e12_flood_rush" "e12_get_the_player")
                (sleep_until (not (volume_test_objects_all "tv_e12_conduit_check" (ai_actors "all_enemies"))))
                (set g_e12_talk 3)
                (set g_e12_go true)
            ) (begin
                (begin_random
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_left")
                        (sleep 1)
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf3_left")
                        (sleep 1)
                    )
                )
                (set g_e12_talk 2)
                (begin_random
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf1_left")
                        (sleep 1)
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_left")
                        (sleep 1)
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf3_left")
                        (sleep 1)
                    )
                )
                (wake e12_pelican_flyby)
                (print "final battle midpoint...")
                (set g_e12_final_battle_mid true)
                (e12_safe_to_spawn_flood)
                (begin_random
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e12_howler1" 1.0)
                        (ai_place "e12_fld_inf4/guy1")
                        (ai_place "e12_fld_inf4/guy2")
                    )
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e12_howler2" 1.0)
                        (ai_place "e12_fld_inf4/guy3")
                        (ai_place "e12_fld_inf4/guy4")
                    )
                )
                (begin_random
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf1_left")
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_left")
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf3_left")
                    )
                    (begin
                        (e12_safe_to_spawn_flood)
                        (ai_place "e12_fld_inf2_right")
                    )
                )
                (ai_set_orders "e12_flood_rush" "e12_get_the_player")
                (sleep_until (not (volume_test_objects_all "tv_e12_conduit_check" (ai_actors "all_enemies"))))
                (set g_e12_talk 3)
                (set g_e12_go true)
            )
        )
        (print "final battle ended...")
        (set g_e12_final_battle_ended true)
    )
)

(script dormant void e12_start
    (begin
        (sleep_until (volume_test_objects "tv_e12_trigger1" (players)) 5)
        (wake chapter_feeling)
        (data_mine_insert "last_room")
        (game_save_immediate)
        (sleep 1)
        (game_saving)
        (set g_e12_talk 1)
        (set g_e12_started true)
        (ai_disposable "e10_pro_inf1" true)
        (ai_disposable "e10_pro_inf1_a" true)
        (ai_disposable "e10_cov_inf1" true)
        (ai_disposable "e10_fld_inf1" true)
        (if (random_range 0 2) 
            (begin
                (object_create_containing "e12_left")
                (ai_place "e12_pro_inf2_left")
                (ai_place "e12_pro_inf3_end")
                (ai_place "e12_pro_inf4_left" 1)
                (wake e12_final_battle)
            ) (begin
                (object_create_containing "e12_right")
                (ai_place "e12_pro_inf2_right")
                (ai_place "e12_pro_inf3_end")
                (ai_place "e12_pro_inf4_right" 1)
                (set g_e12_side true)
                (wake e12_final_battle)
            )
        )
        (sleep 120)
    )
)

(script dormant void e12_main
    (begin
        (sleep_until (volume_test_objects "tv_e10_trigger5" (players)) 15)
        (sleep_until (volume_test_objects "tv_e10_trigger6" (players)) 15)
        (wake e12_start)
        (ai_disposable "e10_fld_swarm1" true)
        (ai_disposable "e10_cov_inf1" true)
        (ai_disposable "e10_pro_inf1_a" true)
        (ai_disposable "e10_pro_inf1" true)
    )
)

(script dormant void e10_sanctum2
    (begin
        (sleep_until (volume_test_objects "tv_e10_trigger6" (players)) 15)
        (wake music_07b_06_stop)
        (wake e12_tickle)
        (game_saving)
        (data_mine_insert "council_chamber")
        (sleep_until (= g_dialogue_counter 7))
        (sleep_until (volume_test_objects "tv_e10_screen" (players)) 10)
        (if dialogue 
            (print "cortana: brute and elite ships are engaging one-another all around high charity!"))
        (if (volume_test_objects "tv_e10_screen" (players)) 
            (begin
                (sleep (ai_play_line_on_object none "2880"))
                (sleep dialogue_pause)
            )
        )
        (sleep_until (volume_test_objects "tv_e10_screen" (players)) 10)
        (if dialogue 
            (print "cortana: the jackals and drones have declared themselves the servants of the brutes. the hunters have sworn allegiance to the elites."))
        (if (volume_test_objects "tv_e10_screen" (players)) 
            (begin
                (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_2890_cor"))
                (sleep (* dialogue_pause 2.0))
            )
        )
        (sleep_until (volume_test_objects "tv_e10_screen" (players)) 10)
        (if dialogue 
            (print "cortana: the grunts seem to be neutral, or at least afraid to announce which side they support. except for truth the prophets aren't saying a word."))
        (if (volume_test_objects "tv_e10_screen" (players)) 
            (begin
                (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_2900_cor"))
                (set g_e10_talk 9)
            )
        )
        (set g_dialogue_counter 8)
    )
)

(script dormant void e10_tickle
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e10_trigger9" (players))
                (= g_e10_talk 9)
            )
        )
        (sleep_forever e10_sanctum2)
        (wake music_07b_06_stop)
        (if (not (= g_e10_talk 9)) 
            (sleep 150))
        (if dialogue 
            (print "cortana: i'm running out of options, chief. i can't stall the launch sequence much longer. the next lift will take you up to the conduit. hurry!"))
        (sleep (ai_play_line_on_object none "2910"))
        (sleep dialogue_pause)
        (wake objective_exit_set)
        (set g_dialogue_counter 8)
        (if (= g_e10_talk 9) 
            (begin
                (device_set_position "e10_tube_door" 1.0)
                (device_closes_automatically_set "e10_tube_door" false)
            )
        )
    )
)

(script dormant void e10_end_open
    (begin
        (sleep_until 
            (and
                (= g_e10_move_on true)
                (volume_test_objects "tv_e10_trigger5" (players))
            )
        )
        (game_save_no_timeout)
        (wake e10_sanctum2)
        (wake e10_tickle)
        (device_operates_automatically_set "e10_sanctum_door" true)
    )
)

(script command_script void e10_superflood
    (begin
        (if (difficulty_legendary) 
            (ai_set_active_camo ai_current_actor false))
    )
)

(script dormant void e10_storm
    (begin
        (ai_place "e10_pro_inf1")
        (ai_place "e10_pro_inf1_a")
        (begin
            (if (random_range 0 2) 
                (ai_place "e10_cov_inf1" 2) (ai_place "e10_cov_inf1" 3))
        )
        (sleep_until (<= (ai_strength "e10_pro_inner_sanctum") 0.8) 15 600)
        (begin_random
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 1) 
                    (begin
                        (ai_place "e10_fld_inf1/guy1")
                        (ai_place "e10_fld_inf1/guy2")
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 1) 
                    (begin
                        (ai_place "e10_fld_inf1/guy4")
                        (ai_place "e10_fld_inf1/guy5")
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 1) 
                    (begin
                        (ai_place "e10_fld_inf1/guy3")
                        (ai_place "e10_fld_inf1/guy6")
                        (sleep 1)
                    )
                )
            )
        )
        (sleep_until (<= (ai_strength "e10_pro_inner_sanctum") 0.5) 15 600)
        (set g_e10_talk 1)
        (begin_random
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 2) 
                    (begin
                        (ai_place "e10_fld_inf1/guy1")
                        (ai_place "e10_fld_inf1/guy2")
                        (ai_place "e10_fld_inf1/guy3")
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 2) 
                    (begin
                        (ai_place "e10_fld_inf1/guy4")
                        (ai_place "e10_fld_inf1/guy5")
                        (ai_place "e10_fld_inf1/guy6")
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 2) 
                    (begin
                        (ai_place "e10_fld_inf1/guy1")
                        (ai_place "e10_fld_inf1/guy5")
                        (ai_place "e10_fld_inf1/guy6")
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 2) 
                    (begin
                        (ai_place "e10_fld_inf1/guy2")
                        (ai_place "e10_fld_inf1/guy3")
                        (ai_place "e10_fld_inf1/guy4")
                        (sleep 1)
                    )
                )
            )
        )
        (sleep_until (<= (ai_strength "e10_pro_inner_sanctum") 0.3) 15 600)
        (begin_random
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 3) 
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler1" 1.0)
                        (ai_place "e10_fld_inf1/guy1")
                        (ai_place "e10_fld_inf1/guy2")
                        (ai_place "e10_fld_inf1/guy3")
                        (sleep (random_range 90 150))
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler3" 1.0)
                        (ai_place "e10_fld_inf1/guy7")
                        (ai_place "e10_fld_inf1/guy8")
                        (ai_place "e10_fld_inf1/guy9")
                        (if (difficulty_legendary) 
                            (ai_set_orders "e10_fld_inf1" "e10_fld_storm_z"))
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 3) 
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler2" 1.0)
                        (ai_place "e10_fld_inf1/guy4")
                        (ai_place "e10_fld_inf1/guy5")
                        (ai_place "e10_fld_inf1/guy6")
                        (sleep (random_range 90 150))
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler4" 1.0)
                        (ai_place "e10_fld_inf1/guy10")
                        (ai_place "e10_fld_inf1/guy11")
                        (ai_place "e10_fld_inf1/guy12")
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 3) 
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler1" 1.0)
                        (ai_place "e10_fld_inf1/guy1")
                        (ai_place "e10_fld_inf1/guy2")
                        (ai_place "e10_fld_inf1/guy3")
                        (sleep (random_range 90 150))
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler4" 1.0)
                        (ai_place "e10_fld_inf1/guy10")
                        (ai_place "e10_fld_inf1/guy11")
                        (ai_place "e10_fld_inf1/guy12")
                        (sleep 1)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e10_flood_storm") 3) 
                    (begin
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler2" 1.0)
                        (ai_place "e10_fld_inf1/guy4")
                        (ai_place "e10_fld_inf1/guy5")
                        (ai_place "e10_fld_inf1/guy6")
                        (sleep (random_range 90 150))
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e10_howler3" 1.0)
                        (ai_place "e10_fld_inf1/guy7")
                        (ai_place "e10_fld_inf1/guy8")
                        (ai_place "e10_fld_inf1/guy9")
                        (sleep 1)
                    )
                )
            )
        )
        (set g_e10_move_on true)
        (game_save_no_timeout)
        (sleep 150)
    )
)

(script dormant void e10_infinite_save
    (begin
        (game_saving)
    )
)

(script dormant void e10_sanctum_lift_recall
    (begin
        (sleep_until (<= (device_get_position "sanctum_lift") 1.0) 10)
        (sleep_until 
            (begin
                (if (volume_test_objects "tv_sanctum_lift" (players)) 
                    (device_set_position "sanctum_lift" 1.0))
                false
            ) 
        31)
    )
)

(script dormant void e10_sanctum_lift_crusher
    (begin
        (sleep_until 
            (begin
                (if (>= (device_get_position "sanctum_lift") 0.955) 
                    (kill_volume_enable "kill_sanctum_crusher") (kill_volume_disable "kill_sanctum_crusher"))
                false
            ) 
        3)
    )
)

(script dormant void e10_battle
    (begin
        (sleep_until (volume_test_objects "tv_e10_trigger2" (players)) 15)
        (wake e10_infinite_save)
        (data_mine_insert "inner_sanctum")
        (wake e10_storm)
        (sleep 90)
        (wake chapter_sanctified)
        (wake objective_riptide_clear)
        (ai_disposable "e8_pro_inf1" true)
        (ai_disposable "e8_fld_inf1" true)
        (sleep_until (<= (device_get_position "sanctum_lift") 1.0) 10)
        (sleep_until (volume_test_objects "tv_e10_trigger1" (players)) 15)
        (device_set_position "sanctum_lift" 0.0)
    )
)

(script dormant void e10_talking_points
    (begin
        (sleep_until 
            (and
                (= g_e10_talk 1)
                (= g_dialogue_counter 6)
            )
        )
        (if dialogue 
            (print "truth: this crisis will not be the end of us! it is but one, last hurdle before the journey and salvation!"))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0170_pot" "e10_speaker1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0170_pot" "e10_speaker2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0170_pot" "e10_speaker3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0170_pot" "e10_speaker4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0170_pot" "e10_speaker5" 1.0 1)
        (sleep (ai_play_line_on_object "e10_speaker0" "0170"))
        (sleep dialogue_pause)
        (set g_dialogue_counter 7)
    )
)

(script dormant void e10_start
    (begin
        (wake e10_battle)
        (wake e10_end_open)
        (wake e10_talking_points)
        (sleep_until (volume_test_objects_all "tv_e10_trigger1" (players)) 15)
        (sleep (random_range 150 240))
        (sleep (random_range 90 150))
    )
)

(script dormant void e10_music_aux
    (begin
        (sleep_until (>= (device_get_position "sanctum_lift") 1.0) 10)
        (sleep_until (< (device_get_position "sanctum_lift") 1.0) 10)
        (wake music_07b_06_start)
        (sleep 2)
        (game_save_no_timeout)
    )
)

(script dormant void e10_load
    (begin
        (device_set_position_immediate "sanctum_lift" 1.0)
        (wake e10_sanctum_lift_recall)
        (wake e10_sanctum_lift_crusher)
        (wake e10_music_aux)
        (objects_attach "sanctum_lift" "switch" "sanctum_lift_control" "")
        (sleep_until (volume_test_objects "tv_e9_end" (players)) 15)
        (game_save_immediate)
        (sleep 6)
        (game_save_no_timeout)
        (wake e10_start)
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
        (reset_dsp_image 11)
    )
)

(script dormant void e10_main
    (begin
        (sleep_until (volume_test_objects "tv_e9_trigger1" (players)) 15)
        (wake e10_load)
        (wake e10_key)
        (wake e12_main)
        (ai_disposable "e9_fld_inf1" true)
    )
)

(script dormant void e9_start
    (begin
        (sleep_until (volume_test_objects "tv_e9_trigger1" (players)) 15)
        (data_mine_insert "hallway_attack")
        (if (game_all_quiet) 
            (game_save_no_timeout))
        (sleep 5)
        (if (game_all_quiet) 
            (begin
                (if (volume_test_objects_all "tv_e9_trigger1" (players)) 
                    (begin_random
                        (begin
                            (if (<= (ai_living_count "e9_fld_inf1") 0) 
                                (begin
                                    (sleep_until (volume_test_objects "tv_e9_surprise" (players)))
                                    (ai_place "e9_fld_inf1/guy1")
                                    (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e9_howler1" 1.0)
                                )
                            )
                        )
                        (begin
                            (if (<= (ai_living_count "e9_fld_inf1") 0) 
                                (ai_place "e9_fld_inf1/guy2"))
                        )
                        (begin
                            (if (<= (ai_living_count "e9_fld_inf1") 0) 
                                (ai_place "e9_fld_inf1/guy3"))
                        )
                    )
                )
            )
        )
    )
)

(script dormant void e9_main
    (begin
        (sleep_until (volume_test_objects "tv_e7_trigger2" (players)) 15)
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_e8_end" (players)) 15)
        (wake e9_start)
        (wake e10_main)
        (ai_disposable "e8_fld_inf1" true)
        (ai_disposable "e8_fld_swarm1" true)
        (ai_disposable "e8_pro_inf1" true)
    )
)

(script dormant void e8_end_open
    (begin
        (sleep_until (volume_test_objects "tv_e8_end" (players)) 15)
        (sleep_until (= g_dialogue_counter 5) 15)
        (wake music_07b_05_stop)
        (sleep 120)
        (if dialogue 
            (print "cortana: apparently these are the prophet hierarch's private quarters - their inner sanctum."))
        (sleep (ai_play_line_on_object none "2770"))
        (set g_dialogue_counter 6)
        (game_save_no_timeout)
    )
)

(script dormant void e8_infinite_save
    (begin
        (game_saving)
    )
)

(script dormant void e8_sneaky_spawner_dialogue
    (begin
        (sleep_until (= g_dialogue_counter 4))
        (if dialogue 
            (print "truth: whosoever is gripped by fear, take heed: i am the prophet of truth, and i am not afraid!"))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0210_pot" "e8_speaker1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0210_pot" "e8_speaker2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0210_pot" "e8_speaker3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0210_pot" "e8_speaker4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0210_pot" "e8_speaker5" 1.0 1)
        (sleep (ai_play_line_on_object "e8_speaker0" "0210"))
        (sleep 20)
        (if dialogue 
            (print "truth: noble mercy is here, at my side - his wise counsel ever in my ears!"))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0270_pot" "e8_speaker1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0270_pot" "e8_speaker2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0270_pot" "e8_speaker3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0270_pot" "e8_speaker4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0270_pot" "e8_speaker5" 1.0 1)
        (sleep (ai_play_line_on_object "e8_speaker0" "0270"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "gravemind: we exist together now. two corpses in one grave."))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5000_grv" "e8_speaker_gm1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5000_grv" "e8_speaker_gm2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5000_grv" "e8_speaker_gm3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5000_grv" "e8_speaker_gm4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5000_grv" "e8_speaker_gm5" 1.0 1)
        (sleep (ai_play_line_on_object "e8_speaker_gm0" "5000"))
        (game_saving)
        (set g_dialogue_counter 5)
    )
)

(script dormant void e8_sneaky_spawner
    (begin
        (sleep_until (volume_test_objects "tv_e8_trigger2_a" (players)))
        (if 
            (or
                (difficulty_normal)
                (difficulty_heroic)
            ) 
                (ai_place "e8_pro_inf1" 2) (ai_place "e8_pro_inf1" 3))
        (game_saving)
        (wake e8_sneaky_spawner_dialogue)
        (if (volume_test_objects "tv_e8_cave_check" (players)) 
            (begin
                (if 
                    (or
                        (difficulty_normal)
                        (difficulty_heroic)
                    ) 
                        (ai_place "e8_pro_inf1" 2) (ai_place "e8_pro_inf1" 3))
            )
        )
        (if 
            (or
                (difficulty_normal)
                (difficulty_heroic)
            ) 
                (begin
                    (begin_random
                        (begin
                            (if 
                                (and
                                    (<= (ai_living_count "e8_fld_inf1") 3)
                                    (volume_test_objects "tv_e8_cave_check" (players))
                                ) 
                                    (begin
                                        (if (random_range 0 2) 
                                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler1" 1.0) (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler3" 1.0))
                                        (ai_place "e8_fld_inf1/guy10")
                                        (sleep (random_range 30 180))
                                    )
                            )
                        )
                        (begin
                            (if 
                                (and
                                    (<= (ai_living_count "e8_fld_inf1") 3)
                                    (volume_test_objects "tv_e8_cave_check" (players))
                                ) 
                                    (begin
                                        (if (random_range 0 2) 
                                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler1" 1.0) (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler3" 1.0))
                                        (ai_place "e8_fld_inf1/guy9")
                                        (sleep (random_range 30 180))
                                    )
                            )
                        )
                        (begin
                            (if 
                                (and
                                    (<= (ai_living_count "e8_fld_inf1") 3)
                                    (volume_test_objects "tv_e8_cave_check" (players))
                                ) 
                                    (begin
                                        (ai_place "e8_fld_inf1/guy8")
                                        (sleep (random_range 30 180))
                                    )
                            )
                        )
                        (begin
                            (if 
                                (and
                                    (<= (ai_living_count "e8_fld_inf1") 3)
                                    (volume_test_objects "tv_e8_cave_check" (players))
                                ) 
                                    (begin
                                        (ai_place "e8_fld_inf1/guy7")
                                        (sleep (random_range 30 180))
                                    )
                            )
                        )
                    )
                    (sleep_until (<= (ai_strength "e8_fld_inf1") 0.3) 15 1800)
                    (begin_random
                        (begin
                            (if (<= (ai_living_count "e8_fld_inf1") 3) 
                                (begin
                                    (if (random_range 0 2) 
                                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler1" 1.0) (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler3" 1.0))
                                    (ai_place "e8_fld_inf1/guy10")
                                    (sleep (random_range 30 180))
                                )
                            )
                        )
                        (begin
                            (if (<= (ai_living_count "e8_fld_inf1") 3) 
                                (begin
                                    (if (random_range 0 2) 
                                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler1" 1.0) (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler3" 1.0))
                                    (ai_place "e8_fld_inf1/guy9")
                                    (sleep (random_range 30 180))
                                )
                            )
                        )
                        (begin
                            (if (<= (ai_living_count "e8_fld_inf1") 3) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy8")
                                    (sleep (random_range 30 180))
                                )
                            )
                        )
                        (begin
                            (if (<= (ai_living_count "e8_fld_inf1") 3) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy7")
                                    (sleep (random_range 30 180))
                                )
                            )
                        )
                    )
                ) (begin
                    (begin_random
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy10")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy9")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy8")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy7")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy12")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                    )
                    (sleep_until (<= (ai_strength "e8_fld_inf1") 0.3) 15 450)
                    (begin_random
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy11")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy9")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy8")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy7")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                    )
                    (sleep_until (<= (ai_strength "e8_fld_inf1") 0.5) 15 450)
                    (begin_random
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (if (random_range 0 2) 
                                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler1" 1.0) (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler3" 1.0))
                                    (ai_place "e8_fld_inf1/guy9")
                                    (ai_set_orders "e8_fld_inf1" "e8_fld_inf1_z")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (if (random_range 0 2) 
                                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler1" 1.0) (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e8_howler3" 1.0))
                                    (ai_place "e8_fld_inf1/guy10")
                                    (ai_set_orders "e8_fld_inf1" "e8_fld_inf1_z")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy11")
                                    (ai_set_orders "e8_fld_inf1" "e8_fld_inf1_z")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                        (begin
                            (if (volume_test_objects "tv_e8_cave_check" (players)) 
                                (begin
                                    (ai_place "e8_fld_inf1/guy12")
                                    (ai_set_orders "e8_fld_inf1" "e8_fld_inf1_z")
                                    (sleep (random_range 30 90))
                                )
                            )
                        )
                    )
                )
        )
    )
)

(script dormant void e8_load
    (begin
        (sleep_until (volume_test_objects "tv_e7_trigger2" (players)) 15)
        (data_mine_insert "space_cave2")
        (ai_place "e8_fld_swarm1")
        (ai_place "e8_fld_inf1/guy5")
        (begin_random
            (begin
                (if (<= (ai_living_count "e8_fld_inf1") 2) 
                    (ai_place "e8_fld_inf1/guy1"))
            )
            (begin
                (if (<= (ai_living_count "e8_fld_inf1") 2) 
                    (ai_place "e8_fld_inf1/guy2"))
            )
            (begin
                (if (<= (ai_living_count "e8_fld_inf1") 2) 
                    (ai_place "e8_fld_inf1/guy3"))
            )
            (begin
                (if (<= (ai_living_count "e8_fld_inf1") 2) 
                    (ai_place "e8_fld_inf1/guy4"))
            )
            (begin
                (if (<= (ai_living_count "e8_fld_inf1") 2) 
                    (ai_place "e8_fld_inf1/guy6"))
            )
        )
        (ai_disposable "e6_fld_inf1" true)
        (ai_disposable "e6_fld_inf1_a" true)
        (ai_disposable "e6_fld_inf2_a" true)
        (ai_disposable "e6_fld_inf2_b" true)
        (ai_disposable "e6_fld_inf2_c" true)
        (ai_disposable "e6_fld_inf2_d" true)
        (ai_disposable "e6_fld_inf2_z" true)
        (ai_disposable "e6_fld_inf3" true)
        (ai_disposable "e6_fld_inf4" true)
        (ai_disposable "e6_pro_inf2_a" true)
        (ai_disposable "e6_pro_inf2" true)
        (ai_disposable "e6_pro_inf3" true)
        (ai_disposable "e6_pro_inf3_a" true)
        (wake e8_sneaky_spawner)
        (wake e8_end_open)
        (sleep_until (= g_dialogue_counter 3))
        (if dialogue 
            (print "cortana: the security systems in this part of the tower are particularly robust."))
        (sleep (ai_play_line_on_object none "2760"))
        (set g_dialogue_counter 4)
        (wake music_07b_05_start)
    )
)

(script dormant void e8_main
    (begin
        (sleep_until (volume_test_objects "tv_e7_trigger1" (players)) 15)
        (wake e8_load)
        (wake e9_main)
    )
)

(script dormant void e7_start
    (begin
        (sleep_until (volume_test_objects "tv_e7_trigger1" (players)) 15)
        (data_mine_insert "boobag_garden")
        (game_save_immediate)
        (sleep 6)
        (game_save_no_timeout)
        (wake music_07b_04_stop)
        (sleep_until (= g_dialogue_counter 9))
        (sleep 150)
        (if dialogue 
            (print "cortana: the amount of flood bio-mass is increasing exponentially. there are reports of infestations in every district!"))
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_2860_cor"))
        (sleep dialogue_pause)
        (if dialogue 
            (print "cortana: if the speed of the flood's spread in this tower is any indication, it won't take long for it to overrun the entire city!"))
        (sleep (sound_impulse_start_3d "sound\dialog\levels\07_highcharity\mission\l07_2870_cor"))
        (sleep dialogue_pause)
        (set g_dialogue_counter 3)
    )
)

(script dormant void e7_main
    (begin
        (sleep_until (volume_test_objects "tv_e6_trigger1" (players)) 15)
        (wake e7_start)
        (game_saving)
        (wake e8_main)
        (ai_disposable "e6_fld_inf1" true)
        (ai_disposable "e6_fld_inf1_a" true)
        (ai_disposable "e6_fld_inf2_z" true)
        (ai_disposable "e6_fld_inf2_d" true)
        (ai_disposable "e6_fld_inf2_c" true)
        (ai_disposable "e6_fld_inf2_b" true)
        (ai_disposable "e6_fld_inf2_a" true)
        (ai_disposable "e6_pro_inf2_a" true)
        (ai_disposable "e6_pro_inf2" true)
        (ai_disposable "e6_fld_inf4" true)
        (ai_disposable "e6_fld_inf3" true)
        (ai_disposable "e6_fld_inf5" true)
        (ai_disposable "e6_pro_inf3_a" true)
        (ai_disposable "e6_pro_inf3" true)
    )
)

(script dormant void e6_talking
    (begin
        (sleep_until (volume_test_objects "tv_e6_talkbox" (players)) 15)
        (set g_dialogue_counter 9)
        (if dialogue 
            (print "truth: the parasite did not defeat the forerunners, and it shall not defeat us!"))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0190_pot" "e6_speaker1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0190_pot" "e6_speaker2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0190_pot" "e6_speaker3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0190_pot" "e6_speaker4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_0190_pot" "e6_speaker5" 1.0 1)
        (sleep (ai_play_line_on_object "e6_speaker0" "0190"))
        (sleep 20)
        (if dialogue 
            (print "gravemind: arrogant creature! your deaths will be instantaneous, while we shall suffer the progress of infinitude!"))
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5010_grv" "e6_speaker1" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5010_grv" "e6_speaker2" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5010_grv" "e6_speaker3" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5010_grv" "e6_speaker4" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5010_grv" "e6_speaker5" 1.0 1)
        (sound_impulse_start_cinematic "sound\dialog\levels\07_highcharity\mission\l07_5010_grv" "e6_speaker_gm1" 1.0 1)
        (sleep (ai_play_line_on_object "e6_speaker_gm0" "5010"))
        (wake music_07b_04_start)
    )
)

(script dormant void e6_go_go_go
    (begin
        (sleep_until (volume_test_objects "tv_e6_cave_check" (players)))
        (ai_migrate "e6_flood_group_1" "e6_flood_group_3")
        (sleep 10)
        (ai_migrate "e6_flood_group_2" "e6_flood_group_3")
        (sleep 10)
        (ai_migrate "e6_flood_storm" "e6_flood_group_3")
        (sleep 10)
        (ai_set_orders "e6_flood_group_3" "e6_fld_go_go_go")
        (set g_e6_move_on true)
    )
)

(script dormant void e6_final
    (begin
        (sleep_until (volume_test_objects "tv_e6_final_start" (players)))
        (data_mine_insert "space_cave1")
        (wake e6_talking)
        (wake e6_go_go_go)
        (ai_place "e6_pro_inf3" 2)
        (ai_place "e6_pro_inf3_a" 3)
        (sleep_until (<= (ai_strength "e6_pro_cave1") 0.2) 15 600)
        (if (volume_test_objects "tv_e6_cave_check" (players)) 
            (ai_place "e6_fld_inf5"))
    )
)

(script dormant void e6_ambush
    (begin
        (sleep_until (volume_test_objects "tv_e6_ambusher" (players)))
        (game_save_no_timeout)
        (sleep 15)
        (ai_place "e6_fld_inf3")
        (begin_random
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_storm") 5)
                        (volume_test_objects "tv_e6_ambusher" (players))
                    ) 
                        (begin
                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler_spec1" 1.0)
                            (ai_place "e6_fld_inf4/guy1")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                            (sleep (random_range 90 150))
                            (ai_place "e6_fld_inf4/guy2")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_storm") 5)
                        (volume_test_objects "tv_e6_ambusher" (players))
                    ) 
                        (begin
                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler_spec2" 1.0)
                            (ai_place "e6_fld_inf4/guy4")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                            (sleep (random_range 90 150))
                            (ai_place "e6_fld_inf4/guy5")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_storm") 5)
                        (volume_test_objects "tv_e6_ambusher" (players))
                    ) 
                        (begin
                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler_spec3" 1.0)
                            (ai_place "e6_fld_inf4/guy6")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                            (sleep (random_range 90 150))
                            (ai_place "e6_fld_inf4/guy7")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_storm") 5)
                        (volume_test_objects "tv_e6_ambusher" (players))
                    ) 
                        (begin
                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler_spec4" 1.0)
                            (ai_place "e6_fld_inf4/guy8")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                            (sleep (random_range 90 150))
                            (ai_place "e6_fld_inf4/guy9")
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_storm") 5)
                        (volume_test_objects "tv_e6_ambusher" (players))
                    ) 
                        (begin
                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler_spec4" 1.0)
                            (ai_place "e6_fld_inf2_z/guy1")
                            (sleep 6)
                            (ai_migrate "e6_fld_inf2_z" "e6_fld_inf4")
                            (sleep 6)
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                            (sleep (random_range 90 150))
                            (ai_place "e6_fld_inf2_z/guy2")
                            (sleep 6)
                            (ai_migrate "e6_fld_inf2_z" "e6_fld_inf4")
                            (sleep 6)
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_storm") 5)
                        (volume_test_objects "tv_e6_ambusher" (players))
                    ) 
                        (begin
                            (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler_spec4" 1.0)
                            (ai_place "e6_fld_inf2_z/guy3")
                            (sleep 6)
                            (ai_migrate "e6_fld_inf2_z" "e6_fld_inf4")
                            (sleep 6)
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                            (sleep (random_range 90 150))
                            (ai_place "e6_fld_inf2_z/guy4")
                            (sleep 6)
                            (ai_migrate "e6_fld_inf2_z" "e6_fld_inf4")
                            (sleep 6)
                            (if g_e6_move_on 
                                (ai_set_orders "e6_fld_inf4" "e6_fld_go_go_go"))
                        )
                )
            )
        )
    )
)

(script command_script void e6_cs_attack_the_prophetscd
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_force_combat_status 3)
        (cs_go_by e6_attack/p0 e6_attack/p1)
        (cs_go_by e6_attack/p2 e6_attack/p3)
    )
)

(script command_script void e6_cs_attack_the_prophetsab
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_force_combat_status 3)
        (cs_go_by e6_attack/p4 e6_attack/p5)
        (cs_go_by e6_attack/p2 e6_attack/p3)
    )
)

(script dormant void e6_flood_attack_2
    (begin
        (sleep_until (volume_test_objects "tv_e6_trigger3" (players)))
        (game_saving)
        (data_mine_insert "riptide_ambush")
        (wake e6_ambush)
        (wake e6_final)
        (ai_place "e6_pro_inf2" 2)
        (ai_place "e6_pro_inf2_a" 2)
        (ai_disposable "e5_pro_inf1" true)
        (ai_disposable "e5_pro_bug2_c" true)
        (ai_disposable "e5_fld_inf1" true)
        (ai_disposable "e5_fld_inf2" true)
        (ai_disposable "e5_fld_inf2_z" true)
        (begin_random
            (begin
                (if (<= (ai_living_count "e6_flood_group_2") 0) 
                    (begin
                        (sleep 10)
                        (ai_place "e6_fld_inf2_a")
                        (ai_place "e6_fld_inf2_b")
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler1" 1.0)
                    )
                )
            )
            (begin
                (if (<= (ai_living_count "e6_flood_group_2") 0) 
                    (begin
                        (sleep 10)
                        (ai_place "e6_fld_inf2_c")
                        (ai_place "e6_fld_inf2_d")
                        (sound_impulse_start_effect "sound\characters\flood\flood_howls" "e6_howler2" 1.0)
                    )
                )
            )
        )
        (sleep_until (<= (ai_nonswarm_count "e6_flood_group_2") 1) 10 300)
        (ai_place "e6_fld_inf2_z" 1)
        (sleep_until (<= (ai_nonswarm_count "e6_flood_group_2") 0) 10 450)
        (if (volume_test_objects "tv_e6_infinite2" (players)) 
            (ai_place "e6_fld_inf2_z" 1))
        (sleep_until (<= (ai_nonswarm_count "e6_flood_group_2") 0) 10 450)
        (if (volume_test_objects "tv_e6_infinite2" (players)) 
            (ai_place "e6_fld_inf2_z" 1))
    )
)

(script dormant void e6_infinite_save
    (begin
        (game_saving)
    )
)

(script dormant void e6_flood_attack_1
    (begin
        (sleep_until (<= (ai_living_count "e6_fld_inf1") 0) 15 300)
        (game_save_no_timeout)
        (wake e7_dia_filtration_systems)
        (begin_random
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_group_1") 0)
                        (volume_test_objects "tv_e6_infinite1" (players))
                    ) 
                        (begin
                            (ai_place "e6_fld_inf1_a/guy1")
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_group_1") 0)
                        (volume_test_objects "tv_e6_infinite1" (players))
                    ) 
                        (begin
                            (sleep 10)
                            (ai_place "e6_fld_inf1_a/guy2")
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_group_1") 0)
                        (volume_test_objects "tv_e6_infinite1" (players))
                    ) 
                        (begin
                            (sleep 10)
                            (ai_place "e6_fld_inf1_a/guy3")
                        )
                )
            )
            (begin
                (if 
                    (and
                        (<= (ai_living_count "e6_flood_group_1") 0)
                        (volume_test_objects "tv_e6_infinite1" (players))
                    ) 
                        (begin
                            (sleep 10)
                            (ai_place "e6_fld_inf1_a/guy4")
                        )
                )
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void e6_start
    (begin
        (sleep_until (volume_test_objects "tv_e6_trigger1" (players)) 15)
        (wake chapter_please)
        (wake objective_riptide_set)
        (game_save_immediate)
        (data_mine_insert "riptide_start")
        (game_save_no_timeout)
        (ai_place "e6_fld_inf1" 2)
        (sleep 30)
        (wake music_07b_03_start)
        (wake e6_flood_attack_1)
        (wake e6_flood_attack_2)
    )
)

(script dormant void e6_main
    (begin
        (sleep_until (volume_test_objects "tv_e5_trigger1" (players)) 15)
        (wake e6_start)
        (game_save_no_timeout)
        (wake e7_main)
        (ai_disposable "e5_pro_inf1" true)
        (ai_disposable "e5_fld_inf1" true)
        (ai_disposable "e5_pro_bug1" true)
        (ai_disposable "e5_pro_bug2_c" true)
        (ai_disposable "e5_fld_inf2" true)
        (ai_disposable "e5_fld_inf2_z" true)
    )
)

(script dormant void e5_platform_c
    (begin
        (sleep_until (volume_test_objects "tv_e5_platform_c1" (players)) 15)
        (device_set_position "maus_platform_d" 0.0)
        (sleep_until (<= (device_get_position "maus_platform_d") 0.0) 10)
        (device_set_position_immediate "gravity_bridge_c1" 1.0)
        (device_set_power "gravity_bridge_c1" 1.0)
        (sleep 1)
        (sleep_until (volume_test_objects "tv_e5_platform_c1" (players)) 15)
        (device_set_position "gravity_bridge_c1" 0.0)
        (sleep_until (<= (device_get_position "gravity_bridge_c1") 0.0) 10)
        (device_set_power "gravity_bridge_c1" 0.0)
        (device_set_position_immediate "gravity_bridge_c1" 1.0)
    )
)

(script dormant void e5_platform_b
    (begin
        (sleep_until 
            (begin
                (sleep_until (volume_test_objects "tv_e5_platform_b1" (players)) 15)
                (device_set_position "maus_platform_d" 0.0)
                (sleep_until (<= (device_get_position "maus_platform_d") 0.0) 10)
                (device_set_power "gravity_bridge_b1" 1.0)
                (sleep 30)
                (sleep_until (volume_test_objects "tv_e5_platform_b1" (players)) 15)
                (device_set_position "gravity_bridge_b1" 1.0)
                (sleep_until (>= (device_get_position "gravity_bridge_b1") 1.0) 15)
                (device_set_power "gravity_bridge_b1" 0.0)
                (device_set_position_immediate "gravity_bridge_b1" 0.0)
                (= (version) 2)
            )
        )
    )
)

(script dormant void e5_platform_a2
    (begin
        (sleep_until (volume_test_objects "tv_e5_platform_a2" (players)) 15)
        (device_set_position "maus_platform_c" 0.0)
        (device_set_position_immediate "gravity_bridge_a2" 1.0)
        (sleep_until (<= (device_get_position "maus_platform_c") 0.0) 15)
        (device_set_power "gravity_bridge_a2" 1.0)
        (sleep 1)
        (sleep_until (volume_test_objects "tv_e5_platform_a2" (players)) 15)
        (device_set_position "gravity_bridge_a2" 0.0)
        (sleep_until (<= (device_get_position "gravity_bridge_a2") 0.0) 15)
        (device_set_power "gravity_bridge_a2" 0.0)
        (device_set_position_immediate "gravity_bridge_a2" 1.0)
        (wake e5_platform_c)
    )
)

(script dormant void e5_platform_a1
    (begin
        (sleep_until 
            (begin
                (sleep_until (volume_test_objects "tv_e5_platform_a1" (players)) 15)
                (device_set_power "gravity_bridge_a1" 1.0)
                (sleep 30)
                (sleep_until (volume_test_objects "tv_e5_platform_a1" (players)) 15)
                (device_set_position "gravity_bridge_a1" 1.0)
                (sleep_until (>= (device_get_position "gravity_bridge_a1") 1.0) 15)
                (device_set_power "gravity_bridge_a1" 0.0)
                (device_set_position_immediate "gravity_bridge_a1" 0.0)
                (= (version) 2)
            )
        )
    )
)

(script dormant void e5_platform_begin
    (begin
        (game_save_no_timeout)
        (device_set_power "gravity_bridge_a1" 0.0)
        (device_set_power "gravity_bridge_a2" 0.0)
        (device_set_power "gravity_bridge_b1" 0.0)
        (device_set_power "gravity_bridge_c1" 0.0)
        (device_set_position_immediate "gravity_bridge_a1" 0.0)
        (device_set_position_immediate "gravity_bridge_a2" 1.0)
        (device_set_position_immediate "gravity_bridge_b1" 0.0)
        (device_set_position_immediate "gravity_bridge_c1" 1.0)
        (object_create "lift_effect_b")
        (sleep 1)
        (device_set_position "lift_effect_b" 1.0)
        (objects_attach "maus_platform_b" "lift_effect" "lift_effect_b" "lift_effect")
        (sleep_until (volume_test_objects "tv_e5_platform_start" (players)) 15)
        (device_set_position "maus_platform_a" 0.0)
        (object_create "lift_effect_a")
        (sleep 1)
        (objects_attach "maus_platform_a" "lift_effect" "lift_effect_a" "lift_effect")
        (sleep_until (<= (device_get_position "maus_platform_a") 0.0) 10)
        (device_set_position "lift_effect_a" 1.0)
        (wake e5_platform_a1)
        (wake e5_platform_b)
    )
)

(script command_script void e5_cs_leave
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_force_combat_status 3)
        (cs_go_to e5_leave/p0)
    )
)

(script dormant void e5_infinite_save
    (begin
        (game_saving)
    )
)

(script dormant void e5_fld_inf2_main
    (begin
        (sleep_until (volume_test_objects "tv_e5_trigger3" (players)) 15)
        (if 
            (or
                (difficulty_normal)
                (difficulty_heroic)
            ) 
                (ai_place "e5_fld_inf2" 2) (ai_place "e5_fld_inf2_z"))
        (sleep_until 
            (and
                (<= (ai_living_count "e5_fld_inf2") 0)
                (<= (ai_living_count "e5_fld_inf2_z") 0)
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void e5_start_the_other_fight
    (begin
        (sleep_until (<= (device_get_position "maus_platform_d") 0.0))
        (wake e5_infinite_save)
        (wake e5_fld_inf2_main)
        (sleep_until (volume_test_objects "tv_e5_trigger_chase" (players)))
        (ai_place "e5_pro_bug2_c" (pin (- 5.0 (ai_living_count "e5_buggers")) 0.0 3.0))
        (ai_migrate "e5_pro_bug1" "e5_pro_bug2_c")
        (ai_set_orders "e5_buggers" "e5_pro_bug2_c_attk")
    )
)

(script dormant void e5_bugger_spawner
    (begin
        (sleep_until (<= (ai_living_count "e5_pro_bug1") 2))
        (ai_place "e5_pro_bug2_c")
    )
)

(script dormant void e5_start_the_fight
    (begin
        (sleep_until (volume_test_objects "tv_e5_trigger2" (players)) 15)
        (ai_place "e5_pro_bug1" 6)
        (wake e5_bugger_spawner)
        (ai_place "e5_fld_inf1" 2)
        (sleep_until (<= (ai_living_count "e5_fld_inf1") 0) 15 450)
        (sleep (random_range 30 300))
        (if 
            (and
                (not (volume_test_objects "tv_e5_plat_b" (players)))
                (not (volume_test_objects "tv_e5_plat_c" (players)))
            ) 
                (begin
                    (ai_place "e5_fld_inf1" 3)
                    (sleep_until (<= (ai_living_count "e5_fld_inf1") 0))
                    (sleep (random_range 30 150))
                )
        )
        (if 
            (and
                (not (volume_test_objects "tv_e5_plat_b" (players)))
                (not (volume_test_objects "tv_e5_plat_c" (players)))
            ) 
                (begin
                    (ai_place "e5_fld_inf1" 3)
                )
        )
        (sleep_until (<= (ai_living_count "e5_fld_inf1") 0) 15 450)
        (ai_set_orders "e5_pro_inf1" "e5_pro_inf1_leave")
        (ai_set_orders "e5_fld_inf1" "e5_pro_inf1_leave")
        (sleep 150)
        (ai_set_orders "e5_buggers" "e5_pro_bug1_attk_player")
    )
)

(script dormant void e5_talking_points
    (begin
        (wake e1_dia_truth_holycity)
        (sleep 600)
        (if dialogue 
            (print "cortana: i'll do what i can to slow the launch sequence, but there's something inside the ship... a presence... that's fighting back."))
        (sleep (ai_play_line_on_object none "2740"))
        (sleep (* dialogue_pause 3.0))
        (if dialogue 
            (print "cortana: for a covenant construct it's unusually formidable."))
        (sleep (ai_play_line_on_object none "2750"))
        (sleep (* dialogue_pause 5.0))
        (if (volume_test_objects "tv_e5_trigger1" (players)) 
            (wake e5_dia_get_to_conduit))
    )
)

(script dormant void e5_start
    (begin
        (sleep_until (volume_test_objects "tv_e5_trigger1" (players)) 15)
        (device_set_position_immediate "maus_platform_a" 1.0)
        (device_set_position_immediate "maus_platform_d" 1.0)
        (data_mine_insert "plasma_chandelier")
        (game_save_no_timeout)
        (wake e5_platform_begin)
        (wake e5_start_the_fight)
        (wake e5_start_the_other_fight)
        (wake e5_talking_points)
        (ai_place "e5_pro_inf1")
    )
)

(script dormant void e5_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_trigger2" (players)) 15)
        (sleep_until (volume_test_objects "tv_e2_trigger1" (players)) 15)
        (wake e5_start)
        (wake e6_main)
        (ai_disposable "e1_fld_inf1" true)
        (ai_disposable "e1_pro_inf1" true)
        (ai_disposable "e1_fld_gitem1" true)
        (ai_disposable "e1_fld_gitem2" true)
        (ai_disposable "e1_pro_inf2" true)
        (ai_disposable "e1_fld_inf2" true)
        (ai_disposable "e1_fld_inf5" true)
        (ai_disposable "e1_pro_inf3" true)
        (ai_disposable "e1_fld_inf3" true)
    )
)

(script dormant void e2_cortana_intro
    (begin
        (sleep_until (volume_test_objects "tv_e2_trigger1" (players)) 15)
        (game_save_immediate)
        (sleep 6)
        (game_saving)
        (sleep 150)
        (if dialogue 
            (print "cortana: i'll disable this lift once you reach the top. that'll slow them down... i hope!"))
        (sleep (ai_play_line_on_object none "2720"))
        (wake objective_enter_clear)
        (ai_disposable "e1_fld_inf1" true)
        (ai_disposable "e1_fld_inf2" true)
        (ai_disposable "e1_fld_inf3" true)
        (ai_disposable "e1_fld_inf4" true)
        (ai_disposable "e1_fld_inf5" true)
        (ai_disposable "e1_pro_inf1" true)
        (ai_disposable "e1_pro_inf2" true)
        (ai_disposable "e1_pro_inf3" true)
    )
)

(script command_script void e1_cs_gitem1
    (begin
        (ai_set_blind ai_current_actor true)
        (ai_set_deaf ai_current_actor true)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_by gitem1/p1 gitem1/p2)
        (ai_set_blind ai_current_actor false)
        (ai_set_deaf ai_current_actor false)
    )
)

(script command_script void e1_cs_gitem2
    (begin
        (ai_set_blind ai_current_actor true)
        (ai_set_deaf ai_current_actor true)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_by gitem2/p1 gitem2/p2)
        (ai_set_blind ai_current_actor false)
        (ai_set_deaf ai_current_actor false)
    )
)

(script command_script void e1_cs_freakout
    (begin
        (cs_movement_mode ai_movement_flee)
        (sleep_until 
            (begin
                (begin_random
                    (cs_go_to e1_panic/p0)
                    (cs_go_to e1_panic/p1)
                    (cs_go_to e1_panic/p2)
                    (cs_go_to e1_panic/p3)
                    (cs_go_to e1_panic/p4)
                    (cs_go_to e1_panic/p5)
                )
                true
            )
        )
    )
)

(script command_script void e1_cs_teleport1
    (begin
        (cs_teleport e1_drops/p1a e1_drops/p1b)
    )
)

(script command_script void e1_cs_teleport2
    (begin
        (cs_teleport e1_drops/p2a e1_drops/p2b)
    )
)

(script command_script void e1_cs_pelican2
    (begin
        (cs_fly_by pelican2/p0)
        (set g_e1_talk 3)
        (set g_e1_pelican2_entering true)
        (cs_fly_by pelican2/p1)
        (cs_fly_by pelican2/p2)
        (cs_fly_by pelican2/p3)
        (ai_erase "e1_cs_pelican2")
    )
)

(script dormant void e1_carrier_drop
    (begin
        (object_set_velocity (ai_get_object "e1_fld_inf3/carrier0") -5.0 0.0 0.0)
        (object_set_velocity (ai_get_object "e1_fld_inf3/carrier1") -4.0 0.0 0.0)
        (sleep 30)
        (unit_set_current_vitality (ai_get_unit "e1_fld_inf3/carrier0") 0.1 0.0)
        (unit_set_current_vitality (ai_get_unit "e1_fld_inf3/carrier1") 0.1 0.0)
    )
)

(script command_script void e1_cs_pelican1
    (begin
        (ai_place "e1_fld_inf3/carrier0")
        (ai_place "e1_fld_inf3/carrier1")
        (sleep 1)
        (objects_attach (ai_vehicle_get ai_current_actor) "chief_rear" (ai_get_object "e1_fld_inf3/carrier0") "")
        (objects_attach (ai_vehicle_get ai_current_actor) "pelican_e" (ai_get_object "e1_fld_inf3/carrier1") "")
        (cs_fly_by pelican1/p0)
        (set g_e1_talk 1)
        (set g_e1_pelican1_entering true)
        (cs_fly_by pelican1/p3)
        (objects_detach (ai_vehicle_get ai_current_actor) (ai_get_object "e1_fld_inf3/carrier0"))
        (objects_detach (ai_vehicle_get ai_current_actor) (ai_get_object "e1_fld_inf3/carrier1"))
        (sleep 1)
        (wake e1_carrier_drop)
        (set g_e1_talk 2)
        (set g_e1_pelican1_unloaded true)
        (cs_fly_by pelican1/p4)
        (cs_fly_by pelican1/p5)
        (ai_erase "e1_cs_pelican1")
    )
)

(script dormant void e1_infinite_save
    (begin
        (game_saving)
    )
)

(script dormant void e1_pro_inf3_place
    (begin
        (sleep_until (volume_test_objects "tv_e1_trigger4" (players)) 15)
        (data_mine_insert "turbolift_base")
        (wake e1_infinite_save)
        (ai_place "e1_pro_inf3")
        (sleep_until (= g_dialogue_counter 1))
        (set g_e1_talk 4)
        (set g_e1_pro_inf3_spawned true)
        (sleep 150)
        (set g_e1_talk 5)
        (sleep 150)
        (set g_e1_talk 6)
        (set g_dialogue_counter 2)
        (if 
            (or
                (difficulty_normal)
                (difficulty_heroic)
            ) 
                (begin
                    (sleep 450)
                    (if 
                        (or
                            (volume_test_objects_all "tv_e1_trigger2" (players))
                            (volume_test_objects_all "tv_e1_trigger4" (players))
                        ) 
                            (ai_place "e1_fld_inf5" (pin (- 8.0 (ai_living_count "e1_flood_master")) 0.0 5.0)))
                ) (begin
                    (sleep 150)
                    (if 
                        (or
                            (volume_test_objects_all "tv_e1_trigger2" (players))
                            (volume_test_objects_all "tv_e1_trigger4" (players))
                        ) 
                            (ai_place "e1_fld_inf5" (pin (- 8.0 (ai_living_count "e1_flood_master")) 0.0 5.0)))
                    (sleep 150)
                    (if 
                        (or
                            (volume_test_objects_all "tv_e1_trigger2" (players))
                            (volume_test_objects_all "tv_e1_trigger4" (players))
                        ) 
                            (ai_place "e1_fld_inf5" (pin (- 8.0 (ai_living_count "e1_flood_master")) 0.0 5.0)))
                )
        )
    )
)

(script command_script void run_grunt_run
    (begin
        (cs_movement_mode ai_movement_flee)
        (cs_go_to_nearest gitem1)
    )
)

(script dormant void e1_exterior_checkpoint
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e1_trigger4" (players))
                (and
                    (<= (ai_nonswarm_count "e1_fld_inf1") 0)
                    (<= (ai_nonswarm_count "e1_fld_inf2") 0)
                    (<= (ai_nonswarm_count "e1_pro_inf1") 0)
                    (<= (ai_nonswarm_count "e1_pro_inf2") 0)
                )
            ) 
        15)
        (game_saving)
    )
)

(script dormant void e1_pro_inf2_place
    (begin
        (sleep_until (volume_test_objects "tv_e1_trigger2" (players)) 15)
        (ai_place "e1_pro_inf2" 2)
        (ai_place "e1_fld_inf2" 1)
        (if (difficulty_legendary) 
            (begin_random
                (begin
                    (if (<= (ai_living_count "e1_flood_master") 5) 
                        (ai_place "e1_fld_inf1/guy2"))
                )
                (begin
                    (if (<= (ai_living_count "e1_flood_master") 5) 
                        (ai_place "e1_fld_inf1/guy3"))
                )
                (begin
                    (if (<= (ai_living_count "e1_flood_master") 5) 
                        (ai_place "e1_fld_inf1/guy4"))
                )
                (begin
                    (if (<= (ai_living_count "e1_flood_master") 5) 
                        (ai_place "e1_fld_inf1/guy5"))
                )
            )
        )
        (wake e1_exterior_checkpoint)
        (wake e1_pro_inf3_place)
    )
)

(script dormant void e1_gitem_2
    (begin
        (sleep_until (volume_test_objects "tv_e1_gitem2" (players)) 15)
        (set g_e1_git_check true)
        (begin_random
            (begin
                (ai_place "e1_fld_gitem2/guy1")
                (sleep 90)
            )
            (begin
                (ai_place "e1_fld_gitem2/guy2")
                (sleep 90)
            )
        )
    )
)

(script dormant void e1_gitem_1
    (begin
        (sleep_until (volume_test_objects "tv_e1_gitem1" (players)) 15)
        (if (not g_e1_git_check) 
            (begin
                (begin_random
                    (begin
                        (ai_place "e1_fld_gitem1/guy1")
                        (sleep 90)
                    )
                    (begin
                        (ai_place "e1_fld_gitem1/guy2")
                        (sleep 90)
                    )
                )
            )
        )
        (sleep_forever e1_gitem_2)
    )
)

(script dormant void e1_talking_points
    (begin
        (sleep_until g_e1_pelican1_entering 15 450)
        (if dialogue 
            (print "cortana: flood-controlled dropships are touching down all over the city!"))
        (sleep (ai_play_line_on_object none "2680"))
        (wake music_07b_01_start)
        (sleep 25)
        (if dialogue 
            (print "cortana: that creature beneath the library; that gravemind, used us! we were just a diversion. in amber clad was always it's intended vector!"))
        (sleep (ai_play_line_on_object none "2690"))
        (game_save_no_timeout)
        (sleep_until 
            (or
                g_e1_pelican2_entering
                (volume_test_objects "tv_e1_trigger4" (players))
            ) 
        15 450)
        (sleep 25)
        (if dialogue 
            (print "cortana: there's a conduit connecting this tower to the ship. head back inside. i'll lead you to it."))
        (sleep (ai_play_line_on_object none "2710"))
        (game_save_no_timeout)
        (wake objective_enter_set)
        (wake music_07b_01_stop)
        (wake music_07b_02_start)
        (set g_dialogue_counter 1)
        (sleep_until g_e1_pro_inf3_spawned 15)
        (sleep 150)
        (sleep_until (volume_test_objects "tv_e1_trigger2" (players)) 15)
        (if dialogue 
            (print "cortana: we don't have time for this chief. truth's phantom is nearning the forerunner ship!"))
        (sleep (ai_play_line_on_object none "2700"))
        (if (volume_test_objects_all "tv_e1_ledge_check" (players)) 
            (wake music_07b_02_start))
    )
)

(script dormant void e1_flashlight_training
    (begin
        (sleep_until (volume_test_objects "tv_e1_trigger5" (players)) 15)
        (sleep_until (game_all_quiet))
        (player_training_activate_stealth)
    )
)

(script dormant void e1_mercy
    (begin
        (object_create_anew "ledge_99")
        (sleep 10)
        (scenery_animation_start_loop "ledge_99" "objects\characters\prophet\prophet" "mercy_dead")
    )
)

(script dormant void e1_main
    (begin
        (game_save_no_timeout)
        (data_mine_insert "phantom_ledge")
        (object_create_containing "ledge")
        (wake e1_pro_inf2_place)
        (wake e1_talking_points)
        (wake e1_gitem_1)
        (wake e1_gitem_2)
        (wake e1_flashlight_training)
        (wake e1_mercy)
        (wake e5_main)
        (wake e2_cortana_intro)
        (ai_place "e1_pro_inf1")
        (sleep 6)
        (units_set_current_vitality (ai_actors "e1_pro_inf1") 100.0 0.0)
        (ai_place "e1_fld_inf1" 4)
        (ai_place "e1_cs_pelican1/pilot")
        (sleep 6)
        (cs_run_command_script "e1_cs_pelican1/pilot" e1_cs_pelican1)
        (sleep 180)
        (ai_place "e1_cs_pelican2/pilot")
        (sleep 6)
        (cs_run_command_script "e1_cs_pelican2/pilot" e1_cs_pelican2)
    )
)

(script dormant void mission_start
    (begin
        (structure_bsp_index 0)
        (cinematic_snap_to_white)
        (if (= g_play_cinematics true) 
            (begin
                (if (cinematic_skip_start) 
                    (begin
                        (object_destroy "ledge_1")
                        (object_destroy "ledge_97")
                        (object_destroy "ledge_98")
                        (object_destroy "ledge_99")
                        (print "c07_intra1")
                        (c07_intra1)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (ui_error_ok_cancel)
        (sound_class_enable_ducker "amb" 0.0 0)
        (sleep 1)
        (sound_class_enable_ducker "amb" 1.0 15)
        (sleep 2)
        (object_teleport (player0) "player0_start")
        (object_teleport (player1) "player1_start")
        (wake e1_main)
        (sleep 10)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white_bars)
        (wake chapter_purposes)
        (sleep_until (volume_test_objects "tv_e12_end" (players)) 16)
        (object_cannot_take_damage (players))
        (cinematic_fade_to_white)
        (ai_erase_all)
        (object_teleport (player0) "player0_end")
        (object_teleport (player1) "player1_end")
        (object_hide (player0) true)
        (object_hide (player1) true)
        (sleep 15)
        (wake objective_exit_clear)
        (if (= g_play_cinematics true) 
            (begin
                (if (cinematic_skip_start) 
                    (begin
                        (print "c07_outro")
                        (c07_outro)
                    )
                )
                (cinematic_skip_stop)
            )
        )
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
        (game_save_unsafe true)
        (if (> (player_count) 0) 
            (start))
    )
)

(script command_script void cinematic_fld_inf0_0
    (begin
        (cs_movement_mode ai_movement_combat)
        (cs_enable_pathfinding_failsafe true)
        (sleep 1)
        (object_set_velocity (ai_get_object ai_current_actor) 4.0 0.0 1.5)
        (cs_go_to cinematic_fld_inf0/p0)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cinematic_fld_inf0_1
    (begin
        (cs_movement_mode ai_movement_combat)
        (cs_enable_pathfinding_failsafe true)
        (sleep 1)
        (object_set_velocity (ai_get_object ai_current_actor) 4.0 0.0 1.0)
        (cs_go_to cinematic_fld_inf0/p1)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cinematic_fld_inf1_0
    (begin
        (cs_movement_mode ai_movement_combat)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to cinematic_fld_inf0/p2)
        (ai_erase ai_current_actor)
    )
)

(script dormant void 07_intra1_05_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 1 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 false)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\fp_covenant_carbine\fp_covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_hallway_signs\holo_hallway_signs" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
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
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 19 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 0 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 1 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 6)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\civilian_cov_crate\civilian_cov_crate" 0)
        (sleep 25)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (sleep 10)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 4 true)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (sleep 4)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 13 true)
        (sleep 6)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 0)
        (sleep 7)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (sleep 51)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 true)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 2)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 2)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\civilian_cov_crate\civilian_cov_crate" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 26)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (sleep 103)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 0)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (sleep 46)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
    )
)

(script dormant void 07_intra1_06_predict
    (begin
        (sleep 5)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 0 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (sleep 119)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 true)
        (predict_lightmap_bucket "objects\characters\flood_infection\flood_infection" 2)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 154)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (sleep 121)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 0 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 0)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 160)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (sleep 10)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 3)
        (sleep 53)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
    )
)

(script dormant void 07_intra1_07_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (sleep 239)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 14 true)
        (sleep 26)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 215)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 3 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 0)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 3)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\civilian_cov_crate\civilian_cov_crate" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 104)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 118)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 7 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 0)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 3)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 45)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 14 true)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
    )
)

(script dormant void 07_intra1_08_predict
    (begin
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 3)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 1)
        (sleep 8)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 5 true)
        (sleep 50)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 13 true)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 6)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 11 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 8 true)
        (sleep 6)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (sleep 15)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 18 false)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 1)
        (sleep 7)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (sleep 8)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 0 true)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 1)
        (sleep 24)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\07a_highcharity\high_5 12 true)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 14)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 15)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 16)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 17)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 18)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 19)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 20)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 21)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 24)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 25)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 8)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 13)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 22)
        (sleep 31)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 31)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 32)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 33)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 34)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 36)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 37)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 38)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 41)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 42)
        (sleep 14)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 1)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 2)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 3)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 4)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 5)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 6)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 7)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 8)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 11)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 12)
    )
)

(script dormant void 07_outro_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 1)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\civilian_cov_crate\civilian_cov_crate" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 14)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 16)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 17)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 19)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 20)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_shipping_crate\high_shipping_crate" 3)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 0)
        (predict_lightmap_bucket "objects\characters\floodcombat_human\floodcombat_human" 0)
        (predict_lightmap_bucket "objects\characters\floodcombat_human\floodcombat_human" 1)
        (predict_lightmap_bucket "objects\characters\floodcombat_human\floodcombat_human" 2)
        (predict_lightmap_bucket "objects\characters\floodcombat_human\floodcombat_human" 3)
        (predict_lightmap_bucket "objects\characters\floodcombat_human\floodcombat_human" 4)
        (predict_lightmap_bucket "objects\characters\floodcombat_human\floodcombat_human" 5)
        (predict_lightmap_bucket "objects\characters\floodcombat_human\floodcombat_human" 6)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 0)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 9)
        (predict_lightmap_bucket "objects\characters\floodcombat_elite\floodcombat_elite" 10)
        (predict_lightmap_bucket "objects\weapons\pistol\magnum\magnum" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 1)
        (predict_lightmap_bucket "objects\characters\brute\brute" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 25)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 3)
        (predict_lightmap_bucket "objects\characters\brute\brute" 14)
        (predict_lightmap_bucket "objects\weapons\rifle\brute_plasma_rifle\brute_plasma_rifle" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\brute_plasma_rifle\brute_plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_sack\flood_sack" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_clump\flood_clump" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_floor_clump_large\flood_floor_clump_large" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_pod\flood_pod" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\fp_covenant_carbine\fp_covenant_carbine" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 2)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 3)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 5)
        (predict_lightmap_bucket "objects\vehicles\pelican\crashed\crashed" 6)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_tentacle_c\flood_tentacle_c" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_tentacle_b\flood_tentacle_b" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_tentacle_a\flood_tentacle_a" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 2)
        (predict_lightmap_bucket "objects\characters\floodcarrier\floodcarrier" 0)
        (predict_lightmap_bucket "objects\characters\floodcarrier\floodcarrier" 1)
        (predict_lightmap_bucket "objects\characters\floodcarrier\floodcarrier" 2)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 1 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 4 true)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\sky_high_cinematic\sky_high_cinematic" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\sky_high_cinematic\sky_high_cinematic" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\sky_high_cinematic\sky_high_cinematic" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\sky_high_cinematic\sky_high_cinematic" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\sky_high_cinematic\sky_high_cinematic" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\sky_high_cinematic\sky_high_cinematic" 5)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "objects\cinematics\covenant\conduit\conduit" 0)
        (sleep 7)
        (predict_lightmap_bucket "objects\cinematics\covenant\conduit_ring\conduit_ring" 0)
    )
)

(script dormant void 07_outro_02_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 14 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 9 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 13 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 16 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 4 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 17 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 3 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 22 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 20 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 5 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 6 false)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 4 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 14 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 17 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 18 true)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\civilian_cov_crate\civilian_cov_crate" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (predict_lightmap_bucket "scenarios\objects\special\bloom_quad\bloom_quad" 0)
        (predict_lightmap_bucket "objects\cinematics\covenant\conduit_ring\conduit_ring" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 59)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 0)
        (sleep 20)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\special\bloom_quad\bloom_quad" 0)
        (predict_lightmap_bucket "objects\cinematics\forerunner\forerunner_ship\forerunner_ship" 0)
        (sleep 142)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 4 true)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (predict_lightmap_bucket "objects\cinematics\covenant\conduit_ring\conduit_ring" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 49)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 0 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 1 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 6 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 7 true)
        (predict_bitmap scenarios\solo\07b_forerunnership\high_9_cinematic 8 true)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\civilian_cov_crate\civilian_cov_crate" 0)
        (predict_lightmap_bucket "objects\cinematics\forerunner\forerunner_ship\forerunner_ship" 0)
        (predict_lightmap_bucket "scenarios\objects\special\bloom_quad\bloom_quad" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
    )
)

(script dormant void 07_outro_03_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\substance_space\substance_space" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_exterior\high_charity_exterior" 0)
        (predict_lightmap_bucket "scenarios\skies\generic\space\space" 0)
        (sleep 160)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
    )
)

