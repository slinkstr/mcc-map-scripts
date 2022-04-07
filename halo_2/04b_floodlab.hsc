; Decompiled with Blamite
; Source file: 04b_floodlab.hsc
; Start time: 4/7/2022 7:17:12
; Decompilation finished in ~0.0068158s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean plummeting false)
(global boolean holo_drone_arrived false)
(global boolean hl_done_talking false)
(global boolean done_shooting_holo false)
(global boolean mess_react_01_go false)
(global boolean mess_react_02_go false)
(global boolean mess_react_01_done false)
(global boolean mess_react_02_done false)
(global boolean holo_ally_01_go false)
(global boolean holo_ally_02_go false)
(global boolean holo_ally_03_go false)
(global boolean holo_ally_01_done false)
(global boolean holo_ally_02_done false)
(global boolean holo_ally_03_done false)
(global boolean silo_killer_power true)
(global boolean silo_almost_there false)
(global short silo_sentinels_total 0)
(global short silo_flood_total 0)
(global boolean silo_try_save false)
(global short lab_flood_count 0)
(global boolean bridge_final_gone false)
(global boolean comm_farewell_done false)
(global boolean soe_farewell_done false)
(global boolean bug_out_phantom_here false)
(global effect stress "effects\scenery\sparks\sparking_light")
(global effect boom "effects\scenarios\solo\alphagasgiant\wall_explosion")
(global real gravity 0.0)
(global boolean cables_cuttable true)
(global boolean in_cable_room false)
(global short croom_sen_total 0)
(global short croom_flood_total 0)
(global short croom_flood_desired 6)
(global short croom_sen_desired 4)
(global short cable_var 0)
(global effect gasleak "effects\scenarios\solo\alphagasgiant\gas_leak")
(global effect big_boom "effects\scenarios\solo\alphagasgiant\wall_explosion")
(global short plummet_junk_total 0)
(global boolean cinematic_shooting_done false)
(global boolean banshee_sin_01_ready false)
(global boolean banshee_sin_02_ready false)
(global boolean monitor_done_talking true)
(global boolean monitor_available true)
(global boolean boss_done_talking true)
(global boolean final_hl_boss_dead false)
(global object heretic_leader none)
(global boolean more_hl_orders false)
(global boolean more_holo1_orders false)
(global boolean more_holo2_orders false)
(global object holo1 none)
(global object holo2 none)
(global object holo3 none)
(global object holo4 none)
(global effect holo_death "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_death")
(global boolean holo_drones_nuke false)
(global short hl_times_dead 0)
(global short hl_lives_total 0)
(global short hl_drone_total 2)


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

(script static void 04_intra0_predict_stub
    (begin
        (wake 04_intra0_predict)
    )
)

(script static void 04_intra1_01_predict_stub
    (begin
        (wake 04_intra1_01_predict)
    )
)

(script static void 04_intra1_02_predict_stub
    (begin
        (wake 04_intra1_02_predict)
    )
)

(script static void 04_outro1_01_predict_stub
    (begin
        (wake 04_outro1_01_predict)
    )
)

(script static void 04_outro1_02_predict_stub
    (begin
        (wake 04_outro1_02_predict)
    )
)

(script stub void 04_outro1_03_predict_stub
    (begin
        (print "predict 03")
    )
)

(script static void 04_outro2_01_predict_stub
    (begin
        (wake 04_outro2_01_predict)
    )
)

(script static void 04_outro2_02_predict_stub
    (begin
        (wake 04_outro2_02_predict)
    )
)

(script dormant void c04_intra0_score_01
    (begin
        (sleep 369)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intra0\music\c04_intra0_01_mus" none 1.0)
        (print "c04_intra0 score 01 start")
    )
)

(script dormant void c04_intra0_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intra0\foley\c04_intra0_01_fol" none 1.0)
        (print "c04_intra1 foley 01 start")
    )
)

(script dormant void c04_1230_der
    (begin
        (sleep 467)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1230_der" "dervish_intra0" 1.0)
        (attract_mode_set_seconds "c04_1230_der" 1.0)
    )
)

(script dormant void c04_1240_soc
    (begin
        (sleep 493)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1240_soc" "commander_intra0" 1.0)
        (attract_mode_set_seconds "c04_1240_soc" 3.0)
    )
)

(script dormant void c04_intra0_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 55.0 138.0 0.26 0.24 0.15)
        (cinematic_lighting_set_secondary_light -28.0 358.0 0.08 0.08 0.11)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
        (object_uses_cinematic_lighting "dervish_intra0" true)
        (object_uses_cinematic_lighting "commander_intra0" true)
        (object_uses_cinematic_lighting "elite_intra0_01" true)
        (object_uses_cinematic_lighting "elite_intra0_02" true)
        (object_uses_cinematic_lighting "grunt_intra0_01" true)
        (object_uses_cinematic_lighting "grunt_intra0_02" true)
        (object_uses_cinematic_lighting "pr_intra0_der" true)
        (object_uses_cinematic_lighting "eb_intra0_soc" true)
        (object_uses_cinematic_lighting "pr_intra0_soe_01" true)
        (object_uses_cinematic_lighting "pr_intra0_soe_02" true)
        (object_uses_cinematic_lighting "pr_intra0_soe_03" true)
        (object_uses_cinematic_lighting "pp_intra0_sog_01" true)
        (object_uses_cinematic_lighting "pp_intra0_sog_02" true)
    )
)

(script dormant void soc_blade_activate
    (begin
        (sleep 5)
        (object_set_permutation "eb_intra0_soc" "blade" "default")
        (print "blade activate")
    )
)

(script static void c04_intra0_setup
    (begin
        (object_create_anew "dervish_intra0")
        (object_create_anew "commander_intra0")
        (object_create_anew_containing "elite_intra0")
        (object_create_anew_containing "grunt_intra0")
        (object_create_anew "eb_intra0_soc")
        (object_create_anew "pr_intra0_soe_01")
        (object_create_anew "pr_intra0_soe_02")
        (object_create_anew "pr_intra0_soe_03")
        (object_create_anew "pp_intra0_sog_01")
        (object_create_anew "pp_intra0_sog_02")
        (object_cinematic_lod "dervish_intra0" true)
        (object_cinematic_lod "commander_intra0" true)
        (object_cinematic_lod "elite_intra0_01" true)
        (object_cinematic_lod "elite_intra0_02" true)
        (object_cinematic_lod "grunt_intra0_01" true)
        (object_cinematic_lod "grunt_intra0_02" true)
        (object_cinematic_lod "eb_intra0_soc" true)
        (object_cinematic_lod "pr_intra0_soe_01" true)
        (object_cinematic_lod "pr_intra0_soe_02" true)
        (object_cinematic_lod "pr_intra0_soe_03" true)
        (object_cinematic_lod "pp_intra0_sog_01" true)
        (object_cinematic_lod "pp_intra0_sog_02" true)
        (ice_cream_flavor_stock "dervish_intra0" "right_hand_elite" "")
        (objects_attach "commander_intra0" "right_hand_elite" "eb_intra0_soc" "")
        (objects_attach "elite_intra0_01" "right_hand_elite" "pr_intra0_soe_01" "")
        (objects_attach "elite_intra0_01" "left_hand_elite" "pr_intra0_soe_02" "")
        (objects_attach "elite_intra0_02" "right_hand_elite" "pr_intra0_soe_03" "")
        (objects_attach "grunt_intra0_01" "right_hand" "pp_intra0_sog_01" "")
        (objects_attach "grunt_intra0_02" "right_hand" "pp_intra0_sog_02" "")
        (wake c04_intra0_score_01)
        (wake c04_intra0_foley_01)
        (wake c04_1230_der)
        (wake c04_1240_soc)
        (wake soc_blade_activate)
        (wake c04_intra0_cinematic_light_01)
    )
)

(script static void c04_intra0
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (predict_model_section false)
        (sound_class_enable_ducker "device" 0.2 0)
        (crash alphagasgiant)
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "floodlab_intra0")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (04_intra0_predict_stub)
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intra0\music\c04_intra0_01_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intra0\foley\c04_intra0_01_fol")
        (sleep prediction_offset)
        (c04_intra0_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intra0\04_intra0" "04_intra0" none "anchor_flag_intra0")
        (custom_animation_relative "dervish_intra0" "objects\characters\dervish\04_intra0\04_intra0" "dervish" false "anchor_intra0")
        (custom_animation_relative "commander_intra0" "objects\characters\elite\04_intra0\04_intra0" "commander" false "anchor_intra0")
        (custom_animation_relative "elite_intra0_01" "objects\characters\elite\04_intra0\04_intra0" "elite01" false "anchor_intra0")
        (custom_animation_relative "elite_intra0_02" "objects\characters\elite\04_intra0\04_intra0" "elite02" false "anchor_intra0")
        (custom_animation_relative "grunt_intra0_01" "objects\characters\grunt\04_intra0\04_intra0" "grunt01" false "anchor_intra0")
        (custom_animation_relative "grunt_intra0_02" "objects\characters\grunt\04_intra0\04_intra0" "grunt02" false "anchor_intra0")
        (cinematic_start 1.0 1.0 1.0 15)
        (device_set_power "arm_02_entry_ext" 0.0)
        (sleep 30)
        (device_set_power "arm_02_entry_ext" 1.0)
        (device_set_position "arm_02_entry_ext" 1.0)
        (sleep 563)
        (device_group_change_only_once_more_set "04_intra0" false)
        (device_set_position "arm_02_entry_ext" 0.0)
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (object_destroy_containing "intra0")
        (sound_class_enable_ducker "device" 0.0 30)
        (sound_class_enable_ducker "amb" 0.0 30)
        (sleep 30)
    )
)

(script dormant void c04_intra1_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intra1\foley\c04_intra1_01_fol" none 1.0)
        (print "c04_intra1 foley 01 start")
    )
)

(script dormant void c04_2010_her
    (begin
        (sleep 45)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2010_her" "heretic_leader" 1.0)
        (attract_mode_set_seconds "c04_2010_her" 2.5)
    )
)

(script dormant void c04_2020_her
    (begin
        (sleep 121)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2020_her" "heretic_leader" 1.0)
        (attract_mode_set_seconds "c04_2020_her" 2.0)
    )
)

(script dormant void c04_2030_soc
    (begin
        (sleep 249)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2030_soc" none 1.0)
        (attract_mode_set_seconds "c04_2030_soc" 1.0)
    )
)

(script dormant void scale_hologram
    (begin
        (sleep 615)
        (object_set_scale "gasmine_hologram" 0.525 0)
        (print "scale hologram")
    )
)

(script dormant void effect_shield_impact
    (begin
        (sleep 185)
        (print "effect - shield impact")
        (effect_new "effects\impact\impact_bullet_medium\energy_shield_thin_cov" "flag_shield_impact")
    )
)

(script dormant void c04_intra1_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 55.0 138.0 0.26 0.24 0.15)
        (cinematic_lighting_set_secondary_light -28.0 358.0 0.08 0.08 0.11)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
        (object_uses_cinematic_lighting "dervish02" true)
        (object_uses_cinematic_lighting "heretic_leader" true)
    )
)

(script static void c04_intra1_02_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "dervish02b")
        (object_create_anew "commander")
        (object_create_anew "elite01")
        (object_create_anew "elite02")
        (object_create_anew "intra1_blade")
        (object_create_anew "intra1_rifle_01")
        (object_create_anew "intra1_rifle_02")
        (object_cinematic_lod "dervish02b" true)
        (object_cinematic_lod "commander" true)
        (object_cinematic_lod "elite01" true)
        (object_cinematic_lod "elite02" true)
        (object_cinematic_lod "intra1_blade" true)
        (object_cinematic_lod "intra1_rifle_01" true)
        (object_cinematic_lod "intra1_rifle_02" true)
        (ice_cream_flavor_stock "dervish02b" "right_hand_elite" "")
        (objects_attach "commander" "right_hand_elite" "intra1_blade" "")
        (objects_attach "elite01" "right_hand_elite" "intra1_rifle_01" "")
        (objects_attach "elite02" "right_hand_elite" "intra1_rifle_02" "")
    )
)

(script static void c04_intra1_01_setup
    (begin
        (object_create_anew "dervish02")
        (object_create_anew "heretic_leader")
        (object_cinematic_lod "dervish02" true)
        (object_cinematic_lod "heretic_leader" true)
        (ice_cream_flavor_stock "dervish02" "left_hand_elite" "")
        (wake c04_intra1_foley_01)
        (wake c04_2010_her)
        (wake c04_2020_her)
        (wake c04_2030_soc)
        (wake scale_hologram)
        (wake effect_shield_impact)
        (wake c04_intra1_cinematic_light_01)
    )
)

(script static void c04_intra1_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "floodlab_intra1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 70.0 0)
        (online_message_send)
        (04_intra1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intra1\foley\c04_intra1_01_fol")
        (sleep prediction_offset)
        (c04_intra1_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intra1\04_intra1" "04_intra1_01" none "cinematic_anchor02")
        (custom_animation_relative "dervish02" "objects\characters\dervish\04_intra1\04_intra1" "dervish_01" false "anchor02")
        (custom_animation_relative "heretic_leader" "objects\characters\heretic\04_intra1\04_intra1" "heretic_01" false "anchor02")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep 165)
        (device_set_position "control_shield_door" 0.0)
        (sleep (- (camera_set_pan) prediction_offset))
        (04_intra1_02_predict_stub)
        (c04_intra1_02_problem_actors)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intra1\foley\c04_intra1_02_fol")
        (sleep (camera_set_pan))
        (object_destroy "dervish02")
        (object_set_scale "gasmine_hologram" 1.0 0)
        (print "scale hologram")
    )
)

(script dormant void c04_intra1_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intra1\foley\c04_intra1_02_fol" none 1.0)
        (print "c04_intra1 foley 02 start")
    )
)

(script dormant void c04_2031_soc
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2031_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_2031_soc" 1.0)
    )
)

(script dormant void c04_2040_soc
    (begin
        (sleep 96)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2040_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_2040_soc" 3.0)
    )
)

(script dormant void c04_2050_soc
    (begin
        (sleep 178)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2050_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_2050_soc" 1.5)
    )
)

(script dormant void c04_2060_der
    (begin
        (sleep 229)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2060_der" "dervish02b" 1.0)
        (attract_mode_set_seconds "c04_2060_der" 2.0)
    )
)

(script dormant void c04_2070_soc
    (begin
        (sleep 292)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2070_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_2070_soc" 1.0)
    )
)

(script dormant void c04_2080_der
    (begin
        (sleep 335)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2080_der" "dervish02b" 1.0)
        (attract_mode_set_seconds "c04_2080_der" 3.5)
    )
)

(script dormant void c04_2090_der
    (begin
        (sleep 482)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_2090_der" "dervish02b" 1.0)
        (attract_mode_set_seconds "c04_2090_der" 2.0)
    )
)

(script dormant void c04_intra1_cinematic_light_02
    (begin
        (cinematic_lighting_set_primary_light 55.0 138.0 0.26 0.24 0.15)
        (cinematic_lighting_set_secondary_light -28.0 358.0 0.08 0.08 0.11)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
        (object_uses_cinematic_lighting "dervish02b" true)
        (object_uses_cinematic_lighting "commander" true)
        (object_uses_cinematic_lighting "elite01" true)
        (object_uses_cinematic_lighting "elite02" true)
    )
)

(script static void c04_intra1_02_setup
    (begin
        (wake c04_intra1_foley_02)
        (wake c04_2031_soc)
        (wake c04_2040_soc)
        (wake c04_2050_soc)
        (wake c04_2060_der)
        (wake c04_2070_soc)
        (wake c04_2080_der)
        (wake c04_2090_der)
        (wake c04_intra1_cinematic_light_02)
    )
)

(script static void c04_intra1_02_cleanup
    (begin
        (object_destroy "dervish02b")
        (object_destroy "commander")
        (object_destroy "elite01")
        (object_destroy "elite02")
        (object_destroy_containing "intra1")
    )
)

(script static void c04_intra1_02
    (begin
        (c04_intra1_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intra1\04_intra1" "04_intra1_02" none "cinematic_anchor02")
        (custom_animation_relative "dervish02b" "objects\characters\dervish\04_intra1\04_intra1" "dervish_02" false "anchor02")
        (custom_animation_relative "commander" "objects\characters\elite\04_intra1\04_intra1" "soc_02" false "anchor02")
        (custom_animation_relative "elite01" "objects\characters\elite\04_intra1\04_intra1" "elite01_02" false "anchor02")
        (custom_animation_relative "elite02" "objects\characters\elite\04_intra1\04_intra1" "elite02_02" false "anchor02")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (sound_class_enable_ducker "amb" 0.0 15)
        (sleep 15)
        (c04_intra1_02_cleanup)
    )
)

(script static void c04_intra1
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (animation_cache_flush)
        (sound_cache_flush)
        (crash alphagasgiant)
        (sleep 1)
        (c04_intra1_01)
        (c04_intra1_02)
        (sleep 30)
    )
)

(script dormant void c04_outro1_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_outro1\music\c04_outro1_01_mus" none 1.0)
        (print "c04_outro1 score 01 start")
    )
)

(script dormant void c04_outro1_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_outro1\foley\c04_outro1_01_fol" none 1.0)
        (print "c04_outro1 foley 01 start")
    )
)

(script dormant void c04_3010_der
    (begin
        (sleep 118)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3010_der" "dervish_03" 1.0)
        (attract_mode_set_seconds "c04_3010_der" 1.5)
    )
)

(script dormant void c04_3020_her
    (begin
        (sleep 197)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3020_her" "heretic_leader" 1.0)
        (attract_mode_set_seconds "c04_3020_her" 1.0)
    )
)

(script dormant void c04_3030_her
    (begin
        (sleep 243)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3030_her" "heretic_leader" 1.0)
        (attract_mode_set_seconds "c04_3030_her" 4.5)
    )
)

(script dormant void c04_3040_der
    (begin
        (sleep 385)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3040_der" "dervish_03" 1.0)
        (attract_mode_set_seconds "c04_3040_der" 2.0)
    )
)

(script dormant void c04_outro1_01_dof
    (begin
        (rasterizer_profile_include_all)
        (sleep 382)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 1.5 1.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
    )
)

(script dormant void c04_outro1_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 55.0 138.0 0.26 0.24 0.15)
        (cinematic_lighting_set_secondary_light -28.0 358.0 0.08 0.08 0.11)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
        (object_uses_cinematic_lighting "dervish_03" true)
        (object_uses_cinematic_lighting "heretic_leader" true)
        (object_uses_cinematic_lighting "outro_seraph" true)
    )
)

(script static void c04_outro1_01_setup
    (begin
        (object_destroy "seraph")
        (object_create "outro_seraph")
        (object_create_anew "dervish_03")
        (object_create_anew "heretic_leader")
        (object_cinematic_lod "dervish_03" true)
        (object_cinematic_lod "heretic_leader" true)
        (ice_cream_flavor_stock "dervish_03" "right_hand_elite" "")
        (wake c04_outro1_score_01)
        (wake c04_outro1_foley_01)
        (wake c04_3010_der)
        (wake c04_3020_her)
        (wake c04_3030_her)
        (wake c04_3040_der)
        (wake c04_outro1_01_dof)
        (wake c04_outro1_cinematic_light_01)
    )
)

(script static void c04_outro1_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "floodlab_outro1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (04_outro1_01_predict_stub)
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_outro1\music\c04_outro1_01_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_outro1\foley\c04_outro1_01_fol")
        (sleep prediction_offset)
        (c04_outro1_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_outro1\04_outro1" "04_outro1_01" none "anchor_flag_seraph")
        (custom_animation_relative "dervish_03" "objects\characters\dervish\04_outro1\04_outro1" "dervish_01" false "anchor02")
        (custom_animation_relative "heretic_leader" "objects\characters\heretic\04_outro1\04_outro1" "heretic_01" false "anchor02")
        (scenery_animation_start_relative "outro_seraph" "scenarios\objects\vehicles\c_seraph\c_seraph" "04_outro1_01" "anchor_seraph")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (04_outro1_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_outro1\foley\c04_outro1_02_fol")
        (sleep (camera_set_pan))
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void c04_outro1_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_outro1\foley\c04_outro1_02_fol" none 1.0)
        (print "c04_outro1 foley 02 start")
    )
)

(script dormant void c04_3050_der
    (begin
        (sleep 132)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3050_der" "dervish_03" 1.0)
        (attract_mode_set_seconds "c04_3050_der" 1.5)
    )
)

(script dormant void c04_3060_gsp
    (begin
        (sleep 190)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3060_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c04_3060_gsp" 6.0)
    )
)

(script dormant void c04_3070_her
    (begin
        (sleep 363)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3070_her" "heretic_leader" 1.0)
        (attract_mode_set_seconds "c04_3070_her" 5.0)
    )
)

(script dormant void c04_3080_gsp
    (begin
        (sleep 516)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3080_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c04_3080_gsp" 3.5)
    )
)

(script dormant void c04_outro1_cinematic_light_02
    (begin
        (cinematic_lighting_set_primary_light 55.0 138.0 0.26 0.24 0.15)
        (cinematic_lighting_set_secondary_light -28.0 358.0 0.08 0.08 0.11)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
        (object_uses_cinematic_lighting "monitor" true)
    )
)

(script dormant void heretic_leader_fire_rifles
    (begin
        (object_create_anew "hl_rifle_01")
        (object_create_anew "hl_rifle_02")
        (sleep 623)
        (objects_attach "heretic_leader" "right_hand_elite" "hl_rifle_01" "")
        (objects_attach "heretic_leader" "left_hand_elite" "hl_rifle_02" "")
        (sleep 1)
        (weapon_hold_trigger "hl_rifle_01" 0 true)
        (weapon_hold_trigger "hl_rifle_02" 0 true)
        (print "heretic rifles fire")
        (sleep 85)
        (weapon_hold_trigger "hl_rifle_01" 0 false)
        (weapon_hold_trigger "hl_rifle_02" 0 false)
        (print "heretic rifles stop")
    )
)

(script dormant void effect_jetpack
    (begin
        (sleep 735)
        (print "jetpack on")
        (object_set_function_variable "heretic_leader" "vertical_thrust" 1.0 0.0)
        (sleep 154)
        (object_set_function_variable "heretic_leader" "vertical_thrust" 0.0 0.0)
    )
)

(script static void c04_outro1_02_setup
    (begin
        (object_create_anew "monitor")
        (object_cinematic_lod "monitor" true)
        (wake c04_outro1_foley_02)
        (wake c04_3050_der)
        (wake c04_3060_gsp)
        (wake c04_3070_her)
        (wake c04_3080_gsp)
        (wake heretic_leader_fire_rifles)
        (wake effect_jetpack)
    )
)

(script static void c04_outro1_02
    (begin
        (c04_outro1_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_outro1\04_outro1" "04_outro1_02" none "anchor_flag_seraph")
        (custom_animation_relative "dervish_03" "objects\characters\dervish\04_outro1\04_outro1" "dervish_02" false "anchor02")
        (custom_animation_relative "monitor" "objects\characters\monitor\04_outro1\04_outro1" "monitor_02" false "anchor02")
        (custom_animation_relative "heretic_leader" "objects\characters\heretic\04_outro1\04_outro1" "heretic_02" false "anchor02")
        (scenery_animation_start_relative "outro_seraph" "scenarios\objects\vehicles\c_seraph\c_seraph" "04_outro1_02" "anchor_seraph")
        (sleep (- (camera_set_pan) prediction_offset))
        (04_outro1_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_outro1\foley\c04_outro1_03_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c04_outro1_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_outro1\foley\c04_outro1_03_fol" none 1.0)
        (print "c04_outro1 foley 01 start")
    )
)

(script dormant void c04_3090_her
    (begin
        (sleep 29)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3090_her" "heretic_leader" 1.0)
        (attract_mode_set_seconds "c04_3090_her" 2.0)
    )
)

(script dormant void c04_3100_her
    (begin
        (sleep 108)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_3100_her" "heretic_leader" 1.0)
        (attract_mode_set_seconds "c04_3100_her" 2.5)
    )
)

(script dormant void effect_drone_activate
    (begin
        (sleep 162)
        (effect_new_on_object_marker "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_activate" "holo_drone_1" "light")
        (print "effect - drone 1")
        (sleep 13)
        (effect_new_on_object_marker "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_activate" "holo_drone_2" "light")
        (print "effect - drone 2")
    )
)

(script dormant void effect_holograms_appear
    (begin
        (sleep 477)
        (effect_new_on_object_marker "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_holo_on_cinematic" "holo_base_1" "marker")
        (print "effect - hologram 1")
        (sleep 18)
        (effect_new_on_object_marker "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_holo_on_cinematic" "holo_base_2" "marker")
        (print "effect - hologram 2")
    )
)

(script dormant void arm_holograms
    (begin
        (rasterizer_profile_include_all)
        (sleep 546)
        (object_create_anew_containing "holo_rifle")
        (objects_attach "hologram01" "right_hand_elite" "holo_rifle_01" "")
        (objects_attach "hologram01" "left_hand_elite" "holo_rifle_02" "")
        (objects_attach "hologram02" "right_hand_elite" "holo_rifle_03" "")
        (objects_attach "hologram02" "left_hand_elite" "holo_rifle_04" "")
    )
)

(script static void c04_outro1_03_setup
    (begin
        (object_create_anew "holo_base_1")
        (object_create_anew "holo_base_2")
        (object_create_anew "holo_drone_1")
        (object_create_anew "holo_drone_2")
        (object_cinematic_lod "holo_drone_1" true)
        (object_cinematic_lod "holo_drone_2" true)
        (object_destroy "hl_rifle_01")
        (object_destroy "hl_rifle_02")
        (wake c04_outro1_foley_03)
        (wake c04_3090_her)
        (wake c04_3100_her)
        (wake arm_holograms)
        (wake effect_drone_activate)
        (wake effect_holograms_appear)
    )
)

(script static void c04_outro1_03_cleanup
    (begin
        (object_destroy "dervish_03")
        (object_destroy "heretic_leader")
        (object_destroy "monitor")
        (object_destroy "hologram01")
        (object_destroy "hologram02")
        (object_destroy "holo_drone_1")
        (object_destroy "holo_drone_2")
        (object_destroy_containing "holo_rifle")
    )
)

(script dormant void c04_outro1_03_holo1
    (begin
        (sleep 478)
        (object_create_anew "hologram01")
        (object_cinematic_lod "hologram01" true)
        (custom_animation_relative "hologram01" "objects\characters\heretic\04_outro1\04_outro1" "holo1_03" false "anchor02")
    )
)

(script dormant void c04_outro1_03_holo2
    (begin
        (sleep 490)
        (object_create_anew "hologram02")
        (object_cinematic_lod "hologram02" true)
        (custom_animation_relative "hologram02" "objects\characters\heretic\04_outro1\04_outro1" "holo2_03" false "anchor02")
    )
)

(script static void c04_outro1_03
    (begin
        (c04_outro1_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_outro1\04_outro1" "04_outro1_03" none "anchor_flag_seraph")
        (custom_animation_relative "dervish_03" "objects\characters\dervish\04_outro1\04_outro1" "dervish_03" false "anchor02")
        (custom_animation_relative "heretic_leader" "objects\characters\heretic\04_outro1\04_outro1" "heretic_03" false "anchor02")
        (custom_animation_relative "monitor" "objects\characters\monitor\04_outro1\04_outro1" "monitor_03" false "anchor02")
        (scenery_animation_start_relative "outro_seraph" "scenarios\objects\vehicles\c_seraph\c_seraph" "04_outro1_03" "anchor_seraph")
        (scenery_animation_start_relative "holo_drone_1" "scenarios\objects\solo\alphagasgiant\holo_drone\holo_drone" "outro1_01" "anchor02")
        (scenery_animation_start_relative "holo_drone_2" "scenarios\objects\solo\alphagasgiant\holo_drone\holo_drone" "outro1_02" "anchor02")
        (wake c04_outro1_03_holo1)
        (wake c04_outro1_03_holo2)
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c04_outro1_03_cleanup)
        (sound_class_enable_ducker "amb" 0.0 30)
        (sleep 30)
    )
)

(script static void c04_outro1
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (animation_cache_flush)
        (sound_cache_flush)
        (predict_model_section false)
        (sound_class_enable_ducker "amb" 0.5 0)
        (crash production_arm2)
        (sleep 1)
        (c04_outro1_01)
        (c04_outro1_02)
        (c04_outro1_03)
    )
)

(script dormant void c04_outro2_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_outro2\music\c04_outro2_01_mus" none 1.0)
        (print "c04_outro2 score 01 start")
    )
)

(script dormant void c04_outro2_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_outro2\foley\c04_outro2_01_fol" none 1.0)
        (print "c04_outro2 foley 01 start")
    )
)

(script dormant void c04_9110_gsp
    (begin
        (sleep 32)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_9110_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c04_9110_gsp" 3.5)
    )
)

(script dormant void c04_9120_der
    (begin
        (sleep 133)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_9120_der" "dervish_03" 1.0)
        (attract_mode_set_seconds "c04_9120_der" 5.0)
    )
)

(script dormant void c04_9130_gsp
    (begin
        (sleep 274)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_9130_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c04_9130_gsp" 5.5)
        (sleep 150)
        (unit_set_emotional_state "dervish_03" "shocked" 0.75 30)
    )
)

(script dormant void effect_monitor_scramble
    (begin
        (sleep 423)
        (print "effect - monitor scramble")
        (effect_new_on_object_marker "effects\objects\characters\brute\hammer_grappling" "monitor" "body")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (hud_blink_health 1.5)
    )
)

(script dormant void c04_outro2_cinematic_light_01
    (begin
        (cinematic_lighting_set_primary_light 55.0 138.0 0.26 0.24 0.15)
        (cinematic_lighting_set_secondary_light -28.0 358.0 0.08 0.08 0.11)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
        (object_uses_cinematic_lighting "dervish_03" true)
        (object_uses_cinematic_lighting "heretic_leader" true)
        (object_uses_cinematic_lighting "monitor" true)
    )
)

(script static void c04_outro2_01_setup
    (begin
        (object_destroy "hangar_door_ingame")
        (object_create_anew "hangar_door_cinematic")
        (device_set_position "hangar_door_cinematic" 1.0)
        (object_create_anew "dervish_03")
        (object_create_anew "heretic_leader")
        (object_create_anew "monitor")
        (object_cinematic_lod "dervish_03" true)
        (object_cinematic_lod "heretic_leader" true)
        (object_cinematic_lod "monitor" true)
        (object_set_function_variable "heretic_leader" "alive" 0.0 0.0)
        (wake c04_outro2_score_01)
        (wake c04_outro2_foley_01)
        (wake c04_9110_gsp)
        (wake c04_9120_der)
        (wake c04_9130_gsp)
        (wake effect_monitor_scramble)
        (wake c04_outro2_cinematic_light_01)
    )
)

(script static void c04_outro2_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "floodlab_outro2")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 70.0 0)
        (online_message_send)
        (04_outro2_01_predict_stub)
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_outro2\music\c04_outro2_01_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_outro2\foley\c04_outro2_01_fol")
        (sleep prediction_offset)
        (c04_outro2_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_outro2\04_outro2" "04_outro2_01" none "cinematic_anchor02")
        (custom_animation_relative "dervish_03" "objects\characters\dervish\04_outro2\04_outro2" "dervish_01" false "anchor02")
        (custom_animation_relative "monitor" "objects\characters\monitor\04_outro2\04_outro2" "monitor_01" false "anchor02")
        (custom_animation_relative "heretic_leader" "objects\characters\heretic\04_outro2\04_outro2" "heretic_01" false "anchor02")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (04_outro2_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_outro2\foley\c04_outro2_02_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c04_outro2_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_outro2\foley\c04_outro2_02_fol" none 1.0)
        (print "c04_outro2 foley 02 start")
    )
)

(script dormant void c04_9140_gsp
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_9140_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c04_9140_gsp" 2.0)
    )
)

(script dormant void c04_9150_der
    (begin
        (sleep 146)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_9150_der" "dervish_03" 1.0)
        (attract_mode_set_seconds "c04_9150_der" 2.0)
        (sleep 127)
        (unit_set_emotional_state "tartarus" "repulsed" 1.0 60)
    )
)

(script dormant void c04_9160_tar
    (begin
        (sleep 236)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_9160_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c04_9160_tar" 1.0)
    )
)

(script dormant void c04_9170_tar
    (begin
        (sleep 300)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_9170_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c04_9170_tar" 2.0)
        (unit_set_emotional_state "tartarus" "annoyed" 1.0 60)
    )
)

(script dormant void effect_monitor_yank
    (begin
        (rasterizer_profile_include_all)
        (sleep 190)
        (print "effect - monitor yank")
        (object_set_function_variable "monitor" "talking" 0.0 0.0)
        (effect_new_on_object_marker "effects\objects\characters\monitor\monitor_scrambled" "monitor" "body")
    )
)

(script dormant void c04_outro2_cinematic_light_02
    (begin
        (cinematic_lighting_set_primary_light 55.0 138.0 0.26 0.24 0.15)
        (cinematic_lighting_set_secondary_light -28.0 358.0 0.08 0.08 0.11)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
        (object_uses_cinematic_lighting "tartarus" true)
        (object_uses_cinematic_lighting "hammer" true)
    )
)

(script static void c04_outro2_02_setup
    (begin
        (object_create_anew "tartarus")
        (object_create_anew "hammer")
        (object_create_anew "phantom_outro2")
        (object_cinematic_lod "tartarus" true)
        (object_cinematic_lod "hammer" true)
        (object_cinematic_lod "phantom_outro2" true)
        (unit_set_emotional_state "tartarus" "pensive" 1.0 0)
        (wake c04_outro2_foley_02)
        (wake c04_9140_gsp)
        (wake c04_9150_der)
        (wake c04_9160_tar)
        (wake c04_9170_tar)
        (wake effect_monitor_yank)
        (wake c04_outro2_cinematic_light_02)
    )
)

(script static void c04_outro2_02_cleanup
    (begin
        (object_destroy "dervish_03")
        (object_destroy "heretic_leader")
        (object_destroy "monitor")
        (object_destroy "tartarus")
        (object_destroy "hammer")
        (object_destroy "phantom_outro2")
        (sound_class_enable_ducker "amb" 1.0 2)
    )
)

(script static void c04_outro2_02
    (begin
        (c04_outro2_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_outro2\04_outro2" "04_outro2_02" none "cinematic_anchor02")
        (custom_animation_relative "dervish_03" "objects\characters\dervish\04_outro2\04_outro2" "dervish_02" false "anchor02")
        (custom_animation_relative "monitor" "objects\characters\monitor\04_outro2\04_outro2" "monitor_02" false "anchor02")
        (custom_animation_relative "heretic_leader" "objects\characters\heretic\04_outro2\04_outro2" "heretic_02" false "anchor02")
        (custom_animation_relative "tartarus" "objects\characters\brute\04_outro2\04_outro2" "tartarus_02" false "anchor02")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\04_outro2\04_outro2" "hammer_02" "anchor02")
        (custom_animation_relative "phantom_outro2" "objects\vehicles\phantom\animations\04_outro2\04_outro2" "phantom_02" false "anchor02")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 0.0 0.0 0.0 15)
        (sleep 15)
        (c04_outro2_02_cleanup)
        (sound_class_enable_ducker "amb" 0.0 30)
        (sleep 30)
    )
)

(script static void c04_outro2
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (animation_cache_flush)
        (sound_cache_flush)
        (predict_model_section false)
        (sound_class_enable_ducker "amb" 0.5 0)
        (crash production_arm2)
        (sleep 1)
        (c04_outro2_01)
        (c04_outro2_02)
    )
)

(script command_script void abort
    (begin
        (cs_pause 0.1)
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

(script dormant void 04b_title0
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

(script dormant void 04b_title1
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

(script dormant void 04b_title2
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

(script dormant void objective_labs_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "escape the infested labs.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_labs_clear
    (begin
        (print "objective complete:")
        (print "escape the infested labs.")
        (update_remote_camera 0)
    )
)

(script dormant void objective_control_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "ascertain the heretic leader's whereabouts.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_control_clear
    (begin
        (print "objective complete:")
        (print "ascertain the heretic leader's whereabouts.")
        (update_remote_camera 1)
    )
)

(script dormant void objective_cables_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "sever the tether holding the station aloft.")
        (input_suppress_vibration 2)
    )
)

(script dormant void objective_cables_clear
    (begin
        (print "objective complete:")
        (print "sever the tether holding the station aloft.")
        (update_remote_camera 2)
    )
)

(script dormant void objective_dogfight_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "pursue the heretic leader back to the hangar.")
        (input_suppress_vibration 3)
    )
)

(script dormant void objective_dogfight_clear
    (begin
        (print "objective complete:")
        (print "pursue the heretic leader back to the hangar.")
        (update_remote_camera 3)
    )
)

(script dormant void objective_hl_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "kill the heretic leader.")
        (input_suppress_vibration 4)
    )
)

(script dormant void objective_hl_clear
    (begin
        (print "objective complete:")
        (print "kill the heretic leader.")
        (update_remote_camera 4)
    )
)

(script dormant void music_04b_01_start
    (begin
        (print "music 04b_01 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_01" none 1.0)
    )
)

(script dormant void music_04b_01_stop
    (begin
        (print "music 04b_01 stop")
        (sound_looping_set_scale "scenarios\solo\04b_floodlab\04b_music\04b_01")
    )
)

(script dormant void music_04b_02_start
    (begin
        (print "music 04b_02 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_02" none 1.0)
    )
)

(script dormant void music_04b_02_stop
    (begin
        (print "music 04b_02 stop")
        (sound_looping_set_scale "scenarios\solo\04b_floodlab\04b_music\04b_02")
    )
)

(script dormant void music_04b_03_start
    (begin
        (print "music 04b_03 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_03" none 1.0)
    )
)

(script static void music_04b_03_start_alt
    (begin
        (print "music 04b_03 start alt")
        (sound_class_show_channel "scenarios\solo\04b_floodlab\04b_music\04b_03" true)
    )
)

(script static void music_04b_03_stop_alt
    (begin
        (print "music 04b_03 stop alt")
        (sound_class_show_channel "scenarios\solo\04b_floodlab\04b_music\04b_03" false)
    )
)

(script dormant void music_04b_03_stop
    (begin
        (print "music 04b_03 stop")
        (sound_looping_set_scale "scenarios\solo\04b_floodlab\04b_music\04b_03")
    )
)

(script dormant void music_04b_04_start
    (begin
        (print "music 04b_04 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_04" none 1.0)
    )
)

(script dormant void music_04b_04_start_alt
    (begin
        (print "music 04b_04 start alt")
        (sound_class_show_channel "scenarios\solo\04b_floodlab\04b_music\04b_04" true)
    )
)

(script dormant void music_04b_04_stop_alt
    (begin
        (print "music 04b_04 stop alt")
        (sound_class_show_channel "scenarios\solo\04b_floodlab\04b_music\04b_04" false)
    )
)

(script dormant void music_04b_04_stop
    (begin
        (print "music 04b_04 stop")
        (sound_looping_set_scale "scenarios\solo\04b_floodlab\04b_music\04b_04")
    )
)

(script dormant void music_04b_05_start
    (begin
        (print "music 04b_05 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_05" none 1.0)
    )
)

(script dormant void music_04b_06_start
    (begin
        (print "music 04b_06 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_06" none 1.0)
    )
)

(script dormant void music_04b_07_start
    (begin
        (print "music 04b_07 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_07" none 1.0)
    )
)

(script dormant void music_04b_08_start
    (begin
        (print "music 04b_08 start")
        (sound_looping_stop_immediately "scenarios\solo\04b_floodlab\04b_music\04b_08" none 1.0)
    )
)

(script dormant void music_04b_08_start_alt
    (begin
        (print "music 04b_08 start alt")
        (sound_class_show_channel "scenarios\solo\04b_floodlab\04b_music\04b_08" true)
    )
)

(script dormant void music_04b_08_stop
    (begin
        (print "music 04b_08 stop")
        (sound_looping_set_scale "scenarios\solo\04b_floodlab\04b_music\04b_08")
    )
)

(script dormant void kill_volumes
    (begin
        (kill_volume_disable "kill_hangar_pit_01")
        (kill_volume_disable "kill_hangar_pit_02")
        (kill_volume_disable "kill_hangar_pit_03")
        (kill_volume_disable "kill_hangar_pit_04")
        (kill_volume_disable "kill_underhangar_pit_01")
        (kill_volume_disable "kill_underhangar_pit_02")
        (kill_volume_disable "kill_bottling_pit_01")
        (kill_volume_disable "kill_bottling_pit_02")
        (sleep_until (= (version) 0))
        (kill_volume_disable "kill_silo_pit")
        (sleep_until (= (version) 2))
        (kill_volume_disable "kill_wraparound")
        (sleep_until (= (version) 1))
        (kill_volume_enable "kill_bottling_pit_01")
        (kill_volume_enable "kill_bottling_pit_02")
        (sleep_until 
            (begin
                (sleep_until (= (version) 5))
                (kill_volume_disable "kill_bottling_pit_01")
                (kill_volume_disable "kill_bottling_pit_02")
                (kill_volume_enable "kill_hangar_pit_01")
                (kill_volume_enable "kill_hangar_pit_02")
                (kill_volume_enable "kill_hangar_pit_03")
                (kill_volume_enable "kill_hangar_pit_04")
                (kill_volume_enable "kill_underhangar_pit_01")
                (kill_volume_enable "kill_underhangar_pit_02")
                (sleep_until (= (version) 1))
                (kill_volume_enable "kill_bottling_pit_01")
                (kill_volume_enable "kill_bottling_pit_02")
                (kill_volume_disable "kill_hangar_pit_01")
                (kill_volume_disable "kill_hangar_pit_02")
                (kill_volume_disable "kill_hangar_pit_03")
                (kill_volume_disable "kill_hangar_pit_04")
                (kill_volume_disable "kill_underhangar_pit_01")
                (kill_volume_disable "kill_underhangar_pit_02")
                false
            )
        )
    )
)

(script dormant void cableroom_killer
    (begin
        (sleep_until 
            (begin
                (if 
                    (or
                        (= (volume_test_object "vol_croom_kill_new" (player0)) true)
                        (= (volume_test_object "vol_croom_kill_new_too" (player0)) true)
                    ) 
                        (unit_kill (unit (player0))))
                (if 
                    (or
                        (= (volume_test_object "vol_croom_kill_new" (player1)) true)
                        (= (volume_test_object "vol_croom_kill_new_too" (player1)) true)
                    ) 
                        (unit_kill (unit (player1))))
                (= (version) 1)
            )
        )
    )
)

(script dormant void cableroom_junk_killer
    (begin
        (sleep_until 
            (begin
                (sleep 90)
                (garbage_collect_now)
                (= (version) 1)
            )
        )
    )
)

(script static void prep_return_from_intro
    (begin
        (data_mine_insert "04b_1_entry")
        (ai_place "disposal_commander" 1)
        (ai_cannot_die "disposal_commander" true)
        (ai_place "allies_elites_03a" 1)
        (ai_place "allies_elites_03b" 1)
        (ai_place "allies_grunts_03" 2)
        (sleep 30)
        (object_teleport (player0) "research_player0")
        (object_teleport (player1) "research_player1")
    )
)

(script command_script void juggernaut_gosh
    (begin
        (cs_switch "elite")
        (cs_abort_on_damage true)
        (cs_enable_moving true)
        (print "spec-ops elite: 'by the rings! what is that?!'")
        (cs_play_line "0550")
        (sleep 30)
        (cs_switch "grunt")
        (cs_abort_on_damage true)
        (cs_enable_moving true)
        (print "spec-ops grunt: (nervous grunts and whines)")
        (cs_play_line "0560")
        (sleep 30)
        (cs_switch "elite")
        (print "spec-ops elite: 'quiet!'")
        (cs_play_line "0570")
        (cs_enable_moving true)
        (sleep_until (= (ai_living_count "disposal_entry_flood") 0) 30 300)
        (sleep 60)
        (print "spec-ops elite: 'it's moved on.'")
        (cs_play_line "0580")
        (sleep 30)
        (print "spec-ops elite: 'quickly, before it returns! let's find the heretic leader, and finish him off!'")
        (cs_play_line "0590")
    )
)

(script command_script void disposal_juggernaut_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to disposal_chamber/juggs)
        (ai_erase ai_current_actor)
    )
)

(script dormant void arm_02_entry_start
    (begin
        (sleep_until (= (volume_test_objects "vol_juggernaut_preview" (players)) true))
        (ai_set_orders "all_allies" "allies_disposal")
        (sound_class_enable_ducker "unit_animation" 0.5 1)
        (ai_place "disposal_entry_flood" 4)
        (ai_cannot_die "disposal_entry_flood" true)
        (ai_place "disposal_entry_heretics" 4)
        (units_set_maximum_vitality (ai_actors "disposal_entry_heretics") 20.0 20.0)
        (units_set_current_vitality (ai_actors "disposal_entry_heretics") 20.0 20.0)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_juggernaut_preview" (ai_actors "allies_elites")) true)
                (= (volume_test_objects "vol_juggernaut_preview" (ai_actors "allies_grunts_03")) true)
            ) 
        30 450)
        (sleep_until (ai_scene "juggernaut_gosh_scene" juggernaut_gosh "all_allies") 30 450)
        (sleep 90)
        (wake music_04b_01_start)
        (sleep_until (= (ai_living_count "disposal_entry_heretics") 0) 30 300)
        (ai_kill_silent "disposal_entry_heretics")
        (cs_run_command_script "disposal_entry_flood" disposal_juggernaut_exit)
        (sound_class_enable_ducker "unit_animation" 1.0 1)
    )
)

(script dormant void juggernaut_abort
    (begin
        (if (cs_command_script_running "all_allies" juggernaut_gosh) 
            (cs_run_command_script "all_allies" abort) (sound_class_enable_ducker "unit_animation" 1.0 1))
    )
)

(script command_script void holo_drone_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_shoot false)
        (cs_fly_by disposal_chamber/p0)
        (cs_fly_by disposal_chamber/p1)
        (cs_fly_by disposal_chamber/p2)
        (cs_fly_by disposal_chamber/p3)
        (cs_fly_by disposal_chamber/p4)
        (cs_fly_to disposal_chamber/p5 0.5)
        (set holo_drone_arrived true)
        (sleep_forever)
    )
)

(script command_script void disposal_ally_comment_01
    (begin
        (cs_switch "so_elite")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (print "spec-ops elite: 'what happened here?'")
        (cs_play_line "0010")
        (set mess_react_01_done true)
    )
)

(script command_script void disposal_ally_comment_02
    (begin
        (cs_switch "grunt_01")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (print "spec-ops grunt: 'me have bad feeling 'bout this.'")
        (cs_play_line "0600")
        (cs_switch "grunt_02")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (print "spec-ops grunt: 'you always have bad feeling!'")
        (cs_play_line "0610")
        (sleep 10)
        (print "spec-ops grunt: 'you had bad feeling about morning food-nipple!'")
        (cs_play_line "0620")
        (cs_switch "elite_01")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (print "spec-ops elite: 'close your jaws, or i shall bind them shut!'")
        (cs_play_line "0630")
        (set mess_react_02_done true)
        (cs_switch "grunt_02")
        (cs_go_to_nearest disposal_grunts)
        (cs_switch "grunt_01")
        (cs_go_to_nearest disposal_grunts)
    )
)

(script command_script void hologram_face
    (begin
        (cs_start_approach "drone_spawn" 3.0 20.0 20.0)
        (cs_aim_object true (list_get (ai_actors "hl_hologram") 0))
        (cs_enable_moving true)
        (cs_enable_looking true)
        (sleep_until (= (ai_living_count "hl_hologram") 0) 30 900)
        (cs_aim_object false (list_get (ai_actors "hl_hologram") 0))
    )
)

(script command_script void hologram_ally_01
    (begin
        (set holo_ally_01_go true)
        (cs_switch "so_grunt")
        (cs_aim_object true (list_get (ai_actors "hl_hologram") 0))
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_shoot true (list_get (ai_actors "hl_hologram") 0))
        (print "spec-ops grunt: 'see! heretic!'")
        (cs_play_line "0020")
        (sleep 60)
        (cs_switch "commander")
        (print "spec-ops commander: 'hold your fire! hold your fire!'")
        (cs_play_line "0030")
        (cs_switch "so_grunt")
        (cs_shoot false)
        (set holo_ally_01_done true)
    )
)

(script command_script void hologram_ally_02
    (begin
        (set holo_ally_02_go true)
        (cs_switch "heretic_leader")
        (cs_face_player true)
        (print "heretic leader: 'i wondered who the prophets would send to silence me. an arbiter. i'm flattered.'")
        (cs_play_line "0040")
        (set holo_ally_02_done true)
    )
)

(script command_script void hologram_ally_03
    (begin
        (set holo_ally_03_go true)
        (cs_switch "commander")
        (cs_start_approach "drone_spawn" 2.0 20.0 20.0)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (print "spec-ops commander: 'he's using a holo-drone. he must be close!'")
        (cs_play_line "0050")
        (sleep 30)
        (print "spec-ops commander: 'come out. so we may kill you.'")
        (cs_play_line "0060")
        (cs_approach_stop)
        (cs_switch "heretic_leader")
        (cs_face_object true (list_get (ai_actors "disposal_commander") 0))
        (print "heretic leader: 'get in line.'")
        (cs_play_line "0070")
        (cs_switch "commander")
        (set holo_ally_03_done true)
    )
)

(script command_script void hologram_ally_04
    (begin
        (cs_switch "so_elite")
        (print "spec-ops elite: 'leader...'")
        (cs_play_line "0080")
        (cs_switch "commander")
        (print "spec-ops commander: 'stand firm...the flood is upon us.'")
        (cs_play_line "0090")
    )
)

(script dormant void revive_aware
    (begin
        (sleep_until (> (ai_nonswarm_count "disposal_infection") 0))
        (sound_impulse_start_effect "sound\dialog\combat\elite_loose\02_danger\warn_fldreanimate" (list_get (ai_actors "allies_elites_03a") 0) 1.0)
        (print "ally warns about reanimation")
    )
)

(script command_script void disposal_after_react
    (begin
        (cs_switch "ally")
        (print "spec-ops elite: 'heretic fools! what have they done?!'")
        (cs_play_line "0640")
    )
)

(script command_script void disposal_after_commander
    (begin
        (cs_switch "commander")
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to disposal_chamber/doorman)
        (cs_aim_player true)
        (print "spec-ops commander: 'go, arbiter! i'll follow when our reinforcements arrive!'")
        (cs_play_line "1500")
        (cs_aim_player false)
        (cs_enable_dialogue true)
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_soc_post" (ai_actors "disposal_commander")) false))
                (cs_start_to disposal_chamber/doorman)
                false
            )
        )
    )
)

(script dormant void spec_ops_reborn
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_soc_reborn" (ai_actors "disposal_commander")) true))
                (effect_new_on_object_marker "effects\gameplay\coop_teleport" (list_get (ai_actors "disposal_commander") 0) "")
                (sleep 30)
                (object_teleport (list_get (ai_actors "disposal_commander") 0) "soc_reborn")
                (= (version) 0)
            )
        )
        (ai_erase "disposal_commander")
    )
)

(script static void disposal_infection_spawn
    (begin
        (sleep_until (< (ai_swarm_count "disposal_infection") 20) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_02" 1))
        (sleep_until (< (ai_swarm_count "disposal_infection") 20) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_02" 1))
        (sleep_until (< (ai_swarm_count "disposal_infection") 15) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_01" 1))
        (sleep_until (< (ai_swarm_count "disposal_infection") 15) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_01" 1))
        (sleep_until (< (ai_swarm_count "disposal_infection") 10) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_02" 1))
        (sleep_until (< (ai_swarm_count "disposal_infection") 10) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_02" 1))
        (sleep_until (< (ai_swarm_count "disposal_infection") 5) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_01" 1))
        (sleep_until (< (ai_swarm_count "disposal_infection") 5) 30 300)
        (if (< (ai_swarm_count "disposal_infection") 20) 
            (ai_place "disposal_infection_01" 1))
    )
)

(script dormant void holo_cannot_die
    (begin
        (sleep_until (< (object_get_shield "holo_boy") 1.0) 1)
        (object_set_shield_stun_infinite "holo_boy")
        (object_set_shield "holo_boy" 0.0)
        (object_cannot_take_damage "holo_boy")
    )
)

(script dormant void disposal_chamber_start
    (begin
        (data_mine_insert "04b_2_disposal_chamber")
        (game_save_no_timeout)
        (ai_renew "all_allies")
        (wake juggernaut_abort)
        (wake music_04b_01_start)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_disposal_bottom" (players)) true)
                (> (player_count) 0)
            )
        )
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_disposal_all" (ai_actors "all_allies")) true)
                (> (player_count) 0)
            ) 
        30 300)
        (device_set_position "disposal_entry_int" 0.0)
        (ai_set_active_camo "all_allies" false)
        (sleep 30)
        (sleep_until 
            (or
                (ai_scene "mess_react_01_scene" disposal_ally_comment_01 "allies_elites")
                (= (ai_living_count "allies_elites") 0)
            ) 
        30 150)
        (sleep 5)
        (if (= mess_react_01_go true) 
            (sleep_until 
                (or
                    (= mess_react_01_done true)
                    (= (ai_living_count "allies_elites") 0)
                ) 
            30 150))
        (sleep 30)
        (sleep_until 
            (or
                (ai_scene "mess_react_02_scene" disposal_ally_comment_02 "all_allies")
                (< (ai_living_count "allies_grunts_03") 2)
            ) 
        30 150)
        (sleep 90)
        (ai_disregard (ai_actors "all_allies") true)
        (device_set_position "tennis_ball" 1.0)
        (sleep 60)
        (effect_new_on_object_marker "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_activate" "tennis_ball" "")
        (sleep_until (= (device_get_position "tennis_ball") 1.0) 30 450)
        (effect_new_on_object_marker "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_holo_on_cinematic" "tennis_ball" "light")
        (ai_place "hl_hologram")
        (unit_impervious (ai_actors "hl_hologram") true)
        (ai_cannot_die "hl_hologram" true)
        (cs_run_command_script "hl_hologram" forever_pause)
        (ai_disregard (ai_actors "all_allies") true)
        (ai_disregard (ai_actors "hl_hologram") true)
        (object_destroy "tennis_ball")
        (object_dynamic_simulation_disable (list_get (ai_actors "hl_hologram") 0) true)
        (cs_run_command_script "all_allies" hologram_face)
        (sleep_until 
            (or
                (ai_scene "holo_grunt_react_scene" hologram_ally_01 "all_allies")
                (= (ai_living_count "allies_grunts_03") 0)
                (= (ai_living_count "disposal_commander") 0)
            ) 
        30 150)
        (sleep 5)
        (if (= holo_ally_01_go true) 
            (sleep_until 
                (or
                    (= holo_ally_01_done true)
                    (= (ai_living_count "allies_grunts_03") 0)
                    (= (ai_living_count "disposal_commander") 0)
                ) 
            30 300))
        (sleep_until 
            (or
                (ai_scene "holo_main_hl_scene" hologram_ally_02 "hl_hologram")
                (= (ai_living_count "hl_hologram") 0)
            ) 
        30 150)
        (sleep 5)
        (if (= holo_ally_02_go true) 
            (sleep_until 
                (or
                    (= holo_ally_02_done true)
                    (= (ai_living_count "hl_hologram") 0)
                ) 
            30 300))
        (sleep_until 
            (or
                (ai_scene "holo_main_react_scene" hologram_ally_03 "disposal_commander" "hl_hologram")
                (= (ai_living_count "disposal_commander") 0)
                (= (ai_living_count "hl_hologram") 0)
            ) 
        30 150)
        (sleep 5)
        (if (= holo_ally_03_go true) 
            (sleep_until 
                (or
                    (= holo_ally_03_done true)
                    (= (ai_living_count "disposal_commander") 0)
                ) 
            30 450))
        (unit_doesnt_drop_items (ai_actors "hl_hologram"))
        (ai_cannot_die "hl_hologram" false)
        (ai_kill_silent "hl_hologram")
        (ai_disregard (ai_actors "all_allies") false)
        (game_save_no_timeout)
        (sleep 120)
        (ai_place "disposal_infection_01" 1)
        (sleep 30)
        (ai_place "disposal_infection_01" 1)
        (sleep 30)
        (ai_place "disposal_infection_01" 1)
        (sleep 30)
        (ai_place "disposal_infection_01" 1)
        (sleep_until 
            (or
                (ai_scene "holo_after_scene" hologram_ally_04 "all_allies")
                (= (ai_living_count "disposal_commander") 0)
                (= (ai_living_count "allies_elites") 0)
            ) 
        30 150)
        (wake revive_aware)
        (disposal_infection_spawn)
        (sleep_until 
            (and
                (< (ai_swarm_count "disposal_infection") 30)
                (= (ai_nonswarm_count "disposal_infection") 0)
            ) 
        30 8000)
        (device_operates_automatically_set "disposal_exit" true)
        (sleep_until 
            (or
                (ai_scene "disposal_post_scene" disposal_after_react "all_allies")
                (= (ai_living_count "allies_elites") 0)
            ) 
        30 150)
        (sleep 150)
        (sleep_until (ai_scene "disposal_comm_pussy_scene" disposal_after_commander "disposal_commander") 30 300)
        (wake spec_ops_reborn)
        (sleep 30)
        (game_save_no_timeout)
    )
)

(script command_script void silo_ally_comment
    (begin
        (cs_switch "ally")
        (print "spec-ops elite: 'this place...it is filled with the parasite!'")
        (cs_play_line "0650")
        (sleep 30)
        (print "spec-ops elite: 'not even heretics would have come here had they known this!'")
        (cs_play_line "0660")
    )
)

(script command_script void silo_commander_whine
    (begin
        (cs_switch "commander")
        (print "spec-ops commander: 'i do not wish to stay here any longer than we have to, arbiter!'")
        (cs_play_line "1230")
    )
)

(script dormant void silo_commander_reminder
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_leaving_silo" (players)) true)
                (= (ai_nonswarm_count "silo_flood") 0)
            )
        )
        (if 
            (and
                (= (volume_test_objects "vol_leaving_silo" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (sleep_until (= (volume_test_objects "vol_leaving_silo" (players)) true) 30 100)
                    (if 
                        (and
                            (= (volume_test_objects "vol_leaving_silo" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_scene "silo_commander_scene" silo_commander_whine "all_allies"))
                )
        )
    )
)

(script dormant void silo_killer
    (begin
        (sleep_until 
            (begin
                (object_destroy (list_get (volume_return_objects "kill_silo_pit") 0))
                (sleep 15)
                (= silo_killer_power false)
            )
        )
    )
)

(script static void silo_crane_01
    (begin
        (device_set_overlay_track "elev_silo" "crane_left")
        (device_animate_overlay "elev_silo" 1.0 30.0 1.0 1.0)
        (sleep 360)
        (object_destroy "stop_01")
        (object_create_anew "dummy_can")
        (objects_attach "elev_silo" "can_entry" "dummy_can" "can_top")
        (sleep 285)
        (object_destroy "dummy_can")
        (sleep 270)
    )
)

(script static void silo_crane_02
    (begin
        (device_set_overlay_track "elev_silo" "crane_right")
        (device_animate_overlay "elev_silo" 1.0 30.0 1.0 1.0)
        (sleep 360)
        (object_destroy "stop_02")
        (object_create_anew "dummy_can")
        (objects_attach "elev_silo" "can_entry" "dummy_can" "can_top")
        (sleep 285)
        (object_destroy "dummy_can")
        (sleep 270)
    )
)

(script static void silo_crane_03
    (begin
        (device_set_overlay_track "elev_silo" "crane_right")
        (device_animate_overlay "elev_silo" 1.0 30.0 1.0 1.0)
        (sleep 360)
        (object_destroy "stop_03")
        (object_create_anew "dummy_can")
        (objects_attach "elev_silo" "can_entry" "dummy_can" "can_top")
        (sleep 285)
        (object_destroy "dummy_can")
        (sleep 270)
    )
)

(script static void silo_crane_04
    (begin
        (device_set_overlay_track "elev_silo" "crane_center")
        (device_animate_overlay "elev_silo" 1.0 18.0 1.0 1.0)
        (sleep 195)
        (object_destroy "stop_04")
        (object_create_anew "dummy_can")
        (objects_attach "elev_silo" "can_entry" "dummy_can" "can_top")
        (sleep 255)
        (object_destroy "dummy_can")
        (sleep 60)
    )
)

(script static void silo_crane_05
    (begin
        (device_set_overlay_track "elev_silo" "crane_left")
        (device_animate_overlay "elev_silo" 1.0 30.0 1.0 1.0)
        (sleep 360)
        (object_destroy "stop_05")
        (object_create_anew "dummy_can")
        (objects_attach "elev_silo" "can_entry" "dummy_can" "can_top")
        (sleep 285)
        (object_destroy "dummy_can")
        (sleep 270)
    )
)

(script static void silo_crane_06
    (begin
        (device_set_overlay_track "elev_silo" "crane_center")
        (device_animate_overlay "elev_silo" 1.0 18.0 1.0 1.0)
        (sleep 195)
        (object_destroy "stop_06")
        (object_create_anew "dummy_can")
        (objects_attach "elev_silo" "can_entry" "dummy_can" "can_top")
        (sleep 255)
        (object_destroy "dummy_can")
        (sleep 60)
    )
)

(script static void silo_down_200
    (begin
        (device_set_position_track "elev_silo" "down_200" 0.0)
        (device_animate_position "elev_silo" 1.0 5.0 1.0 1.0 false)
    )
)

(script static void silo_down_400
    (begin
        (device_set_position_track "elev_silo" "down_400" 0.0)
        (device_animate_position "elev_silo" 1.0 10.0 1.0 1.0 false)
    )
)

(script static void silo_down_600
    (begin
        (device_set_position_track "elev_silo" "down_600" 0.0)
        (device_animate_position "elev_silo" 1.0 15.0 1.0 1.0 false)
    )
)

(script static void silo_down_800
    (begin
        (device_set_position_track "elev_silo" "down_800" 0.0)
        (device_animate_position "elev_silo" 1.0 20.0 1.0 1.0 false)
    )
)

(script static void silo_rot_90_plus
    (begin
        (device_set_position_track "elev_silo" "rot_90_clockwise" 0.0)
        (device_animate_position "elev_silo" 1.0 5.0 1.0 1.0 false)
    )
)

(script static void silo_rot_90_minus
    (begin
        (device_set_position_track "elev_silo" "rot_90_counterclockwise" 0.0)
        (device_animate_position "elev_silo" 1.0 5.0 1.0 1.0 false)
    )
)

(script static void silo_rot_180_plus
    (begin
        (device_set_position_track "elev_silo" "rot_180_clockwise" 0.0)
        (device_animate_position "elev_silo" 1.0 10.0 1.0 1.0 false)
    )
)

(script static void silo_rot_180_minus
    (begin
        (device_set_position_track "elev_silo" "rot_180_counterclockwise" 0.0)
        (device_animate_position "elev_silo" 1.0 10.0 1.0 1.0 false)
    )
)

(script static void silo_tray01
    (begin
        (objects_attach "elev_silo" "tray01" "tray01" "can_exit")
        (object_create "can01")
        (objects_attach "tray01" "can_exit" "can01" "can_base")
        (device_set_position "tray01" 1.0)
        (sleep_until (= (device_get_position "tray01") 1.0) 30 900)
        (objects_detach "tray01" "can01")
        (device_set_position_immediate "tray01" 0.0)
        (object_destroy "tray01")
    )
)

(script static void silo_tray02
    (begin
        (objects_attach "elev_silo" "tray02" "tray02" "can_exit")
        (object_create "can02")
        (objects_attach "tray02" "can_exit" "can02" "can_base")
        (device_set_position "tray02" 1.0)
        (sleep_until (= (device_get_position "tray02") 1.0) 30 300)
        (objects_detach "tray02" "can02")
        (device_set_position_immediate "tray02" 0.0)
        (object_destroy "tray02")
    )
)

(script static void silo_tray03
    (begin
        (objects_attach "elev_silo" "tray03" "tray03" "can_exit")
        (object_create "can03")
        (objects_attach "tray03" "can_exit" "can03" "can_base")
        (device_set_position "tray03" 1.0)
        (sleep_until (= (device_get_position "tray03") 1.0) 30 300)
        (objects_detach "tray03" "can03")
        (device_set_position_immediate "tray03" 0.0)
        (object_destroy "tray03")
    )
)

(script static void silo_tray04
    (begin
        (objects_attach "elev_silo" "tray04" "tray04" "can_exit")
        (object_create "can04")
        (objects_attach "tray04" "can_exit" "can04" "can_base")
        (device_set_position "tray04" 1.0)
        (sleep_until (= (device_get_position "tray04") 1.0) 30 300)
        (objects_detach "tray04" "can04")
        (device_set_position_immediate "tray04" 0.0)
        (object_destroy "tray04")
    )
)

(script static void silo_tray05
    (begin
        (objects_attach "elev_silo" "tray05" "tray05" "can_exit")
        (object_create "can05")
        (objects_attach "tray05" "can_exit" "can05" "can_base")
        (device_set_position "tray05" 1.0)
        (sleep_until (= (device_get_position "tray05") 1.0) 30 300)
        (objects_detach "tray05" "can05")
        (device_set_position_immediate "tray05" 0.0)
        (object_destroy "tray05")
    )
)

(script static void silo_tray06
    (begin
        (objects_attach "elev_silo" "tray06" "tray06" "can_exit")
        (object_create "can06")
        (objects_attach "tray06" "can_exit" "can06" "can_base")
        (device_set_position "tray06" 1.0)
        (sleep_until (= (device_get_position "tray06") 1.0) 30 300)
        (objects_detach "tray06" "can06")
        (device_set_position_immediate "tray06" 0.0)
        (object_destroy "tray06")
    )
)

(script dormant void silo_covers_invincible
    (begin
        (object_cannot_take_damage "cap_01_1")
        (object_cannot_take_damage "cap_01_2")
        (object_cannot_take_damage "cap_01_3")
        (object_cannot_take_damage "cap_01_4")
        (object_cannot_take_damage "cap_01_5")
        (object_cannot_take_damage "cap_01_6")
        (object_cannot_take_damage "cap_01_7")
        (object_cannot_take_damage "cap_01_8")
        (object_cannot_take_damage "cap_01_9")
        (object_cannot_take_damage "cap_01_10")
        (object_cannot_take_damage "cap_01_11")
        (object_cannot_take_damage "cap_01_12")
        (object_cannot_take_damage "cap_02_1")
        (object_cannot_take_damage "cap_02_2")
        (object_cannot_take_damage "cap_02_3")
        (object_cannot_take_damage "cap_02_4")
        (object_cannot_take_damage "cap_02_5")
        (object_cannot_take_damage "cap_02_6")
        (object_cannot_take_damage "cap_02_7")
        (object_cannot_take_damage "cap_02_8")
        (object_cannot_take_damage "cap_02_9")
        (object_cannot_take_damage "cap_02_10")
        (object_cannot_take_damage "cap_02_11")
        (object_cannot_take_damage "cap_03_1")
        (object_cannot_take_damage "cap_03_2")
        (object_cannot_take_damage "cap_03_3")
        (object_cannot_take_damage "cap_03_4")
        (object_cannot_take_damage "cap_03_5")
        (object_cannot_take_damage "cap_03_6")
        (object_cannot_take_damage "cap_03_7")
        (object_cannot_take_damage "cap_03_8")
        (object_cannot_take_damage "cap_04_1")
        (object_cannot_take_damage "cap_04_2")
        (object_cannot_take_damage "cap_04_3")
        (object_cannot_take_damage "cap_04_4")
        (object_cannot_take_damage "cap_04_5")
        (object_cannot_take_damage "cap_04_6")
        (object_cannot_take_damage "cap_04_7")
        (object_cannot_take_damage "cap_04_8")
        (object_cannot_take_damage "cap_04_9")
        (object_cannot_take_damage "cap_04_10")
        (object_cannot_take_damage "cap_04_11")
        (object_cannot_take_damage "cap_04_12")
    )
)

(script dormant void silo_sentinel_spawner
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_living_count "silo_sentinels_all") 2)
                            (< silo_sentinels_total 4)
                        ) 
                            (begin
                                (ai_place "silo_sentinels_resupply/1")
                                (set silo_sentinels_total (+ silo_sentinels_total 1.0))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "silo_sentinels_all") 2)
                            (< silo_sentinels_total 4)
                        ) 
                            (begin
                                (ai_place "silo_sentinels_resupply/2")
                                (set silo_sentinels_total (+ silo_sentinels_total 1.0))
                            )
                    )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_leaving_silo" (players)) true)
                        (< (ai_living_count "silo_sentinels_all") 2)
                        (> silo_sentinels_total 3)
                    )
                )
                (> silo_sentinels_total 3)
            ) 
        30 4000)
        (sleep_until (= silo_sentinels_total 0))
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_living_count "silo_sentinels_all") 2)
                            (< silo_sentinels_total 4)
                        ) 
                            (begin
                                (ai_place "silo_sentinels_resupply/5")
                                (set silo_sentinels_total (+ silo_sentinels_total 1.0))
                            )
                    )
                    (if 
                        (and
                            (< (ai_living_count "silo_sentinels_all") 2)
                            (< silo_sentinels_total 4)
                        ) 
                            (begin
                                (ai_place "silo_sentinels_resupply/6")
                                (set silo_sentinels_total (+ silo_sentinels_total 1.0))
                            )
                    )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_leaving_silo" (players)) true)
                        (< (ai_living_count "silo_sentinels_all") 2)
                        (> silo_sentinels_total 3)
                    )
                )
                (or
                    (= (volume_test_objects "vol_leaving_silo" (players)) true)
                    (> silo_sentinels_total 3)
                )
            ) 
        30 4000)
    )
)

(script dormant void silo_saving
    (begin
        (sleep_until 
            (begin
                (sleep_until (= silo_try_save true))
                (sleep_until 
                    (and
                        (game_all_quiet)
                        (= (volume_test_objects_all "vol_silo_save" (players)) true)
                        (> (player_count) 0)
                    )
                )
                (game_reverted)
                (set silo_try_save false)
                (= (volume_test_objects "vol_leaving_silo" (players)) true)
            )
        )
    )
)

(script dormant void silo_flood_spawner
    (begin
        (if (difficulty_legendary) 
            (set silo_flood_total 2))
        (if (difficulty_heroic) 
            (set silo_flood_total 1))
        (sleep_until 
            (begin
                (ai_place "silo_climbers_01" 1)
                (ai_place "silo_climbers_02" 1)
                (sleep (random_range 30 60))
                (ai_place "silo_climbers_01" 1)
                (ai_place "silo_climbers_02" 1)
                (if (difficulty_heroic) 
                    (begin
                        (sleep (random_range 30 60))
                        (begin_random
                            (ai_place "silo_climbers_01" (- 1.0 (ai_living_count "silo_climbers_02")))
                            (ai_place "silo_climbers_02" (- 1.0 (ai_living_count "silo_climbers_01")))
                        )
                    )
                )
                (if (difficulty_legendary) 
                    (begin
                        (sleep (random_range 30 60))
                        (begin_random
                            (ai_place "silo_climbers_01" 1)
                            (ai_place "silo_climbers_02" 1)
                        )
                    )
                )
                (garbage_collect_now)
                (set silo_try_save true)
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_leaving_silo" (players)) true)
                        (<= (+ (ai_nonswarm_count "silo_flood") (ai_nonswarm_count "silo_infection")) silo_flood_total)
                    )
                )
                (or
                    (= (volume_test_objects "vol_leaving_silo" (players)) true)
                    (= silo_almost_there true)
                )
            )
        )
    )
)

(script dormant void elev_go
    (begin
        (silo_crane_01)
        (silo_tray01)
        (sleep 30)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_specimen_storage" (players)) true)
                (> (player_count) 0)
            )
        )
        (print "down 400")
        (wake silo_saving)
        (wake music_04b_02_stop)
        (silo_down_400)
        (sleep 300)
        (silo_rot_90_plus)
        (sleep 150)
        (silo_crane_02)
        (silo_tray02)
        (sleep 30)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_specimen_storage" (players)) true)
                (> (player_count) 0)
            ) 
        30 300)
        (print "down 600")
        (silo_down_600)
        (sleep 450)
        (silo_rot_90_minus)
        (sleep 150)
        (silo_crane_03)
        (silo_tray03)
        (sleep 30)
        (data_mine_insert "04b_4_silo_mid")
        (set silo_try_save true)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_specimen_storage" (players)) true)
                (> (player_count) 0)
            ) 
        30 300)
        (print "down 200")
        (wake music_04b_01_stop)
        (silo_down_200)
        (sleep 150)
        (ai_place "silo_sentinels_below" 4)
        (silo_rot_90_plus)
        (sleep 150)
        (silo_crane_04)
        (silo_tray04)
        (sleep 30)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_specimen_storage" (players)) true)
                (> (player_count) 0)
            ) 
        30 300)
        (print "down 800 - kill disabled")
        (kill_volume_disable "kill_silo_toggle")
        (silo_down_800)
        (sleep 600)
        (silo_rot_180_minus)
        (sleep 300)
        (silo_crane_05)
        (silo_tray05)
        (sleep 30)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_specimen_storage" (players)) true)
                (> (player_count) 0)
            ) 
        30 300)
        (print "down 400")
        (silo_down_400)
        (sleep 300)
        (silo_rot_90_plus)
        (sleep 150)
        (silo_crane_06)
        (silo_tray06)
        (sleep 30)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_specimen_storage" (players)) true)
                (> (player_count) 0)
            ) 
        30 300)
        (set silo_almost_there true)
        (print "down 600")
        (silo_down_600)
        (sleep 300)
        (sleep 150)
    )
)

(script dormant void silo_hall_flood_spawner
    (begin
        (ai_place "silo_flood_halls" 2)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_leaving_silo" (players)) true)
                (= (ai_nonswarm_count "silo_flood_halls") 0)
            )
        )
        (sleep_until (= (volume_test_objects "vol_leaving_silo" (players)) true) 30 210)
        (if (= (volume_test_objects "vol_leaving_silo" (players)) true) 
            (sleep_forever))
        (if 
            (and
                (= (volume_test_objects "vol_leaving_silo" (players)) false)
                (> (player_count) 0)
            ) 
                (ai_place "silo_flood_halls" 2))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_leaving_silo" (players)) true)
                (= (ai_nonswarm_count "silo_flood_halls") 0)
            )
        )
        (sleep_until (= (volume_test_objects "vol_leaving_silo" (players)) true) 30 210)
        (if (= (volume_test_objects "vol_leaving_silo" (players)) true) 
            (sleep_forever))
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (volume_test_objects "vol_leaving_silo" (players)) false)
                        (> (player_count) 0)
                        (< (ai_living_count "silo_flood_halls") 1)
                    ) 
                        (ai_place "silo_flood_halls" 1))
                (sleep_until (= (volume_test_objects "vol_leaving_silo" (players)) true) 30 210)
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_leaving_silo" (players)) true)
                        (< (ai_living_count "silo_flood_halls") 1)
                        (> (ai_spawn_count "silo_flood_halls") 7)
                    )
                )
                (or
                    (= (volume_test_objects "vol_leaving_silo" (players)) true)
                    (> (ai_spawn_count "silo_flood_halls") 7)
                )
            )
        )
    )
)

(script dormant void silo_start
    (begin
        (sleep_until (= (volume_test_objects "vol_silo_enter" (players)) true))
        (ai_disposable "disposal_flood" true)
        (ai_disposable "disposal_infection" true)
        (data_mine_insert "04b_3_silo_start")
        (game_save_no_timeout)
        (kill_volume_enable "kill_silo_toggle")
        (ai_renew "all_allies")
        (ai_set_orders "arm02_allies" "allies_silo")
        (ai_place "silo_sentinels_initial" 2)
        (ai_place "silo_flood_initial" 4)
        (wake silo_killer)
        (wake music_04b_02_start)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_specimen_storage" (players)) true)
                (> (player_count) 0)
            )
        )
        (wake elev_go)
        (wake silo_covers_invincible)
        (wake silo_flood_spawner)
        (wake silo_sentinel_spawner)
        (ai_set_orders "arm02_allies" "allies_silo_lift")
        (sleep_until 
            (and
                (= (ai_nonswarm_count "silo_flood_initial") 0)
                (= (ai_nonswarm_count "silo_sentinels_initial") 0)
            ) 
        30 4000)
        (ai_scene "silo_ally_scene" silo_ally_comment "all_allies")
        (sleep_until 
            (or
                (= silo_almost_there true)
                (= (volume_test_objects "vol_leaving_silo" (players)) true)
            )
        )
        (data_mine_insert "04b_5_silo_end")
        (set silo_try_save true)
        (wake silo_hall_flood_spawner)
        (ai_set_orders "silo_flood" "silo_all")
        (ai_place "silo_sentinels_below" 3)
    )
)

(script command_script void halls2lab_ally_comment
    (begin
        (cs_switch "ally")
        (print "spec-ops elite: 'we should have brought weapons to burn these bodies.'")
        (cs_play_line "1240")
        (sleep 30)
        (print "spec-ops elite: 'every one is a potential vessel for the flood!'")
        (cs_play_line "1250")
    )
)

(script dormant void to_flood_lab
    (begin
        (sleep_until (= (volume_test_objects "vol_hall_to_lab" (players)) true))
        (ai_disposable "silo_flood" true)
        (ai_disposable "silo_infection" true)
        (ai_disposable "silo_sentinels_all" true)
        (data_mine_insert "04b_6_hall_to_lab")
        (game_saving)
        (ai_renew "all_allies")
        (ai_set_orders "arm02_allies" "allies_lab_upper")
        (sleep_until 
            (or
                (= (volume_test_objects "vol_hall_to_lab" (ai_actors "allies_elites")) true)
                (= (ai_living_count "allies_elites") 0)
            )
        )
        (ai_scene "halls2lab_scene" halls2lab_ally_comment "all_allies")
    )
)

(script dormant void famine_flavor
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_famine_01" (players)) true)
                (= (volume_test_objects "vol_famine_02" (players)) true)
            )
        )
        (object_create "famine")
        (ai_place "famine_cf")
        (cs_run_command_script "famine_cf" forever_pause)
        (custom_animation_loop (unit (list_get (ai_actors "famine_cf") 0)) "objects\characters\floodcombat_elite\floodcombat_elite" "combat:thrash_back:var0" true)
        (custom_animation_loop (unit (list_get (ai_actors "famine_cf") 1)) "objects\characters\floodcombat_elite\floodcombat_elite" "combat:thrash_back:var1" true)
        (custom_animation_loop (unit (list_get (ai_actors "famine_cf") 2)) "objects\characters\floodcombat_elite\floodcombat_elite" "combat:thrash_front:var0" true)
        (custom_animation_loop (unit (list_get (ai_actors "famine_cf") 3)) "objects\characters\floodcombat_elite\floodcombat_elite" "combat:thrash_front:var1" true)
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
            )
        )
        (reset_dsp_image 4)
    )
)

(script command_script void airlock_commander
    (begin
        (cs_switch "commander")
        (print "spec-ops commander: 'bring the phantoms close to the mine! we are not leaving until the leader of these heretics is dead!'")
        (cs_play_line "0110")
    )
)

(script dormant void airlock_commander_talk
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "phantom pilot: 'leader! the storm is about to hit! we cannot maintain our position!'")
        (sleep (ai_play_line_on_object none "0100"))
        (print "spec-ops commander: 'bring the phantoms close to the mine! we are not leaving until the leader of these heretics is dead!'")
        (sleep (ai_play_line_on_object none "0110"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void research_arm_bsp_swap
    (begin
        (device_one_sided_set "lab_exit_int" true)
        (device_set_never_appears_locked "lab_exit_int" true)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_research_arm_swap" (ai_actors "allies_elites")) true)
                (> (player_count) 0)
            ) 
        30 300)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_research_arm_swap" (players)) true)
                (> (player_count) 0)
                (<= (device_get_position "lab_exit_int") 0.0)
            )
        )
        (device_operates_automatically_set "lab_exit_int" false)
        (device_set_never_appears_locked "lab_exit_int" false)
        (sleep_until 
            (begin
                (if (= (volume_test_object "trans_3,0" (list_get (ai_actors "all_allies") 4)) false) 
                    (object_destroy (list_get (ai_actors "all_allies") 4)))
                (sleep 2)
                (if (= (volume_test_object "trans_3,0" (list_get (ai_actors "all_allies") 3)) false) 
                    (object_destroy (list_get (ai_actors "all_allies") 3)))
                (sleep 2)
                (if (= (volume_test_object "trans_3,0" (list_get (ai_actors "all_allies") 2)) false) 
                    (object_destroy (list_get (ai_actors "all_allies") 2)))
                (sleep 2)
                (if (= (volume_test_object "trans_3,0" (list_get (ai_actors "all_allies") 1)) false) 
                    (object_destroy (list_get (ai_actors "all_allies") 1)))
                (sleep 2)
                (if (= (volume_test_object "trans_3,0" (list_get (ai_actors "all_allies") 0)) false) 
                    (object_destroy (list_get (ai_actors "all_allies") 0)))
                (sleep 2)
                false
            ) 
        30 60)
        (begin_random
            (begin
                (object_create "gas01")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas02")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas03")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas04")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas05")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas06")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas07")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas08")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas09")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create "gas10")
                (sleep (random_range 5 15))
            )
        )
        (structure_bsp_index 0)
        (ai_set_orders "all_allies" "allies_wraparound")
        (sleep_until (= (version) 0))
        (wake airlock_commander_talk)
        (sleep 30)
        (begin_random
            (begin
                (object_destroy "gas01")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas02")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas03")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas04")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas05")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas06")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas07")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas08")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas09")
                (sleep (random_range 5 15))
            )
            (begin
                (object_destroy "gas10")
                (sleep (random_range 5 15))
            )
        )
        (sleep 30)
        (device_operates_automatically_set "lab_exit_ext" true)
    )
)

(script dormant void lab_barricades
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_carriers_01/1"))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_carriers_01/2"))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_carriers_01/3"))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_carriers_01/4"))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_carriers_01/5"))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_carriers_01/6"))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_combatforms_01" 1))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_combatforms_01" 1))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_combatforms_01" 1))
                )
                (or
                    (< (ai_strength "lab_heretics_01") 0.5)
                    (= (volume_test_objects "vol_lab_floor" (players)) true)
                )
            )
        )
        (sleep_until 
            (begin
                (begin_random
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_carriers_02" 1))
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (ai_place "lab_combatforms_02" 1))
                )
                (or
                    (= (ai_living_count "lab_heretics_01") 0)
                    (= (volume_test_objects "vol_lab_floor" (players)) true)
                )
            )
        )
    )
)

(script command_script void lab_heretics_ally
    (begin
        (cs_switch "ally")
        (print "spec-ops elite: 'heretics!  above!'")
        (cs_play_line "1270")
    )
)

(script command_script void lab_heretics_commander
    (begin
        (cs_switch "commander")
        (print "spec-ops commander: 'heretics!  above!'")
        (cs_play_line "1260")
    )
)

(script command_script void lab_juggernaut_ally
    (begin
        (cs_switch "ally")
        (print "spec-ops elite: 'it comes!  prepare yourself, arbiter!'")
        (cs_play_line "1290")
    )
)

(script command_script void lab_juggernaut_commander
    (begin
        (cs_switch "commander")
        (print "spec-ops commander: 'it comes!  prepare yourself, arbiter!'")
        (cs_play_line "1280")
    )
)

(script command_script void lab_jugg_hint1_ally
    (begin
        (cs_switch "ally")
        (print "spec-ops elite: 'it shrugs off our every assault!  it must have a weak spot!'")
        (cs_play_line "1290")
    )
)

(script command_script void lab_jugg_hint1_commander
    (begin
        (cs_switch "commander")
        (print "spec-ops commander: 'it shrugs off our every assault!  it must have a weak spot!'")
        (cs_play_line "1280")
    )
)

(script command_script void lab_jugg_hint2_ally
    (begin
        (cs_switch "ally")
        (print "spec-ops elite: 'the eye, arbiter!  aim for its eye!'")
        (cs_play_line "1290")
    )
)

(script command_script void lab_jugg_hint2_commander
    (begin
        (cs_switch "commander")
        (print "spec-ops commander: 'the eye, arbiter!  aim for its eye!'")
        (cs_play_line "1280")
    )
)

(script command_script void stay_shootin
    (begin
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void lab_turret_man_r
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "lab_exit_turrets/r"))
        (sleep_until (= (unit_in_vehicle (unit (ai_get_object ai_current_actor))) true) 30 450)
        (if (= (unit_in_vehicle (unit (ai_get_object ai_current_actor))) true) 
            (begin
                (cs_set_behavior "guard")
                (sleep_forever)
            )
        )
    )
)

(script command_script void lab_turret_man_l
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "lab_exit_turrets/l"))
        (sleep_until (= (unit_in_vehicle (unit (ai_get_object ai_current_actor))) true) 30 450)
        (if (= (unit_in_vehicle (unit (ai_get_object ai_current_actor))) true) 
            (begin
                (cs_set_behavior "guard")
                (sleep_forever)
            )
        )
    )
)

(script dormant void fuck_this_turret_shit
    (begin
        (sleep 120)
        (ai_vehicle_enter "lab_grunts_02" (ai_vehicle_get_from_starting_location "lab_exit_turrets/r"))
        (ai_vehicle_enter "lab_grunts_02" (ai_vehicle_get_from_starting_location "lab_exit_turrets/l"))
    )
)

(script dormant void lab_wave_new_01
    (begin
        (sleep_until 
            (begin
                (if (< (ai_nonswarm_count "lab_flood") 4) 
                    (begin
                        (ai_place "lab_carriers_02" 1)
                        (set lab_flood_count (+ lab_flood_count 1.0))
                    )
                )
                (> lab_flood_count 5)
            ) 
        30 8000)
    )
)

(script dormant void lab_wave_new_02
    (begin
        (sleep_until 
            (begin
                (if (< (ai_nonswarm_count "lab_flood") 4) 
                    (begin
                        (ai_place "lab_combatforms_02" 1)
                        (set lab_flood_count (+ lab_flood_count 1.0))
                    )
                )
                false
            ) 
        30 1800)
    )
)

(script dormant void flood_lab_start
    (begin
        (sleep_until (= (volume_test_objects "vol_lab_enter" (players)) true))
        (data_mine_insert "04b_7_flood_lab_start")
        (game_saving)
        (set silo_killer_power false)
        (ai_place "lab_heretics_01" 1)
        (ai_place "lab_turret_grunts_01" 2)
        (ai_place "lab_exit_turrets" 2)
        (ai_place "lab_carriers_01/init1")
        (ai_place "lab_carriers_01/init2")
        (ai_place "lab_carriers_01/init3")
        (wake lab_barricades)
        (if (difficulty_legendary) 
            (wake famine_flavor))
        (wake music_04b_03_start)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_lab_floor" (players)) true)
                (> (player_count) 0)
            ) 
        30 900)
        (if 
            (and
                (= (volume_test_objects_all "vol_lab_floor" (players)) false)
                (> (player_count) 0)
            ) 
                (begin_random
                    (begin
                        (ai_place "lab_combatforms_02/r1")
                        (sleep (random_range 5 45))
                    )
                    (begin
                        (ai_place "lab_combatforms_02/r2")
                        (sleep (random_range 5 45))
                    )
                    (begin
                        (ai_place "lab_combatforms_02/r3")
                        (sleep (random_range 5 45))
                    )
                    (begin
                        (ai_place "lab_combatforms_02/r4")
                        (sleep (random_range 5 45))
                    )
                )
        )
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_lab_floor" (players)) true)
                (> (player_count) 0)
            )
        )
        (game_saving)
        (ai_set_orders "arm02_allies" "allies_lab_lower")
        (sleep_until 
            (and
                (= (ai_nonswarm_count "lab_flood") 0)
                (= (ai_living_count "lab_heretics") 0)
                (= (volume_test_objects_all "vol_lab_floor" (players)) true)
                (> (player_count) 0)
            ) 
        30 8000)
        (data_mine_insert "04b_8_flood_lab_mid_01")
        (game_saving)
        (ai_place "lab_heretics_above" 3)
        (sleep 15)
        (ai_magically_see_object "lab_heretics_above" (player0))
        (ai_magically_see_object "lab_heretics_above" (player1))
        (sleep_until (= (objects_can_see_object (players) (list_get (ai_actors "lab_heretics_above") 0) 60.0) true) 30 450)
        (sleep_until 
            (or
                (= (ai_living_count "allies_elites") 0)
                (ai_scene "lab_heretic_ally_scene" lab_heretics_ally "all_allies")
            ) 
        30 300)
        (ai_place "lab_combatforms_02/r2")
        (ai_place "lab_carriers_02/r4")
        (ai_set_orders "lab_flood" "lab_above")
        (sleep_until 
            (begin
                (begin_random
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_combatforms_02/r1")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_combatforms_02/r2")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_combatforms_02/r3")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_combatforms_02/r4")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_combatforms_02/r5")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_carriers_02/r1")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_carriers_02/r2")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_carriers_02/r3")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_carriers_02/r4")
                            (sleep (random_range 10 40))
                        )
                    )
                    (if (< (ai_nonswarm_count "lab_flood") 4) 
                        (begin
                            (ai_place "lab_carriers_02/r5")
                            (sleep (random_range 10 40))
                        )
                    )
                )
                (or
                    (< (ai_living_count "lab_heretics_above") 1)
                    (and
                        (= (volume_test_objects_all "vol_lab_floor" (ai_actors "lab_heretics_above")) true)
                        (> (player_count) 0)
                    )
                )
            ) 
        30 4000)
        (game_saving)
        (ai_set_orders "lab_heretics_above" "lab_flood_all")
        (ai_set_orders "lab_flood" "lab_flood_all")
        (ai_set_orders "arm02_allies" "allies_lab_wagons")
        (sleep_until 
            (and
                (< (ai_nonswarm_count "lab_flood") 1)
                (< (ai_living_count "lab_heretics_above") 1)
            ) 
        30 2000)
        (game_saving)
        (music_04b_03_start_alt)
        (set lab_flood_count 0)
        (wake lab_wave_new_02)
        (sleep 1800)
        (sleep_until (< (ai_nonswarm_count "lab_flood") 1) 30 3600)
        (sleep_until (= (ai_trigger_test "done_fighting" "lab_flood") true) 30 1800)
        (data_mine_insert "04b_9_flood_lab_mid_02")
        (game_saving)
        (music_04b_03_stop_alt)
        (set lab_flood_count 0)
        (wake lab_wave_new_01)
        (data_mine_insert "04b_10_flood_lab_end")
        (sleep 90)
        (device_operates_automatically_set "lab_exit_int" true)
        (ai_place "lab_heretics_02" 2)
        (ai_place "lab_grunts_02" 3)
        (ai_set_orders "arm02_allies" "allies_lab_end")
        (wake fuck_this_turret_shit)
        (wake music_04b_03_stop)
        (sleep_until 
            (or
                (= (ai_living_count "lab_heretics") 0)
                (and
                    (= (volume_test_objects_all "vol_research_arm_swap" (players)) true)
                    (> (player_count) 0)
                )
            )
        )
        (game_saving)
        (ai_set_orders "all_allies" "allies_airlock")
        (wake research_arm_bsp_swap)
    )
)

(script dormant void wind
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (begin
                        (sound_impulse_start_effect "sound\ambience\sound_scenery\gusty_wind\details\gusty_wind" none 1.0)
                        (sleep_until 
                            (or
                                (= (volume_test_objects "vol_control_enter" (players)) true)
                                (= (version) 2)
                            ) 
                        5 30)
                        (player_effect_start (real_random_range 0.1 1.0) (real_random_range 0.1 1.0) 0.0)
                        (hud_show_health (real_random_range 0.05 0.2) (real_random_range 0.5 2.0))
                        (hud_blink_health (real_random_range 3.0 5.0))
                        (sleep_until 
                            (or
                                (= (volume_test_objects "vol_control_enter" (players)) true)
                                (= (version) 2)
                            ) 
                        5 (random_range 150 300))
                        (or
                            (= (volume_test_objects "vol_control_enter" (players)) true)
                            (= (version) 2)
                        )
                    )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_gusty" (players)) true)
                        (= (version) 2)
                    ) 
                5)
                (= (version) 2)
            )
        )
    )
)

(script command_script void bridge_phantom_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by airspace_bridge/ph0 5.0)
        (cs_vehicle_speed 0.5)
        (cs_fly_by airspace_bridge/ph1 2.0)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") true)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") phantom_p_a03)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") phantom_p_a02)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") phantom_p_a01)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") phantom_p_b01)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") phantom_p)
        (sleep_until (< (ai_living_count "allied_phantom_02") 2))
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") false)
        (cs_fly_by airspace_bridge/ph2 5.0)
        (cs_fly_by airspace_bridge/ph3 5.0)
        (cs_fly_by airspace_bridge/ph4 5.0)
        (cs_fly_to airspace_bridge/phx 2.0)
        (ai_erase "allied_phantom_02")
    )
)

(script dormant void bridge_phantom_go
    (begin
        (ai_place "allies_elites_04" (- 2.0 (ai_living_count "allies_elites")))
        (ai_place "allies_grunts_04" (- 2.0 (ai_living_count "allies_grunts_03")))
        (ai_place "allied_phantom_02")
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") phantom_p (ai_actors "allies_grunts_04"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") phantom_p (ai_actors "allies_elites_04"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "allied_phantom_02/pilot") true)
        (cs_run_command_script "allied_phantom_02/pilot" bridge_phantom_arrives)
    )
)

(script command_script void bridge_commander_comment
    (begin
        (cs_switch "commander")
        (cs_start_approach_player 1.0 20.0 20.0)
        (print "spec-ops commander: 'arbiter, the flood has spread throughout the station!'")
        (cs_play_line "0670")
        (print "spec-ops commander: 'we don't have enough troops to manage such a large infestation!'")
        (cs_play_line "0680")
        (print "spec-ops commander: 'find the leader of these heretics! kill him now!'")
        (cs_play_line "0672")
        (cs_approach_stop)
    )
)

(script command_script void bridge_commander_reminder
    (begin
        (cs_switch "commander")
        (cs_start_approach_player 1.0 20.0 20.0)
        (print "spec-ops commander: 'onward! to the core of the station!'")
        (cs_play_line "1340")
        (cs_approach_stop)
    )
)

(script dormant void bridge_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_control_enter" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_control_enter" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "spec-ops commander: 'onward! to the core of the station!'")
                    (sleep (ai_play_line_on_object none "1340"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void wraparound_right
    (begin
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_right_01" (players)) true)
            )
        )
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_heretics_r_02" 2))
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_h_grunts_r_03" (- 4.0 (+ (ai_living_count "bridge_h_grunts_init") (ai_living_count "bridge_runners")))))
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_right_02" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_heretics_r_04" (- 2.0 (ai_living_count "bridge_heretics_r_02"))))
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_right_03" (players)) true)
            )
        )
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_sentinels_r_05" 3))
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_final" (players)) true)
            )
        )
        (set bridge_final_gone true)
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_heretics_final" (- 2.0 (+ (ai_living_count "bridge_heretics_r_04") (ai_living_count "bridge_heretics_l_04")))))
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_h_grunts_final" 2))
    )
)

(script dormant void wraparound_left
    (begin
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_left_01" (players)) true)
            )
        )
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_heretics_l_02" 2))
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_h_grunts_l_03" (- 4.0 (+ (ai_living_count "bridge_h_grunts_init") (ai_living_count "bridge_runners")))))
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_left_02" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_heretics_l_04" (- 2.0 (ai_living_count "bridge_heretics_l_02"))))
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_left_03" (players)) true)
            )
        )
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_sentinels_l_05" 3))
        (sleep_until 
            (and
                (= bridge_final_gone false)
                (= (volume_test_objects "vol_wrap_final" (players)) true)
            )
        )
        (set bridge_final_gone true)
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_heretics_final" (- 2.0 (+ (ai_living_count "bridge_heretics_r_04") (ai_living_count "bridge_heretics_l_04")))))
        (if (< (ai_nonswarm_count "bridge_enemies") 8) 
            (ai_place "bridge_h_grunts_final" 2))
    )
)

(script dormant void bridge_start
    (begin
        (data_mine_insert "04b_11_wraparound")
        (ai_disposable "lab_flood" true)
        (ai_disposable "lab_heretics" true)
        (game_save_no_timeout)
        (sleep 60)
        (ai_place "bridge_runners" 2)
        (ai_place "bridge_h_grunts_init" 3)
        (ai_place "bridge_infection" 3)
        (ai_place "bridge_combatforms" 1)
        (ai_place "bridge_carriers" 2)
        (device_operates_automatically_set "control_room_ext" true)
        (sleep_until (= (volume_test_objects "vol_on_bridge" (players)) true) 30 150)
        (game_save_no_timeout)
        (wake wraparound_right)
        (wake wraparound_left)
        (ai_renew "all_allies")
        (wake bridge_phantom_go)
        (wake bridge_reminder)
        (wake wind)
        (sleep_until (> (ai_living_count "allied_phantom_02") 1))
        (sleep_until (< (ai_living_count "allied_phantom_02") 2))
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'arbiter, the flood has spread throughout the station!'")
        (sleep (ai_play_line_on_object none "0670"))
        (print "spec-ops commander: 'we don't have enough troops to manage such a large infestation!'")
        (sleep (ai_play_line_on_object none "0671"))
        (print "spec-ops commander: 'find the leader of these heretics! kill him now!'")
        (sleep (ai_play_line_on_object none "0672"))
        (sleep 30)
        (ai_dialogue_enable true)
        (game_saving)
    )
)

(script dormant void hl_killer
    (begin
        (sleep_until 
            (begin
                (if (= (volume_test_object "vol_hl_killer" (player0)) true) 
                    (unit_kill (unit (player0))))
                (if (= (volume_test_object "vol_hl_killer" (player1)) true) 
                    (unit_kill (unit (player1))))
                (= (version) 2)
            ) 
        1)
    )
)

(script dormant void hologram_toggle
    (begin
        (sleep_until 
            (begin
                (sleep_until (<= (objects_distance_to_flag (players) "mine_holo") 5.0))
                (object_create_anew "gasmine_hologram")
                (object_set_function_variable "gasmine_hologram" "holo_power" 0.0 0.0)
                (object_set_function_variable "gasmine_hologram" "holo_power" 1.0 30.0)
                (sleep 30)
                (sleep_until (> (objects_distance_to_flag (players) "mine_holo") 5.0))
                (object_set_function_variable "gasmine_hologram" "holo_power" 1.0 0.0)
                (object_set_function_variable "gasmine_hologram" "holo_power" 0.0 30.0)
                (sleep 30)
                (object_destroy "gasmine_hologram")
                false
            )
        )
    )
)

(script dormant void control_commander_reminder
    (begin
        (sleep_until (> (device_get_position "elev_control_up") 0.0) 30 3600)
        (if (<= (device_get_position "elev_control_up") 0.0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "spec-ops commander: 'make your way up to the cable, arbiter.'")
                (sleep (ai_play_line_on_object none "1350"))
                (print "spec-ops commander: 'there should be an elevator above you!'")
                (sleep (ai_play_line_on_object none "1360"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
    )
)

(script command_script void control_grunt_comment
    (begin
        (cs_switch "grunt")
        (print "spec-ops grunt: 'heretic boss! you see? you see?'")
        (cs_play_line "0700")
    )
)

(script command_script void control_elite_comment
    (begin
        (cs_switch "elite")
        (print "spec-ops elite: 'there! the heretic leader!'")
        (cs_play_line "0680")
    )
)

(script command_script void heretic_leader_holes_up
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_go_to control_room/p0)
        (cs_face_player true)
        (device_set_position_immediate "shield" 0.0)
        (sleep_forever)
    )
)

(script command_script void sog_bug_out_01
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to bridge/p3)
    )
)

(script command_script void sog_bug_out_02
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to bridge/p4)
    )
)

(script command_script void sog_bug_out_03
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to bridge/p5)
    )
)

(script command_script void sog_bug_out_04
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_go_to bridge/p6)
    )
)

(script command_script void commander_farewell
    (begin
        (cs_switch "commander")
        (print "spec-ops commander: 'warriors, return to the landing-zone! the arbiter will continue upward, cut this station loose, and scare the heretic from his hole!'")
        (cs_play_line "0120")
        (set comm_farewell_done true)
        (sleep_until 
            (or
                (= soe_farewell_done true)
                (< (ai_living_count "control_elites_cinematic") 2)
            )
        )
        (sleep 30)
        (cs_start_approach_player 2.0 20.0 20.0)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (if 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\melee\energy_blade\energy_blade.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\melee\energy_blade\energy_blade.weapon")
            ) 
                (begin
                    (print "spec-ops commander: 'keep your blade handy - i doubt the cable can withstand its bite.'")
                    (cs_play_line "0140")
                ) (begin
                    (print "spec-ops commander: 'take my blade - i doubt the cable can withstand its bite.'")
                    (cs_play_line "0130")
                    (sleep_until 
                        (or
                            (unit_has_weapon (unit (player0)) "objects\weapons\melee\energy_blade\energy_blade.weapon")
                            (unit_has_weapon (unit (player1)) "objects\weapons\melee\energy_blade\energy_blade.weapon")
                            (= (volume_test_objects "vol_control_middle" (players)) true)
                        ) 
                    30 900)
                )
        )
    )
)

(script command_script void spec_op_farewell
    (begin
        (cs_switch "ally01")
        (sleep_until (= comm_farewell_done true))
        (sleep 30)
        (print "spec-ops elite: 'may our lords guide your hand!'")
        (cs_play_line "0150")
        (cs_enable_moving true)
        (cs_switch "ally02")
        (sleep 30)
        (print "spec-ops elite: 'we shall not forget your sacrifice!'")
        (cs_play_line "0160")
        (set soe_farewell_done true)
    )
)

(script command_script void soe_bug_out_01
    (begin
        (sleep_until (= comm_farewell_done true))
        (sleep 30)
        (print "spec-ops elite: 'may our lords guide your hand!'")
        (cs_play_line "0150")
    )
)

(script command_script void soe_bug_out_02
    (begin
        (sleep_until (= comm_farewell_done true))
        (sleep 120)
        (print "spec-ops elite: 'we shall not forget your sacrifice!'")
        (cs_play_line "0160")
        (sleep 15)
        (set soe_farewell_done true)
    )
)

(script command_script void control_bug_out_flight
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by airspace_bridge/ph1too)
        (cs_vehicle_speed 0.5)
        (cs_fly_by airspace_bridge/ph2too)
        (cs_fly_to_and_face airspace_bridge/ph3too airspace_bridge/ph4too)
        (set bug_out_phantom_here true)
        (object_create "phantom_vol")
        (sleep_until (< (ai_living_count "all_allies") 1))
        (cs_pause 1.0)
        (object_destroy "phantom_vol")
        (cs_fly_by airspace_bridge/ph4too)
        (cs_vehicle_speed 1.0)
        (cs_fly_to airspace_bridge/phxtoo)
        (ai_erase "allied_phantom_03")
    )
)

(script command_script void bug_out_pussy
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to bridge/grav)
        (cs_jump 0.0 1.0)
        (sleep_until (= (volume_test_objects "vol_gusty" (ai_get_object ai_current_actor)) false) 1)
        (object_set_scale (ai_get_object ai_current_actor) 0.1 15)
        (sleep 15)
        (ai_erase ai_current_actor)
    )
)

(script dormant void control_bug_out
    (begin
        (ai_place "allied_phantom_03")
        (cs_run_command_script "allied_phantom_03" control_bug_out_flight)
        (sleep_until (= bug_out_phantom_here true))
        (cs_queue_command_script "control_commander_cinematic" bug_out_pussy)
        (sleep_until (< (ai_living_count "control_commander_cinematic") 1))
        (cs_run_command_script "control_elites_cinematic/elite01" bug_out_pussy)
        (sleep_until (< (ai_living_count "control_elites_cinematic") 2))
        (cs_run_command_script "control_elites_cinematic/elite02" bug_out_pussy)
        (sleep_until (< (ai_living_count "control_elites_cinematic") 1))
        (cs_run_command_script "allies_grunts_03" bug_out_pussy)
        (sleep_until (< (ai_living_count "allies_grunts_03") 1))
        (cs_run_command_script "allies_grunts_04" bug_out_pussy)
        (sleep_until (< (ai_living_count "allies_grunts_04") 1))
    )
)

(script dormant void control_flood_spawn
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_flood") 6)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (= (volume_test_objects "vol_control_perimeter" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "control_flood_wave_02_combat" 1)
                            )
                    )
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_flood") 6)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (= (volume_test_objects "vol_control_perimeter" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "control_flood_wave_02_combat" 1)
                            )
                    )
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_flood") 6)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (= (volume_test_objects "vol_control_perimeter" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "control_flood_wave_02_carriers" 1)
                            )
                    )
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_flood") 6)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (= (volume_test_objects "vol_control_perimeter" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "control_flood_wave_03_combat" 1)
                            )
                    )
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_flood") 6)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (= (volume_test_objects "vol_control_perimeter" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "control_flood_wave_03_combat" 1)
                            )
                    )
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_flood") 6)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (= (volume_test_objects "vol_control_perimeter" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (begin
                                (ai_place "control_flood_wave_03_carriers" 1)
                            )
                    )
                )
                (or
                    (= (volume_test_objects "vol_control_perimeter" (players)) true)
                    (> (ai_spawn_count "control_flood") 10)
                )
            )
        )
    )
)

(script dormant void control_room_start
    (begin
        (sleep_until (= (volume_test_objects "vol_control_enter" (players)) true))
        (wake hl_killer)
        (ai_disposable "bridge_flood" true)
        (ai_disposable "bridge_heretics" true)
        (ai_disposable "bridge_sentinels" true)
        (data_mine_insert "04b_12_control_room_01")
        (game_save_no_timeout)
        (ai_migrate "allies_elites" "allies_elites_04")
        (device_set_power "control_up_switch_01" 0.0)
        (device_set_position_immediate "elev_control_up" 0.041)
        (device_set_position_immediate "shield" 1.0)
        (device_set_position_immediate "control_shield_door" 1.0)
        (ai_renew "all_allies")
        (ai_set_orders "core_allies" "allies_control")
        (ai_place "heretic_leader_control")
        (ai_cannot_die "heretic_leader_control" true)
        (unit_impervious (ai_actors "heretic_leader_control") true)
        (ai_set_blind "heretic_leader_control" true)
        (ai_set_deaf "heretic_leader_control" true)
        (cs_run_command_script "heretic_leader_control" heretic_leader_holes_up)
        (ai_disregard (ai_actors "heretic_leader_control") true)
        (ai_place "control_flood_wave_01_combat" 4)
        (ai_place "control_sentinels_wave_01" 3)
        (wake music_04b_04_start)
        (wake hologram_toggle)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_control_enter" (ai_actors "allies_grunts_03")) true)
                (= (volume_test_objects "vol_control_enter" (ai_actors "allies_grunts_04")) true)
                (= (volume_test_objects "vol_control_enter" (ai_actors "allies_elites_04")) true)
            ) 
        30 300)
        (sleep_until 
            (or
                (ai_scene "control_grunt_scene" control_grunt_comment "all_allies")
                (ai_scene "control_elite_scene" control_elite_comment "all_allies")
            ) 
        30 300)
        (sleep_until 
            (and
                (= (ai_nonswarm_count "control_flood_wave_01_combat") 0)
                (= (ai_living_count "control_sentinels_wave_01") 0)
            )
        )
        (sleep 60)
        (wake music_04b_04_start_alt)
        (cinematic_fade_to_white)
        (ai_erase "heretic_leader_control")
        (ai_erase "all_enemies")
        (ai_erase "disposal_commander")
        (ai_erase "allies_elites")
        (ai_erase "allies_elites_04")
        (object_teleport (player0) "player0_hide")
        (object_teleport (player1) "player1_hide")
        (sleep_forever hologram_toggle)
        (object_create_anew "gasmine_hologram")
        (object_set_function_variable "gasmine_hologram" "holo_power" 1.0 0.0)
        (if (cinematic_skip_start) 
            (begin
                (c04_intra1)
            )
        )
        (cinematic_skip_stop)
        (ui_error_ok_cancel)
        (sound_class_enable_ducker "amb" 0.0 0)
        (sleep 1)
        (sound_class_enable_ducker "amb" 1.0 15)
        (sleep 2)
        (object_teleport (player0) "player0_control")
        (object_teleport (player1) "player1_control")
        (device_set_position_immediate "control_shield_door" 0.0)
        (device_set_position_immediate "shield" 0.0)
        (ai_place "control_elites_cinematic")
        (ai_place "control_commander_cinematic")
        (ai_cannot_die "control_commander_cinematic" true)
        (ai_set_orders "all_allies" "allies_pickup")
        (device_set_power "control_up_switch_01" 1.0)
        (wake hologram_toggle)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white)
        (wake music_04b_04_stop_alt)
        (wake objective_control_clear)
        (wake objective_cables_set)
        (ai_scene "control_comm_scene" commander_farewell "all_allies")
        (cs_run_command_script "control_elites_cinematic/elite01" soe_bug_out_01)
        (cs_run_command_script "control_elites_cinematic/elite02" soe_bug_out_02)
        (data_mine_insert "04b_13_control_room_02")
        (game_save_no_timeout)
        (wake control_commander_reminder)
        (wake control_bug_out)
        (sleep_until (= (volume_test_objects "vol_control_middle" (players)) true) 30 1800)
        (wake control_flood_spawn)
        (sleep_until 
            (or
                (>= (ai_combat_status "control_flood") ai_combat_status_visible)
                (= (volume_test_objects "vol_control_middle" (players)) true)
                (= (volume_test_objects "vol_control_perimeter" (players)) true)
                (= (volume_test_objects "vol_control_top" (ai_actors "control_flood")) true)
            )
        )
        (wake music_04b_05_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_control_perimeter" (players)) true)
                (= (volume_test_objects "vol_control_top" (ai_actors "control_flood")) true)
            )
        )
        (device_set_position "elev_control_up" 0.0)
        (ai_place "control_sentinels_wave_03" 3)
        (sleep_until (= (volume_test_objects "vol_control_return" (players)) true))
        (wake music_04b_04_stop)
        (objects_predict "cableroom")
    )
)

(script dormant void strain
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (effect_new stress "croom01")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom02")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom03")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom04")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom05")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom06")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom07")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom08")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom09")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom10")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom11")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new stress "croom12")
                        (sleep (random_range 5 30))
                    )
                )
                (= (version) 4)
            )
        )
    )
)

(script dormant void rip
    (begin
        (begin_random
            (begin
                (effect_new boom "tear01")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear02")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear03")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear04")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear05")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear06")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear07")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear08")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear09")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear10")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear11")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear12")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear13")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear14")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear15")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear16")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear17")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear18")
                (sleep (random_range 1 5))
            )
            (begin
                (effect_new boom "tear19")
                (sleep (random_range 1 5))
            )
        )
    )
)

(script command_script void try_to_fix
    (begin
        (cs_ignore_obstacles true)
        (cs_approach "croom_center" 4.0 20.0 20.0)
        (unit_add_equipment (unit (ai_get_object ai_current_actor)) "swap" true true)
        (cs_shoot true "croom_center")
    )
)

(script dormant void grav_test
    (begin
        (set gravity 0.0)
        (physics_set_gravity gravity)
        (sleep_until 
            (begin
                (physics_set_gravity gravity)
                (set gravity (+ gravity 0.1))
                (> gravity 0.9)
            )
        )
        (set gravity 1.0)
        (physics_set_gravity gravity)
    )
)

(script static void cam_shake
    (begin
        (player_effect_start 0.0 2.0 2.0)
        (hud_show_health 0.5 0.0)
        (hud_blink_health 1.5)
    )
)

(script static void cam_roll
    (begin
        (player_effect_start 0.2 0.2 0.2)
        (hud_show_health 0.1 1.0)
    )
)

(script dormant void cam_shake_cont
    (begin
        (player_effect_start 0.0 2.0 2.0)
        (hud_show_health 0.5 0.0)
        (sleep_until (= (volume_test_objects "vol_going_down" (players)) true))
        (hud_show_health 0.45 0.0)
        (sleep 60)
        (hud_show_health 0.4 0.0)
        (sleep 60)
        (hud_show_health 0.35 0.0)
        (sleep 60)
        (hud_show_health 0.3 0.0)
        (sleep 60)
        (hud_show_health 0.25 0.0)
        (sleep 60)
        (hud_show_health 0.2 0.0)
        (sleep 60)
        (hud_show_health 0.15 0.0)
        (sleep 60)
        (hud_show_health 0.1 0.0)
        (sleep 60)
        (hud_show_health 0.05 0.0)
    )
)

(script dormant void cable_invulnerable
    (begin
        (sleep_until (= cables_cuttable false) 1)
        (object_cannot_take_damage "real_cable_a")
        (object_cannot_take_damage "real_cable_b")
        (object_cannot_take_damage "real_cable_c")
        (sleep_until (= (device_get_position "cableroom") 1.0))
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'that's one! by the prophets! look at the station list!'")
        (sleep (ai_play_line_on_object none "1380"))
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep_until 
            (and
                (= cables_cuttable true)
                (= (device_get_position "cableroom") 1.0)
            ) 
        1)
        (object_can_take_damage "real_cable_a")
        (object_can_take_damage "real_cable_b")
        (object_can_take_damage "real_cable_c")
        (sleep 5)
        (sleep_until (= cables_cuttable false) 1)
        (object_cannot_take_damage "real_cable_a")
        (object_cannot_take_damage "real_cable_b")
        (object_cannot_take_damage "real_cable_c")
        (sleep_until (= (device_get_position "cableroom") 1.0))
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'one final cable arbiter…'")
        (sleep (ai_play_line_on_object none "1400"))
        (sleep 30)
        (ai_dialogue_enable true)
        (sleep 30)
        (wake music_04b_06_start)
        (sleep_until 
            (and
                (= cables_cuttable true)
                (= (device_get_position "cableroom") 1.0)
            ) 
        1)
        (object_can_take_damage "real_cable_a")
        (object_can_take_damage "real_cable_b")
        (object_can_take_damage "real_cable_c")
    )
)

(script dormant void cableroom_suck_killer
    (begin
        (sleep_until 
            (begin
                (object_destroy (list_get (volume_return_objects "vol_cableroom_suck_kill") 0))
                (sleep 5)
                (unit_kill (unit (list_get (volume_return_objects_by_type "vol_cableroom_suck_kill" 1) 0)))
                (sleep 5)
                (= in_cable_room false)
            ) 
        5)
    )
)

(script dormant void cableroom_junk_spawn
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (object_create_anew "croom_junk_01")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_02")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_03")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_04")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_05")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_06")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_07")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_08")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_09")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_10")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_11")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_12")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_13")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_14")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_15")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_16")
                        (sleep (random_range 20 60))
                    )
                    (begin
                        (object_create_anew "croom_junk_17")
                        (sleep (random_range 20 60))
                    )
                )
                (= in_cable_room false)
            )
        )
    )
)

(script dormant void cable_nav_a
    (begin
        (deactivate_nav_point_object default player "cable_target_a" 0.0)
        (sleep_until (<= (object_get_health "real_cable_a") 0.0))
        (error_overflow_suppression player "cable_target_a")
    )
)

(script dormant void cable_nav_b
    (begin
        (deactivate_nav_point_object default player "cable_target_b" 0.0)
        (sleep_until (<= (object_get_health "real_cable_b") 0.0))
        (error_overflow_suppression player "cable_target_b")
    )
)

(script dormant void cable_nav_c
    (begin
        (deactivate_nav_point_object default player "cable_target_c" 0.0)
        (sleep_until (<= (object_get_health "real_cable_c") 0.0))
        (error_overflow_suppression player "cable_target_c")
    )
)

(script dormant void cableroom_commander_reminder
    (begin
        (sleep_until 
            (or
                (<= (object_get_health "real_cable_a") 0.0)
                (<= (object_get_health "real_cable_b") 0.0)
                (<= (object_get_health "real_cable_c") 0.0)
            ) 
        30 3600)
        (if 
            (and
                (> (object_get_health "real_cable_a") 0.0)
                (> (object_get_health "real_cable_b") 0.0)
                (> (object_get_health "real_cable_c") 0.0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "spec-ops commander: 'sever the cable at the points where it connect to the structure!'")
                    (sleep (ai_play_line_on_object none "1370"))
                    (sleep 30)
                    (wake cable_nav_a)
                    (wake cable_nav_b)
                    (wake cable_nav_c)
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script command_script void cable_look
    (begin
        (cs_face_object true "cableroom")
        (sleep_until (= plummeting true))
    )
)

(script dormant void cable_a_health
    (begin
        (sleep_until (<= (object_get_health "real_cable_a") 0.0) 1)
        (set cables_cuttable false)
        (set cable_var (+ cable_var 1.0))
        (object_create_anew "cable_nub_a")
        (objects_attach "cableroom" "rot_a" "cable_nub_a" "cable_destroyed")
        (if (= cable_var 1) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_a" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_one" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_01_quad" none 1.0)
                (device_set_position_track "cableroom" "cable_room_rot_5_bc" 0.0)
                (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                (set croom_sen_total (ai_living_count "cable_sentinels"))
                (game_save_no_timeout)
            )
        )
        (if (= cable_var 2) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_a" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_one" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_02_quad" none 1.0)
                (if (<= (object_get_health "real_cable_b") 0.0) 
                    (begin
                        (device_set_position_track "cableroom" "cable_room_rot_ac2c" 0.0)
                        (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                        (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                        (set croom_sen_total (ai_living_count "cable_sentinels"))
                    )
                )
                (if (<= (object_get_health "real_cable_c") 0.0) 
                    (begin
                        (device_set_position_track "cableroom" "cable_room_rot_ab2b" 0.0)
                        (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                        (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                        (set croom_sen_total (ai_living_count "cable_sentinels"))
                    )
                )
                (game_save_no_timeout)
            )
        )
        (if (= cable_var 3) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_a" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_two" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_03_quad" none 1.0)
                (device_set_position_track "cableroom" "cable_room_rot_a_back" 0.0)
                (device_animate_position "cableroom" 1.0 2.0 0.0 0.5 false)
                (ai_set_orders "cable_sentinels" "cable_room_sentinels_end")
                (ai_set_blind "cable_sentinels" true)
                (ai_set_blind "cable_flood" true)
                (cs_run_command_script "cable_flood" cable_look)
                (wake music_04b_07_start)
                (wake strain)
                (sleep 400)
                (object_type_predict_high "scenarios\objects\solo\alphagasgiant\cable_room\cable_room")
                (object_type_predict_high "scenarios\objects\solo\alphagasgiant\cable_room_top\cable_room_top")
                (sleep 20)
                (objects_detach "cableroom" "real_cable_a")
                (objects_detach "cableroom" "real_cable_b")
                (objects_detach "cableroom" "real_cable_c")
                (objects_detach "cableroom" "elev_control_up")
                (objects_detach "cableroom" "control_up_switch_02")
                (objects_detach "cableroom" "cable_nub_a")
                (objects_detach "cableroom" "cable_nub_b")
                (objects_detach "cableroom" "cable_nub_c")
                (object_destroy "cableroom")
                (structure_bsp_index 4)
                (wake cam_shake_cont)
                (physics_disable_character_ground_adhesion_forces 1.0)
                (objects_attach "cableroom_top" "rot_a" "real_cable_a" "")
                (objects_attach "cableroom_top" "rot_b" "real_cable_b" "")
                (objects_attach "cableroom_top" "rot_c" "real_cable_c" "")
                (objects_attach "cableroom2" "elevator" "elev_control_up" "elev_top")
                (objects_attach "cableroom2" "switch" "control_up_switch_02" "")
                (objects_attach "cableroom2" "anim" "cable_nub_a" "torn02")
                (objects_attach "cableroom2" "anim" "cable_nub_b" "torn03")
                (objects_attach "cableroom2" "anim" "cable_nub_c" "")
                (device_set_position_track "cableroom2" "cable_room_drop" 0.0)
                (device_animate_position "cableroom2" 1.0 1.0 0.0 0.5 false)
                (device_set_position "cableroom_top" 1.0)
                (wake cableroom_suck_killer)
                (wake cableroom_junk_spawn)
                (object_create "suction")
                (wake grav_test)
                (set plummeting true)
                (ui_error_ok)
                (sleep 150)
                (object_destroy "cableroom_top")
            )
        )
        (sleep 30)
        (set cables_cuttable true)
    )
)

(script dormant void cable_b_health
    (begin
        (sleep_until (<= (object_get_health "real_cable_b") 0.0) 1)
        (set cables_cuttable false)
        (set cable_var (+ cable_var 1.0))
        (object_create_anew "cable_nub_b")
        (objects_attach "cableroom" "rot_b" "cable_nub_b" "cable_destroyed")
        (if (= cable_var 1) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_b" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_one" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_01_quad" none 1.0)
                (device_set_position_track "cableroom" "cable_room_rot_5_ac" 0.0)
                (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                (set croom_sen_total (ai_living_count "cable_sentinels"))
                (game_save_no_timeout)
            )
        )
        (if (= cable_var 2) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_b" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_one" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_02_quad" none 1.0)
                (if (<= (object_get_health "real_cable_a") 0.0) 
                    (begin
                        (device_set_position_track "cableroom" "cable_room_rot_bc2c" 0.0)
                        (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                        (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                        (set croom_sen_total (ai_living_count "cable_sentinels"))
                    )
                )
                (if (<= (object_get_health "real_cable_c") 0.0) 
                    (begin
                        (device_set_position_track "cableroom" "cable_room_rot_ab2a" 0.0)
                        (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                        (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                        (set croom_sen_total (ai_living_count "cable_sentinels"))
                    )
                )
                (game_save_no_timeout)
            )
        )
        (if (= cable_var 3) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_b" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_two" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_03_quad" none 1.0)
                (device_set_position_track "cableroom" "cable_room_rot_b_back" 0.0)
                (device_animate_position "cableroom" 1.0 2.0 0.0 0.5 false)
                (cs_run_command_script "cable_room_sentinels" try_to_fix)
                (ai_set_orders "cable_sentinels" "cable_room_sentinels_end")
                (ai_set_blind "cable_sentinels" true)
                (ai_set_blind "cable_flood" true)
                (cs_run_command_script "cable_flood" cable_look)
                (wake music_04b_07_start)
                (wake strain)
                (sleep 400)
                (object_type_predict_high "scenarios\objects\solo\alphagasgiant\cable_room\cable_room")
                (object_type_predict_high "scenarios\objects\solo\alphagasgiant\cable_room_top\cable_room_top")
                (sleep 20)
                (objects_detach "cableroom" "real_cable_a")
                (objects_detach "cableroom" "real_cable_b")
                (objects_detach "cableroom" "real_cable_c")
                (objects_detach "cableroom" "elev_control_up")
                (objects_detach "cableroom" "control_up_switch_02")
                (objects_detach "cableroom" "cable_nub_a")
                (objects_detach "cableroom" "cable_nub_b")
                (objects_detach "cableroom" "cable_nub_c")
                (object_destroy "cableroom")
                (structure_bsp_index 4)
                (wake cam_shake_cont)
                (physics_disable_character_ground_adhesion_forces 1.0)
                (objects_attach "cableroom_top" "rot_a" "real_cable_a" "")
                (objects_attach "cableroom_top" "rot_b" "real_cable_b" "")
                (objects_attach "cableroom_top" "rot_c" "real_cable_c" "")
                (objects_attach "cableroom2" "elevator" "elev_control_up" "elev_top")
                (objects_attach "cableroom2" "switch" "control_up_switch_02" "")
                (objects_attach "cableroom2" "anim" "cable_nub_a" "torn02")
                (objects_attach "cableroom2" "anim" "cable_nub_b" "torn03")
                (objects_attach "cableroom2" "anim" "cable_nub_c" "")
                (device_set_position_track "cableroom2" "cable_room_drop" 0.0)
                (device_animate_position "cableroom2" 1.0 1.0 0.0 0.5 false)
                (device_set_position "cableroom_top" 1.0)
                (wake cableroom_suck_killer)
                (wake cableroom_junk_spawn)
                (object_create "suction")
                (wake grav_test)
                (set plummeting true)
                (ui_error_ok)
                (sleep 150)
                (object_destroy "cableroom_top")
            )
        )
        (sleep 30)
        (set cables_cuttable true)
    )
)

(script dormant void cable_c_health
    (begin
        (sleep_until (<= (object_get_health "real_cable_c") 0.0) 1)
        (set cables_cuttable false)
        (set cable_var (+ cable_var 1.0))
        (object_create_anew "cable_nub_c")
        (objects_attach "cableroom" "rot_c" "cable_nub_c" "cable_destroyed")
        (if (= cable_var 1) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_c" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_one" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_01_quad" none 1.0)
                (device_set_position_track "cableroom" "cable_room_rot_5_ab" 0.0)
                (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                (set croom_sen_total (ai_living_count "cable_sentinels"))
                (game_save_no_timeout)
            )
        )
        (if (= cable_var 2) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_c" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_one" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_02_quad" none 1.0)
                (if (<= (object_get_health "real_cable_a") 0.0) 
                    (begin
                        (device_set_position_track "cableroom" "cable_room_rot_bc2b" 0.0)
                        (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                        (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                        (set croom_sen_total (ai_living_count "cable_sentinels"))
                    )
                )
                (if (<= (object_get_health "real_cable_b") 0.0) 
                    (begin
                        (device_set_position_track "cableroom" "cable_room_rot_ac2a" 0.0)
                        (device_animate_position "cableroom" 1.0 10.0 1.0 4.0 false)
                        (set croom_flood_total (ai_nonswarm_count "cable_flood"))
                        (set croom_sen_total (ai_living_count "cable_sentinels"))
                    )
                )
                (game_save_no_timeout)
            )
        )
        (if (= cable_var 3) 
            (begin
                (cam_shake)
                (device_set_position "real_cable_c" 1.0)
                (sound_impulse_start_effect "sound\ambience\alphagasgiant\cable_snaps\cable_snap_two" none 1.0)
                (sound_looping_stop_immediately "sound_remastered\visual_effects\alphagas_cablelist\alphacable_swtnr_03_quad" none 1.0)
                (device_set_position_track "cableroom" "cable_room_rot_c_back" 0.0)
                (device_animate_position "cableroom" 1.0 2.0 0.0 0.5 false)
                (cs_run_command_script "cable_room_sentinels" try_to_fix)
                (ai_set_orders "cable_sentinels" "cable_room_sentinels_end")
                (ai_set_blind "cable_sentinels" true)
                (ai_set_blind "cable_flood" true)
                (cs_run_command_script "cable_flood" cable_look)
                (wake music_04b_07_start)
                (wake strain)
                (sleep 400)
                (object_type_predict_high "scenarios\objects\solo\alphagasgiant\cable_room\cable_room")
                (object_type_predict_high "scenarios\objects\solo\alphagasgiant\cable_room_top\cable_room_top")
                (sleep 20)
                (objects_detach "cableroom" "real_cable_a")
                (objects_detach "cableroom" "real_cable_b")
                (objects_detach "cableroom" "real_cable_c")
                (objects_detach "cableroom" "elev_control_up")
                (objects_detach "cableroom" "control_up_switch_02")
                (objects_detach "cableroom" "cable_nub_a")
                (objects_detach "cableroom" "cable_nub_b")
                (objects_detach "cableroom" "cable_nub_c")
                (object_destroy "cableroom")
                (structure_bsp_index 4)
                (wake cam_shake_cont)
                (physics_disable_character_ground_adhesion_forces 1.0)
                (objects_attach "cableroom_top" "rot_a" "real_cable_a" "")
                (objects_attach "cableroom_top" "rot_b" "real_cable_b" "")
                (objects_attach "cableroom_top" "rot_c" "real_cable_c" "")
                (objects_attach "cableroom2" "elevator" "elev_control_up" "elev_top")
                (objects_attach "cableroom2" "switch" "control_up_switch_02" "")
                (objects_attach "cableroom2" "anim" "cable_nub_a" "torn02")
                (objects_attach "cableroom2" "anim" "cable_nub_b" "torn03")
                (objects_attach "cableroom2" "anim" "cable_nub_c" "")
                (device_set_position_track "cableroom2" "cable_room_drop" 0.0)
                (device_animate_position "cableroom2" 1.0 1.0 0.0 0.5 false)
                (device_set_position "cableroom_top" 1.0)
                (wake cableroom_suck_killer)
                (wake cableroom_junk_spawn)
                (object_create "suction")
                (wake grav_test)
                (set plummeting true)
                (ui_error_ok)
                (sleep 150)
                (object_destroy "cableroom_top")
            )
        )
        (sleep 30)
        (set cables_cuttable true)
    )
)

(script dormant void cable_flood_spawner
    (begin
        (if (difficulty_legendary) 
            (set croom_flood_desired 10))
        (if (difficulty_heroic) 
            (set croom_flood_desired 8))
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (and
                            (< croom_flood_total croom_flood_desired)
                            (< (ai_nonswarm_count "cable_flood") (/ croom_flood_desired 2.0))
                        )
                        (= plummeting true)
                        (> cable_var 0)
                    )
                )
                (if 
                    (and
                        (= plummeting false)
                        (< cable_var 1)
                    ) 
                        (begin
                            (ai_place "cable_room_combatforms" 1)
                            (set croom_flood_total (+ croom_flood_total 1.0))
                        )
                )
                (or
                    (= plummeting true)
                    (> cable_var 0)
                    (>= croom_flood_total croom_flood_desired)
                )
            )
        )
        (sleep_until 
            (or
                (> cable_var 0)
                (= plummeting true)
            )
        )
        (if (= plummeting true) 
            (sleep_forever))
        (set croom_flood_total 0)
        (if (difficulty_legendary) 
            (set croom_flood_desired 12))
        (if (difficulty_heroic) 
            (set croom_flood_desired 10))
        (if (difficulty_normal) 
            (set croom_flood_desired 8))
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (and
                            (< croom_flood_total croom_flood_desired)
                            (< (ai_nonswarm_count "cable_flood") (/ croom_flood_desired 2.0))
                        )
                        (= plummeting true)
                        (> cable_var 1)
                    )
                )
                (if 
                    (and
                        (= plummeting false)
                        (< cable_var 2)
                    ) 
                        (begin
                            (ai_place "cable_room_combatforms" 1)
                            (set croom_flood_total (+ croom_flood_total 1.0))
                        )
                )
                (or
                    (= plummeting true)
                    (> cable_var 1)
                    (>= croom_flood_total croom_flood_desired)
                )
            )
        )
        (sleep_until 
            (or
                (> cable_var 1)
                (= plummeting true)
            )
        )
        (if (= plummeting true) 
            (sleep_forever))
        (set croom_flood_total 0)
        (if (difficulty_legendary) 
            (set croom_flood_desired 14))
        (if (difficulty_heroic) 
            (set croom_flood_desired 12))
        (if (difficulty_normal) 
            (set croom_flood_desired 10))
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (and
                            (< croom_flood_total croom_flood_desired)
                            (< (ai_nonswarm_count "cable_flood") (/ croom_flood_desired 2.0))
                        )
                        (= plummeting true)
                        (> cable_var 2)
                    )
                )
                (if 
                    (and
                        (= plummeting false)
                        (< cable_var 3)
                    ) 
                        (begin
                            (ai_place "cable_room_combatforms" 1)
                            (set croom_flood_total (+ croom_flood_total 1.0))
                        )
                )
                (or
                    (= plummeting true)
                    (> cable_var 2)
                    (>= croom_flood_total croom_flood_desired)
                )
            )
        )
    )
)

(script dormant void cable_sentinel_spawner
    (begin
        (if (difficulty_legendary) 
            (set croom_sen_desired 8))
        (if (difficulty_heroic) 
            (set croom_sen_desired 6))
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (and
                            (< (ai_living_count "cable_sentinels") (/ croom_sen_desired 2.0))
                            (< croom_sen_total croom_sen_desired)
                        )
                        (= plummeting true)
                        (> cable_var 0)
                    )
                )
                (if 
                    (and
                        (= plummeting false)
                        (< cable_var 1)
                    ) 
                        (begin
                            (ai_place "cable_room_sentinels" 1)
                            (set croom_sen_total (+ croom_sen_total 1.0))
                        )
                )
                (or
                    (= plummeting true)
                    (> cable_var 0)
                    (>= croom_sen_total croom_sen_desired)
                )
            )
        )
        (sleep_until 
            (or
                (> cable_var 0)
                (= plummeting true)
            )
        )
        (if (= plummeting true) 
            (sleep_forever))
        (set croom_sen_total 0)
        (if (difficulty_legendary) 
            (set croom_sen_desired 6))
        (if (difficulty_heroic) 
            (set croom_sen_desired 4))
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (and
                            (< (ai_living_count "cable_sentinels") (/ croom_sen_desired 2.0))
                            (< croom_sen_total croom_sen_desired)
                        )
                        (= plummeting true)
                        (> cable_var 1)
                    )
                )
                (if 
                    (and
                        (= plummeting false)
                        (< cable_var 2)
                    ) 
                        (begin
                            (ai_place "cable_room_sentinels" 1)
                            (set croom_sen_total (+ croom_sen_total 1.0))
                        )
                )
                (or
                    (= plummeting true)
                    (> cable_var 1)
                    (>= croom_sen_total croom_sen_desired)
                )
            )
        )
        (sleep_until 
            (or
                (> cable_var 1)
                (= plummeting true)
            )
        )
        (if (= plummeting true) 
            (sleep_forever))
        (set croom_sen_total 0)
        (if (difficulty_legendary) 
            (set croom_sen_desired 4))
        (if (difficulty_heroic) 
            (set croom_sen_desired 4))
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (and
                            (< (ai_living_count "cable_sentinels") (/ croom_sen_desired 2.0))
                            (< croom_sen_total croom_sen_desired)
                        )
                        (= plummeting true)
                        (> cable_var 2)
                    )
                )
                (if 
                    (and
                        (= plummeting false)
                        (< cable_var 3)
                    ) 
                        (begin
                            (ai_place "cable_room_sentinels" 1)
                            (set croom_sen_total (+ croom_sen_total 1.0))
                        )
                )
                (or
                    (= plummeting true)
                    (> cable_var 2)
                    (>= croom_sen_total croom_sen_desired)
                )
            )
        )
    )
)

(script dormant void croom_exit
    (begin
        (sleep_until (= (volume_test_objects "vol_going_down" (players)) true) 1)
        (sleep_forever cableroom_killer)
        (device_set_power "control_up_switch_01" 0.0)
        (device_set_power "control_up_switch_02" 0.0)
        (device_set_position "elev_control_up" 0.04195)
        (set in_cable_room false)
    )
)

(script dormant void cable_room_start
    (begin
        (ai_disposable "control_flood" true)
        (ai_disposable "control_sentinels" true)
        (ai_erase_all)
        (sleep_forever wind)
        (data_mine_insert "04b_14_cable_room")
        (object_cannot_take_damage (player0))
        (object_cannot_take_damage (player1))
        (objects_attach "cableroom" "rot_a" "real_cable_a" "")
        (objects_attach "cableroom" "rot_b" "real_cable_b" "")
        (objects_attach "cableroom" "rot_c" "real_cable_c" "")
        (objects_attach "real_cable_a" "cut_here" "cable_target_a" "")
        (objects_attach "real_cable_b" "cut_here" "cable_target_b" "")
        (objects_attach "real_cable_c" "cut_here" "cable_target_c" "")
        (objects_attach "cableroom" "switch" "control_up_switch_02" "")
        (cinematic_lighting_set_primary_light 28.0 118.0 0.419608 0.313726 0.247059)
        (cinematic_lighting_set_secondary_light -26.0 312.0 0.113725 0.0941177 0.0862745)
        (cinematic_lighting_set_ambient_light 0.0470588 0.0509804 0.054902)
        (object_uses_cinematic_lighting "real_cable_a" true)
        (object_uses_cinematic_lighting "real_cable_b" true)
        (object_uses_cinematic_lighting "real_cable_c" true)
        (wake cable_a_health)
        (wake cable_b_health)
        (wake cable_c_health)
        (wake cable_invulnerable)
        (wake cable_flood_spawner)
        (wake cable_sentinel_spawner)
        (device_set_power "control_up_switch_02" 0.0)
        (set in_cable_room true)
        (wake 04b_title1)
        (ai_place "cableroom_sentinels_init" 3)
        (ai_place "cableroom_flood_init" 6)
        (sleep_until (> (device_get_position "elev_control_up") 0.95))
        (object_can_take_damage (player0))
        (object_can_take_damage (player1))
        (wake cableroom_killer)
        (wake cableroom_junk_killer)
        (game_reverted)
        (sleep_until (= (device_get_position "elev_control_up") 1.0))
        (objects_attach "cableroom" "elevator" "elev_control_up" "elev_top")
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'all my phantoms are in the air, arbiter. go ahead - cut the cable!'")
        (sleep (ai_play_line_on_object none "0170"))
        (sleep 30)
        (ai_dialogue_enable true)
        (wake cableroom_commander_reminder)
        (sleep_until (= plummeting true))
        (wake croom_exit)
        (wake objective_cables_clear)
        (sleep 30)
        (sleep_until (= (device_get_position "cableroom2") 1.0))
        (objects_detach "cableroom2" "elev_control_up")
        (sleep 2)
        (device_set_position "elev_control_up" 0.99999)
        (sleep 2)
        (device_set_power "control_up_switch_02" 1.0)
        (sleep 90)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'that did it! the station is in free-fall!'")
        (sleep (ai_play_line_on_object none "0180"))
        (sleep 30)
        (ai_dialogue_enable true)
        (wake objective_dogfight_set)
        (game_save_no_timeout)
        (ai_set_blind "cable_flood" false)
        (ai_set_orders "cable_flood" "cable_room_after")
    )
)

(script dormant void plummeting_control_commander
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'the heretic leader is on the move! do not let him escape! we'll stay with you as long as we can! '")
        (sleep (ai_play_line_on_object none "0190"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void control_return_flood_spawn
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_middle_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/mid01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_middle_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/mid02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_middle_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/mid03"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_middle_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/mid04"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_middle_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_02/mid01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_middle_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_middle_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_02/mid02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/peri01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/peri02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/peri03"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_02/peri04"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_02/peri01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_02/peri02"))
                )
                (or
                    (= (ai_living_count "control_return_heretics") 0)
                    (> (ai_spawn_count "control_return_flood") 10)
                    (= (volume_test_objects "vol_control_return_perimeter" (players)) true)
                )
            )
        )
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/peri01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/peri02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/peri03"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/peri04"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_03/peri01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_peri_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_peri_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_03/peri02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/bott01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/bott02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/bott03"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_03/bott04"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_03/bott01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_03/bott02"))
                )
                (or
                    (= (ai_living_count "control_return_heretics") 0)
                    (> (ai_spawn_count "control_return_flood") 10)
                    (= (volume_test_objects "vol_control_return_middle" (players)) true)
                )
            )
        )
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/bott01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/bott02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/bott03"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/bott04"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_04/bott01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_bottom_spawnroom") 0.0)
                            (= (volume_test_objects "vol_control_bottom_spawnroom" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_04/bott02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_entry_int") 0.0)
                            (= (volume_test_objects "vol_control_entry_int" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/entry01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_entry_int") 0.0)
                            (= (volume_test_objects "vol_control_entry_int" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/entry02"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_entry_int") 0.0)
                            (= (volume_test_objects "vol_control_entry_int" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/entry03"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_entry_int") 0.0)
                            (= (volume_test_objects "vol_control_entry_int" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_flood_04/entry04"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_entry_int") 0.0)
                            (= (volume_test_objects "vol_control_entry_int" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_04/entry01"))
                    (if 
                        (and
                            (< (ai_nonswarm_count "control_return_flood") 3)
                            (= (device_get_position "control_entry_int") 0.0)
                            (= (volume_test_objects "vol_control_entry_int" (players)) false)
                            (> (player_count) 0)
                        ) 
                            (ai_place "control_return_carriers_04/entry02"))
                )
                (or
                    (= (ai_living_count "control_return_heretics") 0)
                    (> (ai_spawn_count "control_return_flood") 10)
                    (= (volume_test_objects "vol_power_core_enter" (players)) true)
                )
            )
        )
    )
)

(script command_script void control_return_heretic
    (begin
        (cs_switch "heretic_01")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (print "heretic elite 1: 'our lives for the truth!'")
        (cs_play_line "0750")
        (cs_switch "heretic_02")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (print "heretic elite 2: 'the truth and the covenant!'")
        (cs_play_line "0760")
    )
)

(script dormant void control_room_return
    (begin
        (ai_disposable "cable_flood" true)
        (ai_disposable "cable_sentinels" true)
        (ai_disposable "all_allies" true)
        (ai_erase_all)
        (device_set_position_immediate "control_shield_door" 1.0)
        (device_set_position_immediate "shield" 1.0)
        (device_operates_automatically_set "control_room_ext" false)
        (device_operates_automatically_set "control_entry_int" false)
        (data_mine_insert "04b_15_control_return")
        (sleep_until 
            (or
                (< (device_get_position "elev_control_up") 0.05)
                (= (volume_test_objects "vol_control_top" (players)) true)
            )
        )
        (game_reverted)
        (wake plummeting_control_commander)
        (ai_place "control_return_sentinels_01" 2)
        (ai_place "control_return_heretics_01" 1)
        (ai_place "control_return_heretics_02" 2)
        (ai_place "control_return_h_grunts_02" 2)
        (sleep 90)
        (ai_place "control_return_flood_01" 2)
        (ai_place "control_return_carriers_01" 2)
        (wake control_return_flood_spawn)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_control_return_middle" (players)) true)
                (< (ai_living_count "control_return_heretics") 3)
            )
        )
        (game_save_no_timeout)
        (ai_place "control_return_heretics_03" (- 2.0 (ai_living_count "control_return_heretics_02")))
        (ai_place "control_return_h_grunts_03" (- 2.0 (ai_living_count "control_return_h_grunts_02")))
        (sleep_until (= (volume_test_objects "vol_near_shield" (players)) true))
        (sleep_until 
            (or
                (ai_scene "control_return_scene" control_return_heretic "control_return_heretics")
                (= (ai_living_count "control_return_heretics") 0)
            ) 
        30 150)
        (sleep_until (= (ai_living_count "control_return_heretics") 0))
        (game_save_no_timeout)
        (ai_set_orders "control_return_flood" "control_return_flood_win")
    )
)

(script command_script void power_core_heretic
    (begin
        (cs_switch "heretic_01")
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (print "heretic elite: 'the oracle must be saved!'")
        (cs_play_line "0740")
    )
)

(script dormant void power_core_commander
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (sleep_until (game_all_quiet))
        (print "spec-ops commander: 'are you still alive, arbiter?'")
        (sleep (ai_play_line_on_object none "0770"))
        (print "spec-ops commander: 'we're keeping pace as best we can.'")
        (sleep (ai_play_line_on_object none "0780"))
        (game_save_no_timeout)
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void hl_retreat_x
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to fake_cinematics/p4)
        (ai_erase "heretic_leader_04")
    )
)

(script dormant void power_core_start
    (begin
        (sleep_until (= (volume_test_objects "vol_power_core_enter" (players)) true))
        (ai_disposable "control_return_flood" true)
        (ai_disposable "control_return_sentinels" true)
        (ai_disposable "control_return_heretics" true)
        (device_operates_automatically_set "hl_ledge_ext" true)
        (data_mine_insert "04b_16_power_core")
        (ai_set_orders "control_return_flood" "power_core_flood_all")
        (ai_place "power_core_combatforms" 2)
        (ai_place "power_core_carriers" 1)
        (ai_place "power_core_sentinels_01" 2)
        (ai_place "power_core_heretics_01" 1)
        (ai_place "power_core_h_grunts_01" 2)
        (wake power_core_commander)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_power_core_midway" (players)) true)
                (< (ai_living_count "power_core_heretics") 2)
            )
        )
        (object_create "player0_fake_banshee")
        (object_create "player1_fake_banshee")
        (object_create "hl_fake_banshee")
        (object_cannot_take_damage "player0_fake_banshee")
        (object_cannot_take_damage "player1_fake_banshee")
        (object_cannot_take_damage "hl_fake_banshee")
        (game_save_no_timeout)
        (sleep_until 
            (or
                (ai_scene "power_core_scene" power_core_heretic "power_core_heretics")
                (= (volume_test_objects "vol_power_core_bottom" (players)) true)
            )
        )
        (sleep_until (= (volume_test_objects "vol_power_core_bottom" (players)) true))
        (if 
            (or
                (difficulty_normal)
                (difficulty_heroic)
            ) 
                (ai_place "power_core_swords" 1))
        (if (difficulty_legendary) 
            (ai_place "power_core_swords" 2))
    )
)

(script dormant void plummet_killer
    (begin
        (sleep_until 
            (begin
                (object_destroy (list_get (volume_return_objects "vol_cableroom_suck_kill") 0))
                (set plummet_junk_total (- plummet_junk_total 1.0))
                (sleep 5)
                (= (version) 5)
            ) 
        5)
    )
)

(script dormant void plummet_fl
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_plummet_fl" (players)) true))
                (begin_random
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl01")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl02")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl03")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl04")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl05")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl06")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl08")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl09")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl10")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl11")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl12")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl14")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl15")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl16")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl17")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl18")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl19")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl20")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl21")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl22")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl23")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl24")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl25")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl26")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl27")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl28")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl29")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl30")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl31")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fl32")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                )
                (= (volume_test_objects "vol_arm_01_return" (players)) true)
            )
        )
    )
)

(script dormant void plummet_fr
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_plummet_fr" (players)) true))
                (begin_random
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr01")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr02")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr03")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr04")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr05")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr06")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr08")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr09")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr10")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr11")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr12")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr14")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr15")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr16")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr17")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr18")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr19")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr20")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr21")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr22")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr23")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr24")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr25")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr26")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr27")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr28")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr29")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr30")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr31")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "fr32")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                )
                (= (volume_test_objects "vol_arm_01_return" (players)) true)
            )
        )
    )
)

(script dormant void plummet_nr
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_plummet_nr" (players)) true))
                (begin_random
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr01")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr02")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr03")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr04")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr05")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr06")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr08")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr09")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr10")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr11")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr12")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr14")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr15")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr16")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr17")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr18")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr19")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr20")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr21")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr22")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr23")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr24")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr25")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr26")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr27")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr28")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr29")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr30")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr31")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nr32")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                )
                (= (volume_test_objects "vol_arm_01_return" (players)) true)
            )
        )
    )
)

(script dormant void plummet_nl
    (begin
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_plummet_nl" (players)) true))
                (begin_random
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl01")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl02")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl03")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl04")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl05")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl06")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl08")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl09")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl10")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl11")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl12")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl14")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl15")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl16")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl17")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl18")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl19")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl20")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl21")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl22")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl23")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl24")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl25")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl26")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                    (begin_random
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl27")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl28")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl29")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl30")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl31")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                        (if (< plummet_junk_total 50) 
                            (begin
                                (object_create_anew "nl32")
                                (set plummet_junk_total (+ plummet_junk_total 1.0))
                                (sleep (random_range 5 15))
                            )
                        )
                    )
                )
                (= (volume_test_objects "vol_arm_01_return" (players)) true)
            )
        )
    )
)

(script dormant void banshee_killer_00
    (begin
        (sleep_until (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_02/right") "banshee_d" (unit (player0))) false))
        (unit_kill (unit (player0)))
    )
)

(script dormant void banshee_killer_01
    (begin
        (sleep_until (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_02/left") "banshee_d" (unit (player1))) false))
        (unit_kill (unit (player1)))
    )
)

(script command_script void dervish_chase_01
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to fake_cinematics/p1)
        (cs_shoot true (list_get (ai_actors "heretic_leader_04") 0))
        (sleep 60)
        (cs_shoot false (list_get (ai_actors "heretic_leader_04") 0))
        (cs_go_to fake_cinematics/p0)
        (cs_face true fake_cinematics/p4)
        (cs_crouch true)
        (sleep_until (= cinematic_shooting_done true))
        (cs_crouch false)
        (cs_face false fake_cinematics/p1)
        (cs_go_to_vehicle "player0_fake_banshee")
        (cs_fly_to airspace3/p1 1.0)
    )
)

(script command_script void hl_retreat_04
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle "hl_fake_banshee")
        (cs_fly_to airspace3/p3 2.0)
        (cs_shoot true (list_get (ai_actors "dervish_01") 0))
        (cs_fly_to airspace3/p5 2.0)
        (cs_shoot false (list_get (ai_actors "dervish_01") 0))
        (cs_fly_by airspace3/p6 2.0)
        (cs_vehicle_speed 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by airspace3/p8 5.0)
        (set cinematic_shooting_done true)
        (cs_fly_by airspace3/p2 5.0)
        (cs_fly_to airspace3/p0 5.0)
    )
)

(script static void banshee_sin_01_weapon
    (begin
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\rifle\plasma_rifle\plasma_rifle.weapon")
                (= banshee_sin_01_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_01") 0)) "rifle" true true)
                    (set banshee_sin_01_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\rifle\covenant_carbine\covenant_carbine.weapon")
                (= banshee_sin_01_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_01") 0)) "carbine" true true)
                    (set banshee_sin_01_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\rifle\beam_rifle\beam_rifle.weapon")
                (= banshee_sin_01_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_01") 0)) "sniper" true true)
                    (set banshee_sin_01_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\pistol\needler\needler.weapon")
                (= banshee_sin_01_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_01") 0)) "needler" true true)
                    (set banshee_sin_01_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\pistol\plasma_pistol\plasma_pistol.weapon")
                (= banshee_sin_01_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_01") 0)) "pistol" true true)
                    (set banshee_sin_01_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\support_high\flak_cannon\flak_cannon.weapon")
                (= banshee_sin_01_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_01") 0)) "flak" true true)
                    (set banshee_sin_01_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\characters\sentinel_aggressor\weapons\beam\sentinel_aggressor_beam.weapon")
                (= banshee_sin_01_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_01") 0)) "beam" true true)
                    (set banshee_sin_01_ready true)
                )
        )
    )
)

(script static void banshee_sin_01
    (begin
        (camera_control true)
        (set_pjl_effect "floodlab_banshee_1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (camera_set "cam00" 0)
        (set cinematic_shooting_done false)
        (ai_erase "heretic_leader_04")
        (device_operates_automatically_set "hl_ledge_ext" true)
        (device_set_position "hl_ledge_ext" 1.0)
        (object_create_anew "player0_fake_banshee")
        (object_create_anew "player1_fake_banshee")
        (object_create_anew "hl_fake_banshee")
        (cinematic_start 1.0 1.0 1.0 15)
        (ai_place "heretic_leader_04")
        (cs_run_command_script "heretic_leader_04" hl_retreat_04)
        (camera_set "cam01" 150)
        (sleep 150)
        (ai_place "dervish_01")
        (banshee_sin_01_weapon)
        (cs_run_command_script "dervish_01" dervish_chase_01)
        (camera_set "cam05" 120)
        (sleep 120)
        (camera_set "cam06" 60)
        (sleep 60)
        (sleep_until (= cinematic_shooting_done true))
        (camera_set "cam02" 0)
        (camera_set "cam03" 90)
        (sleep_until (= (unit_in_vehicle (unit (list_get (ai_actors "dervish_01") 0))) true))
        (camera_set "cam04" 120)
        (sleep 90)
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 20)
        (ai_erase "dervish_01")
        (ai_erase "heretic_leader_04")
        (device_operates_automatically_set "hl_ledge_ext" false)
        (device_set_position_immediate "hl_ledge_ext" 0.0)
        (sleep_until 
            (and
                (= (ai_living_count "heretic_leader_04") 0)
                (= (ai_living_count "dervish_01") 0)
            )
        )
    )
)

(script dormant void dogfight2_commander
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'what lunacy! he'll never escape this maelstrom in a banshee!'")
        (sleep (ai_play_line_on_object none "0790"))
        (sleep 30)
        (print "spec-ops commander: 'wait! the hangar! there was a seraph fighter inside! arbiter, you know what to do!'")
        (sleep (ai_play_line_on_object none "1410"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void boost_test
    (begin
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_enable_moving true)
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 20.0))
    )
)

(script dormant void dogfight_secondtime_start
    (begin
        (sleep_until (= (volume_test_objects "vol_power_core_ledge" (players)) true))
        (ai_disposable "power_core_flood" true)
        (ai_disposable "power_core_sentinels" true)
        (ai_disposable "power_core_heretics" true)
        (cinematic_fade_to_white)
        (ai_erase_all)
        (object_teleport (player0) "player0_hide")
        (object_teleport (player1) "player1_hide")
        (if (cinematic_skip_start) 
            (begin
                (banshee_sin_01)
            )
        )
        (cinematic_skip_stop)
        (sleep 2)
        (wake plummet_killer)
        (wake plummet_fl)
        (wake plummet_nl)
        (wake plummet_fr)
        (wake plummet_nr)
        (sleep 5)
        (if (game_can_use_flashlights) 
            (begin
                (object_destroy "player0_fake_banshee")
                (object_destroy "player1_fake_banshee")
                (object_destroy "hl_fake_banshee")
                (object_teleport (player0) "banshee_player0")
                (object_teleport (player1) "banshee_player1")
                (ai_place "ledge_banshees_02/left")
                (ai_place "ledge_banshees_02/right")
                (vehicle_load_magic (ai_vehicle_get_from_starting_location "ledge_banshees_02/left") banshee_d (player1))
                (vehicle_load_magic (ai_vehicle_get_from_starting_location "ledge_banshees_02/right") banshee_d (player0))
                (physics_set_gravity -4.0)
                (physics_set_velocity_frame 0.0 0.0 3.0)
                (wake banshee_killer_00)
                (wake banshee_killer_01)
            ) (begin
                (object_destroy "player0_fake_banshee")
                (object_destroy "player1_fake_banshee")
                (object_destroy "hl_fake_banshee")
                (sleep 2)
                (object_teleport (player0) "banshee_player0")
                (sleep 2)
                (ai_place "ledge_banshees_02/right")
                (sleep 2)
                (vehicle_load_magic (ai_vehicle_get_from_starting_location "ledge_banshees_02/right") banshee_d (player0))
                (sleep 2)
                (physics_set_gravity -4.0)
                (physics_set_velocity_frame 0.0 0.0 3.0)
                (wake banshee_killer_00)
            )
        )
        (device_operates_automatically_set "control_room_ext" false)
        (device_operates_automatically_set "lab_exit_ext" false)
        (device_operates_automatically_set "arm_02_entry_ext" false)
        (ai_place "dogfighters_init" 2)
        (deactivate_nav_point_flag default_red player "he_went_here" 0.0)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white)
        (data_mine_insert "04b_17_dogfight")
        (game_reverted)
        (wake dogfight2_commander)
        (sleep_until 
            (begin
                (begin_random
                    (if 
                        (and
                            (< (ai_living_count "dogfighters") 2)
                            (= (objects_can_see_flag (players) "dogfight_1" 45.0) false)
                        ) 
                            (ai_place "dogfighters_finale/1"))
                    (if 
                        (and
                            (< (ai_living_count "dogfighters") 2)
                            (= (objects_can_see_flag (players) "dogfight_2" 45.0) false)
                        ) 
                            (ai_place "dogfighters_finale/2"))
                    (if 
                        (and
                            (< (ai_living_count "dogfighters") 2)
                            (= (objects_can_see_flag (players) "dogfight_3" 45.0) false)
                        ) 
                            (ai_place "dogfighters_finale/3"))
                    (if 
                        (and
                            (< (ai_living_count "dogfighters") 2)
                            (= (objects_can_see_flag (players) "dogfight_4" 45.0) false)
                        ) 
                            (ai_place "dogfighters_finale/4"))
                    (if 
                        (and
                            (< (ai_living_count "dogfighters") 2)
                            (= (objects_can_see_flag (players) "dogfight_5" 45.0) false)
                        ) 
                            (ai_place "dogfighters_finale/5"))
                    (if 
                        (and
                            (< (ai_living_count "dogfighters") 2)
                            (= (objects_can_see_flag (players) "dogfight_6" 45.0) false)
                        ) 
                            (ai_place "dogfighters_finale/6"))
                )
                (or
                    (= (volume_test_objects "vol_arm_01_return" (players)) true)
                    (> (ai_spawn_count "dogfighters_finale") 3)
                )
            )
        )
    )
)

(script command_script void dervish_chase_02
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to airspace3/p7)
        (sleep 15)
        (object_create_anew "player_fake_banshee")
        (object_damage_damage_section "player_fake_banshee" "main" 2.0)
        (ai_erase "dervish_02")
    )
)

(script command_script void dervish_recovery
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_custom_animation "objects\characters\elite\elite" "climb:unarmed:detach" 0.0 true)
        (sleep (unit_get_custom_animation_time (unit (ai_get_object ai_current_actor))))
        (unit_stop_custom_animation (unit (ai_get_object ai_current_actor)))
        (cs_crouch true)
        (cs_move_in_direction 0.0 0.5 0.0)
        (cs_go_to fake_cinematics/p2)
        (cs_face true fake_cinematics/p3)
        (cs_crouch false)
        (sleep_forever)
    )
)

(script static void banshee_sin_02_weapon
    (begin
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\rifle\plasma_rifle\plasma_rifle.weapon")
                (= banshee_sin_02_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_03") 0)) "rifle" true true)
                    (set banshee_sin_02_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\rifle\covenant_carbine\covenant_carbine.weapon")
                (= banshee_sin_02_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_03") 0)) "carbine" true true)
                    (set banshee_sin_02_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\rifle\beam_rifle\beam_rifle.weapon")
                (= banshee_sin_02_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_03") 0)) "sniper" true true)
                    (set banshee_sin_02_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\pistol\needler\needler.weapon")
                (= banshee_sin_02_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_03") 0)) "needler" true true)
                    (set banshee_sin_02_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\pistol\plasma_pistol\plasma_pistol.weapon")
                (= banshee_sin_02_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_03") 0)) "pistol" true true)
                    (set banshee_sin_02_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\weapons\support_high\flak_cannon\flak_cannon.weapon")
                (= banshee_sin_02_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_03") 0)) "flak" true true)
                    (set banshee_sin_02_ready true)
                )
        )
        (if 
            (and
                (unit_has_weapon (unit (player0)) "objects\characters\sentinel_aggressor\weapons\beam\sentinel_aggressor_beam.weapon")
                (= banshee_sin_02_ready false)
            ) 
                (begin
                    (unit_add_equipment (unit (list_get (ai_actors "dervish_03") 0)) "beam" true true)
                    (set banshee_sin_02_ready true)
                )
        )
    )
)

(script static void banshee_sin_02
    (begin
        (camera_control true)
        (set_pjl_effect "floodlab_banshee_2")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (camera_set "end00" 0)
        (device_set_position_immediate "banshee_ledge_access_01" 1.0)
        (object_create_containing "banshee_gas_0")
        (ai_place "dervish_02")
        (cs_run_command_script "dervish_02" dervish_chase_02)
        (cinematic_start 1.0 1.0 1.0 15)
        (camera_set "end01" 120)
        (sleep_until (= (ai_living_count "dervish_02") 0))
        (sleep 60)
        (ai_place "dervish_03")
        (banshee_sin_02_weapon)
        (object_hide (list_get (ai_actors "dervish_03") 0) true)
        (object_teleport (list_get (ai_actors "dervish_03") 0) "dervish_sticks_landing")
        (cs_run_command_script "dervish_03" dervish_recovery)
        (sleep 5)
        (object_hide (list_get (ai_actors "dervish_03") 0) false)
        (camera_set "end02" 60)
        (sleep 60)
        (camera_set "end03" 60)
        (sleep 60)
        (camera_set "end04" 60)
        (sleep 60)
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 20)
        (ai_erase "dervish_03")
        (device_set_position_immediate "banshee_ledge_access_01" 0.0)
    )
)

(script dormant void bottling_return_s_respawner
    (begin
        (sleep_until (< (ai_living_count "bottling_return_sentinels_03") 2))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_sentinels_03" 1))
        (sleep (random_range 5 45))
        (sleep_until (< (ai_living_count "bottling_return_sentinels_03") 2))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_sentinels_03" 1))
        (sleep (random_range 5 45))
        (sleep_until (< (ai_living_count "bottling_return_sentinels_03") 2))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_sentinels_03" 1))
    )
)

(script dormant void bottling_return_cf_respawner
    (begin
        (sleep_until (< (ai_nonswarm_count "bottling_return_combatforms_03") 2))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_combatforms_04" 1))
        (sleep (random_range 5 45))
        (sleep_until (< (ai_nonswarm_count "bottling_return_combatforms_03") 2))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_combatforms_04" 1))
        (sleep (random_range 5 45))
        (sleep_until (< (ai_nonswarm_count "bottling_return_combatforms_03") 2))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_combatforms_04" 1))
    )
)

(script dormant void bottling_return_ca_respawner
    (begin
        (sleep_until (< (ai_nonswarm_count "bottling_return_carriers_03") 1))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_carriers_04" 1))
        (sleep (random_range 5 45))
        (sleep_until (< (ai_nonswarm_count "bottling_return_carriers_03") 1))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_carriers_04" 1))
        (sleep (random_range 5 45))
        (sleep_until (< (ai_nonswarm_count "bottling_return_carriers_03") 1))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_carriers_04" 1))
    )
)

(script dormant void bottling_return_commander
    (begin
        (sleep_until (= (volume_test_objects "vol_bottling_enter" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_bottling_enter" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "spec-ops commander: 'the heretic-leader has already landed! up to the hangar, arbiter! quickly now!'")
                    (sleep (ai_play_line_on_object none "1420"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void bottling_fx_01
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "175") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "174")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "175")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "176")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "177")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "178")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "179")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "180")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "181")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "182")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "183")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "184")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "174")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "175")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "176")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "177")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "178")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "179")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "180")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "181")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "182")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "183")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "184")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void bottling_fx_02
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "197") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "185")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "186")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "187")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "188")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "189")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "190")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "191")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "192")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "193")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "194")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "195")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "196")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "197")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "198")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "185")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "186")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "187")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "188")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "189")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "190")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "191")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "192")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "193")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "194")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "195")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "196")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "197")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "198")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void bottling_fx_03
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "201") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "199")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "200")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "201")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "202")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "203")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "204")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "205")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "206")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "207")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "208")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "209")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "210")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "211")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "212")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "199")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "200")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "201")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "202")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "203")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "204")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "205")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "206")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "207")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "208")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "209")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "210")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "211")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "212")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void bottling_fx_04
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "227") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "213")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "214")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "215")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "216")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "217")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "218")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "219")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "220")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "221")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "222")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "223")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "224")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "225")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "226")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "227")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "213")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "214")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "215")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "216")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "217")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "218")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "219")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "220")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "221")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "222")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "223")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "224")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "225")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "226")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "227")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void bottling_fx_05
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "242") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "228")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "229")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "230")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "231")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "232")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "233")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "234")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "235")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "236")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "237")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "238")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "239")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "240")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "241")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "242")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "228")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "229")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "230")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "231")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "232")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "233")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "234")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "235")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "236")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "237")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "238")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "239")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "240")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "241")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "242")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script command_script void panic_bottling
    (begin
        (cs_ignore_obstacles true)
        (cs_enable_moving true)
        (cs_movement_mode 3)
        (sleep_until (= (volume_test_object "vol_bottling_enter" (ai_get_object ai_current_actor)) true))
    )
)

(script dormant void bottling_secondtime_start
    (begin
        (ai_disposable "dogfighters" true)
        (cinematic_fade_to_white)
        (ai_erase_all)
        (if (game_can_use_flashlights) 
            (begin
                (sleep_forever banshee_killer_00)
                (sleep_forever banshee_killer_01)
                (physics_set_gravity 1.0)
                (physics_set_velocity_frame 0.0 0.0 0.0)
                (vehicle_unload (ai_vehicle_get_from_starting_location "ledge_banshees_02/right") banshee_d)
                (vehicle_unload (ai_vehicle_get_from_starting_location "ledge_banshees_02/left") banshee_d)
                (object_teleport (player0) "player0_hide")
                (object_teleport (player1) "player1_hide")
                (object_destroy (ai_vehicle_get_from_starting_location "ledge_banshees_02/right"))
                (object_destroy (ai_vehicle_get_from_starting_location "ledge_banshees_02/left"))
            ) (begin
                (sleep_forever banshee_killer_00)
                (physics_set_gravity 1.0)
                (physics_set_velocity_frame 0.0 0.0 0.0)
                (vehicle_unload (ai_vehicle_get_from_starting_location "ledge_banshees_02/right") banshee_d)
                (object_teleport (player0) "player0_hide")
                (object_destroy (ai_vehicle_get_from_starting_location "ledge_banshees_02/right"))
            )
        )
        (if (cinematic_skip_start) 
            (begin
                (banshee_sin_02)
            )
        )
        (cinematic_skip_stop)
        (sleep 2)
        (device_operates_automatically_set "banshee_ledge_access_01" false)
        (device_set_position_immediate "banshee_ledge_access_01" 0.0)
        (cls player "he_went_here")
        (object_destroy_containing "banshee_gas_0")
        (object_teleport (player0) "bottling_return_player0")
        (object_teleport (player1) "bottling_return_player1")
        (wake bottling_fx_01)
        (wake bottling_fx_02)
        (wake bottling_fx_03)
        (wake bottling_fx_04)
        (wake bottling_fx_05)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white)
        (data_mine_insert "04b_18_bottling_return_01")
        (game_reverted)
        (wake 04b_title2)
        (ai_place "bottling_return_sentinels_01" 2)
        (ai_place "bottling_return_flood_01" 4)
        (wake bottling_return_commander)
        (sleep_until 
            (and
                (= (volume_test_objects "vol_bottling_return_01r" (players)) false)
                (> (player_count) 0)
            )
        )
        (ai_place "bait_bottling_01" 1)
        (sleep_until 
            (or
                (< (ai_nonswarm_count "bottling_return_flood_01") 2)
                (= (volume_test_objects "vol_bottling_return_02" (players)) true)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_combatforms_02" (- 3.0 (ai_nonswarm_count "bottling_return_flood_01"))))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_carriers_02" 3))
        (sleep_until (= (volume_test_objects "vol_bottling_mid03" (players)) true))
        (data_mine_insert "04b_19_bottling_return_02")
        (game_save_no_timeout)
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_sentinels_02" 3))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_combatforms_03" 3))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bottling_return_carriers_03" 2))
        (wake bottling_return_s_respawner)
        (wake bottling_return_cf_respawner)
        (wake bottling_return_ca_respawner)
        (sleep_until (= (volume_test_objects "vol_bottling_mid02" (players)) true))
        (if (< (ai_living_count "bottling_plant_enemies") 8) 
            (ai_place "bait_bottling_02" 1))
        (sleep_until 
            (or
                (= (version) 5)
                (and
                    (= (ai_nonswarm_count "bottling_return_flood") 0)
                    (= (ai_nonswarm_count "bottling_return_flood") 0)
                )
            )
        )
        (game_save_no_timeout)
        (sleep_until (= (version) 5))
        (sleep_forever bottling_return_s_respawner)
        (sleep_forever bottling_return_cf_respawner)
        (sleep_forever bottling_return_ca_respawner)
    )
)

(script dormant void halls_up_01
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "7") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "1")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "2")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "3")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "4")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "5")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "6")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "7")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "8")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "9")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "1")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "2")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "3")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "4")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "5")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "6")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "7")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "8")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "9")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void halls_up_02
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "19") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "10")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "11")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "12")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "13")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "14")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "15")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "16")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "17")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "18")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "19")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "20")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "21")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "22")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "23")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "10")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "11")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "12")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "13")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "14")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "15")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "16")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "17")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "18")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "19")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "20")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "21")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "22")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "23")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void halls_up_03
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "24") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "24")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "25")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "26")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "27")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "28")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "29")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "30")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "31")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "32")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "33")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "34")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "35")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "36")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "37")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "38")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "24")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "25")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "26")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "27")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "28")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "29")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "30")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "31")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "32")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "33")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "34")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "35")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "36")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "37")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "38")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void halls_up_04
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "47") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "39")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "40")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "41")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "42")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "43")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "44")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "45")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "46")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "47")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "48")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "49")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "50")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "51")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "52")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "53")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "39")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "40")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "41")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "42")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "43")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "44")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "45")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "46")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "47")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "48")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "49")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "50")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "51")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "52")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "53")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void halls_up_05
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "58") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "54")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "55")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "56")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "57")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "58")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "59")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "60")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "61")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "62")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "63")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "64")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "65")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "66")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "67")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "68")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "54")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "55")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "56")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "57")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "58")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "59")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "60")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "61")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "62")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "63")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "64")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "65")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "66")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "67")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "68")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void halls_up_06
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "69") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "69")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "70")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "72")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "73")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "74")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "75")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "76")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "77")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "78")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "79")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "80")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "81")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "82")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "83")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "69")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "70")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "71")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "72")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "73")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "74")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "75")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "76")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "77")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "78")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "79")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "80")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "81")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "82")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "83")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "84")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void halls_up_07
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "85") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "85")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "86")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "87")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "88")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "89")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "90")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "92")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "93")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "94")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "95")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "96")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "98")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "99")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "100")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "85")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "86")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "87")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "88")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "89")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "90")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "91")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "92")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "93")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "94")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "95")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "96")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "97")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "98")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "99")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "100")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script command_script void panic_halls
    (begin
        (cs_enable_moving true)
        (cs_movement_mode 3)
        (sleep_until (= (volume_test_object "vol_bottling_enter" (ai_get_object ai_current_actor)) true))
    )
)

(script dormant void to_underhangar_secondtime
    (begin
        (sleep_until (= (volume_test_objects "vol_bottling_enter" (players)) true))
        (ai_disposable "bottling_return_flood" true)
        (ai_disposable "bottling_return_sentinels" true)
        (wake music_04b_08_start)
        (wake halls_up_01)
        (wake halls_up_02)
        (wake halls_up_03)
        (wake halls_up_04)
        (wake halls_up_05)
        (wake halls_up_06)
        (wake halls_up_07)
        (sleep_until (= (version) 5))
        (data_mine_insert "04b_20_halls_to_under_01")
        (game_save_no_timeout)
        (ai_place "second_hall_infection_01" 4)
        (ai_place "bait_hall_01" 1)
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_2nd_hall_02" (players)) true) 30 150)
                (if 
                    (and
                        (< (ai_nonswarm_count "second_hall_flood") 2)
                        (= (device_get_position "hall2_spawn_01") 0.0)
                        (= (volume_test_objects "vol_hall2_spawn_01" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "second_hall_flood_01" 1))
                (or
                    (= (volume_test_objects "vol_2nd_hall_02" (players)) true)
                    (= (ai_spawn_count "second_hall_flood_01") 4)
                )
            )
        )
        (data_mine_insert "04b_21_halls_to_under_02")
        (game_save_no_timeout)
        (ai_place "second_hall_carriers" 2)
        (ai_place "bait_hall_02" 1)
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_2nd_hall_01" (players)) true) 30 150)
                (if 
                    (and
                        (< (ai_nonswarm_count "second_hall_flood") 2)
                        (= (device_get_position "hall2_spawn_02") 0.0)
                        (= (volume_test_objects "vol_hall2_spawn_02" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "second_hall_flood_02" 1))
                (or
                    (= (volume_test_objects "vol_2nd_hall_01" (players)) true)
                    (= (ai_spawn_count "second_hall_flood_02") 4)
                )
            )
        )
        (sleep_until (= (volume_test_objects "vol_2nd_hall_01" (players)) true))
        (wake music_04b_08_start_alt)
        (data_mine_insert "04b_22_halls_to_under_03")
        (game_save_no_timeout)
        (ai_place "bait_hall_03" 1)
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_underhangar_from_bottom" (players)) true) 30 150)
                (if 
                    (and
                        (< (ai_nonswarm_count "second_hall_flood") 2)
                        (= (device_get_position "hall2_spawn_03") 0.0)
                        (= (volume_test_objects "vol_hall2_spawn_03" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "second_hall_flood_03" 1))
                (or
                    (= (volume_test_objects "vol_underhangar_from_bottom" (players)) true)
                    (= (ai_spawn_count "second_hall_flood_03") 4)
                )
            )
        )
    )
)

(script dormant void underhangar_fx_01
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "251") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "243")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "244")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "245")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "246")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "247")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "248")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "249")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "250")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "251")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "252")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "253")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "254")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "243")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "244")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "245")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "246")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "247")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "248")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "249")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "250")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "251")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "252")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "253")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "254")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void underhangar_fx_02
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "255") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "255")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "256")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "257")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "258")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "259")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "260")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "261")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "262")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "263")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "264")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "265")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "266")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "267")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "268")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "269")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "255")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "256")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "257")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "258")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "259")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "260")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "261")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "262")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "263")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "264")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "265")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "266")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "267")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "268")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "269")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void underhangar_return_commander
    (begin
        (sleep_until (= (volume_test_objects "vol_underhangar_from_top" (players)) true) 30 8000)
        (if 
            (and
                (= (volume_test_objects "vol_underhangar_from_top" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "spec-ops commander: 'you're almost there!  keep going!'")
                    (sleep (ai_play_line_on_object none "1430"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void underhangar_secondtime_start
    (begin
        (sleep_until (= (volume_test_objects "vol_underhangar_from_bottom" (players)) true))
        (ai_disposable "second_hall_flood" true)
        (data_mine_insert "04b_23_underhangar_return")
        (game_save_no_timeout)
        (wake underhangar_return_commander)
        (wake underhangar_fx_01)
        (wake underhangar_fx_02)
        (ai_place "underhangar_heretics_01" 1)
        (ai_place "underhangar_h_grunts_01" 2)
        (ai_place "underhangar_heretics_02" 1)
        (ai_place "underhangar_heretics_03" 1)
        (ai_place "underhangar_carriers_02" 1)
        (ai_place "underhangar_carriers_init" 1)
        (ai_place "underhangar_combatforms_init" 2)
        (sleep_until (= (volume_test_objects "vol_underhangar_music" (players)) true))
        (wake music_04b_08_stop)
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (ai_nonswarm_count "underhangar_carriers_02") 1)
                        (= (device_get_position "underhangar_spawn_02") 0.0)
                        (= (volume_test_objects "vol_underhangar_spawn_02" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "underhangar_carriers_02" 1))
                (if 
                    (and
                        (< (ai_nonswarm_count "underhangar_return_flood") 2)
                        (= (device_get_position "underhangar_spawn_01") 0.0)
                        (= (volume_test_objects "vol_underhangar_spawn_01" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "underhangar_return_flood_01" 1))
                (if 
                    (and
                        (< (ai_nonswarm_count "underhangar_return_flood") 2)
                        (= (volume_test_objects "vol_underhangar_shaft_01" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "underhangar_return_flood_02" 1))
                (if 
                    (and
                        (< (ai_nonswarm_count "underhangar_return_flood") 2)
                        (= (volume_test_objects "vol_underhangar_shaft_02" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "underhangar_return_flood_03" 1))
                (or
                    (= (volume_test_objects "vol_underhangar_return_01" (players)) true)
                    (<= (ai_strength "underhangar_heretics_01") 0.25)
                    (= (ai_spawn_count "underhangar_return_flood") 20)
                )
            )
        )
        (game_save_no_timeout)
        (ai_place "underhangar_h_grunts_02" (- 2.0 (ai_living_count "underhangar_h_grunts_01")))
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (ai_nonswarm_count "underhangar_return_flood") 2)
                        (= (device_get_position "underhangar_spawn_02") 0.0)
                        (= (volume_test_objects "vol_underhangar_spawn_02" (players)) false)
                        (> (player_count) 0)
                    ) 
                        (ai_place "underhangar_return_flood_04" 1))
                (or
                    (= (volume_test_objects "vol_underhangar_return_02" (players)) true)
                    (= (ai_living_count "underhangar_heretics_02") 0)
                    (= (ai_spawn_count "underhangar_return_flood_04") 20)
                )
            )
        )
        (game_save_no_timeout)
        (ai_place "underhangar_heretics_03" (- 2.0 (ai_living_count "underhangar_return_heretics")))
        (ai_place "underhangar_h_grunts_03" (- 2.0 (ai_living_count "underhangar_h_grunts_02")))
    )
)

(script dormant void other_hall_fx
    (begin
        (sleep_until 
            (begin
                (sleep_until (< (objects_distance_to_flag (players) "270") 20.0))
                (begin_random
                    (begin
                        (effect_new gasleak "270")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "271")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "272")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "273")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "274")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "275")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "276")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "277")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "278")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "279")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "280")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "281")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "282")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "283")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new gasleak "284")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "270")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "271")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "272")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "273")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "274")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "275")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "276")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "277")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "278")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "279")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "280")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "281")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "282")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "283")
                        (sleep (random_range 5 30))
                    )
                    (begin
                        (effect_new boom "284")
                        (sleep (random_range 5 30))
                    )
                )
                false
            )
        )
    )
)

(script dormant void to_hangar_secondtime
    (begin
        (sleep_until (= (volume_test_objects "vol_underhangar_from_top" (players)) true))
        (ai_disposable "underhangar_return_flood" true)
        (ai_disposable "underhangar_return_heretics" true)
        (wake other_hall_fx)
    )
)

(script dormant void hangar_fx
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (begin_random
                        (begin
                            (effect_new big_boom "294")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "295")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "285")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "286")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "306")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "307")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "289")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "290")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "285")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "288")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "307")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "308")
                            (sleep (random_range 5 30))
                        )
                    )
                    (begin_random
                        (begin
                            (effect_new big_boom "291")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "292")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "293")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "303")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "304")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "294")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "295")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "296")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "291")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "292")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "293")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "294")
                            (sleep (random_range 5 30))
                        )
                    )
                    (begin_random
                        (begin
                            (effect_new big_boom "297")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "298")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "299")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "300")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "301")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "302")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "289")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "290")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "299")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "286")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "287")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "300")
                            (sleep (random_range 5 30))
                        )
                    )
                    (begin_random
                        (begin
                            (effect_new big_boom "303")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "304")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "305")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "297")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "298")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "308")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "287")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new big_boom "288")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "303")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "304")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "305")
                            (sleep (random_range 5 30))
                        )
                        (begin
                            (effect_new boom "306")
                            (sleep (random_range 5 30))
                        )
                    )
                )
                false
            )
        )
    )
)

(script command_script void hack
    (begin
        (cs_enable_moving true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void hl_boss_chat_01
    (begin
        (set boss_done_talking false)
        (sleep_until (= monitor_done_talking true))
        (cs_suppress_dialogue_global true)
        (sleep 60)
        (print "heretic leader: 'how did the prophets buy your loyalty, arbiter?'")
        (cs_play_line "0800")
        (sleep 15)
        (print "heretic leader: 'with a new command? a new fleet?'")
        (cs_play_line "0810")
        (sleep 30)
        (print "heretic leader: 'or was it the promise? their great journey!'")
        (cs_play_line "0820")
        (cs_suppress_dialogue_global false)
        (set boss_done_talking true)
    )
)

(script command_script void hl_boss_chat_02
    (begin
        (set boss_done_talking false)
        (sleep_until (= monitor_done_talking true))
        (cs_suppress_dialogue_global true)
        (sleep 60)
        (print "heretic leader: 'look around you, arbiter…'")
        (cs_play_line "0830")
        (sleep 15)
        (print "heretic leader: 'this facility, and dozens like it, devoted to the study of the parasite!'")
        (cs_play_line "0840")
        (sleep 15)
        (print "heretic leader: 'but where are the weapons, arbiter?  what was the result?'")
        (cs_play_line "0850")
        (sleep 30)
        (print "heretic leader: 'all that time and effort, and the best the forerunners could do was put these foul creatures on ice!'")
        (cs_play_line "0860")
        (cs_suppress_dialogue_global false)
        (set boss_done_talking true)
    )
)

(script command_script void hl_boss_chat_03
    (begin
        (set boss_done_talking false)
        (sleep_until (= monitor_done_talking true))
        (cs_suppress_dialogue_global true)
        (sleep 60)
        (print "heretic leader: 'and now, where are these gods the prophets would have us worship?'")
        (cs_play_line "0870")
        (sleep 30)
        (print "heretic leader: 'transcended? (laughs) hardly.'")
        (cs_play_line "0880")
        (sleep 60)
        (print "heretic leader: 'come, arbiter. let me show you where they went!'")
        (cs_play_line "0890")
        (cs_suppress_dialogue_global false)
        (set boss_done_talking true)
    )
)

(script command_script void monitor_chat_01
    (begin
        (set monitor_available false)
        (set monitor_done_talking false)
        (cs_suppress_dialogue_global true)
        (cs_switch "monitor")
        (sleep 60)
        (cs_start_approach_player 3.0 50.0 50.0)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (print "343 guilty spark: 'this mining-facility predates instalation alpha by several hundred years.'")
        (cs_play_line "0900")
        (print "343 guilty spark: 'it was retrofitted to research possible offensive and defensive measures against the flood.'")
        (cs_play_line "0910")
        (print "343 guilty spark: 'indeed, i designed and oversaw the construction of this facilitiy's various outbreak management systems.'")
        (cs_play_line "0920")
        (cs_approach_stop)
        (cs_suppress_dialogue_global false)
        (set monitor_done_talking true)
        (set monitor_available true)
    )
)

(script command_script void monitor_chat_02
    (begin
        (set monitor_available false)
        (set monitor_done_talking false)
        (cs_suppress_dialogue_global true)
        (cs_switch "monitor")
        (sleep 60)
        (cs_start_approach_player 3.0 50.0 50.0)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (print "343 guilty spark: 'the tether connecting the mine to the high-altitude suspension-grid was the primary failsafe.'")
        (cs_play_line "0930")
        (print "343 guilty spark: 'i'm glad that someone was aware of the necessary protocols and severed the tether locally.'")
        (cs_play_line "0940")
        (cs_approach_stop)
        (cs_suppress_dialogue_global false)
        (set monitor_done_talking true)
        (set monitor_available true)
    )
)

(script command_script void monitor_chat_03
    (begin
        (set monitor_available false)
        (set monitor_done_talking false)
        (cs_suppress_dialogue_global true)
        (cs_switch "monitor")
        (sleep 60)
        (cs_start_approach_player 3.0 50.0 50.0)
        (cs_enable_moving true)
        (cs_enable_looking true)
        (print "343 guilty spark: 'the flood will not survive once this mine descends into the liquid hydrogen core of the planet.'")
        (cs_play_line "0950")
        (sleep 15)
        (print "343 guilty spark: 'then again, neither will we. what a pity.'")
        (cs_play_line "0960")
        (cs_approach_stop)
        (cs_suppress_dialogue_global false)
        (set monitor_done_talking true)
        (set monitor_available true)
    )
)

(script dormant void monitor_chatting
    (begin
        (sleep 1800)
        (sleep_until (= boss_done_talking true))
        (cs_run_command_script "monitor" monitor_chat_01)
        (sleep_until (= monitor_done_talking true))
        (sleep 3600)
        (sleep_until (= boss_done_talking true))
        (cs_run_command_script "monitor" monitor_chat_02)
        (sleep_until (= monitor_done_talking true))
        (sleep 3600)
        (sleep_until (= boss_done_talking true))
        (cs_run_command_script "monitor" monitor_chat_03)
    )
)

(script command_script void monitor_flit_01
    (begin
        (cs_fly_to monitor_wander/p0)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_02
    (begin
        (cs_fly_to monitor_wander/p1)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_03
    (begin
        (cs_fly_to monitor_wander/p2)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_04
    (begin
        (cs_fly_to monitor_wander/p3)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_05
    (begin
        (cs_fly_to monitor_wander/p4)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_06
    (begin
        (cs_fly_to monitor_wander/p5)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_07
    (begin
        (cs_fly_to monitor_wander/p6)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_08
    (begin
        (cs_fly_to monitor_wander/p7)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_09
    (begin
        (cs_fly_to monitor_wander/p8)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_10
    (begin
        (cs_fly_to monitor_wander/p9)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_11
    (begin
        (cs_fly_to monitor_wander/p10)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_12
    (begin
        (cs_fly_to monitor_wander/p11)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_13
    (begin
        (cs_fly_to monitor_wander/p12)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_14
    (begin
        (cs_fly_to monitor_wander/p13)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_15
    (begin
        (cs_fly_to monitor_wander/p14)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_16
    (begin
        (cs_fly_to monitor_wander/p15)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_17
    (begin
        (cs_fly_to monitor_wander/p16)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_18
    (begin
        (cs_fly_to monitor_wander/p17)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_19
    (begin
        (cs_fly_to monitor_wander/p18)
        (set monitor_available true)
    )
)

(script command_script void monitor_flit_20
    (begin
        (cs_fly_to monitor_wander/p19)
        (set monitor_available true)
    )
)

(script dormant void monitor_flitting
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_01)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_02)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_03)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_04)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_05)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_06)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_07)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_08)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_09)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_10)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_11)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_12)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_13)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_14)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_15)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_16)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_17)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_18)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_19)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                    (if (= monitor_available true) 
                        (begin
                            (cs_run_command_script "monitor" monitor_flit_20)
                            (sleep 5)
                            (sleep_until (= monitor_available true))
                        )
                    )
                )
                false
            )
        )
    )
)

(script static void boss_fight_deletion
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_boss_delete_r" (ai_actors "hl_boss_random")) true)
                (= (volume_test_objects "vol_boss_delete_l" (ai_actors "hl_boss_random")) true)
                (= (volume_test_objects "vol_boss_delete_c1" (ai_actors "hl_boss_random")) true)
                (= (volume_test_objects "vol_boss_delete_c2" (ai_actors "hl_boss_random")) true)
            ) 
        30 900)
        (if 
            (and
                (= (volume_test_objects "vol_boss_delete_r" (ai_actors "hl_boss_random")) false)
                (= (volume_test_objects "vol_boss_delete_l" (ai_actors "hl_boss_random")) false)
                (= (volume_test_objects "vol_boss_delete_c1" (ai_actors "hl_boss_random")) false)
                (= (volume_test_objects "vol_boss_delete_c2" (ai_actors "hl_boss_random")) false)
            ) 
                (begin
                    (effect_new_on_object_marker "effects\scenarios\objects\solo\alphagasgiant\holo_drone\drone_death" (list_get (ai_actors "hl_boss_random") 0) "")
                    (object_set_scale (list_get (ai_actors "hl_boss_random") 0) 0.1 30)
                    (sleep 30)
                )
        )
        (ai_erase "hl_boss_random")
    )
)

(script dormant void holo1_deleteme
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (ai_living_count "hl_boss_holo_random_01") 0)
                        (= holo_drones_nuke true)
                    )
                )
                (object_set_scale holo1 0.1 30)
                (effect_new_on_object_marker holo_death holo1 "body")
                (sleep 15)
                (object_destroy holo1)
                false
            )
        )
    )
)

(script dormant void holo2_deleteme
    (begin
        (sleep_until (= (ai_living_count "hl_boss_holo_random_01") 1))
        (object_set_scale holo2 0.1 30)
        (effect_new_on_object_marker holo_death holo2 "body")
        (sleep 15)
        (object_destroy holo2)
    )
)

(script dormant void holo3_deleteme
    (begin
        (sleep_until (= (ai_living_count "hl_boss_holo_random_03") 2))
        (object_set_scale holo3 0.1 30)
        (effect_new_on_object_marker holo_death holo3 "body")
        (sleep 15)
        (object_destroy holo3)
    )
)

(script dormant void holo4_deleteme
    (begin
        (sleep_until (= (ai_living_count "hl_boss_holo_random_01") 3))
        (object_set_scale holo4 0.1 30)
        (effect_new_on_object_marker holo_death holo4 "body")
        (sleep 15)
        (object_destroy holo4)
    )
)

(script static void hl_respawner
    (begin
        (if (difficulty_legendary) 
            (set hl_lives_total 3))
        (if (difficulty_heroic) 
            (set hl_lives_total 1))
        (sleep_until 
            (begin
                (sleep_until (<= (object_get_shield (list_get (ai_actors "hl_boss_random") 0)) 0.0))
                (if (< hl_times_dead hl_lives_total) 
                    (begin
                        (ai_set_orders "hl_boss_random" "hole_up")
                        (cs_run_command_script "hl_boss_random" hack)
                        (ai_kill "holo_drones")
                        (boss_fight_deletion)
                        (set hl_times_dead (+ hl_times_dead 1.0))
                        (ai_place "hl_boss_random" 1)
                        (ai_cannot_die "hl_boss_random" true)
                        (set heretic_leader (list_get (ai_actors "hl_boss_random") 0))
                        (if (= hl_times_dead hl_lives_total) 
                            (ai_cannot_die "boss_fight_heretic_leader" false) (ai_cannot_die "boss_fight_heretic_leader" true))
                        (if (= hl_times_dead 1) 
                            (cs_run_command_script "hl_boss_random" hl_boss_chat_01))
                        (if (= hl_times_dead 2) 
                            (cs_run_command_script "hl_boss_random" hl_boss_chat_02))
                        (if (= hl_times_dead 3) 
                            (cs_run_command_script "hl_boss_random" hl_boss_chat_03))
                        (sleep 60)
                        (sleep_until (= boss_done_talking true))
                        (game_save_no_timeout)
                        (begin_random
                            (if (< (ai_living_count "holo_drones") hl_drone_total) 
                                (ai_place "hl_boss_holo_random_01" 1))
                            (if (< (ai_living_count "holo_drones") hl_drone_total) 
                                (ai_place "hl_boss_holo_random_02" 1))
                            (if (< (ai_living_count "holo_drones") hl_drone_total) 
                                (ai_place "hl_boss_holo_random_03" 1))
                            (if (< (ai_living_count "holo_drones") hl_drone_total) 
                                (ai_place "hl_boss_holo_random_04" 1))
                        )
                        (set hl_drone_total (+ hl_drone_total 1.0))
                        (ai_set_orders "hl_boss_random" "boss_fight_hl_center")
                        (ai_set_orders "hl_boss_holo_random_01" "boss_fight_hl_center")
                        (ai_set_orders "hl_boss_holo_random_02" "boss_fight_hl_center")
                        (ai_set_orders "hl_boss_holo_random_03" "boss_fight_hl_center")
                        (ai_set_orders "hl_boss_holo_random_04" "boss_fight_hl_center")
                    )
                )
                (= hl_times_dead hl_lives_total)
            )
        )
    )
)

(script dormant void toys
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (sleep 600)
                        (object_create_anew "toy01")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy02")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy03")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy04")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy05")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy06")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy07")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy08")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy09")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy10")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy11")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy12")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy13")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy14")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy15")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy16")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy17")
                    )
                    (begin
                        (sleep 600)
                        (object_create_anew "toy18")
                    )
                )
                false
            )
        )
    )
)

(script dormant void hangar_secondtime_start
    (begin
        (sleep_until 
            (and
                (= plummeting true)
                (= (volume_test_objects "vol_hangar_reenter" (players)) true)
            )
        )
        (device_operates_automatically_set "hangar_exit" true)
        (ai_place "heretic_leader_hangar")
        (cs_run_command_script "heretic_leader_hangar" long_pause)
        (ai_cannot_die "heretic_leader_hangar" true)
        (sleep_until 
            (and
                (= plummeting true)
                (= (volume_test_objects "vol_hangar_cutscene_start" (players)) true)
            )
        )
        (cinematic_fade_to_white)
        (sleep_forever other_hall_fx)
        (sleep_forever underhangar_fx_01)
        (sleep_forever underhangar_fx_02)
        (sleep_forever bottling_fx_01)
        (sleep_forever bottling_fx_02)
        (sleep_forever bottling_fx_03)
        (sleep_forever bottling_fx_04)
        (sleep_forever bottling_fx_05)
        (sleep_forever halls_up_01)
        (sleep_forever halls_up_02)
        (sleep_forever halls_up_03)
        (sleep_forever halls_up_04)
        (sleep_forever halls_up_05)
        (sleep_forever halls_up_06)
        (sleep_forever halls_up_07)
        (ai_erase_all)
        (object_teleport (player0) "player0_hide2")
        (object_teleport (player1) "player1_hide2")
        (if (cinematic_skip_start) 
            (begin
                (c04_outro1)
            )
        )
        (cinematic_skip_stop)
        (ui_error_ok_cancel)
        (sound_class_enable_ducker "amb" 0.0 0)
        (sleep 1)
        (sound_class_enable_ducker "amb" 1.0 15)
        (sleep 2)
        (object_teleport (player0) "player0_hangar")
        (object_teleport (player1) "player1_hangar")
        (wake hangar_fx)
        (ai_place "monitor")
        (ai_place "boss_fight_heretic_leader")
        (ai_migrate "boss_fight_heretic_leader" "hl_boss_random")
        (ai_cannot_die "hl_boss_random" true)
        (ai_place "boss_fight_hl_hologram_01")
        (ai_migrate "boss_fight_hl_hologram_01" "hl_boss_holo_random_01")
        (ai_place "boss_fight_hl_hologram_02")
        (ai_migrate "boss_fight_hl_hologram_02" "hl_boss_holo_random_02")
        (device_operates_automatically_set "hangar_exit" false)
        (wake toys)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white)
        (wake objective_dogfight_clear)
        (wake objective_hl_set)
        (data_mine_insert "04b_24_boss_fight_01")
        (game_reverted)
        (wake monitor_chatting)
        (wake monitor_flitting)
        (hl_respawner)
        (ai_cannot_die "hl_boss_random" false)
        (sleep_until (= (ai_living_count "hl_boss_random") 0))
        (set final_hl_boss_dead true)
        (ai_kill_silent "holo_drones")
        (set holo_drones_nuke true)
        (sleep 120)
        (if (<= (player_count) 0) 
            (sleep_forever))
        (cinematic_fade_to_white)
        (object_teleport (player0) "player0_hide2")
        (object_teleport (player1) "player1_hide2")
        (object_destroy heretic_leader)
        (ai_erase "monitor")
        (ai_kill_silent "all_enemies")
        (if (cinematic_skip_start) 
            (begin
                (c04_outro2)
            )
        )
        (cinematic_skip_stop)
        (sleep 2)
        (playtest_mission)
        (sleep 2)
        (game_revert)
    )
)

(script static void sleep_intro
    (begin
        (sleep_forever arm_02_entry_start)
    )
)

(script static void sleep_disposal
    (begin
        (sleep_forever disposal_chamber_start)
        (sleep_forever disposal_infection_spawn)
        (sleep_forever spec_ops_reborn)
    )
)

(script static void sleep_silo
    (begin
        (sleep_forever silo_start)
        (sleep_forever silo_hall_flood_spawner)
        (sleep_forever elev_go)
        (sleep_forever to_flood_lab)
        (sleep_forever silo_commander_reminder)
        (sleep_forever silo_killer)
        (sleep_forever silo_sentinel_spawner)
        (sleep_forever silo_flood_spawner)
        (sleep_forever silo_saving)
    )
)

(script static void sleep_lab
    (begin
        (sleep_forever to_flood_lab)
        (sleep_forever flood_lab_start)
        (sleep_forever lab_barricades)
        (sleep_forever lab_wave_new_01)
        (sleep_forever lab_wave_new_02)
        (sleep_forever famine_flavor)
    )
)

(script static void sleep_wraparound
    (begin
        (sleep_forever bridge_start)
        (sleep_forever bridge_phantom_arrives)
        (sleep_forever bridge_reminder)
        (sleep_forever wraparound_right)
        (sleep_forever wraparound_left)
        (sleep_forever research_arm_bsp_swap)
    )
)

(script static void sleep_control
    (begin
        (sleep_forever control_room_start)
        (sleep_forever control_commander_reminder)
        (sleep_forever control_bug_out)
        (sleep_forever control_flood_spawn)
        (sleep_forever wind)
        (sleep_forever hologram_toggle)
        (sleep_forever hl_killer)
    )
)

(script static void sleep_cableroom
    (begin
        (sleep_forever cable_room_start)
        (sleep_forever cable_a_health)
        (sleep_forever cable_b_health)
        (sleep_forever cable_c_health)
        (sleep_forever cable_nav_a)
        (sleep_forever cable_nav_b)
        (sleep_forever cable_nav_c)
        (sleep_forever cable_sentinel_spawner)
        (sleep_forever cable_flood_spawner)
        (sleep_forever grav_test)
        (sleep_forever cable_invulnerable)
        (sleep_forever cableroom_suck_killer)
        (sleep_forever cableroom_junk_spawn)
        (sleep_forever cableroom_commander_reminder)
        (sleep_forever cableroom_killer)
        (sleep_forever cableroom_junk_killer)
        (sleep_forever croom_exit)
    )
)

(script static void sleep_control_return
    (begin
        (sleep_forever control_room_return)
        (sleep_forever control_return_flood_spawn)
    )
)

(script static void sleep_powercore
    (begin
        (sleep_forever power_core_start)
    )
)

(script static void sleep_dogfight
    (begin
        (sleep_forever dogfight_secondtime_start)
        (sleep_forever banshee_killer_00)
        (sleep_forever banshee_killer_01)
    )
)

(script static void sleep_bottling_return
    (begin
        (sleep_forever bottling_secondtime_start)
        (sleep_forever bottling_return_s_respawner)
        (sleep_forever bottling_return_cf_respawner)
        (sleep_forever bottling_return_ca_respawner)
        (sleep_forever to_underhangar_secondtime)
        (sleep_forever bottling_return_commander)
    )
)

(script static void sleep_underhangar_return
    (begin
        (sleep_forever underhangar_secondtime_start)
        (sleep_forever to_hangar_secondtime)
        (sleep_forever underhangar_return_commander)
    )
)

(script startup void mission
    (begin
        (cinematic_snap_to_white)
        (if (= (volume_test_objects "vol_arm_02_lz" (players)) true) 
            (begin
                (ui_error_ok_cancel)
                (if (cinematic_skip_start) 
                    (begin
                        (c04_intra0)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (sleep 2)
        (structure_bsp_index 3)
        (sleep 2)
        (ai_allegiance player covenant)
        (ai_allegiance heretic sentinel)
        (ai_allegiance player prophet)
        (ai_allegiance heretic prophet)
        (ai_allegiance sentinel prophet)
        (objectives_finish_up_to)
        (prep_return_from_intro)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (wake 04b_title0)
        (wake objective_labs_set)
        (wake kill_volumes)
        (wake arm_02_entry_start)
        (sleep_until (= (volume_test_objects "vol_disposal_enter" (players)) true))
        (wake disposal_chamber_start)
        (wake silo_start)
        (wake to_flood_lab)
        (wake flood_lab_start)
        (sleep_intro)
        (sleep_until (= (version) 0))
        (wake bridge_start)
        (wake control_room_start)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (wake objective_labs_clear)
        (wake objective_control_set)
        (sleep_until (= (version) 2))
        (wake cable_room_start)
        (sleep_wraparound)
        (sleep_control)
        (sleep_until (= (version) 1))
        (wake control_room_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_cableroom)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true) 1)
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
        (sleep_control_return)
        (sleep_powercore)
        (sleep_dogfight)
    )
)

(script dormant void 04_intra0_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 62 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 63 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 51 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_lg\door_tron_lg" 1)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 7)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 8)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\alphagasgiant" 9)
        (sleep 9)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 12)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 61 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 38 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 12 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 14 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "incompetent\default_object" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 4)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 5)
        (sleep 145)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 51 true)
        (sleep 45)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 36 false)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 4)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 5)
        (sleep 21)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 40 false)
        (sleep 14)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 11)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 11 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 60 false)
        (sleep 99)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 63 false)
        (sleep 31)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 51 true)
        (sleep 120)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 60 false)
    )
)

(script dormant void 04_intra1_01_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 63 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 67 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 51 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 54 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\fp_energy_blade\fp_energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\fp_energy_blade\fp_energy_blade" 1)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 15)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 16)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 17)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 18)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 19)
        (predict_lightmap_bucket "objects\weapons\pistol\plasma_pistol\plasma_pistol" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 16)
        (predict_lightmap_bucket "objects\characters\elite\elite" 21)
        (predict_lightmap_bucket "objects\characters\elite\elite" 18)
        (predict_lightmap_bucket "objects\characters\elite\elite" 23)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 17)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 45 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 86 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 84 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 6 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 13 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 30 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 32 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 35 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 36 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 38 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 39 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 41 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 56 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 29 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_lg_containment_shield\door_tron_lg_containment_shield" 0)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 64 false)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\central_chamber\generator_a\generator_a" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\wall_insertions\channel_curcuit_a\channel_curcuit_a" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\wall_insertions\channel_curcuit_a\channel_curcuit_a" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\gasgiant_hologram\gasgiant_hologram" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_lg\door_tron_lg" 0)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 33 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 34 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 40 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 42 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\edge_trim\platform_plates_a\platform_plates_a" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\control_lift_up\control_lift_up" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 64 false)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_generic\holo_generic" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 64 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_small02\holo_small02" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 64 false)
        (sleep 8)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 71)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 64 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 81 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 37 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
    )
)

(script dormant void 04_intra1_02_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 6 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 13 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 30 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 35 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 36 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 38 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 39 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\wall_insertions\channel_curcuit_a\channel_curcuit_a" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\gasgiant_hologram\gasgiant_hologram" 1)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 4)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 5)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 36)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 13 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 32 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 40 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 41 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 56 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 29 true)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\central_chamber\generator_a\generator_a" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_lg\door_tron_lg" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_small02\holo_small02" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_generic\holo_generic" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\gasgiant_hologram\gasgiant_hologram" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\control_lift_up\control_lift_up" 0)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 33 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 34 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 42 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\edge_trim\platform_plates_a\platform_plates_a" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (sleep 42)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 101)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 86 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 64 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 81 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 37 true)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 144)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 6 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 35 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 38 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 40 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 56 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\gasgiant_hologram\gasgiant_hologram" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_generic\holo_generic" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\wall_insertions\channel_curcuit_a\channel_curcuit_a" 2)
        (sleep 146)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
    )
)

(script dormant void 04_outro1_01_predict
    (begin
        (sleep 5)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 57 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 34 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 35 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 11 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 12 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 19 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 4 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 10 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 14 true)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 2)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
        (predict_lightmap_bucket "scenarios\objects\vehicles\c_seraph\c_seraph" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\gasgiant_rob" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 0)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 18)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 35)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (sleep 33)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 16)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (sleep 1)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 2 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 3 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 14 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 15 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 2)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 7 true)
        (sleep 6)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 32)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 22 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 42 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 35 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 34 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 4 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (sleep 40)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (sleep 38)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (sleep 6)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 19 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 false)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 45)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (sleep 40)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 48)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (sleep 8)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 2 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 3 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 15 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 2)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
    )
)

(script dormant void 04_outro1_02_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (sleep 113)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 9)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 39)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 10 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 14 true)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (sleep 33)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 22 false)
        (sleep 81)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 34 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 35 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 4 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (sleep 280)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 23)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 1)
        (sleep 42)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 25)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 4 true)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
        (sleep 15)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 34 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 35 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 19 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 8)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 2)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (sleep 44)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 1)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 2)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 15 true)
        (sleep 9)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 7 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 9)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 false)
        (sleep 5)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 false)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\hanger_lift\hanger_lift" 0)
        (sleep 8)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 3)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 3 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 2 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 14 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 15 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 19 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 0)
        (sleep 9)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 52)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
    )
)

(script dormant void 04_outro1_03_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 92)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 35 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 34 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 30 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 4 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\holo_drone\holo_drone" 0)
        (predict_lightmap_bucket "scenarios\objects\vehicles\c_seraph\c_seraph" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 90)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (sleep 12)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\holo_drone\holo_drone" 0)
        (sleep 32)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (sleep 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 12)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (sleep 8)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (sleep 14)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 4)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 19 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 21)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (sleep 8)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (sleep 59)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 1)
        (sleep 4)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 14 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 1)
        (sleep 4)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (sleep 3)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 10 true)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (sleep 17)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 1)
        (sleep 10)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 34 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 35 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 12 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 4 true)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\holo_drone\holo_drone" 0)
        (predict_lightmap_bucket "scenarios\objects\vehicles\c_seraph\c_seraph" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 0)
        (sleep 47)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (sleep 7)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 56)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 44)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 false)
        (sleep 174)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
    )
)

(script dormant void 04_outro2_01_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar\door_cargo_hangar" 0)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 1)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 54)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (sleep 70)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 32 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 33 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 11 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 12 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 14 true)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 3)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\controls\temp_door_switch\temp_door_switch" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 53)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (sleep 156)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (sleep 89)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
    )
)

(script dormant void 04_outro2_02_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 29 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 23 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 2 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 3 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 12 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 19 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 7 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 15 true)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 1)
        (predict_lightmap_bucket "scenarios\objects\vehicles\c_seraph\c_seraph" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 2)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (sleep 9)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 33 false)
        (sleep 8)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 32 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (sleep 10)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 17)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (sleep 90)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 57 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 34 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 31 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 16 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 8 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 35 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 17 false)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 0 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 5 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 6 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 11 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 12 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 13 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 19 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 20 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 21 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 1 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 4 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 7 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 9 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 10 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 14 true)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 15 true)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "objects\characters\elite\elite_jetpack\elite_jetpack" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\grenade\plasma_grenade\plasma_grenade" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 0)
        (predict_lightmap_bucket "objects\weapons\pistol\needler\needler" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\covenant_carbine\covenant_carbine" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_sm\door_tron_sm" 0)
        (predict_lightmap_bucket "scenarios\objects\vehicles\c_seraph\c_seraph" 0)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "objects\weapons\support_low\sentinel_gun\sentinel_gun" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 56)
        (predict_bitmap scenarios\solo\04b_floodlab\production_arm2 27 false)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
    )
)

(script static void teleport_silo
    (begin
        (structure_bsp_index 3)
        (object_teleport (player0) "silo_player0")
        (object_teleport (player1) "silo_player1")
        (ai_place "allies_elites_03a" 1)
        (ai_place "allies_elites_03b" 1)
        (object_teleport (list_get (ai_actors "allies_elites_03a") 0) "silo_ally01")
        (object_teleport (list_get (ai_actors "allies_elites_03b") 0) "silo_ally02")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (wake silo_start)
        (wake to_flood_lab)
        (wake flood_lab_start)
        (sleep_until (= (version) 0))
        (wake bridge_start)
        (wake control_room_start)
        (sleep_until (= (version) 2))
        (wake cable_room_start)
        (sleep_until (= (version) 1))
        (wake control_room_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_lab
    (begin
        (ai_erase_all)
        (structure_bsp_index 3)
        (object_teleport (player0) "lab_player0")
        (object_teleport (player1) "lab_player1")
        (ai_place "allies_elites_03a" 1)
        (object_teleport (list_get (ai_actors "allies_elites_03a") 0) "lab_ally01")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (wake to_flood_lab)
        (wake flood_lab_start)
        (sleep_until (= (version) 0))
        (wake bridge_start)
        (wake control_room_start)
        (sleep_until (= (version) 2))
        (wake cable_room_start)
        (sleep_until (= (version) 1))
        (wake control_room_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_wraparound
    (begin
        (ai_erase_all)
        (structure_bsp_index 0)
        (sleep 2)
        (object_teleport (player0) "wraparound_player0")
        (object_teleport (player1) "wraparound_player1")
        (ai_place "allies_elites_03a" 1)
        (object_teleport (list_get (ai_actors "allies_elites_03a") 0) "wraparound_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (wake bridge_start)
        (wake control_room_start)
        (sleep_until (= (version) 2))
        (wake cable_room_start)
        (sleep_until (= (version) 1))
        (wake control_room_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_control
    (begin
        (ai_erase_all)
        (structure_bsp_index 0)
        (sleep 2)
        (object_teleport (player0) "control_entry_player0")
        (object_teleport (player1) "control_entry_player1")
        (ai_place "allies_elites_04" 1)
        (ai_place "allies_grunts_04" 1)
        (object_teleport (list_get (ai_actors "allies_elites_04") 0) "control_ally01")
        (object_teleport (list_get (ai_actors "allies_grunts_04") 0) "control_ally02")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (wake control_room_start)
        (sleep_until (= (version) 2))
        (wake cable_room_start)
        (sleep_until (= (version) 1))
        (wake control_room_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_cableroom
    (begin
        (ai_erase_all)
        (structure_bsp_index 2)
        (sleep 2)
        (object_teleport (player0) "cableroom_player0")
        (object_teleport (player1) "cableroom_player1")
        (device_set_position_immediate "elev_control_up" 1.0)
        (device_set_power "control_up_switch_02" 0.0)
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (sleep_control)
        (wake cable_room_start)
        (sleep_until (= (version) 1))
        (wake control_room_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_plummet
    (begin
        (ai_erase_all)
        (set plummeting true)
        (structure_bsp_index 1)
        (sleep 2)
        (object_teleport (player0) "after_plummet_player0")
        (object_teleport (player1) "after_plummet_player1")
        (device_set_position_immediate "control_shield_door" 1.0)
        (device_set_position_immediate "shield" 1.0)
        (device_set_position_immediate "elev_control_up" 0.0)
        (device_set_power "control_up_switch_01" 0.0)
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (sleep_control)
        (sleep_cableroom)
        (wake control_room_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_powercore
    (begin
        (ai_erase_all)
        (set plummeting true)
        (structure_bsp_index 1)
        (sleep 2)
        (object_teleport (player0) "powercore_player0")
        (object_teleport (player1) "powercore_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (sleep_control)
        (sleep_cableroom)
        (sleep_control_return)
        (wake power_core_start)
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_banshee
    (begin
        (ai_erase_all)
        (set plummeting true)
        (structure_bsp_index 1)
        (sleep 2)
        (object_teleport (player0) "banshee_player0")
        (object_teleport (player1) "banshee_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (sleep_control)
        (sleep_cableroom)
        (sleep_control_return)
        (sleep_powercore)
        (device_operates_automatically_set "hl_ledge_ext" true)
        (object_create "player0_fake_banshee")
        (object_create "player1_fake_banshee")
        (object_create "hl_fake_banshee")
        (object_cannot_take_damage "player0_fake_banshee")
        (object_cannot_take_damage "player1_fake_banshee")
        (object_cannot_take_damage "hl_fake_banshee")
        (wake dogfight_secondtime_start)
        (sleep_until (= (volume_test_objects "vol_arm_01_return" (players)) true))
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_bottling_return
    (begin
        (ai_erase_all)
        (set plummeting true)
        (structure_bsp_index 1)
        (sleep 2)
        (object_teleport (player0) "bottling_return_player0")
        (object_teleport (player1) "bottling_return_player1")
        (device_operates_automatically_set "viewroom_exit01_bsp0" true)
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (sleep_control)
        (sleep_cableroom)
        (sleep_control_return)
        (sleep_powercore)
        (sleep_dogfight)
        (wake bottling_secondtime_start)
        (wake to_underhangar_secondtime)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_underhangar_return
    (begin
        (ai_erase_all)
        (set plummeting true)
        (structure_bsp_index 5)
        (sleep 2)
        (object_teleport (player0) "underhangar_return_player0")
        (object_teleport (player1) "underhangar_return_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (sleep_control)
        (sleep_cableroom)
        (sleep_control_return)
        (sleep_powercore)
        (sleep_dogfight)
        (sleep_bottling_return)
        (wake underhangar_secondtime_start)
        (wake to_hangar_secondtime)
        (wake hangar_secondtime_start)
    )
)

(script static void teleport_boss
    (begin
        (ai_erase_all)
        (set plummeting true)
        (structure_bsp_index 5)
        (sleep 2)
        (object_teleport (player0) "boss_player0")
        (object_teleport (player1) "boss_player1")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_disposal)
        (sleep_silo)
        (sleep_lab)
        (sleep_wraparound)
        (sleep_control)
        (sleep_cableroom)
        (sleep_control_return)
        (sleep_powercore)
        (sleep_dogfight)
        (sleep_bottling_return)
        (sleep_underhangar_return)
        (wake hangar_secondtime_start)
    )
)

