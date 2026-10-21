\# DeepSeaAscent — Game Design Document



\## 1. Game Overview



\*\*Working title:\*\* DeepSeaAscent



\*\*Platform:\*\* Roblox



\*\*Genre:\*\* Multiplayer vertical escape / survival / obstacle course



\*\*Core fantasy:\*\* Escape a catastrophically flooding deep-sea facility by climbing through a damaged industrial structure while a lethal wall of water rises beneath you.



DeepSeaAscent is a competitive, round-based multiplayer game. Players start in a secure staging room inside an abyssal research facility. When a round begins, a structural failure causes the lower levels to flood. Players must climb upward through industrial infrastructure, navigate obstacles, and reach an upper escape point before the rising hazard catches them.



The central tension comes from balancing speed, movement precision, route selection, and the risk of falling behind.



The initial objective is a small but fully playable proof of concept. Features should be added incrementally and validated before expanding scope.



\## 2. Design Pillars



\### 2.1 Constant Upward Pressure



The player should always feel motivated to keep climbing. The rising hazard creates urgency without requiring arbitrary countdowns alone.



\### 2.2 Readable Vertical Traversal



Players should be able to understand the route upward. Ladders, catwalks, service shafts, platforms, scaffolding, and broken sections should create interesting traversal decisions.



\### 2.3 Fair, Understandable Failure



Players should understand why they were eliminated. Hazard movement, collision behavior, checkpoints if introduced, and escape conditions must be consistent and predictable.



\### 2.4 Competitive Replayability



Successful escapes should be recorded. Escape times can encourage players to improve their routes and compete with friends.



\### 2.5 Multiplayer First



The experience is designed for multiple players participating in the same round. Core gameplay decisions must work correctly on a server with multiple clients, not merely in a single-player simulation.



\## 3. Setting and Environment



\### 3.1 Location



The game takes place in a deep-sea research station or submarine docking facility located in an ocean trench.



The facility contains industrial spaces such as:



\- Secure staging rooms.

\- Maintenance corridors.

\- Vertical service shafts.

\- Grated catwalks and narrow platforms.

\- Ladder wells and scaffolding.

\- Damaged structural sections.

\- An upper escape airlock, evacuation platform, or escape pod.



The initial prototype may use simple graybox geometry. Art quality is secondary to proving that the vertical traversal and rising hazard are enjoyable.



\### 3.2 Catastrophic Failure



At the start of a round, a structural failure or containment breach triggers the escape.



The event can eventually include alarms, warning lights, shaking structures, water effects, and sound cues. These are presentation features and must not delay implementation of the core gameplay.



\### 3.3 The Hazard



A rising flood or dangerous pressure surge advances upward through the facility from its lower levels.



The hazard represents flooding moving through the structure, not a water level rising through open ocean.



The hazard must have a clear visual representation and a well-defined lethal boundary. Players who fall behind and become caught by it are eliminated.



The implementation should use a consistent server-controlled reference height or equivalent authoritative representation for determining whether players are caught.



\## 4. Round Lifecycle



The game uses a server-authoritative round state machine.



\### State 1: Lobby



\- Players gather in a secure, dry staging room.

\- The game waits until the minimum required player count is reached.

\- The UI communicates the current lobby state.

\- Players cannot accidentally trigger an active round through client-side actions.



The initial minimum player count should be configurable. During early development, Studio testing must remain possible with a single player.



\### State 2: Countdown



\- The server begins a configurable countdown.

\- Players receive clear countdown feedback.

\- The game prepares the participating players and initializes the round state.

\- If the player requirements are no longer satisfied, the server handles cancellation or reset consistently.



\### State 3: Round Start



\- The server initializes the active round.

\- Participating players are placed at the designated starting area.

\- The catastrophic failure sequence begins.

\- The rising hazard activates according to the configured start delay.

\- The round timer begins.



The exact timing between the failure event, player release, and hazard activation must be configurable.



\### State 4: Active Escape



\- Players climb through the vertical course.

\- The hazard progresses upward under server control.

\- The server checks whether players have been caught.

\- Players who reach the valid escape zone are recorded as escaped.

\- Eliminated players cannot continue affecting the active round.

\- The round continues while players remain eligible to escape.



\### State 5: Round Resolution



The round ends when all participating players have either escaped or been eliminated, or when a configured round timeout is reached.



\- Successful escapes are recorded.

\- Remaining players are resolved according to the timeout rules.

\- Results are displayed.

\- The server cleans up round-specific state.



\### State 6: Reset



\- Players return to the lobby.

\- The previous hazard and round-specific objects are reset or removed.

\- Temporary player state is cleared.

\- The next countdown begins when the lobby requirements are satisfied.



Round transitions must be safe to repeat without accumulating duplicate connections, leftover objects, or conflicting timers.



\## 5. Core Hazard Mechanics



\### 5.1 Authority



The server determines the hazard's authoritative position, activation, progression, and elimination decisions.



Clients may render visual effects locally, but client-side state must not determine whether a player survives.



\### 5.2 Configuration



At minimum, the following values should be configurable:



\- Initial hazard height.

\- Hazard activation delay.

\- Hazard rise speed.

\- Optional acceleration or speed phases.

\- Round timeout.

\- Hazard collision or elimination tolerance.



The initial implementation should use a constant rise speed unless testing demonstrates that acceleration is needed.



\### 5.3 Elimination



A player is eliminated when the authoritative hazard catches them according to the agreed hazard rules.



The implementation must account for character respawns, missing character parts, and players leaving during a round.



A player's escape status and elimination status must be mutually exclusive. Once a player has escaped or been eliminated, repeated checks must not award or eliminate them again.



\### 5.4 Fairness and Feedback



\- Hazard progression must be consistent for all players.

\- The hazard must not depend on a client's local timer.

\- The player should receive clear feedback when caught.

\- The visual boundary should closely match the actual elimination boundary.

\- The hazard must not eliminate players merely because a visual effect extends beyond its actual lethal boundary.



\## 6. Movement and Traversal



The first prototype should use Roblox's standard character controller unless a specific gameplay requirement justifies custom movement.



The initial course should test:



\- Walking and jumping between platforms.

\- Climbing or traversing vertical structures.

\- Narrow platforms and ladder transitions.

\- Recovering from small mistakes.

\- Falling and returning to the hazard's danger zone.



Avoid introducing complex custom physics before the basic course works.



The initial map should be deliberately small. Build enough vertical distance and obstacle variety to evaluate the hazard's speed, traversal difficulty, and round pacing.



\## 7. Escape and Elimination Rules



\### Successful Escape



A player successfully escapes when the server confirms that their character has reached the designated upper escape zone while the player is still eligible to escape.



The server records the successful escape once and prevents further elimination checks from changing that result.



\### Elimination



A player can be eliminated by:



\- Being caught by the rising hazard.

\- Falling or dying in a way that makes continued participation impossible.

\- Reaching the round timeout without escaping, when the timeout rules apply.



The exact handling of falls, deaths, respawns, and spectators should be consistent and configurable where appropriate.



\### Post-Elimination Behavior



The initial prototype may return eliminated players to the lobby or place them in a simple spectator state. Choose the simplest reliable option for the first playable version and document the decision.



Eliminated players must not accidentally re-enter the active round through an ordinary respawn.



\### Round Completion



The server tracks each participant's final outcome and resolves the round when the completion conditions are met.



A player escaping must not cause the entire round to end while other players are still actively escaping.



\## 8. Competitive Records



The initial competitive metric is successful escape time.



\- Record the time between the defined round start and the player's successful escape.

\- Use server-measured time.

\- Store each player's result once per round.

\- Display successful escape times in the round results.

\- Identify the fastest successful escape among eligible participants.



Persistent personal bests and global leaderboards are later features. Do not introduce persistent data storage until round state and escape-time recording work reliably.



\## 9. User Interface



The initial UI should communicate only essential gameplay information:



\- Current game state.

\- Lobby countdown.

\- Round start or failure notification.

\- Rising hazard status or warning.

\- Elimination feedback.

\- Successful escape feedback.

\- Round results and escape times.



The interface should be readable and consistent with an industrial deep-sea facility.



Avoid building a large menu system, inventory, shop, progression interface, or elaborate animations during the first prototype.



\## 10. Technical Requirements



\- The server owns round state and authoritative gameplay outcomes.

\- The client owns appropriate input and presentation.

\- Shared modules hold configuration and reusable definitions when justified.

\- Client requests must be validated by the server.

\- Player joining, leaving, dying, and respawning must not corrupt round state.

\- Timers and event connections must be cleaned up or reused safely.

\- The game should work with multiple simultaneous players.

\- The codebase must remain compatible with the established Rojo project mapping.

\- Studio-managed assets must not be overwritten unintentionally by Rojo synchronization.



\## 11. First Playable Milestone



The first playable milestone is a complete, minimal vertical escape round.



It should include:



1\. A basic lobby or starting area.

2\. A short, traversable vertical obstacle course.

3\. A countdown and round start.

4\. A rising, server-controlled lethal hazard.

5\. Server-side hazard elimination.

6\. A valid escape zone at the top.

7\. Server-side escape recording and timing.

8\. Round completion and reset.

9\. Basic UI feedback.

10\. Reliable operation in a Roblox Studio multiplayer test.



The first milestone does not require final art, persistent leaderboards, procedural maps, monetization, complex progression, or elaborate cutscenes.



\## 12. Acceptance Criteria



The first playable milestone is accepted only after the following behaviors have been verified.



\### Round Lifecycle



\- The game can enter the lobby, start a countdown, run a round, resolve results, and reset.

\- The lifecycle can repeat without duplicate timers or stale round state.

\- Players who leave during a round do not break the game.



\### Hazard



\- The hazard activates at the configured time.

\- Its authoritative height increases according to the configured rules.

\- Players caught by the hazard are eliminated once.

\- The hazard behaves consistently across multiple clients.

\- Visual feedback corresponds to the authoritative hazard boundary.



\### Escape



\- Reaching the valid escape zone records a successful escape.

\- Escape time is measured by the server.

\- A successful player cannot later be eliminated in the same round.

\- Other active players can continue after one player escapes.



\### Multiplayer



\- Multiple players can participate in the same round.

\- Each participant's outcome is tracked independently.

\- Player death, leaving, and respawn do not corrupt the round.

\- The game resolves correctly when everyone has escaped or been eliminated.



\### Testing



\- Basic behavior has been tested in Roblox Studio.

\- Multiplayer behavior has been tested using a server with multiple clients.

\- Relevant Output errors have been investigated.

\- Untested behavior is documented rather than claimed as verified.



\## 13. Deferred Features



Do not implement these until the first playable milestone is reliable:



\- Procedural level generation.

\- Multiple facility layouts.

\- Persistent global leaderboards.

\- Unlocks, cosmetics, currencies, and progression.

\- Advanced custom movement and physics.

\- Complex environmental destruction.

\- Multiple hazard types.

\- Elaborate cinematics and scripted sequences.

\- Monetization.

\- Large-scale matchmaking or external services.



These may be considered after the core game has been tested and reviewed.



\## 14. Design Decision Policy



The flooding deep-sea facility is the approved direction.



Claude Code may propose improvements to the layout, hazard presentation, pacing, traversal, and implementation details, but should not silently change the core premise or expand the scope substantially.



Material changes to the round loop, elimination rules, hazard behavior, multiplayer design, or first playable milestone must be proposed for user review before implementation.

