package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.AudioConstants;
import com.crowdar.tella.constants.SettingsConstants;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.testng.Assert;


public class AudioService {

    public static void clickRecOption(){
        MobileActionManager.waitVisibility(AudioConstants.REC_OPTION);
        MobileActionManager.click(AudioConstants.REC_OPTION);
    }

    public static void clickMicrophoneIcon(){
        MobileActionManager.waitVisibility(AudioConstants.MICROPHONE_ICON);
        MobileActionManager.click(AudioConstants.MICROPHONE_ICON);
        MobileActionManager.waitVisibility(AudioConstants.PERMISSIONS_POPUP);
        MobileActionManager.click(AudioConstants.PERMISSIONS_POPUP);
    }

    public static void clickPencilIcon(){
        MobileActionManager.waitVisibility(AudioConstants.PENCIL_ICON);
        MobileActionManager.click(AudioConstants.PENCIL_ICON);
    }

    public static void deleteLastName(){
        MobileActionManager.setInput(AudioConstants.TITLE_AUDIO_RECORDING_INPUT,String.valueOf(Keys.DELETE));
    }

    public static void addNewRecordingName(String recordingName){
        MobileActionManager.waitVisibility(AudioConstants.TITLE_AUDIO_RECORDING_INPUT);
        MobileActionManager.setInput(AudioConstants.TITLE_AUDIO_RECORDING_INPUT,recordingName);
    }


    public static void clickChoosenLanguage(String language) {
        WebElement LanguagueEle = DriverManager.getDriverInstance().getWrappedDriver().findElement(MobileBy.AndroidUIAutomator(
                "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                        ".scrollIntoView(new UiSelector()" +
                        ".textMatches(\"" + language + "\").instance(0))"));
        LanguagueEle.click();
    }


    public static void verifyLanguageTitle(String title){
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_TITLE);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_TITLE));
        String LanguageTitle = MobileActionManager.getText(SettingsConstants.LANGUAGE_TITLE);
        Assert.assertEquals(LanguageTitle, title);

        MobileActionManager.click(SettingsConstants.BUTTON_BACK_LANG);
        MobileActionManager.waitVisibility(SettingsConstants.TITLE_LANGUAGE_SETTING);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.TITLE_LANGUAGE_SETTING));
    }
}
