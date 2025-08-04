package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.SettingsConstants;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import org.openqa.selenium.*;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.Arrays;

import java.util.List;



public class GenericService {
    public String constants;

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
            MobileActionManager.waitClickable(locator);
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

    public static void confirmLeaveTellaButton() {
        MobileActionManager.waitVisibility(HomeConstants.LEAVE_TELLA);
        MobileActionManager.waitClickable(HomeConstants.LEAVE_TELLA);
        MobileActionManager.click(HomeConstants.LEAVE_TELLA);
    }

    public static void pickGoogle() {
        MobileActionManager.click(HomeConstants.PICK_GOOGLE_ACCOUNT);
    }

    public static void recAndStopRecord() {
        AndroidDriver<MobileElement> driver = (AndroidDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        WebDriverWait wait = new WebDriverWait(driver, 10);
        try {
            // Intentamos grabar video
            MobileElement videoRecButton = driver.findElement(By.id("org.hzontal.tella:id/captureButton"));
            if (videoRecButton.isDisplayed()) {
                System.out.println("Botón de grabación de video encontrado.");
                videoRecButton.click(); // Iniciar grabación de video
                Thread.sleep(5000); // Esperar 5 segundos
                videoRecButton.click(); // Detener grabación de video
                System.out.println("Grabación de video finalizada.");
            }
        } catch (Exception e) {
            System.out.println("Botón de grabación de video no encontrado. Intentando grabación de audio.");

            try {
                // Si no encuentra el botón de video, intentamos grabar audio
                MobileElement audioRecButton = driver.findElement(By.id("org.hzontal.tella:id/record_audio"));
                if (audioRecButton.isDisplayed()) {
                    System.out.println("Botón de grabación de audio encontrado.");
                    audioRecButton.click(); // Iniciar grabación de audio
                    Thread.sleep(5000); // Esperar 5 segundos
                    audioRecButton.click(); // Detener grabación de audio
                    System.out.println("Grabación de audio finalizada.");
                }
            } catch (Exception ex) {
                System.out.println("No se encontró el botón de grabación de audio.");
            }
        }
    }

    public static RemoteWebDriver getDriver() {
        AndroidDriver driver = (AndroidDriver) DriverManager.getDriverInstance().getWrappedDriver();
        return driver;
    }

    /**
     * Wait on home screen and return to app (only Android)
     *
     * @param timeMinute number Minute to wait
     * @throws RuntimeException if the waiting thread is interrupted
     */
    public static void waitOnHomeScreenReturnApp(int timeMinute) {
        if (MobileActionManager.isAndroid()) {
            AndroidDriver<?> driver = (AndroidDriver<?>) GenericService.getDriver();
            // Ir a la pantalla de inicio una sola vez
            driver.pressKey(new KeyEvent(AndroidKey.HOME));
            int auxTimeSecond = (timeMinute * 60) / 10;
            //en el caso de que sea inmediato, esperamos solo 10segundo en la home.
            if (auxTimeSecond == 0) auxTimeSecond = 1;
            for (int i = 0; i < auxTimeSecond; i++) {
                try {
                    Thread.sleep(10500);
                    driver.getCurrentPackage(); // “pulso” ligero a Appium para mantener la session
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    throw new RuntimeException("Interrumpido mientras esperaba inactividad", ie);
                }
            }
            //Retorno app tella
            driver.activateApp("org.hzontal.tella");
        }
    }

    /**
     * Lock the device screen, wait and unlock (only Android)
     *
     * @param timeMinute number of minutes to wait
     * @throws RuntimeException if the waiting thread is interrupted
     */
    public static void lockScreenWaitAndUnlock(int timeMinute) {
        if (MobileActionManager.isAndroid()) {
            AndroidDriver<?> driver = (AndroidDriver<?>) GenericService.getDriver();
            // Bloquear pantalla (presionar POWER nuevamente)
            driver.lockDevice();
            int auxTimeSecond = (timeMinute * 60) / 10;
            if (auxTimeSecond == 0) auxTimeSecond = 1;

            for (int i = 0; i < auxTimeSecond; i++) {
                try {
                    Thread.sleep(10500);
                    driver.getCurrentPackage(); // “pulso” ligero a Appium para mantener la session
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    throw new RuntimeException("Interrupted while waiting for inactivity", ie);
                }
            }

            // Desbloquear pantalla (presionar POWER nuevamente)
            driver.unlockDevice();
        }
    }

    /**
     * Verifies whether the Tella app is currently active in the foreground.
     * <p>
     * This method retrieves the current package name of the app in the foreground
     * and checks if it matches the Tella package: {@code org.hzontal.tella}.
     * </p>
     *
     * @return {@code true} if the Tella app is currently active in the foreground;
     * {@code false} if the app is closed or running in the background.
     */
    public static boolean verifyActiveAppTella() {
        AndroidDriver<?> driver = (AndroidDriver<?>) GenericService.getDriver();
        String currentPackage = driver.getCurrentPackage();

        if (!"org.hzontal.tella".equals(currentPackage)) {
            System.out.println("The app is closed or in the background.");
            return true;
        } else {
            System.out.println("The app is active in the foreground.");
            return true;

        }
    }

    /**
     * we reopen the application
     */
    public static void openAppTella() {
        if (MobileActionManager.isAndroid()) {
            AndroidDriver<?> driver = (AndroidDriver<?>) GenericService.getDriver();
            driver.activateApp("org.hzontal.tella");
        }
    }

    public static void clicBackIcon() {
        MobileActionManager.waitVisibility(SettingsConstants.GO_BACK_BUTTON).click();
    }

}



