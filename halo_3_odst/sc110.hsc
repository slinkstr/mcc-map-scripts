; Decompiled with Blamite
; Source file: sc110.hsc
; Start time: 4/7/2022 7:36:51
; Decompilation finished in ~0.005549s
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
(global boolean g_sc110_music01 false)
(global boolean g_sc110_music02 false)
(global boolean g_sc110_music03 false)
(global boolean g_sc110_music04 false)
(global boolean g_sc110_music05 false)
(global boolean g_sc110_music06 false)
(global boolean g_sc110_music07 false)
(global boolean g_sc110_music08 false)
(global boolean g_sc110_music09 false)
(global boolean g_sc110_music10 false)
(global boolean g_sc110_music10_alt false)
(global boolean g_sc110_music11 false)
(global boolean g_sc110_music12 false)
(global boolean g_sc110_music13 false)
(global boolean g_sc110_music14 false)
(global boolean g_sc110_music15 false)
(global boolean g_sc110_music16 false)
(global ai brute_01 none)
(global ai brute_02 none)
(global ai colonel none)
(global ai med none)
(global ai crazy none)
(global ai dutch none)
(global ai fem_marine none)
(global ai marine none)
(global ai marine_01 none)
(global ai marine_02 none)
(global ai marine_03 none)
(global ai marine_04 none)
(global boolean g_playing_dialogue false)
(global vehicle pod_01_warthog_01 none)
(global vehicle pod_01_warthog_02 none)
(global boolean g_md_030_intro false)
(global boolean g_md_040_crazy_marine true)
(global boolean editor false)
(global boolean g_play_cinematics true)
(global boolean g_player_training true)
(global boolean debug true)
(global boolean dialogue true)
(global boolean g_music true)
(global short g_insertion_index 0)
(global short g_pod_01_obj_control 0)
(global short g_pod_02_obj_control 0)
(global short g_pod_03_obj_control 0)
(global short g_pod_04_obj_control 0)
(global short g_pod_02_ghost_escape 0)
(global boolean g_player_on_foot true)
(global short g_player_start_pitch -16)
(global boolean g_null false)
(global real g_nav_offset 0.55)
(global vehicle phantom_01 none)
(global boolean g_pod_02_allies_attack_01 false)
(global boolean g_pod_02_allies_attack_02 false)
(global vehicle phantom_02 none)
(global boolean g_pod_03_allies_end false)
(global vehicle p_04_phantom_02 none)
(global vehicle p_04_phantom_04 none)
(global vehicle v_sur_wraith_01 none)
(global vehicle v_sur_wraith_03 none)
(global vehicle v_sur_chopper_02 none)
(global vehicle v_sur_chopper_04 none)
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

(script static void survival_scenario_weapon_drop
    (print "replenishing warthog")
    (unit_set_current_vitality "v_sur_warthog_01" 500.0 0.0)
    (if (<= (object_get_health "v_sur_warthog_01") 0.0) 
        (object_create_anew "v_sur_warthog_01"))
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
    (sleep 1)
    (kill_volume_enable "kill_sur_room_01")
    (kill_volume_enable "kill_sur_room_02")
    (kill_volume_enable "kill_sur_room_03")
    (kill_volume_enable "kill_sur_room_04")
    (kill_volume_enable "kill_sur_room_05")
    (kill_volume_enable "kill_sur_room_06")
    (kill_volume_enable "kill_sur_room_07")
    (kill_volume_enable "kill_sur_room_08")
    (kill_volume_enable "kill_sur_room_09")
    (kill_volume_enable "kill_sur_room_10")
    (kill_volume_enable "kill_tv_sur_01")
    (kill_volume_enable "kill_tv_sur_02")
)

(script static void survival_kill_volumes_off
    (sleep 1)
    (kill_volume_disable "kill_sur_room_01")
    (kill_volume_disable "kill_sur_room_02")
    (kill_volume_disable "kill_sur_room_03")
    (kill_volume_disable "kill_sur_room_04")
    (kill_volume_disable "kill_sur_room_05")
    (kill_volume_disable "kill_sur_room_06")
    (kill_volume_disable "kill_sur_room_07")
    (kill_volume_disable "kill_sur_room_08")
    (kill_volume_disable "kill_sur_room_09")
    (kill_volume_disable "kill_sur_room_10")
    (kill_volume_disable "kill_tv_sur_01")
    (kill_volume_disable "kill_tv_sur_02")
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

(script startup void sc110_ambient_stub
    (if debug 
        (print "sc110 ambient stub"))
)

(script dormant void obj_friendly_forces_set
    (sleep (* 30.0 5.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "link up with friendly forces"))
    (objectives_show_up_to 0)
    (f_new_intel "obj_new" "obj_1" 0 "fl_exit")
)

(script dormant void obj_friendly_forces_clear
    (sleep_until (>= g_pod_01_obj_control 3) 1)
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "link up with friendly forces"))
    (objectives_finish_up_to 0)
)

(script dormant void obj_second_platoon_set
    (sleep (* 30.0 3.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "find marine second platoon"))
    (objectives_show_up_to 1)
    (f_new_intel "obj_new" "obj_2" 1 "fl_exit")
    (wake obj_second_platoon_clear)
)

(script dormant void obj_second_platoon_clear
    (sleep_until (>= g_pod_03_obj_control 2) 1)
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "find marine second platoon"))
    (objectives_finish_up_to 1)
)

(script dormant void obj_find_colonel_set
    (sleep (* 30.0 1.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "find colonel across bridge"))
    (objectives_show_up_to 2)
    (f_new_intel "obj_new" "obj_3" 2 "fl_exit")
)

(script dormant void obj_find_colonel_clear
    (sleep_until (>= g_pod_04_obj_control 6) 1)
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "find colonel across bridge"))
    (objectives_finish_up_to 2)
)

(script dormant void obj_out_of_park_set
    (sleep (* 30.0 3.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "drive up and out of park"))
    (objectives_show_up_to 3)
    (f_new_intel "obj_new" "obj_4" 3 "fl_exit")
)

(script dormant void obj_out_of_park_clear
    (sleep_until (>= g_pod_04_obj_control 10) 1)
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "drive up and out of park"))
    (objectives_finish_up_to 3)
)

(script dormant void player0_sc110_waypoints
    (f_sc110_waypoints player_00)
)

(script dormant void player1_sc110_waypoints
    (f_sc110_waypoints player_01)
)

(script dormant void player2_sc110_waypoints
    (f_sc110_waypoints player_02)
)

(script dormant void player3_sc110_waypoints
    (f_sc110_waypoints player_03)
)

(script static void f_sc110_waypoints (short player_name)
    (sleep_until 
        (begin
            (f_sleep_until_activate_waypoint player_name)
            (cond
                ((= s_waypoint_index 1)
                    (f_waypoint_activate_1 player_name "fl_pod_01_in")
                )
                ((= s_waypoint_index 2)
                    (f_waypoint_activate_1 player_name "fl_pod_01_fill")
                )
                ((= s_waypoint_index 3)
                    (f_waypoint_activate_1 player_name "fl_pod_02_in")
                )
                ((= s_waypoint_index 4)
                    (f_waypoint_activate_1 player_name "fl_pod_02_fill")
                )
                ((= s_waypoint_index 5)
                    (f_waypoint_activate_1 player_name "fl_pod_03_in")
                )
                ((= s_waypoint_index 6)
                    (f_waypoint_activate_1 player_name "fl_pod_03_out")
                )
                ((= s_waypoint_index 7)
                    (f_waypoint_activate_1 player_name "fl_pod_04_in")
                )
                ((= s_waypoint_index 8)
                    (f_waypoint_activate_1 player_name "fl_exit")
                )
            )
            false
        ) 
    1)
)

(script dormant void s_waypoint_index_1
    (set s_waypoint_index 1)
)

(script dormant void s_waypoint_index_3
    (sleep (* 30.0 5.0))
    (sleep_until 
        (or
            (>= g_pod_02_obj_control 1)
            (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
        ) 
    1)
    (set s_waypoint_index 3)
)

(script dormant void s_waypoint_index_6
    (sleep_until 
        (and
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 0)
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_cov") 3)
        ) 
    1)
    (set s_waypoint_index 6)
)

(script dormant void s_sc110_music01
    (sleep_until (= g_sc110_music01 true) 1)
    (if debug 
        (print "start sc110_music01"))
    (sound_looping_resume "levels\atlas\sc110\music\sc110_music01" none 1.0)
    (sleep_until (= g_sc110_music01 false) 1)
    (if debug 
        (print "stop sc110_music01"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music01")
)

(script dormant void s_sc110_music01_alt
    (sleep_until 
        (or
            (>= g_pod_01_obj_control 5)
            (or
                (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
            )
        ) 
    1)
    (if (< g_pod_01_obj_control 5) 
        (begin
            (sound_looping_set_alternate "levels\atlas\sc110\music\sc110_music01" true)
            (if debug 
                (print "start sc110_music01_alt"))
        )
    )
)

(script dormant void s_sc110_music02
    (sleep_until (= g_sc110_music02 true) 1)
    (if debug 
        (print "start sc110_music02"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music02" none 1.0)
    (sleep_until (= g_sc110_music02 false) 1)
    (if debug 
        (print "stop sc110_music02"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music02")
)

(script dormant void s_sc110_music03
    (sleep_until (= g_sc110_music03 true) 1)
    (if debug 
        (print "start sc110_music03"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music03" none 1.0)
    (sleep_until (= g_sc110_music03 false) 1)
    (if debug 
        (print "stop sc110_music03"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music03")
)

(script dormant void s_sc110_music04
    (sleep_until 
        (or
            (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 1)
            (>= g_pod_01_obj_control 4)
        ) 
    1)
    (set g_sc110_music04 true)
    (if debug 
        (print "start sc110_music04"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music04" none 1.0)
    (sleep 1)
    (sleep_until (= g_sc110_music04 false) 1)
    (if debug 
        (print "stop sc110_music04"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music04")
)

(script dormant void s_sc110_music05
    (sleep_until (= g_sc110_music05 true) 1)
    (if debug 
        (print "start sc110_music05"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music05" none 1.0)
    (sleep_until (= g_sc110_music05 false) 1)
    (if debug 
        (print "stop sc110_music05"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music05")
)

(script dormant void s_sc110_music06
    (sleep_until (= g_sc110_music06 true) 1)
    (if debug 
        (print "start sc110_music06"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music06" none 1.0)
    (sleep_until (= g_sc110_music06 false) 1)
    (if debug 
        (print "stop sc110_music06"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music06")
)

(script dormant void s_sc110_music07
    (sleep_until (= g_sc110_music07 true) 1)
    (if debug 
        (print "start sc110_music07"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music07" none 1.0)
    (sleep_until (= g_sc110_music07 false) 1)
    (if debug 
        (print "stop sc110_music07"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music07")
)

(script dormant void s_sc110_music08
    (sleep_until (= g_sc110_music08 true) 1)
    (if debug 
        (print "start sc110_music08"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music08" none 1.0)
    (sleep_until (= g_sc110_music08 false) 1)
    (if debug 
        (print "stop sc110_music08"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music08")
)

(script dormant void s_sc110_music09
    (sleep_until (>= g_pod_03_obj_control 2) 1)
    (sleep_until 
        (or
            (>= g_pod_03_obj_control 3)
            (volume_test_players "tv_pod_03_game_save_02")
            (volume_test_players "tv_pod_03_building")
        ) 
    1 (* 30.0 60.0))
    (set g_sc110_music09 true)
    (set g_sc110_music10 true)
    (if debug 
        (print "start sc110_music09"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music09" none 1.0)
    (sleep_until (= g_sc110_music09 false) 1)
    (if debug 
        (print "stop sc110_music09"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music09")
)

(script dormant void s_sc110_music10
    (sleep_until (= g_sc110_music10 true) 1)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 2)
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_chopper") 1)
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_watchtower") 0)
            (>= g_pod_03_obj_control 4)
        ) 
    1 (* 30.0 30.0))
    (set g_sc110_music10_alt true)
    (if debug 
        (print "start sc110_music10"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music10" none 1.0)
    (sleep_until (= g_sc110_music10 false) 1)
    (if debug 
        (print "stop sc110_music10"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music10")
)

(script dormant void s_sc110_music10_alt
    (sleep_until (= g_sc110_music10_alt true) 1)
    (sleep_until 
        (or
            (>= g_pod_03_obj_control 5)
            (and
                (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 2)
                (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_shade") 1)
                (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_ghost") 0)
            )
        ) 
    1 (* 30.0 90.0))
    (set g_sc110_music09 false)
    (sound_looping_set_alternate "levels\atlas\sc110\music\sc110_music10" true)
    (if debug 
        (print "stop sc110_music10_alt"))
)

(script dormant void s_sc110_music11
    (sleep_until (= g_sc110_music11 true) 1)
    (if debug 
        (print "start sc110_music11"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music11" none 1.0)
    (sleep_until (= g_sc110_music11 false) 1)
    (if debug 
        (print "stop sc110_music11"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music11")
)

(script dormant void s_sc110_music12
    (sleep_until (= g_sc110_music12 true) 1)
    (if debug 
        (print "start sc110_music12"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music12" none 1.0)
    (sleep_until (= g_sc110_music12 false) 1)
    (if debug 
        (print "stop sc110_music12"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music12")
)

(script dormant void s_sc110_music13
    (sleep_until (= g_sc110_music13 true) 1)
    (sleep (* 30.0 8.0))
    (if debug 
        (print "start sc110_music13"))
    (sleep_until (= g_sc110_music13 false) 1)
    (if debug 
        (print "stop sc110_music13"))
)

(script dormant void s_sc110_music14
    (sleep_until (= g_sc110_music14 true) 1)
    (if debug 
        (print "start sc110_music14"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music14" none 1.0)
    (sleep_until (= g_sc110_music14 false) 1)
    (if debug 
        (print "stop sc110_music14"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music14")
)

(script dormant void s_sc110_music15
    (sleep_until (= g_sc110_music15 true) 1)
    (if debug 
        (print "start sc110_music15"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music15" none 1.0)
    (sleep_until (= g_sc110_music15 false) 1)
    (if debug 
        (print "stop sc110_music15"))
    (sound_looping_stop "levels\atlas\sc110\music\sc110_music15")
)

(script dormant void s_sc110_music16
    (sleep_until (= g_sc110_music16 true) 1)
    (if debug 
        (print "start sc110_music16"))
    (sound_looping_start "levels\atlas\sc110\music\sc110_music16" none 1.0)
    (sleep_until (= g_sc110_music16 false) 1)
    (if debug 
        (print "stop sc110_music16"))
    (sound_impulse_start "levels\atlas\sc110\music\jumpsting" none 1.0)
)

(script dormant void sc110_player_dialogue_check
    (sleep_until 
        (and
            (<= (object_get_health (player0)) 0.0)
            (<= (object_get_health (player1)) 0.0)
            (<= (object_get_health (player2)) 0.0)
            (<= (object_get_health (player3)) 0.0)
        ) 
    5)
    (sound_impulse_stop "sound\dialog\atlas\sc110\mission\sc110_0075_dut")
    (sound_impulse_stop none)
    (sound_impulse_stop none)
    (sound_impulse_stop none)
    (sound_impulse_stop none)
    (sound_impulse_stop none)
    (sound_impulse_stop none)
)

(script dormant void md_010_warthog_intro
    (sleep_until (>= g_pod_01_obj_control 2) 1)
    (set marine_03 "sq_pod_01_allies_02/marine_03")
    (sleep 1)
    (vs_enable_pathfinding_failsafe marine_03 true)
    (vs_enable_looking marine_03 true)
    (vs_enable_targeting marine_03 true)
    (vs_enable_moving marine_03 true)
    (sleep 1)
    (if dialogue 
        (print "marine: trooper! over here! help us secure this vehicle!"))
    (sleep (ai_play_line marine_03 sc110_0055))
    (vs_release_all)
)

(script dormant void md_010_objective
    (set pod_01_warthog_01 (ai_vehicle_get_from_starting_location "sq_pod_01_warthog_01/warthog"))
    (set pod_01_warthog_02 (ai_vehicle_get_from_starting_location "sq_pod_01_warthog_02/warthog"))
    (sleep_until 
        (and
            (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov_infantry") 0)
            (sleep_until (= g_playing_dialogue false))
        ) 
    1)
    (sleep (random_range (* 30.0 1.0) (* 30.0 3.0)))
    (if 
        (and
            (= g_pod_02_obj_control 0)
            (not 
                (or
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
                )
            )
        ) 
            (begin
                (ai_player_dialogue_enable false)
                (vs_cast "gr_pod_01_allies" true 10 "sc110_0060")
                (set fem_marine (vs_role 1))
                (vs_enable_pathfinding_failsafe "gr_pod_01_allies" true)
                (vs_enable_looking "gr_pod_01_allies" true)
                (vs_enable_targeting "gr_pod_01_allies" true)
                (vs_enable_moving "gr_pod_01_allies" true)
                (sleep 1)
                (if dialogue 
                    (print "marine: thanks for the assist, trooper!"))
                (vs_play_line fem_marine true sc110_0060)
                (sleep 10)
                (if dialogue 
                    (print "marine: get this warthog moving! our c.o. needs us to clear this sector!"))
                (vs_play_line fem_marine true sc110_0070)
                (sleep 10)
                (if dialogue 
                    (print "dutch (helmet): affirmative!"))
                (sound_impulse_start "sound\dialog\atlas\sc110\mission\sc110_0075_dut" none 1.0)
                (sleep (sound_impulse_language_time "sound\dialog\atlas\sc110\mission\sc110_0075_dut"))
                (ai_player_dialogue_enable true)
            )
    )
    (wake md_010_warthog_prompt_01)
    (vs_release_all)
)

(script dormant void md_010_warthog_prompt_01
    (sleep (* 30.0 10.0))
    (sleep_until (= g_playing_dialogue false))
    (if 
        (and
            (= g_pod_02_obj_control 0)
            (not 
                (or
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
                )
            )
        ) 
            (begin
                (vs_cast "gr_pod_01_allies" true 10 "sc110_0080")
                (set fem_marine (vs_role 1))
                (vs_enable_pathfinding_failsafe "gr_pod_01_allies" true)
                (vs_enable_looking "gr_pod_01_allies" true)
                (vs_enable_targeting "gr_pod_01_allies" true)
                (vs_enable_moving "gr_pod_01_allies" true)
                (sleep 1)
                (if dialogue 
                    (print "marine: let's do this, trooper! you drive, i'll shoot!"))
                (vs_play_line fem_marine true sc110_0080)
                (wake md_010_warthog_prompt_02)
                (vs_release_all)
            )
    )
)

(script dormant void md_010_warthog_prompt_02
    (sleep (* 30.0 10.0))
    (sleep_until (= g_playing_dialogue false))
    (if 
        (and
            (= g_pod_02_obj_control 0)
            (not 
                (or
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
                )
            )
        ) 
            (begin
                (vs_cast "gr_pod_01_allies" true 10 "sc110_0090")
                (set fem_marine (vs_role 1))
                (vs_enable_pathfinding_failsafe "gr_pod_01_allies" true)
                (vs_enable_looking "gr_pod_01_allies" true)
                (vs_enable_targeting "gr_pod_01_allies" true)
                (vs_enable_moving "gr_pod_01_allies" true)
                (sleep 1)
                (if dialogue 
                    (print "marine: come on! we'll need the 'hog if we're gonna take-out all this covenant armor!"))
                (vs_play_line fem_marine true sc110_0090)
                (wake md_010_warthog_prompt_03)
                (vs_release_all)
            )
    )
)

(script dormant void md_010_warthog_prompt_03
    (sleep (* 30.0 10.0))
    (sleep_until (= g_playing_dialogue false))
    (if 
        (and
            (= g_pod_02_obj_control 0)
            (not 
                (or
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
                    (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
                    (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
                )
            )
        ) 
            (begin
                (vs_cast "gr_pod_01_allies" true 10 "sc110_0095")
                (set fem_marine (vs_role 1))
                (vs_enable_pathfinding_failsafe "gr_pod_01_allies" true)
                (vs_enable_looking "gr_pod_01_allies" true)
                (vs_enable_targeting "gr_pod_01_allies" true)
                (vs_enable_moving "gr_pod_01_allies" true)
                (sleep 1)
                (if dialogue 
                    (print "marine: trooper! get in the warthog and drive!"))
                (vs_play_line fem_marine true sc110_0095)
                (object_cannot_die "pod_01_warthog_03" false)
                (vs_release_all)
            )
    )
)

(script dormant void md_010_chopper_hint
    (sleep_until 
        (or
            (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
            (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
            (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
            (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
            (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
            (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
            (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
            (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
        )
    )
    (object_cannot_die "pod_01_warthog_03" false)
    (sleep (* 30.0 7.0))
    (sleep_until (= g_playing_dialogue false))
    (vs_cast "gr_pod_01_allies" true 10 "sc110_0100")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_pod_01_allies" true)
    (vs_enable_looking "gr_pod_01_allies" true)
    (vs_enable_targeting "gr_pod_01_allies" true)
    (vs_enable_moving "gr_pod_01_allies" true)
    (sleep 1)
    (if 
        (and
            (= g_pod_02_obj_control 0)
            (> (ai_task_count "obj_pod_01_cov/gt_pod_01_chopper") 1)
        ) 
            (begin
                (if dialogue 
                    (print "marine: watch that chopper! hit it head-on, and it'll tear us to pieces!"))
                (vs_play_line marine true sc110_0100)
            )
    )
    (sleep (* 30.0 10.0))
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (or
                (> g_pod_02_obj_control 0)
                (>= g_pod_01_obj_control 3)
            )
        ) 
    1)
    (if 
        (and
            (= g_pod_02_obj_control 0)
            (> (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 0)
            (or
                (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
            )
        ) 
            (begin
                (if dialogue 
                    (print "marine: keep moving! don't let that wraith take a shot at us!"))
                (vs_play_line marine true sc110_0105)
            )
    )
    (sleep (* 30.0 10.0))
    (sleep_until (= g_playing_dialogue false))
    (if 
        (and
            (= g_pod_02_obj_control 0)
            (> (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 0)
            (or
                (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
                (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
                (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
                (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player0))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player1))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player2))
                (vehicle_test_seat_unit "pod_01_warthog_04" none (player3))
            )
        ) 
            (begin
                (if dialogue 
                    (print "marine: swing around behind the wraith! it's got less armor in back!"))
                (vs_play_line marine true sc110_0110)
            )
    )
    (vs_release_all)
)

(script dormant void md_010_combat_end
    (sleep_until 
        (or
            (>= g_pod_01_obj_control 5)
            (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
        ) 
    1)
    (set g_sc110_music04 true)
    (sleep 5)
    (set g_sc110_music01 false)
    (set g_sc110_music02 false)
    (set g_sc110_music03 false)
    (set g_sc110_music04 false)
    (if (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0) 
        (sleep 60))
    (ai_player_dialogue_enable false)
    (set g_playing_dialogue true)
    (if dialogue 
        (print "marine (radio): colonel? sector's clear! and we found some backup!"))
    (sleep (ai_play_line_on_object none sc110_0125))
    (sleep 10)
    (if dialogue 
        (print "colonel (radio): say again, marine? i got drones overhead and oni brass yelling in my ear!"))
    (sleep (ai_play_line_on_object none sc110_0130))
    (sleep 10)
    (if dialogue 
        (print "dutch (helmet): odst, reporting for duty, sir!"))
    (sound_impulse_start "sound\dialog\atlas\sc110\mission\sc110_0140_dut" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc110\mission\sc110_0140_dut"))
    (sleep 10)
    (if dialogue 
        (print "colonel (radio): nice of you to drop in, trooper! head through the park to my second platoon's location! they're taking heavy casualties, and need immediate assistance!"))
    (sleep (ai_play_line_on_object none sc110_0150))
    (sleep 10)
    (if dialogue 
        (print "dutch (helmet): roger that! i'm oscar mike!"))
    (sound_impulse_start "sound\dialog\atlas\sc110\mission\sc110_0155_dut" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc110\mission\sc110_0155_dut"))
    (set g_playing_dialogue false)
    (sleep 10)
    (set g_sc110_music01 false)
    (set g_sc110_music02 false)
    (set g_sc110_music03 false)
    (set g_sc110_music04 false)
    (ai_player_dialogue_enable true)
    (wake md_010_transition_flavor)
    (wake obj_second_platoon_set)
)

(script dormant void md_010_transition_flavor
    (sleep (* 30.0 5.0))
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (or
                (and
                    (>= g_pod_01_obj_control 4)
                    (= g_pod_02_obj_control 0)
                    (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
                )
                (and
                    (> g_pod_02_obj_control 0)
                    (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_watchtower") 0)
                    (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 1)
                )
                (>= g_pod_02_obj_control 4)
            )
        )
    )
    (set g_playing_dialogue true)
    (ai_player_dialogue_enable false)
    (if dialogue 
        (print "marine: where's the rest of your team, trooper?"))
    (sleep (ai_play_line_on_object none sc110_0160))
    (sleep 10)
    (if dialogue 
        (print "dutch: scattered. dead. i don't know."))
    (sound_impulse_start "sound\dialog\atlas\sc110\mission\sc110_0170_dut" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc110\mission\sc110_0170_dut"))
    (sleep 10)
    (if dialogue 
        (print "marine: that's too bad! we're gonna need all the men we can getï¿½"))
    (sleep (ai_play_line_on_object none sc110_0180))
    (set g_playing_dialogue false)
    (ai_player_dialogue_enable true)
    (vs_release_all)
)

(script dormant void md_020_brute_02
    (sleep_until (>= g_pod_02_obj_control 4) 1)
    (set brute_01 "sq_pod_02_cov_02/brute_01")
    (vs_enable_pathfinding_failsafe brute_01 true)
    (vs_enable_looking brute_01 true)
    (vs_enable_targeting brute_01 true)
    (vs_enable_moving brute_01 true)
    (sleep 1)
    (if dialogue 
        (print "brute: stand firm! (short, angry roar) stop the humans in their tracks!"))
    (sleep (ai_play_line brute_01 sc110_0200))
    (sleep 10)
    (vs_release_all)
)

(script dormant void md_020_ghost_escape
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (>= g_pod_02_ghost_escape 1)
        ) 
    1)
    (vs_cast "gr_pod_01_allies" false 10 "sc110_0220")
    (set marine_04 (vs_role 1))
    (vs_enable_pathfinding_failsafe brute_01 true)
    (vs_enable_looking brute_01 true)
    (vs_enable_targeting brute_01 true)
    (vs_enable_moving brute_01 true)
    (vs_enable_pathfinding_failsafe "gr_pod_01_allies" true)
    (vs_enable_looking "gr_pod_01_allies" true)
    (vs_enable_targeting "gr_pod_01_allies" true)
    (vs_enable_moving "gr_pod_01_allies" true)
    (sleep 1)
    (if dialogue 
        (print "brute: warn the chieftain! the enemy has breached our line!"))
    (sleep (ai_play_line brute_01 sc110_0210))
    (sleep 10)
    (if dialogue 
        (print "marine: kill that ghost! before it raises the alarm!"))
    (vs_play_line marine_04 true sc110_0220)
    (vs_release_all)
)

(script dormant void md_020_transition_flavor_01
    (sleep_until (volume_test_players "tv_pod_02_transition_flavor") 1)
    (sleep_until (= g_playing_dialogue false))
    (ai_player_dialogue_enable false)
    (set g_playing_dialogue true)
    (if dialogue 
        (print "colonel (radio): trooper, you're almost at second platoon's location! give 'em a hand then push to the primary objective!"))
    (sleep (ai_play_line_on_object none sc110_0230))
    (sleep 10)
    (if dialogue 
        (print "dutch (helmet): what is the objective, colonel?"))
    (sound_impulse_start "sound\dialog\atlas\sc110\mission\sc110_0240_dut" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc110\mission\sc110_0240_dut"))
    (sleep 10)
    (if dialogue 
        (print "colonel (radio): the covenant carrier that just slipped away from the city? we need to secure its old lz, snatch a tier-one asset!"))
    (sleep (ai_play_line_on_object none sc110_0250))
    (set g_sc110_music05 false)
    (set g_sc110_music06 false)
    (set g_sc110_music07 false)
    (set g_sc110_music08 false)
    (ai_player_dialogue_enable true)
    (set g_playing_dialogue false)
)

(script dormant void md_030_intro
    (sleep_until 
        (or
            (= g_md_030_intro true)
            (>= g_pod_03_obj_control 2)
        ) 
    1)
    (if dialogue 
        (print "marine (radio): trooper, this is second platoon! see what you can do about those wraiths!"))
    (sleep (ai_play_line_on_object none sc110_0270))
    (sleep 10)
    (wake md_030_combat_end)
)

(script dormant void md_040_crazy_marine
    (sleep_until (volume_test_players "tv_pod_04_allies_crazy") 1)
    (set crazy "sq_pod_04_allies_crazy/start_crazy")
    (set med "sq_pod_04_allies_med/start_med")
    (sleep 1)
    (vs_enable_pathfinding_failsafe crazy false)
    (vs_enable_looking crazy false)
    (vs_enable_targeting crazy false)
    (vs_enable_moving crazy false)
    (vs_enable_pathfinding_failsafe med false)
    (vs_enable_looking med false)
    (vs_enable_targeting med false)
    (vs_enable_moving med false)
    (sleep 1)
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "crazy: no. no! you're not listening! it's a zoo, ok?"))
            (sleep (ai_play_line crazy sc110_0300))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "marine: technically it's a corporate funded wildlife reserve."))
            (sleep (ai_play_line med sc110_0310))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "crazy: semantics! this whole place is oneï¿½bigï¿½cage!"))
            (sleep (ai_play_line crazy sc110_0320))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "marine: listen, marine. you're wounded. you gotta try and relax --"))
            (sleep (ai_play_line med sc110_0330))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "crazy: except weï¿½ we're the zebras, get it?! all fenced-in and ready to for the slaughter!"))
            (sleep (ai_play_line crazy sc110_0340))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "marine: and the covenantï¿½ ?"))
            (sleep (ai_play_line med sc110_0350))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "crazy: they're the lions! (snarls like a lion)"))
            (sleep (ai_play_line crazy sc110_0360))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "marine: careful, i think you strained a metaphor."))
            (sleep (ai_play_line med sc110_0370))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "crazy: oh, god! is that serious?!"))
            (sleep (ai_play_line crazy sc110_0371))
            (sleep 10)
        )
    )
    (if (= (ai_task_count "obj_pod_04_allies/gt_pod_04_allies_injured") 2) 
        (begin
            (if dialogue 
                (print "marine: only if you keep it up."))
            (sleep (ai_play_line med sc110_0372))
        )
    )
    (set g_md_040_crazy_marine false)
    (vs_release_all)
)

(script dormant void md_030_combat_end
    (sleep (random_range (* 30.0 5.0) (* 30.0 7.0)))
    (ai_player_dialogue_enable false)
    (if (< g_pod_03_obj_control 5) 
        (begin
            (set g_playing_dialogue true)
            (if dialogue 
                (print "dutch: where's the colonel?"))
            (sound_impulse_start "sound\dialog\atlas\sc110\mission\sc110_0380_dut" none 1.0)
            (sleep (sound_impulse_language_time "sound\dialog\atlas\sc110\mission\sc110_0380_dut"))
            (sleep 10)
            (set g_playing_dialogue false)
        )
    )
    (if (< g_pod_03_obj_control 5) 
        (begin
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine (radio): pinned-down near the covenant lz! "))
            (sleep (ai_play_line_on_object none sc110_0390))
            (sleep 10)
            (set g_playing_dialogue false)
        )
    )
    (if (< g_pod_03_obj_control 5) 
        (begin
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine (radio): once we clear this enemy armor, we can roll across the bridge  to his location!"))
            (sleep (ai_play_line_on_object none sc110_0400))
            (set g_playing_dialogue false)
        )
    )
    (ai_player_dialogue_enable true)
    (wake obj_find_colonel_set)
    (wake obj_find_colonel_clear)
)

(script dormant void md_030_objective_prompt
    (sleep_until 
        (and
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 0)
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_cov") 3)
        ) 
    1)
    (sleep (* 30.0 (random_range 3 6)))
    (set g_sc110_music10 false)
    (set g_sc110_music11 true)
    (if (< g_pod_03_obj_control 4) 
        (begin
            (if dialogue 
                (print "marine (radio): trooper! drive toward the orbital tether -- it'll lead you to the bridge!"))
            (sleep (ai_play_line_on_object none sc110_0410))
            (sleep (* 30.0 15.0))
        )
    )
    (if (< g_pod_03_obj_control 4) 
        (begin
            (if dialogue 
                (print "marine (radio): move your ass, trooper! get across the bridge! now!"))
            (sleep (ai_play_line_on_object none sc110_0420))
        )
    )
    (vs_release_all)
)

(script dormant void md_035_tether_break
    (sleep_until (>= g_pod_03_obj_control 5) 1)
    (sleep_until (= g_playing_dialogue false))
    (if dialogue 
        (print "marine (radio): look! the elevator! (pause) incoming!"))
    (sleep (ai_play_line_on_object none sc110_0430))
    (sleep 120)
    (wake md_035_tether_aftermath)
)

(script dormant void md_035_tether_aftermath
    (ai_player_dialogue_enable false)
    (if dialogue 
        (print "dutch (helmet): what the hell just happened? "))
    (sound_impulse_start "sound\dialog\atlas\sc110\mission\sc110_0450_dut" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc110\mission\sc110_0450_dut"))
    (sleep 10)
    (if dialogue 
        (print "marine (radio): the slipspace rupture! must have weakened the support rings!"))
    (sleep (ai_play_line_on_object none sc110_0460))
    (sleep 10)
    (if dialogue 
        (print "colonel (radio, static): all unitsâ€¦ (coughs)  target assets are on the moveâ€¦  everyone clear the areaâ€¦before more debris comes down... (dies)"))
    (sleep (ai_play_line_on_object none sc110_0480))
    (sleep 10)
    (if dialogue 
        (print "marine (radio): colonel? sir! (pause)  dammit! he's gone!"))
    (sleep (ai_play_line_on_object none sc110_0520))
    (ai_player_dialogue_enable true)
    (wake md_035_objective_prompt)
)

(script dormant void md_035_objective_prompt
    (sleep (* 30.0 2.0))
    (if dialogue 
        (print "marine (radio): trooper! head up the hill! we gotta find a way out of this park!"))
    (sleep (ai_play_line_on_object none sc110_0550))
    (set g_sc110_music11 false)
    (wake obj_out_of_park_set)
    (wake obj_out_of_park_clear)
    (sleep (* 30.0 8.0))
    (if (= g_pod_04_obj_control 0) 
        (begin
            (if dialogue 
                (print "marine (radio): keep driving uphill, trooper! it's the only way out!"))
            (sleep (ai_play_line_on_object none sc110_0560))
        )
    )
    (vs_release_all)
)

(script dormant void md_040_brute
    (sleep_until (volume_test_players "tv_pod_04_exit_south") 1)
    (vs_cast "gr_pod_04_cov" true 10 "sc110_0600")
    (set brute_02 (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_pod_04_cov" true)
    (vs_enable_looking "gr_pod_04_cov" true)
    (vs_enable_targeting "gr_pod_04_cov" true)
    (vs_enable_moving "gr_pod_04_cov" true)
    (sleep 1)
    (if dialogue 
        (print "brute: let no human escape -- to say what they have seen!"))
    (vs_play_line brute_02 true sc110_0600)
    (vs_release_all)
)

(script dormant void md_040_exit_prompt_01
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (volume_test_players "tv_pod_04_exit")
        ) 
    1)
    (if (< g_pod_04_obj_control 10) 
        (begin
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine (radio): found a hole in the wall, trooper! drive right through it!"))
            (sleep (ai_play_line_on_object none sc110_0610))
            (set g_playing_dialogue false)
        )
    )
    (sleep (* 30.0 8.0))
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (volume_test_players "tv_pod_04_exit")
        ) 
    1)
    (if (< g_pod_04_obj_control 10) 
        (begin
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine (radio): there's a hole! floor it!"))
            (sleep (ai_play_line_on_object none sc110_0630))
            (set g_playing_dialogue false)
        )
    )
    (sleep (* 30.0 8.0))
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (volume_test_players "tv_pod_04_exit")
        ) 
    1)
    (if (< g_pod_04_obj_control 10) 
        (begin
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine (radio): look, the wall's broken! floor it!"))
            (sleep (ai_play_line_on_object none sc110_0635))
            (set g_playing_dialogue false)
        )
    )
)

(script dormant void md_040_exit_prompt_02
    (sleep_until (> (ai_task_count "obj_pod_04_cov_final/gt_pod_04_cov_final") 0) 1)
    (sleep 30)
    (sleep_until 
        (and
            (sleep_until (= g_playing_dialogue false))
            (<= (ai_task_count "obj_pod_04_cov_final/gt_pod_04_cov_final") 0)
        ) 
    1)
    (sleep (random_range (* 30.0 1.0) (* 30.0 2.0)))
    (if 
        (and
            (< g_pod_04_obj_control 10)
            (not (volume_test_players "tv_pod_04_exit"))
        ) 
            (begin
                (set g_playing_dialogue true)
                (if dialogue 
                    (print "marine (radio): get your vehicle over that cliff!"))
                (sleep (ai_play_line_on_object none sc110_0615))
                (set g_playing_dialogue false)
            )
    )
    (sleep (* 30.0 8.0))
    (sleep_until (= g_playing_dialogue false))
    (if 
        (and
            (< g_pod_04_obj_control 10)
            (not (volume_test_players "tv_pod_04_exit"))
        ) 
            (begin
                (set g_playing_dialogue true)
                (if dialogue 
                    (print "marine (radio): trooper! make the jump! now!"))
                (sleep (ai_play_line_on_object none sc110_0620))
                (set g_playing_dialogue false)
            )
    )
    (sleep (* 30.0 8.0))
    (sleep_until (= g_playing_dialogue false))
    (if 
        (and
            (< g_pod_04_obj_control 10)
            (not (volume_test_players "tv_pod_04_exit"))
        ) 
            (begin
                (set g_playing_dialogue true)
                (if dialogue 
                    (print "marine (radio): drive through that gap and get the hell out of here, trooper!"))
                (sleep (ai_play_line_on_object none sc110_0625))
                (set g_playing_dialogue false)
            )
    )
)

(script static boolean obj_pwrait_0_3
    (>= g_pod_01_obj_control 3)
)

(script static boolean obj_pchopp_0_5
    (or
        (>= g_pod_01_obj_control 3)
        (= g_player_on_foot false)
    )
)

(script static boolean obj_pghost_0_8
    (volume_test_players "tv_ghost_defence")
)

(script static boolean obj_pchopp_0_9
    (or
        (>= g_pod_01_obj_control 3)
        (= g_player_on_foot false)
    )
)

(script static boolean obj_pchopp_0_10
    (< g_pod_01_obj_control 3)
)

(script static boolean obj_pghost_0_11
    (>= g_pod_01_obj_control 2)
)

(script static boolean obj_pwrait_0_12
    (or
        (>= g_pod_01_obj_control 3)
        (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov_infantry") 0)
    )
)

(script static boolean obj_pcov_r_0_21
    (< g_pod_01_obj_control 2)
)

(script static boolean obj_pjacka_0_24
    (>= g_pod_01_obj_control 3)
)

(script static boolean obj_pwrait_0_29
    (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 2)
)

(script static boolean obj_pchopp_0_32
    (> (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 2)
)

(script static boolean obj_pcov_l_0_34
    (< g_pod_01_obj_control 2)
)

(script static boolean obj_pcov_t_0_35
    (or
        (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov_infantry") 2)
        (= (ai_task_count "obj_pod_01_allies/gt_pod_01_allies_front") 0)
    )
)

(script static boolean obj_pphant_0_36
    (> (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 0)
)

(script static boolean obj_pwarth_1_2
    (>= g_pod_01_obj_control 3)
)

(script static boolean obj_pwarth_1_6
    (>= g_pod_01_obj_control 3)
)

(script static boolean obj_pallie_1_11
    (= g_pod_01_obj_control 0)
)

(script static boolean obj_pallie_1_13
    (< g_pod_01_obj_control 2)
)

(script static boolean obj_pgt_po_1_15
    (= g_player_on_foot false)
)

(script static boolean obj_pgt_po_1_17
    (= g_player_on_foot true)
)

(script static boolean obj_pwarth_1_18
    (>= g_pod_01_obj_control 3)
)

(script static boolean obj_pwarth_1_19
    (or
        (>= g_pod_01_obj_control 5)
        (= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
    )
)

(script static boolean obj_pwarho_1_20
    (or
        (>= g_pod_01_obj_control 5)
        (= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
    )
)

(script static boolean obj_pwarth_1_22
    (= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
)

(script static boolean obj_pallie_1_24
    (or
        (>= g_pod_01_obj_control 5)
        (= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
    )
)

(script static boolean obj_pallie_1_25
    (or
        (>= g_pod_01_obj_control 5)
        (= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov") 0)
    )
)

(script static boolean obj_pallie_1_26
    (<= (ai_task_count "obj_pod_01_allies/gt_pod_01_allies_front") 2)
)

(script static boolean obj_pjacka_3_2
    (>= g_pod_02_obj_control 1)
)

(script static boolean obj_pcov_w_3_4
    (>= g_pod_02_obj_control 2)
)

(script static boolean obj_pghost_3_10
    (>= g_pod_02_obj_control 2)
)

(script static boolean obj_pchopp_3_12
    (>= g_pod_02_obj_control 3)
)

(script static boolean obj_pbansh_3_16
    (and
        (>= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 2)
        (< g_pod_02_obj_control 5)
    )
)

(script static boolean obj_pgrunt_3_19
    (< g_pod_02_obj_control 2)
)

(script static boolean obj_pcov_w_3_23
    (>= g_pod_02_obj_control 2)
)

(script static boolean obj_pchopp_3_24
    (or
        (>= g_pod_02_obj_control 4)
        (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_shade") 2)
    )
)

(script static boolean obj_pghost_3_26
    (= g_pod_02_ghost_escape 1)
)

(script static boolean obj_pcov_a_3_29
    (>= g_pod_02_obj_control 4)
)

(script static boolean obj_pgrunt_3_31
    (< g_pod_02_obj_control 2)
)

(script static boolean obj_pgrunt_3_34
    (< g_pod_02_obj_control 5)
)

(script static boolean obj_pbansh_3_35
    (and
        (>= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 2)
        (< g_pod_02_obj_control 5)
    )
)

(script static boolean obj_pwarth_4_2
    (and
        (= g_pod_02_allies_attack_01 true)
        (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 1)
    )
)

(script static boolean obj_pgt_po_4_10
    (= g_player_on_foot false)
)

(script static boolean obj_pgt_po_4_12
    (= g_player_on_foot true)
)

(script static boolean obj_pwarho_4_13
    (= g_pod_02_allies_attack_02 true)
)

(script static boolean obj_pwarth_4_14
    (and
        (> g_pod_02_obj_control 0)
        (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 1)
        (= (ai_task_count "obj_pod_02_cov/gt_pod_02_jackal") 0)
        (= (ai_task_count "obj_pod_02_cov/gt_pod_02_watchtower") 0)
    )
)

(script static boolean obj_pwarth_4_15
    (and
        (> g_pod_02_obj_control 0)
        (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_cov") 6)
    )
)

(script static boolean obj_pwarth_4_16
    (>= g_pod_02_obj_control 3)
)

(script static boolean obj_pallie_4_17
    (= g_pod_02_allies_attack_02 true)
)

(script static boolean obj_pdalli_4_18
    (= g_pod_02_allies_attack_02 true)
)

(script static boolean obj_pwarth_4_21
    (= g_pod_02_allies_attack_02 true)
)

(script static boolean obj_pwarth_4_22
    (and
        (= g_pod_02_allies_attack_01 true)
        (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 1)
    )
)

(script static boolean obj_pallie_4_23
    (and
        (= g_pod_02_allies_attack_01 true)
        (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 1)
    )
)

(script static boolean obj_pallie_4_24
    (and
        (= g_pod_02_allies_attack_01 true)
        (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 1)
    )
)

(script static boolean obj_pwrait_5_6
    (or
        (>= g_pod_03_obj_control 2)
        (= g_pod_02_ghost_escape 2)
    )
)

(script static boolean obj_pchopp_5_14
    (< g_pod_03_obj_control 3)
)

(script static boolean obj_pchopp_5_15
    (or
        (> (ai_task_count "obj_pod_03_cov/gt_pod_03_ghost") 0)
        (= (ai_task_count "obj_pod_03_cov/gt_pod_03_chopper") 3)
    )
)

(script static boolean obj_pcov_0_5_29
    (< g_pod_03_obj_control 1)
)

(script static boolean obj_pwrait_5_30
    (>= g_pod_03_obj_control 3)
)

(script static boolean obj_pcov_0_5_32
    (< g_pod_03_obj_control 1)
)

(script static boolean obj_pcov_0_5_36
    (volume_test_players "tv_pod_03_building")
)

(script static boolean obj_pjacka_5_37
    (<= (ai_task_count "obj_pod_03_cov/gt_phantom_02_cov") 2)
)

(script static boolean obj_pwrait_5_38
    (volume_test_players "tv_pod03_wraith")
)

(script static boolean obj_pallie_6_4
    (= (ai_task_count "obj_pod_03_cov/gt_pod_03_shade") 4)
)

(script static boolean obj_pallie_6_6
    (<= g_pod_03_obj_control 1)
)

(script static boolean obj_pallie_6_7
    (> (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 0)
)

(script static boolean obj_pallie_6_9
    (<= g_pod_03_obj_control 1)
)

(script static boolean obj_pallie_6_11
    (< g_pod_03_obj_control 1)
)

(script static boolean obj_pallie_6_12
    (> (ai_task_count "obj_pod_03_cov/gt_pod_03_shade") 2)
)

(script static boolean obj_pallie_6_13
    (<= g_pod_03_obj_control 1)
)

(script static boolean obj_pgt_po_6_19
    (= g_player_on_foot false)
)

(script static boolean obj_pgt_po_6_20
    (= g_player_on_foot true)
)

(script static boolean obj_pwarth_6_24
    (and
        (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_shade") 1)
        (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 0)
    )
)

(script static boolean obj_pwarth_6_25
    (= g_pod_03_allies_end true)
)

(script static boolean obj_pwarth_6_26
    (= g_pod_03_allies_end true)
)

(script static boolean obj_pallie_6_27
    (= g_pod_03_allies_end true)
)

(script static boolean obj_pallli_6_28
    (= g_pod_03_allies_end true)
)

(script static boolean obj_pwarth_6_29
    (>= g_pod_03_obj_control 2)
)

(script static boolean obj_pwarth_6_30
    (>= g_pod_03_obj_control 6)
)

(script static boolean obj_pwarth_6_31
    (>= g_pod_03_obj_control 6)
)

(script static boolean obj_pwarth_6_32
    (>= g_pod_03_obj_control 6)
)

(script static boolean obj_pallie_6_33
    (>= g_pod_03_obj_control 6)
)

(script static boolean obj_pallie_6_34
    (>= g_pod_03_obj_control 6)
)

(script static boolean obj_pbansh_7_3
    (>= g_pod_04_obj_control 1)
)

(script static boolean obj_pbansh_7_4
    (>= g_pod_04_obj_control 1)
)

(script static boolean obj_pgrunt_7_6
    (>= g_pod_04_obj_control 3)
)

(script static boolean obj_pgrunt_7_8
    (>= g_pod_04_obj_control 3)
)

(script static boolean obj_pjacka_7_11
    (>= g_pod_04_obj_control 3)
)

(script static boolean obj_pghost_7_18
    (>= g_pod_04_obj_control 2)
)

(script static boolean obj_pghost_7_19
    (>= g_pod_04_obj_control 4)
)

(script static boolean obj_pallie_8_1
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pallie_8_2
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pgt_po_8_6
    (= g_player_on_foot false)
)

(script static boolean obj_pgt_po_8_8
    (= g_player_on_foot true)
)

(script static boolean obj_pghost_8_12
    (>= g_pod_04_obj_control 8)
)

(script static boolean obj_pghost_8_13
    (>= g_pod_04_obj_control 7)
)

(script static boolean obj_pghost_8_16
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pwarth_8_17
    (>= g_pod_04_obj_control 8)
)

(script static boolean obj_pwarth_8_18
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pchopp_8_21
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pchopp_8_22
    (>= g_pod_04_obj_control 7)
)

(script static boolean obj_pchopp_8_23
    (>= g_pod_04_obj_control 8)
)

(script static boolean obj_pwarth_8_24
    (and
        (volume_test_players "tv_pod_04_vehicle_exit")
        (>= g_pod_04_obj_control 7)
        (<= (ai_task_count "obj_pod_04_cov_final/gt_pod_04_cov_final") 0)
    )
)

(script static boolean obj_pwarth_8_25
    (and
        (>= g_pod_04_obj_control 2)
        (<= (ai_task_count "obj_pod_04_cov_upper/gt_pod_04_cov_upper") 0)
    )
)

(script static boolean obj_pwarth_8_26
    (and
        (>= g_pod_04_obj_control 2)
        (<= (ai_task_count "obj_pod_04_cov_lower/gt_pod_04_cov_lower") 0)
    )
)

(script static boolean obj_pwarth_8_29
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pwarth_8_30
    (>= g_pod_04_obj_control 7)
)

(script static boolean obj_pwarth_8_31
    (>= g_pod_04_obj_control 8)
)

(script static boolean obj_pallie_8_33
    (= g_md_040_crazy_marine false)
)

(script static boolean obj_pjacka_9_3
    (>= g_pod_04_obj_control 6)
)

(script static boolean obj_pjacka_9_4
    (>= g_pod_04_obj_control 4)
)

(script static boolean obj_pcov_a_9_7
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pcov_a_9_8
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pwrait_9_11
    (<= g_pod_04_obj_control 4)
)

(script static boolean obj_pwrait_9_12
    (>= g_pod_04_obj_control 1)
)

(script static boolean obj_pghost_9_14
    (>= g_pod_04_obj_control 5)
)

(script static boolean obj_pcov_a_9_17
    (>= g_pod_04_obj_control 6)
)

(script static boolean obj_pbrute_10_10
    (< g_pod_04_obj_control 7)
)

(script static boolean obj_pbrute_10_11
    (< g_pod_04_obj_control 7)
)

(script static boolean obj_pbrute_10_15
    (and
        (volume_test_players "tv_pod_04_exit_south")
        (>= g_pod_04_obj_control 7)
    )
)

(script static boolean obj_pbrute_10_16
    (and
        (volume_test_players "tv_pod_04_exit_north")
        (>= g_pod_04_obj_control 7)
    )
)

(script static boolean obj_sinfan_11_5
    (and
        (<= (ai_task_count "obj_sc110_survival/remaining_gate") 3)
        (<= (ai_task_count "obj_sc110_survival/infantry_top_front") 0)
        (<= (ai_task_count "obj_sc110_survival/hero_follow") 0)
    )
)

(script static boolean obj_shero__11_11
    (<= (ai_task_count "obj_sc110_survival/remaining_gate") 3)
)

(script static boolean obj_sinfan_11_27
    (volume_test_players "tv_sur_bldg_top")
)

(script static boolean obj_sbugge_11_36
    (and
        (<= (ai_task_count "obj_sc110_survival/remaining_gate") 3)
        (<= (ai_task_count "obj_sc110_survival/infantry_top_front") 0)
        (<= (ai_task_count "obj_sc110_survival/hero_follow") 0)
    )
)

(script startup void sc110_insertion_stub
    (if debug 
        (print "sc110 insertion stub"))
)

(script static void ins_pod_01
    (set g_insertion_index 1)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_intro")
    (sleep 1)
)

(script static void ins_pod_02
    (if debug 
        (print "insertion point : pod_02"))
    (game_save)
    (set g_insertion_index 2)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_000_005_010_015")
    (sleep 1)
    (set g_pod_01_obj_control 100)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "link up with friendly forces"))
    (objectives_show_up_to 0)
    (objectives_finish_up_to 0)
    (wake obj_second_platoon_set)
    (set s_waypoint_index 3)
    (print "teleporting players...")
    (object_teleport (player0) "fl_pod_02_player0")
    (object_teleport (player1) "fl_pod_02_player1")
    (object_teleport (player2) "fl_pod_02_player2")
    (object_teleport (player3) "fl_pod_02_player3")
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
    (object_create "pod_02_warthog_01")
    (object_create "pod_01_warthog_03")
    (object_create "pod_01_warthog_04")
    (object_create "pod_03_warthog_01")
    (object_create "pod_04_warthog_01")
    (object_create "pod_04_warthog_03")
    (cinematic_snap_from_black)
    (game_save_immediate)
)

(script static void ins_pod_03
    (if debug 
        (print "insertion point : pod_03"))
    (set g_insertion_index 3)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_010_015_020")
    (set g_pod_01_obj_control 100)
    (set g_pod_02_obj_control 100)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "link up with friendly forces"))
    (objectives_show_up_to 0)
    (objectives_finish_up_to 0)
    (wake obj_second_platoon_set)
    (set s_waypoint_index 5)
    (print "teleporting players...")
    (object_teleport (player0) "fl_pod_03_player0")
    (object_teleport (player1) "fl_pod_03_player1")
    (object_teleport (player2) "fl_pod_03_player2")
    (object_teleport (player3) "fl_pod_03_player3")
    (sleep 1)
    (ai_place "sq_phantom_02")
    (object_create "pod_03_warthog_03")
    (object_create "pod_01_warthog_03")
    (object_create "pod_01_warthog_04")
    (object_create "pod_03_warthog_01")
    (object_create "pod_04_warthog_01")
    (object_create "pod_04_warthog_03")
    (player0_set_pitch -12.0 0)
    (player1_set_pitch -12.0 0)
    (player2_set_pitch -12.0 0)
    (player3_set_pitch -12.0 0)
    (unit_add_equipment (player0) "insertion_profile" true true)
    (unit_add_equipment (player1) "insertion_profile" true true)
    (unit_add_equipment (player2) "insertion_profile" true true)
    (unit_add_equipment (player3) "insertion_profile" true true)
    (sleep 5)
    (cinematic_snap_from_black)
    (game_save_immediate)
    (wake md_020_transition_flavor_01)
    (wake camera03_test)
)

(script static void ins_pod_04
    (if debug 
        (print "insertion point : pod_04"))
    (set g_insertion_index 4)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_010_015_020")
    (set g_pod_01_obj_control 100)
    (set g_pod_02_obj_control 100)
    (set g_pod_03_obj_control 100)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "find marine second platoon"))
    (objectives_show_up_to 1)
    (objectives_finish_up_to 1)
    (wake obj_find_colonel_set)
    (set s_waypoint_index 7)
    (wake camera05_test)
    (print "teleporting players...")
    (object_teleport (player0) "fl_pod_04_player0")
    (object_teleport (player1) "fl_pod_04_player1")
    (object_teleport (player2) "fl_pod_04_player2")
    (object_teleport (player3) "fl_pod_04_player3")
    (sleep 1)
    (object_create "pod_04_warthog_02")
    (object_create "pod_01_warthog_03")
    (object_create "pod_01_warthog_04")
    (object_create "pod_03_warthog_01")
    (object_create "pod_04_warthog_01")
    (object_create "pod_04_warthog_03")
    (player0_set_pitch -12.0 0)
    (player1_set_pitch -12.0 0)
    (player2_set_pitch -12.0 0)
    (player3_set_pitch -12.0 0)
    (unit_add_equipment (player0) "insertion_profile" true true)
    (unit_add_equipment (player1) "insertion_profile" true true)
    (unit_add_equipment (player2) "insertion_profile" true true)
    (unit_add_equipment (player3) "insertion_profile" true true)
    (sleep 5)
    (cinematic_snap_from_black)
    (game_save_immediate)
    (sleep_until (volume_test_players "tv_pod_03_05") 1)
    (wake md_035_tether_break)
    (object_create "tether_pieces")
    (sleep 1)
    (the_fall)
)

(script command_script void abort_cs
    (sleep 1)
)

(script command_script void cs_flee
    (cs_suppress_activity_termination true)
    (cs_abort_on_damage false)
    (cs_enable_moving true)
    (cs_movement_mode ai_movement_flee)
    (sleep_forever)
)

(script startup void sc110_startup
    (if debug 
        (print "sc110 startup script"))
    (fade_out 0.0 0.0 0.0 0)
    (survival_kill_volumes_off)
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
    (print "starting")
    (if (not (campaign_survival_enabled)) 
        (wake sc110_first))
    (cond
        ((= (game_insertion_point_get) 0)
            (ins_pod_01)
        )
        ((= (game_insertion_point_get) 1)
            (ins_pod_02)
        )
        ((= (game_insertion_point_get) 2)
            (ins_pod_03)
        )
        ((= (game_insertion_point_get) 3)
            (ins_pod_04)
        )
        ((= (game_insertion_point_get) 4)
            (wake sc110_survival_mode)
        )
    )
)

(script dormant void sc110_first
    (wake player0_sc110_waypoints)
    (wake player1_sc110_waypoints)
    (wake player2_sc110_waypoints)
    (wake player3_sc110_waypoints)
    (wake player0_award_tourist)
    (if (coop_players_2) 
        (wake player1_award_tourist))
    (if (coop_players_3) 
        (wake player2_award_tourist))
    (if (coop_players_4) 
        (wake player3_award_tourist))
    (wake sc110_player_dialogue_check)
    (wake s_coop_resume)
    (object_destroy_folder "sc_survival")
    (soft_ceiling_enable "survival" false)
    (kill_volume_disable "kill_tv_sur_01")
    (kill_volume_disable "kill_tv_sur_02")
    (ai_allegiance human player)
    (ai_allegiance player human)
    (fade_out 0.0 0.0 0.0 0)
    (gp_integer_set "gp_current_scene" 110)
    (pda_set_active_pda_definition "sc110")
    (player_set_fourth_wall_enabled (player0) false)
    (player_set_fourth_wall_enabled (player1) false)
    (player_set_fourth_wall_enabled (player2) false)
    (player_set_fourth_wall_enabled (player3) false)
    (wake pda_breadcrumbs)
    (wake player_on_foot)
    (wake zone_set_control)
    (wake garbage_collect)
    (object_set_permutation "sc110_sky1" "" "proxy")
    (wake level_end)
    (sleep_until (>= g_insertion_index 1) 1)
    (if (= g_insertion_index 1) 
        (wake enc_pod_01))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_pod_02")
            (>= g_insertion_index 2)
        ) 
    1)
    (if (<= g_insertion_index 2) 
        (wake enc_pod_02))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_pod_03")
            (>= g_insertion_index 3)
        ) 
    1)
    (if (<= g_insertion_index 3) 
        (wake enc_pod_03))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_pod_04")
            (>= g_insertion_index 4)
        ) 
    1)
    (if (<= g_insertion_index 4) 
        (wake enc_pod_04))
)

(script dormant void player_on_foot
    (sleep_until 
        (begin
            (if 
                (or
                    (and
                        (= (game_coop_player_count) 1)
                        (= (unit_in_vehicle (player0)) true)
                    )
                    (and
                        (= (game_coop_player_count) 2)
                        (and
                            (= (unit_in_vehicle (player0)) true)
                            (= (unit_in_vehicle (player1)) true)
                        )
                    )
                    (and
                        (= (game_coop_player_count) 3)
                        (and
                            (= (unit_in_vehicle (player0)) true)
                            (= (unit_in_vehicle (player1)) true)
                            (= (unit_in_vehicle (player2)) true)
                        )
                    )
                    (and
                        (= (game_coop_player_count) 4)
                        (and
                            (= (unit_in_vehicle (player0)) true)
                            (= (unit_in_vehicle (player1)) true)
                            (= (unit_in_vehicle (player2)) true)
                            (= (unit_in_vehicle (player3)) true)
                        )
                    )
                ) 
                    (set g_player_on_foot false) (set g_player_on_foot true))
            false
        )
    )
)

(script dormant void enc_pod_01
    (wake s_sc110_music01)
    (if (= g_play_cinematics true) 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (sound_class_set_gain "" 0.0 0)
                    (sound_class_set_gain "mus" 1.0 0)
                    (sound_impulse_start "sound\cinematics\atlas\sc110\foley\sc110_int_11_sec_glue" none 1.0)
                    (cinematic_snap_to_black)
                    (if debug 
                        (print "sc110_int_sc"))
                    (sleep 60)
                    (cinematic_set_title "title_1")
                    (sleep 60)
                    (cinematic_set_title "title_2")
                    (sleep 60)
                    (cinematic_set_title "title_3")
                    (sleep (* 30.0 5.0))
                    (sc110_int_sc)
                )
            )
            (cinematic_skip_stop)
        )
    )
    (cinematic_snap_to_white)
    (sc110_int_sc_cleanup)
    (set g_sc110_music01 true)
    (switch_zone_set "set_000_005")
    (data_mine_set_mission_segment "sc110_10_pod_01")
    (chud_show_crosshair true)
    (wake s_waypoint_index_1)
    (wake s_waypoint_index_3)
    (wake obj_friendly_forces_set)
    (wake obj_friendly_forces_clear)
    (sleep 1)
    (wake pod_01_place_01)
    (wake s_sc110_music01_alt)
    (wake s_sc110_music02)
    (wake s_sc110_music03)
    (wake s_sc110_music04)
    (object_create "pod_01_warthog_03")
    (object_create "pod_01_warthog_04")
    (object_create "pod_03_warthog_01")
    (object_create "pod_04_warthog_01")
    (object_create "pod_04_warthog_03")
    (sleep 1)
    (object_cannot_die "pod_01_warthog_03" true)
    (wake md_010_warthog_intro)
    (wake md_010_objective)
    (wake md_010_chopper_hint)
    (wake pod_01_warthog_unreserve)
    (sleep 1)
    (cinematic_snap_from_white)
    (sleep_until (volume_test_players "tv_pod_01_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_pod_01_obj_control 1)
    (game_save)
    (wake pod_01_drone_01)
    (ai_cannot_die "sq_pod_01_warthog_01" false)
    (ai_cannot_die "sq_pod_01_warthog_02" false)
    (ai_cannot_die "sq_pod_01_chopper_01" false)
    (ai_cannot_die "sq_pod_01_chopper_02" false)
    (ai_cannot_die "sq_pod_01_chopper_03" false)
    (sleep_until (volume_test_players "tv_pod_01_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_pod_01_obj_control 2)
    (wake pod_01_place_02)
    (sleep_until (volume_test_players "tv_pod_01_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_pod_01_obj_control 3)
    (set s_waypoint_index 2)
    (object_cannot_die "pod_01_warthog_03" false)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_01_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_pod_01_obj_control 4)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_01_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_pod_01_obj_control 5)
    (game_save)
    (if (<= (ai_living_count "gr_pod_01_allies") 0) 
        (ai_place "sq_pod_01_allies_01"))
    (wake pod_01_drone_02)
    (wake obj_second_platoon_set)
    (sleep_until (volume_test_players "tv_pod_01_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_pod_01_obj_control 6)
    (ai_set_objective "gr_pod_01_allies" "obj_pod_02_allies")
    (game_save)
)

(script dormant void pod_01_place_01
    (ai_place "sq_pod_01_wraith_01")
    (ai_place "sq_pod_01_wraith_02")
    (ai_place "sq_pod_01_chopper_01")
    (ai_place "sq_pod_01_chopper_02")
    (ai_place "sq_pod_01_chopper_03")
    (ai_place "sq_pod_01_warthog_01")
    (ai_place "sq_pod_01_warthog_02")
    (ai_place "sq_pod_01_allies_02")
    (ai_place "sq_pod_01_allies_03")
    (ai_place "sq_pod_01_ghost_01")
    (ai_place "sq_pod_01_cov_01")
    (ai_place "sq_pod_01_cov_02")
    (ai_place "sq_pod_01_jackal_01")
    (ai_cannot_die "sq_pod_01_warthog_01" true)
    (ai_cannot_die "sq_pod_01_warthog_02" true)
    (ai_cannot_die "sq_pod_01_chopper_01" true)
    (ai_cannot_die "sq_pod_01_chopper_02" true)
    (ai_cannot_die "sq_pod_01_chopper_03" true)
    (ai_force_active "gr_pod_01_cov" true)
    (ai_force_active "gr_pod_01_allies" true)
    (ai_vehicle_reserve_seat "sq_pod_01_warthog_01" warthog_p true)
    (ai_vehicle_reserve_seat "sq_pod_01_warthog_02" warthog_p true)
    (sleep 60)
    (soft_ceiling_enable "camera01" false)
)

(script dormant void pod_01_place_02
    (sleep_until (= (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 2) 5)
    (ai_place "sq_phantom_01")
    (set g_sc110_music02 true)
    (game_save)
)

(script dormant void pod_01_warthog_unreserve
    (sleep_until (>= g_pod_01_obj_control 2))
    (sleep_until 
        (or
            (vehicle_test_seat_unit pod_01_warthog_01 none (player0))
            (vehicle_test_seat_unit pod_01_warthog_01 none (player1))
            (vehicle_test_seat_unit pod_01_warthog_01 none (player2))
            (vehicle_test_seat_unit pod_01_warthog_01 none (player3))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player0))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player1))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player2))
            (vehicle_test_seat_unit pod_01_warthog_02 none (player3))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player0))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player1))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player2))
            (vehicle_test_seat_unit "pod_01_warthog_03" none (player3))
            (>= g_pod_01_obj_control 3)
            (= (ai_task_count "obj_pod_01_cov/gt_pod_01_cov_infantry") 0)
        ) 
    1)
    (ai_vehicle_reserve_seat pod_01_warthog_01 warthog_p false)
    (ai_vehicle_reserve_seat pod_01_warthog_02 warthog_p false)
)

(script command_script void cs_pod_01_wraith_shoot
    (cs_run_command_script "sq_pod_01_wraith_01/gunner" abort_cs)
    (cs_run_command_script "sq_pod_01_wraith_02/gunner" abort_cs)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 0 150))
                    (cs_shoot_point true "ps_pod_01_wraith/p0")
                )
                (begin
                    (sleep (random_range 0 150))
                    (cs_shoot_point true "ps_pod_01_wraith/p1")
                )
                (begin
                    (sleep (random_range 0 150))
                    (cs_shoot_point true "ps_pod_01_wraith/p2")
                )
            )
            false
        )
    )
)

(script command_script void cs_pod_01_wraith_boost
    (cs_run_command_script "sq_pod_01_wraith_01/gunner" abort_cs)
    (cs_run_command_script "sq_pod_01_wraith_02/gunner" abort_cs)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_go_to "ps_pod_01_wraith/boost_01")
)

(script command_script void cs_phantom_01
    (if debug 
        (print "phantom 01"))
    (set phantom_01 (ai_vehicle_get_from_starting_location "sq_phantom_01/phantom"))
    (ai_place "sq_phantom_01_jackal_01")
    (ai_place "sq_phantom_01_jackal_02")
    (ai_place "sq_phantom_01_ghost_01")
    (ai_force_active "gr_phantom_01" true)
    (sleep 5)
    (ai_vehicle_enter_immediate "sq_phantom_01_jackal_01" phantom_01 phantom_p_ml_f)
    (ai_vehicle_enter_immediate "sq_phantom_01_jackal_02" phantom_01 phantom_p_ml_b)
    (ai_vehicle_enter_immediate "sq_phantom_01_cov_01" phantom_01 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_01_cov_02" phantom_01 phantom_p_lb)
    (vehicle_load_magic phantom_01 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_01_ghost_01/ghost"))
    (sleep 1)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_01/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_01/approach_02")
    (cs_fly_to_and_face "ps_phantom_01/hover_01" "ps_phantom_01/face_01" 1.0)
    (unit_open phantom_01)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_01/drop_01" "ps_phantom_01/face_01" 1.0)
    (ai_set_objective "sq_phantom_01" "obj_pod_01_cov")
    (ai_set_objective "gr_phantom_01" "obj_pod_01_cov")
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (vehicle_unload phantom_01 phantom_p_ml_f)
    (sleep 15)
    (vehicle_unload phantom_01 phantom_p_ml_b)
    (sleep 75)
    (wake md_010_combat_end)
    (cs_fly_to_and_face "ps_phantom_01/hover_01" "ps_phantom_01/face_01" 1.0)
    (unit_close phantom_01)
    (sleep_until (< (ai_task_count "obj_pod_01_cov/gt_phantom_01") 2) 1 (* 30.0 15.0))
    (set g_sc110_music03 true)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_01/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_01/erase")
    (ai_erase ai_current_squad)
)

(script dormant void pod_01_drone_01
    (object_create "drone_fighter_01")
    (device_set_position "drone_fighter_01" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_01" 1.0)
    (sleep (* 30.0 10.0))
    (object_destroy "drone_fighter_01")
)

(script dormant void pod_01_drone_02
    (object_create "drone_fighter_13")
    (device_set_position "drone_fighter_13" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_13" 1.0)
    (sleep (* 30.0 10.0))
    (object_destroy "drone_fighter_13")
)

(script command_script void cs_pod_01_ghost_run
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost true)
    (cs_go_to "ps_pod_01_ghost/run_01")
    (cs_go_to "ps_pod_01_ghost/run_02")
    (cs_go_to "ps_pod_01_ghost/run_03")
    (cs_go_to "ps_pod_01_ghost/run_04")
    (cs_go_to "ps_pod_01_ghost/run_05")
    (cs_go_to "ps_pod_01_ghost/run_06")
    (cs_go_to "ps_pod_01_ghost/run_07")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_01_warthog_in_transition
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_pod_01_warthog/run_01")
)

(script dormant void enc_pod_02
    (data_mine_set_mission_segment "sc110_20_pod_02")
    (ai_place "sq_pod_02_jackal_01")
    (ai_place "sq_pod_02_shade_01")
    (ai_place "sq_pod_02_shade_02")
    (ai_place "sq_pod_02_shade_03")
    (ai_place "sq_pod_02_brute_01")
    (ai_place "sq_pod_02_chopper_01")
    (ai_place "sq_pod_02_ghost_01")
    (ai_place "sq_pod_02_ghost_03")
    (ai_place "sq_pod_02_grunt_01")
    (ai_place "sq_pod_02_grunt_02")
    (ai_place "sq_pod_02_grunt_03")
    (ai_place "sq_pod_02_grunt_04")
    (ai_place "sq_pod_02_cov_01")
    (ai_place "sq_pod_02_cov_02")
    (sleep 1)
    (ai_force_active "gr_pod_02_cov" true)
    (wake s_sc110_music05)
    (wake s_sc110_music06)
    (wake s_sc110_music07)
    (wake s_sc110_music08)
    (wake md_020_transition_flavor_01)
    (wake md_020_brute_02)
    (wake md_020_ghost_escape)
    (wake pod_02_drone_01)
    (wake pod_02_drone_02)
    (soft_ceiling_enable "camera02" false)
    (wake camera03_test)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_02_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_pod_02_obj_control 1)
    (set g_sc110_music01 false)
    (set g_sc110_music02 false)
    (set g_sc110_music03 false)
    (set g_sc110_music04 false)
    (set s_waypoint_index 4)
    (ai_disposable "gr_pod_01_cov" true)
    (ai_set_objective "gr_pod_01_allies" "obj_pod_02_allies")
    (wake s_g_pod_02_allies_attack)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_02_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_pod_02_obj_control 2)
    (sleep_until (volume_test_players "tv_pod_02_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_pod_02_obj_control 3)
    (wake pod_02_banshee)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_02_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_pod_02_obj_control 4)
    (set g_sc110_music06 true)
    (wake pod_02_ghost_escape)
    (set s_waypoint_index 5)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_02_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_pod_02_obj_control 5)
    (wake pod_02_place_03)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_02_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_pod_02_obj_control 6)
    (game_save)
)

(script dormant void pod_02_place_02
    (ai_place "sq_pod_02_banshee_01")
    (ai_place "sq_pod_02_banshee_02")
    (ai_place "sq_pod_02_banshee_03")
    (set g_sc110_music05 true)
    (ai_force_active "gr_pod_02_cov" true)
)

(script dormant void pod_02_place_03
    (ai_place "sq_phantom_02")
    (set g_sc110_music07 true)
    (set g_sc110_music08 true)
)

(script command_script void cs_pod_02_ghost_01
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "sq_pod_02_ghost_01/ghost"))
    (ai_vehicle_enter "sq_pod_02_ghost_01" "sq_pod_02_ghost_01/ghost" ghost_d)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost true)
    (cs_go_to "ps_pod_02_ghost/p0")
)

(script command_script void cs_pod_02_chopper_01
    (sleep 35)
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "sq_pod_02_chopper_01/chopper"))
    (ai_vehicle_enter "sq_pod_02_chopper_01" "sq_pod_02_chopper_01/chopper" chopper_d)
)

(script dormant void pod_02_banshee
    (sleep_until (volume_test_players "tv_pod_02_banshee") 1)
    (wake pod_02_place_02)
    (game_save)
)

(script command_script void cs_pod_02_banshee_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_02_banshee/approach_01a")
    (cs_fly_by "ps_pod_02_banshee/approach_01b")
    (cs_fly_by "ps_pod_02_banshee/dive_01")
    (cs_fly_by "ps_pod_02_banshee/evade_01")
    (cs_fly_by "ps_pod_02_banshee/release_01")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_02_banshee_02
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_02_banshee/approach_02")
    (cs_fly_by "ps_pod_02_banshee/turn_02")
    (cs_fly_by "ps_pod_02_banshee/dive_02")
    (cs_fly_by "ps_pod_02_banshee/evade_02")
    (cs_fly_by "ps_pod_02_banshee/release_02")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_02_banshee_03
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_02_banshee/approach_03")
    (cs_fly_by "ps_pod_02_banshee/evade_03")
    (cs_fly_by "ps_pod_02_banshee/loop_03a")
    (cs_fly_by "ps_pod_02_banshee/loop_03b")
    (cs_fly_by "ps_pod_02_banshee/run_01")
    (cs_fly_by "ps_pod_02_banshee/run_02")
    (cs_fly_by "ps_pod_02_banshee/exit")
    (cs_fly_by "ps_pod_02_banshee/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_pod_02_banshee_r
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_02_banshee/run_01")
    (cs_fly_by "ps_pod_02_banshee/exit")
    (cs_fly_by "ps_pod_02_banshee/erase")
    (ai_erase ai_current_squad)
)

(script dormant void s_g_pod_02_allies_attack
    (sleep_until 
        (or
            (>= g_pod_02_obj_control 4)
            (and
                (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_banshee_01") 1)
                (= (ai_task_count "obj_pod_02_cov/gt_pod_02_jackal") 0)
                (= (ai_task_count "obj_pod_02_cov/gt_pod_02_watchtower") 0)
            )
        )
    )
    (set g_pod_02_allies_attack_01 true)
    (sleep_until 
        (or
            (>= g_pod_02_obj_control 6)
            (<= (ai_task_count "obj_pod_02_cov/gt_pod_02_cov") 6)
        )
    )
    (set g_pod_02_allies_attack_02 true)
)

(script dormant void pod_02_drone_01
    (sleep_until (volume_test_players "tv_pod_02_drone_01") 1)
    (object_create "drone_fighter_02")
    (object_create "drone_fighter_03")
    (device_set_position "drone_fighter_02" 1.0)
    (device_set_position "drone_fighter_03" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_02" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_03" 1.0)
    (sleep (* 30.0 10.0))
    (object_destroy "drone_fighter_02")
    (object_destroy "drone_fighter_03")
)

(script dormant void pod_02_drone_02
    (sleep_until (volume_test_players "tv_pod_02_drone_02") 1)
    (object_create "drone_fighter_11")
    (object_create "drone_fighter_12")
    (device_set_position "drone_fighter_11" 1.0)
    (device_set_position "drone_fighter_12" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_11" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_12" 1.0)
    (sleep (* 30.0 10.0))
    (object_destroy "drone_fighter_11")
    (object_destroy "drone_fighter_12")
)

(script dormant void pod_02_ghost_escape
    (sleep_until (volume_test_players "tv_pod_02_ghost_escape") 1)
    (set g_pod_02_ghost_escape 1)
)

(script command_script void cs_pod_02_ghost_escape
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost true)
    (cs_go_to "ps_ghost_escape/run_01")
    (cs_go_to "ps_ghost_escape/run_02")
    (cs_go_to "ps_ghost_escape/run_03")
    (cs_go_to "ps_ghost_escape/run_03b")
    (cs_go_to "ps_ghost_escape/run_04")
    (cs_go_to "ps_ghost_escape/run_04b")
    (cs_go_to "ps_ghost_escape/run_04c")
    (cs_go_to "ps_ghost_escape/run_05")
    (sleep_until (>= (current_zone_set_fully_active) 3) 1)
    (cs_go_to "ps_ghost_escape/run_05b")
    (cs_go_to "ps_ghost_escape/run_06")
    (cs_go_to "ps_ghost_escape/run_07")
    (cs_go_to "ps_ghost_escape/run_08")
    (cs_go_to "ps_ghost_escape/run_09")
    (cs_go_to "ps_ghost_escape/run_10")
    (cs_go_to "ps_ghost_escape/run_11")
    (cs_vehicle_boost false)
    (set g_pod_02_ghost_escape 2)
    (ai_set_objective "sq_pod_02_ghost_03" "obj_pod_03_cov")
)

(script dormant void camera03_test
    (sleep_until (>= (current_zone_set_fully_active) 3) 1)
    (soft_ceiling_enable "camera03" false)
)

(script command_script void cs_phantom_02
    (if debug 
        (print "phantom 02"))
    (set phantom_02 (ai_vehicle_get_from_starting_location "sq_phantom_02/phantom"))
    (ai_place "sq_phantom_02_cov_01")
    (ai_place "sq_phantom_02_cov_02")
    (ai_place "sq_phantom_02_ghost_01")
    (ai_place "sq_phantom_02_jackal_01")
    (ai_force_active "gr_phantom_02" true)
    (sleep 5)
    (ai_vehicle_enter_immediate "sq_phantom_02_cov_01" phantom_02 phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_phantom_02_cov_02" phantom_02 phantom_p_lb)
    (ai_vehicle_enter_immediate "sq_phantom_02_jackal_01" phantom_02 phantom_p_ml_b)
    (vehicle_load_magic phantom_02 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_02_ghost_01/ghost"))
    (sleep 1)
    (ai_set_objective "sq_phantom_02" "obj_pod_03_cov")
    (ai_set_objective "gr_phantom_02" "obj_pod_03_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_02/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_02/approach_02")
    (cs_fly_by "ps_phantom_02/approach_03")
    (cs_vehicle_speed 0.6)
    (cs_fly_by "ps_phantom_02/approach_04")
    (sleep_until (>= (current_zone_set_fully_active) 3) 1)
    (cs_fly_to_and_face "ps_phantom_02/hover_01" "ps_phantom_02/face_01" 1.0)
    (sleep_until (>= g_pod_03_obj_control 1) 1)
    (sleep (random_range (* 30.0 2.0) (* 30.0 4.0)))
    (wake pod_03_drone)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_02/approach_05")
    (set g_md_030_intro true)
    (cs_fly_by "ps_phantom_02/approach_06")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_phantom_02/hover_02" "ps_phantom_02/face_02" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_02/drop_02" "ps_phantom_02/face_02" 1.0)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep 30)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_02/approach_07")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_02/hover_03" "ps_phantom_02/face_03" 1.0)
    (unit_open phantom_02)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_02/drop_03" "ps_phantom_02/face_03" 1.0)
    (sleep 15)
    (vehicle_unload phantom_02 phantom_p_lf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_02 phantom_p_lb)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_02 phantom_p_ml_b)
    (sleep 75)
    (cs_fly_to_and_face "ps_phantom_02/hover_04" "ps_phantom_02/face_04" 1.0)
    (unit_close phantom_02)
    (sleep (random_range (* 30.0 4.0) (* 30.0 5.0)))
    (cs_vehicle_speed 0.8)
    (cs_fly_by "ps_phantom_02/approach_08")
    (cs_fly_by "ps_phantom_02/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_02/erase")
    (ai_erase ai_current_squad)
)

(script dormant void enc_pod_03
    (data_mine_set_mission_segment "sc110_30_pod_03")
    (ai_place "sq_pod_03_wraith_01")
    (ai_place "sq_pod_03_wraith_02")
    (ai_place "sq_pod_03_allies_01")
    (ai_place "sq_pod_03_allies_02")
    (if (not (game_is_cooperative)) 
        (begin
            (ai_place "sq_pod_03_allies_03")
            (ai_place "sq_pod_03_allies_04")
        )
    )
    (ai_place "sq_pod_03_chopper_01")
    (ai_place "sq_pod_03_chopper_03")
    (ai_place "sq_pod_03_chopper_04")
    (ai_place "sq_pod_03_watchtower_01")
    (ai_place "sq_pod_03_shade_01")
    (ai_place "sq_pod_03_shade_02")
    (ai_place "sq_pod_03_shade_03")
    (ai_place "sq_pod_03_shade_04")
    (sleep 5)
    (ai_force_active "gr_pod_03_cov" true)
    (ai_force_active "gr_pod_03_allies" true)
    (ai_cannot_die "gr_pod_03_allies" true)
    (ai_cannot_die "sq_pod_03_chopper_01" true)
    (ai_cannot_die "sq_pod_03_chopper_04" true)
    (wake s_sc110_music09)
    (wake s_sc110_music10)
    (wake s_sc110_music10_alt)
    (wake s_sc110_music11)
    (wake s_sc110_music12)
    (wake s_sc110_music13)
    (wake md_030_intro)
    (wake md_035_tether_break)
    (wake md_030_objective_prompt)
    (soft_ceiling_enable "camera04" false)
    (wake camera05_test)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_03_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_pod_03_obj_control 1)
    (ai_set_objective "gr_pod_01_allies" "obj_pod_03_allies")
    (game_save)
    (wake s_g_pod_03_allies_end)
    (ai_cannot_die "gr_pod_03_allies" false)
    (ai_cannot_die "sq_pod_03_chopper_01" false)
    (ai_cannot_die "sq_pod_03_chopper_04" false)
    (set g_sc110_music05 false)
    (set g_sc110_music06 false)
    (set g_sc110_music07 false)
    (set g_sc110_music08 false)
    (sleep_until (volume_test_players "tv_pod_03_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_pod_03_obj_control 2)
    (ai_disposable "gr_pod_02_cov" true)
    (wake pod_03_game_save_01)
    (wake pod_03_game_save_02)
    (wake s_waypoint_index_6)
    (game_save_no_timeout)
    (sleep_until (volume_test_players "tv_pod_03_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_pod_03_obj_control 3)
    (game_save_no_timeout)
    (sleep_until (volume_test_players "tv_pod_03_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_pod_03_obj_control 4)
    (set g_sc110_music10 false)
    (set g_sc110_music11 true)
    (set s_waypoint_index 7)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_03_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_pod_03_obj_control 5)
    (set g_sc110_music12 true)
    (set g_sc110_music13 true)
    (wake s_tether_collapse)
    (sleep_until (volume_test_players "tv_pod_03_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_pod_03_obj_control 6)
)

(script dormant void pod_03_game_save_01
    (sleep_until (= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 0) 5)
    (game_save_no_timeout)
)

(script dormant void pod_03_game_save_02
    (sleep_until (volume_test_players "tv_pod_03_game_save_02") 1)
    (game_save_no_timeout)
)

(script command_script void cs_pod_03_allies_splaser
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_pod_03_allies/right")
)

(script command_script void cs_pod_03_allies_turret
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_pod_03_allies/left")
)

(script dormant void s_tether_collapse
    (wake tether_strand_destroy)
    (object_create "tether_pieces")
    (sleep 1)
    (wake player0_fall_rumble)
    (if (coop_players_2) 
        (wake player1_fall_rumble))
    (if (coop_players_3) 
        (wake player2_fall_rumble))
    (if (coop_players_4) 
        (wake player3_fall_rumble))
    (the_fall)
)

(script dormant void player0_fall_rumble
    (f_fall_rumble player_00)
)

(script dormant void player1_fall_rumble
    (f_fall_rumble player_01)
)

(script dormant void player2_fall_rumble
    (f_fall_rumble player_02)
)

(script dormant void player3_fall_rumble
    (f_fall_rumble player_03)
)

(script static void f_fall_rumble (short player_short)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.1 0.1)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.15 0.15)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.2 0.2)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.25 0.25)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.3 0.3)
    (sleep 114)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.85 0.85)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.8 0.8)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.75 0.75)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.7 0.7)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.65 0.65)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.6 0.6)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.55 0.55)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.5 0.5)
    (sleep 50)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.45 0.45)
    (sleep 20)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.4 0.4)
    (sleep 20)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.35 0.35)
    (sleep 20)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.3 0.3)
    (sleep 20)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.25 0.25)
    (sleep 20)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.2 0.2)
    (sleep 30)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.15 0.15)
    (sleep 30)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.1 0.1)
    (sleep 40)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.05 0.05)
    (sleep 40)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.0 0.0)
)

(script dormant void tether_strand_destroy
    (sleep_until (>= g_pod_04_obj_control 1) 1 (* 30.0 35.0))
    (sleep_until 
        (begin
            (object_destroy "tether_string")
            (>= g_pod_04_obj_control 2)
        ) 
    1)
)

(script dormant void s_g_pod_03_allies_end
    (sleep_until 
        (or
            (>= g_pod_03_obj_control 3)
            (and
                (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_shade") 1)
                (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 0)
            )
        )
    )
    (set g_pod_03_allies_end true)
)

(script dormant void pod_03_drone
    (sleep 30)
    (device_set_position "drone_fighter_04" 1.0)
    (device_set_position "drone_fighter_05" 1.0)
    (device_set_position "drone_fighter_06" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_04" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_05" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_06" 1.0)
    (sleep (* 30.0 10.0))
    (object_destroy "drone_fighter_04")
    (object_destroy "drone_fighter_05")
    (object_destroy "drone_fighter_06")
)

(script command_script void cs_pod_03_wraith_shoot
    (cs_run_command_script "sq_pod_03_wraith_01/gunner" abort_cs)
    (cs_run_command_script "sq_pod_03_wraith_02/gunner" abort_cs)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 60 210))
                    (cs_shoot_point true "ps_pod_03_wraith/p0")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_pod_03_wraith/p1")
                )
                (begin
                    (sleep (random_range 90 210))
                    (cs_shoot_point true "ps_pod_03_wraith/p2")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_pod_03_wraith/p3")
                )
                (begin
                    (sleep (random_range 30 210))
                    (cs_shoot_point true "ps_pod_03_wraith/p4")
                )
            )
            false
        )
    )
)

(script static void ssv_sq_pod_03_allies_01
    (unit_add_equipment "sq_pod_03_allies_01" "profile_pod_03_allies_01" true true)
)

(script command_script void cs_pod_03_allies_04
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to_vehicle "pod_03_turret_01")
    (ai_vehicle_enter "sq_pod_03_allies_04" "pod_03_turret_01" warthog_g)
)

(script command_script void cs_pod_03_warthog_in_transition
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_pod_03_warthog/run_01")
    (cs_go_to "ps_pod_03_warthog/run_02")
    (cs_go_to "ps_pod_03_warthog/run_03")
    (cs_go_to "ps_pod_03_warthog_bridge/run_04")
    (cs_go_to "ps_pod_03_warthog_bridge/run_05")
    (cs_go_to "ps_pod_03_warthog_bridge/run_06")
)

(script dormant void camera05_test
    (sleep_until (>= (current_zone_set_fully_active) 4) 1)
    (soft_ceiling_enable "camera05" false)
)

(script dormant void enc_pod_04
    (data_mine_set_mission_segment "sc110_40_pod_04")
    (wake s_sc110_music14)
    (wake s_sc110_music15)
    (wake s_sc110_music16)
    (wake md_040_crazy_marine)
    (wake md_040_brute)
    (wake md_040_exit_prompt_01)
    (wake md_040_exit_prompt_02)
    (wake pod_04_drone_01)
    (wake pod_04_drone_02)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_04_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_pod_04_obj_control 1)
    (object_create_folder "sc_pod_04")
    (object_create_folder "cr_pod_04")
    (set s_waypoint_index 8)
    (ai_disposable "gr_pod_03_cov" true)
    (ai_set_objective "gr_pod_01_allies" "obj_pod_04_allies")
    (ai_set_objective "gr_pod_03_allies" "obj_pod_04_allies")
    (wake pod_04_place_02)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_04_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_pod_04_obj_control 2)
    (wake pod_04_place_03)
    (game_save)
    (sleep_until 
        (or
            (volume_test_players "tv_pod_04_03")
            (volume_test_players "tv_pod_04_05")
        ) 
    1)
    (if debug 
        (print "set objective control 3"))
    (set g_pod_04_obj_control 3)
    (game_save)
    (sleep_until 
        (or
            (volume_test_players "tv_pod_04_04")
            (volume_test_players "tv_pod_04_05")
            (volume_test_players "tv_pod_04_08")
        ) 
    1)
    (if debug 
        (print "set objective control 4"))
    (set g_pod_04_obj_control 4)
    (game_save)
    (sleep_until 
        (or
            (volume_test_players "tv_pod_04_05")
            (volume_test_players "tv_pod_04_08")
        ) 
    1)
    (if debug 
        (print "set objective control 5"))
    (set g_pod_04_obj_control 5)
    (game_save)
    (sleep_until 
        (or
            (volume_test_players "tv_pod_04_06")
            (volume_test_players "tv_pod_04_08")
        ) 
    1)
    (if debug 
        (print "set objective control 6"))
    (set g_pod_04_obj_control 6)
    (game_save)
    (sleep_until 
        (or
            (volume_test_players "tv_pod_04_07")
            (volume_test_players "tv_pod_04_08")
        ) 
    1)
    (if debug 
        (print "set objective control 7"))
    (set g_pod_04_obj_control 7)
    (wake pod_04_place_04)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_04_08") 1)
    (if debug 
        (print "set objective control 8"))
    (set g_pod_04_obj_control 8)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_04_09") 1)
    (if debug 
        (print "set objective control 9"))
    (set g_pod_04_obj_control 9)
    (wake pod_04_game_save_01)
    (game_save)
    (sleep_until (volume_test_players "tv_pod_04_10") 1)
    (if debug 
        (print "set objective control 10"))
    (set g_pod_04_obj_control 10)
)

(script dormant void pod_04_place_01
    (ai_place "sq_pod_04_banshee_01")
    (ai_place "sq_pod_04_banshee_02")
    (ai_force_active "gr_pod_04_cov" true)
)

(script dormant void pod_04_place_02
    (ai_place "sq_pod_04_phantom_01")
    (ai_force_active "gr_pod_04_phantom_01" true)
    (ai_place "sq_pod_04_shade_01")
    (ai_place "sq_pod_04_shade_02")
    (ai_place "sq_pod_04_watchtower_01")
    (ai_place "sq_pod_04_jackal_01")
    (ai_place "sq_pod_04_grunt_01")
    (ai_place "sq_pod_04_grunt_02")
    (ai_place "sq_pod_04_wraith_01")
    (ai_place "sq_pod_04_ghost_02")
    (ai_place "sq_pod_04_shade_04")
    (ai_place "sq_pod_04_jackal_02")
    (ai_place "sq_pod_04_jackal_03")
    (ai_place "sq_pod_04_cov_01")
    (ai_place "sq_pod_04_cov_02")
    (ai_place "sq_pod_04_allies_01")
    (ai_place "sq_pod_04_allies_02")
    (ai_place "sq_pod_04_allies_crazy")
    (ai_place "sq_pod_04_allies_med")
    (ai_place "sq_pod_04_brute_01")
    (ai_place "sq_pod_04_brute_02")
    (ai_force_active "gr_pod_04_cov" true)
    (ai_force_active "gr_pod_04_allies" true)
    (units_set_current_vitality (ai_actors "sq_pod_04_allies_crazy") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_pod_04_allies_crazy") 0.1 0.0)
    (units_set_current_vitality (ai_actors "sq_pod_04_allies_med") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_pod_04_allies_med") 0.1 0.0)
)

(script dormant void pod_04_place_03
    (sleep_until (volume_test_players "tv_pod_04_phantom_02") 1)
    (game_save)
    (ai_place "sq_pod_04_phantom_02")
    (ai_force_active "gr_pod_04_phantom_02" true)
)

(script dormant void pod_04_place_04
    (ai_disposable "gr_pod_04_cov_lower" true)
    (ai_place "sq_pod_04_phantom_03")
    (ai_force_active "gr_pod_04_phantom_03" true)
    (ai_place "sq_pod_04_phantom_04")
    (ai_force_active "gr_pod_04_phantom_04" true)
    (ai_place "sq_pod_04_grunt_03")
    (ai_place "sq_pod_04_grunt_04")
    (ai_place "sq_pod_04_plasma_cannon_01")
    (ai_place "sq_pod_04_brute_03")
    (ai_place "sq_pod_04_jackal_04")
    (ai_place "sq_pod_04_wraith_02")
    (ai_force_active "gr_pod_04_cov" true)
    (soft_ceiling_enable "camera06" false)
)

(script dormant void pod_04_game_save_01
    (sleep_until (volume_test_players "tv_pod_04_exit_south") 1)
    (game_save_no_timeout)
)

(script static void ssv_sq_pod_04_allies_med
    (unit_add_equipment "sq_pod_04_allies_med" "profile_pod_04_allies_med" true true)
)

(script command_script void cs_pod_04_ghost_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost true)
    (cs_go_to "ps_pod_04_ghost/run_02")
    (cs_go_to "ps_pod_04_ghost/run_03")
    (cs_go_to "ps_pod_04_ghost/run_04")
    (cs_go_to "ps_pod_04_ghost/run_05")
    (cs_go_to "ps_pod_04_ghost/run_06")
    (cs_go_to "ps_pod_04_ghost/run_07")
    (cs_go_to "ps_pod_04_ghost/run_08")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_04_ghost_01_r
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_pod_04_ghost/run_08")
    (cs_go_to "ps_pod_04_ghost/run_07")
    (cs_go_to "ps_pod_04_ghost/run_06")
    (cs_go_to "ps_pod_04_ghost/run_05")
    (cs_go_to "ps_pod_04_ghost/run_04")
    (cs_go_to "ps_pod_04_ghost/run_03")
    (cs_go_to "ps_pod_04_ghost/run_02")
)

(script command_script void cs_pod_04_banshee_01
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_bridge/approach_01")
    (cs_fly_by "ps_banshee_bridge/run_01")
    (cs_fly_by "ps_banshee_bridge/turn_01")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_04_banshee_02
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_bridge/approach_02")
    (cs_fly_by "ps_banshee_bridge/run_02")
    (cs_fly_by "ps_banshee_bridge/turn_02")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_04_banshee_01_r
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_bridge_retreat/approach_01")
    (cs_fly_by "ps_banshee_bridge_retreat/run_01")
    (cs_fly_by "ps_banshee_bridge_retreat/turn_01")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_04_banshee_02_r
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_banshee_bridge_retreat/approach_02")
    (cs_fly_by "ps_banshee_bridge_retreat/run_02")
    (cs_fly_by "ps_banshee_bridge_retreat/turn_02")
    (cs_vehicle_boost false)
)

(script command_script void cs_pod_04_wraith_intro
    (cs_run_command_script "sq_pod_04_wraith_01/gunner" abort_cs)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (sleep 45)
            (cs_shoot_point true "ps_pod_04_wraith/p0")
            false
        )
    )
)

(script command_script void cs_pod_04_wraith_shoot
    (cs_run_command_script "sq_pod_04_wraith_01/gunner" abort_cs)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_pod_04_wraith/p1")
                )
                (begin
                    (sleep (random_range 90 210))
                    (cs_shoot_point true "ps_pod_04_wraith/p2")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_pod_04_wraith/p3")
                )
            )
            false
        )
    )
)

(script command_script void cs_pod_04_phantom_01
    (if debug 
        (print "pod_04_phantom_01"))
    (cs_fly_by "ps_pod_04_phantom_01/approach_01")
    (cs_fly_by "ps_pod_04_phantom_01/approach_02")
    (cs_fly_by "ps_pod_04_phantom_01/approach_03")
    (cs_fly_by "ps_pod_04_phantom_01/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_04_phantom_01/erase")
    (ai_erase ai_current_squad)
)

(script dormant void pod_04_drone_01
    (sleep_until (volume_test_players "tv_pod_04_drone_01") 1)
    (set g_sc110_music15 true)
    (object_create "drone_fighter_07")
    (object_create "drone_fighter_08")
    (object_create "drone_fighter_09")
    (object_create "drone_fighter_10")
    (device_set_position "drone_fighter_07" 1.0)
    (device_set_position "drone_fighter_08" 1.0)
    (device_set_position "drone_fighter_09" 1.0)
    (device_set_position "drone_fighter_10" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_07" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_08" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_09" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_10" 1.0)
    (sleep (* 30.0 10.0))
    (object_destroy "drone_fighter_07")
    (object_destroy "drone_fighter_08")
    (object_destroy "drone_fighter_09")
    (object_destroy "drone_fighter_10")
)

(script dormant void pod_04_drone_02
    (sleep_until (volume_test_players "tv_pod_04_drone_02") 1)
    (set g_sc110_music14 true)
    (object_create "drone_fighter_14")
    (object_create "drone_fighter_15")
    (object_create "drone_fighter_16")
    (device_set_position "drone_fighter_14" 1.0)
    (device_set_position "drone_fighter_15" 1.0)
    (device_set_position "drone_fighter_16" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_14" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_15" 1.0)
    (sound_impulse_start "sound\device_machines\atlas\drone_fighters" "drone_fighter_16" 1.0)
    (sleep (* 30.0 10.0))
    (object_destroy "drone_fighter_14")
    (object_destroy "drone_fighter_15")
    (object_destroy "drone_fighter_16")
)

(script command_script void cs_pod_04_phantom_02
    (if debug 
        (print "pod_04_phantom_02"))
    (set p_04_phantom_02 (ai_vehicle_get_from_starting_location "sq_pod_04_phantom_02/phantom"))
    (ai_place "sq_pod_04_phantom_02_wraith")
    (sleep 5)
    (vehicle_load_magic p_04_phantom_02 phantom_lc (ai_vehicle_get_from_starting_location "sq_pod_04_phantom_02_wraith/wraith"))
    (sleep 1)
    (cs_fly_by "ps_pod_04_phantom_02/approach_01")
    (cs_fly_by "ps_pod_04_phantom_02/approach_02")
    (cs_fly_by "ps_pod_04_phantom_02b/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_04_phantom_02b/erase")
    (ai_erase "sq_pod_04_phantom_02_wraith")
    (ai_erase ai_current_squad)
)

(script command_script void cs_pod_04_phantom_03
    (if debug 
        (print "pod_04_phantom_03"))
    (cs_fly_by "ps_pod_04_phantom_03/approach_01")
    (cs_fly_by "ps_pod_04_phantom_03/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_04_phantom_03/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_pod_04_phantom_04
    (if debug 
        (print "pod_04_phantom_04"))
    (cs_enable_pathfinding_failsafe true)
    (set p_04_phantom_04 (ai_vehicle_get_from_starting_location "sq_pod_04_phantom_04/phantom"))
    (sleep 5)
    (vehicle_load_magic p_04_phantom_04 phantom_lc (ai_vehicle_get_from_starting_location "sq_pod_04_phantom_04_wraith/wraith"))
    (sleep 1)
    (cs_fly_to_and_face "ps_pod_04_phantom_04/drop_01" "ps_pod_04_phantom_04/face_01" 1.0)
    (sleep_until (volume_test_players "tv_pod_04_09") 1)
    (cs_fly_to_and_face "ps_pod_04_phantom_04/hover_01" "ps_pod_04_phantom_04/face_01" 1.0)
    (sleep 30)
    (cs_fly_by "ps_pod_04_phantom_04/exit_01")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_pod_04_phantom_04/erase")
    (ai_erase "sq_pod_04_phantom_04_wraith")
    (ai_erase ai_current_squad)
)

(script dormant void nav_point_exit
    (hud_activate_team_nav_point_flag player "fl_exit" 0.5)
    (sleep_until (>= g_pod_04_obj_control 10) 1)
    (hud_deactivate_team_nav_point_flag player "fl_exit")
)

(script command_script void cs_pod_04_warthog_in_entry
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_pod_04_allies/entry_01")
    (cs_go_to "ps_pod_04_allies/entry_02")
)

(script command_script void cs_pod_04_warthog_in_exit
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_pod_04_allies/run_01")
    (cs_go_to "ps_pod_04_allies/run_02")
    (cs_move_in_direction 50.0 20.0 50.0)
)

(script dormant void level_end
    (sleep_until (volume_test_players "tv_pod_04_10") 1)
    (sound_class_set_gain "weap" 0.0 0)
    (sound_class_set_gain "“”" 0.0 5)
    (sound_class_set_gain "mus" 1.0 0)
    (set g_sc110_music16 true)
    (set g_sc110_music14 false)
    (set g_sc110_music15 false)
    (cond
        ((volume_test_object "tv_pod_04_10" (player0))
            (f_unit_in_vehicle_type (player0))
        )
        ((volume_test_object "tv_pod_04_10" (player1))
            (f_unit_in_vehicle_type (player1))
        )
        ((volume_test_object "tv_pod_04_10" (player2))
            (f_unit_in_vehicle_type (player2))
        )
        ((volume_test_object "tv_pod_04_10" (player3))
            (f_unit_in_vehicle_type (player3))
        )
    )
)

(script static void f_unit_in_vehicle_type (unit player_name)
    (sleep 1)
    (cond
        ((unit_in_vehicle_type_mask player_name 14)
            (begin
                (wake level_end_cleanup)
                (f_end_scene sc110_out_sc_hog "set_h100" "gp_sc110_complete" "h100" "white")
                (sound_class_set_gain "“”" 0.0 0)
                (sc110_out_sc_hog_cleanup)
            )
        )
        ((unit_in_vehicle_type_mask player_name 21)
            (begin
                (wake level_end_cleanup)
                (f_end_scene sc110_out_sc_chop "set_h100" "gp_sc110_complete" "h100" "white")
                (sound_class_set_gain "“”" 0.0 0)
                (sc110_out_sc_chop_cleanup)
            )
        )
        ((unit_in_vehicle_type_mask player_name 20)
            (begin
                (wake level_end_cleanup)
                (f_end_scene sc110_out_sc_ghost "set_h100" "gp_sc110_complete" "h100" "white")
                (sound_class_set_gain "“”" 0.0 0)
                (sc110_out_sc_ghost_cleanup)
            )
        )
        (true
            (begin
                (wake level_end_cleanup)
                (f_end_scene sc110_out_sc_hog "set_h100" "gp_sc110_complete" "h100" "white")
                (sound_class_set_gain "“”" 0.0 0)
                (sc110_out_sc_hog_cleanup)
            )
        )
    )
)

(script dormant void level_end_cleanup
    (sound_class_set_gain "“”" 0.0 5)
    (sound_class_set_gain "mus" 1.0 0)
    (print "teleporting players...")
    (object_teleport (player0) "fl_exit_player0")
    (object_teleport (player1) "fl_exit_player1")
    (object_teleport (player2) "fl_exit_player2")
    (object_teleport (player3) "fl_exit_player3")
    (object_destroy_folder "v_sc110")
    (object_destroy_type_mask 2)
)

(script dormant void zone_set_control
    (sleep_until (>= (current_zone_set) 0) 1)
    (sleep_until (>= (current_zone_set) 1) 1)
    (sleep_until (>= (current_zone_set) 2) 1)
    (sleep_until (>= (current_zone_set) 3) 1)
    (if (>= (current_zone_set) 3) 
        (begin
            (if debug 
                (print "pod_01 blockers"))
            (device_set_position_immediate "dm_pod_02_roll_door" 1.0)
            (sleep 1)
            (zone_set_trigger_volume_enable "begin_zone_set:set_000_005_010_015:*" false)
            (zone_set_trigger_volume_enable "zone_set:set_000_005_010_015:*" false)
            (object_destroy_folder "cr_pod_01")
            (object_destroy_folder "sc_pod_01")
        )
    )
    (sleep_until (>= (current_zone_set) 4) 1)
    (if (>= (current_zone_set) 4) 
        (begin
            (if debug 
                (print "pod_02 + pod_03 blockers"))
            (device_set_position_immediate "dm_pod_03_roll_door" 1.0)
            (sleep 1)
            (zone_set_trigger_volume_enable "zone_set:set_010_015_020:*" false)
            (object_destroy_folder "cr_pod_02")
            (object_destroy_folder "sc_pod_02")
            (object_destroy_folder "cr_pod_03")
            (object_destroy_folder "sc_pod_03")
        )
    )
    (sleep_until (>= (current_zone_set) 5) 1)
    (sleep_until (>= (current_zone_set) 6) 1)
)

(script dormant void garbage_collect
    (sleep_until 
        (or
            (> (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 0)
            (>= g_pod_02_obj_control 1)
        ) 
    1)
    (sleep 30)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_pod_01_cov/gt_pod_01_wraith") 0)
            (>= g_pod_02_obj_control 1)
        ) 
    1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_pod_01_wraith_garbage" 2 15)
    (sleep_until (>= g_pod_02_obj_control 1) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_pod_01" 30 30)
    (sleep_until (>= g_pod_02_obj_control 4) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_pod_02_early" 30 30)
    (sleep_until (>= (current_zone_set) 3) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_pod_01" 0 1)
    (sleep_until 
        (begin
            (sleep (* 30.0 10.0))
            (if debug 
                (print "recycle banshee"))
            (add_recycling_volume "tv_sp_pod_03_banshee" 0 1)
            (>= g_pod_03_obj_control 1)
        )
    )
    (sleep_until (>= g_pod_03_obj_control 2) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_pod_02" 30 30)
    (sleep_until 
        (or
            (<= (ai_task_count "obj_pod_03_cov/gt_pod_03_wraith") 0)
            (>= g_pod_03_obj_control 5)
        ) 
    1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_pod_03_wraith_garbage" 2 15)
    (sleep_until (>= (current_zone_set) 4) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_pod_02" 0 1)
    (add_recycling_volume "tv_sp_pod_03" 0 1)
    (sleep_until (>= g_pod_04_obj_control 9) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_pod_04" 30 30)
)

(script dormant void s_coop_resume
    (sleep_until (>= g_pod_02_obj_control 1) 1)
    (if (< g_pod_02_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 1)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
    (sleep_until (>= g_pod_03_obj_control 1) 1)
    (if (< g_pod_03_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 2)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
    (sleep_until (>= g_pod_04_obj_control 1) 1)
    (if (< g_pod_04_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 3)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
)

(script dormant void sc110_survival_mode
    (zone_set_trigger_volume_enable "zone_set:set_010_015_020:*" false)
    (set string_survival_map_name "sc110")
    (soft_ceiling_enable "survival" true)
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (sleep 5)
    (switch_zone_set "set_survival")
    (sleep 1)
    (pda_set_active_pda_definition "sc110_survival")
    (object_create_anew "sc_survival_blocker")
    (object_destroy "pod03_door_plug_01")
    (object_destroy "pod03_door_plug_02")
    (object_destroy "pod03_door_plug_03")
    (object_destroy "cr_pod_03_campaign")
    (object_destroy "pod3_watchtower_base")
    (device_set_position_immediate "dm_pod_03_roll_door" 1.0)
    (device_set_power "dm_pod_03_roll_door" 0.0)
    (object_destroy_folder "eq_sc110")
    (object_destroy_folder "wp_sc110")
    (object_destroy_folder "v_sc110")
    (object_destroy_folder "sc_pod_01")
    (object_destroy_folder "sc_pod_02")
    (object_destroy_folder "sc_pod_04")
    (object_destroy_folder "cr_pod_01")
    (object_destroy_folder "cr_pod_02")
    (object_destroy_folder "cr_pod_04")
    (object_destroy_folder "bp_campaign")
    (object_create_anew "v_sur_warthog_01")
    (set ai_obj_survival "obj_sc110_survival")
    (set ai_sur_wave_spawns "gr_survival_waves")
    (set s_sur_wave_squad_count 6)
    (set ai_sur_remaining "sq_sur_remaining")
    (set ai_sur_phantom_01 "sq_sur_phantom_01")
    (set ai_sur_phantom_02 "sq_sur_phantom_02")
    (set ai_sur_phantom_03 "sq_sur_phantom_03")
    (set ai_sur_phantom_04 "sq_sur_phantom_04")
    (set s_sur_drop_side_01 "dual")
    (set s_sur_drop_side_02 "dual")
    (set s_sur_drop_side_03 "dual")
    (set s_sur_drop_side_04 "dual")
    (set ai_sur_bonus_wave "sq_sur_bonus_wave")
    (set ai_sur_bonus_phantom "sq_sur_phantom_bonus")
    (set b_sur_bonus_round true)
    (wake survival_mode)
    (sleep 5)
)

(script static void survival_refresh_front
    (survival_refresh_sleep)
    (ai_reset_objective "obj_sc110_survival/infantry_front_gate")
)

(script static void survival_hero_refresh_follow
    (survival_refresh_sleep)
    (survival_refresh_sleep)
    (ai_reset_objective "obj_sc110_survival/hero_follow")
)

(script command_script void cs_set_wraith_01
    (sleep 5)
    (set v_sur_wraith_01 (ai_vehicle_get_from_spawn_point "sq_sur_wraith_01/wraith"))
)

(script command_script void cs_set_wraith_03
    (sleep 5)
    (set v_sur_wraith_03 (ai_vehicle_get_from_spawn_point "sq_sur_wraith_03/wraith"))
)

(script command_script void cs_set_chopper_02
    (sleep 5)
    (set v_sur_chopper_02 (ai_vehicle_get_from_spawn_point "sq_sur_chopper_02/chopper"))
)

(script command_script void cs_set_chopper_04
    (sleep 5)
    (set v_sur_chopper_04 (ai_vehicle_get_from_spawn_point "sq_sur_chopper_04/chopper"))
)

(script command_script void cs_sur_phantom_01
    (set v_sur_phantom_01 (ai_vehicle_get_from_spawn_point "sq_sur_phantom_01/phantom"))
    (sleep 1)
    (object_set_shadowless v_sur_phantom_01 true)
    (cs_enable_pathfinding_failsafe true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (not (= (random_range 0 5) 0))
                (<= (ai_living_count "sq_sur_wraith_01") 0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_01 "single" "sq_sur_wraith_01" none))
    )
    (cs_fly_by "ps_sur_phantom_01/p0")
    (cs_fly_by "ps_sur_phantom_01/p1")
    (cs_fly_by "ps_sur_phantom_01/p2")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_01/p3" "ps_sur_phantom_01/face" 1.0)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_phantom_01/drop" "ps_sur_phantom_01/face" 1.0)
    (sleep 15)
    (f_unload_phantom_cargo v_sur_phantom_01 "single")
    (f_unload_phantom v_sur_phantom_01 "dual")
    (sleep 90)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_sur_phantom_01/p3" "ps_sur_phantom_01/face" 1.0)
    (cs_fly_by "ps_sur_phantom_01/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_01/p0")
    (cs_fly_by "ps_sur_phantom_01/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script static void sur_wraith01_reserve
    (sleep_until (!= (ai_living_count "sq_sur_wraith_01") 2) 1)
    (if (= (ai_living_count "sq_sur_wraith_01/wraith") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_01/wraith")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_01/gunner") wraith_g true)
        )
    )
    (sleep_until (< (ai_living_count "sq_sur_wraith_01") 1) 1)
    (if (= (ai_living_count "sq_sur_wraith_01/wraith") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_01/wraith")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_01/gunner") wraith_g true)
        )
    )
)

(script command_script void cs_sur_phantom_02
    (set v_sur_phantom_02 (ai_vehicle_get_from_spawn_point "sq_sur_phantom_02/phantom"))
    (sleep 1)
    (object_set_shadowless v_sur_phantom_02 true)
    (cs_enable_pathfinding_failsafe true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (not (= (random_range 0 5) 0))
                (<= (ai_living_count "sq_sur_chopper_02") 0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_02 "single" "sq_sur_chopper_02" none))
    )
    (cs_fly_by "ps_sur_phantom_02/p0")
    (cs_fly_by "ps_sur_phantom_02/p1")
    (cs_fly_by "ps_sur_phantom_02/p2")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_02/p3" "ps_sur_phantom_02/face" 1.0)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_phantom_02/drop" "ps_sur_phantom_02/face" 1.0)
    (sleep 15)
    (f_unload_phantom_cargo v_sur_phantom_02 "single")
    (f_unload_phantom v_sur_phantom_02 "dual")
    (sleep 90)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_sur_phantom_02/p3" "ps_sur_phantom_02/face" 1.0)
    (cs_fly_by "ps_sur_phantom_02/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_02/p0")
    (cs_fly_by "ps_sur_phantom_02/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_phantom_03
    (set v_sur_phantom_03 (ai_vehicle_get_from_spawn_point "sq_sur_phantom_03/phantom"))
    (sleep 1)
    (object_set_shadowless v_sur_phantom_03 true)
    (cs_enable_pathfinding_failsafe true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (not (= (random_range 0 5) 0))
                (<= (ai_living_count "sq_sur_wraith_03") 0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_03 "single" "sq_sur_wraith_03" none))
    )
    (cs_fly_by "ps_sur_phantom_03/p0")
    (cs_fly_by "ps_sur_phantom_03/p1")
    (cs_fly_by "ps_sur_phantom_03/p2")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_03/p3" "ps_sur_phantom_03/face" 1.0)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_phantom_03/drop" "ps_sur_phantom_03/face" 1.0)
    (sleep 15)
    (f_unload_phantom_cargo v_sur_phantom_03 "single")
    (f_unload_phantom v_sur_phantom_03 "dual")
    (sleep 90)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_sur_phantom_03/p3" "ps_sur_phantom_03/face" 1.0)
    (cs_fly_by "ps_sur_phantom_03/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_03/p0")
    (cs_fly_by "ps_sur_phantom_03/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script static void sur_wraith03_reserve
    (sleep_until (!= (ai_living_count "sq_sur_wraith_03") 2) 1)
    (if (= (ai_living_count "sq_sur_wraith_03/wraith") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_03/wraith")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_03/gunner") wraith_g true)
        )
    )
    (sleep_until (< (ai_living_count "sq_sur_wraith_03") 1) 1)
    (if (= (ai_living_count "sq_sur_wraith_03/wraith") 0) 
        (begin
            (print "driver dead")
            (object_destroy "sq_sur_wraith_03/wraith")
        ) (begin
            (print "gunner dead")
            (ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location "sq_sur_wraith_03/gunner") wraith_g true)
        )
    )
)

(script command_script void cs_sur_phantom_04
    (set v_sur_phantom_04 (ai_vehicle_get_from_spawn_point "sq_sur_phantom_04/phantom"))
    (sleep 1)
    (object_set_shadowless v_sur_phantom_04 true)
    (cs_enable_pathfinding_failsafe true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (not (= (random_range 0 5) 0))
                (<= (ai_living_count "sq_sur_chopper_04") 0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_04 "single" "sq_sur_chopper_04" none))
    )
    (cs_fly_by "ps_sur_phantom_04/p0")
    (cs_fly_by "ps_sur_phantom_04/p1")
    (cs_fly_by "ps_sur_phantom_04/p2")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_04/p3" "ps_sur_phantom_04/face" 1.0)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_phantom_04/drop" "ps_sur_phantom_04/face" 1.0)
    (sleep 15)
    (f_unload_phantom_cargo v_sur_phantom_04 "single")
    (f_unload_phantom v_sur_phantom_04 "dual")
    (sleep 90)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_sur_phantom_04/p3" "ps_sur_phantom_04/face" 1.0)
    (cs_fly_by "ps_sur_phantom_04/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_04/p0")
    (cs_fly_by "ps_sur_phantom_04/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_bonus_phantom
    (set v_sur_bonus_phantom (ai_vehicle_get_from_spawn_point "sq_sur_phantom_bonus/phantom"))
    (set b_load_in_phantom true)
    (object_set_shadowless v_sur_bonus_phantom true)
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_phantom_bonus/p0")
    (cs_fly_by "ps_sur_phantom_bonus/p1")
    (cs_fly_by "ps_sur_phantom_bonus/p2")
    (cs_fly_by "ps_sur_phantom_bonus/p3")
    (cs_fly_by "ps_sur_phantom_bonus/p4")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_bonus/p5" "ps_sur_phantom_bonus/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.35)
    (cs_fly_to_and_face "ps_sur_phantom_bonus/drop" "ps_sur_phantom_bonus/face" 1.0)
    (unit_open v_sur_bonus_phantom)
    (sleep 15)
    (vehicle_hover v_sur_bonus_phantom true)
    (set b_load_in_phantom false)
    (set b_sur_bonus_phantom_ready true)
    (f_unload_bonus_phantom v_sur_bonus_phantom)
    (sleep 150)
    (unit_close v_sur_bonus_phantom)
    (sleep_until b_sur_bonus_end)
    (vehicle_hover v_sur_bonus_phantom false)
    (sleep 45)
    (cs_fly_to_and_face "ps_sur_phantom_bonus/p5" "ps_sur_phantom_bonus/face" 1.0)
    (cs_face true "ps_sur_phantom_bonus/face_exit")
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_face false "ps_sur_phantom_bonus/face_exit")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_sur_phantom_bonus/p4")
    (cs_fly_by "ps_sur_phantom_bonus/p3")
    (cs_fly_by "ps_sur_phantom_bonus/p2")
    (cs_fly_by "ps_sur_phantom_bonus/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_bonus/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script static void test_survival_objects
    (object_destroy_folder "eq_sc110")
    (object_destroy_folder "wp_sc110")
    (object_destroy_folder "v_sc110")
    (object_destroy_folder "sc_pod_01")
    (object_destroy_folder "sc_pod_02")
    (object_destroy_folder "sc_pod_04")
    (object_destroy_folder "cr_pod_01")
    (object_destroy_folder "cr_pod_02")
    (object_destroy_folder "cr_pod_04")
    (object_create_folder_anew "eq_survival")
    (object_create_folder_anew "wp_survival")
    (object_create_folder_anew "v_survival")
    (object_create_folder_anew "sc_survival")
    (object_create_folder_anew "cr_survival")
)

(script static void the_fall_sc_sh1
    (begin
        (scenery_animation_start "tether_string" "objects\levels\atlas\tether\tether_strand_flyaway_sc110\tether_strand_flyaway_sc110" "boomtime")
        (scenery_animation_start "tether_pieces" "objects\levels\atlas\tether\tether_version_animated_park\tower\tower" "boomtime")
        (scenery_animation_start "tether_pieces_outer" "objects\levels\atlas\tether\tether_version_animated_park\chunks\chunks" "boomtime")
        (object_set_custom_animation_speed "tether_pieces" 1.5)
        (object_set_custom_animation_speed "tether_string" 1.5)
        (object_set_custom_animation_speed "tether_pieces_outer" 1.5)
        (atmosphere_fog_override_fade 0 0.0 0.0)
        (object_set_permutation "sc110_sky1" "" "bang")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 0 "the_fall_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (cinematic_object_create_cinematic_anchor "the_fall_anchor" "the_fall_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "ground_impact01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "ground_impact02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "ground_impact03_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "ground_impact04_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 "primary_impact_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "water_impact01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "water_impact02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "water_impact03_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "water_impact_large_1" true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "tether_piece01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 11 "tether_piece02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 12 "tether_piece03_1" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 13 true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 14 true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_start_effect 0 0 0 20 "tether_pieces_outer")
    (cinematic_scripting_start_screen_effect 0 0 0 0)
    (atmosphere_fog_override_fade 2 0.4 18.0)
    (cinematic_print "custom script play")
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "fire" 0.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 0 0 0 0)
    (sleep 4)
    (cinematic_scripting_start_effect 0 0 0 13 "tether_pieces_outer")
    (sleep 15)
    (cinematic_scripting_start_effect 0 0 0 14 "tether_pieces_outer")
    (sleep 20)
    (cinematic_scripting_start_effect 0 0 0 12 "tether_pieces_outer")
    (sleep 40)
    (cinematic_scripting_start_effect 0 0 0 19 "tether_pieces_outer")
    (sleep 10)
    (cinematic_scripting_start_effect 0 0 0 15 "tether_pieces_outer")
    (sleep 30)
    (cinematic_scripting_start_effect 0 0 0 16 "tether_pieces_outer")
    (sleep 5)
    (cinematic_scripting_start_effect 0 0 0 2 "door_blast")
    (sleep 29)
    (cinematic_scripting_start_effect 0 0 0 0 (cinematic_object_get "tether_new01"))
    (cinematic_scripting_start_effect 0 0 0 1 (cinematic_object_get "ground_impact04"))
    (sleep 28)
    (cinematic_scripting_start_effect 0 0 0 3 (cinematic_object_get "water_impact_large"))
    (sleep 33)
    (cinematic_scripting_start_effect 0 0 0 4 (cinematic_object_get "water_impact01"))
    (sleep 8)
    (cinematic_scripting_start_effect 0 0 0 6 (cinematic_object_get "water_impact03"))
    (sleep 9)
    (cinematic_scripting_start_effect 0 0 0 5 (cinematic_object_get "water_impact02"))
    (sleep 18)
    (cinematic_scripting_start_effect 0 0 0 17 "tether_pieces_outer")
    (sleep 25)
    (cinematic_print "custom script play")
    (begin
        (cinematic_object_destroy "tether_new01")
        (cinematic_object_destroy "tether_new02")
        (cinematic_object_destroy "tether_new03")
    )
    (sleep 45)
    (cinematic_scripting_start_effect 0 0 0 18 "tether_pieces_outer")
    (sleep 80)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "fire" 1.0 0.0)
    (sleep 95)
    (cinematic_scripting_start_effect 0 0 0 8 "sc110_sky1")
    (sleep 110)
    (cinematic_scripting_start_effect 0 0 0 9 "sc110_sky1")
    (sleep 25)
    (cinematic_scripting_start_effect 0 0 0 7 "sc110_sky1")
    (sleep 20)
    (cinematic_scripting_start_effect 0 0 0 10 "sc110_sky1")
    (sleep 1)
    (cinematic_scripting_start_effect 0 0 0 11 "sc110_sky1")
    (sleep 329)
    (atmosphere_fog_override_fade 2 0.75 18.0)
    (cinematic_print "custom script play")
    (sleep 20)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !the_fall_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (the_fall_sc_sh1)
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
    (cinematic_scripting_destroy_object 0 0 11)
    (cinematic_scripting_destroy_object 0 0 12)
    (cinematic_scripting_destroy_object 0 0 13)
    (cinematic_scripting_destroy_object 0 0 14)
)

(script static void the_fall_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void begin_the_fall_debug
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

(script static void end_the_fall_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void the_fall_debug
    (begin_the_fall_debug)
    (fade_in 0.0 0.0 0.0 0)
    (!the_fall_sc)
    (end_the_fall_debug)
)

(script static void begin_the_fall
    (cinematic_zone_activate 0)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
)

(script static void end_the_fall
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void the_fall
    (begin_the_fall)
    (fade_in 0.0 0.0 0.0 0)
    (!the_fall_sc)
    (end_the_fall)
)

(script static void sc110_int_sc_01_sh1
    (begin
        (atmosphere_fog_override_fade 3 1.0 0.0)
        (cinematic_show_letterbox_immediate true)
        (fade_in 0.0 0.0 0.0 30)
        (player_effect_set_max_rumble 0.05 0.05)
        (player_effect_start 1.0 0.0)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 0 "cin_sc110_int_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_int_sc_anchor" "cin_sc110_int_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "dutch_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_helmet_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_laser_sc110_int_sc_01_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "cin_drone_sc110_int_sc_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "cin_drone2_sc110_int_sc_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "cin_drone3_sc110_int_sc_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "drone_hud_sc110_int_sc_01_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_start_effect 1 0 0 0 (cinematic_object_get "cin_drone2"))
    (cinematic_scripting_start_screen_effect 1 0 0 0)
    (cinematic_print "custom script play")
    (object_set_permutation "sc110_sky1" "" "proxy")
    (sleep 1)
    (cinematic_scripting_start_music 1 0 0 0)
    (sleep 248)
    (cinematic_print "custom script play")
    (cinematic_scripting_stop_screen_effect 1 0 0 0)
    (fade_out 1.0 1.0 1.0 0)
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_int_sc_01_sh2
    (begin
        (fade_in 1.0 1.0 1.0 10)
        (player_effect_stop 0.0)
        (atmosphere_fog_override_fade 3 0.0 0.0)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 1 "cin_sc110_int_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_int_sc_anchor" "cin_sc110_int_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "dutch_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_helmet_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_laser_sc110_int_sc_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "cin_pistol2_sc110_int_sc_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "cin_drone_sc110_int_sc_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "cin_drone2_sc110_int_sc_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "cin_drone3_sc110_int_sc_01_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (cinematic_scripting_start_effect 1 0 1 0 (cinematic_object_get "cin_drone1"))
    (cinematic_scripting_start_effect 1 0 1 2 (cinematic_object_get "cin_drone3"))
    (cinematic_scripting_start_effect 1 0 1 1 (cinematic_object_get "cin_drone2"))
    (object_set_function_variable (cinematic_scripting_get_object 1 0 1) "polarize" 1.0 0.0)
    (sleep 135)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 1) "polarize" 0.0 30.0)
    (sleep 19)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_int_sc_01_sh3
    (begin
        (cinematic_show_letterbox_immediate false)
        (fade_in 1.0 1.0 1.0 10)
        (cinematic_hud_on)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 2 "cin_sc110_int_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 2)
    (cinematic_object_create_cinematic_anchor "cin_sc110_int_sc_anchor" "cin_sc110_int_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "dutch_01_3" true)
    (object_hide (cinematic_scripting_get_object 1 0 1) true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "cin_drone_sc110_int_sc_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "cin_drone2_sc110_int_sc_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "cin_drone3_sc110_int_sc_01_3" true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 8 "fp_laser01_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 1)
    (cinematic_scripting_start_music 1 0 2 0)
    (sleep 19)
    (cinematic_scripting_start_dialogue 1 0 2 0 (cinematic_scripting_get_object 1 0 0))
    (sleep 73)
    (cinematic_scripting_start_dialogue 1 0 2 1 (cinematic_scripting_get_object 1 0 0))
    (sleep 95)
    (fade_out 1.0 1.0 1.0 5)
    (cinematic_print "custom script play")
    (sleep 5)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_int_sc_01
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (sc110_int_sc_01_sh1)
    (sc110_int_sc_01_sh2)
    (sc110_int_sc_01_sh3)
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
)

(script static void sc110_int_sc_cleanup
    (cinematic_scripting_clean_up 1)
)

(script static void begin_sc110_int_sc_debug
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

(script static void end_sc110_int_sc_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 1)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc110_int_sc_debug
    (begin_sc110_int_sc_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_int_sc_01)
    (sound_class_set_gain "" 1.0 60)
    (end_sc110_int_sc_debug)
)

(script static void begin_sc110_int_sc
    (cinematic_zone_activate 1)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
)

(script static void end_sc110_int_sc
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_int_sc
    (begin_sc110_int_sc)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_int_sc_01)
    (sound_class_set_gain "" 1.0 60)
    (end_sc110_int_sc)
)

(script static void sc110_out_sc_01a_sc_sh1
    (fade_in 1.0 1.0 1.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "cin_warthog_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 "cin_chain_turret_1" true)
    (object_hide (cinematic_scripting_get_object 2 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 3 "dukes_of_hazard_01hog_1" true)
    (object_hide (cinematic_scripting_get_object 2 0 4) true)
    (object_hide (cinematic_scripting_get_object 2 0 5) true)
    (object_hide (cinematic_scripting_get_object 2 0 6) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.0 0.0)
    (cinematic_scripting_start_effect 2 0 0 0 (cinematic_object_get "warthog"))
    (sleep 1)
    (cinematic_scripting_start_music 2 0 0 0)
    (sleep 52)
    (object_set_permutation "sc110_sky1" "" "sky")
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_01a_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "cin_warthog_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 "cin_chain_turret_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 "cin_dutch_sc1_2" true)
    (object_hide (cinematic_scripting_get_object 2 0 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 4 "statue_brush_01hog_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 "hog_land_01hog_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 "01_hog_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 17)
    (cinematic_scripting_start_effect 2 0 1 0 (cinematic_object_get "fx_warthog_land"))
    (sleep 6)
    (begin
        (object_set_permutation (cinematic_object_get "warthog") "hull" "medium")
        (object_set_permutation (cinematic_object_get "warthog") "f_hull" "major")
        (object_set_permutation (cinematic_object_get "warthog") "bumper" "medium")
        (object_set_permutation (cinematic_object_get "warthog") "lf_wheel" "medium")
        (object_set_permutation (cinematic_object_get "warthog") "rf_wheel" "medium")
        (object_set_permutation (cinematic_object_get "warthog") "lb_wheel" "medium")
    )
    (cinematic_print "custom script play")
    (begin
        (object_set_permutation (cinematic_object_get "warthog") "rf_fender" "major")
        (object_set_permutation (cinematic_object_get "warthog_turret") "belt" "major")
        (object_set_permutation (cinematic_object_get "warthog_turret") "gun" "medium")
    )
    (cinematic_scripting_start_effect 2 0 1 1 (cinematic_object_get "warthog"))
    (cinematic_print "custom script play")
    (sleep 27)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_01a_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (sc110_out_sc_01a_sc_sh1)
    (sc110_out_sc_01a_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 0 0)
    (cinematic_scripting_destroy_object 2 0 1)
    (cinematic_scripting_destroy_object 2 0 2)
    (cinematic_scripting_destroy_object 2 0 3)
    (cinematic_scripting_destroy_object 2 0 4)
    (cinematic_scripting_destroy_object 2 0 5)
    (cinematic_scripting_destroy_object 2 0 6)
)

(script static void sc110_out_sc_02hog_sc_sh1
    (cinematic_object_destroy "cin_dutch2")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 1) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 0 "dutch02_warthog_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 1 "cin_warthog02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 2 "hemet02_warthog_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 3 "cin_chain_turret2_1" true)
    (object_hide (cinematic_scripting_get_object 2 1 4) true)
    (object_hide (cinematic_scripting_get_object 2 1 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 6 "dutch_tumbleland_fx_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_start_effect 2 1 0 0 (cinematic_object_get "fx_dutch_tumbleland"))
    (sleep 1)
    (cinematic_scripting_start_dialogue 2 1 0 0 none)
    (sleep 19)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_02hog_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 1) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 1) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 0 "dutch02_warthog_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 1 "cin_warthog02_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 2 "hemet02_warthog_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 3 "cin_chain_turret2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 4 "02_hog_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 5 "dutch_skidmark_fx_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 6 "dutch_tumbleland_fx_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (cinematic_scripting_start_effect 2 1 1 0 (cinematic_object_get "fx_dutch_chest_skidmark"))
    (cinematic_scripting_start_effect 2 1 1 1 (cinematic_object_get "warthog"))
    (sleep 73)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_02hog_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 1) 2 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 1) 2)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 0 "dutch02_warthog_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 1 "cin_warthog02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 2 "hemet02_warthog_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 3 "cin_chain_turret2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 4 "02_hog_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 5 "dutch_skidmark_fx_3" true)
    (object_hide (cinematic_scripting_get_object 2 1 6) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 1)
    (cinematic_scripting_start_music 2 1 2 0)
    (sleep 140)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_02hog_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 1) 0)
    (sc110_out_sc_02hog_sc_sh1)
    (sc110_out_sc_02hog_sc_sh2)
    (sc110_out_sc_02hog_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 1 0)
    (cinematic_scripting_destroy_object 2 1 1)
    (cinematic_scripting_destroy_object 2 1 2)
    (cinematic_scripting_destroy_object 2 1 3)
    (cinematic_scripting_destroy_object 2 1 4)
    (cinematic_scripting_destroy_object 2 1 5)
    (cinematic_scripting_destroy_object 2 1 6)
)

(script static void sc110_out_sc_03hog_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 2) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 2) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 0 "dutch03_warthog_1" true)
    (object_hide (cinematic_scripting_get_object 2 2 1) true)
    (object_hide (cinematic_scripting_get_object 2 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 5 "hemet03_warthog_1" true)
    (object_hide (cinematic_scripting_get_object 2 2 6) true)
    (object_hide (cinematic_scripting_get_object 2 2 7) true)
    (object_hide (cinematic_scripting_get_object 2 2 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 9 "03_hog_1" true)
    (object_hide (cinematic_scripting_get_object 2 2 10) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 26)
    (cinematic_scripting_start_dialogue 2 2 0 0 (cinematic_scripting_get_object 2 2 0))
    (sleep 182)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03hog_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 2) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 2) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 0 "dutch03_warthog_2" true)
    (object_hide (cinematic_scripting_get_object 2 2 1) true)
    (object_hide (cinematic_scripting_get_object 2 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 5 "hemet03_warthog_2" true)
    (object_hide (cinematic_scripting_get_object 2 2 6) true)
    (object_hide (cinematic_scripting_get_object 2 2 7) true)
    (object_hide (cinematic_scripting_get_object 2 2 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 9 "03_hog_2" true)
    (object_hide (cinematic_scripting_get_object 2 2 10) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 116)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03hog_sc_sh3
    (fade_in 1.0 1.0 1.0 5)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 2) 2 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 2) 2)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 2 2 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 1 "sc110_drone3a_3" true)
    (object_hide (cinematic_scripting_get_object 2 2 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 3 "cin_warthog03_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 4 "cin_chain_turret3_3" true)
    (object_hide (cinematic_scripting_get_object 2 2 5) true)
    (object_hide (cinematic_scripting_get_object 2 2 6) true)
    (object_hide (cinematic_scripting_get_object 2 2 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 8 "super_sc03_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 9 "03_hog_3" true)
    (object_hide (cinematic_scripting_get_object 2 2 10) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "eyes" 0.1 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "timestamp" 0.4 0.0)
    (cinematic_scripting_start_screen_effect 2 2 2 0)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "status" 0.8 0.0)
    (sleep 2)
    (cinematic_scripting_start_effect 2 2 2 0 (cinematic_object_get "drone_fighter"))
    (sleep 18)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "timestamp" 0.5 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "eyes" 0.0 0.0)
    (sleep 8)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "timestamp" 0.4 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "timestamp" 0.5 0.0)
    (sleep 4)
    (cinematic_scripting_start_screen_effect 2 2 2 1)
    (sleep 4)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 2 2 8) "eyes" 0.6 0.0)
    (sleep 9)
    (fade_in 1.0 1.0 1.0 5)
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_scripting_stop_screen_effect 2 2 2 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03hog_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 2) 3 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 2) 3)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 0 "dutch03_warthog_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 1 "sc110_drone3a_4" true)
    (object_hide (cinematic_scripting_get_object 2 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 5 "hemet03_warthog_4" true)
    (object_hide (cinematic_scripting_get_object 2 2 6) true)
    (object_hide (cinematic_scripting_get_object 2 2 7) true)
    (object_hide (cinematic_scripting_get_object 2 2 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 9 "03_hog_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 10 "sc110_03_hog_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 19)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03hog_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 2) 4 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 2) 4)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 0 "dutch03_warthog_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 1 "sc110_drone3a_5" true)
    (object_hide (cinematic_scripting_get_object 2 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 5 "hemet03_warthog_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 6 "drone_ejection_03a_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 7 "drone_impact_03a_5" true)
    (object_hide (cinematic_scripting_get_object 2 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 2 9) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 10 "sc110_03_hog_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (cinematic_scripting_start_effect 2 2 4 0 (cinematic_object_get "fx_drone_impact"))
    (cinematic_scripting_start_effect 2 2 4 1 (cinematic_object_get "final_statue"))
    (sleep 2)
    (cinematic_scripting_start_effect 2 2 4 3 (cinematic_object_get "drone_fighter"))
    (cinematic_scripting_start_effect 2 2 4 2 (cinematic_object_get "drone_fighter"))
    (sleep 26)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03hog_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 2) 5 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 2) 5)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 2 2 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 1 "sc110_drone3a_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 2 "optics_3a_6" true)
    (object_hide (cinematic_scripting_get_object 2 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 2 4) true)
    (object_hide (cinematic_scripting_get_object 2 2 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 6 "drone_ejection_03a_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 7 "drone_impact_03a_6" true)
    (object_hide (cinematic_scripting_get_object 2 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 2 9) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 10 "sc110_03_hog_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (cinematic_scripting_start_effect 2 2 5 0 (cinematic_object_get "drone_optics"))
    (cinematic_scripting_start_effect 2 2 5 1 (cinematic_object_get "drone_optics"))
    (sleep 130)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_03hog_sc
    (cinematic_print "beginning scene 3")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 2) 0)
    (sc110_out_sc_03hog_sc_sh1)
    (sc110_out_sc_03hog_sc_sh2)
    (sc110_out_sc_03hog_sc_sh3)
    (sc110_out_sc_03hog_sc_sh4)
    (sc110_out_sc_03hog_sc_sh5)
    (sc110_out_sc_03hog_sc_sh6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 2 0)
    (cinematic_scripting_destroy_object 2 2 1)
    (cinematic_scripting_destroy_object 2 2 2)
    (cinematic_scripting_destroy_object 2 2 3)
    (cinematic_scripting_destroy_object 2 2 4)
    (cinematic_scripting_destroy_object 2 2 5)
    (cinematic_scripting_destroy_object 2 2 6)
    (cinematic_scripting_destroy_object 2 2 7)
    (cinematic_scripting_destroy_object 2 2 8)
    (cinematic_scripting_destroy_object 2 2 9)
    (cinematic_scripting_destroy_object 2 2 10)
)

(script static void sc110_out_sc_04hog_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 3) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 3) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 0 "dutch04_warthog_1" true)
    (object_hide (cinematic_scripting_get_object 2 3 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 2 "cin_warthog04_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 3 "cin_chain_turret4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 4 "hemet04_warthog_1" true)
    (object_hide (cinematic_scripting_get_object 2 3 5) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 25)
    (cinematic_scripting_start_dialogue 2 3 0 0 (cinematic_scripting_get_object 2 3 0))
    (sleep 112)
    (cinematic_scripting_start_effect 2 3 0 1 (cinematic_object_get "warthog_turret"))
    (cinematic_print "custom script play")
    (cinematic_scripting_start_effect 2 3 0 3 (cinematic_object_get "warthog"))
    (begin
        (object_set_permutation (cinematic_object_get "warthog") "hull" "destroyed")
        (object_set_permutation (cinematic_object_get "warthog") "f_hull" "destroyed")
        (object_set_permutation (cinematic_object_get "warthog") "bumper" "medium")
        (object_set_permutation (cinematic_object_get "warthog_turret") "gun" "destroyed")
        (object_set_permutation (cinematic_object_get "warthog_turret") "belt" "destroyed")
    )
    (cinematic_print "custom script play")
    (begin
        (object_set_permutation (cinematic_object_get "warthog") "lf_wheel" "medium")
        (object_set_permutation (cinematic_object_get "warthog") "rb_wheel" "destroyed")
        (object_set_permutation (cinematic_object_get "warthog") "lb_wheel" "destroyed")
        (object_set_permutation (cinematic_object_get "warthog") "lb_fender" "destroyed")
        (object_set_permutation (cinematic_object_get "warthog") "rb_fender" "destroyed")
        (object_set_permutation (cinematic_object_get "warthog") "lf_fender" "destroyed")
    )
    (sleep 1)
    (cinematic_scripting_start_effect 2 3 0 5 (cinematic_object_get "warthog"))
    (cinematic_scripting_start_effect 2 3 0 0 (cinematic_object_get "warthog"))
    (cinematic_scripting_start_effect 2 3 0 4 (cinematic_object_get "warthog"))
    (sleep 1)
    (cinematic_scripting_start_effect 2 3 0 2 (cinematic_object_get "warthog"))
    (sleep 111)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_04hog_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 3) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 3) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 0 "dutch04_warthog_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 1 "sc110_drone4a_2" true)
    (object_hide (cinematic_scripting_get_object 2 3 2) true)
    (object_hide (cinematic_scripting_get_object 2 3 3) true)
    (object_hide (cinematic_scripting_get_object 2 3 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 5 "sc110_04_hog_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 43)
    (cinematic_scripting_start_dialogue 2 3 1 0 (cinematic_scripting_get_object 2 3 0))
    (sleep 24)
    (fade_out 0.0 0.0 0.0 60)
    (cinematic_print "custom script play")
    (sleep 60)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_04hog_sc
    (cinematic_print "beginning scene 4")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 3) 0)
    (sc110_out_sc_04hog_sc_sh1)
    (sc110_out_sc_04hog_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 3 0)
    (cinematic_scripting_destroy_object 2 3 1)
    (cinematic_scripting_destroy_object 2 3 2)
    (cinematic_scripting_destroy_object 2 3 3)
    (cinematic_scripting_destroy_object 2 3 4)
    (cinematic_scripting_destroy_object 2 3 5)
)

(script static void sc110_out_sc_hog_cleanup
    (cinematic_scripting_clean_up 2)
)

(script static void begin_sc110_out_sc_hog_debug
    (cinematic_zone_activate_for_debugging 2)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
)

(script static void end_sc110_out_sc_hog_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 2)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc110_out_sc_hog_debug
    (begin_sc110_out_sc_hog_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_out_sc_01a_sc)
    (!sc110_out_sc_02hog_sc)
    (!sc110_out_sc_03hog_sc)
    (!sc110_out_sc_04hog_sc)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sleep 60)
    )
    (end_sc110_out_sc_hog_debug)
)

(script static void begin_sc110_out_sc_hog
    (cinematic_zone_activate 2)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
)

(script static void end_sc110_out_sc_hog
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_hog
    (begin_sc110_out_sc_hog)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_out_sc_01a_sc)
    (!sc110_out_sc_02hog_sc)
    (!sc110_out_sc_03hog_sc)
    (!sc110_out_sc_04hog_sc)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sleep 60)
    )
    (end_sc110_out_sc_hog)
)

(script static void sc110_out_sc_01b_sc_sh1
    (fade_in 1.0 1.0 1.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 3 0 0) true)
    (object_hide (cinematic_scripting_get_object 3 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 "cin_ghost_sc1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 "ghost_jump_01_1" true)
    (object_hide (cinematic_scripting_get_object 3 0 4) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_start_effect 3 0 0 0 (cinematic_object_get "cin_ghost"))
    (sleep 1)
    (cinematic_scripting_start_music 3 0 0 0)
    (sleep 52)
    (object_set_permutation "sc110_sky1" "" "sky")
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_01b_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 "cin_dutch_sc1b_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 "statue_1a_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 "cin_ghost_sc1_2" true)
    (object_hide (cinematic_scripting_get_object 3 0 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 4 "ghost_land_01_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 17)
    (cinematic_scripting_start_effect 3 0 1 0 (cinematic_object_get "fx_ghost_land"))
    (sleep 3)
    (begin
        (object_set_permutation (cinematic_object_get "cin_ghost") "hull" "medium")
        (object_set_permutation (cinematic_object_get "cin_ghost") "l_gun" "medium")
        (object_set_permutation (cinematic_object_get "cin_ghost") "l_wing" "major")
        (object_set_permutation (cinematic_object_get "cin_ghost") "seat" "major")
    )
    (cinematic_print "custom script play")
    (sleep 4)
    (cinematic_scripting_start_effect 3 0 1 1 (cinematic_object_get "cin_ghost"))
    (sleep 26)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_01b_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (sc110_out_sc_01b_sc_sh1)
    (sc110_out_sc_01b_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 0 0)
    (cinematic_scripting_destroy_object 3 0 1)
    (cinematic_scripting_destroy_object 3 0 2)
    (cinematic_scripting_destroy_object 3 0 3)
    (cinematic_scripting_destroy_object 3 0 4)
)

(script static void sc110_out_sc_02ghost_sc_sh1
    (cinematic_object_destroy "cin_dutch2")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 "dutch02_ghost_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 "hemet02_ghost_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 "cin_ghost02_1" true)
    (object_hide (cinematic_scripting_get_object 3 1 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 "dutch_tumbleland_fx_b_1" true)
    (object_hide (cinematic_scripting_get_object 3 1 5) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_start_effect 3 1 0 1 (cinematic_object_get "fx_dutch_tumbleland"))
    (begin
        (object_set_permutation (cinematic_object_get "ghost") "hull" "medium")
        (object_set_permutation (cinematic_object_get "ghost") "l_gun" "medium")
        (object_set_permutation (cinematic_object_get "ghost") "l_wing" "major")
        (object_set_permutation (cinematic_object_get "ghost") "seat" "major")
    )
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_scripting_start_dialogue 3 1 0 0 none)
    (sleep 19)
    (cinematic_scripting_start_effect 3 1 0 0 (cinematic_object_get "ghost"))
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_02ghost_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 "dutch02_ghost_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 "hemet02_ghost_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 "cin_ghost02_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 3 "dutch_skidmark_fx_b_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 4 "dutch_tumbleland_fx_b_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 5 "02_ghost_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (cinematic_scripting_start_effect 3 1 1 0 (cinematic_object_get "fx_dutch_chest_skidmark"))
    (cinematic_scripting_start_effect 3 1 1 1 (cinematic_object_get "ghost"))
    (sleep 73)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_02ghost_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 1) 2 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 2)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 "dutch02_ghost_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 "hemet02_ghost_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 2 "cin_ghost02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 3 "dutch_skidmark_fx_b_3" true)
    (object_hide (cinematic_scripting_get_object 3 1 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 5 "02_ghost_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 1)
    (cinematic_scripting_start_music 3 1 2 0)
    (sleep 140)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_02ghost_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 1) 0)
    (sc110_out_sc_02ghost_sc_sh1)
    (sc110_out_sc_02ghost_sc_sh2)
    (sc110_out_sc_02ghost_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 1 0)
    (cinematic_scripting_destroy_object 3 1 1)
    (cinematic_scripting_destroy_object 3 1 2)
    (cinematic_scripting_destroy_object 3 1 3)
    (cinematic_scripting_destroy_object 3 1 4)
    (cinematic_scripting_destroy_object 3 1 5)
)

(script static void sc110_out_sc_03ghost_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 2) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 2) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 0 "dutch03_ghost_1" true)
    (object_hide (cinematic_scripting_get_object 3 2 1) true)
    (object_hide (cinematic_scripting_get_object 3 2 2) true)
    (object_hide (cinematic_scripting_get_object 3 2 3) true)
    (object_hide (cinematic_scripting_get_object 3 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 5 "hemet03_ghost_1" true)
    (object_hide (cinematic_scripting_get_object 3 2 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 7 "03_ghost_1" true)
    (object_hide (cinematic_scripting_get_object 3 2 8) true)
    (object_hide (cinematic_scripting_get_object 3 2 9) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 26)
    (cinematic_scripting_start_dialogue 3 2 0 0 (cinematic_scripting_get_object 3 2 0))
    (sleep 182)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03ghost_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 2) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 2) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 0 "dutch03_ghost_2" true)
    (object_hide (cinematic_scripting_get_object 3 2 1) true)
    (object_hide (cinematic_scripting_get_object 3 2 2) true)
    (object_hide (cinematic_scripting_get_object 3 2 3) true)
    (object_hide (cinematic_scripting_get_object 3 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 5 "hemet03_ghost_2" true)
    (object_hide (cinematic_scripting_get_object 3 2 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 7 "03_ghost_2" true)
    (object_hide (cinematic_scripting_get_object 3 2 8) true)
    (object_hide (cinematic_scripting_get_object 3 2 9) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 2)
    (cinematic_scripting_start_effect 3 2 1 0 (cinematic_object_get "drone_fighter"))
    (sleep 114)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03ghost_sc_sh3
    (fade_in 1.0 1.0 1.0 5)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 2) 2 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 2) 2)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 3 2 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 1 "sc110_drone3b_3" true)
    (object_hide (cinematic_scripting_get_object 3 2 2) true)
    (object_hide (cinematic_scripting_get_object 3 2 3) true)
    (object_hide (cinematic_scripting_get_object 3 2 4) true)
    (object_hide (cinematic_scripting_get_object 3 2 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 6 "cin_ghost03_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 7 "03_ghost_3" true)
    (object_hide (cinematic_scripting_get_object 3 2 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 9 "super_sc03b_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "eyes" 0.1 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "timestamp" 0.4 0.0)
    (cinematic_scripting_start_screen_effect 3 2 2 0)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "status" 0.8 0.0)
    (sleep 2)
    (cinematic_scripting_start_effect 3 2 2 0 (cinematic_object_get "drone_fighter"))
    (sleep 18)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "timestamp" 0.5 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "eyes" 0.0 0.0)
    (sleep 8)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "timestamp" 0.4 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "timestamp" 0.5 0.0)
    (sleep 4)
    (cinematic_scripting_start_screen_effect 3 2 2 1)
    (sleep 4)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 3 2 9) "eyes" 0.6 0.0)
    (sleep 9)
    (fade_in 1.0 1.0 1.0 5)
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_scripting_stop_screen_effect 3 2 2 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03ghost_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 2) 3 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 2) 3)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 0 "dutch03_ghost_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 1 "sc110_drone3b_4" true)
    (object_hide (cinematic_scripting_get_object 3 2 2) true)
    (object_hide (cinematic_scripting_get_object 3 2 3) true)
    (object_hide (cinematic_scripting_get_object 3 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 5 "hemet03_ghost_4" true)
    (object_hide (cinematic_scripting_get_object 3 2 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 7 "03_ghost_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 8 "sc110_03_ghost_4" true)
    (object_hide (cinematic_scripting_get_object 3 2 9) true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 19)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03ghost_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 2) 4 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 2) 4)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 0 "dutch03_ghost_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 1 "sc110_drone3b_5" true)
    (object_hide (cinematic_scripting_get_object 3 2 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 3 "drone_ejection_03b_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 4 "drone_impact_03b_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 5 "hemet03_ghost_5" true)
    (object_hide (cinematic_scripting_get_object 3 2 6) true)
    (object_hide (cinematic_scripting_get_object 3 2 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 8 "sc110_03_ghost_5" true)
    (object_hide (cinematic_scripting_get_object 3 2 9) true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (cinematic_scripting_start_effect 3 2 4 0 (cinematic_object_get "fx_drone_impact"))
    (cinematic_scripting_start_effect 3 2 4 1 (cinematic_object_get "final_statue"))
    (sleep 2)
    (cinematic_scripting_start_effect 3 2 4 3 (cinematic_object_get "drone_fighter"))
    (cinematic_scripting_start_effect 3 2 4 2 (cinematic_object_get "drone_fighter"))
    (sleep 26)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03ghost_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 2) 5 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 2) 5)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 3 2 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 1 "sc110_drone3b_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 2 "optics_3b_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 3 "drone_ejection_03b_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 4 "drone_impact_03b_6" true)
    (object_hide (cinematic_scripting_get_object 3 2 5) true)
    (object_hide (cinematic_scripting_get_object 3 2 6) true)
    (object_hide (cinematic_scripting_get_object 3 2 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 8 "sc110_03_ghost_6" true)
    (object_hide (cinematic_scripting_get_object 3 2 9) true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (cinematic_scripting_start_effect 3 2 5 0 (cinematic_object_get "drone_optics"))
    (cinematic_scripting_start_effect 3 2 5 1 (cinematic_object_get "drone_optics"))
    (sleep 130)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_03ghost_sc
    (cinematic_print "beginning scene 3")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 2) 0)
    (sc110_out_sc_03ghost_sc_sh1)
    (sc110_out_sc_03ghost_sc_sh2)
    (sc110_out_sc_03ghost_sc_sh3)
    (sc110_out_sc_03ghost_sc_sh4)
    (sc110_out_sc_03ghost_sc_sh5)
    (sc110_out_sc_03ghost_sc_sh6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 2 0)
    (cinematic_scripting_destroy_object 3 2 1)
    (cinematic_scripting_destroy_object 3 2 2)
    (cinematic_scripting_destroy_object 3 2 3)
    (cinematic_scripting_destroy_object 3 2 4)
    (cinematic_scripting_destroy_object 3 2 5)
    (cinematic_scripting_destroy_object 3 2 6)
    (cinematic_scripting_destroy_object 3 2 7)
    (cinematic_scripting_destroy_object 3 2 8)
    (cinematic_scripting_destroy_object 3 2 9)
)

(script static void sc110_out_sc_04ghost_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 3) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 3) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 0 "dutch04_ghost_1" true)
    (object_hide (cinematic_scripting_get_object 3 3 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 2 "hemet04_ghost_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 3 "cin_ghost04_1" true)
    (object_hide (cinematic_scripting_get_object 3 3 4) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 25)
    (cinematic_scripting_start_dialogue 3 3 0 0 (cinematic_scripting_get_object 3 3 0))
    (sleep 112)
    (cinematic_scripting_start_effect 3 3 0 1 (cinematic_object_get "ghost"))
    (cinematic_print "custom script play")
    (cinematic_scripting_start_effect 3 3 0 0 (cinematic_object_get "ghost"))
    (begin
        (object_set_permutation (cinematic_object_get "ghost") "l_wing" "destroyed")
        (object_set_permutation (cinematic_object_get "ghost") "seat" "destroyed")
        (object_set_permutation (cinematic_object_get "ghost") "r_wing" "major")
        (object_set_permutation (cinematic_object_get "ghost") "r_gun" "destroyed")
        (object_set_permutation (cinematic_object_get "ghost") "l_gun" "destroyed")
        (object_set_permutation (cinematic_object_get "ghost") "hull" "major")
    )
    (sleep 113)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_04ghost_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 3) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 3) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 0 "dutch04_ghost_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 1 "sc110_drone4b_2" true)
    (object_hide (cinematic_scripting_get_object 3 3 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 3 "cin_ghost04_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 4 "sc110_04_ghost_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 43)
    (cinematic_scripting_start_dialogue 3 3 1 0 (cinematic_scripting_get_object 3 3 0))
    (sleep 24)
    (fade_out 0.0 0.0 0.0 60)
    (cinematic_print "custom script play")
    (sleep 60)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_04ghost_sc
    (cinematic_print "beginning scene 4")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 3) 0)
    (sc110_out_sc_04ghost_sc_sh1)
    (sc110_out_sc_04ghost_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 3 0)
    (cinematic_scripting_destroy_object 3 3 1)
    (cinematic_scripting_destroy_object 3 3 2)
    (cinematic_scripting_destroy_object 3 3 3)
    (cinematic_scripting_destroy_object 3 3 4)
)

(script static void sc110_out_sc_ghost_cleanup
    (cinematic_scripting_clean_up 3)
)

(script static void begin_sc110_out_sc_ghost_debug
    (cinematic_zone_activate_for_debugging 3)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 3))
)

(script static void end_sc110_out_sc_ghost_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 3)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc110_out_sc_ghost_debug
    (begin_sc110_out_sc_ghost_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_out_sc_01b_sc)
    (!sc110_out_sc_02ghost_sc)
    (!sc110_out_sc_03ghost_sc)
    (!sc110_out_sc_04ghost_sc)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sleep 60)
    )
    (end_sc110_out_sc_ghost_debug)
)

(script static void begin_sc110_out_sc_ghost
    (cinematic_zone_activate 3)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 3))
)

(script static void end_sc110_out_sc_ghost
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_ghost
    (begin_sc110_out_sc_ghost)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_out_sc_01b_sc)
    (!sc110_out_sc_02ghost_sc)
    (!sc110_out_sc_03ghost_sc)
    (!sc110_out_sc_04ghost_sc)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sleep 60)
    )
    (end_sc110_out_sc_ghost)
)

(script static void sc110_out_sc_01c_sc_sh1
    (fade_in 1.0 1.0 1.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 4 0 0) true)
    (object_hide (cinematic_scripting_get_object 4 0 1) true)
    (object_hide (cinematic_scripting_get_object 4 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 3 "chop_jump_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 4 "cin_chopper_sc1_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_start_effect 4 0 0 0 (cinematic_object_get "chopper_one"))
    (sleep 1)
    (cinematic_scripting_start_music 4 0 0 0)
    (sleep 52)
    (object_set_permutation "sc110_sky1" "" "sky")
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_01c_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 "cin_dutch_sc1c_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 1 "statue_1a_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 2 "chop_land_01_2" true)
    (object_hide (cinematic_scripting_get_object 4 0 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 4 "cin_chopper_sc1_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 17)
    (cinematic_scripting_start_effect 4 0 1 0 (cinematic_object_get "fx_chopper_land"))
    (sleep 4)
    (begin
        (object_set_permutation (cinematic_object_get "chopper_one") "default" "medium")
        (object_set_permutation (cinematic_object_get "chopper_one") "l_gun" "medium")
        (object_set_permutation (cinematic_object_get "chopper_one") "l_wheel" "medium")
        (object_set_permutation (cinematic_object_get "chopper_one") "r_wheel" "major")
        (object_set_permutation (cinematic_object_get "chopper_one") "seat" "major")
    )
    (cinematic_print "custom script play")
    (sleep 3)
    (cinematic_scripting_start_effect 4 0 1 1 (cinematic_object_get "chopper_one"))
    (sleep 26)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_01c_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (sc110_out_sc_01c_sc_sh1)
    (sc110_out_sc_01c_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 4 0 0)
    (cinematic_scripting_destroy_object 4 0 1)
    (cinematic_scripting_destroy_object 4 0 2)
    (cinematic_scripting_destroy_object 4 0 3)
    (cinematic_scripting_destroy_object 4 0 4)
)

(script static void sc110_out_sc_02chop_sc_sh1
    (cinematic_object_destroy "cin_dutch2")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 1) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 1) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 0 "dutch02_chop_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 1 "hemet02_chop_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 2 "cin_chopper_sc2_1" true)
    (object_hide (cinematic_scripting_get_object 4 1 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 4 "dutch_tumbleland_fx_c_1" true)
    (object_hide (cinematic_scripting_get_object 4 1 5) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_scripting_start_effect 4 1 0 1 (cinematic_object_get "fx_dutch_tumbleland"))
    (begin
        (object_set_permutation (cinematic_object_get "chopper") "default" "medium")
        (object_set_permutation (cinematic_object_get "chopper") "l_gun" "medium")
        (object_set_permutation (cinematic_object_get "chopper") "l_wheel" "medium")
        (object_set_permutation (cinematic_object_get "chopper") "r_wheel" "major")
        (object_set_permutation (cinematic_object_get "chopper") "seat" "major")
    )
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_scripting_start_dialogue 4 1 0 0 none)
    (sleep 19)
    (cinematic_scripting_start_effect 4 1 0 0 (cinematic_object_get "chopper"))
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_02chop_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 1) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 1) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 0 "dutch02_chop_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 1 "hemet02_chop_2" true)
    (object_hide (cinematic_scripting_get_object 4 1 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 3 "dutch_skidmark_fx_c_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 4 "dutch_tumbleland_fx_c_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 5 "02_chop_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (cinematic_scripting_start_effect 4 1 1 0 (cinematic_object_get "fx_dutch_chest_skidmark"))
    (cinematic_scripting_start_effect 4 1 1 1 (cinematic_object_get "chopper"))
    (sleep 73)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_02chop_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 1) 2 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 1) 2)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 0 "dutch02_chop_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 1 "hemet02_chop_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 2 "cin_chopper_sc2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 3 "dutch_skidmark_fx_c_3" true)
    (object_hide (cinematic_scripting_get_object 4 1 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 5 "02_chop_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 1)
    (cinematic_scripting_start_music 4 1 2 0)
    (sleep 140)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_02chop_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 1) 0)
    (sc110_out_sc_02chop_sc_sh1)
    (sc110_out_sc_02chop_sc_sh2)
    (sc110_out_sc_02chop_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 4 1 0)
    (cinematic_scripting_destroy_object 4 1 1)
    (cinematic_scripting_destroy_object 4 1 2)
    (cinematic_scripting_destroy_object 4 1 3)
    (cinematic_scripting_destroy_object 4 1 4)
    (cinematic_scripting_destroy_object 4 1 5)
)

(script static void sc110_out_sc_03chop_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 2) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 2) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 0 "dutch03_chop_1" true)
    (object_hide (cinematic_scripting_get_object 4 2 1) true)
    (object_hide (cinematic_scripting_get_object 4 2 2) true)
    (object_hide (cinematic_scripting_get_object 4 2 3) true)
    (object_hide (cinematic_scripting_get_object 4 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 5 "hemet03_chop_1" true)
    (object_hide (cinematic_scripting_get_object 4 2 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 7 "03_chop_1" true)
    (object_hide (cinematic_scripting_get_object 4 2 8) true)
    (object_hide (cinematic_scripting_get_object 4 2 9) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 26)
    (cinematic_scripting_start_dialogue 4 2 0 0 (cinematic_scripting_get_object 4 2 0))
    (sleep 182)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03chop_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 2) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 2) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 0 "dutch03_chop_2" true)
    (object_hide (cinematic_scripting_get_object 4 2 1) true)
    (object_hide (cinematic_scripting_get_object 4 2 2) true)
    (object_hide (cinematic_scripting_get_object 4 2 3) true)
    (object_hide (cinematic_scripting_get_object 4 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 5 "hemet03_chop_2" true)
    (object_hide (cinematic_scripting_get_object 4 2 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 7 "03_chop_2" true)
    (object_hide (cinematic_scripting_get_object 4 2 8) true)
    (object_hide (cinematic_scripting_get_object 4 2 9) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 116)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03chop_sc_sh3
    (fade_in 1.0 1.0 1.0 5)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 2) 2 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 2) 2)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 4 2 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 1 "sc110_drone3c_3" true)
    (object_hide (cinematic_scripting_get_object 4 2 2) true)
    (object_hide (cinematic_scripting_get_object 4 2 3) true)
    (object_hide (cinematic_scripting_get_object 4 2 4) true)
    (object_hide (cinematic_scripting_get_object 4 2 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 6 "cin_chopper03_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 7 "03_chop_3" true)
    (object_hide (cinematic_scripting_get_object 4 2 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 9 "super_sc03c_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "eyes" 0.1 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "timestamp" 0.4 0.0)
    (cinematic_scripting_start_screen_effect 4 2 2 0)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "status" 0.8 0.0)
    (sleep 2)
    (cinematic_scripting_start_effect 4 2 2 0 (cinematic_object_get "drone_fighter"))
    (sleep 18)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "timestamp" 0.5 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "eyes" 0.0 0.0)
    (sleep 8)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "timestamp" 0.4 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "timestamp" 0.5 0.0)
    (sleep 4)
    (cinematic_scripting_start_screen_effect 4 2 2 1)
    (sleep 4)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 4 2 9) "eyes" 0.6 0.0)
    (sleep 9)
    (fade_in 1.0 1.0 1.0 5)
    (cinematic_print "custom script play")
    (sleep 1)
    (cinematic_scripting_stop_screen_effect 4 2 2 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03chop_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 2) 3 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 2) 3)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 0 "dutch03_chop_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 1 "sc110_drone3c_4" true)
    (object_hide (cinematic_scripting_get_object 4 2 2) true)
    (object_hide (cinematic_scripting_get_object 4 2 3) true)
    (object_hide (cinematic_scripting_get_object 4 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 5 "hemet03_chop_4" true)
    (object_hide (cinematic_scripting_get_object 4 2 6) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 7 "03_chop_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 8 "sc110_03_chop_4" true)
    (object_hide (cinematic_scripting_get_object 4 2 9) true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 19)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03chop_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 2) 4 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 2) 4)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 0 "dutch03_chop_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 1 "sc110_drone3c_5" true)
    (object_hide (cinematic_scripting_get_object 4 2 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 3 "drone_ejection_03c_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 4 "drone_impact_03c_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 5 "hemet03_chop_5" true)
    (object_hide (cinematic_scripting_get_object 4 2 6) true)
    (object_hide (cinematic_scripting_get_object 4 2 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 8 "sc110_03_chop_5" true)
    (object_hide (cinematic_scripting_get_object 4 2 9) true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (cinematic_scripting_start_effect 4 2 4 0 (cinematic_object_get "fx_drone_impact"))
    (cinematic_scripting_start_effect 4 2 4 1 (cinematic_object_get "final_statue"))
    (sleep 2)
    (cinematic_scripting_start_effect 4 2 4 3 (cinematic_object_get "drone_fighter"))
    (cinematic_scripting_start_effect 4 2 4 2 (cinematic_object_get "drone_fighter"))
    (sleep 26)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_03chop_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 2) 5 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 2) 5)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (object_hide (cinematic_scripting_get_object 4 2 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 1 "sc110_drone3c_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 2 "optics_3c_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 3 "drone_ejection_03c_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 4 "drone_impact_03c_6" true)
    (object_hide (cinematic_scripting_get_object 4 2 5) true)
    (object_hide (cinematic_scripting_get_object 4 2 6) true)
    (object_hide (cinematic_scripting_get_object 4 2 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 8 "sc110_03_chop_6" true)
    (object_hide (cinematic_scripting_get_object 4 2 9) true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (cinematic_scripting_start_effect 4 2 5 0 (cinematic_object_get "drone_optics"))
    (cinematic_scripting_start_effect 4 2 5 1 (cinematic_object_get "drone_optics"))
    (sleep 130)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_03chop_sc
    (cinematic_print "beginning scene 3")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 2) 0)
    (sc110_out_sc_03chop_sc_sh1)
    (sc110_out_sc_03chop_sc_sh2)
    (sc110_out_sc_03chop_sc_sh3)
    (sc110_out_sc_03chop_sc_sh4)
    (sc110_out_sc_03chop_sc_sh5)
    (sc110_out_sc_03chop_sc_sh6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 4 2 0)
    (cinematic_scripting_destroy_object 4 2 1)
    (cinematic_scripting_destroy_object 4 2 2)
    (cinematic_scripting_destroy_object 4 2 3)
    (cinematic_scripting_destroy_object 4 2 4)
    (cinematic_scripting_destroy_object 4 2 5)
    (cinematic_scripting_destroy_object 4 2 6)
    (cinematic_scripting_destroy_object 4 2 7)
    (cinematic_scripting_destroy_object 4 2 8)
    (cinematic_scripting_destroy_object 4 2 9)
)

(script static void sc110_out_sc_04chop_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 3) 0 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 3) 0)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 0 "dutch04_chop_1" true)
    (object_hide (cinematic_scripting_get_object 4 3 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 2 "hemet04_chop_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 3 "cin_chopper04_1" true)
    (object_hide (cinematic_scripting_get_object 4 3 4) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 25)
    (cinematic_scripting_start_dialogue 4 3 0 0 (cinematic_scripting_get_object 4 3 0))
    (sleep 112)
    (cinematic_scripting_start_effect 4 3 0 1 (cinematic_object_get "chopper"))
    (begin
        (object_set_permutation (cinematic_object_get "chopper") "l_engine" "destroyed")
        (object_set_permutation (cinematic_object_get "chopper") "seat" "destroyed")
        (object_set_permutation (cinematic_object_get "chopper") "l_wheel" "destroyed")
        (object_set_permutation (cinematic_object_get "chopper") "r_wheel" "destroyed")
        (object_set_permutation (cinematic_object_get "chopper") "l_gun" "destroyed")
        (object_set_permutation (cinematic_object_get "chopper") "default" "destroyed")
    )
    (cinematic_print "custom script play")
    (cinematic_scripting_start_effect 4 3 0 3 (cinematic_object_get "chopper"))
    (cinematic_scripting_start_effect 4 3 0 0 (cinematic_object_get "chopper"))
    (cinematic_scripting_start_effect 4 3 0 2 (cinematic_object_get "chopper"))
    (sleep 113)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_04chop_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 3) 1 "cin_sc110_out_sc_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 3) 1)
    (cinematic_object_create_cinematic_anchor "cin_sc110_out_sc_anchor" "cin_sc110_out_sc_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 0 "dutch04_chop_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 1 "sc110_drone4c_2" true)
    (object_hide (cinematic_scripting_get_object 4 3 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 3 "cin_chopper04_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 4 "sc110_04_chop_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 43)
    (cinematic_scripting_start_dialogue 4 3 1 0 (cinematic_scripting_get_object 4 3 0))
    (sleep 24)
    (fade_out 0.0 0.0 0.0 60)
    (cinematic_print "custom script play")
    (sleep 60)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_sc_04chop_sc
    (cinematic_print "beginning scene 4")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 3) 0)
    (sc110_out_sc_04chop_sc_sh1)
    (sc110_out_sc_04chop_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 4 3 0)
    (cinematic_scripting_destroy_object 4 3 1)
    (cinematic_scripting_destroy_object 4 3 2)
    (cinematic_scripting_destroy_object 4 3 3)
    (cinematic_scripting_destroy_object 4 3 4)
)

(script static void sc110_out_sc_chop_cleanup
    (cinematic_scripting_clean_up 4)
)

(script static void begin_sc110_out_sc_chop_debug
    (cinematic_zone_activate_for_debugging 4)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 4))
)

(script static void end_sc110_out_sc_chop_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 4)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc110_out_sc_chop_debug
    (begin_sc110_out_sc_chop_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_out_sc_01c_sc)
    (!sc110_out_sc_02chop_sc)
    (!sc110_out_sc_03chop_sc)
    (!sc110_out_sc_04chop_sc)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sleep 60)
    )
    (end_sc110_out_sc_chop_debug)
)

(script static void begin_sc110_out_sc_chop
    (cinematic_zone_activate 4)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 4))
)

(script static void end_sc110_out_sc_chop
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_sc_chop
    (begin_sc110_out_sc_chop)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc110_out_sc_01c_sc)
    (!sc110_out_sc_02chop_sc)
    (!sc110_out_sc_03chop_sc)
    (!sc110_out_sc_04chop_sc)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sleep 60)
    )
    (end_sc110_out_sc_chop)
)

