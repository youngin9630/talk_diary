#!/bin/bash

# .env 파일 로드 (있을 경우만 로드)
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

# Flutter 명령어 실행
case "$1" in
  start)
    flutter run
    ;;

  android)
    # 에뮬레이터 이름 확인 및 실행
    if [ -z "$EMULATOR_NAME" ]; then
      echo "EMULATOR_NAME is not set. Using default emulator."
      flutter emulators --launch emulator-5554
    else
      echo "Running on Android emulator: $EMULATOR_NAME"
      flutter emulators --launch "$EMULATOR_NAME"
    fi
    sleep 5 # 에뮬레이터 실행 대기
    flutter run
    ;;

  web)
    # 브라우저 이름 확인 및 실행
    if [ -z "$BROWSER_NAME" ]; then
      echo "BROWSER_NAME is not set. Using default browser."
      flutter run -d chrome
    else
      echo "Running on Web browser: $BROWSER_NAME"
      flutter run -d "$BROWSER_NAME"
    fi
    ;;

  clean)
    flutter clean
    ;;

  install)
    flutter pub get
    ;;

  build-android)
    flutter build apk --release
    ;;

  build-ios)
    flutter build ios --release
    ;;

  only-log)
    adb logcat "*:S" "flutter:V"
    ;;

  mobx-build)
    flutter pub run build_runner build
    ;;

  mobx-watch)
    flutter pub run build_runner watch
    ;;

  mobx-clean)
    flutter pub run build_runner clean
    ;;

  test)
    flutter test
    ;;

  *)
    echo "Usage: $0 {start|android|web|clean|install|build-android|build-ios|only-log|mobx-build|mobx-watch|mobx-clean|test}"
    ;;
esac
