// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

using System;
using TdLib;

namespace TdLib
{
    /// <summary>
    /// Exception used to signal that TDLib returned an error
    /// </summary>
    public class TdException : Exception
    {
        public readonly TdApi.Error Error;

        public TdException(TdApi.Error error) : base(error.Message)
        {
            Error = error;
        }
    }
}
