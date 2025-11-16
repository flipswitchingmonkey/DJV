if(DJV_MACOS_TEAM_ID)
    execute_process(
        COMMAND codesign --sign "$ENV{DJV_MACOS_TEAM_ID}"
        --timestamp --force
        --options runtime
        --identifier com.grizzlypeak3d.djv
        --deep
        ${CPACK_TEMPORARY_INSTALL_DIRECTORY}/DJV.app)
endif()

