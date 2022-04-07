; Decompiled with Blamite
; Source file: sc130.hsc
; Start time: 4/7/2022 7:37:01
; Decompilation finished in ~0.0231534s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global short player_00 0)
(global short player_01 1)
(global short player_02 2)
(global short player_03 3)
(global string data_mine_mission_segment "")
(global short s_waypoint_index 0)
(global short s_waypoint_timer (* 30.0 10.0))
(global short g_pda_breadcrumb_fade (* 30.0 45.0))
(global short g_pda_breadcrumb_timer (* 30.0 1.5))
(global sound sfx_a_button "sound\game_sfx\ui\hud_ui\b_button")
(global sound sfx_b_button "sound\game_sfx\ui\hud_ui\a_button")
(global sound sfx_hud_in "sound\game_sfx\ui\hud_ui\hud_in")
(global sound sfx_hud_out "sound\game_sfx\ui\hud_ui\hud_out")
(global sound sfx_objective "sound\game_sfx\ui\hud_ui\mission_objective")
(global short s_sc110_01 0)
(global short s_sc110_02 0)
(global short s_sc110_03 0)
(global short s_sc110_04 0)
(global short s_sc110_05 0)
(global short s_sc110_06 0)
(global short s_sc120_01 0)
(global short s_sc120_02 0)
(global short s_sc120_03 0)
(global short s_sc120_04 0)
(global short s_sc120_05 0)
(global short s_sc120_06 0)
(global short s_sc130_01 0)
(global short s_sc130_02 0)
(global short s_sc130_03 0)
(global short s_sc130_04 0)
(global short s_sc130_05 0)
(global short s_sc130_06 0)
(global short s_sc140_01 0)
(global short s_sc140_02 0)
(global short s_sc140_03 0)
(global short s_sc140_04 0)
(global short s_sc140_05 0)
(global short s_sc140_06 0)
(global short s_sc150_01 0)
(global short s_sc150_02 0)
(global short s_sc150_03 0)
(global short s_sc150_04 0)
(global short s_sc150_05 0)
(global short s_l200_01 0)
(global short k_sur_ai_rand_limit 0)
(global short k_sur_ai_end_limit 0)
(global short k_sur_ai_final_limit 0)
(global short k_sur_squad_per_wave_limit 0)
(global short s_sur_squad_count 0)
(global boolean b_sur_squad_spawn true)
(global short k_sur_rand_wave_count 0)
(global short k_sur_rand_wave_limit 0)
(global boolean b_sur_rand_wave_spawn true)
(global short s_sq_actor_count 0)
(global boolean b_sur_wave_phantom false)
(global short k_sur_wave_per_round_limit 0)
(global short k_sur_round_per_set_limit 0)
(global short k_sur_wave_timer 0)
(global short k_sur_wave_timeout 0)
(global short k_sur_round_timer 0)
(global short k_sur_set_timer 0)
(global short k_sur_bonus_timer 0)
(global boolean b_survival_game_end_condition false)
(global ai ai_sur_wave_spawns none)
(global short s_sur_wave_squad_count 4)
(global ai ai_sur_bonus_wave none)
(global short s_sur_dropship_type 1)
(global short s_sur_dropship_crew_count 2)
(global vehicle v_sur_phantom_01 none)
(global vehicle v_sur_phantom_02 none)
(global vehicle v_sur_phantom_03 none)
(global vehicle v_sur_phantom_04 none)
(global vehicle v_sur_bonus_phantom none)
(global ai ai_sur_phantom_01 none)
(global ai ai_sur_phantom_02 none)
(global ai ai_sur_phantom_03 none)
(global ai ai_sur_phantom_04 none)
(global ai ai_sur_bonus_phantom none)
(global string s_sur_drop_side_01 "dual")
(global string s_sur_drop_side_02 "dual")
(global string s_sur_drop_side_03 "dual")
(global string s_sur_drop_side_04 "dual")
(global string s_sur_drop_side_bonus "dual")
(global boolean b_phantom_spawn true)
(global short b_phantom_spawn_count 0)
(global short k_phantom_spawn_limit 0)
(global boolean b_sur_phantoms_semi_random false)
(global short s_sur_wave_cleanup_threshold 0)
(global boolean b_sur_bonus_round false)
(global boolean b_sur_bonus_round_running false)
(global boolean b_sur_bonus_end false)
(global boolean b_sur_bonus_spawn true)
(global boolean b_sur_bonus_refilling false)
(global boolean b_sur_bonus_phantom_ready false)
(global long l_sur_pre_bonus_points 0)
(global long l_sur_post_bonus_points 0)
(global long k_sur_bonus_points_award 0)
(global short s_sur_bonus_count 0)
(global short k_sur_bonus_squad_limit 6)
(global short k_sur_bonus_limit 17)
(global boolean b_survival_bonus_timer_begin false)
(global short k_survival_bonus_timer (* 30.0 60.0 1.0))
(global boolean b_phantom_move_out false)
(global short s_survival_wave_complete_count 0)
(global short s_phantom_load_count 1)
(global boolean b_phantom_loaded false)
(global boolean b_survival_new_set true)
(global boolean b_survival_new_round true)
(global boolean b_survival_new_wave true)
(global folder folder_survival_scenery "sc_survival")
(global folder folder_survival_crates "cr_survival")
(global folder folder_survival_vehicles "v_survival")
(global folder folder_survival_equipment "eq_survival")
(global folder folder_survival_weapons "wp_survival")
(global boolean b_sur_weapon_drop false)
(global looping_sound m_survival_start "multiplayer\firefight_music\firefight_music01")
(global looping_sound m_new_set "multiplayer\firefight_music\firefight_music01")
(global looping_sound m_initial_wave "multiplayer\firefight_music\firefight_music02")
(global looping_sound m_final_wave "multiplayer\firefight_music\firefight_music20")
(global looping_sound m_pgcr "multiplayer\firefight_music\firefight_music30")
(global short s_music_initial 0)
(global short s_music_final 0)
(global string string_survival_map_name none)
(global long l_player0_score 0)
(global long l_player1_score 0)
(global long l_player2_score 0)
(global long l_player3_score 0)
(global long l_sur_round_timer 0)
(global ai ai_obj_survival none)
(global ai ai_sur_remaining none)
(global boolean g_sc130_music01 false)
(global boolean g_sc130_music02 false)
(global boolean g_sc130_music03 false)
(global boolean g_sc130_music035 false)
(global boolean g_sc130_music036 false)
(global boolean g_sc130_music04 false)
(global boolean g_sc130_music05 false)
(global boolean g_sc130_music06 false)
(global boolean g_sc130_music06_alt false)
(global boolean g_sc130_music07 false)
(global ai brute_01 none)
(global ai brute_02 none)
(global ai brute_03 none)
(global ai cop_tower none)
(global ai cop_elevator none)
(global ai fem_marine none)
(global ai marine_01 none)
(global ai marine_02 none)
(global ai marine_03 none)
(global ai ai_mickey none)
(global ai sergeant none)
(global boolean b_rear_attack true)
(global boolean b_turret_line_played false)
(global boolean b_turret_left_01 true)
(global boolean b_turret_left_02 true)
(global boolean b_turret_left_03 true)
(global boolean b_turret_left_04 true)
(global boolean b_turret_right_01 true)
(global boolean b_turret_right_02 true)
(global boolean b_turret_right_03 true)
(global boolean b_turret_right_04 true)
(global boolean editor false)
(global boolean g_play_cinematics true)
(global boolean g_player_training true)
(global boolean debug true)
(global boolean dialogue true)
(global boolean g_music true)
(global short g_insertion_index 0)
(global short g_bridge_obj_control 0)
(global short g_main_arena_obj_control 0)
(global short g_lobby_obj_control 0)
(global short g_roof_obj_control 0)
(global short g_bridge_allies_advance 0)
(global short g_main_arena_retreat 0)
(global short g_lobby_front 0)
(global short g_lobby_entry_odst 0)
(global short g_charge_reminder 0)
(global short g_bridge_tunnel 0)
(global short g_player_start_pitch -16)
(global boolean g_null false)
(global real g_nav_offset 0.55)
(global vehicle phantom_01 none)
(global boolean g_phantom_02_jackals true)
(global vehicle phantom_02 none)
(global vehicle phantom_03 none)
(global vehicle phantom_04 none)
(global vehicle phantom_05 none)
(global boolean g_lobby_doors_closed false)
(global vehicle phantom_06 none)
(global vehicle phantom_07 none)
(global boolean g_odst_enter_pelican false)
(global vehicle pelican_01 none)
(global boolean g_bridge_garbage_collect false)
(global boolean g_main_arena_garbage_collect false)
(global boolean g_lobby_breached false)
(global boolean g_lobby_front_garbage_collect false)
(global boolean g_cinematic_garbage_collect false)
(global boolean g_lobby_surge false)
(global boolean g_lobby_breach_wave_01 true)
(global boolean g_lobby_breach_wave_02 true)
(global boolean g_lobby_breach_wave_03 true)
(global boolean g_lobby_breach_wave_01_yell true)
(global boolean g_lobby_breach_wave_02_yell true)
(global boolean g_lobby_breach_wave_03_yell true)
(global short s_round -1)
(global boolean g_timer_var false)
(global boolean b_load_in_phantom false)


; SCRIPTS

(script static void f_load_phantom (vehicle phantom, string load_side, ai load_squad_01, ai load_squad_02, ai load_squad_03, ai load_squad_04)
    (ai_place load_squad_01)
    (ai_place load_squad_02)
    (ai_place load_squad_03)
    (ai_place load_squad_04)
    (sleep 1)
    (cond
        ((= load_side "left")
            (begin
                (if debug 
                    (print "load phantom left..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_p_lb)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_p_lf)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_p_ml_f)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_p_ml_b)
            )
        )
        ((= load_side "right")
            (begin
                (if debug 
                    (print "load phantom right..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_p_rb)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_p_rf)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_p_mr_f)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_p_mr_b)
            )
        )
        ((= load_side "dual")
            (begin
                (if debug 
                    (print "load phantom dual..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_p_lf)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_p_rf)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_p_lb)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_p_rb)
            )
        )
        ((= load_side "chute")
            (begin
                (if debug 
                    (print "load phantom chute..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_pc_a)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_pc_b)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_pc_c)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_pc_d)
            )
        )
    )
)

(script static void f_load_phantom_cargo (vehicle phantom, string load_number, ai load_squad_01, ai load_squad_02)
    (cond
        ((= load_number "single")
            (begin
                (ai_place load_squad_01)
                (sleep 1)
                (vehicle_load_magic phantom phantom_lc (ai_vehicle_get_from_squad load_squad_01 0))
            )
        )
        ((= load_number "double")
            (begin
                (ai_place load_squad_01)
                (ai_place load_squad_02)
                (sleep 1)
                (vehicle_load_magic phantom phantom_sc01 (ai_vehicle_get_from_squad load_squad_01 0))
                (vehicle_load_magic phantom phantom_sc02 (ai_vehicle_get_from_squad load_squad_02 0))
            )
        )
    )
)

(script static void f_unload_phantom (vehicle phantom, string drop_side)
    (cond
        ((= drop_side "left")
            (begin
                (f_unload_ph_left phantom)
                (sleep 45)
                (f_unload_ph_mid_left phantom)
                (sleep 75)
            )
        )
        ((= drop_side "right")
            (begin
                (f_unload_ph_right phantom)
                (sleep 45)
                (f_unload_ph_mid_right phantom)
                (sleep 75)
            )
        )
        ((= drop_side "dual")
            (begin
                (f_unload_ph_left phantom)
                (f_unload_ph_right phantom)
                (sleep 75)
            )
        )
        ((= drop_side "chute")
            (begin
                (f_unload_ph_chute phantom)
                (sleep 75)
            )
        )
    )
)

(script static void f_unload_ph_left (vehicle phantom)
    (begin_random
        (begin
            (vehicle_unload phantom phantom_p_lf)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_lb)
            (sleep (random_range 0 10))
        )
    )
)

(script static void f_unload_ph_right (vehicle phantom)
    (begin_random
        (begin
            (vehicle_unload phantom phantom_p_rf)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_rb)
            (sleep (random_range 0 10))
        )
    )
)

(script static void f_unload_ph_mid_left (vehicle phantom)
    (begin_random
        (begin
            (vehicle_unload phantom phantom_p_ml_f)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_ml_b)
            (sleep (random_range 0 10))
        )
    )
)

(script static void f_unload_ph_mid_right (vehicle phantom)
    (begin_random
        (begin
            (vehicle_unload phantom phantom_p_mr_f)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_mr_b)
            (sleep (random_range 0 10))
        )
    )
)

(script static void f_unload_ph_chute (vehicle phantom)
    (object_set_phantom_power phantom true)
    (if (vehicle_test_seat phantom phantom_pc_a) 
        (begin
            (vehicle_unload phantom phantom_pc_a)
            (sleep 120)
        )
    )
    (if (vehicle_test_seat phantom phantom_pc_b) 
        (begin
            (vehicle_unload phantom phantom_pc_b)
            (sleep 120)
        )
    )
    (if (vehicle_test_seat phantom phantom_pc_c) 
        (begin
            (vehicle_unload phantom phantom_pc_c)
            (sleep 120)
        )
    )
    (if (vehicle_test_seat phantom phantom_pc_d) 
        (begin
            (vehicle_unload phantom phantom_pc_d)
            (sleep 120)
        )
    )
    (object_set_phantom_power phantom false)
)

(script static void f_unload_phantom_cargo (vehicle phantom, string load_number)
    (cond
        ((= load_number "single")
            (vehicle_unload phantom phantom_lc)
        )
        ((= load_number "double")
            (begin_random
                (begin
                    (vehicle_unload phantom phantom_sc01)
                    (sleep (random_range 15 30))
                )
                (begin
                    (vehicle_unload phantom phantom_sc02)
                    (sleep (random_range 15 30))
                )
            )
        )
    )
)

(script static unit player0
    (player_get 0)
)

(script static unit player1
    (player_get 1)
)

(script static unit player2
    (player_get 2)
)

(script static unit player3
    (player_get 3)
)

(script static short player_count
    (list_count (players))
)

(script static void print_difficulty
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
    (= (game_difficulty_get_real) legendary)
)

(script static boolean difficulty_heroic
    (= (game_difficulty_get_real) heroic)
)

(script static boolean difficulty_normal
    (<= (game_difficulty_get_real) normal)
)

(script static void replenish_players
    (if debug 
        (print "replenish player health..."))
    (unit_set_current_vitality (player0) 80.0 80.0)
    (unit_set_current_vitality (player1) 80.0 80.0)
    (unit_set_current_vitality (player2) 80.0 80.0)
    (unit_set_current_vitality (player3) 80.0 80.0)
)

(script static boolean coop_players_2
    (>= (game_coop_player_count) 2)
)

(script static boolean coop_players_3
    (>= (game_coop_player_count) 3)
)

(script static boolean coop_players_4
    (>= (game_coop_player_count) 4)
)

(script dormant void player0_award_tourist
    (f_award_tourist player_00)
)

(script dormant void player1_award_tourist
    (f_award_tourist player_01)
)

(script dormant void player2_award_tourist
    (f_award_tourist player_02)
)

(script dormant void player3_award_tourist
    (f_award_tourist player_03)
)

(script static void f_award_tourist (short player_short)
    (sleep_until (pda_is_active_deterministic (player_get player_short)) 45)
    (sleep 30)
    (achievement_grant_to_player (player_get player_short) "_achievement_tourist")
)

(script static void f_sleep_until_activate_waypoint (short player_short)
    (sleep 3)
    (unit_action_test_reset (player_get player_short))
    (sleep 3)
    (sleep_until 
        (and
            (> (object_get_health (player_get player_short)) 0.0)
            (unit_action_test_waypoint_activate (player_get player_short))
        ) 
    1)
    (f_sfx_a_button player_short)
    (sleep 3)
)

(script static void f_sleep_deactivate_waypoint (short player_short)
    (sleep 3)
    (unit_action_test_reset (player_get player_short))
    (sleep 3)
    (sleep_until 
        (or
            (<= (unit_get_health (player_get player_short)) 0.0)
            (unit_action_test_waypoint_activate (player_get player_short))
        ) 
    1 s_waypoint_timer)
    (if (unit_action_test_waypoint_activate (player_get player_short)) 
        (begin
            (f_sfx_a_button player_short)
        )
    )
    (sleep 3)
)

(script static void f_waypoint_message (short player_short, cutscene_flag waypoint_01, cutscene_title display_title, cutscene_title blank_title)
    (unit_action_test_reset (player_get player_short))
    (if (not (pda_is_active_deterministic (player_get player_short))) 
        (begin
            (chud_show_cinematic_title (player_get player_short) display_title)
            (sleep 15)
            (f_sleep_deactivate_waypoint player_short)
            (chud_show_cinematic_title (player_get player_short) blank_title)
        ) (sleep 5))
)

(script static void f_waypoint_activate_1 (short player_short, cutscene_flag waypoint_01)
    (unit_action_test_reset (player_get player_short))
    (if (not (pda_is_active_deterministic (player_get player_short))) 
        (chud_show_navpoint (player_get player_short) waypoint_01 0.55 true))
    (sleep 15)
    (f_sleep_deactivate_waypoint player_short)
    (chud_show_navpoint (player_get player_short) waypoint_01 0.0 false)
)

(script static void f_waypoint_activate_2 (short player_short, cutscene_flag waypoint_01, cutscene_flag waypoint_02)
    (unit_action_test_reset (player_get player_short))
    (if (not (pda_is_active_deterministic (player_get player_short))) 
        (begin
            (chud_show_navpoint (player_get player_short) waypoint_01 0.55 true)
            (chud_show_navpoint (player_get player_short) waypoint_02 0.55 true)
        )
    )
    (sleep 15)
    (f_sleep_deactivate_waypoint player_short)
    (chud_show_navpoint (player_get player_short) waypoint_01 0.0 false)
    (chud_show_navpoint (player_get player_short) waypoint_02 0.0 false)
)

(script static void f_waypoint_activate_3 (short player_short, cutscene_flag waypoint_01, cutscene_flag waypoint_02, cutscene_flag waypoint_03)
    (unit_action_test_reset (player_get player_short))
    (if (not (pda_is_active_deterministic (player_get player_short))) 
        (begin
            (chud_show_navpoint (player_get player_short) waypoint_01 0.55 true)
            (chud_show_navpoint (player_get player_short) waypoint_02 0.55 true)
            (chud_show_navpoint (player_get player_short) waypoint_03 0.55 true)
        )
    )
    (sleep 15)
    (f_sleep_deactivate_waypoint player_short)
    (chud_show_navpoint (player_get player_short) waypoint_01 0.0 false)
    (chud_show_navpoint (player_get player_short) waypoint_02 0.0 false)
    (chud_show_navpoint (player_get player_short) waypoint_03 0.0 false)
)

(script static void f_waypoint_activate_4 (short player_short, cutscene_flag waypoint_01, cutscene_flag waypoint_02, cutscene_flag waypoint_03, cutscene_flag waypoint_04)
    (unit_action_test_reset (player_get player_short))
    (if (not (pda_is_active_deterministic (player_get player_short))) 
        (begin
            (chud_show_navpoint (player_get player_short) waypoint_01 0.55 true)
            (chud_show_navpoint (player_get player_short) waypoint_02 0.55 true)
            (chud_show_navpoint (player_get player_short) waypoint_03 0.55 true)
            (chud_show_navpoint (player_get player_short) waypoint_04 0.55 true)
        )
    )
    (sleep 15)
    (f_sleep_deactivate_waypoint player_short)
    (chud_show_navpoint (player_get player_short) waypoint_01 0.0 false)
    (chud_show_navpoint (player_get player_short) waypoint_02 0.0 false)
    (chud_show_navpoint (player_get player_short) waypoint_03 0.0 false)
    (chud_show_navpoint (player_get player_short) waypoint_04 0.0 false)
)

(script static void f_coop_resume_unlocked (cutscene_title resume_title, short insertion_point)
    (if (not (is_ace_build)) 
        (begin
            (if (game_is_cooperative) 
                (begin
                    (sound_impulse_start sfx_hud_in none 1.0)
                    (cinematic_set_chud_objective resume_title)
                    (game_insertion_point_unlock insertion_point)
                )
            )
        )
    )
)

(script static void f_new_intel (cutscene_title new_intel, cutscene_title intel_chapter, long objective_number, cutscene_flag minimap_flag)
    (sound_impulse_start sfx_objective none 1.0)
    (chud_display_pda_objectives_message "pda_activate_intel" 0)
    (cinematic_set_chud_objective new_intel)
    (objectives_show objective_number)
    (sleep 60)
    (sound_impulse_start sfx_hud_in none 1.0)
    (cinematic_set_chud_objective intel_chapter)
    (sleep (* 30.0 3.0))
    (sound_impulse_start sfx_hud_out none 1.0)
    (chud_display_pda_minimap_message "" minimap_flag)
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

(script static void cinematic_skip_stop_terminal
    (cinematic_skip_stop_internal)
    (if (not (game_reverted)) 
        (begin
            (game_revert)
            (if debug 
                (print "sleeping forever..."))
            (sleep_forever)
        )
    )
)

(script static void cinematic_snap_to_black
    (fade_out 0.0 0.0 0.0 0)
    (cinematic_preparation)
)

(script static void cinematic_snap_to_white
    (fade_out 1.0 1.0 1.0 0)
    (cinematic_preparation)
)

(script static void cinematic_preparation
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (player_control_fade_out_all_input 0.0)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (unit_enable_vision_mode (player0) false)
    (unit_enable_vision_mode (player1) false)
    (unit_enable_vision_mode (player2) false)
    (unit_enable_vision_mode (player3) false)
    (player_close_pda (player0))
    (player_close_pda (player1))
    (player_close_pda (player2))
    (player_close_pda (player3))
    (replenish_players)
    (pda_stop_arg_sound (player0))
    (pda_stop_arg_sound (player1))
    (pda_stop_arg_sound (player2))
    (pda_stop_arg_sound (player3))
    (chud_cinematic_fade 0.0 0.0)
    (chud_show_messages false)
    (campaign_metagame_time_pause true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_start)
    (camera_control true)
)

(script static void cinematic_snap_from_black
    (cinematic_snap_from_pre)
    (sleep 5)
    (fade_in 0.0 0.0 0.0 5)
    (cinematic_snap_from_post)
)

(script static void cinematic_snap_from_white
    (cinematic_snap_from_pre)
    (sleep 5)
    (fade_in 1.0 1.0 1.0 5)
    (cinematic_snap_from_post)
)

(script static void cinematic_snap_from_pre
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate false)
    (cinematic_hud_off)
    (sleep 1)
    (chud_cinematic_fade 1.0 0.0)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
)

(script static void cinematic_snap_from_post
    (unit_enable_vision_mode (player0) true)
    (unit_enable_vision_mode (player1) true)
    (unit_enable_vision_mode (player2) true)
    (unit_enable_vision_mode (player3) true)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_disable_movement false)
    (chud_show_messages true)
    (if (not (campaign_survival_enabled)) 
        (game_save))
)

(script static void cinematic_fade_to_black
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (player_control_fade_out_all_input 1.0)
    (campaign_metagame_time_pause true)
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
    (unit_enable_vision_mode (player0) false)
    (unit_enable_vision_mode (player1) false)
    (unit_enable_vision_mode (player2) false)
    (unit_enable_vision_mode (player3) false)
    (player_close_pda (player0))
    (player_close_pda (player1))
    (player_close_pda (player2))
    (player_close_pda (player3))
    (cinematic_start)
    (camera_control true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
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
    (sleep 1)
    (fade_in 0.0 0.0 0.0 15)
    (sleep 15)
    (cinematic_show_letterbox false)
    (sleep 15)
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
)

(script static void cinematic_hud_on
    (chud_cinematic_fade 1.0 0.0)
    (chud_show_compass false)
    (chud_show_crosshair false)
)

(script static void cinematic_hud_off
    (chud_cinematic_fade 0.0 0.0)
    (chud_show_compass true)
    (chud_show_crosshair true)
)

(script dormant void pda_breadcrumbs
    (pda_set_footprint_dead_zone 5.0)
    (sleep_until 
        (begin
            (player_add_footprint (player0) g_pda_breadcrumb_fade)
            (player_add_footprint (player1) g_pda_breadcrumb_fade)
            (player_add_footprint (player2) g_pda_breadcrumb_fade)
            (player_add_footprint (player3) g_pda_breadcrumb_fade)
            false
        ) 
    g_pda_breadcrumb_timer)
)

(script static void end_mission
    (if global_playtest_mode 
        (begin
            (data_mine_set_mission_segment "questionaire")
            (cinematic_fade_to_gameplay)
            (sleep 1)
            (print "end mission!")
            (sleep 15)
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

(script static void f_end_scene (script cinematic_outro, zone_set cinematic_zone_set, string_id scene_boolean, string_id scene_name, string snap_color)
    (cond
        ((= snap_color "black")
            (cinematic_snap_to_black)
        )
        ((= snap_color "white")
            (cinematic_snap_to_white)
        )
    )
    (sleep 1)
    (game_award_level_complete_achievements)
    (game_level_prepare scene_name)
    (ai_erase_all)
    (switch_zone_set cinematic_zone_set)
    (sound_suppress_ambience_update_on_revert)
    (sleep 1)
    (if (= g_play_cinematics true) 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (if debug 
                        (print "play outro cinematic..."))
                    (cinematic_show_letterbox true)
                    (sleep 30)
                    (evaluate cinematic_outro)
                    (sound_class_set_gain "" 0.0 0)
                )
            )
            (cinematic_skip_stop_internal)
        )
    )
    (sound_class_set_gain "" 0.0 0)
    (sound_class_set_gain "ui" 1.0 0)
    (cinematic_snap_to_black)
    (gp_boolean_set scene_boolean true)
    (gp_boolean_set "gp_l100_complete" true)
    (if debug 
        (print "switch to scene..."))
    (game_level_advance scene_name)
)

(script startup void beginning_mission_segment
    (data_mine_set_mission_segment "mission_start")
)

(script static void f_sfx_a_button (short player_short)
    (sound_impulse_start sfx_a_button (player_get player_short) 1.0)
)

(script static void f_sfx_b_button (short player_short)
    (sound_impulse_start sfx_b_button (player_get player_short) 1.0)
)

(script static void f_sfx_hud_in (short player_short)
    (sound_impulse_start sfx_hud_in (player_get player_short) 1.0)
)

(script static void f_sfx_hud_out (short player_short)
    (sound_impulse_start sfx_hud_out (player_get player_short) 1.0)
)

(script static void f_display_message (short player_short, cutscene_title display_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
)

(script static void f_display_message_accept (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (unit_confirm_message (player_get player_short))
    (sleep_until (unit_action_test_accept (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_cancel (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (unit_confirm_cancel_message (player_get player_short))
    (sleep_until (unit_action_test_cancel (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_confirm (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (unit_confirm_message (player_get player_short))
    (unit_confirm_cancel_message (player_get player_short))
    (sleep_until 
        (or
            (unit_action_test_accept (player_get player_short))
            (unit_action_test_cancel (player_get player_short))
        ) 
    1)
    (cond
        ((unit_action_test_accept (player_get player_short))
            (f_sfx_a_button player_short)
        )
        ((unit_action_test_cancel (player_get player_short))
            (f_sfx_b_button player_short)
        )
    )
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_repeat_training (short player_short, cutscene_title display_title, cutscene_title blank_title, trigger_volume volume_01, trigger_volume volume_02)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (unit_confirm_retrain_message (player_get player_short))
    (unit_confirm_cancel_message (player_get player_short))
    (sleep_until 
        (or
            (unit_action_test_retrain (player_get player_short))
            (unit_action_test_cancel (player_get player_short))
            (and
                (not (volume_test_object volume_01 (player_get player_short)))
                (not (volume_test_object volume_02 (player_get player_short)))
            )
        ) 
    1)
    (if 
        (or
            (volume_test_object volume_01 (player_get player_short))
            (volume_test_object volume_02 (player_get player_short))
        ) 
            (begin
                (cond
                    ((unit_action_test_retrain (player_get player_short))
                        (f_sfx_a_button player_short)
                    )
                    ((unit_action_test_cancel (player_get player_short))
                        (f_sfx_b_button player_short)
                    )
                )
                (chud_show_cinematic_title (player_get player_short) blank_title)
                (sleep 5)
            )
    )
)

(script static void f_display_message_vision (short player_short, cutscene_title display_title, cutscene_title blank_title, trigger_volume volume_01, trigger_volume volume_02)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until 
        (or
            (unit_action_test_vision_trigger (player_get player_short))
            (and
                (not (volume_test_object volume_01 (player_get player_short)))
                (not (volume_test_object volume_02 (player_get player_short)))
            )
        ) 
    1)
    (if 
        (or
            (volume_test_object volume_01 (player_get player_short))
            (volume_test_object volume_02 (player_get player_short))
        ) 
            (begin
                (f_sfx_a_button player_short)
                (chud_show_cinematic_title (player_get player_short) blank_title)
                (sleep 5)
            )
    )
)

(script static void f_display_message_accept_volume (short player_short, cutscene_title display_title, cutscene_title blank_title, trigger_volume volume_01, trigger_volume volume_02)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (unit_confirm_message (player_get player_short))
    (sleep_until 
        (or
            (unit_action_test_accept (player_get player_short))
            (and
                (not (volume_test_object volume_01 (player_get player_short)))
                (not (volume_test_object volume_02 (player_get player_short)))
            )
        ) 
    1)
    (if 
        (or
            (volume_test_object volume_01 (player_get player_short))
            (volume_test_object volume_02 (player_get player_short))
        ) 
            (begin
                (f_sfx_a_button player_short)
                (chud_show_cinematic_title (player_get player_short) blank_title)
                (sleep 5)
            )
    )
)

(script static void f_display_message_a (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_accept (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_b (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_cancel (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_x (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_x (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_y (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_y (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_back (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_back (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_back_b (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until 
        (or
            (unit_action_test_back (player_get player_short))
            (unit_action_test_cancel (player_get player_short))
        ) 
    1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_left_bumper (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_left_shoulder (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_right_bumper (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_right_shoulder (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_bumpers (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until 
        (or
            (unit_action_test_left_shoulder (player_get player_short))
            (unit_action_test_right_shoulder (player_get player_short))
        ) 
    1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_rotate_gren (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_rotate_grenades (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_action (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_action (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_dpad_up (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_dpad_up (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_dpad_up_down (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until 
        (or
            (unit_action_test_dpad_up (player_get player_short))
            (unit_action_test_dpad_down (player_get player_short))
        ) 
    1)
    (f_sfx_a_button player_short)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_move_stick (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until (unit_action_test_move_relative_all_directions (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (sleep 150)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static void f_display_message_look_stick (short player_short, cutscene_title display_title, cutscene_title blank_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until 
        (or
            (unit_action_test_look_relative_up (player_get player_short))
            (unit_action_test_look_relative_down (player_get player_short))
            (unit_action_test_look_relative_left (player_get player_short))
            (unit_action_test_look_relative_right (player_get player_short))
        ) 
    1)
    (f_sfx_a_button player_short)
    (sleep 150)
    (chud_show_cinematic_title (player_get player_short) blank_title)
    (sleep 5)
)

(script static short h100_arg_completed_short
    (h100_reset_arg_shorts)
    (sleep 1)
    (h100_set_arg_shorts)
    (sleep 1)
    (+ s_sc110_01 s_sc110_02 s_sc110_03 s_sc110_04 s_sc110_05 s_sc110_06 s_sc120_01 s_sc120_02 s_sc120_03 s_sc120_04 s_sc120_05 s_sc120_06 s_sc130_01 s_sc130_02 s_sc130_03 s_sc130_04 s_sc130_05 s_sc130_06 s_sc140_01 s_sc140_02 s_sc140_03 s_sc140_04 s_sc140_05 s_sc140_06 s_sc150_01 s_sc150_02 s_sc150_03 s_sc150_04 s_sc150_05 s_l200_01)
)

(script static void h100_set_arg_shorts
    (if (gp_boolean_get "gp_sc110_terminal_01_complete") 
        (set s_sc110_01 1))
    (if (gp_boolean_get "gp_sc110_terminal_02_complete") 
        (set s_sc110_02 1))
    (if (gp_boolean_get "gp_sc110_terminal_03_complete") 
        (set s_sc110_03 1))
    (if (gp_boolean_get "gp_sc110_terminal_04_complete") 
        (set s_sc110_04 1))
    (if (gp_boolean_get "gp_sc110_terminal_05_complete") 
        (set s_sc110_05 1))
    (if (gp_boolean_get "gp_sc110_terminal_06_complete") 
        (set s_sc110_06 1))
    (if (gp_boolean_get "gp_sc120_terminal_01_complete") 
        (set s_sc120_01 1))
    (if (gp_boolean_get "gp_sc120_terminal_02_complete") 
        (set s_sc120_02 1))
    (if (gp_boolean_get "gp_sc120_terminal_03_complete") 
        (set s_sc120_03 1))
    (if (gp_boolean_get "gp_sc120_terminal_04_complete") 
        (set s_sc120_04 1))
    (if (gp_boolean_get "gp_sc120_terminal_05_complete") 
        (set s_sc120_05 1))
    (if (gp_boolean_get "gp_sc120_terminal_06_complete") 
        (set s_sc120_06 1))
    (if (gp_boolean_get "gp_sc130_terminal_01_complete") 
        (set s_sc130_01 1))
    (if (gp_boolean_get "gp_sc130_terminal_02_complete") 
        (set s_sc130_02 1))
    (if (gp_boolean_get "gp_sc130_terminal_03_complete") 
        (set s_sc130_03 1))
    (if (gp_boolean_get "gp_sc130_terminal_04_complete") 
        (set s_sc130_04 1))
    (if (gp_boolean_get "gp_sc130_terminal_05_complete") 
        (set s_sc130_05 1))
    (if (gp_boolean_get "gp_sc130_terminal_06_complete") 
        (set s_sc130_06 1))
    (if (gp_boolean_get "gp_sc140_terminal_01_complete") 
        (set s_sc140_01 1))
    (if (gp_boolean_get "gp_sc140_terminal_02_complete") 
        (set s_sc140_02 1))
    (if (gp_boolean_get "gp_sc140_terminal_03_complete") 
        (set s_sc140_03 1))
    (if (gp_boolean_get "gp_sc140_terminal_04_complete") 
        (set s_sc140_04 1))
    (if (gp_boolean_get "gp_sc140_terminal_05_complete") 
        (set s_sc140_05 1))
    (if (gp_boolean_get "gp_sc140_terminal_06_complete") 
        (set s_sc140_06 1))
    (if (gp_boolean_get "gp_sc150_terminal_01_complete") 
        (set s_sc150_01 1))
    (if (gp_boolean_get "gp_sc150_terminal_02_complete") 
        (set s_sc150_02 1))
    (if (gp_boolean_get "gp_sc150_terminal_03_complete") 
        (set s_sc150_03 1))
    (if (gp_boolean_get "gp_sc150_terminal_04_complete") 
        (set s_sc150_04 1))
    (if (gp_boolean_get "gp_sc150_terminal_05_complete") 
        (set s_sc150_05 1))
    (if (gp_boolean_get "gp_l200_terminal_01_complete") 
        (set s_l200_01 1))
)

(script static void h100_reset_arg_shorts
    (set s_sc110_01 0)
    (set s_sc110_02 0)
    (set s_sc110_03 0)
    (set s_sc110_04 0)
    (set s_sc110_05 0)
    (set s_sc110_06 0)
    (set s_sc120_01 0)
    (set s_sc120_02 0)
    (set s_sc120_03 0)
    (set s_sc120_04 0)
    (set s_sc120_05 0)
    (set s_sc120_06 0)
    (set s_sc130_01 0)
    (set s_sc130_02 0)
    (set s_sc130_03 0)
    (set s_sc130_04 0)
    (set s_sc130_05 0)
    (set s_sc130_06 0)
    (set s_sc140_01 0)
    (set s_sc140_02 0)
    (set s_sc140_03 0)
    (set s_sc140_04 0)
    (set s_sc140_05 0)
    (set s_sc140_06 0)
    (set s_sc150_01 0)
    (set s_sc150_02 0)
    (set s_sc150_03 0)
    (set s_sc150_04 0)
    (set s_sc150_05 0)
    (set s_l200_01 0)
)

(script static boolean survival_you_are_a_man
    true
)

(script static void survival_squad_limit
    (set k_sur_squad_per_wave_limit 6)
    (set k_phantom_spawn_limit 2)
)

(script static void survival_wave_limit
    (survival_mode_set_waves_per_round 5)
    (set k_sur_wave_per_round_limit 5)
)

(script static void survival_round_limit
    (survival_mode_set_rounds_per_set 3)
    (set k_sur_round_per_set_limit 3)
)

(script static void survival_ai_limit
    (cond
        ((difficulty_legendary)
            (begin
                (set k_sur_ai_rand_limit 6)
                (set k_sur_ai_final_limit 4)
                (set k_sur_ai_end_limit 0)
            )
        )
        ((difficulty_heroic)
            (begin
                (set k_sur_ai_rand_limit 4)
                (set k_sur_ai_final_limit 3)
                (set k_sur_ai_end_limit 0)
            )
        )
        (true
            (begin
                (set k_sur_ai_rand_limit 4)
                (set k_sur_ai_final_limit 2)
                (set k_sur_ai_end_limit 0)
            )
        )
    )
)

(script static void survival_ai_timeout
    (cond
        ((difficulty_legendary)
            (set k_sur_wave_timeout (* 30.0 300.0))
        )
        ((difficulty_heroic)
            (set k_sur_wave_timeout (* 30.0 180.0))
        )
        (true
            (set k_sur_wave_timeout (* 30.0 120.0))
        )
    )
)

(script static void survival_wave_timer
    (cond
        ((difficulty_legendary)
            (set k_sur_wave_timer (* 30.0 3.0))
        )
        ((difficulty_heroic)
            (set k_sur_wave_timer (* 30.0 6.0))
        )
        (true
            (set k_sur_wave_timer (* 30.0 9.0))
        )
    )
)

(script static void survival_round_timer
    (cond
        ((difficulty_legendary)
            (set k_sur_round_timer (* 30.0 5.0))
        )
        ((difficulty_heroic)
            (set k_sur_round_timer (* 30.0 10.0))
        )
        (true
            (set k_sur_round_timer (* 30.0 15.0))
        )
    )
)

(script static void survival_set_timer
    (cond
        ((difficulty_legendary)
            (set k_sur_set_timer (* 30.0 10.0))
        )
        ((difficulty_heroic)
            (set k_sur_set_timer (* 30.0 20.0))
        )
        (true
            (set k_sur_set_timer (* 30.0 30.0))
        )
    )
)

(script static void survival_bonus_wait_timer
    (cond
        ((difficulty_legendary)
            (set k_sur_bonus_timer (* 30.0 5.0))
        )
        ((difficulty_heroic)
            (set k_sur_bonus_timer (* 30.0 10.0))
        )
        (true
            (set k_sur_bonus_timer (* 30.0 15.0))
        )
    )
)

(script static void survival_lives
    (if (< (survival_mode_get_shared_team_life_count) 0) 
        (survival_mode_lives_set -1) (survival_mode_lives_set (survival_mode_get_shared_team_life_count)))
)

(script static void survival_add_lives
    (survival_mode_award_hero_medal)
    (sleep 1)
    (survival_mode_respawn_dead_players)
    (sleep 1)
    (if 
        (and
            (>= (survival_mode_lives_get) 0)
            (< (survival_mode_lives_get) (survival_mode_max_lives))
        ) 
            (begin
                (survival_mode_add_human_lives (game_coop_player_count))
                (survival_mode_event_new "survival_awarded_lives")
            )
    )
)

(script static void survival_mode_add_human_lives (short lives)
    (if (not b_survival_game_end_condition) 
        (if (> (survival_mode_max_lives) 0) 
            (survival_mode_lives_set (max (min (survival_mode_max_lives) (+ (survival_mode_lives_get) lives)) (survival_mode_lives_get))))
    )
)

(script static void survival_award_bonus_lives
    (if 
        (and
            (>= (survival_mode_lives_get) 0)
            (< (survival_mode_lives_get) (survival_mode_max_lives))
        ) 
            (begin
                (survival_mode_event_new "survival_bonus_lives_awarded")
                (survival_mode_add_human_lives (game_coop_player_count))
            )
    )
)

(script static void survival_set_multiplier
    (cond
        ((>= (survival_mode_set_get) 8)
            (survival_mode_set_multiplier_set 5.0)
        )
        ((>= (survival_mode_set_get) 7)
            (survival_mode_set_multiplier_set 4.5)
        )
        ((>= (survival_mode_set_get) 6)
            (survival_mode_set_multiplier_set 4.0)
        )
        ((>= (survival_mode_set_get) 5)
            (survival_mode_set_multiplier_set 3.5)
        )
        ((>= (survival_mode_set_get) 4)
            (survival_mode_set_multiplier_set 3.0)
        )
        ((>= (survival_mode_set_get) 3)
            (survival_mode_set_multiplier_set 2.5)
        )
        ((>= (survival_mode_set_get) 2)
            (survival_mode_set_multiplier_set 2.0)
        )
        ((>= (survival_mode_set_get) 1)
            (survival_mode_set_multiplier_set 1.5)
        )
        ((>= (survival_mode_set_get) 0)
            (survival_mode_set_multiplier_set 1.0)
        )
    )
)

(script stub void survival_scenario_weapon_drop
    (if debug 
        (print "**scenario weapon drop**"))
)

(script stub void survival_scenario_new_wave
    (if debug 
        (print "**scenario new wave**"))
)

(script stub void survival_vehicle_cleanup
    (if debug 
        (print "**vehicle cleanup**"))
)

(script static boolean wave_dropship_enabled
    (if 
        (or
            (and
                (= (survival_mode_current_wave_is_bonus) true)
                (!= ai_sur_bonus_phantom none)
            )
            (and
                (= (survival_mode_current_wave_is_bonus) false)
                (!= s_sur_dropship_type 0)
            )
        ) 
            (survival_mode_current_wave_uses_dropship) false)
)

(script static void f_survival_disable_pda (short player_short)
    (pda_input_enable (player_get player_short) true)
    (sleep 1)
    (pda_input_enable_a (player_get player_short) false)
    (pda_input_enable_x (player_get player_short) false)
    (pda_input_enable_y (player_get player_short) false)
    (pda_input_enable_dpad (player_get player_short) false)
)

(script dormant void survival_mode
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (sound_looping_start m_survival_start none 1.0)
    (f_survival_disable_pda player_00)
    (f_survival_disable_pda player_01)
    (f_survival_disable_pda player_02)
    (f_survival_disable_pda player_03)
    (player0_set_pitch -5.0 0)
    (player1_set_pitch -5.0 0)
    (player2_set_pitch -5.0 0)
    (player3_set_pitch -5.0 0)
    (survival_squad_limit)
    (survival_wave_limit)
    (survival_round_limit)
    (survival_ai_limit)
    (survival_wave_timer)
    (survival_round_timer)
    (survival_set_timer)
    (survival_bonus_wait_timer)
    (survival_ai_timeout)
    (survival_lives)
    (object_create_folder_anew folder_survival_scenery)
    (object_create_folder_anew folder_survival_crates)
    (object_create_folder_anew folder_survival_vehicles)
    (object_create_folder_anew folder_survival_equipment)
    (sleep 1)
    (sleep (* 30.0 3.0))
    (if (> (player_count) 0) 
        (cinematic_snap_from_black))
    (sleep (* 30.0 2.0))
    (survival_mode_event_new "survival_welcome")
    (sleep (* 30.0 2.0))
    (wake survival_lives_announcement)
    (wake survival_award_achievement)
    (wake survival_bonus_round_end)
    (wake survival_end_game)
    (wake survival_bonus_round_phantom)
    (sleep (* 30.0 3.0))
    (sound_looping_stop m_survival_start)
    (sleep_until 
        (begin
            (if debug 
                (print "beginning new set"))
            (survival_mode_begin_new_set)
            (sleep 1)
            (survival_begin_announcer)
            (survival_set_multiplier)
            (if (survival_mode_get_debug_bonus_round) 
                (survival_bonus_wave_test) (survival_wave_loop))
            (survival_respawn_weapons)
            (replenish_players)
            (set b_survival_new_set true)
            (sleep k_sur_set_timer)
            false
        ) 
    1)
)

(script static void survival_wave_loop
    (if debug 
        (print "resetting wave variables..."))
    (set b_sur_rand_wave_spawn true)
    (set k_sur_rand_wave_count 0)
    (survival_like_marty_start)
    (sleep_until 
        (begin
            (survival_mode_begin_new_wave)
            (if (survival_mode_current_wave_is_initial) 
                (begin
                    (surival_set_music)
                    (survival_begin_announcer)
                    (sleep 1)
                    (if (> (survival_mode_set_get) 1) 
                        (survival_respawn_crates))
                )
            )
            (survival_wave_spawn)
            (set s_survival_wave_complete_count (+ s_survival_wave_complete_count 1.0))
            (if 
                (and
                    (> (survival_mode_get_set_count) 0)
                    (>= s_survival_wave_complete_count (survival_mode_get_set_count))
                ) 
                    (begin
                        (sleep_forever)
                    )
            )
            (if (survival_mode_current_wave_is_initial) 
                (begin
                    (print "completed an initial wave")
                )
            )
            (if (survival_mode_current_wave_is_boss) 
                (begin
                    (set b_survival_new_round true)
                    (survival_vehicle_cleanup)
                    (survival_add_lives)
                    (replenish_players)
                    (if (< (survival_mode_round_get) 2) 
                        (begin
                            (survival_respawn_weapons)
                            (sleep k_sur_round_timer)
                        )
                    )
                )
            )
            (and
                (>= (survival_mode_round_get) 2)
                (>= (survival_mode_wave_get) 4)
            )
        ) 
    1)
    (sleep k_sur_bonus_timer)
    (survival_bonus_round)
    (if 
        (and
            (> (survival_mode_get_set_count) 0)
            (>= s_survival_wave_complete_count (survival_mode_get_set_count))
        ) 
            (begin
                (sleep_forever)
            )
    )
    (survival_add_lives)
)

(script static void survival_bonus_wave_test
    (print "survival_bonus_wave_test")
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (survival_mode_begin_new_wave)
    (sleep 1)
    (set s_survival_wave_complete_count (+ s_survival_wave_complete_count 15.0))
    (survival_bonus_round)
)

(script static void survival_wave_spawn
    (if debug 
        (print "spawn wave..."))
    (survival_scenario_new_wave)
    (survival_mode_wave_music_start)
    (add_recycling_volume "tv_sur_garbage_all" 30 10)
    (survival_begin_announcer)
    (sleep 5)
    (ai_reset_objective ai_obj_survival)
    (if (wave_dropship_enabled) 
        (survival_phantom_spawner))
    (if (wave_dropship_enabled) 
        (ai_place_wave_in_limbo (survival_mode_get_wave_squad) ai_sur_wave_spawns s_sur_wave_squad_count) (ai_place_wave (survival_mode_get_wave_squad) ai_sur_wave_spawns s_sur_wave_squad_count))
    (sleep 1)
    (set s_sur_wave_cleanup_threshold 7)
    (if (<= (ai_nonswarm_count ai_sur_wave_spawns) s_sur_wave_cleanup_threshold) 
        (set s_sur_wave_cleanup_threshold (- (ai_nonswarm_count ai_sur_wave_spawns) 2.0)))
    (if (wave_dropship_enabled) 
        (survival_dropship_loader))
    (set b_phantom_move_out true)
    (sleep 30)
    (survival_wave_end_conditions)
    (ai_migrate_persistent "gr_survival_all" ai_sur_remaining)
    (survival_end_announcer)
    (survival_mode_end_wave)
    (set b_survival_new_wave true)
    (set b_sur_wave_phantom false)
    (set b_phantom_move_out false)
    (set s_phantom_load_count 1)
    (if 
        (and
            (< (survival_mode_wave_get) k_sur_wave_per_round_limit)
            (< s_survival_wave_complete_count (- (survival_mode_get_set_count) 1.0))
        ) 
            (sleep k_sur_wave_timer))
    (survival_mode_wave_music_stop)
)

(script static short survival_wave_living_count
    (+ (ai_nonswarm_count "gr_survival_all") (ai_nonswarm_count "gr_survival_remaining") (max 0.0 (- (ai_living_count ai_sur_phantom_01) s_sur_dropship_crew_count)) (max 0.0 (- (ai_living_count ai_sur_phantom_02) s_sur_dropship_crew_count)) (max 0.0 (- (ai_living_count ai_sur_phantom_03) s_sur_dropship_crew_count)) (max 0.0 (- (ai_living_count ai_sur_phantom_04) s_sur_dropship_crew_count)))
)

(script static void survival_wave_end_conditions
    (sleep_until (< (survival_wave_living_count) s_sur_wave_cleanup_threshold) 1 k_sur_wave_timeout)
    (print "**starting end-of-wave cleanup**")
    (survival_kill_volumes_on)
    (ai_survival_cleanup "gr_survival_all" true true)
    (ai_survival_cleanup "gr_survival_remaining" true true)
    (ai_survival_cleanup "gr_survival_extras" true true)
    (cond
        ((= (survival_mode_wave_get) (- k_sur_wave_per_round_limit 2.0))
            (begin
                (sleep_until (<= (survival_wave_living_count) k_sur_ai_final_limit))
            )
        )
        ((or
            (>= (survival_mode_wave_get) (- k_sur_wave_per_round_limit 1.0))
            (and
                (> (survival_mode_get_set_count) 0)
                (>= s_survival_wave_complete_count (- (survival_mode_get_set_count) 1.0))
            )
        )
            (begin
                (sleep_until (<= (survival_wave_living_count) 5) 1)
                (if 
                    (and
                        (<= (survival_wave_living_count) 5)
                        (> (survival_wave_living_count) 2)
                    ) 
                        (begin
                            (survival_mode_event_new "survival_5_ai_remaining")
                        )
                )
                (sound_looping_set_alternate m_final_wave true)
                (sleep_until (<= (survival_wave_living_count) 2) 1)
                (if (= (survival_wave_living_count) 2) 
                    (begin
                        (survival_mode_event_new "survival_2_ai_remaining")
                    )
                )
                (sleep_until (<= (survival_wave_living_count) 1) 1)
                (if (= (survival_wave_living_count) 1) 
                    (begin
                        (survival_mode_event_new "survival_1_ai_remaining")
                    )
                )
                (sleep_until (<= (survival_wave_living_count) 0))
            )
        )
        (true
            (begin
                (sleep_until (<= (survival_wave_living_count) k_sur_ai_rand_limit))
            )
        )
    )
    (survival_kill_volumes_off)
    (ai_survival_cleanup "gr_survival_all" false false)
    (ai_survival_cleanup "gr_survival_remaining" false false)
    (ai_survival_cleanup "gr_survival_extras" false false)
    (sleep_until 
        (and
            (< (object_get_health v_sur_phantom_01) 0.0)
            (< (object_get_health v_sur_phantom_02) 0.0)
            (< (object_get_health v_sur_phantom_03) 0.0)
            (< (object_get_health v_sur_phantom_04) 0.0)
        )
    )
)

(script static void survival_kill_volumes_on
    (kill_volume_enable "kill_sur_room_01")
    (kill_volume_enable "kill_sur_room_02")
    (kill_volume_enable "kill_sur_room_03")
    (kill_volume_enable "kill_sur_room_04")
    (kill_volume_enable "kill_sur_room_05")
    (kill_volume_enable "kill_sur_room_06")
    (kill_volume_enable "kill_sur_room_07")
    (kill_volume_enable "kill_sur_room_08")
    (kill_volume_enable "kill_a_surv_00")
    (kill_volume_enable "kill_a_surv_01")
    (kill_volume_enable "kill_a_surv_02")
    (kill_volume_enable "kill_a_surv_03")
    (kill_volume_enable "kill_a_surv_04")
    (kill_volume_enable "kill_a_surv_05")
    (kill_volume_enable "kill_a_surv_06")
    (kill_volume_enable "kill_a_surv_07")
    (kill_volume_enable "kill_a_surv_08")
    (kill_volume_enable "kill_a_surv_09")
    (kill_volume_enable "kill_a_surv_10")
    (kill_volume_enable "kill_b_sur_room_01")
    (kill_volume_enable "kill_b_sur_room_02")
)

(script static void survival_kill_volumes_off
    (kill_volume_disable "kill_sur_room_01")
    (kill_volume_disable "kill_sur_room_02")
    (kill_volume_disable "kill_sur_room_03")
    (kill_volume_disable "kill_sur_room_04")
    (kill_volume_disable "kill_sur_room_05")
    (kill_volume_disable "kill_sur_room_06")
    (kill_volume_disable "kill_sur_room_07")
    (kill_volume_disable "kill_sur_room_08")
    (kill_volume_disable "kill_a_surv_00")
    (kill_volume_disable "kill_a_surv_01")
    (kill_volume_disable "kill_a_surv_02")
    (kill_volume_disable "kill_a_surv_03")
    (kill_volume_disable "kill_a_surv_04")
    (kill_volume_disable "kill_a_surv_05")
    (kill_volume_disable "kill_a_surv_06")
    (kill_volume_disable "kill_a_surv_07")
    (kill_volume_disable "kill_a_surv_08")
    (kill_volume_disable "kill_a_surv_09")
    (kill_volume_disable "kill_a_surv_10")
    (kill_volume_disable "kill_b_sur_room_01")
    (kill_volume_disable "kill_b_sur_room_02")
)

(script static void survival_bonus_round
    (if debug 
        (print "** start bonus round **"))
    (ai_reset_objective ai_obj_survival)
    (set b_sur_bonus_round_running true)
    (set b_sur_bonus_end false)
    (ai_kill_silent "gr_survival_extras")
    (set l_sur_pre_bonus_points (survival_total_score))
    (survival_mode_begin_new_wave)
    (set k_survival_bonus_timer (* (survival_mode_get_current_wave_time_limit) 30.0))
    (survival_bonus_round_limit)
    (chud_bonus_round_set_timer (survival_mode_get_current_wave_time_limit))
    (chud_bonus_round_show_timer true)
    (survival_mode_event_new "survival_bonus_round")
    (sleep 150)
    (if (wave_dropship_enabled) 
        (begin
            (ai_place ai_sur_bonus_phantom)
            (sleep 1)
            (f_survival_bonus_spawner true)
            (f_survival_bonus_spawner true)
            (f_survival_bonus_spawner true)
            (f_survival_bonus_spawner true)
        )
    )
    (if (wave_dropship_enabled) 
        (sleep_until b_sur_bonus_phantom_ready))
    (set b_survival_bonus_timer_begin true)
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    b_sur_bonus_end
                    (<= (survival_bonus_living_count) k_sur_bonus_limit)
                    (survival_players_dead)
                ) 
            1)
            (if 
                (and
                    (not (survival_players_dead))
                    (not b_sur_bonus_end)
                ) 
                    (begin
                        (f_survival_bonus_spawner false)
                    )
            )
            (or
                b_sur_bonus_end
                (survival_players_dead)
            )
        ) 
    1)
    (ai_kill_silent ai_sur_wave_spawns)
    (ai_kill_silent ai_sur_bonus_wave)
    (sleep 90)
    (ai_kill_silent ai_sur_wave_spawns)
    (ai_kill_silent ai_sur_bonus_wave)
    (survival_mode_event_new "survival_bonus_round_over")
    (survival_mode_respawn_dead_players)
    (sleep 30)
    (survival_mode_end_wave)
    (survival_mode_end_set)
    (set s_survival_wave_complete_count (+ s_survival_wave_complete_count 1.0))
    (sleep 120)
    (set l_sur_post_bonus_points (survival_total_score))
    (if (>= (- l_sur_post_bonus_points l_sur_pre_bonus_points) k_sur_bonus_points_award) 
        (begin
            (survival_award_bonus_lives)
        ) (begin
            (survival_mode_event_new "survival_better_luck_next_time")
        )
    )
    (chud_bonus_round_set_timer 0.0)
    (chud_bonus_round_show_timer false)
    (chud_bonus_round_start_timer false)
    (set k_sur_bonus_squad_limit 6)
    (set b_sur_bonus_phantom_ready false)
    (set b_sur_bonus_refilling false)
    (set b_sur_bonus_round_running false)
)

(script dormant void survival_bonus_round_end
    (sleep_until 
        (begin
            (sleep_until b_survival_bonus_timer_begin 1)
            (chud_bonus_round_start_timer true)
            (sleep_until (survival_players_dead) 1 k_survival_bonus_timer)
            (set b_sur_bonus_end true)
            (if (survival_players_dead) 
                (begin
                    (chud_bonus_round_start_timer false)
                    (chud_bonus_round_set_timer 0.0)
                )
            )
            (set b_survival_bonus_timer_begin false)
            false
        ) 
    1)
)

(script static void survival_bonus_round_limit
    (cond
        ((coop_players_4)
            (begin
                (if (>= (survival_mode_set_get) 5) 
                    (set k_sur_bonus_points_award 24000))
                (if (= (survival_mode_set_get) 4) 
                    (set k_sur_bonus_points_award 20000))
                (if (= (survival_mode_set_get) 3) 
                    (set k_sur_bonus_points_award 16000))
                (if (= (survival_mode_set_get) 2) 
                    (set k_sur_bonus_points_award 12000))
                (if (<= (survival_mode_set_get) 1) 
                    (set k_sur_bonus_points_award 8000))
            )
        )
        ((coop_players_3)
            (begin
                (if (>= (survival_mode_set_get) 5) 
                    (set k_sur_bonus_points_award 18000))
                (if (= (survival_mode_set_get) 4) 
                    (set k_sur_bonus_points_award 15000))
                (if (= (survival_mode_set_get) 3) 
                    (set k_sur_bonus_points_award 12000))
                (if (= (survival_mode_set_get) 2) 
                    (set k_sur_bonus_points_award 9000))
                (if (<= (survival_mode_set_get) 1) 
                    (set k_sur_bonus_points_award 6000))
            )
        )
        ((coop_players_2)
            (begin
                (if (>= (survival_mode_set_get) 5) 
                    (set k_sur_bonus_points_award 12000))
                (if (= (survival_mode_set_get) 4) 
                    (set k_sur_bonus_points_award 10000))
                (if (= (survival_mode_set_get) 3) 
                    (set k_sur_bonus_points_award 8000))
                (if (= (survival_mode_set_get) 2) 
                    (set k_sur_bonus_points_award 6000))
                (if (<= (survival_mode_set_get) 1) 
                    (set k_sur_bonus_points_award 4000))
            )
        )
        (true
            (begin
                (if (>= (survival_mode_set_get) 5) 
                    (set k_sur_bonus_points_award 6000))
                (if (= (survival_mode_set_get) 4) 
                    (set k_sur_bonus_points_award 5000))
                (if (= (survival_mode_set_get) 3) 
                    (set k_sur_bonus_points_award 4000))
                (if (= (survival_mode_set_get) 2) 
                    (set k_sur_bonus_points_award 3000))
                (if (<= (survival_mode_set_get) 1) 
                    (set k_sur_bonus_points_award 2000))
            )
        )
    )
    (sleep 1)
    (chud_bonus_round_set_target_score k_sur_bonus_points_award)
)

(script static void f_survival_bonus_spawner (boolean force_load)
    (if debug 
        (print "spawn bonus squad..."))
    (if 
        (and
            (wave_dropship_enabled)
            (or
                force_load
                (and
                    b_sur_bonus_phantom_ready
                    (= (random_range 0 2) 0)
                )
            )
        ) 
            (begin
                (ai_place_wave_in_limbo (survival_mode_get_wave_squad) ai_sur_wave_spawns 1)
                (sleep 1)
                (f_survival_bonus_load_phantom ai_sur_wave_spawns)
            ) (begin
                (ai_place_wave (survival_mode_get_wave_squad) ai_sur_wave_spawns 1)
                (sleep 1)
                (ai_migrate_persistent ai_sur_wave_spawns ai_sur_bonus_wave)
            )
    )
)

(script static void f_survival_bonus_load_phantom (ai load_squad)
    (if debug 
        (print "loading bonus squad into dropship..."))
    (f_survival_load_phantom v_sur_bonus_phantom s_sur_drop_side_bonus load_squad)
)

(script dormant void survival_bonus_round_phantom
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    b_sur_bonus_phantom_ready
                    b_sur_bonus_end
                ) 
            5)
            (if (not b_sur_bonus_end) 
                (begin
                    (unit_open v_sur_bonus_phantom)
                    (sleep_until 
                        (begin
                            (vehicle_unload v_sur_bonus_phantom phantom_p)
                            (sleep 1)
                            (ai_migrate_persistent ai_sur_wave_spawns ai_sur_bonus_wave)
                            b_sur_bonus_end
                        ) 
                    30)
                    (unit_close v_sur_bonus_phantom)
                )
            )
            false
        )
    )
)

(script static short survival_bonus_living_count
    (+ (ai_nonswarm_count ai_sur_wave_spawns) (ai_nonswarm_count ai_sur_bonus_wave) (ai_living_count ai_sur_bonus_phantom))
)

(script static void f_unload_bonus_phantom (vehicle phantom)
    (begin_random
        (begin
            (vehicle_unload phantom phantom_p_lf)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_lb)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_rf)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_rb)
            (sleep (random_range 0 10))
        )
    )
    (sleep 90)
    (begin_random
        (begin
            (vehicle_unload phantom phantom_p_ml_b)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload phantom phantom_p_mr_f)
            (sleep (random_range 0 10))
        )
    )
)

(script static long survival_total_score
    (+ (campaign_metagame_get_player_score (player0)) (campaign_metagame_get_player_score (player1)) (campaign_metagame_get_player_score (player2)) (campaign_metagame_get_player_score (player3)))
)

(script static void survival_phantom_spawner
    (sleep_until 
        (begin
            (if b_sur_phantoms_semi_random 
                (begin_random
                    (begin
                        (if b_phantom_spawn 
                            (f_survival_phantom_spawner ai_sur_phantom_01))
                        (if b_phantom_spawn 
                            (f_survival_phantom_spawner ai_sur_phantom_02))
                    )
                    (begin
                        (if b_phantom_spawn 
                            (f_survival_phantom_spawner ai_sur_phantom_03))
                        (if b_phantom_spawn 
                            (f_survival_phantom_spawner ai_sur_phantom_04))
                    )
                ) (begin_random
                    (if b_phantom_spawn 
                        (f_survival_phantom_spawner ai_sur_phantom_01))
                    (if b_phantom_spawn 
                        (f_survival_phantom_spawner ai_sur_phantom_02))
                    (if b_phantom_spawn 
                        (f_survival_phantom_spawner ai_sur_phantom_03))
                    (if b_phantom_spawn 
                        (f_survival_phantom_spawner ai_sur_phantom_04))
                )
            )
            (= b_phantom_spawn false)
        ) 
    1)
    (set b_phantom_spawn true)
    (set b_phantom_spawn_count 0)
    (sleep 1)
)

(script static void f_survival_phantom_spawner (ai spawned_phantom)
    (ai_place spawned_phantom)
    (sleep 1)
    (set s_sur_dropship_crew_count (ai_living_count spawned_phantom))
    (ai_force_active spawned_phantom true)
    (if (> (object_get_health spawned_phantom) 0.0) 
        (begin
            (if debug 
                (print "spawn phantom..."))
            (set b_phantom_spawn_count (+ b_phantom_spawn_count 1.0))
            (if (>= b_phantom_spawn_count k_phantom_spawn_limit) 
                (set b_phantom_spawn false))
        )
    )
)

(script static ai wave_squad_get (short index)
    (if (<= index (ai_squad_group_get_squad_count ai_sur_wave_spawns)) 
        (ai_squad_group_get_squad ai_sur_wave_spawns index) none)
)

(script static short wave_squad_get_count (short index)
    (if (<= index (ai_squad_group_get_squad_count ai_sur_wave_spawns)) 
        (ai_living_count (ai_squad_group_get_squad ai_sur_wave_spawns index)) 0)
)

(script static boolean survival_should_load_squad (ai squad)
    (> (ai_living_count squad) 0)
)

(script static void survival_dropship_loader
    (if (survival_should_load_squad (wave_squad_get 0)) 
        (f_survival_phantom_loader (wave_squad_get 0)))
    (if (survival_should_load_squad (wave_squad_get 1)) 
        (f_survival_phantom_loader (wave_squad_get 1)))
    (if (survival_should_load_squad (wave_squad_get 2)) 
        (f_survival_phantom_loader (wave_squad_get 2)))
    (if (survival_should_load_squad (wave_squad_get 3)) 
        (f_survival_phantom_loader (wave_squad_get 3)))
    (if (survival_should_load_squad (wave_squad_get 4)) 
        (f_survival_phantom_loader (wave_squad_get 4)))
    (if (survival_should_load_squad (wave_squad_get 5)) 
        (f_survival_phantom_loader (wave_squad_get 5)))
    (if (survival_should_load_squad (wave_squad_get 6)) 
        (f_survival_phantom_loader (wave_squad_get 6)))
    (if (survival_should_load_squad (wave_squad_get 7)) 
        (f_survival_phantom_loader (wave_squad_get 7)))
    (if (survival_should_load_squad (wave_squad_get 8)) 
        (f_survival_phantom_loader (wave_squad_get 8)))
    (if (survival_should_load_squad (wave_squad_get 9)) 
        (f_survival_phantom_loader (wave_squad_get 9)))
    (if (survival_should_load_squad (wave_squad_get 10)) 
        (f_survival_phantom_loader (wave_squad_get 10)))
    (if (survival_should_load_squad (wave_squad_get 11)) 
        (f_survival_phantom_loader (wave_squad_get 11)))
    (if (survival_should_load_squad (wave_squad_get 12)) 
        (f_survival_phantom_loader (wave_squad_get 12)))
    (if (survival_should_load_squad (wave_squad_get 13)) 
        (f_survival_phantom_loader (wave_squad_get 13)))
    (if (survival_should_load_squad (wave_squad_get 14)) 
        (f_survival_phantom_loader (wave_squad_get 14)))
    (if (survival_should_load_squad (wave_squad_get 15)) 
        (f_survival_phantom_loader (wave_squad_get 15)))
    (if (survival_should_load_squad (wave_squad_get 16)) 
        (f_survival_phantom_loader (wave_squad_get 16)))
    (if (survival_should_load_squad (wave_squad_get 17)) 
        (f_survival_phantom_loader (wave_squad_get 17)))
    (if (survival_should_load_squad (wave_squad_get 18)) 
        (f_survival_phantom_loader (wave_squad_get 18)))
    (if (survival_should_load_squad (wave_squad_get 19)) 
        (f_survival_phantom_loader (wave_squad_get 19)))
    (if (survival_should_load_squad (wave_squad_get 20)) 
        (f_survival_phantom_loader (wave_squad_get 20)))
)

(script static void f_survival_phantom_loader (ai load_squad)
    (sleep_until 
        (begin
            (if 
                (and
                    (= b_phantom_loaded false)
                    (= s_phantom_load_count 1)
                ) 
                    (begin
                        (if (> (object_get_health v_sur_phantom_01) 0.0) 
                            (begin
                                (if debug 
                                    (print "** load phantom 01 **"))
                                (f_survival_load_phantom v_sur_phantom_01 s_sur_drop_side_01 load_squad)
                            )
                        )
                        (set s_phantom_load_count 2)
                    )
            )
            (if 
                (and
                    (= b_phantom_loaded false)
                    (= s_phantom_load_count 2)
                ) 
                    (begin
                        (if (> (object_get_health v_sur_phantom_02) 0.0) 
                            (begin
                                (if debug 
                                    (print "** load phantom 02 **"))
                                (f_survival_load_phantom v_sur_phantom_02 s_sur_drop_side_02 load_squad)
                            )
                        )
                        (set s_phantom_load_count 3)
                    )
            )
            (if 
                (and
                    (= b_phantom_loaded false)
                    (= s_phantom_load_count 3)
                ) 
                    (begin
                        (if (> (object_get_health v_sur_phantom_03) 0.0) 
                            (begin
                                (if debug 
                                    (print "** load phantom 03 **"))
                                (f_survival_load_phantom v_sur_phantom_03 s_sur_drop_side_03 load_squad)
                            )
                        )
                        (set s_phantom_load_count 4)
                    )
            )
            (if 
                (and
                    (= b_phantom_loaded false)
                    (= s_phantom_load_count 4)
                ) 
                    (begin
                        (if (> (object_get_health v_sur_phantom_04) 0.0) 
                            (begin
                                (if debug 
                                    (print "** load phantom 04 **"))
                                (f_survival_load_phantom v_sur_phantom_04 s_sur_drop_side_04 load_squad)
                            )
                        )
                        (set s_phantom_load_count 1)
                    )
            )
            b_phantom_loaded
        ) 
    1)
    (set b_phantom_loaded false)
)

(script static void f_survival_load_phantom (vehicle phantom, string load_side, ai load_squad)
    (ai_exit_limbo load_squad)
    (if (= load_side "left") 
        (begin
            (if debug 
                (print "load phantom left..."))
            (if (= (vehicle_test_seat phantom phantom_p_lb) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_lb))
            (if (= (vehicle_test_seat phantom phantom_p_lf) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_lf))
            (if (= (vehicle_test_seat phantom phantom_p_ml_f) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_ml_f))
            (if (= (vehicle_test_seat phantom phantom_p_ml_b) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_ml_b))
            (set b_phantom_loaded true)
        )
    )
    (if (= load_side "right") 
        (begin
            (if debug 
                (print "load phantom right..."))
            (if (= (vehicle_test_seat phantom phantom_p_rb) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_rb))
            (if (= (vehicle_test_seat phantom phantom_p_rf) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_rf))
            (if (= (vehicle_test_seat phantom phantom_p_mr_f) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_mr_f))
            (if (= (vehicle_test_seat phantom phantom_p_mr_b) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_mr_b))
            (set b_phantom_loaded true)
        )
    )
    (if (= load_side "dual") 
        (begin
            (if debug 
                (print "load phantom dual..."))
            (if (= (vehicle_test_seat phantom phantom_p_lf) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_lf))
            (if (= (vehicle_test_seat phantom phantom_p_rf) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_rf))
            (if (= (vehicle_test_seat phantom phantom_p_lb) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_lb))
            (if (= (vehicle_test_seat phantom phantom_p_rb) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_p_rb))
            (set b_phantom_loaded true)
        )
    )
    (if (= load_side "chute") 
        (begin
            (if debug 
                (print "load phantom chute..."))
            (if (= (vehicle_test_seat phantom phantom_pc_a) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_pc_a))
            (if (= (vehicle_test_seat phantom phantom_pc_b) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_pc_b))
            (if (= (vehicle_test_seat phantom phantom_pc_c) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_pc_c))
            (if (= (vehicle_test_seat phantom phantom_pc_d) false) 
                (ai_vehicle_enter_immediate load_squad phantom phantom_pc_d))
            (set b_phantom_loaded true)
        )
    )
)

(script static void survival_countdown_timer
    (sound_impulse_start "sound\game_sfx\ui\atlas_main_menu\player_timer_beep" none 1.0)
    (sleep 30)
    (sound_impulse_start "sound\game_sfx\ui\atlas_main_menu\player_timer_beep" none 1.0)
    (sleep 30)
    (sound_impulse_start "sound\game_sfx\ui\atlas_main_menu\player_timer_beep" none 1.0)
    (sleep 30)
    (sound_impulse_start "sound\game_sfx\ui\atlas_main_menu\player_respawn" none 1.0)
    (sleep 30)
)

(script static void survival_begin_announcer
    (cond
        (b_survival_new_set
            (begin
                (if debug 
                    (print "announce new set..."))
                (survival_countdown_timer)
                (survival_mode_event_new "survival_new_set")
                (set b_survival_new_set false)
                (set b_survival_new_round false)
                (set b_survival_new_wave false)
            )
        )
        (b_survival_new_round
            (begin
                (if debug 
                    (print "announce new round..."))
                (survival_countdown_timer)
                (survival_mode_event_new "survival_new_round")
                (set b_survival_new_round false)
                (set b_survival_new_wave false)
            )
        )
        (b_survival_new_wave
            (begin
                (if debug 
                    (print "announce new wave..."))
                (if (> (survival_mode_wave_get) 0) 
                    (begin
                        (survival_mode_award_hero_medal)
                        (sleep 1)
                        (survival_mode_event_new "survival_reinforcements")
                        (survival_mode_respawn_dead_players)
                        (sleep (* (random_range 3 5) 30.0))
                    )
                )
            )
        )
    )
    (sleep 5)
)

(script static void survival_end_announcer
    (cond
        ((< (survival_mode_wave_get) k_sur_wave_per_round_limit)
            (begin
                (if debug 
                    (print "announce end wave..."))
            )
        )
        ((< (survival_mode_round_get) k_sur_round_per_set_limit)
            (begin
                (sleep (* 30.0 5.0))
                (if debug 
                    (print "announce end round..."))
                (survival_mode_event_new "survival_end_round")
                (sleep (* 30.0 3.0))
            )
        )
        (true
            (begin
                (sleep (* 30.0 5.0))
                (if debug 
                    (print "announce end set..."))
                (survival_mode_event_new "survival_end_set")
                (ai_kill "gr_survival_extras")
                (sleep (* 30.0 3.0))
            )
        )
    )
)

(script dormant void survival_lives_announcement
    (sleep_until 
        (begin
            (sleep_until (> (survival_mode_lives_get) 0) 1)
            (sleep_until (<= (survival_mode_lives_get) 5) 1)
            (if (= (survival_mode_lives_get) 5) 
                (begin
                    (if debug 
                        (print "5 lives left..."))
                    (survival_mode_event_new "survival_5_lives_left")
                )
            )
            (sleep_until 
                (or
                    (<= (survival_mode_lives_get) 1)
                    (> (survival_mode_lives_get) 5)
                ) 
            1)
            (if (= (survival_mode_lives_get) 1) 
                (begin
                    (if debug 
                        (print "1 life left..."))
                    (survival_mode_event_new "survival_1_life_left")
                )
            )
            (sleep_until 
                (or
                    (<= (survival_mode_lives_get) 0)
                    (> (survival_mode_lives_get) 1)
                ) 
            1)
            (if (<= (survival_mode_lives_get) 0) 
                (begin
                    (if debug 
                        (print "0 lives left..."))
                    (survival_mode_event_new "survival_0_lives_left")
                )
            )
            (sleep_until 
                (or
                    (<= (player_count) 1)
                    (> (survival_mode_lives_get) 0)
                ) 
            1)
            (if 
                (and
                    (<= (survival_mode_lives_get) 0)
                    (= (player_count) 1)
                ) 
                    (begin
                        (if debug 
                            (print "last man standing..."))
                        (survival_mode_event_new "survival_last_man_standing")
                    )
            )
            false
        )
    )
)

(script static void survival_respawn_weapons
    (if debug 
        (print "creating scenery / vehicles / equipment"))
    (survival_mode_event_new "survival_awarded_weapon")
    (set b_sur_weapon_drop true)
    (object_create_folder_anew folder_survival_scenery)
    (object_create_folder_anew folder_survival_vehicles)
    (object_create_folder_anew folder_survival_equipment)
    (survival_scenario_weapon_drop)
    (sleep 30)
    (set b_sur_weapon_drop false)
)

(script static void survival_respawn_crates
    (if debug 
        (print "respawn crates"))
    (object_create_folder_anew folder_survival_crates)
)

(script static void surival_set_music
    (set s_music_initial (random_range 0 5))
    (cond
        ((= s_music_initial 0)
            (set m_initial_wave "multiplayer\firefight_music\firefight_music02")
        )
        ((= s_music_initial 1)
            (set m_initial_wave "multiplayer\firefight_music\firefight_music03")
        )
        ((= s_music_initial 2)
            (set m_initial_wave "multiplayer\firefight_music\firefight_music04")
        )
        ((= s_music_initial 3)
            (set m_initial_wave "multiplayer\firefight_music\firefight_music05")
        )
        ((= s_music_initial 4)
            (set m_initial_wave "multiplayer\firefight_music\firefight_music06")
        )
    )
    (sleep 1)
    (set s_music_final (random_range 0 5))
    (cond
        ((= s_music_final 0)
            (set m_final_wave "multiplayer\firefight_music\firefight_music20")
        )
        ((= s_music_final 1)
            (set m_final_wave "multiplayer\firefight_music\firefight_music21")
        )
        ((= s_music_final 2)
            (set m_final_wave "multiplayer\firefight_music\firefight_music22")
        )
        ((= s_music_final 3)
            (set m_final_wave "multiplayer\firefight_music\firefight_music23")
        )
        ((= s_music_final 4)
            (set m_final_wave "multiplayer\firefight_music\firefight_music24")
        )
    )
)

(script static void survival_mode_wave_music_start
    (cond
        ((survival_mode_current_wave_is_initial)
            (sound_looping_start m_initial_wave none 1.0)
        )
        ((survival_mode_current_wave_is_boss)
            (sound_looping_start m_final_wave none 1.0)
        )
    )
)

(script static void survival_mode_wave_music_stop
    (cond
        ((survival_mode_current_wave_is_initial)
            (sound_looping_stop m_initial_wave)
        )
        ((survival_mode_current_wave_is_boss)
            (sound_looping_stop m_final_wave)
        )
    )
)

(script dormant void survival_award_achievement
    (sleep_until (>= (survival_total_score) 200000))
    (cond
        ((= string_survival_map_name "sc100")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc100")
        )
        ((= string_survival_map_name "sc110")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc110")
        )
        ((= string_survival_map_name "sc120")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc120")
        )
        ((= string_survival_map_name "sc130a")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc130a")
        )
        ((= string_survival_map_name "sc130b")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc130b")
        )
        ((= string_survival_map_name "sc140")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc140")
        )
        ((= string_survival_map_name "l200")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_l200")
        )
        ((= string_survival_map_name "l300")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_l300")
        )
        ((= string_survival_map_name "h100a")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc100")
        )
        ((= string_survival_map_name "h100b")
            (achievement_grant_to_all_players "_achievement_metagame_points_in_sc120")
        )
    )
)

(script static void survival_like_marty_start
    (set l_player0_score (campaign_metagame_get_player_score (player0)))
    (set l_player1_score (campaign_metagame_get_player_score (player1)))
    (set l_player2_score (campaign_metagame_get_player_score (player2)))
    (set l_player3_score (campaign_metagame_get_player_score (player3)))
)

(script static void survival_like_marty_award
    (if (<= (campaign_metagame_get_player_score (player0)) l_player0_score) 
        (achievement_grant_to_player (player0) "_achievement_be_like_marty"))
    (if (<= (campaign_metagame_get_player_score (player1)) l_player1_score) 
        (achievement_grant_to_player (player1) "_achievement_be_like_marty"))
    (if (<= (campaign_metagame_get_player_score (player2)) l_player2_score) 
        (achievement_grant_to_player (player2) "_achievement_be_like_marty"))
    (if (<= (campaign_metagame_get_player_score (player3)) l_player3_score) 
        (achievement_grant_to_player (player3) "_achievement_be_like_marty"))
)

(script startup void survival_round_timer_counter
    (sleep 300)
    (sleep_until 
        (begin
            (set l_sur_round_timer (+ l_sur_round_timer 1.0))
            false
        ) 
    30)
)

(script dormant void survival_end_game
    (wake survival_mode_end_cond_lives)
    (wake survival_mode_end_cond_time)
    (wake survival_mode_end_cond_complete)
    (sleep_until b_survival_game_end_condition 1)
    (sleep_forever survival_mode_end_cond_lives)
    (sleep_forever survival_mode_end_cond_time)
    (sleep_forever survival_mode)
    (sleep_forever survival_bonus_round_end)
    (sleep_forever survival_lives_announcement)
    (sleep_forever survival_award_achievement)
    (sleep 30)
    (sound_looping_stop m_final_wave)
    (sleep 30)
    (sound_looping_start m_pgcr none 1.0)
    (survival_mode_event_new "survival_game_over")
    (sleep 60)
    (sound_class_set_gain "" 0.0 270)
    (sound_class_set_gain "mus" 1.0 1)
    (sound_class_set_gain "ui" 1.0 0)
    (game_won)
)

(script dormant void survival_mode_end_cond_lives
    (sleep_until 
        (and
            (= (survival_mode_lives_get) 0)
            (survival_players_dead)
            (= b_sur_bonus_round_running false)
        ) 
    1)
    (sleep 30)
    (set b_survival_game_end_condition true)
)

(script dormant void survival_mode_end_cond_time
    (sleep_until 
        (and
            (= b_sur_bonus_round_running false)
            (> (survival_mode_get_time_limit) 0)
            (>= l_sur_round_timer (* (survival_mode_get_time_limit) 60.0))
        ) 
    10)
    (set b_survival_game_end_condition true)
)

(script dormant void survival_mode_end_cond_complete
    (sleep_until 
        (and
            (> (survival_mode_get_set_count) 0)
            (>= s_survival_wave_complete_count (survival_mode_get_set_count))
        ) 
    10)
    (sleep 30)
    (set b_survival_game_end_condition true)
)

(script static boolean survival_players_dead
    (if 
        (and
            (<= (object_get_health (player0)) 0.0)
            (<= (object_get_health (player1)) 0.0)
            (<= (object_get_health (player2)) 0.0)
            (<= (object_get_health (player3)) 0.0)
        ) 
            true false)
)

(script static void survival_refresh_sleep
    (if (>= (ai_living_count "gr_survival_all") 10) 
        (cond
            ((difficulty_normal)
                (sleep (* (random_range 20 30) 30.0))
            )
            ((difficulty_heroic)
                (sleep (* (random_range 10 20) 30.0))
            )
            ((difficulty_legendary)
                (sleep (* (random_range 5 10) 30.0))
            )
        ) (sleep 30))
)

(script dormant void test_ai_erase_fast
    (sleep_until 
        (begin
            (sleep_until (>= (ai_living_count "gr_survival_all") 1) 1)
            (sleep 5)
            (ai_erase_all)
            false
        ) 
    1)
)

(script dormant void test_ai_erase
    (sleep_until 
        (begin
            (sleep_until (>= (ai_living_count "gr_survival_all") 1) 1)
            (sleep 30)
            (ai_erase_all)
            false
        ) 
    1)
)

(script dormant void test_ai_erase_slow
    (sleep_until 
        (begin
            (sleep_until (>= (ai_living_count "gr_survival_all") 1) 1)
            (sleep 150)
            (ai_erase_all)
            false
        ) 
    1)
)

(script static void test_award_500
    (campaign_metagame_award_points (player0) 500)
)

(script static void test_award_1000
    (campaign_metagame_award_points (player0) 1000)
)

(script static void test_award_5000
    (campaign_metagame_award_points (player0) 5000)
)

(script static void test_award_10000
    (campaign_metagame_award_points (player0) 10000)
)

(script static void test_award_20000
    (campaign_metagame_award_points (player0) 20000)
)

(script static void test_award_30000
    (campaign_metagame_award_points (player0) 30000)
)

(script static void test_4_player
    (set k_sur_squad_per_wave_limit 6)
    (set k_phantom_spawn_limit 2)
)

(script startup void sc130_ambient_stub
    (if debug 
        (print "sc130 ambient stub"))
)

(script dormant void obj_arm_charges_set
    (sleep (* 30.0 5.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "arm all charges on bridge"))
    (f_new_intel "obj_new" "obj_1" 0 "fl_roof")
)

(script dormant void obj_arm_charges_clear
    (sleep_until 
        (and
            (= (device_group_get "dg_charge_01") 1.0)
            (= (device_group_get "dg_charge_02") 1.0)
            (= (device_group_get "dg_charge_03") 1.0)
        ) 
    1)
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "arm all charges on bridge"))
    (objectives_finish_up_to 0)
)

(script dormant void obj_watchtower_set
    (sleep 30)
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "use detonator in watchtower"))
    (f_new_intel "obj_new" "obj_2" 1 "fl_roof")
)

(script dormant void obj_watchtower_clear
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "use detonator in watchtower"))
    (objectives_finish_up_to 1)
)

(script dormant void obj_defend_courtyard_set
    (sleep 30)
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "fall back, defend inner courtyard"))
    (f_new_intel "obj_new" "obj_3" 2 "fl_roof")
)

(script dormant void obj_defend_courtyard_clear
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "fall back, defend inner courtyard"))
    (objectives_finish_up_to 2)
)

(script dormant void obj_oni_building_set
    (sleep 30)
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "retreat, defend oni building interior"))
    (f_new_intel "obj_new" "obj_4" 3 "fl_roof")
)

(script dormant void obj_oni_building_clear
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "retreat, defend oni building interior"))
    (objectives_finish_up_to 3)
)

(script dormant void obj_elevator_set
    (sleep 30)
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "take elevator to roof for evac"))
    (f_new_intel "obj_new" "obj_5" 4 "fl_roof")
)

(script dormant void obj_elevator_clear
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "take elevator to roof for evac"))
    (objectives_finish_up_to 4)
)

(script dormant void player0_sc130_waypoints
    (f_sc130_waypoints player_00)
)

(script dormant void player1_sc130_waypoints
    (f_sc130_waypoints player_01)
)

(script dormant void player2_sc130_waypoints
    (f_sc130_waypoints player_02)
)

(script dormant void player3_sc130_waypoints
    (f_sc130_waypoints player_03)
)

(script static void f_sc130_waypoints (short player_name)
    (sleep_until 
        (begin
            (f_sleep_until_activate_waypoint player_name)
            (cond
                ((= s_waypoint_index 1)
                    (f_waypoint_activate_1 player_name "fl_bridge_fill")
                )
                ((= s_waypoint_index 2)
                    (f_waypoint_activate_1 player_name "fl_laptop")
                )
                ((= s_waypoint_index 3)
                    (f_waypoint_activate_1 player_name "fl_bridge_out")
                )
                ((= s_waypoint_index 4)
                    (f_waypoint_activate_1 player_name "fl_main_arena_fill")
                )
                ((= s_waypoint_index 5)
                    (f_waypoint_activate_1 player_name "fl_main_arena")
                )
                ((= s_waypoint_index 6)
                    (f_waypoint_activate_1 player_name "fl_lobby")
                )
                ((= s_waypoint_index 7)
                    (f_waypoint_activate_1 player_name "fl_roof")
                )
            )
            false
        ) 
    1)
)

(script dormant void s_sc130_music01
    (sleep_until (= g_sc130_music01 true) 1)
    (if debug 
        (print "start sc130_music01"))
    (sound_looping_resume "levels\atlas\sc130\music\sc130_music01" none 1.0)
    (sleep_until (= g_sc130_music01 false) 1)
    (if debug 
        (print "stop sc130_music01"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music01")
)

(script dormant void s_sc130_music02
    (sleep_until (= g_sc130_music02 true) 1)
    (if debug 
        (print "start sc130_music02"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music02" none 1.0)
    (sleep_until (= g_sc130_music02 false) 1)
    (if debug 
        (print "stop sc130_music02"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music02")
)

(script dormant void s_sc130_music03
    (sleep_until (= g_sc130_music03 true) 1)
    (if debug 
        (print "start sc130_music03"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music03" none 1.0)
    (sleep_until (= g_sc130_music03 false) 1)
    (if debug 
        (print "stop sc130_music03"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music03")
)

(script dormant void s_sc130_music035
    (sleep_until (= g_sc130_music035 true) 1)
    (if debug 
        (print "start sc130_music035"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music035" none 1.0)
    (sleep_until (= g_sc130_music035 false) 1)
    (if debug 
        (print "stop sc130_music035"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music035")
)

(script dormant void s_sc130_music036
    (sleep_until (= g_sc130_music036 true) 1)
    (if debug 
        (print "start sc130_music036"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music036" none 1.0)
    (sleep_until (= g_sc130_music036 false) 1)
    (if debug 
        (print "stop sc130_music036"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music036")
)

(script dormant void s_sc130_music04
    (sleep_until 
        (or
            (volume_test_players "tv_music04_check_01")
            (volume_test_players "tv_music04_check_02")
        ) 
    1)
    (set g_sc130_music04 true)
    (if debug 
        (print "start sc130_music04"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music04" none 1.0)
    (sleep_until (= g_sc130_music04 false) 1)
    (if debug 
        (print "stop sc130_music04"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music04")
)

(script dormant void s_sc130_music05
    (sleep_until (= g_sc130_music05 true) 1)
    (if debug 
        (print "start sc130_music05"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music05" none 1.0)
    (sleep_until (= g_sc130_music05 false) 1)
    (if debug 
        (print "stop sc130_music05"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music05")
)

(script dormant void s_sc130_music06
    (sleep_until (= g_sc130_music06 true) 1)
    (if debug 
        (print "start sc130_music06"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music06" none 1.0)
    (sleep_until (= g_sc130_music06 false) 1)
    (if debug 
        (print "stop sc130_music06"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music06")
)

(script dormant void s_sc130_music06_alt
    (sleep_until (= g_sc130_music06_alt true) 1)
    (if debug 
        (print "start sc130_music06_alt"))
    (sound_looping_set_alternate "levels\atlas\sc130\music\sc130_music06" true)
)

(script dormant void s_sc130_music07
    (sleep_until (= g_sc130_music07 true) 1)
    (if debug 
        (print "start sc130_music07"))
    (sound_looping_start "levels\atlas\sc130\music\sc130_music07" none 1.0)
    (sleep_until (= g_sc130_music07 false) 1)
    (if debug 
        (print "stop sc130_music07"))
    (sound_looping_stop "levels\atlas\sc130\music\sc130_music07")
)

(script dormant void sc130_player_dialogue_check
    (sleep_until 
        (and
            (<= (object_get_health (player0)) 0.0)
            (<= (object_get_health (player1)) 0.0)
            (<= (object_get_health (player2)) 0.0)
            (<= (object_get_health (player3)) 0.0)
        ) 
    5)
    (sound_impulse_stop "sound\dialog\atlas\sc130\mission\sc130_0455_dut")
    (sound_impulse_stop "sound\dialog\atlas\sc130\mission\sc130_0800_dut")
)

(script dormant void md_010_charge_01
    (set ai_mickey "sq_bridge_odst/odst")
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep 60)
    (if dialogue 
        (print "mickey (radio): follow me! arm the charges!"))
    (vs_play_line ai_mickey true sc130_0010)
    (sleep 30)
    (wake md_010_bridge_retreat)
    (vs_release_all)
)

(script dormant void md_010_charge_02
    (sleep_until (volume_test_players "tv_bridge_00") 1)
    (if (>= (ai_task_count "obj_bridge_cov/gt_bridge_wraith") 2) 
        (begin
            (vs_enable_pathfinding_failsafe ai_mickey true)
            (vs_enable_looking ai_mickey true)
            (vs_enable_targeting ai_mickey true)
            (vs_enable_moving ai_mickey true)
            (sleep 1)
            (if dialogue 
                (print "mickey (radio): dutch! ignore those tanks!"))
            (sleep (ai_play_line ai_mickey sc130_0020))
            (vs_release_all)
        )
    )
)

(script dormant void md_010_charge_reminder_01
    (sleep_until 
        (or
            (= g_charge_reminder 1)
            (and
                (= (device_group_get "dg_charge_01") 1.0)
                (= (device_group_get "dg_charge_02") 1.0)
                (= (device_group_get "dg_charge_03") 1.0)
            )
        ) 
    1)
    (if (= (device_group_get "dg_charge_03") 0.0) 
        (begin
            (vs_enable_pathfinding_failsafe ai_mickey true)
            (vs_enable_looking ai_mickey true)
            (vs_enable_targeting ai_mickey true)
            (vs_enable_moving ai_mickey true)
            (sleep 1)
            (if dialogue 
                (print "mickey (radio): i got this one. you do the rest!"))
            (sleep (ai_play_line ai_mickey sc130_0030))
            (vs_release_all)
        )
    )
)

(script dormant void md_010_charge_reminder_02
    (sleep_until 
        (or
            (= g_charge_reminder 2)
            (and
                (= (device_group_get "dg_charge_01") 1.0)
                (= (device_group_get "dg_charge_02") 1.0)
                (= (device_group_get "dg_charge_03") 1.0)
            )
        ) 
    1)
    (if (= (device_group_get "dg_charge_03") 0.0) 
        (begin
            (vs_enable_pathfinding_failsafe ai_mickey true)
            (vs_enable_looking ai_mickey true)
            (vs_enable_targeting ai_mickey true)
            (vs_enable_moving ai_mickey true)
            (sleep 1)
            (if dialogue 
                (print "mickey (radio): great. i gotta do everything myselfï¿½"))
            (sleep (ai_play_line ai_mickey sc130_0040))
            (vs_release_all)
        )
    )
)

(script dormant void md_010_final_charge
    (sleep_until 
        (and
            (= (device_group_get "dg_charge_01") 1.0)
            (= (device_group_get "dg_charge_02") 1.0)
            (= (device_group_get "dg_charge_03") 1.0)
        ) 
    1)
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey false)
    (vs_enable_targeting ai_mickey false)
    (vs_enable_moving ai_mickey false)
    (sleep 30)
    (if dialogue 
        (print "mickey (radio): thatï¿½s the last one, dutch! let's get off the bridge!"))
    (sleep (ai_play_line ai_mickey sc130_0050))
    (sleep 10)
    (if dialogue 
        (print "mickey (radio): everyone behind those barriers! the bridge is set to blow!"))
    (sleep (ai_play_line ai_mickey sc130_0090))
    (wake md_030_wait)
    (vs_go_to_and_face ai_mickey true "ps_bridge_odst/stand_01" "ps_bridge_odst/face_01")
    (vs_release_all)
)

(script dormant void md_010_bridge_retreat
    (vs_cast "gr_bridge_allies" true 10 "sc130_0060")
    (set marine_03 (vs_role 1))
    (vs_enable_pathfinding_failsafe marine_03 true)
    (vs_enable_looking marine_03 true)
    (vs_enable_targeting marine_03 true)
    (vs_enable_moving marine_03 true)
    (sleep 1)
    (if dialogue 
        (print "marine_03: we'll never stop that armor! fall back!"))
    (sleep (ai_play_line marine_03 sc130_0060))
    (sleep 60)
    (if dialogue 
        (print "marine_03: clear the bridge! retreat to the wall!"))
    (sleep (ai_play_line marine_03 sc130_0070))
    (vs_release_all)
)

(script dormant void md_020_watchtower
    (if (not (volume_test_players "tv_tower_dialogue")) 
        (begin
            (vs_enable_pathfinding_failsafe ai_mickey true)
            (vs_enable_looking ai_mickey true)
            (vs_enable_targeting ai_mickey true)
            (vs_enable_moving ai_mickey true)
            (sleep 1)
            (if dialogue 
                (print "mickey (radio): watchtower, dutch! get up there, and pull the trigger!"))
            (sleep (ai_play_line ai_mickey sc130_0100))
        )
    )
    (wake md_030_cop_detonator)
    (vs_release_all)
)

(script dormant void md_020_defend_bridge
    (sleep 30)
    (vs_cast "gr_bridge_allies" true 9 "sc130_0110")
    (set marine_03 (vs_role 1))
    (vs_enable_pathfinding_failsafe marine_03 true)
    (vs_enable_looking marine_03 true)
    (vs_enable_targeting marine_03 true)
    (vs_enable_moving marine_03 true)
    (sleep 1)
    (if 
        (and
            (= (device_group_get "dg_laptop_01") 0.0)
            (>= (ai_task_count "obj_bridge_cov/gt_bridge_cov") 1)
        ) 
            (begin
                (if dialogue 
                    (print "marine_03: kill their infantry! don't let 'em cross the bridge!"))
                (vs_play_line marine_03 true sc130_0110)
            )
    )
    (sleep (* 30.0 15.0))
    (if 
        (and
            (= (device_group_get "dg_laptop_01") 0.0)
            (>= (ai_task_count "obj_bridge_cov/gt_bridge_wraith") 2)
        ) 
            (begin
                (if dialogue 
                    (print "marine_03: watch those wraiths! they've got us dialed-in!"))
                (vs_play_line marine_03 true sc130_0120)
            )
    )
    (vs_release_all)
)

(script dormant void md_030_wait
    (vs_cast "sq_bridge_cop_01/cop_tower" true 9 "sc130_0130")
    (set cop_tower (vs_role 1))
    (vs_enable_pathfinding_failsafe cop_tower true)
    (vs_enable_looking cop_tower true)
    (vs_enable_targeting cop_tower true)
    (vs_enable_moving cop_tower true)
    (sleep 1)
    (if dialogue 
        (print "cop: come on, super! unlock the keypad!"))
    (vs_play_line cop_tower true sc130_0130)
    (sleep 10)
    (if dialogue 
        (print "virgil: keep it clean! respect public property!"))
    (sleep (ai_play_line_on_object "c_laptop_01" sc130_0131))
    (sleep 10)
    (if dialogue 
        (print "cop: if you don't let us trigger those charges? in about five minutes, your data-center's gonna be crawling with covenant!"))
    (vs_play_line cop_tower true sc130_0134)
    (wake md_020_watchtower)
    (vs_release_all)
)

(script dormant void md_030_cop_detonator
    (vs_cast "sq_bridge_cop_01/cop_tower" true 10 "sc130_0140")
    (set cop_tower (vs_role 1))
    (vs_enable_pathfinding_failsafe cop_tower true)
    (vs_enable_looking cop_tower true)
    (vs_enable_targeting cop_tower true)
    (vs_enable_moving cop_tower true)
    (sleep 30)
    (if debug 
        (print "superintendant chime"))
    (sound_impulse_start "sound\device_machines\virgil\virgil_in" "c_laptop_01" 1.0)
    (device_set_power "c_laptop_01" 1.0)
    (wake obj_watchtower_set)
    (set s_waypoint_index 2)
    (sleep 30)
    (if (= (device_group_get "dg_laptop_01") 0.0) 
        (begin
            (if dialogue 
                (print "cop: about damn time! do it trooper!"))
            (vs_play_line cop_tower true sc130_0140)
        )
    )
    (wake md_020_defend_bridge)
    (sleep (* 30.0 10.0))
    (if (= (device_group_get "dg_laptop_01") 0.0) 
        (begin
            (if dialogue 
                (print "cop: trooper! use the laptop to trigger the charges!"))
            (vs_play_line cop_tower true sc130_0150)
        )
    )
    (sleep (* 30.0 20.0))
    (if (= (device_group_get "dg_laptop_01") 0.0) 
        (begin
            (if dialogue 
                (print "mickey (radio): what's the holdup, dutch?! blow this sucker sky high!"))
            (sleep (ai_play_line_on_object none sc130_0160))
        )
    )
    (sleep (* 30.0 10.0))
    (if (= (device_group_get "dg_laptop_01") 0.0) 
        (begin
            (device_group_set "dm_laptop_01" "dg_laptop_01" 1.0)
        )
    )
    (vs_release_all)
)

(script dormant void md_030_bridge_blown
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey false)
    (vs_enable_targeting ai_mickey false)
    (vs_enable_moving ai_mickey false)
    (sleep 1)
    (if dialogue 
        (print "mickey (radio): boom! yeah! that's the way!"))
    (vs_play_line ai_mickey true sc130_0200)
    (sleep 10)
    (vs_go_to_and_face ai_mickey false "ps_bridge_odst/exit_01" "ps_bridge_odst/face_01")
    (vs_release_all)
)

(script dormant void md_030_bridge_tunnel
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep 1)
    (if dialogue 
        (print "mickey (radio): aww, manâ€¦covenant landing on the other side of the wall!"))
    (vs_play_line ai_mickey true sc130_0230)
    (sleep 10)
    (if 
        (and
            (<= g_main_arena_obj_control 0)
            (not (volume_test_players "tv_bridge_exit"))
        ) 
            (begin
                (if dialogue 
                    (print "mickey (radio): come on, dutch! these cops aren't gonna last long against brutes!"))
                (vs_play_line ai_mickey true sc130_0235)
            )
    )
    (wake obj_defend_courtyard_set)
    (vs_release_all)
)

(script dormant void md_030_bridge_exit
    (if 
        (and
            (<= g_main_arena_obj_control 0)
            (not (volume_test_players "tv_bridge_exit"))
        ) 
            (begin
                (vs_enable_pathfinding_failsafe ai_mickey true)
                (vs_enable_looking ai_mickey true)
                (vs_enable_targeting ai_mickey true)
                (vs_enable_moving ai_mickey true)
                (sleep 1)
                (if dialogue 
                    (print "mickey (radio): dutch! down here! head through the tunnel, under the wall!"))
                (vs_play_line ai_mickey true sc130_0240)
            )
    )
    (sleep_until (>= g_main_arena_obj_control 1) 1)
    (sleep 10)
    (if dialogue 
        (print "mickey (radio): go, dutch! we gotta keep the covenant away from that building!"))
    (vs_play_line ai_mickey true sc130_0245)
    (vs_release_all)
)

(script dormant void md_040_main_arena_start_01
    (if dialogue 
        (print "fem_marine: all teams, hold the ridge! don't let them near the oni building!"))
    (sleep (ai_play_line_on_object none sc130_0280))
    (vs_release_all)
)

(script dormant void md_040_main_arena_start_02
    (vs_cast "gr_main_arena_cov" false 10 "sc130_0270")
    (set brute_01 (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_main_arena_cov" true)
    (vs_enable_looking "gr_main_arena_cov" true)
    (vs_enable_targeting "gr_main_arena_cov" true)
    (vs_enable_moving "gr_main_arena_cov" true)
    (sleep 1)
    (if dialogue 
        (print "brute: (battle roar) we do the prophets' bidding! show no fear!"))
    (vs_play_line brute_01 true sc130_0270)
    (vs_release_all)
)

(script dormant void md_040_brute_advance_01
    (vs_cast "gr_main_arena_cov" false 10 "sc130_0340")
    (set brute_02 (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_main_arena_cov" true)
    (vs_enable_looking "gr_main_arena_cov" true)
    (vs_enable_targeting "gr_main_arena_cov" true)
    (vs_enable_moving "gr_main_arena_cov" true)
    (sleep 1)
    (if dialogue 
        (print "fem_marine: fall back! i repeat: fall back to the top of the ridge!"))
    (sleep (ai_play_line_on_object none sc130_0350))
    (sleep 30)
    (set s_waypoint_index 5)
    (if dialogue 
        (print "brute: courage, warriors! take this hill or die upon it!"))
    (vs_play_line brute_02 true sc130_0340)
    (vs_release_all)
)

(script dormant void md_040_brute_advance_02
    (vs_cast "gr_main_arena_cov" true 10 "sc130_0330")
    (set brute_03 (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_main_arena_cov" true)
    (vs_enable_looking "gr_main_arena_cov" true)
    (vs_enable_targeting "gr_main_arena_cov" true)
    (vs_enable_moving "gr_main_arena_cov" true)
    (sleep 1)
    (if dialogue 
        (print "brute: forward! grind their bones beneath your feet!"))
    (vs_play_line brute_03 true sc130_0330)
    (vs_release_all)
)

(script dormant void md_050_phantom
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep 1)
    (if dialogue 
        (print "mickey (radio): more phantoms! look sharp!"))
    (vs_play_line ai_mickey true sc130_0360)
    (vs_release_all)
)

(script dormant void md_050_ridge_retreat_01
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (wake obj_defend_courtyard_clear)
    (sleep 1)
    (if dialogue 
        (print "fem_marine: we can't hold 'em! everyone get inside the building!"))
    (sleep (ai_play_line_on_object none sc130_0370))
    (sleep 10)
    (if dialogue 
        (print "mickey (radio): too many of 'em dutch! we gotta scoot!"))
    (sleep (ai_play_line ai_mickey sc130_0390))
    (set g_sc130_music03 false)
    (set g_sc130_music035 true)
    (set g_sc130_music036 true)
    (wake obj_oni_building_set)
    (wake md_060_lobby_conversation)
    (wake lobby_entry)
    (sleep (* 30.0 15.0))
    (if (<= g_lobby_obj_control 0) 
        (begin
            (if dialogue 
                (print "mickey (radio): dutch! inside the building! now! "))
            (sleep (ai_play_line ai_mickey sc130_0400))
        )
    )
    (vs_release_all)
)

(script dormant void md_060_lobby_conversation
    (set sergeant "sq_lobby_sarge/sarge")
    (ai_set_objective "gr_odst" "obj_lobby_allies")
    (set s_waypoint_index 6)
    (vs_cast "gr_lobby_allies_left" false 10 "sc130_0480")
    (set marine_03 (vs_role 1))
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant false)
    (vs_enable_targeting sergeant false)
    (vs_enable_moving sergeant false)
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey false)
    (vs_enable_targeting ai_mickey false)
    (vs_enable_moving ai_mickey false)
    (vs_enable_pathfinding_failsafe marine_03 true)
    (vs_enable_looking marine_03 false)
    (vs_enable_targeting marine_03 false)
    (vs_enable_moving marine_03 false)
    (sleep 1)
    (vs_go_to ai_mickey true "ps_lobby_entry_odst/run_01")
    (vs_go_to ai_mickey true "ps_lobby_entry_odst/run_02")
    (sleep_until (volume_test_players "tv_lobby_02") 1)
    (device_group_set "dm_lobby_door_01" "dg_lobby_door" 0.0)
    (ai_player_dialogue_enable false)
    (ai_dialogue_enable false)
    (vs_go_to_and_face ai_mickey false "ps_lobby_entry_odst/stand_01" "ps_lobby_entry_odst/face_01")
    (if dialogue 
        (print "sergeant: hurry up, men! check those charges!"))
    (vs_play_line sergeant true sc130_0440)
    (sleep 10)
    (if dialogue 
        (print "mickey (radio): waitï¿½ what? more explosives?!"))
    (vs_play_line ai_mickey true sc130_0450)
    (sleep 10)
    (if dialogue 
        (print "dutch: yeah, what gives? i thought we were supposed to protect this building!"))
    (sound_impulse_start "sound\dialog\atlas\sc130\mission\sc130_0455_dut" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc130\mission\sc130_0455_dut"))
    (sleep 10)
    (wake lobby_breach_sound_01)
    (if dialogue 
        (print "sergeant: i have orders to deny enemy access to all classifed data housed in this facilty! you donï¿½t like it? jump yer butts back into orbit!"))
    (vs_play_line sergeant true sc130_0460)
    (sleep 10)
    (if dialogue 
        (print "mickey (radio): only thing i don't like is that our butts are currently inside this facility..."))
    (vs_play_line ai_mickey true sc130_0470)
    (sleep 10)
    (wake lobby_breach)
    (if dialogue 
        (print "marine_03: they're cutting-through the doors!"))
    (vs_play_line marine_03 true sc130_0480)
    (sleep 10)
    (if dialogue 
        (print "sergeant: settle-down, find some cover!"))
    (vs_play_line sergeant true sc130_0490)
    (sleep 10)
    (if 
        (and
            (not 
                (or
                    (vehicle_test_seat_unit "v_lobby_turret" none (player0))
                    (vehicle_test_seat_unit "v_lobby_turret" none (player1))
                    (vehicle_test_seat_unit "v_lobby_turret" none (player2))
                    (vehicle_test_seat_unit "v_lobby_turret" none (player3))
                )
            )
            (> (object_get_health "v_lobby_turret") 0.0)
        ) 
            (begin
                (if dialogue 
                    (print "cop: and someone man that turret!"))
                (vs_play_line sergeant true sc130_0495)
                (sleep 10)
            )
    )
    (game_save)
    (if dialogue 
        (print "sergeant: here they come! watch the crossfire!"))
    (vs_play_line sergeant true sc130_0510)
    (ai_cannot_die "sq_lobby_sarge" false)
    (ai_player_dialogue_enable true)
    (vs_release_all)
)

(script dormant void lobby_breach_sound_01
    (sleep 115)
    (if dialogue 
        (print "sergeant: here they come! watch the crossfire!"))
    (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\brutes_behind_doors_left" "dm_lobby_door_01" 1.0)
    (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\brutes_behind_doors_right" "dm_lobby_door_02" 1.0)
)

(script static void turret_dialogue_left
    (begin_random
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_left_01
                    (> (object_get_health "v_lobby_turret") 0.0)
                    (or
                        (vehicle_test_seat_unit "v_lobby_turret" none (player0))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player1))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player2))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player3))
                    )
                ) 
                    (begin
                        (if dialogue 
                            (print "sergeant: left side, trooper! bring that turret 'round!"))
                        (ai_play_line sergeant sc130_0540)
                        (set b_turret_left_01 false)
                        (set b_turret_line_played true)
                    )
            )
        )
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_left_02
                ) 
                    (begin
                        (if dialogue 
                            (print "sergeant: they're pouring-in to the left! adjust your fire!"))
                        (ai_play_line sergeant sc130_0550)
                        (set b_turret_left_02 false)
                        (set b_turret_line_played true)
                    )
            )
        )
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_left_03
                ) 
                    (begin
                        (if dialogue 
                            (print "mickey (radio): left side, dutch!"))
                        (ai_play_line ai_mickey sc130_0600)
                        (set b_turret_left_03 false)
                        (set b_turret_line_played true)
                    )
            )
        )
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_left_04
                ) 
                    (begin
                        (if dialogue 
                            (print "mickey (radio): they're pouring-in to the left!"))
                        (ai_play_line ai_mickey sc130_0610)
                        (set b_turret_left_04 false)
                        (set b_turret_line_played true)
                    )
            )
        )
    )
    (sleep 1)
    (set b_turret_line_played false)
)

(script static void turret_dialogue_right
    (begin_random
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_right_01
                    (> (object_get_health "v_lobby_turret") 0.0)
                    (or
                        (vehicle_test_seat_unit "v_lobby_turret" none (player0))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player1))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player2))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player3))
                    )
                ) 
                    (begin
                        (if dialogue 
                            (print "sergeant: trooper! bring that turret right!"))
                        (ai_play_line sergeant sc130_0520)
                        (set b_turret_right_01 false)
                        (set b_turret_line_played true)
                    )
            )
        )
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_right_02
                    (> (object_get_health "v_lobby_turret") 0.0)
                    (or
                        (vehicle_test_seat_unit "v_lobby_turret" none (player0))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player1))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player2))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player3))
                    )
                ) 
                    (begin
                        (if dialogue 
                            (print "sergeant: where's that fifty? we got hostiles right!"))
                        (ai_play_line sergeant sc130_0530)
                        (set b_turret_right_02 false)
                        (set b_turret_line_played true)
                    )
            )
        )
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_right_03
                    (> (object_get_health "v_lobby_turret") 0.0)
                    (or
                        (vehicle_test_seat_unit "v_lobby_turret" none (player0))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player1))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player2))
                        (vehicle_test_seat_unit "v_lobby_turret" none (player3))
                    )
                ) 
                    (begin
                        (if dialogue 
                            (print "mickey (radio): dutch! scan right!"))
                        (ai_play_line ai_mickey sc130_0580)
                        (set b_turret_right_03 false)
                        (set b_turret_line_played true)
                    )
            )
        )
        (begin
            (if 
                (and
                    (not b_turret_line_played)
                    b_turret_right_04
                ) 
                    (begin
                        (if dialogue 
                            (print "mickey (radio): focus your fire to the right!"))
                        (ai_play_line ai_mickey sc130_0590)
                        (set b_turret_right_04 false)
                        (set b_turret_line_played true)
                    )
            )
        )
    )
    (sleep 1)
    (set b_turret_line_played false)
)

(script dormant void md_060_rear_attack_sarge
    (vs_release_all)
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant true)
    (vs_enable_targeting sergeant true)
    (vs_enable_moving sergeant true)
    (sleep 1)
    (if dialogue 
        (print "sergeant: phantom dropping reinforcements! cover our rear, trooper!"))
    (sleep (ai_play_line sergeant sc130_0560))
    (set g_sc130_music04 false)
    (set g_sc130_music05 false)
    (vs_release_all)
)

(script dormant void md_060_rear_attack_end
    (sleep_until (> (ai_task_count "obj_lobby_back_cov/gt_lobby_back_cov") 0) 1)
    (sleep (* 30.0 45.0))
    (sleep_until (= (ai_task_count "obj_lobby_back_cov/gt_lobby_back_cov") 0) 1)
    (sleep (random_range (* 30.0 2.0) (* 30.0 5.0)))
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep 1)
    (if dialogue 
        (print "mickey (radio): that's the last of 'em, dutch! come to my position!"))
    (vs_play_line ai_mickey true sc130_0630)
    (vs_release_all)
)

(script dormant void md_060_elev_arrives_sarge
    (vs_cast "sq_lobby_cop_01/cop_elevator" true 10 "sc130_0670")
    (set cop_elevator (vs_role 1))
    (vs_enable_pathfinding_failsafe cop_elevator true)
    (vs_enable_looking cop_elevator true)
    (vs_enable_targeting cop_elevator true)
    (vs_enable_moving cop_elevator true)
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep 1)
    (if dialogue 
        (print "cop: everyone on the elevator! i put enough charges in the shaft to blow this building twice!"))
    (vs_play_line cop_elevator true sc130_0670)
    (sleep 10)
    (set g_lobby_front 3)
    (wake md_060_elev_entry_reminder)
    (sleep_until (volume_test_players "tv_lobby_elev") 1)
    (if dialogue 
        (print "mickey: alright, that's it! transfer the detonation codes to my comm! if anyone's taking this place out, it's gonna be me!"))
    (vs_play_line ai_mickey true sc130_0675)
    (wake md_070_elev_ride)
    (vs_release_all)
)

(script dormant void md_060_elev_entry_reminder
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep (* 30.0 10.0))
    (if (not (volume_test_players "tv_lobby_elev")) 
        (begin
            (if dialogue 
                (print "mickey (radio): c'mon, dutch! we're heading top-side!"))
            (vs_play_line ai_mickey true sc130_0770)
        )
    )
    (sleep (* 30.0 10.0))
    (if (not (volume_test_players "tv_lobby_elev")) 
        (begin
            (if dialogue 
                (print "mickey (radio): on the elevator, dutch! now!"))
            (vs_play_line ai_mickey true sc130_0780)
        )
    )
    (vs_release_all)
)

(script dormant void md_070_elev_ride
    (sleep_until (volume_test_players "tv_lobby_03") 1)
    (vs_cast "sq_lobby_cop_01/cop_elevator" true 10 "sc130_0790")
    (set cop_elevator (vs_role 1))
    (ai_player_dialogue_enable false)
    (ai_dialogue_enable false)
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep 1)
    (if dialogue 
        (print "cop (radio): evac bird's gonna meet us on the roof!"))
    (vs_play_line cop_elevator true sc130_0790)
    (sleep 10)
    (sleep_until (volume_test_players "tv_lobby_04") 1)
    (if dialogue 
        (print "dutch (radio): where the heck did these buggers come from?!"))
    (sound_impulse_start "sound\dialog\atlas\sc130\mission\sc130_0800_dut" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc130\mission\sc130_0800_dut"))
    (sleep 10)
    (if dialogue 
        (print "cop: underground tunnels are filled with the damn things!"))
    (vs_play_line cop_elevator true sc130_0805)
    (sleep 10)
    (set g_sc130_music06_alt true)
    (if dialogue 
        (print "mickey: finally! a good reason to blow this building up!"))
    (vs_play_line ai_mickey true sc130_0806)
    (ai_player_dialogue_enable true)
    (ai_dialogue_enable true)
    (vs_release_all)
)

(script dormant void md_080_exit
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep 1)
    (if dialogue 
        (print "mickey (radio): there's our ride! go, go, go!"))
    (vs_play_line ai_mickey true sc130_0810)
    (wake md_080_exit_reminder)
    (vs_release_all)
)

(script dormant void md_080_exit_reminder
    (vs_enable_pathfinding_failsafe ai_mickey true)
    (vs_enable_looking ai_mickey true)
    (vs_enable_targeting ai_mickey true)
    (vs_enable_moving ai_mickey true)
    (sleep (* 30.0 8.0))
    (if (not 
        (or
            (vehicle_test_seat_unit pelican_01 none (player0))
            (vehicle_test_seat_unit pelican_01 none (player1))
            (vehicle_test_seat_unit pelican_01 none (player2))
            (vehicle_test_seat_unit pelican_01 none (player3))
        )
    ) 
        (begin
            (if dialogue 
                (print "mickey (radio): let's get out of here, dutch! come on!"))
            (vs_play_line ai_mickey true sc130_0820)
        )
    )
    (sleep (* 30.0 8.0))
    (if (not 
        (or
            (vehicle_test_seat_unit pelican_01 none (player0))
            (vehicle_test_seat_unit pelican_01 none (player1))
            (vehicle_test_seat_unit pelican_01 none (player2))
            (vehicle_test_seat_unit pelican_01 none (player3))
        )
    ) 
        (begin
            (if dialogue 
                (print "mickey (radio): building's lost! nothing more we can do!"))
            (vs_play_line ai_mickey true sc130_0830)
        )
    )
    (sleep (* 30.0 8.0))
    (if (not 
        (or
            (vehicle_test_seat_unit pelican_01 none (player0))
            (vehicle_test_seat_unit pelican_01 none (player1))
            (vehicle_test_seat_unit pelican_01 none (player2))
            (vehicle_test_seat_unit pelican_01 none (player3))
        )
    ) 
        (begin
            (if dialogue 
                (print "mickey (radio): dutch, you dumb-ass! get on this pelican! now!"))
            (vs_play_line ai_mickey true sc130_0840)
        )
    )
    (vs_release_all)
)

(script static boolean obj_bodst__0_4
    (= (device_group_get "dg_charge_03") 1.0)
)

(script static boolean obj_bodst__0_5
    (= (device_group_get "dg_charge_02") 1.0)
)

(script static boolean obj_bodst__0_6
    (= (device_group_get "dg_charge_01") 1.0)
)

(script static boolean obj_ballie_0_12
    (= g_bridge_allies_advance 1)
)

(script static boolean obj_bodst__0_13
    (= g_bridge_allies_advance 1)
)

(script static boolean obj_bcop_b_0_14
    (= g_bridge_allies_advance 1)
)

(script static boolean obj_bwrait_1_8
    (>= g_bridge_obj_control 5)
)

(script static boolean obj_bcov_a_1_9
    (>= g_bridge_obj_control 5)
)

(script static boolean obj_bcov_t_1_10
    (>= g_bridge_obj_control 4)
)

(script static boolean obj_bcov_s_1_11
    (>= g_bridge_obj_control 3)
)

(script static boolean obj_bwrait_1_12
    (volume_test_players "tv_bridge_00")
)

(script static boolean obj_bwrait_1_13
    (volume_test_players "tv_bridge_00")
)

(script static boolean obj_bwrait_1_14
    (volume_test_players "tv_bridge_00")
)

(script static boolean obj_bcov_a_1_15
    (>= g_bridge_obj_control 5)
)

(script static boolean obj_bcov_p_1_16
    (volume_test_players "tv_bridge_00")
)

(script static boolean obj_bwrait_1_17
    (and
        (volume_test_players "tv_bridge")
        (>= g_bridge_obj_control 5)
    )
)

(script static boolean obj_bwrait_1_20
    (>= g_bridge_obj_control 4)
)

(script static boolean obj_bwrait_1_21
    (>= g_bridge_obj_control 2)
)

(script static boolean obj_bwrait_1_22
    (>= g_bridge_obj_control 4)
)

(script static boolean obj_bcov_a_1_23
    (>= g_bridge_obj_control 5)
)

(script static boolean obj_bbansh_1_32
    (volume_test_players "tv_bridge_00")
)

(script static boolean obj_bbansh_1_33
    (>= g_bridge_obj_control 5)
)

(script static boolean obj_mallie_2_3
    (= g_main_arena_retreat 0)
)

(script static boolean obj_mallie_2_8
    (= g_main_arena_retreat 0)
)

(script static boolean obj_mallie_2_10
    (= g_main_arena_retreat 0)
)

(script static boolean obj_mallie_2_12
    (< g_main_arena_obj_control 2)
)

(script static boolean obj_mallie_2_13
    (>= g_main_arena_obj_control 2)
)

(script static boolean obj_mmicke_2_14
    (>= g_main_arena_obj_control 2)
)

(script static boolean obj_mmicke_2_22
    (= g_main_arena_retreat 1)
)

(script static boolean obj_mmicke_2_23
    (and
        (= g_phantom_02_jackals true)
        (> (ai_task_count "obj_main_arena_cov/gt_phantom_02_jackal") 0)
    )
)

(script static boolean obj_mallie_2_24
    (and
        (= g_phantom_02_jackals true)
        (> (ai_task_count "obj_main_arena_cov/gt_phantom_02_jackal") 0)
    )
)

(script static boolean obj_mallie_2_25
    (<= (ai_living_count "obj_main_arena_cov") 0)
)

(script static boolean obj_mallie_2_26
    (<= (ai_living_count "obj_main_arena_cov") 0)
)

(script static boolean obj_mallie_2_27
    (<= (ai_living_count "obj_main_arena_cov") 0)
)

(script static boolean obj_mallie_2_28
    (<= (ai_living_count "obj_main_arena_allies") 1)
)

(script static boolean obj_mcov_l_3_5
    (= (ai_task_count "obj_main_arena_allies/gt_marines_left") 1)
)

(script static boolean obj_mwrait_3_12
    (volume_test_players "tv_main_arena_mega_upper")
)

(script static boolean obj_mwrait_3_15
    (volume_test_players "tv_main_arena_mega_upper")
)

(script static boolean obj_mcov_r_3_16
    (<= (ai_task_count "obj_main_arena_allies/gt_marines_right") 1)
)

(script static boolean obj_mcov_c_3_17
    (<= (ai_task_count "obj_main_arena_allies/gt_marines_center") 1)
)

(script static boolean obj_mcov_c_3_18
    (= g_main_arena_retreat 1)
)

(script static boolean obj_mcov_r_3_21
    (= g_main_arena_retreat 1)
)

(script static boolean obj_mcov_l_3_24
    (= g_main_arena_retreat 1)
)

(script static boolean obj_mwrait_3_27
    (volume_test_players "tv_a_01")
)

(script static boolean obj_mwrait_3_28
    (volume_test_players "tv_a_03")
)

(script static boolean obj_mcov_p_3_30
    (volume_test_players "tv_b_01")
)

(script static boolean obj_mcov_p_3_31
    (volume_test_players "tv_b_02")
)

(script static boolean obj_mcov_p_3_32
    (volume_test_players "tv_b_03")
)

(script static boolean obj_mcov_p_3_33
    (volume_test_players "tv_c_01")
)

(script static boolean obj_mcov_p_3_34
    (volume_test_players "tv_c_02")
)

(script static boolean obj_mcov_p_3_35
    (volume_test_players "tv_c_03")
)

(script static boolean obj_mcov_p_3_36
    (volume_test_players "tv_d_01")
)

(script static boolean obj_mcov_p_3_37
    (volume_test_players "tv_d_02")
)

(script static boolean obj_mcov_p_3_38
    (volume_test_players "tv_d_03")
)

(script static boolean obj_mphant_3_44
    (>= g_main_arena_obj_control 2)
)

(script static boolean obj_mphant_3_45
    (>= g_main_arena_obj_control 2)
)

(script static boolean obj_mcov_p_3_46
    (>= g_main_arena_obj_control 2)
)

(script static boolean obj_mcov_l_3_51
    (= g_main_arena_retreat 1)
)

(script static boolean obj_mcov_r_3_52
    (= g_main_arena_retreat 1)
)

(script static boolean obj_mcov_c_3_53
    (= g_main_arena_retreat 1)
)

(script static boolean obj_mphant_3_54
    (= g_phantom_02_jackals true)
)

(script static boolean obj_mgt_ph_3_55
    (<= g_main_arena_obj_control 1)
)

(script static boolean obj_mphant_3_56
    (>= g_main_arena_obj_control 2)
)

(script static boolean obj_mcov_p_4_2
    (volume_test_players "tv_b_01")
)

(script static boolean obj_mcov_p_4_3
    (volume_test_players "tv_b_02")
)

(script static boolean obj_mcov_p_4_4
    (volume_test_players "tv_b_03")
)

(script static boolean obj_mcov_p_4_5
    (volume_test_players "tv_c_01")
)

(script static boolean obj_mcov_p_4_6
    (volume_test_players "tv_c_02")
)

(script static boolean obj_mcov_p_4_7
    (volume_test_players "tv_c_03")
)

(script static boolean obj_mcov_p_4_8
    (volume_test_players "tv_d_01")
)

(script static boolean obj_mcov_p_4_9
    (volume_test_players "tv_d_02")
)

(script static boolean obj_mcov_p_4_10
    (volume_test_players "tv_d_03")
)

(script static boolean obj_lodst__5_2
    (= g_lobby_front 0)
)

(script static boolean obj_llobby_5_4
    (= g_lobby_front 0)
)

(script static boolean obj_llobby_5_5
    (= g_lobby_front 1)
)

(script static boolean obj_lmarin_5_6
    (= g_lobby_front 1)
)

(script static boolean obj_lodst__5_7
    (= g_lobby_front 1)
)

(script static boolean obj_lmarin_5_8
    (= g_lobby_front 2)
)

(script static boolean obj_llobby_5_9
    (= g_lobby_front 2)
)

(script static boolean obj_lodst__5_10
    (= g_lobby_front 2)
)

(script static boolean obj_lodst__5_13
    (= g_lobby_front 3)
)

(script static boolean obj_lsarge_5_14
    (= g_lobby_front 3)
)

(script static boolean obj_lmarin_5_15
    (= g_lobby_front 0)
)

(script static boolean obj_llobby_5_16
    (<= (ai_task_count "obj_lobby_back_cov/gt_lobby_back_right_cov") 2)
)

(script static boolean obj_lsarge_5_18
    (= g_lobby_front 1)
)

(script static boolean obj_lsarge_5_19
    (= g_lobby_front 2)
)

(script static boolean obj_llobby_5_20
    (= g_lobby_front 3)
)

(script static boolean obj_lsarge_5_21
    (= g_lobby_front 0)
)

(script static boolean obj_lodst__5_22
    (and
        (= g_lobby_front 1)
        (<= (ai_task_count "obj_lobby_back_cov/gt_lobby_back_cov") 0)
    )
)

(script static boolean obj_lmarin_5_23
    (= g_lobby_front 3)
)

(script static boolean obj_llobby_8_17
    (<= (ai_task_count "obj_lobby_back_cov/gt_lobby_back_cov") 4)
)

(script static boolean obj_lbugge_9_1
    (>= g_lobby_obj_control 5)
)

(script static boolean obj_lbugge_9_2
    (>= g_lobby_obj_control 4)
)

(script static boolean obj_lbugge_9_3
    (>= g_lobby_obj_control 3)
)

(script static boolean obj_lbugge_9_4
    (volume_test_players "tv_lobby_test")
)

(script static boolean obj_lgt_ri_9_6
    (volume_test_players "tv_lobby_elev")
)

(script static boolean obj_rbrute_10_16
    (<= (ai_task_count "obj_roof_cov/gt_roof_cov") 4)
)

(script static boolean obj_rallie_11_4
    (and
        (<= (ai_task_count "obj_roof_cov/gt_roof_cov") 0)
        (>= g_roof_obj_control 2)
    )
)

(script static boolean obj_rallie_11_6
    (< g_roof_obj_control 2)
)

(script static boolean obj_rodst__11_7
    (= g_odst_enter_pelican true)
)

(script static boolean obj_rodst__11_9
    (<= (ai_living_count "obj_roof_cov") 4)
)

(script static boolean obj_shero__12_23
    (<= (ai_task_count "obj_survival_a/remaining") 3)
)

(script static boolean obj_sbonus_12_25
    b_sur_bonus_round_running
)

(script static boolean obj_sfollo_12_35
    (and
        (<= (ai_task_count "obj_survival_a/hero_follow") 0)
        (<= (ai_task_count "obj_survival_a/remaining") 3)
    )
)

(script static boolean obj_shero__13_22
    (<= (ai_task_count "obj_survival_b/remaining") 3)
)

(script static boolean obj_sinfan_13_23
    (and
        (<= (ai_task_count "obj_survival_b/hero_follow") 0)
        (<= (ai_task_count "obj_survival_b/remaining") 3)
    )
)

(script static boolean obj_sbonus_13_24
    b_sur_bonus_round_running
)

(script static boolean obj_lcov_l_14_20
    (= g_lobby_surge true)
)

(script startup void sc130_insertion_stub
    (if debug 
        (print "sc130 insertion stub"))
)

(script static void ins_bridge
    (set g_insertion_index 1)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_000_005")
    (sleep 1)
)

(script static void ins_main_arena
    (if debug 
        (print "insertion point : main_arena"))
    (set g_insertion_index 2)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_000_005_010")
    (sleep 1)
    (set g_bridge_obj_control 100)
    (set g_bridge_garbage_collect true)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "use detonator in watchtower"))
    (objectives_show_up_to 1)
    (objectives_finish_up_to 1)
    (wake obj_defend_courtyard_set)
    (set s_waypoint_index 3)
    (print "teleporting players...")
    (object_teleport (player0) "fl_main_arena_player0")
    (object_teleport (player1) "fl_main_arena_player1")
    (object_teleport (player2) "fl_main_arena_player2")
    (object_teleport (player3) "fl_main_arena_player3")
    (sleep 1)
    (player0_set_pitch -12.0 0)
    (player1_set_pitch -12.0 0)
    (player2_set_pitch -12.0 0)
    (player3_set_pitch -12.0 0)
    (unit_add_equipment (player0) "insertion_profile" true true)
    (unit_add_equipment (player1) "insertion_profile" true true)
    (unit_add_equipment (player2) "insertion_profile" true true)
    (unit_add_equipment (player3) "insertion_profile" true true)
    (sleep 5)
    (print "placing allies...")
    (ai_place "sq_bridge_odst")
    (ai_cannot_die "sq_bridge_odst" true)
    (set ai_mickey "sq_bridge_odst/odst")
    (chud_show_ai_navpoint "sq_bridge_odst" "mickey" true 0.15)
    (ai_teleport "sq_bridge_odst" "ps_bridge_odst/main_arena_ins")
    (set g_bridge_allies_advance 1)
    (ai_place "sq_bridge_wraith_01")
    (ai_place "sq_bridge_wraith_02")
    (ai_place "sq_bridge_cov_06")
    (ai_place "sq_bridge_cov_07")
    (cinematic_snap_from_black)
    (game_save_immediate)
    (device_set_power "c_laptop_01" 1.0)
    (sleep 1)
    (if dialogue 
        (print "superintendant detonation"))
    (device_group_set "dm_laptop_01" "dg_laptop_01" 1.0)
    (bridge_explode)
)

(script static void ins_lobby
    (if debug 
        (print "insertion point : lobby"))
    (set g_insertion_index 3)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_000_010_020")
    (sleep 1)
    (set g_bridge_obj_control 100)
    (set g_main_arena_obj_control 100)
    (set g_bridge_garbage_collect true)
    (set g_main_arena_garbage_collect true)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "fall back, defend inner courtyard"))
    (objectives_show_up_to 2)
    (objectives_finish_up_to 2)
    (wake obj_oni_building_set)
    (set s_waypoint_index 6)
    (print "teleporting players...")
    (object_teleport (player0) "fl_lobby_player0")
    (object_teleport (player1) "fl_lobby_player1")
    (object_teleport (player2) "fl_lobby_player2")
    (object_teleport (player3) "fl_lobby_player3")
    (sleep 1)
    (player0_set_pitch -12.0 0)
    (player1_set_pitch -12.0 0)
    (player2_set_pitch -12.0 0)
    (player3_set_pitch -12.0 0)
    (unit_add_equipment (player0) "insertion_profile" true true)
    (unit_add_equipment (player1) "insertion_profile" true true)
    (unit_add_equipment (player2) "insertion_profile" true true)
    (unit_add_equipment (player3) "insertion_profile" true true)
    (sleep 5)
    (print "placing allies...")
    (ai_place "sq_lobby_odst")
    (ai_cannot_die "sq_lobby_odst" true)
    (set ai_mickey "sq_lobby_odst/odst")
    (chud_show_ai_navpoint "sq_lobby_odst" "mickey" true 0.15)
    (object_create_folder "eq_sp_lobby")
    (object_create_folder "wp_sp_lobby")
    (object_create_folder "v_sp_lobby")
    (object_create_folder "cr_sp_lobby")
    (device_set_position_immediate "dm_elev_side_01" 0.6)
    (device_set_position_immediate "dm_elev_side_02" 0.752)
    (ai_place "sq_lobby_allies_left")
    (ai_place "sq_lobby_sarge")
    (ai_force_active "gr_lobby_sarge" true)
    (device_set_power "dm_010_door_left" 1.0)
    (device_set_position_immediate "dm_010_door_left" 1.0)
    (device_set_power "dm_010_door_right" 1.0)
    (device_set_position_immediate "dm_010_door_right" 1.0)
    (sleep 1)
    (cinematic_snap_from_black)
    (game_save_immediate)
    (wake lobby_breach)
    (set sergeant "sq_lobby_sarge/sarge")
    (vs_enable_pathfinding_failsafe sergeant true)
    (vs_enable_looking sergeant false)
    (vs_enable_targeting sergeant false)
    (vs_enable_moving sergeant false)
    (sleep (* 30.0 5.0))
    (if dialogue 
        (print "sergeant: here they come! watch the crossfire!"))
    (vs_play_line sergeant true sc130_0510)
    (vs_release_all)
)

(script command_script void cs_guard
    (cs_abort_on_damage true)
    (cs_abort_on_combat_status 4)
    (sleep_until (volume_test_players "tv_null"))
)

(script static void ins_roof
    (if debug 
        (print "insertion point : roof"))
    (set g_insertion_index 4)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_000_010_020")
    (sleep 1)
    (set g_bridge_obj_control 100)
    (set g_main_arena_obj_control 100)
    (set g_lobby_obj_control 100)
    (set g_bridge_garbage_collect true)
    (set g_main_arena_garbage_collect true)
    (set g_lobby_breached true)
    (set g_lobby_front_garbage_collect true)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "take elevator to roof for evac"))
    (objectives_show_up_to 4)
    (objectives_finish_up_to 4)
    (set s_waypoint_index 7)
    (print "teleporting players...")
    (object_teleport (player0) "fl_roof_player0")
    (object_teleport (player1) "fl_roof_player1")
    (object_teleport (player2) "fl_roof_player2")
    (object_teleport (player3) "fl_roof_player3")
    (sleep 1)
    (player0_set_pitch -12.0 0)
    (player1_set_pitch -12.0 0)
    (player2_set_pitch -12.0 0)
    (player3_set_pitch -12.0 0)
    (unit_add_equipment (player0) "insertion_profile" true true)
    (unit_add_equipment (player1) "insertion_profile" true true)
    (unit_add_equipment (player2) "insertion_profile" true true)
    (unit_add_equipment (player3) "insertion_profile" true true)
    (sleep 5)
    (print "placing allies...")
    (ai_place "sq_roof_odst")
    (ai_cannot_die "sq_roof_odst" true)
    (set ai_mickey "sq_roof_odst/odst")
    (chud_show_ai_navpoint "sq_roof_odst" "mickey" true 0.15)
    (object_create_folder "cr_sp_roof")
    (cinematic_snap_from_black)
    (game_save_immediate)
)

(script command_script void abort_cs
    (sleep 1)
)

(script startup void sc130_startup
    (if debug 
        (print "sc130 mission script"))
    (kill_volume_disable "kill_bridge_detonation")
    (kill_volume_disable "kill_lobby_entry")
    (kill_volume_disable "kill_lobby_breach")
    (wake sur_kill_vol_disable)
    (fade_out 0.0 0.0 0.0 0)
    (if 
        (and
            (not editor)
            (> (player_count) 0)
        ) 
            (start) (begin
                (fade_in 0.0 0.0 0.0 0)
            )
    )
)

(script static void start
    (if (not (campaign_survival_enabled)) 
        (wake sc130_first))
    (cond
        ((= (game_insertion_point_get) 0)
            (ins_bridge)
        )
        ((= (game_insertion_point_get) 1)
            (ins_main_arena)
        )
        ((= (game_insertion_point_get) 2)
            (ins_lobby)
        )
        ((= (game_insertion_point_get) 3)
            (ins_roof)
        )
        ((= (game_insertion_point_get) 4)
            (wake sc130_survival_mode_a)
        )
        ((= (game_insertion_point_get) 5)
            (wake sc130_survival_mode_b)
        )
    )
)

(script dormant void sc130_first
    (wake player0_sc130_waypoints)
    (wake player1_sc130_waypoints)
    (wake player2_sc130_waypoints)
    (wake player3_sc130_waypoints)
    (wake player0_award_tourist)
    (if (coop_players_2) 
        (wake player1_award_tourist))
    (if (coop_players_3) 
        (wake player2_award_tourist))
    (if (coop_players_4) 
        (wake player3_award_tourist))
    (wake sc130_player_dialogue_check)
    (wake s_coop_resume)
    (ai_allegiance human player)
    (ai_allegiance player human)
    (fade_out 0.0 0.0 0.0 0)
    (gp_integer_set "gp_current_scene" 130)
    (pda_set_active_pda_definition "sc130")
    (player_set_fourth_wall_enabled (player0) false)
    (player_set_fourth_wall_enabled (player1) false)
    (player_set_fourth_wall_enabled (player2) false)
    (player_set_fourth_wall_enabled (player3) false)
    (wake pda_breadcrumbs)
    (device_group_set "dm_charge_05" "dg_charge_context" 1.0)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_005_010" false)
    (soft_ceiling_enable "survival" false)
    (object_create_folder "eq_sp_bridge")
    (object_create_folder "wp_sp_bridge")
    (object_create_folder "v_sp_bridge")
    (wake zone_set_control)
    (wake garbage_collect)
    (wake level_exit)
    (sleep_until (>= g_insertion_index 1) 1)
    (if (= g_insertion_index 1) 
        (wake enc_bridge))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_main_arena")
            (>= g_insertion_index 2)
        ) 
    1)
    (if (<= g_insertion_index 2) 
        (wake enc_main_arena))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_lobby")
            (>= g_insertion_index 3)
        ) 
    1)
    (if (<= g_insertion_index 3) 
        (wake enc_lobby))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_roof")
            (>= g_insertion_index 4)
        ) 
    1)
    (if (<= g_insertion_index 4) 
        (wake enc_roof))
)

(script dormant void enc_bridge
    (wake s_sc130_music01)
    (wake s_sc130_music02)
    (if (= g_play_cinematics true) 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (sound_class_set_gain "" 0.0 0)
                    (sound_class_set_gain "mus" 1.0 0)
                    (sound_impulse_start "sound\cinematics\atlas\sc130\foley\sc130_int_fade_in_11sec" none 1.0)
                    (cinematic_snap_to_black)
                    (if debug 
                        (print "sc130_in_sc"))
                    (sleep 60)
                    (cinematic_set_title "title_1")
                    (sleep 60)
                    (cinematic_set_title "title_2")
                    (sleep 60)
                    (cinematic_set_title "title_3")
                    (sound_looping_start "levels\atlas\sc130\music\sc130_music01" none 1.0)
                    (sleep (* 30.0 5.0))
                    (sc130_in_sc)
                )
            )
            (cinematic_skip_stop)
        )
    )
    (player0_set_pitch -12.0 0)
    (player1_set_pitch -12.0 0)
    (player2_set_pitch -12.0 0)
    (player3_set_pitch -12.0 0)
    (sleep 1)
    (cinematic_snap_to_white)
    (sc130_in_sc_cleanup)
    (data_mine_set_mission_segment "sc130_10_bridge")
    (set g_sc130_music01 true)
    (chud_show_crosshair true)
    (wake obj_arm_charges_set)
    (wake obj_arm_charges_clear)
    (wake bridge_place_01)
    (wake md_010_charge_01)
    (wake md_010_charge_reminder_01)
    (wake md_010_charge_reminder_02)
    (wake md_010_charge_02)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_005_010" true)
    (sleep 1)
    (cinematic_snap_from_white)
    (sleep_until (volume_test_players "tv_bridge_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_bridge_obj_control 1)
    (wake bridge_place_02)
    (sleep_until (volume_test_players "tv_bridge_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_bridge_obj_control 2)
    (sleep_until (volume_test_players "tv_bridge_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_bridge_obj_control 3)
    (wake md_010_final_charge)
    (sleep_until (volume_test_players "tv_bridge_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_bridge_obj_control 4)
    (sleep_until (volume_test_players "tv_bridge_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_bridge_obj_control 5)
    (wake bridge_place_03)
    (game_save)
)

(script dormant void bridge_place_01
    (ai_place "sq_bridge_wraith_01")
    (ai_place "sq_bridge_wraith_02")
    (ai_place "sq_bridge_wraith_03")
    (ai_place "sq_bridge_cov_01")
    (ai_place "sq_bridge_cov_02")
    (ai_place "sq_bridge_cov_03")
    (ai_place "sq_bridge_cov_04")
    (ai_place "sq_bridge_cov_05")
    (ai_place "sq_bridge_odst")
    (ai_place "sq_bridge_allies_01")
    (ai_place "sq_bridge_allies_02")
    (ai_place "sq_bridge_cop_01")
    (ai_place "sq_bridge_banshee_02")
    (ai_place "sq_bridge_banshee_03")
    (ai_cannot_die "sq_bridge_odst" true)
    (chud_show_ai_navpoint "sq_bridge_odst" "mickey" true 0.15)
    (wake odst_bridge_falloff)
    (ai_cannot_die "sq_bridge_cop_01" true)
    (object_cannot_take_damage "tower_base")
    (wake bridge_charge)
    (wake nav_point_charge)
    (bridge_explode)
)

(script command_script void cs_bridge_allies_initial_01
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_bridge_allies_initial/p0")
)

(script command_script void cs_bridge_allies_initial_02
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_bridge_allies_initial/p1")
)

(script dormant void bridge_place_02
    (sleep_until 
        (or
            (volume_test_players "tv_bridge_04")
            (volume_test_players "tv_bridge_00")
        ) 
    1)
    (ai_place "sq_phantom_01")
)

(script dormant void bridge_place_03
    (sleep (* 30.0 15.0))
    (ai_place "sq_bridge_banshee_01")
)

(script command_script void cs_bridge_wraith_shoot
    (cs_run_command_script "sq_bridge_wraith_01/gunner" abort_cs)
    (cs_run_command_script "sq_bridge_wraith_02/gunner" abort_cs)
    (cs_run_command_script "sq_bridge_wraith_03/gunner" abort_cs)
    (cs_run_command_script "sq_phantom_wraith_01/gunner" abort_cs)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_bridge_wraith/p0")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_bridge_wraith/p1")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_bridge_wraith/p2")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_bridge_wraith/p3")
                )
            )
            false
        )
    )
)

(script command_script void cs_phantom_01
    (if debug 
        (print "phantom 01"))
    (set phantom_01 (ai_vehicle_get_from_starting_location "sq_phantom_01/phantom"))
    (ai_place "sq_phantom_cov_01")
    (ai_place "sq_phantom_cov_02")
    (ai_place "sq_phantom_cov_03")
    (if (<= (ai_task_count "obj_bridge_cov/gt_bridge_wraith") 4) 
        (ai_place "sq_phantom_wraith_01"))
    (sleep 30)
    (vehicle_load_magic phantom_01 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_wraith_01/wraith"))
    (ai_vehicle_enter_immediate "sq_phantom_cov_01" phantom_01 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_cov_02" phantom_01 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_cov_03" phantom_01 phantom_p_mr_b)
    (sleep 1)
    (ai_set_objective "sq_phantom_01" "obj_bridge_cov")
    (ai_set_objective "gr_phantom_drop_01" "obj_bridge_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_01/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_to_and_face "ps_phantom_01/hover_01" "ps_phantom_01/face_01" 1.0)
    (unit_open phantom_01)
    (sleep 30)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_01/drop_01" "ps_phantom_01/face_01" 1.0)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (ai_set_objective "sq_phantom_wraith_01" "obj_bridge_cov")
    (sleep 30)
    (begin_random
        (begin
            (vehicle_unload phantom_01 phantom_p_rf)
            (sleep (random_range 5 15))
        )
        (begin
            (vehicle_unload phantom_01 phantom_p_rb)
            (sleep (random_range 5 15))
        )
        (begin
            (vehicle_unload phantom_01 phantom_p_mr_b)
            (sleep (random_range 5 15))
        )
    )
    (sleep 90)
    (cs_fly_to_and_face "ps_phantom_01/hover_01" "ps_phantom_01/face_01" 1.0)
    (unit_close phantom_01)
    (cs_vehicle_speed 0.2)
    (sleep (* 30.0 2.0))
    (cs_fly_to_and_face "ps_phantom_01/hover_02" "ps_phantom_01/face_02" 1.0)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_bridge_cov/gt_bridge_phantom") 2)
            (= (device_group_get "dg_laptop_01") 1.0)
        )
    )
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_01/hover_02b" "ps_phantom_01/face_02" 1.0)
    (cs_fly_by "ps_phantom_01/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_01/erase")
    (ai_erase ai_current_squad)
)

(script dormant void odst_bridge_falloff
    (sleep_until 
        (begin
            (if (volume_test_object "tv_odst" (ai_get_object "sq_bridge_odst/odst")) 
                (ai_bring_forward ai_mickey 5.0))
            (> g_main_arena_obj_control 0)
        ) 
    1)
)

(script dormant void bridge_charge
    (sleep_until (>= g_bridge_obj_control 3) 5 (* 30.0 25.0))
    (if 
        (and
            (= (device_group_get "dg_charge_01") 0.0)
            (not (volume_test_object "tv_odst" (ai_get_object "sq_bridge_odst/odst")))
        ) 
            (cs_run_command_script "sq_bridge_odst" sq_bridge_odst_charge_01))
    (sleep_until 
        (and
            (>= g_bridge_obj_control 4)
            (= (device_group_get "dg_charge_01") 1.0)
        ) 
    5 (* 30.0 25.0))
    (if 
        (and
            (= (device_group_get "dg_charge_02") 0.0)
            (not (volume_test_object "tv_odst" (ai_get_object "sq_bridge_odst/odst")))
        ) 
            (cs_run_command_script "sq_bridge_odst" sq_bridge_odst_charge_02))
    (sleep_until 
        (and
            (>= g_bridge_obj_control 5)
            (= (device_group_get "dg_charge_01") 1.0)
            (= (device_group_get "dg_charge_02") 1.0)
        ) 
    5)
    (if 
        (and
            (= (device_group_get "dg_charge_03") 0.0)
            (not (volume_test_object "tv_odst" (ai_get_object "sq_bridge_odst/odst")))
        ) 
            (cs_run_command_script "sq_bridge_odst" sq_bridge_odst_charge_03))
)

(script command_script void sq_bridge_odst_charge_01
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to_and_face "ps_bridge_odst/p_charge_01" "ps_bridge_odst/p_charge_01_face")
    (device_group_set "dm_charge_01" "dg_charge_01" 1.0)
    (set g_charge_reminder (+ g_charge_reminder 1.0))
)

(script command_script void sq_bridge_odst_charge_02
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to_and_face "ps_bridge_odst/p_charge_02" "ps_bridge_odst/p_charge_02_face")
    (device_group_set "dm_charge_02" "dg_charge_02" 1.0)
    (set g_charge_reminder (+ g_charge_reminder 1.0))
)

(script command_script void sq_bridge_odst_charge_03
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to_and_face "ps_bridge_odst/p_charge_03" "ps_bridge_odst/p_charge_03_face")
    (device_group_set "dm_charge_03" "dg_charge_03" 1.0)
)

(script dormant void nav_point_charge
    (if (< (game_difficulty_get) heroic) 
        (begin
            (wake nav_point_charge_01)
            (wake nav_point_charge_02)
            (wake nav_point_charge_03)
        )
    )
    (sleep_until 
        (or
            (volume_test_players "tv_bridge_05")
            (volume_test_players "tv_bridge_00")
        )
    )
    (sleep (* 30.0 1.0))
    (wake nav_point_charge_01)
    (wake nav_point_charge_02)
    (wake nav_point_charge_03)
)

(script dormant void nav_point_charge_01
    (if (= (device_group_get "dg_charge_01") 0.0) 
        (hud_activate_team_nav_point_flag player "fl_charge_01" 0.5))
    (sleep_until (= (device_group_get "dg_charge_01") 1.0))
    (hud_deactivate_team_nav_point_flag player "fl_charge_01")
)

(script dormant void nav_point_charge_02
    (if (= (device_group_get "dg_charge_02") 0.0) 
        (hud_activate_team_nav_point_flag player "fl_charge_02" 0.5))
    (sleep_until (= (device_group_get "dg_charge_02") 1.0))
    (hud_deactivate_team_nav_point_flag player "fl_charge_02")
)

(script dormant void nav_point_charge_03
    (if (= (device_group_get "dg_charge_03") 0.0) 
        (hud_activate_team_nav_point_flag player "fl_charge_03" 0.5))
    (sleep_until (= (device_group_get "dg_charge_03") 1.0))
    (hud_deactivate_team_nav_point_flag player "fl_charge_03")
)

(script static void bridge_explode
    (sleep_until (= (device_group_get "dg_laptop_01") 1.0))
    (wake obj_watchtower_clear)
    (set g_sc130_music01 false)
    (set g_sc130_music02 true)
    (if dialogue 
        (print "virgil: bridge toll accepted. have a pleasant trip."))
    (sleep (ai_play_line_on_object "c_laptop_01" sc130_0139))
    (sleep 10)
    (set s_waypoint_index 3)
    (object_damage_damage_section "bridge" "base" 0.5)
    (sleep 30)
    (object_damage_damage_section "bridge" "base" 0.5)
    (sleep 30)
    (object_damage_damage_section "bridge" "base" 0.5)
    (sleep 30)
    (object_destroy "dm_charge_05")
    (object_destroy "dm_charge_05b")
    (object_destroy "dm_charge_05c")
    (object_destroy "dm_charge_01")
    (object_destroy "dm_charge_01b")
    (object_destroy "dm_charge_01c")
    (object_destroy "dm_charge_01d")
    (object_destroy "dm_charge_01e")
    (object_destroy "dm_laptop_01")
    (object_damage_damage_section "bridge" "base" 0.5)
    (sleep 10)
    (object_destroy "dm_charge_02")
    (object_destroy "dm_charge_02b")
    (object_destroy "dm_charge_02c")
    (object_destroy "dm_charge_02d")
    (object_destroy "dm_charge_02e")
    (object_destroy "dm_charge_03")
    (object_destroy "dm_charge_03b")
    (object_destroy "dm_charge_03c")
    (object_destroy "dm_charge_03d")
    (object_destroy "dm_charge_03e")
    (object_destroy "jersey_barrier_01")
    (object_destroy "jersey_barrier_02")
    (kill_volume_enable "kill_bridge_detonation")
    (sleep 20)
    (kill_volume_disable "kill_bridge_detonation")
    (sleep (* 30.0 1.0))
    (wake md_030_bridge_blown)
    (game_save)
    (sleep (* 30.0 4.0))
    (sleep (* 30.0 7.0))
    (wake bridge_cleanup)
)

(script command_script void cs_banshee_01
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_01/approach_01")
    (cs_fly_by "ps_banshee_01/run_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_banshee_01/run_02")
    (cs_fly_by "ps_banshee_01/run_03")
    (cs_fly_by "ps_banshee_01/run_04")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_01/exit_01")
    (cs_fly_by "ps_banshee_01/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_banshee_02
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_02/approach_01")
    (cs_fly_by "ps_banshee_02/run_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_banshee_02/run_02")
    (cs_fly_by "ps_banshee_02/run_03")
    (cs_fly_by "ps_banshee_02/run_04")
)

(script command_script void cs_banshee_02_exit
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_02/run_05")
    (cs_fly_by "ps_banshee_02/exit_01")
    (cs_fly_by "ps_banshee_02/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_banshee_03
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_03/approach_01")
    (cs_fly_by "ps_banshee_03/run_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_banshee_03/run_02")
    (cs_fly_by "ps_banshee_03/run_03")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_03/run_04")
    (cs_fly_by "ps_banshee_03/exit_01")
    (cs_fly_by "ps_banshee_03/erase")
    (ai_erase ai_current_squad)
)

(script dormant void bridge_cleanup
    (sleep 5)
    (set g_bridge_garbage_collect true)
    (if (volume_test_object "tv_bridge_00" (player0)) 
        (object_teleport (player0) "fl_bridge_00"))
    (if (volume_test_object "tv_bridge_00" (player1)) 
        (object_teleport (player1) "fl_bridge_01"))
    (if (volume_test_object "tv_bridge_00" (player2)) 
        (object_teleport (player2) "fl_bridge_02"))
    (if (volume_test_object "tv_bridge_00" (player3)) 
        (object_teleport (player3) "fl_bridge_03"))
    (wake main_arena_place_01)
    (object_create_folder "eq_sp_main_arena")
    (object_create_folder "v_sp_main_arena")
    (object_create_folder "cr_sp_main_arena_unspawned")
    (object_create_folder "wp_sp_main_arena")
    (object_create "w_rocket_01")
    (sleep (random_range (* 30.0 1.0) (* 30.0 2.0)))
    (device_set_power "dm_main_arena_door_01" 1.0)
    (device_set_position "dm_main_arena_door_01" 1.0)
    (set g_bridge_allies_advance 1)
    (ai_cannot_die "sq_bridge_cop_01" false)
    (units_set_current_vitality (ai_actors "sq_bridge_cop_01") 0.2 0.0)
    (units_set_maximum_vitality (ai_actors "sq_bridge_cop_01") 0.2 0.0)
    (sleep_until (volume_test_players "tv_bridge_exit") 1)
    (set g_bridge_tunnel 1)
    (if 
        (or
            (not (volume_test_object "tv_main_arena_phantom_02" (ai_get_object "sq_phantom_02_jackal_01/jack_01")))
            (not (volume_test_object "tv_main_arena_phantom_02" (ai_get_object "sq_phantom_02_jackal_01/jack_02")))
        ) 
            (set g_phantom_02_jackals false))
    (ai_set_objective "sq_bridge_odst" "obj_main_arena_allies")
    (ai_set_objective "gr_bridge_allies" "obj_main_arena_allies")
    (sleep (* 30.0 30.0))
    (wake main_arena_place_02)
)

(script command_script void cs_main_arena_entry_01
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_main_arena_entry/main_arena_entry_01")
)

(script command_script void cs_main_arena_entry_02
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_main_arena_entry/main_arena_entry_02")
)

(script dormant void enc_main_arena
    (data_mine_set_mission_segment "sc130_20_main_arena")
    (wake s_sc130_music03)
    (wake s_sc130_music035)
    (wake s_sc130_music036)
    (wake main_arena_final_game_save)
    (sleep_until (volume_test_players "tv_main_arena_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_main_arena_obj_control 1)
    (set g_sc130_music02 false)
    (ai_disposable "gr_bridge_cov" true)
    (game_save_no_timeout)
    (units_set_current_vitality (ai_actors "sq_bridge_allies_01") 0.5 0.0)
    (units_set_maximum_vitality (ai_actors "sq_bridge_allies_01") 0.5 0.0)
    (units_set_current_vitality (ai_actors "sq_bridge_allies_02") 0.5 0.0)
    (units_set_maximum_vitality (ai_actors "sq_bridge_allies_02") 0.5 0.0)
    (units_set_current_vitality (ai_actors "sq_main_arena_allies_front_01") 0.5 0.0)
    (units_set_maximum_vitality (ai_actors "sq_main_arena_allies_front_01") 0.5 0.0)
    (units_set_current_vitality (ai_actors "sq_main_arena_allies_front_02") 0.5 0.0)
    (units_set_maximum_vitality (ai_actors "sq_main_arena_allies_front_02") 0.5 0.0)
    (set s_waypoint_index 4)
    (sleep_until (volume_test_players "tv_main_arena_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_main_arena_obj_control 2)
    (ai_cannot_die "sq_main_arena_allies_right" false)
    (ai_cannot_die "sq_main_arena_allies_center" false)
    (ai_cannot_die "sq_main_arena_allies_left" false)
    (units_set_current_vitality (ai_actors "sq_bridge_allies_01") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_bridge_allies_01") 0.1 0.0)
    (units_set_current_vitality (ai_actors "sq_bridge_allies_02") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_bridge_allies_02") 0.1 0.0)
    (units_set_current_vitality (ai_actors "sq_main_arena_allies_front_01") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_main_arena_allies_front_01") 0.1 0.0)
    (units_set_current_vitality (ai_actors "sq_main_arena_allies_front_02") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_main_arena_allies_front_02") 0.1 0.0)
    (game_save)
    (sleep_until (volume_test_players "tv_main_arena_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_main_arena_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_main_arena_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_main_arena_obj_control 4)
    (game_save)
    (set g_sc130_music035 false)
    (set g_sc130_music036 false)
)

(script dormant void main_arena_place_01
    (ai_place "sq_phantom_02")
    (if (game_is_cooperative) 
        (begin
            (ai_place "sq_main_arena_allies_right")
            (sleep 1)
            (ai_place "sq_main_arena_allies_center" 1)
            (ai_place "sq_main_arena_allies_left")
        ) (begin
            (ai_place "sq_main_arena_allies_right")
            (sleep 1)
            (ai_place "sq_main_arena_allies_center")
            (ai_place "sq_main_arena_allies_left")
            (sleep 1)
            (ai_place "sq_main_arena_allies_front_01")
            (ai_place "sq_main_arena_allies_front_02")
        )
    )
    (sleep 1)
    (ai_cannot_die "sq_main_arena_allies_right" true)
    (ai_cannot_die "sq_main_arena_allies_center" true)
    (ai_cannot_die "sq_main_arena_allies_left" true)
)

(script dormant void main_arena_retreat_01
    (if (game_is_cooperative) 
        (sleep_until (< (ai_task_count "obj_main_arena_allies/gt_main_arena_allies") 4) 1 (* 30.0 60.0)) (sleep_until (< (ai_task_count "obj_main_arena_allies/gt_main_arena_allies") 6) 1 (* 30.0 60.0)))
    (set g_main_arena_retreat 1)
    (wake md_040_brute_advance_01)
    (wake main_arena_midsave_02)
    (set g_sc130_music03 true)
    (game_save_no_timeout)
)

(script dormant void main_arena_midsave_01
    (sleep_until (game_safe_to_save) 1 1200)
    (game_save)
)

(script dormant void main_arena_midsave_02
    (sleep_until (game_safe_to_save) 1 1200)
    (game_save)
)

(script command_script void cs_main_arena_retreat_odst
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_main_arena_retreat/odst_01")
    (cs_go_to "ps_main_arena_retreat/odst_02")
)

(script command_script void cs_main_arena_retreat_right
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_main_arena_retreat/right")
)

(script command_script void cs_main_arena_retreat_center
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_main_arena_retreat/center")
)

(script command_script void cs_main_arena_retreat_left
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_main_arena_retreat/left")
)

(script dormant void main_arena_place_02
    (sleep_until 
        (and
            (<= (ai_task_count "obj_main_arena_cov/gt_hunters") 0)
            (<= (ai_task_count "obj_main_arena_cov/gt_phantom_02") 0)
        )
    )
    (sleep_until (>= g_main_arena_obj_control 2) 30 (* 30.0 15.0))
    (ai_place "sq_phantom_03")
    (ai_place "sq_phantom_04")
    (game_save)
)

(script dormant void main_arena_place_03
    (sleep_until (<= (ai_task_count "obj_main_arena_cov/gt_main_arena_cov") 15))
    (set g_main_arena_garbage_collect true)
    (sleep_until (<= (ai_task_count "obj_main_arena_cov/gt_main_arena_cov") 10))
    (ai_place "sq_phantom_05")
    (set g_main_arena_retreat 1)
    (game_save)
)

(script command_script void cs_phantom_02
    (if debug 
        (print "phantom 02"))
    (set phantom_02 (ai_vehicle_get_from_starting_location "sq_phantom_02/phantom"))
    (ai_place "sq_phantom_02_hunter_01")
    (ai_place "sq_phantom_02_hunter_02")
    (ai_place "sq_phantom_02_jackal_01")
    (ai_place "sq_phantom_02_cov_01")
    (ai_place "sq_phantom_02_cov_02")
    (sleep 30)
    (ai_vehicle_enter_immediate "sq_phantom_02_hunter_01" phantom_02 phantom_pc_a_1)
    (ai_vehicle_enter_immediate "sq_phantom_02_hunter_02" phantom_02 phantom_pc_a_2)
    (ai_vehicle_enter_immediate "sq_phantom_02_jackal_01" phantom_02 phantom_p_ml_b)
    (ai_vehicle_enter_immediate "sq_phantom_02_cov_01" phantom_02 phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_phantom_02_cov_02" phantom_02 phantom_p_lb)
    (sleep 1)
    (ai_set_objective "sq_phantom_02" "obj_main_arena_cov")
    (ai_set_objective "gr_phantom_drop_02" "obj_main_arena_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_02/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_02/approach_02")
    (cs_fly_by "ps_phantom_02/approach_03")
    (cs_fly_to_and_face "ps_phantom_02/hover_01" "ps_phantom_02/face_01" 1.0)
    (wake md_030_bridge_tunnel)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_02/drop_01" "ps_phantom_02/face_01" 1.0)
    (vehicle_unload phantom_02 phantom_pc_a_1)
    (sleep 30)
    (vehicle_unload phantom_02 phantom_pc_a_2)
    (cs_fly_to_and_face "ps_phantom_02/drop_02" "ps_phantom_02/face_01" 1.0)
    (unit_open phantom_02)
    (sleep 30)
    (vehicle_unload phantom_02 phantom_p_ml_b)
    (vehicle_unload phantom_02 phantom_p_lb)
    (sleep 75)
    (cs_fly_to_and_face "ps_phantom_02/drop_03" "ps_phantom_02/face_01" 1.0)
    (wake md_030_bridge_exit)
    (vehicle_unload phantom_02 phantom_p_lf)
    (cs_vehicle_speed 1.0)
    (sleep (random_range 75 90))
    (unit_close phantom_02)
    (cs_fly_by "ps_phantom_02/exit_01")
    (cs_fly_by "ps_phantom_02/exit_02")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_02/exit_03")
    (cs_fly_by "ps_phantom_02/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_phantom_03
    (if debug 
        (print "phantom 03"))
    (set phantom_03 (ai_vehicle_get_from_starting_location "sq_phantom_03/phantom"))
    (ai_place "sq_phantom_03_wraith")
    (ai_place "sq_phantom_03_cov_01")
    (ai_place "sq_phantom_03_cov_04")
    (ai_place "sq_phantom_03_cov_05")
    (ai_force_active "gr_phantom_drop_03" true)
    (sleep 30)
    (vehicle_load_magic phantom_03 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_03_wraith/wraith"))
    (ai_vehicle_enter_immediate "sq_phantom_03_cov_01" phantom_03 phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_phantom_03_cov_04" phantom_03 phantom_p_ml_f)
    (ai_vehicle_enter_immediate "sq_phantom_03_cov_05" phantom_03 phantom_p_ml_b)
    (sleep 1)
    (ai_set_objective "sq_phantom_03" "obj_main_arena_cov")
    (ai_set_objective "gr_phantom_drop_03" "obj_main_arena_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_03/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_03/approach_02")
    (cs_fly_to_and_face "ps_phantom_03/hover_01" "ps_phantom_03/face_01" 1.0)
    (unit_open phantom_03)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_03/drop_01" "ps_phantom_03/face_01" 1.0)
    (sleep 15)
    (vehicle_unload phantom_03 phantom_p_lf)
    (sleep 75)
    (wake md_040_main_arena_start_01)
    (cs_fly_to_and_face "ps_phantom_03/hover_02" "ps_phantom_03/face_02" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_03/drop_02" "ps_phantom_03/face_02" 1.0)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (ai_set_objective "sq_phantom_03_wraith" "obj_main_arena_cov")
    (sleep 15)
    (vehicle_unload phantom_03 phantom_p_ml_f)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_03 phantom_p_ml_b)
    (sleep 75)
    (wake main_arena_midsave_01)
    (cs_fly_to_and_face "ps_phantom_03/hover_02" "ps_phantom_03/face_02" 1.0)
    (sleep 30)
    (unit_close phantom_03)
    (cs_vehicle_speed 1.0)
    (sleep (random_range 30 60))
    (cs_fly_by "ps_phantom_03/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_03/exit_02")
    (cs_fly_by "ps_phantom_03/erase")
    (ai_force_active "gr_phantom_drop_03" false)
    (ai_erase ai_current_squad)
)

(script command_script void cs_phantom_04
    (if debug 
        (print "phantom 04"))
    (set phantom_04 (ai_vehicle_get_from_starting_location "sq_phantom_04/phantom"))
    (ai_place "sq_phantom_04_wraith")
    (ai_place "sq_phantom_04_cov_01")
    (ai_place "sq_phantom_04_cov_02")
    (ai_place "sq_phantom_04_cov_03")
    (ai_place "sq_phantom_04_cov_04")
    (ai_force_active "gr_phantom_drop_04" true)
    (sleep 30)
    (vehicle_load_magic phantom_04 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_04_wraith/wraith"))
    (ai_vehicle_enter_immediate "sq_phantom_04_cov_01" phantom_04 phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_phantom_04_cov_02" phantom_04 phantom_p_lb)
    (ai_vehicle_enter_immediate "sq_phantom_04_cov_03" phantom_04 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_04_cov_04" phantom_04 phantom_p_rb)
    (sleep 1)
    (ai_set_objective "sq_phantom_04" "obj_main_arena_cov")
    (ai_set_objective "gr_phantom_drop_04" "obj_main_arena_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_04/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_04/approach_02")
    (cs_fly_by "ps_phantom_04/approach_03")
    (cs_fly_to_and_face "ps_phantom_04/hover_01" "ps_phantom_04/face_01" 1.0)
    (unit_open phantom_04)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_04/drop_01" "ps_phantom_04/face_01" 1.0)
    (sleep 15)
    (vehicle_unload phantom_04 phantom_p_lf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_04 phantom_p_lb)
    (sleep 75)
    (cs_fly_to_and_face "ps_phantom_04/hover_02" "ps_phantom_04/face_02" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_04/drop_02" "ps_phantom_04/face_02" 1.0)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (ai_set_objective "sq_phantom_04_wraith" "obj_main_arena_cov")
    (sleep 15)
    (vehicle_unload phantom_04 phantom_p_rf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_04 phantom_p_rb)
    (wake main_arena_retreat_01)
    (sleep 90)
    (cs_fly_to_and_face "ps_phantom_04/hover_02" "ps_phantom_04/face_02" 1.0)
    (sleep 30)
    (unit_close phantom_04)
    (cs_vehicle_speed 1.0)
    (sleep (random_range 30 90))
    (cs_fly_by "ps_phantom_04/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_04/exit_02")
    (cs_fly_by "ps_phantom_04/erase")
    (wake main_arena_place_03)
    (ai_force_active "gr_phantom_drop_04" false)
    (ai_erase ai_current_squad)
)

(script static void ssv_md_040_main_arena_start
    (wake md_040_main_arena_start_02)
)

(script command_script void cs_phantom_03_wraith_low
    (cs_run_command_script "sq_phantom_03_wraith/gunner" abort_cs)
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (begin_random
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_12")
                        (<= (object_get_health "barrier_12") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_13")
                        (<= (object_get_health "barrier_13") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_14")
                        (<= (object_get_health "barrier_14") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_15")
                        (<= (object_get_health "barrier_15") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_16")
                        (<= (object_get_health "barrier_16") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_17")
                        (<= (object_get_health "barrier_17") 0.0)
                    ) 
                (random_range 60 150))
            )
            (and
                (<= (object_get_health "barrier_12") 0.0)
                (<= (object_get_health "barrier_13") 0.0)
                (<= (object_get_health "barrier_14") 0.0)
                (<= (object_get_health "barrier_15") 0.0)
                (<= (object_get_health "barrier_16") 0.0)
                (<= (object_get_health "barrier_17") 0.0)
            )
        )
    )
)

(script command_script void cs_phantom_04_wraith_low
    (cs_run_command_script "sq_phantom_04_wraith/gunner" abort_cs)
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (begin_random
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_00")
                        (<= (object_get_health "barrier_00") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_01")
                        (<= (object_get_health "barrier_01") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_02")
                        (<= (object_get_health "barrier_02") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_03")
                        (<= (object_get_health "barrier_03") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_04")
                        (<= (object_get_health "barrier_04") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_05")
                        (<= (object_get_health "barrier_05") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_06")
                        (<= (object_get_health "barrier_06") 0.0)
                    ) 
                (random_range 60 150))
            )
            (and
                (<= (object_get_health "barrier_00") 0.0)
                (<= (object_get_health "barrier_01") 0.0)
                (<= (object_get_health "barrier_02") 0.0)
                (<= (object_get_health "barrier_03") 0.0)
                (<= (object_get_health "barrier_04") 0.0)
                (<= (object_get_health "barrier_05") 0.0)
                (<= (object_get_health "barrier_06") 0.0)
            )
        )
    )
)

(script command_script void cs_phantom_04_wraith_high
    (cs_run_command_script "sq_phantom_04_wraith/gunner" abort_cs)
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (begin_random
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_07")
                        (<= (object_get_health "barrier_07") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_08")
                        (<= (object_get_health "barrier_08") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_09")
                        (<= (object_get_health "barrier_09") 0.0)
                    ) 
                (random_range 60 150))
            )
            (and
                (<= (object_get_health "barrier_07") 0.0)
                (<= (object_get_health "barrier_08") 0.0)
                (<= (object_get_health "barrier_09") 0.0)
            )
        )
    )
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p0")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p1")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p2")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p3")
                )
            )
            false
        )
    )
)

(script command_script void cs_phantom_03_wraith_high
    (cs_run_command_script "sq_phantom_03_wraith/gunner" abort_cs)
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (begin_random
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_19")
                        (<= (object_get_health "barrier_19") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_20")
                        (<= (object_get_health "barrier_20") 0.0)
                    ) 
                (random_range 60 150))
                (sleep_until 
                    (begin
                        (cs_shoot true "barrier_21")
                        (<= (object_get_health "barrier_21") 0.0)
                    ) 
                (random_range 60 150))
            )
            (and
                (<= (object_get_health "barrier_19") 0.0)
                (<= (object_get_health "barrier_20") 0.0)
                (<= (object_get_health "barrier_21") 0.0)
            )
        )
    )
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p0")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p1")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p2")
                )
                (begin
                    (sleep (random_range 60 150))
                    (cs_shoot_point true "ps_main_arena_wraith/p3")
                )
            )
            false
        )
    )
)

(script command_script void cs_phantom_05
    (if debug 
        (print "phantom 05"))
    (set phantom_05 (ai_vehicle_get_from_starting_location "sq_phantom_05/phantom"))
    (units_set_current_vitality (ai_actors "sq_main_arena_allies_right") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_main_arena_allies_right") 0.1 0.0)
    (units_set_current_vitality (ai_actors "sq_main_arena_allies_left") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_main_arena_allies_left") 0.1 0.0)
    (ai_place "sq_phantom_05_wraith")
    (ai_place "sq_phantom_05_cov_01")
    (ai_place "sq_phantom_05_cov_02")
    (ai_place "sq_phantom_05_cov_03")
    (ai_place "sq_phantom_05_cov_04")
    (ai_place "sq_phantom_05_jackal_01")
    (ai_place "sq_phantom_05_jackal_02")
    (ai_force_active "gr_phantom_drop_05" true)
    (sleep 30)
    (vehicle_load_magic phantom_05 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_05_wraith/wraith"))
    (ai_vehicle_enter_immediate "sq_phantom_05_cov_01" phantom_05 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_05_cov_02" phantom_05 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_05_cov_03" phantom_05 phantom_p_mr_f)
    (ai_vehicle_enter_immediate "sq_phantom_05_cov_04" phantom_05 phantom_p_mr_b)
    (ai_vehicle_enter_immediate "sq_phantom_05_jackal_01" phantom_05 phantom_p_ml_f)
    (ai_vehicle_enter_immediate "sq_phantom_05_jackal_02" phantom_05 phantom_p_ml_b)
    (sleep 1)
    (ai_set_objective "sq_phantom_05" "obj_main_arena_cov_02")
    (ai_set_objective "gr_phantom_drop_05" "obj_main_arena_cov_02")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_05/approach_01")
    (cs_vehicle_boost false)
    (wake md_050_phantom)
    (cs_fly_by "ps_phantom_05/approach_02")
    (cs_fly_to_and_face "ps_phantom_05/hover_01" "ps_phantom_05/face_01" 1.0)
    (unit_open phantom_05)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_05/drop_01" "ps_phantom_05/face_01" 1.0)
    (sleep 15)
    (vehicle_unload phantom_05 phantom_p_rf)
    (sleep (random_range 15 45))
    (vehicle_unload phantom_05 phantom_p_rb)
    (sleep (random_range 15 45))
    (vehicle_unload phantom_05 phantom_p_ml_f)
    (sleep (random_range 75 90))
    (cs_fly_to_and_face "ps_phantom_05/hover_03" "ps_phantom_05/face_03" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_05/drop_03" "ps_phantom_05/face_03" 1.0)
    (sleep 15)
    (vehicle_unload phantom_05 phantom_p_mr_f)
    (sleep (random_range 15 45))
    (vehicle_unload phantom_05 phantom_p_mr_b)
    (sleep (random_range 15 45))
    (vehicle_unload phantom_05 phantom_p_ml_b)
    (sleep (random_range 75 90))
    (wake lobby_place_01)
    (cs_fly_by "ps_phantom_05/course_01")
    (cs_fly_to_and_face "ps_phantom_05/hover_02" "ps_phantom_05/face_02" 1.0)
    (unit_close phantom_05)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_05/drop_02" "ps_phantom_05/face_02" 1.0)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (ai_set_objective "sq_phantom_05_wraith" "obj_main_arena_cov")
    (sleep 30)
    (game_save)
    (cs_fly_to_and_face "ps_phantom_05/hover_02" "ps_phantom_05/face_02" 1.0)
    (sleep 30)
    (cs_vehicle_speed 0.2)
    (sleep (* 30.0 3.0))
    (cs_fly_to_and_face "ps_phantom_05/hover_05" "ps_phantom_05/face_05" 1.0)
    (sleep_until (< (ai_task_count "obj_main_arena_cov_02/gt_phantom") 2) 30 (* 30.0 20.0))
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_05/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_05/exit_02")
    (cs_fly_by "ps_phantom_05/erase")
    (ai_force_active "gr_phantom_drop_05" false)
    (ai_erase ai_current_squad)
)

(script static void ssv_md_040_brute_advance_02
    (wake md_040_brute_advance_02)
)

(script dormant void nav_point_main_arena
    (if (not (volume_test_players "tv_main_arena_mega_upper")) 
        (hud_activate_team_nav_point_flag player "fl_main_arena" 0.5))
    (sleep_until (volume_test_players "tv_main_arena_mega_upper"))
    (hud_deactivate_team_nav_point_flag player "fl_main_arena")
)

(script dormant void main_arena_final_game_save
    (sleep_until (> (ai_task_count "obj_main_arena_cov_02/gt_phantom_05") 0) 1)
    (sleep 60)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_main_arena_cov_02/gt_phantom_05") 0)
            (<= (ai_task_count "obj_main_arena_cov/gt_main_arena_cov") 0)
        ) 
    1)
    (sleep 60)
    (game_save)
)

(script dormant void enc_lobby
    (data_mine_set_mission_segment "sc130_30_lobby")
    (wake s_sc130_music04)
    (wake s_sc130_music05)
    (wake s_sc130_music06)
    (wake s_sc130_music06_alt)
    (wake s_sc130_music07)
    (wake md_060_rear_attack_end)
    (sleep_until (volume_test_players "tv_lobby_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_lobby_obj_control 1)
    (wake s_lobby_doors_closed)
    (wake lobby_kill_player)
    (game_save)
    (sleep_until (volume_test_players "tv_lobby_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_lobby_obj_control 2)
    (if (not (volume_test_object "tv_lobby_test" (ai_get_object "sq_bridge_odst/odst"))) 
        (ai_bring_forward ai_mickey 3.0))
    (game_save)
    (sleep_until (volume_test_players "tv_lobby_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_lobby_obj_control 3)
    (object_create_folder "cr_sp_roof")
    (sleep_until (volume_test_players "tv_lobby_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_lobby_obj_control 4)
    (sleep_until (volume_test_players "tv_lobby_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_lobby_obj_control 5)
    (game_save)
)

(script dormant void lobby_place_01
    (sleep_until (volume_test_players "tv_main_arena_mega_upper"))
    (switch_zone_set "set_000_010_020")
    (sleep 60)
    (object_create_folder "eq_sp_lobby")
    (object_create_folder "wp_sp_lobby")
    (object_create_folder "v_sp_lobby")
    (object_create_folder "cr_sp_lobby")
    (device_set_position_immediate "dm_elev_side_01" 0.6)
    (device_set_position_immediate "dm_elev_side_02" 0.752)
    (ai_place "sq_lobby_allies_entry_01")
    (ai_place "sq_lobby_allies_entry_02")
    (ai_place "sq_lobby_allies_left")
    (ai_place "sq_lobby_sarge")
    (ai_force_active "gr_lobby_sarge" true)
    (ai_cannot_die "sq_lobby_sarge" true)
    (device_group_set "dm_lobby_door_01" "dg_lobby_door" 1.0)
    (device_set_power "dm_010_door_left" 1.0)
    (device_set_position "dm_010_door_left" 1.0)
    (device_set_power "dm_010_door_right" 1.0)
    (device_set_position "dm_010_door_right" 1.0)
    (sleep 1)
    (wake md_050_ridge_retreat_01)
)

(script dormant void lobby_midsave_01
    (sleep_until (game_safe_to_save) 1 1200)
    (game_save)
)

(script dormant void lobby_midsave_02
    (sleep_until (game_safe_to_save) 1 1200)
    (game_save)
)

(script dormant void lobby_place_03
    (sleep 1)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_lobby_front_cov/gt_lobby_front_cov") 2)
            (<= (ai_task_count "obj_lobby_holding/gt_lobby_holding_cov") 0)
        )
    )
    (game_save)
    (ai_place "sq_phantom_06")
)

(script dormant void lobby_place_04
    (ai_place "sq_lobby_bugger_01")
    (ai_place "sq_lobby_bugger_02")
)

(script dormant void s_lobby_doors_closed
    (sleep_until (= (device_get_position "dm_lobby_door_01") 0.0) 1)
    (ai_disposable "gr_main_arena_cov" true)
    (ai_disposable "gr_main_arena_allies" true)
    (ai_disposable "sq_lobby_allies_entry_02" true)
    (if (not (volume_test_object "tv_lobby_test" (player0))) 
        (object_teleport (player0) "fl_lobby_00"))
    (if (not (volume_test_object "tv_lobby_test" (player1))) 
        (object_teleport (player1) "fl_lobby_01"))
    (if (not (volume_test_object "tv_lobby_test" (player2))) 
        (object_teleport (player2) "fl_lobby_02"))
    (if (not (volume_test_object "tv_lobby_test" (player3))) 
        (object_teleport (player3) "fl_lobby_03"))
    (sleep (* 30.0 5.0))
    (kill_volume_enable "kill_lobby_entry")
    (sleep 20)
    (kill_volume_disable "kill_lobby_entry")
    (set g_lobby_doors_closed true)
)

(script dormant void lobby_kill_player
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_sur_death_volume") 5)
            (cond
                ((volume_test_object "tv_sur_death_volume" (player0))
                    (unit_kill (unit (player0)))
                )
                ((volume_test_object "tv_sur_death_volume" (player1))
                    (unit_kill (unit (player1)))
                )
                ((volume_test_object "tv_sur_death_volume" (player2))
                    (unit_kill (unit (player2)))
                )
                ((volume_test_object "tv_sur_death_volume" (player3))
                    (unit_kill (unit (player3)))
                )
            )
            false
        )
    )
)

(script dormant void lobby_entry
    (sleep_until (volume_test_players "tv_main_arena_03") 1)
    (ai_set_objective "sq_lobby_allies_entry_01" "obj_lobby_allies")
)

(script command_script void cs_lobby_entry_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_lobby_entry/lobby_entry_01")
)

(script command_script void cs_lobby_entry_02
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_lobby_entry/lobby_entry_02")
)

(script command_script void cs_lobby_front_cov_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_lobby_entry/lobby_entry_01")
    (ai_set_objective ai_current_squad "obj_lobby_front_cov")
)

(script command_script void cs_lobby_front_cov_02
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_lobby_entry/lobby_entry_02")
    (ai_set_objective ai_current_squad "obj_lobby_front_cov")
)

(script command_script void cs_phantom_06
    (if debug 
        (print "phantom 06"))
    (set phantom_06 (ai_vehicle_get_from_starting_location "sq_phantom_06/phantom"))
    (units_set_current_vitality (ai_actors "sq_lobby_allies_left") 0.4 0.0)
    (units_set_maximum_vitality (ai_actors "sq_lobby_allies_left") 0.4 0.0)
    (units_set_current_vitality (ai_actors "sq_lobby_sarge") 0.4 0.0)
    (units_set_maximum_vitality (ai_actors "sq_lobby_sarge") 0.4 0.0)
    (ai_place "sq_phantom_06_cov_01")
    (ai_place "sq_phantom_06_brute_01")
    (ai_place "sq_phantom_06_jackal_01")
    (ai_place "sq_phantom_06_brute_02")
    (ai_force_active "gr_phantom_drop_06" true)
    (sleep 30)
    (ai_vehicle_enter_immediate "sq_phantom_06_cov_01" phantom_06 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_06_brute_01" phantom_06 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_06_jackal_01" phantom_06 phantom_p_mr_f)
    (ai_vehicle_enter_immediate "sq_phantom_06_brute_02" phantom_06 phantom_p_mr_b)
    (ai_set_objective "sq_phantom_06" "obj_lobby_back_cov")
    (ai_set_objective "gr_phantom_drop_06" "obj_lobby_back_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_06/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_06/approach_02")
    (wake md_060_rear_attack_sarge)
    (cs_fly_to_and_face "ps_phantom_06/hover_01" "ps_phantom_06/face_01" 1.0)
    (unit_open phantom_06)
    (set g_lobby_front 1)
    (sleep 15)
    (cs_fly_to_and_face "ps_phantom_06/drop_01" "ps_phantom_06/face_01" 1.0)
    (sleep 30)
    (vehicle_unload phantom_06 phantom_p_rf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_06 phantom_p_rb)
    (sleep (random_range 5 15))
    (cs_vehicle_speed 0.5)
    (cs_fly_by "ps_phantom_06/course_01")
    (cs_fly_by "ps_phantom_06/course_03")
    (cs_fly_to_and_face "ps_phantom_06/hover_02" "ps_phantom_06/face_02" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_06/drop_02" "ps_phantom_06/face_02" 1.0)
    (sleep 15)
    (vehicle_unload phantom_06 phantom_p_mr_f)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_06 phantom_p_mr_b)
    (sleep (random_range 5 15))
    (set g_lobby_front_garbage_collect true)
    (wake lobby_elevator)
    (wake lobby_midsave_02)
    (cs_fly_by "ps_phantom_06/course_02")
    (sleep 30)
    (unit_close phantom_06)
    (cs_vehicle_speed 1.0)
    (sleep (random_range 60 120))
    (cs_fly_by "ps_phantom_06/exit_01")
    (cs_fly_by "ps_phantom_06/exit_02")
    (cs_fly_by "ps_phantom_06/erase")
    (ai_force_active "gr_phantom_drop_06" false)
    (ai_erase ai_current_squad)
)

(script dormant void lobby_elevator
    (sleep_until (= (ai_task_count "obj_lobby_back_cov/gt_lobby_back_cov") 0))
    (game_save)
    (wake obj_oni_building_clear)
    (ai_place "sq_lobby_cop_01")
    (device_group_set "dm_elev_01" "dg_elev_position" 0.31)
    (sleep_until (= (device_get_position "dm_elev_01") 0.31) 1)
    (wake obj_elevator_set)
    (device_set_position "dm_elev_inner_door_01" 1.0)
    (device_set_position "dm_elev_outer_door_01" 1.0)
    (sleep_until (= (device_get_position "dm_elev_outer_door_01") 1.0))
    (device_set_power "c_elev_01" 1.0)
    (set g_lobby_front 2)
    (wake md_060_elev_arrives_sarge)
    (game_save)
    (sleep_until (= (device_get_position "c_elev_01") 1.0))
    (device_set_power "c_elev_01" 0.0)
    (set g_sc130_music06 true)
    (device_set_position "dm_elev_inner_door_01" 0.0)
    (device_set_position "dm_elev_outer_door_01" 0.0)
    (sleep_until (= (device_get_position "dm_elev_inner_door_01") 0.0))
    (if (game_is_cooperative) 
        (begin
            (if (not (volume_test_object "tv_lobby_elev" (player0))) 
                (object_teleport (player0) "fl_elev_00"))
            (if (not (volume_test_object "tv_lobby_elev" (player1))) 
                (object_teleport (player1) "fl_elev_01"))
            (if (not (volume_test_object "tv_lobby_elev" (player2))) 
                (object_teleport (player2) "fl_elev_02"))
            (if (not (volume_test_object "tv_lobby_elev" (player3))) 
                (object_teleport (player3) "fl_elev_03"))
        )
    )
    (if (not (volume_test_object "tv_lobby_elev" (ai_get_object ai_mickey))) 
        (ai_teleport ai_mickey "ps_elevator_odst/stand_01"))
    (set s_waypoint_index 7)
    (device_group_set "dm_elev_01" "dg_elev_position" 1.0)
    (sleep_until (>= (device_get_position "dm_elev_01") 0.45) 1)
    (wake lobby_place_04)
    (sleep_until (= (device_get_position "dm_elev_01") 1.0))
    (if (game_is_cooperative) 
        (begin
            (if (not (volume_test_object "tv_lobby_elev" (player0))) 
                (object_teleport (player0) "fl_elev_04"))
            (if (not (volume_test_object "tv_lobby_elev" (player1))) 
                (object_teleport (player1) "fl_elev_05"))
            (if (not (volume_test_object "tv_lobby_elev" (player2))) 
                (object_teleport (player2) "fl_elev_06"))
            (if (not (volume_test_object "tv_lobby_elev" (player3))) 
                (object_teleport (player3) "fl_elev_07"))
        )
    )
    (sleep 1)
    (if (not (volume_test_object "tv_lobby_elev" (ai_get_object ai_mickey))) 
        (ai_bring_forward ai_mickey 1.0))
    (wake enc_roof)
    (wake roof_place_01)
    (set g_lobby_obj_control 100)
    (device_set_position "dm_elev_inner_door_01" 1.0)
    (device_set_position "dm_elev_outer_door_02" 1.0)
    (wake obj_elevator_clear)
    (ai_set_objective "gr_odst" "obj_roof_allies")
    (sleep 45)
    (ai_set_objective "sq_lobby_sarge" "obj_roof_allies")
    (sleep 60)
    (ai_set_objective "sq_lobby_cop_01" "obj_roof_allies")
    (wake s_c_elev_01)
    (wake s_c_elev_02)
    (sleep 1)
    (device_set_power "c_elev_02" 1.0)
)

(script dormant void s_c_elev_01
    (sleep_until 
        (begin
            (sleep_until (= (device_get_power "c_elev_01") 1.0) 1)
            (sleep 5)
            (hud_activate_team_nav_point_flag player "fl_elevator_01" 0.5)
            (sleep_until (= (device_get_position "c_elev_01") 1.0) 1)
            (device_set_power "c_elev_01" 0.0)
            (hud_deactivate_team_nav_point_flag player "fl_elevator_01")
            (device_set_position "dm_elev_inner_door_01" 0.0)
            (device_set_position "dm_elev_outer_door_01" 0.0)
            (sleep_until (= (device_get_position "dm_elev_inner_door_01") 0.0) 1)
            (device_group_set "dm_elev_01" "dg_elev_position" 1.0)
            (sleep_until (= (device_get_position "dm_elev_01") 1.0) 1)
            (device_set_position "dm_elev_inner_door_01" 1.0)
            (device_set_position "dm_elev_outer_door_02" 1.0)
            (sleep_until (= (device_get_position "dm_elev_inner_door_01") 1.0) 1)
            (device_set_power "c_elev_02" 1.0)
            (device_set_position "c_elev_02" 0.0)
            false
        )
    )
)

(script dormant void s_c_elev_02
    (sleep_until 
        (begin
            (sleep_until (= (device_get_power "c_elev_02") 1.0) 1)
            (sleep 5)
            (if (volume_test_players "tv_lobby_test") 
                (hud_activate_team_nav_point_flag player "fl_elevator_02" 0.5))
            (sleep_until (= (device_get_position "c_elev_02") 1.0) 1)
            (device_set_power "c_elev_02" 0.0)
            (hud_deactivate_team_nav_point_flag player "fl_elevator_02")
            (device_set_position "dm_elev_inner_door_01" 0.0)
            (device_set_position "dm_elev_outer_door_02" 0.0)
            (sleep_until (= (device_get_position "dm_elev_inner_door_01") 0.0) 1)
            (device_group_set "dm_elev_01" "dg_elev_position" 0.31)
            (sleep_until (= (device_get_position "dm_elev_01") 0.31) 1)
            (device_set_position "dm_elev_inner_door_01" 1.0)
            (device_set_position "dm_elev_outer_door_01" 1.0)
            (sleep_until (= (device_get_position "dm_elev_inner_door_01") 1.0) 1)
            (device_set_power "c_elev_01" 1.0)
            (device_set_position "c_elev_01" 0.0)
            false
        )
    )
)

(script dormant void elevator_nav_marker
    (sleep (* 30.0 10.0))
    (if (= (device_get_position "dm_elev_01") 0.31) 
        (hud_activate_team_nav_point_flag player "fl_elevator_01" 0.5))
    (sleep_until (= (device_get_position "c_elev_01") 1.0))
    (hud_deactivate_team_nav_point_flag player "fl_elevator_01")
)

(script command_script void cs_elevator_odst
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to_and_face "ps_elevator_odst/stand_01" "ps_elevator_odst/face_01")
    (device_set_power "c_elev_01" 1.0)
)

(script command_script void cs_elevator_exit
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_elevator_exit/walk_01")
)

(script dormant void enc_roof
    (data_mine_set_mission_segment "sc130_40_roof")
    (wake roof_place_01)
    (sleep_until (volume_test_players "tv_roof_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_roof_obj_control 1)
    (set g_sc130_music06 false)
    (ai_disposable "gr_lobby_cov" true)
    (game_save)
    (pda_set_active_pda_definition "sc130_roof")
    (sleep_until (volume_test_players "tv_roof_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_roof_obj_control 2)
    (set g_sc130_music07 true)
    (game_save)
)

(script dormant void roof_place_01
    (ai_place "sq_phantom_07")
    (ai_place "sq_roof_jump_pack_brute_01")
    (ai_place "sq_roof_jump_pack_brute_02")
    (ai_place "sq_roof_jump_pack_brute_03")
    (ai_place "sq_roof_jump_pack_brute_04")
    (ai_place "sq_roof_jump_pack_brute_05")
    (sleep_until (>= g_roof_obj_control 1) 1)
    (sleep_until (>= g_roof_obj_control 2) 1 (* 30.0 10.0))
    (sleep 5)
    (ai_set_objective "gr_roof_cov" "obj_roof_cov")
)

(script dormant void roof_place_02
    (sleep_until (<= (ai_task_count "obj_roof_cov/gt_roof_cov") 4) 1)
    (ai_place "sq_pelican_01")
)

(script command_script void cs_odst_pelican_enter
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_roof_odst/p0")
)

(script command_script void cs_phantom_07
    (if debug 
        (print "phantom 07"))
    (set phantom_07 (ai_vehicle_get_from_starting_location "sq_phantom_07/phantom"))
    (ai_place "sq_phantom_07_jackal_01")
    (ai_place "sq_phantom_07_jackal_02")
    (ai_place "sq_phantom_07_grunt_01")
    (ai_place "sq_phantom_07_grunt_02")
    (ai_force_active "gr_phantom_drop_07" true)
    (sleep 30)
    (ai_vehicle_enter_immediate "sq_phantom_07_jackal_01" phantom_07 phantom_p_mr_f)
    (ai_vehicle_enter_immediate "sq_phantom_07_jackal_02" phantom_07 phantom_p_mr_b)
    (ai_vehicle_enter_immediate "sq_phantom_07_grunt_01" phantom_07 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_07_grunt_02" phantom_07 phantom_p_rb)
    (ai_set_objective "sq_phantom_07" "obj_roof_cov")
    (ai_set_objective "gr_phantom_drop_07" "obj_roof_cov")
    (unit_open phantom_07)
    (sleep_until (>= g_roof_obj_control 1) 1)
    (sleep_until (>= g_roof_obj_control 2) 1 (* 30.0 10.0))
    (vehicle_unload phantom_07 phantom_p_mr_f)
    (vehicle_unload phantom_07 phantom_p_mr_b)
    (sleep 5)
    (vehicle_unload phantom_07 phantom_p_rf)
    (sleep 5)
    (vehicle_unload phantom_07 phantom_p_rb)
    (cs_vehicle_speed 0.2)
    (cs_fly_to_and_face "ps_phantom_07/drop_02" "ps_phantom_07/face_01" 1.0)
    (sleep 75)
    (cs_fly_to_and_face "ps_phantom_07/hover_01" "ps_phantom_07/face_01" 1.0)
    (unit_close phantom_07)
    (cs_vehicle_speed 1.0)
    (sleep (random_range 60 120))
    (wake roof_place_02)
    (cs_fly_by "ps_phantom_07/exit_01")
    (cs_fly_by "ps_phantom_07/exit_02")
    (cs_fly_by "ps_phantom_07/erase")
    (ai_force_active "gr_phantom_drop_07" false)
    (ai_erase ai_current_squad)
)

(script command_script void cs_pelican_01
    (if debug 
        (print "pelican"))
    (set pelican_01 (ai_vehicle_get_from_starting_location "sq_pelican_01/pelican"))
    (ai_allegiance human player)
    (ai_allegiance player human)
    (object_cannot_die (ai_vehicle_get_from_starting_location "sq_pelican_01/pelican") true)
    (object_cannot_take_damage (ai_vehicle_get_from_starting_location "sq_pelican_01/pelican"))
    (ai_cannot_die "sq_pelican_01" true)
    (ai_set_objective "sq_pelican_01" "obj_roof_allies")
    (unit_open pelican_01)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pelican_01/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_pelican_01/course_01")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_pelican_01/hover_01" "ps_pelican_01/face_01" 1.0)
    (sleep_until (<= (ai_task_count "obj_roof_cov/gt_roof_cov") 0) 15)
    (game_save)
    (set g_sc130_music07 false)
    (sleep 30)
    (cs_vehicle_speed 0.3)
    (cs_fly_to_and_face "ps_pelican_01/hover_02" "ps_pelican_01/face_01" 1.0)
    (wake md_080_exit)
    (sleep 60)
    (set g_odst_enter_pelican true)
    (sleep_until (volume_test_players "tv_null") 1)
)

(script dormant void level_exit
    (sleep_until 
        (or
            (vehicle_test_seat_unit pelican_01 none (player0))
            (vehicle_test_seat_unit pelican_01 none (player1))
            (vehicle_test_seat_unit pelican_01 none (player2))
            (vehicle_test_seat_unit pelican_01 none (player3))
        ) 
    5)
    (cinematic_snap_to_white)
    (switch_zone_set "set_000_005_010_020")
    (sleep 1)
    (object_create_anew "bridge")
    (sleep 1)
    (object_set_variant "bridge" "destroyed")
    (set g_cinematic_garbage_collect true)
    (object_teleport (player0) "end_game_teleport_flag00")
    (object_teleport (player1) "end_game_teleport_flag01")
    (object_teleport (player2) "end_game_teleport_flag02")
    (object_teleport (player3) "end_game_teleport_flag03")
    (object_destroy_type_mask 2)
    (sound_looping_start "sound\cinematics\070_waste\070ld_pelican_pickup\070ld_pelican_glue\070ld_pelican_glue" "pelican_glue" 1.0)
    (sound_class_set_gain "veh" 0.0 60)
    (f_end_scene sc130_out_sc "set_000_005_010_020" "gp_sc130_complete" "h100" "white")
    (sound_class_set_gain "“”" 0.0 0)
    (sc130_out_sc_cleanup)
)

(script dormant void elev_test
    (switch_zone_set "set_000_005_010_020")
    (sleep 5)
    (ai_place "sq_bridge_odst")
    (sleep 1)
    (ai_teleport "sq_bridge_odst" "ps_elevator_odst/teleport_01")
    (set ai_mickey "sq_bridge_odst")
    (device_set_position_immediate "dm_elev_01" 0.5)
    (sleep 1)
    (device_set_position_immediate "dm_elev_inner_door_01" 1.0)
    (device_set_position_immediate "dm_elev_outer_door_01" 1.0)
    (sleep 1)
    (ai_set_objective "sq_bridge_odst" "obj_lobby_allies")
    (sleep 1)
    (set g_lobby_front 2)
)

(script dormant void zone_set_control
    (sleep_until (>= (current_zone_set) 0) 1)
    (sleep_until (>= (current_zone_set) 1) 1)
    (sleep_until (>= (current_zone_set) 2) 1)
    (if (>= (current_zone_set) 2) 
        (begin
            (if debug 
                (print "bridge trigger removal"))
            (zone_set_trigger_volume_enable "begin_zone_set:set_000_005_010" false)
            (zone_set_trigger_volume_enable "zone_set:set_000_005_010" false)
            (if debug 
                (print "bridge blockers"))
            (device_set_position_immediate "dm_main_arena_door_01" 0.0)
            (sleep 1)
            (device_set_power "dm_main_arena_door_01" 0.0)
        )
    )
    (sleep_until (>= (current_zone_set) 3) 1)
    (if (>= (current_zone_set) 1) 
        (begin
            (if debug 
                (print "main_arena trigger removal"))
            (zone_set_trigger_volume_enable "begin_zone_set:set_000_010" false)
            (zone_set_trigger_volume_enable "zone_set:set_000_010" false)
        )
    )
    (sleep_until (>= (current_zone_set) 4) 1)
    (if (>= (current_zone_set) 4) 
        (begin
            (if debug 
                (print "cinematic cleanup"))
            (object_destroy_folder "cr_sp_main_arena")
            (object_destroy_folder "cr_sp_main_arena_unspawned")
            (object_destroy_folder "cr_sp_bridge")
        )
    )
)

(script dormant void garbage_collect
    (sleep_until (= g_bridge_garbage_collect true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_bridge" 60 15)
    (sleep_until (>= (current_zone_set) 2) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_bridge" 0 1)
    (sleep_until (>= g_main_arena_obj_control 2) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_main_arena" 30 30)
    (sleep_until (= g_main_arena_garbage_collect true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_main_arena" 30 30)
    (sleep_until (= g_lobby_doors_closed true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_main_arena" 0 1)
    (sleep_until (= g_lobby_breached true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_lobby_front_right" 0 3)
    (add_recycling_volume "tv_sp_lobby_front_left" 0 3)
    (sleep_until (= g_lobby_front_garbage_collect true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_lobby_front" 30 30)
    (sleep_until (>= g_roof_obj_control 1) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_lobby_front" 0 1)
    (add_recycling_volume "tv_sp_lobby_back" 0 1)
    (sleep_until (= g_cinematic_garbage_collect true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_roof" 0 1)
)

(script dormant void lobby_breach
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_01" "fx_sparks1")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_01" "fx_sparks2")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_01" "fx_sparks3")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_01" "fx_sparks4")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_01" "fx_sparks5")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_01" "fx_sparks6")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_02" "fx_sparks1")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_02" "fx_sparks2")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_02" "fx_sparks3")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_02" "fx_sparks4")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_02" "fx_sparks5")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\cutting_door" "dm_lobby_door_02" "fx_sparks6")
    (sleep (* 30.0 7.0))
    (object_create "sc_survial_shield_door_00")
    (object_create "sc_survial_shield_door_01")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\destruction" "dm_lobby_door_01" "")
    (effect_new_on_object_marker "objects\levels\atlas\sc130\revolving_oni_doors\fx\destruction" "dm_lobby_door_02" "")
    (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\door_surround" "dm_lobby_door_01" 1.0)
    (object_destroy "dm_lobby_door_01")
    (object_destroy "dm_lobby_door_02")
    (object_create "dm_lobby_no_door_01")
    (object_create "dm_lobby_no_door_02")
    (sleep 1)
    (set g_sc130_music05 true)
    (wake s_lobby_breached)
    (kill_volume_enable "kill_lobby_breach")
    (begin_random
        (if (= g_lobby_breach_wave_01 true) 
            (begin
                (begin_random
                    (if (= g_lobby_breach_wave_01_yell true) 
                        (begin
                            (set g_lobby_breach_wave_01_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell1" "dm_lobby_door_01" 1.0)
                            (if debug 
                                (print "yell1"))
                        )
                    )
                    (if (= g_lobby_breach_wave_01_yell true) 
                        (begin
                            (set g_lobby_breach_wave_01_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell2" "dm_lobby_door_01" 1.0)
                            (if debug 
                                (print "yell2"))
                        )
                    )
                )
                (set g_lobby_breach_wave_01 false)
                (ai_place "sq_breach_grunt_3_left_start")
                (ai_place "sq_breach_grunt_2_left_start2")
                (sleep (* 30.0 2.0))
                (turret_dialogue_left)
                (ai_place "sq_breach_grunt_2_left_02")
                (sleep (* 30.0 2.0))
                (ai_place "sq_breach_grunt_2_left_01")
                (sleep (* 30.0 3.0))
                (ai_place "sq_breach_jackal_left")
                (sleep (* 30.0 6.0))
                (ai_place "sq_breach_grunt_2_right_01")
                (ai_place "sq_breach_grunt_2_right_02")
                (sleep (* 30.0 3.0))
                (ai_place "sq_breach_grunt_2_right_03")
                (ai_place "sq_breach_grunt_2_left_03")
                (sleep (* 30.0 8.0))
                (turret_dialogue_right)
            )
        )
        (ai_dialogue_enable true)
        (if (= g_lobby_breach_wave_01 true) 
            (begin
                (begin_random
                    (if (= g_lobby_breach_wave_01_yell true) 
                        (begin
                            (set g_lobby_breach_wave_01_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell1" "dm_lobby_door_02" 1.0)
                            (if debug 
                                (print "yell1"))
                        )
                    )
                    (if (= g_lobby_breach_wave_01_yell true) 
                        (begin
                            (set g_lobby_breach_wave_01_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell2" "dm_lobby_door_02" 1.0)
                            (if debug 
                                (print "yell2"))
                        )
                    )
                )
                (set g_lobby_breach_wave_01 false)
                (ai_place "sq_breach_grunt_3_right_start")
                (ai_place "sq_breach_grunt_2_right_start2")
                (sleep (* 30.0 2.0))
                (turret_dialogue_right)
                (ai_place "sq_breach_grunt_2_right_02")
                (sleep (* 30.0 2.0))
                (ai_place "sq_breach_grunt_2_right_01")
                (sleep (* 30.0 3.0))
                (ai_place "sq_breach_jackal_right")
                (sleep (* 30.0 6.0))
                (ai_place "sq_breach_grunt_2_left_01")
                (ai_place "sq_breach_grunt_2_left_02")
                (sleep (* 30.0 3.0))
                (ai_place "sq_breach_grunt_2_right_03")
                (ai_place "sq_breach_grunt_2_left_03")
                (sleep (* 30.0 8.0))
                (turret_dialogue_left)
            )
        )
    )
    (sleep_until 
        (or
            (= (ai_task_count "obj_lobby_breach/gt_grunt_right") 0)
            (= (ai_task_count "obj_lobby_breach/gt_grunt_left") 0)
        ) 
    5)
    (cond
        ((and
            (= g_lobby_breach_wave_02 true)
            (= (ai_task_count "obj_lobby_breach/gt_grunt_left") 0)
        )
            (begin
                (begin_random
                    (if (= g_lobby_breach_wave_02_yell true) 
                        (begin
                            (set g_lobby_breach_wave_02_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell3" "dm_lobby_door_02" 1.0)
                            (if debug 
                                (print "yell3"))
                        )
                    )
                    (if (= g_lobby_breach_wave_02_yell true) 
                        (begin
                            (set g_lobby_breach_wave_02_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell4" "dm_lobby_door_02" 1.0)
                            (if debug 
                                (print "yell4"))
                        )
                    )
                )
                (set g_lobby_breach_wave_02 false)
                (ai_place "sq_breach_jackal_right")
                (ai_place "sq_breach_cov_right")
                (sleep (* 30.0 6.0))
                (turret_dialogue_right)
                (sleep_until (<= (ai_task_count "obj_lobby_breach/gt_lobby_front_cov") 3) 1 (* 30.0 15.0))
                (ai_place "sq_breach_brute_left")
                (ai_place "sq_breach_jackal_right")
                (sleep (* 30.0 6.0))
                (turret_dialogue_left)
            )
        )
        ((and
            (= g_lobby_breach_wave_02 true)
            (= (ai_task_count "obj_lobby_breach/gt_grunt_right") 0)
        )
            (begin
                (begin_random
                    (if (= g_lobby_breach_wave_02_yell true) 
                        (begin
                            (set g_lobby_breach_wave_02_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell3" "dm_lobby_door_01" 1.0)
                            (if debug 
                                (print "yell3"))
                        )
                    )
                    (if (= g_lobby_breach_wave_02_yell true) 
                        (begin
                            (set g_lobby_breach_wave_02_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell4" "dm_lobby_door_01" 1.0)
                            (if debug 
                                (print "yell4"))
                        )
                    )
                )
                (set g_lobby_breach_wave_02 false)
                (ai_place "sq_breach_jackal_left")
                (ai_place "sq_breach_cov_left")
                (sleep (* 30.0 6.0))
                (turret_dialogue_left)
                (sleep_until (<= (ai_task_count "obj_lobby_breach/gt_lobby_front_cov") 3) 1 (* 30.0 15.0))
                (ai_place "sq_breach_brute_right")
                (ai_place "sq_breach_jackal_left")
                (sleep (* 30.0 6.0))
                (turret_dialogue_right)
            )
        )
    )
    (wake lobby_midsave_01)
    (sleep_until (<= (ai_task_count "obj_lobby_breach/gt_lobby_front_cov") 6) 1)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_lobby_breach/gt_lobby_front_cov") 2)
            (or
                (<= (ai_task_count "obj_lobby_breach/left") 0)
                (<= (ai_task_count "obj_lobby_breach/right") 0)
            )
        )
    )
    (ai_reset_objective "obj_lobby_breach/gt_cov_right")
    (ai_reset_objective "obj_lobby_breach/gt_brute_right")
    (ai_reset_objective "obj_lobby_breach/gt_jackal_right")
    (ai_reset_objective "obj_lobby_breach/gt_cov_left")
    (ai_reset_objective "obj_lobby_breach/gt_brute_left")
    (ai_reset_objective "obj_lobby_breach/gt_jackal_left")
    (sleep 1)
    (units_set_current_vitality (ai_actors "sq_lobby_allies_entry_01") 0.2 0.0)
    (units_set_maximum_vitality (ai_actors "sq_lobby_allies_entry_01") 0.2 0.0)
    (units_set_current_vitality (ai_actors "sq_lobby_allies_entry_02") 0.2 0.0)
    (units_set_maximum_vitality (ai_actors "sq_lobby_allies_entry_02") 0.2 0.0)
    (cond
        ((and
            (= g_lobby_breach_wave_03 true)
            (= (ai_task_count "obj_lobby_breach/right") 0)
        )
            (begin
                (begin_random
                    (if (= g_lobby_breach_wave_03_yell true) 
                        (begin
                            (set g_lobby_breach_wave_03_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell5" "dm_lobby_door_02" 1.0)
                            (if debug 
                                (print "yell5"))
                        )
                    )
                    (if (= g_lobby_breach_wave_03_yell true) 
                        (begin
                            (set g_lobby_breach_wave_03_yell false)
                            (sound_impulse_start none "dm_lobby_door_02" 1.0)
                            (if debug 
                                (print "yell6"))
                        )
                    )
                )
                (set g_lobby_breach_wave_03 false)
                (ai_place "sq_breach_grunt_2_right_01")
                (sleep 30)
                (ai_place "sq_breach_grunt_2_right_02")
                (sleep (* 30.0 2.0))
                (turret_dialogue_right)
                (ai_place "sq_breach_cov_right")
                (sleep (random_range (* 30.0 2.0) (* 30.0 3.0)))
                (ai_place "sq_breach_jackal_left")
                (ai_place "sq_breach_brute_left")
                (sleep (* 30.0 6.0))
                (turret_dialogue_left)
            )
        )
        ((and
            (= g_lobby_breach_wave_03 true)
            (= (ai_task_count "obj_lobby_breach/left") 0)
        )
            (begin
                (begin_random
                    (if (= g_lobby_breach_wave_03_yell true) 
                        (begin
                            (set g_lobby_breach_wave_03_yell false)
                            (sound_impulse_start "sound\levels\atlas\sc130_oni\oni_door_sequence_scripted\yell5" "dm_lobby_door_01" 1.0)
                            (if debug 
                                (print "yell5"))
                        )
                    )
                    (if (= g_lobby_breach_wave_03_yell true) 
                        (begin
                            (set g_lobby_breach_wave_03_yell false)
                            (sound_impulse_start none "dm_lobby_door_01" 1.0)
                            (if debug 
                                (print "yell6"))
                        )
                    )
                )
                (set g_lobby_breach_wave_03 false)
                (ai_place "sq_breach_grunt_2_left_01")
                (sleep 30)
                (ai_place "sq_breach_grunt_2_left_02")
                (sleep (* 30.0 2.0))
                (turret_dialogue_left)
                (ai_place "sq_breach_cov_left")
                (sleep (random_range (* 30.0 2.0) (* 30.0 3.0)))
                (ai_place "sq_breach_jackal_right")
                (ai_place "sq_breach_brute_right")
                (sleep (* 30.0 6.0))
                (turret_dialogue_right)
            )
        )
    )
    (sleep_until (<= (ai_task_count "obj_lobby_breach/gt_lobby_front_cov") 0) 1)
    (wake lobby_place_03)
    (kill_volume_disable "kill_lobby_breach")
)

(script dormant void s_lobby_breached
    (sleep (* 30.0 5.0))
    (set g_lobby_breached true)
)

(script command_script void cs_suicide_grunt_left_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_movement_mode ai_movement_combat)
    (cs_go_to "ps_lobby_entry/suicide_grunt_left_01")
    (ai_grunt_kamikaze ai_current_actor)
)

(script command_script void cs_suicide_grunt_left_02
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_movement_mode ai_movement_combat)
    (cs_go_to "ps_lobby_entry/suicide_grunt_left_02")
    (ai_grunt_kamikaze ai_current_actor)
)

(script command_script void cs_suicide_grunt_right_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_movement_mode ai_movement_combat)
    (cs_go_to "ps_lobby_entry/suicide_grunt_right_01")
    (ai_grunt_kamikaze ai_current_actor)
)

(script command_script void cs_suicide_grunt_right_02
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_movement_mode ai_movement_combat)
    (cs_go_to "ps_lobby_entry/suicide_grunt_right_02")
    (ai_grunt_kamikaze ai_current_actor)
)

(script command_script void cs_suicide_grunt
    (ai_grunt_kamikaze ai_current_actor)
)

(script dormant void s_coop_resume
    (sleep_until (>= g_main_arena_obj_control 1) 1)
    (if (< g_main_arena_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 1)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
    (sleep_until (>= g_lobby_obj_control 2) 1)
    (if (< g_lobby_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 2)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
    (sleep_until (>= g_roof_obj_control 1) 1)
    (f_coop_resume_unlocked "coop_resume" 3)
    (if debug 
        (print "game_insertion_point_unlock"))
)

(script dormant void sc130_survival_mode_a
    (set string_survival_map_name "sc130a")
    (soft_ceiling_enable "survival" false)
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (sleep 5)
    (switch_zone_set "set_survival_a")
    (pda_set_active_pda_definition "sc130_survival_a")
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_010" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_005_010" false)
    (zone_set_trigger_volume_enable "zone_set:set_000_010" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_010_020" false)
    (kill_volume_enable "kill_a_surv_00")
    (kill_volume_enable "kill_a_surv_01")
    (kill_volume_enable "kill_a_surv_02")
    (kill_volume_enable "kill_a_surv_03")
    (kill_volume_enable "kill_a_surv_04")
    (kill_volume_enable "kill_a_surv_05")
    (kill_volume_enable "kill_a_surv_06")
    (kill_volume_enable "kill_a_surv_07")
    (kill_volume_enable "kill_a_surv_08")
    (kill_volume_enable "kill_a_surv_09")
    (kill_volume_enable "kill_a_surv_10")
    (set ai_obj_survival "obj_survival_a")
    (set ai_sur_phantom_01 "sq_sur_phantom_01")
    (set ai_sur_phantom_02 "sq_sur_phantom_02")
    (set ai_sur_phantom_03 "sq_sur_phantom_03")
    (set ai_sur_phantom_04 "sq_sur_phantom_04")
    (set s_sur_drop_side_01 "dual")
    (set s_sur_drop_side_02 "dual")
    (set s_sur_drop_side_03 "right")
    (set s_sur_drop_side_04 "left")
    (set ai_sur_wave_spawns "gr_survival_a_waves")
    (set s_sur_wave_squad_count 5)
    (set ai_sur_remaining "sq_sur_remaining")
    (set ai_sur_bonus_wave "sq_sur_a_bonus_wave")
    (set ai_sur_bonus_phantom "sq_sur_a_bonus_phantom")
    (set b_sur_bonus_round true)
    (wake survival_mode)
    (wake survival_recycle)
    (wake survival_kill_player)
    (sleep 5)
    (object_destroy "dm_010_door_left")
    (object_destroy "dm_010_door_right")
    (object_destroy_folder "wp_sp_main_arena")
)

(script static void survival_refresh_follow_a
    (survival_refresh_sleep)
    (ai_reset_objective "obj_survival_a/follow_gate")
)

(script static void survival_hero_refresh_follow_a
    (survival_refresh_sleep)
    (survival_refresh_sleep)
    (ai_reset_objective "obj_survival_a/hero_follow")
)

(script static void survival_refresh_follow_b
    (survival_refresh_sleep)
    (ai_reset_objective "obj_survival_b/infantry_follow")
)

(script static void survival_hero_refresh_follow_b
    (survival_refresh_sleep)
    (survival_refresh_sleep)
    (ai_reset_objective "obj_survival_b/hero_follow")
)

(script command_script void cs_sur_phantom_01
    (set v_sur_phantom_01 (ai_vehicle_get_from_starting_location "sq_sur_phantom_01/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_phantom_01/phantom" true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (not (= (random_range 0 4) 0))
                (<= (object_get_health (ai_vehicle_get_from_spawn_point "sq_sur_wraith_01/driver")) 0.0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_01 "single" "sq_sur_wraith_01" none))
    )
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_01/p0")
    (cs_fly_by "ps_sur_phantom_01/p1")
    (cs_fly_by "ps_sur_phantom_01/p2")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_phantom_01/p3")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_01/p4" "ps_sur_phantom_01/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_phantom_01/drop" "ps_sur_phantom_01/face" 1.0)
    (sleep 15)
    (vehicle_unload v_sur_phantom_01 phantom_lc)
    (f_unload_phantom v_sur_phantom_01 "dual")
    (sleep 15)
    (cs_fly_to_and_face "ps_sur_phantom_01/p4" "ps_sur_phantom_01/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "ps_sur_phantom_01/p3")
    (cs_vehicle_speed 1.0)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_01/p2")
    (cs_fly_by "ps_sur_phantom_01/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script static void sur_wraith01_reserve
    (sleep_until (!= (ai_living_count "sq_sur_wraith_01") 2) 1)
    (if (= (ai_living_count "sq_sur_wraith_01/driver") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_01/driver")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_01/gunner") wraith_g true)
        )
    )
    (sleep_until (< (ai_living_count "sq_sur_wraith_01") 1) 1)
    (if (= (ai_living_count "sq_sur_wraith_01/driver") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_01/driver")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_01/gunner") wraith_g true)
        )
    )
)

(script command_script void cs_sur_phantom_02
    (set v_sur_phantom_02 (ai_vehicle_get_from_starting_location "sq_sur_phantom_02/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_phantom_02/phantom" true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (not (= (random_range 0 4) 1))
                (<= (object_get_health (ai_vehicle_get_from_spawn_point "sq_sur_wraith_02/driver")) 0.0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_02 "single" "sq_sur_wraith_02" none))
    )
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_02/p0")
    (cs_fly_by "ps_sur_phantom_02/p1")
    (cs_fly_by "ps_sur_phantom_02/p2")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_phantom_02/p3")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_02/p4" "ps_sur_phantom_02/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_phantom_02/drop" "ps_sur_phantom_02/face" 1.0)
    (sleep 15)
    (vehicle_unload v_sur_phantom_02 phantom_lc)
    (f_unload_phantom v_sur_phantom_02 "dual")
    (sleep 15)
    (cs_fly_to_and_face "ps_sur_phantom_02/p4" "ps_sur_phantom_02/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "ps_sur_phantom_02/p3")
    (cs_vehicle_speed 1.0)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_02/p2")
    (cs_fly_by "ps_sur_phantom_02/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script static void sur_wraith02_reserve
    (sleep_until (!= (ai_living_count "sq_sur_wraith_02") 2) 1)
    (if (= (ai_living_count "sq_sur_wraith_02/driver") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_02/driver")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_02/gunner") wraith_g true)
        )
    )
    (sleep_until (< (ai_living_count "sq_sur_wraith_02") 1) 1)
    (if (= (ai_living_count "sq_sur_wraith_02/driver") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_02/driver")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_02/gunner") wraith_g true)
        )
    )
)

(script command_script void cs_sur_phantom_03
    (set v_sur_phantom_03 (ai_vehicle_get_from_starting_location "sq_sur_phantom_03/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (if (not (campaign_survival_enabled)) 
        (f_load_phantom v_sur_phantom_03 "right" "sq_test_01" "sq_test_02" "sq_test_03" "sq_test_04"))
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_03/p0")
    (cs_fly_by "ps_sur_phantom_03/p1")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_phantom_03/p2")
    (cs_fly_by "ps_sur_phantom_03/p3")
    (cs_vehicle_speed 0.5)
    (cs_fly_by "ps_sur_phantom_03/p4")
    (cs_vehicle_speed 0.15)
    (vehicle_unload v_sur_phantom_03 phantom_p_rf)
    (cs_fly_by "ps_sur_phantom_03/p5")
    (vehicle_unload v_sur_phantom_03 phantom_p_rb)
    (cs_fly_by "ps_sur_phantom_03/p6")
    (vehicle_unload v_sur_phantom_03 phantom_p_mr_f)
    (cs_fly_by "ps_sur_phantom_03/p7")
    (vehicle_unload v_sur_phantom_03 phantom_p_mr_b)
    (cs_fly_by "ps_sur_phantom_03/p8")
    (cs_fly_by "ps_sur_phantom_03/p9")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_sur_phantom_03/p10")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_03/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_phantom_04
    (set v_sur_phantom_04 (ai_vehicle_get_from_starting_location "sq_sur_phantom_04/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (if (not (campaign_survival_enabled)) 
        (f_load_phantom v_sur_phantom_04 "left" "sq_test_01" "sq_test_02" "sq_test_03" "sq_test_04"))
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_04/p0")
    (cs_fly_by "ps_sur_phantom_04/p1")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_phantom_04/p2")
    (cs_fly_by "ps_sur_phantom_04/p3")
    (cs_vehicle_speed 0.5)
    (cs_fly_by "ps_sur_phantom_04/p4")
    (cs_vehicle_speed 0.15)
    (object_set_phantom_power v_sur_phantom_04 true)
    (vehicle_unload v_sur_phantom_04 phantom_p_lf)
    (cs_fly_by "ps_sur_phantom_04/p5")
    (vehicle_unload v_sur_phantom_04 phantom_p_lb)
    (cs_fly_by "ps_sur_phantom_04/p6")
    (vehicle_unload v_sur_phantom_04 phantom_p_ml_f)
    (cs_fly_by "ps_sur_phantom_04/p7")
    (vehicle_unload v_sur_phantom_04 phantom_p_ml_b)
    (object_set_phantom_power v_sur_phantom_04 false)
    (cs_fly_by "ps_sur_phantom_04/p8" 2.0)
    (cs_fly_by "ps_sur_phantom_04/p9")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_sur_phantom_04/p10")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_04/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_a_bonus_phantom
    (set v_sur_bonus_phantom (ai_vehicle_get_from_spawn_point "sq_sur_a_bonus_phantom/phantom"))
    (set b_load_in_phantom true)
    (sleep 1)
    (object_set_shadowless v_sur_bonus_phantom true)
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_a_bonus_phantom/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_a_bonus_phantom/p2")
    (cs_fly_by "ps_sur_a_bonus_phantom/p3")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_a_bonus_phantom/p4")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_a_bonus_phantom/p5" "ps_sur_a_bonus_phantom/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_a_bonus_phantom/drop" "ps_sur_a_bonus_phantom/face" 1.0)
    (sleep 15)
    (unit_open v_sur_bonus_phantom)
    (set b_load_in_phantom false)
    (set b_sur_bonus_phantom_ready true)
    (f_unload_bonus_phantom v_sur_bonus_phantom)
    (sleep 150)
    (unit_close v_sur_bonus_phantom)
    (sleep_until b_sur_bonus_end)
    (sleep 45)
    (cs_fly_to_and_face "ps_sur_a_bonus_phantom/p5" "ps_sur_a_bonus_phantom/face" 1.0)
    (cs_face true "ps_sur_a_bonus_phantom/face_exit")
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_face false "ps_sur_a_bonus_phantom/face_exit")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_a_bonus_phantom/p3")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_sur_a_bonus_phantom/p2")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_a_bonus_phantom/p0")
    (cs_fly_by "ps_sur_a_bonus_phantom/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script dormant void sc130_survival_mode_b
    (set string_survival_map_name "sc130b")
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (sleep 5)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_010" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_005_010" false)
    (zone_set_trigger_volume_enable "zone_set:set_000_010" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_010_020" false)
    (soft_ceiling_enable "survival" false)
    (switch_zone_set "set_survival_b")
    (sleep 30)
    (pda_set_active_pda_definition "sc130_survival_b")
    (device_set_position_immediate "dm_elev_01" 0.31)
    (device_set_position_immediate "dm_elev_side_01" 0.45)
    (device_set_position_immediate "dm_elev_side_02" 0.45)
    (device_set_position_immediate "dm_elev_outer_door_01" 1.0)
    (device_set_position_immediate "dm_elev_inner_door_01" 0.55)
    (object_create "dm_side_elev_door_01")
    (object_create "dm_side_elev_door_02")
    (sleep 1)
    (device_set_position_immediate "dm_side_elev_door_01" 0.55)
    (device_set_position_immediate "dm_side_elev_door_02" 0.55)
    (object_destroy "dm_lobby_door_01")
    (object_destroy "dm_lobby_door_02")
    (object_destroy "dm_elev_outer_door_02")
    (object_destroy_containing "sp_lobby_")
    (object_create "dm_lobby_no_door_01")
    (object_create "dm_lobby_no_door_02")
    (set folder_survival_scenery "sc_survival_b")
    (set folder_survival_crates "cr_survival_b")
    (set folder_survival_vehicles "v_survival_b")
    (set folder_survival_equipment "eq_survival_b")
    (set folder_survival_weapons "wp_survival_b")
    (set ai_obj_survival "obj_survival_b")
    (set ai_sur_phantom_01 "sq_sur_b_phantom_01")
    (set ai_sur_phantom_02 "sq_sur_b_phantom_02")
    (set ai_sur_phantom_03 none)
    (set ai_sur_phantom_04 none)
    (set s_sur_drop_side_01 "chute")
    (set s_sur_drop_side_02 "chute")
    (set s_sur_drop_side_03 "null")
    (set s_sur_drop_side_04 "null")
    (set ai_sur_wave_spawns "gr_survival_b_waves")
    (set s_sur_wave_squad_count 4)
    (set ai_sur_remaining "sq_sur_remaining")
    (set ai_sur_bonus_wave "sq_sur_b_bonus_wave")
    (set ai_sur_bonus_phantom none)
    (set b_sur_bonus_round true)
    (wake survival_mode)
    (wake survival_recycle)
    (wake survival_kill_player)
    (sleep 5)
    (object_destroy "c_elev_01")
    (object_destroy_folder "cr_sp_lobby")
)

(script command_script void cs_sur_b_phantom_01
    (set v_sur_phantom_01 (ai_vehicle_get_from_starting_location "sq_sur_b_phantom_01/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_b_phantom_01/phantom" true)
    (ai_set_objective "gr_survival_all" "obj_survival_b")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_b_phantom_01/p0")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_b_phantom_01/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_by "ps_sur_b_phantom_01/p2")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_sur_b_phantom_01/drop" "ps_sur_b_phantom_01/face" 1.0)
    (sleep 15)
    (f_unload_phantom v_sur_phantom_01 "chute")
    (sleep 30)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "ps_sur_b_phantom_01/p3")
    (cs_vehicle_speed 1.0)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_b_phantom_01/p4")
    (cs_fly_by "ps_sur_b_phantom_01/p5")
    (cs_fly_by "ps_sur_b_phantom_01/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_b_phantom_02
    (set v_sur_phantom_02 (ai_vehicle_get_from_starting_location "sq_sur_b_phantom_02/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_b_phantom_02/phantom" true)
    (ai_set_objective "gr_survival_all" "obj_survival_b")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_b_phantom_02/p0")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_sur_b_phantom_02/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_by "ps_sur_b_phantom_02/p2")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_sur_b_phantom_02/drop" "ps_sur_b_phantom_02/face" 1.0)
    (sleep 15)
    (f_unload_phantom v_sur_phantom_02 "chute")
    (sleep 30)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "ps_sur_b_phantom_02/p3")
    (cs_vehicle_speed 1.0)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_b_phantom_02/p4")
    (cs_fly_by "ps_sur_b_phantom_02/p5")
    (cs_fly_by "ps_sur_b_phantom_02/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script static void test_survival_b
    (device_set_position_immediate "dm_elev_01" 0.5)
    (device_set_position_immediate "dm_elev_side_01" 0.45)
    (device_set_position_immediate "dm_elev_side_02" 0.45)
    (device_set_position_immediate "dm_elev_outer_door_01" 1.0)
    (device_set_position_immediate "dm_elev_inner_door_01" 0.55)
    (object_create "dm_side_elev_door_01")
    (object_create "dm_side_elev_door_02")
    (sleep 1)
    (device_set_position_immediate "dm_side_elev_door_01" 0.55)
    (device_set_position_immediate "dm_side_elev_door_02" 0.55)
    (object_destroy "dm_lobby_door_01")
    (object_destroy "dm_lobby_door_02")
    (object_create "dm_lobby_no_door_01")
    (object_create "dm_lobby_no_door_02")
    (object_create_anew "sc_survial_shield_door_00")
    (object_create_anew "sc_survial_shield_door_01")
)

(script dormant void survival_kill_player
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_sur_death_volume") 5)
            (cond
                ((volume_test_object "tv_sur_death_volume" (player0))
                    (unit_kill (unit (player0)))
                )
                ((volume_test_object "tv_sur_death_volume" (player1))
                    (unit_kill (unit (player1)))
                )
                ((volume_test_object "tv_sur_death_volume" (player2))
                    (unit_kill (unit (player2)))
                )
                ((volume_test_object "tv_sur_death_volume" (player3))
                    (unit_kill (unit (player3)))
                )
            )
            false
        )
    )
)

(script dormant void survival_recycle
    (sleep_until 
        (begin
            (add_recycling_volume "tv_sur_garbage_all" 60 60)
            (sleep 1500)
            false
        ) 
    1)
)

(script dormant void sur_kill_vol_disable
    (print "disabling kill_volumes")
    (survival_kill_volumes_off)
)

(script static void sc130_out_sc_01_sc_sh1
    (fade_in 1.0 1.0 1.0 10)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 0 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_marine_sc130_out_sc_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_1" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "cin_helmet_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "smg01_1" true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "sc130_chaingun_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (atmosphere_fog_override_fade 3 0.0 0.0)
    (cinematic_print "custom script play")
    (sleep 2)
    (cinematic_scripting_start_music 0 0 0 1)
    (sleep 2)
    (cinematic_scripting_start_music 0 0 0 0)
    (sleep 84)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh2
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 1 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 1)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_marine_sc130_out_sc_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_autoexposure_instant 1)
    (sleep 13)
    (cinematic_scripting_start_dialogue 0 0 1 0 (cinematic_scripting_get_object 0 0 1))
    (sleep 69)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh3
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 2 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 2)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_3" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "cin_helmet_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "smg01_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_autoexposure_instant 1)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 5) "polarize" 0.0 0.0)
    (sleep 13)
    (cinematic_scripting_start_dialogue 0 0 2 0 (cinematic_scripting_get_object 0 0 3))
    (sleep 17)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 5) "polarize" 1.0 30.0)
    (sleep 17)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh4
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 3 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 3)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_marine_sc130_out_sc_01_4" true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_autoexposure_instant 1)
    (sleep 1)
    (cinematic_scripting_start_dialogue 0 0 3 1 (cinematic_scripting_get_object 0 0 1))
    (sleep 38)
    (cinematic_scripting_start_dialogue 0 0 3 0 none)
    (sleep 3)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 4 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 4)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_marine_sc130_out_sc_01_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_5" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "sc130_chaingun_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_autoexposure_instant 1)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "jet_wash_active" 1.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "thrusters_down" 1.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "jet_wash_power" 0.5 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "thrusters_back" 0.15 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "thrusters_down" 0.5 10.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "thrusters_down" 1.0 20.0)
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "jet_wash_power" 0.0 30.0)
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "thrusters_back" 0.75 30.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 0) "thrusters_down" 0.0 20.0)
    (sleep 20)
    (cinematic_scripting_start_dialogue 0 0 4 0 (cinematic_scripting_get_object 0 0 2))
    (sleep 6)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh6
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 5 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 5)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_6" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "cin_helmet_01_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_autoexposure_instant 1)
    (sleep 42)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 6 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 6)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_7" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_7" true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_autoexposure_instant 1)
    (atmosphere_fog_override_fade 3 1.0 6.0)
    (cinematic_print "custom script play")
    (sleep 28)
    (cinematic_scripting_start_dialogue 0 0 6 0 none)
    (sleep 89)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh8
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 7 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 7)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_8" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "cin_helmet_01_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "smg01_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (render_autoexposure_instant 1)
    (sleep 30)
    (cinematic_scripting_start_dialogue 0 0 7 0 (cinematic_scripting_get_object 0 0 2))
    (sleep 31)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh9
    (begin
        (set render_lightmap_shadows false)
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 8 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 8)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_marine_sc130_out_sc_01_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_9" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "smg01_9" true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "sc130_chaingun_9" true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (render_autoexposure_instant 1)
    (sleep 7)
    (cinematic_scripting_start_dialogue 0 0 8 1 none)
    (sleep 34)
    (cinematic_scripting_start_dialogue 0 0 8 0 (cinematic_scripting_get_object 0 0 3))
    (sleep 35)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh10
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 9 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 9)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_10" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 9)
    (cinematic_clips_initialize_for_shot 9)
    (render_autoexposure_instant 1)
    (sleep 51)
    (cinematic_scripting_start_dialogue 0 0 9 0 (cinematic_scripting_get_object 0 0 2))
    (sleep 22)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh11
    (begin
        (object_set_permutation "oni_building" "floor2" "base")
        (object_set_permutation "oni_building" "floor3" "base")
        (object_set_permutation "oni_building" "floor1" "destroyed")
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 10 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 10)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_11" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_11" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "smg01_11" true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_11" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 10)
    (cinematic_clips_initialize_for_shot 10)
    (render_autoexposure_instant 1)
    (sleep 1)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh12
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 11 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 11)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_12" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_dutch_sc130_out_sc_01_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_12" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "cin_helmet_02_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "smg01_12" true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "sc130_chaingun_12" true)
    (cinematic_lights_initialize_for_shot 11)
    (cinematic_clips_initialize_for_shot 11)
    (render_autoexposure_instant 1)
    (sleep 48)
    (player_effect_stop 0.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh13
    (begin
        (player_effect_start 1.0 0.0)
        (player_effect_set_max_rotation 0.0 0.0 0.0)
        (player_effect_set_max_rumble 0.05 0.05)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 12 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 12)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_13" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "cin_mickey_sc130_out_sc_01_13" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 4 true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "mickey_smg01_13" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "sc130_chaingun_13" true)
    (cinematic_lights_initialize_for_shot 12)
    (cinematic_clips_initialize_for_shot 12)
    (render_autoexposure_instant 1)
    (object_set_function_variable "oni_building" "building_glow" 0.0 0.0)
    (cinematic_print "custom script play")
    (object_set_permutation "oni_building" "building" "base")
    (cinematic_print "custom script play")
    (sleep 50)
    (cinematic_scripting_start_effect 0 0 12 1 "oni_building")
    (cinematic_print "custom script play")
    (begin
        (object_set_function_variable "oni_building" "building_glow" 1.0 0.0)
        (player_effect_set_max_rumble 0.2 0.2)
        (player_effect_start 1.0 0.0)
    )
    (cinematic_scripting_start_effect 0 0 12 0 "oni_building")
    (object_set_permutation "oni_building" "building" "minor")
    (cinematic_print "custom script play")
    (sleep 4)
    (object_set_permutation "oni_building" "building" "medium")
    (cinematic_print "custom script play")
    (begin
        (object_set_function_variable "oni_building" "building_glow" 0.0 45.0)
        (player_effect_stop 0.5)
    )
    (cinematic_print "custom script play")
    (sleep 30)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc_01_sc_sh14
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 13 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 13)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "sc130_out_sc_01_cin_pelican_14" true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "si_hud_14" true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_lights_initialize_for_shot 13)
    (cinematic_clips_initialize_for_shot 13)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "status" 0.55 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "location" 0.9 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (cinematic_scripting_start_screen_effect 0 0 13 0)
    (cinematic_scripting_start_screen_effect 0 0 13 1)
    (sleep 10)
    (cinematic_scripting_start_effect 0 0 13 0 "oni_building")
    (object_set_function_variable "oni_building" "building_glow" 1.0 0.0)
    (cinematic_print "custom script play")
    (sleep 1)
    (object_set_function_variable "oni_building" "building_glow" 0.0 40.0)
    (cinematic_print "custom script play")
    (sleep 1)
    (begin
        (object_set_permutation "oni_building" "building" "major")
        (player_effect_set_max_rumble 0.2 0.2)
        (player_effect_start 1.0 0.0)
    )
    (cinematic_print "custom script play")
    (sleep 4)
    (player_effect_stop 0.5)
    (cinematic_print "custom script play")
    (sleep 4)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (sleep 2)
    (cinematic_scripting_start_dialogue 0 0 13 0 none)
    (sleep 8)
    (cinematic_scripting_start_effect 0 0 13 1 "oni_building")
    (sleep 3)
    (object_set_function_variable "oni_building" "building_glow" 1.0 0.0)
    (cinematic_print "custom script play")
    (begin
        (object_set_permutation "oni_building" "building" "destroyed")
        (player_effect_set_max_rumble 0.4 0.4)
        (player_effect_start 1.0 0.0)
    )
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_print "custom script play")
    (object_set_function_variable "oni_building" "building_glow" 0.25 100.0)
    (sleep 1)
    (cinematic_scripting_start_effect 0 0 13 2 "oni_building")
    (sleep 2)
    (player_effect_stop 3.0)
    (cinematic_print "custom script play")
    (sleep 3)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.1 0.0)
    (sleep 5)
    (cinematic_scripting_start_screen_effect 0 0 13 2)
    (sleep 1)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.2 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (sleep 12)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.2 0.0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 0 0 13 1 none)
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (sleep 16)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.1 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.5 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (cinematic_scripting_start_screen_effect 0 0 13 3)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "status" 0.6 0.0)
    (sleep 18)
    (cinematic_scripting_start_screen_effect 0 0 13 4)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (sleep 13)
    (cinematic_scripting_start_screen_effect 0 0 13 5)
    (sleep 7)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (sleep 14)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 60)
    (sleep 6)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (sleep 16)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.1 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.4 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "eyes" 0.5 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 8) "timestamp" 0.5 0.0)
    (sleep 14)
    (object_set_permutation "oni_building" "building" "base")
    (cinematic_print "custom script play")
    (cinematic_scripting_stop_screen_effect 0 0 13 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc130_out_sc_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (sc130_out_sc_01_sc_sh1)
    (sc130_out_sc_01_sc_sh2)
    (sc130_out_sc_01_sc_sh3)
    (sc130_out_sc_01_sc_sh4)
    (sc130_out_sc_01_sc_sh5)
    (sc130_out_sc_01_sc_sh6)
    (sc130_out_sc_01_sc_sh7)
    (sc130_out_sc_01_sc_sh8)
    (sc130_out_sc_01_sc_sh9)
    (sc130_out_sc_01_sc_sh10)
    (sc130_out_sc_01_sc_sh11)
    (sc130_out_sc_01_sc_sh12)
    (sc130_out_sc_01_sc_sh13)
    (sc130_out_sc_01_sc_sh14)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 0 0)
    (cinematic_scripting_destroy_object 0 0 1)
    (cinematic_scripting_destroy_object 0 0 2)
    (cinematic_scripting_destroy_object 0 0 3)
    (cinematic_scripting_destroy_object 0 0 4)
    (cinematic_scripting_destroy_object 0 0 5)
    (cinematic_scripting_destroy_object 0 0 6)
    (cinematic_scripting_destroy_object 0 0 7)
    (cinematic_scripting_destroy_object 0 0 8)
    (cinematic_scripting_destroy_object 0 0 9)
    (cinematic_scripting_destroy_object 0 0 10)
)

(script static void sc130_out_sc_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void begin_sc130_out_sc_debug
    (cinematic_zone_activate_for_debugging 0)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
)

(script static void end_sc130_out_sc_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc130_out_sc_debug
    (begin_sc130_out_sc_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc130_out_sc_01_sc)
    (sound_class_set_gain "" 0.0 0)
    (end_sc130_out_sc_debug)
)

(script static void begin_sc130_out_sc
    (cinematic_zone_activate 0)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
)

(script static void end_sc130_out_sc
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_sc
    (begin_sc130_out_sc)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc130_out_sc_01_sc)
    (sound_class_set_gain "" 0.0 0)
    (end_sc130_out_sc)
)

(script static void sc130_in_sc_01_no_hurry_sc_sh1
    (begin
        (cinematic_show_letterbox_immediate true)
        (fade_in 0.0 0.0 0.0 60)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 0 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "sc130_in_sc_01_cin_dutch_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "sc130_in_sc_01_cin_mickey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "sc130_in_sc_01_cin_wraith1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "sc130_in_sc_01_cin_wraith2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "sc130_in_sc_wraithfx1_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 5) true)
    (object_hide (cinematic_scripting_get_object 1 0 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "sc130_in_sc_01_cin_wraith_anti1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 8 "sc130_in_sc_01_cin_wraith_mortar1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 9 "sc130_in_sc_01_cin_wraith_anti2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 10 "sc130_in_sc_01_cin_wraith_mortar2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 11 "sc130_in_sc_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 12 "sc130_in_sc_01_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 13) true)
    (object_hide (cinematic_scripting_get_object 1 0 14) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 15 "detonator_charges_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 16) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 1)
    (cinematic_scripting_start_music 1 0 0 0)
    (device_set_position "dm_charge_05" 0.75)
    (cinematic_print "custom script play")
    (sleep 98)
    (cinematic_scripting_start_dialogue 1 0 0 0 (cinematic_scripting_get_object 1 0 0))
    (sleep 39)
    (cinematic_scripting_start_effect 1 0 0 0 (cinematic_object_get "cin_wraithfx1"))
    (cinematic_scripting_start_effect 1 0 0 1 (cinematic_object_get "cin_wraith_mortar1"))
    (sleep 7)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 2) "firing" 1.0 0.0)
    (sleep 3)
    (cinematic_scripting_start_dialogue 1 0 0 1 (cinematic_scripting_get_object 1 0 1))
    (sleep 26)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_in_sc_01_no_hurry_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 1 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 1)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (object_hide (cinematic_scripting_get_object 1 0 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "sc130_in_sc_01_cin_mickey_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "sc130_in_sc_wraithfx1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc130_in_sc_wraithfx2_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 6) true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (object_hide (cinematic_scripting_get_object 1 0 9) true)
    (object_hide (cinematic_scripting_get_object 1 0 10) true)
    (object_hide (cinematic_scripting_get_object 1 0 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 12 "sc130_in_sc_01_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 13) true)
    (object_hide (cinematic_scripting_get_object 1 0 14) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 15 "detonator_charges_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 16 "sc130_in_sc_wraithfxturret01_fx_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (cinematic_scripting_start_effect 1 0 1 0 (cinematic_object_get "cin_wraithfx2"))
    (sleep 68)
    (cinematic_scripting_start_dialogue 1 0 1 0 (cinematic_scripting_get_object 1 0 1))
    (sleep 94)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_in_sc_01_no_hurry_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 2 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 2)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "sc130_in_sc_01_cin_dutch_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "sc130_in_sc_01_cin_mickey_3" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (object_hide (cinematic_scripting_get_object 1 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc130_in_sc_wraithfx2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "sc130_in_sc_01_cin_technician_3" true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (object_hide (cinematic_scripting_get_object 1 0 9) true)
    (object_hide (cinematic_scripting_get_object 1 0 10) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 11 "sc130_in_sc_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 12 "sc130_in_sc_01_3" true)
    (object_hide (cinematic_scripting_get_object 1 0 13) true)
    (object_hide (cinematic_scripting_get_object 1 0 14) true)
    (object_hide (cinematic_scripting_get_object 1 0 15) true)
    (object_hide (cinematic_scripting_get_object 1 0 16) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (cinematic_scripting_start_effect 1 0 2 0 (cinematic_object_get "cin_wraithfx2"))
    (sleep 10)
    (device_set_position "dm_charge_05" 1.0)
    (cinematic_print "custom script play")
    (sleep 11)
    (cinematic_scripting_start_dialogue 1 0 2 0 (cinematic_scripting_get_object 1 0 0))
    (sleep 34)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_in_sc_01_no_hurry_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 3 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 3)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (object_hide (cinematic_scripting_get_object 1 0 0) true)
    (object_hide (cinematic_scripting_get_object 1 0 1) true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "sc130_in_sc_wraithfx1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc130_in_sc_wraithfx2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "sc130_in_sc_01_cin_technician_4" true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (object_hide (cinematic_scripting_get_object 1 0 9) true)
    (object_hide (cinematic_scripting_get_object 1 0 10) true)
    (object_hide (cinematic_scripting_get_object 1 0 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 12 "sc130_in_sc_01_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 13 "exp_on_wall1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 14 "exp_on_wall2_4" true)
    (object_hide (cinematic_scripting_get_object 1 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 16 "sc130_in_sc_wraithfxturret01_fx_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (cinematic_scripting_start_effect 1 0 3 0 (cinematic_object_get "cin_wraithfx2"))
    (cinematic_scripting_start_effect 1 0 3 1 (cinematic_object_get "cin_wraithfx1"))
    (sleep 5)
    (cinematic_scripting_start_dialogue 1 0 3 0 (cinematic_scripting_get_object 1 0 6))
    (sleep 31)
    (cinematic_object_destroy "cin_wraithfx2")
    (cinematic_scripting_start_effect 1 0 3 2 (cinematic_object_get "explosion_on_wall2"))
    (cinematic_print "custom script play")
    (sleep 27)
    (cinematic_scripting_start_dialogue 1 0 3 1 (cinematic_scripting_get_object 1 0 6))
    (sleep 12)
    (cinematic_scripting_start_effect 1 0 3 3 (cinematic_object_get "explosion_on_wall1"))
    (sleep 1)
    (cinematic_object_destroy "cin_wraithfx1")
    (cinematic_print "custom script play")
    (sleep 63)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_in_sc_01_no_hurry_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 4 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 4)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "sc130_in_sc_01_cin_dutch_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "sc130_in_sc_01_cin_mickey_5" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (object_hide (cinematic_scripting_get_object 1 0 4) true)
    (object_hide (cinematic_scripting_get_object 1 0 5) true)
    (object_hide (cinematic_scripting_get_object 1 0 6) true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (object_hide (cinematic_scripting_get_object 1 0 9) true)
    (object_hide (cinematic_scripting_get_object 1 0 10) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 11 "sc130_in_sc_01_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 12 "sc130_in_sc_01_5" true)
    (object_hide (cinematic_scripting_get_object 1 0 13) true)
    (object_hide (cinematic_scripting_get_object 1 0 14) true)
    (object_hide (cinematic_scripting_get_object 1 0 15) true)
    (object_hide (cinematic_scripting_get_object 1 0 16) true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (sleep 16)
    (cinematic_scripting_start_dialogue 1 0 4 0 (cinematic_scripting_get_object 1 0 1))
    (sleep 74)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_in_sc_01_no_hurry_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 5 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 5)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "sc130_in_sc_01_cin_dutch_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "sc130_in_sc_01_cin_mickey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "sc130_in_sc_01_cin_wraith1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "sc130_in_sc_01_cin_wraith2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "sc130_in_sc_wraithfx1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc130_in_sc_wraithfx2_6" true)
    (object_hide (cinematic_scripting_get_object 1 0 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "sc130_in_sc_01_cin_wraith_anti1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 8 "sc130_in_sc_01_cin_wraith_mortar1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 9 "sc130_in_sc_01_cin_wraith_anti2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 10 "sc130_in_sc_01_cin_wraith_mortar2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 11 "sc130_in_sc_01_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 12 "sc130_in_sc_01_6" true)
    (object_hide (cinematic_scripting_get_object 1 0 13) true)
    (object_hide (cinematic_scripting_get_object 1 0 14) true)
    (object_hide (cinematic_scripting_get_object 1 0 15) true)
    (object_hide (cinematic_scripting_get_object 1 0 16) true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 0.7 0.0)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 2) "firing")
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 3) "firing")
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 2) "firing" 1.0 0.0)
    (sleep 10)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 2) "firing")
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 2) "firing" 1.0 0.0)
    (sleep 5)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 2) "firing")
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 3) "firing" 1.0 0.0)
    (sleep 5)
    (cinematic_scripting_start_effect 1 0 5 0 (cinematic_object_get "cin_wraithfx1"))
    (cinematic_scripting_start_effect 1 0 5 1 (cinematic_object_get "cin_wraith_mortar1"))
    (sleep 5)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 3) "firing")
    (object_set_function_variable (cinematic_scripting_get_object 1 0 2) "firing" 1.0 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 3) "firing" 1.0 0.0)
    (sleep 5)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 3) "firing")
    (sleep 5)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 2) "firing")
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 3) "firing" 1.0 0.0)
    (sleep 5)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 3) "firing")
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 2) "firing" 1.0 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 3) "firing" 1.0 0.0)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 2) "firing")
    (sleep 10)
    (object_clear_function_variable (cinematic_scripting_get_object 1 0 3) "firing")
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc130_in_sc_01_no_hurry_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (sc130_in_sc_01_no_hurry_sc_sh1)
    (sc130_in_sc_01_no_hurry_sc_sh2)
    (sc130_in_sc_01_no_hurry_sc_sh3)
    (sc130_in_sc_01_no_hurry_sc_sh4)
    (sc130_in_sc_01_no_hurry_sc_sh5)
    (sc130_in_sc_01_no_hurry_sc_sh6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 1 0 0)
    (cinematic_scripting_destroy_object 1 0 1)
    (cinematic_scripting_destroy_object 1 0 2)
    (cinematic_scripting_destroy_object 1 0 3)
    (cinematic_scripting_destroy_object 1 0 4)
    (cinematic_scripting_destroy_object 1 0 5)
    (cinematic_scripting_destroy_object 1 0 6)
    (cinematic_scripting_destroy_object 1 0 7)
    (cinematic_scripting_destroy_object 1 0 8)
    (cinematic_scripting_destroy_object 1 0 9)
    (cinematic_scripting_destroy_object 1 0 10)
    (cinematic_scripting_destroy_object 1 0 11)
    (cinematic_scripting_destroy_object 1 0 12)
    (cinematic_scripting_destroy_object 1 0 13)
    (cinematic_scripting_destroy_object 1 0 14)
    (cinematic_scripting_destroy_object 1 0 15)
    (cinematic_scripting_destroy_object 1 0 16)
    (cinematic_object_destroy "cin_mickey")
)

(script static void sc130_in_sc_02_cinette_sc_sh1
    (begin
        (cinematic_show_letterbox_immediate false)
        (fade_in 1.0 1.0 1.0 10)
        (cinematic_hud_on)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 1) 0 "sc130_out_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 0)
    (cinematic_object_create_cinematic_anchor "sc130_out_anchor" "sc130_out_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 "sc130_in_sc_cinette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 "sc130_cinette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 "sc130_cinette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 3 "sc130_cinette_wraith_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 4 "sc130_cinette_exp_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 5 "sc130_in_sc_01_cinette_wraith1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 6 "sc130_in_sc_01_cinette_wraith_anti1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 7 "sc130_in_sc_01_cinette_wraith_mortar1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 8 "sc130_in_sc_01_cinette_wraith2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 9 "sc130_in_sc_01_cinette_wraith_anti2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 10 "sc130_in_sc_01_cinette_wraith_mortar2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 11 "mickey_cinette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 12 "sc130_cinette_wraithturret02_fx_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 13 "sc130_cinette_wraithturret01_fx_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 12) "firing" 1.0 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 13) "firing" 0.0 0.0)
    (sleep 29)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 13) "firing")
    (sleep 22)
    (cinematic_scripting_start_effect 1 1 0 1 (cinematic_object_get "wraithturret01_c_fx"))
    (sleep 28)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 12) "firing")
    (sleep 20)
    (begin
        (player_effect_set_max_rumble 0.3 0.3)
        (player_effect_start 1.0 0.0)
    )
    (cinematic_print "custom script play")
    (cinematic_object_destroy "cin_wraithfx1")
    (cinematic_print "custom script play")
    (cinematic_scripting_start_effect 1 1 0 0 (cinematic_object_get "explosion_on_wall2"))
    (object_set_function_variable (cinematic_scripting_get_object 1 1 13) "firing" 1.0 0.0)
    (sleep 1)
    (player_effect_stop 1.0)
    (cinematic_print "custom script play")
    (sleep 29)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 12) "firing" 1.0 0.0)
    (sleep 5)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 13) "firing")
    (sleep 20)
    (cinematic_scripting_start_dialogue 1 1 0 0 (cinematic_scripting_get_object 1 1 11))
    (sleep 30)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 12) "firing")
    (sleep 55)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 12) "firing" 1.0 0.0)
    (sleep 8)
    (cinematic_scripting_start_dialogue 1 1 0 1 none)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 13) "firing" 1.0 0.0)
    (sleep 10)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 12) "firing")
    (sleep 10)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 13) "firing")
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 12) "firing" 1.0 0.0)
    (sleep 15)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 12) "firing")
    (sleep 15)
    (cinematic_scripting_start_dialogue 1 1 0 2 (cinematic_scripting_get_object 1 1 11))
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 12) "firing" 1.0 0.0)
    (sleep 25)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 12) "firing")
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 1 1 12) "firing" 1.0 0.0)
    (sleep 20)
    (object_clear_function_variable (cinematic_scripting_get_object 1 1 12) "firing")
    (sleep 7)
    (fade_out 1.0 1.0 1.0 0)
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc130_in_sc_02_cinette_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 1) 0)
    (sc130_in_sc_02_cinette_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 1 1 0)
    (cinematic_scripting_destroy_object 1 1 1)
    (cinematic_scripting_destroy_object 1 1 2)
    (cinematic_scripting_destroy_object 1 1 3)
    (cinematic_scripting_destroy_object 1 1 4)
    (cinematic_scripting_destroy_object 1 1 5)
    (cinematic_scripting_destroy_object 1 1 6)
    (cinematic_scripting_destroy_object 1 1 7)
    (cinematic_scripting_destroy_object 1 1 8)
    (cinematic_scripting_destroy_object 1 1 9)
    (cinematic_scripting_destroy_object 1 1 10)
    (cinematic_scripting_destroy_object 1 1 11)
    (cinematic_scripting_destroy_object 1 1 12)
    (cinematic_scripting_destroy_object 1 1 13)
)

(script static void sc130_in_sc_cleanup
    (cinematic_scripting_clean_up 1)
)

(script static void begin_sc130_in_sc_debug
    (cinematic_zone_activate_for_debugging 1)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
)

(script static void end_sc130_in_sc_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 1)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc130_in_sc_debug
    (begin_sc130_in_sc_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc130_in_sc_01_no_hurry_sc)
    (!sc130_in_sc_02_cinette_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc130_in_sc_debug)
)

(script static void begin_sc130_in_sc
    (cinematic_zone_activate 1)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
)

(script static void end_sc130_in_sc
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_in_sc
    (begin_sc130_in_sc)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc130_in_sc_01_no_hurry_sc)
    (!sc130_in_sc_02_cinette_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc130_in_sc)
)

