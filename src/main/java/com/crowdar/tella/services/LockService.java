package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.LockUnlockConstants;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

public class LockService {

    public static String verifyPasswordAttributeEnabled;
    public static String verifyPinAttributeEnabled;

    public static void clickPasswordButton(){
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_PASSWORD_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.LOCK_PASSWORD_BUTTON);
    }

    public static void setOnePassword(String password){
        MobileActionManager.waitVisibility(LockUnlockConstants.PASSWORD_INPUT);
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT,password);
    }

    public static void clickNextLockButton() {
        for (int i = 0; i < 3; i++) {
            try {
                GenericService.clickFirstPresent(
                        LockUnlockConstants.PIN_RIGHT_BUTTON,
                        LockUnlockConstants.PASSWORD_RIGHT_BUTTON,
                        LockUnlockConstants.PATTERN_RIGHT_BUTTON
                );
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void errorMessageDisplayed(String message){
        By locator = GenericService.getByFromLocator(HomeConstants.APP_MSG);
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        long startTime = System.currentTimeMillis();
        long timeoutMs = 5000;

        while (System.currentTimeMillis() - startTime < timeoutMs) {
            try {
                WebElement element = driver.findElement(locator);
                if (element.isDisplayed()) {
                    String errorMessagePage = element.getText();
                    Assert.assertEquals(message, errorMessagePage);
                    return;
                }
            } catch (StaleElementReferenceException e) {
                // retry immediately
            } catch (Exception ignored) {
            }
            GenericService.sleep(50);
        }
        Assert.fail("Error message not displayed: " + message);
    }

    public static void verifyNextButtonEnabled(String locator){
        MobileActionManager.waitVisibility(locator);
        verifyPasswordAttributeEnabled = MobileActionManager.getAttribute(locator, "clickable");
        Assert.assertEquals(verifyPasswordAttributeEnabled , "true");
    }
    public static void clickPinButton(){
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_PIN_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.LOCK_PIN_BUTTON);
    }
    public static void TapNextPinButton(){
        MobileActionManager.waitVisibility(LockUnlockConstants.PIN_RIGHT_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.PIN_RIGHT_BUTTON);
    }

    public static void verifyNextPinButtonEnabled(String locator){
        MobileActionManager.waitVisibility(locator);
        verifyPinAttributeEnabled = MobileActionManager.getAttribute(locator, "clickable");
        Assert.assertEquals(verifyPinAttributeEnabled , "true");
    }

    public static void messageLockDisplayed(String message){
        By locator = GenericService.getByFromLocator(LockUnlockConstants.LOCK_SET_UP);
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        long startTime = System.currentTimeMillis();
        long timeoutMs = 5000;

        while (System.currentTimeMillis() - startTime < timeoutMs) {
            try {
                WebElement element = driver.findElement(locator);
                if (element.isDisplayed()) {
                    String messagePage = element.getText();
                    Assert.assertTrue(messagePage.contains(message));
                    return;
                }
            } catch (StaleElementReferenceException e) {
                // retry immediately
            } catch (Exception ignored) {
            }
            GenericService.sleep(50);
        }
        Assert.fail("Lock message not displayed: " + message);
    }

    public static void clickUnderstandBtn() {
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_UNDERSTAND_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.LOCK_UNDERSTAND_BUTTON);
    }

    public static void clickContinue() {
        MobileActionManager.waitVisibility(LockUnlockConstants.CONTINUE_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.CONTINUE_BUTTON);
    }

    public static void clickNextSuccessScreen() {
        MobileActionManager.waitVisibility(LockUnlockConstants.PASSWORD_NEXT_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.PASSWORD_NEXT_BUTTON);
    }

    public static void clickGoToTella() {
        MobileActionManager.waitVisibility(LockUnlockConstants.START_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.START_BUTTON);
    }

    public static void clickOkNextPinButton(String button) {
        MobileActionManager.waitVisibility(LockUnlockConstants.PIN_RIGHT_BUTTON);
        if ("OK".equals(button)) {
            MobileActionManager.waitVisibility(LockUnlockConstants.PIN_OK_BUTTON);
            GenericService.clickElementByCoordinates(LockUnlockConstants.PIN_OK_BUTTON);
        } else {
            GenericService.clickElementByCoordinates(LockUnlockConstants.PIN_RIGHT_BUTTON);
        }
    }

    public static void verifyOkNextPinButtonDoesNotAdvance(String button) {
        MobileActionManager.waitVisibility(LockUnlockConstants.PIN_RIGHT_BUTTON);
        if ("OK".equals(button)) {
            MobileActionManager.waitVisibility(LockUnlockConstants.PIN_OK_BUTTON);
            GenericService.clickElementByCoordinates(LockUnlockConstants.PIN_OK_BUTTON);
        } else {
            GenericService.clickElementByCoordinates(LockUnlockConstants.PIN_RIGHT_BUTTON);
        }

        MobileActionManager.waitVisibility(LockUnlockConstants.PIN_SCREEN_TITLE);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.PIN_SCREEN_TITLE));
    }

    public static void clickPatterButton() {
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_PATTERN_BUTTON);
        GenericService.clickElementByCoordinates(LockUnlockConstants.LOCK_PATTERN_BUTTON);
    }

    public static void clickLockMethod(String method) {
        if (method.equals("Password")) {
            clickPasswordButton();
        } else if (method.equals("PIN")) {
            clickPinButton();
        } else if (method.equals("Pattern")){
            clickPatterButton();
        }
    }

    public static void setPassPin(String passPin, String method) {
        if (method.equals("Password")) {
            setOnePassword(passPin);
        } else if (method.equals("PIN")) {
            UnlockService.setPin(passPin);
        }
    }

    public static void messageRegisterDisplayed(String message){
        By locator = GenericService.getByFromLocator(LockUnlockConstants.LOCK_FIRST_SET_UP);
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        long startTime = System.currentTimeMillis();
        long timeoutMs = 5000;

        while (System.currentTimeMillis() - startTime < timeoutMs) {
            try {
                WebElement element = driver.findElement(locator);
                if (element.isDisplayed()) {
                    String messagePage = element.getText();
                    Assert.assertTrue(messagePage.contains(message));
                    return;
                }
            } catch (StaleElementReferenceException e) {
                // retry immediately
            } catch (Exception ignored) {
            }
            GenericService.sleep(50);
        }
        Assert.fail("Register message not displayed: " + message);
    }
}
