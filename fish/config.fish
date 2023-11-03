if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_prompt
    set -l textcol  '#232323'
    set -l bgcol    '#d1d1d1'
    set -l arrowcol '#d1d1d1'
		echo -n "╭"
    set_color $textcol -b $bgcol
    echo -n "󰌢  "(hostname)"@"(pwd)" "
    set_color $arrowcol -b normal
    echo -n " 
╰──"
end

set fish_greeting
#function fish_greeting

#	function center_text
#  		set -l textwidth (string length $argv[1])
#  		set -l spaces (math "($COLUMNS - $textwidth)/2")
#  		printf "%"$spaces"s" $argv[1]
#	end
	
#  set_color red -b normal
#  center_text " "
#  set_color black -b red
# 	echo -n "YOU WILL SUFFER"
#  set_color red -b normal
#  echo ""
#  echo ""
#end

set -Ux HF_TOKEN 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
set -Ux TG_KEY 5960329144:AAG5p4wHCe74--sC4p0ka9ssVaH7K6AmaE4
set -Ux CLANG_FORMAT_FILE $HOME/.config/emacs/.clang-format
