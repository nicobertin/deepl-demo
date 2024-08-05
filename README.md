# DeepL Demo

Este repositorio es una demostración de cómo integrar el servicio de traducción de DeepL en una aplicación Rails. Incluye ejemplos de un servicio de traducción y un concern para traducir automáticamente campos específicos de un modelo antes de guardarlos.

## Instalación

1. **Clonar el repositorio**:

    ```sh
    git clone https://github.com/nicobertin/deepl-demo.git
    cd deepl-demo
    ```

2. **Instalar las dependencias**:

    ```sh
    bundle install
    ```

3. **Configurar la clave de API de DeepL**:

    Crea un archivo `.env` en la raíz del proyecto y añade tu clave de API de DeepL:

    ```env
    DEEPL_API_KEY=tu_clave_de_api_deepl
    ```

## Uso

### Servicio DeepLService

El servicio `DeepLService` se encuentra en `app/services/deep_l_service.rb`. Puedes usar este servicio para traducir texto en cualquier parte de tu aplicación Rails.

Ejemplo de uso:

```ruby
translated_text = DeepLService.translate("Hola mundo", 'EN')
puts translated_text  # Output: "Hello world"
```