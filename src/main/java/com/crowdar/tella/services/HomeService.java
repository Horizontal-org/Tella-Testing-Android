package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.HomeConstantsIOS;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
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
        if (MobileActionManager.waitVisibility(HomeConstants.SLIDE_DELETE).isDisplayed()) {
            AndroidDriver<?> driver = (AndroidDriver<?>) GenericService.getDriver();
            WebElement seekBar = MobileActionManager.getElement(HomeConstants.SLIDE_DELETE);

            // Asegurarse de que el SeekBar esté visible en pantalla
            ((JavascriptExecutor) driver).executeScript("mobile: scroll", Map.of(
                    "direction", "down",
                    "element", ((RemoteWebElement) seekBar).getId()
            ));

            // Coordenadas dinámicas
            int startX = seekBar.getLocation().getX() + 10; // pequeño offset
            int width = seekBar.getSize().getWidth();
            int endX = startX + (int)(width * 0.85); // 85% para evitar desplazamientos bruscos
            int centerY = seekBar.getLocation().getY() + (seekBar.getSize().getHeight() / 2);

            // Esperar un poco antes del gesto
            try { Thread.sleep(500); } catch (InterruptedException ignored) {}

            // Usar TouchAction (más compatible con BrowserStack)
            new TouchAction<>(driver)
                    .press(PointOption.point(startX, centerY))
                    .waitAction(WaitOptions.waitOptions(Duration.ofMillis(600)))
                    .moveTo(PointOption.point(endX, centerY))
                    .release()
                    .perform();

            System.out.println("✅ SeekBar deslizado correctamente.");
        } else {
            System.out.println("⚠️ SeekBar no visible, no se pudo deslizar.");
        }
    }


    public static void isConnection() {
        isHomeLoaded();
        Assert.assertTrue(MobileActionManager.waitVisibility(HomeConstants.LBL_CONNECTIOS).isDisplayed());
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
}
