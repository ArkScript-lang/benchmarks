cmake_minimum_required(VERSION 3.8)

project(ArkBench C CXX)

add_subdirectory(ArkScript)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

#-------------------------------------------------------
#                      Benchmark lib
#-------------------------------------------------------

option(BENCHMARK_ENABLE_GTEST_TESTS "Enable building the unit tests which depend on gtest" OFF)
set(BENCHMARK_ENABLE_GTEST_TESTS OFF CACHE BOOL "Enable gbench testing" FORCE)
set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "Enable gbench testing" FORCE)

add_definitions(-DNDEBUG)
set(CMAKE_BUILD_TYPE Release)

add_subdirectory(gbench)

#-------------------------------------------------------
#                        Targets
#-------------------------------------------------------

function(bench_make target_file)
    set(targetname bench_${target_file})

    add_executable(${targetname} ${target_file}.cpp)
    target_include_directories(${targetname} PRIVATE gbench/include)
    target_link_libraries(${targetname} ArkReactor benchmark Threads::Threads)
    add_dependencies(${targetname} ArkReactor benchmark)
    # add_dependencies(${targetname} gbench)
    set_target_properties(${targetname} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "bench"
        OUTPUT_NAME  ${target_file}
    )
    set_target_properties(
        ${targetname}
            PROPERTIES
                CXX_STANDARD 17
                CXX_STANDARD_REQUIRED ON
                CXX_EXTENSIONS OFF
    )
endfunction()

bench_make(vm)
bench_make(ackermann)
bench_make(list_alloc)