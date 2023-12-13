## System requirements:
+ JDK (Java Development Kit): https://docs.oracle.com/en/java/javase/index.html
+ Maven: https://maven.apache.org/download.cgi 
+ Android Studio & SDK tools (Software Development Kit): https://developer.android.com/studio
+ ADB (Android Debug Bridge): 
    - Windows User: https://dl.google.com/android/repository/platform-tools-latest-windows.zip
    - Linux User: ``$ sudo apt-get install adb``
+ Appium Desktop: https://appium.io/downloads.html

## Getting Started   

## Go to [Mobile physical solution](#running-with-a-physical-device)
This type of execution gives you the possibility to run your tests on your own device without the need to use emulators,   
and therefore you will notice certain advantages, such as: higher performance.
## Go to [Mobile emulated solution](#running-with-a-emulated-device)
This type of execution allows you to simulate a real device to run your tests on any type and version of device

- ## Running with a physical device
  Please note that this tutorial is written to guide you in order to run the tests on a physical device connected wirelessly to your computer.
  #### First step:
    - Connect your device from USB to computer
    - From your device
      Enable developer mode and then enable USB debugging.   
      _Make sure that your cell phone is in file transfer mode and that the PC has detected it correctly_   

  #### Second step:
    - Obtain your mobile IP addresss   
      _Settings -> About phone/tablet -> Status -> IP address_   
   
  #### Third step:
    - Execute following commands:
      This command lists the connected devices
      ```
      $ adb devices
        List of devices attached
        ZY322M46B6	device
      ``` 
      The next command, shuts down the server, starts the server to switch it to tcp mode and assign it   a listening port, and finally connects to our device through its ip and previously assigned port
      ```
      $ adb kill-server && adb tcpip 5555 && adb connect ip:5555
        * daemon not running; starting now at tcp:5037
        * daemon started successfully
        restarting in TCP mode port: 5555
        connected to 192.168.0.15:5555
      ```
      Finally, the following command list the devices again, but if we disconnect our device,    
      we can see that it is still connected wirelessly ready to receive instructions
      ```
      $ adb devices
        List of devices attached
        192.168.0.15:5555	device
      ```

      **Troubleshooting:**   
      If you don't see "Developer" option in Settings -> About phone/table, follow these steps:   
        - Go to **Settings** -> **About** -> **Build number** and tap 7 times   

  #### Fourth step:
    - Go to Lippia Mobile Project, and go to pom.xml file.
    - Find deviceName property, and replace value with the name of your device
    ```
    <profile>
      <id>Local</id>
          <activation>
            <activeByDefault>true</activeByDefault>
          </activation>
      <properties>
        <crowdar.driverHub>http://127.0.0.1:4723/wd/hub</crowdar.driverHub>
        <cucumber.runner>testng.xml</cucumber.runner>
        <crowdar.avd></crowdar.avd>
        <crowdar.appLocation>path/sample_apk/lippia.apk</crowdar.appLocation>
        <crowdar.deviceName>yourDeviceName</crowdar.deviceName>
      </properties>
    </profile>
    ```

  #### Fifth step:   
    - Go to:
    ```
    ├── src
    |   └── main
    |       └── resources
    |           └── capabilities
    |               └── androidCapabilities.json 
    ├── ...
    ```
    - Find avd property, and replaces with deviceId.   
    - Follow the next schema:
    ```
    {
      "deviceName": "{{deviceName}}",
      "app": "{{app}}",
      "platformName": "Android",
      "deviceId": "ip:5555",
      "resetKeyboard": "true",
      "unicodeKeyboard": "true"
    }
    ```

  #### Sixth step:
    - Open Appium Desktop and Start the server
    - Finally, execute the following command:   
    ```
    $ mvn clean test
    ```

- ## Running with a emulated device
  #### First step:
    - Open Android Studio
    - Click on Configure
    - Click on AVD Manager   
      _You should see the next screen:_   
      ![AVD Manager screen](docs/img/AVDManagerMainScreen.png) 

  #### Second step:
    - Click on Create Virtual Device...
  
  #### Third step:
    - Find your favourite device and click
    - Click on Next button   
      _You should see the next screen:_   
      ![Virtual device configuration](docs/img/VirtualDeviceConfiguration.png)

  #### Fourth step:
    - If you don't have installed a Release, select according to the android version you prefer   
    _We recommended installing R, Android 11.0_

  #### Fifth step:
    - Click on finish button   
      _You should see the next screen:_   
      ![Main Screen / Device installed](docs/img/AndroidVirtualDeviceManager.png)

  #### Sixth step:
    - Go to pom.xml file
    - Edit the **deviceName** property located in **Local** profile with the name of your prefer mobile installed:
    ```
    <properties>
      <crowdar.driverHub>http://127.0.0.1:4723/wd/hub</crowdar.driverHub>
      <cucumber.runner>testng.xml</cucumber.runner>
      <crowdar.avd>Pixel3</crowdar.avd>
      <crowdar.appLocation>C:/workspace/crowdar/lippia/Lippia-mobile-sample-project/sample_apk/lippia.apk</crowdar.appLocation>
      <crowdar.deviceName>Pixel3</crowdar.deviceName>
    </properties>
    ```

  #### Seventh step:
    - Execute the following command:
    ```
    $ mvn clean test
    ```
  _Please note that it's not necessary to have opened Android Studio_
