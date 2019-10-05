#ifndef MODULE_H_GENERATED_
#define MODULE_H_GENERATED_
#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

#include "wasm-rt.h"

#ifndef WASM_RT_MODULE_PREFIX
#define WASM_RT_MODULE_PREFIX
#endif

#define WASM_RT_PASTE_(x, y) x ## y
#define WASM_RT_PASTE(x, y) WASM_RT_PASTE_(x, y)
#define WASM_RT_ADD_PREFIX(x) WASM_RT_PASTE(WASM_RT_MODULE_PREFIX, x)

/* TODO(binji): only use stdint.h types in header */
typedef uint8_t u8;
typedef int8_t s8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef int32_t s32;
typedef uint64_t u64;
typedef int64_t s64;
typedef float f32;
typedef double f64;

extern void WASM_RT_ADD_PREFIX(init)(void);

/* import: 'env' 'memory' */
extern wasm_rt_memory_t (*Z_envZ_memory);
/* import: 'env' 'table' */
extern wasm_rt_table_t (*Z_envZ_table);
/* import: 'env' 'memoryBase' */
extern u32 (*Z_envZ_memoryBaseZ_i);
/* import: 'env' 'tableBase' */
extern u32 (*Z_envZ_tableBaseZ_i);
/* import: 'env' 'DYNAMICTOP_PTR' */
extern u32 (*Z_envZ_DYNAMICTOP_PTRZ_i);
/* import: 'env' 'tempDoublePtr' */
extern u32 (*Z_envZ_tempDoublePtrZ_i);
/* import: 'env' 'STACKTOP' */
extern u32 (*Z_envZ_STACKTOPZ_i);
/* import: 'env' 'STACK_MAX' */
extern u32 (*Z_envZ_STACK_MAXZ_i);
/* import: 'global' 'NaN' */
extern f64 (*Z_globalZ_NaNZ_d);
/* import: 'global' 'Infinity' */
extern f64 (*Z_globalZ_InfinityZ_d);
/* import: 'env' 'enlargeMemory' */
extern u32 (*Z_envZ_enlargeMemoryZ_iv)(void);
/* import: 'env' 'getTotalMemory' */
extern u32 (*Z_envZ_getTotalMemoryZ_iv)(void);
/* import: 'env' 'abortOnCannotGrowMemory' */
extern u32 (*Z_envZ_abortOnCannotGrowMemoryZ_iv)(void);
/* import: 'env' 'abortStackOverflow' */
extern void (*Z_envZ_abortStackOverflowZ_vi)(u32);
/* import: 'env' 'nullFunc_ii' */
extern void (*Z_envZ_nullFunc_iiZ_vi)(u32);
/* import: 'env' 'nullFunc_iiii' */
extern void (*Z_envZ_nullFunc_iiiiZ_vi)(u32);
/* import: 'env' '___lock' */
extern void (*Z_envZ____lockZ_vi)(u32);
/* import: 'env' '___setErrNo' */
extern void (*Z_envZ____setErrNoZ_vi)(u32);
/* import: 'env' '___syscall140' */
extern u32 (*Z_envZ____syscall140Z_iii)(u32, u32);
/* import: 'env' '___syscall146' */
extern u32 (*Z_envZ____syscall146Z_iii)(u32, u32);
/* import: 'env' '___syscall54' */
extern u32 (*Z_envZ____syscall54Z_iii)(u32, u32);
/* import: 'env' '___syscall6' */
extern u32 (*Z_envZ____syscall6Z_iii)(u32, u32);
/* import: 'env' '___unlock' */
extern void (*Z_envZ____unlockZ_vi)(u32);
/* import: 'env' '_abort' */
extern void (*Z_envZ__abortZ_vv)(void);
/* import: 'env' '_emscripten_memcpy_big' */
extern u32 (*Z_envZ__emscripten_memcpy_bigZ_iiii)(u32, u32, u32);

/* export: '___errno_location' */
extern u32 (*WASM_RT_ADD_PREFIX(Z____errno_locationZ_iv))(void);
/* export: '_fflush' */
extern u32 (*WASM_RT_ADD_PREFIX(Z__fflushZ_ii))(u32);
/* export: '_free' */
extern void (*WASM_RT_ADD_PREFIX(Z__freeZ_vi))(u32);
/* export: '_llvm_bswap_i32' */
extern u32 (*WASM_RT_ADD_PREFIX(Z__llvm_bswap_i32Z_ii))(u32);
/* export: '_malloc' */
extern u32 (*WASM_RT_ADD_PREFIX(Z__mallocZ_ii))(u32);
/* export: '_memcpy' */
extern u32 (*WASM_RT_ADD_PREFIX(Z__memcpyZ_iiii))(u32, u32, u32);
/* export: '_memset' */
extern u32 (*WASM_RT_ADD_PREFIX(Z__memsetZ_iiii))(u32, u32, u32);
/* export: '_sbrk' */
extern u32 (*WASM_RT_ADD_PREFIX(Z__sbrkZ_ii))(u32);
/* export: '_verify' */
extern u32 (*WASM_RT_ADD_PREFIX(Z__verifyZ_ii))(u32);
/* export: 'dynCall_ii' */
extern u32 (*WASM_RT_ADD_PREFIX(Z_dynCall_iiZ_iii))(u32, u32);
/* export: 'dynCall_iiii' */
extern u32 (*WASM_RT_ADD_PREFIX(Z_dynCall_iiiiZ_iiiii))(u32, u32, u32, u32);
/* export: 'establishStackSpace' */
extern void (*WASM_RT_ADD_PREFIX(Z_establishStackSpaceZ_vii))(u32, u32);
/* export: 'getTempRet0' */
extern u32 (*WASM_RT_ADD_PREFIX(Z_getTempRet0Z_iv))(void);
/* export: 'runPostSets' */
extern void (*WASM_RT_ADD_PREFIX(Z_runPostSetsZ_vv))(void);
/* export: 'setTempRet0' */
extern void (*WASM_RT_ADD_PREFIX(Z_setTempRet0Z_vi))(u32);
/* export: 'setThrew' */
extern void (*WASM_RT_ADD_PREFIX(Z_setThrewZ_vii))(u32, u32);
/* export: 'stackAlloc' */
extern u32 (*WASM_RT_ADD_PREFIX(Z_stackAllocZ_ii))(u32);
/* export: 'stackRestore' */
extern void (*WASM_RT_ADD_PREFIX(Z_stackRestoreZ_vi))(u32);
/* export: 'stackSave' */
extern u32 (*WASM_RT_ADD_PREFIX(Z_stackSaveZ_iv))(void);
#ifdef __cplusplus
}
#endif

#endif  /* MODULE_H_GENERATED_ */
