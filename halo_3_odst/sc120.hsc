; Decompiled with Blamite
; Source file: sc120.hsc
; Start time: 4/7/2022 7:36:56
; Decompilation finished in ~0.0047681s
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
(global boolean g_sc120_music01 false)
(global boolean g_sc120_music015 false)
(global boolean g_sc120_music016 false)
(global boolean g_sc120_music02 false)
(global boolean g_sc120_music02_alt false)
(global boolean g_sc120_music03 false)
(global boolean g_sc120_music04 false)
(global boolean g_sc120_music04_alt false)
(global boolean g_sc120_music05 false)
(global boolean g_sc120_music05_alt false)
(global boolean g_sc120_music06 false)
(global ai ai_dutch none)
(global ai fem_marine none)
(global ai marine none)
(global ai mickey none)
(global boolean g_playing_dialogue false)
(global vehicle 030_scorpion_01 none)
(global boolean g_030_upper_prompt true)
(global short g_040_ambush 0)
(global boolean g_040_doors_open false)
(global boolean g_md_100_phantoms false)
(global boolean g_md_100_wraith_phantom false)
(global boolean g_md_100_wraith true)
(global boolean g_md_100_final false)
(global boolean editor false)
(global boolean g_play_cinematics true)
(global boolean g_player_training true)
(global boolean debug true)
(global boolean dialogue true)
(global boolean g_music true)
(global short g_insertion_index 0)
(global short g_030_lower_obj_control 0)
(global short g_030_mid_obj_control 0)
(global short g_030_upper_obj_control 0)
(global short g_040_obj_control 0)
(global short g_100_obj_control 0)
(global short g_030_wraith_03 0)
(global boolean g_phantom_close false)
(global boolean g_100_cleanup false)
(global short g_player_start_pitch -16)
(global boolean g_null false)
(global real g_nav_offset 0.55)
(global vehicle scorpion_01 none)
(global vehicle phantom_01 none)
(global vehicle phantom_02 none)
(global vehicle phantom_03 none)
(global boolean g_040_ambush_2_dutch false)
(global vehicle phantom_04 none)
(global vehicle phantom_05 none)
(global boolean g_100_place_04 false)
(global boolean g_100_midsave_01 false)
(global boolean g_100_midsave_02 false)
(global vehicle phantom_06 none)
(global vehicle phantom_07 none)
(global boolean g_100_cleanup_phantom false)
(global boolean g_level_end false)
(global boolean g_tv_sp_100 false)
(global boolean g_tv_sp_100_phantom false)
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

(script static void survival_scenario_new_wave
    (if 
        (and
            (= (survival_mode_current_wave_is_initial) false)
            (= (survival_mode_current_wave_is_boss) false)
        ) 
            (begin
                (print "randomizing phantom spawns")
                (if (= (random_range 0 3) 0) 
                    (begin
                        (print "**spawn from phantoms**")
                        (set s_sur_dropship_type 1)
                    ) (begin
                        (print "**spawn from closets**")
                        (set s_sur_dropship_type 0)
                    )
                )
            ) (begin
                (set s_sur_dropship_type 1)
            )
    )
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
    (kill_volume_enable "kill_sur_room_11")
    (kill_volume_enable "kill_sur_room_12")
    (kill_volume_enable "kill_sur_room_13")
    (kill_volume_enable "kill_sur_room_14")
    (kill_volume_enable "kill_sur_room_15")
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
    (kill_volume_disable "kill_sur_room_11")
    (kill_volume_disable "kill_sur_room_12")
    (kill_volume_disable "kill_sur_room_13")
    (kill_volume_disable "kill_sur_room_14")
    (kill_volume_disable "kill_sur_room_15")
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

(script startup void sc120_ambient_stub
    (if debug 
        (print "sc120 ambient stub"))
)

(script dormant void obj_scorpion_set
    (sleep (* 30.0 5.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "save marines and scorpion tank"))
    (f_new_intel "obj_new" "obj_1" 0 "fl_tank")
)

(script dormant void obj_scorpion_clear
    (sleep_until (> (ai_task_count "obj_030_lower_cov/gt_030_lower_cov") 0) 1)
    (sleep 30)
    (sleep_until 
        (or
            (>= g_030_mid_obj_control 1)
            (and
                (<= (ai_task_count "obj_030_lower_cov/gt_wraith") 0)
                (<= (ai_task_count "obj_030_lower_cov/gt_jackal") 2)
                (<= (ai_task_count "obj_030_lower_cov/gt_cov") 2)
            )
        ) 
    1)
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "save marines and scorpion tank"))
    (objectives_finish_up_to 0)
    (wake obj_drive_tank_set)
)

(script dormant void obj_drive_tank_set
    (sleep (* 30.0 5.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "drive tank to rally point"))
    (f_new_intel "obj_new" "obj_2" 1 "fl_tank")
)

(script dormant void obj_drive_tank_clear
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "drive tank to rally point"))
    (objectives_finish_up_to 1)
)

(script dormant void obj_dutch_set
    (sleep 30)
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "rescue dutch"))
    (f_new_intel "obj_new" "obj_3" 2 "fl_tank")
)

(script dormant void obj_dutch_clear
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "rescue dutch"))
    (objectives_finish_up_to 2)
)

(script dormant void obj_defend_rally_set
    (sleep (* 30.0 5.0))
    (if debug 
        (print "new objective set:"))
    (if debug 
        (print "help dutch defend the rally point"))
    (f_new_intel "obj_new" "obj_4" 3 "fl_tank")
)

(script dormant void obj_defend_rally_clear
    (sleep_until (> (ai_task_count "obj_100_cov_main/gt_100_cov_main") 0) 1)
    (sleep 30)
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_100_cov_main") 0) 1)
    (sleep 30)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "help dutch defend the rally point"))
    (objectives_finish_up_to 3)
)

(script dormant void player0_sc120_waypoints
    (f_sc120_waypoints player_00)
)

(script dormant void player1_sc120_waypoints
    (f_sc120_waypoints player_01)
)

(script dormant void player2_sc120_waypoints
    (f_sc120_waypoints player_02)
)

(script dormant void player3_sc120_waypoints
    (f_sc120_waypoints player_03)
)

(script static void f_sc120_waypoints (short player_name)
    (sleep_until 
        (begin
            (f_sleep_until_activate_waypoint player_name)
            (cond
                ((= s_waypoint_index 1)
                    (f_waypoint_activate_1 player_name "fl_tank")
                )
                ((= s_waypoint_index 2)
                    (f_waypoint_activate_1 player_name "fl_030_mid_in")
                )
                ((= s_waypoint_index 3)
                    (f_waypoint_activate_1 player_name "fl_030_mid_fill")
                )
                ((= s_waypoint_index 4)
                    (f_waypoint_activate_1 player_name "fl_030_upper_fill")
                )
                ((= s_waypoint_index 5)
                    (f_waypoint_activate_1 player_name "fl_040_fill")
                )
                ((= s_waypoint_index 6)
                    (f_waypoint_activate_1 player_name "fl_040_dutch")
                )
                ((= s_waypoint_index 7)
                    (f_waypoint_activate_1 player_name "fl_100_fill")
                )
                ((= s_waypoint_index 8)
                    (f_waypoint_activate_1 player_name "fl_100_end")
                )
            )
            false
        ) 
    1)
)

(script dormant void s_waypoint_index_2
    (sleep_until 
        (or
            (>= g_030_mid_obj_control 1)
            (= (unit_in_vehicle (player0)) true)
            (= (unit_in_vehicle (player1)) true)
            (= (unit_in_vehicle (player2)) true)
            (= (unit_in_vehicle (player3)) true)
        )
    )
    (set s_waypoint_index 2)
)

(script dormant void s_waypoint_index_4
    (sleep_until (>= g_030_upper_obj_control 1) 1)
    (set s_waypoint_index 4)
)

(script dormant void s_sc120_music01
    (sleep_until (= g_sc120_music01 true) 1)
    (if debug 
        (print "start sc120_music01"))
    (sound_looping_resume "levels\atlas\sc120\music\sc120_music01" none 1.0)
    (sleep_until (= g_sc120_music01 false) 1)
    (if debug 
        (print "stop sc120_music01"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music01")
)

(script dormant void s_sc120_music015
    (sleep_until (= g_sc120_music015 true) 1)
    (sleep (* 30.0 5.0))
    (if debug 
        (print "start sc120_music015"))
    (sound_looping_resume "levels\atlas\sc120\music\sc120_music015" none 1.0)
    (sleep_until (= g_sc120_music015 false) 1)
    (if debug 
        (print "stop sc120_music015"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music015")
)

(script dormant void s_sc120_music016
    (sleep_until (= g_sc120_music016 true) 1)
    (sleep (* 30.0 15.0))
    (if debug 
        (print "start sc120_music016"))
    (sound_looping_resume "levels\atlas\sc120\music\sc120_music016" none 1.0)
    (sleep_until (= g_sc120_music016 false) 1)
    (if debug 
        (print "stop sc120_music016"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music016")
)

(script dormant void s_sc120_music02
    (sleep_until (= g_sc120_music02 true) 1)
    (if debug 
        (print "start sc120_music02"))
    (sound_looping_start "levels\atlas\sc120\music\sc120_music02" none 1.0)
    (sleep_until (= g_sc120_music02 false) 1)
    (if debug 
        (print "stop sc120_music02"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music02")
)

(script dormant void s_sc120_music02_alt
    (sleep_until (= g_sc120_music02_alt true) 1)
    (sound_looping_set_alternate "levels\atlas\sc120\music\sc120_music02" true)
    (if debug 
        (print "stop sc120_music02_alt"))
)

(script dormant void s_sc120_music03
    (sleep_until (= g_sc120_music03 true) 1)
    (if debug 
        (print "start sc120_music03"))
    (sound_looping_start "levels\atlas\sc120\music\sc120_music03" none 1.0)
    (sleep_until (= g_sc120_music03 false) 1)
    (if debug 
        (print "stop sc120_music03"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music03")
)

(script dormant void s_sc120_music04
    (sleep_until (= g_sc120_music04 true) 1)
    (if debug 
        (print "start sc120_music04"))
    (sound_looping_start "levels\atlas\sc120\music\sc120_music04" none 1.0)
    (sleep_until 
        (or
            (>= g_040_obj_control 2)
            (= g_sc120_music04 false)
        ) 
    1)
    (sleep_until 
        (or
            (>= g_100_obj_control 1)
            (<= (ai_task_count "obj_040_cov/gt_wraith") 0)
            (= g_sc120_music04 false)
        ) 
    1)
    (if debug 
        (print "stop sc120_music04"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music04")
)

(script dormant void s_sc120_music04_alt
    (sleep_until (= g_sc120_music04_alt true) 1)
    (sound_looping_set_alternate "levels\atlas\sc120\music\sc120_music04" true)
    (if debug 
        (print "stop sc120_music04_alt"))
)

(script dormant void s_sc120_music05
    (sleep_until (= g_sc120_music05 true) 1)
    (if debug 
        (print "start sc120_music05"))
    (sound_looping_start "levels\atlas\sc120\music\sc120_music05" none 1.0)
    (sleep_until (= g_sc120_music05 false) 1)
    (if debug 
        (print "stop sc120_music05"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music05")
)

(script dormant void s_sc120_music05_alt
    (sleep_until (= g_sc120_music05_alt true) 1)
    (sound_looping_set_alternate "levels\atlas\sc120\music\sc120_music05" true)
    (if debug 
        (print "stop sc120_music05_alt"))
)

(script dormant void s_sc120_music06
    (sleep_until (= g_sc120_music06 true) 1)
    (if debug 
        (print "start sc120_music06"))
    (sound_looping_start "levels\atlas\sc120\music\sc120_music06" none 1.0)
    (sleep_until (= g_sc120_music06 false) 1)
    (if debug 
        (print "stop sc120_music06"))
    (sound_looping_stop "levels\atlas\sc120\music\sc120_music06")
)

(script dormant void sc120_player_dialogue_check
    (sleep_until 
        (and
            (<= (object_get_health (player0)) 0.0)
            (<= (object_get_health (player1)) 0.0)
            (<= (object_get_health (player2)) 0.0)
            (<= (object_get_health (player3)) 0.0)
        ) 
    5)
    (sound_impulse_stop "sound\dialog\atlas\sc120\mission\sc120_0100_mic")
    (sound_impulse_stop "sound\dialog\atlas\sc120\mission\sc120_0405_mic")
    (sound_impulse_stop "sound\dialog\atlas\sc120\mission\sc120_0440_mic")
)

(script dormant void md_030_lower_prompt_01
    (set 030_scorpion_01 (ai_vehicle_get_from_starting_location "sq_030_scorpion_01/scorpion"))
    (sleep_until (>= g_030_lower_obj_control 3) 1)
    (sleep (* 30.0 3.0))
    (vs_cast "gr_030_allies" true 10 "sc120_0040")
    (set marine (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_030_allies" true)
    (vs_enable_looking "gr_030_allies" true)
    (vs_enable_targeting "gr_030_allies" true)
    (vs_enable_moving "gr_030_allies" true)
    (if (not 
        (or
            (vehicle_test_seat_unit 030_scorpion_01 none (player0))
            (vehicle_test_seat_unit 030_scorpion_01 none (player1))
            (vehicle_test_seat_unit 030_scorpion_01 none (player2))
            (vehicle_test_seat_unit 030_scorpion_01 none (player3))
            (vehicle_test_seat_unit "030_scorpion_02" none (player0))
            (vehicle_test_seat_unit "030_scorpion_02" none (player1))
            (vehicle_test_seat_unit "030_scorpion_02" none (player2))
            (vehicle_test_seat_unit "030_scorpion_02" none (player3))
        )
    ) 
        (begin
            (sleep_until (not g_playing_dialogue) 1)
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine: get to the scorpion tank, trooper! before the wraith takes it out!"))
            (vs_play_line marine true sc120_0040)
            (set g_playing_dialogue false)
        )
    )
    (sleep (* 30.0 10.0))
    (if (not 
        (or
            (vehicle_test_seat_unit 030_scorpion_01 none (player0))
            (vehicle_test_seat_unit 030_scorpion_01 none (player1))
            (vehicle_test_seat_unit 030_scorpion_01 none (player2))
            (vehicle_test_seat_unit 030_scorpion_01 none (player3))
            (vehicle_test_seat_unit "030_scorpion_02" none (player0))
            (vehicle_test_seat_unit "030_scorpion_02" none (player1))
            (vehicle_test_seat_unit "030_scorpion_02" none (player2))
            (vehicle_test_seat_unit "030_scorpion_02" none (player3))
        )
    ) 
        (begin
            (sleep_until (not g_playing_dialogue) 1)
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine: come on, trooper! don't let the wraith kill our tank!"))
            (vs_play_line marine true sc120_0045)
            (set g_playing_dialogue false)
        )
    )
    (sleep (* 30.0 10.0))
    (if 
        (and
            (not 
                (or
                    (vehicle_test_seat_unit 030_scorpion_01 none (player0))
                    (vehicle_test_seat_unit 030_scorpion_01 none (player1))
                    (vehicle_test_seat_unit 030_scorpion_01 none (player2))
                    (vehicle_test_seat_unit 030_scorpion_01 none (player3))
                    (vehicle_test_seat_unit "030_scorpion_02" none (player0))
                    (vehicle_test_seat_unit "030_scorpion_02" none (player1))
                    (vehicle_test_seat_unit "030_scorpion_02" none (player2))
                    (vehicle_test_seat_unit "030_scorpion_02" none (player3))
                )
            )
            (< g_030_mid_obj_control 2)
        ) 
            (begin
                (sleep_until (not g_playing_dialogue) 1)
                (set g_playing_dialogue true)
                (if dialogue 
                    (print "marine: trooper! get in the tank and start shooting  -- or we're screwed!"))
                (vs_play_line marine true sc120_0046)
                (set g_playing_dialogue false)
            )
    )
    (vs_release_all)
)

(script dormant void md_030_lower_prompt_02
    (sleep_until 
        (or
            (vehicle_test_seat_unit 030_scorpion_01 none (player0))
            (vehicle_test_seat_unit 030_scorpion_01 none (player1))
            (vehicle_test_seat_unit 030_scorpion_01 none (player2))
            (vehicle_test_seat_unit 030_scorpion_01 none (player3))
            (vehicle_test_seat_unit "030_scorpion_02" none (player0))
            (vehicle_test_seat_unit "030_scorpion_02" none (player1))
            (vehicle_test_seat_unit "030_scorpion_02" none (player2))
            (vehicle_test_seat_unit "030_scorpion_02" none (player3))
        ) 
    1)
    (sleep (* 30.0 5.0))
    (if (> (ai_task_count "obj_030_lower_cov/gt_wraith") 2) 
        (begin
            (vs_cast "gr_030_allies" true 10 "sc120_0040")
            (set marine (vs_role 1))
            (vs_enable_pathfinding_failsafe "gr_030_allies" true)
            (vs_enable_looking "gr_030_allies" true)
            (vs_enable_targeting "gr_030_allies" true)
            (vs_enable_moving "gr_030_allies" true)
            (sleep 1)
            (sleep_until (not g_playing_dialogue) 5)
            (set g_playing_dialogue true)
            (if dialogue 
                (print "marine: these wraiths are killing us! knock 'em dead!"))
            (vs_play_line marine true sc120_0050)
            (set g_playing_dialogue false)
        )
    )
    (if 
        (and
            (> (ai_task_count "obj_030_lower_cov/gt_wraith") 0)
            (<= (ai_task_count "obj_030_lower_cov/gt_wraith") 2)
        ) 
            (begin
                (sleep_until (not g_playing_dialogue) 5)
                (set g_playing_dialogue true)
                (if dialogue 
                    (print "marine: that wraith is killing us! blow it to pieces!"))
                (vs_play_line marine true sc120_0060)
                (set g_playing_dialogue false)
            )
    )
    (vs_release_all)
)

(script dormant void md_030_lower_end
    (sleep_until (> (ai_task_count "obj_030_lower_cov/gt_030_lower_cov") 0) 1)
    (sleep 30)
    (sleep_until 
        (or
            (>= g_030_mid_obj_control 1)
            (and
                (<= (ai_task_count "obj_030_lower_cov/gt_wraith") 0)
                (<= (ai_task_count "obj_030_lower_cov/gt_jackal") 2)
                (<= (ai_task_count "obj_030_lower_cov/gt_cov") 2)
            )
        ) 
    1)
    (sleep (* 30.0 (random_range 2 5)))
    (sleep_until (not g_playing_dialogue) 1)
    (set g_playing_dialogue true)
    (ai_player_dialogue_enable false)
    (if dialogue 
        (print "marine (radio): good work, trooper! (pause) covenant's been rolling us back, block by block."))
    (sleep (ai_play_line_on_object none sc120_0070))
    (sleep 10)
    (if dialogue 
        (print "marine (radio): every marine in the city is pulling-back to a rally point near the naval intelligence building. you outta come with us!"))
    (sleep (ai_play_line_on_object none sc120_0090))
    (sleep 10)
    (if dialogue 
        (print "mickey (helmet): sure. as long as i get to drive the tank!"))
    (sound_impulse_start "sound\dialog\atlas\sc120\mission\sc120_0100_mic" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc120\mission\sc120_0100_mic"))
    (ai_player_dialogue_enable true)
    (set g_playing_dialogue false)
    (set g_sc120_music03 true)
    (set g_sc120_music02 true)
    (set g_sc120_music01 false)
    (set g_sc120_music015 false)
    (set g_sc120_music016 false)
)

(script dormant void md_030_mid_intro
    (sleep_until 
        (and
            (>= g_030_mid_obj_control 4)
            (= g_playing_dialogue false)
        ) 
    1)
    (set g_playing_dialogue true)
    (if dialogue 
        (print "marine (radio): we got a squad of marines pinned-down! far corner of the next plaza!"))
    (sleep (ai_play_line_on_object none sc120_0130))
    (sleep 10)
    (if dialogue 
        (print "marine (radio): it's packed with covenant, trooper, so once you commit: don't stop moving!"))
    (sleep (ai_play_line_on_object none sc120_0140))
    (set g_playing_dialogue false)
)

(script dormant void md_030_mid_end
    (sleep_until 
        (and
            (>= g_030_mid_obj_control 5)
            (<= (ai_task_count "obj_030_mid_cov/gt_phantom_02") 0)
            (<= (ai_task_count "obj_030_mid_cov/gt_watchtower") 0)
            (<= (ai_task_count "obj_030_mid_cov/gt_shade") 0)
            (<= (ai_task_count "obj_030_mid_cov/gt_cov") 3)
            (volume_test_players "tv_030_mid_end")
        ) 
    1)
    (sleep (* 30.0 (random_range 2 5)))
    (if 
        (or
            (vehicle_test_seat_unit 030_scorpion_01 none (player0))
            (vehicle_test_seat_unit 030_scorpion_01 none (player1))
            (vehicle_test_seat_unit 030_scorpion_01 none (player2))
            (vehicle_test_seat_unit 030_scorpion_01 none (player3))
            (vehicle_test_seat_unit "030_scorpion_02" none (player0))
            (vehicle_test_seat_unit "030_scorpion_02" none (player1))
            (vehicle_test_seat_unit "030_scorpion_02" none (player2))
            (vehicle_test_seat_unit "030_scorpion_02" none (player3))
            (vehicle_test_seat_unit "030_scorpion_04" none (player0))
            (vehicle_test_seat_unit "030_scorpion_04" none (player1))
            (vehicle_test_seat_unit "030_scorpion_04" none (player2))
            (vehicle_test_seat_unit "030_scorpion_04" none (player3))
        ) 
            (begin
                (if dialogue 
                    (print "marine (radio): everyone pile on! we're pushing to the rally-point!"))
                (sleep (ai_play_line_on_object none sc120_0150))
                (sleep 10)
                (if dialogue 
                    (print "fem. (radio): i spotted a whole column of hostile armor, headed in that direction!"))
                (sleep (ai_play_line_on_object none sc120_0160))
                (sleep 10)
                (if dialogue 
                    (print "marine (radio): don't worry! this odst we got? he's an artist with high explosives!"))
                (sleep (ai_play_line_on_object none sc120_0170))
                (set g_sc120_music01 false)
                (set g_sc120_music02 false)
                (set g_sc120_music03 false)
                (set s_waypoint_index 4)
            )
    )
)

(script dormant void md_030_upper_prompt_01
    (sleep_until (> (ai_task_count "obj_030_upper_cov/gt_phantom_03_grunt") 0) 1)
    (sleep (* 30.0 20.0))
    (begin_random
        (if 
            (and
                (> (ai_task_count "obj_030_upper_cov/gt_phantom_03_grunt") 0)
                (= g_030_upper_prompt true)
                (= g_040_obj_control 0)
            ) 
                (begin
                    (if dialogue 
                        (print "fem. (radio): fuel-rod cannon! up high!"))
                    (sleep (ai_play_line_on_object none sc120_0180))
                    (set g_030_upper_prompt false)
                )
        )
        (if 
            (and
                (> (ai_task_count "obj_030_upper_cov/gt_phantom_03_jackal_snipers") 0)
                (= g_030_upper_prompt true)
                (= g_040_obj_control 0)
            ) 
                (begin
                    (if dialogue 
                        (print "fem. (radio): snipers! watch those rooftops!"))
                    (sleep (ai_play_line_on_object none sc120_0190))
                    (set g_030_upper_prompt false)
                )
        )
    )
    (vs_release_all)
)

(script dormant void md_030_upper_prompt_02
    (sleep_until (> (ai_task_count "obj_030_upper_cov/gt_030_upper_cov") 0) 1)
    (sleep 30)
    (sleep_until 
        (or
            (and
                (<= (ai_task_count "obj_030_upper_cov/gt_030_upper_cov") 5)
                (<= (ai_task_count "obj_030_upper_cov/gt_phantom_03_ghost") 0)
                (<= (ai_task_count "obj_030_upper_cov/gt_phantom_03_brute") 0)
                (<= (ai_task_count "obj_030_upper_cov/gt_phantom_03_grunt") 0)
                (<= (ai_task_count "obj_030_upper_cov/gt_shade") 0)
                (<= (ai_task_count "obj_030_upper_cov/gt_turret") 0)
            )
            (volume_test_players "tv_030_upper_exit")
        ) 
    1)
    (set g_sc120_music04 true)
    (if (< g_030_upper_obj_control 4) 
        (begin
            (if dialogue 
                (print "fem. (radio): trooper! head through the security door to kizingo boulevard -- fastest way to the rally-point!"))
            (sleep (ai_play_line_on_object none sc120_0200))
            (set g_030_upper_prompt false)
            (sleep 10)
            (wake md_030_upper_prompt_03)
        )
    )
)

(script dormant void md_030_upper_prompt_03
    (if (< g_030_upper_obj_control 4) 
        (begin
            (sleep (* 30.0 (random_range 1 3)))
            (if dialogue 
                (print "fem_marine (radio): placing a beacon on the door! let's move, trooper!"))
            (sleep (ai_play_line_on_object none sc120_0220))
            (wake 040_exit)
        )
    )
    (sleep (* 30.0 10.0))
    (sleep_until (volume_test_players "tv_030_upper_exit") 1)
    (if (< g_030_upper_obj_control 4) 
        (begin
            (if dialogue 
                (print "fem_marine (radio): trooper! door's unlocked! roll on through!"))
            (sleep (ai_play_line_on_object none sc120_0230))
            (set g_sc120_music04_alt true)
        )
    )
    (vs_release_all)
)

(script dormant void md_040_ambush_01
    (sleep_until (>= g_040_obj_control 1) 1)
    (set g_playing_dialogue true)
    (if (> (ai_task_count "obj_040_allies/gt_allies_03") 0) 
        (begin
            (if dialogue 
                (print "marine (radio): gauss turret's hot! ready to fire!"))
            (sleep (ai_play_line_on_object none sc120_0240))
            (sleep 5)
        )
    )
    (set g_040_ambush 1)
    (if (> (ai_task_count "obj_040_allies/gt_allies_03") 0) 
        (begin
            (if dialogue 
                (print "dutch (radio): relax marineï¿½wait until they're in the kill-zone."))
            (sleep (ai_play_line_on_object none sc120_0250))
            (sleep 5)
        )
    )
    (if (> (ai_task_count "obj_040_allies/gt_allies_03") 0) 
        (begin
            (if dialogue 
                (print "marine (radio): ghosts! they'll see me for sure! i gotta take the shot!"))
            (sleep (ai_play_line_on_object none sc120_0260))
            (sleep 5)
        )
    )
    (wake 040_ambush)
    (if (> (ai_task_count "obj_040_allies/gt_allies_03") 0) 
        (begin
            (if dialogue 
                (print "dutch (radio): i said hold your fire! concentrate on the wraith at the end of the --"))
            (sleep (ai_play_line_on_object none sc120_0270))
            (sleep 5)
        )
    )
    (if (> (ai_task_count "obj_040_allies/gt_allies_03") 0) 
        (begin
            (if dialogue 
                (print "dutch (radio): aw, hell...backblast clear! let 'em have it!"))
            (sleep (ai_play_line_on_object none sc120_0280))
        )
    )
    (set g_playing_dialogue false)
)

(script dormant void md_040_ambush_02
    (vs_cast "gr_030_allies" true 10 "sc120_0290")
    (set fem_marine (vs_role 1))
    (vs_enable_pathfinding_failsafe "gr_030_allies" true)
    (vs_enable_looking "gr_030_allies" true)
    (vs_enable_targeting "gr_030_allies" true)
    (vs_enable_moving "gr_030_allies" true)
    (sleep 1)
    (if dialogue 
        (print "fem_marine: they're hitting the armored column! give 'em a hand!"))
    (vs_play_line fem_marine true sc120_0290)
    (vs_release_all)
)

(script dormant void md_040_ambush_end_02
    (sleep_until 
        (and
            (>= g_040_obj_control 6)
            (= g_playing_dialogue false)
        ) 
    1)
    (set ai_dutch "sq_dutch/odst")
    (if (> (ai_task_count "obj_040_cov/gt_wraith") 0) 
        (begin
            (unit_add_equipment "sq_dutch" "profile_dutch" true true)
            (set g_playing_dialogue true)
            (if dialogue 
                (print "mickey (radio): dutch?! what are you doing up there?"))
            (sleep (ai_play_line_on_object none sc120_0300))
            (sleep 10)
            (if dialogue 
                (print "dutch (radio): i'm out of rockets! kill that wraith!"))
            (sleep (ai_play_line_on_object none sc120_0330))
            (set g_playing_dialogue false)
            (sleep (* 30.0 8.0))
        )
    )
    (sleep_until (= g_playing_dialogue false) 1)
    (if (> (ai_task_count "obj_040_cov/gt_wraith") 0) 
        (begin
            (set g_playing_dialogue true)
            (if dialogue 
                (print "dutch (radio): mickey! shoot the wraith, for god's sake!"))
            (sleep (ai_play_line_on_object none sc120_0340))
            (set g_playing_dialogue false)
        )
    )
    (wake md_040_prompt)
    (vs_release_all)
)

(script dormant void md_040_prompt
    (sleep_until 
        (and
            (>= g_040_obj_control 7)
            (<= (ai_task_count "obj_040_cov/gt_040_cov") 3)
        ) 
    1)
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (or
                (= (unit_in_vehicle (player0)) true)
                (= (unit_in_vehicle (player1)) true)
                (= (unit_in_vehicle (player2)) true)
                (= (unit_in_vehicle (player3)) true)
            )
        ) 
    1)
    (if (< g_040_obj_control 8) 
        (begin
            (sleep 90)
            (set g_playing_dialogue true)
            (if dialogue 
                (print "dutch (radio): ok. dismount, hoof it to my position!"))
            (sleep (ai_play_line_on_object none sc120_0350))
            (set g_playing_dialogue false)
            (sleep (* 30.0 12.0))
        )
    )
    (sleep_until 
        (and
            (= g_playing_dialogue false)
            (or
                (= (unit_in_vehicle (player0)) true)
                (= (unit_in_vehicle (player1)) true)
                (= (unit_in_vehicle (player2)) true)
                (= (unit_in_vehicle (player3)) true)
            )
        ) 
    1)
    (if (< g_040_obj_control 8) 
        (begin
            (sleep 90)
            (set g_playing_dialogue true)
            (if dialogue 
                (print "dutch (radio): no way to drive through those barriers, mickey! leave the tank!"))
            (sleep (ai_play_line_on_object none sc120_0360))
            (set g_playing_dialogue false)
        )
    )
)

(script dormant void md_040_doors_open
    (sleep_until (>= g_040_obj_control 8) 1)
    (vs_enable_pathfinding_failsafe ai_dutch true)
    (vs_enable_looking ai_dutch true)
    (vs_enable_targeting ai_dutch true)
    (vs_enable_moving ai_dutch true)
    (sleep 1)
    (if dialogue 
        (print "dutch 01 (radio): mickey! over here!"))
    (sleep (ai_play_line ai_dutch sc120_0370))
    (sleep_until (= g_040_doors_open true) 1)
    (if dialogue 
        (print "dutch 02 (radio): aw crap! watch the door!"))
    (sleep (ai_play_line ai_dutch sc120_0390))
    (vs_release_all)
)

(script dormant void md_100_combat_end
    (sleep_until (> (ai_task_count "obj_100_cov_start/gt_100_cov_start") 0) 1)
    (sleep 30)
    (sleep_until 
        (and
            (= (ai_task_count "obj_100_cov_start/gt_100_cov_start") 0)
            (= (ai_task_count "obj_040_cov/gt_040_transition_100") 0)
        ) 
    1)
    (sleep 60)
    (vs_enable_pathfinding_failsafe ai_dutch true)
    (vs_enable_looking ai_dutch true)
    (vs_enable_targeting ai_dutch true)
    (vs_enable_moving ai_dutch true)
    (ai_player_dialogue_enable false)
    (if dialogue 
        (print "dutch (radio): those covenant dropped-in behind us! they must know this is our rally-point!"))
    (sleep (ai_play_line ai_dutch sc120_0400))
    (if (not (volume_test_object "tv_100_total" (ai_get_object "sq_dutch/odst"))) 
        (ai_bring_forward ai_dutch 5.0))
    (sleep 10)
    (if dialogue 
        (print "mickey (radio): terrific…"))
    (sound_impulse_start "sound\dialog\atlas\sc120\mission\sc120_0405_mic" none 1.0)
    (sleep (sound_impulse_language_time "sound\dialog\atlas\sc120\mission\sc120_0405_mic"))
    (if dialogue 
        (print "dutch (radio): follow me! we've got ammo and weapons on the high ground!"))
    (sleep (ai_play_line ai_dutch sc120_0410))
    (wake obj_defend_rally_set)
    (wake obj_defend_rally_clear)
    (ai_player_dialogue_enable true)
    (vs_release_all)
)

(script dormant void md_100_phantoms
    (sleep_until (= g_md_100_phantoms true) 1)
    (sleep 30)
    (vs_enable_pathfinding_failsafe ai_dutch true)
    (vs_enable_looking ai_dutch true)
    (vs_enable_targeting ai_dutch true)
    (vs_enable_moving ai_dutch true)
    (sleep 1)
    (if dialogue 
        (print "dutch (radio): phantoms! everyone find some cover!"))
    (sleep (ai_play_line ai_dutch sc120_0420))
    (vs_release_all)
)

(script dormant void md_100_flank
    (vs_enable_pathfinding_failsafe ai_dutch true)
    (vs_enable_looking ai_dutch true)
    (vs_enable_targeting ai_dutch true)
    (vs_enable_moving ai_dutch true)
    (sleep 1)
    (if dialogue 
        (print "dutch (radio): kill those runners, mickey! they're trying to flank us!"))
    (sleep (ai_play_line ai_dutch sc120_0430))
    (vs_release_all)
)

(script dormant void md_100_wraith
    (sleep_until (= g_md_100_wraith_phantom true) 1)
    (sleep (random_range (* 30.0 3.0) (* 30.0 10.0)))
    (if (> (ai_task_count "obj_100_cov_main/gt_wraith") 0) 
        (begin
            (vs_enable_pathfinding_failsafe ai_dutch true)
            (vs_enable_looking ai_dutch true)
            (vs_enable_targeting ai_dutch true)
            (vs_enable_moving ai_dutch true)
            (ai_player_dialogue_enable false)
            (sleep 1)
            (if dialogue 
                (print "mickey (radio): we got any heavy weapons for that wraith?!"))
            (sound_impulse_start "sound\dialog\atlas\sc120\mission\sc120_0440_mic" none 1.0)
            (sleep (sound_impulse_language_time "sound\dialog\atlas\sc120\mission\sc120_0440_mic"))
            (sleep 10)
            (begin_random
                (if (= g_md_100_wraith true) 
                    (begin
                        (if dialogue 
                            (print "dutch (radio): negative! i'll draw it's fire, you try and board it!"))
                        (sleep (ai_play_line ai_dutch sc120_0450))
                        (set g_md_100_wraith false)
                    )
                )
                (if (= g_md_100_wraith true) 
                    (begin
                        (if dialogue 
                            (print "dutch (radio): negative! use overcharged plasma and grenades! i'll draw it's fire!"))
                        (sleep (ai_play_line ai_dutch sc120_0460))
                        (set g_md_100_wraith false)
                    )
                )
            )
        )
    )
    (set g_sc120_music05 true)
    (sleep (* 30.0 10.0))
    (wake md_100_flank)
    (ai_player_dialogue_enable true)
    (vs_release_all)
)

(script dormant void md_100_prompt
    (sleep_until (= g_100_cleanup true) 1)
    (vs_enable_pathfinding_failsafe ai_dutch true)
    (vs_enable_looking ai_dutch true)
    (vs_enable_targeting ai_dutch true)
    (vs_enable_moving ai_dutch true)
    (sleep 1)
    (if dialogue 
        (print "dutch (radio): keep it up, mickey! we almost got 'em beat!"))
    (sleep (ai_play_line ai_dutch sc120_0470))
    (vs_release_all)
)

(script dormant void md_100_final
    (sleep_until (= g_md_100_final true) 1)
    (sleep 30)
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_100_cov_main") 0) 1)
    (vs_enable_pathfinding_failsafe ai_dutch true)
    (vs_enable_looking ai_dutch true)
    (vs_enable_targeting ai_dutch true)
    (vs_enable_moving ai_dutch true)
    (sleep 60)
    (if dialogue 
        (print "dutch (radio): that's all of 'em! way to go, mickey!"))
    (sleep (ai_play_line ai_dutch sc120_0480))
    (sleep 10)
    (set g_sc120_music05 false)
    (set g_sc120_music06 true)
    (if dialogue 
        (print "dutch (radio): come to my position!"))
    (sleep (ai_play_line ai_dutch sc120_0490))
    (set s_waypoint_index 8)
    (vs_release_all)
)

(script static boolean obj_0wrait_0_6
    (< g_030_lower_obj_control 3)
)

(script static boolean obj_0cov_0_0_10
    (< g_030_lower_obj_control 2)
)

(script static boolean obj_0cov_0_0_12
    (< g_030_lower_obj_control 2)
)

(script static boolean obj_0cov_0_0_14
    (< g_030_lower_obj_control 1)
)

(script static boolean obj_0jacka_0_15
    (< g_030_lower_obj_control 1)
)

(script static boolean obj_0jacka_0_16
    (< g_030_lower_obj_control 2)
)

(script static boolean obj_0wrait_0_18
    (= g_030_wraith_03 0)
)

(script static boolean obj_0wrait_0_32
    (< g_030_lower_obj_control 3)
)

(script static boolean obj_0wrait_0_34
    (< g_030_lower_obj_control 1)
)

(script static boolean obj_0wrait_0_36
    (volume_test_players "tv_030_lower_00")
)

(script static boolean obj_0cov_0_0_37
    (>= g_030_lower_obj_control 3)
)

(script static boolean obj_0wrait_0_38
    (volume_test_players "tv_030_lower_00")
)

(script static boolean obj_0allie_1_3
    (< g_030_lower_obj_control 2)
)

(script static boolean obj_0allie_1_5
    (< g_030_lower_obj_control 3)
)

(script static boolean obj_0allie_1_6
    (and
        (< g_030_lower_obj_control 3)
        (> (ai_task_count "obj_030_lower_cov/gt_cov_01") 0)
    )
)

(script static boolean obj_0allie_1_11
    (< g_030_lower_obj_control 2)
)

(script static boolean obj_0brute_2_13
    (< g_030_mid_obj_control 3)
)

(script static boolean obj_0allie_3_1
    (>= g_030_mid_obj_control 5)
)

(script static boolean obj_0wrait_4_9
    (< g_030_upper_obj_control 2)
)

(script static boolean obj_0wrait_4_10
    (> (ai_task_count "obj_030_upper_cov/gt_wraith") 2)
)

(script static boolean obj_0wrait_4_11
    (> (ai_task_count "obj_030_upper_cov/gt_wraith") 2)
)

(script static boolean obj_0wrait_4_12
    (<= (ai_task_count "obj_030_upper_cov/gt_wraith") 2)
)

(script static boolean obj_0cov_s_4_22
    (< g_030_upper_obj_control 2)
)

(script static boolean obj_0ghost_4_29
    (< g_030_upper_obj_control 2)
)

(script static boolean obj_0cov_f_4_33
    (volume_test_players "tv_030_roundabout_left")
)

(script static boolean obj_0cov_f_4_34
    (volume_test_players "tv_030_roundabout_right")
)

(script static boolean obj_0cov_f_4_35
    (< g_030_upper_obj_control 2)
)

(script static boolean obj_0cov_0_5_8
    (< g_040_obj_control 4)
)

(script static boolean obj_0acov__5_9
    (>= g_040_obj_control 4)
)

(script static boolean obj_0cov_b_5_10
    (>= g_040_obj_control 4)
)

(script static boolean obj_0jacka_5_14
    (< g_040_obj_control 4)
)

(script static boolean obj_0playe_5_15
    (>= g_040_obj_control 4)
)

(script static boolean obj_0playe_5_16
    (>= g_040_obj_control 6)
)

(script static boolean obj_0door__5_17
    (< g_040_obj_control 6)
)

(script static boolean obj_0door__5_18
    (< g_040_obj_control 4)
)

(script static boolean obj_0turre_5_21
    (< g_040_obj_control 5)
)

(script static boolean obj_0cov_0_5_23
    (<= g_040_ambush 1)
)

(script static boolean obj_0cov_0_5_24
    (= g_040_obj_control 0)
)

(script static boolean obj_0grunt_5_26
    (< g_040_obj_control 3)
)

(script static boolean obj_0cov_b_5_27
    (or
        (>= g_040_obj_control 3)
        (>= g_040_ambush 2)
    )
)

(script static boolean obj_0phant_5_36
    (>= g_040_obj_control 6)
)

(script static boolean obj_0phant_5_39
    (>= g_040_obj_control 6)
)

(script static boolean obj_0phant_5_40
    (>= g_040_obj_control 6)
)

(script static boolean obj_0final_5_44
    (>= g_040_obj_control 6)
)

(script static boolean obj_0final_5_47
    (>= (ai_task_count "obj_040_cov/gt_040_transition_100") 4)
)

(script static boolean obj_0final_5_50
    (>= (ai_task_count "obj_040_cov/gt_040_transition_100") 4)
)

(script static boolean obj_0final_5_52
    (>= (ai_task_count "obj_040_cov/gt_040_transition_100") 4)
)

(script static boolean obj_0final_5_62
    (and
        (>= g_040_obj_control 8)
        (<= (ai_task_count "obj_040_cov/gt_040_transition_100") 6)
    )
)

(script static boolean obj_0wrait_5_66
    (< g_040_ambush 3)
)

(script static boolean obj_0gauss_5_67
    (= g_040_ambush 3)
)

(script static boolean obj_0gauss_5_68
    (= g_040_ambush 3)
)

(script static boolean obj_0ghost_5_69
    (= g_040_ambush 0)
)

(script static boolean obj_0ghost_5_70
    (= g_040_ambush 0)
)

(script static boolean obj_0cov_0_5_71
    (< g_040_obj_control 2)
)

(script static boolean obj_0final_5_73
    (>= g_100_obj_control 2)
)

(script static boolean obj_0bansh_5_74
    (>= g_040_obj_control 7)
)

(script static boolean obj_0allie_6_3
    (< g_040_obj_control 3)
)

(script static boolean obj_0dutch_6_6
    (= g_040_ambush_2_dutch true)
)

(script static boolean obj_0dutch_6_7
    (or
        (> g_040_ambush 3)
        (= (ai_task_count "obj_040_cov/gt_ghost_ambush_02") 0)
    )
)

(script static boolean obj_0turre_6_9
    (>= g_040_ambush 2)
)

(script static boolean obj_0dutch_6_11
    (>= g_100_obj_control 2)
)

(script static boolean obj_0dutch_6_12
    (>= g_040_obj_control 7)
)

(script static boolean obj_0dutch_6_13
    (>= g_040_obj_control 8)
)

(script static boolean obj_0dutch_6_14
    (>= g_100_obj_control 1)
)

(script static boolean obj_0turre_6_15
    (and
        (= (ai_task_count "obj_040_cov/gt_ghost_ambush_01") 0)
        (= (ai_task_count "obj_040_cov/gt_ghost_ambush_02") 0)
    )
)

(script static boolean obj_1cov_a_7_3
    (>= g_100_obj_control 2)
)

(script static boolean obj_1cov_a_7_4
    (>= g_100_obj_control 3)
)

(script static boolean obj_1jacka_7_8
    (>= g_100_obj_control 2)
)

(script static boolean obj_1gt_ma_8_11
    (= (ai_task_count "obj_100_cov_start/gt_100_cov_start") 0)
)

(script static boolean obj_1allie_8_13
    (>= g_100_obj_control 3)
)

(script static boolean obj_1allie_8_14
    (>= g_100_obj_control 1)
)

(script static boolean obj_1dutch_8_16
    (= g_level_end true)
)

(script static boolean obj_1dutch_8_17
    (= g_100_cleanup true)
)

(script static boolean obj_1allie_8_18
    (= g_100_cleanup true)
)

(script static boolean obj_1lower_9_2
    (volume_test_players "tv_100_above_tank_left")
)

(script static boolean obj_1tank__9_3
    (volume_test_players "tv_100_tank_left")
)

(script static boolean obj_1stair_9_4
    (volume_test_players "tv_100_stairs_left")
)

(script static boolean obj_1stree_9_5
    (volume_test_players "tv_100_street_left")
)

(script static boolean obj_1upper_9_6
    (volume_test_players "tv_100_upper_area_left")
)

(script static boolean obj_1lower_9_7
    (volume_test_players "tv_100_above_tank_right")
)

(script static boolean obj_1tank__9_8
    (volume_test_players "tv_100_tank_right")
)

(script static boolean obj_1stair_9_9
    (volume_test_players "tv_100_stairs_right")
)

(script static boolean obj_1stree_9_10
    (volume_test_players "tv_100_street_right")
)

(script static boolean obj_1upper_9_11
    (volume_test_players "tv_100_upper_area_right")
)

(script static boolean obj_1main__9_12
    (volume_test_players "tv_100_defensive_area")
)

(script static boolean obj_1last__9_27
    (= (ai_task_count "obj_100_cov_main/gt_sniper_left") 1)
)

(script static boolean obj_1last__9_31
    (= (ai_task_count "obj_100_cov_main/gt_sniper_right") 1)
)

(script static boolean obj_1jacka_9_33
    (> (ai_task_count "obj_100_cov_main/gt_flank_right") 3)
)

(script static boolean obj_1jacka_9_34
    (> (ai_task_count "obj_100_cov_main/gt_flank_right") 5)
)

(script static boolean obj_1jacka_9_35
    (> (ai_task_count "obj_100_cov_main/gt_flank_right") 3)
)

(script static boolean obj_1jacka_9_36
    (> (ai_task_count "obj_100_cov_main/gt_flank_right") 5)
)

(script static boolean obj_1jacka_9_39
    (> (ai_task_count "obj_100_cov_main/gt_flank_left") 5)
)

(script static boolean obj_1jacka_9_41
    (> (ai_task_count "obj_100_cov_main/gt_flank_left") 3)
)

(script static boolean obj_1jacka_9_42
    (> (ai_task_count "obj_100_cov_main/gt_flank_left") 5)
)

(script static boolean obj_1jacka_9_44
    (> (ai_task_count "obj_100_cov_main/gt_flank_left") 3)
)

(script static boolean obj_1wrait_9_45
    (or
        (volume_test_players "tv_100_tank_left")
        (volume_test_players "tv_100_tank_right")
    )
)

(script static boolean obj_1wrait_9_46
    (= g_phantom_close true)
)

(script static boolean obj_1clean_9_47
    (= g_100_cleanup true)
)

(script static boolean obj_shero__10_11
    (<= (ai_task_count "obj_survival/remaining_task") 3)
)

(script static boolean obj_sinfan_10_12
    (and
        (<= (ai_task_count "obj_survival/hero_gate") 0)
        (<= (ai_task_count "obj_survival/remaining_task") 3)
    )
)

(script startup void sc120_insertion_stub
    (if debug 
        (print "sc120 insertion stub"))
)

(script static void ins_030_lower
    (set g_insertion_index 1)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_030")
    (sleep 1)
)

(script static void ins_030_mid
    (if debug 
        (print "insertion point : 030_mid"))
    (set g_insertion_index 2)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_030")
    (sleep 1)
    (set g_030_lower_obj_control 100)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "save marines and scorpion tank"))
    (objectives_show_up_to 0)
    (objectives_finish_up_to 0)
    (wake obj_drive_tank_set)
    (set s_waypoint_index 2)
    (wake s_sc120_music02)
    (print "teleporting players...")
    (object_teleport (player0) "fl_030_mid_player0")
    (object_teleport (player1) "fl_030_mid_player1")
    (object_teleport (player2) "fl_030_mid_player2")
    (object_teleport (player3) "fl_030_mid_player3")
    (sleep 1)
    (player0_set_pitch 7.0 0)
    (player1_set_pitch 7.0 0)
    (player2_set_pitch 7.0 0)
    (player3_set_pitch 7.0 0)
    (sleep 1)
    (object_create "030_scorpion_04")
    (cinematic_snap_from_black)
    (game_save_immediate)
    (game_save)
)

(script static void ins_030_upper
    (if debug 
        (print "insertion point : 030_upper"))
    (set g_insertion_index 3)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_030")
    (sleep 1)
    (set g_030_lower_obj_control 100)
    (set g_030_mid_obj_control 100)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "save marines and scorpion tank"))
    (objectives_show_up_to 0)
    (objectives_finish_up_to 0)
    (wake obj_drive_tank_set)
    (set s_waypoint_index 4)
    (print "teleporting players...")
    (object_teleport (player0) "fl_030_upper_player0")
    (object_teleport (player1) "fl_030_upper_player1")
    (object_teleport (player2) "fl_030_upper_player2")
    (object_teleport (player3) "fl_030_upper_player3")
    (sleep 1)
    (player0_set_pitch -10.0 0)
    (player1_set_pitch -10.0 0)
    (player2_set_pitch -10.0 0)
    (player3_set_pitch -10.0 0)
    (sleep 1)
    (object_create "030_scorpion_05")
    (object_create "barrier_insertion_2")
    (cinematic_snap_from_black)
    (game_save_immediate)
    (game_save)
)

(script static void ins_040
    (if debug 
        (print "insertion point : 040"))
    (set g_insertion_index 4)
    (if debug 
        (print "switching zone sets..."))
    (switch_zone_set "set_030_040")
    (sleep 1)
    (set g_030_lower_obj_control 100)
    (set g_030_mid_obj_control 100)
    (set g_030_upper_obj_control 100)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "save marines and scorpion tank"))
    (objectives_show_up_to 0)
    (objectives_finish_up_to 0)
    (wake obj_dutch_set)
    (set s_waypoint_index 5)
    (wake s_sc120_music04)
    (print "teleporting players...")
    (object_teleport (player0) "fl_040_player0")
    (object_teleport (player1) "fl_040_player1")
    (object_teleport (player2) "fl_040_player2")
    (object_teleport (player3) "fl_040_player3")
    (sleep 1)
    (player0_set_pitch -10.0 0)
    (player1_set_pitch -10.0 0)
    (player2_set_pitch -10.0 0)
    (player3_set_pitch -10.0 0)
    (sleep 1)
    (object_create "030_scorpion_06")
    (object_create "barrier_insertion_3a")
    (object_create "barrier_insertion_3b")
    (device_set_power "030_040_hub_door" 1.0)
    (cinematic_snap_from_black)
    (game_save_immediate)
    (game_save)
    (if dialogue 
        (print "fem. (radio): trooper! head through the security door to kizingo boulevard -- fastest way to the rally-point!"))
    (sleep (ai_play_line_on_object none sc120_0200))
    (sleep 10)
    (wake md_030_upper_prompt_03)
)

(script static void ins_100
    (if debug 
        (print "insertion point : 100"))
    (set g_insertion_index 5)
    (if debug 
        (print "switching zone sets..."))
    (zone_set_trigger_volume_enable "zone_set:set_030_040:*" false)
    (device_set_power "030_040_hub_door" 0.0)
    (device_set_position "030_040_hub_door" 0.0)
    (switch_zone_set "set_040_100")
    (sleep 1)
    (set g_030_lower_obj_control 100)
    (set g_030_mid_obj_control 100)
    (set g_030_upper_obj_control 100)
    (set g_040_obj_control 100)
    (if debug 
        (print "objective complete:"))
    (if debug 
        (print "rescue dutch"))
    (objectives_show_up_to 2)
    (objectives_finish_up_to 2)
    (wake obj_defend_rally_set)
    (set s_waypoint_index 7)
    (sleep 1)
    (print "teleporting players...")
    (object_teleport (player0) "fl_100_player0")
    (object_teleport (player1) "fl_100_player1")
    (object_teleport (player2) "fl_100_player2")
    (object_teleport (player3) "fl_100_player3")
    (sleep 1)
    (print "placing allies...")
    (ai_place "sq_dutch")
    (ai_cannot_die "sq_dutch" true)
    (set ai_dutch "sq_dutch/odst")
    (chud_show_ai_navpoint "sq_dutch" "dutch" true 0.15)
    (unit_add_equipment "sq_dutch" "profile_dutch" true true)
    (ai_teleport "sq_dutch" "ps_dutch/040_ins")
    (object_create_folder "cr_100")
    (object_create_folder "sc_100")
    (player0_set_pitch 5.0 0)
    (player1_set_pitch 5.0 0)
    (player2_set_pitch 5.0 0)
    (player3_set_pitch 5.0 0)
    (sleep 1)
    (cinematic_snap_from_black)
    (game_save_immediate)
    (game_save)
    (sleep 60)
    (wake md_040_doors_open)
    (sleep_until (volume_test_players "tv_ins_100") 1)
    (ai_place "sq_040_jackal_02")
    (ai_place "sq_040_jackal_03")
    (ai_place "sq_040_cov_06")
    (ai_place "sq_040_jackal_sniper_01")
    (ai_place "sq_100_allies_left")
    (ai_place "sq_100_allies_right")
    (ai_place "sq_100_allies_leader")
    (sleep 1)
    (ai_place "sq_100_cov_01")
    (ai_place "sq_100_cov_02")
    (ai_place "sq_100_jackal_01")
    (device_set_power "040_100_hub_door" 1.0)
    (sleep 1)
    (device_set_position "040_100_hub_door" 1.0)
    (sleep 60)
    (set g_040_doors_open true)
)

(script command_script void abort_cs
    (sleep 1)
)

(script command_script void sleep_cs
    (cs_run_command_script "sq_phantom_06_wraith/gunner" abort_cs)
    (cs_enable_moving true)
    (sleep_until (volume_test_players "tv_null"))
)

(script startup void sc120_startup
    (if debug 
        (print "sc120 startup script"))
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
        (wake sc120_first))
    (cond
        ((= (game_insertion_point_get) 0)
            (ins_030_lower)
        )
        ((= (game_insertion_point_get) 1)
            (ins_030_mid)
        )
        ((= (game_insertion_point_get) 2)
            (ins_030_upper)
        )
        ((= (game_insertion_point_get) 3)
            (ins_040)
        )
        ((= (game_insertion_point_get) 4)
            (ins_100)
        )
        ((= (game_insertion_point_get) 5)
            (wake sc120_survival_mode)
        )
    )
)

(script dormant void sc120_first
    (wake player0_sc120_waypoints)
    (if (coop_players_2) 
        (wake player1_sc120_waypoints))
    (if (coop_players_3) 
        (wake player2_sc120_waypoints))
    (if (coop_players_4) 
        (wake player3_sc120_waypoints))
    (wake player0_award_tourist)
    (if (coop_players_2) 
        (wake player1_award_tourist))
    (if (coop_players_3) 
        (wake player2_award_tourist))
    (if (coop_players_4) 
        (wake player3_award_tourist))
    (wake sc120_player_dialogue_check)
    (wake s_coop_resume)
    (ai_allegiance human player)
    (ai_allegiance player human)
    (fade_out 0.0 0.0 0.0 0)
    (gp_integer_set "gp_current_scene" 120)
    (pda_set_active_pda_definition "sc120")
    (wake s_pda_doors)
    (player_set_fourth_wall_enabled (player0) false)
    (player_set_fourth_wall_enabled (player1) false)
    (player_set_fourth_wall_enabled (player2) false)
    (player_set_fourth_wall_enabled (player3) false)
    (wake pda_breadcrumbs)
    (wake zone_set_control)
    (wake garbage_collect)
    (zone_set_trigger_volume_enable "zone_set:set_100" false)
    (wake level_end)
    (sleep_until (>= g_insertion_index 1) 1)
    (if (= g_insertion_index 1) 
        (wake enc_030_lower))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_030_mid")
            (>= g_insertion_index 2)
        ) 
    1)
    (if (<= g_insertion_index 2) 
        (wake enc_030_mid))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_030_upper")
            (>= g_insertion_index 3)
        ) 
    1)
    (if (<= g_insertion_index 3) 
        (wake enc_030_upper))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_040")
            (>= g_insertion_index 4)
        ) 
    1)
    (if (<= g_insertion_index 4) 
        (wake enc_040))
    (sleep_until 
        (or
            (volume_test_players "tv_enc_100")
            (>= g_insertion_index 5)
        ) 
    1)
    (if (<= g_insertion_index 5) 
        (wake enc_100))
)

(script dormant void enc_030_lower
    (if (= g_play_cinematics true) 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (sound_class_set_gain "" 0.0 0)
                    (sound_class_set_gain "mus" 1.0 0)
                    (sound_impulse_start "sound\cinematics\atlas\sc120\foley\sc120_int_glue" none 1.0)
                    (cinematic_snap_to_black)
                    (if debug 
                        (print "sc120_int_sc"))
                    (sleep 60)
                    (sound_impulse_start "sound\cinematics\atlas\sc120\music\sc120m_int_sc_title" none 1.0)
                    (cinematic_set_title "title_1")
                    (sleep 60)
                    (cinematic_set_title "title_2")
                    (sleep 60)
                    (cinematic_set_title "title_3")
                    (sleep (* 30.0 5.0))
                    (sc120_int_sc)
                )
            )
            (cinematic_skip_stop)
        )
    )
    (player0_set_pitch -11.0 0)
    (player1_set_pitch -11.0 0)
    (player2_set_pitch -11.0 0)
    (player3_set_pitch -11.0 0)
    (sleep 1)
    (cinematic_snap_to_white)
    (set g_sc120_music01 true)
    (sc120_int_sc_cleanup)
    (data_mine_set_mission_segment "sc120_10_030_lower")
    (chud_show_crosshair true)
    (set s_waypoint_index 1)
    (wake s_waypoint_index_2)
    (wake obj_scorpion_set)
    (wake obj_scorpion_clear)
    (wake 030_lower_place_01)
    (wake s_sc120_music01)
    (wake s_sc120_music02)
    (wake s_sc120_music015)
    (wake s_sc120_music016)
    (set g_sc120_music015 true)
    (set g_sc120_music016 true)
    (object_create "jersey_01")
    (object_create "jersey_02")
    (object_create "030_intro_truck")
    (object_create "030_intro_car")
    (object_create "030_intro_cover")
    (wake md_030_lower_prompt_01)
    (wake md_030_lower_prompt_02)
    (wake md_030_lower_end)
    (sleep 1)
    (cinematic_snap_from_white)
    (sleep_until (volume_test_players "tv_030_lower_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_030_lower_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_030_lower_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_030_lower_obj_control 2)
    (game_save)
    (sleep_until (volume_test_players "tv_030_lower_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_030_lower_obj_control 3)
    (wake s_sq_phantom_01_test)
    (game_save)
    (sleep_until (volume_test_players "tv_030_lower_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_030_lower_obj_control 4)
    (game_save)
)

(script dormant void 030_lower_place_01
    (ai_place "sq_030_allies_01")
    (ai_place "sq_030_allies_02")
    (ai_place "sq_030_scorpion_01")
    (sleep 1)
    (ai_place "sq_030_allies_03")
    (ai_place "sq_030_allies_04")
    (sleep 1)
    (ai_place "sq_030_cov_01")
    (ai_place "sq_030_cov_02")
    (sleep 1)
    (ai_place "sq_030_cov_03")
    (ai_place "sq_030_jackal_01")
    (sleep 1)
    (ai_place "sq_030_jackal_02")
    (ai_place "sq_030_wraith_01")
    (sleep 1)
    (ai_place "sq_030_wraith_03")
    (ai_place "sq_030_jackal_03")
    (sleep 1)
    (ai_place "sq_phantom_01")
    (ai_vehicle_reserve_seat "sq_030_scorpion_01" scorpion_p true)
    (wake scorpion_unreserve)
    (ai_force_active "gr_030_lower_cov" true)
    (ai_prefer_target_ai "sq_030_allies_02" "sq_030_wraith_01" true)
    (sleep_until (>= g_030_lower_obj_control 4) 1)
    (ai_prefer_target_ai "sq_030_allies_02" "sq_030_wraith_01" false)
)

(script dormant void s_sq_phantom_01_test
    (sleep_until (<= (ai_task_count "obj_030_lower_cov/gt_phantom") 0) 1)
    (set g_030_wraith_03 1)
)

(script command_script void cs_030_wraith_shoot
    (cs_run_command_script "sq_030_wraith_01/gunner" abort_cs)
    (cs_enable_moving true)
    (cs_abort_on_damage true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_030_wraith_01/p0")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_030_wraith_01/p1")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_030_wraith_01/p2")
                )
            )
            false
        )
    )
)

(script command_script void cs_030_scorpion
    (cs_run_command_script "sq_030_scorpion_01/gunner" abort_cs)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_speed 0.6)
    (cs_go_to "ps_030_scorpion/run_01")
    (cs_go_to "ps_030_scorpion/run_02")
    (cs_go_to "ps_030_scorpion/run_03")
    (cs_go_to "ps_030_scorpion/run_05")
    (sleep 1)
)

(script dormant void scorpion_unreserve
    (set scorpion_01 (ai_vehicle_get_from_starting_location "sq_030_scorpion_01/scorpion"))
    (sleep_until 
        (or
            (vehicle_test_seat_unit scorpion_01 scorpion_d (player0))
            (vehicle_test_seat_unit scorpion_01 scorpion_d (player1))
            (vehicle_test_seat_unit scorpion_01 scorpion_d (player2))
            (vehicle_test_seat_unit scorpion_01 scorpion_d (player3))
        ) 
    5)
    (ai_vehicle_reserve_seat "sq_030_scorpion_01" scorpion_p false)
)

(script command_script void cs_phantom_01
    (if debug 
        (print "phantom 01"))
    (set phantom_01 (ai_vehicle_get_from_starting_location "sq_phantom_01/phantom"))
    (ai_place "sq_phantom_01_cov_01")
    (ai_place "sq_phantom_01_brute_01")
    (ai_place "sq_phantom_01_ghost_01")
    (ai_force_active "gr_phantom_01" true)
    (sleep 5)
    (object_set_scale phantom_01 0.9 0)
    (ai_vehicle_enter_immediate "sq_phantom_01_cov_01" phantom_01 phantom_p_lb)
    (ai_vehicle_enter_immediate "sq_phantom_01_brute_01" phantom_01 phantom_p_rb)
    (vehicle_load_magic phantom_01 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_01_ghost_01/ghost"))
    (sleep 1)
    (ai_set_objective "sq_phantom_01" "obj_030_lower_cov")
    (ai_set_objective "gr_phantom_01" "obj_030_lower_cov")
    (sleep_until (>= g_030_lower_obj_control 3))
    (cs_fly_to_and_face "ps_phantom_01/hover_01" "ps_phantom_01/face_01" 1.0)
    (sleep 30)
    (cs_fly_to_and_face "ps_phantom_01/hover_02" "ps_phantom_01/face_01" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.15)
    (cs_fly_by "ps_phantom_01/approach_01" 1.0)
    (cs_vehicle_speed 0.3)
    (cs_fly_to "ps_phantom_01/drop_01" 1.0)
    (unit_open phantom_01)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep 15)
    (vehicle_unload phantom_01 phantom_p_lb)
    (sleep 75)
    (cs_fly_to "ps_phantom_01/drop_02")
    (vehicle_unload phantom_01 phantom_p_rb)
    (sleep 80)
    (unit_close phantom_01)
    (cs_vehicle_speed 0.6)
    (set g_030_wraith_03 1)
    (cs_fly_by "ps_phantom_01/exit_01")
    (cs_fly_by "ps_phantom_01/exit_02")
    (cs_fly_by "ps_phantom_01/exit_03")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_01/exit_04")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_01/erase")
    (ai_erase ai_current_squad)
)

(script dormant void enc_030_mid
    (if debug 
        (print "entering 030_mid"))
    (data_mine_set_mission_segment "sc120_20_030_mid")
    (wake md_030_mid_intro)
    (wake md_030_mid_end)
    (wake s_sc120_music02_alt)
    (game_save)
    (sleep_until (volume_test_players "tv_030_mid_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_030_mid_obj_control 1)
    (wake 030_mid_place_01)
    (set g_sc120_music03 true)
    (set g_sc120_music02 true)
    (set g_sc120_music01 false)
    (set g_sc120_music015 false)
    (set g_sc120_music016 false)
    (game_save)
    (sleep_until (volume_test_players "tv_030_mid_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_030_mid_obj_control 2)
    (clear_command_buffer_cache_from_script true)
    (sleep 5)
    (wake 030_mid_place_02)
    (game_save)
    (sleep_until (volume_test_players "tv_030_mid_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_030_mid_obj_control 3)
    (wake 030_mid_place_03)
    (ai_disposable "gr_030_lower_cov" true)
    (set s_waypoint_index 3)
    (wake s_waypoint_index_4)
    (set g_sc120_music02_alt true)
    (game_save)
    (sleep_until (volume_test_players "tv_030_mid_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_030_mid_obj_control 4)
    (wake 030_mid_place_04)
    (wake 030_teleport)
    (game_save)
    (sleep_until (volume_test_players "tv_030_mid_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_030_mid_obj_control 5)
    (wake 030_mid_place_05)
    (set g_sc120_music01 false)
    (set g_sc120_music02 false)
    (set g_sc120_music03 false)
)

(script dormant void 030_mid_place_01
    (ai_place "sq_030_jackal_04")
    (ai_place "sq_030_jackal_sniper_01")
    (sleep 1)
    (ai_place "sq_030_brute_01")
    (ai_place "sq_030_brute_02")
    (sleep 30)
    (soft_ceiling_enable "camera01" false)
    (set g_030_wraith_03 1)
)

(script dormant void 030_mid_place_02
    (ai_place "sq_030_ghost_01")
    (ai_force_active "gr_030_mid_cov" true)
)

(script dormant void 030_mid_place_03
    (ai_place "sq_030_watchtower_01")
    (ai_place "sq_030_ghost_02")
    (sleep 1)
    (ai_place "sq_030_shade_01")
    (ai_place "sq_030_shade_02")
    (sleep 1)
    (ai_place "sq_030_cov_04")
    (ai_force_active "gr_030_mid_cov" true)
    (sleep 15)
    (soft_ceiling_enable "camera02" false)
)

(script dormant void 030_mid_place_04
    (ai_place "sq_030_jackal_sniper_02")
    (ai_place "sq_phantom_02")
)

(script dormant void 030_mid_place_05
    (ai_place "sq_030_allies_05")
)

(script dormant void 030_teleport
    (sleep_until 
        (or
            (volume_test_players "tv_030_roundabout_left")
            (volume_test_players "tv_030_roundabout_right")
        ) 
    1)
    (cond
        ((volume_test_players "tv_030_roundabout_left")
            (begin
                (if (not (volume_test_object "tv_sp_030_mid" (player0))) 
                    (object_teleport (player0) "fl_030_left_00"))
                (if (not (volume_test_object "tv_sp_030_mid" (player1))) 
                    (object_teleport (player1) "fl_030_left_01"))
                (if (not (volume_test_object "tv_sp_030_mid" (player2))) 
                    (object_teleport (player2) "fl_030_left_02"))
                (if (not (volume_test_object "tv_sp_030_mid" (player3))) 
                    (object_teleport (player3) "fl_030_left_03"))
            )
        )
        ((volume_test_players "tv_030_roundabout_right")
            (begin
                (if (not (volume_test_object "tv_sp_030_mid" (player0))) 
                    (object_teleport (player0) "fl_030_right_00"))
                (if (not (volume_test_object "tv_sp_030_mid" (player1))) 
                    (object_teleport (player1) "fl_030_right_01"))
                (if (not (volume_test_object "tv_sp_030_mid" (player2))) 
                    (object_teleport (player2) "fl_030_right_02"))
                (if (not (volume_test_object "tv_sp_030_mid" (player3))) 
                    (object_teleport (player3) "fl_030_right_03"))
            )
        )
    )
    (ai_erase "gr_030_lower_cov")
    (ai_erase "sq_030_allies_02")
)

(script command_script void cs_030_ghost_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_030_ghost_01/run_01")
    (cs_go_to "ps_030_ghost_01/run_02")
)

(script command_script void cs_phantom_02
    (if debug 
        (print "phantom 02"))
    (set phantom_02 (ai_vehicle_get_from_starting_location "sq_phantom_02/phantom"))
    (ai_place "sq_phantom_02_cov_01")
    (ai_place "sq_phantom_02_jackal_01")
    (ai_place "sq_phantom_02_ghost")
    (ai_force_active "gr_phantom_02" true)
    (sleep 5)
    (ai_vehicle_enter_immediate "sq_phantom_02_cov_01" phantom_02 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_02_jackal_01" phantom_02 phantom_p_mr_b)
    (vehicle_load_magic phantom_02 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_02_ghost/ghost"))
    (sleep 1)
    (ai_set_objective "sq_phantom_02" "obj_030_mid_cov")
    (ai_set_objective "gr_phantom_02" "obj_030_mid_cov")
    (cs_fly_by "ps_phantom_02/approach_01")
    (cs_fly_by "ps_phantom_02/approach_02")
    (cs_vehicle_speed 0.8)
    (cs_fly_to_and_face "ps_phantom_02/hover_01" "ps_phantom_02/face_01" 1.0)
    (sleep 15)
    (unit_open phantom_02)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_02/drop_01" "ps_phantom_02/face_01" 1.0)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep 30)
    (vehicle_unload phantom_02 phantom_p_rb)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_02 phantom_p_mr_b)
    (sleep 75)
    (cs_fly_to_and_face "ps_phantom_02/hover_01" "ps_phantom_02/face_01" 1.0)
    (unit_close phantom_02)
    (sleep (random_range 60 90))
    (cs_vehicle_speed 0.8)
    (cs_fly_by "ps_phantom_02/exit_01")
    (cs_fly_by "ps_phantom_02/exit_02")
    (cs_fly_by "ps_phantom_02/exit_03")
    (cs_fly_by "ps_phantom_02/exit_04")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_02/erase")
    (ai_erase ai_current_squad)
)

(script dormant void enc_030_upper
    (data_mine_set_mission_segment "sc120_30_030_upper")
    (wake s_sc120_music04)
    (wake md_030_upper_prompt_01)
    (wake md_030_upper_prompt_02)
    (wake power_030_040_hub_door)
    (game_save)
    (sleep_until (volume_test_players "tv_030_upper_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_030_upper_obj_control 1)
    (clear_command_buffer_cache_from_script true)
    (sleep 5)
    (set g_sc120_music01 false)
    (set g_sc120_music02 false)
    (set g_sc120_music03 false)
    (wake 030_upper_place_01)
    (game_save)
    (sleep_until (volume_test_players "tv_030_upper_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_030_upper_obj_control 2)
    (game_save)
    (sleep_until (volume_test_players "tv_030_upper_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_030_upper_obj_control 3)
    (wake 030_upper_place_02)
    (ai_disposable "gr_030_mid_cov" true)
    (game_save)
    (sleep_until (volume_test_players "tv_030_upper_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_030_upper_obj_control 4)
    (set g_sc120_music04 true)
    (game_save)
)

(script dormant void power_030_040_hub_door
    (sleep_until (volume_test_players "tv_030_upper_exit") 1)
    (device_set_power "030_040_hub_door" 1.0)
)

(script dormant void 030_upper_place_01
    (ai_place "sq_030_cov_05")
    (ai_place "sq_030_cov_06")
    (ai_place "sq_030_shade_03")
    (ai_place "sq_030_shade_04")
    (ai_place "sq_030_shade_05")
    (ai_place "sq_030_turret_01")
    (ai_place "sq_030_ghost_03")
    (ai_place "sq_030_cov_07")
    (ai_force_active "gr_030_upper_cov" true)
    (sleep 15)
    (soft_ceiling_enable "camera03" false)
)

(script dormant void 030_upper_place_02
    (sleep_until (<= (ai_task_count "obj_030_upper_cov/gt_shade") 1) 5 (* 30.0 5.0))
    (ai_place "sq_phantom_03")
)

(script command_script void cs_phantom_03
    (if debug 
        (print "phantom 03"))
    (set phantom_03 (ai_vehicle_get_from_starting_location "sq_phantom_03/phantom"))
    (object_set_shadowless "sq_phantom_03/phantom" true)
    (ai_place "sq_phantom_03_brute")
    (ai_place "sq_phantom_03_grunt")
    (ai_place "sq_phantom_03_jackal_sniper_01")
    (ai_place "sq_phantom_03_jackal_sniper_02")
    (ai_place "sq_phantom_03_ghost")
    (ai_force_active "gr_phantom_03" true)
    (sleep 5)
    (ai_vehicle_enter_immediate "sq_phantom_03_brute" phantom_03 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_03_grunt" phantom_03 phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_phantom_03_jackal_sniper_01" phantom_03 phantom_p_ml_b)
    (ai_vehicle_enter_immediate "sq_phantom_03_jackal_sniper_02" phantom_03 phantom_p_mr_b)
    (vehicle_load_magic phantom_03 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_03_ghost/ghost"))
    (sleep 1)
    (ai_set_objective "sq_phantom_03" "obj_030_upper_cov")
    (ai_set_objective "gr_phantom_03" "obj_030_upper_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_03/approach_01")
    (cs_vehicle_boost false)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_03/hover_01" "ps_phantom_03/face_01" 1.0)
    (sleep 15)
    (unit_open phantom_03)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_03/drop_01" "ps_phantom_03/face_01" 1.0)
    (sleep 30)
    (vehicle_unload phantom_03 phantom_p_rf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_03 phantom_p_mr_b)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_03 phantom_p_lf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_03 phantom_p_ml_b)
    (sleep 75)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_03/approach_02")
    (cs_fly_to_and_face "ps_phantom_03/hover_02" "ps_phantom_03/face_02" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_03/drop_02" "ps_phantom_03/face_02" 1.0)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep 30)
    (cs_fly_to_and_face "ps_phantom_03/hover_02" "ps_phantom_03/face_02" 1.0)
    (sleep (random_range 15 75))
    (cs_vehicle_speed 1.0)
    (set g_sc120_music04 true)
    (cs_fly_by "ps_phantom_03/exit_01")
    (cs_fly_by "ps_phantom_03/exit_02")
    (cs_fly_by "ps_phantom_03/exit_03")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_03/erase")
    (ai_erase ai_current_squad)
)

(script dormant void 040_exit
    (hud_activate_team_nav_point_flag player "fl_030_exit" 0.5)
    (set s_waypoint_index 5)
    (sleep_until 
        (or
            (= (device_get_position "030_040_hub_door") 1.0)
            (>= g_040_obj_control 1)
        ) 
    1)
    (hud_deactivate_team_nav_point_flag player "fl_030_exit")
)

(script dormant void enc_040
    (data_mine_set_mission_segment "sc120_40_040")
    (wake 040_place_01)
    (wake s_sc120_music04_alt)
    (wake md_040_ambush_01)
    (wake md_040_ambush_end_02)
    (wake md_040_doors_open)
    (game_save)
    (sleep_until (volume_test_players "tv_040_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_040_obj_control 1)
    (set g_sc120_music04 true)
    (set g_sc120_music04_alt true)
    (chud_show_ai_navpoint "sq_dutch" "dutch" true 0.15)
    (wake obj_dutch_set)
    (game_save)
    (sleep_until (volume_test_players "tv_040_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_040_obj_control 2)
    (ai_disposable "gr_030_cov" true)
    (game_save)
    (sleep_until (volume_test_players "tv_040_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_040_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_040_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set g_040_obj_control 4)
    (wake 040_place_03)
    (game_save)
    (sleep_until (volume_test_players "tv_040_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set g_040_obj_control 5)
    (wake 040_place_04)
    (game_save)
    (sleep_until (volume_test_players "tv_040_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set g_040_obj_control 6)
    (set s_waypoint_index 6)
    (wake 040_place_05)
    (game_save)
    (sleep_until (volume_test_players "tv_040_07") 1)
    (if debug 
        (print "set objective control 7"))
    (set g_040_obj_control 7)
    (game_save)
    (sleep_until (volume_test_players "tv_040_08") 1)
    (if debug 
        (print "set objective control 8"))
    (set g_040_obj_control 8)
    (set s_waypoint_index 7)
    (game_save)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_040_cov/gt_040_cov") 10)
            (volume_test_players "tv_040_08")
        ) 
    1)
    (clear_command_buffer_cache_from_script true)
    (sleep 30)
    (ai_place "sq_040_jackal_02")
    (ai_place "sq_040_jackal_03")
    (ai_place "sq_040_cov_06")
    (ai_place "sq_040_jackal_sniper_01")
    (ai_place "sq_100_allies_left")
    (ai_place "sq_100_allies_right")
    (ai_place "sq_100_allies_leader")
    (sleep 1)
    (ai_place "sq_100_cov_01")
    (ai_place "sq_100_cov_02")
    (ai_place "sq_100_jackal_01")
    (object_create_folder "cr_100")
    (object_create_folder "sc_100")
    (device_set_power "040_100_hub_door" 1.0)
    (sleep 1)
    (device_set_position "040_100_hub_door" 1.0)
    (pda_activate_marker_named player "040_100_hub_door" "locked_0" false "locked_door")
    (sleep 60)
    (set g_040_doors_open true)
    (wake obj_dutch_clear)
    (wake obj_drive_tank_clear)
)

(script dormant void 040_place_01
    (ai_place "sq_040_cov_01")
    (ai_place "sq_040_cov_04")
    (ai_place "sq_040_cov_05")
    (sleep 1)
    (ai_place "sq_040_jackal_01")
    (sleep 1)
    (ai_place "sq_040_wraith_01")
    (ai_place "sq_040_wraith_02")
    (sleep 1)
    (ai_place "sq_040_cov_02")
    (ai_place "sq_040_cov_03")
    (sleep 1)
    (ai_place "sq_040_allies_01")
    (units_set_current_vitality (ai_actors "sq_040_allies_01") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_040_allies_01") 0.1 0.0)
    (ai_place "sq_040_ghost_01")
    (units_set_current_vitality (ai_actors "sq_040_ghost_01") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_040_ghost_01") 0.1 0.0)
    (sleep 1)
    (ai_place "sq_040_ghost_02")
    (units_set_current_vitality (ai_actors "sq_040_ghost_02") 0.1 0.0)
    (units_set_maximum_vitality (ai_actors "sq_040_ghost_02") 0.1 0.0)
    (ai_place "sq_040_allies_03")
    (ai_place "sq_dutch")
    (ai_cannot_die "sq_dutch" true)
)

(script dormant void 040_place_02
    (ai_place "sq_040_banshee_01")
    (ai_place "sq_040_banshee_02")
)

(script dormant void 040_place_03
    (ai_place "sq_phantom_04")
)

(script dormant void 040_place_04
    (sleep 1)
)

(script dormant void 040_place_05
    (ai_place "sq_phantom_05")
)

(script dormant void 040_ambush
    (set g_040_ambush 2)
    (ai_prefer_target_ai "sq_dutch" "sq_040_ghost_02" true)
    (ai_prefer_target_ai "sq_040_allies_03" "sq_040_ghost_01" true)
    (wake s_040_ambush_2_dutch)
    (sleep_until (= (ai_task_count "obj_040_cov/gt_ghost_ambush_01") 0) 1 (* 30.0 10.0))
    (set g_040_ambush 3)
    (wake 040_place_02)
    (ai_prefer_target_ai "sq_040_wraith_01" "sq_040_allies_03" true)
    (ai_prefer_target_ai "sq_040_wraith_02" "sq_040_allies_03" true)
    (units_set_current_vitality (ai_actors "sq_040_allies_03") 0.6 0.0)
    (units_set_maximum_vitality (ai_actors "sq_040_allies_03") 0.6 0.0)
    (sleep_until (= (ai_task_count "obj_040_cov/gt_ghost_ambush_02") 0) 1 (* 30.0 10.0))
    (unit_add_equipment "sq_dutch" "profile_dutch" true true)
    (ai_prefer_target_ai "sq_dutch" "sq_040_ghost_02" false)
    (sleep_until (= (ai_task_count "obj_040_allies/gt_allies_03") 0) 1 (* 30.0 10.0))
    (set g_040_ambush 4)
    (ai_prefer_target_ai "sq_040_wraith_01" "sq_040_allies_03" false)
    (ai_prefer_target_ai "sq_040_wraith_02" "sq_040_allies_03" false)
)

(script dormant void s_040_ambush_2_dutch
    (sleep 45)
    (set g_040_ambush_2_dutch true)
)

(script command_script void cs_040_ghost_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost false)
    (cs_vehicle_speed 0.35)
    (cs_go_to "ps_040_ghost_01/run_01")
    (cs_go_to "ps_040_ghost_01/run_02")
    (cs_go_to "ps_040_ghost_01/run_03")
    (cs_go_to "ps_040_ghost_01/run_04")
)

(script command_script void cs_040_ghost_02
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost false)
    (cs_vehicle_speed 0.55)
    (cs_go_to "ps_040_ghost_02/run_01")
    (cs_go_to "ps_040_ghost_02/run_02")
    (cs_go_to "ps_040_ghost_02/run_03")
    (cs_go_to "ps_040_ghost_02/run_04")
    (cs_go_to "ps_040_ghost_02/run_05")
    (unit_add_equipment "sq_dutch" "profile_dutch" true true)
)

(script command_script void cs_040_dutch_01
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (cs_shoot true (ai_get_object "sq_040_ghost_02/ghost"))
            (<= (unit_get_health "sq_040_ghost_02/ghost") 0.0)
        ) 
    (random_range 5 15))
    (sleep 1)
)

(script command_script void cs_040_dutch_02
    (cs_enable_pathfinding_failsafe true)
    (cs_go_to "ps_dutch/040_run_02")
    (sleep 1)
)

(script command_script void cs_040_turret_01
    (cs_enable_pathfinding_failsafe true)
    (sleep_until 
        (begin
            (cs_shoot true (ai_get_object "sq_040_ghost_01/ghost"))
            (<= (unit_get_health "sq_040_ghost_01/ghost") 0.0)
        )
    )
)

(script command_script void cs_040_wraith_01_gauss_attack
    (cs_run_command_script "sq_040_wraith_01/gunner" abort_cs)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost false)
    (cs_vehicle_speed 1.0)
    (cs_go_to "ps_040_wraith_01/gauss_attack_01")
    (sleep_until 
        (begin
            (cs_shoot true (ai_get_object "sq_040_allies_03/turret"))
            (<= (unit_get_health "sq_040_allies_03/turret") 0.0)
        )
    )
)

(script command_script void cs_040_wraith_02_gauss_attack
    (cs_run_command_script "sq_040_wraith_02/gunner" abort_cs)
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost false)
    (sleep 30)
    (cs_vehicle_speed 0.8)
    (cs_go_to "ps_040_wraith_02/gauss_attack_01")
    (cs_go_to "ps_040_wraith_02/gauss_attack_02")
    (cs_enable_moving true)
    (sleep_until 
        (begin
            (cs_shoot true (ai_get_object "sq_040_allies_03/turret"))
            (<= (unit_get_health "sq_040_allies_03/turret") 0.0)
        )
    )
)

(script command_script void cs_040_wraith_01_door_attack
    (cs_run_command_script "sq_040_wraith_01/gunner" abort_cs)
    (cs_enable_pathfinding_failsafe true)
    (cs_abort_on_damage false)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost false)
    (cs_vehicle_speed 0.5)
    (cs_go_to "ps_040_wraith_01/door_attack_01")
    (cs_go_to "ps_040_wraith_01/door_attack_02")
    (cs_go_to "ps_040_wraith_01/door_attack_03")
    (cs_run_command_script "sq_040_wraith_01/gunner" abort_cs)
    (cs_enable_moving true)
    (cs_abort_on_damage true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_040_wraith_01/target_01")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_040_wraith_01/target_02")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_040_wraith_01/target_03")
                )
            )
            false
        )
    )
)

(script command_script void cs_040_wraith_02_door_attack
    (cs_run_command_script "sq_040_wraith_02/gunner" abort_cs)
    (cs_enable_pathfinding_failsafe true)
    (cs_abort_on_damage false)
    (cs_enable_targeting false)
    (cs_enable_looking false)
    (cs_vehicle_boost false)
    (cs_vehicle_speed 1.0)
    (cs_go_to "ps_040_wraith_02/door_attack_01")
    (cs_go_to "ps_040_wraith_02/door_attack_02")
    (cs_run_command_script "sq_040_wraith_02/gunner" abort_cs)
    (cs_enable_moving true)
    (cs_abort_on_damage true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_040_wraith_02/target_01")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_040_wraith_02/target_02")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_040_wraith_02/target_03")
                )
            )
            false
        )
    )
)

(script command_script void cs_040_banshee_01
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_040_banshee/approach_01")
    (cs_fly_by "ps_040_banshee/dive_01")
    (cs_vehicle_boost false)
    (cs_vehicle_speed 0.9)
    (cs_fly_by "ps_040_banshee/turn_01")
    (cs_fly_by "ps_040_banshee/split_01")
    (cs_fly_by "ps_040_banshee/end_01")
    (cs_fly_by "ps_040_banshee/end_01b")
)

(script command_script void cs_040_banshee_02
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_040_banshee/approach_02")
    (cs_fly_by "ps_040_banshee/dive_02")
    (cs_vehicle_boost false)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_040_banshee/turn_02")
    (cs_fly_by "ps_040_banshee/split_02")
    (cs_fly_by "ps_040_banshee/end_02b")
)

(script command_script void cs_040_banshee_exit
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_040_banshee/exit_01")
    (cs_fly_by "ps_040_banshee/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_040_allies_01
    (sleep 1)
)

(script command_script void cs_phantom_04
    (if debug 
        (print "phantom 04"))
    (set phantom_04 (ai_vehicle_get_from_starting_location "sq_phantom_04/phantom"))
    (ai_place "sq_phantom_04_cov_01")
    (ai_place "sq_phantom_04_cov_02")
    (ai_place "sq_phantom_04_jackal_01")
    (ai_place "sq_phantom_04_jackal_02")
    (ai_place "sq_phantom_04_ghost")
    (ai_force_active "gr_phantom_04" true)
    (sleep 5)
    (ai_vehicle_enter_immediate "sq_phantom_04_cov_01" phantom_04 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_04_cov_02" phantom_04 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_04_jackal_01" phantom_04 phantom_p_ml_f)
    (ai_vehicle_enter_immediate "sq_phantom_04_jackal_02" phantom_04 phantom_p_ml_b)
    (vehicle_load_magic phantom_04 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_04_ghost/ghost"))
    (sleep 1)
    (ai_set_objective "sq_phantom_04" "obj_040_cov")
    (ai_set_objective "gr_phantom_04" "obj_040_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_04/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_04/approach_02")
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_04/hover_01" "ps_phantom_04/face_01" 1.0)
    (sleep 15)
    (unit_open phantom_04)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_04/drop_01" "ps_phantom_04/face_01" 1.0)
    (sleep 30)
    (vehicle_unload phantom_04 phantom_p_rf)
    (vehicle_unload phantom_04 phantom_p_ml_f)
    (sleep (random_range 30 45))
    (vehicle_unload phantom_04 phantom_p_rb)
    (vehicle_unload phantom_04 phantom_p_ml_b)
    (sleep 75)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_04/hover_01" "ps_phantom_04/face_01" 1.0)
    (sleep (random_range 5 15))
    (cs_fly_by "ps_phantom_04/run_01")
    (cs_fly_by "ps_phantom_04/run_02")
    (cs_fly_by "ps_phantom_04/run_03")
    (cs_fly_by "ps_phantom_04/run_04")
    (cs_fly_by "ps_phantom_04/run_05")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_04/hover_02" "ps_phantom_04/face_02" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_04/drop_02" "ps_phantom_04/face_02" 1.0)
    (sleep 15)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep 30)
    (cs_fly_to_and_face "ps_phantom_04/hover_02" "ps_phantom_04/face_02" 1.0)
    (cs_fly_to_and_face "ps_phantom_04/hover_03" "ps_phantom_04/face_03" 1.0)
    (sleep_until (< (ai_task_count "obj_040_cov/gt_phantom") 2) 5 (* 30.0 10.0))
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_04/exit_01")
    (cs_fly_by "ps_phantom_04/exit_02")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_04/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_phantom_05
    (if debug 
        (print "phantom 05"))
    (set phantom_05 (ai_vehicle_get_from_starting_location "sq_phantom_05/phantom"))
    (ai_place "sq_phantom_05_ghost")
    (ai_force_active "gr_phantom_05" true)
    (sleep 5)
    (vehicle_load_magic phantom_05 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_05_ghost/ghost"))
    (sleep 1)
    (ai_set_objective "sq_phantom_05" "obj_040_cov")
    (ai_set_objective "gr_phantom_05" "obj_040_cov")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_05/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_05/approach_02")
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_05/hover_01" "ps_phantom_05/face_01" 1.0)
    (sleep 15)
    (unit_open phantom_05)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_05/drop_01" "ps_phantom_05/face_01" 1.0)
    (sleep 30)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep 30)
    (cs_fly_to_and_face "ps_phantom_05/hover_02" "ps_phantom_05/face_02" 1.0)
    (sleep_until (< (ai_task_count "obj_040_cov/gt_phantom_b") 2) 5 (* 30.0 10.0))
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_05/hover_exit_02" "ps_phantom_05/face_02" 1.0)
    (sleep 15)
    (cs_fly_by "ps_phantom_05/exit_01")
    (cs_fly_by "ps_phantom_05/exit_02")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_05/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_phantom_05_jackal
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_phantom_05_jackal/run_01")
)

(script command_script void cs_phantom_05_ghost
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_phantom_05_ghost/run_01")
    (cs_go_to "ps_phantom_05_ghost/run_02")
)

(script dormant void enc_100
    (data_mine_set_mission_segment "sc120_50_100")
    (wake s_sc120_music05)
    (wake s_sc120_music06)
    (wake md_100_phantoms)
    (wake md_100_wraith)
    (wake md_100_combat_end)
    (wake md_100_prompt)
    (wake md_100_final)
    (wake dutch_100_teleport)
    (wake 100_midsave_01)
    (wake 100_midsave_02)
    (wake 100_cleanup)
    (game_save)
    (sleep_until (volume_test_players "tv_100_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set g_100_obj_control 1)
    (game_save)
    (sleep_until (volume_test_players "tv_100_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set g_100_obj_control 2)
    (wake 100_place_02)
    (wake 100_place_03)
    (wake 100_place_04)
    (game_save)
    (sleep_until (volume_test_players "tv_100_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set g_100_obj_control 3)
    (ai_disposable "gr_040_cov" true)
    (game_save)
)

(script dormant void dutch_100_teleport
    (sleep_until (volume_test_players "begin_zone_set:set_100") 1)
    (if (not (volume_test_object "tv_100_total" (ai_get_object "sq_dutch/odst"))) 
        (ai_bring_forward ai_dutch 2.0))
)

(script dormant void 100_place_02
    (ai_place "sq_100_phantom_01")
    (ai_place "sq_100_banshee_01")
    (ai_place "sq_100_banshee_02")
)

(script dormant void 100_place_03
    (sleep_until 
        (and
            (= (ai_task_count "obj_100_cov_start/gt_100_cov_start") 0)
            (= (ai_task_count "obj_040_cov/gt_040_transition_100") 0)
        ) 
    1)
    (if (not (volume_test_object "tv_100_total" (ai_get_object "sq_dutch/odst"))) 
        (ai_bring_forward ai_dutch 5.0))
    (ai_set_objective "sq_dutch" "obj_100_allies")
    (sleep_until (volume_test_players "tv_100_zone_set_start") 1)
    (zone_set_trigger_volume_enable "zone_set:set_100" true)
    (sleep_until (>= (current_zone_set_fully_active) 3) 1)
    (sleep (random_range (* 30.0 7.0) (* 30.0 10.0)))
    (ai_place "sq_phantom_06")
    (wake s_sq_phantom_06_test)
    (game_save)
)

(script dormant void 100_place_04
    (sleep_until (= g_100_place_04 true) 1)
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_100_cov_main") 14) 1)
    (set g_tv_sp_100_phantom true)
    (sleep (* 30.0 15.0))
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_100_cov_main") 10) 1)
    (ai_place "sq_phantom_07")
    (wake s_sq_phantom_07_test)
    (game_save)
)

(script dormant void s_sq_phantom_06_test
    (sleep_until (> (ai_task_count "obj_100_cov_main/gt_phantom") 0) 1)
    (sleep 30)
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_phantom") 0) 1)
    (if debug 
        (print "phantom 06 died"))
    (set g_md_100_phantoms true)
    (set g_md_100_wraith_phantom true)
    (set g_phantom_close false)
    (set g_100_midsave_01 true)
    (set g_100_place_04 true)
)

(script dormant void 100_midsave_01
    (sleep_until (= g_100_midsave_01 true) 1)
    (sleep_until (game_safe_to_save) 1 1200)
    (game_save)
)

(script dormant void s_sq_phantom_07_test
    (sleep_until (> (ai_task_count "obj_100_cov_main/gt_phantom") 0) 1)
    (sleep 30)
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_phantom") 0) 1)
    (if debug 
        (print "phantom 07 died"))
    (set g_sc120_music05_alt true)
    (set g_phantom_close false)
    (set g_100_cleanup_phantom true)
    (set g_100_midsave_02 true)
    (set g_md_100_final true)
)

(script dormant void 100_midsave_02
    (sleep_until (= g_100_midsave_02 true) 1)
    (sleep_until (game_safe_to_save) 1 1200)
    (game_save)
)

(script command_script void 100_phantom_flyby
    (cs_vehicle_speed 0.6)
    (cs_fly_by "ps_100_phantom_01/phan_01_approach_01")
    (ai_erase ai_current_squad)
)

(script command_script void 100_banshee_01_flyby
    (cs_vehicle_boost false)
    (cs_fly_by "ps_100_phantom_01/ban_01_approach_01")
    (ai_erase ai_current_squad)
)

(script command_script void 100_banshee_02_flyby
    (cs_vehicle_boost false)
    (cs_fly_by "ps_100_phantom_01/ban_02_approach_01")
    (ai_erase ai_current_squad)
)

(script static void ssv_dutch_vehicle_exit
    (ai_vehicle_exit "sq_dutch")
)

(script command_script void cs_phantom_06
    (if debug 
        (print "phantom 06"))
    (set phantom_06 (ai_vehicle_get_from_starting_location "sq_phantom_06/phantom"))
    (ai_place "sq_phantom_06_wraith")
    (ai_place "sq_phantom_06_cov_01")
    (ai_place "sq_phantom_06_cov_02")
    (ai_place "sq_phantom_06_jackal_sniper_01")
    (ai_place "sq_phantom_06_jackal_small")
    (ai_place "sq_phantom_06_jackal_large")
    (ai_place "sq_phantom_06_grunt")
    (ai_force_active "gr_phantom_06" true)
    (sleep 5)
    (ai_vehicle_enter_immediate "sq_phantom_06_jackal_large" phantom_06 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_06_grunt" phantom_06 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_06_cov_01" phantom_06 phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_phantom_06_cov_02" phantom_06 phantom_p_lb)
    (ai_vehicle_enter_immediate "sq_phantom_06_jackal_sniper_01" phantom_06 phantom_p_mr_f)
    (ai_vehicle_enter_immediate "sq_phantom_06_jackal_small" phantom_06 phantom_p_mr_b)
    (vehicle_load_magic phantom_06 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_06_wraith/wraith"))
    (sleep 1)
    (ai_set_objective "sq_phantom_06" "obj_100_cov_main")
    (ai_set_objective "gr_phantom_06" "obj_100_cov_main")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_06/approach_01")
    (set g_md_100_phantoms true)
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_06/approach_02")
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_06/hover_01" "ps_phantom_06/face_01" 1.0)
    (sleep 15)
    (unit_open phantom_06)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_06/drop_01" "ps_phantom_06/face_01" 1.0)
    (vehicle_unload phantom_06 phantom_p_rf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_06 phantom_p_rb)
    (sleep 85)
    (set g_phantom_close true)
    (cs_fly_to_and_face "ps_phantom_06/hover_02" "ps_phantom_06/face_02" 1.0)
    (sleep 5)
    (cs_fly_to_and_face "ps_phantom_06/drop_02" "ps_phantom_06/face_02" 1.0)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_06 phantom_p_lf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_06 phantom_p_lb)
    (sleep 85)
    (set g_md_100_wraith_phantom true)
    (cs_fly_to_and_face "ps_phantom_06/hover_03" "ps_phantom_06/face_03" 1.0)
    (sleep 5)
    (set g_phantom_close false)
    (cs_fly_to_and_face "ps_phantom_06/drop_03" "ps_phantom_06/face_03" 1.0)
    (vehicle_unload phantom_06 phantom_p_mr_f)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_06 phantom_p_mr_b)
    (sleep 85)
    (cs_fly_to_and_face "ps_phantom_06/hover_03" "ps_phantom_06/face_03" 1.0)
    (sleep 30)
    (unit_close phantom_06)
    (sleep 30)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_phantom_06/exit_01" "ps_phantom_06/face_03" 1.0)
    (sleep 30)
    (cs_fly_by "ps_phantom_06/exit_02")
    (set g_100_place_04 true)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_06/erase")
    (set g_100_midsave_01 true)
    (ai_erase ai_current_squad)
)

(script command_script void cs_phantom_07
    (if debug 
        (print "phantom 07"))
    (set phantom_07 (ai_vehicle_get_from_starting_location "sq_phantom_07/phantom"))
    (game_save)
    (ai_place "sq_phantom_07_cov_01")
    (ai_place "sq_phantom_07_cov_02")
    (ai_place "sq_phantom_07_jackal_sniper_01")
    (ai_place "sq_phantom_07_jackal_small")
    (ai_place "sq_phantom_07_jackal_large")
    (ai_place "sq_phantom_07_grunt")
    (ai_force_active "gr_phantom_07" true)
    (sleep 5)
    (ai_vehicle_enter_immediate "sq_phantom_07_jackal_large" phantom_07 phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_phantom_07_grunt" phantom_07 phantom_p_lb)
    (ai_vehicle_enter_immediate "sq_phantom_07_cov_01" phantom_07 phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_phantom_07_cov_02" phantom_07 phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_phantom_07_jackal_sniper_01" phantom_07 phantom_p_ml_f)
    (ai_vehicle_enter_immediate "sq_phantom_07_jackal_small" phantom_07 phantom_p_ml_b)
    (vehicle_load_magic phantom_07 phantom_lc (ai_vehicle_get_from_starting_location "sq_phantom_07_wraith/wraith"))
    (sleep 1)
    (ai_set_objective "sq_phantom_07" "obj_100_cov_main")
    (ai_set_objective "gr_phantom_07" "obj_100_cov_main")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_07/approach_01")
    (cs_vehicle_boost false)
    (cs_fly_by "ps_phantom_07/approach_02")
    (cs_fly_by "ps_phantom_07/approach_03")
    (cs_fly_by "ps_phantom_07/approach_04")
    (cs_vehicle_speed 0.3)
    (cs_vehicle_speed 1.0)
    (set g_sc120_music05_alt true)
    (cs_fly_to_and_face "ps_phantom_07/hover_01" "ps_phantom_07/face_01" 1.0)
    (sleep 30)
    (unit_open phantom_07)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_phantom_07/drop_01" "ps_phantom_07/face_01" 1.0)
    (vehicle_unload phantom_07 phantom_p_lf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_07 phantom_p_lb)
    (sleep 85)
    (cs_fly_to_and_face "ps_phantom_07/hover_01" "ps_phantom_07/face_01" 1.0)
    (set g_phantom_close true)
    (cs_fly_to_and_face "ps_phantom_07/hover_02" "ps_phantom_07/face_02" 1.0)
    (sleep 5)
    (cs_fly_to_and_face "ps_phantom_07/drop_02" "ps_phantom_07/face_02" 1.0)
    (vehicle_unload (ai_vehicle_get ai_current_actor) phantom_lc)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_07 phantom_p_rf)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_07 phantom_p_rb)
    (sleep 85)
    (cs_fly_by "ps_phantom_07/run_01")
    (cs_fly_to_and_face "ps_phantom_07/hover_03" "ps_phantom_07/face_03" 1.0)
    (sleep 5)
    (set g_phantom_close false)
    (cs_fly_to_and_face "ps_phantom_07/drop_03" "ps_phantom_07/face_03" 1.0)
    (vehicle_unload phantom_07 phantom_p_ml_f)
    (sleep (random_range 5 15))
    (vehicle_unload phantom_07 phantom_p_ml_b)
    (sleep 85)
    (set g_100_cleanup_phantom true)
    (cs_fly_to_and_face "ps_phantom_07/hover_03" "ps_phantom_07/face_03" 1.0)
    (sleep 30)
    (unit_close phantom_07)
    (sleep 30)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_phantom_07/exit_01")
    (cs_fly_by "ps_phantom_07/exit_02")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_phantom_07/erase")
    (set g_100_midsave_02 true)
    (set g_md_100_final true)
    (ai_erase ai_current_squad)
)

(script command_script void cs_100_sniper_left
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_100_sniper_left/run_01")
    (cs_go_to "ps_100_sniper_left/run_02")
)

(script command_script void cs_100_sniper_right
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_100_sniper_right/run_01")
    (cs_go_to "ps_100_sniper_right/run_02")
)

(script command_script void cs_100_flank_right
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_100_flank_right/run_01")
)

(script command_script void cs_100_flank_left
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_100_flank_left/run_01")
)

(script command_script void cs_100_upper_area_right
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_100_assault/upper_area_right")
)

(script command_script void cs_100_upper_area_left
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to "ps_100_assault/upper_area_left")
)

(script command_script void cs_100_wraith_shoot
    (cs_run_command_script "sq_phantom_06_wraith/gunner" abort_cs)
    (cs_enable_moving true)
    (cs_abort_on_damage true)
    (sleep_until 
        (begin
            (begin_random
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_100_wraith/p0")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_100_wraith/p1")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_100_wraith/p2")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_100_wraith/p3")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_100_wraith/p4")
                )
                (begin
                    (sleep (random_range 120 210))
                    (cs_shoot_point true "ps_100_wraith/p5")
                )
            )
            false
        )
    )
)

(script dormant void 100_cleanup
    (sleep_until (= g_100_cleanup_phantom true) 1)
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_100_cov_main") 10) 1)
    (set g_100_cleanup true)
)

(script dormant void level_end
    (sleep_until (= g_md_100_final true) 1)
    (sleep 30)
    (sleep_until (<= (ai_task_count "obj_100_cov_main/gt_100_cov_main") 0) 1)
    (set g_level_end true)
    (sleep (* 30.0 10.0))
    (sleep_until (volume_test_players "tv_level_end") 1)
    (set g_sc120_music01 false)
    (set g_sc120_music02 false)
    (set g_sc120_music03 false)
    (set g_sc120_music04 false)
    (set g_sc120_music05 false)
    (set g_sc120_music06 false)
    (set g_sc120_music015 false)
    (set g_sc120_music016 false)
    (object_destroy_type_mask 2)
    (set g_tv_sp_100 true)
    (f_end_scene sc120_out_sc "set_100" "gp_sc120_complete" "h100" "white")
    (sound_class_set_gain "“”" 0.0 0)
    (sc120_out_sc_cleanup)
)

(script dormant void zone_set_control
    (sleep_until (>= (current_zone_set) 0) 1)
    (sleep_until (>= (current_zone_set) 1) 1)
    (sleep_until (>= (current_zone_set) 2) 1)
    (if (>= (current_zone_set) 2) 
        (begin
            (if debug 
                (print "030 blocker"))
            (device_set_position_immediate "030_040_hub_door" 0.0)
            (sleep 1)
            (device_set_power "030_040_hub_door" 0.0)
            (zone_set_trigger_volume_enable "zone_set:set_030_040:*" false)
            (zone_set_trigger_volume_enable "begin_zone_set:set_030_040:*" false)
            (pda_activate_marker_named player "030_040_hub_door" "locked_0" true "locked_door")
            (object_destroy_folder "sc_030")
            (object_destroy_folder "cr_030")
        )
    )
    (sleep_until (>= (current_zone_set) 3) 1)
    (if (>= (current_zone_set) 3) 
        (begin
            (if debug 
                (print "040 blocker"))
            (device_set_position_immediate "040_100_hub_door" 0.0)
            (sleep 1)
            (device_set_power "040_100_hub_door" 0.0)
            (zone_set_trigger_volume_enable "zone_set:set_040_100:*" false)
            (zone_set_trigger_volume_enable "begin_zone_set:set_040_100:*" false)
            (pda_activate_marker_named player "040_100_hub_door" "locked_0" true "locked_door")
            (object_destroy_folder "sc_040")
            (object_destroy_folder "cr_040")
        )
    )
)

(script dormant void garbage_collect
    (sleep_until (>= g_030_mid_obj_control 2) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_030_lower" 30 30)
    (sleep_until (>= g_030_upper_obj_control 3) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_030_lower" 0 30)
    (add_recycling_volume "tv_sp_030_mid" 30 30)
    (sleep_until (>= g_040_obj_control 1) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_030_mid" 0 30)
    (sleep_until (>= g_040_obj_control 3) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_030_mid" 0 10)
    (add_recycling_volume "tv_sp_030_upper" 0 30)
    (sleep_until (>= g_040_obj_control 6) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_040" 30 30)
    (sleep_until (>= g_100_obj_control 3) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_040" 0 30)
    (sleep_until (= g_tv_sp_100_phantom true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_100_phantom" 10 15)
    (sleep_until (= g_tv_sp_100 true) 1)
    (if debug 
        (print "recycle"))
    (add_recycling_volume "tv_sp_100" 0 1)
)

(script dormant void s_pda_doors
    (pda_activate_marker_named player "dm_hub_door_01" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_02" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_03" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_04" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_05" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_06" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_07" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_08" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_09" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_10" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_hub_door_11" "locked_270" true "locked_door")
    (pda_activate_marker_named player "030_040_hub_door" "locked_0" false "locked_door")
    (pda_activate_marker_named player "040_100_hub_door" "locked_0" true "locked_door")
    (pda_activate_marker_named player "040_100_hub_door_02" "locked_90" true "locked_door")
)

(script dormant void s_coop_resume
    (sleep_until (>= g_030_mid_obj_control 1) 1)
    (if (< g_030_mid_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 1)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
    (sleep_until (>= g_030_upper_obj_control 1) 1)
    (if (< g_030_upper_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 2)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
    (sleep_until (>= g_040_obj_control 1) 1)
    (if (< g_040_obj_control 5) 
        (begin
            (f_coop_resume_unlocked "coop_resume" 3)
            (if debug 
                (print "game_insertion_point_unlock"))
        )
    )
    (sleep_until (>= (current_zone_set_fully_active) 3) 1)
    (f_coop_resume_unlocked "coop_resume" 4)
    (if debug 
        (print "game_insertion_point_unlock"))
)

(script dormant void sc120_survival_mode
    (zone_set_trigger_volume_enable "begin_zone_set:set_030_040:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_030_040:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_040_100:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_040_100:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_100" false)
    (zone_set_trigger_volume_enable "zone_set:set_100" false)
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (sleep 5)
    (switch_zone_set "set_survival")
    (pda_set_active_pda_definition "sc120_survival")
    (set string_survival_map_name "sc120")
    (set ai_obj_survival "obj_survival")
    (set ai_sur_wave_spawns "gr_survival_waves")
    (set s_sur_wave_squad_count 5)
    (set ai_sur_remaining "sq_sur_remaining")
    (set ai_sur_phantom_01 "sq_sur_phantom_01")
    (set ai_sur_phantom_02 "sq_sur_phantom_02")
    (set ai_sur_phantom_03 "sq_sur_phantom_03")
    (set ai_sur_phantom_04 none)
    (set s_sur_drop_side_01 "dual")
    (set s_sur_drop_side_02 "dual")
    (set s_sur_drop_side_03 "left")
    (set s_sur_drop_side_04 "null")
    (set ai_sur_bonus_wave "sq_sur_bonus_round_01")
    (set ai_sur_bonus_phantom "sq_sur_bonus_phantom")
    (set b_sur_bonus_round true)
    (sleep 1)
    (device_set_power "040_100_hub_door" 0.0)
    (object_set_vision_mode_render_default "040_100_hub_door" true)
    (device_set_power "040_100_hub_door_02" 0.0)
    (object_set_vision_mode_render_default "040_100_hub_door_02" true)
    (object_set_vision_mode_render_default "dm_oni_door" true)
    (object_set_vision_mode_render_default "dm_oni_door_locked" true)
    (object_set_vision_mode_render_default "sur_closet_01" true)
    (object_set_vision_mode_render_default "sur_closet_02" true)
    (object_set_vision_mode_render_default "sur_closet_03" true)
    (object_set_vision_mode_render_default "sur_closet_04" true)
    (object_destroy_folder "eq_campaign")
    (object_destroy_folder "wp_campaign")
    (object_destroy_folder "cr_100")
    (device_set_power "sur_oni_door01" 1.0)
    (device_set_position "sur_oni_door01" 1.0)
    (device_set_power "sur_oni_door02" 1.0)
    (device_set_position "sur_oni_door02" 1.0)
    (device_set_power "sur_oni_door03" 1.0)
    (device_set_position "sur_oni_door03" 1.0)
    (device_set_power "sur_oni_door04" 1.0)
    (object_set_vision_mode_render_default "sur_oni_door04" true)
    (device_set_power "sur_oni_door05" 1.0)
    (object_set_vision_mode_render_default "sur_oni_door05" true)
    (object_create_folder_anew "cr_survival_create")
    (object_destroy "campaign_sandbag_01")
    (object_destroy "campaign_sandbag_02")
    (object_destroy "campaign_sandbag_03")
    (wake survival_mode)
    (sleep 5)
)

(script command_script void cs_sur_phantom_01
    (set v_sur_phantom_01 (ai_vehicle_get_from_starting_location "sq_sur_phantom_01/pilot"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_phantom_01/pilot" true)
    (cs_fly_by "sur_phantom01_pts/p0")
    (cs_fly_by "sur_phantom01_pts/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "sur_phantom01_pts/p2" "sur_phantom01_pts/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "sur_phantom01_pts/drop" "sur_phantom01_pts/face" 1.0)
    (sleep 15)
    (f_unload_phantom v_sur_phantom_01 "dual")
    (cs_vehicle_speed 0.75)
    (cs_fly_by "sur_phantom01_pts/p2")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "sur_phantom01_pts/p3")
    (cs_vehicle_boost true)
    (cs_fly_by "sur_phantom01_pts/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_phantom_02
    (set v_sur_phantom_02 (ai_vehicle_get_from_starting_location "sq_sur_phantom_02/pilot"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_phantom_02/pilot" true)
    (cs_fly_by "sur_phantom02_pts/p0")
    (cs_fly_by "sur_phantom02_pts/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "sur_phantom02_pts/p2" "sur_phantom02_pts/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "sur_phantom02_pts/drop" "sur_phantom02_pts/face" 1.0)
    (sleep 15)
    (f_unload_phantom v_sur_phantom_02 "dual")
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "sur_phantom02_pts/p2")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "sur_phantom02_pts/p3")
    (cs_vehicle_boost true)
    (cs_fly_by "sur_phantom02_pts/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_phantom_03
    (set v_sur_phantom_03 (ai_vehicle_get_from_starting_location "sq_sur_phantom_03/pilot"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_phantom_03/pilot" true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (!= (random_range 0 5) 0)
                (<= (object_get_health (ai_vehicle_get_from_spawn_point "sq_sur_wraith_01/driver")) 0.0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_03 "single" "sq_sur_wraith_01" none))
    )
    (cs_fly_by "sur_phantom03_pts/p0")
    (cs_fly_by "sur_phantom03_pts/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "sur_phantom03_pts/p2" "sur_phantom03_pts/face" 1.0)
    (sleep 15)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "sur_phantom03_pts/drop" "sur_phantom03_pts/face" 1.0)
    (sleep 15)
    (f_unload_phantom_cargo v_sur_phantom_03 "single")
    (f_unload_phantom v_sur_phantom_03 "left")
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "sur_phantom03_pts/p2")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "sur_phantom03_pts/p3")
    (cs_vehicle_boost true)
    (cs_fly_by "sur_phantom03_pts/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_bonus_phantom
    (set v_sur_bonus_phantom (ai_vehicle_get_from_spawn_point "sq_sur_bonus_phantom/phantom"))
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
    (vehicle_hover "sq_sur_bonus_phantom" true)
    (set b_load_in_phantom false)
    (set b_sur_bonus_phantom_ready true)
    (f_unload_bonus_phantom v_sur_bonus_phantom)
    (sleep 150)
    (unit_close v_sur_bonus_phantom)
    (sleep_until b_sur_bonus_end)
    (vehicle_hover "sq_sur_bonus_phantom" false)
    (sleep 45)
    (cs_fly_to_and_face "ps_sur_phantom_bonus/p5" "ps_sur_phantom_bonus/face" 1.0)
    (cs_face true "ps_sur_phantom_bonus/face_exit")
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_face false "ps_sur_phantom_bonus/face_exit")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_sur_phantom_bonus/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_bonus/erase" 10.0)
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

(script static void sur_turret_reserve
    (print "reserving turrets")
    (ai_vehicle_reserve_seat "sur_turret01" turret_g true)
    (ai_vehicle_reserve_seat "sur_turret02" turret_g true)
)

(script static void survival_refresh_follow
    (survival_refresh_sleep)
    (ai_reset_objective "obj_survival/infantry_follow")
)

(script static void survival_hero_refresh_follow
    (survival_refresh_sleep)
    (survival_refresh_sleep)
    (ai_reset_objective "obj_survival/hero_follow")
)

(script static void sc_120_int_sc_01_sc_sh1
    (begin
        (cinematic_show_letterbox_immediate true)
        (fade_in 0.0 0.0 0.0 60)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 0 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_1" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "truck_1" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_1" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (object_hide (cinematic_scripting_get_object 0 0 21) true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_1" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (object_hide (cinematic_scripting_get_object 0 0 25) true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 27) "polarize" 0.0 0.0)
    (sleep 4)
    (cinematic_scripting_start_music 0 0 0 0)
    (sleep 349)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 1 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "driver_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "marine3_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "truck_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 12 "ar3_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 14 "scorpion_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 15 "cannon_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (object_hide (cinematic_scripting_get_object 0 0 21) true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (object_hide (cinematic_scripting_get_object 0 0 25) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 26 "scorpionturret_pewpewpews_fx_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (cinematic_scripting_start_effect 0 0 1 0 (cinematic_object_get "cin_scorpion"))
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "right_tread_position" 0.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "left_tread_position" 0.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 27) "polarize" 0.0 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "right_tread_position" -5.0 190.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "left_tread_position" -5.0 190.0)
    (sleep 29)
    (cinematic_print "custom script play")
    (begin
        (player_effect_set_max_rumble 0.1 0.1)
        (player_effect_start 1.0 1.3)
    )
    (sleep 18)
    (cinematic_scripting_start_effect 0 0 1 1 (cinematic_object_get "cin_scorpion"))
    (sleep 22)
    (player_effect_stop 1.3)
    (cinematic_print "custom script play")
    (sleep 111)
    (cinematic_scripting_start_dialogue 0 0 1 0 (cinematic_scripting_get_object 0 0 5))
    (sleep 11)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 27) "polarize" 1.0 20.0)
    (sleep 5)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 2 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "marine3_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "marine2_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 11 "ar2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 12 "ar3_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (object_hide (cinematic_scripting_get_object 0 0 21) true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (object_hide (cinematic_scripting_get_object 0 0 25) true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 49)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 3 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "marine1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 "marine4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_4" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "truck_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "ar1_4" true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 13 "ar4_4" true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_4" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (object_hide (cinematic_scripting_get_object 0 0 21) true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_4" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (object_hide (cinematic_scripting_get_object 0 0 25) true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 1)
    (cinematic_scripting_start_dialogue 0 0 3 0 (cinematic_scripting_get_object 0 0 3))
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 4 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 4)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "marine1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 "marine4_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_5" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_5" true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "ar1_5" true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 13 "ar4_5" true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_5" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (object_hide (cinematic_scripting_get_object 0 0 21) true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_5" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (object_hide (cinematic_scripting_get_object 0 0 25) true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 27) "polarize" 1.0 0.0)
    (sleep 33)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 27) "polarize" 0.0 20.0)
    (sleep 30)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 5 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 5)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (object_hide (cinematic_scripting_get_object 0 0 21) true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (object_hide (cinematic_scripting_get_object 0 0 25) true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 69)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 6 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 6)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_7" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (object_hide (cinematic_scripting_get_object 0 0 9) true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 17 "wraith_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 18 "wraith_mortar_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 19 "wraith_mortar_fx_7" true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 21 "the_sun_7" true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_7" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 25 "wraithturret_pewpewpews_fx_7" true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (sleep 70)
    (cinematic_scripting_start_effect 0 0 6 0 (cinematic_object_get "cin_wraithfx"))
    (cinematic_scripting_start_effect 0 0 6 1 (cinematic_object_get "cin_wraith_mortar"))
    (sleep 7)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 7 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 7)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "truck_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 17 "wraith_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 18 "wraith_mortar_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 19 "wraith_mortar_fx_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 20) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 21 "the_sun_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 25 "wraithturret_pewpewpews_fx_8" true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 25) "firing" 1.0 0.0)
    (sleep 52)
    (cinematic_scripting_start_dialogue 0 0 7 0 (cinematic_scripting_get_object 0 0 5))
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 8 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 8)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_9" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "truck_9" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_9" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 19 "wraith_mortar_fx_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 20 "hubcap_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 21 "the_sun_9" true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_9" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 25 "wraithturret_pewpewpews_fx_9" true)
    (object_hide (cinematic_scripting_get_object 0 0 26) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_9" true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 25) "firing" 1.0 0.0)
    (sleep 5)
    (cinematic_scripting_start_effect 0 0 8 0 (cinematic_object_get "cin_wraithfx"))
    (sleep 2)
    (begin
        (player_effect_set_max_rumble 0.2 0.2)
        (player_effect_start 1.0 0.0)
    )
    (cinematic_print "custom script play")
    (sleep 1)
    (player_effect_stop 1.0)
    (cinematic_print "custom script play")
    (sleep 2)
    (cinematic_scripting_start_effect 0 0 8 1 (cinematic_object_get "car"))
    (sleep 16)
    (cinematic_scripting_start_dialogue 0 0 8 0 (cinematic_scripting_get_object 0 0 5))
    (sleep 22)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 25) "firing")
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh10
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 9 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 9)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (object_hide (cinematic_scripting_get_object 0 0 0) true)
    (object_hide (cinematic_scripting_get_object 0 0 1) true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "mickey_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 6) true)
    (object_hide (cinematic_scripting_get_object 0 0 7) true)
    (object_hide (cinematic_scripting_get_object 0 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "truck_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 10) true)
    (object_hide (cinematic_scripting_get_object 0 0 11) true)
    (object_hide (cinematic_scripting_get_object 0 0 12) true)
    (object_hide (cinematic_scripting_get_object 0 0 13) true)
    (object_hide (cinematic_scripting_get_object 0 0 14) true)
    (object_hide (cinematic_scripting_get_object 0 0 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 20 "hubcap_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 21) true)
    (object_hide (cinematic_scripting_get_object 0 0 22) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_10" true)
    (object_hide (cinematic_scripting_get_object 0 0 24) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 25 "wraithturret_pewpewpews_fx_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 26 "scorpionturret_pewpewpews_fx_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 27 "helmet_mickey_10" true)
    (cinematic_lights_initialize_for_shot 9)
    (cinematic_clips_initialize_for_shot 9)
    (sleep 50)
    (cinematic_scripting_start_dialogue 0 0 9 0 (cinematic_scripting_get_object 0 0 5))
    (sleep 36)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc_120_int_sc_01_sc_sh11
    (begin
        (cinematic_show_letterbox_immediate false)
        (fade_in 1.0 1.0 1.0 10)
        (cinematic_hud_on)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 10 "fl_sc120_int_sc")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 10)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_sc" "fl_sc120_int_sc")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "driver_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "marine3_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "marine2_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "marine1_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 "marine4_11" true)
    (object_hide (cinematic_scripting_get_object 0 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "barrier01_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "barrier02_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "car_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "truck_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "ar1_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 11 "ar2_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 12 "ar3_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 13 "ar4_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 14 "scorpion_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 15 "cannon_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 16 "smg_11" true)
    (object_hide (cinematic_scripting_get_object 0 0 17) true)
    (object_hide (cinematic_scripting_get_object 0 0 18) true)
    (object_hide (cinematic_scripting_get_object 0 0 19) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 20 "hubcap_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 21 "the_sun_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 22 "fp_5finger_mickey_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 23 "scorpion_fire_fx_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 24 "assaultrifle_pewpewpews_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 25 "wraithturret_pewpewpews_fx_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 26 "scorpionturret_pewpewpews_fx_11" true)
    (object_hide (cinematic_scripting_get_object 0 0 27) true)
    (cinematic_lights_initialize_for_shot 10)
    (cinematic_clips_initialize_for_shot 10)
    (cinematic_scripting_start_effect 0 0 10 0 (cinematic_object_get "cin_scorpion"))
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "right_tread_position" 1.0 0.0)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 25) "firing")
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 24) "firing")
    (cinematic_scripting_start_music 0 0 10 0)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 26) "firing")
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "left_tread_position" 1.0 0.0)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 12) "firing")
    (sleep 1)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "right_tread_position" -0.5 83.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 14) "left_tread_position" -0.5 83.0)
    (sleep 4)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 26) "firing" 1.0 0.0)
    (sleep 4)
    (cinematic_scripting_start_dialogue 0 0 10 0 (cinematic_scripting_get_object 0 0 2))
    (sleep 1)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 25) "firing" 1.0 0.0)
    (sleep 10)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 25) "firing")
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 25) "firing" 1.0 0.0)
    (sleep 15)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 26) "firing")
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 25) "firing")
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 24) "firing" 1.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 12) "firing" 1.0 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 26) "firing" 1.0 0.0)
    (sleep 15)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 26) "firing")
    (sleep 5)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 24) "firing")
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 12) "firing")
    (sleep 5)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 12) "firing" 1.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 24) "firing" 1.0 0.0)
    (sleep 10)
    (cinematic_scripting_start_effect 0 0 10 1 (cinematic_object_get "cin_scorpion_cannon"))
    (sleep 5)
    (cinematic_print "custom script play")
    (begin
        (player_effect_set_max_rumble 0.2 0.2)
        (player_effect_start 1.0 0.0)
    )
    (sleep 1)
    (cinematic_print "custom script play")
    (player_effect_stop 0.5)
    (sleep 9)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 12) "firing")
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 24) "firing")
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 26) "firing" 1.0 0.0)
    (sleep 55)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 26) "firing")
    (sleep 2)
    (cinematic_scripting_start_dialogue 0 0 10 1 (cinematic_scripting_get_object 0 0 22))
    (sleep 13)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 12) "firing" 1.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 24) "firing" 1.0 0.0)
    (sleep 24)
    (fade_out 1.0 1.0 1.0 5)
    (cinematic_print "custom script play")
    (sleep 1)
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 12) "firing")
    (object_clear_function_variable (cinematic_scripting_get_object 0 0 24) "firing")
    (sleep 4)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc_120_int_sc_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (sc_120_int_sc_01_sc_sh1)
    (sc_120_int_sc_01_sc_sh2)
    (sc_120_int_sc_01_sc_sh3)
    (sc_120_int_sc_01_sc_sh4)
    (sc_120_int_sc_01_sc_sh5)
    (sc_120_int_sc_01_sc_sh6)
    (sc_120_int_sc_01_sc_sh7)
    (sc_120_int_sc_01_sc_sh8)
    (sc_120_int_sc_01_sc_sh9)
    (sc_120_int_sc_01_sc_sh10)
    (sc_120_int_sc_01_sc_sh11)
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
    (cinematic_scripting_destroy_object 0 0 15)
    (cinematic_scripting_destroy_object 0 0 16)
    (cinematic_scripting_destroy_object 0 0 17)
    (cinematic_scripting_destroy_object 0 0 18)
    (cinematic_scripting_destroy_object 0 0 19)
    (cinematic_scripting_destroy_object 0 0 20)
    (cinematic_scripting_destroy_object 0 0 21)
    (cinematic_scripting_destroy_object 0 0 22)
    (cinematic_scripting_destroy_object 0 0 23)
    (cinematic_scripting_destroy_object 0 0 24)
    (cinematic_scripting_destroy_object 0 0 25)
    (cinematic_scripting_destroy_object 0 0 26)
    (cinematic_scripting_destroy_object 0 0 27)
)

(script static void sc120_int_sc_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void begin_sc120_int_sc_debug
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

(script static void end_sc120_int_sc_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc120_int_sc_debug
    (begin_sc120_int_sc_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc_120_int_sc_01_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc120_int_sc_debug)
)

(script static void begin_sc120_int_sc
    (cinematic_zone_activate 0)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
)

(script static void end_sc120_int_sc
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_int_sc
    (begin_sc120_int_sc)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc_120_int_sc_01_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc120_int_sc)
)

(script static void sc120_out_sc_01_01_sh1
    (object_destroy "dm_oni_door")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 0 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc120_out_gate_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 7) "polarize" 0.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 1 0 0 0)
    (sleep 140)
    (cinematic_scripting_start_dialogue 1 0 0 0 (cinematic_scripting_get_object 1 0 0))
    (sleep 40)
    (cinematic_scripting_start_dialogue 1 0 0 1 (cinematic_scripting_get_object 1 0 1))
    (sleep 4)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 7) "polarize" 1.0 30.0)
    (sleep 20)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 1 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 1)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 40)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 2 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 2)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_3" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc120_out_gate_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 8 "super_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "location" 0.5 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "timestamp" 0.4 0.0)
    (cinematic_scripting_start_screen_effect 1 0 2 0)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.0 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "status" 0.8 0.0)
    (sleep 7)
    (cinematic_scripting_start_dialogue 1 0 2 0 (cinematic_scripting_get_object 1 0 0))
    (sleep 13)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "timestamp" 0.5 0.0)
    (sleep 10)
    (cinematic_scripting_start_screen_effect 1 0 2 1)
    (sleep 7)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.7 0.0)
    (cinematic_scripting_start_screen_effect 1 0 2 2)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.3 0.0)
    (sleep 1)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "timestamp" 0.4 0.0)
    (sleep 12)
    (cinematic_scripting_start_screen_effect 1 0 2 3)
    (sleep 8)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "timestamp" 0.5 0.0)
    (sleep 2)
    (cinematic_scripting_start_dialogue 1 0 2 1 (cinematic_scripting_get_object 1 0 1))
    (sleep 9)
    (cinematic_scripting_stop_screen_effect 1 0 2 0)
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 3 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 3)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_4" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc120_out_gate_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 8 "super_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "location" 0.7 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.3 0.0)
    (cinematic_scripting_start_screen_effect 1 0 3 0)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "timestamp" 0.3 0.0)
    (sleep 23)
    (cinematic_scripting_start_screen_effect 1 0 3 1)
    (sleep 11)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_screen_effect 1 0 3 2)
    (sleep 43)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.2 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 8) "eyes" 0.5 0.0)
    (sleep 27)
    (cinematic_scripting_stop_screen_effect 1 0 3 0)
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 4 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 4)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_5" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc120_out_gate_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_5" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (sleep 44)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 5 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 5)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_6" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_6" true)
    (object_hide (cinematic_scripting_get_object 1 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_6" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 15)
    (object_set_function_variable (cinematic_scripting_get_object 1 0 7) "polarize" 0.0 30.0)
    (sleep 15)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 6 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 6)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_technician_sc120_out_sc_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc120_out_gate_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_7" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (sleep 51)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 7 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 7)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (object_hide (cinematic_scripting_get_object 1 0 0) true)
    (object_hide (cinematic_scripting_get_object 1 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_technician_sc120_out_sc_8" true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (object_hide (cinematic_scripting_get_object 1 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc120_out_gate_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_8" true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (sleep 12)
    (cinematic_scripting_start_dialogue 1 0 7 0 (cinematic_scripting_get_object 1 0 2))
    (sleep 54)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 8 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 8)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_technician_sc120_out_sc_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_9" true)
    (object_hide (cinematic_scripting_get_object 1 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_9" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (sleep 35)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh10
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 9 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 9)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (object_hide (cinematic_scripting_get_object 1 0 0) true)
    (object_hide (cinematic_scripting_get_object 1 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_technician_sc120_out_sc_10" true)
    (object_hide (cinematic_scripting_get_object 1 0 3) true)
    (object_hide (cinematic_scripting_get_object 1 0 4) true)
    (object_hide (cinematic_scripting_get_object 1 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_10" true)
    (object_hide (cinematic_scripting_get_object 1 0 7) true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 9)
    (cinematic_clips_initialize_for_shot 9)
    (sleep 52)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh11
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 10 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 10)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_11" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_11" true)
    (object_hide (cinematic_scripting_get_object 1 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_11" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_11" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 10)
    (cinematic_clips_initialize_for_shot 10)
    (sleep 8)
    (cinematic_scripting_start_dialogue 1 0 10 0 (cinematic_scripting_get_object 1 0 0))
    (sleep 96)
    (cinematic_scripting_start_dialogue 1 0 10 1 (cinematic_scripting_get_object 1 0 1))
    (sleep 17)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc_01_01_sh12
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 11 "sc120_out_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 11)
    (cinematic_object_create_cinematic_anchor "sc120_out_cinematic" "sc120_out_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_dutch_sc120_out_sc_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_mickey_sc120_out_sc_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_technician_sc120_out_sc_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "dutch_smg_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "mickey_smg_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "sc120_out_gate_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "light_marker_12" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "mickey_helmet_12" true)
    (object_hide (cinematic_scripting_get_object 1 0 8) true)
    (cinematic_lights_initialize_for_shot 11)
    (cinematic_clips_initialize_for_shot 11)
    (sleep 219)
    (cinematic_scripting_stop_music 1 0 11 0)
    (sleep 91)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 60)
    (cinematic_print "custom script play")
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc120_out_sc_01_01
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (sc120_out_sc_01_01_sh1)
    (sc120_out_sc_01_01_sh2)
    (sc120_out_sc_01_01_sh3)
    (sc120_out_sc_01_01_sh4)
    (sc120_out_sc_01_01_sh5)
    (sc120_out_sc_01_01_sh6)
    (sc120_out_sc_01_01_sh7)
    (sc120_out_sc_01_01_sh8)
    (sc120_out_sc_01_01_sh9)
    (sc120_out_sc_01_01_sh10)
    (sc120_out_sc_01_01_sh11)
    (sc120_out_sc_01_01_sh12)
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

(script static void sc120_out_sc_cleanup
    (cinematic_scripting_clean_up 1)
)

(script static void begin_sc120_out_sc_debug
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

(script static void end_sc120_out_sc_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 1)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc120_out_sc_debug
    (begin_sc120_out_sc_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc120_out_sc_01_01)
    (sound_class_set_gain "" 0.0 0)
    (end_sc120_out_sc_debug)
)

(script static void begin_sc120_out_sc
    (cinematic_zone_activate 1)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
)

(script static void end_sc120_out_sc
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_sc
    (begin_sc120_out_sc)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc120_out_sc_01_01)
    (sound_class_set_gain "" 0.0 0)
    (end_sc120_out_sc)
)

