package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.LockUnlockConstants;
import org.testng.Assert;


public class HomeService {

    public static void isHomeLoaded() {
        MobileActionManager.waitVisibility(LockUnlockConstants.HOME_BUTTON);
        MobileActionManager.waitVisibility(LockUnlockConstants.CAMERA_BUTTON);
        MobileActionManager.waitVisibility(LockUnlockConstants.MIC_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.HOME_BUTTON), HomeConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }
}
