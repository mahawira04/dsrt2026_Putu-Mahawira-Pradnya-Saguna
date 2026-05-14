v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -130 -60 -130 10 {lab=#net1}
N 10 -30 30 -30 {lab=in}
N 10 -30 10 110 {lab=in}
N 70 0 70 100 {lab=out}
N 10 110 10 130 {lab=in}
N 10 130 30 130 {lab=in}
N -50 50 10 50 {lab=in}
N 70 -30 110 -30 {lab=#net1}
N 110 -60 110 -30 {lab=#net1}
N -130 -100 -130 -60 {lab=#net1}
N -130 -100 110 -100 {lab=#net1}
N 110 -100 110 -60 {lab=#net1}
N 70 -100 70 -60 {lab=#net1}
N -130 70 -130 200 {lab=GND}
N 70 160 70 200 {lab=GND}
N -130 200 70 200 {lab=GND}
N -50 110 -50 200 {lab=GND}
N 70 130 110 130 {lab=GND}
N 110 130 110 200 {lab=GND}
N 70 200 110 200 {lab=GND}
N 70 50 160 50 {lab=out}
N -90 200 -90 230 {lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} 50 -30 0 0 {name=M1
W=15
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 50 130 0 0 {name=M2
W=5
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -130 40 0 0 {name=V1 value=1.8}
C {vsource.sym} -50 80 0 0 {name=V2 value=0}
C {lab_pin.sym} -50 50 0 0 {name=p1 sig_type=std_logic lab=in}
C {lab_pin.sym} 160 50 2 0 {name=p2 sig_type=std_logic lab=out}
C {gnd.sym} -90 230 0 0 {name=l1 lab=GND}
C {code.sym} 10 270 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".lib /foss/pdks/sky130A/libs.tech/combined/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=1
"}
C {code_shown.sym} 270 60 0 0 {name=spice only_toplevel=false value="
.option wnflag=0
.option savecurrents
.control
save all
dc v2 0 1.8 0.01
plot in out
op
.endc
"}
