
if java -version 2>&1 >/dev/null | grep "java version\|openjdk version" ; then
	javac client.java; java client
else
	pythonver=$(python -V 2>&1 | grep -Po '(?<=Python )(.+)')
	if [[ -z "$pythonver" ]]
	then
	    echo "No Python!"
	else
        	python3 client.py
	fi

fi
