
if java -version 2>&1 >/dev/null | grep "java version\|openjdk version" ; then
	javac client.java; java client
else
	[[ "$(python3 -V)" =~ "Python 3" ]] && python3 client.py
fi
