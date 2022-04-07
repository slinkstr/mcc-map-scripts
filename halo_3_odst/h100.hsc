; Decompiled with Blamite
; Source file: h100.hsc
; Start time: 4/7/2022 7:36:27
; Decompilation finished in ~0.0093046s
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
(global boolean g_music_h100_01 false)
(global boolean g_music_h100_015 false)
(global boolean g_music_h100_02 false)
(global boolean g_music_h100_03 false)
(global boolean g_music_h100_04 false)
(global boolean g_music_h100_05 false)
(global boolean g_music_h100_06 false)
(global boolean g_music_h100_07 false)
(global boolean g_music_h100_08 false)
(global boolean g_music_h100_09 false)
(global boolean g_music_h100_10 false)
(global boolean g_music_h100_11 false)
(global boolean g_music_h100_12 false)
(global boolean g_music_h100_13 false)
(global boolean g_music_h100_14 false)
(global boolean g_music_h100_15 false)
(global short s_h100_music_distance 50)
(global looping_sound music_battle "levels\atlas\h100\music\h100_music400")
(global looping_sound music_beacon "levels\atlas\h100\music\h100_music300")
(global looping_sound music_h100_intro "levels\atlas\h100\music\h100_music100")
(global looping_sound music_sc100 "levels\atlas\h100\music\h100_music100")
(global looping_sound music_sc110 "levels\atlas\h100\music\h100_music110")
(global looping_sound music_sc120 "levels\atlas\h100\music\h100_music120")
(global looping_sound music_sc130 "levels\atlas\h100\music\h100_music130")
(global looping_sound music_sc140 "levels\atlas\h100\music\h100_music140")
(global looping_sound music_sc150 "levels\atlas\h100\music\h100_music150")
(global looping_sound music_ambient "levels\atlas\h100\music\h100_music200")
(global boolean b_h100_ambient_set true)
(global boolean b_h100_ambient_200 true)
(global boolean b_h100_ambient_201 true)
(global boolean b_h100_ambient_202 true)
(global boolean b_h100_ambient_203 true)
(global boolean b_h100_ambient_204 true)
(global boolean b_h100_ambient_205 true)
(global boolean b_h100_ambient_206 true)
(global boolean b_h100_ambient_207 true)
(global boolean b_h100_ambient_400 true)
(global boolean b_h100_ambient_401 true)
(global boolean b_h100_ambient_402 true)
(global boolean b_h100_ambient_403 true)
(global boolean b_h100_ambient_405 true)
(global boolean b_h100_ambient_406 true)
(global boolean b_h100_ambient_407 true)
(global boolean b_h100_ambient_408 true)
(global boolean b_h100_ambient_409 true)
(global boolean b_h100_ambient_410 true)
(global ai brute_01 none)
(global ai brute_02 none)
(global ai brute_03 none)
(global ai brute_04 none)
(global ai brute_captain none)
(global ai engineer_01 none)
(global ai engineer_02 none)
(global ai engineer_03 none)
(global ai engineer_04 none)
(global ai grunt_01 none)
(global ai grunt_02 none)
(global ai grunt_03 none)
(global ai grunt_04 none)
(global short s_h100_vs_eng_dialogue 0)
(global animation_graph ag_brute_eng_bomb "objects\characters\brute\cinematics\vignettes\h100_va_bomb\h100_va_bomb")
(global animation_graph ag_engineer_bomb "objects\characters\engineer\cinematics\vignettes\h100_va_bomb\h100_va_bomb")
(global boolean editor false)
(global boolean g_play_cinematics true)
(global boolean g_player_training true)
(global boolean debug true)
(global boolean dialogue true)
(global boolean b_music true)
(global short g_insertion_index 0)
(global short g_sc110_obj_control 0)
(global short g_sc120_obj_control 0)
(global short g_sc130_obj_control 0)
(global boolean g_sc120_camp_breach false)
(global boolean g_sc120_direct_path true)
(global boolean g_sc130_direct_path true)
(global short g_player_start_pitch -16)
(global boolean g_null false)
(global real g_nav_offset 0.55)
(global vehicle sc130_phantom_02 none)
(global boolean ps_sc130_phantom_02_01 true)
(global boolean ps_sc130_phantom_02_02 true)
(global boolean ps_sc130_phantom_02_03 true)
(global vehicle sc130_phantom_03 none)
(global boolean ps_sc130_phantom_03_01 true)
(global boolean ps_sc130_phantom_03_02 true)
(global boolean ps_sc130_phantom_03_03 true)
(global short s_amb_phantom_path 0)
(global short g_start_pitch_l100 -52)
(global looping_sound sfx_chapter_fx "sound\game_sfx\pda\pda_zooming\pda_zooming")
(global sound sfx_virgil_in "sound\device_machines\virgil\virgil_in")
(global sound sfx_virgil_out "sound\device_machines\virgil\virgil_out")
(global looping_sound sfx_servo_loop "sound\device_machines\servo_looping\servo_looping")
(global sound sfx_timer "sound\game_sfx\ui\transition_beeps")
(global sound sfx_stinger "sound\game_sfx\ui\target_point_collect")
(global sound sfx_phone_impulse "sound\levels\temp\prototypes\h100\phone_ring_looping\track1\loop")
(global boolean b_l100_player0_task true)
(global boolean b_l100_player1_task true)
(global boolean b_l100_player2_task true)
(global boolean b_l100_player3_task true)
(global vehicle v_l100_phantom_01 none)
(global vehicle v_l100_phantom_02 none)
(global vehicle v_l100_phantom_03 none)
(global short s_cy_obj_control 0)
(global short s_bldg_obj_control 0)
(global boolean b_h100_purpose_complete false)
(global boolean b_pda_continue false)
(global boolean b_l100_access false)
(global short g_start_pitch_l150 -14)
(global vehicle v_sr_phantom_l150 none)
(global short s_sc100_complete 0)
(global short s_sc110_complete 0)
(global short s_sc120_complete 0)
(global short s_sc130_complete 0)
(global short s_sc140_complete 0)
(global short s_sc150_complete 0)
(global short s_h100_current_zone_set 100)
(global boolean b_h100_000_active false)
(global boolean b_h100_010_active false)
(global boolean b_h100_030_active false)
(global boolean b_h100_040_active false)
(global boolean b_h100_050_active false)
(global boolean b_h100_060_active false)
(global boolean b_h100_080_active false)
(global boolean b_h100_090_active false)
(global boolean b_h100_100_active false)
(global boolean b_h100_oni_active false)
(global boolean b_h100_000_objects_created false)
(global boolean b_h100_030_objects_created false)
(global boolean b_h100_040_objects_created false)
(global boolean b_h100_050_objects_created false)
(global boolean b_h100_060_objects_created false)
(global boolean b_h100_080_objects_created false)
(global boolean b_h100_090_objects_created false)
(global boolean b_h100_100_objects_created false)
(global boolean b_h100_oni_objects_created false)
(global short s_small_sp_loop_ai_limit 8)
(global short s_large_sp_loop_ai_limit 16)
(global short s_small_enc_ai_limit 8)
(global short s_small_sp_ai_limit 13)
(global short s_large_enc_ai_limit 8)
(global short s_large_sp_ai_limit 21)
(global short k_000_squad_limit 20)
(global short k_030_squad_limit 20)
(global short k_040_squad_limit 20)
(global short k_050_squad_limit 20)
(global short k_060_squad_limit 20)
(global short k_080_squad_limit 20)
(global boolean b_000_squad_spawn true)
(global boolean b_030_squad_spawn true)
(global boolean b_040_squad_spawn true)
(global boolean b_050_squad_spawn true)
(global boolean b_060_squad_spawn true)
(global boolean b_080_squad_spawn true)
(global short s_000_squad_count 0)
(global short s_030_squad_count 0)
(global short s_040_squad_count 0)
(global short s_050_squad_count 0)
(global short s_060_squad_count 0)
(global short s_080_squad_count 0)
(global vehicle v_080_phantom_01 none)
(global vehicle v_sur_b_wraith none)
(global short s_arg_player_id 0)
(global vehicle ai_ghost_01 none)
(global vehicle ai_ghost_02 none)
(global boolean b_h100_return_vehicle true)
(global short s_h100_return_ghost_count 0)
(global short s_h100_return_mongoose_count 0)
(global vehicle v_h100_cache_vehicle none)


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
                (if (= (random_range 0 4) 0) 
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
    (kill_volume_enable "kill_sur_room_01")
    (kill_volume_enable "kill_sur_room_02")
    (kill_volume_enable "kill_sur_room_03")
    (kill_volume_enable "kill_sur_room_04")
    (kill_volume_enable "kill_sur_room_05")
    (kill_volume_enable "kill_sur_room_06")
    (kill_volume_enable "kill_sur_room_07")
    (kill_volume_enable "kill_sur_room_08")
    (kill_volume_enable "kill_sur_b_room_01")
    (kill_volume_enable "kill_sur_b_room_02")
    (kill_volume_enable "kill_sur_b_room_03")
    (kill_volume_enable "kill_sur_b_room_04")
    (kill_volume_enable "kill_sur_b_room_06")
    (kill_volume_enable "kill_sur_b_room_07")
    (kill_volume_enable "kill_sur_b_room_08")
    (kill_volume_enable "kill_sur_b_room_06b")
    (kill_volume_enable "kill_sur_b_room_03b")
    (kill_volume_enable "kill_sur_a_oob_01")
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
    (kill_volume_disable "kill_sur_b_room_01")
    (kill_volume_disable "kill_sur_b_room_02")
    (kill_volume_disable "kill_sur_b_room_03")
    (kill_volume_disable "kill_sur_b_room_04")
    (kill_volume_disable "kill_sur_b_room_06")
    (kill_volume_disable "kill_sur_b_room_07")
    (kill_volume_disable "kill_sur_b_room_08")
    (kill_volume_disable "kill_sur_b_room_06b")
    (kill_volume_disable "kill_sur_b_room_03b")
    (kill_volume_disable "kill_sur_a_oob_01")
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

(script dormant void music_h100_01
    (sleep_until g_music_h100_01 1)
    (if b_music 
        (print "start music h100_01"))
    (sound_looping_start "levels\atlas\h100\music\h100_music01" none 1.0)
    (sleep_until (not g_music_h100_01) 1)
    (if b_music 
        (print "stop music h100_01"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music01")
)

(script dormant void music_h100_015
    (sleep_until g_music_h100_015 1)
    (if b_music 
        (print "start music h100_015"))
    (sound_looping_start "levels\atlas\h100\music\h100_music015" none 1.0)
    (sleep_until (not g_music_h100_015) 1)
    (if b_music 
        (print "stop music h100_015"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music015")
)

(script dormant void music_h100_02
    (sleep_until g_music_h100_02 1)
    (if b_music 
        (print "start music h100_02"))
    (sound_looping_start "levels\atlas\h100\music\h100_music02" none 1.0)
    (sleep_until (not g_music_h100_02) 1)
    (if b_music 
        (print "stop music h100_02"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music02")
)

(script dormant void music_h100_03
    (sleep_until g_music_h100_03 1)
    (if b_music 
        (print "start music h100_03"))
    (sound_looping_start "levels\atlas\h100\music\h100_music03" none 1.0)
    (sleep_until (not g_music_h100_03) 1)
    (if b_music 
        (print "stop music h100_03"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music03")
)

(script dormant void music_h100_04
    (sleep_until g_music_h100_04 1)
    (if b_music 
        (print "start music h100_04"))
    (sound_looping_start "levels\atlas\h100\music\h100_music04" none 1.0)
    (sleep_until (not g_music_h100_04) 1)
    (if b_music 
        (print "stop music h100_04"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music04")
)

(script dormant void music_h100_05
    (sleep_until g_music_h100_05 1)
    (if b_music 
        (print "start music h100_05"))
    (sound_looping_start "levels\atlas\h100\music\h100_music05" none 1.0)
    (sleep_until (not g_music_h100_05) 1)
    (if b_music 
        (print "stop music h100_05"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music05")
)

(script dormant void music_h100_06
    (sleep_until g_music_h100_06 1)
    (if b_music 
        (print "start music h100_06"))
    (sound_looping_start "levels\atlas\h100\music\h100_music06" none 1.0)
    (sleep_until (not g_music_h100_06) 1)
    (if b_music 
        (print "stop music h100_06"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music06")
)

(script dormant void music_h100_07
    (sleep_until g_music_h100_07 1)
    (if b_music 
        (print "start music h100_07"))
    (sound_looping_start "levels\atlas\h100\music\h100_music07" none 1.0)
    (sleep_until (not g_music_h100_07) 1)
    (if b_music 
        (print "stop music h100_07"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music07")
)

(script dormant void music_h100_09
    (sleep_until g_music_h100_09 1)
    (if b_music 
        (print "start music h100_09"))
    (sound_looping_start "levels\atlas\h100\music\h100_music09" none 1.0)
    (sleep_until (not g_music_h100_09) 1)
    (if b_music 
        (print "stop music h100_09"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music09")
)

(script dormant void music_h100_10
    (sleep_until g_music_h100_10 1)
    (if b_music 
        (print "start music h100_10"))
    (sound_looping_start "levels\atlas\h100\music\h100_music10" none 1.0)
    (sleep_until (not g_music_h100_10) 1)
    (if b_music 
        (print "stop music h100_10"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music10")
)

(script dormant void music_h100_11
    (sleep_until g_music_h100_11 1)
    (if b_music 
        (print "start music h100_11"))
    (sound_looping_start "levels\atlas\h100\music\h100_music11" none 1.0)
    (sleep_until (not g_music_h100_11) 1)
    (if b_music 
        (print "stop music h100_11"))
    (sound_looping_stop "levels\atlas\h100\music\h100_music11")
)

(script static void h100_set_intro_music
    (cond
        ((= (gp_integer_get "gp_current_scene") 100)
            (set music_h100_intro music_sc100)
        )
        ((= (gp_integer_get "gp_current_scene") 110)
            (set music_h100_intro music_sc110)
        )
        ((= (gp_integer_get "gp_current_scene") 120)
            (set music_h100_intro music_sc120)
        )
        ((= (gp_integer_get "gp_current_scene") 130)
            (set music_h100_intro music_sc130)
        )
        ((= (gp_integer_get "gp_current_scene") 140)
            (set music_h100_intro music_sc140)
        )
        ((= (gp_integer_get "gp_current_scene") 150)
            (set music_h100_intro music_sc150)
        )
    )
)

(script dormant void h100_ambient_music
    (sleep_until 
        (begin
            (sleep (* 30.0 60.0 (/ (random_range 40 61) 10.0)))
            (sleep_until (not (h100_player_in_distance)))
            (h100_set_ambient_music)
            (sleep 1)
            (sound_looping_start music_ambient none 1.0)
            false
        )
    )
)

(script static void h100_set_ambient_music
    (begin_random
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_200
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_200 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music200")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_201
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_201 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music201")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_202
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_202 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music202")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_203
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_203 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music203")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_204
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_204 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music204")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_205
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_205 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music205")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_206
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_206 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music206")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_207
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_207 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music207")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_400
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_400 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music400")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_401
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_401 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music401")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_402
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_402 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music402")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_403
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_403 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music403")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_405
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_405 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music405")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_406
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_406 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music406")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_407
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_407 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music407")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_408
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_408 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music408")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_409
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_409 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music409")
                )
        )
        (if 
            (and
                b_h100_ambient_set
                b_h100_ambient_410
            ) 
                (begin
                    (set b_h100_ambient_set false)
                    (set b_h100_ambient_410 false)
                    (set music_ambient "levels\atlas\h100\music\h100_music410")
                )
        )
    )
    (sleep 1)
    (if 
        (and
            (= b_h100_ambient_200 false)
            (= b_h100_ambient_201 false)
            (= b_h100_ambient_202 false)
            (= b_h100_ambient_203 false)
            (= b_h100_ambient_204 false)
            (= b_h100_ambient_205 false)
            (= b_h100_ambient_206 false)
            (= b_h100_ambient_207 false)
            (= b_h100_ambient_400 false)
            (= b_h100_ambient_401 false)
            (= b_h100_ambient_402 false)
            (= b_h100_ambient_403 false)
            (= b_h100_ambient_405 false)
            (= b_h100_ambient_406 false)
            (= b_h100_ambient_407 false)
            (= b_h100_ambient_408 false)
            (= b_h100_ambient_409 false)
            (= b_h100_ambient_410 false)
        ) 
            (begin
                (set b_h100_ambient_200 true)
                (set b_h100_ambient_201 true)
                (set b_h100_ambient_202 true)
                (set b_h100_ambient_203 true)
                (set b_h100_ambient_204 true)
                (set b_h100_ambient_205 true)
                (set b_h100_ambient_206 true)
                (set b_h100_ambient_207 true)
                (set b_h100_ambient_400 true)
                (set b_h100_ambient_401 true)
                (set b_h100_ambient_402 true)
                (set b_h100_ambient_403 true)
                (set b_h100_ambient_405 true)
                (set b_h100_ambient_406 true)
                (set b_h100_ambient_407 true)
                (set b_h100_ambient_408 true)
                (set b_h100_ambient_409 true)
                (set b_h100_ambient_410 true)
            )
    )
    (set b_h100_ambient_set true)
)

(script dormant void h100_battle_music
    (sleep 1)
)

(script dormant void h100_beacon_music
    (sleep_until 
        (begin
            (sleep_until (h100_player_in_distance))
            (if debug 
                (print "*** start beacon music ***"))
            (sound_looping_start music_beacon none 1.0)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (h100_player_in_beacon)
                            (h100_all_players_outside_dist)
                        )
                    )
                    (if (h100_player_in_beacon) 
                        (begin
                            (if debug 
                                (print "*** set beacon alternate ***"))
                            (sound_looping_set_alternate music_beacon true)
                            (sleep_until (h100_player_outside_beacon))
                            (if debug 
                                (print "*** turn off beacon alternate ***"))
                            (sound_looping_set_alternate music_beacon false)
                        )
                    )
                    (h100_all_players_outside_dist)
                )
            )
            (if debug 
                (print "*** stop beacon music ****"))
            (sound_looping_stop music_beacon)
            false
        )
    )
)

(script static boolean h100_player_in_distance
    (or
        (and
            (pda_beacon_is_any_selected (players) "fl_beacon_sc100")
            (<= (objects_distance_to_flag (players) "fl_beacon_sc100") s_h100_music_distance)
        )
        (and
            (pda_beacon_is_any_selected (players) "fl_beacon_sc110")
            (<= (objects_distance_to_flag (players) "fl_beacon_sc110") s_h100_music_distance)
        )
        (and
            (pda_beacon_is_any_selected (players) "fl_beacon_sc120")
            (<= (objects_distance_to_flag (players) "fl_beacon_sc120") s_h100_music_distance)
        )
        (and
            (pda_beacon_is_any_selected (players) "fl_beacon_sc130")
            (<= (objects_distance_to_flag (players) "fl_beacon_sc130") s_h100_music_distance)
        )
        (and
            (pda_beacon_is_any_selected (players) "fl_beacon_sc140")
            (<= (objects_distance_to_flag (players) "fl_beacon_sc140") s_h100_music_distance)
        )
        (and
            (pda_beacon_is_any_selected (players) "fl_beacon_sc150")
            (<= (objects_distance_to_flag (players) "fl_beacon_sc150") s_h100_music_distance)
        )
    )
)

(script static boolean h100_all_players_outside_dist
    (and
        (or
            (not (pda_beacon_is_any_selected (players) "fl_beacon_sc100"))
            (>= (objects_distance_to_flag (players) "fl_beacon_sc100") s_h100_music_distance)
        )
        (or
            (not (pda_beacon_is_any_selected (players) "fl_beacon_sc110"))
            (>= (objects_distance_to_flag (players) "fl_beacon_sc110") s_h100_music_distance)
        )
        (or
            (not (pda_beacon_is_any_selected (players) "fl_beacon_sc120"))
            (>= (objects_distance_to_flag (players) "fl_beacon_sc120") s_h100_music_distance)
        )
        (or
            (not (pda_beacon_is_any_selected (players) "fl_beacon_sc130"))
            (>= (objects_distance_to_flag (players) "fl_beacon_sc130") s_h100_music_distance)
        )
        (or
            (not (pda_beacon_is_any_selected (players) "fl_beacon_sc140"))
            (>= (objects_distance_to_flag (players) "fl_beacon_sc140") s_h100_music_distance)
        )
        (or
            (not (pda_beacon_is_any_selected (players) "fl_beacon_sc150"))
            (>= (objects_distance_to_flag (players) "fl_beacon_sc150") s_h100_music_distance)
        )
    )
)

(script static boolean h100_player_in_beacon
    (or
        (player_inside_active_beacon (player0))
        (player_inside_active_beacon (player1))
        (player_inside_active_beacon (player2))
        (player_inside_active_beacon (player3))
    )
)

(script static boolean h100_player_outside_beacon
    (and
        (not (player_inside_active_beacon (player0)))
        (not (player_inside_active_beacon (player1)))
        (not (player_inside_active_beacon (player2)))
        (not (player_inside_active_beacon (player3)))
    )
)

(script dormant void vs_h100_engineer_bomb
    (if (not (gp_boolean_get "gp_h100_vs_engineer")) 
        (begin
            (sleep_until (volume_test_players "tv_bsp_080") 1)
            (ai_place "sq_vig_brute_01")
            (ai_place "sq_vig_engineer_01")
            (object_create "small_bomb")
            (sleep 15)
            (vs_cast "sq_vig_brute_01/captain" true 0 "h100_0010")
            (set brute_captain (vs_role 1))
            (vs_cast "sq_vig_brute_01" true 0 "h100_0030" "")
            (set brute_01 (vs_role 1))
            (set brute_02 (vs_role 2))
            (vs_cast "sq_vig_engineer_01" true 0 "h100_0020")
            (set engineer_01 (vs_role 1))
            (objects_attach (ai_get_object brute_captain) "right_hand" "small_bomb" "bomb")
            (vs_abort_on_alert "gr_engineer_vignette" false)
            (vs_abort_on_damage "gr_engineer_vignette" true)
            (vs_set_cleanup_script vs_h100_bomb_cleanup)
            (vs_custom_animation_loop brute_01 ag_brute_eng_bomb "brute1_1" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation_loop brute_02 ag_brute_eng_bomb "brute2_1" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation_loop brute_captain ag_brute_eng_bomb "brute3_1" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation_loop engineer_01 ag_engineer_bomb "engineer_1" false "ps_engineer_vignette/engineer_vignette")
            (sleep_until (volume_test_players "tv_engineer_vignette") 30 (* 30.0 25.0))
            (wake vs_h100_engineer_dialogue)
            (vs_abort_on_alert "gr_engineer_vignette" false)
            (gp_boolean_set "gp_h100_vs_engineer" true)
            (sleep_until (= s_h100_vs_eng_dialogue 1))
            (vs_abort_on_alert brute_01 true)
            (vs_abort_on_damage brute_01 true)
            (vs_abort_on_alert brute_02 true)
            (vs_abort_on_damage brute_02 true)
            (wake vs_h100_destoy_bomb)
            (vs_custom_animation brute_01 false ag_brute_eng_bomb "brute1_2" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation brute_02 false ag_brute_eng_bomb "brute2_2" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation brute_captain false ag_brute_eng_bomb "brute3_2" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation engineer_01 true ag_engineer_bomb "engineer_2" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation brute_01 false ag_brute_eng_bomb "brute1_3" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation brute_02 false ag_brute_eng_bomb "brute2_3" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation brute_captain false ag_brute_eng_bomb "brute3_3" false "ps_engineer_vignette/engineer_vignette")
            (vs_custom_animation engineer_01 false ag_engineer_bomb "engineer_3" false "ps_engineer_vignette/engineer_vignette")
            (sleep 36)
            (vs_stop_custom_animation brute_03)
            (vs_release brute_03)
            (sleep 23)
            (vs_stop_custom_animation brute_02)
            (vs_release brute_02)
            (sleep 17)
            (vs_stop_custom_animation brute_01)
            (vs_stop_custom_animation engineer_01)
            (vs_release brute_01)
            (vs_release engineer_01)
        )
    )
)

(script dormant void vs_h100_destoy_bomb
    (sleep 75)
    (if debug 
        (print "destroy bomb"))
    (object_destroy "small_bomb")
)

(script static void vs_h100_bomb_cleanup
    (if debug 
        (print "vs bomb cleanup running..."))
    (object_destroy "small_bomb")
)

(script dormant void vs_h100_engineer_dialogue
    (if dialogue 
        (print "captain: (growls) hold the creature still"))
    (sleep (ai_play_line brute_captain h100_0010))
    (if dialogue 
        (print "engineer: (pained warble)"))
    (ai_play_line engineer_01 h100_0050)
    (if dialogue 
        (print "brute: place the charge! before i loose my grip!"))
    (sleep (ai_play_line brute_01 h100_0030))
    (set s_h100_vs_eng_dialogue 1)
    (sleep 65)
    (if dialogue 
        (print "engineer: (panick squeal)"))
    (sleep (ai_play_line engineer_01 h100_0020))
    (sleep 15)
    (if dialogue 
        (print "brute: it's armed!"))
    (sleep (ai_play_line brute_01 h100_0060))
    (if dialogue 
        (print "captain: and ready to explode if any human gets too close..."))
    (sleep (ai_play_line brute_captain h100_0070))
    (sleep 60)
    (if dialogue 
        (print "captain: give it room! let it do the prophet's work!"))
    (sleep (ai_play_line brute_captain h100_0080))
)

(script static void test_bomb_vignette
    (wake vs_h100_engineer_bomb)
)

(script static boolean obj_ltasks_0_2
    b_l100_player0_task
)

(script static boolean obj_ltasks_0_3
    b_l100_player1_task
)

(script static boolean obj_ltasks_0_4
    b_l100_player2_task
)

(script static boolean obj_ltasks_0_6
    b_l100_player3_task
)

(script static boolean obj_ltasks_0_17
    (volume_test_players "tv_l100_roundabout")
)

(script static boolean obj_ltasks_0_20
    (volume_test_players "tv_l100_cy_02")
)

(script static boolean obj_ltasks_0_21
    (<= (ai_living_count "obj_l100_roundabout") 3)
)

(script static boolean obj_hhero__90_18
    (<= (ai_task_count "obj_h100_survival_a/remaining_follow") 3)
)

(script static boolean obj_hinfan_90_27
    (and
        (<= (ai_task_count "obj_h100_survival_a/hero_follow") 0)
        (<= (ai_task_count "obj_h100_survival_a/remaining_follow") 3)
    )
)

(script static boolean obj_hinfan_90_29
    (survival_you_are_a_man)
)

(script static boolean obj_hhero__91_9
    (<= (ai_task_count "obj_h100_survival_b/remaining_follow") 3)
)

(script static boolean obj_hinfan_91_10
    (and
        (<= (ai_task_count "obj_h100_survival_b/remaining_follow") 3)
        (<= (ai_task_count "obj_h100_survival_b/hero_follow") 0)
    )
)

(script static boolean obj_liniti_92_0
    (<= (ai_combat_status "obj_l100_bldg") 4)
)

(script static boolean obj_bbrute_95_16
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bjetpa_95_17
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_95_19
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_95_28
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bpost__95_32
    (not (h100_all_scenes_completed))
)

(script static boolean obj_bbrute_97_15
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bjetpa_97_16
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_97_18
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bwtask_97_19
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_101_11
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_101_12
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bbrute_101_15
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bjetpa_101_16
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bpost__101_32
    (not (h100_all_scenes_completed))
)

(script static boolean obj_bbrute_118_12
    (>= (ai_combat_status "obj_bsp_100") 4)
)

(script static boolean obj_bbrute_118_14
    (>= (ai_combat_status "obj_bsp_100") 4)
)

(script static boolean obj_bengin_118_16
    (>= (ai_combat_status "obj_bsp_100") 4)
)

(script static boolean obj_bjacka_118_17
    (>= (ai_combat_status "obj_bsp_100") 4)
)

(script static boolean obj_bjacka_118_18
    (>= (ai_combat_status "obj_bsp_100") 4)
)

(script static boolean obj_bjacka_118_20
    (>= (ai_combat_status "obj_bsp_100") 4)
)

(script static boolean obj_bbrute_118_26
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bjetpa_118_27
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_118_29
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_118_30
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bpost__118_44
    (not (h100_all_scenes_completed))
)

(script static boolean obj_bbrute_119_2
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bjetpa_119_4
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_119_8
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_119_12
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bpost__119_20
    (not (h100_all_scenes_completed))
)

(script static boolean obj_bbrute_120_4
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bjetpa_120_5
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_120_12
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_btasks_120_13
    (>= (ai_living_count "gr_l150") 6)
)

(script static boolean obj_bpost__120_32
    (not (h100_all_scenes_completed))
)

(script startup void h100_startup
    (fade_out 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 0.0 0)
    (sound_class_set_gain "no_pad" 0.0 0)
    (ai_allegiance human player)
    (ai_allegiance player human)
    (ai_allegiance covenant prophet)
    (ai_allegiance prophet covenant)
    (if 
        (and
            g_play_cinematics
            (> (player_count) 0)
        ) 
            (begin
                (start)
            ) (begin
                (fade_in 0.0 0.0 0.0 0)
            )
    )
)

(script static void start
    (survival_kill_volumes_off)
    (if (campaign_survival_enabled) 
        (begin
            (cond
                ((= (game_insertion_point_get) 7)
                    (wake h100_survival_mode_a)
                )
                ((= (game_insertion_point_get) 8)
                    (wake h100_survival_mode_b)
                )
                (true
                    (wake h100_mission)
                )
            )
        ) (begin
            (cond
                ((h100_all_scenes_completed)
                    (wake l150_mission)
                )
                ((gp_boolean_get "gp_h100_from_mainmenu")
                    (wake h100_mainmenu)
                )
                ((= (gp_boolean_get "gp_l100_complete") false)
                    (wake l100_mission)
                )
                (true
                    (wake h100_mission)
                )
            )
        )
    )
)

(script continuous void achieveiment_sat_morn_cartoon
    (if (= (volume_test_object "webo_trigger_volume" (player0)) true) 
        (begin
            (print "player 0 has arrived at webo easter egg")
            (player_check_for_location_achievement 0 "_achievement_ace_saturday_morning_cartoon")
        )
    )
    (if (= (volume_test_object "webo_trigger_volume" (player1)) true) 
        (begin
            (print "player 1 has arrived at webo easter egg")
            (player_check_for_location_achievement 1 "_achievement_ace_saturday_morning_cartoon")
        )
    )
    (if (= (volume_test_object "webo_trigger_volume" (player2)) true) 
        (begin
            (print "player 2 has arrived at webo easter egg")
            (player_check_for_location_achievement 2 "_achievement_ace_saturday_morning_cartoon")
        )
    )
    (if (= (volume_test_object "webo_trigger_volume" (player3)) true) 
        (begin
            (print "player 3 has arrived at webo easter egg")
            (player_check_for_location_achievement 3 "_achievement_ace_saturday_morning_cartoon")
        )
    )
)

(script dormant void h100_mission
    (if debug 
        (print "h100 activated..."))
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (initialize_h100)
    (sleep 30)
    (cinematic_snap_from_black)
    (sleep_until (volume_test_players "tv_null"))
)

(script dormant void h100_post_sc100
    (zone_set_trigger_volume_enable "begin_zone_set:set_060_080:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_060_080:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_060_080:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_060_080:*" false)
    (sleep_until (>= (device_get_position "dm_l100_door03") 1.0))
    (wake h100_tr_player0_navpoint)
    (if (coop_players_2) 
        (wake h100_tr_player1_navpoint))
    (if (coop_players_3) 
        (wake h100_tr_player2_navpoint))
    (if (coop_players_4) 
        (wake h100_tr_player3_navpoint))
    (sleep_until (volume_test_players "tv_bsp_080") 1)
    (wake music_h100_09)
    (wake music_h100_10)
    (wake music_h100_11)
)

(script dormant void h100_mainmenu
    (if debug 
        (print "h100 main menu activated..."))
    (if 
        (and
            (not (h100_any_scene_completed))
            (> (player_count) 0)
        ) 
            (fade_out 0.0 0.0 0.0 0) (cinematic_snap_to_black))
    (initialize_h100)
    (sleep 1)
    (if (not (h100_any_scene_completed)) 
        (begin
            (switch_zone_set "set_l100")
            (sleep 1)
            (chud_show_crosshair false)
            (player_control_fade_out_all_input 0.0)
            (campaign_metagame_time_pause true)
            (wake l100_mission)
        ) (begin
            (cinematic_snap_from_black)
        )
    )
)

(script dormant void h100_enc_sc100
    (if (>= (h100_scenes_completed_short) 3) 
        (ai_place "sq_sr_phantom_01/sc100"))
    (if (>= (h100_scenes_completed_short) 3) 
        (ai_place "sq_sr_050_01"))
    (ai_place "sq_sr_050_02")
    (sleep_until (> (device_get_position "dm_l100_door03") 0.0) 1)
    (device_closes_automatically_set "dm_l100_door03" false)
    (ai_set_objective "sq_sr_050_01" "obj_bsp_050_right")
    (ai_set_objective "sq_sr_050_02" "obj_bsp_050_right")
    (sleep_until (>= (device_get_position "dm_l100_door03") 1.0) 1)
    (device_set_power "dm_l100_door03" 0.0)
    (sleep_until (> (device_get_position "dm_security_door_open_07") 0.0))
    (device_set_power "dm_l100_door03" 1.0)
    (device_closes_automatically_set "dm_l100_door03" true)
)

(script dormant void h100_enc_sc110
    (if (>= (h100_scenes_completed_short) 3) 
        (ai_place "sq_sr_phantom_01/sc110"))
)

(script dormant void h100_enc_sc120
    (ai_place "sq_sr_phantom_01/sc120")
)

(script dormant void h100_enc_sc130
    (ai_place "sq_sr_phantom_01/sc130")
)

(script dormant void h100_enc_sc140
    (ai_place "sq_sr_phantom_01/sc140")
)

(script dormant void h100_enc_sc150
    (ai_place "sq_sr_phantom_01/sc150")
    (ai_place "sq_sr_000_grunt_01")
    (ai_place "sq_sr_000_grunt_02")
    (ai_place "sq_sr_000_hunters")
)

(script command_script void cs_130_phantom_02
    (if debug 
        (print "phantom 02"))
    (set sc130_phantom_02 (ai_vehicle_get_from_spawn_point "sq_bsp_100_04a/phantom"))
    (cs_vehicle_speed 0.5)
    (cs_enable_pathfinding_failsafe true)
    (sleep_until 
        (begin
            (begin_random
                (if (= ps_sc130_phantom_02_02 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_02/run_02a")
                        (set ps_sc130_phantom_02_02 false)
                    )
                )
                (if (= ps_sc130_phantom_02_02 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_02/run_02b")
                        (set ps_sc130_phantom_02_02 false)
                    )
                )
            )
            (begin_random
                (if (= ps_sc130_phantom_02_03 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_02/run_03a")
                        (set ps_sc130_phantom_02_03 false)
                    )
                )
                (if (= ps_sc130_phantom_02_03 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_02/run_03b")
                        (set ps_sc130_phantom_02_03 false)
                    )
                )
            )
            (cs_fly_to "ps_sc130_phantom_02/run_04")
            (set ps_sc130_phantom_02_01 true)
            (set ps_sc130_phantom_02_02 true)
            (set ps_sc130_phantom_02_03 true)
            (sleep 1)
            (begin_random
                (if (= ps_sc130_phantom_02_01 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_02/run_01a")
                        (set ps_sc130_phantom_02_01 false)
                    )
                )
                (if (= ps_sc130_phantom_02_01 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_02/run_01b")
                        (set ps_sc130_phantom_02_01 false)
                    )
                )
            )
            false
        ) 
    1)
)

(script command_script void cs_130_phantom_03
    (if debug 
        (print "phantom 03"))
    (set sc130_phantom_03 (ai_vehicle_get_from_spawn_point "sq_bsp_100_04b/phantom"))
    (cs_vehicle_speed 1.0)
    (cs_enable_pathfinding_failsafe true)
    (if (gp_boolean_get "gp_sc130_complete") 
        (ai_erase ai_current_squad))
    (cs_fly_to "ps_sc130_phantom_03/approach_01")
    (sleep_until (> (device_get_position "dm_security_door_open_19") 0.0))
    (cs_vehicle_speed 0.6)
    (cs_fly_to "ps_sc130_phantom_03/approach_02")
    (cs_vehicle_speed 0.8)
    (sleep_until 
        (begin
            (cs_fly_to "ps_sc130_phantom_03/run_04")
            (cs_vehicle_speed 0.3)
            (set ps_sc130_phantom_03_01 true)
            (set ps_sc130_phantom_03_02 true)
            (set ps_sc130_phantom_03_03 true)
            (sleep 1)
            (begin_random
                (if (= ps_sc130_phantom_03_01 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_03/run_01a")
                        (set ps_sc130_phantom_03_01 false)
                    )
                )
                (if (= ps_sc130_phantom_03_01 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_03/run_01b")
                        (set ps_sc130_phantom_03_01 false)
                    )
                )
            )
            (begin_random
                (if (= ps_sc130_phantom_03_02 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_03/run_02a")
                        (set ps_sc130_phantom_03_02 false)
                    )
                )
                (if (= ps_sc130_phantom_03_02 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_03/run_02b")
                        (set ps_sc130_phantom_03_02 false)
                    )
                )
            )
            (begin_random
                (if (= ps_sc130_phantom_03_03 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_03/run_03a")
                        (set ps_sc130_phantom_03_03 false)
                    )
                )
                (if (= ps_sc130_phantom_03_03 true) 
                    (begin
                        (cs_fly_to "ps_sc130_phantom_03/run_03b")
                        (set ps_sc130_phantom_03_03 false)
                    )
                )
            )
            false
        ) 
    1)
)

(script dormant void player0_h100_waypoints
    (f_h100_waypoints player_00)
)

(script dormant void player1_h100_waypoints
    (f_h100_waypoints player_01)
)

(script dormant void player2_h100_waypoints
    (f_h100_waypoints player_02)
)

(script dormant void player3_h100_waypoints
    (f_h100_waypoints player_03)
)

(script static void f_h100_waypoints (short player_short)
    (sleep_until 
        (begin
            (f_sleep_until_activate_waypoint player_short)
            (f_h100_deactivate_all_nav player_short)
            (if (player_inside_active_beacon (player_get player_short)) 
                (f_waypoint_message player_short "null_flag" "nav_in_beacon" "tr_blank_short") (begin
                    (if (volume_test_object "tv_bsp_000" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc150")
                                (f_waypoint_message player_short "null_flag" "nav_in_current_bsp" "tr_blank_short")
                            )
                            (true
                                (f_waypoint_activate_2 player_short "fl_h100_000_030_01" "fl_h100_000_030_02")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_030" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc150")
                                (f_waypoint_activate_2 player_short "fl_h100_000_030_01" "fl_h100_000_030_02")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc140")
                                (f_waypoint_message player_short "null_flag" "nav_in_current_bsp" "tr_blank_short")
                            )
                            (true
                                (f_waypoint_activate_2 player_short "fl_h100_030_040_01" "fl_h100_030_040_02")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_040" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc150")
                                (f_waypoint_activate_2 player_short "fl_h100_030_040_01" "fl_h100_030_040_02")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc140")
                                (f_waypoint_activate_2 player_short "fl_h100_030_040_01" "fl_h100_030_040_02")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc130")
                                (f_waypoint_activate_1 player_short "fl_h100_040_100")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc120")
                                (f_waypoint_message player_short "null_flag" "nav_in_current_bsp" "tr_blank_short")
                            )
                            (true
                                (f_waypoint_activate_2 player_short "fl_h100_040_060_01" "fl_h100_040_060_02")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_050" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc100")
                                (f_waypoint_message player_short "null_flag" "nav_in_current_bsp" "tr_blank_short")
                            )
                            ((gp_boolean_get "gp_h100_from_mainmenu")
                                (f_waypoint_activate_2 player_short "fl_h100_050_080_01" "fl_h100_050_080_02")
                            )
                            (true
                                (f_waypoint_activate_1 player_short "fl_h100_050_080_01")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_060" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc130")
                                (f_waypoint_activate_1 player_short "fl_h100_060_100")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc110")
                                (f_waypoint_activate_2 player_short "fl_h100_060_080_01" "fl_h100_060_080_02")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc100")
                                (f_waypoint_activate_2 player_short "fl_h100_060_080_01" "fl_h100_060_080_02")
                            )
                            (true
                                (f_waypoint_activate_2 player_short "fl_h100_040_060_01" "fl_h100_040_060_02")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_080" (player_get player_short)) 
                        (cond
                            ((and
                                (f_pda_beacon_selected player_short "fl_beacon_sc100")
                                (gp_boolean_get "gp_h100_from_mainmenu")
                            )
                                (f_waypoint_activate_2 player_short "fl_h100_050_080_01" "fl_h100_050_080_02")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc100")
                                (f_waypoint_activate_1 player_short "fl_h100_050_080_01")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc110")
                                (f_waypoint_activate_2 player_short "fl_h100_080_090_01" "fl_h100_080_090_02")
                            )
                            (true
                                (f_waypoint_activate_2 player_short "fl_h100_060_080_01" "fl_h100_060_080_02")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_090" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc110")
                                (f_waypoint_message player_short "null_flag" "nav_in_current_bsp" "tr_blank_short")
                            )
                            (true
                                (f_waypoint_activate_2 player_short "fl_h100_080_090_01" "fl_h100_080_090_02")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_100" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc100")
                                (f_waypoint_activate_1 player_short "fl_h100_060_100")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc110")
                                (f_waypoint_activate_1 player_short "fl_h100_040_100")
                            )
                            ((f_pda_beacon_selected player_short "fl_beacon_sc130")
                                (f_waypoint_activate_1 player_short "fl_h100_100_oni")
                            )
                            (true
                                (f_waypoint_activate_1 player_short "fl_h100_060_100")
                            )
                        )
                    )
                    (if (volume_test_object "tv_bsp_oni" (player_get player_short)) 
                        (cond
                            ((f_pda_beacon_selected player_short "fl_beacon_sc130")
                                (f_waypoint_message player_short "null_flag" "nav_in_current_bsp" "tr_blank_short")
                            )
                            (true
                                (f_waypoint_activate_1 player_short "fl_h100_100_oni")
                            )
                        )
                    )
                )
            )
            false
        ) 
    1)
)

(script static void f_h100_deactivate_all_nav (short player_short)
    (if debug 
        (print "** deactivating all nav points **"))
    (chud_show_navpoint (player_get player_short) "fl_h100_000_030_01" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_000_030_02" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_030_040_01" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_030_040_02" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_040_060_01" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_040_060_02" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_040_100" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_050_080_01" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_050_080_02" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_060_080_01" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_060_080_02" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_060_100" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_080_090_01" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_080_090_02" 0.0 false)
    (chud_show_navpoint (player_get player_short) "fl_h100_100_oni" 0.0 false)
)

(script dormant void h100_turn_off_lightning
    (sleep_until 
        (or
            (volume_test_players "tv_lightning_01")
            (volume_test_players "tv_lightning_02")
        )
    )
    (object_destroy "fx_lightning")
    (sleep_until 
        (or
            (not (volume_test_players "tv_lightning_01"))
            (not (volume_test_players "tv_lightning_02"))
        )
    )
)

(script dormant void h100_ambient_phantom
    (sleep_until 
        (begin
            (sleep (* 30.0 60.0 (/ (random_range 15 31) 10.0)))
            (set s_amb_phantom_path (random_range 1 6))
            (sleep 1)
            (ai_place "sq_amb_phantom_01")
            (sleep_until (<= (ai_living_count "sq_amb_phantom_01") 0) 90)
            false
        )
    )
)

(script command_script void cs_amb_phantom_01
    (cs_enable_pathfinding_failsafe true)
    (cond
        ((= s_amb_phantom_path 1)
            (cs_run_command_script "sq_amb_phantom_01" cs_amb_phantom_path_01)
        )
        ((= s_amb_phantom_path 2)
            (cs_run_command_script "sq_amb_phantom_01" cs_amb_phantom_path_02)
        )
        ((= s_amb_phantom_path 3)
            (cs_run_command_script "sq_amb_phantom_01" cs_amb_phantom_path_03)
        )
        ((= s_amb_phantom_path 4)
            (cs_run_command_script "sq_amb_phantom_01" cs_amb_phantom_path_04)
        )
        ((= s_amb_phantom_path 5)
            (cs_run_command_script "sq_amb_phantom_01" cs_amb_phantom_path_05)
        )
    )
    (sleep_until 
        (and
            (cs_command_script_running "sq_amb_phantom_01" cs_amb_phantom_path_01)
            (cs_command_script_running "sq_amb_phantom_01" cs_amb_phantom_path_02)
            (cs_command_script_running "sq_amb_phantom_01" cs_amb_phantom_path_03)
        )
    )
)

(script command_script void cs_amb_phantom_path_01
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.5)
    (sleep 1)
    (cs_fly_by "ps_amb_ph_01/p0")
    (cs_fly_by "ps_amb_ph_01/p1")
    (cs_fly_by "ps_amb_ph_01/p2")
    (cs_fly_by "ps_amb_ph_01/p3")
    (cs_fly_by "ps_amb_ph_01/p4")
    (cs_fly_by "ps_amb_ph_01/p5")
    (cs_fly_by "ps_amb_ph_01/p6")
    (cs_fly_by "ps_amb_ph_01/p7")
    (cs_fly_by "ps_amb_ph_01/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_amb_phantom_path_02
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.5)
    (sleep 1)
    (cs_fly_by "ps_amb_ph_02/p0")
    (cs_fly_by "ps_amb_ph_02/p1")
    (cs_fly_by "ps_amb_ph_02/p2")
    (cs_fly_by "ps_amb_ph_02/p3")
    (cs_fly_by "ps_amb_ph_02/p4")
    (cs_fly_by "ps_amb_ph_02/p5")
    (cs_fly_by "ps_amb_ph_02/p6")
    (cs_fly_by "ps_amb_ph_02/p7")
    (cs_fly_by "ps_amb_ph_02/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_amb_phantom_path_03
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.5)
    (sleep 1)
    (cs_fly_by "ps_amb_ph_03/p0")
    (cs_fly_by "ps_amb_ph_03/p1")
    (cs_fly_by "ps_amb_ph_03/p2")
    (cs_fly_by "ps_amb_ph_03/p3")
    (cs_fly_by "ps_amb_ph_03/p4")
    (cs_fly_by "ps_amb_ph_03/p5")
    (cs_fly_by "ps_amb_ph_03/p6")
    (cs_fly_by "ps_amb_ph_03/p7")
    (cs_fly_by "ps_amb_ph_03/p8")
    (cs_fly_by "ps_amb_ph_03/p9")
    (cs_fly_by "ps_amb_ph_03/p10")
    (cs_fly_by "ps_amb_ph_03/p11")
    (cs_fly_by "ps_amb_ph_03/p12")
    (cs_fly_by "ps_amb_ph_03/p13")
    (cs_fly_by "ps_amb_ph_03/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_amb_phantom_path_04
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.5)
    (sleep 1)
    (cs_fly_by "ps_amb_ph_04/p0")
    (cs_fly_by "ps_amb_ph_04/p1")
    (cs_fly_by "ps_amb_ph_04/p2")
    (cs_fly_by "ps_amb_ph_04/p3")
    (cs_fly_by "ps_amb_ph_04/p4")
    (cs_fly_by "ps_amb_ph_04/p5")
    (cs_fly_by "ps_amb_ph_04/p6")
    (cs_fly_by "ps_amb_ph_04/p7")
    (cs_fly_by "ps_amb_ph_04/p8")
    (cs_fly_by "ps_amb_ph_04/p9")
    (cs_fly_by "ps_amb_ph_04/p10")
    (cs_fly_by "ps_amb_ph_04/p11")
    (cs_fly_by "ps_amb_ph_04/p12")
    (cs_fly_by "ps_amb_ph_04/p13")
    (cs_fly_by "ps_amb_ph_04/p14")
    (cs_fly_by "ps_amb_ph_04/p15")
    (cs_fly_by "ps_amb_ph_04/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_amb_phantom_path_05
    (cs_enable_pathfinding_failsafe true)
    (cs_vehicle_speed 0.5)
    (sleep 1)
    (cs_fly_by "ps_amb_ph_05/p0")
    (cs_fly_by "ps_amb_ph_05/p1")
    (cs_fly_by "ps_amb_ph_05/p2")
    (cs_fly_by "ps_amb_ph_05/p3")
    (cs_fly_by "ps_amb_ph_05/p4")
    (cs_fly_by "ps_amb_ph_05/p5")
    (cs_fly_by "ps_amb_ph_05/p6")
    (cs_fly_by "ps_amb_ph_05/p7")
    (cs_fly_by "ps_amb_ph_05/p8")
    (cs_fly_by "ps_amb_ph_05/p9")
    (cs_fly_by "ps_amb_ph_05/p10")
    (cs_fly_by "ps_amb_ph_05/p11")
    (cs_fly_by "ps_amb_ph_05/p12")
    (cs_fly_by "ps_amb_ph_05/p13")
    (cs_fly_by "ps_amb_ph_05/p14")
    (cs_fly_by "ps_amb_ph_05/p15")
    (cs_fly_by "ps_amb_ph_05/p16")
    (cs_fly_by "ps_amb_ph_05/p17")
    (cs_fly_by "ps_amb_ph_05/p18")
    (cs_fly_by "ps_amb_ph_05/erase")
    (ai_erase ai_current_squad)
)

(script dormant void l100_mission
    (data_mine_set_mission_segment "l100_000_intro")
    (if (> (player_count) 0) 
        (fade_out 0.0 0.0 0.0 0))
    (ai_disregard (players) true)
    (if (not (gp_boolean_get "gp_h100_from_mainmenu")) 
        (initialize_l100))
    (sleep 1)
    (f_create_pod_objects "player0_hands" "player0_torso" "pod_odst_00" "pod00_control_01" "pod00_control_02" "pod00_control_03" "pod00_control_04")
    (if (coop_players_2) 
        (begin
            (f_create_pod_objects "player1_hands" "player1_torso" "pod_odst_01" "pod01_control_01" "pod01_control_02" "pod01_control_03" "pod01_control_04")
        )
    )
    (if (coop_players_3) 
        (begin
            (f_create_pod_objects "player2_hands" "player2_torso" "pod_odst_02" "pod02_control_01" "pod02_control_02" "pod02_control_03" "pod02_control_04")
        )
    )
    (if (coop_players_4) 
        (begin
            (f_create_pod_objects "player3_hands" "player3_torso" "pod_odst_03" "pod03_control_01" "pod03_control_02" "pod03_control_03" "pod03_control_04")
        )
    )
    (sleep 1)
    (f_l100_pod_setup player_00 "player0_hands" "player0_hands" "pod_odst_00" "pod00_control_01" "pod00_control_02" "pod00_control_03" "pod00_control_04")
    (if (coop_players_2) 
        (begin
            (f_l100_pod_setup player_01 "player1_hands" "player1_hands" "pod_odst_01" "pod01_control_01" "pod01_control_02" "pod01_control_03" "pod01_control_04")
        )
    )
    (if (coop_players_3) 
        (begin
            (f_l100_pod_setup player_02 "player2_hands" "player2_hands" "pod_odst_02" "pod02_control_01" "pod02_control_02" "pod02_control_03" "pod02_control_04")
        )
    )
    (if (coop_players_4) 
        (begin
            (f_l100_pod_setup player_03 "player3_hands" "player3_hands" "pod_odst_03" "pod03_control_01" "pod03_control_02" "pod03_control_03" "pod03_control_04")
        )
    )
    (sleep 1)
    (wake l100_ambient_sounds)
    (if (not (gp_boolean_get "gp_h100_from_mainmenu")) 
        (begin
            (wake l100_player0_task)
            (if (coop_players_2) 
                (wake l100_player1_task))
            (if (coop_players_3) 
                (wake l100_player2_task))
            (if (coop_players_4) 
                (wake l100_player3_task))
        )
    )
    (chapter_title)
    (ai_place "sq_l100_phantom_01")
    (ai_place "sq_l100_phantom_02")
    (sleep (* 30.0 3.0))
    (l100_wake_up)
    (if 
        (and
            (not (gp_boolean_get "gp_h100_from_mainmenu"))
            (not (is_skull_secondary_enabled skull_blind))
            (not (game_is_cooperative))
            (l100_test_training_vars)
        ) 
            (f_l100_retrain_players player_00 "tv_bsp_050" "tv_null"))
    (sleep 1)
    (if 
        (or
            (gp_boolean_get "gp_h100_from_mainmenu")
            (game_is_cooperative)
            (gp_boolean_get "gp_tr_look_complete")
            (is_skull_secondary_enabled skull_blind)
        ) 
            (sleep 1) (f_l100_look_training player_00))
    (set g_music_h100_01 true)
    (sleep (* 30.0 3.0))
    (data_mine_set_mission_segment "l100_002_pod_eject")
    (wake l100_pod_eject_00)
    (if (coop_players_2) 
        (wake l100_pod_eject_01))
    (if (coop_players_3) 
        (wake l100_pod_eject_02))
    (if (coop_players_4) 
        (wake l100_pod_eject_03))
    (if (not (gp_boolean_get "gp_h100_from_mainmenu")) 
        (begin
            (wake player0_health_vision)
            (if (coop_players_2) 
                (wake player1_health_vision))
            (if (coop_players_3) 
                (wake player2_health_vision))
            (if (coop_players_4) 
                (wake player3_health_vision))
            (wake l100_player0_task)
            (if (coop_players_2) 
                (wake l100_player1_task))
            (if (coop_players_3) 
                (wake l100_player2_task))
            (if (coop_players_4) 
                (wake l100_player3_task))
            (wake enc_roundabout)
            (wake enc_courtyard)
            (wake enc_building)
        )
    )
)

(script static void f_virgil_in (short player_short)
    (sound_impulse_start sfx_virgil_in (player_get player_short) 1.0)
)

(script static void f_virgil_out (short player_short)
    (sound_impulse_start sfx_virgil_out (player_get player_short) 1.0)
)

(script static void f_create_pod_objects (object_name player_hands_name, object_name player_torso, object_name odst_pod, object_name pod_control_01, object_name pod_control_02, object_name pod_control_03, object_name pod_control_04)
    (object_create odst_pod)
    (object_create player_hands_name)
    (object_create player_torso)
    (object_create pod_control_01)
    (object_create pod_control_02)
    (object_create pod_control_03)
    (object_create pod_control_04)
    (sleep 1)
    (objects_attach odst_pod "fp_arms_attach" player_hands_name "")
)

(script static void f_l100_pod_setup (short player_short, scenery player_hands, object_name player_hands_name, object_name odst_pod, object_name pod_control_01, object_name pod_control_02, object_name pod_control_03, object_name pod_control_04)
    (if debug 
        (print "*** setup odst pod ***"))
    (player_set_pda_enabled (player_get player_short) false)
    (unit_enable_vision_mode (player_get player_short) false)
    (player_set_look_training_hack (player_get player_short) true)
    (objects_attach odst_pod "release_top" pod_control_01 "")
    (objects_attach odst_pod "release_bottom" pod_control_02 "")
    (objects_attach odst_pod "release_left" pod_control_03 "")
    (objects_attach odst_pod "release_right" pod_control_04 "")
    (vehicle_load_magic odst_pod pod_d (player_get player_short))
    (player0_set_pitch g_start_pitch_l100 0)
    (player1_set_pitch g_start_pitch_l100 0)
    (player2_set_pitch g_start_pitch_l100 0)
    (player3_set_pitch g_start_pitch_l100 0)
    (sleep 1)
    (scenery_animation_start_loop player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:idle")
    (sound_looping_start "sound\device_machines\atlas\pod_sequence\pod_static\pod_static1\pod_static1" pod_control_03 1.0)
    (sound_looping_start "sound\device_machines\atlas\pod_sequence\pod_static\pod_static2\pod_static2" pod_control_04 1.0)
    (sleep 15)
)

(script dormant void l100_ambient_sounds
    (if debug 
        (print "... turn on sounds ..."))
    (sound_looping_start "sound\device_machines\atlas\pod_sequence\rain_int_pod\rain_int_pod" none 1.0)
    (sound_class_set_gain "" 0.25 (* 30.0 21.0))
    (sound_class_set_gain "amb" 0.0 0)
    (sleep (* 30.0 21.0))
    (sound_impulse_start "sound\device_machines\atlas\pod_sequence\breath_rustle" none 1.0)
    (sleep (* 30.0 8.5))
    (sound_class_set_gain "" 1.0 (* 30.0 3.5))
    (sound_class_set_gain "amb" 0.0 0)
)

(script dormant void l100_pod_eject_00
    (f_l100_pod_eject player_00 "player0_hands" "player0_hands" "pod_odst_00" "pod00_control_01" "pod00_control_02" "pod00_control_03" "pod00_control_04")
)

(script dormant void l100_pod_eject_01
    (f_l100_pod_eject player_01 "player1_hands" "player1_hands" "pod_odst_01" "pod01_control_01" "pod01_control_02" "pod01_control_03" "pod01_control_04")
)

(script dormant void l100_pod_eject_02
    (f_l100_pod_eject player_02 "player2_hands" "player2_hands" "pod_odst_02" "pod02_control_01" "pod02_control_02" "pod02_control_03" "pod02_control_04")
)

(script dormant void l100_pod_eject_03
    (f_l100_pod_eject player_03 "player3_hands" "player3_hands" "pod_odst_03" "pod03_control_01" "pod03_control_02" "pod03_control_03" "pod03_control_04")
)

(script static void f_l100_pod_eject (short player_short, scenery player_hands, object_name player_hands_name, object_name odst_pod, device pod_control_01, device pod_control_02, device pod_control_03, device pod_control_04)
    (unit_control_fade_in_all_input (player_get player_short) 1.0)
    (chud_show_messages true)
    (if 
        (or
            (gp_boolean_get "gp_tr_look_complete")
            (gp_boolean_get "gp_h100_from_mainmenu")
            (game_is_cooperative)
        ) 
            (begin
                (chud_show_crosshair true)
                (sleep 60)
            ) (begin
                (f_sfx_hud_in player_short)
                (chud_show_cinematic_title (player_get player_short) "tr_eject")
                (sleep 90)
                (chud_show_cinematic_title (player_get player_short) "tr_blank_long")
                (chud_show_crosshair true)
                (sleep 5)
                (f_bolt_countdown player_short player_hands player_hands_name odst_pod pod_control_01 pod_control_02 pod_control_03 pod_control_04)
                (sleep 1)
            )
    )
    (gp_boolean_set "gp_tr_look_complete" true)
    (f_blow_hatch player_short player_hands player_hands_name odst_pod pod_control_01 pod_control_02 pod_control_03 pod_control_04)
    (sleep 90)
    (unit_enable_vision_mode (player_get player_short) true)
    (player_set_look_training_hack (player_get player_short) false)
    (if (gp_boolean_get "gp_h100_from_mainmenu") 
        (player_set_pda_enabled (player_get player_short) true))
    (campaign_metagame_time_pause false)
    (game_save)
)

(script static void f_bolt_countdown (short player_short, scenery player_hands, object_name player_hands_name, object_name odst_pod, device pod_control_01, device pod_control_02, device pod_control_03, device pod_control_04)
    (device_set_power pod_control_01 1.0)
    (device_set_power pod_control_02 1.0)
    (device_set_power pod_control_03 1.0)
    (device_set_power pod_control_04 1.0)
    (chud_show_cinematic_title (player_get player_short) "tr_4switch")
    (sleep_until (< (+ (device_get_position pod_control_01) (device_get_position pod_control_02) (device_get_position pod_control_03) (device_get_position pod_control_04)) 4.0) 1)
    (f_first_person_animation player_short player_hands pod_control_01 pod_control_02 pod_control_03 pod_control_04)
    (chud_show_cinematic_title (player_get player_short) "tr_3switch")
    (sleep_until (< (+ (device_get_position pod_control_01) (device_get_position pod_control_02) (device_get_position pod_control_03) (device_get_position pod_control_04)) 3.0) 1)
    (f_first_person_animation player_short player_hands pod_control_01 pod_control_02 pod_control_03 pod_control_04)
    (chud_show_cinematic_title (player_get player_short) "tr_2switch")
    (sleep_until (< (+ (device_get_position pod_control_01) (device_get_position pod_control_02) (device_get_position pod_control_03) (device_get_position pod_control_04)) 2.0) 1)
    (f_first_person_animation player_short player_hands pod_control_01 pod_control_02 pod_control_03 pod_control_04)
    (chud_show_cinematic_title (player_get player_short) "tr_1switch")
    (sleep_until (< (+ (device_get_position pod_control_01) (device_get_position pod_control_02) (device_get_position pod_control_03) (device_get_position pod_control_04)) 1.0) 1)
    (f_first_person_animation player_short player_hands pod_control_01 pod_control_02 pod_control_03 pod_control_04)
    (sleep 15)
    (chud_show_cinematic_title (player_get player_short) "tr_eject_success")
    (f_sfx_hud_out player_short)
    (chud_show_shield true)
)

(script static void f_first_person_animation (short player_short, scenery player_hands, device pod_control_01, device pod_control_02, device pod_control_03, device pod_control_04)
    (unit_control_fade_out_all_input (player_get player_short) 0.0)
    (cond
        ((objects_can_see_object (player_get player_short) pod_control_01 10.0)
            (begin
                (scenery_animation_start player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:buttonpush_1")
                (f_player_rumble player_short)
                (sleep (scenery_get_animation_time player_hands))
                (scenery_animation_start_loop player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:idle")
            )
        )
        ((objects_can_see_object (player_get player_short) pod_control_02 10.0)
            (begin
                (scenery_animation_start player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:buttonpush_2")
                (f_player_rumble player_short)
                (sleep (scenery_get_animation_time player_hands))
                (scenery_animation_start_loop player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:idle")
            )
        )
        ((objects_can_see_object (player_get player_short) pod_control_03 10.0)
            (begin
                (scenery_animation_start player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:buttonpush_3")
                (f_player_rumble player_short)
                (sleep (scenery_get_animation_time player_hands))
                (scenery_animation_start_loop player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:idle")
            )
        )
        ((objects_can_see_object (player_get player_short) pod_control_04 10.0)
            (begin
                (scenery_animation_start player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:buttonpush_4")
                (f_player_rumble player_short)
                (sleep (scenery_get_animation_time player_hands))
                (scenery_animation_start_loop player_hands "objects\characters\odst_recon\fp\odst_pod\odst_pod" "first_person:idle")
            )
        )
    )
    (unit_control_fade_in_all_input (player_get player_short) 0.0)
)

(script static void f_blow_hatch (short player_short, scenery player_hands, object_name player_hands_name, object_name odst_pod, device pod_control_01, device pod_control_02, device pod_control_03, device pod_control_04)
    (sleep 30)
    (effect_new_on_object_marker "objects\vehicles\odst_pod\fx\door_breach" odst_pod "fx_door_crate")
    (f_player_rumble_pod_open player_short)
    (object_set_variant odst_pod "open")
    (object_destroy pod_control_01)
    (object_destroy pod_control_02)
    (object_destroy pod_control_03)
    (object_destroy pod_control_04)
    (sound_class_set_gain "amb" 1.0 15)
    (sound_looping_stop "sound\device_machines\atlas\pod_sequence\rain_int_pod\rain_int_pod")
    (sound_looping_stop "sound\device_machines\atlas\pod_sequence\pod_static\pod_static1\pod_static1")
    (sound_looping_stop "sound\device_machines\atlas\pod_sequence\pod_static\pod_static2\pod_static2")
    (f_player_rumble_pod_blow player_short)
    (set g_music_h100_015 true)
    (player_set_look_training_hack (player_get player_short) false)
    (sleep 120)
    (vehicle_unload odst_pod none)
    (sleep 30)
    (object_destroy player_hands)
    (object_destroy "player0_torso")
    (object_destroy "player1_torso")
    (object_destroy "player2_torso")
    (object_destroy "player3_torso")
)

(script static void f_player_rumble (short player_short)
    (sleep 17)
    (player_effect_set_max_rumble_for_player (player_get player_short) 1.0 0.15)
    (sleep 4)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.0 0.0)
)

(script static void f_player_rumble_pod_open (short player_short)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.25 0.25)
    (sleep 30)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.2 0.2)
    (sleep 30)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.1 0.1)
    (sleep 30)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.05 0.05)
    (sleep 30)
)

(script static void f_player_rumble_pod_blow (short player_short)
    (player_effect_set_max_rumble_for_player (player_get player_short) 1.0 1.0)
    (sleep 10)
    (player_effect_set_max_rumble_for_player (player_get player_short) 0.0 0.0)
)

(script static void chapter_title
    (sleep 180)
    (cinematic_set_title "title_1")
    (sleep 60)
    (cinematic_set_title "title_2")
    (sleep 60)
    (cinematic_set_title "title_3")
    (sleep 90)
)

(script static void l100_wake_up
    (fade_out 0.0 0.0 0.0 0)
    (sleep (* 30.0 3.0))
    (effect_new_on_object_marker "fx\screen_fx\wake_up\wake_up" (player0) "head")
    (effect_new_on_object_marker "fx\screen_fx\wake_up\wake_up" (player1) "head")
    (effect_new_on_object_marker "fx\screen_fx\wake_up\wake_up" (player2) "head")
    (effect_new_on_object_marker "fx\screen_fx\wake_up\wake_up" (player3) "head")
    (sleep 30)
    (fade_in 0.0 0.0 0.0 15)
    (sleep (* 30.0 4.5))
    (player0_set_pitch 21.0 0)
    (player1_set_pitch 21.0 0)
    (player2_set_pitch 21.0 0)
    (player3_set_pitch 21.0 0)
    (sleep (* 30.0 4.0))
    (player0_set_pitch -7.0 0)
    (player1_set_pitch -7.0 0)
    (player2_set_pitch -7.0 0)
    (player3_set_pitch -7.0 0)
    (ai_disregard (players) false)
    (sleep (* 30.0 5.0))
    (sound_class_set_gain "mus" 1.0 150)
)

(script dormant void enc_roundabout
    (cond
        ((coop_players_4)
            (sleep_until 
                (or
                    (not (vehicle_test_seat "pod_odst_00" none))
                    (not (vehicle_test_seat "pod_odst_01" none))
                    (not (vehicle_test_seat "pod_odst_02" none))
                    (not (vehicle_test_seat "pod_odst_03" none))
                )
            )
        )
        ((coop_players_3)
            (sleep_until 
                (or
                    (not (vehicle_test_seat "pod_odst_00" none))
                    (not (vehicle_test_seat "pod_odst_01" none))
                    (not (vehicle_test_seat "pod_odst_02" none))
                )
            )
        )
        ((coop_players_2)
            (sleep_until 
                (or
                    (not (vehicle_test_seat "pod_odst_00" none))
                    (not (vehicle_test_seat "pod_odst_01" none))
                )
            )
        )
        (true
            (sleep_until (not (vehicle_test_seat "pod_odst_00" none)))
        )
    )
    (data_mine_set_mission_segment "l100_010_enc_roundabout")
    (wake player0_l00_waypoints)
    (if (coop_players_2) 
        (wake player1_l00_waypoints))
    (if (coop_players_3) 
        (wake player2_l00_waypoints))
    (if (coop_players_4) 
        (wake player3_l00_waypoints))
    (sleep 120)
    (game_save)
    (sleep 60)
    (set g_music_h100_015 false)
    (sleep (* (random_range 15 30) 30.0))
    (sleep_until (<= (ai_living_count "gr_l100_infantry") 8))
    (game_save)
    (sleep (* (random_range 2 5) 30.0))
    (sleep_until (<= (ai_living_count "gr_l100_infantry") 0))
    (game_save)
    (set g_music_h100_01 false)
    (sleep (* (random_range 3 5) 30.0))
    (player0_kill_training)
    (if (coop_players_2) 
        (player1_kill_training))
    (if (coop_players_3) 
        (player2_kill_training))
    (if (coop_players_4) 
        (player3_kill_training))
    (sleep 120)
    (if (not (is_skull_secondary_enabled skull_blind)) 
        (begin
            (wake player0_purpose)
            (if (coop_players_2) 
                (wake player1_purpose))
            (if (coop_players_3) 
                (wake player2_purpose))
            (if (coop_players_4) 
                (wake player3_purpose))
        ) (begin
            (set b_h100_purpose_complete true)
        )
    )
    (sleep_until b_h100_purpose_complete)
    (sleep (* (random_range 1 3) 30.0))
    (data_mine_set_mission_segment "l100_011_training_phone")
    (object_set_vision_mode_render_default "terminal_l100_phone_01" false)
    (object_set_vision_mode_render_default "terminal_l100_phone_04" false)
    (object_create "control_l100_phone_01")
    (object_create "control_l100_phone_04")
    (device_group_set_immediate "dg_l100_phone_power" 1.0)
    (device_group_set_immediate "dg_l100_phone_position" 1.0)
    (set s_waypoint_index 1)
    (sleep 15)
    (if (not (is_skull_secondary_enabled skull_blind)) 
        (begin
            (wake h100_tr_player0_navpoint)
            (if (coop_players_2) 
                (wake h100_tr_player1_navpoint))
            (if (coop_players_3) 
                (wake h100_tr_player2_navpoint))
            (if (coop_players_4) 
                (wake h100_tr_player3_navpoint))
        )
    )
    (sleep_until (> (device_group_get "dg_l100_phone_switch") 0.0) 1)
    (if debug 
        (print "*** you have answered the phone ***"))
    (game_save)
    (data_mine_set_mission_segment "l100_012_training_phone_answered")
    (set s_waypoint_index 0)
    (set g_music_h100_02 true)
    (object_set_vision_mode_render_default "terminal_l100_phone_01" true)
    (object_set_vision_mode_render_default "terminal_l100_phone_04" true)
    (object_destroy "control_l100_phone_01")
    (object_destroy "control_l100_phone_04")
    (device_group_set_immediate "dg_l100_phone_power" 0.0)
    (device_group_set_immediate "dg_l100_phone_position" 0.0)
    (sleep 15)
    (if (is_skull_secondary_enabled skull_blind) 
        (begin
            (set b_l100_access true)
        ) (begin
            (wake l100_player0_access)
            (if (coop_players_2) 
                (wake l100_player1_access))
            (if (coop_players_3) 
                (wake l100_player2_access))
            (if (coop_players_4) 
                (wake l100_player3_access))
        )
    )
    (sleep_until b_l100_access 1)
    (data_mine_set_mission_segment "l100_013_training_pda_prompt")
    (game_save_cancel)
    (if 
        (or
            (gp_boolean_get "gp_tr_pda_complete")
            (is_skull_secondary_enabled skull_blind)
        ) 
            (begin
                (wake player0_h100_pda_activate)
                (if (coop_players_2) 
                    (wake player1_h100_pda_activate))
                (if (coop_players_3) 
                    (wake player2_h100_pda_activate))
                (if (coop_players_4) 
                    (wake player3_h100_pda_activate))
            ) (begin
                (wake l100_tr_player0_pda)
                (if (coop_players_2) 
                    (wake l100_tr_player1_pda))
                (if (coop_players_3) 
                    (wake l100_tr_player2_pda))
                (if (coop_players_4) 
                    (wake l100_tr_player3_pda))
                (wake l100_tr_player0_pda_revert)
                (if (coop_players_2) 
                    (wake l100_tr_player1_pda_revert))
                (if (coop_players_3) 
                    (wake l100_tr_player2_pda_revert))
                (if (coop_players_4) 
                    (wake l100_tr_player3_pda_revert))
            )
    )
    (wake player0_award_tourist)
    (if (coop_players_2) 
        (wake player1_award_tourist))
    (if (coop_players_3) 
        (wake player2_award_tourist))
    (if (coop_players_4) 
        (wake player3_award_tourist))
    (sleep_until b_pda_continue)
    (data_mine_set_mission_segment "l100_015_roundabout_proceed")
    (game_save)
    (device_group_set_immediate "dg_l100_door_01" 1.0)
    (device_group_set_immediate "dg_l100_door_02" 1.0)
    (set s_waypoint_index 2)
)

(script dormant void l100_player0_task
    (set b_l100_player0_task false)
    (sleep_until (not (vehicle_test_seat "pod_odst_00" none)))
    (sleep_until (script_started "player0_health_vision"))
    (sleep_until (script_finished "player0_health_vision"))
    (if debug 
        (print "allow ai to move forward"))
    (set b_l100_player0_task true)
)

(script dormant void l100_player1_task
    (set b_l100_player1_task false)
    (sleep_until (not (vehicle_test_seat "pod_odst_01" none)))
    (sleep_until (script_started "player1_health_vision"))
    (sleep_until (script_finished "player1_health_vision"))
    (if debug 
        (print "allow ai to move forward"))
    (set b_l100_player1_task true)
)

(script dormant void l100_player2_task
    (set b_l100_player2_task false)
    (sleep_until (not (vehicle_test_seat "pod_odst_02" none)))
    (sleep_until (script_started "player2_health_vision"))
    (sleep_until (script_finished "player2_health_vision"))
    (if debug 
        (print "allow ai to move forward"))
    (set b_l100_player2_task true)
)

(script dormant void l100_player3_task
    (set b_l100_player3_task false)
    (sleep_until (not (vehicle_test_seat "pod_odst_03" none)))
    (sleep_until (script_started "player3_health_vision"))
    (sleep_until (script_finished "player3_health_vision"))
    (if debug 
        (print "allow ai to move forward"))
    (set b_l100_player3_task true)
)

(script command_script void cs_l100_phantom_01
    (set v_l100_phantom_01 (ai_vehicle_get_from_starting_location "sq_l100_phantom_01/phantom"))
    (ai_force_active "sq_l100_phantom_01" true)
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (sleep 1)
    (cs_vehicle_speed 0.45)
    (cs_fly_by "ps_l100_phantom/ph01_01" 5.0)
    (cs_fly_by "ps_l100_phantom/ph01_02" 5.0)
    (if (not (gp_boolean_get "gp_h100_from_mainmenu")) 
        (begin
            (cs_fly_to "ps_l100_phantom/ph01_03" 5.0)
            (sleep 30)
            (cs_vehicle_speed 0.15)
            (cs_fly_by "ps_l100_phantom/ph01_drop" 1.0)
            (sleep 30)
            (vehicle_hover v_l100_phantom_01 true)
            (sleep 15)
            (f_load_phantom v_l100_phantom_01 "chute" "sq_l100_cov_01" "sq_l100_cov_02" none none)
            (sleep 1)
            (f_unload_phantom v_l100_phantom_01 "chute")
            (sleep 30)
            (ai_force_active "sq_l100_cov_01" true)
            (ai_force_active "sq_l100_cov_02" true)
            (vehicle_hover v_l100_phantom_01 false)
            (cs_vehicle_speed 0.5)
            (cs_fly_to "ps_l100_phantom/ph01_03" 5.0)
            (sleep 30)
        )
    )
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_l100_phantom/ph01_04" 5.0)
    (cs_fly_by "ps_l100_phantom/ph01_05" 5.0)
    (cs_fly_by "ps_l100_phantom/ph01_06" 5.0)
    (cs_fly_by "ps_l100_phantom/ph01_erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_l100_phantom_02
    (set v_l100_phantom_02 (ai_vehicle_get_from_starting_location "sq_l100_phantom_02/phantom"))
    (ai_force_active "sq_l100_phantom_02" true)
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (sleep 1)
    (sleep (* 30.0 10.0))
    (cs_fly_by "ps_l100_phantom/ph02_01" 5.0)
    (cs_fly_by "ps_l100_phantom/ph02_02" 5.0)
    (cs_fly_by "ps_l100_phantom/ph02_03" 5.0)
    (cs_fly_by "ps_l100_phantom/ph02_04" 5.0)
    (if (not (gp_boolean_get "gp_h100_from_mainmenu")) 
        (begin
            (cs_fly_to_and_face "ps_l100_phantom/ph02_05" "ps_l100_phantom/ph02_06" 5.0)
            (sleep 30)
            (cs_vehicle_speed 0.15)
            (cs_fly_by "ps_l100_phantom/ph02_drop" 1.0)
            (sleep 30)
            (vehicle_hover v_l100_phantom_02 true)
            (sleep 15)
            (f_load_phantom v_l100_phantom_02 "chute" "sq_l100_cov_03" "sq_l100_cov_04" none none)
            (sleep 1)
            (f_unload_phantom v_l100_phantom_02 "chute")
            (sleep 30)
            (ai_force_active "sq_l100_cov_03" true)
            (ai_force_active "sq_l100_cov_04" true)
            (vehicle_hover v_l100_phantom_02 false)
            (cs_vehicle_speed 0.5)
            (cs_fly_to "ps_l100_phantom/ph02_05" 5.0)
            (sleep 30)
        )
    )
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_l100_phantom/ph02_06" 5.0)
    (cs_fly_by "ps_l100_phantom/ph02_07" 5.0)
    (cs_fly_by "ps_l100_phantom/ph02_08" 5.0)
    (cs_fly_by "ps_l100_phantom/ph02_erase")
    (ai_erase ai_current_squad)
)

(script dormant void enc_courtyard
    (sleep_until 
        (or
            (volume_test_players "tv_l100_cy_01")
            (>= (device_get_position "dm_l100_door01") 1.0)
        ) 
    1)
    (if debug 
        (print "enc_courtyard "))
    (if debug 
        (print "set objective control 1"))
    (set s_cy_obj_control 1)
    (game_save)
    (data_mine_set_mission_segment "l100_020_enc_courtyard")
    (set g_music_h100_03 true)
    (set s_waypoint_index 3)
    (ai_place "sq_l100_grunt_01")
    (ai_place "sq_l100_grunt_02")
    (ai_place "sq_l100_grunt_03")
    (ai_place "sq_l100_grunt_04")
    (sleep 1)
    (ai_force_active "sq_l100_grunt_01" true)
    (ai_force_active "sq_l100_grunt_02" true)
    (ai_force_active "sq_l100_grunt_03" true)
    (ai_force_active "sq_l100_grunt_04" true)
    (if 
        (and
            (not (gp_boolean_get "gp_tr_beacon_complete"))
            (not (is_skull_secondary_enabled skull_blind))
        ) 
            (begin
                (wake player0_l00_beacon)
                (if (coop_players_2) 
                    (wake player1_l00_beacon))
                (if (coop_players_3) 
                    (wake player2_l00_beacon))
                (if (coop_players_4) 
                    (wake player3_l00_beacon))
            )
    )
    (player0_kill_pda_training)
    (if (coop_players_2) 
        (player1_kill_pda_training))
    (if (coop_players_3) 
        (player2_kill_pda_training))
    (if (coop_players_4) 
        (player3_kill_pda_training))
    (sleep_until (volume_test_players "tv_l100_cy_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set s_cy_obj_control 2)
    (set g_music_h100_04 true)
    (sleep_until 
        (or
            (volume_test_players "tv_l100_cy_03")
            (>= (device_get_position "dm_l100_court_door_01") 1.0)
        ) 
    1)
    (if debug 
        (print "set objective control 3"))
    (set s_cy_obj_control 3)
    (game_save)
    (data_mine_set_mission_segment "l100_021_enc_courtyard")
    (set s_waypoint_index 4)
    (set g_music_h100_05 true)
    (sleep_until (<= (ai_living_count "gr_l100_courtyard_cov") 0))
    (set g_music_h100_02 false)
    (set g_music_h100_03 false)
    (set g_music_h100_04 false)
    (set g_music_h100_05 false)
)

(script dormant void enc_building
    (sleep_until (volume_test_players "tv_l100_bldg_01") 1)
    (if debug 
        (print "set objective control 1"))
    (set s_bldg_obj_control 1)
    (game_save)
    (data_mine_set_mission_segment "l100_030_enc_building")
    (set s_waypoint_index 5)
    (set g_music_h100_02 false)
    (set g_music_h100_03 false)
    (set g_music_h100_04 false)
    (set g_music_h100_05 false)
    (ai_place "sq_l100_jackals")
    (sleep_until (volume_test_players "tv_l100_bldg_02") 1)
    (if debug 
        (print "set objective control 2"))
    (set s_bldg_obj_control 2)
    (set g_music_h100_06 true)
    (sleep_until (volume_test_players "tv_l100_bldg_03") 1)
    (if debug 
        (print "set objective control 3"))
    (set s_bldg_obj_control 3)
    (game_save)
    (sleep_until (volume_test_players "tv_l100_bldg_04") 1)
    (if debug 
        (print "set objective control 4"))
    (set s_bldg_obj_control 4)
    (sleep_until (volume_test_players "tv_l100_bldg_05") 1)
    (if debug 
        (print "set objective control 5"))
    (set s_bldg_obj_control 5)
    (sleep_until (volume_test_players "tv_l100_bldg_06") 1)
    (if debug 
        (print "set objective control 6"))
    (set s_bldg_obj_control 6)
    (game_save)
    (set g_music_h100_07 true)
    (data_mine_set_mission_segment "l100_040_beacon_room")
)

(script command_script void cs_l100_bldg_jackal
    (cs_crouch true)
    (cs_stow)
    (sleep_until (> (device_get_position "dm_l100_jackal_door") 0.0))
    (cs_force_combat_status 4)
    (cs_draw)
)

(script static void f_l100_look_training (short player_short)
    (if debug 
        (print "begin game mechanic training"))
    (data_mine_set_mission_segment "l100_001_look_training")
    (device_set_power "pod00_control_01" 0.0)
    (device_set_power "pod00_control_02" 0.0)
    (device_set_power "pod00_control_03" 0.0)
    (device_set_power "pod00_control_04" 0.0)
    (pda_input_enable (player_get player_short) false)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_look")
    (f_sfx_hud_in player_short)
    (sleep 15)
    (unit_control_fade_in_all_input (player_get player_short) 1.0)
    (training_player_has_looked)
    (f_sfx_hud_in player_short)
    (f_display_message_confirm player_short "tr_look_accept" "tr_blank_short")
    (cond
        ((player_action_test_accept)
            (begin
                (if debug 
                    (print "camera settings accepted"))
                (f_training_set_look_pref player_00)
            )
        )
        ((player_action_test_cancel)
            (begin
                (if debug 
                    (print "camera settings rejected"))
                (f_training_look_rejected player_00)
            )
        )
    )
)

(script static void f_training_look_rejected (short player_short)
    (chud_show_cinematic_title (player_get player_short) "tr_look_reject")
    (training_invert_camera)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_look")
    (sleep 15)
    (training_player_has_looked)
    (f_display_message_confirm player_short "tr_look_accept" "tr_blank_short")
    (cond
        ((player_action_test_accept)
            (begin
                (sleep 15)
                (if debug 
                    (print "accept current settings"))
                (f_training_set_look_pref player_00)
            )
        )
        ((player_action_test_cancel)
            (begin
                (sleep 15)
                (if debug 
                    (print "invert then accept settings"))
                (training_invert_camera)
                (sleep 15)
                (f_training_set_look_pref player_00)
            )
        )
    )
)

(script static void f_training_set_look_pref (short player_short)
    (chud_show_cinematic_title (player_get player_short) "tr_blank_long")
    (sleep 30)
    (f_sfx_hud_in player_short)
    (if (controller_get_look_invert) 
        (f_display_message_accept player_short "tutorial_set_invert_01" "tr_blank_long") (f_display_message_accept player_short "tutorial_set_normal_01" "tr_blank_long"))
    (f_display_message_accept player_short "tutorial_start_menu" "tr_blank_short")
    (sleep 15)
)

(script static void training_invert_camera
    (if (controller_get_look_invert) 
        (controller_set_look_invert false) (controller_set_look_invert true))
)

(script static void training_player_has_looked
    (player_action_test_reset)
    (sleep 5)
    (sleep_until 
        (or
            (player_action_test_look_relative_up)
            (player_action_test_look_relative_down)
            (player_action_test_look_relative_left)
            (player_action_test_look_relative_right)
        )
    )
    (sleep_until (player_action_test_look_relative_all_directions) 30 (* 30.0 10.0))
    (sleep 120)
)

(script dormant void player0_health_vision
    (f_health_vision player_00 "tv_l100_p0_01" "tv_l100_p0_02")
)

(script dormant void player1_health_vision
    (f_health_vision player_01 "tv_l100_p1_01" "tv_l100_p1_02")
)

(script dormant void player2_health_vision
    (f_health_vision player_02 "tv_l100_p2_01" "tv_l100_ra_02")
)

(script dormant void player3_health_vision
    (f_health_vision player_03 "tv_l100_ra_04" "tv_l100_ra_03")
)

(script static void f_health_vision (short player_short, trigger_volume volume_01, trigger_volume volume_02)
    (if (not (is_skull_secondary_enabled skull_blind)) 
        (begin
            (if (not (gp_boolean_get "gp_tr_health_complete")) 
                (begin
                    (f_training_stamina player_short volume_01 volume_02)
                    (sleep 15)
                    (game_save)
                    (f_training_health player_short volume_01 volume_02)
                    (sleep 15)
                    (game_save)
                )
            )
            (if 
                (and
                    (not (gp_boolean_get "gp_tr_vision_complete"))
                    (or
                        (volume_test_object volume_01 (player_get player_short))
                        (volume_test_object volume_02 (player_get player_short))
                    )
                ) 
                    (begin
                        (f_training_vision player_short volume_01 volume_02)
                        (sleep 15)
                        (game_save)
                    )
            )
        )
    )
)

(script static void f_training_stamina (short player_short, trigger_volume volume_01, trigger_volume volume_02)
    (sleep_until (not (unit_in_vehicle (player_get player_short))))
    (sleep_until (< (object_get_shield (player_get player_short)) 1.0) 1 120)
    (if (< (object_get_shield (player_get player_short)) 1.0) 
        (begin
            (sleep 15)
            (f_sfx_hud_in player_short)
            (f_display_message player_short "tr_stamina_depleted")
            (sleep 60)
            (f_display_message player_short "tr_stamina_recharge")
            (sleep 45)
            (sleep_until 
                (or
                    (>= (object_get_shield (player_get player_short)) 1.0)
                    (not (volume_test_object volume_01 (player_get player_short)))
                ) 
            1)
            (if (volume_test_object volume_01 (player_get player_short)) 
                (begin
                    (f_display_message player_short "tr_stamina_full")
                    (sleep 90)
                ) (f_display_message player_short "tr_blank_long"))
        )
    )
)

(script static void f_training_health (short player_short, trigger_volume volume_01, trigger_volume volume_02)
    (if 
        (and
            (< (object_get_health (player_get player_short)) 1.0)
            (volume_test_object volume_01 (player_get player_short))
        ) 
            (begin
                (f_sfx_hud_in player_short)
                (f_display_message player_short "tr_health_depleted")
                (sleep 60)
                (if (volume_test_object volume_01 (player_get player_short)) 
                    (f_display_message player_short "tr_health_locate"))
            )
    )
    (sleep_until 
        (or
            (>= (object_get_health (player_get player_short)) 1.0)
            (not (volume_test_object volume_01 (player_get player_short)))
        ) 
    1)
    (sleep 15)
    (if 
        (and
            (>= (object_get_health (player_get player_short)) 1.0)
            (volume_test_object volume_01 (player_get player_short))
        ) 
            (f_display_message player_short "tr_health_full") (f_display_message player_short "tr_blank_long"))
    (sleep 90)
    (sleep_until 
        (begin
            (if (volume_test_object volume_01 (player_get player_short)) 
                (begin
                    (f_sfx_hud_in player_short)
                    (f_display_repeat_training player_short "tr_health_repeat" "tr_blank_long" volume_01 volume_02)
                    (if (unit_action_test_retrain (player_get player_short)) 
                        (begin
                            (sleep 15)
                            (if (f_player_in_volumes player_short volume_01 volume_02) 
                                (f_display_message_accept_volume player_short "tr_stamina_revisited01" "tr_blank_long" volume_01 volume_02))
                            (if (f_player_in_volumes player_short volume_01 volume_02) 
                                (f_display_message_accept_volume player_short "tr_stamina_revisited02" "tr_blank_long" volume_01 volume_02))
                            (if (f_player_in_volumes player_short volume_01 volume_02) 
                                (f_display_message_accept_volume player_short "tr_health_revisited" "tr_blank_long" volume_01 volume_02))
                        )
                    )
                )
            )
            (or
                (not (volume_test_object volume_01 (player_get player_short)))
                (unit_action_test_cancel (player_get player_short))
            )
        ) 
    1)
    (f_display_message player_short "tr_blank_long")
    (gp_boolean_set "gp_tr_health_complete" true)
)

(script static void f_training_vision (short player_short, trigger_volume volume_01, trigger_volume volume_02)
    (unit_action_test_reset (player_get player_short))
    (sleep 5)
    (sleep_until 
        (begin
            (if (f_player_in_volumes player_short volume_01 volume_02) 
                (f_sfx_hud_in player_short))
            (if (unit_flashlight_on (player_get player_short)) 
                (if (f_player_in_volumes player_short volume_01 volume_02) 
                    (f_display_message_accept_volume player_short "tr_vision_currently_active" "tr_blank_long" volume_01 volume_02)) (if (f_player_in_volumes player_short volume_01 volume_02) 
                    (f_display_message_vision player_short "tr_vision_on" "tr_blank_long" volume_01 volume_02))
            )
            (sleep 15)
            (if (f_player_in_volumes player_short volume_01 volume_02) 
                (f_display_message_accept_volume player_short "tr_vision_help" "tr_blank_long" volume_01 volume_02))
            (if (f_player_in_volumes player_short volume_01 volume_02) 
                (f_display_message_accept_volume player_short "tr_vision_allies" "tr_blank_long" volume_01 volume_02))
            (if (f_player_in_volumes player_short volume_01 volume_02) 
                (f_display_message_accept_volume player_short "tr_vision_enemies" "tr_blank_long" volume_01 volume_02))
            (sleep 15)
            (if (f_player_in_volumes player_short volume_01 volume_02) 
                (f_display_repeat_training player_short "tr_vision_repeat" "tr_blank_long" volume_01 volume_02))
            (or
                (not (f_player_in_volumes player_short volume_01 volume_02))
                (unit_action_test_cancel (player_get player_short))
            )
        ) 
    1)
    (f_display_message player_short "tr_blank_short")
    (gp_boolean_set "gp_tr_vision_complete" true)
)

(script static boolean f_player_in_volumes (short player_short, trigger_volume volume_01, trigger_volume volume_02)
    (or
        (volume_test_object volume_01 (player_get player_short))
        (volume_test_object volume_02 (player_get player_short))
    )
)

(script static void player0_kill_training
    (if 
        (and
            (script_started "player0_health_vision")
            (not (script_finished "player0_health_vision"))
        ) 
            (begin
                (sleep_forever player0_health_vision)
                (f_display_message player_00 "tr_blank_short")
            )
    )
)

(script static void player1_kill_training
    (if 
        (and
            (script_started "player1_health_vision")
            (not (script_finished "player1_health_vision"))
        ) 
            (begin
                (sleep_forever player1_health_vision)
                (f_display_message player_01 "tr_blank_short")
            )
    )
)

(script static void player2_kill_training
    (if 
        (and
            (script_started "player2_health_vision")
            (not (script_finished "player2_health_vision"))
        ) 
            (begin
                (sleep_forever player2_health_vision)
                (f_display_message player_02 "tr_blank_short")
            )
    )
)

(script static void player3_kill_training
    (if 
        (and
            (script_started "player3_health_vision")
            (not (script_finished "player3_health_vision"))
        ) 
            (begin
                (sleep_forever player3_health_vision)
                (f_display_message player_03 "tr_blank_short")
            )
    )
)

(script static void player0_kill_pda_training
    (if 
        (and
            (script_started "l100_tr_player0_pda")
            (not (script_finished "l100_tr_player0_pda"))
            (not (pda_is_active_deterministic (player0)))
        ) 
            (begin
                (sleep_forever l100_tr_player0_pda)
            )
    )
)

(script static void player1_kill_pda_training
    (if 
        (and
            (script_started "l100_tr_player1_pda")
            (not (script_finished "l100_tr_player1_pda"))
            (not (pda_is_active_deterministic (player1)))
        ) 
            (begin
                (sleep_forever l100_tr_player1_pda)
            )
    )
)

(script static void player2_kill_pda_training
    (if 
        (and
            (script_started "l100_tr_player2_pda")
            (not (script_finished "l100_tr_player2_pda"))
            (not (pda_is_active_deterministic (player2)))
        ) 
            (begin
                (sleep_forever l100_tr_player2_pda)
            )
    )
)

(script static void player3_kill_pda_training
    (if 
        (and
            (script_started "l100_tr_player3_pda")
            (not (script_finished "l100_tr_player3_pda"))
            (not (pda_is_active_deterministic (player3)))
        ) 
            (begin
                (sleep_forever l100_tr_player3_pda)
            )
    )
)

(script dormant void player0_purpose
    (f_player_purpose player_00)
)

(script dormant void player1_purpose
    (f_player_purpose player_01)
)

(script dormant void player2_purpose
    (f_player_purpose player_02)
)

(script dormant void player3_purpose
    (f_player_purpose player_03)
)

(script static void f_player_purpose (short player_short)
    (f_sfx_hud_in player_short)
    (f_display_message_accept player_short "tr_purpose_01" "tr_blank_long")
    (f_display_message_accept player_short "tr_purpose_02" "tr_blank_short")
    (f_sfx_hud_out player_short)
    (set b_h100_purpose_complete true)
)

(script dormant void player0_h100_pda_activate
    (f_l100_activate_pda_controls player_00)
)

(script dormant void player1_h100_pda_activate
    (f_l100_activate_pda_controls player_01)
)

(script dormant void player2_h100_pda_activate
    (f_l100_activate_pda_controls player_02)
)

(script dormant void player3_h100_pda_activate
    (f_l100_activate_pda_controls player_03)
)

(script static void f_l100_activate_pda_controls (short player_short)
    (sleep_forever player0_purpose)
    (if (coop_players_2) 
        (sleep_forever player1_purpose))
    (if (coop_players_3) 
        (sleep_forever player2_purpose))
    (if (coop_players_4) 
        (sleep_forever player3_purpose))
    (sleep 90)
    (player_set_pda_enabled (player_get player_short) true)
    (sleep 1)
    (pda_input_enable (player_get player_short) true)
    (if (not (is_skull_secondary_enabled skull_blind)) 
        (begin
            (if (gp_boolean_get "gp_tr_pda_complete") 
                (begin
                    (pda_input_enable (player_get player_short) true)
                    (pda_input_enable_a (player_get player_short) true)
                    (pda_input_enable_dismiss (player_get player_short) true)
                    (pda_input_enable_x (player_get player_short) true)
                    (pda_input_enable_y (player_get player_short) true)
                    (pda_input_enable_dpad (player_get player_short) true)
                ) (begin
                    (chud_display_pda_minimap_message "pda_activate_nav" "fl_beacon_sc100")
                    (f_sfx_hud_in player_00)
                    (if (coop_players_2) 
                        (f_sfx_hud_in player_01))
                    (if (coop_players_3) 
                        (f_sfx_hud_in player_02))
                    (if (coop_players_4) 
                        (f_sfx_hud_in player_03))
                )
            )
        )
    )
    (player_set_fourth_wall_enabled (player_get player_short) true)
    (player_set_objectives_enabled (player_get player_short) true)
    (objectives_show 0)
    (objectives_show 1)
    (objectives_finish 0)
    (if debug 
        (print "activating pda beacons..."))
    (pda_activate_beacon player "fl_beacon_sc100" "beacon_waypoints" true)
    (chud_show_compass true)
    (set b_pda_continue true)
    (if (not (is_skull_secondary_enabled skull_blind)) 
        (begin
            (unit_action_test_reset (player_get player_short))
            (sleep 1)
            (sleep_until (pda_is_active_deterministic (player_get player_short)) 45)
            (achievement_grant_to_player (player_get player_short) "_achievement_tourist")
        )
    )
)

(script dormant void l100_tr_player0_pda
    (f_l100_pda_training player_00 "tv_bsp_050" "tv_null" "gp_player0_pda_complete")
)

(script dormant void l100_tr_player1_pda
    (f_l100_pda_training player_01 "tv_bsp_050" "tv_null" "gp_player1_pda_complete")
)

(script dormant void l100_tr_player2_pda
    (f_l100_pda_training player_02 "tv_bsp_050" "tv_null" "gp_player2_pda_complete")
)

(script dormant void l100_tr_player3_pda
    (f_l100_pda_training player_03 "tv_bsp_050" "tv_null" "gp_player3_pda_complete")
)

(script static void f_l100_pda_training (short player_short, trigger_volume volume_01, trigger_volume volume_02, string_id training_boolean)
    (game_save_cancel)
    (sleep_forever player0_purpose)
    (if (coop_players_2) 
        (sleep_forever player1_purpose))
    (if (coop_players_3) 
        (sleep_forever player2_purpose))
    (if (coop_players_4) 
        (sleep_forever player3_purpose))
    (sleep 90)
    (f_virgil_in player_00)
    (if (coop_players_2) 
        (f_virgil_in player_01))
    (if (coop_players_3) 
        (f_virgil_in player_02))
    (if (coop_players_4) 
        (f_virgil_in player_03))
    (chud_display_pda_minimap_message "pda_activate_nav" "fl_beacon_sc100")
    (player_set_pda_enabled (player_get player_short) true)
    (sleep 1)
    (player_set_objectives_enabled (player_get player_short) false)
    (player_set_fourth_wall_enabled (player_get player_short) false)
    (sleep_until (pda_is_active_deterministic (player_get player_short)) 1)
    (chud_display_pda_minimap_message "" "fl_beacon_sc100")
    (player_force_pda (player_get player_short))
    (game_save_cancel)
    (object_cannot_take_damage (player_get player_short))
    (sleep_until 
        (begin
            (if (<= s_cy_obj_control 1) 
                (begin
                    (game_save_cancel)
                    (pda_input_enable (player_get player_short) false)
                    (pda_input_enable_a (player_get player_short) false)
                    (pda_input_enable_dismiss (player_get player_short) false)
                    (pda_input_enable_x (player_get player_short) false)
                    (pda_input_enable_y (player_get player_short) false)
                    (pda_input_enable_dpad (player_get player_short) false)
                    (sleep 60)
                    (f_virgil_in player_short)
                    (f_display_message_accept player_short "tr_pda_01" "tr_blank_long")
                    (f_display_message_accept player_short "tr_pda_02" "tr_blank_long")
                    (pda_input_enable_analog_sticks (player_get player_short) true)
                    (f_virgil_in player_short)
                    (f_display_message_move_stick player_short "tr_pda_move" "tr_blank_long")
                    (f_display_message_look_stick player_short "tr_pda_zoom" "tr_blank_long")
                    (pda_input_enable_a (player_get player_short) true)
                    (chud_show_compass true)
                    (f_virgil_in player_short)
                    (f_display_message_accept player_short "tr_pda_waypoint" "tr_blank_long")
                    (pda_input_enable_a (player_get player_short) false)
                    (pda_input_enable_analog_sticks (player_get player_short) false)
                    (f_display_message_accept player_short "tr_pda_waypoint_compass" "tr_blank_long")
                    (pda_input_enable_y (player_get player_short) true)
                    (f_virgil_in player_short)
                    (f_display_message player_short "tr_pda_y_button")
                    (f_tr_pad_y_button player_short)
                    (f_tr_pad_y_button player_short)
                    (f_tr_pad_y_button player_short)
                    (sleep 30)
                    (pda_input_enable_x (player_get player_short) true)
                    (f_virgil_in player_short)
                    (f_display_message_x player_short "tr_pda_disable_waypoint" "tr_blank_long")
                    (pda_input_enable_y (player_get player_short) false)
                    (pda_input_enable_x (player_get player_short) false)
                    (sleep 60)
                    (pda_activate_beacon player "fl_beacon_sc100" "beacon_waypoints" true)
                    (f_virgil_in player_short)
                    (f_display_message_accept player_short "tr_pda_new_nav_data" "tr_blank_long")
                    (pda_input_enable_dpad (player_get player_short) true)
                    (f_display_message_dpad_up_down player_short "tr_pda_list" "tr_blank_long")
                    (sleep 60)
                    (f_display_message_accept player_short "tr_pda_tayari" "tr_blank_long")
                    (f_display_message_accept player_short "tr_pda_beacon_compass" "tr_blank_long")
                    (f_display_message_accept player_short "tr_pda_locate_beacon" "tr_blank_long")
                    (pda_input_enable_dpad (player_get player_short) false)
                    (sleep 45)
                    (game_save_cancel)
                    (f_virgil_in player_short)
                    (f_display_message_accept player_short "intel_new_data_accept" "tr_blank_long")
                    (objectives_show 0)
                    (sleep 15)
                    (player_set_objectives_enabled (player_get player_short) true)
                    (f_display_message_bumpers player_short "tr_pda_intel_01" "tr_blank_long")
                    (player_set_nav_enabled (player_get player_short) false)
                    (sleep 45)
                    (f_display_message_accept player_short "tr_pda_intel_02" "tr_blank_long")
                    (sleep 30)
                    (f_virgil_in player_short)
                    (objectives_finish 0)
                    (f_display_message_accept player_short "obj_completed" "tr_blank_long")
                    (sleep 60)
                    (f_virgil_in player_short)
                    (objectives_show 1)
                    (f_display_message_accept player_short "intel_new_data_accept" "tr_blank_long")
                    (sleep 45)
                    (game_save_cancel)
                    (player_set_fourth_wall_enabled (player_get player_short) true)
                    (sleep 1)
                    (f_virgil_in player_short)
                    (f_display_message_bumpers player_short "tr_pda_comm_01" "tr_blank_long")
                    (player_set_objectives_enabled (player_get player_short) false)
                    (sleep 45)
                    (f_display_message_accept player_short "tr_pda_comm_02" "tr_blank_long")
                    (f_display_message_accept player_short "tr_pda_comm_03" "tr_blank_long")
                    (sleep 60)
                    (game_save_cancel)
                    (f_virgil_in player_short)
                    (if (<= s_cy_obj_control 1) 
                        (begin
                            (f_display_repeat_training player_short "tr_pda_repeat" "tr_blank_long" volume_01 volume_02)
                            (cond
                                ((unit_action_test_retrain (player_get player_short))
                                    (begin
                                        (pda_activate_beacon player "fl_beacon_sc100" "beacon_waypoints" false)
                                        (chud_show_compass true)
                                        (player_set_objectives_enabled (player_get player_short) false)
                                        (player_set_fourth_wall_enabled (player_get player_short) false)
                                        (player_close_pda (player_get player_short))
                                        (sleep 1)
                                        (player_force_pda (player_get player_short))
                                        (chud_show_cinematic_title (player_get player_short) "tr_blank_short")
                                    )
                                )
                                (true
                                    (begin
                                        (f_display_message_back_b player_short "tr_pda_deactivate" "tr_blank_short")
                                        (pda_input_enable_dismiss (player_get player_short) true)
                                        (player_close_pda (player_get player_short))
                                        (f_virgil_out player_short)
                                    )
                                )
                            )
                        ) (begin
                            (f_display_message_back_b player_short "tr_pda_deactivate" "tr_blank_short")
                            (pda_input_enable_dismiss (player_get player_short) true)
                            (player_close_pda (player_get player_short))
                            (f_virgil_out player_short)
                        )
                    )
                )
            )
            (or
                (> s_cy_obj_control 1)
                (unit_action_test_back (player_get player_short))
                (unit_action_test_cancel (player_get player_short))
            )
        ) 
    1)
    (gp_boolean_set training_boolean true)
    (player_set_nav_enabled (player_get player_short) true)
    (player_set_objectives_enabled (player_get player_short) true)
    (player_set_fourth_wall_enabled (player_get player_short) true)
    (pda_input_enable (player_get player_short) true)
    (pda_input_enable_a (player_get player_short) true)
    (pda_input_enable_dismiss (player_get player_short) true)
    (pda_input_enable_x (player_get player_short) true)
    (pda_input_enable_y (player_get player_short) true)
    (pda_input_enable_dpad (player_get player_short) true)
    (sleep 1)
    (gp_boolean_set "gp_tr_pda_complete" true)
    (sleep 30)
    (set b_pda_continue true)
    (object_can_take_damage (player_get player_short))
)

(script static void f_tr_pad_y_button (short player_short)
    (unit_action_test_reset (player_get player_short))
    (sleep 15)
    (sleep_until (unit_action_test_y (player_get player_short)) 1)
    (f_sfx_a_button player_short)
    (sleep 15)
)

(script dormant void l100_tr_player0_pda_revert
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (game_reverted)
                    (script_finished "l100_tr_player0_pda")
                ) 
            1)
            (if debug 
                (print "** pda training revert running **"))
            (if 
                (and
                    (script_started "l100_tr_player0_pda")
                    (not (script_finished "l100_tr_player0_pda"))
                ) 
                    (begin
                        (sleep 5)
                        (if debug 
                            (print "** force player0 pda active **"))
                        (player_force_pda (player0))
                    )
            )
            (script_finished "l100_tr_player0_pda")
        ) 
    1)
)

(script dormant void l100_tr_player1_pda_revert
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (game_reverted)
                    (script_finished "l100_tr_player1_pda")
                ) 
            1)
            (if debug 
                (print "** pda training revert running **"))
            (if 
                (and
                    (script_started "l100_tr_player1_pda")
                    (not (script_finished "l100_tr_player1_pda"))
                ) 
                    (begin
                        (sleep 5)
                        (if debug 
                            (print "** force player1 pda active **"))
                        (player_force_pda (player1))
                    )
            )
            (script_finished "l100_tr_player1_pda")
        ) 
    1)
)

(script dormant void l100_tr_player2_pda_revert
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (game_reverted)
                    (script_finished "l100_tr_player2_pda")
                ) 
            1)
            (if debug 
                (print "** pda training revert running **"))
            (if 
                (and
                    (script_started "l100_tr_player2_pda")
                    (not (script_finished "l100_tr_player2_pda"))
                ) 
                    (begin
                        (sleep 5)
                        (if debug 
                            (print "** force player2 pda active **"))
                        (player_force_pda (player2))
                    )
            )
            (script_finished "l100_tr_player2_pda")
        ) 
    1)
)

(script dormant void l100_tr_player3_pda_revert
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (game_reverted)
                    (script_finished "l100_tr_player3_pda")
                ) 
            1)
            (if debug 
                (print "** pda training revert running **"))
            (if 
                (and
                    (script_started "l100_tr_player3_pda")
                    (not (script_finished "l100_tr_player3_pda"))
                ) 
                    (begin
                        (sleep 5)
                        (if debug 
                            (print "** force player3 pda active **"))
                        (player_force_pda (player3))
                    )
            )
            (script_finished "l100_tr_player3_pda")
        ) 
    1)
)

(script dormant void l100_player0_access
    (f_l100_player_access player_00)
)

(script dormant void l100_player1_access
    (f_l100_player_access player_01)
)

(script dormant void l100_player2_access
    (f_l100_player_access player_02)
)

(script dormant void l100_player3_access
    (f_l100_player_access player_03)
)

(script static void f_l100_player_access (short player_short)
    (sleep 15)
    (f_tr_blink_arrows player_short)
    (f_tr_pda_access player_short)
    (f_tr_blink_arrows player_short)
    (f_tr_pda_establish player_short)
    (f_tr_blink_arrows player_short)
    (f_tr_pda_download player_short)
    (f_tr_blink_arrows player_short)
    (sleep 15)
    (f_display_message player_short "tr_blank_short")
    (sleep 5)
    (f_sfx_hud_out player_short)
    (set b_l100_access true)
)

(script static void f_tr_pda_access (short player_short)
    (chud_show_cinematic_title (player_get player_short) "tr_access_0")
    (sound_impulse_start sfx_stinger none 1.0)
    (sleep 15)
    (chud_show_cinematic_title (player_get player_short) "tr_access_1")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 15)
    (chud_show_cinematic_title (player_get player_short) "tr_access_2")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 15)
    (chud_show_cinematic_title (player_get player_short) "tr_access_3")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 15)
)

(script static void f_tr_pda_establish (short player_short)
    (chud_show_cinematic_title (player_get player_short) "tr_establish_0")
    (sound_impulse_start sfx_stinger none 1.0)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_establish_1")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_establish_2")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_establish_3")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 30)
)

(script static void f_tr_pda_download (short player_short)
    (chud_show_cinematic_title (player_get player_short) "tr_download_0")
    (sound_impulse_start sfx_stinger none 1.0)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_download_1")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_download_2")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 30)
    (chud_show_cinematic_title (player_get player_short) "tr_download_3")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 30)
)

(script static void f_tr_pda_interrupted (short player_short)
    (chud_show_cinematic_title (player_get player_short) "tr_interrupted_0")
    (sound_impulse_start sfx_stinger none 1.0)
    (sleep 90)
    (chud_show_cinematic_title (player_get player_short) "tr_interrupted_1")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 90)
    (chud_show_cinematic_title (player_get player_short) "tr_interrupted_2")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 90)
    (chud_show_cinematic_title (player_get player_short) "tr_interrupted_3")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 90)
)

(script static void f_tr_blink_arrows (short player_short)
    (chud_show_cinematic_title (player_get player_short) "tr_blink_0")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 5)
    (chud_show_cinematic_title (player_get player_short) "tr_blink_1")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 5)
    (chud_show_cinematic_title (player_get player_short) "tr_blink_2")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 5)
    (chud_show_cinematic_title (player_get player_short) "tr_blink_3")
    (sound_impulse_start sfx_timer none 1.0)
    (sleep 5)
)

(script static void sound_fx_servo
    (sound_looping_start sfx_servo_loop none 1.0)
    (sleep 45)
    (sound_looping_stop sfx_servo_loop)
    (sleep 45)
)

(script dormant void player0_l00_beacon
    (f_pda_player_in_beacon player_00)
)

(script dormant void player1_l00_beacon
    (f_pda_player_in_beacon player_01)
)

(script dormant void player2_l00_beacon
    (f_pda_player_in_beacon player_02)
)

(script dormant void player3_l00_beacon
    (f_pda_player_in_beacon player_03)
)

(script static void f_pda_player_in_beacon (short player_short)
    (sleep_until (player_inside_active_beacon (player_get player_short)))
    (sleep 60)
    (f_virgil_in player_short)
    (f_display_message_accept player_short "tr_pda_nav_beacon" "tr_blank_long")
    (f_display_message_accept player_short "tr_pda_nav_building" "tr_blank_long")
    (f_display_message_accept player_short "tr_visor_building" "tr_blank_short")
    (f_sfx_hud_out player_short)
    (gp_boolean_set "gp_tr_beacon_complete" true)
)

(script static void f_l100_retrain_players (short player_short, trigger_volume volume_01, trigger_volume volume_02)
    (f_display_repeat_training player_short "tr_retrain" "tr_blank_short" volume_01 volume_02)
    (if (unit_action_test_retrain (player_get player_short)) 
        (l100_reset_training_vars))
    (sleep 1)
)

(script static boolean l100_test_training_vars
    (and
        (gp_boolean_get "gp_tr_look_complete")
        (gp_boolean_get "gp_tr_health_complete")
        (gp_boolean_get "gp_tr_vision_complete")
        (gp_boolean_get "gp_tr_pda_complete")
        (gp_boolean_get "gp_tr_beacon_complete")
    )
)

(script dormant void player0_l00_waypoints
    (f_l100_waypoints player_00)
)

(script dormant void player1_l00_waypoints
    (f_l100_waypoints player_01)
)

(script dormant void player2_l00_waypoints
    (f_l100_waypoints player_02)
)

(script dormant void player3_l00_waypoints
    (f_l100_waypoints player_03)
)

(script static void f_l100_waypoints (short player_short)
    (sleep_until 
        (begin
            (f_sleep_until_activate_waypoint player_short)
            (cond
                ((player_inside_active_beacon (player_get player_short))
                    (f_waypoint_message player_short "null_flag" "nav_in_beacon" "tr_blank_short")
                )
                ((= s_waypoint_index 1)
                    (f_waypoint_activate_2 player_short "fl_l100_telephone_01" "fl_l100_telephone_04")
                )
                ((= s_waypoint_index 2)
                    (f_waypoint_activate_1 player_short "fl_l100_waypoint_01")
                )
                ((= s_waypoint_index 3)
                    (f_waypoint_activate_1 player_short "fl_l100_waypoint_02")
                )
                ((= s_waypoint_index 4)
                    (f_waypoint_activate_1 player_short "fl_l100_waypoint_03")
                )
                ((= s_waypoint_index 5)
                    (f_waypoint_activate_1 player_short "fl_l100_waypoint_04")
                )
            )
            false
        ) 
    1)
)

(script dormant void h100_tr_player0_navpoint
    (f_h100_navpoint_training player_00 "gp_player0_pda_complete")
)

(script dormant void h100_tr_player1_navpoint
    (f_h100_navpoint_training player_01 "gp_player1_pda_complete")
)

(script dormant void h100_tr_player2_navpoint
    (f_h100_navpoint_training player_02 "gp_player2_pda_complete")
)

(script dormant void h100_tr_player3_navpoint
    (f_h100_navpoint_training player_03 "gp_player3_pda_complete")
)

(script static void f_h100_navpoint_training (short player_short, string_id training_boolean)
    (if (not (gp_boolean_get "gp_l100_complete")) 
        (sleep (* 30.0 30.0)) (sleep 60))
    (if (<= (device_group_get "dg_l100_phone_switch") 0.0) 
        (begin
            (unit_action_test_reset (player_get player_short))
            (sleep 5)
            (f_sfx_hud_in player_short)
            (chud_show_cinematic_title (player_get player_short) "tr_dpad")
            (sleep 15)
            (sleep_until 
                (or
                    (unit_action_test_waypoint_activate (player_get player_short))
                    (>= (device_group_get "dg_l100_phone_switch") 1.0)
                    (volume_test_players "tv_bsp_080")
                    (>= s_cy_obj_control 1)
                ) 
            1)
            (if (unit_action_test_waypoint_activate (player_get player_short)) 
                (f_sfx_a_button player_short))
            (chud_show_cinematic_title (player_get player_short) "tr_blank")
            (sleep 15)
        )
    )
    (if (not (gp_boolean_get "gp_l100_complete")) 
        (begin
            (sleep_until 
                (or
                    (>= s_bldg_obj_control 1)
                    (gp_boolean_get training_boolean)
                ) 
            5)
            (sleep 300)
            (if (<= s_bldg_obj_control 1) 
                (begin
                    (unit_action_test_reset (player_get player_short))
                    (sleep 5)
                    (f_sfx_hud_in player_short)
                    (chud_show_cinematic_title (player_get player_short) "tr_dpad")
                    (sleep 15)
                    (sleep_until 
                        (or
                            (>= s_bldg_obj_control 1)
                            (unit_action_test_waypoint_activate (player_get player_short))
                        ) 
                    1)
                    (if (unit_action_test_waypoint_activate (player_get player_short)) 
                        (begin
                            (f_sfx_a_button player_short)
                        )
                    )
                    (chud_show_cinematic_title (player_get player_short) "tr_blank")
                    (sleep 15)
                )
            )
        )
    )
)

(script dormant void player0_sc110_beacon
    (f_h100_sc110_beacon player_00)
)

(script dormant void player1_sc110_beacon
    (f_h100_sc110_beacon player_01)
)

(script dormant void player2_sc110_beacon
    (f_h100_sc110_beacon player_02)
)

(script dormant void player3_sc110_beacon
    (f_h100_sc110_beacon player_03)
)

(script static void f_h100_sc110_beacon (short player_short)
    (sleep 150)
    (f_sfx_hud_in player_short)
    (f_display_message player_short "tr_pda_new_nav_data_fade")
    (sleep 30)
    (chud_display_pda_minimap_message "pda_activate_nav" "fl_beacon_sc100")
    (sleep_until (pda_is_active_deterministic (player_get player_short)) 1 (* 30.0 15.0))
    (if (pda_is_active_deterministic (player_get player_short)) 
        (begin
            (sleep 60)
            (pda_input_enable_a (player_get player_short) false)
            (f_display_message_accept player_short "sc110_uplift" "tr_blank_long")
            (f_display_message_accept player_short "sc110_note_beacon" "tr_blank_long")
            (f_display_message_accept player_short "tr_pda_locate_beacon" "tr_blank_short")
            (sleep 30)
            (f_sfx_hud_out player_short)
            (pda_input_enable_a (player_get player_short) true)
        ) (chud_display_pda_minimap_message "" "null_flag"))
)

(script static void test_pod00
    (f_create_pod_objects "player0_hands" "player0_torso" "pod_odst_00" "pod00_control_01" "pod00_control_02" "pod00_control_03" "pod00_control_04")
    (sleep 1)
    (f_l100_pod_setup player_00 "player0_hands" "player0_hands" "pod_odst_00" "pod00_control_01" "pod00_control_02" "pod00_control_03" "pod00_control_04")
    (sleep 1)
    (f_l100_pod_eject player_00 "player0_hands" "player0_hands" "pod_odst_00" "pod00_control_01" "pod00_control_02" "pod00_control_03" "pod00_control_04")
)

(script static void test_pod01
    (f_create_pod_objects "player1_hands" "player1_torso" "pod_odst_01" "pod01_control_01" "pod01_control_02" "pod01_control_03" "pod01_control_04")
    (sleep 1)
    (f_l100_pod_setup player_00 "player1_hands" "player1_hands" "pod_odst_01" "pod01_control_01" "pod01_control_02" "pod01_control_03" "pod01_control_04")
    (sleep 1)
    (f_l100_pod_eject player_00 "player1_hands" "player1_hands" "pod_odst_01" "pod01_control_01" "pod01_control_02" "pod01_control_03" "pod01_control_04")
)

(script static void test_pod02
    (f_create_pod_objects "player2_hands" "player2_torso" "pod_odst_02" "pod02_control_01" "pod02_control_02" "pod02_control_03" "pod02_control_04")
    (sleep 1)
    (f_l100_pod_setup player_00 "player2_hands" "player2_hands" "pod_odst_02" "pod02_control_01" "pod02_control_02" "pod02_control_03" "pod02_control_04")
    (sleep 1)
    (f_l100_pod_eject player_00 "player2_hands" "player2_hands" "pod_odst_02" "pod02_control_01" "pod02_control_02" "pod02_control_03" "pod02_control_04")
)

(script static void test_pod03
    (f_create_pod_objects "player3_hands" "player3_torso" "pod_odst_03" "pod03_control_01" "pod03_control_02" "pod03_control_03" "pod03_control_04")
    (sleep 1)
    (f_l100_pod_setup player_00 "player3_hands" "player3_hands" "pod_odst_03" "pod03_control_01" "pod03_control_02" "pod03_control_03" "pod03_control_04")
    (sleep 1)
    (f_l100_pod_eject player_00 "player3_hands" "player3_hands" "pod_odst_03" "pod03_control_01" "pod03_control_02" "pod03_control_03" "pod03_control_04")
)

(script static void test_health_vision_training
    (unit_set_current_vitality (player0) 20.0 20.0)
    (object_create_folder_anew "sc_l100_exterior")
    (object_create_folder_anew "cr_l100_exterior")
    (sleep 5)
    (wake player0_health_vision)
)

(script static void test_kill_beacon_listen
    (sleep_forever sc100_beacon_listen)
    (sleep_forever sc110_beacon_listen)
    (sleep_forever sc120_beacon_listen)
    (sleep_forever sc130_beacon_listen)
    (sleep_forever sc140_beacon_listen)
    (sleep_forever sc150_beacon_listen)
)

(script static void test_pda_training
    (test_kill_squad_patrol)
    (test_kill_beacon_listen)
    (sleep_forever player0_h100_waypoints)
    (ai_erase_all)
    (pda_activate_beacon player "fl_beacon_sc100" "beacon_waypoints" false)
    (pda_activate_beacon player "fl_beacon_sc110" "beacon_waypoints" false)
    (pda_activate_beacon player "fl_beacon_sc120" "beacon_waypoints" false)
    (pda_activate_beacon player "fl_beacon_sc130" "beacon_waypoints" false)
    (pda_activate_beacon player "fl_beacon_sc140" "beacon_waypoints" false)
    (pda_activate_beacon player "fl_beacon_sc150" "beacon_waypoints" false)
    (player_set_objectives_enabled (player0) false)
    (player_set_fourth_wall_enabled (player0) false)
    (sleep 15)
    (f_l100_pda_training player_00 "tv_bsp_050" "tv_null" "gp_player0_pda_complete")
)

(script static void l100_reset_training_vars
    (gp_boolean_set "gp_tr_look_complete" false)
    (gp_boolean_set "gp_tr_health_complete" false)
    (gp_boolean_set "gp_tr_vision_complete" false)
    (gp_boolean_set "gp_tr_pda_complete" false)
    (gp_boolean_set "gp_tr_beacon_complete" false)
)

(script static void test_training_complete
    (gp_boolean_set "gp_tr_look_complete" true)
    (gp_boolean_set "gp_tr_health_complete" true)
    (gp_boolean_set "gp_tr_vision_complete" true)
    (gp_boolean_set "gp_tr_pda_complete" true)
    (gp_boolean_set "gp_tr_beacon_complete" true)
)

(script dormant void l150_mission
    (if debug 
        (print "l150 activated..."))
    (cinematic_snap_to_black)
    (initialize_h100)
    (wake pda_breadcrumbs)
    (wake l150_prepare_l200)
    (wake l150_underground_objective)
    (cond
        ((= (gp_integer_get "gp_current_scene") 100)
            (wake enc_l150_sc100)
        )
        ((= (gp_integer_get "gp_current_scene") 110)
            (wake enc_l150_sc110)
        )
        ((= (gp_integer_get "gp_current_scene") 120)
            (wake enc_l150_sc120)
        )
        ((= (gp_integer_get "gp_current_scene") 130)
            (wake enc_l150_sc130)
        )
        ((= (gp_integer_get "gp_current_scene") 140)
            (wake enc_l150_sc140)
        )
        ((= (gp_integer_get "gp_current_scene") 150)
            (wake enc_l150_sc150)
        )
    )
    (sleep 15)
    (cinematic_snap_from_black)
    (sleep_until (>= (device_group_get "dg_l150_end") 1.0) 1)
    (cinematic_snap_to_black)
    (f_h100_good_samaritan player_00 "gp_p0_h100_engineer_kills")
    (if (>= (game_coop_player_count) 2) 
        (f_h100_good_samaritan player_01 "gp_p1_h100_engineer_kills"))
    (if (>= (game_coop_player_count) 3) 
        (f_h100_good_samaritan player_02 "gp_p2_h100_engineer_kills"))
    (if (>= (game_coop_player_count) 4) 
        (f_h100_good_samaritan player_03 "gp_p3_h100_engineer_kills"))
    (switch_zone_set "set_shaft")
    (if (= g_play_cinematics true) 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (if debug 
                        (print "** you just finished l150 **"))
                    (cinematic_show_letterbox_immediate true)
                    (l200_intro_hb)
                    (cinematic_show_letterbox_immediate false)
                )
            )
            (if (is_ace_playlist_session) 
                (begin
                    (cinematic_skip_stop_terminal)
                ) (begin
                    (cinematic_skip_stop)
                )
            )
        )
    )
    (sound_class_set_gain "" 0.0 0)
    (sound_class_set_gain "mus" 1.0 0)
    (sound_class_set_gain "ui" 1.0 0)
    (if debug 
        (print "switch to l200..."))
    (game_level_advance "l200")
)

(script dormant void l150_prepare_l200
    (sleep_until 
        (or
            (volume_test_players "tv_prepare_l200_000")
            (volume_test_players "tv_prepare_l200_010")
            (volume_test_players "tv_prepare_l200_020")
            (volume_test_players "tv_prepare_l200_030")
            (volume_test_players "tv_prepare_l200_040")
            (volume_test_players "tv_prepare_l200_050")
        )
    )
    (prepare_game_level "l200")
)

(script dormant void enc_l150_sc100
    (if debug 
        (print "** encounter l150.sc110 **"))
    (f_l150_setup "fl_l150_sc100" "l150_sc100" "dc_l150_sc110" "dg_l150_power" 100)
    (device_group_set_immediate "dg_power_door_open_07" 0.0)
    (device_group_set_immediate "dg_l100_door_02" 0.0)
    (device_group_set_immediate "dg_l100_sec_door01" 0.0)
    (device_group_set_immediate "dg_l100_door_03" 1.0)
    (object_create_folder_anew "sc_l100_blocker")
    (object_create_folder_anew "cr_l100_blocker")
    (object_create_anew "dm_l150_sc100_01")
    (object_create_anew "dm_l150_sc100_02")
    (object_create_anew "v_l150_cam_sc100")
    (soft_ceiling_enable "survival" false)
    (sleep 1)
    (vehicle_auto_turret "v_l150_cam_sc100" "tv_l150_cam_sc100" 0.0 0.0 0.0)
    (pda_activate_marker_named player "dm_security_door_locked_15" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_18" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_07" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_10" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_19" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_20" "locked_270" true "locked_door")
)

(script dormant void enc_l150_sc110
    (if debug 
        (print "** encounter l150.sc110 **"))
    (f_l150_setup "fl_l150_sc110" "l150_sc110" "dc_l150_sc110" "dg_l150_power" 110)
    (device_set_power "dm_security_door_open_23" 0.0)
    (device_set_power "dm_security_door_open_24" 0.0)
    (object_destroy "sc_open_door_sign_02")
    (object_destroy "sc_open_door_sign_03")
    (object_create_anew "dm_l150_sc110_01")
    (object_create_anew "dm_l150_sc110_02")
    (object_create_anew "dm_l150_sc110_03")
    (object_create_anew "v_l150_cam_sc110")
    (sleep 1)
    (vehicle_auto_turret "v_l150_cam_sc110" "tv_l150_cam_sc110" 0.0 0.0 0.0)
    (pda_activate_marker_named player "dm_security_door_open_23" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_24" "locked_0" true "locked_door")
)

(script dormant void enc_l150_sc120
    (if debug 
        (print "** encounter l150.sc120 **"))
    (f_l150_setup "fl_l150_sc120" "l150_sc120" "dc_l150_sc120" "dg_l150_power" 120)
    (device_set_power "dm_040_door_01" 0.0)
    (device_set_power "dm_security_door_locked_09" 0.0)
    (device_set_power "dm_security_door_open_12" 0.0)
    (device_set_power "dm_security_door_open_13" 0.0)
    (device_set_power "dm_security_door_open_14" 0.0)
    (device_set_power "dm_security_door_open_15" 0.0)
    (device_set_power "dm_security_door_open_16" 0.0)
    (object_destroy "sc_open_door_sign_06")
    (object_destroy "sc_open_door_sign_07")
    (object_destroy "sc_open_door_sign_11")
    (object_destroy "sc_open_door_sign_12")
    (object_destroy "sc_open_door_sign_13")
    (object_create "sc_040_security_gate")
    (object_create_anew "dm_l150_sc120_01")
    (object_create_anew "dm_l150_sc120_02")
    (object_create_anew "dm_l150_sc120_03")
    (object_create_anew "v_l150_cam_sc120")
    (sleep 1)
    (vehicle_auto_turret "v_l150_cam_sc120" "tv_l150_cam_sc120" 0.0 0.0 0.0)
    (pda_activate_marker_named player "dm_security_door_open_12" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_13" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_16" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_14" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_15" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_09" "locked_270" true "locked_door")
)

(script dormant void enc_l150_sc130
    (if debug 
        (print "** encounter l150.sc130 **"))
    (f_l150_setup "fl_l150_sc130" "l150_sc130" "dc_l150_sc120" "dg_l150_power" 130)
    (device_set_power "dm_security_door_open_04" 0.0)
    (device_set_power "dm_security_door_open_16" 0.0)
    (object_destroy "sc_open_door_sign_14")
    (object_destroy "sc_open_door_sign_15")
    (object_create_anew "dm_l150_sc130_01")
    (object_create_anew "dm_l150_sc130_02")
    (object_create_anew "v_l150_cam_sc130")
    (sleep 1)
    (vehicle_auto_turret "v_l150_cam_sc130" "tv_l150_cam_sc130" 0.0 0.0 0.0)
    (pda_activate_marker_named player "dm_security_door_open_16" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_17" "locked_45" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_04" "locked_90" true "locked_door")
)

(script dormant void enc_l150_sc140
    (if debug 
        (print "** encounter l150.sc140 **"))
    (f_l150_setup "fl_l150_sc140" "l150_sc140" "dc_l150_sc140" "dg_l150_power" 140)
    (device_set_power "dm_security_door_locked_03" 0.0)
    (device_set_power "dm_security_door_locked_06" 0.0)
    (device_set_power "dm_security_door_open_01" 0.0)
    (device_set_power "dm_security_door_open_03" 0.0)
    (device_set_power "dm_security_door_open_09" 0.0)
    (device_set_power "dm_security_door_open_10" 0.0)
    (device_set_power "dm_security_door_open_12" 0.0)
    (device_set_power "dm_security_door_open_13" 0.0)
    (object_destroy "sc_open_door_sign_16")
    (object_destroy "sc_open_door_sign_17")
    (object_destroy "sc_open_door_sign_18")
    (object_destroy "sc_open_door_sign_19")
    (sleep 1)
    (object_create_anew "dm_l150_sc140_01")
    (object_create_anew "dm_l150_sc140_02")
    (object_create_anew "dm_l150_sc140_03")
    (object_create_anew "v_l150_cam_sc140")
    (sleep 1)
    (vehicle_auto_turret "v_l150_cam_sc140" "tv_l150_cam_sc140" 0.0 0.0 0.0)
    (pda_activate_marker_named player "dm_security_door_open_01" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_03" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_12" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_13" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_03" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_09" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_10" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_06" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_07" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_08" "locked_90" true "locked_door")
)

(script dormant void enc_l150_sc150
    (if debug 
        (print "** encounter l150.sc150 **"))
    (f_l150_setup "fl_l150_sc150" "l150_sc150" "dc_l150_sc150" "dg_l150_power" 150)
    (device_set_power "dm_security_door_locked_02" 0.0)
    (device_set_power "dm_security_door_locked_03" 0.0)
    (device_set_power "dm_security_door_open_01" 0.0)
    (device_set_power "dm_security_door_open_03" 0.0)
    (object_destroy "sc_open_door_sign_20")
    (object_destroy "sc_open_door_sign_21")
    (object_create_anew "dm_l150_sc150_01")
    (object_create_anew "dm_l150_sc150_02")
    (object_create_anew "dm_l150_sc150_03")
    (object_create_anew "v_l150_cam_sc150")
    (sleep 1)
    (vehicle_auto_turret "v_l150_cam_sc150" "tv_l150_cam_sc150" 0.0 0.0 0.0)
    (pda_activate_marker_named player "dm_security_door_open_01" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_03" "locked_0" true "locked_door")
)

(script static void f_l150_setup (cutscene_flag beacon_flag, string_id pda_definition, device end_control, device_group end_device_group, short waypoint_index)
    (pda_activate_beacon player beacon_flag "beacon_waypoints" true)
    (h100_disable_zone_swap)
    (pda_set_active_pda_definition pda_definition)
    (device_group_set end_control end_device_group 1.0)
    (set s_waypoint_index waypoint_index)
    (object_create_folder_anew "sc_never_placed")
    (wake player0_l50_waypoints)
    (if (coop_players_2) 
        (wake player1_l50_waypoints))
    (if (coop_players_3) 
        (wake player2_l50_waypoints))
    (if (coop_players_4) 
        (wake player3_l50_waypoints))
)

(script dormant void l150_underground_objective
    (sleep 150)
    (f_new_intel "intel_new_data" "obj_7" 7 "null_flag")
)

(script static void f_l150_load_phantom (vehicle phantom, string_id objective)
    (if (h100_all_scenes_completed) 
        (begin
            (ai_place "sq_sr_chieftain")
            (ai_place "sq_sr_brutepack")
            (ai_place "sq_sr_jetpack_02")
        )
    )
    (ai_place "sq_sr_jetpack_01")
    (ai_place "sq_sr_jackal_sniper_01")
    (ai_place "sq_sr_jackal_sniper_02")
    (sleep 1)
    (ai_set_objective "gr_l150" objective)
    (sleep 1)
    (ai_vehicle_enter_immediate "sq_sr_jackal_sniper_01" phantom phantom_p_lf)
    (ai_vehicle_enter_immediate "sq_sr_jetpack_01" phantom phantom_p_lb)
    (ai_vehicle_enter_immediate "sq_sr_jackal_sniper_02" phantom phantom_p_rf)
    (ai_vehicle_enter_immediate "sq_sr_jetpack_02" phantom phantom_p_rb)
    (ai_vehicle_enter_immediate "sq_sr_chieftain" phantom phantom_p_mr_f)
    (ai_vehicle_enter_immediate "sq_sr_brutepack" phantom phantom_p_ml_b)
    (sleep 1)
)

(script command_script void cs_l150_ph_sc100
    (set v_sr_phantom_l150 (ai_vehicle_get_from_starting_location "sq_sr_phantom_01/sc100"))
    (cs_enable_pathfinding_failsafe true)
    (ai_place "sq_sr_grunt_gunners")
    (sleep 1)
    (ai_vehicle_enter_immediate "sq_sr_grunt_gunners" v_sr_phantom_l150 turret_g)
    (sleep 1)
    (f_l150_load_phantom v_sr_phantom_l150 "obj_bsp_050_right")
    (cs_fly_by "ps_l150_ph_sc100/p0")
    (cs_fly_by "ps_l150_ph_sc100/p1")
    (cs_fly_by "ps_l150_ph_sc100/p2")
    (cs_fly_by "ps_l150_ph_sc100/p3")
    (cs_fly_by "ps_l150_ph_sc100/p4")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_l150_ph_sc100/p5" "ps_l150_ph_sc100/look")
    (cs_vehicle_speed 0.5)
    (cs_fly_by "ps_l150_ph_sc100/drop" 1.0)
    (sleep 30)
    (begin_random
        (f_unload_ph_left v_sr_phantom_l150)
        (f_unload_ph_right v_sr_phantom_l150)
    )
    (begin_random
        (f_unload_ph_mid_left v_sr_phantom_l150)
        (f_unload_ph_mid_right v_sr_phantom_l150)
    )
    (sleep 120)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_l150_ph_sc100/p6" "ps_l150_ph_sc100/p7")
    (cs_fly_by "ps_l150_ph_sc100/p7")
    (cs_fly_by "ps_l150_ph_sc100/p8")
    (cs_fly_by "ps_l150_ph_sc100/p9")
    (cs_fly_by "ps_l150_ph_sc100/p10")
    (cs_fly_by "ps_l150_ph_sc100/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_l150_ph_sc110
    (set v_sr_phantom_l150 (ai_vehicle_get_from_starting_location "sq_sr_phantom_01/sc110"))
    (cs_enable_pathfinding_failsafe true)
    (ai_place "sq_sr_grunt_gunners")
    (sleep 1)
    (ai_vehicle_enter_immediate "sq_sr_grunt_gunners" v_sr_phantom_l150 turret_g)
    (f_l150_load_phantom v_sr_phantom_l150 "obj_bsp_090_right")
    (cs_fly_by "ps_l150_ph_sc110/p0")
    (cs_fly_to_and_face "ps_l150_ph_sc110/p1" "ps_l150_ph_sc110/look")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_l150_ph_sc110/p2" "ps_l150_ph_sc110/look" 1.0)
    (sleep 30)
    (begin_random
        (f_unload_ph_left v_sr_phantom_l150)
        (f_unload_ph_right v_sr_phantom_l150)
    )
    (begin_random
        (f_unload_ph_mid_left v_sr_phantom_l150)
        (f_unload_ph_mid_right v_sr_phantom_l150)
    )
    (sleep 120)
    (cs_fly_to_and_face "ps_l150_ph_sc110/p1" "ps_l150_ph_sc110/p3")
    (cs_fly_by "ps_l150_ph_sc110/p3")
    (cs_fly_by "ps_l150_ph_sc110/p4")
    (cs_fly_by "ps_l150_ph_sc110/p5")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_l150_ph_sc110/p6")
    (cs_fly_by "ps_l150_ph_sc110/p7")
    (cs_fly_by "ps_l150_ph_sc110/p8")
    (cs_fly_by "ps_l150_ph_sc110/p9")
    (cs_fly_by "ps_l150_ph_sc110/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_l150_ph_sc120
    (set v_sr_phantom_l150 (ai_vehicle_get_from_starting_location "sq_sr_phantom_01/sc120"))
    (cs_enable_pathfinding_failsafe true)
    (ai_place "sq_sr_grunt_gunners")
    (sleep 1)
    (ai_vehicle_enter_immediate "sq_sr_grunt_gunners" v_sr_phantom_l150 turret_g)
    (f_l150_load_phantom v_sr_phantom_l150 "obj_bsp_040_right")
    (cs_fly_by "ps_l150_ph_sc120/p0")
    (cs_vehicle_speed 0.75)
    (cs_fly_to "ps_l150_ph_sc120/p1")
    (cs_fly_by "ps_l150_ph_sc120/p2")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_l150_ph_sc120/p3" "ps_l150_ph_sc120/p4")
    (cs_fly_to_and_face "ps_l150_ph_sc120/drop" "ps_l150_ph_sc120/p4" 1.0)
    (begin_random
        (f_unload_ph_left v_sr_phantom_l150)
        (f_unload_ph_right v_sr_phantom_l150)
    )
    (begin_random
        (f_unload_ph_mid_left v_sr_phantom_l150)
        (f_unload_ph_mid_right v_sr_phantom_l150)
    )
    (sleep 90)
    (cs_fly_to "ps_l150_ph_sc120/p3" 1.0)
    (cs_fly_by "ps_l150_ph_sc120/p4")
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_l150_ph_sc120/p5" "ps_l150_ph_sc120/p6")
    (cs_fly_by "ps_l150_ph_sc120/p6")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_l150_ph_sc120/p7")
    (cs_fly_by "ps_l150_ph_sc120/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_l150_ph_sc130
    (set v_sr_phantom_l150 (ai_vehicle_get_from_starting_location "sq_sr_phantom_01/sc130"))
    (cs_enable_pathfinding_failsafe true)
    (ai_place "sq_sr_grunt_gunners")
    (sleep 1)
    (ai_vehicle_enter_immediate "sq_sr_grunt_gunners" v_sr_phantom_l150 turret_g)
    (f_l150_load_phantom v_sr_phantom_l150 "obj_bsp_100")
    (cs_fly_by "ps_l150_ph_sc130/p0")
    (sleep_until (> (device_get_position "dm_security_door_open_18") 0.0))
    (sleep 30)
    (begin_random
        (f_unload_ph_left v_sr_phantom_l150)
        (f_unload_ph_right v_sr_phantom_l150)
    )
    (begin_random
        (f_unload_ph_mid_left v_sr_phantom_l150)
        (f_unload_ph_mid_right v_sr_phantom_l150)
    )
    (sleep 120)
    (cs_fly_to_and_face "ps_l150_ph_sc130/p1" "ps_l150_ph_sc130/p2")
    (cs_fly_by "ps_l150_ph_sc130/p2")
    (cs_fly_by "ps_l150_ph_sc130/p3")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_l150_ph_sc130/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_l150_ph_sc140
    (set v_sr_phantom_l150 (ai_vehicle_get_from_starting_location "sq_sr_phantom_01/sc140"))
    (cs_enable_pathfinding_failsafe true)
    (ai_place "sq_sr_grunt_gunners")
    (sleep 1)
    (ai_vehicle_enter_immediate "sq_sr_grunt_gunners" v_sr_phantom_l150 turret_g)
    (f_l150_load_phantom v_sr_phantom_l150 "obj_bsp_030_bottom")
    (cs_fly_by "ps_l150_ph_sc140/p0")
    (if (h100_all_scenes_completed) 
        (begin
            (cs_fly_by "ps_l150_ph_sc140/p1")
            (cs_vehicle_speed 0.75)
            (cs_fly_to "ps_l150_ph_sc140/p2" 1.0)
            (cs_vehicle_speed 0.5)
            (cs_fly_to "ps_l150_ph_sc140/p3" 1.5)
            (sleep 30)
            (begin_random
                (f_unload_ph_left v_sr_phantom_l150)
                (f_unload_ph_right v_sr_phantom_l150)
            )
            (begin_random
                (f_unload_ph_mid_left v_sr_phantom_l150)
                (f_unload_ph_mid_right v_sr_phantom_l150)
            )
            (sleep 120)
            (cs_fly_to "ps_l150_ph_sc140/p2" 1.0)
            (cs_vehicle_speed 1.0)
            (cs_fly_to "ps_l150_ph_sc140/p4")
            (cs_fly_by "ps_l150_ph_sc140/p5")
            (cs_fly_by "ps_l150_ph_sc140/p6")
        ) (begin
            (cs_fly_by "ps_l150_ph_sc140/p7")
            (cs_vehicle_speed 0.75)
            (cs_fly_to "ps_l150_ph_sc140/p8" 1.0)
            (cs_vehicle_speed 0.5)
            (cs_fly_to "ps_l150_ph_sc140/p9" 1.5)
            (sleep 30)
            (begin_random
                (f_unload_ph_left v_sr_phantom_l150)
                (f_unload_ph_right v_sr_phantom_l150)
            )
            (begin_random
                (f_unload_ph_mid_left v_sr_phantom_l150)
                (f_unload_ph_mid_right v_sr_phantom_l150)
            )
            (sleep 120)
            (ai_set_objective "gr_l150" "obj_bsp_030_left")
            (cs_fly_to "ps_l150_ph_sc140/p8" 1.0)
            (cs_vehicle_speed 1.0)
            (cs_fly_to "ps_l150_ph_sc140/p10")
            (cs_fly_by "ps_l150_ph_sc140/p11")
        )
    )
    (cs_vehicle_boost true)
    (cs_fly_by "ps_l150_ph_sc140/erase")
    (ai_erase ai_current_squad)
)

(script command_script void cs_l150_ph_sc150
    (set v_sr_phantom_l150 (ai_vehicle_get_from_starting_location "sq_sr_phantom_01/sc150"))
    (cs_enable_pathfinding_failsafe true)
    (ai_place "sq_sr_grunt_gunners")
    (sleep 1)
    (f_l150_load_phantom v_sr_phantom_l150 "obj_bsp_000_right")
    (ai_vehicle_enter_immediate "sq_sr_grunt_gunners" v_sr_phantom_l150 turret_g)
    (cs_fly_by "ps_l150_ph_sc150/p0")
    (cs_fly_by "ps_l150_ph_sc150/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_to "ps_l150_ph_sc150/p2" 1.0)
    (cs_vehicle_speed 0.5)
    (cs_fly_to "ps_l150_ph_sc150/p3" 1.0)
    (sleep 30)
    (begin_random
        (f_unload_ph_left v_sr_phantom_l150)
        (f_unload_ph_right v_sr_phantom_l150)
    )
    (begin_random
        (f_unload_ph_mid_left v_sr_phantom_l150)
        (f_unload_ph_mid_right v_sr_phantom_l150)
    )
    (sleep 120)
    (cs_fly_to "ps_l150_ph_sc150/p2" 1.0)
    (cs_vehicle_speed 1.0)
    (cs_fly_to "ps_l150_ph_sc150/p4")
    (cs_fly_by "ps_l150_ph_sc150/p5")
    (cs_fly_by "ps_l150_ph_sc150/p6")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_l150_ph_sc150/erase")
    (ai_erase ai_current_squad)
)

(script dormant void player0_l50_waypoints
    (f_l150_waypoints player_00)
)

(script dormant void player1_l50_waypoints
    (f_l150_waypoints player_01)
)

(script dormant void player2_l50_waypoints
    (f_l150_waypoints player_02)
)

(script dormant void player3_l50_waypoints
    (f_l150_waypoints player_03)
)

(script static void f_l150_waypoints (short player_short)
    (sleep_until 
        (begin
            (f_sleep_until_activate_waypoint player_short)
            (cond
                ((= s_waypoint_index 100)
                    (f_waypoint_activate_1 player_short "fl_l150_sc100")
                )
                ((= s_waypoint_index 110)
                    (f_waypoint_activate_1 player_short "fl_l150_sc110")
                )
                ((= s_waypoint_index 120)
                    (f_waypoint_activate_1 player_short "fl_l150_sc120")
                )
                ((= s_waypoint_index 130)
                    (f_waypoint_activate_1 player_short "fl_l150_sc130")
                )
                ((= s_waypoint_index 140)
                    (f_waypoint_activate_1 player_short "fl_l150_sc140")
                )
                ((= s_waypoint_index 150)
                    (f_waypoint_activate_1 player_short "fl_l150_sc150")
                )
            )
            false
        ) 
    1)
)

(script static void initialize_l100
    (if debug 
        (print "l100 activated..."))
    (if debug 
        (print "switching zone set..."))
    (switch_zone_set "set_l100")
    (sleep 1)
    (sound_class_set_gain "" 0.0 0)
    (if debug 
        (print "placing beacons and switches..."))
    (object_create_containing "object_sc100")
    (gp_integer_set "gp_current_scene" 1)
    (object_create_anew "terminal_l100_phone_01")
    (object_create_anew "terminal_l100_phone_04")
    (object_create_folder_anew "sc_l100_blocker")
    (object_create_folder_anew "cr_l100_blocker")
    (sleep 1)
    (object_create_folder_anew "sc_l100_exterior")
    (object_create_folder_anew "cr_l100_exterior")
    (object_create_folder_anew "sc_l100_interior")
    (object_create_folder_anew "cr_l100_interior")
    (object_create_folder_anew "sc_bsp_050")
    (object_create_folder_anew "cr_bsp_050")
    (object_create_folder_anew "fx_bsp_050")
    (object_create_folder_anew "bp_l100")
    (object_create_folder_anew "bp_l100_interior")
    (object_create_folder_anew "wp_l100_interior")
    (pda_set_active_pda_definition "l100")
    (player_set_fourth_wall_enabled (player0) false)
    (player_set_fourth_wall_enabled (player1) false)
    (player_set_fourth_wall_enabled (player2) false)
    (player_set_fourth_wall_enabled (player3) false)
    (player_set_objectives_enabled (player0) false)
    (player_set_objectives_enabled (player1) false)
    (player_set_objectives_enabled (player2) false)
    (player_set_objectives_enabled (player3) false)
    (player_control_fade_out_all_input 0.0)
    (wake sc100_beacon_listen)
    (wake pda_breadcrumbs)
    (campaign_metagame_time_pause true)
    (l100_locked_door_markers)
    (vehicle_auto_turret "v_l100_sec_cam_01" "tv_l100_sec_cam_01" 0.0 0.0 0.0)
    (vehicle_auto_turret "v_l100_sec_cam_02" "tv_l100_sec_cam_02" 0.0 0.0 0.0)
    (wake h100_prepare_level)
    (chud_show_crosshair false)
    (chud_show_compass false)
    (chud_show_messages false)
    (zone_set_trigger_volume_enable "zone_set:set_050_080:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_050_080:*" false)
    (device_group_set_immediate "dg_power_door_open_07" 0.0)
    (device_group_set_immediate "dg_power_door_locked_18" 0.0)
    (object_set_vision_mode_render_default "dm_security_door_open_07" true)
    (object_set_vision_mode_render_default "dm_security_door_locked_18" true)
    (soft_ceiling_enable "camera" false)
    (wake h100_transition_to_scene)
    (wake h100_turn_off_lightning)
    (wake music_h100_01)
    (wake music_h100_015)
    (wake music_h100_02)
    (wake music_h100_03)
    (wake music_h100_04)
    (wake music_h100_05)
    (wake music_h100_06)
    (wake music_h100_07)
    (wake h100_beacon_music)
)

(script static void initialize_h100
    (h100_cinematic_zone_set)
    (sleep 1)
    (replenish_players)
    (wake h100_loaded_bsps)
    (sleep 30)
    (h100_reentry_cinematic)
    (sleep 1)
    (h100_gameplay_zone_set)
    (sleep 1)
    (h100_beacon_activation)
    (sleep 1)
    (h100_scenes_completed)
    (sleep 1)
    (h100_returning_from_scene)
    (sleep 1)
    (h100_state_setup)
    (wake h100_game_save)
    (if (not (h100_all_scenes_completed)) 
        (begin
            (initialize_arg)
            (wake h100_prepare_level)
            (wake h100_transition_to_scene)
            (wake player0_h100_waypoints)
            (if (>= (game_coop_player_count) 2) 
                (wake player1_h100_waypoints))
            (if (>= (game_coop_player_count) 3) 
                (wake player2_h100_waypoints))
            (if (>= (game_coop_player_count) 4) 
                (wake player3_h100_waypoints))
            (wake player0_h100_engineer_kills)
            (if (>= (game_coop_player_count) 2) 
                (wake player1_h100_engineer_kills))
            (if (>= (game_coop_player_count) 3) 
                (wake player2_h100_engineer_kills))
            (if (>= (game_coop_player_count) 4) 
                (wake player3_h100_engineer_kills))
            (wake player0_award_tourist)
            (if (coop_players_2) 
                (wake player1_award_tourist))
            (if (coop_players_3) 
                (wake player2_award_tourist))
            (if (coop_players_4) 
                (wake player3_award_tourist))
            (wake h100_arg_fixup)
        )
    )
    (wake pda_breadcrumbs)
    (wake h100_clear_command_buffer)
    (soft_ceiling_enable "camera" false)
    (if (not (campaign_survival_enabled)) 
        (soft_ceiling_enable "survival" false))
    (wake h100_beacon_music)
    (wake h100_ambient_music)
    (h100_return_vehicles)
    (wake vs_h100_engineer_bomb)
    (wake h100_turn_off_lightning)
)

(script static void h100_cinematic_zone_set
    (if debug 
        (print "switch zone sets..."))
    (cond
        ((= (gp_integer_get "gp_current_scene") 100)
            (switch_zone_set "set_050_cin")
        )
        ((= (gp_integer_get "gp_current_scene") 110)
            (switch_zone_set "set_090_cin")
        )
        ((= (gp_integer_get "gp_current_scene") 120)
            (switch_zone_set "set_040_cin")
        )
        ((= (gp_integer_get "gp_current_scene") 130)
            (switch_zone_set "set_oni_cin")
        )
        ((= (gp_integer_get "gp_current_scene") 140)
            (switch_zone_set "set_030_cin")
        )
        ((= (gp_integer_get "gp_current_scene") 150)
            (switch_zone_set "set_000_cin")
        )
    )
)

(script static void h100_reentry_cinematic
    (cond
        ((= (gp_integer_get "gp_current_scene") 100)
            (f_h100_transition_in sc100_out_hb sc100_out_hb_alt sc100_out_hb_cleanup "fl_sc100_teleport_00" "fl_sc100_teleport_01" "fl_sc100_teleport_02" "fl_sc100_teleport_03" -15.0)
        )
        ((= (gp_integer_get "gp_current_scene") 110)
            (f_h100_transition_in sc110_out_hb sc110_out_hb_alt sc110_out_hb_cleanup "fl_sc110_teleport_00" "fl_sc110_teleport_01" "fl_sc110_teleport_02" "fl_sc110_teleport_03" -15.0)
        )
        ((= (gp_integer_get "gp_current_scene") 120)
            (f_h100_transition_in sc120_out_hb sc120_out_hb_alt sc120_out_hb_cleanup "fl_sc120_teleport_00" "fl_sc120_teleport_01" "fl_sc120_teleport_02" "fl_sc120_teleport_03" 0.0)
        )
        ((= (gp_integer_get "gp_current_scene") 130)
            (f_h100_transition_in sc130_out_hb sc130_out_hb_alt sc130_out_hb_cleanup "fl_sc130_teleport_00" "fl_sc130_teleport_01" "fl_sc130_teleport_02" "fl_sc130_teleport_03" 2.0)
        )
        ((= (gp_integer_get "gp_current_scene") 140)
            (f_h100_transition_in sc140_out_hb sc140_out_hb_alt sc140_out_hb_cleanup "fl_sc140_teleport_00" "fl_sc140_teleport_01" "fl_sc140_teleport_02" "fl_sc140_teleport_03" 15.0)
        )
        ((= (gp_integer_get "gp_current_scene") 150)
            (f_h100_transition_in sc150_out_hb sc150_out_hb_alt sc150_out_hb_cleanup "fl_sc150_teleport_00" "fl_sc150_teleport_01" "fl_sc150_teleport_02" "fl_sc150_teleport_03" -15.0)
        )
    )
)

(script static void h100_gameplay_zone_set
    (if debug 
        (print "switch zone sets..."))
    (cond
        ((= (gp_integer_get "gp_current_scene") 100)
            (switch_zone_set "set_050")
        )
        ((= (gp_integer_get "gp_current_scene") 110)
            (switch_zone_set "set_090")
        )
        ((= (gp_integer_get "gp_current_scene") 120)
            (switch_zone_set "set_040")
        )
        ((= (gp_integer_get "gp_current_scene") 130)
            (switch_zone_set "set_oni")
        )
        ((= (gp_integer_get "gp_current_scene") 140)
            (switch_zone_set "set_030")
        )
        ((= (gp_integer_get "gp_current_scene") 150)
            (switch_zone_set "set_000")
        )
    )
)

(script static void h100_beacon_activation
    (if debug 
        (print "wake beacon listen scripts..."))
    (if 
        (and
            (= (gp_boolean_get "gp_sc100_complete") false)
            (or
                (gp_boolean_get "gp_h100_from_mainmenu")
                (not (gp_boolean_get "gp_c100_complete"))
            )
        ) 
            (begin
                (wake sc100_beacon_listen)
                (objectives_show 1)
                (device_group_set_immediate "dg_l100_door_03" 1.0)
            )
    )
    (if (= (gp_boolean_get "gp_sc110_complete") false) 
        (begin
            (wake sc110_beacon_listen)
            (objectives_show 2)
        )
    )
    (if 
        (or
            (gp_boolean_get "gp_h100_from_mainmenu")
            (h100_coming_from_110_150)
            (not (gp_boolean_get "gp_c100_complete"))
        ) 
            (begin
                (if 
                    (and
                        (= (gp_boolean_get "gp_sc120_complete") false)
                        (= (should_beacon_be_active "fl_beacon_sc120") true)
                    ) 
                        (begin
                            (wake sc120_beacon_listen)
                            (objectives_show 3)
                        )
                )
                (if 
                    (and
                        (= (gp_boolean_get "gp_sc130_complete") false)
                        (= (should_beacon_be_active "fl_beacon_sc130") true)
                    ) 
                        (begin
                            (wake sc130_beacon_listen)
                            (objectives_show 4)
                        )
                )
                (if 
                    (and
                        (= (gp_boolean_get "gp_sc140_complete") false)
                        (= (should_beacon_be_active "fl_beacon_sc140") true)
                    ) 
                        (begin
                            (wake sc140_beacon_listen)
                            (objectives_show 5)
                        )
                )
                (if 
                    (and
                        (= (gp_boolean_get "gp_sc150_complete") false)
                        (= (should_beacon_be_active "fl_beacon_sc150") true)
                    ) 
                        (begin
                            (wake sc150_beacon_listen)
                            (objectives_show 6)
                        )
                )
            )
    )
)

(script static void h100_scenes_completed
    (if (gp_boolean_get "gp_sc100_complete") 
        (begin
            (object_create "sc_beacon_sc100")
            (objectives_finish 1)
        )
    )
    (if (gp_boolean_get "gp_sc110_complete") 
        (begin
            (object_create "sc_beacon_sc110")
            (objectives_finish 2)
        )
    )
    (if (gp_boolean_get "gp_sc120_complete") 
        (begin
            (object_create "sc_beacon_sc120")
            (objectives_finish 3)
        )
    )
    (if (gp_boolean_get "gp_sc130_complete") 
        (begin
            (objectives_finish 4)
        )
    )
    (if (gp_boolean_get "gp_sc140_complete") 
        (begin
            (object_create "sc_beacon_sc140")
            (objectives_finish 5)
        )
    )
    (if (gp_boolean_get "gp_sc150_complete") 
        (begin
            (object_create "sc_beacon_sc150")
            (objectives_finish 6)
        )
    )
)

(script static void h100_returning_from_scene
    (if debug 
        (print "additional setup..."))
    (cond
        ((= (gp_integer_get "gp_current_scene") 100)
            (begin
                (data_mine_set_mission_segment "h100_post_sc100")
                (wake h100_enc_sc100)
                (object_create "dm_sc100_out_hb_sign_01")
                (object_create "dm_sc100_out_hb_sign_02")
                (object_create "dm_sc100_out_hb_sign_03")
                (sleep 1)
                (if (not (h100_all_scenes_completed)) 
                    (begin
                        (device_set_power "dm_sc100_out_hb_sign_01" 1.0)
                        (device_set_power "dm_sc100_out_hb_sign_02" 1.0)
                        (device_set_power "dm_sc100_out_hb_sign_03" 1.0)
                    )
                )
                (if (gp_boolean_get "gp_c100_complete") 
                    (begin
                        (wake h100_post_sc100)
                        (wake player0_sc110_beacon)
                        (if (coop_players_2) 
                            (wake player1_sc110_beacon))
                        (if (coop_players_3) 
                            (wake player2_sc110_beacon))
                        (if (coop_players_4) 
                            (wake player3_sc110_beacon))
                    )
                )
            )
        )
        ((= (gp_integer_get "gp_current_scene") 110)
            (begin
                (data_mine_set_mission_segment "h100_post_sc110")
                (wake h100_enc_sc110)
            )
        )
        ((= (gp_integer_get "gp_current_scene") 120)
            (begin
                (data_mine_set_mission_segment "h100_post_sc120")
                (wake h100_enc_sc120)
            )
        )
        ((= (gp_integer_get "gp_current_scene") 130)
            (begin
                (data_mine_set_mission_segment "h100_post_sc130")
                (wake h100_enc_sc130)
            )
        )
        ((= (gp_integer_get "gp_current_scene") 140)
            (begin
                (data_mine_set_mission_segment "h100_post_sc140")
                (wake h100_enc_sc140)
            )
        )
        ((= (gp_integer_get "gp_current_scene") 150)
            (begin
                (data_mine_set_mission_segment "h100_post_sc150")
                (wake h100_enc_sc150)
            )
        )
    )
)

(script static void h100_state_setup
    (cond
        ((h100_all_scenes_completed)
            (begin
                (sleep 1)
            )
        )
        ((gp_boolean_get "gp_h100_from_mainmenu")
            (begin
                (pda_set_active_pda_definition "h100_mainmenu")
                (h100_mainmenu_locked_doors)
                (device_group_set_immediate "dg_l100_sec_door01" 1.0)
                (device_group_set_immediate "dg_l100_door_01" 1.0)
                (device_group_set_immediate "dg_l100_door_02" 1.0)
                (device_group_set_immediate "dg_l100_door_03" 1.0)
                (wake h100_000_sp_spawner)
                (wake h100_030_sp_spawner)
                (wake h100_040_sp_spawner)
                (wake h100_050_sp_spawner)
                (wake h100_060_sp_spawner)
                (wake h100_080_sp_spawner)
                (wake h100_090_sp_spawner)
                (wake h100_100_sp_spawner)
                (wake h100_ambient_phantom)
            )
        )
        ((and
            (gp_boolean_get "gp_c100_complete")
            (not (h100_coming_from_110_150))
        )
            (begin
                (pda_set_active_pda_definition "h100_sc110")
                (h100_sc110_locked_doors)
                (device_group_set_immediate "dg_l100_door_03" 1.0)
                (device_group_set_immediate "dg_power_door_open_21" 0.0)
                (device_group_set_immediate "dg_power_door_locked_18" 0.0)
                (device_group_set_immediate "dg_power_door_open_22" 0.0)
                (object_set_vision_mode_render_default "dm_security_door_open_21" true)
                (object_set_vision_mode_render_default "dm_security_door_open_22" true)
                (object_set_vision_mode_render_default "dm_security_door_locked_18" true)
                (wake h100_080_sp_spawner)
                (wake h100_090_sp_spawner)
                (wake h100_ambient_phantom)
            )
        )
        (true
            (begin
                (pda_set_active_pda_definition "h100")
                (h100_locked_doors)
                (device_group_set_immediate "dg_l100_door_03" 1.0)
                (device_group_set_immediate "dg_power_door_locked_18" 0.0)
                (object_set_vision_mode_render_default "dm_security_door_locked_18" true)
                (wake h100_000_sp_spawner)
                (wake h100_030_sp_spawner)
                (wake h100_040_sp_spawner)
                (wake h100_060_sp_spawner)
                (wake h100_080_sp_spawner)
                (wake h100_090_sp_spawner)
                (wake h100_100_sp_spawner)
                (wake h100_ambient_phantom)
            )
        )
    )
)

(script static boolean h100_coming_from_110_150
    (or
        (gp_boolean_get "gp_sc110_complete")
        (gp_boolean_get "gp_sc120_complete")
        (gp_boolean_get "gp_sc130_complete")
        (gp_boolean_get "gp_sc140_complete")
        (gp_boolean_get "gp_sc150_complete")
    )
)

(script static boolean h100_any_scene_completed
    (or
        (gp_boolean_get "gp_sc100_complete")
        (gp_boolean_get "gp_sc110_complete")
        (gp_boolean_get "gp_sc120_complete")
        (gp_boolean_get "gp_sc130_complete")
        (gp_boolean_get "gp_sc140_complete")
        (gp_boolean_get "gp_sc150_complete")
    )
)

(script static boolean h100_all_scenes_completed
    (and
        (= (gp_boolean_get "gp_sc100_complete") true)
        (= (gp_boolean_get "gp_sc110_complete") true)
        (= (gp_boolean_get "gp_sc120_complete") true)
        (= (gp_boolean_get "gp_sc130_complete") true)
        (= (gp_boolean_get "gp_sc140_complete") true)
        (= (gp_boolean_get "gp_sc150_complete") true)
    )
)

(script static void h100_set_short_completed
    (if (gp_boolean_get "gp_sc100_complete") 
        (set s_sc100_complete 1))
    (if (gp_boolean_get "gp_sc110_complete") 
        (set s_sc110_complete 1))
    (if (gp_boolean_get "gp_sc120_complete") 
        (set s_sc120_complete 1))
    (if (gp_boolean_get "gp_sc130_complete") 
        (set s_sc130_complete 1))
    (if (gp_boolean_get "gp_sc140_complete") 
        (set s_sc140_complete 1))
    (if (gp_boolean_get "gp_sc150_complete") 
        (set s_sc150_complete 1))
)

(script static void h100_clear_scene_shorts
    (set s_sc100_complete 0)
    (set s_sc110_complete 0)
    (set s_sc120_complete 0)
    (set s_sc130_complete 0)
    (set s_sc140_complete 0)
    (set s_sc150_complete 0)
)

(script static short h100_scenes_completed_short
    (h100_clear_scene_shorts)
    (sleep 1)
    (h100_set_short_completed)
    (sleep 1)
    (+ s_sc100_complete s_sc110_complete s_sc120_complete s_sc130_complete s_sc140_complete s_sc150_complete)
)

(script static boolean should_beacon_be_active (cutscene_flag beacon_flag)
    (cond
        ((and
            (is_ace_playlist_session)
            (= beacon_flag "fl_beacon_sc120")
            (!= (gp_integer_get "gp_current_scene") 110)
        )
            (begin
                false
            )
        )
        ((and
            (is_ace_playlist_session)
            (= beacon_flag "fl_beacon_sc130")
            (!= (gp_integer_get "gp_current_scene") 120)
        )
            (begin
                false
            )
        )
        ((and
            (is_ace_playlist_session)
            (= beacon_flag "fl_beacon_sc140")
            (!= (gp_integer_get "gp_current_scene") 130)
        )
            (begin
                false
            )
        )
        ((and
            (is_ace_playlist_session)
            (= beacon_flag "fl_beacon_sc150")
            (!= (gp_integer_get "gp_current_scene") 140)
        )
            (begin
                false
            )
        )
        (true
            (begin
                true
            )
        )
    )
)

(script dormant void sc100_beacon_listen
    (if (not (gp_boolean_get "gp_c100_complete")) 
        (pda_activate_beacon player "fl_beacon_sc100" "beacon_waypoints" true))
    (sleep_until 
        (begin
            (sleep_until (sc100_boolean) 30)
            (object_create_anew "beacon_object_sc100")
            (sleep 1)
            (object_set_vision_mode_render_default "beacon_object_sc100" false)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (not (sc100_boolean))
                            (objects_can_see_flag (players) "fl_control_sc100" 15.0)
                        ) 
                    1)
                    (if (sc100_boolean) 
                        (begin
                            (object_create_anew "control_object_sc100")
                            (sleep_until 
                                (or
                                    (not (sc100_boolean))
                                    (not (objects_can_see_flag (players) "fl_control_sc100" 15.0))
                                    (= (device_group_get "dg_beacon_sc100") 1.0)
                                ) 
                            1)
                            (object_destroy "control_object_sc100")
                        )
                    )
                    (or
                        (not (sc100_boolean))
                        (= (device_group_get "dg_beacon_sc100") 1.0)
                    )
                ) 
            1)
            (= (device_group_get "dg_beacon_sc100") 1.0)
        ) 
    1)
)

(script dormant void sc110_beacon_listen
    (pda_activate_beacon player "fl_beacon_sc110" "beacon_waypoints" true)
    (sleep_until 
        (begin
            (sleep_until (sc110_boolean) 30)
            (object_create_anew "beacon_object_sc110")
            (sleep 1)
            (object_set_vision_mode_render_default "beacon_object_sc110" false)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (not (sc110_boolean))
                            (objects_can_see_flag (players) "fl_control_sc110" 17.0)
                        ) 
                    1)
                    (if (sc110_boolean) 
                        (begin
                            (object_create_anew "control_object_sc110")
                            (sleep_until 
                                (or
                                    (not (sc110_boolean))
                                    (not (objects_can_see_flag (players) "fl_control_sc110" 17.0))
                                    (= (device_group_get "dg_beacon_sc110") 1.0)
                                ) 
                            1)
                            (object_destroy "control_object_sc110")
                        )
                    )
                    (or
                        (not (sc110_boolean))
                        (= (device_group_get "dg_beacon_sc110") 1.0)
                    )
                ) 
            1)
            (= (device_group_get "dg_beacon_sc110") 1.0)
        ) 
    1)
)

(script dormant void sc120_beacon_listen
    (pda_activate_beacon player "fl_beacon_sc120" "beacon_waypoints" true)
    (sleep_until 
        (begin
            (sleep_until (sc120_boolean) 30)
            (object_create_anew "beacon_object_sc120")
            (sleep 1)
            (object_set_vision_mode_render_default "beacon_object_sc120" false)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (not (sc120_boolean))
                            (objects_can_see_flag (players) "fl_control_sc120" 15.0)
                        ) 
                    1)
                    (if (sc120_boolean) 
                        (begin
                            (object_create_anew "control_object_sc120")
                            (sleep_until 
                                (or
                                    (not (sc120_boolean))
                                    (not (objects_can_see_flag (players) "fl_control_sc120" 15.0))
                                    (= (device_group_get "dg_beacon_sc120") 1.0)
                                ) 
                            1)
                            (object_destroy "control_object_sc120")
                        )
                    )
                    (or
                        (not (sc120_boolean))
                        (= (device_group_get "dg_beacon_sc120") 1.0)
                    )
                ) 
            1)
            (= (device_group_get "dg_beacon_sc120") 1.0)
        ) 
    1)
)

(script dormant void sc130_beacon_listen
    (pda_activate_beacon player "fl_beacon_sc130" "beacon_waypoints" true)
    (sleep_until 
        (begin
            (sleep_until (sc130_boolean) 30)
            (object_create_anew "beacon_object_sc130")
            (sleep 1)
            (object_set_vision_mode_render_default "beacon_object_sc130" false)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (not (sc130_boolean))
                            (objects_can_see_flag (players) "fl_control_sc130" 15.0)
                        ) 
                    1)
                    (if (sc130_boolean) 
                        (begin
                            (object_create_anew "control_object_sc130")
                            (sleep_until 
                                (or
                                    (not (sc130_boolean))
                                    (not (objects_can_see_flag (players) "fl_control_sc130" 15.0))
                                    (= (device_group_get "dg_beacon_sc130") 1.0)
                                ) 
                            1)
                            (object_destroy "control_object_sc130")
                        )
                    )
                    (or
                        (not (sc130_boolean))
                        (= (device_group_get "dg_beacon_sc130") 1.0)
                    )
                ) 
            1)
            (= (device_group_get "dg_beacon_sc130") 1.0)
        ) 
    1)
)

(script dormant void sc140_beacon_listen
    (pda_activate_beacon player "fl_beacon_sc140" "beacon_waypoints" true)
    (sleep_until 
        (begin
            (sleep_until (sc140_boolean) 30)
            (object_create_anew "beacon_object_sc140")
            (sleep 1)
            (object_set_vision_mode_render_default "beacon_object_sc140" false)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (not (sc140_boolean))
                            (objects_can_see_flag (players) "fl_control_sc140" 7.0)
                        ) 
                    1)
                    (if (sc140_boolean) 
                        (begin
                            (object_create_anew "control_object_sc140")
                            (sleep_until 
                                (or
                                    (not (sc140_boolean))
                                    (not (objects_can_see_flag (players) "fl_control_sc140" 7.0))
                                    (= (device_group_get "dg_beacon_sc140") 1.0)
                                ) 
                            1)
                            (object_destroy "control_object_sc140")
                        )
                    )
                    (or
                        (not (sc140_boolean))
                        (= (device_group_get "dg_beacon_sc140") 1.0)
                    )
                ) 
            1)
            (= (device_group_get "dg_beacon_sc140") 1.0)
        ) 
    1)
)

(script dormant void sc150_beacon_listen
    (pda_activate_beacon player "fl_beacon_sc150" "beacon_waypoints" true)
    (sleep_until 
        (begin
            (sleep_until (sc150_boolean) 30)
            (object_create_anew "beacon_object_sc150")
            (sleep 1)
            (object_set_vision_mode_render_default "beacon_object_sc150" false)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (not (sc150_boolean))
                            (objects_can_see_flag (players) "fl_control_sc150" 15.0)
                        ) 
                    1)
                    (if (sc150_boolean) 
                        (begin
                            (object_create_anew "control_object_sc150")
                            (sleep_until 
                                (or
                                    (not (sc150_boolean))
                                    (not (objects_can_see_flag (players) "fl_control_sc150" 15.0))
                                    (= (device_group_get "dg_beacon_sc150") 1.0)
                                ) 
                            1)
                            (object_destroy "control_object_sc150")
                        )
                    )
                    (or
                        (not (sc150_boolean))
                        (= (device_group_get "dg_beacon_sc150") 1.0)
                    )
                ) 
            1)
            (= (device_group_get "dg_beacon_sc150") 1.0)
        ) 
    1)
)

(script static boolean sc100_boolean
    (volume_test_players "tv_bsp_050")
)

(script static boolean sc110_boolean
    (volume_test_players "tv_bsp_090")
)

(script static boolean sc120_boolean
    (volume_test_players "tv_bsp_040")
)

(script static boolean sc130_boolean
    (volume_test_players "tv_bsp_oni")
)

(script static boolean sc140_boolean
    (volume_test_players "tv_bsp_030")
)

(script static boolean sc150_boolean
    (volume_test_players "tv_bsp_000")
)

(script static boolean player_in_000
    (volume_test_players "tv_bsp_000")
)

(script static boolean player_in_030
    (volume_test_players "tv_bsp_030")
)

(script static boolean player_in_040
    (volume_test_players "tv_bsp_040")
)

(script static boolean player_in_050
    (volume_test_players "tv_bsp_050")
)

(script static boolean player_in_060
    (volume_test_players "tv_bsp_060")
)

(script static boolean player_in_080
    (volume_test_players "tv_bsp_080")
)

(script static boolean player_in_090
    (volume_test_players "tv_bsp_090")
)

(script static boolean player_in_100
    (volume_test_players "tv_bsp_100")
)

(script static boolean player_in_oni
    (volume_test_players "tv_bsp_oni")
)

(script static boolean player_dead
    (cond
        ((coop_players_4)
            (if 
                (or
                    (<= (object_get_health (player0)) 0.0)
                    (<= (object_get_health (player1)) 0.0)
                    (<= (object_get_health (player2)) 0.0)
                    (<= (object_get_health (player3)) 0.0)
                ) 
                    true)
        )
        ((coop_players_3)
            (if 
                (or
                    (<= (object_get_health (player0)) 0.0)
                    (<= (object_get_health (player1)) 0.0)
                    (<= (object_get_health (player2)) 0.0)
                ) 
                    true)
        )
        ((coop_players_2)
            (if 
                (or
                    (<= (object_get_health (player0)) 0.0)
                    (<= (object_get_health (player1)) 0.0)
                ) 
                    true)
        )
        (true
            (if (<= (object_get_health (player0)) 0.0) 
                true)
        )
    )
)

(script dormant void h100_transition_to_scene
    (sleep_until 
        (or
            (= (device_group_get "dg_beacon_sc100") 1.0)
            (= (device_group_get "dg_beacon_sc110") 1.0)
            (= (device_group_get "dg_beacon_sc120") 1.0)
            (= (device_group_get "dg_beacon_sc130") 1.0)
            (= (device_group_get "dg_beacon_sc140") 1.0)
            (= (device_group_get "dg_beacon_sc150") 1.0)
        ) 
    1)
    (cinematic_snap_to_black)
    (sound_looping_stop music_ambient)
    (sound_looping_stop music_battle)
    (sleep 1)
    (cond
        ((= (device_group_get "dg_beacon_sc100") 1.0)
            (begin
                (gp_notify_beacon_found "sc100")
                (f_h100_mark_vehicles "tv_sc100_vehicle")
                (f_h100_transition_out sc100_int_hb sc100_int_hb_cleanup "set_050_cin" "sc100" "control_object_sc100" "beacon_object_sc100")
            )
        )
        ((= (device_group_get "dg_beacon_sc110") 1.0)
            (begin
                (gp_notify_beacon_found "sc110")
                (f_h100_mark_vehicles "tv_sc110_vehicle")
                (f_h100_transition_out sc110_int_hb sc110_int_hb_cleanup "set_090_cin" "sc110" "control_object_sc110" "beacon_object_sc110")
            )
        )
        ((= (device_group_get "dg_beacon_sc120") 1.0)
            (begin
                (gp_notify_beacon_found "sc120")
                (f_h100_mark_vehicles "tv_sc120_vehicle")
                (f_h100_transition_out sc120_int_hb sc120_int_hb_cleanup "set_040_cin" "sc120" "control_object_sc120" "beacon_object_sc120")
            )
        )
        ((= (device_group_get "dg_beacon_sc130") 1.0)
            (begin
                (gp_notify_beacon_found "sc130")
                (f_h100_mark_vehicles "tv_sc130_vehicle")
                (f_h100_transition_out sc130_int_hb sc130_int_hb_cleanup "set_oni_cin" "sc130" "control_object_sc130" "beacon_object_sc130")
            )
        )
        ((= (device_group_get "dg_beacon_sc140") 1.0)
            (begin
                (gp_notify_beacon_found "sc140")
                (f_h100_mark_vehicles "tv_sc140_vehicle")
                (f_h100_transition_out sc140_int_hb sc140_int_hb_cleanup "set_030_cin" "sc140" "control_object_sc140" "beacon_object_sc140")
            )
        )
        ((= (device_group_get "dg_beacon_sc150") 1.0)
            (begin
                (gp_notify_beacon_found "sc150")
                (f_h100_mark_vehicles "tv_sc150_vehicle")
                (f_h100_transition_out sc150_int_hb sc150_int_hb_cleanup "set_000_cin" "sc150" "control_object_sc150" "beacon_object_sc150")
            )
        )
    )
)

(script static void f_h100_transition_in (script cinematic_intro, script cinematic_intro_alt, script cinematic_cleanup, cutscene_flag teleport_player0, cutscene_flag teleport_player1, cutscene_flag teleport_player2, cutscene_flag teleport_player3, real look_pitch)
    (object_teleport (player0) teleport_player0)
    (object_teleport (player1) teleport_player1)
    (object_teleport (player2) teleport_player2)
    (object_teleport (player3) teleport_player3)
    (sleep 10)
    (h100_set_intro_music)
    (sleep 60)
    (sound_class_set_gain "mus" 1.0 0)
    (sound_looping_start music_h100_intro none 1.0)
    (sleep 1)
    (if (= g_play_cinematics true) 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (if debug 
                        (print "play intro cinematic..."))
                    (cinematic_show_letterbox_immediate true)
                    (if (h100_all_scenes_completed) 
                        (evaluate cinematic_intro_alt) (evaluate cinematic_intro))
                    (cinematic_show_letterbox_immediate false)
                )
            )
            (cinematic_skip_stop_internal)
        )
    )
    (sleep 1)
    (evaluate cinematic_cleanup)
    (sound_class_set_gain "" 1.0 60)
    (player0_set_pitch look_pitch 0)
    (player1_set_pitch look_pitch 0)
    (player2_set_pitch look_pitch 0)
    (player3_set_pitch look_pitch 0)
)

(script static void f_h100_transition_out (script cinematic_outro, script cinematic_cleanup, zone_set cinematic_zone_set, string_id scene_name, object_name beacon_control, object_name beacon_object)
    (h100_disable_zone_swap)
    (h100_kill_squad_patrol)
    (object_destroy beacon_control)
    (object_destroy beacon_object)
    (object_destroy_type_mask 2)
    (garbage_collect_unsafe)
    (game_level_prepare scene_name)
    (sleep 1)
    (ai_erase_all)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (sleep 1)
    (gp_integer_set "gp_beacons_found" (+ (gp_integer_get "gp_beacons_found") 1.0))
    (sleep 1)
    (cond
        ((= (gp_integer_get "gp_beacons_found") 1)
            (achievement_grant_to_all_players "_achievement_junior_detective")
        )
        ((= (gp_integer_get "gp_beacons_found") 3)
            (achievement_grant_to_all_players "_achievement_gumshoe")
        )
        ((= (gp_integer_get "gp_beacons_found") 6)
            (achievement_grant_to_all_players "_achievement_super_sleuth")
        )
    )
    (sleep 1)
    (switch_zone_set cinematic_zone_set)
    (sound_suppress_ambience_update_on_revert)
    (sleep 1)
    (if (= g_play_cinematics true) 
        (begin
            (if (cinematic_skip_start) 
                (begin
                    (if debug 
                        (print "play outro cinematic..."))
                    (cinematic_show_letterbox_immediate true)
                    (evaluate cinematic_outro)
                    (sound_class_set_gain "" 0.0 0)
                    (sound_class_set_gain "mus" 1.0 0)
                    (cinematic_show_letterbox_immediate false)
                )
            )
            (cinematic_skip_stop_internal)
        )
    )
    (sound_class_set_gain "" 0.0 0)
    (sound_class_set_gain "mus" 1.0 0)
    (sound_class_set_gain "ui" 1.0 0)
    (gp_boolean_set "gp_l100_complete" true)
    (evaluate cinematic_cleanup)
    (if debug 
        (print "switch to scene..."))
    (game_level_advance scene_name)
)

(script static void l100_locked_door_markers
    (if debug 
        (print "activate temp locked door beacons..."))
    (pda_activate_marker_named player "dm_security_door_locked_15" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_18" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_07" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_10" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_19" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_20" "locked_270" true "locked_door")
)

(script static void h100_sc110_locked_doors
    (if debug 
        (print "activate temp locked door beacons..."))
    (pda_activate_marker_named player "dm_security_door_locked_14" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_18" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_11" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_12" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_13" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_21" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_22" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_20" "locked_270" true "locked_door")
)

(script static void h100_locked_doors
    (if debug 
        (print "activate temp locked door beacons..."))
    (pda_activate_marker_named player "dm_security_door_locked_03" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_14" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_18" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_17" "locked_45" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_09" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_10" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_06" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_07" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_08" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_11" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_12" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_13" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_04" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_09" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_20" "locked_270" true "locked_door")
)

(script static void h100_mainmenu_locked_doors
    (if debug 
        (print "activate temp locked door beacons..."))
    (pda_activate_marker_named player "dm_security_door_locked_03" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_14" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_15" "locked_0" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_17" "locked_45" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_09" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_open_10" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_06" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_07" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_08" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_11" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_12" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_13" "locked_90" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_04" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_09" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_10" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_19" "locked_270" true "locked_door")
    (pda_activate_marker_named player "dm_security_door_locked_20" "locked_270" true "locked_door")
)

(script dormant void h100_loaded_bsps
    (sleep_until 
        (begin
            (sleep_until (!= (current_zone_set_fully_active) s_h100_current_zone_set) 1)
            (set s_h100_current_zone_set (current_zone_set_fully_active))
            (sleep 1)
            (if (!= s_h100_current_zone_set -1) 
                (begin
                    (cond
                        ((= s_h100_current_zone_set 0)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_050_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 1)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_050_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 2)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_090_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 3)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_040_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 4)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_oni_active true)
                                (set b_h100_100_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 5)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_030_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 6)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_000_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 7)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_000_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 8)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_000_active true)
                                (set b_h100_030_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 9)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_030_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 10)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_030_active true)
                                (set b_h100_040_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 11)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_040_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 12)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_040_active true)
                                (set b_h100_060_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 13)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_040_active true)
                                (set b_h100_100_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 14)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_050_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 15)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_050_active true)
                                (set b_h100_080_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 16)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_060_active true)
                                (set b_h100_080_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 17)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_060_active true)
                                (set b_h100_100_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 18)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_080_active true)
                                (set b_h100_090_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 19)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_090_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 20)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_100_active true)
                                (set b_h100_oni_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 21)
                            (begin
                                (h100_clear_bsp_booleans)
                                (set b_h100_100_active true)
                                (set b_h100_oni_active true)
                            )
                        )
                        ((= s_h100_current_zone_set 22)
                            (begin
                                (h100_clear_bsp_booleans)
                            )
                        )
                    )
                    (sleep 1)
                    (h100_recycle_objects)
                    (sleep 1)
                    (h100_object_management)
                    (h100_security_cameras)
                ) (h100_close_security_doors))
            false
        ) 
    1)
)

(script static void h100_clear_bsp_booleans
    (set b_h100_000_active false)
    (set b_h100_010_active false)
    (set b_h100_030_active false)
    (set b_h100_040_active false)
    (set b_h100_050_active false)
    (set b_h100_060_active false)
    (set b_h100_080_active false)
    (set b_h100_090_active false)
    (set b_h100_100_active false)
    (set b_h100_oni_active false)
)

(script static void h100_object_management
    (if debug 
        (print "running object management..."))
    (if (not b_h100_000_active) 
        (h100_000_destroy))
    (if (not b_h100_030_active) 
        (h100_030_destroy))
    (if (not b_h100_040_active) 
        (h100_040_destroy))
    (if (not b_h100_050_active) 
        (h100_050_destroy))
    (if (not b_h100_060_active) 
        (h100_060_destroy))
    (if (not b_h100_080_active) 
        (h100_080_destroy))
    (if (not b_h100_090_active) 
        (h100_090_destroy))
    (if (not b_h100_100_active) 
        (h100_100_destroy))
    (if (not b_h100_oni_active) 
        (h100_oni_destroy))
    (sleep 1)
    (if b_h100_000_active 
        (h100_000_create))
    (if b_h100_030_active 
        (h100_030_create))
    (if b_h100_040_active 
        (h100_040_create))
    (if b_h100_050_active 
        (h100_050_create))
    (if b_h100_060_active 
        (h100_060_create))
    (if b_h100_080_active 
        (h100_080_create))
    (if b_h100_090_active 
        (h100_090_create))
    (if b_h100_100_active 
        (h100_100_create))
    (if b_h100_oni_active 
        (h100_oni_create))
    (sleep 1)
)

(script static void h100_close_security_doors
    (if debug 
        (print "** closing all security doors **"))
    (device_set_position_immediate "dm_security_door_open_01" 0.0)
    (device_set_position_immediate "dm_security_door_open_03" 0.0)
    (device_set_position_immediate "dm_security_door_open_04" 0.0)
    (device_set_position_immediate "dm_security_door_open_07" 0.0)
    (device_set_position_immediate "dm_security_door_open_12" 0.0)
    (device_set_position_immediate "dm_security_door_open_13" 0.0)
    (device_set_position_immediate "dm_security_door_open_14" 0.0)
    (device_set_position_immediate "dm_security_door_open_15" 0.0)
    (device_set_position_immediate "dm_security_door_open_16" 0.0)
    (device_set_position_immediate "dm_security_door_open_19" 0.0)
    (device_set_position_immediate "dm_security_door_open_21" 0.0)
    (device_set_position_immediate "dm_security_door_open_22" 0.0)
    (device_set_position_immediate "dm_security_door_open_23" 0.0)
    (device_set_position_immediate "dm_security_door_open_24" 0.0)
    (device_set_position_immediate "dm_security_door_locked_18" 0.0)
)

(script static void h100_000_create
    (if (not b_h100_000_objects_created) 
        (begin
            (if debug 
                (print "** bsp 000 create **"))
            (object_create_folder_anew "arg_machines_sc150_04")
            (object_create_folder_anew "arg_machines_sc150_05")
            (object_create_folder_anew "dm_bsp_000")
            (object_create_folder_anew "fx_bsp_000")
            (object_create_folder_anew "bp_bsp_000")
            (object_create_folder_anew "wp_bsp_000")
            (object_create_folder_anew "eq_bsp_000")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_000")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_000")
            (set b_h100_000_objects_created true)
        ) (if debug 
            (print "** bsp 000 left alone **"))
    )
)

(script static void h100_000_destroy
    (if debug 
        (print "** bsp 000 destroy **"))
    (device_set_position_immediate "dm_security_door_open_01" 0.0)
    (device_set_position_immediate "dm_security_door_open_03" 0.0)
    (ai_erase "gr_bsp_000")
    (object_destroy_folder "sc_bsp_000")
    (object_destroy_folder "cr_bsp_000")
    (object_destroy_folder "arg_machines_sc150_04")
    (object_destroy_folder "arg_machines_sc150_05")
    (object_destroy_folder "dm_bsp_000")
    (object_destroy_folder "fx_bsp_000")
    (object_destroy_folder "bp_bsp_000")
    (object_destroy_folder "wp_bsp_000")
    (object_destroy_folder "eq_bsp_000")
    (set b_h100_000_objects_created false)
)

(script static void h100_030_create
    (if (not b_h100_030_objects_created) 
        (begin
            (if debug 
                (print "** bsp 030 create **"))
            (object_create_folder_anew "arg_machines_sc140_04")
            (object_create_folder_anew "arg_machines_sc140_05")
            (object_create_folder_anew "arg_machines_sc140_06")
            (object_create_folder_anew "arg_machines_sc150_01")
            (object_create_folder_anew "arg_machines_sc150_02")
            (object_create_folder_anew "arg_machines_sc150_03")
            (object_create_folder_anew "fx_bsp_030")
            (object_create_folder_anew "bp_bsp_030")
            (object_create_folder_anew "wp_bsp_030")
            (object_create_folder_anew "eq_bsp_030")
            (object_create_folder_anew "dm_bsp_030")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_030")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_030")
            (set b_h100_030_objects_created true)
        ) (if debug 
            (print "** bsp 030 left alone **"))
    )
)

(script static void h100_030_destroy
    (if debug 
        (print "** bsp 030 destroy **"))
    (device_set_position_immediate "dm_security_door_open_01" 0.0)
    (device_set_position_immediate "dm_security_door_open_03" 0.0)
    (device_set_position_immediate "dm_security_door_open_12" 0.0)
    (device_set_position_immediate "dm_security_door_open_13" 0.0)
    (ai_erase "gr_bsp_030")
    (object_destroy_folder "sc_bsp_030")
    (object_destroy_folder "cr_bsp_030")
    (object_destroy_folder "arg_machines_sc140_04")
    (object_destroy_folder "arg_machines_sc140_05")
    (object_destroy_folder "arg_machines_sc140_06")
    (object_destroy_folder "arg_machines_sc150_01")
    (object_destroy_folder "arg_machines_sc150_02")
    (object_destroy_folder "arg_machines_sc150_03")
    (object_destroy_folder "bp_bsp_030")
    (object_destroy_folder "fx_bsp_030")
    (object_destroy_folder "wp_bsp_030")
    (object_destroy_folder "eq_bsp_030")
    (object_destroy_folder "dm_bsp_030")
    (set b_h100_030_objects_created false)
)

(script static void h100_040_create
    (if (not b_h100_040_objects_created) 
        (begin
            (if debug 
                (print "** bsp 040 create **"))
            (object_create_folder_anew "arg_machines_sc120_06")
            (object_create_folder_anew "arg_machines_sc130_05")
            (object_create_folder_anew "arg_machines_sc130_06")
            (object_create_folder_anew "arg_machines_sc140_02")
            (object_create_folder_anew "arg_machines_sc140_03")
            (object_create_folder_anew "dm_bsp_040")
            (object_create_folder_anew "fx_bsp_040")
            (object_create_folder_anew "bp_bsp_040")
            (object_create_folder_anew "eq_bsp_040")
            (object_create_folder_anew "wp_bsp_040")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_040")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_040")
            (set b_h100_040_objects_created true)
        ) (if debug 
            (print "** bsp 040 left alone **"))
    )
)

(script static void h100_040_destroy
    (if debug 
        (print "** bsp 040 destroy **"))
    (device_set_position_immediate "dm_security_door_open_12" 0.0)
    (device_set_position_immediate "dm_security_door_open_13" 0.0)
    (device_set_position_immediate "dm_security_door_open_14" 0.0)
    (device_set_position_immediate "dm_security_door_open_15" 0.0)
    (device_set_position_immediate "dm_security_door_open_16" 0.0)
    (ai_erase "gr_bsp_040")
    (object_destroy_folder "sc_bsp_040")
    (object_destroy_folder "cr_bsp_040")
    (object_destroy_folder "arg_machines_sc120_06")
    (object_destroy_folder "arg_machines_sc130_05")
    (object_destroy_folder "arg_machines_sc130_06")
    (object_destroy_folder "arg_machines_sc140_02")
    (object_destroy_folder "arg_machines_sc140_03")
    (object_destroy_folder "dm_bsp_040")
    (object_destroy_folder "fx_bsp_040")
    (object_destroy_folder "bp_bsp_040")
    (object_destroy_folder "eq_bsp_040")
    (object_destroy_folder "wp_bsp_040")
    (set b_h100_040_objects_created false)
)

(script static void h100_050_create
    (if (not b_h100_050_objects_created) 
        (begin
            (if debug 
                (print "** bsp 050 create **"))
            (object_create_folder_anew "arg_machines_sc110_01")
            (object_create_folder_anew "fx_bsp_050")
            (object_create_folder_anew "bp_l100_interior")
            (object_create_folder_anew "wp_l100_interior")
            (object_create_folder_anew "eq_l100")
            (object_create_anew "terminal_l100_phone_01")
            (object_create_anew "terminal_l100_phone_04")
            (object_create_anew "dm_door_sign_locked_18_01")
            (sleep 5)
            (if (gp_boolean_get "gp_h100_from_mainmenu") 
                (begin
                    (object_create_folder_anew "sc_l100_exterior")
                    (object_create_folder_anew "cr_l100_exterior")
                    (object_create_folder_anew "bp_l100")
                    (soft_ceiling_enable "survival" false)
                ) (begin
                    (object_create_folder_anew "sc_l100_blocker")
                    (object_create_folder_anew "cr_l100_blocker")
                )
            )
            (sleep 5)
            (object_create_folder_anew "sc_l100_interior")
            (object_create_folder_anew "sc_bsp_050")
            (sleep 5)
            (object_create_folder_anew "cr_l100_interior")
            (object_create_folder_anew "cr_bsp_050")
            (set b_h100_050_objects_created true)
        ) (if debug 
            (print "** bsp 050 left alone **"))
    )
)

(script static void h100_050_destroy
    (if debug 
        (print "** bsp 050 destroy **"))
    (device_set_position_immediate "dm_security_door_open_07" 0.0)
    (device_set_position_immediate "dm_security_door_locked_18" 0.0)
    (ai_erase "gr_bsp_050")
    (object_destroy "terminal_l100_phone_01")
    (object_destroy "terminal_l100_phone_04")
    (object_destroy "dm_door_sign_locked_18_01")
    (object_destroy_folder "sc_l100_exterior")
    (object_destroy_folder "cr_l100_exterior")
    (object_destroy_folder "sc_l100_interior")
    (object_destroy_folder "cr_l100_interior")
    (object_destroy_folder "sc_bsp_050")
    (object_destroy_folder "cr_bsp_050")
    (object_destroy_folder "sc_l100_blocker")
    (object_destroy_folder "cr_l100_blocker")
    (object_destroy_folder "arg_machines_sc110_01")
    (object_destroy_folder "fx_bsp_050")
    (object_destroy_folder "bp_l100")
    (object_destroy_folder "bp_l100_interior")
    (object_destroy_folder "wp_l100_interior")
    (object_destroy_folder "eq_l100")
    (set b_h100_050_objects_created false)
)

(script static void h100_060_create
    (if (not b_h100_060_objects_created) 
        (begin
            (if debug 
                (print "** bsp 060 create **"))
            (object_create_folder_anew "arg_machines_sc120_05")
            (object_create_folder_anew "arg_machines_sc130_01")
            (object_create_folder_anew "arg_machines_sc130_02")
            (object_create_folder_anew "arg_machines_sc130_03")
            (object_create_folder_anew "fx_bsp_060")
            (object_create_folder_anew "bp_bsp_060")
            (object_create_folder_anew "wp_bsp_060")
            (object_create_folder_anew "eq_bsp_060")
            (object_create_folder_anew "dm_bsp_060")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_060")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_060")
            (set b_h100_060_objects_created true)
        ) (if debug 
            (print "** bsp 060 left alone **"))
    )
)

(script static void h100_060_destroy
    (if debug 
        (print "** bsp 060 destroy **"))
    (device_set_position_immediate "dm_security_door_open_04" 0.0)
    (device_set_position_immediate "dm_security_door_open_14" 0.0)
    (device_set_position_immediate "dm_security_door_open_15" 0.0)
    (device_set_position_immediate "dm_security_door_open_21" 0.0)
    (device_set_position_immediate "dm_security_door_open_22" 0.0)
    (ai_erase "gr_bsp_060")
    (object_destroy_folder "sc_bsp_060")
    (object_destroy_folder "cr_bsp_060")
    (object_destroy_folder "arg_machines_sc120_05")
    (object_destroy_folder "arg_machines_sc130_01")
    (object_destroy_folder "arg_machines_sc130_02")
    (object_destroy_folder "arg_machines_sc130_03")
    (object_destroy_folder "fx_bsp_060")
    (object_destroy_folder "bp_bsp_060")
    (object_destroy_folder "wp_bsp_060")
    (object_destroy_folder "eq_bsp_060")
    (object_destroy_folder "dm_bsp_060")
    (set b_h100_060_objects_created false)
)

(script static void h100_080_create
    (if (not b_h100_080_objects_created) 
        (begin
            (if debug 
                (print "** bsp 080 create **"))
            (object_create_folder_anew "arg_machines_sc110_02")
            (object_create_folder_anew "arg_machines_sc110_03")
            (object_create_folder_anew "arg_machines_sc110_04")
            (object_create_folder_anew "arg_machines_sc110_05")
            (object_create_folder_anew "arg_machines_sc110_06")
            (object_create_folder_anew "arg_machines_sc120_03")
            (object_create_folder_anew "arg_machines_sc120_04")
            (object_create_folder_anew "bp_bsp_080")
            (object_create_folder_anew "fx_bsp_080")
            (object_create_folder_anew "eq_bsp_080")
            (object_create_folder_anew "dm_bsp_080")
            (object_create_folder_anew "wp_bsp_080")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_080")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_080")
            (set b_h100_080_objects_created true)
        ) (if debug 
            (print "** bsp 080 left alone **"))
    )
)

(script static void h100_080_destroy
    (if debug 
        (print "** bsp 080 destroy **"))
    (device_set_position_immediate "dm_security_door_open_07" 0.0)
    (device_set_position_immediate "dm_security_door_open_21" 0.0)
    (device_set_position_immediate "dm_security_door_open_22" 0.0)
    (device_set_position_immediate "dm_security_door_open_23" 0.0)
    (device_set_position_immediate "dm_security_door_open_24" 0.0)
    (device_set_position_immediate "dm_security_door_locked_18" 0.0)
    (ai_erase "gr_bsp_080")
    (object_destroy_folder "sc_bsp_080")
    (object_destroy_folder "cr_bsp_080")
    (object_destroy_folder "arg_machines_sc110_02")
    (object_destroy_folder "arg_machines_sc110_03")
    (object_destroy_folder "arg_machines_sc110_04")
    (object_destroy_folder "arg_machines_sc110_05")
    (object_destroy_folder "arg_machines_sc110_06")
    (object_destroy_folder "arg_machines_sc120_03")
    (object_destroy_folder "arg_machines_sc120_04")
    (object_destroy_folder "bp_bsp_080")
    (object_destroy_folder "fx_bsp_080")
    (object_destroy_folder "eq_bsp_080")
    (object_destroy_folder "dm_bsp_080")
    (object_destroy_folder "wp_bsp_080")
    (set b_h100_080_objects_created false)
)

(script static void h100_090_create
    (if (not b_h100_090_objects_created) 
        (begin
            (if debug 
                (print "** bsp 090 create **"))
            (object_create_folder_anew "arg_machines_sc120_01")
            (object_create_folder_anew "arg_machines_sc120_02")
            (object_create_folder_anew "dm_bsp_090")
            (object_create_folder_anew "bp_bsp_090")
            (object_create_folder_anew "fx_bsp_090")
            (object_create_folder_anew "eq_bsp_090")
            (object_create_folder_anew "wp_bsp_090")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_090")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_090")
            (set b_h100_090_objects_created true)
        ) (if debug 
            (print "** bsp 090 left alone **"))
    )
)

(script static void h100_090_destroy
    (if debug 
        (print "** bsp 090 destroy **"))
    (device_set_position_immediate "dm_security_door_open_23" 0.0)
    (device_set_position_immediate "dm_security_door_open_24" 0.0)
    (ai_erase "gr_bsp_090")
    (object_destroy_folder "sc_bsp_090")
    (object_destroy_folder "cr_bsp_090")
    (object_destroy_folder "arg_machines_sc120_01")
    (object_destroy_folder "arg_machines_sc120_02")
    (object_destroy_folder "dm_bsp_090")
    (object_destroy_folder "bp_bsp_090")
    (object_destroy_folder "fx_bsp_090")
    (object_destroy_folder "eq_bsp_090")
    (set b_h100_090_objects_created false)
)

(script static void h100_100_create
    (if (not b_h100_100_objects_created) 
        (begin
            (if debug 
                (print "** bsp 100 create **"))
            (object_create_folder_anew "arg_machines_sc130_04")
            (object_create_folder_anew "arg_machines_sc140_01")
            (object_create_folder_anew "bp_bsp_100")
            (object_create_folder_anew "fx_bsp_100")
            (object_create_folder_anew "wp_bsp_100")
            (object_create_folder_anew "eq_bsp_100")
            (object_create_folder_anew "dm_bsp_100")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_100")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_100")
            (set b_h100_100_objects_created true)
        ) (if debug 
            (print "** bsp 100 left alone **"))
    )
)

(script static void h100_100_destroy
    (if debug 
        (print "** bsp 100 destroy **"))
    (device_set_position_immediate "dm_security_door_open_04" 0.0)
    (device_set_position_immediate "dm_security_door_open_16" 0.0)
    (device_set_position_immediate "dm_security_door_open_19" 0.0)
    (ai_erase "gr_bsp_100")
    (object_destroy_folder "sc_bsp_100")
    (object_destroy_folder "cr_bsp_100")
    (object_destroy_folder "arg_machines_sc130_04")
    (object_destroy_folder "arg_machines_sc140_01")
    (object_destroy_folder "bp_bsp_100")
    (object_destroy_folder "fx_bsp_100")
    (object_destroy_folder "eq_bsp_100")
    (object_destroy_folder "wp_bsp_100")
    (object_destroy_folder "dm_bsp_100")
    (set b_h100_100_objects_created false)
)

(script static void h100_oni_create
    (if (not b_h100_oni_objects_created) 
        (begin
            (if debug 
                (print "** bsp oni create **"))
            (object_create_folder_anew "bp_bsp_oni")
            (object_create_folder_anew "fx_bsp_oni")
            (object_create_folder_anew "wp_bsp_oni")
            (object_create_folder_anew "eq_bsp_oni")
            (sleep 5)
            (object_create_folder_anew "sc_bsp_oni")
            (sleep 5)
            (object_create_folder_anew "cr_bsp_oni")
            (set b_h100_oni_objects_created true)
        ) (if debug 
            (print "** bsp oni left alone **"))
    )
)

(script static void h100_oni_destroy
    (if debug 
        (print "** bsp oni destroy **"))
    (device_set_position_immediate "dm_security_door_open_19" 0.0)
    (object_destroy_folder "sc_bsp_oni")
    (object_destroy_folder "cr_bsp_oni")
    (object_destroy_folder "wp_bsp_oni")
    (object_destroy_folder "eq_bsp_oni")
    (object_destroy_folder "bp_bsp_oni")
    (object_destroy_folder "fx_bsp_oni")
    (set b_h100_oni_objects_created false)
)

(script static void h100_security_cameras
    (if b_h100_050_active 
        (vehicle_auto_turret "v_l100_sec_cam_01" "tv_l100_sec_cam_01" 0.0 0.0 0.0))
    (if b_h100_050_active 
        (vehicle_auto_turret "v_l100_sec_cam_02" "tv_l100_sec_cam_02" 0.0 0.0 0.0))
    (if b_h100_050_active 
        (vehicle_auto_turret "v_arg_cam_sc110_01" "tv_arg_cam_sc110_01" 0.0 0.0 0.0))
    (if b_h100_090_active 
        (vehicle_auto_turret "v_arg_cam_sc120_01" "tv_arg_cam_sc120_01" 0.0 0.0 0.0))
    (if b_h100_060_active 
        (vehicle_auto_turret "v_arg_cam_sc120_05" "tv_arg_cam_sc120_05" 0.0 0.0 0.0))
    (if b_h100_060_active 
        (vehicle_auto_turret "v_arg_cam_sc130_03" "tv_arg_cam_sc130_03" 0.0 0.0 0.0))
    (if b_h100_100_active 
        (vehicle_auto_turret "v_arg_cam_sc130_04" "tv_arg_cam_sc130_04" 0.0 0.0 0.0))
    (if b_h100_030_active 
        (vehicle_auto_turret "v_arg_cam_sc140_04" "tv_arg_cam_sc140_04" 0.0 0.0 0.0))
    (if b_h100_030_active 
        (vehicle_auto_turret "v_arg_cam_sc150_01" "tv_arg_cam_sc150_01" 0.0 0.0 0.0))
    (if b_h100_050_active 
        (vehicle_auto_turret "v_l150_cam_sc100" "tv_l150_cam_sc100" 0.0 0.0 0.0))
    (if b_h100_090_active 
        (vehicle_auto_turret "v_l150_cam_sc110" "tv_l150_cam_sc110" 0.0 0.0 0.0))
    (if b_h100_040_active 
        (vehicle_auto_turret "v_l150_cam_sc120" "tv_l150_cam_sc120" 0.0 0.0 0.0))
    (if b_h100_oni_active 
        (vehicle_auto_turret "v_l150_cam_sc130" "tv_l150_cam_sc130" 0.0 0.0 0.0))
    (if b_h100_030_active 
        (vehicle_auto_turret "v_l150_cam_sc140" "tv_l150_cam_sc140" 0.0 0.0 0.0))
    (if b_h100_000_active 
        (vehicle_auto_turret "v_l150_cam_sc150" "tv_l150_cam_sc150" 0.0 0.0 0.0))
)

(script dormant void h100_prepare_level
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (volume_test_players "tv_prepare_sc100")
                    (volume_test_players "tv_prepare_sc110")
                    (volume_test_players "tv_prepare_sc120")
                    (volume_test_players "tv_prepare_sc130")
                    (volume_test_players "tv_prepare_sc140")
                    (volume_test_players "tv_prepare_sc150")
                )
            )
            (cond
                ((and
                    (not (gp_boolean_get "gp_sc100_complete"))
                    (volume_test_players "tv_prepare_sc100")
                )
                    (prepare_game_level "sc100")
                )
                ((and
                    (not (gp_boolean_get "gp_sc110_complete"))
                    (volume_test_players "tv_prepare_sc110")
                )
                    (prepare_game_level "sc110")
                )
                ((and
                    (not (gp_boolean_get "gp_sc120_complete"))
                    (volume_test_players "tv_prepare_sc120")
                )
                    (prepare_game_level "sc120")
                )
                ((and
                    (not (gp_boolean_get "gp_sc130_complete"))
                    (volume_test_players "tv_prepare_sc130")
                )
                    (prepare_game_level "sc130")
                )
                ((and
                    (not (gp_boolean_get "gp_sc140_complete"))
                    (volume_test_players "tv_prepare_sc140")
                )
                    (prepare_game_level "sc140")
                )
                ((and
                    (not (gp_boolean_get "gp_sc150_complete"))
                    (volume_test_players "tv_prepare_sc150")
                )
                    (prepare_game_level "sc150")
                )
            )
            (sleep_until 
                (or
                    (not (volume_test_players "tv_prepare_sc100"))
                    (not (volume_test_players "tv_prepare_sc110"))
                    (not (volume_test_players "tv_prepare_sc120"))
                    (not (volume_test_players "tv_prepare_sc130"))
                    (not (volume_test_players "tv_prepare_sc140"))
                    (not (volume_test_players "tv_prepare_sc150"))
                )
            )
            false
        ) 
    60)
)

(script dormant void h100_game_save
    (sleep_until 
        (begin
            (sleep (* 30.0 60.0 2.0))
            (h100_recycle_objects)
            (game_save)
            false
        )
    )
)

(script dormant void player0_h100_engineer_kills
    (f_h100_track_engineer_kills player_00 "gp_p0_h100_engineer_kills" "gp_p0_engineer_kill_counter")
)

(script dormant void player1_h100_engineer_kills
    (f_h100_track_engineer_kills player_01 "gp_p1_h100_engineer_kills" "gp_p1_engineer_kill_counter")
)

(script dormant void player2_h100_engineer_kills
    (f_h100_track_engineer_kills player_02 "gp_p2_h100_engineer_kills" "gp_p2_engineer_kill_counter")
)

(script dormant void player3_h100_engineer_kills
    (f_h100_track_engineer_kills player_03 "gp_p3_h100_engineer_kills" "gp_p3_engineer_kill_counter")
)

(script static void f_h100_track_engineer_kills (short player_short, string_id gp_integer, string_id gp_integer_counter)
    (gp_integer_set gp_integer_counter 0)
    (sleep 1)
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (game_reverted)
                    (> (player_get_kills_by_type (player_get player_short) 28 0) (gp_integer_get gp_integer_counter))
                ) 
            1)
            (if (game_reverted) 
                (gp_integer_set gp_integer_counter (player_get_kills_by_type (player_get player_short) 28 0)) (begin
                    (gp_integer_set gp_integer_counter (+ (gp_integer_get gp_integer_counter) 1.0))
                    (gp_integer_set gp_integer (+ (gp_integer_get gp_integer) 1.0))
                    (sleep 1)
                    (if (<= (gp_integer_get gp_integer) 10) 
                        (achievement_post_chud_progression (player_get player_short) "_achievement_naughty_naughty" (gp_integer_get gp_integer)))
                    (if (= (gp_integer_get gp_integer) 10) 
                        (achievement_grant_to_player (player_get player_short) "_achievement_naughty_naughty"))
                )
            )
            (>= (gp_integer_get gp_integer) 10)
        )
    )
)

(script static void f_h100_good_samaritan (short player_short, string_id gp_integer)
    (if (<= (gp_integer_get gp_integer) 0) 
        (achievement_grant_to_player (player_get player_short) "_achievement_good_samaritan"))
)

(script dormant void h100_clear_command_buffer
    (sleep_until 
        (begin
            (sleep_until 
                (or
                    (volume_test_players "tv_command_buffer_01")
                    (volume_test_players "tv_command_buffer_02")
                    (volume_test_players "tv_command_buffer_03")
                    (volume_test_players "tv_command_buffer_04")
                    (volume_test_players "tv_command_buffer_05")
                    (volume_test_players "tv_command_buffer_06")
                    (volume_test_players "tv_command_buffer_07")
                    (volume_test_players "tv_command_buffer_08")
                    (volume_test_players "tv_command_buffer_09")
                    (volume_test_players "tv_command_buffer_10")
                    (volume_test_players "tv_command_buffer_11")
                    (volume_test_players "tv_command_buffer_12")
                    (volume_test_players "tv_command_buffer_13")
                    (volume_test_players "tv_command_buffer_14")
                    (volume_test_players "tv_command_buffer_15")
                    (volume_test_players "tv_command_buffer_16")
                    (volume_test_players "tv_command_buffer_17")
                    (volume_test_players "tv_command_buffer_18")
                    (volume_test_players "tv_command_buffer_19")
                    (volume_test_players "tv_command_buffer_20")
                    (volume_test_players "tv_command_buffer_21")
                    (volume_test_players "tv_command_buffer_22")
                    (volume_test_players "tv_command_buffer_23")
                    (volume_test_players "tv_command_buffer_24")
                    (volume_test_players "tv_command_buffer_25")
                    (volume_test_players "tv_command_buffer_26")
                    (volume_test_players "tv_command_buffer_27")
                    (volume_test_players "tv_command_buffer_28")
                )
            )
            (if debug 
                (print "*** clear command buffer cache ***"))
            (clear_command_buffer_cache_from_script true)
            (h100_recycle_objects)
            false
        ) 
    (* 30.0 60.0))
)

(script static void h100_disable_zone_swap
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_030:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_000_030:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_000_030:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_000_030:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_030_040:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_030_040:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_030_040:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_030_040:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_040_060:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_040_060:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_040_060:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_040_060:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_040_100:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_040_100:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_050_080:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_050_080:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_050_080:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_050_080:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_060_080:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_060_080:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_060_080:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_060_080:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_060_100:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_060_100:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_080_090:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_080_090:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_080_090:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_080_090:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_100_oni:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_100_oni:*" false)
)

(script static void h100_recycle_objects
    (add_recycling_volume "tv_h100_recycle" 30 1)
)

(script static void test_c100_complete
    (gp_boolean_set "gp_c100_complete" true)
)

(script static void test_sc100_complete
    (gp_integer_set "gp_current_scene" 100)
    (gp_boolean_set "gp_l100_complete" true)
    (gp_boolean_set "gp_sc100_complete" true)
)

(script static void test_sc110_complete
    (gp_integer_set "gp_current_scene" 110)
    (gp_boolean_set "gp_l100_complete" true)
    (gp_boolean_set "gp_sc110_complete" true)
)

(script static void test_sc120_complete
    (gp_integer_set "gp_current_scene" 120)
    (gp_boolean_set "gp_l100_complete" true)
    (gp_boolean_set "gp_sc120_complete" true)
)

(script static void test_sc130_complete
    (gp_integer_set "gp_current_scene" 130)
    (gp_boolean_set "gp_l100_complete" true)
    (gp_boolean_set "gp_sc130_complete" true)
)

(script static void test_sc140_complete
    (gp_integer_set "gp_current_scene" 140)
    (gp_boolean_set "gp_l100_complete" true)
    (gp_boolean_set "gp_sc140_complete" true)
)

(script static void test_sc150_complete
    (gp_integer_set "gp_current_scene" 150)
    (gp_boolean_set "gp_l100_complete" true)
    (gp_boolean_set "gp_sc150_complete" true)
)

(script static void test_scenes_completed
    (gp_boolean_set "gp_l100_complete" true)
    (gp_boolean_set "gp_sc100_complete" true)
    (gp_boolean_set "gp_sc110_complete" true)
    (gp_boolean_set "gp_sc120_complete" true)
    (gp_boolean_set "gp_sc130_complete" true)
    (gp_boolean_set "gp_sc140_complete" true)
    (gp_boolean_set "gp_sc150_complete" true)
)

(script static void test_from_mainmenu
    (gp_boolean_set "gp_h100_from_mainmenu" true)
)

(script dormant void test_000_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_000")
            (object_create_folder_anew "cr_bsp_000")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_030_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_030")
            (object_create_folder_anew "cr_bsp_030")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_040_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_040")
            (object_create_folder_anew "cr_bsp_040")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_050_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_l100_exterior")
            (object_create_folder_anew "cr_l100_exterior")
            (object_create_folder_anew "sc_l100_interior")
            (object_create_folder_anew "cr_l100_interior")
            (object_create_folder_anew "sc_bsp_050")
            (object_create_folder_anew "cr_bsp_050")
            (object_create_folder_anew "bp_l100_interior")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_060_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_060")
            (object_create_folder_anew "cr_bsp_060")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_080_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_080")
            (object_create_folder_anew "cr_bsp_080")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_090_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_090")
            (object_create_folder_anew "cr_bsp_090")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_100_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_100")
            (object_create_folder_anew "cr_bsp_100")
            (sleep 90)
            false
        )
    )
)

(script dormant void test_oni_objects
    (sleep_until 
        (begin
            (object_create_folder_anew "sc_bsp_oni")
            (object_create_folder_anew "cr_bsp_oni")
            (sleep 90)
            false
        )
    )
)

(script static void test_squad_patrol
    (wake h100_loaded_bsps)
    (wake h100_000_sp_spawner)
    (wake h100_030_sp_spawner)
    (wake h100_040_sp_spawner)
    (wake h100_050_sp_spawner)
    (wake h100_060_sp_spawner)
    (wake h100_080_sp_spawner)
    (wake h100_090_sp_spawner)
    (wake h100_100_sp_spawner)
)

(script static void test_objects
    (wake h100_loaded_bsps)
)

(script static void sleep_sp_delay
    (sleep (* (random_range 2 5) 30.0))
)

(script static void h100_kill_squad_patrol
    (sleep_forever h100_000_sp_spawner)
    (sleep_forever h100_030_sp_spawner)
    (sleep_forever h100_040_sp_spawner)
    (sleep_forever h100_050_sp_spawner)
    (sleep_forever h100_060_sp_spawner)
    (sleep_forever h100_080_sp_spawner)
    (sleep_forever h100_090_sp_spawner)
    (sleep_forever h100_100_sp_spawner)
)

(script dormant void h100_000_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_000")
            (ai_reset_objective "obj_bsp_000_left")
            (ai_reset_objective "obj_bsp_000_right")
            (sleep_until (player_in_000) 5)
            (h100_recycle_objects)
            (sleep 1)
            (ai_place "sq_bsp_000_05")
            (ai_place "sq_bsp_000_06")
            (ai_place "sq_bsp_000_10")
            (if (not (gp_boolean_get "gp_enc_000_03_done")) 
                (ai_place "sq_bsp_000_03"))
            (if (not (gp_boolean_get "gp_enc_000_04_done")) 
                (ai_place "sq_bsp_000_04"))
            (if (not (gp_boolean_get "gp_enc_000_08_done")) 
                (ai_place "sq_bsp_000_08"))
            (sleep 1)
            (begin_random
                (if (not (gp_boolean_get "gp_enc_000_01_done")) 
                    (f_000_enc_spawner "sq_bsp_000_01"))
                (if (not (gp_boolean_get "gp_enc_000_02_done")) 
                    (f_000_enc_spawner "sq_bsp_000_02"))
                (if (not (gp_boolean_get "gp_enc_000_07_done")) 
                    (f_000_enc_spawner "sq_bsp_000_07"))
                (if (not (gp_boolean_get "gp_enc_000_09_done")) 
                    (f_000_enc_spawner "sq_bsp_000_09"))
            )
            (sleep_sp_delay)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (player_not_in_000)
                            (<= (ai_living_count "gr_h100_all") s_small_sp_loop_ai_limit)
                        ) 
                    5)
                    (if (player_in_000) 
                        (begin
                            (h100_recycle_objects)
                            (sleep_sp_delay)
                            (if (not (gp_boolean_get "gp_sc150_complete")) 
                                (begin
                                    (ai_squad_patrol_objective_disallow "obj_000_sp_left_04" true)
                                    (ai_squad_patrol_objective_disallow "obj_000_sp_left_05" true)
                                    (ai_squad_patrol_objective_disallow "obj_000_sp_left_07" true)
                                    (ai_squad_patrol_objective_disallow "obj_000_sp_left_08" true)
                                )
                            )
                            (sleep 1)
                            (begin_random
                                (if b_000_squad_spawn 
                                    (f_000_sp_spawner "fl_000_sp_01" "sq_000_sp_cov_01"))
                                (if b_000_squad_spawn 
                                    (f_000_sp_spawner "fl_000_sp_02" "sq_000_sp_cov_02"))
                                (if b_000_squad_spawn 
                                    (f_000_sp_spawner "fl_000_sp_03" "sq_000_sp_cov_03"))
                                (if b_000_squad_spawn 
                                    (f_000_sp_spawner "fl_000_sp_04" "sq_000_sp_cov_04"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc150_complete")
                                        b_000_squad_spawn
                                    ) 
                                        (f_000_sp_spawner "fl_000_sp_05" "sq_000_sp_cov_05"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc150_complete")
                                        b_000_squad_spawn
                                    ) 
                                        (f_000_sp_spawner "fl_000_sp_06" "sq_000_sp_cov_06"))
                                (if b_000_squad_spawn 
                                    (f_000_sp_spawner "fl_000_sp_07" "sq_000_sp_cov_07"))
                            )
                            (set s_000_squad_count 0)
                            (set b_000_squad_spawn true)
                        )
                    )
                    (player_not_in_000)
                ) 
            5)
            false
        ) 
    5)
)

(script static boolean player_not_in_000
    (and
        (not (player_dead))
        (not (player_in_000))
        (<= (device_get_position "dm_security_door_open_01") 0.0)
        (<= (device_get_position "dm_security_door_open_03") 0.0)
    )
)

(script static void f_000_enc_spawner (ai spawned_squad)
    (if 
        (and
            (<= (ai_living_count spawned_squad) 0)
            (<= (ai_living_count "gr_h100_all") s_small_enc_ai_limit)
        ) 
            (begin
                (if debug 
                    (print "placing static squad..."))
                (ai_place spawned_squad)
            )
    )
)

(script static void f_000_sp_spawner (cutscene_flag spawn_location_flag, ai spawn_squad)
    (if 
        (and
            (player_in_000)
            (<= (ai_living_count spawn_squad) 0)
            (>= (objects_distance_to_flag (players) spawn_location_flag) 42.0)
            (<= (objects_distance_to_flag (players) spawn_location_flag) 100.0)
            (<= (ai_living_count "gr_h100_all") s_small_sp_ai_limit)
        ) 
            (begin
                (ai_place spawn_squad)
                (sleep 1)
                (ai_force_active spawn_squad true)
                (if (> (ai_living_count spawn_squad) 0) 
                    (begin
                        (if debug 
                            (print "spawn squad..."))
                        (set s_000_squad_count (+ s_000_squad_count 1.0))
                        (if (>= s_000_squad_count k_000_squad_limit) 
                            (begin
                                (if debug 
                                    (print "stop spawning squads"))
                                (set b_000_squad_spawn false)
                            )
                        )
                        (sleep_sp_delay)
                    )
                )
            )
    )
)

(script dormant void h100_030_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_030")
            (ai_reset_objective "obj_bsp_030_top")
            (ai_reset_objective "obj_bsp_030_bottom")
            (ai_reset_objective "obj_bsp_030_left")
            (ai_reset_objective "obj_bsp_030_right")
            (sleep_until (player_in_030) 5)
            (h100_recycle_objects)
            (ai_place "sq_bsp_030_03")
            (ai_place "sq_bsp_030_06")
            (if (not (gp_boolean_get "gp_enc_030_01_done")) 
                (ai_place "sq_bsp_030_01"))
            (if (not (gp_boolean_get "gp_enc_030_04_done")) 
                (ai_place "sq_bsp_030_04"))
            (sleep 1)
            (begin_random
                (if (not (gp_boolean_get "gp_enc_030_02_done")) 
                    (f_030_enc_spawner "sq_bsp_030_02"))
                (if (not (gp_boolean_get "gp_enc_030_05_done")) 
                    (f_030_enc_spawner "sq_bsp_030_05"))
                (if (not (gp_boolean_get "gp_enc_030_07_done")) 
                    (f_030_enc_spawner "sq_bsp_030_07"))
                (if (not (gp_boolean_get "gp_enc_030_08_done")) 
                    (f_030_enc_spawner "sq_bsp_030_08"))
                (if (not (gp_boolean_get "gp_enc_030_09_done")) 
                    (f_030_enc_spawner "sq_bsp_030_09"))
                (if (not (gp_boolean_get "gp_enc_030_11_done")) 
                    (f_030_enc_spawner "sq_bsp_030_11"))
            )
            (sleep_sp_delay)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (player_not_in_030)
                            (<= (ai_living_count "gr_h100_all") s_large_sp_loop_ai_limit)
                        ) 
                    5)
                    (if (player_in_030) 
                        (begin
                            (h100_recycle_objects)
                            (sleep_sp_delay)
                            (if (not (gp_boolean_get "gp_sc140_complete")) 
                                (begin
                                    (ai_squad_patrol_objective_disallow "obj_030_sp_left_01" true)
                                    (ai_squad_patrol_objective_disallow "obj_030_sp_left_02" true)
                                    (ai_squad_patrol_objective_disallow "obj_030_sp_left_03" true)
                                    (ai_squad_patrol_objective_disallow "obj_030_sp_left_04" true)
                                    (ai_squad_patrol_objective_disallow "obj_030_sp_bot_08" true)
                                )
                            )
                            (sleep 1)
                            (begin_random
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc140_complete")
                                        b_030_squad_spawn
                                    ) 
                                        (f_030_sp_spawner "fl_030_sp_01" "sq_030_sp_cov_01"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_02" "sq_030_sp_cov_02"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_03" "sq_030_sp_cov_03"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_04" "sq_030_sp_cov_04"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_05" "sq_030_sp_cov_05"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_06" "sq_030_sp_cov_06"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_07" "sq_030_sp_cov_07"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_08" "sq_030_sp_cov_08"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_09" "sq_030_sp_cov_09"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc140_complete")
                                        b_030_squad_spawn
                                    ) 
                                        (f_030_sp_spawner "fl_030_sp_10" "sq_030_sp_cov_10"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_11" "sq_030_sp_cov_11"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_12" "sq_030_sp_cov_12"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc140_complete")
                                        b_030_squad_spawn
                                    ) 
                                        (f_030_sp_spawner "fl_030_sp_13" "sq_030_sp_cov_13"))
                                (if b_030_squad_spawn 
                                    (f_030_sp_spawner "fl_030_sp_14" "sq_030_sp_cov_14"))
                            )
                            (set s_030_squad_count 0)
                            (set b_030_squad_spawn true)
                        )
                    )
                    (player_not_in_030)
                ) 
            5)
            false
        ) 
    5)
)

(script static boolean player_not_in_030
    (and
        (not (player_dead))
        (not (player_in_030))
        (<= (device_get_position "dm_security_door_open_01") 0.0)
        (<= (device_get_position "dm_security_door_open_03") 0.0)
        (<= (device_get_position "dm_security_door_open_12") 0.0)
        (<= (device_get_position "dm_security_door_open_13") 0.0)
    )
)

(script static void f_030_enc_spawner (ai spawned_squad)
    (if 
        (and
            (<= (ai_living_count spawned_squad) 0)
            (<= (ai_living_count "gr_enc_030") s_large_enc_ai_limit)
        ) 
            (begin
                (if debug 
                    (print "placing static squad..."))
                (ai_place spawned_squad)
            )
    )
)

(script static void f_030_sp_spawner (cutscene_flag spawn_location_flag, ai spawn_squad)
    (if 
        (and
            (player_in_030)
            (<= (ai_living_count spawn_squad) 0)
            (>= (objects_distance_to_flag (players) spawn_location_flag) 42.0)
            (<= (objects_distance_to_flag (players) spawn_location_flag) 100.0)
            (<= (ai_living_count "gr_h100_all") s_large_sp_ai_limit)
        ) 
            (begin
                (ai_place spawn_squad)
                (sleep 1)
                (ai_force_active spawn_squad true)
                (if (> (ai_living_count spawn_squad) 0) 
                    (begin
                        (if debug 
                            (print "spawn squad..."))
                        (set s_030_squad_count (+ s_030_squad_count 1.0))
                        (if (>= s_030_squad_count k_030_squad_limit) 
                            (begin
                                (if debug 
                                    (print "stop spawning squads"))
                                (set b_030_squad_spawn false)
                            )
                        )
                        (sleep_sp_delay)
                    )
                )
            )
    )
)

(script static void enc_030_090_refresh
    (sleep 1)
    (ai_reset_objective "obj_bsp_030_bottom/patrol_gate")
)

(script command_script void cs_mark_ai_ghost_01
    (set ai_ghost_01 (ai_vehicle_get_from_starting_location "sq_bsp_030_09/ghost"))
    (cs_vehicle_speed 0.7)
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (sleep_until (volume_test_players "tv_null"))
)

(script command_script void cs_mark_ai_ghost_02
    (set ai_ghost_02 (ai_vehicle_get_from_starting_location "sq_bsp_030_10/ghost"))
)

(script dormant void h100_040_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_040")
            (ai_reset_objective "obj_bsp_040_left")
            (ai_reset_objective "obj_bsp_040_right")
            (sleep_until (player_in_040) 5)
            (h100_recycle_objects)
            (ai_place "sq_bsp_040_04")
            (if (not (= (gp_integer_get "gp_current_scene") 120)) 
                (begin
                    (ai_place "sq_bsp_040_08")
                    (if (not (gp_boolean_get "gp_enc_040_05_done")) 
                        (ai_place "sq_bsp_040_05"))
                    (if (not (gp_boolean_get "gp_enc_040_07_done")) 
                        (ai_place "sq_bsp_040_07"))
                )
            )
            (if (not (gp_boolean_get "gp_enc_040_01_done")) 
                (ai_place "sq_bsp_040_01"))
            (sleep 1)
            (begin_random
                (if (not (gp_boolean_get "gp_enc_040_02_done")) 
                    (f_040_enc_spawner "sq_bsp_040_02"))
                (if (not (gp_boolean_get "gp_enc_040_03_done")) 
                    (f_040_enc_spawner "sq_bsp_040_03"))
                (if (not (gp_boolean_get "gp_enc_040_06_done")) 
                    (f_040_enc_spawner "sq_bsp_040_06"))
                (if (not (gp_boolean_get "gp_enc_040_09_done")) 
                    (f_040_enc_spawner "sq_bsp_040_09"))
                (if (not (gp_boolean_get "gp_enc_040_10_done")) 
                    (f_040_enc_spawner "sq_bsp_040_10"))
            )
            (sleep_sp_delay)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (player_not_in_040)
                            (<= (ai_living_count "gr_h100_all") s_small_sp_loop_ai_limit)
                        ) 
                    5)
                    (if (player_in_040) 
                        (begin
                            (h100_recycle_objects)
                            (sleep_sp_delay)
                            (if (not (gp_boolean_get "gp_sc120_complete")) 
                                (begin
                                    (ai_squad_patrol_objective_disallow "obj_040_sp_right_01" true)
                                    (ai_squad_patrol_objective_disallow "obj_040_sp_right_02" true)
                                    (ai_squad_patrol_objective_disallow "obj_040_sp_right_03" true)
                                )
                            )
                            (if (not (gp_boolean_get "gp_enc_040_01_done")) 
                                (ai_squad_patrol_objective_disallow "obj_040_sp_left_05" true) (ai_squad_patrol_objective_disallow "obj_040_sp_left_05" false))
                            (begin_random
                                (if b_040_squad_spawn 
                                    (f_040_sp_spawner "fl_040_sp_01" "sq_040_sp_cov_01"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc120_complete")
                                        b_040_squad_spawn
                                    ) 
                                        (f_040_sp_spawner "fl_040_sp_02" "sq_040_sp_cov_02"))
                                (if b_040_squad_spawn 
                                    (f_040_sp_spawner "fl_040_sp_03" "sq_040_sp_cov_03"))
                                (if b_040_squad_spawn 
                                    (f_040_sp_spawner "fl_040_sp_04" "sq_040_sp_cov_04"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc120_complete")
                                        b_040_squad_spawn
                                    ) 
                                        (f_040_sp_spawner "fl_040_sp_05" "sq_040_sp_cov_05"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_sc120_complete")
                                        b_040_squad_spawn
                                    ) 
                                        (f_040_sp_spawner "fl_040_sp_06" "sq_040_sp_cov_06"))
                                (if b_040_squad_spawn 
                                    (f_040_sp_spawner "fl_040_sp_07" "sq_040_sp_cov_07"))
                                (if b_040_squad_spawn 
                                    (f_040_sp_spawner "fl_040_sp_08" "sq_040_sp_cov_08"))
                                (if b_040_squad_spawn 
                                    (f_040_sp_spawner "fl_040_sp_09" "sq_040_sp_cov_09"))
                                (if 
                                    (and
                                        (gp_boolean_get "gp_enc_040_01_done")
                                        b_040_squad_spawn
                                    ) 
                                        (f_040_sp_spawner "fl_040_sp_10" "sq_040_sp_cov_10"))
                            )
                            (set s_040_squad_count 0)
                            (set b_040_squad_spawn true)
                        )
                    )
                    (player_not_in_040)
                ) 
            5)
            false
        ) 
    5)
)

(script static boolean player_not_in_040
    (and
        (not (player_dead))
        (not (player_in_040))
        (<= (device_get_position "dm_security_door_open_12") 0.0)
        (<= (device_get_position "dm_security_door_open_13") 0.0)
        (<= (device_get_position "dm_security_door_open_14") 0.0)
        (<= (device_get_position "dm_security_door_open_15") 0.0)
        (<= (device_get_position "dm_security_door_open_16") 0.0)
    )
)

(script static void f_040_enc_spawner (ai spawned_squad)
    (if 
        (and
            (<= (ai_living_count spawned_squad) 0)
            (<= (ai_living_count "gr_enc_040") s_small_enc_ai_limit)
        ) 
            (begin
                (if debug 
                    (print "placing static squad..."))
                (ai_place spawned_squad)
            )
    )
)

(script static void f_040_sp_spawner (cutscene_flag spawn_location_flag, ai spawn_squad)
    (if 
        (and
            (player_in_040)
            (<= (ai_living_count spawn_squad) 0)
            (>= (objects_distance_to_flag (players) spawn_location_flag) 42.0)
            (<= (objects_distance_to_flag (players) spawn_location_flag) 100.0)
            (<= (ai_living_count "gr_h100_all") s_small_sp_ai_limit)
        ) 
            (begin
                (ai_place spawn_squad)
                (sleep 1)
                (ai_force_active spawn_squad true)
                (if (> (ai_living_count spawn_squad) 0) 
                    (begin
                        (if debug 
                            (print "spawn squad..."))
                        (set s_040_squad_count (+ s_040_squad_count 1.0))
                        (if (>= s_040_squad_count k_040_squad_limit) 
                            (begin
                                (if debug 
                                    (print "stop spawning squads"))
                                (set b_040_squad_spawn false)
                            )
                        )
                        (sleep_sp_delay)
                    )
                )
            )
    )
)

(script dormant void h100_050_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_050")
            (ai_reset_objective "obj_bsp_050_right")
            (ai_reset_objective "obj_bsp_050_left")
            (sleep_until (player_in_050) 5)
            (h100_recycle_objects)
            (ai_place "sq_bsp_050_01")
            (ai_place "sq_bsp_050_02")
            (if (not (gp_boolean_get "gp_enc_050_07_done")) 
                (f_050_enc_spawner "sq_bsp_050_07"))
            (if (not (gp_boolean_get "gp_enc_050_06_done")) 
                (f_050_enc_spawner "sq_bsp_050_06"))
            (sleep 1)
            (begin_random
                (if (not (gp_boolean_get "gp_enc_050_03_done")) 
                    (f_050_enc_spawner "sq_bsp_050_03"))
                (if (not (gp_boolean_get "gp_enc_050_04_done")) 
                    (f_050_enc_spawner "sq_bsp_050_04"))
                (if (not (gp_boolean_get "gp_enc_050_05_done")) 
                    (f_050_enc_spawner "sq_bsp_050_05"))
            )
            (sleep_sp_delay)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (player_not_in_050)
                            (<= (ai_living_count "gr_h100_all") s_small_sp_loop_ai_limit)
                        ) 
                    5)
                    (if (player_in_050) 
                        (begin
                            (h100_recycle_objects)
                            (sleep_sp_delay)
                            (begin_random
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_01" "sq_050_sp_cov_01"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_02" "sq_050_sp_cov_02"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_03" "sq_050_sp_cov_03"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_04" "sq_050_sp_cov_04"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_05" "sq_050_sp_cov_05"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_06" "sq_050_sp_cov_06"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_07" "sq_050_sp_cov_07"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_08" "sq_050_sp_cov_08"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_09" "sq_050_sp_cov_09"))
                                (if b_050_squad_spawn 
                                    (f_050_sp_spawner "fl_050_sp_10" "sq_050_sp_cov_10"))
                            )
                            (set s_050_squad_count 0)
                            (set b_050_squad_spawn true)
                        )
                    )
                    (player_not_in_050)
                ) 
            5)
            false
        ) 
    5)
)

(script static boolean player_not_in_050
    (and
        (not (player_dead))
        (not (player_in_050))
        (<= (device_get_position "dm_security_door_open_07") 0.0)
        (<= (device_get_position "dm_security_door_locked_18") 0.0)
    )
)

(script static void f_050_enc_spawner (ai spawned_squad)
    (if 
        (and
            (<= (ai_living_count spawned_squad) 0)
            (<= (ai_living_count "gr_enc_050") s_small_enc_ai_limit)
        ) 
            (begin
                (if debug 
                    (print "placing static squad..."))
                (ai_place spawned_squad)
            )
    )
)

(script static void f_050_sp_spawner (cutscene_flag spawn_location_flag, ai spawn_squad)
    (if 
        (and
            (player_in_050)
            (<= (ai_living_count spawn_squad) 0)
            (>= (objects_distance_to_flag (players) spawn_location_flag) 42.0)
            (<= (objects_distance_to_flag (players) spawn_location_flag) 100.0)
            (<= (ai_living_count "gr_h100_all") s_small_sp_ai_limit)
        ) 
            (begin
                (ai_place spawn_squad)
                (sleep 1)
                (ai_force_active spawn_squad true)
                (if (> (ai_living_count spawn_squad) 0) 
                    (begin
                        (if debug 
                            (print "spawn squad..."))
                        (set s_050_squad_count (+ s_050_squad_count 1.0))
                        (if (>= s_050_squad_count k_050_squad_limit) 
                            (begin
                                (if debug 
                                    (print "stop spawning squads"))
                                (set b_050_squad_spawn false)
                            )
                        )
                        (sleep_sp_delay)
                    )
                )
            )
    )
)

(script command_script void cs_050_hold_jackals
    (cs_abort_on_alert true)
    (sleep (* 30.0 7.0))
)

(script dormant void h100_060_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_060")
            (ai_reset_objective "obj_bsp_060_left")
            (ai_reset_objective "obj_bsp_060_right")
            (sleep_until (player_in_060) 5)
            (h100_recycle_objects)
            (ai_place "sq_bsp_060_02")
            (ai_place "sq_bsp_060_05")
            (if (not (gp_boolean_get "gp_enc_060_03_done")) 
                (ai_place "gr_enc_060_03"))
            (if (not (gp_boolean_get "gp_enc_060_01_done")) 
                (ai_place "sq_bsp_060_01"))
            (if (not (gp_boolean_get "gp_enc_060_04_done")) 
                (ai_place "sq_bsp_060_04"))
            (sleep 1)
            (if (not (gp_boolean_get "gp_enc_060_06_done")) 
                (f_060_enc_spawner "sq_bsp_060_06"))
            (sleep_sp_delay)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (player_not_in_060)
                            (<= (ai_living_count "gr_h100_all") s_small_sp_loop_ai_limit)
                        ) 
                    5)
                    (if (player_in_060) 
                        (begin
                            (h100_recycle_objects)
                            (sleep_sp_delay)
                            (begin_random
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_01" "sq_060_sp_cov_01"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_02" "sq_060_sp_cov_02"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_03" "sq_060_sp_cov_03"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_04" "sq_060_sp_cov_04"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_05" "sq_060_sp_cov_05"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_06" "sq_060_sp_cov_06"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_07" "sq_060_sp_cov_07"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_08" "sq_060_sp_cov_08"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_09" "sq_060_sp_cov_09"))
                                (if b_060_squad_spawn 
                                    (f_060_sp_spawner "fl_060_sp_10" "sq_060_sp_cov_10"))
                            )
                            (set s_060_squad_count 0)
                            (set b_060_squad_spawn true)
                        )
                    )
                    (player_not_in_060)
                ) 
            5)
            false
        ) 
    5)
)

(script static boolean player_not_in_060
    (and
        (not (player_dead))
        (not (player_in_060))
        (<= (device_get_position "dm_security_door_open_04") 0.0)
        (<= (device_get_position "dm_security_door_open_14") 0.0)
        (<= (device_get_position "dm_security_door_open_15") 0.0)
        (<= (device_get_position "dm_security_door_open_21") 0.0)
        (<= (device_get_position "dm_security_door_open_22") 0.0)
    )
)

(script static void f_060_enc_spawner (ai spawned_squad)
    (if 
        (and
            (<= (ai_living_count spawned_squad) 0)
            (<= (ai_living_count "gr_enc_060") s_small_enc_ai_limit)
        ) 
            (begin
                (if debug 
                    (print "placing static squad..."))
                (ai_place spawned_squad)
            )
    )
)

(script static void f_060_sp_spawner (cutscene_flag spawn_location_flag, ai spawn_squad)
    (if 
        (and
            (player_in_060)
            (<= (ai_living_count spawn_squad) 0)
            (>= (objects_distance_to_flag (players) spawn_location_flag) 42.0)
            (<= (objects_distance_to_flag (players) spawn_location_flag) 100.0)
            (<= (ai_living_count "gr_h100_all") s_small_sp_ai_limit)
        ) 
            (begin
                (ai_place spawn_squad)
                (sleep 1)
                (ai_force_active spawn_squad true)
                (if (> (ai_living_count spawn_squad) 0) 
                    (begin
                        (if debug 
                            (print "spawn squad..."))
                        (set s_060_squad_count (+ s_060_squad_count 1.0))
                        (if (>= s_060_squad_count k_060_squad_limit) 
                            (begin
                                (if debug 
                                    (print "stop spawning squads"))
                                (set b_060_squad_spawn false)
                            )
                        )
                        (sleep_sp_delay)
                    )
                )
            )
    )
)

(script dormant void h100_080_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_080")
            (ai_reset_objective "obj_bsp_080_top")
            (ai_reset_objective "obj_bsp_080_left")
            (ai_reset_objective "obj_bsp_080_right")
            (ai_reset_objective "obj_bsp_080_bottom")
            (sleep_until (player_in_080) 5)
            (h100_recycle_objects)
            (if (not (= (gp_integer_get "gp_current_scene") 100)) 
                (ai_place "sq_bsp_080_01"))
            (if 
                (and
                    (not (gp_boolean_get "gp_enc_080_09_done"))
                    (= (gp_integer_get "gp_current_scene") 100)
                ) 
                    (ai_place "gr_enc_080_09"))
            (if 
                (and
                    (not (gp_boolean_get "gp_enc_080_08_done"))
                    (not (= (gp_integer_get "gp_current_scene") 100))
                ) 
                    (ai_place "gr_enc_080_08"))
            (sleep 1)
            (if (not (gp_boolean_get "gp_enc_080_03_done")) 
                (ai_place "sq_bsp_080_03a"))
            (if (not (gp_boolean_get "gp_enc_080_04_done")) 
                (ai_place "gr_enc_080_04"))
            (sleep 1)
            (begin_random
                (if (not (gp_boolean_get "gp_enc_080_02_done")) 
                    (f_080_enc_spawner "sq_bsp_080_02"))
                (if (not (gp_boolean_get "gp_enc_080_06_done")) 
                    (f_080_enc_spawner "sq_bsp_080_06"))
                (if (not (gp_boolean_get "gp_enc_080_07_done")) 
                    (f_080_enc_spawner "sq_bsp_080_07"))
            )
            (sleep_sp_delay)
            (sleep_until 
                (begin
                    (sleep_until 
                        (or
                            (player_not_in_080)
                            (<= (ai_living_count "gr_h100_all") s_large_sp_loop_ai_limit)
                        ) 
                    5)
                    (if (player_in_080) 
                        (begin
                            (h100_recycle_objects)
                            (sleep_sp_delay)
                            (if (<= (ai_living_count "gr_enc_080_03") 0) 
                                (begin
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_top_08" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_01" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_02" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_03" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_04" true)
                                ) (begin
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_top_08" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_01" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_02" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_03" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_left_04" false)
                                )
                            )
                            (if (<= (ai_living_count "gr_enc_080_08") 0) 
                                (begin
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_top_07" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_01" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_02" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_03" true)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_05" true)
                                ) (begin
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_top_07" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_01" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_02" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_03" false)
                                    (ai_squad_patrol_objective_disallow "obj_080_sp_right_05" false)
                                )
                            )
                            (begin_random
                                (if 
                                    (and
                                        b_080_squad_spawn
                                        (<= (ai_living_count "gr_enc_080_03") 0)
                                    ) 
                                        (f_080_sp_spawner "fl_080_sp_01" "sq_080_sp_cov_01"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_02" "sq_080_sp_cov_02"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_03" "sq_080_sp_cov_03"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_04" "sq_080_sp_cov_04"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_05" "sq_080_sp_cov_05"))
                                (if 
                                    (and
                                        b_080_squad_spawn
                                        (<= (ai_living_count "gr_enc_080_08") 0)
                                    ) 
                                        (f_080_sp_spawner "fl_080_sp_06" "sq_080_sp_cov_06"))
                                (if 
                                    (and
                                        b_080_squad_spawn
                                        (<= (ai_living_count "gr_enc_080_08") 0)
                                    ) 
                                        (f_080_sp_spawner "fl_080_sp_07" "sq_080_sp_cov_07"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_08" "sq_080_sp_cov_08"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_09" "sq_080_sp_cov_09"))
                                (if 
                                    (and
                                        b_080_squad_spawn
                                        (<= (ai_living_count "gr_enc_080_03") 0)
                                    ) 
                                        (f_080_sp_spawner "fl_080_sp_10" "sq_080_sp_cov_10"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_11" "sq_080_sp_cov_11"))
                                (if b_080_squad_spawn 
                                    (f_080_sp_spawner "fl_080_sp_12" "sq_080_sp_cov_12"))
                                (if 
                                    (and
                                        b_080_squad_spawn
                                        (<= (ai_living_count "gr_enc_080_03") 0)
                                    ) 
                                        (f_080_sp_spawner "fl_080_sp_13" "sq_080_sp_cov_13"))
                                (if 
                                    (and
                                        b_080_squad_spawn
                                        (<= (ai_living_count "gr_enc_080_08") 0)
                                    ) 
                                        (f_080_sp_spawner "fl_080_sp_14" "sq_080_sp_cov_14"))
                            )
                            (sleep 1)
                            (set s_080_squad_count 0)
                            (set b_080_squad_spawn true)
                        )
                    )
                    (player_not_in_080)
                ) 
            5)
            false
        ) 
    5)
)

(script static boolean player_not_in_080
    (and
        (not (player_dead))
        (not (player_in_080))
        (<= (device_get_position "dm_security_door_open_07") 0.0)
        (<= (device_get_position "dm_security_door_open_21") 0.0)
        (<= (device_get_position "dm_security_door_open_22") 0.0)
        (<= (device_get_position "dm_security_door_open_23") 0.0)
        (<= (device_get_position "dm_security_door_open_24") 0.0)
        (<= (device_get_position "dm_security_door_locked_18") 0.0)
    )
)

(script static void f_080_enc_spawner (ai spawned_squad)
    (if 
        (and
            (<= (ai_living_count spawned_squad) 0)
            (<= (ai_living_count "gr_enc_080") s_large_enc_ai_limit)
        ) 
            (begin
                (if debug 
                    (print "placing static squad..."))
                (ai_place spawned_squad)
            )
    )
)

(script static void f_080_sp_spawner (cutscene_flag spawn_location_flag, ai spawn_squad)
    (if 
        (and
            (player_in_080)
            (<= (ai_living_count spawn_squad) 0)
            (>= (objects_distance_to_flag (players) spawn_location_flag) 42.0)
            (<= (objects_distance_to_flag (players) spawn_location_flag) 100.0)
            (<= (ai_living_count "gr_h100_all") s_large_sp_ai_limit)
        ) 
            (begin
                (ai_place spawn_squad)
                (sleep 1)
                (ai_force_active spawn_squad true)
                (if (> (ai_living_count spawn_squad) 0) 
                    (begin
                        (if debug 
                            (print "spawn squad..."))
                        (set s_080_squad_count (+ s_080_squad_count 1.0))
                        (if (>= s_080_squad_count k_080_squad_limit) 
                            (begin
                                (if debug 
                                    (print "stop spawning squads"))
                                (set b_080_squad_spawn false)
                            )
                        )
                        (sleep_sp_delay)
                    )
                )
            )
    )
)

(script command_script void cs_080_phantom_01
    (set v_080_phantom_01 (ai_vehicle_get_from_starting_location "sq_bsp_080_03a/phantom"))
    (cs_enable_pathfinding_failsafe true)
    (f_load_phantom v_080_phantom_01 "chute" "sq_bsp_080_03b" "sq_bsp_080_03c" none none)
    (sleep_until (volume_test_players "tv_080_phantom_01"))
    (cs_fly_by "ps_080_phantom_01/p0")
    (cs_fly_by "ps_080_phantom_01/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_to "ps_080_phantom_01/p2")
    (cs_fly_to_and_face "ps_080_phantom_01/p3" "ps_080_phantom_01/p4" 1.0)
    (f_unload_phantom v_080_phantom_01 "chute")
    (cs_vehicle_speed 1.0)
    (cs_fly_to "ps_080_phantom_01/p2")
    (cs_fly_by "ps_080_phantom_01/p4")
    (cs_fly_by "ps_080_phantom_01/p5")
    (cs_fly_by "ps_080_phantom_01/p6")
    (cs_fly_by "ps_080_phantom_01/p7")
    (cs_fly_by "ps_080_phantom_01/erase")
    (ai_erase ai_current_squad)
)

(script dormant void h100_090_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_090")
            (ai_reset_objective "obj_bsp_090_right")
            (sleep_until (player_in_090) 5)
            (h100_recycle_objects)
            (if (not (= (gp_integer_get "gp_current_scene") 110)) 
                (ai_place "sq_bsp_090_08"))
            (if (not (gp_boolean_get "gp_enc_090_01_done")) 
                (ai_place "gr_enc_090_01"))
            (sleep_until (player_not_in_090) 5)
            (h100_recycle_objects)
            false
        )
    )
)

(script static boolean player_not_in_090
    (and
        (not (player_dead))
        (not (player_in_090))
        (<= (device_get_position "dm_security_door_open_23") 0.0)
        (<= (device_get_position "dm_security_door_open_24") 0.0)
    )
)

(script dormant void h100_100_sp_spawner
    (sleep_until 
        (begin
            (ai_erase "gr_bsp_100")
            (ai_reset_objective "obj_bsp_100")
            (sleep_until 
                (or
                    (player_in_oni)
                    (player_in_100)
                ) 
            5)
            (h100_recycle_objects)
            (ai_place "gr_enc_100_04")
            (ai_place "sq_bsp_100_05")
            (if (not (= (gp_integer_get "gp_current_scene") 130)) 
                (begin
                    (if (not (gp_boolean_get "gp_enc_100_01_done")) 
                        (ai_place "gr_enc_100_01"))
                )
            )
            (if (not (gp_boolean_get "gp_enc_100_03_done")) 
                (ai_place "gr_enc_100_03"))
            (sleep_until 
                (and
                    (player_not_in_oni)
                    (player_not_in_100)
                ) 
            5)
            (h100_recycle_objects)
            false
        )
    )
)

(script static boolean player_not_in_100
    (and
        (not (player_dead))
        (not (player_in_100))
        (<= (device_get_position "dm_security_door_open_04") 0.0)
        (<= (device_get_position "dm_security_door_open_16") 0.0)
    )
)

(script static boolean player_not_in_oni
    (and
        (not (player_dead))
        (not (player_in_oni))
        (<= (device_get_position "dm_security_door_open_19") 0.0)
    )
)

(script static void h100_enc_000_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_01_done" true)
)

(script static void h100_enc_000_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_02_done" true)
)

(script static void h100_enc_000_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_03_done" true)
)

(script static void h100_enc_000_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_04_done" true)
)

(script static void h100_enc_000_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_05_done" true)
)

(script static void h100_enc_000_06_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_06_done" true)
)

(script static void h100_enc_000_07_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_07_done" true)
)

(script static void h100_enc_000_08_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_08_done" true)
)

(script static void h100_enc_000_09_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_09_done" true)
)

(script static void h100_enc_000_10_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_000_10_done" true)
)

(script static void h100_enc_030_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_01_done" true)
)

(script static void h100_enc_030_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_02_done" true)
)

(script static void h100_enc_030_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_03_done" true)
)

(script static void h100_enc_030_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_04_done" true)
)

(script static void h100_enc_030_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_05_done" true)
)

(script static void h100_enc_030_06_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_06_done" true)
)

(script static void h100_enc_030_07_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_07_done" true)
)

(script static void h100_enc_030_08_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_08_done" true)
)

(script static void h100_enc_030_09_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_09_done" true)
)

(script static void h100_enc_030_10_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_10_done" true)
)

(script static void h100_enc_030_11_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_030_11_done" true)
)

(script static void h100_enc_040_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_01_done" true)
)

(script static void h100_enc_040_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_02_done" true)
)

(script static void h100_enc_040_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_03_done" true)
)

(script static void h100_enc_040_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_04_done" true)
)

(script static void h100_enc_040_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_05_done" true)
)

(script static void h100_enc_040_06_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_06_done" true)
)

(script static void h100_enc_040_07_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_07_done" true)
)

(script static void h100_enc_040_08_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_08_done" true)
)

(script static void h100_enc_040_09_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_09_done" true)
)

(script static void h100_enc_040_10_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_040_10_done" true)
)

(script static void h100_enc_050_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_01_done" true)
)

(script static void h100_enc_050_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_02_done" true)
)

(script static void h100_enc_050_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_03_done" true)
)

(script static void h100_enc_050_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_04_done" true)
)

(script static void h100_enc_050_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_05_done" true)
)

(script static void h100_enc_050_06_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_06_done" true)
)

(script static void h100_enc_050_07_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_07_done" true)
)

(script static void h100_enc_050_08_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_08_done" true)
)

(script static void h100_enc_050_09_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_09_done" true)
)

(script static void h100_enc_050_10_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_050_10_done" true)
)

(script static void h100_enc_060_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_01_done" true)
)

(script static void h100_enc_060_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_02_done" true)
)

(script static void h100_enc_060_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_03_done" true)
)

(script static void h100_enc_060_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_04_done" true)
)

(script static void h100_enc_060_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_05_done" true)
)

(script static void h100_enc_060_06_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_06_done" true)
)

(script static void h100_enc_060_07_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_07_done" true)
)

(script static void h100_enc_060_08_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_08_done" true)
)

(script static void h100_enc_060_09_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_09_done" true)
)

(script static void h100_enc_060_10_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_060_10_done" true)
)

(script static void h100_enc_080_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_01_done" true)
)

(script static void h100_enc_080_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_02_done" true)
)

(script static void h100_enc_080_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_03_done" true)
)

(script static void h100_enc_080_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_04_done" true)
)

(script static void h100_enc_080_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_05_done" true)
)

(script static void h100_enc_080_06_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_06_done" true)
)

(script static void h100_enc_080_07_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_07_done" true)
)

(script static void h100_enc_080_08_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_08_done" true)
)

(script static void h100_enc_080_09_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_09_done" true)
)

(script static void h100_enc_080_10_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_080_10_done" true)
)

(script static void h100_enc_090_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_01_done" true)
)

(script static void h100_enc_090_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_02_done" true)
)

(script static void h100_enc_090_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_03_done" true)
)

(script static void h100_enc_090_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_04_done" true)
)

(script static void h100_enc_090_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_05_done" true)
)

(script static void h100_enc_090_06_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_06_done" true)
)

(script static void h100_enc_090_07_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_07_done" true)
)

(script static void h100_enc_090_08_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_08_done" true)
)

(script static void h100_enc_090_09_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_09_done" true)
)

(script static void h100_enc_090_10_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_090_10_done" true)
)

(script static void h100_enc_100_01_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_100_01_done" true)
)

(script static void h100_enc_100_02_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_100_02_done" true)
)

(script static void h100_enc_100_03_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_100_03_done" true)
)

(script static void h100_enc_100_04_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_100_04_done" true)
)

(script static void h100_enc_100_05_done
    (if debug 
        (print "*** encounter done ***"))
    (gp_boolean_set "gp_enc_100_05_done" true)
)

(script static void test_kill_squad_patrol
    (sleep_forever h100_000_sp_spawner)
    (sleep_forever h100_030_sp_spawner)
    (sleep_forever h100_040_sp_spawner)
    (sleep_forever h100_050_sp_spawner)
    (sleep_forever h100_060_sp_spawner)
    (sleep_forever h100_080_sp_spawner)
    (sleep_forever h100_090_sp_spawner)
    (sleep_forever h100_100_sp_spawner)
)

(script static void test_squad_patrol_000
    (wake h100_loaded_bsps)
    (wake h100_000_sp_spawner)
)

(script static void test_squad_patrol_030
    (wake h100_loaded_bsps)
    (wake h100_030_sp_spawner)
)

(script static void test_squad_patrol_040
    (wake h100_loaded_bsps)
    (wake h100_040_sp_spawner)
)

(script static void test_squad_patrol_050
    (wake h100_loaded_bsps)
    (wake h100_050_sp_spawner)
)

(script static void test_squad_patrol_060
    (wake h100_loaded_bsps)
    (wake h100_060_sp_spawner)
)

(script static void test_squad_patrol_080
    (wake h100_loaded_bsps)
    (wake h100_080_sp_spawner)
)

(script static void test_squad_patrol_090
    (wake h100_loaded_bsps)
    (wake h100_090_sp_spawner)
)

(script static void test_squad_patrol_100
    (wake h100_loaded_bsps)
    (wake h100_100_sp_spawner)
)

(script dormant void h100_survival_mode_a
    (sound_class_set_gain "" 1.0 30)
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (sleep 5)
    (switch_zone_set "set_survival_a")
    (sleep 1)
    (h100_initialize_survival_a)
    (set string_survival_map_name "h100a")
    (set ai_obj_survival "obj_h100_survival_a")
    (set ai_sur_phantom_01 "sq_sur_a_phantom_01")
    (set ai_sur_phantom_02 "sq_sur_a_phantom_02")
    (set ai_sur_phantom_03 "sq_sur_a_phantom_03")
    (set ai_sur_phantom_04 none)
    (set s_sur_drop_side_01 "chute")
    (set s_sur_drop_side_02 "dual")
    (set s_sur_drop_side_03 "dual")
    (set s_sur_drop_side_04 "null")
    (set ai_sur_bonus_wave "sq_sur_a_bonus_round_01")
    (set ai_sur_bonus_phantom none)
    (set b_sur_bonus_round true)
    (set ai_sur_wave_spawns "gr_survival_a_waves")
    (set s_sur_wave_squad_count 5)
    (set ai_sur_remaining "sq_sur_remaining")
    (wake survival_mode)
    (if (survival_mode_scenario_extras_enable) 
        (begin
            (wake survival_eng_spawn_a)
        )
    )
    (sleep 5)
)

(script static void h100_initialize_survival_a
    (pda_set_active_pda_definition "h100_survival_a")
    (zone_set_trigger_volume_enable "begin_zone_set:set_050_080:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_050_080:*" false)
    (object_destroy "sc_crater_door_01")
    (object_destroy "sc_crater_door_02")
    (object_destroy "sc_crater_door_03")
    (object_destroy "dm_l100_sec_door01")
    (object_destroy "sc_sur_door_01")
    (object_destroy "sc_sur_door_02")
    (object_destroy "sc_sur_door_03")
    (object_destroy "sc_sur_door_04")
    (object_destroy "sc_sur_door_05")
    (object_destroy "sc_sur_door_06")
    (object_destroy "arg_device_sc110_01")
    (object_destroy_folder "sc_bsp_050")
    (object_destroy_folder "cr_bsp_050")
    (object_destroy_folder "sc_l100_interior")
    (object_destroy_folder "cr_l100_interior")
    (object_destroy_folder "sc_l100_exterior")
    (object_destroy_folder "cr_l100_exterior")
    (sleep 15)
    (object_create_folder_anew "dm_survival_a")
    (object_create_folder_anew "cr_survival_crater")
    (object_create_folder_anew "sc_survival_crater")
    (object_create_anew "dm_sur_a_gate_01")
    (object_create_anew "dm_050_police_car_01")
    (object_create_anew "pod_dare")
    (device_group_set_immediate "dg_power_door_open_07" 0.0)
    (device_set_power "dm_survival_a_door08" 1.0)
    (device_set_power "dm_l100_door03" 0.0)
)

(script static void survival_a_refresh_follow
    (survival_refresh_sleep)
    (ai_reset_objective "obj_h100_survival_a/infantry_follow")
)

(script static void survival_a_hero_refresh_follow
    (survival_refresh_sleep)
    (survival_refresh_sleep)
    (ai_reset_objective "obj_h100_survival_a/hero_follow")
)

(script command_script void cs_sur_a_phantom_01
    (set v_sur_phantom_01 (ai_vehicle_get_from_spawn_point "sq_sur_a_phantom_01/phantom"))
    (sleep 1)
    (object_set_shadowless v_sur_phantom_01 true)
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_phantom_01/p0")
    (cs_fly_to_and_face "ps_sur_phantom_01/p1" "ps_sur_phantom_01/face" 1.0)
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_01/drop" "ps_sur_phantom_01/face" 1.0)
    (f_unload_phantom v_sur_phantom_01 "chute")
    (sleep 60)
    (cs_fly_to_and_face "ps_sur_phantom_01/p1" "ps_sur_phantom_01/face" 1.0)
    (cs_fly_by "ps_sur_phantom_01/p2")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_sur_phantom_01/p3")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_01/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_a_phantom_02
    (set v_sur_phantom_02 (ai_vehicle_get_from_spawn_point "sq_sur_a_phantom_02/phantom"))
    (sleep 1)
    (object_set_shadowless v_sur_phantom_02 true)
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_phantom_02/p0")
    (cs_fly_by "ps_sur_phantom_02/p1")
    (cs_fly_to_and_face "ps_sur_phantom_02/p2" "ps_sur_phantom_02/face" 1.0)
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_02/drop" "ps_sur_phantom_02/face" 1.0)
    (f_unload_phantom v_sur_phantom_02 "dual")
    (sleep 60)
    (cs_fly_to_and_face "ps_sur_phantom_02/p2" "ps_sur_phantom_02/face" 1.0)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "ps_sur_phantom_02/p1")
    (cs_vehicle_speed 1.0)
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_02/p0")
    (cs_fly_by "ps_sur_phantom_02/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_a_phantom_03
    (set v_sur_phantom_03 (ai_vehicle_get_from_spawn_point "sq_sur_a_phantom_03/phantom"))
    (sleep 1)
    (object_set_shadowless v_sur_phantom_03 true)
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_phantom_03/p1")
    (cs_fly_by "ps_sur_phantom_03/p2")
    (cs_fly_by "ps_sur_phantom_03/p3")
    (cs_fly_by "ps_sur_phantom_03/p4")
    (cs_fly_to_and_face "ps_sur_phantom_03/p5" "ps_sur_phantom_03/face" 1.0)
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "ps_sur_phantom_03/drop" "ps_sur_phantom_03/face" 1.0)
    (f_unload_phantom v_sur_phantom_03 "dual")
    (sleep 60)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_sur_phantom_03/p6" "ps_sur_phantom_03/face" 1.0)
    (cs_fly_by "ps_sur_phantom_03/p2")
    (cs_fly_by "ps_sur_phantom_03/p1")
    (cs_vehicle_boost true)
    (cs_fly_by "ps_sur_phantom_03/p0")
    (cs_fly_by "ps_sur_phantom_03/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_a_engineer01
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_a_engineer/eng01_01")
    (cs_fly_by "ps_sur_a_engineer/eng01_02")
    (cs_fly_by "ps_sur_a_engineer/eng01_03")
)

(script command_script void cs_sur_a_engineer02
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_a_engineer/eng02_01")
    (cs_fly_by "ps_sur_a_engineer/eng02_02")
    (cs_fly_by "ps_sur_a_engineer/eng02_03")
)

(script command_script void cs_sur_a_engineer03
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_a_engineer/eng03_01")
    (cs_fly_by "ps_sur_a_engineer/eng03_02")
)

(script command_script void cs_sur_a_engineer04
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_a_engineer/eng04_01")
    (cs_fly_by "ps_sur_a_engineer/eng04_02")
    (cs_fly_by "ps_sur_a_engineer/eng04_03")
)

(script dormant void survival_eng_spawn_a
    (sleep (* 30.0 60.0 2.0))
    (sleep_until 
        (begin
            (sleep (* 30.0 60.0 1.0))
            (sleep_until (>= (ai_living_count "gr_survival_all") 7))
            (cond
                ((<= (game_coop_player_count) 2)
                    (ai_place "sq_sur_a_engineer" 1)
                )
                ((>= (game_coop_player_count) 3)
                    (ai_place "sq_sur_a_engineer" 2)
                )
            )
            (sleep 1)
            (sleep_until (<= (ai_living_count "sq_sur_a_engineer") 0))
            false
        )
    )
)

(script dormant void h100_survival_mode_b
    (sound_class_set_gain "" 1.0 30)
    (if (> (player_count) 0) 
        (cinematic_snap_to_black))
    (sleep 5)
    (switch_zone_set "set_survival_b")
    (h100_initialize_survival_b)
    (set string_survival_map_name "h100b")
    (set ai_obj_survival "obj_h100_survival_b")
    (set ai_sur_phantom_01 "sq_sur_b_phantom_01")
    (set ai_sur_phantom_02 "sq_sur_b_phantom_02")
    (set ai_sur_phantom_03 "sq_sur_b_phantom_03")
    (set ai_sur_phantom_04 none)
    (set s_sur_drop_side_01 "dual")
    (set s_sur_drop_side_02 "dual")
    (set s_sur_drop_side_03 "dual")
    (set s_sur_drop_side_04 "null")
    (set ai_sur_bonus_wave "sq_sur_b_bonus_round_01")
    (set ai_sur_bonus_phantom none)
    (set b_sur_bonus_round true)
    (set ai_sur_wave_spawns "gr_survival_b_waves")
    (set s_sur_wave_squad_count 5)
    (set ai_sur_remaining "sq_sur_b_remaining")
    (wake survival_mode)
    (if (survival_mode_scenario_extras_enable) 
        (begin
            (wake survival_eng_spawn_b)
        )
    )
    (sleep 5)
)

(script static void survival_b_refresh_follow
    (survival_refresh_sleep)
    (ai_reset_objective "obj_h100_survival_b/infantry_follow")
)

(script static void survival_b_hero_refresh_follow
    (survival_refresh_sleep)
    (survival_refresh_sleep)
    (ai_reset_objective "obj_h100_survival_b/hero_follow")
)

(script command_script void cs_survival_b_wraith
    (set v_sur_b_wraith (ai_vehicle_get_from_spawn_point "sq_sur_b_wraith_01/driver"))
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (sleep_until (!= (ai_living_count "sq_sur_b_wraith_01") 2) 1)
    (if (= (ai_living_count "sq_sur_b_wraith_01/driver") 0) 
        (ai_vehicle_reserve_seat (ai_vehicle_get_from_spawn_point "sq_sur_b_wraith_01/driver") wraith_d true) (ai_vehicle_reserve_seat (ai_vehicle_get_from_spawn_point "sq_sur_b_wraith_01/gunner") wraith_g true))
    (sleep_until (< (ai_living_count "sq_sur_b_wraith_01") 1) 1)
    (if (= (ai_living_count "sq_sur_b_wraith_01/driver") 0) 
        (ai_vehicle_reserve_seat (ai_vehicle_get_from_spawn_point "sq_sur_b_wraith_01/driver") wraith_d true) (ai_vehicle_reserve_seat (ai_vehicle_get_from_spawn_point "sq_sur_b_wraith_01/gunner") wraith_g true))
)

(script static void h100_initialize_survival_b
    (if debug 
        (print "survival b setup"))
    (pda_set_active_pda_definition "h100_survival_b")
    (zone_set_trigger_volume_enable "begin_zone_set:set_040_100:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_040_100:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_060_100:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_060_100:*" false)
    (zone_set_trigger_volume_enable "begin_zone_set:set_100_oni:*" false)
    (zone_set_trigger_volume_enable "zone_set:set_100_oni:*" false)
    (object_destroy "dc_l150_sc130")
    (object_destroy "dm_cache_02a")
    (object_destroy "arg_device_sc130_04")
    (object_destroy "sc_open_door_sign_14")
    (object_destroy "sc_open_door_sign_15")
    (object_destroy_folder "sc_bsp_100")
    (object_destroy_folder "cr_bsp_100")
    (sleep 15)
    (object_create_folder_anew "dm_bsp_100")
    (object_create_folder_anew "dm_survival_b")
    (object_create_folder_anew "cr_survival_rally")
    (object_create_anew "sc_closed_door_sign_04")
    (object_create_anew "sc_closed_door_sign_16")
    (set folder_survival_scenery "sc_survival_b")
    (set folder_survival_crates "cr_survival_b")
    (set folder_survival_vehicles "v_survival_b")
    (set folder_survival_equipment "eq_survival_b")
    (device_set_power "dm_security_door_open_04" 0.0)
    (device_set_power "dm_security_door_open_16" 0.0)
    (device_set_power "dm_security_door_open_18" 0.0)
    (device_set_power "dm_door_survival_01" 1.0)
    (device_set_power "dm_door_survival_02" 1.0)
    (device_set_power "dm_door_survival_03" 1.0)
    (device_set_power "dm_door_survival_04" 1.0)
    (device_set_power "dm_door_survival_05" 1.0)
    (device_set_power "dm_door_survival_06" 1.0)
    (object_set_vision_mode_render_default "dm_security_door_open_04" true)
    (object_set_vision_mode_render_default "dm_security_door_open_16" true)
    (object_set_vision_mode_render_default "dm_security_door_open_18" true)
)

(script command_script void cs_sur_b_phantom_01
    (set v_sur_phantom_01 (ai_vehicle_get_from_starting_location "sq_sur_b_phantom_01/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_b_phantom_01/phantom" true)
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

(script command_script void cs_sur_b_phantom_02
    (set v_sur_phantom_02 (ai_vehicle_get_from_starting_location "sq_sur_b_phantom_02/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_b_phantom_02/phantom" true)
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

(script command_script void cs_sur_b_phantom_03
    (set v_sur_phantom_03 (ai_vehicle_get_from_starting_location "sq_sur_b_phantom_03/phantom"))
    (sleep 1)
    (cs_enable_pathfinding_failsafe true)
    (object_set_shadowless "sq_sur_b_phantom_03/phantom" true)
    (if (survival_mode_scenario_extras_enable) 
        (if 
            (and
                (!= (random_range 0 5) 0)
                (<= (object_get_health v_sur_b_wraith) 0.0)
            ) 
                (f_load_phantom_cargo v_sur_phantom_03 "single" "sq_sur_b_wraith_01" none))
    )
    (cs_fly_by "sur_phantom03_pts/p0")
    (cs_fly_by "sur_phantom03_pts/p1")
    (cs_vehicle_speed 0.75)
    (cs_fly_to_and_face "sur_phantom03_pts/p2" "sur_phantom03_pts/face" 1.0)
    (cs_fly_to_and_face "sur_phantom03_pts/drop" "sur_phantom03_pts/face" 1.0)
    (f_unload_phantom_cargo v_sur_phantom_03 "single")
    (f_unload_phantom v_sur_phantom_03 "dual")
    (sleep 15)
    (cs_vehicle_speed 0.75)
    (cs_fly_by "sur_phantom03_pts/p2")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "sur_phantom03_pts/p3")
    (cs_vehicle_boost true)
    (cs_fly_by "sur_phantom03_pts/erase" 10.0)
    (ai_erase ai_current_squad)
)

(script command_script void cs_sur_b_engineer01
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_b_engineer/eng1_00")
    (cs_fly_by "ps_sur_b_engineer/eng1_01")
)

(script command_script void cs_sur_b_engineer02
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_b_engineer/eng2_00")
    (cs_fly_by "ps_sur_b_engineer/eng2_01")
)

(script command_script void cs_sur_b_engineer03
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_b_engineer/eng3_00")
    (cs_fly_by "ps_sur_b_engineer/eng3_01")
)

(script command_script void cs_sur_b_engineer04
    (cs_enable_pathfinding_failsafe true)
    (cs_fly_by "ps_sur_b_engineer/eng4_00")
    (cs_fly_by "ps_sur_b_engineer/eng4_01")
)

(script dormant void survival_eng_spawn_b
    (sleep (* 30.0 60.0 2.0))
    (sleep_until 
        (begin
            (sleep (* 30.0 60.0 1.0))
            (sleep_until (>= (ai_living_count "gr_survival_all") 7))
            (cond
                ((<= (game_coop_player_count) 2)
                    (ai_place "sq_sur_b_engineer" 1)
                )
                ((>= (game_coop_player_count) 3)
                    (ai_place "sq_sur_b_engineer" 2)
                )
            )
            (sleep 1)
            (sleep_until (<= (ai_living_count "sq_sur_b_engineer") 0))
            false
        )
    )
)

(script static void test_bugger_spawn
    (survival_kill_volumes_off)
    (device_set_power "dm_door_survival_01" 1.0)
    (device_set_power "dm_door_survival_02" 1.0)
    (device_set_power "dm_door_survival_03" 1.0)
    (device_set_power "dm_door_survival_04" 1.0)
    (device_set_power "dm_door_survival_05" 1.0)
    (device_set_power "dm_door_survival_06" 1.0)
    (object_destroy "dm_cache_02a")
    (object_create_folder_anew "dm_survival_b")
)

(script static boolean f_pda_beacon_selected (short player_short, cutscene_flag beacon_flag)
    (pda_beacon_is_selected (player_get player_short) beacon_flag)
)

(script static void f_arg_element_activate (object arg_device, device_group arg_device_power, device_group arg_device_position)
    (if debug 
        (print "** activating arg element **"))
    (object_set_vision_mode_render_default arg_device false)
    (device_group_set_immediate arg_device_power 1.0)
    (device_group_set_immediate arg_device_position 1.0)
)

(script static void f_arg_element_deactivate (object arg_device, device_group arg_device_power, device_group arg_device_position)
    (if debug 
        (print "** deactivating arg element **"))
    (object_set_vision_mode_render_default arg_device true)
    (device_group_set_immediate arg_device_power 0.0)
    (device_group_set_immediate arg_device_position 0.0)
)

(script dormant void h100_arg_fixup
    (sleep_until 
        (begin
            (sleep_until (game_reverted) 1)
            (if debug 
                (print "*** arg is being fixed up ***"))
            (initialize_arg)
            false
        ) 
    1)
)

(script static void initialize_arg
    (gp_integer_set "gp_arg_index" (h100_arg_completed_short))
    (sleep 1)
    (if 
        (or
            (>= (h100_scenes_completed_short) 1)
            (gp_boolean_get "gp_h100_from_mainmenu")
        ) 
            (begin
                (if (not (gp_boolean_get "gp_sc110_terminal_01_complete")) 
                    (f_arg_element_activate "arg_device_sc110_01" "dg_arg_sc110_power_01" "dg_arg_sc110_position_01") (f_arg_element_deactivate "arg_device_sc110_01" "dg_arg_sc110_power_01" "dg_arg_sc110_position_01"))
                (if (not (gp_boolean_get "gp_sc110_terminal_02_complete")) 
                    (f_arg_element_activate "arg_device_sc110_02" "dg_arg_sc110_power_02" "dg_arg_sc110_position_02") (f_arg_element_deactivate "arg_device_sc110_02" "dg_arg_sc110_power_02" "dg_arg_sc110_position_02"))
                (if (not (gp_boolean_get "gp_sc110_terminal_03_complete")) 
                    (f_arg_element_activate "arg_device_sc110_03" "dg_arg_sc110_power_03" "dg_arg_sc110_position_03") (f_arg_element_deactivate "arg_device_sc110_03" "dg_arg_sc110_power_03" "dg_arg_sc110_position_03"))
                (if (not (gp_boolean_get "gp_sc110_terminal_04_complete")) 
                    (f_arg_element_activate "arg_device_sc110_04" "dg_arg_sc110_power_04" "dg_arg_sc110_position_04") (f_arg_element_deactivate "arg_device_sc110_04" "dg_arg_sc110_power_04" "dg_arg_sc110_position_04"))
                (if (not (gp_boolean_get "gp_sc110_terminal_05_complete")) 
                    (f_arg_element_activate "arg_device_sc110_05" "dg_arg_sc110_power_05" "dg_arg_sc110_position_05") (f_arg_element_deactivate "arg_device_sc110_05" "dg_arg_sc110_power_05" "dg_arg_sc110_position_05"))
                (if (not (gp_boolean_get "gp_sc110_terminal_06_complete")) 
                    (f_arg_element_activate "arg_device_sc110_06" "dg_arg_sc110_power_06" "dg_arg_sc110_position_06") (f_arg_element_deactivate "arg_device_sc110_06" "dg_arg_sc110_power_06" "dg_arg_sc110_position_06"))
                (if (not (gp_boolean_get "gp_sc120_terminal_01_complete")) 
                    (f_arg_element_activate "arg_device_sc120_01" "dg_arg_sc120_power_01" "dg_arg_sc120_position_01") (f_arg_element_deactivate "arg_device_sc120_01" "dg_arg_sc120_power_01" "dg_arg_sc120_position_01"))
            )
    )
    (sleep 1)
    (if 
        (or
            (>= (h100_scenes_completed_short) 2)
            (gp_boolean_get "gp_h100_from_mainmenu")
        ) 
            (begin
                (if (not (gp_boolean_get "gp_sc120_terminal_02_complete")) 
                    (f_arg_element_activate "arg_device_sc120_02" "dg_arg_sc120_power_02" "dg_arg_sc120_position_02") (f_arg_element_deactivate "arg_device_sc120_02" "dg_arg_sc120_power_02" "dg_arg_sc120_position_02"))
                (if (not (gp_boolean_get "gp_sc120_terminal_03_complete")) 
                    (f_arg_element_activate "arg_device_sc120_03" "dg_arg_sc120_power_03" "dg_arg_sc120_position_03") (f_arg_element_deactivate "arg_device_sc120_03" "dg_arg_sc120_power_03" "dg_arg_sc120_position_03"))
                (if (not (gp_boolean_get "gp_sc120_terminal_04_complete")) 
                    (f_arg_element_activate "arg_device_sc120_04" "dg_arg_sc120_power_04" "dg_arg_sc120_position_04") (f_arg_element_deactivate "arg_device_sc120_04" "dg_arg_sc120_power_04" "dg_arg_sc120_position_04"))
                (if (not (gp_boolean_get "gp_sc120_terminal_05_complete")) 
                    (f_arg_element_activate "arg_device_sc120_05" "dg_arg_sc120_power_05" "dg_arg_sc120_position_05") (f_arg_element_deactivate "arg_device_sc120_05" "dg_arg_sc120_power_05" "dg_arg_sc120_position_05"))
                (if (not (gp_boolean_get "gp_sc130_terminal_01_complete")) 
                    (f_arg_element_activate "arg_device_sc130_01" "dg_arg_sc130_power_01" "dg_arg_sc130_position_01") (f_arg_element_deactivate "arg_device_sc130_01" "dg_arg_sc130_power_01" "dg_arg_sc130_position_01"))
                (if (not (gp_boolean_get "gp_sc130_terminal_02_complete")) 
                    (f_arg_element_activate "arg_device_sc130_02" "dg_arg_sc130_power_02" "dg_arg_sc130_position_02") (f_arg_element_deactivate "arg_device_sc130_02" "dg_arg_sc130_power_02" "dg_arg_sc130_position_02"))
                (if (not (gp_boolean_get "gp_sc130_terminal_03_complete")) 
                    (f_arg_element_activate "arg_device_sc130_03" "dg_arg_sc130_power_03" "dg_arg_sc130_position_03") (f_arg_element_deactivate "arg_device_sc130_03" "dg_arg_sc130_power_03" "dg_arg_sc130_position_03"))
                (if (not (gp_boolean_get "gp_sc130_terminal_05_complete")) 
                    (f_arg_element_activate "arg_device_sc130_05" "dg_arg_sc130_power_05" "dg_arg_sc130_position_05") (f_arg_element_deactivate "arg_device_sc130_05" "dg_arg_sc130_power_05" "dg_arg_sc130_position_05"))
                (if (not (gp_boolean_get "gp_sc140_terminal_03_complete")) 
                    (f_arg_element_activate "arg_device_sc140_03" "dg_arg_sc140_power_03" "dg_arg_sc140_position_03") (f_arg_element_deactivate "arg_device_sc140_03" "dg_arg_sc140_power_03" "dg_arg_sc140_position_03"))
                (if (not (gp_boolean_get "gp_sc140_terminal_04_complete")) 
                    (f_arg_element_activate "arg_device_sc140_04" "dg_arg_sc140_power_04" "dg_arg_sc140_position_04") (f_arg_element_deactivate "arg_device_sc140_04" "dg_arg_sc140_power_04" "dg_arg_sc140_position_04"))
                (if (not (gp_boolean_get "gp_sc150_terminal_02_complete")) 
                    (f_arg_element_activate "arg_device_sc150_02" "dg_arg_sc150_power_02" "dg_arg_sc150_position_02") (f_arg_element_deactivate "arg_device_sc150_02" "dg_arg_sc150_power_02" "dg_arg_sc150_position_02"))
                (if (not (gp_boolean_get "gp_sc150_terminal_03_complete")) 
                    (f_arg_element_activate "arg_device_sc150_03" "dg_arg_sc150_power_03" "dg_arg_sc150_position_03") (f_arg_element_deactivate "arg_device_sc150_03" "dg_arg_sc150_power_03" "dg_arg_sc150_position_03"))
                (if (not (gp_boolean_get "gp_sc150_terminal_05_complete")) 
                    (f_arg_element_activate "arg_device_sc150_05" "dg_arg_sc150_power_05" "dg_arg_sc150_position_05") (f_arg_element_deactivate "arg_device_sc150_05" "dg_arg_sc150_power_05" "dg_arg_sc150_position_05"))
            )
    )
    (sleep 1)
    (if 
        (or
            (>= (h100_scenes_completed_short) 3)
            (gp_boolean_get "gp_h100_from_mainmenu")
        ) 
            (begin
                (if (not (gp_boolean_get "gp_sc120_terminal_06_complete")) 
                    (f_arg_element_activate "arg_device_sc120_06" "dg_arg_sc120_power_06" "dg_arg_sc120_position_06") (f_arg_element_deactivate "arg_device_sc120_06" "dg_arg_sc120_power_06" "dg_arg_sc120_position_06"))
                (if (not (gp_boolean_get "gp_sc130_terminal_04_complete")) 
                    (f_arg_element_activate "arg_device_sc130_04" "dg_arg_sc130_power_04" "dg_arg_sc130_position_04") (f_arg_element_deactivate "arg_device_sc130_04" "dg_arg_sc130_power_04" "dg_arg_sc130_position_04"))
                (if (not (gp_boolean_get "gp_sc130_terminal_06_complete")) 
                    (f_arg_element_activate "arg_device_sc130_06" "dg_arg_sc130_power_06" "dg_arg_sc130_position_06") (f_arg_element_deactivate "arg_device_sc130_06" "dg_arg_sc130_power_06" "dg_arg_sc130_position_06"))
                (if (not (gp_boolean_get "gp_sc140_terminal_01_complete")) 
                    (f_arg_element_activate "arg_device_sc140_01" "dg_arg_sc140_power_01" "dg_arg_sc140_position_01") (f_arg_element_deactivate "arg_device_sc140_01" "dg_arg_sc140_power_01" "dg_arg_sc140_position_01"))
                (if (not (gp_boolean_get "gp_sc140_terminal_02_complete")) 
                    (f_arg_element_activate "arg_device_sc140_02" "dg_arg_sc140_power_02" "dg_arg_sc140_position_02") (f_arg_element_deactivate "arg_device_sc140_02" "dg_arg_sc140_power_02" "dg_arg_sc140_position_02"))
                (if (not (gp_boolean_get "gp_sc140_terminal_05_complete")) 
                    (f_arg_element_activate "arg_device_sc140_05" "dg_arg_sc140_power_05" "dg_arg_sc140_position_05") (f_arg_element_deactivate "arg_device_sc140_05" "dg_arg_sc140_power_05" "dg_arg_sc140_position_05"))
                (if (not (gp_boolean_get "gp_sc140_terminal_06_complete")) 
                    (f_arg_element_activate "arg_device_sc140_06" "dg_arg_sc140_power_06" "dg_arg_sc140_position_06") (f_arg_element_deactivate "arg_device_sc140_06" "dg_arg_sc140_power_06" "dg_arg_sc140_position_06"))
                (if (not (gp_boolean_get "gp_sc150_terminal_01_complete")) 
                    (f_arg_element_activate "arg_device_sc150_01" "dg_arg_sc150_power_01" "dg_arg_sc150_position_01") (f_arg_element_deactivate "arg_device_sc150_01" "dg_arg_sc150_power_01" "dg_arg_sc150_position_01"))
                (if (not (gp_boolean_get "gp_sc150_terminal_04_complete")) 
                    (f_arg_element_activate "arg_device_sc150_04" "dg_arg_sc150_power_04" "dg_arg_sc150_position_04") (f_arg_element_deactivate "arg_device_sc150_04" "dg_arg_sc150_power_04" "dg_arg_sc150_position_04"))
            )
    )
    (sleep 1)
    (h100_unlock_supply_cache)
)

(script static void arg_sc110_01_tap
    (if debug 
        (print "arg sc110 tap..."))
    (f_arg_accessed "dg_arg_sc110_power_01" "dg_arg_sc110_position_01" "gp_sc110_terminal_01_complete" "arg_device_sc110_01" "arg_device_sc110_01")
    (h100_arg_access_completed)
)

(script static void arg_sc110_01_hold
    (if debug 
        (print "arg sc110 hold..."))
    (f_arg_accessed "dg_arg_sc110_power_01" "dg_arg_sc110_position_01" "gp_sc110_terminal_01_complete" "arg_device_sc110_01" "arg_device_sc110_01")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc110_02_tap
    (if debug 
        (print "arg sc110 tap..."))
    (f_arg_accessed "dg_arg_sc110_power_02" "dg_arg_sc110_position_02" "gp_sc110_terminal_02_complete" "arg_device_sc110_02" "arg_device_sc110_02")
    (h100_arg_access_completed)
)

(script static void arg_sc110_02_hold
    (if debug 
        (print "arg sc110 hold..."))
    (f_arg_accessed "dg_arg_sc110_power_02" "dg_arg_sc110_position_02" "gp_sc110_terminal_02_complete" "arg_device_sc110_02" "arg_device_sc110_02")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc110_03_tap
    (if debug 
        (print "arg sc110 tap..."))
    (f_arg_accessed "dg_arg_sc110_power_03" "dg_arg_sc110_position_03" "gp_sc110_terminal_03_complete" "arg_device_sc110_03" "arg_device_sc110_03")
    (h100_arg_access_completed)
)

(script static void arg_sc110_03_hold
    (if debug 
        (print "arg sc110 hold..."))
    (f_arg_accessed "dg_arg_sc110_power_03" "dg_arg_sc110_position_03" "gp_sc110_terminal_03_complete" "arg_device_sc110_03" "arg_device_sc110_03")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc110_04_tap
    (if debug 
        (print "arg sc110 tap..."))
    (f_arg_accessed "dg_arg_sc110_power_04" "dg_arg_sc110_position_04" "gp_sc110_terminal_04_complete" "arg_device_sc110_04" "arg_device_sc110_04")
    (h100_arg_access_completed)
)

(script static void arg_sc110_04_hold
    (if debug 
        (print "arg sc110 hold..."))
    (f_arg_accessed "dg_arg_sc110_power_04" "dg_arg_sc110_position_04" "gp_sc110_terminal_04_complete" "arg_device_sc110_04" "arg_device_sc110_04")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc110_05_tap
    (if debug 
        (print "arg sc110 tap..."))
    (f_arg_accessed "dg_arg_sc110_power_05" "dg_arg_sc110_position_05" "gp_sc110_terminal_05_complete" "arg_device_sc110_05" "arg_device_sc110_05")
    (h100_arg_access_completed)
)

(script static void arg_sc110_05_hold
    (if debug 
        (print "arg sc110 hold..."))
    (f_arg_accessed "dg_arg_sc110_power_05" "dg_arg_sc110_position_05" "gp_sc110_terminal_05_complete" "arg_device_sc110_05" "arg_device_sc110_05")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc110_06_tap
    (if debug 
        (print "arg sc110 tap..."))
    (f_arg_accessed "dg_arg_sc110_power_06" "dg_arg_sc110_position_06" "gp_sc110_terminal_06_complete" "arg_device_sc110_06" "arg_device_sc110_06")
    (h100_arg_access_completed)
)

(script static void arg_sc110_06_hold
    (if debug 
        (print "arg sc110 hold..."))
    (f_arg_accessed "dg_arg_sc110_power_06" "dg_arg_sc110_position_06" "gp_sc110_terminal_06_complete" "arg_device_sc110_06" "arg_device_sc110_06")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc120_01_tap
    (if debug 
        (print "arg sc120 tap..."))
    (f_arg_accessed "dg_arg_sc120_power_01" "dg_arg_sc120_position_01" "gp_sc120_terminal_01_complete" "arg_device_sc120_01" "arg_device_sc120_01")
    (h100_arg_access_completed)
)

(script static void arg_sc120_01_hold
    (if debug 
        (print "arg sc120 hold..."))
    (f_arg_accessed "dg_arg_sc120_power_01" "dg_arg_sc120_position_01" "gp_sc120_terminal_01_complete" "arg_device_sc120_01" "arg_device_sc120_01")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc120_02_tap
    (if debug 
        (print "arg sc120 tap..."))
    (f_arg_accessed "dg_arg_sc120_power_02" "dg_arg_sc120_position_02" "gp_sc120_terminal_02_complete" "arg_device_sc120_02" "arg_device_sc120_02")
    (h100_arg_access_completed)
)

(script static void arg_sc120_02_hold
    (if debug 
        (print "arg sc120 hold..."))
    (f_arg_accessed "dg_arg_sc120_power_02" "dg_arg_sc120_position_02" "gp_sc120_terminal_02_complete" "arg_device_sc120_02" "arg_device_sc120_02")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc120_03_tap
    (if debug 
        (print "arg sc120 tap..."))
    (f_arg_accessed "dg_arg_sc120_power_03" "dg_arg_sc120_position_03" "gp_sc120_terminal_03_complete" "arg_device_sc120_03" "arg_device_sc120_03")
    (h100_arg_access_completed)
)

(script static void arg_sc120_03_hold
    (if debug 
        (print "arg sc120 hold..."))
    (f_arg_accessed "dg_arg_sc120_power_03" "dg_arg_sc120_position_03" "gp_sc120_terminal_03_complete" "arg_device_sc120_03" "arg_device_sc120_03")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc120_04_tap
    (if debug 
        (print "arg sc120 tap..."))
    (f_arg_accessed "dg_arg_sc120_power_04" "dg_arg_sc120_position_04" "gp_sc120_terminal_04_complete" "arg_device_sc120_04" "arg_device_sc120_04")
    (h100_arg_access_completed)
)

(script static void arg_sc120_04_hold
    (if debug 
        (print "arg sc120 hold..."))
    (f_arg_accessed "dg_arg_sc120_power_04" "dg_arg_sc120_position_04" "gp_sc120_terminal_04_complete" "arg_device_sc120_04" "arg_device_sc120_04")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc120_05_tap
    (if debug 
        (print "arg sc120 tap..."))
    (f_arg_accessed "dg_arg_sc120_power_05" "dg_arg_sc120_position_05" "gp_sc120_terminal_05_complete" "arg_device_sc120_05" "arg_device_sc120_05")
    (h100_arg_access_completed)
)

(script static void arg_sc120_05_hold
    (if debug 
        (print "arg sc120 hold..."))
    (f_arg_accessed "dg_arg_sc120_power_05" "dg_arg_sc120_position_05" "gp_sc120_terminal_05_complete" "arg_device_sc120_05" "arg_device_sc120_05")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc120_06_tap
    (if debug 
        (print "arg sc120 tap..."))
    (f_arg_accessed "dg_arg_sc120_power_06" "dg_arg_sc120_position_06" "gp_sc120_terminal_06_complete" "arg_device_sc120_06" "arg_device_sc120_06")
    (h100_arg_access_completed)
)

(script static void arg_sc120_06_hold
    (if debug 
        (print "arg sc120 hold..."))
    (f_arg_accessed "dg_arg_sc120_power_06" "dg_arg_sc120_position_06" "gp_sc120_terminal_06_complete" "arg_device_sc120_06" "arg_device_sc120_06")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc130_01_tap
    (if debug 
        (print "arg sc130 tap..."))
    (f_arg_accessed "dg_arg_sc130_power_01" "dg_arg_sc130_position_01" "gp_sc130_terminal_01_complete" "arg_device_sc130_01" "arg_device_sc130_01")
    (h100_arg_access_completed)
)

(script static void arg_sc130_01_hold
    (if debug 
        (print "arg sc130 hold..."))
    (f_arg_accessed "dg_arg_sc130_power_01" "dg_arg_sc130_position_01" "gp_sc130_terminal_01_complete" "arg_device_sc130_01" "arg_device_sc130_01")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc130_02_tap
    (if debug 
        (print "arg sc130 tap..."))
    (f_arg_accessed "dg_arg_sc130_power_02" "dg_arg_sc130_position_02" "gp_sc130_terminal_02_complete" "arg_device_sc130_02" "arg_device_sc130_02")
    (h100_arg_access_completed)
)

(script static void arg_sc130_02_hold
    (if debug 
        (print "arg sc130 hold..."))
    (f_arg_accessed "dg_arg_sc130_power_02" "dg_arg_sc130_position_02" "gp_sc130_terminal_02_complete" "arg_device_sc130_02" "arg_device_sc130_02")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc130_03_tap
    (if debug 
        (print "arg sc130 tap..."))
    (f_arg_accessed "dg_arg_sc130_power_03" "dg_arg_sc130_position_03" "gp_sc130_terminal_03_complete" "arg_device_sc130_03" "arg_device_sc130_03")
    (h100_arg_access_completed)
)

(script static void arg_sc130_03_hold
    (if debug 
        (print "arg sc130 hold..."))
    (f_arg_accessed "dg_arg_sc130_power_03" "dg_arg_sc130_position_03" "gp_sc130_terminal_03_complete" "arg_device_sc130_03" "arg_device_sc130_03")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc130_04_tap
    (if debug 
        (print "arg sc130 tap..."))
    (f_arg_accessed "dg_arg_sc130_power_04" "dg_arg_sc130_position_04" "gp_sc130_terminal_04_complete" "arg_device_sc130_04" "arg_device_sc130_04")
    (h100_arg_access_completed)
)

(script static void arg_sc130_04_hold
    (if debug 
        (print "arg sc130 hold..."))
    (f_arg_accessed "dg_arg_sc130_power_04" "dg_arg_sc130_position_04" "gp_sc130_terminal_04_complete" "arg_device_sc130_04" "arg_device_sc130_04")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc130_05_tap
    (if debug 
        (print "arg sc130 tap..."))
    (f_arg_accessed "dg_arg_sc130_power_05" "dg_arg_sc130_position_05" "gp_sc130_terminal_05_complete" "arg_device_sc130_05" "arg_device_sc130_05")
    (h100_arg_access_completed)
)

(script static void arg_sc130_05_hold
    (if debug 
        (print "arg sc130 hold..."))
    (f_arg_accessed "dg_arg_sc130_power_05" "dg_arg_sc130_position_05" "gp_sc130_terminal_05_complete" "arg_device_sc130_05" "arg_device_sc130_05")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc130_06_tap
    (if debug 
        (print "arg sc130 tap..."))
    (f_arg_accessed "dg_arg_sc130_power_06" "dg_arg_sc130_position_06" "gp_sc130_terminal_06_complete" "arg_device_sc130_06" "arg_device_sc130_06")
    (h100_arg_access_completed)
)

(script static void arg_sc130_06_hold
    (if debug 
        (print "arg sc130 hold..."))
    (f_arg_accessed "dg_arg_sc130_power_06" "dg_arg_sc130_position_06" "gp_sc130_terminal_06_complete" "arg_device_sc130_06" "arg_device_sc130_06")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc140_01_tap
    (if debug 
        (print "arg sc140 tap..."))
    (f_arg_accessed "dg_arg_sc140_power_01" "dg_arg_sc140_position_01" "gp_sc140_terminal_01_complete" "arg_device_sc140_01" "arg_device_sc140_01")
    (h100_arg_access_completed)
)

(script static void arg_sc140_01_hold
    (if debug 
        (print "arg sc140 hold..."))
    (f_arg_accessed "dg_arg_sc140_power_01" "dg_arg_sc140_position_01" "gp_sc140_terminal_01_complete" "arg_device_sc140_01" "arg_device_sc140_01")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc140_02_tap
    (if debug 
        (print "arg sc140 tap..."))
    (f_arg_accessed "dg_arg_sc140_power_02" "dg_arg_sc140_position_02" "gp_sc140_terminal_02_complete" "arg_device_sc140_02" "arg_device_sc140_02")
    (h100_arg_access_completed)
)

(script static void arg_sc140_02_hold
    (if debug 
        (print "arg sc140 hold..."))
    (f_arg_accessed "dg_arg_sc140_power_02" "dg_arg_sc140_position_02" "gp_sc140_terminal_02_complete" "arg_device_sc140_02" "arg_device_sc140_02")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc140_03_tap
    (if debug 
        (print "arg sc140 tap..."))
    (f_arg_accessed "dg_arg_sc140_power_03" "dg_arg_sc140_position_03" "gp_sc140_terminal_03_complete" "arg_device_sc140_03" "arg_device_sc140_03")
    (h100_arg_access_completed)
)

(script static void arg_sc140_03_hold
    (if debug 
        (print "arg sc140 hold..."))
    (f_arg_accessed "dg_arg_sc140_power_03" "dg_arg_sc140_position_03" "gp_sc140_terminal_03_complete" "arg_device_sc140_03" "arg_device_sc140_03")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc140_04_tap
    (if debug 
        (print "arg sc140 tap..."))
    (f_arg_accessed "dg_arg_sc140_power_04" "dg_arg_sc140_position_04" "gp_sc140_terminal_04_complete" "arg_device_sc140_04" "arg_device_sc140_04")
    (h100_arg_access_completed)
)

(script static void arg_sc140_04_hold
    (if debug 
        (print "arg sc140 hold..."))
    (f_arg_accessed "dg_arg_sc140_power_04" "dg_arg_sc140_position_04" "gp_sc140_terminal_04_complete" "arg_device_sc140_04" "arg_device_sc140_04")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc140_05_tap
    (if debug 
        (print "arg sc140 tap..."))
    (f_arg_accessed "dg_arg_sc140_power_05" "dg_arg_sc140_position_05" "gp_sc140_terminal_05_complete" "arg_device_sc140_05" "arg_device_sc140_05")
    (h100_arg_access_completed)
)

(script static void arg_sc140_05_hold
    (if debug 
        (print "arg sc140 hold..."))
    (f_arg_accessed "dg_arg_sc140_power_05" "dg_arg_sc140_position_05" "gp_sc140_terminal_05_complete" "arg_device_sc140_05" "arg_device_sc140_05")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc140_06_tap
    (if debug 
        (print "arg sc140 tap..."))
    (f_arg_accessed "dg_arg_sc140_power_06" "dg_arg_sc140_position_06" "gp_sc140_terminal_06_complete" "arg_device_sc140_06" "arg_device_sc140_06")
    (h100_arg_access_completed)
)

(script static void arg_sc140_06_hold
    (if debug 
        (print "arg sc140 hold..."))
    (f_arg_accessed "dg_arg_sc140_power_06" "dg_arg_sc140_position_06" "gp_sc140_terminal_06_complete" "arg_device_sc140_06" "arg_device_sc140_06")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc150_01_tap
    (if debug 
        (print "arg sc150 tap..."))
    (f_arg_accessed "dg_arg_sc150_power_01" "dg_arg_sc150_position_01" "gp_sc150_terminal_01_complete" "arg_device_sc150_01" "arg_device_sc150_01")
    (h100_arg_access_completed)
)

(script static void arg_sc150_01_hold
    (if debug 
        (print "arg sc150 hold..."))
    (f_arg_accessed "dg_arg_sc150_power_01" "dg_arg_sc150_position_01" "gp_sc150_terminal_01_complete" "arg_device_sc150_01" "arg_device_sc150_01")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc150_02_tap
    (if debug 
        (print "arg sc150 tap..."))
    (f_arg_accessed "dg_arg_sc150_power_02" "dg_arg_sc150_position_02" "gp_sc150_terminal_02_complete" "arg_device_sc150_02" "arg_device_sc150_02")
    (h100_arg_access_completed)
)

(script static void arg_sc150_02_hold
    (if debug 
        (print "arg sc150 hold..."))
    (f_arg_accessed "dg_arg_sc150_power_02" "dg_arg_sc150_position_02" "gp_sc150_terminal_02_complete" "arg_device_sc150_02" "arg_device_sc150_02")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc150_03_tap
    (if debug 
        (print "arg sc150 tap..."))
    (f_arg_accessed "dg_arg_sc150_power_03" "dg_arg_sc150_position_03" "gp_sc150_terminal_03_complete" "arg_device_sc150_03" "arg_device_sc150_03")
    (h100_arg_access_completed)
)

(script static void arg_sc150_03_hold
    (if debug 
        (print "arg sc150 hold..."))
    (f_arg_accessed "dg_arg_sc150_power_03" "dg_arg_sc150_position_03" "gp_sc150_terminal_03_complete" "arg_device_sc150_03" "arg_device_sc150_03")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc150_04_tap
    (if debug 
        (print "arg sc150 tap..."))
    (f_arg_accessed "dg_arg_sc150_power_04" "dg_arg_sc150_position_04" "gp_sc150_terminal_04_complete" "arg_device_sc150_04" "arg_device_sc150_04")
    (h100_arg_access_completed)
)

(script static void arg_sc150_04_hold
    (if debug 
        (print "arg sc150 hold..."))
    (f_arg_accessed "dg_arg_sc150_power_04" "dg_arg_sc150_position_04" "gp_sc150_terminal_04_complete" "arg_device_sc150_04" "arg_device_sc150_04")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void arg_sc150_05_tap
    (if debug 
        (print "arg sc150 tap..."))
    (f_arg_accessed "dg_arg_sc150_power_05" "dg_arg_sc150_position_05" "gp_sc150_terminal_05_complete" "arg_device_sc150_05" "arg_device_sc150_05")
    (h100_arg_access_completed)
)

(script static void arg_sc150_05_hold
    (if debug 
        (print "arg sc150 hold..."))
    (f_arg_accessed "dg_arg_sc150_power_05" "dg_arg_sc150_position_05" "gp_sc150_terminal_05_complete" "arg_device_sc150_05" "arg_device_sc150_05")
    (play_arg_element)
    (h100_arg_access_completed)
)

(script static void f_arg_accessed (device_group terminal_power, device_group terminal_position, string_id terminal_boolean, object_name arg_device_name, device arg_device)
    (if debug 
        (print "*** arg accessed ***"))
    (f_virgil_in player_00)
    (f_virgil_in player_01)
    (f_virgil_in player_02)
    (f_virgil_in player_03)
    (cinematic_set_chud_objective "comm_new_data")
    (sound_impulse_start "sound\game_sfx\ui\hud_ui\arg_pickup" none 1.0)
    (chud_display_pda_communications_message "pda_activate_comm" 0)
    (device_group_set_immediate terminal_power 0.0)
    (device_group_set_immediate terminal_position 0.0)
    (pda_activate_marker player arg_device_name "arg_waypoints" false)
    (gp_boolean_set terminal_boolean true)
    (sleep 1)
    (gp_integer_set "gp_arg_index" (h100_arg_completed_short))
    (sleep 1)
    (if 
        (and
            (= (gp_integer_get "gp_arg_index") 1)
            (not (gp_boolean_get "gp_tr_arg_complete"))
            (not (is_skull_secondary_enabled skull_blind))
        ) 
            (begin
                (wake l100_tr_player0_arg)
                (if (coop_players_2) 
                    (wake l100_tr_player1_arg))
                (if (coop_players_3) 
                    (wake l100_tr_player2_arg))
                (if (coop_players_4) 
                    (wake l100_tr_player3_arg))
            )
    )
    (achievement_post_chud_progression (player0) "_achievement_find_all_audio_logs" (gp_integer_get "gp_arg_index"))
    (if (>= (game_coop_player_count) 2) 
        (achievement_post_chud_progression (player1) "_achievement_find_all_audio_logs" (gp_integer_get "gp_arg_index")))
    (if (>= (game_coop_player_count) 3) 
        (achievement_post_chud_progression (player2) "_achievement_find_all_audio_logs" (gp_integer_get "gp_arg_index")))
    (if (>= (game_coop_player_count) 4) 
        (achievement_post_chud_progression (player3) "_achievement_find_all_audio_logs" (gp_integer_get "gp_arg_index")))
    (gp_notify_audio_log_accessed (h100_arg_completed_short))
    (object_set_vision_mode_render_default arg_device true)
    (cond
        ((device_arg_has_been_touched_by_unit arg_device (player0) 30)
            (set s_arg_player_id 0)
        )
        ((device_arg_has_been_touched_by_unit arg_device (player1) 30)
            (set s_arg_player_id 1)
        )
        ((device_arg_has_been_touched_by_unit arg_device (player2) 30)
            (set s_arg_player_id 2)
        )
        ((device_arg_has_been_touched_by_unit arg_device (player3) 30)
            (set s_arg_player_id 3)
        )
    )
    (sleep 1)
    (cond
        ((= (gp_integer_get "gp_arg_index") 1)
            (achievement_grant_to_all_players "_achievement_find_01_audio_logs")
        )
        ((= (gp_integer_get "gp_arg_index") 3)
            (achievement_grant_to_all_players "_achievement_find_03_audio_logs")
        )
        ((= (gp_integer_get "gp_arg_index") 15)
            (achievement_grant_to_all_players "_achievement_find_15_audio_logs")
        )
    )
)

(script static void h100_arg_access_completed
    (if debug 
        (print "*** arg completed ***"))
    (sleep 120)
    (cond
        ((= (gp_integer_get "gp_arg_index") 4)
            (wake h100_arg_supply_cache_01)
        )
        ((= (gp_integer_get "gp_arg_index") 8)
            (wake h100_arg_supply_cache_02)
        )
        ((= (gp_integer_get "gp_arg_index") 16)
            (wake h100_arg_supply_cache_03)
        )
        ((gp_boolean_get "gp_h100_from_mainmenu")
            (wake h100_arg_supply_cache_04)
        )
    )
    (game_save)
    (sleep 15)
    (chud_display_pda_communications_message "" 0)
    (chud_display_pda_minimap_message "" "fl_beacon_sc100")
)

(script static void play_arg_element
    (cond
        ((= s_arg_player_id 0)
            (f_play_arg_element player_00)
        )
        ((= s_arg_player_id 1)
            (f_play_arg_element player_01)
        )
        ((= s_arg_player_id 2)
            (f_play_arg_element player_02)
        )
        ((= s_arg_player_id 3)
            (f_play_arg_element player_03)
        )
    )
)

(script static void f_play_arg_element (short player_short)
    (if debug 
        (print "*** play arg sound file ***"))
    (cond
        ((= (gp_integer_get "gp_arg_index") 1)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_01")
        )
        ((= (gp_integer_get "gp_arg_index") 2)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_02")
        )
        ((= (gp_integer_get "gp_arg_index") 3)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_03")
        )
        ((= (gp_integer_get "gp_arg_index") 4)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_04")
        )
        ((= (gp_integer_get "gp_arg_index") 5)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_05")
        )
        ((= (gp_integer_get "gp_arg_index") 6)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_06")
        )
        ((= (gp_integer_get "gp_arg_index") 7)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_07")
        )
        ((= (gp_integer_get "gp_arg_index") 8)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_08")
        )
        ((= (gp_integer_get "gp_arg_index") 9)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_09")
        )
        ((= (gp_integer_get "gp_arg_index") 10)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_10")
        )
        ((= (gp_integer_get "gp_arg_index") 11)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_11")
        )
        ((= (gp_integer_get "gp_arg_index") 12)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_12")
        )
        ((= (gp_integer_get "gp_arg_index") 13)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_13")
        )
        ((= (gp_integer_get "gp_arg_index") 14)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_14")
        )
        ((= (gp_integer_get "gp_arg_index") 15)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_15")
        )
        ((= (gp_integer_get "gp_arg_index") 16)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_16")
        )
        ((= (gp_integer_get "gp_arg_index") 17)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_17")
        )
        ((= (gp_integer_get "gp_arg_index") 18)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_18")
        )
        ((= (gp_integer_get "gp_arg_index") 19)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_19")
        )
        ((= (gp_integer_get "gp_arg_index") 20)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_20")
        )
        ((= (gp_integer_get "gp_arg_index") 21)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_21")
        )
        ((= (gp_integer_get "gp_arg_index") 22)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_22")
        )
        ((= (gp_integer_get "gp_arg_index") 23)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_23")
        )
        ((= (gp_integer_get "gp_arg_index") 24)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_24")
        )
        ((= (gp_integer_get "gp_arg_index") 25)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_25")
        )
        ((= (gp_integer_get "gp_arg_index") 26)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_26")
        )
        ((= (gp_integer_get "gp_arg_index") 27)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_27")
        )
        ((= (gp_integer_get "gp_arg_index") 28)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_28")
        )
        ((= (gp_integer_get "gp_arg_index") 29)
            (pda_play_arg_sound (player_get player_short) "gp_arg_slot_29")
        )
    )
)

(script dormant void h100_arg_p0_supply_cache_01
    (f_arg_supply_cache player_00)
)

(script dormant void h100_arg_p1_supply_cache_01
    (f_arg_supply_cache player_01)
)

(script dormant void h100_arg_p2_supply_cache_01
    (f_arg_supply_cache player_02)
)

(script dormant void h100_arg_p3_supply_cache_01
    (f_arg_supply_cache player_03)
)

(script dormant void h100_arg_supply_cache_01
    (if debug 
        (print "you have unlocked supply cache 01"))
    (device_group_set_immediate "dg_cache_power_01" 1.0)
    (pda_activate_marker_named player "dm_cache_01a" "arg_waypoints" true "supply_cache")
    (pda_activate_marker_named player "dm_cache_01b" "arg_waypoints" true "supply_cache")
    (if (= (gp_integer_get "gp_arg_index") 4) 
        (begin
            (wake h100_arg_p0_supply_cache_01)
            (if (>= (game_coop_player_count) 2) 
                (wake h100_arg_p1_supply_cache_01))
            (if (>= (game_coop_player_count) 3) 
                (wake h100_arg_p2_supply_cache_01))
            (if (>= (game_coop_player_count) 4) 
                (wake h100_arg_p3_supply_cache_01))
        )
    )
    (wake h100_arg_cache_01a)
    (wake h100_arg_cache_01b)
)

(script dormant void h100_arg_cache_01a
    (if debug 
        (print "cache 01a"))
    (sleep_until (volume_test_players "tv_cache_door_01a"))
    (h100_recycle_objects)
    (sleep 30)
    (object_create_folder_anew "sc_cache_01a")
    (object_create_folder_anew "eq_cache_01a")
    (object_create_folder_anew "wp_cache_01a")
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_cache_door_01a"))
            (if (volume_test_players "tv_cache_door_01a") 
                (device_set_position "dm_cache_01a" 1.0))
            false
        )
    )
)

(script dormant void h100_arg_cache_01b
    (if debug 
        (print "cache 01b"))
    (sleep_until (volume_test_players "tv_cache_door_01b"))
    (h100_recycle_objects)
    (sleep 30)
    (object_create_folder_anew "sc_cache_01b")
    (object_create_folder_anew "eq_cache_01b")
    (object_create_folder_anew "wp_cache_01b")
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_cache_door_01b"))
            (if (volume_test_players "tv_cache_door_01b") 
                (device_set_position "dm_cache_01b" 1.0))
            false
        )
    )
)

(script dormant void h100_arg_p0_supply_cache_02
    (f_arg_supply_cache player_00)
)

(script dormant void h100_arg_p1_supply_cache_02
    (f_arg_supply_cache player_01)
)

(script dormant void h100_arg_p2_supply_cache_02
    (f_arg_supply_cache player_02)
)

(script dormant void h100_arg_p3_supply_cache_02
    (f_arg_supply_cache player_03)
)

(script dormant void h100_arg_supply_cache_02
    (if debug 
        (print "you have unlocked supply cache 02"))
    (device_group_set_immediate "dg_cache_power_02" 1.0)
    (pda_activate_marker_named player "dm_cache_02a" "arg_waypoints" true "supply_cache")
    (pda_activate_marker_named player "dm_cache_02b" "arg_waypoints" true "supply_cache")
    (if (= (gp_integer_get "gp_arg_index") 8) 
        (begin
            (wake h100_arg_p0_supply_cache_02)
            (if (>= (game_coop_player_count) 2) 
                (wake h100_arg_p1_supply_cache_02))
            (if (>= (game_coop_player_count) 3) 
                (wake h100_arg_p2_supply_cache_02))
            (if (>= (game_coop_player_count) 4) 
                (wake h100_arg_p3_supply_cache_02))
        )
    )
    (wake h100_arg_cache_02a)
    (wake h100_arg_cache_02b)
)

(script dormant void h100_arg_cache_02a
    (if debug 
        (print "cache 02a"))
    (sleep_until (volume_test_players "tv_cache_door_02a"))
    (h100_recycle_objects)
    (sleep 30)
    (object_create_folder_anew "sc_cache_02a")
    (object_create_folder_anew "v_cache_02a")
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_cache_door_02a"))
            (if (volume_test_players "tv_cache_door_02a") 
                (device_set_position "dm_cache_02a" 1.0))
            false
        )
    )
)

(script dormant void h100_arg_cache_02b
    (if debug 
        (print "cache 02b"))
    (sleep_until (volume_test_players "tv_cache_door_02b"))
    (h100_recycle_objects)
    (sleep 30)
    (object_create_folder_anew "sc_cache_02b")
    (object_create_folder_anew "v_cache_02b")
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_cache_door_02b"))
            (if (volume_test_players "tv_cache_door_02b") 
                (device_set_position "dm_cache_02b" 1.0))
            false
        )
    )
)

(script dormant void h100_arg_p0_supply_cache_03
    (f_arg_supply_cache player_00)
)

(script dormant void h100_arg_p1_supply_cache_03
    (f_arg_supply_cache player_01)
)

(script dormant void h100_arg_p2_supply_cache_03
    (f_arg_supply_cache player_02)
)

(script dormant void h100_arg_p3_supply_cache_03
    (f_arg_supply_cache player_03)
)

(script dormant void h100_arg_supply_cache_03
    (if debug 
        (print "you have unlocked supply cache 03"))
    (device_group_set_immediate "dg_cache_power_03" 1.0)
    (pda_activate_marker_named player "dm_cache_03a" "arg_waypoints" true "supply_cache")
    (pda_activate_marker_named player "dm_cache_03b" "arg_waypoints" true "supply_cache")
    (if (= (gp_integer_get "gp_arg_index") 16) 
        (begin
            (wake h100_arg_p0_supply_cache_03)
            (if (>= (game_coop_player_count) 2) 
                (wake h100_arg_p1_supply_cache_03))
            (if (>= (game_coop_player_count) 3) 
                (wake h100_arg_p2_supply_cache_03))
            (if (>= (game_coop_player_count) 4) 
                (wake h100_arg_p3_supply_cache_03))
        )
    )
    (wake h100_arg_cache_03a)
    (wake h100_arg_cache_03b)
)

(script dormant void h100_arg_cache_03a
    (if debug 
        (print "cache 03a"))
    (sleep_until (volume_test_players "tv_cache_door_03a"))
    (h100_recycle_objects)
    (sleep 30)
    (object_create_folder_anew "sc_cache_03a")
    (object_create_folder_anew "eq_cache_03a")
    (object_create_folder_anew "wp_cache_03a")
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_cache_door_03a"))
            (if (volume_test_players "tv_cache_door_03a") 
                (device_set_position "dm_cache_03a" 1.0))
            false
        )
    )
)

(script dormant void h100_arg_cache_03b
    (if debug 
        (print "cache 03b"))
    (sleep_until (volume_test_players "tv_cache_door_03b"))
    (h100_recycle_objects)
    (sleep 30)
    (object_create_folder_anew "sc_cache_03b")
    (object_create_folder_anew "eq_cache_03b")
    (object_create_folder_anew "wp_cache_03b")
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_cache_door_03b"))
            (if (volume_test_players "tv_cache_door_03b") 
                (device_set_position "dm_cache_03b" 1.0))
            false
        )
    )
)

(script dormant void h100_arg_p0_supply_cache_04
    (f_arg_supply_cache player_00)
)

(script dormant void h100_arg_p1_supply_cache_04
    (f_arg_supply_cache player_01)
)

(script dormant void h100_arg_p2_supply_cache_04
    (f_arg_supply_cache player_02)
)

(script dormant void h100_arg_p3_supply_cache_04
    (f_arg_supply_cache player_03)
)

(script dormant void h100_arg_supply_cache_04
    (sleep (* 30.0 57.0))
    (if debug 
        (print "you have unlocked supply cache 04"))
    (device_group_set_immediate "dg_cache_power_04" 1.0)
    (pda_activate_marker_named player "dm_cache_04" "arg_waypoints" true "supply_cache")
    (if (gp_boolean_get "gp_h100_from_mainmenu") 
        (begin
            (wake h100_arg_p0_supply_cache_04)
            (if (>= (game_coop_player_count) 2) 
                (wake h100_arg_p1_supply_cache_04))
            (if (>= (game_coop_player_count) 3) 
                (wake h100_arg_p2_supply_cache_04))
            (if (>= (game_coop_player_count) 4) 
                (wake h100_arg_p3_supply_cache_04))
        )
    )
    (wake h100_arg_cache_04)
)

(script dormant void h100_arg_cache_04
    (if debug 
        (print "cache 4"))
    (sleep_until (volume_test_players "tv_cache_door_04"))
    (h100_recycle_objects)
    (sleep 30)
    (object_create_folder_anew "sc_cache_04")
    (object_create_folder_anew "v_cache_04")
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "tv_cache_door_04"))
            (if (volume_test_players "tv_cache_door_04") 
                (device_set_position "dm_cache_04" 1.0))
            false
        )
    )
)

(script static void f_arg_supply_cache (short player_short)
    (if (not (is_skull_secondary_enabled skull_blind)) 
        (begin
            (f_display_message_accept player_short "arg_supply_point" "tr_blank_long")
            (f_display_message_accept player_short "arg_supply_point_location" "tr_blank_short")
        )
    )
)

(script static void h100_unlock_supply_cache
    (if (>= (gp_integer_get "gp_arg_index") 4) 
        (begin
            (wake h100_arg_supply_cache_01)
        )
    )
    (if (>= (gp_integer_get "gp_arg_index") 8) 
        (begin
            (wake h100_arg_supply_cache_02)
        )
    )
    (if (>= (gp_integer_get "gp_arg_index") 16) 
        (begin
            (wake h100_arg_supply_cache_03)
        )
    )
    (if (gp_boolean_get "gp_h100_from_mainmenu") 
        (begin
            (wake h100_arg_supply_cache_04)
        )
    )
)

(script static void f_h100_mark_vehicles (trigger_volume scene_volume)
    (if (volume_test_object scene_volume "v_cache_02a_01") 
        (gp_boolean_set "gp_v_cache_02a_01" true))
    (if (volume_test_object scene_volume "v_cache_02a_02") 
        (gp_boolean_set "gp_v_cache_02a_02" true))
    (if (volume_test_object scene_volume "v_cache_02b_01") 
        (gp_boolean_set "gp_v_cache_02b_01" true))
    (if (volume_test_object scene_volume "v_cache_02b_02") 
        (gp_boolean_set "gp_v_cache_02b_02" true))
    (if (volume_test_object scene_volume "v_mongoose_01") 
        (gp_boolean_set "gp_v_mongoose_01" true))
    (if (volume_test_object scene_volume "v_mongoose_02") 
        (gp_boolean_set "gp_v_mongoose_02" true))
    (if (volume_test_object scene_volume "v_mongoose_03") 
        (gp_boolean_set "gp_v_mongoose_03" true))
    (if (volume_test_object scene_volume "v_mongoose_04") 
        (gp_boolean_set "gp_v_mongoose_04" true))
    (if (volume_test_object scene_volume "v_cache_04_01") 
        (gp_boolean_set "gp_v_cache_04_01" true))
    (if (volume_test_object scene_volume "v_cache_04_02") 
        (gp_boolean_set "gp_v_cache_04_02" true))
    (if (volume_test_object scene_volume "v_ghost_01") 
        (gp_boolean_set "gp_v_ghost_01" true))
    (if (volume_test_object scene_volume "v_ghost_02") 
        (gp_boolean_set "gp_v_ghost_02" true))
    (if (volume_test_object scene_volume "v_ghost_03") 
        (gp_boolean_set "gp_v_ghost_03" true))
    (if (volume_test_object scene_volume "v_ghost_04") 
        (gp_boolean_set "gp_v_ghost_04" true))
    (if (volume_test_object scene_volume ai_ghost_01) 
        (gp_boolean_set "gp_v_ai_ghost_01" true))
    (if (volume_test_object scene_volume ai_ghost_02) 
        (gp_boolean_set "gp_v_ai_ghost_02" true))
)

(script static void h100_return_vehicles
    (begin_random
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_cache_02a_01")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_cache_02a_02")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_cache_02b_01")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_cache_02b_02")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_mongoose_01")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_mongoose_02")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_mongoose_03")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_mongoose_04")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_cache_04_01")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_cache_04_02")
            ) 
                (f_h100_return_vehicles "mongoose"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_ghost_01")
            ) 
                (f_h100_return_vehicles "ghost"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_ghost_02")
            ) 
                (f_h100_return_vehicles "ghost"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_ghost_03")
            ) 
                (f_h100_return_vehicles "ghost"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_ghost_04")
            ) 
                (f_h100_return_vehicles "ghost"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_ai_ghost_01")
            ) 
                (f_h100_return_vehicles "ghost"))
        (if 
            (and
                b_h100_return_vehicle
                (gp_boolean_get "gp_v_ai_ghost_02")
            ) 
                (f_h100_return_vehicles "ghost"))
    )
    (sleep 1)
    (set b_h100_return_vehicle true)
    (set s_h100_return_ghost_count 0)
    (set s_h100_return_mongoose_count 0)
    (h100_clear_vehicle_gp)
)

(script static void f_h100_return_vehicles (string vehicle_type)
    (cond
        ((= vehicle_type "ghost")
            (begin
                (if debug 
                    (print "spawn ghost"))
                (cond
                    ((= s_h100_return_ghost_count 0)
                        (begin
                            (object_create_anew "v_ghost_01")
                            (set v_h100_cache_vehicle "v_ghost_01")
                        )
                    )
                    ((= s_h100_return_ghost_count 1)
                        (begin
                            (object_create_anew "v_ghost_02")
                            (set v_h100_cache_vehicle "v_ghost_02")
                        )
                    )
                    ((= s_h100_return_ghost_count 2)
                        (begin
                            (object_create_anew "v_ghost_03")
                            (set v_h100_cache_vehicle "v_ghost_03")
                        )
                    )
                    ((= s_h100_return_ghost_count 3)
                        (begin
                            (object_create_anew "v_ghost_04")
                            (set v_h100_cache_vehicle "v_ghost_04")
                        )
                    )
                )
                (set s_h100_return_ghost_count (+ s_h100_return_ghost_count 1.0))
            )
        )
        ((= vehicle_type "mongoose")
            (begin
                (if debug 
                    (print "spawn mongoose"))
                (cond
                    ((= s_h100_return_mongoose_count 0)
                        (begin
                            (object_create_anew "v_mongoose_01")
                            (set v_h100_cache_vehicle "v_mongoose_01")
                        )
                    )
                    ((= s_h100_return_mongoose_count 1)
                        (begin
                            (object_create_anew "v_mongoose_02")
                            (set v_h100_cache_vehicle "v_mongoose_02")
                        )
                    )
                    ((= s_h100_return_mongoose_count 2)
                        (begin
                            (object_create_anew "v_mongoose_03")
                            (set v_h100_cache_vehicle "v_mongoose_03")
                        )
                    )
                    ((= s_h100_return_mongoose_count 3)
                        (begin
                            (object_create_anew "v_mongoose_04")
                            (set v_h100_cache_vehicle "v_mongoose_04")
                        )
                    )
                )
                (set s_h100_return_mongoose_count (+ s_h100_return_mongoose_count 1.0))
            )
        )
    )
    (sleep 1)
    (h100_teleport_spawned_vehicle)
    (if (>= (h100_spawned_vehicle_count) 4) 
        (set b_h100_return_vehicle false))
)

(script static void h100_teleport_spawned_vehicle
    (if debug 
        (print "teleport vehicle"))
    (if (= (gp_integer_get "gp_current_scene") 100) 
        (cond
            ((= (h100_spawned_vehicle_count) 1)
                (object_teleport v_h100_cache_vehicle "fl_sc100_vehicle_01")
            )
            ((= (h100_spawned_vehicle_count) 2)
                (object_teleport v_h100_cache_vehicle "fl_sc100_vehicle_02")
            )
            ((= (h100_spawned_vehicle_count) 3)
                (object_teleport v_h100_cache_vehicle "fl_sc100_vehicle_03")
            )
            ((= (h100_spawned_vehicle_count) 4)
                (object_teleport v_h100_cache_vehicle "fl_sc100_vehicle_04")
            )
        )
    )
    (if (= (gp_integer_get "gp_current_scene") 110) 
        (cond
            ((= (h100_spawned_vehicle_count) 1)
                (object_teleport v_h100_cache_vehicle "fl_sc110_vehicle_01")
            )
            ((= (h100_spawned_vehicle_count) 2)
                (object_teleport v_h100_cache_vehicle "fl_sc110_vehicle_02")
            )
            ((= (h100_spawned_vehicle_count) 3)
                (object_teleport v_h100_cache_vehicle "fl_sc110_vehicle_03")
            )
            ((= (h100_spawned_vehicle_count) 4)
                (object_teleport v_h100_cache_vehicle "fl_sc110_vehicle_04")
            )
        )
    )
    (if (= (gp_integer_get "gp_current_scene") 120) 
        (cond
            ((= (h100_spawned_vehicle_count) 1)
                (object_teleport v_h100_cache_vehicle "fl_sc120_vehicle_01")
            )
            ((= (h100_spawned_vehicle_count) 2)
                (object_teleport v_h100_cache_vehicle "fl_sc120_vehicle_02")
            )
            ((= (h100_spawned_vehicle_count) 3)
                (object_teleport v_h100_cache_vehicle "fl_sc120_vehicle_03")
            )
            ((= (h100_spawned_vehicle_count) 4)
                (object_teleport v_h100_cache_vehicle "fl_sc120_vehicle_04")
            )
        )
    )
    (if (= (gp_integer_get "gp_current_scene") 130) 
        (cond
            ((= (h100_spawned_vehicle_count) 1)
                (object_teleport v_h100_cache_vehicle "fl_sc130_vehicle_01")
            )
            ((= (h100_spawned_vehicle_count) 2)
                (object_teleport v_h100_cache_vehicle "fl_sc130_vehicle_02")
            )
            ((= (h100_spawned_vehicle_count) 3)
                (object_teleport v_h100_cache_vehicle "fl_sc130_vehicle_03")
            )
            ((= (h100_spawned_vehicle_count) 4)
                (object_teleport v_h100_cache_vehicle "fl_sc130_vehicle_04")
            )
        )
    )
    (if (= (gp_integer_get "gp_current_scene") 140) 
        (cond
            ((= (h100_spawned_vehicle_count) 1)
                (object_teleport v_h100_cache_vehicle "fl_sc140_vehicle_01")
            )
            ((= (h100_spawned_vehicle_count) 2)
                (object_teleport v_h100_cache_vehicle "fl_sc140_vehicle_02")
            )
            ((= (h100_spawned_vehicle_count) 3)
                (object_teleport v_h100_cache_vehicle "fl_sc140_vehicle_03")
            )
            ((= (h100_spawned_vehicle_count) 4)
                (object_teleport v_h100_cache_vehicle "fl_sc140_vehicle_04")
            )
        )
    )
    (if (= (gp_integer_get "gp_current_scene") 150) 
        (cond
            ((= (h100_spawned_vehicle_count) 1)
                (object_teleport v_h100_cache_vehicle "fl_sc150_vehicle_01")
            )
            ((= (h100_spawned_vehicle_count) 2)
                (object_teleport v_h100_cache_vehicle "fl_sc150_vehicle_02")
            )
            ((= (h100_spawned_vehicle_count) 3)
                (object_teleport v_h100_cache_vehicle "fl_sc150_vehicle_03")
            )
            ((= (h100_spawned_vehicle_count) 4)
                (object_teleport v_h100_cache_vehicle "fl_sc150_vehicle_04")
            )
        )
    )
)

(script static short h100_spawned_vehicle_count
    (+ s_h100_return_ghost_count s_h100_return_mongoose_count)
)

(script static void h100_clear_vehicle_gp
    (gp_boolean_set "gp_v_cache_02a_01" false)
    (gp_boolean_set "gp_v_cache_02a_02" false)
    (gp_boolean_set "gp_v_cache_02b_01" false)
    (gp_boolean_set "gp_v_cache_02b_02" false)
    (gp_boolean_set "gp_v_mongoose_01" false)
    (gp_boolean_set "gp_v_mongoose_02" false)
    (gp_boolean_set "gp_v_mongoose_03" false)
    (gp_boolean_set "gp_v_mongoose_04" false)
    (gp_boolean_set "gp_v_cache_04_01" false)
    (gp_boolean_set "gp_v_cache_04_02" false)
    (gp_boolean_set "gp_v_ghost_01" false)
    (gp_boolean_set "gp_v_ghost_02" false)
    (gp_boolean_set "gp_v_ghost_03" false)
    (gp_boolean_set "gp_v_ghost_04" false)
    (gp_boolean_set "gp_v_ai_ghost_01" false)
    (gp_boolean_set "gp_v_ai_ghost_02" false)
)

(script dormant void l100_tr_player0_arg
    (f_h100_arg_training player_00)
)

(script dormant void l100_tr_player1_arg
    (f_h100_arg_training player_01)
)

(script dormant void l100_tr_player2_arg
    (f_h100_arg_training player_02)
)

(script dormant void l100_tr_player3_arg
    (f_h100_arg_training player_03)
)

(script static void f_h100_arg_training (short player_short)
    (sleep_until (pda_is_active_deterministic (player_get player_short)) 1 (* 30.0 7.0))
    (chud_display_pda_communications_message "" 0)
    (if 
        (and
            (not (gp_boolean_get "gp_h100_from_mainmenu"))
            (pda_is_active_deterministic (player_get player_short))
        ) 
            (begin
                (player_force_pda (player_get player_short))
                (player_set_nav_enabled (player_get player_short) false)
                (player_set_objectives_enabled (player_get player_short) false)
                (pda_input_enable (player_get player_short) false)
                (pda_input_enable_a (player_get player_short) false)
                (pda_input_enable_dismiss (player_get player_short) false)
                (pda_input_enable_x (player_get player_short) false)
                (pda_input_enable_y (player_get player_short) false)
                (pda_input_enable_dpad (player_get player_short) false)
                (sleep 60)
                (f_display_message player_short "tr_pda_comm_a_button")
                (sleep (* 30.0 7.0))
                (f_display_message player_short "tr_pda_comm_dpad")
                (sleep (* 30.0 7.0))
                (f_display_message_accept player_short "tr_pda_comm_play02" "tr_blank_long")
                (f_display_message player_short "tr_pda_deactivate_fade")
            )
    )
    (player_set_nav_enabled (player_get player_short) true)
    (player_set_objectives_enabled (player_get player_short) true)
    (pda_input_enable (player_get player_short) true)
    (pda_input_enable_a (player_get player_short) true)
    (pda_input_enable_dismiss (player_get player_short) true)
    (pda_input_enable_x (player_get player_short) true)
    (pda_input_enable_y (player_get player_short) true)
    (pda_input_enable_dpad (player_get player_short) true)
)

(script static void test_arg_all
    (gp_integer_set "gp_arg_index" 30)
    (gp_boolean_set "gp_sc110_terminal_01_complete" true)
    (gp_boolean_set "gp_sc110_terminal_02_complete" true)
    (gp_boolean_set "gp_sc110_terminal_03_complete" true)
    (gp_boolean_set "gp_sc110_terminal_04_complete" true)
    (gp_boolean_set "gp_sc110_terminal_05_complete" true)
    (gp_boolean_set "gp_sc110_terminal_06_complete" true)
    (gp_boolean_set "gp_sc120_terminal_01_complete" true)
    (gp_boolean_set "gp_sc120_terminal_02_complete" true)
    (gp_boolean_set "gp_sc120_terminal_03_complete" true)
    (gp_boolean_set "gp_sc120_terminal_04_complete" true)
    (gp_boolean_set "gp_sc120_terminal_05_complete" true)
    (gp_boolean_set "gp_sc120_terminal_06_complete" true)
    (gp_boolean_set "gp_sc130_terminal_01_complete" true)
    (gp_boolean_set "gp_sc130_terminal_02_complete" true)
    (gp_boolean_set "gp_sc130_terminal_03_complete" true)
    (gp_boolean_set "gp_sc130_terminal_04_complete" true)
    (gp_boolean_set "gp_sc130_terminal_05_complete" true)
    (gp_boolean_set "gp_sc130_terminal_06_complete" true)
    (gp_boolean_set "gp_sc140_terminal_01_complete" true)
    (gp_boolean_set "gp_sc140_terminal_02_complete" true)
    (gp_boolean_set "gp_sc140_terminal_03_complete" true)
    (gp_boolean_set "gp_sc140_terminal_04_complete" true)
    (gp_boolean_set "gp_sc140_terminal_05_complete" true)
    (gp_boolean_set "gp_sc140_terminal_06_complete" true)
    (gp_boolean_set "gp_sc150_terminal_01_complete" true)
    (gp_boolean_set "gp_sc150_terminal_02_complete" true)
    (gp_boolean_set "gp_sc150_terminal_03_complete" true)
    (gp_boolean_set "gp_sc150_terminal_04_complete" true)
    (gp_boolean_set "gp_sc150_terminal_05_complete" true)
    (gp_boolean_set "gp_l200_terminal_01_complete" true)
)

(script static void sc100_int_hb_01_sc_sh1
    (fade_in 0.0 0.0 0.0 15)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 0 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "cin_player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_damaged_helmet_1" true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 5 true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 0.0 0.0)
    (sleep 1)
    (cinematic_scripting_start_music 0 0 0 0)
    (sleep 112)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_int_hb_01_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 1 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "cin_player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_damaged_helmet_2" true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 5 true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 1.0 0.0)
    (sleep 131)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_int_hb_01_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 2 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "cin_player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_damaged_helmet_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "fx_marker_3" true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 5 true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.0 0.0)
    (sleep 83)
    (cinematic_scripting_start_effect 0 0 2 0 "sc_broken_tv")
    (sleep 20)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_int_hb_01_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 3 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "cin_player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_damaged_helmet_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "cin_smg1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "fx_marker_4" true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 5 true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 120)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_int_hb_01_sc_sh5
    (fade_in 1.0 1.0 1.0 5)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 4 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 4)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "cin_player_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_damaged_helmet_5" true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "fx_marker_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 "super_5" true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 5 true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "location" 0.6 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "status" 0.35 0.0)
    (cinematic_scripting_start_screen_effect 0 0 4 0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.4 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.6 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.5 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "status" 0.2 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.4 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "status" 0.25 0.0)
    (sleep 10)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.5 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.0 0.0)
    (sleep 18)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.4 0.0)
    (sleep 20)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.7 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.5 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.1 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.7 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.0 0.0)
    (sleep 14)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.4 0.0)
    (sleep 1)
    (cinematic_scripting_start_screen_effect 0 0 4 1)
    (sleep 19)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.5 0.0)
    (sleep 2)
    (cinematic_scripting_start_screen_effect 0 0 4 2)
    (sleep 2)
    (cinematic_scripting_start_dialogue 0 0 4 0 none)
    (sleep 6)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.7 0.0)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "status" 0.4 0.0)
    (sleep 2)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "eyes" 0.3 0.0)
    (sleep 8)
    (object_set_function_variable (cinematic_scripting_get_object 0 0 4) "timestamp" 0.4 0.0)
    (sleep 13)
    (cinematic_print "custom script play")
    (fade_in 1.0 1.0 1.0 5)
    (sleep 1)
    (cinematic_scripting_stop_screen_effect 0 0 4 0)
    (cinematic_scripting_start_music 0 0 4 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_int_hb_01_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0 0) 5 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 5)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "cin_player_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "cin_damaged_helmet_6" true)
    (object_hide (cinematic_scripting_get_object 0 0 2) true)
    (object_hide (cinematic_scripting_get_object 0 0 3) true)
    (object_hide (cinematic_scripting_get_object 0 0 4) true)
    (cinematic_scripting_create_and_animate_object_no_animation 0 0 5 true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 4)
    (cinematic_scripting_stop_music 0 0 5 0)
    (cinematic_scripting_stop_music 0 0 5 2)
    (cinematic_scripting_stop_music 0 0 5 1)
    (sleep 26)
    (cinematic_scripting_start_dialogue 0 0 5 0 none)
    (sleep 124)
    (cinematic_scripting_start_dialogue 0 0 5 1 none)
    (sleep 21)
    (cinematic_scripting_start_dialogue 0 0 5 2 none)
    (sleep 36)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 60)
    (sleep 214)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc100_int_hb_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0 0) 0)
    (sc100_int_hb_01_sc_sh1)
    (sc100_int_hb_01_sc_sh2)
    (sc100_int_hb_01_sc_sh3)
    (sc100_int_hb_01_sc_sh4)
    (sc100_int_hb_01_sc_sh5)
    (sc100_int_hb_01_sc_sh6)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 0 0 0)
    (cinematic_scripting_destroy_object 0 0 1)
    (cinematic_scripting_destroy_object 0 0 2)
    (cinematic_scripting_destroy_object 0 0 3)
    (cinematic_scripting_destroy_object 0 0 4)
    (cinematic_scripting_destroy_object 0 0 5)
)

(script static void sc100_int_hb_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void begin_sc100_int_hb_debug
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

(script static void end_sc100_int_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc100_int_hb_debug
    (begin_sc100_int_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc100_int_hb_01_sc)
    (sound_class_set_gain "" 0.0 0)
    (end_sc100_int_hb_debug)
)

(script static void begin_sc100_int_hb
    (cinematic_zone_activate 0)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
)

(script static void end_sc100_int_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_int_hb
    (begin_sc100_int_hb)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc100_int_hb_01_sc)
    (sound_class_set_gain "" 0.0 0)
    (end_sc100_int_hb)
)

(script static void sc100_out_hb_01_sc_sh1
    (fade_in 0.0 0.0 0.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 0 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_damaged_helmet_1" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 1)
    (cinematic_scripting_start_music 1 0 0 0)
    (sleep 69)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb_01_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 1 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_damaged_helmet_2" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_autoexposure_instant 1)
    (sleep 50)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb_01_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 2 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_damaged_helmet_3" true)
    (object_hide (cinematic_scripting_get_object 1 0 2) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_autoexposure_instant 1)
    (sleep 122)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb_01_sc_sh4
    (begin
        (object_create "dm_sc100_out_hb_sign_01")
        (object_create "dm_sc100_out_hb_sign_02")
        (object_create "dm_sc100_out_hb_sign_03")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1 0) 3 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "cin_player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "cin_damaged_helmet_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "cin_smg1_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_autoexposure_instant 1)
    (sleep 70)
    (device_set_position_immediate "dm_sc100_out_hb_sign_01" 1.0)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_print "custom script play")
    (device_set_position_immediate "dm_sc100_out_hb_sign_02" 1.0)
    (sleep 10)
    (device_set_position_immediate "dm_sc100_out_hb_sign_03" 1.0)
    (cinematic_print "custom script play")
    (sleep 40)
    (cinematic_print "custom script play")
    (device_set_position_immediate "dm_sc100_out_hb_sign_01" 1.0)
    (sleep 10)
    (cinematic_print "custom script play")
    (device_set_position_immediate "dm_sc100_out_hb_sign_02" 1.0)
    (sleep 10)
    (device_set_position_immediate "dm_sc100_out_hb_sign_03" 1.0)
    (cinematic_print "custom script play")
    (sleep 18)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc100_out_hb_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1 0) 0)
    (sc100_out_hb_01_sc_sh1)
    (sc100_out_hb_01_sc_sh2)
    (sc100_out_hb_01_sc_sh3)
    (sc100_out_hb_01_sc_sh4)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 1 0 0)
    (cinematic_scripting_destroy_object 1 0 1)
    (cinematic_scripting_destroy_object 1 0 2)
)

(script static void sc100_out_hb_cleanup
    (cinematic_scripting_clean_up 1)
)

(script static void begin_sc100_out_hb_debug
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

(script static void end_sc100_out_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 1)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc100_out_hb_debug
    (begin_sc100_out_hb_debug)
    (fade_in 1.0 1.0 1.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc100_out_hb_01_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc100_out_hb_debug)
)

(script static void begin_sc100_out_hb
    (cinematic_zone_activate 1)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
)

(script static void end_sc100_out_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb
    (begin_sc100_out_hb)
    (fade_in 1.0 1.0 1.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc100_out_hb_01_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc100_out_hb)
)

(script static void sc110_int_hb_sc_sh1
    (fade_in 0.0 0.0 0.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 0 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 "sc110_optics_package_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 "sc110_smg_1" true)
    (object_hide (cinematic_scripting_get_object 2 0 3) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 2)
    (cinematic_scripting_start_music 2 0 0 0)
    (sleep 124)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_int_hb_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 1 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 "sc110_optics_package_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 "sc110_smg_2" true)
    (object_hide (cinematic_scripting_get_object 2 0 3) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 30)
    (cinematic_scripting_start_effect 2 0 1 0 (cinematic_object_get "optics_package"))
    (sleep 79)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_int_hb_sc_sh3
    (fade_in 1.0 1.0 1.0 10)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 2 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "player_3" true)
    (object_hide (cinematic_scripting_get_object 2 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 "sc110_smg_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 3 "hud_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (cinematic_scripting_start_screen_effect 2 0 2 0)
    (sleep 105)
    (cinematic_scripting_start_dialogue 2 0 2 0 none)
    (sleep 10)
    (cinematic_scripting_stop_music 2 0 2 0)
    (sleep 17)
    (cinematic_print "custom script play")
    (cinematic_scripting_stop_screen_effect 2 0 2 0)
    (fade_in 1.0 1.0 1.0 10)
    (sleep 1)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_int_hb_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2 0) 3 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 "sc110_optics_package_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 "sc110_smg_4" true)
    (object_hide (cinematic_scripting_get_object 2 0 3) true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 42)
    (cinematic_scripting_start_dialogue 2 0 3 0 none)
    (sleep 51)
    (cinematic_scripting_start_dialogue 2 0 3 1 none)
    (sleep 99)
    (cinematic_print "custom script play")
    (begin
        (sound_class_set_gain "amb" 0.0 150)
        (sound_class_set_gain "device" 0.0 150)
    )
    (sleep 30)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 60)
    (sleep 60)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_int_hb_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2 0) 0)
    (sc110_int_hb_sc_sh1)
    (sc110_int_hb_sc_sh2)
    (sc110_int_hb_sc_sh3)
    (sc110_int_hb_sc_sh4)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 2 0 0)
    (cinematic_scripting_destroy_object 2 0 1)
    (cinematic_scripting_destroy_object 2 0 2)
    (cinematic_scripting_destroy_object 2 0 3)
)

(script static void sc110_int_hb_cleanup
    (cinematic_scripting_clean_up 2)
)

(script static void begin_sc110_int_hb_debug
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

(script static void end_sc110_int_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 2)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc110_int_hb_debug
    (begin_sc110_int_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (!sc110_int_hb_sc)
    (end_sc110_int_hb_debug)
)

(script static void begin_sc110_int_hb
    (cinematic_zone_activate 2)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 2))
)

(script static void end_sc110_int_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_int_hb
    (begin_sc110_int_hb)
    (fade_in 0.0 0.0 0.0 0)
    (!sc110_int_hb_sc)
    (end_sc110_int_hb)
)

(script static void sc110_out_hb_sc_sh1
    (fade_in 0.0 0.0 0.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 0 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 "optics_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 "silenced_smg_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 3)
    (cinematic_scripting_start_music 3 0 0 0)
    (sleep 181)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_hb_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3 0) 1 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 "player_2" true)
    (object_hide (cinematic_scripting_get_object 3 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 "silenced_smg_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_autoexposure_instant 1)
    (sleep 107)
    (fade_out 0.0 0.0 0.0 10)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_hb_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3 0) 0)
    (sc110_out_hb_sc_sh1)
    (sc110_out_hb_sc_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 3 0 0)
    (cinematic_scripting_destroy_object 3 0 1)
    (cinematic_scripting_destroy_object 3 0 2)
)

(script static void sc110_out_hb_cleanup
    (cinematic_scripting_clean_up 3)
)

(script static void begin_sc110_out_hb_debug
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

(script static void end_sc110_out_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 3)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc110_out_hb_debug
    (begin_sc110_out_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc110_out_hb_sc)
    (end_sc110_out_hb_debug)
)

(script static void begin_sc110_out_hb
    (cinematic_zone_activate 3)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 3))
)

(script static void end_sc110_out_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_hb
    (begin_sc110_out_hb)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc110_out_hb_sc)
    (end_sc110_out_hb)
)

(script static void sc120_int_hb_sc_sh1
    (fade_in 0.0 0.0 0.0 10)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 0 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 1 "turret_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 2)
    (cinematic_scripting_start_music 4 0 0 0)
    (sleep 45)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_int_hb_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 1 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 1 "turret_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 43)
    (cinematic_scripting_start_dialogue 4 0 1 0 none)
    (sleep 7)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_int_hb_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 2 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 1 "turret_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 43)
    (cinematic_scripting_stop_music 4 0 2 0)
    (sleep 27)
    (cinematic_scripting_start_dialogue 4 0 2 0 none)
    (sleep 38)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_int_hb_sc_sh4
    (set render_lightmap_shadows false)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4 0) 3 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 "player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 1 "turret_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 52)
    (cinematic_scripting_start_dialogue 4 0 3 0 none)
    (sleep 69)
    (sound_class_set_gain "amb" 0.0 150)
    (cinematic_print "custom script play")
    (sleep 30)
    (fade_out 0.0 0.0 0.0 60)
    (cinematic_print "custom script play")
    (sleep 60)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc120_int_hb_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4 0) 0)
    (sc120_int_hb_sc_sh1)
    (sc120_int_hb_sc_sh2)
    (sc120_int_hb_sc_sh3)
    (sc120_int_hb_sc_sh4)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 4 0 0)
    (cinematic_scripting_destroy_object 4 0 1)
)

(script static void sc120_int_hb_cleanup
    (cinematic_scripting_clean_up 4)
)

(script static void begin_sc120_int_hb_debug
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

(script static void end_sc120_int_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 4)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc120_int_hb_debug
    (begin_sc120_int_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (!sc120_int_hb_sc)
    (end_sc120_int_hb_debug)
)

(script static void begin_sc120_int_hb
    (cinematic_zone_activate 4)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 4))
)

(script static void end_sc120_int_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_int_hb
    (begin_sc120_int_hb)
    (fade_in 0.0 0.0 0.0 0)
    (!sc120_int_hb_sc)
    (end_sc120_int_hb)
)

(script static void sc120_out_hb_sc_sh1
    (begin
        (fade_in 0.0 0.0 0.0 15)
        (set render_lightmap_shadows false)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5 0) 0 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 1 "turret_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 5)
    (cinematic_scripting_start_music 5 0 0 0)
    (sleep 29)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5 0) 1 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 1 "turret_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 138)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5 0) 2 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 1 "turret_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 104)
    (fade_out 0.0 0.0 0.0 10)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc120_out_hb_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5 0) 0)
    (sc120_out_hb_sc_sh1)
    (sc120_out_hb_sc_sh2)
    (sc120_out_hb_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 5 0 0)
    (cinematic_scripting_destroy_object 5 0 1)
)

(script static void sc120_out_hb_cleanup
    (cinematic_scripting_clean_up 5)
)

(script static void begin_sc120_out_hb_debug
    (cinematic_zone_activate_for_debugging 5)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 5))
)

(script static void end_sc120_out_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 5)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc120_out_hb_debug
    (begin_sc120_out_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc120_out_hb_sc)
    (end_sc120_out_hb_debug)
)

(script static void begin_sc120_out_hb
    (cinematic_zone_activate 5)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 5))
)

(script static void end_sc120_out_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb
    (begin_sc120_out_hb)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc120_out_hb_sc)
    (end_sc120_out_hb)
)

(script static void sc130_int_hb_01_sc_sh1
    (fade_in 0.0 0.0 0.0 5)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 6 0) 0 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 6 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 1 "detonator_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 2)
    (cinematic_scripting_start_music 6 0 0 0)
    (sleep 83)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_int_hb_01_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 6 0) 1 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 6 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 1 "detonator_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_autoexposure_instant 1)
    (sleep 65)
    (cinematic_scripting_start_dialogue 6 0 1 0 none)
    (sleep 41)
    (cinematic_scripting_stop_music 6 0 1 0)
    (sleep 39)
    (cinematic_scripting_start_dialogue 6 0 1 1 none)
    (sleep 30)
    (cinematic_scripting_start_dialogue 6 0 1 2 none)
    (sleep 51)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_int_hb_01_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 6 0) 2 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 6 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 1 "detonator_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_autoexposure_instant 1)
    (sleep 10)
    (cinematic_scripting_start_dialogue 6 0 2 0 none)
    (sleep 49)
    (cinematic_scripting_start_dialogue 6 0 2 1 none)
    (sleep 29)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 60)
    (sleep 1)
    (cinematic_print "custom script play")
    (begin
        (sound_class_set_gain "amb" 0.0 150)
        (sound_class_set_gain "no_pad" 0.0 150)
    )
    (sleep 90)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc130_int_hb_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 6 0) 0)
    (sc130_int_hb_01_sc_sh1)
    (sc130_int_hb_01_sc_sh2)
    (sc130_int_hb_01_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 6 0 0)
    (cinematic_scripting_destroy_object 6 0 1)
)

(script static void sc130_int_hb_cleanup
    (cinematic_scripting_clean_up 6)
)

(script static void begin_sc130_int_hb_debug
    (cinematic_zone_activate_for_debugging 6)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 6))
)

(script static void end_sc130_int_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 6)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc130_int_hb_debug
    (begin_sc130_int_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (!sc130_int_hb_01_sc)
    (end_sc130_int_hb_debug)
)

(script static void begin_sc130_int_hb
    (cinematic_zone_activate 6)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 6))
)

(script static void end_sc130_int_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_int_hb
    (begin_sc130_int_hb)
    (fade_in 0.0 0.0 0.0 0)
    (!sc130_int_hb_01_sc)
    (end_sc130_int_hb)
)

(script static void sc130_out_hb_01_sc_sh1
    (fade_out 0.0 0.0 0.0 0)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 7 0) 0 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 1 "detonator_1" true)
    (object_hide (cinematic_scripting_get_object 7 0 2) true)
    (object_hide (cinematic_scripting_get_object 7 0 3) true)
    (object_hide (cinematic_scripting_get_object 7 0 4) true)
    (object_hide (cinematic_scripting_get_object 7 0 5) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 2)
    (cinematic_scripting_start_music 7 0 0 0)
    (sleep 98)
    (fade_in 0.0 0.0 0.0 15)
    (cinematic_print "custom script play")
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb_01_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 7 0) 1 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 1 "detonator_2" true)
    (object_hide (cinematic_scripting_get_object 7 0 2) true)
    (object_hide (cinematic_scripting_get_object 7 0 3) true)
    (object_hide (cinematic_scripting_get_object 7 0 4) true)
    (object_hide (cinematic_scripting_get_object 7 0 5) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 156)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb_01_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 7 0) 2 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 1 "detonator_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 2 "detonatorsplash_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 3 "detonatorsplash_02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 4 "detonatorsplash_03_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 5 "detonatorsplash_04_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 37)
    (cinematic_scripting_start_effect 7 0 2 0 (cinematic_object_get "detonatorsplash_01"))
    (sleep 20)
    (cinematic_scripting_start_effect 7 0 2 1 (cinematic_object_get "detonatorsplash_02"))
    (sleep 13)
    (cinematic_scripting_start_effect 7 0 2 2 (cinematic_object_get "detonatorsplash_03"))
    (sleep 8)
    (cinematic_scripting_start_effect 7 0 2 3 (cinematic_object_get "detonatorsplash_04"))
    (sleep 23)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc130_out_hb_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7 0) 0)
    (sc130_out_hb_01_sc_sh1)
    (sc130_out_hb_01_sc_sh2)
    (sc130_out_hb_01_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 7 0 0)
    (cinematic_scripting_destroy_object 7 0 1)
    (cinematic_scripting_destroy_object 7 0 2)
    (cinematic_scripting_destroy_object 7 0 3)
    (cinematic_scripting_destroy_object 7 0 4)
    (cinematic_scripting_destroy_object 7 0 5)
)

(script static void sc130_out_hb_cleanup
    (cinematic_scripting_clean_up 7)
)

(script static void begin_sc130_out_hb_debug
    (cinematic_zone_activate_for_debugging 7)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 7))
)

(script static void end_sc130_out_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 7)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc130_out_hb_debug
    (begin_sc130_out_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc130_out_hb_01_sc)
    (end_sc130_out_hb_debug)
)

(script static void begin_sc130_out_hb
    (cinematic_zone_activate 7)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 7))
)

(script static void end_sc130_out_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb
    (begin_sc130_out_hb)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc130_out_hb_01_sc)
    (end_sc130_out_hb)
)

(script static void sc140_int_hb_01_sh1
    (begin
        (object_destroy "hub_rebar")
        (fade_in 0.0 0.0 0.0 5)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 0 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 1 "sc140_cin_cable1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 2 "sc140_cin_cable2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 3 "sc140_cin_cable3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 4 "sc140_cin_cable4_1" true)
    (object_hide (cinematic_scripting_get_object 8 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 7 "sc140_broken_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 1)
    (cinematic_scripting_start_music 8 0 0 0)
    (sleep 38)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 1 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_2" true)
    (object_hide (cinematic_scripting_get_object 8 0 1) true)
    (object_hide (cinematic_scripting_get_object 8 0 2) true)
    (object_hide (cinematic_scripting_get_object 8 0 3) true)
    (object_hide (cinematic_scripting_get_object 8 0 4) true)
    (object_hide (cinematic_scripting_get_object 8 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_2" true)
    (object_hide (cinematic_scripting_get_object 8 0 7) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 55)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 2 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_3" true)
    (object_hide (cinematic_scripting_get_object 8 0 1) true)
    (object_hide (cinematic_scripting_get_object 8 0 2) true)
    (object_hide (cinematic_scripting_get_object 8 0 3) true)
    (object_hide (cinematic_scripting_get_object 8 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 5 "sc140_cin_rebar_long_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_3" true)
    (object_hide (cinematic_scripting_get_object 8 0 7) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 115)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 3 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 1 "sc140_cin_cable1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 2 "sc140_cin_cable2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 3 "sc140_cin_cable3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 4 "sc140_cin_cable4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 5 "sc140_cin_rebar_long_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 7 "sc140_broken_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 138)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 4 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 4)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_5" true)
    (object_hide (cinematic_scripting_get_object 8 0 1) true)
    (object_hide (cinematic_scripting_get_object 8 0 2) true)
    (object_hide (cinematic_scripting_get_object 8 0 3) true)
    (object_hide (cinematic_scripting_get_object 8 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 5 "sc140_cin_rebar_long_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_5" true)
    (object_hide (cinematic_scripting_get_object 8 0 7) true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (sleep 48)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 5 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 5)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 1 "sc140_cin_cable1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 2 "sc140_cin_cable2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 3 "sc140_cin_cable3_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 4 "sc140_cin_cable4_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 5 "sc140_cin_rebar_long_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 7 "sc140_broken_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 29)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 6 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 6)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_7" true)
    (object_hide (cinematic_scripting_get_object 8 0 1) true)
    (object_hide (cinematic_scripting_get_object 8 0 2) true)
    (object_hide (cinematic_scripting_get_object 8 0 3) true)
    (object_hide (cinematic_scripting_get_object 8 0 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 5 "sc140_cin_rebar_long_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 7 "sc140_broken_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (sleep 47)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 7 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 7)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 1 "sc140_cin_cable1_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 2 "sc140_cin_cable2_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 3 "sc140_cin_cable3_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 4 "sc140_cin_cable4_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 5 "sc140_cin_rebar_long_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 7 "sc140_broken_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (sleep 105)
    (cinematic_scripting_stop_music 8 0 7 0)
    (sleep 20)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 8 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 8)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_9" true)
    (object_hide (cinematic_scripting_get_object 8 0 1) true)
    (object_hide (cinematic_scripting_get_object 8 0 2) true)
    (object_hide (cinematic_scripting_get_object 8 0 3) true)
    (object_hide (cinematic_scripting_get_object 8 0 4) true)
    (object_hide (cinematic_scripting_get_object 8 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 7 "sc140_broken_9" true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (sleep 1)
    (cinematic_scripting_start_dialogue 8 0 8 0 none)
    (sleep 36)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb_01_sh10
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8 0) 9 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 9)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "player_10" true)
    (object_hide (cinematic_scripting_get_object 8 0 1) true)
    (object_hide (cinematic_scripting_get_object 8 0 2) true)
    (object_hide (cinematic_scripting_get_object 8 0 3) true)
    (object_hide (cinematic_scripting_get_object 8 0 4) true)
    (object_hide (cinematic_scripting_get_object 8 0 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "anchor_10" true)
    (object_hide (cinematic_scripting_get_object 8 0 7) true)
    (cinematic_lights_initialize_for_shot 9)
    (cinematic_clips_initialize_for_shot 9)
    (sleep 35)
    (cinematic_scripting_start_dialogue 8 0 9 0 none)
    (sleep 49)
    (cinematic_scripting_start_dialogue 8 0 9 1 none)
    (sleep 27)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 60)
    (sleep 11)
    (cinematic_scripting_start_dialogue 8 0 9 2 none)
    (sleep 1)
    (sound_class_set_gain "amb" 0.0 120)
    (cinematic_print "custom script play")
    (sleep 120)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc140_int_hb_01
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8 0) 0)
    (sc140_int_hb_01_sh1)
    (sc140_int_hb_01_sh2)
    (sc140_int_hb_01_sh3)
    (sc140_int_hb_01_sh4)
    (sc140_int_hb_01_sh5)
    (sc140_int_hb_01_sh6)
    (sc140_int_hb_01_sh7)
    (sc140_int_hb_01_sh8)
    (sc140_int_hb_01_sh9)
    (sc140_int_hb_01_sh10)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 8 0 0)
    (cinematic_scripting_destroy_object 8 0 1)
    (cinematic_scripting_destroy_object 8 0 2)
    (cinematic_scripting_destroy_object 8 0 3)
    (cinematic_scripting_destroy_object 8 0 4)
    (cinematic_scripting_destroy_object 8 0 5)
    (cinematic_scripting_destroy_object 8 0 6)
    (cinematic_scripting_destroy_object 8 0 7)
)

(script static void sc140_int_hb_cleanup
    (cinematic_scripting_clean_up 8)
)

(script static void begin_sc140_int_hb_debug
    (cinematic_zone_activate_for_debugging 8)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 8))
)

(script static void end_sc140_int_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 8)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc140_int_hb_debug
    (begin_sc140_int_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (!sc140_int_hb_01)
    (end_sc140_int_hb_debug)
)

(script static void begin_sc140_int_hb
    (cinematic_zone_activate 8)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 8))
)

(script static void end_sc140_int_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_int_hb
    (begin_sc140_int_hb)
    (fade_in 0.0 0.0 0.0 0)
    (!sc140_int_hb_01)
    (end_sc140_int_hb)
)

(script static void sc140_out_hb_sc_sh1
    (fade_in 0.0 0.0 0.0 40)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 9 0) 0 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 9 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 1 "light_1" true)
    (object_hide (cinematic_scripting_get_object 9 0 2) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 3)
    (cinematic_scripting_start_music 9 0 0 0)
    (sleep 182)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb_sc_sh2
    (set render_lightmap_shadows false)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 9 0) 1 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 9 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 1 "light_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 2 "sc140_broken_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 129)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 9 0) 2 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 9 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 1 "light_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 2 "sc140_broken_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 287)
    (fade_out 0.0 0.0 0.0 10)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc140_out_hb_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 9 0) 0)
    (sc140_out_hb_sc_sh1)
    (sc140_out_hb_sc_sh2)
    (sc140_out_hb_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 9 0 0)
    (cinematic_scripting_destroy_object 9 0 1)
    (cinematic_scripting_destroy_object 9 0 2)
)

(script static void sc140_out_hb_cleanup
    (cinematic_scripting_clean_up 9)
)

(script static void begin_sc140_out_hb_debug
    (cinematic_zone_activate_for_debugging 9)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 9))
)

(script static void end_sc140_out_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 9)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc140_out_hb_debug
    (begin_sc140_out_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc140_out_hb_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc140_out_hb_debug)
)

(script static void begin_sc140_out_hb
    (cinematic_zone_activate 9)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 9))
)

(script static void end_sc140_out_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb
    (begin_sc140_out_hb)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc140_out_hb_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc140_out_hb)
)

(script static void sc150_int_hb_01_sc_sh1
    (fade_in 0.0 0.0 0.0 5)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 10 0) 0 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 1 "biofoam01_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 3)
    (cinematic_scripting_start_music 10 0 0 0)
    (sleep 75)
    (cinematic_scripting_start_dialogue 10 0 0 0 none)
    (sleep 8)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_int_hb_01_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 10 0) 1 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 1 "biofoam01_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_autoexposure_instant 1)
    (sleep 18)
    (cinematic_scripting_start_dialogue 10 0 1 0 none)
    (sleep 66)
    (cinematic_scripting_stop_music 10 0 1 0)
    (sleep 35)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_int_hb_01_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 10 0) 2 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 1 "biofoam01_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_autoexposure_instant 1)
    (sleep 19)
    (cinematic_scripting_start_dialogue 10 0 2 0 none)
    (sleep 71)
    (cinematic_scripting_start_dialogue 10 0 2 1 none)
    (sleep 64)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_int_hb_01_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 10 0) 3 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 0 "player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 1 "biofoam01_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 20)
    (sound_class_set_gain "amb" 0.0 150)
    (cinematic_print "custom script play")
    (sleep 50)
    (cinematic_print "custom script play")
    (fade_out 0.0 0.0 0.0 40)
    (sleep 40)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc150_int_hb_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10 0) 0)
    (sc150_int_hb_01_sc_sh1)
    (sc150_int_hb_01_sc_sh2)
    (sc150_int_hb_01_sc_sh3)
    (sc150_int_hb_01_sc_sh4)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 10 0 0)
    (cinematic_scripting_destroy_object 10 0 1)
)

(script static void sc150_int_hb_cleanup
    (cinematic_scripting_clean_up 10)
)

(script static void begin_sc150_int_hb_debug
    (cinematic_zone_activate_for_debugging 10)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 10))
)

(script static void end_sc150_int_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 10)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc150_int_hb_debug
    (begin_sc150_int_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (!sc150_int_hb_01_sc)
    (end_sc150_int_hb_debug)
)

(script static void begin_sc150_int_hb
    (cinematic_zone_activate 10)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 10))
)

(script static void end_sc150_int_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_int_hb
    (begin_sc150_int_hb)
    (fade_in 0.0 0.0 0.0 0)
    (!sc150_int_hb_01_sc)
    (end_sc150_int_hb)
)

(script static void sc150_out_hb_sc_sh1
    (fade_in 0.0 0.0 0.0 60)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 11 0) 0 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 11 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 1 "biofoam_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 3)
    (cinematic_scripting_start_music 11 0 0 0)
    (sleep 141)
    (cinematic_scripting_start_effect 11 0 0 0 (cinematic_object_get "biofoam"))
    (sleep 144)
    (fade_out 0.0 0.0 0.0 10)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc150_out_hb_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 11 0) 0)
    (sc150_out_hb_sc_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 11 0 0)
    (cinematic_scripting_destroy_object 11 0 1)
)

(script static void sc150_out_hb_cleanup
    (cinematic_scripting_clean_up 11)
)

(script static void begin_sc150_out_hb_debug
    (cinematic_zone_activate_for_debugging 11)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 11))
)

(script static void end_sc150_out_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 11)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc150_out_hb_debug
    (begin_sc150_out_hb_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc150_out_hb_sc)
    (end_sc150_out_hb_debug)
)

(script static void begin_sc150_out_hb
    (cinematic_zone_activate 11)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 11))
)

(script static void end_sc150_out_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_out_hb
    (begin_sc150_out_hb)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc150_out_hb_sc)
    (end_sc150_out_hb)
)

(script static void l200_int_hb_01_sc_sh1
    (set render_lightmap_shadows false)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 0 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 1)
    (cinematic_scripting_start_music 12 0 0 0)
    (cinematic_scripting_stop_music 12 0 0 2)
    (cinematic_scripting_stop_music 12 0 0 6)
    (cinematic_scripting_stop_music 12 0 0 5)
    (cinematic_scripting_stop_music 12 0 0 7)
    (cinematic_scripting_stop_music 12 0 0 4)
    (cinematic_scripting_start_music 12 0 0 1)
    (cinematic_scripting_stop_music 12 0 0 3)
    (sleep 109)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 1 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 90)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 2 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 111)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 3 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (sleep 56)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 4 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 4)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (sleep 17)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 5 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 5)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (sleep 19)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 6 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 6)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (sleep 62)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 7 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 7)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (sleep 2)
    (cinematic_scripting_stop_music 12 0 7 0)
    (sleep 38)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 8 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 8)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_9" true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (sleep 90)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_int_hb_01_sc_sh10
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12 0) 9 "fl_shaft_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 9)
    (cinematic_object_create_cinematic_anchor "fl_shaft_cinematic_anchor" "fl_shaft_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "l200_int_hb_01_cin_player1_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "l200_int_hb_01_cin_cable1_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "l200_int_hb_01_cin_cable2_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "l200_int_hb_01_cin_cable3_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "l200_int_hb_01_cin_cable4_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "l200_int_hb_01_cin_cable5_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "l200_int_hb_01_cin_cable6_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "l200_int_hb_01_cin_cable7_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "l200_int_hb_01_cin_cable8_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "l200_int_hb_01_cin_cable9_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "l200_int_hb_01_cin_cable10_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 11 "l200_int_hb_01_cin_smg1_10" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 12 "l200_shaft_card_10" true)
    (cinematic_lights_initialize_for_shot 9)
    (cinematic_clips_initialize_for_shot 9)
    (sleep 111)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 60)
    (sleep 60)
    (sleep 38)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !l200_int_hb_01_sc
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12 0) 0)
    (l200_int_hb_01_sc_sh1)
    (l200_int_hb_01_sc_sh2)
    (l200_int_hb_01_sc_sh3)
    (l200_int_hb_01_sc_sh4)
    (l200_int_hb_01_sc_sh5)
    (l200_int_hb_01_sc_sh6)
    (l200_int_hb_01_sc_sh7)
    (l200_int_hb_01_sc_sh8)
    (l200_int_hb_01_sc_sh9)
    (l200_int_hb_01_sc_sh10)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 12 0 0)
    (cinematic_scripting_destroy_object 12 0 1)
    (cinematic_scripting_destroy_object 12 0 2)
    (cinematic_scripting_destroy_object 12 0 3)
    (cinematic_scripting_destroy_object 12 0 4)
    (cinematic_scripting_destroy_object 12 0 5)
    (cinematic_scripting_destroy_object 12 0 6)
    (cinematic_scripting_destroy_object 12 0 7)
    (cinematic_scripting_destroy_object 12 0 8)
    (cinematic_scripting_destroy_object 12 0 9)
    (cinematic_scripting_destroy_object 12 0 10)
    (cinematic_scripting_destroy_object 12 0 11)
    (cinematic_scripting_destroy_object 12 0 12)
)

(script static void l200_intro_hb_cleanup
    (cinematic_scripting_clean_up 12)
)

(script static void begin_l200_intro_hb_debug
    (cinematic_zone_activate_for_debugging 12)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 12))
)

(script static void end_l200_intro_hb_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 12)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void l200_intro_hb_debug
    (begin_l200_intro_hb_debug)
    (fade_in 0.0 0.0 0.0 30)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!l200_int_hb_01_sc)
    (sound_class_set_gain "" 0.0 0)
    (end_l200_intro_hb_debug)
)

(script static void begin_l200_intro_hb
    (cinematic_zone_activate 12)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 12))
)

(script static void end_l200_intro_hb
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void l200_intro_hb
    (begin_l200_intro_hb)
    (fade_in 0.0 0.0 0.0 30)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "amb" 1.0 0)
        (sound_class_set_gain "amb" 0.0 60)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!l200_int_hb_01_sc)
    (sound_class_set_gain "" 0.0 0)
    (end_l200_intro_hb)
)

(script static void sc100_out_hb_01_sc_alt_sh1
    (fade_in 0.0 0.0 0.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 13 0) 0 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 0 "cin_player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 1 "cin_damaged_helmet_1" true)
    (object_hide (cinematic_scripting_get_object 13 0 2) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 1)
    (cinematic_scripting_start_music 13 0 0 0)
    (sleep 69)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb_01_sc_alt_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 13 0) 1 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 0 "cin_player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 1 "cin_damaged_helmet_2" true)
    (object_hide (cinematic_scripting_get_object 13 0 2) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_autoexposure_instant 1)
    (sleep 50)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb_01_sc_alt_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 13 0) 2 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 0 "cin_player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 1 "cin_damaged_helmet_3" true)
    (object_hide (cinematic_scripting_get_object 13 0 2) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_autoexposure_instant 1)
    (sleep 40)
    (cinematic_scripting_start_dialogue 13 0 2 0 none)
    (sleep 82)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb_01_sc_alt_sh4
    (begin
        (object_create "dm_sc100_out_hb_sign_01")
        (object_create "dm_sc100_out_hb_sign_02")
        (object_create "dm_sc100_out_hb_sign_03")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 13 0) 3 "fl_sc100_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13 0) 3)
    (cinematic_object_create_cinematic_anchor "fl_sc100_cinematic_anchor" "fl_sc100_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 0 "cin_player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 1 "cin_damaged_helmet_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 2 "cin_smg1_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_autoexposure_instant 1)
    (sleep 16)
    (cinematic_scripting_start_dialogue 13 0 3 0 none)
    (sleep 54)
    (device_set_position_immediate "dm_sc100_out_hb_sign_01" 1.0)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_print "custom script play")
    (device_set_position_immediate "dm_sc100_out_hb_sign_02" 1.0)
    (sleep 10)
    (device_set_position_immediate "dm_sc100_out_hb_sign_03" 1.0)
    (cinematic_print "custom script play")
    (sleep 40)
    (cinematic_print "custom script play")
    (device_set_position_immediate "dm_sc100_out_hb_sign_01" 1.0)
    (sleep 10)
    (device_set_position_immediate "dm_sc100_out_hb_sign_02" 1.0)
    (cinematic_print "custom script play")
    (sleep 10)
    (cinematic_print "custom script play")
    (device_set_position_immediate "dm_sc100_out_hb_sign_03" 1.0)
    (sleep 18)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc100_out_hb_01_sc_alt
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13 0) 0)
    (sc100_out_hb_01_sc_alt_sh1)
    (sc100_out_hb_01_sc_alt_sh2)
    (sc100_out_hb_01_sc_alt_sh3)
    (sc100_out_hb_01_sc_alt_sh4)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 13 0 0)
    (cinematic_scripting_destroy_object 13 0 1)
    (cinematic_scripting_destroy_object 13 0 2)
)

(script static void sc100_out_hb_alt_cleanup
    (cinematic_scripting_clean_up 13)
)

(script static void begin_sc100_out_hb_alt_debug
    (cinematic_zone_activate_for_debugging 13)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 13))
)

(script static void end_sc100_out_hb_alt_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 13)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc100_out_hb_alt_debug
    (begin_sc100_out_hb_alt_debug)
    (fade_in 1.0 1.0 1.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc100_out_hb_01_sc_alt)
    (sound_class_set_gain "" 1.0 60)
    (end_sc100_out_hb_alt_debug)
)

(script static void begin_sc100_out_hb_alt
    (cinematic_zone_activate 13)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 13))
)

(script static void end_sc100_out_hb_alt
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc100_out_hb_alt
    (begin_sc100_out_hb_alt)
    (fade_in 1.0 1.0 1.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc100_out_hb_01_sc_alt)
    (sound_class_set_gain "" 1.0 60)
    (end_sc100_out_hb_alt)
)

(script static void sc110_out_hb_sc_00_alt_sh1
    (fade_in 0.0 0.0 0.0 30)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 14 0) 0 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 14 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 0 1 "optics_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 0 2 "silenced_smg_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 3)
    (cinematic_scripting_start_music 14 0 0 0)
    (sleep 181)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_hb_sc_00_alt_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 14 0) 1 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 14 0 0 "player_2" true)
    (object_hide (cinematic_scripting_get_object 14 0 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 0 2 "silenced_smg_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_autoexposure_instant 1)
    (sleep 117)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_hb_sc_00_alt
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 0) 0)
    (sc110_out_hb_sc_00_alt_sh1)
    (sc110_out_hb_sc_00_alt_sh2)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 14 0 0)
    (cinematic_scripting_destroy_object 14 0 1)
    (cinematic_scripting_destroy_object 14 0 2)
)

(script static void sc110_out_hb_alt_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 14 1) 0 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 1) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 0 "player_alt_1" true)
    (object_hide (cinematic_scripting_get_object 14 1 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 2 "silenced_smg_alt_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 3 "optics_alt_1" true)
    (object_hide (cinematic_scripting_get_object 14 1 4) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 3)
    (cinematic_scripting_start_dialogue 14 1 0 0 none)
    (cinematic_scripting_start_music 14 1 0 0)
    (sleep 98)
    (cinematic_scripting_start_dialogue 14 1 0 1 none)
    (sleep 128)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_hb_alt_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 14 1) 1 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 1) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 0 "player_alt_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 1 "phantom_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 2 "silenced_smg_alt_2" true)
    (object_hide (cinematic_scripting_get_object 14 1 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 4 "sc110_chin_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (object_clear_function_variable (cinematic_scripting_get_object 14 1 4) "searchlight")
    (sleep 25)
    (object_set_function_variable (cinematic_scripting_get_object 14 1 4) "searchlight" 1.0 0.0)
    (sleep 65)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_hb_alt_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 14 1) 2 "fl_sc110_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 1) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc110_cinematic_anchor" "fl_sc110_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 0 "player_alt_3" true)
    (object_hide (cinematic_scripting_get_object 14 1 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 14 1 2 "silenced_smg_alt_3" true)
    (object_hide (cinematic_scripting_get_object 14 1 3) true)
    (object_hide (cinematic_scripting_get_object 14 1 4) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 67)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc110_out_hb_alt_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 14 1) 0)
    (sc110_out_hb_alt_sc_sh1)
    (sc110_out_hb_alt_sc_sh2)
    (sc110_out_hb_alt_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 14 1 0)
    (cinematic_scripting_destroy_object 14 1 1)
    (cinematic_scripting_destroy_object 14 1 2)
    (cinematic_scripting_destroy_object 14 1 3)
    (cinematic_scripting_destroy_object 14 1 4)
)

(script static void sc110_out_hb_alt_cleanup
    (cinematic_scripting_clean_up 14)
)

(script static void begin_sc110_out_hb_alt_debug
    (cinematic_zone_activate_for_debugging 14)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 14))
)

(script static void end_sc110_out_hb_alt_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 14)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc110_out_hb_alt_debug
    (begin_sc110_out_hb_alt_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc110_out_hb_sc_00_alt)
    (!sc110_out_hb_alt_sc)
    (end_sc110_out_hb_alt_debug)
)

(script static void begin_sc110_out_hb_alt
    (cinematic_zone_activate 14)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 14))
)

(script static void end_sc110_out_hb_alt
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc110_out_hb_alt
    (begin_sc110_out_hb_alt)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc110_out_hb_sc_00_alt)
    (!sc110_out_hb_alt_sc)
    (end_sc110_out_hb_alt)
)

(script static void sc120_out_hb_sc_00_alt_sh1
    (begin
        (fade_in 0.0 0.0 0.0 15)
        (set render_lightmap_shadows false)
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 15 0) 0 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 15 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 0 1 "turret_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 5)
    (cinematic_scripting_start_music 15 0 0 0)
    (sleep 29)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb_sc_00_alt_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 15 0) 1 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 15 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 0 1 "turret_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 138)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb_sc_00_alt_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 15 0) 2 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 15 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 0 1 "turret_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 114)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc120_out_hb_sc_00_alt
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 0) 0)
    (sc120_out_hb_sc_00_alt_sh1)
    (sc120_out_hb_sc_00_alt_sh2)
    (sc120_out_hb_sc_00_alt_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 15 0 0)
    (cinematic_scripting_destroy_object 15 0 1)
)

(script static void sc120_out_hb_alt_sc_sh1
    (set render_lightmap_shadows false)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 15 1) 0 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 1) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 0 "turret_1" true)
    (object_hide (cinematic_scripting_get_object 15 1 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 2 "player_smg_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 3 "player_1" true)
    (object_hide (cinematic_scripting_get_object 15 1 4) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 3)
    (cinematic_scripting_start_dialogue 15 1 0 0 none)
    (sleep 2)
    (cinematic_scripting_start_music 15 1 0 0)
    (sleep 96)
    (cinematic_scripting_start_dialogue 15 1 0 1 none)
    (sleep 128)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb_alt_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 15 1) 1 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 1) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (object_hide (cinematic_scripting_get_object 15 1 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 1 "phantom_2" true)
    (object_hide (cinematic_scripting_get_object 15 1 2) true)
    (object_hide (cinematic_scripting_get_object 15 1 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 4 "sc120_chin_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (object_clear_function_variable (cinematic_scripting_get_object 15 1 4) "searchlight")
    (sleep 30)
    (object_set_function_variable (cinematic_scripting_get_object 15 1 4) "searchlight" 1.0 0.0)
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb_alt_sc_sh3
    (set render_lightmap_shadows false)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 15 1) 2 "fl_sc120_int_cinematic")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 1) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc120_int_cinematic" "fl_sc120_int_cinematic")
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 0 "turret_3" true)
    (object_hide (cinematic_scripting_get_object 15 1 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 2 "player_smg_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 15 1 3 "player_3" true)
    (object_hide (cinematic_scripting_get_object 15 1 4) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 69)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc120_out_hb_alt_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 15 1) 0)
    (sc120_out_hb_alt_sc_sh1)
    (sc120_out_hb_alt_sc_sh2)
    (sc120_out_hb_alt_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 15 1 0)
    (cinematic_scripting_destroy_object 15 1 1)
    (cinematic_scripting_destroy_object 15 1 2)
    (cinematic_scripting_destroy_object 15 1 3)
    (cinematic_scripting_destroy_object 15 1 4)
)

(script static void sc120_out_hb_alt_cleanup
    (cinematic_scripting_clean_up 15)
)

(script static void begin_sc120_out_hb_alt_debug
    (cinematic_zone_activate_for_debugging 15)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 15))
)

(script static void end_sc120_out_hb_alt_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 15)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc120_out_hb_alt_debug
    (begin_sc120_out_hb_alt_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc120_out_hb_sc_00_alt)
    (!sc120_out_hb_alt_sc)
    (end_sc120_out_hb_alt_debug)
)

(script static void begin_sc120_out_hb_alt
    (cinematic_zone_activate 15)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 15))
)

(script static void end_sc120_out_hb_alt
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc120_out_hb_alt
    (begin_sc120_out_hb_alt)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc120_out_hb_sc_00_alt)
    (!sc120_out_hb_alt_sc)
    (end_sc120_out_hb_alt)
)

(script static void sc130_out_hb_01_sc_alt_sh1
    (fade_out 0.0 0.0 0.0 0)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 16 0) 0 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 1 "detonator_1" true)
    (object_hide (cinematic_scripting_get_object 16 0 2) true)
    (object_hide (cinematic_scripting_get_object 16 0 3) true)
    (object_hide (cinematic_scripting_get_object 16 0 4) true)
    (object_hide (cinematic_scripting_get_object 16 0 5) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 2)
    (cinematic_scripting_start_music 16 0 0 0)
    (sleep 98)
    (fade_in 0.0 0.0 0.0 15)
    (cinematic_print "custom script play")
    (sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb_01_sc_alt_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 16 0) 1 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 1 "detonator_2" true)
    (object_hide (cinematic_scripting_get_object 16 0 2) true)
    (object_hide (cinematic_scripting_get_object 16 0 3) true)
    (object_hide (cinematic_scripting_get_object 16 0 4) true)
    (object_hide (cinematic_scripting_get_object 16 0 5) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 156)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb_01_sc_alt_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 16 0) 2 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 1 "detonator_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 2 "detonatorsplash_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 3 "detonatorsplash_02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 4 "detonatorsplash_03_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 0 5 "detonatorsplash_04_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 37)
    (cinematic_scripting_start_effect 16 0 2 0 (cinematic_object_get "detonatorsplash_01"))
    (sleep 20)
    (cinematic_scripting_start_effect 16 0 2 1 (cinematic_object_get "detonatorsplash_02"))
    (sleep 13)
    (cinematic_scripting_start_effect 16 0 2 2 (cinematic_object_get "detonatorsplash_03"))
    (sleep 8)
    (cinematic_scripting_start_effect 16 0 2 3 (cinematic_object_get "detonatorsplash_04"))
    (sleep 33)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc130_out_hb_01_sc_alt
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 0) 0)
    (sc130_out_hb_01_sc_alt_sh1)
    (sc130_out_hb_01_sc_alt_sh2)
    (sc130_out_hb_01_sc_alt_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 16 0 0)
    (cinematic_scripting_destroy_object 16 0 1)
    (cinematic_scripting_destroy_object 16 0 2)
    (cinematic_scripting_destroy_object 16 0 3)
    (cinematic_scripting_destroy_object 16 0 4)
    (cinematic_scripting_destroy_object 16 0 5)
)

(script static void sc130_out_hb_alt_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 16 1) 0 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 1) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (object_hide (cinematic_scripting_get_object 16 1 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 1 1 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 1 2 "player_smg_1" true)
    (object_hide (cinematic_scripting_get_object 16 1 3) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 3)
    (cinematic_scripting_start_dialogue 16 1 0 0 none)
    (sleep 54)
    (cinematic_scripting_start_music 16 1 0 0)
    (sleep 44)
    (cinematic_scripting_start_dialogue 16 1 0 1 none)
    (sleep 128)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb_alt_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 16 1) 1 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 1) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 16 1 0 "phantom_2" true)
    (object_hide (cinematic_scripting_get_object 16 1 1) true)
    (object_hide (cinematic_scripting_get_object 16 1 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 1 3 "sc130_chin_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (object_clear_function_variable (cinematic_scripting_get_object 16 1 3) "searchlight")
    (sleep 31)
    (object_set_function_variable (cinematic_scripting_get_object 16 1 3) "searchlight" 1.0 0.0)
    (sleep 59)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb_alt_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 16 1) 2 "fl_sc130_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 1) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc130_cinematic_anchor" "fl_sc130_cinematic_anchor")
    (object_hide (cinematic_scripting_get_object 16 1 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 1 1 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 16 1 2 "player_smg_3" true)
    (object_hide (cinematic_scripting_get_object 16 1 3) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 69)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc130_out_hb_alt_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 16 1) 0)
    (sc130_out_hb_alt_sc_sh1)
    (sc130_out_hb_alt_sc_sh2)
    (sc130_out_hb_alt_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 16 1 0)
    (cinematic_scripting_destroy_object 16 1 1)
    (cinematic_scripting_destroy_object 16 1 2)
    (cinematic_scripting_destroy_object 16 1 3)
)

(script static void sc130_out_hb_alt_cleanup
    (cinematic_scripting_clean_up 16)
)

(script static void begin_sc130_out_hb_alt_debug
    (cinematic_zone_activate_for_debugging 16)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 16))
)

(script static void end_sc130_out_hb_alt_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 16)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc130_out_hb_alt_debug
    (begin_sc130_out_hb_alt_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc130_out_hb_01_sc_alt)
    (!sc130_out_hb_alt_sc)
    (end_sc130_out_hb_alt_debug)
)

(script static void begin_sc130_out_hb_alt
    (cinematic_zone_activate 16)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 16))
)

(script static void end_sc130_out_hb_alt
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc130_out_hb_alt
    (begin_sc130_out_hb_alt)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc130_out_hb_01_sc_alt)
    (!sc130_out_hb_alt_sc)
    (end_sc130_out_hb_alt)
)

(script static void sc140_out_hb_sc_00_alt_sh1
    (fade_in 0.0 0.0 0.0 40)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 17 0) 0 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 1 "light_1" true)
    (object_hide (cinematic_scripting_get_object 17 0 2) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 3)
    (cinematic_scripting_start_music 17 0 0 0)
    (sleep 182)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb_sc_00_alt_sh2
    (set render_lightmap_shadows false)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 17 0) 1 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 0) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 0 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 1 "light_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 2 "sc140_broken_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (sleep 129)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb_sc_00_alt_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 17 0) 2 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 0) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 0 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 1 "light_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 0 2 "sc140_broken_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 297)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc140_out_hb_sc_00_alt
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 0) 0)
    (sc140_out_hb_sc_00_alt_sh1)
    (sc140_out_hb_sc_00_alt_sh2)
    (sc140_out_hb_sc_00_alt_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 17 0 0)
    (cinematic_scripting_destroy_object 17 0 1)
    (cinematic_scripting_destroy_object 17 0 2)
)

(script static void sc140_out_hb_alt_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 17 1) 0 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 1) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 17 1 0 "player_1" true)
    (object_hide (cinematic_scripting_get_object 17 1 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 1 2 "player_smg_1" true)
    (object_hide (cinematic_scripting_get_object 17 1 3) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 2)
    (cinematic_scripting_start_music 17 1 0 0)
    (sleep 1)
    (cinematic_scripting_start_dialogue 17 1 0 0 none)
    (sleep 98)
    (cinematic_scripting_start_dialogue 17 1 0 1 none)
    (sleep 128)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb_alt_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 17 1) 1 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 1) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (object_hide (cinematic_scripting_get_object 17 1 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 1 1 "phantom_2" true)
    (object_hide (cinematic_scripting_get_object 17 1 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 1 3 "sc140_chin_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (object_clear_function_variable (cinematic_scripting_get_object 17 1 3) "searchlight")
    (sleep 33)
    (object_set_function_variable (cinematic_scripting_get_object 17 1 3) "searchlight" 1.0 0.0)
    (sleep 57)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb_alt_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 17 1) 2 "fl_sc140_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 1) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc140_cinematic_anchor" "fl_sc140_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 17 1 0 "player_3" true)
    (object_hide (cinematic_scripting_get_object 17 1 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 17 1 2 "player_smg_3" true)
    (object_hide (cinematic_scripting_get_object 17 1 3) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 69)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc140_out_hb_alt_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 17 1) 0)
    (sc140_out_hb_alt_sc_sh1)
    (sc140_out_hb_alt_sc_sh2)
    (sc140_out_hb_alt_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 17 1 0)
    (cinematic_scripting_destroy_object 17 1 1)
    (cinematic_scripting_destroy_object 17 1 2)
    (cinematic_scripting_destroy_object 17 1 3)
)

(script static void sc140_out_hb_alt_cleanup
    (cinematic_scripting_clean_up 17)
)

(script static void begin_sc140_out_hb_alt_debug
    (cinematic_zone_activate_for_debugging 17)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 17))
)

(script static void end_sc140_out_hb_alt_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 17)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc140_out_hb_alt_debug
    (begin_sc140_out_hb_alt_debug)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc140_out_hb_sc_00_alt)
    (!sc140_out_hb_alt_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc140_out_hb_alt_debug)
)

(script static void begin_sc140_out_hb_alt
    (cinematic_zone_activate 17)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 17))
)

(script static void end_sc140_out_hb_alt
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc140_out_hb_alt
    (begin_sc140_out_hb_alt)
    (fade_in 0.0 0.0 0.0 0)
    (begin
        (sound_class_set_gain "" 0.0 0)
        (sound_class_set_gain "scripted" 1.0 0)
        (sound_class_set_gain "dialog" 1.0 0)
        (sound_class_set_gain "mus" 1.0 0)
    )
    (!sc140_out_hb_sc_00_alt)
    (!sc140_out_hb_alt_sc)
    (sound_class_set_gain "" 1.0 60)
    (end_sc140_out_hb_alt)
)

(script static void sc150_out_hb_sc_00_alt_sh1
    (fade_in 0.0 0.0 0.0 60)
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 18 0) 0 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 18 0) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 18 0 0 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 18 0 1 "biofoam_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_autoexposure_instant 1)
    (sleep 3)
    (cinematic_scripting_start_music 18 0 0 0)
    (sleep 141)
    (cinematic_scripting_start_effect 18 0 0 0 (cinematic_object_get "biofoam"))
    (sleep 154)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc150_out_hb_sc_00_alt
    (cinematic_print "beginning scene 1")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 18 0) 0)
    (sc150_out_hb_sc_00_alt_sh1)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 18 0 0)
    (cinematic_scripting_destroy_object 18 0 1)
)

(script static void sc150_out_hb_alt_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 18 1) 0 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 18 1) 0)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (object_hide (cinematic_scripting_get_object 18 1 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 18 1 1 "player_smg_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 18 1 2 "player_1" true)
    (object_hide (cinematic_scripting_get_object 18 1 3) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (sleep 3)
    (cinematic_scripting_start_dialogue 18 1 0 0 none)
    (sleep 27)
    (cinematic_scripting_start_music 18 1 0 0)
    (sleep 71)
    (cinematic_scripting_start_dialogue 18 1 0 1 none)
    (sleep 128)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_out_hb_alt_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 18 1) 1 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 18 1) 1)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 18 1 0 "phantom_2" true)
    (object_hide (cinematic_scripting_get_object 18 1 1) true)
    (object_hide (cinematic_scripting_get_object 18 1 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 18 1 3 "sc150_chin_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (object_clear_function_variable (cinematic_scripting_get_object 18 1 3) "searchlight")
    (sleep 33)
    (object_set_function_variable (cinematic_scripting_get_object 18 1 3) "searchlight" 1.0 0.0)
    (sleep 57)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_out_hb_alt_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 18 1) 2 "fl_sc150_cinematic_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 18 1) 2)
    (cinematic_object_create_cinematic_anchor "fl_sc150_cinematic_anchor" "fl_sc150_cinematic_anchor")
    (object_hide (cinematic_scripting_get_object 18 1 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 18 1 1 "player_smg_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 18 1 2 "player_3" true)
    (object_hide (cinematic_scripting_get_object 18 1 3) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (sleep 69)
    (cinematic_scripting_fade_out 0.0 0.0 0.0 10)
    (sleep 10)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !sc150_out_hb_alt_sc
    (cinematic_print "beginning scene 2")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 18 1) 0)
    (sc150_out_hb_alt_sc_sh1)
    (sc150_out_hb_alt_sc_sh2)
    (sc150_out_hb_alt_sc_sh3)
    (cinematic_lights_destroy)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
    (cinematic_scripting_destroy_object 18 1 0)
    (cinematic_scripting_destroy_object 18 1 1)
    (cinematic_scripting_destroy_object 18 1 2)
    (cinematic_scripting_destroy_object 18 1 3)
)

(script static void sc150_out_hb_alt_cleanup
    (cinematic_scripting_clean_up 18)
)

(script static void begin_sc150_out_hb_alt_debug
    (cinematic_zone_activate_for_debugging 18)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 2)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0.0 0.0)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 18))
)

(script static void end_sc150_out_hb_alt_debug
    (cinematic_destroy)
    (chud_cinematic_fade 1.0 0.0)
    (cinematic_stop)
    (cinematic_show_letterbox_immediate false)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 18)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void sc150_out_hb_alt_debug
    (begin_sc150_out_hb_alt_debug)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc150_out_hb_sc_00_alt)
    (!sc150_out_hb_alt_sc)
    (end_sc150_out_hb_alt_debug)
)

(script static void begin_sc150_out_hb_alt
    (cinematic_zone_activate 18)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 18))
)

(script static void end_sc150_out_hb_alt
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void sc150_out_hb_alt
    (begin_sc150_out_hb_alt)
    (fade_in 0.0 0.0 0.0 0)
    (sound_class_set_gain "amb" 1.0 60)
    (!sc150_out_hb_sc_00_alt)
    (!sc150_out_hb_alt_sc)
    (end_sc150_out_hb_alt)
)

