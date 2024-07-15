package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import org.openqa.selenium.*;


public class GenericService {

    public static By stringToBy(String locatorString) {
        if (locatorString.startsWith("id:")) {
            return By.id(locatorString.substring("id:".length()));
        } else if (locatorString.startsWith("xpath:")) {
            return By.xpath(locatorString.substring("xpath:".length()));
        } else if (locatorString.startsWith("accessibilityId:")) {
        return MobileBy.AccessibilityId(locatorString.substring("ACCESSIBILITYID:".length()));
        }
        return null;
    }

    public static void commonClick(String locator) {
        By byLocator = stringToBy(locator);
        if (byLocator != null) {
            MobileActionManager.waitVisibility(locator);
            MobileActionManager.click(locator);
        } else {
            System.err.println("Tipo de localizador no soportado: " + locator);
        }
    }


}

