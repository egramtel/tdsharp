<!--
SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>

SPDX-License-Identifier: MIT
-->

Contributor Guide
=================

Prerequisites
-------------
To work with the project, you'll need [.NET SDK 7][dotnet-sdk] or later.

Build
-----
Use the following shell command:

```console
$ dotnet build
```

Test
----
Use the following shell command:

```console
$ dotnet test
```

License Automation
------------------
If the CI asks you to update the file licenses, follow one of these:
1. Update the headers manually (look at the existing files), something like this:
   ```fsharp
   // SPDX-FileCopyrightText: %year% %your name% <%your contact info, e.g. email%>
   //
   // SPDX-License-Identifier: MIT
   ```
   (accommodate to the file's comment style if required).
2. Alternately, use [REUSE][reuse] tool:
   ```console
   $ reuse annotate --license MIT --copyright '%your name% <%your contact info, e.g. email%>' %file names to annotate%
   ```

(Feel free to attribute the changes to "tdsharp contributors <https://github.com/egramtel/tdsharp>" instead of your name in a multi-author file, or if you don't want your name to be mentioned in the project's source: this doesn't mean you'll lose the copyright.)

[dotnet-sdk]: https://dotnet.microsoft.com/en-us/download
[reuse]: https://reuse.software/