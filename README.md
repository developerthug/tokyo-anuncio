# Tokyo Anúncio

Este é um script de anúncios para o jogo GTA V, FivemServer, QBCORE.  utilizando a biblioteca `ox_lib`. Ele permite que os administradores enviem notificações personalizadas para todos os jogadores no servidor.

## Instalação

1. Clone o repositório para a pasta de recursos do seu servidor:
    ```sh
    git clone https://github.com/developerthug/tokyo-anuncio.git
    ```

2. Adicione o recurso ao seu `server.cfg`:
    ```cfg
    ensure tokyo-anuncio
    ```

## Configuração

### fxmanifest.lua

O arquivo `fxmanifest.lua` define as dependências e scripts utilizados pelo recurso. Certifique-se de que as dependências `ox_lib` e `qb-core` estão instaladas no seu servidor.

### client.lua

O arquivo `client.lua` contém a lógica do cliente para exibir as notificações. Ele define paletas de cores, tipos de anúncios e funções para abrir menus de entrada e exibir notificações.

## Uso

### Comandos

- `/anuncio`: Abre o menu de tipos de anúncios para selecionar e enviar uma notificação.

### Eventos

- `announcement:selectType`: Evento para abrir o menu de entrada de anúncio com o título e emoji correto.
- `announcement:submit`: Evento para exibir a notificação com o título e cor correta.

### Mensagens Aleatórias

O script também exibe mensagens aleatórias em intervalos definidos. As mensagens podem ser configuradas na tabela `Messages` no arquivo `client.lua`.

## Contribuição

Sinta-se à vontade para abrir issues e pull requests para melhorias e correções.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
