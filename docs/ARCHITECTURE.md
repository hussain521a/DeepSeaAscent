\# DeepSeaAscent — Technical Architecture



\## 1. Purpose



This document describes the intended code organization and technical boundaries for DeepSeaAscent.



The architecture should support incremental development, multiplayer correctness, reliable testing, and safe synchronization through Rojo.



This document describes the intended direction. Existing files and implemented behavior must be inspected before assuming a system already exists.



\## 2. Technology



\- Roblox platform and Luau.

\- VS Code for source editing.

\- Claude Code for local AI-assisted development.

\- Rojo for synchronizing source files into Roblox Studio.

\- Roblox Studio for visual asset creation and playtesting.

\- GitHub is managed exclusively by the user and is not accessed by Claude Code.



\## 3. Current Rojo Mapping



The existing `default.project.json` maps:



\- `src/server/Main.server.luau` → `ServerScriptService.Main`



This mapping is verified and must be preserved unless an explicitly reviewed architectural change requires an update.



\## 4. Intended Source Layout



Introduce directories and modules incrementally as features require them.



The intended direction is:



\- `src/server/` — server entry point, round management, hazard logic, participant state, and authoritative gameplay decisions.

\- `src/client/` — client entry point and player-facing presentation or input.

\- `src/shared/` — shared configuration, constants, types, and reusable logic.

\- `docs/` — design, architecture, and workflow documentation.



Do not create empty modules simply to

