package com.crowdar.tella.services;

import com.crowdar.driver.DriverManager;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.io.FileHandler;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;



public class GenericService {

}
   /* private static AndroidDriver driver = (AndroidDriver) DriverManager.getDriverInstance().getWrappedDriver();

    public void ScreenTextRetriever(AndroidDriver<MobileElement> driver) {
        this.driver = driver;
    }

    public static String getTextAtCoordinates(double percentX, double percentY) {
        // Obtener el tamaño de la pantalla
        Dimension size = driver.manage().window().getSize();

        // Calcular las coordenadas absolutas
        int x = (int) (size.width * percentX);
        int y = (int) (size.height * percentY);

        // Tocar la pantalla en las coordenadas especificadas
        TouchAction touchAction = new TouchAction(driver);
        touchAction.tap(PointOption.point(x, y)).perform();

        // Obtener el elemento en la posición especificada
        MobileElement element = (MobileElement) driver.findElementByXPath("//*[contains(@text, '') and @bounds='[" + x + "," + y + "]']");

        // Extraer y devolver el texto del elemento
        return element.getText();
    }


    public static class ScreenUtils {

        private AndroidDriver<MobileElement> driver;

        public ScreenUtils(AndroidDriver<MobileElement> driver) {
            this.driver = driver;
        }


        public void takeScreenshotOfRegion(Point point, int width, int height, String fileName) throws IOException {
            File screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
            BufferedImage fullImg = ImageIO.read(screenshot);

            // Recortar la región específica de la captura de pantalla
            BufferedImage regionImg = fullImg.getSubimage(point.getX(), point.getY(), width, height);
            ImageIO.write(regionImg, "png", screenshot);

            // Guardar la imagen recortada
            FileHandler.copy(screenshot, new File(fileName));
        }

        public String extractTextFromImage(String imagePath) {
            ITesseract instance = new Tesseract();
            try {
                return instance.doOCR(new File(imagePath));
            } catch (TesseractException e) {
                e.printStackTrace();
                return null;
            }
        }

        public Point getCoordinates(double percentX, double percentY) {
            Dimension size = driver.manage().window().getSize();
            int x = (int) (size.width * percentX);
            int y = (int) (size.height * percentY);
            return new Point(x, y);
        }
    }
}

 */