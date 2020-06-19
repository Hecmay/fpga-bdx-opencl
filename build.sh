#!/bin/bash

# 1. Configure the ENV
source /export/fpga/bin/setup-opae-env fpga-pac-a10

# 2. Quartus Syn flow
afu_synth_setup --source hw/rtl/filelist.txt build_synth
cd build_synth
${OPAE_PLATFORM_ROOT}/bin/run.sh

# 3. Load the AFU into the partial reconfiguration region
fpgaconf eth_e2e_e40.gbs --bus 0x18
