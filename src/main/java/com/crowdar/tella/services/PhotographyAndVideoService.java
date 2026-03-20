package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.FilesConstants;
import com.crowdar.tella.constants.PhotographyAndVideoConstants;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.Map;

import static com.crowdar.tella.constants.PhotographyAndVideoConstants.*;

public class PhotographyAndVideoService {


    public static void tapGridButtonAssert() {
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        boolean isElementEnabled = driver.findElements(By.xpath("//android.widget.ImageButton[@content-desc='show grid view']")).isEmpty();
        Assert.assertEquals("El elemento no está activado", true, isElementEnabled);
    }

    public static void videoResolution(String resolution) {

        String index = RESOLUTION_MAP.get(resolution.toLowerCase());

        if (index == null) {
            throw new RuntimeException("Invalid resolution: " + resolution);
        }

        MobileActionManager.waitVisibility(PhotographyAndVideoConstants.VIDEO_RESOLUTION_OPTION, index);
        MobileActionManager.click(PhotographyAndVideoConstants.VIDEO_RESOLUTION_OPTION, index);
    }

    private static final Map<String, String> RESOLUTION_MAP = Map.of(
            "highest possible", "1",
            "medium", "2",
            "low", "3"
    );

    public static void videoResolutionAssert(String resolution) {

        String index = RESOLUTION_MAP.get(resolution.toLowerCase());

        if (index == null) {
            throw new RuntimeException("Invalid resolution: " + resolution);
        }

        AppiumDriver<MobileElement> driver =
                (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();

        String locator = String.format(PhotographyAndVideoConstants.VIDEO_RESOLUTION_OPTION, index);
        By byLocator = GenericService.stringToBy(locator);

        WebDriverWait wait = new WebDriverWait(driver, 10);
        WebElement element = wait.until(ExpectedConditions.visibilityOfElementLocated(byLocator));

        boolean isChecked = Boolean.parseBoolean(element.getAttribute("checked"));

        Assert.assertTrue("The video resolution option is not selected", isChecked);
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

    public static void deleteTextAndSendKeys() {
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        MobileElement textField = (MobileElement) driver.findElement(By.id("renameEditText"));
        textField.clear();
        textField.sendKeys("Tella");
    }


    public static void sendKeysFolder() {
        MobileActionManager.waitVisibility(FilesConstants.INPUT_FIELD_FOLDER);
        MobileActionManager.getElement(FilesConstants.INPUT_FIELD_FOLDER).clear();
        MobileActionManager.getElement(FilesConstants.INPUT_FIELD_FOLDER).sendKeys("TellaFolder");

    }


    public static void changeNameAssert() {
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        WebDriverWait wait = new WebDriverWait(driver, 30);
            MobileElement textView = (MobileElement) wait.until(
                    ExpectedConditions.presenceOfElementLocated(By.xpath("//android.widget.TextView[@text='Tella']"))
            );
            System.out.println("TextView con texto 'Tella' localizado.");
            String actualText = textView.getAttribute("text");
            System.out.println("Texto actual del TextView: " + actualText);
            String expectedText = "Tella";

            Assert.assertEquals(actualText, expectedText);


    }

    public static void enableGrid() {
        MobileActionManager.waitClickable(PhotographyAndVideoConstants.CAMERA_GRID_SHOW);
        GenericService.commonClick(PhotographyAndVideoConstants.CAMERA_GRID_SHOW);
    }

    public static void deleteButton(){
        if (MobileActionManager.isPresent(PhotographyAndVideoConstants.DELETE_FILE_BUTTON)) {
            GenericService.commonClick(PhotographyAndVideoConstants.DELETE_FILE_BUTTON);
        } else {
            MobileActionManager.waitVisibility(PhotographyAndVideoConstants.CONFIRM_DELETE_FILE_BUTTON);
            GenericService.commonClick(PhotographyAndVideoConstants.CONFIRM_DELETE_FILE_BUTTON);

        }
    }
}





