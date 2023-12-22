package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.AudioConstants;
import io.appium.java_client.MobileElement;
import io.appium.java_client.PerformsTouchActions;
import io.appium.java_client.TouchAction;
import io.appium.java_client.touch.TapOptions;
import io.appium.java_client.touch.offset.ElementOption;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import java.time.Duration;
import static io.appium.java_client.touch.WaitOptions.waitOptions;

public class AudioService {

    public static void clickRecIcon(){
        MobileActionManager.click(AudioConstants.REC_ICON);
    }

    public static void clickEditFileIcon(){
        MobileActionManager.click(AudioConstants.REC_FILE_NAME);
    }

    public static void deleteAudioFileName(){
        MobileActionManager.waitVisibility(AudioConstants.RENAME_RECORDING_INPUT);
        String fileName = MobileActionManager.getText(AudioConstants.RENAME_RECORDING_INPUT);
        EventFiringWebDriver driver = DriverManager.getDriverInstance();
        MobileActionManager.click(AudioConstants.RENAME_RECORDING_INPUT);
        for (int i = 0; i < fileName.length(); i++) {
            driver.getKeyboard().sendKeys(Keys.ARROW_LEFT);
        }
        for (int i = 0; i < fileName.length(); i++) {
            driver.getKeyboard().sendKeys(Keys.DELETE);
        }

    }



    public static void enterNewName(String name){
        MobileActionManager.setInput(AudioConstants.RENAME_RECORDING_INPUT, name);

    }
}
