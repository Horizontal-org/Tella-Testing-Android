package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import static com.crowdar.tella.constants.PhotographyAndVideoConstants.*;

public class PhotographyAndVideoService {


    public static void tapGridButtonAssert() {
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        boolean isElementEnabled = driver.findElements(By.xpath(CAMERA_GRID_SHOW)).isEmpty();
        Assert.assertEquals("El elemento no está activado", true, isElementEnabled);
    }

    public static void videoResolution() {
        MobileActionManager.click(VIDEO_LOW_RESOLUTION_OPTION);
        MobileActionManager.click(VIDEO_HIGHEST_POSIBLE_OPTION);
        try {
            Thread.sleep(1000);
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
            try {
                WebDriverWait wait = new WebDriverWait(driver, 10);
                boolean isInvisible = wait.until(ExpectedConditions.invisibilityOfElementLocated(byLocator));
                if (!isInvisible) {
                    Assert.fail("El elemento está visible: " + locator);
                }
            } catch (Exception e) {
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

    public static void deleteTextAndSendKeys(){
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        MobileElement textField = (MobileElement) driver.findElement(By.id("renameEditText"));
        textField.clear();
        textField.sendKeys("Tella");
    }


    public static void sendKeysFolder(){
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        MobileElement textField = (MobileElement) driver.findElement(By.id("renameEditText"));
        textField.clear();
        textField.sendKeys("TellaFolder");
    }



    public static void changeNameAssert(){
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        WebDriverWait wait = new WebDriverWait(driver, 30); // Espera de hasta 30 segundos
        try {
            MobileElement textView = (MobileElement) wait.until(
                    ExpectedConditions.presenceOfElementLocated(By.xpath("//android.widget.TextView[@text='Tella']"))
            );
            System.out.println("TextView con texto 'Tella' localizado.");
            String actualText = textView.getAttribute("text");
            System.out.println("Texto actual del TextView: " + actualText);
            String expectedText = "Tella";

            Assert.assertEquals(actualText, expectedText, "El nombre del archivo no se ha cambiado correctamente.");
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail("Se produjo un error durante la verificación del cambio de nombre del archivo.");
        }
    }
}





