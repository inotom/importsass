"
" File: plugin/importsass.vim
" file created in 2019/12/07 12:58:48.
" LastUpdated: 2020/05/14 14:53:59.
" Author: iNo <wdf7322@yahoo.co.jp>
" Version: 1.1
" License: MIT License {{{
"   Permission is hereby granted, free of charge, to any person obtaining
"   a copy of this software and associated documentation files (the
"   "Software"), to deal in the Software without restriction, including
"   without limitation the rights to use, copy, modify, merge, publish,
"   distribute, sublicense, and/or sell copies of the Software, and to
"   permit persons to whom the Software is furnished to do so, subject to
"   the following conditions:
"
"   The above copyright notice and this permission notice shall be included
"   in all copies or substantial portions of the Software.
"
"   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"   CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"   TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"

if exists('g:loaded_importsass')
  finish
endif
let g:loaded_importsass = 1

let s:save_cpo = &cpo
set cpo&vim

command! ImportSass call importsass#importSass('import')
command! UseSass call importsass#importSass('use')
command! ForwardSass call importsass#importSass('forward')

let &cpo = s:save_cpo
unlet s:save_cpo
