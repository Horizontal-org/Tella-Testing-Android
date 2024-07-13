package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.PhotographyAndVideoConstants;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.NoSuchElementException;

import static com.crowdar.tella.constants.PhotographyAndVideoConstants.*;

public class PhotographyAndVideoService {


    public static void tapGridButtonAssert() {
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        boolean isElementEnabled = driver.findElements(By.xpath(CAMERA_GRID_SHOW)).isEmpty();
        Assert.assertEquals("El elemento no está activado", true, isElementEnabled);
    }


    public static void videoResolution() {
        MobileActionManager.click(PhotographyAndVideoConstants.VIDEO_LOW_RESOLUTION_OPTION);
        MobileActionManager.click(VIDEO_HIGHEST_POSIBLE_OPTION);
        try {
            Thread.sleep(1000); // Espera 1 segundo
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        videoResolutionAssert();
    }

    public static void videoResolutionAssert() {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        By byLocator = GenericService.stringToBy(VIDEO_HIGHEST_POSIBLE_OPTION);
        if (byLocator != null) {
            WebDriverWait wait = new WebDriverWait(driver, 10);
            WebElement element = wait.until(ExpectedConditions.visibilityOfElementLocated(byLocator));
            boolean isElementChecked = Boolean.parseBoolean(element.getAttribute("checked"));
            Assert.assertTrue("El elemento no está seleccionado", isElementChecked);
        } else {
            System.err.println("Tipo de localizador no soportado: " + VIDEO_HIGHEST_POSIBLE_OPTION);
        }
    }

    public static void previewFileAssert(String locator) {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        By byLocator = GenericService.stringToBy(locator);

        if (byLocator != null) {
            // Intentar encontrar el elemento y verificar que no está presente
            try {
                WebDriverWait wait = new WebDriverWait(driver, 10);
                wait.until(ExpectedConditions.presenceOfElementLocated(byLocator));
                Assert.fail("El elemento está presente: " + locator);
            } catch (NoSuchElementException e) {
                // Si se lanza NoSuchElementException, significa que el elemento no está presente
                Assert.assertTrue("El elemento no está presente, como se esperaba", true);
            } catch (Exception e) {
                // Maneja otras excepciones
                Assert.fail("Ocurrió un error inesperado: " + e.getMessage());
            }
        } else {
            System.err.println("Tipo de localizador no soportado: " + locator);
        }
    }


    public static void fileInformationAssert() {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        By byLocator = GenericService.stringToBy(FILE_CREATED_INFORMATION);
        if (byLocator != null) {
            WebDriverWait wait = new WebDriverWait(driver, 10);
            WebElement element = wait.until(ExpectedConditions.presenceOfElementLocated(byLocator));
            Assert.assertNotNull("El elemento no está presente", element);
        } else {
            System.err.println("Tipo de localizador no soportado: " + FILE_CREATED_INFORMATION);
        }
    }


}



