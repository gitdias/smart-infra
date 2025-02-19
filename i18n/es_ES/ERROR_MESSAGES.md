# Documentación de mensajes de error

## ERROR_NOT_ROOT
**Resultado**: ERROR_NOT_ROOT
**Descripción**: Este script debe ejecutarse como root.
**Solución**: Ejecute el script utilizando el comando `sudo`.
**------**

## ERROR_TRANSLATION_FILE_MISSING
**Resultado**: ERROR_TRANSLATION_FILE_MISSING
**Descripción**: Falta el archivo de traducción para el idioma detectado.
**Solución**: Asegúrese de que el archivo `.lang` adecuado (por ejemplo, `pt_BR.lang`, `en_US.lang`, `es_ES.lang`) exista en el mismo directorio que el script. De lo contrario, utilice el `en_US.lang` predeterminado.
**------**

## ERROR_UNSUPPORTED_LANGUAGE
**Resultado**: ERROR_UNSUPPORTED_LANGUAGE
**Descripción**: El script no admite el idioma del sistema detectado.
**Solución**: El script volverá automáticamente al inglés (`en_US.lang`). Si desea compatibilidad con su idioma, cree un nuevo archivo `.lang` y agréguelo a la lógica del script.
**------**

## ERROR_OS_RELEASE_MISSING
**Resultado**: ERROR_OS_RELEASE_MISSING
**Descripción**: Falta el archivo `/etc/os-release` y el script no puede determinar la distribución de Linux.
**Solución**: Asegúrese de que exista el archivo `/etc/os-release` o proporcione un método alternativo para detectar la distribución (por ejemplo, `/etc/lsb-release` o `/etc/$distro-release`). **------**

## ERROR_DISTRIBUTION_UNKNOWN
**Resultado**: ERROR_DISTRIBUTION_UNKNOWN
**Descripción**: El script no pudo identificar la distribución de Linux.
**Solución**: Verifique si el script admite su distribución. Si no es así, considere agregarla a la lista de distribuciones admitidas en el script.
**------**

## ERROR_PERMISSION_DENIED
**Resultado**: ERROR_PERMISSION_DENIED
**Descripción**: El script no tiene permisos suficientes para leer archivos del sistema.
**Solución**: Ejecute el script con privilegios elevados usando `sudo`.
**------**

## ERROR_INVALID_INPUT
**Resultado**: ERROR_INVALID_INPUT
**Descripción**: Se proporcionó una entrada no válida al script.
**Solución**: Asegúrese de que todas las entradas al script sean válidas y sigan el formato esperado.
**------**

## ERROR_LANG_FILE_EXECUTED
**Salida**: ERROR_LANG_FILE_EXECUTED
**Descripción**: El archivo `.lang` se ejecutó directamente, lo que provocó errores porque contiene definiciones de variables, no comandos.
**Solución**: No ejecute archivos `.lang` directamente. Deben ser cargados por el script principal mediante el comando `source`.
**------**

## ERROR_LANG_FILE_QUOTES
**Salida**: ERROR_LANG_FILE_QUOTES
**Descripción**: La falta de comillas dobles alrededor de los valores de las variables en los archivos `.lang` puede causar problemas de análisis.
**Solución**: Asegúrese de que todos los valores de las variables en los archivos `.lang` estén entre comillas dobles (`"`).
**------**