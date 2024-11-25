@echo off

:: .env 파일 로드
for /f "tokens=* delims=" %%A in (assets/.env) do set %%A

:: Flutter 명령어 실행
if "%1" == "start" (
    flutter run
) else if "%1" == "android" (
    if "%EMULATOR_NAME%"=="" (
        echo "EMULATOR_NAME is not set. Using default emulator."
        flutter emulators --launch emulator-5554
    ) else (
        echo "Running on Android emulator: %EMULATOR_NAME%"
        flutter emulators --launch %EMULATOR_NAME%
    )
    timeout /t 5 > nul
    flutter run
) else if "%1" == "web" (
    :: 브라우저에서 실행
    if "%BROWSER_NAME%"=="" (
        echo "BROWSER_NAME is not set. Using default browser."
        flutter run -d chrome
    ) else (
        echo "Running on Web browser: %BROWSER_NAME%"
        flutter run -d %BROWSER_NAME%
    )
) else if "%1" == "clean" (
    flutter clean
) else if "%1" == "install" (
    flutter pub get
) else if "%1" == "build-android" (
    flutter build apk --release
) else if "%1" == "build-ios" (
    flutter build ios --release
) else if "%1" == "only-log" (
    adb logcat *:S flutter:V
) else if "%1" == "mobx-build" (
    flutter pub run build_runner build
) else if "%1" == "mobx-watch" (
    flutter pub run build_runner watch
) else if "%1" == "mobx-clean" (
    flutter pub run build_runner clean
) else if "%1" == "test" (
    flutter test
) else (
    echo "Usage: flutter_scripts.bat {start|android|web|clean|install|build-android|build-ios|only-log|mobx-build|mobx-watch|mobx-clean|test}"
)
