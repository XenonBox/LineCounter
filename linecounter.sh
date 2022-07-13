repos_array="""
https://github.com/chocolatey/choco
https://github.com/files-community/Files
https://github.com/0x7c13/Notepads
https://github.com/felixse/FluentTerminal
https://github.com/quasar/Quasar
https://github.com/File-New-Project/EarTrumpet
https://github.com/dvf/blockchain
"""

# Download the repos:
for repo in $repos_array
do
	# if repo exist, it dont clone.
	git clone --depth=1 $repo
done

#----------------

echo "start" > out.txt

# Print size of each repo:
# https://stackoverflow.com/questions/1019116/using-ls-to-list-directories-and-their-total-sizes
# linux ls size of directorys
# du -sh *
# du -sk * | sort -n
du -sh * | sort -hr >> out.txt

#----------------

# __what_you_find="*.cs" # rs py cpp # This not work yet! Edit extentions below.

__list1=`find ./ -maxdepth 1 -type d`

# Count Lines in each repo:
for i in $__list1
do
	# echo Now-in-$i
	# https://kapeli.com/cheat_sheets/Bash_Test_Operators.docset/Contents/Resources/Documents/index
	if [ "$i" != "./" ]
	then
		cd $i
		lines_count=$(wc -l `find -name '*.cs'` | tail -1)
		cd ..
		echo $i	$lines_count >> out.txt
	fi
done
