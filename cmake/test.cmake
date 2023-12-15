add_library(Timer
    Timer/Timer.cpp
    Timer/Timer.h)
target_include_directories(Timer INTERFACE Timer)
add_library(WFL::Timer ALIAS Timer)

add_library(Components INTERFACE)
target_include_directories(
    Components
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/components>
)
target_link_libraries(Components INTERFACE
    EnTT::EnTT
    glm::glm
    libmorton::libmorton
    enet)
add_library(WFL::Components ALIAS Components)

add_library(Printer INTERFACE)
target_include_directories(Printer INTERFACE Printer)
target_link_libraries(Printer INTERFACE glm::glm)
add_library(WFL::Printer ALIAS Printer)

add_library(CheckCapsuleOnPlatform
    systems/CheckCapsuleOnPlatform.cpp
    systems/CheckCapsuleOnPlatform.hpp)

target_link_libraries(CheckCapsuleOnPlatform PUBLIC Components glm::glm)
add_library(WFL::CheckCapsuleOnPlatform ALIAS CheckCapsuleOnPlatform)

add_library(UpdateAabbSystem INTERFACE)
target_include_directories(UpdateAabbSystem INTERFACE
    "systems/UpdateAabbSystem/")
target_link_libraries(UpdateAabbSystem INTERFACE glm::glm)
add_library(WFL::UpdateAabbSystem ALIAS UpdateAabbSystem)

add_library(Utility INTERFACE)
target_include_directories(Utility INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        )
target_link_libraries(Utility INTERFACE Components glm::glm)

add_library(Common common.cpp)
target_link_libraries(Common
    glm::glm
    EnTT::EnTT
    yojimbo
    Utility)
add_library(WFL::Common ALIAS Common)

add_library(Generator "./generator/generator.h" "./generator/generator.cpp")
target_compile_definitions(Generator PUBLIC ENTT_ID_TYPE=std::uint64_t)
target_link_libraries(Generator PUBLIC Utility)
add_library(WFL::Generator ALIAS Generator)

add_library(BaseSystem INTERFACE)
target_include_directories(BaseSystem INTERFACE "./systems")
target_link_libraries(BaseSystem INTERFACE EnTT::EnTT)
add_library(WFL::BaseSystem ALIAS BaseSystem)


add_subdirectory(DebugPairSystem)
add_subdirectory(PhysicsSystem)
add_subdirectory(MovementSystem)
