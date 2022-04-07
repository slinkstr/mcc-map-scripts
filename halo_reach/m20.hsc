; Decompiled with Blamite
; Source file: m20.hsc
; Start time: 4/7/2022 7:06:15
; Decompilation finished in ~0.0189778s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global boolean b_debug_fork true)
(global boolean b_debug_phantom false)
(global boolean b_debug_globals false)
(global short player_00 0)
(global short player_01 1)
(global short player_02 2)
(global short player_03 3)
(global short s_md_play_time 0)
(global string data_mine_mission_segment "")
(global boolean b_debug_cinematic_scripts true)
(global boolean b_cinematic_entered false)
(global sound sfx_a_button none)
(global sound sfx_b_button none)
(global sound sfx_hud_in none)
(global sound sfx_hud_out none)
(global sound sfx_objective none)
(global sound sfx_tutorial_complete "sound\game_sfx\ui\pda_transition.sound")
(global sound sfx_blip "sound\game_sfx\ui\transition_beeps")
(global object_list l_blip_list (players))
(global boolean b_blip_list_locked false)
(global short s_blip_list_index 0)
(global short blip_neutralize 0)
(global short blip_defend 1)
(global short blip_ordnance 2)
(global short blip_interface 3)
(global short blip_recon 4)
(global short blip_recover 5)
(global short blip_structure 6)
(global short blip_neutralize_alpha 7)
(global short blip_neutralize_bravo 8)
(global short blip_neutralize_charlie 9)
(global short blip_ammo 13)
(global short blip_hostile_vehicle 14)
(global short blip_hostile 15)
(global short blip_default_a 17)
(global short blip_default_b 18)
(global short blip_default_c 19)
(global short blip_default_d 20)
(global short blip_default 21)
(global short blip_destination 21)
(global boolean b_is_dialogue_playing false)
(global boolean b_debug true)
(global boolean b_breakpoints false)
(global boolean b_md_print true)
(global boolean b_debug_objectives false)
(global boolean b_editor (editor_mode))
(global boolean b_game_emulate false)
(global boolean b_cinematics true)
(global boolean b_editor_cinematics false)
(global boolean b_encounters true)
(global boolean b_dialogue true)
(global boolean b_skip_intro false)
(global boolean b_landed false)
(global boolean b_mission_started false)
(global short s_insertion_index 0)
(global short s_court_ins_idx 1)
(global short s_valley_ins_idx 2)
(global short s_return_ins_idx 3)
(global short s_garage_ins_idx 4)
(global short s_sword_ins_idx 5)
(global short s_objcon_court -1)
(global short s_objcon_valley -1)
(global short s_objcon_gate -1)
(global short s_objcon_far -1)
(global short s_objcon_air -1)
(global short s_objcon_return -1)
(global short s_objcon_garage -1)
(global short s_objcon_sword -1)
(global short s_objcon_roof -1)
(global boolean b_court_ready false)
(global boolean b_valley_ready false)
(global boolean b_gate_ready false)
(global boolean b_far_ready false)
(global boolean b_air_ready false)
(global boolean b_garage_ready false)
(global boolean b_sword_ready false)
(global boolean b_roof_ready false)
(global short s_zoneset_intro_cinematic 0)
(global short s_zoneset_courtyard_valley 1)
(global short s_zoneset_exterior 2)
(global short s_zoneset_courtyard_return 3)
(global short s_zoneset_interior 4)
(global short s_zoneset_end_cinematic 5)
(global short s_zoneset_courtyard_valley_re 6)
(global short s_zoneset_courtyard 7)
(global short s_zoneset_all 8)
(global short s_fireteam_max 3)
(global real r_fireteam_dist 2.0)
(global boolean b_mission_complete false)
(global boolean b_court_defended false)
(global boolean b_far_defended false)
(global boolean b_air_defended false)
(global boolean b_corvette_destroyed false)
(global boolean b_radio_chatter false)
(global object o_emile none)
(global object o_kat none)
(global object o_jorge none)
(global object o_jun none)
(global object o_corvette_aa_01 none)
(global object o_corvette_aa_02 none)
(global ai ai_emile none)
(global ai ai_kat none)
(global ai ai_jorge none)
(global ai ai_jun none)
(global boolean b_wave_spawning false)
(global short s_wave_spawning 0)
(global short s_waypoint_timer 90)
(global boolean b_insertion_fade_in false)
(global boolean b_jun_blip false)
(global boolean b_jun_unblip false)
(global boolean b_jorge_blip false)
(global boolean b_jorge_unblip false)
(global boolean b_emile_blip false)
(global boolean b_emile_unblip false)
(global boolean b_nanny_reset false)
(global short s_kat_forward_timer 15)
(global real r_kat_forward_range 50.0)
(global short s_kat_teleport_timer 5)
(global short s_kat_spawn_timer 5)
(global short s_kat_blip 1)
(global short s_zoneset_last_refreshed -1)
(global short vehicle_none 1)
(global short vehicle_air 1)
(global short vehicle_far 2)
(global short vehicle_return 3)
(global short vehicle_airorfar 4)
(global short s_vehicle_goto_idx 0)
(global short s_court_aa_repair_secs 125)
(global short s_court_aa_repair_secs_interval 0)
(global boolean b_court_aa_repair_ready false)
(global short s_court_wave 0)
(global boolean b_court_phantom_elbow_spawned false)
(global short s_court_waypoint_timer 240)
(global boolean b_court_phantom_w1_spawn false)
(global short s_valley_waypoint_timer 90)
(global boolean b_valley_spawn_air false)
(global boolean b_valley_spawn_far false)
(global boolean b_valley_warthog_deadend false)
(global boolean b_valley_warthog_killed false)
(global boolean b_valley_hog_drop false)
(global boolean b_valley_hog_drop_start false)
(global boolean b_sq_valley_pelican_spawn false)
(global boolean b_far_comm_on false)
(global boolean b_far_generator_on false)
(global boolean b_far_kat_regroup false)
(global short s_far_waypoint_timer 180)
(global boolean b_far_spawn_done false)
(global boolean b_sq_far_fork_counter_1_spawn false)
(global boolean b_sq_far_pelican_spawn false)
(global boolean b_air_kat_regroup false)
(global short s_air_wave_count 0)
(global boolean b_air_spawn_done false)
(global short s_air_phantom_hover_idx 1)
(global short s_air_phantom_position -1)
(global short s_air_phantom_update_timer 5)
(global boolean b_air_phantom_hover_spawn false)
(global short s_air_phantom_hover_pos 0)
(global short s_air_phantom_hover_pos_last -1)
(global short s_air_waypoint_timer 180)
(global boolean b_sq_air_phantom_cnt_1_spawn false)
(global boolean b_air_fork_counter_1_spawn false)
(global boolean b_sq_air_pelican_spawn false)
(global boolean b_slew false)
(global boolean b_slew_start false)
(global boolean b_slew_finish false)
(global short s_slew_respawn_timer 10)
(global short s_slew_dir 1)
(global short s_slew_time 0)
(global short s_slew_time_slow 120)
(global short s_slew_time_fast 90)
(global player p_slew_winner player1)
(global boolean b_sq_air_far_drop_w1_1_spawn false)
(global short s_zoneset_directon -1)
(global short direction_outward 0)
(global short direction_return 1)
(global short direction_return_coop 2)
(global short direction_inward 3)
(global short direction_inward_coop 4)
(global short direction_none 5)
(global short s_exterior_objective_last 0)
(global boolean b_return_kat_regroup false)
(global boolean b_mo_return false)
(global short s_return_waypoint_timer 120)
(global boolean b_sq_return_phantom_1_spawn false)
(global boolean b_sq_return_phantom_2_spawn false)
(global boolean b_sq_return_air_phantom_1_spawn false)
(global boolean b_sq_return_air_phantom_2_spawn false)
(global boolean b_sq_return_far_phantom_1_spawn false)
(global short s_garage_waypoint_timer 120)
(global short s_elevator_coop_count 0)
(global boolean b_garage_elevator_open false)
(global short s_roof_waypoint_timer 300)
(global boolean b_shake false)
(global short s_roof_phantom_fight 1)
(global boolean b_roof_phantom_w1_spawn false)
(global boolean b_gatehouse_door_open false)
(global boolean b_gatehouse_door_active false)
(global boolean b_airtagger_taken false)
(global boolean b_gatehouse_delay false)
(global boolean b_gatehouse_door_return_open false)
(global boolean b_gatehouse_door_switch_prepare false)
(global boolean b_gatehouse_door_switch_power false)
(global boolean b_gatehouse_trigger_courtyard false)
(global boolean b_gatehouse_trigger_exterior false)
(global boolean b_gatehouse_door_timer false)
(global boolean b_gatehouse_door_timer_done false)
(global boolean b_players_any_on_foot false)
(global boolean b_players_all_on_foot false)
(global boolean b_valley_troophog_trav true)
(global boolean b_valley_warthog_drop_trav true)
(global boolean b_air_warthog_ins_trav true)
(global boolean b_air_warthog_trav true)
(global boolean b_air_bighog_trav true)
(global boolean b_far_warthog_ins_trav true)
(global boolean b_far_warthog_trav true)
(global boolean b_far_bighog_trav true)
(global boolean b_return_warthog_ins_trav true)
(global short s_squad_group_obj_area_counter 0)
(global short s_squad_group_obj_counter 0)
(global short s_squad_group_place_counter 0)
(global short pose_against_wall_var1 0)
(global short pose_against_wall_var2 1)
(global short pose_against_wall_var3 2)
(global short pose_against_wall_var4 3)
(global short pose_on_back_var1 4)
(global short pose_on_back_var2 5)
(global short pose_on_side_var1 6)
(global short pose_on_side_var2 7)
(global short pose_on_back_var3 8)
(global short pose_face_down_var1 9)
(global short pose_face_down_var2 10)
(global short pose_on_side_var3 11)
(global short pose_on_side_var4 12)
(global short pose_face_down_var3 13)
(global short pose_on_side_var5 14)
(global boolean b_debug_scripting true)
(global short global_s_current_bomb 0)
(global short s_corvette_shoot_random 1)
(global boolean b_save_continuous true)
(global boolean b_save_on true)
(global boolean b_test_airbomb false)
(global boolean b_test_gatebomb false)
(global boolean b_test_basebomb false)
(global boolean b_test_hallbomb false)
(global boolean b_test_roofbomb false)
(global boolean b_test_sword false)
(global short s_special_elite 0)
(global boolean b_special false)
(global boolean b_special_win false)
(global short s_special_elite_ticks 600)
(global short ai_detail_low 1)
(global short ai_detail_medium 2)
(global short ai_detail_high 3)
(global boolean g_dialog false)
(global ai ai_valley_marine_1 none)
(global ai ai_valley_marine_2 none)
(global short s_exterior_encounter 0)
(global short s_hogdrop 0)
(global ai ai_sword_marine_0_atrium none)
(global short s_music_court -1)
(global short s_music_valley -1)
(global short s_music_far -1)
(global short s_music_air -1)
(global short s_music_return -1)
(global short s_music_garage -1)
(global short s_music_sword -1)
(global boolean b_valley_ins false)
(global boolean b_ins_return false)
(global boolean b_ins_return_objects false)


; SCRIPTS

(script static void f_load_fork (vehicle fork, string load_side, ai load_squad_01, ai load_squad_02, ai load_squad_03, ai load_squad_04)
    (ai_place load_squad_01)
    (ai_place load_squad_02)
    (ai_place load_squad_03)
    (ai_place load_squad_04)
    (sleep 1)
    (cond
        ((= load_side "left")
            (begin
                (if b_debug_fork 
                    (print "load fork left..."))
                (ai_vehicle_enter_immediate load_squad_01 fork fork_p_l)
                (ai_vehicle_enter_immediate load_squad_02 fork fork_p_l)
                (ai_vehicle_enter_immediate load_squad_03 fork fork_p_l)
                (ai_vehicle_enter_immediate load_squad_04 fork fork_p_l)
            )
        )
        ((= load_side "right")
            (begin
                (if b_debug_fork 
                    (print "load fork right..."))
                (ai_vehicle_enter_immediate load_squad_01 fork fork_p_r)
                (ai_vehicle_enter_immediate load_squad_02 fork fork_p_r)
                (ai_vehicle_enter_immediate load_squad_03 fork fork_p_r)
                (ai_vehicle_enter_immediate load_squad_04 fork fork_p_r)
            )
        )
        ((= load_side "dual")
            (begin
                (if b_debug_fork 
                    (print "load fork dual..."))
                (ai_vehicle_enter_immediate load_squad_01 fork fork_p_l)
                (ai_vehicle_enter_immediate load_squad_02 fork fork_p_l)
                (ai_vehicle_enter_immediate load_squad_03 fork fork_p_r)
                (ai_vehicle_enter_immediate load_squad_04 fork fork_p_r)
            )
        )
        ((= load_side "any")
            (begin
                (if b_debug_fork 
                    (print "load fork any..."))
                (ai_vehicle_enter_immediate load_squad_01 fork fork_p)
                (ai_vehicle_enter_immediate load_squad_02 fork fork_p)
                (ai_vehicle_enter_immediate load_squad_03 fork fork_p)
                (ai_vehicle_enter_immediate load_squad_04 fork fork_p)
            )
        )
    )
)

(script static void f_load_fork_cargo (vehicle fork, string load_type, ai load_squad_01, ai load_squad_02, ai load_squad_03)
    (cond
        ((= load_type "large")
            (begin
                (ai_place load_squad_01)
                (sleep 1)
                (vehicle_load_magic fork fork_lc (ai_vehicle_get_from_squad load_squad_01 0))
            )
        )
        ((= load_type "small")
            (begin
                (ai_place load_squad_01)
                (ai_place load_squad_02)
                (ai_place load_squad_03)
                (sleep 1)
                (vehicle_load_magic fork fork_sc01 (ai_vehicle_get_from_squad load_squad_01 0))
                (vehicle_load_magic fork fork_sc02 (ai_vehicle_get_from_squad load_squad_02 0))
                (vehicle_load_magic fork fork_sc03 (ai_vehicle_get_from_squad load_squad_03 0))
            )
        )
    )
)

(script static void f_unload_fork (vehicle fork, string drop_side)
    (if b_debug_fork 
        (print "opening fork..."))
    (unit_open fork)
    (sleep 30)
    (cond
        ((= drop_side "left")
            (begin
                (f_unload_fork_left fork)
                (sleep 75)
            )
        )
        ((= drop_side "right")
            (begin
                (f_unload_fork_right fork)
                (sleep 75)
            )
        )
        ((= drop_side "dual")
            (begin
                (f_unload_fork_all fork)
                (sleep 75)
            )
        )
    )
    (if b_debug_fork 
        (print "closing fork..."))
    (unit_close fork)
)

(script static void f_unload_fork_left (vehicle fork)
    (begin_random
        (begin
            (vehicle_unload fork fork_p_l1)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l2)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l3)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l4)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l5)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l6)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l7)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l8)
            (sleep (random_range 0 10))
        )
    )
)

(script static void f_unload_fork_right (vehicle fork)
    (begin_random
        (begin
            (vehicle_unload fork fork_p_r1)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r2)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r3)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r4)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r5)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r6)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r7)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r8)
            (sleep (random_range 0 10))
        )
    )
)

(script static void f_unload_fork_all (vehicle fork)
    (begin_random
        (begin
            (vehicle_unload fork fork_p_l1)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l2)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l3)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l4)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l5)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l6)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l7)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_l8)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r1)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r2)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r3)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r4)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r5)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r6)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r7)
            (sleep (random_range 0 10))
        )
        (begin
            (vehicle_unload fork fork_p_r8)
            (sleep (random_range 0 10))
        )
    )
)

(script static void f_unload_fork_cargo (vehicle fork, string load_type)
    (cond
        ((= load_type "large")
            (vehicle_unload fork fork_lc)
        )
        ((= load_type "small")
            (begin_random
                (begin
                    (vehicle_unload fork fork_sc01)
                    (sleep (random_range 15 30))
                )
                (begin
                    (vehicle_unload fork fork_sc02)
                    (sleep (random_range 15 30))
                )
                (begin
                    (vehicle_unload fork fork_sc03)
                    (sleep (random_range 15 30))
                )
            )
        )
        ((= load_type "small01")
            (vehicle_unload fork fork_sc01)
        )
        ((= load_type "small02")
            (vehicle_unload fork fork_sc02)
        )
        ((= load_type "small03")
            (vehicle_unload fork fork_sc03)
        )
    )
)

(script static void f_hud_obj_complete
    (objectives_clear)
    (chud_show_screen_objective "campaign_hud_objcomplete")
    (sleep 160)
    (chud_show_screen_objective "")
)

(script static void f_load_phantom (vehicle phantom, string load_side, ai load_squad_01, ai load_squad_02, ai load_squad_03, ai load_squad_04)
    (ai_place load_squad_01)
    (ai_place load_squad_02)
    (ai_place load_squad_03)
    (ai_place load_squad_04)
    (sleep 1)
    (cond
        ((= load_side "left")
            (begin
                (if b_debug_phantom 
                    (print "load phantom left..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_p_lb)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_p_lf)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_p_ml_f)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_p_ml_b)
            )
        )
        ((= load_side "right")
            (begin
                (if b_debug_phantom 
                    (print "load phantom right..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_p_rb)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_p_rf)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_p_mr_f)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_p_mr_b)
            )
        )
        ((= load_side "dual")
            (begin
                (if b_debug_phantom 
                    (print "load phantom dual..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_p_lf)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_p_rf)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_p_lb)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_p_rb)
            )
        )
        ((= load_side "any")
            (begin
                (if b_debug_phantom 
                    (print "load phantom any..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_p)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_p)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_p)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_p)
            )
        )
        ((= load_side "chute")
            (begin
                (if b_debug_phantom 
                    (print "load phantom chute..."))
                (ai_vehicle_enter_immediate load_squad_01 phantom phantom_pc_1)
                (ai_vehicle_enter_immediate load_squad_02 phantom phantom_pc_2)
                (ai_vehicle_enter_immediate load_squad_03 phantom phantom_pc_3)
                (ai_vehicle_enter_immediate load_squad_04 phantom phantom_pc_4)
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
    (if b_debug_phantom 
        (print "opening phantom..."))
    (unit_open phantom)
    (sleep 60)
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
    (if b_debug_phantom 
        (print "closing phantom..."))
    (unit_close phantom)
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
    (if (vehicle_test_seat phantom phantom_pc_1) 
        (begin
            (vehicle_unload phantom phantom_pc_1)
            (sleep 120)
        )
    )
    (if (vehicle_test_seat phantom phantom_pc_2) 
        (begin
            (vehicle_unload phantom phantom_pc_2)
            (sleep 120)
        )
    )
    (if (vehicle_test_seat phantom phantom_pc_3) 
        (begin
            (vehicle_unload phantom phantom_pc_3)
            (sleep 120)
        )
    )
    (if (vehicle_test_seat phantom phantom_pc_4) 
        (begin
            (vehicle_unload phantom phantom_pc_4)
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
    (if b_debug_globals 
        (print "replenish player health..."))
    (unit_set_current_vitality player0 80.0 80.0)
    (unit_set_current_vitality player1 80.0 80.0)
    (unit_set_current_vitality player2 80.0 80.0)
    (unit_set_current_vitality player3 80.0 80.0)
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

(script static boolean any_players_in_vehicle
    (or
        (unit_in_vehicle (unit player0))
        (unit_in_vehicle (unit player1))
        (unit_in_vehicle (unit player2))
        (unit_in_vehicle (unit player3))
    )
)

(script static void f_vehicle_scale_destroy (vehicle vehicle_variable)
    (object_set_scale vehicle_variable 0.01 (* 30.0 5.0))
    (sleep (* 30.0 5.0))
    (object_destroy vehicle_variable)
)

(script static void f_ai_place_vehicle_deathless (ai squad)
    (ai_place squad)
    (ai_cannot_die (object_get_ai (vehicle_driver (ai_vehicle_get_from_squad squad 0))) true)
    (object_cannot_die (ai_vehicle_get_from_squad squad 0) true)
)

(script static void f_ai_place_vehicle_deathless_no_emp (ai squad)
    (ai_place squad)
    (ai_cannot_die (object_get_ai (vehicle_driver (ai_vehicle_get_from_squad squad 0))) true)
    (object_cannot_die (ai_vehicle_get_from_squad squad 0) true)
    (object_ignores_emp (ai_vehicle_get_from_squad squad 0) true)
)

(script static short f_vehicle_rider_number (vehicle v)
    (list_count (vehicle_riders v))
)

(script static boolean f_all_squad_in_vehicle (ai inf_squad, ai vehicle_squad)
    (and
        (= (ai_living_count inf_squad) 0)
        (= (ai_living_count vehicle_squad) (f_vehicle_rider_number (ai_vehicle_get_from_squad vehicle_squad 0)))
    )
)

(script static ai f_ai_get_vehicle_driver (ai squad)
    (object_get_ai (vehicle_driver (ai_vehicle_get_from_squad squad 0)))
)

(script static void f_ai_magically_see_players (ai squad)
    (ai_magically_see_object squad player0)
    (ai_magically_see_object squad player1)
    (ai_magically_see_object squad player2)
    (ai_magically_see_object squad player3)
)

(script dormant void f_global_health_saves
    (sleep_until (> (player_count) 0))
    (sleep_until 
        (begin
            (sleep_until (< (object_get_health player0) 1.0))
            (sleep (* 30.0 7.0))
            (if (< (object_get_health player0) 1.0) 
                (begin
                    (sleep_until (= (object_get_health player0) 1.0))
                    (print "global health: health pack aquired")
                    (game_save)
                ) (print "global health: re-gen"))
            false
        )
    )
)

(script static void f_coop_resume_unlocked (cutscene_title resume_title, short insertion_point)
    (if (game_is_cooperative) 
        (begin
            (sound_impulse_start sfx_hud_in none 1.0)
            (cinematic_set_chud_objective resume_title)
            (game_insertion_point_unlock insertion_point)
        )
    )
)

(script static boolean cinematic_skip_start
    (cinematic_skip_start_internal)
    (game_save_cinematic_skip)
    (sleep_until (not (game_saving)) 1)
    (not (game_reverted))
)

(script static void cinematic_skip_stop (string_id cinematic_name)
    (cinematic_skip_stop_internal)
    (if (not (game_reverted)) 
        (begin
            (game_revert)
            (sleep 1)
        )
    )
)

(script static void cinematic_skip_stop_load_zone (string_id cinematic_name, zone_set z)
    (cinematic_skip_stop_internal)
    (if (not (game_reverted)) 
        (begin
            (game_revert)
            (sleep 1)
        )
    )
    (switch_zone_set z)
    (sleep 2)
)

(script static void cinematic_skip_stop_terminal (string_id cinematic_name)
    (cinematic_skip_stop_internal)
    (if (not (game_reverted)) 
        (begin
            (game_revert)
            (sleep 1)
            (if b_debug_globals 
                (print "sleeping forever..."))
            (sleep_forever)
        )
    )
)

(script static void test_cinematic_enter_exit
    (sleep 30)
)

(script static void cinematic_enter (string_id cinematic_name, boolean lower_weapon)
    (set b_cinematic_entered true)
    (cinematic_enter_pre lower_weapon)
    (sleep (cinematic_tag_fade_out_from_game cinematic_name))
    (cinematic_enter_post)
)

(script static void designer_cinematic_enter (boolean lower_weapon)
    (cinematic_enter_pre lower_weapon)
    (sleep (cinematic_transition_fade_out_from_game "cinematics\transitions\default_intra.cinematic_transition"))
    (cinematic_enter_post)
)

(script static void cinematic_enter_pre (boolean lower_weapon)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (player_control_fade_out_all_input 1.0)
    (if (= lower_weapon true) 
        (begin
            (if b_debug_cinematic_scripts 
                (print "lowering weapon slowly..."))
            (unit_lower_weapon player0 30)
            (unit_lower_weapon player1 30)
            (unit_lower_weapon player2 30)
            (unit_lower_weapon player3 30)
        )
    )
    (campaign_metagame_time_pause true)
    (chud_cinematic_fade 0.0 0.5)
)

(script static void cinematic_enter_post
    (if b_debug_cinematic_scripts 
        (print "hiding players..."))
    (object_hide player0 true)
    (object_hide player1 true)
    (object_hide player2 true)
    (object_hide player3 true)
    (player_enable_input false)
    (player_disable_movement true)
    (sleep 1)
    (if b_debug_cinematic_scripts 
        (print "camera control on"))
    (camera_control true)
    (cinematic_start)
)

(script static void cinematic_exit (string_id cinematic_name, boolean weapon_starts_lowered)
    (cinematic_exit_pre weapon_starts_lowered)
    (sleep (cinematic_tag_fade_in_to_game cinematic_name))
    (cinematic_exit_post weapon_starts_lowered)
)

(script static void designer_cinematic_exit (boolean weapon_starts_lowered)
    (cinematic_exit_pre weapon_starts_lowered)
    (sleep (cinematic_transition_fade_in_to_game "cinematics\transitions\default_intra.cinematic_transition"))
    (cinematic_exit_post weapon_starts_lowered)
)

(script static void cinematic_exit_into_title (string_id cinematic_name, boolean weapon_starts_lowered)
    (cinematic_exit_pre weapon_starts_lowered)
    (chud_cinematic_fade 0.0 0.0)
    (sleep (cinematic_tag_fade_in_to_game cinematic_name))
    (cinematic_exit_post_title weapon_starts_lowered)
)

(script static void cinematic_exit_pre (boolean weapon_starts_lowered)
    (cinematic_stop)
    (camera_control false)
    (object_hide player0 false)
    (object_hide player1 false)
    (object_hide player2 false)
    (object_hide player3 false)
    (if (= weapon_starts_lowered true) 
        (begin
            (if b_debug_cinematic_scripts 
                (print "snapping weapon to lowered state..."))
            (unit_lower_weapon player0 1)
            (unit_lower_weapon player1 1)
            (unit_lower_weapon player2 1)
            (unit_lower_weapon player3 1)
            (sleep 1)
        ) (begin
            (unit_raise_weapon player0 1)
            (unit_raise_weapon player1 1)
            (unit_raise_weapon player2 1)
            (unit_raise_weapon player3 1)
            (sleep 1)
        )
    )
    (player_control_unlock_gaze player0)
    (player_control_unlock_gaze player1)
    (player_control_unlock_gaze player2)
    (player_control_unlock_gaze player3)
    (sleep 1)
)

(script static void cinematic_exit_post (boolean weapon_starts_lowered)
    (cinematic_show_letterbox false)
    (if (= weapon_starts_lowered true) 
        (begin
            (if b_debug_cinematic_scripts 
                (print "raising player weapons slowly..."))
            (unit_raise_weapon player0 30)
            (unit_raise_weapon player1 30)
            (unit_raise_weapon player2 30)
            (unit_raise_weapon player3 30)
            (sleep 10)
        )
    )
    (chud_cinematic_fade 1.0 1.0)
    (sleep 1)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_disable_movement false)
)

(script static void cinematic_exit_post_title (boolean weapon_starts_lowered)
    (cinematic_show_letterbox false)
    (if (= weapon_starts_lowered true) 
        (begin
            (if b_debug_cinematic_scripts 
                (print "raising player weapons slowly..."))
            (unit_raise_weapon player0 30)
            (unit_raise_weapon player1 30)
            (unit_raise_weapon player2 30)
            (unit_raise_weapon player3 30)
            (sleep 10)
        )
    )
    (sleep 1)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_disable_movement false)
)

(script static void insertion_snap_to_black
    (fade_out 0.0 0.0 0.0 0)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (player_control_fade_out_all_input 1.0)
    (unit_lower_weapon player0 0)
    (unit_lower_weapon player1 0)
    (unit_lower_weapon player2 0)
    (unit_lower_weapon player3 0)
    (campaign_metagame_time_pause true)
    (chud_cinematic_fade 0.0 0.0)
    (if b_debug_cinematic_scripts 
        (print "hiding players..."))
    (object_hide player0 true)
    (object_hide player1 true)
    (object_hide player2 true)
    (object_hide player3 true)
    (player_enable_input false)
    (player_disable_movement true)
    (sleep 1)
    (if b_debug_cinematic_scripts 
        (print "camera control on"))
)

(script static void insertion_fade_to_gameplay
    (designer_fade_in "fade_from_black" true)
)

(script static void designer_fade_in (string fade_type, boolean weapon_starts_lowered)
    (cinematic_stop)
    (camera_control false)
    (object_hide player0 false)
    (object_hide player1 false)
    (object_hide player2 false)
    (object_hide player3 false)
    (if (= weapon_starts_lowered true) 
        (begin
            (if b_debug_cinematic_scripts 
                (print "snapping weapon to lowered state..."))
            (unit_lower_weapon player0 1)
            (unit_lower_weapon player1 1)
            (unit_lower_weapon player2 1)
            (unit_lower_weapon player3 1)
            (sleep 1)
        )
    )
    (player_control_unlock_gaze player0)
    (player_control_unlock_gaze player1)
    (player_control_unlock_gaze player2)
    (player_control_unlock_gaze player3)
    (sleep 1)
    (cond
        ((= fade_type "fade_from_black")
            (begin
                (if b_debug_cinematic_scripts 
                    (print "fading from black..."))
                (fade_in 0.0 0.0 0.0 30)
                (sleep 20)
            )
        )
        ((= fade_type "fade_from_white")
            (begin
                (if b_debug_cinematic_scripts 
                    (print "fading from white..."))
                (fade_in 1.0 1.0 1.0 30)
                (sleep 20)
            )
        )
        ((= fade_type "snap_from_black")
            (begin
                (if b_debug_cinematic_scripts 
                    (print "snapping from black..."))
                (fade_in 0.0 0.0 0.0 5)
                (sleep 5)
            )
        )
        ((= fade_type "snap_from_white")
            (begin
                (if b_debug_cinematic_scripts 
                    (print "snapping from white..."))
                (fade_in 1.0 1.0 1.0 5)
                (sleep 5)
            )
        )
        ((= fade_type "no_fade")
            (begin
                (fade_in 1.0 1.0 1.0 0)
                (sleep 5)
            )
        )
    )
    (cinematic_show_letterbox false)
    (if (= weapon_starts_lowered true) 
        (begin
            (if b_debug_cinematic_scripts 
                (print "raising player weapons slowly..."))
            (unit_raise_weapon player0 30)
            (unit_raise_weapon player1 30)
            (unit_raise_weapon player2 30)
            (unit_raise_weapon player3 30)
            (sleep 10)
        )
    )
    (chud_cinematic_fade 1.0 1.0)
    (sleep 1)
    (player_enable_input true)
    (player_control_fade_in_all_input 1.0)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_disable_movement false)
)

(script static void cinematic_snap_to_black
    (sleep 0)
)

(script static void cinematic_snap_to_white
    (sleep 0)
)

(script static void cinematic_snap_from_black
    (sleep 0)
)

(script static void cinematic_snap_from_white
    (sleep 0)
)

(script static void cinematic_fade_to_black
    (sleep 0)
)

(script static void cinematic_fade_to_white
    (sleep 0)
)

(script static void cinematic_fade_to_gameplay
    (designer_fade_in "fade_from_black" true)
)

(script static void cinematic_hud_on
    (chud_cinematic_fade 1.0 0.0)
    (chud_show_crosshair false)
)

(script static void cinematic_hud_off
    (chud_cinematic_fade 0.0 0.0)
    (chud_show_crosshair true)
)

(script static void performance_default_script
    (sleep_until 
        (begin
            (performance_play_line_by_id (+ (performance_get_last_played_line_index) 1.0))
            (>= (+ (performance_get_last_played_line_index) 1.0) (performance_get_line_count))
        ) 
    0)
)

(script static void end_mission
    (game_won)
)

(script static void f_start_mission (string_id cinematic_name)
    (if (= b_cinematic_entered false) 
        (cinematic_enter cinematic_name true))
    (set b_cinematic_entered false)
    (sleep 1)
    (if (cinematic_skip_start) 
        (begin
            (if b_debug_cinematic_scripts 
                (print "f_start_mission: cinematic_skip_start is true... starting cinematic..."))
            (cinematic_show_letterbox_immediate true)
            (cinematic_run_script_by_name cinematic_name)
        )
    )
    (cinematic_skip_stop cinematic_name)
)

(script static void f_play_cinematic_advanced (string_id cinematic_name, zone_set cinematic_zone_set, zone_set zone_to_load_when_done)
    (if b_debug_cinematic_scripts 
        (print "f_play_cinematic: calling cinematic_enter"))
    (set b_cinematic_entered false)
    (switch_zone_set cinematic_zone_set)
    (sleep 1)
    (if (cinematic_skip_start) 
        (begin
            (if b_debug_globals 
                (print "f_play_cinematic: playing cinematic..."))
            (cinematic_show_letterbox_immediate true)
            (cinematic_run_script_by_name cinematic_name)
        )
    )
    (cinematic_skip_stop_load_zone cinematic_name zone_to_load_when_done)
    (if b_debug_cinematic_scripts 
        (print "f_play_cinematic: done with cinematic. resetting audio levels..."))
)

(script static void f_play_cinematic_unskippable (string_id cinematic_name, zone_set cinematic_zone_set)
    (if b_debug_cinematic_scripts 
        (print "f_play_cinematic: calling cinematic_enter"))
    (if (= b_cinematic_entered false) 
        (cinematic_enter cinematic_name false))
    (set b_cinematic_entered false)
    (sleep 1)
    (switch_zone_set cinematic_zone_set)
    (sleep 1)
    (sound_suppress_ambience_update_on_revert)
    (sleep 1)
    (begin
        (if b_debug_globals 
            (print "f_play_cinematic: playing cinematic..."))
        (cinematic_show_letterbox true)
        (sleep 30)
        (cinematic_show_letterbox_immediate true)
        (cinematic_run_script_by_name cinematic_name)
    )
)

(script static void f_play_cinematic (string_id cinematic_name, zone_set cinematic_zone_set)
    (if b_debug_cinematic_scripts 
        (print "f_play_cinematic: calling cinematic_enter"))
    (if (= b_cinematic_entered false) 
        (cinematic_enter cinematic_name false))
    (set b_cinematic_entered false)
    (sleep 1)
    (switch_zone_set cinematic_zone_set)
    (sleep 1)
    (sound_suppress_ambience_update_on_revert)
    (sleep 1)
    (if (cinematic_skip_start) 
        (begin
            (if b_debug_globals 
                (print "f_play_cinematic: playing cinematic..."))
            (cinematic_show_letterbox true)
            (sleep 30)
            (cinematic_show_letterbox_immediate true)
            (cinematic_run_script_by_name cinematic_name)
        )
    )
    (cinematic_skip_stop cinematic_name)
)

(script static void f_end_mission (string_id cinematic_name, zone_set cinematic_zone_set)
    (if (= b_cinematic_entered false) 
        (cinematic_enter cinematic_name false))
    (set b_cinematic_entered false)
    (sleep 1)
    (ai_erase_all)
    (garbage_collect_now)
    (switch_zone_set cinematic_zone_set)
    (sleep 1)
    (if (cinematic_skip_start) 
        (begin
            (if b_debug_globals 
                (print "play outro cinematic..."))
            (cinematic_show_letterbox true)
            (sleep 30)
            (cinematic_show_letterbox_immediate true)
            (cinematic_run_script_by_name cinematic_name)
        )
    )
    (cinematic_skip_stop_internal)
    (fade_out 0.0 0.0 0.0 0)
    (sleep 1)
)

(script static void f_end_mission_ai (string_id cinematic_name, zone_set cinematic_zone_set)
    (if (= b_cinematic_entered false) 
        (cinematic_enter cinematic_name false))
    (set b_cinematic_entered false)
    (sleep 1)
    (ai_disregard player0 true)
    (ai_disregard player1 true)
    (ai_disregard player2 true)
    (ai_disregard player3 true)
    (garbage_collect_now)
    (switch_zone_set cinematic_zone_set)
    (sleep 1)
    (if (cinematic_skip_start) 
        (begin
            (if b_debug_globals 
                (print "play outro cinematic..."))
            (cinematic_show_letterbox true)
            (sleep 30)
            (cinematic_show_letterbox_immediate true)
            (cinematic_run_script_by_name cinematic_name)
        )
    )
    (cinematic_skip_stop_internal)
    (fade_out 0.0 0.0 0.0 0)
    (sleep 1)
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

(script static void f_sfx_hud_tutorial_complete (player player_to_train)
    (sound_impulse_start sfx_tutorial_complete player_to_train 1.0)
)

(script static void f_display_message (short player_short, cutscene_title display_title)
    (chud_show_cinematic_title (player_get player_short) display_title)
    (sleep 5)
)

(script static void f_tutorial_begin (player player_to_train, string_id display_title)
    (f_hud_training_forever player_to_train display_title)
    (sleep 5)
    (unit_action_test_reset player_to_train)
    (sleep 5)
)

(script static void f_tutorial_end (player player_to_train)
    (f_sfx_hud_tutorial_complete player_to_train)
    (f_hud_training_clear player_to_train)
    (sleep 30)
)

(script static void f_tutorial_boost (player player_variable, string_id display_title)
    (f_tutorial_begin player_variable display_title)
    (sleep_until (unit_action_test_secondary_trigger player_variable) 1)
    (f_tutorial_end player_variable)
)

(script static void f_tutorial_rotate_weapons (player player_variable, string_id display_title)
    (f_tutorial_begin player_variable display_title)
    (sleep_until (unit_action_test_rotate_weapons player_variable) 1)
    (f_tutorial_end player_variable)
)

(script static void f_tutorial_fire_weapon (player player_variable, string_id display_title)
    (f_tutorial_begin player_variable display_title)
    (sleep_until (unit_action_test_primary_trigger player_variable) 1)
    (f_tutorial_end player_variable)
)

(script static void f_tutorial_turn (player player_variable, string_id display_title)
    (f_tutorial_begin player_variable display_title)
    (sleep 20)
    (sleep_until (unit_action_test_look_relative_all_directions player_variable) 1)
    (f_tutorial_end player_variable)
)

(script static void f_tutorial_throttle (player player_variable, string_id display_title)
    (f_tutorial_begin player_variable display_title)
    (sleep 20)
    (sleep_until (unit_action_test_move_relative_all_directions player_variable) 1)
    (f_tutorial_end player_variable)
)

(script static void f_tutorial_tricks (player player_variable, string_id display_title)
    (f_tutorial_begin player_variable display_title)
    (sleep_until (unit_action_test_vehicle_trick_secondary player_variable) 1)
    (f_tutorial_end player_variable)
)

(script static void f_hud_training (player player_num, string_id string_hud)
    (chud_show_screen_training player_num string_hud)
    (sleep 120)
    (chud_show_screen_training player_num "")
)

(script static void f_hud_training_forever (player player_num, string_id string_hud)
    (chud_show_screen_training player_num string_hud)
)

(script static void f_hud_training_clear (player player_num)
    (chud_show_screen_training player_num "")
)

(script static void f_hud_training_new_weapon
    (chud_set_static_hs_variable player0 0 1.0)
    (chud_set_static_hs_variable player1 0 1.0)
    (chud_set_static_hs_variable player2 0 1.0)
    (chud_set_static_hs_variable player3 0 1.0)
    (sleep 200)
    (chud_clear_hs_variable player0 0)
    (chud_clear_hs_variable player1 0)
    (chud_clear_hs_variable player2 0)
    (chud_clear_hs_variable player3 0)
)

(script static void f_hud_training_new_weapon_player (player p)
    (chud_set_static_hs_variable p 0 1.0)
    (sleep 200)
    (chud_clear_hs_variable p 0)
)

(script static void f_hud_training_new_weapon_player_clear (player p)
    (chud_clear_hs_variable p 0)
)

(script static void f_hud_training_confirm (player player_num, string_id string_hud, string button_press)
    (if (= (player_is_in_game player_num) false) 
        (sleep_forever))
    (chud_show_screen_training player_num string_hud)
    (sleep 10)
    (player_action_test_reset)
    (sleep_until 
        (cond
            ((= button_press "primary_trigger")
                (sleep_until (unit_action_test_primary_trigger player_num))
            )
            ((= button_press "grenade_trigger")
                (sleep_until (unit_action_test_grenade_trigger player_num))
            )
            ((= button_press "equipment")
                (sleep_until (unit_action_test_equipment player_num))
            )
            ((= button_press "melee")
                (sleep_until (unit_action_test_melee player_num))
            )
            ((= button_press "jump")
                (sleep_until (unit_action_test_jump player_num))
            )
            ((= button_press "rotate_grenades")
                (sleep_until (unit_action_test_rotate_grenades player_num))
            )
            ((= button_press "rotate_weapons")
                (sleep_until (unit_action_test_rotate_weapons player_num))
            )
            ((= button_press "context_primary")
                (sleep_until (unit_action_test_context_primary player_num))
            )
            ((= button_press "vision_trigger")
                (sleep_until 
                    (or
                        (unit_action_test_vision_trigger player_num)
                        (player_night_vision_on)
                    )
                )
            )
            ((= button_press "back")
                (sleep_until (unit_action_test_back player_num))
            )
            ((= button_press "vehicle_trick")
                (sleep_until (unit_action_test_vehicle_trick_primary player_num))
            )
        ) 
    1 (* 30.0 10.0))
    (chud_show_screen_training player_num "")
)

(script static void f_hud_obj_new (string_id string_hud, string_id string_start)
    (f_hud_start_menu_obj string_start)
    (chud_show_screen_objective string_hud)
    (sleep 160)
    (chud_show_screen_objective "")
)

(script static void f_hud_obj_repeat (string_id string_hud)
    (chud_show_screen_objective string_hud)
    (sleep 160)
    (chud_show_screen_objective "")
)

(script static void f_hud_start_menu_obj (string_id reference)
    (objectives_clear)
    (objectives_set_string 0 reference)
    (objectives_show_string reference)
)

(script static void f_hud_chapter (string_id string_hud)
    (chud_cinematic_fade 0.0 30.0)
    (sleep 10)
    (chud_show_screen_chapter_title string_hud)
    (chud_fade_chapter_title_for_player player0 1.0 30)
    (chud_fade_chapter_title_for_player player1 1.0 30)
    (chud_fade_chapter_title_for_player player2 1.0 30)
    (chud_fade_chapter_title_for_player player3 1.0 30)
    (sleep 120)
    (chud_fade_chapter_title_for_player player0 0.0 30)
    (chud_fade_chapter_title_for_player player1 0.0 30)
    (chud_fade_chapter_title_for_player player2 0.0 30)
    (chud_fade_chapter_title_for_player player3 0.0 30)
    (chud_show_screen_chapter_title "")
    (sleep 10)
    (chud_cinematic_fade 1.0 30.0)
)

(script static void f_hud_flash_object_fov (object_name hud_object_highlight)
    (sleep_until 
        (or
            (objects_can_see_object player0 hud_object_highlight 25.0)
            (objects_can_see_object player1 hud_object_highlight 25.0)
            (objects_can_see_object player2 hud_object_highlight 25.0)
            (objects_can_see_object player3 hud_object_highlight 25.0)
        ) 
    1)
    (object_create hud_object_highlight)
    (set chud_debug_highlight_object_color_red 1.0)
    (set chud_debug_highlight_object_color_green 1.0)
    (set chud_debug_highlight_object_color_blue 0.0)
    (f_hud_flash_single hud_object_highlight)
    (f_hud_flash_single hud_object_highlight)
    (f_hud_flash_single hud_object_highlight)
    (object_destroy hud_object_highlight)
)

(script static void f_hud_flash_object (object_name hud_object_highlight)
    (object_create hud_object_highlight)
    (set chud_debug_highlight_object_color_red 1.0)
    (set chud_debug_highlight_object_color_green 1.0)
    (set chud_debug_highlight_object_color_blue 0.0)
    (f_hud_flash_single hud_object_highlight)
    (f_hud_flash_single hud_object_highlight)
    (f_hud_flash_single hud_object_highlight)
    (object_destroy hud_object_highlight)
)

(script static void f_hud_flash_single (object_name hud_object_highlight)
    (object_hide hud_object_highlight false)
    (set chud_debug_highlight_object hud_object_highlight)
    (sleep 4)
    (object_hide hud_object_highlight true)
    (sleep 5)
)

(script static void f_hud_flash_single_nodestroy (object_name hud_object_highlight)
    (set chud_debug_highlight_object hud_object_highlight)
    (sleep 4)
    (set chud_debug_highlight_object none)
    (sleep 5)
)

(script static void f_blip_internal (object obj, short icon_disappear_time, short final_delay)
    (chud_track_object obj true)
    (sound_impulse_start sfx_blip none 1.0)
    (sleep icon_disappear_time)
    (chud_track_object obj false)
    (sleep final_delay)
)

(script static void f_blip_flag_internal (cutscene_flag f, short icon_disappear_time, short final_delay)
    (chud_track_flag f true)
    (sound_impulse_start sfx_blip none 1.0)
    (sleep icon_disappear_time)
    (chud_track_flag f false)
    (sleep final_delay)
)

(script static void f_blip_flag (cutscene_flag f, short type)
    (chud_track_flag_with_priority f type)
)

(script static void f_blip_flag_forever (cutscene_flag f)
    (print "f_blip_flag_forever is going away. please use f_blip_flag")
    (f_blip_flag f blip_neutralize)
)

(script static void f_unblip_flag (cutscene_flag f)
    (chud_track_flag f false)
)

(script static void f_blip_object (object obj, short type)
    (chud_track_object_with_priority obj type)
)

(script static void f_blip_object_offset (object obj, short type, short offset)
    (chud_track_object_with_priority obj type)
    (chud_track_object_set_vertical_offset obj offset)
)

(script static void f_blip_object_forever (object obj)
    (print "f_blip_object_forever is going away. please use f_blip_object")
    (chud_track_object obj true)
)

(script static void f_unblip_object (object obj)
    (chud_track_object obj false)
)

(script static void f_blip_object_until_dead (object obj)
    (chud_track_object obj true)
    (sleep_until (<= (object_get_health obj) 0.0))
    (chud_track_object obj false)
)

(script static void f_blip_ai (ai group, short blip_type)
    (sleep_until (= b_blip_list_locked false) 1)
    (set b_blip_list_locked true)
    (set s_blip_list_index 0)
    (set l_blip_list (ai_actors group))
    (sleep_until 
        (begin
            (if (> (object_get_health (list_get l_blip_list s_blip_list_index)) 0.0) 
                (f_blip_object (list_get l_blip_list s_blip_list_index) blip_type))
            (set s_blip_list_index (+ s_blip_list_index 1.0))
            (>= s_blip_list_index (list_count l_blip_list))
        ) 
    1)
    (set b_blip_list_locked false)
)

(script static void f_blip_ai_offset (ai group, short blip_type, short offset)
    (sleep_until (= b_blip_list_locked false) 1)
    (set b_blip_list_locked true)
    (set s_blip_list_index 0)
    (set l_blip_list (ai_actors group))
    (sleep_until 
        (begin
            (if (> (object_get_health (list_get l_blip_list s_blip_list_index)) 0.0) 
                (f_blip_object_offset (list_get l_blip_list s_blip_list_index) blip_type offset))
            (set s_blip_list_index (+ s_blip_list_index 1.0))
            (>= s_blip_list_index (list_count l_blip_list))
        ) 
    1)
    (set b_blip_list_locked false)
)

(script static void f_blip_ai_forever (ai group)
    (print "f_blip_ai_forever is going away. please use f_blip_ai")
    (f_blip_ai group 0)
)

(script static void f_blip_ai_until_dead (ai char)
    (print "f_blip_ai_until_dead will be rolled into the new f_blip_ai command. consider using that instead.")
    (f_blip_ai_forever char)
    (sleep_until (<= (object_get_health (ai_get_object char)) 0.0))
    (f_unblip_ai char)
)

(script static void f_unblip_ai (ai group)
    (sleep_until (= b_blip_list_locked false) 1)
    (set b_blip_list_locked true)
    (set s_blip_list_index 0)
    (set l_blip_list (ai_actors group))
    (sleep_until 
        (begin
            (if (> (object_get_health (list_get l_blip_list s_blip_list_index)) 0.0) 
                (f_unblip_object (list_get l_blip_list s_blip_list_index)))
            (set s_blip_list_index (+ s_blip_list_index 1.0))
            (>= s_blip_list_index (list_count l_blip_list))
        ) 
    1)
    (set b_blip_list_locked false)
)

(script static void f_blip_title (object obj, string_id title)
    (chud_track_object_with_priority obj 6 title)
    (sleep 120)
    (chud_track_object obj false)
)

(script static void f_blip_weapon (object gun, short dist, short dist2)
    (sleep_until 
        (or
            (and
                (<= (objects_distance_to_object player0 gun) dist)
                (>= (objects_distance_to_object player0 gun) 0.1)
            )
            (and
                (<= (objects_distance_to_object player1 gun) dist)
                (>= (objects_distance_to_object player1 gun) 0.1)
            )
            (and
                (<= (objects_distance_to_object player2 gun) dist)
                (>= (objects_distance_to_object player2 gun) 0.1)
            )
            (and
                (<= (objects_distance_to_object player3 gun) dist)
                (>= (objects_distance_to_object player3 gun) 0.1)
            )
        ) 
    1)
    (print "blip on")
    (f_blip_object gun blip_ordnance)
    (sleep_until 
        (or
            (not (object_get_at_rest gun))
            (and
                (>= (objects_distance_to_object player0 gun) dist2)
                (>= (objects_distance_to_object player0 gun) dist2)
                (>= (objects_distance_to_object player0 gun) dist2)
                (>= (objects_distance_to_object player0 gun) dist2)
            )
        ) 
    1)
    (print "blip off")
    (f_unblip_object gun)
)

(script static void f_hud_spartan_waypoint (ai spartan, string_id spartan_hud, short max_dist)
    (sleep_until 
        (begin
            (cond
                ((< (objects_distance_to_object (ai_get_object spartan) player0) 0.95)
                    (begin
                        (chud_track_object spartan false)
                        (sleep 60)
                    )
                )
                ((> (objects_distance_to_object (ai_get_object spartan) player0) max_dist)
                    (begin
                        (chud_track_object spartan false)
                        (sleep 60)
                    )
                )
                ((< (objects_distance_to_object (ai_get_object spartan) player0) 3.0)
                    (begin
                        (chud_track_object_with_priority spartan 22 spartan_hud)
                        (sleep 60)
                    )
                )
                ((objects_can_see_object player0 (ai_get_object spartan) 10.0)
                    (begin
                        (chud_track_object_with_priority spartan 22 spartan_hud)
                        (sleep 60)
                    )
                )
                (true
                    (begin
                        (chud_track_object_with_priority spartan 5 "")
                    )
                )
            )
            false
        ) 
    30)
)

(script static void f_callout_atom (object obj, short type, short time, short postdelay)
    (chud_track_object_with_priority obj type)
    (sound_impulse_start sfx_blip none 1.0)
    (sleep time)
    (chud_track_object obj false)
    (sleep postdelay)
)

(script static void f_callout_flag_atom (cutscene_flag f, short type, short time, short postdelay)
    (chud_track_flag_with_priority f type)
    (sound_impulse_start sfx_blip none 1.0)
    (sleep time)
    (chud_track_flag f false)
    (sleep postdelay)
)

(script static void f_callout_object (object obj, short type)
    (f_callout_atom obj type 120 2)
)

(script static void f_callout_object_fast (object obj, short type)
    (f_callout_atom obj type 20 5)
)

(script static void f_callout_ai (ai actors, short type)
    (sleep_until (= b_blip_list_locked false) 1)
    (set b_blip_list_locked true)
    (set l_blip_list (ai_actors actors))
    (sleep_until 
        (begin
            (if (> (object_get_health (list_get l_blip_list s_blip_list_index)) 0.0) 
                (f_callout_object (list_get l_blip_list s_blip_list_index) type))
            (set s_blip_list_index (+ s_blip_list_index 1.0))
            (>= s_blip_list_index (list_count l_blip_list))
        ) 
    1)
    (set s_blip_list_index 0)
    (set b_blip_list_locked false)
)

(script static void f_callout_ai_fast (ai actors, short type)
    (sleep_until (= b_blip_list_locked false) 1)
    (set b_blip_list_locked true)
    (set l_blip_list (ai_actors actors))
    (sleep_until 
        (begin
            (if (> (object_get_health (list_get l_blip_list s_blip_list_index)) 0.0) 
                (f_callout_object_fast (list_get l_blip_list s_blip_list_index) type))
            (set s_blip_list_index (+ s_blip_list_index 1.0))
            (>= s_blip_list_index (list_count l_blip_list))
        ) 
    1)
    (set s_blip_list_index 0)
    (set b_blip_list_locked false)
)

(script static void f_callout_and_hold_flag (cutscene_flag f, short type)
    (chud_track_flag_with_priority f type)
    (sound_impulse_start sfx_blip none 1.0)
    (sleep 10)
)

(script static void f_md_ai_play (short delay, ai character, ai_line line)
    (set b_is_dialogue_playing true)
    (if (>= (ai_living_count character) 1) 
        (begin
            (set s_md_play_time (ai_play_line character line))
            (sleep s_md_play_time)
            (sleep delay)
        ) (print "this actor does not exist to play f_md_ai_play"))
    (set b_is_dialogue_playing false)
)

(script static void f_md_object_play (short delay, object obj, ai_line line)
    (set b_is_dialogue_playing true)
    (set s_md_play_time (ai_play_line_on_object obj line))
    (sleep s_md_play_time)
    (sleep delay)
    (set b_is_dialogue_playing false)
)

(script static void f_md_ai_play_cutoff (short cutoff_time, ai character, ai_line line)
    (set b_is_dialogue_playing true)
    (set s_md_play_time (- (ai_play_line character line) cutoff_time))
    (sleep s_md_play_time)
    (set b_is_dialogue_playing false)
)

(script static void f_md_object_play_cutoff (short cutoff_time, object obj, ai_line line)
    (set b_is_dialogue_playing true)
    (set s_md_play_time (- (ai_play_line_on_object obj line) cutoff_time))
    (sleep s_md_play_time)
    (set b_is_dialogue_playing false)
)

(script static void f_md_abort
    (sleep s_md_play_time)
    (print "dialog script aborted!")
    (set b_is_dialogue_playing false)
    (ai_dialogue_enable true)
)

(script static void f_md_abort_no_combat_dialog
    (f_md_abort)
    (sleep 1)
    (ai_dialogue_enable false)
)

(script static void f_md_play (short delay, sound line)
    (set b_is_dialogue_playing true)
    (set s_md_play_time (sound_impulse_language_time line))
    (sound_impulse_start line none 1.0)
    (sleep (sound_impulse_language_time line))
    (sleep delay)
    (set s_md_play_time 0)
    (set b_is_dialogue_playing false)
)

(script static boolean f_is_dialogue_playing
    b_is_dialogue_playing
)

(script static boolean f_ai_has_spawned (ai actors)
    (> (ai_spawn_count actors) 0)
)

(script static boolean f_ai_is_defeated (ai actors)
    (and
        (> (ai_spawn_count actors) 0)
        (<= (ai_living_count actors) 0)
    )
)

(script static boolean f_ai_is_partially_defeated (ai actors, short count)
    (and
        (>= (ai_spawn_count actors) count)
        (<= (ai_living_count actors) count)
    )
)

(script static boolean f_task_is_empty (ai task)
    (<= (ai_task_count task) 0)
)

(script static boolean f_task_has_actors (ai task)
    (> (ai_task_count task) 0)
)

(script static ai f_object_get_squad (object ai_obj)
    (ai_get_squad (object_get_ai ai_obj))
)

(script static void debug_toggle_cookie_cutters
    (if (= debug_instanced_geometry false) 
        (begin
            (set debug_objects_collision_models false)
            (set debug_objects_physics_models false)
            (set debug_objects_bounding_spheres false)
            (set debug_objects_cookie_cutters true)
            (set debug_objects true)
            (set debug_instanced_geometry_collision_geometry false)
            (set debug_instanced_geometry_cookie_cutters true)
            (set debug_instanced_geometry true)
        ) (begin
            (set debug_objects_cookie_cutters false)
            (set debug_objects false)
            (set debug_instanced_geometry_cookie_cutters false)
            (set debug_instanced_geometry false)
        )
    )
)

(script static void debug_toggle_pathfinding_collisions
    (if (= collision_debug false) 
        (begin
            (set collision_debug true)
            (set collision_debug_flag_ignore_invisible_surfaces false)
        ) (begin
            (set collision_debug false)
            (set collision_debug_flag_ignore_invisible_surfaces true)
        )
    )
)

(script static void f_branch_empty01
    (print "branch exit")
)

(script static void f_branch_empty02
    (print "branch exit")
)

(script static void f_branch_empty03
    (print "branch exit")
)

(script startup void swordbase
    (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_return" false)
    (zone_set_trigger_volume_enable "zone_set:zoneset_courtyard_return" false)
    (if b_debug 
        (print_difficulty))
    (if b_debug 
        (print "::: m20 - sword base :::"))
    (ai_allegiance human player)
    (ai_allegiance player human)
    (set respawn_players_into_friendly_vehicle true)
    (f_loadout_set "default")
    (set breakpoints_enabled false)
    (if b_encounters 
        (begin
            (wake f_court_main)
            (wake f_valley_main)
            (wake f_far_main)
            (wake f_air_main)
            (wake f_air_far_main)
            (wake f_return_main)
            (wake f_garage_main)
            (wake f_sword_main)
            (wake f_roof_main)
        )
    )
    (wake f_slew)
    (wake special_elite)
    (soft_ceiling_enable "soft_ceiling_interior" false)
    (soft_ceiling_enable "camera_blocker_07" false)
    (soft_ceiling_enable "camera_blocker_08" false)
    (soft_ceiling_enable "camera_blocker_09" false)
    (if 
        (or
            b_game_emulate
            (and
                (not b_editor)
                (> (player_count) 0)
            )
        ) 
            (begin
                (start)
            ) (begin
                (if b_debug 
                    (print ":::  editor mode  :::"))
                (fade_in 0.0 0.0 0.0 0)
            )
    )
)

(script dormant void f_insertion_fade_in
    (sleep_until b_insertion_fade_in)
    (insertion_fade_to_gameplay)
)

(script static void f_kill_all_scripts
    (sleep_forever f_court_main)
    (sleep_forever f_valley_main)
    (sleep_forever f_far_main)
    (sleep_forever f_air_main)
    (sleep_forever f_air_far_main)
    (sleep_forever f_return_main)
    (sleep_forever f_garage_main)
    (sleep_forever f_sword_main)
    (sleep_forever f_roof_main)
)

(script static void start
    (cond
        ((= (game_insertion_point_get) 0)
            (ins_court)
        )
        ((= (game_insertion_point_get) 1)
            (ins_valley)
        )
        ((= (game_insertion_point_get) 2)
            (ins_return)
        )
        ((= (game_insertion_point_get) 3)
            (ins_sword)
        )
        ((= (game_insertion_point_get) 4)
            (f_test_airbomb)
        )
        ((= (game_insertion_point_get) 5)
            (f_test_gatebomb)
        )
        ((= (game_insertion_point_get) 6)
            (f_test_basebomb)
        )
        ((= (game_insertion_point_get) 7)
            (f_test_hallbomb)
        )
        ((= (game_insertion_point_get) 8)
            (f_test_roofbomb)
        )
    )
)

(script static void f_loadout_set (string area)
    (if (= area "default") 
        (begin
            (if (game_is_cooperative) 
                (begin
                    (unit_add_equipment player0 "default_coop" true false)
                    (unit_add_equipment player1 "default_coop" true false)
                    (unit_add_equipment player2 "default_coop" true false)
                    (unit_add_equipment player3 "default_coop" true false)
                    (player_set_profile "default_coop_respawn" player0)
                    (player_set_profile "default_coop_respawn" player1)
                    (player_set_profile "default_coop_respawn" player2)
                    (player_set_profile "default_coop_respawn" player3)
                ) (begin
                    (player_set_profile "default_single_respawn" player0)
                )
            )
        )
    )
    (if (= area "exterior") 
        (begin
            (if (game_is_cooperative) 
                (begin
                    (player_set_profile "exterior_coop_respawn" player0)
                    (player_set_profile "exterior_coop_respawn" player1)
                    (player_set_profile "exterior_coop_respawn" player2)
                    (player_set_profile "exterior_coop_respawn" player3)
                ) (begin
                    (player_set_profile "exterior_single_respawn" player0)
                )
            )
        )
    )
    (if (= area "interior") 
        (begin
            (if (game_is_cooperative) 
                (begin
                    (player_set_profile "interior_coop_respawn" player0)
                    (player_set_profile "interior_coop_respawn" player1)
                    (player_set_profile "interior_coop_respawn" player2)
                    (player_set_profile "interior_coop_respawn" player3)
                ) (begin
                    (player_set_profile "interior_single_respawn" player0)
                )
            )
        )
    )
)

(script static void f_kat_respawn (ai kat, string_id obj)
    (ai_erase ai_kat)
    (ai_erase "sq_kat")
    (object_destroy o_kat)
    (sleep 10)
    (f_kat_spawn kat obj)
)

(script static void f_kat_spawn (ai kat, string_id obj)
    (ai_place kat)
    (tick)
    (set ai_kat kat)
    (set o_kat (ai_get_object kat))
    (ai_cannot_die kat true)
    (ai_force_active ai_kat true)
    (ai_set_objective (ai_get_squad kat) obj)
    (f_kat_blip)
)

(script static void f_jorge_spawn (ai jorge, string_id obj)
    (ai_place jorge)
    (sleep 30)
    (set ai_jorge jorge)
    (set o_jorge (ai_get_object jorge))
    (ai_cannot_die jorge true)
    (ai_force_active ai_jorge true)
    (ai_set_objective (ai_get_squad jorge) obj)
)

(script static void f_jun_spawn (ai jun, string_id obj)
    (ai_place jun)
    (sleep 30)
    (set ai_jun jun)
    (set o_jun (ai_get_object jun))
    (ai_cannot_die jun true)
    (ai_force_active ai_jun true)
    (ai_set_objective (ai_get_squad jun) obj)
)

(script static void f_emile_spawn (ai emile, string_id obj)
    (ai_place emile)
    (sleep 30)
    (set ai_emile emile)
    (set o_emile (ai_get_object emile))
    (ai_cannot_die emile true)
    (ai_force_active ai_emile true)
    (ai_set_objective (ai_get_squad emile) obj)
)

(script dormant void f_jun_blip
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_jun) "jun_name" 60)
        )
    )
)

(script dormant void f_jorge_blip
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_jorge) "jorge_name" 60)
        )
    )
)

(script dormant void f_emile_blip
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_emile) "emile_name" 60)
        )
    )
)

(script static void f_hud_spartan_waypoint_object (object spartan, string_id spartan_hud, short max_dist)
    (sleep_until 
        (begin
            (cond
                ((> (objects_distance_to_object spartan player0) max_dist)
                    (begin
                        (dprint "chud track")
                        (chud_track_object spartan false)
                        (sleep 60)
                    )
                )
                ((< (objects_distance_to_object spartan player0) 3.0)
                    (begin
                        (dprint "chud track priority 1")
                        (chud_track_object_with_priority o_kat 22 spartan_hud)
                        (sleep 60)
                    )
                )
                ((objects_can_see_object player0 spartan 10.0)
                    (begin
                        (dprint "chud track priority 2")
                        (chud_track_object_with_priority o_kat 22 spartan_hud)
                        (sleep 60)
                    )
                )
                (true
                    (begin
                        (dprint "chud default")
                        (chud_track_object_with_priority o_kat 5 "")
                    )
                )
            )
            false
        ) 
    30)
)

(script static void f_kat_area_forward (trigger_volume tv_area, point_reference pt, ai respawn, string_id obj)
    (branch
        b_nanny_reset
        (f_abort)
    )
    (sleep_until 
        (and
            (volume_test_object tv_area o_kat)
            (volume_test_players tv_area)
        ) 
    5 (* 30.0 s_kat_forward_timer))
    (if (not 
        (and
            (volume_test_object tv_area o_kat)
            (volume_test_players tv_area)
        )
    ) 
        (begin
            (dbreak "kat forward")
            (ai_set_objective "sq_kat" obj)
            (tick)
            (ai_bring_forward o_kat r_kat_forward_range)
        )
    )
    (sleep_until 
        (and
            (volume_test_object tv_area o_kat)
            (volume_test_players tv_area)
        ) 
    5 (* 30.0 s_kat_teleport_timer))
    (if (not 
        (and
            (volume_test_object tv_area o_kat)
            (volume_test_players tv_area)
        )
    ) 
        (begin
            (dbreak "kat teleport")
            (object_teleport_to_ai_point o_kat pt)
            (ai_set_objective "sq_kat" obj)
        )
    )
    (sleep_until 
        (and
            (volume_test_object tv_area o_kat)
            (volume_test_players tv_area)
        ) 
    5 (* 30.0 s_kat_teleport_timer))
    (if (not 
        (and
            (volume_test_object tv_area o_kat)
            (volume_test_players tv_area)
        )
    ) 
        (begin
            (dbreak "kat respawn")
            (f_kat_respawn respawn obj)
        )
    )
)

(script dormant void f_kat_nanny
    (dprint "kat nanny")
    (if (<= s_insertion_index s_valley_ins_idx) 
        (begin
            (wake f_kat_nanny_valley)
            (wake f_kat_nanny_air)
            (wake f_kat_nanny_far)
        )
    )
    (if (<= s_insertion_index s_return_ins_idx) 
        (begin
            (sleep_until (>= s_objcon_return 1) 5)
            (wake f_kat_nanny_return)
        )
    )
    (if (<= s_insertion_index s_garage_ins_idx) 
        (begin
            (sleep_until (>= s_objcon_garage 1) 5)
            (wake f_kat_nanny_garage)
        )
    )
    (if (<= s_insertion_index s_sword_ins_idx) 
        (begin
            (sleep_until (>= s_objcon_sword 1) 5)
            (wake f_kat_nanny_sword)
        )
    )
)

(script dormant void f_kat_nanny_valley
    (sleep_until (volume_test_players "tv_area_valley") 5)
    (f_kat_area_forward "tv_area_valley" "ps_kat_teleport/valley" "sq_kat/valley_respawn" "obj_valley_hum")
)

(script dormant void f_kat_nanny_air
    (sleep_until 
        (and
            (volume_test_players "tv_area_air")
            (>= s_objcon_air 1)
        ) 
    5)
    (set b_nanny_reset true)
    (tick)
    (set b_nanny_reset false)
    (f_kat_area_forward "tv_area_air" "ps_kat_teleport/air" "sq_kat/air_respawn" "obj_air_hum")
)

(script dormant void f_kat_nanny_far
    (sleep_until 
        (and
            (volume_test_players "tv_area_far")
            (>= s_objcon_far 1)
        ) 
    5)
    (set b_nanny_reset true)
    (tick)
    (set b_nanny_reset false)
    (f_kat_area_forward "tv_area_far" "ps_kat_teleport/far" "sq_kat/far_respawn" "obj_far_hum")
)

(script dormant void f_kat_nanny_return
    (sleep_until (volume_test_players "tv_area_return") 5)
    (set b_nanny_reset true)
    (tick)
    (set b_nanny_reset false)
    (f_kat_area_forward "tv_area_return" "ps_kat_teleport/return" "sq_kat/return_respawn" "obj_return_hum")
)

(script dormant void f_kat_nanny_garage
    (sleep_until (volume_test_players "tv_area_court") 5)
    (set b_nanny_reset true)
    (tick)
    (set b_nanny_reset false)
    (f_kat_area_forward "tv_area_court" "ps_kat_teleport/garage" "sq_kat/garage_respawn" "obj_garage_hum")
)

(script dormant void f_kat_nanny_sword
    (sleep_until (volume_test_players "tv_area_sword") 5)
    (set b_nanny_reset true)
    (tick)
    (set b_nanny_reset false)
    (f_kat_area_forward "tv_area_sword" "ps_kat_teleport/sword" "sq_kat/sword_respawn" "obj_sword_hum")
)

(script static void f_kat_blip_kill
    (sleep_forever f_kat_blip_1)
    (sleep_forever f_kat_blip_2)
    (sleep_forever f_kat_blip_3)
    (sleep_forever f_kat_blip_4)
    (sleep_forever f_kat_blip_5)
    (sleep_forever f_kat_blip_6)
    (sleep_forever f_kat_blip_7)
    (sleep_forever f_kat_blip_8)
)

(script static void f_kat_blip
    (cond
        ((= s_kat_blip 1)
            (wake f_kat_blip_1)
            (set s_kat_blip 2)
        )
        ((= s_kat_blip 2)
            (sleep_forever f_kat_blip_1)
            (wake f_kat_blip_2)
            (set s_kat_blip 3)
        )
        ((= s_kat_blip 3)
            (sleep_forever f_kat_blip_2)
            (wake f_kat_blip_3)
            (set s_kat_blip 4)
        )
        ((= s_kat_blip 4)
            (sleep_forever f_kat_blip_3)
            (wake f_kat_blip_4)
            (set s_kat_blip 5)
        )
        ((= s_kat_blip 5)
            (sleep_forever f_kat_blip_4)
            (wake f_kat_blip_5)
            (set s_kat_blip 6)
        )
        ((= s_kat_blip 6)
            (sleep_forever f_kat_blip_5)
            (wake f_kat_blip_6)
            (set s_kat_blip 7)
        )
        ((= s_kat_blip 7)
            (sleep_forever f_kat_blip_6)
            (wake f_kat_blip_7)
            (set s_kat_blip 8)
        )
        ((= s_kat_blip 8)
            (sleep_forever f_kat_blip_7)
            (wake f_kat_blip_8)
            (set s_kat_blip -1)
        )
    )
)

(script dormant void f_kat_blip_1
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_kat_blip_2
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_kat_blip_3
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_kat_blip_4
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_kat_blip_5
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_kat_blip_6
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_kat_blip_7
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_kat_blip_8
    (if (not (game_is_cooperative)) 
        (begin
            (f_hud_spartan_waypoint (object_get_ai o_kat) "kat_name" 60)
        )
    )
)

(script dormant void f_objects_manage
    (sleep_until_game_ticks 
        (begin
            (if (not b_ins_return_objects) 
                (begin
                    (cond
                        ((and
                            (= (current_zone_set_fully_active) s_zoneset_intro_cinematic)
                            (not (= s_zoneset_last_refreshed s_zoneset_intro_cinematic))
                        )
                            (dprint "intro objects manage")
                            (f_objects_court_init_create)
                            (f_objects_court_shared_create)
                            (soft_ceiling_enable "camera_blocker_05" true)
                            (set s_zoneset_last_refreshed s_zoneset_intro_cinematic)
                        )
                        ((and
                            (= (current_zone_set_fully_active) s_zoneset_courtyard_valley)
                            (not (= s_zoneset_last_refreshed s_zoneset_courtyard_valley))
                        )
                            (dprint "valley objects manage")
                            (f_objects_valley_create)
                            (set s_zoneset_last_refreshed s_zoneset_courtyard_valley)
                        )
                        ((and
                            (= (current_zone_set_fully_active) s_zoneset_exterior)
                            (not (= s_zoneset_last_refreshed s_zoneset_exterior))
                        )
                            (dprint "exterior objects manage")
                            (f_objects_exterior_create)
                            (f_objects_court_init_destroy)
                            (f_objects_court_shared_destroy)
                            (soft_ceiling_enable "camera_blocker_05" false)
                            (set s_zoneset_last_refreshed s_zoneset_exterior)
                        )
                        ((and
                            (= (current_zone_set_fully_active) s_zoneset_courtyard_valley_re)
                            (not (= s_zoneset_last_refreshed s_zoneset_courtyard_valley_re))
                        )
                            (dprint "courtyard valley return objects manage")
                            (f_objects_court_return_create)
                            (f_objects_court_init_destroy)
                            (f_objects_court_shared_create)
                            (device_set_position_immediate "dm_garagedoor_1" 1.0)
                            (device_set_position_immediate "dm_garagedoor_2" 1.0)
                            (soft_ceiling_enable "camera_blocker_05" true)
                            (set s_zoneset_last_refreshed s_zoneset_courtyard_valley_re)
                        )
                        ((and
                            (= (current_zone_set_fully_active) s_zoneset_courtyard_return)
                            (not (= s_zoneset_last_refreshed s_zoneset_courtyard_return))
                        )
                            (dprint "courtyard return objects manage")
                            (f_objects_exterior_destroy)
                            (f_objects_valley_destroy)
                            (set s_zoneset_last_refreshed s_zoneset_courtyard_return)
                        )
                        ((and
                            (= (current_zone_set_fully_active) s_zoneset_interior)
                            (not (= s_zoneset_last_refreshed s_zoneset_interior))
                        )
                            (dprint "interior objects manage")
                            (f_objects_interior_create)
                            (f_objects_court_shared_destroy)
                            (f_objects_court_return_destroy)
                            (set s_zoneset_last_refreshed s_zoneset_interior)
                        )
                    )
                ) (begin
                    (dprint "bravo insertion objects manage")
                    (f_objects_exterior_create)
                    (f_objects_valley_create)
                    (f_objects_court_init_destroy)
                    (f_objects_court_shared_destroy)
                    (soft_ceiling_enable "camera_blocker_05" false)
                    (set s_zoneset_last_refreshed s_zoneset_exterior)
                    (sleep (* 30.0 10.0))
                    (set b_ins_return_objects false)
                )
            )
            false
        ) 
    3)
)

(script static void f_objects_court_init_create
    (dprint "creating court init objects")
    (object_create_folder "v_court_init")
    (object_create_folder "cr_court_init")
    (object_create_folder "sc_court_init")
    (object_create_folder "dc_court_init")
    (pose_body "sc_court_marine_1" pose_on_side_var3)
    (pose_body "sc_court_marine_2" pose_face_down_var1)
    (pose_body "sc_court_marine_3" pose_face_down_var2)
)

(script static void f_objects_court_init_destroy
    (dprint "destroying court init objects")
    (object_destroy_folder "v_court_init")
    (object_destroy_folder "cr_court_init")
    (object_destroy_folder "sc_court_init")
    (object_destroy_folder "dc_court_init")
)

(script static void f_objects_court_return_create
    (dprint "creating court return objects")
    (object_create_folder "sc_court_return")
    (object_create_folder "cr_court_return")
    (object_create_folder "wp_court_return")
    (object_create_folder "dc_court_return")
    (object_create_folder "eq_court_return")
    (object_create_folder "v_court_return")
    (pose_body "sc_court_return_marine_1" pose_face_down_var2)
    (pose_body "sc_court_return_marine_2" pose_face_down_var3)
)

(script static void f_objects_court_return_create_anew
    (dprint "creating court return objects anew")
    (object_create_folder_anew "sc_court_return")
    (object_create_folder_anew "cr_court_return")
    (object_create_folder_anew "wp_court_return")
    (object_create_folder_anew "dc_court_return")
    (object_create_folder_anew "eq_court_return")
    (object_create_folder_anew "v_court_return")
    (pose_body "sc_court_return_marine_1" pose_face_down_var2)
    (pose_body "sc_court_return_marine_2" pose_face_down_var3)
)

(script static void f_objects_court_return_destroy
    (object_destroy_folder "sc_court_return")
    (object_destroy_folder "cr_court_return")
    (object_destroy_folder "dc_court_return")
    (object_destroy_folder "eq_court_return")
    (object_destroy_folder "v_court_return")
)

(script static void f_objects_court_shared_create
    (object_create_folder "dm_court_shared")
    (object_create_folder "v_court_shared")
    (object_create_folder "sc_court_shared")
    (object_create_folder "cr_court_shared")
)

(script static void f_objects_court_shared_destroy
    (object_destroy_folder "dm_court_shared")
    (object_destroy_folder "v_court_shared")
    (object_destroy_folder "sc_court_shared")
    (object_destroy_folder "cr_court_shared")
)

(script static void f_objects_valley_create
    (object_create_folder "dc_valley")
    (object_create_folder "cr_valley")
    (object_create_folder "wp_valley")
    (object_create_folder "sc_valley")
    (pose_body "sc_valley_marine_1" pose_on_side_var5)
)

(script static void f_objects_valley_destroy
    (object_destroy_folder "dc_valley")
    (object_destroy_folder "cr_valley")
    (object_destroy_folder "sc_valley")
)

(script static void f_objects_exterior_create
    (object_create_folder "dm_exterior")
    (object_create_folder "dc_exterior")
    (object_create_folder "dt_exterior")
    (object_create_folder "wp_exterior")
    (object_create_folder "sc_exterior")
    (object_create_folder "cr_exterior")
    (pose_body "sc_exterior_marine_1" pose_against_wall_var2)
    (pose_body "sc_exterior_marine_2" pose_on_side_var1)
    (pose_body "sc_exterior_marine_3" pose_against_wall_var1)
    (pose_body "sc_exterior_marine_4" pose_against_wall_var2)
    (pose_body "sc_exterior_marine_5" pose_against_wall_var3)
    (pose_body "sc_exterior_marine_6" pose_face_down_var3)
    (pose_body "sc_exterior_marine_7" pose_on_back_var3)
    (pose_body "sc_exterior_marine_8" pose_on_side_var4)
    (pose_body "sc_exterior_marine_9" pose_face_down_var2)
    (pose_body "sc_exterior_marine_10" pose_on_side_var5)
    (if (difficulty_is_legendary) 
        (object_create "dt_term_2") (object_destroy "dt_term_2"))
)

(script static void f_objects_exterior_destroy
    (object_destroy_folder "dm_exterior")
    (object_destroy_folder "dc_exterior")
    (object_destroy_folder "dt_exterior")
    (object_destroy_folder "sc_exterior")
    (object_destroy_folder "cr_exterior")
)

(script static void f_objects_interior_create
    (object_create_folder "dm_interior")
    (object_create_folder "dc_interior")
    (object_create_folder "dt_interior")
    (object_create_folder "eq_interior")
    (object_create_folder "wp_interior")
    (object_create_folder "v_interior")
    (object_create_folder "sc_interior")
    (object_create_folder "cr_interior")
    (object_destroy "sc_breach_proxy")
    (object_destroy "swordbase_smoke_outside_01")
    (object_destroy "swordbase_smoke_outside_02")
    (object_destroy "swordbase_smoke_outside_03")
    (pose_body "sc_interior_marine_1" pose_on_back_var2)
    (pose_body "sc_interior_marine_2" pose_against_wall_var3)
    (pose_body "sc_interior_marine_3" pose_face_down_var3)
    (pose_body "sc_interior_marine_4" pose_on_side_var3)
    (pose_body "sc_interior_marine_5" pose_on_back_var2)
    (if (difficulty_is_normal_or_higher) 
        (object_create "dt_term_1") (object_destroy "dt_term_1"))
)

(script static void f_objects_interior_destroy
    (object_destroy_folder "dm_interior")
    (object_destroy_folder "dc_interior")
    (object_destroy_folder "dt_interior")
    (object_destroy_folder "eq_interior")
    (object_destroy_folder "wp_interior")
    (object_destroy_folder "v_interior")
    (object_destroy_folder "sc_interior")
    (object_destroy_folder "cr_interior")
)

(script static void f_objects_outro_destroy
    (object_destroy "dm_corvette_exterior")
    (object_destroy "dm_corvette_sword")
)

(script dormant void f_train_targetlaser
    (wake f_train_targetlaser_0)
    (wake f_train_targetlaser_1)
    (wake f_train_targetlaser_2)
    (wake f_train_targetlaser_3)
)

(script dormant void f_train_targetlaser_0
    (sleep_until (unit_has_weapon (player0) "objects\weapons\pistol\target_laser\target_laser.weapon"))
    (f_hud_training_new_weapon_player player0)
)

(script dormant void f_train_targetlaser_1
    (sleep_until (unit_has_weapon (player1) "objects\weapons\pistol\target_laser\target_laser.weapon"))
    (f_hud_training_new_weapon_player player1)
)

(script dormant void f_train_targetlaser_2
    (sleep_until (unit_has_weapon (player2) "objects\weapons\pistol\target_laser\target_laser.weapon"))
    (f_hud_training_new_weapon_player player2)
)

(script dormant void f_train_targetlaser_3
    (sleep_until (unit_has_weapon (player3) "objects\weapons\pistol\target_laser\target_laser.weapon"))
    (f_hud_training_new_weapon_player player3)
)

(script dormant void f_train_armorlock
    (wake f_train_armorlock_0)
    (wake f_train_armorlock_1)
    (wake f_train_armorlock_2)
    (wake f_train_armorlock_3)
)

(script dormant void f_train_armorlock_0
    (sleep_until (unit_has_equipment (player0) "objects\equipment\armor_lockup\armor_lockup.equipment"))
    (f_hud_training_new_weapon_player player0)
)

(script dormant void f_train_armorlock_1
    (sleep_until (unit_has_equipment (player1) "objects\equipment\armor_lockup\armor_lockup.equipment"))
    (f_hud_training_new_weapon_player player1)
)

(script dormant void f_train_armorlock_2
    (sleep_until (unit_has_equipment (player2) "objects\equipment\armor_lockup\armor_lockup.equipment"))
    (f_hud_training_new_weapon_player player2)
)

(script dormant void f_train_armorlock_3
    (sleep_until (unit_has_equipment (player3) "objects\equipment\armor_lockup\armor_lockup.equipment"))
    (f_hud_training_new_weapon_player player3)
)

(script static void f_train_fireteams_1
    (f_hud_training_forever player0 "train_fireteams_1")
    (f_hud_training_forever player1 "train_fireteams_1")
    (f_hud_training_forever player2 "train_fireteams_1")
    (f_hud_training_forever player3 "train_fireteams_1")
    (sleep 200)
    (f_hud_training_clear player0)
    (f_hud_training_clear player1)
    (f_hud_training_clear player2)
    (f_hud_training_clear player3)
    (sleep 60)
)

(script dormant void f_train_fireteams_2_p0
    (sleep_until (> (ai_living_count "sq_player_0") 0) 5)
    (f_train_fireteams_2 player0)
)

(script dormant void f_train_fireteams_2_p1
    (sleep_until (> (ai_living_count "sq_player_1") 0) 5)
    (f_train_fireteams_2 player1)
)

(script dormant void f_train_fireteams_2_p2
    (sleep_until (> (ai_living_count "sq_player_2") 0) 5)
    (f_train_fireteams_2 player2)
)

(script dormant void f_train_fireteams_2_p3
    (sleep_until (> (ai_living_count "sq_player_3") 0) 5)
    (f_train_fireteams_2 player3)
)

(script static void f_train_fireteams_2 (player p)
    (f_hud_training_forever p "train_fireteams_2")
    (sleep 200)
    (f_hud_training_clear p)
)

(script static void f_vehicle_goto_set (short dir)
    (if (= dir vehicle_none) 
        (set s_vehicle_goto_idx 0))
    (if (= dir vehicle_air) 
        (set s_vehicle_goto_idx 1))
    (if (= dir vehicle_far) 
        (set s_vehicle_goto_idx 2))
    (if (= dir vehicle_return) 
        (set s_vehicle_goto_idx 3))
    (if (= dir vehicle_airorfar) 
        (set s_vehicle_goto_idx (random_range 1 3)))
)

(script command_script void f_cs_vehicle_rollout
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (sleep_until 
        (begin
            (ai_vehicle_enter ai_current_actor (ai_vehicle_get ai_current_actor))
            (if (vehicle_test_seat_unit (ai_vehicle_get ai_current_actor) warthog_d ai_current_actor) 
                (begin
                    (if (= s_vehicle_goto_idx vehicle_air) 
                        (begin
                            (if (volume_test_objects "tv_vehicle_far_cross" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/cross")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_tunnel" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/tunnel")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_ledge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/ledge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_center" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/center")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_ramp" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/ramp")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_dock" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/dock")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_bank" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/bank")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_bowl" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/bowl")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_fork" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/fork")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_runoff" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/runoff")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_ridge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/ridge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_twist" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/twist")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_river" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_air/river")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_cliff" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_air/cliff")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_dip" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_air/dip")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_foyer" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_far/foyer")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_ice" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/ice")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_beach" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.7)
                                    (cs_go_to "ps_vehicles_air_valley/beach")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_elbow" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.7)
                                    (cs_go_to "ps_vehicles_air_valley/elbow")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_snake" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/snake")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_stream" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.8)
                                    (cs_go_to "ps_vehicles_air_valley/stream")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_marcela" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/marcela")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_gate" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/gate")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_neck" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/neck")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_triangle" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.5)
                                    (cs_go_to "ps_vehicles_air_valley/triangle")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_split" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/split")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_peak" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.6)
                                    (cs_go_to "ps_vehicles_air_valley/peak")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_alley" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.8)
                                    (cs_go_to "ps_vehicles_air_valley/alley")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_bridge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/bridge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_stream" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/stream")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_wall" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_valley/wall")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_hill" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.8)
                                    (cs_go_to "ps_vehicles_air_valley/hill")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_pipe" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_air/pipe")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_view" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_air_air/view")
                                )
                            )
                        )
                    )
                    (if (= s_vehicle_goto_idx vehicle_far) 
                        (begin
                            (if (volume_test_objects "tv_vehicle_air_view" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/view")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_look" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/look")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_antenna" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/antenna")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_lake" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/lake")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_over" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/over")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_platform" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/platform")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_garage" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/garage")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_road" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/road")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_back" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/back")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_nexus" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/nexus")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_crest" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/crest")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_dip" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_air/dip")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_cliff" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.8)
                                    (cs_go_to "ps_vehicles_far_air/cliff")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_river" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_far/river")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_twist" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.8)
                                    (cs_go_to "ps_vehicles_far_far/twist")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_ridge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_far/ridge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_runoff" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_far/runoff")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_fork" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_far/fork")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_pipe" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/pipe")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_hill" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/hill")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_wall" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/wall")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_bridge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/bridge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_triangle" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/triangle")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_peak" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/peak")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_alley" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/alley")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_neck" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/neck")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_split" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/split")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_marcela" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/marcela")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_gate" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/gate")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_stream" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/stream")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_snake" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/snake")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_elbow" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/elbow")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_beach" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_valley/beach")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_ice" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_far/ice")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_foyer" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_far_far/foyer")
                                )
                            )
                        )
                    )
                    (if (= s_vehicle_goto_idx vehicle_return) 
                        (begin
                            (if (volume_test_objects "tv_vehicle_airfar_river" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/river")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_twist" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.8)
                                    (cs_go_to "ps_vehicles_valley_far/twist")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_ridge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/ridge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_runoff" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/runoff")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_fork" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/fork")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_cliff" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/cliff")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_airfar_dip" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/dip")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_garage" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/garage")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_back" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/back")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_platform" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/platform")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_over" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/over")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_antenna" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/antenna")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_lake" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/lake")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_look" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/look")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_crest" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/crest")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_nexus" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/nexus")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_road" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/road")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_air_view" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_air/view")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_cross" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/cross")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_ledge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/ledge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_tunnel" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/tunnel")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_center" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/center")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_dock" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/dock")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_ramp" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/ramp")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_bowl" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/bowl")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_far_bank" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/bank")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_pipe" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/pipe")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_hill" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/hill")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_wall" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/wall")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_bridge" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/bridge")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_snake" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/snake")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_stream" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/stream")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_elbow" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.7)
                                    (cs_go_to "ps_vehicles_valley_valley/elbow")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_beach" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 0.7)
                                    (cs_go_to "ps_vehicles_valley_valley/beach")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_ice" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/ice")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_foyer" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_far/foyer")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_triangle" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/triangle")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_split" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/split")
                                )
                            )
                            (if (volume_test_objects "tv_vehicle_valley_neck" ai_current_actor) 
                                (begin
                                    (cs_vehicle_speed 1.0)
                                    (cs_go_to "ps_vehicles_valley_valley/neck")
                                )
                            )
                        )
                    )
                )
            )
            false
        ) 
    5)
)

(script dormant void f_court_main
    (sleep_until (= b_mission_started true))
    (dprint "::: courtyard encounter :::")
    (data_mine_set_mission_segment "m20_01_courtyard")
    (set b_court_ready true)
    (set s_wave_spawning 0)
    (f_ai_detail ai_detail_high)
    (f_zoneset_direction direction_outward)
    (airstrike_set_launches 2)
    (wake f_court_zoneset_valley)
    (wake f_gatehouse_door_control)
    (wake f_court_save_control)
    (wake f_court_waypoint_control)
    (wake f_court_missionobj_control)
    (wake f_court_music_control)
    (wake f_court_md_control)
    (wake f_court_spawn_control)
    (wake f_court_flock_control)
    (wake f_court_cleanup_control)
    (wake f_train_targetlaser)
    (wake f_train_armorlock)
    (if b_debug 
        (print "objective control : courtyard.1"))
    (unit_raise_weapon (player0) 1)
    (unit_raise_weapon (player1) 1)
    (unit_raise_weapon (player2) 1)
    (unit_raise_weapon (player3) 1)
    (set s_objcon_court 1)
    (f_cin_intro_finish)
    (cinematic_exit_into_title "020la_sword" true)
    (sleep_until (volume_test_players "tv_court_ramps") 5)
    (if b_debug 
        (print "objective control : courtyard.05"))
    (set s_objcon_court 5)
    (sleep_until (volume_test_players "tv_court_ledge") 5)
    (if b_debug 
        (print "objective control : courtyard.10"))
    (set s_objcon_court 10)
    (sleep_until (volume_test_players "tv_court_barricade") 5)
    (if b_debug 
        (print "objective control : courtyard.20"))
    (set s_objcon_court 20)
    (sleep_until (volume_test_players "tv_court_garage") 5)
    (if b_debug 
        (print "objective control : courtyard.30"))
    (set s_objcon_court 30)
    (sleep_until (volume_test_players "tv_court_elbow") 5)
    (if b_debug 
        (print "objective control : courtyard.40"))
    (set s_objcon_court 40)
    (sleep_until (volume_test_players "tv_court_elbow_mid") 5)
    (if b_debug 
        (print "objective control : courtyard.45"))
    (set s_objcon_court 45)
    (sleep_until b_court_defended)
    (if b_debug 
        (print "objective control : courtyard.50"))
    (set s_objcon_court 50)
)

(script dormant void f_court_flock_control
    (flock_create "flock_exterior_banshee_01")
    (flock_create "flock_exterior_banshee_02")
    (flock_create "flock_exterior_falcon_01")
    (flock_create "flock_exterior_falcon_02")
    (flock_create "flock_exterior_phantom_01")
)

(script dormant void f_court_zoneset_valley
    (sleep (* 30.0 5.0))
    (prepare_to_switch_to_zone_set "zoneset_courtyard_valley")
    (sleep (* 30.0 20.0))
    (switch_zone_set "zoneset_courtyard_valley")
    (soft_ceiling_enable "camera_blocker_06" false)
)

(script dormant void f_court_save_control
    (sleep_until (>= s_objcon_court 1))
    (game_save_immediate)
    (sleep_until (>= s_objcon_court 40))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_court 50))
    (game_save_no_timeout)
)

(script dormant void f_court_missionobj_control
    (sleep_until (>= s_objcon_court 1))
    (tit_courtyard)
    (sleep 200)
    (mo_courtyard)
)

(script dormant void f_court_waypoint_control
    (sleep_until (>= s_objcon_court 40) 5 (* 30.0 240.0))
    (if (not (>= s_objcon_court 40)) 
        (begin
            (f_blip_flag "fl_court_waypoint_1" blip_destination)
            (sleep_until (>= s_objcon_court 40) 5)
            (f_unblip_flag "fl_court_waypoint_1")
        )
    )
)

(script dormant void f_court_music_control
    (sleep_until (>= s_objcon_court 1) 5)
    (wake music_court)
)

(script dormant void f_court_md_control
    (sleep_until (>= s_objcon_court 1) 1)
    (md_court_intro)
    (sleep 100)
    (md_court_north)
    (sleep_until (>= s_objcon_court 50) 1)
    (md_court_combatend)
)

(script dormant void f_court_spawn_control
    (if b_debug 
        (print "::: spawning all courtyard squads"))
    (f_squad_group_place "gr_court_cov_init")
    (if (game_is_cooperative) 
        (begin
            (if (= (game_coop_player_count) 2) 
                (begin
                    (ai_place "sq_court_marine_init_1/marine_1")
                    (ai_place "sq_court_marine_init_1/marine_2")
                    (ai_place "sq_court_marine_init_2/marine_1")
                )
            )
            (if (= (game_coop_player_count) 2) 
                (begin
                    (ai_place "sq_court_marine_init_1/marine_1")
                    (ai_place "sq_court_marine_init_1/marine_2")
                )
            )
            (if (= (game_coop_player_count) 3) 
                (begin
                    (ai_place "sq_court_marine_init_1/marine_1")
                )
            )
        ) (begin
            (f_squad_group_place "gr_court_hum_init")
        )
    )
    (sleep_until 
        (or
            (<= (ai_living_count "obj_court_cov") 4)
            (volume_test_players "tv_court_ramps")
        ) 
    5)
    (ai_place "sq_court_phantom_w1")
    (ai_place "sq_court_cov_w1_3")
    (ai_place "sq_court_cov_w1_4")
    (set s_court_wave 1)
    (sleep_until (volume_test_players "tv_court_elbow") 5)
    (ai_place "gr_court_cov_elbow")
    (sleep_until 
        (and
            (<= (ai_living_count "obj_court_cov") 0)
            (or
                (not b_court_phantom_w1_spawn)
                (<= (object_get_health (ai_vehicle_get_from_squad "sq_court_phantom_w1" 0)) 0.0)
            )
        ) 
    5)
    (set b_court_defended true)
)

(script dormant void f_court_boss_death_tracker
    (sleep (* 30.0 6.0))
    (sleep_until (<= (ai_living_count "sq_court_cov_w1_1") 0) 5)
    (set s_music_court 2)
)

(script command_script void f_cs_court_phantom_w1
    (cs_enable_pathfinding_failsafe true)
    (cs_enable_targeting true)
    (cs_ignore_obstacles true)
    (set b_court_phantom_w1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_phantom (ai_vehicle_get ai_current_actor) "chute" "sq_court_cov_w1_1" "sq_court_cov_w1_2" none none)
    (cs_fly_by "ps_court_phantom_w1/enter_01")
    (cs_fly_by "ps_court_phantom_w1/enter_02")
    (cs_fly_by "ps_court_phantom_w1/enter_03")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_court_phantom_w1/hover_in" "ps_court_phantom_w1/hover_in_face" 0.1)
    (cs_fly_to_and_face "ps_court_phantom_w1/drop" "ps_court_phantom_w1/drop_face" 0.1)
    (print "drop")
    (f_unload_phantom (ai_vehicle_get ai_current_actor) "chute")
    (set b_court_phantom_w1_spawn false)
    (wake f_md_court_contacts_0)
    (wake f_court_boss_death_tracker)
    (cs_fly_to_and_face "ps_court_phantom_w1/hover_out" "ps_court_phantom_w1/hover_out_face")
    (cs_enable_targeting false)
    (cs_vehicle_speed 1.0)
    (cs_fly_to_and_face "ps_court_phantom_w1/exit_01" "ps_court_phantom_w1/exit_01_face")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_to_and_face "ps_court_phantom_w1/erase" "ps_court_phantom_w1/erase_face")
    (ai_erase ai_current_squad)
)

(script dormant void f_md_court_drop_0
    (md_court_drop_0)
)

(script dormant void f_md_court_contacts_0
    (md_court_contacts_0)
)

(script dormant void f_court_phantom_point
    (sleep 90)
    (thespian_performance_setup_and_begin "th_court_elbow_look" "" 25.0)
)

(script static void f_court_cleanup
    (sleep_forever f_court_main)
)

(script static void f_court_despawn_prev
    (sleep 0)
)

(script static void f_court_despawn_all
    (ai_erase "gr_court_cov")
)

(script static void f_court_kill_scripts
    (sleep 0)
)

(script dormant void f_court_cleanup_control
    (sleep_until (= 1.0 0.0) 5)
    (f_court_despawn_all)
    (f_court_kill_scripts)
)

(script dormant void f_exterior_cleanup
    (sleep_until 
        (begin
            (if 
                (and
                    b_air_defended
                    (not (volume_test_players "tv_area_air_wide"))
                ) 
                    (begin
                        (print "cleanup airview")
                        (ai_erase "sq_air_cov_init_1")
                        (ai_erase "sq_air_cov_init_2")
                        (ai_erase "sq_air_cov_init_3")
                        (ai_erase "sq_air_cov_init_4")
                        (ai_erase "sq_air_cov_counter_1_1")
                        (ai_erase "sq_air_cov_counter_1_2")
                        (ai_erase "sq_air_cov_counter_1_3")
                    )
            )
            (if 
                (and
                    b_far_defended
                    (not (volume_test_players "tv_area_far_wide"))
                ) 
                    (begin
                        (print "cleanup farragut")
                        (ai_erase "sq_far_cov_init_1")
                        (ai_erase "sq_far_cov_init_2")
                        (ai_erase "sq_far_grunt_init_1")
                        (ai_erase "sq_far_jackalsniper_init_1")
                        (ai_erase "sq_far_cov_counter_1_1")
                        (ai_erase "sq_far_cov_counter_1_2")
                        (ai_erase "sq_far_cov_counter_1_3")
                        (ai_erase "sq_far_cov_counter_1_4")
                    )
            )
            (if 
                (and
                    (or
                        (volume_test_players "tv_area_air_wide")
                        (volume_test_players "tv_area_far_wide")
                        (volume_test_players "tv_area_airfar_wide")
                    )
                    (not (volume_test_players "tv_area_valley"))
                ) 
                    (begin
                        (print "cleanup valley")
                        (ai_erase "gr_court_hum_init")
                        (ai_erase "sq_valley_cov_1")
                    )
            )
            (if 
                (and
                    (volume_test_players "tv_area_airfar_wide")
                    (not (volume_test_players "tv_area_valley_wide"))
                ) 
                    (begin
                        (print "cleanup valley wide")
                        (ai_erase "sq_valley_cov_air")
                        (ai_erase "sq_valley_cov_far")
                    )
            )
            (if 
                (and
                    (volume_test_players "tv_area_valley_wide")
                    (not (volume_test_players "tv_area_airfar_wide"))
                ) 
                    (begin
                        (print "cleanup air far")
                        (ai_erase "sq_air_far_cov_w1_1")
                        (ai_erase "sq_air_far_cov_w1_2")
                    )
            )
            false
        ) 
    90)
)

(script dormant void f_valley_main
    (sleep_until 
        (and
            (= b_court_defended true)
            true
        ) 
    5)
    (dprint "::: valley encounter :::")
    (data_mine_set_mission_segment "m20_02_valley")
    (set s_objcon_valley 1)
    (ai_set_objective "gr_hum" "obj_valley_hum")
    (ai_set_objective "gr_spartans" "obj_valley_hum")
    (f_zoneset_direction direction_outward)
    (f_loadout_set "exterior")
    (wake f_valley_save_control)
    (wake f_valley_missionobj_control)
    (wake f_valley_waypoint_control)
    (wake f_valley_spawn_control)
    (wake f_valley_md_control)
    (wake f_valley_music_control)
    (wake f_valley_warthog_kill)
    (wake f_valley_pelican_hog)
    (wake f_valley_troophog_join)
    (if b_debug 
        (print "objective control : valley.01"))
    (set b_insertion_fade_in true)
    (set s_objcon_valley 1)
    (sleep_until (volume_test_players "tv_valley_05") 5)
    (if b_debug 
        (print "objective control : valley.05"))
    (set s_objcon_valley 5)
    (sleep_until b_gatehouse_door_open)
    (if b_debug 
        (print "objective control : valley.07"))
    (set s_objcon_valley 7)
    (game_insertion_point_unlock 1)
    (f_ai_detail ai_detail_low)
    (wake f_exterior_cleanup)
    (sleep_until (volume_test_players "tv_valley_10") 5)
    (if b_debug 
        (print "objective control : valley.10"))
    (set s_objcon_valley 10)
    (sleep_until (volume_test_players "tv_valley_20") 5)
    (if b_debug 
        (print "objective control : valley.20"))
    (set s_objcon_valley 20)
    (sleep_until (volume_test_players "tv_valley_30") 5)
    (if b_debug 
        (print "objective control : valley.30"))
    (set s_objcon_valley 30)
    (sleep_until 
        (or
            (volume_test_players "tv_valley_exit_to_airview")
            (volume_test_players "tv_valley_exit_to_faragate")
        ) 
    5)
    (if b_debug 
        (print "objective control : valley.40"))
    (set s_objcon_valley 40)
    (set s_music_court 4)
    (set s_music_valley 4)
)

(script dormant void f_valley_troophog_join
    (sleep_until 
        (or
            (>= s_objcon_valley 40)
            b_valley_hog_drop_start
        )
    )
    (ai_set_objective "sq_valley_warthog" "obj_vehicles_hum")
)

(script dormant void f_valley_save_control
    (wake f_valley_save_combatend)
    (sleep_until (>= s_objcon_valley 1))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_valley 5))
    (game_save_no_timeout)
)

(script dormant void f_valley_save_combatend
    (sleep_until (> (ai_living_count "gr_valley_cov") 0) 3)
    (tick)
    (sleep_until (<= (ai_living_count "gr_valley_cov") 0) 3)
    (game_save_no_timeout)
)

(script dormant void f_valley_missionobj_control
    (sleep_until (>= s_objcon_valley 7))
    (tit_valley)
    (sleep 200)
    (mo_valley)
)

(script dormant void f_valley_waypoint_control
    (sleep_until (player_in_vehicle "sq_valley_warthog_drop") 1)
    (sleep_until (>= s_objcon_valley 40) 5 (* 30.0 s_valley_waypoint_timer))
    (if (not (>= s_objcon_valley 40)) 
        (begin
            (f_blip_flag "fl_valley_waypoint_1_1" blip_destination)
            (f_blip_flag "fl_valley_waypoint_1_2" blip_destination)
            (sleep_until (>= s_objcon_valley 40) 5)
            (f_unblip_flag "fl_valley_waypoint_1_1")
            (f_unblip_flag "fl_valley_waypoint_1_2")
        )
    )
)

(script dormant void f_valley_music_control
    (if b_valley_ins 
        (begin
            (wake music_valley)
            (set s_music_valley 3)
        )
    )
)

(script dormant void f_valley_md_control
    (wake f_md_valley_airtagger)
    (wake f_md_valley_tagshoot)
    (wake f_md_valley_choice)
    (if (> (game_coop_player_count) 2) 
        (begin
            (sleep_until (>= s_objcon_valley 20))
            (md_valley_trooper_near)
        )
    )
)

(script dormant void f_md_valley_airtagger
    (branch
        (or
            (>= s_objcon_air 1)
            (>= s_objcon_far 1)
        )
        (f_abort)
    )
    (sleep_until (>= s_objcon_valley 5) 5)
    (md_valley_airtagger)
    (sleep_until b_airtagger_taken 5 (* 30.0 60.0))
    (if (not b_airtagger_taken) 
        (begin
            (md_valley_airtagger_delay_0)
        )
    )
    (sleep_until b_airtagger_taken 5 (* 30.0 60.0))
    (if (not b_airtagger_taken) 
        (begin
            (md_valley_airtagger_delay_1)
        )
    )
    (sleep_until b_airtagger_taken 5 (* 30.0 60.0))
    (if (not b_airtagger_taken) 
        (begin
            (md_valley_airtagger_delay_2)
        )
    )
)

(script dormant void f_md_valley_tagshoot
    (branch
        (or
            (>= s_objcon_air 1)
            (>= s_objcon_far 1)
        )
        (f_abort)
    )
    (sleep_until (> (ai_task_count "obj_valley_cov/gate_wraiths") 0) 5)
    (sleep_until (<= (ai_task_count "obj_valley_cov/gate_wraiths") 0) 1 (* 30.0 20.0))
    (if (not (<= (ai_task_count "obj_valley_cov/gate_wraiths") 0)) 
        (begin
            (md_valley_tagshoot_delay_0)
        )
    )
    (sleep_until (<= (ai_task_count "obj_valley_cov/gate_wraiths") 0) 1 (* 30.0 60.0))
    (if (not (<= (ai_task_count "obj_valley_cov/gate_wraiths") 0)) 
        (begin
            (md_valley_tagshoot_delay_1)
        )
    )
)

(script dormant void f_md_valley_choice
    (sleep_until 
        (or
            (player_in_vehicle "sq_valley_warthog_drop")
            (>= s_objcon_valley 40)
        ) 
    1)
    (sleep (* 30.0 (random_range 1 2)))
    (md_valley_choice)
    (sleep_until (>= s_objcon_valley 40) 1 (* 30.0 90.0))
    (if (not (>= s_objcon_valley 40)) 
        (begin
            (md_valley_choice_delay_0)
        )
    )
    (sleep_until (>= s_objcon_valley 40) 1)
    (if (volume_test_players "tv_valley_exit_to_airview") 
        (md_valley_choice_air))
    (if (volume_test_players "tv_valley_exit_to_faragate") 
        (md_valley_choice_far))
)

(script dormant void f_valley_spawn_control
    (f_squad_group_place "gr_valley_cov_init")
    (if (= (game_coop_player_count) 1) 
        (begin
            (f_squad_group_place "gr_valley_hum_init")
        )
    )
    (if (= (game_coop_player_count) 2) 
        (begin
            (ai_place "sq_valley_marines_1/marine_1")
            (ai_place "sq_valley_marines_1/marine_2")
        )
    )
    (if (= (game_coop_player_count) 3) 
        (begin
            (ai_place "sq_valley_marines_1/marine_1")
        )
    )
    (if (>= (game_coop_player_count) 3) 
        (ai_place "sq_valley_troophog"))
    (wake f_valley_spawn_air)
    (wake f_valley_spawn_far)
)

(script dormant void f_valley_spawn_air
    (sleep_until (volume_test_players "tv_valley_exit_to_airview") 5)
    (sleep_forever f_valley_spawn_far)
    (set b_valley_spawn_air true)
    (ai_place "gr_valley_cov_air")
)

(script dormant void f_valley_spawn_far
    (sleep_until (volume_test_players "tv_valley_exit_to_faragate") 5)
    (sleep_forever f_valley_spawn_air)
    (set b_valley_spawn_far true)
    (ai_place "gr_valley_cov_far")
)

(script dormant void f_valley_warthog_kill
    (sleep_until (>= s_objcon_valley 10))
    (ai_place "sq_valley_warthog")
    (ai_squad_enumerate_immigrants "sq_valley_warthog" true)
    (cs_run_command_script "sq_valley_warthog/driver01" f_cs_sleep)
    (ai_place "sq_valley_wraith_1")
    (ai_place "sq_valley_wraith_2")
    (wake f_md_valley_hogkill)
    (cs_run_command_script "sq_valley_warthog/driver01" f_cs_valley_warthog)
    (sleep 40)
    (object_can_take_damage (ai_vehicle_get_from_starting_location "sq_valley_wraith_1/driver01"))
    (object_can_take_damage (ai_vehicle_get_from_starting_location "sq_valley_wraith_2/driver01"))
    (cs_run_command_script "sq_valley_wraith_1/driver01" f_cs_valley_wraith_1)
    (cs_run_command_script "sq_valley_wraith_2/driver01" f_cs_valley_wraith_2)
)

(script dormant void f_md_valley_hogkill
    (md_valley_hogkill)
)

(script command_script void f_cs_valley_warthog
    (effect_new_on_object_marker_loop "objects\vehicles\human\warthog\fx\destruction\body_constant_major.effect" (ai_vehicle_get_from_starting_location "sq_valley_warthog/driver01") "")
    (cs_enable_moving true)
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_go_to "ps_valley_warthog/move_01")
    (cs_go_to "ps_valley_warthog/move_02")
    (cs_go_to "ps_valley_warthog/move_03")
    (sleep 50)
    (object_damage_damage_section (ai_vehicle_get_from_starting_location "sq_valley_warthog/driver01") "hull_front" 999.0)
    (effect_stop_object_marker "objects\vehicles\human\warthog\fx\destruction\body_constant_major.effect" (ai_vehicle_get_from_starting_location "sq_valley_warthog/driver01") "")
    (set b_valley_warthog_deadend true)
    (set b_valley_warthog_killed true)
)

(script command_script void f_cs_valley_wraith_1
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to_and_face "ps_valley_wraith_1/move_01" "ps_valley_wraith_1/shoot")
    (cs_shoot true (ai_vehicle_get_from_starting_location "sq_valley_warthog/driver01"))
    (sleep_until 
        (or
            (>= s_objcon_valley 30)
            (<= (unit_get_health (ai_vehicle_get "sq_valley_warthog/driver01")) 0.0)
        ) 
    5 480)
    (ai_set_blind ai_current_squad false)
    (ai_set_deaf ai_current_squad false)
)

(script command_script void f_cs_valley_wraith_2
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_go_to_and_face "ps_valley_wraith_2/move_01" "ps_valley_wraith_2/shoot")
    (cs_shoot true (ai_vehicle_get_from_starting_location "sq_valley_warthog/driver01"))
    (sleep_until 
        (or
            (>= s_objcon_valley 30)
            (<= (unit_get_health (ai_vehicle_get "sq_valley_warthog/driver01")) 0.0)
        ) 
    5 480)
    (ai_set_blind ai_current_squad false)
    (ai_set_deaf ai_current_squad false)
)

(script dormant void f_valley_pelican_hog
    (sleep_until (> (ai_living_count "gr_valley_cov_init") 0))
    (sleep_until 
        (and
            (<= (ai_living_count "gr_valley_cov_wraiths") 0)
            (<= (ai_living_count "gr_valley_cov_init") 2)
        ) 
    3)
    (set b_valley_hog_drop_start true)
    (dprint "valley pelican")
    (ai_place "sq_valley_pelican")
    (md_valley_wraiths_dead)
    (f_vehicle_goto_set vehicle_airorfar)
)

(script command_script void f_cs_valley_pelican
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (object_cannot_die "sq_valley_pelican" true)
    (ai_place "sq_valley_warthog_drop")
    (ai_squad_enumerate_immigrants "sq_valley_warthog_drop" true)
    (wake f_valley_hog_blip)
    (vehicle_load_magic (ai_vehicle_get ai_current_actor) pelican_lc (ai_vehicle_get_from_starting_location "sq_valley_warthog_drop/driver01"))
    (set b_sq_valley_pelican_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get "sq_valley_warthog_drop") 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (object_set_scale (ai_vehicle_get "sq_valley_warthog_drop") 1.0 (* 30.0 5.0))
    (cs_fly_by "ps_valley_pelican/enter_01")
    (cs_fly_by "ps_valley_pelican/enter_02")
    (wake f_md_valley_hog)
    (cs_fly_by "ps_valley_pelican/hover_in")
    (cs_vehicle_speed 0.7)
    (cs_fly_to_and_face "ps_valley_pelican/drop" "ps_valley_pelican/drop_face" 0.1)
    (sleep 60)
    (sleep_until (not (volume_test_players "tv_valley_pelican_drop")) 5)
    (vehicle_unload (ai_vehicle_get ai_current_actor) pelican_lc)
    (set b_valley_hog_drop true)
    (sleep 100)
    (set b_sq_valley_pelican_spawn false)
    (cs_fly_by "ps_valley_pelican/hover_out")
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_valley_pelican/exit_01")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_by "ps_valley_pelican/erase")
    (ai_erase ai_current_squad)
)

(script dormant void f_valley_hog_blip
    (f_blip_object_offset (ai_vehicle_get_from_starting_location "sq_valley_warthog_drop/driver01") 5 1)
    (sleep_until 
        (or
            (player_in_vehicle "sq_valley_warthog_drop")
            (volume_test_players "tv_valley_exit_to_airview")
            (volume_test_players "tv_valley_exit_to_faragate")
        ) 
    5)
    (f_unblip_object (ai_vehicle_get_from_starting_location "sq_valley_warthog_drop/driver01"))
)

(script dormant void f_md_valley_hog
    (md_valley_hog)
)

(script static void f_valley_cleanup
    (sleep_forever f_valley_main)
    (sleep_forever f_valley_spawn_control)
    (sleep_forever f_valley_md_control)
    (sleep_forever f_valley_warthog_kill)
)

(script dormant void f_far_main
    (sleep_until (volume_test_players "tv_far_start") 5)
    (f_squad_group_place "gr_far_cov_init")
    (sleep_forever f_valley_pelican_hog)
    (soft_ceiling_enable "camera_blocker_01" false)
    (soft_ceiling_enable "camera_blocker_02" false)
    (sleep_until 
        (or
            (<= s_objcon_air 0)
            b_air_defended
        ) 
    5)
    (if b_debug 
        (print "::: faragate encounter :::"))
    (set s_wave_spawning 0)
    (set b_far_ready true)
    (set s_exterior_objective_last 2)
    (f_ai_detail ai_detail_low)
    (f_zoneset_direction direction_none)
    (wake f_far_objective_nanny)
    (wake f_far_save_control)
    (wake f_far_missionobj_control)
    (wake f_far_waypoint_control)
    (wake f_far_music_control)
    (wake f_far_md_control)
    (wake f_far_cleanup_control)
    (wake f_far_spawn_control)
    (wake f_far_hilite_control)
    (wake f_far_comm_control)
    (wake f_far_strike_control)
    (if b_debug 
        (print "objective control : faragate.01"))
    (set b_insertion_fade_in true)
    (set s_objcon_far 1)
    (sleep_until (volume_test_players "tv_far_near") 5)
    (if b_debug 
        (print "objective control : faragate.10"))
    (set s_objcon_far 10)
    (sleep_until b_far_generator_on 5)
    (if b_debug 
        (print "objective control : faragate.15"))
    (set s_objcon_far 15)
    (sleep_until b_far_comm_on 5)
    (if b_debug 
        (print "objective control : faragate.20"))
    (set s_objcon_far 20)
    (sleep_until 
        (and
            b_far_spawn_done
            b_far_defended
        ) 
    5)
    (if (not b_air_defended) 
        (begin
            (if (volume_test_players "tv_area_far") 
                (f_far_drop_warthog))
        ) (begin
            (if (volume_test_players "tv_area_far") 
                (f_far_drop_bighog))
        )
    )
)

(script static void f_far_hog_return_test
    (set b_air_defended true)
    (f_far_drop_bighog)
)

(script static void f_far_hog_air_test
    (set b_air_defended false)
    (f_far_drop_warthog)
)

(script dormant void f_far_strike_control
    (sleep (* 30.0 5.0))
    (if (difficulty_is_normal_or_lower) 
        (begin
            (airstrike_set_launches 2)
        )
    )
)

(script dormant void f_far_objective_nanny
    (wake f_far_objective_kat)
    (sleep_until 
        (begin
            (f_squad_set_obj_area "obj_far_hum" "tv_area_far_hog")
            (or
                (and
                    b_far_spawn_done
                    b_far_defended
                )
                (and
                    b_far_defended
                    (not (volume_test_players "tv_area_far"))
                )
            )
        ) 
    (* 30.0 1.0))
    (if b_air_defended 
        (begin
            (f_vehicle_goto_set vehicle_return)
        ) (begin
            (f_vehicle_goto_set vehicle_air)
        )
    )
    (sleep_forever f_far_objective_kat)
    (sleep_forever f_far_distance_kat)
    (set b_far_kat_regroup true)
    (f_squad_set_obj "gr_vehicles_hum" "obj_vehicles_hum")
)

(script dormant void f_far_objective_kat
    (sleep_until (volume_test_object "tv_area_far" o_kat) 3)
    (ai_set_objective "gr_spartans" "obj_far_hum")
    (wake f_far_distance_kat)
)

(script dormant void f_far_distance_kat
    (sleep_until 
        (begin
            (if (>= (objects_distance_to_object (players) o_kat) 17.0) 
                (set b_far_kat_regroup true) (set b_far_kat_regroup false))
            false
        ) 
    30)
)

(script dormant void f_far_hilite_control
    (sleep_until (>= s_objcon_far 10) 5)
    (sleep 120)
    (sleep_until 
        (or
            (objects_can_see_object player0 "sc_far_hilite_gen_marker" 25.0)
            (objects_can_see_object player1 "sc_far_hilite_gen_marker" 25.0)
            (objects_can_see_object player2 "sc_far_hilite_gen_marker" 25.0)
            (objects_can_see_object player3 "sc_far_hilite_gen_marker" 25.0)
        ) 
    1)
    (f_hud_flash_object "sc_far_hilite_gen")
    (sleep_until (>= s_objcon_far 15) 5)
    (sleep 120)
    (sleep_until 
        (or
            (objects_can_see_object player0 "sc_far_hilite_comm_marker" 25.0)
            (objects_can_see_object player1 "sc_far_hilite_comm_marker" 25.0)
            (objects_can_see_object player2 "sc_far_hilite_comm_marker" 25.0)
            (objects_can_see_object player3 "sc_far_hilite_comm_marker" 25.0)
        ) 
    1)
    (f_hud_flash_object "sc_far_hilite_comm")
)

(script dormant void f_far_save_control
    (sleep_until (>= s_objcon_far 1))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_far 15))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_far 20))
    (game_save_no_timeout)
)

(script dormant void f_far_missionobj_control
    (sleep_until (>= s_objcon_far 1))
    (set s_music_far 1)
    (mo_faragate)
    (sleep_until b_far_defended)
    (sleep 30)
    (if (not b_far_spawn_done) 
        (mo_clean))
    (sleep_until 
        (or
            (not (volume_test_players "tv_far_near"))
            b_far_spawn_done
        ) 
    5)
    (if (not b_air_defended) 
        (begin
            (sleep 30)
            (mo_farair)
            (sleep 30)
            (md_far_done_airview)
        )
    )
)

(script dormant void f_far_waypoint_control
    (sleep_until 
        (or
            (and
                b_far_defended
                (not (volume_test_players "tv_area_far"))
            )
            (and
                b_far_spawn_done
                b_far_defended
            )
        ) 
    5)
    (sleep_until (>= s_objcon_air 1) 5 (* 30.0 s_far_waypoint_timer))
    (if (not (>= s_objcon_air 1)) 
        (begin
            (f_blip_flag "fl_far_waypoint_air" blip_destination)
            (sleep_until (>= s_objcon_air 1) 5)
            (f_unblip_flag "fl_far_waypoint_air")
        )
    )
)

(script dormant void f_far_cleanup_control
    (sleep_until 
        (and
            b_far_defended
            (not (volume_test_players "tv_far_start"))
        ) 
    5)
    (ai_erase "gr_far_cov")
)

(script dormant void f_far_md_control
    (wake f_far_md_return)
    (sleep_until (>= s_objcon_far 1) 1)
    (sleep (* 30.0 2.0))
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (wake f_far_md_suppress_1)
    (md_far_view)
    (sleep_until (>= s_objcon_far 10))
    (sleep (* 30.0 2.0))
    (md_far_target)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (sleep_until (>= s_objcon_far 15) 5 (* 30.0 180.0))
    (if (not (>= s_objcon_far 15)) 
        (md_far_generator_delay_0))
    (sleep_until (>= s_objcon_far 15) 5 (* 30.0 180.0))
    (if (not (>= s_objcon_far 15)) 
        (md_far_generator_delay_1))
    (sleep_until (>= s_objcon_far 15) 5)
    (sleep (* 30.0 5.0))
    (md_far_comm)
    (sleep_until (>= s_objcon_far 20) 5 (* 30.0 180.0))
    (if (not (>= s_objcon_far 20)) 
        (md_far_comm_delay_0))
    (sleep_until (>= s_objcon_far 20) 5 (* 30.0 180.0))
    (if (not (>= s_objcon_far 20)) 
        (md_far_comm_delay_1))
    (sleep_until (>= s_objcon_far 20) 5)
    (sleep (* 30.0 3.0))
    (md_far_done)
    (sleep_until 
        (or
            (>= s_objcon_air 1)
            (>= s_objcon_return 10)
        ) 
    5 (* 30.0 90.0))
    (if (not 
        (or
            (>= s_objcon_air 1)
            (>= s_objcon_return 10)
        )
    ) 
        (md_far_delay))
    (f_md_exterior_increment)
)

(script dormant void f_far_md_suppress_1
    (sleep (* 30.0 10.0))
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
)

(script dormant void f_far_md_return
    (sleep_until (volume_test_players "tv_far_near") 1)
    (branch
        b_far_defended
        (f_abort)
    )
    (sleep_until (not (volume_test_players "tv_far_start")) 1)
    (sleep (* 30.0 3.0))
    (md_far_return_0)
)

(script dormant void f_far_comm_control
    (sleep_until (>= s_objcon_far 0))
    (device_set_power "dc_far_generator_switch" 1.0)
    (sleep_until (>= (device_get_position "dc_far_generator_switch") 1.0) 5 (* 30.0 40.0))
    (if (not (> (device_get_position "dc_far_generator_switch") 0.0)) 
        (f_blip_object "dc_far_generator_switch" blip_interface))
    (sleep_until (>= (device_get_position "dc_far_generator_switch") 1.0) 5)
    (interpolator_start "farragut_gen_audio")
    (set b_far_generator_on true)
    (device_set_position "dm_far_generator_lever" 1.0)
    (wake f_far_generator_effects)
    (device_set_power "dc_far_comm_switch" 1.0)
    (f_unblip_object "dc_far_generator_switch")
    (sleep_until (>= (device_get_position "dc_far_comm_switch") 1.0) 5 (* 30.0 3.0))
    (if (not (> (device_get_position "dc_far_comm_switch") 0.0)) 
        (f_blip_object "dc_far_comm_switch" blip_interface))
    (sleep_until (>= (device_get_position "dc_far_comm_switch") 1.0) 5)
    (interpolator_start "farragut_comm_audio")
    (set b_far_comm_on true)
    (f_unblip_object "dc_far_comm_switch")
    (set b_far_defended true)
    (set s_music_far 2)
)

(script dormant void f_far_generator_effects
    (sleep 30)
    (effect_new_on_object_marker "fx\fx_library\ambient\sparks\sparks_electrical_medium\sparks_electrical_medium" "gen_on_sparks" "")
    (sleep 3)
    (object_create "gen_on_1")
    (sleep 3)
    (object_create "gen_on_4")
    (sleep 3)
    (object_create "gen_on_smoke")
    (sleep 8)
    (object_create "gen_on_2")
    (object_create "gen_on_3")
    (sleep 15)
    (object_create "gen_on_consparks")
    (sleep 15)
    (object_create "gen_on_trans")
    (sleep 90)
    (dprint "farragut lights")
    (object_create_anew "es_interp_10")
    (interpolator_start "farragut_lights")
    (sleep (* 30.0 20.0))
    (object_destroy "es_interp_10")
)

(script dormant void f_far_music_control
    (wake music_far)
    (sleep_until (not (volume_test_players "tv_area_far_wide")) 1)
    (set s_music_far 2)
)

(script dormant void f_far_spawn_control
    (sleep_until (>= (device_get_position "dc_far_generator_switch") 1.0) 5)
    (if b_debug 
        (print "dropping faragate fork counter 1"))
    (ai_place "sq_far_fork_counter_1")
    (sleep 30)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_far_cov/gate_infantry") 1)
            (or
                (not b_sq_far_fork_counter_1_spawn)
                (<= (object_get_health "sq_far_fork_counter_1/driver01") 0.0)
            )
        ) 
    5)
    (set b_far_spawn_done true)
)

(script command_script void f_cs_far_fork_counter_1
    (cs_enable_targeting true)
    (cs_ignore_obstacles true)
    (set b_sq_far_fork_counter_1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_fork ai_current_squad "left" "sq_far_cov_counter_1_1" "sq_far_cov_counter_1_2" none none)
    (f_load_fork ai_current_squad "right" "sq_far_cov_counter_1_3" "sq_far_cov_counter_1_4" none none)
    (cs_fly_by "ps_far_fork_counter_1/enter_01")
    (cs_fly_by "ps_far_fork_counter_1/enter_02")
    (cs_fly_by "ps_far_fork_counter_1/hover_in")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_far_fork_counter_1/drop" "ps_far_fork_counter_1/drop_face" 0.1)
    (print "drop")
    (f_unload_fork ai_current_squad "dual")
    (set b_sq_far_fork_counter_1_spawn false)
    (cs_fly_by "ps_far_fork_counter_1/hover_out")
    (cs_fly_by "ps_far_fork_counter_1/exit_01")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_by "ps_far_fork_counter_1/erase")
    (ai_erase ai_current_squad)
)

(script static void f_far_drop_warthog
    (ai_place "sq_far_pelican_hog")
    (object_cannot_die "sq_far_pelican_hog" true)
    (ai_place "sq_far_warthog")
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_far_pelican_hog/driver01") pelican_lc (ai_vehicle_get_from_starting_location "sq_far_warthog/driver01"))
)

(script static void f_far_drop_bighog
    (ai_place "sq_far_pelican_hog")
    (object_cannot_die "sq_far_pelican_hog" true)
    (ai_place "sq_far_bighog")
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_far_pelican_hog/driver01") pelican_lc (ai_vehicle_get_from_starting_location "sq_far_bighog/driver01"))
)

(script command_script void f_cs_far_pelican_hog
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (object_cannot_die "sq_far_pelican_hog" true)
    (set b_sq_far_pelican_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (cs_fly_by "ps_far_pelican/enter_01")
    (cs_fly_by "ps_far_pelican/enter_02")
    (if b_air_defended 
        (begin
            (cs_fly_to_and_face "ps_far_pelican/hover" "ps_far_pelican/hover_face_valley" 0.1)
        ) (begin
            (cs_fly_to_and_face "ps_far_pelican/hover" "ps_far_pelican/hover_face_air" 0.1)
        )
    )
    (cs_vehicle_speed 0.7)
    (wake f_md_hogdrop_far)
    (if b_air_defended 
        (begin
            (cs_fly_to_and_face "ps_far_pelican/drop" "ps_far_pelican/drop_face_valley" 0.1)
        ) (begin
            (cs_fly_to_and_face "ps_far_pelican/drop" "ps_far_pelican/drop_face_air" 0.1)
        )
    )
    (sleep 60)
    (vehicle_unload (ai_vehicle_get ai_current_actor) pelican_lc)
    (sleep 100)
    (set b_sq_far_pelican_spawn false)
    (cs_fly_by "ps_far_pelican/hover" 0.1)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_far_pelican/exit_01")
    (cs_fly_by "ps_far_pelican/exit_02")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 5.0))
    (cs_fly_by "ps_far_pelican/erase")
    (ai_erase ai_current_squad)
)

(script dormant void f_md_hogdrop_far
    (md_hogdrop)
    (f_md_hogdrop_increment)
)

(script static void f_far_cleanup
    (sleep_forever f_far_main)
)

(script dormant void f_air_main
    (sleep_until (volume_test_players "tv_air_start") 5)
    (f_squad_group_place "gr_air_cov_init")
    (wake f_air_aa_control)
    (sleep_forever f_valley_pelican_hog)
    (soft_ceiling_enable "camera_blocker_03" false)
    (soft_ceiling_enable "camera_blocker_04" false)
    (sleep_until 
        (or
            (<= s_objcon_far 0)
            b_far_defended
        ) 
    5)
    (if b_debug 
        (print "::: encounter start: airview"))
    (f_zoneset_direction direction_none)
    (f_ai_detail ai_detail_low)
    (wake f_air_objective_nanny)
    (set s_exterior_objective_last 1)
    (wake f_air_save_control)
    (wake f_air_missionobj_control)
    (wake f_air_music_control)
    (wake f_air_md_control)
    (wake f_air_cleanup_control)
    (wake f_air_spawn_control)
    (wake f_air_hilite_control)
    (wake f_air_strike_control)
    (if b_debug 
        (print "objective control : airview.01"))
    (set b_insertion_fade_in true)
    (set s_objcon_air 1)
    (sleep_until (volume_test_players "tv_air_near") 10)
    (if b_debug 
        (print "objective control : airview.10"))
    (set s_objcon_air 10)
    (sleep_until 
        (and
            b_air_spawn_done
            b_air_defended
        ) 
    5)
    (if (not b_far_defended) 
        (begin
            (if (volume_test_players "tv_area_air") 
                (f_air_drop_warthog))
        ) (begin
            (if (volume_test_players "tv_area_air") 
                (f_air_drop_bighog))
        )
    )
)

(script static void f_air_hog_return_test
    (set b_far_defended true)
    (f_air_drop_bighog)
)

(script static void f_air_hog_far_test
    (set b_far_defended false)
    (f_air_drop_warthog)
)

(script dormant void f_air_strike_control
    (sleep (* 30.0 5.0))
    (if (difficulty_is_normal_or_lower) 
        (begin
            (airstrike_set_launches 2)
        )
    )
)

(script dormant void f_air_md_suppress_1
    (sleep (* 30.0 10.0))
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
)

(script dormant void f_air_objective_nanny
    (wake f_air_objective_kat)
    (sleep_until 
        (begin
            (f_squad_set_obj_area "obj_air_hum" "tv_area_air")
            (or
                (and
                    b_air_defended
                    (not (volume_test_players "tv_area_air"))
                )
                (and
                    b_air_spawn_done
                    b_air_defended
                )
            )
        ) 
    (* 30.0 1.0))
    (if b_far_defended 
        (begin
            (f_vehicle_goto_set vehicle_return)
        ) (begin
            (f_vehicle_goto_set vehicle_far)
        )
    )
    (sleep_forever f_air_distance_kat)
    (sleep_forever f_air_objective_kat)
    (set b_air_kat_regroup true)
    (f_squad_set_obj "gr_vehicles_hum" "obj_vehicles_hum")
)

(script dormant void f_air_objective_kat
    (sleep_until (volume_test_object "tv_area_air" o_kat) 3)
    (ai_set_objective "gr_spartans" "obj_air_hum")
    (wake f_air_distance_kat)
)

(script dormant void f_air_distance_kat
    (sleep_until 
        (begin
            (if (>= (objects_distance_to_object (players) o_kat) 17.0) 
                (set b_air_kat_regroup true) (set b_air_kat_regroup false))
            false
        ) 
    30)
)

(script dormant void f_air_hilite_control
    (sleep_until (>= s_objcon_air 10) 5)
    (sleep 120)
    (sleep_until 
        (or
            (objects_can_see_object player0 "sc_air_hilite_turret_marker" 25.0)
            (objects_can_see_object player1 "sc_air_hilite_turret_marker" 25.0)
            (objects_can_see_object player2 "sc_air_hilite_turret_marker" 25.0)
            (objects_can_see_object player3 "sc_air_hilite_turret_marker" 25.0)
        ) 
    1)
    (wake f_air_turret_hilite_1)
    (wake f_air_turret_hilite_2)
)

(script dormant void f_air_turret_hilite_1
    (f_hud_flash_object "sc_air_hilite_turret")
)

(script dormant void f_air_turret_hilite_2
    (f_hud_flash_object "sc_air_hilite_turret_cannon")
)

(script dormant void f_air_spawn_control
    (wake f_air_phantom_hover_spawn)
    (sleep_until (<= (ai_task_count "obj_air_cov/gate_infantry") 3))
    (if b_debug 
        (print "dropping airview fork"))
    (ai_place "sq_air_fork_counter_1")
    (tick)
    (ai_set_targeting_group "sq_air_fork_counter_1" 76)
    (set s_air_wave_count 2)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_air_cov/gate_infantry") 6)
            (or
                (not b_air_fork_counter_1_spawn)
                (<= (object_get_health "sq_air_fork_counter_1/driver01") 0.0)
            )
        ) 
    5)
    (ai_place "sq_air_phantom_cnt_1")
    (tick)
    (ai_set_targeting_group "sq_air_phantom_cnt_1" 76)
    (sleep 30)
    (sleep_until 
        (and
            (<= (ai_task_count "obj_air_cov/gate_infantry") 1)
            (<= (ai_task_count "obj_air_cov/gate_ghosts") 0)
            (or
                (not b_sq_air_phantom_cnt_1_spawn)
                (<= (object_get_health "sq_air_phantom_cnt_1/driver01") 0.0)
            )
        ) 
    5)
    (set b_air_spawn_done true)
)

(script dormant void f_air_phantom_hover_spawn
    (sleep_until 
        (or
            (volume_test_players "tv_air_phantom_2")
            (volume_test_players "tv_air_phantom_3")
        )
    )
    (if (volume_test_players "tv_air_phantom_2") 
        (ai_place "sq_air_phantom_hover/driver_01"))
    (if (volume_test_players "tv_air_phantom_3") 
        (ai_place "sq_air_phantom_hover/driver_02"))
    (tick)
    (ai_set_targeting_group "sq_air_phantom_hover" 76)
    (sleep_until 
        (begin
            (if (<= (ai_living_count "sq_air_phantom_hover") 0) 
                (begin
                    (set s_air_phantom_hover_idx (random_range 1 3))
                    (if (= s_air_phantom_hover_idx 1) 
                        (ai_place "sq_air_phantom_hover/driver_01"))
                    (if (= s_air_phantom_hover_idx 2) 
                        (ai_place "sq_air_phantom_hover/driver_02"))
                    (ai_set_targeting_group "sq_air_phantom_hover" 76)
                )
            )
            b_air_defended
        ) 
    5)
)

(script command_script void f_cs_air_phantom_hover
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_enable_moving true)
    (set b_air_phantom_hover_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (sleep_until 
        (begin
            (print "air phantom - position test")
            (set s_air_phantom_hover_pos 0)
            (if (volume_test_players "tv_air_phantom_3") 
                (set s_air_phantom_hover_pos 3))
            (if (volume_test_players "tv_air_phantom_2") 
                (set s_air_phantom_hover_pos 2))
            (if (volume_test_players "tv_air_phantom_1") 
                (set s_air_phantom_hover_pos 1))
            (set s_air_phantom_position (random_range 1 4))
            (if 
                (or
                    (= s_air_phantom_hover_pos 1)
                    (= s_air_phantom_hover_pos 0)
                ) 
                    (begin
                        (if (= s_air_phantom_position 1) 
                            (begin
                                (cs_fly_to "ps_air_phantom_hover_01/enter_01")
                                (cs_fly_to_and_face "ps_air_phantom_hover_01/hover_01" "ps_air_phantom_hover_01/hover_01_face" 0.25)
                            )
                        )
                        (if (= s_air_phantom_position 2) 
                            (begin
                                (cs_fly_to "ps_air_phantom_hover_01/enter_02")
                                (cs_fly_to_and_face "ps_air_phantom_hover_01/hover_02" "ps_air_phantom_hover_01/hover_02_face" 0.25)
                            )
                        )
                        (if (= s_air_phantom_position 3) 
                            (begin
                                (cs_fly_to "ps_air_phantom_hover_01/enter_03")
                                (cs_fly_to_and_face "ps_air_phantom_hover_01/hover_03" "ps_air_phantom_hover_01/hover_03_face" 0.25)
                            )
                        )
                    )
            )
            (if (= s_air_phantom_hover_pos 2) 
                (begin
                    (if (= s_air_phantom_position 1) 
                        (begin
                            (cs_fly_to "ps_air_phantom_hover_02/enter_01")
                            (cs_fly_to_and_face "ps_air_phantom_hover_02/hover_01" "ps_air_phantom_hover_02/hover_01_face" 0.25)
                        )
                    )
                    (if (= s_air_phantom_position 2) 
                        (begin
                            (cs_fly_to "ps_air_phantom_hover_02/enter_02")
                            (cs_fly_to_and_face "ps_air_phantom_hover_02/hover_02" "ps_air_phantom_hover_02/hover_02_face" 0.25)
                        )
                    )
                    (if (= s_air_phantom_position 3) 
                        (begin
                            (cs_fly_to "ps_air_phantom_hover_02/enter_03")
                            (cs_fly_to_and_face "ps_air_phantom_hover_02/hover_03" "ps_air_phantom_hover_02/hover_03_face" 0.25)
                        )
                    )
                )
            )
            (if (= s_air_phantom_hover_pos 3) 
                (begin
                    (if (= s_air_phantom_position 1) 
                        (begin
                            (cs_fly_to "ps_air_phantom_hover_03/enter_01")
                            (cs_fly_to_and_face "ps_air_phantom_hover_03/hover_01" "ps_air_phantom_hover_03/hover_01_face" 0.25)
                        )
                    )
                    (if (= s_air_phantom_position 2) 
                        (begin
                            (cs_fly_to "ps_air_phantom_hover_03/enter_02")
                            (cs_fly_to_and_face "ps_air_phantom_hover_03/hover_02" "ps_air_phantom_hover_03/hover_02_face" 0.25)
                        )
                    )
                    (if (= s_air_phantom_position 3) 
                        (begin
                            (cs_fly_to "ps_air_phantom_hover_03/enter_03")
                            (cs_fly_to_and_face "ps_air_phantom_hover_03/hover_03" "ps_air_phantom_hover_03/hover_03_face" 0.25)
                        )
                    )
                )
            )
            (cs_vehicle_speed 0.6)
            false
        ) 
    (* 30.0 (random_range 1 3)))
)

(script dormant void f_air_save_control
    (sleep_until (>= s_objcon_air 1))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_air 10))
    (game_save_no_timeout)
    (sleep_until b_air_defended)
    (game_save_no_timeout)
    (sleep_until b_air_spawn_done)
    (game_save_no_timeout)
)

(script dormant void f_air_waypoint_control
    (sleep_until 
        (or
            (and
                b_air_defended
                (not (volume_test_players "tv_area_air"))
            )
            (and
                b_air_spawn_done
                b_air_defended
            )
        ) 
    5)
    (sleep_until (>= s_objcon_far 1) 5 (* 30.0 s_air_waypoint_timer))
    (if (not (>= s_objcon_far 1)) 
        (begin
            (f_blip_flag "fl_air_waypoint_far" blip_destination)
            (sleep_until (>= s_objcon_far 1) 5)
            (f_unblip_flag "fl_air_waypoint_far")
        )
    )
)

(script dormant void f_air_missionobj_control
    (sleep_until (>= s_objcon_air 1))
    (set s_music_air 1)
    (mo_airview)
    (sleep_until b_air_defended)
    (sleep 30)
    (if (not b_air_spawn_done) 
        (mo_clean))
    (sleep_until 
        (or
            (not (volume_test_players "tv_air_near"))
            b_air_spawn_done
        ) 
    5)
    (if (not b_far_defended) 
        (begin
            (sleep 30)
            (mo_airfar)
            (sleep 30)
            (md_air_done_faragate)
        )
    )
)

(script dormant void f_air_aa_control
    (f_air_cannon_place)
    (sleep_until (>= s_objcon_air 10))
    (device_set_power "dc_air_aa_switch" 1.0)
    (sleep_until (>= (device_get_position "dc_air_aa_switch") 1.0) 5 (* 30.0 40.0))
    (if (not (> (device_get_position "dc_air_aa_switch") 0.0)) 
        (f_blip_object "dc_air_aa_switch" blip_interface))
    (sleep_until (> (device_get_position "dc_air_aa_switch") 0.0))
    (f_unblip_object "dc_air_aa_switch")
    (set b_air_defended true)
    (ai_set_targeting_group "sq_air_aa_cannon" 76)
    (ai_braindead "sq_air_aa_cannon" false)
)

(script static void f_air_cannon_place
    (if (<= (ai_living_count "sq_air_aa_cannon") 0) 
        (begin
            (ai_place "sq_air_aa_cannon")
            (tick)
            (object_cannot_die (ai_vehicle_get_from_starting_location "sq_air_aa_cannon/driver01") true)
            (object_cannot_take_damage (object_get_parent "sq_air_aa_cannon"))
            (ai_disregard (ai_actors "sq_air_aa_cannon") true)
            (ai_braindead "sq_air_aa_cannon" true)
        )
    )
)

(script dormant void f_air_cleanup_control
    (sleep_until 
        (and
            b_air_defended
            (not (volume_test_players "tv_air_start"))
        ) 
    5)
    (ai_erase "gr_air_cov")
)

(script dormant void f_air_md_control
    (wake f_air_md_return)
    (sleep_until (>= s_objcon_air 1) 1)
    (sleep (* 30.0 2.0))
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (wake f_air_md_suppress_1)
    (md_air_view)
    (sleep_until (>= s_objcon_air 10) 1)
    (sleep (* 30.0 2.0))
    (md_air_target)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (sleep_until b_air_defended 1 (* 30.0 180.0))
    (if (not b_air_defended) 
        (begin
            (md_air_gun_delay_0)
        )
    )
    (sleep_until b_air_defended 1 (* 30.0 180.0))
    (if (not b_air_defended) 
        (begin
            (md_air_gun_delay_1)
        )
    )
    (sleep_until b_air_defended 1 (* 30.0 180.0))
    (if (not b_air_defended) 
        (begin
            (md_air_gun_delay_2)
        )
    )
    (sleep_until b_air_defended 1)
    (sleep (* 30.0 5.0))
    (md_air_done)
    (sleep_until 
        (or
            (>= s_objcon_far 1)
            (>= s_objcon_return 10)
        ) 
    5 (* 30.0 90.0))
    (if (not 
        (or
            (>= s_objcon_far 1)
            (>= s_objcon_return 10)
        )
    ) 
        (md_air_delay))
    (f_md_exterior_increment)
)

(script dormant void f_air_md_return
    (sleep_until (volume_test_players "tv_air_near") 1)
    (branch
        b_air_defended
        (f_abort)
    )
    (sleep_until (not (volume_test_players "tv_air_start")) 1)
    (sleep (* 30.0 3.0))
    (md_air_return_0)
)

(script dormant void f_air_music_control
    (wake music_air)
    (sleep_until (not (volume_test_players "tv_area_air_wide")) 1)
    (set s_music_air 2)
)

(script command_script void f_cs_air_phantom_cnt_1
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (set b_sq_air_phantom_cnt_1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_phantom_cargo (ai_vehicle_get ai_current_actor) "double" "sq_air_counter_ghost_1" "sq_air_counter_ghost_2")
    (cs_fly_by "ps_air_phantom_cnt_1/enter_01")
    (cs_fly_by "ps_air_phantom_cnt_1/hover_in")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_air_phantom_cnt_1/drop" "ps_air_phantom_cnt_1/drop_face" 0.25)
    (print "drop")
    (f_unload_phantom_cargo ai_current_squad "double")
    (set b_sq_air_phantom_cnt_1_spawn false)
    (cs_fly_by "ps_air_phantom_cnt_1/hover_out")
    (cs_fly_by "ps_air_phantom_cnt_1/exit_01")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_by "ps_air_phantom_cnt_1/erase")
    (ai_erase ai_current_squad)
)

(script command_script void f_cs_air_fork_counter_1
    (set b_air_fork_counter_1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_fork (ai_vehicle_get ai_current_actor) "any" "sq_air_cov_counter_1_1" "sq_air_cov_counter_1_2" none none)
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_fly_to "ps_air_fork_counter_1/enter_01")
    (cs_fly_to "ps_air_fork_counter_1/enter_02")
    (cs_fly_to_and_face "ps_air_fork_counter_1/hover_01" "ps_air_fork_counter_1/drop_01_face" 1.0)
    (cs_fly_to_and_face "ps_air_fork_counter_1/drop_01" "ps_air_fork_counter_1/drop_01_face" 1.0)
    (f_unload_fork (ai_vehicle_get ai_current_actor) "dual")
    (set b_air_fork_counter_1_spawn false)
    (sleep 75)
    (cs_fly_to_and_face "ps_air_fork_counter_1/hover_01" "ps_air_fork_counter_1/drop_01_face" 1.0)
    (sleep 60)
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_air_fork_counter_1/exit")
    (ai_erase ai_current_squad)
)

(script command_script void f_cs_air_pelican_hog
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (object_cannot_die "sq_air_pelican_hog" true)
    (set b_sq_air_pelican_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (cs_fly_by "ps_air_pelican/enter_01")
    (if b_far_defended 
        (begin
            (cs_fly_by "ps_air_pelican/enter_02_valley")
            (cs_fly_to_and_face "ps_air_pelican/hover_valley" "ps_air_pelican/valley_face" 0.1)
        ) (begin
            (cs_fly_by "ps_air_pelican/enter_02_far")
            (cs_fly_to_and_face "ps_air_pelican/hover_far" "ps_air_pelican/far_face" 0.1)
        )
    )
    (cs_vehicle_speed 0.7)
    (wake f_md_hogdrop_air)
    (if b_far_defended 
        (begin
            (cs_fly_to_and_face "ps_air_pelican/drop_valley" "ps_air_pelican/valley_face" 0.1)
        ) (begin
            (cs_fly_to_and_face "ps_air_pelican/drop_far" "ps_air_pelican/far_face" 0.1)
        )
    )
    (sleep 60)
    (vehicle_unload (ai_vehicle_get ai_current_actor) pelican_lc)
    (sleep 100)
    (set b_sq_air_pelican_spawn false)
    (if b_far_defended 
        (begin
            (cs_fly_to_and_face "ps_air_pelican/hover_valley" "ps_air_pelican/valley_face" 0.1)
        ) (begin
            (cs_fly_to_and_face "ps_air_pelican/hover_far" "ps_air_pelican/far_face" 0.1)
        )
    )
    (cs_vehicle_speed 1.0)
    (cs_fly_by "ps_air_pelican/exit_01")
    (cs_fly_by "ps_air_pelican/exit_02")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 5.0))
    (cs_fly_by "ps_air_pelican/erase")
    (ai_erase ai_current_squad)
)

(script dormant void f_md_hogdrop_air
    (md_hogdrop)
    (f_md_hogdrop_increment)
)

(script static void f_air_drop_warthog
    (ai_place "sq_air_pelican_hog")
    (object_cannot_die "sq_air_pelican_hog" true)
    (ai_place "sq_air_warthog")
    (ai_squad_enumerate_immigrants "sq_air_warthog" true)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_air_pelican_hog/driver01") pelican_lc (ai_vehicle_get_from_starting_location "sq_air_warthog/driver01"))
)

(script static void f_air_drop_bighog
    (ai_place "sq_air_pelican_hog")
    (object_cannot_die "sq_air_pelican_hog" true)
    (ai_place "sq_air_bighog")
    (ai_squad_enumerate_immigrants "sq_air_bighog" true)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_air_pelican_hog/driver01") pelican_lc (ai_vehicle_get_from_starting_location "sq_air_bighog/driver01"))
)

(script static void f_air_cleanup
    (sleep_forever f_air_main)
)

(script dormant void f_slew
    (sleep_until 
        (begin
            (if (= (current_zone_set_fully_active) s_zoneset_exterior) 
                (begin
                    (sleep_until 
                        (or
                            (> (device_get_position "dc_slew_01") 0.0)
                            (> (device_get_position "dc_slew_02") 0.0)
                        ) 
                    1)
                    (sleep_until 
                        (and
                            (> (device_get_position "dc_slew_01") 0.0)
                            (> (device_get_position "dc_slew_02") 0.0)
                        ) 
                    1 (* 30.0 2.0))
                    (if 
                        (and
                            (> (device_get_position "dc_slew_01") 0.0)
                            (> (device_get_position "dc_slew_02") 0.0)
                        ) 
                            (begin
                                (set b_slew true)
                                (print "achievement: reach racer")
                                (submit_incident_with_cause_player "racer_achieve" player0)
                                (submit_incident_with_cause_player "racer_achieve" player1)
                                (submit_incident_with_cause_player "racer_achieve" player2)
                                (submit_incident_with_cause_player "racer_achieve" player3)
                            )
                    )
                    (device_set_position "dc_slew_01" 0.0)
                    (device_set_position "dc_slew_02" 0.0)
                )
            )
            b_slew
        ) 
    5)
    (f_slew_cleanup)
    (f_zoneset_direction direction_none)
    (switch_zone_set "zoneset_exterior")
    (device_set_power "dc_slew_01" 0.0)
    (device_set_power "dc_slew_02" 0.0)
    (wake f_slew_control)
    (wake f_slew_timer)
    (wake f_slew_player0)
    (wake f_slew_player1)
    (wake f_slew_player2)
    (wake f_slew_player3)
)

(script static void f_slew_cleanup
    (set b_save_on false)
    (wake f_save_control)
    (sleep_forever f_save_continuous)
    (sleep_forever f_gatehouse_door_return_triggers)
    (sleep_forever f_gatehouse_door_return_switch)
    (sleep_forever f_gatehouse_door_timer)
    (sleep_forever f_gatehouse_door_objects)
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_far_cleanup)
    (f_air_cleanup)
    (f_air_far_cleanup)
    (f_return_cleanup)
    (f_unblip_flag "fl_valley_waypoint_1_1")
    (f_unblip_flag "fl_valley_waypoint_1_2")
    (f_unblip_object (ai_vehicle_get_from_starting_location "sq_valley_warthog_drop/driver01"))
    (f_unblip_flag "fl_far_waypoint_air")
    (f_unblip_object "dc_far_generator_switch")
    (device_set_power "dc_far_generator_switch" 0.0)
    (f_unblip_object "dc_far_comm_switch")
    (device_set_power "dc_far_comm_switch" 0.0)
    (f_unblip_object "dc_return_door_switch")
    (device_set_power "dc_return_door_switch" 0.0)
    (f_unblip_flag "fl_air_waypoint_far")
    (f_unblip_object "dc_air_aa_switch")
    (device_set_power "dc_air_aa_switch" 0.0)
    (f_unblip_flag "fl_return_waypoint_1")
    (sleep_forever f_valley_pelican_hog)
    (sleep_forever f_valley_save_combatend)
    (sleep_forever f_far_objective_nanny)
    (sleep_forever f_far_save_control)
    (sleep_forever f_far_missionobj_control)
    (sleep_forever f_far_waypoint_control)
    (sleep_forever f_far_music_control)
    (sleep_forever f_far_md_control)
    (sleep_forever f_far_cleanup_control)
    (sleep_forever f_far_spawn_control)
    (sleep_forever f_far_hilite_control)
    (sleep_forever f_far_comm_control)
    (sleep_forever f_far_strike_control)
    (sleep_forever f_far_objective_kat)
    (sleep_forever f_far_distance_kat)
    (sleep_forever f_air_objective_nanny)
    (sleep_forever f_air_save_control)
    (sleep_forever f_air_missionobj_control)
    (sleep_forever f_air_music_control)
    (sleep_forever f_air_md_control)
    (sleep_forever f_air_cleanup_control)
    (sleep_forever f_air_spawn_control)
    (sleep_forever f_air_hilite_control)
    (sleep_forever f_air_distance_kat)
    (sleep_forever f_air_objective_kat)
    (sleep_forever f_air_aa_control)
    (sleep_forever f_return_objective_nanny)
    (sleep_forever f_return_save_control)
    (sleep_forever f_return_waypoint_control)
    (sleep_forever f_return_missionobj_control)
    (sleep_forever f_return_spawn_control)
    (sleep_forever f_return_md_control)
    (sleep_forever f_return_music_control)
    (sleep_forever f_gatehouse_door_return)
    (sleep_forever f_return_strike_control)
    (sleep_forever f_return_objective_kat)
    (sleep_forever f_return_distance_kat)
    (sleep_forever f_return_coop_teleport)
    (f_vehicle_goto_set vehicle_return)
    (f_squad_set_obj "gr_vehicles_hum" "obj_vehicles_hum")
    (sound_looping_stop "levels\solo\m20\music\m20_music02")
    (sound_looping_stop "levels\solo\m20\music\m20_music03")
    (sound_looping_stop "levels\solo\m20\music\m20_music04")
    (sound_looping_stop "levels\solo\m20\music\m20_music10")
)

(script static void f_slew_test
    (device_set_position "dc_slew_01" 1.0)
    (device_set_position "dc_slew_02" 1.0)
)

(script dormant void f_slew_timer
    (sleep_until b_slew_start 1)
    (sleep_until 
        (begin
            (set s_slew_time 0)
            (sleep_until 
                (begin
                    (set s_slew_time (+ s_slew_time 1.0))
                    b_slew_finish
                ) 
            30)
            (sleep 60)
            (if (<= s_slew_time s_slew_time_slow) 
                (submit_incident_with_cause_player "race_m20" p_slew_winner))
            (if (<= s_slew_time s_slew_time_fast) 
                (submit_incident_with_cause_player "race_m20_fast" p_slew_winner))
            (sleep_until b_slew_start 1)
            false
        ) 
    1)
)

(script dormant void f_slew_control
    (f_hud_obj_repeat "ct_slew")
    (sleep_until 
        (begin
            (set b_slew_start true)
            (set b_slew_finish false)
            (set s_slew_dir (random_range 1 3))
            (object_teleport_to_ai_point player0 "ps_slew/p0")
            (object_teleport_to_ai_point player1 "ps_slew/p1")
            (object_teleport_to_ai_point player2 "ps_slew/p2")
            (object_teleport_to_ai_point player3 "ps_slew/p3")
            (tick)
            (ai_erase "sq_slew_hog_01")
            (ai_erase "sq_slew_hog_02")
            (tick)
            (ai_place "sq_slew_hog_01")
            (ai_place "sq_slew_hog_02")
            (f_hud_obj_repeat "prompt_slew")
            (sleep_until b_slew_finish 1)
            (f_hud_obj_repeat "prompt_win")
            (sleep (* 30.0 s_slew_respawn_timer))
            false
        ) 
    1)
)

(script static void f_slew_win (player p)
    (set p_slew_winner p)
    (if (= p player0) 
        (begin
            (if (not (= (object_get_parent player0) (object_get_parent player1))) 
                (f_slew_kill_vehicle player1))
            (if (not (= (object_get_parent player0) (object_get_parent player2))) 
                (f_slew_kill_vehicle player2))
            (if (not (= (object_get_parent player0) (object_get_parent player3))) 
                (f_slew_kill_vehicle player3))
        )
    )
    (if (= p player1) 
        (begin
            (if (not (= (object_get_parent player1) (object_get_parent player0))) 
                (f_slew_kill_vehicle player0))
            (if (not (= (object_get_parent player1) (object_get_parent player2))) 
                (f_slew_kill_vehicle player2))
            (if (not (= (object_get_parent player1) (object_get_parent player3))) 
                (f_slew_kill_vehicle player3))
        )
    )
    (if (= p player2) 
        (begin
            (if (not (= (object_get_parent player2) (object_get_parent player0))) 
                (f_slew_kill_vehicle player0))
            (if (not (= (object_get_parent player2) (object_get_parent player1))) 
                (f_slew_kill_vehicle player1))
            (if (not (= (object_get_parent player2) (object_get_parent player3))) 
                (f_slew_kill_vehicle player3))
        )
    )
    (if (= p player3) 
        (begin
            (if (not (= (object_get_parent player3) (object_get_parent player0))) 
                (f_slew_kill_vehicle player0))
            (if (not (= (object_get_parent player3) (object_get_parent player1))) 
                (f_slew_kill_vehicle player1))
            (if (not (= (object_get_parent player3) (object_get_parent player2))) 
                (f_slew_kill_vehicle player2))
        )
    )
)

(script static void f_slew_kill_vehicle (player p)
    (damage_object (object_get_parent p) "hull" 9999.0)
    (damage_object (object_get_parent p) "hull_front" 9999.0)
    (object_damage_damage_section (object_get_parent p) "hull" 9999.0)
    (object_damage_damage_section (object_get_parent p) "hull_front" 9999.0)
)

(script dormant void f_slew_player0
    (sleep_until 
        (begin
            (sleep_until b_slew_start 1)
            (if (= s_slew_dir 1) 
                (begin
                    (f_slew_point player0 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player0 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player0 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player0 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player0 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player0 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player0 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player0 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player0 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player0 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (= s_slew_dir 2) 
                (begin
                    (f_slew_point player0 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player0 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player0 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player0 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player0 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player0 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player0 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player0 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player0 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player0 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (not b_slew_finish) 
                (f_slew_win player0))
            (set b_slew_finish true)
            false
        ) 
    1)
)

(script dormant void f_slew_player1
    (sleep_until 
        (begin
            (sleep_until b_slew_start 1)
            (if (= s_slew_dir 1) 
                (begin
                    (f_slew_point player1 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player1 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player1 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player1 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player1 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player1 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player1 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player1 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player1 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player1 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (= s_slew_dir 2) 
                (begin
                    (f_slew_point player1 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player1 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player1 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player1 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player1 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player1 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player1 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player1 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player1 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player1 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (not b_slew_finish) 
                (f_slew_win player1))
            (set b_slew_finish true)
            false
        ) 
    1)
)

(script dormant void f_slew_player2
    (sleep_until 
        (begin
            (sleep_until b_slew_start 1)
            (if (= s_slew_dir 1) 
                (begin
                    (f_slew_point player2 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player2 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player2 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player2 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player2 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player2 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player2 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player2 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player2 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player2 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (= s_slew_dir 2) 
                (begin
                    (f_slew_point player2 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player2 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player2 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player2 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player2 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player2 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player2 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player2 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player2 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player2 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (not b_slew_finish) 
                (f_slew_win player2))
            (set b_slew_finish true)
            false
        ) 
    1)
)

(script dormant void f_slew_player3
    (sleep_until 
        (begin
            (sleep_until b_slew_start 1)
            (if (= s_slew_dir 1) 
                (begin
                    (f_slew_point player3 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player3 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player3 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player3 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player3 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player3 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player3 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player3 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player3 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player3 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (= s_slew_dir 2) 
                (begin
                    (f_slew_point player3 "tv_slew_09" "fl_slew_09")
                    (f_slew_point player3 "tv_slew_08" "fl_slew_08")
                    (f_slew_point player3 "tv_slew_07" "fl_slew_07")
                    (f_slew_point player3 "tv_slew_06" "fl_slew_06")
                    (f_slew_point player3 "tv_slew_05" "fl_slew_05")
                    (f_slew_point player3 "tv_slew_04" "fl_slew_04")
                    (f_slew_point player3 "tv_slew_03" "fl_slew_03")
                    (f_slew_point player3 "tv_slew_02" "fl_slew_02")
                    (f_slew_point player3 "tv_slew_01" "fl_slew_01")
                    (f_slew_point player3 "tv_slew_10" "fl_slew_10")
                )
            )
            (if (not b_slew_finish) 
                (f_slew_win player3))
            (set b_slew_finish true)
            false
        ) 
    1)
)

(script static void f_slew_point (player p, trigger_volume tv, cutscene_flag fl)
    (f_slew_point_clear p)
    (if (not b_slew_finish) 
        (begin
            (chud_track_flag_for_player_with_priority p fl 7)
            (sleep_until 
                (or
                    (volume_test_objects tv p)
                    b_slew_finish
                ) 
            1)
            (f_slew_point_clear p)
        )
    )
)

(script static void f_slew_point_clear (player p)
    (chud_track_flag_for_player p "fl_slew_01" false)
    (chud_track_flag_for_player p "fl_slew_02" false)
    (chud_track_flag_for_player p "fl_slew_03" false)
    (chud_track_flag_for_player p "fl_slew_04" false)
    (chud_track_flag_for_player p "fl_slew_05" false)
    (chud_track_flag_for_player p "fl_slew_06" false)
    (chud_track_flag_for_player p "fl_slew_07" false)
    (chud_track_flag_for_player p "fl_slew_08" false)
    (chud_track_flag_for_player p "fl_slew_09" false)
    (chud_track_flag_for_player p "fl_slew_10" false)
)

(script dormant void f_air_far_main
    (sleep_until (volume_test_players "tv_air_far_start") 5)
    (wake f_airfar_flock_control)
    (f_squad_group_place "gr_air_far_cov_init")
    (f_squad_group_place "gr_air_far_cov_drop_w1")
)

(script dormant void f_airfar_flock_control
    (sleep 0)
)

(script command_script void f_cs_sq_air_far_drop_w1_1
    (cs_enable_pathfinding_failsafe true)
    (cs_ignore_obstacles true)
    (cs_enable_targeting true)
    (set b_sq_air_far_drop_w1_1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_fork ai_current_squad "right" "sq_air_far_cov_w1_1" none none none)
    (f_load_fork ai_current_squad "left" "sq_air_far_cov_w1_2" none none none)
    (cs_fly_to "ps_air_far_cov_drop_w1_1/enter_01")
    (cs_fly_to "ps_air_far_cov_drop_w1_1/hover_in")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_air_far_cov_drop_w1_1/drop" "ps_air_far_cov_drop_w1_1/drop_face" 0.01)
    (print "drop")
    (f_unload_fork ai_current_squad "right")
    (f_unload_fork ai_current_squad "left")
    (set b_sq_air_far_drop_w1_1_spawn false)
    (cs_fly_to "ps_air_far_cov_drop_w1_1/hover_out")
    (cs_vehicle_speed 1.0)
    (cs_fly_to "ps_air_far_cov_drop_w1_1/exit_01")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_to "ps_air_far_cov_drop_w1_1/erase")
    (ai_erase ai_current_squad)
)

(script static void f_air_far_cleanup
    (sleep_forever f_air_far_main)
)

(script static void f_zoneset_direction (short dir)
    (set s_zoneset_directon dir)
    (if (= dir direction_outward) 
        (begin
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_return" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_valley_return:*" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_exterior" true)
            (zone_set_trigger_volume_enable "zone_set:zoneset_exterior" true)
        )
    )
    (if (= dir direction_return) 
        (begin
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_return" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_exterior" true)
            (zone_set_trigger_volume_enable "zone_set:zoneset_exterior" true)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_valley_return:*" true)
        )
    )
    (if (= dir direction_return_coop) 
        (begin
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_return" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_exterior" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_exterior" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_valley_return:*" true)
        )
    )
    (if (= dir direction_inward) 
        (begin
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_valley_return:*" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_interior" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_interior" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_exterior" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_exterior" true)
            (zone_set_trigger_volume_enable "zone_set:zoneset_courtyard_return" true)
        )
    )
    (if (= dir direction_inward_coop) 
        (begin
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_valley_return:*" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_interior" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_interior" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_exterior" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_exterior" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_courtyard_return" true)
        )
    )
    (if (= dir direction_none) 
        (begin
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_exterior" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_exterior" false)
            (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_valley_return:*" false)
            (zone_set_trigger_volume_enable "zone_set:zoneset_courtyard_return" false)
        )
    )
)

(script dormant void f_return_main
    (sleep_until 
        (and
            (= b_far_defended true)
            (= b_air_defended true)
        ) 
    5)
    (data_mine_set_mission_segment "m20_03_return")
    (if (game_is_cooperative) 
        (f_zoneset_direction direction_return_coop) (f_zoneset_direction direction_return))
    (wake f_return_objective_nanny)
    (wake f_return_save_control)
    (wake f_return_waypoint_control)
    (wake f_return_missionobj_control)
    (wake f_return_spawn_control)
    (wake f_return_md_control)
    (wake f_return_music_control)
    (wake f_gatehouse_door_return)
    (wake f_return_strike_control)
    (if (game_is_cooperative) 
        (begin
            (wake f_return_coop_teleport)
        )
    )
    (f_ai_detail ai_detail_low)
    (if b_debug 
        (print "objective control : return.01"))
    (set b_insertion_fade_in true)
    (set s_objcon_return 1)
    (game_insertion_point_unlock 2)
    (sleep_until (volume_test_players "tv_return_10") 5)
    (if b_debug 
        (print "objective control : return.10"))
    (set s_objcon_return 10)
    (sleep_until (volume_test_players "tv_return_20") 5)
    (if b_debug 
        (print "objective control : return.20"))
    (set s_objcon_return 20)
    (sleep_until (volume_test_players "tv_return_30") 5)
    (if b_debug 
        (print "objective control : return.30"))
    (set s_objcon_return 30)
)

(script dormant void f_return_strike_control
    (sleep (* 30.0 5.0))
    (if (difficulty_is_heroic_or_lower) 
        (begin
            (airstrike_set_launches 2)
        )
    )
)

(script dormant void f_return_objective_nanny
    (sleep_until (>= s_objcon_return 10))
    (wake f_return_objective_kat)
    (ai_set_objective "obj_valley_hum" "obj_return_hum")
    (sleep_until 
        (begin
            (f_squad_set_obj_area "obj_return_hum" "tv_area_return_wide")
            (or
                (>= s_objcon_garage 1)
                (<= (ai_living_count "obj_return_cov") 2)
            )
        ) 
    (* 30.0 1.0))
    (sleep_forever f_return_objective_kat)
    (sleep_forever f_return_distance_kat)
    (f_vehicle_goto_set vehicle_return)
    (f_squad_set_obj "gr_vehicles_hum" "obj_vehicles_hum")
)

(script dormant void f_return_objective_kat
    (sleep_until (volume_test_object "tv_area_valley" o_kat) 3)
    (ai_set_objective "gr_spartans" "obj_return_hum")
    (wake f_return_distance_kat)
)

(script dormant void f_return_distance_kat
    (sleep_until 
        (begin
            (if (>= (objects_distance_to_object (players) o_kat) 17.0) 
                (set b_return_kat_regroup true) (set b_return_kat_regroup false))
            false
        ) 
    30)
)

(script dormant void f_return_save_control
    (sleep_until (>= s_objcon_return 10))
    (game_save_no_timeout)
)

(script dormant void f_return_missionobj_control
    (sleep_until 
        (or
            (= s_exterior_objective_last 0)
            (>= s_objcon_return 10)
            (and
                (= s_exterior_objective_last 1)
                b_air_spawn_done
                b_far_defended
            )
            (and
                (= s_exterior_objective_last 2)
                b_far_spawn_done
                b_air_defended
            )
        )
    )
    (sleep 200)
    (tit_return)
    (sleep 200)
    (mo_return)
    (md_return_pre_intro)
)

(script dormant void f_return_waypoint_control
    (sleep_until (>= s_objcon_return 30) 5 (* 30.0 s_return_waypoint_timer))
    (if (not (>= s_objcon_return 30)) 
        (begin
            (f_blip_flag "fl_return_waypoint_1" blip_destination)
            (sleep_until (>= s_objcon_return 30) 5)
            (f_unblip_flag "fl_return_waypoint_1")
        )
    )
)

(script dormant void f_return_music_control
    (if b_ins_return 
        (begin
            (dprint "return music start")
            (wake f_return_covvehicle_tracker)
        )
    )
)

(script dormant void f_return_covvehicle_tracker
    (dprint "tracking cov vehicles")
    (sleep_until (>= s_objcon_return 10))
    (sleep_until (> (ai_task_count "obj_return_cov/gate_revenant") 0) 5)
    (dprint "revenants exist")
    (sleep_until (<= (ai_task_count "obj_return_cov/gate_revenant") 0) 5)
    (dprint "revenants down")
    (set s_music_return 2)
)

(script dormant void f_return_md_control
    (sleep_until (>= s_objcon_return 10))
    (md_return_intro)
    (sleep 30)
    (if b_ins_return 
        (begin
            (wake music_return)
            (set s_music_return 1)
        )
    )
)

(script dormant void f_return_spawn_control
    (ai_place "sq_return_phantom_1")
    (sleep (* 30.0 2.0))
    (ai_place "sq_return_phantom_2")
    (if 
        (or
            (volume_test_players "tv_area_air_wide")
            (volume_test_players "tv_area_return_wide")
        ) 
            (begin
                (ai_place "sq_return_air_phantom_1")
                (sleep (* 30.0 2.0))
                (ai_place "sq_return_air_phantom_2")
            ) (begin
                (ai_place "sq_return_far_phantom_1")
            )
    )
)

(script command_script void f_cs_return_phantom_1
    (cs_enable_targeting true)
    (cs_ignore_obstacles true)
    (set b_sq_return_phantom_1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_phantom_cargo (ai_vehicle_get ai_current_actor) "single" "sq_return_ghost_1" none)
    (f_load_phantom (ai_vehicle_get ai_current_actor) "right" "sq_return_cov_1" none none none)
    (cs_fly_to "ps_return_phantom_1/enter_01")
    (cs_fly_to "ps_return_phantom_1/enter_02")
    (cs_enable_targeting true)
    (cs_fly_to_and_face "ps_return_phantom_1/hover_in" "ps_return_phantom_1/hover_in_face" 0.25)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_return_phantom_1/drop" "ps_return_phantom_1/drop_face" 0.25)
    (f_unload_phantom_cargo ai_current_squad "single")
    (f_unload_phantom ai_current_squad "right")
    (sleep (* 30.0 3.0))
    (set b_sq_return_phantom_1_spawn false)
    (cs_fly_to "ps_return_phantom_1/hover_out")
    (cs_fly_to "ps_return_phantom_1/exit_01")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_to "ps_return_phantom_1/erase")
    (ai_erase ai_current_squad)
)

(script command_script void f_cs_return_phantom_2
    (cs_enable_targeting true)
    (cs_ignore_obstacles true)
    (set b_sq_return_phantom_2_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_phantom_cargo (ai_vehicle_get ai_current_actor) "double" "sq_return_revenant_1" "sq_return_revenant_2")
    (cs_fly_to "ps_return_phantom_2/enter_02")
    (cs_enable_targeting true)
    (cs_fly_to "ps_return_phantom_2/hover_in")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_return_phantom_2/drop" "ps_return_phantom_2/drop_face" 0.25)
    (f_unload_phantom_cargo ai_current_squad "double")
    (sleep (* 30.0 3.0))
    (set b_sq_return_phantom_2_spawn false)
    (cs_fly_to "ps_return_phantom_2/hover_out")
    (cs_fly_to "ps_return_phantom_2/exit_01")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_to "ps_return_phantom_2/erase")
    (ai_erase ai_current_squad)
)

(script command_script void f_cs_return_air_phantom_1
    (cs_enable_targeting true)
    (cs_ignore_obstacles true)
    (set b_sq_return_air_phantom_1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_phantom_cargo (ai_vehicle_get ai_current_actor) "single" "sq_return_air_revenant_1" none)
    (cs_fly_to_and_face "ps_return_air_phantom_1/enter_01" "ps_return_air_phantom_1/enter_01_face" 0.25)
    (cs_fly_to_and_face "ps_return_air_phantom_1/enter_01a" "ps_return_air_phantom_1/enter_01a_face" 0.25)
    (cs_fly_to_and_face "ps_return_air_phantom_1/enter_02" "ps_return_air_phantom_1/enter_02_face" 0.25)
    (cs_enable_targeting true)
    (cs_fly_to_and_face "ps_return_air_phantom_1/hover_in" "ps_return_air_phantom_1/drop_face" 0.25)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_return_air_phantom_1/drop" "ps_return_air_phantom_1/drop_face" 0.25)
    (f_unload_phantom_cargo ai_current_squad "single")
    (sleep (* 30.0 3.0))
    (set b_sq_return_air_phantom_1_spawn false)
    (cs_fly_to_and_face "ps_return_air_phantom_1/hover_out" "ps_return_air_phantom_1/drop_face" 0.25)
    (cs_fly_to_and_face "ps_return_air_phantom_1/exit_01" "ps_return_air_phantom_1/exit_01_face" 0.25)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_to_and_face "ps_return_air_phantom_1/erase" "ps_return_air_phantom_1/erase_face" 0.25)
    (ai_erase ai_current_squad)
)

(script command_script void f_cs_return_air_phantom_2
    (cs_enable_targeting true)
    (cs_ignore_obstacles true)
    (set b_sq_return_air_phantom_2_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_phantom_cargo (ai_vehicle_get ai_current_actor) "double" "sq_return_air_ghost_1" none)
    (f_load_phantom (ai_vehicle_get ai_current_actor) "dual" "sq_return_cov_2" none none none)
    (cs_fly_to_and_face "ps_return_air_phantom_2/enter_01" "ps_return_air_phantom_2/enter_01_face" 0.25)
    (cs_fly_to_and_face "ps_return_air_phantom_2/enter_01a" "ps_return_air_phantom_2/enter_01a_face" 0.25)
    (cs_fly_to_and_face "ps_return_air_phantom_2/enter_02" "ps_return_air_phantom_2/enter_02_face" 0.25)
    (cs_ignore_obstacles true)
    (cs_fly_to_and_face "ps_return_air_phantom_2/hover_in" "ps_return_air_phantom_2/drop_face" 0.25)
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_return_air_phantom_2/drop" "ps_return_air_phantom_2/drop_face" 0.25)
    (f_unload_phantom_cargo ai_current_squad "double")
    (f_unload_phantom ai_current_squad "dual")
    (sleep (* 30.0 3.0))
    (set b_sq_return_air_phantom_1_spawn false)
    (cs_fly_to_and_face "ps_return_air_phantom_2/hover_out" "ps_return_air_phantom_2/drop_face" 0.25)
    (cs_fly_to_and_face "ps_return_air_phantom_2/exit_01" "ps_return_air_phantom_2/exit_01_face" 0.25)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_to_and_face "ps_return_air_phantom_2/erase" "ps_return_air_phantom_2/erase_face" 0.25)
    (ai_erase ai_current_squad)
)

(script command_script void f_cs_return_far_phantom_1
    (cs_enable_targeting true)
    (cs_ignore_obstacles true)
    (set b_sq_return_far_phantom_1_spawn true)
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 0)
    (object_set_scale (ai_vehicle_get ai_current_actor) 1.0 (* 30.0 5.0))
    (f_load_phantom_cargo (ai_vehicle_get ai_current_actor) "double" "sq_return_far_revenant_1" none)
    (f_load_phantom (ai_vehicle_get ai_current_actor) "dual" "sq_return_cov_2" none none none)
    (ai_set_task "sq_return_cov_2" "obj_return_cov" "far_cov_1")
    (cs_fly_to "ps_return_far_phantom_1/enter_01")
    (cs_fly_to "ps_return_far_phantom_1/enter_02")
    (cs_fly_to "ps_return_far_phantom_1/hover_in")
    (cs_vehicle_speed 0.5)
    (cs_fly_to_and_face "ps_return_far_phantom_1/drop" "ps_return_far_phantom_1/drop_face" 0.35)
    (f_unload_phantom_cargo ai_current_squad "double")
    (f_unload_phantom ai_current_squad "dual")
    (sleep (* 30.0 3.0))
    (set b_sq_return_far_phantom_1_spawn false)
    (cs_fly_to "ps_return_far_phantom_1/hover_out")
    (cs_fly_to "ps_return_far_phantom_1/exit_01")
    (object_set_scale (ai_vehicle_get ai_current_actor) 0.01 (* 30.0 10.0))
    (cs_fly_to "ps_return_far_phantom_1/erase")
    (ai_erase ai_current_squad)
)

(script dormant void f_return_coop_teleport
    (sleep_until (volume_test_players "begin_zone_set:zoneset_courtyard_valley_return:*") 5)
    (sleep_until 
        (begin
            (cond
                ((volume_test_object "tv_courtyard_valley_coop_teleport" player0)
                    (if (unit_in_vehicle (player0)) 
                        (begin
                            (object_teleport_to_ai_point (object_get_parent player0) "ps_return_coop/player0")
                        ) (begin
                            (object_teleport_to_ai_point player0 "ps_return_coop/player0")
                        )
                    )
                )
                ((volume_test_object "tv_courtyard_valley_coop_teleport" player1)
                    (if (unit_in_vehicle (player1)) 
                        (begin
                            (object_teleport_to_ai_point (object_get_parent player1) "ps_return_coop/player1")
                        ) (begin
                            (object_teleport_to_ai_point player1 "ps_return_coop/player1")
                        )
                    )
                )
                ((volume_test_object "tv_courtyard_valley_coop_teleport" player2)
                    (if (unit_in_vehicle (player2)) 
                        (begin
                            (object_teleport_to_ai_point (object_get_parent player2) "ps_return_coop/player2")
                        ) (begin
                            (object_teleport_to_ai_point player2 "ps_return_coop/player2")
                        )
                    )
                )
                ((volume_test_object "tv_courtyard_valley_coop_teleport" player3)
                    (if (unit_in_vehicle (player3)) 
                        (begin
                            (object_teleport_to_ai_point (object_get_parent player3) "ps_return_coop/player3")
                        ) (begin
                            (object_teleport_to_ai_point player3 "ps_return_coop/player3")
                        )
                    )
                )
            )
            false
        ) 
    1)
)

(script static void f_return_cleanup
    (sleep_forever f_return_main)
)

(script dormant void f_garage_main
    (sleep_until 
        (and
            (volume_test_players "tv_garage_start")
            b_far_defended
            b_air_defended
            b_garage_ready
        ) 
    5)
    (if b_debug 
        (print "::: encounter start: garage"))
    (data_mine_set_mission_segment "m20_04_garage")
    (device_set_position_immediate "dm_garagedoor_1" 1.0)
    (device_set_position_immediate "dm_garagedoor_2" 1.0)
    (sleep 10)
    (wake f_garage_save_control)
    (wake f_garage_waypoint_control)
    (wake f_garage_music_control)
    (wake f_garage_spawn_control)
    (wake f_garage_md_control)
    (wake f_garage_elevator_control)
    (wake f_garage_door_control)
    (wake f_garage_objective_nanny)
    (if b_debug 
        (print "objective control : garage.01"))
    (set b_insertion_fade_in true)
    (set s_objcon_garage 1)
    (sleep_until (volume_test_players "tv_garage_elbowstart") 5)
    (if b_debug 
        (print "objective control : garage.02"))
    (set s_objcon_garage 2)
    (sleep_until (volume_test_players "tv_garage_elbowmid") 5)
    (if b_debug 
        (print "objective control : garage.03"))
    (set s_objcon_garage 3)
    (sleep_until (volume_test_players "tv_garage_elbowend") 5)
    (if b_debug 
        (print "objective control : garage.04"))
    (set s_objcon_garage 4)
    (sleep_until (volume_test_players "tv_garage_fight") 5)
    (if b_debug 
        (print "objective control : garage.05"))
    (set s_objcon_garage 5)
    (sleep_until (volume_test_players "tv_garage_int_start") 5)
    (if b_debug 
        (print "objective control : garage.10"))
    (set s_objcon_garage 10)
    (sleep_until (<= (ai_task_count "obj_garage_cov/gate_hunters") 0))
    (if b_debug 
        (print "objective control : garage.20"))
    (set s_objcon_garage 20)
)

(script dormant void f_garage_objective_nanny
    (ai_set_objective "gr_hum" "obj_garage_hum")
    (ai_set_objective "gr_spartans" "obj_garage_hum")
    (sleep_until 
        (begin
            (f_squad_set_obj_area "obj_garage_hum" "tv_area_court")
            (>= s_objcon_sword 1)
        ) 
    (* 30.0 1.0))
)

(script command_script void f_cs_exit_vehicle
    (ai_vehicle_reserve (ai_vehicle_get ai_current_actor) true)
    (ai_vehicle_exit ai_current_actor)
    (sleep 30)
)

(script dormant void f_garage_save_control
    (sleep_until (>= s_objcon_garage 20))
    (sleep 10)
    (dprint "garage save 2")
    (game_save_no_timeout)
)

(script dormant void f_garage_waypoint_control
    (sleep_until (>= s_objcon_garage 10) 5 (* 30.0 s_garage_waypoint_timer))
    (if (not (>= s_objcon_garage 10)) 
        (begin
            (f_blip_flag "fl_garage_waypoint_1" blip_destination)
            (sleep_until (>= s_objcon_garage 10) 5)
            (f_unblip_flag "fl_garage_waypoint_1")
        )
    )
)

(script dormant void f_garage_door_control
    (sleep_until (>= s_objcon_garage 2) 5)
    (device_set_position "dm_valley_door_large" 0.0)
    (device_set_position "dm_valley_door_small" 0.0)
    (sleep_until (<= (device_get_position "dm_valley_door_large") 0.0) 5)
    (if (game_is_cooperative) 
        (begin
            (if (not 
                (or
                    (volume_test_object "tv_area_court" player0)
                    (volume_test_object "tv_area_garage" player0)
                    (volume_test_object "tv_area_elevator" player0)
                    (volume_test_object "tv_area_sword" player0)
                )
            ) 
                (begin
                    (object_teleport_to_ai_point player0 "ps_garage_spawn/player0")
                )
            )
            (if (not 
                (or
                    (volume_test_object "tv_area_court" player1)
                    (volume_test_object "tv_area_garage" player1)
                    (volume_test_object "tv_area_elevator" player1)
                    (volume_test_object "tv_area_sword" player1)
                )
            ) 
                (begin
                    (object_teleport_to_ai_point player1 "ps_garage_spawn/player1")
                )
            )
            (if (not 
                (or
                    (volume_test_object "tv_area_court" player2)
                    (volume_test_object "tv_area_garage" player2)
                    (volume_test_object "tv_area_elevator" player2)
                    (volume_test_object "tv_area_sword" player2)
                )
            ) 
                (begin
                    (object_teleport_to_ai_point player2 "ps_garage_spawn/player2")
                )
            )
            (if (not 
                (or
                    (volume_test_object "tv_area_court" player3)
                    (volume_test_object "tv_area_garage" player3)
                    (volume_test_object "tv_area_elevator" player3)
                    (volume_test_object "tv_area_sword" player3)
                )
            ) 
                (begin
                    (object_teleport_to_ai_point player3 "ps_garage_spawn/player3")
                )
            )
        )
    )
    (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_valley_return:*" false)
    (tick)
    (zone_set_trigger_volume_enable "begin_zone_set:zoneset_courtyard_return" true)
    (sleep_forever f_gatehouse_door_return_triggers)
    (sleep_forever f_gatehouse_door_return_switch)
    (sleep_forever f_gatehouse_door_timer)
    (sleep_forever f_gatehouse_door_objects)
    (sleep_forever f_return_coop_teleport)
    (ai_erase "gr_air_cov")
    (ai_erase "gr_far_cov")
    (ai_erase "gr_air_far_cov")
    (ai_erase "gr_valley_cov")
    (sleep (* 30.0 5.0))
    (game_save_no_timeout)
)

(script dormant void f_garage_spawn_control
    (sleep_until (volume_test_players "tv_garage_kat") 1)
    (f_squad_group_place "gr_garage_cov_init")
    (if (= s_special_elite 1) 
        (ai_place "sq_garage_bob"))
    (sleep_until 
        (and
            (<= (device_get_position "dm_valley_door_large") 0.0)
            (>= s_objcon_garage 3)
        ) 
    5)
    (f_ai_detail ai_detail_low)
    (f_squad_group_place "gr_garage_cov_init_inside")
    (f_squad_group_place "gr_garage_hum_init_inside")
    (sleep_until 
        (begin
            (ai_renew "gr_garage_cov_init_inside")
            (ai_renew "gr_garage_hum_init_inside")
            (volume_test_players "tv_garage_fight")
        ) 
    5)
)

(script dormant void f_garage_md_control
    (sleep_until (>= s_objcon_garage 20) 5)
    (md_garage_clear)
    (sleep (* 30.0 5.0))
    (md_garage_elevator_prompt)
)

(script dormant void f_garage_music_control
    (if b_ins_return 
        (begin
            (set s_music_return 2)
            (sleep 30)
        )
    )
    (sleep_until (>= s_objcon_garage 1) 5)
    (wake music_garage)
    (set s_music_garage 1)
    (sleep_until (>= s_objcon_garage 5) 5)
    (set s_music_garage 2)
    (wake f_garage_hunter_tracker)
)

(script dormant void f_garage_hunter_tracker
    (sleep_until 
        (or
            (<= (ai_living_count "sq_garage_hunter_1") 0)
            (<= (ai_living_count "sq_garage_hunter_2") 0)
        )
    )
    (set s_music_garage 3)
    (sleep_until 
        (and
            (<= (ai_living_count "sq_garage_hunter_1") 0)
            (<= (ai_living_count "sq_garage_hunter_2") 0)
        )
    )
    (set s_music_garage 4)
)

(script dormant void f_garage_elevator_control
    (sleep_until (>= s_objcon_garage 20) 5)
    (dprint "elevator ready")
    (f_blip_object "dc_garage_elevator_button" blip_interface)
    (device_set_position_track "dm_garage_elevator" "device:position" 0.0)
    (device_animate_position "dm_garage_elevator" 0.099 1.0 0.034 0.034 false)
    (sleep_until (> (device_get_position "dc_garage_elevator_button") 0.0) 5)
    (set b_save_continuous false)
    (soft_ceiling_enable "soft_ceiling_interior" true)
    (soft_ceiling_enable "camera_blocker_07" true)
    (soft_ceiling_enable "camera_blocker_08" true)
    (soft_ceiling_enable "camera_blocker_09" true)
    (soft_ceiling_enable "default" false)
    (f_unblip_object "dc_garage_elevator_button")
    (set s_music_garage 5)
    (add_recycling_volume "tv_area_elevator_wide" 0 0)
    (device_animate_position "dm_garage_elevator" 0.5 7.0 0.5 0.5 false)
    (sleep_until (>= (device_get_position "dm_garage_elevator") 0.15) 1)
    (if (volume_test_object "tv_area_elevator" player0) 
        (set s_elevator_coop_count (+ s_elevator_coop_count 1.0)))
    (if (volume_test_object "tv_area_elevator" player1) 
        (set s_elevator_coop_count (+ s_elevator_coop_count 1.0)))
    (if (volume_test_object "tv_area_elevator" player2) 
        (set s_elevator_coop_count (+ s_elevator_coop_count 1.0)))
    (if (volume_test_object "tv_area_elevator" player3) 
        (set s_elevator_coop_count (+ s_elevator_coop_count 1.0)))
    (if 
        (or
            (and
                (not (game_is_cooperative))
                (< s_elevator_coop_count 1)
            )
            (and
                (= (game_coop_player_count) 2)
                (< s_elevator_coop_count 2)
            )
            (and
                (= (game_coop_player_count) 3)
                (< s_elevator_coop_count 3)
            )
            (and
                (= (game_coop_player_count) 4)
                (< s_elevator_coop_count 4)
            )
        ) 
            (begin
                (dprint "failsafe elevator coop teleport")
                (object_teleport_to_ai_point o_kat "ps_sword_elevator/kat")
                (sleep 1)
                (object_teleport_to_ai_point (player0) "ps_sword_elevator/player0")
                (sleep 1)
                (object_teleport_to_ai_point (player1) "ps_sword_elevator/player1")
                (sleep 1)
                (object_teleport_to_ai_point (player2) "ps_sword_elevator/player2")
                (sleep 1)
                (object_teleport_to_ai_point (player3) "ps_sword_elevator/player3")
            )
    )
    (zone_set_trigger_volume_enable "begin_zone_set:zoneset_interior" true)
    (sleep_until (>= (device_get_position "dm_garage_elevator") 0.4) 1)
    (wake f_garage_bomb_1)
    (sleep_until (>= (device_get_position "dm_garage_elevator") 0.5) 1)
    (sleep 120)
    (device_animate_position "dm_garage_elevator" 0.9 7.0 0.5 0.034 false)
    (sleep_until (>= (device_get_position "dm_garage_elevator") 0.75) 1)
    (zone_set_trigger_volume_enable "zone_set:zoneset_interior" true)
    (sleep (* 30.0 2.0))
    (ai_set_objective "gr_spartans" "obj_sword_hum")
    (cs_run_command_script "sq_kat" f_cs_elevator_out)
    (sleep (* 30.0 3.0))
    (set b_save_continuous true)
)

(script command_script void f_cs_elevator_in
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_go_to "ps_garage_kat_elevator/in" 0.1)
    (cs_go_to "ps_garage_kat_elevator/so_in" 0.1)
)

(script command_script void f_cs_elevator_out
    (cs_enable_looking true)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_go_to "ps_sword_kat_elevator/out" 0.1)
)

(script dormant void f_garage_bomb_1
    (set b_shake true)
    (sleep 60)
    (sound_impulse_start "sound\levels\020_base\base_scripted_expl1a" none 1.0)
    (dprint "garage bomb")
    (object_create_anew "es_interp_10")
    (interpolator_start "base_bombing")
    (md_garage_bomb)
    (sleep (* 30.0 10.0))
    (object_destroy "es_interp_10")
)

(script command_script void f_cs_garage_hunter
    (cs_abort_on_damage true)
    (cs_enable_moving true)
    (cs_shoot_point true "ps_garage_hunter/shoot_01")
    (sleep_until (volume_test_players "tv_garage_int_start") 1)
)

(script static void f_garage_cleanup
    (sleep_forever f_garage_main)
)

(script dormant void f_sword_main
    (sleep_until 
        (or
            b_sword_ready
            (volume_test_players "tv_sword_start")
        ) 
    5)
    (if b_debug 
        (print "::: encounter start: sword"))
    (f_loadout_set "interior")
    (data_mine_set_mission_segment "m20_05_sword")
    (wake f_sword_save_control)
    (wake f_sword_waypoint_control)
    (wake f_sword_missionobj_control)
    (wake f_sword_spawn_control)
    (wake f_sword_music_control)
    (wake f_sword_md_control)
    (wake f_sword_objective_nanny)
    (wake f_sword_door_control)
    (wake f_sword_bomb_control)
    (wake f_sword_camera_control)
    (wake f_sword_fireteam_control)
    (if b_debug 
        (print "objective control : sword.01"))
    (set b_insertion_fade_in true)
    (if (not (> s_objcon_sword 1)) 
        (set s_objcon_sword 1))
    (f_recycle_outside)
    (ai_erase "gr_exterior_cov")
    (sleep_until 
        (or
            (volume_test_players "tv_sword_10")
            (>= s_objcon_sword 10)
        ) 
    1)
    (dprint "objective control : sword.10")
    (if (not (> s_objcon_sword 10)) 
        (set s_objcon_sword 10))
    (sleep_until 
        (or
            (volume_test_players "tv_sword_20")
            (>= s_objcon_sword 20)
        ) 
    1)
    (dprint "objective control : sword.20")
    (if (not (> s_objcon_sword 20)) 
        (set s_objcon_sword 20))
    (sleep_until 
        (or
            (volume_test_players "tv_sword_25")
            (>= s_objcon_sword 25)
        ) 
    1)
    (dprint "objective control : sword.25")
    (if (not (> s_objcon_sword 25)) 
        (set s_objcon_sword 25))
    (sleep_until (volume_test_players "tv_sword_27") 5)
    (if b_debug 
        (print "objective control : sword.27"))
    (set s_objcon_sword 27)
    (sleep_until (volume_test_players "tv_sword_30") 5)
    (if b_debug 
        (print "objective control : sword.30"))
    (set s_objcon_sword 30)
    (sleep_until (volume_test_players "tv_sword_32") 5)
    (if b_debug 
        (print "objective control : sword.32"))
    (set s_objcon_sword 32)
    (sleep_until (volume_test_players "tv_sword_35") 5)
    (if b_debug 
        (print "objective control : sword.35"))
    (set s_objcon_sword 35)
    (sleep_until (volume_test_players "tv_sword_40") 5)
    (if b_debug 
        (print "objective control : sword.40"))
    (set s_objcon_sword 40)
    (sleep_until (volume_test_players "tv_sword_50") 5)
    (if b_debug 
        (print "objective control : sword.50"))
    (set s_objcon_sword 50)
    (sleep_until (volume_test_players "tv_sword_55") 5)
    (if b_debug 
        (print "objective control : sword.55"))
    (set s_objcon_sword 55)
    (sleep_until (volume_test_players "tv_sword_57") 5)
    (if b_debug 
        (print "objective control : sword.57"))
    (set s_objcon_sword 57)
    (set s_music_sword 3)
    (sleep_until (volume_test_players "tv_sword_60") 5)
    (if b_debug 
        (print "objective control : sword.60"))
    (set s_objcon_sword 60)
    (sleep_until (volume_test_players "tv_sword_70") 5)
    (if b_debug 
        (print "objective control : sword.70"))
    (set s_objcon_sword 70)
)

(script dormant void f_sword_objective_nanny
    (ai_set_objective "gr_hum" "obj_sword_hum")
)

(script dormant void f_sword_flock_control
    (flock_delete "flock_exterior_banshee_01")
    (flock_delete "flock_exterior_falcon_01")
    (flock_delete "flock_exterior_banshee_02")
    (flock_delete "flock_exterior_falcon_02")
    (flock_create "flock_exterior_phantom_01")
    (flock_create "flock_interior_phantom_01")
    (flock_create "flock_interior_banshee_01")
    (flock_create "flock_interior_falcon_01")
)

(script static void f_cin_intro_prep
    (object_create "sc_cin_terrain_blocker")
    (ai_place "gr_intro_hum")
    (ai_place "gr_intro_cov")
    (tick)
    (ai_cannot_die "gr_intro_hum" true)
    (ai_cannot_die "gr_intro_cov" true)
)

(script static void f_cin_intro_finish
    (ai_cannot_die "gr_intro_hum" false)
    (ai_cannot_die "gr_intro_cov" false)
    (tick)
    (ai_erase "gr_intro_hum")
    (ai_erase "gr_intro_cov")
)

(script dormant void f_sword_fireteam_control
    (wake f_fireteam_setup)
    (sleep_until (>= s_objcon_sword 25) 5)
    (f_train_fireteams_1)
    (wake f_train_fireteams_2_p0)
    (wake f_train_fireteams_2_p1)
    (wake f_train_fireteams_2_p2)
    (wake f_train_fireteams_2_p3)
)

(script dormant void f_sword_camera_control
    (tick)
)

(script dormant void f_sword_save_control
    (sleep_until (>= s_objcon_sword 1))
    (sleep (* 30.0 6.0))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_sword 25))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_sword 40))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_sword 50))
    (game_save_no_timeout)
)

(script dormant void f_sword_missionobj_control
    (sleep_until (>= s_objcon_sword 1))
    (tit_sword)
    (sleep 200)
    (mo_sword)
)

(script dormant void f_sword_waypoint_control
    (sleep_until (>= s_objcon_sword 25) 5 (* 30.0 s_roof_waypoint_timer))
    (if (not (>= s_objcon_sword 25)) 
        (begin
            (f_blip_flag "fl_sword_waypoint_1" blip_destination)
            (sleep_until (>= s_objcon_sword 25) 5)
            (f_unblip_flag "fl_sword_waypoint_1")
        )
    )
)

(script dormant void f_sword_door_control
    (sleep_until (>= s_objcon_sword 20) 5)
    (device_set_position "dm_door_atrium" 1.0)
    (tick)
    (device_operates_automatically_set "dm_door_atrium" true)
)

(script continuous void f_shake_control
    (sleep_until 
        (begin
            (sleep_until b_shake)
            (set b_shake false)
            (player_effect_set_max_rotation 0.0 1.0 0.25)
            (player_effect_set_max_rumble 1.0 1.0)
            (player_effect_start 0.7 0.1)
            (sleep 90)
            (player_effect_stop 0.5)
            false
        ) 
    1)
)

(script dormant void f_sword_bomb_control
    (f_object_create_frozen "cr_sword_panel_1_1")
    (f_object_create_frozen "cr_sword_panel_1_2")
    (f_object_create_frozen "cr_sword_panel_1_3")
    (f_object_create_frozen "cr_sword_panel_1_4")
    (f_object_create_frozen "cr_sword_panel_2_1")
    (f_object_create_frozen "cr_sword_panel_2_2")
    (f_object_create_frozen "cr_sword_panel_2_3")
    (f_object_create_frozen "cr_sword_panel_2_4")
    (if (not b_test_hallbomb) 
        (begin
            (sleep_until (volume_test_players "tv_sword_strike_door") 5)
            (wake f_sword_bomb_0)
        )
    )
    (sleep_until (volume_test_players "tv_sword_strike_top") 5)
    (wake f_sword_bomb_1)
    (set s_music_sword 4)
)

(script dormant void f_sword_bomb_0
    (set b_shake true)
    (sleep 60)
    (f_object_fall_forward "cr_sword_panel_1_1")
    (sleep (random_range 2 7))
    (f_object_fall_forward "cr_sword_panel_1_4")
    (sleep (random_range 2 7))
    (f_object_fall_forward "cr_sword_panel_1_3")
    (sleep (random_range 2 7))
    (f_object_fall_forward "cr_sword_panel_1_2")
    (sound_impulse_start "sound\levels\020_base\base_scripted_expl2a" none 1.0)
    (dprint "sword bomb 0")
    (object_create_anew "es_interp_10")
    (interpolator_start "base_bombing")
    (md_sword_bomb_0)
    (sleep (* 30.0 10.0))
    (object_destroy "es_interp_10")
)

(script dormant void f_sword_bomb_1
    (set b_shake true)
    (sleep 60)
    (f_object_fall_forward "cr_sword_panel_2_4")
    (sleep (random_range 2 7))
    (f_object_fall_forward "cr_sword_panel_2_2")
    (sleep (random_range 2 7))
    (f_object_fall_forward "cr_sword_panel_2_1")
    (sleep (random_range 2 7))
    (f_object_fall_forward "cr_sword_panel_2_3")
    (sound_impulse_start "sound\levels\020_base\base_scripted_expl1a" none 1.0)
    (dprint "sword bomb 1")
    (object_create_anew "es_interp_10")
    (interpolator_start "base_bombing")
    (md_sword_bomb_1)
    (sleep (* 30.0 10.0))
    (object_destroy "es_interp_10")
)

(script static void f_object_create_frozen (object_name o_freeze)
    (object_create o_freeze)
    (object_dynamic_simulation_disable o_freeze true)
)

(script static void f_object_fall_forward (object_name o_fall)
    (dprint "fall")
    (object_dynamic_simulation_disable o_fall false)
    (object_set_velocity o_fall -0.8 0.0 0.0)
)

(script dormant void f_sword_md_control
    (sleep_until (>= s_objcon_sword 1) 5)
    (sleep (* 30.0 2.0))
    (md_sword_enter)
    (sleep_until (>= s_objcon_sword 10) 5)
    (md_sword_scanner)
    (sleep_until (>= s_objcon_sword 25) 5)
    (sleep (* 30.0 3.0))
    (md_sword_atrium)
    (sleep_until (>= s_objcon_roof 1) 1 (* 30.0 180.0))
    (if (not (>= s_objcon_roof 1)) 
        (md_sword_delay_0))
    (sleep_until (>= s_objcon_roof 1) 1 (* 30.0 180.0))
    (if (not (>= s_objcon_roof 1)) 
        (md_sword_delay_1))
)

(script dormant void f_sword_music_control
    (sleep_until (>= s_objcon_sword 1))
    (wake music_sword)
)

(script dormant void f_sword_spawn_control
    (if (< s_objcon_sword 20) 
        (begin
            (f_squad_group_place "gr_sword_cov_init_lobby")
        )
    )
    (sleep_until (>= s_objcon_sword 20))
    (wake f_sword_jun_control)
    (wake f_sword_jorge_control)
    (f_squad_group_place "gr_sword_cov_init_interior")
    (f_squad_group_place "gr_sword_hum_init_interior")
    (if (= (game_coop_player_count) 1) 
        (begin
            (f_squad_group_place "gr_sword_hum_marine_3_stranded")
        )
    )
    (if (= (game_coop_player_count) 2) 
        (begin
            (ai_place "sq_sword_marine_3_stranded/male")
            (ai_place "sq_sword_marine_3_stranded/female_1")
        )
    )
    (if (= (game_coop_player_count) 3) 
        (begin
            (ai_place "sq_sword_marine_3_stranded/male")
        )
    )
    (sleep_until (>= s_objcon_sword 30))
    (ai_place "sq_sword_cov_2_closet")
    (ai_place "sq_sword_cov_2_room_1")
    (ai_place "sq_sword_cov_2_room_2")
    (soft_ceiling_enable "camera_blocker_07" false)
    (sleep_until (>= s_objcon_sword 35))
    (ai_place "sq_sword_cov_3_snipers")
    (ai_place "sq_sword_cov_3_room")
    (ai_place "sq_sword_cov_3_stair")
    (ai_place "sq_sword_cov_3_conference")
    (if (= s_special_elite 2) 
        (ai_place "sq_sword_bob"))
    (soft_ceiling_enable "camera_blocker_08" false)
    (sleep_until (>= s_objcon_sword 50))
    (ai_place "sq_sword_cov_4_boss")
    (ai_place "sq_sword_cov_4_hall")
    (soft_ceiling_enable "camera_blocker_09" false)
    (ai_disregard (ai_actors "sq_sword_cov_4_boss") true)
    (sleep_until (>= s_objcon_sword 57))
    (ai_disregard (ai_actors "sq_sword_cov_4_boss") false)
)

(script dormant void f_sword_boss_disregard
    (sleep_until 
        (begin
            (ai_disregard (ai_get_object "sq_sword_cov_4_boss") true)
            (ai_disregard (ai_actors "sq_sword_cov_4_boss") true)
            (>= s_objcon_sword 57)
        ) 
    30)
    (ai_disregard (ai_get_object "sq_sword_cov_4_boss") false)
    (ai_disregard (ai_actors "sq_sword_cov_4_boss") false)
)

(script static void f_sword_boss_retreat
    (sleep (* 30.0 15.0))
    (ai_set_task "sq_sword_cov_4_boss" "obj_roof_cov" "gate_infantry")
)

(script dormant void f_sword_jun_control
    (f_jun_spawn "sq_jun/sword" "obj_sword_hum")
    (ai_set_task ai_jun "obj_sword_hum" "gate_jun")
    (set b_jun_blip true)
    (wake f_jun_blip)
)

(script dormant void f_sword_jorge_control
    (f_jorge_spawn "sq_jorge/sword" "obj_sword_hum")
    (ai_set_task ai_jorge "obj_sword_hum" "gate_jorge")
    (set b_jorge_blip true)
    (wake f_jorge_blip)
)

(script command_script void f_cs_sword_skirm_5_1
    (cs_jump_to_point 2.2 2.2)
)

(script static void f_sword_cleanup
    (sleep_forever f_sword_main)
)

(script dormant void f_roof_main
    (sleep_until (volume_test_players "tv_roof_start") 5)
    (if b_debug 
        (print "::: encounter start: roof"))
    (data_mine_set_mission_segment "m20_06_roof")
    (wake f_roof_missionobj_control)
    (wake f_roof_md_control)
    (wake f_roof_music_control)
    (wake f_roof_spawn_control)
    (wake f_roof_save_control)
    (wake f_corvette_sword)
    (wake f_roof_emile_control)
    (wake f_roof_banshee_death_tracker)
    (wake f_roof_banshee_failsafe)
    (if b_debug 
        (print "objective control : roof.01"))
    (set b_insertion_fade_in true)
    (set s_objcon_roof 1)
    (sleep_until (volume_test_players "tv_roof_enter") 5)
    (if b_debug 
        (print "objective control : roof.15"))
    (set s_objcon_roof 15)
    (set s_music_sword 5)
    (ai_set_objective "sq_jorge" "obj_roof_hum")
    (sleep_until 
        (and
            (<= (ai_living_count "obj_roof_cov") 0)
            (<= (object_get_health (ai_vehicle_get_from_squad "sq_roof_phantom_w1" 0)) 0.0)
        ) 
    5)
    (if b_debug 
        (print "objective control : roof.20"))
    (set s_objcon_roof 20)
    (sleep (* 30.0 2.0))
    (wake f_md_roof_clear_1)
    (sleep 63)
    (sleep (* 30.0 2.0))
    (wake f_md_roof_clear_2)
    (sleep (* 30.0 4.0))
    (cinematic_enter "020lb_halsey" true)
    (f_cin_outro_prep)
    (f_end_mission "020lb_halsey" "zoneset_end_cinematic")
    (game_won)
)

(script dormant void f_md_roof_clear_1
    (md_roof_clear_1)
)

(script dormant void f_md_roof_clear_2
    (md_roof_clear_2)
)

(script static void f_cin_outro_prep
    (f_objects_interior_destroy)
    (f_objects_outro_destroy)
    (object_teleport_to_ai_point player0 "ps_roof_cin_final/p0")
    (object_teleport_to_ai_point player1 "ps_roof_cin_final/p1")
    (object_teleport_to_ai_point player2 "ps_roof_cin_final/p2")
    (object_teleport_to_ai_point player3 "ps_roof_cin_final/p3")
    (object_destroy "dm_corvette_exterior")
    (object_destroy "dm_corvette_sword")
    (sleep_forever f_save_continuous)
    (flock_delete "flock_exterior_banshee_01")
    (flock_delete "flock_exterior_falcon_01")
    (flock_delete "flock_exterior_falcon_02")
    (flock_delete "flock_exterior_phantom_01")
    (flock_delete "flock_exterior_banshee_02")
    (flock_delete "flock_interior_phantom_01")
    (flock_delete "flock_interior_banshee_01")
    (flock_delete "flock_interior_falcon_01")
)

(script dormant void f_roof_save_control
    (sleep_until (>= s_objcon_roof 1))
    (game_save_no_timeout)
    (sleep_until (>= s_objcon_roof 15))
    (game_save_no_timeout)
)

(script dormant void f_roof_missionobj_control
    (sleep_until (>= s_objcon_sword 1))
    (mo_roof)
)

(script dormant void f_roof_md_control
    (sleep_until (>= s_objcon_roof 10) 5)
    (sleep (* 30.0 3.0))
    (md_roof_enter)
    (sleep_until (>= s_objcon_roof 20) 1 (* 30.0 30.0))
    (if (not (>= s_objcon_roof 20)) 
        (md_roof_delay_0))
    (sleep_until (>= s_objcon_roof 20) 1 (* 30.0 90.0))
    (if (not (>= s_objcon_roof 20)) 
        (md_roof_delay_1))
)

(script dormant void f_roof_emile_control
    (f_emile_spawn "sq_emile/roof" "obj_roof_hum")
    (ai_set_task ai_emile "obj_roof_hum" "init")
    (set b_emile_blip true)
    (wake f_emile_blip)
)

(script static void f_roof_emile_banshee
    (if b_debug 
        (print "emile targeting banshees"))
    (ai_prefer_target_ai ai_emile "gr_roof_cov_air" true)
    (ai_set_targeting_group ai_emile 1)
)

(script static void f_roof_emile_banshee_retreat
    (if b_debug 
        (print "emile retreating"))
    (ai_prefer_target_ai ai_emile "gr_roof_cov_air" false)
)

(script dormant void f_roof_spawn_control
    (f_squad_group_place "gr_roof_cov_init")
    (f_squad_group_place "gr_roof_cov_banshees")
    (ai_set_targeting_group "gr_roof_cov_banshees" 1)
    (sleep_until (>= s_objcon_roof 15) 5)
    (ai_place "sq_roof_phantom_w1")
    (tick)
    (unit_set_current_vitality (ai_vehicle_get_from_starting_location "sq_roof_phantom_w1/driver_01") 1000.0 0.0)
    (unit_set_maximum_vitality (ai_vehicle_get_from_starting_location "sq_roof_phantom_w1/driver_01") 1000.0 0.0)
    (sleep (* 30.0 180.0))
    (f_blip_ai "gr_roof_cov_banshees" blip_neutralize)
    (f_blip_ai "sq_roof_banshee_2" blip_neutralize)
    (f_blip_ai "sq_roof_banshee_3" blip_neutralize)
    (f_blip_ai "sq_roof_phantom_w1/driver_01" blip_neutralize)
)

(script dormant void f_roof_banshee_death_tracker
    (sleep_until (<= (ai_living_count "gr_roof_cov_banshees") 0) 5)
    (dprint "cov air attack")
    (ai_set_targeting_group "gr_roof_cov_air" 1)
)

(script dormant void f_roof_banshee_failsafe
    (sleep_until b_roof_phantom_w1_spawn 5)
    (sleep_until (not b_roof_phantom_w1_spawn) 5)
    (sleep_until (<= (ai_task_count "obj_roof_cov/gate_infantry") 0) 5)
    (sleep (* 30.0 180.0))
    (sleep_until 
        (begin
            (if (not (volume_test_objects "tv_roof_banshee_safe" (ai_get_object "sq_roof_banshee_1"))) 
                (unit_kill "sq_roof_banshee_1"))
            (if (not (volume_test_objects "tv_roof_banshee_safe" (ai_get_object "sq_roof_banshee_2"))) 
                (unit_kill "sq_roof_banshee_2"))
            (if (not (volume_test_objects "tv_roof_banshee_safe" (ai_get_object "sq_roof_banshee_3"))) 
                (unit_kill "sq_roof_banshee_3"))
            (if (not (volume_test_objects "tv_roof_banshee_safe" (ai_get_object "sq_roof_banshee_4"))) 
                (unit_kill "sq_roof_banshee_4"))
            (if (not (volume_test_objects "tv_roof_banshee_safe" (ai_get_object "sq_roof_banshee_5"))) 
                (unit_kill "sq_roof_banshee_5"))
            (if (not (volume_test_objects "tv_roof_banshee_safe" (ai_get_object "sq_roof_banshee_6"))) 
                (unit_kill "sq_roof_banshee_6"))
            (if (not (volume_test_objects "tv_roof_banshee_safe" (ai_get_object "sq_roof_banshee_7"))) 
                (unit_kill "sq_roof_banshee_7"))
            false
        ) 
    (* 30.0 5.0))
)

(script dormant void f_roof_music_control
    (sleep_until (>= s_objcon_roof 20) 5)
)

(script static void f_roof_cleanup
    (sleep_forever f_roof_main)
)

(script command_script void cs_roof_phantom_w1
    (object_cannot_die (ai_vehicle_get ai_current_actor) true)
    (set b_roof_phantom_w1_spawn true)
    (if b_debug 
        (print "roof phantom"))
    (f_load_phantom ai_current_squad "left" "sq_roof_backup_1" "sq_roof_backup_2" none none)
    (cs_fly_by "ps_roof_phantom_1/enter_01")
    (cs_fly_by "ps_roof_phantom_1/enter_02")
    (cs_fly_by "ps_roof_phantom_1/enter_03")
    (cs_vehicle_speed 0.6)
    (cs_fly_to_and_face "ps_roof_phantom_1/enter_04" "ps_roof_phantom_1/enter_04_face" 0.1)
    (f_unload_phantom ai_current_squad "left")
    (set b_roof_phantom_w1_spawn false)
    (sleep (* 30.0 2.0))
    (cs_enable_looking true)
    (cs_enable_targeting true)
    (cs_fly_to_and_face "ps_roof_phantom_1/fight_02" "ps_roof_phantom_1/fight_02_face" 0.1)
    (object_cannot_die (ai_vehicle_get ai_current_actor) false)
    (sleep_until 
        (begin
            (set s_roof_phantom_fight (random_range 1 5))
            (if (= s_roof_phantom_fight 1) 
                (cs_fly_to_and_face "ps_roof_phantom_1/fight_01" "ps_roof_phantom_1/fight_01_face" 0.1))
            (if (= s_roof_phantom_fight 2) 
                (cs_fly_to_and_face "ps_roof_phantom_1/fight_02" "ps_roof_phantom_1/fight_02_face" 0.1))
            (if (= s_roof_phantom_fight 3) 
                (cs_fly_to_and_face "ps_roof_phantom_1/fight_03" "ps_roof_phantom_1/fight_03_face" 0.1))
            (if (= s_roof_phantom_fight 4) 
                (cs_fly_to_and_face "ps_roof_phantom_1/fight_04" "ps_roof_phantom_1/fight_04_face" 0.1))
            false
        ) 
    (* 30.0 1.0))
)

(script dormant void f_gatehouse_door_control
    (sleep_until (= b_court_defended true))
    (if (not 
        (or
            (unit_has_weapon (player0) "objects\weapons\pistol\target_laser\target_laser.weapon")
            (unit_has_weapon (player1) "objects\weapons\pistol\target_laser\target_laser.weapon")
            (unit_has_weapon (player2) "objects\weapons\pistol\target_laser\target_laser.weapon")
            (unit_has_weapon (player3) "objects\weapons\pistol\target_laser\target_laser.weapon")
        )
    ) 
        (begin
            (f_blip_object "wp_valley_targetlaser" blip_ordnance)
        )
    )
    (sleep_until 
        (or
            (>= s_objcon_valley 20)
            (unit_has_weapon (player0) "objects\weapons\pistol\target_laser\target_laser.weapon")
            (unit_has_weapon (player1) "objects\weapons\pistol\target_laser\target_laser.weapon")
            (unit_has_weapon (player2) "objects\weapons\pistol\target_laser\target_laser.weapon")
            (unit_has_weapon (player3) "objects\weapons\pistol\target_laser\target_laser.weapon")
        )
    )
    (f_unblip_object "wp_valley_targetlaser")
    (set b_airtagger_taken true)
    (if b_debug 
        (print "opening gatehouse_frontdoor"))
    (set b_gatehouse_door_open true)
    (wake f_gatehouse_open_delay)
    (device_set_position "dm_valley_door_large" 0.99)
    (device_set_position "dm_valley_door_small" 0.99)
    (sleep_until (volume_test_players "tv_gate_close") 5)
    (if b_debug 
        (print "closing gatehouse_frontdoor"))
    (device_set_position "dm_valley_door_large" 0.0)
    (device_set_position "dm_valley_door_small" 0.0)
    (sleep_until (<= (device_get_position "dm_valley_door_large") 0.0))
    (if b_debug 
        (print "gatehouse_frontdoor closed"))
    (f_gatehouse_door_teleport)
    (set b_gatehouse_door_open false)
)

(script dormant void f_gatehouse_open_delay
    (sleep (* 30.0 5.0))
    (set b_gatehouse_delay true)
)

(script static void f_gatehouse_door_teleport
    (if (not (volume_test_object "tv_area_valley" player0)) 
        (object_teleport_to_ai_point player0 "ps_valley_gate/p0"))
    (if (not (volume_test_object "tv_area_valley" player1)) 
        (object_teleport_to_ai_point player1 "ps_valley_gate/p1"))
    (if (not (volume_test_object "tv_area_valley" player2)) 
        (object_teleport_to_ai_point player2 "ps_valley_gate/p2"))
    (if (not (volume_test_object "tv_area_valley" player3)) 
        (object_teleport_to_ai_point player3 "ps_valley_gate/p3"))
)

(script dormant void f_gatehouse_door_return
    (wake f_gatehouse_door_return_triggers)
    (wake f_gatehouse_door_return_switch)
    (wake f_gatehouse_door_timer)
    (wake f_gatehouse_door_objects)
    (sleep_until 
        (begin
            (sleep_until 
                (and
                    b_gatehouse_door_timer_done
                    (= (device_get_position "dc_return_door_switch") 1.0)
                ) 
            1)
            (if 
                (or
                    (not b_gatehouse_trigger_exterior)
                    (game_is_cooperative)
                ) 
                    (begin
                        (device_set_position "dm_valley_door_large" 0.99)
                        (device_set_position "dm_valley_door_small" 0.99)
                        (effect_stop_object_marker "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_large" "fx_release")
                        (effect_stop_object_marker "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_small" "fx_release")
                        (dprint "door open")
                        (if (game_is_cooperative) 
                            (f_zoneset_direction direction_inward_coop) (f_zoneset_direction direction_inward))
                        (switch_zone_set "zoneset_courtyard_valley_return")
                        (sleep 10)
                        (f_objects_court_return_create_anew)
                        (set b_garage_ready true)
                        (f_gatehouse_door_timer_reset)
                    )
            )
            (if (game_is_cooperative) 
                (begin
                    (f_gatehouse_open_coop)
                ) (begin
                    (sleep_until b_gatehouse_trigger_exterior 1)
                    (dprint "door close trigger")
                    (device_set_position "dm_valley_door_large" 0.0)
                    (device_set_position "dm_valley_door_small" 0.0)
                    (effect_stop_object_marker "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_large" "fx_release")
                    (effect_stop_object_marker "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_small" "fx_release")
                    (sleep_until (<= (device_get_position "dm_valley_door_large") 0.0) 1)
                    (dprint "door closed")
                    (f_zoneset_direction direction_return)
                    (f_gatehouse_door_timer_reset)
                )
            )
            (game_is_cooperative)
        ) 
    1)
)

(script dormant void f_gatehouse_door_objects
    (sleep_until 
        (begin
            (sleep_until (= (current_zone_set) s_zoneset_courtyard_valley_re) 1)
            (sleep_until (= (current_zone_set_fully_active) s_zoneset_exterior) 1)
            (f_objects_exterior_create)
            (f_air_cannon_place)
            false
        ) 
    1)
)

(script static void f_gatehouse_open_coop
    (effect_stop_object_marker "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_large" "fx_release")
    (effect_stop_object_marker "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_small" "fx_release")
    (sleep_forever f_gatehouse_door_return_triggers)
    (sleep_forever f_gatehouse_door_return_switch)
    (sleep_forever f_gatehouse_door_timer)
    (sleep_forever f_gatehouse_door_objects)
    (device_set_power "dc_return_door_switch" 0.0)
    (f_unblip_object "dc_return_door_switch")
)

(script dormant void f_gatehouse_door_return_triggers
    (sleep_until 
        (begin
            (sleep_until (volume_test_players "begin_zone_set:zoneset_courtyard_valley_return:*") 1)
            (set b_gatehouse_trigger_courtyard true)
            (set b_gatehouse_trigger_exterior false)
            (sleep_until (volume_test_players "begin_zone_set:zoneset_exterior") 1)
            (set b_gatehouse_trigger_courtyard false)
            (set b_gatehouse_trigger_exterior true)
            false
        ) 
    1)
)

(script dormant void f_gatehouse_door_return_switch
    (sleep_until 
        (begin
            (sleep_until b_gatehouse_trigger_courtyard 1)
            (device_set_power "dc_return_door_switch" 1.0)
            (f_blip_object "dc_return_door_switch" blip_interface)
            (f_gatehouse_door_timer_start)
            (if (game_is_cooperative) 
                (begin
                    (sleep_until (= (device_get_position "dc_return_door_switch") 1.0) 1)
                    (wake f_md_return_gate)
                    (effect_new_on_object_marker_loop "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_large" "fx_release")
                    (effect_new_on_object_marker_loop "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_small" "fx_release")
                    (device_set_power "dc_return_door_switch" 0.0)
                    (f_unblip_object "dc_return_door_switch")
                ) (begin
                    (sleep_until 
                        (or
                            (= (device_get_position "dc_return_door_switch") 1.0)
                            b_gatehouse_trigger_exterior
                        ) 
                    1)
                    (f_gatehouse_door_timer_reset)
                    (if (= (device_get_position "dc_return_door_switch") 1.0) 
                        (begin
                            (wake f_md_return_gate)
                            (effect_new_on_object_marker_loop "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_large" "fx_release")
                            (effect_new_on_object_marker_loop "objects\levels\solo\m20\gatehouse_door\fx\gatehouse_steam_release.effect" "dm_valley_door_small" "fx_release")
                        )
                    )
                    (device_set_position "dc_return_door_switch" 0.0)
                    (device_set_power "dc_return_door_switch" 0.0)
                    (f_unblip_object "dc_return_door_switch")
                    (sleep_until b_gatehouse_trigger_exterior)
                )
            )
            (game_is_cooperative)
        ) 
    1)
)

(script dormant void f_md_return_gate
    (sleep (* 30.0 2.0))
    (md_return_gate)
)

(script dormant void f_gatehouse_door_timer
    (sleep_until 
        (begin
            (sleep_until b_gatehouse_door_timer)
            (sleep (* 30.0 15.0))
            (set b_gatehouse_door_timer_done true)
            false
        ) 
    1)
)

(script static void f_gatehouse_door_timer_reset
    (set b_gatehouse_door_timer_done false)
    (set b_gatehouse_door_timer false)
)

(script static void f_gatehouse_door_timer_start
    (set b_gatehouse_door_timer_done false)
    (set b_gatehouse_door_timer true)
)

(script static void dprint (string s)
    (if b_debug 
        (print s))
)

(script static void dbreak (string s)
    (sleep 0)
)

(script static void md_print (string s)
    (if b_md_print 
        (print s))
)

(script static void f_abort
    (dprint "function aborted")
)

(script dormant void f_checkpoint_generic
    (sleep 0)
)

(script static void tick
    (sleep 1)
)

(script command_script void f_cs_abort
    (sleep 1)
)

(script command_script void f_cs_sleep
    (sleep_forever)
)

(script dormant void f_fireteam_setup
    (sleep_until (> (player_count) 0))
    (ai_player_add_fireteam_squad (player0) "sq_player_0")
    (ai_player_add_fireteam_squad (player1) "sq_player_1")
    (ai_player_add_fireteam_squad (player2) "sq_player_2")
    (ai_player_add_fireteam_squad (player3) "sq_player_3")
    (ai_player_set_fireteam_max (player0) s_fireteam_max)
    (ai_player_set_fireteam_max (player1) s_fireteam_max)
    (ai_player_set_fireteam_max (player2) s_fireteam_max)
    (ai_player_set_fireteam_max (player3) s_fireteam_max)
    (ai_player_set_fireteam_max_squad_absorb_distance (player0) r_fireteam_dist)
    (ai_player_set_fireteam_max_squad_absorb_distance (player1) r_fireteam_dist)
    (ai_player_set_fireteam_max_squad_absorb_distance (player2) r_fireteam_dist)
    (ai_player_set_fireteam_max_squad_absorb_distance (player3) r_fireteam_dist)
    (ai_set_fireteam_absorber "gr_hum" true)
)

(script continuous void f_players_any_on_foot
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
            (set b_players_any_on_foot false) (set b_players_any_on_foot true))
    (if 
        (or
            (= (unit_in_vehicle (player0)) false)
            (= (unit_in_vehicle (player1)) false)
            (= (unit_in_vehicle (player2)) false)
            (= (unit_in_vehicle (player3)) false)
        ) 
            (set b_players_all_on_foot false) (set b_players_all_on_foot true))
)

(script static void f_squad_set_obj_area (string_id obj, trigger_volume vol)
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_valley_troophog"))
            b_valley_warthog_drop_trav
        ) 
            (begin
                (print "migrating sq_valley_troophog to local")
                (cs_run_command_script "sq_valley_troophog" f_cs_abort)
                (ai_set_objective "sq_valley_troophog" obj)
                (set b_valley_troophog_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_valley_warthog_drop")))
            (not b_valley_warthog_drop_trav)
        ) 
            (begin
                (print "migrating local squad to traversal")
                (cs_run_command_script "sq_valley_warthog_drop" f_cs_abort)
                (ai_set_objective "sq_valley_warthog_drop" "obj_vehicles_hum")
                (set b_valley_warthog_drop_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_valley_warthog_drop"))
            b_valley_warthog_drop_trav
        ) 
            (begin
                (print "migrating sq_valley_warthog_drop to local")
                (cs_run_command_script "sq_valley_warthog_drop" f_cs_abort)
                (ai_set_objective "sq_valley_warthog_drop" obj)
                (set b_valley_warthog_drop_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_valley_warthog_drop")))
            (not b_valley_warthog_drop_trav)
        ) 
            (begin
                (print "migrating local squad to traversal")
                (cs_run_command_script "sq_valley_warthog_drop" f_cs_abort)
                (ai_set_objective "sq_valley_warthog_drop" "obj_vehicles_hum")
                (set b_valley_warthog_drop_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_air_warthog_ins"))
            b_air_warthog_ins_trav
        ) 
            (begin
                (print "migrating sq_air_warthog_ins to local")
                (cs_run_command_script "sq_air_warthog_ins" f_cs_abort)
                (ai_set_objective "sq_air_warthog_ins" obj)
                (set b_air_warthog_ins_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_air_warthog_ins")))
            (not b_air_warthog_ins_trav)
        ) 
            (begin
                (print "migrating air_warthog_ins to traversal")
                (cs_run_command_script "sq_air_warthog_ins" f_cs_abort)
                (ai_set_objective "sq_air_warthog_ins" "obj_vehicles_hum")
                (set b_air_warthog_ins_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_air_warthog"))
            b_air_warthog_trav
        ) 
            (begin
                (print "migrating sq_air_warthog to local")
                (cs_run_command_script "sq_air_warthog" f_cs_abort)
                (ai_set_objective "sq_air_warthog" obj)
                (set b_air_warthog_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_air_warthog")))
            (not b_air_warthog_trav)
        ) 
            (begin
                (print "migrating air_warthog to traversal")
                (cs_run_command_script "sq_air_warthog" f_cs_abort)
                (ai_set_objective "sq_air_warthog" "obj_vehicles_hum")
                (set b_air_warthog_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_air_bighog"))
            b_air_bighog_trav
        ) 
            (begin
                (print "migrating sq_air_bighog to local")
                (cs_run_command_script "sq_air_bighog" f_cs_abort)
                (ai_set_objective "sq_air_bighog" obj)
                (set b_air_bighog_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_air_bighog")))
            (not b_air_bighog_trav)
        ) 
            (begin
                (print "migrating air_bighog to traversal")
                (cs_run_command_script "sq_air_bighog" f_cs_abort)
                (ai_set_objective "sq_air_bighog" "obj_vehicles_hum")
                (set b_air_bighog_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_far_warthog_ins"))
            b_far_warthog_ins_trav
        ) 
            (begin
                (print "migrating sq_far_warthog_ins to local")
                (cs_run_command_script "sq_far_warthog_ins" f_cs_abort)
                (ai_set_objective "sq_far_warthog_ins" obj)
                (set b_far_warthog_ins_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_air_warthog_ins")))
            (not b_air_warthog_ins_trav)
        ) 
            (begin
                (print "migrating air_warthog_ins to traversal")
                (cs_run_command_script "sq_air_warthog_ins" f_cs_abort)
                (ai_set_objective "sq_air_warthog_ins" "obj_vehicles_hum")
                (set b_air_warthog_ins_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_far_warthog"))
            b_far_warthog_trav
        ) 
            (begin
                (print "migrating sq_far_warthog to local")
                (cs_run_command_script "sq_far_warthog" f_cs_abort)
                (ai_set_objective "sq_far_warthog" obj)
                (set b_far_warthog_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_far_warthog")))
            (not b_far_warthog_trav)
        ) 
            (begin
                (print "migrating far_warthog to traversal")
                (cs_run_command_script "sq_far_warthog" f_cs_abort)
                (ai_set_objective "sq_far_warthog" "obj_vehicles_hum")
                (set b_far_warthog_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_far_bighog"))
            b_far_bighog_trav
        ) 
            (begin
                (print "migrating sq_far_bighog to local")
                (cs_run_command_script "sq_far_bighog" f_cs_abort)
                (ai_set_objective "sq_far_bighog" obj)
                (set b_far_bighog_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_far_bighog")))
            (not b_far_bighog_trav)
        ) 
            (begin
                (print "migrating far_bighog to traversal")
                (cs_run_command_script "sq_far_bighog" f_cs_abort)
                (ai_set_objective "sq_far_bighog" "obj_vehicles_hum")
                (set b_far_bighog_trav true)
            )
    )
    (if 
        (and
            (volume_test_objects vol (ai_get_object "sq_return_warthog_ins"))
            b_return_warthog_ins_trav
        ) 
            (begin
                (print "migrating sq_return_warthog_ins to local")
                (cs_run_command_script "sq_return_warthog_ins" f_cs_abort)
                (ai_set_objective "sq_return_warthog_ins" obj)
                (set b_return_warthog_ins_trav false)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object "sq_return_warthog_ins")))
            (not b_return_warthog_ins_trav)
        ) 
            (begin
                (print "migrating sq_return_warthog_ins to traversal")
                (cs_run_command_script "sq_return_warthog_ins" f_cs_abort)
                (ai_set_objective "sq_return_warthog_ins" "obj_vehicles_hum")
                (set b_return_warthog_ins_trav true)
            )
    )
)

(script static boolean f_squad_area_handle (ai squad, boolean trav, string_id obj, trigger_volume vol)
    (if 
        (and
            (volume_test_objects vol (ai_get_object squad))
            trav
        ) 
            (begin
                (print "migrating traversal squad to local")
                (cs_run_command_script squad f_cs_abort)
                (ai_set_objective squad obj)
                (= 1.0 0.0)
            )
    )
    (if 
        (and
            (not (volume_test_objects vol (ai_get_object squad)))
            (not trav)
        ) 
            (begin
                (print "migrating local squad to traversal")
                (cs_run_command_script squad f_cs_abort)
                (ai_set_objective squad "obj_vehicles_hum")
                (= 1.0 1.0)
            )
    )
)

(script static void f_squad_set_obj (ai squad_group, string_id obj)
    (set s_squad_group_obj_counter (ai_squad_group_get_squad_count squad_group))
    (sleep_until 
        (begin
            (set s_squad_group_obj_counter (- s_squad_group_obj_counter 1.0))
            (cs_run_command_script (ai_squad_group_get_squad squad_group s_squad_group_obj_counter) f_cs_abort)
            (ai_set_objective (ai_squad_group_get_squad squad_group s_squad_group_obj_counter) obj)
            (<= s_squad_group_obj_counter 0)
        ) 
    5)
)

(script static void f_squad_group_place (ai squad_group)
    (set s_squad_group_place_counter (ai_squad_group_get_squad_count squad_group))
    (sleep_until 
        (begin
            (set s_squad_group_place_counter (- s_squad_group_place_counter 1.0))
            (ai_place (ai_squad_group_get_squad squad_group s_squad_group_place_counter))
            (<= s_squad_group_place_counter 0)
        ) 
    1)
)

(script static boolean difficulty_is_normal_or_lower
    (or
        (= (game_difficulty_get) easy)
        (= (game_difficulty_get) normal)
    )
)

(script static boolean difficulty_is_normal_or_higher
    (or
        (= (game_difficulty_get) normal)
        (= (game_difficulty_get) heroic)
        (= (game_difficulty_get) legendary)
    )
)

(script static boolean difficulty_is_heroic_or_lower
    (or
        (= (game_difficulty_get) easy)
        (= (game_difficulty_get) normal)
        (= (game_difficulty_get) heroic)
    )
)

(script static boolean difficulty_is_heroic_or_higher
    (or
        (= (game_difficulty_get) heroic)
        (= (game_difficulty_get) legendary)
    )
)

(script static boolean difficulty_is_legendary
    (= (game_difficulty_get) legendary)
)

(script static void pose_body (object_name body_name, short pose)
    (object_create body_name)
    (cond
        ((= pose pose_against_wall_var1)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_01")
        )
        ((= pose pose_against_wall_var2)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_02")
        )
        ((= pose pose_against_wall_var3)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_03")
        )
        ((= pose pose_against_wall_var4)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_04")
        )
        ((= pose pose_on_back_var1)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_05")
        )
        ((= pose pose_on_back_var2)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_06")
        )
        ((= pose pose_on_side_var1)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_07")
        )
        ((= pose pose_on_side_var2)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_08")
        )
        ((= pose pose_on_back_var3)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_09")
        )
        ((= pose pose_face_down_var1)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_10")
        )
        ((= pose pose_face_down_var2)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_11")
        )
        ((= pose pose_on_side_var3)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_12")
        )
        ((= pose pose_on_side_var4)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_13")
        )
        ((= pose pose_face_down_var3)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_14")
        )
        ((= pose pose_on_side_var5)
            (scenery_animation_start (scenery body_name) "objects\characters\marine\marine" "deadbody_15")
        )
    )
)

(script static void sh
    (if (!= game_speed 0.5) 
        (set game_speed 0.5) (set game_speed 1.0))
)

(script static void p
    (if (!= game_speed 0.0) 
        (set game_speed 0.0) (set game_speed 1.0))
)

(script static void s5
    (if (!= game_speed 5.0) 
        (set game_speed 5.0) (set game_speed 1.0))
)

(script static void b
    (if ai_render_sector_bsps 
        (set ai_render_sector_bsps false) (set ai_render_sector_bsps true))
)

(script static void o
    (if ai_render_objectives 
        (begin
            (set ai_render_objectives false)
            (print "render objectives off")
        ) (begin
            (set ai_render_objectives true)
            (print "render objectives on")
        )
    )
)

(script static void s
    (if b_debug_scripting 
        (begin
            (debug_scripting false)
            (print "debug_scripting off")
            (set b_debug_scripting false)
        ) (begin
            (debug_scripting true)
            (print "debug_scripting on")
            (set b_debug_scripting true)
        )
    )
)

(script static void d
    (if ai_render_decisions 
        (set ai_render_decisions false) (set ai_render_decisions true))
)

(script static void c
    (if ai_render_command_scripts 
        (begin
            (set ai_render_command_scripts false)
            (print "command scripts off")
        ) (begin
            (set ai_render_command_scripts true)
            (print "command scripts on")
        )
    )
)

(script static void t
    (print "performances")
    (if debug_performances 
        (set debug_performances false) (set debug_performances true))
)

(script static void k
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_far_cleanup)
    (f_air_cleanup)
    (f_air_far_cleanup)
    (f_return_cleanup)
    (f_garage_cleanup)
    (f_sword_cleanup)
    (f_roof_cleanup)
)

(script static void f_ls_flyby (device d)
    (device_animate_position d 0.0 0.0 0.0 0.0 true)
    (device_set_position_immediate d 0.0)
    (device_set_power d 0.0)
    (sleep 1)
    (device_set_position_track d "device:position" 0.0)
    (device_animate_position d 0.5 7.0 0.1 0.1 true)
)

(script static void f_ls_carpetbomb (point_reference p, effect e, short count, short delay)
    (set global_s_current_bomb 0)
    (sleep_until 
        (begin
            (if b_debug_globals 
                (print "boom..."))
            (effect_new_at_point_set_point e p global_s_current_bomb)
            (set global_s_current_bomb (+ global_s_current_bomb 1.0))
            (sleep delay)
            (>= global_s_current_bomb count)
        ) 
    1)
)

(script dormant void f_corvette_exterior
    (object_create "dm_corvette_exterior")
    (device_set_position_track "dm_corvette_exterior" "device:position" 0.0)
    (if b_debug 
        (print "corvette moving distance"))
    (device_animate_position "dm_corvette_exterior" 0.22 (* 60.0 2.0) 5.0 5.0 true)
    (if (not (game_is_cooperative)) 
        (begin
            (sleep 30)
            (ai_place "sq_corvette_aa_bombard")
            (ai_cannot_die "sq_corvette_aa_bombard" true)
            (tick)
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_01" (object_get_turret "dm_corvette_exterior" 0) none)
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_02" (object_get_turret "dm_corvette_exterior" 1) none)
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_03" (object_get_turret "dm_corvette_exterior" 2) none)
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_04" (object_get_turret "dm_corvette_exterior" 3) none)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_01" f_cs_corvette_shoot_init_1)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_02" f_cs_corvette_shoot_init_2)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_03" f_cs_corvette_shoot_init_3)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_04" f_cs_corvette_shoot_init_4)
        )
    )
    (sleep_until 
        (or
            b_court_defended
            b_test_gatebomb
            b_test_airbomb
        )
    )
    (if b_debug 
        (print "corvette moving airview"))
    (device_animate_position "dm_corvette_exterior" 0.9 (* 60.0 5.0) 1.0 1.0 true)
    (if (not (game_is_cooperative)) 
        (begin
            (sleep_forever f_cs_corvette_shoot_init_1)
            (sleep_forever f_cs_corvette_shoot_init_2)
            (sleep_forever f_cs_corvette_shoot_init_3)
            (sleep_forever f_cs_corvette_shoot_init_4)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_01" f_cs_corvette_shoot_air_1)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_02" f_cs_corvette_shoot_air_2)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_03" f_cs_corvette_shoot_air_3)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_04" f_cs_corvette_shoot_air_4)
        )
    )
    (if b_test_airbomb 
        (begin
            (device_animate_position "dm_corvette_exterior" 0.9 0.0 0.034 0.034 false)
        )
    )
    (sleep_until 
        (or
            (and
                b_far_defended
                b_air_defended
            )
            b_test_gatebomb
        )
    )
    (if b_debug 
        (print "corvette moving gatehouse"))
    (device_animate_position "dm_corvette_exterior" 1.0 (* 60.0 3.0) 1.0 1.0 true)
    (if (not (game_is_cooperative)) 
        (begin
            (sleep_forever f_cs_corvette_shoot_air_1)
            (sleep_forever f_cs_corvette_shoot_air_2)
            (sleep_forever f_cs_corvette_shoot_air_3)
            (sleep_forever f_cs_corvette_shoot_air_4)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_01" f_cs_corvette_shoot_gate_1)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_02" f_cs_corvette_shoot_gate_2)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_03" f_cs_corvette_shoot_gate_3)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_04" f_cs_corvette_shoot_gate_4)
        )
    )
    (if b_test_gatebomb 
        (begin
            (device_animate_position "dm_corvette_exterior" 1.0 0.0 0.034 0.034 false)
        )
    )
    (sleep_until (>= s_objcon_sword 1) 1)
    (if (not (game_is_cooperative)) 
        (begin
            (sleep_forever f_cs_corvette_shoot_gate_1)
            (sleep_forever f_cs_corvette_shoot_gate_2)
            (sleep_forever f_cs_corvette_shoot_gate_3)
            (sleep_forever f_cs_corvette_shoot_gate_4)
            (ai_erase "sq_corvette_aa_bombard")
        )
    )
)

(script dormant void f_corvette_sword
    (sleep_forever f_corvette_exterior)
    (sleep_forever f_cs_corvette_shoot_gate_1)
    (sleep_forever f_cs_corvette_shoot_gate_2)
    (sleep_forever f_cs_corvette_shoot_gate_3)
    (sleep_forever f_cs_corvette_shoot_gate_4)
    (ai_erase "sq_corvette_aa_bombard")
    (object_destroy "dm_corvette_exterior")
    (object_create "dm_corvette_sword")
    (tick)
    (ai_place "sq_corvette_aa_bombard")
    (ai_cannot_die "sq_corvette_aa_bombard" true)
    (if (not (game_is_cooperative)) 
        (begin
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_01" (object_get_turret "dm_corvette_sword" 0) none)
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_02" (object_get_turret "dm_corvette_sword" 1) none)
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_03" (object_get_turret "dm_corvette_sword" 2) none)
            (ai_vehicle_enter_immediate "sq_corvette_aa_bombard/driver_04" (object_get_turret "dm_corvette_sword" 3) none)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_01" f_cs_corvette_shoot_roof_1)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_02" f_cs_corvette_shoot_roof_2)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_03" f_cs_corvette_shoot_roof_3)
            (cs_run_command_script "sq_corvette_aa_bombard/driver_04" f_cs_corvette_shoot_roof_4)
        )
    )
)

(script command_script void f_cs_corvette_shoot_init_1
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_init/01_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_init/01_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_init/01_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_init/01_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_init_2
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_init/02_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_init/02_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_init/02_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_init/02_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_init_3
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_init/03_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_init/03_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_init/03_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_init/03_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_init_4
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_init/04_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_init/04_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_init/04_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_init/04_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_air_1
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_air/01_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_air/01_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_air/01_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_air/01_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_air_2
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_air/02_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_air/02_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_air/02_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_air/02_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_air_3
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_air/03_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_air/03_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_air/03_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_air/03_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_air_4
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_air/04_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_air/04_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_air/04_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_air/04_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_gate_1
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_gate/01_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_gate/01_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_gate/01_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_gate/01_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_gate_2
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_gate/02_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_gate/02_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_gate/02_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_gate/02_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_gate_3
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_gate/03_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_gate/03_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_gate/03_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_gate/03_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_gate_4
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_gate/04_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_gate/04_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_gate/04_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_gate/04_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_roof_1
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_roof/01_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_roof/01_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_roof/01_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_roof/01_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_roof_2
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_roof/02_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_roof/02_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_roof/02_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_roof/02_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_roof_3
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_roof/03_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_roof/03_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_roof/03_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_roof/03_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot_roof_4
    (sleep_until 
        (begin
            (set s_corvette_shoot_random (random_range 1 4))
            (if (= s_corvette_shoot_random 1) 
                (cs_shoot_point true "ps_corvette_shoot_roof/04_01"))
            (if (= s_corvette_shoot_random 2) 
                (cs_shoot_point true "ps_corvette_shoot_roof/04_02"))
            (if (= s_corvette_shoot_random 3) 
                (cs_shoot_point true "ps_corvette_shoot_roof/04_03"))
            (if (= s_corvette_shoot_random 4) 
                (cs_shoot_point true "ps_corvette_shoot_roof/04_04"))
            false
        ) 
    (random_range 30 300))
)

(script command_script void f_cs_corvette_shoot
    (cs_shoot_point true "ps_sword_corvette/shoot")
    (sleep_forever)
)

(script continuous void f_save_continuous
    (sleep_until b_insertion_fade_in)
    (sleep_until 
        (begin
            (if b_save_continuous 
                (begin
                    (sleep_until (= (current_zone_set) (current_zone_set_fully_active)) 2)
                    (sleep (* 30.0 5.0))
                    (dprint "continuous save")
                    (game_save_no_timeout)
                )
            )
            false
        ) 
    (* 30.0 120.0))
)

(script dormant void f_save_control
    (sleep_until 
        (begin
            (if (not b_save_on) 
                (game_save_cancel))
            false
        ) 
    30)
)

(script continuous void f_recycle_all_continuous
    (sleep_until b_insertion_fade_in)
    (sleep_until 
        (begin
            (if (volume_test_players "tv_recycle_courtyard") 
                (f_recycle_courtyard_lite) (f_recycle_courtyard))
            (if (volume_test_players "tv_recycle_faragate") 
                (f_recycle_faragate_lite) (f_recycle_faragate))
            (if (volume_test_players "tv_recycle_airview") 
                (f_recycle_airview_lite) (f_recycle_airview))
            (if (volume_test_players "tv_recycle_valley") 
                (f_recycle_valley_lite) (f_recycle_valley))
            (if (volume_test_players "tv_recycle_sword") 
                (f_recycle_sword_lite) (f_recycle_sword))
            false
        ) 
    400)
)

(script static void f_recycle_courtyard
    (add_recycling_volume "tv_recycle_courtyard" 5 5)
)

(script static void f_recycle_courtyard_lite
    (add_recycling_volume_by_type "tv_recycle_courtyard" 25 (* 30.0 4.0) 1)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_courtyard" 30 (* 30.0 4.0) 4)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_courtyard" 20 (* 30.0 4.0) 8)
    (sleep (* 30.0 5.0))
)

(script static void f_recycle_sword
    (add_recycling_volume "tv_recycle_sword" 5 5)
)

(script static void f_recycle_sword_lite
    (add_recycling_volume_by_type "tv_recycle_sword" 25 (* 30.0 4.0) 1)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_sword" 30 (* 30.0 4.0) 4)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_sword" 20 (* 30.0 4.0) 8)
    (sleep (* 30.0 5.0))
)

(script static void f_recycle_faragate
    (add_recycling_volume "tv_recycle_faragate" 5 5)
)

(script static void f_recycle_faragate_lite
    (add_recycling_volume_by_type "tv_recycle_faragate" 25 (* 30.0 4.0) 1)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_faragate" 30 (* 30.0 4.0) 4)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_faragate" 20 (* 30.0 4.0) 8)
    (sleep (* 30.0 5.0))
)

(script static void f_recycle_airview
    (add_recycling_volume "tv_recycle_airview" 5 5)
)

(script static void f_recycle_airview_lite
    (add_recycling_volume_by_type "tv_recycle_airview" 25 (* 30.0 4.0) 1)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_airview" 30 (* 30.0 4.0) 4)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_airview" 20 (* 30.0 4.0) 8)
    (sleep (* 30.0 5.0))
)

(script static void f_recycle_valley
    (add_recycling_volume "tv_recycle_valley" 5 5)
)

(script static void f_recycle_valley_lite
    (add_recycling_volume_by_type "tv_recycle_valley" 25 (* 30.0 4.0) 1)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_valley" 30 (* 30.0 4.0) 4)
    (sleep (* 30.0 5.0))
    (add_recycling_volume_by_type "tv_recycle_valley" 20 (* 30.0 4.0) 8)
    (sleep (* 30.0 5.0))
)

(script static void f_recycle_outside
    (sleep_forever f_recycle_all_continuous)
    (add_recycling_volume "tv_recycle_courtyard" 0 0)
    (add_recycling_volume "tv_recycle_faragate" 0 0)
    (add_recycling_volume "tv_recycle_airview" 0 0)
)

(script static void f_test_airbomb
    (switch_zone_set "zoneset_exterior")
    (set b_insertion_fade_in true)
    (set b_test_airbomb true)
    (object_teleport_to_ai_point (player0) "ps_air_airbomb_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_air_airbomb_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_air_airbomb_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_air_airbomb_spawn/player3")
    (wake f_corvette_exterior)
)

(script static void f_test_gatebomb
    (f_kill_all_scripts)
    (switch_zone_set "zoneset_exterior")
    (set b_insertion_fade_in true)
    (set b_test_gatebomb true)
    (object_teleport_to_ai_point (player0) "ps_return_gatebomb_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_return_gatebomb_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_return_gatebomb_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_return_gatebomb_spawn/player3")
    (wake f_corvette_exterior)
)

(script static void f_test_basebomb
    (f_kill_all_scripts)
    (switch_zone_set "zoneset_interior")
    (set b_insertion_fade_in true)
    (set b_test_basebomb true)
    (object_teleport_to_ai_point (player0) "ps_sword_basebomb_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_sword_basebomb_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_sword_basebomb_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_sword_basebomb_spawn/player3")
    (wake f_sword_bomb_control)
)

(script static void f_test_hallbomb
    (f_kill_all_scripts)
    (switch_zone_set "zoneset_interior")
    (set b_insertion_fade_in true)
    (set b_test_hallbomb true)
    (object_teleport_to_ai_point (player0) "ps_sword_roofbomb_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_sword_roofbomb_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_sword_roofbomb_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_sword_roofbomb_spawn/player3")
    (wake f_sword_bomb_control)
)

(script static void f_test_roofbomb
    (f_kill_all_scripts)
    (switch_zone_set "zoneset_interior")
    (set b_insertion_fade_in true)
    (set b_test_roofbomb true)
    (object_teleport_to_ai_point (player0) "ps_sword_roofbomb_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_sword_roofbomb_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_sword_roofbomb_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_sword_roofbomb_spawn/player3")
    (wake f_corvette_sword)
)

(script static void f_test_sword
    (f_kill_all_scripts)
    (switch_zone_set "zoneset_interior")
    (set b_insertion_fade_in true)
    (set b_test_sword true)
    (soft_ceiling_enable "default" false)
    (object_teleport_to_ai_point (player0) "ps_sword_atrium/player0")
    (object_teleport_to_ai_point (player1) "ps_sword_atrium/player1")
    (object_teleport_to_ai_point (player2) "ps_sword_atrium/player2")
    (object_teleport_to_ai_point (player3) "ps_sword_atrium/player3")
    (f_kat_spawn "sq_kat/atrium" "obj_sword_hum")
    (device_set_position "dm_door_atrium" 1.0)
    (tick)
    (device_operates_automatically_set "dm_door_atrium" true)
    (set s_objcon_sword 10)
    (wake f_sword_main)
)

(script dormant void special_elite
    (dprint "special elite")
    (set s_special_elite (random_range 1 3))
    (sleep_until (> (ai_living_count "gr_special_elite") 0) 1)
    (sleep_until 
        (and
            (< (ai_living_count "gr_special_elite") 1)
            (= b_special_win true)
        ) 
    1)
    (set b_special true)
    (print "special win!")
)

(script command_script void cs_special_elite
    (set b_special_win true)
    (cs_face_player true)
    (sleep 5)
    (print "special start")
    (sleep_until 
        (or
            (and
                (or
                    (objects_can_see_object player0 (ai_get_object ai_current_actor) 10.0)
                    (< (objects_distance_to_object player0 (ai_get_object ai_current_actor)) 15.0)
                )
                (= (player_is_in_game player0) true)
            )
            (and
                (or
                    (objects_can_see_object player1 (ai_get_object ai_current_actor) 10.0)
                    (< (objects_distance_to_object player1 (ai_get_object ai_current_actor)) 15.0)
                )
                (= (player_is_in_game player1) true)
            )
            (and
                (or
                    (objects_can_see_object player2 (ai_get_object ai_current_actor) 10.0)
                    (< (objects_distance_to_object player2 (ai_get_object ai_current_actor)) 15.0)
                )
                (= (player_is_in_game player2) true)
            )
            (and
                (or
                    (objects_can_see_object player3 (ai_get_object ai_current_actor) 10.0)
                    (< (objects_distance_to_object player3 (ai_get_object ai_current_actor)) 15.0)
                )
                (= (player_is_in_game player3) true)
            )
        ) 
    5)
    (cs_enable_moving true)
    (cs_enable_targeting true)
    (cs_enable_looking true)
    (cs_enable_dialogue true)
    (print "special elite spotted")
    (sleep s_special_elite_ticks)
    (ai_set_active_camo ai_current_actor true)
    (sleep 30)
    (set b_special_win false)
    (print "special fail")
    (sleep 1)
    (ai_erase ai_current_actor)
)

(script static void f_test_vehicle_air
    (f_kill_all_scripts)
    (f_vehicle_goto_set vehicle_air)
    (ai_place "sq_valley_troophog/test")
    (f_kat_spawn "sq_kat/test" "obj_air_hum")
    (tick)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_valley_troophog/test") warthog_d o_kat)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_valley_troophog/test") warthog_p (player0))
)

(script static void f_test_vehicle_far
    (f_kill_all_scripts)
    (f_vehicle_goto_set vehicle_far)
    (ai_place "sq_valley_troophog/test")
    (f_kat_spawn "sq_kat/test" "obj_far_hum")
    (tick)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_valley_troophog/test") warthog_d o_kat)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_valley_troophog/test") warthog_p (player0))
)

(script static void f_test_vehicle_valley
    (f_kill_all_scripts)
    (f_vehicle_goto_set vehicle_return)
    (ai_place "sq_valley_troophog/test")
    (f_kat_spawn "sq_kat/test" "obj_return_hum")
    (tick)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_valley_troophog/test") warthog_d o_kat)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_valley_troophog/test") warthog_p (player0))
)

(script static void f_ai_detail (short detail)
    (if (= detail ai_detail_low) 
        (ai_lod_full_detail_actors 15))
    (if (= detail ai_detail_medium) 
        (ai_lod_full_detail_actors 20))
    (if (= detail ai_detail_high) 
        (ai_lod_full_detail_actors 20))
)

(script dormant void music_memory_test
    (sound_looping_stop "levels\solo\m20\music\m20_music01")
    (sound_looping_stop "levels\solo\m20\music\m20_music02")
    (sound_looping_stop "levels\solo\m20\music\m20_music03")
    (sound_looping_stop "levels\solo\m20\music\m20_music04")
    (sound_looping_stop "levels\solo\m20\music\m20_music05")
    (sound_looping_stop "levels\solo\m20\music\m20_music06")
    (sound_looping_stop "levels\solo\m20\music\m20_music07")
    (sound_looping_stop "levels\solo\m20\music\m20_music08")
    (sound_looping_stop "levels\solo\m20\music\m20_music09")
    (sound_looping_stop "levels\solo\m20\music\m20_music10")
    (sound_looping_stop "levels\solo\m20\music\m20_music11")
    (sound_looping_stop "levels\solo\m20\music\m20_music12")
    (sound_looping_stop "levels\solo\m20\music\m20_music13")
)

(script static void mo_courtyard
    (f_hud_obj_new "prompt_courtyard" "pause_courtyard")
)

(script static void mo_valley
    (f_hud_obj_new "prompt_valley" "pause_valley")
)

(script static void mo_airview
    (f_hud_obj_new "prompt_airview" "pause_airview")
)

(script static void mo_faragate
    (f_hud_obj_new "prompt_faragate" "pause_faragate")
)

(script static void mo_clean
    (f_hud_obj_new "prompt_clean" "pause_clean")
)

(script static void mo_airfar
    (f_hud_obj_new "prompt_airfar" "pause_airfar")
)

(script static void mo_farair
    (f_hud_obj_new "prompt_farair" "pause_farair")
)

(script static void mo_return
    (f_hud_obj_new "prompt_return" "pause_return")
)

(script static void mo_sword
    (f_hud_obj_new "prompt_sword" "pause_sword")
)

(script static void mo_roof
    (f_hud_obj_new "prompt_roof" "pause_roof")
)

(script static void tit_courtyard
    (f_hud_chapter "ct_courtyard")
)

(script static void tit_valley
    (f_hud_chapter "ct_valley")
)

(script static void tit_return
    (f_hud_chapter "ct_return")
)

(script static void tit_sword
    (f_hud_chapter "ct_sword")
)

(script static void md_play (short delay, sound line)
    (sound_impulse_start line none 1.0)
    (sleep (sound_impulse_language_time line))
    (sleep delay)
)

(script dormant void radio_chatter
    (sleep_until 
        (begin
            (sleep_until b_radio_chatter)
            (begin_random_count
                1
                (sleep (random_range 400 500))
                (sleep (random_range 900 1000))
                (sleep (random_range 2000 3000))
            )
            false
        )
    )
)

(script static void test_chatter
    (sleep 0)
)

(script static void md_court_intro
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "carter: kat, six: push back the attack on sword base. find out what we're dealing with.")
    (f_md_object_play (random_range 20 30) none m20_0010)
    (md_print "kat: roger that. we’re your strike team.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0030)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_court_north
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "control: spartans! hostiles north!")
    (f_md_object_play (random_range 30 60) none m20_0040)
    (md_print "kat: let's knock some heads, lieutenant!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0050)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_court_drop_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "control: dropship to the north!")
    (f_md_object_play (random_range 30 60) none m20_0100)
    (md_print "kat: roger that. tracking it.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0110)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_court_contacts_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "control: you've got enemy contacts, spartans!")
    (f_md_object_play 0 none m20_0190)
    (set s_music_court 1)
    (set g_dialog false)
)

(script static void md_court_combatend
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "kat: noble two to sword control. courtyard is clear, over.")
    (f_md_ai_play (random_range 30 60) (object_get_ai o_kat) m20_0230)
    (set s_music_court 3)
    (md_print "control: head for the main gate to the east. i'll brief you as you go.")
    (f_md_object_play 0 none m20_0240)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_valley_airtagger
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "kat: sword control, i see a target locator. any artillery support in the area?")
    (f_md_ai_play (random_range 30 60) (object_get_ai o_kat) m20_0310)
    (md_print "control: limited, but we'll prioritize whatever you need, ma'am.")
    (f_md_object_play 0 none m20_0320)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_valley_airtagger_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: get the target locator, six.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0340)
    (set g_dialog false)
)

(script static void md_valley_airtagger_delay_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: noble six, pick up that target locator on your way out.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0350)
    (set g_dialog false)
)

(script static void md_valley_airtagger_delay_2
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: lieutenant!  we need that target locator!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0360)
    (set g_dialog false)
)

(script static void md_valley_trooper_near
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (vs_cast "sq_valley_marines_1/marine_1" false 10 "m20_0480")
    (set ai_valley_marine_1 (vs_role 1))
    (vs_cast "sq_valley_marines_1/marine_2" false 10 "m20_0490")
    (set ai_valley_marine_2 (vs_role 2))
    (md_print "trooper 1: check it out, troopers!  we got spartan support!")
    (f_md_ai_play 0 ai_valley_marine_1 m20_0480)
    (md_print "trooper 2: four delta at your service!  anything you need, just say the word!")
    (f_md_ai_play 0 ai_valley_marine_2 m20_0490)
    (md_print "kat: good to know, private.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0500)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_valley_hogkill
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "trooper: three echo five seven, headed back to base -- but we got enemy tangos on our six, copy!")
    (f_md_object_play 0 none m20_0370)
    (set g_dialog false)
)

(script static void md_valley_tagshoot_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: six, use the target locator on that wraith!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0380)
    (set g_dialog false)
)

(script static void md_valley_tagshoot_delay_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: six, keep the locator on the target until air support confirms a lock.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0400)
    (set g_dialog false)
)

(script static void md_valley_wraiths_dead
    (md_valley_wraiths_dead_1)
    (md_valley_wraiths_dead_2)
    (sleep (random_range (* 30.0 3.0) (* 30.0 4.0)))
    (md_valley_wraiths_dead_kat)
)

(script static void md_valley_wraiths_dead_1
    (md_print "trooper 1: (cheering)")
    (f_md_ai_play 0 ai_valley_marine_1 m20_0420)
)

(script static void md_valley_wraiths_dead_2
    (md_print "trooper 2: (cheering)")
    (f_md_ai_play 0 ai_valley_marine_2 m20_0430)
)

(script static void md_valley_wraiths_dead_kat
    (md_print "kat: outstanding!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0470)
)

(script static void md_valley_hog
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: pelican inbound with transport, six.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0720)
    (set s_music_court 4)
    (set s_music_valley 4)
    (set g_dialog false)
)

(script static void md_valley_choice
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "control: the old farragut station has its own comms array. that should bring us back online with command.")
    (f_md_object_play (random_range 20 30) none m20_0260)
    (md_print "control: airview base has an anti-air battery that will help clear the skies.")
    (f_md_object_play (random_range 30 60) none m20_0270)
    (md_print "kat: aa gun is to the west. comms array is to the east. let's roll!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0730)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_valley_choice_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "control: doesn't matter which you do first -- comms array or the aa gun -- just get 'em both up and running.")
    (f_md_object_play 0 none m20_0280)
    (set g_dialog false)
)

(script static void md_valley_choice_air
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: i agree. go for the gun.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0740)
    (set g_dialog false)
)

(script static void md_valley_choice_far
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: good call. let's get comms first.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0750)
    (set g_dialog false)
)

(script static void md_shield_intro
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: that's a drop shield, six.")
    (f_md_ai_play (random_range 20 30) (object_get_ai o_kat) m20_1160)
    (md_print "kat: it will generate a temporary barrier that deflects incoming projectiles.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1170)
    (set g_dialog false)
)

(script static void md_shield_prompt
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: use the shield. make sure it works.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1190)
    (set g_dialog false)
)

(script static void md_shield_confirm
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: checks out. should help when you can't find cover.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1200)
    (set g_dialog false)
)

(script static void f_md_exterior_increment
    (set s_exterior_encounter 1)
)

(script static void md_air_view
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: i'm picking up a power source!  we're close to the aa gun!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0830)
    (set g_dialog false)
)

(script static void md_air_target
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: that's the gun over there!  should be a reset control somewhere to get it on-line.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0845)
    (set g_dialog false)
)

(script static void md_air_gun_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: we need to activate that aa gun, lieutenant. go hit the reset control.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0855)
    (set g_dialog false)
)

(script static void md_air_gun_delay_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: gun’s no good to us wihout power, activate it now!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0865)
    (set g_dialog false)
)

(script static void md_air_gun_delay_2
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: six, are you hearing me? find the reset controls and start up that gun!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_0875)
    (set g_dialog false)
)

(script static void md_air_return_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: six!  where are you going?")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1030)
    (set g_dialog false)
)

(script static void md_air_done
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: that did it, six. aa gun is online!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1975)
    (set g_dialog false)
)

(script static void md_air_done_faragate
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "control: nice work, spartans. head to farragut station, and get that comms array up and running.")
    (f_md_object_play 0 none m20_1010)
    (set g_dialog false)
)

(script static void md_air_delay
    (if (= s_exterior_encounter 0) 
        (md_air_delay_faragate))
    (if (= s_exterior_encounter 1) 
        (md_air_delay_sword))
)

(script static void md_air_delay_faragate
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: we need to get that comms array online.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1050)
    (set g_dialog false)
)

(script static void md_air_delay_sword
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "control: noble, i need you back at sword base!")
    (f_md_object_play (random_range 30 60) none m20_1070)
    (md_print "kat: we copy, commander.  let’s go, six!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1080)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_far_view
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: hope that comms array has a working generator...")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1110)
    (set g_dialog false)
)

(script static void md_far_target
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: let's search the area for a generator, six.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1120)
    (set g_dialog false)
)

(script static void md_far_generator_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: south building, lieutenant. check it out!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1130)
    (set g_dialog false)
)

(script static void md_far_generator_delay_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: generator must be in the south building. find it, lieutenant!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1140)
    (set g_dialog false)
)

(script static void md_far_generator_found
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: there's the generator!  go get it started!  i'll cover you!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1280)
    (set g_dialog false)
)

(script static void md_far_comm
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: ok, generator is up and running!  find that comms array.  should be up high...")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1310)
    (set g_dialog false)
)

(script static void md_far_comm_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: six, check the structure to the north for that array.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1320)
    (set g_dialog false)
)

(script static void md_far_comm_delay_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: array's got to be on top of that structure to the north. find it, six!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1320)
    (set g_dialog false)
)

(script static void md_far_return_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: activate the comms array, six!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1360)
    (set g_dialog false)
)

(script static void md_far_return_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: lieutenant!  you're supposed to turn on the comms array, remember?")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1370)
    (set g_dialog false)
)

(script static void md_far_done
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: you did it, six!  comms array up and running!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1380)
    (set g_dialog false)
)

(script static void md_far_done_airview
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: now let's head for airview base and get that aa gun online...")
    (f_md_ai_play 10 (object_get_ai o_kat) m20_1390)
    (set g_dialog false)
)

(script static void md_far_delay
    (if (= s_exterior_encounter 0) 
        (md_far_delay_airview))
    (if (= s_exterior_encounter 1) 
        (md_far_delay_sword))
)

(script static void md_far_delay_airview
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "control: spartan team: what’s the eta on that aa gun?")
    (f_md_object_play (random_range 30 60) none m20_1430)
    (md_print "kat: on our way now. let's roll, six!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1440)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_far_delay_sword
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "carter: noble strike this is noble leader: get back to sword base a-sap!")
    (f_md_object_play (random_range 30 60) none m20_1450)
    (md_print "kat: on our way, commander.  six, let's go!")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1460)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void f_md_hogdrop_increment
    (set s_hogdrop 1)
)

(script static void md_hogdrop
    (if (= s_hogdrop 0) 
        (md_hogdrop_0))
    (if (= s_hogdrop 1) 
        (md_hogdrop_1))
)

(script static void md_hogdrop_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "control: spartans, this is sword control. thought you could use some mobile firepower!")
    (f_md_object_play (random_range 30 60) none m20_1090)
    (md_print "kat: always. take that warthog, six.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1100)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_hogdrop_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "control: sending you some anti-armor support, spartans.")
    (f_md_object_play (random_range 30 60) none m20_1450)
    (md_print "kat: copy that. use the 'hog, noble six.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1460)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_return_pre_intro
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "control: good work, spartans. return to sword base.  the rest of your team is inbound, imminent.")
    (f_md_object_play 0 none m20_1400)
    (set g_dialog false)
)

(script static void md_return_intro
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_dialogue_enable false)
    (md_print "carter: noble, be advised: covenant corvette moving into position.")
    (f_md_object_play (random_range 20 30) none m20_1540)
    (md_print "carter: six, kat. get here quick. we'll meet you inside.")
    (f_md_object_play 0 none m20_1530)
    (set s_music_air 2)
    (ai_dialogue_enable true)
    (set g_dialog false)
)

(script static void md_return_gate
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "jun: we're stalled in the tower atrium. kat, where are you?")
    (f_md_object_play (random_range 30 60) none m20_1550)
    (md_print "kat: opening the gate now.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1560)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_garage_clear
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: let’s get to the atrium.  we’ll have to go through the security office.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1600)
    (set g_dialog false)
)

(script static void md_garage_elevator_prompt
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: elevator, lieutenant. take it.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1610)
    (set g_dialog false)
)

(script static void md_garage_bomb
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "emile: corvette's hitting this base hard.")
    (f_md_object_play (random_range 30 60) none m20_1640)
    (md_print "kat: where's our orbital support? got to be four platforms that could take it out with a single mac round.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1650)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_sword_enter
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "scanner: welcome to the office of naval intelligence...")
    (f_md_object_play (random_range 30 60) none m20_1690)
    (md_print "kat: i doubt that very much.")
    (f_md_ai_play 0 (object_get_ai o_kat) m20_1700)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_sword_scanner
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (md_print "scanner: thank you -- lieutenant.  you have been cleared for access!")
    (f_md_object_play 0 none m20_1720)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (set g_dialog false)
)

(script static void md_sword_scanner_kat
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "scanner: thank you -- lieutenant commander.  you have been cleared for access!")
    (f_md_object_play 0 none m20_1730)
    (set g_dialog false)
)

(script static void md_sword_scanner_cov
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "scanner: welcome to the oni security sca--")
    (f_md_object_play 10 none m20_1740)
    (md_print "scanner: warning!  warning!  security breach!  security breach!")
    (f_md_object_play 10 none m20_1750)
    (md_print "scanner: please wait for an oni security representative to assist you.  full compliance is advised.  thank you for your cooperation!")
    (f_md_object_play 0 none m20_1760)
    (set g_dialog false)
)

(script static void md_sword_fireteam_intro
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "control: there are multiple trooper fire teams on the ground in your area.  feel free to enlist their help.")
    (f_md_object_play 0 none m20_0510)
    (set g_dialog false)
)

(script static void md_sword_fireteam_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (vs_cast "sq_sword_marine_0_atrium" false 10 "m20_0480")
    (set ai_sword_marine_0_atrium (vs_role 1))
    (md_print "trooper: five november, ready to go!  just point us in the right direction!")
    (f_md_ai_play 0 ai_sword_marine_0_atrium m20_1700)
    (set g_dialog false)
)

(script static void md_sword_fireteam_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "trooper: alpha company, third platoon! holler if you need anything, spartans!")
    (f_md_object_play 0 none m20_0560)
    (set g_dialog false)
)

(script static void md_sword_atrium
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_kat) false)
    (ai_actor_dialogue_enable (object_get_ai o_jorge) false)
    (md_print "jorge: spartans! over here!")
    (f_md_ai_play 0 "gr_jorge" m20_1770)
    (if (player_has_female_voice player0) 
        (begin
            (md_print "carter: six, head upstairs and assist emile.  jorge, make sure she gets there.")
            (f_md_object_play 0 none m20_1850)
        ) (begin
            (md_print "carter: six, head upstairs and assist emile.  jorge, make sure he gets there.")
            (f_md_object_play 0 none m20_1840)
        )
    )
    (md_print "jorge: depend on it.")
    (f_md_ai_play 0 (object_get_ai o_jorge) m20_1860)
    (set s_music_sword 1)
    (ai_actor_dialogue_enable (object_get_ai o_kat) true)
    (ai_actor_dialogue_enable (object_get_ai o_jorge) true)
    (set g_dialog false)
)

(script static void md_sword_bomb_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "control: corvette's gonna rip this base apart! what's the situation, noble?!")
    (f_md_object_play (random_range 30 60) none m20_1870)
    (md_print "emile: i can't do this on my own! need another spartan up here!")
    (f_md_object_play (random_range 30 60) none m20_1880)
    (md_print "carter: six! get to the top floor and assist emile!")
    (f_md_object_play 0 none m20_1890)
    (set s_music_sword 2)
    (set g_dialog false)
)

(script static void md_sword_bomb_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "control: commander, this base won't survive another salvo from that corvette! kill those banshees!")
    (f_md_object_play (random_range 30 60) none m20_1900)
    (md_print "carter: upstairs, lieutenant!  we need those longswords in the air!")
    (f_md_object_play 0 none m20_1910)
    (set g_dialog false)
)

(script static void md_sword_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "carter: keep moving up, noble six!")
    (f_md_object_play 0 none m20_1920)
    (set g_dialog false)
)

(script static void md_sword_delay_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "carter: we need you on the upper level, lieutenant!")
    (f_md_object_play 0 none m20_1930)
    (set g_dialog false)
)

(script static void md_roof_enter
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_emile) false)
    (md_print "emile: about time!  you clear the ground -- i’ll take care of the banshees!")
    (f_md_ai_play 0 (object_get_ai o_emile) m20_1970)
    (ai_actor_dialogue_enable (object_get_ai o_emile) true)
    (set g_dialog false)
)

(script static void md_roof_delay_0
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_emile) false)
    (print "emile: keep shooting, noble six!  watch down low!")
    (f_md_ai_play 0 (object_get_ai o_emile) m20_1980)
    (ai_actor_dialogue_enable (object_get_ai o_emile) true)
    (set g_dialog false)
)

(script static void md_roof_delay_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_emile) false)
    (md_print "emile: kill those hostiles! banshees are almost gone!")
    (f_md_ai_play 0 (object_get_ai o_emile) m20_2100)
    (ai_actor_dialogue_enable (object_get_ai o_emile) true)
    (set g_dialog false)
)

(script static void md_roof_clear_1
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_actor_dialogue_enable (object_get_ai o_emile) false)
    (md_print "emile: that's the way we get it done, spartan!")
    (f_md_ai_play 0 (object_get_ai o_emile) m20_2030)
    (ai_actor_dialogue_enable (object_get_ai o_emile) true)
    (set g_dialog false)
)

(script static void md_roof_clear_2
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (ai_dialogue_enable false)
    (md_print "control: noble team: longswords are inbound, and ready to push. orbital defense is standing-by to take the shot.")
    (f_md_object_play 0 none m20_2020)
    (ai_dialogue_enable true)
    (set g_dialog false)
)

(script static void md_xxx_muse
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: permission to speak freely, boss?")
    (f_md_ai_play 0 "gr_kat" m20_1480)
    (md_print "carter: granted.")
    (f_md_object_play 0 none m20_1490)
    (md_print "kat: why are the covenant hitting such a remote location?  most of our forces are protecting population centers down south.")
    (f_md_ai_play 0 "gr_kat" m20_1500)
    (md_print "carter: good question.  dot?")
    (f_md_object_play 0 none m20_1510)
    (md_print "auntie dot: insufficient information, commander.  but it is a good question.")
    (f_md_object_play 0 none m20_1520)
    (set g_dialog false)
)

(script static void md_xxx_delay_2
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "kat: hurry, six!")
    (f_md_ai_play 0 "gr_kat" m20_1940)
    (set g_dialog false)
)

(script static void md_xxx_delay_3
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "jorge: hurry, six!")
    (f_md_ai_play 0 "gr_jorge" m20_1950)
    (set g_dialog false)
)

(script static void md_xxx_delay_4
    (sleep_until (not g_dialog))
    (set g_dialog true)
    (md_print "emile: hurry, six!")
    (f_md_object_play 0 none m20_1960)
    (set g_dialog false)
)

(script dormant void music_court
    (sleep_until (>= s_music_court 1))
    (dprint "music contacts")
    (sound_looping_set_alternate "levels\solo\m20\music\m20_music01" true)
    (sleep_until (>= s_music_court 2))
    (dprint "music kill boss")
    (sound_looping_stop "levels\solo\m20\music\m20_music01")
    (sleep_until (>= s_music_court 3))
    (dprint "music court clear")
    (sound_looping_start "levels\solo\m20\music\m20_music02" none 1.0)
    (sleep_until (>= s_music_court 4))
    (dprint "music valley clear")
    (sound_looping_stop "levels\solo\m20\music\m20_music02")
)

(script dormant void music_valley
    (sleep_until (>= s_music_valley 3))
    (dprint "music valley start")
    (sound_looping_start "levels\solo\m20\music\m20_music02" none 1.0)
    (sleep_until (>= s_music_valley 4))
    (dprint "music valley clear")
    (sound_looping_stop "levels\solo\m20\music\m20_music02")
)

(script dormant void music_far
    (sleep_until (>= s_music_far 1))
    (dprint "music far start")
    (sound_looping_start "levels\solo\m20\music\m20_music03" none 1.0)
    (sleep_until (>= s_music_far 2))
    (dprint "music far end")
    (sound_looping_stop "levels\solo\m20\music\m20_music03")
)

(script dormant void music_air
    (sleep_until (>= s_music_air 1))
    (dprint "music air start")
    (sound_looping_start "levels\solo\m20\music\m20_music04" none 1.0)
    (sleep_until (>= s_music_air 2))
    (dprint "music air end")
    (sound_looping_stop "levels\solo\m20\music\m20_music04")
)

(script dormant void music_return
    (sleep_until (>= s_music_return 1))
    (dprint "music return start")
    (sound_looping_start "levels\solo\m20\music\m20_music10" none 1.0)
    (sleep_until (>= s_music_return 2))
    (dprint "music return end")
    (sound_looping_stop "levels\solo\m20\music\m20_music10")
)

(script dormant void music_garage
    (sleep_until (>= s_music_garage 1))
    (dprint "music garage start")
    (sound_looping_start "levels\solo\m20\music\m20_music05" none 1.0)
    (sleep_until (>= s_music_garage 2))
    (dprint "music hunters")
    (sound_looping_start "levels\solo\m20\music\m20_music06" none 1.0)
    (sleep_until (>= s_music_garage 3))
    (dprint "music 1st hunter dead")
    (sound_looping_set_alternate "levels\solo\m20\music\m20_music06" true)
    (sleep_until (>= s_music_garage 4))
    (dprint "music 2nd hunter dead")
    (sound_looping_stop "levels\solo\m20\music\m20_music06")
    (sleep_until (>= s_music_garage 5))
    (dprint "music elevator")
    (sound_looping_stop "levels\solo\m20\music\m20_music05")
)

(script dormant void music_sword
    (sleep_until (>= s_music_sword 1))
    (dprint "music jorge")
    (sound_looping_start "levels\solo\m20\music\m20_music07" none 1.0)
    (sleep_until (>= s_music_sword 2))
    (dprint "music carter")
    (sound_looping_activate_layer "levels\solo\m20\music\m20_music07" 1)
    (sleep_until (>= s_music_sword 3))
    (dprint "music hall")
    (sound_looping_start "levels\solo\m20\music\m20_music08" none 1.0)
    (sleep_until (>= s_music_sword 4))
    (dprint "music hall end")
    (sound_looping_stop "levels\solo\m20\music\m20_music07")
    (sleep_until (>= s_music_sword 5))
    (dprint "music roof")
    (sound_looping_stop "levels\solo\m20\music\m20_music08")
    (sound_looping_start "levels\solo\m20\music\m20_music09" none 1.0)
)

(script static boolean obj_vleft__1_4
    (< s_objcon_valley 20)
)

(script static boolean obj_vwrait_1_7
    (<= (ai_task_count "obj_valley_cov/gate_wraiths") 2)
)

(script static boolean obj_vgate__1_8
    b_valley_spawn_air
)

(script static boolean obj_vgate__1_10
    b_valley_spawn_far
)

(script static boolean obj_vkat_h_2_3
    (not b_gatehouse_delay)
)

(script static boolean obj_vadvan_2_4
    (<= (ai_task_count "obj_valley_cov/gate_infantry") 2)
)

(script static boolean obj_vfoot__2_7
    b_players_any_on_foot
)

(script static boolean obj_vhouse_2_9
    (not b_gatehouse_delay)
)

(script static boolean obj_vrock_2_10
    (> (ai_task_count "obj_valley_cov/gate_infantry") 2)
)

(script static boolean obj_vgate__2_11
    (> (ai_living_count "obj_valley_cov") 0)
)

(script static boolean obj_vpeak_2_15
    (> (ai_living_count "obj_valley_cov") 0)
)

(script static boolean obj_sgate__3_0
    (>= s_objcon_sword 30)
)

(script static boolean obj_sgate__3_2
    (>= s_objcon_sword 35)
)

(script static boolean obj_sgate__3_5
    (>= s_objcon_sword 50)
)

(script static boolean obj_sgate__3_7
    (< s_objcon_sword 25)
)

(script static boolean obj_s3_hig_3_10
    (< s_objcon_sword 50)
)

(script static boolean obj_s3_con_3_23
    (< s_objcon_sword 50)
)

(script static boolean obj_sboss__3_27
    (>= s_objcon_sword 57)
)

(script static boolean obj_sgate__4_0
    (or
        (and
            (>= s_objcon_sword 35)
            (<= (ai_task_count "obj_sword_cov/gate_floor_3") 1)
        )
        (>= s_objcon_sword 50)
    )
)

(script static boolean obj_sgate__4_2
    (or
        (and
            (>= s_objcon_sword 30)
            (<= (ai_task_count "obj_sword_cov/2_entry") 2)
        )
        (>= s_objcon_sword 32)
    )
)

(script static boolean obj_sgate__4_5
    (or
        (and
            (>= s_objcon_sword 50)
            (<= (ai_task_count "obj_sword_cov/gate_floor_4") 0)
        )
        (>= s_objcon_sword 57)
    )
)

(script static boolean obj_sjorge_4_7
    (or
        (<= (ai_task_count "obj_sword_cov/gate_floor_0") 1)
        (>= s_objcon_sword 35)
    )
)

(script static boolean obj_sjorge_4_11
    (or
        (and
            (>= s_objcon_sword 30)
            (<= (ai_task_count "obj_sword_cov/gate_floor_2") 0)
        )
        (>= s_objcon_sword 35)
    )
)

(script static boolean obj_sjorge_4_12
    (or
        (and
            (>= s_objcon_sword 50)
            (<= (ai_task_count "obj_sword_cov/gate_floor_4") 0)
        )
        (>= s_objcon_sword 57)
    )
)

(script static boolean obj_sjorge_4_13
    (or
        (and
            (>= s_objcon_sword 35)
            (<= (ai_task_count "obj_sword_cov/gate_floor_3") 1)
        )
        (>= s_objcon_sword 50)
    )
)

(script static boolean obj_skat_l_4_16
    (> (ai_task_count "obj_sword_cov/lobby_init") 0)
)

(script static boolean obj_sgate__4_17
    (< s_objcon_sword 25)
)

(script static boolean obj_skat_l_4_18
    (> (ai_task_count "obj_sword_cov/lobby_fallback") 0)
)

(script static boolean obj_sjun_i_4_23
    (< s_objcon_sword 27)
)

(script static boolean obj_sjorge_4_28
    (or
        (and
            (>= s_objcon_sword 30)
            (<= (ai_task_count "obj_sword_cov/2_entry") 2)
        )
        (>= s_objcon_sword 32)
    )
)

(script static boolean obj_sjorge_4_29
    (or
        (and
            (>= s_objcon_sword 35)
            (<= (ai_task_count "obj_sword_cov/3_snipe") 2)
        )
        (>= s_objcon_sword 50)
    )
)

(script static boolean obj_sjun_f_4_30
    (or
        (<= (ai_task_count "obj_sword_cov/gate_floor_0") 1)
        (>= s_objcon_sword 35)
    )
)

(script static boolean obj_sjun_f_4_31
    (or
        (and
            (>= s_objcon_sword 30)
            (<= (ai_task_count "obj_sword_cov/2_entry") 2)
        )
        (>= s_objcon_sword 32)
    )
)

(script static boolean obj_sjun_f_4_32
    (or
        (and
            (>= s_objcon_sword 30)
            (<= (ai_task_count "obj_sword_cov/gate_floor_2") 0)
        )
        (>= s_objcon_sword 35)
    )
)

(script static boolean obj_sjun_f_4_33
    (or
        (and
            (>= s_objcon_sword 35)
            (<= (ai_task_count "obj_sword_cov/3_snipe") 2)
        )
        (>= s_objcon_sword 50)
    )
)

(script static boolean obj_sjun_f_4_34
    (or
        (and
            (>= s_objcon_sword 50)
            (<= (ai_task_count "obj_sword_cov/gate_floor_4") 0)
        )
        (>= s_objcon_sword 57)
    )
)

(script static boolean obj_skat_f_4_36
    (or
        (<= (ai_task_count "obj_sword_cov/gate_floor_0") 1)
        (>= s_objcon_sword 35)
    )
)

(script static boolean obj_skat_f_4_37
    (or
        (and
            (>= s_objcon_sword 30)
            (<= (ai_task_count "obj_sword_cov/2_entry") 2)
        )
        (>= s_objcon_sword 32)
    )
)

(script static boolean obj_skat_f_4_38
    (or
        (and
            (>= s_objcon_sword 30)
            (<= (ai_task_count "obj_sword_cov/gate_floor_2") 0)
        )
        (>= s_objcon_sword 35)
    )
)

(script static boolean obj_skat_f_4_39
    (or
        (and
            (>= s_objcon_sword 35)
            (<= (ai_task_count "obj_sword_cov/3_snipe") 2)
        )
        (>= s_objcon_sword 50)
    )
)

(script static boolean obj_skat_f_4_40
    (or
        (and
            (>= s_objcon_sword 35)
            (<= (ai_task_count "obj_sword_cov/gate_floor_3") 1)
        )
        (>= s_objcon_sword 50)
    )
)

(script static boolean obj_skat_f_4_41
    (or
        (and
            (>= s_objcon_sword 50)
            (<= (ai_task_count "obj_sword_cov/gate_floor_4") 0)
        )
        (>= s_objcon_sword 57)
    )
)

(script static boolean obj_ghunte_5_3
    (>= s_objcon_garage 5)
)

(script static boolean obj_ggate__5_5
    (< s_objcon_garage 10)
)

(script static boolean obj_goffic_5_8
    (>= s_objcon_garage 20)
)

(script static boolean obj_gbarri_5_14
    (>= s_objcon_garage 3)
)

(script static boolean obj_gbob_f_5_16
    (< s_objcon_garage 4)
)

(script static boolean obj_gtarge_5_18
    (volume_test_players "tv_garage_security")
)

(script static boolean obj_gelbow_6_2
    (< s_objcon_garage 10)
)

(script static boolean obj_ggarag_6_4
    (< s_objcon_garage 20)
)

(script static boolean obj_celbow_11_9
    (or
        (< (ai_task_count "obj_court_cov/gate_rear") 2)
        (< s_objcon_court 40)
    )
)

(script static boolean obj_cledge_11_11
    (volume_test_players "tv_court_ledge_side")
)

(script static boolean obj_cledge_11_12
    (volume_test_players "tv_court_ledge_rear")
)

(script static boolean obj_cbridg_11_13
    (volume_test_players "tv_court_bridge_left")
)

(script static boolean obj_cbridg_11_14
    (volume_test_players "tv_court_bridge_right")
)

(script static boolean obj_cgate__11_16
    (< s_objcon_court 10)
)

(script static boolean obj_cgate__11_17
    (< s_objcon_court 30)
)

(script static boolean obj_cgate__11_18
    (< s_objcon_court 40)
)

(script static boolean obj_cgate__11_21
    (< s_objcon_court 20)
)

(script static boolean obj_cmiddl_11_24
    (or
        (< s_objcon_court 20)
        (< (ai_task_count "obj_court_cov/gate_middle") 0)
    )
)

(script static boolean obj_crear_11_25
    (< s_objcon_court 40)
)

(script static boolean obj_cgate__12_4
    (or
        (> (ai_task_count "obj_court_cov/gate_init") 0)
        (< s_objcon_court 5)
    )
)

(script static boolean obj_cgate__12_5
    (or
        (> (ai_task_count "obj_court_cov/gate_middle") 0)
        (< s_objcon_court 20)
    )
)

(script static boolean obj_cgate__12_7
    (> (ai_task_count "obj_court_cov/elbow_mid") 0)
)

(script static boolean obj_ckat_i_12_12
    (or
        (> (ai_task_count "obj_court_cov/gate_init") 0)
        (< s_objcon_court 5)
    )
)

(script static boolean obj_ckat_b_12_13
    (or
        (> (ai_task_count "obj_court_cov/gate_middle") 0)
        (< s_objcon_court 20)
    )
)

(script static boolean obj_ckat_b_12_14
    (or
        (> (ai_task_count "obj_court_cov/gate_rear") 0)
        (< s_objcon_court 30)
    )
)

(script static boolean obj_ckat_e_12_15
    (or
        (> (ai_task_count "obj_court_cov/elbow_mid") 0)
        (< s_objcon_court 40)
    )
)

(script static boolean obj_cgate__12_17
    (> (ai_task_count "obj_court_cov/gate_rear") 0)
)

(script static boolean obj_ckat_e_12_20
    (or
        (> (ai_task_count "obj_court_cov/elbow_rear") 0)
        (< s_objcon_court 45)
    )
)

(script static boolean obj_agate__14_17
    (>= s_air_wave_count 2)
)

(script static boolean obj_agate__14_20
    (<= (ai_task_count "obj_air_cov/gate_infantry") 3)
)

(script static boolean obj_agate__14_24
    (volume_test_players "tv_air_garage_roof")
)

(script static boolean obj_aregro_15_7
    b_air_kat_regroup
)

(script static boolean obj_rbansh_17_0
    (not b_roof_phantom_w1_spawn)
)

(script static boolean obj_rgate__17_2
    (volume_test_players "tv_roof_corvette_start")
)

(script static boolean obj_rcover_17_5
    (>= s_objcon_roof 15)
)

(script static boolean obj_rregro_18_6
    b_return_kat_regroup
)

(script static boolean obj_finner_19_0
    b_players_any_on_foot
)

(script static boolean obj_freven_19_5
    b_players_any_on_foot
)

(script static boolean obj_fgate__19_9
    (>= s_objcon_far 15)
)

(script static boolean obj_fgate__19_16
    (>= s_objcon_far 20)
)

(script static boolean obj_ftop_l_19_22
    (volume_test_players "tv_far_cabin_top")
)

(script static boolean obj_fregro_20_6
    b_far_kat_regroup
)

(script static boolean obj_sgate__24_7
    (< s_objcon_sword 25)
)

(script static boolean obj_sflak__24_17
    (< s_objcon_sword 30)
)

(script static boolean obj_sflak__24_19
    (< s_objcon_sword 32)
)

(script static boolean obj_sflak__24_20
    (< s_objcon_sword 40)
)

(script static void ico
    (ins_court)
)

(script static void ins_court
    (if b_debug 
        (print "*** insertion point: courtyard ***"))
    (set s_insertion_index s_court_ins_idx)
    (wake f_objects_manage)
    (if 
        (or
            (and
                b_cinematics
                (not b_editor)
            )
            (= b_editor_cinematics true)
        ) 
            (begin
                (switch_zone_set "zoneset_intro_cinematic")
                (cinematic_enter "020la_sword" true)
                (f_cin_intro_prep)
                (f_start_mission "020la_sword")
                (object_destroy "sc_cin_terrain_blocker")
                (ai_erase "sq_intro_cov_1")
                (ai_erase "sq_intro_cov_2")
            )
    )
    (switch_zone_set "zoneset_courtyard")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (s_zoneset_courtyard_valley) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_courtyard) 1)
    (if b_debug 
        (print "::: insertion: finished loading (s_zoneset_courtyard_valley)"))
    (sleep 1)
    (soft_ceiling_enable "soft_ceiling_interior" false)
    (wake f_corvette_exterior)
    (f_kat_spawn "sq_kat/court_ins" "obj_court_hum")
    (tick)
    (wake f_kat_nanny)
    (object_teleport_to_ai_point (player0) "ps_courtyard_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_courtyard_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_courtyard_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_courtyard_spawn/player3")
    (set b_mission_started true)
    (set b_landed true)
)

(script static void iva
    (ins_valley)
)

(script static void ins_valley
    (if b_debug 
        (print "*** insertion point: valley ***"))
    (insertion_snap_to_black)
    (wake f_insertion_fade_in)
    (set b_valley_ins true)
    (set s_insertion_index s_valley_ins_idx)
    (f_court_cleanup)
    (switch_zone_set "zoneset_courtyard_valley")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (zoneset_courtyard_valley) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_courtyard_valley) 1)
    (if b_debug 
        (print "::: insertion: finished loading (zoneset_courtyard_valley)"))
    (sleep 1)
    (set b_court_defended true)
    (wake f_gatehouse_door_control)
    (wake f_train_targetlaser)
    (wake f_corvette_exterior)
    (wake f_objects_manage)
    (f_objects_court_init_create)
    (sleep 1)
    (if (not (game_is_cooperative)) 
        (ai_place "sq_valley_marines_ins_1"))
    (flock_create "flock_exterior_banshee_01")
    (flock_create "flock_exterior_banshee_02")
    (flock_create "flock_exterior_falcon_01")
    (flock_create "flock_exterior_falcon_02")
    (flock_create "flock_exterior_phantom_01")
    (f_kat_spawn "sq_kat/valley_ins" "obj_valley_hum")
    (tick)
    (wake f_kat_nanny)
    (object_teleport_to_ai_point (player0) "ps_valley_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_valley_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_valley_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_valley_spawn/player3")
)

(script static void ifa
    (ins_faragate)
)

(script static void ins_faragate
    (if b_debug 
        (print "*** insertion point: faragate ***"))
    (insertion_snap_to_black)
    (wake f_insertion_fade_in)
    (set s_insertion_index s_valley_ins_idx)
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_air_cleanup)
    (f_air_far_cleanup)
    (switch_zone_set "zoneset_exterior")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (zoneset_exterior) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_exterior) 1)
    (if b_debug 
        (print "::: insertion: finished loading (zoneset_exterior)"))
    (sleep 1)
    (device_set_position_immediate "dm_valley_door_large" 0.0)
    (device_set_position_immediate "dm_valley_door_small" 0.0)
    (f_md_exterior_increment)
    (wake f_corvette_exterior)
    (wake f_objects_manage)
    (set b_court_defended true)
    (set b_air_defended true)
    (set b_air_spawn_done true)
    (flock_create "flock_exterior_banshee_01")
    (flock_create "flock_exterior_banshee_02")
    (flock_create "flock_exterior_falcon_01")
    (flock_create "flock_exterior_falcon_02")
    (flock_create "flock_exterior_phantom_01")
    (f_kat_spawn "sq_kat/far_ins" "obj_far_hum")
    (tick)
    (wake f_kat_nanny)
    (object_teleport_to_ai_point (player0) "ps_far_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_far_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_far_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_far_spawn/player3")
    (ai_place "sq_far_warthog_ins")
    (ai_squad_enumerate_immigrants "sq_far_warthog_ins" true)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_far_warthog_ins/driver01") warthog_d (player0))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_far_warthog_ins/driver01") warthog_p o_kat)
    (f_vehicle_goto_set vehicle_far)
)

(script static void iai
    (ins_airview)
)

(script static void ins_airview
    (if b_debug 
        (print "*** insertion point: airview ***"))
    (insertion_snap_to_black)
    (wake f_insertion_fade_in)
    (set s_insertion_index s_valley_ins_idx)
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_far_cleanup)
    (f_air_far_cleanup)
    (switch_zone_set "zoneset_exterior")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (zoneset_exterior) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_exterior) 1)
    (if b_debug 
        (print "::: insertion: finished loading (zoneset_exterior)"))
    (sleep 1)
    (set b_court_defended true)
    (set b_far_defended true)
    (set b_far_spawn_done true)
    (flock_create "flock_exterior_banshee_01")
    (flock_create "flock_exterior_banshee_02")
    (flock_create "flock_exterior_falcon_01")
    (flock_create "flock_exterior_falcon_02")
    (flock_create "flock_exterior_phantom_01")
    (wake f_objects_manage)
    (device_set_position_immediate "dm_valley_door_large" 0.0)
    (device_set_position_immediate "dm_valley_door_small" 0.0)
    (f_md_exterior_increment)
    (wake f_corvette_exterior)
    (f_kat_spawn "sq_kat/air_ins" "obj_air_hum")
    (tick)
    (wake f_kat_nanny)
    (object_teleport_to_ai_point (player0) "ps_air_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_air_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_air_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_air_spawn/player3")
    (ai_place "sq_air_warthog_ins")
    (ai_squad_enumerate_immigrants "sq_air_warthog_ins" true)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_air_warthog_ins/driver01") warthog_d (player0))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_air_warthog_ins/driver01") warthog_g ai_kat)
    (f_vehicle_goto_set vehicle_air)
)

(script static void ire
    (ins_return)
)

(script static void ins_return
    (if b_debug 
        (print "*** insertion point: return ***"))
    (insertion_snap_to_black)
    (wake f_insertion_fade_in)
    (set s_insertion_index s_return_ins_idx)
    (set b_ins_return true)
    (set b_ins_return_objects true)
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_far_cleanup)
    (f_air_cleanup)
    (f_air_far_cleanup)
    (f_objects_court_init_destroy)
    (switch_zone_set "zoneset_exterior")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (zoneset_exterior) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_exterior) 1)
    (if b_debug 
        (print "::: insertion: finished loading (zoneset_exterior)"))
    (sleep 1)
    (set b_court_defended true)
    (set b_far_defended true)
    (set b_air_defended true)
    (set b_far_spawn_done true)
    (set b_air_spawn_done true)
    (f_air_cannon_place)
    (flock_create "flock_exterior_banshee_01")
    (flock_create "flock_exterior_banshee_02")
    (flock_create "flock_exterior_falcon_01")
    (flock_create "flock_exterior_falcon_02")
    (flock_create "flock_exterior_phantom_01")
    (wake f_corvette_exterior)
    (wake f_objects_manage)
    (device_set_position_immediate "dm_valley_door_large" 0.0)
    (device_set_position_immediate "dm_valley_door_small" 0.0)
    (f_kat_spawn "sq_kat/return_ins" "obj_return_hum")
    (tick)
    (wake f_kat_nanny)
    (object_teleport_to_ai_point (player0) "ps_return_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_return_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_return_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_return_spawn/player3")
    (ai_place "sq_return_warthog_ins")
    (if (>= (game_coop_player_count) 3) 
        (ai_place "sq_far_warthog/driver02"))
    (ai_squad_enumerate_immigrants "sq_return_warthog_ins" true)
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_return_warthog_ins/driver01") warthog_d (player0))
    (vehicle_load_magic (ai_vehicle_get_from_starting_location "sq_return_warthog_ins/driver01") warthog_p o_kat)
    (f_vehicle_goto_set vehicle_return)
)

(script static void iga
    (ins_garage)
)

(script static void ins_garage
    (if b_debug 
        (print "*** insertion point: garage ***"))
    (insertion_snap_to_black)
    (wake f_insertion_fade_in)
    (set s_insertion_index s_garage_ins_idx)
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_far_cleanup)
    (f_air_cleanup)
    (f_air_far_cleanup)
    (f_return_cleanup)
    (f_objects_court_init_destroy)
    (switch_zone_set "zoneset_courtyard_valley_return")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (zoneset_courtyard_valley_return) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_courtyard_valley_re) 1)
    (if b_debug 
        (print "::: insertion: finished loading (zoneset_courtyard_valley_return)"))
    (sleep 1)
    (set b_court_defended true)
    (set b_far_defended true)
    (set b_air_defended true)
    (set b_garage_ready true)
    (flock_create "flock_exterior_banshee_01")
    (flock_create "flock_exterior_banshee_02")
    (flock_create "flock_exterior_falcon_01")
    (flock_create "flock_exterior_falcon_02")
    (flock_create "flock_exterior_phantom_01")
    (wake f_corvette_exterior)
    (ai_place "sq_garage_marine_ins")
    (wake f_objects_manage)
    (f_kat_spawn "sq_kat/garage_ins" "obj_garage_hum")
    (tick)
    (wake f_kat_nanny)
    (f_zoneset_direction direction_inward)
    (object_teleport_to_ai_point (player0) "ps_garage_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_garage_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_garage_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_garage_spawn/player3")
)

(script static void isw
    (ins_sword)
)

(script static void ins_sword
    (if b_debug 
        (print "*** insertion point: swordbase ***"))
    (insertion_snap_to_black)
    (wake f_insertion_fade_in)
    (set s_insertion_index s_sword_ins_idx)
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_far_cleanup)
    (f_air_cleanup)
    (f_air_far_cleanup)
    (f_return_cleanup)
    (f_garage_cleanup)
    (switch_zone_set "zoneset_interior")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (zoneset_interior) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_interior) 1)
    (if b_debug 
        (print "::: insertion: finished loading (zoneset_interior)"))
    (sleep 1)
    (set b_court_defended true)
    (set b_air_defended true)
    (set b_far_defended true)
    (set b_sword_ready true)
    (flock_create "flock_interior_phantom_01")
    (flock_create "flock_interior_banshee_01")
    (flock_create "flock_interior_falcon_01")
    (wake f_corvette_exterior)
    (soft_ceiling_enable "default" false)
    (wake f_objects_manage)
    (device_set_position_immediate "dm_garage_elevator" 1.0)
    (f_kat_spawn "sq_kat/sword_ins" "obj_sword_hum")
    (tick)
    (wake f_kat_nanny)
    (object_teleport_to_ai_point (player0) "ps_sword_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_sword_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_sword_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_sword_spawn/player3")
)

(script static void iro
    (ins_roof)
)

(script static void ins_roof
    (if b_debug 
        (print "*** insertion point: roof ***"))
    (insertion_snap_to_black)
    (wake f_insertion_fade_in)
    (f_court_cleanup)
    (f_valley_cleanup)
    (f_far_cleanup)
    (f_air_cleanup)
    (f_air_far_cleanup)
    (f_return_cleanup)
    (f_garage_cleanup)
    (f_sword_cleanup)
    (switch_zone_set "zoneset_interior")
    (sleep 1)
    (if b_debug 
        (print "::: insertion: waiting for (zoneset_interior) to fully load..."))
    (sleep_until (= (current_zone_set_fully_active) s_zoneset_interior) 1)
    (if b_debug 
        (print "::: insertion: finished loading (zoneset_interior)"))
    (sleep 1)
    (set b_court_defended true)
    (set b_air_defended true)
    (set b_far_defended true)
    (soft_ceiling_enable "default" false)
    (soft_ceiling_enable "camera_blocker_07" false)
    (soft_ceiling_enable "camera_blocker_08" false)
    (soft_ceiling_enable "camera_blocker_09" false)
    (wake f_objects_manage)
    (f_jorge_spawn "sq_jorge/roof" "obj_roof_hum")
    (object_teleport_to_ai_point (player0) "ps_roof_spawn/player0")
    (object_teleport_to_ai_point (player1) "ps_roof_spawn/player1")
    (object_teleport_to_ai_point (player2) "ps_roof_spawn/player2")
    (object_teleport_to_ai_point (player3) "ps_roof_spawn/player3")
)

(script static void th_court_elbow_look
    (performance_play_line "turn_1")
    (performance_play_line "turn_2")
    (performance_play_line "turn_3")
    (performance_play_line "point_1")
    (performance_play_line "point_2")
    (performance_play_line "point_3")
)

(script static void th_sword_spartan_intro
    (performance_play_line "emile_move_01")
    (performance_play_line "jun_move_01")
    (performance_play_line "emile_idle")
    (performance_play_line "jun_idle")
)

(script static void th_sword_jorge_intro
    (performance_play_line "move_01")
)

(script static void 020la_sword_010_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "falcon_2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "emile_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 11 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 12 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 13 "falcon_2_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 14 "falcon_2_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 15 "falcon_2_falcon_side_gun_right3_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.5 0.0)
    (cinematic_scripting_start_music 0 0 0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 1) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 1) "blur" 1.0 0.0)
    (cinematic_print "custom script play")
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 0) "blur" 1.0 0.0)
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon_2") 0 true)
    )
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 1) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 0) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 0) "thrust" 1.0 0.0)
    (cinematic_sleep 609)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_010_sc
    (cinematic_print "beginning scene 1")
    (cinematic_scripting_create_scene 0)
    (020la_sword_010_sc_sh1)
    (cinematic_scripting_destroy_scene 0)
)

(script static void 020la_sword_011_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "jorge_1" true)
    (object_hide (cinematic_scripting_get_object 1 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 3 "fx_light_marker_jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 4 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.0 0.0)
    (cinematic_scripting_start_music 1 0 0)
    (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 1 0) "blur" 1.0 0.0)
    (cinematic_print "custom script play")
    (cinematic_sleep 63)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020la_sword_011_sc_sh2
    (object_create "sc_cin_terrain_blocker")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1) 1 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1) 1)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 "falcon_1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 "jorge_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 "jorge_turret_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 3 "fx_light_marker_jorge_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 4 "falcon_1_falcon_chin_gun1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 5 "falcon_1_falcon_side_gun_left2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 6 "falcon_1_falcon_side_gun_right3_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 1 0) "blur" 1.0 0.0)
    (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
    (cinematic_print "custom script play")
    (cinematic_sleep 76)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_011_sc
    (cinematic_print "beginning scene 2")
    (cinematic_scripting_create_scene 1)
    (object_destroy (cinematic_object_get "kat"))
    (020la_sword_011_sc_sh1)
    (020la_sword_011_sc_sh2)
    (cinematic_scripting_destroy_scene 1)
)

(script static void 020la_sword_013_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 2 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 3 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 4 "jorge_turret_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 "player_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 6 "kat_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 7 "kat_pistol_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 8 "data_module_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 9 "tac_pad_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 10 "fx__light_marker_falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 11 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 12 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 13 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 2 3) "engine_rpm" 1.0 0.0)
    (object_set_permutation (cinematic_object_get "falcon_1") "props" "blur")
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 2 3) "thrust" 1.0 0.0)
    (cinematic_print "custom script play")
    (cinematic_sleep 89)
    (object_destroy (cinematic_object_get "kat"))
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_013_sc
    (cinematic_print "beginning scene 3")
    (cinematic_scripting_create_scene 2)
    (020la_sword_013_sc_sh1)
    (cinematic_scripting_destroy_scene 2)
)

(script static void 020la_sword_014_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 "emile_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 2 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 3 "falcon_2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 4 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 "jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 6 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 7 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 8 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 9 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 10 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 11 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 12 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 13 "falcon_2_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 14 "falcon_2_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 15 "falcon_2_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 16 "fx_dyn_light_sword_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 3 2) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 3 3) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 3 3) "blur" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 3 2) "blur" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 3 2) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 3 3) "thrust" 1.0 0.0)
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon_2") 0 true)
    )
    (cinematic_print "custom script play")
    (cinematic_sleep 20)
    (cinematic_print "custom script play")
    (cinematic_set_title "020la_cine_timestamp_01")
    (cinematic_sleep 135)
    (cinematic_set_title "020la_cine_timestamp_02")
    (cinematic_print "custom script play")
    (cinematic_sleep 87)
    (cinematic_scripting_start_dialogue 3 0 0 none)
    (cinematic_sleep 140)
    (object_destroy "sc_cin_terrain_blocker")
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_014_sc
    (cinematic_print "beginning scene 4")
    (cinematic_scripting_create_scene 3)
    (020la_sword_014_sc_sh1)
    (cinematic_scripting_destroy_scene 3)
)

(script static void 020la_sword_015_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 1 "emile_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 2 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 3 "falcon_2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 4 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 5 "jorge_turret_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 6 "jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 7 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 8 "kat_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 9 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 10 "player_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 11 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 12 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 13 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 14 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 15 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 16 "falcon_2_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 17 "falcon_2_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 18 "falcon_2_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 19 "cov_corvette_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.6 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 4 2) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 4 3) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 4 2) "blur" 1.0 0.0)
    (cinematic_print "custom script play")
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon_2") 0 true)
    )
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 4 3) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 4 2) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 4 3) "blur" 1.0 0.0)
    (cinematic_sleep 7)
    (cinematic_scripting_start_dialogue 4 0 0 none)
    (cinematic_sleep 35)
    (cinematic_scripting_start_dialogue 4 0 1 none)
    (cinematic_sleep 34)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_015_sc
    (cinematic_print "beginning scene 5")
    (cinematic_scripting_create_scene 4)
    (020la_sword_015_sc_sh1)
    (cinematic_scripting_destroy_scene 4)
)

(script static void 020la_sword_016_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 0 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 1 "cov_corvette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 2 "fx_light_marker_corvette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 3 "fx_light_marker_falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 4 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 5 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 6 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 7 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.6 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 5 0) "blur" 1.0 0.0)
    (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
    (cinematic_print "custom script play")
    (cinematic_sleep 22)
    (cinematic_scripting_start_dialogue 5 0 0 none)
    (cinematic_sleep 68)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_016_sc
    (cinematic_print "beginning scene 6")
    (cinematic_scripting_create_scene 5)
    (020la_sword_016_sc_sh1)
    (cinematic_scripting_destroy_scene 5)
)

(script static void 020la_sword_017_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 6) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 6) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 0 "emile_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 1 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 2 "falcon_2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 3 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 4 "jorge_turret_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 5 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 6 "kat_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 7 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 8 "player_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 9 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 10 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 11 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 12 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 13 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 14 "falcon_2_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 15 "falcon_2_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 16 "falcon_2_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 6 0 17 "logo_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 6 1) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 6 1) "blur" 1.0 0.0)
    (cinematic_scripting_start_screen_effect 6 0 0)
    (cinematic_print "custom script play")
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon_2") 0 true)
    )
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 6 17) "location" 0.2 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 6 1) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 6 2) "blur" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 6 17) "camera" 1.0 0.0)
    (cinematic_sleep 79)
    (cinematic_scripting_stop_screen_effect 6 0 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_017_sc
    (cinematic_print "beginning scene 7")
    (cinematic_scripting_create_scene 6)
    (020la_sword_017_sc_sh1)
    (cinematic_scripting_destroy_scene 6)
)

(script static void 020la_sword_018_sc_sh1
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 7) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 0 "falcon_1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 1 "falcon_2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 2 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 3 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 4 "falcon_1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 5 "falcon_1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 6 "falcon_1_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 7 "falcon_2_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 8 "falcon_2_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 0 9 "falcon_2_falcon_side_gun_right3_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 0) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 1) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 1) "blur" 1.0 0.0)
    (cinematic_print "custom script play")
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 0) "blur" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 0) "thrust" 1.0 0.0)
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon_2") 0 true)
    )
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 1) "thrust" 1.0 0.0)
    (cinematic_sleep 8)
    (cinematic_scripting_start_dialogue 7 0 0 none)
    (cinematic_sleep 231)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020la_sword_018_sc_sh2
    (begin
        (object_create "sc_cin_terrain_blocker")
        (object_destroy "dm_corvette_exterior")
    )
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 7) 1 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 7) 1)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 0 "falcon_1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 1 "falcon_2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 2 "fx_light_marker_falcon1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 3 "fx_light_marker_falcon2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 4 "falcon_1_falcon_chin_gun1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 5 "falcon_1_falcon_side_gun_left2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 6 "falcon_1_falcon_side_gun_right3_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 7 "falcon_2_falcon_chin_gun1_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 8 "falcon_2_falcon_side_gun_left2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 7 1 9 "falcon_2_falcon_side_gun_right3_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 1.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 0) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 0) "thrust" 1.0 0.0)
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon_1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon_2") 0 true)
    )
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 1) "blur" 1.0 0.0)
    (cinematic_print "custom script play")
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 0) "blur" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 1) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 7 1) "thrust" 1.0 0.0)
    (cinematic_sleep 72)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_018_sc
    (cinematic_print "beginning scene 8")
    (cinematic_scripting_create_scene 7)
    (020la_sword_018_sc_sh1)
    (020la_sword_018_sc_sh2)
    (cinematic_scripting_destroy_scene 7)
)

(script static void 020la_sword_020_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8) 0 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 0 "auntie_dot_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 1 "m20_dot_briefing_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 2 "m20_dot_briefing_02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 3 "m20_dot_briefing_03_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 4 "dot_led_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 5 "dot_led_02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 6 "falcon_card_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 7 "falcon_card_02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 0 8 "dot_led_sword_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "bg_dim" 0.7 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "camera" 0.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "location" 0.4 0.0)
    (cinematic_sleep 10)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 30.0)
    (cinematic_sleep 34)
    (cinematic_scripting_start_dialogue 8 0 0 none)
    (cinematic_sleep 20)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 30.0)
    (cinematic_sleep 69)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 30.0)
    (cinematic_sleep 57)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020la_sword_020_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8) 1 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8) 1)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 0 "auntie_dot_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 1 "m20_dot_briefing_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 2 "m20_dot_briefing_02_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 3 "m20_dot_briefing_03_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 4 "dot_led_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 5 "dot_led_02_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 6 "falcon_card_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 7 "falcon_card_02_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 1 8 "dot_led_sword_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "camera" 0.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "location" 0.4 0.0)
    (cinematic_sleep 22)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 2.0)
    (cinematic_sleep 14)
    (cinematic_print "custom script play")
    (fade_in 1.0 1.0 1.0 6)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "bg_dim" 0.8 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "camera" 0.5 0.0)
    (cinematic_sleep 43)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 4) "led_outer" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 4) "led_outer" 0.0 30.0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020la_sword_020_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 8) 2 "020la_sword_010_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 8) 2)
    (cinematic_object_create_cinematic_anchor "020la_sword_010_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 0 "auntie_dot_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 1 "m20_dot_briefing_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 2 "m20_dot_briefing_02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 3 "m20_dot_briefing_03_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 4 "dot_led_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 5 "dot_led_02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 6 "falcon_card_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 7 "falcon_card_02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 8 2 8 "dot_led_sword_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "camera" 0.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "location" 0.4 0.0)
    (cinematic_sleep 3)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 5) "led_outer" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 5) "led_outer" 0.0 30.0)
    (cinematic_sleep 46)
    (fade_in 0.0 0.0 0.0 5)
    (cinematic_print "custom script play")
    (cinematic_sleep 18)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 8.0)
    (cinematic_sleep 3)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 0.0 8.0)
    (cinematic_sleep 4)
    (fade_in 0.0 0.0 0.0 5)
    (cinematic_print "custom script play")
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 8.0)
    (cinematic_sleep 3)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 0.0 8.0)
    (cinematic_sleep 3)
    (cinematic_print "custom script play")
    (fade_in 0.0 0.0 0.0 5)
    (cinematic_sleep 2)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 0) "location" 0.2 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 8.0)
    (cinematic_sleep 3)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 0.0 8.0)
    (cinematic_sleep 5)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 8.0)
    (cinematic_sleep 3)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 0.0 8.0)
    (cinematic_sleep 5)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 112.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 8.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 113.0 8.0)
    (cinematic_sleep 9)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_fill" 0.0 8.0)
    (cinematic_sleep 3)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 1.0 0.0)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 8 8) "led_outer" 0.0 8.0)
    (cinematic_sleep 25)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_020_sc
    (cinematic_print "beginning scene 9")
    (cinematic_scripting_create_scene 8)
    (020la_sword_020_sc_sh1)
    (020la_sword_020_sc_sh2)
    (020la_sword_020_sc_sh3)
    (cinematic_scripting_destroy_scene 8)
)

(script static void 020la_sword_030_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 9) 0 "020la_sword_030_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 9) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_030_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 0 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 1 "kat_1" true)
    (object_hide (cinematic_scripting_get_object 9 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 3 "falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 4 "falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 5 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 6 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 7 "falcon1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 8 "falcon1_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 9 "falcon1_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 10 "falcon_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 11 "falcon_falcon_side_gun_left2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 12 "falcon_falcon_side_gun_right3_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 13 "fx_dyn_light_crest_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 9 0 14 "logo_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.2 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 4) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 3) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 3) "blur" 1.0 0.0)
    (sound_looping_activate_layer "levels\solo\m20\music\m20_music01" 1)
    (cinematic_print "custom script play")
    (cinematic_print "custom script play")
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon") 0 true)
    )
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 4) "blur" 1.0 0.0)
    (cinematic_scripting_start_screen_effect 9 0 0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 14) "location" 0.2 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 4) "thrust" 0.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 3) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 9 14) "camera" 1.0 0.0)
    (cinematic_sleep 21)
    (cinematic_scripting_start_dialogue 9 0 0 none)
    (cinematic_sleep 101)
    (cinematic_scripting_stop_screen_effect 9 0 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_030_sc
    (cinematic_print "beginning scene 10")
    (cinematic_scripting_create_scene 9)
    (020la_sword_030_sc_sh1)
    (cinematic_scripting_destroy_scene 9)
)

(script static void 020la_sword_032_sc_sh1
    (object_destroy "dm_corvette_exterior")
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 10) 0 "020la_sword_030_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 10) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_030_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 0 "falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 1 "fx_light_marker_falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 2 "cov_corvette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 3 "falcon_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 4 "falcon_falcon_side_gun_left1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 10 0 5 "falcon_falcon_side_gun_right1_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 10 0) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 10 0) "blur" 1.0 0.0)
    (cinematic_print "custom script play")
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 10 0) "thrust" 0.5 0.0)
    (object_set_model_state_property (cinematic_object_get "falcon") 0 true)
    (cinematic_sleep 67)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_032_sc
    (cinematic_print "beginning scene 11")
    (cinematic_scripting_create_scene 10)
    (020la_sword_032_sc_sh1)
    (cinematic_scripting_destroy_scene 10)
)

(script static void 020la_sword_034_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 11) 0 "020la_sword_030_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 11) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_030_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 0 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 1 "emile_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 2 "falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 3 "falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 4 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 5 "jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 6 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 7 "kat_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 8 "magnum_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 9 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 10 "player_assaultrifle_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 11 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 12 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 13 "falcon1_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 14 "falcon1_falcon_side_gun_left1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 15 "falcon1_falcon_side_gun_right1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 16 "falcon_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 17 "falcon_falcon_side_gun_left1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 18 "falcon_falcon_side_gun_right1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 11 0 19 "logo_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 2) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 3) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 3) "blur" 1.0 0.0)
    (cinematic_print "custom script play")
    (begin
        (object_set_model_state_property (cinematic_object_get "falcon1") 0 true)
        (object_set_model_state_property (cinematic_object_get "falcon") 0 true)
    )
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 2) "blur" 1.0 0.0)
    (cinematic_scripting_start_screen_effect 11 0 0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 19) "location" 0.2 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 3) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 2) "thrust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 11 19) "camera" 0.25 0.0)
    (cinematic_sleep 77)
    (cinematic_scripting_start_dialogue 11 0 0 none)
    (cinematic_sleep 16)
    (cinematic_scripting_stop_screen_effect 11 0 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_034_sc
    (cinematic_print "beginning scene 12")
    (cinematic_scripting_create_scene 11)
    (020la_sword_034_sc_sh1)
    (cinematic_scripting_destroy_scene 11)
)

(script static void 020la_sword_036_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 12) 0 "020la_sword_030_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 12) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_030_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 0 "falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 1 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 2 "kat_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 3 "magnum_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 4 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 5 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 6 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 7 "player_dmr_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 8 "falcon_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 9 "falcon_falcon_side_gun_left1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 12 0 10 "falcon_falcon_side_gun_right1_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 12 0) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 12 0) "thrust" 1.0 0.0)
    (cinematic_print "custom script play")
    (object_set_model_state_property (cinematic_object_get "falcon") 0 true)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 12 0) "blur" 1.0 0.0)
    (cinematic_sleep 32)
    (cinematic_scripting_start_dialogue 12 0 0 none)
    (cinematic_sleep 45)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_036_sc
    (cinematic_print "beginning scene 13")
    (cinematic_scripting_create_scene 12)
    (020la_sword_036_sc_sh1)
    (cinematic_scripting_destroy_scene 12)
)

(script static void 020la_sword_037_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 13) 0 "020la_sword_030_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 13) 0)
    (cinematic_object_create_cinematic_anchor "020la_sword_030_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 0 "falcon_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 1 "falcon_falcon_chin_gun1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 2 "falcon_falcon_side_gun_left1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 3 "falcon_falcon_side_gun_right1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 4 "fx_light_marker_falcon1_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 5 "fx_light_marker_falcon2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 6 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 7 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 8 "kat_ar_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 9 "magnum_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 10 "player_fp_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 13 0 11 "player_dmr_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 13 11) "primary_ammunition_tens" 0.1 0.0)
    (cinematic_print "custom script play")
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 13 11) "primary_ammunition_ones" 0.5 0.0)
    (cinematic_print "custom script play")
    (cinematic_show_letterbox_immediate false)
    (object_set_model_state_property (cinematic_object_get "falcon") 0 true)
    (cinematic_sleep 1)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 13 0) "engine_exhaust" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 13 0) "blur" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 13 0) "engine_rpm" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 13 0) "thrust" 1.0 0.0)
    (cinematic_sleep 19)
    (cinematic_scripting_start_dialogue 13 0 0 (cinematic_scripting_get_object 13 7))
    (cinematic_sleep 270)
    (sleep (cinematic_tag_fade_out_from_cinematic "020la_sword"))
    (cinematic_sleep 4)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020la_sword_037_sc
    (cinematic_print "beginning scene 14")
    (cinematic_scripting_create_scene 13)
    (020la_sword_037_sc_sh1)
    (cinematic_scripting_destroy_scene 13)
)

(script static void 020la_sword_cleanup
    (cinematic_scripting_clean_up 0)
)

(script static void begin_020la_sword_debug
    (cinematic_zone_activate_for_debugging 0)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 0)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
)

(script static void end_020la_sword_debug
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 0)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void 020la_sword_debug
    (begin_020la_sword_debug)
    (sleep (cinematic_tag_fade_in_to_cinematic "020la_sword"))
    (!020la_sword_010_sc)
    (!020la_sword_011_sc)
    (!020la_sword_013_sc)
    (!020la_sword_014_sc)
    (!020la_sword_015_sc)
    (!020la_sword_016_sc)
    (!020la_sword_017_sc)
    (!020la_sword_018_sc)
    (!020la_sword_020_sc)
    (!020la_sword_030_sc)
    (!020la_sword_032_sc)
    (!020la_sword_034_sc)
    (!020la_sword_036_sc)
    (!020la_sword_037_sc)
    (end_020la_sword_debug)
)

(script static void begin_020la_sword
    (cinematic_zone_activate 0)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 0))
)

(script static void end_020la_sword
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020la_sword
    (begin_020la_sword)
    (sleep (cinematic_tag_fade_in_to_cinematic "020la_sword"))
    (!020la_sword_010_sc)
    (!020la_sword_011_sc)
    (!020la_sword_013_sc)
    (!020la_sword_014_sc)
    (!020la_sword_015_sc)
    (!020la_sword_016_sc)
    (!020la_sword_017_sc)
    (!020la_sword_018_sc)
    (!020la_sword_020_sc)
    (!020la_sword_030_sc)
    (!020la_sword_032_sc)
    (!020la_sword_034_sc)
    (!020la_sword_036_sc)
    (!020la_sword_037_sc)
    (end_020la_sword)
)

(script static void 020lb_halsey_010_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0) 0 "020lb_halsey_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0) 0)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 0 "corvette_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 1 "emile_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 2 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 3 "longsword_01_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 4 "longsword_02_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 5 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 6 "player_dmr_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 7 "emile_rocketlauncher_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 8 "fx_dyn_light_edge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 9 "fx_mac_cannon_round_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 10 "fx_bro_bro_your_boat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 0 11 "fx_dyn_light_another_edge_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure -0.2 0.0)
    (cinematic_scripting_start_music 0 0 0)
    (cinematic_scripting_start_music 0 0 1)
    (cinematic_sleep 623)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_010_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0) 1 "020lb_halsey_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0) 1)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 0 "corvette_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 1 "emile_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 2 "jorge_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 3 "longsword_01_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 4 "longsword_02_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 5 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 6 "player_dmr_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 7 "emile_rocketlauncher_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 8 "fx_dyn_light_edge_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 9 "fx_mac_cannon_round_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 10 "fx_bro_bro_your_boat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 1 11 "fx_dyn_light_another_edge_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure -0.2 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 0) "damaged" 0.0 0.0)
    (object_set_permutation (cinematic_object_get "corvette") "decals" "")
    (cinematic_print "custom script play")
    (cinematic_sleep 23)
    (cinematic_scripting_start_effect 0 1 0 (cinematic_object_get "fx_mac_cannon_round"))
    (cinematic_sleep 4)
    (cinematic_scripting_start_effect 0 1 1 (cinematic_object_get "corvette"))
    (cinematic_sleep 3)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 0 0) "damaged" 1.0 0.0)
    (object_set_permutation (cinematic_object_get "corvette") "decals" "default")
    (cinematic_print "custom script play")
    (cinematic_sleep 4)
    (cinematic_scripting_stop_music 0 1 0)
    (cinematic_sleep 3)
    (cinematic_scripting_start_effect 0 1 2 (cinematic_object_get "fx_mac_cannon_round"))
    (cinematic_sleep 47)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_010_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0) 2 "020lb_halsey_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0) 2)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 0 "corvette_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 1 "emile_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 2 "jorge_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 3 "longsword_01_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 4 "longsword_02_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 5 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 6 "player_dmr_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 7 "emile_rocketlauncher_3" true)
    (object_hide (cinematic_scripting_get_object 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 9 "fx_mac_cannon_round_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 10 "fx_bro_bro_your_boat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 2 11 "fx_dyn_light_another_edge_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure -0.2 0.0)
    (cinematic_scripting_start_effect 0 2 0 (cinematic_object_get "fx_bro_bro_your_boat"))
    (object_set_permutation (cinematic_object_get "corvette") "decals" "default")
    (cinematic_print "custom script play")
    (cinematic_sleep 70)
    (cinematic_scripting_start_dialogue 0 2 0 none)
    (cinematic_sleep 59)
    (cinematic_scripting_start_dialogue 0 2 1 none)
    (cinematic_sleep 30)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_010_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0) 3 "020lb_halsey_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0) 3)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 0 "corvette_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 1 "emile_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 2 "jorge_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 3 "longsword_01_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 4 "longsword_02_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 5 "player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 6 "player_dmr_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 7 "emile_rocketlauncher_4" true)
    (object_hide (cinematic_scripting_get_object 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 9 "fx_mac_cannon_round_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 10 "fx_bro_bro_your_boat_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 3 11 "fx_dyn_light_another_edge_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure -0.2 0.0)
    (cinematic_scripting_start_effect 0 3 0 (cinematic_object_get "fx_bro_bro_your_boat"))
    (cinematic_scripting_start_effect 0 3 1 (cinematic_object_get "corvette"))
    (cinematic_sleep 6)
    (cinematic_scripting_start_effect 0 3 2 (cinematic_object_get "fx_bro_bro_your_boat"))
    (cinematic_sleep 35)
    (cinematic_scripting_start_dialogue 0 3 0 none)
    (cinematic_sleep 41)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_010_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0) 4 "020lb_halsey_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0) 4)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 0 "corvette_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 1 "emile_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 2 "jorge_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 3 "longsword_01_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 4 "longsword_02_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 5 "player_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 6 "player_dmr_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 7 "emile_rocketlauncher_5" true)
    (object_hide (cinematic_scripting_get_object 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 9 "fx_mac_cannon_round_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 10 "fx_bro_bro_your_boat_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 4 11 "fx_dyn_light_another_edge_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure -0.2 0.0)
    (cinematic_sleep 3)
    (cinematic_scripting_start_dialogue 0 4 0 none)
    (cinematic_sleep 48)
    (cinematic_scripting_start_dialogue 0 4 1 none)
    (cinematic_sleep 205)
    (cinematic_scripting_start_dialogue 0 4 2 none)
    (cinematic_sleep 97)
    (cinematic_scripting_start_dialogue 0 4 3 none)
    (cinematic_sleep 35)
    (cinematic_scripting_start_dialogue 0 4 4 none)
    (cinematic_sleep 62)
    (cinematic_scripting_start_dialogue 0 4 5 none)
    (cinematic_sleep 9)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_010_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 0) 5 "020lb_halsey_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 0) 5)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 0 "corvette_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 1 "emile_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 2 "jorge_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 3 "longsword_01_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 4 "longsword_02_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 5 "player_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 6 "player_dmr_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 7 "emile_rocketlauncher_6" true)
    (object_hide (cinematic_scripting_get_object 0 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 9 "fx_mac_cannon_round_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 10 "fx_bro_bro_your_boat_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 0 5 11 "fx_dyn_light_another_edge_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (cinematic_scripting_start_effect 0 5 0 (cinematic_object_get "fx_bro_bro_your_boat"))
    (cinematic_sleep 52)
    (cinematic_scripting_start_effect 0 5 1 (cinematic_object_get "fx_bro_bro_your_boat"))
    (cinematic_sleep 165)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020lb_halsey_010_sc
    (cinematic_print "beginning scene 1")
    (cinematic_scripting_create_scene 0)
    (begin
        (object_destroy_folder "cr_interior")
        (object_destroy "dm_corvette_exterior")
        (object_destroy "dm_corvette_sword")
    )
    (020lb_halsey_010_sc_sh1)
    (020lb_halsey_010_sc_sh2)
    (020lb_halsey_010_sc_sh3)
    (020lb_halsey_010_sc_sh4)
    (020lb_halsey_010_sc_sh5)
    (020lb_halsey_010_sc_sh6)
    (cinematic_scripting_destroy_scene 0)
)

(script static void 020lb_halsey_020_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1) 0 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1) 0)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 0 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 1 "carter_head_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 2 "data_chip_1" true)
    (object_hide (cinematic_scripting_get_object 1 3) true)
    (object_hide (cinematic_scripting_get_object 1 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 5 "halsey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 6 "jorge_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 7 "jorge_head_1" true)
    (object_hide (cinematic_scripting_get_object 1 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 9 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 10 "kat_head_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 11 "kat_pistol_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 12 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 13 "player_dmr_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 14 "halsey_airlock_drawer_1" true)
    (object_hide (cinematic_scripting_get_object 1 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 16 "fx_dyn_light_halsey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 17 "fx_dyn_light_carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 18 "fx_dyn_light_kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 19 "fx_dyn_light_jor_pla_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 20 "fx_dyn_light_emi_jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 21 "fx_dyn_light_enter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 22 "fx_dyn_light_blue_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 0 23 "fx_dyn_light_red_1" true)
    (object_hide (cinematic_scripting_get_object 1 24) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (cinematic_sleep 136)
    (cinematic_scripting_start_dialogue 1 0 0 (cinematic_scripting_get_object 1 5))
    (cinematic_sleep 321)
    (cinematic_scripting_start_dialogue 1 0 1 (cinematic_scripting_get_object 1 5))
    (cinematic_sleep 11)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_020_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1) 1 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1) 1)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 0 "carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 1 "carter_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 2 "data_chip_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 3 "emile_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 4 "emile_shotgun_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 5 "halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 6 "jorge_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 7 "jorge_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 8 "jun_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 9 "kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 10 "kat_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 11 "kat_pistol_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 12 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 13 "player_dmr_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 14 "halsey_airlock_drawer_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 15 "jun_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 16 "fx_dyn_light_halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 17 "fx_dyn_light_carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 18 "fx_dyn_light_kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 19 "fx_dyn_light_jor_pla_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 20 "fx_dyn_light_emi_jun_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 21 "fx_dyn_light_enter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 22 "fx_dyn_light_blue_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 23 "fx_dyn_light_red_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 1 24 "logo_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 3.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 1 24) "camera" 0.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 1 24) "logo" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 1 24) "location" 0.9 0.0)
    (cinematic_scripting_start_screen_effect 1 1 0)
    (cinematic_sleep 63)
    (cinematic_scripting_stop_screen_effect 1 1 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_020_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1) 2 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1) 2)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 1 0) true)
    (object_hide (cinematic_scripting_get_object 1 1) true)
    (object_hide (cinematic_scripting_get_object 1 2) true)
    (object_hide (cinematic_scripting_get_object 1 3) true)
    (object_hide (cinematic_scripting_get_object 1 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 5 "halsey_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 6 "jorge_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 7 "jorge_head_3" true)
    (object_hide (cinematic_scripting_get_object 1 8) true)
    (object_hide (cinematic_scripting_get_object 1 9) true)
    (object_hide (cinematic_scripting_get_object 1 10) true)
    (object_hide (cinematic_scripting_get_object 1 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 12 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 13 "player_dmr_3" true)
    (object_hide (cinematic_scripting_get_object 1 14) true)
    (object_hide (cinematic_scripting_get_object 1 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 16 "fx_dyn_light_halsey_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 17 "fx_dyn_light_carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 18 "fx_dyn_light_kat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 19 "fx_dyn_light_jor_pla_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 20 "fx_dyn_light_emi_jun_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 21 "fx_dyn_light_enter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 22 "fx_dyn_light_blue_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 2 23 "fx_dyn_light_red_3" true)
    (object_hide (cinematic_scripting_get_object 1 24) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 12)
    (cinematic_scripting_start_dialogue 1 2 0 (cinematic_scripting_get_object 1 7))
    (cinematic_sleep 30)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_020_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1) 3 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1) 3)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 0 "carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 1 "carter_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 2 "data_chip_4" true)
    (object_hide (cinematic_scripting_get_object 1 3) true)
    (object_hide (cinematic_scripting_get_object 1 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 5 "halsey_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 6 "jorge_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 7 "jorge_head_4" true)
    (object_hide (cinematic_scripting_get_object 1 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 9 "kat_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 10 "kat_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 11 "kat_pistol_4" true)
    (object_hide (cinematic_scripting_get_object 1 12) true)
    (object_hide (cinematic_scripting_get_object 1 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 14 "halsey_airlock_drawer_4" true)
    (object_hide (cinematic_scripting_get_object 1 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 16 "fx_dyn_light_halsey_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 17 "fx_dyn_light_carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 18 "fx_dyn_light_kat_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 19 "fx_dyn_light_jor_pla_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 20 "fx_dyn_light_emi_jun_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 21 "fx_dyn_light_enter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 22 "fx_dyn_light_blue_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 3 23 "fx_dyn_light_red_4" true)
    (object_hide (cinematic_scripting_get_object 1 24) true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (cinematic_sleep 2)
    (cinematic_scripting_start_dialogue 1 3 0 (cinematic_scripting_get_object 1 5))
    (cinematic_sleep 57)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_020_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 1) 4 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 1) 4)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 1 0) true)
    (object_hide (cinematic_scripting_get_object 1 1) true)
    (object_hide (cinematic_scripting_get_object 1 2) true)
    (object_hide (cinematic_scripting_get_object 1 3) true)
    (object_hide (cinematic_scripting_get_object 1 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 5 "halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 6 "jorge_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 7 "jorge_head_5" true)
    (object_hide (cinematic_scripting_get_object 1 8) true)
    (object_hide (cinematic_scripting_get_object 1 9) true)
    (object_hide (cinematic_scripting_get_object 1 10) true)
    (object_hide (cinematic_scripting_get_object 1 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 12 "player_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 13 "player_dmr_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 14 "halsey_airlock_drawer_5" true)
    (object_hide (cinematic_scripting_get_object 1 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 16 "fx_dyn_light_halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 17 "fx_dyn_light_carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 18 "fx_dyn_light_kat_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 19 "fx_dyn_light_jor_pla_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 20 "fx_dyn_light_emi_jun_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 21 "fx_dyn_light_enter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 22 "fx_dyn_light_blue_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 1 4 23 "fx_dyn_light_red_5" true)
    (object_hide (cinematic_scripting_get_object 1 24) true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 34)
    (cinematic_scripting_start_dialogue 1 4 0 (cinematic_scripting_get_object 1 7))
    (cinematic_sleep 84)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020lb_halsey_020_sc
    (cinematic_print "beginning scene 2")
    (cinematic_scripting_create_scene 1)
    (020lb_halsey_020_sc_sh1)
    (020lb_halsey_020_sc_sh2)
    (020lb_halsey_020_sc_sh3)
    (020lb_halsey_020_sc_sh4)
    (020lb_halsey_020_sc_sh5)
    (cinematic_scripting_destroy_scene 1)
)

(script static void 020lb_halsey_030_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 0 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 0)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 0 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 1 "carter_head_1" true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 5 "halsey_1" true)
    (object_hide (cinematic_scripting_get_object 2 6) true)
    (object_hide (cinematic_scripting_get_object 2 7) true)
    (object_hide (cinematic_scripting_get_object 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 9) true)
    (object_hide (cinematic_scripting_get_object 2 10) true)
    (object_hide (cinematic_scripting_get_object 2 11) true)
    (object_hide (cinematic_scripting_get_object 2 12) true)
    (object_hide (cinematic_scripting_get_object 2 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 14 "halsey_airlock_drawer_1" true)
    (object_hide (cinematic_scripting_get_object 2 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 16 "fx_dyn_light_carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 17 "fx_dyn_light_halsey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 18 "fx_dyn_light_emi_jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 19 "fx_dyn_light_jor_pla_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 0 20 "fx_dyn_light_kat_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 2)
    (cinematic_scripting_start_dialogue 2 0 0 (cinematic_scripting_get_object 2 5))
    (cinematic_sleep 60)
    (cinematic_scripting_start_dialogue 2 0 1 (cinematic_scripting_get_object 2 5))
    (cinematic_sleep 297)
    (cinematic_scripting_start_dialogue 2 0 2 (cinematic_scripting_get_object 2 1))
    (cinematic_sleep 132)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 1 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 1)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 0 "carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 1 "carter_head_2" true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 5 "halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 6 "jorge_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 7 "jorge_head_2" true)
    (object_hide (cinematic_scripting_get_object 2 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 9 "kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 10 "kat_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 11 "kat_pistol_2" true)
    (object_hide (cinematic_scripting_get_object 2 12) true)
    (object_hide (cinematic_scripting_get_object 2 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 14 "halsey_airlock_drawer_2" true)
    (object_hide (cinematic_scripting_get_object 2 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 16 "fx_dyn_light_carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 17 "fx_dyn_light_halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 18 "fx_dyn_light_emi_jun_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 19 "fx_dyn_light_jor_pla_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 1 20 "fx_dyn_light_kat_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 20)
    (cinematic_scripting_start_dialogue 2 1 0 (cinematic_scripting_get_object 2 5))
    (cinematic_sleep 30)
    (cinematic_scripting_start_dialogue 2 1 1 (cinematic_scripting_get_object 2 7))
    (cinematic_sleep 15)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 2 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 2)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 2 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 1 "carter_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 2 "data_chip_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 3 "emile_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 4 "emile_shotgun_3" true)
    (object_hide (cinematic_scripting_get_object 2 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 6 "jorge_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 7 "jorge_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 8 "jun_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 9 "kat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 10 "kat_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 11 "kat_pistol_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 12 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 13 "player_dmr_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 14 "halsey_airlock_drawer_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 15 "jun_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 16 "fx_dyn_light_carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 17 "fx_dyn_light_halsey_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 18 "fx_dyn_light_emi_jun_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 19 "fx_dyn_light_jor_pla_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 2 20 "fx_dyn_light_kat_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 0.5 0.0)
    (cinematic_sleep 116)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 3 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 3)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 0 "carter_4" true)
    (object_hide (cinematic_scripting_get_object 2 1) true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 3 "emile_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 4 "emile_shotgun_4" true)
    (object_hide (cinematic_scripting_get_object 2 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 6 "jorge_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 7 "jorge_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 8 "jun_4" true)
    (object_hide (cinematic_scripting_get_object 2 9) true)
    (object_hide (cinematic_scripting_get_object 2 10) true)
    (object_hide (cinematic_scripting_get_object 2 11) true)
    (object_hide (cinematic_scripting_get_object 2 12) true)
    (object_hide (cinematic_scripting_get_object 2 13) true)
    (object_hide (cinematic_scripting_get_object 2 14) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 15 "jun_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 16 "fx_dyn_light_carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 17 "fx_dyn_light_halsey_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 18 "fx_dyn_light_emi_jun_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 19 "fx_dyn_light_jor_pla_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 3 20 "fx_dyn_light_kat_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 58)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 4 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 4)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 2 0) true)
    (object_hide (cinematic_scripting_get_object 2 1) true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 5 "halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 6 "jorge_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 7 "jorge_head_5" true)
    (object_hide (cinematic_scripting_get_object 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 9) true)
    (object_hide (cinematic_scripting_get_object 2 10) true)
    (object_hide (cinematic_scripting_get_object 2 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 12 "player_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 13 "player_dmr_5" true)
    (object_hide (cinematic_scripting_get_object 2 14) true)
    (object_hide (cinematic_scripting_get_object 2 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 16 "fx_dyn_light_carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 17 "fx_dyn_light_halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 18 "fx_dyn_light_emi_jun_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 19 "fx_dyn_light_jor_pla_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 4 20 "fx_dyn_light_kat_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 9)
    (cinematic_scripting_start_dialogue 2 4 0 (cinematic_scripting_get_object 2 5))
    (cinematic_sleep 56)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 5 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 5)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 0 "carter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 1 "carter_head_6" true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 5 "halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 6 "jorge_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 7 "jorge_head_6" true)
    (object_hide (cinematic_scripting_get_object 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 9) true)
    (object_hide (cinematic_scripting_get_object 2 10) true)
    (object_hide (cinematic_scripting_get_object 2 11) true)
    (object_hide (cinematic_scripting_get_object 2 12) true)
    (object_hide (cinematic_scripting_get_object 2 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 14 "halsey_airlock_drawer_6" true)
    (object_hide (cinematic_scripting_get_object 2 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 16 "fx_dyn_light_carter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 17 "fx_dyn_light_halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 18 "fx_dyn_light_emi_jun_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 19 "fx_dyn_light_jor_pla_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 5 20 "fx_dyn_light_kat_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 51)
    (cinematic_scripting_start_dialogue 2 5 0 (cinematic_scripting_get_object 2 7))
    (cinematic_sleep 12)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 6 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 6)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 2 0) true)
    (object_hide (cinematic_scripting_get_object 2 1) true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 4) true)
    (object_hide (cinematic_scripting_get_object 2 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 6 "jorge_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 7 "jorge_head_7" true)
    (object_hide (cinematic_scripting_get_object 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 9) true)
    (object_hide (cinematic_scripting_get_object 2 10) true)
    (object_hide (cinematic_scripting_get_object 2 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 12 "player_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 13 "player_dmr_7" true)
    (object_hide (cinematic_scripting_get_object 2 14) true)
    (object_hide (cinematic_scripting_get_object 2 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 16 "fx_dyn_light_carter_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 17 "fx_dyn_light_halsey_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 18 "fx_dyn_light_emi_jun_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 19 "fx_dyn_light_jor_pla_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 6 20 "fx_dyn_light_kat_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 113)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 7 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 7)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 0 "carter_8" true)
    (object_hide (cinematic_scripting_get_object 2 1) true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 5 "halsey_8" true)
    (object_hide (cinematic_scripting_get_object 2 6) true)
    (object_hide (cinematic_scripting_get_object 2 7) true)
    (object_hide (cinematic_scripting_get_object 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 9) true)
    (object_hide (cinematic_scripting_get_object 2 10) true)
    (object_hide (cinematic_scripting_get_object 2 11) true)
    (object_hide (cinematic_scripting_get_object 2 12) true)
    (object_hide (cinematic_scripting_get_object 2 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 14 "halsey_airlock_drawer_8" true)
    (object_hide (cinematic_scripting_get_object 2 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 16 "fx_dyn_light_carter_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 17 "fx_dyn_light_halsey_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 18 "fx_dyn_light_emi_jun_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 19 "fx_dyn_light_jor_pla_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 7 20 "fx_dyn_light_kat_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 1)
    (cinematic_scripting_start_dialogue 2 7 0 (cinematic_scripting_get_object 2 5))
    (cinematic_sleep 59)
    (cinematic_sleep 3)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_030_sc_sh9
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 2) 8 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 2) 8)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 2 0) true)
    (object_hide (cinematic_scripting_get_object 2 1) true)
    (object_hide (cinematic_scripting_get_object 2 2) true)
    (object_hide (cinematic_scripting_get_object 2 3) true)
    (object_hide (cinematic_scripting_get_object 2 4) true)
    (object_hide (cinematic_scripting_get_object 2 5) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 6 "jorge_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 7 "jorge_head_9" true)
    (object_hide (cinematic_scripting_get_object 2 8) true)
    (object_hide (cinematic_scripting_get_object 2 9) true)
    (object_hide (cinematic_scripting_get_object 2 10) true)
    (object_hide (cinematic_scripting_get_object 2 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 12 "player_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 13 "player_dmr_9" true)
    (object_hide (cinematic_scripting_get_object 2 14) true)
    (object_hide (cinematic_scripting_get_object 2 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 16 "fx_dyn_light_carter_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 17 "fx_dyn_light_halsey_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 18 "fx_dyn_light_emi_jun_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 19 "fx_dyn_light_jor_pla_9" true)
    (cinematic_scripting_create_and_animate_cinematic_object 2 8 20 "fx_dyn_light_kat_9" true)
    (cinematic_lights_initialize_for_shot 8)
    (cinematic_clips_initialize_for_shot 8)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 4)
    (cinematic_scripting_start_dialogue 2 8 0 (cinematic_scripting_get_object 2 7))
    (cinematic_sleep 51)
    (cinematic_scripting_start_dialogue 2 8 1 (cinematic_scripting_get_object 2 12))
    (cinematic_sleep 30)
    (cinematic_sleep 3)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020lb_halsey_030_sc
    (cinematic_print "beginning scene 3")
    (cinematic_scripting_create_scene 2)
    (020lb_halsey_030_sc_sh1)
    (020lb_halsey_030_sc_sh2)
    (020lb_halsey_030_sc_sh3)
    (020lb_halsey_030_sc_sh4)
    (020lb_halsey_030_sc_sh5)
    (020lb_halsey_030_sc_sh6)
    (020lb_halsey_030_sc_sh7)
    (020lb_halsey_030_sc_sh8)
    (020lb_halsey_030_sc_sh9)
    (cinematic_scripting_destroy_scene 2)
)

(script static void 020lb_halsey_040_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 0 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 0)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 0 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 1 "carter_head_1" true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (object_hide (cinematic_scripting_get_object 3 3) true)
    (object_hide (cinematic_scripting_get_object 3 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 5 "halsey_1" true)
    (object_hide (cinematic_scripting_get_object 3 6) true)
    (object_hide (cinematic_scripting_get_object 3 7) true)
    (object_hide (cinematic_scripting_get_object 3 8) true)
    (object_hide (cinematic_scripting_get_object 3 9) true)
    (object_hide (cinematic_scripting_get_object 3 10) true)
    (object_hide (cinematic_scripting_get_object 3 11) true)
    (object_hide (cinematic_scripting_get_object 3 12) true)
    (object_hide (cinematic_scripting_get_object 3 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 14 "halsey_airlock_drawer_1" true)
    (object_hide (cinematic_scripting_get_object 3 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 16 "fx_dyn_light_carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 17 "fx_dyn_light_emi_jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 18 "fx_dyn_light_halsey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 19 "fx_dyn_light_jor_pla_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 0 20 "fx_dyn_light_kat_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 17)
    (cinematic_scripting_start_dialogue 3 0 0 (cinematic_scripting_get_object 3 1))
    (cinematic_sleep 158)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_040_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 1 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 1)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 0 "carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 1 "carter_head_2" true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (object_hide (cinematic_scripting_get_object 3 3) true)
    (object_hide (cinematic_scripting_get_object 3 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 5 "halsey_2" true)
    (object_hide (cinematic_scripting_get_object 3 6) true)
    (object_hide (cinematic_scripting_get_object 3 7) true)
    (object_hide (cinematic_scripting_get_object 3 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 9 "kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 10 "kat_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 11 "kat_pistol_2" true)
    (object_hide (cinematic_scripting_get_object 3 12) true)
    (object_hide (cinematic_scripting_get_object 3 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 14 "halsey_airlock_drawer_2" true)
    (object_hide (cinematic_scripting_get_object 3 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 16 "fx_dyn_light_carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 17 "fx_dyn_light_emi_jun_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 18 "fx_dyn_light_halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 19 "fx_dyn_light_jor_pla_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 1 20 "fx_dyn_light_kat_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 1.0 0.0)
    (cinematic_sleep 4)
    (cinematic_scripting_start_dialogue 3 1 0 (cinematic_scripting_get_object 3 5))
    (cinematic_sleep 56)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_040_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 2 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 2)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 0 "carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 1 "carter_head_3" true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (object_hide (cinematic_scripting_get_object 3 3) true)
    (object_hide (cinematic_scripting_get_object 3 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 5 "halsey_3" true)
    (object_hide (cinematic_scripting_get_object 3 6) true)
    (object_hide (cinematic_scripting_get_object 3 7) true)
    (object_hide (cinematic_scripting_get_object 3 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 9 "kat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 10 "kat_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 11 "kat_pistol_3" true)
    (object_hide (cinematic_scripting_get_object 3 12) true)
    (object_hide (cinematic_scripting_get_object 3 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 14 "halsey_airlock_drawer_3" true)
    (object_hide (cinematic_scripting_get_object 3 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 16 "fx_dyn_light_carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 17 "fx_dyn_light_emi_jun_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 18 "fx_dyn_light_halsey_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 19 "fx_dyn_light_jor_pla_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 2 20 "fx_dyn_light_kat_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 50)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_040_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 3 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 3)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 0 "carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 1 "carter_head_4" true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 3 "emile_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 4 "emile_shotgun_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 5 "halsey_4" true)
    (object_hide (cinematic_scripting_get_object 3 6) true)
    (object_hide (cinematic_scripting_get_object 3 7) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 8 "jun_4" true)
    (object_hide (cinematic_scripting_get_object 3 9) true)
    (object_hide (cinematic_scripting_get_object 3 10) true)
    (object_hide (cinematic_scripting_get_object 3 11) true)
    (object_hide (cinematic_scripting_get_object 3 12) true)
    (object_hide (cinematic_scripting_get_object 3 13) true)
    (object_hide (cinematic_scripting_get_object 3 14) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 15 "jun_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 16 "fx_dyn_light_carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 17 "fx_dyn_light_emi_jun_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 18 "fx_dyn_light_halsey_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 19 "fx_dyn_light_jor_pla_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 3 20 "fx_dyn_light_kat_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 28)
    (cinematic_scripting_start_dialogue 3 3 0 (cinematic_scripting_get_object 3 1))
    (cinematic_sleep 20)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_040_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 4 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 4)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 0 "carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 1 "carter_head_5" true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (object_hide (cinematic_scripting_get_object 3 3) true)
    (object_hide (cinematic_scripting_get_object 3 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 5 "halsey_5" true)
    (object_hide (cinematic_scripting_get_object 3 6) true)
    (object_hide (cinematic_scripting_get_object 3 7) true)
    (object_hide (cinematic_scripting_get_object 3 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 9 "kat_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 10 "kat_head_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 11 "kat_pistol_5" true)
    (object_hide (cinematic_scripting_get_object 3 12) true)
    (object_hide (cinematic_scripting_get_object 3 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 14 "halsey_airlock_drawer_5" true)
    (object_hide (cinematic_scripting_get_object 3 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 16 "fx_dyn_light_carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 17 "fx_dyn_light_emi_jun_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 18 "fx_dyn_light_halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 19 "fx_dyn_light_jor_pla_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 4 20 "fx_dyn_light_kat_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 11)
    (cinematic_scripting_start_dialogue 3 4 0 (cinematic_scripting_get_object 3 5))
    (cinematic_sleep 380)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_040_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 5 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 5)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 3 0) true)
    (object_hide (cinematic_scripting_get_object 3 1) true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (object_hide (cinematic_scripting_get_object 3 3) true)
    (object_hide (cinematic_scripting_get_object 3 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 5 "halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 6 "jorge_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 7 "jorge_head_6" true)
    (object_hide (cinematic_scripting_get_object 3 8) true)
    (object_hide (cinematic_scripting_get_object 3 9) true)
    (object_hide (cinematic_scripting_get_object 3 10) true)
    (object_hide (cinematic_scripting_get_object 3 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 12 "player_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 13 "player_dmr_6" true)
    (object_hide (cinematic_scripting_get_object 3 14) true)
    (object_hide (cinematic_scripting_get_object 3 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 16 "fx_dyn_light_carter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 17 "fx_dyn_light_emi_jun_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 18 "fx_dyn_light_halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 19 "fx_dyn_light_jor_pla_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 5 20 "fx_dyn_light_kat_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 57)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_040_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 6 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 6)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 3 0) true)
    (object_hide (cinematic_scripting_get_object 3 1) true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (object_hide (cinematic_scripting_get_object 3 3) true)
    (object_hide (cinematic_scripting_get_object 3 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 5 "halsey_7" true)
    (object_hide (cinematic_scripting_get_object 3 6) true)
    (object_hide (cinematic_scripting_get_object 3 7) true)
    (object_hide (cinematic_scripting_get_object 3 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 9 "kat_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 10 "kat_head_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 11 "kat_pistol_7" true)
    (object_hide (cinematic_scripting_get_object 3 12) true)
    (object_hide (cinematic_scripting_get_object 3 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 14 "halsey_airlock_drawer_7" true)
    (object_hide (cinematic_scripting_get_object 3 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 16 "fx_dyn_light_carter_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 17 "fx_dyn_light_emi_jun_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 18 "fx_dyn_light_halsey_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 19 "fx_dyn_light_jor_pla_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 6 20 "fx_dyn_light_kat_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 206)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_040_sc_sh8
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 3) 7 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 3) 7)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 0 "carter_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 1 "carter_head_8" true)
    (object_hide (cinematic_scripting_get_object 3 2) true)
    (object_hide (cinematic_scripting_get_object 3 3) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 4 "emile_shotgun_8" true)
    (object_hide (cinematic_scripting_get_object 3 5) true)
    (object_hide (cinematic_scripting_get_object 3 6) true)
    (object_hide (cinematic_scripting_get_object 3 7) true)
    (object_hide (cinematic_scripting_get_object 3 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 9 "kat_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 10 "kat_head_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 11 "kat_pistol_8" true)
    (object_hide (cinematic_scripting_get_object 3 12) true)
    (object_hide (cinematic_scripting_get_object 3 13) true)
    (object_hide (cinematic_scripting_get_object 3 14) true)
    (object_hide (cinematic_scripting_get_object 3 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 16 "fx_dyn_light_carter_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 17 "fx_dyn_light_emi_jun_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 18 "fx_dyn_light_halsey_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 19 "fx_dyn_light_jor_pla_8" true)
    (cinematic_scripting_create_and_animate_cinematic_object 3 7 20 "fx_dyn_light_kat_8" true)
    (cinematic_lights_initialize_for_shot 7)
    (cinematic_clips_initialize_for_shot 7)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 4)
    (cinematic_scripting_start_dialogue 3 7 0 (cinematic_scripting_get_object 3 1))
    (cinematic_sleep 167)
    (cinematic_scripting_start_dialogue 3 7 1 (cinematic_scripting_get_object 3 10))
    (cinematic_sleep 34)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020lb_halsey_040_sc
    (cinematic_print "beginning scene 4")
    (cinematic_scripting_create_scene 3)
    (020lb_halsey_040_sc_sh1)
    (020lb_halsey_040_sc_sh2)
    (020lb_halsey_040_sc_sh3)
    (020lb_halsey_040_sc_sh4)
    (020lb_halsey_040_sc_sh5)
    (020lb_halsey_040_sc_sh6)
    (020lb_halsey_040_sc_sh7)
    (020lb_halsey_040_sc_sh8)
    (cinematic_scripting_destroy_scene 3)
)

(script static void 020lb_halsey_050_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 0 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 0)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 0 "carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 1 "carter_head_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 2 "data_chip_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 3 "halsey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 4 "kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 5 "kat_head_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 6 "kat_pistol_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 7 "halsey_airlock_drawer_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 8 "player_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 9 "fx_dyn_light_carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 10 "fx_dyn_light_halsey2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 11 "fx_dyn_light_halsey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 12 "fx_dyn_light_kat2_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 13 "fx_dyn_light_kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 0 14 "fx_dyn_light_carter2_1" true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 44)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_050_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 1 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 1)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 0 "carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 1 "carter_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 2 "data_chip_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 3 "halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 4 "kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 5 "kat_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 6 "kat_pistol_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 7 "halsey_airlock_drawer_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 8 "player_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 9 "fx_dyn_light_carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 10 "fx_dyn_light_halsey2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 11 "fx_dyn_light_halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 12 "fx_dyn_light_kat2_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 13 "fx_dyn_light_kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 1 14 "fx_dyn_light_carter2_2" true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 32)
    (cinematic_scripting_start_dialogue 4 1 0 (cinematic_scripting_get_object 4 3))
    (cinematic_sleep 201)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_050_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 2 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 2)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 0 "carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 1 "carter_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 2 "data_chip_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 3 "halsey_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 4 "kat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 5 "kat_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 6 "kat_pistol_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 7 "halsey_airlock_drawer_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 8 "player_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 9 "fx_dyn_light_carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 10 "fx_dyn_light_halsey2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 11 "fx_dyn_light_halsey_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 12 "fx_dyn_light_kat2_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 13 "fx_dyn_light_kat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 2 14 "fx_dyn_light_carter2_3" true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 124)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_050_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 3 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 3)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 0 "carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 1 "carter_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 2 "data_chip_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 3 "halsey_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 4 "kat_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 5 "kat_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 6 "kat_pistol_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 7 "halsey_airlock_drawer_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 8 "player_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 9 "fx_dyn_light_carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 10 "fx_dyn_light_halsey2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 11 "fx_dyn_light_halsey_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 12 "fx_dyn_light_kat2_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 13 "fx_dyn_light_kat_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 3 14 "fx_dyn_light_carter2_4" true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 130)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_050_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 4 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 4)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 0 "carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 1 "carter_head_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 2 "data_chip_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 3 "halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 4 "kat_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 5 "kat_head_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 6 "kat_pistol_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 7 "halsey_airlock_drawer_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 8 "player_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 9 "fx_dyn_light_carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 10 "fx_dyn_light_halsey2_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 11 "fx_dyn_light_halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 12 "fx_dyn_light_kat2_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 13 "fx_dyn_light_kat_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 4 14 "fx_dyn_light_carter2_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 24)
    (cinematic_scripting_start_dialogue 4 4 0 (cinematic_scripting_get_object 4 1))
    (cinematic_sleep 20)
    (cinematic_scripting_start_dialogue 4 4 1 (cinematic_scripting_get_object 4 3))
    (cinematic_sleep 12)
    (cinematic_sleep 3)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_050_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 5 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 5)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 0 "carter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 1 "carter_head_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 2 "data_chip_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 3 "halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 4 "kat_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 5 "kat_head_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 6 "kat_pistol_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 7 "halsey_airlock_drawer_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 8 "player_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 9 "fx_dyn_light_carter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 10 "fx_dyn_light_halsey2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 11 "fx_dyn_light_halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 12 "fx_dyn_light_kat2_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 13 "fx_dyn_light_kat_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 5 14 "fx_dyn_light_carter2_6" true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 151)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_050_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 4) 6 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 4) 6)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 0 "carter_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 1 "carter_head_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 2 "data_chip_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 3 "halsey_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 4 "kat_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 5 "kat_head_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 6 "kat_pistol_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 7 "halsey_airlock_drawer_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 8 "player_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 9 "fx_dyn_light_carter_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 10 "fx_dyn_light_halsey2_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 11 "fx_dyn_light_halsey_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 12 "fx_dyn_light_kat2_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 13 "fx_dyn_light_kat_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 4 6 14 "fx_dyn_light_carter2_7" true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 89)
    (cinematic_scripting_start_dialogue 4 6 0 (cinematic_scripting_get_object 4 3))
    (cinematic_sleep 101)
    (cinematic_scripting_start_dialogue 4 6 1 none)
    (cinematic_sleep 118)
    (cinematic_scripting_start_dialogue 4 6 2 none)
    (cinematic_sleep 52)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020lb_halsey_050_sc
    (cinematic_print "beginning scene 5")
    (cinematic_scripting_create_scene 4)
    (020lb_halsey_050_sc_sh1)
    (020lb_halsey_050_sc_sh2)
    (020lb_halsey_050_sc_sh3)
    (020lb_halsey_050_sc_sh4)
    (020lb_halsey_050_sc_sh5)
    (020lb_halsey_050_sc_sh6)
    (020lb_halsey_050_sc_sh7)
    (cinematic_scripting_destroy_scene 4)
)

(script static void 020lb_halsey_060_sc_sh1
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 0 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 0)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 5 0) true)
    (object_hide (cinematic_scripting_get_object 5 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 2 "data_chip_1" true)
    (object_hide (cinematic_scripting_get_object 5 3) true)
    (object_hide (cinematic_scripting_get_object 5 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 5 "halsey_1" true)
    (object_hide (cinematic_scripting_get_object 5 6) true)
    (object_hide (cinematic_scripting_get_object 5 7) true)
    (object_hide (cinematic_scripting_get_object 5 8) true)
    (object_hide (cinematic_scripting_get_object 5 9) true)
    (object_hide (cinematic_scripting_get_object 5 10) true)
    (object_hide (cinematic_scripting_get_object 5 11) true)
    (object_hide (cinematic_scripting_get_object 5 12) true)
    (object_hide (cinematic_scripting_get_object 5 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 14 "halsey_airlock_drawer_1" true)
    (object_hide (cinematic_scripting_get_object 5 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 16 "fx_dyn_light_carter_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 17 "fx_dyn_light_emi_jun_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 18 "fx_dyn_light_halsey_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 19 "fx_dyn_light_jor_pla_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 20 "fx_dyn_light_kat_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 21 "fx_dyn_light_blue_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 22 "fx_dyn_light_red_1" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 0 23 "fx_dyn_light_exit_1" true)
    (object_hide (cinematic_scripting_get_object 5 24) true)
    (cinematic_lights_initialize_for_shot 0)
    (cinematic_clips_initialize_for_shot 0)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 2)
    (cinematic_scripting_start_dialogue 5 0 0 (cinematic_scripting_get_object 5 5))
    (cinematic_sleep 41)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_060_sc_sh2
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 1 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 1)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 0 "carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 1 "carter_head_2" true)
    (object_hide (cinematic_scripting_get_object 5 2) true)
    (object_hide (cinematic_scripting_get_object 5 3) true)
    (object_hide (cinematic_scripting_get_object 5 4) true)
    (object_hide (cinematic_scripting_get_object 5 5) true)
    (object_hide (cinematic_scripting_get_object 5 6) true)
    (object_hide (cinematic_scripting_get_object 5 7) true)
    (object_hide (cinematic_scripting_get_object 5 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 9 "kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 10 "kat_head_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 11 "kat_pistol_2" true)
    (object_hide (cinematic_scripting_get_object 5 12) true)
    (object_hide (cinematic_scripting_get_object 5 13) true)
    (object_hide (cinematic_scripting_get_object 5 14) true)
    (object_hide (cinematic_scripting_get_object 5 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 16 "fx_dyn_light_carter_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 17 "fx_dyn_light_emi_jun_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 18 "fx_dyn_light_halsey_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 19 "fx_dyn_light_jor_pla_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 20 "fx_dyn_light_kat_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 21 "fx_dyn_light_blue_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 22 "fx_dyn_light_red_2" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 1 23 "fx_dyn_light_exit_2" true)
    (object_hide (cinematic_scripting_get_object 5 24) true)
    (cinematic_lights_initialize_for_shot 1)
    (cinematic_clips_initialize_for_shot 1)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 3)
    (cinematic_scripting_start_dialogue 5 1 0 (cinematic_scripting_get_object 5 1))
    (cinematic_sleep 226)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_060_sc_sh3
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 2 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 2)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 0 "carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 1 "carter_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 2 "data_chip_3" true)
    (object_hide (cinematic_scripting_get_object 5 3) true)
    (object_hide (cinematic_scripting_get_object 5 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 5 "halsey_3" true)
    (object_hide (cinematic_scripting_get_object 5 6) true)
    (object_hide (cinematic_scripting_get_object 5 7) true)
    (object_hide (cinematic_scripting_get_object 5 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 9 "kat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 10 "kat_head_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 11 "kat_pistol_3" true)
    (object_hide (cinematic_scripting_get_object 5 12) true)
    (object_hide (cinematic_scripting_get_object 5 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 14 "halsey_airlock_drawer_3" true)
    (object_hide (cinematic_scripting_get_object 5 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 16 "fx_dyn_light_carter_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 17 "fx_dyn_light_emi_jun_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 18 "fx_dyn_light_halsey_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 19 "fx_dyn_light_jor_pla_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 20 "fx_dyn_light_kat_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 21 "fx_dyn_light_blue_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 22 "fx_dyn_light_red_3" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 2 23 "fx_dyn_light_exit_3" true)
    (object_hide (cinematic_scripting_get_object 5 24) true)
    (cinematic_lights_initialize_for_shot 2)
    (cinematic_clips_initialize_for_shot 2)
    (render_exposure 1.5 0.0)
    (cinematic_sleep 20)
    (cinematic_scripting_start_dialogue 5 2 0 (cinematic_scripting_get_object 5 5))
    (cinematic_sleep 81)
    (cinematic_scripting_start_dialogue 5 2 1 (cinematic_scripting_get_object 5 1))
    (cinematic_sleep 97)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_060_sc_sh4
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 3 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 3)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 5 0) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 1 "carter_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 2 "data_chip_4" true)
    (object_hide (cinematic_scripting_get_object 5 3) true)
    (object_hide (cinematic_scripting_get_object 5 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 5 "halsey_4" true)
    (object_hide (cinematic_scripting_get_object 5 6) true)
    (object_hide (cinematic_scripting_get_object 5 7) true)
    (object_hide (cinematic_scripting_get_object 5 8) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 9 "kat_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 10 "kat_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 11 "kat_pistol_4" true)
    (object_hide (cinematic_scripting_get_object 5 12) true)
    (object_hide (cinematic_scripting_get_object 5 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 14 "halsey_airlock_drawer_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 15 "jun_head_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 16 "fx_dyn_light_carter_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 17 "fx_dyn_light_emi_jun_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 18 "fx_dyn_light_halsey_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 19 "fx_dyn_light_jor_pla_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 20 "fx_dyn_light_kat_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 21 "fx_dyn_light_blue_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 22 "fx_dyn_light_red_4" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 3 23 "fx_dyn_light_exit_4" true)
    (object_hide (cinematic_scripting_get_object 5 24) true)
    (cinematic_lights_initialize_for_shot 3)
    (cinematic_clips_initialize_for_shot 3)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 5)
    (cinematic_scripting_start_dialogue 5 3 0 (cinematic_scripting_get_object 5 1))
    (cinematic_sleep 60)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_060_sc_sh5
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 4 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 4)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 0 "carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 1 "carter_head_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 2 "data_chip_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 3 "emile_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 4 "emile_shotgun_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 5 "halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 6 "jorge_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 7 "jorge_head_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 8 "jun_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 9 "kat_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 10 "kat_head_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 11 "kat_pistol_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 12 "player_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 13 "player_dmr_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 14 "halsey_airlock_drawer_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 15 "jun_head_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 16 "fx_dyn_light_carter_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 17 "fx_dyn_light_emi_jun_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 18 "fx_dyn_light_halsey_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 19 "fx_dyn_light_jor_pla_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 20 "fx_dyn_light_kat_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 21 "fx_dyn_light_blue_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 22 "fx_dyn_light_red_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 23 "fx_dyn_light_exit_5" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 4 24 "logo_5" true)
    (cinematic_lights_initialize_for_shot 4)
    (cinematic_clips_initialize_for_shot 4)
    (render_exposure 3.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 5 24) "camera" 0.5 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 5 24) "logo" 1.0 0.0)
    (object_set_cinematic_function_variable (cinematic_scripting_get_object 5 24) "location" 0.9 0.0)
    (cinematic_scripting_start_screen_effect 5 4 0)
    (cinematic_sleep 74)
    (cinematic_scripting_stop_screen_effect 5 4 0)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_060_sc_sh6
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 5 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 5)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 5 0) true)
    (object_hide (cinematic_scripting_get_object 5 1) true)
    (object_hide (cinematic_scripting_get_object 5 2) true)
    (object_hide (cinematic_scripting_get_object 5 3) true)
    (object_hide (cinematic_scripting_get_object 5 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 5 "halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 6 "jorge_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 7 "jorge_head_6" true)
    (object_hide (cinematic_scripting_get_object 5 8) true)
    (object_hide (cinematic_scripting_get_object 5 9) true)
    (object_hide (cinematic_scripting_get_object 5 10) true)
    (object_hide (cinematic_scripting_get_object 5 11) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 12 "player_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 13 "player_dmr_6" true)
    (object_hide (cinematic_scripting_get_object 5 14) true)
    (object_hide (cinematic_scripting_get_object 5 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 16 "fx_dyn_light_carter_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 17 "fx_dyn_light_emi_jun_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 18 "fx_dyn_light_halsey_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 19 "fx_dyn_light_jor_pla_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 20 "fx_dyn_light_kat_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 21 "fx_dyn_light_blue_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 22 "fx_dyn_light_red_6" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 5 23 "fx_dyn_light_exit_6" true)
    (object_hide (cinematic_scripting_get_object 5 24) true)
    (cinematic_lights_initialize_for_shot 5)
    (cinematic_clips_initialize_for_shot 5)
    (render_exposure 0.0 0.0)
    (cinematic_sleep 17)
    (cinematic_scripting_start_dialogue 5 5 0 (cinematic_scripting_get_object 5 7))
    (cinematic_sleep 27)
    (cinematic_scripting_start_dialogue 5 5 1 (cinematic_scripting_get_object 5 5))
    (cinematic_sleep 14)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey_060_sc_sh7
    (camera_set_cinematic_scene (cinematic_tag_reference_get_scene 5) 6 "020lb_halsey_020_anchor")
    (cinematic_set_shot (cinematic_tag_reference_get_scene 5) 6)
    (cinematic_object_create_cinematic_anchor "020lb_halsey_020_anchor")
    (object_hide (cinematic_scripting_get_object 5 0) true)
    (object_hide (cinematic_scripting_get_object 5 1) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 2 "data_chip_7" true)
    (object_hide (cinematic_scripting_get_object 5 3) true)
    (object_hide (cinematic_scripting_get_object 5 4) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 5 "halsey_7" true)
    (object_hide (cinematic_scripting_get_object 5 6) true)
    (object_hide (cinematic_scripting_get_object 5 7) true)
    (object_hide (cinematic_scripting_get_object 5 8) true)
    (object_hide (cinematic_scripting_get_object 5 9) true)
    (object_hide (cinematic_scripting_get_object 5 10) true)
    (object_hide (cinematic_scripting_get_object 5 11) true)
    (object_hide (cinematic_scripting_get_object 5 12) true)
    (object_hide (cinematic_scripting_get_object 5 13) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 14 "halsey_airlock_drawer_7" true)
    (object_hide (cinematic_scripting_get_object 5 15) true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 16 "fx_dyn_light_carter_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 17 "fx_dyn_light_emi_jun_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 18 "fx_dyn_light_halsey_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 19 "fx_dyn_light_jor_pla_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 20 "fx_dyn_light_kat_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 21 "fx_dyn_light_blue_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 22 "fx_dyn_light_red_7" true)
    (cinematic_scripting_create_and_animate_cinematic_object 5 6 23 "fx_dyn_light_exit_7" true)
    (object_hide (cinematic_scripting_get_object 5 24) true)
    (cinematic_lights_initialize_for_shot 6)
    (cinematic_clips_initialize_for_shot 6)
    (render_exposure 1.9 0.0)
    (cinematic_sleep 52)
    (sleep (cinematic_tag_fade_out_from_cinematic "020lb_halsey"))
    (cinematic_sleep 44)
    (cinematic_lights_destroy_shot)
    (cinematic_clips_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void !020lb_halsey_060_sc
    (cinematic_print "beginning scene 6")
    (cinematic_scripting_create_scene 5)
    (020lb_halsey_060_sc_sh1)
    (020lb_halsey_060_sc_sh2)
    (020lb_halsey_060_sc_sh3)
    (020lb_halsey_060_sc_sh4)
    (020lb_halsey_060_sc_sh5)
    (020lb_halsey_060_sc_sh6)
    (020lb_halsey_060_sc_sh7)
    (cinematic_scripting_destroy_scene 5)
)

(script static void 020lb_halsey_cleanup
    (cinematic_scripting_clean_up 1)
)

(script static void begin_020lb_halsey_debug
    (cinematic_zone_activate_for_debugging 1)
    (sleep 2)
    (camera_control true)
    (cinematic_start)
    (set cinematic_letterbox_style 0)
    (cinematic_show_letterbox_immediate true)
    (camera_set_cinematic)
    (cinematic_set_debug_mode true)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
)

(script static void end_020lb_halsey_debug
    (cinematic_destroy)
    (cinematic_stop)
    (camera_control false)
    (render_exposure_fade_out 0.0)
    (cinematic_zone_deactivate 1)
    (fade_in 0.0 0.0 0.0 0)
)

(script static void 020lb_halsey_debug
    (begin_020lb_halsey_debug)
    (sleep (cinematic_tag_fade_in_to_cinematic "020lb_halsey"))
    (cinematic_outro_start)
    (!020lb_halsey_010_sc)
    (!020lb_halsey_020_sc)
    (!020lb_halsey_030_sc)
    (!020lb_halsey_040_sc)
    (!020lb_halsey_050_sc)
    (!020lb_halsey_060_sc)
    (end_020lb_halsey_debug)
)

(script static void begin_020lb_halsey
    (cinematic_zone_activate 1)
    (sleep 2)
    (camera_set_cinematic)
    (cinematic_set_debug_mode false)
    (cinematic_set (cinematic_tag_reference_get_cinematic 1))
)

(script static void end_020lb_halsey
    (cinematic_destroy)
    (render_exposure_fade_out 0.0)
)

(script static void 020lb_halsey
    (begin_020lb_halsey)
    (sleep (cinematic_tag_fade_in_to_cinematic "020lb_halsey"))
    (cinematic_outro_start)
    (!020lb_halsey_010_sc)
    (!020lb_halsey_020_sc)
    (!020lb_halsey_030_sc)
    (!020lb_halsey_040_sc)
    (!020lb_halsey_050_sc)
    (!020lb_halsey_060_sc)
    (end_020lb_halsey)
)

