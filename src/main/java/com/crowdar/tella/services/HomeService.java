package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.HomeConstantsIOS;
import org.testng.Assert;


public class HomeService {

    public static void isHomeLoaded() {
        if (MobileActionManager.isAndroid()) {
        MobileActionManager.waitVisibility(HomeConstants.HOME_BUTTON);
        MobileActionManager.waitVisibility(HomeConstants.CAMERA_BUTTON);
        MobileActionManager.waitVisibility(HomeConstants.MIC_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(HomeConstants.HOME_BUTTON), HomeConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    } else {
            MobileActionManager.waitVisibility(HomeConstantsIOS.HOME_BUTTON);
            MobileActionManager.waitVisibility(HomeConstantsIOS.CAMERA_BUTTON);
            MobileActionManager.waitVisibility(HomeConstantsIOS.MIC_BUTTON);
            Assert.assertTrue(MobileActionManager.isVisible(HomeConstantsIOS.HOME_BUTTON), HomeConstantsIOS.VIEW_NOT_DISPLAYED_MESSAGE);
        }
        }
}
