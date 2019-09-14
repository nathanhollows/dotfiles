function! utils#intelligentVerticalResize(direction)
  let window_resize_count = 5
  let current_window_is_last_window = (winnr() == winnr("$"))

  if (a:direction == 'left')
    let [modifier_1, modifier_2] = ['+', '-']
  else
    let [modifier_1, modifier_2] = ['-', '+']
  endif

  let modifier = current_window_is_last_window ? modifier_1 : modifier_2
  let command = 'vertical resize ' . modifier . window_resize_count . '<CR>'
  execute command
endfunction

function! utils#runFile()
  if &filetype ==? 'scala'
    let command = 'w | !scalac % && scala %:r'
  elseif &filetype ==? 'sh'
    let command = 'bash %'
  elseif &filetype ==? 'python'
    let command = 'python3 %'
  elseif &filetype ==? 'cpp'
    let command = 'g++ -o %:r.out %'
    let command = './%:r.out'
 else
    echom "Can't run current file (unsupported filetype: " . &filetype . ")"
 endif
 endfunction
