
# FFmpeg Fork para Diagnóstico de `invalid data found`

Este repositório é um fork do projeto [FFmpeg](https://ffmpeg.org/), uma solução completa e cross-platform para gravação, conversão e streaming de áudio e vídeo. Este fork foi criado para adicionar funcionalidades específicas de diagnóstico, destinadas a identificar o último segmento de transporte (ts) que foi processado antes de ocorrer um erro de "invalid data found" durante operações de muxing.

## Motivação

Durante a manipulação de streams de mídia, especialmente em contextos de arquivos corrompidos, o FFmpeg pode falhar com o erro "invalid data found when processing input". Isso dificulta a depuração, pois os logs padrão não fornecem informações detalhadas sobre o ponto exato de falha. Este fork visa resolver esse problema, fornecendo logs detalhados do último segmento de transporte tentado antes da falha.

## Modificações Realizadas

As modificações incluem:
- Adição de verificação de ponteiros `NULL` para segmentos de playlist, prevenindo erros de segmentação e melhorando a estabilidade do processo de muxing.
- Integração de logs detalhados que capturam e exibem o URL do último segmento de transporte processado antes de um erro ser encontrado.

Estas alterações ajudam na identificação rápida de arquivos de segmentos problemáticos, facilitando a análise e correção de streams de mídia.

## Uso

Para utilizar esta versão modificada do FFmpeg, você pode clonar este repositório e compilar o código-fonte como faria com o FFmpeg original:

```bash
git clone [URL-do-seu-repositório]
cd [Nome-do-seu-repositório]
./configure
make
sudo make install
```

Use o FFmpeg como normalmente faria. Os logs adicionais serão impressos automaticamente no console durante operações que envolvam muxing de streams.

## Contribuições

Contribuições são bem-vindas! Se você encontrou um bug ou tem uma sugestão de melhoria, por favor, abra uma issue ou submeta um pull request.

## Licença

Este projeto é licenciado sob os mesmos termos do FFmpeg original, conforme encontrado no [repositório oficial do FFmpeg](https://github.com/FFmpeg/FFmpeg/blob/master/LICENSE.md).