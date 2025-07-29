package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.HomeConstantsIOS;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.testng.Assert;
import java.time.Duration;
import java.util.Arrays;
import java.util.Collections;


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
    public static void moveFingerSeekBarToEnd() {
        //Validamos que se encuentre y este visible
        if (MobileActionManager.waitVisibility(HomeConstants.SLIDE_DELETE).isDisplayed()) {
            AndroidDriver<?> driver = (AndroidDriver<?>) GenericService.getDriver();
            //Aqui recuperamos parte de la cadena, pero obtener el Id del elemento
            WebElement seekBar = MobileActionManager.getElement(HomeConstants.SLIDE_DELETE);
            //driver.findElement(By.id(HomeConstants.SLIDE_DELETE.split(":")[1]));

            int startX = seekBar.getLocation().getX();
            int width = seekBar.getSize().getWidth();
            int endX = startX + width - 10;

            // Simula el movimiento del dedo al desplazar el SeekBar
            PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
            Sequence drag = new Sequence(finger, 1);

            int thumbX = 117;     // Posición inicial del thumb (ajustado manualmente según el dispositivo)
            int thumbY = 1850;    // Altura del SeekBar en pantalla

            // Presionar el thumb y mover hacia la derecha
            drag.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), thumbX, thumbY));
            drag.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
            drag.addAction(finger.createPointerMove(Duration.ofMillis(600), PointerInput.Origin.viewport(), endX, thumbY));
            drag.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
            driver.perform(Arrays.asList(drag));
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
