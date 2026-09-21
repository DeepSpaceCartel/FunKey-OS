include $(sort $(wildcard $(BR2_EXTERNAL_FUNKEY_PATH)/package/*/*.mk))

# CMake 4 rejects projects that declare cmake_minimum_required() below 3.5.
# Several FunKey packages (retrofe, libopk, gmenu2x, libini, fluidlite,
# commander) come from old projects, so lift the floor for every package.
export CMAKE_POLICY_VERSION_MINIMUM = 3.5

# util-linux enables its statmount()/listmount() code when the C library knows
# the syscall numbers. Recent musl defines them, but the FunKey kernel headers
# (4.14) lack the STATMOUNT_* constants and the target kernel has no such
# syscalls (they arrived in 6.8), so the build fails in libmount. Disable it.
UTIL_LINUX_CONF_ENV += ul_cv_syscall_statmount=no ul_cv_syscall_listmount=no
