; Decompiled with Blamite
; Source file: 04a_gasgiant.hsc
; Start time: 4/7/2022 7:17:11
; Decompilation finished in ~0.0056858s
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.


; GLOBALS

(global string data_mine_mission_segment "")
(global short sound_offset 15)
(global short prediction_offset 75)
(global boolean stealth_talk_gone false)
(global boolean stealth_hint_done false)
(global boolean first_airlock_go false)
(global boolean open_rec_center false)
(global boolean commander_done_yapping false)
(global short recycling_time 300)
(global boolean recycling_power_on false)
(global object chatter_her_01 none)
(global object chatter_her_02 none)
(global boolean hangar_power_on false)
(global boolean hangar_sentinel_var true)
(global boolean hangar_phantom_cue false)
(global boolean hangar_sentinels_come false)
(global short heavies_spawned 0)
(global short a50_spawn_go 0)
(global boolean underhangar_power_on false)
(global boolean bottling_power_on false)
(global boolean left_bottling_firsthalf false)
(global short bottling_sentinels_spawned 0)
(global boolean hl_done_yapping false)
(global boolean overlook_choose_side false)
(global short phantom_course_pos 0)
(global boolean dogfight_ph_pilot_go false)
(global boolean try_to_save_now false)
(global boolean dogfight_over false)
(global boolean emplace_01_done false)
(global boolean emplace_02_done false)
(global boolean emplace_03_done false)
(global boolean emplace_04_done false)
(global boolean emplace_05_done false)
(global boolean emplace_06_done false)
(global short dogfighters_spawned 0)


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

(script static void x04_01_predict_stub
    (begin
        (wake x04_01_predict)
    )
)

(script static void x04_02a_predict_stub
    (begin
        (wake x04_02a_predict)
    )
)

(script static void x04_02b_predict_stub
    (begin
        (wake x04_02b_predict)
    )
)

(script static void x04_03b_predict_stub
    (begin
        (wake x04_03b_predict)
    )
)

(script static void x04_04_predict_stub
    (begin
        (wake x04_04_predict)
    )
)

(script static void x04_05_predict_stub
    (begin
        (wake x04_05_predict)
    )
)

(script static void x04_06_predict_stub
    (begin
        (wake x04_06_predict)
    )
)

(script static void x04_07_predict_stub
    (begin
        (wake x04_07_predict)
    )
)

(script static void x04_08_predict_stub
    (begin
        (wake x04_08_predict)
    )
)

(script static void x04_09_predict_stub
    (begin
        (wake x04_09_predict)
    )
)

(script static void x04_10_predict_stub
    (begin
        (wake x04_10_predict)
    )
)

(script static void 04_intro_01_predict_stub
    (begin
        (wake 04_intro_01_predict)
    )
)

(script static void 04_intro_02a_predict_stub
    (begin
        (wake 04_intro_02a_predict)
    )
)

(script static void 04_intro_02b_predict_stub
    (begin
        (wake 04_intro_02b_predict)
    )
)

(script static void 04_intro_02c_predict_stub
    (begin
        (wake 04_intro_02c_predict)
    )
)

(script static void 04_intro_02d_predict_stub
    (begin
        (wake 04_intro_02d_predict)
    )
)

(script static void 04_intro_03_predict_stub
    (begin
        (wake 04_intro_03_predict)
    )
)

(script static void 04_intro_05_predict_stub
    (begin
        (wake 04_intro_05_predict)
    )
)

(script static void 04_intro_06b_predict_stub
    (begin
        (wake 04_intro_06b_predict)
    )
)

(script dormant void x04_score_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\music\01_mus" none 1.0)
        (print "x04 score 01 start")
    )
)

(script dormant void x04_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_01_fol" none 1.0)
        (print "x04 foley 01 start")
    )
)

(script dormant void x04_0010_bgr
    (begin
        (sleep 483)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0010_bgr" "brute_01" 1.0)
        (attract_mode_set_seconds "x04_0010_bgr" 5.0)
    )
)

(script dormant void x04_0020_bgl
    (begin
        (sleep 633)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0020_bgl" "brute_01" 1.0)
        (attract_mode_set_seconds "x04_0020_bgl" 2.0)
    )
)

(script dormant void x04_0040_jcr
    (begin
        (sleep 693)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0040_jcr" "jackal_01" 1.0)
        (attract_mode_set_seconds "x04_0040_jcr" 4.0)
    )
)

(script dormant void x04_0030_bgl
    (begin
        (sleep 816)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0030_bgl" "brute_01" 1.0)
        (attract_mode_set_seconds "x04_0030_bgl" 1.5)
    )
)

(script dormant void x04_0050_bgr
    (begin
        (sleep 863)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0050_bgr" "brute_02" 1.0)
        (attract_mode_set_seconds "x04_0050_bgr" 7.5)
    )
)

(script dormant void x04_cinematic_lighting_scene_01
    (begin
        (cinematic_lighting_set_primary_light 46.0 276.0 0.11 0.1 0.14)
        (cinematic_lighting_set_secondary_light 73.0 0.0 0.11 0.11 0.13)
        (cinematic_lighting_set_ambient_light 0.04 0.04 0.04)
        (rasterizer_bloom_override_blur_amount true)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "dervish" true)
        (object_uses_cinematic_lighting "tartarus" true)
        (object_uses_cinematic_lighting "brute_01" true)
        (object_uses_cinematic_lighting "brute_02" true)
        (object_uses_cinematic_lighting "jackal_01" true)
        (object_uses_cinematic_lighting "jackal_02" true)
        (object_uses_cinematic_lighting "jackal_03" true)
        (object_uses_cinematic_lighting "hammer" true)
    )
)

(script static void x04_01_setup
    (begin
        (object_create_anew "dervish")
        (object_create_anew "tartarus")
        (object_create_anew "brute_01")
        (object_create_anew "brute_02")
        (object_create_anew "jackal_01")
        (object_create_anew "jackal_02")
        (object_create_anew "jackal_03")
        (object_create_anew "hammer")
        (object_cinematic_lod "dervish" true)
        (object_cinematic_lod "tartarus" true)
        (object_cinematic_lod "brute_01" true)
        (object_cinematic_lod "brute_02" true)
        (object_cinematic_lod "jackal_01" true)
        (object_cinematic_lod "jackal_02" true)
        (object_cinematic_lod "jackal_03" true)
        (object_cinematic_lod "hammer" true)
        (wake x04_0010_bgr)
        (wake x04_0020_bgl)
        (wake x04_0040_jcr)
        (wake x04_0030_bgl)
        (wake x04_0050_bgr)
        (wake x04_score_01)
        (wake x04_foley_01)
        (wake x04_cinematic_lighting_scene_01)
    )
)

(script static void x04_scene_01
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (camera_control true)
        (set_pjl_effect "gasgiant_1")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (online_message_send)
        (x04_01_predict_stub)
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\music\01_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_01_fol")
        (sleep prediction_offset)
        (x04_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_01" none "anchor_flag_x04a")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_01" false "anchor_x04a")
        (custom_animation_relative "tartarus" "objects\characters\brute\x04\x04" "tartarus_01" false "anchor_x04a")
        (custom_animation_relative "brute_01" "objects\characters\brute\x04\x04" "brute01_01" false "anchor_x04a")
        (custom_animation_relative "brute_02" "objects\characters\brute\x04\x04" "brute02_01" false "anchor_x04a")
        (custom_animation_relative "jackal_01" "objects\characters\jackal\x04\x04" "jackal01_01" false "anchor_x04a")
        (custom_animation_relative "jackal_02" "objects\characters\jackal\x04\x04" "jackal02_01" false "anchor_x04a")
        (custom_animation_relative "jackal_03" "objects\characters\jackal\x04\x04" "jackal03_01" false "anchor_x04a")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x04\x04" "hammer_01" "anchor_x04a")
        (interpolator_stop "blurry_vision" 1.0 0.001)
        (sleep 30)
        (cinematic_start 0.0 0.0 0.0 30)
        (sleep 45)
        (cinematic_stop 0.0 0.0 0.0 30)
        (sleep 45)
        (cinematic_start 0.0 0.0 0.0 20)
        (interpolator_stop "blurry_vision" 0.0 2.0)
        (sleep 30)
        (cinematic_stop 0.0 0.0 0.0 20)
        (sleep 20)
        (interpolator_stop "blurry_vision" 1.0 0.001)
        (sleep 25)
        (cinematic_start 0.0 0.0 0.0 10)
        (interpolator_stop "blurry_vision" 0.0 2.0)
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_02a_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_02a_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x04_foley_02a
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_02a_fol" none 1.0)
        (print "x04 foley 02a start")
    )
)

(script dormant void x04_0060_tar
    (begin
        (sleep 173)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0060_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x04_0060_tar" 4.0)
    )
)

(script dormant void x04_0070_tar
    (begin
        (sleep 300)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0070_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x04_0070_tar" 2.0)
    )
)

(script dormant void x04_0080_tar
    (begin
        (sleep 370)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0080_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x04_0080_tar" 3.5)
        (sleep 15)
        (unit_set_emotional_state "tartarus" "inquisitive" 0.75 90)
    )
)

(script dormant void x04_button_delete
    (begin
        (sleep 361)
        (print "button_delete")
        (object_destroy "x04_button")
    )
)

(script dormant void x04_door_open
    (begin
        (sleep 455)
        (print "door open")
        (device_set_position "x04_door_01" 1.0)
    )
)

(script static void x04_02a_setup
    (begin
        (object_create_anew "x04_button")
        (wake x04_foley_02a)
        (wake x04_0060_tar)
        (wake x04_0070_tar)
        (wake x04_0080_tar)
        (wake x04_door_open)
        (wake x04_button_delete)
    )
)

(script static void x04_scene_02a
    (begin
        (x04_02a_setup)
        (camera_pan 70.0 0)
        (print "fov change: 60 -> 70 over 0 ticks")
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_02a" none "anchor_flag_x04a")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_02a" false "anchor_x04a")
        (custom_animation_relative "tartarus" "objects\characters\brute\x04\x04" "tartarus_02a" false "anchor_x04a")
        (custom_animation_relative "brute_01" "objects\characters\brute\x04\x04" "brute01_02a" false "anchor_x04a")
        (custom_animation_relative "brute_02" "objects\characters\brute\x04\x04" "brute02_02a" false "anchor_x04a")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x04\x04" "hammer_02a" "anchor_x04a")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_02b_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_02b_fol")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (object_destroy "x04_door_01")
    )
)

(script dormant void x04_foley_2b
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_02b_fol" none 1.0)
        (print "x04 foley 02b start")
    )
)

(script dormant void x04_02b_fov
    (begin
        (sleep 140)
        (camera_pan 80.0 0)
        (print "fov change: 70 -> 80 over 0 ticks")
    )
)

(script dormant void x04_cinematic_lighting_02b
    (begin
        (cinematic_lighting_set_primary_light 68.0 336.0 0.25 0.24 0.36)
        (cinematic_lighting_set_secondary_light 0.0 24.0 0.18 0.13 0.2)
        (cinematic_lighting_set_ambient_light 0.03 0.03 0.03)
    )
)

(script static void x04_02b_setup
    (begin
        (object_create_anew "jail_ledge")
        (object_uses_cinematic_lighting "jail_ledge" true)
        (wake x04_foley_2b)
        (wake x04_02b_fov)
        (wake x04_cinematic_lighting_02b)
    )
)

(script static void x04_02b_cleanup
    (begin
        (object_destroy "jail_ledge")
        (object_destroy_containing "jackal")
    )
)

(script static void x04_scene_02b
    (begin
        (predict_animation)
        (x04_02b_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_02b" none "anchor_flag_x04a")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_02b" false "anchor_x04a")
        (custom_animation_relative "tartarus" "objects\characters\brute\x04\x04" "tartarus_02b" false "anchor_x04a")
        (custom_animation_relative "brute_01" "objects\characters\brute\x04\x04" "brute01_02b" false "anchor_x04a")
        (custom_animation_relative "brute_02" "objects\characters\brute\x04\x04" "brute02_02b" false "anchor_x04a")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x04\x04" "hammer_02b" "anchor_x04a")
        (scenery_animation_start_relative "jail_ledge" "scenarios\objects\solo\highcharity\high_jail_ledge\x04\x04" "ledge_02b" "anchor_x04a")
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_03b_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_03b_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x04_foley_03b
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_03b_fol" none 1.0)
        (print "x04 foley 03b start")
    )
)

(script dormant void x04_03b_dof_1
    (begin
        (sleep 91)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 1.0 0.5 0.5 0.001 0.0 0.0 0.001)
        (print "rack focus")
        (sleep 138)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script dormant void x04_cinematic_lighting_03b
    (begin
        (cinematic_lighting_set_primary_light 65.0 0.0 0.24 0.24 0.31)
        (cinematic_lighting_set_secondary_light 0.0 26.0 0.21 0.18 0.15)
        (cinematic_lighting_set_ambient_light 0.05 0.05 0.05)
        (object_uses_cinematic_lighting "honor_guard_02" true)
        (object_uses_cinematic_lighting "honor_guard_04" true)
        (object_uses_cinematic_lighting "honor_guard_05" true)
        (object_uses_cinematic_lighting "honor_guard_06" true)
        (object_uses_cinematic_lighting "honor_guard_14" true)
        (object_uses_cinematic_lighting "honor_guard_15" true)
        (object_uses_cinematic_lighting "honor_guard_16" true)
        (object_uses_cinematic_lighting "honor_guard_17" true)
        (object_uses_cinematic_lighting "honor_guard_18" true)
        (object_uses_cinematic_lighting "honor_guard_19" true)
        (object_uses_cinematic_lighting "honor_guard_20" true)
        (object_uses_cinematic_lighting "honor_guard_28" true)
        (object_uses_cinematic_lighting "honor_guard_29" true)
        (object_uses_cinematic_lighting "honor_guard_30" true)
    )
)

(script static void x04_03b_setup
    (begin
        (object_create_anew_containing "honor_guard")
        (wake x04_foley_03b)
        (wake x04_cinematic_lighting_03b)
    )
)

(script static void x04_scene_03b
    (begin
        (x04_03b_setup)
        (camera_pan 60.0 0)
        (print "fov change: 80 -> 60 over 0 ticks")
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_03b" none "anchor_flag_x04a")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_03b" false "anchor_x04a")
        (custom_animation_relative "tartarus" "objects\characters\brute\x04\x04" "tartarus_03b" false "anchor_x04a")
        (custom_animation_relative "brute_01" "objects\characters\brute\x04\x04" "brute01_03b" false "anchor_x04a")
        (custom_animation_relative "brute_02" "objects\characters\brute\x04\x04" "brute02_03b" false "anchor_x04a")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x04\x04" "hammer_03b" "anchor_x04a")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_04_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_04_fol")
        (sleep (- (camera_set_pan) 30.0))
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_screen_effect_stop 2.0)
        (print "crossfade")
        (sleep 5)
        (object_destroy_containing "honor_guard")
    )
)

(script dormant void x04_foley_04
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_04_fol" none 1.0)
        (print "x04 foley 04 start")
    )
)

(script dormant void x04_cinematic_lighting_scene_04
    (begin
        (cinematic_lighting_set_primary_light 65.0 0.0 0.24 0.24 0.31)
        (cinematic_lighting_set_secondary_light 0.0 26.0 0.21 0.18 0.15)
        (cinematic_lighting_set_ambient_light 0.05 0.05 0.05)
        (object_uses_cinematic_lighting "truth" true)
        (object_uses_cinematic_lighting "mercy" true)
        (object_uses_cinematic_lighting "throne_truth" true)
        (object_uses_cinematic_lighting "throne_mercy" true)
        (object_uses_cinematic_lighting "sarcophagus" true)
    )
)

(script static void x04_04_setup
    (begin
        (object_create_anew "truth")
        (object_create_anew "mercy")
        (object_create_anew_containing "throne")
        (object_create_anew "sarcophagus")
        (object_cinematic_lod "truth" true)
        (object_cinematic_lod "mercy" true)
        (object_cinematic_lod "throne_truth" true)
        (object_cinematic_lod "throne_mercy" true)
        (objects_attach "truth" "driver" "throne_truth" "driver_cinematic")
        (objects_attach "mercy" "driver" "throne_mercy" "driver_cinematic")
        (wake x04_foley_04)
        (wake x04_cinematic_lighting_scene_04)
    )
)

(script static void x04_scene_04
    (begin
        (x04_04_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_04" none "anchor_flag_x04b")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_04" false "anchor_x04b")
        (custom_animation_relative "tartarus" "objects\characters\brute\x04\x04" "tartarus_04" false "anchor_x04b")
        (custom_animation_relative "truth" "objects\characters\prophet\x04\x04" "truth_04" false "anchor_x04b")
        (custom_animation_relative "mercy" "objects\characters\prophet\x04\x04" "mercy_04" false "anchor_x04b")
        (custom_animation_relative "brute_01" "objects\characters\brute\x04\x04" "brute01_04" false "anchor_x04b")
        (custom_animation_relative "brute_02" "objects\characters\brute\x04\x04" "brute02_04" false "anchor_x04b")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x04\x04" "hammer_04" "anchor_x04b")
        (scenery_animation_start_relative "sarcophagus" "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" "x04_04" "anchor_x04b")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_05_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_05_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x04_foley_05
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_05_fol" none 1.0)
        (print "x04 foley 05 start")
    )
)

(script dormant void x04_0090_tar
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0090_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x04_0090_tar" 5.5)
    )
)

(script dormant void x04_0100_pot
    (begin
        (sleep 157)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0100_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0100_pot" 2.0)
    )
)

(script dormant void x04_0110_tar
    (begin
        (sleep 205)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0110_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x04_0110_tar" 2.0)
    )
)

(script dormant void x04_0120_pot
    (begin
        (sleep 242)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0120_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0120_pot" 2.0)
    )
)

(script dormant void x04_0130_tar
    (begin
        (sleep 385)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0130_tar" "tartarus" 1.0)
        (attract_mode_set_seconds "x04_0130_tar" 1.5)
    )
)

(script dormant void x04_0140_pot
    (begin
        (sleep 554)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0140_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0140_pot" 5.0)
    )
)

(script dormant void x04_0150_pot
    (begin
        (sleep 731)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0150_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0150_pot" 4.0)
    )
)

(script dormant void x04_05_dof_1
    (begin
        (sleep 708)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.0 0.001 0.5 0.5 0.001)
        (print "rack focus")
    )
)

(script dormant void x04_cinematic_lighting_scene_05
    (begin
        (cinematic_lighting_set_primary_light -41.0 270.0 0.25 0.32 0.52)
        (cinematic_lighting_set_secondary_light 58.0 78.0 0.21 0.11 0.22)
        (cinematic_lighting_set_ambient_light 0.06 0.05 0.04)
        (render_lights_enable_cinematic_shadow true "dervish" "head" 0.2)
        (render_lights_enable_cinematic_shadow true "truth" "head" 0.2)
        (render_lights_enable_cinematic_shadow true "mercy" "head" 0.2)
        (render_lights_enable_cinematic_shadow true "tartarus" "head" 0.2)
    )
)

(script static void x04_05_setup
    (begin
        (wake x04_foley_05)
        (wake x04_0090_tar)
        (wake x04_0100_pot)
        (wake x04_0110_tar)
        (wake x04_0120_pot)
        (wake x04_0130_tar)
        (wake x04_0140_pot)
        (wake x04_0150_pot)
        (wake x04_cinematic_lighting_scene_05)
    )
)

(script static void x04_05_cleanup
    (begin
        (object_destroy "tartarus")
        (object_destroy "brute_01")
        (object_destroy "brute_02")
        (object_destroy "hammer")
    )
)

(script static void x04_scene_05
    (begin
        (x04_05_setup)
        (cinematic_set_environment_map_attenuation 0.05)
        (print "setting near distance to .05")
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_05" none "anchor_flag_x04b")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_05" false "anchor_x04b")
        (custom_animation_relative "tartarus" "objects\characters\brute\x04\x04" "tartarus_05" false "anchor_x04b")
        (custom_animation_relative "truth" "objects\characters\prophet\x04\x04" "truth_05" false "anchor_x04b")
        (custom_animation_relative "brute_01" "objects\characters\brute\x04\x04" "brute01_05" false "anchor_x04b")
        (custom_animation_relative "brute_02" "objects\characters\brute\x04\x04" "brute02_05" false "anchor_x04b")
        (scenery_animation_start_relative "hammer" "objects\weapons\melee\gravity_hammer\x04\x04" "hammer_05" "anchor_x04b")
        (scenery_animation_start_relative "sarcophagus" "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" "x04_05" "anchor_x04b")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_06_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\music\06_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_06_fol")
        (sleep (camera_set_pan))
        (x04_05_cleanup)
    )
)

(script dormant void x04_score_06
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\music\06_mus" none 1.0)
        (print "x04 score 06 start")
    )
)

(script dormant void x04_foley_06
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_06_fol" none 1.0)
        (print "x04 foley 06 start")
    )
)

(script dormant void x04_0160_der
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0160_der" "dervish" 1.0)
        (attract_mode_set_seconds "x04_0160_der" 2.0)
    )
)

(script dormant void x04_0170_pot
    (begin
        (sleep 46)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0170_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0170_pot" 1.25)
    )
)

(script dormant void x04_0180_pot
    (begin
        (sleep 104)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0180_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0180_pot" 2.0)
    )
)

(script dormant void x04_0190_der
    (begin
        (sleep 152)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0190_der" "dervish" 1.0)
        (attract_mode_set_seconds "x04_0190_der" 3.0)
    )
)

(script dormant void x04_0200_pot
    (begin
        (sleep 237)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0200_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0200_pot" 1.25)
    )
)

(script dormant void x04_0210_pot
    (begin
        (sleep 301)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0210_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0210_pot" 11.0)
    )
)

(script dormant void x04_0220_pom
    (begin
        (sleep 624)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0220_pom" "mercy" 1.0)
        (attract_mode_set_seconds "x04_0220_pom" 8.25)
    )
)

(script dormant void x04_0230_der
    (begin
        (sleep 851)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0230_der" "dervish" 1.0)
        (attract_mode_set_seconds "x04_0230_der" 3.5)
    )
)

(script dormant void x04_0240_pot
    (begin
        (sleep 955)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0240_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0240_pot" 10.0)
    )
)

(script dormant void x04_06_dof_1
    (begin
        (sleep 0)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
        (sleep 280)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.0 0.0 0.5 0.5 0.0)
        (print "rack focus")
        (sleep 118)
        (cinematic_screen_effect_set_crossfade true)
        (cinematic_screen_effect_set_crossfade2 2.0 0.5 0.5 1.0 0.0 0.0 1.0)
        (print "rack focus")
        (sleep 87)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.0 0.001 0.0 0.0 0.001)
        (print "rack focus")
        (sleep 230)
        (cinematic_screen_effect_set_crossfade2 2.0 0.0 0.0 0.001 0.5 0.5 0.001)
        (print "rack focus")
        (sleep 179)
        (cinematic_set_far_clip_distance)
        (print "rack focus stop")
    )
)

(script static void x04_06_setup
    (begin
        (object_destroy_containing "brute")
        (wake x04_score_06)
        (wake x04_foley_06)
        (wake x04_0160_der)
        (wake x04_0170_pot)
        (wake x04_0180_pot)
        (wake x04_0190_der)
        (wake x04_0200_pot)
        (wake x04_0210_pot)
        (wake x04_0220_pom)
        (wake x04_0230_der)
        (wake x04_0240_pot)
    )
)

(script static void x04_scene_06
    (begin
        (x04_06_setup)
        (cinematic_set_environment_map_attenuation 0.06)
        (print "resetting near distance to .06")
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_06" none "anchor_flag_x04b")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_06" false "anchor_x04b")
        (custom_animation_relative "truth" "objects\characters\prophet\x04\x04" "truth_06" false "anchor_x04b")
        (custom_animation_relative "mercy" "objects\characters\prophet\x04\x04" "mercy_06" false "anchor_x04b")
        (scenery_animation_start_relative "sarcophagus" "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" "x04_06" "anchor_x04b")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_07_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_07_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x04_foley_07
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_07_fol" none 1.0)
        (print "x04 foley 07 start")
    )
)

(script dormant void x04_0250_pot
    (begin
        (sleep 172)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0250_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0250_pot" 8.0)
    )
)

(script dormant void x04_0260_hld
    (begin
        (sleep 400)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0260_her" "heretic_leader_holo_01" 1.0)
        (attract_mode_set_seconds "x04_0260_her" 10.5)
    )
)

(script dormant void x04_0270_pot
    (begin
        (sleep 719)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0270_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0270_pot" 5.0)
    )
)

(script dormant void x04_0280_pom
    (begin
        (sleep 872)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0280_pom" "mercy" 1.0)
        (attract_mode_set_seconds "x04_0280_pom" 3.5)
    )
)

(script static void x04_07_setup
    (begin
        (object_create_anew "heretic_leader_holo_01")
        (object_cinematic_lod "heretic_leader_holo_01" true)
        (wake x04_foley_07)
        (wake x04_0250_pot)
        (wake x04_0260_hld)
        (wake x04_0270_pot)
        (wake x04_0280_pom)
    )
)

(script static void x04_scene_07
    (begin
        (x04_07_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_07" none "anchor_flag_x04b")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_07" false "anchor_x04b")
        (custom_animation_relative "truth" "objects\characters\prophet\x04\x04" "truth_07" false "anchor_x04b")
        (custom_animation_relative "mercy" "objects\characters\prophet\x04\x04" "mercy_07" false "anchor_x04b")
        (custom_animation_relative "heretic_leader_holo_01" "objects\characters\heretic\x04\x04" "heretic_07" false "anchor_x04b")
        (scenery_animation_start_relative "sarcophagus" "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" "x04_07" "anchor_x04b")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_08_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\music\08_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_08_fol")
        (sleep (camera_set_pan))
        (object_destroy "heretic_leader_holo_01")
    )
)

(script dormant void x04_score_08
    (begin
        (sleep 419)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\music\08_mus" none 1.0)
        (print "x04 score 08 start")
    )
)

(script dormant void x04_foley_08
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_08_fol" none 1.0)
        (print "x04 foley 08 start")
    )
)

(script dormant void x04_0290_der
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0290_der" "dervish" 1.0)
        (attract_mode_set_seconds "x04_0290_der" 5.0)
    )
)

(script dormant void x04_0300_pot
    (begin
        (sleep 157)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0300_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0300_pot" 5.0)
    )
)

(script dormant void x04_0310_pot
    (begin
        (sleep 312)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0310_pot" "truth" 1.0)
        (attract_mode_set_seconds "x04_0310_pot" 6.0)
        (unit_set_emotional_state "truth" "happy" 0.75 60)
    )
)

(script static void x04_08_setup
    (begin
        (wake x04_score_08)
        (wake x04_foley_08)
        (wake x04_0290_der)
        (wake x04_0300_pot)
        (wake x04_0310_pot)
    )
)

(script static void x04_scene_08
    (begin
        (cinematic_set_far_clip_distance)
        (x04_08_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_08" none "anchor_flag_x04b")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_08" false "anchor_x04b")
        (custom_animation_relative "truth" "objects\characters\prophet\x04\x04" "truth_08" false "anchor_x04b")
        (custom_animation_relative "mercy" "objects\characters\prophet\x04\x04" "mercy_08" false "anchor_x04b")
        (scenery_animation_start_relative "sarcophagus" "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" "x04_08" "anchor_x04b")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_09_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_09_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x04_foley_09
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_09_fol" none 1.0)
        (print "x04 foley 09 start")
    )
)

(script dormant void x04_0320_der
    (begin
        (sleep 63)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0320_der" "dervish" 1.0)
        (attract_mode_set_seconds "x04_0320_der" 1.25)
    )
)

(script dormant void x04_0330_pom
    (begin
        (sleep 100)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0330_pom" "mercy" 1.0)
        (attract_mode_set_seconds "x04_0330_pom" 12.0)
    )
)

(script static void x04_09_setup
    (begin
        (wake x04_foley_09)
        (wake x04_0320_der)
        (wake x04_0330_pom)
    )
)

(script static void x04_scene_09
    (begin
        (x04_09_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_09" none "anchor_flag_x04b")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_09" false "anchor_x04b")
        (custom_animation_relative "truth" "objects\characters\prophet\x04\x04" "truth_09" false "anchor_x04b")
        (custom_animation_relative "mercy" "objects\characters\prophet\x04\x04" "mercy_09" false "anchor_x04b")
        (scenery_animation_start_relative "sarcophagus" "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" "x04_09" "anchor_x04b")
        (sleep (- (camera_set_pan) prediction_offset))
        (x04_10_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\music\10_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\x04\foley\x04_10_fol")
        (sleep (camera_set_pan))
    )
)

(script dormant void x04_score_10
    (begin
        (sleep 538)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\music\10_mus" none 1.0)
        (print "x04 score 10 start")
    )
)

(script dormant void x04_foley_10
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\x04\foley\x04_10_fol" none 1.0)
        (print "x04 foley 10 start")
    )
)

(script dormant void x04_0370_der
    (begin
        (sleep 566)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\x04_0340_der" "dervish" 1.0)
        (attract_mode_set_seconds "x04_0340_der" 3.0)
    )
)

(script static void x04_10_setup
    (begin
        (wake x04_score_10)
        (wake x04_foley_10)
        (wake x04_0370_der)
    )
)

(script static void x04_10_cleanup
    (begin
        (object_destroy "dervish")
        (object_destroy "truth")
        (object_destroy "mercy")
        (object_destroy_containing "throne")
        (object_destroy "sarcophagus")
    )
)

(script static void x04_scene_10
    (begin
        (x04_10_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\x04\x04" "x04_10" none "anchor_flag_x04b")
        (custom_animation_relative "dervish" "objects\characters\dervish\x04\x04" "dervish_10" false "anchor_x04b")
        (custom_animation_relative "truth" "objects\characters\prophet\x04\x04" "truth_10" false "anchor_x04b")
        (custom_animation_relative "mercy" "objects\characters\prophet\x04\x04" "mercy_10" false "anchor_x04b")
        (scenery_animation_start_relative "sarcophagus" "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" "x04_10" "anchor_x04b")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_stop 0.0 0.0 0.0 5)
        (sleep 5)
        (x04_10_cleanup)
    )
)

(script static void x04
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash high_4_cinematic)
        (sleep 1)
        (x04_scene_01)
        (x04_scene_02a)
        (x04_scene_02b)
        (x04_scene_03b)
        (x04_scene_04)
        (x04_scene_05)
        (x04_scene_06)
        (x04_scene_07)
        (x04_scene_08)
        (x04_scene_09)
        (x04_scene_10)
        (sleep 30)
    )
)

(script dormant void c04_intro_sound_scene1_01
    (begin
        (object_set_function_variable "phantom01" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom02" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom03" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom01" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom02" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom03" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom01" "hover_audio" 1.0 0.0)
        (object_set_function_variable "phantom02" "hover_audio" 1.0 0.0)
        (object_set_function_variable "phantom03" "hover_audio" 1.0 0.0)
        (sound_class_enable_ducker "vehicle" 0.0 0)
        (sound_class_enable_ducker "vehicle" 1.0 90)
        (object_set_velocity "phantom01" 30.0)
        (object_set_velocity "phantom02" 30.0)
        (object_set_velocity "phantom03" 30.0)
        (sleep 105)
        (sound_class_enable_ducker "vehicle" 0.0 150)
    )
)

(script dormant void c04_intro_foley_01
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intro\foley\c04_intro_01_fol" none 1.0)
        (print "c04_intro foley 01 start")
    )
)

(script dormant void c04_1010_soc
    (begin
        (sleep 95)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1010_soc" none 1.0)
        (attract_mode_set_seconds "c04_1010_soc" 2.0)
    )
)

(script dormant void c04_1020_sec
    (begin
        (sleep 167)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1020_sec" none 1.0)
        (attract_mode_set_seconds "c04_1020_sec" 4.0)
    )
)

(script dormant void c04_1030_soc
    (begin
        (sleep 279)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1030_soc" none 1.0)
        (attract_mode_set_seconds "c04_1030_soc" 6.0)
    )
)

(script dormant void c04_intro_cinematic_lighting_01
    (begin
        (cinematic_lighting_set_primary_light -64.0 276.0 0.427451 0.337255 0.337255)
        (cinematic_lighting_set_secondary_light -73.0 160.0 0.117647 0.117647 0.176471)
        (cinematic_lighting_set_ambient_light 0.0156863 0.0156863 0.0156863)
        (rasterizer_bloom_override_box_factor 0.6)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "phantom01" true)
        (object_uses_cinematic_lighting "phantom02" true)
        (object_uses_cinematic_lighting "phantom03" true)
    )
)

(script static void c04_intro_01_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "phantom01")
        (object_create_anew "phantom02")
        (object_create_anew "phantom03")
        (object_create_anew "matte_high_charity")
        (object_create_anew "matte_threshold")
        (object_create_anew "matte_halo_01")
        (object_create_anew "stardust_01")
        (object_create_anew "stardust_02")
        (object_cinematic_lod "phantom01" true)
        (object_cinematic_lod "phantom02" true)
        (object_cinematic_lod "phantom03" true)
    )
)

(script static void c04_intro_02a_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "dervish02")
        (object_create_anew "commander")
        (object_create_anew "elite01")
        (object_create_anew "elite02")
        (object_create_anew "elite03")
        (object_create_anew "elite04")
        (object_create_anew "elite05")
        (object_create_anew "elite06")
        (object_create_anew "elite07")
        (object_create_anew "grunt01")
        (object_create_anew "grunt02")
        (object_create_anew "grunt03")
        (object_create_anew "grunt04")
        (object_create_anew "phantom_int")
        (object_cinematic_lod "dervish02" true)
        (object_cinematic_lod "commander" true)
        (object_cinematic_lod "elite01" true)
        (object_cinematic_lod "elite02" true)
        (object_cinematic_lod "elite03" true)
        (object_cinematic_lod "elite04" true)
        (object_cinematic_lod "elite05" true)
        (object_cinematic_lod "elite06" true)
        (object_cinematic_lod "elite07" true)
        (object_cinematic_lod "grunt01" true)
        (object_cinematic_lod "grunt02" true)
        (object_cinematic_lod "grunt03" true)
        (object_cinematic_lod "grunt04" true)
        (object_cinematic_lod "phantom_int" true)
    )
)

(script static void c04_intro_01_setup
    (begin
        (wake c04_intro_foley_01)
        (wake c04_1010_soc)
        (wake c04_1020_sec)
        (wake c04_1030_soc)
        (wake c04_intro_sound_scene1_01)
        (wake c04_intro_cinematic_lighting_01)
    )
)

(script static void c04_intro_01_cleanup
    (begin
        (object_destroy "intro_fleet")
        (object_destroy_containing "stardust")
        (object_destroy_containing "matte")
    )
)

(script static void c04_intro_01
    (begin
        (cinematic_stop 0.0 0.0 0.0 0)
        (object_create_anew "intro_fleet")
        (camera_control true)
        (set_pjl_effect "gasgiant_intro")
        (cinematic_skip_start_internal)
        (set cinematic_letterbox_style 1)
        (camera_pan 60.0 0)
        (04_intro_01_predict_stub)
        (sound_impulse_start "sound\cinematics\03_earthcity\c03_intro\foley\c03_intro_03_fol")
        (c04_intro_01_problem_actors)
        (sleep prediction_offset)
        (c04_intro_01_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_01" none "cinematic_anchor03")
        (custom_animation_relative "phantom01" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom01_01" false "anchor03")
        (custom_animation_relative "phantom02" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom02_01" false "anchor03")
        (custom_animation_relative "phantom03" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom03_01" false "anchor03")
        (scenery_animation_start_relative "matte_high_charity" "objects\cinematics\matte_paintings\high_charity_exterior\04_intro\04_intro" "high_charity_exterior_01" "anchor03")
        (scenery_animation_start_relative "matte_threshold" "objects\cinematics\matte_paintings\threshold_space\04_intro\04_intro" "threshold_01" "anchor03")
        (scenery_animation_start_relative "matte_halo_01" "objects\cinematics\matte_paintings\halo_destroyed_03\04_intro\04_intro" "halo_destroyed03_01" "anchor03")
        (scenery_animation_start_relative "stardust_01" "objects\cinematics\matte_paintings\high_charity_stardust\04_intro\04_intro" "stardust01_01" "anchor03")
        (scenery_animation_start_relative "stardust_02" "objects\cinematics\matte_paintings\high_charity_stardust\04_intro\04_intro" "stardust01_02" "anchor03")
        (cinematic_start 0.0 0.0 0.0 30)
        (sleep (- (camera_set_pan) prediction_offset))
        (04_intro_02a_predict_stub)
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c04_intro_01_cleanup)
    )
)

(script dormant void c04_intro_sound_scene2a_01
    (begin
        (object_set_function_variable "phantom_int" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_int" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_int" "hover_audio" 1.0 0.0)
        (sound_class_enable_ducker "vehicle" 0.5 15)
    )
)

(script dormant void c04_intro_sound_scene2a_02
    (begin
        (sleep 720)
        (sound_class_enable_ducker "vehicle" 0.0 15)
    )
)

(script dormant void c04_1040_sec
    (begin
        (sleep 169)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1040_sec" none 1.0)
        (attract_mode_set_seconds "c04_1040_sec" 2.0)
    )
)

(script dormant void c04_1050_soc
    (begin
        (sleep 239)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1050_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_1050_soc" 6.0)
    )
)

(script dormant void c04_1060_soc
    (begin
        (sleep 400)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1060_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_1060_soc" 5.0)
    )
)

(script dormant void c04_1070_sog
    (begin
        (sleep 552)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1070_sog" none 1.0)
        (attract_mode_set_seconds "c04_1070_sog" 1.0)
        (print "which grunt is this?")
    )
)

(script dormant void c04_intro_02a_fov
    (begin
        (sleep 237)
        (camera_pan 60.0 0)
        (print "fov change: 80 -> 60 over 0 ticks")
    )
)

(script dormant void c04_intro_cinematic_light_02a
    (begin
        (cinematic_lighting_set_primary_light -90.0 0.0 0.23 0.29 0.53)
        (cinematic_lighting_set_secondary_light -90.0 192.0 0.16 0.1 0.19)
        (cinematic_lighting_set_ambient_light 0.07 0.05 0.08)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "dervish02" true)
        (object_uses_cinematic_lighting "commander" true)
        (object_uses_cinematic_lighting "elite01" true)
        (object_uses_cinematic_lighting "elite02" true)
        (object_uses_cinematic_lighting "elite03" true)
        (object_uses_cinematic_lighting "elite04" true)
        (object_uses_cinematic_lighting "elite05" true)
        (object_uses_cinematic_lighting "elite06" true)
        (object_uses_cinematic_lighting "elite07" true)
        (object_uses_cinematic_lighting "grunt01" true)
        (object_uses_cinematic_lighting "grunt02" true)
        (object_uses_cinematic_lighting "grunt03" true)
        (object_uses_cinematic_lighting "grunt04" true)
        (object_uses_cinematic_lighting "phantom_int" true)
    )
)

(script static void c04_intro_02a_setup
    (begin
        (object_create_anew "dervish02")
        (object_create_anew "commander")
        (object_create_anew "elite01")
        (object_create_anew "elite02")
        (object_create_anew "elite03")
        (object_create_anew "elite04")
        (object_create_anew "elite05")
        (object_create_anew "elite06")
        (object_create_anew "elite07")
        (object_create_anew "grunt01")
        (object_create_anew "grunt02")
        (object_create_anew "grunt03")
        (object_create_anew "grunt04")
        (object_create_anew "phantom_int")
        (object_cinematic_lod "dervish02" true)
        (object_cinematic_lod "commander" true)
        (object_cinematic_lod "elite01" true)
        (object_cinematic_lod "elite02" true)
        (object_cinematic_lod "elite03" true)
        (object_cinematic_lod "elite04" true)
        (object_cinematic_lod "elite05" true)
        (object_cinematic_lod "elite06" true)
        (object_cinematic_lod "elite07" true)
        (object_cinematic_lod "grunt01" true)
        (object_cinematic_lod "grunt02" true)
        (object_cinematic_lod "grunt03" true)
        (object_cinematic_lod "grunt04" true)
        (object_cinematic_lod "phantom_int" true)
        (object_create_anew "beam_rifle01")
        (object_create_anew "plasma_rifle01")
        (object_create_anew "plasma_rifle02")
        (object_create_anew "plasma_rifle03")
        (object_create_anew "plasma_rifle04")
        (object_create_anew "plasma_rifle05")
        (object_create_anew "plasma_rifle06")
        (object_create_anew "plasma_pistol01")
        (object_create_anew "plasma_pistol02")
        (object_create_anew "plasma_pistol03")
        (object_create_anew "plasma_pistol04")
        (objects_attach "elite05" "right_hand_elite" "beam_rifle01" "")
        (objects_attach "elite01" "right_hand_elite" "plasma_rifle01" "")
        (objects_attach "elite02" "right_hand_elite" "plasma_rifle02" "")
        (objects_attach "elite03" "right_hand_elite" "plasma_rifle03" "")
        (objects_attach "elite04" "right_hand_elite" "plasma_rifle04" "")
        (objects_attach "elite06" "right_hand_elite" "plasma_rifle05" "")
        (objects_attach "elite07" "right_hand_elite" "plasma_rifle06" "")
        (objects_attach "grunt01" "right_hand" "plasma_pistol01" "")
        (objects_attach "grunt01" "right_hand" "plasma_pistol02" "")
        (objects_attach "grunt01" "right_hand" "plasma_pistol03" "")
        (objects_attach "grunt01" "right_hand" "plasma_pistol04" "")
        (wake c04_intro_sound_scene2a_01)
        (wake c04_intro_sound_scene2a_02)
        (wake c04_1040_sec)
        (wake c04_1050_soc)
        (wake c04_1060_soc)
        (wake c04_1070_sog)
        (wake c04_intro_02a_fov)
        (wake c04_intro_cinematic_light_02a)
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
    )
)

(script static void c04_intro_02a_cleanup
    (begin
        (object_destroy "elite03")
        (object_destroy "elite06")
        (object_destroy "elite07")
    )
)

(script static void c04_intro_02a
    (begin
        (04_intro_02a_predict_stub)
        (c04_intro_02a_setup)
        (camera_pan 80.0 0)
        (print "fov change: 60 -> 80 over 0 ticks")
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_02a" none "cinematic_anchor03")
        (custom_animation_relative "dervish02" "objects\characters\dervish\04_intro\04_intro" "dervish_02a" false "anchor03")
        (custom_animation_relative "commander" "objects\characters\elite\04_intro\04_intro" "commander_02a" false "anchor03")
        (custom_animation_relative "elite01" "objects\characters\elite\04_intro\04_intro" "elite01_02a" false "anchor03")
        (custom_animation_relative "elite02" "objects\characters\elite\04_intro\04_intro" "elite02_02a" false "anchor03")
        (custom_animation_relative "elite03" "objects\characters\elite\04_intro\04_intro" "elite03_02a" false "anchor03")
        (custom_animation_relative "elite04" "objects\characters\elite\04_intro\04_intro" "elite04_02a" false "anchor03")
        (custom_animation_relative "elite05" "objects\characters\elite\04_intro\04_intro" "elite05_02a" false "anchor03")
        (custom_animation_relative "elite06" "objects\characters\elite\04_intro\04_intro" "elite06_02a" false "anchor03")
        (custom_animation_relative "elite07" "objects\characters\elite\04_intro\04_intro" "elite07_02a" false "anchor03")
        (custom_animation_relative "grunt01" "objects\characters\grunt\04_intro\04_intro" "grunt01_02a" false "anchor03")
        (custom_animation_relative "grunt02" "objects\characters\grunt\04_intro\04_intro" "grunt02_02a" false "anchor03")
        (custom_animation_relative "grunt03" "objects\characters\grunt\04_intro\04_intro" "grunt03_02a" false "anchor03")
        (custom_animation_relative "grunt04" "objects\characters\grunt\04_intro\04_intro" "grunt04_02a" false "anchor03")
        (scenery_animation_start_relative "phantom_int" "objects\vehicles\phantom\cinematics\04_intro\04_intro" "phantom_int_02a" "anchor03")
        (sleep 5)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (04_intro_02b_predict_stub)
        (sleep (camera_set_pan))
        (c04_intro_02a_cleanup)
    )
)

(script dormant void c04_1080_sec
    (begin
        (sleep 5)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1080_sec" none 1.0)
        (attract_mode_set_seconds "c04_1080_sec" 3.0)
    )
)

(script dormant void c04_1090_soc
    (begin
        (sleep 83)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1090_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_1090_soc" 3.0)
    )
)

(script static void c04_intro_02b_setup
    (begin
        (wake c04_1080_sec)
        (wake c04_1090_soc)
    )
)

(script static void c04_intro_02b_cleanup
    (begin
        (object_hide "phantom_int" true)
        (object_destroy "elite01")
        (object_destroy "elite02")
        (object_destroy "elite04")
        (object_destroy "elite05")
        (object_destroy "grunt01")
        (object_destroy "grunt02")
        (object_destroy "grunt03")
        (object_destroy "grunt04")
    )
)

(script static void c04_intro_02b
    (begin
        (c04_intro_02b_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_02b" none "cinematic_anchor03")
        (custom_animation_relative "dervish02" "objects\characters\dervish\04_intro\04_intro" "dervish_02b" false "anchor03")
        (custom_animation_relative "commander" "objects\characters\elite\04_intro\04_intro" "commander_02b" false "anchor03")
        (custom_animation_relative "elite01" "objects\characters\elite\04_intro\04_intro" "elite01_02b" false "anchor03")
        (custom_animation_relative "elite02" "objects\characters\elite\04_intro\04_intro" "elite02_02b" false "anchor03")
        (custom_animation_relative "elite04" "objects\characters\elite\04_intro\04_intro" "elite04_02b" false "anchor03")
        (custom_animation_relative "elite05" "objects\characters\elite\04_intro\04_intro" "elite05_02b" false "anchor03")
        (custom_animation_relative "grunt01" "objects\characters\grunt\04_intro\04_intro" "grunt01_02b" false "anchor03")
        (custom_animation_relative "grunt02" "objects\characters\grunt\04_intro\04_intro" "grunt02_02b" false "anchor03")
        (custom_animation_relative "grunt03" "objects\characters\grunt\04_intro\04_intro" "grunt03_02b" false "anchor03")
        (custom_animation_relative "grunt04" "objects\characters\grunt\04_intro\04_intro" "grunt04_02b" false "anchor03")
        (scenery_animation_start_relative "phantom_int" "objects\vehicles\phantom\cinematics\04_intro\04_intro" "phantom_int_02b" "anchor03")
        (sleep (- (camera_set_pan) prediction_offset))
        (04_intro_02c_predict_stub)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intro\music\c04_02c_mus")
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intro\foley\c04_intro_02c_fol")
        (sleep (camera_set_pan))
        (c04_intro_02b_cleanup)
    )
)

(script dormant void c04_intro_sound_scene2c_01
    (begin
        (sound_class_enable_ducker "vehicle" 1.0 80)
    )
)

(script dormant void c04_intro_sound_scene2c_02
    (begin
        (sleep 90)
        (sound_class_enable_ducker "vehicle" 0.0 10)
    )
)

(script dormant void c04_intro_score_02c
    (begin
        (sleep 101)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intro\music\c04_02c_mus" none 1.0)
        (print "c04_intro score 02c start")
    )
)

(script dormant void c04_intro_foley_02c
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intro\foley\c04_intro_02c_fol" none 1.0)
        (print "c04_intro foley 02c start")
    )
)

(script dormant void c04_intro_cinematic_light_02c
    (begin
        (cinematic_lighting_set_primary_light 24.0 294.0 0.35 0.39 0.24)
        (cinematic_lighting_set_secondary_light 19.0 22.0 0.0 0.0 0.0)
        (cinematic_lighting_set_ambient_light 0.18 0.14 0.14)
        (rasterizer_bloom_override_box_factor 0.4)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "phantom01" true)
        (object_uses_cinematic_lighting "phantom02" true)
        (object_uses_cinematic_lighting "phantom03" true)
    )
)

(script static void c04_intro_02c_setup
    (begin
        (hud_blink_health 0.0)
        (object_create_anew "matte_structure_top")
        (wake c04_intro_sound_scene2c_01)
        (wake c04_intro_sound_scene2c_02)
        (wake c04_intro_score_02c)
        (wake c04_intro_foley_02c)
        (wake c04_intro_cinematic_light_02c)
    )
)

(script static void c04_intro_02c
    (begin
        (c04_intro_02c_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_02c" none "cinematic_anchor03")
        (custom_animation_relative "phantom01" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom01_02c" false "anchor03")
        (custom_animation_relative "phantom02" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom02_02c" false "anchor03")
        (custom_animation_relative "phantom03" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom03_02c" false "anchor03")
        (scenery_animation_start_relative "matte_structure_top" "objects\cinematics\matte_paintings\gas_giant_structure_top\04_intro\04_intro" "gas_giant_structure_top_02c" "anchor03")
        (sleep (- (camera_set_pan) prediction_offset))
        (04_intro_02d_predict_stub)
        (cinematic_screen_effect_set_crossfade true)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intro\foley\c04_intro_02d_fol")
        (sleep (- (camera_set_pan) 5.0))
        (cinematic_screen_effect_stop 2.0)
        (sleep 5)
        (object_destroy "matte_structure_top")
    )
)

(script dormant void c04_intro_sound_scene2d_01
    (begin
        (sound_class_enable_ducker "vehicle" 0.5 15)
    )
)

(script dormant void c04_intro_foley_02d
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intro\foley\c04_intro_02d_fol" none 1.0)
        (print "c04_intro foley 02d start")
    )
)

(script dormant void c04_1100_soc
    (begin
        (sleep 29)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1100_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_1100_soc" 1.0)
    )
)

(script dormant void c04_1110_soc
    (begin
        (sleep 76)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1110_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_1110_soc" 2.0)
    )
)

(script dormant void c04_1120_der
    (begin
        (sleep 127)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1120_der" "dervish02" 1.0)
        (attract_mode_set_seconds "c04_1120_der" 1.0)
    )
)

(script dormant void c04_1130_soc
    (begin
        (sleep 174)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1130_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_1130_soc" 9.0)
    )
)

(script dormant void c04_1140_der
    (begin
        (sleep 430)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1140_der" "dervish02" 1.0)
        (attract_mode_set_seconds "c04_1140_der" 2.0)
    )
)

(script dormant void c04_1150_soc
    (begin
        (sleep 494)
        (sound_impulse_start_effect "sound\dialog\levels\04_gasgiant\cinematic\c04_1150_soc" "commander" 1.0)
        (attract_mode_set_seconds "c04_1150_soc" 1.0)
    )
)

(script dormant void c04_intro_cinematic_light_02d
    (begin
        (cinematic_lighting_set_primary_light -90.0 0.0 0.23 0.29 0.53)
        (cinematic_lighting_set_secondary_light -90.0 192.0 0.16 0.1 0.19)
        (cinematic_lighting_set_ambient_light 0.07 0.05 0.08)
        (rasterizer_bloom_override_box_factor 0.3)
        (rasterizer_bloom_override_max_factor 0.5)
    )
)

(script static void c04_intro_03_problem_actors
    (begin
        (print "problem actors")
        (object_create_anew "matte_structure")
    )
)

(script static void c04_intro_02d_setup
    (begin
        (object_hide "phantom_int" false)
        (wake c04_intro_sound_scene2d_01)
        (wake c04_intro_foley_02d)
        (wake c04_1100_soc)
        (wake c04_1110_soc)
        (wake c04_1120_der)
        (wake c04_1130_soc)
        (wake c04_1140_der)
        (wake c04_1150_soc)
        (wake c04_intro_cinematic_light_02d)
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
    )
)

(script static void c04_intro_02d
    (begin
        (c04_intro_02d_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_02d" none "cinematic_anchor03")
        (custom_animation_relative "dervish02" "objects\characters\dervish\04_intro\04_intro" "dervish_02d" false "anchor03")
        (custom_animation_relative "commander" "objects\characters\elite\04_intro\04_intro" "commander_02d" false "anchor03")
        (scenery_animation_start_relative "phantom_int" "objects\vehicles\phantom\cinematics\04_intro\04_intro" "phantom_int_02d" "anchor03")
        (sleep (- (camera_set_pan) prediction_offset))
        (04_intro_03_predict_stub)
        (cinematic_set_far_clip_distance)
        (sleep (- (camera_set_pan) sound_offset))
        (sound_impulse_start "sound\cinematics\04_alphagas\c04_intro\foley\c04_intro_03_fol")
        (c04_intro_03_problem_actors)
        (sleep (camera_set_pan))
        (object_destroy "dervish02")
        (object_destroy "commander")
        (object_destroy "phantom_int")
    )
)

(script dormant void c04_intro_sound_scene3_01
    (begin
        (sound_class_enable_ducker "vehicle" 0.0 15)
    )
)

(script dormant void c04_intro_sound_scene3_02
    (begin
        (sound_class_enable_ducker "vehicle" 1.0 170)
    )
)

(script dormant void c04_intro_sound_scene3_03
    (begin
        (sleep 180)
        (sound_class_enable_ducker "vehicle" 0.0 120)
    )
)

(script dormant void c04_intro_foley_03
    (begin
        (sleep 0)
        (sound_impulse_start_effect "sound\cinematics\04_alphagas\c04_intro\foley\c04_intro_03_fol" none 1.0)
        (print "c04_intro foley 03 start")
    )
)

(script dormant void c04_1170_elp
    (begin
        (sleep 189)
        (sound_impulse_time "sound\dialog\levels\04_gasgiant\cinematic\c04_1170_elp" none 1.0 "radio_covy_in")
        (attract_mode_set_seconds "c04_1170_elp" 1.0)
    )
)

(script dormant void c04_1180_ecp
    (begin
        (sleep 212)
        (sound_impulse_time "sound\dialog\levels\04_gasgiant\cinematic\c04_1180_elp" none 1.0 "radio_covy_loop")
        (attract_mode_set_seconds "c04_1180_elp" 3.0)
    )
)

(script dormant void c04_1190_soc
    (begin
        (sleep 295)
        (sound_impulse_time "sound\dialog\levels\04_gasgiant\cinematic\c04_1190_soc" none 1.0 "radio_covy_out")
        (attract_mode_set_seconds "c04_1190_soc" 2.0)
    )
)

(script dormant void c04_intro_cinematic_light_03
    (begin
        (cinematic_lighting_set_primary_light -32.0 140.0 0.35 0.39 0.24)
        (cinematic_lighting_set_secondary_light 19.0 22.0 0.0 0.0 0.0)
        (cinematic_lighting_set_ambient_light 0.18 0.14 0.14)
        (rasterizer_bloom_override_box_factor 0.4)
        (rasterizer_bloom_override_max_factor 0.5)
    )
)

(script dormant void c04_intro_shake_03
    (begin
        (sleep 173)
        (print "shake")
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 0.0)
        (hud_blink_health 1.5)
    )
)

(script static void c04_intro_03_setup
    (begin
        (object_create_anew "matte_mine")
        (wake c04_intro_sound_scene3_01)
        (wake c04_intro_sound_scene3_02)
        (wake c04_intro_sound_scene3_03)
        (wake c04_intro_foley_03)
        (wake c04_1170_elp)
        (wake c04_1180_ecp)
        (wake c04_1190_soc)
        (wake c04_intro_shake_03)
        (wake c04_intro_cinematic_light_03)
        (hud_blink_health 0.0)
    )
)

(script static void c04_intro_03_cleanup
    (begin
        (object_destroy "phantom01")
        (object_destroy "phantom02")
        (object_destroy "phantom03")
        (object_destroy_containing "matte")
    )
)

(script static void c04_intro_03
    (begin
        (c04_intro_03_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_03" none "cinematic_anchor03")
        (custom_animation_relative "phantom01" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom01_3" false "anchor03")
        (custom_animation_relative "phantom02" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom02_3" false "anchor03")
        (custom_animation_relative "phantom03" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom03_3" false "anchor03")
        (scenery_animation_start_relative "matte_mine" "objects\cinematics\matte_paintings\gas_giant_exterior\04_intro\04_intro" "gas_giant_exterior_03" "anchor03")
        (scenery_animation_start_relative "matte_structure" "objects\cinematics\matte_paintings\gas_giant_structure\04_intro\04_intro" "gas_giant_structure_03" "anchor03")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep (camera_set_pan))
        (c04_intro_03_cleanup)
    )
)

(script dormant void c04_intro_sound_scene5_01
    (begin
        (object_set_function_variable "phantom_01" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_02" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_03" "engine_hack" 1.0 0.0)
        (object_set_function_variable "phantom_01" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_02" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_03" "engine_audio" 1.0 0.0)
        (object_set_function_variable "phantom_01" "hover_audio" 1.0 0.0)
        (object_set_function_variable "phantom_02" "hover_audio" 1.0 0.0)
        (object_set_function_variable "phantom_03" "hover_audio" 1.0 0.0)
    )
)

(script dormant void c04_intro_05_shake_1
    (begin
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.15 0.0)
        (sleep 401)
        (hud_blink_health 0.0)
    )
)

(script static void c04_intro_05_setup
    (begin
        (object_create_anew "phantom_01")
        (object_create_anew "phantom_02")
        (object_create_anew "phantom_03")
        (wake c04_intro_sound_scene5_01)
        (wake c04_intro_05_shake_1)
    )
)

(script static void c04_intro_05
    (begin
        (04_intro_05_predict_stub)
        (c04_intro_05_setup)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_05" none "cinematic_anchor02")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom01_05" false "anchor02")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom02_05" false "anchor02")
        (custom_animation_relative "phantom_03" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom03_05" false "anchor02")
        (sleep 15)
        (cinematic_start 1.0 1.0 1.0 15)
        (sleep (- (camera_set_pan) prediction_offset))
        (04_intro_06b_predict_stub)
        (sleep (camera_set_pan))
    )
)

(script dormant void c04_intro_sound_scene6b_01
    (begin
        (sound_class_enable_ducker "vehicle" 1.0 30)
    )
)

(script dormant void c04_intro_sound_scene6b_02
    (begin
        (object_set_function_variable "phantom_01" "engine_hack" 0.0 120.0)
        (object_set_function_variable "phantom_02" "engine_hack" 0.0 120.0)
        (object_set_function_variable "phantom_03" "engine_hack" 0.0 120.0)
        (object_set_function_variable "phantom_01" "engine_audio" 0.0 120.0)
        (object_set_function_variable "phantom_02" "engine_audio" 0.0 120.0)
        (object_set_function_variable "phantom_03" "engine_audio" 0.0 120.0)
        (object_set_function_variable "phantom_01" "hover_audio" 0.0 120.0)
        (object_set_function_variable "phantom_02" "hover_audio" 0.0 120.0)
        (object_set_function_variable "phantom_03" "hover_audio" 0.0 120.0)
    )
)

(script dormant void c04_intro_sound_scene6b_03
    (begin
        (sleep 30)
        (object_set_function_variable "phantom_01" "turn_absolute" 1.0 30.0)
        (object_set_function_variable "phantom_02" "turn_absolute" 1.0 30.0)
        (object_set_function_variable "phantom_03" "turn_absolute" 1.0 30.0)
        (object_set_function_variable "phantom_01" "banking_audio" 1.0 30.0)
        (object_set_function_variable "phantom_02" "banking_audio" 1.0 30.0)
        (object_set_function_variable "phantom_03" "banking_audio" 1.0 30.0)
        (object_set_function_variable "phantom_01" "engine_ducker" 1.0 60.0)
        (object_set_function_variable "phantom_02" "engine_ducker" 1.0 60.0)
        (object_set_function_variable "phantom_03" "engine_ducker" 1.0 60.0)
    )
)

(script dormant void c04_intro_sound_scene6b_04
    (begin
        (sleep 60)
        (object_set_function_variable "phantom_01" "turn_absolute" 0.0 30.0)
        (object_set_function_variable "phantom_02" "turn_absolute" 0.0 30.0)
        (object_set_function_variable "phantom_03" "turn_absolute" 0.0 30.0)
        (object_set_function_variable "phantom_01" "banking_audio" 0.0 30.0)
        (object_set_function_variable "phantom_02" "banking_audio" 0.0 30.0)
        (object_set_function_variable "phantom_03" "banking_audio" 0.0 30.0)
    )
)

(script dormant void c04_intro_sound_scene6b_05
    (begin
        (sleep 210)
        (object_set_function_variable "phantom_01" "engine_hack" 1.0 60.0)
        (object_set_function_variable "phantom_03" "engine_hack" 1.0 60.0)
        (object_set_function_variable "phantom_01" "engine_audio" 1.0 60.0)
        (object_set_function_variable "phantom_03" "engine_audio" 1.0 60.0)
        (object_set_function_variable "phantom_01" "hover_audio" 1.0 60.0)
        (object_set_function_variable "phantom_03" "hover_audio" 1.0 60.0)
        (object_set_function_variable "phantom_01" "engine_ducker" 0.0 60.0)
        (object_set_function_variable "phantom_03" "engine_ducker" 0.0 60.0)
    )
)

(script dormant void c04_intro_sound_scene6b_06
    (begin
        (sleep 315)
        (object_set_function_variable "phantom_02" "engine_hack" 1.0 60.0)
        (object_set_function_variable "phantom_02" "engine_audio" 1.0 60.0)
        (object_set_function_variable "phantom_02" "hover_audio" 1.0 60.0)
        (object_set_function_variable "phantom_02" "engine_ducker" 0.0 60.0)
    )
)

(script dormant void c04_intro_sound_scene6b_07
    (begin
        (sleep 375)
        (sound_class_enable_ducker "vehicle" 0.0 30)
    )
)

(script dormant void c04_1200_soc
    (begin
        (sleep 330)
        (sound_impulse_time "sound\dialog\levels\04_gasgiant\cinematic\c04_1200_soc" none 1.0 "radio_covy")
        (attract_mode_set_seconds "c04_1200_soc" 2.0)
    )
)

(script dormant void c04_intro_06b_fov
    (begin
        (sleep 117)
        (camera_pan 60.0 32)
    )
)

(script dormant void c04_06b_shake_1
    (begin
        (hud_blink_health 0.0)
        (sleep 30)
        (player_effect_start 0.0 1.0 1.0)
        (hud_show_health 0.25 2.0)
        (sleep 60)
        (hud_blink_health 2.0)
    )
)

(script dormant void c04_intro_cinematic_light_06b
    (begin
        (cinematic_lighting_set_primary_light 3.0 234.0 0.4 0.44 0.27)
        (cinematic_lighting_set_secondary_light 19.0 118.0 0.25 0.23 0.15)
        (cinematic_lighting_set_ambient_light 0.07 0.06 0.06)
        (rasterizer_bloom_override_box_factor 0.4)
        (rasterizer_bloom_override_max_factor 0.5)
        (object_uses_cinematic_lighting "phantom_01" true)
        (object_uses_cinematic_lighting "phantom_02" true)
        (object_uses_cinematic_lighting "phantom_03" true)
    )
)

(script dormant void grunt_insertion
    (begin
        (sleep 173)
        (object_create_anew "grunt01")
        (object_create_anew "grunt02")
        (object_create_anew "grunt03")
        (object_create_anew "grunt04")
        (object_cinematic_lod "grunt01" true)
        (object_cinematic_lod "grunt02" true)
        (object_cinematic_lod "grunt03" true)
        (object_cinematic_lod "grunt04" true)
        (object_create_anew "plasma_pistol01")
        (object_create_anew "plasma_pistol02")
        (object_create_anew "plasma_pistol03")
        (object_create_anew "plasma_pistol04")
        (objects_attach "grunt01" "right_hand" "plasma_pistol01" "")
        (objects_attach "grunt01" "right_hand" "plasma_pistol02" "")
        (objects_attach "grunt01" "right_hand" "plasma_pistol03" "")
        (objects_attach "grunt01" "right_hand" "plasma_pistol04" "")
        (object_uses_cinematic_lighting "grunt01" true)
        (object_uses_cinematic_lighting "grunt02" true)
        (object_uses_cinematic_lighting "grunt03" true)
        (object_uses_cinematic_lighting "grunt04" true)
        (custom_animation_relative "grunt01" "objects\characters\grunt\04_intro\04_intro" "grunt01_06b" false "anchor02")
        (custom_animation_relative "grunt02" "objects\characters\grunt\04_intro\04_intro" "grunt02_06b" false "anchor02")
        (custom_animation_relative "grunt03" "objects\characters\grunt\04_intro\04_intro" "grunt03_06b" false "anchor02")
        (custom_animation_relative "grunt04" "objects\characters\grunt\04_intro\04_intro" "grunt04_06b" false "anchor02")
    )
)

(script dormant void elite_insertion
    (begin
        (sleep 179)
        (object_create_anew "elite03")
        (object_create_anew "elite04")
        (object_cinematic_lod "elite03" true)
        (object_cinematic_lod "elite04" true)
        (object_create_anew "plasma_rifle03")
        (object_create_anew "plasma_rifle04")
        (objects_attach "elite03" "right_hand_elite" "plasma_rifle03" "")
        (objects_attach "elite04" "right_hand_elite" "plasma_rifle04" "")
        (object_uses_cinematic_lighting "elite03" true)
        (object_uses_cinematic_lighting "elite04" true)
        (custom_animation_relative "elite03" "objects\characters\elite\04_intro\04_intro" "elite03_06b" false "anchor02")
        (custom_animation_relative "elite04" "objects\characters\elite\04_intro\04_intro" "elite04_06b" false "anchor02")
    )
)

(script dormant void dervish_insertion
    (begin
        (sleep 312)
        (object_create_anew "dervish02")
        (object_create_anew "energy_blade01")
        (object_cinematic_lod "dervish02" true)
        (objects_attach "dervish02" "right_hand_elite" "energy_blade01" "")
        (object_set_permutation "energy_blade01" "blade" "noblade")
        (object_uses_cinematic_lighting "dervish02" true)
        (custom_animation_relative "dervish02" "objects\characters\dervish\04_intro\04_intro" "dervish_06b" false "anchor02")
        (sleep 72)
        (object_set_permutation "energy_blade01" "blade" "default")
        (object_set_function_variable "energy_blade01" "turned_on" 1.0 0.0)
        (effect_new_on_object_marker "effects\objects\weapons\melee\energy_blade\blade_activate_elite" "dervish02" "right_hand_elite")
        (print "blade activate")
    )
)

(script static void test
    (begin
        (print "no blade")
        (object_set_permutation "energy_blade01" "blade" "noblade")
        (sleep 60)
        (object_set_permutation "energy_blade01" "blade" "default")
        (effect_new_on_object_marker "effects\objects\weapons\melee\energy_blade\blade_activate" "energy_blade01" "ground_point")
        (print "blade")
    )
)

(script dormant void elite_01_insertion
    (begin
        (sleep 281)
        (object_create_anew "elite01")
        (object_create_anew "plasma_rifle01")
        (object_cinematic_lod "elite01" true)
        (objects_attach "elite01" "right_hand_elite" "plasma_rifle01" "")
        (object_uses_cinematic_lighting "elite01" true)
        (custom_animation_relative "elite01" "objects\characters\elite\04_intro\04_intro" "elite01_06b" false "anchor02")
    )
)

(script dormant void elite_02_insertion
    (begin
        (sleep 272)
        (object_create_anew "elite02")
        (object_create_anew "plasma_rifle02")
        (object_cinematic_lod "elite02" true)
        (objects_attach "elite02" "right_hand_elite" "plasma_rifle02" "")
        (object_uses_cinematic_lighting "elite02" true)
        (custom_animation_relative "elite02" "objects\characters\elite\04_intro\04_intro" "elite02_06b" false "anchor02")
    )
)

(script static void c04_intro_06b_setup
    (begin
        (wake c04_intro_sound_scene6b_01)
        (wake c04_intro_sound_scene6b_02)
        (wake c04_intro_sound_scene6b_03)
        (wake c04_intro_sound_scene6b_04)
        (wake c04_intro_sound_scene6b_05)
        (wake c04_intro_sound_scene6b_06)
        (wake c04_intro_sound_scene6b_07)
        (wake c04_1200_soc)
        (wake grunt_insertion)
        (wake elite_insertion)
        (wake dervish_insertion)
        (wake elite_01_insertion)
        (wake elite_02_insertion)
        (wake c04_intro_06b_fov)
        (wake c04_06b_shake_1)
        (wake c04_intro_cinematic_light_06b)
    )
)

(script static void c04_intro_06b_cleanup
    (begin
        (object_destroy "dervish02")
        (object_destroy "commander")
        (object_destroy "elite01")
        (object_destroy "elite02")
        (object_destroy "elite03")
        (object_destroy "elite04")
        (object_destroy "grunt01")
        (object_destroy "grunt02")
        (object_destroy "grunt03")
        (object_destroy "grunt04")
        (object_destroy "phantom_01")
        (object_destroy "phantom_02")
        (object_destroy "phantom_03")
    )
)

(script static void c04_intro_06b
    (begin
        (c04_intro_06b_setup)
        (camera_pan 27.5 0)
        (camera_set_animation_relative "objects\characters\cinematic_camera\04_intro\04_intro" "04intro_06b" none "cinematic_anchor02")
        (custom_animation_relative "phantom_01" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom01_06b" false "anchor02")
        (custom_animation_relative "phantom_02" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom02_06b" false "anchor02")
        (custom_animation_relative "phantom_03" "objects\vehicles\phantom\animations\04_intro\04_intro" "phantom03_06b" false "anchor02")
        (sleep (- (camera_set_pan) 15.0))
        (cinematic_stop 1.0 1.0 1.0 15)
        (sleep 15)
        (c04_intro_06b_cleanup)
        (sleep 30)
        (predict_animation)
    )
)

(script static void c04_intro
    (begin
        (sound_cache_flush)
        (animation_cache_flush)
        (crash ag_cinematic_bsp1)
        (sleep 1)
        (c04_intro_01)
        (crash ag_cinematic_bsp2)
        (c04_intro_02a)
        (c04_intro_02b)
        (c04_intro_02c)
        (c04_intro_02d)
        (c04_intro_03)
        (crash alphagasgiant)
        (c04_intro_05)
        (c04_intro_06b)
        (rasterizer_bloom_override_blur_amount false)
    )
)

(script continuous void active_camo_drop
    (begin
        (sleep_until 
            (or
                (> (ai_combat_status "rec_center_heretics") ai_combat_status_uninspected)
                (> (ai_combat_status "hangar_heretics") ai_combat_status_uninspected)
                (> (ai_combat_status "first_hall_heretics") ai_combat_status_uninspected)
                (> (ai_combat_status "underhangar_heretics") ai_combat_status_uninspected)
                (> (ai_combat_status "second_hall_heretics") ai_combat_status_uninspected)
                (> (ai_combat_status "bottling_heretics") ai_combat_status_uninspected)
            )
        )
        (ai_set_active_camo "arm01_allies" false)
        (ai_set_blind "all_enemies" false)
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

(script command_script void snap_alert
    (begin
        (cs_force_combat_status 4)
        (sleep 5)
    )
)

(script command_script void stealth_comment_01
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'quietly now!'")
        (cs_play_line "1020")
    )
)

(script command_script void stealth_comment_02
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'with stealth!'")
        (cs_play_line "1030")
    )
)

(script command_script void stealth_comment_03
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'camouflage engaged!'")
        (cs_play_line "1040")
    )
)

(script command_script void stealth_comment_04
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'an honorable ruse!'")
        (cs_play_line "1050")
    )
)

(script command_script void stealth_comment_05
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'they shall not see me coming!'")
        (cs_play_line "1060")
    )
)

(script command_script void stealth_comment_06
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'i'm invisible!'")
        (cs_play_line "1070")
    )
)

(script command_script void stealth_comment_07
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'no one see me now!'")
        (cs_play_line "1080")
    )
)

(script command_script void stealth_comment_08
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'tricky-tricky!'")
        (cs_play_line "1090")
    )
)

(script command_script void stealth_comment_09
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'where me gun go? oh, right! (laughs)'")
        (cs_play_line "1100")
    )
)

(script command_script void stealth_comment_10
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: '(a la elmer fudd) shhhh! me hunting he-wa-tics!'")
        (cs_play_line "1110")
    )
)

(script static void stealth_comment
    (begin
        (sleep (random_range 10 60))
        (begin_random
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_01_scene" stealth_comment_01 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_02_scene" stealth_comment_02 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_03_scene" stealth_comment_03 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_04_scene" stealth_comment_04 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_05_scene" stealth_comment_05 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_06_scene" stealth_comment_06 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_07_scene" stealth_comment_07 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_08_scene" stealth_comment_08 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_09_scene" stealth_comment_09 "all_allies")
                )
            )
            (if (= stealth_talk_gone true) 
                (begin
                    (set stealth_talk_gone false)
                    (ai_scene "stealth_comment_10_scene" stealth_comment_10 "all_allies")
                )
            )
        )
    )
)

(script dormant void 04a_title0
    (begin
        (cinematic_fade_from_white_bars)
        (sleep 30)
        (cinematic_suppress_bsp_object_creation "title_1")
        (sleep 150)
        (show_hud_help_text 1.0 0.5)
        (cinematic_set_title false)
    )
)

(script dormant void 04a_title1
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

(script dormant void objective_hl_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "locate the heretic leader.")
        (input_suppress_vibration 0)
    )
)

(script dormant void objective_hl_clear
    (begin
        (print "objective complete:")
        (print "locate the heretic leader.")
        (update_remote_camera 0)
    )
)

(script dormant void objective_dogfight_set
    (begin
        (sleep 30)
        (print "new objective set:")
        (print "pursue the heretic leader. neutralize enemy air units.")
        (input_suppress_vibration 1)
    )
)

(script dormant void objective_dogfight_clear
    (begin
        (print "objective complete:")
        (print "pursue the heretic leader. neutralize enemy air units.")
        (update_remote_camera 1)
    )
)

(script dormant void music_04a_01_start
    (begin
        (print "music 04a_01 start")
        (sound_looping_stop_immediately "scenarios\solo\04a_gasgiant\04a_music\04a_01" none 1.0)
    )
)

(script dormant void music_04a_01_stop
    (begin
        (print "music 04a_01 stop")
        (sound_looping_set_scale "scenarios\solo\04a_gasgiant\04a_music\04a_01")
    )
)

(script dormant void music_04a_02_start
    (begin
        (print "music 04a_02 start")
        (sound_looping_stop_immediately "scenarios\solo\04a_gasgiant\04a_music\04a_02" none 1.0)
    )
)

(script dormant void music_04a_02_stop
    (begin
        (print "music 04a_02 stop")
        (sound_looping_set_scale "scenarios\solo\04a_gasgiant\04a_music\04a_02")
    )
)

(script dormant void music_04a_03_start
    (begin
        (print "music 04a_03 start")
        (sound_looping_stop_immediately "scenarios\solo\04a_gasgiant\04a_music\04a_03" none 1.0)
    )
)

(script dormant void music_04a_04_start
    (begin
        (print "music 04a_04 start")
        (sound_looping_stop_immediately "scenarios\solo\04a_gasgiant\04a_music\04a_04" none 1.0)
    )
)

(script dormant void music_04a_04_stop
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_dog_obj_04" (players)) true)
                (= (volume_test_objects "vol_dog_obj_07" (players)) true)
            ) 
        30 8000)
        (print "music 04a_04 stop")
        (sound_looping_set_scale "scenarios\solo\04a_gasgiant\04a_music\04a_04")
    )
)

(script dormant void kill_volumes
    (begin
        (kill_volume_disable "kill_banshee_ledge")
        (kill_volume_disable "kill_recycling_pit")
        (kill_volume_disable "kill_recycling_left")
        (kill_volume_disable "kill_recycling_right")
        (kill_volume_disable "kill_hangar_pit_01")
        (kill_volume_disable "kill_hangar_pit_02")
        (kill_volume_disable "kill_hangar_pit_03")
        (kill_volume_disable "kill_hangar_pit_04")
        (kill_volume_disable "kill_underhangar_pit_01")
        (kill_volume_disable "kill_underhangar_pit_02")
        (kill_volume_disable "kill_bottling_pit_01")
        (kill_volume_disable "kill_bottling_pit_02")
        (sleep_until (= (version) 3))
        (kill_volume_disable "kill_lz_pit")
        (sleep_until 
            (begin
                (sleep_until (= (version) 3))
                (kill_volume_enable "kill_recycling_pit")
                (kill_volume_enable "kill_recycling_left")
                (kill_volume_enable "kill_recycling_right")
                (kill_volume_enable "kill_hangar_pit_01")
                (kill_volume_enable "kill_hangar_pit_02")
                (kill_volume_enable "kill_hangar_pit_03")
                (kill_volume_enable "kill_hangar_pit_04")
                (kill_volume_enable "kill_underhangar_pit_01")
                (kill_volume_enable "kill_underhangar_pit_02")
                (kill_volume_disable "kill_bottling_pit_01")
                (kill_volume_disable "kill_bottling_pit_02")
                (sleep_until (= (version) 0))
                (kill_volume_enable "kill_banshee_ledge")
                (kill_volume_enable "kill_bottling_pit_01")
                (kill_volume_enable "kill_bottling_pit_02")
                (kill_volume_disable "kill_recycling_pit")
                (kill_volume_disable "kill_recycling_left")
                (kill_volume_disable "kill_recycling_right")
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

(script static void prep_return_from_intro
    (begin
        (ai_place "intro_phantom")
        (object_teleport (player0) "player0_start")
        (object_teleport (player1) "player1_start")
        (ai_place "intro_elites")
        (ai_place "allies_elites_01")
        (ai_place "hacker")
        (ai_place "allies_grunts_01")
    )
)

(script dormant void wind
    (begin
        (sleep_until 
            (begin
                (sound_impulse_start_effect "sound\ambience\sound_scenery\gusty_wind\details\gusty_wind" none 1.0)
                (sleep 30)
                (player_effect_start (real_random_range 0.1 1.0) (real_random_range 0.1 1.0) 0.0)
                (hud_show_health (real_random_range 0.05 0.2) (real_random_range 0.5 2.0))
                (hud_blink_health (real_random_range 3.0 5.0))
                (sleep (random_range 300 600))
                (= (version) 3)
            )
        )
    )
)

(script static void windtoo
    (begin
        (sleep_until 
            (begin
                (sound_impulse_start_effect "sound\ambience\sound_scenery\gusty_wind\details\gusty_wind" none 1.0)
                (sleep 30)
                (player_effect_start (real_random_range 0.1 1.0) (real_random_range 0.1 1.0) 0.0)
                (hud_show_health (real_random_range 0.05 0.2) (real_random_range 0.5 2.0))
                (hud_blink_health (real_random_range 3.0 5.0))
                (sleep (random_range 300 600))
                (= (version) 3)
            )
        )
    )
)

(script command_script void lz_phantom_01_away
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_to airspace_lz/exit01 20.0)
        (ai_erase ai_current_actor)
    )
)

(script command_script void lz_phantom_02_away
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_to airspace_lz/exit02 20.0)
        (ai_erase ai_current_actor)
    )
)

(script command_script void lz_phantom_03_away
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_boost true)
        (cs_fly_to airspace_lz/exit03 20.0)
        (ai_erase ai_current_actor)
    )
)

(script dormant void commander_entry_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_entering_facility" (players)) true) 30 900)
        (if 
            (and
                (= (volume_test_objects "vol_entering_facility" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "spec-ops commander: 'my warriors are in position, arbiter. they wait for you to lead them!'")
                    (sleep (ai_play_line_on_object none "0970"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script dormant void commander_comment_03
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'you may wish to do the same, arbiter.'")
        (sleep (ai_play_line_on_object none "1000"))
        (sleep 30)
        (print "'but, take heed. your armor's system is not as…new as ours. your camouflage will not last forever.'")
        (sleep (ai_play_line_on_object none "1010"))
        (set stealth_hint_done true)
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void lz_active_camo_call
    (begin
        (set first_airlock_go true)
        (cs_switch "ally")
        (object_cannot_take_damage (ai_get_object ai_current_actor))
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'engage active camouflage! reveal yourselves only after the arbiter has joined battle with the enemy!'")
        (cs_play_line "0980")
        (sleep 30)
        (ai_set_orders "all_allies" "allies_rec_hide")
        (sleep 60)
        (wake commander_comment_03)
        (object_can_take_damage (ai_get_object ai_current_actor))
    )
)

(script command_script void inner_aim_elites
    (begin
        (cs_abort_on_damage true)
        (cs_enable_moving true)
        (cs_crouch true)
        (sleep_until (= (volume_test_object "vol_entering_facility" (ai_get_object ai_current_actor)) true))
        (cs_aim true recycling_center/rec_center_inner)
        (cs_crouch false)
        (sleep_until (= (version) 3))
        (cs_enable_moving false)
        (sleep_until (> (device_get_position "rec_center_entry_int") 0.0))
        (cs_aim false recycling_center/rec_center_inner)
    )
)

(script command_script void inner_aim_hacker
    (begin
        (cs_abort_on_damage true)
        (cs_enable_moving true)
        (sleep_until (= (volume_test_object "vol_entering_facility" (ai_get_object ai_current_actor)) true))
        (cs_aim true recycling_center/rec_center_inner)
        (sleep_until (= (version) 3))
        (cs_enable_moving false)
        (sleep_until (> (device_get_position "rec_center_entry_int") 0.0))
        (cs_aim false recycling_center/rec_center_inner)
    )
)

(script command_script void inner_aim_grunts
    (begin
        (cs_abort_on_damage true)
        (sleep 60)
        (cs_enable_moving true)
        (sleep_until (= (volume_test_object "vol_entering_facility" (ai_get_object ai_current_actor)) true))
        (cs_aim true recycling_center/rec_center_inner)
        (sleep_until (= (version) 3))
        (cs_enable_moving false)
        (sleep_until (> (device_get_position "rec_center_entry_int") 0.0))
        (cs_aim false recycling_center/rec_center_inner)
    )
)

(script dormant void production_arm_bsp_swap
    (begin
        (device_operates_automatically_set "rec_center_entry_ext" true)
        (cs_run_command_script "allies_elites_01" inner_aim_elites)
        (cs_run_command_script "allies_grunts_01" inner_aim_grunts)
        (ai_set_orders "allies_elites_01" "allies_enter")
        (ai_set_orders "allies_grunts_01" "allies_enter")
        (ai_set_orders "intro_elites" "lz_linger")
        (wake commander_entry_reminder)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_entering_facility" (players)) true)
                (> (player_count) 0)
            )
        )
        (cs_run_command_script "hacker" inner_aim_hacker)
        (ai_set_orders "hacker" "allies_enter")
        (sleep_forever wind)
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_entering_facility" (players)) true)
                (> (player_count) 0)
                (= (device_get_position "rec_center_entry_ext") 0.0)
            )
        )
        (device_operates_automatically_set "rec_center_entry_ext" false)
        (sleep 30)
        (sound_class_enable_ducker "ambient_machinery" 0.0 2)
        (sound_impulse_start_effect "sound_remastered\visual_effects\ss_airlock\airlock" none 1.0)
        (begin_random
            (begin
                (object_create_anew "gas01")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas02")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas03")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas04")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas05")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas06")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas07")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas08")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas09")
                (sleep (random_range 5 15))
            )
            (begin
                (object_create_anew "gas10")
                (sleep (random_range 5 15))
            )
        )
        (structure_bsp_index 3)
        (sleep_until (= (version) 3))
        (object_destroy "filthy_audio1")
        (object_destroy "filthy_audio2")
        (sound_class_enable_ducker "ambient_machinery" 1.0 2)
        (sleep_until 
            (or
                (ai_scene "lz_active_camo_scene" lz_active_camo_call "all_allies")
                (and
                    (< (ai_living_count "hacker") 0)
                    (< (ai_living_count "allies_elites_01") 1)
                )
            ) 
        30 150)
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
        (activate_nav_point_object)
        (if (= first_airlock_go true) 
            (sleep_until (= stealth_hint_done true) 30 900))
        (device_operates_automatically_set "rec_center_entry_int" true)
    )
)

(script dormant void commander_comment_01
    (begin
        (sleep 60)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'we are the arm of the prophets, dervish, and you are the blade!'")
        (sleep (ai_play_line_on_object none "0210"))
        (sleep 30)
        (print "'be silent and swift, and we will quell this heresy without incident!'")
        (sleep (ai_play_line_on_object none "0220"))
        (sleep 15)
        (set commander_done_yapping true)
        (sleep 30)
    )
)

(script dormant void commander_comment_02
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'the storm has masked our approach.'")
        (sleep (ai_play_line_on_object none "0240"))
        (sleep 30)
        (print "spec-ops commander: 'and it should have their local battle-net in disarray.'")
        (sleep (ai_play_line_on_object none "0250"))
        (sleep 30)
        (print "spec-ops commander: 'we have the element of surprise.  for now.'")
        (sleep (ai_play_line_on_object none "0260"))
        (unit_stop_custom_animation (unit (list_get (ai_actors "hacker") 0)))
        (set open_rec_center true)
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script command_script void lz_phantom_leaves
    (begin
        (cs_fly_by airspace_lz/p0 10.0)
        (cs_fly_by airspace_lz/p1 10.0)
        (cs_fly_by airspace_lz/p2 10.0)
        (cs_fly_by airspace_lz/p3 10.0)
        (cs_fly_by airspace_lz/p4 10.0)
        (cs_fly_by airspace_lz/p5 10.0)
        (cs_fly_to airspace_lz/p6 10.0)
        (ai_erase "intro_phantom")
    )
)

(script command_script void landing_zone_follow_01
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to landing_zone/ramp01)
        (cs_face_player true)
        (sleep_until (= (volume_test_objects "vol_leaving_lz" (players)) true))
        (cs_face_player false)
    )
)

(script command_script void landing_zone_follow_02
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to landing_zone/ramp02)
        (cs_face_player true)
        (sleep_until (= (volume_test_objects "vol_leaving_lz" (players)) true))
        (cs_face_player false)
        (cs_suppress_dialogue_global true)
        (if (= commander_done_yapping true) 
            (begin
                (print "spec-ops elite: 'first lance in position!'")
                (cs_play_line "0230")
            )
        )
    )
)

(script command_script void swat_hack
    (begin
        (cs_abort_on_damage true)
        (cs_aim true landing_zone/control)
        (sleep_until 
            (or
                (= (device_get_position "rec_center_entry_ext") 1.0)
                (= (volume_test_objects "vol_entering_facility" (players)) true)
            )
        )
        (cs_aim false landing_zone/control)
    )
)

(script command_script void swat_aim
    (begin
        (cs_abort_on_damage true)
        (cs_aim true landing_zone/entry)
        (sleep_until 
            (or
                (= (device_get_position "rec_center_entry_ext") 1.0)
                (= (volume_test_objects "vol_entering_facility" (players)) true)
            )
        )
        (cs_aim false landing_zone/entry)
    )
)

(script dormant void swat_deploy
    (begin
        (data_mine_insert "04a_1_landing_zone")
        (wake wind)
        (wake commander_comment_01)
        (cs_run_command_script "intro_elites/01" landing_zone_follow_01)
        (cs_run_command_script "intro_elites/02" landing_zone_follow_02)
        (custom_animation_loop (unit (list_get (ai_actors "hacker") 0)) "objects\characters\elite\elite" "uplink_station" true)
        (cs_run_command_script "hacker" swat_hack)
        (cs_run_command_script "intro_phantom/01" lz_phantom_01_away)
        (cs_run_command_script "intro_phantom/02" lz_phantom_02_away)
        (cs_run_command_script "intro_phantom/03" lz_phantom_03_away)
        (cs_run_command_script "allies_grunts_01" swat_aim)
        (cs_run_command_script "allies_elites_01" swat_aim)
        (sleep_until (= (volume_test_objects "vol_entry_landing" (players)) true))
        (sleep_until (= commander_done_yapping true))
        (wake commander_comment_02)
        (sleep_until 
            (or
                (= open_rec_center true)
                (<= (object_get_health (list_get (ai_actors "hacker") 0)) 0.0)
            ) 
        30 360)
        (wake production_arm_bsp_swap)
        (sleep_until 
            (or
                (= (volume_test_objects_all "vol_phantom_kill" (ai_actors "intro_phantom")) true)
                (and
                    (= (volume_test_objects_all "vol_recycling_all" (players)) true)
                    (> (player_count) 0)
                )
            )
        )
        (ai_erase "intro_phantom")
        (sleep_until 
            (and
                (= (volume_test_objects_all "vol_recycling_all" (players)) true)
                (> (player_count) 0)
            )
        )
        (ai_erase "intro_elites")
    )
)

(script dormant void recycling_can_spawner
    (begin
        (object_set_deleted_when_deactivated "rec_can_a_01")
        (object_set_deleted_when_deactivated "rec_can_a_02")
        (object_set_deleted_when_deactivated "rec_can_a_03")
        (object_set_deleted_when_deactivated "rec_can_a_04")
        (object_set_deleted_when_deactivated "rec_can_a_06")
        (object_set_deleted_when_deactivated "rec_can_a_07")
        (object_set_deleted_when_deactivated "rec_can_b_01")
        (object_set_deleted_when_deactivated "rec_can_b_02")
        (object_set_deleted_when_deactivated "rec_can_c_01")
        (object_set_deleted_when_deactivated "rec_can_c_02")
        (object_set_deleted_when_deactivated "rec_can_c_03")
        (object_set_deleted_when_deactivated "rec_can_c_04")
        (object_set_deleted_when_deactivated "rec_can_c_06")
        (sleep_until (= recycling_power_on true))
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_recycling_can_all" 2048)) 20) 
                            (begin
                                (object_create_clone "recycling_can_a")
                                (object_set_deleted_when_deactivated "recycling_can_a")
                            )
                        )
                        (sleep recycling_time)
                    )
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_recycling_can_all" 2048)) 20) 
                            (begin
                                (object_create_clone "recycling_can_b")
                                (object_set_deleted_when_deactivated "recycling_can_b")
                            )
                        )
                        (sleep recycling_time)
                    )
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_recycling_can_all" 2048)) 20) 
                            (begin
                                (object_create_clone "recycling_can_c")
                                (object_set_deleted_when_deactivated "recycling_can_c")
                            )
                        )
                        (sleep recycling_time)
                    )
                )
                (= recycling_power_on false)
            )
        )
    )
)

(script dormant void recycling_killer_new
    (begin
        (sleep_until (= recycling_power_on true))
        (sleep_until 
            (begin
                (object_destroy (list_get (volume_return_objects "kill_recycling_pit") 0))
                (sleep 30)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_recycling_pit" 1) 0)))
                (sleep 30)
                (= recycling_power_on false)
            )
        )
    )
)

(script command_script void heretic_chat
    (begin
        (cs_switch "chat_her_02")
        (cs_abort_on_alert true)
        (set chatter_her_02 (ai_get_object ai_current_actor))
        (cs_enable_moving true)
        (cs_switch "chat_her_01")
        (cs_abort_on_alert true)
        (set chatter_her_01 (ai_get_object ai_current_actor))
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_and_face recycling_center/p0 recycling_center/p1)
        (cs_custom_animation "objects\characters\elite\elite" "uplink_station" 0.0 true)
        (custom_animation_loop (unit (ai_get_object ai_current_actor)) "objects\characters\elite\elite" "uplink_station" true)
        (cs_switch "chat_her_02")
        (cs_enable_pathfinding_failsafe true)
        (cs_approach chatter_her_01 2.0 20.0 20.0)
        (cs_suppress_dialogue_global true)
        (print "heretic_01: 'any word on our missing brothers?'")
        (cs_play_line "0270")
        (cs_switch "chat_her_01")
        (unit_stop_custom_animation (unit (ai_get_object ai_current_actor)))
        (cs_face false recycling_center/p1)
        (cs_approach chatter_her_02 1.5 20.0 20.0)
        (cs_suppress_dialogue_global true)
        (print "heretic_02: 'still nothing.'")
        (cs_play_line "0280")
        (sleep 30)
        (print "heretic_02: 'and given what sleeps here, i fear they are lost.'")
        (cs_play_line "0290")
        (sleep 15)
        (cs_switch "chat_her_02")
        (cs_suppress_dialogue_global true)
        (print "heretic_01: 'surely the oracle will protect us?'")
        (cs_play_line "0300")
        (sleep 15)
        (cs_switch "chat_her_01")
        (cs_suppress_dialogue_global true)
        (print "heretic_02: 'perhaps. but i fear its sentinels are too few.'")
        (cs_play_line "0310")
        (sleep 15)
        (print "heretic_02: 'better we protect ourselves.'")
        (cs_play_line "0320")
        (sleep 30)
        (cs_run_command_script "rec_center_heretic_02" abort)
        (cs_approach_stop)
        (sleep 60)
        (cs_enable_moving true)
    )
)

(script dormant void heretic_uplink_01
    (begin
        (custom_animation_loop (unit (list_get (ai_actors "rec_center_heretic_03") 0)) "objects\characters\elite\elite" "uplink_station" true)
        (sleep_until (> (ai_combat_status "rec_center_heretic_03") ai_combat_status_idle))
        (unit_stop_custom_animation (unit (list_get (ai_actors "rec_center_heretic_03") 0)))
    )
)

(script dormant void rec_center_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_leaving_rec_center" (players)) true) 30 3600)
        (if 
            (and
                (= (volume_test_objects "vol_leaving_rec_center" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "spec-ops commander: 'there should be a hangar directly below you. find a way down!'")
                    (sleep (ai_play_line_on_object none "1130"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
    )
)

(script command_script void get_on_e1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to recycling_center/e1)
    )
)

(script command_script void get_on_e2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to recycling_center/e2)
    )
)

(script command_script void get_on_g1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to recycling_center/g1)
    )
)

(script command_script void get_on_g2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to recycling_center/g2)
    )
)

(script command_script void rec_center_turret
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to rec_cen_turret/go_here)
        (cs_deploy_turret rec_cen_turret/p1)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script dormant void recycling_center_start
    (begin
        (sleep_until (= (version) 3))
        (data_mine_insert "04a_2_recycling_center")
        (object_create_containing "rec_can_")
        (wake recycling_can_spawner)
        (wake recycling_killer_new)
        (set recycling_power_on true)
        (ai_place "rec_center_heretic_01" 1)
        (ai_place "rec_center_heretic_02" 1)
        (cs_run_command_script "rec_center_heretic_02" long_pause)
        (ai_place "rec_center_grunts_01" 2)
        (sleep_until (= stealth_hint_done true))
        (game_save_no_timeout)
        (sleep_until (> (device_get_position "rec_center_entry_int") 0.0))
        (sleep_until (= (device_get_position "rec_center_entry_int") 1.0))
        (ai_scene "heretic_chat_scene" heretic_chat "rec_center_h_entry")
        (ai_set_orders "arm01_allies" "allies_rec_center_all")
        (sleep_until 
            (or
                (= (volume_test_objects "vol_rec_slope_top" (players)) true)
                (< (ai_living_count "rec_center_heretics") 2)
            )
        )
        (game_save_no_timeout)
        (ai_place "rec_center_grunts_02r" 2)
        (ai_place "rec_center_grunts_02l" 2)
        (if (> (ai_combat_status "rec_center_heretics") ai_combat_status_idle) 
            (begin
                (if (objects_can_see_object (players) "rec_cen_rein_01r" 45.0) 
                    (begin
                        (if (< (ai_living_count "rec_center_heretics") 8) 
                            (ai_place "rec_cen_rein_her_01r" 1))
                        (cs_run_command_script "rec_cen_rein_her_01r" snap_alert)
                        (if (< (ai_living_count "rec_center_heretics") 8) 
                            (ai_place "rec_cen_rein_grt_01r" (random_range 1 3)))
                        (cs_run_command_script "rec_cen_rein_grt_01r" snap_alert)
                    )
                )
                (if (objects_can_see_object (players) "rec_cen_rein_01l" 45.0) 
                    (begin
                        (if (< (ai_living_count "rec_center_heretics") 8) 
                            (ai_place "rec_cen_rein_her_01l" (- 1.0 (ai_living_count "rec_cen_rein_her_01r"))))
                        (cs_run_command_script "rec_cen_rein_her_01l" snap_alert)
                        (if (< (ai_living_count "rec_center_heretics") 8) 
                            (ai_place "rec_cen_rein_grt_01l" (- (random_range 1 3) (ai_living_count "rec_cen_rein_grt_01r"))))
                        (cs_run_command_script "rec_cen_rein_grt_01l" snap_alert)
                    )
                )
            )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_recycling_mid_01" (players)) true)
                (< (ai_living_count "rec_center_heretics") 3)
            )
        )
        (game_save_no_timeout)
        (cs_run_command_script "allies_grunts_01/grunt02" rec_center_turret)
        (if (< (ai_living_count "rec_center_heretics") 8) 
            (ai_place "rec_center_grunts_03" 3))
        (if (< (ai_living_count "rec_center_heretics") 8) 
            (ai_place "rec_center_heretic_03" 2))
        (wake heretic_uplink_01)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_recycling_mid_02" (players)) true)
                (< (ai_living_count "rec_center_heretics") 3)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "rec_center_heretics") 8) 
            (ai_place "rec_center_heretic_04" (- 1.0 (ai_living_count "rec_center_heretic_03"))))
        (if (< (ai_living_count "rec_center_heretics") 8) 
            (ai_place "rec_center_grunts_04" (- 3.0 (ai_living_count "rec_center_grunts_03"))))
        (wake rec_center_reminder)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_leaving_rec_center" (players)) true)
                (= (ai_living_count "rec_center_heretics") 0)
            )
        )
        (device_set_position_immediate "elev_hangar" 0.25)
        (cs_run_command_script "allies_grunts_01/grunt02" abort)
        (ai_vehicle_exit "allies_grunts_01")
        (sleep_until (= (volume_test_objects "vol_leaving_rec_center" (players)) true))
        (sleep_until (< (ai_combat_status "all_enemies") ai_combat_status_uninspected) 30 150)
        (set stealth_talk_gone true)
        (ai_set_orders "arm01_allies" "allies_rec_center_under")
        (game_save_no_timeout)
        (if (< (ai_living_count "rec_center_heretics") 8) 
            (ai_place "rec_center_grunts_06" 4))
        (sleep_until 
            (or
                (= (volume_test_objects "vol_hangar_lift_top" (players)) true)
                (< (ai_living_count "rec_center_heretics") 3)
            )
        )
        (game_save_no_timeout)
        (if (< (ai_living_count "rec_center_heretics") 8) 
            (ai_place "rec_center_heretic_06" 1))
        (if (< (ai_living_count "rec_center_heretics") 8) 
            (ai_place "rec_center_grunts_07" 3))
        (device_set_position "elev_hangar" 0.0)
        (sleep_until (< (ai_living_count "rec_center_heretics") 1) 30 1800)
        (sleep_until (= (game_all_quiet) true))
        (game_save_no_timeout)
        (ai_set_orders "arm01_allies" "get_on_hangar_elev")
        (cs_run_command_script "hacker" get_on_e1)
        (cs_run_command_script "allies_elites_01" get_on_e2)
        (cs_run_command_script "allies_grunts_01/grunt01" get_on_g1)
        (cs_run_command_script "allies_grunts_01/grunt02" get_on_g2)
    )
)

(script dormant void hangar_extra_save
    (begin
        (sleep_until (= (device_get_position "elev_hangar") 1.0))
        (sleep_until (game_all_quiet))
        (game_save_no_timeout)
    )
)

(script dormant void hangar_can_spawner
    (begin
        (sleep_until (= hangar_power_on true))
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_hangar_can_all" 2048)) 15) 
                            (begin
                                (object_create_clone "hangar_can_a")
                            )
                        )
                        (sleep recycling_time)
                    )
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_hangar_can_all" 2048)) 15) 
                            (begin
                                (object_create_clone "hangar_can_b")
                            )
                        )
                        (sleep recycling_time)
                    )
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_hangar_can_all" 2048)) 15) 
                            (begin
                                (object_create_clone "hangar_can_c")
                            )
                        )
                        (sleep recycling_time)
                    )
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_hangar_can_all" 2048)) 15) 
                            (begin
                                (object_create_clone "hangar_can_d")
                            )
                        )
                        (sleep recycling_time)
                    )
                )
                (= hangar_power_on false)
            )
        )
    )
)

(script dormant void hangar_killer_new
    (begin
        (sleep_until (= hangar_power_on true))
        (sleep_until 
            (begin
                (object_destroy (list_get (volume_return_objects "kill_hangar_pit_01") 0))
                (sleep 30)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_hangar_pit_01" 1) 0)))
                (sleep 30)
                (object_destroy (list_get (volume_return_objects "kill_hangar_pit_02") 0))
                (sleep 30)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_hangar_pit_02" 1) 0)))
                (sleep 30)
                (object_destroy (list_get (volume_return_objects "kill_hangar_pit_03") 0))
                (sleep 30)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_hangar_pit_03" 1) 0)))
                (sleep 30)
                (object_destroy (list_get (volume_return_objects "kill_hangar_pit_04") 0))
                (sleep 30)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_hangar_pit_04" 1) 0)))
                (sleep 30)
                (= hangar_power_on false)
            )
        )
    )
)

(script command_script void hangar_help_01
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (sleep 120)
        (objects_attach (list_get (ai_actors "hangar_helper_01") 0) "primary_trigger" "help_can_01" "top")
        (cs_fly_by hangar/p0)
        (cs_fly_by hangar/p9)
        (cs_fly_to hangar/p8)
        (objects_detach (list_get (ai_actors "hangar_helper_01") 0) "help_can_01")
        (object_destroy "help_can_01")
        (ai_erase "hangar_helper_01")
    )
)

(script command_script void hangar_help_02
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar/p7)
        (cs_fly_to hangar/p10)
        (objects_attach (list_get (ai_actors "hangar_helper_02") 0) "primary_trigger" "help_can_02" "top")
        (cs_fly_by hangar/p0)
        (cs_fly_to hangar/p11)
        (objects_detach (list_get (ai_actors "hangar_helper_02") 0) "help_can_02")
    )
)

(script command_script void hangar_help_03
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (cs_fly_to hangar/p3)
                        (cs_shoot_point true hangar/weld1)
                        (sleep 90)
                        (cs_shoot_point false hangar/weld1)
                    )
                    (begin
                        (cs_fly_to hangar/p4)
                        (cs_shoot_point true hangar/weld2)
                        (sleep 90)
                        (cs_shoot_point false hangar/weld2)
                    )
                    (begin
                        (cs_fly_to hangar/p5)
                        (cs_shoot_point true hangar/weld3)
                        (sleep 90)
                        (cs_shoot_point false hangar/weld3)
                    )
                    (begin
                        (cs_fly_to hangar/p6)
                        (cs_shoot_point true hangar/weld4)
                        (sleep 90)
                        (cs_shoot_point false hangar/weld4)
                    )
                )
                false
            )
        )
    )
)

(script command_script void hangar_fly_out_l1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/l1_1)
        (cs_fly_to hangar_too/l1_0)
    )
)

(script command_script void hangar_fly_out_l2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/l2_1)
        (cs_fly_to hangar_too/l2_0)
    )
)

(script command_script void hangar_fly_out_r1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/r1_1)
        (cs_fly_to hangar_too/r1_0)
    )
)

(script command_script void hangar_fly_out_r2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/r2_1)
        (cs_fly_to hangar_too/r2_0)
    )
)

(script command_script void hangar_fly_out_c1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/c1_1)
        (cs_fly_to hangar_too/c1_0)
    )
)

(script command_script void hangar_fly_out_c2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/c2_1)
        (cs_fly_to hangar_too/c2_0)
    )
)

(script command_script void hangar_fly_l1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (sleep_until (= (volume_test_objects "vol_hangar_center" ai_current_actor) true))
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/l1_0)
        (cs_fly_by hangar_too/l1_1)
        (cs_fly_to hangar_too/l1_2)
        (ai_erase ai_current_actor)
    )
)

(script command_script void hangar_fly_l2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (sleep_until (= (volume_test_objects "vol_hangar_center" ai_current_actor) true))
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/l2_0)
        (cs_fly_by hangar_too/l2_1)
        (cs_fly_to hangar_too/l2_2)
        (ai_erase ai_current_actor)
    )
)

(script command_script void hangar_fly_r1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (sleep_until (= (volume_test_objects "vol_hangar_center" ai_current_actor) true))
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/r1_0)
        (cs_fly_by hangar_too/r1_1)
        (cs_fly_to hangar_too/r1_2)
        (ai_erase ai_current_actor)
    )
)

(script command_script void hangar_fly_r2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (sleep_until (= (volume_test_objects "vol_hangar_center" ai_current_actor) true))
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/r2_0)
        (cs_fly_by hangar_too/r2_1)
        (cs_fly_to hangar_too/r2_2)
        (ai_erase ai_current_actor)
    )
)

(script command_script void hangar_fly_c1
    (begin
        (cs_enable_pathfinding_failsafe true)
        (sleep_until (= (volume_test_objects "vol_hangar_center" ai_current_actor) true))
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/c1_0)
        (cs_fly_by hangar_too/c1_1)
        (cs_fly_to hangar_too/c1_2)
        (ai_erase ai_current_actor)
    )
)

(script command_script void hangar_fly_c2
    (begin
        (cs_enable_pathfinding_failsafe true)
        (sleep_until (= (volume_test_objects "vol_hangar_center" ai_current_actor) true))
        (cs_vehicle_speed 0.5)
        (cs_fly_by hangar_too/c2_0)
        (cs_fly_by hangar_too/c2_1)
        (cs_fly_to hangar_too/c2_2)
        (ai_erase ai_current_actor)
    )
)

(script dormant void hangar_sentinels_flitting
    (begin
        (sleep_until 
            (begin
                (begin_random
                    (if (< (ai_living_count "hangar_sentinels_flit") 1) 
                        (begin
                            (ai_place "hangar_sentinels_flit/l1")
                            (cs_run_command_script "hangar_sentinels_flit/l1" hangar_fly_out_l1)
                            (set hangar_sentinel_var true)
                            (begin_random
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/l1" hangar_fly_l2)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/l1" hangar_fly_r1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/l1" hangar_fly_r2)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                            )
                        )
                    )
                    (if (< (ai_living_count "hangar_sentinels_flit") 1) 
                        (begin
                            (ai_place "hangar_sentinels_flit/l2")
                            (cs_run_command_script "hangar_sentinels_flit/l2" hangar_fly_out_l2)
                            (set hangar_sentinel_var true)
                            (begin_random
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/l2" hangar_fly_l1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/l2" hangar_fly_r1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/l2" hangar_fly_r2)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                            )
                        )
                    )
                    (if (< (ai_living_count "hangar_sentinels_flit") 1) 
                        (begin
                            (ai_place "hangar_sentinels_flit/r1")
                            (cs_run_command_script "hangar_sentinels_flit/r1" hangar_fly_out_r1)
                            (set hangar_sentinel_var true)
                            (begin_random
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/r1" hangar_fly_l1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/r1" hangar_fly_l2)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/r1" hangar_fly_r2)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                            )
                        )
                    )
                    (if (< (ai_living_count "hangar_sentinels_flit") 1) 
                        (begin
                            (ai_place "hangar_sentinels_flit/r2")
                            (cs_run_command_script "hangar_sentinels_flit/r2" hangar_fly_out_r2)
                            (set hangar_sentinel_var true)
                            (begin_random
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/r2" hangar_fly_l1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/r2" hangar_fly_l2)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/r2" hangar_fly_r1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                            )
                        )
                    )
                    (if (< (ai_living_count "hangar_sentinels_flit") 1) 
                        (begin
                            (ai_place "hangar_sentinels_flit/c1")
                            (cs_run_command_script "hangar_sentinels_flit/c1" hangar_fly_out_c1)
                            (set hangar_sentinel_var true)
                            (begin_random
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/c1" hangar_fly_l1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                                (if (= hangar_sentinel_var true) 
                                    (begin
                                        (cs_queue_command_script "hangar_sentinels_flit/c1" hangar_fly_r1)
                                        (set hangar_sentinel_var false)
                                    )
                                )
                            )
                        )
                    )
                )
                (>= (ai_combat_status "hangar_heretics") ai_combat_status_uninspected)
            )
        )
    )
)

(script command_script void hangar_sentinel_comment
    (begin
        (cs_switch "elev_elite")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'sentinels! the holy warriors of the sacred rings!'")
        (cs_aim true hangar_too/p0)
        (cs_play_line "0360")
        (sleep 30)
        (print "'why have they sided with these heretics?'")
        (cs_play_line "0370")
        (cs_aim false hangar_too/p0)
    )
)

(script dormant void hangar_helpers
    (begin
        (ai_place "hangar_helper_01")
        (cs_run_command_script "hangar_helper_01" forever_pause)
        (ai_place "hangar_helper_03")
        (cs_run_command_script "hangar_helper_03" forever_pause)
        (sleep_until (= (volume_test_objects "vol_trigger_helpers" (players)) true))
        (cs_run_command_script "hangar_helper_03" hangar_help_03)
        (cs_run_command_script "hangar_helper_01" hangar_help_01)
        (ai_place "hangar_helper_02")
        (cs_run_command_script "hangar_helper_02" hangar_help_02)
        (cs_queue_command_script "hangar_helper_02" hangar_help_03)
        (sleep 90)
        (ai_scene "sentinel_react_scene" hangar_sentinel_comment "arm01_allies")
        (sleep_until (> (ai_combat_status "hangar_heretics") ai_combat_status_uninspected))
        (unit_add_equipment (unit (list_get (ai_actors "hangar_helper_01") 0)) "swap" true true)
        (unit_add_equipment (unit (list_get (ai_actors "hangar_helper_02") 0)) "swap" true true)
        (unit_add_equipment (unit (list_get (ai_actors "hangar_helper_03") 0)) "swap" true true)
        (objects_detach (list_get (ai_actors "hangar_helper_01") 0) "help_can_01")
        (objects_detach (list_get (ai_actors "hangar_helper_02") 0) "help_can_02")
        (cs_run_command_script "hangar_helper_01" abort)
        (cs_run_command_script "hangar_helper_02" abort)
        (cs_run_command_script "hangar_helper_03" abort)
        (cs_queue_command_script "hangar_sentinels_flit" abort)
    )
)

(script command_script void hangar_phantom_arrives
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_by airspace_hangar/hangar_ph0 3.0)
        (cs_fly_by airspace_hangar/hangar_ph1 3.0)
        (cs_vehicle_speed 0.25)
        (cs_fly_to airspace_hangar/hangar_ph2 1.0)
        (ai_place "reinforce_elites_01" (max 1.0 (- 2.0 (ai_living_count "allies_elites"))))
        (ai_place "reinforce_grunts_01" (- 2.0 (ai_living_count "allies_grunts")))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p (ai_actors "reinforce_elites_01"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p (ai_actors "reinforce_grunts_01"))
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_a01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_a02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_a03)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_b01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_b02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_b03)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_c01)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_c02)
        (sleep 15)
        (vehicle_unload (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p_c03)
        (sleep_until (< (ai_living_count "hangar_phantom") 2) 30 900)
        (set hangar_phantom_cue true)
        (sleep_until (> heavies_spawned 0))
        (sleep_until 
            (or
                (>= (ai_combat_status "hangar_heretic_heavies_l") ai_combat_status_clear_los)
                (>= (ai_combat_status "hangar_heretic_heavies_r") ai_combat_status_clear_los)
            ) 
        30 300)
        (wake music_04a_01_stop)
        (cs_fly_to_and_face airspace_hangar/hangar_ph1 airspace_hangar/hangar_ph2 2.0)
        (cs_vehicle_speed 1.0)
        (cs_fly_by airspace_hangar/hangar_ph0 5.0)
        (cs_fly_to airspace_hangar/hangar_phx 5.0)
        (ai_erase "hangar_phantom")
    )
)

(script dormant void hangar_allies_reinforce
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 3)) 50.0)
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 3) 45.0) false)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 3)))
                (if 
                    (and
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 50.0)
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 2) 45.0) false)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 2)))
                (if 
                    (and
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 50.0)
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 1) 45.0) false)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 1)))
                (if 
                    (and
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 50.0)
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 0) 45.0) false)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 0)))
                false
            ) 
        30 150)
        (ai_place "hangar_phantom")
        (cs_run_command_script "hangar_phantom" hangar_phantom_arrives)
        (sleep 60)
        (sleep_until (> (ai_living_count "hangar_phantom") 1))
        (sleep_until (< (ai_living_count "hangar_phantom") 2))
        (ai_set_orders "reinforce_elites_01" "allies_hangar_bottom")
        (ai_set_orders "reinforce_grunts_01" "allies_hangar_bottom")
    )
)

(script static void short_hangar_allies
    (begin
        (sleep_until 
            (begin
                (if 
                    (and
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 2)) 50.0)
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 2) 45.0) false)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 2)))
                (if 
                    (and
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 1)) 50.0)
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 1) 45.0) false)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 1)))
                (if 
                    (and
                        (> (objects_distance_to_object (players) (list_get (ai_actors "all_allies") 0)) 50.0)
                        (= (objects_can_see_object (players) (list_get (ai_actors "all_allies") 0) 45.0) false)
                    ) 
                        (object_destroy (list_get (ai_actors "all_allies") 0)))
                false
            ) 
        30 150)
        (ai_place "hangar_phantom")
        (cs_run_command_script "hangar_phantom" hangar_phantom_arrives)
        (sleep 60)
        (ai_place "reinforce_elites_01" (- 2.0 (ai_living_count "allies_elites")))
        (ai_place "reinforce_grunts_01" (- 2.0 (ai_living_count "allies_grunts")))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p (ai_actors "reinforce_elites_01"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "hangar_phantom/pilot") phantom_p (ai_actors "reinforce_grunts_01"))
        (sleep_until (< (ai_living_count "hangar_phantom") 2))
        (ai_set_orders "reinforce_elites_01" "allies_hangar_bottom")
        (ai_set_orders "reinforce_grunts_01" "allies_hangar_bottom")
    )
)

(script dormant void hangar_door_monitor
    (begin
        (sleep_until (> (device_get_position "hangar_door_cinematic") 0.0))
        (wake hangar_allies_reinforce)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "phantom pilot: 'hold position! i am making my approach!'")
        (sleep (ai_play_line_on_object none "2030"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void hangar_objective
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "phantom pilot: 'arbiter! clear the hangar, and open its door so i may drop the second lance!'")
        (sleep (ai_play_line_on_object none "2000"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void hangar_door_reminder
    (begin
        (sleep_until (> (device_get_position "hangar_door_cinematic") 0.0) 30 4000)
        (if (<= (device_get_position "hangar_door_cinematic") 0.0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'find the controls to the hangar-doors, arbiter!'")
                (sleep (ai_play_line_on_object none "2010"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
        (sleep_until (> (device_get_position "hangar_door_cinematic") 0.0) 30 2000)
        (if (<= (device_get_position "hangar_door_cinematic") 0.0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'the hangar-doors, arbiter! open them, and i will land your reinforcements!'")
                (sleep (ai_play_line_on_object none "2020"))
                (sleep 30)
                (ai_dialogue_enable true)
                (if (= (volume_test_objects "vol_hangar_left" (players)) true) 
                    (begin
                        (deactivate_nav_point_object default player "hangar_door_switch_l" 0.0)
                        (sleep_until (> (device_get_position "hangar_door_cinematic") 0.0))
                        (error_overflow_suppression player "hangar_door_switch_l")
                    ) (begin
                        (deactivate_nav_point_object default player "hangar_door_switch_r" 0.0)
                        (sleep_until (> (device_get_position "hangar_door_cinematic") 0.0))
                        (error_overflow_suppression player "hangar_door_switch_r")
                    )
                )
            )
        )
    )
)

(script command_script void hangar_sentinel_call
    (begin
        (cs_switch "heretic")
        (cs_suppress_dialogue_global true)
        (print "heretic: 'sentinels! defend us!'")
        (cs_play_line "0380")
    )
)

(script dormant void hangar_alerted_call
    (begin
        (sleep_until (> (ai_combat_status "hangar_heretics") ai_combat_status_uninspected))
        (ai_scene "hangar_s_call_scene" hangar_sentinel_call "hangar_heretics")
    )
)

(script static void sentinel_swarm_spawning
    (begin
        (set hangar_sentinels_come true)
        (sleep_until 
            (begin
                (if (< (ai_living_count "hangar_sentinels") 3) 
                    (ai_place "hangar_sentinel_swarm" 1))
                (sleep (random_range 10 30))
                (> (ai_spawn_count "hangar_sentinel_swarm") 4)
            )
        )
    )
)

(script static void heretic_heavy_spawning
    (begin
        (begin_random
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02r") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_02r_a")
                        (ai_place "hangar_heretic_heavies_r/02a")
                        (cs_run_command_script "hangar_heretic_heavies_r" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02r") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_02r_b")
                        (ai_place "hangar_heretic_heavies_r/02b")
                        (cs_run_command_script "hangar_heretic_heavies_r" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03r") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_03r_a")
                        (ai_place "hangar_heretic_heavies_r/03a")
                        (cs_run_command_script "hangar_heretic_heavies_r" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03r") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_03r_b")
                        (ai_place "hangar_heretic_heavies_r/03b")
                        (cs_run_command_script "hangar_heretic_heavies_r" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02l") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_02l_a")
                        (ai_place "hangar_heretic_heavies_l/02a")
                        (cs_run_command_script "hangar_heretic_heavies_l" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02l") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_02l_b")
                        (ai_place "hangar_heretic_heavies_l/02b")
                        (cs_run_command_script "hangar_heretic_heavies_l" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03l") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_03l_a")
                        (ai_place "hangar_heretic_heavies_l/03a")
                        (cs_run_command_script "hangar_heretic_heavies_l" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03l") 0.0)
                    (< heavies_spawned 3)
                ) 
                    (begin
                        (print "heavy_03l_b")
                        (ai_place "hangar_heretic_heavies_l/03b")
                        (cs_run_command_script "hangar_heretic_heavies_l" snap_alert)
                        (set heavies_spawned (+ heavies_spawned 1.0))
                    )
            )
        )
    )
)

(script static void hangar_a50_clone
    (begin
        (begin_random
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02r_high" (- (random_range 0 3) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_02r_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02r_low" (- (random_range 0 3) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_02r_low" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_03r_high" (- (random_range 0 3) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_03r_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_03r_low" (- (random_range 0 3) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_03r_low" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02l_high" (- (random_range 0 3) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_02l_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02l_low" (- (random_range 0 3) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_02l_low" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_03l_high" (- (random_range 0 3) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_03l_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_03l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_03l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_03l_low" (- (random_range 0 3) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_03l_low" snap_alert)
                    )
            )
        )
        (sleep_until (< (ai_living_count "hangar_heretics") 3) 30 8000)
        (sleep_until (< (ai_living_count "hangar_heretics") 1) 30 1800)
        (sleep 150)
        (game_save_no_timeout)
        (begin_random
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02r_high" (- (random_range 0 2) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_02r_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02r_low" (- (random_range 0 4) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_02r_low" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_01r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_01r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_01r_high" (- (random_range 0 2) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_01r_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_01r" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_01r") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_01r_low" (- (random_range 0 4) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_01r_low" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02l_high" (- (random_range 0 2) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_02l_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_02l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_02l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_02l_low" (- (random_range 0 4) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_02l_low" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_01l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_01l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_01l_high" (- (random_range 0 2) (ai_living_count "a50_high")))
                        (cs_run_command_script "hangar_a50_01l_high" snap_alert)
                    )
            )
            (if 
                (and
                    (= (volume_test_objects "vol_hangar_spawn_01l" (players)) false)
                    (> (player_count) 0)
                    (= (device_get_position "hang_01l") 0.0)
                ) 
                    (begin
                        (ai_place "hangar_a50_01l_low" (- (random_range 0 4) (ai_living_count "a50_low")))
                        (cs_run_command_script "hangar_a50_01l_low" snap_alert)
                    )
            )
        )
    )
)

(script command_script void hangar_exit_comment
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'more heretics!  in the passage below us!'")
        (cs_play_line "1140")
    )
)

(script dormant void hangar_exit_warn
    (begin
        (sleep_until (= (volume_test_objects "vol_hangar_center_exit" (players)) true) 30 300)
        (if 
            (and
                (= (volume_test_objects "vol_hangar_center_exit" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_scene "hangar_exit_scene" hangar_exit_comment "all_allies")
                )
        )
    )
)

(script dormant void hangar_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_leaving_hangar" (players)) true) 30 3600)
        (if 
            (and
                (= (volume_test_objects "vol_leaving_hangar" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_dialogue_enable false)
                    (sleep 60)
                    (print "spec-ops commander: 'keep heading down. find the leader of these heretics!'")
                    (sleep (ai_play_line_on_object none "1150"))
                    (sleep 30)
                    (ai_dialogue_enable true)
                )
        )
        (sleep_until (= (volume_test_objects "vol_leaving_hangar" (players)) true) 30 1800)
        (if 
            (and
                (= (volume_test_objects "vol_leaving_hangar" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (deactivate_nav_point_object default player "hangar_exit" 0.0)
                    (sleep_until (= (volume_test_objects "vol_leaving_hangar" (players)) true))
                    (error_overflow_suppression player "hangar_exit")
                )
        )
    )
)

(script dormant void hangar_exterior_toggle
    (begin
        (object_create "alpha_gas_exterior")
        (sleep_until 
            (begin
                (sleep_until (= (volume_test_objects "vol_first_hall_01" (players)) true))
                (object_destroy "alpha_gas_exterior")
                (sleep_until (= (volume_test_objects "vol_leaving_hangar" (players)) true))
                (object_create "alpha_gas_exterior")
                false
            )
        )
    )
)

(script command_script void deploy_hangar_right
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to hangar_turrets/deploy_r)
        (cs_deploy_turret hangar_turrets/right)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void deploy_hangar_left
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to hangar_turrets/deploy_l)
        (cs_deploy_turret hangar_turrets/left)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script static void test_ass
    (begin
        (device_operates_automatically_set "hangar_exit" true)
        (ai_place "hangar_heretic_06r" (random_range 0 2))
        (ai_place "hangar_heretic_06l" (- 1.0 (ai_living_count "hangar_heretic_06r")))
        (ai_place "hangar_grunts_04r" 1)
        (ai_place "hangar_grunts_04l" 1)
        (cs_run_command_script "hangar_heretics" snap_alert)
        (cs_queue_command_script "hangar_grunts_04r" deploy_hangar_right)
        (cs_queue_command_script "hangar_grunts_04l" deploy_hangar_left)
    )
)

(script dormant void hangar_firsttime_start
    (begin
        (data_mine_insert "04a_3_hangar")
        (object_create_containing "hang_can_")
        (wake hangar_helpers)
        (wake hangar_can_spawner)
        (wake hangar_killer_new)
        (wake hangar_sentinels_flitting)
        (wake hangar_door_monitor)
        (set hangar_power_on true)
        (ai_renew "all_allies")
        (ai_place "hangar_heretic_01r" (random_range 0 2))
        (ai_place "hangar_heretic_01l" (- 1.0 (ai_living_count "hangar_heretic_01r")))
        (ai_place "hangar_heretic_02l" (random_range 0 2))
        (ai_place "hangar_heretic_02r" (- 1.0 (ai_living_count "hangar_heretic_02l")))
        (ai_place "hangar_grunts_01r" (random_range 1 3))
        (ai_place "hangar_grunts_01l" (- 2.0 (ai_living_count "hangar_grunts_01r")))
        (sleep_until (> (device_get_position "elev_hangar") 0.1))
        (wake music_04a_01_start)
        (cs_run_command_script "all_allies" abort)
        (wake hangar_extra_save)
        (sleep_until (> (device_get_position "elev_hangar") 0.6))
        (set stealth_talk_gone true)
        (ai_set_orders "arm01_allies" "ride_hangar_elev")
        (wake hangar_alerted_call)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_hangar_mid_left" (players)) true)
                (= (volume_test_objects "vol_hangar_mid_right" (players)) true)
                (= (volume_test_objects "vol_hangar_end_left" (players)) true)
                (= (volume_test_objects "vol_hangar_end_right" (players)) true)
                (< (ai_living_count "hangar_heretics") 3)
            )
        )
        (game_save_no_timeout)
        (wake hangar_objective)
        (wake hangar_door_reminder)
        (if (= (volume_test_objects "vol_hangar_left" (players)) true) 
            (begin
                (ai_place "hangar_rein_her_02l" (- 3.0 (ai_living_count "hangar_grunts_01l")))
            )
        )
        (if (= (volume_test_objects "vol_hangar_right" (players)) true) 
            (begin
                (ai_place "hangar_rein_her_02r" (- 3.0 (ai_living_count "hangar_grunts_01r")))
            )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_hangar_end_left" (players)) true)
                (= (volume_test_objects "vol_hangar_end_right" (players)) true)
                (< (ai_living_count "hangar_heretics") 3)
            )
        )
        (game_save_no_timeout)
        (if (= (volume_test_objects "vol_hangar_left" (players)) true) 
            (begin
                (ai_place "hangar_rein_her_03l" (- 2.0 (+ (ai_living_count "hangar_heretic_01l") (ai_living_count "hangar_heretic_01r") (ai_living_count "hangar_heretic_02r") (ai_living_count "hangar_heretic_02l"))))
            )
        )
        (if (= (volume_test_objects "vol_hangar_right" (players)) true) 
            (begin
                (ai_place "hangar_rein_her_03r" (- 2.0 (+ (ai_living_count "hangar_heretic_01l") (ai_living_count "hangar_heretic_01r") (ai_living_count "hangar_heretic_02r") (ai_living_count "hangar_heretic_02l"))))
            )
        )
        (ai_set_orders "hangar_heretics_init" "defend_switch")
        (sleep_until (> (device_get_position "hangar_door_cinematic") 0.0))
        (wake hangar_exterior_toggle)
        (game_save_no_timeout)
        (sentinel_swarm_spawning)
        (sleep_until (< (ai_living_count "hangar_sentinel_swarm") 3) 30 8000)
        (sleep_until (< (ai_living_count "hangar_sentinel_swarm") 1) 30 900)
        (sleep 150)
        (game_save_no_timeout)
        (heretic_heavy_spawning)
        (sleep_until (< (ai_living_count "hangar_heretics") 3) 30 8000)
        (sleep_until (< (ai_living_count "hangar_heretics") 1) 30 900)
        (sleep 150)
        (game_save_no_timeout)
        (ai_place "hangar_a50_02r_high" (- (random_range 0 3) (ai_living_count "a50_high")))
        (cs_run_command_script "hangar_a50_02r_high" snap_alert)
        (ai_place "hangar_a50_02l_high" (- 2.0 (ai_living_count "a50_high")))
        (cs_run_command_script "hangar_a50_02l_high" snap_alert)
        (ai_place "hangar_a50_02r_low" (- (random_range 0 3) (ai_living_count "a50_low")))
        (cs_run_command_script "hangar_a50_02r_low" snap_alert)
        (ai_place "hangar_a50_02l_low" (- 2.0 (ai_living_count "a50_low")))
        (cs_run_command_script "hangar_a50_02l_low" snap_alert)
        (sleep_until 
            (or
                (< (ai_living_count "hangar_heretics") 3)
                (= (volume_test_objects "vol_hangar_center_exit" (players)) true)
            ) 
        30 3600)
        (game_save_no_timeout)
        (if 
            (and
                (= (volume_test_objects "vol_hangar_center_exit" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_place "hangar_a50_01r_high" (- (random_range 0 3) (ai_living_count "a50_high")))
                    (cs_run_command_script "hangar_a50_01r_high" snap_alert)
                    (ai_place "hangar_a50_01l_high" (- 2.0 (ai_living_count "a50_high")))
                    (cs_run_command_script "hangar_a50_01l_high" snap_alert)
                    (ai_place "hangar_a50_01r_low" (- (random_range 0 3) (ai_living_count "a50_low")))
                    (cs_run_command_script "hangar_a50_01r_low" snap_alert)
                    (ai_place "hangar_a50_01l_low" (- 2.0 (ai_living_count "a50_low")))
                    (cs_run_command_script "hangar_a50_01l_low" snap_alert)
                )
        )
        (sleep_until 
            (or
                (< (ai_living_count "hangar_heretics") 3)
                (= (volume_test_objects "vol_hangar_center_exit" (players)) true)
            ) 
        30 3600)
        (game_save_no_timeout)
        (device_operates_automatically_set "hangar_exit" true)
        (ai_place "hangar_heretic_06r" (random_range 0 2))
        (ai_place "hangar_heretic_06l" (- 1.0 (ai_living_count "hangar_heretic_06r")))
        (ai_place "hangar_grunts_04r" 1)
        (ai_place "hangar_grunts_04l" 1)
        (cs_run_command_script "hangar_heretics" snap_alert)
        (cs_queue_command_script "hangar_grunts_04r" deploy_hangar_right)
        (cs_queue_command_script "hangar_grunts_04l" deploy_hangar_left)
        (wake hangar_exit_warn)
        (wake hangar_reminder)
        (sleep_until (= (volume_test_objects "vol_leaving_hangar" (players)) true) 30 300)
        (ai_place "hangar_heretic_06c" 1)
        (cs_run_command_script "hangar_heretic_06c" snap_alert)
        (sleep_until (< (ai_living_count "hangar_heretics") 1))
        (game_save_no_timeout)
    )
)

(script dormant void first_hall_reinforce
    (begin
        (sleep_until 
            (and
                (> (ai_combat_status "first_hall_heretics") ai_combat_status_idle)
                (or
                    (< (ai_living_count "first_hall_heretic_01") 1)
                    (< (ai_living_count "first_hall_heretic_02") 1)
                )
            )
        )
        (ai_place "first_hall_heretic_03" 2)
        (cs_run_command_script "first_hall_heretic_03" snap_alert)
    )
)

(script dormant void to_underhangar_firsttime
    (begin
        (sleep_until (= (volume_test_objects "vol_hangar_reenter" (players)) true))
        (data_mine_insert "04a_4_first_halls")
        (game_save_no_timeout)
        (ai_renew "all_allies")
        (ai_migrate "hangar_heretics" "chasers")
        (ai_set_orders "chasers" "chase01")
        (ai_place "first_hall_heretic_01" 1)
        (ai_place "first_hall_grunts_01" 2)
        (ai_place "first_hall_heretic_02" 1)
        (sleep_until (= (volume_test_objects "vol_hangar_reenter" (players)) true))
        (wake first_hall_reinforce)
        (set stealth_talk_gone true)
        (ai_set_orders "arm01_allies" "allies_first_hall")
        (sleep_until (< (ai_living_count "first_hall_heretics") 1))
        (game_save_no_timeout)
    )
)

(script dormant void underhangar_can_spawner
    (begin
        (sleep_until (= underhangar_power_on true))
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_underhangar_can_all" 2048)) 15) 
                            (begin
                                (object_create_clone "underhangar_can_a")
                            )
                        )
                        (sleep recycling_time)
                    )
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_underhangar_can_all" 2048)) 15) 
                            (begin
                                (object_create_clone "underhangar_can_b")
                            )
                        )
                        (sleep recycling_time)
                    )
                )
                (= underhangar_power_on false)
            )
        )
    )
)

(script dormant void underhangar_killer_new
    (begin
        (sleep_until (= underhangar_power_on true))
        (sleep_until 
            (begin
                (object_destroy (list_get (volume_return_objects "kill_underhangar_pit_01") 0))
                (sleep 45)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_underhangar_pit_01" 1) 0)))
                (sleep 45)
                (object_destroy (list_get (volume_return_objects "kill_underhangar_pit_02") 0))
                (sleep 45)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_underhangar_pit_02" 1) 0)))
                (sleep 45)
                (= underhangar_power_on false)
            )
        )
    )
)

(script dormant void new_allies_02
    (begin
        (if 
            (and
                (= (volume_test_objects "vol_hangar_can_all" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (sleep_until 
                        (begin
                            (object_destroy (list_get (volume_return_objects_by_type "vol_hangar_can_all" 1) 0))
                            (= (list_count (volume_return_objects_by_type "vol_hangar_can_all" 1)) 0)
                        ) 
                    10)
                )
        )
        (if 
            (and
                (= (volume_test_objects "vol_underhangar_reinforce" (players)) false)
                (> (player_count) 0)
                (< (ai_living_count "arm01_allies") 3)
            ) 
                (begin
                    (ai_place "reinforce_elites_02" (- 1.0 (ai_living_count "allies_elites")))
                    (ai_place "reinforce_grunts_02" (- 1.0 (ai_living_count "allies_grunts")))
                )
        )
    )
)

(script dormant void underhangar_reinforce
    (begin
        (sleep_until (> (ai_combat_status "underhangar_heretics") ai_combat_status_idle))
        (if 
            (and
                (= (volume_test_objects "vol_underhangar_halfway" (players)) false)
                (= (volume_test_objects "vol_underhangar_end" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "underhangar_heretics") 8) 
                        (ai_place "underhangar_rein_her_01" 2))
                    (cs_run_command_script "underhangar_rein_her_01" snap_alert)
                )
        )
        (sleep_until 
            (or
                (= (volume_test_objects "vol_underhangar_halfway" (players)) true)
                (= (volume_test_objects "vol_underhangar_end" (players)) true)
            )
        )
        (if 
            (and
                (= (volume_test_objects "vol_underhangar_end" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (if (< (ai_living_count "underhangar_heretics") 8) 
                        (ai_place "underhangar_rein_her_02" 2))
                    (cs_run_command_script "underhangar_rein_her_02" snap_alert)
                )
        )
        (sleep_until (= (volume_test_objects "vol_underhangar_end" (players)) true))
        (if (< (ai_living_count "underhangar_heretics") 8) 
            (ai_place "underhangar_grunts_03" 4))
        (cs_run_command_script "underhangar_grunts_03" snap_alert)
    )
)

(script command_script void underhangar_comment
    (begin
        (cs_switch "ally")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'shall we keep moving, arbiter? the heretic-leader cowers below!'")
        (cs_play_line "1160")
    )
)

(script dormant void underhangar_reminder
    (begin
        (sleep_until (= (volume_test_objects "vol_underhangar_from_bottom" (players)) true) 30 900)
        (if 
            (and
                (= (volume_test_objects "vol_underhangar_from_bottom" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_scene "underhangar_scene" underhangar_comment "all_allies")
                )
        )
    )
)

(script dormant void underhangar_firsttime_start
    (begin
        (data_mine_insert "04a_5_underhangar")
        (game_save_no_timeout)
        (ai_renew "all_allies")
        (object_create_containing "underhang_can_")
        (if 
            (and
                (= (volume_test_objects_all "vol_hangar_left" (players)) false)
                (= (volume_test_objects_all "vol_hangar_right" (players)) false)
                (> (device_get_position "hangar_exit") 0.0)
                (> (player_count) 0)
            ) 
                (begin
                    (pvs_clear "hangar_door_cinematic")
                    (sleep 2)
                    (device_set_position_immediate "hangar_door_cinematic" 0.0)
                    (sleep 2)
                    (player_enable_input)
                )
        )
        (wake underhangar_can_spawner)
        (wake underhangar_killer_new)
        (wake underhangar_reinforce)
        (set underhangar_power_on true)
        (ai_migrate "first_hall_heretics" "chasers")
        (ai_set_orders "chasers" "chase01")
        (ai_place "underhangar_heretic_01" 1)
        (ai_place "underhangar_grunts_01" 3)
        (set stealth_talk_gone true)
        (ai_set_orders "arm01_allies" "allies_underhangar")
        (sleep 5)
        (wake music_04a_02_start)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_underhangar_halfway" (players)) true)
                (< (ai_living_count "underhangar_heretics") 1)
            )
        )
        (game_save_no_timeout)
        (wake new_allies_02)
        (if (< (ai_living_count "underhangar_heretics") 8) 
            (ai_place "underhangar_heretic_02" 1))
        (if (< (ai_living_count "underhangar_heretics") 8) 
            (ai_place "underhangar_grunts_02" 2))
        (sleep_until 
            (or
                (< (ai_living_count "underhangar_heretics") 1)
                (= (volume_test_objects "vol_underhangar_from_bottom" (players)) true)
            )
        )
        (game_save_no_timeout)
        (wake underhangar_reminder)
        (wake music_04a_02_stop)
    )
)

(script dormant void second_hall_reinforce_01
    (begin
        (sleep_until 
            (or
                (> (ai_combat_status "second_hall_grunts_01") ai_combat_status_idle)
                (> (ai_combat_status "second_hall_heretic_01") ai_combat_status_idle)
            )
        )
        (ai_place "second_hall_heretic_02" 1)
        (cs_run_command_script "second_hall_heretic_02" snap_alert)
    )
)

(script dormant void second_hall_reinforce_02
    (begin
        (sleep_until (> (ai_combat_status "second_hall_heretic_03") ai_combat_status_idle))
        (ai_place "second_hall_grunts_02/1")
        (ai_place "second_hall_grunts_02/2")
        (if 
            (and
                (= (volume_test_objects "vol_2nd_hall_02" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_place "second_hall_grunts_02/3")
                    (ai_place "second_hall_grunts_02/4")
                )
        )
        (cs_run_command_script "second_hall_grunts_02" snap_alert)
    )
)

(script dormant void second_hall_reinforce_03
    (begin
        (sleep_until (> (ai_combat_status "second_hall_grunts_03") ai_combat_status_idle))
        (ai_place "second_hall_heretic_04" 1)
        (if 
            (and
                (= (volume_test_objects "vol_2nd_hall_02" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_place "second_hall_heretic_05" 1)
                )
        )
        (cs_run_command_script "second_hall_heretic_04" snap_alert)
        (cs_run_command_script "second_hall_heretic_05" snap_alert)
    )
)

(script dormant void to_bottling
    (begin
        (sleep_until (= (volume_test_objects "vol_underhangar_from_bottom" (players)) true))
        (data_mine_insert "04a_6_second_halls")
        (game_save_no_timeout)
        (ai_renew "all_allies")
        (activate_nav_point_object)
        (if (> (device_get_position "hangar_door_cinematic") 0.0) 
            (begin
                (pvs_clear "hangar_door_cinematic")
                (sleep 2)
                (device_set_position_immediate "hangar_door_cinematic" 0.0)
                (sleep 2)
                (player_enable_input)
            )
        )
        (wake second_hall_reinforce_01)
        (wake second_hall_reinforce_02)
        (wake second_hall_reinforce_03)
        (ai_migrate "underhangar_heretics" "chasers")
        (ai_set_orders "chasers" "chase02")
        (ai_place "second_hall_heretic_01" 1)
        (ai_place "second_hall_grunts_01" 2)
        (set stealth_talk_gone true)
        (ai_set_orders "arm01_allies" "allies_second_hall")
        (sleep_until (= (volume_test_objects "vol_2nd_hall_01" (players)) true))
        (game_save_no_timeout)
        (ai_place "second_hall_heretic_03" 1)
        (ai_place "second_hall_grunts_03" 4)
        (if (< (ai_combat_status "second_hall_heretics") ai_combat_status_active) 
            (begin
                (ai_set_active_camo "arm01_allies" true)
                (ai_suppress_combat "arm01_allies" true)
            )
        )
    )
)

(script dormant void bottling_can_spawner
    (begin
        (sleep_until (= bottling_power_on true))
        (sleep_until 
            (begin
                (begin_random
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_bottling_can_all" 2048)) 10) 
                            (begin
                                (object_create_clone "bottling_can_a")
                                (sleep recycling_time)
                            )
                        )
                        (sleep recycling_time)
                    )
                    (begin
                        (if (< (list_count (volume_return_objects_by_type "vol_bottling_can_all" 2048)) 10) 
                            (begin
                                (object_create_clone "bottling_can_b")
                                (sleep recycling_time)
                            )
                        )
                        (sleep recycling_time)
                    )
                )
                (= bottling_power_on false)
            )
        )
    )
)

(script dormant void bottling_killer_new
    (begin
        (sleep_until (= bottling_power_on true))
        (sleep_until 
            (begin
                (object_destroy (list_get (volume_return_objects "kill_bottling_pit_01") 0))
                (sleep 45)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_bottling_pit_01" 1) 0)))
                (sleep 45)
                (object_destroy (list_get (volume_return_objects "kill_bottling_pit_02") 0))
                (sleep 45)
                (unit_kill_silent (unit (list_get (volume_return_objects_by_type "kill_bottling_pit_02" 1) 0)))
                (sleep 45)
                (= bottling_power_on false)
            )
        )
    )
)

(script command_script void bottling_sentinel_call
    (begin
        (cs_switch "heretic")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "heretic: 'we need sentinels!'")
        (cs_play_line "0450")
    )
)

(script dormant void new_allies_03
    (begin
        (if 
            (and
                (= (volume_test_objects "vol_underhangar_can_all" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (sleep_until 
                        (begin
                            (object_destroy (list_get (volume_return_objects_by_type "vol_underhangar_can_all" 1) 0))
                            (= (list_count (volume_return_objects_by_type "vol_underhangar_can_all" 1)) 0)
                        ) 
                    10)
                )
        )
        (if 
            (and
                (= (volume_test_objects "vol_bottling_reinforce" (players)) false)
                (> (player_count) 0)
                (< (ai_living_count "arm01_allies") 3)
            ) 
                (begin
                    (ai_place "reinforce_elites_03" (- 1.0 (ai_living_count "allies_elites")))
                    (ai_place "reinforce_grunts_03" (- 1.0 (ai_living_count "allies_grunts")))
                )
        )
    )
)

(script dormant void bottling_firsttime_start
    (begin
        (data_mine_insert "04a_7_bottling_plant")
        (game_save_no_timeout)
        (object_create_containing "bott_can_")
        (ai_renew "all_allies")
        (set stealth_talk_gone true)
        (ai_set_orders "arm01_allies" "allies_bottling")
        (wake bottling_can_spawner)
        (wake bottling_killer_new)
        (set bottling_power_on true)
        (ai_migrate "second_hall_heretics" "chasers")
        (ai_set_orders "chasers" "chase02")
        (ai_place "bottling_heretics_01" 2)
        (ai_place "bottling_grunts_01" 2)
        (ai_place "bottling_sentinels_01" 2)
        (sleep_until (= (volume_test_objects "vol_bottling_really_inside" (players)) true))
        (wake new_allies_03)
        (sleep_until 
            (or
                (< (ai_living_count "bottling_heretics") 2)
                (= (volume_test_objects "vol_bottling_mid01" (players)) true)
                false
            )
        )
        (game_save_no_timeout)
        (ai_place "bottling_heretics_02" (- 1.0 (ai_living_count "bottling_heretics_01")))
        (ai_place "bottling_grunts_02" (- 4.0 (ai_living_count "bottling_grunts_01")))
        (sleep_until 
            (or
                (< (ai_living_count "bottling_heretics") 2)
                (= (volume_test_objects "vol_bottling_mid02" (players)) true)
                false
            )
        )
        (game_save_no_timeout)
        (ai_place "bottling_heretics_03" (- 2.0 (+ (ai_living_count "bottling_heretics_01") (ai_living_count "bottling_heretics_02"))))
        (ai_place "bottling_grunts_03" (- 3.0 (+ (ai_living_count "bottling_grunts_02") (ai_living_count "bottling_grunts_01"))))
        (sleep_until 
            (and
                (< (ai_living_count "bottling_heretics") 1)
                (< (ai_living_count "bottling_sentinels") 1)
            )
        )
        (game_save_no_timeout)
    )
)

(script command_script void hl_retreat_01
    (begin
        (cs_switch "heretic_01")
        (cs_force_combat_status 4)
        (cs_face_player true)
        (cs_suppress_dialogue_global true)
        (print "heretic leader: 'there! the assassin!'")
        (cs_custom_animation "objects\characters\elite\elite" "combat:rifle:warn" 1.0 true)
        (cs_face_player false)
    )
)

(script command_script void hl_retreat_backup
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to bottling_plant/p1)
        (ai_erase "heretic_leader_02")
    )
)

(script command_script void sentinel_wingmen_a
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to airspace_hl/sen_a_0 5.0)
        (cs_fly_to airspace_hl/sen_a_1 20.0)
        (ai_erase "bottling_sentinels_03/a")
    )
)

(script command_script void sentinel_wingmen_b
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_fly_to airspace_hl/sen_b_0 5.0)
        (cs_fly_to airspace_hl/sen_b_1 20.0)
        (ai_erase "bottling_sentinels_03/b")
    )
)

(script command_script void hl_retreat_02
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_force_combat_status 4)
        (cs_approach "approach_here" 1.0 20.0 20.0)
        (cs_suppress_dialogue_global true)
        (print "heretic leader: 'deal with him, my brothers!'")
        (cs_play_line "0470")
        (sleep 15)
        (print "'i will defend the oracle!'")
        (cs_play_line "0480")
        (set hl_done_yapping true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "ledge_banshees_01/center") false)
        (cs_approach_stop)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "ledge_banshees_01/center"))
        (wake music_04a_03_start)
        (cs_fly_to airspace_hl/hl0 5.0)
        (cs_vehicle_boost true)
        (cs_fly_to airspace_hl/hl1 20.0)
        (ai_erase "heretic_leader_03")
    )
)

(script command_script void hl_retreat_react
    (begin
        (cs_switch "heretic")
        (cs_force_combat_status 4)
        (cs_enable_moving true)
        (cs_suppress_dialogue_global true)
        (print "heretic: 'its truth must not be silenced!'")
        (cs_play_line "0490")
    )
)

(script dormant void bottling_overlook_reinforce
    (begin
        (ai_place "bottling_sentinels_02" 1)
        (sleep 120)
        (ai_place "bottling_sentinels_02" 1)
        (sleep 120)
        (ai_place "bottling_sentinels_02" 1)
    )
)

(script command_script void phantom_to_ledge
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.75)
        (cs_fly_by airspace/ph0x 10.0)
        (cs_fly_to_and_face airspace/ph00 airspace/ph01 5.0)
        (sleep_forever)
    )
)

(script command_script void bottling_elites_secure
    (begin
        (cs_switch "elite")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops elite: 'onward, arbiter!  we will secure this section of the station!'")
        (cs_play_line "1170")
    )
)

(script command_script void bottling_grunts_secure
    (begin
        (cs_switch "grunt")
        (cs_abort_on_damage true)
        (cs_suppress_dialogue_global true)
        (print "spec-ops grunt: 'you go. we stay. grunt not allowed to fly.'")
        (cs_play_line "1180")
    )
)

(script dormant void bottling_allies_secure
    (begin
        (sleep_until 
            (or
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player1))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player1))) true)
            ) 
        30 900)
        (if 
            (and
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player0))) false)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player0))) false)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player1))) false)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player1))) false)
            ) 
                (begin
                    (if (> (ai_living_count "allies_elites") 0) 
                        (ai_scene "bottling_elite_scene" bottling_elites_secure "allies_elites") (ai_scene "bottling_grunt_scene" bottling_grunts_secure "allies_grunts"))
                )
        )
    )
)

(script dormant void big_filth_toggle
    (begin
        (sleep_until (= (volume_test_objects "vol_on_banshee_ledge" (players)) true))
        (sound_class_enable_ducker "ambient_machinery" 0.0 2)
        (object_create "big_filthy_audio1")
        (sound_class_enable_ducker "ambient_machinery" 1.0 2)
        (sleep_until 
            (begin
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_bottling_back_top" (players)) true)
                        (= (volume_test_objects "vol_bottling_back" (players)) true)
                        (= (volume_test_objects "vol_bottling_exit_r" (players)) true)
                        (= (volume_test_objects "vol_bottling_exit_l" (players)) true)
                    )
                )
                (sound_class_enable_ducker "ambient_machinery" 0.0 2)
                (object_destroy "big_filthy_audio1")
                (sound_class_enable_ducker "ambient_machinery" 1.0 2)
                (sleep_until (= (volume_test_objects "vol_on_banshee_ledge" (players)) true))
                (sound_class_enable_ducker "ambient_machinery" 0.0 2)
                (object_create "big_filthy_audio1")
                (sound_class_enable_ducker "ambient_machinery" 1.0 2)
                false
            )
        )
    )
)

(script dormant void bring_in_da_phantom
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_bottling_exit_l" (players)) true)
                (= (volume_test_objects "vol_bottling_exit_r" (players)) true)
                (= (volume_test_objects "vol_on_banshee_ledge" (players)) true)
            )
        )
        (game_save_no_timeout)
        (wake 04a_title1)
        (wake big_filth_toggle)
        (ai_place "allied_phantom_01")
        (object_cannot_take_damage (ai_vehicle_get_from_starting_location "allied_phantom_01/driver"))
        (cs_run_command_script "allied_phantom_01/driver" phantom_to_ledge)
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'the heretics are mobilizing their air-forces, dervish!'")
        (sleep (ai_play_line_on_object none "0500"))
        (sleep 15)
        (print "'get after their leader, but watch your back!'")
        (sleep (ai_play_line_on_object none "0510"))
        (sleep 15)
        (print "'i'm sending one of our phantoms to support you!'")
        (sleep (ai_play_line_on_object none "0520"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void bottling_plant_end
    (begin
        (sleep_until (= (volume_test_objects "vol_bottling_back" (players)) true))
        (data_mine_insert "04a_8_bottling_back")
        (game_save_no_timeout)
        (ai_migrate "bottling_heretics_start" "chasers")
        (ai_set_orders "chasers" "chase03")
        (if (< (ai_living_count "bottling_enemies") 8) 
            (ai_place "bottling_heretics_04" 2))
        (ai_place "dog_turrets_01")
        (ai_place "ledge_banshees_01")
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "ledge_banshees_01/center") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") true)
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") true)
        (ai_place "bottling_heretics_05" 2)
        (ai_place "heretic_leader_03")
        (cs_run_command_script "heretic_leader_03" long_pause)
        (object_cannot_take_damage (ai_actors "heretic_leader_03"))
        (set left_bottling_firsthalf true)
        (sleep_until (= (volume_test_objects "vol_hl_delete_02" (players)) true) 30 90)
        (if 
            (and
                (= (volume_test_objects "vol_hl_delete_02" (players)) false)
                (> (player_count) 0)
                (< (ai_living_count "bottling_enemies") 8)
            ) 
                (ai_place "bottling_grunts_04" 3))
        (sleep_until (= (volume_test_objects "vol_hl_delete_02" (players)) true))
        (cs_run_command_script "heretic_leader_03" hl_retreat_02)
        (sleep_until (= hl_done_yapping true) 30 450)
        (sleep_until (ai_scene "heretic_retreat_02_scene" hl_retreat_react "bottling_heretics_05") 30 90)
        (game_save_no_timeout)
        (begin_random
            (if (= overlook_choose_side false) 
                (begin
                    (set overlook_choose_side true)
                    (ai_place "bottling_grunts_05/r1")
                    (ai_place "bottling_grunts_05/r2")
                    (ai_place "bottling_grunts_05/r3")
                    (device_operates_automatically_set "viewroom_exit02" true)
                    (object_create "blocker_l")
                )
            )
            (if (= overlook_choose_side false) 
                (begin
                    (set overlook_choose_side true)
                    (ai_place "bottling_grunts_05/l1")
                    (ai_place "bottling_grunts_05/l2")
                    (ai_place "bottling_grunts_05/l3")
                    (device_operates_automatically_set "viewroom_exit01" true)
                    (object_create "blocker_r")
                )
            )
        )
        (ai_set_orders "bottling_heretics_05" "bottling_h_wave_05_high")
        (wake bring_in_da_phantom)
        (sleep_until (< (ai_living_count "bottling_heretics_05") 1))
        (game_save_no_timeout)
        (wake bottling_overlook_reinforce)
        (sleep_until 
            (and
                (< (ai_living_count "bottling_heretics") 1)
                (< (ai_living_count "bottling_sentinels") 1)
            )
        )
        (game_save_no_timeout)
        (wake bottling_allies_secure)
    )
)

(script command_script void partytime
    (begin
        (cs_face true arm02_lz/cake)
        (sleep_forever)
    )
)

(script dormant void grunt_birthday_party
    (begin
        (sleep_until (= (volume_test_objects "vol_grunt_bday" (players)) true))
        (object_create "bday_cake")
        (ai_place "bday_party")
        (cs_run_command_script "bday_party" partytime)
        (custom_animation_loop (unit (list_get (ai_actors "bday_party") 0)) "objects\characters\grunt\grunt" "combat:pistol:cheer" true)
        (custom_animation_loop (unit (list_get (ai_actors "bday_party") 1)) "objects\characters\grunt\grunt" "combat:pistol:cheer" true)
        (custom_animation_loop (unit (list_get (ai_actors "bday_party") 2)) "objects\characters\grunt\grunt" "combat:pistol:cheer" true)
        (custom_animation_loop (unit (list_get (ai_actors "bday_party") 3)) "objects\characters\grunt\grunt" "combat:pistol:cheer" true)
        (custom_animation_loop (unit (list_get (ai_actors "bday_party") 4)) "objects\characters\grunt\grunt" "combat:pistol:cheer" true)
        (custom_animation_loop (unit (list_get (ai_actors "bday_party") 5)) "objects\characters\grunt\grunt" "combat:pistol:cheer" true)
        (sleep_until 
            (or
                (unit_has_weapon (unit (player0)) "objects\weapons\multiplayer\ball\head_sp.weapon")
                (unit_has_weapon (unit (player1)) "objects\weapons\multiplayer\ball\head_sp.weapon")
            )
        )
        (reset_dsp_image 1)
    )
)

(script dormant void banshee_stuck_spawner_01
    (begin
        (sleep_until (= (unit_in_vehicle (player0)) true))
        (sleep_until 
            (begin
                (sleep_until 
                    (and
                        (= (unit_in_vehicle (player0)) false)
                        (= (volume_test_object "vol_arm_02_lz" (player0)) false)
                        (> (player_count) 0)
                    )
                )
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_01" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01a") 2.0)
                                    ) 
                                        (object_create_clone "extra01a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01b") 2.0)
                                    ) 
                                        (object_create_clone "extra01b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01c") 2.0)
                                    ) 
                                        (object_create_clone "extra01c"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01d" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01d") 2.0)
                                    ) 
                                        (object_create_clone "extra01d"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_02" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02a") 2.0)
                                    ) 
                                        (object_create_clone "extra02a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02b") 2.0)
                                    ) 
                                        (object_create_clone "extra02b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02c") 2.0)
                                    ) 
                                        (object_create_clone "extra02c"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02d" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02d") 2.0)
                                    ) 
                                        (object_create_clone "extra02d"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_03" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                                        (= (objects_can_see_flag (players) "03a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "03a") 2.0)
                                    ) 
                                        (object_create_clone "extra03a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                                        (= (objects_can_see_flag (players) "03b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "03b") 2.0)
                                    ) 
                                        (object_create_clone "extra03b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                                        (= (objects_can_see_flag (players) "03c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "03c") 2.0)
                                    ) 
                                        (object_create_clone "extra03c"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_04" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_04" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_04" 2)) 0)
                                        (= (objects_can_see_flag (players) "04a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "04a") 2.0)
                                    ) 
                                        (object_create_clone "extra04a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_04" 2)) 0)
                                        (= (objects_can_see_flag (players) "04b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "04b") 2.0)
                                    ) 
                                        (object_create_clone "extra04b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_05" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_05" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_05" 2)) 0)
                                        (= (objects_can_see_flag (players) "05a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "05a") 2.0)
                                    ) 
                                        (object_create_clone "extra05a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_05" 2)) 0)
                                        (= (objects_can_see_flag (players) "05b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "05b") 2.0)
                                    ) 
                                        (object_create_clone "extra05b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_06" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_06" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_06" 2)) 0)
                                        (= (objects_can_see_flag (players) "06a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "06a") 2.0)
                                    ) 
                                        (object_create_clone "extra06a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_06" 2)) 0)
                                        (= (objects_can_see_flag (players) "06b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "06b") 2.0)
                                    ) 
                                        (object_create_clone "extra06b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_07" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                                        (= (objects_can_see_flag (players) "07a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "07a") 2.0)
                                    ) 
                                        (object_create_clone "extra07a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                                        (= (objects_can_see_flag (players) "07b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "07b") 2.0)
                                    ) 
                                        (object_create_clone "extra07b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                                        (= (objects_can_see_flag (players) "07c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "07c") 2.0)
                                    ) 
                                        (object_create_clone "extra07c"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_08" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_08" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_08" 2)) 0)
                                        (= (objects_can_see_flag (players) "08a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "08a") 2.0)
                                    ) 
                                        (object_create_clone "extra08a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_08" 2)) 0)
                                        (= (objects_can_see_flag (players) "08b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "08b") 2.0)
                                    ) 
                                        (object_create_clone "extra08b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_09" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_09" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_09" 2)) 0)
                                        (= (objects_can_see_flag (players) "09a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "09a") 2.0)
                                    ) 
                                        (object_create_clone "extra09a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_09" 2)) 0)
                                        (= (objects_can_see_flag (players) "09b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "09b") 2.0)
                                    ) 
                                        (object_create_clone "extra09b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_10" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_10" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_10" 2)) 0)
                                        (= (objects_can_see_flag (players) "10a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "10a") 2.0)
                                    ) 
                                        (object_create_clone "extra10a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_10" 2)) 0)
                                        (= (objects_can_see_flag (players) "10b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "10b") 2.0)
                                    ) 
                                        (object_create_clone "extra10b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_11" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                                        (= (objects_can_see_flag (players) "11a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "11a") 2.0)
                                    ) 
                                        (object_create_clone "extra11a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                                        (= (objects_can_see_flag (players) "11b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "11b") 2.0)
                                    ) 
                                        (object_create_clone "extra11b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                                        (= (objects_can_see_flag (players) "11c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "11c") 2.0)
                                    ) 
                                        (object_create_clone "extra11c"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_12" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                                        (= (objects_can_see_flag (players) "12a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "12a") 2.0)
                                    ) 
                                        (object_create_clone "extra12a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                                        (= (objects_can_see_flag (players) "12b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "12b") 2.0)
                                    ) 
                                        (object_create_clone "extra12b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                                        (= (objects_can_see_flag (players) "12c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "12c") 2.0)
                                    ) 
                                        (object_create_clone "extra12c"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_13" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                                        (= (objects_can_see_flag (players) "13a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "13a") 2.0)
                                    ) 
                                        (object_create_clone "extra13a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                                        (= (objects_can_see_flag (players) "13b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "13b") 2.0)
                                    ) 
                                        (object_create_clone "extra13b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                                        (= (objects_can_see_flag (players) "13c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "13c") 2.0)
                                    ) 
                                        (object_create_clone "extra13c"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_14" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_14" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_14" 2)) 0)
                                        (= (objects_can_see_flag (players) "14a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "14a") 2.0)
                                    ) 
                                        (object_create_clone "extra14a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_14" 2)) 0)
                                        (= (objects_can_see_flag (players) "14b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "14b") 2.0)
                                    ) 
                                        (object_create_clone "extra14b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_15" (player0)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_15" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_15" 2)) 0)
                                        (= (objects_can_see_flag (players) "15a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "15a") 2.0)
                                    ) 
                                        (object_create_clone "extra15a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_15" 2)) 0)
                                        (= (objects_can_see_flag (players) "15b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "15b") 2.0)
                                    ) 
                                        (object_create_clone "extra15b"))
                                (= (unit_in_vehicle (player0)) true)
                            )
                        ))
                false
            )
        )
    )
)

(script dormant void banshee_stuck_spawner_02
    (begin
        (sleep_until (= (unit_in_vehicle (player1)) true))
        (sleep_until 
            (begin
                (sleep_until 
                    (and
                        (= (unit_in_vehicle (player1)) false)
                        (= (volume_test_object "vol_arm_02_lz" (player1)) false)
                        (> (player_count) 0)
                    )
                )
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_01" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01a") 2.0)
                                    ) 
                                        (object_create_clone "extra01a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01b") 2.0)
                                    ) 
                                        (object_create_clone "extra01b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01c") 2.0)
                                    ) 
                                        (object_create_clone "extra01c"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                                        (= (objects_can_see_flag (players) "01d" 45.0) false)
                                        (> (objects_distance_to_flag (players) "01d") 2.0)
                                    ) 
                                        (object_create_clone "extra01d"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_02" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02a") 2.0)
                                    ) 
                                        (object_create_clone "extra02a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02b") 2.0)
                                    ) 
                                        (object_create_clone "extra02b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02c") 2.0)
                                    ) 
                                        (object_create_clone "extra02c"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_02" 2)) 0)
                                        (= (objects_can_see_flag (players) "02d" 45.0) false)
                                        (> (objects_distance_to_flag (players) "02d") 2.0)
                                    ) 
                                        (object_create_clone "extra02d"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_03" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                                        (= (objects_can_see_flag (players) "03a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "03a") 2.0)
                                    ) 
                                        (object_create_clone "extra03a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                                        (= (objects_can_see_flag (players) "03b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "03b") 2.0)
                                    ) 
                                        (object_create_clone "extra03b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_03" 2)) 0)
                                        (= (objects_can_see_flag (players) "03c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "03c") 2.0)
                                    ) 
                                        (object_create_clone "extra03c"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_04" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_04" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_04" 2)) 0)
                                        (= (objects_can_see_flag (players) "04a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "04a") 2.0)
                                    ) 
                                        (object_create_clone "extra04a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_04" 2)) 0)
                                        (= (objects_can_see_flag (players) "04b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "04b") 2.0)
                                    ) 
                                        (object_create_clone "extra04b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_05" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_05" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_05" 2)) 0)
                                        (= (objects_can_see_flag (players) "05a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "05a") 2.0)
                                    ) 
                                        (object_create_clone "extra05a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_05" 2)) 0)
                                        (= (objects_can_see_flag (players) "05b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "05b") 2.0)
                                    ) 
                                        (object_create_clone "extra05b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_06" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_06" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_06" 2)) 0)
                                        (= (objects_can_see_flag (players) "06a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "06a") 2.0)
                                    ) 
                                        (object_create_clone "extra06a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_06" 2)) 0)
                                        (= (objects_can_see_flag (players) "06b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "06b") 2.0)
                                    ) 
                                        (object_create_clone "extra06b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_07" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                                        (= (objects_can_see_flag (players) "07a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "07a") 2.0)
                                    ) 
                                        (object_create_clone "extra07a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                                        (= (objects_can_see_flag (players) "07b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "07b") 2.0)
                                    ) 
                                        (object_create_clone "extra07b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_07" 2)) 0)
                                        (= (objects_can_see_flag (players) "07c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "07c") 2.0)
                                    ) 
                                        (object_create_clone "extra07c"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_08" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_08" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_08" 2)) 0)
                                        (= (objects_can_see_flag (players) "08a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "08a") 2.0)
                                    ) 
                                        (object_create_clone "extra08a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_08" 2)) 0)
                                        (= (objects_can_see_flag (players) "08b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "08b") 2.0)
                                    ) 
                                        (object_create_clone "extra08b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_09" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_09" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_09" 2)) 0)
                                        (= (objects_can_see_flag (players) "09a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "09a") 2.0)
                                    ) 
                                        (object_create_clone "extra09a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_09" 2)) 0)
                                        (= (objects_can_see_flag (players) "09b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "09b") 2.0)
                                    ) 
                                        (object_create_clone "extra09b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_10" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_10" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_10" 2)) 0)
                                        (= (objects_can_see_flag (players) "10a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "10a") 2.0)
                                    ) 
                                        (object_create_clone "extra10a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_10" 2)) 0)
                                        (= (objects_can_see_flag (players) "10b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "10b") 2.0)
                                    ) 
                                        (object_create_clone "extra10b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_11" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                                        (= (objects_can_see_flag (players) "11a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "11a") 2.0)
                                    ) 
                                        (object_create_clone "extra11a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                                        (= (objects_can_see_flag (players) "11b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "11b") 2.0)
                                    ) 
                                        (object_create_clone "extra11b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_11" 2)) 0)
                                        (= (objects_can_see_flag (players) "11c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "11c") 2.0)
                                    ) 
                                        (object_create_clone "extra11c"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_12" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                                        (= (objects_can_see_flag (players) "12a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "12a") 2.0)
                                    ) 
                                        (object_create_clone "extra12a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                                        (= (objects_can_see_flag (players) "12b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "12b") 2.0)
                                    ) 
                                        (object_create_clone "extra12b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_12" 2)) 0)
                                        (= (objects_can_see_flag (players) "12c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "12c") 2.0)
                                    ) 
                                        (object_create_clone "extra12c"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_13" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                                        (= (objects_can_see_flag (players) "13a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "13a") 2.0)
                                    ) 
                                        (object_create_clone "extra13a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                                        (= (objects_can_see_flag (players) "13b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "13b") 2.0)
                                    ) 
                                        (object_create_clone "extra13b"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_13" 2)) 0)
                                        (= (objects_can_see_flag (players) "13c" 45.0) false)
                                        (> (objects_distance_to_flag (players) "13c") 2.0)
                                    ) 
                                        (object_create_clone "extra13c"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_14" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_14" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_14" 2)) 0)
                                        (= (objects_can_see_flag (players) "14a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "14a") 2.0)
                                    ) 
                                        (object_create_clone "extra14a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_14" 2)) 0)
                                        (= (objects_can_see_flag (players) "14b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "14b") 2.0)
                                    ) 
                                        (object_create_clone "extra14b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                (if 
                    (and
                        (= (volume_test_object "vol_stuck_15" (player1)) true)
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_15" 2)) 0)
                    ) 
                        (sleep_until 
                            (begin
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_15" 2)) 0)
                                        (= (objects_can_see_flag (players) "15a" 45.0) false)
                                        (> (objects_distance_to_flag (players) "15a") 2.0)
                                    ) 
                                        (object_create_clone "extra15a"))
                                (if 
                                    (and
                                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_15" 2)) 0)
                                        (= (objects_can_see_flag (players) "15b" 45.0) false)
                                        (> (objects_distance_to_flag (players) "15b") 2.0)
                                    ) 
                                        (object_create_clone "extra15b"))
                                (= (unit_in_vehicle (player1)) true)
                            )
                        ))
                false
            )
        )
    )
)

(script command_script void phantom_path
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.1)
        (cs_fly_by airspace/ph01 10.0)
        (set phantom_course_pos 1)
        (cs_fly_by airspace/ph02 10.0)
        (set phantom_course_pos 2)
        (cs_fly_by airspace/ph03 10.0)
        (set phantom_course_pos 3)
        (cs_fly_by airspace/ph04 10.0)
        (set phantom_course_pos 4)
        (cs_fly_by airspace/ph05 10.0)
        (set phantom_course_pos 5)
        (cs_fly_by airspace/ph06 10.0)
        (set phantom_course_pos 6)
        (cs_fly_by airspace/ph07 10.0)
        (set phantom_course_pos 7)
        (cs_fly_by airspace/ph08 10.0)
        (set phantom_course_pos 8)
        (cs_fly_by airspace/ph09 10.0)
        (set phantom_course_pos 9)
        (cs_fly_by airspace/ph10 10.0)
        (set phantom_course_pos 10)
        (cs_fly_by airspace/ph11 10.0)
        (set phantom_course_pos 11)
        (cs_vehicle_speed 0.05)
        (cs_fly_by airspace/ph12 10.0)
        (set phantom_course_pos 12)
        (cs_fly_to airspace/ph13 5.0)
        (set phantom_course_pos 13)
        (cs_pause -1.0)
    )
)

(script command_script void arm02_swat_aim_00
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to arm02_lz/p0)
        (cs_aim true arm02_lz/door)
        (sleep_forever)
    )
)

(script command_script void arm02_swat_aim_01
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to arm02_lz/p1)
        (cs_aim true arm02_lz/door)
        (sleep_forever)
    )
)

(script command_script void arm02_swat_aim_02
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to arm02_lz/p2)
        (cs_aim true arm02_lz/door)
        (sleep_forever)
    )
)

(script command_script void arm02_swat_aim_03
    (begin
        (cs_abort_on_damage true)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to arm02_lz/p3)
        (cs_aim true arm02_lz/door)
        (sleep_forever)
    )
)

(script command_script void arm02_final_approach
    (begin
        (cs_enable_pathfinding_failsafe true)
        (cs_vehicle_speed 0.5)
        (cs_fly_to airspace/ph13 2.0)
        (sleep 60)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_a01)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_a02)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_a03)
        (cs_run_command_script "allies_elites_03/elite01" arm02_swat_aim_00)
        (cs_run_command_script "allies_elites_03/elite02" arm02_swat_aim_01)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_b01)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_b02)
        (sleep 30)
        (vehicle_unload (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_b03)
        (cs_run_command_script "allies_grunts_03/grunt01" arm02_swat_aim_02)
        (cs_run_command_script "allies_grunts_03/grunt02" arm02_swat_aim_03)
        (cs_pause -1.0)
    )
)

(script dormant void dogfight_search_reminder
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'no sign of the heretic-leader or his banshee. we must keep searching!'")
        (sleep (ai_play_line_on_object none "1210"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void dogfight_ph_pilot_talk
    (begin
        (begin_random
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'emplacement destroyed! heading to the next target!'")
                (sleep (ai_play_line_on_object none "2050"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'all heretic forces have been eliminated! moving on!'")
                (sleep (ai_play_line_on_object none "2060"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'this area is clear! let us continue!'")
                (sleep (ai_play_line_on_object none "2070"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'that is the last of them! but there are more ahead!'")
                (sleep (ai_play_line_on_object none "2080"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'these heretics are dead. onward!'")
                (sleep (ai_play_line_on_object none "2090"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'follow me, arbiter! i have found another emplacement!'")
                (sleep (ai_play_line_on_object none "2100"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'this way, arbiter! i see another heretic position!'")
                (sleep (ai_play_line_on_object none "2110"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
            (begin
                (sleep_until (= dogfight_ph_pilot_go true))
                (set dogfight_ph_pilot_go false)
                (ai_dialogue_enable false)
                (sleep 60)
                (print "phantom pilot: 'do you see, arbiter? more heretics have gathered there!'")
                (sleep (ai_play_line_on_object none "2120"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
    )
)

(script command_script void boost_test
    (begin
        (cs_vehicle_boost true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_enable_moving true)
        (sleep_until 
            (or
                (< (objects_distance_to_object (players) (ai_get_object ai_current_actor)) 50.0)
                (< (objects_distance_to_object (ai_actors "allied_phantom_01") (ai_get_object ai_current_actor)) 50.0)
            )
        )
    )
)

(script dormant void banshee_fight_saving
    (begin
        (sleep_until 
            (begin
                (sleep_until (= try_to_save_now true))
                (sleep_until 
                    (and
                        (unit_in_vehicle (unit (player0)))
                        (or
                            (unit_in_vehicle (unit (player1)))
                            (= (game_can_use_flashlights) false)
                        )
                        (game_all_quiet)
                    )
                )
                (game_reverted)
                (set try_to_save_now false)
                (= dogfight_over true)
            )
        )
    )
)

(script dormant void phantom_path_w_orders
    (begin
        (wake banshee_fight_saving)
        (cs_run_command_script "allied_phantom_01/driver" abort)
        (ai_set_orders "allied_phantom_01" "dog_ph_obj_01")
        (wake dogfight_ph_pilot_talk)
        (sleep 30)
        (sleep_until (= emplace_01_done true) 30 4000)
        (sleep_until (= (ai_trigger_test "done_fighting" "dog_obj_emplaced_01") true) 30 2000)
        (print "cleared")
        (sleep 150)
        (ai_set_orders "allied_phantom_01" "dog_ph_obj_02")
        (game_saving)
        (set dogfighters_spawned 0)
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_03" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_03")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_02")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_03" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_01" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_01")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_02")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_01" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_02" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_02")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_02")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_02" boost_test)
                        )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_dog_obj_02" (ai_actors "allied_phantom_01")) true)
                        (< (ai_living_count "dogfighters_01") 2)
                    )
                )
                (or
                    (= (volume_test_objects "vol_dog_obj_02" (ai_actors "allied_phantom_01")) true)
                    (> dogfighters_spawned 3)
                )
            ) 
        30 4000)
        (ai_set_orders "allied_phantom_01" "dog_ph_obj_03")
        (game_saving)
        (set dogfighters_spawned 0)
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_05" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_05")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_03")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_05" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_03" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_03")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_03")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_03" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_04" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_04")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_03")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_04" boost_test)
                        )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_dog_obj_03" (players)) true)
                        (= (volume_test_objects "vol_dog_obj_03" (ai_actors "allied_phantom_01")) true)
                        (< (ai_living_count "dogfighters_01") 2)
                    )
                )
                (or
                    (= (volume_test_objects "vol_dog_obj_03" (players)) true)
                    (= (volume_test_objects "vol_dog_obj_03" (ai_actors "allied_phantom_01")) true)
                    (> dogfighters_spawned 3)
                )
            ) 
        30 4000)
        (sleep 30)
        (sleep_until (= emplace_03_done true) 30 1800)
        (sleep_until (= (ai_trigger_test "done_fighting" "dog_obj_emplaced_03") true) 30 1800)
        (print "cleared")
        (sleep 30)
        (if (= (volume_test_objects "vol_dog_obj_04" (players)) false) 
            (set dogfight_ph_pilot_go true))
        (ai_set_orders "allied_phantom_01" "dog_ph_obj_04")
        (game_saving)
        (set dogfighters_spawned 0)
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_05" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_05")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_04")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_05" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_06" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_06")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_04")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_06" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_04" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_04")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_04")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_04" boost_test)
                        )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_dog_obj_04" (players)) true)
                        (= (volume_test_objects "vol_dog_obj_04" (ai_actors "allied_phantom_01")) true)
                        (< (ai_living_count "dogfighters_01") 2)
                    )
                )
                (or
                    (= (volume_test_objects "vol_dog_obj_04" (players)) true)
                    (= (volume_test_objects "vol_dog_obj_04" (ai_actors "allied_phantom_01")) true)
                    (> dogfighters_spawned 3)
                )
            ) 
        30 4000)
        (sleep 30)
        (sleep_until (= emplace_04_done true) 30 1800)
        (sleep_until (= (ai_trigger_test "done_fighting" "dog_obj_emplaced_04") true) 30 1800)
        (sleep 60)
        (wake dogfight_search_reminder)
        (print "cleared")
        (sleep 30)
        (ai_set_orders "allied_phantom_01" "dog_ph_obj_06")
        (game_saving)
        (set dogfighters_spawned 0)
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_01" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_01")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_06")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_01" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_06" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_06")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_06")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_06" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_07" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_07")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_06")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_07" boost_test)
                        )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_dog_obj_06" (players)) true)
                        (= (volume_test_objects "vol_dog_obj_06" (ai_actors "allied_phantom_01")) true)
                        (< (ai_living_count "dogfighters_01") 2)
                    )
                )
                (or
                    (= (volume_test_objects "vol_dog_obj_06" (players)) true)
                    (= (volume_test_objects "vol_dog_obj_06" (ai_actors "allied_phantom_01")) true)
                    (> dogfighters_spawned 3)
                )
            ) 
        30 4000)
        (sleep 30)
        (sleep_until (= emplace_06_done true) 30 1800)
        (sleep_until (= (ai_trigger_test "done_fighting" "dog_obj_emplaced_06") true) 30 1800)
        (print "cleared")
        (sleep 30)
        (if (= (volume_test_objects "vol_dog_obj_07" (players)) false) 
            (set dogfight_ph_pilot_go true))
        (ai_set_orders "allied_phantom_01" "dog_ph_obj_07")
        (game_saving)
        (set dogfighters_spawned 0)
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_08" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_08")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_07")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_08" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_06" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_06")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_07")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_06" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_01" 90.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_01")
                            (set dogfighters_spawned (+ dogfighters_spawned 1.0))
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_07")
                            (sleep 60)
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_01" boost_test)
                        )
                )
                (sleep_until 
                    (or
                        (= (volume_test_objects "vol_dog_obj_07" (players)) true)
                        (= (volume_test_objects "vol_dog_obj_07" (ai_actors "allied_phantom_01")) true)
                        (< (ai_living_count "dogfighters_01") 2)
                    )
                )
                (or
                    (= (volume_test_objects "vol_dog_obj_07" (players)) true)
                    (= (volume_test_objects "vol_dog_obj_07" (ai_actors "allied_phantom_01")) true)
                    (> dogfighters_spawned 3)
                )
            ) 
        30 4000)
    )
)

(script command_script void goto_dog_turret_01l
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_01/left"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_01/left") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_01r
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_01/right"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_01/right") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_02l
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_02/left"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_02/left") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_02r
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_02/right"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_02/right") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_03l
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_03/left"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_03/left") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_03r
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_03/right"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_03/right") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_04l
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_04/left"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_04/left") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_04r
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_04/right"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_04/right") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_06l
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_06/left"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_06/left") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void goto_dog_turret_06r
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_06/right"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_06/right") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void lz_turret_01
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_07/01"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_07/01") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void lz_turret_02
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_07/02"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_07/02") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void lz_turret_03
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_07/03"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_07/03") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script command_script void lz_turret_04
    (begin
        (cs_force_combat_status 4)
        (cs_enable_pathfinding_failsafe true)
        (cs_go_to_vehicle (ai_vehicle_get_from_starting_location "dog_turrets_07/04"))
        (ai_vehicle_reserve (ai_vehicle_get_from_starting_location "dog_turrets_07/04") true)
        (cs_enable_targeting true)
        (cs_shoot true)
        (cs_set_behavior "guard")
        (sleep_forever)
    )
)

(script dormant void near_dog_obj_01
    (begin
        (ai_place "dog_turret_men_01")
        (cs_run_command_script "dog_turret_men_01/left" goto_dog_turret_01l)
        (cs_run_command_script "dog_turret_men_01/right" goto_dog_turret_01r)
        (sleep_until 
            (begin
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_08" 60.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_08")
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_01")
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_08" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_02" 60.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_02")
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_01")
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_02" boost_test)
                        )
                )
                (if 
                    (and
                        (= (objects_can_see_flag (players) "spawn_pt_01" 60.0) false)
                        (< (ai_living_count "dogfighters_01") 2)
                    ) 
                        (begin
                            (ai_place "dogfight_enemies/pt_01")
                            (ai_set_orders "dogfight_enemies" "dogfight01_cell_01")
                            (ai_magically_see "dogfight_enemies" "allied_phantom_01")
                            (cs_run_command_script "dogfight_enemies/pt_01" boost_test)
                        )
                )
                (sleep_until 
                    (or
                        (> (objects_distance_to_flag (players) "banshee_intro") 75.0)
                        (< (ai_living_count "dogfighters_01") 2)
                        (> (ai_spawn_count "dogfighters_01") 2)
                    )
                )
                (or
                    (> (objects_distance_to_flag (players) "banshee_intro") 75.0)
                    (> (ai_spawn_count "dogfighters_01") 2)
                )
            )
        )
        (sleep_until 
            (and
                (< (ai_living_count "dog_obj_emplaced_01") 1)
                (< (ai_living_count "dogfighters_01") 1)
            )
        )
        (set emplace_01_done true)
        (game_saving)
    )
)

(script dormant void near_dog_obj_02
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_dog_obj_02" (players)) true)
                (= (volume_test_objects "vol_dog_obj_02" (ai_actors "allied_phantom_01")) true)
            )
        )
        (ai_place "dog_turret_men_02")
        (cs_run_command_script "dog_turret_men_02/left" goto_dog_turret_02l)
        (cs_run_command_script "dog_turret_men_02/right" goto_dog_turret_02r)
        (sleep_until (< (ai_living_count "dog_turret_men_02") 2))
        (ai_place "dog_flak_02" 2)
        (sleep_until (< (ai_living_count "dog_flak_02") 2))
        (ai_place "dog_flak_02" 2)
        (sleep_until (< (ai_living_count "dog_obj_emplaced_02") 1))
        (set emplace_02_done true)
        (game_saving)
    )
)

(script dormant void near_dog_obj_03
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_dog_obj_03" (players)) true)
                (= (volume_test_objects "vol_dog_obj_03" (ai_actors "allied_phantom_01")) true)
            )
        )
        (ai_place "dog_turret_men_03")
        (sleep_until 
            (begin
                (ai_place "dog_turret_men_03" 1)
                (sleep 60)
                (sleep_until (< (ai_living_count "dog_turret_men_03") 2))
                (> (ai_spawn_count "dog_turret_men_03") 3)
            )
        )
        (sleep_until (< (ai_living_count "dog_obj_emplaced_03") 1))
        (set emplace_03_done true)
        (game_saving)
    )
)

(script dormant void near_dog_obj_04
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_dog_obj_04" (players)) true)
                (= (volume_test_objects "vol_dog_obj_04" (ai_actors "allied_phantom_01")) true)
            )
        )
        (ai_place "dog_flak_04")
        (ai_place "dog_turret_men_04")
        (cs_run_command_script "dog_turret_men_04/left" goto_dog_turret_04l)
        (cs_run_command_script "dog_turret_men_04/right" goto_dog_turret_04r)
        (sleep_until (< (ai_living_count "dog_obj_emplaced_04") 1))
        (set emplace_04_done true)
        (game_saving)
    )
)

(script dormant void near_dog_obj_05
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_dog_obj_05" (players)) true)
                (= (volume_test_objects "vol_dog_obj_05" (ai_actors "allied_phantom_01")) true)
            )
        )
        (sleep_until 
            (begin
                (ai_place "dog_sen_05" 1)
                (sleep 15)
                (sleep_until (< (ai_living_count "dog_sen_05") 4))
                (= (ai_spawn_count "dog_sen_05") 8)
            )
        )
        (sleep_until (< (ai_living_count "dog_obj_emplaced_05") 1))
        (set emplace_05_done true)
        (game_saving)
    )
)

(script dormant void near_dog_obj_06
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_dog_obj_06" (players)) true)
                (= (volume_test_objects "vol_dog_obj_06" (ai_actors "allied_phantom_01")) true)
            )
        )
        (ai_place "dog_turret_men_06")
        (sleep_until 
            (begin
                (ai_place "dog_turret_men_06" 1)
                (sleep 60)
                (sleep_until (< (ai_living_count "dog_turret_men_06") 2))
                (> (ai_spawn_count "dog_turret_men_06") 3)
            )
        )
        (sleep_until (< (ai_living_count "dog_obj_emplaced_06") 1))
        (set emplace_06_done true)
        (game_saving)
    )
)

(script dormant void final_dogfight_reminder
    (begin
        (sleep_until (> (ai_living_count "dog_turrets_07") 0))
        (sleep_until (< (ai_living_count "dog_turrets_07") 1) 30 3600)
        (if (> (ai_living_count "dog_turrets_07") 0) 
            (begin
                (ai_dialogue_enable false)
                (sleep 60)
                (print "spec-ops commander: 'take out those turrets, and get after the heretic-leader!'")
                (sleep (ai_play_line_on_object none "1220"))
                (sleep 30)
                (ai_dialogue_enable true)
            )
        )
    )
)

(script dormant void ally_final_run
    (begin
        (ai_set_orders "allied_phantom_01" "dog_ph_obj_park")
        (ai_place "allies_elites_03" 2)
        (ai_place "allies_grunts_03" 2)
        (sleep 60)
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_a (ai_actors "allies_elites_03"))
        (vehicle_load_magic (ai_vehicle_get_from_starting_location "allied_phantom_01/driver") phantom_p_b (ai_actors "allies_grunts_03"))
        (sleep_until (= (volume_test_objects "vol_arm02_air" (ai_actors "allied_phantom_01")) true))
        (cs_run_command_script "allied_phantom_01/driver" arm02_final_approach)
    )
)

(script dormant void near_dog_obj_07
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_dog_obj_07" (players)) true)
                (= (volume_test_objects "vol_dog_obj_07" (ai_actors "allied_phantom_01")) true)
            )
        )
        (object_create "hl_banshee")
        (ai_place "dog_turret_men_07")
        (sleep 2)
        (ai_enter_squad_vehicles "dog_07_turrets")
        (sleep 2)
        (ai_place "dog_flak_07")
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'we've tracked the heretic leader to this part of the station.'")
        (sleep (ai_play_line_on_object none "0530"))
        (sleep 30)
        (print "spec-ops commander: 'clear that landing-zone, and get inside!'")
        (sleep (ai_play_line_on_object none "0540"))
        (sleep 30)
        (ai_dialogue_enable true)
        (wake final_dogfight_reminder)
        (game_saving)
        (sleep_until (< (ai_living_count "dog_obj_emplaced_07") 3) 30 4000)
        (wake ally_final_run)
        (if 
            (and
                (= (volume_test_objects "vol_arm_02_lz" (players)) false)
                (> (player_count) 0)
            ) 
                (begin
                    (ai_place "arm02_final_heretics" 2)
                    (ai_place "arm02_final_grunts" 2)
                )
        )
        (sleep_until (< (+ (ai_living_count "arm02_final_heretics") (ai_living_count "arm02_final_heretics")) 1.0) 30 3600)
        (sleep_until (= (ai_trigger_test "done_fighting" "dog_obj_emplaced_07") true) 30 1800)
        (set dogfight_over true)
    )
)

(script dormant void dogfight_flak_warn
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "spec-ops commander: 'look sharp, arbiter! they're putting-up heavy flak!'")
        (sleep (ai_play_line_on_object none "1200"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void dogfight_objectives
    (begin
        (ai_dialogue_enable false)
        (sleep 60)
        (print "phantom pilot: 'the heretics have weapon-emplacements all over the facility, arbiter.'")
        (print "'we'll take them out, one-by-one, until we find the heretic-leader!'")
        (sleep (ai_play_line_on_object none "2040"))
        (sleep 30)
        (ai_dialogue_enable true)
    )
)

(script dormant void dogfight_nav_swap
    (begin
        (sleep_until 
            (or
                (< (ai_living_count "allied_phantom_01") 1)
                (= (volume_test_objects "vol_dog_obj_07" (players)) true)
                (= (volume_test_objects "vol_dog_obj_07" (ai_actors "allied_phantom_01")) true)
            ) 
        30 24000)
        (deactivate_nav_point_object default player "arm_02_entry_ext" 0.0)
    )
)

(script dormant void always_get_banshee_01
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (and
                        (and
                            (> (objects_distance_to_flag (players) "01a") 50.0)
                            (> (objects_distance_to_flag (players) "01b") 50.0)
                            (= (objects_can_see_flag (players) "01a" 45.0) false)
                            (= (objects_can_see_flag (players) "01b" 45.0) false)
                        )
                        (or
                            (= (volume_test_object "vol_stuck_01" "mid_banshee_01") false)
                            (= (volume_test_object "vol_stuck_01" "mid_banshee_02") false)
                        )
                    )
                )
                (sleep_until 
                    (begin
                        (object_destroy (list_get (volume_return_objects_by_type "vol_stuck_01" 2) 0))
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_01" 2)) 0)
                    )
                )
                (object_create_clone "mid_banshee_01")
                (object_create_clone "mid_banshee_02")
                false
            )
        )
    )
)

(script dormant void always_get_banshee_02
    (begin
        (sleep_until 
            (begin
                (sleep_until 
                    (and
                        (and
                            (> (objects_distance_to_flag (players) "10a") 50.0)
                            (> (objects_distance_to_flag (players) "10b") 50.0)
                            (= (objects_can_see_flag (players) "10a" 45.0) false)
                            (= (objects_can_see_flag (players) "10b" 45.0) false)
                        )
                        (or
                            (= (volume_test_object "vol_stuck_10" (ai_vehicle_get_from_starting_location "ledge_banshees_01/left")) false)
                            (= (volume_test_object "vol_stuck_10" (ai_vehicle_get_from_starting_location "ledge_banshees_01/right")) false)
                        )
                    )
                )
                (sleep_until 
                    (begin
                        (object_destroy (list_get (volume_return_objects_by_type "vol_stuck_10" 2) 0))
                        (= (list_count_not_dead (volume_return_objects_by_type "vol_stuck_10" 2)) 0)
                    )
                )
                (ai_place "ledge_banshees_01/left")
                (ai_place "ledge_banshees_01/right")
                false
            )
        )
    )
)

(script dormant void dogfight_firsttime_start
    (begin
        (data_mine_insert "04a_9_dogfight")
        (sound_class_enable_ducker "ambient_machinery" 0.1 3)
        (sound_class_enable_ducker "ambient_nature" 0.15 3)
        (sound_class_enable_ducker "vehicle_engine" 0.8 3)
        (sound_class_enable_ducker "weapon_fire" 0.8 3)
        (sound_class_enable_ducker "weapon_fire_lod" 0.8 3)
        (sound_class_enable_ducker "projectile_detonation" 0.8 3)
        (game_save_no_timeout)
        (if (difficulty_legendary) 
            (wake grunt_birthday_party))
        (kill_volume_disable "kill_banshee_ledge")
        (wake banshee_stuck_spawner_01)
        (if (= (game_can_use_flashlights) true) 
            (wake banshee_stuck_spawner_02))
        (deactivate_nav_point_object default player (list_get (ai_actors "allied_phantom_01") 0) 3.0)
        (ai_place "dogfight_initial_enemies" 2)
        (ai_place "dog_turrets_04")
        (ai_place "dog_turrets_07")
        (wake near_dog_obj_01)
        (wake near_dog_obj_03)
        (wake near_dog_obj_04)
        (wake near_dog_obj_06)
        (wake near_dog_obj_07)
        (wake phantom_path_w_orders)
        (wake dogfight_nav_swap)
        (object_create_containing "mid_banshee_0")
        (wake always_get_banshee_01)
        (wake always_get_banshee_02)
        (sleep 5)
        (wake music_04a_04_start)
        (wake music_04a_04_stop)
        (sleep_until 
            (and
                (< (ai_living_count "dogfight_initial_enemies") 1)
                (= emplace_01_done true)
            )
        )
        (sleep 60)
        (sleep 30)
        (wake dogfight_objectives)
    )
)

(script dormant void arm_02_entry_win
    (begin
        (sleep_until 
            (or
                (= (volume_test_objects "vol_04a_game_won" (players)) true)
                (and
                    (= dogfight_over true)
                    (= (volume_test_object "vol_real_win" (player0)) true)
                    (= (unit_in_vehicle (player0)) false)
                )
                (and
                    (= dogfight_over true)
                    (= (volume_test_object "vol_real_win" (player1)) true)
                    (= (unit_in_vehicle (player1)) false)
                )
            )
        )
        (playtest_mission)
        (sleep 30)
        (sound_class_enable_ducker "" 0.0 15)
        (cinematic_fade_to_white)
        (sleep 30)
        (game_revert)
    )
)

(script static void sleep_intro
    (begin
        (sleep_forever swat_deploy)
        (sleep_forever commander_entry_reminder)
        (sleep_forever wind)
    )
)

(script static void sleep_rec_center
    (begin
        (sleep_forever production_arm_bsp_swap)
        (sleep_forever recycling_center_start)
        (sleep_forever recycling_can_spawner)
        (sleep_forever recycling_killer_new)
        (sleep_forever heretic_uplink_01)
        (sleep_forever rec_center_reminder)
        (ai_disposable "rec_center_heretics" true)
    )
)

(script static void sleep_hangar
    (begin
        (sleep_forever hangar_firsttime_start)
        (sleep_forever hangar_can_spawner)
        (sleep_forever hangar_killer_new)
        (sleep_forever hangar_allies_reinforce)
        (sleep_forever hangar_helpers)
        (sleep_forever hangar_sentinels_flitting)
        (sleep_forever hangar_door_monitor)
        (sleep_forever hangar_door_reminder)
        (sleep_forever hangar_alerted_call)
        (sleep_forever hangar_exit_warn)
        (sleep_forever hangar_reminder)
        (sleep_forever hangar_exterior_toggle)
    )
)

(script static void sleep_first_halls
    (begin
        (sleep_forever to_underhangar_firsttime)
        (sleep_forever first_hall_reinforce)
    )
)

(script static void sleep_underhangar
    (begin
        (sleep_forever underhangar_firsttime_start)
        (sleep_forever underhangar_can_spawner)
        (sleep_forever underhangar_killer_new)
        (sleep_forever new_allies_02)
        (sleep_forever underhangar_reinforce)
        (sleep_forever underhangar_reminder)
    )
)

(script static void sleep_second_halls
    (begin
        (sleep_forever to_bottling)
        (sleep_forever second_hall_reinforce_01)
        (sleep_forever second_hall_reinforce_02)
        (sleep_forever second_hall_reinforce_03)
    )
)

(script static void sleep_bottling
    (begin
        (sleep_forever bottling_firsttime_start)
        (sleep_forever bottling_can_spawner)
        (sleep_forever bottling_killer_new)
        (sleep_forever bottling_overlook_reinforce)
        (sleep_forever active_camo_drop)
        (sleep_forever new_allies_03)
        (ai_disposable "hangar_heretics" true)
        (ai_disposable "hangar_sentinels" true)
        (ai_disposable "first_hall_heretics" true)
        (ai_disposable "underhangar_heretics" true)
        (ai_disposable "second_hall_heretics" true)
        (ai_disposable "bottling_enemies" true)
    )
)

(script startup void mission
    (begin
        (cinematic_snap_to_white)
        (if (= (volume_test_objects "vol_starting_locations" (players)) true) 
            (begin
                (ui_error_ok_cancel)
                (if (cinematic_skip_start) 
                    (begin
                        (x04)
                    )
                )
                (cinematic_skip_stop)
                (if (cinematic_skip_start) 
                    (begin
                        (c04_intro)
                    )
                )
                (cinematic_skip_stop)
            )
        )
        (sleep 2)
        (structure_bsp_index 0)
        (sleep 2)
        (ai_allegiance player covenant)
        (ai_allegiance sentinel heretic)
        (ai_allegiance heretic sentinel)
        (objectives_finish_up_to)
        (game_reverted)
        (prep_return_from_intro)
        (camera_control false)
        (sleep 1)
        (ui_error_ok)
        (sleep 1)
        (wake 04a_title0)
        (wake objective_hl_set)
        (wake swat_deploy)
        (wake recycling_center_start)
        (wake kill_volumes)
        (sleep_until 
            (or
                (= (volume_test_objects "vol_on_hangar_lift_top" (players)) true)
                (= (volume_test_objects "vol_on_hangar_lift_top" (ai_actors "all_allies")) true)
            )
        )
        (wake hangar_firsttime_start)
        (wake to_underhangar_firsttime)
        (sleep_intro)
        (device_one_sided_set "rec_center_entry_ext" true)
        (device_one_sided_set "rec_center_entry_int" true)
        (sleep_until (= (volume_test_objects "vol_underhangar_from_top" (players)) true))
        (wake underhangar_firsttime_start)
        (wake to_bottling)
        (sleep_rec_center)
        (sleep_hangar)
        (set recycling_power_on false)
        (set hangar_power_on false)
        (device_one_sided_set "hangar_exit" true)
        (sleep_until (= (version) 0))
        (wake bottling_firsttime_start)
        (wake bottling_plant_end)
        (sleep_first_halls)
        (sleep_underhangar)
        (set underhangar_power_on false)
        (device_one_sided_set "underhangar_entry" true)
        (device_one_sided_set "underhangar_exit" true)
        (sleep_until 
            (or
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player1))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player1))) true)
            )
        )
        (wake dogfight_firsttime_start)
        (wake arm_02_entry_win)
        (sleep_second_halls)
        (sleep_bottling)
        (set bottling_power_on false)
        (device_operates_automatically_set "rec_center_entry_ext" false)
        (device_one_sided_set "bottling_entry" true)
        (device_one_sided_set "bottling_midway" true)
        (device_one_sided_set "viewroom_entry" true)
        (wake objective_hl_clear)
        (wake objective_dogfight_set)
        (sleep_until 
            (or
                (and
                    (unit_in_vehicle (player0))
                    (unit_in_vehicle (player1))
                )
                (and
                    (unit_in_vehicle (player0))
                    (= (game_can_use_flashlights) false)
                )
            )
        )
    )
)

(script dormant void x04_01_predict
    (begin
        (sleep 30)
        (sleep 1)
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
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 38 false)
        (sleep 2)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 53 false)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 11)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 9)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 13)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 101)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 65 false)
        (sleep 86)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (sleep 51)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\jail_door\jail_door" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (sleep 19)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 11)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 9)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 13)
        (sleep 4)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 53 false)
        (sleep 141)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (sleep 6)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 350)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 53 false)
    )
)

(script dormant void x04_02a_predict
    (begin
        (sleep 30)
        (sleep 203)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "scenarios\objects\covenant\residential\holo_switches\holo_switch_a\holo_switch_a" 0)
        (sleep 91)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 53 false)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 11)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 9)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 13)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (sleep 164)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 34 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 31 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 61 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 1 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 47 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 21 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 26 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 15 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 16 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 17 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 23 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 43 false)
        (sleep 41)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 63 false)
    )
)

(script dormant void x04_02b_predict
    (begin
        (sleep 30)
        (sleep 4)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 53 false)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 11)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 9)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 13)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_jail_ledge\high_jail_ledge" 0)
        (predict_lightmap_bucket "objects\characters\jackal\jackal" 8)
        (sleep 139)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 31 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 61 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 32 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 49 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 47 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 63 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 21 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 3 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 50 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 26 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 2 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 20 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 45 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 33 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 67 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 15 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 23 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 0 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 1 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 2 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 24 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 7 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 9 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 12 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 13 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 11 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 14 true)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
    )
)

(script dormant void x04_03b_predict
    (begin
        (sleep 30)
        (sleep 3)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 25 true)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 0)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 4)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 5)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 6)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 7)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 8)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 9)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\honor_guard\honor_guard" 10)
        (sleep 89)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 21 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 61 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 20 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 25 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 10 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 8 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 11 true)
        (predict_lightmap_bucket "objects\weapons\melee\gravity_hammer\gravity_hammer" 0)
        (predict_lightmap_bucket "objects\characters\brute\brute" 26)
        (predict_lightmap_bucket "objects\characters\brute\brute" 28)
        (predict_lightmap_bucket "objects\characters\brute\brute" 29)
        (predict_lightmap_bucket "objects\characters\brute\brute" 40)
        (predict_lightmap_bucket "objects\characters\brute\brute" 36)
        (predict_lightmap_bucket "objects\characters\brute\brute" 37)
        (predict_lightmap_bucket "objects\characters\brute\brute" 33)
        (predict_lightmap_bucket "objects\characters\brute\brute" 35)
        (predict_lightmap_bucket "objects\characters\brute\brute" 34)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 11)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 9)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 13)
        (sleep 141)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 26 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 47 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 67 false)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
    )
)

(script dormant void x04_04_predict
    (begin
        (sleep 30)
        (sleep 4)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 43 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 3 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 4 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 18 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 20 true)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" 1)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\sarcophagus\sarcophagus" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 1)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 2)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 3)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 4)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 3)
        (predict_lightmap_bucket "objects\vehicles\gravity_throne\gravity_throne" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 11)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 12)
        (predict_lightmap_bucket "objects\characters\prophet\prophet" 10)
        (sleep 38)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 48 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 7 true)
        (sleep 10)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 19 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 21 true)
        (sleep 14)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 12)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 22 true)
    )
)

(script dormant void x04_05_predict
    (begin
        (sleep 30)
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 151)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 21 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 50)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 252)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 31)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (sleep 51)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 14)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 138)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 19)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 42 false)
    )
)

(script dormant void x04_06_predict
    (begin
        (sleep 30)
        (sleep 7)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 90)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 42 false)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 48)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 19 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 139)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 99)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 42 false)
        (sleep 91)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 46 false)
        (sleep 244)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 43 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 4 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 22 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 5 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 6 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 18 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 20 true)
    )
)

(script dormant void x04_07_predict
    (begin
        (sleep 30)
        (sleep 5)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 9)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 10)
        (predict_lightmap_bucket "objects\characters\heretic\heretic" 12)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 157)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 42 false)
        (sleep 560)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 22 true)
    )
)

(script dormant void x04_08_predict
    (begin
        (sleep 30)
        (sleep 5)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (sleep 204)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 42 false)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 232)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 48 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 19 true)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 7 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 230)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
    )
)

(script dormant void x04_09_predict
    (begin
        (sleep 30)
        (sleep 3)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 2)
        (sleep 91)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 64 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 21 true)
    )
)

(script dormant void x04_10_predict
    (begin
        (sleep 30)
        (sleep 5)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 19 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 0)
        (sleep 185)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 42 false)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 46 false)
        (sleep 208)
        (predict_lightmap_bucket "scenarios\objects\solo\highcharity\high_door_grand\high_door_grand" 0)
        (sleep 103)
        (predict_bitmap scenarios\solo\07a_highcharity\high_4_cinematic 19 true)
        (predict_lightmap_bucket "objects\weapons\rifle\smg\smg" 1)
    )
)

(script dormant void 04_intro_01_predict
    (begin
        (sleep 30)
        (sleep 1)
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
        (predict_bitmap scenarios\solo\04a_gasgiant\ag_cinematic_bsp1 0 false)
        (predict_lightmap_bucket "scenarios\skies\generic\space\space" 0)
        (sleep 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 15)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_stardust\high_charity_stardust" 0)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_exterior\high_charity_exterior" 0)
        (predict_lightmap_bucket "scenarios\objects\special\null_up\null_up" 0)
        (sleep 77)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\threshold_space\threshold_space" 0)
        (sleep 36)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\high_charity_stardust\high_charity_stardust" 0)
        (sleep 3)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\halo_destroyed_03\halo_destroyed_03" 0)
        (sleep 11)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
    )
)

(script dormant void 04_intro_02a_predict
    (begin
        (predict_lightmap_bucket "objects\vehicles\phantom\cinematics\cinematics" 0)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "incompetent\default_object" 0)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 3)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 0)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 1)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 2)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 3)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 4)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 5)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 6)
        (predict_lightmap_bucket "scenarios\skies\solo\alphagasgiant\no_structure\no_structure" 7)
        (sleep 7)
        (sleep 146)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 84)
        (predict_lightmap_bucket "objects\weapons\rifle\beam_rifle\beam_rifle" 2)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (sleep 69)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
        (sleep 91)
        (predict_lightmap_bucket "incompetent\default_object" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 3)
        (sleep 135)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
    )
)

(script dormant void 04_intro_02b_predict
    (begin
        (sleep 30)
        (sleep 7)
        (predict_lightmap_bucket "incompetent\default_object" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (sleep 1)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 2)
    )
)

(script dormant void 04_intro_02c_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 15)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\gas_giant_structure_top\gas_giant_structure_top" 0)
    )
)

(script dormant void 04_intro_02d_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 26)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\vehicles\phantom\cinematics\cinematics" 0)
        (sleep 301)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 15)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (sleep 208)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\gas_giant_structure\gas_giant_structure" 0)
    )
)

(script dormant void 04_intro_03_predict
    (begin
        (sleep 178)
        (predict_lightmap_bucket "objects\cinematics\matte_paintings\gas_giant_exterior\gas_giant_exterior" 0)
        (sleep 2)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\ext_structures\ext_structures_vent_1\ext_structures_vent_1" 0)
        (predict_lightmap_bucket "scenarios\objects\cinematics\cinematic_anchor\cinematic_anchor" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_tron_lg\door_tron_lg" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\holo_panels\holo_generic\holo_generic" 0)
        (predict_lightmap_bucket "scenarios\objects\forerunner\industrial\doors\door_cargo_hangar_scenery\door_cargo_hangar_scenery" 0)
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
    )
)

(script dormant void 04_intro_05_predict
    (begin
        (sleep 2)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 36 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 40 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 37 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 74 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 11 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 33 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 56 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 78 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 34 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 53 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 14 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 5 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 0 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 3 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 8 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 9 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 59 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 6 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 60 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 7 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 4 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 2 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (sleep 4)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 38 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 27 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 20 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 41 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 12 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 90 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 73 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 30 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 10 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 1 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 5 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 45 false)
        (sleep 4)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 77 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 22 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 0 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 80 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 29 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 16 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 32 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 3 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 31 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 72 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 93 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 9 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 68 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 57 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 101 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 98 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 79 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 2 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 43 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 100 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 13 true)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 1 true)
        (sleep 5)
        (sleep 4)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 1)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 19)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 0)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 1)
        (sleep 6)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (sleep 10)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (sleep 10)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 15 true)
        (sleep 62)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 4 false)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 0)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 1)
        (sleep 7)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 57 true)
    )
)

(script dormant void 04_intro_06b_predict
    (begin
        (sleep 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 7)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 8)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 9)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 34)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 54)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 30 false)
        (sleep 14)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\ext_structures\ext_structures_vent_1\ext_structures_vent_1" 0)
        (sleep 39)
        (predict_lightmap_bucket "scenarios\objects\solo\alphagasgiant\ext_structures\ext_structures_vent_1\ext_structures_vent_1" 0)
        (sleep 2)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 30 false)
        (sleep 2)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 7)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 8)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 9)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
        (sleep 6)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 55 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 10 false)
        (sleep 3)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 31 false)
        (sleep 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 2 false)
        (sleep 10)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 44 true)
        (sleep 7)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 29 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 79 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 72 false)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 59 true)
        (sleep 1)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 100 false)
        (sleep 5)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 20)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 21)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 22)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 23)
        (predict_lightmap_bucket "objects\characters\grunt\grunt" 24)
        (predict_lightmap_bucket "incompetent\default_object" 0)
        (sleep 3)
        (predict_bitmap scenarios\solo\04a_gasgiant\alphagasgiant 68 false)
        (sleep 3)
        (predict_lightmap_bucket "objects\characters\elite\elite" 25)
        (predict_lightmap_bucket "objects\characters\elite\elite" 30)
        (predict_lightmap_bucket "objects\characters\elite\elite" 27)
        (predict_lightmap_bucket "objects\characters\elite\elite" 32)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 0)
        (sleep 88)
        (predict_lightmap_bucket "objects\weapons\rifle\plasma_rifle\plasma_rifle" 1)
        (sleep 34)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 12)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 13)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 14)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 16)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 7)
        (sleep 11)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 8)
        (predict_lightmap_bucket "objects\characters\dervish\dervish" 10)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 6)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 1)
        (sleep 45)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 3)
        (sleep 22)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 2)
        (sleep 6)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 4)
        (predict_lightmap_bucket "objects\weapons\melee\energy_blade\energy_blade" 5)
        (sleep 34)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 6)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 7)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 8)
        (predict_lightmap_bucket "objects\vehicles\phantom\phantom" 9)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 3)
        (predict_lightmap_bucket "objects\vehicles\phantom\turrets\chin_gun\chin_gun" 4)
    )
)

(script static void teleport_hangar
    (begin
        (ai_erase_all)
        (ai_place "allies_elites_01")
        (ai_place "allies_grunts_01" 1)
        (ai_place "hacker")
        (structure_bsp_index 3)
        (object_teleport (player0) "hangar_top_player0")
        (object_teleport (player1) "hangar_top_player1")
        (object_teleport (list_get (ai_actors "allies_elites_01") 0) "hangar_top_ally01")
        (object_teleport (list_get (ai_actors "hacker") 0) "hangar_top_ally02")
        (object_teleport (list_get (ai_actors "allies_grunts_01") 0) "hangar_top_ally03")
        (device_set_position_immediate "elev_hangar" 0.0)
        (sleep_forever mission)
        (sleep_intro)
        (sleep_rec_center)
        (ai_set_orders "arm01_allies" "get_on_hangar_elev")
        (sleep_until (= (volume_test_objects "vol_on_hangar_lift_top" (players)) true))
        (game_save_no_timeout)
        (wake hangar_firsttime_start)
        (wake to_underhangar_firsttime)
        (device_one_sided_set "rec_center_entry_ext" true)
        (device_one_sided_set "rec_center_entry_int" true)
        (sleep_until (= (volume_test_objects "vol_underhangar_from_top" (players)) true))
        (wake underhangar_firsttime_start)
        (wake to_bottling)
        (sleep_rec_center)
        (sleep_hangar)
        (set recycling_power_on false)
        (set hangar_power_on false)
        (device_one_sided_set "hangar_exit" true)
        (sleep_until (= (version) 0))
        (wake bottling_firsttime_start)
        (wake bottling_plant_end)
        (sleep_first_halls)
        (sleep_underhangar)
        (set underhangar_power_on false)
        (device_one_sided_set "underhangar_entry" true)
        (device_one_sided_set "underhangar_exit" true)
        (sleep_until 
            (or
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player1))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player1))) true)
            )
        )
        (wake dogfight_firsttime_start)
        (wake arm_02_entry_win)
        (sleep_second_halls)
        (sleep_bottling)
        (set bottling_power_on false)
        (device_operates_automatically_set "rec_center_entry_ext" false)
        (device_one_sided_set "bottling_entry" true)
        (device_one_sided_set "bottling_midway" true)
        (device_one_sided_set "viewroom_entry" true)
        (sleep_until 
            (or
                (and
                    (unit_in_vehicle (player0))
                    (unit_in_vehicle (player1))
                )
                (and
                    (unit_in_vehicle (player0))
                    (= (game_can_use_flashlights) false)
                )
            )
        )
    )
)

(script static void teleport_underhangar
    (begin
        (ai_erase_all)
        (ai_place "allies_elites_01")
        (ai_place "hacker")
        (structure_bsp_index 3)
        (object_teleport (player0) "underhangar_player0")
        (object_teleport (player1) "underhangar_player1")
        (object_teleport (list_get (ai_actors "allies_elites_01") 0) "underhangar_ally01")
        (object_teleport (list_get (ai_actors "hacker") 0) "underhangar_ally02")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_rec_center)
        (sleep_first_halls)
        (sleep_hangar)
        (device_one_sided_set "rec_center_entry_ext" true)
        (device_one_sided_set "rec_center_entry_int" true)
        (game_save_no_timeout)
        (wake underhangar_firsttime_start)
        (wake to_bottling)
        (set recycling_power_on false)
        (set hangar_power_on false)
        (device_one_sided_set "hangar_exit" true)
        (sleep_until (= (version) 0))
        (wake bottling_firsttime_start)
        (wake bottling_plant_end)
        (sleep_first_halls)
        (sleep_underhangar)
        (set underhangar_power_on false)
        (device_one_sided_set "underhangar_entry" true)
        (device_one_sided_set "underhangar_exit" true)
        (sleep_until 
            (or
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player1))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player1))) true)
            )
        )
        (wake dogfight_firsttime_start)
        (wake arm_02_entry_win)
        (sleep_second_halls)
        (sleep_bottling)
        (set bottling_power_on false)
        (device_operates_automatically_set "rec_center_entry_ext" false)
        (device_one_sided_set "bottling_entry" true)
        (device_one_sided_set "bottling_midway" true)
        (device_one_sided_set "viewroom_entry" true)
        (sleep_until 
            (or
                (and
                    (unit_in_vehicle (player0))
                    (unit_in_vehicle (player1))
                )
                (and
                    (unit_in_vehicle (player0))
                    (= (game_can_use_flashlights) false)
                )
            )
        )
    )
)

(script static void teleport_bottling
    (begin
        (ai_erase_all)
        (ai_place "allies_elites_01")
        (structure_bsp_index 0)
        (object_teleport (player0) "bottling_player0")
        (object_teleport (player1) "bottling_player1")
        (object_teleport (list_get (ai_actors "allies_elites_01") 0) "bottling_ally01")
        (sleep_forever mission)
        (sleep_intro)
        (sleep_rec_center)
        (sleep_hangar)
        (sleep_first_halls)
        (sleep_underhangar)
        (sleep_second_halls)
        (device_one_sided_set "rec_center_entry_ext" true)
        (device_one_sided_set "rec_center_entry_int" true)
        (device_one_sided_set "hangar_exit" true)
        (game_save_no_timeout)
        (wake bottling_firsttime_start)
        (wake bottling_plant_end)
        (sleep_first_halls)
        (sleep_underhangar)
        (set underhangar_power_on false)
        (device_one_sided_set "underhangar_entry" true)
        (device_one_sided_set "underhangar_exit" true)
        (sleep_until 
            (or
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player1))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player1))) true)
            )
        )
        (wake dogfight_firsttime_start)
        (wake arm_02_entry_win)
        (sleep_second_halls)
        (sleep_bottling)
        (set bottling_power_on false)
        (device_operates_automatically_set "rec_center_entry_ext" false)
        (device_one_sided_set "bottling_entry" true)
        (device_one_sided_set "bottling_midway" true)
        (device_one_sided_set "viewroom_entry" true)
        (sleep_until 
            (or
                (and
                    (unit_in_vehicle (player0))
                    (unit_in_vehicle (player1))
                )
                (and
                    (unit_in_vehicle (player0))
                    (= (game_can_use_flashlights) false)
                )
            )
        )
    )
)

(script static void teleport_banshee
    (begin
        (ai_erase_all)
        (structure_bsp_index 0)
        (ai_place "ledge_banshees_01/left")
        (ai_place "ledge_banshees_01/right")
        (ai_place "dog_turrets_01")
        (object_teleport (player0) "banshee_ledge_player0")
        (object_teleport (player1) "banshee_ledge_player1")
        (wake bring_in_da_phantom)
        (sleep_forever mission)
        (sleep_intro)
        (sleep_rec_center)
        (sleep_hangar)
        (sleep_first_halls)
        (sleep_underhangar)
        (sleep_second_halls)
        (sleep_bottling)
        (device_one_sided_set "rec_center_entry_ext" true)
        (device_one_sided_set "rec_center_entry_int" true)
        (device_one_sided_set "hangar_exit" true)
        (device_one_sided_set "underhangar_entry" true)
        (device_one_sided_set "underhangar_exit" true)
        (wake bring_in_da_phantom)
        (game_save_no_timeout)
        (sleep_until 
            (or
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player0))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/left") "banshee_d" (unit (player1))) true)
                (= (vehicle_test_seat (ai_vehicle_get_from_starting_location "ledge_banshees_01/right") "banshee_d" (unit (player1))) true)
            )
        )
        (wake dogfight_firsttime_start)
        (wake arm_02_entry_win)
        (sleep_second_halls)
        (sleep_bottling)
        (set bottling_power_on false)
        (device_operates_automatically_set "rec_center_entry_ext" false)
        (device_one_sided_set "bottling_entry" true)
        (device_one_sided_set "bottling_midway" true)
        (device_one_sided_set "viewroom_entry" true)
        (sleep_until 
            (or
                (and
                    (unit_in_vehicle (player0))
                    (unit_in_vehicle (player1))
                )
                (and
                    (unit_in_vehicle (player0))
                    (= (game_can_use_flashlights) false)
                )
            )
        )
    )
)

