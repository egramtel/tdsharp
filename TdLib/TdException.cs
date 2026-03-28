// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;
using TdLib;
using TdLib.TdApi.Objects;

namespace TdLib
{
    /// <summary>
    /// Exception used to signal that TDLib returned an error
    /// </summary>
    public class TdException : Exception
    {
        public readonly Error Error;

        public TdException(Error error) : base(error.Message)
        {
            Error = error;
        }
    }
}
