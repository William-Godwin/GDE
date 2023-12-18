#ifndef INST_NODE_H
#define INST_NODE_H

#include <godot_cpp/classes/rendering_server.hpp>
#include <godot_cpp/classes/node3d.hpp>

using namespace godot;


class InstNode : public Node3D
{
    GDCLASS(InstNode, Node3D);
    
protected:
    static void _bind_methods();

    
};

#endif