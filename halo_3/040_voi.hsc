; Decompiled with Blamite
; Source file: 040_voi.hsc
; Start time: 4/7/2022 7:27:22
; Decompilation finished in ~0.0162264s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global boolean perspective_running false)
(global boolean perspective_finished false)
(global boolean g_cortana_header false)
(global boolean g_cortana_footer false)
(global boolean g_gravemind_header false)
(global boolean g_gravemind_footer false)
(global boolean g_music_040_01 false)
(global boolean g_music_040_02 false)
(global boolean g_music_040_03 false)
(global boolean g_music_040_04 false)
(global boolean g_music_040_05 false)
(global boolean g_music_040_06 false)
(global boolean g_music_040_07 false)
(global boolean g_music_040_08 false)
(global boolean g_music_040_09 false)
(global boolean g_music_040_10 false)
(global boolean g_music_040_11 false)
(global boolean g_music_040_12 false)
(global boolean g_music_040_13 false)
(global boolean g_music_040_14 false)
(global boolean g_music_040_15 false)
(global boolean g_music_040_16 false)
(global boolean g_playing_dialogue false)
(global boolean dialogue true)
(global ai brute none)
(global ai female_marine none)
(global ai grunt none)
(global ai grunt_02 none)
(global ai marine none)
(global ai marine_01 none)
(global ai marine_02 none)
(global ai sergeant none)
(global ai gr_allies none)
(global ai gr_arbiter none)
(global boolean g_truth false)
(global short g_truth_count 0)
(global short g_truth_limit 7)
(global boolean editor false)
(global boolean debug false)
(global boolean g_play_cinematics true)
(global boolean g_cortana_playing false)
(global short testnum 0)
(global short testnum02 0)
(global short wave 1)
(global short wavemax 0)
(global vehicle testvehicle none)
(global ai testai none)
(global ai testai02 none)
(global boolean g_scarab_dead false)
(global boolean g_bfg_longsword false)
(global short g_insertion_index 0)


; SCRIPTS

(script static void ai_trickle_via_phantom (ai vehicle_starting_location, ai spawned_squad)
    (ai_place spawned_squad)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc (ai_actors spawned_squad))
    (sleep 1)
    (object_set_phantom_power (ai_vehicle_get_from_starting_location vehicle_starting_location) true)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_1)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_2)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_3)
    (sleep 60)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc_4)
    (sleep 60)
    (object_set_phantom_power (ai_vehicle_get_from_starting_location vehicle_starting_location) false)
)

(script static void ai_dump_via_phantom (ai vehicle_starting_location, ai spawned_squad)
    (ai_place spawned_squad)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc (ai_actors spawned_squad))
    (sleep 1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_pc)
)

(script static void ai_disembark_via_phantom (ai vehicle_starting_location, ai spawned_squad)
    (unit_open (ai_vehicle_get_from_starting_location vehicle_starting_location))
    (sleep 45)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lf_main)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rf_main)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_lb_main)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_small_1)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_small_2)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_small_3)
    (vehicle_unload (ai_vehicle_get_from_starting_location vehicle_starting_location) phantom_p_rb_main)
    (sleep 120)
    (unit_close (ai_vehicle_get_from_starting_location vehicle_starting_location))
)

(script static unit player0
    (unit (list_get (players) 0))
)

(script static unit player1
    (unit (list_get (players) 1))
)

(script static unit player2
    (unit (list_get (players) 2))
)

(script static unit player3
    (unit (list_get (players) 3))
)

(script static short player_count
    (list_count (players))
)

(script static void print_difficulty
    (game_save_immediate)
    (cond
        ((= (game_difficulty_get_real) easy)
            (print "easy")
        )
        ((= (game_difficulty_get_real) normal)
            (print "normal")
        )
        ((= (game_difficulty_get_real) heroic)
            (print "heroic")
        )
        ((= (game_difficulty_get_real) legendary)
            (print "legendary")
        )
    )
)

(script static boolean difficulty_legendary
    (= (game_difficulty_get) legendary)
)

(script static boolean difficulty_heroic
    (= (game_difficulty_get) heroic)
)

(script static boolean difficulty_normal
    (= (game_difficulty_get) normal)
)

(script static boolean players_not_in_combat
    (player_action_test_reset)
    (sleep 30)
    (if 
        (and
            (not (player_action_test_primary_trigger))
            (not (player_action_test_grenade_trigger))
            (cond
                ((= (game_coop_player_count) 4)
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                        (>= (object_get_shield (player1)) 1.0)
                        (>= (object_get_shield (player2)) 1.0)
                        (>= (object_get_shield (player3)) 1.0)
                    )
                )
                ((= (game_coop_player_count) 3)
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                        (>= (object_get_shield (player1)) 1.0)
                        (>= (object_get_shield (player2)) 1.0)
                    )
                )
                ((= (game_coop_player_count) 2)
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                        (>= (object_get_shield (player1)) 1.0)
                    )
                )
                (true
                    (begin
                        (>= (object_get_shield (player0)) 1.0)
                    )
                )
            )
        ) 
            true false)
)

(script static boolean cinematic_skip_start
    (cinematic_skip_start_internal)
    (game_save_cinematic_skip)
    (sleep_until (not (game_saving)) 1)
    (not (game_reverted))
)

(script static void cinematic_skip_stop
    (cinematic_skip_stop_internal)
    (if (not (game_reverted)) 
        (game_revert))
)

(script static void cinematic_fade_to_black
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (player_control_fade_out_all_input 1.0)
    (campaign_metagame_time_pause true)
    (unit_lower_weapon (player0) 30)
    (unit_lower_weapon (player1) 30)
    (unit_lower_weapon (player2) 30)
    (unit_lower_weapon (player3) 30)
    (sleep 10)
    (chud_cinematic_fade 0.0 0.5)
    (cinematic_show_letterbox true)
    (sleep 5)
    (fade_out 0.0 0.0 0.0 30)
    (sleep 30)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (cinematic_start)
    (camera_control true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
)

(script static void cinematic_snap_to_black
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (fade_out 0.0 0.0 0.0 0)
    (player_control_fade_out_all_input 0.0)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (chud_cinematic_fade 0.0 0.0)
    (campaign_metagame_time_pause true)
    (sleep 1)
    (cinematic_start)
    (camera_control true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
    (sleep 1)
)

(script static void cinematic_fade_to_title
    (sleep 15)
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
)

(script static void cinematic_fade_to_title_slow
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0.0 0.0 0.0 150)
    (sleep 15)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
)

(script static void cinematic_title_to_gameplay
    (sleep 30)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (player_disable_movement false)
    (sleep 110)
    (cinematic_show_letterbox false)
    (sleep 15)
    (chud_cinematic_fade 1.0 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (game_save)
)

(script static void cinematic_fade_to_gameplay
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_show_letterbox false)
    (chud_cinematic_fade 1.0 1.0)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_disable_movement false)
    (game_save)
)

(script static void chapter_start
    (chud_cinematic_fade 0.0 0.5)
    (cinematic_show_letterbox true)
    (sleep 30)
)

(script static void chapter_stop
    (cinematic_show_letterbox false)
    (sleep 15)
    (chud_cinematic_fade 1.0 0.5)
    (game_save)
)

(script static void perspective_start
    (game_save_cancel)
    (cinematic_skip_start_internal)
    (ai_disregard (player0) true)
    (ai_disregard (player1) true)
    (ai_disregard (player2) true)
    (ai_disregard (player3) true)
    (object_cannot_take_damage (player0))
    (object_cannot_take_damage (player1))
    (object_cannot_take_damage (player2))
    (object_cannot_take_damage (player3))
    (player_control_fade_out_all_input 2.0)
    (unit_lower_weapon (player0) 30)
    (unit_lower_weapon (player1) 30)
    (unit_lower_weapon (player2) 30)
    (unit_lower_weapon (player3) 30)
    (chud_cinematic_fade 0.0 0.5)
    (sleep 15)
    (cinematic_show_letterbox true)
    (sleep 5)
    (fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (camera_control true)
    (cinematic_start)
    (sleep 15)
)

(script static void perspective_stop
    (cinematic_stop)
    (camera_control false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (player_control_fade_in_all_input 0.5)
    (fade_in 0.0 0.0 0.0 10)
    (sleep 5)
    (cinematic_show_letterbox false)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (chud_cinematic_fade 1.0 0.5)
    (ai_disregard (player0) false)
    (ai_disregard (player1) false)
    (ai_disregard (player2) false)
    (ai_disregard (player3) false)
    (object_can_take_damage (player0))
    (object_can_take_damage (player1))
    (object_can_take_damage (player2))
    (object_can_take_damage (player3))
    (game_save)
)

(script static void perspective_skipped
    (cinematic_stop)
    (camera_control false)
    (ai_disregard (player0) false)
    (ai_disregard (player1) false)
    (ai_disregard (player2) false)
    (ai_disregard (player3) false)
    (object_can_take_damage (player0))
    (object_can_take_damage (player1))
    (object_can_take_damage (player2))
    (object_can_take_damage (player3))
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 5)
    (player_control_fade_in_all_input 1.0)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (unit_raise_weapon (player0) 15)
    (unit_raise_weapon (player1) 15)
    (unit_raise_weapon (player2) 15)
    (unit_raise_weapon (player3) 15)
    (game_save)
)

(script static boolean perspective_skip_start
    (player_action_test_reset)
    (sleep_until 
        (or
            (not perspective_running)
            (player_action_test_cinematic_skip)
        ) 
    1)
    perspective_running
)

(script static void insertion_start
    (fade_out 0.0 0.0 0.0 0)
    (sound_class_set_gain "object" 0.0 0)
    (sound_class_set_gain "vehicle" 0.0 0)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (player_disable_movement true)
    (player_enable_input false)
    (campaign_metagame_time_pause true)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (sound_class_set_gain "object" 1.0 30)
    (sound_class_set_gain "vehicle" 1.0 30)
)

(script dormant void insertion_end
    (sleep 30)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_show_letterbox false)
    (player_control_fade_in_all_input 1.0)
    (sleep 15)
    (chud_cinematic_fade 1.0 1.0)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_enable_input true)
    (player_disable_movement false)
    (game_save)
)

(script static ai ai_get_driver (ai vehicle_starting_location)
    (object_get_ai (vehicle_driver (ai_vehicle_get_from_starting_location vehicle_starting_location)))
)

(script static ai ai_get_gunner (ai vehicle_starting_location)
    (object_get_ai (vehicle_gunner (ai_vehicle_get_from_starting_location vehicle_starting_location)))
)

(script static boolean any_players_in_vehicle
    (or
        (unit_in_vehicle (unit (player0)))
        (unit_in_vehicle (unit (player1)))
        (unit_in_vehicle (unit (player2)))
        (unit_in_vehicle (unit (player3)))
    )
)

(script static void shut_door_forever (device machine_door)
    (device_operates_automatically_set machine_door false)
    (device_set_position machine_door 0.0)
    (sleep_until (<= (device_get_position machine_door) 0.0) 30 300)
    (if (> (device_get_position machine_door) 0.0) 
        (device_set_position_immediate machine_door 0.0))
    (sleep 1)
    (device_set_power machine_door 0.0)
)

(script static void shut_door_forever_immediate (device machine_door)
    (device_operates_automatically_set machine_door false)
    (device_set_position_immediate machine_door 0.0)
    (device_set_power machine_door 0.0)
)

(script dormant void reset_map_reminder
    (sleep_until 
        (begin
            (print "press a to play again!")
            false
        ) 
    90)
)

(script static void end_segment
    (print "end gameplay segment!  thank you for playing!")
    (sleep 15)
    (print "grab paul or rob to give feedback!")
    (sleep 15)
    (player_action_test_reset)
    (sleep_until 
        (begin
            (print "press the “a” button to reset!")
            (sleep_until (player_action_test_accept) 1 90)
            (player_action_test_accept)
        ) 
    1)
    (print "reloading map...")
    (sleep 15)
    (chud_cinematic_fade 1.0 0.0)
    (fade_in 0.0 0.0 0.0 0)
    (map_reset)
)

(script static void end_mission
    (if global_playtest_mode 
        (begin
            (data_mine_set_mission_segment "questionaire")
            (cinematic_fade_to_gameplay)
            (sleep 1)
            (print "end mission!")
            (sleep 15)
            (hud_set_training_text "playtest_raisehand")
            (hud_show_training_text true)
            (sleep 90)
            (player_action_test_reset)
            (sleep_until 
                (begin
                    (sleep_until (player_action_test_accept) 1 90)
                    (player_action_test_accept)
                ) 
            1)
            (hud_show_training_text false)
            (print "loading next mission...")
            (sleep 15)
        ) (begin
            (fade_out 0.0 0.0 0.0 0)
            (cinematic_stop)
            (camera_control false)
        )
    )
    (game_won)
)

(script startup void beginning_mission_segment
    (data_mine_set_mission_segment "mission_start")
)

(script continuous void gs_cortana_header
    (sleep_until g_cortana_header 1)
    (print "cortana header")
    (game_save_cancel)
    (game_safe_to_respawn false)
    (player_control_scale_all_input 0.15 0.5)
    (ai_dialogue_enable false)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (damage_players "cinematics\cortana_channel\cortana_effect")
    (gs_hud_flicker_out)
    (set g_cortana_header false)
)

(script continuous void gs_cortana_footer
    (sleep_until g_cortana_footer 1)
    (print "cortana footer")
    (sleep 1)
    (game_safe_to_respawn true)
    (player_control_scale_all_input 1.0 0.5)
    (ai_dialogue_enable true)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (sleep 1)
    (game_save)
    (chud_cinematic_fade 1.0 1.5)
    (sound_impulse_start "sound\visual_fx\cortana_hud_on" none 1.0)
    (set g_cortana_footer false)
)

(script continuous void gs_gravemind_header
    (sleep_until g_gravemind_header 1)
    (print "gravemind header")
    (game_save_cancel)
    (game_safe_to_respawn false)
    (player_control_scale_all_input 0.15 2.0)
    (ai_dialogue_enable false)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (sleep 1)
    (set g_gravemind_header false)
)

(script continuous void gs_gravemind_footer
    (sleep_until g_gravemind_footer 1)
    (print "gravemind footer")
    (game_safe_to_respawn true)
    (player_control_scale_all_input 1.0 1.0)
    (ai_dialogue_enable true)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (sleep 1)
    (set g_gravemind_footer false)
    (sleep 30)
    (game_save)
)

(script static void gs_hud_flicker_out
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1.0 (real_random_range 0.0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0.0 (real_random_range 0.0 0.035))
)

(script static boolean award_skull
    (if 
        (and
            (>= (game_difficulty_get_real) normal)
            (= (game_insertion_point_get) 0)
        ) 
            true false)
)

(script dormant void music_040_01
    (sleep_until g_music_040_01)
    (print "start music 040_01")
    (sound_looping_start "levels\solo\040_voi\music\040_music_01" none 1.0)
    (sleep_until (not g_music_040_01))
    (print "stop music 040_01")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_01")
)

(script dormant void music_040_02
    (sleep_until g_music_040_02)
    (print "start music 040_02")
    (sound_looping_start "levels\solo\040_voi\music\040_music_02" none 1.0)
    (sleep_until (not g_music_040_02))
    (print "stop music 040_02")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_02")
)

(script dormant void music_040_03
    (sleep_until g_music_040_03)
    (print "start music 040_03")
    (sound_looping_start "levels\solo\040_voi\music\040_music_03" none 1.0)
    (sleep (* 30.0 58.0))
    (print "stop music 040_03")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_03")
    (wake music_040_04)
    (set g_music_040_04 true)
)

(script dormant void music_040_04
    (sleep_until g_music_040_04)
    (print "start music 040_04")
    (sound_looping_start "levels\solo\040_voi\music\040_music_04" none 1.0)
    (sleep_until (not g_music_040_04))
    (print "stop music 040_04")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_04")
)

(script dormant void music_040_05
    (print "start music 040_05")
    (sound_looping_start "levels\solo\040_voi\music\040_music_05" none 1.0)
    (sleep_until 
        (or
            (volume_test_players "vol_factory_b_tunnel")
            (not g_music_040_05)
        )
    )
    (print "stop music 040_05")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_05")
)

(script dormant void music_040_06
    (sleep_until g_music_040_06)
    (print "start music 040_06")
    (sound_looping_start "levels\solo\040_voi\music\040_music_06" none 1.0)
    (sleep_until (<= (ai_task_count "lakebed_b_covenant_obj/wraith_gate") 0))
    (sound_looping_set_alternate "levels\solo\040_voi\music\040_music_06" true)
    (sleep_until (not g_music_040_06))
    (print "stop music 040_06")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_06")
)

(script dormant void music_040_07
    (sleep_until g_music_040_07)
    (print "start music 040_07")
    (sound_looping_start "levels\solo\040_voi\music\040_music_07" none 1.0)
    (sleep_until 
        (or
            (not g_music_040_07)
            (= (current_zone_set) 7)
        )
    )
    (print "stop music 040_07")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_07")
)

(script dormant void music_040_08
    (sleep (* 30.0 60.0))
    (if (not (object_model_target_destroyed "scarab_giant" "indirect_engine")) 
        (begin
            (print "start music 040_08")
            (sound_looping_start "levels\solo\040_voi\music\040_music_08" none 1.0)
            (sleep_until (object_model_target_destroyed "scarab_giant" "indirect_engine"))
            (print "stop music 040_08")
            (sound_looping_stop "levels\solo\040_voi\music\040_music_08")
        )
    )
)

(script dormant void music_040_09
    (sleep_until g_music_040_09)
    (print "start music 040_09")
    (sound_looping_start "levels\solo\040_voi\music\040_music_09" none 1.0)
    (sleep_until 
        (or
            (not g_music_040_09)
            (= (current_zone_set) 7)
        )
    )
    (print "stop music 040_09")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_09")
)

(script dormant void music_040_10
    (sleep_until g_music_040_10)
    (print "start music 040_10")
    (sound_looping_start "levels\solo\040_voi\music\040_music_10" none 1.0)
    (sleep_until 
        (or
            (not g_music_040_10)
            (= (current_zone_set) 7)
        )
    )
    (print "stop music 040_10")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_10")
)

(script dormant void music_040_11
    (print "start music 040_11")
    (sound_looping_start "levels\solo\040_voi\music\040_music_11" none 1.0)
)

(script dormant void music_040_12
    (print "start music 040_12")
    (sound_looping_start "levels\solo\040_voi\music\040_music_12" none 1.0)
    (sleep_until 
        (or
            (volume_test_players "tv_cortana_03")
            (<= (ai_living_count "work_cov_chief/chief") 0)
        )
    )
    (print "stop music 040_12")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_12")
)

(script dormant void music_040_13
    (print "start music 040_13")
    (sound_looping_start "levels\solo\040_voi\music\040_music_13" none 1.0)
    (sleep (* 30.0 58.0))
    (wake music_040_14)
    (wake music_040_15)
    (sleep_until (volume_test_players "vol_bfg_advance") 30 (* 30.0 20.0))
    (wake music_040_16)
)

(script dormant void music_040_14
    (print "start music 040_14")
    (sound_looping_start "levels\solo\040_voi\music\040_music_14" none 1.0)
    (sleep_until 
        (or
            (<= (ai_task_count "bfg_cov_obj/inf_gate") 5)
            (<= (ai_living_count "bfg_cov01/chief") 0)
        )
    )
    (print "stop music 040_14")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_14")
)

(script dormant void music_040_15
    (print "start music 040_15")
    (sound_looping_start "levels\solo\040_voi\music\040_music_15" none 1.0)
    (sleep_until 
        (or
            (<= (ai_task_count "bfg_cov_obj/inf_gate") 5)
            (<= (ai_living_count "bfg_cov01/chief") 0)
        )
    )
    (print "stop music 040_15")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_15")
)

(script dormant void music_040_16
    (print "start music 040_16")
    (sound_looping_start "levels\solo\040_voi\music\040_music_16" none 1.0)
    (sleep_until 
        (or
            (<= (ai_task_count "bfg_cov_obj/inf_gate") 5)
            (<= (ai_living_count "bfg_cov01/chief") 0)
        )
    )
    (sound_looping_set_alternate "levels\solo\040_voi\music\040_music_16" true)
    (sleep_until (<= (object_get_health "bfg_base") 0.0) 5)
    (print "stop music 040_16")
    (sound_looping_stop "levels\solo\040_voi\music\040_music_16")
)

(script static void md_cleanup
    (ai_dialogue_enable true)
)

(script dormant void br_int_01
    (print "br:int:01")
    (ai_dialogue_enable false)
    (if dialogue 
        (print "miranda (radio): chief, the prophet of truth has found the ark."))
    (sleep (ai_play_line_on_object none 040ba_010))
    (sleep 20)
    (if dialogue 
        (print "miranda (radio): our only chance of stopping him is a surprise, aerial assault."))
    (sleep (ai_play_line_on_object none 040ba_020))
    (sleep 10)
    (if dialogue 
        (print "miranda (radio): clear this sector of covenant anti-air defenses…"))
    (sleep (ai_play_line_on_object none 040ba_030))
    (sleep 10)
    (if dialogue 
        (print "miranda (radio): make a hole for the admiral's ships."))
    (sleep (ai_play_line_on_object none 040ba_040))
    (sleep 10)
    (if dialogue 
        (print "miranda (radio): good hunting. keyes out."))
    (sleep (ai_play_line_on_object none 040ba_050))
    (sleep 10)
    (ai_dialogue_enable true)
    (sleep_until (volume_test_players "vol_intro_briefing"))
    (wake md_int_door)
)

(script dormant void md_int_dead_01
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:int:dead:01")
    (vs_cast "intro_troop_hogs" true 0 "040ma_010" "040ma_030" "040ma_050" "040ma_090")
    (set marine_01 (vs_role 1))
    (set female_marine (vs_role 2))
    (set marine_02 (vs_role 3))
    (set sergeant (vs_role 4))
    (vs_enable_pathfinding_failsafe "intro_troop_hogs" true)
    (vs_enable_looking "intro_troop_hogs" true)
    (vs_enable_targeting "intro_troop_hogs" true)
    (vs_enable_moving "intro_troop_hogs" true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (sleep (random_range 5 200))
    (if dialogue 
        (print "marine 01: do you think there's anybody left?"))
    (vs_play_line marine_01 true 040ma_020)
    (begin_random
        (begin
            (sleep (random_range 5 200))
            (if dialogue 
                (print "female marine: bombed back to the stone age"))
            (vs_play_line female_marine true 040ma_030)
        )
        (begin
            (sleep (random_range 5 200))
            (if dialogue 
                (print "female marine: this was a civilian town.  they didn't stand a chance."))
            (vs_play_line female_marine true 040ma_040)
        )
        (begin
            (sleep (random_range 30 300))
            (if dialogue 
                (print "marine 02: the whole place just feelsdead."))
            (vs_play_line marine_02 true 040ma_050)
            (sleep 15)
            (if dialogue 
                (print "marine 02: it's like a ghost town."))
            (vs_play_line marine_02 true 040ma_060)
        )
        (begin
            (sleep (random_range 5 200))
            (if dialogue 
                (print "marine 01: i heard we sent refugees here.  from mombasa."))
            (vs_play_line marine_01 true 040ma_070)
        )
        (begin
            (sleep (random_range 5 200))
            (if dialogue 
                (print "marine 02: gone.  everything.  everyone.  gone."))
            (vs_play_line marine_02 true 040ma_080)
        )
    )
    (ai_dialogue_enable true)
    (vs_release_all)
)

(script dormant void md_int_dead_02
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:int:dead:02")
    (vs_cast "intro_troop_hogs" true 0 "040ma_110" "040ma_130" "040ma_140" "040ma_190")
    (set marine_01 (vs_role 1))
    (set marine_02 (vs_role 2))
    (set female_marine (vs_role 3))
    (set sergeant (vs_role 4))
    (vs_enable_pathfinding_failsafe "intro_troop_hogs" true)
    (vs_enable_looking "intro_troop_hogs" true)
    (vs_enable_targeting "intro_troop_hogs" true)
    (vs_enable_moving "intro_troop_hogs" true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine 01: my god, what the hell happened here?"))
    (vs_play_line marine_01 true 040ma_010)
    (sleep (random_range 10 20))
    (if dialogue 
        (print "marine 01: this squad was ripped to pieces."))
    (vs_play_line marine_01 true 040ma_110)
    (sleep 10)
    (if dialogue 
        (print "marine 01: anybody know who these guys were?"))
    (vs_play_line marine_01 true 040ma_120)
    (sleep (random_range 30 40))
    (if dialogue 
        (print "marine 02: i think this was 4th battalion.  well, part of it."))
    (vs_play_line marine_02 true 040ma_130)
    (sleep 10)
    (begin_random
        (begin
            (sleep (random_range 50 90))
            (if dialogue 
                (print "female marine: these were the guys sent to secure the town."))
            (vs_play_line female_marine true 040ma_140)
            (sleep 10)
            (if dialogue 
                (print "female marine: poor bastards had no idea what they were walking into."))
            (vs_play_line female_marine true 040ma_150)
            (sleep 10)
            (if dialogue 
                (print "marine 02: they didn't even make it inside the walls?"))
            (vs_play_line marine_02 true 040ma_160)
            (sleep 10)
        )
        (begin
            (sleep (random_range 50 90))
            (if dialogue 
                (print "marine 02: these guys were some of the best we had."))
            (vs_play_line marine_02 true 040ma_170)
            (sleep (random_range 20 90))
            (if dialogue 
                (print "marine 01: these men deserve better than to be left like this."))
            (vs_play_line marine_01 true 040ma_180)
            (sleep 10)
        )
    )
    (begin_random
        (begin
            (sleep (random_range 20 50))
            (if dialogue 
                (print "sergeant: heroes.  every last damn one of them."))
            (vs_play_line sergeant true 040ma_190)
            (sleep 10)
            (if dialogue 
                (print "sergeant: put them out of your minds.  ain't nothing to be done."))
            (vs_play_line sergeant true 040ma_200)
            (sleep 10)
            (vs_release_all)
            (sleep (random_range 120 200))
            (sleep_forever)
        )
        (begin
            (if dialogue 
                (print "sergeant: marines!  keep your voices down."))
            (vs_play_line sergeant true 040ma_090)
            (sleep (random_range 20 40))
            (if dialogue 
                (print "sergeant: this place is crawling with covenant."))
            (vs_play_line sergeant true 040ma_100)
            (sleep 10)
            (vs_release_all)
            (sleep (random_range 120 200))
            (sleep_forever)
        )
    )
    (vs_release_all)
    (ai_dialogue_enable true)
    (sleep (random_range 120 200))
    (wake md_int_dead_01)
)

(script dormant void md_int_door
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:int:door")
    (vs_cast "all_allies" false 0 "040ma_150")
    (set sergeant (vs_role 1))
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant true)
    (vs_enable_targeting sergeant true)
    (vs_enable_moving sergeant true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (begin
        (if dialogue 
            (print "sergeant: ready when you are, chief!"))
        (sleep (ai_play_line sergeant 040ma_150))
        (sleep 20)
    )
    (begin
        (if dialogue 
            (print "sergeant: open the door, take point. we'll cover you with the 50"))
        (sleep (ai_play_line sergeant 040ma_160))
    )
    (ai_dialogue_enable true)
    (set g_playing_dialogue false)
    (vs_release_all)
)

(script dormant void md_int_hog_cover
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:int:hog:cover")
    (vs_cast "intro_troop_hogs" false 0 "040ma_180")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (sleep_until (volume_test_players "vol_intro_hog_msg"))
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (begin_random
        (begin
            (vs_cast "intro_hog" true 0 "040ma_180")
            (set marine (vs_role 1))
            (if dialogue 
                (print "marine: got your back, sir!"))
            (sleep (ai_play_line marine 040ma_180))
            (vs_release_all)
            (sleep_forever)
        )
        (begin
            (vs_cast "intro_hog" true 0 "040ma_190")
            (set marine (vs_role 1))
            (if dialogue 
                (print "marine: lead the way! we'll follow in the hog."))
            (sleep (ai_play_line marine 040ma_190))
            (vs_release_all)
            (sleep_forever)
        )
    )
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_faa_cov_flee
    (print "mission dialogue:faa:cov:flee")
    (set grunt "tank_room_a_init_right/outside01")
    (set grunt_02 "tank_room_a_init_right/outside02")
    (vs_enable_pathfinding_failsafe grunt true)
    (vs_enable_looking grunt true)
    (vs_enable_targeting grunt true)
    (vs_enable_moving grunt true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "grunt: the demon!  run!"))
    (vs_play_line grunt false 040mb_010)
    (if dialogue 
        (print "grunt: wait for me!  waaaiiit!  whaaa!"))
    (vs_custom_animation grunt_02 true "objects\characters\grunt\grunt" "combat:pistol:surprise_front" false)
    (sleep 1)
    (vs_stop_custom_animation grunt_02)
    (sleep 1)
    (vs_play_line grunt_02 false 040mb_030)
    (vs_go_to grunt_02 true "factory_arm_a/grunt_scare")
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_faa_door_hint_01a
    (sleep_until (<= (ai_task_count "factory_a_covenant_obj/faa_cov_init") 0))
    (sleep (random_range 150 200))
    (print "mission dialogue:faa:door:hint:01a")
    (if (<= (device_get_position "factory_a_entry02") 0.0) 
        (begin
            (vs_cast "all_allies" true 0 "040mb_040")
            (set sergeant (vs_role 1))
            (vs_enable_pathfinding_failsafe sergeant true)
            (vs_enable_looking sergeant true)
            (vs_enable_targeting sergeant true)
            (vs_enable_moving sergeant true)
            (vs_set_cleanup_script md_cleanup)
            (sleep 1)
            (if dialogue 
                (print "sergeant: chief, open the door and we can roll through."))
            (sleep (ai_play_line sergeant 040mb_040))
        )
    )
    (vs_release_all)
    (sleep (random_range 900 1000))
    (if (<= (device_get_position "factory_a_entry02") 0.0) 
        (wake md_faa_door_hint_01c))
)

(script dormant void md_faa_door_hint_01b
    (print "mission dialogue:faa:door:hint:01a")
    (vs_cast "all_allies" true 0 "040mb_050")
    (set sergeant (vs_role 1))
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant true)
    (vs_enable_targeting sergeant true)
    (vs_enable_moving sergeant true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "sergeant: door controls should be in the uppper walkway"))
    (sleep (ai_play_line sergeant 040mb_050))
    (sleep 10)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_faa_door_hint_01c
    (print "mission dialogue:faa:door:hint:01c")
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: sir? open the door, and we can drive on through."))
    (sleep (ai_play_line marine 040mb_060))
    (sleep 10)
    (vs_release_all)
    (ai_dialogue_enable true)
    (sleep (random_range 60 120))
    (sleep_until (volume_test_players "vol_tank_room_a_start"))
    (if (<= (device_get_position "factory_a_entry02") 0.0) 
        (wake md_faa_door_hint_01b))
)

(script dormant void md_faa_door_go
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:faa:door:go")
    (vs_cast "all_allies" true 0 "040mb_080")
    (set sergeant (vs_role 1))
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant true)
    (vs_enable_targeting sergeant true)
    (vs_enable_moving sergeant true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "sergeant: there we go! hustle through, marines"))
    (sleep (ai_play_line sergeant 040mb_080))
    (sleep (random_range 10 50))
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (sleep_until (<= (ai_task_count "factory_a_covenant_obj/tank_room_combat01") 0))
    (sleep (random_range 10 40))
    (if (<= (device_get_position "factory_a_middle") 0.0) 
        (wake md_faa_door_hint_02))
)

(script dormant void md_faa_door_hint_02
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:faa:door:hint:02")
    (vs_cast "all_allies" true 0 "040mb_100")
    (set sergeant (vs_role 1))
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant true)
    (vs_enable_targeting sergeant true)
    (vs_enable_moving sergeant true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "sergeant: open the door, chief! we got you covered!"))
    (sleep (ai_play_line sergeant 040mb_100))
    (sleep 10)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_faa_door_go_02
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:faa:door:go")
    (vs_cast "all_allies" true 0 "040mb_080")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: push forward!  give 'em hell!"))
    (sleep (ai_play_line marine 040mb_090))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_lake_a_radio_sitrep
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (sleep (random_range 45 60))
    (print "mission dialogue:faa:radio:help")
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "lord hood (radio): kilo-two_three this is forward unto dawn..."))
    (sleep (ai_play_line_on_object none 040mb_120))
    (sleep 20)
    (if dialogue 
        (print "lord hood (radio): i need a sitrep, commander."))
    (sleep (ai_play_line_on_object none 040mb_130))
    (sleep 10)
    (if dialogue 
        (print "miranda (radio): atmospheric disturbance is intensifying aborve the artifact, admiral..."))
    (sleep (ai_play_line_on_object none 040mb_140))
    (sleep 10)
    (if dialogue 
        (print "lord hood (radio): and sierra one-one-seven?"))
    (sleep (ai_play_line_on_object none 040mb_160))
    (sleep 20)
    (if dialogue 
        (print "miranda (radio): moving as fast as he can, sir. i know he'll get it done"))
    (sleep (ai_play_line_on_object none 040mb_170))
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (set g_music_040_02 false)
    (wake music_040_03)
    (set g_music_040_03 true)
    (sleep_until 
        (or
            (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
            (<= (ai_task_count "lakebed_a_covenant_obj/center_structure") 0)
        ) 
    100)
    (sleep (* 30.0 10.0))
    (if (> (object_get_health (ai_vehicle_get_from_starting_location "lakebed_a_wraith_01/driver01")) 0.0) 
        (wake md_lake_a_radio_sitrep02))
)

(script dormant void md_lake_a_radio_sitrep02
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:faa:joh:radio:help")
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep (random_range 30 60))
    (if dialogue 
        (print "sergeant: gotta pick up the pace, chief!"))
    (sleep (ai_play_line_on_object none 040mb_180))
    (sleep 20)
    (if dialogue 
        (print "sergeant: admiral needs that anti-air dead asap"))
    (sleep (ai_play_line_on_object none 040mb_190))
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_laa_pier_help
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:laa:pier:help")
    (vs_cast "all_allies" false 1 "040mc_050")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if (not (volume_test_players "vol_lakebed_a_bridge")) 
        (begin
            (if dialogue 
                (print "marine: there! on the pier!"))
            (vs_play_line marine true 040mc_050)
            (sleep 10)
            (if dialogue 
                (print "marine: those guys are getting hammered!"))
            (vs_play_line marine true 040mc_060)
            (sleep 10)
            (if dialogue 
                (print "marine: they ain't gunna last long without us!"))
            (vs_play_line marine true 040mc_080)
        )
    )
    (ai_dialogue_enable true)
    (set g_playing_dialogue false)
    (vs_release_all)
)

(script dormant void md_laa_wraith_dead
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:laa:wraith:dead")
    (vs_cast "all_allies" false 0 "040mc_120")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe "all_allies" true)
    (vs_enable_looking "all_allies" true)
    (vs_enable_targeting "all_allies" true)
    (vs_enable_moving "all_allies" true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: hell yeah! boom!"))
    (sleep (ai_play_line marine 040mc_120))
    (sleep 20)
    (if dialogue 
        (print "marine: fly-boys are gunna love us for that!"))
    (sleep (ai_play_line marine 040mc_130))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (sleep (random_range 20 50))
    (wake md_laa_mar_fab_help_01)
)

(script dormant void md_laa_mar_fab_help_01
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:laa:mar:fab:help:01")
    (ai_dialogue_enable false)
    (sleep 1)
    (wake objective_2_set)
    (if dialogue 
        (print "johnson (radio): that-a-way, chief! target destroyed!"))
    (sleep (ai_play_line_on_object none 040mc_140))
    (sleep 60)
    (if dialogue 
        (print "johnson (radio, static): move to the next area, over?"))
    (sleep (ai_play_line_on_object none 040mc_150))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (sleep_until (<= (ai_living_count "lakebed_a_covenant_obj") 0))
    (sleep (* 30.0 120.0))
    (if (volume_test_players "vol_lakebed_a") 
        (wake md_laa_joh_fab_help))
)

(script dormant void md_laa_joh_fab_help
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:laa:joh:fab:help")
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "johnson (radio): chief! keep moving around the crater!"))
    (sleep (ai_play_line_on_object none 040mc_180))
    (sleep 100)
    (if dialogue 
        (print "johnson (radio): hurry, chief! you need to find all the tanks."))
    (sleep (ai_play_line_on_object none 040mc_190))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_laa_mar_fab_help_02
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:laa:mar:fab:help:02")
    (vs_cast "all_allies" true 0 "040mc_180" "040mc_190")
    (set marine (vs_role 1))
    (set marine_01 (vs_role 1))
    (vs_enable_pathfinding_failsafe "all_allies" true)
    (vs_enable_looking "all_allies" true)
    (vs_enable_targeting "all_allies" true)
    (vs_enable_moving "all_allies" true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: let's go help those marines!"))
    (vs_play_line marine true 040mc_180)
    (sleep 20)
    (if dialogue 
        (print "marine: c'mon!  doctors and pretty nurses!  they need us in there!"))
    (vs_play_line marine_01 true 040mc_190)
    (sleep 10)
    (ai_dialogue_enable true)
    (set g_playing_dialogue false)
    (vs_release_all)
)

(script dormant void md_fab_new_rahrah
    (sleep_until 
        (or
            (sleep_until (volume_test_players "vol_fab_entryroom"))
            (<= (ai_task_count "lakebed_a_covenant_obj/ground_wraith_gate") 0)
        )
    )
    (print "mission dialogue:fab:new:rahrah")
    (vs_cast "factory_b_allies" true 0 "040md_010")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (if dialogue 
        (print "marine: they just keep coming!"))
    (sleep (ai_play_line marine 040md_010))
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_fab_new_contact
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:fab:new:contact")
    (vs_cast "factory_b_allies" false 1 "040md_020")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 50)
    (if dialogue 
        (print "female marine: check your fire! it's the chief!"))
    (sleep (ai_play_line marine 040md_020))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (sleep (random_range 50 90))
    (wake md_fab_flush)
)

(script dormant void md_fab_flush
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:fab:flush")
    (vs_cast "factory_b_allies" true 0 "040md_030")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "female marine: flush 'em out, sir!"))
    (sleep (ai_play_line marine 040md_030))
    (sleep 25)
    (if dialogue 
        (print "female marine: we'll nail em with the 50!"))
    (sleep (ai_play_line marine 040md_040))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_fab_hog_door
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:fab:hog:door")
    (wake md_fab_last_mags)
    (vs_cast "factory_b_allies" true 0 "040md_050" "040mx_050")
    (set marine (vs_role 1))
    (set marine_02 (vs_role 2))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if 
        (and
            (volume_test_object "vol_fab" (ai_vehicle_get_from_starting_location "intro_hog/driver"))
            (not (<= (object_get_health (ai_vehicle_get_from_starting_location "intro_hog/driver")) 0.0))
        ) 
            (begin
                (if dialogue 
                    (print "marine: they've got a hog!"))
                (sleep (ai_play_line marine 040md_050))
                (sleep 10)
            )
    )
    (if dialogue 
        (print "marine: open the door!"))
    (sleep (ai_play_line marine 040mx_050))
    (sleep (random_range 20 60))
    (if dialogue 
        (print "marine: hurry!  before any more covenant show up!"))
    (sleep (ai_play_line marine 040md_060))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_fab_last_mags
    (sleep_until 
        (or
            (volume_test_players "vol_factory_b_center")
            (>= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 1)
        )
    )
    (sleep 80)
    (print "mission dialogue:fab:turret:help")
    (vs_cast "factory_b_allies" false 0 "040md_070")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if (<= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 0) 
        (begin
            (if dialogue 
                (print "marine: we're down to our last mags, sir..."))
            (vs_play_line marine true 040md_070)
            (sleep 10)
        )
    )
    (if (<= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 0) 
        (begin
            (if dialogue 
                (print "marine: thought those last ones had us."))
            (vs_play_line marine true 040md_080)
            (sleep 10)
        )
    )
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_fab_thanks
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:fab:thanks")
    (vs_cast "factory_b_allies" true 0 "040md_160")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "female marine: clear! check the wounded!"))
    (vs_play_line female_marine true 040md_160)
    (sleep 10)
    (if dialogue 
        (print "female marine: we spotted wraiths in the next lakebed, sir..."))
    (vs_play_line female_marine true 040md_170)
    (sleep 10)
    (if dialogue 
        (print "female marine: our orders were to hold here until we got some support..."))
    (vs_play_line female_marine true 040md_180)
    (sleep 10)
    (if dialogue 
        (print "female marine: i guess that's you."))
    (vs_play_line female_marine true 040md_190)
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_fab_mar_buggers
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (sleep 60)
    (print "mission dialogue:fab:mar:buggers")
    (vs_cast "factory_b_allies" true 0 "040md_100" "040md_110")
    (set marine (vs_role 1))
    (set marine_01 (vs_role 2))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_enable_pathfinding_failsafe marine_01 true)
    (vs_enable_looking marine_01 true)
    (vs_enable_targeting marine_01 true)
    (vs_enable_moving marine_01 true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: hey! you hear something?"))
    (sleep (ai_play_line marine 040md_100))
    (sleep 10)
    (sleep_until (>= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 1) 10)
    (if dialogue 
        (print "marine: sounds like... drones!"))
    (sleep (ai_play_line marine_01 040md_060))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (sleep 110)
    (wake md_fab_mar_buggers_02)
)

(script dormant void md_fab_mar_buggers_02
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:fab:mar:buggers:02")
    (vs_cast "factory_b_allies" true 0 "040md_120" "040md_130")
    (set marine (vs_role 1))
    (set marine_01 (vs_role 2))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_enable_pathfinding_failsafe marine_01 true)
    (vs_enable_looking marine_01 true)
    (vs_enable_targeting marine_01 true)
    (vs_enable_moving marine_01 true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: there's too many!"))
    (sleep (ai_play_line marine 040md_120))
    (sleep 10)
    (if dialogue 
        (print "marine: fall back! fall back!"))
    (sleep (ai_play_line marine 040md_130))
    (sleep 10)
    (if dialogue 
        (print "marine: get the door!"))
    (sleep (ai_play_line marine 040md_140))
    (sleep 10)
    (ai_dialogue_enable true)
    (set g_playing_dialogue false)
    (vs_release_all)
)

(script dormant void md_fab_more_wraiths
    (sleep_until 
        (or
            (volume_test_players "vol_factory_b_tunnel_end")
            (<= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 0)
        )
    )
    (sleep 80)
    (set g_playing_dialogue true)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "johnson (radio): you got anti-air wraiths in the next lakebed, chief!"))
    (sleep (ai_play_line_on_object none 040md_240))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
    (cs_run_command_script female_marine pause_forever)
    (sleep_until (volume_test_players "vol_lakebed_b_ledge") 30 (* 30.0 25.0))
    (if (>= (ai_living_count "lakebed_b_covenant_obj/dumb_init") 1) 
        (md_fab_mar_lab_help_02))
    (cs_run_command_script female_marine abort)
)

(script dormant void md_fab_goose
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:fab:goose")
    (vs_cast "allied_goose" true 1 "040md_200")
    (set female_marine (vs_role 1))
    (vs_enable_pathfinding_failsafe female_marine true)
    (vs_enable_looking female_marine true)
    (vs_enable_targeting female_marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "female marine (radio 3d): mount up! rockets in back!"))
    (sleep (ai_play_line female_marine 040md_200))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_punch_hard
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:punch:hard")
    (vs_cast "allied_goose" false 1 "040md_230")
    (set female_marine (vs_role 1))
    (vs_enable_pathfinding_failsafe female_marine true)
    (vs_enable_looking female_marine true)
    (vs_enable_targeting female_marine true)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "female marine (radio 3d): we gotta move fast and punch hard!"))
    (sleep (ai_play_line female_marine 040md_230))
    (wake music_040_06)
    (set g_music_040_06 true)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (wake md_fab_more_wraiths)
)

(script static void md_fab_mar_lab_help_02
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:fab:mar:lab:help:02")
    (vs_cast "allied_goose" true 1 "040md_260")
    (set female_marine (vs_role 1))
    (vs_enable_pathfinding_failsafe female_marine true)
    (vs_enable_looking female_marine true)
    (vs_enable_targeting female_marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "female marine: let's get those wraiths, sir! come on!"))
    (sleep (ai_play_line female_marine 040md_260))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (cs_run_command_script female_marine pause_forever)
)

(script dormant void md_lab_wraith01
    (print "mission dialogue:lab:wraith01")
    (vs_cast "lake_b_def_center" false 0 "040me_040")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: one down, one to go!"))
    (vs_play_line marine true 040me_040)
    (sleep 10)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_lab_wraith02
    (print "mission dialogue:lab:wraith02")
    (sleep (random_range 30 100))
    (ai_dialogue_enable false)
    (if (= (game_insertion_point_get) 0) 
        (begin
            (if dialogue 
                (print "johnson (radio): both aa wraiths have been neutralized!"))
            (sleep (ai_play_line_on_object none 040me_052))
            (sleep 10)
        )
    )
    (ai_dialogue_enable true)
    (sleep (random_range 45 60))
    (wake md_lab_something_big)
)

(script dormant void md_lab_something_big
    (print "mission dialogue:lab:something_big")
    (ai_dialogue_enable false)
    (if dialogue 
        (print "johnson (radio): standby… something big... closing in on your location… "))
    (sleep (ai_play_line_on_object none 040me_053))
    (sleep 10)
    (set g_music_040_06 false)
    (ai_dialogue_enable true)
)

(script dormant void md_lab_few_pelicans
    (print "mission dialogue:few:pelicans")
    (set g_playing_dialogue true)
    (ai_dialogue_enable false)
    (if dialogue 
        (print "miranda (radio): well done, chief!"))
    (sleep (ai_play_line_on_object none 040bb_010))
    (sleep 20)
    (if dialogue 
        (print "miranda (radio): i'm sending in a few pelicans…"))
    (sleep (ai_play_line_on_object none 040bb_020))
    (sleep 10)
    (sleep (random_range 90 150))
    (if dialogue 
        (print "johnson (radio): one more target, chief!"))
    (sleep (ai_play_line_on_object none 040me_054))
    (sleep 10)
    (if dialogue 
        (print "johnson (radio): there's a covenant aa gun in the next area!"))
    (sleep (ai_play_line_on_object none 040me_055))
    (sleep 10)
    (wake objective_4_set)
    (if dialogue 
        (print "johnson (radio): take it down, and lord hood can start his attack run!"))
    (sleep (ai_play_line_on_object none 040me_056))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void md_lab_mar_scarab_sound
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:lab:mar:scarab:sound")
    (ai_dialogue_enable false)
    (sleep 1)
    (print "scarab sounds")
    (sound_impulse_start "sound\device_machines\scarab\scarab_roar_distant" "scarab_sound" 2.0)
    (sleep 70)
    (if dialogue 
        (print "marine: what's that sound?"))
    (sleep (ai_play_line_on_object none 040me_131))
    (sleep (random_range 50 70))
    (if dialogue 
        (print "marine: it's getting closer!"))
    (sleep (ai_play_line_on_object none 040me_132))
    (sleep (random_range 50 110))
    (if dialogue 
        (print "marine: this can't be good, man…"))
    (sleep (ai_play_line_on_object none 040me_133))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void md_lab_mar_scarab
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:lab:mar:scarab")
    (sleep (* 30.0 6.0))
    (ai_dialogue_enable false)
    (if dialogue 
        (print "marine: scarab!"))
    (sleep (ai_play_line_on_object none 040me_140))
    (sleep 10)
    (if dialogue 
        (print "marine: find some cover! now!"))
    (sleep (ai_play_line_on_object none 040me_150))
    (sleep 10)
    (if (= (game_insertion_point_get) 0) 
        (begin
            (wake music_040_07)
            (set g_music_040_07 true)
        )
    )
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (game_save)
    (sleep (* 30.0 15.0))
    (wake md_lab_mar_scarab_hints_01)
)

(script dormant void md_lab_mar_scarab_hints_01
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:lab:mar:scarab:hints:01")
    (ai_dialogue_enable false)
    (sleep 1)
    (sleep (* 30.0 70.0))
    (if 
        (and
            (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
            (not (volume_test_players "vol_scarab_top"))
            (<= (object_buckling_magnitude_get "scarab_giant") 0.0)
        ) 
            (begin
                (if dialogue 
                    (print "marine 02: we'll try to draw its fire."))
                (sleep (ai_play_line_on_object none 040me_220))
                (sleep 40)
            )
    )
    (if 
        (and
            (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
            (not (volume_test_players "vol_scarab_top"))
            (<= (object_buckling_magnitude_get "scarab_giant") 0.0)
        ) 
            (begin
                (if dialogue 
                    (print "marine (radio 3d): use rockets! target its joints!"))
                (sleep (ai_play_line_on_object none 040me_230))
                (sleep 10)
            )
    )
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
    (wake md_lab_mar_scarab_hints_03)
)

(script dormant void md_lab_mar_scarab_hints_03
    (sleep (* 30.0 100.0))
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (sound_looping_set_alternate "levels\solo\040_voi\music\040_music_08" true)
    (print "mission dialogue:lab:mar:scarab:hints:02")
    (ai_dialogue_enable false)
    (sleep 1)
    (if 
        (and
            (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
            (not (volume_test_players "vol_scarab_top"))
            (<= (object_buckling_magnitude_get "scarab_giant") 0.0)
        ) 
            (begin
                (if dialogue 
                    (print "johnson (radio): armor's too thick! gotta take it out from the inside!"))
                (sleep (ai_play_line_on_object none 040me_370))
                (sleep (* 30.0 20.0))
            )
    )
    (if 
        (and
            (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
            (not (volume_test_players "vol_scarab_top"))
            (<= (object_buckling_magnitude_get "scarab_giant") 0.0)
        ) 
            (begin
                (if dialogue 
                    (print "johnson (radio): try to get on its back!"))
                (sleep (ai_play_line_on_object none 040me_350))
                (sleep (* 30.0 20.0))
                (if dialogue 
                    (print "johnson (radio): jump on top of it, chief! just like new mombasa!"))
                (sleep (ai_play_line_on_object none 040me_360))
                (sleep (* 30.0 20.0))
            )
    )
    (begin_random
        (begin
            (if 
                (and
                    (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
                    (not (volume_test_players "vol_scarab_top"))
                    (<= (object_buckling_magnitude_get "scarab_giant") 0.0)
                ) 
                    (begin
                        (if dialogue 
                            (print "johnson (radio): armor's too thick! gotta take it out from the inside!"))
                        (sleep (ai_play_line_on_object none 040me_370))
                        (sleep (* 30.0 20.0))
                    )
            )
        )
        (begin
            (if 
                (and
                    (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
                    (not (volume_test_players "vol_scarab_top"))
                    (<= (object_buckling_magnitude_get "scarab_giant") 0.0)
                ) 
                    (begin
                        (if dialogue 
                            (print "johnson (radio): try to get on its back!"))
                        (sleep (ai_play_line_on_object none 040me_350))
                        (sleep (* 30.0 20.0))
                    )
            )
        )
    )
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void md_lab_mar_scarab_hints_04
    (sleep (* 30.0 50.0))
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (if 
                        (and
                            (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
                            (volume_test_players "vol_scarab")
                        ) 
                            (begin
                                (ai_dialogue_enable false)
                                (if dialogue 
                                    (print "johnson (radio): look for a weak spot, chief!"))
                                (sleep (ai_play_line_on_object none 040me_380))
                                (sleep 10)
                                (if dialogue 
                                    (print "johnson (radio): a power-core! something like that!"))
                                (sleep (ai_play_line_on_object none 040me_390))
                                (ai_dialogue_enable true)
                                (sleep (* 30.0 40.0))
                            )
                    )
                )
                (begin
                    (if 
                        (and
                            (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
                            (volume_test_players "vol_scarab")
                        ) 
                            (begin
                                (ai_dialogue_enable false)
                                (if dialogue 
                                    (print "johnson (radio): looks for the core, chief! you'll know it when you see it!"))
                                (sleep (ai_play_line_on_object none 040me_400))
                                (ai_dialogue_enable true)
                                (sleep (* 30.0 40.0))
                            )
                    )
                )
            )
            false
        )
    )
)

(script dormant void md_scarab_inside
    (sleep_until 
        (and
            (not g_playing_dialogue)
            (>= (object_buckling_magnitude_get "scarab_giant") 0.5)
            (not (object_model_target_destroyed "scarab_giant" "indirect_engine"))
        )
    )
    (sleep 60)
    (if (not (volume_test_players "vol_scarab")) 
        (begin
            (print "mission dialogue:scarab:inside")
            (ai_dialogue_enable false)
            (sleep 1)
            (if dialogue 
                (print "marine (radio): now! while it's down! find a way inside!"))
            (sleep (ai_play_line_on_object none 040me_250))
            (set g_playing_dialogue false)
            (ai_dialogue_enable true)
        )
    )
)

(script dormant void md_scarab_get_off
    (sleep_until 
        (and
            (not g_playing_dialogue)
            (object_model_target_destroyed "scarab_giant" "indirect_engine")
        )
    )
    (sleep 60)
    (if (volume_test_players "vol_scarab") 
        (begin
            (print "mission dialogue:scarab:get:0ff")
            (ai_dialogue_enable false)
            (sleep 1)
            (if dialogue 
                (print "marine (radio): get away! it's gunna blow!"))
            (sleep (ai_play_line_on_object none 040mq_030))
            (set g_playing_dialogue false)
            (ai_dialogue_enable true)
        )
    )
)

(script dormant void md_lab_mar_scarab_dead
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (sleep (random_range 15 30))
    (print "mission dialogue:lab:mar:scarab:dead")
    (vs_cast "lake_b_def_center" true 0 "040me_410")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: i don't believe it!  he killed a scarab!"))
    (sleep (ai_play_line marine 040me_410))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_lab_joh_back_inside
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:lab:joh:back:inside")
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "johnson (radio): aint got time for celecration, marines!"))
    (sleep (ai_play_line_on_object none 040me_430))
    (sleep 10)
    (if dialogue 
        (print "johnson (radio): cut through the warehouse, get to that gun!"))
    (sleep (ai_play_line_on_object none 040me_440))
    (sleep (* 30.0 30.0))
    (if dialogue 
        (print "johnson (radio): keep going, chief! head back inside!"))
    (sleep (ai_play_line_on_object none 040me_470))
    (sleep (* 30.0 40.0))
    (if dialogue 
        (print "johnson (radio): chief! forward progress! come on!"))
    (sleep (ai_play_line_on_object none 040me_480))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void md_arb_entrance
    (sleep_until 
        (and
            (not g_playing_dialogue)
            (<= (objects_distance_to_object (players) "arbiter") 5.0)
        )
    )
    (print "mission dialogue:arb:entrance")
    (vs_cast "arbiter" false 0 "040mq_020")
    (set gr_arbiter (vs_role 1))
    (vs_enable_pathfinding_failsafe "arbiter" true)
    (vs_enable_looking "arbiter" true)
    (vs_enable_targeting "arbiter" true)
    (vs_enable_moving "arbiter" true)
    (vs_set_cleanup_script md_cleanup)
    (set g_playing_dialogue true)
    (ai_dialogue_enable true)
    (sleep 1)
    (wake music_040_10)
    (set g_music_040_10 true)
    (if dialogue 
        (print "arbiter: there was honor in our covenant once...and there shall be again!"))
    (sleep (ai_play_line gr_arbiter 040mq_020))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_cor_mar_locked_down
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:cor:mar:locked:down")
    (vs_cast "all_allies" false 0 "040mf_010")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (set g_playing_dialogue true)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: we got this area locked down, sir!"))
    (sleep (ai_play_line marine 040mf_010))
    (sleep 10)
    (if dialogue 
        (print "marine: follow us! we'll get you through!"))
    (sleep (ai_play_line marine 040mf_020))
    (sleep 10)
    (set g_music_040_07 false)
    (set g_music_040_09 false)
    (set g_music_040_10 false)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_laa_last_night
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:laa:thanks:01")
    (vs_cast "all_allies" false 0 "040mc_090")
    (set sergeant (vs_role 1))
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant true)
    (vs_enable_targeting sergeant true)
    (vs_enable_moving sergeant true)
    (vs_set_cleanup_script md_cleanup)
    (sleep 1)
    (if dialogue 
        (print "sergeant: we infilled last night, sir. twenty-one hundred."))
    (sleep (ai_play_line sergeant 040mc_090))
    (sleep (random_range 10 100))
    (if dialogue 
        (print "sergeant: ran into multiple bravo kilos, had to split my squads."))
    (sleep (ai_play_line sergeant 040mc_100))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (sleep (random_range 200 300))
    (wake md_cor_mar_safest_place)
)

(script dormant void md_cor_mar_safest_place
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:cor:mar:safest:place")
    (vs_cast "cortana_office_allies" true 0 "040mf_030")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "marine: warehouse was the safest place for all the civilians"))
    (sleep (ai_play_line marine 040mf_030))
    (sleep 10)
    (if dialogue 
        (print "marine: most are locals. some are from mombasa..."))
    (sleep (ai_play_line marine 040mf_040))
    (sleep 90)
    (if dialogue 
        (print "marine: we got hostiles in the surrounding buildings..."))
    (sleep (ai_play_line marine 040mf_060))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_office_morphine
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:office:morphine")
    (vs_cast "cortana_office_allies02/medic01" false 0 "040mq_040")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe marine true)
    (vs_enable_looking marine true)
    (vs_enable_targeting marine true)
    (vs_enable_moving marine true)
    (vs_set_cleanup_script md_cleanup)
    (sleep 1)
    (if dialogue 
        (print "marine: some one get me some morphine!"))
    (sleep (ai_play_line marine 040mq_040))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (wake vig_office_radio)
)

(script dormant void md_work_mir_single_ship
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:work:mir:single:ship")
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "miranda (radio): admiral? a single covenant ship just slipped in-system!"))
    (sleep (ai_play_line_on_object none 040mh_040))
    (sleep 10)
    (if dialogue 
        (print "hood (radio): just one? what's its range and disposition?"))
    (sleep (ai_play_line_on_object none 040mh_050))
    (sleep 10)
    (if dialogue 
        (print "miranda (radio): above the artifact, inside the orbital line. seems to be holding stready."))
    (sleep (ai_play_line_on_object none 040mh_060))
    (sleep 10)
    (if dialogue 
        (print "hood (radio): the attack proceeds as planned, commander..."))
    (sleep (ai_play_line_on_object none 040mh_070))
    (sleep 10)
    (if dialogue 
        (print "hood (radio): we're not going to get another shot at truth"))
    (sleep (ai_play_line_on_object none 040mh_080))
    (sleep 10)
    (if dialogue 
        (print "miranda (radio): sir, yes sir!"))
    (sleep (ai_play_line_on_object none 040mh_090))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void md_hunter_hints
    (print "mission dialogue:hunter:hints")
    (if 
        (or
            (difficulty_heroic)
            (difficulty_legendary)
        ) 
            (sleep (* 30.0 90.0)) (sleep (* 30.0 30.0)))
    (if 
        (and
            (>= (ai_living_count "ware_cov_hunters") 2)
            (volume_test_players "vol_warehouse_backhalf")
        ) 
            (begin
                (ai_dialogue_enable false)
                (if dialogue 
                    (print "sergeant (radio): gotta get around behind them, chief!"))
                (sleep (ai_play_line_on_object none 040mg_270))
                (sleep 10)
                (if dialogue 
                    (print "sergeant (radio): look for gaps in their armor!"))
                (sleep (ai_play_line_on_object none 040mg_280))
                (ai_dialogue_enable true)
            )
    )
)

(script dormant void md_arb_truth_response
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (sleep 90)
    (print "mission dialogue:arb:truth:response")
    (vs_cast "arbiter" false 0 "040mq_010")
    (set gr_arbiter (vs_role 1))
    (vs_enable_pathfinding_failsafe "arbiter" true)
    (vs_go_to gr_arbiter true "worker_pts/arbiter01")
    (vs_face_object gr_arbiter true "truth_worker")
    (vs_set_cleanup_script md_cleanup)
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "arbiter: i will not be shamed! not again! not by you!"))
    (sleep (ai_play_line gr_arbiter 040mq_010))
    (sleep 10)
    (set g_playing_dialogue false)
    (vs_release_all)
    (ai_dialogue_enable true)
)

(script dormant void md_work_pil_energy_cascades
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:work:pil:energy:cascades")
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "pilot (radio): all brutes cruisers are pulling back to truth's ship!"))
    (sleep (ai_play_line_on_object none 040mh_100))
    (sleep 10)
    (if dialogue 
        (print "pilot (radio): wind inside the storm just hit 200 kilometers per hour"))
    (sleep (ai_play_line_on_object none 040mh_110))
    (sleep 10)
    (if dialogue 
        (print "pilot (radio): energy cascades! all over the artifact!"))
    (sleep (ai_play_line_on_object none 040mh_120))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void md_bfg_joh_straight_ahead
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:work:joh:straight:ahead")
    (ai_dialogue_enable false)
    (sleep 1)
    (if dialogue 
        (print "johnson (radio): gun should be straight ahead, chief!"))
    (sleep (ai_play_line_on_object none 040mh_010))
    (sleep 10)
    (if dialogue 
        (print "johnson (radio): once it's destroyed, lord hood will start his run!"))
    (sleep (ai_play_line_on_object none 040mh_020))
    (sleep 10)
    (if dialogue 
        (print "johnson (radio): c'mon, spartan! it's all up to you!"))
    (sleep (ai_play_line_on_object none 040mh_030))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script dormant void br_ark_is_bad
    (print "br:ark:is:bad")
    (ai_dialogue_enable false)
    (sleep 1)
    (wake music_040_13)
    (if dialogue 
        (print "miranda (radio): chief! hood's ships are closing fast!"))
    (sleep (ai_play_line_on_object none 040bc_010))
    (sleep 20)
    (if dialogue 
        (print "miranda (radio): destroy that gun! we're out of time!"))
    (sleep (ai_play_line_on_object none 040bc_030))
    (sleep 10)
    (ai_dialogue_enable true)
)

(script dormant void md_bfg_joh_charge
    (sleep_until 
        (and
            (not g_playing_dialogue)
            true
        )
    )
    (print "mission dialogue:bfg:joh:charge")
    (if dialogue 
        (print "johnson (radio): charge that hill, marines! do not give up!"))
    (sleep (ai_play_line_on_object none 040mh_160))
    (sleep 10)
    (set g_playing_dialogue false)
)

(script dormant void md_bfg_joh_hints
    (print "mission dialogue:bfg:joh:hints")
    (ai_dialogue_enable false)
    (if dialogue 
        (print "johnson (radio): chief, that gun's been firing non-stop. it's gotta be running hot..."))
    (sleep (ai_play_line_on_object none 040mh_210))
    (sleep (* 30.0 17.0))
    (if dialogue 
        (print "johnson (radio): wait for it to open up - vent its excess plasma..."))
    (sleep (ai_play_line_on_object none 040mh_220))
    (hud_activate_team_nav_point_flag player "nav_bfg_core" 0.0)
    (sleep 10)
    (if dialogue 
        (print "johnson (radio): then shove some lead down its throat!"))
    (sleep (ai_play_line_on_object none 040mh_240))
    (sleep 10)
    (set g_playing_dialogue false)
    (ai_dialogue_enable true)
)

(script static void vs_scarab_intro
    (wake md_lab_mar_scarab_sound)
    (sleep 100)
    (data_mine_set_mission_segment "040_60_scarab")
    (ai_place "scarab")
    (object_cannot_take_damage "scarab_giant")
    (wake spawn_scarab_ai)
    (wake scarab_allies_backup)
    (wake md_lab_mar_scarab)
    (vs_custom_animation "scarab/driver01" false "objects\giants\scarab\cinematics\perspectives\040pb_scarab_intro\040pb_scarab_intro" "040pb_scarab_intro_1" false)
    (sleep (unit_get_custom_animation_time (ai_get_unit "scarab/driver01")))
    (vs_stop_custom_animation "scarab/driver01")
    (ai_force_active "scarab/driver01" true)
    (object_can_take_damage "scarab_giant")
    (wake objective_3_set)
    (wake music_040_08)
    (sleep 30)
    (wake scarab_present)
    (wake md_scarab_inside)
    (sleep 1)
    (ai_enter_squad_vehicles "all_allies")
    (ai_enter_squad_vehicles "all_enemies")
)

(script dormant void spawn_scarab_ai
    (sleep 200)
    (print "spawning scarab ai")
    (ai_place "lakebed_b_scarab_brutes")
    (ai_place "lakebed_b_scarab_brutes02")
    (ai_place "lakebed_b_scarab_grunts")
)

(script static void scarab_test
    (ai_place "scarab")
    (vs_custom_animation "scarab/driver01" false "objects\giants\scarab\cinematics\perspectives\040pa_scarab_intro\040pa_scarab_intro" "040pa_scarab_intro_1" false)
    (sleep (unit_get_custom_animation_time (ai_get_unit "scarab/driver01")))
    (vs_stop_custom_animation "scarab/driver01")
    (ai_force_active "scarab/driver01" true)
)

(script dormant void vig_office_radio
    (sleep (random_range 120 180))
    (print "pilot (radio): all brutes cruisers are pulling back to truth's ship!")
    (sleep (ai_play_line_on_object "office_radio" 040mh_100))
    (sleep 10)
    (print "pilot (radio): wind inside the storm just hit 200 kilometers per hour")
    (sleep (ai_play_line_on_object "office_radio" 040mh_110))
    (sleep 10)
    (print "pilot (radio): energy cascades! all over the artifact!")
    (sleep (ai_play_line_on_object "office_radio" 040mh_120))
    (sleep (* 30.0 11.0))
    (print "miranda (radio): admiral? a single covenant ship just slipped in-system!")
    (sleep (ai_play_line_on_object "office_radio" 040mh_040))
    (sleep 10)
    (print "hood (radio): just one? what's its range and disposition?")
    (sleep (ai_play_line_on_object "office_radio" 040mh_050))
    (sleep 10)
    (print "miranda (radio): above the artifact, inside the orbital line. seems to be holding stready.")
    (sleep (ai_play_line_on_object "office_radio" 040mh_060))
    (sleep 10)
    (print "hood (radio): the attack proceeds as planned, commander...")
    (sleep (ai_play_line_on_object "office_radio" 040mh_070))
    (sleep 10)
    (print "hood (radio): we're not going to get another shot at truth")
    (sleep (ai_play_line_on_object "office_radio" 040mh_080))
    (sleep 10)
    (print "miranda (radio): sir, yes sir!")
    (sleep (ai_play_line_on_object "office_radio" 040mh_090))
)

(script dormant void vig_cor_mar_open_up
    (print "mission vig:cor:mar:open:up")
    (set marine "cortana_office_code/open_up")
    (vs_reserve marine 1)
    (vs_enable_pathfinding_failsafe marine true)
    (vs_go_to marine true "warehouse/open_up01")
    (if dialogue 
        (print "marine: come on, man! i have the chief"))
    (vs_play_line marine true 040mg_010)
    (sleep 10)
    (if dialogue 
        (print "marine: yeah, well the chief's gunna solve that problem real quick."))
    (vs_play_line marine true 040mg_040)
    (sleep 10)
    (vs_release_all)
    (device_set_position "warehouse_entry" 1.0)
    (device_set_position "ware_security_door" 0.0)
)

(script dormant void vig_war_sgt_brute_pack
    (print "mission vig:war:sgt:brute:pack")
    (set sergeant "ware_hum_marines_flee/shotgun01")
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_force_combat_status sergeant ai_combat_status_active)
    (vs_go_to_and_face sergeant true "warehouse/p0" "warehouse/p2")
    (vs_shoot sergeant true "ware_cov_brutes01/leader")
    (vs_release_all)
)

(script dormant void vig_ware_brute02
    (ai_place "ware_cov_brutes02")
    (ai_place "ware_hum_201")
    (ai_disregard (ai_actors "ware_hum_201/civ01") true)
    (vs_cast "ware_cov_brutes02/brute01" true 0 "")
    (set brute (vs_role 1))
    (vs_cast "ware_hum_201/civ01" true 0 "")
    (set marine (vs_role 1))
    (sleep 1)
    (ai_magically_see "ware_cov_brutes02" "ware_hum_201")
    (vs_custom_animation_loop marine "objects\characters\marine\cinematics\vignettes\010va_brute_intro\010va_brute_intro" "020vb_vict_idle" false "warehouse/vig02")
    (vs_custom_animation_loop brute "objects\characters\brute\cinematics\vignettes\010va_brute_intro\010va_brute_intro" "020vb_exec_idle" false "warehouse/vig02")
    (sleep 60)
    (cs_run_command_script "ware_hum_201/run02" abort)
    (vs_custom_animation brute false "objects\characters\brute\cinematics\vignettes\010va_brute_intro\010va_brute_intro" "020vb_exec_kill" true "warehouse/vig02")
    (vs_custom_animation marine true "objects\characters\marine\cinematics\vignettes\010va_brute_intro\010va_brute_intro" "020vb_vict_kill" true "warehouse/vig02")
    (vs_release marine)
    (sleep 1)
    (ai_kill_silent marine)
    (sleep_until (not (unit_is_playing_custom_animation brute)) 1)
    (vs_release_all)
)

(script static void test_longsword
    (object_create "cin_longsword")
    (ai_disregard "cin_longsword" true)
    (scenery_animation_start_relative "cin_longsword" "objects\vehicles\longsword\cinematics\vignettes\040vc_crashing_longsword\040vc_crashing_longsword" "040vc_crashing_longsword" "cin_longsword_start")
)

(script dormant void vig_crashing_longsword
    (print "vignette:va_crashing_longsword")
    (object_create "cin_longsword")
    (ai_disregard "cin_longsword" true)
    (scenery_animation_start_relative "cin_longsword" "objects\vehicles\longsword\cinematics\vignettes\040vc_crashing_longsword\040vc_crashing_longsword" "040vc_crashing_longsword" "cin_longsword_start")
    (sleep 110)
    (print "boom")
    (player_effect_set_max_rotation 0.0 0.5 0.5)
    (player_effect_set_max_rumble 1.0 1.0)
    (player_effect_start 0.5 0.05)
    (sleep 20)
    (player_effect_stop 0.5)
    (sleep 50)
    (sleep 50)
    (wake br_ark_is_bad)
    (sleep 100)
    (object_destroy "cin_longsword")
    (print "boom")
    (player_effect_set_max_rotation 0.0 0.5 0.5)
    (player_effect_set_max_rumble 1.0 1.0)
    (player_effect_start 0.5 0.05)
    (sleep 20)
    (player_effect_stop 0.5)
)

(script dormant void 040pb_scarab_intro_pers
    (if 
        (and
            g_play_cinematics
            (volume_test_players "vol_lakebed_b_persp")
        ) 
            (begin
                (cs_run_command_script "lakebed_b_covenant_obj/ground_gate" pause_forever)
                (perspective_start)
                (040pb_scarab_intro)
                (perspective_stop)
                (cs_run_command_script "lakebed_b_covenant_obj/ground_gate" abort)
                (game_save_immediate)
            ) (begin
                (print "player not in perspective area")
                (cinematic_show_letterbox false)
                (sleep 30)
                (chud_cinematic_fade 1.0 1.0)
                (game_save)
            )
    )
)

(script static void cinematic_title_to_gameplay_loc
    (sleep 30)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (sleep 110)
    (cinematic_show_letterbox false)
    (sleep 15)
    (chud_cinematic_fade 1.0 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (game_save)
)

(script dormant void 040_title1
    (sleep 30)
    (cinematic_set_title "title_1")
    (cinematic_title_to_gameplay_loc)
    (player_disable_movement true)
    (wake br_int_01)
)

(script dormant void 040_title2
    (chapter_start)
    (cinematic_set_title "title_3")
    (sleep 150)
    (chapter_stop)
    (vs_scarab_intro)
)

(script dormant void 040_title2_insert
    (sleep 60)
    (cinematic_set_title "title_3")
    (cinematic_title_to_gameplay)
    (vs_scarab_intro)
)

(script dormant void cor_fab
    (sleep_until (volume_test_players "tv_cortana_01") 1)
    (sound_impulse_start "sound\levels\040_voi\sound_scenery\bfg_for_cortana" none 1.0)
    (sleep 5)
    (bfg_shake_fx)
    (set g_cortana_playing true)
    (print "cortana: i have defied gods and demons.")
    (wake 040ca_have_defied)
    (set g_cortana_playing false)
    (game_save)
)

(script dormant void cor_ware
    (sleep_until (= (current_zone_set) 7) 1)
    (sound_impulse_start "sound\levels\040_voi\sound_scenery\bfg_for_cortana" none 1.0)
    (sleep 5)
    (bfg_shake_fx)
    (print "cortana: i am your shield. i am your sword.")
    (wake 040cb_your_shield)
    (sleep (random_range 240 270))
    (wake md_office_morphine)
)

(script dormant void cor_worker
    (sleep_until (volume_test_players "tv_cortana_03") 1)
    (print "cortana: i know you. your past. your future.")
    (wake 040cc_know_you)
    (game_save)
)

(script dormant void truth_channel
    (object_create_anew "truth")
    (object_create_anew "gravity_throne")
    (object_create_anew "truth_holo_projector")
    (objects_attach "truth_holo_projector" "attach_marker" "truth" "")
    (objects_attach "truth" "driver" "gravity_throne" "driver")
    (object_hide "truth" false)
    (object_hide "gravity_throne" false)
    (sleep_until (volume_test_players "tv_truth") 30 (* 30.0 3.0))
    (truth_flicker)
    (object_hide "truth" false)
    (object_hide "gravity_throne" false)
    (unit_limit_lipsync_to_mouth_only "truth" true)
    (sleep 15)
    (if (> (object_get_health "truth_holo_projector") 0.0) 
        (begin
            (custom_animation "truth" "objects\characters\truth\cinematics\truth_holos\040_truth_a\040_truth_a.model_animation_graph" "040_truth_a" true)
            (sound_impulse_start "sound\dialog\040_voi\mission\040my_050_pot" "truth" 1.0)
            (sleep (sound_impulse_language_time "sound\dialog\040_voi\mission\040my_050_pot"))
            (sleep (* 30.0 10.0))
        )
    )
    (if (> (object_get_health "truth_holo_projector") 0.0) 
        (begin
            (custom_animation "truth" "objects\characters\truth\cinematics\truth_holos\040_truth_a\040_truth_a.model_animation_graph" "040_truth_a2" true)
            (sound_impulse_start "sound\dialog\040_voi\mission\040my_070_pot" "truth" 1.0)
            (sleep (sound_impulse_language_time "sound\dialog\040_voi\mission\040my_070_pot"))
            (sleep 45)
        )
    )
    (truth_flicker)
    (object_destroy "truth")
    (object_destroy "gravity_throne")
    (ai_set_task_condition "factory_a_covenant_obj/faa_cov_init" false)
)

(script dormant void truth_channel_worker
    (object_create_anew "truth_worker")
    (object_create_anew "gravity_throne_worker")
    (object_create_anew "truth_holo_projector_worker")
    (objects_attach "truth_holo_projector_worker" "attach_marker" "truth_worker" "")
    (objects_attach "truth_worker" "driver" "gravity_throne_worker" "driver")
    (object_hide "truth_worker" false)
    (object_hide "gravity_throne_worker" false)
    (sleep_until (volume_test_players "tv_truth_worker"))
    (truth_flicker)
    (object_hide "truth_worker" false)
    (object_hide "gravity_throne_worker" false)
    (unit_limit_lipsync_to_mouth_only "truth_worker" true)
    (sleep 15)
    (if (> (object_get_health "truth_holo_projector_worker") 0.0) 
        (begin
            (custom_animation "truth_worker" "objects\characters\truth\cinematics\truth_holos\040_truth_b\040_truth_b.model_animation_graph" "040_truth_b" true)
            (sound_impulse_start "sound\dialog\040_voi\mission\040my_020_pot" "truth_worker" 1.0)
            (sleep (sound_impulse_language_time "sound\dialog\040_voi\mission\040my_020_pot"))
            (sleep_until (<= (ai_task_count "worker_cov_obj/cov_inf") 1))
            (wake md_arb_truth_response)
        )
    )
    (if (> (object_get_health "truth_holo_projector_worker") 0.0) 
        (begin
            (custom_animation "truth_worker" "objects\characters\truth\cinematics\truth_holos\040_truth_b\040_truth_b.model_animation_graph" "040_truth_b2" true)
            (sound_impulse_start "sound\dialog\040_voi\mission\040my_030_pot" "truth_worker" 1.0)
            (sleep (sound_impulse_language_time "sound\dialog\040_voi\mission\040my_030_pot"))
            (sleep 45)
        )
    )
    (truth_flicker)
    (object_destroy "truth_worker")
    (object_destroy "gravity_throne_worker")
)

(script static void truth_flicker
    (set g_truth false)
    (set g_truth_count 0)
    (sleep_until 
        (begin
            (object_hide "truth_worker" false)
            (object_hide "gravity_throne_worker" false)
            (sound_impulse_start "sound\visual_fx\sparks_medium" none 1.0)
            (sleep (random_range 4 15))
            (object_hide "truth_worker" true)
            (object_hide "gravity_throne_worker" true)
            (set g_truth_count (+ g_truth_count 1.0))
            (if (= g_truth_limit g_truth_count) 
                (set g_truth true))
            g_truth
        ) 
    (random_range 1 10))
)

(script dormant void sc_bridge_cruiser
    (print "cruiser is awake")
    (object_create_anew "ark_cruiser_01")
    (object_create_anew "ark_cruiser_02")
    (sleep 1)
    (scenery_animation_start_loop "ark_cruiser_01" "objects\vehicles\cov_cruiser\cinematics\vignettes\030vb_excavation\030vb_excavation" "cinematic_cov_cruiser")
    (object_set_custom_animation_speed "ark_cruiser_01" 0.009)
    (object_cinematic_visibility "ark_cruiser_01" true)
    (scenery_animation_start_at_frame_loop "ark_cruiser_02" "objects\vehicles\cov_cruiser\cinematics\vignettes\030vb_excavation\030vb_excavation" "cinematic_cov_cruiser1" 10)
    (object_set_custom_animation_speed "ark_cruiser_02" 0.01)
    (object_cinematic_visibility "ark_cruiser_02" true)
)

(script dormant void gs_create_primary_skull
    (if 
        (and
            (>= (game_difficulty_get_real) normal)
            (= (game_insertion_point_get) 0)
            (or
                (= (campaign_is_finished_normal) true)
                (= (campaign_is_finished_heroic) true)
                (= (campaign_is_finished_legendary) true)
            )
        ) 
            (begin
                (sleep_until (>= (ai_task_count "lakebed_a_covenant_obj/ground_wraith_gate") 1))
                (object_create "skull_catch")
                (wake gs_award_primary_skull)
                (sleep_until (<= (ai_task_count "lakebed_a_covenant_obj/ground_wraith_gate") 0))
                (object_destroy "skull_catch")
            )
    )
)

(script dormant void gs_award_primary_skull
    (sleep_until 
        (or
            (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
            (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
            (unit_has_weapon (unit (player2)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
            (unit_has_weapon (unit (player3)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
        ) 
    5)
    (print "award catch skull")
    (campaign_metagame_award_primary_skull (player0) 3)
    (campaign_metagame_award_primary_skull (player1) 3)
    (campaign_metagame_award_primary_skull (player2) 3)
    (campaign_metagame_award_primary_skull (player3) 3)
)

(script static boolean introarriv_0_2
    (volume_test_players "vol_drive_intro_end")
)

(script static boolean introarriv_0_4
    (volume_test_players "vol_intro_go")
)

(script static boolean introguard_0_7
    (volume_test_players "vol_faa")
)

(script static boolean factotank__1_3
    (>= (device_get_position "factory_a_middle") 0.5)
)

(script static boolean factoadvan_1_5
    (>= (ai_living_count "factory_a_covenant_obj/big_fallback") 1)
)

(script static boolean factoadvan_1_6
    (<= (ai_task_count "factory_a_covenant_obj/big_fallback") 5)
)

(script static boolean factofollo_1_7
    (<= (ai_living_count "factory_a_covenant_obj") 0)
)

(script static boolean factoroom__1_8
    (<= (ai_task_count "factory_a_covenant_obj/tank_room_combat01") 2)
)

(script static boolean factofinis_1_9
    (<= (ai_living_count "factory_a_covenant_obj") 0)
)

(script static boolean factocov_a_1_10
    (<= (ai_task_count "factory_a_covenant_obj/faa_cov_init") 0)
)

(script static boolean factoentry_1_11
    (> (device_get_position "factory_a_entry02") 0.0)
)

(script static boolean factofirst_1_12
    (<= (ai_task_count "factory_a_covenant_obj/tank_room_combat01") 0)
)

(script static boolean factoleft__1_13
    (volume_test_players "vol_faa_button02")
)

(script static boolean factotank__2_3
    (>= (device_get_position "factory_a_middle") 0.5)
)

(script static boolean factofacto_2_12
    (<= (device_get_position "factory_a_entry") 0.45)
)

(script static boolean factofaa_c_2_17
    (<= (ai_combat_status "factory_a_covenant_obj/faa_cov_init") 3)
)

(script static boolean factofirst_2_20
    (<= (device_get_position "factory_a_entry02") 0.9)
)

(script static boolean factotunne_2_21
    (volume_test_players "vol_faa_upperflank")
)

(script static boolean lakebcente_3_2
    (<= (ai_living_count "lake_a_cov_center") 0)
)

(script static boolean lakebcente_3_3
    (<= (ai_living_count "lake_a_cov_center") 2)
)

(script static boolean lakebgauss_4_4
    (or
        (volume_test_players "vol_lakebed_a_high_start")
        (volume_test_players "vol_lake_a_bed")
    )
)

(script static boolean lakebcente_4_6
    (>= (ai_task_status "lakebed_a_covenant_obj/center_structure") 4)
)

(script static boolean lakebwin_g_4_9
    (>= (device_get_position "factory_b_entry_door") 1.0)
)

(script static boolean lakebend_g_4_11
    (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
)

(script static boolean lakebwin_v_4_14
    (<= (ai_task_count "lakebed_a_covenant_obj/ground_wraith_gate") 0)
)

(script static boolean lakebgauss_4_16
    (volume_test_players "vol_lake_a_bed")
)

(script static boolean lakebgauss_4_17
    (> (device_get_position "lakebed_a_entry_door") 0.9)
)

(script static boolean lakebcente_4_18
    (volume_test_players "vol_lake_a_bed")
)

(script static boolean lakebhog_b_4_19
    (and
        (any_players_in_vehicle)
        (volume_test_players "vol_lake_a_bed")
    )
)

(script static boolean lakebinf_a_4_20
    (>= (ai_task_status "lakebed_a_covenant_obj/center_flank") ai_task_status_exhausted)
)

(script static boolean lakebwin_e_4_21
    (volume_test_players "vol_lakebed_a_end")
)

(script static boolean lakebhorne_4_25
    (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
)

(script static boolean lakebhog_f_4_27
    (or
        (volume_test_players "vol_lakebed_a_high_start")
        (volume_test_players "vol_lake_a_bed")
    )
)

(script static boolean lakebhorne_4_28
    (volume_test_players "vol_lakebed_a_end")
)

(script static boolean lakebwrait_5_1
    (>= (ai_task_count "lakebed_a_allies/hornets_gate") 1)
)

(script static boolean lakebcente_5_7
    (>= (ai_living_count "lake_a_cov_end_grunts") 1)
)

(script static boolean lakebghost_5_15
    (volume_test_object "vol_lakebed_a_troop_init" (ai_vehicle_get_from_starting_location "intro_hog/driver"))
)

(script static boolean lakebghost_5_17
    (and
        (volume_test_players "vol_lake_a_bed")
        (any_players_in_vehicle)
    )
)

(script static boolean lakebpreve_5_18
    (volume_test_players "vol_drive_lakedbed_a_end")
)

(script static boolean lakebghost_5_24
    (>= (ai_task_status "lakebed_a_covenant_obj/center_structure") 4)
)

(script static boolean lakebwrait_5_25
    (any_players_in_vehicle)
)

(script static boolean lakebcente_5_27
    (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
)

(script static boolean lakebtasks_5_32
    (unleash_ground_wraith)
)

(script static boolean lakebghost_5_33
    (and
        (volume_test_players "vol_lakebed_a_bridge")
        (not (any_players_in_vehicle))
    )
)

(script static boolean lakebbansh_5_34
    (>= (ai_task_count "lakebed_a_allies/hornets_gate") 1)
)

(script static boolean factobugge_6_4
    (>= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 1)
)

(script static boolean factowave0_6_5
    (>= (device_get_position "tank_room_b_exit02") 0.5)
)

(script static boolean factotasks_6_8
    (<= (ai_task_count "factory_b_cov_obj/inf") 0)
)

(script static boolean factotasks_6_11
    (<= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 3)
)

(script static boolean factohog_a_6_12
    (> (device_get_position "factory_b_entry02") 0.0)
)

(script static boolean factobugge_7_2
    (not (volume_test_players "vol_factory_b_tunnel_end"))
)

(script static boolean factowave0_7_5
    (volume_test_players "vol_factory_b_tunnel")
)

(script static boolean factomarin_7_7
    (<= (ai_living_count "factory_b_allies_obj") 0)
)

(script static boolean factotasks_7_9
    (not (volume_test_players "vol_factory_b_center"))
)

(script static boolean factodwind_7_14
    (volume_test_players "vol_fab_entryroom")
)

(script static boolean factoplaye_7_15
    (any_players_in_vehicle)
)

(script static boolean factodoor__7_16
    (>= (device_get_position "factory_b_entry02") 1.0)
)

(script static boolean lakebdumb__8_2
    (not (volume_test_players "vol_lakebed_b_ledge"))
)

(script static boolean lakebscara_8_3
    (>= (ai_living_count "scarab") 1)
)

(script static boolean lakebscara_8_5
    g_scarab_dead
)

(script static boolean lakebcov_d_8_7
    (or
        (<= (ai_living_count "lakebed_b_covenant_obj") 0)
        (>= (ai_living_count "lakebed_b_pelicans01") 1)
    )
)

(script static boolean lakebpelic_8_9
    (>= (ai_living_count "scarab") 1)
)

(script static boolean lakebend_a_8_13
    (volume_test_players "vol_lakebed_b_end_advance")
)

(script static boolean lakebhorne_8_16
    (<= (ai_task_count "lakebed_b_covenant_obj/wraith_gate") 0)
)

(script static boolean lakebhorne_8_17
    (>= (ai_task_count "lakebed_b_covenant_obj/phantoms") 1)
)

(script static boolean lakebhorne_8_20
    (>= (ai_living_count "scarab") 1)
)

(script static boolean lakebscara_8_22
    (>= (object_buckling_magnitude_get "scarab_giant") 0.2)
)

(script static boolean lakebdumb__9_7
    (not (volume_test_players "vol_lakebed_b_ledge"))
)

(script static boolean lakebtasks_9_13
    (<= (ai_task_count "lakebed_b_covenant_obj/wraith_gate") 0)
)

(script static boolean lakebpart1_9_14
    (>= (ai_living_count "lakebed_b_pelicans01") 1)
)

(script static boolean lakebbansh_9_16
    (>= (ai_living_count "scarab") 1)
)

(script static boolean scaraleade_11_3
    (volume_test_players "vol_scarab")
)

(script static boolean scaracore__11_6
    (volume_test_players "vol_scarab_back")
)

(script static boolean officstart_12_1
    (volume_test_players "vol_office_start")
)

(script static boolean officstart_12_2
    (volume_test_players "vol_office_start02")
)

(script static boolean officstart_12_3
    (volume_test_players "vol_office_start03")
)

(script static boolean officarbit_12_8
    (volume_test_players "vol_office_start03")
)

(script static boolean ware_flank_13_1
    (volume_test_players "vol_warehouse_brute_flank")
)

(script static boolean ware_fallb_13_2
    (volume_test_players "vol_warehouse_brutes01")
)

(script static boolean ware_fallb_13_9
    (not (volume_test_players "vol_warehouse_brutes02b"))
)

(script static boolean ware_brute_13_12
    (not (volume_test_players "vol_warehouse_brutes01"))
)

(script static boolean ware_hunte_14_0
    (volume_test_players "vol_warehouse_hunters02")
)

(script static boolean ware_advan_14_3
    (>= (ai_task_status "ware_cov_obj/start") ai_task_status_exhausted)
)

(script static boolean ware_advan_14_4
    (volume_test_players "vol_warehouse_brutes02b")
)

(script static boolean ware_hunte_14_7
    (<= (ai_living_count "ware_cov_obj") 0)
)

(script static boolean ware_civ_h_14_9
    (<= (device_get_position "ware_exit_door") 0.5)
)

(script static boolean ware_civ_b_14_10
    (<= (ai_task_count "ware_cov_obj/ware_brute_gate") 0)
)

(script static boolean ware_comeb_14_11
    (volume_test_players "vol_warehouse_hunters01")
)

(script static boolean ware_comeb_14_13
    (volume_test_players "vol_warehouse_brutes02b")
)

(script static boolean ware_civ_3_14_14
    (volume_test_players "vol_warehouse_brutes02")
)

(script static boolean ware_low_i_14_15
    (not (volume_test_players "vol_warehouse_brutes01"))
)

(script static boolean ware_arbit_14_18
    (>= (ai_task_status "ware_cov_obj/start") ai_task_status_exhausted)
)

(script static boolean ware_arb_h_14_23
    (<= (ai_living_count "ware_cov_obj") 0)
)

(script static boolean workegrunt_15_1
    (volume_test_players "vol_worker_entry_side")
)

(script static boolean workefallb_15_2
    (not (volume_test_players "vol_worker_middle_start"))
)

(script static boolean workechief_15_4
    (not (>= (ai_task_status "worker_cov_obj/grunts") ai_task_status_exhausted))
)

(script static boolean workechief_15_11
    (or
        (<= (ai_strength "work_cov_chief/chief") 0.5)
        (<= (ai_task_count "worker_cov_obj/cov_inf") 3)
    )
)

(script static boolean workeadv01_16_1
    (volume_test_players "vol_worker_middle_start")
)

(script static boolean workecov_d_16_3
    (<= (ai_living_count "worker_cov_obj") 0)
)

(script static boolean workemiddl_16_4
    (volume_test_players "vol_worker_middle_start")
)

(script static boolean worketruth_16_5
    (>= (object_get_health "gravity_throne_worker") 1.0)
)

(script static boolean workecotan_16_6
    (volume_test_players "tv_cortana_03")
)

(script static boolean bfg_cgrunt_17_1
    (volume_test_players "vol_bfg_cov_left")
)

(script static boolean bfg_cgrunt_17_2
    (volume_test_players "vol_bfg_cov_right")
)

(script static boolean bfg_cphant_17_6
    (volume_test_players "vol_bfg_advance")
)

(script static boolean bfg_cbfg_d_17_8
    (<= (object_get_health "bfg_base") 0.0)
)

(script static boolean bfg_cinit_17_10
    (not (volume_test_players "vol_bfg_entry"))
)

(script static boolean bfg_cgrunt_17_15
    (volume_test_players "vol_bfg_cov_right02")
)

(script static boolean bfg_cgrunt_17_19
    (not (volume_test_players "vol_bfg_middle_hill"))
)

(script static boolean bfg_cbfg_d_17_26
    (<= (object_get_health "bfg_base") 0.3)
)

(script static boolean bfg_cbrute_17_28
    (not (volume_test_players "vol_bfg_brutes01"))
)

(script static boolean bfg_madvan_18_1
    (volume_test_players "vol_bfg_advance")
)

(script static boolean bfg_mgo_fo_18_2
    (<= (ai_task_count "bfg_cov_obj/inf_gate") 2)
)

(script static boolean bfg_msnipe_18_3
    (volume_test_players "vol_bfg_sniperstart")
)

(script static boolean bfg_msnipe_18_4
    (>= (ai_task_status "bfg_cov_obj/grunt_hill_front") ai_task_status_exhausted)
)

(script static boolean bfg_msnipe_18_5
    (>= (ai_task_status "bfg_cov_obj/grunt_hill") ai_task_status_exhausted)
)

(script static boolean bfg_mhill__18_6
    (volume_test_players "vol_bfg_middle_hill")
)

(script static boolean bfg_mshoot_18_8
    (<= (ai_living_count "bfg_cov01/chief") 0)
)

(script static boolean bfg_mdont__18_9
    (<= (object_get_health "bfg_base") 0.2)
)

(script static void ins_intro
    (print "insertion point : intro")
    (cinematic_snap_to_black)
    (print "switching zone sets...")
    (switch_zone_set "intro")
    (sleep 1)
    (set g_insertion_index 1)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
)

(script static void ins_scarab
    (print "insertion point : scarab")
    (switch_zone_set "scarab")
    (sleep 1)
    (unit_add_equipment (player0) "chief_insertion" true true)
    (unit_add_equipment (player1) "elite_insertion" true true)
    (unit_add_equipment (player2) "elite_insertion" true true)
    (unit_add_equipment (player3) "elite_insertion" true true)
    (sleep 1)
    (insertion_start)
    (set g_insertion_index 6)
    (object_create_folder "scenery_lab")
    (object_create_folder "crates_lab")
    (flock_start "lake_b_hornets")
    (flock_start "lake_b_phantoms")
    (flock_start "lake_b_bashee_excort01")
    (flock_start "lake_b_bashee_excort02")
    (sound_class_set_gain "" 1.0 0)
    (wake sc_bridge_cruiser)
    (wake objective_2_clear)
    (wake lakeb_bfg_go)
    (device_set_position_immediate "lakebed_b_entry_door" 0.0)
    (wake crane_ctrl)
    (device_set_power "lakebed_b_exit" 1.0)
    (device_set_position "lakebed_b_exit" 1.0)
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_scarab_player0")
    (object_teleport (player1) "teleport_scarab_player1")
    (object_teleport (player2) "teleport_scarab_player2")
    (object_teleport (player3) "teleport_scarab_player3")
    (sleep 1)
    (player_disable_movement false)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player0_set_pitch 5.0 0)
    (player1_set_pitch 5.0 0)
    (player2_set_pitch 5.0 0)
    (player3_set_pitch 5.0 0)
    (ai_place "lake_b_def_turrets")
    (ai_place "test_lake_b_allies")
    (wake lake_b_hornet_control)
    (wake 040_title2_insert)
    (wake music_040_07)
    (set g_music_040_07 true)
    (sleep 45)
    (fade_in 0.0 0.0 0.0 15)
)

(script command_script void abort
    (cs_pause 0.1)
)

(script command_script void pause_forever
    (sleep_forever)
)

(script command_script void moving_looking_cs
    (cs_enable_moving true)
    (cs_enable_looking true)
    (sleep_forever)
)

(script static void screen_shake_small_impact
    (player_effect_set_max_rotation 0.0 1.0 1.0)
    (player_effect_start (real_random_range 0.2 0.3) 0.0)
    (sleep (random_range 20 40))
    (player_effect_stop 0.0)
)

(script static void call_game_save
    (game_save)
)

(script dormant void intro_tumble_tire
    (if (= (random_range 0 3) 0) 
        (begin
            (sleep_until (volume_test_players "vol_intro_flyby") 5)
            (object_create "intro_tire")
            (object_set_velocity "intro_tire" 4.8 0.0 0.0)
        )
    )
)

(script dormant void intro_flyby
    (sleep_until (volume_test_players "vol_intro_flyby") 5)
    (print "flyby go!")
    (ai_place "intro_cov_ships")
    (ai_disregard (ai_actors "intro_cov_ships") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "intro_cov_ships/phantom01") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "intro_cov_ships/phantom02") true)
    (sleep 1)
    (cs_run_command_script "intro_cov_ships" cov_flyby_banshee)
    (sleep 1)
    (cs_run_command_script "intro_cov_ships/phantom01" cov_flyby_wraith)
    (cs_run_command_script "intro_cov_ships/phantom02" cov_flyby_wraith)
    (flock_create "intro_banshees")
    (flock_create "intro_hornets")
)

(script command_script void cov_flyby_wraith
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (begin_random
        (cs_vehicle_speed_instantaneous 2.8)
        (cs_vehicle_speed_instantaneous 3.0)
        (cs_vehicle_speed_instantaneous 3.4)
        (cs_vehicle_speed_instantaneous 4.0)
    )
    (cs_vehicle_boost false)
    (cs_fly_by "intro_pts/cov02" 8.0)
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script command_script void cov_flyby_banshee
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_vehicle_boost true)
    (cs_fly_to "intro_pts/cov01")
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script command_script void intro_hog_drive_02
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_vehicle_speed 0.7)
    (sleep_until (volume_test_objects "vol_drive_intro_end" (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01")))
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving false)
    (cs_enable_looking false)
    (cs_abort_on_damage true)
    (cs_vehicle_speed 0.7)
    (cs_go_to "intro_pts/troop01")
    (ai_vehicle_reserve (ai_vehicle_get ai_current_actor) true)
    (vehicle_unload (ai_vehicle_get ai_current_actor) none)
    (ai_migrate "intro_troop_hogs02" "init_allies")
    (if (= (game_is_cooperative) true) 
        (wake intro_move_hud))
)

(script command_script void intro_hog_drive_03
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_vehicle_speed 0.7)
    (sleep_until (volume_test_objects "vol_drive_intro_end" (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01")))
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving false)
    (cs_enable_looking false)
    (cs_abort_on_damage true)
    (cs_vehicle_speed 0.7)
    (cs_go_to "intro_pts/troop02")
    (ai_vehicle_reserve (ai_vehicle_get ai_current_actor) true)
    (vehicle_unload (ai_vehicle_get ai_current_actor) none)
    (ai_migrate "intro_troop_hogs" "init_allies_brass")
    (if (= (game_is_cooperative) true) 
        (wake intro_move_hud))
)

(script dormant void intro_hog_unload
    (vehicle_unload (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") none)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") true)
    (sleep (random_range 10 40))
    (vehicle_unload (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") none)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") true)
)

(script dormant void intro_move_hud
    (player_disable_movement false)
    (wake objective_1_set)
    (chud_cinematic_fade 1.0 0.5)
)

(script dormant void intro
    (data_mine_set_mission_segment "040_10_intro")
    (player_disable_movement true)
    (wake sc_bridge_cruiser)
    (wake gauss_nav_intro)
    (set wave 1)
    (wake gs_cinematic_lights)
    (if (= (game_coop_player_count) 4) 
        (begin
            (print "4 player coop")
            (ai_place "intro_hog")
            (ai_place "intro_troop_hogs")
            (ai_place "intro_troop_hogs02")
            (ai_place "init_allies_brass")
            (ai_place "init_allies" 3)
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_p (player0))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p (player1))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p (player2))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_g (player3))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p_b (ai_get_object "init_allies_brass/sgt"))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p_r (ai_get_object "init_allies_brass/female"))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p_b (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
        )
    )
    (if (= (game_coop_player_count) 3) 
        (begin
            (print "3 player coop")
            (ai_place "intro_hog")
            (ai_place "intro_troop_hogs")
            (ai_place "intro_troop_hogs02")
            (ai_place "init_allies_brass")
            (ai_place "init_allies" 4)
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_p (player0))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p (player1))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p (player2))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p_b (ai_get_object "init_allies_brass/sgt"))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p_r (ai_get_object "init_allies_brass/female"))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_g (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
        )
    )
    (if (= (game_coop_player_count) 2) 
        (begin
            (print "2 player coop")
            (ai_place "intro_hog")
            (ai_place "intro_troop_hogs")
            (ai_place "intro_troop_hogs02")
            (ai_place "init_allies_brass")
            (ai_place "init_allies" 5)
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_p (player0))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p (player1))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p_b (ai_get_object "init_allies_brass/sgt"))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p (ai_get_object "init_allies_brass/female"))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_g (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p_r (list_get (ai_actors "init_allies") 0))
        )
    )
    (if (= (game_is_cooperative) false) 
        (begin
            (ai_place "intro_hog")
            (ai_place "intro_troop_hogs")
            (ai_place "intro_troop_hogs02")
            (ai_place "init_allies_brass")
            (ai_place "init_allies" 6)
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_p (player0))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p (ai_get_object "init_allies_brass/sgt"))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p (ai_get_object "init_allies_brass/female"))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_g (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_d (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs02/driver01") warthog_p_r (list_get (ai_actors "init_allies") 0))
            (sleep 1)
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_troop_hogs/driver01") warthog_p_b (list_get (ai_actors "init_allies") 0))
        )
    )
    (cs_run_command_script (ai_get_driver "intro_hog/driver") hog_speed)
    (cs_run_command_script (ai_get_driver "intro_troop_hogs/driver01") intro_hog_drive_02)
    (cs_run_command_script (ai_get_driver "intro_troop_hogs02/driver01") intro_hog_drive_03)
    (sleep 60)
    (sound_class_set_gain "" 1.0 60)
    (camera_control false)
    (sleep 30)
    (wake music_040_01)
    (set g_music_040_01 true)
    (player_camera_control true)
    (cinematic_fade_to_title)
    (wake 040_title1)
    (wake intro_tumble_tire)
    (sleep_until (not (any_players_in_vehicle)))
    (wake intro_hog_unload)
    (wake intro_nav_exit)
    (game_save)
    (sleep_until (= (current_zone_set_fully_active) 1) 5)
    (game_save)
)

(script dormant void intro_cleanup
    (sleep_until (volume_test_players "vol_tank_room_a_exit"))
    (sleep_forever intro)
    (sleep_forever intro_flyby)
    (sleep_forever gauss_nav_intro)
    (flock_delete "intro_banshees")
    (flock_delete "intro_hornets")
)

(script dormant void factory_a_door_in
    (sleep_until (>= (device_get_power "factory_a_entry02") 1.0))
    (device_set_power "factory_a_entry02_switch" 0.0)
    (device_set_power "factory_a_entry02_switch02" 0.0)
    (game_save)
)

(script dormant void button_pusher01
    (sleep_until (<= (ai_task_count "factory_a_covenant_obj/factory_a_button_guard02") 2))
    (sleep 60)
    (if (>= (device_get_power "factory_a_entry02_switch") 1.0) 
        (begin
            (vs_cast "factory_a_allies_obj/tank_room_a_gate" true 2 "")
            (vs_enable_pathfinding_failsafe (vs_role 1) true)
            (vs_abort_on_damage true)
            (vs_go_to (vs_role 1) true "factory_arm_a/buttonpush01b")
            (vs_enable_moving (vs_role 1) false)
            (vs_go_to (vs_role 1) true "factory_arm_a/buttonpush01c")
            (sleep_until (<= (ai_task_count "factory_a_covenant_obj/factory_a_button_guard02") 0))
            (vs_go_to (vs_role 1) true "factory_arm_a/buttonpush01")
            (device_set_power "factory_a_entry02" 1.0)
            (vs_release_all)
        )
    )
)

(script dormant void button_pusher02
    (sleep_until 
        (or
            (any_players_in_vehicle)
            (volume_test_players "vol_faa_button02")
            (>= (device_group_get "factory_a_middle_buttons") 1.0)
        )
    )
    (if (<= (device_group_get "factory_a_middle_buttons") 0.0) 
        (begin
            (print "looking for button pusher")
            (vs_cast "factory_a_allies_obj/left_behind" true 2 "")
            (vs_enable_pathfinding_failsafe "intro_troop_hogs" true)
            (vs_abort_on_damage true)
            (print "i'll get the door, chief")
            (vs_go_to (vs_role 1) true "factory_arm_a/buttonpush02")
            (device_set_position "factory_a_middle_switch02" 1.0)
            (vs_release_all)
        )
    )
)

(script dormant void button_pusher03
    (sleep_until 
        (or
            (any_players_in_vehicle)
            false
        )
    )
    (if (<= (device_get_position "lakebed_a_entry_door") 0.0) 
        (begin
            (vs_cast (object_get_ai (list_get (ai_actors "intro_troop_hogs") 0)) true 2 "")
            (vs_enable_pathfinding_failsafe "intro_troop_hogs" true)
            (vs_enable_moving "intro_troop_hogs" true)
            (vs_go_to (vs_role 1) true "factory_arm_a/buttonpush03")
            (device_set_position "lakebed_a_entry_switch" 1.0)
            (vs_release_all)
        )
    )
)

(script dormant void factory_a_door_middle
    (sleep_until 
        (or
            (> (device_get_position "factory_a_middle_switch") 0.0)
            (> (device_get_position "factory_a_middle_switch02") 0.0)
        )
    )
    (device_set_position "factory_a_entry02_switch" 1.0)
    (ai_set_task_condition "factory_a_covenant_obj/faa_cov_init" false)
    (ai_magically_see "factory_a_covenant_obj" "factory_a_allies_obj")
)

(script dormant void gauss_ram_fix
    (sleep_until (volume_test_object "vol_factory_a_room02_entry" (ai_vehicle_get_from_starting_location "intro_hog/driver")))
    (print "guass rammed")
    (sleep_until (<= (device_get_position "factory_a_entry02") 0.0))
    (device_group_set_immediate "tank_room_a_entry_buttons" 1.0)
    (device_operates_automatically_set "factory_a_entry02" true)
    (device_set_power "factory_a_entry02_switch" 0.0)
    (device_set_power "factory_a_entry02_switch02" 0.0)
)

(script dormant void faa_ghosts
    (ai_place "tank_a_cov_ghosts")
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "tank_a_cov_ghosts/driver01") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "tank_a_cov_ghosts/driver02") true)
    (sleep_until (<= (ai_living_count "factory_a_covenant_obj") 5))
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "tank_a_cov_ghosts/driver01") false)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "tank_a_cov_ghosts/driver02") false)
    (ai_enter_squad_vehicles "all_enemies")
)

(script static void scare_grunts
    (wake md_faa_cov_flee)
    (sleep_until (volume_test_players "vol_faa"))
    (cs_run_command_script "factory_a_jackals01" alert_jacks_cs)
    (wake factory_a_door_in)
)

(script dormant void faa_intro_jackals
    (sleep 90)
    (ai_place "factory_a_jackals03")
    (cs_run_command_script "factory_a_jackals03" scare_jackals_cs)
)

(script command_script void scare_jackals_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_abort_on_damage true)
    (cs_ignore_obstacles true)
    (cs_go_to "factory_arm_a/jackal01a")
    (cs_go_to "factory_arm_a/jackal01b")
)

(script command_script void scare_grunts_cs
    (sleep 90)
)

(script command_script void alert_jacks_cs
    (cs_force_combat_status ai_combat_status_alert)
)

(script command_script void faa_fallback_cs
    (cs_abort_on_damage true)
    (cs_go_to "factory_arm_a/fallback01")
)

(script dormant void faa_entry_door_closer
    (sleep (* 30.0 11.0))
    (print "hog in?")
    (sleep_until (volume_test_players "vol_tank_room_a_exit"))
    (device_group_change_only_once_more_set "faa_entry_buttons" false)
    (device_set_position "factory_a_entry" 0.0)
    (sleep_until (<= (device_get_position "factory_a_entry") 0.0) 5)
    (zone_set_trigger_volume_enable "begin_zone_set:faa_lakea" true)
    (faa_coop_teleport)
    (sleep_until (= (current_zone_set_fully_active) -1) 5)
    (sleep (* 30.0 10.0))
    (zone_set_trigger_volume_enable "zone_set:faa_lakea" true)
    (device_set_power "lakebed_a_entry_switch" 1.0)
    (ai_disposable "intro_tunnel_obj" true)
)

(script dormant void faa_objective_control
    (ai_set_objective "init_allies" "factory_a_allies_obj")
    (ai_set_objective "allied_vehicles" "factory_a_allies_obj")
    (sleep_until 
        (or
            (<= (ai_living_count "init_allies") 1)
            (< (device_get_position "factory_a_entry") 1.0)
        )
    )
    (if (<= (ai_living_count "init_allies") 1) 
        (ai_set_objective "init_allies_brass" "factory_a_allies_obj"))
)

(script static void faa_coop_teleport
    (print "teleport backup")
    (if (volume_test_object "vol_faa_coop_teleport" (player0)) 
        (object_teleport (player0) "faa_coop_teleport_player0"))
    (if (volume_test_object "vol_faa_coop_teleport" (player1)) 
        (object_teleport (player1) "faa_coop_teleport_player1"))
    (if (volume_test_object "vol_faa_coop_teleport" (player2)) 
        (object_teleport (player2) "faa_coop_teleport_player2"))
    (if (volume_test_object "vol_faa_coop_teleport" (player3)) 
        (object_teleport (player3) "faa_coop_teleport_player3"))
)

(script dormant void faa_quiet
    (ai_dialogue_enable false)
    (sleep_until (>= (ai_combat_status "factory_a_covenant_obj") 4))
    (print "enabling marine comabat dialog")
    (ai_dialogue_enable true)
)

(script dormant void faa_saves
    (sleep_until 
        (and
            (<= (ai_living_count "factory_a_init_grunts01") 0)
            (<= (ai_living_count "factory_a_init_grunts02") 0)
            (<= (ai_living_count "factory_a_jackals01") 0)
            (<= (ai_living_count "factory_a_jackals02") 0)
        )
    )
    (game_save)
)

(script dormant void factory_a_start
    (sleep_until (volume_test_players "vol_tank_room_a_start") 5)
    (wake faa_quiet)
    (set wave 2)
    (sleep_until (> (device_get_position "factory_a_entry") 0.0) 5)
    (data_mine_set_mission_segment "040_20_factory_a")
    (set g_music_040_01 false)
    (wake music_040_02)
    (set g_music_040_02 true)
    (wake intro_cleanup)
    (wake gauss_nav_factory_a)
    (wake truth_channel)
    (ai_place "factory_a_init_grunts01")
    (ai_place "factory_a_init_grunts02")
    (ai_place "factory_a_jackals01")
    (ai_place "factory_a_jackals02")
    (sleep_until 
        (or
            (volume_test_players "vol_faa")
            (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "warthog_g" (players))
        )
    )
    (wake faa_saves)
    (wake faa_entry_door_closer)
    (wake factory_a_door_middle)
    (wake button_pusher01)
    (sleep_until (volume_test_players "vol_faa"))
    (wake faa_objective_control)
    (wake md_faa_door_hint_01a)
    (sleep_until 
        (or
            (volume_test_players "vol_tank_room_a_exit")
            (<= (ai_task_count "factory_a_covenant_obj/tank_room_combat01") 1)
        )
    )
    (ai_place "tank_room_a_rein_front")
    (ai_place "tank_room_a_commander")
    (ai_place "tank_room_a_commander02")
    (ai_place "tank_room_a_com_jacks")
    (if (not (difficulty_legendary)) 
        (wake button_pusher02))
    (data_mine_set_mission_segment "040_21_factory_a02")
    (wake faa_ghosts)
    (wake faa_nav_exit)
    (sleep_until (<= (ai_living_count "all_enemies") 0))
    (sleep_until (= (current_zone_set_fully_active) 2))
    (wake button_pusher03)
    (game_save)
)

(script dormant void factory_a_cleanup
    (sleep_until (volume_test_players "vol_factory_b_start"))
    (sleep_forever factory_a_start)
    (sleep_forever factory_a_door_in)
    (sleep_forever factory_a_door_middle)
    (sleep_forever faa_ghosts)
    (sleep_forever button_pusher01)
    (sleep_forever button_pusher02)
    (sleep_forever button_pusher03)
    (sleep_forever faa_saves)
    (device_set_power "factory_a_entry02" 1.0)
    (device_set_power "factory_a_entry02_switch" 0.0)
    (device_set_position "factory_a_middle" 1.0)
    (device_one_sided_set "factory_a_entry" true)
)

(script static void factory_a_garbage
    (add_recycling_volume "factory_a_garbage" 0 0)
)

(script command_script void marine_waste
    (cs_enable_looking true)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (sleep (random_range 30 150))
            (cs_shoot_point true "lakebed_a_targets/waste01")
            (<= (ai_living_count "lakebed_a_allies/inf_init") 0)
        )
    )
)

(script static boolean unleash_ground_wraith
    (or
        (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
        (volume_test_players "vol_lakebed_a_end")
        (and
            (>= (ai_task_status "lakebed_a_covenant_obj/center_structure") ai_task_status_exhausted)
            (<= (ai_task_count "lakebed_a_covenant_obj/ghosts_gate") 2)
        )
    )
)

(script command_script void lakebed_a_wraiths_cheapshot
    (sleep (random_range 0 60))
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_enable_moving true)
    (sleep (random_range 90 200))
    (cs_run_command_script ai_current_actor lakebed_a_wraiths_shoot)
)

(script command_script void lakebed_a_ground_wraiths_shoot
    (cs_run_command_script "lake_a_cov_end_wraith/gunner01" abort)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_a_targets/gw01")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_a_targets/gw02")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_a_targets/gw03")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_a_targets/gw04")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_a_targets/gw05")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_a_targets/gw06")
                )
            )
            false
        )
    )
)

(script dormant void lakebed_a_wraith_magic
    (sleep_until 
        (begin
            (ai_magically_see "lakebed_a_wraith_01" "lake_a_hornets")
            (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
        ) 
    100)
)

(script command_script void lakebed_a_wraiths_shoot
    (cs_run_command_script "lakebed_a_wraith_01/gunner01" abort)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_a_targets/p0")
                )
                (begin
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_a_targets/p1")
                )
                (begin
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_a_targets/p2")
                )
                (begin
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_a_targets/p3")
                )
            )
            (>= (ai_task_count "lakebed_a_allies/hornets_gate") 1)
        )
    )
    (print "wraith breaking command script")
)

(script command_script void center_def_run
    (cs_run_command_script "lake_a_def_center/rocket_man" rocket_man)
    (cs_enable_pathfinding_failsafe true)
    (cs_force_combat_status ai_combat_status_active)
    (sleep 1)
    (cs_go_to "lakebed_a/p3")
)

(script command_script void rocket_man
    (cs_aim_object true "lakebed_a_init_phantoms/driver01")
    (sleep 100)
    (cs_shoot true "lakebed_a_init_phantoms/driver01")
    (sleep 10)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until (<= (ai_task_count "lakebed_a_covenant_obj/center_structure") 0))
    (cs_enable_targeting false)
    (sleep_forever)
)

(script dormant void center_allies
    (ai_place "lake_a_def_center")
    (wake lake_a_rocket_drop)
    (sleep_until 
        (begin
            (ai_renew "lake_a_def_center/01")
            (ai_renew "lake_a_def_center/02")
            (ai_renew "lake_a_def_center/03")
            (ai_renew "lake_a_def_center/04")
            (sleep 10)
            (or
                (volume_test_players "vol_lakebed_a_bridge")
                (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
                (<= (ai_strength "lakebed_a_covenant_obj/center_gate") 0.6)
            )
        )
    )
    (print "def is on its own!")
)

(script dormant void lake_a_rocket_drop
    (sleep_until (<= (ai_living_count "lake_a_def_center/rocket_man") 0))
    (unit_kill (ai_vehicle_get_from_starting_location "lake_a_def_center/rocket_man"))
)

(script dormant void lake_a_center_saves
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (volume_test_players_all "vol_lake_a_center_saves")
                    (game_safe_to_save)
                )
            )
            (game_save)
            (sleep (* 30.0 90.0))
            false
        )
    )
)

(script static void lake_a_center_cap
    (sleep_until (<= (ai_task_count "lakebed_a_covenant_obj/center_structure") 0))
    (data_mine_set_mission_segment "040_31_lakebed_a02")
    (wake lake_a_center_saves)
    (print "putting all allies into allies obj & looking for rocket man")
    (ai_set_objective "lakebed_a_def" "lakebed_a_allies")
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lake_a_def_troop_hog/driver") false)
    (sleep 10)
    (set testnum 0)
    (if 
        (and
            (not (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "" (list_get (ai_actors "lakebed_a_allies") 0)))
            (volume_test_object "vol_lakebed_a_bridge" (list_get (ai_actors "lakebed_a_allies") 0))
        ) 
            (cs_run_command_script (object_get_ai (list_get (ai_actors "lakebed_a_allies") 0)) center_capture) (begin
                (sleep_until 
                    (begin
                        (set testnum (+ testnum 1.0))
                        (if (>= testnum 15) 
                            (set testnum 0))
                        (and
                            (not (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "" (list_get (ai_actors "lakebed_a_allies") testnum)))
                            (volume_test_object "vol_lakebed_a_bridge" (list_get (ai_actors "lakebed_a_allies") testnum))
                        )
                    )
                )
                (cs_run_command_script (object_get_ai (list_get (ai_actors "lakebed_a_allies") testnum)) center_capture)
            )
    )
    (sleep 1)
    (set testnum 0)
)

(script command_script void center_capture
    (print "revenge of the rocket man!")
    (cs_enable_pathfinding_failsafe true)
    (sleep 1)
    (if (volume_test_object "vol_lake_a_rl" "lake_a_rl") 
        (cs_go_to "lakebed_a/rocket_man"))
    (if (volume_test_object "vol_lake_a_rl" "lake_a_rl") 
        (begin
            (cs_crouch true)
            (sleep 20)
            (object_destroy "lake_a_rl")
            (unit_add_equipment ai_current_actor "rocket_man" true true)
            (sleep 20)
            (cs_crouch false)
        )
    )
)

(script command_script void phantom_init_drop01
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "lakebed_a/phantom01a")
    (unit_set_maximum_vitality "lake_a_def_center/rocket_man" 10.0 0.0)
    (unit_set_current_vitality "lake_a_def_center/rocket_man" 10.0 0.0)
    (sleep 60)
    (cs_fly_to "lakebed_a/phantom01c" 1.0)
    (sleep 30)
    (ai_trickle_via_phantom "lakebed_a_init_phantoms/driver01" "lake_a_cov_center")
    (ai_trickle_via_phantom "lakebed_a_init_phantoms/driver01" "lake_a_cov_center_grunts")
    (sleep_until 
        (or
            (<= (ai_living_count "lake_a_def_center/rocket_man") 0)
            (volume_test_players "vol_lakebed_a_bridge")
        ) 
    30 (* 30.0 6.0))
    (sleep (random_range 0 60))
    (cs_run_command_script ai_current_actor lakea_phantom_exit)
)

(script command_script void phantom_prevent
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_enable_moving true)
    (sleep_until (not (volume_test_players "vol_lakebed_a_end")))
    (sleep 1000)
    (cs_run_command_script ai_current_actor lakea_phantom_exit)
)

(script command_script void phantom_drop_rein_ghosts
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "lakebed_a/phantom_guide01" 8.0)
    (cs_vehicle_boost true)
    (cs_fly_by "lakebed_a/phantom_guide02" 8.0)
    (cs_vehicle_boost false)
    (cs_fly_to "lakebed_a/phantom02a" 1.0)
    (sleep 30)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc01)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc02)
    (cs_run_command_script ai_current_actor lakea_phantom_exit)
    (sleep 90)
    (print "killing surfers")
    (lake_a_surfer_kill)
)

(script command_script void lake_a_wraith_drop_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "lakebed_a/phantom_guide01" 8.0)
    (cs_vehicle_boost true)
    (cs_fly_by "lakebed_a/phantom_guide02" 8.0)
    (cs_vehicle_boost false)
    (cs_fly_to "lakebed_a/phantom_end" 1.0)
    (sleep 30)
    (vehicle_unload (ai_vehicle_get_from_starting_location "lakebed_a_end_phantom/driver") phantom_lc)
    (if (not (>= (ai_task_status "lakebed_a_covenant_obj/center_structure") ai_task_status_exhausted)) 
        (cs_run_command_script "lake_a_cov_end_wraith" lakebed_a_ground_wraiths_shoot) (cs_run_command_script "lake_a_cov_end_wraith" abort))
    (sleep 60)
    (cs_fly_to "lakebed_a/phantom_end02")
    (cs_run_command_script ai_current_actor lakea_phantom_exit)
    (sleep 90)
    (print "killing surfers")
    (lake_a_surfer_kill)
)

(script dormant void lake_a_wraith_drop
    (sleep_until 
        (or
            (volume_test_players "vol_lake_a_bed")
            (volume_test_players "vol_lake_a_topback")
        )
    )
    (sleep_until (<= (ai_task_count "lakebed_a_covenant_obj/phantoms") 0))
    (ai_place "lakebed_a_end_phantom")
    (ai_place "lake_a_cov_end_wraith")
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_a_end_phantom/driver") phantom_lc (ai_vehicle_get_from_starting_location "lake_a_cov_end_wraith/driver01"))
    (cs_run_command_script "lakebed_a_end_phantom/driver" lake_a_wraith_drop_cs)
    (sleep 30)
    (cs_run_command_script "lake_a_cov_end_wraith" pause_forever)
)

(script command_script void lakea_phantom_exit
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "lakebed_a/phantom_guide_high")
    (lake_a_surfer_kill)
    (cs_fly_to "lakebed_a/phantom_exit_high")
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script static void lake_a_surfer_kill
    (print "killing surfers")
    (if (volume_test_object "vol_lake_a_surf" (player0)) 
        (unit_kill (player0)))
    (if (volume_test_object "vol_lake_a_surf" (player1)) 
        (unit_kill (player1)))
    (if (volume_test_object "vol_lake_a_surf" (player2)) 
        (unit_kill (player2)))
    (if (volume_test_object "vol_lake_a_surf" (player3)) 
        (unit_kill (player3)))
)

(script dormant void lake_a_big_door_closer
    (sleep_until (volume_test_players "vol_lake_a_doorcheck"))
    (device_group_change_only_once_more_set "factory_a_middle_buttons" false)
    (device_set_position "factory_a_middle02" 0.0)
)

(script dormant void lake_a_ghost_rein
    (sleep_until (>= (ai_living_count "lake_a_cov_end_wraith") 1))
    (sleep_until (<= (ai_task_count "lakebed_a_covenant_obj/phantoms") 0))
    (sleep_until 
        (or
            false
            (<= (ai_task_count "lakebed_a_covenant_obj/ghosts_gate") 2)
        )
    )
    (if (>= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 1) 
        (begin
            (print "rein ghosts")
            (sleep (random_range 20 60))
            (ai_place "lakebed_a_ghosts02_phantom")
            (ai_place "lakebed_a_rein_ghosts")
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_a_ghosts02_phantom/driver01") phantom_sc01 (ai_vehicle_get_from_starting_location "lakebed_a_rein_ghosts/driver01"))
            (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_a_ghosts02_phantom/driver01") phantom_sc02 (ai_vehicle_get_from_starting_location "lakebed_a_rein_ghosts/driver02"))
            (cs_run_command_script "lakebed_a_ghosts02_phantom/driver01" phantom_drop_rein_ghosts)
        )
    )
)

(script dormant void lake_a_banshee_control
    (ai_place "lake_a_banshees01")
    (ai_set_targeting_group "lake_a_banshees01" 1)
    (cs_run_command_script "lake_a_banshees01" lake_a_banshees_entry_cs)
    (sleep_until 
        (begin
            (if (<= (ai_living_count "lake_a_banshees01") 0) 
                (begin
                    (ai_place "lake_a_banshees01")
                    (ai_set_targeting_group "lake_a_banshees01" 1)
                    (cs_run_command_script "lake_a_banshees01" lake_a_banshees_entry_cs)
                )
            )
            (sleep 90)
            (or
                (<= (ai_living_count "lake_a_hornets") 0)
                (<= (ai_living_count "lake_a_cov_end_wraith") 0)
            )
        )
    )
)

(script command_script void lake_a_banshees_entry_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (sleep (random_range 120 150))
)

(script command_script void lake_a_banshees_exit_cs
    (sleep (random_range 30 110))
    (cs_fly_to "lakebed_a/banshee01")
    (cs_vehicle_boost true)
    (cs_enable_moving false)
    (cs_enable_looking false)
    (cs_fly_to "lakebed_a/banshee02")
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script dormant void lake_a_hornets
    (ai_place "lake_a_hornets")
    (ai_set_targeting_group "lake_a_hornets" 1)
    (sleep_until 
        (begin
            (if (<= (ai_living_count "lake_a_hornets") 0) 
                (ai_place "lake_a_hornets"))
            (ai_set_targeting_group "lake_a_hornets" 1)
            (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0)
        ) 
    500)
    (ai_set_targeting_group "lake_a_hornets" -1)
)

(script command_script void lake_a_hornet_init_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (sleep 90)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_a_targets/hornet01a")
                )
                (begin
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_a_targets/hornet01b")
                )
                (begin
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_a_targets/hornet01c")
                )
            )
            false
        )
    )
)

(script dormant void lake_a_saves01
    (sleep_until (<= (ai_task_count "lakebed_a_covenant_obj/ground_wraith_gate") 0))
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (volume_test_players "vol_lake_a_saves01")
                    (game_safe_to_save)
                )
            )
            (game_save)
            (sleep (* 30.0 90.0))
            false
        )
    )
)

(script dormant void lakebed_a_start
    (flock_create "lake_a_banshees")
    (flock_create "lake_a_hornets")
    (flock_create "lake_a_phantoms")
    (flock_create "lake_a_bashee_excort01")
    (flock_create "lake_a_bashee_excort02")
    (flock_create "lake_a_banshees_ark")
    (sleep_until (volume_test_players "vol_lakebed_a_start") 5)
    (print "lakebed a start")
    (wake factory_a_cleanup)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "tank_a_cov_ghosts/driver01") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "tank_a_cov_ghosts/driver02") true)
    (wake gs_create_primary_skull)
    (sleep_until (> (device_get_position "lakebed_a_entry_door") 0.0) 1)
    (data_mine_set_mission_segment "040_30_lakebed_a")
    (zone_set_trigger_volume_enable "begin_zone_set:faa_lakea" false)
    (zone_set_trigger_volume_enable "zone_set:faa_lakea" false)
    (prepare_to_switch_to_zone_set "faa_lakea_fab")
    (ai_place "lakebed_a_wraith_01")
    (ai_set_targeting_group "lakebed_a_wraith_01/driver01" 1)
    (wake lakebed_a_wraith_magic)
    (sleep 1)
    (ai_place "lakebed_a_init_chopper01")
    (sleep 1)
    (ai_place "lakebed_a_init_chopper02")
    (sleep 1)
    (wake lake_a_hornets)
    (wake md_lake_a_radio_sitrep)
    (game_save)
    (wake center_allies)
    (print "allies updating objs")
    (ai_set_objective "allied_infantry" "lakebed_a_allies")
    (ai_set_objective "allied_vehicles" "lakebed_a_allies")
    (wake lake_a_big_door_closer)
    (ai_disposable "intro_tunnel_obj" true)
    (ai_disposable "factory_a_covenant_obj" true)
    (ai_place "lake_a_cov_center02")
    (sleep 1)
    (ai_place "lakebed_a_init_phantoms")
    (cs_run_command_script "lakebed_a_init_phantoms/driver01" phantom_init_drop01)
    (sleep 1)
    (cs_run_command_script "lake_a_def_center/rocket_man" rocket_man)
    (object_set_persistent (ai_vehicle_get_from_starting_location "lakebed_a_wraith_01/driver01") true)
    (wake lake_a_ghost_rein)
    (wake lake_a_wraith_drop)
    (sleep_until (<= (ai_task_count "lakebed_a_covenant_obj/wraith_gate") 0))
    (if 
        (or
            (difficulty_heroic)
            (difficulty_legendary)
        ) 
            (begin
                (flock_stop "lake_a_banshees")
                (ai_place "lake_a_banshees01")
                (cs_run_command_script "lake_a_banshees01" lake_a_banshees_entry_cs)
            )
    )
    (factory_a_garbage)
    (sound_looping_set_alternate "levels\solo\040_voi\music\040_music_03" true)
    (wake objective_1_clear)
    (wake md_laa_wraith_dead)
    (sleep_until (not (volume_test_players "vol_lakebed_a_platform")))
    (device_set_position "lakebed_a_entry_door" 0.0)
    (sleep 90)
    (game_save)
    (sleep_until 
        (and
            (<= (ai_living_count "lakebed_a_covenant_obj") 10)
            (<= (ai_task_count "lakebed_a_covenant_obj/ghosts_gate") 2)
        )
    )
    (switch_zone_set "faa_lakea_fab")
    (sleep 20)
    (game_save)
    (ai_place "lake_a_cov_end_grunts")
    (if (<= (ai_task_count "lakebed_a_covenant_obj/ground_wraith_gate") 0) 
        (ai_place "lake_a_cov_end"))
    (print "fab door opening")
    (device_set_position "factory_b_entry_door" 1.0)
    (wake laa_nav_exit)
    (wake lake_a_saves01)
)

(script dormant void lakebed_a_cleanup
    (sleep_forever lakebed_a_start)
    (sleep_forever gauss_nav_factory_a)
    (sleep_forever lake_a_banshee_control)
    (sleep_forever lake_a_center_saves)
    (sleep_forever lake_a_saves01)
    (flock_delete "lake_a_banshees")
    (flock_delete "lake_a_hornets")
    (flock_delete "lake_a_phantoms")
    (flock_delete "lake_a_bashee_excort01")
    (flock_delete "lake_a_bashee_excort02")
    (flock_delete "lake_a_banshees_ark")
    (object_set_persistent (ai_vehicle_get_from_starting_location "lakebed_a_wraith_01/driver01") false)
    (ai_disposable "lake_a_hornets" true)
    (ai_disposable "lake_a_banshees01" true)
    (sleep 30)
    (kill_volume_enable "kill_all_lakebed_a")
    (sleep 30)
    (lakebed_a_garbage)
    (kill_volume_disable "kill_all_lakebed_a")
)

(script static void lakebed_a_garbage
    (add_recycling_volume "lakebed_a_garbage" 0 0)
)

(script dormant void fab_ai_setup
    (ai_magically_see "factory_b_cov_init" "factory_b_turrets")
    (sleep_until 
        (begin
            (ai_renew "factory_b_cov_init")
            (ai_renew "factory_b_allies01")
            (ai_renew "factory_b_turrets")
            false
        )
    )
)

(script command_script void fab_turret_shoot_cs
    (sleep_until 
        (begin
            (cs_shoot_point true "factory_b/turret_shoot01")
            (sleep (random_range 0 200))
            (cs_shoot_point true "factory_b/turret_shoot02")
            (sleep (random_range 0 120))
            (cs_shoot_point true "factory_b/turret_shoot03")
            (sleep (random_range 0 120))
            false
        )
    )
)

(script dormant void fab_objectives
    (sleep_until 
        (or
            (volume_test_players "vol_fab")
            (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "warthog_g" (players))
            (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "warthog_p" (players))
        )
    )
    (ai_set_objective "lakebed_a_allies/win" "factory_b_allies_obj")
    (ai_set_objective "lakebed_a_allies/win_vehicle" "factory_b_allies_obj")
    (ai_set_objective "lake_a_cov_end" "factory_b_cov_obj")
)

(script dormant void factory_b_middle_doors
    (sleep_until (<= (ai_task_count "factory_b_cov_obj/inf") 0))
    (sleep (random_range 30 50))
    (if (<= (device_get_position "factory_b_entry02") 0.0) 
        (begin
            (wake md_fab_hog_door)
            (sleep 90)
            (device_set_position "factory_b_entry02" 1.0)
        )
    )
)

(script dormant void factory_b_combat_freeze
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "vol_factory_b_tunnel"))
            (sleep 10)
            (print "freezing combat")
            (sleep_until (not (volume_test_players "vol_factory_b_tunnel")))
            (print "un-freezing combat")
            (ai_cannot_die "all_enemies" false)
            false
        )
    )
)

(script dormant void wraith_blocker_fix
    (sleep_until 
        (or
            (volume_test_players "vol_pump_room_b_up_b")
            (volume_test_players "vol_factory_b_center")
            (= wave 2)
        )
    )
    (unit_kill (ai_vehicle_get_from_starting_location "lake_a_cov_end_wraith/driver01"))
    (sleep_until (not (objects_can_see_object (players) (ai_vehicle_get_from_starting_location "lake_a_cov_end_wraith/driver01") 30.0)))
    (object_destroy (ai_vehicle_get_from_starting_location "lake_a_cov_end_wraith/driver01"))
)

(script command_script void factory_b_phantom_exit
    (print "final phantom inbound")
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "factory_b/phantom_exit")
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script dormant void bugger_spawn
    (print "spawn buggers")
    (ai_place "factory_b_cov_bugs01")
    (sleep 30)
    (print "dialog: buggers!!... fall back!!!")
    (sleep_until 
        (begin
            (ai_place "factory_b_cov_bugs02")
            (sleep 5)
            (sleep_until (<= (ai_living_count "all_enemies") 12) 5)
            (>= (ai_living_count "factory_b_cov_obj/bugger_exit") 1)
        )
    )
    (print "buggers done")
    (cs_run_command_script "factory_b_cov_bugs01" bugger_exit)
    (cs_run_command_script "factory_b_cov_bugs02" bugger_exit)
    (cs_run_command_script "factory_b_cov_bugs03" bugger_exit)
    (sleep 60)
    (cs_run_command_script "factory_b_phantom/driver01" factory_b_phantom_exit)
    (set g_music_040_05 false)
)

(script command_script void bugger_exit
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_moving true)
    (sleep (random_range 30 120))
    (cs_enable_looking false)
    (cs_enable_targeting false)
    (cs_enable_moving false)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (cs_fly_to "factory_b/bugger_exit01")
                    (cs_fly_to "factory_b/bugger_exit_final")
                    (ai_erase ai_current_actor)
                )
                (begin
                    (cs_fly_to "factory_b/bugger_exit02")
                    (cs_fly_to "factory_b/bugger_exit_final")
                    (ai_erase ai_current_actor)
                )
                (begin
                    (cs_fly_to "factory_b/bugger_exit03")
                    (cs_fly_to "factory_b/bugger_exit_final")
                    (ai_erase ai_current_actor)
                )
            )
            (begin_random
                (begin
                    (cs_fly_to "factory_b/bugger_exit_guide01")
                    (cs_run_command_script ai_current_actor bugger_exit)
                )
                (begin
                    (cs_fly_to "factory_b/bugger_exit_guide02")
                    (cs_run_command_script ai_current_actor bugger_exit)
                )
            )
            false
        )
    )
)

(script static void test_buggers
    (gs_camera_bounds_off)
    (ai_place "factory_b_phantom")
    (cs_run_command_script "factory_b_phantom/driver01" pause_forever)
    (wake bugger_spawn)
)

(script dormant void fab_turret_exit
    (sleep_until 
        (or
            (<= (ai_task_count "factory_b_cov_obj/inf") 0)
            (>= (ai_task_count "factory_b_cov_obj/buggers_arrive_gate") 1)
        )
    )
    (sleep 60)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "factory_b_turrets/turret01") true)
    (vehicle_unload (ai_vehicle_get_from_starting_location "factory_b_turrets/turret01") none)
)

(script command_script void goose_pause
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_moving true)
    (sleep_until (unit_in_vehicle ai_current_actor))
    (cs_enable_moving false)
    (sleep_forever)
)

(script dormant void fab_entry_door_closer
    (sleep_until (volume_test_players "vol_factory_b_center") 5)
    (device_group_change_only_once_more_set "fab_entry_buttons" false)
    (device_set_position "factory_b_entry_door" 0.0)
    (sleep_until (<= (device_get_position "factory_b_entry_door") 0.0) 5)
    (fab_coop_teleport)
    (wake lakebed_a_cleanup)
    (sleep_until (volume_test_players "vol_factory_b_tunnel") 5)
    (sleep_forever bugger_spawn)
    (cs_run_command_script "factory_b_phantom/driver01" factory_b_phantom_exit)
    (cs_run_command_script "factory_b_cov_bugs01" bugger_exit)
    (cs_run_command_script "factory_b_cov_bugs02" bugger_exit)
    (cs_run_command_script "factory_b_cov_bugs03" bugger_exit)
    (sleep_until (<= (ai_living_count "factory_b_phantom") 0) 5 (* 30.0 5.0))
    (print "preparing to swich to lakeb zone set")
    (zone_set_trigger_volume_enable "begin_zone_set:fab_lakeb" true)
    (sleep_until (= (current_zone_set_fully_active) 5) 1)
    (device_set_position "lakebed_b_entry_door" 1.0)
    (ai_erase "lake_a_def_center")
)

(script static void fab_coop_teleport
    (print "teleport backup")
    (if 
        (or
            (volume_test_object "vol_fab_coop_teleport01" (player0))
            (volume_test_object "vol_fab_coop_teleport02" (player0))
        ) 
            (object_teleport (player0) "fab_coop_teleport_player0"))
    (if 
        (or
            (volume_test_object "vol_fab_coop_teleport01" (player1))
            (volume_test_object "vol_fab_coop_teleport02" (player1))
        ) 
            (object_teleport (player1) "fab_coop_teleport_player1"))
    (if 
        (or
            (volume_test_object "vol_fab_coop_teleport01" (player2))
            (volume_test_object "vol_fab_coop_teleport02" (player2))
        ) 
            (object_teleport (player2) "fab_coop_teleport_player2"))
    (if 
        (or
            (volume_test_object "vol_fab_coop_teleport01" (player3))
            (volume_test_object "vol_fab_coop_teleport02" (player3))
        ) 
            (object_teleport (player3) "fab_coop_teleport_player3"))
)

(script dormant void fab_button_pusher
    (sleep_until (<= (device_get_position "factory_b_entry_door") 0.0))
    (sleep 30)
    (if (<= (device_group_get "factory_b_middle_buttons") 0.0) 
        (begin
            (vs_cast (object_get_ai (list_get (ai_actors "factory_b_allies_obj/bugger_fight") 0)) true 2 "")
            (vs_enable_pathfinding_failsafe "factory_b_allies_obj/bugger_fight" true)
            (vs_enable_looking "factory_b_allies_obj/bugger_fight" true)
            (vs_enable_targeting "factory_b_allies_obj/bugger_fight" true)
            (print "i'll get the door, chief")
            (vs_go_to (vs_role 1) true "factory_b/buttonpush")
            (device_set_position "factory_b_middle_switch" 1.0)
            (vs_release_all)
        )
    )
)

(script command_script void fab_goose_pass_cs
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_moving true)
    (sleep_until (unit_in_vehicle ai_current_actor))
    (print "in vehicle")
    (cs_enable_moving false)
    (sleep_forever)
)

(script dormant void factory_b_start
    (sleep_until (> (device_get_position "factory_b_entry_door") 0.0) 5)
    (sleep_until (volume_test_players "vol_factory_b_init") 5)
    (data_mine_set_mission_segment "040_40_factory_b")
    (print "factory arms b start")
    (wake fab_objectives)
    (set g_music_040_04 false)
    (game_save)
    (set wave 1)
    (set testnum (- 4.0 (ai_living_count "lakebed_a_allies")))
    (if (< testnum 2) 
        (set testnum 2))
    (sleep 1)
    (ai_disposable "lakebed_a_covenant_obj" true)
    (ai_place "factory_b_cov_init")
    (ai_place "factory_b_cov_init02")
    (ai_place "factory_b_allies01" testnum)
    (ai_place "factory_b_turrets")
    (cs_run_command_script "factory_b_turrets" fab_turret_shoot_cs)
    (ai_place "factory_b_phantom")
    (cs_run_command_script "factory_b_phantom/driver01" pause_forever)
    (ai_disregard (ai_actors "factory_b_phantom") true)
    (wake fab_ai_setup)
    (wake factory_b_middle_doors)
    (wake cor_fab)
    (wake md_fab_new_rahrah)
    (sleep_until (volume_test_players "vol_fab_entryroom"))
    (sleep_forever fab_ai_setup)
    (cs_run_command_script "factory_b_turrets" abort)
    (wake md_fab_new_contact)
    (if (<= (ai_task_count "factory_b_cov_obj/inf") 8) 
        (ai_place "factory_b_cov_init03"))
    (wake fab_entry_door_closer)
    (sleep_until (volume_test_players "vol_factory_b_buginit") 5)
    (print "encounter:buggers")
    (data_mine_set_mission_segment "040_41_factory_b02")
    (game_save)
    (object_create "bugger_glass_break")
    (sleep 10)
    (object_destroy "bugger_glass_break")
    (sleep_until 
        (or
            (<= (ai_task_count "factory_b_cov_obj/inf") 0)
            (volume_test_players "vol_factory_b_buginit03")
            (objects_can_see_object (player0) (ai_vehicle_get_from_starting_location "factory_b_phantom/driver01") 30.0)
        )
    )
    (sleep_until 
        (or
            (objects_can_see_object (player0) (ai_vehicle_get_from_starting_location "factory_b_phantom/driver01") 50.0)
            (> (device_get_position "factory_b_middle") 0.0)
        ) 
    1 (* 30.0 12.0))
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "factory_b_turrets/turret01") true)
    (vehicle_unload (ai_vehicle_get_from_starting_location "factory_b_turrets/turret01") none)
    (ai_disregard (ai_actors "factory_b_phantom") false)
    (lakebed_a_garbage)
    (wake bugger_spawn)
    (wake fab_button_pusher)
    (wake music_040_05)
    (set g_music_040_05 true)
    (wake md_fab_mar_buggers)
    (sleep_until (> (device_get_position "factory_b_middle") 0.0) 1)
    (print "mongoose intro")
    (ai_place "factory_b_allies_goose_init")
    (cs_run_command_script "factory_b_allies_goose_init" pause_forever)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_d true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") mongoose_p true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") mongoose_p true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_p true)
    (ai_place "factory_b_allies_goose_pass")
    (cs_run_command_script "factory_b_allies_goose_pass/sniper01" pause_forever)
    (cs_run_command_script "factory_b_allies_goose_pass/sniper02" pause_forever)
    (cs_run_command_script "factory_b_allies_goose_pass/rocket01" pause_forever)
    (ai_vehicle_enter "factory_b_allies_goose_pass/rocket02" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose04") mongoose_p)
    (sleep_until 
        (and
            (volume_test_players "vol_factory_b_tunnel_end")
            (not g_cortana_playing)
        )
    )
    (wake md_fab_goose)
    (sleep_forever bugger_spawn)
    (game_save)
    (cs_run_command_script "factory_b_allies_goose_pass/sniper01" abort)
    (cs_run_command_script "factory_b_allies_goose_pass/sniper02" abort)
    (cs_run_command_script "factory_b_allies_goose_pass/rocket01" abort)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") mongoose_p false)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") mongoose_p false)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_p false)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose04") mongoose_p false)
    (ai_vehicle_enter "factory_b_allies_goose_pass/rocket01" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_p)
    (ai_vehicle_enter "factory_b_allies_goose_pass/sniper01" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") mongoose_p)
    (ai_vehicle_enter "factory_b_allies_goose_pass/sniper02" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") mongoose_p)
    (if (= (game_is_cooperative) false) 
        (sleep_until 
            (or
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") "mongoose_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") "mongoose_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") "mongoose_d" (players))
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose04") "mongoose_d" (players))
                (volume_test_players "vol_lakebed_b_ledge")
            )
        ) (sleep_until (volume_test_players "vol_lakebed_b_ledge")))
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_d false)
    (cs_run_command_script "factory_b_allies_goose_init" abort)
    (ai_set_objective "allied_goose" "lakebed_b_allies")
    (ai_set_objective "factory_b_allies_obj/hog_goose" "lakebed_b_allies")
    (ai_enter_squad_vehicles "all_allies")
    (wake md_punch_hard)
)

(script dormant void factory_b_cleanup
    (sleep_until (volume_test_players "vol_lakebed_b_ledge"))
    (ai_disposable "factory_b_cov_obj" true)
    (sleep_forever wraith_blocker_fix)
    (sleep_forever factory_b_middle_doors)
    (device_one_sided_set "factory_b_entry_door" true)
)

(script static void factory_b_garbage
    (add_recycling_volume "factory_b_garbage" 0 0)
)

(script dormant void crane_ctrl
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (>= (device_get_position "crane_elevator_left") 1.0)
                    (>= (device_get_position "crane_elevator_right") 1.0)
                )
            )
            (sleep 60)
            (sleep_until (not 
                (or
                    (volume_test_players "vol_lakebed_b_crane_left")
                    (volume_test_players "vol_lakebed_b_crane_right")
                )
            ))
            (device_set_position "crane_switch_left" 0.0)
            (device_set_position "crane_switch_right" 0.0)
            false
        )
    )
)

(script dormant void lake_a_big_door_closer02
    (sleep_until (volume_test_players "vol_lake_b_doorcheck"))
    (device_set_position "tank_room_b_exit02" 0.0)
)

(script static void lakebed_b_cov_drop_ghosts_go
    (print "rein ghosts")
    (set wave (+ wave 1.0))
    (lakebed_b_garbage)
    (ai_place "lakebed_b_phantoms")
    (ai_set_targeting_group "lakebed_b_phantoms" 1)
    (ai_place "lakebed_b_cov_rein_back_ghosts")
    (ai_place "lakebed_b_cov_rein_front_ghosts")
    (ai_renew "all_allies")
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver01") phantom_sc01 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_back_ghosts/driver01"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver01") phantom_sc02 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_back_ghosts/driver02"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver02") phantom_sc01 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_front_ghosts/driver01"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver02") phantom_sc02 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_front_ghosts/driver02"))
    (cs_run_command_script "lakebed_b_phantoms/driver02" lakebed_b_cov_drop_ghosts01_cs)
    (cs_run_command_script "lakebed_b_phantoms/driver01" pause_forever)
    (sleep 100)
    (cs_run_command_script "lakebed_b_phantoms/driver01" lakebed_b_cov_drop_ghosts02_cs)
)

(script static void test_lakebed_b_phantoms
    (ai_set_task_condition "lakebed_b_covenant_obj/dumb_init" false)
    (wake lakeb_bfg_go)
    (sleep 30)
    (ai_place "lakebed_b_phantoms")
    (ai_set_targeting_group "lakebed_b_phantoms" 1)
    (ai_place "lakebed_b_cov_rein_back_ghosts")
    (ai_place "lakebed_b_cov_rein_front_ghosts")
    (ai_renew "all_allies")
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver01") phantom_sc01 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_back_ghosts/driver01"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver01") phantom_sc02 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_back_ghosts/driver02"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver02") phantom_sc01 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_front_ghosts/driver01"))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "lakebed_b_phantoms/driver02") phantom_sc02 (ai_vehicle_get_from_starting_location "lakebed_b_cov_rein_front_ghosts/driver02"))
    (cs_run_command_script "lakebed_b_phantoms/driver02" lakebed_b_cov_drop_ghosts01_cs)
    (cs_run_command_script "lakebed_b_phantoms/driver01" pause_forever)
    (sleep 100)
    (cs_run_command_script "lakebed_b_phantoms/driver01" lakebed_b_cov_drop_ghosts02_cs)
)

(script command_script void lakebed_b_cov_drop_ghosts01_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (cs_fly_by "lakebed_b/phantom_init" 8.0)
    (cs_vehicle_boost false)
    (cs_fly_to "lakebed_b/phantom_backhalf_ghosts" 1.0)
    (cs_enable_targeting true)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc01)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc02)
    (sleep 60)
    (cs_enable_targeting false)
    (cs_run_command_script ai_current_actor lakeb_phantom_exit)
)

(script command_script void lakebed_b_cov_drop_ghosts02_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (cs_fly_by "lakebed_b/phantom_init" 8.0)
    (cs_vehicle_boost false)
    (cs_fly_to "lakebed_b/phantom_fronthalf_guide")
    (cs_fly_to "lakebed_b/phantom_fronthalf_ghosts02" 1.0)
    (cs_enable_targeting true)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc01)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_sc02)
    (sleep 60)
    (cs_fly_to "lakebed_b/phantom_fronthalf_guide")
    (cs_enable_targeting false)
    (cs_run_command_script ai_current_actor lakeb_phantom_exit)
)

(script command_script void lakeb_phantom_exit
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "lakebed_b/phantom_guide_high")
    (lake_b_surfer_kill)
    (cs_fly_by "lakebed_b/phantom_guide_high02" 8.0)
    (cs_vehicle_boost true)
    (cs_fly_to "lakebed_b/phantom_exit_high" 2.0)
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script static void lake_b_surfer_kill
    (print "killing surfers")
    (if (volume_test_object "vol_lake_b_surf" (player0)) 
        (unit_kill (player0)))
    (if (volume_test_object "vol_lake_b_surf" (player1)) 
        (unit_kill (player1)))
    (if (volume_test_object "vol_lake_b_surf" (player2)) 
        (unit_kill (player2)))
    (if (volume_test_object "vol_lake_b_surf" (player3)) 
        (unit_kill (player3)))
)

(script static void lake_b_surfer_kill02
    (print "killing surfers")
    (if (volume_test_object "vol_lake_b_surf02" (player0)) 
        (unit_kill (player0)))
    (if (volume_test_object "vol_lake_b_surf02" (player1)) 
        (unit_kill (player1)))
    (if (volume_test_object "vol_lake_b_surf02" (player2)) 
        (unit_kill (player2)))
    (if (volume_test_object "vol_lake_b_surf02" (player3)) 
        (unit_kill (player3)))
)

(script command_script void lakebed_b_wraiths_shoot
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_b_targets/p0")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_b_targets/p1")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_b_targets/p2")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_b_targets/p3")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_b_targets/p4")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_b_targets/p5")
                )
                (begin
                    (sleep (random_range 30 150))
                    (cs_shoot_point true "lakebed_b_targets/p6")
                )
            )
            (<= (ai_strength ai_current_actor) 0.2)
        )
    )
    (print "aa wraith breaking script")
)

(script static void lakeb_bfg_aim
    (device_animate_overlay "lakeb_bfg_base" (real_random_range 0.332 0.334) (random_range 2 3) 0.1 0.1)
    (sleep 60)
)

(script dormant void lakeb_bfg_shoot
    (sleep_until 
        (begin
            (print "lakeb bfg shoot")
            (lakeb_bfg_aim)
            (lakeb_bfg_shoot_anim)
            (if (>= (ai_living_count "scarab") 1) 
                (sleep 200))
            (sleep (random_range 10 30))
            false
        )
    )
)

(script static void lakeb_bfg_shoot_anim
    (device_animate_overlay "lakeb_bfg_turret" 1.0 3.0 0.0 0.0)
    (sleep 90)
    (device_animate_overlay "lakeb_bfg_turret" 0.0 0.0 0.0 0.0)
)

(script static void bfg_shake_fx
    (screen_shake_small_impact)
    (effect_new_random "fx\scenery_fx\ceiling_dust\human_dust_fall_small\human_dust_fall_small.effect" "office_fx01")
    (effect_new_random "fx\scenery_fx\ceiling_dust\human_dust_fall_small\human_dust_fall_small.effect" "office_fx02")
    (effect_new_random "fx\scenery_fx\ceiling_dust\human_dust_fall_small\human_dust_fall_small.effect" "office_fx03")
    (effect_new_random "fx\scenery_fx\ceiling_dust\human_dust_fall_small\human_dust_fall_small.effect" "fab_fx01")
    (effect_new_random "fx\scenery_fx\ceiling_dust\human_dust_fall_small\human_dust_fall_small.effect" "fab_fx02")
)

(script dormant void lakeb_bfg_go
    (object_create "lakeb_bfg_base")
    (object_create "lakeb_bfg_turret")
    (objects_attach "lakeb_bfg_base" "turret" "lakeb_bfg_turret" "")
    (device_set_position_track "lakeb_bfg_base" "position" 0.0)
    (device_set_overlay_track "lakeb_bfg_base" "power")
    (device_set_position_track "lakeb_bfg_turret" "position" 0.0)
    (device_set_overlay_track "lakeb_bfg_turret" "power")
    (device_animate_overlay "lakeb_bfg_base" 0.333 0.0 0.0 0.0)
    (device_animate_overlay "lakeb_bfg_turret" 0.0 0.0 0.0 0.0)
    (wake lakeb_bfg_shoot)
)

(script dormant void lakeb_bfg_cleanup
    (sleep_forever lakeb_bfg_shoot)
    (object_destroy "lakeb_bfg_base")
    (object_destroy "lakeb_bfg_turret")
)

(script dormant void lakeb_aa_preference
    (sleep_until 
        (begin
            (ai_prefer_target_ai "lakebed_b_allies/vehicles" "lakebed_b_covies" true)
            (sleep 1)
            (ai_prefer_target_ai "lakebed_b_allies/player_vehicles" "lakebed_b_covies" false)
            (sleep 90)
            (<= (ai_task_count "lakebed_b_covenant_obj/wraith_gate") 0)
        )
    )
)

(script command_script void lake_b_hornet_init_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (sleep 90)
    (cs_face true "lakebed_b_targets/hornet01a")
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (cs_enable_moving false)
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_b_targets/hornet01a")
                    (cs_enable_moving true)
                )
                (begin
                    (cs_enable_moving false)
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_b_targets/hornet01b")
                    (cs_enable_moving true)
                )
                (begin
                    (cs_enable_moving false)
                    (sleep (random_range 30 80))
                    (cs_shoot_point true "lakebed_b_targets/hornet01c")
                    (cs_enable_moving true)
                )
            )
            false
        )
    )
)

(script dormant void lake_b_hornet_control
    (sleep_until 
        (begin
            (ai_place "lakebed_b_hornets01")
            (if (>= (ai_living_count "lakebed_b_wraiths") 1) 
                (ai_set_targeting_group "lakebed_b_hornets01" 1) (ai_set_targeting_group "lakebed_b_hornets01" -1))
            (ai_magically_see "lakebed_b_wraith_01" "lakebed_b_hornets01")
            (ai_magically_see "lakebed_b_wraith_02" "lakebed_b_hornets01")
            (sleep_until (<= (ai_living_count "lakebed_b_hornets01") 0))
            (lakebed_b_garbage)
            (sleep (random_range 100 200))
            false
        )
    )
)

(script command_script void lake_b_pelican01_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "lakebed_b/pelican01a")
    (cs_vehicle_boost true)
    (cs_fly_by "lakebed_b/pelican01b" 8.0)
    (cs_vehicle_boost false)
    (cs_face true "lakebed_b/pelican01_face")
    (cs_fly_to "lakebed_b/pelican01c" 1.0)
    (ai_place "lake_b_goose02/driver01")
    (ai_place "lake_b_goose02_drivers/driver01")
    (ai_place "lake_b_goose02_drivers/pass01")
    (ai_vehicle_enter_immediate "lake_b_goose02_drivers/driver01" (ai_vehicle_get_from_starting_location "lake_b_goose02/driver01") mongoose_d)
    (ai_vehicle_enter_immediate "lake_b_goose02_drivers/pass01" (ai_vehicle_get_from_starting_location "lake_b_goose02/driver01") mongoose_p)
    (if (<= (ai_task_count "lakebed_b_allies/cov_dead_vehicles") 3) 
        (begin
            (ai_place "lake_b_goose02/driver02")
            (ai_place "lake_b_goose02_drivers/driver02")
            (ai_place "lake_b_goose02_drivers/pass02")
            (ai_vehicle_enter_immediate "lake_b_goose02_drivers/driver02" (ai_vehicle_get_from_starting_location "lake_b_goose02/driver02") mongoose_d)
            (ai_vehicle_enter_immediate "lake_b_goose02_drivers/pass02" (ai_vehicle_get_from_starting_location "lake_b_goose02/driver02") mongoose_p)
        )
    )
    (unit_open (ai_vehicle_get ai_current_actor))
    (cs_run_command_script (ai_get_driver "lake_b_goose02/driver01") pause_forever)
    (cs_run_command_script (ai_get_driver "lake_b_goose02/driver02") pause_forever)
    (sleep 80)
    (cs_run_command_script (ai_get_driver "lake_b_goose02/driver01") lake_b_goose_cs)
    (sleep 30)
    (cs_run_command_script (ai_get_driver "lake_b_goose02/driver02") lake_b_goose_cs)
    (sleep 60)
    (unit_close (ai_vehicle_get ai_current_actor))
    (cs_fly_to "lakebed_b/pelican01d" 1.0)
    (lake_b_surfer_kill02)
    (sleep_until (>= (ai_living_count "scarab") 1))
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep 110)
)

(script command_script void lake_b_goose_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_abort_on_vehicle_exit true)
    (cs_vehicle_speed_instantaneous 6.0)
    (cs_go_to "lakebed_b/goose01a" 1.0)
)

(script static void test_lakeb_pelicans
    (ai_place "lakebed_b_pelicans01")
    (cs_run_command_script "lakebed_b_pelicans01/driver01" lake_b_pelican01_cs)
)

(script dormant void lakebed_b_cov_drop_ghosts
    (lakebed_b_cov_drop_ghosts_go)
    (sleep_until 
        (and
            (<= (ai_living_count "lakebed_b_covenant_obj/ghosts") 2)
            (<= (ai_living_count "lakebed_b_covenant_obj/choppers") 1)
            (<= (ai_living_count "lakebed_b_covenant_obj/phantoms") 0)
            (<= (ai_living_count "lakebed_b_phantoms") 0)
        )
    )
    (lakebed_b_cov_drop_ghosts_go)
    (wake lake_b_zone_switch)
)

(script dormant void lake_b_zone_switch
    (if (= (game_is_cooperative) false) 
        (sleep_until 
            (and
                (not (volume_test_players "vol_lakebed_b_entryprox"))
                (not (volume_test_players "vol_fab"))
            )
        ) (sleep_until (volume_test_players "vol_scarab_coop_test")))
    (device_set_position "lakebed_b_entry_door" 0.0)
    (sleep_until (<= (device_get_position "lakebed_b_entry_door") 0.0))
    (scarab_coop_teleport)
    (zone_set_trigger_volume_enable "begin_zone_set:scarab" true)
    (sleep (* 30.0 15.0))
    (sleep_until (<= (ai_task_count "lakebed_b_covenant_obj/wraith_gate") 0) 5)
    (sleep_until (<= (ai_living_count "lakebed_b_covenant_obj/phantoms") 0) 5)
    (switch_zone_set "scarab")
    (sleep 30)
    (device_set_power "lakebed_b_exit" 1.0)
    (device_set_position "lakebed_b_exit" 1.0)
)

(script dormant void lakebed_b_start
    (flock_create "lake_b_banshees")
    (flock_create "lake_b_hornets")
    (flock_create "lake_b_phantoms")
    (flock_create "lake_b_bashee_excort01")
    (flock_create "lake_b_bashee_excort02")
    (sleep_until (volume_test_players "vol_lakebed_b_start") 5)
    (print "lakebed b start")
    (data_mine_set_mission_segment "040_50_lakebed_b")
    (ai_set_objective "allied_goose" "lakebed_b_allies")
    (wake lakeb_bfg_go)
    (sleep 1)
    (wake factory_b_cleanup)
    (wake crane_ctrl)
    (set wavemax 3)
    (ai_place "lake_b_def_center")
    (ai_place "lake_b_def_turrets")
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lake_b_def_turrets/turret01") true)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lake_b_def_turrets/turret02") true)
    (ai_place "lakebed_b_ghosts")
    (ai_place "lakebed_b_wraith_01")
    (ai_place "lakebed_b_wraith_02")
    (ai_set_targeting_group "lakebed_b_wraith_01/driver01" 1)
    (ai_set_targeting_group "lakebed_b_wraith_02/driver01" 1)
    (wake lake_b_hornet_control)
    (object_set_persistent (ai_vehicle_get_from_starting_location "lakebed_b_wraith_01/driver01") true)
    (object_set_persistent (ai_vehicle_get_from_starting_location "lakebed_b_wraith_02/driver01") true)
    (sleep_until (volume_test_players "vol_lakebed_b_ledge"))
    (factory_b_garbage)
    (game_save)
    (ai_place "lakebed_b_cov_inf")
    (ai_disposable "factory_b_allies_obj" true)
    (wake lake_a_big_door_closer02)
    (set wave 1)
    (sleep 90)
    (wake lakebed_b_cov_drop_ghosts)
    (sleep_until (<= (ai_task_count "lakebed_b_covenant_obj/wraith_gate") 2))
    (wake md_lab_wraith01)
    (game_save)
    (sleep_until (<= (ai_task_count "lakebed_b_covenant_obj/wraith_gate") 0))
    (print "aa wraiths are dead")
    (ai_enter_squad_vehicles "all_allies")
    (ai_place "lakebed_b_banshees01")
    (ai_set_targeting_group "lakebed_b_hornets01" -1)
    (wake objective_2_clear)
    (game_save)
    (lakebed_b_garbage)
)

(script dormant void scarab_allies_backup
    (sleep 60)
    (sleep_until 
        (begin
            (if (<= (ai_task_count "lakebed_b_allies/scarab_init") 1) 
                (begin
                    (if (not (volume_test_players_all "vol_lake_b_backup_area")) 
                        (ai_place "lake_b_allies_backup"))
                    (sleep 1)
                    (ai_enter_squad_vehicles "all_allies")
                )
            )
            (sleep_until (<= (ai_task_count "lakebed_b_allies/scarab_init") 1))
            (<= (ai_living_count "scarab") 0)
        )
    )
)

(script command_script void scarab_shoot
    (cs_face true "scarab_shoot/p3")
    (sleep 90)
    (begin_random
        (begin
            (cs_shoot_point true "scarab_shoot/p0")
            (sleep (random_range 60 160))
        )
        (begin
            (cs_shoot_point true "scarab_shoot/p1")
            (sleep (random_range 60 160))
        )
        (begin
            (cs_shoot_point true "scarab_shoot/p2")
            (sleep (random_range 60 160))
        )
        (begin
            (cs_shoot_point true "scarab_shoot/p3")
            (sleep (random_range 60 160))
        )
        (cs_run_command_script ai_current_actor abort)
    )
)

(script command_script void scarab_shoot_front
    (begin_random
        (cs_run_command_script ai_current_actor abort)
        (cs_run_command_script ai_current_actor scarab_shoot)
        (sleep 80)
    )
)

(script command_script void scarab_shoot_present
    (cs_face true "scarab_shoot/p3")
    (begin_random
        (begin
            (cs_shoot_point true "scarab_shoot/p0")
            (sleep (random_range 60 160))
        )
        (begin
            (cs_shoot_point true "scarab_shoot/p1")
            (sleep (random_range 60 160))
        )
        (begin
            (cs_shoot_point true "scarab_shoot/p2")
            (sleep (random_range 60 160))
        )
        (begin
            (cs_shoot_point true "scarab_shoot/p3")
            (sleep (random_range 60 160))
        )
    )
    (print "present waiting")
    (sleep_until (not 
        (or
            (volume_test_players "vol_lakebed_b_crane_left")
            (volume_test_players "vol_lakebed_b_crane_right")
        )
    ) 30 (* 30.0 20.0))
    (print "present done fgamewaiting")
    (cs_go_to "scarab_patrol/middle01")
)

(script command_script void scarab_present_right
    (print "present right")
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "scarab_patrol/p0" 1.0)
    (cs_run_command_script "scarab/driver01" scarab_shoot_present)
)

(script command_script void scarab_present_left
    (print "present left")
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "scarab_patrol/p1")
    (cs_run_command_script "scarab/driver01" scarab_shoot_present)
)

(script dormant void scarab_present
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (volume_test_players "vol_scarab_crane_left")
                    (volume_test_players "vol_scarab_crane_right")
                )
            )
            (if (volume_test_players "vol_scarab_crane_right") 
                (cs_run_command_script "scarab/driver01" scarab_present_right) (cs_run_command_script "scarab/driver01" scarab_present_left))
            (sleep_until (not 
                (or
                    (volume_test_players "vol_scarab_crane_left")
                    (volume_test_players "vol_scarab_crane_right")
                )
            ))
            (<= (ai_living_count "scarab") 0)
        )
    )
)

(script static void scarab_coop_teleport
    (print "teleport backup")
    (if 
        (and
            (volume_test_object "vol_scarab_coop_teleport01" (player0))
            (not (volume_test_object "vol_scarab_coop_teleport02" (player0)))
        ) 
            (object_teleport (player0) "scarab_coop_teleport_player0"))
    (if 
        (and
            (volume_test_object "vol_scarab_coop_teleport01" (player1))
            (not (volume_test_object "vol_scarab_coop_teleport02" (player1)))
        ) 
            (object_teleport (player1) "scarab_coop_teleport_player1"))
    (if 
        (and
            (volume_test_object "vol_scarab_coop_teleport01" (player2))
            (not (volume_test_object "vol_scarab_coop_teleport02" (player2)))
        ) 
            (object_teleport (player2) "scarab_coop_teleport_player2"))
    (if 
        (and
            (volume_test_object "vol_scarab_coop_teleport01" (player3))
            (not (volume_test_object "vol_scarab_coop_teleport02" (player3)))
        ) 
            (object_teleport (player3) "scarab_coop_teleport_player3"))
)

(script dormant void scarab_saves
    (sleep_until (volume_test_players "vol_scarab"))
    (print "player on scarab")
    (sleep_forever md_lab_mar_scarab_hints_03)
    (wake md_lab_mar_scarab_hints_04)
    (game_save)
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "vol_scarab_top"))
            (print "trying to save on scarab")
            (game_save)
            (sleep_until (not (volume_test_players "vol_scarab_top")))
            (sleep 300)
            (<= (ai_living_count "scarab") 0)
        )
    )
)

(script dormant void scarab_start
    (sleep_until 
        (and
            (<= (ai_living_count "lakebed_b_covenant_obj/phantoms") 0)
            true
        )
    )
    (sleep_until (<= (ai_task_count "lakebed_b_covenant_obj/ghostandchoppers") 0) 30 (* 30.0 30.0))
    (wake md_lab_wraith02)
    (ai_place "lakebed_b_pelicans01")
    (ai_cannot_die "lakebed_b_pelicans01" true)
    (cs_run_command_script "lakebed_b_pelicans01/driver01" lake_b_pelican01_cs)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lake_b_def_turrets/turret01") false)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "lake_b_def_turrets/turret02") false)
    (ai_enter_squad_vehicles "all_allies")
    (game_save)
    (sleep (* 30.0 15.0))
    (sleep_until (<= (ai_task_count "lakebed_b_covenant_obj/ground_gate") 5) 30 (* 30.0 15.0))
    (flock_stop "lake_b_banshees")
    (lakebed_b_garbage)
    (print "scarab encounter ready")
    (game_save)
    (wake scarab_saves)
    (if (= (game_insertion_point_get) 0) 
        (wake 040_title2))
    (game_insertion_point_unlock 1)
    (sleep_until (>= (ai_living_count "scarab") 1))
    (wake md_scarab_get_off)
    (sleep_until (<= (ai_living_count "scarab") 0) 5)
    (set g_scarab_dead true)
    (ai_kill "lakebed_b_scarab_brutes")
    (ai_kill "lakebed_b_scarab_brutes02")
    (ai_kill "lakebed_b_scarab_grunts")
    (wake lakebed_b_cleanup)
    (wake objective_3_clear)
    (wake lake_b_nav_exit)
    (wake music_040_09)
    (set g_music_040_09 true)
    (game_save)
    (device_operates_automatically_set "lakebed_b_exit" false)
    (device_closes_automatically_set "lakebed_b_exit" false)
    (device_set_position "lakebed_b_exit" 1.0)
    (device_operates_automatically_set "lakebed_b_exit02" false)
    (device_closes_automatically_set "lakebed_b_exit02" false)
    (device_set_position "lakebed_b_exit02" 1.0)
    (device_set_position "lakebed_b_exit03" 1.0)
    (sleep_forever md_lab_mar_scarab_hints_01)
    (sleep_forever md_lab_mar_scarab_hints_03)
    (sleep_forever md_lab_mar_scarab_hints_04)
    (wake md_lab_mar_scarab_dead)
    (sleep (* 30.0 5.0))
    (wake md_lab_few_pelicans)
    (sleep_until (volume_test_players "vol_lakebed_b_end_advance"))
    (ai_vehicle_exit "lakebed_b_allies/scarab_dead")
    (wake md_cor_mar_locked_down)
)

(script dormant void lakebed_b_cleanup
    (sleep_forever scarab_present)
    (sleep_forever scarab_saves)
    (sleep_forever lakebed_b_cov_drop_ghosts)
    (sleep_until (= (current_zone_set) 7) 5)
    (ai_disposable "lakebed_b_allies" true)
    (ai_disposable "lakebed_b_covenant_obj" true)
    (lakebed_b_garbage02)
    (object_set_persistent (ai_vehicle_get_from_starting_location "lakebed_b_wraith_01/driver01") false)
    (object_set_persistent (ai_vehicle_get_from_starting_location "lakebed_b_wraith_02/driver01") false)
    (wake lakeb_bfg_cleanup)
    (sleep_forever crane_ctrl)
    (sleep_forever lake_b_hornet_control)
    (flock_delete "lake_b_banshees")
    (flock_delete "lake_b_hornets")
    (flock_delete "lake_b_phantoms")
    (flock_delete "lake_b_bashee_excort01")
    (flock_delete "lake_b_bashee_excort02")
)

(script static void lakebed_b_garbage
    (add_recycling_volume "lakebed_b_garbage" 20 5)
    (sleep (* 30.0 5.0))
)

(script static void lakebed_b_garbage02
    (add_recycling_volume "lakebed_b_garbage" 0 0)
)

(script dormant void office_arbiter_arrives
    (ai_place "cortana_office_pelican01")
    (ai_cannot_die "cortana_office_pelican01" true)
    (ai_place "cortana_office_arbiter")
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "cortana_office_pelican01/driver01") pelican_p_l05 (ai_actors "cortana_office_arbiter"))
    (cs_run_command_script "cortana_office_pelican01/driver01" office_pelican01_cs)
)

(script command_script void office_pelican01_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "lakebed_b/office_pelican01a")
    (cs_vehicle_boost true)
    (cs_fly_by "lakebed_b/office_pelican01b" 8.0)
    (cs_vehicle_boost false)
    (cs_fly_to "lakebed_b/office_pelican01c")
    (cs_face true "lakebed_b/office_pelican01_face")
    (cs_fly_to "lakebed_b/office_pelican01d" 1.0)
    (unit_open (ai_vehicle_get ai_current_actor))
    (sleep 60)
    (vehicle_unload (ai_vehicle_get ai_current_actor) pelican_p_l05)
    (sleep 90)
    (wake md_arb_entrance)
    (unit_close (ai_vehicle_get ai_current_actor))
    (cs_fly_to "lakebed_b/office_pelican01c")
    (cs_face false "lakebed_b/office_pelican01_face")
)

(script static void office_coop_teleport
    (print "teleport backup")
    (if 
        (and
            (not (volume_test_object "vol_office_coop_teleport_not01" (player0)))
            (not (volume_test_object "vol_office_coop_teleport_not02" (player0)))
        ) 
            (object_teleport (player0) "office_coop_teleport_player0"))
    (if 
        (and
            (not (volume_test_object "vol_office_coop_teleport_not01" (player1)))
            (not (volume_test_object "vol_office_coop_teleport_not02" (player1)))
        ) 
            (object_teleport (player1) "office_coop_teleport_player1"))
    (if 
        (and
            (not (volume_test_object "vol_office_coop_teleport_not01" (player2)))
            (not (volume_test_object "vol_office_coop_teleport_not02" (player2)))
        ) 
            (object_teleport (player2) "office_coop_teleport_player2"))
    (if 
        (and
            (not (volume_test_object "vol_office_coop_teleport_not01" (player3)))
            (not (volume_test_object "vol_office_coop_teleport_not02" (player3)))
        ) 
            (object_teleport (player3) "office_coop_teleport_player3"))
)

(script static void test_office
    (wake object_management)
    (ai_place "cortana_office_allies01")
    (ai_place "cortana_office_allies02")
    (ai_place "cortana_office_civs01")
)

(script dormant void cortana_office_start
    (data_mine_set_mission_segment "040_70_cortana_office")
    (wake cor_ware)
    (ai_place "cortana_office_allies")
    (ai_place "cortana_office_allies01")
    (if (= (game_is_cooperative) false) 
        (wake office_arbiter_arrives))
    (sleep_until (volume_test_players "vol_office_start"))
    (ai_set_objective "all_allies" "office_marines_obj")
    (sleep_forever md_lab_joh_back_inside)
    (ai_place "cortana_office_allies02")
    (ai_place "cortana_office_civs01")
    (sleep_until (volume_test_players "vol_office_doorclose") 5)
    (device_set_position "lakebed_b_exit" 0.0)
    (ai_bring_forward (ai_get_object "cortana_office_arbiter/arbiter") 4.0)
    (sleep_until (<= (device_get_position "lakebed_b_exit") 0.0))
    (office_coop_teleport)
)

(script command_script void warehouse_alert_brutes_cs
    (cs_force_combat_status ai_combat_status_alert)
)

(script dormant void warehouse_brute_intro
    (ai_place "ware_cov_brutes01")
    (ai_place "ware_cov_brutes01a")
    (sleep 1)
    (ai_set_blind "ware_cov_brutes01" true)
    (ai_set_deaf "ware_cov_brutes01" true)
    (sleep 60)
    (ai_set_blind "ware_cov_brutes01" false)
    (ai_set_deaf "ware_cov_brutes01" false)
)

(script command_script void warehouse_marine_flee
    (cs_enable_pathfinding_failsafe true)
    (cs_force_combat_status ai_combat_status_active)
    (cs_go_to_and_face "warehouse/p0" "warehouse/p2")
    (cs_shoot true "ware_cov_brutes01/leader")
)

(script command_script void warehouse_marine_flee02
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "warehouse/p1")
)

(script dormant void warehouse_turret
    (ai_place "ware_turret01")
    (sleep_until (<= (ai_task_count "ware_cov_obj/brute_init") 0))
    (ai_enter_squad_vehicles "all_allies")
)

(script command_script void warehouse_chieftain_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "warehouse/cheif01a")
    (cs_go_to "worker_pts/cheif01b")
)

(script dormant void warehouse_marine_spawner
    (ai_erase_inactive "all_allies" 0)
    (sleep_until 
        (begin
            (sleep_until (<= (ai_living_count "ware_hum_obj") 3))
            (print "spawning more marines")
            (ai_place "ware_marines01")
            (sleep_until 
                (and
                    (not (volume_test_object "vol_warehouse_marine01" (player0)))
                    (not (volume_test_object "vol_warehouse_marine01" (player1)))
                    (not (volume_test_object "vol_warehouse_marine01" (player2)))
                    (not (volume_test_object "vol_warehouse_marine01" (player3)))
                    (objects_can_see_flag (players) "flag_warehouse_marine01" 30.0)
                ) 
            100)
            false
        )
    )
)

(script dormant void warehouse_brute_backup
    (sleep_until (<= (ai_task_count "ware_cov_obj/ware_brute_gate") 5))
    (print "spawning brute backup")
    (ai_place "ware_cov_brutes_backup")
)

(script command_script void warehouse_hunter_cs
    (object_cannot_take_damage "hunter_coil")
    (sleep_until 
        (or
            (and
                (<= (ai_task_count "ware_cov_obj/ware_brute_gate") 0)
                (volume_test_players "vol_warehouse_hunters02")
                (objects_can_see_object (players) "hunter_coil" 30.0)
            )
            (volume_test_players "vol_warehouse_hunters03")
        ) 
    1 (* 30.0 8.0))
    (ai_place "ware_hum_civ03")
    (sleep 30)
    (object_can_take_damage "hunter_coil")
    (cs_shoot true "hunter_coil")
    (wake music_040_11)
    (wake music_040_12)
    (sleep_until (<= (object_get_health "hunter_coil") 0.0) 10 120)
    (ai_disregard (ai_actors "ware_hum_civ01") false)
    (ai_disregard (ai_actors "ware_hum_civ02") false)
)

(script dormant void warehouse_saves01
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (volume_test_players "vol_warehouse_saves01")
                    (game_safe_to_save)
                )
            )
            (game_save)
            (sleep (* 30.0 90.0))
            false
        )
    )
)

(script dormant void warehouse_saves02
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (volume_test_players "vol_warehouse_saves02")
                    (game_safe_to_save)
                )
            )
            (game_save)
            (sleep (* 30.0 90.0))
            false
        )
    )
)

(script dormant void ware_door_closer
    (device_operates_automatically_set "warehouse_entry_small" false)
    (device_set_position "warehouse_entry_small" 0.0)
    (sleep_until (<= (device_get_position "warehouse_entry_small") 0.0) 5)
    (zone_set_trigger_volume_enable "begin_zone_set:ware_worker" true)
    (sleep (* 30.0 7.0))
    (zone_set_trigger_volume_enable "zone_set:ware_worker" true)
    (sleep_until (>= (current_zone_set_fully_active) 8) 5)
    (device_set_position "ware_exit_door" 1.0)
    (device_set_position "ware_exit_door_small" 1.0)
)

(script dormant void warehouse_start
    (sleep_until (volume_test_players "vol_warehouse_init") 5)
    (print "warehouse start")
    (data_mine_set_mission_segment "040_80_warehouse")
    (ai_bring_forward (ai_get_object "cortana_office_arbiter/arbiter") 6.0)
    (ai_place "ware_brutes_init")
    (wake warehouse_turret)
    (ai_place "ware_hum_marines_a")
    (ai_place "ware_hum_marines_b")
    (ai_magically_see "ware_hum_marines_a" "ware_brutes_init")
    (ai_set_objective "arbiter" "ware_hum_obj")
    (ai_disposable "cortana_office_allies02" true)
    (game_save)
    (sleep_until (volume_test_players "vol_warehouse_brutes01") 1)
    (ai_place "ware_hum_101")
    (ai_disregard (ai_actors "ware_hum_101") true)
    (ai_place "ware_hum_marines_flee")
    (unit_set_current_vitality "ware_hum_marines_flee/shotgun01" 5.0 0.0)
    (wake vig_war_sgt_brute_pack)
    (cs_run_command_script "ware_hum_marines_flee/marine02" warehouse_marine_flee02)
    (wake warehouse_brute_intro)
    (sleep_until (volume_test_players "vol_warehouse_brutes02") 5)
    (wake ware_door_closer)
    (wake ware_nav_exit)
    (ai_disregard (ai_actors "ware_hum_101") false)
    (wake warehouse_saves01)
    (wake vig_ware_brute02)
    (sleep 1)
    (wake warehouse_marine_spawner)
    (sleep_until (volume_test_players "vol_warehouse_brutes02b") 5)
    (set testnum (- 4.0 (ai_task_count "ware_hum_obj/civ_scared_gate")))
    (sleep 1)
    (ai_place "ware_hum_civ01" testnum)
    (sleep 1)
    (set testnum 0)
    (ai_disregard (ai_actors "ware_hum_civ01") true)
    (sleep_until (volume_test_players "vol_warehouse_hunters01") 1)
    (sleep_until (> (device_get_position "ware_exit_door") 0.0) 5)
    (ai_disregard (ai_actors "ware_hum_civ01") false)
    (data_mine_set_mission_segment "040_81_hunters")
    (ai_set_objective "ware_cov_obj/ware_brute_gate" "worker_cov_obj")
    (ai_place "ware_cov_hunters")
    (wake md_hunter_hints)
    (object_damage_damage_section "worker_forklift" "forklift" 1.0)
    (cs_run_command_script "ware_cov_hunters" warehouse_hunter_cs)
    (ai_bring_forward (ai_get_object "cortana_office_arbiter/arbiter") 6.0)
    (game_save)
    (sleep_forever warehouse_saves01)
    (wake warehouse_saves02)
    (sleep_until (<= (ai_living_count "ware_cov_hunters") 0))
    (sleep_forever warehouse_saves02)
    (game_save)
)

(script dormant void warehouse_cleanup
    (print "temp")
    (sleep_forever warehouse_turret)
)

(script static void warehouse_garbage
    (add_recycling_volume "warehouse_garbage" 0 0)
)

(script command_script void worker_phantom01_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "worker_pts/phantom01a")
    (ai_trickle_via_phantom "work_cov_phantom01/driver01" "work_cov_grunts01")
    (cs_fly_to "worker_pts/phantom01b")
    (cs_fly_to "worker_pts/phantom01c")
    (cs_fly_to "worker_pts/phantom01d")
    (cs_fly_to "worker_pts/phantom01e")
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script command_script void worker_banshees01_cs
    (cs_vehicle_boost true)
    (sleep 400)
    (object_destroy (ai_vehicle_get ai_current_actor))
)

(script dormant void worker_banshees
    (ai_place "work_cov_banshees01")
    (cs_run_command_script "work_cov_banshees01" worker_banshees01_cs)
    (sleep 60)
    (ai_place "work_cov_banshees01" 1)
    (cs_run_command_script "work_cov_banshees01" worker_banshees01_cs)
    (sleep 40)
    (ai_place "work_cov_banshees01" 1)
    (cs_run_command_script "work_cov_banshees01" worker_banshees01_cs)
)

(script dormant void worker_marine_spawner
    (sleep_until 
        (begin
            (sleep_until (<= (ai_living_count "worker_marines_obj") 3))
            (print "spawning bfg marines")
            (ai_place "worker_marines01")
            (sleep 10)
            false
        )
    )
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (<= (ai_living_count "worker_marines_obj") 3)
                    (volume_test_players "vol_bfg_advance")
                )
            )
            (print "spawning bfg marines02")
            (ai_place "bfg_marines02")
            (sleep 100)
            (volume_test_players "vol_bfg_advance")
        )
    )
)

(script dormant void worker_start
    (print "worker town start")
    (flock_create "worker_banshees")
    (flock_create "worker_phantoms")
    (flock_create "worker_banshees_line")
    (flock_create "worker_banshees_line02")
    (wake bfg_go)
    (ai_place "work_cov_grunts01")
    (ai_place "work_cov_chief")
    (ai_place "work_cov_grunts02")
    (sleep_until (volume_test_players "vol_worker_entry") 5)
    (data_mine_set_mission_segment "040_90_worker")
    (wake truth_channel_worker)
    (wake worker_banshees)
    (wake warehouse_cleanup)
    (flock_create "worker_hornets")
    (flock_create "worker_banshees02")
    (flock_stop "worker_phantoms")
    (flock_stop "worker_banshees_line")
    (flock_stop "worker_banshees_line02")
    (ai_set_objective "all_allies" "worker_marines_obj")
    (ai_set_objective "ware_cov_obj" "worker_cov_obj")
    (sleep_forever warehouse_marine_spawner)
    (wake worker_marine_spawner)
    (sleep_until 
        (or
            (volume_test_players "vol_worker_middle_start")
            (<= (ai_task_count "worker_cov_obj/cov_inf") 5)
        )
    )
    (print "spawning yard")
    (ai_place "work_cov_brute01")
    (ai_place "work_cov_grunts03")
    (ai_place "work_cov_yardcov01")
    (sleep_until (volume_test_players "vol_worker_middle") 5)
    (wake change_zone_set_bfg)
)

(script command_script void bfg_phantom01_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_to "bfg_pts/phantom01a")
    (cs_fly_to "bfg_pts/phantom01b")
)

(script command_script void bfg_banshees_init_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (sleep 80)
    (cs_enable_moving true)
    (sleep (random_range 50 100))
)

(script command_script void bfg_banshee_passive_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_boost true)
    (cs_enable_moving true)
    (sleep_forever)
)

(script dormant void bfg_banshees
    (sleep_until 
        (begin
            (sleep_until (<= (ai_living_count "bfg_cov_banshees01") 0))
            (ai_place "bfg_cov_banshees01")
            false
        )
    )
)

(script dormant void bfg_banshees_passive
    (sleep_until 
        (and
            (<= (ai_task_count "bfg_cov_obj/inf_gate") 1)
            (<= (ai_living_count "bfg_cov01/chief") 0)
        )
    )
    (print "rl marines")
    (ai_place "bfg_marines_rl")
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (cs_run_command_script "bfg_cov_banshees" bfg_banshee_passive_cs)
                    (cs_run_command_script "bfg_cov_banshees01/driver01" abort)
                    (sleep (random_range 80 150))
                )
                (begin
                    (cs_run_command_script "bfg_cov_banshees" bfg_banshee_passive_cs)
                    (cs_run_command_script "bfg_cov_banshees01/driver02" abort)
                    (sleep (random_range 80 150))
                )
                (begin
                    (cs_run_command_script "bfg_cov_banshees" bfg_banshee_passive_cs)
                    (cs_run_command_script "bfg_cov_banshees01/driver03" abort)
                    (sleep (random_range 80 150))
                )
            )
            false
        )
    )
)

(script dormant void bfg_marine_spawner
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (<= (ai_living_count "bfg_marines_obj") 5)
                    (volume_test_players_all "vol_bfg_marine01")
                )
            )
            (print "spawning more marines")
            (ai_place "bfg_marines01")
            (sleep 10)
            false
        )
    )
)

(script dormant void bfg_marine_spawner02
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (<= (ai_living_count "bfg_marines_obj") 5)
                    (volume_test_players_all "vol_bfg_marine02")
                )
            )
            (print "spawning more marines")
            (ai_place "bfg_marines01")
            (sleep 10)
            (and
                (<= (ai_living_count "bfg_cov01/chief") 0)
                (<= (ai_task_count "bfg_cov_obj/inf_gate") 2)
            )
        )
    )
    (sleep 100)
    (sleep_until (volume_test_players_all "vol_bfg_marine02"))
    (game_save)
    (print "rl marines")
    (ai_place "bfg_marines_rl")
    (ai_place "bfg_cov_banshees02")
    (cs_run_command_script "bfg_cov_banshees02" bfg_banshees_init_cs)
)

(script command_script void bfg_shoot_core_cs
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (sleep_until 
        (begin
            (sleep_until (>= (device_get_position "bfg_base") 1.0))
            (cs_enable_looking false)
            (cs_enable_targeting false)
            (cs_enable_moving false)
            (cs_shoot_point true "bfg_pts/bfg_weak")
            (sleep_until (<= (device_get_position "bfg_base") 0.0) 5)
            (cs_shoot_point false "bfg_pts/bfg_weak")
            (cs_enable_looking true)
            (cs_enable_targeting true)
            (cs_enable_moving true)
            (<= (object_get_health "bfg_base") 0.2)
        )
    )
)

(script static void bfg_aim
    (device_animate_overlay "bfg_base" (real_random_range 0.44 0.47) (random_range 2 3) 0.1 0.1)
    (sleep 60)
)

(script static void bfg_fire
    (print "bfg fire")
    (effect_new_on_object_marker "objects\levels\shared\bfg\fx\firing_fx\bfg_foot_dust.effect" "bfg_base" "fx_foot")
    (bfg_shoot_anim)
)

(script static void bfg_shoot_anim
    (device_animate_overlay "bfg_turret" 1.0 3.0 0.0 0.0)
    (sleep 60)
    (bfg_vent)
    (print "vent done")
    (device_animate_overlay "bfg_turret" 0.0 0.0 0.0 0.0)
)

(script static void bfg_vent
    (device_animate_position "bfg_base" 1.0 0.35 0.2 0.5 true)
    (sleep (random_range 20 40))
    (device_animate_overlay "bfg_base" (real_random_range 0.4 0.43) (random_range 2 5) 0.5 0.5)
    (if (volume_test_players "vol_bfg_marine02") 
        (sleep 140) (sleep 60))
    (if (> (object_get_health "bfg_base") 0.0) 
        (device_animate_position "bfg_base" 0.0 1.2 0.25 1.0 true))
)

(script dormant void bfg_go
    (object_create "bfg_turret")
    (objects_attach "bfg_base" "turret" "bfg_turret" "")
    (device_set_position_track "bfg_base" "position" 0.0)
    (device_set_overlay_track "bfg_base" "power")
    (device_set_position_track "bfg_turret" "position" 0.0)
    (device_set_overlay_track "bfg_turret" "power")
    (device_animate_overlay "bfg_base" 0.4 0.0 0.0 0.0)
    (device_animate_overlay "bfg_turret" 0.0 0.0 0.0 0.0)
    (wake bfg_shoot)
)

(script dormant void bfg_shoot
    (sleep_until 
        (begin
            (print "bfg shoot 1st phase")
            (begin
                (sleep (random_range 50 80))
                (bfg_fire)
            )
            (volume_test_players "vol_worker_bfgtest")
        )
    )
    (device_animate_overlay "bfg_base" 0.4 1.5 0.5 0.5)
    (sleep 45)
    (print "bfg ready for longsword")
    (sleep_until g_bfg_longsword 1)
    (print "bfg longsword go!")
    (wake vig_crashing_longsword)
    (bfg_fire)
    (sleep_until 
        (begin
            (print "bfg shoot 1st phase")
            (begin
                (sleep (random_range 50 110))
                (bfg_fire)
            )
            (>= (ai_task_count "bfg_cov_obj/fallback01") 1)
        )
    )
    (sleep_until 
        (begin
            (print "bfg shoot 2nd phase")
            (begin
                (sleep (random_range 50 80))
                (bfg_fire)
            )
            (<= (ai_living_count "bfg_cov01/chief") 0)
        )
    )
    (sleep_until 
        (begin
            (print "bfg shoot 3rd phase")
            (begin
                (sleep (random_range 10 30))
                (bfg_fire)
            )
            false
        )
    )
)

(script dormant void bfg_saves01
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    (volume_test_players "vol_bfg_gamesave01")
                    (game_safe_to_save)
                )
            )
            (game_save)
            (sleep (* 30.0 90.0))
            (<= (object_get_health "bfg_base") 0.0)
        )
    )
)

(script dormant void sky_ambient_cleanup
    (object_destroy "ark_cruiser_01")
    (object_destroy "ark_cruiser_02")
    (object_destroy "flak_human")
    (object_destroy "flak_cov")
    (flock_delete "worker_banshees")
    (flock_delete "worker_phantoms")
    (flock_delete "worker_banshees_line")
    (flock_delete "worker_banshees_line02")
    (flock_delete "worker_hornets")
    (flock_delete "worker_banshees02")
    (object_destroy "lightning01")
    (object_destroy "lightning02")
    (object_destroy "lightning03")
    (object_destroy "lightning04")
    (object_destroy "lightning_big01")
    (object_destroy "lightning_big02")
    (object_destroy "lightning_big03")
)

(script dormant void bfg_damage
    (sleep_until (<= (object_get_health "bfg_base") 0.0) 5)
    (if (= (game_is_cooperative) false) 
        (object_cannot_take_damage (players)))
    (wake objective_4_clear)
    (sleep_forever bfg_start)
    (sleep_forever md_bfg_joh_hints)
    (sleep 10)
    (hud_deactivate_team_nav_point_flag player "nav_bfg_core")
    (effect_new "fx\scenery_fx\explosions\covenant_explosion_medium\covenant_explosion_medium.effect" "bfg_dead_fx01")
    (sleep 9)
    (effect_new "fx\scenery_fx\explosions\covenant_explosion_medium\covenant_explosion_medium.effect" "bfg_dead_fx02")
    (sleep 7)
    (effect_new "fx\scenery_fx\explosions\covenant_explosion_large\covenant_explosion_large.effect" "bfg_dead_fx03")
    (cinematic_fade_to_black)
    (object_cannot_die (player0) true)
    (object_cannot_die (player1) true)
    (object_cannot_die (player2) true)
    (object_cannot_die (player3) true)
    (kill_volume_enable "kill_bfg_cin_start")
    (unit_kill "ware_cov_hunters")
    (ai_erase "cortana_office_arbiter")
    (ai_erase "bfg_cov_obj/banshees")
    (wake bfg_cleanup)
    (wake sky_ambient_cleanup)
    (switch_zone_set "bfg")
    (sound_class_set_gain "amb" 0.0 10)
    (sleep 10)
    (add_recycling_volume "vol_bfg_garbage" 0 0)
    (kill_volume_disable "kill_bfg_cin_start")
    (game_award_level_complete_achievements)
    (data_mine_set_mission_segment "040lb_cov_flee")
    (if g_play_cinematics 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (print "040lb_cov_flee")
                    (040lb_cov_flee)
                )
            )
            (cinematic_skip_stop)
        ) (begin
            (print "skipping '040lb_cov_flee' cinematic")
        )
    )
    (sound_class_set_gain "" 0.0 0)
    (040lb_cov_flee_cleanup)
    (sleep 5)
    (end_mission)
)

(script dormant void change_zone_set_bfg
    (device_set_position "ware_exit_door" 0.0)
    (device_set_position "ware_exit_door_small" 0.0)
    (sleep_until (<= (device_get_position "ware_exit_door") 0.0) 5)
    (sleep_until (<= (device_get_position "ware_exit_door_small") 0.0) 5)
    (bfg_coop_teleport)
    (zone_set_trigger_volume_enable "begin_zone_set:bfg" true)
)

(script static void bfg_coop_teleport
    (print "teleport backup")
    (if (volume_test_object "vol_bfg_coop_teleport" (player0)) 
        (object_teleport (player0) "bfg_coop_teleport_player0"))
    (if (volume_test_object "vol_bfg_coop_teleport" (player1)) 
        (object_teleport (player1) "bfg_coop_teleport_player1"))
    (if (volume_test_object "vol_bfg_coop_teleport" (player2)) 
        (object_teleport (player2) "bfg_coop_teleport_player2"))
    (if (volume_test_object "vol_bfg_coop_teleport" (player3)) 
        (object_teleport (player3) "bfg_coop_teleport_player3"))
)

(script dormant void bfg_start
    (print "bfg start")
    (data_mine_set_mission_segment "040_100_bfg")
    (warehouse_garbage)
    (game_save)
    (sleep_until 
        (or
            (objects_can_see_object (players) "bfg_base" 30.0)
            (volume_test_players "vol_bfg_init")
        ) 
    1)
    (set g_bfg_longsword true)
    (sleep_until (volume_test_players "vol_bfg_init") 5)
    (ai_bring_forward (ai_get_object "cortana_office_arbiter/arbiter") 6.0)
    (ai_place "bfg_cov_banshees01")
    (cs_run_command_script "bfg_cov_banshees01" bfg_banshees_init_cs)
    (ai_disregard (ai_actors "bfg_cov_banshees01") true)
    (wake bfg_damage)
    (ai_set_objective "all_enemies" "bfg_cov_obj")
    (ai_set_objective "all_allies" "bfg_marines_obj")
    (sleep_until (volume_test_players "vol_bfg_init02") 5)
    (sleep_forever worker_marine_spawner)
    (ai_place "bfg_cov_grunts01")
    (ai_place "bfg_cov_grunts01b")
    (ai_place "bfg_cov01")
    (ai_place "bfg_cov03")
    (sleep 1)
    (ai_magically_see_object "bfg_cov_obj" (player0))
    (wake bfg_marine_spawner)
    (sleep_until (volume_test_players "vol_bfg_middle_hill"))
    (wake bfg_saves01)
    (ai_place "bfg_cov_grunts01c")
    (game_save)
    (sleep_until (volume_test_players "vol_bfg_entry"))
    (data_mine_set_mission_segment "040_101_bfg02")
    (sleep_forever bfg_marine_spawner)
    (wake bfg_marine_spawner02)
    (game_save)
    (ai_place "bfg_cov_grunts02a")
    (ai_place "bfg_cov_grunts02b")
    (ai_place "bfg_cov05")
    (sleep_until (<= (ai_task_count "bfg_cov_obj/inf_gate") 0))
    (sleep (* 30.0 4.0))
    (wake md_bfg_joh_hints)
)

(script dormant void bfg_cleanup
    (sleep_forever bfg_shoot)
    (sleep_forever bfg_saves01)
    (sleep_forever bfg_marine_spawner)
    (sleep_forever bfg_marine_spawner02)
    (sleep_forever bfg_banshees)
    (sleep 50)
    (print "killing ai")
    (ai_kill_silent "bfg_cov_obj")
)

(script command_script void warehouse_brute_run
    (cs_enable_pathfinding_failsafe true)
    (cs_force_combat_status ai_combat_status_active)
    (cs_go_to "warehouse/p2")
)

(script command_script void warehouse_brute_flee
    (cs_enable_targeting true)
    (cs_enable_moving true)
    (cs_enable_looking true)
    (sleep 50)
    (cs_enable_targeting false)
    (cs_enable_moving false)
    (cs_enable_looking false)
    (cs_enable_pathfinding_failsafe true)
    (cs_force_combat_status ai_combat_status_active)
    (cs_go_to "warehouse/p3")
    (sleep_forever)
)

(script dormant void gauss_nav_intro
    (sleep_until (volume_test_object "vol_intro_start" (ai_vehicle_get_from_starting_location "intro_hog/driver")))
    (if (>= (ai_living_count (ai_get_driver "intro_hog/driver")) 1) 
        (cs_run_command_script (ai_get_driver "intro_hog/driver") gauss_nav_intro_cs))
    (sleep_until 
        (and
            (or
                (volume_test_players "vol_tank_room_a_start")
                (= wave 2)
            )
            (>= (ai_living_count (ai_get_driver "intro_hog/driver")) 1)
        )
    )
    (print "player near switch")
    (cs_run_command_script (ai_get_driver "intro_hog/driver") abort)
    (sleep 10)
    (cs_run_command_script (ai_get_driver "intro_hog/driver") gauss_nav_intro02_cs)
)

(script dormant void gauss_nav_factory_a
    (sleep_until (> (device_get_position "factory_a_entry") 0.0))
    (sleep_until 
        (and
            (or
                (volume_test_players "vol_faa")
                (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "warthog_g" (players))
            )
            (>= (ai_living_count (ai_get_driver "intro_hog/driver")) 1)
        )
    )
    (print "player entered faa and hog has driver")
    (cs_run_command_script (ai_get_driver "intro_hog/driver") abort)
    (sleep 10)
    (cs_run_command_script (ai_get_driver "intro_hog/driver") gauss_nav_factorya01)
    (sleep_until (<= (device_get_position "factory_a_entry02") 0.0))
    (sleep_until 
        (and
            (>= (device_get_position "factory_a_entry02") 0.5)
            (>= (ai_living_count (ai_get_driver "intro_hog/driver")) 1)
        )
    )
    (print "player opened 2nd door and gauss has driver")
    (cs_run_command_script (ai_get_driver "intro_hog/driver") abort)
    (sleep 10)
    (cs_run_command_script (ai_get_driver "intro_hog/driver") gauss_nav_factorya01b)
    (sleep (random_range 0 30))
    (wake md_faa_door_go)
    (sleep_until 
        (and
            (> (device_get_position "factory_a_entry02") 0.0)
            (> (device_get_position "factory_a_middle") 0.0)
            (>= (ai_living_count (ai_get_driver "intro_hog/driver")) 1)
        )
    )
    (print "middle door open and hog has driver")
    (cs_run_command_script (ai_get_driver "intro_hog/driver") abort)
    (sleep 10)
    (cs_run_command_script (ai_get_driver "intro_hog/driver") gauss_nav_factorya01c)
    (sleep (random_range 0 30))
    (wake md_faa_door_go_02)
    (sleep_until 
        (and
            (> (device_get_position "factory_a_middle") 0.75)
            (>= (ai_living_count (ai_get_driver "intro_hog/driver")) 1)
        )
    )
    (print "cov falling back and hog has driver")
    (cs_run_command_script (ai_get_driver "intro_hog/driver") abort)
    (sleep 10)
    (cs_run_command_script (ai_get_driver "intro_hog/driver") gauss_nav_factorya02)
    (sleep_until 
        (and
            (<= (ai_living_count "factory_a_covenant_obj") 8)
            (>= (ai_living_count (ai_get_driver "intro_hog/driver")) 1)
        )
    )
    (print "factory a cov most dead and gauss has driver")
    (cs_run_command_script (ai_get_driver "intro_hog/driver") abort)
    (sleep 10)
    (cs_run_command_script (ai_get_driver "intro_hog/driver") gauss_nav_factorya03)
)

(script command_script void gauss_nav_intro_cs
    (cs_abort_on_vehicle_exit true)
    (cs_abort_on_damage true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (print "moving gausshog into entry position")
    (cs_vehicle_speed 0.5)
    (cs_go_to "intro_pts/gauss00")
    (cs_go_to "intro_pts/gauss01")
    (vehicle_unload (ai_vehicle_get ai_current_actor) warthog_p)
    (wake intro_move_hud)
    (sleep_forever)
)

(script command_script void gauss_nav_intro02_cs
    (cs_abort_on_damage true)
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (print "moving gausshog into entry position pt2")
    (cs_vehicle_speed 0.3)
    (cs_go_to "intro_pts/gauss01b" 2.0)
    (sleep_until (<= (ai_living_count (ai_get_driver "intro_hog/driver")) 0))
    (print "aborting command script")
    (cs_run_command_script ai_current_actor abort)
)

(script command_script void gauss_nav_factorya01
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (sleep 30)
    (print "moving gausshog into factorya")
    (cs_vehicle_speed 0.2)
    (cs_go_to "intro_pts/gauss02" 2.0)
    (cs_go_to "factory_arm_a/gauss01")
    (cs_go_to "factory_arm_a/gauss02")
    (sleep 30)
    (ai_set_deaf "factory_a_covenant_obj/faa_cov_init" false)
    (sleep_forever)
)

(script command_script void gauss_nav_factorya01b
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (sleep (random_range 10 70))
    (print "moving gausshog into factorya pt2")
    (cs_vehicle_speed 0.3)
    (cs_go_to "factory_arm_a/gauss01b")
    (sleep_forever)
)

(script command_script void gauss_nav_factorya01c
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (sleep (random_range 10 70))
    (print "moving gausshog into factorya pt3")
    (cs_vehicle_speed 0.2)
    (cs_go_to "factory_arm_a/gauss01c")
    (sleep_forever)
)

(script command_script void gauss_nav_factorya02
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (sleep (random_range 10 70))
    (print "moving gausshog into factorya pt4")
    (cs_vehicle_speed 0.2)
    (cs_go_to "factory_arm_a/gauss03")
    (sleep_forever)
)

(script command_script void gauss_nav_factorya03
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (sleep (random_range 0 30))
    (print "moving gausshog to end of factory a")
    (cs_vehicle_speed 0.3)
    (cs_go_to "factory_arm_a/gauss04")
    (sleep_forever)
)

(script dormant void gauss_reserve
    (vehicle_unload (ai_vehicle_get_from_starting_location "intro_hog/driver") none)
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "intro_hog/driver") true)
    (sleep_until 
        (or
            (volume_test_players "vol_lakebed_a_end")
            (unit_in_vehicle (unit (player0)))
        )
    )
    (print "un-reserving gauss hog")
    (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "intro_hog/driver") false)
)

(script command_script void gauss_nav_lakea_init
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.2)
    (cs_go_to "lakebed_a/gauss01" 1.0)
    (cs_go_to "lakebed_a/gauss01b" 1.0)
    (sleep_forever)
)

(script command_script void gauss_nav_lakea_top
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_vehicle_speed 0.5)
    (sleep 30)
    (if (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "warthog_d" (players)) 
        (cs_run_command_script ai_current_actor abort))
    (if (volume_test_objects "vol_lake_a_bed" (ai_vehicle_get_from_starting_location "intro_hog/driver")) 
        (cs_run_command_script ai_current_actor gauss_nav_lakea_bed))
    (if (not (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "warthog_d" (ai_actors ai_current_actor))) 
        (begin
            (sleep_until (volume_test_objects "vol_lake_a_topback" (ai_vehicle_get_from_starting_location "intro_hog/driver")))
            (if (<= (ai_task_status "lakebed_a_covenant_obj/center_flank") ai_task_status_inactive) 
                (begin
                    (cs_enable_targeting true)
                    (cs_enable_looking true)
                )
            )
            (sleep_until (>= (ai_task_status "lakebed_a_covenant_obj/center_flank") ai_task_status_exhausted))
            (cs_enable_targeting false)
            (cs_enable_looking false)
            (sleep_until (volume_test_objects "vol_lake_a_topback02" (ai_vehicle_get_from_starting_location "intro_hog/driver")))
            (cs_run_command_script ai_current_actor abort)
        )
    )
    (if (volume_test_objects "vol_faa" (ai_vehicle_get_from_starting_location "intro_hog/driver")) 
        (cs_go_to "lakebed_a/gauss01"))
    (if (<= (ai_task_status "lakebed_a_covenant_obj/center_flank") ai_task_status_inactive) 
        (cs_go_to "lakebed_a/gauss02"))
    (if (>= (ai_task_count "lakebed_a_covenant_obj/center_flank_fallback") 1) 
        (cs_go_to "lakebed_a/gauss07"))
    (if (not (volume_test_objects "vol_lakebed_a_bridge" (ai_vehicle_get_from_starting_location "intro_hog/driver"))) 
        (begin
            (print "gauss hog moving to bridge")
            (cs_go_to "lakebed_a/gauss04")
            (cs_go_to "lakebed_a/gauss03" 1.0)
            (cs_enable_targeting true)
            (cs_enable_looking true)
            (sleep_until 
                (or
                    (volume_test_players "vol_lakebed_a_end")
                    (volume_test_players "vol_lake_a_bed")
                    (any_players_in_vehicle)
                )
            )
        )
    )
)

(script command_script void gauss_nav_lakea_bed
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep 30)
    (if (vehicle_test_seat_list (ai_vehicle_get_from_starting_location "intro_hog/driver") "warthog_d" (players)) 
        (cs_run_command_script ai_current_actor abort))
    (cs_go_to "lakebed_a/gauss04")
    (cs_go_to "lakebed_a/gauss03")
)

(script command_script void gauss_nav_factoryb01
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (print "moving gausshog into facory b entry position")
    (cs_go_to "lakebed_a/gauss_end")
    (cs_vehicle_speed 0.8)
    (cs_go_to "factory_b/gauss01")
    (sleep_until (<= (ai_living_count (ai_get_driver "intro_hog/driver")) 0))
    (print "aborting command script")
    (cs_run_command_script ai_current_actor abort)
)

(script command_script void gauss_nav_factoryb02
    (cs_abort_on_vehicle_exit true)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_ignore_obstacles true)
    (cs_vehicle_speed 0.6)
    (print "moving gausshog into facory b center")
    (cs_go_to "factory_b/gauss01")
    (cs_vehicle_speed 0.4)
    (cs_go_to "factory_b/gauss02")
)

(script command_script void hog_speed
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_vehicle_speed 0.7)
    (sleep_forever)
)

(script dormant void objective_1_set
    (sleep 30)
    (print "new objective set:")
    (print "located and eliminate anti_air wraith in the 1st area")
    (objectives_show_up_to 0)
    (cinematic_set_chud_objective "obj_0")
)

(script dormant void objective_1_clear
    (print "objective complete:")
    (print "located and eliminate anti_air wraith in the 1st area")
    (objectives_finish_up_to 0)
)

(script dormant void objective_2_set
    (sleep 30)
    (print "new objective set:")
    (print "located and eliminate anti_air wraith in the 2nd area")
    (objectives_show_up_to 1)
    (cinematic_set_chud_objective "obj_1")
)

(script dormant void objective_2_clear
    (print "objective complete:")
    (print "located and eliminate anti_air wraith in the 2nd area")
    (objectives_finish_up_to 1)
)

(script dormant void objective_3_set
    (sleep 30)
    (print "new objective set:")
    (print "destroy covenant scarab")
    (objectives_show_up_to 2)
    (cinematic_set_chud_objective "obj_2")
)

(script dormant void objective_3_clear
    (print "objective complete:")
    (print "destroy covenant scarab")
    (objectives_finish_up_to 2)
)

(script dormant void objective_4_set
    (sleep 30)
    (print "new objective set:")
    (print "destroy conenant air defense cannon")
    (objectives_show_up_to 3)
    (cinematic_set_chud_objective "obj_3")
)

(script dormant void objective_4_clear
    (print "objective complete:")
    (print "destroy conenant air defense cannon")
    (objectives_finish_up_to 3)
)

(script dormant void intro_nav_exit
    (sleep_until (> (device_get_position "factory_a_entry") 0.0) 30 (* 120.0 30.0))
    (if (not (> (device_get_position "factory_a_entry") 0.0)) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_intro_exit" 0.0)
            (sleep_until (> (device_get_position "factory_a_entry") 0.0) 1)
            (hud_deactivate_team_nav_point_flag player "nav_intro_exit")
        )
    )
)

(script dormant void faa_nav_exit
    (sleep_until 
        (or
            (> (device_get_position "lakebed_a_entry_door") 0.0)
            (<= (ai_living_count "all_enemies") 0)
        )
    )
    (sleep_until (> (device_get_position "lakebed_a_entry_door") 0.0) 30 (* 120.0 30.0))
    (if (not (> (device_get_position "lakebed_a_entry_door") 0.0)) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_faa_exit" 0.0)
            (sleep_until (> (device_get_position "lakebed_a_entry_door") 0.0) 1)
            (hud_deactivate_team_nav_point_flag player "nav_faa_exit")
        )
    )
)

(script dormant void laa_nav_exit
    (sleep_until (<= (ai_living_count "lakebed_a_covenant_obj") 5))
    (if (not (volume_test_players "vol_lakebed_a")) 
        (sleep_forever))
    (sleep_until (volume_test_players "vol_drive_lakedbed_a_end") 30 (* 120.0 30.0))
    (if 
        (and
            (volume_test_players "vol_lakebed_a")
            (not (volume_test_players "vol_drive_lakedbed_a_end"))
        ) 
            (begin
                (hud_activate_team_nav_point_flag player "nav_laa_exit" 0.0)
                (sleep_until (volume_test_players "vol_drive_lakedbed_a_end"))
                (hud_deactivate_team_nav_point_flag player "nav_laa_exit")
            )
    )
)

(script dormant void lake_b_nav_exit
    (sleep_until (volume_test_players "vol_office_start") 30 (* 30.0 50.0))
    (if (not (volume_test_players "vol_office_start")) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_lake_b_exit" 0.0)
            (sleep_until (volume_test_players "vol_office_start") 5)
            (hud_deactivate_team_nav_point_flag player "nav_lake_b_exit")
        )
    )
)

(script dormant void ware_nav_exit
    (sleep_until (>= (ai_living_count "ware_cov_hunters") 1) 30 (* 30.0 50.0))
    (if (not (>= (ai_living_count "ware_cov_hunters") 1)) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_ware_exit" 0.0)
            (sleep_until (>= (ai_living_count "ware_cov_hunters") 1) 5)
            (hud_deactivate_team_nav_point_flag player "nav_ware_exit")
        )
    )
    (sleep_until (<= (ai_living_count "ware_cov_hunters") 0))
    (if (volume_test_players "vol_warehouse_backhalf") 
        (begin
            (sleep_until (volume_test_players "vol_ware_nav_exit") 5 (* 30.0 50.0))
            (if (not (volume_test_players "vol_ware_nav_exit")) 
                (begin
                    (hud_activate_team_nav_point_flag player "nav_ware_exit" 0.0)
                    (sleep_until (volume_test_players "vol_ware_nav_exit") 5)
                    (hud_deactivate_team_nav_point_flag player "nav_ware_exit")
                )
            )
        )
    )
)

(script dormant void object_management
    (sleep_until (> (player_count) 0) 1)
    (if (= (current_zone_set_fully_active) 0) 
        (begin
            (object_create_folder "scenery_intro")
            (object_create_folder "crates_intro")
            (object_create_folder "vehicles_intro")
            (object_create_folder "effects_intro")
            (object_destroy_folder "effects_laa")
            (object_destroy_folder "effects_worker")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 1) 1)
    (if (= (current_zone_set_fully_active) 1) 
        (begin
            (object_create_folder "scenery_faa")
            (object_create_folder "crates_faa")
            (object_destroy_folder "effects_intro")
            (object_destroy_folder "effects_worker")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 2) 1)
    (if (= (current_zone_set_fully_active) 2) 
        (begin
            (object_create_folder "scenery_laa")
            (object_create_folder "crates_laa")
            (object_destroy_folder "effects_intro")
            (object_create_folder "effects_worker")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 3) 1)
    (if (= (current_zone_set_fully_active) 3) 
        (begin
            (object_destroy_folder "scenery_intro")
            (object_destroy_folder "crates_intro")
            (object_destroy_folder "vehicles_intro")
            (object_destroy_folder "effects_intro")
            (sleep 1)
            (object_create_folder "scenery_fab")
            (object_create_folder "crates_fab")
            (object_destroy_folder "effects_intro")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 5) 1)
    (if (= (current_zone_set_fully_active) 5) 
        (begin
            (object_destroy_folder "scenery_faa")
            (object_destroy_folder "crates_faa")
            (object_destroy_folder "scenery_laa")
            (object_destroy_folder "crates_laa")
            (object_destroy_folder "effects_laa")
            (sleep 1)
            (object_create_folder "scenery_lab")
            (object_create_folder "crates_lab")
            (object_destroy_folder "effects_intro")
            (object_destroy_folder "effects_laa")
            (object_destroy_folder "effects_worker")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 6) 1)
    (if (= (current_zone_set_fully_active) 6) 
        (begin
            (object_destroy_folder "scenery_fab")
            (object_destroy_folder "crates_fab")
            (sleep 1)
            (object_create_folder "scenery_office")
            (object_create_folder "crates_office")
            (object_create_folder "effects_worker")
            (object_destroy_folder "effects_intro")
            (object_destroy_folder "effects_laa")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 7) 1)
    (if (= (current_zone_set_fully_active) 7) 
        (begin
            (object_destroy_folder "scenery_lab")
            (object_destroy_folder "crates_lab")
            (sleep 1)
            (object_create_folder "scenery_ware")
            (object_create_folder "crates_ware")
            (object_destroy_folder "effects_intro")
            (object_destroy_folder "effects_laa")
            (object_destroy_folder "effects_worker")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 8) 1)
    (if (= (current_zone_set_fully_active) 8) 
        (begin
            (object_destroy_folder "scenery_office")
            (object_destroy_folder "crates_office")
            (sleep 1)
            (object_create_folder "scenery_worker")
            (object_create_folder "crates_worker")
            (object_create_folder "effects_worker")
            (object_destroy_folder "effects_intro")
            (object_destroy_folder "effects_laa")
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 9) 1)
    (if (= (current_zone_set_fully_active) 9) 
        (begin
            (object_destroy_folder "scenery_ware")
            (object_destroy_folder "crates_ware")
            (object_destroy_folder "effects_intro")
            (object_destroy_folder "effects_laa")
        )
    )
)

(script static void start
    (fade_out 0.0 0.0 0.0 0)
    (cond
        ((= (game_insertion_point_get) 0)
            (ins_intro)
        )
        ((= (game_insertion_point_get) 1)
            (ins_scarab)
        )
    )
)

(script startup void mission_voi
    (print_difficulty)
    (fade_out 0.0 0.0 0.0 0)
    (sound_class_set_gain "" 0.0 0)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (ai_allegiance covenant player)
    (ai_allegiance player covenant)
    (ai_allegiance human player)
    (ai_allegiance player human)
    (ai_allegiance covenant human)
    (ai_allegiance human covenant)
    (game_can_use_flashlights true)
    (chud_show_fire_grenades false)
    (wake gs_camera_bounds)
    (wake object_management)
    (player_disable_movement false)
    (zone_set_trigger_volume_enable "begin_zone_set:faa_lakea" false)
    (zone_set_trigger_volume_enable "zone_set:faa_lakea" false)
    (zone_set_trigger_volume_enable "begin_zone_set:fab_lakeb" false)
    (zone_set_trigger_volume_enable "begin_zone_set:scarab" false)
    (zone_set_trigger_volume_enable "begin_zone_set:bfg" false)
    (zone_set_trigger_volume_enable "begin_zone_set:ware_worker" false)
    (zone_set_trigger_volume_enable "zone_set:ware_worker" false)
    (kill_volume_disable "kill_all_lakebed_a")
    (kill_volume_disable "kill_bfg_cin_start")
    (if 
        (and
            (not editor)
            (> (player_count) 0)
        ) 
            (start) (begin
                (cinematic_fade_to_gameplay)
                (gs_camera_bounds_off)
            )
    )
    (sleep_until (>= g_insertion_index 1) 1)
    (if (<= g_insertion_index 1) 
        (wake intro))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 1)
            (>= g_insertion_index 2)
        ) 
    1)
    (if (<= g_insertion_index 2) 
        (wake factory_a_start))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 2)
            (>= g_insertion_index 3)
        ) 
    1)
    (if (<= g_insertion_index 3) 
        (wake lakebed_a_start))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 3)
            (>= g_insertion_index 4)
        ) 
    1)
    (if (<= g_insertion_index 4) 
        (wake factory_b_start))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 5)
            (>= g_insertion_index 5)
        ) 
    1)
    (if (<= g_insertion_index 5) 
        (wake lakebed_b_start))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 6)
            (>= g_insertion_index 6)
        ) 
    1)
    (if (<= g_insertion_index 6) 
        (wake scarab_start))
    (sleep_until 
        (or
            g_scarab_dead
            (>= g_insertion_index 7)
        ) 
    1)
    (if (<= g_insertion_index 7) 
        (wake cortana_office_start))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 7)
            (>= g_insertion_index 8)
        ) 
    1)
    (if (<= g_insertion_index 8) 
        (wake warehouse_start))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 8)
            (>= g_insertion_index 9)
        ) 
    1)
    (if (<= g_insertion_index 9) 
        (wake worker_start))
    (sleep_until 
        (or
            (= (current_zone_set_fully_active) 9)
            (>= g_insertion_index 10)
        ) 
    1)
    (if (<= g_insertion_index 10) 
        (wake bfg_start))
)

(script dormant void gs_camera_bounds
    (gs_camera_bounds_on)
    (sleep_until 
        (or
            (volume_test_players "vol_tank_room_a_exit")
            (<= (ai_task_count "factory_a_covenant_obj/tank_room_combat01") 1)
        )
    )
    (soft_ceiling_enable "camera_fa_01" false)
    (sleep_until (volume_test_players "vol_factory_b_init"))
    (sleep_until 
        (or
            (volume_test_players "vol_factory_b_buginit")
            (and
                (>= (device_get_position "factory_b_entry02") 1.0)
                (volume_test_players "vol_factory_b_buginit02")
            )
        )
    )
    (soft_ceiling_enable "camera_fb_01" false)
)

(script static void gs_camera_bounds_off
    (print "turn off camera bounds")
    (soft_ceiling_enable "camera_fa_01" false)
    (soft_ceiling_enable "camera_fb_01" false)
)

(script static void gs_camera_bounds_on
    (print "turn on camera bounds")
    (soft_ceiling_enable "camera_fa_01" true)
    (soft_ceiling_enable "camera_fb_01" true)
)

(script dormant void gs_cinematic_lights
    (cinematic_light_object "ark" "" lighting_ark "light_anchor")
    (cinematic_light_object "ark_cruiser_01" "" lighting_ships "light_anchor")
    (cinematic_light_object "ark_cruiser_02" "" lighting_ships "light_anchor")
    (cinematic_light_object "truth_ship" "" lighting_ships "light_anchor")
    (cinematic_light_object "storm" "" lighting_storm "light_anchor")
    (cinematic_light_object "clouds_ark" "" lighting_clouds "light_anchor")
    (cinematic_lighting_rebuild_all)
)

(script static void teleport_factorya
    (set g_insertion_index 2)
    (switch_zone_set "intro_faa")
    (sleep 1)
    (object_create_folder "scenery_intro")
    (object_create_folder "crates_intro")
    (object_create_folder "scenery_faa")
    (object_create_folder "crates_faa")
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_factorya_player0")
    (object_teleport (player1) "teleport_factorya_player1")
    (object_teleport (player2) "teleport_factorya_player2")
    (object_teleport (player3) "teleport_factorya_player3")
    (sleep 1)
    (ai_place "intro_hog")
    (ai_place "test_factorya_init_allies" 5)
    (sleep 1)
    (object_teleport (ai_vehicle_get_from_starting_location "intro_hog/driver") "teleport_factorya_hog")
    (sleep 1)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_d (list_get (ai_actors "test_factorya_init_allies") 0))
    (sleep 1)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_g (list_get (ai_actors "test_factorya_init_allies") 0))
)

(script static void teleport_lakebeda
    (set g_insertion_index 3)
    (switch_zone_set "faa_lakea")
    (sleep 1)
    (object_create_folder "scenery_intro")
    (object_create_folder "crates_intro")
    (object_create_folder "scenery_faa")
    (object_create_folder "crates_faa")
    (object_create_folder "scenery_laa")
    (object_create_folder "crates_laa")
    (sleep 1)
    (device_set_power "lakebed_a_entry_switch" 1.0)
    (print "teleport players")
    (object_teleport (player0) "teleport_lakebeda_player0")
    (object_teleport (player1) "teleport_lakebeda_player1")
    (object_teleport (player2) "teleport_lakebeda_player2")
    (object_teleport (player3) "teleport_lakebeda_player3")
    (sleep 1)
    (ai_place "intro_hog")
    (ai_place "test_lakea_init_allies" 5)
    (ai_place "tank_a_cov_ghosts" 2)
    (sleep 1)
    (object_teleport (ai_vehicle_get_from_starting_location "intro_hog/driver") "teleport_lakea_hog")
    (sleep 1)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_d (list_get (ai_actors "test_lakea_init_allies") 0))
    (sleep 1)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_g (list_get (ai_actors "test_lakea_init_allies") 0))
)

(script static void teleport_factoryb
    (set g_insertion_index 4)
    (switch_zone_set "faa_lakea_fab")
    (sleep 1)
    (object_create_folder "scenery_faa")
    (object_create_folder "crates_faa")
    (object_create_folder "scenery_laa")
    (object_create_folder "crates_laa")
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_factoryb_player0")
    (object_teleport (player1) "teleport_factoryb_player1")
    (object_teleport (player2) "teleport_factoryb_player2")
    (object_teleport (player3) "teleport_factoryb_player3")
    (sleep 1)
    (ai_place "intro_hog")
    (ai_place "test_factoryb_init_allies" 3)
    (sleep 1)
    (object_teleport (ai_vehicle_get_from_starting_location "intro_hog/driver") "teleport_factoryb_hog")
    (sleep 1)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_d (list_get (ai_actors "test_factoryb_init_allies") 0))
    (sleep 1)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "intro_hog/driver") warthog_g (list_get (ai_actors "test_factoryb_init_allies") 0))
    (device_set_position "factory_b_entry_door" 1.0)
)

(script static void teleport_factorybend
    (fade_in 0.0 0.0 0.0 0)
    (ai_erase_all)
    (switch_zone_set "lakea_fab_lakeb")
    (sleep 1)
    (object_teleport (player0) "factoryb_point03")
    (ai_place "factory_b_allies01")
    (ai_place "factory_b_injured")
    (sleep 1)
    (garbage_collect_now)
    (sleep 1)
    (sleep_forever intro)
    (sleep_forever intro_flyby)
    (sleep_forever factory_a_start)
    (sleep_forever lakebed_a_start)
    (sleep_forever br_int_01)
    (sleep_forever md_int_dead_01)
    (sleep_forever md_int_dead_02)
    (set g_playing_dialogue false)
    (sleep_until (volume_test_players "vol_factory_b_buginit"))
    (game_save)
    (wake bugger_spawn)
    (device_set_position "tank_room_b_exit02" 1.0)
    (sleep_until (volume_test_players "vol_factory_b_tunnel"))
    (print "mongoose intro")
    (ai_place "factory_b_allies_goose_init")
    (cs_run_command_script "factory_b_allies_goose_init" pause_forever)
    (ai_place "factory_b_allies_goose_pass")
    (sleep_until (volume_test_players "vol_factory_b_tunnel_end"))
    (device_set_position "factory_b_middle" 0.0)
    (sleep_forever bugger_spawn)
    (wake lakebed_b_start)
    (wake objective_3_clear)
    (wake md_fab_goose)
    (wake objective_4_set)
    (sleep 60)
    (game_save)
    (ai_vehicle_enter "factory_b_allies_goose_pass/rocket01" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_p)
    (ai_vehicle_enter "factory_b_allies_goose_pass/rocket02" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") mongoose_p)
    (ai_vehicle_enter "factory_b_allies_goose_pass/sniper01" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") mongoose_p)
    (ai_vehicle_enter "factory_b_allies_goose_pass/sniper02" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose04") mongoose_p)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_d true)
)

(script static void teleport_lakebedb
    (set g_insertion_index 5)
    (switch_zone_set "fab_lakeb")
    (sleep 1)
    (object_create_folder "scenery_fab")
    (object_create_folder "crates_fab")
    (object_create_folder "scenery_lab")
    (object_create_folder "crates_lab")
    (device_group_set_immediate "factory_b_middle_buttons" 1.0)
    (device_set_position_immediate "lakebed_b_entry_door" 1.0)
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_lakebedb_player0")
    (object_teleport (player1) "teleport_lakebedb_player1")
    (object_teleport (player2) "teleport_lakebedb_player2")
    (object_teleport (player3) "teleport_lakebedb_player3")
    (sleep 1)
    (ai_place "test_lake_b_hog")
    (ai_place "factory_b_allies_goose_init")
    (cs_run_command_script "factory_b_allies_goose_init" pause_forever)
    (cs_run_command_script "factory_b_allies_goose_init/goose04" abort)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_d true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") mongoose_p true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") mongoose_p true)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_p true)
    (ai_place "factory_b_allies_goose_pass")
    (ai_vehicle_enter "factory_b_allies_goose_pass/rocket02" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose04") mongoose_p)
    (wake md_fab_goose)
    (game_save)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") mongoose_p false)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") mongoose_p false)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_p false)
    (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose04") mongoose_p false)
    (ai_vehicle_enter "factory_b_allies_goose_pass/rocket01" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose03") mongoose_p)
    (ai_vehicle_enter "factory_b_allies_goose_pass/sniper01" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose02") mongoose_p)
    (ai_vehicle_enter "factory_b_allies_goose_pass/sniper02" (ai_vehicle_get_from_starting_location "factory_b_allies_goose_init/goose01") mongoose_p)
)

(script static void teleport_scarab
    (set g_insertion_index 6)
    (switch_zone_set "scarab")
    (sleep 1)
    (object_create_folder "scenery_lab")
    (object_create_folder "crates_lab")
    (wake lakeb_bfg_go)
    (device_set_position_immediate "lakebed_b_entry_door" 0.0)
    (wake crane_ctrl)
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_scarab_player0")
    (object_teleport (player1) "teleport_scarab_player1")
    (object_teleport (player2) "teleport_scarab_player2")
    (object_teleport (player3) "teleport_scarab_player3")
    (sleep 1)
)

(script static void warp_left
    (object_teleport (player0) "scarab_start_left")
    (cs_run_command_script "scarab/driver01" scarab_present_left)
)

(script static void warp_right
    (object_teleport (player0) "scarab_start_right")
    (cs_run_command_script "scarab/driver01" scarab_present_right)
)

(script static void teleport_office
    (set g_insertion_index 7)
    (switch_zone_set "scarab")
    (sleep 1)
    (object_create_folder "scenery_lab")
    (object_create_folder "crates_lab")
    (object_create_folder "scenery_ware")
    (object_create_folder "crates_ware")
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_office_player0")
    (object_teleport (player1) "teleport_office_player1")
    (object_teleport (player2) "teleport_office_player2")
    (object_teleport (player3) "teleport_office_player3")
    (sleep 1)
    (device_set_position_immediate "lakebed_b_entry_door" 0.0)
    (wake crane_ctrl)
)

(script static void teleport_warehouse
    (set g_insertion_index 8)
    (switch_zone_set "ware")
    (sleep 1)
    (object_create_folder "scenery_ware")
    (object_create_folder "crates_ware")
    (object_create_folder "scenery_worker")
    (object_create_folder "crates_worker")
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_warehouse_player0")
    (object_teleport (player1) "teleport_warehouse_player1")
    (object_teleport (player2) "teleport_warehouse_player2")
    (object_teleport (player3) "teleport_warehouse_player3")
    (sleep 1)
    (ai_place "test_ware_arbiter")
)

(script static void teleport_hunters
    (fade_in 0.0 0.0 0.0 0)
    (ai_erase_all)
    (switch_zone_set "ware_worker")
    (sleep 1)
    (object_teleport (player0) "teleport_hunters")
    (sleep 1)
    (garbage_collect_now)
    (game_save_immediate)
    (sleep 1)
    (sleep_forever intro)
    (sleep_forever intro_flyby)
    (sleep_forever factory_a_start)
    (sleep_forever lakebed_a_start)
    (sleep_forever br_int_01)
    (sleep_forever md_int_dead_01)
    (sleep_forever md_int_dead_02)
    (set g_playing_dialogue false)
    (wake warehouse_marine_spawner)
    (ai_place "ware_cov_brutes02/chief")
    (sleep_until (volume_test_players "vol_warehouse_hunters01"))
    (ai_set_objective "all_enemies" "worker_cov_obj")
    (sleep 1)
    (print "hunters")
    (sleep 60)
    (cs_run_command_script "ware_cov_brutes02/chief" warehouse_chieftain_cs)
    (game_save)
    (sleep_until (volume_test_players "vol_worker_start"))
    (wake worker_start)
    (sleep_until (<= (ai_living_count "ware_cov_hunters") 0))
    (game_save)
)

(script static void teleport_worker
    (set g_insertion_index 9)
    (switch_zone_set "ware_worker")
    (sleep 1)
    (object_create_folder "scenery_ware")
    (object_create_folder "crates_ware")
    (object_create_folder "scenery_worker")
    (object_create_folder "crates_worker")
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_worker_player0")
    (object_teleport (player1) "teleport_worker_player1")
    (object_teleport (player2) "teleport_worker_player2")
    (object_teleport (player3) "teleport_worker_player3")
    (sleep 1)
)

(script static void teleport_bfg
    (switch_zone_set "ware_worker")
    (sleep 1)
    (object_create_folder "scenery_ware")
    (object_create_folder "crates_ware")
    (object_create_folder "scenery_worker")
    (object_create_folder "crates_worker")
    (sleep 1)
    (print "teleport players")
    (object_teleport (player0) "teleport_bfg_player0")
    (object_teleport (player1) "teleport_bfg_player1")
    (object_teleport (player2) "teleport_bfg_player2")
    (object_teleport (player3) "teleport_bfg_player3")
    (sleep 1)
    (ai_place "bfg_marines01")
    (wake bfg_go)
    (sleep_until (= (current_zone_set_fully_active) 9) 1)
    (set g_insertion_index 10)
)

(script static void glass_test
    (switch_zone_set "faa_lakea_fab")
    (sleep 1)
    (object_teleport (player0) "teleport_glass_test")
    (object_create "bugger_glass_break")
)

(script static void objects
    (print "placing all objects")
    (object_create_folder "scenery_intro")
    (object_create_folder "crates_intro")
    (object_create_folder "scenery_faa")
    (object_create_folder "crates_faa")
    (object_create_folder "scenery_laa")
    (object_create_folder "crates_laa")
    (object_create_folder "scenery_fab")
    (object_create_folder "crates_fab")
    (object_create_folder "scenery_lab")
    (object_create_folder "crates_lab")
    (object_create_folder "scenery_office")
    (object_create_folder "crates_office")
    (object_create_folder "scenery_ware")
    (object_create_folder "crates_ware")
    (object_create_folder "scenery_worker")
    (object_create_folder "crates_worker")
)

(script static void !040lb00_shoulder_roll_sc_sh1
    (begin
        (device_set_position_immediate "ark" 0.0)
        (render_weather false)
        (object_destroy "portal")
        (object_create_anew "storm")
        (object_destroy "ark_open")
        (object_destroy "bfg_base")
        (object_destroy "ark")
        (object_destroy "truth_ship")
        (cinematic_light_object "ark" "" lighting_ark "light_anchor")
        (cinematic_light_object "storm_no_lightning" "" lighting_storm "light_anchor")
        (cinematic_lighting_rebuild_all)
        (fade_in 0.0 0.0 0.0 90)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 (cinematic_object_get_unit "cin_arbiter") "040lb00_cin_arbiter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 (cinematic_object_get_unit "cin_chief") "040lb00_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 (cinematic_object_get_scenery "cin_assault_rifle") "040lb00_cin_assault_rifle_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 (cinematic_object_get_scenery "cin_bfg_stand") "040lb00_cin_bfg_stand_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 (cinematic_object_get_scenery "cin_longsword1") "040lb00_cin_longsword1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 (cinematic_object_get_scenery "cin_longsword2") "040lb00_cin_longsword2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 (cinematic_object_get_scenery "cin_longsword3") "040lb00_cin_longsword3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 (cinematic_object_get_scenery "cin_bfg_gun") "040lb00_cin_bfg_gun_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -0.2 0.0)
    (cinematic_scripting_start_effect 0 0 0 0 (cinematic_object_get "cin_bfg_stand"))
    (begin
        (cinematic_light_object "ark" "" lighting_ark "light_anchor")
        (cinematic_light_object "storm" "" lighting_storm "light_anchor")
        (cinematic_lighting_rebuild_all)
    )
    (cinematic_print "custom script play")
    (cinematic_scripting_start_effect 0 0 0 1 (cinematic_object_get "cin_bfg_stand"))
    (sleep 1)
    (cinematic_scripting_start_music 0 0 0 1)
    (sleep 12)
    (cinematic_scripting_start_music 0 0 0 0)
    (sleep 27)
    (cinematic_scripting_start_effect 0 0 0 2 (cinematic_object_get "cin_bfg_stand"))
    (sleep 551)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb00_shoulder_roll_sc
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "music" 1.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
    )
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (!040lb00_shoulder_roll_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 0 0 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 0 0 1 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 0 2 (cinematic_object_get_scenery "cin_assault_rifle"))
    (cinematic_scripting_destroy_object 0 0 3 (cinematic_object_get_scenery "cin_bfg_stand"))
    (cinematic_scripting_destroy_object 0 0 4 (cinematic_object_get_scenery "cin_longsword1"))
    (cinematic_scripting_destroy_object 0 0 5 (cinematic_object_get_scenery "cin_longsword2"))
    (cinematic_scripting_destroy_object 0 0 6 (cinematic_object_get_scenery "cin_longsword3"))
    (cinematic_scripting_destroy_object 0 0 7 (cinematic_object_get_scenery "cin_bfg_gun"))
)

(script static void !040lb02_human_fleet_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 0 (cinematic_object_get_scenery "cin_longsword1") "040lb02_cin_longsword1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_scenery "cin_longsword2") "040lb02_cin_longsword2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_longsword3") "040lb02_cin_longsword3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 3 (cinematic_object_get_scenery "cin_longsword4") "040lb02_cin_longsword4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 4 (cinematic_object_get_scenery "cin_longsword5") "040lb02_cin_longsword5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 5 (cinematic_object_get_scenery "cin_longsword6") "040lb02_cin_longsword6_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 6 (cinematic_object_get_scenery "cin_longsword7") "040lb02_cin_longsword7_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 7 (cinematic_object_get_scenery "cin_longsword8") "040lb02_cin_longsword8_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 8 (cinematic_object_get_scenery "cin_longsword9") "040lb02_cin_longsword9_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 9 (cinematic_object_get_scenery "cin_longsword10") "040lb02_cin_longsword10_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 10 (cinematic_object_get_scenery "cin_longsword11") "040lb02_cin_longsword11_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 11 (cinematic_object_get_scenery "cin_longsword12") "040lb02_cin_longsword12_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 12 (cinematic_object_get_scenery "cin_longsword13") "040lb02_cin_longsword13_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 13 (cinematic_object_get_scenery "cin_longsword14") "040lb02_cin_longsword14_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 14 (cinematic_object_get_scenery "cin_longsword15") "040lb02_cin_longsword15_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 15 (cinematic_object_get_scenery "cin_longsword16") "040lb02_cin_longsword16_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 16 (cinematic_object_get_scenery "cin_longsword17") "040lb02_cin_longsword17_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 17 (cinematic_object_get_scenery "cin_longsword18") "040lb02_cin_longsword18_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 18 (cinematic_object_get_scenery "cin_longsword19") "040lb02_cin_longsword19_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 19 (cinematic_object_get_scenery "cin_longsword20") "040lb02_cin_longsword20_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 20 (cinematic_object_get_scenery "cin_longsword21") "040lb02_cin_longsword21_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 21 (cinematic_object_get_scenery "cin_longsword22") "040lb02_cin_longsword22_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 22 (cinematic_object_get_scenery "cin_longsword23") "040lb02_cin_longsword23_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 23 (cinematic_object_get_scenery "cin_longsword24") "040lb02_cin_longsword24_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 24 (cinematic_object_get_scenery "cin_longsword25") "040lb02_cin_longsword25_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 25 (cinematic_object_get_scenery "cin_longsword26") "040lb02_cin_longsword26_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 26 (cinematic_object_get_scenery "cin_longsword27") "040lb02_cin_longsword27_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 27 (cinematic_object_get_scenery "cin_longsword28") "040lb02_cin_longsword28_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 28 (cinematic_object_get_scenery "cin_longsword29") "040lb02_cin_longsword29_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 29 (cinematic_object_get_scenery "cin_longsword30") "040lb02_cin_longsword30_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 30 (cinematic_object_get_scenery "cin_longsword31") "040lb02_cin_longsword1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 31 (cinematic_object_get_scenery "cin_longsword32") "040lb02_cin_longsword32_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 32 (cinematic_object_get_scenery "cin_longsword33") "040lb02_cin_longsword33_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 33 (cinematic_object_get_scenery "cin_longsword34") "040lb02_cin_longsword34_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 34 (cinematic_object_get_scenery "cin_longsword35") "040lb02_cin_longsword35_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 35 (cinematic_object_get_unit "cin_chief") "040lb02_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 36 (cinematic_object_get_scenery "cin_frigate1") "040lb02_cin_frigate1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 37 (cinematic_object_get_scenery "cin_frigate2") "040lb02_cin_frigate2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 38 (cinematic_object_get_scenery "cin_frigate3") "040lb02_cin_frigate3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 39 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb02_cin_cov_capital_ship_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 40 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb02_cin_cov_cruiser1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 41 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb02_cin_cov_cruiser2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 42 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb02_cin_cov_cruiser3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 43 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb02_cin_cov_cruiser4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 44 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb02_cin_cov_cruiser5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 45 (cinematic_object_get_scenery "cin_assault_rifle") "040lb02_cin_assault_rifle_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 46 (cinematic_object_get_unit "cin_arbiter") "040lb02_cin_arbiter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 47 (cinematic_object_get_scenery "cin_ark") "040lb02_cin_ark_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 48 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb02_cin_forerunner_ship_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.3 0.0)
    (cinematic_scripting_start_effect 0 1 0 0 (cinematic_object_get "cin_longsword2"))
    (cinematic_scripting_start_effect 0 1 0 1 (cinematic_object_get "cin_longsword3"))
    (sleep 50)
    (cinematic_scripting_start_effect 0 1 0 2 (cinematic_object_get "cin_longsword6"))
    (cinematic_scripting_start_effect 0 1 0 3 (cinematic_object_get "cin_longsword9"))
    (sleep 218)
    (cinematic_scripting_start_dialogue 0 1 0 0 none)
    (sleep 2)
    (cinematic_scripting_start_effect 0 1 0 4 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 51)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb02_human_fleet_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 1 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 1)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_scenery "cin_longsword1") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword2") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword3") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword4") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword5") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword6") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword7") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword8") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword9") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword10") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword11") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword12") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword13") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword14") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword15") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword16") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword17") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword18") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword19") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword20") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword21") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword22") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword23") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword24") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword25") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword26") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword27") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword28") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword29") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword30") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword31") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword32") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword33") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword34") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword35") true)
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 36 (cinematic_object_get_scenery "cin_frigate1") "040lb02_cin_frigate1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 37 (cinematic_object_get_scenery "cin_frigate2") "040lb02_cin_frigate2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 38 (cinematic_object_get_scenery "cin_frigate3") "040lb02_cin_frigate3_2" true)
    (object_hide (cinematic_object_get_scenery "cin_cov_capital_ship") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser1") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 47 (cinematic_object_get_scenery "cin_ark") "040lb02_cin_ark_2" true)
    (object_hide (cinematic_object_get_scenery "cin_forerunner_ship") true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 0.3 0.0)
    (cinematic_scripting_start_effect 0 1 1 0 (cinematic_object_get "cin_frigate1"))
    (sleep 10)
    (cinematic_scripting_start_effect 0 1 1 1 (cinematic_object_get "cin_frigate3"))
    (sleep 20)
    (cinematic_scripting_start_effect 0 1 1 2 (cinematic_object_get "cin_frigate2"))
    (sleep 17)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb02_human_fleet_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 2 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 2)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_scenery "cin_longsword1") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword2") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword3") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword4") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword5") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword6") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword7") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword8") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword9") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword10") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword11") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword12") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword13") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword14") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword15") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword16") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword17") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword18") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword19") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword20") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword21") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword22") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword23") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword24") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword25") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword26") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword27") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword28") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword29") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword30") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword31") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword32") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword33") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword34") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword35") true)
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 37 (cinematic_object_get_scenery "cin_frigate2") "040lb02_cin_frigate2_3" true)
    (object_hide (cinematic_object_get_scenery "cin_frigate3") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_capital_ship") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser1") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 47 (cinematic_object_get_scenery "cin_ark") "040lb02_cin_ark_3" true)
    (object_hide (cinematic_object_get_scenery "cin_forerunner_ship") true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.3 0.0)
    (cinematic_scripting_start_effect 0 1 2 0 (cinematic_object_get "cin_frigate2"))
    (sleep 1)
    (cinematic_scripting_start_effect 0 1 2 1 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 26)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb02_human_fleet_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 3 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 3)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 0 (cinematic_object_get_scenery "cin_longsword1") "040lb02_cin_longsword1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_scenery "cin_longsword2") "040lb02_cin_longsword2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_longsword3") "040lb02_cin_longsword3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 3 (cinematic_object_get_scenery "cin_longsword4") "040lb02_cin_longsword4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 4 (cinematic_object_get_scenery "cin_longsword5") "040lb02_cin_longsword5_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 5 (cinematic_object_get_scenery "cin_longsword6") "040lb02_cin_longsword6_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 6 (cinematic_object_get_scenery "cin_longsword7") "040lb02_cin_longsword7_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 7 (cinematic_object_get_scenery "cin_longsword8") "040lb02_cin_longsword8_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 8 (cinematic_object_get_scenery "cin_longsword9") "040lb02_cin_longsword9_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 9 (cinematic_object_get_scenery "cin_longsword10") "040lb02_cin_longsword10_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 10 (cinematic_object_get_scenery "cin_longsword11") "040lb02_cin_longsword11_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 11 (cinematic_object_get_scenery "cin_longsword12") "040lb02_cin_longsword12_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 12 (cinematic_object_get_scenery "cin_longsword13") "040lb02_cin_longsword13_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 13 (cinematic_object_get_scenery "cin_longsword14") "040lb02_cin_longsword14_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 14 (cinematic_object_get_scenery "cin_longsword15") "040lb02_cin_longsword15_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 15 (cinematic_object_get_scenery "cin_longsword16") "040lb02_cin_longsword16_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 16 (cinematic_object_get_scenery "cin_longsword17") "040lb02_cin_longsword17_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 17 (cinematic_object_get_scenery "cin_longsword18") "040lb02_cin_longsword18_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 18 (cinematic_object_get_scenery "cin_longsword19") "040lb02_cin_longsword19_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 19 (cinematic_object_get_scenery "cin_longsword20") "040lb02_cin_longsword20_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 20 (cinematic_object_get_scenery "cin_longsword21") "040lb02_cin_longsword21_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 21 (cinematic_object_get_scenery "cin_longsword22") "040lb02_cin_longsword22_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 22 (cinematic_object_get_scenery "cin_longsword23") "040lb02_cin_longsword23_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 23 (cinematic_object_get_scenery "cin_longsword24") "040lb02_cin_longsword24_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 24 (cinematic_object_get_scenery "cin_longsword25") "040lb02_cin_longsword25_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 25 (cinematic_object_get_scenery "cin_longsword26") "040lb02_cin_longsword26_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 26 (cinematic_object_get_scenery "cin_longsword27") "040lb02_cin_longsword27_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 27 (cinematic_object_get_scenery "cin_longsword28") "040lb02_cin_longsword28_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 28 (cinematic_object_get_scenery "cin_longsword29") "040lb02_cin_longsword29_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 29 (cinematic_object_get_scenery "cin_longsword30") "040lb02_cin_longsword30_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 30 (cinematic_object_get_scenery "cin_longsword31") "040lb02_cin_longsword1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 31 (cinematic_object_get_scenery "cin_longsword32") "040lb02_cin_longsword32_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 32 (cinematic_object_get_scenery "cin_longsword33") "040lb02_cin_longsword33_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 33 (cinematic_object_get_scenery "cin_longsword34") "040lb02_cin_longsword34_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 34 (cinematic_object_get_scenery "cin_longsword35") "040lb02_cin_longsword35_4" true)
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 36 (cinematic_object_get_scenery "cin_frigate1") "040lb02_cin_frigate1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 37 (cinematic_object_get_scenery "cin_frigate2") "040lb02_cin_frigate2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 38 (cinematic_object_get_scenery "cin_frigate3") "040lb02_cin_frigate3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 39 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb02_cin_cov_capital_ship_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 40 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb02_cin_cov_cruiser1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 41 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb02_cin_cov_cruiser2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 42 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb02_cin_cov_cruiser3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 43 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb02_cin_cov_cruiser4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 44 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb02_cin_cov_cruiser5_4" true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 47 (cinematic_object_get_scenery "cin_ark") "040lb02_cin_ark_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 48 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb02_cin_forerunner_ship_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 0.3 0.0)
    (sleep 10)
    (cinematic_scripting_start_effect 0 1 3 0 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 55)
    (begin
        (effect_new_on_object_marker "levels\solo\030_outskirts\e3\fx\ark_open" "ark" "ark_opening")
        (effect_new_on_object_marker "levels\solo\030_outskirts\e3\fx\petal_debris" "ark" "ark_opening")
    )
    (cinematic_print "custom script play")
    (sleep 44)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb02_human_fleet_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 0)
    (!040lb02_human_fleet_sc_sh1)
    (!040lb02_human_fleet_sc_sh2)
    (!040lb02_human_fleet_sc_sh3)
    (!040lb02_human_fleet_sc_sh4)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 1 0 (cinematic_object_get_scenery "cin_longsword1"))
    (cinematic_scripting_destroy_object 0 1 1 (cinematic_object_get_scenery "cin_longsword2"))
    (cinematic_scripting_destroy_object 0 1 2 (cinematic_object_get_scenery "cin_longsword3"))
    (cinematic_scripting_destroy_object 0 1 3 (cinematic_object_get_scenery "cin_longsword4"))
    (cinematic_scripting_destroy_object 0 1 4 (cinematic_object_get_scenery "cin_longsword5"))
    (cinematic_scripting_destroy_object 0 1 5 (cinematic_object_get_scenery "cin_longsword6"))
    (cinematic_scripting_destroy_object 0 1 6 (cinematic_object_get_scenery "cin_longsword7"))
    (cinematic_scripting_destroy_object 0 1 7 (cinematic_object_get_scenery "cin_longsword8"))
    (cinematic_scripting_destroy_object 0 1 8 (cinematic_object_get_scenery "cin_longsword9"))
    (cinematic_scripting_destroy_object 0 1 9 (cinematic_object_get_scenery "cin_longsword10"))
    (cinematic_scripting_destroy_object 0 1 10 (cinematic_object_get_scenery "cin_longsword11"))
    (cinematic_scripting_destroy_object 0 1 11 (cinematic_object_get_scenery "cin_longsword12"))
    (cinematic_scripting_destroy_object 0 1 12 (cinematic_object_get_scenery "cin_longsword13"))
    (cinematic_scripting_destroy_object 0 1 13 (cinematic_object_get_scenery "cin_longsword14"))
    (cinematic_scripting_destroy_object 0 1 14 (cinematic_object_get_scenery "cin_longsword15"))
    (cinematic_scripting_destroy_object 0 1 15 (cinematic_object_get_scenery "cin_longsword16"))
    (cinematic_scripting_destroy_object 0 1 16 (cinematic_object_get_scenery "cin_longsword17"))
    (cinematic_scripting_destroy_object 0 1 17 (cinematic_object_get_scenery "cin_longsword18"))
    (cinematic_scripting_destroy_object 0 1 18 (cinematic_object_get_scenery "cin_longsword19"))
    (cinematic_scripting_destroy_object 0 1 19 (cinematic_object_get_scenery "cin_longsword20"))
    (cinematic_scripting_destroy_object 0 1 20 (cinematic_object_get_scenery "cin_longsword21"))
    (cinematic_scripting_destroy_object 0 1 21 (cinematic_object_get_scenery "cin_longsword22"))
    (cinematic_scripting_destroy_object 0 1 22 (cinematic_object_get_scenery "cin_longsword23"))
    (cinematic_scripting_destroy_object 0 1 23 (cinematic_object_get_scenery "cin_longsword24"))
    (cinematic_scripting_destroy_object 0 1 24 (cinematic_object_get_scenery "cin_longsword25"))
    (cinematic_scripting_destroy_object 0 1 25 (cinematic_object_get_scenery "cin_longsword26"))
    (cinematic_scripting_destroy_object 0 1 26 (cinematic_object_get_scenery "cin_longsword27"))
    (cinematic_scripting_destroy_object 0 1 27 (cinematic_object_get_scenery "cin_longsword28"))
    (cinematic_scripting_destroy_object 0 1 28 (cinematic_object_get_scenery "cin_longsword29"))
    (cinematic_scripting_destroy_object 0 1 29 (cinematic_object_get_scenery "cin_longsword30"))
    (cinematic_scripting_destroy_object 0 1 30 (cinematic_object_get_scenery "cin_longsword31"))
    (cinematic_scripting_destroy_object 0 1 31 (cinematic_object_get_scenery "cin_longsword32"))
    (cinematic_scripting_destroy_object 0 1 32 (cinematic_object_get_scenery "cin_longsword33"))
    (cinematic_scripting_destroy_object 0 1 33 (cinematic_object_get_scenery "cin_longsword34"))
    (cinematic_scripting_destroy_object 0 1 34 (cinematic_object_get_scenery "cin_longsword35"))
    (cinematic_scripting_destroy_object 0 1 35 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 1 36 (cinematic_object_get_scenery "cin_frigate1"))
    (cinematic_scripting_destroy_object 0 1 37 (cinematic_object_get_scenery "cin_frigate2"))
    (cinematic_scripting_destroy_object 0 1 38 (cinematic_object_get_scenery "cin_frigate3"))
    (cinematic_scripting_destroy_object 0 1 39 (cinematic_object_get_scenery "cin_cov_capital_ship"))
    (cinematic_scripting_destroy_object 0 1 40 (cinematic_object_get_scenery "cin_cov_cruiser1"))
    (cinematic_scripting_destroy_object 0 1 41 (cinematic_object_get_scenery "cin_cov_cruiser2"))
    (cinematic_scripting_destroy_object 0 1 42 (cinematic_object_get_scenery "cin_cov_cruiser3"))
    (cinematic_scripting_destroy_object 0 1 43 (cinematic_object_get_scenery "cin_cov_cruiser4"))
    (cinematic_scripting_destroy_object 0 1 44 (cinematic_object_get_scenery "cin_cov_cruiser5"))
    (cinematic_scripting_destroy_object 0 1 45 (cinematic_object_get_scenery "cin_assault_rifle"))
    (cinematic_scripting_destroy_object 0 1 46 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 0 1 47 (cinematic_object_get_scenery "cin_ark"))
    (cinematic_scripting_destroy_object 0 1 48 (cinematic_object_get_scenery "cin_forerunner_ship"))
)

(script static void !040lb025_ark_cracks_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (object_hide (cinematic_object_get_scenery "cin_assault_rifle") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb025_cin_cov_capital_ship_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb025_cin_cov_cruiser1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb025_cin_cov_cruiser2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb025_cin_cov_cruiser3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb025_cin_cov_cruiser4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 8 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb025_cin_cov_cruiser5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 (cinematic_object_get_scenery "cin_frigate1") "040lb025_cin_frigate1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 (cinematic_object_get_scenery "cin_frigate2") "040lb025_cin_frigate2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 11 (cinematic_object_get_scenery "cin_frigate3") "040lb025_cin_frigate3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 12 (cinematic_object_get_scenery "cin_ark") "040lb025_cin_ark_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 13 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb025_cin_forerunner_ship_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.3 0.0)
    (cinematic_scripting_start_effect 0 2 0 0 (cinematic_object_get "cin_ark"))
    (sleep 221)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb025_ark_cracks_sc
    (begin
        (object_destroy "ark")
        (object_destroy "truth_ship")
    )
    (cinematic_print "beginning scene 3")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 0)
    (!040lb025_ark_cracks_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 2 0 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 0 2 1 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 2 2 (cinematic_object_get_scenery "cin_assault_rifle"))
    (cinematic_scripting_destroy_object 0 2 3 (cinematic_object_get_scenery "cin_cov_capital_ship"))
    (cinematic_scripting_destroy_object 0 2 4 (cinematic_object_get_scenery "cin_cov_cruiser1"))
    (cinematic_scripting_destroy_object 0 2 5 (cinematic_object_get_scenery "cin_cov_cruiser2"))
    (cinematic_scripting_destroy_object 0 2 6 (cinematic_object_get_scenery "cin_cov_cruiser3"))
    (cinematic_scripting_destroy_object 0 2 7 (cinematic_object_get_scenery "cin_cov_cruiser4"))
    (cinematic_scripting_destroy_object 0 2 8 (cinematic_object_get_scenery "cin_cov_cruiser5"))
    (cinematic_scripting_destroy_object 0 2 9 (cinematic_object_get_scenery "cin_frigate1"))
    (cinematic_scripting_destroy_object 0 2 10 (cinematic_object_get_scenery "cin_frigate2"))
    (cinematic_scripting_destroy_object 0 2 11 (cinematic_object_get_scenery "cin_frigate3"))
    (cinematic_scripting_destroy_object 0 2 12 (cinematic_object_get_scenery "cin_ark"))
    (cinematic_scripting_destroy_object 0 2 13 (cinematic_object_get_scenery "cin_forerunner_ship"))
)

(script static void !040lb03_finger_of_god_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 3) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 3) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 0 (cinematic_object_get_unit "cin_master_chief") "040lb03_cin_master_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 1 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb03_cin_cov_capital_ship_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 2 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb03_cin_cov_cruiser1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 3 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb03_cin_cov_cruiser2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 4 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb03_cin_cov_cruiser3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 5 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb03_cin_cov_cruiser4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 6 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb03_cin_cov_cruiser5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 7 (cinematic_object_get_scenery "cin_cov_cruiser6") "040lb03_cin_cov_cruiser6_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 8 (cinematic_object_get_scenery "cin_frigate1") "040lb03_cin_frigate1_1" true)
    (object_hide (cinematic_object_get_scenery "cin_frigate2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 10 (cinematic_object_get_scenery "cin_frigate3") "040lb03_cin_frigate3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 11 (cinematic_object_get_scenery "cin_fx_laser1") "040lb03_cin_fx_laser1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 12 (cinematic_object_get_scenery "cin_fx_laser2") "040lb03_cin_fx_laser2_1" true)
    (object_hide (cinematic_object_get_scenery "cin_longsword1") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword2") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword3") true)
    (object_hide (cinematic_object_get_scenery "cin_longsword4") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 17 (cinematic_object_get_scenery "cin_ark") "040lb03_cin_ark_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 18 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb03_cin_forerunner_ship_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 19 (cinematic_object_get_scenery "cin_fx_wall_of_power") "040lb03_cin_fx_wall_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.3 0.0)
    (sleep 25)
    (cinematic_scripting_start_effect 0 3 0 0 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 214)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb03_finger_of_god_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 3) 1 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 3) 1)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_master_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 1 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb03_cin_cov_capital_ship_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 2 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb03_cin_cov_cruiser1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 3 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb03_cin_cov_cruiser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 4 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb03_cin_cov_cruiser3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 5 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb03_cin_cov_cruiser4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 6 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb03_cin_cov_cruiser5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 7 (cinematic_object_get_scenery "cin_cov_cruiser6") "040lb03_cin_cov_cruiser6_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 8 (cinematic_object_get_scenery "cin_frigate1") "040lb03_cin_frigate1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 9 (cinematic_object_get_scenery "cin_frigate2") "040lb03_cin_frigate2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 10 (cinematic_object_get_scenery "cin_frigate3") "040lb03_cin_frigate3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 11 (cinematic_object_get_scenery "cin_fx_laser1") "040lb03_cin_fx_laser1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 12 (cinematic_object_get_scenery "cin_fx_laser2") "040lb03_cin_fx_laser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 13 (cinematic_object_get_scenery "cin_longsword1") "040lb03_cin_longsword1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 14 (cinematic_object_get_scenery "cin_longsword2") "040lb03_cin_longsword2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 15 (cinematic_object_get_scenery "cin_longsword3") "040lb03_cin_longsword3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 16 (cinematic_object_get_scenery "cin_longsword4") "040lb03_cin_longsword4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 17 (cinematic_object_get_scenery "cin_ark") "040lb03_cin_ark_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 18 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb03_cin_forerunner_ship_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 19 (cinematic_object_get_scenery "cin_fx_wall_of_power") "040lb03_cin_fx_wall_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 0.3 0.0)
    (cinematic_scripting_start_effect 0 3 1 0 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 100)
    (cinematic_scripting_start_effect 0 3 1 1 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 80)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb03_finger_of_god_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 3) 2 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 3) 2)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_master_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 1 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb03_cin_cov_capital_ship_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 2 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb03_cin_cov_cruiser1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 3 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb03_cin_cov_cruiser2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 4 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb03_cin_cov_cruiser3_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 5 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb03_cin_cov_cruiser4_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 6 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb03_cin_cov_cruiser5_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 7 (cinematic_object_get_scenery "cin_cov_cruiser6") "040lb03_cin_cov_cruiser6_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 8 (cinematic_object_get_scenery "cin_frigate1") "040lb03_cin_frigate1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 9 (cinematic_object_get_scenery "cin_frigate2") "040lb03_cin_frigate2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 10 (cinematic_object_get_scenery "cin_frigate3") "040lb03_cin_frigate3_3" true)
    (object_hide (cinematic_object_get_scenery "cin_fx_laser1") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_laser2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 13 (cinematic_object_get_scenery "cin_longsword1") "040lb03_cin_longsword1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 14 (cinematic_object_get_scenery "cin_longsword2") "040lb03_cin_longsword2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 15 (cinematic_object_get_scenery "cin_longsword3") "040lb03_cin_longsword3_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 16 (cinematic_object_get_scenery "cin_longsword4") "040lb03_cin_longsword4_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 17 (cinematic_object_get_scenery "cin_ark") "040lb03_cin_ark_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 18 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb03_cin_forerunner_ship_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 19 (cinematic_object_get_scenery "cin_fx_wall_of_power") "040lb03_cin_fx_wall_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (cinematic_scripting_start_effect 0 3 2 0 (cinematic_object_get "cin_fx_wall_of_power"))
    (sleep 61)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb03_finger_of_god_sc
    (cinematic_print "beginning scene 4")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 3) 0)
    (!040lb03_finger_of_god_sc_sh1)
    (!040lb03_finger_of_god_sc_sh2)
    (!040lb03_finger_of_god_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 3 0 (cinematic_object_get_unit "cin_master_chief"))
    (cinematic_scripting_destroy_object 0 3 1 (cinematic_object_get_scenery "cin_cov_capital_ship"))
    (cinematic_scripting_destroy_object 0 3 2 (cinematic_object_get_scenery "cin_cov_cruiser1"))
    (cinematic_scripting_destroy_object 0 3 3 (cinematic_object_get_scenery "cin_cov_cruiser2"))
    (cinematic_scripting_destroy_object 0 3 4 (cinematic_object_get_scenery "cin_cov_cruiser3"))
    (cinematic_scripting_destroy_object 0 3 5 (cinematic_object_get_scenery "cin_cov_cruiser4"))
    (cinematic_scripting_destroy_object 0 3 6 (cinematic_object_get_scenery "cin_cov_cruiser5"))
    (cinematic_scripting_destroy_object 0 3 7 (cinematic_object_get_scenery "cin_cov_cruiser6"))
    (cinematic_scripting_destroy_object 0 3 8 (cinematic_object_get_scenery "cin_frigate1"))
    (cinematic_scripting_destroy_object 0 3 9 (cinematic_object_get_scenery "cin_frigate2"))
    (cinematic_scripting_destroy_object 0 3 10 (cinematic_object_get_scenery "cin_frigate3"))
    (cinematic_scripting_destroy_object 0 3 11 (cinematic_object_get_scenery "cin_fx_laser1"))
    (cinematic_scripting_destroy_object 0 3 12 (cinematic_object_get_scenery "cin_fx_laser2"))
    (cinematic_scripting_destroy_object 0 3 13 (cinematic_object_get_scenery "cin_longsword1"))
    (cinematic_scripting_destroy_object 0 3 14 (cinematic_object_get_scenery "cin_longsword2"))
    (cinematic_scripting_destroy_object 0 3 15 (cinematic_object_get_scenery "cin_longsword3"))
    (cinematic_scripting_destroy_object 0 3 16 (cinematic_object_get_scenery "cin_longsword4"))
    (cinematic_scripting_destroy_object 0 3 17 (cinematic_object_get_scenery "cin_ark"))
    (cinematic_scripting_destroy_object 0 3 18 (cinematic_object_get_scenery "cin_forerunner_ship"))
    (cinematic_scripting_destroy_object 0 3 19 (cinematic_object_get_scenery "cin_fx_wall_of_power"))
)

(script static void !040lb04_headache_sc_sh1
    (fade_in 0.0 0.0 0.0 0)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 4) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 4) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 0 (cinematic_object_get_unit "cin_arbiter") "040lb04_cin_arbiter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 1 (cinematic_object_get_unit "cin_chief") "040lb04_cin_chief_1" true)
    (object_hide (cinematic_object_get_scenery "cin_cov_capital_ship") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser1") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate1") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate2") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate3") true)
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 12 (cinematic_object_get_unit "cin_chief") "040lb04_cin_ark_1" true)
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 14 (cinematic_object_get_scenery "cin_fx_wind") "040lb04_cin_fx_wind_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.3 0.0)
    (cinematic_scripting_start_effect 0 4 0 0 (cinematic_object_get "cin_fx_wind"))
    (sleep 37)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb04_headache_sc_sh2
    (cortana_effect_040lb_corfx)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 4) 1 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 4) 1)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 2 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb04_cin_cov_capital_ship_2" true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 4 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb04_cin_cov_cruiser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 5 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb04_cin_cov_cruiser3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 6 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb04_cin_cov_cruiser4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 7 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb04_cin_cov_cruiser5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 8 (cinematic_object_get_scenery "cin_frigate1") "040lb04_cin_frigate1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 9 (cinematic_object_get_scenery "cin_frigate2") "040lb04_cin_frigate2_2" true)
    (object_hide (cinematic_object_get_scenery "cin_frigate3") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 11 (cinematic_object_get_unit "cin_cortana") "040lb04_cin_cortana_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 12 (cinematic_object_get_unit "cin_cortana") "040lb04_cin_ark_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 13 (cinematic_object_get_unit "cin_cortana") "040lb04_cin_forerunner_ship_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 14 (cinematic_object_get_scenery "cin_fx_wind") "040lb04_cin_fx_wind_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 0.3 0.0)
    (cinematic_scripting_start_effect 0 4 1 0 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 123)
    (render_exposure 10.0 1.0)
    (cinematic_print "custom script play")
    (sleep 21)
    (fade_out 0.0 0.0 0.0 0)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb04_headache_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 4) 2 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 4) 2)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_capital_ship") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 3 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb04_cin_cov_cruiser1_3" true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate1") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 10 (cinematic_object_get_scenery "cin_frigate3") "040lb04_cin_frigate3_3" true)
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 12 (cinematic_object_get_scenery "cin_frigate3") "040lb04_cin_ark_3" true)
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (object_hide (cinematic_object_get_scenery "cin_fx_wind") true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -1.0 0.0)
    (render_exposure 10.0 0.0)
    (cinematic_print "custom script play")
    (sleep 31)
    (cinematic_scripting_start_dialogue 0 4 2 0 none)
    (sleep 95)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb04_headache_sc
    (cinematic_print "beginning scene 5")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 4) 0)
    (!040lb04_headache_sc_sh1)
    (!040lb04_headache_sc_sh2)
    (!040lb04_headache_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 4 0 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 0 4 1 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 4 2 (cinematic_object_get_scenery "cin_cov_capital_ship"))
    (cinematic_scripting_destroy_object 0 4 3 (cinematic_object_get_scenery "cin_cov_cruiser1"))
    (cinematic_scripting_destroy_object 0 4 4 (cinematic_object_get_scenery "cin_cov_cruiser2"))
    (cinematic_scripting_destroy_object 0 4 5 (cinematic_object_get_scenery "cin_cov_cruiser3"))
    (cinematic_scripting_destroy_object 0 4 6 (cinematic_object_get_scenery "cin_cov_cruiser4"))
    (cinematic_scripting_destroy_object 0 4 7 (cinematic_object_get_scenery "cin_cov_cruiser5"))
    (cinematic_scripting_destroy_object 0 4 8 (cinematic_object_get_scenery "cin_frigate1"))
    (cinematic_scripting_destroy_object 0 4 9 (cinematic_object_get_scenery "cin_frigate2"))
    (cinematic_scripting_destroy_object 0 4 10 (cinematic_object_get_scenery "cin_frigate3"))
    (cinematic_scripting_destroy_object 0 4 11 (cinematic_object_get_unit "cin_cortana"))
    (cinematic_scripting_destroy_object 0 4 12 (cinematic_object_get_unit "cin_cortana"))
    (cinematic_scripting_destroy_object 0 4 13 (cinematic_object_get_unit "cin_cortana"))
    (cinematic_scripting_destroy_object 0 4 14 (cinematic_object_get_scenery "cin_fx_wind"))
    (sleep 90)
)

(script static void !040lb05_portal_sc_sh1
    (begin
        (object_destroy_containing "storm")
        (object_create_anew "portal")
        (object_destroy "ark")
        (object_destroy (cinematic_object_get "cin_ark"))
        (object_create_anew "ark_open")
        (object_destroy "truth_ship")
        (fade_in 0.0 0.0 0.0 0)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 5) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 5) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 0 (cinematic_object_get_unit "cin_chief") "040lb05_cin_chief_1" true)
    (object_hide (cinematic_object_get_scenery "cin_cov_capital_ship") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser1") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser2") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser3") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser4") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser5") true)
    (object_hide (cinematic_object_get_scenery "cin_forerunner_ship") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate1") true)
    (object_hide (cinematic_object_get_scenery "cin_frigate2") true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.0 0.0)
    (fade_in 0.0 0.0 0.0 30)
    (cinematic_print "custom script play")
    (sleep 1)
    (effect_new_on_object_marker "objects\skies\ark\fx\ark_open" "ark_open" "petal_top_targeted")
    (cinematic_print "custom script play")
    (cinematic_scripting_start_music 0 5 0 1)
    (sleep 3)
    (cinematic_scripting_start_music 0 5 0 0)
    (sleep 297)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb05_portal_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 5) 1 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 5) 1)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 1 (cinematic_object_get_scenery "cin_cov_capital_ship") "040lb05_cin_cov_capital_ship_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 2 (cinematic_object_get_scenery "cin_cov_cruiser1") "040lb05_cin_cov_cruiser1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 3 (cinematic_object_get_scenery "cin_cov_cruiser2") "040lb05_cin_cov_cruiser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 4 (cinematic_object_get_scenery "cin_cov_cruiser3") "040lb05_cin_cov_cruiser3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 5 (cinematic_object_get_scenery "cin_cov_cruiser4") "040lb05_cin_cov_cruiser4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 6 (cinematic_object_get_scenery "cin_cov_cruiser5") "040lb05_cin_cov_cruiser5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 7 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb05_cin_forerunner_ship_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 8 (cinematic_object_get_scenery "cin_frigate1") "040lb05_cin_frigate1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 9 (cinematic_object_get_scenery "cin_frigate2") "040lb05_cin_frigate2_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -1.0 0.0)
    (sleep 175)
    (cinematic_scripting_start_effect 0 5 1 0 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 75)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb05_portal_sc
    (cinematic_print "beginning scene 6")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 5) 0)
    (!040lb05_portal_sc_sh1)
    (!040lb05_portal_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 5 0 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 5 1 (cinematic_object_get_scenery "cin_cov_capital_ship"))
    (cinematic_scripting_destroy_object 0 5 2 (cinematic_object_get_scenery "cin_cov_cruiser1"))
    (cinematic_scripting_destroy_object 0 5 3 (cinematic_object_get_scenery "cin_cov_cruiser2"))
    (cinematic_scripting_destroy_object 0 5 4 (cinematic_object_get_scenery "cin_cov_cruiser3"))
    (cinematic_scripting_destroy_object 0 5 5 (cinematic_object_get_scenery "cin_cov_cruiser4"))
    (cinematic_scripting_destroy_object 0 5 6 (cinematic_object_get_scenery "cin_cov_cruiser5"))
    (cinematic_scripting_destroy_object 0 5 7 (cinematic_object_get_scenery "cin_forerunner_ship"))
    (cinematic_scripting_destroy_object 0 5 8 (cinematic_object_get_scenery "cin_frigate1"))
    (cinematic_scripting_destroy_object 0 5 9 (cinematic_object_get_scenery "cin_frigate2"))
)

(script static void !040lb06_escape_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 6) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 6) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_unit "cin_master_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 2 (cinematic_object_get_scenery "cin_cruiser1") "040lb06_cin_cov_cruiser1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 3 (cinematic_object_get_scenery "cin_cruiser2") "040lb06_cin_cov_cruiser2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 4 (cinematic_object_get_scenery "cin_cruiser3") "040lb06_cin_cov_cruiser3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 5 (cinematic_object_get_scenery "cin_cruiser4") "040lb06_cin_cov_cruiser4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 6 (cinematic_object_get_scenery "cin_cruiser5") "040lb06_cin_cov_cruiser5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 7 (cinematic_object_get_scenery "cin_cruiser6") "040lb06_cin_cov_cruiser6_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 8 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb06_cin_forerunner_ship_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 9 (cinematic_object_get_scenery "cin_capital_ship") "040lb06_cin_cov_capital_ship_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 10 (cinematic_object_get_scenery "cin_fx_capitalship_portal") "040lb06_cin_fx_capitalship_portal_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 11 (cinematic_object_get_scenery "cin_fx_cruiser_portal1") "040lb06_cin_fx_cruiser_portal1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 12 (cinematic_object_get_scenery "cin_fx_cruiser_portal2") "040lb06_cin_fx_cruiser_portal2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 13 (cinematic_object_get_scenery "cin_fx_cruiser_portal3") "040lb06_cin_fx_cruiser_portal3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 14 (cinematic_object_get_scenery "cin_fx_cruiser_portal4") "040lb06_cin_fx_cruiser_portal4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 15 (cinematic_object_get_scenery "cin_fx_cruiser_portal5") "040lb06_cin_fx_cruiser_portal5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 16 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_fx_forerunner_portal_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 17 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_ark_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -0.5 0.0)
    (cinematic_scripting_start_effect 0 6 0 0 (cinematic_object_get "cin_forerunner_ship"))
    (sleep 1)
    (cinematic_scripting_start_dialogue 0 6 0 0 none)
    (sleep 91)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb06_escape_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 6) 1 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 6) 1)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 1 (cinematic_object_get_unit "cin_master_chief") "040lb06_cin_master_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 2 (cinematic_object_get_scenery "cin_cruiser1") "040lb06_cin_cov_cruiser1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 3 (cinematic_object_get_scenery "cin_cruiser2") "040lb06_cin_cov_cruiser2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 4 (cinematic_object_get_scenery "cin_cruiser3") "040lb06_cin_cov_cruiser3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 5 (cinematic_object_get_scenery "cin_cruiser4") "040lb06_cin_cov_cruiser4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 6 (cinematic_object_get_scenery "cin_cruiser5") "040lb06_cin_cov_cruiser5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 7 (cinematic_object_get_scenery "cin_cruiser6") "040lb06_cin_cov_cruiser6_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 8 (cinematic_object_get_scenery "cin_forerunner_ship") "040lb06_cin_forerunner_ship_1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 9 (cinematic_object_get_scenery "cin_capital_ship") "040lb06_cin_cov_capital_ship_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 10 (cinematic_object_get_scenery "cin_fx_capitalship_portal") "040lb06_cin_fx_capitalship_portal_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 11 (cinematic_object_get_scenery "cin_fx_cruiser_portal1") "040lb06_cin_fx_cruiser_portal1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 12 (cinematic_object_get_scenery "cin_fx_cruiser_portal2") "040lb06_cin_fx_cruiser_portal2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 13 (cinematic_object_get_scenery "cin_fx_cruiser_portal3") "040lb06_cin_fx_cruiser_portal3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 14 (cinematic_object_get_scenery "cin_fx_cruiser_portal4") "040lb06_cin_fx_cruiser_portal4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 15 (cinematic_object_get_scenery "cin_fx_cruiser_portal5") "040lb06_cin_fx_cruiser_portal5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 16 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_fx_forerunner_portal_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 17 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_ark_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -0.5 0.0)
    (sleep 40)
    (cinematic_scripting_start_effect 0 6 1 0 (cinematic_object_get "cin_fx_forerunner_portal1"))
    (sleep 60)
    (cinematic_scripting_start_dialogue 0 6 1 0 none)
    (sleep 45)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb06_escape_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 6) 2 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 6) 2)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 0 (cinematic_object_get_unit "cin_arbiter") "040lb06_cin_arbiter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 1 (cinematic_object_get_unit "cin_master_chief") "040lb06_cin_master_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 2 (cinematic_object_get_scenery "cin_cruiser1") "040lb06_cin_cov_cruiser1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 3 (cinematic_object_get_scenery "cin_cruiser2") "040lb06_cin_cov_cruiser2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 4 (cinematic_object_get_scenery "cin_cruiser3") "040lb06_cin_cov_cruiser3_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 5 (cinematic_object_get_scenery "cin_cruiser4") "040lb06_cin_cov_cruiser4_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 6 (cinematic_object_get_scenery "cin_cruiser5") "040lb06_cin_cov_cruiser5_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 7 (cinematic_object_get_scenery "cin_cruiser6") "040lb06_cin_cov_cruiser6_3" true)
    (object_hide (cinematic_object_get_scenery "cin_forerunner_ship") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 9 (cinematic_object_get_scenery "cin_capital_ship") "040lb06_cin_cov_capital_ship_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 10 (cinematic_object_get_scenery "cin_fx_capitalship_portal") "040lb06_cin_fx_capitalship_portal_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 11 (cinematic_object_get_scenery "cin_fx_cruiser_portal1") "040lb06_cin_fx_cruiser_portal1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 12 (cinematic_object_get_scenery "cin_fx_cruiser_portal2") "040lb06_cin_fx_cruiser_portal2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 13 (cinematic_object_get_scenery "cin_fx_cruiser_portal3") "040lb06_cin_fx_cruiser_portal3_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 14 (cinematic_object_get_scenery "cin_fx_cruiser_portal4") "040lb06_cin_fx_cruiser_portal4_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 15 (cinematic_object_get_scenery "cin_fx_cruiser_portal5") "040lb06_cin_fx_cruiser_portal5_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 16 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_fx_forerunner_portal_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 17 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_ark_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.0 0.0)
    (sleep 15)
    (cinematic_scripting_start_dialogue 0 6 2 0 none)
    (sleep 64)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb06_escape_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 6) 3 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 6) 3)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_unit "cin_master_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 2 (cinematic_object_get_scenery "cin_cruiser1") "040lb06_cin_cov_cruiser1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 3 (cinematic_object_get_scenery "cin_cruiser2") "040lb06_cin_cov_cruiser2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 4 (cinematic_object_get_scenery "cin_cruiser3") "040lb06_cin_cov_cruiser3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 5 (cinematic_object_get_scenery "cin_cruiser4") "040lb06_cin_cov_cruiser4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 6 (cinematic_object_get_scenery "cin_cruiser5") "040lb06_cin_cov_cruiser5_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 7 (cinematic_object_get_scenery "cin_cruiser6") "040lb06_cin_cov_cruiser6_4" true)
    (object_hide (cinematic_object_get_scenery "cin_forerunner_ship") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 9 (cinematic_object_get_scenery "cin_capital_ship") "040lb06_cin_cov_capital_ship_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 10 (cinematic_object_get_scenery "cin_fx_capitalship_portal") "040lb06_cin_fx_capitalship_portal_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 11 (cinematic_object_get_scenery "cin_fx_cruiser_portal1") "040lb06_cin_fx_cruiser_portal1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 12 (cinematic_object_get_scenery "cin_fx_cruiser_portal2") "040lb06_cin_fx_cruiser_portal2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 13 (cinematic_object_get_scenery "cin_fx_cruiser_portal3") "040lb06_cin_fx_cruiser_portal3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 14 (cinematic_object_get_scenery "cin_fx_cruiser_portal4") "040lb06_cin_fx_cruiser_portal4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 15 (cinematic_object_get_scenery "cin_fx_cruiser_portal5") "040lb06_cin_fx_cruiser_portal5_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 16 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_fx_forerunner_portal_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 6 17 (cinematic_object_get_scenery "cin_fx_forerunner_portal1") "040lb06_cin_ark_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure -0.5 0.0)
    (cinematic_scripting_start_effect 0 6 3 0 (cinematic_object_get "cin_fx_cruiser_portal1"))
    (cinematic_scripting_start_effect 0 6 3 3 (cinematic_object_get "cin_fx_cruiser_portal4"))
    (cinematic_scripting_start_effect 0 6 3 4 (cinematic_object_get "cin_fx_cruiser_portal5"))
    (cinematic_scripting_start_effect 0 6 3 1 (cinematic_object_get "cin_fx_cruiser_portal2"))
    (cinematic_scripting_start_effect 0 6 3 2 (cinematic_object_get "cin_fx_cruiser_portal3"))
    (sleep 46)
    (cinematic_scripting_start_dialogue 0 6 3 0 none)
    (sleep 86)
    (cinematic_scripting_start_dialogue 0 6 3 1 none)
    (sleep 46)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb06_escape_sc
    (object_destroy "truth_ship")
    (cinematic_print "beginning scene 7")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 6) 0)
    (!040lb06_escape_sc_sh1)
    (!040lb06_escape_sc_sh2)
    (!040lb06_escape_sc_sh3)
    (!040lb06_escape_sc_sh4)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 6 0 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 0 6 1 (cinematic_object_get_unit "cin_master_chief"))
    (cinematic_scripting_destroy_object 0 6 2 (cinematic_object_get_scenery "cin_cruiser1"))
    (cinematic_scripting_destroy_object 0 6 3 (cinematic_object_get_scenery "cin_cruiser2"))
    (cinematic_scripting_destroy_object 0 6 4 (cinematic_object_get_scenery "cin_cruiser3"))
    (cinematic_scripting_destroy_object 0 6 5 (cinematic_object_get_scenery "cin_cruiser4"))
    (cinematic_scripting_destroy_object 0 6 6 (cinematic_object_get_scenery "cin_cruiser5"))
    (cinematic_scripting_destroy_object 0 6 7 (cinematic_object_get_scenery "cin_cruiser6"))
    (cinematic_scripting_destroy_object 0 6 8 (cinematic_object_get_scenery "cin_forerunner_ship"))
    (cinematic_scripting_destroy_object 0 6 9 (cinematic_object_get_scenery "cin_capital_ship"))
    (cinematic_scripting_destroy_object 0 6 10 (cinematic_object_get_scenery "cin_fx_capitalship_portal"))
    (cinematic_scripting_destroy_object 0 6 11 (cinematic_object_get_scenery "cin_fx_cruiser_portal1"))
    (cinematic_scripting_destroy_object 0 6 12 (cinematic_object_get_scenery "cin_fx_cruiser_portal2"))
    (cinematic_scripting_destroy_object 0 6 13 (cinematic_object_get_scenery "cin_fx_cruiser_portal3"))
    (cinematic_scripting_destroy_object 0 6 14 (cinematic_object_get_scenery "cin_fx_cruiser_portal4"))
    (cinematic_scripting_destroy_object 0 6 15 (cinematic_object_get_scenery "cin_fx_cruiser_portal5"))
    (cinematic_scripting_destroy_object 0 6 16 (cinematic_object_get_scenery "cin_fx_forerunner_portal1"))
    (cinematic_scripting_destroy_object 0 6 17 (cinematic_object_get_scenery "cin_fx_forerunner_portal1"))
)

(script static void !040lb07_worse_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 7) 0 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 7) 0)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 0 (cinematic_object_get_unit "cin_arbiter1") "040lb07_cin_arbiter1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 1 (cinematic_object_get_scenery "cin_cov_cruiser_flood") "040lb07_cin_floodship_new_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 2 (cinematic_object_get_scenery "cin_fx_anchor") "040lb07_cin_fx_anchor_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 3 (cinematic_object_get_scenery "floodship_impact") "040lb07_fx_impact_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 4 (cinematic_object_get_unit "cin_master_chief2") "040lb07_cin_master_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 5 (cinematic_object_get_scenery "cin_fx_impact") "040lb07_cin_fx_impact_1" true)
    (object_hide (cinematic_object_get_scenery "flood_wind_fx") true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -0.5 0.0)
    (sleep 5)
    (cinematic_scripting_start_effect 0 7 0 0 (cinematic_object_get "cin_fx_anchor"))
    (sleep 30)
    (cinematic_scripting_start_effect 0 7 0 1 (cinematic_object_get "cin_cov_cruiser_flood"))
    (cinematic_scripting_start_effect 0 7 0 2 (cinematic_object_get "cin_cov_cruiser_flood"))
    (sleep 25)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb07_worse_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 7) 1 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 7) 1)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 0 (cinematic_object_get_unit "cin_arbiter1") "040lb07_cin_arbiter1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 1 (cinematic_object_get_scenery "cin_cov_cruiser_flood") "040lb07_cin_floodship_new_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 2 (cinematic_object_get_scenery "cin_fx_anchor") "040lb07_cin_fx_anchor_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 3 (cinematic_object_get_scenery "floodship_impact") "040lb07_fx_impact_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 4 (cinematic_object_get_unit "cin_master_chief2") "040lb07_cin_master_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 5 (cinematic_object_get_scenery "cin_fx_impact") "040lb07_cin_fx_impact_2" true)
    (object_hide (cinematic_object_get_scenery "flood_wind_fx") true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -0.5 0.0)
    (sleep 80)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb07_worse_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 7) 2 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 7) 2)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 0 (cinematic_object_get_unit "cin_arbiter1") "040lb07_cin_arbiter1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 1 (cinematic_object_get_scenery "cin_cov_cruiser_flood") "040lb07_cin_floodship_new_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 2 (cinematic_object_get_scenery "cin_fx_anchor") "040lb07_cin_fx_anchor_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 3 (cinematic_object_get_scenery "floodship_impact") "040lb07_fx_impact_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 4 (cinematic_object_get_unit "cin_master_chief2") "040lb07_cin_master_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 5 (cinematic_object_get_scenery "cin_fx_impact") "040lb07_cin_fx_impact_3" true)
    (object_hide (cinematic_object_get_scenery "flood_wind_fx") true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -0.5 0.0)
    (sleep 155)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb07_worse_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 7) 3 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 7) 3)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 0 (cinematic_object_get_unit "cin_arbiter1") "040lb07_cin_arbiter1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 1 (cinematic_object_get_scenery "cin_cov_cruiser_flood") "040lb07_cin_floodship_new_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 2 (cinematic_object_get_scenery "cin_fx_anchor") "040lb07_cin_fx_anchor_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 3 (cinematic_object_get_scenery "floodship_impact") "040lb07_fx_impact_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 4 (cinematic_object_get_unit "cin_master_chief2") "040lb07_cin_master_chief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 5 (cinematic_object_get_scenery "cin_fx_impact") "040lb07_cin_fx_impact_4" true)
    (object_hide (cinematic_object_get_scenery "flood_wind_fx") true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure -0.5 0.0)
    (cinematic_scripting_start_effect 0 7 3 0 (cinematic_object_get "cin_cov_cruiser_flood"))
    (cinematic_scripting_start_effect 0 7 3 1 (cinematic_object_get "cin_cov_cruiser_flood"))
    (sleep 1)
    (begin
        (player_effect_set_max_rumble 1.0 1.0)
        (player_effect_start 0.2 2.0)
    )
    (cinematic_print "custom script play")
    (sleep 69)
    (cinematic_print "custom script play")
    (player_effect_stop 2.0)
    (sleep 50)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb07_worse_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 7) 4 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 7) 4)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 0 (cinematic_object_get_unit "cin_arbiter1") "040lb07_cin_arbiter1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 1 (cinematic_object_get_scenery "cin_cov_cruiser_flood") "040lb07_cin_floodship_new_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 2 (cinematic_object_get_scenery "cin_fx_anchor") "040lb07_cin_fx_anchor_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 3 (cinematic_object_get_scenery "floodship_impact") "040lb07_fx_impact_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 4 (cinematic_object_get_unit "cin_master_chief2") "040lb07_cin_master_chief_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 5 (cinematic_object_get_scenery "cin_fx_impact") "040lb07_cin_fx_impact_5" true)
    (object_hide (cinematic_object_get_scenery "flood_wind_fx") true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure -0.5 0.0)
    (sleep 40)
    (cinematic_scripting_start_effect 0 7 4 0 (cinematic_object_get "floodship_impact"))
    (cinematic_print "custom script play")
    (begin
        (player_effect_set_max_rumble 1.0 1.0)
        (player_effect_start 0.6 0.1)
    )
    (sleep 30)
    (player_effect_stop 0.5)
    (cinematic_print "custom script play")
    (sleep 8)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb07_worse_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 7) 5 "cin_040lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 7) 5)
    (cinematic_object_create_cinematic_anchor "cin_040lb_anchor" "cin_040lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_arbiter1") true)
    (object_hide (cinematic_object_get_scenery "cin_cov_cruiser_flood") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 2 (cinematic_object_get_scenery "cin_fx_anchor") "040lb07_cin_fx_anchor_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 3 (cinematic_object_get_scenery "floodship_impact") "040lb07_fx_impact_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 4 (cinematic_object_get_unit "cin_master_chief2") "040lb07_cin_master_chief_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 5 (cinematic_object_get_scenery "cin_fx_impact") "040lb07_cin_fx_impact_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 7 6 (cinematic_object_get_scenery "flood_wind_fx") "040lb07_cin_fx_wind_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure -0.5 0.0)
    (cinematic_scripting_start_effect 0 7 5 0 (cinematic_object_get "flood_wind_fx"))
    (sleep 8)
    (cinematic_scripting_start_dialogue 0 7 5 0 none)
    (sleep 74)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 60)
    (sleep 9)
    (cinematic_scripting_start_dialogue 0 7 5 1 none)
    (sleep 51)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040lb07_worse_sc
    (cinematic_print "beginning scene 8")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 7) 0)
    (!040lb07_worse_sc_sh1)
    (!040lb07_worse_sc_sh2)
    (!040lb07_worse_sc_sh3)
    (!040lb07_worse_sc_sh4)
    (!040lb07_worse_sc_sh5)
    (!040lb07_worse_sc_sh6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 7 0 (cinematic_object_get_unit "cin_arbiter1"))
    (cinematic_scripting_destroy_object 0 7 1 (cinematic_object_get_scenery "cin_cov_cruiser_flood"))
    (cinematic_scripting_destroy_object 0 7 2 (cinematic_object_get_scenery "cin_fx_anchor"))
    (cinematic_scripting_destroy_object 0 7 3 (cinematic_object_get_scenery "floodship_impact"))
    (cinematic_scripting_destroy_object 0 7 4 (cinematic_object_get_unit "cin_master_chief2"))
    (cinematic_scripting_destroy_object 0 7 5 (cinematic_object_get_scenery "cin_fx_impact"))
    (cinematic_scripting_destroy_object 0 7 6 (cinematic_object_get_scenery "flood_wind_fx"))
    (sleep 150)
)

(script static void 040lb_cov_flee_debug
    (cinematic_zone_activate_for_debugging 0)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (object_destroy "lakeb_bfg_base")
        (object_destroy "ark")
        (object_destroy "truth_ship")
        (object_destroy "ark_cruiser_01")
        (object_destroy "ark_cruiser_02")
    )
    (cinematic_outro_start)
    (!040lb00_shoulder_roll_sc)
    (!040lb02_human_fleet_sc)
    (!040lb025_ark_cracks_sc)
    (!040lb03_finger_of_god_sc)
    (!040lb04_headache_sc)
    (!040lb05_portal_sc)
    (!040lb06_escape_sc)
    (!040lb07_worse_sc)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
)

(script static void 040lb_cov_flee
    (cinematic_zone_activate 0)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (object_destroy "lakeb_bfg_base")
        (object_destroy "ark")
        (object_destroy "truth_ship")
        (object_destroy "ark_cruiser_01")
        (object_destroy "ark_cruiser_02")
    )
    (cinematic_outro_start)
    (!040lb00_shoulder_roll_sc)
    (!040lb02_human_fleet_sc)
    (!040lb025_ark_cracks_sc)
    (!040lb03_finger_of_god_sc)
    (!040lb04_headache_sc)
    (!040lb05_portal_sc)
    (!040lb06_escape_sc)
    (!040lb07_worse_sc)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 040lb_cov_flee_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void !040pb_02_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 0 "040pb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (cinematic_object_create_cinematic_anchor "040pb_anchor" "040pb_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 441)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040pb_02
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (!040pb_02_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !pm_040pb_scarab_intro
    (cinematic_zone_activate 1)
    (sleep 1)
    (!040pb_02)
    (cinematic_zone_deactivate 1)
)

(script continuous void !pi_040pb_scarab_intro
    (sleep_forever)
    (cinematic_set_early_exit 0)
    (!pm_040pb_scarab_intro)
    (cinematic_set_early_exit 1)
)

(script static void 040pb_scarab_intro
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
    (wake !pi_040pb_scarab_intro)
    (fade_in 0.0 0.0 0.0 0)
    (set perspective_running true)
    (player_action_test_reset)
    (sleep 1)
    (sleep_until 
        (or
            (not (= (cinematic_get_early_exit) 0))
            (player_action_test_cinematic_skip)
        ) 
    1)
    (cinematic_camera_set_easing_out 0.0)
    (sleep 0)
    (cinematic_set_early_exit 2)
    (set perspective_running false)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 040pb_scarab_intro_debug
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
    (wake !pi_040pb_scarab_intro)
    (fade_in 0.0 0.0 0.0 0)
    (set perspective_running true)
    (player_action_test_reset)
    (sleep 1)
    (sleep_until 
        (or
            (not (= (cinematic_get_early_exit) 0))
            (player_action_test_cinematic_skip)
        ) 
    1)
    (cinematic_camera_set_easing_out 0.0)
    (sleep 0)
    (cinematic_set_early_exit 2)
    (set perspective_running false)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
)

(script static void !040ca_have_defied_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_cortana") "040ca_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 2 0 0 0)
    (sleep 5)
    (cinematic_scripting_start_dialogue 2 0 0 0 none)
    (sleep 222)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040ca_have_defied_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (!040ca_have_defied_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 0 0 (cinematic_object_get_unit "cin_cortana"))
)

(script continuous void 040ca_have_defied
    (sleep_forever)
    (cinematic_zone_activate 2)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
    (set g_cortana_header true)
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!040ca_have_defied_sc)
    (set g_cortana_footer true)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 2)
)

(script static void !040cb_your_shield_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 (cinematic_object_get_unit "cin_cortana") "040cb_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 3 0 0 0)
    (sleep 3)
    (cinematic_scripting_start_dialogue 3 0 0 0 none)
    (sleep 208)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040cb_your_shield_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (!040cb_your_shield_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 0 0 (cinematic_object_get_unit "cin_cortana"))
)

(script continuous void 040cb_your_shield
    (sleep_forever)
    (cinematic_zone_activate 3)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 3))
    (set g_cortana_header true)
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!040cb_your_shield_sc)
    (set g_cortana_footer true)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 3)
)

(script static void !040cc_know_you_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 (cinematic_object_get_unit "cin_cortana") "040cc_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 4 0 0 0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 4 0 0 0 none)
    (sleep 230)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !040cc_know_you_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (!040cc_know_you_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 4 0 0 (cinematic_object_get_unit "cin_cortana"))
)

(script continuous void 040cc_know_you
    (sleep_forever)
    (cinematic_zone_activate 4)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 4))
    (set g_cortana_header true)
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!040cc_know_you_sc)
    (set g_cortana_footer true)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 4)
)

(script static void cortana_effect_040lb_corfx
    (play_cortana_effect "040lb_corfx")
    (texture_camera_on)
)

