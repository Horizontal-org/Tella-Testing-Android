package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.UnlockConstants;
import org.testng.Assert;


public class HomeService {

    public static void isHomeLoaded() {
        MobileActionManager.waitVisibility(UnlockConstants.HOME_BUTTON);
        MobileActionManager.waitVisibility(UnlockConstants.CAMERA_BUTTON);
        MobileActionManager.waitVisibility(UnlockConstants.MIC_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(UnlockConstants.HOME_BUTTON), HomeConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }
}
