package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.*;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import java.util.List;
import java.util.NoSuchElementException;

public class FilesService {

    static String message = null;
    static String createdFile = null;


    public static void enterFolder(String nameFolder) {
        try {
            AndroidDriver<MobileElement> driver = (AndroidDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
            WebDriverWait wait = new WebDriverWait(driver, 10);
            System.out.println("Waiting for folder: " + nameFolder);
            MobileElement folderElement = (MobileElement) wait.until(ExpectedConditions.presenceOfElementLocated(
                    MobileBy.AndroidUIAutomator(
                            "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                                    ".scrollIntoView(new UiSelector().textMatches(\"" + nameFolder + "\").instance(0))"
                    )));

            System.out.println("Folder found: " + nameFolder);
            folderElement.click();
        } catch (TimeoutException e) {
            System.out.println("Timeout waiting for folder: " + nameFolder);
        }
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

        MobileActionManager.click(FilesConstants.CLOSE_BUTTON);
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    public static void validateMessage(String expectedMessage) {
        Assert.assertTrue(MobileActionManager.isEnabled(AudioConstants.MESSAGE_TITLE));
    }

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
            AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
            WebDriverWait wait = new WebDriverWait(driver, 10);
            wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.id(AudioConstants.PERMISSIONS_MESSAGE)));
            List<MobileElement> elems = driver.findElements(MobileBy.id(AudioConstants.PERMISSIONS_MESSAGE));
            if (elems.size() > 0) {
                driver.findElement(MobileBy.id(AudioConstants.PERMISSIONS_ACCEPT_BUTTON)).click();
            }
        } catch (TimeoutException e) {
        }
    }

    public static void createAudioFiles() {
        GenericService.commonClick(AudioConstants.MICROPHONE_ICON2);
        AudioService.clickStartOption();
        AudioService.acceptPermissions();
        AudioService.clickStartOption();
        AudioService.clickStopOption2();
    }

    public static void createPhotoFiles() {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        GenericService.commonClick(HomeConstants.CAMERA_BUTTON);
        FilesService.acceptPermissions();
        GenericService.commonClick(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
        WebDriverWait wait = new WebDriverWait(driver, 5);
    }

    public static void createVideoFiles() {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        GenericService.commonClick(FilesConstants.VIDEO_OPTION);
        GenericService.commonClick(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
        GenericService.commonClick(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
        WebDriverWait wait = new WebDriverWait(driver, 5);
        GenericService.commonClick(FilesConstants.CLOSE_BUTTON);
    }

    public static void createFiles() {
        createAudioFiles();
        createPhotoFiles();
        createVideoFiles();
    }

}

