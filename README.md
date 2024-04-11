# bkp-script-powershell-email
Automatize backups de pastas locais com este script PowerShell. Compacta, remove backups antigos e notifica por e-mail sobre sucesso ou erro. Ideal para manter dados seguros e organizados.

Script de Backup Automatizado em PowerShell
Este é um script em PowerShell desenvolvido para automatizar o processo de backup de pastas locais para um local de destino especificado. O script realiza as seguintes operações:

Sobre:
Cria um arquivo ZIP contendo os arquivos da pasta de origem.
Verifica se o diretório de destino existe e, se não, notifica por e-mail.
Remove backups antigos, mantendo apenas um número máximo especificado de cópias.
Envia um e-mail com o resultado do backup, incluindo informações sobre o tamanho do arquivo ZIP e se houve algum erro durante o processo.


Funcionalidades Principais:
Backup automático de pastas locais.
Compactação de arquivos em formato ZIP.
Notificação por e-mail em caso de erro ou sucesso.
Gerenciamento automático de backups antigos.

Uso:
Configure as variáveis no início do script de acordo com suas necessidades.
Agende a execução do script usando o Agendador de Tarefas do Windows ou outra ferramenta similar.

Pré-requisitos:
PowerShell (versão 5.1 ou superior).
Permissões para escrever em diretórios de origem e destino.
Acesso a um servidor SMTP para envio de e-mails.
Esse script é útil para usuários que desejam automatizar o processo de backup de dados importantes de forma simples e confiável.
