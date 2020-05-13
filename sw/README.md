## E40 HSSI Library
The E40 HSSI Library provides user-space APIs for configuring the 40G Ethernet MAC, traffic generator and checker
included with the 40G reference AFU design. These APIs are useful for integrating the 40G reference design 
with networking applications. In addition to the library, the "sw" folder includes 
a simple tool (pac_hssi_e40) that utilizes 
the E40 library for enumerating E40 instances, enabling/disabling
channel loopback, transmitting packets and displaying channel statistics. This tool is described in the next section.

The user must configure transceiver channels in 40G mode by 
loading the kernel-mode driver before using the library. See instructions in the next section. 

For the purposes of describing the library, we will
assume that the HSSI device consists of a single 40G MAC channel, traffic generator and checker.

The library provides several utility functions:

* fpgaHssiOpen: Open the HSSI device and create a handle, verify device ID, map control and status registers to host 
address space. 

* fpgaHssiClose: Close the device handle and unmap MMIO

* fpgaHssiReset: Reset TX, RX channels and CSRs

* fpgaHssiFilterCsrByName: Retrieve CSR handle by using the CSR name string as a filter. The CSR name string can be
found in the Low Latency 40 and 100-Gbps Ethernet MAC and PHY MegaCore Function User
Guide. CSR descriptions can be found in sw/fpga_hssi_e40.h.

* fpgaHssiFilterCsrByOffset: Retrieve CSR handle using the CSR offset as a filter. The CSR offset can be
found in the Low Latency 40 and 100-Gbps Ethernet MAC and PHY MegaCore Function User
Guide.

* fpgaHssiWriteCsr64: Write a 64-bit value to the CSR referenced by its handle.

* fpgaHssiReadCsr64: Read a 64-bit value from the CSR referenced by its handle.

* fpgaHssiCtrlLoopback: Enable internal loopback on a channel referenced by it's index.

* fpgaHssiGetLoopbackStatus: Query channel's internal loopback status referenced by it's index.

* fpgaHssiGetFreqLockStatus: Query channel's frequency lock status referenced by it's index.

* fpgaHssiGetWordLockStatus: Query channel's word lock status referenced by it's index.

* fpgaHssiSendPacket: Transmit aribtrary number of 1500-byte packets on the channel referenced by it's index.
Packet data is generated from the internal traffic generator.

* fpgaHssiPrintChannelStats: Pretty-print TX and RX MAC CSRs for a channel referenced by it's index.

* fpgaHssiClearChannelStats: Reset TX and RX MAC CSRs for a channel referenced by it's index.

The following code-snippet demonstrates two ways of reading MAC CSRs.

```
fpga_handle afc_h;
hssi_csr phy_revid_csr;
fpga_hssi_handle hssi;
uint64_t val;

fpgaHssiOpen(afc_h, &hssi_h);

// retrieve CSR handle by name
fpgaHssiFilterCsrByName(hssi, "PHY_REVID", &phy_revid_csr);

// retrieve CSR handle by offset
fpgaHssiFilterCsrByOffset(hssi, 0x0300, &phy_revid_csr);

fpgaHssiReadCsr64(hssi,	phy_revid_csr, &val);
```

## pac_hssi_e40
pac_hssi_e40 is a reference tool that demonstrates capabilities of the E40 HSSI library. It can be used to
enumerate available E40 instances in the system, enable/disable channel loopback, transmit packets and 
display channel statistics.

### Compile pac_hssi_e40
Compile the application and the library by running "make" under sw
```
$ make
```
You will see fpga_hssi_e40.so (HSSI E40 library) and pac_hssi_e40 executable under sw after successful compile.
Users may utilize the shared library to integrate the 40G reference design into networking applications. 
pac_hssi_e40 is provided as a tool to sanity-test the design.

### Run pac_hssi_e40

* Before running the application, transceiver channels must be configured in 40G mode. All driver RPMs must
be properly installed before this step. Configure the transceiver channel into 40G mode by writing the 
string "40" to the following sysfs entry.
```
$ sudo sh -c "echo 40 > /sys/class/fpga/intel-fpga-dev.0/intel-fpga-fme.0/intel-pac-hssi.2.auto/hssi_mgmt/config"
```

In order to allow regular (non-root) users to access the E40 AFU instance, grant read+write privileges to the port (/dev/intel-fpga-port.\*) where
\* denotes the respective socket. In the example below, read writes privileges are provided to regular users on port 0.
```
$ sudo chmod 666 /dev/intel-fpga-port.0
```

With the driver properly configured, one can use the pac_hssi_e40 tool. 

Usage:
```
pac_hssi_e40 [-h] [-b <bus>] [-d <device>] [-f <function>] -c channel -a action

-h,--help      Print this help
-b,--bus       Set target bus number
-d,--device    Set target device number
-f,--function  Set target function number 
-c,--channel   Set HSSI channel (0 - 3) 
-a,--action    Perform action:
               
               stat              Print channel statistics
               stat_clear        Clear channel statistics
               loopback_enable   Enable internal channel loopback
               loopback_disable  Disable internal channel loopback
               pkt_send          Send 0x10000 packets
```

Note: Bus, Device and Function numbers are optional when the system has only one PAC card.

* Enable internal loopback on B:D:F 00:0a:0b, channel 0
```
$ pac_hssi_e40 -b 00 -d 0a -f 0b --channel=0 --action=loopback_enable
```

Sample output on a 1-card system
```
Enabled loopback on channel 0
```

* Transmit 0x1000 packets
```
$ pac_hssi_e40 -b 00 -d 0a -f 0b --channel=0 --action=pkt_send
```

Sample output on a 1-card system
```
Sent 0x10000 packets on channel 0
```

* Print PHY, transmit and receive statistics
```
$ pac_hssi_e40 -b 00 -d 0a -f 0b --channel=0 --action=stat
```

Sample output on a 1-card system
```
CHANNEL STATISTICS
----------------------------------------------------------------------------------------------------
OFFSET  |NAME         |VALUE               |DESCRIPTION
----------------------------------------------------------------------------------------------------
0x300   |PHY_REVID    |0x2062015           |IP core PHY module revision ID
0x301   |PHY_SCRATCH  |0xffffffff          |Scratch register available for testing
..
..
CHANNEL STATISTICS
----------------------------------------------------------------------------------------------------
OFFSET  |NAME                  |VALUE|DESCRIPTION
----------------------------------------------------------------------------------------------------
0x800   |CNTR_TX_FRAGMENTS_LO  |0    |#TX frames < 64 bytes and reporting a CRC error (lower 32 bits)
0x801   |CNTR_TX_FRAGMENTS_HI  |0    |#TX frames < 64 bytes and reporting a CRC error (upper 32 bits)
..
..
CHANNEL STATISTICS
----------------------------------------------------------------------------------------------------
OFFSET  |NAME                 |VALUE |DESCRIPTION
----------------------------------------------------------------------------------------------------
0x900   |CNTR_RX_FRAGMENTS_LO |0     |#RX frames < 64 bytes and reporting a CRC error (lower 32 bits)
0x901   |CNTR_RX_FRAGMENTS_HI |0     |#RX frames < 64 bytes and reporting a CRC error (upper 32 bits)
..
..
```

* Clear PHY, transmit and receive statistics
```
$ pac_hssi_e40 -b 00 -d 0a -f 0b --channel=0 --action=stat_clear
```

Sample output on a 1-card system:
```
Cleared TX stats on channel 0
Cleared RX stats on channel 0
```

* Disable internal loopback
```
$ pac_hssi_e40 -b 00 -d 0a -f 0b --channel=0 --action=loopback_disable
```

Sample output on a 1-card system:
```
Disabled loopback on channel 0
```

## ASE Simulation
ASE Simulation is not supported for E40 AFU