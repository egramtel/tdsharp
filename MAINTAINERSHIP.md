<!--
SPDX-FileCopyrightText: 2022-2026 tdsharp contributors <https://github.com/egramtel/tdsharp>

SPDX-License-Identifier: MIT
-->

Instructions for Maintainers
============================

Publish a New Version
---------------------

1. Choose a new version. To avoid confusion, all the packages should follow the versioning of the upstream Telegram library, and should have the same version among them.
2. Update the copyright year in [the license file][license], if required.
3. Update the `<Copyright>` element in the `Directory.Build.props` and `TDLib.Api/TDLib.Api.csproj`, if required.
4. Update the upstream license information in the `README.md` and `REUSE.toml`, if required.
5. Prepare a corresponding entry in [the changelog][changelog] (usually by renaming the "Unreleased" section).
6. Set the `<Version>` in the `Directory.Build.props`.
7. Merge all the changes to the main branch using a pull request.
8. If you want to publish a new package (not a new version, but a new project/package) change the NuGet Trusted Publishing Policy: switch from **push only new packages versions** to **push new packages and package versions** (see below for more details).
9. Push a tag in form of `v<VERSION>`, e.g. `v0.0.1`. GitHub Actions will do the rest (push the NuGet packages).
10. If you were publishing a new package, revert back the change you did at step 8.
11. If the release is not synchronized with a corresponding release of [tdlib.native][], then it's recommended to [unlist][docs.unlist] it until the corresponding release of tdlib.native is available. This will help the users to do a coordinated update and not update only a part of the libraries.

NuGet Publishing Policy
-----------------------

This repository relies on [NuGet Trusted Publishing][docs.nuget-trusted-publishing] policy. In case you need to create it again, follow these steps:

1. Sign in to nuget.org.
2. Go to the [Trusted Publishing][nuget.trusted-publishing] section.
3. Create a new policy:
   - **Policy Name:** `github.tdsharp`.
   - **Repository Owner:** `egramtel`.
   - **Repository**: `tdsharp`.
   - **Workflow File**: `nuget.yml`.
   - **Environment:** _leave empty_.
   - **Scope:** **push only new packages versions**.
   - **Glob Patterns and Packages**: `TDLib`, `TDLib.Api`.
4. Put your nuget.org username into the `NUGET_USER` secret on the [action secrets][github.secrets] section of GitHub settings.

When introducing a new package, you can adjust the policy temporarily to allow it to **push new packages and package versions**.

Update Telegram API
-------------------

1. Update the `$CommitHash` variable in the `Scripts/Get-TlFiles.ps1` to a fresh commit hash.
2. Run script `Scripts/Get-TlFiles.ps1` to download the API definitions.
3. Delete the directories `Objects` and `Functions` from the `TdLib.Api` project.
4. Run the following shell script to regenerate the C# code:
   ```console
   $ cd TdLib.Api && dotnet run --project ../TdLib.CodeGen
   ```

[changelog]: ./CHANGELOG.md
[docs.nuget-trusted-publishing]: https://learn.microsoft.com/en-us/nuget/nuget-org/trusted-publishing
[docs.unlist]: https://docs.microsoft.com/en-us/nuget/nuget-org/policies/deleting-packages#unlisting-a-package
[github.secrets]: https://github.com/egramtel/tdsharp/settings/secrets/actions
[license]: ./LICENSE
[nuget.trusted-publishing]: https://www.nuget.org/account/trustedpublishing
[tdlib.native]: https://github.com/ForNeVeR/tdlib.native
