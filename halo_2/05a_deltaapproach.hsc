; Decompiled with Blamite
; Source file: 05a_deltaapproach.hsc
; Start time: 4/7/2022 7:17:15
; Decompilation finished in ~0.008502s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global short straggler_no 0)
(global effect phantom_boom "effects\scenarios\solo\deltatemple\phantom_explosion")
(global short lz_turret_count 2)
(global boolean lz_mounted_up false)
(global boolean ride_ally_comment_go false)
(global boolean lz_pelican_in_sight false)
(global boolean lz_pelican_arrived false)
(global boolean turrets_down false)
(global boolean lz_phantom_01_leaving false)
(global boolean lz_phantom_02_leaving false)
(global boolean lz_phantom_03_leaving false)
(global boolean wraith_warning_go false)
(global short bridge_vehicles_total 1)
(global boolean regret_ally_comment_go false)
(global boolean bunker_holo_trans false)
(global boolean bunker_holo_chant true)
(global boolean bridge_ally_comment_go false)
(global boolean bridge_pelican_in_sight false)
(global boolean bridge_pelican_arrived false)
(global real bridge_state 0.0)
(global short w_path_turret_count 1)
(global short w_path_spawn_count 5)
(global short temple_ent_near_turret 1)
(global short temple_ent_far_turret 1)
(global short temple_ent_spawn_count 5)
(global boolean temple_ent_phase_01 false)
(global boolean temple_ent_phase_02 false)
(global boolean structure_comment_go false)
(global boolean old_temple_pel_comment_go false)
(global boolean old_temple_bombs_away false)
(global short old_temple_veh_total 2)
(global boolean old_temple_ghosts_over false)
(global boolean old_temple_chatter false)
(global boolean old_temp_middle_go false)
(global boolean court_holo_chant true)
(global boolean court_holo_trans false)
(global short grotto_final_snipers 1)
(global boolean tower1_holo_trans false)
(global boolean tower1_holo_chant true)
(global boolean who_points true)


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

(script static void x05_01_predict_stub
    (begin
        (wake x05_01_predict)
    )
)

(script static void x05_02_predict_stub
    (begin
        (wake x05_02_predict)
    )
)

(script static void x05_03_predict_stub
    (begin
        (wake x05_03_predict)
    )
)

(script static void x05_04_predict_stub
    (begin
        (wake x05_04_predict)
    )
)

(script static void x05_05_predict_stub
    (begin
        (wake x05_05_predict)
    )
)

(script static void x05_06a_predict_stub
    (begin
        (wake x05_06a_predict)
    )
)

(script static void x05_06b_predict_stub
    (begin
        (wake x05_06b_predict)
    )
)

(script static void x05_07_predict_stub
    (begin
        (wake x05_07_predict)
    )
)

(script static void x05_08_predict_stub
    (begin
        (wake x05_08_predict)
    )
)

(script static void 05_intro_01_predict_stub
    (begin
        (wake 05_intro_01_predict)
    )
)

(script static void 05_intro_02_predict_stub
    (begin
        (wake 05_intro_02_predict)
    )
)

(script static void 05_intro_03_predict_stub
    (begin
        (wake 05_intro_03_predict)
    )
)

(script dormant void x05_score_01
    (begin
        (sleep 40)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\music\x05_01_mus" none 1.0)
        (print "x05 score 01 start")
    )
)

(script dormant void x05_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_01_fol" none 1.0)
        (print "x05 foley 01 start")
    )
)

(script dormant void x05_slipspace_open
    (begin
        (sleep 10)
        (print "effect - slipspace open")
        (object_create_anew "x05_slipspace")
        (sleep 300)
        (object_destroy "x05_slipspace")
    )
)

(script dormant void x05_cinematic_lighting_scene_01
    (begin
        (cinematic_lighting_set_primary_light 34.0 146.0 0.51 0.79 0.99)
        (cinematic_lighting_set_secondary_light 6.0 118.0 0.18 0.22 0.41)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (object_uses_cinematic_lighting "carrier" true)
        (object_uses_cinematic_lighting "iac" true)
        (object_uses_cinematic_lighting "x05_debris" true)
    )
)

(script static void x05_02_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "miranda")
        (object_create_anew "iac_bridge")
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "iac_bridge" true)
    )
)

(script static void x05_01_setup
    (begin
        (object_create_anew "carrier")
        (object_create_anew "iac")
        (object_create_anew "x05_debris")
        (object_cinematic_lod "carrier" true)
        (object_cinematic_lod "iac" true)
        (object_cinematic_lod "x05_debris" true)
        (wake x05_score_01)
        (wake x05_foley_01)
        (wake x05_slipspace_open)
        (wake x05_cinematic_lighting_scene_01)
    )
)

(script static void x05_01_cleanup
    (begin
        (object_destroy "carrier")
    )
)

(script static void x05_scene_01
    (begin
        (camera_control true)
        (set_pjl_effect "deltaapproach_1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (x05_01_predict_stub)
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\music\x05_01_mus")
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_01_fol")
        (sleep prediction_offset)
        (x05_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_01" none "anchor_flag_x05")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x05\x05" "iac_01" "anchor_x05")
        (scenery_animation_start_relative "carrier" "scenarios\objects\covenant\military\capital_ship\x05\x05" "capital_ship_01" "anchor_x05")
        (scenery_animation_start_relative "x05_debris" "objects\cinematics\effects\x05_building_debris\x05\x05" "debris_01" "anchor_x05")
        (cinematic_start 0.0 0.0 0.0 30)
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_02_predict_stub)
        (x05_02_problem_actors)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_02_fol")
        (sleep (camera_set_pan))
        (x05_01_cleanup)
    )
)

(script dormant void x05_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_02_fol" none 1.0)
        (print "x05 foley 02 start")
    )
)

(script dormant void x05_0010_mir
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0010_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0010_mir" 1.0)
        (unit_set_emotional_state "miranda" "shocked" 0.5 15)
        (print "miranda - shocked .5 15")
        (unit_set_emotional_state "nav_officer" "annoyed" 0.25 0)
        (print "nav_officer - pain .5 0")
        (unit_set_emotional_state "weap_officer" "annoyed" 0.5 0)
        (print "nav_officer - annoyed .5 0")
        (sleep 153)
        (unit_set_emotional_state "miranda" "pensive" 0.5 30)
        (print "miranda - pensive .25 30")
    )
)

(script dormant void x05_0020_mir
    (begin
        (sleep 25)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0020_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0020_mir" 1.0)
    )
)

(script dormant void x05_0030_no1
    (begin
        (sleep 51)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0030_no1" "nav_officer" 1.0)
        (attract_mode_set_seconds "x05_0030_no1" 2.0)
    )
)

(script dormant void x05_0040_wo1
    (begin
        (sleep 127)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0040_wo1" "weap_officer" 1.0)
        (attract_mode_set_seconds "x05_0040_wo1" 2.0)
    )
)

(script dormant void x05_0050_mir
    (begin
        (sleep 204)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0050_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0050_mir" 2.0)
    )
)

(script dormant void x05_0060_mir
    (begin
        (sleep 272)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0060_mir" none 1.0 "radio_default_in")
        (attract_mode_set_seconds "x05_0060_mir" 2.0)
    )
)

(script dormant void x05_0070_mir
    (begin
        (sleep 327)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0070_mir" none 1.0 "radio_default_out")
        (attract_mode_set_seconds "x05_0070_mir" 1.0)
        (sleep 27)
        (unit_set_emotional_state "johnson" "inquisitive" 0.5 10)
        (print "johnson - inquisitive .5 10")
    )
)

(script dormant void x05_0080_jon
    (begin
        (sleep 367)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0080_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x05_0080_jon" 2.0)
    )
)

(script dormant void x05_0090_cor
    (begin
        (sleep 437)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0090_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0090_cor" 1.0)
    )
)

(script dormant void x05_0100_no1
    (begin
        (sleep 481)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0100_no1" "nav_officer" 1.0)
        (attract_mode_set_seconds "x05_0100_no1" 3.0)
        (unit_set_emotional_state "miranda" "pensive" 0.5 0)
        (print "miranda - pensive .5 0")
        (unit_set_emotional_state "nav_officer" "shocked" 0.5 30)
        (print "nav_officer - shocked .5 30")
        (sleep 90)
        (unit_set_emotional_state "miranda" "shocked" 0.5 120)
        (print "miranda - shocked .5 120")
        (sleep 60)
        (unit_set_emotional_state "miranda" "shocked" 0.25 90)
        (print "miranda - shocked .25 90")
        (sleep 75)
        (unit_set_emotional_state "miranda" "shocked" 0.05 60)
        (print "miranda - shocked .05 60")
    )
)

(script dormant void x05_0110_mir
    (begin
        (sleep 594)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0110_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0110_mir" 3.0)
    )
)

(script dormant void x05_fov_02
    (begin
        (sleep 49)
        (camera_pan 36.0 0)
        (print "fov change: 60 -> 36 over 0 ticks")
        (sleep 154)
        (camera_pan 60.0 0)
        (print "fov change: 36 -> 60 over 0 ticks")
    )
)

(script dormant void x05_05_dof_scene_02
    (begin
        (sleep 49)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.0 0.0 0.0 1.0 1.0 0.0)
        (print "rack focus")
        (sleep 76)
        (cinematic_screen_effect_set_crossfade2 1.0 0.0 1.0 0.5 1.0 0.0 0.5)
        (print "rack focus")
        (sleep 78)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void x05_light_scene_02_bridge_1
    (begin
        (print "light bridge")
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -73.0 160.0 0.117647 0.117647 0.176471)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "johnson" true)
        (object_uses_cinematic_lighting "nav_officer" true)
        (object_uses_cinematic_lighting "weap_officer" true)
        (object_uses_cinematic_lighting "cigar" true)
        (object_uses_cinematic_lighting "iac_bridge" true)
        (object_uses_cinematic_lighting "hev_bay" true)
        (object_uses_cinematic_lighting "hev_01" true)
        (object_uses_cinematic_lighting "hev_02" true)
        (object_uses_cinematic_lighting "hev_03" true)
        (object_uses_cinematic_lighting "hev_04" true)
        (object_uses_cinematic_lighting "hev_05" true)
        (object_uses_cinematic_lighting "hev_06" true)
        (object_uses_cinematic_lighting "hev_07" true)
        (object_uses_cinematic_lighting "hev_08" true)
        (object_uses_cinematic_lighting "hev_09" true)
        (object_uses_cinematic_lighting "hev_10" true)
        (object_uses_cinematic_lighting "hev_11" true)
        (object_uses_cinematic_lighting "hev_12" true)
        (object_uses_cinematic_lighting "hev_13" true)
        (object_uses_cinematic_lighting "hev_14" true)
        (object_uses_cinematic_lighting "hev_15" true)
        (object_uses_cinematic_lighting "hev_16" true)
        (object_uses_cinematic_lighting "hev_17" true)
    )
)

(script dormant void x05_light_scene_02_hev_1
    (begin
        (sleep 264)
        (print "light hev")
        (cinematic_lighting_set_primary_light 8.0 172.0 0.55 0.39 0.26)
        (cinematic_lighting_set_secondary_light -46.0 246.0 0.19 0.18 0.26)
        (cinematic_lighting_set_ambient_light 0.04 0.04 0.05)
    )
)

(script dormant void x05_light_scene_02_bridge_2
    (begin
        (sleep 479)
        (print "light bridge")
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -73.0 160.0 0.117647 0.117647 0.176471)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
    )
)

(script static void x05_02_setup
    (begin
        (object_create_anew "chief")
        (object_create_anew "johnson")
        (object_create_anew "nav_officer")
        (object_create_anew "weap_officer")
        (object_create_anew "cigar")
        (object_create_anew_containing "hev")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "nav_officer" true)
        (object_cinematic_lod "weap_officer" true)
        (object_cinematic_lod "cigar" true)
        (object_cinematic_lod "hev_bay" true)
        (object_cinematic_lod "hev_01" true)
        (object_cinematic_lod "hev_02" true)
        (object_cinematic_lod "hev_03" true)
        (object_cinematic_lod "hev_04" true)
        (object_cinematic_lod "hev_05" true)
        (object_cinematic_lod "hev_06" true)
        (object_cinematic_lod "hev_07" true)
        (object_cinematic_lod "hev_08" true)
        (object_cinematic_lod "hev_09" true)
        (object_cinematic_lod "hev_10" true)
        (object_cinematic_lod "hev_11" true)
        (object_cinematic_lod "hev_12" true)
        (object_cinematic_lod "hev_13" true)
        (object_cinematic_lod "hev_14" true)
        (object_cinematic_lod "hev_15" true)
        (object_cinematic_lod "hev_16" true)
        (object_cinematic_lod "hev_17" true)
        (wake x05_0010_mir)
        (wake x05_0020_mir)
        (wake x05_0030_no1)
        (wake x05_0040_wo1)
        (wake x05_0050_mir)
        (wake x05_0060_mir)
        (wake x05_0070_mir)
        (wake x05_0080_jon)
        (wake x05_0090_cor)
        (wake x05_0100_no1)
        (wake x05_0110_mir)
        (wake x05_foley_02)
        (wake x05_fov_02)
        (wake x05_05_dof_scene_02)
        (wake x05_light_scene_02_bridge_1)
        (wake x05_light_scene_02_hev_1)
        (wake x05_light_scene_02_bridge_2)
    )
)

(script static void x05_scene_02
    (begin
        (x05_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_02" none "anchor_flag_x05")
        (custom_animation_relative "miranda" "objects\characters\miranda\x05\x05" "miranda_02" false "anchor_x05")
        (custom_animation_relative "chief" "objects\characters\masterchief\x05\x05" "chief_02" false "anchor_x05")
        (custom_animation_relative "johnson" "objects\characters\marine\x05\x05" "johnson_02" false "anchor_x05")
        (custom_animation_relative "nav_officer" "objects\characters\marine\x05\x05" "nav_02" false "anchor_x05")
        (custom_animation_relative "weap_officer" "objects\characters\marine\x05\x05" "weap_02" false "anchor_x05")
        (scenery_animation_start_relative "cigar" "objects\cinematics\human\cigar\cigar_bent\x05\x05" "cigar_bent_02" "anchor_x05")
        (scenery_animation_start_relative "hev_01" "objects\cinematics\human\hev\x05\x05" "hev01_02" "anchor_x05")
        (scenery_animation_start_relative "hev_02" "objects\cinematics\human\hev\x05\x05" "hev02_02" "anchor_x05")
        (scenery_animation_start_relative "hev_03" "objects\cinematics\human\hev\x05\x05" "hev03_02" "anchor_x05")
        (scenery_animation_start_relative "hev_04" "objects\cinematics\human\hev\x05\x05" "hev04_02" "anchor_x05")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\x05\x05" "bridge_02" "anchor_x05")
        (scenery_animation_start_relative "hev_bay" "objects\cinematics\human\inamberclad_hevbay\x05\x05" "hevbay_02" "anchor_x05")
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\music\x05_03_mus")
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_03_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x05_score_03
    (begin
        (sleep 113)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\music\x05_03_mus" none 1.0)
        (print "x05 score 03 start")
    )
)

(script dormant void x05_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_03_fol" none 1.0)
        (print "x05 foley 03 start")
    )
)

(script dormant void x05_0120_cor
    (begin
        (sleep 60)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0120_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0120_cor" 2.0)
    )
)

(script dormant void x05_cinematic_lighting_scene_03
    (begin
        (cinematic_lighting_set_primary_light 34.0 146.0 0.51 0.79 0.99)
        (cinematic_lighting_set_secondary_light 6.0 118.0 0.18 0.22 0.41)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
    )
)

(script static void x05_03_setup
    (begin
        (object_create_anew "delta_halo")
        (object_create_anew "matte_substance")
        (object_uses_cinematic_lighting "delta_halo" true)
        (wake x05_score_03)
        (wake x05_foley_03)
        (wake x05_0120_cor)
    )
)

(script static void x05_scene_03
    (begin
        (x05_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_03" none "anchor_flag_x05")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x05\x05" "iac_03" "anchor_x05")
        (scenery_animation_start_relative "x05_debris" "objects\cinematics\effects\x05_building_debris\x05\x05" "debris_03" "anchor_x05")
        (scenery_animation_start_relative "delta_halo" "scenarios\objects\forerunner\industrial\halo\x05\x05" "halo_03" "anchor_x05")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\x05\x05" "substance_space_03" "anchor_x05")
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_04_fol")
        (sleep (camera_set_pan))
        (object_destroy "x05_debris")
    )
)

(script dormant void x05_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_04_fol" none 1.0)
        (print "x05 foley 04 start")
    )
)

(script dormant void x05_0130_jon
    (begin
        (sleep 12)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0130_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x05_0130_jon" 1.0)
        (unit_set_emotional_state "johnson" "shocked" 0.75 10)
        (print "johnson - shocked .75 10")
    )
)

(script dormant void x05_0140_mir
    (begin
        (unit_set_emotional_state "miranda" "shocked" 0.25 0)
        (print "miranda - shocked .25 0")
        (sleep 63)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0140_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0140_mir" 2.0)
        (unit_set_emotional_state "miranda" "pain" 0.25 60)
        (print "miranda - pain .25 60")
    )
)

(script dormant void x05_0150_mir
    (begin
        (sleep 132)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0150_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0150_mir" 2.0)
    )
)

(script dormant void x05_0160_cor
    (begin
        (sleep 202)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0160_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0160_cor" 4.0)
    )
)

(script dormant void x05_0170_mir
    (begin
        (sleep 340)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0170_mir" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0170_mir" 3.0)
    )
)

(script dormant void x05_0180_mir
    (begin
        (sleep 418)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0180_mir" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0180_mir" 2.0)
        (unit_set_emotional_state "miranda" "angry" 0.25 0)
        (print "miranda - angry .25 0")
    )
)

(script dormant void x05_0181_mir
    (begin
        (sleep 483)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0181_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0181_mir" 2.0)
        (texture_camera_off)
    )
)

(script dormant void x05_0190_cor
    (begin
        (sleep 550)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0190_cor" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0190_cor" 1.0)
    )
)

(script dormant void x05_0200_mir
    (begin
        (sleep 573)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0200_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0200_mir" 1.0)
    )
)

(script dormant void x05_0210_wo1
    (begin
        (sleep 602)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0210_wo1" "weap_officer" 1.0)
        (attract_mode_set_seconds "x05_0210_wo1" 3.0)
        (unit_set_emotional_state "weap_officer" "pensive" 0.5 60)
        (print "weap_officer - pensive .5 60")
    )
)

(script dormant void x05_0220_mir
    (begin
        (sleep 704)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0220_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x05_0220_mir" 1.0)
    )
)

(script dormant void x05_texture_camera_scene_04
    (begin
        (object_create_anew "texture_camera")
        (texture_camera_set_object_marker "texture_camera" "marker" 50.0)
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\x05\x05" "texture_camera_04" "anchor_x05")
    )
)

(script dormant void x05_fov_04
    (begin
        (rasterizer_profile_include_all)
        (sleep 588)
        (camera_pan 34.0 0)
        (print "fov change: 60 -> 34 over 0 ticks")
    )
)

(script dormant void x05_05_dof_scene_04
    (begin
        (sleep 589)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 0.5 0.0 0.0 0.0 1.0 1.0 0.0)
        (print "rack focus")
        (sleep 112)
        (cinematic_screen_effect_set_crossfade2 0.5 0.0 1.0 0.25 1.0 0.0 0.25)
        (print "rack focus")
    )
)

(script dormant void x05_cinematic_lighting_scene_04
    (begin
        (cinematic_lighting_set_primary_light 8.0 172.0 0.55 0.39 0.26)
        (cinematic_lighting_set_secondary_light -46.0 246.0 0.19 0.18 0.26)
        (cinematic_lighting_set_ambient_light 0.04 0.04 0.05)
    )
)

(script dormant void x05_light_scene_04_bridge_1
    (begin
        (sleep 49)
        (print "light bridge")
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -73.0 160.0 0.117647 0.117647 0.176471)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
    )
)

(script dormant void x05_light_scene_04_hev_1
    (begin
        (sleep 326)
        (print "light hev")
        (cinematic_lighting_set_primary_light 8.0 172.0 0.55 0.39 0.26)
        (cinematic_lighting_set_secondary_light -46.0 246.0 0.19 0.18 0.26)
        (cinematic_lighting_set_ambient_light 0.04 0.04 0.05)
    )
)

(script dormant void x05_light_scene_04_bridge_2
    (begin
        (sleep 467)
        (print "light bridge")
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -73.0 160.0 0.117647 0.117647 0.176471)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
    )
)

(script static void x05_04_setup
    (begin
        (wake x05_0130_jon)
        (wake x05_0140_mir)
        (wake x05_0150_mir)
        (wake x05_0160_cor)
        (wake x05_0170_mir)
        (wake x05_0180_mir)
        (wake x05_0181_mir)
        (wake x05_0190_cor)
        (wake x05_0200_mir)
        (wake x05_0210_wo1)
        (wake x05_0220_mir)
        (wake x05_texture_camera_scene_04)
        (wake x05_fov_04)
        (wake x05_05_dof_scene_04)
        (wake x05_cinematic_lighting_scene_04)
        (wake x05_light_scene_04_bridge_1)
        (wake x05_light_scene_04_hev_1)
        (wake x05_light_scene_04_bridge_2)
        (wake x05_foley_04)
    )
)

(script static void x05_04_cleanup
    (begin
        (object_destroy "cigar")
        (object_destroy "texture_camera")
        (cinematic_set_far_clip_distance)
    )
)

(script static void x05_scene_04
    (begin
        (x05_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_04" none "anchor_flag_x05")
        (custom_animation_relative "miranda" "objects\characters\miranda\x05\x05" "miranda_04" false "anchor_x05")
        (custom_animation_relative "chief" "objects\characters\masterchief\x05\x05" "chief_04" false "anchor_x05")
        (custom_animation_relative "johnson" "objects\characters\marine\x05\x05" "johnson_04" false "anchor_x05")
        (custom_animation_relative "nav_officer" "objects\characters\marine\x05\x05" "nav_04" false "anchor_x05")
        (custom_animation_relative "weap_officer" "objects\characters\marine\x05\x05" "weap_04" false "anchor_x05")
        (scenery_animation_start_relative "cigar" "objects\cinematics\human\cigar\cigar_bent\x05\x05" "cigar_bent_04" "anchor_x05")
        (scenery_animation_start_relative "hev_01" "objects\cinematics\human\hev\x05\x05" "hev01_04" "anchor_x05")
        (scenery_animation_start_relative "hev_02" "objects\cinematics\human\hev\x05\x05" "hev02_04" "anchor_x05")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\x05\x05" "bridge_04" "anchor_x05")
        (scenery_animation_start_relative "hev_bay" "objects\cinematics\human\inamberclad_hevbay\x05\x05" "hevbay_04" "anchor_x05")
        (scenery_animation_start_relative "delta_halo" "scenarios\objects\forerunner\industrial\halo\x05\x05" "halo_04" "anchor_x05")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\x05\x05" "substance_space_04" "anchor_x05")
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_05_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_05_fol")
        (sleep (camera_set_pan))
        (x05_04_cleanup)
    )
)

(script dormant void x05_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_05_fol" none 1.0)
        (print "x05 foley 05 start")
    )
)

(script dormant void x05_0230_mir
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0230_mir" none 1.0)
        (attract_mode_set_seconds "x05_0230_mir" 6.0)
    )
)

(script dormant void x05_cinematic_lighting_scene_05
    (begin
        (cinematic_lighting_set_primary_light 34.0 146.0 0.51 0.79 0.99)
        (cinematic_lighting_set_secondary_light 6.0 118.0 0.18 0.22 0.41)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
    )
)

(script static void x05_05_setup
    (begin
        (wake x05_0230_mir)
        (wake x05_foley_05)
        (wake x05_cinematic_lighting_scene_05)
    )
)

(script static void x05_scene_05
    (begin
        (x05_05_setup)
        (camera_pan 60.0 0)
        (print "fov change: 34 -> 60 over 0 ticks")
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_05" none "anchor_flag_x05")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x05\x05" "iac_05" "anchor_x05")
        (scenery_animation_start_relative "delta_halo" "scenarios\objects\forerunner\industrial\halo\x05\x05" "halo_05" "anchor_x05")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\x05\x05" "substance_space_05" "anchor_x05")
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_06a_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\music\x05_06a_mus")
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_06a_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x05_score_06a
    (begin
        (sleep 113)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\music\x05_06a_mus" none 1.0)
        (print "x05 score 06a start")
    )
)

(script dormant void x05_foley_06a
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_06a_fol" none 1.0)
        (print "x05 foley 06a start")
    )
)

(script dormant void x05_0240_mir
    (begin
        (sleep 0)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0240_mir" none 1.0 "radio_default_in")
        (attract_mode_set_seconds "x05_0240_mir" 4.0)
    )
)

(script dormant void x05_cinematic_light_scene_06a
    (begin
        (cinematic_lighting_set_primary_light 8.0 172.0 0.55 0.39 0.26)
        (cinematic_lighting_set_secondary_light -46.0 246.0 0.19 0.18 0.26)
        (cinematic_lighting_set_ambient_light 0.04 0.04 0.05)
    )
)

(script static void x05_06b_problem_actors
    (begin
        (object_create_anew "johnson")
        (object_cinematic_lod "johnson" true)
        (object_uses_cinematic_lighting "johnson" true)
    )
)

(script static void x05_06a_setup
    (begin
        (object_destroy "johnson")
        (wake x05_score_06a)
        (wake x05_foley_06a)
        (wake x05_0240_mir)
        (wake x05_cinematic_light_scene_06a)
    )
)

(script static void x05_scene_06a
    (begin
        (x05_06a_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_06a" none "anchor_flag_x05")
        (custom_animation_relative "chief" "objects\characters\masterchief\x05\x05" "chief_06a" false "anchor_x05")
        (scenery_animation_start_relative "hev_01" "objects\cinematics\human\hev\x05\x05" "hev01_06a" "anchor_x05")
        (scenery_animation_start_relative "hev_bay" "objects\cinematics\human\inamberclad_hevbay\x05\x05" "hevbay_06a" "anchor_x05")
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_06b_predict_stub)
        (x05_06b_problem_actors)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_06b_fol")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_screen_effect_stop 1.0)
        (sleep 5)
    )
)

(script dormant void x05_foley_06b
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_06b_fol" none 1.0)
        (print "x05 foley 06b start")
    )
)

(script dormant void x05_0250_mir
    (begin
        (sleep 9)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0250_mir" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0250_mir" 3.0)
    )
)

(script dormant void x05_0260_jon
    (begin
        (sleep 89)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0260_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x05_0260_jon" 1.0)
    )
)

(script dormant void x05_0270_mir
    (begin
        (sleep 125)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0270_mir" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x05_0270_mir" 3.0)
    )
)

(script dormant void x05_0280_mir
    (begin
        (sleep 225)
        (sound_impulse_time "sound\dialog\levels\05_deltatemple\cinematics\x05_0280_mir" none 1.0 "radio_default_out")
        (attract_mode_set_seconds "x05_0280_mir" 2.0)
    )
)

(script dormant void x05_0290_mas
    (begin
        (sleep 320)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0290_mas" "chief" 1.0)
        (attract_mode_set_seconds "x05_0290_mas" 1.0)
    )
)

(script dormant void x05_0300_wo1
    (begin
        (sleep 356)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0300_wo1" "weap_officer" 1.0)
        (attract_mode_set_seconds "x05_0300_wo1" 2.0)
    )
)

(script dormant void x05_fov_06b
    (begin
        (sleep 358)
        (camera_pan 35.0 0)
        (print "fov change: 60 -> 35 over 0 ticks")
    )
)

(script dormant void x05_light_scene_06b_bridge_1
    (begin
        (rasterizer_profile_include_all)
        (sleep 358)
        (print "light bridge")
        (cinematic_lighting_set_primary_light -52.0 292.0 0.08 0.15 0.22)
        (cinematic_lighting_set_secondary_light -73.0 160.0 0.117647 0.117647 0.176471)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
    )
)

(script static void x05_07_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "matte_delta_halo_close")
    )
)

(script static void x05_06b_setup
    (begin
        (wake x05_0250_mir)
        (wake x05_0260_jon)
        (wake x05_0270_mir)
        (wake x05_0280_mir)
        (wake x05_0290_mas)
        (wake x05_0300_wo1)
        (wake x05_foley_06b)
        (wake x05_fov_06b)
        (wake x05_light_scene_06b_bridge_1)
    )
)

(script static void x05_06b_cleanup
    (begin
        (object_destroy "miranda")
        (object_destroy "johnson")
        (object_destroy "nav_officer")
        (object_destroy "weap_officer")
    )
)

(script static void x05_scene_06b
    (begin
        (x05_06b_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_06b" none "anchor_flag_x05")
        (custom_animation_relative "miranda" "objects\characters\miranda\x05\x05" "miranda_06b" false "anchor_x05")
        (custom_animation_relative "chief" "objects\characters\masterchief\x05\x05" "chief_06b" false "anchor_x05")
        (custom_animation_relative "johnson" "objects\characters\marine\x05\x05" "johnson_06b" false "anchor_x05")
        (custom_animation_relative "nav_officer" "objects\characters\marine\x05\x05" "nav_06b" false "anchor_x05")
        (custom_animation_relative "weap_officer" "objects\characters\marine\x05\x05" "weap_06b" false "anchor_x05")
        (scenery_animation_start_relative "hev_01" "objects\cinematics\human\hev\x05\x05" "hev01_06b" "anchor_x05")
        (scenery_animation_start_relative "hev_02" "objects\cinematics\human\hev\x05\x05" "hev02_06b" "anchor_x05")
        (scenery_animation_start_relative "hev_03" "objects\cinematics\human\hev\x05\x05" "hev03_06b" "anchor_x05")
        (scenery_animation_start_relative "hev_04" "objects\cinematics\human\hev\x05\x05" "hev04_06b" "anchor_x05")
        (scenery_animation_start_relative "iac_bridge" "objects\cinematics\human\inamberclad_bridge\x05\x05" "bridge_06b" "anchor_x05")
        (scenery_animation_start_relative "hev_bay" "objects\cinematics\human\inamberclad_hevbay\x05\x05" "hevbay_06b" "anchor_x05")
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_07_predict_stub)
        (sleep (- (camera_set_pan) 15.0))
        (x05_07_problem_actors)
        (sleep (camera_set_pan))
        (x05_06b_cleanup)
    )
)

(script dormant void x05_cinematic_lighting_scene_07
    (begin
        (cinematic_lighting_set_primary_light 34.0 146.0 0.51 0.79 0.99)
        (cinematic_lighting_set_secondary_light 6.0 118.0 0.18 0.22 0.41)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
    )
)

(script static void x05_scene_07
    (begin
        (wake x05_cinematic_lighting_scene_07)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_07" none "anchor_flag_x05")
        (camera_pan 60.0 0)
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x05\x05" "iac_07" "anchor_x05")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\x05\x05" "substance_space_07" "anchor_x05")
        (scenery_animation_start_relative "matte_delta_halo_close" "objects\cinematics\matte_paintings\delta_halo_close\x05\x05" "delta_halo_close_07" "anchor_x05")
        (sleep (- (camera_set_pan) prediction_offset))
        (x05_08_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\x05\foley\x05_08_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x05_foley_08
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\x05\foley\x05_08_fol" none 1.0)
        (print "x05 foley 08 start")
    )
)

(script dormant void x05_0310_cor
    (begin
        (sleep 9)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\x05_0310_cor" none 1.0)
        (attract_mode_set_seconds "x05_0310_cor" 1.0)
    )
)

(script dormant void effect_hev_release
    (begin
        (sleep 40)
        (effect_new_on_object_marker "effects\cinematics\05\hev_explosive_bolt" "hev_bay" "explosive_bolt06")
        (effect_new_on_object_marker "effects\cinematics\05\hev_launch_steam" "hev_bay" "steam_vent06")
        (print "effects - first hev")
        (sleep 56)
        (effect_new_on_object_marker "effects\cinematics\05\hev_explosive_bolt" "hev_bay" "explosive_bolt05")
        (effect_new_on_object_marker "effects\cinematics\05\hev_launch_steam" "hev_bay" "steam_vent05")
        (print "effects - second hev")
        (sleep 37)
        (effect_new_on_object_marker "effects\cinematics\05\hev_explosive_bolt" "hev_bay" "explosive_bolt04")
        (effect_new_on_object_marker "effects\cinematics\05\hev_launch_steam" "hev_bay" "steam_vent04")
        (print "effects - second hev")
        (sleep 29)
        (effect_new_on_object_marker "effects\cinematics\05\hev_explosive_bolt" "hev_bay" "explosive_bolt03")
        (effect_new_on_object_marker "effects\cinematics\05\hev_launch_steam" "hev_bay" "steam_vent03")
        (print "effects - second hev")
    )
)

(script dormant void effect_corona
    (begin
        (sleep 320)
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_start" "hev_10" "")
        (print "effect - re-entry corona")
    )
)

(script dormant void x05_effect_shake_01
    (begin
        (sleep 300)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.5 3.0)
    )
)

(script dormant void x05_cinematic_lighting_scene_08
    (begin
        (cinematic_lighting_set_primary_light 8.0 172.0 0.55 0.39 0.26)
        (cinematic_lighting_set_secondary_light -46.0 246.0 0.19 0.18 0.26)
        (cinematic_lighting_set_ambient_light 0.04 0.04 0.05)
    )
)

(script dormant void x05_light_scene_08_space
    (begin
        (sleep 172)
        (print "light space")
        (cinematic_lighting_set_primary_light -21.0 32.0 0.48 0.53 0.69)
        (cinematic_lighting_set_secondary_light -17.0 214.0 0.18 0.22 0.41)
        (cinematic_lighting_set_ambient_light 0.11 0.11 0.14)
    )
)

(script dormant void destroy_chief
    (begin
        (sleep 52)
        (object_destroy "chief")
        (print "destroy chief")
    )
)

(script static void x05_08_setup
    (begin
        (wake x05_0310_cor)
        (wake x05_foley_08)
        (wake destroy_chief)
        (wake effect_hev_release)
        (wake effect_corona)
        (wake x05_effect_shake_01)
        (wake x05_cinematic_lighting_scene_08)
        (wake x05_light_scene_08_space)
    )
)

(script static void x05_08_cleanup
    (begin
        (object_destroy "delta_halo")
        (object_destroy_containing "iac")
        (object_destroy_containing "hev")
        (object_destroy_containing "matte")
        (hud_blink_health 0.0)
    )
)

(script static void x05_scene_08
    (begin
        (x05_08_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x05\x05" "x05_08" none "anchor_flag_x05")
        (scenery_animation_start_relative "iac" "objects\cinematics\human\inamberclad\x05\x05" "iac_08" "anchor_x05")
        (custom_animation_relative "chief" "objects\characters\masterchief\x05\x05" "chief_08" false "anchor_x05")
        (scenery_animation_start_relative "hev_01" "objects\cinematics\human\hev\x05\x05" "hev01_08" "anchor_x05")
        (scenery_animation_start_relative "hev_02" "objects\cinematics\human\hev\x05\x05" "hev02_08" "anchor_x05")
        (scenery_animation_start_relative "hev_03" "objects\cinematics\human\hev\x05\x05" "hev03_08" "anchor_x05")
        (scenery_animation_start_relative "hev_04" "objects\cinematics\human\hev\x05\x05" "hev04_08" "anchor_x05")
        (scenery_animation_start_relative "hev_05" "objects\cinematics\human\hev\x05\x05" "hev05_08" "anchor_x05")
        (scenery_animation_start_relative "hev_06" "objects\cinematics\human\hev\x05\x05" "hev06_08" "anchor_x05")
        (scenery_animation_start_relative "delta_halo" "scenarios\objects\forerunner\industrial\halo\x05\x05" "halo_08" "anchor_x05")
        (scenery_animation_start_relative "hev_bay" "objects\cinematics\human\inamberclad_hevbay\x05\x05" "hevbay_08" "anchor_x05")
        (scenery_animation_start_relative "matte_delta_halo_close" "objects\cinematics\matte_paintings\delta_halo_close\x05\x05" "delta_halo_close_08" "anchor_x05")
        (scenery_animation_start_relative "hev_07" "objects\cinematics\human\hev\x05\x05" "hev07_08" "anchor_x05")
        (scenery_animation_start_relative "hev_08" "objects\cinematics\human\hev\x05\x05" "hev08_08" "anchor_x05")
        (scenery_animation_start_relative "hev_09" "objects\cinematics\human\hev\x05\x05" "hev09_08" "anchor_x05")
        (scenery_animation_start_relative "hev_10" "objects\cinematics\human\hev\x05\x05" "hev10_08" "anchor_x05")
        (scenery_animation_start_relative "hev_11" "objects\cinematics\human\hev\x05\x05" "hev11_08" "anchor_x05")
        (scenery_animation_start_relative "hev_12" "objects\cinematics\human\hev\x05\x05" "hev12_08" "anchor_x05")
        (scenery_animation_start_relative "hev_13" "objects\cinematics\human\hev\x05\x05" "hev13_08" "anchor_x05")
        (scenery_animation_start_relative "hev_14" "objects\cinematics\human\hev\x05\x05" "hev14_08" "anchor_x05")
        (scenery_animation_start_relative "hev_15" "objects\cinematics\human\hev\x05\x05" "hev15_08" "anchor_x05")
        (scenery_animation_start_relative "hev_16" "objects\cinematics\human\hev\x05\x05" "hev16_08" "anchor_x05")
        (scenery_animation_start_relative "hev_17" "objects\cinematics\human\hev\x05\x05" "hev17_08" "anchor_x05")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
        (x05_08_cleanup)
    )
)

(script static void x05
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash bsp_x05)
        (sleep 1)
        (x05_scene_01)
        (x05_scene_02)
        (x05_scene_03)
        (x05_scene_04)
        (x05_scene_05)
        (x05_scene_06a)
        (x05_scene_06b)
        (x05_scene_07)
        (x05_scene_08)
    )
)

(script dormant void c05_intro_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intro\foley\c05_intro_01_fol" none 1.0)
        (print "c05_intro foley 01 start")
    )
)

(script dormant void c05_1010_cor
    (begin
        (sleep 192)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_1010_cor" none 1.0)
        (attract_mode_set_seconds "c05_1010_cor" 1.0)
    )
)

(script dormant void effect_burn_contrails
    (begin
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_burn" "corona_02" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_contrail" "corona_02" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_burn" "corona_03" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_contrail" "corona_03" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_burn" "corona_04" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_contrail" "corona_04" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_burn" "corona_05" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_contrail" "corona_05" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_burn" "corona_06" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_contrail" "corona_06" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_burn" "corona_07" "")
        (effect_new_on_object_marker "effects\cinematics\05\hev_reentry_contrail" "corona_07" "")
        (print "effect - burn, contrail")
    )
)

(script dormant void effect_chute_pins
    (begin
        (sleep 259)
        (print "effect - chute pins")
        (effect_new_on_object_marker "effects\cinematics\05\hev_explosive_bolt" "hev_02" "cable_release")
    )
)

(script dormant void effect_retros_01
    (begin
        (sleep 264)
        (print "effect - retro rockets")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_02" "retro_rocket")
    )
)

(script dormant void c05_intro_dof_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 79)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 20.0 0.0 0.0 0.0 5.0 5.0 0.0)
        (print "rack focus")
    )
)

(script dormant void c05_intro_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light -21.0 32.0 0.48 0.53 0.69)
        (cinematic_lighting_set_secondary_light -17.0 214.0 0.18 0.22 0.41)
        (cinematic_lighting_set_ambient_light 0.11 0.11 0.14)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "hev_01" true)
        (object_uses_cinematic_lighting "hev_02" true)
        (object_uses_cinematic_lighting "hev_03" true)
        (object_uses_cinematic_lighting "hev_04" true)
        (object_uses_cinematic_lighting "hev_05" true)
        (object_uses_cinematic_lighting "hev_06" true)
        (object_uses_cinematic_lighting "hev_07" true)
        (object_uses_cinematic_lighting "hev_chute" true)
    )
)

(script dormant void hev_unhide
    (begin
        (sleep 126)
        (print "hev unhide")
        (object_hide "hev_06" false)
    )
)

(script dormant void destroy_corona_02
    (begin
        (sleep 210)
        (print "destroy corona 02")
        (object_destroy "corona_02")
    )
)

(script static void c05_intro_01_setup
    (begin
        (object_create_anew "chief")
        (object_create_anew "hev_01")
        (object_create_anew "hev_02")
        (object_create_anew "hev_03")
        (object_create_anew "hev_04")
        (object_create_anew "hev_05")
        (object_create_anew "hev_06")
        (object_create_anew "hev_07")
        (object_create_anew "hev_chute")
        (object_create_anew "corona_01")
        (object_create_anew "corona_02")
        (object_create_anew "corona_03")
        (object_create_anew "corona_04")
        (object_create_anew "corona_05")
        (object_create_anew "corona_06")
        (object_create_anew "corona_07")
        (object_create_anew "matte_horizon")
        (object_create_anew "matte_islands")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "hev_01" true)
        (object_cinematic_lod "hev_02" true)
        (object_cinematic_lod "hev_03" true)
        (object_cinematic_lod "hev_04" true)
        (object_cinematic_lod "hev_05" true)
        (object_cinematic_lod "hev_06" true)
        (object_cinematic_lod "hev_07" true)
        (object_cinematic_lod "hev_chute" true)
        (object_hide "hev_06" true)
        (wake c05_1010_cor)
        (wake c05_intro_foley_01)
        (wake destroy_corona_02)
        (wake effect_burn_contrails)
        (wake hev_unhide)
        (wake effect_chute_pins)
        (wake effect_retros_01)
        (wake c05_intro_dof_01)
        (wake c05_intro_cinematic_light_01)
    )
)

(script static void c05_intro_01_cleanup
    (begin
        (object_destroy "chief_intro")
        (object_destroy_containing "matte")
        (object_destroy "hev_01")
        (object_destroy "hev_02")
        (object_destroy "hev_03")
        (object_destroy "hev_04")
        (object_destroy "hev_05")
        (object_destroy "hev_06")
        (object_destroy "hev_07")
        (object_destroy_containing "corona")
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script static void c05_intro_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "deltaapproach_intro")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (05_intro_01_predict_stub)
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intro\foley\c05_intro_01_fol")
        (sleep prediction_offset)
        (c05_intro_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_intro\05_intro" "05_intro_01" none "anchor_flag_x05")
        (custom_animation_relative "chief" "objects\characters\masterchief\05_intro\05_intro" "chief_01" false "anchor_x05")
        (scenery_animation_start_relative "hev_01" "objects\cinematics\human\hev\05_intro\05_intro" "hev01_01" "anchor_x05")
        (scenery_animation_start_relative "hev_02" "objects\cinematics\human\hev\05_intro\05_intro" "hev02_01" "anchor_x05")
        (scenery_animation_start_relative "hev_03" "objects\cinematics\human\hev\05_intro\05_intro" "hev03_01" "anchor_x05")
        (scenery_animation_start_relative "hev_04" "objects\cinematics\human\hev\05_intro\05_intro" "hev04_01" "anchor_x05")
        (scenery_animation_start_relative "hev_05" "objects\cinematics\human\hev\05_intro\05_intro" "hev05_01" "anchor_x05")
        (scenery_animation_start_relative "hev_06" "objects\cinematics\human\hev\05_intro\05_intro" "hev06_01" "anchor_x05")
        (scenery_animation_start_relative "hev_07" "objects\cinematics\human\hev\05_intro\05_intro" "hev07_01" "anchor_x05")
        (scenery_animation_start_relative "hev_chute" "objects\cinematics\human\hev\hev_chute\05_intro\05_intro" "hev_chute_01" "anchor_x05")
        (scenery_animation_start_relative "corona_02" "objects\cinematics\human\hev_reentry\05_intro\05_intro" "hev_reentry02_01" "anchor_x05")
        (scenery_animation_start_relative "corona_03" "objects\cinematics\human\hev_reentry\05_intro\05_intro" "hev_reentry03_01" "anchor_x05")
        (scenery_animation_start_relative "corona_04" "objects\cinematics\human\hev_reentry\05_intro\05_intro" "hev_reentry04_01" "anchor_x05")
        (scenery_animation_start_relative "corona_05" "objects\cinematics\human\hev_reentry\05_intro\05_intro" "hev_reentry05_01" "anchor_x05")
        (scenery_animation_start_relative "corona_06" "objects\cinematics\human\hev_reentry\05_intro\05_intro" "hev_reentry06_01" "anchor_x05")
        (scenery_animation_start_relative "corona_07" "objects\cinematics\human\hev_reentry\05_intro\05_intro" "hev_reentry07_01" "anchor_x05")
        (scenery_animation_start_relative "matte_horizon" "objects\cinematics\matte_paintings\delta_horizon\05_intro\05_intro" "delta_horizon_01" "anchor_x05")
        (scenery_animation_start_relative "matte_islands" "objects\cinematics\matte_paintings\delta_islands\05_intro\05_intro" "delta_islands_01" "anchor_x05")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intro\foley\c05_intro_02_fol")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c05_intro_01_cleanup)
    )
)

(script dormant void little_alien
    (begin
        (if (= easy (pvs_set_camera)) 
            (begin
                (object_create_anew "tree_toy")
                (objects_attach "grunt_01" "right_hand" "tree_toy" "")
                (sleep 150)
                (object_destroy "tree_toy")
            )
        )
        (if (= normal (pvs_set_camera)) 
            (begin
                (object_create_anew "grenade_toy_01")
                (object_create_anew "grenade_toy_02")
                (objects_attach "grunt_01" "right_hand" "grenade_toy_01" "")
                (objects_attach "grunt_01" "left_hand" "grenade_toy_02" "")
                (sleep 150)
                (object_destroy "grenade_toy_01")
                (object_destroy "grenade_toy_02")
            )
        )
        (if (= heroic (pvs_set_camera)) 
            (begin
                (object_create_anew "intro_fire")
                (sleep 150)
                (object_destroy "intro_fire")
            )
        )
        (if (= legendary (pvs_set_camera)) 
            (begin
                (object_create_anew "chief_toy")
                (object_create_anew "grunt_toy")
                (objects_attach "grunt_01" "right_hand" "grunt_toy" "")
                (objects_attach "grunt_01" "left_hand" "chief_toy" "")
                (sleep 150)
                (object_destroy "chief_toy")
                (object_destroy "grunt_toy")
            )
        )
    )
)

(script dormant void c05_intro_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intro\foley\c05_intro_02_fol" none 1.0)
        (print "c05_intro foley 02 start")
    )
)

(script dormant void effect_retros_02
    (begin
        (sleep 1)
        (print "effect - retro-rockets")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_01" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_02" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_03" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_04" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_05" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_06" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_07" "retro_rocket")
    )
)

(script dormant void effect_retros_03
    (begin
        (sleep 310)
        (print "effect - retro-rockets")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_01" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_02" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_03" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_04" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_05" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_06" "retro_rocket")
        (effect_new_on_object_marker "effects\cinematics\05\hev_retro_rocket" "hev_close_07" "retro_rocket")
    )
)

(script dormant void c05_intro_dof_02
    (begin
        (rasterizer_profile_include_all)
        (sleep 218)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 1.0 1.0 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (rasterizer_profile_include_all)
        (sleep 88)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c05_intro_cinematic_light_02
    (begin
        (cinematic_lighting_set_primary_light 43.0 284.0 0.45 0.39 0.27)
        (cinematic_lighting_set_secondary_light 1.0 112.0 0.25 0.26 0.73)
        (cinematic_lighting_set_ambient_light 0.11 0.12 0.07)
        (object_uses_cinematic_lighting "hev_close_01" true)
        (object_uses_cinematic_lighting "hev_close_02" true)
        (object_uses_cinematic_lighting "hev_close_03" true)
        (object_uses_cinematic_lighting "hev_close_04" true)
        (object_uses_cinematic_lighting "hev_close_05" true)
        (object_uses_cinematic_lighting "hev_close_06" true)
        (object_uses_cinematic_lighting "hev_close_07" true)
        (object_uses_cinematic_lighting "hev_close_08" true)
        (object_uses_cinematic_lighting "grunt_01" true)
        (object_uses_cinematic_lighting "jackal_01" true)
        (object_uses_cinematic_lighting "intro_turret" true)
    )
)

(script dormant void jackal_shield_activate
    (begin
        (sleep 278)
        (print "jackal shield activate")
        (object_create_anew "jackal_shield")
        (objects_attach "jackal_01" "shield_light" "jackal_shield" "")
        (object_set_function_variable "jackal_01" "shield" 1.0 1.0)
    )
)

(script static void c05_intro_02_setup
    (begin
        (object_create_anew "hev_close_01")
        (object_create_anew "hev_close_02")
        (object_create_anew "hev_close_03")
        (object_create_anew "hev_close_04")
        (object_create_anew "hev_close_05")
        (object_create_anew "hev_close_06")
        (object_create_anew "hev_close_07")
        (object_create_anew "hev_close_08")
        (object_create_anew "grunt_01")
        (object_create_anew "jackal_01")
        (object_create_anew "intro_turret")
        (object_cinematic_lod "hev_close_01" true)
        (object_cinematic_lod "hev_close_02" true)
        (object_cinematic_lod "hev_close_03" true)
        (object_cinematic_lod "hev_close_04" true)
        (object_cinematic_lod "hev_close_05" true)
        (object_cinematic_lod "hev_close_06" true)
        (object_cinematic_lod "hev_close_07" true)
        (object_cinematic_lod "hev_close_08" true)
        (object_cinematic_lod "grunt_01" true)
        (object_cinematic_lod "jackal_01" true)
        (object_cinematic_lod "intro_turret" true)
        (object_set_function_variable "jackal_01" "shield" 0.0 0.0)
        (wake c05_intro_foley_02)
        (wake effect_retros_02)
        (wake effect_retros_03)
        (wake c05_intro_dof_02)
        (wake c05_intro_cinematic_light_02)
        (wake little_alien)
        (wake jackal_shield_activate)
    )
)

(script static void c05_intro_scene_02
    (begin
        (online_message_send)
        (05_intro_02_predict_stub)
        (sleep prediction_offset)
        (c05_intro_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_intro\05_intro" "05_intro_02" none "anchor_flag_intro")
        (custom_animation_relative "grunt_01" "objects\characters\grunt\05_intro\05_intro" "grunt_02" false "anchor_intro")
        (custom_animation_relative "jackal_01" "objects\characters\jackal\05_intro\05_intro" "jackal_02" false "anchor_intro")
        (custom_animation_relative "intro_turret" "objects\vehicles\c_turret_ap\05_intro\05_intro" "turret_02" false "anchor_intro")
        (scenery_animation_start_relative "hev_close_01" "objects\cinematics\human\hev\05_intro\05_intro" "hev01_02" "anchor_intro")
        (scenery_animation_start_relative "hev_close_02" "objects\cinematics\human\hev\05_intro\05_intro" "hev02_02" "anchor_intro")
        (scenery_animation_start_relative "hev_close_03" "objects\cinematics\human\hev\05_intro\05_intro" "hev03_02" "anchor_intro")
        (scenery_animation_start_relative "hev_close_04" "objects\cinematics\human\hev\05_intro\05_intro" "hev04_02" "anchor_intro")
        (scenery_animation_start_relative "hev_close_05" "objects\cinematics\human\hev\05_intro\05_intro" "hev05_02" "anchor_intro")
        (scenery_animation_start_relative "hev_close_06" "objects\cinematics\human\hev\05_intro\05_intro" "hev06_02" "anchor_intro")
        (scenery_animation_start_relative "hev_close_07" "objects\cinematics\human\hev\05_intro\05_intro" "hev07_02" "anchor_intro")
        (sleep 5)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (05_intro_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\05_deltahalo\c05_intro\foley\c05_intro_03_fol")
        (sleep (camera_set_pan))
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void c05_intro_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\05_deltahalo\c05_intro\foley\c05_intro_03_fol" none 1.0)
        (print "c05_intro foley 03 start")
    )
)

(script dormant void c05_1020_cor
    (begin
        (sleep 439)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_1020_cor" none 1.0)
        (attract_mode_set_seconds "c05_1020_cor" 2.5)
    )
)

(script dormant void c05_1030_cor
    (begin
        (sleep 552)
        (sound_impulse_start_effect "sound\dialog\levels\05_deltatemple\cinematics\c05_1030_cor" none 1.0)
        (attract_mode_set_seconds "c05_1030_cor" 1.0)
    )
)

(script dormant void effect_dust
    (begin
        (rasterizer_profile_include_all)
        (sleep 286)
        (effect_new "effects\cinematics\05\hev_land" "c05_intro_pod_01")
        (print "first pod")
        (sleep 42)
        (effect_new "effects\cinematics\05\hev_land" "c05_intro_pod_03")
        (print "second pod")
        (sleep 29)
        (effect_new "effects\cinematics\05\hev_land" "c05_intro_pod_02")
        (print "third pod")
    )
)

(script dormant void effect_hev_door_release
    (begin
        (sleep 390)
        (effect_new_on_object_marker "effects\cinematics\05\hev_door_release" "hev_close_06" "door_release")
        (print "effect - blow pins")
    )
)

(script dormant void intro_turret_fire
    (begin
        (object_create "turret_handheld")
        (objects_attach "intro_turret" "primary_trigger" "turret_handheld" "")
        (object_hide "turret_handheld" true)
        (sleep 131)
        (print "turret fire")
        (weapon_hold_trigger "turret_handheld" 0 true)
        (sleep 150)
        (weapon_hold_trigger "turret_handheld" 0 false)
    )
)

(script dormant void intro_turret_fire_02
    (begin
        (object_create "turret_handheld_02")
        (objects_attach "intro_turret_02" "primary_trigger" "turret_handheld_02" "")
        (object_hide "turret_handheld_02" true)
        (sleep 193)
        (print "turret_02 fire")
        (weapon_hold_trigger "turret_handheld_02" 0 true)
        (sleep 160)
        (weapon_hold_trigger "turret_handheld_02" 0 false)
    )
)

(script dormant void 05_intro_fov_03_1
    (begin
        (sleep 161)
        (print "fov switch")
        (camera_pan 70.0 0)
        (print "fov change: 60 -> 70 over 0 ticks")
    )
)

(script dormant void 05_intro_fov_03_2
    (begin
        (sleep 280)
        (print "fov switch")
        (camera_pan 60.0 0)
        (print "fov change: 70 -> 60 over 0 ticks")
    )
)

(script dormant void c05_intro_cinematic_light_03
    (begin
        (object_uses_cinematic_lighting "chief_intro" true)
        (object_uses_cinematic_lighting "smg_01" true)
        (object_uses_cinematic_lighting "rocket_01" true)
    )
)

(script dormant void late_pods
    (begin
        (sleep 280)
        (scenery_animation_start_relative "hev_close_06" "objects\cinematics\human\hev\05_intro\05_intro" "hev06_03" "anchor_intro")
        (scenery_animation_start_relative "hev_close_07" "objects\cinematics\human\hev\05_intro\05_intro" "hev07_03" "anchor_intro")
        (scenery_animation_start_relative "hev_close_08" "objects\cinematics\human\hev\05_intro\05_intro" "hev08_03" "anchor_intro")
    )
)

(script static void c05_intro_03_setup
    (begin
        (object_create_anew "chief_intro")
        (object_create_anew "rocket_01")
        (object_create_anew "smg_01")
        (object_create_anew "intro_turret_02")
        (object_cinematic_lod "chief_intro" true)
        (object_cinematic_lod "rocket_01" true)
        (object_cinematic_lod "smg_01" true)
        (object_cinematic_lod "intro_turret_02" true)
        (object_destroy "intro_crate_01")
        (object_destroy "intro_crate_02")
        (wake c05_1020_cor)
        (wake c05_1030_cor)
        (wake c05_intro_foley_03)
        (wake late_pods)
        (wake effect_dust)
        (wake effect_hev_door_release)
        (wake intro_turret_fire)
        (wake intro_turret_fire_02)
        (wake 05_intro_fov_03_1)
        (wake 05_intro_fov_03_2)
        (wake c05_intro_cinematic_light_03)
    )
)

(script static void c05_intro_03_cleanup
    (begin
        (object_destroy "chief_intro")
        (object_destroy "grunt_01")
        (object_destroy "jackal_01")
        (object_destroy_containing "turret")
        (object_destroy "rocket_01")
        (object_destroy "smg_01")
        (object_destroy_containing "hev_close")
        (object_create_anew "intro_crate_01")
        (object_create_anew "intro_crate_02")
    )
)

(script static void c05_intro_scene_03
    (begin
        (c05_intro_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\05_intro\05_intro" "05_intro_03" none "anchor_flag_intro")
        (custom_animation_relative "grunt_01" "objects\characters\grunt\05_intro\05_intro" "grunt_03" false "anchor_intro")
        (custom_animation_relative "jackal_01" "objects\characters\jackal\05_intro\05_intro" "jackal_03" false "anchor_intro")
        (custom_animation_relative "intro_turret" "objects\vehicles\c_turret_ap\05_intro\05_intro" "turret_03" false "anchor_intro")
        (custom_animation_relative "intro_turret_02" "objects\vehicles\c_turret_ap\05_intro\05_intro" "turret02_03" false "anchor_intro")
        (scenery_animation_start_relative "hev_close_01" "objects\cinematics\human\hev\05_intro\05_intro" "hev01_03" "anchor_intro")
        (scenery_animation_start_relative "hev_close_02" "objects\cinematics\human\hev\05_intro\05_intro" "hev02_03" "anchor_intro")
        (scenery_animation_start_relative "hev_close_03" "objects\cinematics\human\hev\05_intro\05_intro" "hev03_03" "anchor_intro")
        (scenery_animation_start_relative "hev_close_04" "objects\cinematics\human\hev\05_intro\05_intro" "hev04_03" "anchor_intro")
        (scenery_animation_start_relative "hev_close_05" "objects\cinematics\human\hev\05_intro\05_intro" "hev05_03" "anchor_intro")
        (scenery_animation_start_relative "smg_01" "objects\weapons\rifle\smg\05_intro\05_intro" "smg_03" "anchor_intro")
        (sleep 400)
        (custom_animation_relative "chief_intro" "objects\characters\masterchief\05_intro\05_intro" "chief_03" false "anchor_intro")
        (scenery_animation_start_relative "rocket_01" "objects\weapons\support_high\rocket_launcher\05_intro\05_intro" "rocket_03" "anchor_intro")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c05_intro_03_cleanup)
        (sleep 30)
        (predict_animation)
    )
)

(script static void c05_intro
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash bsp_x05)
        (sleep 1)
        (c05_intro_scene_01)
        (crash bsp_00)
        (sleep 1)
        (c05_intro_scene_02)
        (c05_intro_scene_03)
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

(script dormant void 05a_title0
    (begin
        (cinematic_fade_from_white_bars)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
        (game_save_no_timeout)
    )
)

(script dormant void 05a_title1
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

(script dormant void 05a_title2
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

(script dormant void objective_lz_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "clear the landing zone for the pelicans.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_lz_clear
    (begin
        (print "objective complete:")
        (print "clear the landing zone for the pelicans.")
        (update_remote_camera 0)
    )
)

(script dormant void objective_bridge_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "extend the bridge, and cross the chasm.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_bridge_clear
    (begin
        (print "objective complete:")
        (print "extend the bridge, and cross the chasm.")
        (update_remote_camera 1)
    )
)

(script dormant void objective_ruins_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "push through the covenant-held ruins.")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective_ruins_clear
    (begin
        (print "objective complete:")
        (print "push through the covenant-held ruins.")
        (update_remote_camera 2)
    )
)

(script dormant void objective_tower1_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "reach the towers in the lake.")
        (input_suppress_vibration 3)
    )
)

(script dormant void objective_tower1_clear
    (begin
        (print "objective complete:")
        (print "reach the towers in the lake.")
        (update_remote_camera 3)
    )
)

(script dormant void music_05a_01_start
    (begin
        (print "music 05a_01 start")
        (sound_looping_stop_immediately "scenarios\solo\05a_deltaapproach\05a_music\05a_01" none 1.0)
    )
)

(script dormant void music_05a_02_start
    (begin
        (print "music 05a_02 start")
        (sound_looping_stop_immediately "scenarios\solo\05a_deltaapproach\05a_music\05a_02" none 1.0)
    )
)

(script dormant void music_05a_02_stop
    (begin
        (print "music 05a_02 stop")
        (sound_looping_set_scale "scenarios\solo\05a_deltaapproach\05a_music\05a_02")
    )
)

(script dormant void music_05a_03_start
    (begin
        (print "music 05a_03 start")
        (sound_looping_stop_immediately "scenarios\solo\05a_deltaapproach\05a_music\05a_03" none 1.0)
    )
)

(script dormant void music_05a_03_stop
    (begin
        (print "music 05a_03 stop")
        (sound_looping_set_scale "scenarios\solo\05a_deltaapproach\05a_music\05a_03")
    )
)

(script dormant void music_05a_04_start
    (begin
        (print "music 05a_04 start")
        (sound_looping_stop_immediately "scenarios\solo\05a_deltaapproach\05a_music\05a_04" none 1.0)
    )
)

(script dormant void music_05a_04_start_alt
    (begin
        (print "music 05a_04 start alt")
        (sound_class_show_channel "scenarios\solo\05a_deltaapproach\05a_music\05a_04" true)
    )
)

(script dormant void music_05a_04_stop
    (begin
        (print "music 05a_04 stop")
        (sound_looping_set_scale "scenarios\solo\05a_deltaapproach\05a_music\05a_04")
    )
)

(script dormant void music_05a_05_start
    (begin
        (print "music 05a_05 start")
        (sound_looping_stop_immediately "scenarios\solo\05a_deltaapproach\05a_music\05a_05" none 1.0)
    )
)

(script dormant void music_05a_05_stop
    (begin
        (print "music 05a_05 stop")
        (sound_looping_set_scale "scenarios\solo\05a_deltaapproach\05a_music\05a_05")
    )
)

(script dormant void music_05a_06_start
    (begin
        (print "music 05a_06 start")
        (sound_looping_stop_immediately "scenarios\solo\05a_deltaapproach\05a_music\05a_06" none 1.0)
    )
)

(script dormant void kill_volumes
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (version) 0))
                (kill_volume_enable "kill_bsp00_lz")
                (kill_volume_enable "kill_bsp00_all")
                (kill_volume_disable "kill_bsp01_all")
                (kill_volume_disable "kill_approach_ramp")
                (sleep_until (= (version) 1))
                (kill_volume_enable "kill_bsp01_all")
                (kill_volume_enable "kill_approach_ramp")
                (kill_volume_disable "kill_bsp00_lz")
                (kill_volume_disable "kill_bsp00_all")
                false
            )
        )
    )
)

(script dormant void kill_stragglers
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_ai") straggler_no) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_ai") straggler_no)) 100.0)
                    ) 
                        (object_destroy (list_get (ai_actors "all_ai") straggler_no)))
                (set straggler_no (+ straggler_no 1.0))
                (if (> straggler_no 19) 
                    (set straggler_no 0))
                false
            )
        )
    )
)

(script dormant void lights
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_lights_on_01" (players)) true)
                        (= (volume_test_objects "vol_lights_on_02" (players)) true)
                        (= (volume_test_objects "vol_lights_on_03" (players)) true)
                        (= (volume_test_objects "vol_lights_on_04" (players)) true)
                        (= (volume_test_objects "vol_lights_on_05" (players)) true)
                        (= (volume_test_objects "vol_lights_on_06" (players)) true)
                    )
                )
                (game_save_unsafe true)
                (sleep_until 
                    (and
                        (= (volume_test_objects "vol_lights_on_01" (players)) false)
                        (= (volume_test_objects "vol_lights_on_02" (players)) false)
                        (= (volume_test_objects "vol_lights_on_03" (players)) false)
                        (= (volume_test_objects "vol_lights_on_04" (players)) false)
                        (= (volume_test_objects "vol_lights_on_05" (players)) false)
                        (= (volume_test_objects "vol_lights_on_06" (players)) false)
                    )
                )
                (game_save_unsafe false)
                false
            )
        )
    )
)

(script command_script void lz_phantom_01_crash
    (begin
        (cs_pause -1.0)
    )
)

(script static void lz_phantom_01_blows
    (begin
        (cs_run_command_script "lz_phantom_01/pilot" lz_phantom_01_crash)
        (begin_random
            (begin
                (effect_new_on_object_marker phantom_boom (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") "phantom_p")
                (sleep (random_range 10 60))
                (print ".")
            )
            (begin
                (effect_new_on_object_marker phantom_boom (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") "right_gun")
                (sleep (random_range 10 60))
                (print ".")
            )
            (begin
                (effect_new_on_object_marker phantom_boom (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") "left_gun")
                (sleep (random_range 10 60))
                (print ".")
            )
            (begin
                (effect_new_on_object_marker phantom_boom (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") "chin_gun")
                (sleep (random_range 10 60))
                (print ".")
            )
            (begin
                (effect_new_on_object_marker phantom_boom (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") "target_engine_left")
                (sleep (random_range 10 60))
                (print ".")
            )
            (begin
                (effect_new_on_object_marker phantom_boom (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") "target_engine_right")
                (sleep (random_range 10 60))
                (print ".")
            )
        )
    )
)

(script command_script void stay_shooting
    (begin
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script static void prep_return_from_intro
    (begin
        (if (difficulty_legendary) 
            (set lz_turret_count 4))
        (if (difficulty_heroic) 
            (set lz_turret_count 3))
        (if (difficulty_normal) 
            (set lz_turret_count 2))
        (ai_place "lz_turrets_01")
        (ai_set_blind "lz_turrets_01" true)
        (cs_run_command_script "lz_turrets_01" stay_shooting)
        (set lz_turret_count (- lz_turret_count 1.0))
        (begin_random
            (if (> lz_turret_count 0) 
                (begin
                    (ai_place "lz_turrets_02")
                    (ai_set_blind "lz_turrets_02" true)
                    (cs_run_command_script "lz_turrets_02" stay_shooting)
                    (set lz_turret_count (- lz_turret_count 1.0))
                )
            )
            (if (> lz_turret_count 0) 
                (begin
                    (ai_place "lz_turrets_03")
                    (ai_set_blind "lz_turrets_03" true)
                    (cs_run_command_script "lz_turrets_03" stay_shooting)
                    (set lz_turret_count (- lz_turret_count 1.0))
                )
            )
            (if (> lz_turret_count 0) 
                (begin
                    (ai_place "lz_turrets_04")
                    (ai_set_blind "lz_turrets_04" true)
                    (cs_run_command_script "lz_turrets_04" stay_shooting)
                    (set lz_turret_count (- lz_turret_count 1.0))
                )
            )
        )
        (if (difficulty_legendary) 
            (begin
                (ai_place "allies_lz_ledge" 2)
                (ai_place "lz_jackals_ridge" 1)
            )
        )
        (if (difficulty_heroic) 
            (begin
                (ai_place "allies_lz_ledge" 2)
                (ai_place "allies_lz_ridge" 1)
                (ai_place "lz_jackals_ridge" 1)
            )
        )
        (if (difficulty_normal) 
            (begin
                (ai_place "allies_lz_ledge" 2)
                (ai_place "allies_lz_ridge" 1)
                (ai_place "lz_jackals_ridge" 1)
            )
        )
        (object_teleport (player0) "lz_start_player0")
        (object_teleport (player1) "lz_start_player1")
    )
)

(script dormant void lz_pelican_wait
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_lz_all" (players)) false)
                (> (player_count) 0)
            )
        )
        (if 
            (and
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) false)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'let's wait for our warthog. unless you really want to walk...'")
                    (sleep (ai_play_line_on_object none "0370"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script command_script void drive_to_overlook_01
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to overlook/p2)
        (cs_go_to overlook/p3)
        (cs_go_to overlook/p6)
        (cs_go_to overlook/p7)
        (cs_go_to overlook/p4)
        (cs_go_to overlook/p5)
        (cs_go_to overlook/p1)
    )
)

(script command_script void drive_to_overlook_02
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to overlook/p2)
        (cs_go_to overlook/p3)
        (cs_go_to overlook/p6)
        (cs_go_to overlook/p7)
        (cs_go_to overlook/p4)
        (cs_go_to overlook/p5)
        (cs_go_to overlook/p0)
    )
)

(script command_script void lz_pelican_sighted
    (begin
        (set ride_ally_comment_go true)
        (cs_switch "lz_odst")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "odst: 'here comes our ride!'")
        (cs_play_line "0380")
    )
)

(script command_script void lz_saddle_up
    (begin
        (cs_switch "lz_ally")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "ally: 'saddle-up!  we're moving out!'")
        (cs_play_line "0050")
    )
)

(script dormant void lz_pelican_timer
    (begin
        (sleep 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot"))
        (object_destroy (ai_vehicle_get_from_starting_location "lz_pelican_02/pilot"))
    )
)

(script command_script void lz_pelican_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_vehicle_boost true)
        (cs_fly_by lz_pelicans/pel_a_09 20.0)
        (cs_fly_by lz_pelicans/pel_a_08 20.0)
        (cs_fly_by lz_pelicans/pel_a_07 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by lz_pelicans/pel_a_06 20.0)
        (set lz_pelican_in_sight true)
        (cs_vehicle_speed 0.5)
        (cs_fly_to lz_pelicans/pel_a_04 5.0)
        (cs_fly_to_and_face lz_pelicans/pel_a_04 lz_pelicans/p0 1.0)
        (cs_fly_to lz_pelicans/pel_a_05 1.0)
        (ai_set_orders "lz_allies" "allies_lz_hogs")
        (sleep_until 
            (and
                (= (volume_test_objects "vol_lz_warthog" (players)) false)
                (= (volume_test_objects "vol_lz_warthog" (ai_actors "all_allies")) false)
                (> (player_count) 0)
            )
        )
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot") pelican_lc)
        (sleep 45)
        (wake music_05a_02_start)
        (wake lz_pelican_timer)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot") pelican_p)
        (sleep_until (< (ai_living_count "lz_pelican_01") 4))
        (set lz_pelican_arrived true)
        (cs_fly_to lz_pelicans/pel_a_04 1.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by lz_pelicans/pel_a_06 3.0)
        (cs_fly_by lz_pelicans/pel_a_07 20.0)
        (cs_vehicle_boost true)
        (cs_fly_by lz_pelicans/pel_a_09 20.0)
        (cs_fly_to lz_pelicans/pel_a_10 20.0)
        (ai_erase "lz_pelican_01")
    )
)

(script command_script void other_lz_pelican
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_vehicle_boost true)
        (cs_fly_by lz_pelicans/pel_b_07 20.0)
        (cs_fly_by lz_pelicans/pel_b_06 20.0)
        (cs_fly_by lz_pelicans/pel_b_05 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by lz_pelicans/pel_b_04 10.0)
        (cs_vehicle_speed 0.5)
        (cs_face true lz_pelicans/pel_a_05)
        (sleep_until 
            (begin
                (if (= lz_pelican_arrived false) 
                    (cs_fly_by lz_pelicans/pel_b_02 3.0))
                (if (= lz_pelican_arrived false) 
                    (cs_fly_by lz_pelicans/pel_b_03 3.0))
                (= lz_pelican_arrived true)
            )
        )
        (cs_face false lz_pelicans/pel_a_05)
        (cs_fly_by lz_pelicans/pel_b_05 20.0)
        (cs_vehicle_speed 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by lz_pelicans/pel_b_07 40.0)
        (cs_fly_to lz_pelicans/pel_b_08 30.0)
        (ai_erase "lz_pelican_02")
    )
)

(script dormant void lz_pelican
    (begin
        (ai_place "lz_pelican_02")
        (cs_run_command_script "lz_pelican_02/pilot" other_lz_pelican)
        (sleep 120)
        (ai_place "allies_lz_pelican" (- 2.0 (ai_living_count "all_allies")))
        (ai_place "lz_pelican_01")
        (ai_place "lz_warthog_01")
        (object_cannot_take_damage (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot") pelican_p (ai_actors "allies_lz_pelican"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot") pelican_lc (ai_vehicle_get_from_starting_location "lz_warthog_01/driver"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot") true)
        (cs_run_command_script "lz_pelican_01/pilot" lz_pelican_arrives)
        (ai_set_orders "lz_allies" "allies_lz_all")
        (sleep_until (= lz_pelican_in_sight true))
        (if (= lz_pelican_arrived false) 
            (begin
                (sleep_until 
                    (or
                        (ai_scene "lz_pelican_sighted_scene" lz_pelican_sighted "lz_allies")
                        (and
                            (< (ai_living_count "allies_lz_ledge") 1)
                            (< (ai_living_count "allies_lz_ridge") 1)
                        )
                    ) 
                30 150)
                (sleep 150)
                (if (= ride_ally_comment_go false) 
                    (begin
                        (ai_dialogue_enable false)
                        (sleep 60)
                        (print "cortana: 'here comes our ride!'")
                        (sleep (ai_play_line_on_object none "2020"))
                        (sleep 30)
                        (ai_dialogue_enable true)
                    )
                )
            )
        )
        (sleep 240)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "johnson: 'i got a good view coming in.'")
        (print "'there's a big building in the middle of this island's lake.'")
        (sleep (ai_play_line_on_object none "0020"))
        (sleep 30)
        (print "cortana: 'i saw it too.  it looked like a temple.")
        (sleep (ai_play_line_on_object none "0030"))
        (sleep 15)
        (print "if i were a megalomaniac - and i'm not - that's where i'd be.")
        (sleep (ai_play_line_on_object none "0040"))
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep_until (= lz_pelican_arrived true))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") true)
        (ai_set_orders "lz_allies" "allies_lz_hogs")
        (ai_scene "lz_saddle_up_scene" lz_saddle_up "all_allies")
        (sleep_until 
            (or
                (and
                    (= (volume_test_objects "vol_lz_all" (players)) false)
                    (> (player_count) 0)
                )
                (and
                    (or
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0))
                    )
                    (or
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1))
                        (= (game_can_use_flashlights) false)
                    )
                )
            )
        )
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") false)
        (game_save_no_timeout)
        (ai_enter_squad_vehicles "all_allies")
        (set lz_mounted_up true)
    )
)

(script static void short_lz_pel
    (begin
        (ai_place "lz_pelican_02")
        (cs_run_command_script "lz_pelican_02/pilot" other_lz_pelican)
        (sleep 120)
        (ai_place "allies_lz_pelican" (- 4.0 (ai_living_count "all_allies")))
        (ai_place "lz_pelican_01")
        (ai_place "lz_warthog_01")
        (object_cannot_take_damage (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot") pelican_p (ai_actors "allies_lz_pelican"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_pelican_01/pilot") pelican_lc (ai_vehicle_get_from_starting_location "lz_warthog_01/driver"))
        (cs_run_command_script "lz_pelican_01/pilot" lz_pelican_arrives)
        (sleep_until (> (ai_living_count "lz_enemies_all") 1))
        (ai_set_orders "lz_allies" "allies_lz_all")
        (sleep_until (= lz_pelican_in_sight true))
        (if (= lz_pelican_arrived false) 
            (begin
                (sleep_until 
                    (or
                        (ai_scene "lz_pelican_sighted_scene" lz_pelican_sighted "lz_allies")
                        (and
                            (< (ai_living_count "allies_lz_ledge") 1)
                            (< (ai_living_count "allies_lz_ridge") 1)
                        )
                    ) 
                30 150)
                (sleep 150)
                (if (= ride_ally_comment_go false) 
                    (begin
                        (ai_dialogue_enable false)
                        (sleep 60)
                        (print "cortana: 'here comes our ride!'")
                        (sleep (ai_play_line_on_object none "2020"))
                        (sleep 30)
                        (ai_dialogue_enable true)
                    )
                )
            )
        )
        (sleep 240)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "johnson: 'i got a good view coming in.'")
        (print "'there's a big building in the middle of this island's lake.'")
        (sleep (ai_play_line_on_object none "0020"))
        (sleep 30)
        (print "cortana: 'i saw it too.  it looked like a temple.")
        (sleep (ai_play_line_on_object none "0030"))
        (sleep 15)
        (print "if i were a megalomaniac - and i'm not - that's where i'd be.")
        (sleep (ai_play_line_on_object none "0040"))
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep_until (= lz_pelican_arrived true))
        (ai_set_orders "lz_allies" "allies_lz_hogs")
        (ai_scene "lz_saddle_up_scene" lz_saddle_up "all_allies")
        (ai_enter_squad_vehicles "all_allies")
        (sleep_until (> (ai_living_count "lz_warthog_01") 1))
        (ai_set_orders "lz_warthog_01" "allies_overlook_pause")
    )
)

(script dormant void lz_turret_reminder
    (begin
        (sleep_until (< (ai_living_count "lz_enemies_turrets") 1) 30 8000)
        (if (> (ai_living_count "lz_enemies_turrets") 0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'those turrets will tear the pelicans to shreds! take them out!'")
                (sleep (ai_play_line_on_object none "0310"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
        (sleep_until (< (ai_living_count "lz_enemies_turrets") 1) 30 8000)
        (if (> (ai_living_count "lz_enemies_turrets") 0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'take out those turrets, chief!'")
                (sleep (ai_play_line_on_object none "2010"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
    )
)

(script command_script void odst_warning
    (begin
        (cs_switch "lz_odst")
        (cs_start_approach_player 2.0 10.0 10.0)
        (cs_abort_on_damage true)
        (print "odst: 'sir! we gotta neutralize those turrets!'")
        (cs_play_line "0300")
    )
)

(script command_script void odst_turrets_down
    (begin
        (cs_switch "lz_odst")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "odst: 'clear this lz! the pelicans are right behind us!'")
        (cs_play_line "0010")
    )
)

(script dormant void lz_turret_track
    (begin
        (sleep_until (< (ai_living_count "lz_enemies_turrets") 1))
        (print "all turrets down")
        (set turrets_down true)
        (sleep_until 
            (or
                (ai_scene "lz_turrets_down_scene" odst_turrets_down "all_allies")
                (< (ai_living_count "all_allies") 1)
            ) 
        30 600)
    )
)

(script dormant void lz_phantom_01_drop
    (begin
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") true)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a03)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_b01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_b02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_b03)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_c01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_c02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_c03)
        (ai_set_orders "lz_elites_phantom_01" "lz_enemies_phantom_01")
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") false)
    )
)

(script command_script void lz_phantom_arrives_01
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by lz_airspace/ph0a)
        (cs_fly_by lz_airspace/ph1a)
        (cs_fly_by lz_airspace/ph2a)
        (cs_vehicle_speed 0.3)
        (cs_fly_to lz_airspace/pel6 2.0)
        (cs_fly_to_and_face lz_airspace/pel6 lz_airspace/p0 1.0)
        (wake lz_phantom_01_drop)
        (cs_fly_to_and_face lz_airspace/ph3a lz_airspace/p0 1.0)
        (sleep_until (< (ai_living_count "lz_phantom_01") 2) 30 900)
        (set lz_phantom_01_leaving true)
        (cs_fly_by lz_airspace/ph2a)
        (cs_vehicle_speed 0.5)
        (cs_fly_by lz_airspace/ph1a)
        (cs_fly_by lz_airspace/ph0a)
        (cs_fly_to lz_airspace/phxa)
        (ai_erase "lz_phantom_01")
    )
)

(script dormant void lz_phantom_02_drop
    (begin
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") true)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_a01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_a02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_a03)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_b01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_b02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_b03)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_c01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_c02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_c03)
        (ai_set_orders "lz_elites_phantom_02" "lz_enemies_phantom_02")
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") false)
    )
)

(script command_script void lz_phantom_arrives_02
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by lz_airspace/ph0b)
        (cs_fly_by lz_airspace/ph1b)
        (cs_fly_by lz_airspace/ph2b)
        (cs_vehicle_speed 0.3)
        (cs_fly_to lz_airspace/pel6 2.0)
        (cs_fly_to_and_face lz_airspace/pel6 lz_airspace/p1 1.0)
        (wake lz_phantom_02_drop)
        (cs_fly_to_and_face lz_airspace/ph3b lz_airspace/p1 2.0)
        (sleep_until (< (ai_living_count "lz_phantom_02") 2) 30 900)
        (cs_fly_by lz_airspace/ph2b)
        (cs_vehicle_speed 0.5)
        (cs_fly_by lz_airspace/ph1b)
        (cs_fly_by lz_airspace/ph0b)
        (cs_fly_to lz_airspace/phxb)
        (ai_erase "lz_phantom_02")
        (set lz_phantom_02_leaving true)
    )
)

(script command_script void lz_phantom_arrives_03
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by lz_airspace/ph0a)
        (cs_fly_by lz_airspace/ph1a)
        (cs_fly_by lz_airspace/ph2a)
        (cs_vehicle_speed 0.3)
        (cs_fly_to lz_airspace/ph3a 2.0)
        (cs_fly_to_and_face lz_airspace/ph3a lz_airspace/p0 1.0)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") true)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a03)
        (sleep_until (< (ai_living_count "lz_phantom_01") 2) 30 900)
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") false)
        (ai_set_active_camo "lz_stealth_phantom_03" true)
        (cs_fly_by lz_airspace/ph2a)
        (cs_vehicle_speed 0.5)
        (cs_fly_by lz_airspace/ph1a)
        (cs_fly_by lz_airspace/ph0a)
        (cs_fly_to lz_airspace/phxa)
        (ai_erase "lz_phantom_01")
        (set lz_phantom_03_leaving true)
    )
)

(script static void lz_phantom_01_start
    (begin
        (ai_place "lz_phantom_01")
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_elites_phantom_01" 2)
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_jackals_phantom_01" (random_range 2 4))
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_grunts_phantom_01" (- 6.0 (ai_living_count "lz_jackals_phantom_01")))
            )
        )
        (sleep 15)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_c (ai_actors "lz_elites_phantom_01"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p (ai_actors "lz_grunts_phantom_01"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p (ai_actors "lz_jackals_phantom_01"))
        (sleep 15)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") true)
        (cs_run_command_script "lz_phantom_01/pilot" lz_phantom_arrives_01)
        (sleep 210)
        (print "saving")
        (game_save_no_timeout)
        (sleep_until (< (ai_living_count "lz_phantom_01") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot"))
    )
)

(script static void lz_phantom_02_start
    (begin
        (ai_place "lz_phantom_02")
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_elites_phantom_02" 2)
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_jackals_phantom_02" (random_range 2 4))
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_grunts_phantom_02" (- 6.0 (ai_living_count "lz_jackals_phantom_02")))
            )
        )
        (sleep 15)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_c (ai_actors "lz_elites_phantom_02"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p (ai_actors "lz_jackals_phantom_02"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p (ai_actors "lz_grunts_phantom_02"))
        (sleep 15)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") true)
        (cs_run_command_script "lz_phantom_02/pilot" lz_phantom_arrives_02)
        (sleep 150)
        (print "saving")
        (game_save_no_timeout)
        (sleep_until (< (ai_living_count "lz_phantom_02") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot"))
    )
)

(script static void lz_phantom_03_start
    (begin
        (ai_place "lz_phantom_01")
        (ai_place "lz_stealth_phantom_03" 3)
        (sleep 15)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a01 (ai_actors "lz_stealth_phantom_03/1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a02 (ai_actors "lz_stealth_phantom_03/2"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") phantom_p_a03 (ai_actors "lz_stealth_phantom_03/3"))
        (sleep 15)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot") true)
        (cs_run_command_script "lz_phantom_01/pilot" lz_phantom_arrives_03)
        (sleep 210)
        (print "saving")
        (game_save_no_timeout)
        (sleep_until (< (ai_living_count "lz_phantom_01") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "lz_phantom_01/pilot"))
    )
)

(script static void short_lz_ph_02
    (begin
        (ai_allegiance prophet covenant)
        (ai_place "lz_phantom_02")
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_elites_phantom_02" 2)
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_jackals_phantom_02" (random_range 2 4))
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_grunts_phantom_02" (- 7.0 (ai_living_count "lz_jackals_phantom_02")))
            )
        )
        (sleep 15)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p_c (ai_actors "lz_elites_phantom_02"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p (ai_actors "lz_jackals_phantom_02"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") phantom_p (ai_actors "lz_grunts_phantom_02"))
        (sleep 15)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_phantom_02/pilot") true)
        (cs_run_command_script "lz_phantom_02/pilot" lz_phantom_arrives_02)
    )
)

(script dormant void lz_start
    (begin
        (data_mine_insert "05a_1_landing_zone")
        (game_save_no_timeout)
        (wake lz_turret_track)
        (wake lz_turret_reminder)
        (sleep 5)
        (ai_scene "lz_intro_inform_scene" odst_warning "allies_lz_ledge")
        (sleep 120)
        (ai_place "lz_grunts_ledge" 3)
        (ai_set_blind "lz_turrets_01" false)
        (ai_set_blind "lz_turrets_02" false)
        (ai_set_blind "lz_turrets_03" false)
        (ai_set_blind "lz_turrets_04" false)
        (sleep_until 
            (or
                (and
                    (= (volume_test_objects "vol_entry_ledge" (players)) false)
                    (> (player_count) 0)
                )
                (< (ai_living_count "lz_enemies_all") 3)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_jackals_ridge" (- 2.0 (ai_living_count "lz_jackals_ridge")))
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_grunts_ridge" (- 3.0 (ai_living_count "lz_grunts_ledge")))
            )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_lz_leaving_ridge" (players)) true)
                (< (ai_living_count "lz_enemies_all") 1)
            )
        )
        (ai_place "lz_jackals_structure" 1)
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_elites_yard" 2)
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_jackals_yard" (- 2.0 (ai_living_count "lz_jackals_ridge")))
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_grunts_yard" (- 3.0 (+ (ai_living_count "lz_grunts_ledge") (ai_living_count "lz_grunts_ridge"))))
            )
        )
        (game_save_no_timeout)
        (sleep 30)
        (wake music_05a_01_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_lz_in_yard_01" (players)) true)
                (< (ai_living_count "lz_enemies_all") 3)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_elites_structure" (- 2.0 (ai_living_count "lz_elites_yard")))
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_grunts_structure" (- 5.0 (ai_living_count "lz_enemies_yard")))
            )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_lz_in_yard_02" (players)) true)
                (< (ai_living_count "lz_enemies_all") 3)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_elites_bunkered" (- 2.0 (+ (ai_living_count "lz_elites_yard") (ai_living_count "lz_elites_structure"))))
            )
        )
        (if (< (ai_living_count "lz_enemies_all") 11) 
            (begin
                (ai_place "lz_grunts_bunkered" (- 5.0 (ai_living_count "lz_enemies_structure")))
            )
        )
        (sleep_until 
            (and
                (= turrets_down true)
                (< (ai_living_count "lz_enemies_all") 1)
            ) 
        30 1800)
        (sleep_until (= (ai_trigger_test "done_fighting" "lz_enemies_all") true))
        (sleep 90)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'artillery disabled, sergeant! landing zone secure…for the moment.'")
        (sleep (ai_play_line_on_object none "0320"))
        (sleep 30)
        (print "johnson: 'i hear ya. starting our approach. hang tight.'")
        (sleep (ai_play_line_on_object none "0330"))
        (sleep 60)
        (print "cortana: 'easier said than done…inbound phantoms, chief!'")
        (sleep (ai_play_line_on_object none "0340"))
        (sleep 30)
        (ai_dialogue_enable true)
        (lz_phantom_01_start)
        (sleep_until (< (ai_living_count "lz_enemies_all") 1) 30 8000)
        (sleep_until (= (ai_trigger_test "done_fighting" "lz_enemies_all") true))
        (if (difficulty_legendary) 
            (begin
                (sleep 60)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'another phantom! on approach!'")
                (sleep (ai_play_line_on_object none "0350"))
                (sleep 30)
                (ai_dialogue_enable true)
                (lz_phantom_02_start)
                (sleep_until (< (ai_living_count "lz_enemies_all") 1) 30 8000)
                (sleep_until (= (ai_trigger_test "done_fighting" "lz_enemies_all") true))
                (lz_phantom_03_start)
                (sleep_until (< (ai_living_count "lz_enemies_all") 1) 30 4000)
                (sleep_until (= (ai_trigger_test "done_fighting" "lz_enemies_all") true))
                (wake lz_pelican)
                (wake objective_lz_clear)
            ) (begin
                (sleep 60)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'another phantom! on approach!'")
                (sleep (ai_play_line_on_object none "0350"))
                (sleep 30)
                (ai_dialogue_enable true)
                (lz_phantom_02_start)
                (sleep_until (< (ai_living_count "lz_enemies_all") 1) 30 8000)
                (sleep_until (= (ai_trigger_test "done_fighting" "lz_enemies_all") true))
                (wake lz_pelican)
                (wake objective_lz_clear)
            )
        )
        (sleep 90)
        (if (= lz_pelican_in_sight false) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'hold here until the pelican arrives, chief.'")
                (sleep (ai_play_line_on_object none "0360"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
        (game_save_no_timeout)
        (wake lz_pelican_wait)
    )
)

(script dormant void overlook_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_bridge_all" (players)) true) 30 5400)
        (if 
            (and
                (= (volume_test_objects "vol_bridge_all" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'let's get moving before we're spotted, alright?'")
                    (sleep (ai_play_line_on_object none "0430"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script command_script void overlook_remark
    (begin
        (cs_switch "overlook_ally")
        (cs_abort_on_damage true)
        (print "ally: 'whoa…'")
        (cs_play_line "0390")
        (sleep 30)
        (print "ally: 'it's like a postcard.'")
        (cs_play_line "0400")
        (sleep 30)
        (print "ally: 'dear, sarge: kicking ass in outer space. wish you were here.'")
        (cs_play_line "0410")
        (sleep 30)
        (print "johnson: 'i heard that, jackass.'")
        (sleep (ai_play_line_on_object none "0420"))
    )
)

(script command_script void overlook_wander1
    (begin
        (cs_abort_on_alert true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to overlook/jack01)
                        (cs_face true overlook/jack_look)
                        (sleep (random_range 30 90))
                        (cs_face false overlook/jack_look)
                    )
                    (begin
                        (cs_go_to overlook/jack02)
                        (cs_face true overlook/jack_look)
                        (sleep (random_range 30 90))
                        (cs_face false overlook/jack_look)
                    )
                    (begin
                        (cs_go_to overlook/jack06)
                        (cs_face true overlook/jack05)
                        (sleep (random_range 30 90))
                        (cs_face false overlook/jack05)
                    )
                )
                false
            )
        )
    )
)

(script command_script void overlook_wander2
    (begin
        (cs_abort_on_alert true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to overlook/jack03)
                        (cs_face true overlook/jack_look)
                        (sleep (random_range 30 90))
                        (cs_face false overlook/jack_look)
                    )
                    (begin
                        (cs_go_to overlook/jack04)
                        (cs_face true overlook/jack_look2)
                        (sleep (random_range 30 90))
                        (cs_face false overlook/jack_look2)
                    )
                    (begin
                        (cs_go_to overlook/jack05)
                        (cs_face true overlook/jack06)
                        (sleep (random_range 30 90))
                        (cs_face false overlook/jack06)
                    )
                )
                false
            )
        )
    )
)

(script dormant void overlook_start
    (begin
        (ai_disposable "lz_enemies_all" true)
        (data_mine_insert "05a_2_overlook")
        (wake overlook_reminder)
        (game_save_no_timeout)
        (ai_place "overlook_jackals_01" 2)
        (if (difficulty_legendary) 
            (ai_place "overlook_jackals_02" 2))
        (if (difficulty_heroic) 
            (ai_place "overlook_jackals_02" 1))
        (sleep_until (= (volume_test_objects "vol_overlook_pause" (players)) true))
        (sleep_until 
            (or
                (< (ai_living_count "overlook_jackals") 1)
                (= (volume_test_objects "vol_bridge_all" (players)) true)
            )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bridge_all" (players)) true)
                (ai_scene "overlook_remark_scene" overlook_remark "all_allies")
                (< (ai_living_count "all_allies") 1)
            ) 
        30 300)
    )
)

(script dormant void bridge_cortana_comment
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'the covenant has control of the bridge ahead.'")
        (sleep (ai_play_line_on_object none "0440"))
        (sleep 15)
        (print "'they're going to try and bottle us up on this side of the gorge!'")
        (sleep (ai_play_line_on_object none "0450"))
        (sleep 30)
        (game_save_no_timeout)
        (sleep_until (= (volume_test_objects "vol_bridge_near_bunker" (players)) true))
        (print "cortana: 'the controls to extend the bridge should be in this structure!'")
        (sleep (ai_play_line_on_object none "0460"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void bridge_wraith_warn
    (begin
        (set wraith_warning_go true)
        (cs_switch "bridge_ally")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "ally: 'watch out, chief!  wraiths on the far side!'")
        (cs_play_line "0480")
    )
)

(script dormant void bridge_wraith_warning
    (begin
        (sleep 300)
        (sleep_until 
            (or
                (ai_scene "bridge_wraith_warn_scene" bridge_wraith_warn "all_allies")
                (< (ai_living_count "all_allies") 1)
            ) 
        30 150)
        (sleep 30)
        (if (= wraith_warning_go false) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'watch out, chief!  wraiths on the far side!'")
                (sleep (ai_play_line_on_object none "2030"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
    )
)

(script command_script void bridge_phantom_01a
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by bridge_airspace/ph0 10.0)
        (cs_fly_by bridge_airspace/ph1 10.0)
        (cs_vehicle_boost false)
        (cs_vehicle_speed 0.5)
        (cs_fly_to bridge_airspace/pel5 1.0)
        (cs_fly_to bridge_airspace/ph2 1.0)
        (vehicle_unload (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") phantom_lc)
        (sleep_until (< (ai_living_count "bridge_phantom_01") 2))
        (cs_fly_to_and_face bridge_airspace/pel5 bridge_airspace/ph1 2.0)
        (cs_vehicle_speed 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by bridge_airspace/ph1 10.0)
        (cs_fly_by bridge_airspace/ph0 10.0)
        (cs_vehicle_boost false)
        (cs_fly_to bridge_airspace/phx 20.0)
        (ai_erase "bridge_phantom_01")
    )
)

(script command_script void bridge_phantom_01b
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by bridge_airspace/ph0 10.0)
        (cs_fly_by bridge_airspace/ph1too 10.0)
        (cs_vehicle_boost false)
        (cs_vehicle_speed 0.5)
        (cs_fly_to bridge_airspace/ph3 1.0)
        (cs_fly_to bridge_airspace/ph4 1.0)
        (vehicle_unload (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") phantom_lc)
        (sleep_until (< (ai_living_count "bridge_phantom_01") 2))
        (cs_fly_to_and_face bridge_airspace/ph3 bridge_airspace/ph1 2.0)
        (cs_vehicle_speed 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by bridge_airspace/ph1too 10.0)
        (cs_fly_by bridge_airspace/ph0 10.0)
        (cs_vehicle_boost false)
        (cs_fly_to bridge_airspace/phx 20.0)
        (ai_erase "bridge_phantom_01")
    )
)

(script command_script void bridge_phantom_02a
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by bridge_airspace/pel0 10.0)
        (cs_fly_by bridge_airspace/pel1 10.0)
        (cs_fly_by bridge_airspace/pel2 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by bridge_airspace/pel4 5.0)
        (cs_fly_to bridge_airspace/pel5 1.0)
        (cs_fly_to bridge_airspace/ph2 1.0)
        (vehicle_unload (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") phantom_lc)
        (sleep_until (< (ai_living_count "bridge_phantom_02") 2))
        (cs_fly_to_and_face bridge_airspace/pel5 bridge_airspace/pel4 2.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by bridge_airspace/pel4 5.0)
        (cs_fly_by bridge_airspace/pel3 5.0)
        (cs_fly_by bridge_airspace/pel2 5.0)
        (cs_fly_by bridge_airspace/pel1 5.0)
        (cs_fly_by bridge_airspace/pel0 5.0)
        (cs_fly_by bridge_airspace/pelx 5.0)
        (ai_erase "bridge_phantom_02")
    )
)

(script command_script void bridge_phantom_02b
    (begin
        (cs_vehicle_boost true)
        (cs_fly_by bridge_airspace/pel0 10.0)
        (cs_fly_by bridge_airspace/pel1 10.0)
        (cs_fly_by bridge_airspace/pel2 20.0)
        (cs_vehicle_boost false)
        (cs_fly_to bridge_airspace/ph3 1.0)
        (cs_fly_to bridge_airspace/ph4 1.0)
        (vehicle_unload (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") phantom_lc)
        (sleep_until (< (ai_living_count "bridge_phantom_02") 2))
        (cs_fly_to_and_face bridge_airspace/ph3 bridge_airspace/pel2 2.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by bridge_airspace/pel3 5.0)
        (cs_fly_by bridge_airspace/pel2 5.0)
        (cs_fly_by bridge_airspace/pel1 5.0)
        (cs_fly_by bridge_airspace/pel0 5.0)
        (cs_fly_by bridge_airspace/pelx 5.0)
        (ai_erase "bridge_phantom_02")
    )
)

(script static void bridge_phantom_reinforce_01a
    (begin
        (ai_place "bridge_phantom_01")
        (ai_place "bridge_phantom_ghosts_02")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/2"))
        (sleep 60)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") true)
        (cs_run_command_script "bridge_phantom_01/pilot" bridge_phantom_01a)
        (sleep_until (< (ai_living_count "bridge_phantom_01") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot"))
    )
)

(script static void bridge_phantom_reinforce_01b
    (begin
        (ai_place "bridge_phantom_01")
        (ai_place "bridge_phantom_ghosts_01")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_01/1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_01/2"))
        (sleep 60)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot") true)
        (cs_run_command_script "bridge_phantom_01/pilot" bridge_phantom_01b)
        (sleep_until (< (ai_living_count "bridge_phantom_01") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot"))
    )
)

(script static void bridge_phantom_reinforce_02a
    (begin
        (ai_place "bridge_phantom_02")
        (ai_place "bridge_phantom_ghosts_02")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/2"))
        (sleep 60)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") true)
        (cs_run_command_script "bridge_phantom_02/pilot" bridge_phantom_02a)
        (sleep_until (< (ai_living_count "bridge_phantom_01") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot"))
    )
)

(script static void bridge_phantom_reinforce_02b
    (begin
        (ai_place "bridge_phantom_02")
        (ai_place "bridge_phantom_ghosts_02")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") phantom_lc (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/2"))
        (sleep 60)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_phantom_02/pilot") true)
        (cs_run_command_script "bridge_phantom_02/pilot" bridge_phantom_02b)
        (sleep_until (< (ai_living_count "bridge_phantom_01") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "bridge_phantom_01/pilot"))
    )
)

(script command_script void bridge_ghostman_r
    (begin
        (cs_abort_on_alert true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to bridge/b1)
                        (sleep (random_range 30 90))
                    )
                    (begin
                        (cs_go_to bridge/b2)
                        (sleep (random_range 30 90))
                    )
                    (begin
                        (cs_go_to bridge/b3)
                        (sleep (random_range 30 90))
                    )
                    (begin
                        (cs_go_to bridge/b4)
                        (sleep (random_range 30 90))
                    )
                    (begin
                        (cs_go_to bridge/b5)
                        (sleep (random_range 30 90))
                    )
                )
                (> (ai_combat_status ai_current_actor) ai_combat_status_idle)
            )
        )
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to bridge/r)
        (sleep 5)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/r") false)
        (sleep 5)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/r"))
    )
)

(script command_script void bridge_ghostman_l
    (begin
        (cs_abort_on_alert true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_go_to bridge/a1)
                        (sleep (random_range 30 90))
                    )
                    (begin
                        (cs_go_to bridge/a2)
                        (sleep (random_range 30 90))
                    )
                    (begin
                        (cs_go_to bridge/a3)
                        (sleep (random_range 30 90))
                    )
                    (begin
                        (cs_go_to bridge/a4)
                        (sleep (random_range 30 90))
                    )
                )
                (> (ai_combat_status ai_current_actor) ai_combat_status_idle)
            )
        )
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to bridge/l)
        (sleep 5)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/l") false)
        (sleep 5)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/l"))
    )
)

(script dormant void bridge_ghosts_by_phantom
    (begin
        (if (difficulty_heroic) 
            (set bridge_vehicles_total 2))
        (if (difficulty_legendary) 
            (set bridge_vehicles_total 3))
        (sleep_until (> (ai_combat_status "bridge_enemies_bunker") ai_combat_status_idle))
        (sleep_until (< (ai_living_count "bridge_ghost_elites") 1) 30 300)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/l") false)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/r") false)
        (sleep_until (> (ai_living_count "bridge_vehicles_all") 0) 30 450)
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (< (ai_living_count "bridge_vehicles_all") 1)
                        (= (volume_test_objects "vol_bridge_ghost_spawn" (players)) true)
                        (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true)
                    )
                )
                (if 
                    (or
                        (= (volume_test_objects "vol_bridge_ghost_spawn" (players)) true)
                        (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true)
                    ) 
                        (sleep_forever))
                (if (> bridge_vehicles_total 0) 
                    (begin
                        (game_save_no_timeout)
                        (ai_place "bridge_phantom_ghosts_01" 1)
                    )
                )
                (sleep (random_range 60 120))
                (if 
                    (or
                        (= (volume_test_objects "vol_bridge_ghost_spawn" (players)) true)
                        (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true)
                    ) 
                        (sleep_forever))
                (if (> bridge_vehicles_total 0) 
                    (begin
                        (game_save_no_timeout)
                        (ai_place "bridge_phantom_ghosts_01" 1)
                    )
                )
                (set bridge_vehicles_total (- bridge_vehicles_total 1.0))
                (or
                    (<= bridge_vehicles_total 0)
                    (= (volume_test_objects "vol_bridge_ghost_spawn" (players)) true)
                    (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true)
                )
            )
        )
        (sleep_until 
            (and
                (< (ai_living_count "bridge_vehicles_all") 1)
                (< (ai_living_count "bridge_bunker_turrets") 1)
            )
        )
        (game_saving)
    )
)

(script dormant void bridge_activate_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true) 30 16000)
        (if 
            (and
                (= (volume_test_objects "vol_bridge_inside_bunker" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'get into that structure and find the controls to extend the bridge!'")
                    (sleep (ai_play_line_on_object none "0470"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void bridge_cortana_response
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'a sermon, actually.  i've been listening to him since we landed.'")
        (print "cortana: 'so far it's the standard covenant liturgy,'")
        (print "cortana: 'but i'll translate if he says anything interesting.'")
        (sleep (ai_play_line_on_object none "0080"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void bridge_holo_comment
    (begin
        (set regret_ally_comment_go true)
        (cs_switch "bridge_marine")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "marine: 'isn't that our target?'")
        (cs_play_line "0060")
        (sleep 30)
        (print "marine: 'what's he doing?  giving a speech?'")
        (cs_play_line "0070")
        (wake bridge_cortana_response)
    )
)

(script dormant void bunker_holo_looper
    (begin
        (object_create "regret01")
        (objects_attach "bunker_throne" "driver" "regret01" "")
        (ai_disregard "regret01" true)
        (sleep_until 
            (begin
                (begin_random
                    (if (= bunker_holo_trans false) 
                        (begin
                            (set bunker_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant1a" true)
                            (sleep (ai_play_line_on_object "regret01" "3000"))
                            (sleep (random_range 240 480))
                            (set bunker_holo_chant false)
                        )
                    )
                    (if (= bunker_holo_trans false) 
                        (begin
                            (set bunker_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant2b" true)
                            (sleep (ai_play_line_on_object "regret01" "3001"))
                            (sleep (random_range 240 480))
                            (set bunker_holo_chant false)
                        )
                    )
                    (if (= bunker_holo_trans false) 
                        (begin
                            (set bunker_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant2c" true)
                            (sleep (ai_play_line_on_object "regret01" "3002"))
                            (sleep (random_range 240 480))
                            (set bunker_holo_chant false)
                        )
                    )
                    (if (= bunker_holo_trans false) 
                        (begin
                            (set bunker_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant3a" true)
                            (sleep (ai_play_line_on_object "regret01" "3003"))
                            (sleep (random_range 240 480))
                            (set bunker_holo_chant false)
                        )
                    )
                    (if (= bunker_holo_trans false) 
                        (begin
                            (set bunker_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant3c" true)
                            (sleep (ai_play_line_on_object "regret01" "3004"))
                            (sleep (random_range 240 480))
                            (set bunker_holo_chant false)
                        )
                    )
                    (if (= bunker_holo_trans false) 
                        (begin
                            (set bunker_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant5a" true)
                            (sleep (ai_play_line_on_object "regret01" "3005"))
                            (sleep (random_range 240 480))
                            (set bunker_holo_chant false)
                        )
                    )
                    (if (= bunker_holo_trans false) 
                        (begin
                            (set bunker_holo_chant true)
                            (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_chant6a" true)
                            (sleep (ai_play_line_on_object "regret01" "3006"))
                            (sleep (random_range 240 480))
                            (set bunker_holo_chant false)
                        )
                    )
                )
                false
            )
        )
    )
)

(script dormant void bridge_holo_translate
    (begin
        (sleep_until 
            (and
                (< (ai_living_count "bridge_enemies_bunker") 1)
                (= (volume_test_objects "vol_bunker_upper_level" (players)) true)
            )
        )
        (sleep_until 
            (or
                (< (ai_living_count "all_allies") 1)
                (ai_scene "bridge_holo_scene" bridge_holo_comment "all_allies")
            ) 
        30 300)
        (sleep 30)
        (if 
            (and
                (= regret_ally_comment_go false)
                (= (volume_test_objects "vol_bunker_upper_level" (players)) true)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'regret's giving a speech - a sermon to be exact.'")
                    (print "'so far it's the standard covenant liturgy, but i'll translate if he says anything interesting.'")
                    (sleep (ai_play_line_on_object none "2110"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
        (sleep_until 
            (and
                (= (volume_test_objects "vol_bunker_upper_level" (players)) true)
                (< (ai_living_count "bridge_enemies_bunker") 1)
            )
        )
        (sleep 60)
        (set bunker_holo_trans true)
        (sleep_until 
            (and
                (= (objects_can_see_object (players) "regret01" 30.0) true)
                (= (volume_test_objects "vol_bunker_upper_level" (players)) true)
                (= bunker_holo_chant false)
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_l05_0090_por" true)
        (print "regret: 'the forerunners, our most exalted lords, used the seven sacred rings...'")
        (print "'...to flee a doomed existence - to escape their endless struggle against the flood!'")
        (sleep (ai_play_line_on_object "regret01" "0090"))
        (sleep 30)
        (custom_animation "regret01" "objects\characters\prophet\prophet" "regret_l05_0100_por" true)
        (print "'long ago, the prophets and elites fought an equally fruitless war.'")
        (print "'indeed, i suspect we would still be at each other's throats had the prophets...'")
        (print "'...not found evidence of the forerunners and their great journey!'")
        (sleep (ai_play_line_on_object "regret01" "0100"))
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep (random_range 240 480))
        (set bunker_holo_trans false)
    )
)

(script command_script void bridge_ally_comment
    (begin
        (cs_switch "bridge_ally")
        (cs_enable_pathfinding_failsafe true)
        (set bridge_ally_comment_go true)
        (cs_abort_on_damage true)
        (print "ally: 'good. the bridge is down. now about those wraiths…'")
        (cs_play_line "0490")
    )
)

(script dormant void crack_spawn
    (begin
        (sleep_until (> (ai_combat_status "bridge_enemies_bunker") ai_combat_status_idle))
        (if (difficulty_heroic) 
            (ai_place "bridge_crack_jackals" 1))
        (if (difficulty_normal) 
            (ai_place "bridge_crack_jackals" 2))
    )
)

(script dormant void bunker_turret_remanning
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (volume_test_objects "vol_bridge_inside_bunker" (players)) false)
                        (> (player_count) 0)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_01") "c_turret_ap_d" (ai_actors "all_enemies")) false)
                        (> (object_get_health (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_01")) 0.0)
                        (< (ai_living_count "bunker_turret_remen") 1)
                    ) 
                        (begin
                            (ai_place "bunker_turret_remen/1")
                            (sleep 5)
                            (ai_vehicle_enter "bunker_turret_remen" (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_01"))
                        )
                )
                (if 
                    (and
                        (= (volume_test_objects "vol_bridge_inside_bunker" (players)) false)
                        (> (player_count) 0)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_02") "c_turret_ap_d" (ai_actors "all_enemies")) false)
                        (> (object_get_health (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_02")) 0.0)
                        (< (ai_living_count "bunker_turret_remen") 1)
                    ) 
                        (begin
                            (ai_place "bunker_turret_remen/2")
                            (sleep 5)
                            (ai_vehicle_enter "bunker_turret_remen" (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_02"))
                        )
                )
                (if 
                    (and
                        (= (volume_test_objects "vol_bridge_inside_bunker" (players)) false)
                        (> (player_count) 0)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_03") "c_turret_ap_d" (ai_actors "all_enemies")) false)
                        (> (object_get_health (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_03")) 0.0)
                        (< (ai_living_count "bunker_turret_remen") 1)
                    ) 
                        (begin
                            (ai_place "bunker_turret_remen/3")
                            (sleep 5)
                            (ai_vehicle_enter "bunker_turret_remen" (ai_vehicle_get_from_starting_location "bridge_bunker_turrets/bunker_03"))
                        )
                )
                (or
                    (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true)
                    (> (ai_spawn_count "bunker_turret_remen") 5)
                )
            )
        )
    )
)

(script dormant void bunker_upper_spawn_01
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bunker_front" (players)) true)
                (< (ai_living_count "bridge_enemies_bunker") 1)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "bridge_bunker_elites") 2) 
            (ai_place "bridge_bunker_elites_01" 1))
        (ai_place "bridge_bunker_grunts_01" (- (random_range 1 3) (ai_living_count "bridge_bunker_grunts")))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bunker_front" (players)) true)
                (< (ai_living_count "bridge_enemies_bunker") 1)
            )
        )
        (game_save_no_timeout)
        (if 
            (and
                (< (ai_living_count "bridge_enemies_bunker") 1)
                (= (volume_test_objects "vol_bridge_inside_bunker" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "bridge_bunker_elites") 2) 
                        (ai_place "bridge_bunker_elites_01" 1))
                    (ai_place "bridge_bunker_jackals_01" (- 2.0 (ai_living_count "bridge_bunker_jackals")))
                )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bunker_front" (players)) true)
                (< (ai_living_count "bridge_enemies_bunker") 1)
            )
        )
        (game_save_no_timeout)
        (if 
            (and
                (< (ai_living_count "bridge_enemies_bunker") 1)
                (= (volume_test_objects "vol_bridge_inside_bunker" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "bridge_bunker_elites") 2) 
                        (ai_place "bridge_bunker_elites_01" (- 1.0 (ai_living_count "bridge_bunker_elites"))))
                    (ai_place "bridge_bunker_jackals_01" (- 1.0 (ai_living_count "bridge_bunker_jackals")))
                    (ai_set_orders "bridge_bunker_elites_01" "bridge_bunker_in_upper_01")
                    (ai_set_orders "bridge_bunker_jackals_01" "bridge_bunker_in_upper_01")
                )
        )
    )
)

(script dormant void bunker_upper_spawn_03
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bunker_upper_level" (players)) true)
                (= (volume_test_objects "vol_bunker_roof" (players)) true)
                (= (volume_test_objects "vol_bunker_spawnstop_01" (players)) true)
                (= (volume_test_objects "vol_bunker_spawnstop_02" (players)) true)
                (= (volume_test_objects "vol_bunker_spawnstop_03" (players)) true)
            )
        )
        (game_save_no_timeout)
        (wake music_05a_03_start)
        (ai_place "bridge_control_elites_01" 1)
        (ai_place "bridge_control_jackals_01" (random_range 0 3))
        (ai_place "bridge_control_grunts_01" (- 3.0 (ai_living_count "bridge_control_jackals_01")))
    )
)

(script dormant void bunker_lower_spawn_01
    (begin
        (sleep_until (= (volume_test_objects "vol_bunker_backdoor" (players)) true))
        (game_save_no_timeout)
        (if (< (ai_living_count "bridge_bunker_elites") 2) 
            (ai_place "bridge_backdoor_elites_01" 1))
        (ai_place "bridge_backdoor_grunts_01" (- (random_range 1 3) (ai_living_count "bridge_bunker_grunts")))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bunker_backdoor" (players)) true)
                (< (ai_living_count "bridge_enemies_bunker") 1)
            )
        )
        (game_save_no_timeout)
        (if 
            (and
                (< (ai_living_count "bridge_enemies_bunker") 1)
                (= (volume_test_objects "vol_bunker_lower_level" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "bridge_bunker_elites") 2) 
                        (ai_place "bridge_backdoor_elites_01" 1))
                    (ai_place "bridge_backdoor_jackals_01" (- 2.0 (ai_living_count "bridge_bunker_jackals")))
                )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bunker_backdoor" (players)) true)
                (< (ai_living_count "bridge_enemies_bunker") 1)
            )
        )
        (game_save_no_timeout)
        (if 
            (and
                (< (ai_living_count "bridge_enemies_bunker") 1)
                (= (volume_test_objects "vol_bunker_lower_level" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "bridge_bunker_elites") 2) 
                        (ai_place "bridge_backdoor_elites_01" (- 1.0 (ai_living_count "bridge_bunker_elites"))))
                    (ai_place "bridge_backdoor_jackals_01" (- 2.0 (ai_living_count "bridge_bunker_jackals")))
                    (ai_set_orders "bridge_backdoor_elites_01" "bridge_bunker_in_lower_02")
                    (ai_set_orders "bridge_backdoor_jackals_01" "bridge_bunker_in_lower_02")
                )
        )
    )
)

(script dormant void bunker_spawn_checker
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bunker_upper_level" (players)) true)
                (= (volume_test_objects "vol_bunker_spawnstop_01" (players)) true)
                (= (volume_test_objects "vol_bunker_spawnstop_02" (players)) true)
                (= (volume_test_objects "vol_bunker_spawnstop_03" (players)) true)
            )
        )
        (sleep_forever bunker_upper_spawn_01)
        (sleep_forever bunker_lower_spawn_01)
        (sleep_forever bunker_turret_remanning)
    )
)

(script dormant void bridge_pelican_wait
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bridge_middle" (players)) true)
                (= (volume_test_objects "vol_bridge_farside_all" (players)) true)
            )
        )
        (if 
            (and
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player0)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_p" (player0)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player1)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_p" (player1)) false)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'you don't want the tank?  o-kay…i guess we'll leave it for the others.'")
                    (sleep (ai_play_line_on_object none "0510"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
        (wake music_05a_04_start)
    )
)

(script dormant void bridge_cross_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_bridge_farside_all" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_bridge_farside_all" (players)) false)
                (> (ai_living_count "bridge_farside_wraiths") 0)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'let's head across the bridge and deal with those wraiths.'")
                    (sleep (ai_play_line_on_object none "0520"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script command_script void banshee_boost
    (begin
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_enable_moving true)
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 50.0))
    )
)

(script dormant void bridge_pelican_timer
    (begin
        (sleep 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "bridge_pelican/pilot"))
    )
)

(script command_script void gimme_tank
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by bridge_airspace/pel0 50.0)
        (cs_fly_by bridge_airspace/pel1 50.0)
        (cs_fly_by bridge_airspace/pel2 50.0)
        (cs_fly_by bridge_airspace/pel3 50.0)
        (cs_fly_by bridge_airspace/pel4 20.0)
        (set bridge_pelican_in_sight true)
        (cs_vehicle_boost false)
        (ai_set_orders "bridge_pelican_chasers" "bridge_air")
        (cs_fly_to bridge_airspace/pel4too 3.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_to bridge_airspace/pel6 3.0)
        (cs_fly_to_and_face bridge_airspace/pel6 bridge_airspace/pel5 1.0)
        (cs_fly_to_and_face bridge_airspace/pel7 bridge_airspace/pel5 1.0)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_bridge_tank" (players)) false)
                (= (volume_test_objects "vol_bridge_tank" (ai_actors "all_allies")) false)
                (> (player_count) 0)
            )
        )
        (vehicle_unload (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") pelican_lc)
        (sound_impulse_start_effect "sound_remastered\vehicles\scorpion\scorpion_drop\mono" "bridge_tank" 1.0)
        (sound_impulse_start_effect "sound_remastered\vehicles\scorpion\scorpion_drop\reflections" "bridge_tank" 1.0)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") pelican_p)
        (set bridge_pelican_arrived true)
        (wake bridge_pelican_timer)
        (sleep_until (< (ai_living_count "bridge_pelican") 4))
        (cs_vehicle_speed 0.5)
        (cs_fly_to bridge_airspace/pel6 2.0)
        (cs_vehicle_boost true)
        (cs_vehicle_speed 1.0)
        (cs_fly_by bridge_airspace/pel4 10.0)
        (cs_fly_by bridge_airspace/pel1 20.0)
        (cs_fly_by bridge_airspace/pel0 20.0)
        (cs_fly_by bridge_airspace/pelx 20.0)
        (ai_erase "bridge_pelican")
    )
)

(script dormant void bridge_pelican_run
    (begin
        (ai_place "allies_bridge_pelican" (- 2.0 (ai_living_count "all_allies")))
        (ai_place "bridge_pelican")
        (ai_place "bridge_tank")
        (object_cannot_take_damage (ai_vehicle_get_from_starting_location "bridge_pelican/pilot"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") pelican_p (ai_actors "allies_bridge_pelican"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") pelican_lc (ai_vehicle_get_from_starting_location "bridge_tank/driver"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") true)
        (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" true)
        (cs_run_command_script "bridge_pelican/pilot" gimme_tank)
    )
)

(script static void short_bridge_pel
    (begin
        (ai_place "allies_bridge_pelican" (- 2.0 (ai_living_count "all_allies")))
        (ai_place "bridge_pelican")
        (ai_place "bridge_tank")
        (object_cannot_take_damage (ai_vehicle_get_from_starting_location "bridge_pelican/pilot"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") pelican_p (ai_actors "allies_bridge_pelican"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") pelican_lc (ai_vehicle_get_from_starting_location "bridge_tank/driver"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_pelican/pilot") true)
        (cs_run_command_script "bridge_pelican/pilot" gimme_tank)
    )
)

(script dormant void bridge_banshee_spawn
    (begin
        (sleep_until 
            (or
                (< (ai_living_count "bridge_farside_wraiths") 1)
                (= (volume_test_objects "vol_winding_path" (players)) true)
            )
        )
        (if (= (volume_test_objects "vol_winding_path" (players)) true) 
            (sleep_forever))
        (if 
            (and
                (= (volume_test_objects "vol_winding_path" (players)) false)
                (or
                    (difficulty_normal)
                    (difficulty_heroic)
                )
            ) 
                (begin
                    (ai_place "bridge_banshees" 1)
                    (cs_run_command_script "bridge_banshees" banshee_boost)
                )
        )
        (if 
            (and
                (difficulty_legendary)
                (= (volume_test_objects "vol_winding_path" (players)) false)
            ) 
                (begin
                    (ai_place "bridge_banshees" 2)
                    (cs_run_command_script "bridge_banshees" banshee_boost)
                )
        )
        (sleep_until 
            (or
                (< (ai_living_count "bridge_banshees") 1)
                (= (volume_test_objects "vol_winding_path" (players)) true)
            )
        )
        (if (= (volume_test_objects "vol_winding_path" (players)) true) 
            (sleep_forever))
        (if 
            (and
                (= (volume_test_objects "vol_winding_path" (players)) false)
                (or
                    (difficulty_normal)
                    (difficulty_heroic)
                )
            ) 
                (begin
                    (ai_place "bridge_banshees" 1)
                    (cs_run_command_script "bridge_banshees" banshee_boost)
                )
        )
        (if 
            (and
                (difficulty_legendary)
                (= (volume_test_objects "vol_winding_path" (players)) false)
            ) 
                (begin
                    (ai_place "bridge_banshees" 2)
                    (cs_run_command_script "bridge_banshees" banshee_boost)
                )
        )
    )
)

(script dormant void farside_ghosts_spawn
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_bridge_middle" (players)) true)
                (= (device_get_position "da_bridge") 0.0)
            )
        )
        (ai_place "bridge_farside_ghosts" 2)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_winding_path" (players)) true)
                (< (ai_living_count "bridge_farside_ghosts") 1)
            )
        )
        (if 
            (and
                (= (volume_test_objects "vol_winding_path" (players)) false)
                (> (player_count) 0)
                (< (ai_living_count "bridge_farside_ghosts") 1)
            ) 
                (ai_place "bridge_farside_ghosts" 2))
    )
)

(script dormant void bridge_spare_ghost_spawn
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/1")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/2")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/3")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/4")) 1)
                        (= (objects_can_see_flag (players) "extra_ghost_01" 45.0) false)
                        (> (objects_distance_to_flag (players) "extra_ghost_01") 5.0)
                    ) 
                        (ai_place "bridge_free_ghost/1"))
                (if 
                    (and
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/1")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/2")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/3")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/4")) 1)
                        (= (objects_can_see_flag (players) "extra_ghost_02" 45.0) false)
                        (> (objects_distance_to_flag (players) "extra_ghost_02") 5.0)
                    ) 
                        (ai_place "bridge_free_ghost/2"))
                (if 
                    (and
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/1")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/2")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/3")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/4")) 1)
                        (= (objects_can_see_flag (players) "extra_ghost_03" 45.0) false)
                        (> (objects_distance_to_flag (players) "extra_ghost_03") 5.0)
                    ) 
                        (ai_place "bridge_free_ghost/3"))
                (if 
                    (and
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/1")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/2")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/3")) 1)
                        (< (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/4")) 1)
                        (= (objects_can_see_flag (players) "extra_ghost_04" 45.0) false)
                        (> (objects_distance_to_flag (players) "extra_ghost_04") 5.0)
                    ) 
                        (ai_place "bridge_free_ghost/4"))
                (or
                    (> (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/1")) 0)
                    (> (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/2")) 0)
                    (> (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/3")) 0)
                    (> (list_count (ai_vehicle_get_from_starting_location "bridge_free_ghost/4")) 0)
                )
            )
        )
    )
)

(script command_script void bridge_wraith_engage
    (begin
        (cs_abort_on_damage true)
        (cs_go_to bridge/p0)
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_shoot true (ai_vehicle_get_from_starting_location "lz_warthog_01/driver"))
        (sleep_until (>= (ai_combat_status ai_current_actor) ai_combat_status_visible))
    )
)

(script dormant void bridges_start
    (begin
        (device_set_position_immediate "da_bridge" 0.5)
        (device_set_position "real_bridge" 1.0)
        (object_create "waterfall_far")
        (object_create "waterfall_close")
        (wake bunker_holo_looper)
        (ai_place "bridge_bunker_ghosts")
        (ai_place "bridge_ghost_elites" 2)
        (cs_run_command_script "bridge_ghost_elites/r" bridge_ghostman_r)
        (cs_run_command_script "bridge_ghost_elites/l" bridge_ghostman_l)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/l") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/r") true)
        (sleep 15)
        (if (difficulty_legendary) 
            (ai_place "bridge_bunker_turrets" 4))
        (if (difficulty_heroic) 
            (ai_place "bridge_bunker_turrets" 3))
        (if (difficulty_normal) 
            (ai_place "bridge_bunker_turrets" 2))
        (cs_run_command_script "bridge_bunker_turrets" stay_shooting)
        (sleep 15)
        (wake crack_spawn)
        (wake bunker_upper_spawn_03)
        (wake bunker_spawn_checker)
        (wake bridge_ghosts_by_phantom)
        (wake bunker_turret_remanning)
        (sleep_until (= (volume_test_objects "vol_bridge_pause" (players)) true))
        (data_mine_insert "05a_3_bridge")
        (wake music_05a_02_stop)
        (device_set_position "da_bridge" 1.0)
        (sleep 60)
        (wake bridge_cortana_comment)
        (wake bridge_activate_reminder)
        (device_group_change_only_once_more_set "da_bridge" true)
        (sleep_until (= (volume_test_objects "vol_bridge_engage" (players)) true))
        (ai_place "bridge_farside_wraiths" 1)
        (cs_run_command_script "bridge_farside_wraiths" bridge_wraith_engage)
        (wake bridge_wraith_warning)
        (sleep_until (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true))
        (sleep_forever bridge_ghosts_by_phantom)
        (sleep_until 
            (begin
                (set bridge_state (device_get_position "da_bridge"))
                (sleep 15)
                (< (device_get_position "da_bridge") bridge_state)
            )
        )
        (wake music_05a_03_stop)
        (wake bridge_pelican_run)
        (wake lights)
        (ai_set_orders "all_allies" "bridge_tank_wait")
        (game_save_no_timeout)
        (wake farside_ghosts_spawn)
        (if 
            (or
                (difficulty_legendary)
                (difficulty_heroic)
            ) 
                (ai_place "bridge_farside_wraiths" (- 2.0 (ai_living_count "bridge_farside_wraiths"))) (ai_place "bridge_farside_wraiths" (- 1.0 (ai_living_count "bridge_farside_wraiths"))))
        (wake bridge_cross_reminder)
        (sleep_until 
            (or
                (ai_scene "bridge_ally_scene" bridge_ally_comment "all_allies")
                (< (ai_living_count "bridge_allies") 1)
            ) 
        30 150)
        (sleep 150)
        (if (= bridge_ally_comment_go false) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'good. the bridge is down. now about those wraiths…'")
                (sleep (ai_play_line_on_object none "2040"))
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (print "johnson: 'roger that, marine. armor's on the way!'")
        (sleep (ai_play_line_on_object none "0500"))
        (sleep 30)
        (ai_dialogue_enable true)
        (game_save_no_timeout)
        (wake bridge_holo_translate)
        (wake bridge_pelican_wait)
        (sleep_until (= (device_get_position "da_bridge") 0.0))
        (device_set_position "real_bridge" 0.0)
        (sleep_until (= bridge_pelican_arrived true))
        (wake bridge_banshee_spawn)
        (wake bridge_spare_ghost_spawn)
        (sleep_until 
            (or
                (and
                    (= (volume_test_objects "vol_bridge_all" (players)) false)
                    (> (player_count) 0)
                )
                (and
                    (or
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_p" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/r") "ghost_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/l") "ghost_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_01/1") "ghost_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_01/2") "ghost_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/1") "ghost_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/2") "ghost_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_farside_ghosts/1") "ghost_d" (player0))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_farside_ghosts/2") "ghost_d" (player0))
                    )
                    (or
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_p" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/l") "ghost_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_bunker_ghosts/r") "ghost_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_01/1") "ghost_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_01/2") "ghost_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/1") "ghost_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_phantom_ghosts_02/2") "ghost_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_farside_ghosts/1") "ghost_d" (player1))
                        (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_farside_ghosts/2") "ghost_d" (player1))
                        (= (game_can_use_flashlights) false)
                    )
                )
            )
        )
        (sleep 120)
        (game_save_no_timeout)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_tank/driver") false)
        (if 
            (or
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player0))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player1))
            ) 
                (wake music_05a_04_start))
    )
)

(script dormant void waterfall_toggle
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_waterfall_off" (players)) true))
                (object_destroy "waterfall_far")
                (object_destroy "waterfall_close")
                (sleep_until (= (volume_test_objects "vol_waterfall_on" (players)) true))
                (object_create "waterfall_far")
                (object_create "waterfall_close")
                false
            )
        )
    )
)

(script command_script void w_path_turret_0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to w_path_turrets/go_p0)
        (cs_deploy_turret w_path_turrets/p0)
    )
)

(script command_script void w_path_turret_1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to w_path_turrets/go_p1)
        (cs_deploy_turret w_path_turrets/p1)
    )
)

(script command_script void w_path_turret_2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to w_path_turrets/go_p2)
        (cs_deploy_turret w_path_turrets/p2)
    )
)

(script dormant void w_path_turret_deploy
    (begin
        (if (difficulty_legendary) 
            (set w_path_turret_count 3))
        (if (difficulty_heroic) 
            (set w_path_turret_count 2))
        (begin_random
            (if (> w_path_turret_count 0) 
                (begin
                    (ai_place "w_path_heavies/0")
                    (cs_run_command_script "w_path_heavies/0" w_path_turret_0)
                    (set w_path_turret_count (- w_path_turret_count 1.0))
                )
            )
            (if (> w_path_turret_count 0) 
                (begin
                    (ai_place "w_path_heavies/1")
                    (cs_run_command_script "w_path_heavies/1" w_path_turret_1)
                    (set w_path_turret_count (- w_path_turret_count 1.0))
                )
            )
            (if (> w_path_turret_count 2) 
                (begin
                    (ai_place "w_path_heavies/2")
                    (cs_run_command_script "w_path_heavies/0" w_path_turret_2)
                    (set w_path_turret_count (- w_path_turret_count 1.0))
                )
            )
        )
    )
)

(script command_script void throw_grenade
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (sleep_until (>= (ai_combat_status ai_current_actor) ai_combat_status_clear_los))
        (cs_grenade w_path_turrets/p3 1)
    )
)

(script dormant void winding_path_start
    (begin
        (ai_disposable "overlook_jackals" true)
        (ai_disposable "bridge_enemies_all" true)
        (data_mine_insert "05a_4_winding_path")
        (game_save_no_timeout)
        (wake waterfall_toggle)
        (ai_place "w_path_free_ghost" 1)
        (if (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "" (players)) false) 
            (set w_path_spawn_count 3))
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (< (ai_living_count "winding_path_ghosts") 1)
                        (= (volume_test_objects "vol_winding_path_mid_01" (players)) true)
                    )
                )
                (if 
                    (and
                        (= (volume_test_objects "vol_winding_path_mid_01" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "winding_path_ghosts_01" 1))
                (sleep_until (= (volume_test_objects "vol_winding_path_mid_01" (players)) true) 30 (random_range 30 90))
                (if 
                    (and
                        (= (volume_test_objects "vol_winding_path_mid_01" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "winding_path_ghosts_01" 1))
                (or
                    (= (volume_test_objects "vol_winding_path_mid_01" (players)) true)
                    (> (ai_spawn_count "winding_path_ghosts_01") w_path_spawn_count)
                )
            )
        )
        (sleep_until (= (volume_test_objects "vol_winding_path_mid_02" (players)) true))
        (game_save_no_timeout)
        (if (< (ai_living_count "winding_path_enemies") 6) 
            (ai_place "winding_path_grunts" 4))
        (wake w_path_turret_deploy)
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (< (ai_living_count "winding_path_ghosts") 1)
                        (= (volume_test_objects "vol_waterfall_on" (players)) true)
                    )
                )
                (if 
                    (and
                        (= (volume_test_objects "vol_waterfall_on" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "winding_path_ghosts_02" 1))
                (sleep_until (= (volume_test_objects "vol_waterfall_on" (players)) true) 30 (random_range 30 90))
                (if 
                    (and
                        (= (volume_test_objects "vol_waterfall_on" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "winding_path_ghosts_02" 1))
                (or
                    (= (volume_test_objects "vol_waterfall_on" (players)) true)
                    (> (ai_spawn_count "winding_path_ghosts_02") w_path_spawn_count)
                )
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "winding_path_enemies") 6) 
            (ai_place "winding_path_jackals" 3))
        (if (< (ai_living_count "winding_path_enemies") 6) 
            (ai_place "winding_path_ledge_grunts" 3))
        (cs_run_command_script "winding_path_ledge_grunts" throw_grenade)
        (sleep_until 
            (and
                (< (ai_living_count "winding_path_ghosts") 1)
                (< (ai_living_count "winding_path_grunts") 1)
                (< (ai_living_count "winding_path_jackals") 1)
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void temple_ent_turret_spawn
    (begin
        (if (difficulty_legendary) 
            (set temple_ent_near_turret 3) (set temple_ent_far_turret 3))
        (if (difficulty_heroic) 
            (set temple_ent_near_turret 2) (set temple_ent_far_turret 2))
        (begin_random
            (if (> temple_ent_near_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_01/1")
                    (set temple_ent_near_turret (- temple_ent_near_turret 1.0))
                )
            )
            (if (> temple_ent_near_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_01/2")
                    (set temple_ent_near_turret (- temple_ent_near_turret 1.0))
                )
            )
            (if (> temple_ent_near_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_02/1")
                    (set temple_ent_near_turret (- temple_ent_near_turret 1.0))
                )
            )
            (if (> temple_ent_near_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_02/2")
                    (set temple_ent_near_turret (- temple_ent_near_turret 1.0))
                )
            )
        )
        (begin_random
            (if (> temple_ent_far_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_03/1")
                    (set temple_ent_far_turret (- temple_ent_far_turret 1.0))
                )
            )
            (if (> temple_ent_far_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_03/2")
                    (set temple_ent_far_turret (- temple_ent_far_turret 1.0))
                )
            )
            (if (> temple_ent_far_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_04/1")
                    (set temple_ent_far_turret (- temple_ent_far_turret 1.0))
                )
            )
            (if (> temple_ent_far_turret 0) 
                (begin
                    (ai_place "temple_ent_turrets_04/2")
                    (set temple_ent_far_turret (- temple_ent_far_turret 1.0))
                )
            )
        )
    )
)

(script command_script void temple_ent_ghostman_r
    (begin
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "temple_ent_ghosts_01/r"))
    )
)

(script command_script void temple_ent_ghostman_l
    (begin
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "temple_ent_ghosts_01/l"))
    )
)

(script dormant void temple_ent_ghost_alert
    (begin
        (sleep_until 
            (or
                (> (ai_combat_status "temple_ent_elites_01r") ai_combat_status_idle)
                (> (ai_combat_status "temple_ent_elites_01l") ai_combat_status_idle)
            )
        )
        (cs_run_command_script "temple_ent_elites_01r" temple_ent_ghostman_r)
        (cs_run_command_script "temple_ent_elites_01l" temple_ent_ghostman_l)
    )
)

(script dormant void temple_ent_veh_spawn
    (begin
        (if (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "" (players)) false) 
            (set temple_ent_spawn_count 3))
        (sleep_until 
            (or
                (and
                    (< (ai_living_count "temple_ent_elites_02r") 1)
                    (< (ai_living_count "temple_ent_elites_02l") 1)
                    (< (ai_living_count "temple_ent_ghosts_01") 1)
                )
                (and
                    (<= (object_get_health (ai_vehicle_get_from_starting_location "temple_ent_ghosts_01/r")) 0.0)
                    (<= (object_get_health (ai_vehicle_get_from_starting_location "temple_ent_ghosts_01/l")) 0.0)
                )
                (= (volume_test_objects "vol_temple_ent_02" (players)) true)
                (= (volume_test_objects "vol_temple_ent_03" (players)) true)
            ) 
        30 900)
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (< (ai_living_count "temple_ent_ghosts") 1)
                        (= (volume_test_objects "vol_temple_ent_02" (players)) true)
                    )
                )
                (game_save_no_timeout)
                (if (= (volume_test_objects "vol_temple_ent_02" (players)) false) 
                    (ai_place "temple_ent_ghosts_02" (- 2.0 (ai_living_count "temple_ent_ghosts"))))
                (sleep_until (= (volume_test_objects "vol_temple_ent_02" (players)) true) 30 (random_range 30 90))
                (if (= (volume_test_objects "vol_temple_ent_02" (players)) false) 
                    (ai_place "temple_ent_ghosts_02" (- 2.0 (ai_living_count "temple_ent_ghosts"))))
                (or
                    (> (ai_spawn_count "temple_ent_ghosts_02") temple_ent_spawn_count)
                    (= (volume_test_objects "vol_temple_ent_02" (players)) true)
                    (= (volume_test_objects "vol_temple_ent_03" (players)) true)
                )
            )
        )
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (< (ai_living_count "temple_ent_ghosts") 1)
                        (= (volume_test_objects "vol_temple_ent_03" (players)) true)
                    )
                )
                (game_save_no_timeout)
                (if (= (volume_test_objects "vol_temple_ent_03" (players)) false) 
                    (ai_place "temple_ent_ghosts_02" (- 2.0 (ai_living_count "temple_ent_ghosts"))))
                (sleep_until (= (volume_test_objects "vol_temple_ent_03" (players)) true) 30 (random_range 30 90))
                (if (= (volume_test_objects "vol_temple_ent_03" (players)) false) 
                    (ai_place "temple_ent_ghosts_02" (- 2.0 (ai_living_count "temple_ent_ghosts"))))
                (or
                    (> (ai_spawn_count "temple_ent_ghosts_02") (- (* temple_ent_spawn_count 2.0) 1.0))
                    (= (volume_test_objects "vol_temple_ent_03" (players)) true)
                )
            )
        )
    )
)

(script command_script void back_home_comment
    (begin
        (cs_switch "ally01")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "ally: 'kinda reminds me of back home…'")
        (cs_play_line "0530")
        (cs_switch "ally02")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "ally: 'yeah. too bad we're blowing it the hell up!'")
        (cs_play_line "0540")
    )
)

(script dormant void temple_ent_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_tunnel_01" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_tunnel_01" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'let's push on. we need to find a an access point to those structures in the lake.'")
                    (sleep (ai_play_line_on_object none "0580"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void old_temple_entrance_start
    (begin
        (sleep_until (= (volume_test_objects "vol_temple_entrance" (players)) true))
        (ai_disposable "winding_path_enemies" true)
        (data_mine_insert "05a_5_temple_entrance")
        (game_save_no_timeout)
        (wake 05a_title1)
        (wake music_05a_04_start_alt)
        (wake temple_ent_turret_spawn)
        (ai_place "temple_ent_elites_01l" 1)
        (ai_place "temple_ent_elites_01r" 1)
        (if (difficulty_heroic) 
            (begin
                (ai_place "temple_ent_jackals_01l" 1)
                (ai_place "temple_ent_jackals_01r" 1)
            )
        )
        (if (difficulty_normal) 
            (begin
                (ai_place "temple_ent_jackals_01l" 2)
                (ai_place "temple_ent_jackals_01r" 2)
            )
        )
        (ai_place "temple_ent_ghosts_01" 2)
        (wake temple_ent_ghost_alert)
        (sleep_until 
            (or
                (< (ai_living_count "temple_ent_turrets_near") 1)
                (< (ai_living_count "temple_ent_enemies_all") 4)
                (= (volume_test_objects "vol_temple_ent_01" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "temple_ent_enemies_all") 8) 
            (ai_place "temple_ent_elites_02r" (- 1.0 (ai_living_count "temple_ent_elites_01r"))))
        (if (< (ai_living_count "temple_ent_enemies_all") 8) 
            (ai_place "temple_ent_elites_02l" (- 1.0 (ai_living_count "temple_ent_elites_01l"))))
        (wake temple_ent_veh_spawn)
        (set temple_ent_phase_01 true)
        (sleep_until 
            (or
                (< (ai_living_count "temple_ent_enemies_all") 4)
                (= (volume_test_objects "vol_temple_ent_02" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "temple_ent_enemies_all") 8) 
            (ai_place "temple_ent_jackals_02c" 2))
        (if 
            (and
                (> (object_get_health (ai_vehicle_get_from_starting_location "temple_ent_turrets_03/1")) 0.0)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "temple_ent_turrets_03/1") "" (ai_actors "all_enemies")) false)
                (< (ai_living_count "temple_ent_enemies_all") 8)
            ) 
                (ai_place "temple_ent_grunts_01l" 1))
        (if 
            (and
                (> (object_get_health (ai_vehicle_get_from_starting_location "temple_ent_turrets_03/2")) 0.0)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "temple_ent_turrets_03/2") "" (ai_actors "all_enemies")) false)
                (< (ai_living_count "temple_ent_enemies_all") 8)
            ) 
                (ai_place "temple_ent_grunts_01l" 1))
        (if 
            (and
                (> (object_get_health (ai_vehicle_get_from_starting_location "temple_ent_turrets_04/1")) 0.0)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "temple_ent_turrets_04/1") "" (ai_actors "all_enemies")) false)
                (< (ai_living_count "temple_ent_enemies_all") 8)
            ) 
                (ai_place "temple_ent_grunts_01r" 1))
        (if 
            (and
                (> (object_get_health (ai_vehicle_get_from_starting_location "temple_ent_turrets_04/2")) 0.0)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "temple_ent_turrets_04/2") "" (ai_actors "all_enemies")) false)
                (< (ai_living_count "temple_ent_enemies_all") 8)
            ) 
                (ai_place "temple_ent_grunts_01r" 1))
        (set temple_ent_phase_02 true)
        (sleep_until 
            (or
                (< (ai_living_count "temple_ent_enemies_all") 1)
                (= (volume_test_objects "vol_temple_ent_03" (players)) true)
            )
        )
        (game_save_no_timeout)
        (ai_set_orders "temple_ent_ghosts" "temple_ent_back_02")
        (wake temple_ent_reminder)
        (sleep_until 
            (or
                (< (ai_living_count "temple_ent_enemies_all") 1)
                (= (volume_test_objects "vol_tunnel_01" (players)) true)
            )
        )
        (game_save_no_timeout)
        (sleep_until 
            (or
                (< (ai_living_count "all_allies") 1)
                (ai_scene "temple_ent_scene" back_home_comment "all_allies")
            ) 
        30 300)
    )
)

(script dormant void temple_ent_arch
    (begin
        (sleep_until 
            (or
                (= (ai_trigger_test "done_fighting" "tunnel_enemies_all") true)
                (= (volume_test_objects "vol_old_temple_near_left" (players)) true)
            )
        )
        (sleep_until (= (volume_test_objects "vol_old_temple_near_left" (players)) true) 30 450)
        (if 
            (and
                (= (volume_test_objects "vol_old_temple_near_left" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'these structures seem forerunner,'")
                    (print "'but they're much older than anything we ever found on the first halo.'")
                    (sleep (ai_play_line_on_object none "0570"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script command_script void old_temple_structure_comment
    (begin
        (set structure_comment_go true)
        (cs_switch "ally")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "ally: 'careful, we're coming-up on another structure!'")
        (cs_play_line "0600")
    )
)

(script command_script void tunnel_turret_0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to tunnel_turrets/go_p0)
        (cs_deploy_turret tunnel_turrets/p0)
    )
)

(script command_script void tunnel_turret_1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to tunnel_turrets/go_p1)
        (cs_deploy_turret tunnel_turrets/p1)
    )
)

(script command_script void tunnel_turret_2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to tunnel_turrets/go_p2)
        (cs_deploy_turret tunnel_turrets/p2)
    )
)

(script command_script void tunnel_turret_3
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to tunnel_turrets/go_p3)
        (cs_deploy_turret tunnel_turrets/p3)
    )
)

(script dormant void tunnel_start
    (begin
        (ai_disposable "temple_ent_enemies_all" true)
        (data_mine_insert "05a_6_tunnel")
        (game_save_no_timeout)
        (if (< (ai_living_count "tunnel_enemies_all") 6) 
            (ai_place "tunnel_grunts" 2))
        (if (< (ai_living_count "tunnel_enemies_all") 6) 
            (ai_place "tunnel_heavies_01" 2))
        (cs_run_command_script "tunnel_heavies_01/0" tunnel_turret_0)
        (cs_run_command_script "tunnel_heavies_01/1" tunnel_turret_1)
        (ai_place "tunnel_ghosts_01" (- 2.0 (ai_living_count "temple_ent_ghosts")))
        (sleep_until (= (volume_test_objects "vol_tunnel_02" (players)) true) 30 (random_range 30 90))
        (if (= (volume_test_objects "vol_tunnel_02" (players)) false) 
            (ai_place "tunnel_ghosts_01" (- 2.0 (ai_living_count "temple_ent_ghosts"))))
        (sleep_until (= (volume_test_objects "vol_tunnel_02" (players)) true))
        (game_save_no_timeout)
        (if (< (ai_living_count "tunnel_enemies_all") 6) 
            (ai_place "tunnel_jackals" 2))
        (if (< (ai_living_count "tunnel_enemies_all") 6) 
            (ai_place "tunnel_heavies_02" 2))
        (cs_run_command_script "tunnel_heavies_02/2" tunnel_turret_2)
        (cs_run_command_script "tunnel_heavies_02/3" tunnel_turret_3)
        (ai_migrate "temple_ent_ghosts" "tunnel_ghosts_02")
        (ai_migrate "tunnel_ghosts_01" "tunnel_ghosts_02")
        (ai_place "tunnel_ghosts_02" (- 2.0 (ai_living_count "tunnel_ghosts")))
        (sleep_until (= (volume_test_objects "vol_tunnel_03" (players)) true) 30 (random_range 30 90))
        (if (= (volume_test_objects "vol_tunnel_02" (players)) false) 
            (ai_place "tunnel_ghosts_02" (- 2.0 (ai_living_count "tunnel_ghosts"))))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_tunnel_03" (players)) true)
                (and
                    (< (ai_living_count "tunnel_ghosts") 1)
                    (< (ai_living_count "tunnel_infantry") 1)
                )
            )
        )
        (game_save_no_timeout)
        (sleep_until 
            (or
                (ai_scene "old_temple_scene" old_temple_structure_comment "all_allies")
                (< (ai_living_count "all_allies") 1)
            ) 
        30 150)
        (sleep 30)
        (if (= structure_comment_go false) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "cortana: 'careful, we're coming-up on another structure!'")
                (sleep (ai_play_line_on_object none "2060"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
    )
)

(script dormant void arbiter_envy
    (begin
        (sleep_until (= (volume_test_objects "vol_arbiter_envy" (players)) true))
        (object_create "envy")
        (ai_place "envy_elites")
        (ai_set_active_camo "envy_elites" true)
        (cs_run_command_script "envy_elites" forever_pause)
        (custom_animation_loop (unit (list_get (ai_actors "envy_elites") 0)) "objects\characters\elite\elite" "combat:rifle:berserk" true)
        (custom_animation_loop (unit (list_get (ai_actors "envy_elites") 1)) "objects\characters\elite\elite" "combat:rifle:berserk" true)
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
            )
        )
        (reset_dsp_image 0)
    )
)

(script command_script void old_temple_pelican_comment
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (print "ally: 'got a pelican coming in!'")
        (cs_play_line "0620")
        (sleep 30)
        (print "ally: 'let's clear an lz!'")
        (cs_play_line "0630")
        (set old_temple_pel_comment_go true)
    )
)

(script dormant void old_temple_pelican_timer
    (begin
        (sleep 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot"))
    )
)

(script command_script void old_temple_pelican_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/pel0 20.0)
        (cs_fly_by old_temple_airspace/pel1 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by old_temple_airspace/pel2 20.0)
        (cs_fly_to old_temple_airspace/pel3 10.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_to old_temple_airspace/pel4 5.0)
        (set old_temple_bombs_away true)
        (cs_fly_to_and_face old_temple_airspace/pel4 old_temple_airspace/p0 1.0)
        (ai_place "allies_old_temple_pelican" (- 4.0 (ai_living_count "all_allies")))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot") pelican_p (ai_actors "allies_old_temple_pelican"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot") true)
        (cs_fly_to old_temple_airspace/pel5 1.0)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot") pelican_p)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_old_temple_center_01" (players)) true)
                (= (volume_test_objects "vol_old_temple_center_03" (players)) true)
                (= (volume_test_objects "vol_old_temple_center_05" (players)) true)
            )
        )
        (sleep 90)
        (wake old_temple_pelican_timer)
        (cs_vehicle_speed 1.0)
        (cs_fly_to old_temple_airspace/pel4 2.0)
        (cs_fly_by old_temple_airspace/pel3 5.0)
        (cs_fly_by old_temple_airspace/pel2 5.0)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/pel1 20.0)
        (cs_fly_by old_temple_airspace/pel0 20.0)
        (ai_erase "old_temple_pelican")
    )
)

(script dormant void old_temple_pelican
    (begin
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 5)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 5) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 5)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 4)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 4) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 4)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 3)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 3) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 3)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 2) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 2)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 1) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 1)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 0) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 0)))
        (sleep 5)
        (sleep_until (< (ai_living_count "old_temple_phantom") 1))
        (ai_place "old_temple_pelican")
        (object_cannot_take_damage (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot"))
        (object_create_anew "rack")
        (objects_attach (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot") "pelican_sc_01" "rack" "pin")
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
        (cs_run_command_script "old_temple_pelican/pilot" old_temple_pelican_arrives)
        (sleep_until (= old_temple_bombs_away true))
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

(script static void short_old_temple_pel
    (begin
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 5)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 5) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 5)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 4)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 4) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 4)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 3)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 3) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 3)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 2) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 2)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 1) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 1)))
        (sleep 5)
        (if 
            (and
                (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 50.0)
                (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 0) 45.0) false)
            ) 
                (object_destroy (list_get (ai_actors "all_allies") 0)))
        (sleep 5)
        (ai_place "allies_old_temple_pelican" 4)
        (ai_place "old_temple_pelican")
        (object_cannot_take_damage (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot") pelican_p (ai_actors "allies_old_temple_pelican"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot") true)
        (object_create_anew "rack")
        (objects_attach (ai_vehicle_get_from_starting_location "old_temple_pelican/pilot") "pelican_sc_01" "rack" "pin")
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
        (cs_run_command_script "old_temple_pelican/pilot" old_temple_pelican_arrives)
        (sleep_until (= old_temple_bombs_away true))
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

(script command_script void old_temple_ph_01_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/ph0 20.0)
        (cs_fly_by old_temple_airspace/ph1 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by old_temple_airspace/ph2 20.0)
        (cs_fly_to old_temple_airspace/ph3a 3.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_to old_temple_airspace/ph3a 1.0)
        (cs_fly_to old_temple_airspace/ph4a 1.0)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") phantom_lc)
        (sleep_until (< (ai_living_count "old_temple_phantom") 2) 30 900)
        (cs_fly_to_and_face old_temple_airspace/ph3a old_temple_airspace/ph2 1.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by old_temple_airspace/ph2 5.0)
        (cs_fly_by old_temple_airspace/ph1 5.0)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/ph0 20.0)
        (cs_fly_to old_temple_airspace/phx 20.0)
        (ai_erase "old_temple_phantom")
    )
)

(script command_script void old_temple_ph_02_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/ph0 20.0)
        (cs_fly_by old_temple_airspace/ph1 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by old_temple_airspace/ph2 20.0)
        (cs_fly_to old_temple_airspace/ph3b 3.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_to_and_face old_temple_airspace/ph3b old_temple_airspace/ph1 1.0)
        (cs_fly_to old_temple_airspace/ph4b 1.0)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") phantom_lc)
        (sleep_until (< (ai_living_count "old_temple_phantom") 2) 30 900)
        (cs_fly_to old_temple_airspace/ph3b 1.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_to_and_face old_temple_airspace/ph2 old_temple_airspace/ph1 1.0)
        (cs_fly_by old_temple_airspace/ph2 5.0)
        (cs_fly_by old_temple_airspace/ph1 5.0)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/ph0 20.0)
        (cs_fly_to old_temple_airspace/phx 20.0)
        (ai_erase "old_temple_phantom")
    )
)

(script command_script void old_temple_ph_04_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/ph0 20.0)
        (cs_fly_by old_temple_airspace/ph1 20.0)
        (cs_vehicle_boost false)
        (cs_fly_by old_temple_airspace/ph2 20.0)
        (cs_fly_to old_temple_airspace/ph3c 5.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_to_and_face old_temple_airspace/ph3c old_temple_airspace/p2 1.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_to old_temple_airspace/ph4c 1.0)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") true)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_a01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_a02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_a03)
        (ai_set_orders "old_temple_court_grunts_03" "old_temple_courtyard_03")
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_b01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_b02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_b03)
        (ai_set_orders "old_temple_court_jackals_03" "old_temple_courtyard_03")
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_c01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_c02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_c03)
        (ai_set_orders "old_temple_court_jackals_04" "old_temple_courtyard_04")
        (sleep_until (< (ai_living_count "old_temp_court_phantom") 2) 30 900)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") false)
        (cs_fly_to old_temple_airspace/ph3c 1.0)
        (cs_fly_by old_temple_airspace/ph2 5.0)
        (cs_fly_by old_temple_airspace/ph1 5.0)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/ph0 20.0)
        (cs_fly_to old_temple_airspace/phx 20.0)
        (ai_erase "old_temple_phantom")
    )
)

(script command_script void old_temple_abort
    (begin
        (cs_enable_pathfinding_failsafe true)
        (if (= (volume_test_objects "vol_old_temple_airspace_low" (ai_actors "old_temple_phantom")) true) 
            (begin
                (cs_enable_moving true)
                (cs_enable_looking true)
                (sleep_until (= (volume_test_objects "vol_old_temple_airspace_high" (ai_actors "old_temple_phantom")) true))
            )
        )
        (cs_vehicle_speed 1.0)
        (cs_fly_by old_temple_airspace/ph2 5.0)
        (cs_fly_by old_temple_airspace/ph1 5.0)
        (cs_vehicle_boost true)
        (cs_fly_by old_temple_airspace/ph0 20.0)
        (cs_fly_to old_temple_airspace/phx 20.0)
        (ai_erase "old_temple_phantom")
    )
)

(script static void old_temple_phantom_01
    (begin
        (sleep_until (< (ai_living_count "old_temple_pelican") 1))
        (ai_place "old_temple_phantom")
        (ai_place "old_temple_ghosts_air")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") phantom_lc (ai_vehicle_get_from_starting_location "old_temple_ghosts_air/1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") phantom_lc (ai_vehicle_get_from_starting_location "old_temple_ghosts_air/2"))
        (sleep 60)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") true)
        (cs_run_command_script "old_temple_phantom/pilot" old_temple_ph_01_arrives)
        (sleep_until 
            (or
                (< (ai_living_count "old_temple_phantom") 1)
                (< (ai_living_count "old_temple_ghosts_air") 1)
            )
        )
        (if (< (ai_living_count "old_temple_ghosts_air") 1) 
            (cs_run_command_script "old_temple_phantom" old_temple_abort))
        (sleep_until (< (ai_living_count "old_temple_phantom") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot"))
    )
)

(script static void old_temple_phantom_02
    (begin
        (sleep_until (< (ai_living_count "old_temple_pelican") 1))
        (ai_place "old_temple_phantom")
        (ai_place "old_temple_ghosts_air")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") phantom_lc (ai_vehicle_get_from_starting_location "old_temple_ghosts_air/1"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") phantom_lc (ai_vehicle_get_from_starting_location "old_temple_ghosts_air/2"))
        (sleep 60)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot") true)
        (cs_run_command_script "old_temple_phantom/pilot" old_temple_ph_02_arrives)
        (sleep_until 
            (or
                (< (ai_living_count "old_temple_phantom") 1)
                (< (ai_living_count "old_temple_ghosts_air") 1)
            )
        )
        (if (< (ai_living_count "old_temple_ghosts_air") 1) 
            (cs_run_command_script "old_temple_phantom" old_temple_abort))
        (sleep_until (< (ai_living_count "old_temple_phantom") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "old_temple_phantom/pilot"))
    )
)

(script dormant void old_temple_phantom_04
    (begin
        (sleep_until (< (ai_living_count "old_temple_pelican") 1))
        (ai_place "old_temple_court_jackals_03" 2)
        (ai_place "old_temple_court_grunts_03" 3)
        (ai_place "old_temple_court_jackals_04" 3)
        (ai_place "old_temp_court_phantom")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_c (ai_actors "old_temple_court_jackals_04"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_a (ai_actors "old_temple_court_grunts_03"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_b (ai_actors "old_temple_court_jackals_03"))
        (sleep 60)
        (cs_run_command_script "old_temp_court_phantom/pilot" old_temple_ph_04_arrives)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") true)
        (sleep_until (< (ai_living_count "old_temp_court_phantom") 1) 30 8000)
        (object_destroy (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot"))
    )
)

(script static void short_old_temple_phantom
    (begin
        (ai_allegiance covenant prophet)
        (ai_place "old_temple_court_jackals_03" 2)
        (ai_place "old_temple_court_grunts_03" 3)
        (ai_place "old_temple_court_jackals_04" 3)
        (ai_place "old_temp_court_phantom")
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_c (ai_actors "old_temple_court_jackals_04"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_a (ai_actors "old_temple_court_grunts_03"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") phantom_p_b (ai_actors "old_temple_court_jackals_03"))
        (sleep 60)
        (cs_run_command_script "old_temp_court_phantom/pilot" old_temple_ph_04_arrives)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "old_temp_court_phantom/pilot") true)
    )
)

(script dormant void old_temple_vehicle_spawn
    (begin
        (ai_place "old_temple_ghosts_far")
        (if (difficulty_heroic) 
            (set old_temple_veh_total 3))
        (if (difficulty_legendary) 
            (set old_temple_veh_total 4))
        (sleep_until (> (ai_living_count "old_temple_ghosts_far") 0) 30 600)
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (< (ai_living_count "old_temple_vehicles") 1)
                        (= (volume_test_objects "vol_old_temple_debris" (players)) true)
                    )
                )
                (game_save_no_timeout)
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) true) 
                    (sleep_forever))
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) false) 
                    (ai_place "old_temple_ghosts_far" 1))
                (sleep_until (= (volume_test_objects "vol_old_temple_debris" (players)) true) 30 (random_range 30 120))
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) true) 
                    (sleep_forever))
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) false) 
                    (ai_place "old_temple_ghosts_far" 1))
                (set old_temple_veh_total (- old_temple_veh_total 1.0))
                (or
                    (and
                        (difficulty_normal)
                        (< old_temple_veh_total 2)
                    )
                    (and
                        (difficulty_heroic)
                        (< old_temple_veh_total 2)
                    )
                    (and
                        (difficulty_legendary)
                        (< old_temple_veh_total 3)
                    )
                    (= (volume_test_objects "vol_old_temple_debris" (players)) true)
                )
            )
        )
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (< (ai_living_count "old_temple_vehicles") 1)
                        (= (volume_test_objects "vol_old_temple_debris" (players)) true)
                    )
                )
                (game_save_no_timeout)
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) true) 
                    (sleep_forever))
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) false) 
                    (begin
                        (ai_place "old_temple_ghosts_far" 1)
                        (ai_set_orders "old_temple_ghosts_far" "old_temple_vehicles_ltd")
                    )
                )
                (sleep_until (= (volume_test_objects "vol_old_temple_debris" (players)) true) 30 (random_range 30 120))
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) true) 
                    (sleep_forever))
                (if (= (volume_test_objects "vol_old_temple_debris" (players)) false) 
                    (begin
                        (ai_place "old_temple_ghosts_far" 1)
                        (ai_set_orders "old_temple_ghosts_far" "old_temple_vehicles_ltd")
                    )
                )
                (set old_temple_veh_total (- old_temple_veh_total 1.0))
                (or
                    (<= old_temple_veh_total 0)
                    (= (volume_test_objects "vol_old_temple_debris" (players)) true)
                )
            )
        )
        (sleep_until (< (ai_living_count "old_temple_vehicles") 1))
        (set old_temple_ghosts_over true)
    )
)

(script dormant void old_temple_near_right
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_old_temple_near_right" (players)) true)
                (= (volume_test_objects "vol_old_temple_int_01" (players)) false)
                (= (volume_test_objects "vol_old_temple_int_02" (players)) false)
                (> (player_count) 0)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_elites_near_right" 1))
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_jackals_near_right" (- 2.0 (ai_living_count "old_temple_peri_jackals"))))
    )
)

(script dormant void old_temple_far_left
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_old_temple_far_left" (players)) true)
                (= (volume_test_objects "vol_old_temple_int_01" (players)) false)
                (= (volume_test_objects "vol_old_temple_int_02" (players)) false)
                (> (player_count) 0)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_grunts_far_left" (- 3.0 (ai_living_count "old_temple_peri_grunts"))))
    )
)

(script dormant void old_temple_far_right
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_old_temple_far_right" (players)) true)
                (= (volume_test_objects "vol_old_temple_int_01" (players)) false)
                (= (volume_test_objects "vol_old_temple_int_02" (players)) false)
                (> (player_count) 0)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_grunts_far_right" (- 3.0 (ai_living_count "old_temple_peri_grunts"))))
    )
)

(script dormant void old_temple_below
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_old_temple_below" (players)) true)
                (= (volume_test_objects "vol_old_temple_int_01" (players)) false)
                (= (volume_test_objects "vol_old_temple_int_02" (players)) false)
                (> (player_count) 0)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_jackals_below_far" (- (random_range 2 5) (ai_living_count "old_temple_peri_jackals"))))
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_jackals_below_near" (- (random_range 2 5) (ai_living_count "old_temple_peri_jackals"))))
    )
)

(script command_script void old_temp_reman_fr
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_go_to old_temple/far_r)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "old_temple_turrets/far_r"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (sleep_forever)
    )
)

(script command_script void old_temp_reman_fl
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_go_to old_temple/far_l)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "old_temple_turrets/far_l"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (sleep_forever)
    )
)

(script command_script void old_temp_reman_nl
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_go_to old_temple/near_l)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "old_temple_turrets/near_l"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (sleep_forever)
    )
)

(script command_script void old_temp_reman_cen
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_go_to old_temple/center)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "old_temple_turrets/center"))
        (cs_enable_targeting true)
        (cs_shoot true)
        (sleep_forever)
    )
)

(script dormant void old_temple_turret_reman
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (> (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/far_r")) 0.0)
                        (= (volume_test_objects "vol_old_temple_farwall_all" (players)) false)
                        (> (player_count) 0)
                        (< (ai_spawn_count "old_temple_grunts_far_right") 5)
                        (< (ai_living_count "old_temple_grunts_far_right") 1)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "old_temple_turrets/far_r") "" (ai_actors "old_temple_turrets")) false)
                        (< (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "old_temple_turrets/far_r")) 20.0)
                    ) 
                        (begin
                            (ai_place "old_temple_grunts_far_right/1")
                            (cs_run_command_script "old_temple_grunts_far_right/1" old_temp_reman_fr)
                        )
                )
                (if 
                    (and
                        (> (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/far_l")) 0.0)
                        (= (volume_test_objects "vol_old_temple_seawall_all" (players)) false)
                        (> (player_count) 0)
                        (< (ai_spawn_count "old_temple_grunts_far_left") 5)
                        (< (ai_living_count "old_temple_grunts_far_left") 1)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "old_temple_turrets/far_l") "" (ai_actors "old_temple_turrets")) false)
                        (< (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "old_temple_turrets/far_l")) 20.0)
                    ) 
                        (begin
                            (ai_place "old_temple_grunts_far_left/1")
                            (cs_run_command_script "old_temple_grunts_far_left/1" old_temp_reman_fl)
                        )
                )
                (if 
                    (and
                        (> (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/near_l")) 0.0)
                        (= (volume_test_objects "vol_old_temple_seawall_all" (players)) false)
                        (> (player_count) 0)
                        (< (ai_spawn_count "old_temple_grunts_near_left") 5)
                        (< (ai_living_count "old_temple_grunts_near_left") 1)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "old_temple_turrets/near_l") "" (ai_actors "old_temple_turrets")) false)
                        (< (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "old_temple_turrets/near_l")) 20.0)
                    ) 
                        (begin
                            (ai_place "old_temple_grunts_near_left/1")
                            (cs_run_command_script "old_temple_grunts_near_left/1" old_temp_reman_nl)
                        )
                )
                (if 
                    (and
                        (> (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/center")) 0.0)
                        (= (volume_test_objects "vol_old_temple_see_nook" (players)) false)
                        (> (player_count) 0)
                        (< (ai_spawn_count "old_temple_grunts_center") 5)
                        (< (ai_living_count "old_temple_grunts_center") 1)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "old_temple_turrets/center") "" (ai_actors "old_temple_turrets")) false)
                        (< (objects_distance_to_object (players) (ai_vehicle_get_from_starting_location "old_temple_turrets/center")) 20.0)
                    ) 
                        (begin
                            (ai_place "old_temple_grunts_center/1")
                            (cs_run_command_script "old_temple_grunts_center/1" old_temp_reman_cen)
                        )
                )
                (or
                    (= (volume_test_objects "vol_old_temple_center_01" (player0)) true)
                    (= (volume_test_objects "vol_old_temple_center_03" (player0)) true)
                    (= (volume_test_objects "vol_old_temple_center_05" (player0)) true)
                    (and
                        (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/far_r")) 0.0)
                        (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/far_l")) 0.0)
                        (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/near_l")) 0.0)
                        (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/center")) 0.0)
                    )
                )
            )
        )
    )
)

(script dormant void old_temple_perimeter_nuke
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "old_temple_peri_grunts") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "old_temple_peri_grunts") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "old_temple_peri_grunts") 0)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "old_temple_peri_jackals") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "old_temple_peri_jackals") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "old_temple_peri_jackals") 0)))
                (sleep 5)
                (and
                    (< (ai_living_count "old_temple_peri_grunts") 1)
                    (< (ai_living_count "old_temple_peri_jackals") 1)
                )
            )
        )
        (print "all gone")
    )
)

(script static void nuke
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "old_temple_peri_grunts") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "old_temple_peri_grunts") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "old_temple_peri_grunts") 0)))
                (sleep 5)
                (if 
                    (and
                        (= (objects_can_see_object (players) (list_get (ai_actors "old_temple_peri_jackals") 0) 45.0) false)
                        (> (objects_distance_to_object (players) (list_get (ai_actors "old_temple_peri_jackals") 0)) 10.0)
                    ) 
                        (object_destroy (list_get (ai_actors "old_temple_peri_jackals") 0)))
                (sleep 5)
                (and
                    (< (ai_living_count "old_temple_peri_grunts") 1)
                    (< (ai_living_count "old_temple_peri_jackals") 1)
                )
            )
        )
        (print "all gone")
    )
)

(script command_script void old_temple_middle_comment
    (begin
        (set old_temp_middle_go true)
        (cs_switch "ally")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "ally: 'they're all pouring-out of the middle! let's get in there!'")
        (cs_play_line "0610")
    )
)

(script dormant void old_temple_middle_ally
    (begin
        (sleep_until 
            (or
                (< (ai_living_count "all_allies") 1)
                (ai_scene "old_temple_mid_scene" old_temple_middle_comment "all_allies")
            ) 
        30 300)
        (sleep 30)
        (if 
            (and
                (= old_temp_middle_go false)
                (= old_temple_chatter false)
            ) 
                (begin
                    (set old_temple_chatter true)
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'they're all pouring-out of the middle! let's get in there!'")
                    (sleep (ai_play_line_on_object none "2070"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                    (set old_temple_chatter false)
                )
        )
    )
)

(script dormant void old_temple_center
    (begin
        (sleep_until 
            (or
                (and
                    (= (unit_in_vehicle (player0)) false)
                    (or
                        (= (volume_test_objects "vol_old_temple_center_01" (player0)) true)
                        (= (volume_test_objects "vol_old_temple_center_03" (player0)) true)
                        (= (volume_test_objects "vol_old_temple_center_05" (player0)) true)
                    )
                )
                (and
                    (= (unit_in_vehicle (player1)) false)
                    (or
                        (= (volume_test_objects "vol_old_temple_center_01" (player1)) true)
                        (= (volume_test_objects "vol_old_temple_center_03" (player1)) true)
                        (= (volume_test_objects "vol_old_temple_center_05" (player1)) true)
                    )
                )
            )
        )
        (ai_disposable "old_temple_peri_grunts" true)
        (ai_disposable "old_temple_peri_jackals" true)
        (game_save_no_timeout)
        (sleep_forever old_temple_near_right)
        (sleep_forever old_temple_far_left)
        (sleep_forever old_temple_far_right)
        (sleep_forever old_temple_vehicle_spawn)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_tank/driver") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") true)
        (cs_run_command_script "old_temple_phantom" old_temple_abort)
        (wake old_temple_perimeter_nuke)
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_center_elites_01" (- 2.0 (ai_living_count "old_temp_center_tough"))))
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_center_grunts_01" (- 3.0 (ai_living_count "old_temp_center_fodder"))))
        (wake old_temple_middle_ally)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_old_temple_center_03" (players)) true)
                (= (volume_test_objects "vol_old_temple_center_05" (players)) true)
                (< (ai_living_count "old_temple_center_all") 3)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_center_grunts_03" (- 3.0 (ai_living_count "old_temp_center_fodder"))))
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_center_jackals_04" (- 2.0 (ai_living_count "old_temp_center_tough"))))
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_center_grunts_04" (- 6.0 (ai_living_count "old_temp_center_fodder"))))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_old_temple_center_05" (players)) true)
                (< (ai_living_count "old_temple_center_all") 3)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_center_elites_05" (- 2.0 (ai_living_count "old_temp_center_tough"))))
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_center_jackals_05" (- 4.0 (ai_living_count "old_temp_center_tough"))))
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (ai_living_count "old_temple_center_all") 2)
                        (= (volume_test_objects "vol_old_temple_court_01" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "old_temple_courtyard_lure" 1))
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_old_temple_close_nuff" (players)) true)
                        (< (ai_living_count "old_temple_center_all") 2)
                        (> (ai_spawn_count "old_temple_courtyard_lure") 3)
                    ) 
                30 210)
                (or
                    (= (volume_test_objects "vol_old_temple_close_nuff" (players)) true)
                    (> (ai_spawn_count "old_temple_courtyard_lure") 3)
                )
            )
        )
        (game_save_no_timeout)
        (sleep_until (< (ai_living_count "old_temple_center_all") 1) 30 3600)
        (sleep_until (= (ai_trigger_test "done_fighting" "old_temple_center_all") true) 30 3600)
        (game_save_no_timeout)
    )
)

(script dormant void old_temple_playfight
    (begin
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_playfight_e" 2))
        (if (< (ai_living_count "old_temple_enemies") 8) 
            (ai_place "old_temple_playfight_g" 3))
        (sleep_until 
            (begin
                (if (< (ai_living_count "old_temple_playfight_g") 3) 
                    (ai_place "old_temple_playfight_g" 1))
                (or
                    (= (volume_test_objects "vol_old_temple_center_01" (players)) true)
                    (= (volume_test_objects "vol_old_temple_center_03" (players)) true)
                )
            )
        )
        (ai_set_orders "allies_old_temple_pelican" "old_temple_center_allies_01")
    )
)

(script dormant void old_temple_debris_comment
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_old_temple_debris" (players)) true)
                (= old_temple_chatter false)
            )
        )
        (set old_temple_chatter true)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'looks like a landslide has blocked the main passage.'")
        (print "'we'll have to find an alternate route.'")
        (sleep (ai_play_line_on_object none "0670"))
        (sleep 30)
        (ai_dialogue_enable true)
        (set old_temple_chatter false)
    )
)

(script dormant void old_temple_middle_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_old_temple_in_court" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_old_temple_in_court" (players)) false)
                (> (player_count) 0)
                (= old_temple_chatter false)
            ) 
                (begin
                    (set old_temple_chatter true)
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'the covenant holed-up in the middle of this structure.'")
                    (print "'we need to clear them out.'")
                    (sleep (ai_play_line_on_object none "0650"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                    (set old_temple_chatter false)
                )
        )
        (sleep_until (= (volume_test_objects "vol_old_temple_in_court" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_old_temple_in_court" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (deactivate_nav_point_flag default player "old_temple_exit" 0.0)
                    (sleep_until (= (volume_test_objects "vol_old_temple_in_court" (players)) true))
                    (cls player "old_temple_exit")
                )
        )
    )
)

(script dormant void old_temple_start
    (begin
        (sleep_until (= (volume_test_objects "vol_old_temple_start" (players)) true))
        (ai_disposable "tunnel_enemies_all" true)
        (data_mine_insert "05a_7_old_temple")
        (wake music_05a_04_stop)
        (game_save_no_timeout)
        (ai_place "old_temple_init_jackals_nl" 2)
        (sleep 2)
        (ai_place "old_temple_turrets/center")
        (cs_run_command_script "old_temple_turrets" stay_shooting)
        (sleep 2)
        (ai_place "old_temple_turrets/near_l")
        (cs_run_command_script "old_temple_turrets" stay_shooting)
        (sleep 2)
        (ai_place "old_temple_turrets/far_l")
        (cs_run_command_script "old_temple_turrets" stay_shooting)
        (sleep 2)
        (ai_place "old_temple_turrets/far_r")
        (cs_run_command_script "old_temple_turrets" stay_shooting)
        (wake old_temple_near_right)
        (wake old_temple_far_left)
        (wake old_temple_far_right)
        (wake old_temple_below)
        (wake old_temple_center)
        (wake old_temple_vehicle_spawn)
        (wake old_temple_middle_reminder)
        (wake old_temple_turret_reman)
        (if (difficulty_legendary) 
            (wake arbiter_envy))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_old_temple_center_01" (players)) true)
                (= (volume_test_objects "vol_old_temple_center_03" (players)) true)
                (and
                    (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/far_r")) 0.0)
                    (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/far_l")) 0.0)
                    (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/near_l")) 0.0)
                    (<= (object_get_health (ai_vehicle_get_from_starting_location "old_temple_turrets/center")) 0.0)
                    (= old_temple_ghosts_over true)
                )
            )
        )
        (game_save_no_timeout)
        (wake old_temple_pelican)
        (wake old_temple_playfight)
        (sleep_until 
            (or
                (ai_scene "old_temple_pel_scene" old_temple_pelican_comment "all_allies")
                (< (ai_living_count "all_allies") 1)
            ) 
        30 60)
        (sleep 300)
        (if 
            (and
                (= old_temple_pel_comment_go false)
                (= old_temple_chatter false)
            ) 
                (begin
                    (set old_temple_chatter true)
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'pelican inbound!'")
                    (sleep (ai_play_line_on_object none "2080"))
                    (sleep 15)
                    (print "cortana: 'let's clear a landing-zone!'")
                    (sleep (ai_play_line_on_object none "2090"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                    (set old_temple_chatter false)
                )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_old_temple_center_01" (players)) true)
                (= (volume_test_objects "vol_old_temple_center_03" (players)) true)
                (= (volume_test_objects "vol_old_temple_in_court" (players)) true)
            ) 
        30 300)
        (if 
            (and
                (= (volume_test_objects "vol_old_temple_center_01" (players)) false)
                (= (volume_test_objects "vol_old_temple_center_03" (players)) false)
                (= (volume_test_objects "vol_old_temple_in_court" (players)) false)
                (> (player_count) 0)
                (= old_temple_bombs_away false)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "johnson: 'clear out the riff-raff so i can set her down!'")
                    (sleep (ai_play_line_on_object none "0640"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
        (game_save_no_timeout)
        (sleep_until (< (ai_living_count "old_temple_enemies") 1) 30 3600)
        (sleep_until (= (ai_trigger_test "done_fighting" "old_temple_enemies") true) 30 3600)
        (game_save_no_timeout)
    )
)

(script dormant void old_temple_debris_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_through_debris" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_through_debris" (players)) false)
                (> (player_count) 0)
                (= old_temple_chatter false)
            ) 
                (begin
                    (set old_temple_chatter true)
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'there should be a way through this debris…'")
                    (sleep (ai_play_line_on_object none "0680"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                    (set old_temple_chatter false)
                )
        )
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true) 30 4000)
        (if 
            (and
                (= (volume_test_objects "vol_grotto" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (deactivate_nav_point_flag default player "courtyard_exit" 0.0)
                    (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
                    (cls player "courtyard_exit")
                )
        )
    )
)

(script dormant void old_temple_holo_translate
    (begin
        (sleep_until (< (ai_living_count "old_temple_court_all") 1))
        (sleep 300)
        (set court_holo_trans true)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_old_temple_court_04" (players)) true)
                (= (objects_can_see_object (players) "regret02" 30.0) true)
                (= court_holo_chant false)
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_l05_0110_por" true)
        (print "'in a gesture of peace and reconciliation, the prophets promised to find the means...'")
        (print "'...of the forerunners' transcendence, and to share this knowledge with the elites.'")
        (sleep (ai_play_line_on_object "regret02" "0110"))
        (sleep 30)
        (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_l05_0120_por" true)
        (print "'the elites promised to defend the prophets as they searched - '")
        (print "'a simple arrangement that has become our binding covenant!'")
        (sleep (ai_play_line_on_object "regret02" "0120"))
        (sleep 60)
        (if (= old_temple_chatter false) 
            (begin
                (set old_temple_chatter true)
                (print "cortana: 'transcendence, huh? more like mass-suicide.'")
                (sleep (ai_play_line_on_object none "0660"))
                (set old_temple_chatter false)
            )
        )
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep (random_range 240 480))
        (set court_holo_trans false)
    )
)

(script dormant void courtyard_holo_looper
    (begin
        (object_create "regret02")
        (objects_attach "court_throne_attach" "" "court_throne" "driver")
        (objects_attach "court_throne" "driver" "regret02" "")
        (ai_disregard "regret02" true)
        (sleep_until 
            (begin
                (begin_random
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant1a" true)
                            (sleep (ai_play_line_on_object "regret02" "3000"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant2b" true)
                            (sleep (ai_play_line_on_object "regret02" "3001"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant2c" true)
                            (sleep (ai_play_line_on_object "regret02" "3002"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant3a" true)
                            (sleep (ai_play_line_on_object "regret02" "3003"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant3c" true)
                            (sleep (ai_play_line_on_object "regret02" "3004"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant5a" true)
                            (sleep (ai_play_line_on_object "regret02" "3005"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant6a" true)
                            (sleep (ai_play_line_on_object "regret02" "3006"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                )
                false
            )
        )
    )
)

(script static void court_holo_looper
    (begin
        (object_create "regret02")
        (objects_attach "court_throne_attach" "" "court_throne" "driver")
        (objects_attach "court_throne" "driver" "regret02" "")
        (ai_disregard "regret02" true)
        (sleep_until 
            (begin
                (begin_random
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant1a" true)
                            (sleep (ai_play_line_on_object "regret02" "3000"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant2b" true)
                            (sleep (ai_play_line_on_object "regret02" "3001"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant2c" true)
                            (sleep (ai_play_line_on_object "regret02" "3002"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant3a" true)
                            (sleep (ai_play_line_on_object "regret02" "3003"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant3c" true)
                            (sleep (ai_play_line_on_object "regret02" "3004"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant5a" true)
                            (sleep (ai_play_line_on_object "regret02" "3005"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                    (if (= court_holo_trans false) 
                        (begin
                            (set court_holo_chant true)
                            (custom_animation "regret02" "objects\characters\prophet\prophet" "regret_chant6a" true)
                            (sleep (ai_play_line_on_object "regret02" "3006"))
                            (sleep (random_range 240 480))
                            (set court_holo_chant false)
                        )
                    )
                )
                false
            )
        )
    )
)

(script dormant void old_temple_archaeologist
    (begin
        (sleep_until (= (ai_trigger_test "done_fighting" "all_enemies") true))
        (sleep_until 
            (or
                (= (ai_trigger_test "done_fighting" "all_enemies") true)
                (= (volume_test_objects "vol_through_debris" (players)) true)
            )
        )
        (sleep_until (= (volume_test_objects "vol_through_debris" (players)) true) 30 300)
        (if 
            (and
                (= (volume_test_objects "vol_through_debris" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'what happened to this place? the stones…'")
                    (print "'this isn't normal wear and tear. it almost looks like battle-scarring…'")
                    (sleep (ai_play_line_on_object none "0590"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void old_temple_courtyard
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_old_temple_court_01" (players)) true)
                (= (volume_test_objects "vol_old_temple_in_court" (players)) true)
            )
        )
        (ai_disposable "old_temple_center_all" true)
        (data_mine_insert "05a_8_old_temple_courtyard")
        (wake courtyard_holo_looper)
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_elites_01" 2))
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_grunts_01" 3))
        (sleep_until 
            (or
                (< (ai_living_count "old_temple_court_all") 3)
                (= (volume_test_objects "vol_old_temple_court_02" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_grunts_02" (- 4.0 (ai_living_count "old_temple_court_grunts_01"))))
        (sleep_until 
            (or
                (< (ai_living_count "old_temple_court_all") 3)
                (= (volume_test_objects "vol_old_temple_court_04" (players)) true)
            )
        )
        (game_save_no_timeout)
        (wake old_temple_holo_translate)
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_jackals_03" (- 2.0 (ai_living_count "old_temple_court_elites_01"))))
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_grunts_03" (- 3.0 (+ (ai_living_count "old_temple_court_grunts_01") (ai_living_count "old_temple_court_grunts_02")))))
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_jackals_04" 2))
        (sleep_until 
            (or
                (< (ai_living_count "old_temple_court_all") 3)
                (= (volume_test_objects "vol_old_temple_court_05" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_elites_05" 2))
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_jackals_05" 2))
        (wake old_temple_debris_reminder)
        (sleep_until (= (volume_test_objects "vol_old_temple_court_06" (players)) true))
        (game_save_no_timeout)
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_jackals_06" 2))
        (if (< (ai_living_count "old_temple_court_all") 8) 
            (ai_place "old_temple_court_grunts_06" 3))
        (sleep_until (< (ai_living_count "old_temple_court_all") 1) 30 4000)
        (sleep_until (= (ai_trigger_test "done_fighting" "old_temple_court_all") true) 30 3600)
        (game_save_no_timeout)
    )
)

(script dormant void grotto_cortana_comment
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_grotto_follow_01" (players)) true)
                (= (objects_can_see_flag (players) "grotto_center" 30.0) true)
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'you always bring me to such nice places.'")
        (sleep (ai_play_line_on_object none "0690"))
        (sleep 30)
        (wake music_05a_05_start)
        (ai_dialogue_enable true)
        (sleep_until (game_all_quiet))
        (game_save_no_timeout)
    )
)

(script command_script void grotto_ally_cheese
    (begin
        (cs_switch "ally01")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "odst: 'my girl would dig this place. so beautiful…'")
        (cs_play_line "0700")
        (sleep 30)
        (cs_switch "ally02")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "odst: 'beautiful and dangerous, man.'")
        (cs_play_line "0710")
        (sleep 30)
        (cs_switch "ally01")
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_damage true)
        (print "odst: 'hey. that's why i love her.'")
        (cs_play_line "0720")
    )
)

(script dormant void grotto_ally_comments
    (begin
        (sleep_until (ai_scene "grotto_ally_cheese_scene" grotto_ally_cheese "all_allies") 30 450)
    )
)

(script dormant void grotto_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_grotto_exit" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_grotto_exit" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'we're approaching another structure. it should be the...'")
                    (print "'...lake access-point we've been looking for…'")
                    (sleep (ai_play_line_on_object none "0750"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
        (sleep_until (= (volume_test_objects "vol_grotto_exit" (players)) true) 30 4000)
        (if 
            (and
                (= (volume_test_objects "vol_grotto_exit" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (deactivate_nav_point_flag default player "grotto_exit" 0.0)
                    (sleep_until (= (volume_test_objects "vol_grotto_exit" (players)) true))
                    (cls player "grotto_exit")
                )
        )
    )
)

(script dormant void grotto_pool
    (begin
        (sleep_until 
            (or
                (< (ai_living_count "grotto_init_01") 1)
                (= (volume_test_objects "vol_grotto_first_pool_01" (players)) true)
                (= (volume_test_objects "vol_grotto_mid_02" (players)) true)
                (= (volume_test_objects "vol_grotto_mid_03" (players)) true)
            )
        )
        (if 
            (or
                (= (volume_test_objects "vol_grotto_mid_02" (players)) true)
                (= (volume_test_objects "vol_grotto_mid_03" (players)) true)
            ) 
                (sleep_forever))
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_crack_grunts" 2))
        (sleep_until 
            (or
                (< (ai_living_count "grotto_crack_grunts") 2)
                (= (volume_test_objects "vol_grotto_first_pool_02" (players)) true)
                (= (volume_test_objects "vol_grotto_mid_02" (players)) true)
                (= (volume_test_objects "vol_grotto_mid_03" (players)) true)
            )
        )
        (if 
            (or
                (= (volume_test_objects "vol_grotto_mid_02" (players)) true)
                (= (volume_test_objects "vol_grotto_mid_03" (players)) true)
            ) 
                (sleep_forever))
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_buggers_new_01" (- 4.0 (ai_living_count "grotto_buggers"))))
        (sleep_until 
            (or
                (< (ai_living_count "grotto_buggers_new_01") 2)
                (= (volume_test_objects "vol_grotto_mid_02" (players)) true)
                (= (volume_test_objects "vol_grotto_mid_03" (players)) true)
            )
        )
        (sleep_until 
            (begin
                (if (< (ai_living_count "grotto_pool_grunts") 1) 
                    (ai_place "grotto_pool_grunts" 1))
                (or
                    (= (volume_test_objects "vol_grotto_mid_02" (players)) true)
                    (= (volume_test_objects "vol_grotto_mid_03" (players)) true)
                    (> (ai_spawn_count "grotto_pool_grunts") 3)
                )
            )
        )
    )
)

(script dormant void grotto_buggers_reinforce
    (begin
        (if 
            (and
                (< (ai_living_count "grotto_enemies") 8)
                (difficulty_legendary)
            ) 
                (ai_place "grotto_buggers_01" (- 4.0 (ai_living_count "grotto_buggers"))))
        (sleep_until (= (volume_test_objects "vol_grotto_mid_03" (players)) true))
        (ai_migrate "grotto_buggers_01" "grotto_buggers_02")
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_buggers_02" (- 4.0 (ai_living_count "grotto_buggers"))))
    )
)

(script dormant void grotto_extra_checkpoint
    (begin
        (sleep 60)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_grotto" (players)) false)
                (> (player_count) 0)
            )
        )
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (game_save_no_timeout)
    )
)

(script command_script void grotto_entry_patrol
    (begin
        (cs_abort_on_alert true)
        (sleep_until 
            (begin
                (begin
                    (cs_go_to_and_face grotto/p0 grotto/p2)
                    (cs_aim true grotto/p2)
                    (sleep (random_range 30 90))
                    (cs_aim false grotto/p2)
                )
                (begin
                    (cs_go_to_and_face grotto/p1 grotto/p2)
                    (cs_aim true grotto/p2)
                    (sleep (random_range 30 90))
                    (cs_aim false grotto/p2)
                )
                false
            )
        )
    )
)

(script dormant void grotto_start
    (begin
        (ai_disposable "old_temple_enemies" true)
        (data_mine_insert "05a_9_grotto")
        (game_save_no_timeout)
        (wake 05a_title2)
        (ai_place "grotto_init_01" 1)
        (ai_place "grotto_init_04" 1)
        (ai_place "grotto_init_05" 1)
        (ai_place "grotto_init_07" 1)
        (ai_place "grotto_init_09" 1)
        (cs_run_command_script "grotto_init_09" grotto_entry_patrol)
        (ai_place "grotto_init_11" 2)
        (wake grotto_cortana_comment)
        (wake grotto_pool)
        (wake grotto_extra_checkpoint)
        (sleep_until (= (volume_test_objects "vol_grotto_mid_02" (players)) true))
        (game_save_no_timeout)
        (if 
            (or
                (difficulty_heroic)
                (difficulty_legendary)
            ) 
                (set grotto_final_snipers 2))
        (begin_random
            (if 
                (and
                    (> grotto_final_snipers 0)
                    (< (ai_living_count "grotto_enemies") 8)
                ) 
                    (begin
                        (ai_place "grotto_cave_jackals_02" 1)
                        (set grotto_final_snipers (- grotto_final_snipers 1.0))
                    )
            )
            (if 
                (and
                    (> grotto_final_snipers 0)
                    (< (ai_living_count "grotto_enemies") 8)
                ) 
                    (begin
                        (ai_place "grotto_cave_jackals_03" 1)
                        (set grotto_final_snipers (- grotto_final_snipers 1.0))
                    )
            )
        )
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_cave_jackals_01" 1))
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_cave_elites" 1))
        (wake grotto_buggers_reinforce)
        (sleep_until (= (volume_test_objects "vol_grotto_far_top" (players)) true))
        (game_save_no_timeout)
        (wake grotto_reminder)
        (ai_migrate "grotto_buggers_02" "grotto_buggers_03")
        (if 
            (and
                (< (ai_living_count "grotto_enemies") 8)
                (difficulty_legendary)
            ) 
                (ai_place "grotto_buggers_03" (- 4.0 (ai_living_count "grotto_buggers"))))
        (ai_set_orders "grotto_buggers" "grotto_follow_03")
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_end_elites_01" 1))
        (sleep 30)
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_end_jackals_02" 2))
        (sleep 30)
        (if (< (ai_living_count "grotto_enemies") 8) 
            (ai_place "grotto_end_elites_02" 1))
        (sleep_until (= (volume_test_objects "vol_grotto_end" (players)) true))
        (wake music_05a_05_stop)
        (game_save_no_timeout)
        (ai_set_orders "grotto_initial" "grotto_follow_03")
        (sleep_until (< (ai_living_count "grotto_enemies") 1))
        (game_save_no_timeout)
    )
)

(script dormant void approach_cortana_comment
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'good. still no word about in amber clad on the covenant battle-net.'")
        (sleep (ai_play_line_on_object none "0760"))
        (sleep 60)
        (print "cortana: 'it's odd - the covenant know we made land-fall,'")
        (print "'but they don't seem to consider us a very serious threat.'")
        (sleep (ai_play_line_on_object none "0770"))
        (sleep 30)
        (print "cortana: 'boy are they in for a big surprise!'")
        (sleep (ai_play_line_on_object none "0780"))
        (sleep 30)
        (ai_dialogue_enable true)
        (game_save_no_timeout)
    )
)

(script dormant void approach_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_tower1" (players)) true) 30 3600)
        (if 
            (and
                (= (volume_test_objects "vol_tower1" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "cortana: 'this tower cluster should connect to the structures further...'")
                    (print "'...out in the lake. let's get inside.'")
                    (sleep (ai_play_line_on_object none "0790"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void temple_approach_start
    (begin
        (ai_disposable "grotto_enemies" true)
        (data_mine_insert "05a_10_tower_approach")
        (ai_place "approach_jackal_01")
        (ai_place "approach_jackal_02")
        (ai_place "approach_jackal_03")
        (ai_place "approach_elite_01")
        (ai_place "approach_elite_02")
        (ai_place "approach_elite_03")
        (ai_place "approach_grunts_01")
        (wake approach_cortana_comment)
        (wake approach_reminder)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_approach_ramp" (players)) true)
                (and
                    (= (volume_test_objects "vol_approach_music" (players)) true)
                    (= (objects_can_see_flag (players) "see_tower1" 30.0) true)
                )
            )
        )
        (wake music_05a_06_start)
        (sleep_until 
            (or
                (> (ai_combat_status "approach_enemies") ai_combat_status_idle)
                (= (volume_test_objects "vol_approach_ramp" (players)) true)
            )
        )
        (if 
            (and
                (= (volume_test_objects "vol_approach_ramp" (players)) false)
                (> (player_count) 0)
                (< (ai_living_count "approach_enemies") 8)
            ) 
                (ai_place "approach_buggers" 5))
        (sleep 2)
        (sleep_until (< (ai_living_count "approach_buggers") 1))
        (sleep_until 
            (and
                (or
                    (= (volume_test_object "vol_no_see_ramp" (player0)) true)
                    (= (volume_test_object "vol_no_see_approach" (player0)) true)
                )
                (or
                    (= (volume_test_object "vol_no_see_ramp" (player1)) true)
                    (= (volume_test_object "vol_no_see_approach" (player1)) true)
                    (= (game_can_use_flashlights) false)
                )
            )
        )
        (if (< (ai_living_count "approach_enemies") 8) 
            (ai_place "approach_buggers_too" 4))
    )
)

(script dormant void tower1_holo_looper
    (begin
        (object_create "regret03")
        (objects_attach "tower1_throne" "driver" "regret03" "")
        (ai_disregard "regret03" true)
        (sleep_until 
            (begin
                (begin_random
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant1a" true)
                            (sleep (ai_play_line_on_object "regret03" "3000"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant2b" true)
                            (sleep (ai_play_line_on_object "regret03" "3001"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant2c" true)
                            (sleep (ai_play_line_on_object "regret03" "3002"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant3a" true)
                            (sleep (ai_play_line_on_object "regret03" "3003"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant3c" true)
                            (sleep (ai_play_line_on_object "regret03" "3004"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant5a" true)
                            (sleep (ai_play_line_on_object "regret03" "3005"))
                            (sleep (random_range 240 480))
                            (set tower1_holo_chant false)
                        )
                    )
                    (if (= tower1_holo_trans false) 
                        (begin
                            (set tower1_holo_chant true)
                            (custom_animation "regret03" "objects\characters\prophet\prophet" "regret_chant6a" true)
                            (sleep (ai_play_line_on_object "regret03" "3006"))
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

(script dormant void tower1_hg_warn
    (begin
        (sleep_until 
            (and
                (= (volume_test_objects "vol_tower1_see_hg" (players)) true)
                (or
                    (objects_can_see_object (players) (list_get (ai_actors "tower1_hg_01a") 0) 30.0)
                    (objects_can_see_object (players) (list_get (ai_actors "tower1_hg_01b") 0) 30.0)
                )
            )
        )
        (ai_dialogue_enable false)
        (sleep 60)
        (print "cortana: 'watch yourself! honor-guards!'")
        (sleep (ai_play_line_on_object none "0800"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void long_pause_point
    (begin
        (sleep_until (> (ai_combat_status ai_current_actor) ai_combat_status_idle))
        (cs_aim_player true)
        (cs_custom_animation "objects\characters\elite\elite" "combat:rifle:warn" 1.0 true)
        (cs_aim_player false)
    )
)

(script dormant void tower1_start
    (begin
        (sleep_until (= (volume_test_objects "vol_tower1" (players)) true))
        (ai_disposable "approach_enemies" true)
        (data_mine_insert "05a_11_tower1_interior")
        (wake tower1_holo_looper)
        (game_save_no_timeout)
        (ai_place "tower1_hg_01a" 1)
        (ai_place "tower1_hg_01b" 1)
        (begin_random
            (if (= who_points true) 
                (begin
                    (cs_run_command_script "tower1_hg_01a" long_pause_point)
                    (ai_set_orders "tower1_hg_01a" "tower1_hg1a")
                    (cs_run_command_script "tower1_hg_01b" long_pause)
                    (ai_set_orders "tower1_hg_01b" "tower1_hg1b_back")
                    (set who_points false)
                )
            )
            (if (= who_points true) 
                (begin
                    (cs_run_command_script "tower1_hg_01a" long_pause)
                    (ai_set_orders "tower1_hg_01a" "tower1_hg1a_back")
                    (cs_run_command_script "tower1_hg_01b" long_pause_point)
                    (ai_set_orders "tower1_hg_01b" "tower1_hg1b")
                    (set who_points false)
                )
            )
        )
        (wake tower1_hg_warn)
        (sleep_until 
            (or
                (and
                    (< (ai_living_count "tower1_hg_01a") 1)
                    (< (ai_living_count "tower1_hg_01b") 1)
                )
                (= (volume_test_objects "vol_tower1_upper" (players)) true)
            )
        )
        (ai_place "tower1_hg_02a" (- 1.0 (ai_living_count "tower1_hg_01a")))
        (ai_place "tower1_hg_02b" (- 1.0 (ai_living_count "tower1_hg_01b")))
        (sleep_until (< (ai_living_count "tower1_enemies") 1) 30 8000)
        (sleep_until (= (ai_trigger_test "done_fighting" "tower1_enemies") true))
        (sleep_until (= (volume_test_objects "vol_tower1_all" (players)) true))
        (playtest_mission)
        (sleep 30)
        (sound_class_enable_ducker "" 0.0 15)
        (cinematic_fade_to_white)
        (sleep 30)
        (game_revert)
    )
)

(script command_script void temple_ent_go
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_go_to_and_face temple_ent/p2 temple_ent/p1)
        (cs_vehicle_speed 0.25)
        (cs_go_to_and_face temple_ent/p0 temple_ent/p1)
        (cs_move_in_direction 0.0 10.0 0.0)
    )
)

(script dormant void bridge_bunker_backup
    (begin
        (if (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (ai_actors "lz_warthog_01")) true) 
            (sleep_until 
                (and
                    (= (volume_test_objects "vol_bunker_parking" (ai_actors "lz_warthog_01")) true)
                    (= (ai_trigger_test "done_fighting" "lz_warthog_01") true)
                )
            ))
        (ai_vehicle_exit "all_allies")
        (ai_set_orders "all_allies" "allies_bridge_bunker")
    )
)

(script dormant void ally_order_monitor
    (begin
        (sleep_until 
            (or
                (= lz_mounted_up true)
                (= (volume_test_objects "vol_lz_all" (players)) false)
            )
        )
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_overlook_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_overlook_pause") (ai_set_orders "lz_warthog_01" "allies_overlook_follow"))
                (= (volume_test_objects "vol_overlook_pause" (players)) true)
            )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bridge_pause" (players)) true)
                (and
                    (= (volume_test_objects "vol_overlook_pause" (ai_actors "lz_warthog_01")) true)
                    (= (ai_trigger_test "done_fighting" "overlook_jackals") true)
                )
            )
        )
        (sleep_until (= (volume_test_objects "vol_bridge_pause" (players)) true) 30 300)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_bridge_follow_01")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_bridge_pause") (ai_set_orders "lz_warthog_01" "allies_bridge_follow_01"))
                (= (volume_test_objects "vol_bridge_pause" (players)) true)
            )
        )
        (sleep_until 
            (and
                (= (volume_test_objects "vol_bridge_pause" (players)) false)
                (> (player_count) 0)
            ) 
        30 300)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_bridge_follow_01")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_bridge_advance") (ai_set_orders "lz_warthog_01" "allies_bridge_follow_01"))
                (= (volume_test_objects "vol_bridge_inside_bunker" (players)) true)
            )
        )
        (ai_set_orders "ally_infantry" "allies_bridge_bunker")
        (ai_set_orders "lz_warthog_01" "allies_bridge_bunker")
        (wake bridge_bunker_backup)
        (sleep_until 
            (or
                (= bridge_pelican_arrived true)
                (= (volume_test_objects "vol_bridge_middle" (players)) true)
            )
        )
        (sleep_until 
            (or
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player0)) true)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player1)) true)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                (= (volume_test_objects "vol_bridge_middle" (players)) true)
            )
        )
        (ai_enter_squad_vehicles "all_allies")
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_bridge_follow_02")
                (ai_set_orders "bridge_tank" "allies_bridge_follow_02")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_bridge_cross") (ai_set_orders "lz_warthog_01" "allies_bridge_follow_02"))
                (or
                    (= (volume_test_objects "vol_winding_path" (players)) true)
                    (and
                        (= (volume_test_objects "vol_bridge_farside_all" (ai_actors "lz_warthog_01")) true)
                        (= (ai_trigger_test "done_fighting" "bridge_farside_enemies") true)
                    )
                )
            )
        )
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_w_path_follow")
                (ai_set_orders "bridge_tank" "allies_w_path_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_w_path_advance") (ai_set_orders "lz_warthog_01" "allies_w_path_follow"))
                (or
                    (= (volume_test_objects "vol_temple_ent_start" (players)) true)
                    (and
                        (= (volume_test_objects "vol_temple_entrance" (ai_actors "lz_warthog_01")) true)
                        (= (ai_trigger_test "done_fighting" "winding_path_enemies") true)
                    )
                )
            )
        )
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_temple_ent_follow")
                (ai_set_orders "bridge_tank" "allies_temple_ent_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_temple_ent_advance_01") (ai_set_orders "lz_warthog_01" "allies_temple_ent_follow"))
                (or
                    (= (volume_test_objects "vol_tunnel_01" (players)) true)
                    (= temple_ent_phase_01 true)
                    (and
                        (= (volume_test_objects "vol_temple_ent_03" (ai_actors "lz_warthog_01")) true)
                        (= (ai_trigger_test "done_fighting" "temple_ent_enemies_all") true)
                    )
                )
            )
        )
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_temple_ent_follow")
                (ai_set_orders "bridge_tank" "allies_temple_ent_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_temple_ent_advance_02") (ai_set_orders "lz_warthog_01" "allies_temple_ent_follow"))
                (or
                    (= (volume_test_objects "vol_tunnel_01" (players)) true)
                    (= temple_ent_phase_02 true)
                    (and
                        (= (volume_test_objects "vol_temple_ent_03" (ai_actors "lz_warthog_01")) true)
                        (= (ai_trigger_test "done_fighting" "temple_ent_enemies_all") true)
                    )
                )
            )
        )
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_temple_ent_follow")
                (ai_set_orders "bridge_tank" "allies_temple_ent_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_temple_ent_advance_03") (ai_set_orders "lz_warthog_01" "allies_temple_ent_follow"))
                (or
                    (= (volume_test_objects "vol_tunnel_01" (players)) true)
                    (and
                        (= (volume_test_objects "vol_temple_ent_03" (ai_actors "lz_warthog_01")) true)
                        (= (ai_trigger_test "done_fighting" "temple_ent_enemies_all") true)
                    )
                )
            )
        )
        (cs_run_command_script "bridge_tank/driver" temple_ent_go)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_tunnel_follow")
                (ai_set_orders "bridge_tank" "allies_tunnel_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_tunnel_advance") (ai_set_orders "lz_warthog_01" "allies_tunnel_follow"))
                (or
                    (= (volume_test_objects "vol_old_temple_near_left" (players)) true)
                    (and
                        (= (volume_test_objects "vol_tunnel_03" (ai_actors "lz_warthog_01")) true)
                        (= (ai_trigger_test "done_fighting" "tunnel_enemies_all") true)
                    )
                )
            )
        )
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_old_temple_follow")
                (ai_set_orders "bridge_tank" "allies_old_temple_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_old_temple_advance") (ai_set_orders "lz_warthog_01" "allies_old_temple_follow"))
                (or
                    (= (volume_test_objects "vol_old_temple_center_01" (players)) true)
                    (= (volume_test_objects "vol_old_temple_center_01" (ai_actors "lz_warthog_01")) true)
                )
            )
        )
        (sleep_until 
            (and
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player0)) false)
                (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "bridge_tank/driver") "scorpion_d" (player1)) false)
            )
        )
        (ai_vehicle_exit "all_allies")
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_tank/driver") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") true)
        (ai_migrate "allies_old_temple_pelican" "allies_old_temple_real")
        (ai_set_orders "all_allies" "allies_old_temp_center")
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (ai_set_orders "all_allies" "allies_grotto_suppress")
        (sleep_until (> (ai_combat_status "grotto_enemies") ai_combat_status_idle))
        (ai_set_orders "all_allies" "grotto_follow_01")
        (sleep_until (= (volume_test_objects "vol_grotto_exit" (players)) true))
        (ai_set_orders "all_allies" "allies_grotto_exit")
        (sleep_until (= (version) 1))
        (ai_set_orders "all_allies" "allies_approach")
        (sleep_until (= (volume_test_objects "vol_tower1" (players)) true))
        (ai_set_orders "all_allies" "allies_tower1")
    )
)

(script static void sleep_intro
    (begin
        (sleep_forever lz_start)
        (sleep_forever lz_turret_track)
        (sleep_forever lz_turret_reminder)
        (sleep_forever lz_pelican)
        (sleep_forever lz_pelican_wait)
        (sleep_forever lz_phantom_03_start)
    )
)

(script static void sleep_bridge
    (begin
        (sleep_forever overlook_start)
        (sleep_forever overlook_reminder)
        (sleep_forever bridges_start)
        (sleep_forever crack_spawn)
        (sleep_forever bunker_upper_spawn_01)
        (sleep_forever bunker_upper_spawn_03)
        (sleep_forever bunker_lower_spawn_01)
        (sleep_forever bunker_turret_remanning)
        (sleep_forever bunker_spawn_checker)
        (sleep_forever bridge_ghosts_by_phantom)
        (sleep_forever farside_ghosts_spawn)
        (sleep_forever bridge_phantom_reinforce_01a)
        (sleep_forever bridge_phantom_reinforce_01b)
        (sleep_forever bridge_phantom_reinforce_02a)
        (sleep_forever bridge_phantom_reinforce_02b)
        (sleep_forever bridge_cortana_comment)
        (sleep_forever bridge_wraith_warning)
        (sleep_forever bridge_activate_reminder)
        (sleep_forever bunker_holo_looper)
        (sleep_forever bridge_holo_translate)
        (sleep_forever bridge_pelican_wait)
        (sleep_forever bridge_cross_reminder)
        (sleep_forever bridge_banshee_spawn)
        (sleep_forever bridge_spare_ghost_spawn)
    )
)

(script static void sleep_winding_path
    (begin
        (sleep_forever winding_path_start)
    )
)

(script static void sleep_temple_ent
    (begin
        (sleep_forever old_temple_entrance_start)
        (sleep_forever temple_ent_ghost_alert)
        (sleep_forever temple_ent_veh_spawn)
        (sleep_forever temple_ent_reminder)
        (sleep_forever temple_ent_arch)
    )
)

(script static void sleep_tunnel
    (begin
        (sleep_forever tunnel_start)
    )
)

(script static void sleep_old_temple
    (begin
        (sleep_forever old_temple_start)
        (sleep_forever old_temple_near_right)
        (sleep_forever old_temple_far_left)
        (sleep_forever old_temple_far_right)
        (sleep_forever old_temple_below)
        (sleep_forever old_temple_center)
        (sleep_forever old_temple_courtyard)
        (sleep_forever old_temple_vehicle_spawn)
        (sleep_forever old_temple_pelican)
        (sleep_forever old_temple_phantom_01)
        (sleep_forever old_temple_phantom_02)
        (sleep_forever old_temple_turret_reman)
        (sleep_forever old_temple_perimeter_nuke)
        (sleep_forever old_temple_middle_ally)
        (sleep_forever old_temple_playfight)
        (sleep_forever old_temple_debris_comment)
        (sleep_forever old_temple_middle_comment)
        (sleep_forever old_temple_debris_reminder)
        (sleep_forever old_temple_holo_translate)
        (sleep_forever courtyard_holo_looper)
        (sleep_forever old_temple_archaeologist)
    )
)

(script static void sleep_grotto
    (begin
        (sleep_forever grotto_start)
        (sleep_forever grotto_buggers_reinforce)
        (sleep_forever grotto_cortana_comment)
        (sleep_forever grotto_ally_comments)
        (sleep_forever grotto_reminder)
        (sleep_forever grotto_pool)
        (sleep_forever grotto_extra_checkpoint)
    )
)

(script static void sleep_approach
    (begin
        (sleep_forever temple_approach_start)
        (sleep_forever approach_reminder)
    )
)

(script startup void mission
    (begin
        (cinematic_snap_to_black)
        (if (= (volume_test_objects "vol_starting_locations" (players)) true) 
            (begin
                (ui_error_ok_cancel)
                (if (cinematic_skip_start) 
                    (begin
                        (x05)
                    )
                )
                (cinematic_skip_stop)
                (cinematic_snap_to_white)
                (if (cinematic_skip_start) 
                    (begin
                        (c05_intro)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (sleep 2)
        (structure_bsp_index 0)
        (sleep 2)
        (ai_allegiance covenant prophet)
        (ai_allegiance player human)
        (objectives_finish_up_to)
        (prep_return_from_intro)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (wake 05a_title0)
        (wake objective_lz_set)
        (wake kill_volumes)
        (wake lz_start)
        (wake ally_order_monitor)
        (sleep_until (= (volume_test_objects "vol_overlook" (players)) true))
        (wake overlook_start)
        (wake bridges_start)
        (wake objective_bridge_set)
        (sleep_until (= (volume_test_objects "vol_winding_path" (players)) true))
        (wake winding_path_start)
        (wake old_temple_entrance_start)
        (wake objective_bridge_clear)
        (wake objective_ruins_set)
        (sleep_intro)
        (sleep_until (= (volume_test_objects "vol_tunnel_01" (players)) true))
        (wake tunnel_start)
        (wake old_temple_start)
        (wake old_temple_courtyard)
        (sleep_bridge)
        (sleep_winding_path)
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (wake grotto_start)
        (sleep_temple_ent)
        (sleep_tunnel)
        (sleep_until (= (volume_test_objects "vol_approach" (players)) true))
        (wake temple_approach_start)
        (wake tower1_start)
        (wake objective_ruins_clear)
        (wake objective_tower1_set)
        (sleep_old_temple)
        (sleep_until (= (volume_test_objects "vol_tower1" (players)) true))
        (sleep_grotto)
    )
)

(script static void short_allies
    (begin
        (ai_allegiance player human)
        (ai_place "lz_warthog_01")
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") warthog_g (player0))
        (ai_place_in_vehicle "allies_lz_ridge" "lz_warthog_01")
        (object_teleport (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "ally_start")
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_overlook_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_overlook_pause") (ai_set_orders "lz_warthog_01" "allies_overlook_follow"))
                (= (volume_test_objects "vol_overlook_pause" (players)) true)
            )
        )
        (sleep 30)
        (print "arrived")
        (sleep 30)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_bridge_follow_01")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_bridge_pause") (ai_set_orders "lz_warthog_01" "allies_bridge_follow_01"))
                (= (volume_test_objects "vol_bridge_pause" (players)) true)
            )
        )
        (sleep 30)
        (print "arrived")
        (sleep 30)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_bridge_follow_02")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_bridge_cross") (ai_set_orders "lz_warthog_01" "allies_bridge_follow_02"))
                (or
                    (= (volume_test_objects "vol_winding_path" (players)) true)
                    (= (volume_test_objects "vol_bridge_farside_all" (ai_actors "lz_warthog_01")) true)
                )
            )
        )
        (sleep 30)
        (print "arrived")
        (sleep 30)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_w_path_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_w_path_advance") (ai_set_orders "lz_warthog_01" "allies_w_path_follow"))
                (or
                    (= (volume_test_objects "vol_temple_ent_start" (players)) true)
                    (= (volume_test_objects "vol_temple_entrance" (ai_actors "lz_warthog_01")) true)
                )
            )
        )
        (sleep 30)
        (print "arrived")
        (sleep 30)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_temple_ent_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_temple_ent_advance_03") (ai_set_orders "lz_warthog_01" "allies_temple_ent_follow"))
                (or
                    (= (volume_test_objects "vol_tunnel_01" (players)) true)
                    (= (volume_test_objects "vol_temple_ent_03" (ai_actors "lz_warthog_01")) true)
                )
            )
        )
        (cs_run_command_script "bridge_tank/driver" temple_ent_go)
        (sleep 30)
        (print "arrived")
        (sleep 30)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_tunnel_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_tunnel_advance") (ai_set_orders "lz_warthog_01" "allies_tunnel_follow"))
                (or
                    (= (volume_test_objects "vol_old_temple_near_left" (players)) true)
                    (= (volume_test_objects "vol_tunnel_03" (ai_actors "lz_warthog_01")) true)
                )
            )
        )
        (sleep 30)
        (print "arrived")
        (sleep 30)
        (sleep_until 
            (begin
                (ai_set_orders "ally_infantry" "allies_old_temple_follow")
                (if 
                    (or
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player0)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_d" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_p" (player1)) true)
                        (= (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "warthog_g" (player1)) true)
                    ) 
                        (ai_set_orders "lz_warthog_01" "allies_old_temple_advance") (ai_set_orders "lz_warthog_01" "allies_old_temple_follow"))
                (or
                    (= (volume_test_objects "vol_old_temple_center_01" (players)) true)
                    (= (volume_test_objects "vol_old_temple_center_01" (ai_actors "lz_warthog_01")) true)
                )
            )
        )
        (sleep 30)
        (print "arrived")
        (sleep 30)
        (ai_vehicle_exit "all_allies")
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "bridge_tank/driver") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") true)
        (ai_migrate "allies_old_temple_pelican" "allies_old_temple_real")
        (ai_set_orders "all_allies" "allies_old_temp_center")
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (ai_set_orders "all_allies" "grotto_follow_01")
        (sleep_until (= (volume_test_objects "vol_grotto_exit" (players)) true))
        (ai_set_orders "all_allies" "allies_grotto_exit")
        (sleep_until (= (version) 1))
        (ai_set_orders "all_allies" "allies_approach")
        (sleep_until (= (volume_test_objects "vol_tower1" (players)) true))
        (ai_set_orders "all_allies" "allies_tower1")
    )
)

(script dormant void x05_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 4)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_x05 0 false)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad\inamberclad" 0)
        (predict_lightmap_bucket "scenarios\skies\generic\space\space" 0)
        (sleep 5)
        (predict_lightmap_bucket "objects\cinematics\effects\x05_building_debris\x05_building_debris" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\capital_ship\capital_ship" 2)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
    )
)

(script dormant void x05_02_predict
    (begin
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_leafy\tree_leafy_small\tree_leafy_small" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_door\hev_door" 0)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_hevbay\inamberclad_hevbay" 0)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 15)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_leafy\tree_leafy_small\tree_leafy_small" 0)
        (sleep 25)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (sleep 215)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "objects\cinematics\human\cigar\cigar_bent\cigar_bent" 0)
        (predict_lightmap_bucket "objects\cinematics\effects\x05_building_debris\x05_building_debris" 0)
        (sleep 215)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
    )
)

(script dormant void x05_03_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\substance_space\substance_space" 0)
        (predict_lightmap_bucket "objects\cinematics\effects\x05_building_debris\x05_building_debris" 0)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (sleep 27)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_chute\hev_chute" 0)
    )
)

(script dormant void x05_04_predict
    (begin
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_hevbay\inamberclad_hevbay" 0)
        (predict_lightmap_bucket "objects\cinematics\human\cigar\cigar_bent\cigar_bent" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 48)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 63)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (sleep 214)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\cinematics\human\cigar\cigar_bent\cigar_bent" 0)
        (sleep 13)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_chute\hev_chute" 0)
        (sleep 128)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_leafy\tree_leafy_small\tree_leafy_small" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\cinematics\human\cigar\cigar_bent\cigar_bent" 0)
        (sleep 91)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_door\hev_door" 0)
    )
)

(script dormant void x05_05_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_chute\hev_chute" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
    )
)

(script dormant void x05_06a_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_hevbay\inamberclad_hevbay" 0)
    )
)

(script dormant void x05_06b_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (sleep 121)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 238)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 0)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 1)
        (predict_lightmap_bucket "objects\characters\marine\crewman\crewman" 2)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\substance_space\substance_space" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (sleep 31)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\delta_halo_close\delta_halo_close" 0)
    )
)

(script dormant void x05_07_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x05_08_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_hevbay\inamberclad_hevbay" 0)
        (sleep 101)
        (predict_lightmap_bucket "objects\cinematics\human\inamberclad_bridge\inamberclad_bridge" 0)
        (sleep 6)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\delta_halo_close\delta_halo_close" 0)
        (sleep 66)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\substance_space\substance_space" 0)
        (sleep 40)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
    )
)

(script dormant void 05_intro_01_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\delta_islands\delta_islands" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\delta_horizon\delta_horizon" 0)
        (sleep 5)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "objects\cinematics\human\hev_reentry\hev_reentry" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_chute\hev_chute" 0)
        (sleep 75)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_chute\hev_chute" 0)
        (sleep 97)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (sleep 54)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_chute\hev_chute" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\delta_islands\delta_islands" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 106)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 0 false)
    )
)

(script dormant void 05_intro_02_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 4 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 12 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 3 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 13 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 1 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 14 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 69 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 70 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 72 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 74 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 83 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 90 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 71 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 76 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 80 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 82 true)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_door\hev_door" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_medium\tree_ancient_medium" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_large\tree_ancient_large" 1)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 59 false)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\deltatemple\sky_bsp_00\sky_bsp_00" 4)
        (sleep 5)
        (predict_lightmap_bucket "objects\vehicles\c_turret_ap\c_turret_ap" 10)
        (predict_lightmap_bucket "objects\vehicles\c_turret_ap\c_turret_ap" 11)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 8)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 9)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 10)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 11)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 10)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 11)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 12)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 13)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 14)
        (sleep 138)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 2 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 29 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 59 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 41 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 27 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 40 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 39 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 10 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 17 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 22 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 65 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 52 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 53 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 54 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 55 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 56 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 119 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_bush\tree_bush" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_branch\tree_branch" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_large\tree_ancient_large" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_leafy\tree_leafy_small\tree_leafy_small" 1)
        (sleep 76)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (sleep 60)
        (predict_lightmap_bucket "objects\weapons\melee\jackal_shield\jackal_shield" 0)
        (predict_lightmap_bucket "objects\weapons\melee\jackal_shield\jackal_shield" 1)
    )
)

(script dormant void 05_intro_03_predict
    (begin
        (sleep 4)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 2 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 76 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 10 true)
        (sleep 4)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev_door\hev_door" 0)
        (predict_lightmap_bucket "objects\characters\marine\marine" 11)
        (predict_lightmap_bucket "objects\characters\marine\marine" 15)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 16 true)
        (predict_lightmap_bucket "objects\vehicles\c_turret_ap\c_turret_ap" 10)
        (predict_lightmap_bucket "objects\vehicles\c_turret_ap\c_turret_ap" 11)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_bush\tree_bush" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 59 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 68 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 19 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 20 true)
        (predict_lightmap_bucket "objects\weapons\grenade\frag_grenade\frag_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\battle_rifle\battle_rifle" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 88 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_large\tree_ancient_large" 1)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 29 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 80 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 87 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 93 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 3 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 17 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 22 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 84 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 85 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 86 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 28 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 95 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 96 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_medium\tree_ancient_medium" 1)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 27 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 101 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 97 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 89 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 99 true)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_branch\tree_branch" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 2)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 90 true)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 73 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 94 true)
        (sleep 89)
        (predict_lightmap_bucket "scenarios\objects\special\invisible_box1x2x2\invisible_box1x2x2" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 98 true)
        (sleep 15)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 0)
        (sleep 22)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 12 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 14 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 13 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 1 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 69 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 70 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 72 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 74 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 76 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 79 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 83 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 71 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 80 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 82 true)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (predict_lightmap_bucket "objects\weapons\melee\jackal_shield\jackal_shield" 0)
        (predict_lightmap_bucket "objects\weapons\melee\jackal_shield\jackal_shield" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_medium\tree_ancient_medium" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (sleep 22)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 88 true)
        (sleep 2)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 2)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 29 false)
        (sleep 17)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 17 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 28 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 27 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 86 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 95 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 96 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 97 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 99 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 94 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 101 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 98 true)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (sleep 8)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 73 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 96 true)
        (sleep 8)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 95 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 28 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 71 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 72 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 78 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 79 true)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 81 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 27 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 101 true)
        (sleep 40)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 84 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_ancient\tree_ancient_large\tree_ancient_large" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 0)
        (predict_lightmap_bucket "objects\cinematics\human\hev\hev" 1)
        (sleep 5)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 80 true)
        (sleep 9)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 14 false)
        (sleep 12)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 29)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 62)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "objects\weapons\support_high\rocket_launcher\rocket_launcher" 2)
        (sleep 65)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 4 false)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 3 false)
        (sleep 47)
        (predict_bitmap scenarios\solo\05a_deltaapproach\bsp_00 3 false)
    )
)

(script static void teleport_bridge
    (begin
        (ai_erase_all)
        (ai_place "lz_warthog_01")
        (device_set_position "da_bridge" 0.5)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") warthog_d (player0))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") warthog_p (player1))
        (ai_place_in_vehicle "allies_lz_ledge" "lz_warthog_01")
        (object_teleport (ai_vehicle_get_from_starting_location "lz_warthog_01/driver") "bridge_player0")
        (sleep_forever mission)
        (sleep_intro)
        (garbage_collect_now)
        (game_save_no_timeout)
        (ai_set_orders "lz_warthog_01" "allies_bridge_pause")
        (wake bridges_start)
        (sleep_until (= (volume_test_objects "vol_winding_path" (players)) true))
        (wake winding_path_start)
        (wake old_temple_entrance_start)
        (sleep_until (= (volume_test_objects "vol_tunnel_01" (players)) true))
        (wake tunnel_start)
        (wake old_temple_start)
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (wake grotto_start)
        (sleep_until (= (volume_test_objects "vol_approach" (players)) true))
        (wake temple_approach_start)
        (wake tower1_start)
    )
)

(script static void teleport_winding_path
    (begin
        (ai_erase_all)
        (ai_place "bridge_tank")
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_tank/driver") scorpion_d (player0))
        (object_teleport (ai_vehicle_get_from_starting_location "bridge_tank/driver") "winding_path_player0")
        (ai_set_orders "all_allies" "allies_w_path_follow")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_bridge)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake winding_path_start)
        (wake old_temple_entrance_start)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep_until (= (volume_test_objects "vol_tunnel_01" (players)) true))
        (wake tunnel_start)
        (wake old_temple_start)
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (wake grotto_start)
        (sleep_until (= (volume_test_objects "vol_approach" (players)) true))
        (wake temple_approach_start)
        (wake tower1_start)
    )
)

(script static void teleport_temple_ent
    (begin
        (ai_erase_all)
        (ai_place "bridge_tank")
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_tank/driver") scorpion_d (player0))
        (object_teleport (ai_vehicle_get_from_starting_location "bridge_tank/driver") "temple_ent_player0")
        (ai_set_orders "all_allies" "temple_ent_all")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_bridge)
        (sleep_winding_path)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake old_temple_entrance_start)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep_until (= (volume_test_objects "vol_tunnel_01" (players)) true))
        (wake tunnel_start)
        (wake old_temple_start)
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (wake grotto_start)
        (sleep_until (= (volume_test_objects "vol_approach" (players)) true))
        (wake temple_approach_start)
        (wake tower1_start)
    )
)

(script static void teleport_tunnel
    (begin
        (ai_erase_all)
        (ai_place "bridge_tank")
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_tank/driver") scorpion_d (player0))
        (object_teleport (ai_vehicle_get_from_starting_location "bridge_tank/driver") "tunnel_player0")
        (ai_set_orders "all_allies" "allies_tunnel_follow")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_bridge)
        (sleep_winding_path)
        (sleep_temple_ent)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake tunnel_start)
        (wake old_temple_start)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (wake grotto_start)
        (sleep_until (= (volume_test_objects "vol_approach" (players)) true))
        (wake temple_approach_start)
        (wake tower1_start)
    )
)

(script static void teleport_old_temple
    (begin
        (ai_erase_all)
        (ai_place "bridge_tank")
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "bridge_tank/driver") scorpion_d (player0))
        (object_teleport (ai_vehicle_get_from_starting_location "bridge_tank/driver") "old_temple_player0")
        (ai_set_orders "all_allies" "allies_old_temple_follow")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_bridge)
        (sleep_winding_path)
        (sleep_temple_ent)
        (sleep_tunnel)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake old_temple_start)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep 1)
        (wake ally_order_monitor)
        (sleep_until (= (volume_test_objects "vol_grotto" (players)) true))
        (wake grotto_start)
        (sleep_until (= (volume_test_objects "vol_approach" (players)) true))
        (wake temple_approach_start)
        (wake tower1_start)
    )
)

(script static void teleport_grotto
    (begin
        (ai_erase_all)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "grotto_player0")
        (object_teleport (player1) "grotto_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_bridge)
        (sleep_winding_path)
        (sleep_temple_ent)
        (sleep_tunnel)
        (sleep_old_temple)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake grotto_start)
        (sleep_until (= (volume_test_objects "vol_approach" (players)) true))
        (wake temple_approach_start)
        (wake tower1_start)
    )
)

(script static void teleport_approach
    (begin
        (ai_erase_all)
        (structure_bsp_index 1)
        (sleep 1)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "approach_player0")
        (object_teleport (player1) "approach_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_bridge)
        (sleep_winding_path)
        (sleep_temple_ent)
        (sleep_tunnel)
        (sleep_old_temple)
        (sleep_grotto)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake temple_approach_start)
        (wake tower1_start)
    )
)

(script static void teleport_tower1
    (begin
        (ai_erase_all)
        (structure_bsp_index 1)
        (sleep 1)
        (unit_add_equipment (player0) "profile_1" true true)
        (unit_add_equipment (player1) "profile_1" true true)
        (object_teleport (player0) "tower1_player0")
        (object_teleport (player1) "tower1_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_bridge)
        (sleep_winding_path)
        (sleep_temple_ent)
        (sleep_tunnel)
        (sleep_old_temple)
        (sleep_grotto)
        (sleep_approach)
        (garbage_collect_now)
        (game_save_no_timeout)
        (wake tower1_start)
    )
)

