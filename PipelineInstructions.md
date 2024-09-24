# DISPOSITIVOS DISPONIBLES PARA EJECUTAR EN EL PIPELINE

- Samsung Galaxy A11 - Android 10
- Samsung Galaxy A51 - Android 10
- Motorola Moto G71 5G - Android 11
- Google Pixel 7 Pro - Android 13
- Xiaomi Redmi Note 11 - Android 11
- Huawei P30 - Android 9
- Oppo Reno 6 - Android 11

## No disponibles en ningún modelo:
- Nexus
- Honor
- Tecno

Puedes ver qué dispositivos están disponibles en BrowserStack en este [link](https://www.browserstack.com/docs/app-automate/capabilities).

## Existen dos Pipelines para Tella, cada una funciona de un modo diferente.

### BrowserStack 1to1 Devices

Este pipeline te permitirá ejecutar las pruebas deseadas sobre un solo dispositivo a la vez. Podrás elegirlo en la lista desplegable, así como los `@Tags` que desees ejecutar. Le das al botón “Run Workflow” y verás un desplegable de este tipo:

### BrowserStack Parallel Devices At Time

Este pipeline te permitirá ejecutar las pruebas deseadas sobre TODOS los dispositivos de la lista a la vez. Podrás ver los dispositivos en la lista desplegable, y aunque elijas uno específico, los ejecutará todos a la vez. También estará disponible la sección para filtrar por `@Tags`.

Cuando hagas una ejecución, podrás verlo en GitHub de este modo:

Y en BrowserStack verás como se ejecutan todos los dispositivos a la vez:

**WARNING**: Tener presente que las ejecuciones de dispositivos en paralelo a veces pueden ser conflictivas. Si un dispositivo se comporta extraño, es recomendable hacer el test sobre ese dispositivo específico con el pipeline “BrowserStack 1to1 Devices”.

Si en futuro se añaden más dispositivos a testear en el pipeline, tener en cuenta que BrowserStack tiene sus propias limitaciones para hacer ejecuciones paralelas, ya que admite hasta cierta cantidad de celulares a la vez. Puedes consultar esto en la [documentación oficial de BrowserStack](https://www.browserstack.com/device-tiers).
