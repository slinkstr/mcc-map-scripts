; Decompiled with Blamite
; Source file: 110_hc.hsc
; Start time: 4/7/2022 7:27:29
; Decompilation finished in ~0.0039042s
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
(global boolean g_stasis_field_destroyed false)
(global short g_nav_sleep (* 30.0 60.0 1.0))
(global short g_nav_timeout (* 30.0 60.0 1.5))
(global real g_nav_offset 0.55)
(global boolean g_nav_ih false)
(global boolean g_nav_ph false)
(global boolean g_nav_hab false)
(global boolean g_nav_br false)
(global boolean g_nav_hc false)
(global boolean g_nav_pr false)
(global boolean g_nav_hd false)
(global boolean g_nav_rec false)
(global short g_hc_nav_progress 0)
(global boolean g_music_110_01 false)
(global boolean g_music_110_02 false)
(global boolean g_music_110_03 false)
(global boolean g_music_110_04 false)
(global boolean g_music_110_05 false)
(global boolean g_music_110_06 false)
(global boolean g_music_110_07 false)
(global boolean g_music_110_08 false)
(global boolean g_music_110_09 false)
(global boolean g_music_110_10 false)
(global boolean g_music_110_11 false)
(global boolean g_music_110_12 false)
(global boolean g_music_110_13 false)
(global boolean g_music_110_02_alt false)
(global boolean g_amb_audio_01 false)
(global boolean g_cortana_static false)
(global boolean g_approach_player true)
(global boolean g_ch_14_cortana_talk false)
(global boolean g_ch_16_cortana_finished false)
(global boolean reactor_flood_react_now false)
(global short gm_reaction_okay 0)
(global boolean editor false)
(global boolean g_play_cinematics true)
(global boolean debug true)
(global boolean dialogue true)
(global boolean music true)
(global short g_insertion_index 0)
(global short g_ih_obj_control 0)
(global short g_ph_obj_control 0)
(global short g_hab_obj_control 0)
(global short g_br_obj_control 0)
(global short g_hc_obj_control 0)
(global short g_pr_obj_control 0)
(global short g_hd_obj_control 0)
(global short g_re_obj_control 0)
(global short g_is_obj_control 0)
(global short g_rer_obj_control 0)
(global short g_hcr_obj_control 0)
(global short g_brr_obj_control 0)
(global short g_habr_obj_control 0)
(global short g_phr_obj_control 0)
(global short g_player_start_pitch -16)
(global boolean g_null false)
(global boolean g_ph_stalker_retreat false)
(global boolean blockage_in_place false)
(global boolean g_cortana_rescued false)
(global short torture_scale 0)
(global boolean reactor_blown false)
(global real elapsed_time 0.0)
(global real boom_delay 0.0)
(global short random_boom 0)
(global effect babam "objects\weapons\grenade\plasma_grenade\fx\detonation.effect")
(global effect kasploosh "fx\scenery_fx\explosions\covenant_explosion_large\covenant_explosion_large.effect")
(global effect kaboom "objects\vehicles\wraith\fx\destruction\trans_hull_destroyed.effect")
(global effect kablooie "objects\vehicles\wraith\fx\destruction\trans_mortar_destroyed.effect")
(global short pylon_countdown 5)
(global short pylon_delay 0)
(global short pylon_total 0)
(global boolean pylon_bam false)
(global short pylon_count 3)
(global short g_set_all 14)
(global short ins_random_number 0)


; SCRIPTS

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

(script dormant void 110_highcharity_cortana
    (sleep_until 
        (or
            (>= (game_insertion_point_get) 1)
            (<= (object_get_shield "cortana_prison") 0.0)
        ) 
    1)
    (object_destroy "cortana_switch")
    (set g_stasis_field_destroyed true)
    (sleep 20)
    (data_mine_set_mission_segment "110lb_rescue_cortana")
    (cinematic_snap_to_black)
    (if (!= (current_zone_set) g_set_all) 
        (begin
            (if debug 
                (print "switching zone sets..."))
            (switch_zone_set "set_reactor")
            (sleep 1)
        )
    )
    (object_teleport (player0) "stash_rescue_cortana_01")
    (object_teleport (player1) "stash_rescue_cortana_02")
    (object_teleport (player2) "stash_rescue_cortana_03")
    (object_teleport (player3) "stash_rescue_cortana_04")
    (sleep 1)
    (gs_return_zone_sets)
    (sleep 1)
    (set g_music_110_09 false)
    (set g_music_110_10 false)
    (sound_looping_stop "sound\visual_fx\cortana_effect\cortana_effect")
    (object_destroy "cortana_prison")
    (object_destroy (cinematic_object_get "cortana"))
    (ai_erase_all)
    (garbage_collect_unsafe)
    (add_recycling_volume "vol_inner_sanctum" 0 0)
    (is_destroy_objects)
    (cortana_effect_kill)
    (set g_cortana_header false)
    (set g_cortana_footer false)
    (sleep_forever 110cf_torture)
    (if g_play_cinematics 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (if debug 
                        (print "110lb_rescue_cortana"))
                    (110lb_rescue_cortana)
                )
            )
            (cinematic_skip_stop)
        )
    )
    (110lb_rescue_cortana_cleanup)
    (fade_out 0.0 0.0 0.0 0)
    (cinematic_start)
    (camera_control false)
    (sleep 5)
    (data_mine_set_mission_segment "110_110_inner_sanctum_return")
    (if dialogue 
        (print "cortana: there's two of us in here now, remember."))
    (sleep (ai_play_line_on_object none 110lb_130))
    (sleep 5)
    (set g_music_110_11 true)
    (object_teleport (player0) "return_player0")
    (object_teleport (player1) "return_player1")
    (object_teleport (player2) "return_player2")
    (object_teleport (player3) "return_player3")
    (sleep 1)
    (unit_raise_weapon (player0) -1)
    (unit_raise_weapon (player1) -1)
    (unit_raise_weapon (player2) -1)
    (unit_raise_weapon (player3) -1)
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (set g_cortana_rescued true)
    (ai_dialogue_enable true)
    (cinematic_fade_to_title)
    (wake 110_title2)
    (wake objective_1_clear)
    (game_insertion_point_unlock 1)
    (wake ch_13b_cortana)
)

(script static void is_destroy_objects
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
    (sleep 1)
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
    (sleep 1)
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
    (sleep 1)
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
    (sleep 1)
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
    (sleep 1)
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
    (sleep 1)
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
    (sleep 1)
    (object_destroy (list_get (volume_return_objects_by_type "tv_is_destroy_objects" 12) 0))
)

(script dormant void 110_hc_mission_won
    (sleep_until (= (volume_test_players "vol_inside_pelican") true) 5)
    (set g_music_110_13 false)
    (data_mine_set_mission_segment "110lc_leave_hc")
    (hud_deactivate_team_nav_point_flag player "nav_exit_pelican")
    (campaign_metagame_time_pause true)
    (wake objective_3_clear)
    (cinematic_fade_to_black)
    (game_award_level_complete_achievements)
    (ai_erase_all)
    (set g_amb_audio_01 false)
    (sleep_forever random_distant_booms)
    (sleep_forever random_near_booms)
    (sleep_forever alarm_loop)
    (sleep_forever recycle_volumes)
    (if g_play_cinematics 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (if debug 
                        (print "110lc_leave_hc"))
                    (110lc_leave_hc)
                )
            )
            (cinematic_skip_stop)
            (110lc_leave_hc_cleanup)
        )
    )
    (fade_out 0.0 0.0 0.0 0)
    (sound_class_set_gain "" 0.0 0)
    (sleep 5)
    (end_mission)
)

(script dormant void 110_title1
    (cinematic_set_title "title_1")
    (cinematic_title_to_gameplay)
)

(script dormant void 110_title2
    (cinematic_set_title "title_2")
    (cinematic_title_to_gameplay)
)

(script dormant void objective_1_set
    (sleep 270)
    (print "new objective set:")
    (print "find cortana.")
    (objectives_show_up_to 0)
    (cinematic_set_chud_objective "obj_0")
)

(script dormant void objective_1_clear
    (print "objective complete:")
    (print "find cortana.")
    (objectives_finish_up_to 0)
)

(script dormant void objective_2_set
    (sleep 30)
    (print "new objective set:")
    (print "overload the reactor.")
    (objectives_show_up_to 1)
    (cinematic_set_chud_objective "obj_1")
)

(script dormant void objective_2_clear
    (print "objective complete:")
    (print "overload the reactor.")
    (objectives_finish_up_to 1)
)

(script dormant void objective_3_set
    (sleep 30)
    (print "new objective set:")
    (print "escape the ship.")
    (objectives_show_up_to 2)
    (cinematic_set_chud_objective "obj_2")
)

(script dormant void objective_3_clear
    (print "objective complete:")
    (print "escape the ship.")
    (objectives_finish_up_to 2)
)

(script dormant void nav_ih
    (sleep_until (>= g_ih_obj_control 3) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_ih_obj_control 3) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_ih_01" 0.0)
            (sleep_until (>= g_ih_obj_control 4) 1)
            (hud_deactivate_team_nav_point_flag player "nav_ih_01")
        )
    )
    (sleep_until (>= g_ih_obj_control 4) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (= g_ph_obj_control 0) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_ih_02" 0.0)
            (sleep_until (>= g_ph_obj_control 1) 1)
            (hud_deactivate_team_nav_point_flag player "nav_ih_02")
        )
    )
)

(script dormant void nav_ph
    (sleep_until (>= g_ph_obj_control 3) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_ph_obj_control 3) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_ph_01" g_nav_offset)
            (sleep_until (>= g_ph_obj_control 4) 1)
            (hud_deactivate_team_nav_point_flag player "nav_ph_01")
        )
    )
)

(script dormant void nav_hab
    (sleep_until g_nav_hab 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (= g_hab_obj_control 0) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_hab_01" 0.0)
            (sleep_until (>= g_hab_obj_control 1) 1)
            (hud_deactivate_team_nav_point_flag player "nav_hab_01")
        )
    )
    (sleep_until (>= g_hab_obj_control 2) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_hab_obj_control 3) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_hab_02" 0.0)
            (sleep_until (>= g_hab_obj_control 4) 1)
            (hud_deactivate_team_nav_point_flag player "nav_hab_02")
        )
    )
    (sleep_until (>= g_br_obj_control 1) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (= g_br_obj_control 0) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_hab_03" 0.0)
            (sleep_until (>= g_br_obj_control 1) 1)
            (hud_deactivate_team_nav_point_flag player "nav_hab_03")
        )
    )
)

(script dormant void nav_br
    (sleep_until (>= g_br_obj_control 3) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_br_obj_control 4) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_br_01" g_nav_offset)
            (sleep_until (>= g_br_obj_control 5) 1)
            (hud_deactivate_team_nav_point_flag player "nav_br_01")
        )
    )
)

(script dormant void nav_hc
    (sleep_until (>= g_hc_obj_control 3) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_hc_obj_control 3) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_hc_01" g_nav_offset)
            (sleep_until (>= g_hc_obj_control 4) 1)
            (hud_deactivate_team_nav_point_flag player "nav_hc_01")
        )
    )
    (sleep_until (>= g_hc_obj_control 4) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_hc_obj_control 5) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_hc_02" 0.0)
            (sleep_until (>= g_hc_obj_control 6) 1)
            (hud_deactivate_team_nav_point_flag player "nav_hc_02")
        )
    )
)

(script dormant void nav_pr
    (sleep_until (>= g_pr_obj_control 2) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_pr_obj_control 3) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_pr_01" g_nav_offset)
            (sleep_until (>= g_pr_obj_control 4) 1)
            (hud_deactivate_team_nav_point_flag player "nav_pr_01")
        )
    )
)

(script dormant void nav_hd
    (sleep_until (>= g_hd_obj_control 0) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (= g_hd_obj_control 0) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_hd_01" g_nav_offset)
            (sleep_until (>= g_hd_obj_control 1) 1)
            (hud_deactivate_team_nav_point_flag player "nav_hd_01")
        )
    )
)

(script dormant void nav_rec
    (sleep_until (>= g_re_obj_control 2) 30 g_nav_timeout)
    (sleep g_nav_sleep)
    (if (<= g_re_obj_control 4) 
        (begin
            (hud_activate_team_nav_point_flag player "nav_rec_01" g_nav_offset)
            (sleep_until (>= g_re_obj_control 5) 1)
            (hud_deactivate_team_nav_point_flag player "nav_rec_01")
        )
    )
)

(script dormant void gs_hc_exit_nav
    (sleep_until reactor_blown)
    (sleep_until (>= g_hc_nav_progress 1) 1 g_nav_sleep)
    (if (= g_hc_nav_progress 0) 
        (begin
            (if dialogue 
                (print "cortana: an explosion just made us an exit!"))
            (sleep (ai_play_line_on_object none 110mx_030))
            (sleep 15)
            (if dialogue 
                (print "cortana: i'll mark it in your hud. get moving!"))
            (sleep (ai_play_line_on_object none 110mx_040))
            (sleep 5)
        )
    )
    (hud_activate_team_nav_point_flag player "nav_exit_hole" g_nav_offset)
    (sleep_until (>= g_hc_nav_progress 1) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_hole")
    (sleep_until (>= g_hc_nav_progress 2) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 1) 
        (begin
            (if dialogue 
                (print "cortana: analyzing the route ahead... i have it mostly figured out..."))
            (sleep (ai_play_line_on_object none 110mx_050))
            (sleep 15)
            (if dialogue 
                (print "cortana: just keep going! i'll update your hud as quickly as i can!"))
            (sleep (ai_play_line_on_object none 110mx_060))
            (sleep 5)
            (if debug 
                (print "activate nav point exit 01"))
            (hud_activate_team_nav_point_flag player "nav_exit_01" g_nav_offset)
        )
    )
    (sleep_until (>= g_hc_nav_progress 2) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_01")
    (sleep_until (>= g_hc_nav_progress 3) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 2) 
        (begin
            (if dialogue 
                (print "cortana: corridors beyond this point have collapsed..."))
            (sleep (ai_play_line_on_object none 110mx_080))
            (sleep 15)
            (if dialogue 
                (print "cortana: i'm looking for an alternate -- careful!!"))
            (sleep (ai_play_line_on_object none 110mx_090))
            (sleep 15)
            (if debug 
                (print "activate nav point exit 02"))
            (hud_activate_team_nav_point_flag player "nav_exit_02" g_nav_offset)
        )
    )
    (sleep_until (>= g_hc_nav_progress 3) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_02")
    (sleep_until (>= g_hc_nav_progress 4) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 3) 
        (begin
            (if debug 
                (print "activate nav point exit 03"))
            (hud_activate_team_nav_point_flag player "nav_exit_03" g_nav_offset)
            (if dialogue 
                (print "cortana: there, chief! into the maintenance tunnel!"))
            (sleep (ai_play_line_on_object none 110mx_100))
        )
    )
    (sleep_until (>= g_hc_nav_progress 4) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_03")
    (sleep_until (>= g_hc_nav_progress 5) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 4) 
        (begin
            (if debug 
                (print "activate nav point exit 04"))
            (hud_activate_team_nav_point_flag player "nav_exit_04" g_nav_offset)
        )
    )
    (sleep_until (>= g_hc_nav_progress 5) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_04")
    (sleep_until (>= g_hc_nav_progress 6) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 5) 
        (begin
            (if debug 
                (print "activate nav point exit 05"))
            (hud_activate_team_nav_point_flag player "nav_exit_05" g_nav_offset)
        )
    )
    (sleep_until (>= g_hc_nav_progress 6) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_05")
    (sleep_until (>= g_hc_nav_progress 7) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 6) 
        (begin
            (if debug 
                (print "activate nav point exit 06"))
            (hud_activate_team_nav_point_flag player "nav_exit_06" g_nav_offset)
        )
    )
    (sleep_until (>= g_hc_nav_progress 7) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_06")
    (sleep_until (>= g_hc_nav_progress 8) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 7) 
        (begin
            (if debug 
                (print "activate nav point exit 07"))
            (hud_activate_team_nav_point_flag player "nav_exit_07" g_nav_offset)
        )
    )
    (sleep_until (>= g_hc_nav_progress 8) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_07")
    (sleep_until (>= g_hc_nav_progress 9) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 8) 
        (begin
            (if debug 
                (print "activate nav point exit 08"))
            (hud_activate_team_nav_point_flag player "nav_exit_08" g_nav_offset)
        )
    )
    (sleep_until (>= g_hc_nav_progress 9) 1)
    (hud_deactivate_team_nav_point_flag player "nav_exit_08")
    (sleep_until (>= g_hc_nav_progress 10) 1 g_nav_sleep)
    (if (<= g_hc_nav_progress 9) 
        (begin
            (if debug 
                (print "activate nav point exit pelican"))
            (hud_activate_team_nav_point_flag player "nav_exit_pelican" 0.0)
        )
    )
)

(script dormant void gs_hc_nav_progression
    (sleep_until (volume_test_players "tv_nav_exit_01") 1)
    (if debug 
        (print "set exit nav progress 1"))
    (set g_hc_nav_progress 1)
    (sleep_until (volume_test_players "tv_nav_exit_02") 1)
    (if debug 
        (print "set exit nav progress 2"))
    (set g_hc_nav_progress 2)
    (sleep_until (volume_test_players "tv_nav_exit_03") 1)
    (if debug 
        (print "set exit nav progress 3"))
    (set g_hc_nav_progress 3)
    (sleep_until (volume_test_players "tv_nav_exit_04") 1)
    (if debug 
        (print "set exit nav progress 4"))
    (set g_hc_nav_progress 4)
    (sleep_until (volume_test_players "tv_nav_exit_05") 1)
    (if debug 
        (print "set exit nav progress 5"))
    (set g_hc_nav_progress 5)
    (sleep_until (volume_test_players "tv_nav_exit_06") 1)
    (if debug 
        (print "set exit nav progress 6"))
    (set g_hc_nav_progress 6)
    (sleep_until (volume_test_players "tv_nav_exit_07") 1)
    (if debug 
        (print "set exit nav progress 7"))
    (set g_hc_nav_progress 7)
    (sleep_until (volume_test_players "tv_nav_exit_08") 1)
    (if debug 
        (print "set exit nav progress 8"))
    (set g_hc_nav_progress 8)
    (sleep_until (volume_test_players "tv_nav_exit_pelican") 1)
    (if debug 
        (print "set exit nav progress 9"))
    (set g_hc_nav_progress 9)
)

(script static void test_nav_exit
    (wake gs_hc_exit_nav)
    (wake gs_hc_nav_progression)
    (set g_cortana_rescued true)
    (set pylon_count 0)
    (object_destroy "door_reactor_escape")
    (object_destroy "big_screen")
    (object_destroy "door_bridge_escape")
    (object_destroy_containing "cafe_panel")
    (object_teleport (player0) "nav_exit_teleport")
)

(script dormant void music_010_01
    (sleep_until (>= g_ih_obj_control 2) 1 (* 30.0 20.0))
    (set g_music_110_01 true)
    (if music 
        (print "start music 010_01"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_01" none 1.0)
    (sleep 1)
    (sleep_until (not g_music_110_01) 1)
    (if music 
        (print "stop music 010_01"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_01")
)

(script dormant void music_010_02
    (sleep_until 
        (and
            (>= g_ih_obj_control 3)
            (>= (device_get_position "intro_sphincter") 0.5)
        ) 
    1)
    (set g_music_110_02 true)
    (if music 
        (print "start music 010_02"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_02" none 1.0)
    (sleep 1)
    (sleep_until 
        (and
            (>= (device_get_position "pel_end_sphincter") 0.5)
            (>= g_hab_obj_control 1)
        ) 
    1)
    (if music 
        (print "alternate music 010_06"))
    (sound_looping_set_alternate "levels\solo\110_hc\music\110_music_02" true)
    (sleep_until 
        (and
            (>= (device_get_position "hall_2_3_sphincter") 0.5)
            (>= g_hab_obj_control 4)
        ) 
    1)
    (if music 
        (print "alternate music 010_06"))
    (sound_looping_set_alternate "levels\solo\110_hc\music\110_music_02" false)
    (sleep_until (>= g_br_obj_control 1) 1)
    (if music 
        (print "alternate music 010_06"))
    (sound_looping_set_alternate "levels\solo\110_hc\music\110_music_02" true)
    (sleep_until (not g_music_110_02) 1)
    (if music 
        (print "stop music 010_02"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_02")
)

(script dormant void music_010_03
    (sleep_until 
        (and
            (>= g_ih_obj_control 5)
            (>= (device_get_position "horizontal_sphincter") 0.5)
        ) 
    1)
    (set g_music_110_03 true)
    (if music 
        (print "start music 010_03"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_03" none 1.0)
    (sleep 1)
    (sleep_until (not g_music_110_03) 1)
    (if music 
        (print "stop music 010_03"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_03")
)

(script dormant void music_010_04
    (sleep_until (>= g_br_obj_control 1) 1)
    (set g_music_110_04 true)
    (if music 
        (print "start music 010_04"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_04" none 1.0)
    (sleep 1)
    (sleep_until (not g_music_110_04) 1)
    (if music 
        (print "stop music 010_04"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_04")
)

(script dormant void music_010_05
    (sleep_until g_music_110_05 1)
    (if music 
        (print "start music 010_05"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_05" none 1.0)
    (sleep_until (not g_music_110_05) 1)
    (if music 
        (print "stop music 010_05"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_05")
)

(script dormant void music_010_06
    (sleep_until 
        (or
            g_music_110_06
            (>= (device_get_position "prisoner_sphincter") 0.5)
        ) 
    1)
    (set g_music_110_06 true)
    (if music 
        (print "start music 010_06"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_06" none 1.0)
    (sleep 1)
    (sleep_until (not g_music_110_06) 1)
    (if music 
        (print "stop music 010_06"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_06")
)

(script dormant void music_010_07
    (sleep_until g_music_110_07 1)
    (if music 
        (print "start music 010_07"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_07" none 1.0)
    (sleep_until (not g_music_110_07) 1)
    (if music 
        (print "stop music 010_07"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_07")
)

(script dormant void music_010_08
    (sleep_until g_music_110_08 1)
    (if music 
        (print "start music 010_08"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_08" none 1.0)
    (sleep_until (not g_music_110_08) 1)
    (if music 
        (print "stop music 010_08"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_08")
)

(script dormant void music_010_09
    (sleep_until g_music_110_09 1)
    (if music 
        (print "start music 010_09"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_09" none 1.0)
    (sleep_until (not g_music_110_09) 1)
    (if music 
        (print "stop music 010_09"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_09")
)

(script dormant void music_010_10
    (sleep_until g_music_110_10 1)
    (if music 
        (print "start music 010_10"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_10" none 1.0)
    (sleep_until (not g_music_110_10) 1)
    (if music 
        (print "stop music 010_10"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_10")
)

(script dormant void music_010_11
    (sleep_until g_music_110_11 1)
    (if music 
        (print "start music 010_11"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_11" none 1.0)
    (sleep_until (<= pylon_count 2))
    (if music 
        (print "stop music 010_11"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_11")
)

(script dormant void music_010_12
    (sleep_until g_music_110_12 1)
    (if music 
        (print "start music 010_12"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_12" none 1.0)
    (sleep 1)
    (sleep_until (volume_test_players "tv_music_12_13"))
    (if music 
        (print "stop music 010_12"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_12")
)

(script dormant void music_010_13
    (sleep_until (volume_test_players "tv_music_12_13"))
    (set g_music_110_13 true)
    (if music 
        (print "start music 010_13"))
    (sound_looping_start "levels\solo\110_hc\music\110_music_13" none 1.0)
    (sleep 1)
    (sleep_until (not g_music_110_13) 1)
    (if music 
        (print "stop music 010_13"))
    (sound_looping_stop "levels\solo\110_hc\music\110_music_13")
)

(script static void gs_music_off
    (sound_looping_stop "levels\solo\110_hc\music\110_music_01")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_02")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_03")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_04")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_05")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_06")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_07")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_08")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_09")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_10")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_11")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_12")
    (sound_looping_stop "levels\solo\110_hc\music\110_music_13")
)

(script dormant void ambient_audio_rumble
    (sleep_until g_amb_audio_01 1)
    (if debug 
        (print "begin rumble loop"))
    (sound_looping_start "sound\levels\110_hc\hc_escape_rumble\hc_escape_rumble" none 1.0)
    (sleep_until (not g_amb_audio_01) 1)
    (if debug 
        (print "end rumble loop"))
    (sound_looping_stop "sound\levels\110_hc\hc_escape_rumble\hc_escape_rumble")
)

(script dormant void ch_01_gravemind
    (sleep_until (volume_test_players "tv_fict_01_grave") 1)
    (sleep (random_range 5 15))
    (if debug 
        (print "gravemind_channel : 01 : 110ga_child"))
    (set g_music_110_01 false)
    (wake 110ga_child)
    (set g_approach_player false)
)

(script dormant void ch_02_cortana
    (sleep_until (volume_test_players "tv_fict_02_cortana") 1)
    (if debug 
        (print "cortana : 02 : 110ca_crying"))
    (wake 110ca_crying)
)

(script dormant void ch_03_pelican_hill
    (sleep_until 
        (or
            (volume_test_players "tv_fict_03_pel_radio")
            (>= g_hab_obj_control 1)
        ) 
    1)
    (if (= g_hab_obj_control 0) 
        (begin
            (if debug 
                (print "ambient : cortana : 03 : wrapped_tight"))
            (if dialogue 
                (print "cortana: i ran. tried to stay hidden."))
            (sleep (ai_play_line_on_object "spkr_ch03_pel_hill" 110cd_010))
            (sleep 15)
            (if dialogue 
                (print "cortana: but there is nothing left."))
            (sleep (ai_play_line_on_object "spkr_ch03_pel_hill" 110cd_020))
            (sleep 15)
            (if dialogue 
                (print "cortana: it cornered me. wrapped me tight, and brought me close."))
            (sleep (ai_play_line_on_object "spkr_ch03_pel_hill" 110cd_030))
        )
    )
)

(script dormant void ch_04_gravemind
    (sleep_until (volume_test_players "tv_fict_04_grave") 1)
    (sleep (random_range 5 15))
    (if debug 
        (print "gravemind_channel : 04 : 110gb_together"))
    (wake 110gb_together)
)

(script dormant void ch_05_gravemind
    (sleep_until (volume_test_players "tv_fict_05_grave") 1)
    (if debug 
        (print "ambient : gravemind : 05 : 110gc_locked"))
    (if dialogue 
        (print "cortana: a collection of lies! that's all i am!"))
    (sound_impulse_trigger "sound\dialog\110_hc\cortana\110cb_010_cor" "spkr_ch05_01" 1.0 1)
    (sound_impulse_trigger "sound\dialog\110_hc\cortana\110cb_010_cor" "spkr_ch05_02" 1.0 1)
    (sound_impulse_trigger "sound\dialog\110_hc\cortana\110cb_010_cor" "spkr_ch05_03" 1.0 1)
    (sleep (ai_play_line_on_object "spkr_ch05_04" 110cb_010))
    (sleep 15)
    (if dialogue 
        (print "cortana: stolen thoughts and memories!"))
    (sound_impulse_trigger "sound\dialog\110_hc\cortana\110cb_020_cor" "spkr_ch05_01" 1.0 1)
    (sound_impulse_trigger "sound\dialog\110_hc\cortana\110cb_020_cor" "spkr_ch05_02" 1.0 1)
    (sound_impulse_trigger "sound\dialog\110_hc\cortana\110cb_020_cor" "spkr_ch05_03" 1.0 1)
    (sleep (ai_play_line_on_object "spkr_ch05_04" 110cb_020))
    (sleep 15)
    (set g_music_110_03 false)
    (wake 110gc_locked)
)

(script dormant void ch_06_cortana
    (sleep_until (volume_test_players "tv_fict_06_cortana") 1)
    (if debug 
        (print "ambient : cortana : 06 : games"))
    (if (<= (device_group_get "dg_fict_07_switch") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: can i speak with you please?"))
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_010_cor" "spkr_ch06_01" 1.0 1)
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_010_cor" "spkr_ch06_02" 1.0 1)
            (sleep (ai_play_line_on_object "spkr_ch06_03" 110ce_010))
            (sleep (* 30.0 4.0))
        )
    )
    (if (<= (device_group_get "dg_fict_07_switch") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: what's your name?"))
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_020_cor" "spkr_ch06_01" 1.0 1)
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_020_cor" "spkr_ch06_02" 1.0 1)
            (sleep (ai_play_line_on_object "spkr_ch06_03" 110ce_020))
            (sleep (* 30.0 4.0))
        )
    )
    (if (<= (device_group_get "dg_fict_07_switch") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: it's very nice to meet you."))
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_030_cor" "spkr_ch06_01" 1.0 1)
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_030_cor" "spkr_ch06_02" 1.0 1)
            (sleep (ai_play_line_on_object "spkr_ch06_03" 110ce_030))
            (sleep (* 30.0 4.0))
        )
    )
    (if (<= (device_group_get "dg_fict_07_switch") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: you like games. so do i."))
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_040_cor" "spkr_ch06_01" 1.0 1)
            (sound_impulse_trigger "sound\dialog\110_hc\cortana\110ce_040_cor" "spkr_ch06_02" 1.0 1)
            (sleep (ai_play_line_on_object "spkr_ch06_03" 110ce_040))
        )
    )
)

(script dormant void ch_07_cortana
    (sleep_until 
        (or
            (> (device_group_get "dg_fict_07_switch") 0.0)
            (>= g_pr_obj_control 1)
        )
    )
    (if debug 
        (print "ambient : cortana : 07 : 110cb_coin"))
    (if (<= g_pr_obj_control 0) 
        (begin
            (wake 110cb_coin)
            (sleep 30)
            (object_destroy "cortana_beacon_light")
            (cortana_terminal_was_accessed)
        ) (begin
            (object_destroy "fict_07_switch")
        )
    )
)

(script dormant void ch_08_cortana
    (sleep_until (volume_test_players "tv_fict_08_cortana") 1)
    (if debug 
        (print "ambient : gravemind : 08 : shadow"))
    (if dialogue 
        (print "cortana: i'm just my mother's shadow!"))
    (sleep (ai_play_line_on_object "spkr_ch_08_01" 110ca_010))
    (set g_music_110_02 false)
    (set g_music_110_04 false)
    (sleep 45)
    (if dialogue 
        (print "cortana: don't look at me! don't listen!"))
    (sleep (ai_play_line_on_object "spkr_ch_08_01" 110ca_030))
    (sleep 45)
    (if dialogue 
        (print "cortana: i'm not who i used to be!"))
    (sleep (ai_play_line_on_object "spkr_ch_08_01" 110ca_040))
)

(script dormant void ch_09_gravemind
    (sleep_until (volume_test_players "tv_fict_09_grave") 1)
    (sleep (random_range 5 15))
    (if debug 
        (print "gravemind_channel : 09 : 110gd_patience"))
    (sleep 3)
    (wake 110gd_patience)
    (sleep 420)
    (set g_music_110_05 true)
)

(script dormant void ch_10_cortana
    (sleep_until (volume_test_players "tv_fict_10_cortana") 1)
    (if debug 
        (print "cortana : 10 : 110cc_abyss"))
    (wake 110cc_abyss)
    (set g_music_110_05 false)
    (set g_music_110_06 false)
    (sleep 450)
    (set g_music_110_07 true)
)

(script dormant void ch_11_gravemind
    (sleep_until (volume_test_players "tv_fict_11_grave") 1)
    (if debug 
        (print "gravemind : 11 : 110cd_no_more"))
    (if (= g_cortana_rescued false) 
        (begin
            (wake 110cd_no_more)
        )
    )
)

(script dormant void ch_12_gravemind
    (sleep_until (volume_test_players "tv_fict_12_14_grave") 1)
    (if debug 
        (print "gravemind : 12 : 110ce_monument"))
    (if (= g_cortana_rescued false) 
        (begin
            (wake 110ce_monument)
            (set g_music_110_09 false)
            (set g_music_110_10 false)
        )
    )
)

(script dormant void ch_13a_cortana
    (sleep_until 
        (or
            g_stasis_field_destroyed
            (volume_test_players "tv_fict_13_cortana")
        ) 
    1)
    (if (= g_stasis_field_destroyed false) 
        (begin
            (if debug 
                (print "cortana : 13 : 110cf_torture"))
            (sound_looping_start "sound\visual_fx\cortana_effect\cortana_effect" none 1.0)
            (sleep_until 
                (begin
                    (wake 110cf_torture)
                    (sleep 450)
                    g_stasis_field_destroyed
                ) 
            1)
        )
    )
)

(script dormant void ch_13b_cortana
    (sleep_until g_cortana_rescued 1)
    (sleep (* 30.0 10.0))
    (if (= (volume_test_players_all "vol_inner_sanctum") true) 
        (begin
            (if dialogue 
                (print "cortana: chief. get me out of this place..."))
            (sleep (ai_play_line_on_object none 110mj_040))
            (sleep 30)
        )
    )
    (if (= (volume_test_players_all "vol_inner_sanctum") true) 
        (begin
            (if dialogue 
                (print "cortana: i... i don't want to stay."))
            (sleep (ai_play_line_on_object none 110mj_050))
            (sleep 15)
            (device_set_position "sanctum_door_03" 1.0)
            (sleep_until (= (device_get_position "sanctum_door_03") 1.0) 5)
            (device_operates_automatically_set "sanctum_door_03" false)
            (device_set_power "sanctum_door_03" 0.0)
        )
    )
)

(script dormant void ch_14_gravemind
    (sleep_until (volume_test_players "tv_fict_12_14_grave") 1)
    (if debug 
        (print "gravemind : 14 : 110ge_revealed"))
    (wake 110ge_revealed)
    (sleep_until 
        (and
            g_ch_14_cortana_talk
            (volume_test_players "tv_fict_14_continue")
        )
    )
    (sleep (random_range 45 90))
    (if (<= (device_group_get "pylons") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: we need to buy some time..."))
            (sleep (ai_play_line_on_object none 110ml_030))
            (sleep 30)
        )
    )
    (if (<= (device_group_get "pylons") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: this reactor... start a chain reaction... destroy high charity!"))
            (sleep (ai_play_line_on_object none 110ml_040))
            (sleep 30)
            (hud_activate_team_nav_point_flag player "nav_reactor_switch" 0.05)
        )
    )
    (wake objective_2_set)
    (sleep_until (= (device_group_get "pylons") 1.0))
    (hud_deactivate_team_nav_point_flag player "nav_reactor_switch")
)

(script dormant void ch_15_cortana
    (sleep_until reactor_blown 1)
    (if debug 
        (print "cortana : 15 : 110gf_defeat"))
    (sleep (random_range 90 150))
    (if dialogue 
        (print "gravemind: (roar of frustration and defeat)"))
    (sleep (ai_play_line_on_object none 110ml_350))
    (if dialogue 
        (print "cortana: you hurt it, chief. but not for long."))
    (sleep (ai_play_line_on_object none 110mx_010))
    (sleep 30)
    (if dialogue 
        (print "cortana: we need to get to halo -- destroy the flood, once and for all!"))
    (sleep (ai_play_line_on_object none 110mx_020))
)

(script dormant void ch_16_cortana
    (sleep_until (volume_test_players "tv_fict_16_cortana"))
    (if debug 
        (print "cortana : 16 : friendly_contact"))
    (sleep (random_range 15 30))
    (if dialogue 
        (print "cortana: i've got a friendly contact!"))
    (sleep (ai_play_line_on_object none 110mx_180))
    (sleep 15)
    (if dialogue 
        (print "cortana: who would be crazy enough to come in here?"))
    (sleep (ai_play_line_on_object none 110mx_190))
    (sleep 15)
    (set g_ch_16_cortana_finished true)
)

(script dormant void ch_17_cortana
    (sleep_until 
        (and
            g_ch_16_cortana_finished
            (volume_test_players "tv_fict_17_cortana")
        )
    )
    (if debug 
        (print "cortana : 16 : friendly_contact"))
    (sleep (random_range 15 30))
    (if dialogue 
        (print "cortana: wait. you two made nice?"))
    (sleep (ai_play_line_on_object none 110mx_200))
    (sleep 15)
    (if dialogue 
        (print "cortana: what else did you do while i was gone?"))
    (sleep (ai_play_line_on_object none 110mx_210))
)

(script dormant void reactor_return_dlg
    (sleep 60)
    (if dialogue 
        (print "gravemind: now at last i see"))
    (ai_play_line "reactor_rev_oldskool" 110mk_010)
    (sleep (ai_play_line_on_point_set "110mk_010" "reactor_gm_pts" 3 "grv"))
    (sleep 10)
    (if dialogue 
        (print "gravemind: the spike you would drive in my heart --"))
    (ai_play_line "reactor_rev_oldskool" 110mk_030)
    (sleep (ai_play_line_on_point_set "110mk_030" "reactor_gm_pts" 3 "grv"))
    (sleep 10)
    (sleep_until 
        (or
            (= (volume_test_players "vol_flood_blockage") true)
            (< (ai_nonswarm_count "reactor_rev_oldskool") 1)
            (= (device_group_get "pylons") 1.0)
        ) 
    5 45)
    (sleep 45)
    (if dialogue 
        (print "cortana: we can't...we can't let it stop us."))
    (sleep (ai_play_line_on_object none 110ml_010))
    (sleep 10)
    (if dialogue 
        (print "cortana: not now...not with everything at stake!"))
    (sleep (ai_play_line_on_object none 110ml_020))
    (sleep 10)
    (if dialogue 
        (print "cortana: we need to buy some time"))
    (sleep (ai_play_line_on_object none 110ml_030))
    (sleep 10)
    (if dialogue 
        (print "cortana: this reactor...start a chain reaction...destroy high charity!"))
    (sleep (ai_play_line_on_object none 110ml_040))
    (sleep 10)
    (sleep_until (= (device_group_get "pylons") 1.0) 30 150)
    (if (= (device_group_get "pylons") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: those pylons expose the reactor cores."))
            (sleep (ai_play_line_on_object none 110ml_090))
            (sleep 10)
        )
    )
    (if (= (device_group_get "pylons") 0.0) 
        (begin
            (if dialogue 
                (print "cortana: look for a console center of the room."))
            (sleep (ai_play_line_on_object none 110ml_100))
        )
    )
    (if (= (device_group_get "pylons") 0.0) 
        (begin
            (hud_activate_team_nav_point_flag player "switch_flag" 0.0)
        )
    )
    (sleep 30)
)

(script dormant void core_reveal_dlg
    (sleep_forever reactor_return_dlg)
    (if dialogue 
        (print "cortana: there! see the cores?"))
    (sleep (ai_play_line_on_object none 110ml_250))
    (sleep 10)
    (if 
        (or
            (difficulty_heroic)
            (difficulty_legendary)
        ) 
            (begin
                (if dialogue 
                    (print "cortana: you'll have to get past their shielding!"))
                (sleep (ai_play_line_on_object none 110ml_260))
                (sleep 10)
                (sleep_until 
                    (or
                        (<= (objects_distance_to_flag (players) "pylon_01_flag") 5.0)
                        (<= (objects_distance_to_flag (players) "pylon_02_flag") 5.0)
                        (<= (objects_distance_to_flag (players) "pylon_03_flag") 5.0)
                    ) 
                5 900)
                (if 
                    (and
                        (> (objects_distance_to_flag (players) "pylon_01_flag") 6.0)
                        (> (objects_distance_to_flag (players) "pylon_02_flag") 6.0)
                        (> (objects_distance_to_flag (players) "pylon_03_flag") 6.0)
                    ) 
                        (begin
                            (if dialogue 
                                (print "cortana: closer, chief! destroy the core!"))
                            (sleep (ai_play_line_on_object none 110ml_270))
                        )
                )
            )
    )
    (sleep 30)
)

(script dormant void gm_pylon_reactions
    (sleep_until (= reactor_flood_react_now true))
    (begin_random
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: i am what must be!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_110)
            (sleep (ai_play_line_on_point_set "110ml_110" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: i am your only end!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_120)
            (sleep (ai_play_line_on_point_set "110ml_120" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: meaningless actions!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_130)
            (sleep (ai_play_line_on_point_set "110ml_130" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: unforgivable transgressions!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_140)
            (sleep (ai_play_line_on_point_set "110ml_140" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: do not deny me!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_150)
            (sleep (ai_play_line_on_point_set "110ml_150" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: accept and obey!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_160)
            (sleep (ai_play_line_on_point_set "110ml_160" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: you dare disturb my grave?!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_170)
            (sleep (ai_play_line_on_point_set "110ml_170" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: you are buried! she is broken!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_180)
            (sleep (ai_play_line_on_point_set "110ml_180" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: your reunion will be brief!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_190)
            (sleep (ai_play_line_on_point_set "110ml_190" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: i will rip her from you!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_200)
            (sleep (ai_play_line_on_point_set "110ml_200" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: was she worth the effort?!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_210)
            (sleep (ai_play_line_on_point_set "110ml_210" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: little liar and her slave!"))
            (ai_play_line "reactor_rev_oldskool" 110ml_220)
            (sleep (ai_play_line_on_point_set "110ml_220" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: (angry roar #1)"))
            (ai_play_line "reactor_rev_oldskool" 110ml_230)
            (sleep (ai_play_line_on_point_set "110ml_230" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
        (begin
            (sleep_until (= reactor_flood_react_now true))
            (sleep 60)
            (if dialogue 
                (print "gravemind: (angry roar #2)"))
            (ai_play_line "reactor_rev_oldskool" 110ml_240)
            (sleep (ai_play_line_on_point_set "110ml_240" "reactor_gm_pts" 3 "grv"))
            (sleep 30)
            (set reactor_flood_react_now false)
        )
    )
)

(script dormant void gm_pylon_reaction_control
    (wake gm_pylon_reactions)
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (= pylon_count 0)
                    (> gm_reaction_okay 0)
                )
            )
            (if 
                (and
                    (= gm_reaction_okay 2)
                    (!= pylon_count 0)
                ) 
                    (begin
                        (set gm_reaction_okay (- gm_reaction_okay 1.0))
                        (set reactor_flood_react_now true)
                        (sleep_until 
                            (or
                                (= gm_reaction_okay 2)
                                (= pylon_count 0)
                            ) 
                        30 (random_range 450 600))
                    )
            )
            (sleep_until 
                (or
                    (= pylon_count 0)
                    (!= gm_reaction_okay 1)
                    (and
                        (> (objects_distance_to_flag (players) "pylon_01_flag") 7.0)
                        (> (objects_distance_to_flag (players) "pylon_02_flag") 7.0)
                        (> (objects_distance_to_flag (players) "pylon_03_flag") 7.0)
                    )
                )
            )
            (if 
                (and
                    (!= pylon_count 0)
                    (= gm_reaction_okay 1)
                ) 
                    (begin
                        (set gm_reaction_okay (- gm_reaction_okay 1.0))
                        (set reactor_flood_react_now true)
                    )
            )
            (= pylon_count 0)
        )
    )
)

(script dormant void pylon_destruction_dlg
    (sleep_until 
        (or
            (<= (objects_distance_to_flag (players) "pylon_01_flag") 5.0)
            (<= (objects_distance_to_flag (players) "pylon_02_flag") 5.0)
            (<= (objects_distance_to_flag (players) "pylon_03_flag") 5.0)
        ) 
    5)
    (sleep_forever core_reveal_dlg)
    (if 
        (or
            (difficulty_heroic)
            (difficulty_legendary)
        ) 
            (begin
                (if dialogue 
                    (print "cortana: jump! you can make it!"))
                (sleep (ai_play_line_on_object none 110ml_280))
                (sleep 30)
            )
    )
    (sleep_until 
        (or
            (<= (object_get_health "pylon_01x") 0.0)
            (<= (object_get_health "pylon_02x") 0.0)
            (<= (object_get_health "pylon_03x") 0.0)
        ) 
    1)
    (wake gm_pylon_reaction_control)
    (if 
        (or
            (and
                (<= (object_get_health "pylon_01x") 0.0)
                (= (volume_test_players "vol_pylon_01") true)
            )
            (and
                (<= (object_get_health "pylon_02x") 0.0)
                (= (volume_test_players "vol_pylon_02") true)
            )
            (and
                (<= (object_get_health "pylon_03x") 0.0)
                (= (volume_test_players "vol_pylon_03") true)
            )
        ) 
            (begin
                (if dialogue 
                    (print "cortana: it's going to fall, chief!"))
                (sleep (ai_play_line_on_object none 110ml_290))
                (sleep 30)
            )
    )
    (if 
        (or
            (and
                (<= (object_get_health "pylon_01x") 0.0)
                (= (volume_test_players "vol_pylon_01") true)
            )
            (and
                (<= (object_get_health "pylon_02x") 0.0)
                (= (volume_test_players "vol_pylon_02") true)
            )
            (and
                (<= (object_get_health "pylon_03x") 0.0)
                (= (volume_test_players "vol_pylon_03") true)
            )
        ) 
            (begin
                (if dialogue 
                    (print "cortana: jump off! now!"))
                (sleep (ai_play_line_on_object none 110ml_300))
                (sleep 30)
            )
    )
    (sleep 30)
    (set gm_reaction_okay 2)
    (sleep_until (= pylon_count 2))
    (set gm_reaction_okay 0)
    (sleep 60)
    (if dialogue 
        (print "cortana: the reactor's starting to fluctuate!"))
    (sleep (ai_play_line_on_object none 110ml_310))
    (sleep 10)
    (if dialogue 
        (print "cortana: two more cores to go!"))
    (sleep (ai_play_line_on_object none 110ml_320))
    (sleep 30)
    (sleep 30)
    (set gm_reaction_okay 2)
    (sleep_until (= pylon_count 1))
    (set gm_reaction_okay 0)
    (sleep 60)
    (if dialogue 
        (print "cortana: keep it up, chief!  it's working!"))
    (sleep (ai_play_line_on_object none 110ml_330))
    (sleep 10)
    (if dialogue 
        (print "cortana: one more will do it!"))
    (sleep (ai_play_line_on_object none 110ml_340))
    (sleep 30)
    (sleep 30)
    (set gm_reaction_okay 2)
    (sleep_until (= pylon_count 0))
    (set gm_reaction_okay 0)
)

(script static boolean introearly_0_1
    (>= g_ih_obj_control 2)
)

(script static boolean pelicstalk_3_2
    g_ph_stalker_retreat
)

(script static boolean pelictop_g_3_4
    (<= g_ph_obj_control 6)
)

(script static boolean pelicpure__3_9
    (<= (ai_task_count "pelican_hill_obj/combat_top_01") 0)
)

(script static boolean pelicbotto_3_16
    (<= g_ph_obj_control 5)
)

(script static boolean pelicbotto_3_17
    (<= g_ph_obj_control 5)
)

(script static boolean peliccarri_3_18
    (>= g_ph_obj_control 4)
)

(script static boolean peliccarri_3_19
    (>= g_ph_obj_control 3)
)

(script static boolean pelicupper_3_22
    (>= g_ph_obj_control 4)
)

(script static boolean pelicbotto_3_25
    (<= g_ph_obj_control 3)
)

(script static boolean peliccomba_3_30
    (<= g_ph_obj_control 5)
)

(script static boolean peliccomba_3_31
    (<= g_ph_obj_control 6)
)

(script static boolean cafettank__6_13
    (>= g_br_obj_control 3)
)

(script static boolean cafetgate__6_14
    (<= g_br_obj_control 1)
)

(script static boolean hallwpure__7_7
    (>= (ai_combat_status "hallway_4_obj") 5)
)

(script static boolean hallwmid_p_7_8
    (<= g_hc_obj_control 3)
)

(script static boolean hallwini_p_7_9
    (<= g_hc_obj_control 2)
)

(script static boolean hallwpuref_7_11
    (>= g_hc_obj_control 5)
)

(script static boolean hallwcomba_7_12
    (>= g_hc_obj_control 5)
)

(script static boolean hallwcomba_7_13
    (>= (ai_task_count "hallway_4_obj/combat_01") 0)
)

(script static boolean prisofloor_8_6
    (<= g_pr_obj_control 1)
)

(script static boolean prisofloor_8_7
    (<= g_pr_obj_control 2)
)

(script static boolean prisopuref_8_10
    (<= g_pr_obj_control 1)
)

(script static boolean prisopuref_8_11
    (<= g_pr_obj_control 2)
)

(script static boolean reactini_p_10_4
    (<= g_re_obj_control 4)
)

(script static boolean reactini_p_10_5
    (<= g_re_obj_control 4)
)

(script static boolean reactini_p_10_6
    (<= g_re_obj_control 3)
)

(script static boolean reactini_c_10_8
    (<= g_re_obj_control 5)
)

(script static boolean reactini_c_10_9
    (<= g_re_obj_control 3)
)

(script static boolean reactini_p_10_16
    (<= g_re_obj_control 4)
)

(script static boolean reactini_p_10_18
    (<= g_re_obj_control 4)
)

(script static boolean reactold_p_12_0
    (and
        (< (objects_distance_to_flag (players) "pylon_03_flag") 10.0)
        (= (device_group_get "pylons") 1.0)
    )
)

(script static boolean reactold_p_12_1
    (and
        (< (objects_distance_to_flag (players) "pylon_02_flag") 10.0)
        (= (device_group_get "pylons") 1.0)
    )
)

(script static boolean reactold_p_12_2
    (and
        (< (objects_distance_to_flag (players) "pylon_01_flag") 10.0)
        (= (device_group_get "pylons") 1.0)
    )
)

(script static boolean reactoldsk_12_3
    (= reactor_blown false)
)

(script static boolean reactpure__12_7
    (not reactor_blown)
)

(script static boolean reactpure__12_8
    (not reactor_blown)
)

(script static boolean hall4retre_13_1
    (<= g_hcr_obj_control 1)
)

(script static boolean hall4retre_13_2
    (<= g_hcr_obj_control 2)
)

(script static boolean hall4poke_13_4
    (<= g_hcr_obj_control 5)
)

(script static boolean cafe_jumpe_14_3
    (>= g_brr_obj_control 4)
)

(script static boolean hallsretre_15_1
    (>= g_habr_obj_control 3)
)

(script static boolean pel_hattac_16_1
    (= (volume_test_players "vol_pel_rev_right") true)
)

(script static boolean pel_hattac_16_2
    (= (volume_test_players "vol_pel_rev_left") true)
)

(script static boolean pel_hretre_16_6
    (= (volume_test_players "vol_pel_hill_rev_01") false)
)

(script static boolean pel_harbit_16_10
    (volume_test_players "vol_pel_hill_rev_top")
)

(script static boolean pel_harbit_16_11
    (volume_test_players "vol_pel_hill_rev_board")
)

(script static boolean pel_harbit_16_12
    (volume_test_players "vol_pelican_ledge")
)

(script static void start
    (fade_out 0.0 0.0 0.0 0)
    (cond
        ((= (game_insertion_point_get) 0)
            (ins_intro_halls)
        )
        ((= (game_insertion_point_get) 1)
            (ins_reactor_return)
        )
    )
)

(script startup void mission_highcharity
    (if debug 
        (print "bleh!!!!"))
    (print_difficulty)
    (fade_out 0.0 0.0 0.0 0)
    (campaign_metagame_time_pause true)
    (ai_allegiance player human)
    (ai_allegiance player covenant)
    (ai_allegiance human covenant)
    (wake recycle_volumes)
    (wake hc_award_primary_skull)
    (soft_ceiling_enable "no_000" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_pelican_hill_return" false)
    (zone_set_trigger_volume_enable "zone_set:set_pelican_hill_return" false)
    (if 
        (and
            (not editor)
            (> (player_count) 0)
        ) 
            (start) (fade_in 0.0 0.0 0.0 0))
    (sleep_until (>= g_insertion_index 1) 1)
    (if (<= g_insertion_index 1) 
        (wake enc_intro_halls))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_pelican_hill")
            (>= g_insertion_index 2)
        ) 
    1)
    (if (<= g_insertion_index 2) 
        (wake enc_pelican_hill))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_halls_a_b")
            (>= g_insertion_index 3)
        ) 
    1)
    (if (<= g_insertion_index 3) 
        (wake enc_halls_a_b))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_bridge")
            (>= g_insertion_index 4)
        ) 
    1)
    (if (<= g_insertion_index 4) 
        (wake enc_bridge))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_hall_c")
            (>= g_insertion_index 5)
        ) 
    1)
    (if (<= g_insertion_index 5) 
        (wake enc_hall_c))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_prisoner")
            (>= g_insertion_index 6)
        ) 
    1)
    (if (<= g_insertion_index 6) 
        (wake enc_prisoner))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_hall_d")
            (>= g_insertion_index 7)
        ) 
    1)
    (if (<= g_insertion_index 7) 
        (wake enc_hall_d))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_reactor")
            (>= g_insertion_index 8)
        ) 
    1)
    (if (<= g_insertion_index 8) 
        (wake enc_reactor))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_inner_sanctum")
            (>= g_insertion_index 9)
        ) 
    1)
    (if (<= g_insertion_index 9) 
        (wake enc_inner_sanctum))
    (sleep_until 
        (or
            (and
                (= g_cortana_rescued true)
                (volume_test_players "tv_enc_reactor_return")
            )
            (>= g_insertion_index 10)
        ) 
    1)
    (if (<= g_insertion_index 10) 
        (wake enc_reactor_return))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_hall_c_return")
            (>= g_insertion_index 11)
        ) 
    1)
    (if (<= g_insertion_index 11) 
        (wake enc_hall_c_return))
    (sleep_until 
        (or
            (and
                (= reactor_blown true)
                (volume_test_players "tv_enc_bridge_return")
            )
            (>= g_insertion_index 12)
        ) 
    1)
    (if (<= g_insertion_index 12) 
        (wake enc_bridge_return))
    (sleep_until 
        (or
            (and
                (= reactor_blown true)
                (volume_test_players "tv_enc_halls_a_b_return")
            )
            (>= g_insertion_index 13)
        ) 
    1)
    (if (<= g_insertion_index 13) 
        (wake enc_halls_a_b_return))
    (sleep_until 
        (or
            (and
                (= reactor_blown true)
                (volume_test_players "tv_enc_pelican_hill_return")
            )
            (>= g_insertion_index 14)
        ) 
    1)
    (if (<= g_insertion_index 14) 
        (wake enc_pelican_hill_return))
)

(script dormant void enc_intro_halls
    (data_mine_set_mission_segment "110_010_intro_halls")
    (if debug 
        (print "enc_intro_halls"))
    (game_save)
    (wake ih_infection_spawn)
    (wake ih_hull_attract)
    (wake ih_puss_burster)
    (wake ih_flood_disperse)
    (wake ih_cleanup)
    (wake music_010_01)
    (wake music_010_02)
    (wake music_010_03)
    (wake nav_ih)
    (wake ch_01_gravemind)
    (wake ih_object_management)
    (if 
        (or
            (>= (game_difficulty_get) heroic)
            (= (campaign_metagame_enabled) true)
        ) 
            (begin
                (if debug 
                    (print "place heroic / legendary bipeds"))
                (object_create_containing "ih_elite_leg")
            )
    )
    (sleep_until 
        (or
            (volume_test_players "tv_ih_01a")
            (volume_test_players "tv_ih_01b")
        ) 
    1)
    (if debug 
        (print "set objective control 1"))
    (set g_ih_obj_control 1)
    (sleep_until (volume_test_players "tv_ih_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_ih_obj_control 2)
    (game_save)
    (sleep_until (volume_test_players "tv_ih_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_ih_obj_control 3)
    (sleep_until (volume_test_players "tv_ih_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_ih_obj_control 4)
    (sleep_until (volume_test_players "tv_ih_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_ih_obj_control 5)
    (game_save)
)

(script dormant void ih_infection_spawn
    (ai_place "intro_infection/01")
    (ai_place "intro_infection/02")
    (ai_place "intro_infection/03")
    (sleep 1)
    (ai_place "intro_infection/04")
    (ai_place "intro_infection/05")
    (ai_place "intro_infection/06")
    (sleep 1)
    (ai_place "intro_infection/07")
    (ai_place "intro_infection/08")
    (ai_place "intro_infection/09")
    (ai_place "intro_infection/10")
)

(script dormant void ih_hull_attract
    (vs_reserve "intro_infection" 1)
    (begin_random
        (begin
            (vs_swarm_from "intro_infection/01" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/02" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/03" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/04" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/05" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/06" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/07" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/08" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/09" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_from "intro_infection/10" false "int_hull_inf_pts/p0" 16.0)
            (sleep (random_range 5 10))
        )
    )
    (sleep_until (>= g_ih_obj_control 1) 30 (* 30.0 12.0))
    (begin_random
        (begin
            (vs_swarm_to "intro_infection/01" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/02" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/03" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/04" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/05" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/06" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/07" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/08" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/09" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/10" false "int_hull_inf_pts/p0" 1.0)
            (sleep (random_range 5 10))
        )
    )
    (sleep_until 
        (or
            (= (vs_running_atom_movement "intro_infection") false)
            (sleep_until (>= g_ih_obj_control 2) 1)
        ) 
    1 300)
    (begin_random
        (begin
            (vs_swarm_to "intro_infection/01" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/02" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/03" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/04" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/05" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/06" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/07" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/08" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/09" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
        (begin
            (vs_swarm_to "intro_infection/10" false "int_hull_inf_pts/p1" 1.0)
            (sleep (random_range 5 10))
        )
    )
    (sleep_until 
        (or
            (= (vs_running_atom_movement "intro_infection") false)
            (>= g_ih_obj_control 3)
        ) 
    1)
    (vs_release_all)
)

(script command_script void ih_disperse_cs
    (cs_swarm_to "intro_disperse_pts/p0" 1.0)
    (cs_swarm_to "intro_disperse_pts/p1" 1.0)
    (cs_swarm_to "intro_disperse_pts/p2" 1.0)
    (cs_swarm_to "intro_disperse_pts/p3" 1.0)
    (cs_swarm_to "intro_disperse_pts/p4" 1.0)
    (cs_swarm_to "intro_disperse_pts/p5" 1.0)
    (cs_swarm_to "intro_disperse_pts/p6" 1.0)
    (cs_swarm_to "intro_disperse_pts/p7" 1.0)
    (cs_swarm_to "intro_disperse_pts/p8" 1.0)
)

(script dormant void ih_puss_burster
    (sleep_until (>= g_ih_obj_control 2) 5)
    (begin_random
        (begin
            (object_damage_damage_section "int_hull_ball_01" "body" 1.0)
            (sleep (random_range 15 30))
        )
        (begin
            (object_damage_damage_section "int_hull_ball_02" "body" 1.0)
            (sleep (random_range 15 30))
        )
        (begin
            (object_damage_damage_section "int_hull_ball_09" "body" 1.0)
            (sleep (random_range 15 30))
        )
        (begin
            (object_damage_damage_section "int_hull_ball_10" "body" 1.0)
            (sleep (random_range 15 30))
        )
    )
    (ai_magically_see_object "intro_flood" (player0))
    (if (= (game_coop_player_count) 2) 
        (ai_magically_see_object "intro_flood" (player1)))
    (if (= (game_coop_player_count) 3) 
        (ai_magically_see_object "intro_flood" (player2)))
    (if (= (game_coop_player_count) 4) 
        (ai_magically_see_object "intro_flood" (player3)))
)

(script dormant void ih_flood_disperse
    (sleep_until 
        (or
            (>= g_ih_obj_control 4)
            (and
                (< (ai_nonswarm_count "intro_flood") 2)
                (< (ai_swarm_count "intro_flood") 10)
            )
        )
    )
    (print "dispersing")
    (ai_flood_disperse "intro_flood" "intro_disperse_obj/oldskool_flee")
)

(script dormant void ih_cleanup
    (sleep_until (>= g_ph_obj_control 1))
    (sleep_forever ih_puss_burster)
    (sleep_forever ih_infection_spawn)
    (sleep_forever ih_hull_attract)
    (ai_disposable "intro_infection" true)
    (ai_disposable "hall1_cf_01" true)
    (ai_disposable "intro_inf_spawned" true)
    (ai_disposable "hall1_inf_spawned" true)
)

(script dormant void enc_pelican_hill
    (data_mine_set_mission_segment "110_020_pel_hill")
    (if debug 
        (print "enc_pelican_hill"))
    (game_save)
    (wake ch_02_cortana)
    (wake ch_03_pelican_hill)
    (wake pel_hill_cleanup)
    (wake ai_ph_stalker_retreat)
    (wake ai_ph_combat_02)
    (wake ai_ph_pure_05)
    (wake nav_ph)
    (soft_ceiling_enable "no_000" false)
    (ai_place "pel_hill_pure_01")
    (ai_place "pel_hill_pure_02")
    (wake ph_object_management)
    (sleep_until 
        (or
            (volume_test_players "tv_ph_01")
            (volume_test_players "tv_ph_02")
        ) 
    1)
    (if debug 
        (print "set objective control 1"))
    (set g_ph_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_ph_obj_control 2)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_ph_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_ph_obj_control 4)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_ph_obj_control 5)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_ph_obj_control 6)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_07") 1)
    (if debug 
        (print "set objective control 7"))
    (set g_ph_obj_control 7)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_08") 1)
    (if debug 
        (print "set objective control 8"))
    (set g_ph_obj_control 8)
    (game_save)
    (sleep_until (volume_test_players "tv_ph_09") 1)
    (if debug 
        (print "set objective control 9"))
    (set g_ph_obj_control 9)
    (game_save)
)

(script dormant void ai_ph_stalker_retreat
    (sleep_until 
        (or
            (>= g_ph_obj_control 1)
            (>= (ai_combat_status "pelican_hill_obj") 4)
        ) 
    1 (* 30.0 15.0))
    (sleep (random_range 15 45))
    (set g_ph_stalker_retreat true)
)

(script dormant void ai_ph_combat_02
    (sleep_until (>= g_ph_obj_control 1))
    (sleep_until (>= g_ph_obj_control 2) 5 (* 30.0 8.0))
    (ai_place "pel_hill_cf_01")
    (ai_place "pel_hill_cf_02")
    (ai_place "pel_hill_cf_03")
    (ai_place "pel_hill_cf_04")
    (ai_place "pel_hill_car_01")
    (ai_place "pel_hill_car_02")
    (if (= (game_difficulty_get) heroic) 
        (ai_place "pel_hill_car_03"))
    (if (= (game_difficulty_get) legendary) 
        (ai_place "pel_hill_car_04"))
    (if dialogue 
        (print "flood: (unholy roar!)"))
    (ai_play_line_on_object "ph_top_howl01" 110mx_300)
    (ai_play_line_on_object "ph_top_howl02" 110mx_300)
)

(script dormant void ai_ph_pure_05
    (sleep_until (>= g_ph_obj_control 5) 5)
    (ai_place "pel_hill_pure_03")
    (ai_place "pel_hill_pure_04")
    (ai_place "pel_hill_pure_05")
    (ai_place "pel_hill_pure_06")
    (if dialogue 
        (print "flood: (unholy roar!)"))
    (ai_play_line_on_object "ph_back_howl01" 110mx_300)
    (ai_place "pel_hill_car_04")
    (ai_place "pel_hill_car_05")
    (if (= (game_difficulty_get) heroic) 
        (ai_place "pel_hill_car_06"))
    (if (= (game_difficulty_get) legendary) 
        (ai_place "pel_hill_car_07"))
)

(script command_script void cs_ph_flood_berserk
    (ai_berserk ai_current_actor true)
    (sleep 1)
)

(script command_script void cs_ph_flood_unberserk
    (ai_berserk ai_current_actor false)
    (sleep 1)
)

(script command_script void cs_ph_flood_retreat_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_movement_mode 1)
    (ai_berserk ai_current_actor true)
    (sleep_until (volume_test_object "tv_ph_04" (ai_get_object ai_current_actor)))
)

(script command_script void cs_ph_flood_retreat_02
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_movement_mode 1)
    (ai_berserk ai_current_actor true)
    (sleep_until (volume_test_object "tv_ph_06" (ai_get_object ai_current_actor)))
)

(script command_script void cs_ph_flood_disperse
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (ai_berserk ai_current_actor true)
    (sleep (random_range 180 240))
    (if dialogue 
        (print "flood: (unholy roar!)"))
    (cs_play_line 110mx_300)
    (sleep (random_range 15 30))
    (ai_flood_disperse ai_current_actor "pelican_hill_obj")
)

(script dormant void pel_hill_cleanup
    (sleep_until (>= g_hab_obj_control 1))
    (ai_disposable "pel_hill_pure_01" true)
    (ai_disposable "pel_hill_pure_02" true)
    (ai_disposable "pel_hill_pure_03" true)
    (ai_disposable "pel_hill_pure_04" true)
    (ai_disposable "pel_hill_cf_01" true)
    (ai_disposable "pel_hill_car_01" true)
    (ai_disposable "pel_hill_cf_02" true)
    (ai_disposable "pel_hill_car_02" true)
    (ai_disposable "pel_hill_cf_03" true)
    (ai_disposable "pel_hill_car_03" true)
    (ai_disposable "pel_hill_inf_spawned" true)
)

(script dormant void enc_halls_a_b
    (data_mine_set_mission_segment "110_030_halls_a_b")
    (if debug 
        (print "enc_halls_a_b"))
    (game_save)
    (wake ch_04_gravemind)
    (wake ch_05_gravemind)
    (wake ai_hab_infection)
    (wake halls_2_3_cleanup)
    (wake nav_hab)
    (set g_nav_hab true)
    (wake hab_object_management)
    (sleep_until (volume_test_players "tv_hab_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_hab_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_hab_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_hab_obj_control 2)
    (sleep_until (volume_test_players "tv_hab_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_hab_obj_control 3)
    (sleep_until (volume_test_players "tv_hab_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_hab_obj_control 4)
    (game_save)
    (set g_music_110_03 false)
    (sleep_until (volume_test_players "tv_hab_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_hab_obj_control 5)
    (game_save)
    (sleep_until (volume_test_players "tv_hab_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_hab_obj_control 6)
    (game_save)
)

(script command_script void halls_2_3_attract_01
    (cs_swarm_to "cafe_inf_pts/p1" 1.0)
)

(script command_script void halls_2_3_attract_02
    (cs_swarm_to "cafe_inf_pts/p2" 1.0)
)

(script dormant void ai_hab_infection
    (ai_place "halls_2_3_infection_01" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_01" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_01" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_01" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_01" 1)
    (sleep_until (>= g_hab_obj_control 4))
    (ai_place "halls_2_3_infection_02" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_02" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_02" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_02" 1)
    (sleep 1)
    (ai_place "halls_2_3_infection_02" 1)
)

(script dormant void halls_2_3_cleanup
    (sleep_until (>= g_br_obj_control 1))
    (ai_disposable "halls_2_3_infection_01" true)
    (ai_disposable "halls_2_3_infection_02" true)
    (ai_disposable "halls23_inf_spawned" true)
    (ai_disposable "halls23_too_inf_spawned" true)
)

(script dormant void enc_bridge
    (data_mine_set_mission_segment "110_040_bridge")
    (if debug 
        (print "enc_bridge"))
    (game_save)
    (wake ch_06_cortana)
    (wake ch_07_cortana)
    (wake ai_br_start)
    (wake ai_br_spawner)
    (wake bridge_cleanup)
    (wake nav_br)
    (wake music_010_04)
    (wake br_object_management)
    (sleep_until (volume_test_players "tv_br_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_br_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_br_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_br_obj_control 2)
    (game_save)
    (sleep_until (volume_test_players "tv_br_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_br_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_br_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_br_obj_control 4)
    (game_save)
    (sleep_until (volume_test_players "tv_br_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_br_obj_control 5)
    (game_save)
)

(script command_script void cafe_repulse
    (cs_swarm_from "cafe_inf_pts/p0" 3.0)
)

(script command_script void cafe_swarm_01
    (cs_swarm_to "cafe_inf_pts/p3" 1.0)
    (cs_swarm_to "cafe_inf_pts/p4" 1.0)
)

(script dormant void ai_br_spawner
    (sleep_until (>= g_br_obj_control 1))
    (game_save)
    (if (< (ai_nonswarm_count "cafe_oldskool") 5) 
        (ai_place "bridge_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "cafe_oldskool") 5) 
        (ai_place "bridge_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "cafe_oldskool") 5) 
        (ai_place "bridge_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "cafe_oldskool") 5) 
        (ai_place "bridge_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "cafe_oldskool") 5) 
        (ai_place "bridge_cf_02" 1))
    (sleep 1)
    (ai_migrate "bridge_cf_01" "bridge_cf_02")
    (sleep_until (>= g_br_obj_control 2))
    (game_save)
)

(script dormant void ai_br_start
    (ai_place "bridge_cf_01" 1)
    (ai_place "bridge_cf_01" 1)
    (ai_place "bridge_cf_01" 1)
    (if (>= (game_difficulty_get) heroic) 
        (begin
            (ai_place "bridge_cf_01" 1)
            (ai_place "bridge_cf_01" 1)
        )
    )
    (sleep 1)
    (ai_place "bridge_pure_01")
    (ai_place "bridge_pure_02")
    (if (>= (game_difficulty_get) heroic) 
        (begin
            (ai_place "bridge_pure_03")
            (ai_place "bridge_pure_04")
        )
    )
    (sleep_until 
        (or
            (>= g_br_obj_control 3)
            (< (ai_nonswarm_count "cafe_pureforms") 1)
        ) 
    5)
    (ai_place "bridge_pure_end")
    (object_create "bridge_howl_pt")
    (sleep 1)
    (sound_impulse_start "sound\dialog\110_hc\mission\110mx_300_grv" "bridge_howl_pt" 1.0)
    (sleep 60)
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (< (ai_swarm_count "bridge_end_infection") 5)
                    (>= g_hc_obj_control 1)
                )
            )
            (if (= g_hc_obj_control 0) 
                (ai_place "bridge_end_infection" 1))
            (>= g_hc_obj_control 1)
        )
    )
    (object_destroy "bridge_howl_pt")
    (object_destroy "bridge_shatter_pt")
)

(script dormant void bridge_cleanup
    (sleep_until (>= g_hc_obj_control 1))
    (ai_disposable "bridge_cf_01" true)
    (ai_disposable "bridge_cf_02" true)
    (ai_disposable "bridge_cf_03" true)
    (ai_disposable "bridge_pure_01" true)
    (ai_disposable "bridge_pure_02" true)
    (ai_disposable "bridge_pure_03" true)
    (ai_disposable "bridge_pure_04" true)
    (ai_disposable "bridge_spew_infection" true)
    (ai_disposable "bridge_end_infection" true)
    (ai_disposable "bridge_pure_end" true)
    (ai_disposable "cafe_inf_spawned" true)
)

(script dormant void enc_hall_c
    (data_mine_set_mission_segment "110_050_hall_c")
    (if debug 
        (print "enc_hall_c"))
    (game_save)
    (wake ch_08_cortana)
    (wake ch_09_gravemind)
    (wake hall_c_cleanup)
    (wake hall_c_reins)
    (wake nav_hc)
    (wake music_010_05)
    (wake music_010_06)
    (wake hc_object_management)
    (ai_place "hall_c_car_01")
    (ai_place "hall_c_pure_01")
    (ai_place "hall_c_pure_02")
    (ai_place "hall_c_pure_03")
    (ai_place "hall_c_pure_04")
    (ai_place "hall_c_pure_05")
    (ai_place "hall_c_pure_06")
    (sleep_until (volume_test_players "tv_hc_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_hc_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_hc_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_hc_obj_control 2)
    (game_save)
    (set g_music_110_02 false)
    (set g_music_110_04 false)
    (sleep_until (volume_test_players "tv_hc_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_hc_obj_control 3)
    (game_save)
    (ai_place "hall_c_cf_01")
    (ai_place "hall_c_cf_02")
    (if dialogue 
        (print "flood: (unholy roar!)"))
    (ai_play_line_on_object "hall_c_howl_01" 110mx_300)
    (ai_play_line_on_object "hall_c_howl_02" 110mx_300)
    (sleep_until (volume_test_players "tv_hc_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_hc_obj_control 4)
    (game_save)
    (sleep_until (volume_test_players "tv_hc_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_hc_obj_control 5)
    (game_save)
    (sleep_until (volume_test_players "tv_hc_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_hc_obj_control 6)
    (game_save)
    (set g_music_110_05 true)
)

(script dormant void hall_c_cleanup
    (sleep_until (>= g_pr_obj_control 1))
    (ai_disposable "hall_c_cf_01" true)
    (ai_disposable "hall_c_cf_02" true)
    (ai_disposable "hall_c_car_01" true)
    (ai_disposable "hall_c_car_02" true)
    (ai_disposable "hall_c_pure_01" true)
    (ai_disposable "hall_c_pure_02" true)
    (ai_disposable "hall_c_pure_03" true)
    (ai_disposable "hall4_inf_spawned" true)
)

(script dormant void hall_c_reins
    (sleep_until 
        (or
            (>= g_hc_obj_control 3)
            (<= (ai_task_count "hallway_4_obj/pureform_gate") 4)
        )
    )
    (if (<= g_hc_obj_control 2) 
        (ai_place "hall_c_pure_rein_01"))
    (sleep 1)
    (sleep_until 
        (or
            (>= g_hc_obj_control 3)
            (<= (ai_task_count "hallway_4_obj/pureform_gate") 2)
        )
    )
    (if (<= g_hc_obj_control 2) 
        (ai_place "hall_c_pure_rein_02"))
    (sleep 1)
)

(script command_script void cs_hc_flood_disperse
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (ai_berserk ai_current_actor true)
    (sleep (random_range 180 240))
    (if dialogue 
        (print "flood: (unholy roar!)"))
    (cs_play_line 110mx_300)
    (sleep (random_range 15 30))
    (ai_flood_disperse ai_current_actor "hallway_4_obj")
)

(script dormant void enc_prisoner
    (data_mine_set_mission_segment "110_060_prisoner")
    (if debug 
        (print "enc_prisoner"))
    (game_save)
    (wake ai_place_prisoner)
    (wake pr_object_management)
    (sleep_until (volume_test_players "tv_pr_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_pr_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_pr_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_pr_obj_control 2)
    (game_save)
    (set g_music_110_06 true)
    (sleep_until (volume_test_players "tv_pr_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_pr_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_pr_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_hd_obj_control 4)
    (game_save)
)

(script dormant void ai_place_prisoner
    (ai_place "prisoner_pure_04")
    (ai_place "prisoner_pure_05")
    (ai_place "prisoner_pure_06")
    (sleep 5)
    (ai_place "prisoner_pure_07")
    (ai_place "prisoner_pure_08")
    (ai_place "prisoner_pure_09")
    (ai_place "prisoner_pure_10")
    (sleep 5)
    (ai_place "prisoner_cf_01")
    (ai_place "prisoner_cf_02")
)

(script dormant void prisoner_cleanup
    (sleep_until (>= g_hd_obj_control 1))
    (ai_disposable "prisoner_pure_01" true)
    (ai_disposable "prisoner_pure_02" true)
    (ai_disposable "prisoner_pure_03" true)
    (ai_disposable "prisoner_cf_01" true)
    (ai_disposable "prisoner_cf_02" true)
    (ai_disposable "prisoner_car_01" true)
    (ai_disposable "prisoner_inf_spawned" true)
)

(script dormant void enc_hall_d
    (data_mine_set_mission_segment "110_070_hall_d")
    (if debug 
        (print "enc_hall_d"))
    (game_save)
    (wake ch_10_cortana)
    (wake nav_hd)
    (wake music_010_07)
    (wake hd_object_management)
    (sleep_until (volume_test_players "tv_hd_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_hd_obj_control 1)
    (game_save)
)

(script dormant void hall5_cleanup
    (sleep_until (>= g_re_obj_control 1))
    (ai_disposable "hall5_inf_spawned" true)
)

(script dormant void enc_reactor
    (data_mine_set_mission_segment "110_080_reactor")
    (if debug 
        (print "enc_reactor"))
    (game_save)
    (wake pylon_04_fall)
    (wake p_switch_anim)
    (wake nav_rec)
    (wake music_010_08)
    (wake re_object_management)
    (wake ai_re_initial_flood)
    (sleep_until (volume_test_players "tv_re_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_re_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_re_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_re_obj_control 2)
    (game_save)
    (set g_music_110_08 true)
    (sleep_until 
        (or
            (volume_test_players "tv_re_03")
            (volume_test_players "tv_re_04")
        ) 
    1)
    (if debug 
        (print "set objective control 3"))
    (set g_re_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_re_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_re_obj_control 4)
    (game_save)
    (sleep_until (volume_test_players "tv_re_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_re_obj_control 5)
    (game_save)
    (sleep_until (volume_test_players "tv_re_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_re_obj_control 6)
    (game_save)
)

(script dormant void ai_re_initial_flood
    (ai_place "sq_re_infection_01")
    (ai_place "sq_re_infection_02")
    (sleep 2)
    (ai_place "sq_re_infection_03")
    (ai_place "sq_re_infection_04")
    (ai_place "sq_re_infection_05")
    (sleep 2)
    (ai_place "sq_re_pureform_01")
    (ai_place "sq_re_pureform_02")
    (ai_place "sq_re_pureform_03")
    (ai_place "sq_re_pureform_04")
    (sleep 2)
    (ai_place "sq_re_pureform_05")
    (ai_place "sq_re_pureform_06")
    (sleep 2)
)

(script dormant void pylon_04_fall
    (object_set_permutation "pylon_04x" "top" "destroyed")
    (object_set_permutation "pylon_04x" "middle" "destroyed")
    (object_set_permutation "pylon_04x" "lower" "destroyed")
    (sleep 1)
    (object_cannot_take_damage "pylon_04x")
    (sleep_until 
        (or
            (and
                (= (volume_test_players "vol_see_pylon_fall") true)
                (= (objects_can_see_flag (players) "pylon_04_flag" 45.0) true)
            )
            (and
                (= (volume_test_players "vol_see_pylon_fall_rev") true)
                (= (objects_can_see_flag (players) "pylon_04_flag" 45.0) true)
            )
            (= (volume_test_players "vol_pylon_failsafe_01") true)
            (= (volume_test_players "vol_pylon_failsafe_02") true)
        )
    )
    (begin_random
        (begin
            (sleep (random_range 2 6))
            (effect_new_on_object_marker "objects\weapons\grenade\plasma_grenade\fx\detonation.effect" "pylon_04x" "bam_core_01")
        )
        (begin
            (sleep (random_range 2 6))
            (effect_new_on_object_marker "objects\weapons\grenade\plasma_grenade\fx\detonation.effect" "pylon_04x" "bam_core_02")
        )
        (begin
            (sleep (random_range 2 6))
            (effect_new_on_object_marker "objects\weapons\grenade\plasma_grenade\fx\detonation.effect" "pylon_04x" "bam_core_03")
        )
        (begin
            (sleep (random_range 2 6))
            (effect_new_on_object_marker "objects\weapons\grenade\plasma_grenade\fx\detonation.effect" "pylon_04x" "bam_core_04")
        )
    )
    (sleep (random_range 2 6))
    (effect_new_on_object_marker "objects\weapons\grenade\plasma_grenade\fx\detonation.effect" "pylon_04x" "center")
    (sound_looping_start "sound\device_machines\hc_reactor_pylons\pylon_windup\pylon_windup.sound_looping" "pylon_04x" 1.0)
    (sleep (- (* 7.0 30.0) pylon_total))
    (object_damage_damage_section "pylon_04x" "core" 1.0)
    (sound_looping_stop "sound\device_machines\hc_reactor_pylons\pylon_windup\pylon_windup.sound_looping")
    (sleep_until (= (volume_test_object "vol_reactor_goo" "pylon_04x") true) 1 247)
    (sound_impulse_start "sound\device_machines\hc_reactor_pylons\pylon_boom_dist.sound" "pylon_01x" 1.0)
    (set g_music_110_08 true)
)

(script dormant void p_switch_anim
    (scenery_animation_start_loop "p_switch" "objects\levels\solo\110_hc\cov_reactor_console\cov_reactor_console" "spin")
    (sleep_until (= (device_group_get "pylons") 1.0))
    (scenery_animation_start_loop "p_switch" "objects\levels\solo\110_hc\cov_reactor_console\cov_reactor_console" "spin_faster")
)

(script dormant void enc_inner_sanctum
    (data_mine_set_mission_segment "110_100_inner_sanctum")
    (if debug 
        (print "enc_inner_sanctum"))
    (game_save)
    (wake ch_11_gravemind)
    (wake ch_12_gravemind)
    (wake ch_13a_cortana)
    (wake 110_highcharity_cortana)
    (set g_music_110_07 false)
    (set g_music_110_08 false)
    (set g_music_110_09 true)
    (wake music_010_09)
    (wake music_010_10)
    (sleep_until (volume_test_players "tv_is_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_is_obj_control 1)
    (game_save)
    (set g_music_110_10 true)
)

(script dormant void hall6_cleanup
    (sleep_until (= (device_group_get "corty_cinematic") 1.0))
    (sleep 1)
    (chud_cortana_suck "cortyflag_end" "marker" false)
    (sleep 1)
    (object_destroy "cortyflag_end")
)

(script dormant void inner_sanctum_cleanup
    (sleep_until 
        (and
            (= g_cortana_rescued true)
            (= (volume_test_players "vol_cortana_clear") false)
        )
    )
    (ai_disposable "sanctum_inf_spawned" true)
)

(script dormant void enc_reactor_return
    (data_mine_set_mission_segment "110_120_reactor_rev")
    (if debug 
        (print "enc_reactor_return"))
    (game_save)
    (wake ch_14_gravemind)
    (wake ch_15_cortana)
    (wake gs_return_doors)
    (wake gs_hc_exit_nav)
    (wake gs_hc_nav_progression)
    (if (>= (game_insertion_point_get) 1) 
        (wake pylon_04_fall))
    (wake music_010_11)
    (wake music_010_12)
    (wake music_010_13)
    (wake ambient_audio_rumble)
    (ai_place "sq_re_pureform_01")
    (ai_place "sq_re_pureform_02")
    (ai_place "sq_re_pureform_03")
    (ai_place "sq_re_pureform_04")
    (sleep 2)
    (ai_place "sq_re_pureform_05")
    (sleep 2)
    (ai_set_objective "reactor_pureforms" "reactor_rev_obj")
    (ai_disposable "reactor_inf_spawned" false)
    (object_create_anew "blockage_01")
    (object_create_anew "blockage_02")
    (device_set_power "pylon_switch_01" 1.0)
    (wake reactor_rev_spawning)
    (sleep_until (= (device_group_get "pylons") 1.0))
    (device_set_power "pylon_switch_01" 0.0)
    (set g_music_110_12 true)
    (sleep_until 
        (and
            (= (device_get_position "pylon_01") 1.0)
            (= (device_get_position "pylon_02") 1.0)
            (= (device_get_position "pylon_03") 1.0)
        )
    )
    (hud_activate_team_nav_point_flag player "pylon_01_flag" 0.0)
    (hud_activate_team_nav_point_flag player "pylon_02_flag" 0.0)
    (hud_activate_team_nav_point_flag player "pylon_03_flag" 0.0)
    (wake pylon_01_mon)
    (wake pylon_02_mon)
    (wake pylon_03_mon)
    (object_destroy "pylon_01")
    (object_create "pylon_01x")
    (object_destroy "pylon_02")
    (object_create "pylon_02x")
    (object_destroy "pylon_03")
    (object_create "pylon_03x")
    (cond
        ((difficulty_heroic)
            (begin
                (object_set_shield "pylon_01x" 120.0)
                (object_set_shield "pylon_02x" 120.0)
                (object_set_shield "pylon_03x" 120.0)
            )
        )
        ((difficulty_legendary)
            (begin
                (object_set_shield "pylon_01x" 180.0)
                (object_set_shield "pylon_02x" 180.0)
                (object_set_shield "pylon_03x" 180.0)
            )
        )
    )
    (sleep_until 
        (and
            (<= (object_get_health "pylon_01x") 0.0)
            (<= (object_get_health "pylon_02x") 0.0)
            (<= (object_get_health "pylon_03x") 0.0)
        )
    )
    (set reactor_blown true)
    (set g_amb_audio_01 true)
    (sleep 210)
    (wake alarm_loop)
    (wake random_distant_booms)
    (wake random_near_booms)
    (wake invisible_timer)
    (wake objective_2_clear)
    (wake objective_3_set)
    (game_save)
    (ai_place "reactor_rev_cf_04" 1)
    (sleep 1)
    (device_set_power "door_reactor_escape" 1.0)
    (device_set_position "door_reactor_escape" 1.0)
    (sleep_until (= (device_get_position "door_reactor_escape") 1.0) 1)
    (device_set_power "door_reactor_escape" 0.0)
)

(script dormant void gs_return_doors
    (device_set_position_immediate "reactor_sphincter" 0.0)
    (device_set_position_immediate "hall_5_sphincter" 0.0)
    (device_set_position_immediate "prisoner_sphincter" 0.0)
    (sleep 1)
    (device_set_power "reactor_sphincter" 0.0)
    (device_set_power "hall_5_sphincter" 0.0)
    (device_set_power "prisoner_sphincter" 0.0)
    (sleep_until (= (current_zone_set_fully_active) 5) 1)
    (object_destroy "big_screen")
    (sleep_until (= (current_zone_set_fully_active) 6) 1)
    (device_set_position_immediate "horizontal_sphincter" 0.0)
    (sleep 1)
    (device_set_power "horizontal_sphincter" 0.0)
)

(script dormant void invisible_timer
    (sleep_until 
        (begin
            (set elapsed_time (+ elapsed_time 0.0167))
            (set boom_delay (+ (* 0.4 elapsed_time elapsed_time) (* -3.8 elapsed_time) 10.0))
            (or
                (> elapsed_time 5.0)
                (< boom_delay 1.0)
            )
        ) 
    30)
    (set elapsed_time 5.0)
    (set boom_delay 1.0)
)

(script dormant void random_distant_booms
    (sleep_until 
        (begin
            (player_effect_set_max_rotation (real_random_range 0.0 1.0) (real_random_range 0.0 1.0) (real_random_range 0.0 1.0))
            (player_effect_set_max_rumble (real_random_range 0.5 1.0) (real_random_range 0.5 1.0))
            (player_effect_start (real_random_range 0.1 0.35) (real_random_range 0.5 1.0))
            (player_effect_stop (real_random_range 2.0 3.0))
            (sleep (random_range (* 10.0 boom_delay) (* 60.0 boom_delay)))
            false
        )
    )
)

(script static void random_near_boom (point_reference boom_set)
    (sleep (random_range (* 1.0 boom_delay) (* 6.0 boom_delay)))
    (set random_boom (random_range 1 5))
    (if (= random_boom 1) 
        (effect_new_random "fx\scenery_fx\explosions\high_charity_explosion_medium\high_charity_explosion_medium.effect" boom_set))
    (if (= random_boom 2) 
        (effect_new_random "fx\scenery_fx\explosions\high_charity_explosion_medium\high_charity_explosion_medium.effect" boom_set))
    (if (= random_boom 3) 
        (effect_new_random "fx\scenery_fx\explosions\high_charity_explosion_large\high_charity_explosion_large.effect" boom_set))
    (if (= random_boom 4) 
        (effect_new_random "fx\scenery_fx\explosions\high_charity_explosion_large\high_charity_explosion_large.effect" boom_set))
)

(script dormant void random_near_booms
    (sleep_until 
        (begin
            (if (< (objects_distance_to_flag (players) "near_reactor_01") 25.0) 
                (begin_random
                    (random_near_boom "escape_reactor_01")
                    (random_near_boom "escape_reactor_02")
                    (random_near_boom "escape_reactor_03")
                    (random_near_boom "escape_reactor_04")
                    (random_near_boom "escape_reactor_07")
                    (random_near_boom "escape_hall4_01")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_reactor_02") 25.0) 
                (begin_random
                    (random_near_boom "escape_reactor_01")
                    (random_near_boom "escape_reactor_02")
                    (random_near_boom "escape_reactor_03")
                    (random_near_boom "escape_reactor_04")
                    (random_near_boom "escape_reactor_05")
                    (random_near_boom "escape_reactor_06")
                    (random_near_boom "escape_reactor_07")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_hall4_01") 25.0) 
                (begin_random
                    (random_near_boom "escape_reactor_07")
                    (random_near_boom "escape_hall4_01")
                    (random_near_boom "escape_hall4_02")
                    (random_near_boom "escape_hall4_03")
                    (random_near_boom "escape_hall4_04")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_hall4_02") 25.0) 
                (begin_random
                    (random_near_boom "escape_hall4_01")
                    (random_near_boom "escape_hall4_02")
                    (random_near_boom "escape_hall4_03")
                    (random_near_boom "escape_hall4_04")
                    (random_near_boom "escape_hall4_05")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_hall4_03") 25.0) 
                (begin_random
                    (random_near_boom "escape_hall4_04")
                    (random_near_boom "escape_hall4_05")
                    (random_near_boom "escape_hall4_06")
                    (random_near_boom "escape_cafe_01")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_bridge_01") 25.0) 
                (begin_random
                    (random_near_boom "escape_hall4_06")
                    (random_near_boom "escape_cafe_01")
                    (random_near_boom "escape_cafe_02")
                    (random_near_boom "escape_cafe_03")
                    (random_near_boom "escape_cafe_04")
                    (random_near_boom "escape_cafe_05")
                    (random_near_boom "escape_cafe_06")
                    (random_near_boom "escape_cafe_07")
                    (random_near_boom "escape_cafe_08")
                    (random_near_boom "escape_cafe_09")
                    (random_near_boom "escape_cafe_11")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_bridge_02") 25.0) 
                (begin_random
                    (random_near_boom "escape_cafe_01")
                    (random_near_boom "escape_cafe_02")
                    (random_near_boom "escape_cafe_03")
                    (random_near_boom "escape_cafe_04")
                    (random_near_boom "escape_cafe_05")
                    (random_near_boom "escape_cafe_06")
                    (random_near_boom "escape_cafe_07")
                    (random_near_boom "escape_cafe_08")
                    (random_near_boom "escape_cafe_09")
                    (random_near_boom "escape_cafe_10")
                    (random_near_boom "escape_cafe_11")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_bridge_03") 25.0) 
                (begin_random
                    (random_near_boom "escape_cafe_01")
                    (random_near_boom "escape_cafe_04")
                    (random_near_boom "escape_cafe_05")
                    (random_near_boom "escape_cafe_06")
                    (random_near_boom "escape_cafe_07")
                    (random_near_boom "escape_cafe_08")
                    (random_near_boom "escape_cafe_09")
                    (random_near_boom "escape_cafe_10")
                    (random_near_boom "escape_halls23_01")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_bridge_04") 25.0) 
                (begin_random
                    (random_near_boom "escape_cafe_10")
                    (random_near_boom "escape_halls23_01")
                    (random_near_boom "escape_halls23_02")
                    (random_near_boom "escape_halls23_03")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_halls23_01") 25.0) 
                (begin_random
                    (random_near_boom "escape_halls23_02")
                    (random_near_boom "escape_halls23_03")
                    (random_near_boom "escape_halls23_04")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_halls23_02") 25.0) 
                (begin_random
                    (random_near_boom "escape_halls23_02")
                    (random_near_boom "escape_halls23_03")
                    (random_near_boom "escape_halls23_04")
                    (random_near_boom "escape_halls23_05")
                    (random_near_boom "escape_halls23_06")
                    (random_near_boom "escape_halls23_07")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_halls23_03") 25.0) 
                (begin_random
                    (random_near_boom "escape_halls23_03")
                    (random_near_boom "escape_halls23_04")
                    (random_near_boom "escape_halls23_05")
                    (random_near_boom "escape_halls23_06")
                    (random_near_boom "escape_halls23_07")
                    (random_near_boom "escape_halls23_08")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_halls23_04") 25.0) 
                (begin_random
                    (random_near_boom "escape_halls23_04")
                    (random_near_boom "escape_halls23_05")
                    (random_near_boom "escape_halls23_06")
                    (random_near_boom "escape_halls23_07")
                    (random_near_boom "escape_halls23_08")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_halls23_05") 25.0) 
                (begin_random
                    (random_near_boom "escape_halls23_05")
                    (random_near_boom "escape_halls23_06")
                    (random_near_boom "escape_halls23_07")
                    (random_near_boom "escape_halls23_08")
                    (random_near_boom "escape_pel_hill_01")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_pel_hill_01") 25.0) 
                (begin_random
                    (random_near_boom "escape_halls23_07")
                    (random_near_boom "escape_halls23_08")
                    (random_near_boom "escape_pel_hill_01")
                    (random_near_boom "escape_pel_hill_02")
                    (random_near_boom "escape_pel_hill_03")
                    (random_near_boom "escape_pel_hill_04")
                    (random_near_boom "escape_pel_hill_08")
                )
            )
            (if (< (objects_distance_to_flag (players) "near_pel_hill_01") 25.0) 
                (begin_random
                    (random_near_boom "escape_pel_hill_01")
                    (random_near_boom "escape_pel_hill_02")
                    (random_near_boom "escape_pel_hill_03")
                    (random_near_boom "escape_pel_hill_04")
                    (random_near_boom "escape_pel_hill_05")
                    (random_near_boom "escape_pel_hill_06")
                    (random_near_boom "escape_pel_hill_07")
                    (random_near_boom "escape_pel_hill_08")
                )
            )
            false
        ) 
    1)
)

(script dormant void alarm_loop
    (sleep_until 
        (and
            (= (volume_test_object "vol_reactor_goo" "pylon_01x") true)
            (= (volume_test_object "vol_reactor_goo" "pylon_02x") true)
            (= (volume_test_object "vol_reactor_goo" "pylon_03x") true)
        ) 
    30 180)
    (sleep_until 
        (begin
            (sound_impulse_start "sound\device_machines\hc_reactor_pylons\hc_alarm.sound" none 1.0)
            (sleep 60)
            false
        )
    )
)

(script static void blow_pylon_x (object which_pylon)
    (sound_looping_start "sound\device_machines\hc_reactor_pylons\pylon_windup\pylon_windup.sound_looping" which_pylon 1.0)
    (sleep (- (* 7.0 30.0) pylon_total))
    (object_damage_damage_section which_pylon "core" 1.0)
    (set pylon_countdown 5)
    (set pylon_delay 0)
    (set pylon_total 0)
    (set pylon_bam false)
    (sound_looping_stop "sound\device_machines\hc_reactor_pylons\pylon_windup\pylon_windup.sound_looping")
)

(script dormant void pylon_01_mon
    (sleep_until (<= (object_get_health "pylon_01x") 0.0))
    (hud_deactivate_team_nav_point_flag player "pylon_01_flag")
    (objects_detach "pylon_01x" "bubble_01")
    (sleep 1)
    (object_destroy "bubble_01")
    (blow_pylon_x "pylon_01x")
    (sleep_until (= (volume_test_object "vol_reactor_goo" "pylon_01x") true) 1 180)
    (sound_impulse_start "sound\device_machines\hc_reactor_pylons\pylon_boom_dist.sound" "pylon_01x" 1.0)
    (set pylon_count (- pylon_count 1.0))
    (sleep_until (= (volume_test_players "vol_pylon_01") false))
    (game_save)
)

(script dormant void pylon_02_mon
    (sleep_until (<= (object_get_health "pylon_02x") 0.0))
    (hud_deactivate_team_nav_point_flag player "pylon_02_flag")
    (objects_detach "pylon_02x" "bubble_02")
    (sleep 1)
    (object_destroy "bubble_02")
    (blow_pylon_x "pylon_02x")
    (sleep_until (= (volume_test_object "vol_reactor_goo" "pylon_02x") true) 1 180)
    (sound_impulse_start "sound\device_machines\hc_reactor_pylons\pylon_boom_dist.sound" "pylon_02x" 1.0)
    (set pylon_count (- pylon_count 1.0))
    (sleep_until (= (volume_test_players "vol_pylon_02") false))
    (game_save)
)

(script dormant void pylon_03_mon
    (sleep_until (<= (object_get_health "pylon_03x") 0.0))
    (hud_deactivate_team_nav_point_flag player "pylon_03_flag")
    (objects_detach "pylon_03x" "bubble_03")
    (sleep 1)
    (object_destroy "bubble_03")
    (blow_pylon_x "pylon_03x")
    (sleep_until (= (volume_test_object "vol_reactor_goo" "pylon_03x") true) 1 180)
    (sound_impulse_start "sound\device_machines\hc_reactor_pylons\pylon_boom_dist.sound" "pylon_03x" 1.0)
    (set pylon_count (- pylon_count 1.0))
    (sleep_until (= (volume_test_players "vol_pylon_03") false))
    (game_save)
)

(script dormant void reactor_rev_spawning
    (ai_place "reactor_rev_cf_01")
    (ai_place "reactor_rev_cf_02")
    (ai_place "reactor_rev_cf_03")
    (sleep 1)
    (sleep_until 
        (or
            (< (ai_nonswarm_count "reactor_rev_oldskool") 8)
            (< (objects_distance_to_object (ai_actors "reactor_rev_oldskool") (player0)) 5.0)
            (and
                (< (objects_distance_to_object (ai_actors "reactor_rev_oldskool") (player1)) 5.0)
                (= (game_coop_player_count) 2)
            )
            (and
                (< (objects_distance_to_object (ai_actors "reactor_rev_oldskool") (player2)) 5.0)
                (= (game_coop_player_count) 3)
            )
            (and
                (< (objects_distance_to_object (ai_actors "reactor_rev_oldskool") (player3)) 5.0)
                (= (game_coop_player_count) 4)
            )
        )
    )
    (sleep_until 
        (or
            (= (device_group_get "pylons") 1.0)
            (< (ai_nonswarm_count "reactor_rev_oldskool") 4)
            (= (volume_test_players "vol_reactor_rev_center") true)
        )
    )
    (ai_place "reactor_rev_pure_01" 1)
    (sleep 1)
    (ai_place "reactor_rev_pure_01" 1)
    (sleep 1)
    (ai_place "reactor_rev_pure_01" 1)
    (sleep_until (< pylon_count 3) 5 150)
    (ai_place "reactor_rev_pure_02" 1)
    (sleep 1)
    (ai_place "reactor_rev_pure_02" 1)
    (sleep 1)
    (ai_place "reactor_rev_pure_02" 1)
    (sleep_until (< pylon_count 3))
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_03" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_03" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_03" 1))
    (sleep 1)
    (sleep_until (< pylon_count 2))
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_04" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_04" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_04" 1))
    (sleep_until (< pylon_count 1) 5 150)
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_05" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_05" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "reactor_rev_pureforms") 3) 
        (ai_place "reactor_rev_pure_05" 1))
)

(script command_script void reactor_rev_pure_down_01
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "reactor_rev_pts/p5")
    (cs_go_to "reactor_rev_pts/p6")
    (cs_go_to "reactor_rev_pts/p7")
)

(script command_script void reactor_rev_pure_down_02
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "reactor_rev_pts/p2")
)

(script command_script void reactor_rev_pure_down_03
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "reactor_rev_pts/p3")
)

(script command_script void reactor_rev_pure_down_04
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "reactor_rev_pts/p4")
)

(script command_script void reactor_rev_pure_down_05
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "reactor_rev_pts/p0")
)

(script command_script void reactor_rev_pure_down_06
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "reactor_rev_pts/p8")
)

(script command_script void reactor_rev_pure_down_07
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to_and_face "reactor_rev_pts/p13" "reactor_rev_pts/p12")
    (cs_go_to "reactor_rev_pts/p10")
)

(script command_script void reactor_rev_pure_down_08
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "reactor_rev_pts/p11")
)

(script command_script void reactor_rev_pure_down_09
    (sleep 90)
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to_and_face "reactor_rev_pts/p13" "reactor_rev_pts/p12")
    (cs_go_to "reactor_rev_pts/p12")
)

(script command_script void reactor_rev_end_poke
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "hall4_rev_pts/p0")
)

(script dormant void reactor_rev_cleanup
    (sleep_until 
        (and
            (= g_cortana_rescued true)
            (= (volume_test_players "vol_reactor_rev_clear") false)
        )
    )
    (sleep_forever pylon_04_fall)
    (sleep_forever reactor_rev_spawning)
    (sleep_forever pylon_01_mon)
    (sleep_forever pylon_02_mon)
    (sleep_forever pylon_03_mon)
    (sleep_forever gm_pylon_reactions)
    (sleep_forever gm_pylon_reaction_control)
    (ai_disposable "reactor_rev_cf_01" true)
    (ai_disposable "reactor_rev_cf_02" true)
    (ai_disposable "reactor_rev_cf_03" true)
    (ai_disposable "reactor_rev_cf_04" true)
    (ai_disposable "reactor_rev_pure_01" true)
    (ai_disposable "reactor_rev_pure_02" true)
    (ai_disposable "reactor_rev_pure_03" true)
    (ai_disposable "reactor_rev_pure_04" true)
    (ai_disposable "reactor_rev_pure_05" true)
    (ai_disposable "reactor_rev_pure_ender" true)
    (ai_disposable "reactor_inf_spawned" true)
)

(script dormant void enc_hall_c_return
    (sleep 1)
    (ai_place "hall4_rev_cf_02")
    (ai_place "hall4_rev_cf_03")
    (ai_place "hall4_rev_car_01")
    (ai_place "hall4_rev_car_02")
    (sleep_until (volume_test_players "tv_hc_03") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_hcr_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_hc_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_hcr_obj_control 2)
    (game_save)
    (sleep_until (volume_test_players "tv_hc_01") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_hcr_obj_control 3)
    (game_save)
)

(script dormant void enc_bridge_return
    (data_mine_set_mission_segment "110_140_bridge_rev")
    (if debug 
        (print "enc_bridge_return"))
    (game_save)
    (wake brr_back_door)
    (ai_disposable "cafe_inf_spawned" false)
    (object_destroy "big_screen")
    (object_create_anew "blockage_03")
    (ai_place "bridge_rev_cf_01")
    (sleep_until (volume_test_players "tv_br_return_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_brr_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_br_return_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_brr_obj_control 2)
    (game_save)
    (sleep_until (volume_test_players "tv_br_return_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_brr_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_br_return_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_brr_obj_control 4)
    (game_save)
    (object_set_velocity "cafe_panel_03" 100.0 0.0 0.0)
    (effect_new "objects\vehicles\wraith\fx\weapon\mortar\impact" "bridge_panel_boom_flag")
    (sound_impulse_start "sound\visual_fx\cinematic_panels" "bridge_panel_boom_anchor" 1.0)
    (sleep 5)
    (ai_place "cafe_rev_tank" 1)
)

(script command_script void jumper_jumps
    (cs_ignore_obstacles true)
    (cs_enable_pathfinding_failsafe true)
    (cs_jump 26.0 2.75)
)

(script dormant void bridge_rev_cleanup
    (sleep_until 
        (and
            (= g_cortana_rescued true)
            (= (volume_test_players "tv_enc_bridge_return") false)
        )
    )
    (ai_disposable "bridge_rev_cf_01" true)
    (ai_disposable "bridge_rev_cf_02" true)
    (ai_disposable "bridge_rev_cf_03" true)
    (ai_disposable "cafe_rev_tank" true)
    (ai_disposable "cafe_inf_spawned" true)
)

(script dormant void brr_back_door
    (sleep_until (>= g_brr_obj_control 3))
    (device_set_power "door_bridge_escape" 1.0)
    (device_set_position "door_bridge_escape" 1.0)
    (ai_place "bridge_rev_cf_02")
    (sleep_until (= (device_get_position "door_bridge_escape") 1.0) 1)
    (device_set_power "door_bridge_escape" 0.0)
)

(script dormant void enc_halls_a_b_return
    (data_mine_set_mission_segment "110_150_halls_a_b_rev")
    (if debug 
        (print "enc_halls_a_b_return"))
    (game_save)
    (ai_disposable "halls23_inf_spawned" false)
    (ai_disposable "halls23_too_inf_spawned" false)
    (ai_place "halls23_rev_cf_01" 3)
    (sleep_until 
        (or
            (< (ai_nonswarm_count "halls23_rev_oldskool") 2)
            (= (volume_test_players "vol_hallway_2_rev_start") true)
        )
    )
    (game_save)
    (if (< (ai_nonswarm_count "halls23_rev_oldskool") 3) 
        (ai_place "halls23_rev_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "halls23_rev_oldskool") 3) 
        (ai_place "halls23_rev_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "halls23_rev_oldskool") 3) 
        (ai_place "halls23_rev_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "halls23_rev_oldskool") 3) 
        (ai_place "halls23_rev_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "halls23_rev_oldskool") 3) 
        (ai_place "halls23_rev_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "halls23_rev_oldskool") 3) 
        (ai_place "halls23_rev_cf_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "halls23_rev_oldskool") 3) 
        (ai_place "halls23_rev_cf_02" 1))
    (sleep 1)
    (ai_place "halls23_rev_car_01" 1)
    (sleep 1)
    (ai_place "halls23_rev_car_01" 1)
    (sleep_until 
        (or
            (< (ai_nonswarm_count "halls23_rev_oldskool") 3)
            (= (volume_test_players "vol_hallway_2_rev_start") true)
        )
    )
    (game_save)
    (ai_place "halls23_rev_cf_03" 1)
    (sleep 1)
    (ai_place "halls23_rev_cf_03" 1)
    (sleep 1)
    (ai_place "halls23_rev_cf_03" 1)
)

(script dormant void halls23_rev_cleanup
    (sleep_until 
        (and
            (= g_cortana_rescued true)
            (= (volume_test_players "tv_enc_halls_a_b_return") false)
        )
    )
    (ai_disposable "halls23_rev_cf_01" true)
    (ai_disposable "halls23_rev_cf_02" true)
    (ai_disposable "halls23_rev_cf_03" true)
    (ai_disposable "halls23_rev_car_01" true)
    (ai_disposable "halls23_inf_spawned" true)
    (ai_disposable "halls23_too_inf_spawned" true)
)

(script dormant void enc_pelican_hill_return
    (data_mine_set_mission_segment "110_160_pel_hill_rev")
    (if debug 
        (print "enc_pelican_hill_return"))
    (game_save)
    (wake 110_hc_mission_won)
    (if (= (game_is_cooperative) false) 
        (begin
            (wake ch_16_cortana)
            (wake ch_17_cortana)
        )
    )
    (wake phr_object_management)
    (if (= (game_is_cooperative) false) 
        (begin
            (ai_place "sq_phr_arbiter")
            (object_create_anew "arb_banshee")
        )
    )
    (ai_place "pel_hill_rev_pure_01" 1)
    (sleep 1)
    (sleep 1)
    (ai_place "pel_hill_rev_pure_02" 1)
    (sleep 1)
    (sleep 1)
    (ai_place "pel_hill_rev_pure_03" 1)
    (sleep 1)
    (sleep 1)
    (ai_place "pel_hill_rev_pure_04" 1)
    (sleep 1)
    (sleep 1)
    (ai_place "pel_hill_rev_car_01" 1)
    (sleep 1)
    (sleep_until 
        (or
            (< (ai_nonswarm_count "pel_hill_rev_pureforms") 3)
            (= (volume_test_players "vol_pel_hill_rev_top") true)
        )
    )
    (ai_migrate "pel_hill_rev_pure_01" "pel_hill_rev_pure_03")
    (ai_migrate "pel_hill_rev_pure_02" "pel_hill_rev_pure_04")
    (sleep 1)
    (if (< (ai_nonswarm_count "pel_hill_rev_pure_03") 2) 
        (ai_place "pel_hill_rev_pure_05" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "pel_hill_rev_pure_04") 2) 
        (ai_place "pel_hill_rev_pure_06" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "pel_hill_rev_car_01") 2) 
        (ai_place "pel_hill_rev_car_02" 1))
    (sleep 1)
    (if (< (ai_nonswarm_count "pel_hill_rev_car_01") 2) 
        (ai_place "pel_hill_rev_car_02" 1))
)

(script static void gs_lower_weapon
    (unit_lower_weapon (player0) 30)
    (unit_lower_weapon (player1) 30)
    (unit_lower_weapon (player2) 30)
    (unit_lower_weapon (player3) 30)
)

(script command_script void abort
    (sleep 1)
)

(script command_script void pause_forever
    (sleep_forever)
)

(script static void gs_return_zone_sets
    (zone_set_trigger_volume_enable "begin_zone_set:set_pelican_hill" false)
    (zone_set_trigger_volume_enable "zone_set:set_pelican_hill" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_prisoner" false)
    (zone_set_trigger_volume_enable "zone_set:set_prisoner" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_reactor" false)
    (zone_set_trigger_volume_enable "zone_set:set_reactor" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "begin_zone_set:set_pelican_hill_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_pelican_hill_return" true)
)

(script dormant void recycle_volumes
    (sleep_until (>= g_ph_obj_control 1))
    (add_recycling_volume "tv_rec_ih_01" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_pel_hill") true))
    (add_recycling_volume "tv_rec_ih_01" 0 30)
    (add_recycling_volume "tv_rec_ih_02" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_hallway_2_3") true))
    (add_recycling_volume "tv_rec_ih_02" 0 30)
    (add_recycling_volume "vol_garbage_pel_hill" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_bridge") true))
    (add_recycling_volume "vol_garbage_pel_hill" 0 30)
    (add_recycling_volume "vol_garbage_hallway_2_3" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_hallway_4") true))
    (add_recycling_volume "vol_garbage_hallway_2_3" 0 30)
    (add_recycling_volume "vol_garbage_bridge" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_prisoner") true))
    (add_recycling_volume "vol_garbage_bridge" 0 30)
    (add_recycling_volume "vol_garbage_hallway_4" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_hallway_5") true))
    (add_recycling_volume "vol_garbage_hallway_4" 0 30)
    (add_recycling_volume "vol_garbage_prisoner" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_reactor") true))
    (add_recycling_volume "vol_garbage_prisoner" 0 30)
    (add_recycling_volume "vol_garbage_hallway_5" 30 30)
    (sleep_until (= reactor_blown true))
    (sleep_until (= (volume_test_players "vol_garbage_hallway_4") true))
    (add_recycling_volume "vol_garbage_reactor" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_bridge") true))
    (add_recycling_volume "vol_garbage_reactor" 0 30)
    (add_recycling_volume "vol_garbage_hallway_4" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_hallway_2_3") true))
    (add_recycling_volume "vol_garbage_hallway_4" 0 30)
    (add_recycling_volume "vol_garbage_bridge" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_pel_hill") true))
    (add_recycling_volume "vol_garbage_bridge" 0 30)
    (add_recycling_volume "vol_garbage_hallway_2_3" 30 30)
)

(script dormant void recycle_volumes_ins
    (sleep_until (= reactor_blown true))
    (sleep_until (= (volume_test_players "vol_garbage_hallway_4") true))
    (add_recycling_volume "vol_garbage_reactor" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_bridge") true))
    (add_recycling_volume "vol_garbage_reactor" 0 30)
    (add_recycling_volume "vol_garbage_hallway_4" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_hallway_2_3") true))
    (add_recycling_volume "vol_garbage_hallway_4" 0 30)
    (add_recycling_volume "vol_garbage_bridge" 30 30)
    (sleep_until (= (volume_test_players "vol_garbage_pel_hill") true))
    (add_recycling_volume "vol_garbage_bridge" 0 30)
    (add_recycling_volume "vol_garbage_hallway_2_3" 30 30)
)

(script dormant void reactor_recycle_bottom
    (sleep_until 
        (begin
            (sleep 300)
            (add_recycling_volume "tv_rec_reactor_bot" 0 0)
            (>= g_hcr_obj_control 1)
        )
    )
)

(script dormant void hc_award_primary_skull
    (if (award_skull) 
        (begin
            (object_create "skull_tilt")
            (sleep_until 
                (or
                    (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                    (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                    (unit_has_weapon (unit (player2)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                    (unit_has_weapon (unit (player3)) "objects\weapons\multiplayer\ball\primary_skull.weapon")
                ) 
            5)
            (campaign_metagame_award_primary_skull (player0) 7)
            (campaign_metagame_award_primary_skull (player1) 7)
            (campaign_metagame_award_primary_skull (player2) 7)
            (campaign_metagame_award_primary_skull (player3) 7)
        )
    )
)

(script dormant void ih_object_management
    (object_create_folder "eq_intro_halls")
    (object_create_folder "wp_intro_halls")
    (object_create_folder "bp_intro_halls")
    (sleep_until (>= g_hab_obj_control 1))
    (object_destroy_folder "eq_intro_halls")
    (object_destroy_folder "wp_intro_halls")
    (object_destroy_folder "bp_intro_halls")
)

(script dormant void ph_object_management
    (object_create_folder "eq_pelican_hill")
    (object_create_folder "wp_pelican_hill")
    (object_create_folder "bp_pelican_hill")
    (sleep_until (>= g_br_obj_control 1))
    (object_destroy_folder "eq_pelican_hill")
    (object_destroy_folder "wp_pelican_hill")
    (object_destroy_folder "bp_pelican_hill")
)

(script dormant void hab_object_management
    (object_create_folder "eq_halls_a_b")
    (object_create_folder "wp_halls_a_b")
    (object_create_folder "bp_halls_a_b")
    (sleep_until (>= g_hc_obj_control 1))
    (object_destroy_folder "eq_halls_a_b")
    (object_destroy_folder "wp_halls_a_b")
    (object_destroy_folder "bp_halls_a_b")
)

(script dormant void br_object_management
    (object_create_folder "eq_bridge")
    (object_create_folder "wp_bridge")
    (object_create_folder "bp_bridge")
    (sleep_until (>= g_pr_obj_control 1))
    (object_destroy_folder "eq_bridge")
    (object_destroy_folder "wp_bridge")
    (object_destroy_folder "bp_bridge")
)

(script dormant void hc_object_management
    (object_create_folder "eq_hall_c")
    (object_create_folder "wp_hall_c")
    (object_create_folder "bp_hall_c")
    (object_create_folder "cr_hall_c")
    (sleep_until (>= g_re_obj_control 1))
    (object_destroy_folder "eq_hall_c")
    (object_destroy_folder "wp_hall_c")
    (object_destroy_folder "bp_hall_c")
    (object_destroy_folder "cr_hall_c")
)

(script dormant void pr_object_management
    (object_create_folder "eq_prisoner")
    (object_create_folder "wp_prisoner")
    (object_create_folder "bp_prisoner")
    (object_create_folder "cr_prisoner")
    (sleep_until (>= g_is_obj_control 1))
    (object_destroy_folder "eq_prisoner")
    (object_destroy_folder "wp_prisoner")
    (object_destroy_folder "bp_prisoner")
    (object_destroy_folder "cr_prisoner")
)

(script dormant void hd_object_management
    (object_create_folder "cr_hall_d")
    (sleep_until (>= g_is_obj_control 1))
    (object_destroy_folder "cr_hall_d")
)

(script dormant void re_object_management
    (object_create_folder "eq_reactor")
    (object_create_folder "wp_reactor")
    (object_create_folder "bp_reactor_01")
    (sleep 15)
    (object_create_folder "bp_reactor_02")
    (sleep_until (>= g_brr_obj_control 1))
    (object_destroy_folder "eq_reactor")
    (object_destroy_folder "wp_reactor")
    (object_destroy_folder "bp_reactor_01")
    (object_destroy_folder "bp_reactor_02")
)

(script dormant void phr_object_management
    (object_create_folder "wp_pelican_hill_return")
)

(script static void ins_intro_halls
    (if debug 
        (print "insertion point : intro_halls"))
    (if (!= (current_zone_set) g_set_all) 
        (begin
            (if debug 
                (print "switching zone sets..."))
            (switch_zone_set "set_intro_halls")
            (sleep 1)
        )
    )
    (cinematic_snap_to_black)
    (sleep 5)
    (data_mine_set_mission_segment "110la_hc_arrival")
    (if g_play_cinematics 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (if debug 
                        (print "110la_hc_arrival"))
                    (110la_hc_arrival)
                )
            )
            (cinematic_skip_stop)
            (110la_hc_arrival_cleanup)
        )
    )
    (fade_out 0.0 0.0 0.0 0)
    (sleep 1)
    (cinematic_stop)
    (camera_control false)
    (sleep 1)
    (objectives_clear)
    (object_teleport (player0) "start_player0")
    (object_teleport (player1) "start_player1")
    (object_teleport (player2) "start_player2")
    (object_teleport (player3) "start_player3")
    (player0_set_pitch -16.0 0)
    (player1_set_pitch -16.0 0)
    (player2_set_pitch -16.0 0)
    (player3_set_pitch -16.0 0)
    (set g_insertion_index 1)
    (cinematic_fade_to_title)
    (wake 110_title1)
    (wake objective_1_set)
)

(script static void ins_reactor_return
    (if debug 
        (print "insertion point : reactor_return"))
    (cinematic_snap_to_black)
    (sleep 5)
    (gs_return_zone_sets)
    (if (!= (current_zone_set) g_set_all) 
        (begin
            (if debug 
                (print "switching zone sets..."))
            (switch_zone_set "set_reactor")
            (sleep 1)
        )
    )
    (wake 110_highcharity_cortana)
    (sleep_until g_cortana_rescued)
    (set g_insertion_index 10)
)

(script static void ins_pelican_hill
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 2)
    (if (!= (current_zone_set) g_set_all) 
        (begin
            (if debug 
                (print "switching zone sets..."))
            (switch_zone_set "set_pelican_hill")
            (sleep 1)
        )
    )
    (sleep 1)
    (object_teleport (player0) "pel_hill_p0")
    (object_teleport (player1) "pel_hill_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_halls_a_b
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 3)
    (if (!= (current_zone_set) g_set_all) 
        (begin
            (if debug 
                (print "switching zone sets..."))
            (switch_zone_set "set_bridge")
            (sleep 1)
        )
    )
    (sleep 1)
    (object_teleport (player0) "hallway_2_p0")
    (object_teleport (player1) "hallway_2_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_bridge
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 4)
    (switch_zone_set "set_bridge")
    (sleep 1)
    (object_teleport (player0) "bridge_p0")
    (object_teleport (player1) "bridge_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_hall_c
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 5)
    (switch_zone_set "set_prisoner")
    (sleep 1)
    (object_teleport (player0) "hallway_4_p0")
    (object_teleport (player1) "hallway_4_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_prisoner
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 6)
    (switch_zone_set "set_reactor")
    (sleep 1)
    (object_teleport (player0) "prisoner_p0")
    (object_teleport (player1) "prisoner_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_hall5
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 7)
    (switch_zone_set "set_reactor")
    (sleep 1)
    (object_teleport (player0) "hallway_5_p0")
    (object_teleport (player1) "hallway_5_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_reactor
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 8)
    (switch_zone_set "set_reactor")
    (sleep 1)
    (object_teleport (player0) "reactor_p0")
    (object_teleport (player1) "reactor_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_inner_sanctum
    (ai_erase_all)
    (if (!= (current_zone_set) g_set_all) 
        (begin
            (if debug 
                (print "switching zone sets..."))
            (switch_zone_set "set_reactor")
            (sleep 1)
        )
    )
    (object_teleport (player0) "sanctum_p0")
    (object_teleport (player1) "sanctum_p1")
    (player0_set_pitch -10.0 0)
    (player1_set_pitch -10.0 0)
    (player2_set_pitch -10.0 0)
    (player3_set_pitch -10.0 0)
    (set g_insertion_index 9)
    (garbage_collect_unsafe)
)

(script static void ins_hall6_rev
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 10)
    (set g_cortana_rescued true)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" true)
    (switch_zone_set "set_reactor")
    (sleep 1)
    (object_teleport (player0) "hallway_6_rev_p0")
    (object_teleport (player1) "hallway_6_rev_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_reactor_rev
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 11)
    (set g_cortana_rescued true)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" true)
    (switch_zone_set "set_reactor")
    (sleep 1)
    (object_teleport (player0) "reactor_rev_p0")
    (object_teleport (player1) "reactor_rev_p1")
    (garbage_collect_now)
    (game_save)
)

(script static void ins_hall4_rev
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 14)
    (set g_cortana_rescued true)
    (set reactor_blown true)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" true)
    (switch_zone_set "set_prisoner")
    (sleep 1)
    (object_teleport (player0) "hallway_4_rev_p0")
    (object_teleport (player1) "hallway_4_rev_p1")
    (set reactor_blown true)
    (garbage_collect_now)
    (game_save)
)

(script static void ins_bridge_rev
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 12)
    (set g_cortana_rescued true)
    (set reactor_blown true)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" true)
    (switch_zone_set "set_bridge_return")
    (sleep 1)
    (object_teleport (player0) "bridge_rev_p0")
    (object_teleport (player1) "bridge_rev_p1")
    (set reactor_blown true)
    (garbage_collect_now)
    (game_save)
)

(script static void ins_hall3_rev
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 16)
    (set g_cortana_rescued true)
    (set reactor_blown true)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" true)
    (switch_zone_set "set_bridge_return")
    (sleep 1)
    (object_teleport (player0) "hallway_3_rev_p0")
    (object_teleport (player1) "hallway_3_rev_p1")
    (set reactor_blown true)
    (garbage_collect_now)
    (game_save)
)

(script static void ins_pelican_hill_return
    (ai_erase_all)
    (sleep 1)
    (set g_insertion_index 17)
    (set g_cortana_rescued true)
    (set reactor_blown true)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "zone_set:set_bridge" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_bridge_return" true)
    (zone_set_trigger_volume_enable "zone_set:set_bridge_return" true)
    (switch_zone_set "set_bridge_return")
    (sleep 1)
    (object_teleport (player0) "pel_hill_rev_p0")
    (object_teleport (player1) "pel_hill_rev_p1")
    (set reactor_blown true)
    (garbage_collect_now)
    (game_save)
)

(script static void !110la01_landing_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 0 "cin_110la_landing_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_110la_landing_anchor" "cin_110la_landing_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 (cinematic_object_get_scenery "cin_matte") "110la01_1" true)
    (object_hide (cinematic_object_get_scenery "cin_banshee1") true)
    (object_hide (cinematic_object_get_scenery "cin_banshee2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 (cinematic_object_get_scenery "cin_fx_marker") "110la01_cin_fx_marker_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 (cinematic_object_get_scenery "cin_fx_marker1") "110la01_cin_fx_marker1_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -0.7 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 0 0 0 0)
    (if (= (game_is_cooperative) true) 
        (sound_impulse_start "sound\cinematics\110_hc\110la\110la_foley_arb_1_1" none 1.0))
    (cinematic_scripting_start_music 0 0 0 1)
    (cinematic_print "custom script play")
    (sleep 4)
    (sound_impulse_mark_as_outro "sound\cinematics\110_hc\110la\110la_foley_chf_1_1")
    (cinematic_print "custom script play")
    (sleep 95)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la01_landing_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 1 "cin_110la_landing_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_110la_landing_anchor" "cin_110la_landing_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 (cinematic_object_get_scenery "cin_matte") "110la01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 (cinematic_object_get_scenery "cin_banshee1") "110la01_cin_banshee1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 (cinematic_object_get_scenery "cin_banshee2") "110la01_cin_banshee2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 (cinematic_object_get_scenery "cin_fx_marker") "110la01_cin_fx_marker_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 (cinematic_object_get_scenery "cin_fx_marker1") "110la01_cin_fx_marker1_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -0.7 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee1") "banshee_power" 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee1") "banshee_trails" 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee2") "banshee_power" 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee2") "banshee_trails" 1.0 0.0)
    (sleep 221)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la01_landing_sc
    (begin
        (render_atmosphere_fog false)
        (sound_class_set_gain "amb" 0.0 0)
    )
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (!110la01_landing_sc_sh1)
    (!110la01_landing_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 0 0 (cinematic_object_get_scenery "cin_matte"))
    (cinematic_scripting_destroy_object 0 0 1 (cinematic_object_get_scenery "cin_banshee1"))
    (cinematic_scripting_destroy_object 0 0 2 (cinematic_object_get_scenery "cin_banshee2"))
    (cinematic_scripting_destroy_object 0 0 3 (cinematic_object_get_scenery "cin_fx_marker"))
    (cinematic_scripting_destroy_object 0 0 4 (cinematic_object_get_scenery "cin_fx_marker1"))
    (render_atmosphere_fog true)
)

(script static void !110la02_drop_down_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 1) 0 "cin_110la_landing_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_110la_landing_anchor" "cin_110la_landing_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 0 (cinematic_object_get_unit "cin_arbiter") "110la02_cin_arbiter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 (cinematic_object_get_unit "cin_chief") "110la02_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 (cinematic_object_get_scenery "cin_banshee1") "110la02_cin_banshee1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 3 (cinematic_object_get_scenery "cin_banshee3") "110la02_cin_banshee3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 4 (cinematic_object_get_scenery "cin_fx_marker") "110la02_cin_fx_marker_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 5 (cinematic_object_get_scenery "cin_carbine") "110la02_cin_carbine_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 6 (cinematic_object_get_scenery "cin_shotgun") "110la02_cin_shotgun_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -2.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee1") "banshee_trails" 0.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee1") "banshee_power" 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee3") "banshee_power" 1.0 0.0)
    (sleep 250)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee1") "banshee_power" 0.0 0.0)
    (sleep 70)
    (object_set_function_variable (cinematic_object_get_scenery "cin_banshee3") "banshee_power" 0.0 0.0)
    (sleep 115)
    (cinematic_scripting_start_dialogue 0 1 0 0 none)
    (sleep 116)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la02_drop_down_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 1) 0)
    (!110la02_drop_down_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 1 0 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 0 1 1 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 1 2 (cinematic_object_get_scenery "cin_banshee1"))
    (cinematic_scripting_destroy_object 0 1 3 (cinematic_object_get_scenery "cin_banshee3"))
    (cinematic_scripting_destroy_object 0 1 4 (cinematic_object_get_scenery "cin_fx_marker"))
    (cinematic_scripting_destroy_object 0 1 5 (cinematic_object_get_scenery "cin_carbine"))
    (cinematic_scripting_destroy_object 0 1 6 (cinematic_object_get_scenery "cin_shotgun"))
)

(script static void !110la03_b_inside_hole_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 0 "cin_flag_110la")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 0)
    (cinematic_object_create_cinematic_anchor "cin_flag_110la" "cin_flag_110la")
    (object_hide (cinematic_object_get_unit "cin_arbiter1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_chief") "110la01_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_scenery "cin_shotgun") "110la03_b_cin_shotgun_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -2.0 0.0)
    (sleep 67)
    (cinematic_scripting_start_effect 0 2 0 0 (cinematic_object_get "cin_chief"))
    (sleep 2)
    (cinematic_scripting_start_effect 0 2 0 1 (cinematic_object_get "cin_chief"))
    (sleep 38)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la03_b_inside_hole_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 1 "cin_flag_110la")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 1)
    (cinematic_object_create_cinematic_anchor "cin_flag_110la" "cin_flag_110la")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_arbiter1") "110la01_cin_arbiter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_chief") "110la01_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_scenery "cin_shotgun") "110la03_b_cin_shotgun_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -2.0 0.0)
    (sleep 11)
    (cond
        ((= (game_is_cooperative) false)
            (begin
                (sound_impulse_start_with_subtitle "sound\dialog\110_hc\mission\110ma_020_jon" none 1.0 "110ma_020_jon" "")
            )
        )
        (true
            (sound_impulse_start_with_subtitle "sound\dialog\110_hc\mission\110ma_030_jon" none 1.0 "110ma_030_jon" "")
        )
    )
    (cinematic_print "custom script play")
    (sleep 70)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la03_b_inside_hole_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 2 "cin_flag_110la")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 2)
    (cinematic_object_create_cinematic_anchor "cin_flag_110la" "cin_flag_110la")
    (object_hide (cinematic_object_get_unit "cin_arbiter1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_chief") "110la01_cin_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_scenery "cin_shotgun") "110la03_b_cin_shotgun_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -2.0 0.0)
    (cinematic_scripting_start_effect 0 2 2 0 (cinematic_object_get "cin_chief"))
    (sleep 61)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la03_b_inside_hole_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 3 "cin_flag_110la")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 3)
    (cinematic_object_create_cinematic_anchor "cin_flag_110la" "cin_flag_110la")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_arbiter1") "110la01_cin_arbiter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_chief") "110la01_cin_chief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_scenery "cin_shotgun") "110la03_b_cin_shotgun_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure -2.0 0.0)
    (sleep 21)
    (cinematic_scripting_start_dialogue 0 2 3 0 none)
    (sleep 42)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la03_b_inside_hole_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 4 "cin_flag_110la")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 4)
    (cinematic_object_create_cinematic_anchor "cin_flag_110la" "cin_flag_110la")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_arbiter1") "110la01_cin_arbiter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_chief") "110la01_cin_chief_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_scenery "cin_shotgun") "110la03_b_cin_shotgun_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure -2.0 0.0)
    (sleep 91)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la03_b_inside_hole_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 2) 5 "cin_flag_110la")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 5)
    (cinematic_object_create_cinematic_anchor "cin_flag_110la" "cin_flag_110la")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 (cinematic_object_get_unit "cin_arbiter1") "110la01_cin_arbiter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 (cinematic_object_get_unit "cin_chief") "110la01_cin_chief_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 (cinematic_object_get_scenery "cin_shotgun") "110la03_b_cin_shotgun_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 90)
    (fade_out 0.0 0.0 0.0 15)
    (cinematic_print "custom script play")
    (sleep 24)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110la03_b_inside_hole_sc
    (cinematic_print "beginning scene 3")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 2) 0)
    (!110la03_b_inside_hole_sc_sh1)
    (!110la03_b_inside_hole_sc_sh2)
    (!110la03_b_inside_hole_sc_sh3)
    (!110la03_b_inside_hole_sc_sh4)
    (!110la03_b_inside_hole_sc_sh5)
    (!110la03_b_inside_hole_sc_sh6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 2 0 (cinematic_object_get_unit "cin_arbiter1"))
    (cinematic_scripting_destroy_object 0 2 1 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 0 2 2 (cinematic_object_get_scenery "cin_shotgun"))
)

(script static void 110la_hc_arrival_debug
    (cinematic_zone_activate_for_debugging 0)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
    (fade_in 0.0 0.0 0.0 15)
    (!110la01_landing_sc)
    (!110la02_drop_down_sc)
    (!110la03_b_inside_hole_sc)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
)

(script static void 110la_hc_arrival
    (cinematic_zone_activate 0)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
    (fade_in 0.0 0.0 0.0 15)
    (!110la01_landing_sc)
    (!110la02_drop_down_sc)
    (!110la03_b_inside_hole_sc)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 110la_hc_arrival_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void !110lb00_transition_sc_sh1
    (begin
        (fade_out 0.0 0.0 0.0 0)
        (sleep 120)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 0 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 1)
    (cinematic_scripting_start_music 1 0 0 1)
    (sleep 4)
    (sound_impulse_mark_as_outro "sound\cinematics\110_hc\110lb\110lb_foley_1_1")
    (cinematic_print "custom script play")
    (sleep 3)
    (cinematic_scripting_start_music 1 0 0 0)
    (sleep 83)
    (sound_class_set_gain "scripted" 1.0 60)
    (cinematic_print "custom script play")
    (cinematic_scripting_start_dialogue 1 0 0 0 none)
    (sleep 126)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb00_transition_sc
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "cinematic_music" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain_db "foley" -54.0 0)
    )
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (!110lb00_transition_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh1
    (fade_in 0.0 0.0 0.0 100)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 0 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 (cinematic_object_get_unit "cin_chief") "110lb01_cin_chief_1" true)
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -1.0 0.0)
    (sleep 121)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 1 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 1)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 (cinematic_object_get_unit "cin_chief") "110lb01_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 (cinematic_object_get_unit "cin_cortana") "110lb01_cin_cortana_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -1.0 0.0)
    (object_clear_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on")
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_scale" 0.3 0.0)
    (cinematic_print "custom script play")
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "near_death" 0.0 0.0)
    (sleep 36)
    (cinematic_scripting_start_dialogue 1 1 1 0 (cinematic_object_get_unit "cin_cortana"))
    (sleep 75)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 2 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 2)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 (cinematic_object_get_unit "cin_chief") "110lb01_cin_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 (cinematic_object_get_unit "cin_cortana") "110lb01_cin_cortana_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -1.0 0.0)
    (sleep 151)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh4
    (begin
        (texture_camera_on)
        (texture_camera_set_object_marker (cinematic_object_get "cin_chief") "drop" 110.0)
        (set texture_camera_near_plane 0.01)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 3 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 3)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 (cinematic_object_get_unit "cin_chief") "110lb01_cin_chief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 (cinematic_object_get_unit "cin_cortana") "110lb01_cin_cortana_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure -3.0 0.0)
    (object_clear_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on")
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_scale" 0.3 0.0)
    (cinematic_print "custom script play")
    (sleep 39)
    (cinematic_scripting_start_dialogue 1 1 3 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 123)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 4 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 4)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 (cinematic_object_get_unit "cin_cortana") "110lb01_cin_cortana_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure -1.0 0.0)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "near_death" 0.0 0.0)
    (sleep 5)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "near_death" 1.0 200.0)
    (sleep 85)
    (cinematic_scripting_start_dialogue 1 1 4 0 (cinematic_object_get_unit "cin_cortana"))
    (sleep 171)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 5 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 5)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 (cinematic_object_get_unit "cin_chief") "110lb01_cin_chief_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 (cinematic_object_get_unit "cin_cortana") "110lb01_cin_cortana_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure -8.0 0.0)
    (cinematic_print "custom script play")
    (sleep 35)
    (cinematic_scripting_start_dialogue 1 1 5 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 73)
    (cinematic_scripting_start_dialogue 1 1 5 1 (cinematic_object_get_unit "cin_chief"))
    (sleep 59)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 6 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 6)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 (cinematic_object_get_unit "cin_chief") "110lb01_cin_chief_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 (cinematic_object_get_unit "cin_cortana") "110lb01_cin_cortana_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure -1.0 0.0)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on" 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_scale" 0.3 0.0)
    (cinematic_print "custom script play")
    (sleep 124)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 7 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 7)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (object_hide (cinematic_object_get_unit "cin_chief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 (cinematic_object_get_unit "cin_cortana") "110lb01_cin_cortana_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 (cinematic_object_get_scenery "cin_index") "index_10lb01_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (render_exposure -1.0 0.0)
    (sleep 23)
    (cinematic_scripting_start_dialogue 1 1 7 0 (cinematic_object_get_unit "cin_cortana"))
    (sleep 149)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb01_found_me_sc
    (begin
        (texture_camera_on)
        (texture_camera_set_object_marker (cinematic_object_get "cin_chief") "drop" 110.0)
        (set texture_camera_near_plane 0.01)
    )
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 0)
    (!110lb01_found_me_sc_sh1)
    (!110lb01_found_me_sc_sh2)
    (!110lb01_found_me_sc_sh3)
    (!110lb01_found_me_sc_sh4)
    (!110lb01_found_me_sc_sh5)
    (!110lb01_found_me_sc_sh6)
    (!110lb01_found_me_sc_sh7)
    (!110lb01_found_me_sc_sh8)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 1 1 0 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 1 1 1 (cinematic_object_get_unit "cin_cortana"))
    (cinematic_scripting_destroy_object 1 1 2 (cinematic_object_get_scenery "cin_index"))
)

(script static void !110lb02_index_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 2) 0 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 2) 0)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 0 (cinematic_object_get_unit "cin_chief") "110lb02_cin_chief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 1 (cinematic_object_get_unit "cin_cortana") "110lb02_cin_cortana_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 2 (cinematic_object_get_scenery "cin_cortana_chip") "110lb02_cortana_chip_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 3 (cinematic_object_get_scenery "cin_index") "index_10lb02_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -3.0 0.0)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on" 1.0 0.0)
    (cinematic_print "custom script play")
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_scale" 0.3 0.0)
    (begin
        (texture_camera_on)
        (texture_camera_set_object_marker (cinematic_object_get "cin_chief") "visor_reflection" 40.0)
        (set texture_camera_near_plane 0.02)
        (object_set_permutation (cinematic_object_get "cin_chief") "helmet" "realtime")
    )
    (sleep 8)
    (cinematic_scripting_start_dialogue 1 2 0 0 (cinematic_object_get_unit "cin_cortana"))
    (sleep 201)
    (cinematic_scripting_start_dialogue 1 2 0 1 (cinematic_object_get_unit "cin_cortana"))
    (sleep 55)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb02_index_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 2) 1 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 2) 1)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 0 (cinematic_object_get_unit "cin_chief") "110lb02_cin_chief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 1 (cinematic_object_get_unit "cin_cortana") "110lb02_cin_cortana_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 2 (cinematic_object_get_scenery "cin_cortana_chip") "110lb02_cortana_chip_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 3 (cinematic_object_get_scenery "cin_index") "index_10lb02_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 0.0 0.0)
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_scripting_start_dialogue 1 2 1 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 73)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb02_index_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 2) 2 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 2) 2)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 0 (cinematic_object_get_unit "cin_chief") "110lb02_cin_chief_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 1 (cinematic_object_get_unit "cin_cortana") "110lb02_cin_cortana_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 2 (cinematic_object_get_scenery "cin_cortana_chip") "110lb02_cortana_chip_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 3 (cinematic_object_get_scenery "cin_index") "index_10lb02_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 0.0 0.0)
    (sleep 31)
    (cinematic_scripting_start_dialogue 1 2 2 0 (cinematic_object_get_unit "cin_chief"))
    (sleep 99)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 0.0 0.0)
    (object_clear_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on")
    (cinematic_scripting_start_effect 1 2 2 0 (cinematic_object_get "cin_cortana_chip"))
    (sleep 1)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 1.0 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 1.0 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 0.0 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 0.0 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 1.0 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 0.0 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 0.0 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 1.0 0.0)
    (sleep 115)
    (cinematic_scripting_start_dialogue 1 2 2 1 (cinematic_object_get_unit "cin_cortana"))
    (sleep 58)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lb02_index_sc
    (cinematic_print "beginning scene 3")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 2) 0)
    (!110lb02_index_sc_sh1)
    (!110lb02_index_sc_sh2)
    (!110lb02_index_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 1 2 0 (cinematic_object_get_unit "cin_chief"))
    (cinematic_scripting_destroy_object 1 2 1 (cinematic_object_get_unit "cin_cortana"))
    (cinematic_scripting_destroy_object 1 2 2 (cinematic_object_get_scenery "cin_cortana_chip"))
    (cinematic_scripting_destroy_object 1 2 3 (cinematic_object_get_scenery "cin_index"))
)

(script static void 110lb_rescue_cortana_debug
    (cinematic_zone_activate_for_debugging 1)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
    (fade_in 0.0 0.0 0.0 0)
    (!110lb00_transition_sc)
    (!110lb01_found_me_sc)
    (!110lb02_index_sc)
    (texture_camera_off)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 1)
)

(script static void 110lb_rescue_cortana
    (cinematic_zone_activate 1)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
    (fade_in 0.0 0.0 0.0 0)
    (!110lb00_transition_sc)
    (!110lb01_found_me_sc)
    (!110lb02_index_sc)
    (texture_camera_off)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 110lb_rescue_cortana_cleanup
    (cinematic_scripting_clean_up 1)
)

(script static void !110lc01_pelican_takeoff_sh1
    (begin
        (object_destroy "ptest5")
        (fade_in 0.0 0.0 0.0 15)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 0 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_cortana") "110lc01_cin_cortana_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_masterchief") "110lc01_cin_masterchief_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 3 (cinematic_object_get_scenery "cin_cortana_chip") "110lc01_cin_cortana_chip_1" true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_skyline") true)
    (object_hide (cinematic_object_get_scenery "cin_matte3") true)
    (object_hide (cinematic_object_get_scenery "cin_matte2") true)
    (object_hide (cinematic_object_get_scenery "cin_matte1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_unit "cin_arbiter") "110lc01_cin_arbiter_1" true)
    (object_hide (cinematic_object_get_scenery "cin_tentacle1") true)
    (object_hide (cinematic_object_get_scenery "cin_godrays") true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -2.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_cortana_chip") "one" 1.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 2 0 0 0)
    (sleep 120)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 1 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 1)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_cortana") "110lc01_cin_cortana_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_masterchief") "110lc01_cin_masterchief_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_2" true)
    (object_hide (cinematic_object_get_scenery "cin_cortana_chip") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_skyline") true)
    (object_hide (cinematic_object_get_scenery "cin_matte3") true)
    (object_hide (cinematic_object_get_scenery "cin_matte2") true)
    (object_hide (cinematic_object_get_scenery "cin_matte1") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_scenery "cin_tentacle1") true)
    (object_hide (cinematic_object_get_scenery "cin_godrays") true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -3.0 0.0)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on" 0.0 0.0)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_scale" 0.276 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 2 0 1 0)
    (sleep 4)
    (cinematic_scripting_start_effect 2 0 1 0 (cinematic_object_get "cin_pelican"))
    (sleep 5)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on" 1.0 0.0)
    (cinematic_print "waiting for event (object_set_function_variable (cinematic_object_get_unit \"cin_cortana\") glow_on 0.000000 0.000000) which occurs at frame 118, but shot only has 118 frames")
    (sleep 108)
    (object_set_function_variable (cinematic_object_get_unit "cin_cortana") "glow_on" 0.0 0.0)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 2 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 2)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (object_hide (cinematic_object_get_unit "cin_masterchief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_3" true)
    (object_hide (cinematic_object_get_scenery "cin_cortana_chip") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_skyline") true)
    (object_hide (cinematic_object_get_scenery "cin_matte3") true)
    (object_hide (cinematic_object_get_scenery "cin_matte2") true)
    (object_hide (cinematic_object_get_scenery "cin_matte1") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 11 (cinematic_object_get_scenery "cin_tentacle1") "110lc01_cin_tentacle1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_godrays") "110lc01_godray_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -3.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.15 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.15 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "lights" 1.0 0.0)
    (sleep 150)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.75 50.0)
    (sleep 71)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 3 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 3)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_cortana") "110lc01_cin_cortana_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_masterchief") "110lc01_cin_masterchief_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_4" true)
    (object_hide (cinematic_object_get_scenery "cin_cortana_chip") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_skyline") true)
    (object_hide (cinematic_object_get_scenery "cin_matte3") true)
    (object_hide (cinematic_object_get_scenery "cin_matte2") true)
    (object_hide (cinematic_object_get_scenery "cin_matte1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_unit "cin_arbiter") "110lc01_cin_arbiter_4" true)
    (object_hide (cinematic_object_get_scenery "cin_tentacle1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_godrays") "110lc01_godray_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure -5.0 0.0)
    (cinematic_scripting_start_effect 2 0 3 0 (cinematic_object_get "cin_pelican"))
    (sleep 93)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 4 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 4)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (object_hide (cinematic_object_get_unit "cin_masterchief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_5" true)
    (object_hide (cinematic_object_get_scenery "cin_cortana_chip") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_skyline") true)
    (object_hide (cinematic_object_get_scenery "cin_matte3") true)
    (object_hide (cinematic_object_get_scenery "cin_matte2") true)
    (object_hide (cinematic_object_get_scenery "cin_matte1") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 11 (cinematic_object_get_scenery "cin_tentacle1") "110lc01_cin_tentacle1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_godrays") "110lc01_godray_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure -3.0 0.0)
    (cinematic_scripting_start_effect 2 0 4 0 (cinematic_object_get "cin_pelican"))
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.5 0.0)
    (cinematic_scripting_start_effect 2 0 4 1 (cinematic_object_get "cin_pelican"))
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.5 0.0)
    (sleep 60)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 1.0 10.0)
    (sleep 30)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 1.0 30.0)
    (sleep 5)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 0.5 10.0)
    (sleep 47)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 5 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 5)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (object_hide (cinematic_object_get_unit "cin_masterchief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_6" true)
    (object_hide (cinematic_object_get_scenery "cin_cortana_chip") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_skyline") true)
    (object_hide (cinematic_object_get_scenery "cin_matte3") true)
    (object_hide (cinematic_object_get_scenery "cin_matte2") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 9 (cinematic_object_get_scenery "cin_matte1") "110lc01_6" true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_scenery "cin_tentacle1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_godrays") "110lc01_godray_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure -0.5 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.15 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 1.0 0.0)
    (sleep 43)
    (cinematic_scripting_start_effect 2 0 5 1 (cinematic_object_get "cin_pelican"))
    (cinematic_scripting_start_effect 2 0 5 0 (cinematic_object_get "cin_pelican"))
    (sleep 26)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 6 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 6)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 (cinematic_object_get_unit "cin_cortana") "110lc01_cin_cortana_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 (cinematic_object_get_unit "cin_masterchief") "110lc01_cin_masterchief_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_7" true)
    (object_hide (cinematic_object_get_scenery "cin_cortana_chip") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_skyline") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_matte3") "110lc01_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 8 (cinematic_object_get_scenery "cin_matte2") "110lc01_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 9 (cinematic_object_get_scenery "cin_matte1") "110lc01_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 (cinematic_object_get_unit "cin_arbiter") "110lc01_cin_arbiter_7" true)
    (object_hide (cinematic_object_get_scenery "cin_tentacle1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_godrays") "110lc01_godray_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 1.0 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.5 0.0)
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 1.0 0.0)
    (sleep 5)
    (cinematic_scripting_start_effect 2 0 6 0 (cinematic_object_get "cin_matte2"))
    (sleep 25)
    (cinematic_scripting_start_effect 2 0 6 1 (cinematic_object_get "cin_matte2"))
    (sleep 25)
    (cinematic_scripting_start_effect 2 0 6 2 (cinematic_object_get "cin_matte2"))
    (sleep 32)
    (cinematic_scripting_start_effect 2 0 6 3 (cinematic_object_get "cin_matte2"))
    (sleep 60)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 7 "110lc01_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 7)
    (cinematic_object_create_cinematic_anchor "110lc01_anchor" "110lc01_anchor")
    (object_hide (cinematic_object_get_unit "cin_cortana") true)
    (object_hide (cinematic_object_get_unit "cin_masterchief") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 (cinematic_object_get_scenery "cin_pelican") "110lc01_cin_pelican_8" true)
    (object_hide (cinematic_object_get_scenery "cin_cortana_chip") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_profile") true)
    (object_hide (cinematic_object_get_scenery "cin_mattes_hc_shell") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 (cinematic_object_get_scenery "cin_mattes_skyline") "110lc01_skyline_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 (cinematic_object_get_scenery "cin_matte3") "110lc01_8" true)
    (object_hide (cinematic_object_get_scenery "cin_matte2") true)
    (object_hide (cinematic_object_get_scenery "cin_matte1") true)
    (object_hide (cinematic_object_get_unit "cin_arbiter") true)
    (object_hide (cinematic_object_get_scenery "cin_tentacle1") true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 (cinematic_object_get_scenery "cin_godrays") "110lc01_godray_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (render_exposure 0.0 0.0)
    (cinematic_scripting_start_effect 2 0 7 0 (cinematic_object_get "cin_pelican"))
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_down" 0.25 0.0)
    (cinematic_scripting_start_effect 2 0 7 1 (cinematic_object_get "cin_pelican"))
    (object_set_function_variable (cinematic_object_get_scenery "cin_pelican") "thrusters_back" 1.0 0.0)
    (sleep 130)
    (fade_out 0.0 0.0 0.0 15)
    (cinematic_print "custom script play")
    (sleep 15)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110lc01_pelican_takeoff
    (sound_class_set_gain "amb" 0.0 60)
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (!110lc01_pelican_takeoff_sh1)
    (!110lc01_pelican_takeoff_sh2)
    (!110lc01_pelican_takeoff_sh3)
    (!110lc01_pelican_takeoff_sh4)
    (!110lc01_pelican_takeoff_sh5)
    (!110lc01_pelican_takeoff_sh6)
    (!110lc01_pelican_takeoff_sh7)
    (!110lc01_pelican_takeoff_sh8)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 0 0 (cinematic_object_get_unit "cin_cortana"))
    (cinematic_scripting_destroy_object 2 0 1 (cinematic_object_get_unit "cin_masterchief"))
    (cinematic_scripting_destroy_object 2 0 2 (cinematic_object_get_scenery "cin_pelican"))
    (cinematic_scripting_destroy_object 2 0 3 (cinematic_object_get_scenery "cin_cortana_chip"))
    (cinematic_scripting_destroy_object 2 0 4 (cinematic_object_get_scenery "cin_mattes_hc_profile"))
    (cinematic_scripting_destroy_object 2 0 5 (cinematic_object_get_scenery "cin_mattes_hc_shell"))
    (cinematic_scripting_destroy_object 2 0 6 (cinematic_object_get_scenery "cin_mattes_skyline"))
    (cinematic_scripting_destroy_object 2 0 7 (cinematic_object_get_scenery "cin_matte3"))
    (cinematic_scripting_destroy_object 2 0 8 (cinematic_object_get_scenery "cin_matte2"))
    (cinematic_scripting_destroy_object 2 0 9 (cinematic_object_get_scenery "cin_matte1"))
    (cinematic_scripting_destroy_object 2 0 10 (cinematic_object_get_unit "cin_arbiter"))
    (cinematic_scripting_destroy_object 2 0 11 (cinematic_object_get_scenery "cin_tentacle1"))
    (cinematic_scripting_destroy_object 2 0 12 (cinematic_object_get_scenery "cin_godrays"))
    (sleep 120)
)

(script static void 110lc_leave_hc_debug
    (cinematic_zone_activate_for_debugging 2)
    (sleep 1)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
    (fade_in 0.0 0.0 0.0 0)
    (cinematic_outro_start)
    (!110lc01_pelican_takeoff)
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 2)
)

(script static void 110lc_leave_hc
    (cinematic_zone_activate 2)
    (sleep 1)
    (camera_set_cinematic)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
    (fade_in 0.0 0.0 0.0 0)
    (cinematic_outro_start)
    (!110lc01_pelican_takeoff)
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 110lc_leave_hc_cleanup
    (cinematic_scripting_clean_up 2)
)

(script static void !110ca_crying_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 (cinematic_object_get_unit "cortana") "110ca_crying_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 3 0 0 0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 3 0 0 0 none)
    (sleep 222)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110ca_crying_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (!110ca_crying_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 0 0 (cinematic_object_get_unit "cortana"))
)

(script continuous void 110ca_crying
    (sleep_forever)
    (cinematic_zone_activate 3)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 3))
    (set g_cortana_header true)
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110ca_crying_sc)
    (set g_cortana_footer true)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 3)
)

(script static void !110cb_coin_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 (cinematic_object_get_unit "cin_cortana") "110cb_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 4 0 0 0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 4 0 0 0 none)
    (sleep 305)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110cb_coin_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (!110cb_coin_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 4 0 0 (cinematic_object_get_unit "cin_cortana"))
)

(script continuous void 110cb_coin
    (sleep_forever)
    (cinematic_zone_activate 4)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 4))
    (set g_cortana_header true)
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110cb_coin_sc)
    (set g_cortana_footer true)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 4)
)

(script static void !110cc_abyss_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 0 (cinematic_object_get_unit "cin_cortana") "110cc_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 5 0 0 0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 5 0 0 0 none)
    (sleep 404)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110cc_abyss_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5 0) 0)
    (!110cc_abyss_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 5 0 0 (cinematic_object_get_unit "cin_cortana"))
)

(script continuous void 110cc_abyss
    (sleep_forever)
    (cinematic_zone_activate 5)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 5))
    (begin
        (set g_cortana_header true)
        (damage_players "cinematics\cortana_channel\110cc_abyss\110cc_abyss")
    )
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110cc_abyss_sc)
    (begin
        (set g_cortana_footer true)
        (set g_gravemind_footer true)
    )
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 5)
)

(script static void !110cd_no_more_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 6 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 6 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 0 (cinematic_object_get_unit "cin_cortana") "110cd_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 6 0 0 0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 6 0 0 0 (cinematic_object_get_unit "cin_cortana"))
    (sleep 458)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110cd_no_more_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 6 0) 0)
    (!110cd_no_more_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 6 0 0 (cinematic_object_get_unit "cin_cortana"))
)

(script continuous void 110cd_no_more
    (sleep_forever)
    (cinematic_zone_activate 6)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 6))
    (begin
        (set g_cortana_header true)
        (damage_players "cinematics\cortana_channel\110cd_no_more\110cd_no_more")
    )
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110cd_no_more_sc)
    (set g_cortana_footer true)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 6)
)

(script static void !110ce_monument_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 7 0) 0 "cortana_flag")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7 0) 0)
    (cinematic_object_create_cinematic_anchor "cortana_flag" "cortana_flag")
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 0 (cinematic_object_get_unit "cin_cortana") "110ce_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 7 0 0 0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 7 0 0 1 (cinematic_object_get_unit "cin_cortana"))
    (cinematic_scripting_start_dialogue 7 0 0 0 none)
    (sleep 319)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110ce_monument_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7 0) 0)
    (!110ce_monument_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 7 0 0 (cinematic_object_get_unit "cin_cortana"))
)

(script continuous void 110ce_monument
    (sleep_forever)
    (cinematic_zone_activate 7)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 7))
    (set g_cortana_header true)
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110ce_monument_sc)
    (set g_cortana_footer true)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 7)
)

(script static void !110va_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 0 "cin_110lb_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_110lb_anchor" "cin_110lb_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 (cinematic_object_get_unit "cortana") "110va_torture_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_play_cortana_effect 8 0 0 0)
    (sleep 444)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110va_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 0)
    (!110va_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 8 0 0 (cinematic_object_get_unit "cortana"))
)

(script continuous void 110cf_torture
    (sleep_forever)
    (cinematic_zone_activate 8)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 8))
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110va_sc)
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 8)
)

(script static void !110ga_child_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 9 0) 0 "gravemind_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 9 0) 0)
    (cinematic_object_create_cinematic_anchor "gravemind_anchor" "gravemind_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_print "waiting for event (cinematic_scripting_play_cortana_effect 9 0 0 0) which occurs at frame 0, but shot only has 0 frames")
    (cinematic_scripting_play_cortana_effect 9 0 0 0)
    (cinematic_print "waiting for event (cinematic_scripting_start_dialogue 9 0 0 0 \"none\") which occurs at frame 1, but shot only has 0 frames")
    (sleep 1)
    (cinematic_scripting_start_dialogue 9 0 0 0 none)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110ga_child_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 9 0) 0)
    (!110ga_child_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script continuous void 110ga_child
    (sleep_forever)
    (cinematic_zone_activate 9)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 9))
    (begin
        (set g_gravemind_header true)
        (damage_players "cinematics\cortana_channel\110ga_child\110ga_child")
    )
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110ga_child_sc)
    (begin
        (sleep 465)
        (set g_gravemind_footer true)
    )
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 9)
)

(script static void !110gb_together_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 10 0) 0 "gravemind_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10 0) 0)
    (cinematic_object_create_cinematic_anchor "gravemind_anchor" "gravemind_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_print "waiting for event (cinematic_scripting_play_cortana_effect 10 0 0 0) which occurs at frame 0, but shot only has 0 frames")
    (cinematic_scripting_play_cortana_effect 10 0 0 0)
    (cinematic_print "waiting for event (cinematic_scripting_start_dialogue 10 0 0 0 \"none\") which occurs at frame 1, but shot only has 0 frames")
    (sleep 1)
    (cinematic_scripting_start_dialogue 10 0 0 0 none)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110gb_together_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10 0) 0)
    (!110gb_together_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script continuous void 110gb_together
    (sleep_forever)
    (cinematic_zone_activate 10)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 10))
    (begin
        (set g_gravemind_header true)
        (damage_players "cinematics\cortana_channel\110gb_together\110gb_together")
    )
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110gb_together_sc)
    (begin
        (sleep 440)
        (set g_gravemind_footer true)
    )
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 10)
)

(script static void !110gc_locked_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 11 0) 0 "gravemind_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 11 0) 0)
    (cinematic_object_create_cinematic_anchor "gravemind_anchor" "gravemind_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_print "waiting for event (cinematic_scripting_play_cortana_effect 11 0 0 0) which occurs at frame 0, but shot only has 0 frames")
    (cinematic_scripting_play_cortana_effect 11 0 0 0)
    (cinematic_print "waiting for event (cinematic_scripting_start_dialogue 11 0 0 0 \"none\") which occurs at frame 1, but shot only has 0 frames")
    (sleep 1)
    (cinematic_scripting_start_dialogue 11 0 0 0 none)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110gc_locked_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 11 0) 0)
    (!110gc_locked_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script continuous void 110gc_locked
    (sleep_forever)
    (cinematic_zone_activate 11)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 11))
    (begin
        (set g_gravemind_header true)
        (damage_players "cinematics\cortana_channel\110gc_locked\110gc_locked")
    )
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110gc_locked_sc)
    (begin
        (sleep 440)
        (set g_gravemind_footer true)
    )
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 11)
)

(script static void !110gd_patience_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 0 "gravemind_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 0)
    (cinematic_object_create_cinematic_anchor "gravemind_anchor" "gravemind_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_print "waiting for event (cinematic_scripting_play_cortana_effect 12 0 0 0) which occurs at frame 0, but shot only has 0 frames")
    (cinematic_scripting_play_cortana_effect 12 0 0 0)
    (cinematic_print "waiting for event (cinematic_scripting_start_dialogue 12 0 0 0 \"none\") which occurs at frame 1, but shot only has 0 frames")
    (sleep 1)
    (cinematic_scripting_start_dialogue 12 0 0 0 none)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110gd_patience_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 0)
    (!110gd_patience_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script continuous void 110gd_patience
    (sleep_forever)
    (cinematic_zone_activate 12)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 12))
    (begin
        (set g_gravemind_header true)
        (damage_players "cinematics\cortana_channel\110gd_patience\110gd_patience")
    )
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110gd_patience_sc)
    (begin
        (sleep 440)
        (set g_gravemind_footer true)
    )
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 12)
)

(script static void !110ge_revealed_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 13 0) 0 "gravemind_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13 0) 0)
    (cinematic_object_create_cinematic_anchor "gravemind_anchor" "gravemind_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_print "waiting for event (cinematic_scripting_play_cortana_effect 13 0 0 0) which occurs at frame 0, but shot only has 0 frames")
    (cinematic_scripting_play_cortana_effect 13 0 0 0)
    (cinematic_print "waiting for event (cinematic_scripting_start_dialogue 13 0 0 0 \"none\") which occurs at frame 1, but shot only has 0 frames")
    (sleep 1)
    (cinematic_scripting_start_dialogue 13 0 0 0 none)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110ge_revealed_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13 0) 0)
    (!110ge_revealed_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script continuous void 110ge_revealed
    (sleep_forever)
    (cinematic_zone_activate 13)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 13))
    (begin
        (set g_gravemind_header true)
        (damage_players "cinematics\cortana_channel\110ge_revealed\110ge_revealed")
    )
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110ge_revealed_sc)
    (begin
        (sleep 460)
        (set g_gravemind_footer true)
        (set g_ch_14_cortana_talk true)
    )
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 13)
)

(script static void !110gf_defeat_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 14 0) 0 "gravemind_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 0) 0)
    (cinematic_object_create_cinematic_anchor "gravemind_anchor" "gravemind_anchor")
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_print "waiting for event (cinematic_scripting_play_cortana_effect 14 0 0 0) which occurs at frame 0, but shot only has 0 frames")
    (cinematic_scripting_play_cortana_effect 14 0 0 0)
    (cinematic_print "waiting for event (cinematic_scripting_start_dialogue 14 0 0 0 \"none\") which occurs at frame 1, but shot only has 0 frames")
    (sleep 1)
    (cinematic_scripting_start_dialogue 14 0 0 0 none)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !110gf_defeat_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 0) 0)
    (!110gf_defeat_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script continuous void 110gf_defeat
    (sleep_forever)
    (cinematic_zone_activate 14)
    (sleep 1)
    (cinematic_set (cinematic_tag_reference_get_cinematic 14))
    (set g_gravemind_header true)
    (camera_set_cinematic)
    (camera_set_briefing true)
    (!110gf_defeat_sc)
    (begin
        (sleep 260)
        (set g_gravemind_footer true)
    )
    (cinematic_scripting_destroy_cortana_effect_cinematic)
    (cinematic_zone_deactivate 14)
)

