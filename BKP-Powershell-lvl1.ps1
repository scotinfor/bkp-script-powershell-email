# Definindo as variáveis
#subistituir as informações abaixo conforme sua necessidade!
$sourceFolder = "C:\Users\Fscot\Documents\certificados"
$destinationFolder = "C:\Users\Fscot\Documents\BKP_powershell"
$backupFileName = "Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').zip"
$backupFilePath = Join-Path -Path $destinationFolder -ChildPath $backupFileName
$zipPassword = "bkp2012"
$maxBackupCount = 7
$emailFrom = "colocar seu e-mail de envio"
$emailTo = "e-mail que vai receber as mensagens"
$smtpServer = "smtps.bol.com.br"
$smtpPort = 587
$smtpPassword = ConvertTo-SecureString "Senha do email" -AsPlainText -Force
$smtpCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($emailFrom, $smtpPassword)

try {
    # Criando o arquivo zip
    Compress-Archive -Path $sourceFolder -DestinationPath $backupFilePath -CompressionLevel Optimal -ErrorAction Stop
    
    # Obter informações sobre o tamanho do arquivo zip
    $zipFileSize = (Get-Item $backupFilePath).Length
    $emailSubject = "Backup realizado com sucesso"
    $emailBody = "O backup foi concluido com sucesso. Tamanho do arquivo: $zipFileSize bytes."
} catch {
    # Capturar e-mail de erro caso o backup falhe
    $emailSubject = "Erro ao realizar backup"
    $emailBody = "Ocorreu um erro ao realizar o backup:`n$_"
}

# Removendo backups antigos se houver mais de $maxBackupCount
$backups = Get-ChildItem -Path $destinationFolder -Filter "Backup_*.zip" | Sort-Object CreationTime -Descending
if ($backups.Count -gt $maxBackupCount) {
    $backupsToDelete = $backups | Select-Object -Skip $maxBackupCount
    foreach ($backupToDelete in $backupsToDelete) {
        Remove-Item -Path $backupToDelete.FullName -Force
    }
}

# Enviando e-mail com o resultado
Send-MailMessage -From $emailFrom -To $emailTo -Subject $emailSubject -Body $emailBody -SmtpServer $smtpServer -Port $smtpPort -Credential $smtpCredential -UseSsl
