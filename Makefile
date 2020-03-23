all: liboqs-jni KEM_example Sig_example Rand_example

KEM_example: liboqs-jni
	javac -classpath src/main/java/ src/test/java/org/openquantumsafe/KEM_Test.java

Sig_example: liboqs-jni
	javac -classpath src/main/java/ src/test/java/org/openquantumsafe/Sig_Test.java

Rand_example: liboqs-jni
	javac -classpath src/main/java/ src/test/java/org/openquantumsafe/Rand_Test.java

liboqs-jni:
	$(MAKE) -C src/main/c

run-kem:
	java -classpath src/main/java/:src/test/java/ -Djava.library.path=./src/main/c/ org.openquantumsafe.KEM_Test

run-sig:
	java -classpath src/main/java/:src/test/java/ -Djava.library.path=./src/main/c/ org.openquantumsafe.Sig_Test

run-rand:
	java -classpath src/main/java/:src/test/java/ -Djava.library.path=./src/main/c/ org.openquantumsafe.Rand_Test

clean-c:
	$(MAKE) -C src/main/c clean

clean-java:
	$(MAKE) -C src/main/java/org/openquantumsafe clean

clean:
	$(MAKE) -C src/main/c clean
	$(MAKE) -C src/main/java/org/openquantumsafe clean
	$(MAKE) -C src/test/java/org/openquantumsafe clean
	$(RM) -f *.log
