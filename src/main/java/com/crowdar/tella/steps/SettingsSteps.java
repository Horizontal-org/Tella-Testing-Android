package com.crowdar.tella.steps;

import com.crowdar.core.PropertyManager;
import com.crowdar.tella.services.HomeService;
import com.crowdar.tella.services.SettingsService;
import com.crowdar.tella.services.UnlockService;
import io.cucumber.java.en.*;

import java.util.Locale;


public class SettingsSteps {
    @Given("the user is in Tella home page")
    public void theUserIsInTellaHomePage() {
        UnlockService.isViewLoaded();
        UnlockService.setPassword(PropertyManager.getProperty("password"));
        UnlockService.goTella();
        HomeService.isHomeLoaded();
    }

    @Given("the user is in Tella home page and log in with pin (.*)")
    public void theUserIsInTellaHomePageAndLogInWithPin(String pin) {
        UnlockService.isViewLoaded();
        //UnlockService.clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        UnlockService.setNumbers(pin);
        UnlockService.goTella();
        HomeService.isHomeLoaded();
    }


    @And("the user close the app")
    public void theUserCloseTheApp() throws InterruptedException {
        UnlockService.reopenTheApp();
    }


    @When("the user taps the settings icon")
    public void theUserTapsTheSettingsIcon() {
        SettingsService.clickSettingsIcon();
    }
    @And("taps the general option")
    public void tapsTheGeneralOption() {
        SettingsService.clickGeneralIcon();
    }
    @And("taps the language option in the general category")
    public void tapsTheLanguageOption() {
        SettingsService.clickLanguageOptions();
    }
    @And("views the list with all available languages")
    public void viewsTheListWithAllAvailableLanguages() {
        SettingsService.verifyListOfLanguages();
    }
    @And("clicks on the language (.*)")
    public void clicksOnTheLanguage(String language) {
        SettingsService.clickChoosenLanguage(language);
    }
    @Then("views the title (.*) at the top of the page")
    public void viewsTheTitleAlTheTopOfThePage(String title) {
        SettingsService.verifyLanguageTitle(title);
    }

    @When("clicks on the category (.*)")
    public void clicksOnTheCategory(String category) {
        SettingsService.clickCategory(category);
    }
    @Then("the user access the category (.*)")
    public void theUserAccessTheCategory(String category) {
        SettingsService.accessCategory(category);
}
}
