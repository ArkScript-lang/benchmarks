echo Ackermann
echo =========

cd Ackermann
arkscript ackermann.ark
clang++ .\ackermann.cpp -o ack.exe -O1 ; .\ack.exe
javac Ackermann.java ; java Ackermann
node .\ackermann.js
lua54 .\ackermann.lua
python ackermann.py
ruby ackermann.rb

echo ""
echo Fibonacci
echo =========

cd ..\Fibonacci
arkscript fibonacci.ark
clang++ .\fibonacci.cpp -o fibo.exe -O1 ; .\fibo.exe
javac Fibonacci.java ; java Fibonacci
node .\fibonacci.js
lua54 .\fibonacci.lua
python fibonacci.py
ruby fibonacci.rb

cd ..