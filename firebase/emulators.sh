echo "Starting firebase emulators in: $(pwd)"
firebase emulators:start --inspect-functions --import firebase/emulator --export-on-exit
