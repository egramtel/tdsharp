Instructions for Maintainers
============================

1. Choose a new version. To avoid confusion, all the packages should follow the versioning of the upstream Telegram library, and should have the same version among them.
2. Update the copyright year in [the license file][license], if required.
3. Prepare a corresponding entry in [the changelog][changelog] (usually by renaming the "Unreleased" section).
4. Set the `<Version>` in the `Directory.Build.props`.
5. Merge all the changes to the main branch using a pull request.
6. Push a tag in form of `v<VERSION>`, e.g. `v0.0.1`. GitHub Actions will do the rest (push the NuGet packages).
7. If the release is not synchronized with a corresponding release of [tdlib.native][], then it's recommended to [unlist][docs.unlist] it until the corresponding release of tdlib.native is available. This will help the users to do a coordinated update and not update only a part of the libraries.

[changelog]: ./CHANGELOG.md
[docs.unlist]: https://docs.microsoft.com/en-us/nuget/nuget-org/policies/deleting-packages#unlisting-a-package
[license]: ./LICENSE
[tdlib.native]: https://github.com/ForNeVeR/tdlib.native
