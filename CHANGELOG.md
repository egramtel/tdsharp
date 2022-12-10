Changelog
=========

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased] (1.8.2)
### Fixed
- Array items are now deserialized to their actual types ([#146](https://github.com/egramtel/tdsharp/issues/146)).

## [1.8.1.1] - 2022-06-26
### Changed
- `ITdLibBindings`, `TdLibBindingsExtensions` and `TdLogLevel` were moved from `TDLib.Bindings` to `TdLib.Bindings` (case-only change in the namespace), since the old namespace was created in an error. A compatibility layer is created to keep the old types available.
- Upgraded the Newtonsoft.Json dependency to 13.0.1.

## [1.8.1] - 2022-04-10
### Changed
- Update bindings to [TDLib 1.8.1](https://github.com/tdlib/td/tree/1e1ab5d1b0e4811e6d9e1584a82da08448d0cada).

## [1.7.9] - 2021-12-04
### Changed
- Update bindings for [TDLib 1.7.9](https://github.com/tdlib/td/tree/8d7bda00a535d1eda684c3c8802e85d69c89a14a).

## [1.7.0.2] - 2021-11-20
### Added
- Extension methods to set logging parameters on `ITdLibBindings`.

## [1.7.0.1] - 2021-11-06
### Added
- `TdJsonClient.GlobalExecute` to execute a request on an automatically configured bindings instance
- Ability to get autodetected bindings in the user code.

### Fixed
- [#90: TdClient.CloseAsync might be stuck](https://github.com/egramtel/tdsharp/issues/90) if the synchronization context's main thread is blocked.

## [1.7.0] - 2021-02-05
### Changed
- Update bindings for TDLib 1.7.

### Added
- Ability to provide custom native bindings (`ITdLibBindings`).

## [1.6.0] - 2020-02-21
### Changed
- New entry classes: `TdClient`, `TdJsonClient`.
- Update bindings for TDLib 1.6.

## [1.3.0] - 2018-09-08
### Changed
- Update bindings for TDLib 1.3.
-
### Fixed
- Use correct native library name on Linux.

## [1.2.1] - 2018-08-12
### Changed
- Root namespace change from `TD` to `TdLib`.
- Make generated API types nested inside of `TdApi`.

## [1.2.0] - 2018-04-06
### Changed
- Update bindings for TDLib 1.2.

## [1.0.0] - 2018-04-01

Initial release to support TDLib pre-1.2.

[1.0.0]: https://github.com/egramtel/tdsharp/releases/tag/v1.0.0
[1.2.0]: https://github.com/egramtel/tdsharp/compare/v1.0.0...v1.2.0
[1.2.1]: https://github.com/egramtel/tdsharp/compare/v1.2.0...v1.2.1
[1.3.0]: https://github.com/egramtel/tdsharp/compare/v1.2.1...v1.3.0
[1.6.0]: https://github.com/egramtel/tdsharp/compare/v1.3.0...v1.6.0
[1.7.0]: https://github.com/egramtel/tdsharp/compare/v1.6.0...v1.7.0
[1.7.0.1]: https://github.com/egramtel/tdsharp/compare/v1.7.0...v1.7.0.1
[1.7.0.2]: https://github.com/egramtel/tdsharp/compare/v1.7.0.1...v1.7.0.2
[1.7.9]: https://github.com/egramtel/tdsharp/compare/v1.7.0.2...v1.7.9
[1.8.1]: https://github.com/egramtel/tdsharp/compare/v1.7.9...v1.8.1
[1.8.1.1]: https://github.com/egramtel/tdsharp/compare/v1.8.1...v1.8.1.1
[Unreleased]: https://github.com/egramtel/tdsharp/compare/v1.8.1.1...HEAD
