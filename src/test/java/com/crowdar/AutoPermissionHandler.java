package com.crowdar;

import com.crowdar.driver.DriverManager;
import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.AndroidElement;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.Arrays;
import java.util.List;

import java.time.Duration;

public class AutoPermissionHandler {
    public static RemoteWebDriver getDriver() {
        AndroidDriver driver = (AndroidDriver) DriverManager.getDriverInstance().getWrappedDriver();
        return driver;
    }

    private static final List<String> PERMISSION_BUTTON_TEXTS = Arrays.asList(
            "Permitir", "Allow", "Mientras la app está en uso", "Solo esta vez", "Aceptar", "While using the app", "Only this time"
    );

    public static void handleIfPresent() {
        AndroidDriver<AndroidElement> driver = (AndroidDriver<AndroidElement>) getDriver();
        WebDriverWait wait = new WebDriverWait(driver, 2);

        try {
            if (driver.findElements(MobileBy.id("com.android.permissioncontroller:id/permission_allow_foreground_only_button")).size() > 0) {
                AndroidElement btn = (AndroidElement) wait.until(
                        ExpectedConditions.presenceOfElementLocated(
                                MobileBy.id("com.android.permissioncontroller:id/permission_allow_foreground_only_button")
                        )
                );
                btn.click();
                System.out.println("Permiso de Android aceptado automáticamente por ID del sistema.");
                return;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
