# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part2.v

#load simulation using mux as the top level simulation module
vsim part2

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# create clock 
force {ClockIn} 0 0ns, 1 {5ns} -r 10ns

# Reset first 

force {Reset} 1 
force {clockSpeed} 27'd5
force {Speed} 2'd0;
run 10ns 

# Count every clock cycle -> hypothetical clock speed
force {Reset} 0 
force {clockSpeed} 27'd5 
force {Speed} 2'd0; 
run 50ns 

# One count every 1 second 
force {Reset} 0 
force {clockSpeed} 27'd5 
force {Speed} 2'd1; 
run 50ns 

# Once count every 2 seconds 
force {Reset} 0 
force {clockSpeed} 27'd5 
force {Speed} 2'd2; 
run 100ns 

# once count every 4 seconds 
force {Reset} 0 
force {clockSpeed} 27'd5 
force {Speed} 2'd3; 
run 300ns 
