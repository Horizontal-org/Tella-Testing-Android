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

    @When("the user taps the Rec option")
    public void theUserTapsTheRecOption() {
        AudioService.clickRecOption();
    }
    @And("the user press the microphone")
    public void tapsTheGeneralOption() {
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
    public void writeNewRecordingName(String recordName) {
        AudioService.addNewRecordingName(recordName);
    }

    @Then("views the title (.*) at the top of the page")
    public void viewsTheTitleAlTheTopOfThePage(String title) {
        SettingsService.verifyLanguageTitle(title);
    }
}
