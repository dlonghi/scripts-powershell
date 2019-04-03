# sql-updates-gerador.ps1
# arquivo.txt - valores separados por TAB -> .Split("`t")
# Exemplo:
# abcd  12345 ghij  01001
# cdef  6789 klmn  000010
#
# Ignora linhas que começam com # OU linhas em branco.
#
# Microsoft Powershell install
# https://github.com/PowerShell/PowerShell/releases/latest

Get-Content .\arquivo.txt | Select-String -NotMatch -Pattern "^\#|^$" | %{ Write-Host "UPDATE db.table SET a,b,c VALUES ('$($_.Line.Split("`t")[0])','$($_.Line.Split("`t")[1])', '$($_.Line.Split("`t")[2])') WHERE c = '$($_.Line.Split("`t")[3])';" }
