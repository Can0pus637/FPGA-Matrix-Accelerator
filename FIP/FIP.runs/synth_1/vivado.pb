
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/utils_1/imports/synth_1/Systolic_Array.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2{
gC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/utils_1/imports/synth_1/Systolic_Array.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
y
Command: %s
53*	vivadotcl2H
4synth_design -top FIP_top -part xczu7ev-ffvc1156-2-e2default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xczu7ev2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xczu7ev2default:defaultZ17-349h px� 
[
Loading part %s157*device2(
xczu7ev-ffvc1156-2-e2default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
_
#Helper process launched with PID %s4824*oasys2
84122default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 2896.438 ; gain = 338.805
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
FIP_top2default:default2
 2default:default2k
UC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/FIP_top.sv2default:default2
12default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
IBUFGDS2default:default2
 2default:default2K
5C:/Xilinx/Vivado/2022.2/scripts/rt/data/unisim_comp.v2default:default2
718342default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IBUFGDS2default:default2
 2default:default2
02default:default2
12default:default2K
5C:/Xilinx/Vivado/2022.2/scripts/rt/data/unisim_comp.v2default:default2
718342default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
Systolic_Array2default:default2
 2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
12default:default8@Z8-6157h px� 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 2 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter M bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter N bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter K bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'%s4497*oasys2
PE2default:default2
 2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
12default:default8@Z8-6157h px� 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 2 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PE2default:default2
 2default:default2
02default:default2
12default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
12default:default8@Z8-6155h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
332default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
342default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
332default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
342default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
332default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
342default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
332default:default8@Z8-324h px� 
�
index %s out of range324*oasys2
42default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
342default:default8@Z8-324h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
Systolic_Array2default:default2
 2default:default2
02default:default2
12default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
Alpha_Beta_cal2default:default2
 2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
22default:default8@Z8-6157h px� 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 2 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter K bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter M bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter N bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
synthesizing module '%s'%s4497*oasys2!
Alpha_Beta_PE2default:default2
 2default:default2q
[C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_PE.sv2default:default2
12default:default8@Z8-6157h px� 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 2 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter K bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter M bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter N bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
Alpha_Beta_PE2default:default2
 2default:default2
02default:default2
12default:default2q
[C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_PE.sv2default:default2
12default:default8@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
822default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
832default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
822default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
832default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
822default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
832default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
822default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
832default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1012default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1022default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1012default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1022default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1012default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1022default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
A_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1012default:default8@Z8-689h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
92default:default2
B_in2default:default2
22default:default2!
Alpha_Beta_PE2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
1022default:default8@Z8-689h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
Alpha_Beta_cal2default:default2
 2default:default2
02default:default2
12default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Alpha_Beta_cal.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2!
random_matrix2default:default2
 2default:default2p
ZC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/random_matrix.v2default:default2
12default:default8@Z8-6157h px� 
_
%s
*synth2G
3	Parameter DATA_WIDTH bound to: 2 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter M bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter K bound to: 4 - type: integer 
2default:defaulth p
x
� 
V
%s
*synth2>
*	Parameter N bound to: 4 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
random_matrix2default:default2
 2default:default2
02default:default2
12default:default2p
ZC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/random_matrix.v2default:default2
12default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
FIP_top2default:default2
 2default:default2
02default:default2
12default:default2k
UC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/FIP_top.sv2default:default2
12default:default8@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2"
seed_local_reg2default:default2p
ZC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/random_matrix.v2default:default2
432default:default8@Z8-6014h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2996.797 ; gain = 439.164
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 3014.703 ; gain = 457.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 3014.703 ; gain = 457.070
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0112default:default2
3026.7542default:default2
0.0002default:defaultZ17-268h px� 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
12default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2j
TC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/constrs_1/new/FIP_c.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2j
TC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/constrs_1/new/FIP_c.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2h
TC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/constrs_1/new/FIP_c.xdc2default:default2-
.Xil/FIP_top_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3120.3552default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2v
b  A total of 1 instances were transformed.
  IBUFGDS => IBUFDS (DIFFINBUF, IBUFCTRL): 1 instance 
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
3120.3552default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 3120.355 ; gain = 562.723
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Loading part: xczu7ev-ffvc1156-2-e
2default:defaulth p
x
� 
B
 Reading net delay rules and data4578*oasysZ8-6742h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 3120.355 ; gain = 562.723
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 3120.355 ; gain = 562.723
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 3120.355 ; gain = 562.723
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   17 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    9 Bit       Adders := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    5 Bit       Adders := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 32    
2default:defaulth p
x
� 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input      1 Bit         XORs := 32    
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               17 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               10 Bit    Registers := 16    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                9 Bit    Registers := 40    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 34    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                5 Bit    Registers := 16    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 9     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 112   
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 7     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   17 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    9 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 3     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 9     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 80    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 8     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2n
ZPart Resources:
DSPs: 1728 (col length:144)
BRAMs: 624 (col length: RAMB18 144 RAMB36 72)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[0].row_loop[1].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[0].row_loop[2].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[0].row_loop[3].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[0].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[1].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[1].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[1].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[1].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[1].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[2].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[2].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[2].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[2].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[2].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[3].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[3].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[3].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[3].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[1].row_loop[3].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[0].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[1].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[1].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[1].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[1].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[1].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[2].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[2].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[2].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[2].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[2].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[3].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[3].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[3].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[3].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[2].row_loop[3].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[0].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[1].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[1].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[1].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[1].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[1].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[2].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[2].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[2].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[2].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[2].pe_inst/C_out_reg[0]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[3].pe_inst/C_out_reg[4]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[3].pe_inst/C_out_reg[3]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[3].pe_inst/C_out_reg[2]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2Q
=Systolic_Array/col_loop[3].row_loop[3].pe_inst/C_out_reg[1]/Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6859h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-68592default:default2
1002default:defaultZ17-14h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2f
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/PE.sv2default:default2
312default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
392default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
332default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
332default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
342default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
342default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
272default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2r
\C:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.srcs/sources_1/new/Systolic_Array.sv2default:default2
282default:default8@Z8-6858h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-68582default:default2
1002default:defaultZ17-14h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 3120.355 ; gain = 562.723
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 3558.820 ; gain = 1001.188
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
~Finished Timing Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 3558.949 ; gain = 1001.316
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Technology Mapping : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 3578.062 ; gain = 1020.430
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
wFinished IO Insertion : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|      |Cell    |Count |
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|1     |IBUFGDS |     1|
2default:defaulth px� 
E
%s*synth2-
|2     |OBUF    |    80|
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
t
%s
*synth2\
HSynthesis finished with 0 errors, 648 critical warnings and 1 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:17 ; elapsed = 00:00:23 . Memory (MB): peak = 3583.801 ; gain = 920.516
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 3583.801 ; gain = 1026.168
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3583.8012default:default2
0.0002default:defaultZ17-268h px� 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
12default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3630.0472default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2v
b  A total of 1 instances were transformed.
  IBUFGDS => IBUFDS (DIFFINBUF, IBUFCTRL): 1 instance 
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
869ac5b22default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
422default:default2
342default:default2
2002default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:272default:default2
00:00:312default:default2
3630.0472default:default2
2216.1332default:defaultZ17-268h px� 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2d
PC:/Users/Boyang/Desktop/FPGA-Matrix-Accelerator/FIP/FIP.runs/synth_1/FIP_top.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2x
dExecuting : report_utilization -file FIP_top_utilization_synth.rpt -pb FIP_top_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue Mar 18 10:36:22 20252default:defaultZ17-206h px� 


End Record