" abbreviations {{{1
inoreabbrev <buffer> ;;l % locals()
inoreabbrev <buffer> ;;b #! /usr/bin/env python
inoreabbrev <buffer> ;;i import 
inoreabbrev <buffer> ;;s self.

"noreabbrev <expr> c resolve("%:p:h") . "/"
"inoreabbrev <expr> ;;k resolve("%:p:h") . "/"
"inoreabbrev <buffer> ;;l resolve("%:p:h") . "/"
"inoreabbrev <buffer> <expr> ;;m resolve("%:p:h") . "/"
"inoreabbrev <buffer> ;;n hello there
"iabbrev <expr> ;;o hi there
"inoreabbrev <script> ;;y gday there
"inoreabbrev <script> <buffer> ;;z yo there
