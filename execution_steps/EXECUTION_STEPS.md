1. a) Identificando o tipo de executavel

    hexdump -C decode.o

b) Lendo informações sobre o arquivo ELF

    readelf -h decode.o
    readelf -h libcypher.so

2. a) Gerando um executavel pelo gcc

    gcc -m32 decode.o -L. -Wl,-rpath='$ORIGIN' -l:libcypher.so -o decode

b) Executando o programa gerado

    ./decode

3. Criamos uma funcao unlock vazia em C, para ultrapassar o dispositivo de seguranca dentro do codigo, basta usar o comando make para gerar o executavel agora

4. Descriptografando o arquivo crypt1.dat e colocando o outout em decrypted1, usando o comando file descobrimos o tipo de arquivo (um PNG)

5. Vamos resolver o problema de seg fault resultado reescrevendo a parte em assembly

    objdump --disassemble=change --no-show-raw-insn libcypher.so | awk -F: '{print $2}'

Colocamos esse codigo dentro do arquivo fix.S e corrigimos o erro

Reescrevemos o codigo dentro do Makefile para gerar o executavel usando o fix.o
