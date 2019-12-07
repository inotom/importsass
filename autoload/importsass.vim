"
" File: autoload/importsass.vim
" file created in 2019/12/07 12:58:48.
" LastUpdated: 2019/12/07 14:08:10.
" Author: iNo <wdf7322@yahoo.co.jp>
" Version: 1.0
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

if !exists('g:loaded_importsass')
  runtime! plugin/importsass.vim
endif

let s:save_cpo = &cpo
set cpo&vim

function! s:existImportCode(fpath, codeStr)
  for line in readfile(a:fpath)
    if stridx(line, a:codeStr) != -1
      return 1
    endif
  endfor
  return 0
endfunction

function! importsass#importSass()
  " Open file name (excluding extension).
  let s:current_file_basename = expand("%:r")
  " Directory path of the currently open file.
  let s:current_file_dir_path = expand("%:p:h")
  " Full path of the _index.scss file.
  let s:index_scss_file_path = s:current_file_dir_path . "/_index.scss"
  " Code string to insert into the _index.scss file.
  let s:import_code = "@import '" . substitute(s:current_file_basename, "^_", "", "" ) . "';"

  if filewritable(s:index_scss_file_path)
    if s:existImportCode(s:index_scss_file_path, s:import_code) == 1
      echo "The \"" . s:import_code . "\" line already exists."
    else
      :execute ":redir! >>" . s:index_scss_file_path
        :silent! echon s:import_code . "\n"
      :redir END
      echo "Added \"" . s:import_code . "\" line to \"_index.scss\" file."
    endif
  else
    echo "The \"_index.scss\" file does not exist in the current directory."
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
