# =======================================================================
# entt submodule update/init
# =======================================================================

# confirm we found the godot engine source files.
# if the sources list is empty, the submodule probably
# hasn't been initialized or updated yet.
if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/extern/entt")
    message(NOTICE "entt bingings source not found")
    message(NOTICE "initializing/updating the entt submodule...")

    add_subdirectory(extern/entt)

    # update the c++ bingings submodule to populate it with
    # the necessary source for the entt library
    execute_process(
        COMMAND git submodule update --init --recursive extern/entt
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMAND_ERROR_IS_FATAL ANY
    )
endif()