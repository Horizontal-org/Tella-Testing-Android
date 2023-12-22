package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
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

    public static void clickNextPasswordButton(){
        MobileActionManager.click(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
    }

    public static void errorMessageDisplayed(String message){
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_DONT_MATCH_MSG);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.LOCK_DONT_MATCH_MSG));
        String errorMessagePage = MobileActionManager.getText(LockUnlockConstants.LOCK_DONT_MATCH_MSG);
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

    public static void messageDisplayed(String message){
        MobileActionManager.waitVisibility(LockUnlockConstants.LOCK_SET_UP);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.LOCK_SET_UP));
        String messagePage = MobileActionManager.getText(LockUnlockConstants.LOCK_SET_UP);
        Assert.assertEquals(message, messagePage);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.NEXT_BUTTON));
    }

}
