set(HEADERS)
set(SOURCE main.cpp)
if (WIN32)
    list(APPEND HEADERS winrc.h)
    list(APPEND SOURCE win.rc)
endif()

set(APP_NAME djv)
set(INSTALL_DIR bin)
if(DJV_PACKAGE AND APPLE)
    set(APP_NAME DJV)
    # \bug Why do we need to use ".." to avoid installing into the
    # "Resources" directory in the bundle?
    set(INSTALL_DIR ../MacOS)
endif()

add_executable(${APP_NAME} WIN32 ${HEADER} ${SOURCE})
target_link_libraries(${APP_NAME} djvApp)
set_target_properties(${APP_NAME} PROPERTIES FOLDER bin)

install(TARGETS ${APP_NAME} DESTINATION ${INSTALL_DIR})

if(WIN32)
    add_executable(${APP_NAME}. ${HEADER} ${SOURCE})
    target_link_libraries(${APP_NAME}. djvApp)
    set_target_properties(
        ${APP_NAME}. PROPERTIES
        SUFFIX com
        FOLDER bin)
    install(TARGETS ${APP_NAME}. RUNTIME DESTINATION bin)
endif()
