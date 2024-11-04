package com.crowdar.tella.steps;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.FilesConstants;
import com.crowdar.tella.constants.SettingsConstants;
import com.crowdar.tella.services.FilesService;
import com.crowdar.tella.services.GenericService;
import com.crowdar.tella.services.PhotographyAndVideoService;
import io.cucumber.java.en.*;

import static org.testng.AssertJUnit.assertTrue;

public class FilesSteps {

    @When("the user enters the folder (.*)")
    public void theUserEnterTheFolder(String nameFolder) {
        FilesService.enterFolder(nameFolder);
    }

    @And("taps the \"+\" button")
    public void tapPlusIcon() {
        FilesService.tapPlusIcon();
    }

    @And("selects the option (.*)")
    public void selectOpcion(String option) {
        FilesService.selectOpcion(option);
    }

    @And("captures the file of type (.*)")
    public void captureFile(String type) {
        FilesService.captureFile(type);
    }

    @Then("the message (.*) appears")
    public void validateMessage(String expectedMessage) throws InterruptedException {
        FilesService.validateMessage(expectedMessage);
    }

    @And("the file of type (.*) is saved correctly in the folder (.*)")
    public void validateFileCreation(String type, String nameFolder) {
        FilesService.validateFileCreation(type, nameFolder);
    }

    @And("the file appears in the list of files in the folder (.*)")
    public void validateAppearsFolderSave(String folderSave) {
        FilesService.validateAppearsFolderSave(folderSave);
    }

    @Then("the file appears in the \"All files\" folder")
    public void validateFileInAllFiles() {
        FilesService.validateFileInAllFiles();
    }

    @And("selects the option: Take photo or video")
    public void selectsTheOptionTakePhotoOrVideo() {
        FilesService.goPhotoVideoOption();
    }

    @And("there are files and folders within Tella app")
    public void thereAreFilesAndFoldersWithinTellaApp() throws InterruptedException {
        FilesService.createFiles();
    }

    @And("capture the file extension (.*)")
    public void captureTheFileExtensionType(String type) {
        boolean isFileTypePresent = GenericService.verifyFilePresence(type);
        assertTrue("No se encontró un archivo de tipo " + type + " en la carpeta", isFileTypePresent);
    }


    @Then("the type (.*) file is opened")
    public void theTypeTypeFileIsOpened(String type) {

    }

    @And("taps the options button ⋮ for the (.*) file")
    public void tapsTheOptionsButtonForTheTypeFile(String type) {
        MobileActionManager.click(FilesConstants.THREE_BUTTONS_OPTION_FILE, type);
    }

    @Then("the file (.*) is deleted")
    public void theFileTypeIsDeleted() {
    }

    @And("taps the options button ⋮")
    public void tapsTheOptionsButton() {
        GenericService.commonClick(FilesConstants.MORE_OPTIONS_THREE_POINTS_BUTTON);
    }

    @And("taps the Checkbox button and selects multiple (.*) files")
    public void tapsTheCheckboxButtonAndSelectsMultipleTypeFiles(String type) {
        GenericService.commonClick(FilesConstants.CHECKBOX_BUTTON);
        GenericService.commonClick(FilesConstants.CHECKBOX_BUTTON);
    }

    @And("taps the options button ⋮ of a file")
    public void tapsTheOptionsButtonOfAFile() {
        GenericService.commonClick(FilesConstants.THREE_BUTTONS_OPTION);
    }

    @And("taps the option Move to another folder")
    public void tapsTheOptionMoveToAnotherFolder() {
        GenericService.commonClick(FilesConstants.MOVE_TO_BUTTON);
    }

    @And("chooses the destination folder")
    public void choosesTheDestinationFolder() {
        GenericService.commonClick(FilesConstants.PICK_FOLDER);
    }

    @And("taps the option Move here")
    public void tapsTheOptionMoveHere() {
        GenericService.commonClick(FilesConstants.MOVE_HERE_BUTTON);
    }

    @Then("the file is moved to the selected folder")
    public void theFileIsMovedToTheSelectedFolder() {
        FilesService.validateFolderEmptyFolder();
    }

    @And("the user creates a new folder called (.*)")
    public void theUserCreatesANewFolderCalled(String nameNewFolder) {
        FilesService.createFolder();
        FilesService.validateFolderCreation();
    }


    @When("the user enter the folder All Files")
    public void theUserEnterTheFolderAllFiles() {
        FilesService.clickFiles();
    }

    @And("taps the option +")
    public void tapsTheOption() {
        GenericService.commonClick(FilesConstants.ADD_FOLDER);
    }

    @And("enters a name for the folder")
    public void entersANameForTheFolder() {
        PhotographyAndVideoService.sendKeysFolder();
    }

    @And("presses Ok button")
    public void pressesOkButton() {
        GenericService.commonClick(SettingsConstants.OK_BUTTON);
    }

    @And("chooses the new folder a destination")
    public void choosesTheNewFolderADestination() {
        GenericService.commonClick(FilesConstants.ALL_FILES);
    }

    @And("taps go back button")
    public void tapsGoBackButton() {
        GenericService.commonClick(FilesConstants.BACK_BUTTON);
    }

    @And("taps the options button ⋮ of the created folder")
    public void tapsTheOptionsButtonOfTheCreatedFolder() {
        GenericService.commonClick(FilesConstants.THREE_BUTTONS_OPTION);
    }

    @And("select the option Create a new folder")
    public void selectTheOptionCreateANewFolder() {
        GenericService.commonClick(FilesConstants.CREATE_FOLDER_BUTTON);
    }

    @And("enters a name for the folder (.*)")
    public void entersANameForTheFolder(String TellaFolder) {
        PhotographyAndVideoService.deleteTextAndSendKeys();
    }

    @Then("the folder name is updated")
    public void theFolderNameIsUpdated() {
        FilesService.validateFolderName();
    }


    @And("press the record icon and then press stop")
    public void pressTheRecordIconAndThenPressStop() {
        GenericService.recAndStopRecord();

    }
}
