package com.crowdar;

import com.crowdar.driver.DriverManager;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.util.Arrays;
import java.util.List;


public class AutoPermissionHandler {
    public static RemoteWebDriver getDriver() {
        AndroidDriver driver = (AndroidDriver) DriverManager.getDriverInstance().getWrappedDriver();
        return driver;
    }

    private static final List<String> PERMISSION_BUTTON_TEXTS = Arrays.asList(
            "Permitir", "Allow", "Mientras la app está en uso", "Solo esta vez", "Aceptar", "While using the app", "Only this time"
    );
}