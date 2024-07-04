package com.crowdar.tella.report;

import com.crowdar.driver.DriverManager;


import io.lippia.reporter.ltm.TestManagerAPIAdapter;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

public class TestManager extends TestManagerAPIAdapter {

	public TestManager(String arg) {
		super();
	}

	@Override
	public String getBase64Image() {
		return  ((TakesScreenshot) DriverManager.getDriverInstance()).getScreenshotAs(OutputType.BASE64);
	}

}
