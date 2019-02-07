cargo build --release
measure-command { .\target\release\rust-ie.exe ..\resource\enable1.txt }
return measure-command { .\target\release\rust-ie.exe ..\resource\enable1.txt }
