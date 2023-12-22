package com.crowdar.tella.services;

import com.crowdar.core.PropertyManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.SettingsConstants;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.testng.Assert;

import java.util.ArrayList;
import java.util.List;


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


    public static void clickChoosenLanguage(String language) throws InterruptedException {
        EventFiringWebDriver driver = DriverManager.getDriverInstance();
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_IDS);
        Thread.sleep(2000);
        WebElement ChildElement = driver.findElement(By.id(SettingsConstants.LANGUAGE_IDS));
        MobileActionManager.click(String.valueOf(ChildElement));
        List<WebElement> languageElements = driver.findElements(By.id(String.valueOf(ChildElement)));
        for (WebElement element : languageElements) {
            if (element.getText().equals(language)) {
                Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_IDS));
                String id = String.format("//*[@id='lang',@text='%s']", language);
                MobileActionManager.click(id);
            }
        }
        System.out.println("languageElements = " + languageElements);
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
