package com.crowdar.tella.steps;

import com.crowdar.tella.constants.LockUnlockConstants;
import com.crowdar.tella.services.LockService;
import com.crowdar.tella.services.UnlockService;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class LockSteps {

    @When("the user taps the Next button until reaching the lock options")
    public void tapNextButton() {
        UnlockService.clickNextButtons(4);
    }

    @And("the user taps the Password button")
    public void tapThePasswordButton() {
        LockService.clickPasswordButton();
    }

    @And("the user types a password (.*)")
    public void typesAPassword(String password) {
        LockService.setOnePassword(password);
    }

    @And("the user taps the Next button")
    public void tapTheNextButton() {
        LockService.clickNextPasswordButton();
    }

    @Then("a message (.*) is displayed to the user")
    public void aMessageIsDisplayedToTheUser(String message) {
        LockService.errorMessageDisplayed(message);
    }

    @Then("the next button remains disabled")
    public void theNextButtonRemainsDisabled() {
        LockService.verifyNextButtonEnabled(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
    }

    @And("the user taps the PIN button")
    public void tapThePinButton() {
        LockService.clickPinButton();
    }

    @And("the user taps the OK button")
    public void tapTheNextPinButton() {
        LockService.TapNextPinButton();
    }

    @And("the user types a pin (.*)")
    public void typesAPin(String pin) {
        UnlockService.setPin(pin);
    }

    @Then("the next pin button remains disabled")
    public void theNextPinButtonRemainsDisabled() {
        LockService.verifyNextPinButtonEnabled(LockUnlockConstants.PIN_RIGHT_BUTTON);
    }

    @Then("a successfully registered message (.*) is displayed to the user")
    public void aSuccessfullyRegisteredMessageIsDisplayed(String message) {
        LockService.messageDisplayed(message);
    }


    @And("the user taps the I UNDERSTAND button")
    public void theUserTapsTheIUNDERSTANDButton() {
        LockService.clickUnderstandBtn();
    }

    @And("the user taps the CONTINUE button")
    public void theUserTapsTheCONTINUEButton() {
        LockService.clickContinue();
    }

    @And("the user taps the Success screen Next button")
    public void theUserTapsTheSuccessScreenNextButton() {
        LockService.clickNextSuccessScreen();
    }

    @And("the user taps the GO TO TELLA button")
    public void theUserTapsTheGOTOTELLAButton() {
        LockService.clickGoToTella();
    }

    @And("the user taps the button (.*)")
    public void theUserTapsTheButton(String button) {
        LockService.clickOkNextPinButton(button);
    }
}
