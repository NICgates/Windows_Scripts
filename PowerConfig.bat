:: Fix settings missing from advanced settings in power options.
:: --------------------------------------------------------------
powercfg -duplicatescheme a1841308-3541-4fab-bc81-f71556f20b4a
powercfg -duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

:: --------------------------------------------------------------
:: CsEnabled value data to 0
REG DELETE HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v CsEnabled
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power /v CsEnabled /d 0
