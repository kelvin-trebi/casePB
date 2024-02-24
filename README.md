## Starting

### Instalação

Instale o Robot usando as etapas abaixo.

1. Instalar o Python 3
```
https://www.python.org/downloads/
```

2. Instalar o Robot Framework
```
pip3 install robotframework
```

3. Instalar as Libs para funcionamento dos cenários
```
pip3 install robotframework-seleniumlibrary
pip3 install robotframework-jsonlibrary
pip3 install robotframework-requests
pip3 install robotframework-pythonlibcore
```

3. Instalar o driver do Google Chrome e adicionar nas variáveis do sistema.
```
https://chromedriver.chromium.org/downloads
```

### Após a configuração anterior:

1. Clonar esse repositório.
2. Executar testes WEB através do comando (Lembre-se de estar no diretorio webTesting\tests):
```
robot -d ./logs .\test_horuku.robot
```
3. Executar testes API através do comando (Lembre-se de estar no diretorio apiTesting\tests):
```
robot -d ./logs .\validation_https.robot
``` 
### Arquivos por diretórios (Respostas case 01)

|               Diretório | Arquivos na pasta                                                               |
| ----------------------: | ----------------------------------------------------------------------------- |
|                `casesPB` | **config.robot** arquivo que contem os as respostas dos cenários propostos.  |

### Arquivos por diretórios (WEB)

|               Diretório | Arquivos na pasta                                                               |
| ----------------------: | ----------------------------------------------------------------------------- |
|                `config` | **config.robot** arquivo de configuração.  |
|            `components` | **components.robot** todos os componentes mapeados utilizados no teste.                            |
|                 `tests` | Arquivo **test_horuku.robot** contém todos os casos de teste.   |
|                 `pages` | Arquivo **horuku.pages.robot** contém todos Keywords utilizados (Page Object Pattern).|
|         `pages/commons` | **hooks.pages.commons.robot** contém os setups para inicio e fim utilizados no teste.             |

### Arquivos por diretórios (API)

|               Diretório | Arquivos na pasta                                                               |
| ----------------------: | ----------------------------------------------------------------------------- |
|             `resources` | **base.resource** e **users.resource** todos as libs utilizadas, keywords e bdd's |
|             `resources` | **constants.py** todos as constantes utilizadas, (url,payload,json)                            |
|                 `tests` | Arquivo **validation_https.robot** contém todos os casos de teste.   |

### Libs utilizadas:
SeleniumLibrary
JSONLibrary
Collections
RequestsLibrary
