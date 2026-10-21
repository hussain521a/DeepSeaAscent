\# DeepSeaAscent — Development Workflow



\## 1. Purpose



This document defines how DeepSeaAscent is developed, reviewed, tested, and transferred between development computers.



The workflow is designed to keep working code stable while allowing Claude Code to implement features locally.



\## 2. Roles and Responsibilities



\### Claude Code



Claude Code is responsible for:



\- Inspecting the local project before making changes.

\- Planning and implementing approved tasks.

\- Maintaining project documentation when needed.

\- Performing available local validation.

\- Reviewing its changes for unintended modifications.

\- Preparing clear handoffs for user review.

\- Providing reproducible Roblox Studio testing instructions.



Claude Code is not responsible for GitHub operations or final acceptance of its own work.



\### User



The user controls:



\- Feature approval and scope.

\- Local commits and branch management.

\- All GitHub authentication and remote repository operations.

\- Manual transfer and synchronization of work between computers.

\- Roblox Studio playtesting and acceptance when Studio is not accessible to Claude Code.

\- Decisions to accept, reject, or request revisions.

\- Final integration of reviewed work.



\## 3. Local-Only AI Development



Claude Code must not connect to GitHub or perform remote repository operations.



It must not:



\- Authenticate to a GitHub account.

\- Use GitHub APIs, integrations, or GitHub CLI.

\- Push, pull, fetch, clone, merge, or publish repository changes.

\- Create pull requests or change remote settings.

\- Automatically commit changes.

\- Assume local changes are available on another computer.



Claude Code should work only within the explicitly approved local project or working copy.



If the local environment or repository location is ambiguous, inspect it and ask before modifying files.



\## 4. Feature Workflow



\### Phase A — Plan



Before substantial implementation:



1\. Inspect relevant files and documentation.

2\. Identify the expected behavior.

3\. List the files likely to change.

4\. Identify dependencies and architectural risks.

5\. Define acceptance criteria.

6\. Explain the testing procedure.



Wait for user approval when the scope or architecture materially changes.



\### Phase B — Implement



1\. Make focused changes for the approved task.

2\. Preserve unrelated work and user modifications.

3\. Keep the implementation consistent with `CLAUDE.md`, `GAME\_DESIGN.md`, and `ARCHITECTURE.md`.

4\. Avoid adding unrelated features.

5\. Update documentation when necessary.



\### Phase C — Validate Locally



Perform the checks available in the current environment.



Examples include:



\- Reviewing code and configuration.

\- Checking Rojo mappings.

\- Checking for missing files or references.

\- Running available static checks or automated tests.

\- Reviewing the complete change set for accidental edits.



Do not claim that local checks prove gameplay works in Roblox Studio.



\### Phase D — Prepare Handoff



Before handing over work:



1\. Summarize what was implemented.

2\. List files created, modified, and deleted.

3\. Report the validation performed and its actual results.

4\. Identify unresolved issues and unverified behavior.

5\. Provide exact Studio testing instructions.

6\. State whether any setup or asset work is required.

7\. Stop and request user review.



Do not automatically begin another substantial feature before the current handoff has been reviewed.



\## 5. User-Controlled Source Control



The user prefers the VS Code Source Control interface.



Provide VS Code interface instructions by default when explaining local source control operations.



The user is responsible for deciding when to:



\- Create or switch branches.

\- Stage files.

\- Review diffs.

\- Commit changes.

\- Transfer changes between devices.

\- Push or pull from GitHub.

\- Merge accepted features into `main`.



Claude Code must not perform these operations automatically.



The user may request local Git guidance, but instructions must preserve the separation between AI-assisted development and user-controlled repository management.



\## 6. Branching and Isolation



Keep `main` stable and potentially playable.



Use an isolated feature branch or working copy for each meaningful feature or setup task.



Before work begins, establish which local project and branch are being modified. Do not assume a branch created on one computer is present on another.



Keep changes focused so they can be reviewed and tested independently.



Do not discard changes, reset history, overwrite untracked files, or change branches without explicit user approval.



\## 7. Cross-Computer Handoff



The development computer and Roblox Studio computer may be different machines.



Claude Code must not assume that files are synchronized between them.



The user controls the transfer process, including when changes are copied or transferred through the repository.



A safe handoff should identify:



\- The exact files changed.

\- The feature or task those changes belong to.

\- Any added or removed files.

\- Required Rojo configuration changes.

\- Any dependencies or Studio setup steps.

\- The testing procedure and expected results.



The user should ensure the Studio computer is testing the intended version of the code, not an older local copy.



If testing reveals a defect, the user can return the findings to Claude Code for a focused revision. The revised work must go through review and testing again.



\## 8. Roblox Studio Testing



When a feature requires Studio testing, provide clear, repeatable instructions.



Specify:



\- How to launch the appropriate test.

\- Whether a single-player or multiplayer test is required.

\- What behavior should occur.

\- What Output messages or errors to inspect.

\- What edge cases to test.

\- What results the user should report.



For multiplayer features, distinguish a single-player playtest from a server with multiple clients.



Do not claim Studio verification unless the test was actually performed and its results are known.



\## 9. Acceptance and Integration



A feature is ready for review when:



\- Its requested implementation is complete.

\- Available local validation has been performed.

\- Unintended changes have been checked.

\- Relevant documentation is updated.

\- Unverified behavior is clearly identified.

\- The user has the information needed to test and review it.



The user decides whether the work is accepted.



Only after acceptance should the user decide how to commit, transfer, test further, and integrate the feature into the stable codebase.



A successful local implementation is not automatically a successfully tested or integrated feature.



\## 10. Communication



Claude Code should be direct and specific.



Before implementation, explain the plan and acceptance criteria.



After implementation, report actual results, limitations, and next steps.



Avoid claiming that work was tested, committed, transferred, or published when it was not.



When blocked by missing access, files, or Studio behavior, state the limitation and provide the smallest useful next action.

