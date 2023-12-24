#ifndef INST_NODE_H
#define INST_NODE_H

#include <godot_cpp/classes/rendering_server.hpp>
#include <godot_cpp/classes/node3d.hpp>
#include <godot_cpp/classes/world3d.hpp>
#include <godot_cpp/classes/engine.hpp>

using namespace godot;


class InstNode : public Node3D
{
    GDCLASS(InstNode, Node3D);

    RID scen {get_world_3d()->get_scenario()};

protected:
    static void _bind_methods();



    void generate_inst();
    
};

#endif