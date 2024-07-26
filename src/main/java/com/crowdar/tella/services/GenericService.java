package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.Arrays;
import java.util.List;


public class GenericService {

    public static By stringToBy(String locatorString) {
        if (locatorString.startsWith("id:")) {
            return By.id(locatorString.substring("id:".length()));
        } else if (locatorString.startsWith("xpath:")) {
            return By.xpath(locatorString.substring("xpath:".length()));
        } else if (locatorString.startsWith("accessibilityId:")) {
        return MobileBy.AccessibilityId(locatorString.substring("ACCESSIBILITY_ID:".length()));
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
    public static boolean verifyFilePresence(String fileType) {
        AndroidDriver<MobileElement> driver = (AndroidDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        WebDriverWait wait = new WebDriverWait(driver, 10);

        List<String> xpaths;
        switch (fileType.toLowerCase()) {
            case "image":
                xpaths = Arrays.asList(
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.jpg')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.jpeg')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.png')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.gif')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.bmp')]"
                );
                break;
            case "video":
                xpaths = Arrays.asList(
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.mp4')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.avi')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.mkv')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.mov')]"
                );
                break;
            case "audio":
                xpaths = Arrays.asList(
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.mp3')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.wav')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.aac')]",
                        "//android.widget.TextView[contains(@resource-id, 'org.hzontal.tella:id/fileNameTextView') and contains(@text, '.flac')]"
                );
                break;
            default:
                throw new IllegalArgumentException("Unsupported file type: " + fileType);
        }

        for (String xpath : xpaths) {
            try {
                if (wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.xpath(xpath))) != null) {
                    return true;
                }
            } catch (WebDriverException e) {
                // Ignorar y continuar con el siguiente XPath
            }
        }

        System.out.println("File type not found: " + fileType);
        return false;
    }


}

