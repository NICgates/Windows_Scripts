::Clean up user accounts older than 60 days
forfiles /p "C: \Users" /d -60 /c "cmd /c (IF /i @fname NEQ “nick” IF @file NEQ “bcsadmin” (rmdir /s /q @path))” 
