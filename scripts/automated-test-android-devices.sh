# bash shell script excerpt:

function InstallAndExecuteTest()

{

    # Make sure there isn't a stale apk on the device

    eval "${adb_cmd} ${device_flags} uninstall com.ansca.test.Corona"



    echo "Installing"

    eval "${adb_cmd} ${device_flags} install -r '${i}/${test_name}.apk'"

    INSTALL_STATUS=$?

    if [ $INSTALL_STATUS -ne 0 ]; then

        # Need to write error report

        echo "Bail out! Install failed." >> "../test-output/${test_name}.tap"

        continue

    fi



    echo "Launching App"

    # Launch the app. The process returns immediately.

    # adb -d shell am start -a android.intent.action.MAIN -n com.ansca.test.HelloWorld/com.ansca.test.HelloWorld.MyCoronaActivity

    # I can't seem to get an exit status code other than 0 from adb so no point in checking.

    # Adding a sleep to try to avoid race condition that might be sometimes affecting us.

    sleep 2 && eval "${adb_cmd} ${device_flags} shell am start -a android.intent.action.MAIN -n com.ansca.test.Corona/com.ansca.corona.CoronaActivity" &



    # There may be a race condition here. The server needs to be present before the app tries to connect.

    # But we rely on the server blocking to let us know when the # process is finished.

    # So far, we have not been bitten.

    echo "Launching Server"

    # lua TapSocketListener.lua "*" ${PORT} "../test-output/${test_name}.tap" ${ECHO_TAPSOCKET_LISTENER}

    eval "${TAPSOCKETCMD}"

    LISTENER_STATUS=$?



    # remove the application from the device. (This should also kill it if it is still running.)

    eval "${adb_cmd} ${device_flags} uninstall com.ansca.test.Corona"

}
#http://blog.anscamobile.com/2011/08/part-5-automated-testing-on-android-devices-bringing-everything-together-through-shell-scripts/