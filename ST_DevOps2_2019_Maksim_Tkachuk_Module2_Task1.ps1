### 1. Получите справку о командлете справки
get-help get-help

### 2. Пункт 1, но детальную справку, затем только примеры
# детальная справка
get-help get-help -Detailed
# только примеры
get-help get-help -Examples

### 3. Получите справку о новых возможностях в PowerShell 4.0 (или выше)
get-help about_Windows_PowerShell_5.0

### 4. Получите все командлеты установки значений
get-command -CommandType cmdlet | Where-Object Name -like Set-*

### 5. Получить список команд работы с файлами
get-command -CommandType cmdlet | Where-Object Name -like *File*

### 6. Получить список команд работы с объектами
get-command -CommandType cmdlet | Where-Object Name -like *Object*

### 7. Получите список всех псевдонимов
get-alias

### 8. Создайте свой псевдоним для любого командлета
# [создадим Alias hmaks для командлета history]
set-alias hmaks history

### 9. Просмотреть список методов и свойств объекта типа процесс
get-process | Get-Member -Force

### 10. Просмотреть список методов и свойств объекта типа строка
# [Создадим переменную в которую запишем слово. Проверим методы и свойства объекта с помощью Get-Member]
[string]$string = "Maksim Tkachuk"
$string | Get-Member -force

### 11. Получить список запущенных процессов, данные об определённом процессе
# запущенные процессы
get-process
# данные о процессе explorer.exe
get-process -Name explorer

### 12. Получить список всех сервисов, данные об определённом сервисе
# список сервисов
get-service
write-output ("______________________")
# данные о сервисе Themes
get-service Themes

### 13. Получить список обновлений системы
get-hotfix

### 14. Узнайте, какой язык установлен для UI Windows
get-uiCulture

### 15. Получите текущее время и дату
get-date

### 16. Сгенерируйте случайное число (любым способом)
get-random

### 17. Выведите дату и время, когда был запущен процесс «explorer». Получите какой это день недели.
(Get-Process -Name explorer).StartTime
# какой это день недели
(Get-Process -Name explorer).StartTime.DayOfWeek

### 18. Откройте любой документ в MS Word (не важно как) и закройте его с помощью PowerShell.
# Создадим Новый файл .docx Word ===>
# Создаем новый объект WORD 
$word = New-Object -ComObject Word.Application
# Видимый режим вставки, по умолчанию FALSE
# $word.Visible = $True
# Создаем новый документ
$doc = $word.Documents.Add()
# СохранитьКак указываем путь куда и имя файла
$doc.SaveAs([ref]"C:\Tmp_PowerShell_Word.docx")
# Закрываем документ
$doc.Close()
# Закрываем приложение
$word.Quit()

# С большего задание выполнено, но мы можем открыть созданный файл и закрыть его по Id процесса 
C:\Tmp_PowerShell_Word.docx
$a = get-process *word | Select-Object Id
# Для наглядности оставил подтверждение закрытия Word
stop-process -id $a.id -confirm

# удаляем созданный ранее .docx файл Word
Remove-Item -Path "C:\Tmp_PowerShell_Word.docx"


### 19. Подсчитать значение выражения S= . N – изменяемый параметр. 
### Каждый шаг выводить в виде строки. (Пример: На шаге 2 сумма S равна 9)
[int]$n = read-host "input n: " # изменяемый параметр
[int]$a = 0                     # стартовое значение
for($i = 1; $i -le $n; $i++)    # цикл расчета
{
   $a += $i * 3
   write-output("step: $a")     # вывод значения каждый шаг
}
write-output("sum = $a")        # сумма - окончательный ответ

### 20. Напишите функцию для предыдущего задания. Запустите её на выполнение.
function sum ([int]$n)
{
    [int]$a = 0
    for($i = 1; $i -le $n; $i++)
    {
       $a += $i * 3
       write-output("step: $a")
    }
    write-output("sum: $a")
}

sum (read-host "input n: ")