# Find all cpp and header files in file tree below the current directory.

find . -name \*.h -print -o -name \*.cpp -print | wrap_lines_in_quotes.sh


