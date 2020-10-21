@cd /d %~dp0
docker-compose down -v
@echo.
@echo Done! Make sure you see no errors above.
@echo Don't forget to also disable Cache Server configuration in Unity preferences.
@echo.
@pause