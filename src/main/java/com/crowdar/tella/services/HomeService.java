package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.HomeConstantsIOS;
import com.crowdar.tella.constants.LockUnlockConstants;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.remote.RemoteWebElement;
import org.testng.Assert;
import java.time.Duration;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;


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

    public static void verifySwipeDeleteButtonIsVisibleOnHomeScreen() {
        if (MobileActionManager.isAndroid()) {
            Assert.assertTrue(MobileActionManager.waitVisibility(HomeConstants.SLIDE_DELETE).isDisplayed());
        }
    }

    /**
     * Simula el movimiento del dedo para arrastrar un SeekBar hasta su posición final (100%).
     *
     * @throws org.openqa.selenium.NoSuchElementException si no se encuentra el SeekBar por ID.
     */
    /**
     * Simula el movimiento del dedo para arrastrar un SeekBar hasta su posición final (90%).
     * Compatible con ejecución local y en BrowserStack.
     *
     * @throws org.openqa.selenium.NoSuchElementException si no se encuentra el SeekBar por ID.
     */
    public static void moveFingerSeekBarToEnd() {
        AppiumDriver driver = (AppiumDriver) DriverManager.getDriverInstance().getWrappedDriver();
        WebElement seekBar = driver.findElement(By.id(HomeConstants.SLIDE_DELETE.replace("id:", "")));

        int width = seekBar.getSize().getWidth();
        int startX = seekBar.getLocation().getX() + (int)(width * 0.1);
        int endX = seekBar.getLocation().getX() + width;
        int y = seekBar.getLocation().getY() + (seekBar.getSize().getHeight() / 2);

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence swipe = new Sequence(finger, 1);
        swipe.addAction(finger.createPointerMove(Duration.ofMillis(0), PointerInput.Origin.viewport(), startX, y));
        swipe.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        swipe.addAction(finger.createPointerMove(Duration.ofMillis(1000), PointerInput.Origin.viewport(), endX, y));
        swipe.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        driver.perform(Arrays.asList(swipe));
    }


    public static void isConnection(String serverName) {
        isHomeLoaded();
        Assert.assertTrue(MobileActionManager.waitVisibility(HomeConstants.LBL_CONNECTIOS, serverName).isDisplayed());
    }

    public static void isNotConnection() {
        isHomeLoaded();
        try {
            //Hacemos falla al proposito para indicar que el LBl de conexion ya no esta.
            // Indicando que la conexion desaparecio
            boolean flag = MobileActionManager.getElement(HomeConstants.LBL_CONNECTIOS).isDisplayed();
            Assert.assertFalse(flag);
        } catch (Exception e) {
            System.out.println("The user is no longer connected to the Tella web server.");
        }
    }

    public static void clicHomeButton() {
        MobileActionManager.waitClickable(HomeConstants.HOME_BUTTON).click();
    }

    public static void clicClosesBtnInHome() {
        MobileActionManager.waitClickable(HomeConstants.BTN_CLOSES_APP).click();
    }

    public static void isAConnectionVisible(String serverName) {
        MobileActionManager.waitVisibility(HomeConstants.LBL_CONNECTIOS, serverName);
    }

    public static void clickConnection(String connection) {
        String server = "";

        switch (connection){
            case "ODK":
            case "Forms":
                server = "Forms";
                break;
            case "Uwazi":
                server = "Uwazi";
                break;
            case "Google Drive":
                server = "Google Drive";
                break;
        }
        MobileActionManager.click(HomeConstants.LBL_CONNECTIOS, server);
    }
}
