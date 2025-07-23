package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.core.actions.WebActionManager;
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
import org.testng.asserts.Assertion;

import java.util.List;
import java.util.NoSuchElementException;

import static com.crowdar.core.actions.ActionManager.*;

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
        waitVisibility(FilesConstants.PLUS_ICON);
        MobileActionManager.click(FilesConstants.PLUS_ICON);
    }

    public static void goPhotoVideoOption() {
        waitVisibility(FilesConstants.PHOTOVIDEO_OPTION);
        MobileActionManager.click(FilesConstants.PHOTOVIDEO_OPTION);
        acceptPermissions();
    }

    public static void selectOpcion(String option) {
        waitVisibility(FilesConstants.PHOTO_OPTION);
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
            waitVisibility(FilesConstants.STOP_RECORDING_BUTTON);
            MobileActionManager.click(FilesConstants.STOP_RECORDING_BUTTON);
        }

        MobileActionManager.click(FilesConstants.CLOSE_BUTTON);
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    public static void validateMessage(String expectedMessage) throws InterruptedException {
        //Assert.assertTrue(MobileActionManager.isEnabled(AudioConstants.MESSAGE_TITLE));
        Thread.sleep(300);
        String actualMessage = MobileActionManager.getText(AudioConstants.MESSAGE_TITLE);
        Assert.assertEquals(actualMessage, expectedMessage, "The actual message does not match the expected message");
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
        } catch (NoSuchElementException e) {
            System.err.println("No se encontró el elemento: " + e.getMessage());
            throw e;
        }
    }


    public static void validateAppearsFolderSave(String folderSave) {
        waitVisibility(FilesConstants.CREATED_FILE_NAME);
        String currentFolder = MobileActionManager.getText(FilesConstants.CURRENT_FOLDER);
        Assert.assertEquals(currentFolder, folderSave);
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    public static void validateFileInAllFiles() {
        waitVisibility(FilesConstants.ALL_FILES_FOLDER);
        MobileActionManager.click(FilesConstants.ALL_FILES_FOLDER);
        waitVisibility(FilesConstants.CURRENT_FILE);
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
        GenericService.commonClick(HomeConstants.CAMERA_BUTTON);
        FilesService.acceptPermissions();
        GenericService.commonClick(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
    }

    public static void createVideoFiles() throws InterruptedException {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        GenericService.commonClick(FilesConstants.VIDEO_OPTION);
        GenericService.commonClick(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
        Thread.sleep(100);
        GenericService.commonClick(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
        Thread.sleep(100);
        MobileActionManager.waitClickable(FilesConstants.CLOSE_BUTTON);
        GenericService.commonClick(FilesConstants.CLOSE_BUTTON);

    }


    public static void createFolder() {
        GenericService.commonClick(FilesConstants.ALL_FILES);
        GenericService.commonClick(FilesConstants.PLUS_ICON);
        GenericService.commonClick(FilesConstants.CREATE_FOLDER_BUTTON);
        PhotographyAndVideoService.deleteTextAndSendKeys();
        GenericService.commonClick(SettingsConstants.OK_BUTTON);
        GenericService.commonClick(FilesConstants.BACK_BUTTON);
    }

    public static void validateFolderCreation() {
        waitVisibility(FilesConstants.CREATED_FILE_NAME);
        Assert.assertTrue(MobileActionManager.isEnabled(FilesConstants.CREATED_FILE_NAME));
    }

    public static void createFilesAndFolder() throws InterruptedException {
        createFolder();
        createAudioFiles();
        createPhotoFiles();
        createVideoFiles();
    }


    public static void createFiles() throws InterruptedException {
        createAudioFiles();
        createPhotoFiles();
        createVideoFiles();
    }

    public static void orderBy() {
        GenericService.commonClick(FilesConstants.SORT_BUTTON);
        GenericService.commonClick(FilesConstants.SORT_OLDEST_TO_NEWEST_BUTTON);
    }

    public static void validateFolderEmptyFolder() {
        waitInvisibility(FilesConstants.EMPTY_VIEW_MSG_CONTAINER);
        Assert.assertFalse(MobileActionManager.isEnabled(FilesConstants.CREATED_FILE_NAME));
    }

    public static void validateFolderName() {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        MobileElement folderNameElement = driver.findElement(By.xpath("//android.widget.TextView[@resource-id='org.hzontal.tella:id/fileNameTextView' and @text='Tella']"));
        boolean isDisplayed = folderNameElement.isDisplayed();
        Assert.assertTrue(isDisplayed, "The folder named 'Tella' is not displayed on the screen");
    }

    public static void clickFiles() {
        MobileActionManager.click(HomeConstants.HOME_BUTTON);
        waitVisibility(FilesConstants.ALL_FILES);
        MobileActionManager.click(FilesConstants.ALL_FILES);
    }

    public static void chooseNewCreatedFolder() {
        MobileActionManager.getText(FilesConstants.NEW_FOLDER);
        GenericService.commonClick(FilesConstants.NEW_FOLDER);
    }

    public static void chooseFolder() {
        GenericService.commonClick(FilesConstants.PICK_FOLDER);
    }

    /**
     * Open Open a folder by passing the name
     *
     * @param nameFolder name of the folder to access
     */
    public static void clicFolder(String nameFolder) {
        MobileActionManager.waitClickable(FilesConstants.SELECT_FOLDER_ICON, nameFolder).click();
    }

    /**
     * Validate that the all files folder is not empty.
     * This is confirmed by audio icon.
     */
    public static void validateIsNotEmptyFolderAllFile() {
        clicFolder("All files");
        Assert.assertTrue(MobileActionManager.waitVisibility(FilesConstants.ICON_FILE_AUDIO).isDisplayed());
    }

    /**
     * Validate that the all files folder is empty.
     * This is confirmed by the empty folder icon.
     */
    public static void validateIsEmptyFolderAllFile() {
        clicFolder("All files");
        Assert.assertTrue(MobileActionManager.waitVisibility(FilesConstants.EMPTY_VIEW_MSG_CONTAINER).isDisplayed());
    }

}

