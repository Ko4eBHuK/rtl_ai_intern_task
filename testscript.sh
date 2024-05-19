# не совсем понял как всё автоматизировать, но 
# с помощью этих команд в корневой директории проекта можно без использования GUI выполнить симуляцию
vlib ./work
vmap work ./work
vlog sum_tb.sv
vsim work.sum_tb

# это я вводил в терминале Modelsim
add wave /sum_tb/*
run 40 ns
wave zoom full