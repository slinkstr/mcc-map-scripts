; Decompiled with Blamite
; Source file: 08b_deltacontrol.hsc
; Start time: 4/7/2022 7:16:57
; Decompilation finished in ~0.0046803s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global boolean blam false)
(global short tick_seconds (game_tick_length))
(global short timer_boss_tartarus_recharge 0)
(global short timer_boss_johnson_fire 0)
(global boolean boss_tartarus_invincible false)
(global short count_boss_cycle 1)
(global short counter_boss_johnson_prompt 0)
(global short skip_boss_johnson_prompt 1)
(global boolean boss_tartarus_berserk false)
(global short timer_boss_tartarus_berserk 0)
(global short counter_boss_tartarus_taunt 0)
(global boolean mark_boss_first_cycle true)
(global short timer_boss_reenforcements 0)
(global short boss_random_reenforcements 0)
(global boolean boss_respawn_brutes false)
(global boolean boss_respawn_elites false)
(global boolean boss_flavor_done false)
(global short sound_offset 15)
(global short prediction_offset 45)
(global boolean g_mission_over false)
(global short 15_seconds 450)
(global short 30_seconds 900)
(global short 45_seconds 900)
(global short one_minute 1800)
(global short two_minutes 3600)
(global unit g_cov_commander none)
(global real g_scarab_interpolation 0.25)
(global boolean g_e13_started false)
(global boolean g_e12_started false)
(global boolean g_e12_pro_inf0_1_berserk false)
(global boolean g_e11_started false)
(global boolean g_e11_door_open false)
(global boolean g_e11_door_should_open false)
(global boolean g_e11_player_warned false)
(global boolean g_e11_player_saw_door false)
(global short g_e11_shot_counter 0)
(global boolean g_e9_started false)
(global boolean g_e9_pro_phantom0_unloaded false)
(global boolean g_e9_pro_phantom0_retreating false)
(global boolean g_e9_pro_phantom1_retreating false)
(global boolean g_e9_scarab_started false)
(global boolean g_e9_scarab_near_first_bend false)
(global boolean g_e9_scarab_near_second_bend false)
(global boolean g_e9_scarab_at_second_bend false)
(global boolean g_e9_scarab_stepping_down false)
(global boolean g_e8_started false)
(global boolean g_e8_cov_banshees0_greeted false)
(global short g_e8_mars_inf0_living_count 3)
(global short g_e8_target_wraith -1)
(global boolean g_e7_started false)
(global boolean g_e7_mars_johnson_go false)
(global boolean g_e7_mars_johnson_aboard false)
(global boolean g_e7_pro_captain_done false)
(global boolean g_e7_pro_sentry_alerted false)
(global short g_e7_mars_living_count 0)
(global boolean g_e6_started false)
(global boolean g_e5_started false)
(global short g_e5_pro_inf2_limit 7)
(global boolean g_e4_started false)
(global boolean g_e3_started false)
(global boolean g_e3_hunters_rise false)
(global boolean g_e3_hunter0_go false)
(global boolean g_e3_hunter1_go false)
(global boolean g_e3_hunter0_arrived false)
(global boolean g_e3_hunter1_arrived false)
(global boolean g_e2_started false)
(global boolean g_e1_started false)
(global short g_e1_ghosts_weak 1)
(global short g_e1_ghosts_strong 3)
(global short g_e1_ghosts_per_leg 10)


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

(script command_script void cs_boss_brutes_stunned
    (begin
        (cs_force_combat_status 4)
        (cs_enable_moving false)
        (cs_pause 1.0)
        (cs_abort_on_damage true)
        (cs_pause 1.0)
    )
)

(script command_script void cs_boss_tartarus_stunned
    (begin
        (cs_force_combat_status 4)
        (cs_enable_moving false)
        (sleep_forever)
    )
)

(script command_script void cs_boss_tartarus_jump
    (begin
        (cs_force_combat_status 4)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to boss/mid_land)
        (cs_face_player true)
    )
)

(script command_script void cs_boss_tartarus_cheer
    (begin
        (cs_enable_moving false)
        (cs_enable_targeting false)
        (cs_face_player true)
        (sleep 60)
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\brute\brute" "combat:rifle:cheer" true)
        (sleep 60)
    )
)

(script command_script void cs_boss_tartarus_taunt
    (begin
        (cs_enable_moving false)
        (cs_enable_targeting false)
        (cs_face_player true)
        (sleep 60)
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\brute\brute" "combat:rifle:taunt" true)
        (sleep 60)
    )
)

(script command_script void cs_boss_tartarus_shakefist
    (begin
        (cs_enable_moving false)
        (cs_enable_targeting false)
        (cs_face_player true)
        (sleep 60)
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\brute\brute" "combat:rifle:shakefist" true)
        (sleep 60)
    )
)

(script command_script void cs_boss_johnson_idle
    (begin
        (cs_force_combat_status 4)
        (cs_enable_moving false)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to boss/ledge_perch)
        (cs_crouch true)
        (cs_face_object true (ai_get_object "boss_tartarus"))
        (cs_aim_object true (ai_get_object "boss_tartarus"))
        (print "johnson idle")
        (sleep_forever)
    )
)

(script command_script void cs_boss_johnson_idle2
    (begin
        (cs_force_combat_status 4)
        (cs_enable_moving false)
        (cs_crouch true)
        (cs_face_object true (ai_get_object "boss_tartarus"))
        (cs_aim_object true (ai_get_object "boss_tartarus"))
        (print "johnson idle2")
        (sleep_forever)
    )
)

(script command_script void cs_boss_johnson_shoot
    (begin
        (cs_force_combat_status 4)
        (cs_enable_moving false)
        (cs_crouch true)
        (cs_face_object true (ai_get_object "boss_tartarus"))
        (cs_aim_object true (ai_get_object "boss_tartarus"))
        (cs_shoot true (ai_get_object "boss_tartarus"))
        (print "shot 1")
        (sleep 5)
        (cs_shoot false (ai_get_object "boss_tartarus"))
        (sleep 11)
        (cs_shoot true (ai_get_object "boss_tartarus"))
        (print "shot 2")
        (sleep 5)
        (cs_shoot false (ai_get_object "boss_tartarus"))
        (sleep 11)
        (cs_shoot true (ai_get_object "boss_tartarus"))
        (print "shot 3")
        (sleep 15)
    )
)

(script command_script void cs_boss_miranda_nocrouch
    (begin
        (cs_crouch false)
        (sleep_forever)
    )
)

(script static void boss_tartarus_taunt
    (begin
        (if (= counter_boss_tartarus_taunt 0) 
            (begin
                (begin
                    (print "what? is the mighty arbiter afraid?!")
                    (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_0980_tar" (ai_get_object "boss_tartarus") 1.0)
                )
            ) (if (= counter_boss_tartarus_taunt 1) 
                (begin
                    (begin
                        (print "you want revenge?! well here i am! come and take it!")
                        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_0990_tar" (ai_get_object "boss_tartarus") 1.0)
                    )
                ) (if (= counter_boss_tartarus_taunt 2) 
                    (begin
                        (begin
                            (print "just like the rest of your kind - you are cowardly and weak!")
                            (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1000_tar" (ai_get_object "boss_tartarus") 1.0)
                        )
                    ) (if true 
                        (begin
                            (set counter_boss_tartarus_taunt 0)
                        ) )
                )
            )
        )
        (set counter_boss_tartarus_taunt (+ counter_boss_tartarus_taunt 1.0))
    )
)

(script static void boss_johnson_prompt
    (begin
        (sleep 45)
        (if (= counter_boss_johnson_prompt (* 1.0 skip_boss_johnson_prompt)) 
            (begin
                (begin
                    (print "hey, mohawk! how'd that feel?!")
                    (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_2010_jon" (ai_get_object "boss_johnson") 1.0)
                )
            ) (if (= counter_boss_johnson_prompt (* 2.0 skip_boss_johnson_prompt)) 
                (begin
                    (begin
                        (print "his shield is down! let him have it!")
                        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_2020_jon" (ai_get_object "boss_johnson") 1.0)
                    )
                ) (if (= counter_boss_johnson_prompt (* 3.0 skip_boss_johnson_prompt)) 
                    (begin
                        (begin
                            (print "there goes his shield!")
                            (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_2030_jon" (ai_get_object "boss_johnson") 1.0)
                        )
                    ) (if (= counter_boss_johnson_prompt (* 4.0 skip_boss_johnson_prompt)) 
                        (begin
                            (begin
                                (print "got his shield! hit him now!")
                                (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_2040_jon" (ai_get_object "boss_johnson") 1.0)
                            )
                        ) (if (= counter_boss_johnson_prompt (* 5.0 skip_boss_johnson_prompt)) 
                            (begin
                                (begin
                                    (print "quick! while his shield is down!")
                                    (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_2050_jon" (ai_get_object "boss_johnson") 1.0)
                                )
                            ) (if (= counter_boss_johnson_prompt (* 6.0 skip_boss_johnson_prompt)) 
                                (begin
                                    (begin
                                        (print "i can keep his shield down, but you're gonna have to finish the job!")
                                        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_2060_jon" (ai_get_object "boss_johnson") 1.0)
                                    )
                                ) (if (> counter_boss_johnson_prompt (* 8.0 skip_boss_johnson_prompt)) 
                                    (begin
                                        (begin
                                            (set counter_boss_johnson_prompt 0)
                                            (set skip_boss_johnson_prompt (+ skip_boss_johnson_prompt 1.0))
                                        )
                                    ) )
                            )
                        )
                    )
                )
            )
        )
        (set counter_boss_johnson_prompt (+ counter_boss_johnson_prompt 1.0))
    )
)

(script dormant void boss_flavor
    (begin
        (sleep (* 5.0 30.0))
        (sound_looping_stop_immediately "sound\ambience\deltacontolroom\boss\stage1" none 1.0)
        (sleep (* 5.0 30.0))
        (print "charging sequence initiated! primary generators coming on-line!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1040_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1040_gsp"))
        (print "well, shut them down!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1050_mir" (ai_get_object "boss_miranda") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1050_mir"))
        (print "apology. protocol does allow me to interfere with any aspect of the sequence.")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1060_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1060_gsp"))
        (print "then how do i stop it?!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1120_mir" (ai_get_object "boss_miranda") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1120_mir"))
        (print "well…it will take some time to go over the proper procedures…")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1130_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1130_gsp"))
        (print "quit stalling!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1140_mir" (ai_get_object "boss_miranda") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1140_mir"))
        (print "under more controlled circumstances, i would suggest the reclaimer simply remove the index.")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1150_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1150_gsp"))
        (print "that's it?! johnson, i'm on it!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1160_mir" (ai_get_object "boss_miranda") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1160_mir"))
        (print "hang-tight, ma'am! not until that brute is dead!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1170_jon" (ai_get_object "boss_johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1170_jon"))
        (set boss_flavor_done true)
        (sleep (* 30.0 30.0))
        (set boss_flavor_done false)
        (sound_looping_stop_immediately "sound\ambience\deltacontolroom\boss\stage2" none 1.0)
        (sleep (* 5.0 30.0))
        (print "secondary generators charging! all systems are performing well within operational parameters!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1070_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1070_gsp"))
        (print "you're telling me you can't stop the sequence?")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1080_mir" (ai_get_object "boss_miranda") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1080_mir"))
        (print "reclaimer, please understand: interrupting the wave-generation process will severely damage this installation.")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1090_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1090_gsp"))
        (print "give me a direct answer!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1100_mir" (ai_get_object "boss_miranda") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1100_mir"))
        (print "i am but a monitor. the reclaimer can do what it likes.")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1110_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1110_gsp"))
        (set boss_flavor_done true)
        (sleep (* 30.0 30.0))
        (set boss_flavor_done false)
        (sound_looping_stop_immediately "sound\ambience\deltacontolroom\boss\stage3" none 1.0)
        (sleep (* 5.0 30.0))
        (print "power-generation phase complete! the installation is ready to fire! starting final countdown…")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1180_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1180_gsp"))
        (print "c'mon, arbiter! kick that guy's ass!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1190_jon" (ai_get_object "boss_johnson") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1190_jon"))
        (print "and may i say, reclaimers, it has been a pleasure to serve you both! goodbye!")
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1200_gsp" (ai_get_object "boss_monitor") 1.0)
        (sleep (sound_impulse_start_3d "sound\dialog\levels\08_controlroom\mission\l08_1200_gsp"))
        (set boss_flavor_done true)
    )
)

(script dormant void boss_music
    (begin
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_11" none 1.0)
        (sleep_until (volume_test_objects "tv_boss_platform" (players)))
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_12" none 1.0)
        (sleep_until (not mark_boss_first_cycle))
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_13" none 1.0)
    )
)

(script static short boss_tartarus_rateofrecharge
    (begin
        (if (difficulty_legendary) 
            (begin
                (random_range (* 1.0 tick_seconds) (* 2.0 tick_seconds))
            ) (if (difficulty_heroic) 
                (begin
                    (random_range (* 1.0 tick_seconds) (* 3.0 tick_seconds))
                ) (if true 
                    (begin
                        (random_range (* 2.0 tick_seconds) (* 3.0 tick_seconds))
                    ) 0)
            )
        )
    )
)

(script static short boss_johnson_rateoffire
    (begin
        (if (difficulty_legendary) 
            (begin
                (random_range (* 7.0 tick_seconds) (* 15.0 tick_seconds))
            ) (if (difficulty_heroic) 
                (begin
                    (random_range (* 5.0 tick_seconds) (* 12.0 tick_seconds))
                ) (if true 
                    (begin
                        (random_range (* 4.0 tick_seconds) (* 10.0 tick_seconds))
                    ) 0)
            )
        )
    )
)

(script static short boss_rateofreenforcement
    (begin
        (if (difficulty_legendary) 
            (begin
                (random_range (* 30.0 tick_seconds) (* 60.0 tick_seconds))
            ) (if (difficulty_heroic) 
                (begin
                    (random_range (* 30.0 tick_seconds) (* 60.0 tick_seconds))
                ) (if true 
                    (begin
                        (random_range (* 30.0 tick_seconds) (* 60.0 tick_seconds))
                    ) 0)
            )
        )
    )
)

(script static void boss_tartarus_invincible_on
    (begin
        (object_set_function_variable (ai_get_object "boss_tartarus") "invincibility" 1.0 2.0)
        (object_set_shield (ai_get_object "boss_tartarus") (/ 1.0 1000.0))
        (set boss_tartarus_invincible true)
    )
)

(script static void boss_tartarus_invincible_off
    (begin
        (object_set_function_variable (ai_get_object "boss_tartarus") "invincibility" 0.0 0.1)
        (object_set_shield (ai_get_object "boss_tartarus") (/ 0.0 1000.0))
        (set boss_tartarus_invincible false)
    )
)

(script static void boss_tartarus_berserk_on
    (begin
        (ai_berserk "boss_tartarus" true)
        (set boss_tartarus_berserk true)
        (print "berserk")
    )
)

(script static void boss_tartarus_berserk_off
    (begin
        (ai_berserk "boss_tartarus" false)
        (set boss_tartarus_berserk false)
    )
)

(script static void boss_setup
    (begin
        (structure_bsp_index 3)
        (ai_allegiance player human)
        (ai_allegiance player covenant)
        (ai_allegiance player sentinel)
        (ai_allegiance human covenant)
        (ai_allegiance human sentinel)
        (ai_allegiance covenant human)
        (ai_allegiance covenant sentinel)
        (ai_allegiance prophet sentinel)
        (sleep 1)
        (object_teleport (player0) "boss_player0_flag")
        (object_teleport (player1) "boss_player1_flag")
        (kill_volume_enable "kill_e13_0")
        (device_set_position_immediate "e13_rotors" 0.625)
        (device_operates_automatically_set "e12_door1" false)
        (if (difficulty_legendary) 
            (begin
                (set count_boss_cycle 4)
            ) (if (difficulty_heroic) 
                (begin
                    (set count_boss_cycle 3)
                ) (if true 
                    (begin
                        (set count_boss_cycle 2)
                    ) )
            )
        )
        (if (difficulty_legendary) 
            (begin
                (set skip_boss_johnson_prompt 6)
            ) (if (difficulty_heroic) 
                (begin
                    (set skip_boss_johnson_prompt 3)
                ) (if true 
                    (begin
                        (set skip_boss_johnson_prompt 1)
                    ) )
            )
        )
        (ai_place "boss_tartarus")
        (unit_impervious (ai_get_object "boss_tartarus") true)
        (ai_cannot_die "boss_tartarus" true)
        (unit_only_takes_damage_from_players_team (ai_get_unit "boss_tartarus") true)
        (object_set_scale (ai_get_object "boss_tartarus") 1.15 0)
        (boss_tartarus_invincible_on)
        (if (difficulty_legendary) 
            (begin
                (unit_set_maximum_vitality (ai_get_unit "boss_tartarus") 400.0 1000.0)
            ) (if (difficulty_heroic) 
                (begin
                    (unit_set_maximum_vitality (ai_get_unit "boss_tartarus") 350.0 1000.0)
                ) (if true 
                    (begin
                        (unit_set_maximum_vitality (ai_get_unit "boss_tartarus") 300.0 1000.0)
                    ) )
            )
        )
        (unit_set_current_vitality (ai_get_unit "boss_tartarus") 50.0 1000.0)
        (cs_run_command_script "boss_tartarus" cs_boss_tartarus_stunned)
        (ai_place "boss_miranda")
        (unit_impervious (ai_actors "boss_miranda") true)
        (object_cannot_die (ai_get_object "boss_miranda") true)
        (cs_run_command_script "boss_miranda" cs_boss_miranda_nocrouch)
        (ai_disregard (ai_get_object "boss_miranda") true)
        (ai_place "boss_monitor")
        (ai_cannot_die "boss_monitor" true)
        (ai_disregard (ai_get_object "boss_monitor") true)
        (ai_place "boss_johnson")
        (unit_impervious (ai_actors "boss_johnson") true)
        (object_cannot_die (ai_get_object "boss_johnson") true)
        (ai_disregard (ai_get_object "boss_johnson") true)
        (cinematic_lighting_set_primary_light 27.0 0.0 0.34902 0.333333 0.541176)
        (cinematic_lighting_set_secondary_light -26.0 154.0 0.639216 0.54902 0.505882)
        (cinematic_lighting_set_ambient_light 0.0823529 0.0784314 0.0588235)
        (object_uses_cinematic_lighting (ai_get_object "boss_johnson") true)
        (ai_place "boss_brute_start")
        (cs_run_command_script "boss_brute_start" cs_boss_brutes_stunned)
        (ai_place "boss_elite_start")
        (game_reverted)
    )
)

(script static void tartarus_boss_fight
    (begin
        (cinematic_snap_to_white)
        (object_create_containing "boss_object")
        (print "war!")
        (boss_setup)
        (wake boss_music)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white)
        (sleep 90)
        (units_set_current_vitality (ai_actors "boss_brute_start") 30.0 0.0)
        (sleep 120)
        (sleep_until (not 
            (or
                (and
                    (> (device_get_position "e13_rotors") 0.05)
                    (< (device_get_position "e13_rotors") 0.125)
                )
                (and
                    (> (device_get_position "e13_rotors") 0.3)
                    (< (device_get_position "e13_rotors") 0.375)
                )
                (and
                    (> (device_get_position "e13_rotors") 0.55)
                    (< (device_get_position "e13_rotors") 0.625)
                )
                (and
                    (> (device_get_position "e13_rotors") 0.8)
                    (< (device_get_position "e13_rotors") 0.875)
                )
            )
        ) 1)
        (cs_run_command_script "boss_tartarus" cs_boss_tartarus_jump)
        (sleep_until (= (ai_living_count "boss_brute_start") 0) 1 (* 15.0 30.0))
        (ai_place "boss_elite_reenforcements")
        (sleep_until (volume_test_objects "tv_boss_platform" (players)) 1 (* 30.0 30.0))
        (sleep (* 10.0 30.0))
        (unit_impervious (ai_get_object "boss_tartarus") false)
        (set timer_boss_johnson_fire (boss_johnson_rateoffire))
        (cs_run_command_script "boss_johnson" cs_boss_johnson_idle)
        (wake boss_flavor)
        (unit_set_current_vitality (ai_get_unit "boss_tartarus") 50.0 1000.0)
        (sleep_until 
            (if (volume_test_objects "kill_e13_0" (ai_get_object "boss_miranda")) 
                (begin
                    (begin
                        (ai_erase "boss_miranda")
                        (ai_place "boss_miranda")
                        (unit_impervious (ai_actors "boss_miranda") true)
                        (object_cannot_die (ai_get_object "boss_miranda") true)
                        false
                    )
                ) (if (not (volume_test_objects "tv_boss_ledge" (ai_get_object "boss_johnson"))) 
                    (begin
                        (begin
                            (ai_erase "boss_johnson")
                            (ai_place "boss_johnson")
                            (unit_impervious (ai_actors "boss_johnson") true)
                            (object_cannot_die (ai_get_object "boss_johnson") true)
                            false
                        )
                    ) (if 
                        (and
                            (not (volume_test_objects "tv_boss_platform" (ai_get_object "boss_tartarus")))
                            (not (volume_test_objects "tv_boss_ledge" (ai_get_object "boss_tartarus")))
                            (> (player_count) 0)
                        ) 
                            (begin
                                (begin
                                    (object_teleport (ai_get_object "boss_tartarus") "boss_tartarus_respawn_flag")
                                    (sleep 90)
                                    false
                                )
                            ) (if (ai_vitality_pinned "boss_tartarus") 
                                (begin
                                    (begin
                                        (set count_boss_cycle (- count_boss_cycle 1.0))
                                        (print "cycle complete")
                                        (if (not (> (player_count) 0)) 
                                            (begin
                                                false
                                            ) (if (<= count_boss_cycle 0) 
                                                (begin
                                                    (begin
                                                        (ai_cannot_die "boss_tartarus" false)
                                                        (ai_kill "boss_tartarus")
                                                        true
                                                    )
                                                ) (if true 
                                                    (begin
                                                        (begin
                                                            (if mark_boss_first_cycle 
                                                                (begin
                                                                    (print "(growls in pain) a lucky hit! you will not land another!")
                                                                    (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\mission\l08_1020_tar" (ai_get_object "boss_tartarus") 1.0)
                                                                    (set mark_boss_first_cycle false)
                                                                )
                                                            )
                                                            (if (difficulty_legendary) 
                                                                (begin
                                                                    (unit_set_maximum_vitality (ai_get_unit "boss_tartarus") 400.0 1000.0)
                                                                ) (if (difficulty_heroic) 
                                                                    (begin
                                                                        (unit_set_maximum_vitality (ai_get_unit "boss_tartarus") 350.0 1000.0)
                                                                    ) (if true 
                                                                        (begin
                                                                            (unit_set_maximum_vitality (ai_get_unit "boss_tartarus") 300.0 1000.0)
                                                                        ) )
                                                                )
                                                            )
                                                            (set boss_respawn_brutes true)
                                                            (boss_tartarus_invincible_on)
                                                            (begin_random
                                                                (cs_run_command_script "boss_tartarus" cs_boss_tartarus_taunt)
                                                                (cs_run_command_script "boss_tartarus" cs_boss_tartarus_cheer)
                                                                (cs_run_command_script "boss_tartarus" cs_boss_tartarus_shakefist)
                                                            )
                                                            (sleep_until 
                                                                (and
                                                                    (not (cs_command_script_running "boss_tartarus" cs_boss_tartarus_taunt))
                                                                    (not (cs_command_script_running "boss_tartarus" cs_boss_tartarus_cheer))
                                                                    (not (cs_command_script_running "boss_tartarus" cs_boss_tartarus_shakefist))
                                                                ) 
                                                            1)
                                                            (if (not (difficulty_normal)) 
                                                                (boss_tartarus_berserk_on))
                                                            false
                                                        )
                                                    ) false)
                                            )
                                        )
                                    )
                                ) (if 
                                    (and
                                        (not (volume_test_objects "tv_boss_platform" (players)))
                                        (not (ai_vitality_pinned "boss_tartarus"))
                                        (> (player_count) 0)
                                    ) 
                                        (begin
                                            (begin
                                                (if boss_flavor_done 
                                                    (boss_tartarus_taunt))
                                                (ai_magically_see_object "boss_tartarus" (player0))
                                                (ai_magically_see_object "boss_tartarus" (player1))
                                                (sleep_until (volume_test_objects "tv_boss_platform" (players)) 1 (* 15.0 30.0))
                                                false
                                            )
                                        ) (if (> timer_boss_tartarus_recharge 0) 
                                            (begin
                                                (begin
                                                    (set timer_boss_tartarus_recharge (- timer_boss_tartarus_recharge 1.0))
                                                    false
                                                )
                                            ) (if (not boss_tartarus_invincible) 
                                                (begin
                                                    (begin
                                                        (ai_magically_see_object "boss_tartarus" (player0))
                                                        (ai_magically_see_object "boss_tartarus" (player1))
                                                        (boss_tartarus_invincible_on)
                                                        false
                                                    )
                                                ) (if 
                                                    (or
                                                        (and
                                                            (difficulty_legendary)
                                                            (< (unit_get_shield (ai_get_unit "boss_tartarus")) 0.9)
                                                        )
                                                        (and
                                                            (difficulty_heroic)
                                                            (< (unit_get_shield (ai_get_unit "boss_tartarus")) 0.95)
                                                        )
                                                        (and
                                                            (difficulty_normal)
                                                            (< (unit_get_shield (ai_get_unit "boss_tartarus")) 0.975)
                                                        )
                                                    ) 
                                                        (begin
                                                            (begin
                                                                (ai_magically_see_object "boss_tartarus" (player0))
                                                                (ai_magically_see_object "boss_tartarus" (player1))
                                                                (boss_tartarus_invincible_off)
                                                                (if boss_flavor_done 
                                                                    (boss_johnson_prompt))
                                                                (set timer_boss_tartarus_recharge (boss_tartarus_rateofrecharge))
                                                                false
                                                            )
                                                        ) (if (> timer_boss_tartarus_berserk 0) 
                                                            (begin
                                                                (begin
                                                                    (set timer_boss_tartarus_berserk (- timer_boss_tartarus_berserk 1.0))
                                                                    false
                                                                )
                                                            ) (if boss_tartarus_berserk 
                                                                (begin
                                                                    (begin
                                                                        (ai_magically_see_object "boss_tartarus" (player0))
                                                                        (ai_magically_see_object "boss_tartarus" (player1))
                                                                        (boss_tartarus_berserk_off)
                                                                        false
                                                                    )
                                                                ) (if 
                                                                    (and
                                                                        boss_respawn_brutes
                                                                        (<= (+ (ai_living_count "boss_elite_reenforcements") (ai_living_count "boss_brute_reenforcements")) 3.0)
                                                                    ) 
                                                                        (begin
                                                                            (begin
                                                                                (if (difficulty_legendary) 
                                                                                    (begin
                                                                                        (set boss_random_reenforcements (random_range 3 10))
                                                                                    ) (if (difficulty_heroic) 
                                                                                        (begin
                                                                                            (set boss_random_reenforcements (random_range 3 7))
                                                                                        ) (if true 
                                                                                            (begin
                                                                                                (set boss_random_reenforcements (random_range 0 6))
                                                                                            ) )
                                                                                    )
                                                                                )
                                                                                (if (> boss_random_reenforcements 7) 
                                                                                    (begin
                                                                                        (ai_place "boss_brute_reenforcements_many")
                                                                                    ) (if (> boss_random_reenforcements 3) 
                                                                                        (begin
                                                                                            (ai_place "boss_brute_reenforcements")
                                                                                        ) )
                                                                                )
                                                                                (set boss_respawn_brutes false)
                                                                            )
                                                                        ) (if 
                                                                            (and
                                                                                boss_respawn_elites
                                                                                (<= (+ (ai_living_count "boss_elite_reenforcements") (ai_living_count "boss_brute_reenforcements")) 3.0)
                                                                            ) 
                                                                                (begin
                                                                                    (begin
                                                                                        (if (difficulty_legendary) 
                                                                                            (begin
                                                                                                (set boss_random_reenforcements (random_range 3 10))
                                                                                            ) (if (difficulty_heroic) 
                                                                                                (begin
                                                                                                    (set boss_random_reenforcements (random_range 3 7))
                                                                                                ) (if true 
                                                                                                    (begin
                                                                                                        (set boss_random_reenforcements (random_range 0 6))
                                                                                                    ) )
                                                                                            )
                                                                                        )
                                                                                        (if (< boss_random_reenforcements 3) 
                                                                                            (begin
                                                                                                (ai_place "boss_elite_reenforcements_many")
                                                                                            ) (if (< boss_random_reenforcements 7) 
                                                                                                (begin
                                                                                                    (ai_place "boss_elite_reenforcements")
                                                                                                ) )
                                                                                        )
                                                                                        (set boss_respawn_elites false)
                                                                                    )
                                                                                ) (if (> timer_boss_johnson_fire 0) 
                                                                                    (begin
                                                                                        (begin
                                                                                            (set timer_boss_johnson_fire (- timer_boss_johnson_fire 1.0))
                                                                                            (if (<= (+ (ai_living_count "boss_elite_reenforcements") (ai_living_count "boss_brute_reenforcements")) 3.0) 
                                                                                                (set timer_boss_reenforcements (- timer_boss_reenforcements 1.0)))
                                                                                            (if (<= timer_boss_reenforcements 0) 
                                                                                                (begin
                                                                                                    (set boss_respawn_elites true)
                                                                                                    (set timer_boss_reenforcements (boss_rateofreenforcement))
                                                                                                    (print "respawn!")
                                                                                                )
                                                                                            )
                                                                                            false
                                                                                        )
                                                                                    ) (if (objects_can_see_object (ai_get_object "boss_johnson") (ai_get_object "boss_tartarus") 0.25) 
                                                                                        (begin
                                                                                            (begin
                                                                                                (ai_magically_see_object "boss_tartarus" (player0))
                                                                                                (ai_magically_see_object "boss_tartarus" (player1))
                                                                                                (print "fire")
                                                                                                (object_set_shield (ai_get_object "boss_tartarus") (/ 1.0 1000.0))
                                                                                                (cs_run_command_script "boss_johnson" cs_boss_johnson_shoot)
                                                                                                (cs_queue_command_script "boss_johnson" cs_boss_johnson_idle)
                                                                                                (set timer_boss_johnson_fire (boss_johnson_rateoffire))
                                                                                                false
                                                                                            )
                                                                                        ) (if true 
                                                                                            (begin
                                                                                                (begin
                                                                                                    (ai_magically_see_object "boss_tartarus" (player0))
                                                                                                    (ai_magically_see_object "boss_tartarus" (player1))
                                                                                                    false
                                                                                                )
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
                                )
                            )
                    )
                )
            ) 
        1)
        (ai_kill "boss_tartarus")
        (print "nice job!")
        (sleep_forever boss_flavor)
        (sleep (* 10.0 30.0))
        (if (= (player_count) 0) 
            (sleep_forever))
        (cinematic_fade_to_white)
        (sleep 15)
        (ai_erase "boss_elite_reenforcements")
        (ai_erase "boss_tartarus")
        (ai_erase "boss_brute_reenforcements")
        (ai_erase "boss_miranda")
        (ai_erase "boss_johnson")
        (ai_erase "boss_monitor")
        (object_destroy_containing "boss_object")
        (garbage_collect_now)
    )
)

(script static void 08_intra1_04_predict_stub
    (begin
        (wake 08_intra1_04_predict)
    )
)

(script static void 08_intra2_01_predict_stub
    (begin
        (wake 08_intra2_01_predict)
    )
)

(script static void 08_intra2_02_predict_stub
    (begin
        (wake 08_intra2_02_predict)
    )
)

(script static void 08_intra3_01_predict_stub
    (begin
        (wake 08_intra3_01_predict)
    )
)

(script static void 08_intra3_02_predict_stub
    (begin
        (wake 08_intra3_02_predict)
    )
)

(script static void 08_intra3_03_predict_stub
    (begin
        (wake 08_intra3_03_predict)
    )
)

(script static void 08_intra3_04_predict_stub
    (begin
        (wake 08_intra3_04_predict)
    )
)

(script static void 08_intra3_05_predict_stub
    (begin
        (wake 08_intra3_05_predict)
    )
)

(script static void 08_intra3_06_predict_stub
    (begin
        (wake 08_intra3_05_predict)
    )
)

(script static void x09_01_predict_stub
    (begin
        (wake x09_01_predict)
    )
)

(script static void x09_02_predict_stub
    (begin
        (wake x09_02_predict)
    )
)

(script static void x09_03_predict_stub
    (begin
        (wake x09_03_predict)
    )
)

(script static void x09_04_predict_stub
    (begin
        (wake x09_04_predict)
    )
)

(script static void x09_05_predict_stub
    (begin
        (wake x09_05_predict)
    )
)

(script static void x09_06_predict_stub
    (begin
        (wake x09_06_predict)
    )
)

(script static void x09_07_predict_stub
    (begin
        (wake x09_07_predict)
    )
)

(script static void x09_08_predict_stub
    (begin
        (wake x09_08_predict)
    )
)

(script static void x10_01_predict_stub
    (begin
        (wake x10_01_predict)
    )
)

(script static void x10_02_predict_stub
    (begin
        (wake x10_02_predict)
    )
)

(script dormant void c08_intra1_score_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra1\music\c08_intra1_04_mus" none 1.0)
        (print "c08_intra1 score 04 start")
    )
)

(script dormant void c08_intra1_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_04_fol" none 1.0)
        (print "c08_intra1 foley 04 start")
    )
)

(script dormant void c08_2050_der
    (begin
        (sleep 60)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2050_der" "dervish_02" 1.0)
        (attract_mode_set_seconds "c08_2050_der" 1.0)
    )
)

(script dormant void c08_2060_soc
    (begin
        (sleep 92)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2060_soc" "commander" 1.0)
        (attract_mode_set_seconds "c08_2060_soc" 6.0)
    )
)

(script dormant void c08_2070_grv
    (begin
        (sleep 273)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2070_grv" none 1.0)
        (attract_mode_set_seconds "c08_2070_grv" 5.0)
        (predict_animation)
    )
)

(script dormant void c08_2080_der
    (begin
        (sleep 425)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2080_der" "dervish_02" 1.0)
        (attract_mode_set_seconds "c08_2080_der" 2.0)
    )
)

(script dormant void c08_2090_soc
    (begin
        (sleep 473)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2090_soc" "commander" 1.0)
        (attract_mode_set_seconds "c08_2090_soc" 1.0)
    )
)

(script dormant void c08_2100_soc
    (begin
        (sleep 512)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_2100_soc" "commander" 1.0)
        (attract_mode_set_seconds "c08_2100_soc" 2.0)
    )
)

(script dormant void c04_intra1_fov_04
    (begin
        (sleep 511)
        (print "fov change: 80 -> 60 over 0 ticks")
        (camera_pan 60.0 0)
    )
)

(script dormant void c04_intra1_dof_04
    (begin
        (sleep 427)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.17 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 84)
        (cinematic_screen_effect_set_crossfade2 0.5 0.5 0.5 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 100)
        (cinematic_screen_effect_set_crossfade2 0.5 0.5 0.0 0.0 0.0 0.5 0.5)
        (print "rack focus")
    )
)

(script dormant void cinematic_lighting_intra1_04
    (begin
        (cinematic_lighting_set_primary_light 40.0 134.0 0.321569 0.321569 0.290196)
        (cinematic_lighting_set_secondary_light 8.0 274.0 0.301961 0.290196 0.45098)
        (cinematic_lighting_set_ambient_light 0.121569 0.121569 0.0705882)
        (object_uses_cinematic_lighting "dervish_02" true)
        (object_uses_cinematic_lighting "commander" true)
        (object_uses_cinematic_lighting "wraith_01" true)
    )
)

(script static void c08_intra1_04_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "dervish_02")
        (object_create_anew "commander")
        (object_create_anew "wraith_01")
        (ice_cream_flavor_stock "dervish_02" "right_hand_elite" "")
        (object_cinematic_lod "dervish_02" true)
        (object_cinematic_lod "commander" true)
        (object_cinematic_lod "wraith_01" true)
    )
)

(script static void c08_intra1_04_setup
    (begin
        (wake c08_intra1_score_04)
        (wake c08_intra1_foley_04)
        (wake c08_2050_der)
        (wake c08_2060_soc)
        (wake c08_2070_grv)
        (wake c08_2080_der)
        (wake c08_2090_soc)
        (wake c08_2100_soc)
        (wake c04_intra1_fov_04)
        (wake c04_intra1_dof_04)
        (wake cinematic_lighting_intra1_04)
    )
)

(script static void c08_intra1_04_cleanup
    (begin
        (object_destroy "dervish_02")
        (object_destroy "commander")
        (object_destroy "wraith_01")
    )
)

(script static void c08_intra1
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "deltacontrol_intra1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (c08_intra1_04_problem_actors)
        (08_intra1_04_predict_stub)
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra1\music\c08_intra1_04_mus")
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra1\foley\c08_intra1_04_fol")
        (sleep prediction_offset)
        (c08_intra1_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra1\08_intra1" "08_intra1_04" none "anchor_flag_intra1")
        (custom_animation_relative "dervish_02" "objects\characters\dervish\08_intra1\08_intra1" "dervish_04" false "anchor_intra1")
        (custom_animation_relative "commander" "objects\characters\elite\08_intra1\08_intra1" "commander_04" false "anchor_intra1")
        (custom_animation_relative "wraith_01" "objects\vehicles\wraith\08_intra1\08_intra1" "wraith_04" false "anchor_intra1")
        (print "cache block")
        (sleep 1)
        (ui_error_ok)
        (cinematic_start 0.0 0.0 0.0 30)
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c08_intra1_04_cleanup)
        (cinematic_set_far_clip_distance)
        (sleep 30)
        (sound_class_enable_ducker "vehicle" 1.0 1)
    )
)

(script dormant void c08_intra2_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra2\foley\c08_intra2_01_fol" none 1.0)
        (print "c08_intra2 foley 01 start")
    )
)

(script dormant void c08_3010_jon
    (begin
        (sleep 100)
        (sound_impulse_time "sound\dialog\levels\08_controlroom\cinematic\c08_3010_jon" "johnson_02" 1.0 "radio_covy_in")
        (attract_mode_set_seconds "c08_3010_jon" 3.0)
    )
)

(script dormant void c08_3020_jon
    (begin
        (sleep 203)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_3020_jon" "johnson_02" 1.0)
        (attract_mode_set_seconds "c08_3020_jon" 3.0)
    )
)

(script dormant void c08_3030_jon
    (begin
        (sleep 316)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_3030_jon" "johnson_02" 1.0)
        (attract_mode_set_seconds "c08_3030_jon" 2.0)
    )
)

(script dormant void c08_3040_der
    (begin
        (sleep 359)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_3040_der" "dervish_02" 1.0)
        (attract_mode_set_seconds "c08_3040_der" 3.0)
    )
)

(script dormant void intra2_texture_cam_01
    (begin
        (object_create_anew "texture_camera")
        (texture_camera_set_object_marker "texture_camera" "marker" 35.0)
        (scenery_animation_start_relative "texture_camera" "objects\cinematics\texture_camera\08_intra2\08_intra2" "texture_camera_01" "anchor_intra2")
    )
)

(script dormant void cinematic_lighting_intra2
    (begin
        (cinematic_lighting_set_primary_light 33.0 0.0 0.258824 0.278431 0.34902)
        (cinematic_lighting_set_secondary_light -37.0 228.0 0.109804 0.419608 0.611765)
        (cinematic_lighting_set_ambient_light 0.121569 0.121569 0.0705882)
        (object_uses_cinematic_lighting "dervish_02" true)
        (object_uses_cinematic_lighting "johnson_02" true)
        (object_uses_cinematic_lighting "scarab_01" true)
    )
)

(script static void c08_intra2_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "dervish_02")
        (object_cinematic_lod "dervish_02" true)
        (ice_cream_flavor_stock "dervish_02" "right_hand_elite" "")
    )
)

(script dormant void scarab_shake
    (begin
        (sleep 45)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 2.0)
        (sleep 240)
        (hud_blink_health 2.0)
    )
)

(script static void c08_intra2_01_setup
    (begin
        (object_destroy "scarab")
        (object_create_anew "johnson_02")
        (object_create_anew "scarab_01")
        (object_create_anew "scarab_screen")
        (objects_attach "scarab_01" "holo_scarab_full" "scarab_screen" "")
        (object_cinematic_lod "johnson_02" true)
        (object_cinematic_lod "scarab_01" true)
        (unit_set_emotional_state "johnson_02" "angry" 0.25 0)
        (wake c08_intra2_foley_01)
        (wake c08_3010_jon)
        (wake c08_3020_jon)
        (wake c08_3030_jon)
        (wake c08_3040_der)
        (wake scarab_shake)
        (wake intra2_texture_cam_01)
        (wake cinematic_lighting_intra2)
    )
)

(script static void c08_intra2_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "deltacontrol_intra2")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (c08_intra2_problem_actors)
        (08_intra2_01_predict_stub)
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra2\foley\c08_intra2_01_fol")
        (sleep prediction_offset)
        (sleep 45)
        (c08_intra2_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra2\08_intra2" "08_intra2_01" none "anchor_flag_intra2")
        (custom_animation_relative "dervish_02" "objects\characters\dervish\08_intra2\08_intra2" "dervish_01" false "anchor_intra2")
        (custom_animation_relative "johnson_02" "objects\characters\marine\08_intra2\08_intra2" "johnson_01" false "anchor_intra2")
        (scenery_animation_start_relative "scarab_01" "scenarios\objects\covenant\military\scarab\08_intra2\08_intra2" "scarab_01" "anchor_intra2")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra2_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra2\foley\c08_intra2_02_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c08_intra2_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra2\foley\c08_intra2_02_fol" none 1.0)
        (print "c08_intra1 foley 04 start")
    )
)

(script dormant void c08_3050_jon
    (begin
        (sleep 70)
        (sound_impulse_time "sound\dialog\levels\08_controlroom\cinematic\c08_3050_jon" "johnson_02" 1.0 "radio_covy_loop")
        (attract_mode_set_seconds "c08_3050_jon" 2.0)
    )
)

(script dormant void c08_3061_jon
    (begin
        (sleep 156)
        (sound_impulse_time "sound\dialog\levels\08_controlroom\cinematic\c08_3061_jon" "johnson_02" 1.0 "radio_covy_loop")
        (attract_mode_set_seconds "c08_3061_jon" 2.0)
    )
)

(script dormant void c08_3070_jon
    (begin
        (sleep 231)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_3070_jon" "johnson_02" 1.0)
        (attract_mode_set_seconds "c08_3070_jon" 1.0)
        (unit_set_emotional_state "johnson_02" "angry" 0.75 45)
    )
)

(script dormant void intra2_dof
    (begin
        (sleep 68)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.5 0.001 0.0 0.0 0.001)
        (print "rack focus")
        (sleep 151)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void scarab_shake2
    (begin
        (sleep 137)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.75 0.15)
        (sleep 5)
        (hud_blink_health 0.5)
    )
)

(script static void c08_intra2_02_setup
    (begin
        (wake c08_intra2_foley_02)
        (wake c08_3050_jon)
        (wake c08_3061_jon)
        (wake c08_3070_jon)
        (wake intra2_dof)
        (wake scarab_shake2)
    )
)

(script static void c08_intra2_02_cleanup
    (begin
        (object_destroy "dervish_02")
        (object_destroy "johnson_02")
        (object_destroy "scarab_01")
        (object_destroy "scarab_screen")
        (object_create_anew "scarab")
    )
)

(script static void c08_intra2_scene_02
    (begin
        (c08_intra2_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra2\08_intra2" "08_intra2_02" none "anchor_flag_intra2")
        (custom_animation_relative "dervish_02" "objects\characters\dervish\08_intra2\08_intra2" "dervish_02" false "anchor_intra2")
        (custom_animation_relative "johnson_02" "objects\characters\marine\08_intra2\08_intra2" "johnson_02" false "anchor_intra2")
        (scenery_animation_start_relative "scarab_01" "scenarios\objects\covenant\military\scarab\08_intra2\08_intra2" "scarab_02" "anchor_intra2")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c08_intra2_02_cleanup)
        (sound_class_enable_ducker "amb" 0.0 15)
        (sleep 15)
    )
)

(script static void c08_intra2
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash deltacontrolroom_bsp0)
        (sleep 1)
        (c08_intra2_scene_01)
        (c08_intra2_scene_02)
    )
)

(script dormant void c08_intra3_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_01_fol" none 1.0)
        (print "c08_intra3 foley 01 start")
    )
)

(script dormant void c08_4010_tar
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4010_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4010_tar" 4.0)
    )
)

(script dormant void c08_4020_tar
    (begin
        (sleep 167)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4020_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4020_tar" 3.0)
    )
)

(script dormant void c08_4030_gsp
    (begin
        (sleep 251)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4030_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c08_4030_gsp" 3.0)
    )
)

(script dormant void c08_4040_tar
    (begin
        (sleep 344)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4040_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4040_tar" 4.0)
    )
)

(script dormant void c08_4050_mir
    (begin
        (sleep 486)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4050_mir" "miranda" 1.0)
        (attract_mode_set_seconds "c08_4050_mir" 1.0)
    )
)

(script dormant void c08_4060_tar
    (begin
        (sleep 510)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4060_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4060_tar" 3.0)
    )
)

(script dormant void c08_intra3_fov_01
    (begin
        (sleep 246)
        (camera_pan 30.0 0)
        (print "fov change: 60 -> 30 over 0 ticks")
        (sleep 105)
        (camera_pan 60.0 13)
        (print "fov change: 30 -> 60 over 13 ticks")
    )
)

(script dormant void cinematic_lighting_intra3_01
    (begin
        (cinematic_lighting_set_primary_light 63.0 80.0 0.180392 0.168627 0.129412)
        (cinematic_lighting_set_secondary_light -51.0 188.0 0.101961 0.2 0.301961)
        (cinematic_lighting_set_ambient_light 0.121569 0.121569 0.0705882)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "tartarus" true)
        (object_uses_cinematic_lighting "brute_01" true)
        (object_uses_cinematic_lighting "brute_02" true)
        (object_uses_cinematic_lighting "brute_03" true)
        (object_uses_cinematic_lighting "brute_04" true)
        (object_uses_cinematic_lighting "monitor" true)
        (object_uses_cinematic_lighting "index" true)
    )
)

(script static void c08_intra3_problem_actors_01
    (begin
        (print "problem actors")
        (object_create_anew "miranda")
        (object_create_anew "tartarus")
        (object_create_anew "brute_01")
        (object_create_anew "brute_02")
        (object_create_anew "brute_03")
        (object_create_anew "brute_04")
        (object_create_anew "monitor")
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "tartarus" true)
        (object_cinematic_lod "brute_01" true)
        (object_cinematic_lod "brute_02" true)
        (object_cinematic_lod "brute_03" true)
        (object_cinematic_lod "brute_04" true)
        (object_cinematic_lod "monitor" true)
    )
)

(script dormant void c08_intra2_miranda_emotion_01
    (begin
        (unit_set_emotional_state "miranda" "angry" 0.25 0)
        (sleep 180)
        (unit_set_emotional_state "miranda" "angry" 0.75 30)
    )
)

(script dormant void c08_intra2_miranda_emotion_02
    (begin
        (sleep 488)
        (unit_set_emotional_state "miranda" "pain" 0.75 30)
        (sleep 81)
        (unit_set_emotional_state "miranda" "angry" 0.25 60)
    )
)

(script static void c08_intra3_01_setup
    (begin
        (object_create_anew "index")
        (object_create_anew "repository")
        (object_cinematic_lod "index" true)
        (object_cinematic_lod "repository" true)
        (wake c08_intra3_foley_01)
        (wake c08_4010_tar)
        (wake c08_4020_tar)
        (wake c08_4030_gsp)
        (wake c08_4040_tar)
        (wake c08_4050_mir)
        (wake c08_4060_tar)
        (wake c08_intra2_miranda_emotion_01)
        (wake c08_intra2_miranda_emotion_02)
        (wake c08_intra3_fov_01)
        (wake cinematic_lighting_intra3_01)
    )
)

(script static void c08_intra3_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "deltacontrol_intra3")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (c08_intra3_problem_actors_01)
        (08_intra3_01_predict_stub)
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_01_fol")
        (sleep prediction_offset)
        (c08_intra3_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra3\08_intra3" "08_intra3_01" none "anchor_flag_intra3")
        (custom_animation_relative "miranda" "objects\characters\miranda\08_intra3\08_intra3" "miranda_01" false "anchor_intra3")
        (custom_animation_relative "monitor" "objects\characters\monitor\08_intra3\08_intra3" "monitor_01" false "anchor_intra3")
        (custom_animation_relative "tartarus" "objects\characters\brute\08_intra3\08_intra3" "tartarus_01" false "anchor_intra3")
        (custom_animation_relative "brute_01" "objects\characters\brute\08_intra3\08_intra3" "brute01_01" false "anchor_intra3")
        (custom_animation_relative "brute_02" "objects\characters\brute\08_intra3\08_intra3" "brute02_01" false "anchor_intra3")
        (custom_animation_relative "brute_03" "objects\characters\brute\08_intra3\08_intra3" "brute03_01" false "anchor_intra3")
        (custom_animation_relative "brute_04" "objects\characters\brute\08_intra3\08_intra3" "brute04_01" false "anchor_intra3")
        (scenery_animation_start_relative "index" "scenarios\objects\forerunner\industrial\index\index_full\08_intra3\08_intra3" "index_01" "anchor_intra3")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra3_02_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\music\c08_intra3_02_mus")
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_02_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c08_intra3_score_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\music\c08_intra3_02_mus" none 1.0)
        (print "c08_intra3 score 02 start")
    )
)

(script dormant void c08_intra3_foley_02
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_02_fol" none 1.0)
        (print "c08_intra3 foley 02 start")
    )
)

(script dormant void c08_4070_der
    (begin
        (sleep 36)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4070_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4070_der" 1.0)
    )
)

(script dormant void c08_4080_tar
    (begin
        (sleep 77)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4080_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4080_tar" 3.0)
    )
)

(script dormant void c08_4100_der
    (begin
        (sleep 157)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4100_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4100_der" 2.0)
    )
)

(script dormant void c08_4110_tar
    (begin
        (sleep 212)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4110_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4110_tar" 3.0)
    )
)

(script dormant void c08_4120_der
    (begin
        (sleep 312)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4120_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4120_der" 5.0)
    )
)

(script dormant void c08_4140_tar
    (begin
        (sleep 516)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4140_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4140_tar" 4.0)
    )
)

(script dormant void c08_4150_der
    (begin
        (sleep 628)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4150_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4150_der" 1.0)
    )
)

(script dormant void c08_4160_der
    (begin
        (sleep 681)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4160_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4160_der" 3.0)
    )
)

(script dormant void unhide_dervish
    (begin
        (rasterizer_profile_include_all)
        (sleep 10)
        (print "unhide dervish")
        (object_hide "dervish" false)
    )
)

(script static void c08_intra3_02_setup
    (begin
        (object_create_anew "dervish")
        (object_cinematic_lod "dervish" true)
        (object_hide "dervish" true)
        (ice_cream_flavor_stock "dervish" "right_hand_elite" "")
        (wake c08_intra3_score_02)
        (wake c08_intra3_foley_02)
        (wake c08_4070_der)
        (wake c08_4080_tar)
        (wake c08_4100_der)
        (wake c08_4110_tar)
        (wake c08_4120_der)
        (wake c08_4140_tar)
        (wake c08_4150_der)
        (wake c08_4160_der)
        (wake unhide_dervish)
    )
)

(script static void c08_intra3_scene_02
    (begin
        (c08_intra3_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra3\08_intra3" "08_intra3_02" none "anchor_flag_intra3")
        (custom_animation_relative "miranda" "objects\characters\miranda\08_intra3\08_intra3" "miranda_02" false "anchor_intra3")
        (custom_animation_relative "monitor" "objects\characters\monitor\08_intra3\08_intra3" "monitor_02" false "anchor_intra3")
        (custom_animation_relative "dervish" "objects\characters\dervish\08_intra3\08_intra3" "dervish_02" false "anchor_intra3")
        (custom_animation_relative "tartarus" "objects\characters\brute\08_intra3\08_intra3" "tartarus_02" false "anchor_intra3")
        (custom_animation_relative "brute_01" "objects\characters\brute\08_intra3\08_intra3" "brute01_02" false "anchor_intra3")
        (custom_animation_relative "brute_02" "objects\characters\brute\08_intra3\08_intra3" "brute02_02" false "anchor_intra3")
        (custom_animation_relative "brute_03" "objects\characters\brute\08_intra3\08_intra3" "brute03_02" false "anchor_intra3")
        (custom_animation_relative "brute_04" "objects\characters\brute\08_intra3\08_intra3" "brute04_02" false "anchor_intra3")
        (scenery_animation_start_relative "index" "scenarios\objects\forerunner\industrial\index\index_full\08_intra3\08_intra3" "index_02" "anchor_intra3")
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra3_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_03_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c08_intra3_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_03_fol" none 1.0)
        (print "c08_intra3 foley 03 start")
    )
)

(script dormant void c08_4170_gsp
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4170_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c08_4170_gsp" 2.0)
    )
)

(script dormant void c08_4180_tar
    (begin
        (sleep 41)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4180_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4180_tar" 2.0)
    )
)

(script dormant void c08_4190_tar
    (begin
        (sleep 84)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4190_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4190_tar" 2.0)
    )
)

(script dormant void c08_4200_jon
    (begin
        (sleep 137)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4200_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c08_4200_jon" 1.0)
        (unit_set_emotional_state "johnson" "angry" 0.5 0)
        (print "johnson - angry .5 0")
    )
)

(script dormant void c08_4201_jon
    (begin
        (sleep 202)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4201_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c08_4201_jon" 2.0)
    )
)

(script dormant void c08_4220_jon
    (begin
        (sleep 308)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4220_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c08_4220_jon" 3.0)
        (unit_set_emotional_state "johnson" "angry" 1.0 15)
        (print "johnson - angry 1 15")
    )
)

(script dormant void c08_4230_tar
    (begin
        (sleep 430)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4230_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4230_tar" 1.0)
    )
)

(script dormant void c08_4240_jon
    (begin
        (sleep 474)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4240_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c08_4240_jon" 2.0)
    )
)

(script dormant void c08_4250_der
    (begin
        (sleep 548)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4250_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4250_der" 2.0)
    )
)

(script dormant void c08_intra3_fov_03
    (begin
        (sleep 184)
        (camera_pan 5.0 21)
        (print "fov change: 60 -> 5 over 21 ticks")
        (sleep 69)
        (camera_pan 60.0 0)
        (print "fov change: 5 -> 60 over 0 ticks")
    )
)

(script dormant void cinematic_lighting_intra3_03
    (begin
        (object_uses_cinematic_lighting "johnson" true)
        (object_uses_cinematic_lighting "cov_sniper" true)
    )
)

(script static void c08_intra3_03_setup
    (begin
        (object_create_anew "johnson")
        (object_create_anew "cov_sniper")
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "cov_sniper" true)
        (objects_attach "johnson" "right_hand" "cov_sniper" "")
        (wake c08_intra3_foley_03)
        (wake c08_4170_gsp)
        (wake c08_4180_tar)
        (wake c08_4190_tar)
        (wake c08_4200_jon)
        (wake c08_4201_jon)
        (wake c08_4220_jon)
        (wake c08_4230_tar)
        (wake c08_4240_jon)
        (wake c08_4250_der)
        (wake c08_intra3_fov_03)
        (wake cinematic_lighting_intra3_03)
    )
)

(script static void c08_intra3_scene_03
    (begin
        (c08_intra3_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra3\08_intra3" "08_intra3_03" none "anchor_flag_intra3")
        (custom_animation_relative "miranda" "objects\characters\miranda\08_intra3\08_intra3" "miranda_03" false "anchor_intra3")
        (custom_animation_relative "johnson" "objects\characters\marine\08_intra3\08_intra3" "johnson_03" false "anchor_intra3")
        (custom_animation_relative "monitor" "objects\characters\monitor\08_intra3\08_intra3" "monitor_03" false "anchor_intra3")
        (custom_animation_relative "dervish" "objects\characters\dervish\08_intra3\08_intra3" "dervish_03" false "anchor_intra3")
        (custom_animation_relative "tartarus" "objects\characters\brute\08_intra3\08_intra3" "tartarus_03" false "anchor_intra3")
        (custom_animation_relative "brute_01" "objects\characters\brute\08_intra3\08_intra3" "brute01_03" false "anchor_intra3")
        (custom_animation_relative "brute_02" "objects\characters\brute\08_intra3\08_intra3" "brute02_03" false "anchor_intra3")
        (custom_animation_relative "brute_03" "objects\characters\brute\08_intra3\08_intra3" "brute03_03" false "anchor_intra3")
        (custom_animation_relative "brute_04" "objects\characters\brute\08_intra3\08_intra3" "brute04_03" false "anchor_intra3")
        (scenery_animation_start_relative "index" "scenarios\objects\forerunner\industrial\index\index_full\08_intra3\08_intra3" "index_03" "anchor_intra3")
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra3_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_04_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c08_intra3_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_04_fol" none 1.0)
        (print "c08_intra3 foley 04 start")
    )
)

(script dormant void c08_4260_gsp
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4260_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c08_4260_gsp" 6.0)
        (unit_set_emotional_state "miranda" "shocked" 0.25 0)
        (print "miranda - shocked .25 0")
    )
)

(script dormant void c08_4270_der
    (begin
        (sleep 189)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4270_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4270_der" 4.0)
    )
)

(script dormant void c08_4280_gsp
    (begin
        (sleep 297)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4280_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c08_4280_gsp" 11.0)
    )
)

(script dormant void c08_4290_gsp
    (begin
        (sleep 640)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4290_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "c08_4290_gsp" 2.0)
    )
)

(script dormant void c08_4300_der
    (begin
        (sleep 746)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4300_der" "dervish" 1.0)
        (attract_mode_set_seconds "c08_4300_der" 4.0)
    )
)

(script static void c08_intra3_04_setup
    (begin
        (wake c08_intra3_foley_04)
        (wake c08_4260_gsp)
        (wake c08_4270_der)
        (wake c08_4280_gsp)
        (wake c08_4290_gsp)
        (wake c08_4300_der)
    )
)

(script static void c08_intra3_scene_04
    (begin
        (c08_intra3_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra3\08_intra3" "08_intra3_04" none "anchor_flag_intra3")
        (custom_animation_relative "miranda" "objects\characters\miranda\08_intra3\08_intra3" "miranda_04" false "anchor_intra3")
        (custom_animation_relative "johnson" "objects\characters\marine\08_intra3\08_intra3" "johnson_04" false "anchor_intra3")
        (custom_animation_relative "monitor" "objects\characters\monitor\08_intra3\08_intra3" "monitor_04" false "anchor_intra3")
        (custom_animation_relative "dervish" "objects\characters\dervish\08_intra3\08_intra3" "dervish_04" false "anchor_intra3")
        (custom_animation_relative "tartarus" "objects\characters\brute\08_intra3\08_intra3" "tartarus_04" false "anchor_intra3")
        (scenery_animation_start_relative "index" "scenarios\objects\forerunner\industrial\index\index_full\08_intra3\08_intra3" "index_04" "anchor_intra3")
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra3_05_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_05_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void c08_intra3_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_05_fol" none 1.0)
        (print "c08_intra3 foley 05 start")
    )
)

(script dormant void c08_4310_jon
    (begin
        (sleep 74)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4310_jon" "johnson" 1.0)
        (attract_mode_set_seconds "c08_4310_jon" 1.0)
    )
)

(script dormant void c08_4320_tar
    (begin
        (sleep 106)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4320_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4320_tar" 1.0)
        (unit_set_emotional_state "miranda" "pain" 0.5 0)
        (print "miranda - pain .5 0")
        (sleep 45)
        (unit_set_emotional_state "miranda" "scared" 0.5 15)
        (print "miranda - scared .5 15")
    )
)

(script dormant void c08_4330_tar
    (begin
        (sleep 144)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4330_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4330_tar" 2.0)
    )
)

(script dormant void c08_4340_tar
    (begin
        (sleep 220)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\c08_4340_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "c08_4340_tar" 4.0)
        (object_set_function_variable "tartarus" "invincibility" 1.0 60.0)
        (print "tartarus activates shield")
    )
)

(script dormant void cinematic_lighting_intra3_05
    (begin
        (object_uses_cinematic_lighting "hammer" true)
    )
)

(script dormant void index_insertion
    (begin
        (sleep 165)
        (print "slot the icon")
        (device_set_position "repository" 1.0)
        (effect_new_on_object_marker "effects\objects\cinematics\index\index_insertion" "index" "")
        (sleep 15)
        (object_destroy "index")
    )
)

(script static void c08_intra3_05_setup
    (begin
        (object_create_anew "hammer")
        (object_cinematic_lod "hammer" true)
        (wake c08_intra3_foley_05)
        (wake c08_4310_jon)
        (wake c08_4320_tar)
        (wake c08_4330_tar)
        (wake c08_4340_tar)
        (wake index_insertion)
        (wake cinematic_lighting_intra3_05)
    )
)

(script dormant void c08_intra3_05_cleanup
    (begin
        (object_destroy "miranda")
        (object_destroy "johnson")
        (object_destroy "monitor")
        (object_destroy "dervish")
        (object_destroy "tartarus")
        (object_destroy "brute_01")
        (object_destroy "brute_02")
        (object_destroy "brute_03")
        (object_destroy "brute_04")
        (object_destroy "repository")
        (object_destroy "index")
        (object_destroy "hammer")
        (object_destroy "cov_sniper")
    )
)

(script static void c08_intra3_scene_05
    (begin
        (c08_intra3_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\08_intra3\08_intra3" "08_intra3_05" none "anchor_flag_intra3")
        (custom_animation_relative "miranda" "objects\characters\miranda\08_intra3\08_intra3" "miranda_05" false "anchor_intra3")
        (custom_animation_relative "johnson" "objects\characters\marine\08_intra3\08_intra3" "johnson_05" false "anchor_intra3")
        (custom_animation_relative "monitor" "objects\characters\monitor\08_intra3\08_intra3" "monitor_05" false "anchor_intra3")
        (custom_animation_relative "dervish" "objects\characters\dervish\08_intra3\08_intra3" "dervish_05" false "anchor_intra3")
        (custom_animation_relative "tartarus" "objects\characters\brute\08_intra3\08_intra3" "tartarus_05" false "anchor_intra3")
        (custom_animation_relative "brute_01" "objects\characters\brute\08_intra3\08_intra3" "brute01_05" false "anchor_intra3")
        (custom_animation_relative "brute_02" "objects\characters\brute\08_intra3\08_intra3" "brute02_05" false "anchor_intra3")
        (custom_animation_relative "brute_03" "objects\characters\brute\08_intra3\08_intra3" "brute03_05" false "anchor_intra3")
        (custom_animation_relative "brute_04" "objects\characters\brute\08_intra3\08_intra3" "brute04_05" false "anchor_intra3")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\08_intra3\08_intra3" "hammer_05" "anchor_intra3")
        (scenery_animation_start_relative "index" "scenarios\objects\forerunner\industrial\index\index_full\08_intra3\08_intra3" "index_05" "anchor_intra3")
        (sleep (- (camera_set_pan) prediction_offset))
        (08_intra3_06_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\music\c08_intra3_06_mus")
        (sound_impulse_start "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_06_fol")
        (sleep (camera_set_pan))
        (wake c08_intra3_05_cleanup)
    )
)

(script dormant void create_lift
    (begin
        (print "create lift")
        (object_create_anew "c08_intra3_lift")
        (object_set_function_variable "c08_intra3_lift" "effect" 0.0 0.0)
        (sleep 10)
        (object_set_function_variable "c08_intra3_lift" "effect" 1.0 60.0)
    )
)

(script static void c08_intra3_scene_06
    (begin
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\music\c08_intra3_06_mus" none 1.0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\c08_intra3\foley\c08_intra3_06_fol" none 1.0)
        (device_set_position "e13_boss_platform" 1.0)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 3.0)
        (camera_set "platform_01a" 0)
        (camera_set "platform_01b" 420)
        (sleep 300)
        (wake create_lift)
        (sleep 30)
        (camera_set "platform_02" 0)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 5.0 0.0 0.0 0.0 2.0 2.0 0.0)
        (sleep 30)
        (cinematic_screen_effect_set_crossfade2 5.0 0.0 2.0 0.5 2.0 0.0 0.5)
        (sleep 45)
        (hud_blink_health 1.5)
        (sleep 15)
        (print "fade to white")
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (cinematic_set_far_clip_distance)
        (object_destroy "c08_intra3_lift")
        (sound_class_enable_ducker "amb" 0.0 15)
        (sleep 30)
    )
)

(script static void c08_intra3
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash deltacontrolroom_bsp3)
        (sleep 1)
        (c08_intra3_scene_01)
        (c08_intra3_scene_02)
        (c08_intra3_scene_03)
        (c08_intra3_scene_04)
        (c08_intra3_scene_05)
        (c08_intra3_scene_06)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script dormant void x09_foley_1
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_01_fol" none 1.0)
        (print "x09 foley 01 start")
    )
)

(script dormant void x09_01_stop_sounds
    (begin
        (sleep 383)
        (print "sound looping stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_11")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_12")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_13")
    )
)

(script dormant void cinematic_lighting_x09_01
    (begin
        (cinematic_lighting_set_primary_light -4.0 206.0 0.454902 0.435294 0.352941)
        (cinematic_lighting_set_secondary_light -69.0 234.0 0.152941 0.152941 0.227451)
        (cinematic_lighting_set_ambient_light 0.0862745 0.0862745 0.0862745)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.4)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "rotors_x09" true)
    )
)

(script dormant void x09_fov_01
    (begin
        (rasterizer_profile_include_all)
        (sleep 289)
        (camera_pan 35.0 0)
        (print "fov change: 60 -> 35 over 0 ticks")
    )
)

(script static void x09_problem_actors_01
    (begin
        (print "problem actors")
        (object_create_anew "miranda")
        (object_create_anew "rotors_x09")
        (object_cinematic_lod "miranda" true)
        (object_cinematic_lod "rotors_x09" true)
    )
)

(script static void x09_problem_actors_02
    (begin
        (print "problem actors")
        (object_create_anew "index_x09")
        (object_cinematic_lod "index_x09" true)
    )
)

(script dormant void x09_miranda_emotion_01
    (begin
        (unit_set_emotional_state "miranda" "angry" 0.25 0)
        (sleep 186)
        (unit_set_emotional_state "miranda" "shocked" 0.5 30)
        (sleep 71)
        (unit_set_emotional_state "miranda" "pain" 0.5 30)
    )
)

(script static void x09_01_setup
    (begin
        (object_destroy "e13_rotors")
        (wake x09_miranda_emotion_01)
        (wake x09_01_stop_sounds)
        (wake x09_foley_1)
        (wake x09_fov_01)
        (wake cinematic_lighting_x09_01)
    )
)

(script static void x09_scene_01
    (begin
        (cinematic_stop 1.0 1.0 1.0 0)
        (camera_control true)
        (set_pjl_effect "deltacontrol_1")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (x09_problem_actors_01)
        (x09_01_predict_stub)
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_01_fol")
        (sleep prediction_offset)
        (sleep 30)
        (x09_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_01" none "anchor_flag_x09_01")
        (custom_animation_relative "miranda" "objects\characters\miranda\x09\x09" "miranda_01" false "anchor_x09_01")
        (scenery_animation_start_relative "rotors_x09" "scenarios\objects\solo\deltacontrolroom\control_rotors\x09\x09" "control_rotors_01" "anchor_x09_01")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (x09_02_predict_stub)
        (x09_problem_actors_02)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\music\x09_02_mus")
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_02_fol")
        (sleep (camera_set_pan))
        (object_destroy "rotors_x09")
    )
)

(script dormant void x09_score_2
    (begin
        (sleep 92)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\music\x09_02_mus" none 1.0)
        (print "x09 score 01 start")
    )
)

(script dormant void x09_foley_2
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_02_fol" none 1.0)
        (print "x09 foley 02 start")
    )
)

(script dormant void cinematic_lighting_x09_02
    (begin
        (cinematic_lighting_set_primary_light -18.0 166.0 0.454902 0.435294 0.352941)
        (cinematic_lighting_set_secondary_light -10.0 78.0 0.152941 0.152941 0.227451)
        (cinematic_lighting_set_ambient_light 0.0862745 0.0862745 0.0862745)
        (object_uses_cinematic_lighting "index_x09" true)
    )
)

(script dormant void x09_dof_01
    (begin
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 0.5 1.0 1.0 0.0 0.0 0.0 0.0)
        (print "rack focus")
        (sleep 45)
        (cinematic_screen_effect_set_crossfade2 0.5 1.0 0.0 0.25 0.0 1.0 0.25)
        (print "rack focus")
    )
)

(script dormant void lift_deactivate
    (begin
        (sleep 93)
        (print "lift deactivate")
        (object_set_function_variable "x09_lift" "effect" 0.0 90.0)
        (sound_class_enable_ducker "device" 0.0 30)
    )
)

(script dormant void x09_miranda_emotion_02
    (begin
        (unit_set_emotional_state "miranda" "angry" 0.25 0)
        (sleep 137)
        (unit_set_emotional_state "miranda" "scared" 0.5 90)
    )
)

(script static void x09_02_setup
    (begin
        (wake x09_score_2)
        (wake x09_foley_2)
        (wake lift_deactivate)
        (wake x09_miranda_emotion_02)
        (wake cinematic_lighting_x09_02)
    )
)

(script static void x09_scene_02
    (begin
        (camera_pan 60.0 0)
        (x09_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_02" none "anchor_flag_x09_01")
        (custom_animation_relative "miranda" "objects\characters\miranda\x09\x09" "miranda_02" false "anchor_x09_01")
        (scenery_animation_start_relative "index_x09" "scenarios\objects\forerunner\industrial\index\index_full\x09\x09" "index_02" "anchor_x09_01")
        (sleep (- (camera_set_pan) prediction_offset))
        (x09_03_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_03_fol")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (cinematic_set_far_clip_distance)
    )
)

(script dormant void x09_foley_3
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_03_fol" none 1.0)
        (print "x09 foley 03 start")
    )
)

(script static void x09_problem_actors_04
    (begin
        (print "predict: problem actors")
        (object_create_anew "halo")
        (object_create_anew "matte_halo")
        (object_cinematic_lod "halo" true)
        (object_cinematic_lod "matte_halo" true)
    )
)

(script static void x09_03_setup
    (begin
        (object_create_anew "x09_halo_bang")
        (wake x09_foley_3)
    )
)

(script static void x09_scene_03
    (begin
        (sleep 15)
        (x09_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_03" none "anchor_flag_x09_03")
        (sleep 10)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (x09_04_predict_stub)
        (x09_problem_actors_04)
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_04_fol")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
    )
)

(script dormant void x09_foley_4
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_04_fol" none 1.0)
        (print "x09 foley 04 start")
    )
)

(script dormant void cinematic_lighting_x09_04
    (begin
        (cinematic_lighting_set_primary_light 34.0 146.0 0.51 0.79 0.99)
        (cinematic_lighting_set_secondary_light 6.0 118.0 0.18 0.22 0.41)
        (cinematic_lighting_set_ambient_light 0.05 0.05 0.05)
        (rasterizer_bloom_override_box_factor 0.75)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "halo" true)
    )
)

(script static void x09_04_setup
    (begin
        (object_create_anew "matte_substance")
        (object_create_anew "matte_high_charity")
        (object_cinematic_lod "matte_substance" true)
        (object_cinematic_lod "matte_high_charity" true)
        (object_create_anew "x09_halo_whimper")
        (wake x09_foley_4)
        (wake cinematic_lighting_x09_04)
    )
)

(script static void x09_scene_04_cleanup
    (begin
        (object_destroy "halo")
        (object_destroy_containing "matte")
    )
)

(script static void x09_scene_04
    (begin
        (x09_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_04" none "anchor_flag_x09_02")
        (scenery_animation_start_relative "halo" "scenarios\objects\forerunner\industrial\halo\x09\x09" "halo_04" "anchor_x09_02")
        (scenery_animation_start_relative "matte_halo" "objects\cinematics\matte_paintings\delta_halo_quarter\x09\x09" "delta_halo_quarter_04" "anchor_x09_02")
        (scenery_animation_start_relative "matte_substance" "objects\cinematics\matte_paintings\substance_space\x09\x09" "substance_space_04" "anchor_x09_02")
        (scenery_animation_start_relative "matte_high_charity" "objects\cinematics\matte_paintings\high_charity_exterior\x09\x09" "high_charity_exterior_04" "anchor_x09_02")
        (sleep 10)
        (cinematic_start 1.0 1.0 1.0 5)
        (sleep (- (camera_set_pan) prediction_offset))
        (x09_05_predict_stub)
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_05_fol")
        (sleep (- (camera_set_pan) 90.0))
        (cinematic_stop 0.0 0.0 0.0 90)
        (sleep 90)
        (x09_scene_04_cleanup)
    )
)

(script dormant void x09_foley_5
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_05_fol" none 1.0)
        (print "x09 foley 05 start")
    )
)

(script dormant void x09_0010_mir
    (begin
        (sleep 188)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0010_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x09_0010_mir" 1.0)
    )
)

(script dormant void x09_0020_gsp
    (begin
        (sleep 214)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0020_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "x09_0020_gsp" 1.0)
    )
)

(script dormant void x09_0030_mir
    (begin
        (sleep 251)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0030_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x09_0030_mir" 1.0)
    )
)

(script dormant void x09_0040_gsp
    (begin
        (sleep 280)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0040_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "x09_0040_gsp" 3.0)
    )
)

(script dormant void x09_0050_mir
    (begin
        (sleep 370)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0050_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x09_0050_mir" 2.0)
    )
)

(script dormant void x09_0060_gsp
    (begin
        (sleep 419)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0060_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "x09_0060_gsp" 2.0)
    )
)

(script dormant void x09_0070_mir
    (begin
        (sleep 469)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0070_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x09_0070_mir" 1.0)
    )
)

(script dormant void cinematic_lighting_x09_05
    (begin
        (cinematic_lighting_set_primary_light -18.0 220.0 0.286275 0.270588 0.219608)
        (cinematic_lighting_set_secondary_light 13.0 176.0 0.152941 0.152941 0.227451)
        (cinematic_lighting_set_ambient_light 0.0862745 0.0862745 0.0862745)
        (rasterizer_bloom_override_box_factor 0.4)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "miranda" true)
        (object_uses_cinematic_lighting "johnson" true)
        (object_uses_cinematic_lighting "monitor" true)
        (object_uses_cinematic_lighting "index_x09" true)
    )
)

(script dormant void beacon_shuffle
    (begin
        (sleep 140)
        (print "beacon 01 -> beacon 02")
        (object_destroy "beacon_01")
        (object_create_anew "beacon_02")
    )
)

(script dormant void x09_miranda_emotion_05
    (begin
        (sleep 467)
        (unit_set_emotional_state "miranda" "angry" 0.5 30)
    )
)

(script static void x09_05_setup
    (begin
        (object_destroy "e13_rotors")
        (object_destroy "x09_lift")
        (object_create_anew "johnson")
        (object_create_anew "monitor")
        (object_create_anew "beacon_01")
        (object_cinematic_lod "johnson" true)
        (object_cinematic_lod "monitor" true)
        (unit_set_emotional_state "miranda" "inquisitive" 1.0 0)
        (wake x09_miranda_emotion_05)
        (wake x09_foley_5)
        (wake x09_0010_mir)
        (wake x09_0020_gsp)
        (wake x09_0030_mir)
        (wake x09_0040_gsp)
        (wake x09_0050_mir)
        (wake x09_0060_gsp)
        (wake x09_0070_mir)
        (wake beacon_shuffle)
        (wake cinematic_lighting_x09_05)
        (interpolator_stop "x09_fog" 1.0 1.0)
    )
)

(script static void x09_scene_05
    (begin
        (x09_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_05" none "anchor_flag_x09_01")
        (custom_animation_relative "miranda" "objects\characters\miranda\x09\x09" "miranda_05" false "anchor_x09_01")
        (custom_animation_relative "johnson" "objects\characters\marine\x09\x09" "johnson_05" false "anchor_x09_01")
        (custom_animation_relative "monitor" "objects\characters\monitor\x09\x09" "monitor_05" false "anchor_x09_01")
        (scenery_animation_start_relative "index_x09" "scenarios\objects\forerunner\industrial\index\index_full\x09\x09" "index_05" "anchor_x09_01")
        (sleep 15)
        (cinematic_start 0.0 0.0 0.0 90)
        (sleep (- (camera_set_pan) prediction_offset))
        (x09_06_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_06_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x09_foley_6
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_06_fol" none 1.0)
        (print "x09 foley 06 start")
    )
)

(script dormant void x09_0080_gsp
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0080_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "x09_0080_gsp" 10.0)
    )
)

(script dormant void x09_0090_mir
    (begin
        (sleep 310)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0090_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x09_0090_mir" 2.0)
    )
)

(script dormant void x09_0100_gsp
    (begin
        (sleep 386)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0100_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "x09_0100_gsp" 1.0)
    )
)

(script dormant void x09_0110_jon
    (begin
        (sleep 430)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0110_jon" "johnson" 1.0)
        (attract_mode_set_seconds "x09_0110_jon" 2.0)
    )
)

(script dormant void x09_0120_mir
    (begin
        (sleep 494)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0120_mir" "miranda" 1.0)
        (attract_mode_set_seconds "x09_0120_mir" 4.0)
        (sleep 30)
    )
)

(script dormant void x09_0130_gsp
    (begin
        (sleep 675)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0130_gsp" "monitor" 1.0)
        (attract_mode_set_seconds "x09_0130_gsp" 2.0)
    )
)

(script dormant void x09_0140_der
    (begin
        (sleep 742)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0140_der" "dervish" 1.0)
        (attract_mode_set_seconds "x09_0140_der" 3.0)
    )
)

(script dormant void cinematic_lighting_x09_06
    (begin
        (cinematic_lighting_set_primary_light -18.0 220.0 0.286275 0.270588 0.219608)
        (cinematic_lighting_set_secondary_light 13.0 176.0 0.152941 0.152941 0.227451)
        (cinematic_lighting_set_ambient_light 0.0862745 0.0862745 0.0862745)
        (object_uses_cinematic_lighting "dervish" true)
    )
)

(script dormant void x09_miranda_emotion_06a
    (begin
        (sleep 310)
        (unit_set_emotional_state "miranda" "scared" 0.5 60)
    )
)

(script dormant void x09_miranda_emotion_06b
    (begin
        (sleep 525)
        (unit_set_emotional_state "miranda" "pain" 0.25 90)
    )
)

(script dormant void x09_miranda_emotion_06c
    (begin
        (sleep 776)
        (unit_set_emotional_state "miranda" "shocked" 0.25 30)
    )
)

(script dormant void x09_johnson_emotion_06a
    (begin
        (sleep 440)
        (unit_set_emotional_state "johnson" "angry" 0.75 60)
        (sleep 54)
        (unit_set_emotional_state "johnson" "shocked" 0.25 30)
    )
)

(script dormant void x09_johnson_emotion_06b
    (begin
        (sleep 784)
        (unit_set_emotional_state "johnson" "shocked" 0.25 30)
    )
)

(script static void x09_06_setup
    (begin
        (object_destroy "beacon_02")
        (object_create_anew "beacon_03")
        (device_set_position "beacon_03" 1.0)
        (object_create_anew "dervish")
        (object_cinematic_lod "dervish" true)
        (unit_set_emotional_state "miranda" "angry" 0.25 0)
        (unit_set_emotional_state "johnson" "angry" 0.25 0)
        (wake x09_miranda_emotion_06a)
        (wake x09_miranda_emotion_06b)
        (wake x09_miranda_emotion_06c)
        (wake x09_johnson_emotion_06a)
        (wake x09_johnson_emotion_06b)
        (wake x09_foley_6)
        (wake x09_0080_gsp)
        (wake x09_0090_mir)
        (wake x09_0100_gsp)
        (wake x09_0110_jon)
        (wake x09_0120_mir)
        (wake x09_0130_gsp)
        (wake x09_0140_der)
    )
)

(script static void x09_scene_06_cleanup
    (begin
        (object_destroy "dervish")
        (object_destroy "miranda")
        (object_destroy "johnson")
        (object_destroy "monitor")
        (object_destroy "index_x09")
    )
)

(script static void x09_scene_06
    (begin
        (x09_06_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_06" none "anchor_flag_x09_01")
        (custom_animation_relative "dervish" "objects\characters\dervish\x09\x09" "dervish_06" false "anchor_x09_01")
        (custom_animation_relative "miranda" "objects\characters\miranda\x09\x09" "miranda_06" false "anchor_x09_01")
        (custom_animation_relative "johnson" "objects\characters\marine\x09\x09" "johnson_06" false "anchor_x09_01")
        (custom_animation_relative "monitor" "objects\characters\monitor\x09\x09" "monitor_06" false "anchor_x09_01")
        (scenery_animation_start_relative "index_x09" "scenarios\objects\forerunner\industrial\index\index_full\x09\x09" "index_06" "anchor_x09_01")
        (sleep (- (camera_set_pan) prediction_offset))
        (x09_07_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_07_fol")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 0.0 0.0 0.0 5)
        (sleep 5)
        (x09_scene_06_cleanup)
    )
)

(script dormant void x09_foley_7
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_07_fol" none 1.0)
        (print "x09 foley 07 start")
    )
)

(script dormant void x09_0150_to1
    (begin
        (sleep 100)
        (sound_impulse_time "sound\dialog\levels\08_controlroom\cinematic\x09_0150_to1" none 1.0 "radio_default_in")
        (attract_mode_set_seconds "x09_0150_to1" 3.0)
    )
)

(script dormant void cinematic_lighting_x09_07
    (begin
        (cinematic_lighting_set_primary_light 16.0 -32.0 0.8 0.6 0.4)
        (cinematic_lighting_set_secondary_light 20.0 180.0 0.3 0.3 0.5)
        (cinematic_lighting_set_ambient_light 0.2 0.2 0.2)
        (object_uses_cinematic_lighting "forerunner_ship" true)
    )
)

(script static void x09_problem_actors_08
    (begin
        (print "problem actors")
        (object_create_anew "chief")
        (object_create_anew "x09_alcove")
        (object_create_anew "bloom_quad")
        (object_cinematic_lod "chief" true)
        (object_cinematic_lod "x09_alcove" true)
    )
)

(script static void x09_07_setup
    (begin
        (object_create_anew "slipspace")
        (object_create_anew_containing "earth_battle")
        (object_create_anew "forerunner_ship")
        (object_create_anew "matte_earth")
        (object_create_anew "matte_moon")
        (object_cinematic_lod "forerunner_ship" true)
        (object_cinematic_lod "matte_earth" true)
        (object_cinematic_lod "matte_moon" true)
        (wake x09_foley_7)
        (wake x09_0150_to1)
        (wake cinematic_lighting_x09_07)
    )
)

(script static void x09_scene_07_cleanup
    (begin
        (object_destroy "slipspace")
        (object_destroy_containing "earth_battle")
        (object_destroy "forerunner_ship")
        (object_destroy_containing "matte")
    )
)

(script static void x09_scene_07
    (begin
        (sleep 60)
        (x09_07_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_07" none "anchor_flag_x09_02")
        (scenery_animation_start_relative "forerunner_ship" "objects\cinematics\forerunner\forerunner_ship\x09\x09" "forerunner_ship_07" "anchor_x09_02")
        (scenery_animation_start_relative "cairo" "scenarios\objects\solo\spacestation\ss_prop\x09\x09" "ss_prop_07" "anchor_x09_02")
        (scenery_animation_start_relative "matte_earth" "objects\cinematics\matte_paintings\earth_space\x09\x09" "earth_space_07" "anchor_x09_02")
        (scenery_animation_start_relative "matte_moon" "objects\cinematics\matte_paintings\moon\x09\x09" "moon_07" "anchor_x09_02")
        (cinematic_start 0.0 0.0 0.0 5)
        (sleep (- (camera_set_pan) prediction_offset))
        (x09_08_predict_stub)
        (x09_problem_actors_08)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\music\x09_08_mus")
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x09\foley\x09_03_fol")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 1.0 1.0 1.0 5)
        (sleep 5)
        (x09_scene_07_cleanup)
    )
)

(script dormant void x09_score_8
    (begin
        (sleep 338)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\music\x09_08_mus" none 1.0)
        (print "x09 score 08 start")
    )
)

(script dormant void x09_foley_8
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x09\foley\x09_08_fol" none 1.0)
        (print "x09 foley 08 start")
    )
)

(script dormant void x09_0160_lhd
    (begin
        (sleep 0)
        (sound_impulse_time "sound\dialog\levels\08_controlroom\cinematic\x09_0160_lhd" none 1.0 "radio_default_loop")
        (attract_mode_set_seconds "x09_0160_lhd" 2.0)
    )
)

(script dormant void x09_0180_mas
    (begin
        (sleep 69)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0180_mas" "chief" 1.0)
        (attract_mode_set_seconds "x09_0180_mas" 2.0)
    )
)

(script dormant void x09_0190_mas
    (begin
        (sleep 132)
        (sound_impulse_time "sound\dialog\levels\08_controlroom\cinematic\x09_0190_mas" none 1.0 "radio_default_out")
        (attract_mode_set_seconds "x09_0190_mas" 2.0)
    )
)

(script dormant void x09_0200_lhd
    (begin
        (sleep 183)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0200_lhd" "hood" 1.0)
        (attract_mode_set_seconds "x09_0200_lhd" 1.0)
    )
)

(script dormant void x09_0210_lhd
    (begin
        (sleep 232)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0210_lhd" "hood" 1.0)
        (attract_mode_set_seconds "x09_0210_lhd" 3.0)
    )
)

(script dormant void x09_0220_mas
    (begin
        (sleep 342)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x09_0220_mas" "chief" 1.0)
        (attract_mode_set_seconds "x09_0220_mas" 3.0)
    )
)

(script dormant void cinematic_light_x09_chief_01
    (begin
        (print "light chief 01")
        (cinematic_lighting_set_primary_light -20.0 278.0 0.388235 0.427451 0.494118)
        (cinematic_lighting_set_secondary_light 42.0 224.0 0.0431373 0.0431373 0.0666667)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "chief" true)
        (object_uses_cinematic_lighting "hood" true)
        (object_uses_cinematic_lighting "cairo_bridge" true)
        (object_uses_cinematic_lighting "x09_alcove" true)
    )
)

(script dormant void cinematic_light_x09_hood_01
    (begin
        (sleep 124)
        (print "light hood 01")
        (cinematic_lighting_set_primary_light 0.0 94.0 0.47451 0.443137 0.333333)
        (cinematic_lighting_set_secondary_light 0.0 320.0 0.184314 0.176471 0.266667)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (rasterizer_bloom_override_box_factor 0.75)
        (rasterizer_bloom_override_max_factor 0.5)
    )
)

(script dormant void final_explosion
    (begin
        (rasterizer_profile_include_all)
        (sleep 135)
        (object_create_anew_containing "blast_base")
        (effect_new_on_object_marker "effects\cinematics\01_outro\covenant_tiny_explosion" "blast_base" "marker")
        (sleep 110)
        (effect_new_on_object_marker "effects\cinematics\01_outro\covenant_tiny_explosion" "blast_base2" "marker")
    )
)

(script dormant void cinematic_light_x09_chief_02
    (begin
        (sleep 277)
        (print "light chief 02")
        (cinematic_lighting_set_primary_light -20.0 278.0 0.388235 0.427451 0.494118)
        (cinematic_lighting_set_secondary_light 42.0 224.0 0.0431373 0.0431373 0.0666667)
        (cinematic_lighting_set_ambient_light 0.0 0.0 0.0)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
    )
)

(script dormant void x09_hood_emotion_08
    (begin
        (sleep 43)
        (unit_set_emotional_state "hood" "shocked" 0.5 30)
        (sleep 45)
        (unit_set_emotional_state "hood" "happy" 0.25 90)
    )
)

(script dormant void shake_chief
    (begin
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.75 0.0)
        (sleep 15)
        (hud_blink_health 3.0)
    )
)

(script static void x09_08_setup
    (begin
        (object_create_anew "hood")
        (object_create_anew "cairo_bridge")
        (object_cinematic_lod "hood" true)
        (object_cinematic_lod "cairo_bridge" true)
        (object_create_anew_containing "cairo_effect")
        (unit_set_emotional_state "hood" "angry" 0.5 0)
        (wake x09_hood_emotion_08)
        (wake x09_score_8)
        (wake x09_foley_8)
        (wake x09_0160_lhd)
        (wake x09_0180_mas)
        (wake x09_0190_mas)
        (wake x09_0200_lhd)
        (wake x09_0210_lhd)
        (wake x09_0220_mas)
        (wake shake_chief)
        (wake final_explosion)
        (wake cinematic_light_x09_chief_01)
        (wake cinematic_light_x09_hood_01)
        (wake cinematic_light_x09_chief_02)
    )
)

(script static void x09_scene_08_cleanup
    (begin
        (object_destroy "chief")
        (object_destroy "hood")
        (object_destroy "cairo_bridge")
        (object_destroy "x09_alcove")
        (object_destroy "bloom_quad")
        (object_destroy_containing "blast_base")
    )
)

(script static void x09_scene_08
    (begin
        (x09_08_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x09\x09" "x09_08" none "anchor_flag_x09_02")
        (custom_animation_relative "chief" "objects\characters\masterchief\x09\x09" "chief_08" false "anchor_x09_02")
        (custom_animation_relative "hood" "objects\characters\lord_hood\x09\x09" "hood_08" false "anchor_x09_02")
        (scenery_animation_start_relative "cairo_bridge" "objects\cinematics\human\cairo_bridge\x09\x09" "cairo_bridge_08" "anchor_x09_02")
        (scenery_animation_start_relative "x09_alcove" "objects\cinematics\forerunner\forerunner_ship_alcove\x09\x09" "alcove_08" "anchor_x09_02")
        (scenery_animation_start_relative "bloom_quad" "scenarios\objects\special\bloom_quad\x09\x09" "bloom_quad_08" "anchor_x09_02")
        (sleep 10)
        (cinematic_start 1.0 1.0 1.0 5)
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 0.0 0.0 0.0 5)
        (sleep 5)
        (sleep 401)
        (x09_scene_08_cleanup)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script dormant void x10_score_1
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x10\music\x10_01_mus" none 1.0)
        (print "x10 score 01 start")
    )
)

(script dormant void x10_foley_1
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\08_deltacliffs\x10\foley\x10_01_fol" none 1.0)
        (print "x10 foley 01 start")
    )
)

(script dormant void x10_0010_grv
    (begin
        (sleep 496)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x10_0010_grv" none 1.0)
        (attract_mode_set_seconds "x10_0010_grv" 6.0)
    )
)

(script dormant void cinematic_lighting_x10_01
    (begin
        (cinematic_lighting_set_primary_light 51.0 28.0 0.380392 0.384314 0.341176)
        (cinematic_lighting_set_secondary_light -53.0 202.0 0.0588235 0.356863 0.356863)
        (cinematic_lighting_set_ambient_light 0.0901961 0.117647 0.0823529)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "tentacle_01" true)
        (object_uses_cinematic_lighting "tentacle_02" true)
        (object_uses_cinematic_lighting "tentacle_03" true)
        (object_uses_cinematic_lighting "tentacle_04" true)
    )
)

(script static void x10_problem_actors_01
    (begin
        (print "problem actors")
        (object_create_anew "spore_01")
        (object_create_anew "spore_02")
        (object_create_anew "spore_03")
        (object_cinematic_lod "spore_01" true)
        (object_cinematic_lod "spore_02" true)
        (object_cinematic_lod "spore_03" true)
    )
)

(script static void x10_scene_01_setup
    (begin
        (object_create_anew "x09_chamber_door")
        (object_create_anew "tentacle_01")
        (object_create_anew "tentacle_02")
        (object_create_anew "tentacle_03")
        (object_create_anew "tentacle_04")
        (object_cinematic_lod "x09_chamber_door" true)
        (object_cinematic_lod "tentacle_01" true)
        (object_cinematic_lod "tentacle_02" true)
        (object_cinematic_lod "tentacle_03" true)
        (object_cinematic_lod "tentacle_04" true)
        (object_cinematic_visibility "tentacle_01" true)
        (object_cinematic_visibility "tentacle_02" true)
        (object_cinematic_visibility "tentacle_03" true)
        (object_cinematic_visibility "tentacle_04" true)
        (wake x10_score_1)
        (wake x10_foley_1)
        (wake x10_0010_grv)
        (wake cinematic_lighting_x10_01)
    )
)

(script static void x10_scene_01_cleanup
    (begin
        (object_destroy "x09_chamber_door")
        (object_destroy_containing "spore")
    )
)

(script static void x10_scene_01
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "deltacontrol_2")
        (cinematic_skip_start_internal)
        (set_rasterizer_gamma)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (animation_cache_stats_reset 0.0)
        (cinematic_move_attached_objects 0.0 1.0)
        (x10_problem_actors_01)
        (x10_01_predict_stub)
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x10\music\x10_01_mus")
        (sound_impulse_start "sound\cinematics\08_deltacliffs\x10\foley\x10_01_fol")
        (sleep prediction_offset)
        (x10_scene_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x10\x10" "x10_01" none "anchor_flag_x10")
        (scenery_animation_start_relative "x09_chamber_door" "scenarios\objects\solo\highcharity\high_door_grand\x10\x10" "high_door_grand_01" "anchor_x10")
        (scenery_animation_start_relative "spore_01" "objects\cinematics\flood\flood_spore\x10\x10" "spore01_01" "anchor_x10")
        (scenery_animation_start_relative "spore_02" "objects\cinematics\flood\flood_spore\x10\x10" "spore02_01" "anchor_x10")
        (scenery_animation_start_relative "spore_03" "objects\cinematics\flood\flood_spore\x10\x10" "spore03_01" "anchor_x10")
        (scenery_animation_start_relative "tentacle_01" "objects\characters\gravemind\tentacle_capture\x10\x10" "tentacle01_01" "anchor_x10")
        (scenery_animation_start_relative "tentacle_02" "objects\characters\gravemind\tentacle_capture\x10\x10" "tentacle02_01" "anchor_x10")
        (scenery_animation_start_relative "tentacle_03" "objects\characters\gravemind\tentacle_capture\x10\x10" "tentacle03_01" "anchor_x10")
        (cinematic_start 0.0 0.0 0.0 60)
        (sleep (- (camera_set_pan) prediction_offset))
        (x10_02_predict_stub)
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) 1.0))
        (cinematic_screen_effect_stop 2.0)
        (sleep 1)
        (x10_scene_01_cleanup)
    )
)

(script dormant void x10_score_2
    (begin
        (sleep 553)
        (sound_looping_stop_immediately "sound\cinematics\08_deltacliffs\x10\music\x10_02_mus" none 1.0)
        (print "x10 score 02 start")
    )
)

(script dormant void x10_0020_grv
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x10_0020_grv" none 1.0)
        (attract_mode_set_seconds "x10_0020_grv" 8.0)
    )
)

(script dormant void x10_0030_grv
    (begin
        (sleep 260)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x10_0030_grv" none 1.0)
        (attract_mode_set_seconds "x10_0030_grv" 5.0)
    )
)

(script dormant void x10_0040_cor
    (begin
        (sleep 496)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x10_0040_cor" "cortana" 1.0)
        (attract_mode_set_seconds "x10_0040_cor" 1.0)
    )
)

(script dormant void x10_0041_cor
    (begin
        (sleep 520)
        (unit_set_emotional_state "cortana" "pain" 0.25 60)
        (print "cortana - pain .25 60")
        (sleep 30)
        (sound_impulse_start_effect "sound\dialog\levels\08_controlroom\cinematic\x10_0041_cor" "cortana" 1.0)
        (attract_mode_set_seconds "x10_0041_cor" 1.0)
    )
)

(script dormant void cinematic_lighting_x10_02
    (begin
        (cinematic_lighting_set_primary_light 51.0 28.0 0.380392 0.384314 0.341176)
        (cinematic_lighting_set_secondary_light -53.0 202.0 0.0588235 0.356863 0.356863)
        (cinematic_lighting_set_ambient_light 0.0901961 0.117647 0.0823529)
        (object_uses_cinematic_lighting "cortana" true)
    )
)

(script dormant void effect_cortana_appear
    (begin
        (sleep 410)
        (print "cortana appears")
        (effect_new_on_object_marker "effects\objects\characters\cortana\cortana_on_off_65" "cortana_stand" "marker")
    )
)

(script static void x10_scene_02_setup
    (begin
        (object_create_anew "cortana")
        (object_cinematic_lod "cortana" true)
        (object_create_anew "cortana_stand")
        (unit_set_emotional_state "cortana" "repulsed" 0.5 0)
        (print "cortana - repulsed .5 0")
        (wake x10_score_2)
        (wake x10_0020_grv)
        (wake x10_0030_grv)
        (wake x10_0040_cor)
        (wake x10_0041_cor)
        (wake effect_cortana_appear)
        (wake cinematic_lighting_x10_02)
        (cinematic_set_environment_map_attenuation 0.05)
        (print "setting near clip distance to .05")
    )
)

(script static void x10_scene_02_cleanup
    (begin
        (object_destroy_containing "cortana")
        (object_destroy_containing "tentacle")
    )
)

(script static void x10_scene_02
    (begin
        (rasterizer_profile_include_all)
        (x10_scene_02_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x10\x10" "x10_02" none "anchor_flag_x10")
        (custom_animation_relative "cortana" "objects\characters\cortana\x10\x10" "cortana_02" false "anchor_x10")
        (scenery_animation_start_relative "tentacle_01" "objects\characters\gravemind\tentacle_capture\x10\x10" "tentacle01_02" "anchor_x10")
        (scenery_animation_start_relative "tentacle_02" "objects\characters\gravemind\tentacle_capture\x10\x10" "tentacle02_02" "anchor_x10")
        (scenery_animation_start_relative "tentacle_03" "objects\characters\gravemind\tentacle_capture\x10\x10" "tentacle03_02" "anchor_x10")
        (scenery_animation_start_relative "tentacle_04" "objects\characters\gravemind\tentacle_capture\x10\x10" "tentacle04_02" "anchor_x10")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 0.0 0.0 0.0 5)
        (sleep 5)
        (cinematic_set_environment_map_attenuation 0.06)
        (print "setting near clip distance to .06")
        (sleep 328)
    )
)

(script static void x10
    (begin
        (crash high_0)
        (sleep 1)
        (x10_scene_01)
        (x10_scene_02)
    )
)

(script static void x09
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash deltacontrolroom_bsp4)
        (sleep 1)
        (sound_class_enable_ducker "amb" 0.0 15)
        (x09_scene_01)
        (x09_scene_02)
        (crash deltacontrolroom_bsp0)
        (sleep 1)
        (x09_scene_03)
        (x09_scene_04)
        (crash deltacontrolroom_bsp4)
        (sleep 1)
        (x09_scene_05)
        (x09_scene_06)
        (crash deltacontrolroom_bsp0)
        (sleep 1)
        (x09_scene_07)
        (x09_scene_08)
        (sleep 90)
        (print "90 ticks of black instead of credits")
        (x10)
        (sleep 30)
        (print "30 ticks of black for marty2")
        (game_revert)
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

(script static void cinematic_intro
    (begin
        (if (cinematic_skip_start) 
            (begin
                (c08_intra1)
            )
        )
        (cinematic_skip_stop)
    )
)

(script static void cinematic_johnson_ledge
    (begin
        (if (cinematic_skip_start) 
            (begin
                (c08_intra2)
            )
        )
        (cinematic_skip_stop)
    )
)

(script static void cinematic_tartarus_fight
    (begin
        (if (cinematic_skip_start) 
            (begin
                (c08_intra3)
            )
        )
        (cinematic_skip_stop)
    )
)

(script static void cinematic_epilogue
    (begin
        (x09)
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
        (sleep 180)
        (input_suppress_vibration 4)
    )
)

(script dormant void objective4_clear
    (begin
        (update_remote_camera 4)
    )
)

(script dormant void music_08b_01_stop
    (begin
        (print "music 08b_01 stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_01")
    )
)

(script dormant void music_08b_01_start_alt
    (begin
        (print "music 08b_01 start alt")
        (sound_class_show_channel "scenarios\solo\08b_deltacontrol\08b_music\08b_01" true)
    )
)

(script dormant void music_08b_01_start
    (begin
        (print "music 08b_01 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_01" none 1.0)
    )
)

(script dormant void music_08b_02_stop
    (begin
        (print "music 08b_02 stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_02")
    )
)

(script dormant void music_08b_02_start
    (begin
        (print "music 08b_02 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_02" none 1.0)
    )
)

(script dormant void music_08b_03_stop
    (begin
        (print "music 08b_03 stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_03")
    )
)

(script dormant void music_08b_03_start
    (begin
        (print "music 08b_03 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_03" none 1.0)
    )
)

(script dormant void music_08b_04_stop
    (begin
        (print "music 08b_04 stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_04")
    )
)

(script dormant void music_08b_04_start
    (begin
        (print "music 08b_04 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_04" none 1.0)
    )
)

(script dormant void music_08b_05_stop
    (begin
        (print "music 08b_05 stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_05")
    )
)

(script dormant void music_08b_05_start_alt
    (begin
        (print "music 08b_05 start alt")
        (sound_class_show_channel "scenarios\solo\08b_deltacontrol\08b_music\08b_05" true)
    )
)

(script dormant void music_08b_05_start
    (begin
        (print "music 08b_05 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_05" none 1.0)
    )
)

(script dormant void music_08b_06_start
    (begin
        (print "music 08b_06 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_06" none 1.0)
    )
)

(script dormant void music_08b_07_start
    (begin
        (print "music 08b_07 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_07" none 1.0)
    )
)

(script dormant void music_08b_08_start
    (begin
        (print "music 08b_08 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_08" none 1.0)
    )
)

(script dormant void music_08b_09_stop
    (begin
        (print "music 08b_09 stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_09")
    )
)

(script dormant void music_08b_09_start_alt
    (begin
        (print "music 08b_09 start alt")
        (sound_class_show_channel "scenarios\solo\08b_deltacontrol\08b_music\08b_09" true)
    )
)

(script dormant void music_08b_09_start
    (begin
        (print "music 08b_09 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_09" none 1.0)
    )
)

(script dormant void music_08b_10_stop
    (begin
        (print "music 08b_10 stop")
        (sound_looping_set_scale "scenarios\solo\08b_deltacontrol\08b_music\08b_10")
    )
)

(script dormant void music_08b_10_start
    (begin
        (print "music 08b_10 start")
        (sound_looping_stop_immediately "scenarios\solo\08b_deltacontrol\08b_music\08b_10" none 1.0)
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
        (device_animate_position "scarab" 1.0 6.5 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_var0_no_block
    (begin
        (print "scarab_idle_var0")
        (device_set_position_track "scarab" "combat:idle:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
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

(script static void scarab_walk_front_var0
    (begin
        (print "scarab_walk_front_var0")
        (device_set_position_track "scarab" "combat:walk_front:var0" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
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

(script static void scarab_idle_turn_15_left
    (begin
        (print "scarab_idle_turn_15_left")
        (device_set_position_track "scarab" "combat:turn_15_left" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_turn_15_right
    (begin
        (print "scarab_idle_turn_15_right")
        (device_set_position_track "scarab" "combat:turn_15_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_turn_15_right_slow
    (begin
        (print "scarab_idle_turn_15_right_slow")
        (device_set_position_track "scarab" "combat:turn_15_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
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

(script static void scarab_idle_turn_22_right
    (begin
        (print "scarab_idle_turn_22_right")
        (device_set_position_track "scarab" "combat:turn_22_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 4.0 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
    )
)

(script static void scarab_idle_turn_22_right_slow
    (begin
        (print "scarab_idle_turn_22_right_slow")
        (device_set_position_track "scarab" "combat:turn_22_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
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

(script static void scarab_idle_turn_45_right_slow
    (begin
        (print "scarab_idle_turn_45_right_slow")
        (device_set_position_track "scarab" "combat:turn_45_right" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 6.0 0.0 0.0 true)
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

(script static void scarab_walk_front_turn_22_right
    (begin
        (print "scarab_walk_front_turn_22_right")
        (device_set_position_track "scarab" "combat:walk_front_turn_22_right" g_scarab_interpolation)
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

(script static void scarab_gun_open_up
    (begin
        (device_set_overlay_track "scarab" "combat:fire_open")
        (device_animate_overlay "scarab" 1.0 3.5 0.0 0.0)
    )
)

(script static void scarab_gun_fire_up
    (begin
        (device_set_overlay_track "scarab" "combat:fire")
        (device_animate_overlay "scarab" 1.0 6.0 0.0 0.0)
    )
)

(script static void scarab_gun_close_up
    (begin
        (device_set_overlay_track "scarab" "combat:fire_close")
        (device_animate_overlay "scarab" 1.0 3.5 0.0 0.0)
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

(script static void scarab_gun_fire_down_abort
    (begin
        (device_animate_overlay "scarab" 0.0 3.0 0.0 0.0)
    )
)

(script static void scarab_gun_close_down
    (begin
        (device_set_overlay_track "scarab" "combat:fire_down_close")
        (device_animate_overlay "scarab" 1.0 3.5 0.0 0.0)
    )
)

(script dormant void e13_main
    (begin
        (set g_e13_started true)
        (game_save_no_timeout)
        (print "e13_main")
        (data_mine_insert "e13_control_room")
        (device_operates_automatically_set "e12_door0" false)
        (tartarus_boss_fight)
        (wake objective3_clear)
        (set g_mission_over true)
    )
)

(script dormant void e13_cinematic_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e13_cutscene_trigger1" (players))
                (and
                    (volume_test_objects "tv_e13_cutscene_trigger0" (players))
                    (objects_can_see_flag (players) "e13_cutscene_trigger" 15.0)
                )
            ) 
        15)
        (cinematic_fade_to_white)
        (object_teleport (player0) "player0_stash")
        (object_teleport (player1) "player1_stash")
        (cinematic_tartarus_fight)
        (ui_error_ok_cancel)
        (sound_class_enable_ducker "amb" 0.0 0)
        (sleep 1)
        (sound_class_enable_ducker "amb" 1.0 15)
        (crash deltacontrolroom_bsp4)
        (wake e13_main)
        (cinematic_fade_from_white)
    )
)

(script command_script void cs_e12_cov_phantom0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_by e12_cov_phantom0_entry/p0)
        (cs_fly_by e12_cov_phantom0_entry/p1)
        (cs_vehicle_boost true)
        (cs_fly_by e12_cov_phantom0_entry/p1_1)
        (cs_vehicle_boost false)
        (cs_fly_by e12_cov_phantom0_entry/p1_2)
        (cs_fly_to e12_cov_phantom0_entry/p2)
        (cs_face true e12_cov_phantom0_entry/p2_facing)
        (cs_fly_to e12_cov_phantom0_entry/p3 1.0)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) true)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_a01)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_a02)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_a03)
        (sleep 45)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_b01)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_b02)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_b03)
        (sleep 60)
        (object_set_phantom_power (ai_vehicle_get ai_current_actor) false)
        (cs_face false e12_cov_phantom0_entry/p2_facing)
        (cs_fly_to e12_cov_phantom0_entry/p4)
        (cs_face true e12_cov_phantom0_entry/p4_facing)
        (cs_enable_targeting true)
        (cs_enable_moving true)
        (sleep_until (= (version) 2) 15)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e12_pro_inf0_1_wait
    (begin
        (cs_crouch true)
        (sleep_until (ai_trigger_test "e12_pro_inf0_sighted_player" "e12_pro_inf0") 15)
    )
)

(script command_script void cs_e12_pro_inf0_wait0
    (begin
        (cs_crouch true)
        (cs_face true e12_patrol/s0)
        (sleep_until (> (device_get_position "e12_door0") 0.0) 15)
        (cs_shoot_point true e12_patrol/s0)
        (sleep 30)
        (cs_go_to e12_patrol/p0)
        (sleep 30)
    )
)

(script command_script void cs_e12_pro_inf0_wait1
    (begin
        (cs_crouch true)
        (cs_face true e12_patrol/s1)
        (sleep_until (> (device_get_position "e12_door0") 0.0) 15)
        (cs_shoot_point true e12_patrol/s1)
        (sleep 30)
        (cs_go_to e12_patrol/p1)
        (sleep 30)
    )
)

(script command_script void cs_e12_cov_inf0_look
    (begin
        (cs_face_player true)
        (sleep_forever)
    )
)

(script command_script void cs_e12_cov_inf0_follow
    (begin
        (sleep 1)
    )
)

(script command_script void cs_e12_pro_inf0_captain
    (begin
        (cs_enable_targeting true)
        (cs_enable_moving true)
        (sleep_until (> (ai_combat_status ai_current_actor) ai_combat_status_active))
        (cs_enable_moving false)
        (cs_look_player true)
        (sleep (random_range 15 30))
        (print "cpn: do not let them enter!")
        (sleep (ai_play_line ai_current_actor "0940"))
        (sleep 20)
        (cs_enable_moving true)
        (print "cpn: tartar sauce must complete his tasty condiments")
        (sleep (ai_play_line ai_current_actor "0950"))
    )
)

(script command_script void cs_e12_pro_inf0_berserker
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (sleep_until (> (ai_combat_status ai_current_actor) ai_combat_status_active))
        (sleep (random_range 0 30))
        (ai_berserk ai_current_actor true)
    )
)

(script command_script void cs_e12_cov_banshee0_entry
    (begin
        (object_cannot_die (ai_vehicle_get ai_current_actor) true)
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_to e12_cov_banshees0/p2 5.0)
        (cs_vehicle_boost false)
        (cs_fly_to e12_cov_banshees0/p2 0.5)
        (ai_vehicle_reserve (ai_vehicle_get ai_current_actor) true)
        (ai_vehicle_exit ai_current_actor)
        (sleep 30)
    )
)

(script dormant void e12_pro_inf0_main
    (begin
        (sleep_until (= (version) 2) 15)
        (sleep_until (volume_test_objects "tv_e12_chamber_entered" (players)) 15)
        (ai_place "e12_pro_inf0_1")
        (wake music_08b_09_start)
        (sleep_until 
            (and
                (<= (ai_living_count "e12_pro_inf0") 1)
                (<= (device_get_position "e12_door1") 0.0)
            )
        )
        (game_saving)
        (ai_place "e12_pro_inf0_2")
        (wake music_08b_09_start_alt)
        (wake music_08b_10_start)
        (sleep_until 
            (or
                (<= (ai_living_count "e12_pro_inf0") 0)
                (volume_test_objects "tv_e13_cutscene_trigger0" (players))
            ) 
        15)
        (device_one_sided_set "e12_door1" false)
        (device_closes_automatically_set "e12_door1" false)
        (device_set_position "e12_door1" 1.0)
        (wake music_08b_09_stop)
        (wake music_08b_10_stop)
    )
)

(script dormant void e12_pro_inf0_ender
    (begin
        (sleep_until (volume_test_objects "tv_e12_pro_inf0_end" (players)) 15)
        (sleep_forever e12_pro_inf0_main)
        (device_one_sided_set "e12_door1" false)
        (device_closes_automatically_set "e12_door1" false)
        (device_set_position "e12_door1" 1.0)
        (wake music_08b_09_stop)
        (wake music_08b_10_stop)
    )
)

(script dormant void e12_cov_phantom0_main
    (begin
        (ai_place "e12_cov_phantom0")
    )
)

(script dormant void e12_cov_banshees0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e12_ledge" (players))
                (volume_test_objects "tv_e12_cov_banshee0_begin" (players))
                (not (player_in_vehicle))
            ) 
        15)
        (if (volume_test_objects "tv_e12_ledge" (players)) 
            (sleep_forever))
        (sleep_until (not (objects_can_see_flag (players) "e12_cov_banshees0_spawn" 80.0)) 15)
        (ai_place "e12_cov_banshees0")
        (sleep_until (player_in_vehicle) 30 450)
        (if (player_in_vehicle) 
            (sleep_forever))
        (deactivate_nav_point_object default player (ai_vehicle_get_from_starting_location "e12_cov_banshees0/banshee0") 1.0)
        (sleep_until (player_in_vehicle))
        (error_overflow_suppression player (ai_vehicle_get_from_starting_location "e12_cov_banshees0/banshee0"))
    )
)

(script dormant void e12_cov_inf0_main
    (begin
        (sleep_until (> (ai_spawn_count "e12_cov_phantom0") 0) 5)
        (ai_place "e12_cov_inf0_0")
        (ai_place "e12_cov_inf0_1/elite0")
        (ai_place "e12_cov_inf0_1/elite1")
        (if (not (game_can_use_flashlights)) 
            (ai_place "e12_cov_inf0_1/elite2"))
        (sleep 2)
        (ai_vehicle_enter_immediate "e12_cov_inf0_0" (ai_vehicle_get "e12_cov_phantom0/phantom0") phantom_p_a)
        (ai_vehicle_enter_immediate "e12_cov_inf0_1" (ai_vehicle_get "e12_cov_phantom0/phantom0") phantom_p_b)
        (sleep_until (volume_test_objects "tv_e12_ledge" (players)) 15)
        (cs_run_command_script "e12_cov_inf0" cs_e12_cov_inf0_look)
        (sleep_until (volume_test_objects "tv_e12_ledge_entrance" (players)) 15)
        (cs_run_command_script "e12_cov_inf0" cs_e12_cov_inf0_follow)
        (ai_set_orders "e12_cov_inf0" "e12_cov_inf0_advance0")
        (sleep_until (volume_test_objects "tv_e12_swap_room_halfway" (players)) 15)
        (ai_set_orders "e12_cov_inf0" "e12_cov_inf0_advance1")
        (sleep_until (= (version) 2))
        (ai_teleport_to_starting_location_if_outside_bsp "e12_cov_inf0_0")
        (ai_teleport_to_starting_location_if_outside_bsp "e12_cov_inf0_1")
        (sleep_until (> (device_get_position "e12_door0") 0.0) 15)
        (ai_set_orders "e12_cov_inf0_0" "e12_cov_inf0_engage0_right")
        (ai_set_orders "e12_cov_inf0_1" "e12_cov_inf0_engage0_left")
    )
)

(script dormant void e12_main
    (begin
        (set g_e12_started true)
        (game_save_no_timeout)
        (print "e12_main")
        (data_mine_insert "e12_control_antechamber")
        (wake chapter_title2)
        (wake objective2_clear)
        (wake objective3_set)
        (wake e13_cinematic_main)
        (wake e12_cov_banshees0_main)
        (wake e12_pro_inf0_main)
        (wake e12_pro_inf0_ender)
        (sleep_until (= (version) 2))
        (game_save_no_timeout)
        (sleep_forever e12_cov_banshees0_main)
        (error_overflow_suppression player (ai_vehicle_get_from_starting_location "e12_cov_banshees0/banshee0"))
        (sleep_until g_e13_started)
        (sleep_forever e12_cov_inf0_main)
        (sleep_forever e12_cov_phantom0_main)
        (sleep_forever e12_pro_inf0_main)
        (ai_erase "e12_cov")
        (ai_erase "e12_pro")
    )
)

(script static void test_antechamber
    (begin
        (structure_bsp_index 2)
        (object_teleport (player0) "e12_test")
        (if (not g_e12_started) 
            (wake e12_main))
    )
)

(script command_script void cs_e11_pro_phantom0_0_main
    (begin
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by e11_pro_phantom0_0/p00)
        (cs_vehicle_boost false)
        (cs_fly_by e11_pro_phantom0_0/p0)
        (cs_fly_to e11_pro_phantom0_0/p1)
        (cs_fly_to_and_face e11_pro_phantom0_0/p2 e11_pro_phantom0_1/p1_facing 0.5)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
        (ai_braindead "e11_pro_wraith0_0" false)
        (sleep 30)
        (cs_fly_to_and_face e11_pro_phantom0_0/p1 e11_pro_phantom0_0/p3 0.5)
        (cs_fly_by e11_pro_phantom0_0/p3)
        (cs_fly_by e11_pro_phantom0_0/p4)
        (cs_vehicle_boost true)
        (cs_fly_by e11_pro_phantom0_0/p5)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e11_pro_phantom0_1_main
    (begin
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_by e11_pro_phantom0_1/p00)
        (cs_vehicle_boost false)
        (cs_fly_by e11_pro_phantom0_1/p0)
        (cs_fly_to_and_face e11_pro_phantom0_1/p1 e11_pro_phantom0_1/p1_facing)
        (cs_fly_to_and_face e11_pro_phantom0_1/p2 e11_pro_phantom0_1/p1_facing 0.5)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
        (ai_braindead "e11_pro_wraith0_1" false)
        (sleep 30)
        (cs_fly_to_and_face e11_pro_phantom0_1/p1 e11_pro_phantom0_1/p3 0.5)
        (cs_fly_by e11_pro_phantom0_1/p3)
        (cs_fly_by e11_pro_phantom0_1/p4)
        (cs_vehicle_boost true)
        (cs_fly_by e11_pro_phantom0_1/p5)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e11_attack_scarab
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_moving true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_shoot_point true scarab_air/joint0)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint0)
                    )
                    (begin
                        (cs_shoot_point true scarab_air/joint1)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint1)
                    )
                    (begin
                        (cs_shoot_point true scarab_air/joint2)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint2)
                    )
                    (begin
                        (cs_shoot_point true scarab_air/joint3)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint3)
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_e11_attack_scarab_behavior
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (sleep_until 
            (begin
                (sleep_until (<= (ai_combat_status ai_current_actor) ai_combat_status_active))
                (cs_stack_command_script ai_current_actor cs_e11_attack_scarab)
                false
            )
        )
    )
)

(script command_script void cs_e11_pro_wraiths1_shoot
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_enable_moving true)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_shoot_point true scarab_air/joint0)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint0)
                    )
                    (begin
                        (cs_shoot_point true scarab_air/joint1)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint1)
                    )
                    (begin
                        (cs_shoot_point true scarab_air/joint2)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint2)
                    )
                    (begin
                        (cs_shoot_point true scarab_air/joint3)
                        (sleep (random_range 90 180))
                        (cs_shoot_point false scarab_air/joint3)
                    )
                )
                false
            )
        )
    )
)

(script command_script void cs_e11_pro_wraiths1_bombard
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (sleep_until 
            (begin
                (sleep_until (<= (ai_combat_status ai_current_actor) ai_combat_status_active))
                (cs_stack_command_script ai_current_actor cs_e11_pro_wraiths1_shoot)
                false
            )
        )
    )
)

(script command_script void cs_e11_ghost_door0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_and_face e11_door_entry/p0 e11_door_entry/p1)
        (sleep_until 
            (begin
                (device_set_position "e11_door0" 1.0)
                (>= (device_get_position "e11_door0") 1.0)
            ) 
        10)
        (cs_go_by e11_door_entry/p1 e11_door_entry/p2)
        (cs_vehicle_boost true)
        (cs_go_to e11_door_entry/p2)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (sleep 120)
        (object_can_take_damage (ai_get_object ai_current_actor))
        (cs_run_command_script ai_current_actor cs_e11_attack_scarab_behavior)
    )
)

(script command_script void cs_e11_spectre_door0_entry
    (begin
        (cs_enable_pathfinding_failsafe true)
        (ai_vehicle_reserve_seat (ai_vehicle_get ai_current_actor) "spectre_p_l" true)
        (cs_go_to_and_face e11_door_entry/p0 e11_door_entry/p1)
        (sleep_until 
            (begin
                (device_set_position "e11_door0" 1.0)
                (>= (device_get_position "e11_door0") 1.0)
            ) 
        10)
        (cs_go_by e11_door_entry/p1 e11_door_entry/p2)
        (cs_vehicle_boost true)
        (cs_go_to e11_door_entry/p2)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (sleep 120)
        (object_can_take_damage (ai_get_object ai_current_actor))
        (cs_run_command_script ai_current_actor cs_e11_attack_scarab_behavior)
    )
)

(script command_script void cs_e11_pro_banshees0_0_entry
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_vehicle_boost true)
        (sleep 90)
        (cs_enable_moving true)
        (sleep 150)
    )
)

(script command_script void cs_e11_pro_banshees0_1_entry
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_vehicle_boost true)
        (cs_fly_by e11_pro_banshees0_1_entry/p0)
        (cs_enable_moving true)
        (sleep 150)
    )
)

(script command_script void cs_e11_scarab_main_gun_shoot
    (begin
        (cs_shoot_point true e11_scarab_gunners/p0)
        (sleep 165)
    )
)

(script command_script void cs_e11_cov_banshees0_die
    (begin
        (ai_kill ai_current_actor)
    )
)

(script static boolean e11_pro_phantom0_0_retreat
    (begin
        (or
            (<= (object_get_health (ai_vehicle_get "e11_pro_phantom0_0/phantom0")) 0.05)
            (>= (object_model_targets_destroyed (ai_vehicle_get "e11_pro_phantom0_0/phantom0") "target_front") 3)
        )
    )
)

(script static boolean e11_pro_phantom0_1_retreat
    (begin
        (or
            (<= (object_get_health (ai_vehicle_get "e11_pro_phantom0_1/phantom0")) 0.05)
            (>= (object_model_targets_destroyed (ai_vehicle_get "e11_pro_phantom0_1/phantom0") "target_front") 3)
        )
    )
)

(script static short e11_pro_wraiths1_living_count
    (begin
        (+ 
            (if (> (unit_get_health (ai_vehicle_get_from_starting_location "e11_pro_wraith1_0/wraith")) 0.0) 
                1.0 0.0) 
        
            (if (> (unit_get_health (ai_vehicle_get_from_starting_location "e11_pro_wraith1_1/wraith")) 0.0) 
                1.0 0.0) 
        
            (if (> (unit_get_health (ai_vehicle_get_from_starting_location "e11_pro_wraith1_2/wraith")) 0.0) 
                1.0 0.0) 
        
            (if (> (unit_get_health (ai_vehicle_get_from_starting_location "e11_pro_wraith1_3/wraith")) 0.0) 
                1.0 0.0)
        )
    )
)

(script static boolean e11_pro_wraiths1_weakened
    (begin
        (<= (e11_pro_wraiths1_living_count) 2)
    )
)

(script static boolean e11_door_blocked
    (begin
        (or
            (cs_command_script_queued "e11_pro_ghosts0" cs_e11_ghost_door0_entry)
            (cs_command_script_queued "e11_pro_spectres0" cs_e11_spectre_door0_entry)
        )
    )
)

(script dormant void e11_pro_phantom1_main
    (begin
        (sleep_until 
            (and
                (not (objects_can_see_flag (players) "e11_pro_phantom1_spawn" 80.0))
                (<= (ai_living_count "e11_pro_phantom0_0") 0)
                (<= (ai_living_count "e11_pro_wraith0_0") 0)
            ) 
        30)
        (ai_place_in_vehicle "e11_pro_wraith0_1" "e11_pro_phantom0_1")
        (ai_braindead "e11_pro_wraith0_1" true)
    )
)

(script dormant void e11_pro_phantom0_main
    (begin
        (sleep_until g_e11_door_open)
        (sleep_until (not (volume_test_objects "tv_e11_outer_cove" (players))) 30)
        (ai_place "e11_pro_phantom0_0")
        (ai_place_in_vehicle "e11_pro_wraith0_0" "e11_pro_phantom0_0")
        (ai_braindead "e11_pro_wraith0_0" true)
    )
)

(script dormant void e11_pro_banshees0_main
    (begin
        (sleep_until (<= (e11_pro_wraiths1_living_count) 2))
        (sleep_until 
            (begin
                (if (<= (ai_living_count "e11_pro_banshees0") 0) 
                    (sleep_until 
                        (begin
                            (if (volume_test_objects "tv_e11_outer_cove" (players)) 
                                (ai_place "e11_pro_banshees0_1" 1) (ai_place "e11_pro_banshees0_0" 1))
                            (>= (ai_living_count "e11_pro_banshees0") 2)
                        ) 
                    60))
                (>= (ai_spawn_count "e11_pro_banshees0") 10)
            ) 
        450)
    )
)

(script dormant void e11_pro_spectres0_main
    (begin
        (sleep_until 
            (and
                (<= (e11_pro_wraiths1_living_count) 1)
                (> (ai_spawn_count "e11_pro_banshees0") 6)
            )
        )
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (ai_living_count "e11_pro_spectres0") 2)
                        (> (objects_distance_to_object (players) "e11_door0") 50.0)
                    ) 
                        (begin
                            (sleep_until (not (e11_door_blocked)) 5)
                            (if (= (version) 0) 
                                (ai_place "e11_pro_spectres0"))
                        )
                )
                (>= (ai_spawn_count "e11_pro_spectres0") 6)
            ) 
        150)
    )
)

(script dormant void e11_pro_ghosts0_main
    (begin
        (sleep_until g_e11_door_open)
        (sleep_until (<= (e11_pro_wraiths1_living_count) 0))
        (sleep_until 
            (begin
                (if 
                    (and
                        (< (ai_living_count "e11_pro_ghosts0") 3)
                        (> (objects_distance_to_object (players) "e11_door0") 50.0)
                    ) 
                        (begin
                            (sleep_until (not (e11_door_blocked)) 5)
                            (if (= (version) 0) 
                                (ai_place "e11_pro_ghosts0" 1))
                        )
                )
                (>= (ai_spawn_count "e11_pro_ghosts0") 16)
            ) 
        150)
    )
)

(script dormant void e11_pro_wraith_checkpoints
    (begin
        (sleep_until (<= (e11_pro_wraiths1_living_count) 3) 61)
        (game_save_no_timeout)
        (sleep_until (<= (e11_pro_wraiths1_living_count) 2) 61)
        (game_save_no_timeout)
        (sleep_until (<= (e11_pro_wraiths1_living_count) 1) 61)
        (game_save_no_timeout)
        (sleep_until (<= (e11_pro_wraiths1_living_count) 0) 61)
        (game_save_no_timeout)
    )
)

(script dormant void e11_pro_wraith1_main
    (begin
        (sleep_until (volume_test_objects "tv_e11_pro_wraiths1_begin" (players)) 15)
        (wake e11_pro_wraith_checkpoints)
        (ai_place "e11_pro_wraith1_0")
        (ai_place "e11_pro_wraith1_1")
        (sleep_until (<= (ai_living_count "e11_pro_wraith1") 0))
        (wake e11_pro_phantom0_main)
    )
)

(script dormant void e11_cov_banshees0_main
    (begin
        (if (not (players_in_vehicle)) 
            (ai_place "e11_cov_banshees0"))
    )
)

(script dormant void e11_navpoint
    (begin
        (sleep_until (> (objects_distance_to_flag (players) "e11_exit_door") 185.0) 60 one_minute)
        (deactivate_nav_point_flag default player "e11_exit_door" 0.0)
    )
)

(script dormant void e11_navpoint_kill
    (begin
        (sleep_until (volume_test_objects "tv_e12_ledge" (players)))
        (sleep_forever e11_navpoint)
        (cls player "e11_exit_door")
    )
)

(script dormant void e11_door_opening
    (begin
        (sleep_until g_e11_door_should_open 10)
        (sleep 120)
        (sound_impulse_start_effect "sound_remastered\visual_effects\deltacontrol_bigdoorexplosion" none 1.0)
        (effect_new "effects\scenarios\solo\deltacontrolroom\scarab_attack_deltacontrol" "e11_door_explosion")
        (object_destroy "e11_exit_door")
        (set g_e11_door_open true)
        (sleep 30)
        (wake e11_navpoint)
        (wake e11_navpoint_kill)
    )
)

(script dormant void e11_scarab_main
    (begin
        (pvs_clear "scarab")
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_turn_22_left)
        (scarab_walk_front_turn_15_right)
        (scarab_walk_front_to_idle)
        (scarab_gun_open_up)
        (sleep_until 
            (begin
                (scarab_idle_var0)
                (volume_test_objects "tv_e11_outer_cove" (players))
            ) 
        1)
        (print "johnson: stay clear of the door")
        (sleep (ai_play_line_on_object none "0840"))
        (sleep_until (not (volume_test_objects "tv_e11_exit_vicinity" (players))) 10 45)
        (if (volume_test_objects "tv_e11_exit_vicinity" (players)) 
            (begin
                (print "johnson: you trying to get killed?")
                (sleep (ai_play_line_on_object none "0860"))
                (sleep_until (not (volume_test_objects "tv_e11_exit_vicinity" (players))) 10 60)
            )
        )
        (if (volume_test_objects "tv_e11_exit_vicinity" (players)) 
            (begin
                (print "johnson: what? do i have to spell it out for you? move!")
                (sleep (ai_play_line_on_object none "0870"))
                (sleep_until (not (volume_test_objects "tv_e11_exit_vicinity" (players))) 10 60)
                (if (volume_test_objects "tv_e11_exit_vicinity" (players)) 
                    (begin
                        (print "johnson: listen, i'm gonna count to three.")
                        (sleep (ai_play_line_on_object none "0880"))
                        (sleep_until (not (volume_test_objects "tv_e11_exit_vicinity" (players))) 10 30)
                        (if (volume_test_objects "tv_e11_exit_vicinity" (players)) 
                            (begin
                                (print "johnson: one...")
                                (sleep (ai_play_line_on_object none "0890"))
                                (sleep_until (not (volume_test_objects "tv_e11_exit_vicinity" (players))) 10 45)
                                (if (volume_test_objects "tv_e11_exit_vicinity" (players)) 
                                    (begin
                                        (print "johnson: two...")
                                        (sleep (ai_play_line_on_object none "0900"))
                                        (sleep_until (not (volume_test_objects "tv_e11_exit_vicinity" (players))) 10 60)
                                        (if (volume_test_objects "tv_e11_exit_vicinity" (players)) 
                                            (begin
                                                (print "johnson: don't say i didn't warn you!")
                                                (sleep (ai_play_line_on_object none "0910"))
                                            ) (begin
                                                (sleep 20)
                                                (print "johnson: good! now stay put!")
                                                (sleep (ai_play_line_on_object none "0920"))
                                                (set g_e11_player_warned true)
                                            )
                                        )
                                    ) (begin
                                        (sleep 20)
                                        (print "johnson: good! now stay put!")
                                        (sleep (ai_play_line_on_object none "0920"))
                                        (set g_e11_player_warned true)
                                    )
                                )
                            ) (begin
                                (sleep 20)
                                (print "johnson: good! now stay put!")
                                (sleep (ai_play_line_on_object none "0920"))
                                (set g_e11_player_warned true)
                            )
                        )
                    ) (begin
                        (sleep 25)
                        (print "johnson: good! now stay put!")
                        (sleep (ai_play_line_on_object none "0920"))
                        (set g_e11_player_warned true)
                    )
                )
            )
        )
        (sleep 30)
        (if 
            (and
                g_e11_player_warned
                (volume_test_objects "tv_e11_exit_vicinity" (players))
            ) 
                (begin
                    (print "johnson: yeah, that's real funny. i'm still shooting.")
                    (sleep (ai_play_line_on_object none "0930"))
                ) (begin
                    (print "johnson: hey bastards, knock knock!")
                    (sleep (ai_play_line_on_object none "0850"))
                )
        )
        (wake music_08b_07_start)
        (wake music_08b_08_start)
        (wake e11_door_opening)
        (sleep_until 
            (begin
                (scarab_gun_fire_up)
                (cs_stack_command_script "scarab_gunners/main_gunner" cs_e11_scarab_main_gun_shoot)
                (set g_e11_shot_counter (+ g_e11_shot_counter 1.0))
                (if (objects_can_see_flag (players) "e11_exit_door" 25.0) 
                    (set g_e11_player_saw_door true))
                (if 
                    (or
                        (>= g_e11_shot_counter 4)
                        (and
                            g_e11_player_saw_door
                            (>= g_e11_shot_counter 2)
                        )
                    ) 
                        (set g_e11_door_should_open true))
                (scarab_idle_firing)
                g_e11_door_should_open
            ) 
        1)
        (scarab_gun_close_up)
        (wake e12_main)
        (scarab_idle_to_walk_front)
        (scarab_walk_front_var0)
        (scarab_walk_front_to_idle)
        (scarab_idle_turn_22_left)
        (scarab_idle_turn_22_left)
        (player_enable_input)
        (sleep_until 
            (begin
                (scarab_idle_var0)
                false
            ) 
        1)
    )
)

(script dormant void e11_key
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
        (reset_dsp_image 8)
    )
)

(script dormant void e11_main
    (begin
        (sleep_until (volume_test_objects "tv_e11_main_begin" (players)) 15)
        (set g_e11_started true)
        (game_save_no_timeout)
        (print "e11_main")
        (data_mine_insert "e11_scarab_boardings")
        (kill_volume_disable "kill_e8_0")
        (wake e11_pro_banshees0_main)
        (wake e11_pro_wraith1_main)
        (wake e11_cov_banshees0_main)
        (wake e11_key)
        (sleep_until (= (version) 2))
        (sleep_forever e11_pro_wraith1_main)
        (sleep_forever e11_pro_banshees0_main)
        (sleep_forever e11_pro_phantom0_main)
        (sleep_forever e11_pro_phantom1_main)
        (sleep_forever e11_pro_ghosts0_main)
        (sleep_forever e11_pro_spectres0_main)
        (sleep_forever e11_pro_wraith_checkpoints)
        (ai_erase "e11_pro")
        (ai_erase "e11_cov")
    )
)

(script command_script void cs_e9_pro_phantom0_exit
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to_and_face e9_pro_phantom0_exit/p0 e9_pro_phantom0_exit/p1 1.0)
        (cs_fly_to_and_face e9_pro_phantom0_exit/p0_1 e9_pro_phantom0_exit/p1)
        (cs_vehicle_boost true)
        (cs_fly_by e9_pro_phantom0_exit/p1)
        (cs_fly_by e9_pro_phantom0_exit/p2)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e9_pro_phantom0_entry
    (begin
        (cs_fly_to e9_pro_phantom0_entry/p0)
        (cs_fly_to e9_pro_phantom0_entry/p1)
        (cs_fly_to e9_pro_phantom0_entry/p2 1.0)
        (sleep_until g_e9_scarab_at_second_bend 15)
        (cs_fly_to_and_face scarab_air/dropship_p1 scarab_air/dropship_p1_facing)
        (cs_vehicle_speed 0.25)
        (sleep_until 
            (begin
                (cs_fly_to_and_face scarab_air/dropship_p1 scarab_air/dropship_p1_facing 3.0)
                false
            ) 
        3 60)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_p_a)
        (sleep_until 
            (begin
                (cs_fly_to_and_face scarab_air/dropship_p1 scarab_air/dropship_p1_facing 3.0)
                false
            ) 
        3 300)
        (set g_e9_pro_phantom0_unloaded true)
    )
)

(script command_script void cs_e9_pro_banshees0_entry
    (begin
        (cs_vehicle_boost true)
        (sleep 120)
    )
)

(script dormant void e9_pro_spectres0_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e9_second_bend" (players))
                g_e9_scarab_started
            ) 
        15)
        (ai_place "e9_pro_spectres0_0")
        (sleep 1)
        (ai_vehicle_reserve_seat (ai_vehicle_get "e9_pro_spectres0_0/spectre0") "spectre_p_l" true)
        (sleep_until 
            (or
                (volume_test_objects "tv_e9_second_bend" (players))
                (<= (ai_living_count "e9_pro_spectres0") 1)
            ) 
        15)
        (ai_place "e9_pro_spectres0_1")
        (sleep 1)
        (ai_vehicle_reserve_seat (ai_vehicle_get "e9_pro_spectres0_1/starting_locations_0") "spectre_p_l" true)
    )
)

(script dormant void e9_pro_phantom0_main
    (begin
        (sleep_until g_e9_scarab_near_second_bend 15)
        (ai_place "e9_pro_phantom0")
        (sleep_until g_e9_pro_phantom0_unloaded)
        (sleep_until 
            (or
                (>= (object_model_targets_destroyed (ai_vehicle_get "e9_pro_phantom0/phantom0") "target_front") 3)
                (<= (object_get_health (ai_vehicle_get "e9_pro_phantom0/phantom0")) 0.05)
            ) 
        15 450)
        (set g_e9_pro_phantom0_retreating true)
        (cs_run_command_script "e9_pro_phantom0/phantom0" cs_e9_pro_phantom0_exit)
        (sleep 150)
        (if 
            (or
                (>= (object_model_targets_destroyed (ai_vehicle_get "e9_pro_phantom0/phantom0") "target_front") 3)
                (<= (object_get_health (ai_vehicle_get "e9_pro_phantom0/phantom0")) 0.05)
            ) 
                (begin
                    (print "johnson: now i know why you have the fancy armor")
                    (ai_play_line_on_object none "0690")
                )
        )
    )
)

(script dormant void e9_pro_banshees0_main
    (begin
        (sleep_until g_e9_scarab_near_first_bend)
        (sleep_until 
            (begin
                (if 
                    (or
                        (<= (ai_living_count "e9_pro_banshees0") 0)
                        (and
                            (<= (ai_living_count "e9_pro_banshees0") 1)
                            (<= (ai_living_count "e9_pro_inf0") 2)
                            (<= (ai_living_count "e9_pro_spectres0") 0)
                        )
                    ) 
                        (ai_place "e9_pro_banshees0" 1))
                (or
                    (>= (ai_spawn_count "e9_pro_banshees0") 6)
                    (volume_test_objects "tv_e9_pro_banshees0_stop" (players))
                    g_e9_scarab_stepping_down
                )
            ) 
        60)
        (ai_migrate "e9_pro_banshees0" "e11_pro_banshees0_1")
    )
)

(script dormant void e9_pro_inf3_main
    (begin
        (sleep_until (> (ai_living_count "e9_pro_phantom0") 0))
        (ai_place_in_vehicle "e9_pro_inf3_0" "e9_pro_phantom0")
    )
)

(script dormant void e9_pro_inf0_main
    (begin
        (ai_place "e9_pro_inf0")
    )
)

(script dormant void e9_scarab_navpoint
    (begin
        (sleep_until 
            (begin
                (if (< (objects_distance_to_object (players) "scarab") 40.0) 
                    (error_overflow_suppression player "scarab"))
                (if (> (objects_distance_to_object (players) "scarab") 60.0) 
                    (deactivate_nav_point_object default player "scarab" 10.0))
                g_e11_door_open
            ) 
        140)
        (error_overflow_suppression player "scarab")
    )
)

(script dormant void e9_scarab_main
    (begin
        (pvs_clear "scarab")
        (if (difficulty_normal) 
            (wake e9_scarab_navpoint))
        (set g_e9_scarab_started true)
        (scarab_idle_to_walk_front)
        (scarab_walk_front_turn_22_right)
        (scarab_walk_front_turn_15_right)
        (scarab_walk_front_turn_15_left)
        (scarab_walk_front_turn_15_left)
        (scarab_walk_front_var0)
        (scarab_walk_front_var0)
        (scarab_walk_front_to_idle)
        (scarab_idle_turn_22_left)
        (scarab_idle_turn_45_left)
        (scarab_idle_turn_22_left)
        (scarab_idle_to_walk_front)
        (scarab_walk_front_var0)
        (set g_e9_scarab_near_first_bend true)
        (scarab_walk_front_turn_15_right)
        (scarab_walk_front_turn_15_right)
        (scarab_walk_front_turn_45_right)
        (scarab_walk_front_turn_45_right)
        (set g_e9_scarab_near_second_bend true)
        (scarab_walk_front_turn_15_right)
        (scarab_walk_front_turn_15_left)
        (scarab_walk_front_turn_22_left)
        (scarab_walk_front_turn_22_left)
        (scarab_walk_front_turn_45_left)
        (set g_e9_scarab_at_second_bend true)
        (scarab_walk_front_to_idle)
        (scarab_idle_turn_22_left)
        (scarab_idle_turn_22_left)
        (sleep_until 
            (begin
                (scarab_idle_var0)
                (and
                    true
                    (not (volume_test_objects "tv_scarab" (ai_actors "e9_pro_inf3")))
                )
            ) 
        1)
        (scarab_idle_to_walk_front)
        (scarab_walk_front_turn_15_left)
        (scarab_walk_front_turn_15_left)
        (scarab_walk_front_turn_22_right)
        (set g_e9_scarab_stepping_down true)
        (device_set_position_track "scarab" "delta_canyon_step_down" g_scarab_interpolation)
        (device_animate_position "scarab" 1.0 (/ 350.0 30.0) 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
        (scarab_walk_front_turn_22_right)
        (scarab_walk_front_turn_15_left)
        (scarab_walk_front_var0)
        (wake e11_scarab_main)
    )
)

(script static void e9_scarab_test
    (begin
        (object_teleport "scarab" "e9_scarab")
        (wake e9_scarab_main)
    )
)

(script dormant void e9_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e9_main_begin" (players))
                g_e9_scarab_started
            ) 
        15)
        (set g_e9_started true)
        (game_save_no_timeout)
        (print "e9_main")
        (data_mine_insert "e9_scarab_canyon")
        (wake e9_pro_inf0_main)
        (wake e9_pro_inf3_main)
        (wake e9_pro_spectres0_main)
        (wake e9_pro_banshees0_main)
        (sleep_until g_e11_started)
        (ai_disposable "e9_pro" true)
        (sleep_until g_e12_started)
        (sleep_forever e9_pro_inf0_main)
        (sleep_forever e9_pro_inf3_main)
        (sleep_forever e9_pro_spectres0_main)
        (sleep_forever e9_pro_banshees0_main)
    )
)

(script static void test_scarab_canyon
    (begin
        (object_teleport "scarab" "e9_scarab")
        (wake e9_main)
        (sleep 1)
        (wake e9_main)
        (wake e11_main)
    )
)

(script command_script void cs_e8_pro_phantom0_exit
    (begin
        (cs_fly_by e8_pro_phantom0_exit/p0)
        (cs_fly_by e8_pro_phantom0_exit/p1)
        (cs_fly_by e8_pro_phantom0_exit/p2)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e8_cov_banshee0_entry0
    (begin
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (cs_vehicle_boost true)
        (sleep 80)
        (cs_fly_by e8_cov_banshees0_entry/p0_0)
        (cs_fly_by e8_cov_banshees0_entry/p0_1 15.0)
        (cs_vehicle_boost false)
        (cs_fly_to e8_cov_banshees0_entry/p0_1 2.0)
        (sleep 15)
        (ai_vehicle_exit ai_current_actor)
        (object_can_take_damage (ai_get_object ai_current_actor))
        (cs_ignore_obstacles false)
        (cs_face_player true)
        (sleep_until 
            (or
                (and
                    (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                    (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 3.0)
                )
                g_e8_cov_banshees0_greeted
            )
        )
        (if (not g_e8_cov_banshees0_greeted) 
            (begin
                (print "elite: take my banshee")
                (set g_e8_cov_banshees0_greeted true)
                (sleep (ai_play_line_at_player ai_current_actor "0800"))
            )
        )
        (sleep_until 
            (or
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 10.0)
                (players_in_vehicle)
            )
        )
        (cs_go_to e8_cov_banshees0_entry/exit0)
        (sleep_until (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 40.0))
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e8_cov_banshee0_entry1
    (begin
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (cs_vehicle_boost true)
        (sleep 70)
        (cs_fly_by e8_cov_banshees0_entry/p1_0)
        (cs_fly_by e8_cov_banshees0_entry/p1_1 15.0)
        (cs_vehicle_boost false)
        (cs_fly_to e8_cov_banshees0_entry/p1_1 2.0)
        (sleep 15)
        (ai_vehicle_exit ai_current_actor)
        (object_can_take_damage (ai_get_object ai_current_actor))
        (cs_ignore_obstacles false)
        (cs_face_player true)
        (sleep_until 
            (or
                (and
                    (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                    (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 3.0)
                )
                g_e8_cov_banshees0_greeted
            )
        )
        (if (not g_e8_cov_banshees0_greeted) 
            (begin
                (print "elite: take my banshee")
                (set g_e8_cov_banshees0_greeted true)
                (sleep (ai_play_line_at_player ai_current_actor "0800"))
            )
        )
        (sleep_until 
            (or
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 10.0)
                (players_in_vehicle)
            )
        )
        (cs_go_to e8_cov_banshees0_entry/exit0)
        (sleep_until (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 40.0))
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e8_cov_banshee0_entry2
    (begin
        (cs_ignore_obstacles true)
        (cs_enable_pathfinding_failsafe true)
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (cs_vehicle_boost true)
        (sleep 70)
        (cs_fly_by e8_cov_banshees0_entry/p2_0)
        (cs_fly_by e8_cov_banshees0_entry/p2_1 15.0)
        (cs_vehicle_boost false)
        (cs_fly_to e8_cov_banshees0_entry/p2_1 2.0)
        (sleep 15)
        (ai_vehicle_exit ai_current_actor)
        (object_can_take_damage (ai_get_object ai_current_actor))
        (cs_ignore_obstacles false)
        (cs_face_player true)
        (sleep_until 
            (or
                (and
                    (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 0.0)
                    (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 3.0)
                )
                g_e8_cov_banshees0_greeted
            )
        )
        (if (not g_e8_cov_banshees0_greeted) 
            (begin
                (print "elite: take my banshee")
                (set g_e8_cov_banshees0_greeted true)
                (sleep (ai_play_line_at_player ai_current_actor "0800"))
            )
        )
        (sleep_until 
            (or
                (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 10.0)
                (players_in_vehicle)
            )
        )
        (cs_go_to e8_cov_banshees0_entry/exit1)
        (sleep_until (> (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 40.0))
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e8_cov_banshee0_flyby
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_ignore_obstacles true)
        (cs_vehicle_boost true)
        (sleep 100)
        (cs_fly_by e8_cov_banshees0_entry/p3)
        (cs_fly_by e8_cov_banshees0_entry/p4)
        (object_destroy (ai_vehicle_get ai_current_actor))
        (sleep 1)
        (ai_erase ai_current_actor)
    )
)

(script command_script void cs_e8_pro_wraith0_0_bombard
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_face_object true "scarab")
        (sleep_until 
            (begin
                (cs_go_to e8_pro_wraiths0_bombard/p0_0)
                (cs_shoot_point true scarab/target_right)
                (sleep_until (= g_e8_target_wraith 0) 10)
                (cs_shoot_point false scarab/target_right)
                (cs_go_to e8_pro_wraiths0_bombard/p0_1)
                (sleep (random_range 180 210))
                false
            ) 
        1)
    )
)

(script command_script void cs_e8_pro_wraith0_1_bombard
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_face_object true "scarab")
        (sleep_until 
            (begin
                (cs_go_to e8_pro_wraiths0_bombard/p1_0)
                (cs_shoot_point true scarab/target_left)
                (sleep_until (= g_e8_target_wraith 1) 10)
                (cs_shoot_point false scarab/target_left)
                (cs_go_to e8_pro_wraiths0_bombard/p1_1)
                (sleep (random_range 180 210))
                false
            ) 
        1)
    )
)

(script command_script void cs_e8_pro_wraith0_2_bombard
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_face_object true "scarab")
        (sleep_until 
            (begin
                (cs_go_to e8_pro_wraiths0_bombard/p2_0)
                (cs_shoot_point true scarab/target_left)
                (sleep_until (= g_e8_target_wraith 2) 10)
                (cs_shoot_point false scarab/target_left)
                (cs_go_to e8_pro_wraiths0_bombard/p2_1)
                (sleep (random_range 180 210))
                false
            ) 
        1)
    )
)

(script command_script void cs_e8_scarab_main_gun_idle
    (begin
        (sleep_forever)
    )
)

(script command_script void cs_e8_scarab_main_gun_shoot0
    (begin
        (cs_shoot_point true e8_scarab_gunners/p0)
        (sleep 75)
        (if (volume_test_objects "tv_e8_scarab_fire_unsafe" (players)) 
            (begin
                (scarab_gun_fire_down_abort)
                (cs_shoot_point false e8_scarab_gunners/p0)
            )
        )
        (sleep 90)
    )
)

(script command_script void cs_e8_scarab_main_gun_shoot1
    (begin
        (cs_shoot_point true e8_scarab_gunners/p1)
        (sleep 75)
        (if (volume_test_objects "tv_e8_scarab_fire_unsafe" (players)) 
            (begin
                (scarab_gun_fire_down_abort)
                (cs_shoot_point false e8_scarab_gunners/p1)
            )
        )
        (sleep 90)
    )
)

(script command_script void cs_e8_scarab_main_gun_shoot2
    (begin
        (cs_shoot_point true e8_scarab_gunners/p2)
        (sleep 75)
        (if (volume_test_objects "tv_e8_scarab_fire_unsafe" (players)) 
            (begin
                (scarab_gun_fire_down_abort)
                (cs_shoot_point false e8_scarab_gunners/p2)
            )
        )
        (sleep 90)
    )
)

(script command_script void cs_e8_mars_johnson_init
    (begin
        (cs_enable_dialogue true)
        (object_cannot_die (ai_get_object ai_current_actor) true)
        (object_cinematic_lod (ai_get_object ai_current_actor) true)
        (ai_vehicle_enter_immediate ai_current_actor (unit (object_at_marker "scarab" "scarab_d_l")) scarab_d_r)
        (cs_look_player true)
        (sleep_forever)
    )
)

(script command_script void cs_e8_mars_inf0_emerge
    (begin
        (cs_abort_on_combat_status ai_combat_status_visible)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to scarab/p2)
    )
)

(script command_script void cs_e8_mars_inf0_retreat
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to scarab/p0)
    )
)

(script dormant void e8_scarab_main
    (begin
        (pvs_clear "scarab")
        (print "hide main gunner")
        (object_hide (object_at_marker "scarab" "primary_trigger") true)
        (device_set_position_track "scarab" "delta_ledge_exit" 0.0)
        (device_animate_position "scarab" 1.0 (/ 1.0 30.0) 0.0 0.0 true)
        (sleep 3)
        (object_create "scarab_door")
        (objects_attach "scarab" "plasma_door" "scarab_door" "")
        (ai_place "scarab_gunners/main_gunner")
        (vehicle_load_magic (unit (object_at_marker "scarab" "primary_trigger")) scarab_turret_d (ai_get_object "scarab_gunners/main_gunner"))
        (cs_run_command_script "scarab_gunners/main_gunner" cs_e8_scarab_main_gun_idle)
        (scarab_idle_var0)
        (scarab_idle_turn_22_right_slow)
        (scarab_idle_turn_45_right_slow)
        (scarab_idle_turn_22_right_slow)
        (scarab_gun_open_down)
        (scarab_idle_turn_15_right_slow)
        (set g_e8_target_wraith 1)
        (scarab_idle_to_twist_5_left)
        (scarab_gun_fire_down)
        (cs_stack_command_script "scarab_gunners/main_gunner" cs_e8_scarab_main_gun_shoot1)
        (scarab_twist_5_left_firing)
        (sleep_until 
            (begin
                (begin_random
                    (if (> (ai_living_count "e8_pro_wraiths0_0") 0) 
                        (begin
                            (if (not (= g_e8_target_wraith 0)) 
                                (begin
                                    (scarab_twist_5_left_to_idle)
                                    (scarab_idle_to_twist_5_right)
                                ) (begin
                                    (scarab_twist_5_right)
                                )
                            )
                            (set g_e8_target_wraith 0)
                            (if (not (volume_test_objects "tv_e8_scarab_fire_unsafe" (players))) 
                                (begin
                                    (scarab_gun_fire_down)
                                    (cs_stack_command_script "scarab_gunners/main_gunner" cs_e8_scarab_main_gun_shoot0)
                                    (scarab_twist_5_right_firing)
                                )
                            )
                        )
                    )
                    (if (> (ai_living_count "e8_pro_wraiths0_1") 0) 
                        (begin
                            (if (= g_e8_target_wraith 0) 
                                (begin
                                    (scarab_twist_5_right_to_idle)
                                    (scarab_idle_to_twist_5_left)
                                ) (begin
                                    (scarab_twist_5_left)
                                )
                            )
                            (set g_e8_target_wraith 1)
                            (if (not (volume_test_objects "tv_e8_scarab_fire_unsafe" (players))) 
                                (begin
                                    (scarab_gun_fire_down)
                                    (cs_stack_command_script "scarab_gunners/main_gunner" cs_e8_scarab_main_gun_shoot1)
                                    (scarab_twist_5_left_firing)
                                )
                            )
                        )
                    )
                    (if (> (ai_living_count "e8_pro_wraiths0_2") 0) 
                        (begin
                            (if (= g_e8_target_wraith 0) 
                                (begin
                                    (scarab_twist_5_right_to_idle)
                                    (scarab_idle_to_twist_5_left)
                                ) (begin
                                    (scarab_twist_5_left)
                                )
                            )
                            (set g_e8_target_wraith 2)
                            (if (not (volume_test_objects "tv_e8_scarab_fire_unsafe" (players))) 
                                (begin
                                    (scarab_gun_fire_down)
                                    (cs_stack_command_script "scarab_gunners/main_gunner" cs_e8_scarab_main_gun_shoot2)
                                    (scarab_twist_5_left_firing)
                                )
                            )
                        )
                    )
                )
                (<= (ai_living_count "e8_pro_wraiths0") 0)
            ) 
        1)
        (scarab_gun_close_down)
        (if (= g_e8_target_wraith 0) 
            (scarab_twist_5_right_to_idle) (scarab_twist_5_left_to_idle))
        (scarab_idle_turn_15_left)
        (wake e9_scarab_main)
    )
)

(script dormant void e8_wraith_dialogue
    (begin
        (sleep_until (<= (ai_living_count "e8_pro_wraiths0") 2))
        (sleep 30)
        (print "johnson: hah, how do you like it?")
        (ai_play_line_on_object none "0660")
    )
)

(script dormant void e8_pro_wraiths0_main
    (begin
        (sleep_until 
            (or
                (players_in_vehicle)
                (volume_test_objects "tv_e8_exit" (players))
            ) 
        30 450)
        (ai_place "e8_pro_wraiths0")
        (wake e8_wraith_dialogue)
        (sleep_until 
            (begin
                (if 
                    (and
                        (<= (ai_combat_status "e8_pro_wraiths0_0") ai_combat_status_active)
                        (not (cs_command_script_queued "e8_pro_wraiths0_0" cs_e8_pro_wraith0_0_bombard))
                    ) 
                        (begin
                            (print "wraith0 bombard")
                            (cs_run_command_script "e8_pro_wraiths0_0" cs_e8_pro_wraith0_0_bombard)
                        )
                )
                (if 
                    (and
                        (<= (ai_combat_status "e8_pro_wraiths0_1") ai_combat_status_active)
                        (not (cs_command_script_queued "e8_pro_wraiths0_1" cs_e8_pro_wraith0_1_bombard))
                    ) 
                        (begin
                            (print "wraith1 bombard")
                            (cs_run_command_script "e8_pro_wraiths0_1" cs_e8_pro_wraith0_1_bombard)
                        )
                )
                (if 
                    (and
                        (<= (ai_combat_status "e8_pro_wraiths0_2") ai_combat_status_active)
                        (not (cs_command_script_queued "e8_pro_wraiths0_2" cs_e8_pro_wraith0_2_bombard))
                    ) 
                        (begin
                            (print "wraith2 bombard")
                            (cs_run_command_script "e8_pro_wraiths0_2" cs_e8_pro_wraith0_2_bombard)
                        )
                )
                (<= (ai_living_count "e8_pro_wraiths0") 0)
            )
        )
        (sleep 60)
        (game_save_no_timeout)
    )
)

(script dormant void e8_cov_banshees0_main
    (begin
        (ai_place "e8_cov_banshees0/banshee1")
        (sleep 60)
        (ai_place "e8_cov_banshees0/banshee0")
        (sleep 90)
        (ai_place "e8_cov_banshees0/banshee2")
        (sleep_until 
            (or
                (players_in_vehicle)
                (volume_test_objects "tv_e8_exit" (players))
            )
        )
        (wake music_08b_06_start)
        (game_save_no_timeout)
    )
)

(script static boolean e8_mars_inf0_should_activate
    (begin
        (or
            (volume_test_objects "tv_scarab" (players))
            (volume_test_objects "tv_scarab" (ai_actors "e9_pro_inf3"))
        )
    )
)

(script dormant void e8_mars_inf0_main
    (begin
        (sleep 30)
        (ai_place "e8_mars_inf0")
        (sleep_until 
            (begin
                (if (e8_mars_inf0_should_activate) 
                    (begin
                        (if (<= (ai_living_count "e8_mars_inf0") 0) 
                            (ai_place "e8_mars_inf0" g_e8_mars_inf0_living_count) (begin
                                (cs_run_command_script "e8_mars_inf0" cs_e8_mars_inf0_emerge)
                                (cs_run_command_script "e8_mars_inf0/johnson" cs_e8_mars_johnson_init)
                            )
                        )
                        (sleep_until (not (e8_mars_inf0_should_activate)))
                    ) (if (> (ai_living_count "e8_mars_inf0") 0) 
                        (begin
                            (set g_e8_mars_inf0_living_count (ai_living_count "e8_mars_inf0"))
                            (cs_run_command_script "e8_mars_inf0" cs_e8_mars_inf0_retreat)
                            (sleep_until 
                                (or
                                    (e8_mars_inf0_should_activate)
                                    (volume_test_objects_all "tv_scarab_interior" (ai_actors "e8_mars_inf0"))
                                )
                            )
                            (if (not (e8_mars_inf0_should_activate)) 
                                (ai_erase "e8_mars_inf0"))
                        )
                    )
                )
                false
            )
        )
    )
)

(script dormant void e8_cov_inf0_main
    (begin
        (sleep 1)
    )
)

(script dormant void e8_main
    (begin
        (set g_e8_started true)
        (game_save_no_timeout)
        (print "e8_main")
        (data_mine_insert "e8_scarab_cove")
        (kill_volume_disable "kill_e8_0")
        (wake objective1_clear)
        (wake objective2_set)
        (wake e9_main)
        (wake e11_main)
        (object_create "e8_banshee0")
        (object_create "e8_banshee1")
        (wake e8_cov_inf0_main)
        (wake e8_cov_banshees0_main)
        (wake e8_pro_wraiths0_main)
        (wake e8_scarab_main)
        (sleep_until g_e9_started)
        (ai_disposable "e8_cov" true)
    )
)

(script static void test_scarab_ride
    (begin
        (object_teleport "scarab" "e8_scarab")
        (if (not g_e8_started) 
            (wake e8_main))
    )
)

(script dormant void scarab_test_loop
    (begin
        (sleep_until 
            (begin
                (object_create_anew "scarab")
                (pvs_clear "scarab")
                (device_set_position_track "scarab" "delta_ledge_exit" 0.0)
                (device_animate_position "scarab" 1.0 (/ 90.0 30.0) 0.0 0.0 true)
                (sleep_until (>= (device_get_position "scarab") 1.0) 1)
                (scarab_idle_var0)
                (scarab_idle_turn_22_right)
                (scarab_idle_turn_45_right)
                (scarab_idle_turn_22_right)
                (scarab_idle_var0)
                (scarab_idle_to_walk_front)
                (scarab_walk_front_turn_22_right)
                (scarab_walk_front_turn_15_right)
                (scarab_walk_front_turn_15_left)
                (scarab_walk_front_turn_15_left)
                (scarab_walk_front_var0)
                (scarab_walk_front_var0)
                (scarab_walk_front_to_idle)
                (scarab_idle_turn_22_left)
                (scarab_idle_turn_45_left)
                (scarab_idle_turn_22_left)
                (scarab_idle_to_walk_front)
                (scarab_walk_front_var0)
                (scarab_walk_front_turn_15_right)
                (scarab_walk_front_turn_15_right)
                (scarab_walk_front_turn_45_right)
                (scarab_walk_front_turn_45_right)
                (scarab_walk_front_turn_15_right)
                (scarab_walk_front_turn_15_left)
                (scarab_walk_front_turn_22_left)
                (scarab_walk_front_turn_22_left)
                (scarab_walk_front_turn_45_left)
                (scarab_walk_front_to_idle)
                (scarab_idle_turn_22_left)
                (scarab_idle_turn_22_left)
                (scarab_idle_var0)
                (scarab_idle_to_walk_front)
                (scarab_walk_front_turn_15_left)
                (scarab_walk_front_turn_15_left)
                (scarab_walk_front_turn_22_right)
                (device_set_position_track "scarab" "delta_canyon_step_down" 0.0)
                (device_animate_position "scarab" 1.0 (/ 350.0 30.0) 0.0 0.0 true)
                (sleep_until (>= (device_get_position "scarab") 1.0) 1)
                (scarab_walk_front_var0)
                false
            ) 
        1)
    )
)

(script command_script void cs_e7_mars_inf0_wait
    (begin
        (ai_disregard (ai_get_object ai_current_actor) true)
        (custom_animation_loop (ai_get_unit ai_current_actor) "objects\characters\marine\deltacontrol\deltacontrol" "kneel_unarmed" false)
        (sleep_until g_e7_mars_johnson_go 3)
        (sleep 15)
        (custom_animation (ai_get_unit ai_current_actor) "objects\characters\marine\deltacontrol\deltacontrol" "kneel_to_idle_pistol" false)
        (cs_enable_moving true)
        (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
        (ai_disregard (ai_get_object ai_current_actor) false)
    )
)

(script command_script void cs_e7_mars_inf0_johnson
    (begin
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (unit_impervious (ai_get_unit ai_current_actor) true)
        (ai_disregard (ai_get_object ai_current_actor) true)
        (cs_enable_pathfinding_failsafe true)
        (custom_animation_relative_loop (ai_get_unit ai_current_actor) "objects\characters\marine\deltacontrol\deltacontrol" "kneel_unarmed_johnson" false "anchor_intra2")
        (sleep_until g_e7_mars_johnson_go 3)
        (print "johnson: go go go!")
        (ai_play_line ai_current_actor "3000")
        (custom_animation_relative (ai_get_unit ai_current_actor) "objects\characters\marine\deltacontrol\deltacontrol" "kneel_2_scarab" false "anchor_intra2")
        (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
        (set g_e7_mars_johnson_aboard true)
        (cs_go_to scarab/p0)
    )
)

(script command_script void cs_e7_pro_inf0_wait
    (begin
        (sleep_until (> (device_get_position "e7_door0") 0.0) 5)
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_abort_on_damage true)
        (cs_look_object true (ai_get_object "e7_mars_inf0/johnson0"))
        (sleep_until g_e7_pro_sentry_alerted 10)
        (ai_magically_see_object ai_current_squad (player0))
        (cs_force_combat_status 4)
    )
)

(script command_script void cs_e7_pro_inf0_captain_alert
    (begin
        (cs_aim_player true)
        (sleep 20)
        (print "cpn: elites!")
        (sleep (ai_play_line ai_current_actor "0400"))
        (set g_e7_mars_johnson_go true)
        (object_cannot_die (ai_get_object ai_current_actor) false)
    )
)

(script command_script void cs_e7_pro_inf0_captain
    (begin
        (cs_queue_command_script ai_current_actor cs_e7_pro_inf0_captain_alert)
        (sleep_until (> (device_get_position "e7_door0") 0.0) 5)
        (cs_abort_on_combat_status ai_combat_status_active)
        (cs_abort_on_damage true)
        (object_cannot_die (ai_get_object ai_current_actor) true)
        (print "tar: mine will do. kill the others.")
        (sleep (ai_play_line_on_object none "0050"))
        (sleep 20)
        (print "cpn: yes chieftan.")
        (sleep (ai_play_line ai_current_actor "0060"))
        (cs_look_object true (ai_get_object "e7_mars_inf0/johnson0"))
        (sleep 20)
        (print "cpn: a day's rations says i do this in one cut.")
        (sleep (ai_play_line ai_current_actor "0070"))
        (cs_start_to e7_pro_inf0_sentry/p1)
        (sleep 20)
        (set g_e7_pro_captain_done true)
        (print "guard: two cuts, at least")
        (sleep (ai_play_line "e7_pro_inf0/guard0" "0090"))
        (sleep 20)
        (print "cpn: done!")
        (sleep (ai_play_line ai_current_actor "0100"))
        (sleep_until g_e7_pro_sentry_alerted 10)
        (ai_magically_see_object ai_current_squad (player0))
        (cs_force_combat_status 4)
    )
)

(script command_script void cs_e7_pro_inf0_sentry0_alerted
    (begin
        (print "sentry: wait, movement!")
        (sleep (ai_play_line ai_current_actor "0110"))
        (set g_e7_pro_sentry_alerted true)
        (ai_magically_see_object ai_current_squad (player0))
        (cs_force_combat_status 4)
    )
)

(script command_script void cs_e7_pro_inf0_sentry0
    (begin
        (cs_abort_on_damage true)
        (sleep_until 
            (or
                g_e7_pro_captain_done
                (<= (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 5.0)
            ) 
        10)
        (cs_look true e7_pro_inf0_sentry/look0)
        (sleep 45)
        (cs_face true e7_pro_inf0_sentry/look1)
        (sleep 60)
        (cs_queue_command_script ai_current_actor cs_e7_pro_inf0_sentry0_alerted)
    )
)

(script dormant void e7_mars_inf0_main
    (begin
        (ai_place "e7_mars_inf0")
        (sleep_until (volume_test_objects "tv_e7_on_ledge" (players)) 3)
        (set g_e7_pro_sentry_alerted true)
        (set g_e7_mars_johnson_go true)
    )
)

(script dormant void e7_pro_inf0_main
    (begin
        (ai_place "e7_pro_inf0")
        (ai_prefer_target (ai_actors "e7_cov") true)
    )
)

(script dormant void e7_cov_hunters0_main
    (begin
        (sleep 1)
    )
)

(script dormant void e7_cov_inf0_main
    (begin
        (ai_migrate "e6_cov_hunters0" "e7_cov_hunters0")
        (sleep_until 
            (begin
                (if (<= (ai_living_count "e6_cov") 0) 
                    (= 1.0 1.0) (begin
                        (if (< (ai_living_count "e7_cov_inf0") 2) 
                            (begin
                                (print "migrated an actor")
                                (ai_migrate (object_get_ai (list_get (ai_actors "e6_cov") 0)) "e7_cov_inf0")
                            )
                        )
                        (= 1.0 0.0)
                    )
                )
            )
        )
    )
)

(script startup void e7_scarab_main
    (begin
        (pvs_clear "scarab")
        (device_set_position_track "scarab" "delta_ledge_idle" 0.0)
        (device_animate_position "scarab" 1.0 2.0 0.0 0.0 true)
        (player_enable_input)
        (sleep_until g_e7_mars_johnson_aboard 2)
        (pvs_clear "scarab")
        (device_set_position_track "scarab" "delta_ledge_rear_back" 0.0)
        (device_animate_position "scarab" 1.0 (/ 70.0 30.0) 0.0 0.0 true)
        (sleep_until (>= (device_get_position "scarab") 1.0) 1)
        (sleep_until 
            (begin
                (device_set_position_track "scarab" "delta_ledge_rear_idle" 0.0)
                (device_animate_position "scarab" 1.0 (/ 120.0 30.0) 0.0 0.0 true)
                (sleep_until (>= (device_get_position "scarab") 1.0) 1)
                (and
                    (= (version) 0)
                    (not (volume_test_objects "tv_e7_brute_area" (ai_actors "e7_pro_inf0")))
                    (game_all_quiet)
                )
            ) 
        5)
        (cinematic_fade_to_white)
        (ai_erase "e7_mars")
        (object_destroy "scarab")
        (object_teleport (player0) "player0_e8_stash")
        (object_teleport (player1) "player1_e8_stash")
        (object_cannot_take_damage (players))
        (object_hide (player0) true)
        (object_hide (player1) true)
        (cinematic_johnson_ledge)
        (ui_error_ok_cancel)
        (sound_class_enable_ducker "amb" 0.0 0)
        (sleep 1)
        (sound_class_enable_ducker "amb" 1.0 15)
        (object_teleport (player0) "player0_e8_start")
        (object_teleport (player1) "player1_e8_start")
        (object_can_take_damage (players))
        (object_hide (player0) false)
        (object_hide (player1) false)
        (object_create "scarab")
        (pvs_clear "scarab")
        (device_set_position_track "scarab" "delta_ledge_idle" 0.0)
        (wake e8_main)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (cinematic_fade_from_white_bars)
        (wake chapter_title1)
    )
)

(script dormant void e7_main
    (begin
        (sleep_until 
            (and
                (= (version) 0)
                (volume_test_objects "tv_e7_main_begin" (players))
            ) 
        15)
        (set g_e7_started true)
        (game_save_no_timeout)
        (print "e7_main")
        (data_mine_insert "e7_scarab_ledge")
        (cinematic_clone_players_weapon 0.0)
        (device_operates_automatically_set "e7_door0" true)
        (wake music_08b_05_stop)
        (wake e7_cov_inf0_main)
        (wake e7_cov_hunters0_main)
        (wake e7_pro_inf0_main)
        (wake e7_mars_inf0_main)
        (sleep_until g_e8_started)
        (ai_disposable "e7_cov" true)
        (ai_disposable "e7_pro" true)
        (sleep_until g_e9_started)
        (sleep_forever e7_cov_inf0_main)
        (sleep_forever e7_cov_hunters0_main)
        (sleep_forever e7_pro_inf0_main)
        (sleep_forever e7_mars_inf0_main)
    )
)

(script static void test_scarab_boarding
    (begin
        (object_teleport (player0) "e7_test")
        (ai_place "e7_cov_inf0")
        (ai_place "e7_cov_hunters0")
        (if (not g_e7_started) 
            (wake e7_main))
    )
)

(script static boolean e6_room_cleared
    (begin
        (and
            (<= (ai_living_count "e6_pro") 0)
            (< (object_get_health "e6_jail_shield1") 0.0)
            (< (object_get_health "e6_jail_shield2") 0.0)
            (< (object_get_health "e6_jail_shield4") 0.0)
        )
    )
)

(script command_script void cs_e6_destroy_door0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_certain)
        (if (>= (object_get_health "e6_jail_shield0") 0.0) 
            (begin
                (cs_start_to cs_e6_hunter_room/near_shield0)
                (sleep_until 
                    (or
                        (not (cs_moving))
                        (< (object_get_health "e6_jail_shield0") 0.0)
                    ) 
                15)
                (if (>= (object_get_health "e6_jail_shield0") 0.0) 
                    (cs_shoot_point true cs_e6_hunter_room/shield0))
                (sleep_until (< (object_get_health "e6_jail_shield0") 0.0) 15 150)
                (cs_shoot_point false cs_e6_hunter_room/shield0)
            )
        )
    )
)

(script command_script void cs_e6_destroy_door1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_certain)
        (if (>= (object_get_health "e6_jail_shield1") 0.0) 
            (begin
                (cs_start_to cs_e6_hunter_room/near_shield1)
                (sleep_until 
                    (or
                        (not (cs_moving))
                        (< (object_get_health "e6_jail_shield1") 0.0)
                    ) 
                15)
                (if (>= (object_get_health "e6_jail_shield1") 0.0) 
                    (cs_shoot_point true cs_e6_hunter_room/shield1))
                (sleep_until (< (object_get_health "e6_jail_shield1") 0.0) 15 150)
                (cs_shoot_point false cs_e6_hunter_room/shield1)
            )
        )
    )
)

(script command_script void cs_e6_destroy_door2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_certain)
        (if (>= (object_get_health "e6_jail_shield2") 0.0) 
            (begin
                (cs_start_to cs_e6_hunter_room/near_shield2)
                (sleep_until 
                    (or
                        (not (cs_moving))
                        (< (object_get_health "e6_jail_shield2") 0.0)
                    ) 
                15)
                (if (>= (object_get_health "e6_jail_shield2") 0.0) 
                    (cs_shoot_point true cs_e6_hunter_room/shield2))
                (sleep_until (< (object_get_health "e6_jail_shield2") 0.0) 15 150)
                (cs_shoot_point false cs_e6_hunter_room/shield2)
            )
        )
    )
)

(script command_script void cs_e6_destroy_door3
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_certain)
        (if (>= (object_get_health "e6_jail_shield3") 0.0) 
            (begin
                (cs_start_to cs_e6_hunter_room/near_shield3)
                (sleep_until 
                    (or
                        (not (cs_moving))
                        (< (object_get_health "e6_jail_shield3") 0.0)
                    ) 
                15)
                (if (>= (object_get_health "e6_jail_shield3") 0.0) 
                    (cs_shoot_point true cs_e6_hunter_room/shield3))
                (sleep_until (< (object_get_health "e6_jail_shield3") 0.0) 15 150)
                (cs_shoot_point false cs_e6_hunter_room/shield3)
            )
        )
    )
)

(script command_script void cs_e6_destroy_door4
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_certain)
        (if (>= (object_get_health "e6_jail_shield4") 0.0) 
            (begin
                (cs_start_to cs_e6_hunter_room/near_shield4)
                (sleep_until 
                    (or
                        (not (cs_moving))
                        (< (object_get_health "e6_jail_shield4") 0.0)
                    ) 
                15)
                (if (>= (object_get_health "e6_jail_shield4") 0.0) 
                    (cs_shoot_point true cs_e6_hunter_room/shield4))
                (sleep_until (< (object_get_health "e6_jail_shield4") 0.0) 15 150)
                (cs_shoot_point false cs_e6_hunter_room/shield4)
            )
        )
    )
)

(script command_script void cs_e6_destroy_door5
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_abort_on_combat_status ai_combat_status_certain)
        (if (>= (object_get_health "e6_jail_shield5") 0.0) 
            (begin
                (cs_start_to cs_e6_hunter_room/near_shield5)
                (sleep_until 
                    (or
                        (not (cs_moving))
                        (< (object_get_health "e6_jail_shield5") 0.0)
                    ) 
                15)
                (if (>= (object_get_health "e6_jail_shield5") 0.0) 
                    (cs_shoot_point true cs_e6_hunter_room/shield5))
                (sleep_until (< (object_get_health "e6_jail_shield5") 0.0) 15 150)
                (cs_shoot_point false cs_e6_hunter_room/shield5)
            )
        )
    )
)

(script command_script void cs_e6_release_captives
    (begin
        (cs_abort_on_combat_status ai_combat_status_certain)
        (if 
            (and
                (>= (object_get_health "e6_jail_shield4") 0.0)
                (not (cs_command_script_queued ai_current_squad cs_e6_destroy_door4))
            ) 
                (begin
                    (cs_stack_command_script ai_current_actor cs_e6_destroy_door4)
                    (sleep 30)
                )
        )
        (if 
            (and
                (>= (object_get_health "e6_jail_shield1") 0.0)
                (not (cs_command_script_queued ai_current_squad cs_e6_destroy_door1))
            ) 
                (begin
                    (cs_stack_command_script ai_current_actor cs_e6_destroy_door1)
                    (sleep 30)
                )
        )
        (if 
            (and
                (>= (object_get_health "e6_jail_shield2") 0.0)
                (not (cs_command_script_queued ai_current_squad cs_e6_destroy_door2))
            ) 
                (begin
                    (cs_stack_command_script ai_current_actor cs_e6_destroy_door2)
                    (sleep 30)
                )
        )
    )
)

(script command_script void cs_e6_jailbreak_behavior
    (begin
        (cs_enable_moving true)
        (cs_enable_targeting true)
        (cs_enable_dialogue true)
        (sleep_until 
            (begin
                (if 
                    (and
                        (not (unit_has_weapon (ai_get_unit ai_current_actor) "objects\weapons\melee\energy_blade\energy_blade.weapon"))
                        (< (ai_combat_status ai_current_actor) ai_combat_status_certain)
                    ) 
                        (cs_stack_command_script ai_current_actor cs_e6_release_captives))
                (or
                    (e6_room_cleared)
                    (unit_has_weapon (ai_get_unit ai_current_actor) "objects\weapons\melee\energy_blade\energy_blade.weapon")
                )
            ) 
        60)
    )
)

(script command_script void cs_e6_cov_inf1_1_init
    (begin
        (ai_disregard (ai_get_object ai_current_actor) true)
        (sleep_until 
            (or
                (>= (ai_combat_status "e6_pro") ai_combat_status_active)
                (< (object_get_health "e6_jail_shield1") 0.0)
            ) 
        15)
        (cs_ignore_obstacles true)
        (cs_go_to cs_e6_hunter_room/elite1_approach)
        (cs_look_player true)
        (sleep_until 
            (begin
                (begin_random
                    (if (>= (object_get_health "e6_jail_shield1") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:cheer" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield1") 0.0) 10 (random_range 90 150))
                        )
                    )
                    (if (>= (object_get_health "e6_jail_shield1") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:shakefist" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield1") 0.0) 10 (random_range 90 150))
                        )
                    )
                    (if (>= (object_get_health "e6_jail_shield1") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:warn" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield1") 0.0) 10 (random_range 90 150))
                        )
                    )
                    (if (>= (object_get_health "e6_jail_shield1") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:wave" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield1") 0.0) 10 (random_range 90 150))
                        )
                    )
                )
                (or
                    (< (object_get_health "e6_jail_shield1") 0.0)
                    (<= (ai_living_count "e6_pro") 0)
                )
            ) 
        15)
        (sleep_until (< (object_get_health "e6_jail_shield1") 0.0) 15)
        (ai_disregard (ai_get_object ai_current_actor) false)
        (cs_queue_command_script ai_current_actor cs_e6_jailbreak_behavior)
    )
)

(script command_script void cs_e6_cov_inf1_2_init
    (begin
        (ai_disregard (ai_get_object ai_current_actor) true)
        (sleep_until 
            (or
                (>= (ai_combat_status "e6_pro") ai_combat_status_active)
                (< (object_get_health "e6_jail_shield2") 0.0)
            ) 
        15)
        (cs_ignore_obstacles true)
        (cs_go_to cs_e6_hunter_room/elite2_approach)
        (cs_look_player true)
        (sleep_until 
            (begin
                (begin_random
                    (if (>= (object_get_health "e6_jail_shield2") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:cheer" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield2") 0.0) 10 (random_range 90 150))
                        )
                    )
                    (if (>= (object_get_health "e6_jail_shield2") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:shakefist" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield2") 0.0) 10 (random_range 90 150))
                        )
                    )
                    (if (>= (object_get_health "e6_jail_shield2") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:warn" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield2") 0.0) 10 (random_range 90 150))
                        )
                    )
                    (if (>= (object_get_health "e6_jail_shield2") 0.0) 
                        (begin
                            (custom_animation (ai_get_unit ai_current_actor) "objects\characters\elite\elite" "combat:pistol:wave" true)
                            (sleep (unit_get_custom_animation_time (ai_get_unit ai_current_actor)))
                            (sleep_until (< (object_get_health "e6_jail_shield2") 0.0) 10 (random_range 90 150))
                        )
                    )
                )
                (or
                    (< (object_get_health "e6_jail_shield2") 0.0)
                    (<= (ai_living_count "e6_pro") 0)
                )
            ) 
        15)
        (sleep_until (< (object_get_health "e6_jail_shield2") 0.0) 15)
        (ai_disregard (ai_get_object ai_current_actor) false)
        (cs_queue_command_script ai_current_actor cs_e6_jailbreak_behavior)
    )
)

(script command_script void cs_e6_cov_hunters0_0_init
    (begin
        (ai_disregard (ai_get_object ai_current_actor) true)
        (sleep_until 
            (or
                (ai_trigger_test "generic_player_sighted" ai_current_squad)
                (< (object_get_health "e6_jail_shield4") 0.0)
            ) 
        15)
        (cs_look_player true)
        (sleep_until (< (object_get_health "e6_jail_shield4") 0.0) 15)
        (ai_disregard (ai_get_object ai_current_actor) false)
        (cs_force_combat_status 4)
        (cs_look_player false)
        (cs_queue_command_script ai_current_actor cs_e6_jailbreak_behavior)
    )
)

(script command_script void cs_e6_jailbreak_scene
    (begin
        (ai_play_line ai_current_actor "0610")
    )
)

(script dormant void e6_pro_inf0_main
    (begin
        (ai_place "e6_pro_inf0_0")
        (ai_place "e6_pro_inf0_1")
        (sleep_until 
            (or
                (> (ai_combat_status "e6_pro_inf0") ai_combat_status_clear_los)
                (<= (ai_living_count "e6_pro_inf0_0") 2)
            ) 
        15)
        (wake music_08b_05_start_alt)
        (sleep_until (<= (ai_living_count "e6_pro_inf0_0") 2))
        (ai_place "e6_pro_inf0_2")
        (sleep 15)
        (device_operates_automatically_set "e6_door0" true)
    )
)

(script dormant void e6_cov_hunters0_main
    (begin
        (ai_migrate "e5_cov_hunters0" "e6_cov_hunters0")
        (if (>= (ai_living_count "e6_cov_hunters0") 2) 
            (sleep_forever))
        (ai_place "e6_cov_hunters0")
        (ai_set_orders "e6_cov_hunters0" "e6_cov_hunters0_engage1")
    )
)

(script dormant void e6_cov_inf1_main
    (begin
        (ai_place "e6_cov_inf1_1")
        (ai_place "e6_cov_inf1_2")
    )
)

(script dormant void e6_cov_inf0_main
    (begin
        (ai_migrate "e5_cov_inf0" "e6_cov_inf0")
        (sleep_until (volume_test_objects "tv_e6_main_room" (ai_actors "e6_cov_inf0")))
        (sleep_until (ai_scene "e6_jailbreak_scene" cs_e6_jailbreak_scene "e6_cov_inf0") 30 300)
        (sleep_until 
            (and
                (> (ai_spawn_count "e6_pro_inf0_2") 0)
                (<= (ai_living_count "e6_pro_inf0_2") 0)
            )
        )
        (cs_run_command_script "e6_cov_inf0" cs_e6_jailbreak_behavior)
        (sleep_until (e6_room_cleared))
        (game_save_no_timeout)
        (ai_migrate "e6_cov_inf1" "e6_cov_inf0")
        (ai_set_orders "e6_cov_inf0" "e6_cov_inf0_continue")
    )
)

(script dormant void e6_main
    (begin
        (sleep_until (volume_test_objects "tv_e6_main_begin" (players)) 15)
        (set g_e6_started true)
        (game_save_no_timeout)
        (print "e6_main")
        (data_mine_insert "e6_jail")
        (wake music_08b_05_start)
        (wake e7_main)
        (wake e6_cov_inf0_main)
        (wake e6_cov_inf1_main)
        (wake e6_cov_hunters0_main)
        (wake e6_pro_inf0_main)
        (sleep_until g_e7_started)
        (sleep_forever e6_cov_inf0_main)
        (sleep_forever e6_cov_inf1_main)
        (sleep_forever e6_cov_hunters0_main)
        (sleep_forever e6_pro_inf0_main)
        (ai_disposable "e6_pro" true)
    )
)

(script static void test_hunter_room
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e6_test")
        (ai_place "e6_cov_inf0")
        (if (not g_e6_started) 
            (wake e6_main))
    )
)

(script command_script void cs_e5_pro_phantom0_entry
    (begin
        (cs_fly_to_and_face e5_pro_phantom0/p0 e5_pro_phantom0/p1)
        (cs_fly_by e5_pro_phantom0/p1)
    )
)

(script command_script void cs_e5_pro_phantom0_exit
    (begin
        (cs_fly_to_and_face e5_pro_phantom0/p2 e5_pro_phantom0/p2_facing)
        (cs_fly_by e5_pro_phantom0/p3)
        (cs_vehicle_boost true)
        (cs_fly_by e5_pro_phantom0/p4)
        (ai_erase ai_current_squad)
    )
)

(script dormant void e5_pro_phantom0_main
    (begin
        (sleep_until (volume_test_objects "tv_e5_pro_phantom0_begin" (players)) 15)
        (ai_place "e5_pro_phantom0")
        (sleep_until 
            (or
                (<= (object_get_health (ai_vehicle_get "e5_pro_phantom0/phantom0")) 0.05)
                (>= (object_model_targets_destroyed (ai_vehicle_get "e5_pro_phantom0/phantom0") "target_front") 3)
                (volume_test_objects "tv_e7_main_begin" (players))
            ) 
        30 one_minute)
        (cs_run_command_script "e5_pro_phantom0/phantom0" cs_e5_pro_phantom0_exit)
    )
)

(script dormant void e5_pro_inf3_main
    (begin
        (sleep_until (volume_test_objects "tv_e5_pro_inf3_init" (players)) 15)
        (ai_place "e5_pro_inf3")
    )
)

(script dormant void e5_pro_inf2_main
    (begin
        (sleep_until 
            (begin
                (if (< (+ (ai_living_count "e5_pro_inf0") (ai_living_count "e5_pro_inf1") (ai_living_count "e5_pro_inf2")) g_e5_pro_inf2_limit) 
                    (ai_place "e5_pro_inf2" 1))
                (or
                    (volume_test_objects "tv_e5_bridge_exit" (players))
                    (>= (ai_spawn_count "e5_pro_inf2") g_e5_pro_inf2_limit)
                )
            ) 
        30)
    )
)

(script dormant void e5_pro_inf1_main
    (begin
        (ai_place "e5_pro_inf1")
    )
)

(script dormant void e5_pro_inf0_main
    (begin
        (ai_place "e5_pro_inf0")
    )
)

(script dormant void e5_cov_hunters0_main
    (begin
        (sleep_until 
            (and
                (<= (ai_living_count "e4_pro_inf0") 0)
                (<= (ai_living_count "e4_pro_inf1") 0)
                (<= (ai_living_count "e4_pro_inf3") 0)
            )
        )
        (sleep_until (= (version) 1) 15)
        (sleep_until (= (version) 0) 15)
        (ai_migrate "e4_cov_hunters0" "e5_cov_hunters0")
        (ai_teleport_to_starting_location_if_outside_bsp "e5_cov_hunters0")
    )
)

(script dormant void e5_cov_inf0_main
    (begin
        (sleep_until 
            (and
                (<= (ai_living_count "e4_pro_inf0") 0)
                (<= (ai_living_count "e4_pro_inf1") 0)
                (<= (ai_living_count "e4_pro_inf3") 0)
            )
        )
        (sleep_until (= (version) 1) 15)
        (sleep_until (= (version) 0) 15)
        (ai_migrate "e4_cov_inf0" "e5_cov_inf0")
        (ai_teleport_to_starting_location_if_outside_bsp "e5_cov_inf0")
    )
)

(script dormant void e5_main
    (begin
        (sleep_until 
            (and
                (volume_test_objects "tv_e5_main_begin" (players))
                (= (version) 0)
            ) 
        15)
        (set g_e5_started true)
        (game_save_no_timeout)
        (print "e5_main")
        (data_mine_insert "e5_bridge")
        (cinematic_move_attached_objects 0.0 0.5)
        (wake e6_main)
        (wake e5_cov_inf0_main)
        (wake e5_cov_hunters0_main)
        (wake e5_pro_inf0_main)
        (wake e5_pro_inf1_main)
        (wake e5_pro_inf2_main)
        (wake e5_pro_phantom0_main)
        (sleep_until g_e6_started)
        (sleep_forever e5_cov_inf0_main)
        (sleep_forever e5_cov_hunters0_main)
        (sleep_forever e5_pro_inf0_main)
        (sleep_forever e5_pro_inf1_main)
        (sleep_forever e5_pro_inf2_main)
        (sleep_forever e5_pro_phantom0_main)
        (ai_disposable "e5_pro" true)
        (ai_disposable "e5_pro_phantom0" false)
    )
)

(script static void test_bridge
    (begin
        (object_teleport (player0) "e5_test")
        (ai_place "e5_cov_inf0")
        (ai_place "e5_cov_hunters0")
        (if (not g_e5_started) 
            (wake e5_main))
    )
)

(script dormant void e4_music
    (begin
        (sleep_until (volume_test_objects "tv_e4_halfway" (players)) 15)
        (wake music_08b_04_start)
        (sleep 2)
        (game_save_no_timeout)
        (sleep_until (volume_test_objects "tv_e4_main_shutdown" (players)) 15)
        (wake music_08b_03_stop)
        (wake music_08b_04_stop)
    )
)

(script dormant void e4_pro_inf3_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e4_corner" (players))
                (<= (ai_living_count "e4_pro_inf0") 0)
                (<= (ai_living_count "e4_pro_inf1") 0)
            ) 
        15)
        (ai_place "e4_pro_inf3" (- 6.0 (ai_living_count "e4_pro_inf0")))
    )
)

(script dormant void e4_pro_inf2_main
    (begin
        (sleep_until 
            (or
                (volume_test_objects "tv_e4_corner" (players))
                (<= (ai_living_count "e4_pro_inf0") 0)
                (<= (ai_living_count "e4_pro_inf1") 0)
            ) 
        15)
        (ai_place "e4_pro_inf2")
    )
)

(script dormant void e4_pro_inf1_main
    (begin
        (ai_place "e4_pro_inf1")
    )
)

(script dormant void e4_pro_inf0_main
    (begin
        (ai_place "e4_pro_inf0")
    )
)

(script dormant void e4_cov_hunters0_main
    (begin
        (ai_migrate "e3_cov_hunters0" "e4_cov_hunters0")
    )
)

(script dormant void e4_cov_inf0_main
    (begin
        (ai_migrate "e3_cov_inf0" "e4_cov_inf0")
    )
)

(script dormant void e4_main
    (begin
        (sleep_until (volume_test_objects "tv_e4_main_begin" (players)) 15)
        (set g_e4_started true)
        (game_save_no_timeout)
        (print "e4_main")
        (data_mine_insert "e4_generator_room")
        (wake music_08b_03_start)
        (wake e5_main)
        (wake e4_cov_inf0_main)
        (wake e4_cov_hunters0_main)
        (wake e4_pro_inf0_main)
        (wake e4_pro_inf1_main)
        (wake e4_pro_inf3_main)
        (wake e4_music)
        (sleep_until (volume_test_objects "tv_e4_main_shutdown" (players)) 15)
        (sleep_forever e4_cov_inf0_main)
        (sleep_forever e4_cov_hunters0_main)
        (sleep_forever e4_pro_inf0_main)
        (sleep_forever e4_pro_inf1_main)
        (sleep_forever e4_pro_inf2_main)
        (sleep_forever e4_pro_inf3_main)
        (sleep_until g_e5_started)
        (ai_disposable "e4_pro" true)
    )
)

(script static void test_generator_cave
    (begin
        (structure_bsp_index 1)
        (sleep 1)
        (object_teleport (player0) "e4_test")
        (ai_place "e4_cov_inf0")
        (ai_place "e4_cov_hunters0")
        (if (not g_e4_started) 
            (wake e4_main))
    )
)

(script static boolean e3_cov_hunters0_break
    (begin
        (or
            (and
                (> (ai_spawn_count "e3_pro_inf0") 0)
                (<= (ai_living_count "e3_pro_inf0_0") 1)
            )
            (volume_test_objects "tv_e3_player_advance2" (players))
        )
    )
)

(script command_script void cs_e3_cov_hunters0_0
    (begin
        (cs_crouch true)
        (cs_look_player true)
        (unit_impervious (ai_get_unit ai_current_actor) true)
        (object_cannot_die (ai_get_object ai_current_actor) true)
        (sleep_until 
            (or
                g_e3_hunters_rise
                (volume_test_objects "tv_e3_player_advance0" (players))
            ) 
        5)
        (sleep 20)
        (cs_crouch false)
        (sleep_until 
            (or
                g_e3_hunter0_go
                (volume_test_objects "tv_e3_player_advance0" (players))
            ) 
        5)
        (cs_ignore_obstacles true)
        (cs_look_player false)
        (cs_enable_looking true)
        (cs_start_to e3_intro_bsp0/p0)
        (sleep_until 
            (and
                (not (cs_moving))
                (= (version) 1)
            ) 
        5)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e3_intro_bsp1/p0)
        (cs_crouch true)
        (cs_enable_targeting true)
        (cs_go_to e3_intro_bsp1/p1_0)
        (sleep_until (e3_cov_hunters0_break) 15 30_seconds)
        (set g_e3_hunter0_arrived true)
        (ai_renew ai_current_actor)
        (unit_impervious (ai_get_unit ai_current_actor) false)
        (object_cannot_die (ai_get_object ai_current_actor) false)
    )
)

(script command_script void cs_e3_cov_hunters0_1
    (begin
        (cs_crouch true)
        (cs_look_player true)
        (unit_impervious (ai_get_unit ai_current_actor) true)
        (object_cannot_die (ai_get_object ai_current_actor) true)
        (sleep_until 
            (or
                g_e3_hunters_rise
                (volume_test_objects "tv_e3_player_advance0" (players))
            ) 
        5)
        (sleep 30)
        (cs_crouch false)
        (sleep_until 
            (or
                g_e3_hunter1_go
                (volume_test_objects "tv_e3_player_advance0" (players))
            ) 
        5)
        (cs_ignore_obstacles true)
        (cs_look_player false)
        (cs_enable_looking true)
        (cs_start_to e3_intro_bsp0/p1)
        (sleep_until 
            (and
                (not (cs_moving))
                (= (version) 1)
            ) 
        5)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e3_intro_bsp1/p0)
        (cs_crouch true)
        (cs_enable_targeting true)
        (cs_go_to e3_intro_bsp1/p1_1)
        (sleep_until (e3_cov_hunters0_break) 15 30_seconds)
        (set g_e3_hunter1_arrived true)
        (ai_renew ai_current_actor)
        (unit_impervious (ai_get_unit ai_current_actor) false)
        (object_cannot_die (ai_get_object ai_current_actor) false)
    )
)

(script command_script void cs_e3_cov_inf0_0
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_crouch true)
        (cs_look_player true)
        (sleep_until (> (device_get_position "e2_exit_door") 0.1) 5)
        (cs_crouch false)
        (set g_e3_hunters_rise true)
        (print "elite: hold your fire!")
        (sleep (ai_play_line_at_player ai_current_actor "0560"))
        (cs_jump_to_point 1.0 2.25)
        (sleep 25)
        (print "elite: the hunters rawk")
        (ai_play_line_at_player ai_current_actor "0570")
        (sleep 20)
        (cs_look_object true (ai_get_object "e3_cov_hunters0/hunter0"))
        (sleep 40)
        (set g_e3_hunter0_go true)
        (cs_look_object true (ai_get_object "e3_cov_hunters0/hunter1"))
        (sleep 30)
        (set g_e3_hunter1_go true)
        (cs_look_object false (ai_get_object "e3_cov_hunters0/hunter1"))
        (cs_enable_looking true)
        (cs_move_in_direction -20.0 0.5 0.0)
        (cs_start_to e3_intro_bsp0/p2)
        (sleep_until 
            (and
                (not (cs_moving))
                (= (version) 1)
            ) 
        5)
        (cs_go_to e3_intro_bsp1/p0)
        (sleep_until 
            (and
                g_e3_hunter0_arrived
                g_e3_hunter1_arrived
            )
        )
        (cs_go_to e3_intro_bsp1/p2)
    )
)

(script command_script void cs_e3_cov_inf0_init
    (begin
        (cs_crouch true)
        (cs_look_player true)
        (sleep_until (> (device_get_position "e2_exit_door") 0.0) 5)
        (sleep 30)
        (cs_crouch false)
        (sleep_until (volume_test_objects "tv_e3_player_advance0" (players)) 15 200)
    )
)

(script command_script void cs_e3_pro_inf2_idle
    (begin
        (cs_crouch true)
        (sleep_until (>= (ai_combat_status ai_current_actor) ai_combat_status_active) 3)
        (cs_crouch false)
        (cs_go_to e3_intro_bsp1/p3)
    )
)

(script command_script void cs_e3_weapon_scene
    (begin
        (cs_play_line "0580")
    )
)

(script dormant void e3_weapon_scene
    (begin
        (sleep_until (ai_scene "e3_weapons_scene" cs_e3_weapon_scene "e3_cov"))
    )
)

(script dormant void e3_objective_failsafe
    (begin
        (sleep_until (> (device_get_position "e2_exit_door") 0.0) 5 30)
        (wake objective1_set)
    )
)

(script dormant void e3_pro_inf2_main
    (begin
        (sleep_until (= (version) 1) 5)
        (ai_place "e3_pro_inf2")
    )
)

(script dormant void e3_pro_inf1_main
    (begin
        (sleep_until (volume_test_objects "tv_e3_pro_inf1_begin" (players)) 15)
        (ai_place "e3_pro_inf1")
    )
)

(script dormant void e3_pro_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e3_pro_inf0_begin" (players)) 15)
        (ai_place "e3_pro_inf0_0")
        (sleep_until 
            (or
                (volume_test_objects "tv_e3_player_advance2" (players))
                (<= (ai_living_count "e3_pro_inf0") 2)
            ) 
        15)
        (ai_place "e3_pro_inf0_1" (pin (- 7.0 (ai_living_count "e3_pro_inf0")) 2.0 4.0))
    )
)

(script dormant void e3_cov_hunters0_main
    (begin
        (ai_place "e3_cov_hunters0")
        (cs_run_command_script "e3_cov_hunters0/hunter0" cs_e3_cov_hunters0_0)
        (cs_run_command_script "e3_cov_hunters0/hunter1" cs_e3_cov_hunters0_1)
    )
)

(script dormant void e3_cov_inf0_main
    (begin
        (ai_place "e3_cov_inf0")
        (sleep_until (> (device_get_position "e2_exit_door") 0.0) 5 30)
        (wake music_08b_02_stop)
    )
)

(script dormant void e3_main
    (begin
        (sleep_until (volume_test_objects "tv_e3_main_begin" (players)) 15)
        (set g_e3_started true)
        (game_save_no_timeout)
        (print "e3_main")
        (data_mine_insert "e3_ramp_room")
        (wake e4_main)
        (wake e3_cov_inf0_main)
        (wake e3_cov_hunters0_main)
        (wake e3_pro_inf0_main)
        (wake e3_objective_failsafe)
        (sleep_until g_e4_started)
        (sleep_forever e3_cov_inf0_main)
        (sleep_forever e3_cov_hunters0_main)
        (sleep_forever e3_pro_inf0_main)
        (sleep_forever e3_pro_inf1_main)
        (sleep_forever e3_pro_inf2_main)
        (ai_disposable "e3_pro" true)
        (sleep_until g_e5_started)
        (ai_erase "e3_cov")
        (ai_erase "e3_pro")
    )
)

(script static void test_ramp_room
    (begin
        (object_teleport (player0) "e3_test")
        (if (not g_e3_started) 
            (wake e3_main))
        (device_operates_automatically_set "e2_exit_door" true)
    )
)

(script dormant void e2_dialogue
    (begin
        (sleep_until 
            (and
                (objects_can_see_object (players) "scarab" 15.0)
                (game_all_quiet)
            ) 
        15 300)
        (sleep_until (objects_can_see_object (players) "scarab" 15.0) 15 30_seconds)
        (sleep (ai_play_line_at_player (object_get_ai g_cov_commander) "0520"))
        (sleep_until 
            (and
                (objects_can_see_object (players) "e2_exit_door" 15.0)
                (game_all_quiet)
            ) 
        15 300)
        (sleep_until (objects_can_see_object (players) "e2_exit_door" 15.0) 15 30_seconds)
        (sleep (ai_play_line_at_player (object_get_ai g_cov_commander) "0530"))
        (game_save_no_timeout)
        (wake objective0_clear)
        (wake objective1_set)
        (sleep_until 
            (and
                (> (ai_spawn_count "e2_pro_wraith0") 0)
                (<= (ai_living_count "e2_pro_wraith0") 0)
                (volume_test_objects "tv_e2_near_perimeter" (players))
                (game_all_quiet)
            )
        )
        (sleep (ai_play_line_at_player (object_get_ai g_cov_commander) "0540"))
    )
)

(script dormant void e2_door_unlocker
    (begin
        (sleep_until 
            (and
                (> (ai_spawn_count "e2_pro_wraith0") 0)
                (<= (ai_living_count "e2_pro_wraith0") 0)
            )
        )
        (sleep_until (volume_test_objects "tv_e3_main_begin" (players)) 15)
        (device_operates_automatically_set "e2_exit_door" true)
    )
)

(script command_script void cs_e2_pro_phantom0_0_entry
    (begin
        (cs_fly_to e2_pro_phantom0_0/p0)
        (cs_fly_to_and_face e2_pro_phantom0_0/p1 e2_pro_phantom0_0/p1_facing)
    )
)

(script command_script void cs_e2_pro_phantom0_0_exit
    (begin
        (cs_fly_to_and_face e2_pro_phantom0_0/p1 e2_pro_phantom0_0/p1_facing)
        (cs_fly_to_and_face e2_pro_phantom0_0/p1 e2_pro_phantom0_0/p2 0.5)
        (cs_fly_to_and_face e2_pro_phantom0_0/p2 e2_pro_phantom0_0/p3 1.0)
        (cs_vehicle_boost true)
        (cs_fly_by e2_pro_phantom0_0/p3)
        (ai_erase ai_current_squad)
    )
)

(script static void e2_pro_ghosts0_enter
    (begin
        (ai_enter_squad_vehicles ai_current_squad)
    )
)

(script dormant void e2_pro_phantoms0_main
    (begin
        (ai_place "e2_pro_phantom0_0")
        (sleep_until 
            (or
                (<= (object_get_health (ai_vehicle_get "e2_pro_phantom0_0/phantom0")) 0.05)
                (>= (object_model_targets_destroyed (ai_vehicle_get "e2_pro_phantom0_0/phantom0") "target_front") 3)
            ) 
        30 one_minute)
        (cs_run_command_script "e2_pro_phantom0_0/phantom0" cs_e2_pro_phantom0_0_exit)
        (wake music_08b_01_stop)
        (wake music_08b_02_start)
    )
)

(script dormant void e2_pro_wraiths0_main
    (begin
        (sleep 150)
        (sleep_until 
            (or
                (volume_test_objects "tv_e2_pro_wraiths0_begin" (players))
                (<= (ai_living_count "e2_pro_phantom0") 0)
            ) 
        15)
        (ai_place "e2_pro_wraith0")
        (sleep_until (<= (ai_living_count "e2_pro_wraith0") 0))
        (game_save_no_timeout)
    )
)

(script dormant void e2_pro_ghosts0_main
    (begin
        (ai_place "e2_pro_ghosts0")
    )
)

(script dormant void e2_pro_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e2_near_perimeter" (players)) 15)
        (ai_place "e2_pro_inf0")
        (sleep_until (<= (ai_living_count "e2_pro_inf0") 0))
        (game_save_no_timeout)
    )
)

(script dormant void e2_cov_wraith0_main
    (begin
        (ai_migrate "e1_cov_wraiths0" "e2_cov_wraith0")
    )
)

(script dormant void e2_cov_spectre0_main
    (begin
        (ai_migrate "e1_cov_spectre0" "e2_cov_spectre0")
    )
)

(script dormant void e2_main
    (begin
        (sleep_until (volume_test_objects "tv_e2_main_begin" (players)) 15)
        (set g_e2_started true)
        (game_save_no_timeout)
        (print "e2_main")
        (data_mine_insert "e2_scarab_cove")
        (wake e3_main)
        (wake e2_cov_spectre0_main)
        (wake e2_cov_wraith0_main)
        (wake e2_pro_inf0_main)
        (wake e2_pro_wraiths0_main)
        (wake e2_pro_phantoms0_main)
        (wake e2_dialogue)
        (wake e2_door_unlocker)
        (sleep_until g_e3_started)
        (ai_disposable "e2_pro" true)
        (ai_disposable "e2_pro_phantom0" false)
        (sleep_until g_e4_started)
        (sleep_forever e2_cov_spectre0_main)
        (sleep_forever e2_cov_wraith0_main)
        (sleep_forever e2_pro_inf0_main)
        (sleep_forever e2_pro_ghosts0_main)
        (sleep_forever e2_pro_wraiths0_main)
        (sleep_forever e2_pro_phantoms0_main)
        (ai_disposable "e2_cov" true)
    )
)

(script static void test_scarab_cove
    (begin
        (object_teleport (player0) "e2_test")
        (if (not g_e2_started) 
            (wake e2_main))
        (ai_place "e2_cov_wraith0")
        (ai_place "e2_cov_spectre0")
    )
)

(script command_script void cs_e1_pro_phantom0_exit
    (begin
        (cs_fly_to_and_face e1_pro_phantom0_exit/p0 e1_pro_phantom0_exit/p1 1.0)
        (cs_fly_by e1_pro_phantom0_exit/p1)
        (cs_fly_by e1_pro_phantom0_exit/p2)
        (cs_fly_to_and_face e1_pro_phantom0_exit/p3 e1_pro_phantom0_exit/p4)
        (cs_vehicle_boost true)
        (cs_fly_by e1_pro_phantom0_exit/p4)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e1_pro_phantom0_entry
    (begin
        (cs_fly_by e1_pro_phantom0_entry/p0)
        (cs_fly_to_and_face e1_pro_phantom0_entry/p1 e1_pro_phantom0_entry/p1_facing 0.5)
        (cs_fly_to e1_pro_phantom0_entry/p2 0.5)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
        (ai_braindead "e1_pro_wraith0" false)
        (sleep 30)
        (cs_fly_by e1_pro_phantom0_entry/p1 0.5)
        (cs_fly_to_and_face e1_pro_phantom0_exit/p0 e1_pro_phantom0_exit/p1 1.0)
        (cs_fly_by e1_pro_phantom0_exit/p1)
        (cs_fly_by e1_pro_phantom0_exit/p2)
        (cs_fly_to_and_face e1_pro_phantom0_exit/p3 e1_pro_phantom0_exit/p4)
        (cs_vehicle_boost true)
        (cs_fly_by e1_pro_phantom0_exit/p4)
        (ai_erase ai_current_squad)
    )
)

(script command_script void cs_e1_cov_spectre0_init
    (begin
        (cs_go_to e1_cov_spectre0_entry/p0)
        (ai_overcomes_oversteer ai_current_actor true)
        (cs_face true e1_cov_spectre0_entry/p1)
        (sleep_until 
            (or
                (and
                    (players_in_vehicle)
                    (unit_in_vehicle g_cov_commander)
                )
                (volume_test_objects "tv_e1_canyon_entry" (players))
            ) 
        10)
        (ai_overcomes_oversteer ai_current_actor false)
        (cs_face false e1_cov_spectre0_entry/p1)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "e1_cov_spectre0/spectre0"))
    )
)

(script command_script void cs_e1_cov_spectre0_passenger
    (begin
        (cs_look_player true)
        (cs_face_player true)
        (sleep_until 
            (and
                (players_in_vehicle)
                (unit_in_vehicle g_cov_commander)
            ) 
        10)
        (cs_look_player false)
        (cs_face_player false)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "e1_cov_spectre0/spectre0"))
    )
)

(script command_script void cs_e1_cov_commander0_legendary
    (begin
        (cs_face_player true)
        (sleep_until 
            (or
                (players_in_vehicle)
                (volume_test_objects "tv_e1_canyon_entry" (players))
            ) 
        15)
        (cs_look_player false)
        (cs_face_player false)
    )
)

(script command_script void cs_e1_cov_commander0_init
    (begin
        (ai_vehicle_exit ai_current_actor)
        (sleep_until (not (unit_in_vehicle (ai_get_unit ai_current_actor))) 5)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to e1_cov_spectre0_entry/soc_p0)
        (cs_face_player true)
        (sleep_until 
            (or
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "e1_cov_wraiths0_0/wraith0") "wraith_d" (players))
                (players_in_vehicle)
                (volume_test_objects "tv_e1_canyon_entry" (players))
            ) 
        15)
        (cs_look_player false)
        (cs_face_player false)
        (if (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "e1_cov_wraiths0_0/wraith0") "wraith_d" (players)) 
            (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "e1_cov_spectre0/spectre0")) (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "e1_cov_wraiths0_0/wraith0")))
    )
)

(script command_script void cs_e1_pro_ghosts0_2_entry0
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_go_to e1_pro_ghosts0_entry/p8)
    )
)

(script command_script void cs_e1_pro_ghosts0_2_entry1
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_go_to e1_pro_ghosts0_entry/p9)
        (cs_go_to e1_pro_ghosts0_entry/p10)
    )
)

(script command_script void cs_e1_pro_ghosts0_1_entry0
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_go_to e1_pro_ghosts0_entry/p5)
    )
)

(script command_script void cs_e1_pro_ghosts0_1_entry1
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_go_to e1_pro_ghosts0_entry/p6)
        (cs_go_to e1_pro_ghosts0_entry/p7)
    )
)

(script command_script void cs_e1_pro_ghosts0_0_entry0
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_go_to e1_pro_ghosts0_entry/p0)
    )
)

(script command_script void cs_e1_pro_ghosts0_0_entry1
    (begin
        (cs_abort_on_combat_status ai_combat_status_clear_los)
        (cs_vehicle_boost true)
        (cs_go_to e1_pro_ghosts0_entry/p2)
        (cs_go_to e1_pro_ghosts0_entry/p3)
    )
)

(script static boolean e1_pro_ghosts0_weak
    (begin
        (<= (+ (ai_living_count "e1_pro_ghosts0") (ai_living_count "e1_pro_wraith0")) g_e1_ghosts_weak)
    )
)

(script static boolean e1_pro_ghosts0_strong
    (begin
        (>= (+ (ai_living_count "e1_pro_ghosts0") (ai_living_count "e1_pro_wraith0")) g_e1_ghosts_strong)
    )
)

(script dormant void e1_weather
    (begin
        (sleep_until (volume_test_objects "tv_e1_advance0" (players)) 16)
        (cinematic_move_attached_objects 60.0 0.4)
        (sleep_until (volume_test_objects "tv_e1_advance1" (players)) 16)
        (cinematic_move_attached_objects 60.0 0.7)
        (sleep_until (volume_test_objects "tv_e1_advance2" (players)) 16)
        (cinematic_move_attached_objects 60.0 1.0)
    )
)

(script dormant void e1_pro_phantom0_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_advance1" (players)) 15)
        (ai_place "e1_pro_wraith0")
        (sleep_until (volume_test_objects "tv_e1_advance3" (players)) 15)
        (wake music_08b_01_start_alt)
    )
)

(script dormant void e1_pro_ghosts0_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_canyon_entry" (players)) 15)
        (ai_place "e1_pro_ghosts0_0")
        (sleep_until 
            (begin
                (if (e1_pro_ghosts0_weak) 
                    (sleep_until 
                        (begin
                            (ai_place "e1_pro_ghosts0_0" 1)
                            (or
                                (e1_pro_ghosts0_strong)
                                (>= (ai_spawn_count "e1_pro_ghosts0_0") g_e1_ghosts_per_leg)
                                (volume_test_objects "tv_e1_advance0" (players))
                            )
                        )
                    ))
                (volume_test_objects "tv_e1_advance0" (players))
            )
        )
        (game_saving)
        (sleep_until 
            (begin
                (if (e1_pro_ghosts0_weak) 
                    (sleep_until 
                        (begin
                            (ai_place "e1_pro_ghosts0_1" 1)
                            (or
                                (e1_pro_ghosts0_strong)
                                (>= (ai_spawn_count "e1_pro_ghosts0_1") g_e1_ghosts_per_leg)
                                (volume_test_objects "tv_e1_advance2" (players))
                            )
                        )
                    ))
                (volume_test_objects "tv_e1_advance2" (players))
            )
        )
        (game_saving)
        (sleep_until 
            (begin
                (if (e1_pro_ghosts0_weak) 
                    (sleep_until 
                        (begin
                            (ai_place "e1_pro_ghosts0_2" 1)
                            (or
                                (e1_pro_ghosts0_strong)
                                (>= (ai_spawn_count "e1_pro_ghosts0_2") g_e1_ghosts_per_leg)
                                (volume_test_objects "tv_e1_advance4" (players))
                            )
                        )
                    ))
                (volume_test_objects "tv_e1_advance4" (players))
            )
        )
        (game_save_no_timeout)
    )
)

(script dormant void e1_pro_inf0_main
    (begin
        (sleep_until (volume_test_objects "tv_e1_advance1" (players)))
        (ai_place "e1_pro_inf0_0")
    )
)

(script dormant void e1_cov_spectre0_main
    (begin
        (ai_place "e1_cov_spectre0")
        (sleep 10)
        (object_type_predict "objects\vehicles\spectre\spectre")
    )
)

(script dormant void e1_cov_wraiths0_main
    (begin
        (ai_place "e1_cov_wraiths0_0")
        (object_cannot_die (ai_get_object "e1_cov_wraiths0_0/wraith0") true)
        (set g_cov_commander (ai_get_unit "e1_cov_wraiths0_0/wraith0"))
        (if (difficulty_legendary) 
            (begin
                (unit_set_enterable_by_player (ai_vehicle_get "e1_cov_wraiths0_0/wraith0") false)
                (cs_run_command_script "e1_cov_wraiths0_0/wraith0" cs_e1_cov_commander0_legendary)
            ) (cs_run_command_script "e1_cov_wraiths0_0/wraith0" cs_e1_cov_commander0_init))
        (sleep_until 
            (or
                (players_in_vehicle)
                (volume_test_objects "tv_e1_canyon_entry" (players))
            ) 
        15)
        (wake music_08b_01_start)
    )
)

(script dormant void e1_main
    (begin
        (set g_e1_started true)
        (print "e1_main")
        (data_mine_insert "e1_wraith_canyon")
        (wake objective0_set)
        (wake e2_main)
        (wake e1_cov_wraiths0_main)
        (wake e1_cov_spectre0_main)
        (wake e1_pro_ghosts0_main)
        (wake e1_pro_phantom0_main)
        (wake e1_pro_inf0_main)
        (wake e1_weather)
        (sleep_until g_e2_started)
        (ai_disposable "e1_pro" true)
        (ai_disposable "e1_pro_phantom0" false)
        (sleep_until g_e3_started)
        (sleep_forever e1_cov_wraiths0_main)
        (sleep_forever e1_pro_ghosts0_main)
        (sleep_forever e1_pro_phantom0_main)
        (sleep_forever e1_pro_inf0_main)
    )
)

(script dormant void mission_start
    (begin
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
        (wake e1_main)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 15)
        (cinematic_fade_from_white_bars)
        (wake chapter_title0)
        (sleep_until g_mission_over 5)
        (playtest_mission)
        (sleep 15)
        (object_cannot_take_damage (players))
        (object_teleport (player0) "player0_stash")
        (object_teleport (player1) "player1_stash")
        (cinematic_epilogue)
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
        (ai_allegiance player covenant)
        (ai_allegiance player human)
        (ai_allegiance covenant human)
        (animation_cache_stats_reset 0.0)
        (cinematic_move_attached_objects 0.0 0.1)
        (kill_volume_disable "kill_e13_0")
        (if (> (player_count) 0) 
            (start))
    )
)

(script dormant void 08_intra1_04_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple\maple" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 3)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple_l\maple_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_saplingm\redalder_saplingm" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 5)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
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
        (sleep 6)
        (sleep 24)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 83 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 83 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 83 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 83 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 83 false)
        (sleep 129)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 6)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 16)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 17)
        (sleep 14)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 70 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 79 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 64 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 69 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 67 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 17 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 25 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 26 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 27 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 29 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 35 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (sleep 66)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 83 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 24 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple\maple" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 3)
        (sleep 155)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (sleep 72)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 2)
        (sleep 12)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 80 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 70 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 79 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 64 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 69 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 67 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 17 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 25 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 26 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 27 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 35 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
    )
)

(script dormant void 08_intra2_01_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 32 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 27 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 33 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 44 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 38 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 42 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 37 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 89 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 43 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 10 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 12 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 13 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 14 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 33 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 30 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 31 true)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\fp_plasma_rifle\fp_plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\fp_plasma_rifle\fp_plasma_rifle" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple_l\maple_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 41 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 83 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 46 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 0)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 48 false)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 66)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 67)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 68)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 69)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 70)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 71)
        (predict_lightmap_bucket "objects\vehicles\wraith\wraith" 72)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 6)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 16)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 17)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 0 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 24 true)
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
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_cam\scarab_cam" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_scarab_full\holo_scarab_full" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_main_gun\scarab_main_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_rear_gun\scarab_rear_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 8 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 3 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 10 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 17 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 12 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 19 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 23 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 43 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 41 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 40 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 3)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 3)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 3)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_recharge_station\recharge_station_cell\recharge_station_cell" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 16 true)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 2)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_small\door_small" 1)
        (sleep 115)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 8 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 3 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 10 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 4 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 7 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 12 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 5 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 26 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 42 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 48 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 31 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 3)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (sleep 71)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 43 true)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 3)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_recharge_station\recharge_station_cell\recharge_station_cell" 0)
        (sleep 9)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 13 false)
        (sleep 3)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_small\door_small" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 26 true)
        (sleep 86)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 3 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 10 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 17 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 12 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 19 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 40 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 2)
    )
)

(script dormant void 08_intra2_02_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 3)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_recharge_station\recharge_station_cell\recharge_station_cell" 0)
        (sleep 69)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 4 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 7 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 5 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 21 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 42 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 48 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 31 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_maple\maple_l\maple_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (sleep 151)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 17 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 27 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 19 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 68 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (sleep 244)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
    )
)

(script dormant void 08_intra3_01_predict
    (begin
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 39)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 43)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\control_walkway\control_walkway" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_full\index_full" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\control_boss_platform\control_boss_platform" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 355)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (sleep 4)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 83)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
    )
)

(script dormant void 08_intra3_02_predict
    (begin
        (sleep 6)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 2)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 36)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 33)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 9)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (sleep 72)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (sleep 200)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 21)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (sleep 72)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 39)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 43)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (sleep 174)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
    )
)

(script dormant void 08_intra3_03_predict
    (begin
        (sleep 8)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 39)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 43)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (sleep 157)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 28)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 6)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 47)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 39)
        (sleep 5)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (sleep 54)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (sleep 90)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 43)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 39)
        (sleep 60)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
    )
)

(script dormant void 08_intra3_04_predict
    (begin
        (sleep 5)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 39)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 43)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (sleep 186)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 185)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (sleep 250)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
    )
)

(script dormant void 08_intra3_05_predict
    (begin
        (sleep 9)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 false)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 27)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 39)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 43)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (sleep 51)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 59)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 11)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (sleep 8)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\control_room_index_board\control_room_index_board" 0)
        (sleep 18)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 2 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 10)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 8 false)
        (sleep 107)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp3 5 true)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
    )
)

(script dormant void 08_intra3_06_predict
    (begin
        (print "next scene has no prediction...yet")
    )
)

(script dormant void x09_01_predict
    (begin
        (sleep 1)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 0)
        (predict_lightmap_bucket "objects\characters\dervish\fp\fp" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\fp_plasma_rifle\fp_plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\fp_plasma_rifle\fp_plasma_rifle" 1)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 0)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\minigun\minigun" 6)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 16)
        (predict_lightmap_bucket "objects\vehicles\wraith\turrets\mortar\mortar" 17)
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 20 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 3 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 14 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\control_rotors\control_rotors" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\control_room\grav_lift\grav_lift" 0)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (sleep 64)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 19 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 true)
        (sleep 57)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 20 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 3 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (sleep 75)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 20 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 2 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 3 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 10 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 12 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\control_room\grav_lift\grav_lift" 0)
        (sleep 4)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (sleep 35)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 14 false)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (sleep 33)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 14 true)
        (sleep 14)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 22 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 19 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 3 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 10 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 4 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 5 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\control_room\grav_lift\grav_lift" 0)
        (sleep 53)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_full\index_full" 0)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 12 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (sleep 8)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 6 true)
        (sleep 29)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 12 true)
    )
)

(script dormant void x09_02_predict
    (begin
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 8 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 14 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 2 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 58)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 11 false)
        (sleep 8)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 4 true)
        (sleep 9)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
        (sleep 15)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 4 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
        (sleep 9)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 6 true)
        (sleep 129)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 62 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 27 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 33 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 77 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 3 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 64 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 22 false)
    )
)

(script dormant void x09_03_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 32 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 88 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 37 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 44 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 0 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 43 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 89 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 52 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 12 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 13 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 14 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 33 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 30 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 31 true)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\door_large\door_large" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 0)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 0)
        (predict_lightmap_bucket "objects\cinematics\effects\control_room_beam\control_room_beam" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\deltacontrolroom\deltacontrolroom_08b\deltacontrolroom_08b" 5)
        (sleep 166)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 27 false)
        (sleep 14)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 41 false)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_l\redcedar_l" 1)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redcedar\redcedar_m\redcedar_m" 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 46 false)
        (predict_lightmap_bucket "scenarios\objects\nature\trees\tree_redalder\redalder_s\redalder_s" 0)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 48 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 48 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 46 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 31 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 60 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 9 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 49 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 63 false)
    )
)

(script dormant void x09_04_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 75 false)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_exterior\high_charity_exterior" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\substance_space\substance_space" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\delta_halo_quarter\delta_halo_quarter" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\halo\halo" 0)
        (predict_lightmap_bucket "scenarios\skies\generic\space\space" 0)
        (sleep 131)
        (predict_lightmap_bucket "objects\cinematics\effects\halo_disarm\halo_disarm" 0)
    )
)

(script dormant void x09_05_predict
    (begin
        (sleep 10)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 22 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 1 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 20 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 3 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 10 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 2 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 12 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 4 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\index\index_full\index_full" 0)
        (predict_lightmap_bucket "objects\cinematics\forerunner\beacon_halo_holo\beacon_halo_holo" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 19)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 14 true)
        (sleep 113)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\characters\marine\marine" 53)
        (predict_lightmap_bucket "objects\characters\marine\marine" 74)
        (predict_lightmap_bucket "objects\characters\marine\marine" 69)
        (predict_lightmap_bucket "objects\characters\marine\marine" 6)
        (predict_lightmap_bucket "objects\characters\marine\marine" 57)
        (predict_lightmap_bucket "objects\characters\marine\marine" 58)
        (predict_lightmap_bucket "objects\characters\marine\marine" 60)
        (sleep 15)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 4 true)
        (sleep 31)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (sleep 210)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
    )
)

(script dormant void x09_06_predict
    (begin
        (sleep 4)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 2 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 12 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 4 true)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 303)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
        (sleep 77)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 14 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 2 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 4 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 6 true)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (predict_lightmap_bucket "objects\cinematics\forerunner\beacon_halo_holo\beacon_halo_holo" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 8)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 8 true)
        (sleep 126)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 14 true)
        (sleep 39)
        (predict_lightmap_bucket "scenarios\objects\solo\deltacontrolroom\lightfixture_indirect_blurple\lightfixture_indirect_blurple" 0)
        (sleep 46)
        (predict_lightmap_bucket "objects\characters\monitor\monitor" 2)
        (sleep 140)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 11 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 9 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 2 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 12 true)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 7 true)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 0)
        (predict_lightmap_bucket "objects\characters\miranda\miranda" 1)
        (sleep 114)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp4 11 false)
        (sleep 9)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 62 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 27 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 33 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 77 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 2 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 3 false)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 64 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 22 false)
    )
)

(script dormant void x09_07_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\08b_deltacontrol\deltacontrolroom_bsp0 75 false)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\moon\moon" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\earth_space\earth_space" 0)
        (predict_lightmap_bucket "objects\cinematics\forerunner\forerunner_ship\forerunner_ship" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\skies\generic\space\space" 0)
        (sleep 123)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 36)
        (predict_lightmap_bucket "objects\cinematics\forerunner\forerunner_ship_alcove\forerunner_ship_alcove" 0)
    )
)

(script dormant void x09_08_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\special\bloom_quad\bloom_quad" 0)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (sleep 5)
        (sleep 119)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 0)
        (predict_lightmap_bucket "objects\characters\lord_hood\lord_hood" 1)
        (predict_lightmap_bucket "objects\cinematics\human\cairo_bridge\cairo_bridge" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (predict_lightmap_bucket "scenarios\objects\human\military\emergency\emergency" 0)
        (sleep 153)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 16)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 17)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 18)
        (predict_lightmap_bucket "objects\characters\masterchief\masterchief" 19)
        (predict_lightmap_bucket "scenarios\objects\special\bloom_quad\bloom_quad" 0)
        (sleep 678)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 27 false)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
    )
)

(script dormant void x10_01_predict
    (begin
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 1 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 6 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 17 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 21 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 22 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 23 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 24 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 25 true)
        (predict_lightmap_bucket "objects\cinematics\flood\flood_spore\flood_spore" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\highcharity\highcharity" 7)
        (sleep 19)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 29 true)
        (sleep 11)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 16 true)
        (sleep 17)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 20 true)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 1)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 2)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 3)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 4)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 5)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 6)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 7)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 8)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 9)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 10)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 11)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 12)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 13)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 14)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab" 15)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_scarab_full\holo_scarab_full" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_main_gun\scarab_main_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_rear_gun\scarab_rear_gun" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\scarab\scarab_upper_gun\scarab_upper_gun" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 19 true)
        (sleep 14)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space_a\crate_space_a" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 0)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_short\bowl_short" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\covenant\military\cov_recharge_station\recharge_station_cell\recharge_station_cell" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\crate_space\crate_space" 0)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\solo\deltatemple\temple_dynamic\bowl_tall\bowl_tall" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\gear\covenant\military\battery\battery" 0)
        (sleep 1)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 13 true)
        (sleep 12)
        (predict_lightmap_bucket "scenarios\objects\multi\lockout\power_module\power_module" 0)
        (sleep 18)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 26 true)
        (sleep 6)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 0)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 1)
        (sleep 9)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 27 true)
        (sleep 8)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 28 true)
        (sleep 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 false)
        (sleep 7)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture\tentacle_capture" 0)
        (predict_lightmap_bucket "objects\characters\gravemind\tentacle_capture\tentacle_capture" 1)
        (sleep 28)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 0 true)
        (sleep 15)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_gravcolumn\garbage\cov_gravcolumn_top\cov_gravcolumn_top" 0)
        (sleep 8)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_gravcolumn\cov_gravcolumn" 1)
        (sleep 18)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 32 true)
        (sleep 14)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (sleep 5)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_clump\flood_clump" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_sack\flood_sack" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_pod\flood_pod" 0)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_floor_clump_small\flood_floor_clump_small" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 15 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 15 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 13 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 30 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 45 false)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_panels\holo_hallway_signs\holo_hallway_signs" 0)
        (sleep 1)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 31 true)
        (sleep 6)
        (predict_lightmap_bucket "scenarios\objects\flood\flood_generator\flood_generator" 0)
        (sleep 9)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 33 true)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_gravcolumn\garbage\cov_gravcolumn_bottom_garbage_1\cov_gravcolumn_bottom_garbage_1" 0)
    )
)

(script dormant void x10_02_predict
    (begin
        (sleep 6)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 45 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 33 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 9 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 34 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 29 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 1 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 3 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\interior_objects\cov_chubby\cov_chubby" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_small_door\high_small_door" 0)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 6)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 7)
        (predict_lightmap_bucket "objects\characters\cortana\cortana" 8)
        (predict_lightmap_bucket "objects\cinematics\texture_camera\texture_camera" 0)
        (sleep 236)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 11 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 39 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 41 false)
        (sleep 130)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 22 false)
        (sleep 61)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 10 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 37 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 40 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 3 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_0 4 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door\high_door" 0)
    )
)

