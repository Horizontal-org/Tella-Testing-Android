package com.crowdar.tella.steps;

import com.crowdar.tella.services.AudioService;
import com.crowdar.tella.services.FilesService;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class FilesSteps {

    @When("the user enters the folder (.*)")
    public void theUserEnterTheFolder(String nameFolder) {
        FilesService.enterFolder(nameFolder);
    }

    @And("taps the \"+\" button")
    public void tapPlusIcon() {
        FilesService.tapPlusIcon();
    }

    @And("selects the option: \"Take photovideo\"")
    public void selectTakePhotoVideoOption() {
        FilesService.goPhotoVideoOption();
    }

    @And("selects the option (.*)")
    public void selectOpcion(String option){
        FilesService.selectOpcion(option);
    }

    @And("captures the file of type (.*)")
    public void captureFile(String type){
        FilesService.captureFile(type);
    }

    @Then("the message (.*) appears")
    public void validateMessage(String expectedMessage){
        FilesService.validateMessage(expectedMessage);
    }

    @And("the file of type (.*) is saved correctly in the folder (.*)")
    public void validateFileCreation(String type, String nameFolder) {
        FilesService.validateFileCreation(type,nameFolder);
    }

    @And("the file appears in the list of files in the folder (.*)")
    public void validateAppearsFolderSave(String folderSave) {
        FilesService.validateAppearsFolderSave(folderSave);
    }

    @Then("the file appears in the \"All files\" folder")
    public void validateFileInAllFiles(){
        FilesService.validateFileInAllFiles();
    }
}
