# PanelMap — sincronização compartilhada

A interface original foi preservada. A versão desta pasta mantém o armazenamento local como fallback e adiciona sincronização em nuvem via Supabase.

## Por que não salvar diretamente no GitHub?
O GitHub Pages hospeda arquivos estáticos. Um navegador não deve gravar diretamente no repositório sem autenticação/token, e colocar um token de escrita no HTML exporia o repositório. Por isso, o GitHub continua hospedando o aplicativo e o Supabase guarda os dados compartilhados.

## Configuração única
1. Crie um projeto no Supabase.
2. Em **SQL Editor**, execute `panelmap_supabase.sql`.
3. Em **Authentication > Providers**, habilite **Anonymous Sign-Ins**.
4. Em **Project Settings > API**, copie a URL do projeto e a **Publishable key** (`sb_publishable_...`). Não use a `service_role`/secret key no navegador.
5. Abra `index.html` e procure `CLOUD_CONFIG`. Preencha `url` e `key`. O `workspace` pode permanecer `panelmap-principal`.
6. Publique os arquivos no mesmo repositório/branch usado pelo GitHub Pages.

Depois disso:
- ao abrir em qualquer celular, computador ou navegador, o aplicativo baixa os componentes e o histórico compartilhados;
- cada edição de componente e cada intervenção é gravada na nuvem imediatamente;
- existe uma sincronização periódica para atualizar uma tela que permaneça aberta;
- se a internet/Supabase estiver indisponível, o aplicativo continua usando `localStorage` e volta a sincronizar quando houver conexão e uma nova alteração.

## Observação de segurança
A chave Publishable/anon é apropriada para código de navegador quando protegida por RLS. Nunca coloque a `service_role` ou uma secret key no HTML.

## Arquivos
- `index.html` — aplicativo completo, mantendo a interface existente.
- `panelmap_supabase.sql` — tabela e políticas RLS.
