> From: [eLinux.org](http://eLinux.org/PRUSSv2_Interrupts "http://eLinux.org/PRUSSv2_Interrupts")


# PRUSSv2 Interrupts



<table>
<thead>
<tr class="header">
<th align="left">Interrupt Number</th>
<th align="left">Signal Name (Non-Ethercat Mode)</th>
<th align="left">Source</th>
<th align="left">Signal Name (Ethercat Mode)</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">63</td>
<td align="left">tpcc_int_pend_po1</td>
<td align="left">TPCC (EDMA)</td>
<td align="left"></td>
<td align="left">A DMA request has completed</td>
</tr>
<tr class="even">
<td align="left">62</td>
<td align="left">tpcc_errint_pend_po</td>
<td align="left">TPCC (EDMA)</td>
<td align="left"></td>
<td align="left">A DMA error has occurred (see TPCC)</td>
</tr>
<tr class="odd">
<td align="left">61</td>
<td align="left">tptc_errint_pend_po</td>
<td align="left">TPCC (EDMA)</td>
<td align="left"></td>
<td align="left">A DMA error has occurred - TPTC0 only (see TPTC0)</td>
</tr>
<tr class="even">
<td align="left">60</td>
<td align="left">initiator_sinterrupt_q_n1</td>
<td align="left">Mbox0 - mail_u1_irq (mailbox interrupt for pru0)</td>
<td align="left"></td>
<td align="left">A message has been left in the mailbox for PRU0 (see <a href="http://elinux.org/index.php?title=Mailbox&amp;action=edit&amp;redlink=1" title="Mailbox (page does not exist)">Mailbox</a>)</td>
</tr>
<tr class="odd">
<td align="left">59</td>
<td align="left">initiator_sinterrupt_q_n2</td>
<td align="left">Mbox0 - mail_u2_irq (mailbox interrupt for pru1)</td>
<td align="left"></td>
<td align="left">A message has been left in the mailbox for PRU1 (see <a href="http://elinux.org/index.php?title=Mailbox&amp;action=edit&amp;redlink=1" title="Mailbox (page does not exist)">Mailbox</a>)</td>
</tr>
<tr class="even">
<td align="left">58</td>
<td align="left">Emulation Suspend Signal (software use)</td>
<td align="left">Debugss</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">57</td>
<td align="left">POINTRPEND1</td>
<td align="left">GPIO0</td>
<td align="left"></td>
<td align="left">Interrupt from level change on an external GPIO0 pin</td>
</tr>
<tr class="even">
<td align="left">56</td>
<td align="left">pwm_trip_zone</td>
<td align="left">eHRPWM0/eHRPWM1/eHRPWM2</td>
<td align="left"></td>
<td align="left">External fault occurred on eHRPWM0/1/2 (see Trip-zone)</td>
</tr>
<tr class="odd">
<td align="left">55</td>
<td align="left">mcasp_x_intr_pend</td>
<td align="left">McASP0 Tx</td>
<td align="left">pr1_mii1_crs(external)</td>
<td align="left">McASP is ready to receive data for transmitting</td>
</tr>
<tr class="even">
<td align="left">54</td>
<td align="left">mcasp_r_intr_pend</td>
<td align="left">McASP0 Rx</td>
<td align="left">PRU1_RX_EOF</td>
<td align="left">McASP has received an entire frame for processing</td>
</tr>
<tr class="odd">
<td align="left">53</td>
<td align="left">gen_intr_pend</td>
<td align="left">ADC_TSC</td>
<td align="left">MDIO_MII_LINK[1]</td>
<td align="left">A general interrupt occurred on the touch controller (check appropriate status register)</td>
</tr>
<tr class="even">
<td align="left">52</td>
<td align="left">nirq</td>
<td align="left">UART2</td>
<td align="left">PORT1_TX_OVERFLOW</td>
<td align="left">A general interrupt occurred on the UART2 (check appropriate status register)</td>
</tr>
<tr class="odd">
<td align="left">51</td>
<td align="left">nirq</td>
<td align="left">UART0</td>
<td align="left">PORT1_TX_UNDERFLOW</td>
<td align="left">A general interrupt occurred on the UART0 (check appropriate status register)</td>
</tr>
<tr class="even">
<td align="left">50</td>
<td align="left">c0_rx_thresh_pend</td>
<td align="left">3PGSW (GEMAC)</td>
<td align="left">PRU1_RX_OVERFLOW</td>
<td align="left">External Ethernet switch has passed its receive buffer threshold (ready for data to be retrieved)</td>
</tr>
<tr class="odd">
<td align="left">49</td>
<td align="left">c0_rx_pend</td>
<td align="left">3PGSW (GEMAC)</td>
<td align="left">PRU1_RX_NIBBLE_ODD</td>
<td align="left">External Ethernet switch has received a packet (should be acknowledged)</td>
</tr>
<tr class="even">
<td align="left">48</td>
<td align="left">c0_tx_pend</td>
<td align="left">3PGSW (GEMAC)</td>
<td align="left">PRU1_RX_CRC</td>
<td align="left">External Ethernet switch has transmitted a packet (should be acknowledged)</td>
</tr>
<tr class="odd">
<td align="left">47</td>
<td align="left">c0_misc_pend</td>
<td align="left">3PGSW (GEMAC)</td>
<td align="left">PRU1_RX_SOF</td>
<td align="left">A miscellaneous interrupt was triggered on the External Ethernet switch (see appropriate status register)</td>
</tr>
<tr class="even">
<td align="left">46</td>
<td align="left">epwm_intr_intr_pend</td>
<td align="left">eHRPWM1</td>
<td align="left">PRU1_RX_SFD</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">45</td>
<td align="left">eqep_intr_intr_pend</td>
<td align="left">eQEP0</td>
<td align="left">PRU1_RX_ERR32</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">44</td>
<td align="left">SINTERRUPTN</td>
<td align="left">McSPI0</td>
<td align="left">PRU1_RX_ERR</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">43</td>
<td align="left">eHRPWM0</td>
<td align="left">McASP0 Tx</td>
<td align="left">pr1_mii0_crs(external)</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">42</td>
<td align="left">ecap_intr_intr_pend</td>
<td align="left">eCAP0</td>
<td align="left">PRU0_RX_EOF</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">41</td>
<td align="left">POINTRPEND</td>
<td align="left">I2C0</td>
<td align="left">MDIO_MII_LINK[0]</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">40</td>
<td align="left">dcan_intr</td>
<td align="left">DCAN0</td>
<td align="left">PORT0_TX_OVERFLOW</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">39</td>
<td align="left">dcan_int1</td>
<td align="left">DCAN0</td>
<td align="left">PORT0_TX_UNDERFLOW</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">38</td>
<td align="left">dcan_uerr</td>
<td align="left">DCAN0</td>
<td align="left">PRU0_RX_OVERFLOW</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">37</td>
<td align="left">epwm_intr_intr_pend</td>
<td align="left">eHRPWM2</td>
<td align="left">PRU0_RX_NIBBLE_ODD</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">36</td>
<td align="left">ecap_intr_intr_pend</td>
<td align="left">eCAP2</td>
<td align="left">PRU0_RX_CRC</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">35</td>
<td align="left">ecap_intr_intr_pend</td>
<td align="left">eCAP1</td>
<td align="left">PRU0_RX_SOF</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">34</td>
<td align="left">mcasp_r_intr_pend</td>
<td align="left">McASP1 Rx</td>
<td align="left">PRU0_RX_SFD</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">33</td>
<td align="left">mcasp_x_intr_pend</td>
<td align="left">McASP1 Tx</td>
<td align="left">PRU0_RX_ERR32</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">32</td>
<td align="left">nirq</td>
<td align="left">UART1</td>
<td align="left">PRU0_RX_ERR</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">31</td>
<td align="left">pr1_pru_mst_intr[15]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">30</td>
<td align="left">pr1_pru_mst_intr[14]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">29</td>
<td align="left">pr1_pru_mst_intr[13]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">28</td>
<td align="left">pr1_pru_mst_intr[12]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">27</td>
<td align="left">pr1_pru_mst_intr[11]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">26</td>
<td align="left">pr1_pru_mst_intr[10]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">25</td>
<td align="left">pr1_pru_mst_intr[9]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">24</td>
<td align="left">pr1_pru_mst_intr[8]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">23</td>
<td align="left">pr1_pru_mst_intr[7]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">22</td>
<td align="left">pr1_pru_mst_intr[6]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">21</td>
<td align="left">pr1_pru_mst_intr[5]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">20</td>
<td align="left">pr1_pru_mst_intr[4]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">19</td>
<td align="left">pr1_pru_mst_intr[3]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">18</td>
<td align="left">pr1_pru_mst_intr[2]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">17</td>
<td align="left">pr1_pru_mst_intr[1]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">16</td>
<td align="left">pr1_pru_mst_intr[0]_intr_req</td>
<td align="left">pru0 or pru1</td>
<td align="left">PRUSS Internal Interrupts</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">15</td>
<td align="left">pr1_ecap_intr_req</td>
<td align="left">PRUSS eCAP</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">14</td>
<td align="left">sync0_out_pend</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">13</td>
<td align="left">sync1_out_pend</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">12</td>
<td align="left">latch0_in(input to PRUSS)</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">11</td>
<td align="left">latch1_in(input to PRUSS)</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">10</td>
<td align="left">pdi_wd_exp_pend</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">9</td>
<td align="left">pd_wd_exp_pend</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">8</td>
<td align="left">digio_event_req</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">7</td>
<td align="left">pr1_iep_tim_cap_cmp_pend</td>
<td align="left">PRUSS IEP (Ethercat)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">6</td>
<td align="left">pr1_uart_uint_intr_req</td>
<td align="left">PRUSS UART</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">5</td>
<td align="left">pr1_uart_utxevt_intr_req</td>
<td align="left">PRUSS UART</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">pr1_uart_urxevt_intr_req</td>
<td align="left">PRUSS UART</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">pr1_xfr_timeout</td>
<td align="left">PRUSS Scratch Pad</td>
<td align="left"></td>
<td align="left">Simultaneous Scratch Pad access from both PRUs caused access time-out after 1024 cycles</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">pr1_pru1_r31_status_cnt16</td>
<td align="left">PRU1 (Shift Capture)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">1</td>
<td align="left">pr1_pru0_r31_status_cnt16</td>
<td align="left">PRU0 (Shift Capture)</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">0</td>
<td align="left">pr1_parity_err_intr_pend</td>
<td align="left">PRUSS Parity Logic</td>
<td align="left"></td>
<td align="left"> ?</td>
</tr>
</tbody>
</table>


