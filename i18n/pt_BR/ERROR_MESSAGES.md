# Documentação de mensagens de erro

## ERROR_NOT_ROOT
**Saída**: ERROR_NOT_ROOT
**Descrição**: Este script deve ser executado como root.
**Solução**: Execute o script usando o comando `sudo`.
**------**

## ERROR_TRANSLATION_FILE_MISSING
**Saída**: ERROR_TRANSLATION_FILE_MISSING
**Descrição**: O arquivo de tradução para o idioma detectado está ausente.
**Solução**: Certifique-se de que o arquivo `.lang` apropriado (por exemplo, `pt_BR.lang`, `en_US.lang`, `es_ES.lang`) exista no mesmo diretório do script. Caso contrário, use o padrão `en_US.lang`.
**------**

## ERROR_UNSUPPORTED_LANGUAGE
**Saída**: ERROR_UNSUPPORTED_LANGUAGE
**Descrição**: O idioma do sistema detectado não é suportado pelo script.
**Solução**: O script retornará automaticamente para o inglês (`en_US.lang`). Se você quiser suporte para seu idioma, crie um novo arquivo `.lang` e adicione-o à lógica do script.
**------**

## ERROR_OS_RELEASE_MISSING
**Saída**: ERROR_OS_RELEASE_MISSING
**Descrição**: O arquivo `/etc/os-release` está ausente e o script não consegue determinar a distribuição Linux.
**Solução**: Certifique-se de que o arquivo `/etc/os-release` exista ou forneça um método alternativo para detectar a distribuição (por exemplo, `/etc/lsb-release` ou `/etc/$distro-release`).
**------**

## ERROR_DISTRIBUTION_UNKNOWN
**Saída**: ERROR_DISTRIBUTION_UNKNOWN
**Descrição**: O script não conseguiu identificar a distribuição Linux.
**Solução**: Verifique se sua distribuição é suportada pelo script. Caso contrário, considere adicioná-la à lista de distribuições suportadas no script.
**-----**

## ERROR_PERMISSION_DENIED
**Saída**: ERROR_PERMISSION_DENIED
**Descrição**: O script não tem permissões suficientes para ler arquivos do sistema.
**Solução**: Execute o script com privilégios elevados usando `sudo`.
**-----**

## ERROR_INVALID_INPUT
**Saída**: ERROR_INVALID_INPUT
**Descrição**: Uma entrada inválida foi fornecida ao script.
**Solução**: Certifique-se de que todas as entradas para o script sejam válidas e sigam o formato esperado.
**-----**-

## ERROR_LANG_FILE_EXECUTED
**Saída**: ERROR_LANG_FILE_EXECUTED
**Descrição**: O arquivo `.lang` foi executado diretamente, causando erros porque contém definições de variáveis, não comandos.
**Solução**: Não execute arquivos `.lang` diretamente. Eles devem ser carregados pelo script principal usando o comando `source`.
**-----**

## ERROR_LANG_FILE_QUOTES
**Saída**: ERROR_LANG_FILE_QUOTES
**Descrição**: Aspas duplas ausentes em torno de valores de variáveis ​​em arquivos `.lang` podem causar problemas de análise.
**Solução**: Certifique-se de que todos os valores de variáveis ​​em arquivos `.lang` estejam entre aspas duplas (`"`).
**-----**