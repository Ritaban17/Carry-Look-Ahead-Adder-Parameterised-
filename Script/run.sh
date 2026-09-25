verilator --binary -j 0 --Wall cla.v cla_tb.v test.v -top cla_tb --timing --CFLAGS "-std=c++20" --trace

cd obj_dir

make -f Vcla_tb.mk Vcla_tb

./Vcla_tb

gtkwave cla.vcd
