package com.crowdar.tella.steps;

import com.crowdar.tella.services.AudioService;
import com.crowdar.tella.services.HomeService;
import com.crowdar.tella.services.SettingsService;
import com.crowdar.tella.services.UnlockService;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class AudioSteps {

    @When("the user press the Rec option")
    public void theUserTapsTheRecOption() {
        AudioService.clickRecOption();
    }
    @And("the user press the microphone")
    public void tapsTheGeneralOption(){
        AudioService.clickMicrophoneIcon();
    }
    @And("the user press the pencil icon")
    public void tapsTheLanguageOption() {
        AudioService.clickPencilIcon();
    }
    @And("the user delete the existing name pressing the delete button")
    public void deleteLastNameRecord() {
        AudioService.deleteLastName();
    }
    @And("the user write a new recording name (.*)")
    public void writeNewRecordingName(String recordName) throws InterruptedException {
        AudioService.addNewRecordingName(recordName);
    }
    @And("the user press ok")
    public void pressOKoption() {
        AudioService.clickOkbutton();
    }
    @And("the user press stop option")
    public void pressStopOption() {
        AudioService.clickStopOption();
    }
    @Then("the approval message (.*) is displayed")
    public void validateAprovalMessage(String message){
        AudioService.validateAprovalMessage(message);
    }
    @And("the file change the original name for a new one (.*)")
    public void validateNewName(String recordName){
        AudioService.validateNewName(recordName);
    }
}
