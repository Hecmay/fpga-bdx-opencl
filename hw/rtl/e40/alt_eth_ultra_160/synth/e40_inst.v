	e40 u0 (
		.clk_ref               (<connected-to-clk_ref>),               //              clk_ref.clk_ref
		.reset_async           (<connected-to-reset_async>),           //          reset_async.reset_async
		.rx_serial             (<connected-to-rx_serial>),             //            rx_serial.rx_serial
		.tx_serial             (<connected-to-tx_serial>),             //            tx_serial.tx_serial
		.clk_status            (<connected-to-clk_status>),            //           clk_status.clk_status
		.reset_status          (<connected-to-reset_status>),          //         reset_status.reset_status
		.status_write          (<connected-to-status_write>),          //          status_avmm.status_write
		.status_read           (<connected-to-status_read>),           //                     .status_read
		.status_addr           (<connected-to-status_addr>),           //                     .status_addr
		.status_writedata      (<connected-to-status_writedata>),      //                     .status_writedata
		.status_readdata       (<connected-to-status_readdata>),       //                     .status_readdata
		.status_readdata_valid (<connected-to-status_readdata_valid>), //                     .status_readdata_valid
		.status_waitrequest    (<connected-to-status_waitrequest>),    //                     .status_waitrequest
		.status_read_timeout   (<connected-to-status_read_timeout>),   //                     .status_read_timeout
		.clk_txmac             (<connected-to-clk_txmac>),             //            clk_txmac.clk_txmac
		.tx_lanes_stable       (<connected-to-tx_lanes_stable>),       //      tx_lanes_stable.tx_lanes_stable
		.rx_pcs_ready          (<connected-to-rx_pcs_ready>),          //         rx_pcs_ready.rx_pcs_ready
		.clk_rxmac             (<connected-to-clk_rxmac>),             //            clk_rxmac.clk_rxmac
		.rx_inc_octetsOK       (<connected-to-rx_inc_octetsOK>),       //             rx_stats.rx_inc_octetsOK
		.rx_inc_octetsOK_valid (<connected-to-rx_inc_octetsOK_valid>), //                     .rx_inc_octetsOK_valid
		.rx_inc_runt           (<connected-to-rx_inc_runt>),           //                     .rx_inc_runt
		.rx_inc_64             (<connected-to-rx_inc_64>),             //                     .rx_inc_64
		.rx_inc_127            (<connected-to-rx_inc_127>),            //                     .rx_inc_127
		.rx_inc_255            (<connected-to-rx_inc_255>),            //                     .rx_inc_255
		.rx_inc_511            (<connected-to-rx_inc_511>),            //                     .rx_inc_511
		.rx_inc_1023           (<connected-to-rx_inc_1023>),           //                     .rx_inc_1023
		.rx_inc_1518           (<connected-to-rx_inc_1518>),           //                     .rx_inc_1518
		.rx_inc_max            (<connected-to-rx_inc_max>),            //                     .rx_inc_max
		.rx_inc_over           (<connected-to-rx_inc_over>),           //                     .rx_inc_over
		.rx_inc_mcast_data_err (<connected-to-rx_inc_mcast_data_err>), //                     .rx_inc_mcast_data_err
		.rx_inc_mcast_data_ok  (<connected-to-rx_inc_mcast_data_ok>),  //                     .rx_inc_mcast_data_ok
		.rx_inc_bcast_data_err (<connected-to-rx_inc_bcast_data_err>), //                     .rx_inc_bcast_data_err
		.rx_inc_bcast_data_ok  (<connected-to-rx_inc_bcast_data_ok>),  //                     .rx_inc_bcast_data_ok
		.rx_inc_ucast_data_err (<connected-to-rx_inc_ucast_data_err>), //                     .rx_inc_ucast_data_err
		.rx_inc_ucast_data_ok  (<connected-to-rx_inc_ucast_data_ok>),  //                     .rx_inc_ucast_data_ok
		.rx_inc_mcast_ctrl     (<connected-to-rx_inc_mcast_ctrl>),     //                     .rx_inc_mcast_ctrl
		.rx_inc_bcast_ctrl     (<connected-to-rx_inc_bcast_ctrl>),     //                     .rx_inc_bcast_ctrl
		.rx_inc_ucast_ctrl     (<connected-to-rx_inc_ucast_ctrl>),     //                     .rx_inc_ucast_ctrl
		.rx_inc_pause          (<connected-to-rx_inc_pause>),          //                     .rx_inc_pause
		.rx_inc_fcs_err        (<connected-to-rx_inc_fcs_err>),        //                     .rx_inc_fcs_err
		.rx_inc_fragment       (<connected-to-rx_inc_fragment>),       //                     .rx_inc_fragment
		.rx_inc_jabber         (<connected-to-rx_inc_jabber>),         //                     .rx_inc_jabber
		.rx_inc_sizeok_fcserr  (<connected-to-rx_inc_sizeok_fcserr>),  //                     .rx_inc_sizeok_fcserr
		.rx_inc_pause_ctrl_err (<connected-to-rx_inc_pause_ctrl_err>), //                     .rx_inc_pause_ctrl_err
		.rx_inc_mcast_ctrl_err (<connected-to-rx_inc_mcast_ctrl_err>), //                     .rx_inc_mcast_ctrl_err
		.rx_inc_bcast_ctrl_err (<connected-to-rx_inc_bcast_ctrl_err>), //                     .rx_inc_bcast_ctrl_err
		.rx_inc_ucast_ctrl_err (<connected-to-rx_inc_ucast_ctrl_err>), //                     .rx_inc_ucast_ctrl_err
		.tx_inc_octetsOK       (<connected-to-tx_inc_octetsOK>),       //             tx_stats.tx_inc_octetsOK
		.tx_inc_octetsOK_valid (<connected-to-tx_inc_octetsOK_valid>), //                     .tx_inc_octetsOK_valid
		.tx_inc_64             (<connected-to-tx_inc_64>),             //                     .tx_inc_64
		.tx_inc_127            (<connected-to-tx_inc_127>),            //                     .tx_inc_127
		.tx_inc_255            (<connected-to-tx_inc_255>),            //                     .tx_inc_255
		.tx_inc_511            (<connected-to-tx_inc_511>),            //                     .tx_inc_511
		.tx_inc_1023           (<connected-to-tx_inc_1023>),           //                     .tx_inc_1023
		.tx_inc_1518           (<connected-to-tx_inc_1518>),           //                     .tx_inc_1518
		.tx_inc_max            (<connected-to-tx_inc_max>),            //                     .tx_inc_max
		.tx_inc_over           (<connected-to-tx_inc_over>),           //                     .tx_inc_over
		.tx_inc_mcast_data_err (<connected-to-tx_inc_mcast_data_err>), //                     .tx_inc_mcast_data_err
		.tx_inc_mcast_data_ok  (<connected-to-tx_inc_mcast_data_ok>),  //                     .tx_inc_mcast_data_ok
		.tx_inc_bcast_data_err (<connected-to-tx_inc_bcast_data_err>), //                     .tx_inc_bcast_data_err
		.tx_inc_bcast_data_ok  (<connected-to-tx_inc_bcast_data_ok>),  //                     .tx_inc_bcast_data_ok
		.tx_inc_ucast_data_err (<connected-to-tx_inc_ucast_data_err>), //                     .tx_inc_ucast_data_err
		.tx_inc_ucast_data_ok  (<connected-to-tx_inc_ucast_data_ok>),  //                     .tx_inc_ucast_data_ok
		.tx_inc_mcast_ctrl     (<connected-to-tx_inc_mcast_ctrl>),     //                     .tx_inc_mcast_ctrl
		.tx_inc_bcast_ctrl     (<connected-to-tx_inc_bcast_ctrl>),     //                     .tx_inc_bcast_ctrl
		.tx_inc_ucast_ctrl     (<connected-to-tx_inc_ucast_ctrl>),     //                     .tx_inc_ucast_ctrl
		.tx_inc_pause          (<connected-to-tx_inc_pause>),          //                     .tx_inc_pause
		.tx_inc_fcs_err        (<connected-to-tx_inc_fcs_err>),        //                     .tx_inc_fcs_err
		.tx_inc_fragment       (<connected-to-tx_inc_fragment>),       //                     .tx_inc_fragment
		.tx_inc_jabber         (<connected-to-tx_inc_jabber>),         //                     .tx_inc_jabber
		.tx_inc_sizeok_fcserr  (<connected-to-tx_inc_sizeok_fcserr>),  //                     .tx_inc_sizeok_fcserr
		.reconfig_clk          (<connected-to-reconfig_clk>),          //         reconfig_clk.reconfig_clk
		.reconfig_reset        (<connected-to-reconfig_reset>),        //       reconfig_reset.reconfig_reset
		.reconfig_write        (<connected-to-reconfig_write>),        //       reconfig_write.reconfig_write
		.reconfig_read         (<connected-to-reconfig_read>),         //        reconfig_read.reconfig_read
		.reconfig_address      (<connected-to-reconfig_address>),      //     reconfig_address.reconfig_address
		.reconfig_writedata    (<connected-to-reconfig_writedata>),    //   reconfig_writedata.reconfig_writedata
		.reconfig_readdata     (<connected-to-reconfig_readdata>),     //    reconfig_readdata.reconfig_readdata
		.reconfig_waitrequest  (<connected-to-reconfig_waitrequest>),  // reconfig_waitrequest.reconfig_waitrequest
		.tx_serial_clk         (<connected-to-tx_serial_clk>),         //        tx_serial_clk.tx_serial_clk
		.tx_pll_locked         (<connected-to-tx_pll_locked>),         //        tx_pll_locked.tx_pll_locked
		.din_sop               (<connected-to-din_sop>),               //         custom_st_tx.din_sop
		.din_eop               (<connected-to-din_eop>),               //                     .din_eop
		.din_idle              (<connected-to-din_idle>),              //                     .din_idle
		.din_eop_empty         (<connected-to-din_eop_empty>),         //                     .din_eop_empty
		.din                   (<connected-to-din>),                   //                     .din
		.din_req               (<connected-to-din_req>),               //                     .din_req
		.tx_error              (<connected-to-tx_error>),              //                     .tx_error
		.dout_valid            (<connected-to-dout_valid>),            //         custom_st_rx.dout_valid
		.dout_d                (<connected-to-dout_d>),                //                     .dout_d
		.dout_c                (<connected-to-dout_c>),                //                     .dout_c
		.dout_sop              (<connected-to-dout_sop>),              //                     .dout_sop
		.dout_eop              (<connected-to-dout_eop>),              //                     .dout_eop
		.dout_eop_empty        (<connected-to-dout_eop_empty>),        //                     .dout_eop_empty
		.dout_idle             (<connected-to-dout_idle>),             //                     .dout_idle
		.rx_error              (<connected-to-rx_error>),              //                     .rx_error
		.rx_status             (<connected-to-rx_status>),             //                     .rx_status
		.rx_fcs_error          (<connected-to-rx_fcs_error>),          //                     .rx_fcs_error
		.rx_fcs_valid          (<connected-to-rx_fcs_valid>)           //                     .rx_fcs_valid
	);

