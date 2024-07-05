package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.SettingsConstants;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.WebElement;
import org.testng.Assert;



public class SettingsService {

    public static void clickSettingsIcon(){
        MobileActionManager.waitVisibility(SettingsConstants.SETTINGS_ICON);
        MobileActionManager.click(SettingsConstants.SETTINGS_ICON);
    }

    public static void clickGeneralIcon(){
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_BUTTON);
        MobileActionManager.click(SettingsConstants.GENERAL_BUTTON);
    }
    public static void clickLanguageOptions(){
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_BUTTON);
        MobileActionManager.click(SettingsConstants.LANGUAGE_BUTTON);
    }

    public static void verifyListOfLanguages(){
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_LIST);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_LIST));
    }

    public static void clickChoosenLanguage(String language) {
        WebElement pedidoEle = DriverManager.getDriverInstance().getWrappedDriver().findElement(MobileBy.AndroidUIAutomator(
                "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                        ".scrollIntoView(new UiSelector()" +
                        ".textMatches(\"" + language + "\").instance(0))"));
        pedidoEle.click();
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
