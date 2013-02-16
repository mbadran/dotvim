" save undo files far away (put the full dir path in the filename)
" (when the system restarts, undo files will be lost, which is OK
" set undodir=$TEMP//,$TMP//,$TMPDIR//,/tmp/.
set undodir=$TEMP//,$TMP//,$TMPDIR//,/tmp/.
" set undodir=$HOME/.vim/undo//

" save backup files far away (put the full dir path in the filename)
" // expands to full dir path, not just filename (doesn't work on windows)
" (when the system restarts, backup files will be lost, which is OK
set backupdir=$TEMP//,$TMP//,$TMPDIR//,/tmp/.
" set backupdir=$HOME/.vim/backup//
