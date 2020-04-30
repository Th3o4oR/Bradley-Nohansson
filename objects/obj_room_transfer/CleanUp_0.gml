/// @desc 

physics_remove_fixture(fixture, id);
physics_fixture_delete(fixture);

part_type_destroy(part);
part_emitter_destroy(part_syst, part_emit);
part_system_destroy(part_syst);