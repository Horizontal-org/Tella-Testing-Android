package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.LockUnlockConstants;
import org.testng.Assert;

public class LockService {

    public static String verifyPasswordAttributeEnabled;
    public static String verifyPinAttributeEnabled;

    public static void clickPasswordButton(){
        MobileActionManager.click(LockUnlockConstants.LOCK_PASSWORD_BUTTON);
    }

    public static void setOnePassword(String password){
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT,password);
    }

    public static void clickNextLockButton() {
        GenericService.clickFirstPresent(
                LockUnlockConstants.PIN_RIGHT_BUTTON,
                LockUnlockConstants.PASSWORD_RIGHT_BUTTON,
                LockUnlockConstants.PATTERN_RIGHT_BUTTON
        );
    }

    public static void errorMessageDisplayed(String message){
        MobileActionManager.waitVisibility(HomeConstants.APP_MSG);
        Assert.assertTrue(MobileActionManager.isVisible(HomeConstants.APP_MSG));
        String errorMessagePage = MobileActionManager.getText(HomeConstants.APP_MSG);
        Assert.assertEquals(message, errorMessagePage);
    }

    public static void verifyNextButtonEnabled(String locator){
        verifyPasswordAttributeEnabled = MobileActionManager.getAttribute(locator, "clickable");
        Assert.assertEquals(verifyPasswordAttributeEnabled , "true");
    }
    public static void clickPinButton(){
        MobileActionManager.click(LockUnlockConstants.LOCK_PIN_BUTTON);
    }
    public static void TapNextPinButton(){
        MobileActionManager.click(LockUnlockConstants.PIN_RIGHT_BUTTON);
    }

    public static void verifyNextPinButtonEnabled(String locator){
        verifyPinAttributeEnabled = MobileActionManager.getAttribute(locator, "clickable");
        Assert.assertEquals(verifyPinAttributeEnabled , "true");
    }

    public static void messageLockDisplayed(String message){
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_SET_UP);
        String messagePage = MobileActionManager.getText(LockUnlockConstants.LOCK_SET_UP);
        Assert.assertTrue(messagePage.contains(message));
    }

    public static void clickUnderstandBtn() {
        MobileActionManager.click(LockUnlockConstants.LOCK_UNDERSTAND_BUTTON);
    }

    public static void clickContinue() {
        MobileActionManager.click(LockUnlockConstants.CONTINUE_BUTTON);
    }

    public static void clickNextSuccessScreen() {
        MobileActionManager.click(LockUnlockConstants.PASSWORD_NEXT_BUTTON);
    }

    public static void clickGoToTella() {
        MobileActionManager.waitVisibility(LockUnlockConstants.START_BUTTON);
        MobileActionManager.click(LockUnlockConstants.START_BUTTON);
    }

    public static void clickOkNextPinButton(String button) {
        if ("OK".equals(button)) {
            MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
        } else {
            MobileActionManager.click(LockUnlockConstants.PIN_RIGHT_BUTTON);
        }
    }

    public static void verifyOkNextPinButtonDoesNotAdvance(String button) {
        if ("OK".equals(button)) {
            MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
        } else {
            MobileActionManager.click(LockUnlockConstants.PIN_RIGHT_BUTTON);
        }

        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.PIN_SCREEN_TITLE));
    }

    public static void clickPatterButton() {
        MobileActionManager.click(LockUnlockConstants.LOCK_PATTERN_BUTTON);
    }

    public static void clickLockMethod(String method) {
        if (method.equals("Password")) {
            MobileActionManager.click(LockUnlockConstants.LOCK_PASSWORD_BUTTON);
        } else if (method.equals("PIN")) {
            MobileActionManager.click(LockUnlockConstants.LOCK_PIN_BUTTON);
        } else if (method.equals("Pattern")){
            MobileActionManager.click(LockUnlockConstants.LOCK_PATTERN_BUTTON);
        }
    }

    public static void setPassPin(String passPin, String method) {
        if (method.equals("Password")) {
            MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, passPin);
        } else if (method.equals("PIN")) {
            UnlockService.setPin(passPin);
        }
    }

    public static void messageRegisterDisplayed(String message) {
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_FIRST_SET_UP);
        String messagePage = MobileActionManager.getText(LockUnlockConstants.LOCK_FIRST_SET_UP);
        Assert.assertTrue(messagePage.contains(message));
    }
}
