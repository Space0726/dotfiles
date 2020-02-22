# Find tab in file contents and print their file name
# grep -n is printing number line option so if it doesn't needed, remove it
tab=`echo -e "\t"`
grep --include=*.* --exclude=a.out --exclude-dir=.git -rw '.' -e "${tab}" | awk -F: '{ print $1 }' | uniq

# Replace tab to space 4 in file content
# -- means that no more flags next
sed -i -- 's/\t/    /g' foo.txt

# Using together - Find and replace tab to space 4 all file in current directory (including subdirectory files)
sed -i -- 's/\t/    /g' `grep --include=*.* --exclude=a.out --exclude-dir=.git -rw '.' -e "${tab}" | awk -F: '{ print $1 }' | uniq`
