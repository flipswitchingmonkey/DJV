# \bug How do we point USD at the "PlugIns" directory?
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory
    ${CPACK_TEMPORARY_INSTALL_DIRECTORY}/DJV.app/Contents/plugin)
execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink
    ${CPACK_TEMPORARY_INSTALL_DIRECTORY}/DJV.app/Contents/PlugIns/usd
    ${CPACK_TEMPORARY_INSTALL_DIRECTORY}/DJV.app/Contents/plugin/usd)

execute_process(
    COMMAND codesign --sign "$ENV{DJV_MACOS_TEAM_ID}"
    --timestamp --force
    --options runtime
    --identifier com.grizzlypeak3d.djv
    --deep
    ${CPACK_TEMPORARY_INSTALL_DIRECTORY}/DJV.app)
