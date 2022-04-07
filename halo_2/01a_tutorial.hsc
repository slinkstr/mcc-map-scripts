; Decompiled with Blamite
; Source file: 01a_tutorial.hsc
; Start time: 4/7/2022 7:17:03
; Decompilation finished in ~0.0014021s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short tick_seconds (game_tick_length))
(global short global_random 0)
(global short global_random_rumble 0)
(global short global_random_bridge 0)
(global short delay_prompt_blink (* 2.0 tick_seconds))
(global short delay_prompt_short (* 8.0 tick_seconds))
(global short delay_prompt_medium (* 16.0 tick_seconds))
(global short delay_prompt_long (* 36.0 tick_seconds))
(global short delay_prompt_drag (* 48.0 tick_seconds))
(global short delay_prompt_final (* 60.0 tick_seconds))
(global boolean mark_bsp0 false)
(global boolean mark_bsp1 false)
(global boolean mark_bsp2 false)
(global boolean mark_bsp3 false)
(global boolean mark_bsp4 false)
(global boolean mark_bsp5 false)
(global short counter_mindread_normal_success 0)
(global short counter_mindread_invert_success 0)
(global short counter_training_pitch_choose 0)
(global short counter_prompt_looker_start 0)
(global short counter_prompt_looker 0)
(global short counter_prompt_start_spot 0)
(global short counter_prompt_careful 0)
(global short counter_prompt_zapper_lookatme 0)
(global short counter_prompt_zapper_getin 0)
(global short counter_prompt_zapper_button 0)
(global short counter_prompt_elevator_plr 0)
(global boolean mark_looker_light_left false)
(global boolean mark_looker_light_right false)
(global boolean mark_looker_light_top false)
(global boolean mark_looker_light_bottom false)
(global boolean mark_training_free false)
(global boolean mark_training_done false)
(global short timer_training_pitch_choose 0)
(global short timer_prompt_looker_start 0)
(global short timer_prompt_looker 0)
(global short timer_prompt_start_spot 0)
(global short timer_prompt_careful 0)
(global short timer_prompt_zapper 0)
(global short timer_prompt_zapper_lookatme 0)
(global short timer_prompt_zapper_getin 0)
(global short timer_prompt_zapper_button 0)
(global short timer_prompt_elevator_plr 0)
(global boolean mark_ice_cream false)


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

(script static void save_look_start
    (begin
        (if (game_all_quiet) 
            (data_mine_insert "01a_look_start"))
    )
)

(script static void save_move_start
    (begin
        (game_save_no_timeout)
        (if (game_all_quiet) 
            (data_mine_insert "01a_move_start"))
    )
)

(script static void save_shield_start
    (begin
        (game_save_no_timeout)
        (if (game_all_quiet) 
            (data_mine_insert "01a_shield_start"))
    )
)

(script static void save_tram_start
    (begin
        (game_save_no_timeout)
        (if (game_all_quiet) 
            (data_mine_insert "01a_tram_start"))
    )
)

(script command_script void cs_lookat_player
    (begin
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_lookat_guns
    (begin
        (cs_face_object true (ai_get_object "guns"))
        (sleep_forever)
    )
)

(script command_script void cs_johnson_glanceat_guns
    (begin
        (cs_enable_looking true)
        (cs_look_object true (ai_get_object "guns"))
        (sleep_forever)
    )
)

(script command_script void cs_lookat_johnson
    (begin
        (cs_face_object true (ai_get_object "johnson"))
        (sleep_forever)
    )
)

(script command_script void cs_lookat_console_zapper
    (begin
        (cs_look true guns_points/console_zapper)
        (sleep 45)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_lookat_console_toplight
    (begin
        (cs_aim_object true "looker_light_top_red")
        (sleep 45)
        (cs_face true guns_points/console_inhibitor)
        (sleep 30)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_lookat_console_bottomlight
    (begin
        (cs_aim_object true "looker_light_bottom_red")
        (sleep 45)
        (cs_face true guns_points/console_inhibitor)
        (sleep 30)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_lookat_console_inhibitor
    (begin
        (cs_face true guns_points/console_inhibitor)
        (sleep 30)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_guns_start
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to guns_points/start)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_guns_zapper_halfway
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to guns_points/zapper_halfway)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_guns_zapper_wait
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to guns_points/zapper)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_guns_zapper
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_and_face guns_points/zapper guns_points/zapper_face)
        (cs_face true guns_points/zapper_face)
        (sleep_forever)
    )
)

(script command_script void cs_guns_zapper_prompt
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_face_player true)
        (sleep 90)
        (cs_face_player false)
        (cs_go_to_and_face guns_points/zapper guns_points/zapper_face)
        (cs_face true guns_points/zapper_face)
        (sleep_forever)
    )
)

(script command_script void cs_johnson_start
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to johnson_points/start)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_johnson_elevator
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to johnson_points/elevator)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_johnson_elevator_face_guns
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to johnson_points/elevator)
        (cs_face_object true (ai_get_object "guns"))
        (sleep_forever)
    )
)

(script command_script void cs_guns_elevator
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to guns_points/elevator)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_johnson_tram
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_and_face johnson_points/tram johnson_points/earth)
        (cs_face true johnson_points/earth)
        (sleep_forever)
    )
)

(script command_script void cs_lookat_macgun
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_go_to_and_face johnson_points/tram_2 johnson_points/macgun)
        (cs_face true johnson_points/macgun)
        (sleep_forever)
    )
)

(script command_script void cs_lookat_malta
    (begin
        (cs_face true johnson_points/malta)
        (sleep_forever)
    )
)

(script command_script void cs_lookat_fleet
    (begin
        (cs_face_object true "inamberclad")
        (cs_look_object true "inamberclad")
        (sleep_forever)
    )
)

(script command_script void cs_johnson_lookat_station
    (begin
        (cs_face true johnson_points/station)
        (sleep_forever)
    )
)

(script command_script void cs_johnson_station
    (begin
        (cs_force_combat_status 2)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to johnson_points/station)
        (cs_face_player true)
        (sleep_forever)
    )
)

(script static boolean prompt_looker_start
    (begin
        (if (= counter_prompt_looker_start 0) 
            (begin
                (begin
                    (print "go ahead and look at each of the four lights, chief.")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3110_gun" (ai_get_object "guns") 1.0)
                    (set timer_prompt_looker (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3110_gun")))
                    (set timer_prompt_looker (+ timer_prompt_looker delay_prompt_short))
                )
            ) (if (= counter_prompt_looker_start 1) 
                (begin
                    (begin
                        (print "go ahead and target them one more time.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1360_gun" (ai_get_object "guns") 1.0)
                        (set timer_prompt_looker (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1360_gun")))
                        (set timer_prompt_looker (+ timer_prompt_looker delay_prompt_medium))
                    )
                ) (if true 
                    (begin
                        (set counter_prompt_looker_start 0)
                    ) )
            )
        )
        (set counter_prompt_looker_start (+ counter_prompt_looker_start 1.0))
        false
    )
)

(script static boolean prompt_looker
    (begin
        (if (= counter_prompt_looker 0) 
            (begin
                (begin
                    (print "you have to look at each light until it turns green.")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1310_gun" (ai_get_object "guns") 1.0)
                    (set timer_prompt_looker (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1310_gun")))
                    (set timer_prompt_looker (+ timer_prompt_looker delay_prompt_short))
                )
            ) (if (= counter_prompt_looker 1) 
                (begin
                    (begin
                        (print "you gotta look at all the lights to complete the test.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1370_gun" (ai_get_object "guns") 1.0)
                        (set timer_prompt_looker (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1370_gun")))
                        (set timer_prompt_looker (+ timer_prompt_looker delay_prompt_short))
                    )
                ) (if (= counter_prompt_looker 2) 
                    (begin
                        (begin
                            (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                            (print "look at the lights, chief, one by one.")
                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1300_gun" (ai_get_object "guns") 1.0)
                            (set timer_prompt_looker (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1300_gun")))
                            (set timer_prompt_looker (+ timer_prompt_looker delay_prompt_medium))
                        )
                    ) (if (= counter_prompt_looker 3) 
                        (begin
                            (begin
                                (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                                (print "please look at the lights again, son.")
                                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1350_gun" (ai_get_object "guns") 1.0)
                                (set timer_prompt_looker (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1350_gun")))
                                (set timer_prompt_looker (+ timer_prompt_looker delay_prompt_medium))
                            )
                        ) (if true 
                            (begin
                                (set counter_prompt_looker 0)
                            ) )
                    )
                )
            )
        )
        (set counter_prompt_looker (+ counter_prompt_looker 1.0))
        false
    )
)

(script static boolean prompt_start_spot
    (begin
        (if (= counter_prompt_start_spot 0) 
            (begin
                (begin
                    (print "go on, walk around, try it out.")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0820_gun" (ai_get_object "guns") 1.0)
                    (set timer_prompt_start_spot (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0820_gun")))
                    (set timer_prompt_start_spot (+ timer_prompt_start_spot delay_prompt_short))
                )
            ) (if (= counter_prompt_start_spot 1) 
                (begin
                    (begin
                        (unit_set_emotional_state (ai_get_unit "guns") "inquisitive" 0.5 1)
                        (print "something wrong son?  can't you move?")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0830_gun" (ai_get_object "guns") 1.0)
                        (set timer_prompt_start_spot (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0830_gun")))
                        (set timer_prompt_start_spot (+ timer_prompt_start_spot delay_prompt_medium))
                    )
                ) (if (= counter_prompt_start_spot 2) 
                    (begin
                        (begin
                            (unit_set_emotional_state (ai_get_unit "guns") "inquisitive" 0.5 1)
                            (print "inhibitors are definitely off. you should be able to walk around.")
                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0840_gun" (ai_get_object "guns") 1.0)
                            (set timer_prompt_start_spot (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0840_gun")))
                            (set timer_prompt_start_spot (+ timer_prompt_start_spot delay_prompt_medium))
                        )
                    ) (if true 
                        (begin
                            (set counter_prompt_start_spot 0)
                        ) )
                )
            )
        )
        (set counter_prompt_start_spot (+ counter_prompt_start_spot 1.0))
        false
    )
)

(script static boolean prompt_careful
    (begin
        (if (= counter_prompt_careful 0) 
            (begin
                (begin
                    (cs_run_command_script "guns" cs_lookat_player)
                    (unit_set_emotional_state (ai_get_unit "guns") "scared" 0.5 1)
                    (sleep 8)
                    (print "hey! take it easy!")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0850_gun" (ai_get_object "guns") 1.0)
                    (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0850_gun"))
                    (sleep 30)
                    (cs_run_command_script "guns" cs_guns_zapper_wait)
                )
            ) (if (= counter_prompt_careful 1) 
                (begin
                    (begin
                        (cs_run_command_script "guns" cs_lookat_player)
                        (unit_set_emotional_state (ai_get_unit "guns") "scared" 0.5 1)
                        (sleep 8)
                        (print "careful! you'll tear a tendon doing that!")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0860_gun" (ai_get_object "guns") 1.0)
                        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0860_gun"))
                        (sleep 30)
                        (cs_run_command_script "guns" cs_guns_zapper_wait)
                    )
                ) (if (= counter_prompt_careful 2) 
                    (begin
                        (begin
                            (cs_run_command_script "guns" cs_lookat_player)
                            (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                            (sleep 8)
                            (print "fine. but don't come crying to me when your rip your leg out of its socket.")
                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0870_gun" (ai_get_object "guns") 1.0)
                            (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0870_gun"))
                            (sleep 30)
                            (cs_run_command_script "guns" cs_guns_zapper_wait)
                        )
                    ) (if true 
                        (begin
                            (set counter_prompt_careful 2)
                        ) )
                )
            )
        )
        (set timer_prompt_careful delay_prompt_blink)
        (set counter_prompt_careful (+ counter_prompt_careful 1.0))
        false
    )
)

(script static boolean prompt_zapper_lookatme
    (begin
        (hud_enable_training false)
        (if (= counter_prompt_zapper_lookatme 0) 
            (begin
                (begin
                    (cs_run_command_script "guns" cs_guns_zapper_prompt)
                    (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                    (sleep 30)
                    (print "are you listening to me?.")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3160_gun" (ai_get_object "guns") 1.0)
                    (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3160_gun")))
                    (set timer_prompt_zapper_lookatme (+ timer_prompt_zapper delay_prompt_short))
                )
            ) (if (= counter_prompt_zapper_lookatme 1) 
                (begin
                    (begin
                        (cs_run_command_script "guns" cs_guns_zapper_prompt)
                        (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                        (sleep 30)
                        (print "over here, chief.  focus.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3170_gun" (ai_get_object "guns") 1.0)
                        (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3170_gun")))
                        (set timer_prompt_zapper_lookatme (+ timer_prompt_zapper delay_prompt_short))
                    )
                ) (if (= counter_prompt_zapper_lookatme 2) 
                    (begin
                        (begin
                            (cs_run_command_script "guns" cs_guns_zapper_prompt)
                            (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                            (sleep 30)
                            (print "it's considered respectful to look at someone when they are talking.")
                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3180_gun" (ai_get_object "guns") 1.0)
                            (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3180_gun")))
                            (set timer_prompt_zapper_lookatme (+ timer_prompt_zapper delay_prompt_medium))
                        )
                    ) (if (= counter_prompt_zapper_lookatme 3) 
                        (begin
                            (begin
                                (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.5 1)
                                (sleep 30)
                                (print "this is important, you could at least look at me while i explain it.")
                                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3190_gun" (ai_get_object "guns") 1.0)
                                (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3190_gun")))
                                (set timer_prompt_zapper_lookatme (+ timer_prompt_zapper delay_prompt_medium))
                            )
                        ) (if (= counter_prompt_zapper_lookatme 4) 
                            (begin
                                (begin
                                    (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                    (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.5 1)
                                    (sleep 30)
                                    (print "i'm talking to you, chief.  loot at me.")
                                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3200_gun" (ai_get_object "guns") 1.0)
                                    (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3200_gun")))
                                    (set timer_prompt_zapper_lookatme (+ timer_prompt_zapper delay_prompt_long))
                                    (player_training_activate_flashlight "tutorial_zapper_lookatme")
                                    (hud_enable_training true)
                                )
                            ) (if (= counter_prompt_zapper_lookatme 5) 
                                (begin
                                    (begin
                                        (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                        (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.5 1)
                                        (sleep 30)
                                        (print "i know you spartans think you know everything, but it couldn't hurt you to at least look this way.")
                                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3210_gun" (ai_get_object "guns") 1.0)
                                        (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3210_gun")))
                                        (set timer_prompt_zapper_lookatme (+ timer_prompt_zapper delay_prompt_long))
                                        (player_training_activate_flashlight "tutorial_zapper_lookatme")
                                        (hud_enable_training true)
                                    )
                                ) (if (= counter_prompt_zapper_lookatme 6) 
                                    (begin
                                        (begin
                                            (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                            (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.5 1)
                                            (sleep 30)
                                            (print "look, just because the brass kisses your ass, doesn't mean i will.  look at me when i talk to you!")
                                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3220_gun" (ai_get_object "guns") 1.0)
                                            (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3220_gun")))
                                            (set timer_prompt_zapper_lookatme (+ timer_prompt_zapper delay_prompt_drag))
                                            (player_training_activate_flashlight "tutorial_zapper_lookatme")
                                            (hud_enable_training true)
                                        )
                                    ) (if true 
                                        (begin
                                            (set counter_prompt_zapper_lookatme 3)
                                        ) )
                                )
                            )
                        )
                    )
                )
            )
        )
        (set counter_prompt_zapper_lookatme (+ counter_prompt_zapper_lookatme 1.0))
        false
    )
)

(script static boolean prompt_zapper_getin
    (begin
        (hud_enable_training false)
        (if (= counter_prompt_zapper_getin 0) 
            (begin
                (begin
                    (custom_animation (ai_get_unit "guns") "objects\characters\marine\tutorial\tutorial" "l01_0900_jon" true)
                    (update_remote_camera 0)
                    (input_suppress_vibration 1)
                    (sleep 10)
                    (print "step on in. i'll show you.")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0900_gun" (ai_get_object "guns") 1.0)
                    (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0900_gun")))
                    (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_short))
                )
            ) (if (= counter_prompt_zapper_getin 1) 
                (begin
                    (begin
                        (cs_run_command_script "guns" cs_guns_zapper_prompt)
                        (sleep 30)
                        (print "step into the red sqaure, chief, and we'll get started.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3230_gun" (ai_get_object "guns") 1.0)
                        (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3230_gun")))
                        (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_short))
                    )
                ) (if (= counter_prompt_zapper_getin 2) 
                    (begin
                        (begin
                            (cs_run_command_script "guns" cs_guns_zapper_prompt)
                            (sleep 30)
                            (print "chief? stand in the red square.")
                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3240_gun" (ai_get_object "guns") 1.0)
                            (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3240_gun")))
                            (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_medium))
                        )
                    ) (if (= counter_prompt_zapper_getin 3) 
                        (begin
                            (begin
                                (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                (sleep 30)
                                (print "you have to stand in the red square before we can start the test.")
                                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3250_gun" (ai_get_object "guns") 1.0)
                                (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3250_gun")))
                                (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_medium))
                            )
                        ) (if (= counter_prompt_zapper_getin 4) 
                            (begin
                                (begin
                                    (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                    (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                                    (sleep 30)
                                    (print "go ahead and stand in the red sqaure.  it'll just take a minute.")
                                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3260_gun" (ai_get_object "guns") 1.0)
                                    (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3260_gun")))
                                    (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_long))
                                )
                            ) (if (= counter_prompt_zapper_getin 5) 
                                (begin
                                    (begin
                                        (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                        (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                                        (sleep 30)
                                        (print "come on, son, step into the red square.")
                                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3270_gun" (ai_get_object "guns") 1.0)
                                        (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3270_gun")))
                                        (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_long))
                                        (player_training_activate_flashlight "tutorial_zapper_getin")
                                        (hud_enable_training true)
                                    )
                                ) (if (= counter_prompt_zapper_getin 6) 
                                    (begin
                                        (begin
                                            (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                            (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                                            (sleep 30)
                                            (print "will you stop screwing around?  stand in the red square!")
                                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3280_gun" (ai_get_object "guns") 1.0)
                                            (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3280_gun")))
                                            (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_long))
                                            (player_training_activate_flashlight "tutorial_zapper_getin")
                                            (hud_enable_training true)
                                        )
                                    ) (if (= counter_prompt_zapper_getin 7) 
                                        (begin
                                            (begin
                                                (cs_run_command_script "guns" cs_guns_zapper_prompt)
                                                (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.5 1)
                                                (sleep 30)
                                                (print "stop bustin' my balls, and step in the damn square!")
                                                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3290_gun" (ai_get_object "guns") 1.0)
                                                (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3290_gun")))
                                                (set timer_prompt_zapper_getin (+ timer_prompt_zapper delay_prompt_drag))
                                                (player_training_activate_flashlight "tutorial_zapper_getin")
                                                (hud_enable_training true)
                                            )
                                        ) (if true 
                                            (begin
                                                (set counter_prompt_zapper_getin 2)
                                            ) )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
        (set counter_prompt_zapper_getin (+ counter_prompt_zapper_getin 1.0))
        false
    )
)

(script static boolean prompt_zapper_button
    (begin
        (hud_enable_training false)
        (if (= counter_prompt_zapper_button 0) 
            (begin
                (begin
                    (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.0 1)
                    (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.0 1)
                    (device_set_power "zapper_control" 1.0)
                    (print "your new armor's shields are extremely resilient - very efficient.")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0880_gun" (ai_get_object "guns") 1.0)
                    (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0880_gun")))
                    (set timer_prompt_zapper_button (+ timer_prompt_zapper 0.0))
                )
            ) (if (= counter_prompt_zapper_button 1) 
                (begin
                    (begin
                        (print "much better than the covenant tech we used for the mark-five.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0890_gun" (ai_get_object "guns") 1.0)
                        (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0890_gun")))
                        (set timer_prompt_zapper_button (+ timer_prompt_zapper 0.0))
                    )
                ) (if (= counter_prompt_zapper_button 2) 
                    (begin
                        (begin
                            (custom_animation (ai_get_unit "guns") "objects\characters\marine\tutorial\tutorial" "l01_0910_jon" true)
                            (update_remote_camera 1)
                            (input_suppress_vibration 2)
                            (sleep 10)
                            (print "go ahead and use the switch in front of you to start the shield test.")
                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3300_gun" (ai_get_object "guns") 1.0)
                            (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3300_gun")))
                            (set timer_prompt_zapper_button (+ timer_prompt_zapper delay_prompt_short))
                        )
                    ) (if (= counter_prompt_zapper_button 3) 
                        (begin
                            (begin
                                (print "just place your hand on the touchpad to activate the switch.")
                                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3310_gun" (ai_get_object "guns") 1.0)
                                (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3310_gun")))
                                (set timer_prompt_zapper_button (+ timer_prompt_zapper delay_prompt_medium))
                            )
                        ) (if (= counter_prompt_zapper_button 4) 
                            (begin
                                (begin
                                    (print "hit the switch, it won't hurt….much")
                                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3340_gun" (ai_get_object "guns") 1.0)
                                    (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3340_gun")))
                                    (set timer_prompt_zapper_button (+ timer_prompt_zapper delay_prompt_medium))
                                )
                            ) (if (= counter_prompt_zapper_button 5) 
                                (begin
                                    (begin
                                        (print "go ahead and use that switch in front of you.")
                                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3330_gun" (ai_get_object "guns") 1.0)
                                        (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3330_gun")))
                                        (set timer_prompt_zapper_button (+ timer_prompt_zapper delay_prompt_long))
                                        (player_training_activate_flashlight "tutorial_zapper_button")
                                        (hud_enable_training true)
                                    )
                                ) (if (= counter_prompt_zapper_button 6) 
                                    (begin
                                        (begin
                                            (print "the switch right in front of you will start the shield test.")
                                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3320_gun" (ai_get_object "guns") 1.0)
                                            (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3320_gun")))
                                            (set timer_prompt_zapper_button (+ timer_prompt_zapper delay_prompt_long))
                                            (player_training_activate_flashlight "tutorial_zapper_button")
                                            (hud_enable_training true)
                                        )
                                    ) (if (= counter_prompt_zapper_button 7) 
                                        (begin
                                            (begin
                                                (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
                                                (print "it's a switch.  you press it.")
                                                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3350_gun" (ai_get_object "guns") 1.0)
                                                (set timer_prompt_zapper (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3350_gun")))
                                                (set timer_prompt_zapper_button (+ timer_prompt_zapper delay_prompt_drag))
                                                (player_training_activate_flashlight "tutorial_zapper_button")
                                                (hud_enable_training true)
                                            )
                                        ) (if true 
                                            (begin
                                                (set counter_prompt_zapper_button 2)
                                            ) )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
        (set counter_prompt_zapper_button (+ counter_prompt_zapper_button 1.0))
        false
    )
)

(script static boolean prompt_elevator_plr
    (begin
        (hud_enable_training false)
        (if (= counter_prompt_elevator_plr 0) 
            (begin
                (begin
                    (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_short))
                    (input_suppress_vibration 3)
                )
            ) (if (= counter_prompt_elevator_plr 1) 
                (begin
                    (begin
                        (print "c'mon, chief, they're ready for us on the bridge.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1640_jon" (ai_get_object "johnson") 1.0)
                        (set timer_prompt_elevator_plr (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1640_jon")))
                        (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_short))
                    )
                ) (if (= counter_prompt_elevator_plr 2) 
                    (begin
                        (begin
                            (print "get on the lift, cheif, we're gonna be late.")
                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1650_jon" (ai_get_object "johnson") 1.0)
                            (set timer_prompt_elevator_plr (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1650_jon")))
                            (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
                            (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_medium))
                        )
                    ) (if (= counter_prompt_elevator_plr 3) 
                        (begin
                            (begin
                                (unit_set_emotional_state (ai_get_unit "johnson") "annoyed" 0.5 1)
                                (print "i don't want to keep the brass waiting, chief.")
                                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1660_jon" (ai_get_object "johnson") 1.0)
                                (set timer_prompt_elevator_plr (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1660_jon")))
                                (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
                                (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_medium))
                            )
                        ) (if (= counter_prompt_elevator_plr 4) 
                            (begin
                                (begin
                                    (unit_set_emotional_state (ai_get_unit "johnson") "annoyed" 0.5 1)
                                    (print "fine. you can tell lord hood why we're late!")
                                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1670_jon" (ai_get_object "johnson") 1.0)
                                    (set timer_prompt_elevator_plr (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1670_jon")))
                                    (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
                                    (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
                                )
                            ) (if (= counter_prompt_elevator_plr 5) 
                                (begin
                                    (begin
                                        (unit_set_emotional_state (ai_get_unit "johnson") "angry" 0.5 1)
                                        (print "get your shiny green posterior on this elevator!")
                                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1680_jon" (ai_get_object "johnson") 1.0)
                                        (set timer_prompt_elevator_plr (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1680_jon")))
                                        (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
                                        (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
                                    )
                                ) (if (= counter_prompt_elevator_plr 6) 
                                    (begin
                                        (begin
                                            (unit_set_emotional_state (ai_get_unit "johnson") "angry" 0.5 1)
                                            (print "would it help if i said please?")
                                            (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1690_jon" (ai_get_object "johnson") 1.0)
                                            (set timer_prompt_elevator_plr (* (testprintbool) (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1690_jon")))
                                            (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_long))
                                            (set timer_prompt_elevator_plr (+ timer_prompt_elevator_plr delay_prompt_drag))
                                            (set mark_ice_cream true)
                                        )
                                    ) (if true 
                                        (begin
                                            (set counter_prompt_elevator_plr 0)
                                        ) )
                                )
                            )
                        )
                    )
                )
            )
        )
        (set counter_prompt_elevator_plr (+ counter_prompt_elevator_plr 1.0))
        false
    )
)

(script static void training_setup
    (begin
        (game_save_unsafe false)
        (unit_set_maximum_vitality (player0) 30.0 1.0)
        (device_set_power "zapper_control" 0.0)
        (device_set_position_immediate "elevator_tram" 0.0)
        (ai_place "guns")
        (ai_cannot_die "guns" true)
        (cs_run_command_script "guns" cs_guns_start)
    )
)

(script startup void icecream
    (begin
        (sleep_until 
            (and
                mark_ice_cream
                (difficulty_legendary)
            ) 
        1)
        (object_create "cookiesncream")
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
            ) 
        1)
        (reset_dsp_image 14)
        (print "blam")
    )
)

(script static void test_mindread_up
    (begin
        (object_create "looker_light_top_red")
        (player_action_test_primary_trigger)
        (player_action_test_look_pitch_end)
        (player_action_test_jump true)
        (cs_run_command_script "guns" cs_lookat_console_toplight)
        (sleep_until 
            (or
                (objects_can_see_object (players) "looker_light_top_red" 5.0)
                (player_action_test_look_up_begin)
            ) 
        1 360)
        (if (not 
            (or
                (objects_can_see_object (players) "looker_light_top_red" 5.0)
                (player_action_test_look_up_begin)
            )
        ) 
            (begin
                (print "go ahead and look at the top light, chief.")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3070_gun" (ai_get_object "guns") 1.0)
                (player_training_activate_flashlight "tutorial_look_up")
                (hud_enable_training true)
                (player_training_activate_crouch true)
            )
        )
        (cs_run_command_script "guns" cs_lookat_console_inhibitor)
        (sleep_until 
            (or
                (objects_can_see_object (players) "looker_light_top_red" 5.0)
                (player_action_test_look_up_begin)
            ) 
        1)
        (player_action_test_jump false)
        (player_training_activate_crouch false)
        (hud_enable_training false)
        (object_destroy "looker_light_top_red")
        (if (not (map_reset)) 
            (begin
                (begin
                    (set counter_mindread_normal_success (+ counter_mindread_normal_success 1.0))
                    (set counter_mindread_invert_success 0)
                    (print "normal success")
                )
            ) (if (not (debug_teleport_player)) 
                (begin
                    (begin
                        (set counter_mindread_invert_success (+ counter_mindread_invert_success 1.0))
                        (set counter_mindread_normal_success 0)
                        (print "invert success")
                    )
                ) (if true 
                    (begin
                        (begin
                            (set counter_mindread_normal_success 0)
                            (set counter_mindread_invert_success 0)
                        )
                    ) )
            )
        )
        (player_action_test_jump false)
        (player_action_test_lookstick_backward)
        (player_action_test_primary_trigger)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3070_gun"))
    )
)

(script static void test_mindread_down
    (begin
        (object_create "looker_light_bottom_red")
        (player_action_test_primary_trigger)
        (player_action_test_lookstick_forward)
        (player_action_test_jump true)
        (cs_run_command_script "guns" cs_lookat_console_bottomlight)
        (sleep_until 
            (or
                (objects_can_see_object (players) "looker_light_bottom_red" 3.0)
                (player_action_test_look_down_begin)
            ) 
        1 360)
        (if (not 
            (or
                (objects_can_see_object (players) "looker_light_bottom_red" 3.0)
                (player_action_test_look_down_begin)
            )
        ) 
            (begin
                (print "look at the bottom light, son.")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3060_gun" (ai_get_object "guns") 1.0)
                (player_training_activate_flashlight "tutorial_look_down")
                (hud_enable_training true)
                (player_training_activate_crouch true)
            )
        )
        (cs_run_command_script "guns" cs_lookat_console_inhibitor)
        (sleep_until 
            (or
                (objects_can_see_object (players) "looker_light_bottom_red" 3.0)
                (player_action_test_look_down_begin)
            ) 
        1)
        (player_action_test_jump false)
        (player_training_activate_crouch false)
        (hud_enable_training false)
        (object_destroy "looker_light_bottom_red")
        (if (not (debug_teleport_player)) 
            (begin
                (begin
                    (set counter_mindread_normal_success (+ counter_mindread_normal_success 1.0))
                    (set counter_mindread_invert_success 0)
                    (print "normal success")
                )
            ) (if (not (map_reset)) 
                (begin
                    (begin
                        (set counter_mindread_invert_success (+ counter_mindread_invert_success 1.0))
                        (set counter_mindread_normal_success 0)
                        (print "invert success")
                    )
                ) (if true 
                    (begin
                        (begin
                            (set counter_mindread_normal_success 0)
                            (set counter_mindread_invert_success 0)
                        )
                    ) )
            )
        )
        (player_action_test_jump false)
        (player_action_test_lookstick_backward)
        (player_action_test_primary_trigger)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3060_gun"))
    )
)

(script static void training_looker_lights_on
    (begin
        (object_destroy "looker_light_left_green")
        (object_create "looker_light_left_red")
        (set mark_looker_light_left true)
        (object_destroy "looker_light_right_green")
        (object_create "looker_light_right_red")
        (set mark_looker_light_right true)
        (object_destroy "looker_light_top_green")
        (object_create "looker_light_top_red")
        (set mark_looker_light_top true)
        (object_destroy "looker_light_bottom_green")
        (object_create "looker_light_bottom_red")
        (set mark_looker_light_bottom true)
    )
)

(script static void training_looker_lights_off
    (begin
        (object_destroy "looker_light_left_green")
        (object_destroy "looker_light_left_red")
        (object_destroy "looker_light_right_green")
        (object_destroy "looker_light_right_red")
        (object_destroy "looker_light_top_green")
        (object_destroy "looker_light_top_red")
        (object_destroy "looker_light_bottom_green")
        (object_destroy "looker_light_bottom_red")
    )
)

(script static boolean test_all_lights_off
    (begin
        (not 
            (or
                mark_looker_light_left
                mark_looker_light_right
                mark_looker_light_top
                mark_looker_light_bottom
            )
        )
    )
)

(script static boolean training_pitch_choose
    (begin
        (if (<= counter_training_pitch_choose 2) 
            (begin
                (training_looker_lights_on)
                (prompt_looker_start)
                (sleep_until 
                    (if (test_all_lights_off) 
                        (begin
                            true
                        ) (if (objects_can_see_object (players) "looker_light_left_red" 5.0) 
                            (begin
                                (begin
                                    (object_destroy "looker_light_left_red")
                                    (object_create_anew "looker_light_left_green")
                                    (set mark_looker_light_left false)
                                )
                            ) (if (objects_can_see_object (players) "looker_light_right_red" 5.0) 
                                (begin
                                    (begin
                                        (object_destroy "looker_light_right_red")
                                        (object_create_anew "looker_light_right_green")
                                        (set mark_looker_light_right false)
                                    )
                                ) (if (objects_can_see_object (players) "looker_light_top_red" 5.0) 
                                    (begin
                                        (begin
                                            (object_destroy "looker_light_top_red")
                                            (object_create_anew "looker_light_top_green")
                                            (set mark_looker_light_top false)
                                        )
                                    ) (if (objects_can_see_object (players) "looker_light_bottom_red" 5.0) 
                                        (begin
                                            (begin
                                                (object_destroy "looker_light_bottom_red")
                                                (object_create_anew "looker_light_bottom_green")
                                                (set mark_looker_light_bottom false)
                                            )
                                        ) (if (> timer_prompt_looker 0) 
                                            (begin
                                                (begin
                                                    (set timer_prompt_looker (- timer_prompt_looker 1.0))
                                                    false
                                                )
                                            ) (if true 
                                                (begin
                                                    (prompt_looker)
                                                ) false)
                                        )
                                    )
                                )
                            )
                        )
                    ) 
                1)
            )
        )
        (set counter_training_pitch_choose (+ counter_training_pitch_choose 1.0))
        (if (user_interface_controller_get_last_level_played) 
            (begin
                (print "should i leave it inverted, or put it back to normal?")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1450_gun" (ai_get_object "guns") 1.0)
                (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1450_gun"))
                (print "press a to leave lookstick inverted, press b to try it normal.")
                (player_training_activate_flashlight "tutorial_choose_invert")
            ) (begin
                (print "should i leave it normal, or put it back to inverted?")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1470_gun" (ai_get_object "guns") 1.0)
                (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1470_gun"))
                (print "press a to leave lookstick normal, press b to try it inverted.")
                (player_training_activate_flashlight "tutorial_choose_normal")
            )
        )
        (hud_enable_training true)
        (player_training_activate_crouch true)
        (player_action_test_primary_trigger)
        (sleep_until 
            (or
                (player_action_test_look_relative_up)
                (player_action_test_look_relative_down)
            ) 
        1)
        (player_training_activate_crouch false)
        (hud_enable_training false)
        (if (player_action_test_look_relative_up) 
            true (begin
                (controller_unlock_solo_levels (not (user_interface_controller_get_last_level_played)))
                (if (user_interface_controller_get_last_level_played) 
                    (begin
                        (cs_run_command_script "guns" cs_lookat_console_inhibitor)
                        (sleep 15)
                        (print "ok, now it's inverted.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1480_gun" (ai_get_object "guns") 1.0)
                        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1480_gun"))
                    ) (begin
                        (cs_run_command_script "guns" cs_lookat_console_inhibitor)
                        (sleep 15)
                        (print "ok, now it's back to normal.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1460_gun" (ai_get_object "guns") 1.0)
                        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1460_gun"))
                    )
                )
                false
            )
        )
    )
)

(script static void training_pitch
    (begin
        (if (>= counter_mindread_normal_success counter_mindread_invert_success) 
            (controller_unlock_solo_levels false) (controller_unlock_solo_levels true))
        (print "tracking looks sketchy, i'm going to run you through the full diagnostic.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3100_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3100_gun"))
        (if (user_interface_controller_get_last_level_played) 
            (begin
                (print "the diagnostic software set your targeting system to be inverted")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3130_gun" (ai_get_object "guns") 1.0)
                (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3130_gun"))
            ) (begin
                (print "the diagnostic software set your targeting system to be normal")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3120_gun" (ai_get_object "guns") 1.0)
                (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3120_gun"))
            )
        )
        (sleep_until (training_pitch_choose) 1)
        (if (user_interface_controller_get_last_level_played) 
            (begin
                (cs_run_command_script "guns" cs_lookat_console_inhibitor)
                (sleep 15)
                (player_training_activate_flashlight "tutorial_set_invert")
                (hud_enable_training true)
                (player_training_activate_crouch true)
                (print "i'll leave your targeting set to inverted.")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1570_gun" (ai_get_object "guns") 1.0)
                (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1570_gun"))
            ) (begin
                (cs_run_command_script "guns" cs_lookat_console_inhibitor)
                (sleep 15)
                (player_training_activate_flashlight "tutorial_set_normal")
                (hud_enable_training true)
                (player_training_activate_crouch true)
                (print "i'll leave your targeting set to normal.")
                (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1560_gun" (ai_get_object "guns") 1.0)
                (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1560_gun"))
            )
        )
        (print "if you change your mind, you can switch the setting anytime.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1580_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1580_gun"))
        (player_training_activate_crouch false)
        (hud_enable_training false)
    )
)

(script static void training_look
    (begin
        (print "well...  i guess it was all obsolete anyway.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0600_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0600_gun"))
        (custom_animation (ai_get_unit "guns") "objects\characters\marine\tutorial\tutorial" "l01_0610_jon" true)
        (sleep 15)
        (print "your new suit is a mark vi, sent up from songnam this morning.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0610_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0610_gun"))
        (print "try to take it easy until you get used to it.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0620_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0620_gun"))
        (cs_run_command_script "guns" cs_lookat_console_inhibitor)
        (sleep 30)
        (print "ok.  let's test your targeting, first thing.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0630_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0630_gun"))
        (input_suppress_vibration 0)
        (print "please look at the top light.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3000_gun" (ai_get_object "guns") 1.0)
        (test_mindread_up)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3000_gun"))
        (print "good.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0650_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0650_gun"))
        (print "now look at the bottom light.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3010_gun" (ai_get_object "guns") 1.0)
        (test_mindread_down)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3010_gun"))
        (print "allright")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0670_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0670_gun"))
        (print "look at the top light again.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3020_gun" (ai_get_object "guns") 1.0)
        (test_mindread_up)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3020_gun"))
        (print "that's it…")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0760_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0760_gun"))
        (print "now the bottom one.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3030_gun" (ai_get_object "guns") 1.0)
        (test_mindread_down)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3030_gun"))
        (print "ok.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0740_gun" (ai_get_object "guns") 1.0)
        (sleep 30)
        (player_action_test_jump true)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0740_gun"))
        (if (>= counter_mindread_normal_success 2) 
            (begin
                (begin
                    (sleep 30)
                    (print "everything checks out.")
                    (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0770_gun" (ai_get_object "guns") 1.0)
                    (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0770_gun"))
                    (controller_unlock_solo_levels false)
                )
            ) (if (>= counter_mindread_invert_success 2) 
                (begin
                    (begin
                        (sleep 30)
                        (print "everything checks out.")
                        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0770_gun" (ai_get_object "guns") 1.0)
                        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0770_gun"))
                        (controller_unlock_solo_levels true)
                    )
                ) (if true 
                    (begin
                        (training_pitch)
                    ) )
            )
        )
        (training_looker_lights_off)
    )
)

(script static void training_move
    (begin
        (print "stand-by. i'm going to offline the inhibitors…")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0790_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0790_gun"))
        (device_set_position "inhibitor" 1.0)
        (player_active_camouflage_on false)
        (player_training_activate_crouch true)
        (cs_run_command_script "guns" cs_lookat_console_inhibitor)
        (sleep 30)
        (custom_animation (ai_get_unit "guns") "objects\characters\marine\tutorial\tutorial" "l01_0800_jon" true)
        (sleep 10)
        (print "move around a little, get a feel for it.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0800_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0800_gun"))
        (print "when you're ready, come and meet me by the zapper.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0810_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0810_gun"))
        (cs_run_command_script "guns" cs_guns_zapper_halfway)
        (set timer_prompt_start_spot (+ timer_prompt_start_spot delay_prompt_short))
        (sleep_until 
            (begin
                (if (not (volume_test_objects "tv_start_spot" (players))) 
                    (begin
                        true
                    ) (if (> timer_prompt_start_spot 0) 
                        (begin
                            (begin
                                (set timer_prompt_start_spot (- timer_prompt_start_spot 1.0))
                                false
                            )
                        ) (if true 
                            (begin
                                (prompt_start_spot)
                            ) false)
                    )
                )
            ) 
        1)
        (hud_enable_training false)
        (cs_run_command_script "guns" cs_guns_zapper_wait)
    )
)

(script static void training_shield
    (begin
        (sleep_until 
            (begin
                (if (< (objects_distance_to_flag (players) "zapper_flag") 2.5) 
                    (begin
                        true
                    ) (if (> timer_prompt_careful 0) 
                        (begin
                            (begin
                                (set timer_prompt_careful (- timer_prompt_careful 1.0))
                                false
                            )
                        ) (if (game_all_quiet) 
                            (begin
                                false
                            ) (if true 
                                (begin
                                    (begin
                                        (sleep 30)
                                        (if (not (game_all_quiet)) 
                                            (prompt_careful))
                                    )
                                ) false)
                        )
                    )
                )
            ) 
        1)
        (sleep_until (< (objects_distance_to_flag (ai_get_object "guns") "zapper_flag") 1.5) 1)
        (sleep_until (< (objects_distance_to_object (players) (ai_get_object "guns")) 2.5) 1)
        (unit_set_emotional_state (ai_get_unit "guns") "inquisitive" 0.0 1)
        (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.0 1)
        (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.0 1)
        (print "pay attention because i'm only going to over this once.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3150_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3150_gun"))
        (print "this station will test your recharging energy shields")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3140_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3140_gun"))
        (cs_run_command_script "guns" cs_guns_zapper)
        (sleep_until 
            (begin
                (if (= (device_group_get "zapper_control_group") 1.0) 
                    (begin
                        true
                    ) (if (> (objects_distance_to_object (players) (ai_get_object "guns")) 2.5) 
                        (begin
                            false
                        ) (if (> timer_prompt_zapper 0) 
                            (begin
                                (begin
                                    (set timer_prompt_zapper (- timer_prompt_zapper 1.0))
                                    false
                                )
                            ) (if (> timer_prompt_zapper_lookatme 0) 
                                (begin
                                    (begin
                                        (set timer_prompt_zapper_lookatme (- timer_prompt_zapper_lookatme 1.0))
                                        (set timer_prompt_zapper_getin (- timer_prompt_zapper_getin 1.0))
                                        (set timer_prompt_zapper_button (- timer_prompt_zapper_button 1.0))
                                        (if (objects_can_see_object (player0) (ai_get_object "guns") 40.0) 
                                            (begin
                                                (sleep 15)
                                                (set timer_prompt_zapper_lookatme 0)
                                            )
                                        )
                                        false
                                    )
                                ) (if (> timer_prompt_zapper_getin 0) 
                                    (begin
                                        (begin
                                            (set timer_prompt_zapper_lookatme (- timer_prompt_zapper_lookatme 1.0))
                                            (set timer_prompt_zapper_getin (- timer_prompt_zapper_getin 1.0))
                                            (set timer_prompt_zapper_button (- timer_prompt_zapper_button 1.0))
                                            (if (volume_test_objects "tv_zapper" (players)) 
                                                (begin
                                                    (sleep 15)
                                                    (set timer_prompt_zapper_getin 0)
                                                )
                                            )
                                            false
                                        )
                                    ) (if (> timer_prompt_zapper_button 0) 
                                        (begin
                                            (begin
                                                (set timer_prompt_zapper_button (- timer_prompt_zapper_button 1.0))
                                                (set timer_prompt_zapper_getin (- timer_prompt_zapper_getin 1.0))
                                                (set timer_prompt_zapper_button (- timer_prompt_zapper_button 1.0))
                                                (if (= (device_group_get "zapper_control_group") 1.0) 
                                                    (begin
                                                        (sleep 15)
                                                        (set timer_prompt_zapper_button 0)
                                                    )
                                                )
                                                false
                                            )
                                        ) (if (not (objects_can_see_object (player0) (ai_get_object "guns") 40.0)) 
                                            (begin
                                                (prompt_zapper_lookatme)
                                            ) (if (not (volume_test_objects "tv_zapper" (players))) 
                                                (begin
                                                    (prompt_zapper_getin)
                                                ) (if true 
                                                    (begin
                                                        (prompt_zapper_button)
                                                    ) false)
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            ) 
        1)
        (update_remote_camera 2)
        (device_set_power "zapper" 1.0)
        (device_set_power "zapper_cage" 1.0)
        (hud_enable_training false)
        (unit_set_maximum_vitality (player0) 30.0 70.0)
        (cs_run_command_script "guns" cs_lookat_console_zapper)
        (sleep 90)
        (cs_run_command_script "guns" cs_lookat_console_zapper)
        (sleep 15)
        (unit_set_current_vitality (player0) 30.0 0.0)
        (sleep 15)
        (print "bingo!")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0940_gun" (ai_get_object "guns") 1.0)
        (sleep 30)
        (cs_run_command_script "guns" cs_lookat_console_zapper)
        (print "as you can see, they re-charge a lot faster.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0950_gun" (ai_get_object "guns") 1.0)
        (sleep 45)
        (ai_place "johnson")
        (ai_cannot_die "johnson" true)
        (cs_run_command_script "johnson" cs_johnson_elevator)
        (device_set_position "door_elevator_tram_bot" 1.0)
        (sleep_until (= (device_get_position "door_elevator_tram_bot") 1.0) 1)
        (cs_run_command_script "johnson" cs_johnson_start)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0950_gun"))
        (sleep 60)
        (device_set_power "zapper" 0.0)
        (device_set_power "zapper_cage" 0.0)
        (sleep 30)
        (custom_animation (ai_get_unit "guns") "objects\characters\marine\tutorial\tutorial" "l01_0960_jon" true)
        (print "if your shields go down, find some cover, wait for the meter to read fully-charged.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0960_gun" (ai_get_object "guns") 1.0)
        (sleep 45)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0960_gun"))
        (print "that, or he can just hide behind me.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0970_jon" (ai_get_object "johnson") 1.0)
        (sleep 30)
        (cs_run_command_script "guns" cs_lookat_johnson)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0970_jon"))
        (sleep 15)
        (cs_run_command_script "johnson" cs_johnson_glanceat_guns)
        (sleep_until (objects_can_see_object (player0) (ai_get_object "johnson") 40.0) 1 90)
        (unit_set_emotional_state (ai_get_unit "johnson") "inquisitive" 0.5 1)
        (print "you done with my boy here? i don't see any training-wheels…")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1000_jon" (ai_get_object "johnson") 1.0)
        (sleep (- (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1000_jon") 90.0))
        (cs_run_command_script "johnson" cs_lookat_player)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1000_jon"))
        (print "his armor's working fine.")
        (unit_set_emotional_state (ai_get_unit "guns") "annoyed" 0.5 1)
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1010_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1010_gun"))
        (sleep 15)
        (unit_set_emotional_state (ai_get_unit "johnson") "inquisitive" 0.0 1)
        (cs_run_command_script "guns" cs_lookat_player)
        (sleep_until (objects_can_see_object (player0) (ai_get_object "guns") 40.0) 1 90)
        (print "you're free to go, son.  just remember: take things slow.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0980_gun" (ai_get_object "guns") 1.0)
        (sleep (- (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0980_gun") 60.0))
        (cs_run_command_script "johnson" cs_lookat_player)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0980_gun"))
    )
)

(script dormant void training_done_tram
    (begin
        (ai_place "atr1_mar")
        (ai_place "mid_mar")
        (device_set_position_immediate "door_tram_2" 1.0)
        (sleep_until (>= (device_get_position "tram") 0.25) 1)
        (device_set_position "door_tram_2" 0.0)
        (sleep 30)
        (ai_erase "atr1_mar")
        (sleep_until (>= (device_get_position "tram") 0.45) 1)
        (device_set_position "door_tram_3" 1.0)
        (ai_place "atr2_mar")
        (sleep_until (>= (device_get_position "tram") 0.55) 1)
        (device_set_position "door_tram_3" 0.0)
        (sleep 30)
        (ai_erase "mid_mar")
        (sleep_until (>= (device_get_position "tram") 0.75) 1)
        (device_set_position "door_tram_4" 1.0)
        (object_create_anew "tram_marine_1")
        (object_create_anew "tram_marine_2")
        (object_create_anew "tram_marine_3")
        (object_create_anew "tram_marine_4")
        (object_create_anew "tram_marine_5")
        (object_create_anew "tram_marine_6")
        (object_create_anew "tram_marine_7")
        (custom_animation_loop "tram_marine_1" "objects\characters\marine\x02\x02" "marine_whistle_loop" false)
        (custom_animation_loop "tram_marine_2" "objects\characters\marine\x02\x02" "marine_fist_loop" false)
        (custom_animation_loop "tram_marine_3" "objects\characters\marine\x02\x02" "marine_clapping_loop" false)
        (sleep 5)
        (custom_animation_loop "tram_marine_6" "objects\characters\marine\x02\x02" "marine_whistle_loop" false)
        (custom_animation_loop "tram_marine_5" "objects\characters\marine\x02\x02" "marine_fist_loop" false)
        (custom_animation_loop "tram_marine_4" "objects\characters\marine\x02\x02" "marine_clapping_loop" false)
        (sleep 5)
        (custom_animation_loop "tram_marine_7" "objects\characters\marine\x02\x02" "marine_whistle_loop" false)
        (sleep_until (>= (device_get_position "tram") 0.9) 1)
        (device_set_position "door_tram_4" 0.0)
        (sleep 30)
        (ai_erase "atr2_mar")
    )
)

(script static void training_done
    (begin
        (device_set_position_immediate "tram" 0.0)
        (cs_run_command_script "johnson" cs_lookat_guns)
        (print "don't worry, i'll hold his hand.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1040_jon" (ai_get_object "johnson") 1.0)
        (sleep (- (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1040_jon") 30.0))
        (cs_run_command_script "johnson" cs_johnson_elevator)
        (sleep 15)
        (cs_run_command_script "guns" cs_guns_elevator)
        (sleep 15)
        (sleep_until (volume_test_objects_all "tv_elevator_tram_bot" (ai_get_object "johnson")) 1 (* 30.0 30.0))
        (if (not (volume_test_objects_all "tv_elevator_tram_bot" (ai_get_object "johnson"))) 
            (object_teleport (ai_get_object "johnson") "tram_flag"))
        (sleep_until 
            (if (volume_test_objects_all "tv_elevator_tram_bot" (players)) 
                (begin
                    true
                ) (if (> timer_prompt_elevator_plr 0) 
                    (begin
                        (begin
                            (set timer_prompt_elevator_plr (- timer_prompt_elevator_plr 1.0))
                            false
                        )
                    ) (if true 
                        (begin
                            (prompt_elevator_plr)
                        ) false)
                )
            ) 
        1)
        (update_remote_camera 3)
        (object_create "wall_elevator_tram_bot")
        (set mark_training_done true)
        (sleep_until (< (objects_distance_to_flag (ai_get_object "guns") "tram_flag") 2.5) 1 210)
        (cs_run_command_script "johnson" cs_johnson_elevator_face_guns)
        (print "so johnson, when you gonna tell me how you made it back home in one piece?")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3360_gun" (ai_get_object "guns") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_3360_gun"))
        (print "sorry, guns.  it's classified.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0990_jon" (ai_get_object "johnson") 1.0)
        (sleep (- (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0990_jon") 0.0))
        (unit_set_emotional_state (ai_get_unit "guns") "angry" 0.5 1)
        (sleep 5)
        (print "(humphs) my ass! well you can forget about those adjustments to your a2's scope! and you're sure as hell not getting one of the new m7s!")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_3370_gun" (ai_get_object "guns") 1.0)
        (sleep 30)
        (sleep (random_range 25 75))
        (device_set_position "elevator_tram" 1.0)
        (device_set_position "door_elevator_tram_bot" 0.0)
        (sleep_until (= (device_get_position "door_elevator_tram_bot") 0.0) 1)
        (sound_looping_predict "sound\dialog\levels\01_spacestation\mission\l01_3370_gun")
        (sleep 10)
        (print "well he's in a particularly fine mood. maybe lord hood forgot to give him an invitation.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_1810_jon" (ai_get_object "johnson") 1.0)
    )
)

(script static void training_tram
    (begin
        (wake training_done_tram)
        (sleep_until (= (device_get_position "elevator_tram") 1.0) 1)
        (input_suppress_vibration 4)
        (cs_run_command_script "johnson" cs_johnson_tram)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1810_jon"))
        (sleep_until 
            (and
                (volume_test_objects_all "tv_tram" (players))
                (volume_test_objects "tv_tram" (ai_get_object "johnson"))
            ) 
        1)
        (object_destroy_containing "wall_platform")
        (object_create "wall_tram")
        (sleep_until (not (cs_command_script_running "johnson" cs_johnson_tram)) 1 150)
        (update_remote_camera 4)
        (custom_animation (ai_get_unit "johnson") "objects\characters\marine\tutorial\tutorial" "l01_0010_jon" true)
        (sleep 10)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_1810_jon"))
        (print "earth. haven't seen it in years.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0010_jon" (ai_get_object "johnson") 1.0)
        (sleep (- (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0010_jon") 30.0))
        (sound_looping_stop_immediately "scenarios\solo\01a_tutorial\01a_music\01a_01" none 1.0)
        (device_set_position "elevator_tram" 0.0)
        (device_set_position "tram" 1.0)
        (sleep_until (>= (device_get_position "tram") 0.08) 1)
        (sleep 30)
        (custom_animation (ai_get_unit "johnson") "objects\characters\marine\tutorial\tutorial" "l01_0020_jon" true)
        (print "when i shipped out for basic, the orbital defense grid was all theory and politics.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0020_jon" (ai_get_object "johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0020_jon"))
        (sleep_until (>= (device_get_position "tram") 0.175) 1)
        (cs_run_command_script "johnson" cs_lookat_macgun)
        (print "now look. the cairo is just one of three-hundred geo-sync platforms.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0021_jon" (ai_get_object "johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0021_jon"))
        (sleep_until (>= (device_get_position "tram") 0.275) 1)
        (custom_animation (ai_get_unit "johnson") "objects\characters\marine\tutorial\tutorial" "l01_0030_jon" true)
        (sleep 10)
        (print "that mac-gun can put a round clean through a covenant capital-ship.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0030_jon" (ai_get_object "johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0030_jon"))
        (sleep_until (>= (device_get_position "tram") 0.415) 1)
        (cs_run_command_script "johnson" cs_lookat_malta)
        (sleep 45)
        (sleep 45)
        (custom_animation (ai_get_unit "johnson") "objects\characters\marine\tutorial\tutorial" "l01_0040_jon" true)
        (print "with coordinated fire from the athens and the malta, nothing's getting past this battle-cluster in one piece.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0040_jon" (ai_get_object "johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0040_jon"))
        (sleep 15)
        (sleep_until (>= (device_get_position "tram") 0.7) 1)
        (custom_animation (ai_get_unit "johnson") "objects\characters\marine\tutorial\tutorial" "l01_0050_jon" true)
        (print "ships have been arriving all morning.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0050_jon" (ai_get_object "johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0050_jon"))
        (sound_looping_set_scale "scenarios\solo\01a_tutorial\01a_music\01a_01")
        (sleep_until (>= (device_get_position "tram") 0.75) 1)
        (sleep 30)
        (custom_animation (ai_get_unit "johnson") "objects\characters\marine\tutorial\tutorial" "l01_0051_jon" true)
        (print "nobody's saying much, but i'll bet something big's about to happen.")
        (sound_impulse_start_effect "sound\dialog\levels\01_spacestation\mission\l01_0051_jon" (ai_get_object "johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\01_spacestation\mission\l01_0051_jon"))
        (cs_run_command_script "johnson" cs_johnson_lookat_station)
        (sleep_until (>= (device_get_position "tram") 0.975) 1)
        (sleep 30)
        (cs_run_command_script "johnson" cs_johnson_station)
        (sleep_until (not (volume_test_objects_all "tv_station" (players))) 1 150)
    )
)

(script static void start_mission
    (begin
        (sleep 10)
        (print "01a tutorial")
        (print "designer - jaime")
        (print "env. artists - paul, dave")
    )
)

(script dormant void training_fade
    (begin
        (player_active_camouflage_on true)
        (player_action_test_jump false)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script startup void mission_01a
    (begin
        (player_active_camouflage_on true)
        (player_action_test_jump false)
        (if (game_can_use_flashlights) 
            (game_revert))
        (objectives_finish_up_to)
        (ai_allegiance player human)
        (cinematic_stop 1.0 1.0 1.0 0)
        (player_training_activate_crouch false)
        (ai_dialogue_enable false)
        (start_mission)
        (training_setup)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (objects_predict_high (ai_get_object "guns"))
        (sleep 2)
        (cinematic_fade_from_white_bars)
        (wake training_fade)
        (training_look)
        (player_training_activate_crouch true)
        (training_move)
        (training_shield)
        (save_tram_start)
        (training_done)
        (training_tram)
        (print "you win!")
        (sound_class_enable_ducker "" 0.0 15)
        (rasterizer_debug_crap_pixel_shader)
        (player_training_activate_crouch true)
        (ai_dialogue_enable true)
        (game_revert)
    )
)

