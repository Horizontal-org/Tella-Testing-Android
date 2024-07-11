package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.AudioConstants;
import com.crowdar.tella.constants.FilesConstants;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import java.io.IOException;
import java.util.List;
import java.util.NoSuchElementException;

import static io.appium.java_client.MobileBy.*;

public class FilesService {

    static String message = null;
    static String createdFile = null;

    public static void enterFolder(String nameFolder) {
        WebElement folderElement = DriverManager.getDriverInstance().getWrappedDriver().findElement(AndroidUIAutomator(
                "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                        ".scrollIntoView(new UiSelector()" +
                        ".textMatches(\"" + nameFolder + "\").instance(0))"));
        folderElement.click();
    }

    public static void tapPlusIcon() {
        MobileActionManager.waitVisibility(FilesConstants.PLUS_ICON);
        MobileActionManager.click(FilesConstants.PLUS_ICON);
    }

    public static void goPhotoVideoOption() {
        MobileActionManager.waitVisibility(FilesConstants.PHOTOVIDEO_OPTION);
        MobileActionManager.click(FilesConstants.PHOTOVIDEO_OPTION);
        acceptPermissions();
    }

    public static void selectOpcion(String option) {
        MobileActionManager.waitVisibility(FilesConstants.PHOTO_OPTION);
        String optionLowerCase = option.toLowerCase();
        if (optionLowerCase.contains("photo")) {
            MobileActionManager.click(FilesConstants.PHOTO_OPTION);
        } else if (optionLowerCase.contains("video")) {
            MobileActionManager.click(FilesConstants.VIDEO_OPTION);
        }
    }

    public static void captureFile(String type) {

        MobileActionManager.click(FilesConstants.CAPTURE_BUTTON);

        if (type.contains("image")) {
        } else if (type.contains("video")) {
            MobileActionManager.waitVisibility(FilesConstants.STOP_RECORDING_BUTTON);
            MobileActionManager.click(FilesConstants.STOP_RECORDING_BUTTON);
        }

        MobileActionManager.click(FilesConstants.X_BUTTON);
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    public static void validateMessage(String expectedMessage) {
        Assert.assertEquals(expectedMessage, message);
        MobileActionManager.click(FilesConstants.CLOSE_BUTTON);

        //regresamos al homepage de la aplicación
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    /*
    public static void validateFileCreation(String type, String nameFolder) {
        WebElement folderSaveElement;
        folderSaveElement = DriverManager.getDriverInstance().getWrappedDriver().findElement(new ByXPath("//android.widget.TextView[@resource-id='org.hzontal.tella:id/startTitleTv']"));
        folderSaveElement = MobileActionManager.getText(FilesConstants.CURRENT_FOLDER)
                folderSaveElement.click();

        String currentFolder = MobileActionManager.getText(FilesConstants.CURRENT_FOLDER);
        Assert.assertEquals(currentFolder, nameFolder);
        validateExtension(type);
        createdFile = MobileActionManager.getText(FilesConstants.CREATED_FILE_NAME);
    }
*/

    public static void validateFileCreation(String type, String nameFolder) {
        WebDriverWait wait = new WebDriverWait(DriverManager.getDriverInstance().getWrappedDriver(), 20);
        AndroidDriver<MobileElement> driver = (AndroidDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();

        try {
            // Intentar encontrar y hacer clic en la carpeta de destino
            System.out.println("Buscando la carpeta: " + nameFolder);
            WebElement folderSaveElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                    "new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text(\"" + nameFolder + "\"))")));
            System.out.println("Carpeta encontrada: " + nameFolder);
            folderSaveElement.click();

            // Espera explícita para que el texto de la carpeta actual se actualice
            System.out.println("Esperando a que se actualice la carpeta actual...");

            // Usar MobileBy.AndroidUIAutomator para seleccionar el elemento y extraer el texto
            WebElement currentFolderElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                    "new UiSelector().resourceId(\"org.hzontal.tella:id/startTitleTv\")")));
            String currentFolder = currentFolderElement.getText();
            System.out.println("Carpeta actual: " + currentFolder);

            Assert.assertEquals(currentFolder, nameFolder);
            validateExtension(type);

            // Obtener el nombre del archivo creado usando AndroidUIAutomator
            WebElement createdFileElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                    "new UiSelector().resourceId(\"" + FilesConstants.CREATED_FILE_NAME + "\")")));
            String createdFile = createdFileElement.getText();
            System.out.println("Archivo creado: " + createdFile);
        } catch (TimeoutException e) {
            System.err.println("Timeout esperando por el elemento: " + e.getMessage());
            throw e;
        } catch (NoSuchElementException e) {
            System.err.println("No se encontró el elemento: " + e.getMessage());
            throw e;
        }
    }

/*
    public static void validateFileCreation(String type, String nameFolder) {
        WebDriverWait wait = new WebDriverWait(DriverManager.getDriverInstance().getWrappedDriver(), 20);

        try {
            // Intentar encontrar y hacer clic en la carpeta de destino
            System.out.println("Buscando la carpeta: " + nameFolder);
            WebElement folderSaveElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                    "new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text(\"" + nameFolder + "\"))")));
            System.out.println("Carpeta encontrada: " + nameFolder);
            folderSaveElement.click();

            // Espera explícita para que el texto de la carpeta actual se actualice
            System.out.println("Esperando a que se actualice la carpeta actual...");
           // WebElement currentFolderElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.xpath(FilesConstants.CURRENT_FOLDER)));
            String currentFolder = GenericService.getTextAtCoordinates(185,153);
            System.out.println("Carpeta actual: " + currentFolder);

            Assert.assertEquals(currentFolder, nameFolder);
            validateExtension(type);

            // Obtener el nombre del archivo creado
            WebElement createdFileElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.id(FilesConstants.CREATED_FILE_NAME)));
            createdFile = createdFileElement.getText();
            System.out.println("Archivo creado: " + createdFile);
        } catch (TimeoutException e) {
            System.err.println("Timeout esperando por el elemento: " + e.getMessage());
            throw e;
        } catch (NoSuchElementException e) {
            System.err.println("No se encontró el elemento: " + e.getMessage());
            throw e;
        }
    }




    public static void validateFileCreation(String type, String nameFolder) {
        WebDriverWait wait = new WebDriverWait(DriverManager.getDriverInstance().getWrappedDriver(), 20);
        GenericService.ScreenUtils screenUtils = new GenericService.ScreenUtils((AndroidDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver());

        try {
            // Intentar encontrar y hacer clic en la carpeta de destino
            System.out.println("Buscando la carpeta: " + nameFolder);
            WebElement folderSaveElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                    "new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text(\"" + nameFolder + "\"))")));
            System.out.println("Carpeta encontrada: " + nameFolder);
            folderSaveElement.click();

            // Espera explícita para que el texto de la carpeta actual se actualice
            System.out.println("Esperando a que se actualice la carpeta actual...");

            // Calcular las coordenadas relativas de "All files"
            Point point = screenUtils.getCoordinates(0.1, 0.1); // Ajusta los valores según sea necesario
            String screenshotPath = "currentFolderScreenshot.png";
            screenUtils.takeScreenshotOfRegion(point, 300, 100, screenshotPath); // Ajusta el tamaño según sea necesario

            // Usar Tesseract OCR para extraer el texto
            String currentFolder = screenUtils.extractTextFromImage(screenshotPath);
            System.out.println("Carpeta actual: " + currentFolder);

            Assert.assertEquals(currentFolder, nameFolder);
            validateExtension(type);

            // Obtener el nombre del archivo creado usando AndroidUIAutomator
            WebElement createdFileElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                    "new UiSelector().resourceId(\"" + FilesConstants.CREATED_FILE_NAME + "\")")));
            createdFile = createdFileElement.getText();
            System.out.println("Archivo creado: " + createdFile);
        } catch (TimeoutException e) {
            System.err.println("Timeout esperando por el elemento: " + e.getMessage());
            throw e;
        } catch (NoSuchElementException e) {
            System.err.println("No se encontró el elemento: " + e.getMessage());
            throw e;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
*/


    public static void validateAppearsFolderSave(String folderSave) {
        MobileActionManager.waitVisibility(FilesConstants.CREATED_FILE_NAME);
        String currentFolder = MobileActionManager.getText(FilesConstants.CURRENT_FOLDER);
        Assert.assertEquals(currentFolder, folderSave);
        //regresamos al homepage de la aplicación
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    public static void validateFileInAllFiles() {
        MobileActionManager.waitVisibility(FilesConstants.ALL_FILES_FOLDER);
        MobileActionManager.click(FilesConstants.ALL_FILES_FOLDER);
        MobileActionManager.waitVisibility(FilesConstants.CURRENT_FILE);
        String currentFile = MobileActionManager.getText(FilesConstants.CURRENT_FILE);
        Assert.assertEquals(createdFile, currentFile);
    }


    public static void acceptPermissions() {
        try {
            WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
            WebDriverWait wait = new WebDriverWait(driver, 10);
            wait.until(ExpectedConditions.presenceOfElementLocated(By.id(AudioConstants.PERMISSIONS_MESSAGE)));
            List<WebElement> elems = DriverManager.getDriverInstance().getWrappedDriver().findElements(By.id(AudioConstants.PERMISSIONS_MESSAGE));
            if (elems.size() > 0) {
                DriverManager.getDriverInstance().getWrappedDriver().findElement(By.id(AudioConstants.PERMISSIONS_ACCEPT_BUTTON)).click();
                DriverManager.getDriverInstance().getWrappedDriver().findElement(By.id(AudioConstants.PERMISSIONS_ACCEPT_BUTTON)).click();
            }
        } catch (TimeoutException e) {
        }
    }

    public static void validateExtension(String type) {
        String createdFileName = MobileActionManager.getText(FilesConstants.CREATED_FILE_NAME);
        if (createdFileName != null) {
            if (type.toLowerCase().contains("image")) {
                Assert.assertTrue(createdFileName.endsWith(".jpg"), "La validación para imagen falló: " + createdFileName);
            } else if (type.toLowerCase().contains("video")) {
                Assert.assertTrue(createdFileName.endsWith(".mp4"), "La validación para video falló: " + createdFileName);
            }
        }
    }
}
