include $(sort $(wildcard $(BR2_EXTERNAL_FUNKEY_PATH)/package/*/*.mk))

# CMake 4 rejects projects that declare cmake_minimum_required() below 3.5.
# Several FunKey packages (retrofe, libopk, gmenu2x, libini, fluidlite,
# commander) come from old projects, so lift the floor for every package.
export CMAKE_POLICY_VERSION_MINIMUM = 3.5
