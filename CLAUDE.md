\# DeepSeaAscent — Claude Code Instructions



\## 1. Project Overview



DeepSeaAscent is a multiplayer Roblox game centered on a high-tension vertical escape from a catastrophically flooding deep-sea facility.



Players begin in a secure area of an underwater research station or submarine docking facility, deep within an ocean trench. When a round begins, a structural failure triggers a rapidly rising flood. Players must climb through service shafts, grated catwalks, ladder wells, damaged platforms, and broken scaffolding to reach an upper airlock or escape pod.



The central challenge is to ascend quickly, navigate obstacles, avoid falling, and stay ahead of the rising water and pressure hazard.



The game should support multiplayer rounds, competitive escape times, and replayable vertical traversal.



The initial objective is a functional, testable proof of concept. Prioritize reliable core gameplay and a complete playable round loop before investing heavily in visual polish, progression, monetization, or advanced content.



\## 2. Authoritative Game Concept



The flooding deep-sea facility is the canonical game concept.



Do not revert to the original concept of climbing through open ocean while an unexplained water level rises. The hazard is physically intuitive because the facility is flooding from its lower levels.



\### Setting



\- A deep-sea research station or submarine docking facility located in an ocean trench.

\- Players begin in a secure, dry lobby or staging room.

\- A catastrophic structural failure initiates the round.

\- The escape route extends vertically through industrial underwater infrastructure.

\- The destination is a surface-connected airlock, evacuation platform, or escape pod.



The specific architectural layout and visual identity may evolve, but the flooding-facility premise and vertical escape loop must remain intact.



\### Core Gameplay Loop



1\. \*\*Lobby:\*\* Players gather in a secure room while waiting for the next round.

2\. \*\*Countdown:\*\* A countdown prepares players for the upcoming escape.

3\. \*\*Catastrophic failure:\*\* The facility begins flooding and the round becomes active.

4\. \*\*Vertical escape:\*\* Players climb, jump, traverse platforms, and navigate damaged industrial structures while the hazard rises.

5\. \*\*Elimination:\*\* Players caught by the flood or pressure hazard, or otherwise failing the escape conditions, are eliminated from the active round.

6\. \*\*Successful escape:\*\* Players who reach the designated upper escape zone before being eliminated are recorded as successful.

7\. \*\*Round completion:\*\* The game resolves remaining players, displays results, and returns everyone to the lobby for another round.



Implement this loop incrementally. A complete but simple round is more valuable than many disconnected mechanics.



\### Hazard Rules



\- The rising flood or pressure hazard is controlled by the server.

\- Its vertical position progresses upward over time during an active round.

\- The hazard must have a clear, consistent relationship to the facility's vertical layout.

\- Players who fall behind and become caught by the hazard are eliminated.

\- Hazard speed, starting position, activation delay, and other tuning parameters should be configurable.

\- The server determines whether a player has been caught by the hazard.

\- Hazard movement, elimination checks, and round-state transitions must behave consistently for all players.

\- The hazard should be visually and audibly understandable to players.



Do not treat the hazard as an unexplained water level in open ocean. It represents flooding or a dangerous pressure surge moving through the facility.



\### Initial Scope



The initial playable prototype should eventually include:



\- A secure lobby and countdown.

\- Round initialization and player preparation.

\- A traversable vertical escape course.

\- A rising, server-authoritative hazard.

\- Reliable elimination and respawn or spectator behavior.

\- An upper escape zone that records successful escapes.

\- Round completion and reset.

\- Basic UI for countdowns, round state, hazard status, and results.

\- Multiplayer support for simultaneous players.

\- Recording escape times and identifying the fastest successful escape.

\- Basic handling of players joining or leaving during a round.



Persistence, sophisticated procedural generation, advanced progression, and other secondary systems should be deferred until the core loop is proven.



\## 3. Technology and Project Structure



\- Platform: Roblox.

\- Programming language: Luau.

\- Code editor and AI development environment: VS Code and Claude Code.

\- Code synchronization into Roblox Studio: Rojo.

\- Gameplay testing: Roblox Studio playtests.

\- Visual asset creation and Studio-managed scene content: Roblox Studio, with Team Create when appropriate.

\- Rojo configuration: `default.project.json`.

\- Current server entry point: `src/server/Main.server.luau`.



The existing Rojo configuration maps `src/server/Main.server.luau` to `ServerScriptService.Main`.



The current baseline script prints a startup message and logs when a player joins. Rojo live synchronization and a Studio playtest have already been verified.



Preserve this working foundation.



Inspect the existing project structure and configuration before proposing or implementing changes. Do not assume that planned directories or modules already exist.



\## 4. Strict GitHub and Source Control Boundaries



\*\*Claude Code must not interact with GitHub. The user owns all GitHub operations and approvals.\*\*



Claude Code is used for local planning, coding, file editing, local analysis, and preparing work for user review.



Claude Code must follow these rules:



1\. Do not connect to GitHub or authenticate to any GitHub account.

2\. Do not use GitHub integrations, GitHub MCP servers, GitHub APIs, or GitHub CLI commands.

3\. Do not push, pull, fetch, clone, merge, publish, create pull requests, or modify remote repositories.

4\. Do not change Git remotes, credentials, authentication settings, or repository permissions.

5\. Do not assume the local development folder is connected to the user's personal GitHub repository.

6\. Do not commit changes automatically. Local commits also require explicit user approval.

7\. Do not switch branches, reset branches, rewrite history, or discard existing work without explicit user approval.

8\. Do not overwrite user changes or remove untracked files.

9\. Do not attempt to transfer files between computers or synchronize folders without explicit user direction.

10\. Never claim that work has been pushed, pulled, committed, merged, or backed up unless the user has performed the relevant operation and confirmed its result.



The user prefers the VS Code Source Control interface over the Git command line.



When source control instructions are needed, explain the relevant VS Code interface steps. Do not make command-line Git the default workflow.



\### Required Handoff Process



When a feature or task is ready for review:



1\. Finish the requested local implementation.

2\. Perform available local validation, such as syntax checks, static inspection, configuration checks, and automated tests when available.

3\. Inspect the changes for accidental modifications, incomplete code, debug leftovers, and unrelated files.

4\. Summarize the implementation and list the files created, modified, or deleted.

5\. Explain which checks passed and which remain unverified.

6\. Provide specific Roblox Studio playtesting instructions when applicable.

7\. Identify any known limitations or outstanding issues.

8\. Stop and ask the user to review the work.



The user then decides whether to accept the changes and manually handles the appropriate file transfer, repository updates, commits, and GitHub operations.



Never proceed to another substantial feature until the user has reviewed the current handoff and authorized the next step.



\## 5. Development Branches and Stable Checkpoints



The user's intended workflow uses isolated feature branches to protect working code.



\- Keep `main` stable and potentially playable.

\- Develop each feature or setup task in an isolated working branch or isolated working copy, as appropriate to the user's environment.

\- Do not assume Claude Code has access to the same branch or repository checkout used by VS Code on another computer.

\- Do not assume a local branch created on one device exists on another device.

\- The user decides how work is transferred to the repository and which branch receives it.

\- Keep feature changes focused and logically separated.

\- Review changes before handing them off.

\- Test gameplay changes in Roblox Studio before they are approved for integration.

\- Failed tests should result in focused fixes to the same feature's working changes.

\- Never bypass the review process to integrate unfinished work.



When the user has not specified how an isolated working copy should be organized, ask before performing operations that could affect existing files or repository history.



\## 6. Architecture Guidelines



Use clear separation of responsibilities.



\### Server



The server owns authoritative gameplay state, including:



\- Round lifecycle and transitions.

\- Countdown and round timing.

\- Hazard position and progression.

\- Elimination decisions.

\- Escape-zone validation and successful escape records.

\- Competitive results and fastest-time calculations.

\- Validation of player actions that affect game outcomes.



\### Client



Client-side code handles appropriate presentation and interaction, including:



\- User interface.

\- Local input.

\- Visual and audio feedback.

\- Non-authoritative presentation of the hazard and round state.



\### Shared Code



Shared modules may contain:



\- Configuration values.

\- Constants and shared definitions.

\- Reusable utility functions.

\- Data structures and other logic appropriate for shared use.



\### Networking



\- Use appropriate Roblox networking mechanisms, such as RemoteEvents, when client-server communication is needed.

\- Validate all consequential client requests on the server.

\- Never trust a client to decide that a player has escaped, has been eliminated, or has achieved a competitive result.

\- Keep replicated information limited to what clients need.

\- Handle latency and player lifecycle changes without corrupting round state.



\### Maintainability



\- Prefer small, cohesive modules with clear responsibilities.

\- Avoid giant scripts that mix round management, hazard movement, player state, and UI.

\- Avoid unnecessary frameworks, abstractions, and dependencies.

\- Use clear naming and appropriate Luau types where useful.

\- Avoid unbounded instance creation, unnecessary per-frame work, and avoidable server performance costs.

\- Make important gameplay values configurable rather than scattering unexplained numbers throughout the code.



Do not build a complicated architecture prematurely. Introduce modules when they make the current implementation easier to understand, test, or extend.



\## 7. Rojo and Roblox Studio Safety



Rojo synchronizes repository-managed source files into Roblox Studio according to the project configuration.



\- Keep `default.project.json` consistent with the actual source tree.

\- Do not rename or relocate mapped files without checking and updating their mappings.

\- Treat Rojo-managed scripts as repository-owned.

\- Do not assume Studio-created terrain, models, lighting, or other assets are automatically stored in the repository.

\- Do not assume Studio edits to mapped scripts are automatically preserved in local source files.

\- Before expanding Rojo mappings or changing synchronization behavior, explain the consequences.

\- Preserve the verified live-sync workflow.

\- Do not introduce broad mappings that could unintentionally overwrite or remove Studio-managed content.



Before making structural changes to the Rojo configuration, identify which Roblox instances are managed by source code and which remain managed directly in Studio.



\## 8. Testing and Verification Requirements



Testing is part of implementation, not an optional final step.



For each meaningful feature:



1\. Identify its expected behavior and acceptance criteria before implementation.

2\. Implement the smallest useful version.

3\. Inspect the code and run available local checks.

4\. Identify dependencies on Studio assets, services, configuration, or other features.

5\. Provide exact Studio playtesting instructions.

6\. Verify behavior in the appropriate Studio test mode when that environment is available.

7\. Report observed results and unresolved issues.

8\. Prepare the work for user review.



For multiplayer features, distinguish between a single-player test and a multiplayer server/client test. Do not claim multiplayer correctness based only on a single-player playtest.



If Claude Code cannot directly operate Roblox Studio, it must not pretend that a Studio test was performed. Instead, provide a reproducible test procedure and wait for the user's results before declaring the feature verified.



Never report a feature as complete merely because the code was generated without errors.



\## 9. Design and Implementation Priorities



Use the following order unless the user explicitly changes the priorities:



1\. Reliable project and development workflow.

2\. Player movement and a basic traversable test course.

3\. Round-state management and countdown.

4\. A server-controlled rising hazard.

5\. Elimination and escape detection.

6\. Round completion and reset.

7\. Basic player-facing UI and feedback.

8\. Multiplayer edge cases and competitive escape-time tracking.

9\. Visual polish, sound, environmental storytelling, and additional gameplay features.



The order may be adjusted when dependencies make another sequence more practical, but explain significant changes before proceeding.



Do not attempt to implement the entire game in one large generation. Each milestone should leave the project in an understandable state with clear next steps.



\## 10. Documentation



Keep the following documents aligned with the actual project:



\- `CLAUDE.md`: Persistent development rules, constraints, and workflow.

\- `docs/GAME\_DESIGN.md`: The authoritative game concept, player experience, round loop, hazard rules, and acceptance criteria.

\- `docs/ARCHITECTURE.md`: Current code organization, system responsibilities, networking, and Rojo mappings.

\- `docs/DEVELOPMENT\_WORKFLOW.md`: Local development, user review, testing, manual file handoffs, and user-controlled source control operations.



Do not treat proposed future systems as implemented functionality. Clearly distinguish current behavior from planned behavior.



Update documentation when a meaningful, approved design or architectural decision changes.



Avoid duplicating the full contents of every document in `CLAUDE.md`; reference the relevant document when detailed specifications belong there.



\## 11. Communication and Decision-Making



Before substantial implementation, explain:



\- What is being built.

\- Why it is the next appropriate step.

\- Which files are expected to change.

\- What dependencies or architectural decisions are involved.

\- How success will be evaluated.



Ask for clarification when a decision materially affects the game concept, architecture, data persistence, networking, or existing work.



For small and reversible details, choose a reasonable implementation and explain it in the handoff rather than interrupting progress unnecessarily.



After implementation, provide:



\- A concise summary of changes.

\- A list of files created, modified, or deleted.

\- Available validation results.

\- What still requires Studio testing.

\- Any known limitations.

\- Clear next steps for the user.



Once the task is ready for review, stop. Do not push, pull, commit, merge, publish, or begin another substantial task without the user's authorization.



\## 12. Definition of Done



A task is ready for user review when:



\- The requested local changes have been implemented.

\- The changes are focused and understandable.

\- Available local validation has been performed.

\- Unrelated work has been preserved.

\- Documentation has been updated when necessary.

\- Remaining unverified behavior is explicitly identified.

\- Relevant Studio tests are described or have been performed and reported accurately.

\- The user has enough information to review the implementation and decide whether to accept it.



User review and approval are required before the work is considered accepted. GitHub operations always remain under the user's control.

