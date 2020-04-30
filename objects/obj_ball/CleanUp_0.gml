/// @desc 

physics_remove_fixture(ball_fix_bot, id);
physics_remove_fixture(ball_fix_top, id);
physics_remove_fixture(ball_fix_rect, id);

physics_fixture_delete(ball_fix_bot);
physics_fixture_delete(ball_fix_top);
physics_fixture_delete(ball_fix_rect);