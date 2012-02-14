#####

#Run all the non skin specific tests

#####

for i in $( find . -type d -maxdepth 1 ! -name \*-\* ! -empty ! -name .\* ); do

  test_name=`echo $i | cut -c 3-`

#   echo $i

    echo "Starting next test: $test_name"



    # Figure out the IP address

    # Select a port number

    # Write a file called TestMoreOutputServerInfo.lua

    # module("TestMoreOutputServerInfo", package.seeall)

    # Host = "192.168.192.125"

    # Port = 12345

    # TimeOut = 300 * 1000  -- in milliseconds

    IPADDRESS=`ifconfig en0 | grep -E 'inet.[0-9]' | awk '{ print $2}'`

    PORT=`$lua_exec FindFreeSocketPort.lua ${IPADDRESS}`

    echo "module('TestMoreOutputServerInfo', package.seeall)" > TestMoreOutputServerInfo.lua

    echo "Host = '${IPADDRESS}'" >> TestMoreOutputServerInfo.lua

    echo "Port = '${PORT}'" >> TestMoreOutputServerInfo.lua

    echo "TimeOut = '${TIMEOUT_FOR_APP}'" >> TestMoreOutputServerInfo.lua



    # Copying Test files

    rm -f "$i/Builder.lua"

    rm -f "$i/More.lua"

    rm -f "$i/SocketOutput.lua"

    rm -f "$i/NoOutput.lua"

    rm -f "$i/Tester.lua"

    rm -f "$i/CoronaTest.lua"

    rm -f "$i/TestMoreOutputServerInfo.lua"



    cp -f Builder.lua "$i/Builder.lua"

    cp -f More.lua "$i/More.lua"

    cp -f SocketOutput.lua "$i/SocketOutput.lua"

    cp -f NoOutput.lua "$i/NoOutput.lua"

    cp -f Tester.lua "$i/Tester.lua"

    cp -f CoronaTest.lua "$i/CoronaTest.lua"

    cp -f TestMoreOutputServerInfo.lua "$i/TestMoreOutputServerInfo.lua"



    echo "Building"

    # Paramaters are: path_with_ratatouille.xcodeproj

    # path_where_assets_dir_needs_to_be directory_of_test xcode_target_to_build_or_run build_configuration os_or_simulator should_build should_run



    # /Volumes/CoronaBigDMG/CoronaBigDMG/platform/android/build_app_for_automated_testing.sh /Applications/CoronaSDK.2011.484/SampleCode/GettingStarted/HelloWorld

    eval "${BUILD_APP}" $i "${NDK_ROOT}" "${SDK_ROOT}" automation release incremental

    BUILD_STATUS=$?

    if [ $BUILD_STATUS -eq 0 ]; then

        echo "Build succeeded"

    else

        echo "Build failed"

        # Need to write error report

        echo "Bail out! Build failed." >> "../test-output/${test_name}.tap"

        continue

    fi



    do_loop=1

    loop_count=1

    while [ $do_loop -ne 0 ]; do

        # we are re-running a test, delete the past run

        rm -f "../test-output/${test_name}.tap"



        InstallAndExecuteTest

        if [ $LISTENER_STATUS -eq 0 ]; then

            echo "Run succeeded"

            do_loop=0

        elif [ $LISTENER_STATUS -eq 124 ]; then

            echo "gtimeout killed the test"

            # Need to write error report

            echo -e "\nBail out! gtimeout killed the test" >> "../test-output/${test_name}.tap"

        elif [ $LISTENER_STATUS -eq 1 ]; then

            echo "TapSocketListener aborted due to receiving App-auto-timeout notification"

            echo -e "\nBail out! TapSocketListener aborted due to receiving App-auto-timeout notification" >> "../test-output/${test_name}.tap"

        elif [ $LISTENER_STATUS -eq 2 ]; then

            echo "TapSocketListener aborted due to unexpected disconnect"

            echo -e "\nBail out! TapSocketListener aborted due to unexpected disconnect" >> "../test-output/${test_name}.tap"

        else

            # Need to write error report

            echo "TapSocketListener aborted due and returned status $?"

            echo -e "\nBail out! TapSocketListener aborted due and returned status $?" >> "../test-output/${test_name}.tap"

        fi



        loop_count=$loop_count+1

        # After a few failed attempts, give up and move on

        if [ $loop_count -gt 2 ]; then

            do_loop=0

        fi

    done



    # print a newline to segment next test

    echo -e "\n"

#   exit 0



done



# experiment to see if killing the adb server will help avoid the dead-server hang problem

eval "${adb_cmd} kill-server"



#####

#exit without passing an error code

#####

exit 0