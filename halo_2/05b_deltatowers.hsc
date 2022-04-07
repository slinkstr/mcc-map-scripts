; Decompiled with Blamite
; Source file: 05b_deltatowers.hsc
; Start time: 4/7/2022 7:17:17
; Decompilation finished in ~0.005025s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 60)
(global boolean tower1_holo_trans false)
(global boolean tower1_holo_chant true)
(global short bridges_sniper_count 3)
(global boolean miranda_pel_comment_done false)
(global boolean central_plat_pel_arrives false)
(global real gondola_01_wake_state 0.0)
(global real gondola_01_state 0.0)
(global effect splashy "effects\scenarios\solo\deltatemple\elevator_splash")
(global boolean tower3_cortana_cont false)
(global boolean tower3_done_blabbing false)
(global boolean elev_under_scene_gone false)
(global boolean sunken_holo_trans false)
(global boolean sunken_holo_chant true)
(global short sunken_sniper_total 2)
(global short sunken_hg_total 1)
(global short sunken_jacks_total 2)
(global boolean sunken_save_again false)
(global boolean island_holo_trans false)
(global boolean island_holo_chant true)
(global boolean island_pelican_arrived false)
(global real gondola_02_wake_state 0.0)
(global real gondola_02_state 0.0)
(global boolean bossfight_chatter true)
(global boolean regret_dead false)
(global short regret_times_dead 0)
(global short hg_count 2)
(global short hg_delay 600)
(global object regret_corpse none)
(global object regret_throne none)
(global effect regret_teleport "effects\gameplay\regret_teleport")
(global effect regret_blood "effects\contact\collision\blood_aoe\blood_aoe_human")
(global short regret_lives 0)


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

(script static void 05_intra1_01_predict_stub
    (begin
        (wake 05_intra1_01_predict)
    )
)

(script static void 05_intra1_02_predict_stub
    (begin
        (wake 05_intra1_02_predict)
        (print "just started 02 predict")
    )
)

(script static void 05_intra1_03_predict_stub
    (begin
        (wake 05_intra1_03_predict)
    )
)

(script static void 05_intra2_01_predict_stub
    (begin
        (wake 05_intra2_01_predict)
    )
)

(script static void 05_outro_01_predict_stub
    (begin
        (wake 05_outro_01_predict)
    )
)

(script static void 05_outro_02_predict_stub
    (begin
        (wake 05_outro_02_predict)
    )
)

(script static void 05_outro_03_predict_stub
    (begin
        (wake 05_outro_03_predict)
    )
)

(script static void 05_outro_04_predict_stub
    (begin
        (wake 05_outro_04_predict)
    )
)

(script static void 05_outro_05_predict_stub
    (begin
        (wake 05_outro_05_predict)
    )
)

(script dormant void c05_intra1_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intra1\music\c05_intra1_02_mus" none 1.0)
        (print "c05_intra1 score 01 start")
    )
)

(script dormant void c05_intra1_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intra1\foley\c05_intra1_01_fol" none 1.0)
        (print "c05_intra1 foley 01 start")
    )
)

(script dormant void c05_2010_cor
    (begin
        (sleep 17)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2010_cor" none 1.0)
        (attract_mode_set_seconds "c05_2010_cor" 1.0)
    )
)

(script dormant void c05_2020_cor
    (begin
        (sleep 135)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2020_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c05_2020_cor" 1.0)
        (unit_set_emotional_state "cortana" "angry" 0.5 60)
        (print "cortana - angry .5 60")
    )
)

(script dormant void c05_2030_cor
    (begin
        (sleep 200)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2030_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c05_2030_cor" 3.0)
    )
)

(script dormant void c05_2040_mas
    (begin
        (sleep 299)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2040_mas" "chief" 1.0)
        (attract_mode_set_seconds "c05_2040_mas" 1.0)
    )
)

(script dormant void c05_2050_por
    (begin
        (sleep 357)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2050_por" "regret" 1.0)
        (attract_mode_set_seconds "c05_2050_por" 8.0)
    )
)

(script dormant void c05_2060_cor
    (begin
        (sleep 553)
        (unit_set_emotional_state "cortana" "annoyed" 0.25 60)
        (print "cortana - annoyed .25 60")
        (sleep 30)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2060_cor" "cortana" 1.0)
        (attract_mode_set_seconds "c05_2060_cor" 1.0)
    )
)

(script dormant void c05_2070_mas
    (begin
        (sleep 622)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2070_mas" "chief" 1.0)
        (attract_mode_set_seconds "c05_2070_mas" 2.0)
    )
)

(script dormant void c05_2080_mir
    (begin
        (sleep 678)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\c05_2080_mir" none 1.0 "radio_default_in")
        (attract_mode_set_seconds "c05_2080_mir" 1.0)
    )
)

(script dormant void cortana_appear
    (begin
        (sleep 98)
        (print "cortana appears")
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off" "cortana_base" "marker")
    )
)

(script dormant void c05_intra1_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light -38.0 310.0 0.180392 0.160784 0.113725)
        (cinematic_lighting_set_secondary_light -46.0 162.0 0.458824 0.466667 0.74902)
        (cinematic_lighting_set_ambient_light 0.0823529 0.0470588 0.00784314)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "cortana" true)
        (object_uses_cinematic_lighting "regret" true)
    )
)

(script static void c05_intra1_02_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "miranda")
        (object_create_anew "johnson")
        (object_create_anew "pilot")
        (object_create_anew "pelican_01")
        (object_create_anew "holo_index")
        (object_create_anew "iac_bridge")
        (object_create_anew "matte_horizon")
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "pilot" true)
        (object_cinematic_lod "pelican_01" true)
        (object_cinematic_lod "holo_index" true)
        (object_cinematic_lod "iac_bridge" true)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "iac_bridge" true)
        (object_hide "johnson" true)
        (object_hide "pilot" true)
        (object_hide "pelican_01" true)
        (object_hide "matte_horizon" true)
    )
)

(script static void c05_intra1_01_setup
    (begin
        (object_create_anew "chief")
        (object_create_anew "cortana")
        (object_create_anew "regret")
        (object_create_anew "throne_regret")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "cortana" true)
        (object_cinematic_lod "regret" true)
        (object_cinematic_lod "throne_regret" true)
        (ice_cream_flavor_stock "chief" "right_hand" "")
        (objects_attach "regret" "driver" "throne_regret" "driver_cinematic")
        (wake c05_2010_cor)
        (wake c05_2020_cor)
        (wake c05_2030_cor)
        (wake c05_2040_mas)
        (wake c05_2050_por)
        (wake c05_2060_cor)
        (wake c05_2070_mas)
        (wake c05_2080_mir)
        (wake c05_intra1_score_01)
        (wake c05_intra1_foley_01)
        (wake cortana_appear)
        (wake c05_intra1_cinematic_light_01)
        (cinematic_set_environment_map_attenuation 0.05)
    )
)

(script static void c05_intra1_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "deltatowers_intra1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (05_intra1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intra1\music\c05_intra1_02_mus")
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intra1\foley\c05_intra1_01_fol")
        (sleep prediction_offset)
        (c05_intra1_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_intra1\05_intra1" "05_intra1_01" none "anchor_flag_intra1a")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_intra1\05_intra1" "chief_01" false "anchor_intra1a")
        (custom_animation_relative "regret" "objects\characters\prophet\05_intra1\05_intra1" "regret_01" false "anchor_intra1a")
        (sleep 5)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep 94)
        (custom_animation_relative "cortana" "objects\characters\cortana\05_intra1\05_intra1" "cortana_01" false "anchor_intra1a")
        (sleep (- (camera_set_pan) prediction_offset))
        (05_intra1_02_predict_stub)
        (c05_intra1_02_problem_actors)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intra1\foley\c05_intra1_02_fol")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
    )
)

(script dormant void c05_intra1_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intra1\foley\c05_intra1_02_fol" none 1.0)
        (print "c05_intra1 foley 02 start")
    )
)

(script dormant void c05_2090_mir
    (begin
        (unit_set_emotional_state "miranda" "pensive" 0.5 0)
        (print "miranda - pensive .5 0")
        (sleep 7)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2090_mir" "miranda" 1.0)
        (attract_mode_set_seconds "c05_2090_mir" 5.0)
    )
)

(script dormant void c05_2100_mir
    (begin
        (sleep 162)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2100_mir" "miranda" 1.0)
        (attract_mode_set_seconds "c05_2100_mir" 7.0)
    )
)

(script dormant void c05_2110_jon
    (begin
        (sleep 373)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\c05_2110_jon" "johnson" 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c05_2110_jon" 3.0)
    )
)

(script dormant void c05_2120_mir
    (begin
        (sleep 455)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2120_mir" "miranda" 1.0)
        (attract_mode_set_seconds "c05_2120_mir" 2.0)
    )
)

(script dormant void c05_2130_mir
    (begin
        (sleep 509)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_2130_mir" "miranda" 1.0)
        (attract_mode_set_seconds "c05_2130_mir" 2.0)
        (texture_camera_off)
        (sleep 45)
        (unit_set_emotional_state "miranda" "angry" 0.25 60)
        (print "miranda - angry .25 60")
    )
)

(script dormant void c05_2140_jon
    (begin
        (sleep 574)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\c05_2140_jon" "johnson" 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c05_2140_jon" 1.0)
    )
)

(script dormant void intra1_texture_camera_on
    (begin
        (object_create_anew "texture_camera")
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\05_intra1\05_intra1" "texture_camera_02" "anchor_intra1b")
        (sleep 150)
        (print "texture camera on")
        (texture_camera_set_object_marker "texture_camera" "marker" 50.0)
        (object_hide "johnson" false)
        (object_hide "pilot" false)
        (object_hide "pelican_01" false)
        (object_hide "matte_horizon" false)
    )
)

(script dormant void c05_intra1_cinematic_light_02
    (begin
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -14.0 150.0 0.09 0.09 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "iac_bridge" true)
        (object_uses_cinematic_lighting "johnson" true)
        (object_uses_cinematic_lighting "pilot" true)
        (object_uses_cinematic_lighting "index" true)
        (object_uses_cinematic_lighting "pelican_01" true)
    )
)

(script static void c05_intra1_02_setup
    (begin
        (object_create_anew "holo_library")
        (object_create_anew "matte_horizon")
        (object_cinematic_lod "holo_library" true)
        (wake c05_2090_mir)
        (wake c05_2100_mir)
        (wake c05_2110_jon)
        (wake c05_2120_mir)
        (wake c05_2130_mir)
        (wake c05_2140_jon)
        (wake c05_intra1_foley_02)
        (wake intra1_texture_camera_on)
        (wake c05_intra1_cinematic_light_02)
    )
)

(script static void c05_intra1_02_cleanup
    (begin
        (object_destroy "miranda")
        (object_destroy "johnson")
        (object_destroy "pilot")
        (object_destroy "holo_index")
        (object_destroy "holo_library")
        (object_destroy "pelican_01")
        (object_destroy "iac_bridge")
        (object_destroy "texture_camera")
        (object_destroy "matte_horizon")
    )
)

(script static void c05_intra1_scene_02
    (begin
        (c05_intra1_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_intra1\05_intra1" "05_intra1_02" none "anchor_flag_intra1b")
        (custom_animation_relative "miranda" "objects\characters\miranda\05_intra1\05_intra1" "miranda_02" false "anchor_intra1b")
        (custom_animation_relative "johnson" "objects\characters\marine\05_intra1\05_intra1" "johnson_02" false "anchor_intra1b")
        (custom_animation_relative "pilot" "objects\characters\marine\05_intra1\05_intra1" "marine01_02" false "anchor_intra1b")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\05_intra1\05_intra1" "bridge_02" "anchor_intra1b")
        (scenery_animation_start_relative "holo_index" "objects\cinematics\forerunner\index_holo_human\05_intra1\05_intra1" "index_holo_human_02" "anchor_intra1b")
        (scenery_animation_start_relative "holo_library" "objects\cinematics\forerunner\mount_doom_holo\05_intra1\05_intra1" "mount_doom_holo_02" "anchor_intra1b")
        (scenery_animation_start_relative "matte_horizon" "objects\cinematics\matte_paintings\delta_horizon\05_intra1\05_intra1" "delta_horizon_02" "anchor_intra1b")
        (custom_animation_relative "pelican_01" "objects\vehicles\pelican\05_intra1\05_intra1" "pelican_02" false "anchor_intra1b")
        (sleep 30)
        (cinematic_start 1.0 1.0 1.0 5)
        (sleep (- (camera_set_pan) prediction_offset))
        (05_intra1_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intra1\foley\c05_intra1_03_fol")
        (sleep (camera_set_pan))
        (c05_intra1_02_cleanup)
    )
)

(script dormant void c05_intra1_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intra1\foley\c05_intra1_03_fol" none 1.0)
        (print "c05_intra1 foley 03 start")
    )
)

(script dormant void c05_2150_mir
    (begin
        (unit_set_emotional_state "cortana" "angry" 0.5 0)
        (print "cortana - angry .5 0")
        (sleep 0)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\c05_2150_mir" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "c05_2150_mir" 3.0)
    )
)

(script dormant void c05_2160_mir
    (begin
        (sleep 99)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\c05_2160_mir" none 1.0 "radio_default_out")
        (attract_mode_set_seconds "c05_2160_mir" 2.0)
    )
)

(script dormant void cortana_disappear
    (begin
        (sleep 35)
        (print "cortana disappears")
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off" "cortana_base" "marker")
    )
)

(script dormant void c05_intra1_cinematic_light_03
    (begin
        (cinematic_lighting_set_primary_light -38.0 310.0 0.180392 0.160784 0.113725)
        (cinematic_lighting_set_secondary_light -46.0 162.0 0.458824 0.466667 0.74902)
        (cinematic_lighting_set_ambient_light 0.0823529 0.0470588 0.00784314)
    )
)

(script static void c05_intra1_03_setup
    (begin
        (wake c05_2150_mir)
        (wake c05_2160_mir)
        (wake c05_intra1_foley_03)
        (wake c05_intra1_cinematic_light_03)
        (wake cortana_disappear)
    )
)

(script static void c05_intra1_03_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "regret")
        (object_destroy "throne_regret")
        (object_destroy "cortana_base")
    )
)

(script static void c05_intra1_scene_03
    (begin
        (c05_intra1_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_intra1\05_intra1" "05_intra1_03" none "anchor_flag_intra1a")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_intra1\05_intra1" "chief_03" false "anchor_intra1a")
        (custom_animation_relative "cortana" "objects\characters\cortana\05_intra1\05_intra1" "cortana_03" false "anchor_intra1a")
        (sleep 50)
        (object_destroy "cortana")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c05_intra1_03_cleanup)
    )
)

(script static void c05_intra1
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash bsp_01)
        (sleep 1)
        (sound_class_enable_ducker "amb" 0.0 0)
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (c05_intra1_scene_01)
        (c05_intra1_scene_02)
        (c05_intra1_scene_03)
        (sound_class_enable_ducker "amb" 0.0 15)
    )
)

(script dormant void c05_intra2_foley
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intra2\foley\c05_intra2_01_fol" none 1.0)
        (print "c05_intra2 foley start")
    )
)

(script dormant void c05_3010_cor
    (begin
        (sleep 275)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_3010_cor" none 1.0)
        (attract_mode_set_seconds "c05_3010_cor" 2.0)
    )
)

(script dormant void c05_3020_cor
    (begin
        (sleep 359)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_3020_cor" none 1.0)
        (attract_mode_set_seconds "c05_3020_cor" 2.0)
    )
)

(script dormant void c05_3030_cor
    (begin
        (sleep 513)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_3030_cor" none 1.0)
        (attract_mode_set_seconds "c05_3030_cor" 3.0)
    )
)

(script dormant void c05_intra2_dof
    (begin
        (sleep 250)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 250)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c05_intra2_cinematic_light
    (begin
        (cinematic_lighting_set_primary_light 24.0 272.0 0.639216 0.54902 0.388235)
        (cinematic_lighting_set_secondary_light -27.0 140.0 0.329412 0.180392 0.0509804)
        (cinematic_lighting_set_ambient_light 0.0784314 0.0784314 0.101961)
        (object_uses_cinematic_lighting "chief" true)
    )
)

(script dormant void fleet_arrival
    (begin
        (sleep 251)
        (print "fleet arrival")
        (object_create_anew "intra2_fleet")
    )
)

(script static void c05_intra2_setup
    (begin
        (object_create "chief")
        (object_cinematic_lod "chief" true)
        (ice_cream_flavor_stock "chief" "right_hand" "")
        (wake c05_3010_cor)
        (wake c05_3020_cor)
        (wake c05_3030_cor)
        (wake c05_intra2_foley)
        (wake fleet_arrival)
        (wake c05_intra2_dof)
        (wake c05_intra2_cinematic_light)
    )
)

(script static void c05_intra2
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash bsp_03)
        (sleep 1)
        (camera_control true)
        (set_pjl_effect "deltatowers_intra2")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (05_intra1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intra2\foley\c05_intra2_01_fol")
        (sleep prediction_offset)
        (c05_intra2_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_intra2\05_intra2" "05_intra2_01" none "anchor_flag_outro")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_intra2\05_intra2" "chief_01" false "anchor_outro")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (object_destroy "chief")
        (object_destroy "intra2_fleet")
    )
)

(script dormant void c05_outro_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_outro\music\c05_outro_01_mus" none 1.0)
        (print "c05_outro score 01 start")
    )
)

(script dormant void c05_outro_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_01_fol" none 1.0)
        (print "c05_outro foley 01 start")
    )
)

(script dormant void effect_dust_scrape
    (begin
        (rasterizer_profile_include_all)
        (sleep 240)
        (print "effect - dust scrape")
        (object_create_anew "outro_dust_scrape")
    )
)

(script dormant void c05_outro_01_dof
    (begin
        (sleep 55)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 130)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c05_outro_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 24.0 272.0 0.639216 0.54902 0.388235)
        (cinematic_lighting_set_secondary_light -27.0 140.0 0.329412 0.180392 0.0509804)
        (cinematic_lighting_set_ambient_light 0.0784314 0.0784314 0.101961)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "carrier" true)
    )
)

(script dormant void c05_outro_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "chief")
        (object_cinematic_lod "chief" true)
    )
)

(script static void c05_outro_01_setup
    (begin
        (object_create_anew "carrier")
        (object_cinematic_lod "carrier" true)
        (wake c05_outro_score_01)
        (wake c05_outro_foley_01)
        (wake effect_dust_scrape)
        (wake c05_outro_01_dof)
        (wake c05_outro_cinematic_light_01)
        (effect_new_on_object_marker "effects\cinematics\05\covenant_beam" "carrier" "beam")
    )
)

(script static void c05_outro_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "deltatowers_outro")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (05_outro_01_predict_stub)
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_outro\music\c05_outro_01_mus")
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_01_fol")
        (wake c05_outro_problem_actors)
        (sleep prediction_offset)
        (c05_outro_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_outro\05_outro" "05_outro_01" none "anchor_flag_outro")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_outro\05_outro" "chief_01" false "anchor_outro")
        (scenery_animation_start_relative "carrier" "scenarios\objects\covenant\military\capital_ship\05_outro\05_outro" "cruiser_01" "anchor_outro")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (05_outro_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_02_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c05_outro_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_02_fol" none 1.0)
        (print "c05_outro foley 02 start")
    )
)

(script dormant void effect_dust_land
    (begin
        (sleep 59)
        (print "effect - dust land")
        (object_create_anew "outro_dust_land")
    )
)

(script static void c05_outro_scene_02
    (begin
        (wake c05_outro_foley_02)
        (wake effect_dust_land)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_outro\05_outro" "05_outro_02" none "anchor_flag_outro")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_outro\05_outro" "chief_02" false "anchor_outro")
        (scenery_animation_start_relative "carrier" "scenarios\objects\covenant\military\capital_ship\05_outro\05_outro" "cruiser_02" "anchor_outro")
        (sleep (- (camera_set_pan) prediction_offset))
        (05_outro_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_03_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c05_outro_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_03_fol" none 1.0)
        (print "c05_outro foley 03 start")
    )
)

(script dormant void c05_outro_fov_01
    (begin
        (sleep 122)
        (camera_pan 7.0 0)
    )
)

(script static void c05_outro_03_setup
    (begin
        (wake c05_outro_foley_03)
        (wake c05_outro_fov_01)
    )
)

(script static void c05_outro_scene_03
    (begin
        (c05_outro_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_outro\05_outro" "05_outro_03" none "anchor_flag_outro")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_outro\05_outro" "chief_03" false "anchor_outro")
        (sleep (- (camera_set_pan) prediction_offset))
        (05_outro_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_04_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c05_outro_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_outro\foley\c05_outro_04_fol" none 1.0)
        (print "c05_outro foley 04 start")
    )
)

(script static void c05_outro_scene_04
    (begin
        (wake c05_outro_foley_04)
        (object_create_anew "outro_beam")
        (print "start beam")
        (camera_pan 60.0 0)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_outro\05_outro" "05_outro_04" none "anchor_flag_outro")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_outro\05_outro" "chief_04" false "anchor_outro")
        (scenery_animation_start_relative "carrier" "scenarios\objects\covenant\military\capital_ship\05_outro\05_outro" "cruiser_04" "anchor_outro")
        (sleep (- (camera_set_pan) prediction_offset))
        (05_outro_05_predict_stub)
        (sleep (- (camera_set_pan) 1.0))
        (cinematic_stop 0.0 0.0 0.0 0)
        (sleep 60)
        (object_destroy "outro_beam")
    )
)

(script dormant void x07_0220_grv
    (begin
        (sleep 207)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0220_grv" none 1.0)
        (attract_mode_set_seconds "x07_0220_grv" 7.0)
    )
)

(script dormant void x07_0230_grv
    (begin
        (sleep 426)
        (sound_impulse_start_effect "sound\dialog\levels\06_sentinelwall\cinematic\x07_0230_grv" none 1.0)
        (attract_mode_set_seconds "x07_0230_grv" 6.0)
    )
)

(script dormant void c05_outro_bubbles
    (begin
        (object_create_anew "bubbles_01")
        (objects_attach "chief" "" "bubbles_01" "")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles01")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles04")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles06")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles08")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles09")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles11")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles12")
        (effect_new_on_object_marker "effects\cinematics\05\bubbles_debris" "rubble" "bubbles14")
    )
)

(script dormant void c05_outro_caustic
    (begin
        (rasterizer_profile_include_all)
        (sleep 127)
        (print "create caustic light")
        (object_create_anew_containing "caustic_light")
    )
)

(script dormant void c05_outro_cinematic_light_05
    (begin
        (cinematic_lighting_set_primary_light 54.0 138.0 0.129412 0.121569 0.0705882)
        (cinematic_lighting_set_secondary_light -46.0 238.0 0.0705882 0.160784 0.329412)
        (cinematic_lighting_set_ambient_light 0.0901961 0.129412 0.219608)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "rubble" true)
        (object_uses_cinematic_lighting "tentacle_capture_01" true)
        (object_uses_cinematic_lighting "tentacle_capture_02" true)
    )
)

(script static void c05_outro_05_setup
    (begin
        (object_create_anew "rubble")
        (object_create_anew "tentacle_capture_01")
        (object_create_anew "tentacle_capture_02")
        (wake x07_0220_grv)
        (wake x07_0230_grv)
        (wake c05_outro_cinematic_light_05)
        (wake c05_outro_bubbles)
        (wake c05_outro_caustic)
    )
)

(script static void c05_outro_05_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "rubble")
        (object_destroy "carrier")
        (object_destroy_containing "caustic_light")
        (object_destroy_containing "tentacle")
        (object_destroy_containing "bubbles")
    )
)

(script static void c05_outro_scene_05
    (begin
        (c05_outro_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_outro\05_outro" "05_outro_05" none "anchor_flag_outro")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_outro\05_outro" "chief_05" false "anchor_outro")
        (scenery_animation_start_relative "rubble" "objects\cinematics\effects\05_outro_rubble\05_outro_rubble" "05_outro_05" "anchor_outro")
        (scenery_animation_start_relative "tentacle_capture_01" "objects\characters\gravemind\tentacle_capture\05_outro\05_outro" "tentacle1_05" "anchor_outro")
        (scenery_animation_start_relative "tentacle_capture_02" "objects\characters\gravemind\tentacle_capture\05_outro\05_outro" "tentacle2_05" "anchor_outro")
        (cinematic_start 0.0 0.0 0.0 60)
        (sleep (- (camera_set_pan) 30.0))
        (cinematic_stop 0.0 0.0 0.0 60)
        (sleep 60)
        (c05_outro_05_cleanup)
        (predict_animation)
    )
)

(script static void c05_outro
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash bsp_03)
        (sleep 1)
        (c05_outro_scene_01)
        (c05_outro_scene_02)
        (c05_outro_scene_03)
        (c05_outro_scene_04)
        (c05_outro_scene_05)
    )
)

(script command_script void long_pause
    (begin
        (cs_abort_on_alert true)
        (sleep_forever)
    )
)

(script command_script void forever_pause
    (begin
        (cs_pause -1.0)
    )
)

(script command_script void abort
    (begin
        (cs_pause 0.1)
    )
)

(script dormant void 05b_title0
    (begin
        (cinematic_fade_from_white_bars)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void 05b_title1
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

(script dormant void 05b_title1_alt
    (begin
        (show_hud_help_text 0.0 0.5)
        (cinematic_set_title true)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_2alt")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void 05b_title2
    (begin
        (cinematic_fade_from_white_bars)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_3")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void objective_towers_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "make your way through the first set of towers.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_towers_clear
    (begin
        (print "objective complete:")
        (print "make your way through the first set of towers.")
        (update_remote_camera 0)
    )
)

(script dormant void objective_gondola1_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "ride the gondola to the far towers.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_gondola1_clear
    (begin
        (print "objective complete:")
        (print "ride the gondola to the far towers.")
        (update_remote_camera 1)
    )
)

(script dormant void objective_sunken_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "pass through the submerged structures.")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective_sunken_clear
    (begin
        (print "objective complete:")
        (print "pass through the submerged structures.")
        (update_remote_camera 2)
    )
)

(script dormant void objective_temple_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "reach the main temple.")
        (input_suppress_vibration 3)
    )
)

(script dormant void objective_temple_clear
    (begin
        (print "objective complete:")
        (print "reach the main temple.")
        (update_remote_camera 3)
    )
)

(script dormant void objective_regret_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "kill the prophet of regret, and escape.")
        (input_suppress_vibration 4)
    )
)

(script dormant void objective_regret_clear
    (begin
        (print "objective complete:")
        (print "kill the prophet of regret, and escape.")
        (update_remote_camera 4)
    )
)

(script dormant void music_05b_01_start
    (begin
        (print "music 05b_01 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_01" none 1.0)
    )
)

(script dormant void music_05b_01_stop
    (begin
        (print "music 05b_01 stop")
        (sound_looping_set_scale "scenarios\solo\05b_deltatowers\05b_music\05b_01")
    )
)

(script dormant void music_05b_02_start
    (begin
        (print "music 05b_02 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_02" none 1.0)
    )
)

(script dormant void music_05b_02_stop
    (begin
        (print "music 05b_02 stop")
        (sound_looping_set_scale "scenarios\solo\05b_deltatowers\05b_music\05b_02")
    )
)

(script dormant void music_05b_03_start
    (begin
        (print "music 05b_03 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_03" none 1.0)
    )
)

(script dormant void music_05b_03_stop
    (begin
        (print "music 05b_03 stop")
        (sound_looping_set_scale "scenarios\solo\05b_deltatowers\05b_music\05b_03")
    )
)

(script dormant void music_05b_04_start
    (begin
        (print "music 05b_04 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_04" none 1.0)
    )
)

(script dormant void music_05b_04_stop
    (begin
        (print "music 05b_04 stop")
        (sound_looping_set_scale "scenarios\solo\05b_deltatowers\05b_music\05b_04")
    )
)

(script dormant void music_05b_05_start
    (begin
        (print "music 05b_05 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_05" none 1.0)
    )
)

(script dormant void music_05b_06_start
    (begin
        (print "music 05b_06 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_06" none 1.0)
    )
)

(script dormant void music_05b_06_stop
    (begin
        (print "music 05b_06 stop")
        (sound_looping_set_scale "scenarios\solo\05b_deltatowers\05b_music\05b_06")
    )
)

(script dormant void music_05b_07_start
    (begin
        (print "music 05b_07 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_07" none 1.0)
    )
)

(script dormant void music_05b_08_start
    (begin
        (print "music 05b_08 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_08" none 1.0)
    )
)

(script dormant void music_05b_09_start
    (begin
        (print "music 05b_09 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_09" none 1.0)
    )
)

(script dormant void music_05b_09_start_alt
    (begin
        (print "music 05b_09 start alt")
        (sound_class_show_channel "scenarios\solo\05b_deltatowers\05b_music\05b_09" true)
    )
)

(script dormant void music_05b_09_stop
    (begin
        (print "music 05b_09 stop")
        (sound_looping_set_scale "scenarios\solo\05b_deltatowers\05b_music\05b_09")
    )
)

(script dormant void music_05b_10_start
    (begin
        (print "music 05b_10 start")
        (sound_looping_stop_immediately "scenarios\solo\05b_deltatowers\05b_music\05b_10" none 1.0)
    )
)

(script dormant void music_05b_10_stop
    (begin
        (print "music 05b_10 stop")
        (sound_looping_set_scale "scenarios\solo\05b_deltatowers\05b_music\05b_10")
    )
)

(script dormant void kill_volumes
    (begin
        (kill_volume_disable "kill_no_riders_up")
        (kill_volume_disable "kill_bsp03")
        (kill_volume_disable "kill_temple_wings")
        (sleep_until (= (version) 2))
        (kill_volume_enable "kill_bsp03")
        (kill_volume_enable "kill_temple_wings")
        (kill_volume_disable "kill_bsp01_01")
        (kill_volume_disable "kill_bsp01_02")
    )
)

(script dormant void tower1_holo_looper
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant1a" true)
                            (sleep (ai_play_line_on_object "regret01" "3000"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant2b" true)
                            (sleep (ai_play_line_on_object "regret01" "3001"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant2c" true)
                            (sleep (ai_play_line_on_object "regret01" "3002"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant3a" true)
                            (sleep (ai_play_line_on_object "regret01" "3003"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant3c" true)
                            (sleep (ai_play_line_on_object "regret01" "3004"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant5a" true)
                            (sleep (ai_play_line_on_object "regret01" "3005"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant6a" true)
                            (sleep (ai_play_line_on_object "regret01" "3006"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                )
                false
            )
        )
    )
)

(script static void prep_return_from_intro
    (begin
        (object_create_anew "in_game_throne")
        (object_create_anew "regret01")
        (objects_attach "in_game_throne" "driver" "regret01" "")
        (ai_disregard "regret01" true)
        (ai_place "initial_allies" 2)
        (object_teleport (player0) "tower1_player0")
        (object_teleport (player1) "tower1_player1")
    )
)

(script dormant void tower1_cortana_comment
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower1_exit" (players)) true)
                (= (volume_test_objects "vol_tower1_exit_01" (players)) true)
                (= (volume_test_objects "vol_tower1_exit_02" (players)) true)
            ) 
        30 300)
        (ai_dialogue_enable false)
        (sleep 60)
        (if 
            (and
                (= (volume_test_objects "vol_tower1_exit" (players)) false)
                (= (volume_test_objects "vol_tower1_exit_01" (players)) false)
                (= (volume_test_objects "vol_tower1_exit_02" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (print "cortana: 'you know, i think the forerunners built these new structures...'")
                    (print "'...around the old - to protect them, honor them...'")
                    (sleep (ai_play_line_on_object none "0810"))
                    (sleep 30)
                    (print "'pure speculation, mind you. i'd need to make a thorough survey to be sure.'")
                    (sleep (ai_play_line_on_object none "0820"))
                )
        )
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void tower1_start
    (begin
        (data_mine_insert "05b_1_tower1")
        (game_reverted)
        (sleep 90)
        (ai_place "tower1_buggers_01" 4)
        (sleep 90)
        (if (difficulty_legendary) 
            (ai_place "tower1_elites_01" 2) (ai_place "tower1_elites_01" 1))
        (wake tower1_holo_looper)
        (sleep_until 
            (or
                (< (ai_living_count "tower1_enemies") 3)
                (= (volume_test_objects "vol_tower1_upper" (players)) true)
                (= (volume_test_objects "vol_tower1_upper_right" (players)) true)
            )
        )
        (ai_place "tower1_buggers_02" (- 4.0 (ai_living_count "tower1_buggers_01")))
        (sleep_until 
            (or
                (< (ai_living_count "tower1_enemies") 2)
                (= (volume_test_objects "vol_tower1_upper_right" (players)) true)
            )
        )
        (if (difficulty_legendary) 
            (ai_place "tower1_elites_02" (- 2.0 (ai_living_count "tower1_elites_01"))) (ai_place "tower1_elites_02" (- 1.0 (ai_living_count "tower1_elites_01"))))
        (sleep_until 
            (or
                (< (ai_living_count "tower1_enemies") 1)
                (= (volume_test_objects "vol_tower1_exit" (players)) true)
                (= (volume_test_objects "vol_tower1_exit_01" (players)) true)
                (= (volume_test_objects "vol_tower1_exit_02" (players)) true)
                (= (volume_test_objects "vol_tower1_roof" (players)) true)
            )
        )
        (game_save_no_timeout)
        (wake tower1_cortana_comment)
        (sleep 60)
        (wake music_05b_01_start)
    )
)

(script command_script void tower1_escape
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_nearest bridges)
    )
)

(script dormant void cortana_bridge_reminder
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower2_ext_entry" (players)) true)
                (= (volume_test_objects "vol_central_platform" (players)) true)
            ) 
        30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_tower2_ext_entry" (players)) false)
                (= (volume_test_objects "vol_central_platform" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'there's some sort of transport-system on the far side...'")
                    (print "'...of that center platform. let's check it out.'")
                    (sleep (ai_play_line_on_object none "0860"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void bridges_start
    (begin
        (ai_disposable "tower1_enemies" true)
        (data_mine_insert "05b_2_bridges")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (if (difficulty_heroic) 
            (set bridges_sniper_count 4))
        (if (difficulty_legendary) 
            (set bridges_sniper_count 5))
        (begin_random
            (if (> bridges_sniper_count 0) 
                (begin
                    (ai_place "bridge_jackals_01" 1)
                    (set bridges_sniper_count (- bridges_sniper_count 1.0))
                )
            )
            (if (> bridges_sniper_count 0) 
                (begin
                    (ai_place "bridge_jackals_02" 1)
                    (set bridges_sniper_count (- bridges_sniper_count 1.0))
                )
            )
            (if (> bridges_sniper_count 0) 
                (begin
                    (ai_place "bridge_jackals_03" 1)
                    (set bridges_sniper_count (- bridges_sniper_count 1.0))
                )
            )
            (if (> bridges_sniper_count 0) 
                (begin
                    (ai_place "bridge_jackals_04" 1)
                    (set bridges_sniper_count (- bridges_sniper_count 1.0))
                )
            )
            (if (> bridges_sniper_count 0) 
                (begin
                    (ai_place "bridge_jackals_05" 1)
                    (set bridges_sniper_count (- bridges_sniper_count 1.0))
                )
            )
            (if (> bridges_sniper_count 0) 
                (begin
                    (ai_place "bridge_jackals_06" 1)
                    (set bridges_sniper_count (- bridges_sniper_count 1.0))
                )
            )
        )
        (ai_place "bridge_elites_01" 1)
        (ai_place "bridge_elites_02" 1)
        (ai_place "bridge_grunts_01" 2)
        (ai_set_orders "all_allies" "tower1_ext_allies")
        (cs_run_command_script "all_allies" tower1_escape)
        (wake cortana_bridge_reminder)
        (sleep_until 
            (or
                (< (ai_living_count "bridge_enemies") 5)
                (= (volume_test_objects "vol_bridge" (players)) true)
                (= (volume_test_objects "vol_tower2_ext_entry" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "bridge_enemies") 8) 
            (ai_place "bridge_grunts_02" (- 3.0 (ai_living_count "bridge_grunts_01"))))
        (if (< (ai_living_count "bridge_enemies") 8) 
            (ai_place "bridge_elites_03" 1))
        (sleep_until 
            (or
                (< (ai_living_count "bridge_enemies") 5)
                (= (volume_test_objects "vol_tower2_ext_entry" (players)) true)
                (= (volume_test_objects "vol_bridge_far_half" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "bridge_enemies") 8) 
            (ai_place "bridge_grunts_03" (- 2.0 (ai_living_count "bridge_grunts_02"))))
        (if (< (ai_living_count "bridge_enemies") 8) 
            (ai_place "bridge_jackals_07" 1))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bridge" (players)) true)
                (= (volume_test_objects "vol_tower2_ext_entry" (players)) true)
            )
        )
        (ai_set_orders "all_allies" "bridge_allies")
        (sleep_until 
            (or
                (< (ai_living_count "bridge_enemies") 5)
                (= (volume_test_objects "vol_tower2_ext_entry" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "bridge_enemies") 8) 
            (ai_place "bridge_grunts_04" (- 2.0 (ai_living_count "bridge_grunts_03"))))
        (if (< (ai_living_count "bridge_enemies") 8) 
            (ai_place "bridge_elites_04" 1))
        (sleep_until (= (volume_test_objects "vol_tower2_ext_entry" (players)) true))
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "tower2_ext_allies_01")
    )
)

(script dormant void tower2_cortana_comment
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower2_exit" (players)) true)
                (= (volume_test_objects "vol_tower2_ext_exit" (players)) true)
                (= (volume_test_objects "vol_tower2_exit_mid" (players)) true)
            ) 
        30 300)
        (ai_dialogue_enable false)
        (sleep 60)
        (if 
            (and
                (= (volume_test_objects "vol_tower2_exit" (players)) false)
                (= (volume_test_objects "vol_tower2_ext_exit" (players)) false)
                (= (volume_test_objects "vol_tower2_exit_mid" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (print "cortana: 'i wish i had time to decipher these inscriptions.'")
                    (sleep (ai_play_line_on_object none "0870"))
                    (sleep 60)
                    (print "'the forerunners revered this place - that much is clear.'")
                    (sleep (ai_play_line_on_object none "0880"))
                    (sleep 60)
                    (print "'but was it a temple? a university? i can't say...'")
                    (sleep (ai_play_line_on_object none "0890"))
                )
        )
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void tower2_start
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower2_entry" (players)) true)
                (= (volume_test_objects "vol_tower2_exit" (players)) true)
            )
        )
        (ai_disposable "bridge_enemies" true)
        (data_mine_insert "05b_3_tower2")
        (ai_renew "all_allies")
        (wake music_05b_01_stop)
        (game_save_no_timeout)
        (ai_place "tower2_jackals_01" 2)
        (ai_place "tower2_grunts_01" 2)
        (ai_place "tower2_grunts_02" 2)
        (sleep_until (= (volume_test_objects "vol_in_tower2" (players)) true))
        (ai_set_orders "all_allies" "tower2_allies")
        (sleep_until 
            (or
                (< (ai_living_count "tower2_enemies") 3)
                (= (volume_test_objects "vol_tower2_by_exit" (players)) true)
                (= (volume_test_objects "vol_tower2_exit" (players)) true)
            )
        )
        (game_save_no_timeout)
        (ai_place "tower2_jackals_02" (- 2.0 (ai_living_count "tower2_jackals_01")))
        (sleep_until 
            (or
                (<= (ai_living_count "tower2_enemies") 0)
                (= (volume_test_objects "vol_tower2_exit" (players)) true)
            )
        )
        (game_save_no_timeout)
        (wake tower2_cortana_comment)
    )
)

(script dormant void miranda_pelican_comment
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "miranda: 'cortana? the covenant's getting nosy.'")
        (print "'i don't want to give away my position,'")
        (print "'so i'm re-routing a few stragglers back to you.'")
        (sleep (ai_play_line_on_object none "0830"))
        (sleep 30)
        (print "'i apologize. these pelicans are all the support you're going to get.'")
        (sleep (ai_play_line_on_object none "0840"))
        (sleep 60)
        (print "'understood, ma'am.'")
        (sleep (ai_play_line_on_object none "0850"))
        (set miranda_pel_comment_done true)
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void gondola_01_cortana_warn
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'a gondola's launching from the far towers!'")
        (print "'big surprise: it's full of covenant reinforcements!'")
        (sleep (ai_play_line_on_object none "0900"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void gondola_01_cortana_comment
    (begin
        (if 
            (and
                (= (volume_test_objects "vol_gondola_01" (players)) false)
                (> (player_count) 0)
                (= (ai_trigger_test "done_fighting" "central_platform_enemies") true)
                (= (ai_trigger_test "done_fighting" "gondola_01_enemies") true)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'well, they were nice enough to bring us a ride.'")
                    (sleep (ai_play_line_on_object none "0910"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void gondola_01_cortana_reminder
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'this gondola won't bring us all the way to the main-temple,'")
        (print "'but it'll get us close. let's get on-board.'")
        (sleep (ai_play_line_on_object none "0950"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void gondola_01_ally_comment
    (begin
        (cs_switch "ally01")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "ally_01: 'all aboard!'")
        (cs_play_line "0920")
        (cs_switch "ally02")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (sleep 5)
        (print "ally_02: 'i'll drive!'")
        (cs_play_line "0930")
        (cs_switch "ally01")
        (sleep 15)
        (print "ally_01: 'what's to drive? it comes here. it goes there.'")
        (cs_play_line "0940")
    )
)

(script dormant void hunter_drop
    (begin
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") true)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") phantom_p_a01)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") phantom_p_a02)
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") false)
        (ai_set_blind "central_platform_hunters" false)
    )
)

(script command_script void central_platform_dropship
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by bsp1_airspace/ph_01_0 10.0)
        (cs_fly_by bsp1_airspace/ph_01_1 10.0)
        (cs_vehicle_boost false)
        (cs_fly_by bsp1_airspace/ph_01_2 5.0)
        (cs_vehicle_speed 0.5)
        (wake hunter_drop)
        (cs_fly_to bsp1_airspace/ph_01_2 1.0)
        (sleep_until (< (ai_living_count "central_platform_phantom") 2))
        (sleep 60)
        (cs_fly_to_and_face bsp1_airspace/ph_01_3 bsp1_airspace/ph_01_1 1.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by bsp1_airspace/ph_01_1 5.0)
        (cs_vehicle_boost true)
        (cs_fly_by bsp1_airspace/ph_01_0 20.0)
        (cs_fly_by bsp1_airspace/ph_01_x 40.0)
        (ai_erase "central_platform_phantom")
    )
)

(script command_script void central_platform_pelican_path
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by bsp1_airspace/p0 2.0)
        (cs_vehicle_boost true)
        (cs_fly_by bsp1_airspace/pel0 20.0)
        (cs_fly_by bsp1_airspace/pel1 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by bsp1_airspace/pel3 10.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_by bsp1_airspace/pel4 5.0)
        (set central_plat_pel_arrives true)
        (cs_vehicle_speed 0.3)
        (cs_fly_to bsp1_airspace/pel4 1.0)
        (ai_place "central_plat_pelican_allies" (- 2.0 (ai_living_count "allies_infantry")))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "central_plat_pelican/pilot") pelican_p (ai_actors "central_plat_pelican_allies"))
        (cs_fly_to bsp1_airspace/pel5 1.0)
        (vehicle_unload (ai_vehicle_get_from_starting_location "central_plat_pelican/pilot") pelican_p)
        (sleep_until (< (ai_living_count "central_plat_pelican") 4))
        (sleep 60)
        (cs_vehicle_speed 0.5)
        (cs_fly_to_and_face bsp1_airspace/pel4 bsp1_airspace/pel3 1.0)
        (cs_fly_by bsp1_airspace/pel3 2.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by bsp1_airspace/pel2 2.0)
        (cs_vehicle_boost true)
        (cs_fly_by bsp1_airspace/pel2 20.0)
        (cs_fly_by bsp1_airspace/pel1 20.0)
        (cs_fly_by bsp1_airspace/pel0 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by bsp1_airspace/pelx 5.0)
        (ai_erase "central_plat_pelican")
    )
)

(script dormant void central_platform_pelican
    (begin
        (ai_place "central_plat_pelican" 1)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "central_plat_pelican/pilot") true)
        (cs_run_command_script "central_plat_pelican/pilot" central_platform_pelican_path)
        (object_create_anew "rack")
        (objects_attach (ai_vehicle_get_from_starting_location "central_plat_pelican/pilot") "pelican_sc_01" "rack" "pin")
        (object_create_anew "bomb01")
        (objects_attach "rack" "rack01" "bomb01" "pin")
        (object_create_anew "bomb02")
        (objects_attach "rack" "rack02" "bomb02" "pin")
        (object_create_anew "bomb03")
        (objects_attach "rack" "rack03" "bomb03" "pin")
        (object_create_anew "bomb04")
        (objects_attach "rack" "rack04" "bomb04" "pin")
        (object_create_anew "bomb05")
        (objects_attach "rack" "rack05" "bomb05" "pin")
        (object_create_anew "bomb06")
        (objects_attach "rack" "rack06" "bomb06" "pin")
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "initial_allies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "initial_allies") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "initial_allies") 0)))
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "initial_allies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "initial_allies") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "initial_allies") 0)))
                (= central_plat_pel_arrives true)
            )
        )
        (begin_random
            (begin
                (objects_detach "rack" "bomb01")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb02")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb03")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb04")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb05")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb06")
                (sleep (random_range 10 30))
            )
        )
    )
)

(script static void short_central_plat_pel
    (begin
        (ai_place "central_plat_pelican" 1)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "central_plat_pelican/pilot") true)
        (cs_run_command_script "central_plat_pelican/pilot" central_platform_pelican_path)
        (object_create_anew "rack")
        (objects_attach (ai_vehicle_get_from_starting_location "central_plat_pelican/pilot") "pelican_sc_01" "rack" "pin")
        (object_create_anew "bomb01")
        (objects_attach "rack" "rack01" "bomb01" "pin")
        (object_create_anew "bomb02")
        (objects_attach "rack" "rack02" "bomb02" "pin")
        (object_create_anew "bomb03")
        (objects_attach "rack" "rack03" "bomb03" "pin")
        (object_create_anew "bomb04")
        (objects_attach "rack" "rack04" "bomb04" "pin")
        (object_create_anew "bomb05")
        (objects_attach "rack" "rack05" "bomb05" "pin")
        (object_create_anew "bomb06")
        (objects_attach "rack" "rack06" "bomb06" "pin")
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "initial_allies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "initial_allies") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "initial_allies") 0)))
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "initial_allies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "initial_allies") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "initial_allies") 0)))
                (= central_plat_pel_arrives true)
            )
        )
        (begin_random
            (begin
                (objects_detach "rack" "bomb01")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb02")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb03")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb04")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb05")
                (sleep (random_range 10 30))
            )
            (begin
                (objects_detach "rack" "bomb06")
                (sleep (random_range 10 30))
            )
        )
    )
)

(script dormant void central_plat_ph_go
    (begin
        (ai_place "central_platform_hunters" 2)
        (ai_place "central_platform_phantom" 1)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") phantom_p_a (ai_actors "central_platform_hunters"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") true)
        (cs_run_command_script "central_platform_phantom/pilot" central_platform_dropship)
        (sleep 4000)
        (object_destroy (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot"))
    )
)

(script dormant void gondola_01_wake
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (> (device_get_position "gondola_01_a") 0.37)
                        (< (device_get_position "gondola_01_a") 0.59)
                        (> (device_get_position "gondola_01_a") gondola_01_wake_state)
                    ) 
                        (begin
                            (object_clear_function_variable "gondola_01_a" "wake_forward")
                            (object_clear_function_variable "gondola_01_a" "wake_backward")
                            (object_set_function_variable "gondola_01_a" "wake_backward" 1.0 1.0)
                            (object_clear_function_variable "gondola_01_b" "wake_forward")
                            (object_clear_function_variable "gondola_01_b" "wake_backward")
                            (object_set_function_variable "gondola_01_b" "wake_backward" 1.0 1.0)
                        )
                )
                (if 
                    (and
                        (> (device_get_position "gondola_01_a") 0.37)
                        (< (device_get_position "gondola_01_a") 0.59)
                        (< (device_get_position "gondola_01_a") gondola_01_wake_state)
                    ) 
                        (begin
                            (object_clear_function_variable "gondola_01_a" "wake_forward")
                            (object_clear_function_variable "gondola_01_a" "wake_backward")
                            (object_set_function_variable "gondola_01_a" "wake_forward" 1.0 1.0)
                            (object_clear_function_variable "gondola_01_b" "wake_forward")
                            (object_clear_function_variable "gondola_01_b" "wake_backward")
                            (object_set_function_variable "gondola_01_b" "wake_forward" 1.0 1.0)
                        )
                )
                (if 
                    (or
                        (= (device_get_position "gondola_01_a") gondola_01_wake_state)
                        (< (device_get_position "gondola_01_a") 0.37)
                        (> (device_get_position "gondola_01_a") 0.59)
                    ) 
                        (begin
                            (object_clear_function_variable "gondola_01_a" "wake_forward")
                            (object_clear_function_variable "gondola_01_a" "wake_backward")
                            (object_clear_function_variable "gondola_01_b" "wake_forward")
                            (object_clear_function_variable "gondola_01_b" "wake_backward")
                        )
                )
                (set gondola_01_wake_state (device_get_position "gondola_01_a"))
                (= (device_get_position "gondola_01_a") 0.0)
            )
        )
    )
)

(script dormant void central_platform_start
    (begin
        (ai_disposable "tower2_enemies" true)
        (data_mine_insert "05b_4_central_platform")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (ai_place "tower3_turrets" 2)
        (objects_attach "gondola_01_b" "control_back" "gondola_01_switch_front" "")
        (objects_attach "gondola_01_a" "control_back" "gondola_01_switch_back" "")
        (device_set_position "gondola_01_launch_a" 1.0)
        (device_set_position "gondola_01_launch_b" 1.0)
        (device_set_position "gondola_01_a" 0.5)
        (device_set_position "gondola_01_b" 0.5)
        (ai_place "central_platform_elites_01" 1)
        (ai_place "central_platform_elites_02" 1)
        (ai_place "central_platform_jackals_01" 2)
        (ai_place "central_platform_jackals_02" 2)
        (ai_set_orders "all_allies" "tower2_ext_allies_02")
        (sleep_until 
            (or
                (= (volume_test_objects "vol_near_gondola_01" (players)) true)
                (= (volume_test_objects "vol_central_platform" (players)) true)
            ) 
        30 150)
        (wake gondola_01_wake)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_near_gondola_01" (players)) true)
                (= (volume_test_objects "vol_central_platform" (players)) true)
            )
        )
        (ai_set_orders "all_allies" "central_platform_allies")
        (sleep_until (< (ai_living_count "central_platform_enemies") 2) 30 4000)
        (sleep_until (= (ai_trigger_test "done_fighting" "central_platform_enemies") true))
        (game_save_no_timeout)
        (wake central_plat_ph_go)
        (sleep 450)
        (game_save_no_timeout)
        (sleep_until 
            (or
                (> (ai_living_count "central_platform_hunters") 0)
                (< (ai_living_count "central_platform_phantom") 1)
            )
        )
        (sleep_until (< (ai_living_count "central_platform_hunters") 1))
        (sleep 30)
        (wake music_05b_02_start)
        (sleep 60)
        (wake miranda_pelican_comment)
        (sleep_until (= miranda_pel_comment_done true))
        (game_save_no_timeout)
        (wake central_platform_pelican)
        (ai_place "gondola_01_elite_riders" 2)
        (ai_place "gondola_01_grunt_riders" 3)
        (device_set_position "gondola_01_a" 1.0)
        (device_set_position "gondola_01_b" 1.0)
        (sleep_until (> (device_get_position "gondola_01_a") 0.75))
        (wake gondola_01_cortana_warn)
        (sleep_until (= (device_get_position "gondola_01_a") 1.0))
        (object_dynamic_simulation_disable "gondola_01_a" true)
        (object_dynamic_simulation_disable "gondola_01_b" true)
        (device_set_position "gondola_01_launch_a" 0.0)
        (device_set_position "gondola_01_launch_b" 0.0)
        (device_group_change_only_once_more_set "gondola_01_switch" true)
        (ai_set_orders "gondola_01_grunt_riders" "gondola_01_landing_01")
        (game_save_no_timeout)
        (wake music_05b_03_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_near_gondola_01" (players)) true)
                (< (ai_living_count "gondola_01_enemies") 3)
            )
        )
        (ai_place "gondola_01_jackal_riders" 2)
        (sleep_until 
            (or
                (<= (ai_living_count "gondola_01_jackal_riders") 0)
                (= (volume_test_objects "vol_gondola_01" (players)) true)
            ) 
        30 4000)
        (ai_set_orders "gondola_01_elite_riders" "gondola_01_landing_03")
        (sleep_until 
            (or
                (= (volume_test_objects "vol_gondola_01" (players)) true)
                (and
                    (<= (ai_living_count "gondola_01_enemies") 0)
                    (<= (ai_living_count "central_platform_enemies") 0)
                    (<= (ai_living_count "bridge_enemies") 0)
                )
            ) 
        30 4000)
        (sleep 30)
        (wake gondola_01_cortana_comment)
        (sleep 150)
        (ai_scene "gondola_01_allies_scene" gondola_01_ally_comment "all_allies")
        (ai_set_orders "all_allies" "gondola_01_allies")
        (game_save_no_timeout)
        (sleep_until (= (volume_test_objects "vol_gondola_01" (players)) true) 30 1800)
        (if 
            (and
                (= (volume_test_objects "vol_gondola_01" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (wake gondola_01_cortana_reminder)
                )
        )
    )
)

(script static void short_central_plat_ph
    (begin
        (device_set_position_immediate "gondola_01_a" 0.5)
        (device_set_position_immediate "gondola_01_b" 0.5)
        (ai_place "central_platform_hunters" 2)
        (ai_place "central_platform_phantom" 1)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") phantom_p_a (ai_actors "central_platform_hunters"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot") true)
        (cs_run_command_script "central_platform_phantom/pilot" central_platform_dropship)
        (sleep 4000)
        (object_destroy (ai_vehicle_get_from_starting_location "central_platform_phantom/pilot"))
    )
)

(script dormant void assassin_ice_cream
    (begin
        (sleep_until (= (volume_test_objects_all "vol_assassins" (players)) false))
        (object_create "assassins")
        (ai_place "assassin_elites")
        (ai_set_active_camo "assassin_elites" true)
        (cs_run_command_script "assassin_elites" forever_pause)
        (custom_animation_loop (unit (list_get (ai_actors "assassin_elites") 0)) "objects\characters\elite\elite" "combat:sword:berserk" true)
        (custom_animation_loop (unit (list_get (ai_actors "assassin_elites") 1)) "objects\characters\elite\elite" "combat:sword:berserk" true)
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
            )
        )
        (reset_dsp_image 2)
    )
)

(script command_script void gondola_01_jumper_01
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_move_in_direction 90.0 2.0 0.0)
        (cs_move_in_direction 45.0 5.5 0.0)
        (cs_move_in_direction 95.0 1.0 0.0)
        (cs_jump 45.0 7.0)
    )
)

(script command_script void gondola_01_jumper_02
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_move_in_direction 90.0 2.75 0.0)
        (cs_move_in_direction 45.0 5.5 0.0)
        (cs_move_in_direction 90.0 1.0 0.0)
        (cs_jump 45.0 7.5)
    )
)

(script command_script void gondola_01_jumper_03
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_move_in_direction 90.0 3.5 0.0)
        (cs_move_in_direction 45.0 5.5 0.0)
        (cs_move_in_direction 85.0 1.0 0.0)
        (cs_jump 45.0 8.0)
    )
)

(script command_script void gondola_01_jumper_04
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_move_in_direction 90.0 4.25 0.0)
        (cs_move_in_direction 45.0 5.5 0.0)
        (cs_move_in_direction 75.0 1.0 0.0)
        (cs_jump 45.0 8.5)
    )
)

(script dormant void gondola_01_buggers_board
    (begin
        (sleep 150)
        (ai_place "gondola_01_bugs_new" 4)
    )
)

(script dormant void gondola_01_go_reminder
    (begin
        (sleep_until (> (device_group_get "gondola_01_switch") 0.0) 30 1800)
        (if (= (device_group_get "gondola_01_switch") 0.0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'if you hit the activation-switch, it should drive itself.'")
                (sleep (ai_play_line_on_object none "0960"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
        (sleep_until (> (device_group_get "gondola_01_switch") 0.0) 30 900)
        (if (= (device_group_get "gondola_01_switch") 0.0) 
            (begin
                (deactivate_nav_point_object default player "gondola_01_switch_back" 0.0)
                (sleep_until (< (device_get_position "gondola_01_a") 1.0))
                (error_overflow_suppression player "gondola_01_switch_back")
            )
        )
    )
)

(script command_script void gondola_01_boarders_warn
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'whoa!  we got boarders!'")
        (cs_play_line "0970")
    )
)

(script dormant void gondola_01_cortana_arch
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'this lake couldn't have been formed by volcanic action -'")
        (print "'which means it was either built this way on purpose,'")
        (print "'or was created by some other cataclysmic event.'")
        (sleep (ai_play_line_on_object none "0980"))
        (sleep 30)
        (print "cortana: 'sorry. were you trying to kill something?'")
        (sleep (ai_play_line_on_object none "0990"))
        (sleep 30)
        (ai_dialogue_enable true)
        (game_save_no_timeout)
    )
)

(script command_script void gondola_01_retreat
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 1.0)
        (cs_fly_by bsp1_airspace/ph_02_4 2.0)
        (cs_fly_to bsp1_airspace/ph_02_x 2.0)
        (ai_erase "gondola_01_phantom")
    )
)

(script dormant void gondola_01_unload
    (begin
        (sleep 90)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_a01)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_a02)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_a03)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_b01)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_b02)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_b03)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_c01)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_c02)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p_c03)
        (sleep 90)
        (cs_run_command_script "gondola_01_phantom/pilot" gondola_01_retreat)
    )
)

(script command_script void gondola_01_flight
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by bsp1_airspace/ph_02_0 2.0)
        (cs_fly_by bsp1_airspace/ph_02_1 2.0)
        (cs_fly_to_and_face bsp1_airspace/ph_02_2 bsp1_airspace/ph_02_3)
        (cs_vehicle_speed 0.3)
        (wake gondola_01_unload)
        (cs_fly_to bsp1_airspace/ph_02_3)
    )
)

(script dormant void gondola_01_phantom_arrives
    (begin
        (ai_place "gondola_01_elite_boarders" 2)
        (ai_place "gondola_01_grunt_boarders_01" 2)
        (ai_place "gondola_01_grunt_boarders_02" 2)
        (ai_place "gondola_01_phantom" 1)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p (ai_actors "gondola_01_grunt_boarders_01"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p (ai_actors "gondola_01_elite_boarders"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") phantom_p (ai_actors "gondola_01_grunt_boarders_02"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "gondola_01_phantom/pilot") true)
        (cs_run_command_script "gondola_01_phantom/pilot" gondola_01_flight)
        (sleep_until (< (ai_living_count "gondola_01_phantom") 2))
        (sleep_until 
            (and
                (<= (ai_living_count "gondola_01_grunt_boarders_01") 0)
                (<= (ai_living_count "gondola_01_grunt_boarders_02") 0)
            )
        )
        (ai_set_orders "gondola_01_elite_boarders" "gondola_01_all")
    )
)

(script command_script void tower3_turret_mount_01
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to tower3/left)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "tower3_turrets/left"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (sleep 120)
        (if (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "tower3_turrets/left") "c_turret_ap_d" (unit (ai_get_object ai_current_actor))) true) 
            (cs_set_behavior "guard"))
    )
)

(script command_script void tower3_turret_mount_02
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to tower3/right)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "tower3_turrets/right"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (sleep 120)
        (if (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "tower3_turrets/right") "c_turret_ap_d" (unit (ai_get_object ai_current_actor))) true) 
            (cs_set_behavior "guard"))
    )
)

(script dormant void tower3_turret_reman
    (begin
        (sleep 300)
        (sleep_until 
            (begin
                (sleep (random_range 30 90))
                (if 
                    (and
                        (> (object_get_health (ai_vehicle_get_from_starting_location "tower3_turrets/right")) 0.0)
                        (= (volume_test_objects "vol_tower3_entry" (players)) false)
                        (> (player_count) 0)
                        (< (ai_spawn_count "tower3_dock_grunts") 5)
                        (< (ai_living_count "tower3_dock_grunts") 1)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "tower3_turrets/right") "c_turret_ap_d" (ai_actors "all_enemies")) false)
                    ) 
                        (begin
                            (ai_place "tower3_dock_grunts" 1)
                            (cs_run_command_script "tower3_dock_grunts" tower3_turret_mount_02)
                        )
                )
                (sleep (random_range 30 90))
                (if 
                    (and
                        (> (object_get_health (ai_vehicle_get_from_starting_location "tower3_turrets/left")) 0.0)
                        (= (volume_test_objects "vol_tower3_entry" (players)) false)
                        (> (player_count) 0)
                        (< (ai_spawn_count "tower3_dock_grunts") 5)
                        (< (ai_living_count "tower3_dock_grunts") 1)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "tower3_turrets/left") "c_turret_ap_d" (ai_actors "all_enemies")) false)
                    ) 
                        (begin
                            (ai_place "tower3_dock_grunts" 1)
                            (cs_run_command_script "tower3_dock_grunts" tower3_turret_mount_01)
                        )
                )
                (or
                    (= (volume_test_objects "vol_tower3_entry" (player0)) true)
                    (and
                        (<= (object_get_health (ai_vehicle_get_from_starting_location "tower3_turrets/right")) 0.0)
                        (<= (object_get_health (ai_vehicle_get_from_starting_location "tower3_turrets/left")) 0.0)
                    )
                )
            )
        )
    )
)

(script dormant void tower3_dock_above
    (begin
        (sleep_until 
            (or
                (<= (ai_living_count "tower3_dock_snipers") 0)
                (= (device_get_position "gondola_01_a") 0.0)
            )
        )
        (if (> (device_get_position "gondola_01_a") 0.0) 
            (ai_place "tower3_dock_snipers" 2))
    )
)

(script dormant void gondola_01_nuke
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "tower_cluster_enemies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "tower_cluster_enemies") 0)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "tower_cluster_enemies") 0)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "tower_cluster_enemies") 1) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "tower_cluster_enemies") 1)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "tower_cluster_enemies") 1)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "tower_cluster_enemies") 2) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "tower_cluster_enemies") 2)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "tower_cluster_enemies") 2)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 0)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 1) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 1)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 2) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 2)))
                (sleep 5)
                (< (device_get_position "gondola_01_a") 0.25)
            )
        )
    )
)

(script dormant void gondola_01_restarter
    (begin
        (sleep_until 
            (begin
                (set gondola_01_state (device_get_position "gondola_01_a"))
                (if 
                    (and
                        (= (volume_test_objects_all "vol_gondola_01_mid" (players)) true)
                        (> (player_count) 0)
                    ) 
                        (begin
                            (device_set_position "gondola_01_a" 0.0)
                            (device_set_position "gondola_01_b" 0.0)
                        ) (begin
                            (device_set_position "gondola_01_a" gondola_01_state)
                            (device_set_position "gondola_01_b" gondola_01_state)
                        )
                )
                (< (device_get_position "gondola_01_a") 0.4)
            )
        )
    )
)

(script dormant void gondola_01_reverser
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (volume_test_objects_all "vol_gondola_01_mid" (players)) true)
                        (> (player_count) 0)
                    ) 
                        (begin
                            (device_set_position "gondola_01_a" 0.0)
                            (device_set_position "gondola_01_b" 0.0)
                        ) (begin
                            (device_set_position "gondola_01_a" 0.54)
                            (device_set_position "gondola_01_b" 0.54)
                        )
                )
                (< (device_get_position "gondola_01_a") 0.4)
            )
        )
    )
)

(script dormant void tower_cluster_delete
    (begin
        (sleep_until (= (objects_can_see_flag (players) "tower_cluster" 45.0) false) 30 300)
        (garbage_collect_unsafe)
        (object_destroy_containing "tower_cluster_")
    )
)

(script dormant void gondola_01_start
    (begin
        (sleep_until (= (volume_test_objects "vol_gondola_01" (players)) true))
        (ai_disposable "central_platform_enemies" true)
        (data_mine_insert "05b_5_gondola_01")
        (ai_renew "all_allies")
        (wake objective_towers_clear)
        (wake objective_gondola1_set)
        (wake gondola_01_go_reminder)
        (game_save_no_timeout)
        (sleep_until (> (device_group_get "gondola_01_switch") 0.0))
        (device_set_power "gondola_01_switch_back" 0.0)
        (wake music_05b_02_stop)
        (wake music_05b_03_stop)
        (wake tower_cluster_delete)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_gondola_01" (players)) true)
                (> (player_count) 0)
            )
        )
        (object_dynamic_simulation_disable "gondola_01_a" false)
        (object_dynamic_simulation_disable "gondola_01_b" false)
        (wake 05b_title1)
        (device_set_position "gondola_01_launch_a" 1.0)
        (device_set_position "gondola_01_launch_b" 1.0)
        (device_set_position "gondola_01_a" 0.54)
        (device_set_position "gondola_01_b" 0.54)
        (game_save_no_timeout)
        (wake gondola_01_buggers_board)
        (sleep_until (< (device_get_position "gondola_01_a") 0.85))
        (game_save_no_timeout)
        (ai_place "gondola_01_b_elites" 2)
        (ai_place "gondola_01_b_buggers" (- 4.0 (ai_living_count "gondola_01_bugs_new")))
        (ai_place "tower3_dock_grunts" 2)
        (cs_run_command_script "tower3_dock_grunts/1" tower3_turret_mount_01)
        (cs_run_command_script "tower3_dock_grunts/2" tower3_turret_mount_02)
        (wake gondola_01_nuke)
        (wake tower3_turret_reman)
        (sleep_until (< (device_get_position "gondola_01_a") 0.7))
        (wake gondola_01_cortana_arch)
        (sleep_until (= (device_get_position "gondola_01_a") 0.54))
        (game_save_no_timeout)
        (ai_place "tower3_dock_snipers" 2)
        (wake tower3_dock_above)
        (ai_set_orders "gondola_01_b_buggers" "gondola_01_all")
        (object_dynamic_simulation_disable "gondola_01_a" true)
        (object_dynamic_simulation_disable "gondola_01_b" true)
        (sleep_until (< (+ (ai_living_count "gondola_01_b_elites") (ai_living_count "gondola_01_b_buggers")) 1.0) 30 1800)
        (sleep_until (= (ai_trigger_test "done_fighting" "gondola_01_enemies") true) 30 1800)
        (sleep 60)
        (game_save_no_timeout)
        (object_dynamic_simulation_disable "gondola_01_a" false)
        (object_dynamic_simulation_disable "gondola_01_b" false)
        (wake music_05b_04_start)
        (wake gondola_01_reverser)
        (sleep_until (< (device_get_position "gondola_01_a") 0.25))
        (game_save_no_timeout)
        (sleep_until (= (device_get_position "gondola_01_a") 0.0))
        (game_save_no_timeout)
        (device_set_position "gondola_01_launch_a" 0.0)
        (device_set_position "gondola_01_launch_b" 0.0)
        (ai_place "tower3_dock_jackals" 2)
        (wake music_05b_04_stop)
        (if (difficulty_legendary) 
            (wake assassin_ice_cream))
        (sleep_until 
            (and
                (= (device_get_position "gondola_01_a") 0.0)
                (= (volume_test_objects_all "vol_gondola_01" (players)) false)
                (> (player_count) 0)
            )
        )
        (object_dynamic_simulation_disable "gondola_01_a" true)
        (object_dynamic_simulation_disable "gondola_01_b" true)
        (ai_set_orders "all_allies" "tower3_allies")
        (game_save_no_timeout)
    )
)

(script static void cam_shake
    (begin
        (player_effect_start 0.0 2.0 2.0)
        (player_effect_stop 1.0 1.0)
        (hud_show_health 0.5 0.0)
        (hud_blink_health 1.0)
    )
)

(script static void godownfast
    (begin
        (device_set_position_track "elev_under" "transition_1to2" 0.0)
        (device_animate_position "elev_under" 0.135 1.0 1.0 1.0 false)
    )
)

(script static void nowcomeup
    (begin
        (device_animate_position "elev_under" 0.0 15.0 1.0 1.0 false)
    )
)

(script static void go1to2
    (begin
        (device_set_position_track "elev_under" "transition_1to2" 0.0)
        (device_animate_position "elev_under" 0.103 10.0 1.0 1.0 false)
        (sleep_until (= (device_get_position "elev_under") 0.103))
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_under" (player0)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (object_teleport (player0) "1to2_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player0) "")
                )
        )
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_under" (player1)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (object_teleport (player1) "1to2_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player0) "")
                )
        )
        (structure_bsp_index 3)
        (sleep_until (= (version) 3))
        (device_animate_position "elev_under" 1.0 60.0 1.0 1.0 false)
        (sleep_until (> (device_get_position "elev_under") 0.122) 1)
        (effect_new splashy "splash_01")
        (effect_new splashy "splash_02")
        (effect_new splashy "splash_03")
        (effect_new splashy "splash_04")
        (effect_new splashy "splash_05")
        (effect_new splashy "splash_06")
        (effect_new splashy "splash_07")
        (effect_new splashy "splash_08")
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_impact_water" none 1.0)
        (object_destroy "water_1to2a")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_under") 0.128) 1)
        (object_create_anew "water_1to2a")
        (wake music_05b_05_start)
        (sleep 60)
        (ai_erase "all_enemies")
        (sleep_until 
            (begin
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 0)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 1)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 2)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 3)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 3)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 4)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 4)))
                (sleep 5)
                (> (device_get_position "elev_under") 0.5)
            )
        )
        (sleep_until (> (device_get_position "elev_under") 0.6))
        (sleep_until (> (device_get_position "elev_under") 0.866) 1)
        (effect_new splashy "splash_09")
        (effect_new splashy "splash_10")
        (effect_new splashy "splash_11")
        (effect_new splashy "splash_12")
        (effect_new splashy "splash_13")
        (effect_new splashy "splash_14")
        (effect_new splashy "splash_15")
        (effect_new splashy "splash_16")
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_out_of_water" none 1.0)
        (object_destroy "water_1to2b")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_under") 0.874) 1)
        (object_create_anew "water_1to2b")
    )
)

(script static void sub2doors
    (begin
        (device_set_position_track "elev_up" "transition_2to3" 0.0)
        (device_animate_position "elev_up" 0.0 1.0 1.0 1.0 false)
    )
)

(script static void go2to3
    (begin
        (device_set_position_track "elev_up" "transition_2to3" 0.0)
        (device_animate_position "elev_up" 0.103 10.0 1.0 1.0 false)
        (sleep_until (= (device_get_position "elev_up") 0.103))
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_up" (player0)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (object_teleport (player0) "2to3_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player0) "")
                )
        )
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_up" (player1)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (object_teleport (player1) "2to3_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player0) "")
                )
        )
        (structure_bsp_index 4)
        (sleep_until (= (version) 4))
        (device_animate_position "elev_up" 1.0 60.0 1.0 1.0 false)
        (sleep_until (> (device_get_position "elev_up") 0.134) 1)
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_impact_water" none 1.0)
        (object_destroy "water_2to3a")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_up") 0.143) 1)
        (object_create_anew "water_2to3a")
        (wake music_05b_08_start)
        (sleep 60)
        (ai_erase "all_enemies")
        (sleep_until 
            (begin
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 0)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 1)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 2)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 3)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 3)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 4)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 4)))
                (sleep 5)
                (> (device_get_position "elev_up") 0.7)
            )
        )
        (sleep_until (> (device_get_position "elev_up") 0.889) 1)
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_out_of_water" none 1.0)
        (object_destroy "water_2to3b")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_up") 0.896) 1)
        (object_create_anew "water_2to3b")
    )
)

(script command_script void tower3_pelican_path
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 1.0)
        (cs_fly_by tower3_airspace/pel0 2.0)
        (cs_vehicle_boost true)
        (cs_fly_by tower3_airspace/peln 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by tower3_airspace/pel1 5.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_by tower3_airspace/pel1 1.0)
        (cs_fly_to_and_face tower3_airspace/pel2 tower3_airspace/p0 1.0)
        (ai_place "tower3_pelican_allies" (- 2.0 (ai_living_count "allies_infantry")))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "tower3_pelican/pilot") pelican_p (ai_actors "tower3_pelican_allies"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "tower3_pelican/pilot") true)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "tower3_pelican/pilot") pelican_p)
        (sleep_until (< (ai_living_count "tower3_pelican") 4))
        (sleep 60)
        (cs_fly_to_and_face tower3_airspace/pel1 tower3_airspace/peln 2.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by tower3_airspace/peln 5.0)
        (cs_vehicle_boost true)
        (cs_fly_by tower3_airspace/pel0 20.0)
        (cs_vehicle_boost false)
        (cs_fly_to tower3_airspace/pelx 10.0)
        (ai_erase "tower3_pelican")
    )
)

(script dormant void tower3_pelican_arrives
    (begin
        (ai_place "tower3_pelican")
        (cs_run_command_script "tower3_pelican/pilot" tower3_pelican_path)
    )
)

(script static void short_tower3_pel
    (begin
        (ai_place "tower3_pelican")
        (cs_run_command_script "tower3_pelican/pilot" tower3_pelican_path)
    )
)

(script dormant void tower3_cortana_comment
    (begin
        (sleep_until (= (ai_trigger_test "done_fighting" "tower3_enemies") true))
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'ah, now i see. there's a submerged section that...'")
        (print "'...connects these towers to the outlying structures.'")
        (sleep (ai_play_line_on_object none "1000"))
        (sleep 60)
        (print "'looks like we're going down.'")
        (sleep (ai_play_line_on_object none "1010"))
        (sleep 30)
        (print "'unless you'd prefer to swim...'")
        (sleep (ai_play_line_on_object none "1020"))
        (set tower3_done_blabbing true)
    )
)

(script command_script void tower3_ally_warn
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'full car coming up!'")
        (cs_play_line "1040")
    )
)

(script dormant void tower3_cortana_reminder_02
    (begin
        (sleep_until (> (device_group_get "elev_under_switch") 0.0) 30 3600)
        (if (= (device_group_get "elev_under_switch") 0.0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'all right. let's see where this elevator goes...'")
                (sleep (ai_play_line_on_object none "1050"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
        (sleep_until (> (device_group_get "elev_under_switch") 0.0) 30 1800)
        (if (= (device_group_get "elev_under_switch") 0.0) 
            (begin
                (deactivate_nav_point_object default player "elev_under_switch_01" 0.0)
                (sleep_until (> (device_group_get "elev_under_switch") 0.0))
                (error_overflow_suppression player "elev_under_switch_01")
            )
        )
    )
)

(script dormant void elev_under_cortana_comment
    (begin
        (ai_dialogue_enable false)
        (sleep 180)
        (print "cortana: 'i've intercepted a secure transmission from regret's carrier...'")
        (print "'...to something called high charity. it's seems to be a formal apology - '")
        (print "'to the prophets of truth and mercy.'")
        (sleep (ai_play_line_on_object none "2120"))
        (sleep 15)
        (print "cortana: 'apparently, regret jumped the gun when he attacked earth.'")
        (print "'he's asking the other prophets to forgive his premature arrival...'")
        (print "'...arguing that no human presence was foretold.")
        (sleep (ai_play_line_on_object none "2130"))
        (print "cortana: 'that explains why there were so few ships in his fleet.'")
        (print "'but it's odd a prophet would have such bad intel about his enemy's home-world.'")
        (sleep (ai_play_line_on_object none "2140"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void elev_under_ally_01
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'hey, my ears just popped!'")
        (cs_play_line "1060")
    )
)

(script command_script void elev_under_ally_02
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'uh, just exactly how deep are we?'")
        (cs_play_line "1070")
    )
)

(script command_script void elev_under_ally_03
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'you think that glass is bulletproof?'")
        (cs_play_line "1080")
    )
)

(script dormant void tower3_sleeper_spawn
    (begin
        (sleep_until (= (volume_test_objects "vol_tower3_upstairs" (players)) true))
        (ai_place "tower3_sleeper" 1)
    )
)

(script dormant void elev_under_monitor
    (begin
        (sleep_until (> (device_group_get "elev_under_switch") 0.0))
        (device_set_power "elev_under_switch_01" 0.0)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_inside_elev_under" (players)) true)
                (> (player_count) 0)
            )
        )
        (device_set_position_track "elev_under" "transition_1to2" 0.0)
        (device_animate_position "elev_under" 0.103 10.0 1.0 1.0 false)
        (sleep_until (= (device_get_position "elev_under") 0.103))
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_under" (player0)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (object_teleport (player0) "1to2_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player0) "")
                )
        )
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_under" (player1)) false)
                (> (player_count) 0)
                (= (game_can_use_flashlights) true)
            ) 
                (begin
                    (object_teleport (player1) "1to2_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player1) "")
                )
        )
        (structure_bsp_index 3)
        (sleep_until (= (version) 3))
        (game_save_unsafe true)
        (device_animate_position "elev_under" 1.0 60.0 1.0 1.0 false)
        (sleep_until (> (device_get_position "elev_under") 0.122) 1)
        (effect_new splashy "splash_01")
        (effect_new splashy "splash_02")
        (effect_new splashy "splash_03")
        (effect_new splashy "splash_04")
        (effect_new splashy "splash_05")
        (effect_new splashy "splash_06")
        (effect_new splashy "splash_07")
        (effect_new splashy "splash_08")
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_impact_water" none 1.0)
        (object_destroy "water_1to2a")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_under") 0.128) 1)
        (object_create_anew "water_1to2a")
        (kill_volume_enable "kill_no_riders_under")
        (wake music_05b_05_start)
        (sleep 60)
        (wake elev_under_cortana_comment)
        (sleep_until 
            (begin
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 0)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 1)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 2)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 3)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 3)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 4)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 4)))
                (sleep 5)
                (> (device_get_position "elev_under") 0.5)
            )
        )
        (sleep_until (> (device_get_position "elev_under") 0.6))
        (sleep_until (> (device_get_position "elev_under") 0.866) 1)
        (effect_new splashy "splash_09")
        (effect_new splashy "splash_10")
        (effect_new splashy "splash_11")
        (effect_new splashy "splash_12")
        (effect_new splashy "splash_13")
        (effect_new splashy "splash_14")
        (effect_new splashy "splash_15")
        (effect_new splashy "splash_16")
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_out_of_water" none 1.0)
        (object_destroy "water_1to2b")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_under") 0.874) 1)
        (object_create_anew "water_1to2b")
        (kill_volume_disable "kill_no_riders_under")
    )
)

(script dormant void tower3_start
    (begin
        (ai_disposable "gondola_01_enemies" true)
        (data_mine_insert "05b_6_tower3")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (objects_attach "elev_under" "switch" "elev_under_switch_01" "")
        (device_group_change_only_once_more_set "elev_under_switch" true)
        (godownfast)
        (wake tower3_sleeper_spawn)
        (wake objective_gondola1_clear)
        (wake objective_sunken_set)
        (ai_place "tower3_jackals_01" 4)
        (sleep_forever tower3_turret_reman)
        (cs_run_command_script "tower3_turrets" abort)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower3_mid" (players)) true)
                (< (ai_living_count "tower3_main") 2)
            )
        )
        (game_save_no_timeout)
        (ai_place "tower3_jackals_02" (- 4.0 (ai_living_count "tower3_jackals_01")))
        (sleep_until (< (ai_living_count "tower3_main") 2) 30 3600)
        (game_save_no_timeout)
        (if 
            (and
                (= (volume_test_objects "vol_tower3_upstairs" (players)) false)
                (> (player_count) 0)
            ) 
                (ai_place "tower3_buggers_01" 3))
        (sleep_until (< (ai_living_count "tower3_main") 2) 30 3600)
        (game_save_no_timeout)
        (if 
            (and
                (= (volume_test_objects "vol_tower3_upstairs" (players)) false)
                (> (player_count) 0)
            ) 
                (ai_place "tower3_buggers_02" (- 3.0 (ai_living_count "tower3_buggers_01"))))
        (sleep_until (<= (ai_living_count "tower3_main") 0) 30 3600)
        (wake tower3_cortana_comment)
        (if (< (ai_living_count "all_allies") 2) 
            (wake tower3_pelican_arrives))
        (sleep_until (= tower3_done_blabbing true))
        (ai_place "tower3_jackals_elev" 3)
        (sleep 30)
        (game_save_no_timeout)
        (nowcomeup)
        (kill_volume_disable "kill_no_riders_under")
        (sleep 150)
        (ai_scene "tower3_ally_scene" tower3_ally_warn "all_allies")
        (sleep_until (= (device_get_position "elev_under") 0.0))
        (ai_set_orders "tower3_jackals_elev" "tower3_int_elev_ridge")
        (wake tower3_cortana_reminder_02)
        (wake elev_under_monitor)
        (sleep_until 
            (or
                (<= (ai_living_count "tower3_main") 0)
                (and
                    (= (volume_test_objects_all "vol_inside_elev_under" (players)) true)
                    (> (player_count) 0)
                )
            )
        )
        (ai_set_orders "all_allies" "tower3_on_elev")
    )
)

(script dormant void tunnel_01_cortana_comment
    (begin
        (sleep_until 
            (or
                (= (ai_trigger_test "done_fighting" "tunnel_01_enemies") true)
                (= (volume_test_objects "vol_sunken_chamber_entry" (players)) true)
            )
        )
        (sleep_until (= (volume_test_objects "vol_sunken_chamber_entry" (players)) true) 30 300)
        (if 
            (and
                (= (volume_test_objects "vol_sunken_chamber_entry" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'out there...look! more ruins!'")
                    (sleep (ai_play_line_on_object none "1090"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void sunken_tunnel1_start
    (begin
        (ai_disposable "tower3_enemies" true)
        (data_mine_insert "05b_7_tunnel1")
        (ai_renew "all_allies")
        (sleep_until (= (device_get_position "elev_under") 1.0))
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "tunnel_01_suppress")
        (ai_place "tunnel_01_grunts_patrol" 2)
        (ai_place "tunnel_01_grunts_01" 3)
        (ai_place "tunnel_01_grunts_02" 2)
        (wake music_05b_06_start)
        (sleep_until 
            (or
                (> (ai_combat_status "tunnel_01_enemies") ai_combat_status_idle)
                (= (volume_test_objects "vol_tunnel_01_mid" (players)) true)
            )
        )
        (sleep 60)
        (ai_set_orders "all_allies" "tunnel_01_allies")
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tunnel_01_mid" (players)) true)
                (< (ai_living_count "tunnel_01_enemies") 5)
            )
        )
        (game_save_no_timeout)
        (ai_place "tunnel_01_grunts_03" (- 3.0 (ai_living_count "tunnel_01_grunts_01")))
        (sleep_until 
            (or
                (<= (ai_living_count "tunnel_01_enemies") 0)
                (= (volume_test_objects "vol_sunken_chamber_entry" (players)) true)
            ) 
        30 1800)
        (game_save_no_timeout)
    )
)

(script dormant void sunken_holo_cortana_comment
    (begin
        (sleep_until 
            (and
                (< (objects_distance_to_object (players) "regret02") 10.0)
                (objects_can_see_object (players) "regret02" 30.0)
                (= (volume_test_objects "vol_sunk_chamber_right" (players)) true)
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'and people say i've got a big head...'")
        (sleep (ai_play_line_on_object none "1100"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void sunken_holo_ally_react
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'oh, man. he is so dead!'")
        (cs_play_line "1110")
    )
)

(script dormant void sunken_holo_looper
    (begin
        (object_create_anew "sunken_throne")
        (object_create_anew "regret02")
        (objects_attach "sunken_throne" "driver" "regret02" "")
        (ai_disregard "regret02" true)
        (sleep_until 
            (begin
                (begin_random
                    (if (= sunken_holo_trans false) 
                        (begin
                            (set sunken_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant1a" true)
                            (sleep (ai_play_line_on_object "regret02" "3000"))
                            (sleep (random_range 240 480))
                            (set sunken_holo_chant false)
                        )
                    )
                    (if (= sunken_holo_trans false) 
                        (begin
                            (set sunken_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant2b" true)
                            (sleep (ai_play_line_on_object "regret02" "3001"))
                            (sleep (random_range 240 480))
                            (set sunken_holo_chant false)
                        )
                    )
                    (if (= sunken_holo_trans false) 
                        (begin
                            (set sunken_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant2c" true)
                            (sleep (ai_play_line_on_object "regret02" "3002"))
                            (sleep (random_range 240 480))
                            (set sunken_holo_chant false)
                        )
                    )
                    (if (= sunken_holo_trans false) 
                        (begin
                            (set sunken_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant3a" true)
                            (sleep (ai_play_line_on_object "regret02" "3003"))
                            (sleep (random_range 240 480))
                            (set sunken_holo_chant false)
                        )
                    )
                    (if (= sunken_holo_trans false) 
                        (begin
                            (set sunken_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant3c" true)
                            (sleep (ai_play_line_on_object "regret02" "3004"))
                            (sleep (random_range 240 480))
                            (set sunken_holo_chant false)
                        )
                    )
                    (if (= sunken_holo_trans false) 
                        (begin
                            (set sunken_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant5a" true)
                            (sleep (ai_play_line_on_object "regret02" "3005"))
                            (sleep (random_range 240 480))
                            (set sunken_holo_chant false)
                        )
                    )
                    (if (= sunken_holo_trans false) 
                        (begin
                            (set sunken_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant6a" true)
                            (sleep (ai_play_line_on_object "regret02" "3006"))
                            (sleep (random_range 240 480))
                            (set sunken_holo_chant false)
                        )
                    )
                )
                false
            )
        )
    )
)

(script dormant void sunken_holo_translate
    (begin
        (sleep_until (<= (ai_living_count "sunken_chamber_enemies") 0))
        (sleep 150)
        (set sunken_holo_trans true)
        (sleep_until 
            (and
                (< (objects_distance_to_object (players) "regret02") 10.0)
                (= sunken_holo_chant false)
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (print "regret: 'most of those we encountered on our search were compelled...'")
        (print "regret: '...to join our union - to take part in a movement that promised...'")
        (print "regret: '...freedom for allegiance! salvation for service!'")
        (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_l05_0140_por" true)
        (sleep (ai_play_line_on_object "regret02" "0140"))
        (sleep 30)
        (print "'but some, like the humans, chose to impede our progress -'")
        (print "'block our access to sacred sites, damage holy relics! for their...'")
        (print "'...transgressions the humans shall be hunted until none remain alive!'")
        (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_l05_0150_por" true)
        (sleep (ai_play_line_on_object "regret02" "0150"))
        (sleep 60)
        (ai_scene "sunken_holo_ally_scene" sunken_holo_ally_react "all_allies")
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep (random_range 240 480))
        (set sunken_holo_trans false)
    )
)

(script dormant void sunken_chamber_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'keep moving. let's find our way back to the surface.'")
                    (sleep (ai_play_line_on_object none "1120"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void hide_rightside_guys
    (begin
        (sleep_until (> (ai_combat_status "sunk_chamber_right_enemies") ai_combat_status_idle))
        (sleep_until 
            (begin
                (sleep_until 
                    (and
                        (= (volume_test_objects_all "vol_sunk_chamber_left" (players)) true)
                        (> (player_count) 0)
                        (> (ai_living_count "sunken_rightside_nonsnipers") 0)
                    )
                )
                (ai_set_orders "sunken_rightside_nonsnipers" "sunken_rightside_hide")
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "sunken_rightside_nonsnipers") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "sunken_rightside_nonsnipers") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "sunken_rightside_nonsnipers") 0)))
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "sunken_rightside_nonsnipers") 1) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "sunken_rightside_nonsnipers") 1)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "sunken_rightside_nonsnipers") 1)))
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "sunken_rightside_nonsnipers") 2) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "sunken_rightside_nonsnipers") 2)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "sunken_rightside_nonsnipers") 2)))
                (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) true)
            )
        )
    )
)

(script dormant void hide_leftside_guys
    (begin
        (sleep_until (> (ai_combat_status "sunk_chamber_left_enemies") ai_combat_status_idle))
        (sleep_until 
            (begin
                (sleep_until 
                    (and
                        (= (volume_test_objects_all "vol_sunk_chamber_right" (players)) true)
                        (> (player_count) 0)
                        (> (ai_living_count "sunken_leftside_nonsnipers") 0)
                    )
                )
                (ai_set_orders "sunken_leftside_nonsnipers" "sunken_leftside_hide")
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "sunken_leftside_nonsnipers") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "sunken_leftside_nonsnipers") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "sunken_leftside_nonsnipers") 0)))
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "sunken_leftside_nonsnipers") 1) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "sunken_leftside_nonsnipers") 1)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "sunken_leftside_nonsnipers") 1)))
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "sunken_leftside_nonsnipers") 2) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "sunken_leftside_nonsnipers") 2)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "sunken_leftside_nonsnipers") 2)))
                (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) true)
            )
        )
    )
)

(script command_script void sunken_hologram_focus
    (begin
        (cs_abort_on_alert true)
        (cs_face_object true "regret02")
        (cs_pause -1.0)
    )
)

(script static void sunken_try_reinforce_r
    (begin
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_r1a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_r1b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r1a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r1b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_jack_r_01" (- sunken_jacks_total (ai_living_count "sunken_jacks_right"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_hg_r_01" (- sunken_hg_total (ai_living_count "sunken_hg_right"))))
                )
        )
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_r2a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_r2b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r2a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r2b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_jack_r_02" (- sunken_jacks_total (ai_living_count "sunken_jacks_right"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_hg_r_02" (- sunken_hg_total (ai_living_count "sunken_hg_right"))))
                )
        )
    )
)

(script static void sunken_try_reinforce_l
    (begin
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_l1a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_l1b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l1a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l1b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_jack_l_01" (- sunken_jacks_total (ai_living_count "sunken_jacks_left"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_hg_l_01" (- sunken_hg_total (ai_living_count "sunken_hg_left"))))
                )
        )
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_l2a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_l2b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l2a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l2b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_jack_l_02" (- sunken_jacks_total (ai_living_count "sunken_jacks_left"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_hg_l_02" (- sunken_hg_total (ai_living_count "sunken_hg_left"))))
                )
        )
    )
)

(script static void sunken_try_js_r1
    (begin
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_r1a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_r1b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r1a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r1b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_js_r_01" (- sunken_sniper_total (ai_living_count "sunken_rightside_snipers"))))
                )
        )
    )
)

(script static void sunken_try_js_r2
    (begin
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_r2a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_r2b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r2a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_r2b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_js_r_02" (- sunken_sniper_total (ai_living_count "sunken_rightside_snipers"))))
                )
        )
    )
)

(script static void sunken_try_js_l1
    (begin
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_l1a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_l1b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l1a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l1b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_js_l_01" (- sunken_sniper_total (ai_living_count "sunken_leftside_snipers"))))
                )
        )
    )
)

(script static void sunken_try_js_l2
    (begin
        (if 
            (and
                (= (device_get_position "sunk_chmbr_spwn_l2a") 0.0)
                (= (device_get_position "sunk_chmbr_spwn_l2b") 0.0)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l2a" (players)) false)
                (= (volume_test_objects "vol_sunk_chmbr_spwn_l2b" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_js_l_02" (- sunken_sniper_total (ai_living_count "sunken_leftside_snipers"))))
                )
        )
    )
)

(script dormant void sunk_chamber_hunters_enter
    (begin
        (sleep_until 
            (or
                (> (ai_combat_status "sunken_chamber_enemies") ai_combat_status_idle)
                (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) true)
            )
        )
        (if 
            (and
                (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (device_operates_automatically_set "sunk_chamber_hunter_door" true)
                    (ai_place "sunk_chamber_hunters" 2)
                )
        )
    )
)

(script dormant void sunken_chamber_saves
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (and
                        (game_all_quiet)
                        (= sunken_save_again true)
                    )
                )
                (game_reverted)
                (set sunken_save_again false)
                (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) true)
            )
        )
    )
)

(script dormant void sunken_chamber_start
    (begin
        (sleep_until (= (volume_test_objects "vol_sunken_chamber_entry" (players)) true))
        (ai_disposable "tunnel_01_enemies" true)
        (data_mine_insert "05b_8_sunken_chamber")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (if (difficulty_legendary) 
            (begin
                (set sunken_sniper_total 4)
                (set sunken_jacks_total 0)
                (set sunken_hg_total 3)
            )
        )
        (if (difficulty_heroic) 
            (begin
                (set sunken_sniper_total 3)
                (set sunken_jacks_total 1)
                (set sunken_hg_total 2)
            )
        )
        (ai_place "sunk_chamber_init_js_l01" 1)
        (ai_place "sunk_chamber_init_js_l02" 1)
        (ai_place "sunk_chamber_init_js_r01" 1)
        (cs_run_command_script "sunk_chamber_init_js_r01" sunken_hologram_focus)
        (ai_place "sunk_chamber_init_js_r02" 1)
        (cs_run_command_script "sunk_chamber_init_js_r02" sunken_hologram_focus)
        (ai_place "sunk_chamber_init_hg_ra" 1)
        (ai_place "sunk_chamber_init_hg_la" 1)
        (wake sunken_holo_looper)
        (wake sunken_holo_cortana_comment)
        (wake hide_rightside_guys)
        (wake hide_leftside_guys)
        (wake sunken_chamber_saves)
        (ai_set_orders "all_allies" "sunken_chamber_allies")
        (sleep_until 
            (or
                (= (volume_test_objects "vol_sunk_chamber_near_01" (players)) true)
                (> (ai_combat_status "sunken_chamber_enemies") ai_combat_status_uninspected)
            )
        )
        (set sunken_save_again true)
        (wake music_05b_06_stop)
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_left" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_l_01" 4))
                    (sunken_try_js_r1)
                )
        )
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_right" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_r_01" 4))
                    (sunken_try_js_l1)
                )
        )
        (if 
            (and
                (= (volume_test_objects "vol_sunk_chamber_right" (players)) true)
                (= (volume_test_objects "vol_sunk_chamber_left" (players)) true)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_r_01" 2))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_l_01" 2))
                    (sunken_try_js_r1)
                    (sunken_try_js_l1)
                )
        )
        (sleep_until (= (volume_test_objects "vol_sunk_chamber_near_02" (players)) true))
        (set sunken_save_again true)
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_left" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (sunken_try_reinforce_l)
                    (sunken_try_js_r1)
                )
        )
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_right" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (sunken_try_reinforce_r)
                    (sunken_try_js_l1)
                )
        )
        (if 
            (and
                (= (volume_test_objects "vol_sunk_chamber_right" (players)) true)
                (= (volume_test_objects "vol_sunk_chamber_left" (players)) true)
            ) 
                (begin
                    (sunken_try_reinforce_r)
                    (sunken_try_reinforce_l)
                    (sunken_try_js_r1)
                    (sunken_try_js_l1)
                )
        )
        (sleep_until (= (volume_test_objects "vol_sunk_chamber_far_01" (players)) true))
        (set sunken_save_again true)
        (wake sunk_chamber_hunters_enter)
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_left" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_l_02" (- 4.0 (ai_living_count "sunken_bugs"))))
                    (sunken_try_js_r2)
                )
        )
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_right" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_r_02" (- 4.0 (ai_living_count "sunken_bugs"))))
                    (sunken_try_js_l2)
                )
        )
        (if 
            (and
                (= (volume_test_objects "vol_sunk_chamber_right" (players)) true)
                (= (volume_test_objects "vol_sunk_chamber_left" (players)) true)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_r_02" (- 2.0 (ai_living_count "sunk_chamber_bugs_r_01"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_bugs_l_02" (- 2.0 (ai_living_count "sunk_chamber_bugs_l_01"))))
                    (sunken_try_js_l2)
                    (sunken_try_js_r2)
                )
        )
        (sleep_until (= (volume_test_objects "vol_sunk_chamber_far_02" (players)) true))
        (set sunken_save_again true)
        (wake sunken_chamber_reminder)
        (device_operates_automatically_set "sunk_chamber_exit_r" true)
        (device_operates_automatically_set "sunk_chamber_exit_l" true)
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_left" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_j01_l" (- 2.0 (ai_living_count "sunken_jacks_left"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_e_l" (max 1.0 (- 2.0 (ai_living_count "sunken_hg_left")))))
                )
        )
        (if 
            (and
                (= (volume_test_objects_all "vol_sunk_chamber_right" (players)) true)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_j01_r" (- 2.0 (ai_living_count "sunken_jacks_right"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_e_r" (max 1.0 (- 2.0 (ai_living_count "sunken_hg_right")))))
                )
        )
        (if 
            (and
                (= (volume_test_objects "vol_sunk_chamber_right" (players)) true)
                (= (volume_test_objects "vol_sunk_chamber_left" (players)) true)
            ) 
                (begin
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_j01_l" (- 2.0 (ai_living_count "sunken_jacks_left"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_j01_r" (- 2.0 (ai_living_count "sunken_jacks_right"))))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_e_l" 1))
                    (if (< (ai_living_count "sunken_chamber_enemies") 8) 
                        (ai_place "sunk_chamber_exit_e_r" 1))
                )
        )
        (if (< (ai_living_count "sunken_chamber_enemies") 8) 
            (ai_place "sunk_chamber_exit_j02_r" 2))
        (if (< (ai_living_count "sunken_chamber_enemies") 8) 
            (ai_place "sunk_chamber_exit_j02_l" 2))
        (wake sunken_holo_translate)
        (sleep_until (= (volume_test_objects "vol_leaving_sunken_chamber" (players)) true))
        (set sunken_save_again true)
        (ai_set_orders "all_allies" "tunnel_02_allies")
    )
)

(script dormant void elev_up_cortana_comment
    (begin
        (ai_dialogue_enable false)
        (sleep 180)
        (print "cortana: 'regret's carrier just received a response from high charity.'")
        (print "'a very well-encrypted message from the prophet of truth.'")
        (sleep (ai_play_line_on_object none "2150"))
        (sleep 15)
        (print "cortana: 'listen to this: your haste has jeopardized the fulfillment of our covenant -'")
        (print "'threatened our grand design. that you shall be spared a public display of our contempt...'")
        (print "'...is thanks only to mercy and his wise counsel.'")
        (sleep (ai_play_line_on_object none "2160"))
        (print "cortana: 'truth, mercy, regret. three prophet hierarchs.'")
        (print "'killing regret should shake-up the covenant leadership, but, frankly'")
        (print "'it sounds like you might be doing truth a favor.'")
        (sleep (ai_play_line_on_object none "2170"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void elev_up_monitor
    (begin
        (sleep_until (> (device_group_get "elev_up_switch") 0.0))
        (device_set_power "elev_up_switch_01" 0.0)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_inside_elev_up" (players)) true)
                (> (player_count) 0)
            )
        )
        (device_animate_position "elev_up" 0.103 10.0 1.0 1.0 false)
        (sleep_until (= (device_get_position "elev_up") 0.103))
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_up" (player0)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (object_teleport (player0) "2to3_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player0) "")
                )
        )
        (if 
            (and
                (= (volume_test_object "vol_elev_shaft_up" (player1)) false)
                (> (player_count) 0)
                (= (game_can_use_flashlights) true)
            ) 
                (begin
                    (object_teleport (player1) "2to3_teleport")
                    (effect_new_on_object_marker "effects\gameplay\coop_teleport" (player1) "")
                )
        )
        (structure_bsp_index 4)
        (sleep_until (= (version) 4))
        (device_animate_position "elev_up" 1.0 60.0 1.0 1.0 false)
        (sleep_until (> (device_get_position "elev_up") 0.134) 1)
        (effect_new splashy "splash_17")
        (effect_new splashy "splash_18")
        (effect_new splashy "splash_19")
        (effect_new splashy "splash_20")
        (effect_new splashy "splash_21")
        (effect_new splashy "splash_22")
        (effect_new splashy "splash_23")
        (effect_new splashy "splash_24")
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_impact_water" none 1.0)
        (object_destroy "water_2to3a")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_up") 0.143) 1)
        (object_create_anew "water_2to3a")
        (kill_volume_enable "kill_no_riders_up")
        (wake music_05b_08_start)
        (sleep 60)
        (wake elev_up_cortana_comment)
        (sleep_until 
            (begin
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 0)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 1)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 2)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 3)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 3)))
                (sleep 5)
                (if (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 4)) 5.0) 
                    (object_destroy (list_get (ai_actors "all_allies") 4)))
                (sleep 5)
                (> (device_get_position "elev_up") 0.7)
            )
        )
        (sleep_until (> (device_get_position "elev_up") 0.889) 1)
        (effect_new splashy "splash_25")
        (effect_new splashy "splash_26")
        (effect_new splashy "splash_27")
        (effect_new splashy "splash_28")
        (effect_new splashy "splash_29")
        (effect_new splashy "splash_30")
        (effect_new splashy "splash_31")
        (effect_new splashy "splash_32")
        (sound_impulse_start_effect "sound\ambience\device_machines\delta_sub\sub_water_in_out\sub_out_of_water" none 1.0)
        (object_destroy "water_2to3b")
        (cam_shake)
        (sleep_until (> (device_get_position "elev_up") 0.896) 1)
        (object_create_anew "water_2to3b")
        (kill_volume_disable "kill_no_riders_up")
    )
)

(script dormant void sunken_tunnel2_start
    (begin
        (sleep_until (= (volume_test_objects "vol_tunnel_02_entry" (players)) true))
        (ai_disposable "sunken_chamber_enemies" true)
        (data_mine_insert "05b_9_tunnel2")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (objects_attach "elev_up" "switch" "elev_up_switch_01" "")
        (device_group_change_only_once_more_set "elev_up_switch" true)
        (sub2doors)
        (wake elev_up_monitor)
        (ai_place "tunnel_02_elites_01" 1)
        (ai_place "tunnel_02_elites_02" 1)
        (ai_set_active_camo "tunnel_02_elites_01" true)
        (ai_set_active_camo "tunnel_02_elites_02" true)
        (ai_set_orders "all_allies" "tunnel_02_suppress")
        (wake music_05b_07_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tunnel_02_mid_01" (players)) true)
                (> (ai_combat_status "tunnel_02_enemies") ai_combat_status_idle)
                (< (ai_living_count "tunnel_02_enemies") 1)
            )
        )
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "tunnel_02_allies")
        (ai_place "tunnel_02_elites_04" (- 1.0 (+ (ai_living_count "tunnel_02_elites_01") (ai_living_count "tunnel_02_elites_02"))))
        (ai_set_active_camo "tunnel_02_elites_04" true)
        (ai_place "tunnel_02_grunts" 3)
        (ai_set_active_camo "tunnel_02_grunts" true)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tunnel_02_mid_02" (players)) true)
                (< (ai_living_count "tunnel_02_enemies") 1)
            )
        )
        (game_save_no_timeout)
        (ai_place "tunnel_02_elites_03" 1)
        (ai_set_active_camo "tunnel_02_elites_03" true)
        (sleep_until (= (volume_test_objects "vol_elev_up_dock" (players)) true))
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "tunnel_02_on_elev")
    )
)

(script dormant void island_holo_looper
    (begin
        (object_create_anew "island_throne")
        (object_create_anew "regret03")
        (objects_attach "island_throne" "driver" "regret03" "")
        (ai_disregard "regret03" true)
        (sleep_until 
            (begin
                (begin_random
                    (if (= island_holo_trans false) 
                        (begin
                            (set island_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant1a" true)
                            (sleep (ai_play_line_on_object "regret03" "3000"))
                            (sleep (random_range 240 480))
                            (set island_holo_chant false)
                        )
                    )
                    (if (= island_holo_trans false) 
                        (begin
                            (set island_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant2b" true)
                            (sleep (ai_play_line_on_object "regret03" "3001"))
                            (sleep (random_range 240 480))
                            (set island_holo_chant false)
                        )
                    )
                    (if (= island_holo_trans false) 
                        (begin
                            (set island_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant2c" true)
                            (sleep (ai_play_line_on_object "regret03" "3002"))
                            (sleep (random_range 240 480))
                            (set island_holo_chant false)
                        )
                    )
                    (if (= island_holo_trans false) 
                        (begin
                            (set island_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant3a" true)
                            (sleep (ai_play_line_on_object "regret03" "3003"))
                            (sleep (random_range 240 480))
                            (set island_holo_chant false)
                        )
                    )
                    (if (= island_holo_trans false) 
                        (begin
                            (set island_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant3c" true)
                            (sleep (ai_play_line_on_object "regret03" "3004"))
                            (sleep (random_range 240 480))
                            (set island_holo_chant false)
                        )
                    )
                    (if (= island_holo_trans false) 
                        (begin
                            (set island_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant5a" true)
                            (sleep (ai_play_line_on_object "regret03" "3005"))
                            (sleep (random_range 240 480))
                            (set island_holo_chant false)
                        )
                    )
                    (if (= island_holo_trans false) 
                        (begin
                            (set island_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant6a" true)
                            (sleep (ai_play_line_on_object "regret03" "3006"))
                            (sleep (random_range 240 480))
                            (set island_holo_chant false)
                        )
                    )
                )
                false
            )
        )
    )
)

(script dormant void island_int_translate
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_02" (players)) true)
                (<= (ai_living_count "island_int_enemies") 0)
            )
        )
        (sleep 150)
        (set island_holo_trans true)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_02" (players)) true)
                (= island_holo_chant false)
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (print "regret: 'every member of the covenant shall walk the path!'")
        (print "'none will be left behind when our great journey begins!'")
        (print "'that is the prophets' age-old promise! and it shall be fulfilled!'")
        (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_l05_0160_por" true)
        (sleep (ai_play_line_on_object "regret03" "0160"))
        (sleep 30)
        (print "cortana: 'great journey? doesn't he know what these rings do?'")
        (sleep (ai_play_line_on_object none "1130"))
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep (random_range 240 480))
        (set island_holo_trans false)
    )
)

(script dormant void island_interior_start
    (begin
        (ai_disposable "tunnel_02_enemies" true)
        (game_save_unsafe false)
        (wake objective_sunken_clear)
        (wake objective_temple_set)
        (objects_attach "gondola_02_a" "control_front" "gondola_02_switch_front" "")
        (objects_attach "gondola_02_b" "control_front" "gondola_02_b_fake" "")
        (device_group_change_only_once_more_set "gondola_02_switch" true)
        (wake island_holo_looper)
        (data_mine_insert "05b_10_island_interior")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "island_int_allies")
        (ai_place "island_int_grunts" 4)
        (sleep 1)
        (ai_place "island_int_hg" 2)
        (wake island_int_translate)
    )
)

(script dormant void island_pelican_comment
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "pelican pilot: 'this is my last run, chief. i'm nearly out of fuel.'")
        (sleep (ai_play_line_on_object none "1140"))
        (sleep 30)
        (print "'we've secured the first tower cluster, so i'll set down there.'")
        (sleep (ai_play_line_on_object none "1150"))
        (sleep 30)
        (print "'call when you're ready for evac.'")
        (sleep (ai_play_line_on_object none "1160"))
        (sleep 30)
        (ai_dialogue_enable true)
        (game_save_no_timeout)
    )
)

(script command_script void island_pelican_path
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by island_airspace/pel0 2.0)
        (cs_vehicle_boost true)
        (cs_fly_by island_airspace/pel1 10.0)
        (cs_vehicle_boost false)
        (cs_fly_by island_airspace/p2 5.0)
        (cs_vehicle_speed 0.5)
        (set island_pelican_arrived true)
        (cs_fly_to island_airspace/p5 2.0)
        (cs_fly_to_and_face island_airspace/p6 island_airspace/p4 2.0)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_pelican/pilot") pelican_p)
        (sleep_until (< (ai_living_count "island_pelican") 4))
        (sleep 60)
        (cs_fly_to_and_face island_airspace/p5 island_airspace/p3 10.0)
        (cs_fly_to_and_face island_airspace/p5 island_airspace/pel2 1.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by island_airspace/pel2 2.0)
        (cs_vehicle_boost true)
        (cs_fly_by island_airspace/pel6 10.0)
        (cs_vehicle_boost false)
        (cs_fly_to island_airspace/pelx 20.0)
        (ai_erase "island_pelican")
    )
)

(script dormant void island_pelican_arrives
    (begin
        (ai_place "island_pelican_allies" (- 2.0 (ai_living_count "allies_infantry")))
        (ai_place "island_pelican")
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "island_pelican/pilot") pelican_p (ai_actors "island_pelican_allies"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "island_pelican/pilot") true)
        (object_create_anew "rack2")
        (objects_attach (ai_vehicle_get_from_starting_location "island_pelican/pilot") "pelican_sc_01" "rack2" "pin")
        (object_create_anew "bomb07")
        (objects_attach "rack2" "rack01" "bomb07" "pin")
        (object_create_anew "bomb08")
        (objects_attach "rack2" "rack02" "bomb08" "pin")
        (object_create_anew "bomb09")
        (objects_attach "rack2" "rack03" "bomb09" "pin")
        (object_create_anew "bomb10")
        (objects_attach "rack2" "rack04" "bomb10" "pin")
        (object_create_anew "bomb11")
        (objects_attach "rack2" "rack05" "bomb11" "pin")
        (object_create_anew "bomb12")
        (objects_attach "rack2" "rack06" "bomb12" "pin")
        (cs_run_command_script "island_pelican/pilot" island_pelican_path)
        (sleep 150)
        (wake island_pelican_comment)
        (sleep_until (= island_pelican_arrived true))
        (sleep 120)
        (begin_random
            (begin
                (objects_detach "rack2" "bomb07")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb08")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb09")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb10")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb11")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb12")
                (sleep (random_range 2 10))
            )
        )
    )
)

(script static void short_island_pel
    (begin
        (ai_place "island_pelican_allies" (- 2.0 (ai_living_count "allies_infantry")))
        (ai_place "island_pelican")
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "island_pelican/pilot") pelican_p (ai_actors "island_pelican_allies"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "island_pelican/pilot") true)
        (object_create_anew "rack2")
        (objects_attach (ai_vehicle_get_from_starting_location "island_pelican/pilot") "pelican_sc_01" "rack2" "pin")
        (object_create_anew "bomb07")
        (objects_attach "rack2" "rack01" "bomb07" "pin")
        (object_create_anew "bomb08")
        (objects_attach "rack2" "rack02" "bomb08" "pin")
        (object_create_anew "bomb09")
        (objects_attach "rack2" "rack03" "bomb09" "pin")
        (object_create_anew "bomb10")
        (objects_attach "rack2" "rack04" "bomb10" "pin")
        (object_create_anew "bomb11")
        (objects_attach "rack2" "rack05" "bomb11" "pin")
        (object_create_anew "bomb12")
        (objects_attach "rack2" "rack06" "bomb12" "pin")
        (cs_run_command_script "island_pelican/pilot" island_pelican_path)
        (sleep 150)
        (wake island_pelican_comment)
        (sleep_until (= island_pelican_arrived true))
        (sleep 90)
        (begin_random
            (begin
                (objects_detach "rack2" "bomb07")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb08")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb09")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb10")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb11")
                (sleep (random_range 2 10))
            )
            (begin
                (objects_detach "rack2" "bomb12")
                (sleep (random_range 2 10))
            )
        )
    )
)

(script dormant void island_gully_start
    (begin
        (sleep_until (= (volume_test_objects "vol_island_int_exit" (players)) true))
        (ai_disposable "island_int_enemies" true)
        (data_mine_insert "05b_11_island_gully")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "island_low_allies")
        (ai_place "island_gully_buggers_01" 4)
        (sleep 1)
        (ai_place "island_gully_elites_01" 2)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_island_gully_ridge" (players)) true)
                (< (ai_living_count "island_gully_enemies") 3)
            )
        )
        (game_save_no_timeout)
        (ai_place "island_gully_jackals_01" (- 3.0 (ai_living_count "island_gully_buggers_01")))
        (sleep 1)
        (ai_place "island_gully_elites_02" (- 2.0 (ai_living_count "island_gully_elites_01")))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_island_ext_start" (players)) true)
                (<= (ai_living_count "island_gully_enemies") 3)
            )
        )
        (if 
            (and
                (= (volume_test_objects "vol_island_ext_start" (players)) false)
                (> (player_count) 0)
            ) 
                (wake island_pelican_arrives))
    )
)

(script dormant void gondola_02_cortana_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_gondola_02" (players)) true) 30 3600)
        (if (= (volume_test_objects "vol_gondola_02" (players)) true) 
            (sleep_forever))
        (sleep_until 
            (or
                (= (objects_can_see_object (players) "gondola_02_a" 30.0) true)
                (= (volume_test_objects "vol_gondola_02" (players)) true)
            )
        )
        (if (= (volume_test_objects "vol_gondola_02" (players)) true) 
            (sleep_forever) (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'there. another gondola. looks like it leads straight to the main-temple.'")
                (sleep (ai_play_line_on_object none "1170"))
                (sleep 30)
                (print "'not much further now...'")
                (sleep (ai_play_line_on_object none "1180"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
        (sleep_until (> (device_get_position "gondola_02_a") 0.0) 30 1800)
        (if (> (device_get_position "gondola_02_a") 0.0) 
            (begin
                (deactivate_nav_point_object default player "gondola_02_switch_front" 0.0)
                (sleep_until (> (device_get_position "gondola_02_a") 0.0))
                (error_overflow_suppression player "gondola_02_switch_front")
            )
        )
    )
)

(script dormant void island_drop
    (begin
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "island_phantom/pilot") true)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_a01)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_a02)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_a03)
        (sleep 45)
        (ai_set_orders "island_phantom_jackals" "island_ext_07")
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_b01)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_b02)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_b03)
        (sleep 45)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_c01)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_c02)
        (sleep 5)
        (vehicle_unload (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_c03)
        (sleep 60)
        (ai_set_orders "island_phantom_elites" "island_ext_06")
        (ai_set_orders "island_phantom_grunts" "island_ext_06")
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "island_phantom/pilot") false)
    )
)

(script command_script void island_phantom_path
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by island_airspace/ph0 10.0)
        (cs_vehicle_boost false)
        (cs_fly_by island_airspace/ph1 10.0)
        (cs_vehicle_speed 0.5)
        (if (< (ai_living_count "island_all_enemies") 8) 
            (ai_place "island_phantom_elites" (- 2.0 (+ (ai_living_count "island_ext_elites_01") (ai_living_count "island_ext_elites_02")))))
        (if (< (ai_living_count "island_all_enemies") 8) 
            (ai_place "island_phantom_jackals" (- 3.0 (+ (ai_living_count "island_ext_js_01") (ai_living_count "island_ext_js_02") (ai_living_count "island_ext_js_03") (ai_living_count "island_ext_js_04")))))
        (if (< (ai_living_count "island_all_enemies") 8) 
            (ai_place "island_phantom_grunts" (- 3.0 (+ (ai_living_count "island_ext_grunts_01") (ai_living_count "island_ext_grunts_02")))))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_c (ai_actors "island_phantom_elites"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p_a (ai_actors "island_phantom_jackals"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "island_phantom/pilot") phantom_p (ai_actors "island_phantom_grunts"))
        (cs_fly_to island_airspace/ph2 5.0)
        (cs_vehicle_speed 0.25)
        (wake island_drop)
        (cs_fly_to island_airspace/ph2 2.0)
        (sleep_until (< (ai_living_count "island_phantom") 2))
        (sleep 60)
        (cs_fly_to_and_face island_airspace/ph1 island_airspace/ph0 2.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by island_airspace/ph0 10.0)
        (cs_vehicle_boost true)
        (cs_fly_by island_airspace/phx 20.0)
        (ai_erase "island_phantom")
    )
)

(script dormant void island_phantom_arrives
    (begin
        (ai_place "island_phantom")
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "island_phantom/pilot") true)
        (cs_run_command_script "island_phantom/pilot" island_phantom_path)
    )
)

(script static void short_island_ph
    (begin
        (ai_allegiance covenant prophet)
        (ai_place "island_phantom")
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "island_phantom/pilot") true)
        (cs_run_command_script "island_phantom/pilot" island_phantom_path)
    )
)

(script dormant void island_exterior_start
    (begin
        (sleep_until (= (volume_test_objects "vol_island_ext_start" (players)) true))
        (ai_disposable "island_gully_enemies" true)
        (data_mine_insert "05b_12_island_exterior")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "island_ext_allies")
        (ai_place "temple_ent_turrets" 2)
        (if (difficulty_legendary) 
            (begin
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_elites_01" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_elites_02" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_01" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_02" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_03" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_04" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_grunts_01" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_grunts_02" 1))
            )
        )
        (if (difficulty_heroic) 
            (begin
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_elites_01" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_elites_02" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_01" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_02" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_03" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_grunts_01" 2))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_grunts_02" 1))
            )
        )
        (if (difficulty_normal) 
            (begin
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_elites_01" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_01" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_js_03" 1))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_grunts_01" 2))
                (if (< (ai_living_count "island_all_enemies") 8) 
                    (ai_place "island_ext_grunts_02" 2))
            )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_island_ext_01" (players)) true)
                (< (ai_living_count "island_main_enemies") 3)
            )
        )
        (game_save_no_timeout)
        (wake island_phantom_arrives)
        (wake gondola_02_cortana_reminder)
        (sleep_until (= (volume_test_objects "vol_near_gondola_02" (players)) true))
        (game_save_no_timeout)
        (object_dynamic_simulation_disable "gondola_02_a" true)
        (object_dynamic_simulation_disable "gondola_02_b" true)
        (if (< (ai_living_count "island_all_enemies") 8) 
            (ai_place "near_gondola_02_jackals" (- 2.0 (ai_living_count "island_phantom_jackals"))))
        (if (< (ai_living_count "island_all_enemies") 8) 
            (ai_place "near_gondola_02_grunts" (- 3.0 (ai_living_count "island_phantom_grunts"))))
        (sleep_until 
            (or
                (<= (ai_living_count "island_main_enemies") 0)
                (> (device_get_position "gondola_02_a") 0.0)
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void island_miranda_conversation
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "miranda: 'how's it going, you two?'")
        (sleep (ai_play_line_on_object none "0170"))
        (sleep 30)
        (print "cortana: 'so far, so good. we're nearing the main-temple now.'")
        (sleep (ai_play_line_on_object none "0180"))
        (sleep 30)
        (print "miranda: 'roger that. i'm as close to the library as i can get.'")
        (print "'there's some sort of barrier...we're trying to find a way around it.'")
        (print "'i'll keep you posted.'")
        (sleep (ai_play_line_on_object none "0190"))
        (sleep 30)
        (ai_dialogue_enable true)
        (game_save_no_timeout)
        (wake music_05b_09_start)
        (sleep 90)
        (ai_set_blind "gondola_02_banshees" false)
    )
)

(script command_script void gondola_02_ally_comment
    (begin
        (cs_switch "ally01")
        (cs_abort_on_damage true)
        (print "ally: 'great. we gotta ride another one of these death-traps?'")
        (cs_play_line "1190")
        (cs_switch "ally02")
        (cs_abort_on_damage true)
        (print "ally: 'if you forget about the covenant and the fact that we're stuck...'")
        (print "'...on a freaky alien world…it's actually kinda fun.'")
        (cs_play_line "1200")
    )
)

(script command_script void temple_ent_turret_01
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "temple_ent_turrets/1"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void temple_ent_turret_02
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "temple_ent_turrets/2"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void banshee_retreat
    (begin
        (cs_vehicle_boost true)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep_until (= (volume_test_objects "vol_banshee_retreat" (ai_actors "gondola_02_banshees")) true) 30 4000)
        (ai_erase "gondola_02_banshees")
    )
)

(script dormant void gondola_02_nuke
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "island_all_enemies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "island_all_enemies") 0)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "island_all_enemies") 0)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "island_all_enemies") 1) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "island_all_enemies") 1)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "island_all_enemies") 1)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "island_all_enemies") 2) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "island_all_enemies") 2)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "island_all_enemies") 2)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 0)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 1) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 1)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 2) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 30.0)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 2)))
                (sleep 5)
                (> (device_get_position "gondola_02_a") 0.75)
            )
        )
    )
)

(script dormant void gondola_02_wake
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (> (device_get_position "gondola_02_a") 0.37)
                        (< (device_get_position "gondola_02_a") 0.59)
                        (> (device_get_position "gondola_02_a") gondola_02_wake_state)
                    ) 
                        (begin
                            (object_clear_function_variable "gondola_02_a" "wake_forward")
                            (object_clear_function_variable "gondola_02_a" "wake_backward")
                            (object_set_function_variable "gondola_02_a" "wake_backward" 1.0 1.0)
                            (object_clear_function_variable "gondola_02_b" "wake_forward")
                            (object_clear_function_variable "gondola_02_b" "wake_backward")
                            (object_set_function_variable "gondola_02_b" "wake_backward" 1.0 1.0)
                        )
                )
                (if 
                    (and
                        (> (device_get_position "gondola_02_a") 0.37)
                        (< (device_get_position "gondola_02_a") 0.59)
                        (< (device_get_position "gondola_02_a") gondola_02_wake_state)
                    ) 
                        (begin
                            (object_clear_function_variable "gondola_02_a" "wake_forward")
                            (object_clear_function_variable "gondola_02_a" "wake_backward")
                            (object_set_function_variable "gondola_02_a" "wake_forward" 1.0 1.0)
                            (object_clear_function_variable "gondola_02_b" "wake_forward")
                            (object_clear_function_variable "gondola_02_b" "wake_backward")
                            (object_set_function_variable "gondola_02_b" "wake_forward" 1.0 1.0)
                        )
                )
                (if 
                    (or
                        (= (device_get_position "gondola_02_a") gondola_02_wake_state)
                        (< (device_get_position "gondola_02_a") 0.37)
                        (> (device_get_position "gondola_02_a") 0.59)
                    ) 
                        (begin
                            (object_clear_function_variable "gondola_02_a" "wake_forward")
                            (object_clear_function_variable "gondola_02_a" "wake_backward")
                            (object_clear_function_variable "gondola_02_b" "wake_forward")
                            (object_clear_function_variable "gondola_02_b" "wake_backward")
                        )
                )
                (set gondola_02_wake_state (device_get_position "gondola_02_a"))
                (= (device_get_position "gondola_02_a") 1.0)
            )
        )
    )
)

(script dormant void gondola_02_restarter
    (begin
        (sleep_until 
            (begin
                (set gondola_02_state (device_get_position "gondola_02_a"))
                (if 
                    (and
                        (= (volume_test_objects_all "vol_gondola_02_mid" (players)) true)
                        (> (player_count) 0)
                    ) 
                        (begin
                            (device_set_position "gondola_02_a" 0.0)
                            (device_set_position "gondola_02_b" 0.0)
                        ) (begin
                            (device_set_position "gondola_02_a" gondola_02_state)
                            (device_set_position "gondola_02_b" gondola_02_state)
                        )
                )
                (> (device_get_position "gondola_02_a") 0.6)
            )
        )
    )
)

(script dormant void gondola_02_reverser
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (volume_test_objects_all "vol_gondola_02_mid" (players)) true)
                        (> (player_count) 0)
                    ) 
                        (begin
                            (device_set_position "gondola_02_a" 1.0)
                            (device_set_position "gondola_02_b" 1.0)
                        ) (begin
                            (device_set_position "gondola_02_a" 0.54)
                            (device_set_position "gondola_02_b" 0.54)
                        )
                )
                (> (device_get_position "gondola_02_a") 0.6)
            )
        )
    )
)

(script command_script void boost_test
    (begin
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_enable_moving true)
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 30.0))
    )
)

(script command_script void boost_to_temple_01
    (begin
        (cs_vehicle_boost true)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep_forever)
    )
)

(script command_script void boost_to_temple_02
    (begin
        (cs_vehicle_boost true)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep_forever)
    )
)

(script command_script void panic
    (begin
        (cs_enable_moving true)
        (cs_movement_mode 3)
        (sleep_forever)
    )
)

(script dormant void gondola_02_start
    (begin
        (sleep_until (= (volume_test_objects "vol_near_gondola_02" (players)) true))
        (ai_disposable "island_all_enemies" true)
        (sleep_until 
            (or
                (> (device_group_get "gondola_02_switch") 0.0)
                (< (ai_living_count "island_main_enemies") 1)
            )
        )
        (if (> (device_group_get "gondola_02_switch") 0.0) 
            (begin
                (ai_set_orders "all_allies" "gondola_02_allies")
            ) (begin
                (sleep 60)
                (ai_set_orders "all_allies" "gondola_02_allies")
                (ai_scene "gondola_02_ally_scene" gondola_02_ally_comment "all_allies")
            )
        )
        (data_mine_insert "05b_13_gondola_02")
        (ai_renew "all_allies")
        (sleep_until (> (device_group_get "gondola_02_switch") 0.0))
        (device_set_power "gondola_02_switch_front" 0.0)
        (wake gondola_02_wake)
        (object_dynamic_simulation_disable "gondola_02_a" false)
        (object_dynamic_simulation_disable "gondola_02_b" false)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_gondola_02" (players)) true)
                (> (player_count) 0)
            )
        )
        (device_set_position "gondola_02_launch_a" 1.0)
        (device_set_position "gondola_02_launch_b" 1.0)
        (device_set_position "gondola_02_a" 0.54)
        (device_set_position "gondola_02_b" 0.54)
        (wake island_miranda_conversation)
        (sleep 300)
        (ai_place "gondola_02_banshees" 2)
        (cs_run_command_script "gondola_02_banshees" boost_test)
        (sleep_until (>= (device_get_position "gondola_02_a") 0.25))
        (if (difficulty_legendary) 
            (ai_place "gondola_02_grunts" 4))
        (ai_place "gondola_02_jetpacks" 2)
        (sleep_until (>= (device_get_position "gondola_02_a") 0.43))
        (game_save_no_timeout)
        (wake gondola_02_nuke)
        (ai_set_orders "gondola_02_jetpacks" "gondola_02_jets")
        (sleep_until (= (device_get_position "gondola_02_a") 0.54))
        (object_dynamic_simulation_disable "gondola_02_a" true)
        (object_dynamic_simulation_disable "gondola_02_b" true)
        (sleep_until (< (+ (ai_living_count "gondola_02_grunts") (ai_living_count "gondola_02_jetpacks")) 1.0) 30 1800)
        (sleep_until (= (ai_trigger_test "done_fighting" "gondola_02_enemies") true) 30 1800)
        (game_save_no_timeout)
        (object_dynamic_simulation_disable "gondola_02_a" false)
        (object_dynamic_simulation_disable "gondola_02_b" false)
        (wake music_05b_09_start_alt)
        (wake gondola_02_reverser)
        (sleep_until (> (device_get_position "gondola_02_a") 0.75))
        (ai_set_orders "gondola_02_banshees" "airspace_island")
        (cs_run_command_script "gondola_02_banshees" banshee_retreat)
        (ai_place "temple_ent_grunts" 4)
        (cs_run_command_script "temple_ent_grunts/1" temple_ent_turret_01)
        (cs_run_command_script "temple_ent_grunts/2" temple_ent_turret_02)
        (ai_place "temple_ent_jackals" 2)
        (sleep_until (> (device_get_position "gondola_02_a") 0.9))
        (ai_set_orders "gondola_02_jetpacks" "jetpacks_temple")
        (cs_run_command_script "gondola_02_jetpacks/1" boost_to_temple_01)
        (cs_run_command_script "gondola_02_jetpacks/2" boost_to_temple_01)
        (sleep_until (= (device_get_position "gondola_02_a") 1.0))
        (object_dynamic_simulation_disable "gondola_02_a" true)
        (object_dynamic_simulation_disable "gondola_02_b" true)
        (game_save_no_timeout)
        (ai_vehicle_exit "temple_ent_turrets")
        (ai_set_orders "temple_ent_grunts" "temple_ent_retreat")
        (ai_set_orders "temple_ent_jackals" "temple_ent_retreat")
        (device_set_position "gondola_02_launch_a" 0.0)
        (device_set_position "gondola_02_launch_b" 0.0)
        (cs_run_command_script "temple_ent_grunts" panic)
        (sleep 60)
        (cs_run_command_script "temple_ent_jackals" panic)
    )
)

(script command_script void temple_hunker
    (begin
        (cs_crouch true)
        (sleep_forever)
    )
)

(script command_script void high_charity_ally_comment
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'damn! look at the size of that thing!'")
        (cs_play_line "1210")
    )
)

(script dormant void temple_ent_cortana_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_temple_entry" (players)) true) 30 1800)
        (if (= (volume_test_objects "vol_temple_entry" (players)) false) 
            (begin
                (ai_dialogue_enable false)
                (sleep_until (= (volume_test_objects "vol_temple_entry" (players)) true) 30 60)
                (if (= (volume_test_objects "vol_temple_entry" (players)) false) 
                    (begin
                        (print "cortana: 'there's no time, chief! get inside and take care of the prophet!'")
                        (sleep (ai_play_line_on_object none "1220"))
                    )
                )
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
    )
)

(script command_script void temple_deploy_l
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to temple_turrets/deploy_left)
        (cs_deploy_turret temple_turrets/left)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void temple_deploy_r
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to temple_turrets/deploy_right)
        (cs_deploy_turret temple_turrets/right)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script dormant void temple_entry_start
    (begin
        (sleep_until 
            (or
                (< (ai_living_count "temple_entry_enemies") 1)
                (= (volume_test_objects "vol_temple_ent_cutscene" (players)) true)
            ) 
        5)
        (ai_disposable "gondola_02_enemies" true)
        (wake music_05b_09_stop)
        (cinematic_fade_to_white)
        (object_teleport (player0) "player0_hide_bsp3")
        (object_teleport (player1) "player1_hide_bsp3")
        (cs_run_command_script "all_allies" temple_hunker)
        (if (cinematic_skip_start) 
            (begin
                (c05_intra2)
            )
        )
        (cinematic_skip_stop)
        (sleep 2)
        (object_teleport (player0) "temple_ext_player0")
        (object_teleport (player1) "temple_ext_player1")
        (object_create_anew "fleet01")
        (object_create_anew "fleet02")
        (object_create_anew "fleet_high_char")
        (cs_run_command_script "temple_ent_grunts" abort)
        (cs_run_command_script "temple_ent_jackals" abort)
        (cs_run_command_script "gondola_02_jetpacks" abort)
        (cs_run_command_script "all_allies" abort)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (wake 05b_title2)
        (wake objective_temple_clear)
        (wake objective_regret_set)
        (data_mine_insert "05b_14_temple_exterior")
        (ai_renew "all_allies")
        (game_reverted)
        (sleep 30)
        (ai_set_orders "all_allies" "temple_ent_allies")
        (ai_scene "temple_ent_ally_scene" high_charity_ally_comment "all_allies")
        (wake temple_ent_cortana_reminder)
        (if (difficulty_legendary) 
            (begin
                (ai_place "temple_heavies" 2)
                (begin_random
                    (cs_run_command_script "temple_heavies/left" temple_deploy_l)
                    (cs_run_command_script "temple_heavies/right" temple_deploy_r)
                )
            ) (begin
                (ai_place "temple_heavies" 1)
                (begin_random
                    (cs_run_command_script "temple_heavies" temple_deploy_l)
                    (cs_run_command_script "temple_heavies" temple_deploy_r)
                )
            )
        )
        (sleep 90)
        (if (difficulty_legendary) 
            (ai_place "temple_halls_jackals_01" (- 2.0 (ai_living_count "temple_ent_jackals"))) (ai_place "temple_halls_jackals_01" (- 3.0 (ai_living_count "temple_ent_jackals"))))
        (if (difficulty_legendary) 
            (ai_place "temple_halls_elites_01" (- 2.0 (ai_living_count "gondola_02_jetpacks"))) (ai_place "temple_halls_elites_01" (- 1.0 (ai_living_count "gondola_02_jetpacks"))))
    )
)

(script dormant void temple_cortana_warn_02
    (begin
        (sleep_until (= bossfight_chatter true))
        (set bossfight_chatter false)
        (game_save_immediate)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'the covenant fleet has launched multiple waves of reinforcements!'")
        (print "'too many for me to track! we don't have much time!'")
        (sleep (ai_play_line_on_object none "0210"))
        (sleep 30)
        (ai_dialogue_enable true)
        (set bossfight_chatter true)
        (game_saving)
    )
)

(script dormant void temple_foyer_start
    (begin
        (sleep_until (= (volume_test_objects "vol_temple_entry" (players)) true))
        (data_mine_insert "05b_15_temple_halls")
        (ai_renew "all_allies")
        (game_saving)
        (ai_set_orders "all_allies" "temple_halls_allies")
        (sleep_until (< (ai_living_count "temple_entry_enemies") 3) 30 60)
        (game_saving)
        (if (= (volume_test_objects "vol_temple_left" (players)) true) 
            (begin
                (ai_place "temple_halls_jackals_02l" (- 4.0 (ai_living_count "temple_halls_jackals_01")))
            )
        )
        (if (= (volume_test_objects "vol_temple_right" (players)) true) 
            (begin
                (ai_place "temple_halls_jackals_02r" (- 4.0 (+ (ai_living_count "temple_halls_jackals_02l") (ai_living_count "temple_halls_jackals_01"))))
            )
        )
        (sleep_until (= (volume_test_objects "vol_temple_foyer" (players)) true))
        (game_saving)
        (ai_place "temple_halls_elites_02" 2)
        (wake temple_cortana_warn_02)
    )
)

(script dormant void temple_cortana_warn_01
    (begin
        (sleep_until 
            (and
                (< (objects_distance_to_object (players) (list_get (ai_actors "regret") 0)) 15.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "regret") 0) 30.0) true)
            )
        )
        (sleep_until (= bossfight_chatter true))
        (if (= regret_dead false) 
            (begin
                (set bossfight_chatter false)
                (game_save_immediate)
                (ai_dialogue_enable false)
                (sleep 60)
                (if (= regret_dead false) 
                    (begin
                        (print "cortana: 'there's the target! take him out!'")
                        (sleep (ai_play_line_on_object none "0200"))
                    )
                )
                (sleep 30)
                (ai_dialogue_enable true)
                (set bossfight_chatter true)
                (game_saving)
            )
        )
    )
)

(script dormant void temple_cortana_warn_03
    (begin
        (sleep_until 
            (or
                (= regret_dead true)
                (> regret_times_dead 0)
            ) 
        30 5100)
        (if (= regret_dead false) 
            (begin
                (sleep_until (= bossfight_chatter true))
                (set bossfight_chatter false)
                (game_save_immediate)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'bad news. the reinforcements are turning around -'")
                (print "'the fleet is preparing to fire on our position! we need to get out of here!'")
                (sleep (ai_play_line_on_object none "0220"))
                (sleep 30)
                (ai_dialogue_enable true)
                (set bossfight_chatter true)
                (game_saving)
            )
        )
    )
)

(script dormant void temple_cortana_reminder
    (begin
        (sleep_until (= bossfight_chatter true))
        (set bossfight_chatter false)
        (game_save_immediate)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'go! back out the way we came in!'")
        (sleep (ai_play_line_on_object none "1370"))
        (sleep 30)
        (ai_dialogue_enable true)
        (set bossfight_chatter true)
        (game_saving)
    )
)

(script dormant void regret_hint_01
    (begin
        (sleep_until (= bossfight_chatter true))
        (if (= regret_dead false) 
            (begin
                (set bossfight_chatter false)
                (ai_dialogue_enable false)
                (sleep_until (game_all_quiet) 30 600)
                (game_save_immediate)
                (if (= regret_dead false) 
                    (begin
                        (print "cortana: 'his throne is shielded!  it's deflecting everything you throw at it!'")
                        (sleep (ai_play_line_on_object none "1230"))
                        (sleep 15)
                        (print "cortana: 'get in close, and do whatever you can!'")
                        (sleep (ai_play_line_on_object none "1240"))
                    )
                )
                (sleep 30)
                (ai_dialogue_enable true)
                (set bossfight_chatter true)
                (game_saving)
            )
        )
    )
)

(script dormant void regret_hint_02
    (begin
        (sleep_until (= bossfight_chatter true))
        (if (= regret_dead false) 
            (begin
                (set bossfight_chatter false)
                (ai_dialogue_enable false)
                (sleep_until (game_all_quiet) 30 600)
                (game_save_immediate)
                (if (= regret_dead false) 
                    (begin
                        (print "cortana: 'you've got to get him out of that throne!'")
                        (sleep (ai_play_line_on_object none "1250"))
                    )
                )
                (sleep 30)
                (ai_dialogue_enable true)
                (set bossfight_chatter true)
                (game_saving)
            )
        )
    )
)

(script dormant void regret_hint_03
    (begin
        (sleep_until (= bossfight_chatter true))
        (if (= regret_dead false) 
            (begin
                (set bossfight_chatter false)
                (ai_dialogue_enable false)
                (sleep_until (game_all_quiet) 30 600)
                (game_save_immediate)
                (if (= regret_dead false) 
                    (begin
                        (print "cortana: 'quick! board his throne!'")
                        (sleep (ai_play_line_on_object none "1290"))
                    )
                )
                (sleep 30)
                (ai_dialogue_enable true)
                (set bossfight_chatter true)
                (game_saving)
            )
        )
    )
)

(script dormant void regret_teleport_comment
    (begin
        (sleep_until (= bossfight_chatter true))
        (set bossfight_chatter false)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'phased spatial relocation! the same technology the monitor used on the first halo.'")
        (print "'seems the prophets save the best toys for themselves…'")
        (sleep (ai_play_line_on_object none "1260"))
        (sleep 30)
        (ai_dialogue_enable true)
        (set bossfight_chatter true)
    )
)

(script dormant void regret_beam_comment
    (begin
        (sleep_until (>= (ai_combat_status "regret") ai_combat_status_clear_los))
        (sleep_until (= bossfight_chatter true))
        (set bossfight_chatter false)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'keep clear of that beam! i don't think you'll survive a direct hit!'")
        (sleep (ai_play_line_on_object none "1270"))
        (sleep 30)
        (ai_dialogue_enable true)
        (set bossfight_chatter true)
    )
)

(script dormant void regret_hg_comment
    (begin
        (sleep_until (>= (ai_combat_status "temple_hg_init") ai_combat_status_clear_los))
        (sleep_until (= bossfight_chatter true))
        (set bossfight_chatter false)
        (game_save_immediate)
        (ai_dialogue_enable false)
        (sleep 60)
        (if (= regret_dead false) 
            (begin
                (print "cortana: 'there are honor-guards all over this place!  watch your back!'")
                (sleep (ai_play_line_on_object none "1280"))
            )
        )
        (sleep 30)
        (ai_dialogue_enable true)
        (set bossfight_chatter true)
        (game_saving)
    )
)

(script static void regret_taunt_01
    (begin
        (sleep_until 
            (and
                (= bossfight_chatter true)
                (= (unit_in_vehicle (player0)) false)
                (= (unit_in_vehicle (player1)) false)
            )
        )
        (set bossfight_chatter false)
        (print "regret: 'warriors! attack! the demon must die!'")
        (custom_animation (unit (ai_get_object "regret")) "objects\characters\prophet\prophet" "combat:any:any:point" true)
        (sleep (ai_play_line "regret" "1300"))
        (set bossfight_chatter true)
        (sleep (random_range 300 600))
    )
)

(script static void regret_taunt_02
    (begin
        (sleep_until 
            (and
                (= bossfight_chatter true)
                (= (unit_in_vehicle (player0)) false)
                (= (unit_in_vehicle (player1)) false)
            )
        )
        (set bossfight_chatter false)
        (print "regret: 'you dare to interrupt my sermon?!'")
        (custom_animation (unit (ai_get_object "regret")) "objects\characters\prophet\prophet" "combat:any:any:cheer" true)
        (sleep (ai_play_line "regret" "1310"))
        (set bossfight_chatter true)
        (sleep (random_range 300 600))
    )
)

(script static void regret_taunt_03
    (begin
        (sleep_until 
            (and
                (= bossfight_chatter true)
                (= (unit_in_vehicle (player0)) false)
                (= (unit_in_vehicle (player1)) false)
            )
        )
        (set bossfight_chatter false)
        (print "regret: 'the great journey will not be postponed!'")
        (custom_animation (unit (ai_get_object "regret")) "objects\characters\prophet\prophet" "combat:any:any:cheer" true)
        (sleep (ai_play_line "regret" "1320"))
        (set bossfight_chatter true)
        (sleep (random_range 300 600))
    )
)

(script static void regret_taunt_04
    (begin
        (sleep_until 
            (and
                (= bossfight_chatter true)
                (= (unit_in_vehicle (player0)) false)
                (= (unit_in_vehicle (player1)) false)
            )
        )
        (set bossfight_chatter false)
        (print "regret: 'guards! remove this vermin from my sight!'")
        (custom_animation (unit (ai_get_object "regret")) "objects\characters\prophet\prophet" "combat:any:any:point" true)
        (sleep (ai_play_line "regret" "1330"))
        (set bossfight_chatter true)
        (sleep (random_range 300 600))
    )
)

(script static void regret_taunt_05
    (begin
        (sleep_until 
            (and
                (= bossfight_chatter true)
                (= (unit_in_vehicle (player0)) false)
                (= (unit_in_vehicle (player1)) false)
            )
        )
        (set bossfight_chatter false)
        (print "regret: 'human filth! you befoul this holy place!'")
        (custom_animation (unit (ai_get_object "regret")) "objects\characters\prophet\prophet" "combat:any:any:taunt" true)
        (sleep (ai_play_line "regret" "1340"))
        (set bossfight_chatter true)
        (sleep (random_range 300 600))
    )
)

(script static void regret_taunt_06
    (begin
        (sleep_until 
            (and
                (= bossfight_chatter true)
                (= (unit_in_vehicle (player0)) false)
                (= (unit_in_vehicle (player1)) false)
            )
        )
        (set bossfight_chatter false)
        (print "regret: 'incompetents! i'll kill it myself!'")
        (custom_animation (unit (ai_get_object "regret")) "objects\characters\prophet\prophet" "combat:any:any:taunt" true)
        (sleep (ai_play_line "regret" "1350"))
        (set bossfight_chatter true)
        (sleep (random_range 300 600))
    )
)

(script static void regret_taunt_07
    (begin
        (sleep_until 
            (and
                (= bossfight_chatter true)
                (= (unit_in_vehicle (player0)) false)
                (= (unit_in_vehicle (player1)) false)
            )
        )
        (set bossfight_chatter false)
        (print "regret: 'your very existence offends me, demon!'")
        (custom_animation (unit (ai_get_object "regret")) "objects\characters\prophet\prophet" "combat:any:any:cheer" true)
        (sleep (ai_play_line "regret" "1360"))
        (set bossfight_chatter true)
        (sleep (random_range 300 600))
    )
)

(script dormant void regret_taunts
    (begin
        (begin_random
            (regret_taunt_01)
            (regret_taunt_02)
            (regret_taunt_03)
            (regret_taunt_04)
            (regret_taunt_05)
            (regret_taunt_06)
            (regret_taunt_07)
        )
    )
)

(script dormant void temple_grunt_spawner
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_l_01") 5.0)
                            (= (objects_can_see_flag (players) "temple_l_01" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_l/01")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_l_02") 5.0)
                            (= (objects_can_see_flag (players) "temple_l_02" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_l/02")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_l_03") 5.0)
                            (= (objects_can_see_flag (players) "temple_l_03" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_l/03")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_l_04") 5.0)
                            (= (objects_can_see_flag (players) "temple_l_04" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_l/04")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_l_05") 5.0)
                            (= (objects_can_see_flag (players) "temple_l_05" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_l/05")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_r_01") 5.0)
                            (= (objects_can_see_flag (players) "temple_r_01" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_r/01")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_r_02") 5.0)
                            (= (objects_can_see_flag (players) "temple_r_02" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_r/02")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_r_03") 5.0)
                            (= (objects_can_see_flag (players) "temple_r_03" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_r/03")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_r_04") 5.0)
                            (= (objects_can_see_flag (players) "temple_r_04" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_r/04")
                                (sleep (random_range 120 240))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_honor_grunts") 2)
                            (> (objects_distance_to_flag (players) "temple_r_05") 5.0)
                            (= (objects_can_see_flag (players) "temple_r_05" 45.0) false)
                        ) 
                            (begin
                                (ai_place "honor_grunts_new_r/05")
                                (sleep (random_range 120 240))
                            )
                    )
                )
                (sleep_until 
                    (or
                        (= (ai_vitality_pinned "regret") true)
                        (= regret_dead true)
                        (< (ai_living_count "temple_honor_grunts") 2)
                    )
                )
                (= regret_dead true)
            )
        )
    )
)

(script dormant void temple_hg_respawner
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_living_count "temple_hg") hg_count)
                            (= (device_get_position "temple_spawndoor_01r") 0.0)
                            (= (volume_test_objects "vol_temple_spawnroom_01r" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "temple_hg_01r" 1)
                                (sleep (random_range 60 120))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_hg") hg_count)
                            (= (device_get_position "temple_spawndoor_01l") 0.0)
                            (= (volume_test_objects "vol_temple_spawnroom_01l" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "temple_hg_01l" 1)
                                (sleep (random_range 60 120))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_hg") hg_count)
                            (= (device_get_position "temple_spawndoor_02r") 0.0)
                            (= (volume_test_objects "vol_temple_spawnroom_02r" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "temple_hg_02r" 1)
                                (sleep (random_range 60 120))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "temple_hg") hg_count)
                            (= (device_get_position "temple_spawndoor_02l") 0.0)
                            (= (volume_test_objects "vol_temple_spawnroom_02l" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "temple_hg_02l" 1)
                                (sleep (random_range 60 120))
                            )
                    )
                )
                (sleep_until 
                    (or
                        (= (ai_vitality_pinned "regret") true)
                        (= regret_dead true)
                        (< (ai_living_count "temple_hg") 1)
                    )
                )
                (sleep_until 
                    (or
                        (= (ai_vitality_pinned "regret") true)
                        (= regret_dead true)
                    ) 
                30 (/ hg_delay (+ regret_times_dead 1.0)))
                (= regret_dead true)
            )
        )
    )
)

(script dormant void regret_respawner
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (ai_vitality_pinned "regret") true))
                (effect_new_on_object_marker regret_teleport regret_corpse "body")
                (unit_exit_vehicle (player0) 1)
                (unit_exit_vehicle (player1) 1)
                (sleep_until 
                    (and
                        (= (unit_in_vehicle (player0)) false)
                        (= (unit_in_vehicle (player1)) false)
                    )
                )
                (object_destroy regret_corpse)
                (object_destroy regret_throne)
                (sleep 60)
                (ai_place "regret" 1)
                (ai_cannot_die "regret" true)
                (set regret_corpse (list_get (ai_actors "regret") 0))
                (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
                (effect_new_on_object_marker regret_teleport regret_corpse "body")
                (object_set_function_variable regret_throne "effects" 1.0 1.0)
                (set regret_times_dead (+ regret_times_dead 1.0))
                (= regret_times_dead 4)
            )
        )
    )
)

(script command_script void reserve_throne
    (begin
        (sleep 2)
        (ai_vehicle_reserve (ai_vehicle_get ai_current_actor) true)
        (sleep 2)
    )
)

(script command_script void regret_pause
    (begin
        (cs_abort_on_damage true)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_temple_02" (players)) true)
                (or
                    (= (objects_can_see_object (ai_actors "regret") (player0) 45.0) true)
                    (= (objects_can_see_object (ai_actors "regret") (player1) 45.0) true)
                )
            )
        )
    )
)

(script dormant void regret_retreat
    (begin
        (if (difficulty_legendary) 
            (set regret_lives 4))
        (if (difficulty_heroic) 
            (set regret_lives 2))
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_object (players) (list_get (ai_actors "regret") 0)) 5.0))
                (sleep_until 
                    (or
                        (= (unit_in_vehicle (player0)) true)
                        (= (unit_in_vehicle (player1)) true)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "regret") 0)) 5.0)
                    ) 
                30 150)
                (if 
                    (or
                        (= (unit_in_vehicle (player0)) true)
                        (= (unit_in_vehicle (player1)) true)
                    ) 
                        (begin
                            (sleep_until (= (ai_vitality_pinned "regret") true) 30 150)
                            (if (= (ai_vitality_pinned "regret") false) 
                                (begin
                                    (unit_set_enterable_by_player (unit regret_throne) false)
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (sleep 30)
                                    (unit_exit_vehicle (player0) 1)
                                    (unit_exit_vehicle (player1) 1)
                                    (sleep_until 
                                        (and
                                            (= (unit_in_vehicle (player0)) false)
                                            (= (unit_in_vehicle (player1)) false)
                                        )
                                    )
                                    (object_destroy regret_corpse)
                                    (object_destroy regret_throne)
                                    (sleep 60)
                                    (ai_place "regret" 1)
                                    (ai_cannot_die "regret" true)
                                    (if 
                                        (or
                                            (= regret_times_dead 1)
                                            (= regret_times_dead 2)
                                        ) 
                                            (ai_set_orders "regret" "regret_02"))
                                    (if (> regret_times_dead 2) 
                                        (ai_set_orders "regret" "regret_03"))
                                    (set regret_corpse (list_get (ai_actors "regret") 0))
                                    (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (object_set_function_variable regret_throne "effects" 1.0 1.0)
                                    (unit_set_enterable_by_player (unit regret_throne) true)
                                ) (begin
                                    (unit_set_enterable_by_player (unit regret_throne) false)
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (sleep 30)
                                    (unit_exit_vehicle (player0) 1)
                                    (unit_exit_vehicle (player1) 1)
                                    (sleep_until 
                                        (and
                                            (= (unit_in_vehicle (player0)) false)
                                            (= (unit_in_vehicle (player1)) false)
                                        )
                                    )
                                    (object_destroy regret_corpse)
                                    (object_destroy regret_throne)
                                    (sleep 60)
                                    (game_save_no_timeout)
                                    (ai_place "regret" 1)
                                    (ai_cannot_die "regret" true)
                                    (if 
                                        (or
                                            (= regret_times_dead 1)
                                            (= regret_times_dead 2)
                                        ) 
                                            (ai_set_orders "regret" "regret_02"))
                                    (if (> regret_times_dead 2) 
                                        (ai_set_orders "regret" "regret_03"))
                                    (set regret_corpse (list_get (ai_actors "regret") 0))
                                    (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (object_set_function_variable regret_throne "effects" 1.0 1.0)
                                    (set regret_times_dead (+ regret_times_dead 1.0))
                                    (unit_set_enterable_by_player (unit regret_throne) true)
                                )
                            )
                        ) (begin
                            (if (< (objects_distance_to_object (players) (list_get (ai_actors "regret") 0)) 5.0) 
                                (begin
                                    (unit_set_enterable_by_player (unit regret_throne) false)
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (sleep 30)
                                    (unit_exit_vehicle (player0) 1)
                                    (unit_exit_vehicle (player1) 1)
                                    (sleep_until 
                                        (and
                                            (= (unit_in_vehicle (player0)) false)
                                            (= (unit_in_vehicle (player1)) false)
                                        )
                                    )
                                    (object_destroy regret_corpse)
                                    (object_destroy regret_throne)
                                    (sleep 60)
                                    (ai_place "regret" 1)
                                    (ai_cannot_die "regret" true)
                                    (if 
                                        (or
                                            (= regret_times_dead 1)
                                            (= regret_times_dead 2)
                                        ) 
                                            (ai_set_orders "regret" "regret_02"))
                                    (if (> regret_times_dead 2) 
                                        (ai_set_orders "regret" "regret_03"))
                                    (set regret_corpse (list_get (ai_actors "regret") 0))
                                    (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (object_set_function_variable regret_throne "effects" 1.0 1.0)
                                    (unit_set_enterable_by_player (unit regret_throne) true)
                                ) (begin
                                    (print "do nothing")
                                )
                            )
                        )
                )
                (= regret_times_dead regret_lives)
            )
        )
    )
)

(script dormant void regret_death
    (begin
        (object_create_anew "fake_corpse")
        (sleep 2)
        (object_cannot_take_damage "fake_corpse")
        (object_hide "fake_corpse" true)
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_object (players) (list_get (ai_actors "regret") 0)) 5.0))
                (sleep_until 
                    (or
                        (= (unit_in_vehicle (player0)) true)
                        (= (unit_in_vehicle (player1)) true)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "regret") 0)) 5.0)
                    ) 
                30 150)
                (if 
                    (or
                        (= (unit_in_vehicle (player0)) true)
                        (= (unit_in_vehicle (player1)) true)
                    ) 
                        (begin
                            (sleep_until (= (ai_vitality_pinned "regret") true) 30 150)
                            (if (= (ai_vitality_pinned "regret") false) 
                                (begin
                                    (unit_set_enterable_by_player (unit regret_throne) false)
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (sleep 30)
                                    (unit_exit_vehicle (player0) 1)
                                    (unit_exit_vehicle (player1) 1)
                                    (sleep_until 
                                        (and
                                            (= (unit_in_vehicle (player0)) false)
                                            (= (unit_in_vehicle (player1)) false)
                                        )
                                    )
                                    (object_destroy regret_corpse)
                                    (object_destroy regret_throne)
                                    (sleep 60)
                                    (ai_place "regret" 1)
                                    (ai_cannot_die "regret" true)
                                    (cs_run_command_script "regret" reserve_throne)
                                    (if 
                                        (or
                                            (= regret_times_dead 1)
                                            (= regret_times_dead 2)
                                        ) 
                                            (ai_set_orders "regret" "regret_02"))
                                    (if (> regret_times_dead 2) 
                                        (ai_set_orders "regret" "regret_03"))
                                    (set regret_corpse (list_get (ai_actors "regret") 0))
                                    (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (object_set_function_variable regret_throne "effects" 1.0 1.0)
                                    (unit_set_enterable_by_player (unit regret_throne) true)
                                ) (begin
                                    (set regret_dead true)
                                    (objects_attach regret_throne "driver" "fake_corpse" "")
                                    (sleep 2)
                                    (object_hide "fake_corpse" false)
                                    (object_hide regret_corpse true)
                                    (unit_set_enterable_by_player (unit regret_throne) false)
                                    (custom_animation_loop "fake_corpse" "objects\characters\prophet\prophet" "throne_d:dead" true)
                                    (ai_play_line_on_object "fake_corpse" "1380")
                                    (sleep 60)
                                    (effect_new_on_object_marker "effects\objects\characters\prophet\regret_death" "fake_corpse" "body")
                                    (effect_new_on_object_marker "effects\objects\characters\prophet\regret_death" regret_throne "")
                                    (unit_exit_vehicle (player0) 1)
                                    (unit_exit_vehicle (player1) 1)
                                    (ai_cannot_die "regret" false)
                                    (object_hide regret_corpse true)
                                    (ai_kill "regret")
                                    (sleep 1)
                                    (object_hide regret_corpse true)
                                    (object_clear_all_function_variables regret_throne)
                                    (sleep 150)
                                    (sound_impulse_start_effect "sound\vehicles\damage_effects\cov_damage_large" regret_throne 1.0)
                                )
                            )
                        ) (begin
                            (if (< (objects_distance_to_object (players) (list_get (ai_actors "regret") 0)) 5.0) 
                                (begin
                                    (unit_set_enterable_by_player (unit regret_throne) false)
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (sleep 30)
                                    (unit_exit_vehicle (player0) 1)
                                    (unit_exit_vehicle (player1) 1)
                                    (sleep_until 
                                        (and
                                            (= (unit_in_vehicle (player0)) false)
                                            (= (unit_in_vehicle (player1)) false)
                                        )
                                    )
                                    (object_destroy regret_corpse)
                                    (object_destroy regret_throne)
                                    (sleep 60)
                                    (ai_place "regret" 1)
                                    (ai_cannot_die "regret" true)
                                    (cs_run_command_script "regret" reserve_throne)
                                    (if 
                                        (or
                                            (= regret_times_dead 1)
                                            (= regret_times_dead 2)
                                        ) 
                                            (ai_set_orders "regret" "regret_02"))
                                    (if (> regret_times_dead 2) 
                                        (ai_set_orders "regret" "regret_03"))
                                    (set regret_corpse (list_get (ai_actors "regret") 0))
                                    (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
                                    (effect_new_on_object_marker regret_teleport regret_corpse "body")
                                    (object_set_function_variable regret_throne "effects" 1.0 1.0)
                                    (unit_set_enterable_by_player (unit regret_throne) true)
                                ) (begin
                                    (print "do nothing")
                                )
                            )
                        )
                )
                (= regret_dead true)
            )
        )
    )
)

(script static void regret_test
    (begin
        (ai_place "regret/1")
        (sleep 60)
        (set regret_corpse (list_get (ai_actors "regret") 0))
        (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
        (object_create_anew "regret03")
        (print "destroy him")
        (object_destroy regret_corpse)
        (print "attach him")
        (objects_attach regret_throne "driver" "regret03" "")
        (print "animate him")
        (custom_animation_loop "regret03" "objects\characters\prophet\prophet" "combat:any:any:cheer" true)
    )
)

(script command_script void regret_dead_retreat
    (begin
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep_forever)
    )
)

(script dormant void temple_center_start
    (begin
        (sleep_until (= (volume_test_objects "vol_temple_foyer" (players)) true))
        (ai_disposable "temple_entry_enemies" true)
        (data_mine_insert "05b_16_temple_center")
        (ai_renew "all_allies")
        (game_saving)
        (ai_place "regret/1")
        (ai_cannot_die "regret" true)
        (cs_run_command_script "regret" regret_pause)
        (set regret_corpse (set regret_corpse (list_get (ai_actors "regret") 0)))
        (set regret_throne (object_get_parent (list_get (ai_actors "regret") 0)))
        (object_set_function_variable regret_throne "effects" 1.0 1.0)
        (ai_place "temple_hg_init" 2)
        (wake regret_hg_comment)
        (wake temple_hg_respawner)
        (ai_place "honor_grunts_init_r" 2)
        (ai_place "honor_grunts_init_l" 2)
        (wake temple_grunt_spawner)
        (if 
            (or
                (difficulty_legendary)
                (difficulty_heroic)
            ) 
                (wake regret_retreat) (wake regret_death))
        (sleep_until (= (volume_test_objects "vol_temple_02" (players)) true))
        (ai_set_orders "all_allies" "temple_left_allies")
        (wake temple_cortana_warn_01)
        (wake regret_taunts)
        (sleep_until 
            (or
                (= regret_times_dead 1)
                (= regret_dead true)
            ) 
        30 3600)
        (if 
            (and
                (= regret_times_dead 0)
                (= regret_dead false)
            ) 
                (wake regret_hint_01))
        (sleep_until 
            (or
                (= regret_times_dead 1)
                (= regret_dead true)
            ) 
        30 3600)
        (if 
            (and
                (= regret_times_dead 0)
                (= regret_dead false)
            ) 
                (wake regret_hint_02))
        (sleep_until 
            (or
                (= regret_times_dead 1)
                (= regret_dead true)
            ) 
        30 1800)
        (if 
            (and
                (= regret_times_dead 0)
                (= regret_dead false)
            ) 
                (wake regret_hint_03))
        (sleep_until 
            (or
                (= regret_times_dead 1)
                (= regret_dead true)
            )
        )
        (if (difficulty_heroic) 
            (begin
                (set hg_count 3)
                (sleep_until (= regret_times_dead 2))
                (wake regret_death)
            )
        )
        (if (difficulty_legendary) 
            (begin
                (set hg_count 3)
                (sleep_until (= regret_times_dead 3))
                (set hg_count 4)
                (sleep_until (= regret_times_dead 4))
                (wake regret_death)
            )
        )
        (sleep_until (= regret_dead true))
        (sleep_forever regret_taunts)
        (ai_set_orders "all_enemies" "everyone_retreat")
        (ai_set_blind "all_enemies" true)
        (ai_set_deaf "all_enemies" true)
        (cs_run_command_script "all_enemies" regret_dead_retreat)
        (sleep 60)
        (set bossfight_chatter false)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'bad news. the reinforcements are turning around -'")
        (print "'the fleet is preparing to fire on our position! we need to get out of here!'")
        (sleep (ai_play_line_on_object none "0220"))
        (sleep 30)
        (ai_dialogue_enable true)
        (cinematic_fade_to_white)
        (kill_volume_disable "kill_temple_wings")
        (wake music_05b_10_stop)
        (object_teleport (player0) "player0_hide_bsp3")
        (object_teleport (player1) "player1_hide_bsp3")
        (ai_kill_silent "all_enemies")
        (if (cinematic_skip_start) 
            (begin
                (c05_outro)
            )
        )
        (cinematic_skip_stop)
        (sleep 2)
        (playtest_mission)
        (sleep 2)
        (game_revert)
    )
)

(script dormant void temple_foyer_retreat
    (begin
        (sleep_until (= regret_dead true))
        (data_mine_insert "05b_17_temple_retreat")
        (ai_renew "all_allies")
        (game_save_no_timeout)
        (device_operates_automatically_set "temple_retreat_exit" true)
        (ai_place "temple_exit_elites_01" (- 2.0 (ai_living_count "temple_hg")))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_temple_retreat_01" (players)) true)
                (= (volume_test_objects "vol_temple_retreat_02" (players)) true)
                (< (+ (ai_living_count "temple_hg") (ai_living_count "temple_exit_elites_01")) 2.0)
            )
        )
        (game_save_no_timeout)
        (ai_set_orders "all_allies" "temple_retreat_allies")
        (ai_place "temple_exit_grunts_01" 4)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_temple_foyer" (players)) true)
                (< (ai_living_count "temple_escape_enemies") 3)
            )
        )
        (game_save_no_timeout)
        (ai_place "temple_exit_jackals_02" 2)
        (ai_place "temple_exit_elites_02" (- 2.0 (ai_living_count "temple_exit_elites_01")))
    )
)

(script dormant void temple_entry_retreat
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_temple_entry" (players)) true)
                (= regret_dead true)
            )
        )
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (cinematic_fade_to_white)
        (kill_volume_disable "kill_temple_wings")
        (wake music_05b_10_stop)
        (object_teleport (player0) "player0_hide_bsp3")
        (object_teleport (player1) "player1_hide_bsp3")
        (ai_kill_silent "all_enemies")
        (if (cinematic_skip_start) 
            (begin
                (c05_outro)
            )
        )
        (cinematic_skip_stop)
        (sleep 2)
        (cinematic_fade_from_white)
        (sleep 2)
        (playtest_mission)
        (sleep 2)
        (game_revert)
    )
)

(script static void sleep_tower1
    (begin
        (sleep_forever tower1_start)
        (sleep_forever tower1_holo_looper)
        (sleep_forever tower1_cortana_comment)
    )
)

(script static void sleep_bridges
    (begin
        (sleep_forever bridges_start)
        (sleep_forever cortana_bridge_reminder)
    )
)

(script static void sleep_tower2
    (begin
        (sleep_forever tower2_start)
        (sleep_forever tower2_cortana_comment)
    )
)

(script static void sleep_central_platform
    (begin
        (sleep_forever central_platform_start)
        (sleep_forever central_platform_pelican)
    )
)

(script static void sleep_gondola_01
    (begin
        (sleep_forever gondola_01_start)
        (sleep_forever tower3_dock_above)
        (sleep_forever gondola_01_nuke)
        (sleep_forever gondola_01_restarter)
        (sleep_forever gondola_01_reverser)
        (sleep_forever gondola_01_go_reminder)
        (sleep_forever gondola_01_phantom_arrives)
        (sleep_forever tower3_turret_reman)
        (sleep_forever tower3_cortana_comment)
        (sleep_forever gondola_01_wake)
        (sleep_forever tower_cluster_delete)
    )
)

(script static void sleep_tower3
    (begin
        (sleep_forever tower3_start)
        (sleep_forever tower3_sleeper_spawn)
        (sleep_forever tower3_cortana_reminder_02)
        (sleep_forever elev_under_monitor)
        (sleep_forever assassin_ice_cream)
    )
)

(script static void sleep_sunken_tunnel_01
    (begin
        (sleep_forever sunken_tunnel1_start)
    )
)

(script static void sleep_sunken_chamber
    (begin
        (sleep_forever sunken_chamber_start)
        (sleep_forever sunken_holo_cortana_comment)
        (sleep_forever sunken_holo_looper)
        (sleep_forever sunken_holo_translate)
        (sleep_forever sunken_chamber_reminder)
        (sleep_forever hide_rightside_guys)
        (sleep_forever hide_leftside_guys)
        (sleep_forever sunk_chamber_hunters_enter)
        (sleep_forever sunken_chamber_saves)
    )
)

(script static void sleep_sunken_tunnel_02
    (begin
        (sleep_forever sunken_tunnel2_start)
    )
)

(script static void sleep_island_exterior
    (begin
        (sleep_forever island_interior_start)
        (sleep_forever island_gully_start)
        (sleep_forever island_exterior_start)
        (sleep_forever elev_up_monitor)
        (sleep_forever island_holo_looper)
        (sleep_forever island_int_translate)
        (sleep_forever island_pelican_arrives)
    )
)

(script static void sleep_gondola_02
    (begin
        (sleep_forever gondola_02_start)
        (sleep_forever gondola_02_cortana_reminder)
        (sleep_forever gondola_02_nuke)
        (sleep_forever gondola_02_restarter)
        (sleep_forever gondola_02_reverser)
        (sleep_forever gondola_02_wake)
    )
)

(script static void sleep_temple_entry
    (begin
        (sleep_forever temple_entry_start)
        (sleep_forever temple_foyer_start)
        (sleep_forever temple_ent_cortana_reminder)
    )
)

(script static void sleep_boss_fight
    (begin
        (sleep_forever temple_center_start)
        (sleep_forever temple_hg_respawner)
        (sleep_forever regret_respawner)
        (sleep_forever regret_retreat)
        (sleep_forever regret_beam_comment)
        (sleep_forever regret_hg_comment)
        (sleep_forever temple_cortana_warn_01)
        (sleep_forever regret_taunts)
    )
)

(script startup void mission
    (begin
        (cinematic_snap_to_white)
        (if (= (volume_test_objects "vol_starting_locations" (players)) true) 
            (begin
                (if (cinematic_skip_start) 
                    (begin
                        (c05_intra1)
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
        (structure_bsp_index 0)
        (sleep 2)
        (ai_allegiance covenant prophet)
        (ai_allegiance player human)
        (objectives_finish_up_to)
        (sleep 2)
        (prep_return_from_intro)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (wake 05b_title0)
        (wake objective_towers_set)
        (wake kill_volumes)
        (wake tower1_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower1_exit" (players)) true)
                (= (volume_test_objects "vol_tower1_exit_01" (players)) true)
                (= (volume_test_objects "vol_tower1_exit_02" (players)) true)
                (= (volume_test_objects "vol_tower1_roof" (players)) true)
            )
        )
        (wake bridges_start)
        (wake tower2_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower2_exit" (players)) true)
                (= (volume_test_objects "vol_central_platform" (players)) true)
            )
        )
        (wake central_platform_start)
        (wake gondola_01_start)
        (sleep_until (= (volume_test_objects "vol_tower3_entry" (players)) true))
        (wake tower3_start)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_until (= (version) 1))
        (wake sunken_tunnel1_start)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_tower3)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script dormant void 05_intra1_01_predict
    (begin
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_short\bowl_short" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 8)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 9)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 7)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium_tall\stone_block_medium_tall" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium\stone_block_medium" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 11 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 2 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 4 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 13 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 14 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 15 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 16 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 17 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 34 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 65 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 66 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 68 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 69 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 70 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 71 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 74 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\door_tower\door_tower" 0)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 10 false)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_floodlight\cov_floodlight" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 4)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 8 false)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 1)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (sleep 98)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (sleep 9)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 66 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 65 true)
        (sleep 14)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 14 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 68 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 69 true)
        (sleep 205)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 2 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 4 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 7 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 66 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 67 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium_tall\stone_block_medium_tall" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium\stone_block_medium" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_floodlight\cov_floodlight" 0)
        (sleep 232)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 66 true)
        (sleep 6)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_floodlight\cov_floodlight" 0)
        (sleep 36)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 17 false)
        (sleep 22)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 65 true)
    )
)

(script dormant void 05_intra1_02_predict
    (begin
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 16 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 22 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 4 false)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium_tall\stone_block_medium_tall" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\delta_horizon\delta_horizon" 0)
        (predict_lightmap_bucket "objects\cinematics\forerunner\index_holo_human\index_holo_human" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\cinematics\forerunner\mount_doom_holo\mount_doom_holo" 0)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (sleep 7)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\water_elevator\water_elevator" 0)
        (sleep 16)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 13 false)
        (sleep 128)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican_rear_gun\pelican_rear_gun" 1)
        (sleep 215)
        (predict_lightmap_bucket "objects\vehicles\pelican\pelican" 3)
        (predict_lightmap_bucket "objects\characters\marine\marine" 61)
        (predict_lightmap_bucket "objects\characters\marine\marine" 54)
        (predict_lightmap_bucket "objects\characters\marine\marine" 72)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (sleep 135)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 2 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 72 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 73 true)
    )
)

(script dormant void 05_intra1_03_predict
    (begin
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_short\bowl_short" 0)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 11 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 8 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 7 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 16 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 17 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 34 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 68 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 69 true)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_01 70 true)
    )
)

(script dormant void 05_intra2_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium_tall\stone_block_medium_tall" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium\stone_block_medium" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\door_tower\door_tower" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_floodlight\cov_floodlight" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\fp_beam_rifle\fp_beam_rifle" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 19)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 20)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 29)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 22)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 23)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 24)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 25)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 27)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 2)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 1)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 62)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 12)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 13)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 14)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 15)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 1)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 0)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 3)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 16)
        (predict_lightmap_bucket "objects\characters\elite\elite" 21)
        (predict_lightmap_bucket "objects\characters\elite\elite" 18)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 9)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 18)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 11)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 12)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 13)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 14)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 16)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\projectiles\needler_shard\needler_shard" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 8)
        (predict_lightmap_bucket "objects\characters\elite\elite" 13)
        (predict_lightmap_bucket "objects\characters\elite\elite" 10)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 40 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 28 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 39 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 7 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 8 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 9 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 10 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 11 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 12 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 13 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 14 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 15 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 16 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 17 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 18 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 20 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 21 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 23 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 24 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 25 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 26 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 27 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 28 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 29 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 30 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 31 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 32 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 34 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 35 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola\gondola" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 3)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 2)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 1)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium_tall\stone_block_medium_tall" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\fp_beam_rifle\fp_beam_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_medium\stone_block_medium" 0)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 8)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 9)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 7)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_floodlight\cov_floodlight" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 19)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 20)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 29)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 22)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 23)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 24)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 25)
        (predict_lightmap_bucket "objects\characters\marine\marine_female\marine_female" 27)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 2)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 1)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 62)
        (predict_lightmap_bucket "objects\characters\marine\marine" 56)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\shotgun\shotgun" 3)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 12)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 13)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 14)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 15)
        (predict_lightmap_bucket "objects\characters\bugger\bugger" 3)
        (predict_lightmap_bucket "objects\characters\ambient_life\bird_quadwing\bird_quadwing" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_large\stone_block_large" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_short\bowl_short" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\door_tower\door_tower" 0)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 41 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 2 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 70 true)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 3)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (sleep 150)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 34 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 0 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 35 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 21 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 29 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 12 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 19 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 30 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 31 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 32 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 16 false)
        (predict_lightmap_bucket "scenarios\objects\human\military\resupply_capsule\resupply_capsule_crate\resupply_capsule_crate" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_branch\tree_branch" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_bush\tree_bush" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_medium\tree_ancient_medium" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_large\tree_ancient_large" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\stone_block_large\stone_block_large" 0)
        (sleep 6)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 36 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 26 false)
        (sleep 41)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 47 true)
        (sleep 5)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 36 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 26 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 44 true)
        (sleep 42)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 36 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 26 false)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 248)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola\gondola" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 2)
    )
)

(script dormant void 05_outro_01_predict
    (begin
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 2)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 28 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 1 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 65 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\capital_ship\capital_ship" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (sleep 185)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 28 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 42 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 1 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 65 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 5 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 6 true)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 3)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (sleep 12)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 2)
        (sleep 6)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola\gondola" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 1)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 2)
        (sleep 34)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 20)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 41 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 2 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 70 true)
    )
)

(script dormant void 05_outro_02_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 42)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 23)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 9 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 18 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 10 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 11 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 12 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 13 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 14 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 15 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 16 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 17 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 7 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 19 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 20 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 21 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 23 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 24 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 25 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 28 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 30 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 31 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 32 true)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
    )
)

(script dormant void 05_outro_03_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola\gondola" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 2)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 3)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (sleep 122)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 41 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 2 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 70 true)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 3)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
    )
)

(script dormant void 05_outro_04_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 41 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 2 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 70 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola\gondola" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 2)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 1)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 3)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "objects\cinematics\effects\carrier_plasma_beam_closeup\carrier_plasma_beam_closeup" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
    )
)

(script dormant void 05_outro_05_predict
    (begin
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture\tentacle_capture" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture\tentacle_capture" 1)
        (predict_lightmap_bucket "objects\cinematics\effects\05_outro_rubble\05_outro_rubble" 0)
        (sleep 123)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 41 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 40 false)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 2 true)
        (predict_bitmap scenarios\solo\05b_deltatowers\bsp_03 70 true)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\cinematics\nature\underwater_caustic_light\underwater_caustic_light" 0)
        (sleep 140)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola\gondola" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (sleep 10)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (sleep 10)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (sleep 2)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (sleep 10)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\gondola\gondola_launch\gondola_launch" 2)
        (sleep 14)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
    )
)

(script static void teleport_bridges
    (begin
        (ai_erase_all)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "bridges_player0")
        (object_teleport (player1) "bridges_player1")
        (ai_place "initial_allies")
        (object_teleport (list_get (ai_actors "initial_allies") 0) "bridges_ally1")
        (object_teleport (list_get (ai_actors "initial_allies") 1) "bridges_ally2")
        (ai_set_orders "initial_allies" "tower1_ext_allies")
        (sleep_forever mission)
        (sleep_tower1)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake bridges_start)
        (wake tower2_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower2_exit" (players)) true)
                (= (volume_test_objects "vol_central_platform" (players)) true)
            )
        )
        (wake central_platform_start)
        (wake gondola_01_start)
        (sleep_until (= (volume_test_objects "vol_tower3_entry" (players)) true))
        (wake tower3_start)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_until (= (volume_test_objects "vol_tunnel_01_entry" (players)) true))
        (wake sunken_tunnel1_start)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_tower3)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_tower2
    (begin
        (ai_erase_all)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "tower2_player0")
        (object_teleport (player1) "tower2_player1")
        (ai_place "initial_allies")
        (object_teleport (list_get (ai_actors "initial_allies") 0) "tower2_ally1")
        (object_teleport (list_get (ai_actors "initial_allies") 1) "tower2_ally2")
        (ai_set_orders "initial_allies" "tower2_ext_allies_01")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake tower2_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tower2_exit" (players)) true)
                (= (volume_test_objects "vol_central_platform" (players)) true)
            )
        )
        (wake central_platform_start)
        (wake gondola_01_start)
        (sleep_until (= (volume_test_objects "vol_tower3_entry" (players)) true))
        (wake tower3_start)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_until (= (volume_test_objects "vol_tunnel_01_entry" (players)) true))
        (wake sunken_tunnel1_start)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_tower3)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_central_platform
    (begin
        (ai_erase_all)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "center_plat_player0")
        (object_teleport (player1) "center_plat_player1")
        (ai_place "initial_allies")
        (object_teleport (list_get (ai_actors "initial_allies") 0) "center_plat_ally1")
        (object_teleport (list_get (ai_actors "initial_allies") 1) "center_plat_ally2")
        (ai_set_orders "initial_allies" "tower2_ext_allies_02")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake central_platform_start)
        (wake gondola_01_start)
        (sleep_until (= (volume_test_objects "vol_tower3_entry" (players)) true))
        (wake tower3_start)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_until (= (volume_test_objects "vol_tunnel_01_entry" (players)) true))
        (wake sunken_tunnel1_start)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_tower3)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_gondola_01
    (begin
        (ai_erase_all)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "gondola_01_player0")
        (object_teleport (player1) "gondola_01_player1")
        (ai_place "initial_allies")
        (object_teleport (list_get (ai_actors "initial_allies") 0) "gondola_01_ally1")
        (object_teleport (list_get (ai_actors "initial_allies") 1) "gondola_01_ally2")
        (ai_set_orders "initial_allies" "gondola_01_allies")
        (device_set_position_immediate "gondola_01_a" 1.0)
        (device_set_position_immediate "gondola_01_b" 1.0)
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake gondola_01_start)
        (sleep_until (= (volume_test_objects "vol_tower3_entry" (players)) true))
        (wake tower3_start)
        (sleep_gondola_01)
        (sleep_until (= (volume_test_objects "vol_tunnel_01_entry" (players)) true))
        (wake sunken_tunnel1_start)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_tower3)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_tower3
    (begin
        (ai_erase_all)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "tower3_player0")
        (object_teleport (player1) "tower3_player1")
        (ai_place "initial_allies")
        (object_teleport (list_get (ai_actors "initial_allies") 0) "tower3_ally1")
        (object_teleport (list_get (ai_actors "initial_allies") 1) "tower3_ally2")
        (ai_set_orders "initial_allies" "tower3_allies")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake tower3_start)
        (sleep_until (= (volume_test_objects "vol_tunnel_01_entry" (players)) true))
        (wake sunken_tunnel1_start)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_tower3)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_tunnel_01
    (begin
        (ai_erase_all)
        (ai_place "temp_bsp2_allies")
        (structure_bsp_index 1)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "tunnel_01_player0")
        (object_teleport (player1) "tunnel_01_player1")
        (object_teleport (list_get (ai_actors "temp_bsp2_allies") 0) "tunnel_01_ally1")
        (object_teleport (list_get (ai_actors "temp_bsp2_allies") 1) "tunnel_01_ally2")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake sunken_tunnel1_start)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_sunken_chamber
    (begin
        (ai_erase_all)
        (ai_place "temp_bsp2_allies")
        (structure_bsp_index 1)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "sunken_chamber_player0")
        (object_teleport (player1) "sunken_chamber_player1")
        (object_teleport (list_get (ai_actors "temp_bsp2_allies") 0) "sunken_chamber_ally1")
        (object_teleport (list_get (ai_actors "temp_bsp2_allies") 1) "sunken_chamber_ally2")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (sleep_sunken_tunnel_01)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake sunken_chamber_start)
        (wake sunken_tunnel2_start)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_tunnel_02
    (begin
        (ai_erase_all)
        (ai_place "temp_bsp2_allies")
        (structure_bsp_index 1)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "tunnel_02_player0")
        (object_teleport (player1) "tunnel_02_player1")
        (object_teleport (list_get (ai_actors "temp_bsp2_allies") 0) "tunnel_02_ally1")
        (object_teleport (list_get (ai_actors "temp_bsp2_allies") 1) "tunnel_02_ally2")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake sunken_tunnel2_start)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_island_int_entry" (players)) true)
                (= (version) 2)
            )
        )
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_sunken_tunnel_02)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_island
    (begin
        (ai_erase_all)
        (ai_place "temp_bsp3_allies")
        (structure_bsp_index 2)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "island_player0")
        (object_teleport (player1) "island_player1")
        (object_teleport (list_get (ai_actors "temp_bsp3_allies") 0) "island_ally1")
        (object_teleport (list_get (ai_actors "temp_bsp3_allies") 1) "island_ally2")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake island_interior_start)
        (wake island_gully_start)
        (wake island_exterior_start)
        (wake gondola_02_start)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_island_exterior)
        (sleep_gondola_02)
    )
)

(script static void teleport_gondola_02
    (begin
        (ai_erase_all)
        (ai_place "temp_bsp3_allies")
        (structure_bsp_index 2)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "gondola_02_player0")
        (object_teleport (player1) "gondola_02_player1")
        (object_teleport (list_get (ai_actors "temp_bsp3_allies") 0) "gondola_02_ally1")
        (object_teleport (list_get (ai_actors "temp_bsp3_allies") 1) "gondola_02_ally2")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_island_exterior)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake gondola_02_start)
        (sleep_until (= (volume_test_objects "vol_temple_ext" (players)) true))
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
        (sleep_gondola_02)
    )
)

(script static void teleport_temple_ext
    (begin
        (ai_erase_all)
        (ai_place "temp_bsp3_allies")
        (structure_bsp_index 2)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "temple_ext_player0")
        (object_teleport (player1) "temple_ext_player1")
        (object_teleport (list_get (ai_actors "temp_bsp3_allies") 0) "temple_ext_ally1")
        (object_teleport (list_get (ai_actors "temp_bsp3_allies") 1) "temple_ext_ally2")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_island_exterior)
        (sleep_gondola_02)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake temple_entry_start)
        (wake temple_foyer_start)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
    )
)

(script static void teleport_temple_int
    (begin
        (ai_erase_all)
        (structure_bsp_index 2)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "temple_int_player0")
        (object_teleport (player1) "temple_int_player1")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_island_exterior)
        (sleep_gondola_02)
        (sleep_temple_entry)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake temple_center_start)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
    )
)

(script static void teleport_temple_retreat
    (begin
        (ai_erase_all)
        (structure_bsp_index 2)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (sleep 2)
        (object_teleport (player0) "temple_return_player0")
        (object_teleport (player1) "temple_return_player1")
        (sleep_forever mission)
        (sleep_tower1)
        (sleep_bridges)
        (sleep_tower2)
        (sleep_central_platform)
        (sleep_gondola_01)
        (sleep_tower3)
        (sleep_sunken_tunnel_01)
        (sleep_sunken_chamber)
        (sleep_sunken_tunnel_02)
        (sleep_island_exterior)
        (sleep_gondola_02)
        (sleep_temple_entry)
        (sleep_boss_fight)
        (garbage_collect_now)
        (game_save_no_timeout)
        (device_one_sided_set "door_main" false)
        (device_one_sided_set "temple_retreat_exit" false)
        (wake temple_foyer_retreat)
        (wake temple_entry_retreat)
    )
)

