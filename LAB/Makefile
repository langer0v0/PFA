SRC ?= hello
VAL ?= 1
CODE ?= 00000000000100000000000010010011
FUNC ?= _start
WIDTH ?= 45
PIC ?= image0.png
PLATFORM ?= OIRV

PIC_NAME = $(basename $(PIC))
LINK_OPT = -ffreestanding -nostdlib -nodefaultlibs -target riscv64 -march=rv64im 
RUN_CMD := ../oirv_model ./build/${SRC}.bin
OBJ = ./build/${SRC}

ifneq ($(wildcard c/$(SRC).c),)
  SRC_FILE = c/start.S $(wildcard c/$(SRC).c)
  LINK_OPT += -Wl,-T c/bare.lds
else
  SRC_FILE = $(wildcard asm/$(SRC).s)
  LINK_OPT += -Wl,-Ttext=0x80000000
endif


ifneq ($(PLATFORM),OIRV)
  SRC_FILE = $(wildcard c/$(SRC).c)
  LINK_OPT = -Wall
  RUN_CMD = ./build/${SRC}-${PLATFORM}.o
  OBJ = ./build/${SRC}-${PLATFORM}
endif


all: ${OBJ}.bin model
	mkdir -p build
	${RUN_CMD}


model:
	@make -C ../OIRV/test ARCH=rv64imac rtl-model
	@cp ../OIRV/test/obj_dir/Voirv ../oirv_model
	@chmod +x ../oirv_model


bin: ${SRC_FILE} ./bin/*.im
	mkdir -p build
	clang ${SRC_FILE} ${LINK_OPT} -o ${OBJ}.o
	llvm-objcopy -S -O binary ${OBJ}.o ${OBJ}.bin


${OBJ}.bin: ${SRC_FILE} ./bin/*.im
	mkdir -p build
	clang ${SRC_FILE} ${LINK_OPT} -o ${OBJ}.o
	llvm-objcopy -S -O binary ${OBJ}.o ${OBJ}.bin


run: ${OBJ}.bin model
	mkdir -p build
	@../oirv_model ${OBJ}.bin
	

dump: ${OBJ}.bin
	llvm-objdump -d --disassemble-symbols=${FUNC} ${OBJ}.o


sym: ${OBJ}.bin
	llvm-nm ${OBJ}.o


asm: model
	@mkdir -p build
	python ./utils/asm2bin.py "${CODE}" ./build/mach.s
	@clang ./build/mach.s ${LINK_OPT} -o ./build/mach.o
	@llvm-objcopy -S -O binary ./build/mach.o ./build/mach.bin
	@../oirv_model ./build/mach.bin
	

file: ./bin/${SRC}.bin model
	@../oirv_model ./bin/${SRC}.bin
	

list:
	@ls ./asm | grep '\.s$$' | sed 's/\.s$$//'


conv: 
	@python ./utils/number_system_conversion.py ${VAL}


reg-map:
	@printf "\033[36mx0   <>  zero \nx1   <>  ra   \nx2   <>  sp   \nx3   <>  gp   \nx4   <>  tp   \nx5   <>  t0   \nx6   <>  t1   \nx7   <>  t2   \nx8   <>  s0 / fp   \nx9   <>  s1   \nx10  <>  a0   \nx11  <>  a1   \nx12  <>  a2   \nx13  <>  a3   \nx14  <>  a4   \nx15  <>  a5   \nx16  <>  a6   \nx17  <>  a7   \nx18  <>  s2   \nx19  <>  s3   \nx20  <>  s4   \nx21  <>  s5   \nx22  <>  s6   \nx23  <>  s7   \nx24  <>  s8   \nx25  <>  s9   \nx26  <>  s10  \nx27  <>  s11  \nx28  <>  t3   \nx29  <>  t4   \nx30  <>  t5   \nx31  <>  t6\033[0m\n"


im:
	ffmpeg -i ./image/${PIC} -vf scale=${WIDTH}:-1 ./build/scaled.jpg -y
	ffmpeg -i ./build/scaled.jpg -pix_fmt rgb24 ./build/temp.rgb -y
	ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 ./build/scaled.jpg | xargs printf "%02x" | xxd -r -p > ./bin/${PIC_NAME}.im
	ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 ./build/scaled.jpg | xargs printf "%02x" | xxd -r -p >> ./bin/${PIC_NAME}.im
	cat ./build/temp.rgb >> ./bin/${PIC_NAME}.im


init:
	chmod +x ../setup.sh
	. ../setup.sh


new:
	cp -n ./asm/start.s  ./asm/${SRC}.s


new-c:
	cp -n ./c/basic.c  ./c/${SRC}.c


ops:
	@python utils/operators.py


clean:
	rm -rf ./build/* *.log *.rv

clean-all:
	rm -rf ./build/* ../OIRV/test/obj_dir *.log *.rv
	

.PHONY: clean clean-all conv reg-map list im new new-c ops
