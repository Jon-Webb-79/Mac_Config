#!/usr/local/bin/bash 
# create_dir file
# ================================================================================
# ================================================================================
# - Purpose: This file contains bash scripts that are used to create a 
#            software development package in many languages
#
# Source Metadata
# - Author:  Jonathan A. Webb
# - Date:    February 25, 2022
# - Version: 1.0
# - Copyright: Copyright 2022, Jon Webb Inc.
# ================================================================================
# ================================================================================
# - Read in the language to be created as a command line argument.  This should
#   be limited to Python, C, C++, or Ardunio

# bash or zsh
script_type='bash'
language=$1

# Verify that the entry is acceptable
if [ $language != "Python" ] && [ $language != "C" ] && [ $language != "C++" ] && \
    [ $language != "Arduino" ]; then
	echo 'Language must be Python, C, C++, or Arduino'
fi
# --------------------------------------------------------------------------------
# Create aliases for commands

name='Jonathan A. Webb'
company='Jon Webb'
make_dir='/bin/mkdir'
create_file='/usr/bin/touch'
copy='/bin/cp'
replace='/usr/bin/sed'
# --------------------------------------------------------------------------------
# Ask the user for the name of the project

echo 'Enter the Project Name:'
read project_name

# # Create the path lenghts

path_length=$HOME'/Code_Dev/'$language'/'$project_name

# # Verify that project does not already exist
if [ -d $path_length ] ; then
	echo 'FATAL ERROR: '$path_length' already exists'
	exit 1
fi

py_dir=$HOME'/.config/py_files/'
c_dir=$HOME'/.config/c_files/'
cpp_dir=$HOME'/.config/c++_files/'
script_dir=$HOME'/.config/'$script_type'_scripts/'
# ================================================================================
# ================================================================================
# Create all generic directory structure
# Python specific files and directories

day=`date +%d`
month=`date +%B`
year=`date +%Y`

if [ $language == "Python" ] ; then
	py_path=$HOME'/Code_Dev/'$language'/'
	cd $py_path
	poetry new $project_name
	cd $path_length
	$make_dir 'scripts'
	$make_dir 'scripts/bash'
	$make_dir 'scripts/zsh'
	$make_dir 'data'
	$make_dir 'data/test'
	$make_dir 'docs'
	$make_dir 'docs/requirements'
	poetry add -G dev pytest
	poetry add -G dev flake8
	poetry add -G dev black
	poetry add -G dev mypy
	poetry add -G dev isort
	$make_dir 'docs/sphinx'
	$make_dir 'docs/sphinx/source'
	cat $py_dir'pyproject.toml' >> $path_length'/pyproject.toml'
	$copy $py_dir'.gitignore' $path_length'/.gitignore'
	$copy $py_dir'LICENSE' $path_length'/LICENSE'
	$copy $py_dir'test.py' $path_length'/tests/test.py'
	$copy $py_dir'main.py' $path_length'/'$project_name'/main.py'
	$copy $py_dir'sphinx_make' $path_length'/docs/sphinx/Makefile'
	$copy $py_dir'conf.py' $path_length'/docs/sphinx/source/conf.py'
	$copy $py_dir'index.rst' $path_length'/docs/sphinx/source/index.rst'
    $copy $py_dir'Introduction.rst' $path_length'/docs/sphinx/source/Introduction.rst'
	$copy $py_dir'sphinx_readme.txt' $path_length'/docs/sphinx/readme.txt'
	$copy $py_dir'Makefile' $path_length'/Makefile'
	rm README.md
	$copy $py_dir'README.rst' $path_length'/README.rst'
	$copy $HOME'/.config/bash_scripts/run_tests.sh' $path_length'/scripts/bash/run_tests.sh' 
    $copy $HOME'/.config/bash_scripts/unit_tests.sh' $path_length'/scripts/bash/unit_tests.sh'
    $copy $HOME'/.config/zsh_scripts/run_tests.zsh' $path_length'/scripts/zsh/run_tests.zsh'
    $copy $HOME'/.config/zsh_scripts/unit_tests.zsh' $path_length'/scripts/zsh/unit_tests.zsh'

	# Update files with day, month, year
    $replace -i '' -e "s/Day/$day/g" $path_length'/tests/test.py'
    $replace -i '' -e "s/Month/$month/g" $path_length'/tests/test.py'
	$replace -i '' -e "s/Year/$year/g" $path_length'/tests/test.py'
    $replace -i '' -e "s/Name/$name/g" $path_length'/tests/test.py'
	$replace -i '' -e "s/Company/$company/g" $path_length'/tests/test.py'
	$replace -i '' -e "s/filename/test/g" $path_length'/tests/test.py'

	$replace -i '' -e "s/README.md/README.rst/g" $path_length'/pyproject.toml'
    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/main.py'
	$replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/main.py'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/main.py'
	$replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/main.py'
	$replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/main.py'
	$replace -i '' -e "s/filename/main/g" $path_length'/'$project_name'/main.py'

	$script_type $script_dir'create_project_tmux.sh' Python $project_name
fi
# --------------------------------------------------------------------------------
# Other language boilerplate

if [ $language != "Python" ] ; then
	$make_dir $path_length
	cd $path_length
	$make_dir $project_name 
	$make_dir 'scripts'
	$make_dir 'scripts/bash'
	$make_dir 'scripts/zsh'
	$make_dir 'data'
	$make_dir 'data/test'
	$make_dir 'docs'
	$make_dir 'docs/requirements'
fi
# --------------------------------------------------------------------------------
# C Specific files and directories

if [ $language == "C" ] ; then
    $copy $c_dir'.gitignore' $path_length'/.gitignore'
    $copy $c_dir'README.rst' $path_length'/README.rst'
    $copy $c_dir'LICENSE' $path_length'/LICENSE'
    $copy $c_dir'main.c' $path_length'/'$project_name'/main.c'
    $copy $c_dir'avrMakefile' $path_length'/'$project_name'/avrMakefile'
	$make_dir $path_length'/'$project_name'/test'
    $make_dir $path_length'/'$project_name'/build'
	$make_dir $path_length'/'$project_name'/include'
    $copy $c_dir'CMake1.txt' $path_length'/'$project_name'/CMakeLists.txt'
    $copy $c_dir'CMake2.txt' $path_length'/'$project_name'/include/CMakeLists.txt'
    $copy $c_dir'CMaketest.txt' $path_length'/'$project_name'/test/CMakeLists.txt'
    $copy $script_dir'build.sh' $path_length'/scripts/'$script_type'/build.sh'
    $copy $script_dir'compile.sh' $path_length'/scripts/'$script_type'/compile.sh'

    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/main.c'
	$replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/main.c'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/main.c'
	$replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/main.c'
	$replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/main.c'
    $replace -i '' -e "s/filename/main/g" $path_length'/'$project_name'/main.c'

    $copy -i $c_dir'test.cpp' $path_length'/'$project_name'/test/test.cpp'

	$replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/file_name/test/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/test/test.cpp'
    $replace -i '' -e "s/filename/test/g" $path_length'/'$project_name'/test/test.cpp'

    $replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/CMakeLists.txt'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/CMakeLists.txt'

    $replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/include/CMakeLists.txt'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/include/CMakeLists.txt'

    $replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/test/CMakeLists.txt'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/test/CMakeLists.txt'

    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/scripts/'$script_type'/build.sh' 
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/scripts/'$script_type'/compile.sh'

	$script_type $script_dir'create_project_tmux.sh' C $project_name
# --------------------------------------------------------------------------------
# C++ Specific files and directories

elif [ $language == "C++" ] ; then
    $copy $cpp_dir'.gitignore' $path_length'/.gitignore'
    $copy $cpp_dir'README.rst' $path_length'/README.rst'
    $copy $cpp_dir'LICENSE' $path_length'/LICENSE'
    $copy $cpp_dir'main.cpp' $path_length'/'$project_name'/main.cpp'
    $make_dir $path_length'/'$project_name'/test'
    $make_dir $path_length'/'$project_name'/build'
	$make_dir $path_length'/'$project_name'/include'
	$copy $cpp_dir'CMake1.txt' $path_length'/'$project_name'/CMakeLists.txt'
    $copy $cpp_dir'CMake2.txt' $path_length'/'$project_name'/include/CMakeLists.txt'
	$copy $cpp_dir'CMaketest.txt' $path_length'/'$project_name'/test/CMakeLists.txt'
	$copy $script_dir'build.sh' $path_length'/scripts/'$script_type'/build.sh'
    $copy $script_dir'compile.sh' $path_length'/scripts/'$script_type'/compile.sh'

    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/main.cpp'
	$replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/main.cpp'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/main.cpp'
	$replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/main.cpp'
	$replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/main.cpp'
    $replace -i '' -e "s/filename/main/g" $path_length'/'$project_name'/main.cpp'

    $copy -i $cpp_dir'test.cpp' $path_length'/'$project_name'/test/test.cpp'

    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/file_name/test/g" $path_length'/'$project_name'/test/test.cpp'
	$replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/test/test.cpp'
    $replace -i '' -e "s/filename/test/g" $path_length'/'$project_name'/test/test.cpp'

	$replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/CMakeLists.txt'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/'$project_name'/CMakeLists.txt'
    $replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/CMakeLists.txt'

    $replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/include/CMakeLists.txt'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/'$project_name'/include/CMakeLists.txt'
    $replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/include/CMakeLists.txt'

    $replace -i '' -e "s/Name/$name/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/Month/$month/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/Day/$day/g" $path_length'/'$project_name'/test/CMakeLists.txt'
	$replace -i '' -e "s/Year/$year/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/'$project_name'/test/CMakeLists.txt'
    $replace -i '' -e "s/Company/$company/g" $path_length'/'$project_name'/test/CMakeLists.txt'

	$replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/scripts/'$script_type'/build.sh' 
    $replace -i '' -e "s/prjct_name/$project_name/g" $path_length'/scripts/'$script_type'/compile.sh'
	$script_type $script_dir'create_project_tmux.sh' C++ $project_name
fi
# ================================================================================
# ================================================================================
# eof
