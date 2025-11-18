# L_DistArch – Client-Server Library for PcVue 16

**L_DistArch** is a library designed to extend **PcVue 16** functionality in **redundant Client-Server architectures**.  
It provides a complete set of tools for **centralized management of multiple stations**, **automatic synchronization** of users and configurations, and **real-time monitoring** of the SCADA network status.

![Dashboard Client-Server](./DOCS/Image/Screen_Mimic.png)

## ⚙️ Main Features

- **Client-Server and Redundancy Management**  
  Automatic coordination between primary and secondary servers, with safe failover switching.

- **User Synchronization**  
  Centralized update of the `user.dat`.

- **Station Monitoring**  
  Continuous update of `LAN.<Station>.*` variables showing status, users, versions, and running modes.

- **Alarm and Buzzer Control**  
  Centralized sound management and alarm override using `Buzzer()`, `SetBuzzer()`, and `ResetBuzzer()` routines.

- **Version and Restart Management**  
  Version comparison between project and library, and controlled PcVue runtime restart via `Restart_PcVue()`.

- **Traceability and Logging**  
  Every event (login, logout, updates, restarts) is logged through `TRACE("LOG", ...)` for full diagnostic visibility.

## 🧩 Internal Architecture

L_DistArch is built around a main SCADA Basic program (`L_DistArch\P\GENERAL.SCB`) that manages:
- **Cyclic routines** for synchronization and alarm control (`ControlloUpgrade`, `Buzzer`, `Main2`),
- **Updates** for user, version, and connection status,
- **Auxiliary functions** for controlled restart, logging, and screenshot capture (via tools in `/TP/`).

External utilities included:
- `svrestart.exe` – controlled restart of the PcVue runtime  
- `wav_player.exe` – centralized sound control  
- `nircmd.exe` – automatic screen capture  
- `user_copy.bat`, `user_load.bat` – user file synchronization  

## 📦 Requirements

- **PcVue 16**  
- **Redundant architecture** with at least two servers and multiple clients configured  
- **Shared Central Folder** accessible in read/write mode from all stations  
- **Project structure** as follows: C:\Arc Informatique\PcVue 16\Usr\MyProject


## 🚀 Quick Installation Guide

1. Copy the **L_DistArch** folder into the project’s `LIB` directory.  
2. Copy the **TP** folder into the project root.  
3. Edit `user_copy.bat` and `user_load.bat` to match your Central Folder network paths.  
4. In **Application Architect**, create instances from the provided templates and adapt the mimic or global parameters as needed.  
5. In **SCADA Basic**, add a preload script (`PRELOAD`) containing:

```vba
Sub Main()
    PROGRAM("PRELOAD", "L_DistArch/GENERAL.SCB", "")
    PROGRAM("EXECUTE", "L_DistArch/GENERAL.SCB", "")
End Sub 
```
6. Generate and deploy the project across all stations.

## 📘 Full Technical Documentation
For full installation instructions, detailed configuration steps, and complete SCADA Basic code, refer to the comprehensive manual:
➡️ [**L_DistArch Technical Guide (PDF)**](DOCS)
