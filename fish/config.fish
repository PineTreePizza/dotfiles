      if status is-interactive
          # Commands to run in interactive sessions can go here
      end
      function fish_prompt
          set -l textcol  '#FAFAFA'
          set -l bgcol    '#00aaff'
          set -l arrowcol '#00aaff'
          set_color $arrowcol -b normal
      		echo -n "╭"
          set_color $textcol -b $bgcol
          echo -n "󰌢  "(hostname)"@"(pwd)" "
          set_color $arrowcol -b normal
          echo -n "
      ╰── "
      end

      set fish_greeting
      starship init fish | source