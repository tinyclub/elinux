> From: [eLinux.org](http://eLinux.org/KftDoForkTrace "http://eLinux.org/KftDoForkTrace")


# KftDoForkTrace



Here is a full trace of do\_fork() from a PPC440g system.

    Entry      Duration   Local       Pid    Trace
    ---------- ---------- ---------- ------- ---------------------------------
            4      20428        209      33 do_fork
            7          6          6      33 |  alloc_pidmap
           18       2643         84      33 |  copy_process
           21        114         19      33 |  |  dup_task_struct
           24          8          6      33 |  |  |  prepare_to_copy
           27          2          2      33 |  |  |  |  sub_preempt_count
           35         22          9      33 |  |  |  kmem_cache_alloc
           38          2          2      33 |  |  |  |  __might_sleep
           43         11          9      33 |  |  |  |  cache_alloc_refill
           49          2          2      33 |  |  |  |  |  sub_preempt_count
           60         65          6      33 |  |  |  __get_free_pages
           63         59         14      33 |  |  |  |  __alloc_pages
           65          3          3      33 |  |  |  |  |  __might_sleep
           71          3          3      33 |  |  |  |  |  zone_watermark_ok
           77         37         17      33 |  |  |  |  |  buffered_rmqueue
           80          4          4      33 |  |  |  |  |  |  __rmqueue
           86          3          3      33 |  |  |  |  |  |  sub_preempt_count
           92          3          3      33 |  |  |  |  |  |  bad_range
           98          2          2      33 |  |  |  |  |  |  __mod_page_state
          103          8          5      33 |  |  |  |  |  |  prep_new_page
          106          3          3      33 |  |  |  |  |  |  |  set_page_refs
          117          2          2      33 |  |  |  |  |  zone_statistics
          141         25          4      33 |  |  do_posix_clock_monotonic_gettime
          143         21          6      33 |  |  |  do_posix_clock_monotonic_get
          146         15          6      33 |  |  |  |  do_posix_clock_monotonic_gettime_parts
          149          9          6      33 |  |  |  |  |  getnstimeofday
          152          3          3      33 |  |  |  |  |  |  do_gettimeofday
          169          3          3      33 |  |  copy_semundo
          174         41         17      33 |  |  copy_files
          177         19          9      33 |  |  |  kmem_cache_alloc
          180          2          2      33 |  |  |  |  __might_sleep
          185          8          5      33 |  |  |  |  cache_alloc_refill
          188          3          3      33 |  |  |  |  |  sub_preempt_count
          200          3          3      33 |  |  |  count_open_files
          209          2          2      33 |  |  |  sub_preempt_count
          218         19          8      33 |  |  kmem_cache_alloc
          220          2          2      33 |  |  |  __might_sleep
          225          9          6      33 |  |  |  cache_alloc_refill
          229          3          3      33 |  |  |  |  sub_preempt_count
          241          2          2      33 |  |  sub_preempt_count
          246        216          9      33 |  |  kmem_cache_alloc
          249        199        199      33 |  |  |  __might_sleep
    ----------- !!!! start --------------
          253        151         63      33 timer_interrupt
          256          8          6      -1 !  profile_tick
          259          2          2      -1 !  !  profile_hit
          267         61         15      -1 !  update_process_times
          270          8          5      -1 !  !  account_system_time
          273          3          3      -1 !  !  !  update_mem_hiwater
          281          8          5      -1 !  !  run_local_timers
          284          3          3      -1 !  !  !  raise_softirq
          293         27         16      -1 !  !  scheduler_tick
          295          3          3      -1 !  !  !  sched_clock
          304          2          2      -1 !  !  !  requeue_task
          309          3          3      -1 !  !  !  sub_preempt_count
          314          3          3      -1 !  !  !  preempt_schedule
          322          3          3      -1 !  !  run_posix_cpu_timers
          331         15          6      -1 !  do_timer
          334          9          6      -1 !  !  update_wall_time
          337          3          3      -1 !  !  !  update_wall_time_one_tick
          349          2          2      -1 !  sub_preempt_count
          354          2          2      -1 !  preempt_schedule
    ----------- !!!! end ----------------
    ----------- @@@@ start --------------
          359         -1         -1      -1 sub_preempt_count
    ----------- @@@@ end ----------------
    ----------- [[[[ start --------------
          365         32          6      33 do_softirq
          368         26         12      33 [  __do_softirq
          371         15         11      -1 [  [  run_timer_softirq
          376          2          2      -1 [  [  [  sub_preempt_count
          381          2          2      -1 [  [  [  preempt_schedule
          389         -1         -1      -1 [  [  sub_preempt_count
    ----------- [[[[ end ----------------
    ----------- #### start --------------
          399          3          3      33 sub_preempt_count
    ----------- #### end ----------------
    ----------- ;;;; start --------------
          408         37          9      33 preempt_schedule_irq
          411         26         17      33 ;  schedule
          413          2          2      33 ;  ;  profile_hit
          418          3          3      33 ;  ;  sched_clock
          427          2          2      33 ;  ;  sub_preempt_count
          432          2          2      33 ;  ;  sub_preempt_count
          440          2          2      33 ;  sub_preempt_count
    ----------- ;;;; end ----------------
          451          8          5      33 |  |  |  cache_alloc_refill
          454          3          3      33 |  |  |  |  sub_preempt_count
          475         18          6      33 |  |  kmem_cache_alloc
          477          3          3      33 |  |  |  __might_sleep
          482          9          7      33 |  |  |  cache_alloc_refill
          486          2          2      33 |  |  |  |  sub_preempt_count
          499          2          2      33 |  |  sub_preempt_count
          504       2071        471      33 |  |  copy_mm
          507         19          9      33 |  |  |  kmem_cache_alloc
          510          2          2      33 |  |  |  |  __might_sleep
          515          8          5      33 |  |  |  |  cache_alloc_refill
          518          3          3      33 |  |  |  |  |  sub_preempt_count
          533         78          8      33 |  |  |  mm_init
          538         70          6      33 |  |  |  |  pgd_alloc
          541         64          4      33 |  |  |  |  |  __get_free_pages
          543         60         12      33 |  |  |  |  |  |  __alloc_pages
          545          3          3      33 |  |  |  |  |  |  |  __might_sleep
          550          3          3      33 |  |  |  |  |  |  |  zone_watermark_ok
          555         40         23      33 |  |  |  |  |  |  |  buffered_rmqueue
          558          2          2      33 |  |  |  |  |  |  |  |  __rmqueue
          563          2          2      33 |  |  |  |  |  |  |  |  sub_preempt_count
          568          2          2      33 |  |  |  |  |  |  |  |  bad_range
          572          3          3      33 |  |  |  |  |  |  |  |  __mod_page_state
          577          8          6      33 |  |  |  |  |  |  |  |  prep_new_page
          580          2          2      33 |  |  |  |  |  |  |  |  |  set_page_refs
          598          2          2      33 |  |  |  |  |  |  |  zone_statistics
          614          2          2      33 |  |  |  __might_sleep
          620         20          9      33 |  |  |  kmem_cache_alloc
          623          2          2      33 |  |  |  |  __might_sleep
          628          9          6      33 |  |  |  |  cache_alloc_refill
          632          3          3      33 |  |  |  |  |  sub_preempt_count
          643          3          3      33 |  |  |  anon_vma_link
          650          3          3      33 |  |  |  vma_prio_tree_add
          656          2          2      33 |  |  |  sub_preempt_count
          662          7          4      33 |  |  |  __vma_link_rb
          664          3          3      33 |  |  |  |  rb_insert_color
          673        112          6      33 |  |  |  copy_page_range
          676        106         25      33 |  |  |  |  copy_pte_range
          678         75         12      33 |  |  |  |  |  pte_alloc_map
          681          3          3      33 |  |  |  |  |  |  sub_preempt_count
          687         57         10      33 |  |  |  |  |  |  pte_alloc_one
          689         47         10      33 |  |  |  |  |  |  |  __alloc_pages
          691          3          3      33 |  |  |  |  |  |  |  |  __might_sleep
          696          3          3      33 |  |  |  |  |  |  |  |  zone_watermark_ok
          701         28         13      33 |  |  |  |  |  |  |  |  buffered_rmqueue
          704          3          3      33 |  |  |  |  |  |  |  |  |  sub_preempt_count
          709          3          3      33 |  |  |  |  |  |  |  |  |  bad_range
          714          2          2      33 |  |  |  |  |  |  |  |  |  __mod_page_state
          719          7          4      33 |  |  |  |  |  |  |  |  |  prep_new_page
          721          3          3      33 |  |  |  |  |  |  |  |  |  |  set_page_refs
          731          3          3      33 |  |  |  |  |  |  |  |  zone_statistics
          747          3          3      33 |  |  |  |  |  |  __mod_page_state
          771          3          3      33 |  |  |  |  |  sub_preempt_count
          776          3          3      33 |  |  |  |  |  cond_resched_lock
          788          2          2      33 |  |  |  sub_preempt_count
          794         14          8      33 |  |  |  cap_vm_enough_memory
          796          3          3      33 |  |  |  |  cap_capable
          802          3          3      33 |  |  |  |  __vm_enough_memory
          810          7          4      33 |  |  |  kmem_cache_alloc
          812          3          3      33 |  |  |  |  __might_sleep
          820          9          7      33 |  |  |  anon_vma_link
          824          2          2      33 |  |  |  |  sub_preempt_count
          831          3          3      33 |  |  |  vma_prio_tree_add
          836          3          3      33 |  |  |  sub_preempt_count
          841          7          5      33 |  |  |  __vma_link_rb
          844          2          2      33 |  |  |  |  rb_insert_color
          851         24          5      33 |  |  |  copy_page_range
          853         19         11      33 |  |  |  |  copy_pte_range
          856          2          2      33 |  |  |  |  |  pte_alloc_map
          862          3          3      33 |  |  |  |  |  sub_preempt_count
          867          3          3      33 |  |  |  |  |  cond_resched_lock
          877          3          3      33 |  |  |  sub_preempt_count
          882         13          9      33 |  |  |  cap_vm_enough_memory
          885          2          2      33 |  |  |  |  cap_capable
          890          2          2      33 |  |  |  |  __vm_enough_memory
          897          7          4      33 |  |  |  kmem_cache_alloc
          899          3          3      33 |  |  |  |  __might_sleep
          907          8          5      33 |  |  |  anon_vma_link
          910          3          3      33 |  |  |  |  sub_preempt_count
          918         13          4      33 |  |  |  __vma_link_rb
          920          9          6      33 |  |  |  |  rb_insert_color
          923          3          3      33 |  |  |  |  |  __rb_rotate_left
          934         38          4      33 |  |  |  copy_page_range
          936         34         26      33 |  |  |  |  copy_pte_range
          938          3          3      33 |  |  |  |  |  pte_alloc_map
          960          3          3      33 |  |  |  |  |  sub_preempt_count
          965          2          2      33 |  |  |  |  |  cond_resched_lock
          975          2          2      33 |  |  |  sub_preempt_count
          980          7          4      33 |  |  |  kmem_cache_alloc
          982          3          3      33 |  |  |  |  __might_sleep
          990          3          3      33 |  |  |  anon_vma_link
          996          3          3      33 |  |  |  vma_prio_tree_add
         1001          3          3      33 |  |  |  sub_preempt_count
         1006          7          4      33 |  |  |  __vma_link_rb
         1008          3          3      33 |  |  |  |  rb_insert_color
         1016         97          6      33 |  |  |  copy_page_range
         1019         91         16      33 |  |  |  |  copy_pte_range
         1021         71         10      33 |  |  |  |  |  pte_alloc_map
         1023          3          3      33 |  |  |  |  |  |  sub_preempt_count
         1028         56         10      33 |  |  |  |  |  |  pte_alloc_one
         1031         46         12      33 |  |  |  |  |  |  |  __alloc_pages
         1033          2          2      33 |  |  |  |  |  |  |  |  __might_sleep
         1038          2          2      33 |  |  |  |  |  |  |  |  zone_watermark_ok
         1043         27         11      33 |  |  |  |  |  |  |  |  buffered_rmqueue
         1045          3          3      33 |  |  |  |  |  |  |  |  |  sub_preempt_count
         1050          3          3      33 |  |  |  |  |  |  |  |  |  bad_range
         1055          3          3      33 |  |  |  |  |  |  |  |  |  __mod_page_state
         1060          7          4      33 |  |  |  |  |  |  |  |  |  prep_new_page
         1062          3          3      33 |  |  |  |  |  |  |  |  |  |  set_page_refs
         1072          3          3      33 |  |  |  |  |  |  |  |  zone_statistics
         1087          2          2      33 |  |  |  |  |  |  __mod_page_state
         1100          2          2      33 |  |  |  |  |  sub_preempt_count
         1105          2          2      33 |  |  |  |  |  cond_resched_lock
         1115          3          3      33 |  |  |  sub_preempt_count
         1121         12          8      33 |  |  |  cap_vm_enough_memory
         1123          2          2      33 |  |  |  |  cap_capable
         1128          2          2      33 |  |  |  |  __vm_enough_memory
         1135          8          6      33 |  |  |  kmem_cache_alloc
         1138          2          2      33 |  |  |  |  __might_sleep
         1146          7          4      33 |  |  |  anon_vma_link
         1148          3          3      33 |  |  |  |  sub_preempt_count
         1156         12          4      33 |  |  |  __vma_link_rb
         1158          8          6      33 |  |  |  |  rb_insert_color
         1161          2          2      33 |  |  |  |  |  __rb_rotate_left
         1171         24          5      33 |  |  |  copy_page_range
         1173         19         12      33 |  |  |  |  copy_pte_range
         1176          2          2      33 |  |  |  |  |  pte_alloc_map
         1181          2          2      33 |  |  |  |  |  sub_preempt_count
         1187          3          3      33 |  |  |  |  |  cond_resched_lock
         1197          3          3      33 |  |  |  sub_preempt_count
         1202         12          8      33 |  |  |  cap_vm_enough_memory
         1205          2          2      33 |  |  |  |  cap_capable
         1210          2          2      33 |  |  |  |  __vm_enough_memory
         1217          7          4      33 |  |  |  kmem_cache_alloc
         1219          3          3      33 |  |  |  |  __might_sleep
         1227          8          5      33 |  |  |  anon_vma_link
         1230          3          3      33 |  |  |  |  sub_preempt_count
         1238          2          2      33 |  |  |  vma_prio_tree_add
         1243          2          2      33 |  |  |  sub_preempt_count
         1247        142          6      33 |  |  |  __vma_link_rb
         1250        136        136      33 |  |  |  |  rb_insert_color
    ----------- (((( start --------------
         1253        130         63      33 timer_interrupt
         1255          8          6      -1 (  profile_tick
         1258          2          2      -1 (  (  profile_hit
         1265         44         15      -1 (  update_process_times
         1268          7          4      -1 (  (  account_system_time
         1270          3          3      -1 (  (  (  update_mem_hiwater
         1278          7          4      -1 (  (  run_local_timers
         1280          3          3      -1 (  (  (  raise_softirq
         1288         13          8      -1 (  (  scheduler_tick
         1291          2          2      -1 (  (  (  sched_clock
         1296          3          3      -1 (  (  (  sub_preempt_count
         1304          2          2      -1 (  (  run_posix_cpu_timers
         1311         13          5      -1 (  do_timer
         1314          8          5      -1 (  (  update_wall_time
         1316          3          3      -1 (  (  (  update_wall_time_one_tick
         1327          2          2      -1 (  sub_preempt_count
    ----------- (((( end ----------------
    ----------- $$$$ start --------------
         1332         -1         -1      -1 sub_preempt_count
    ----------- $$$$ end ----------------
    ----------- //// start --------------
         1348         27          5      33 do_softirq
         1351         22         15      33 /  __do_softirq
         1353          8          5      -1 /  /  run_timer_softirq
         1356          3          3      -1 /  /  /  sub_preempt_count
         1363         -1         -1      -1 /  /  sub_preempt_count
    ----------- //// end ----------------
    ----------- {{'{{ start --------------
         1378          2          2      33 sub_preempt_count
    ----------- {{'{{ end ----------------
         1392         23          5      33 |  |  |  copy_page_range
         1394         18         10      33 |  |  |  |  copy_pte_range
         1397          2          2      33 |  |  |  |  |  pte_alloc_map
         1402          3          3      33 |  |  |  |  |  sub_preempt_count
         1407          3          3      33 |  |  |  |  |  cond_resched_lock
         1417          3          3      33 |  |  |  sub_preempt_count
         1422         12          7      33 |  |  |  cap_vm_enough_memory
         1425          2          2      33 |  |  |  |  cap_capable
         1429          3          3      33 |  |  |  |  __vm_enough_memory
         1437          7          4      33 |  |  |  kmem_cache_alloc
         1439          3          3      33 |  |  |  |  __might_sleep
         1447          8          6      33 |  |  |  anon_vma_link
         1450          2          2      33 |  |  |  |  sub_preempt_count
         1457         12          5      33 |  |  |  __vma_link_rb
         1460          7          4      33 |  |  |  |  rb_insert_color
         1462          3          3      33 |  |  |  |  |  __rb_rotate_left
         1472         23          5      33 |  |  |  copy_page_range
         1474         18         12      33 |  |  |  |  copy_pte_range
         1477          2          2      33 |  |  |  |  |  pte_alloc_map
         1483          2          2      33 |  |  |  |  |  sub_preempt_count
         1488          2          2      33 |  |  |  |  |  cond_resched_lock
         1497          3          3      33 |  |  |  sub_preempt_count
         1503          7          5      33 |  |  |  kmem_cache_alloc
         1505          2          2      33 |  |  |  |  __might_sleep
         1513          2          2      33 |  |  |  anon_vma_link
         1519          2          2      33 |  |  |  vma_prio_tree_add
         1524          2          2      33 |  |  |  sub_preempt_count
         1529         12          5      33 |  |  |  __vma_link_rb
         1531          7          5      33 |  |  |  |  rb_insert_color
         1534          2          2      33 |  |  |  |  |  __rb_rotate_left
         1543         24          5      33 |  |  |  copy_page_range
         1546         19         12      33 |  |  |  |  copy_pte_range
         1548          3          3      33 |  |  |  |  |  pte_alloc_map
         1555          2          2      33 |  |  |  |  |  sub_preempt_count
         1560          2          2      33 |  |  |  |  |  cond_resched_lock
         1570          2          2      33 |  |  |  sub_preempt_count
         1575         12          8      33 |  |  |  cap_vm_enough_memory
         1577          2          2      33 |  |  |  |  cap_capable
         1582          2          2      33 |  |  |  |  __vm_enough_memory
         1589          7          5      33 |  |  |  kmem_cache_alloc
         1592          2          2      33 |  |  |  |  __might_sleep
         1599          8          6      33 |  |  |  anon_vma_link
         1602          2          2      33 |  |  |  |  sub_preempt_count
         1610          2          2      33 |  |  |  vma_prio_tree_add
         1615          2          2      33 |  |  |  sub_preempt_count
         1620         12          5      33 |  |  |  __vma_link_rb
         1622          7          4      33 |  |  |  |  rb_insert_color
         1624          3          3      33 |  |  |  |  |  __rb_rotate_left
         1634         23          6      33 |  |  |  copy_page_range
         1637         17         10      33 |  |  |  |  copy_pte_range
         1639          2          2      33 |  |  |  |  |  pte_alloc_map
         1645          2          2      33 |  |  |  |  |  sub_preempt_count
         1649          3          3      33 |  |  |  |  |  cond_resched_lock
         1659          3          3      33 |  |  |  sub_preempt_count
         1664         13          9      33 |  |  |  cap_vm_enough_memory
         1667          2          2      33 |  |  |  |  cap_capable
         1672          2          2      33 |  |  |  |  __vm_enough_memory
         1679          7          4      33 |  |  |  kmem_cache_alloc
         1681          3          3      33 |  |  |  |  __might_sleep
         1689          3          3      33 |  |  |  anon_vma_link
         1694          8          6      33 |  |  |  __vma_link_rb
         1697          2          2      33 |  |  |  |  rb_insert_color
         1704         22          5      33 |  |  |  copy_page_range
         1707         17         10      33 |  |  |  |  copy_pte_range
         1709          2          2      33 |  |  |  |  |  pte_alloc_map
         1714          3          3      33 |  |  |  |  |  sub_preempt_count
         1719          2          2      33 |  |  |  |  |  cond_resched_lock
         1729          2          2      33 |  |  |  sub_preempt_count
         1734         12          7      33 |  |  |  cap_vm_enough_memory
         1736          3          3      33 |  |  |  |  cap_capable
         1741          2          2      33 |  |  |  |  __vm_enough_memory
         1748          8          6      33 |  |  |  kmem_cache_alloc
         1751          2          2      33 |  |  |  |  __might_sleep
         1759          7          4      33 |  |  |  anon_vma_link
         1761          3          3      33 |  |  |  |  sub_preempt_count
         1770          2          2      33 |  |  |  vma_prio_tree_add
         1774          3          3      33 |  |  |  sub_preempt_count
         1779         13          6      33 |  |  |  __vma_link_rb
         1782          7          4      33 |  |  |  |  rb_insert_color
         1784          3          3      33 |  |  |  |  |  __rb_rotate_left
         1794         43          6      33 |  |  |  copy_page_range
         1797         37         30      33 |  |  |  |  copy_pte_range
         1799          2          2      33 |  |  |  |  |  pte_alloc_map
         1824          3          3      33 |  |  |  |  |  sub_preempt_count
         1829          2          2      33 |  |  |  |  |  cond_resched_lock
         1839          2          2      33 |  |  |  sub_preempt_count
         1844         12          7      33 |  |  |  cap_vm_enough_memory
         1847          2          2      33 |  |  |  |  cap_capable
         1851          3          3      33 |  |  |  |  __vm_enough_memory
         1859          7          4      33 |  |  |  kmem_cache_alloc
         1861          3          3      33 |  |  |  |  __might_sleep
         1869          8          6      33 |  |  |  anon_vma_link
         1872          2          2      33 |  |  |  |  sub_preempt_count
         1879          3          3      33 |  |  |  vma_prio_tree_add
         1884          3          3      33 |  |  |  sub_preempt_count
         1889         13          6      33 |  |  |  __vma_link_rb
         1892          7          5      33 |  |  |  |  rb_insert_color
         1894          2          2      33 |  |  |  |  |  __rb_rotate_left
         1904         24          6      33 |  |  |  copy_page_range
         1907         18         12      33 |  |  |  |  copy_pte_range
         1909          2          2      33 |  |  |  |  |  pte_alloc_map
         1916          2          2      33 |  |  |  |  |  sub_preempt_count
         1921          2          2      33 |  |  |  |  |  cond_resched_lock
         1930          3          3      33 |  |  |  sub_preempt_count
         1936         12          8      33 |  |  |  cap_vm_enough_memory
         1938          2          2      33 |  |  |  |  cap_capable
         1943          2          2      33 |  |  |  |  __vm_enough_memory
         1950          7          4      33 |  |  |  kmem_cache_alloc
         1952          3          3      33 |  |  |  |  __might_sleep
         1960          8          6      33 |  |  |  anon_vma_link
         1963          2          2      33 |  |  |  |  sub_preempt_count
         1970         12          5      33 |  |  |  __vma_link_rb
         1973          7          5      33 |  |  |  |  rb_insert_color
         1975          2          2      33 |  |  |  |  |  __rb_rotate_left
         1985         26          4      33 |  |  |  copy_page_range
         1987         22         16      33 |  |  |  |  copy_pte_range
         1990          2          2      33 |  |  |  |  |  pte_alloc_map
         1999          2          2      33 |  |  |  |  |  sub_preempt_count
         2004          2          2      33 |  |  |  |  |  cond_resched_lock
         2014          2          2      33 |  |  |  sub_preempt_count
         2019          7          4      33 |  |  |  kmem_cache_alloc
         2021          3          3      33 |  |  |  |  __might_sleep
         2029          2          2      33 |  |  |  anon_vma_link
         2035          2          2      33 |  |  |  vma_prio_tree_add
         2040          2          2      33 |  |  |  sub_preempt_count
         2045          7          4      33 |  |  |  __vma_link_rb
         2047          3          3      33 |  |  |  |  rb_insert_color
         2055         23          5      33 |  |  |  copy_page_range
         2057         18         11      33 |  |  |  |  copy_pte_range
         2060          2          2      33 |  |  |  |  |  pte_alloc_map
         2066          2          2      33 |  |  |  |  |  sub_preempt_count
         2070          3          3      33 |  |  |  |  |  cond_resched_lock
         2080          3          3      33 |  |  |  sub_preempt_count
         2085         13          9      33 |  |  |  cap_vm_enough_memory
         2088          2          2      33 |  |  |  |  cap_capable
         2093          2          2      33 |  |  |  |  __vm_enough_memory
         2100          8          5      33 |  |  |  kmem_cache_alloc
         2102          3          3      33 |  |  |  |  __might_sleep
         2111          7          4      33 |  |  |  anon_vma_link
         2113          3          3      33 |  |  |  |  sub_preempt_count
         2121         12          5      33 |  |  |  __vma_link_rb
         2123          7          4      33 |  |  |  |  rb_insert_color
         2125          3          3      33 |  |  |  |  |  __rb_rotate_left
         2135         23          6      33 |  |  |  copy_page_range
         2138         17          9      33 |  |  |  |  copy_pte_range
         2140          3          3      33 |  |  |  |  |  pte_alloc_map
         2146          2          2      33 |  |  |  |  |  sub_preempt_count
         2150          3          3      33 |  |  |  |  |  cond_resched_lock
         2160          3          3      33 |  |  |  sub_preempt_count
         2165         13          9      33 |  |  |  cap_vm_enough_memory
         2168          2          2      33 |  |  |  |  cap_capable
         2173          2          2      33 |  |  |  |  __vm_enough_memory
         2180          7          4      33 |  |  |  kmem_cache_alloc
         2182          3          3      33 |  |  |  |  __might_sleep
         2190          8          6      33 |  |  |  anon_vma_link
         2193          2          2      33 |  |  |  |  sub_preempt_count
         2200          3          3      33 |  |  |  vma_prio_tree_add
         2205          3          3      33 |  |  |  sub_preempt_count
         2210         12          4      33 |  |  |  __vma_link_rb
         2212          8          6      33 |  |  |  |  rb_insert_color
         2215          2          2      33 |  |  |  |  |  __rb_rotate_left
         2225         23          5      33 |  |  |  copy_page_range
         2227         18         11      33 |  |  |  |  copy_pte_range
         2230          2          2      33 |  |  |  |  |  pte_alloc_map
         2235          3          3      33 |  |  |  |  |  sub_preempt_count
         2240          2          2      33 |  |  |  |  |  cond_resched_lock
    ----------- %%%% start --------------
         2250        131         66      33 timer_interrupt
         2253          7          4      -1 %  profile_tick
         2255          3          3      -1 %  %  profile_hit
         2263         42         13      -1 %  update_process_times
         2265          8          6      -1 %  %  account_system_time
         2268          2          2      -1 %  %  %  update_mem_hiwater
         2275          7          4      -1 %  %  run_local_timers
         2277          3          3      -1 %  %  %  raise_softirq
         2285         12          7      -1 %  %  scheduler_tick
         2287          3          3      -1 %  %  %  sched_clock
         2293          2          2      -1 %  %  %  sub_preempt_count
         2300          2          2      -1 %  %  run_posix_cpu_timers
         2307         13          6      -1 %  do_timer
         2310          7          4      -1 %  %  update_wall_time
         2312          3          3      -1 %  %  %  update_wall_time_one_tick
         2322          3          3      -1 %  sub_preempt_count
    ----------- %%%% end ----------------
    ----------- ]]]] start --------------
         2327         -1         -1      -1 sub_preempt_count
    ----------- ]]]] end ----------------
    ----------- **** start --------------
         2343         31          5      33 do_softirq
         2345         26         20      33 *  __do_softirq
         2348          7          5      -1 *  *  run_timer_softirq
         2351          2          2      -1 *  *  *  sub_preempt_count
         2358         -1         -1      -1 *  *  sub_preempt_count
    ----------- **** end ----------------
    ----------- )))) start --------------
         2376          3          3      33 sub_preempt_count
    ----------- )))) end ----------------
         2384          2          2      33 |  |  |  sub_preempt_count
         2389         12          6      33 |  |  |  cap_vm_enough_memory
         2391          3          3      33 |  |  |  |  cap_capable
         2396          3          3      33 |  |  |  |  __vm_enough_memory
         2404         18          7      33 |  |  |  kmem_cache_alloc
         2406          2          2      33 |  |  |  |  __might_sleep
         2411          9          7      33 |  |  |  |  cache_alloc_refill
         2415          2          2      33 |  |  |  |  |  sub_preempt_count
         2425          8          6      33 |  |  |  anon_vma_link
         2428          2          2      33 |  |  |  |  sub_preempt_count
         2435         13          6      33 |  |  |  __vma_link_rb
         2438          7          4      33 |  |  |  |  rb_insert_color
         2440          3          3      33 |  |  |  |  |  __rb_rotate_left
         2450        107          6      33 |  |  |  copy_page_range
         2453        101         19      33 |  |  |  |  copy_pte_range
         2455         77         12      33 |  |  |  |  |  pte_alloc_map
         2458          2          2      33 |  |  |  |  |  |  sub_preempt_count
         2463         61         14      33 |  |  |  |  |  |  pte_alloc_one
         2465         47         12      33 |  |  |  |  |  |  |  __alloc_pages
         2467          3          3      33 |  |  |  |  |  |  |  |  __might_sleep
         2473          2          2      33 |  |  |  |  |  |  |  |  zone_watermark_ok
         2478         27         11      33 |  |  |  |  |  |  |  |  buffered_rmqueue
         2480          3          3      33 |  |  |  |  |  |  |  |  |  sub_preempt_count
         2485          3          3      33 |  |  |  |  |  |  |  |  |  bad_range
         2490          3          3      33 |  |  |  |  |  |  |  |  |  __mod_page_state
         2495          7          5      33 |  |  |  |  |  |  |  |  |  prep_new_page
         2498          2          2      33 |  |  |  |  |  |  |  |  |  |  set_page_refs
         2507          3          3      33 |  |  |  |  |  |  |  |  zone_statistics
         2527          2          2      33 |  |  |  |  |  |  __mod_page_state
         2544          3          3      33 |  |  |  |  |  sub_preempt_count
         2549          2          2      33 |  |  |  |  |  cond_resched_lock
         2560          2          2      33 |  |  |  sub_preempt_count
         2578          3          3      33 |  |  copy_namespace
         2584          5          5      33 |  |  copy_thread
         2592          8          5      33 |  |  sched_fork
         2595          3          3      33 |  |  |  sched_clock
         2605          8          5      33 |  |  attach_pid
         2607          3          3      33 |  |  |  find_pid
         2616          7          4      33 |  |  attach_pid
         2618          3          3      33 |  |  |  find_pid
         2626          8          6      33 |  |  attach_pid
         2629          2          2      33 |  |  |  find_pid
         2637          7          4      33 |  |  attach_pid
         2639          3          3      33 |  |  |  find_pid
         2647          2          2      33 |  |  sub_preempt_count
         2664      17570        164      33 |  wake_up_new_task
         2668          3          3      33 |  |  effective_prio
         2675          3          3      33 |  |  sub_preempt_count
         2680      17400        165      33 |  |  preempt_schedule
         2683      17235        695      33 |  |  |  schedule
         2685          3          3      33 |  |  |  |  profile_hit
         2690          3          3      33 |  |  |  |  sched_clock
         2698      16534      16534      33 |  |  |  |  __switch_to
         2703          8          6     105 schedule_tail
         2706          2          2     105 &  sub_preempt_count
         2720        208         14     105 do_page_fault
         2723          3          3     105 :  __might_sleep
         2729          3          3     105 :  find_vma
         2736        188         11     105 :  handle_mm_fault
         2738          3          3     105 :  :  __mod_page_state
         2744          3          3     105 :  :  pte_alloc_map
         2750        171         39     105 :  :  do_wp_page
         2754          3          3     105 :  :  :  can_share_swap_page
         2759         14          9     105 :  :  :  unlock_page
         2762          3          3     105 :  :  :  :  page_waitqueue
         2768          2          2     105 :  :  :  :  __wake_up_bit
         2776          3          3     105 :  :  :  sub_preempt_count
         2782          7          4     105 :  :  :  anon_vma_prepare
         2784          3          3     105 :  :  :  :  __might_sleep
         2792         48         14     105 :  :  :  __alloc_pages
         2795          2          2     105 :  :  :  :  __might_sleep
         2800          2          2     105 :  :  :  :  zone_watermark_ok
         2805         28         15     105 :  :  :  :  buffered_rmqueue
         2808          2          2     105 :  :  :  :  :  sub_preempt_count
         2813          2          2     105 :  :  :  :  :  bad_range
         2818          2          2     105 :  :  :  :  :  __mod_page_state
         2823          7          4     105 :  :  :  :  :  prep_new_page
         2825          3          3     105 :  :  :  :  :  :  set_page_refs
         2835          2          2     105 :  :  :  :  zone_statistics
         2843         20         20     105 :  :  :  copy_user_page
         2867          2          2     105 :  :  :  page_remove_rmap
         2873         17         17     105 :  :  :  update_mmu_cache
         2893          8          6     105 :  :  :  lru_cache_add_active
         2896          2          2     105 :  :  :  :  sub_preempt_count
         2904          8          6     105 :  :  :  page_add_anon_rmap
         2907          2          2     105 :  :  :  :  __mod_page_state
         2916          2          2     105 :  :  :  sub_preempt_count
         2933        190         10     105 do_page_fault
         2935          3          3     105 \  __might_sleep
         2941          3          3     105 \  find_vma
         2946        174         11     105 \  handle_mm_fault
         2948          3          3     105 \  \  __mod_page_state
         2954          2          2     105 \  \  pte_alloc_map
         2959        158         29     105 \  \  do_wp_page
         2961          3          3     105 \  \  \  can_share_swap_page
         2966         12          6     105 \  \  \  unlock_page
         2968          3          3     105 \  \  \  \  page_waitqueue
         2973          3          3     105 \  \  \  \  __wake_up_bit
         2981          2          2     105 \  \  \  sub_preempt_count
         2986          7          5     105 \  \  \  anon_vma_prepare
         2988          2          2     105 \  \  \  \  __might_sleep
         2996         48         13     105 \  \  \  __alloc_pages
         2998          3          3     105 \  \  \  \  __might_sleep
         3003          3          3     105 \  \  \  \  zone_watermark_ok
         3009         27         10     105 \  \  \  \  buffered_rmqueue
         3011          3          3     105 \  \  \  \  \  sub_preempt_count
         3016          3          3     105 \  \  \  \  \  bad_range
         3021          3          3     105 \  \  \  \  \  __mod_page_state
         3026          8          6     105 \  \  \  \  \  prep_new_page
         3029          2          2     105 \  \  \  \  \  \  set_page_refs
         3039          2          2     105 \  \  \  \  zone_statistics
         3046         19         19     105 \  \  \  copy_user_page
         3068          3          3     105 \  \  \  page_remove_rmap
         3073         16         16     105 \  \  \  update_mmu_cache
         3091          8          6     105 \  \  \  lru_cache_add_active
         3094          2          2     105 \  \  \  \  sub_preempt_count
         3101          8          6     105 \  \  \  page_add_anon_rmap
         3104          2          2     105 \  \  \  \  __mod_page_state
         3111          3          3     105 \  \  \  sub_preempt_count
         3133        376         11     105 do_page_fault
         3136          2          2     105 }  __might_sleep
         3141          3          3     105 }  find_vma
         3146        360         13     105 }  handle_mm_fault
         3149          2          2     105 }  }  __mod_page_state
         3154          2          2     105 }  }  pte_alloc_map
         3159        343         29     105 }  }  do_wp_page
         3161          3          3     105 }  }  }  can_share_swap_page
         3166         12          6     105 }  }  }  unlock_page
         3168          3          3     105 }  }  }  }  page_waitqueue
         3173          3          3     105 }  }  }  }  __wake_up_bit
         3181          2          2     105 }  }  }  sub_preempt_count
         3186          7          5     105 }  }  }  anon_vma_prepare
         3188          2          2     105 }  }  }  }  __might_sleep
         3195         48         15     105 }  }  }  __alloc_pages
         3198          2          2     105 }  }  }  }  __might_sleep
         3203          2          2     105 }  }  }  }  zone_watermark_ok
         3208         27         11     105 }  }  }  }  buffered_rmqueue
         3211          2          2     105 }  }  }  }  }  sub_preempt_count
         3215          3          3     105 }  }  }  }  }  bad_range
         3220          3          3     105 }  }  }  }  }  __mod_page_state
         3225          8          6     105 }  }  }  }  }  prep_new_page
         3228          2          2     105 }  }  }  }  }  }  set_page_refs
         3238          2          2     105 }  }  }  }  zone_statistics
         3245        205        205     105 }  }  }  copy_user_page
    ----------- |||| start --------------
         3251        185        116     105 timer_interrupt
         3253          8          5      -1 |  profile_tick
         3256          3          3      -1 |  |  profile_hit
         3263         45         14      -1 |  update_process_times
         3266          8          6      -1 |  |  account_system_time
         3269          2          2      -1 |  |  |  update_mem_hiwater
         3276          8          6      -1 |  |  run_local_timers
         3279          2          2      -1 |  |  |  raise_softirq
         3287         13          7      -1 |  |  scheduler_tick
         3289          3          3      -1 |  |  |  sched_clock
         3295          3          3      -1 |  |  |  sub_preempt_count
         3303          2          2      -1 |  |  run_posix_cpu_timers
         3310         13          5      -1 |  do_timer
         3313          8          6      -1 |  |  update_wall_time
         3316          2          2      -1 |  |  |  update_wall_time_one_tick
         3326          3          3      -1 |  sub_preempt_count
    ----------- |||| end ----------------
    ----------- !!!! start --------------
         3331         -1         -1      -1 sub_preempt_count
    ----------- !!!! end ----------------
    ----------- @@@@ start --------------
         3389         40          5     105 do_softirq
         3391         35         28     105 @  __do_softirq
         3394          8          6      -1 @  @  run_timer_softirq
         3397          2          2      -1 @  @  @  sub_preempt_count
         3405         -1         -1      -1 @  @  sub_preempt_count
    ----------- @@@@ end ----------------
    ----------- [[[[ start --------------
         3431          2          2     105 sub_preempt_count
    ----------- [[[[ end ----------------
         3453          3          3     105 }  }  }  page_remove_rmap
         3458         16         16     105 }  }  }  update_mmu_cache
         3477          7          4     105 }  }  }  lru_cache_add_active
         3479          3          3     105 }  }  }  }  sub_preempt_count
         3486          8          6     105 }  }  }  page_add_anon_rmap
         3489          2          2     105 }  }  }  }  __mod_page_state
         3496          3          3     105 }  }  }  sub_preempt_count
         3515         19         11     105 do_page_fault
         3517          2          2     105 #  __might_sleep
         3522          3          3     105 #  find_vma
         3528          3          3     105 #  get_pteptr
         3545         17          7     105 sys_rt_sigaction
         3549         10          8     105 ;  do_sigaction
         3554          2          2     105 ;  ;  sub_preempt_count
         3567         12          4     105 sys_rt_sigaction
         3569          8          6     105 (  do_sigaction
         3572          2          2     105 (  (  sub_preempt_count
         3583         13          5     105 sys_rt_sigaction
         3586          8          5     105 $  do_sigaction
         3589          3          3     105 $  $  sub_preempt_count
         3602        186          9     105 do_page_fault
         3604          3          3     105 /  __might_sleep
         3609          3          3     105 /  find_vma
         3614        171         12     105 /  handle_mm_fault
         3617          2          2     105 /  /  __mod_page_state
         3622          2          2     105 /  /  pte_alloc_map
         3627        155         33     105 /  /  do_wp_page
         3629          3          3     105 /  /  /  can_share_swap_page
         3634         12          7     105 /  /  /  unlock_page
         3636          3          3     105 /  /  /  /  page_waitqueue
         3642          2          2     105 /  /  /  /  __wake_up_bit
         3649          2          2     105 /  /  /  sub_preempt_count
         3654          7          4     105 /  /  /  anon_vma_prepare
         3656          3          3     105 /  /  /  /  __might_sleep
         3664         49         13     105 /  /  /  __alloc_pages
         3666          2          2     105 /  /  /  /  __might_sleep
         3672          2          2     105 /  /  /  /  zone_watermark_ok
         3676         29         14     105 /  /  /  /  buffered_rmqueue
         3679          3          3     105 /  /  /  /  /  sub_preempt_count
         3684          3          3     105 /  /  /  /  /  bad_range
         3690          2          2     105 /  /  /  /  /  __mod_page_state
         3695          7          4     105 /  /  /  /  /  prep_new_page
         3697          3          3     105 /  /  /  /  /  /  set_page_refs
         3707          3          3     105 /  /  /  /  zone_statistics
         3715         16         16     105 /  /  /  copy_user_page
         3734          2          2     105 /  /  /  page_remove_rmap
         3739         15         15     105 /  /  /  update_mmu_cache
         3757          7          4     105 /  /  /  lru_cache_add_active
         3759          3          3     105 /  /  /  /  sub_preempt_count
         3767          7          4     105 /  /  /  page_add_anon_rmap
         3769          3          3     105 /  /  /  /  __mod_page_state
         3777          2          2     105 /  /  /  sub_preempt_count
         3803        183         11     105 do_page_fault
         3805          3          3     105 {  __might_sleep
         3810          3          3     105 {  find_vma
         3816        166         10     105 {  handle_mm_fault
         3818          2          2     105 {  {  __mod_page_state
         3823          2          2     105 {  {  pte_alloc_map
         3828        152         30     105 {  {  do_wp_page
         3831          2          2     105 {  {  {  can_share_swap_page
         3836         12          8     105 {  {  {  unlock_page
         3838          2          2     105 {  {  {  {  page_waitqueue
         3843          2          2     105 {  {  {  {  __wake_up_bit
         3850          3          3     105 {  {  {  sub_preempt_count
         3855          8          6     105 {  {  {  anon_vma_prepare
         3858          2          2     105 {  {  {  {  __might_sleep
         3865         47         12     105 {  {  {  __alloc_pages
         3867          3          3     105 {  {  {  {  __might_sleep
         3872          3          3     105 {  {  {  {  zone_watermark_ok
         3877         27         14     105 {  {  {  {  buffered_rmqueue
         3880          2          2     105 {  {  {  {  {  sub_preempt_count
         3885          2          2     105 {  {  {  {  {  bad_range
         3890          2          2     105 {  {  {  {  {  __mod_page_state
         3895          7          5     105 {  {  {  {  {  prep_new_page
         3897          2          2     105 {  {  {  {  {  {  set_page_refs
         3907          2          2     105 {  {  {  {  zone_statistics
         3914         15         15     105 {  {  {  copy_user_page
         3932          2          2     105 {  {  {  page_remove_rmap
         3937         15         15     105 {  {  {  update_mmu_cache
         3955          7          5     105 {  {  {  lru_cache_add_active
         3957          2          2     105 {  {  {  {  sub_preempt_count
         3964          8          6     105 {  {  {  page_add_anon_rmap
         3967          2          2     105 {  {  {  {  __mod_page_state
         3974          3          3     105 {  {  {  sub_preempt_count
         4000         -1          1     105 sys_execve
         4003         27          6     105 %  getname
         4006         21          8     105 %  %  kmem_cache_alloc
         4008          3          3     105 %  %  %  __might_sleep
         4014         10          7     105 %  %  %  cache_alloc_refill
         4019          3          3     105 %  %  %  %  sub_preempt_count
         4033          3          3     105 %  sub_preempt_count
         4039         -1          1     105 %  do_execve
         4041        148          9     105 %  %  kmem_cache_alloc
         4044          2          2     105 %  %  %  __might_sleep
         4049        137         13     105 %  %  %  cache_alloc_refill
         4052          2          2     105 %  %  %  %  sub_preempt_count
         4057        120         25     105 %  %  %  %  cache_grow
         4061          2          2     105 %  %  %  %  %  sub_preempt_count
         4066          3          3     105 %  %  %  %  %  kmem_flagcheck
         4071         58          9     105 %  %  %  %  %  kmem_getpages
         4074         47         12     105 %  %  %  %  %  %  __alloc_pages
         4076          3          3     105 %  %  %  %  %  %  %  __might_sleep
         4081          3          3     105 %  %  %  %  %  %  %  zone_watermark_ok
         4086         27         14     105 %  %  %  %  %  %  %  buffered_rmqueue
         4089          2          2     105 %  %  %  %  %  %  %  %  sub_preempt_count
         4094          2          2     105 %  %  %  %  %  %  %  %  bad_range
         4099          2          2     105 %  %  %  %  %  %  %  %  __mod_page_state
         4104          7          5     105 %  %  %  %  %  %  %  %  prep_new_page
         4106          2          2     105 %  %  %  %  %  %  %  %  %  set_page_refs
         4116          2          2     105 %  %  %  %  %  %  %  zone_statistics
         4124          2          2     105 %  %  %  %  %  %  __mod_page_state
         4132         25          5     105 %  %  %  %  %  alloc_slabmgmt
         4134         20          8     105 %  %  %  %  %  %  kmem_cache_alloc
         4137          2          2     105 %  %  %  %  %  %  %  __might_sleep
         4142         10          8     105 %  %  %  %  %  %  %  cache_alloc_refill
         4147          2          2     105 %  %  %  %  %  %  %  %  sub_preempt_count
         4160          2          2     105 %  %  %  %  %  set_slab_attr
         4165          3          3     105 %  %  %  %  %  cache_init_objs
         4172          2          2     105 %  %  %  %  %  sub_preempt_count
         4181          2          2     105 %  %  %  %  sub_preempt_count
         4192         -1          0     105 %  %  open_exec
         4195         -1          1     105 %  %  %  path_lookup
         4199          3          3     105 %  %  %  %  sub_preempt_count
         4205         -1          0     105 %  %  %  %  link_path_walk
         4208         -1          1     105 %  %  %  %  %  __link_path_walk
         4212        254          6     105 %  %  %  %  %  %  permission
         4215        248        226     105 %  %  %  %  %  %  %  nfs_permission
         4218          3          3     105 %  %  %  %  %  %  %  %  lock_kernel
         4224          8          5     105 %  %  %  %  %  %  %  %  nfs_revalidate_inode
         4227          3          3     105 %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
         4235          3          3     105 %  %  %  %  %  %  %  %  generic_permission
         4241          8          6     105 %  %  %  %  %  %  %  %  unlock_kernel
         4244          2          2     105 %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- ]]]] start --------------
         4253        206        133     105 timer_interrupt
         4256          8          6      -1 ]  profile_tick
         4259          2          2      -1 ]  ]  profile_hit
         4267         48         13      -1 ]  update_process_times
         4269          9          7      -1 ]  ]  account_system_time
         4273          2          2      -1 ]  ]  ]  update_mem_hiwater
         4281          8          5      -1 ]  ]  run_local_timers
         4283          3          3      -1 ]  ]  ]  raise_softirq
         4292         15         11      -1 ]  ]  scheduler_tick
         4295          2          2      -1 ]  ]  ]  sched_clock
         4302          2          2      -1 ]  ]  ]  sub_preempt_count
         4309          3          3      -1 ]  ]  run_posix_cpu_timers
         4318         14          5      -1 ]  do_timer
         4321          9          6      -1 ]  ]  update_wall_time
         4324          3          3      -1 ]  ]  ]  update_wall_time_one_tick
         4335          3          3      -1 ]  sub_preempt_count
    ----------- ]]]] end ----------------
    ----------- **** start --------------
         4341         -1         -1      -1 sub_preempt_count
    ----------- **** end ----------------
    ----------- )))) start --------------
         4408         43          6     105 do_softirq
         4411         37         29     105 )  __do_softirq
         4414          9          6      -1 )  )  run_timer_softirq
         4418          3          3      -1 )  )  )  sub_preempt_count
         4426         -1         -1      -1 )  )  sub_preempt_count
    ----------- )))) end ----------------
    ----------- &&&& start --------------
         4453          3          3     105 sub_preempt_count
    ----------- &&&& end ----------------
         4470       2774         18     105 %  %  %  %  %  %  do_lookup
         4473         16         12     105 %  %  %  %  %  %  %  __d_lookup
         4479          2          2     105 %  %  %  %  %  %  %  %  sub_preempt_count
         4484          2          2     105 %  %  %  %  %  %  %  %  sub_preempt_count
         4492       2737         32     105 %  %  %  %  %  %  %  nfs_lookup_revalidate
         4495          3          3     105 %  %  %  %  %  %  %  %  sub_preempt_count
         4500          3          3     105 %  %  %  %  %  %  %  %  lock_kernel
         4506          2          2     105 %  %  %  %  %  %  %  %  is_bad_inode
         4511          7          4     105 %  %  %  %  %  %  %  %  nfs_revalidate_inode
         4513          3          3     105 %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
         4521          2          2     105 %  %  %  %  %  %  %  %  nfs_attribute_timeout
         4526       2672         14     105 %  %  %  %  %  %  %  %  nfs_revalidate_inode
         4529          2          2     105 %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
         4534       2656         28     105 %  %  %  %  %  %  %  %  %  __nfs_revalidate_inode
         4537          2          2     105 %  %  %  %  %  %  %  %  %  %  lock_kernel
         4542          2          2     105 %  %  %  %  %  %  %  %  %  %  is_bad_inode
         4548       2597         12     105 %  %  %  %  %  %  %  %  %  %  nfs_proc_getattr
         4551       2585         23     105 %  %  %  %  %  %  %  %  %  %  %  rpc_call_sync
         4554         20          9     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_clnt_sigmask
         4558          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending
         4561          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending_tsk
         4570          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4577         55          9     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_new_task
         4580         35          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_alloc_task
         4583         30          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_alloc
         4586          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         4591         19          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_alloc_slab
         4594         13          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_alloc
         4596          9          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  cache_alloc_refill
         4600          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4618         11          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_init_task
         4624          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4635         34          6     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_call_setup
         4638         28          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_bindcred
         4642         21          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_lookup_cred
         4645         15         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_lookup_credcache
         4648          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_match
         4655          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4672       2433         10     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_execute
         4674       2423        102     105 %  %  %  %  %  %  %  %  %  %  %  %  %  __rpc_execute
         4677          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         4683          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         4689          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_start
         4694          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         4699          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         4704          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         4709         37          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_reserve
         4711          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_uptodatecred
         4717         27         13     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_reserve
         4721          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_request_init
         4727          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4732          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  del_timer
         4736          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4749          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         4754          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         4759          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         4763          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_reserveresult
         4769          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         4774          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         4778          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         4783        148          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_allocate
         4787        141          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_malloc
         4789        136         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kmalloc
         4793          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         4799        123         12     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  cache_alloc_refill
         4802          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4807        107         25     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  cache_grow
         4811          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4816          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_flagcheck
         4821         60          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_getpages
         4824         50         13     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __alloc_pages
         4826          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         4832          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  zone_watermark_ok
         4837         29         13     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  buffered_rmqueue
         4841          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4846          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  bad_range
         4851          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __mod_page_state
         4856          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  prep_new_page
         4859          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  set_page_refs
         4869          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  zone_statistics
         4876          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __mod_page_state
         4884         12          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  alloc_slabmgmt
         4886          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_alloc
         4889          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         4899          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  set_slab_attr
         4904          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  cache_init_objs
         4909          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4917          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4934          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         4938          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         4943          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         4949          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_bind
         4954          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         4959          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         4964          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         4969       1735         15     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_transmit
         4972         65         55     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_prepare_transmit
         4975          9          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write
         4978          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_get_cong
         4987          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         4992         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         4994         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5018          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5040         45          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_encode
         5043         27          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_header
         5047         20          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_marshcred
         5050         14          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_marshal
         5053          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_encode_opaque
         5055          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_encode_opaque_fixed
         5073          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_wrap_req
         5076          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  nfs_xdr_fhandle
         5088       1610        126     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_transmit
         5092          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5097         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         5099         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5121          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5141          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_reset_majortimeo
         5147       1416         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_sendpages
         5151       1406          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kernel_sendmsg
         5154       1397          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_sendmsg
         5157       1388         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  inet_sendmsg
         5161       1378         24     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_sendmsg
         5166         61          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_route_output_flow
         5169         55         53     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __ip_route_output_key
         5172          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rt_hash_code
         5179         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         5182         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5204          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5231        212        208     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_sock
         5233          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         5239          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5244         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         5246         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- :::: start --------------
         5270        150         82     105 timer_interrupt
         5272          8          6      -1 :  profile_tick
         5275          2          2      -1 :  :  profile_hit
         5282         44         14      -1 :  update_process_times
         5285          7          5      -1 :  :  account_system_time
         5288          2          2      -1 :  :  :  update_mem_hiwater
         5295          7          4      -1 :  :  run_local_timers
         5297          3          3      -1 :  :  :  raise_softirq
         5305         13          8      -1 :  :  scheduler_tick
         5308          2          2      -1 :  :  :  sched_clock
         5313          3          3      -1 :  :  :  sub_preempt_count
         5320          3          3      -1 :  :  run_posix_cpu_timers
         5328         13          6      -1 :  do_timer
         5331          7          4      -1 :  :  update_wall_time
         5333          3          3      -1 :  :  :  update_wall_time_one_tick
         5343          3          3      -1 :  sub_preempt_count
    ----------- :::: end ----------------
    ----------- \\\\ start --------------
         5348         -1         -1      -1 sub_preempt_count
    ----------- \\\\ end ----------------
    ----------- }}'}} start --------------
         5371         41          5     105 do_softirq
         5373         36         29     105 }  __do_softirq
         5376          8          6      -1 }  }  run_timer_softirq
         5379          2          2      -1 }  }  }  sub_preempt_count
         5387         -1         -1      -1 }  }  sub_preempt_count
    ----------- }}'}} end ----------------
    ----------- |||| start --------------
         5414          3          3     105 sub_preempt_count
    ----------- |||| end ----------------
         5423          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5447         73         12     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_append_data
         5452         50          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_alloc_send_skb
         5455         45          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_alloc_send_pskb
         5458         38          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  alloc_skb
         5461         22          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_alloc
         5464          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         5469         11          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  cache_alloc_refill
         5475          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5485          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kmalloc
         5488          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         5506         11          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_generic_getfrag
         5509          5          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  csum_partial_copy_fromiovecend
         5522        944         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_push_pending_frames
         5527        934         12     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_push_pending_frames
         5534        922          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_output
         5537        914         59     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_finish_output
         5541          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5546         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         5548         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5572          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5593        854        544     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  dev_queue_xmit
         5597          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_enqueue
         5603        141        116      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  qdisc_restart
         5606          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_dequeue
         5613          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5618         18         13      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  emac_start_xmit
         5623          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __dma_sync
         5631          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5639          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- !!!! start --------------
         5646         94         20      -1 do_IRQ
         5649          2          2      -1 !  ppc4xx_pic_get_irq
         5654         69         22      -1 !  __do_IRQ
         5658          3          3      -1 !  !  ppc4xx_uic0_ack
         5664          2          2      -1 !  !  sub_preempt_count
         5669         33          6      -1 !  !  handle_IRQ_event
         5672         27          8      -1 !  !  !  mal_txeob
         5676         16         11      -1 !  !  !  !  emac_txeob_dev
         5680          3          3      -1 !  !  !  !  !  raise_softirq_irqoff
         5687          2          2      -1 !  !  !  !  !  sub_preempt_count
         5694          3          3      -1 !  !  !  !  sub_preempt_count
         5706          3          3      -1 !  !  note_interrupt
         5712          3          3      -1 !  !  ppc4xx_uic0_end
         5717          3          3      -1 !  !  sub_preempt_count
         5725          3          3      -1 !  ppc4xx_pic_get_irq
    ----------- !!!! end ----------------
    ----------- @@@@ start --------------
         5731          2          2      -1 sub_preempt_count
    ----------- @@@@ end ----------------
    ----------- [[[[ start --------------
         5735          3          3      -1 sub_preempt_count
    ----------- [[[[ end ----------------
         5747          7          4      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  qdisc_restart
         5749          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_dequeue
         5757        160        160      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- #### start --------------
         5760        153         20      -1 do_IRQ
         5762          3          3      -1 #  ppc4xx_pic_get_irq
         5767        128         19      -1 #  __do_IRQ
         5770          2          2      -1 #  #  ppc4xx_uic0_ack
         5775          2          2      -1 #  #  sub_preempt_count
         5780         98          5      -1 #  #  handle_IRQ_event
         5782         93         10      -1 #  #  #  mal_rxeob
         5786         81         12      -1 #  #  #  #  emac_rxeob_dev
         5789         30         13      -1 #  #  #  #  #  emac_rx_clean
         5793          2          2      -1 #  #  #  #  #  #  emac_rx_csum
         5799          4          4      -1 #  #  #  #  #  #  eth_type_trans
         5805         11          8      -1 #  #  #  #  #  #  netif_rx
         5810          3          3      -1 #  #  #  #  #  #  #  get_sample_stats
         5822         37          8      -1 #  #  #  #  #  emac_rx_fill
         5824         26          9      -1 #  #  #  #  #  #  alloc_skb
         5827          2          2      -1 #  #  #  #  #  #  #  kmem_cache_alloc
         5832         15          6      -1 #  #  #  #  #  #  #  __kmalloc
         5835          9          7      -1 #  #  #  #  #  #  #  #  cache_alloc_refill
         5840          2          2      -1 #  #  #  #  #  #  #  #  #  sub_preempt_count
         5853          3          3      -1 #  #  #  #  #  #  __dma_sync
         5862          2          2      -1 #  #  #  #  #  sub_preempt_count
         5870          2          2      -1 #  #  #  #  sub_preempt_count
         5880          3          3      -1 #  #  note_interrupt
         5885          2          2      -1 #  #  ppc4xx_uic0_end
         5890          2          2      -1 #  #  sub_preempt_count
         5898          2          2      -1 #  ppc4xx_pic_get_irq
    ----------- #### end ----------------
    ----------- ;;;; start --------------
         5903          2          2      -1 sub_preempt_count
    ----------- ;;;; end ----------------
    ----------- (((( start --------------
         5907          3          3      -1 sub_preempt_count
    ----------- (((( end ----------------
         5919         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         5922         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5957        458          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  do_softirq
         5960        451         54     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __do_softirq
         5963         48          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  net_tx_action
         5966         43         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kfree_skb
         5969         14          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_wfree
         5972          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_write_space
         5975          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         5987         19          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree_skbmem
         5989          9          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_release_data
         5992          4          4      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
         6001          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
         6014        341        111      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  net_rx_action
         6018        230          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  process_backlog
         6022        222         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  netif_receive_skb
         6027        209         12      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_rcv
         6032         14          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_route_input
         6034          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rt_hash_code
         6040          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6049        183         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_local_deliver
         6053        171         15      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_rcv
         6057          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_checksum_init
         6063          4          4      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_v4_lookup_longway
         6069          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6075        146         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_queue_rcv_skb
         6078          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_queue_tail
         6081          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6089        128         21      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_data_ready
         6092         15          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_recv_datagram
         6095          9          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_dequeue
         6099          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6111         22          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  csum_partial_copy_to_xdr
         6114         16          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_partial_copy_from_skb
         6117         10          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_read_and_csum_bits
         6120          4          4      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_copy_and_csum_bits
         6136         33         16      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_complete_rqst
         6139          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_adjust_cwnd
         6146          8          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_put_cong
         6149          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write_next
         6157          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_update_rtt
         6163          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_task
         6172          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6177         33          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_free_datagram
         6179         28          9      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kfree_skb
         6182          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_rfree
         6187         17          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree_skbmem
         6189          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_release_data
         6192          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
         6199          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
         6212          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6227          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6238          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- $$$$ start --------------
         6251        100         26      -1 timer_interrupt
         6254          8          5      -1 $  profile_tick
         6257          3          3      -1 $  $  profile_hit
         6265         49         15      -1 $  update_process_times
         6268          9          6      -1 $  $  account_system_time
         6271          3          3      -1 $  $  $  update_mem_hiwater
         6280          8          5      -1 $  $  run_local_timers
         6283          3          3      -1 $  $  $  raise_softirq
         6292         14         10      -1 $  $  scheduler_tick
         6294          2          2      -1 $  $  $  sched_clock
         6301          2          2      -1 $  $  $  sub_preempt_count
         6309          3          3      -1 $  $  run_posix_cpu_timers
         6317         15          7      -1 $  do_timer
         6321          8          5      -1 $  $  update_wall_time
         6323          3          3      -1 $  $  $  update_wall_time_one_tick
         6335          2          2      -1 $  sub_preempt_count
    ----------- $$$$ end ----------------
    ----------- //// start --------------
         6340          3          3      -1 sub_preempt_count
    ----------- //// end ----------------
    ----------- {{'{{ start --------------
         6345          3          3      -1 sub_preempt_count
    ----------- {{'{{ end ----------------
         6358          9          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  run_timer_softirq
         6362          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6370         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6417          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6469         64         63     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  release_sock
         6473          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6478         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         6480         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6510          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6567          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_calc_rto
         6574         59          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_release_write
         6576         54          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write_next
         6579         24         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
         6583          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6588         12          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         6590          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6595          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6605         22          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
         6608          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6613         12          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         6615          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6620          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6636          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6640         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         6643         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6671          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6707          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         6713          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         6718          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         6724          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_status
         6729          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         6734          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         6739          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         6744         39          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_decode
         6747         16          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_verify
         6751          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_checkverf
         6754          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_validate
         6765         15          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_unwrap_resp
         6768         10          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  nfs_xdr_attrstat
         6771          4          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_decode_fattr
         6786          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         6790          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         6796        292         25     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_release_task
         6800          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6805          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         6810        211         83     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_release
         6813          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_release_write
         6818          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_put_cong
         6824         26          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mod_timer
         6827         21         14      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __mod_timer
         6832          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  internal_add_timer
         6838          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6843          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6853          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6858         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         6861         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6895          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6921         92          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_clear_backlog
         6923         71         65     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
         6926          4          4      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __rpc_wake_up_next_priority
         6932          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6937         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         6940         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6970          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         6997         13          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up
         7000          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
         7006          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7016          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7024          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_unbindcred
         7027          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  put_rpccred
         7035          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_free
         7037          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
         7046         17          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_release_client
         7048         13          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up
         7051          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
         7056          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7066         19          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_default_free_task
         7069         14          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_free
         7072          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_free_slab
         7075          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
         7108         20         10     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_clnt_sigunmask
         7112          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending
         7114          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending_tsk
         7123          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7148         13         10     105 %  %  %  %  %  %  %  %  %  %  nfs_update_inode
         7152          3          3     105 %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7164         12          7     105 %  %  %  %  %  %  %  %  %  %  __wake_up
         7167          2          2     105 %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
         7171          3          3     105 %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7179          2          2     105 %  %  %  %  %  %  %  %  %  %  unlock_kernel
         7201          8          5     105 %  %  %  %  %  %  %  %  unlock_kernel
         7204          3          3     105 %  %  %  %  %  %  %  %  %  sub_preempt_count
         7212          8          6     105 %  %  %  %  %  %  %  %  dput
         7215          2          2     105 %  %  %  %  %  %  %  %  %  _atomic_dec_and_lock
         7232          3          3     105 %  %  %  %  %  %  %  __follow_mount
         7247        193        191     105 %  %  %  %  %  %  dput
    ----------- %%%% start --------------
         7251        180        113     105 timer_interrupt
         7253          8          5      -1 %  profile_tick
         7256          3          3      -1 %  %  profile_hit
         7264         44         15      -1 %  update_process_times
         7267          7          4      -1 %  %  account_system_time
         7269          3          3      -1 %  %  %  update_mem_hiwater
         7277          7          4      -1 %  %  run_local_timers
         7279          3          3      -1 %  %  %  raise_softirq
         7287         13          7      -1 %  %  scheduler_tick
         7289          3          3      -1 %  %  %  sched_clock
         7295          3          3      -1 %  %  %  sub_preempt_count
         7303          2          2      -1 %  %  run_posix_cpu_timers
         7310         13          6      -1 %  do_timer
         7313          7          4      -1 %  %  update_wall_time
         7315          3          3      -1 %  %  %  update_wall_time_one_tick
         7326          2          2      -1 %  sub_preempt_count
    ----------- %%%% end ----------------
    ----------- ]]]] start --------------
         7331         -1         -1      -1 sub_preempt_count
    ----------- ]]]] end ----------------
    ----------- **** start --------------
         7371         52          4     105 do_softirq
         7373         48         41     105 *  __do_softirq
         7377          8          6      -1 *  *  run_timer_softirq
         7380          2          2      -1 *  *  *  sub_preempt_count
         7388         -1         -1      -1 *  *  sub_preempt_count
    ----------- **** end ----------------
    ----------- )))) start --------------
         7426          2          2     105 sub_preempt_count
    ----------- )))) end ----------------
         7435          2          2     105 %  %  %  %  %  %  %  _atomic_dec_and_lock
         7444         42          6     105 %  %  %  %  %  %  permission
         7448         36         15     105 %  %  %  %  %  %  %  nfs_permission
         7450          3          3     105 %  %  %  %  %  %  %  %  lock_kernel
         7457          8          6     105 %  %  %  %  %  %  %  %  nfs_revalidate_inode
         7460          2          2     105 %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
         7468          3          3     105 %  %  %  %  %  %  %  %  generic_permission
         7474          7          4     105 %  %  %  %  %  %  %  %  unlock_kernel
         7476          3          3     105 %  %  %  %  %  %  %  %  %  sub_preempt_count
         7490       3265         21     105 %  %  %  %  %  %  do_lookup
         7493         15          9     105 %  %  %  %  %  %  %  __d_lookup
         7498          3          3     105 %  %  %  %  %  %  %  %  sub_preempt_count
         7503          3          3     105 %  %  %  %  %  %  %  %  sub_preempt_count
         7511       3227         30     105 %  %  %  %  %  %  %  nfs_lookup_revalidate
         7515          2          2     105 %  %  %  %  %  %  %  %  sub_preempt_count
         7520          2          2     105 %  %  %  %  %  %  %  %  lock_kernel
         7525          3          3     105 %  %  %  %  %  %  %  %  is_bad_inode
         7530          8          6     105 %  %  %  %  %  %  %  %  nfs_revalidate_inode
         7533          2          2     105 %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
         7540          3          3     105 %  %  %  %  %  %  %  %  nfs_attribute_timeout
         7546       3162         25     105 %  %  %  %  %  %  %  %  __nfs_revalidate_inode
         7549          2          2     105 %  %  %  %  %  %  %  %  %  lock_kernel
         7554          2          2     105 %  %  %  %  %  %  %  %  %  is_bad_inode
         7559       3105         11     105 %  %  %  %  %  %  %  %  %  nfs_proc_getattr
         7562       3094         24     105 %  %  %  %  %  %  %  %  %  %  rpc_call_sync
         7565         19          9     105 %  %  %  %  %  %  %  %  %  %  %  rpc_clnt_sigmask
         7568          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending
         7571          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending_tsk
         7579          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7587         44          8     105 %  %  %  %  %  %  %  %  %  %  %  rpc_new_task
         7589         25          5     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_alloc_task
         7592         20          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_alloc
         7595          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         7601          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_alloc_slab
         7603          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_alloc
         7617         11          9     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_init_task
         7623          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7634         33          5     105 %  %  %  %  %  %  %  %  %  %  %  rpc_call_setup
         7637         28          6     105 %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_bindcred
         7640         22          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unx_lookup_cred
         7643         16         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_lookup_credcache
         7646          4          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_match
         7654          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7670       2954         12     105 %  %  %  %  %  %  %  %  %  %  %  rpc_execute
         7673       2942         96     105 %  %  %  %  %  %  %  %  %  %  %  %  __rpc_execute
         7675          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         7680          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         7685          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_start
         7691          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         7695          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         7700          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         7705         39          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_reserve
         7709          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_uptodatecred
         7715         27         12     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_reserve
         7719          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_request_init
         7724          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7730          9          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  del_timer
         7734          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7747          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         7752          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         7756          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         7761          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_reserveresult
         7767          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         7772          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         7776          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         7781         21          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_allocate
         7784         15          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_malloc
         7787          9          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kmalloc
         7791          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         7804          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         7809          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         7814          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         7819          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_bind
         7824          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         7829          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         7834          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         7839       2058         15     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_transmit
         7842         99         88     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_prepare_transmit
         7846          9          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write
         7849          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_get_cong
         7857          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7862         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         7865         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7909          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7944         44          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_encode
         7947         26          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_header
         7951         20          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_marshcred
         7953         15          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_marshal
         7956          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_encode_opaque
         7959          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_encode_opaque_fixed
         7976          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_wrap_req
         7979          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  nfs_xdr_fhandle
         7990       1900        182     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_transmit
         7994          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         7999         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         8002         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8035          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8061          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_reset_majortimeo
         8068       1650          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_sendpages
         8071       1641          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kernel_sendmsg
         8074       1632          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_sendmsg
         8077       1624         11     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  inet_sendmsg
         8081       1613         25     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_sendmsg
         8086         98          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_route_output_flow
         8089         92         90     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __ip_route_output_key
         8092          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rt_hash_code
         8099         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         8102         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8151          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8188        273        268     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_sock
         8190          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         8196          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8201         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         8204         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8238          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- &&&& start --------------
         8268        189        115     105 timer_interrupt
         8272          8          5      -1 &  profile_tick
         8274          3          3      -1 &  &  profile_hit
         8282         49         14      -1 &  update_process_times
         8285          9          6      -1 &  &  account_system_time
         8288          3          3      -1 &  &  &  update_mem_hiwater
         8297          8          5      -1 &  &  run_local_timers
         8299          3          3      -1 &  &  &  raise_softirq
         8308         15         11      -1 &  &  scheduler_tick
         8311          2          2      -1 &  &  &  sched_clock
         8318          2          2      -1 &  &  &  sub_preempt_count
         8326          3          3      -1 &  &  run_posix_cpu_timers
         8334         15          7      -1 &  do_timer
         8338          8          5      -1 &  &  update_wall_time
         8340          3          3      -1 &  &  &  update_wall_time_one_tick
         8352          2          2      -1 &  sub_preempt_count
    ----------- &&&& end ----------------
    ----------- :::: start --------------
         8358         -1         -1      -1 sub_preempt_count
    ----------- :::: end ----------------
    ----------- \\\\ start --------------
         8396         54          6     105 do_softirq
         8399         48         40     105 \  __do_softirq
         8401          9          6      -1 \  \  run_timer_softirq
         8405          3          3      -1 \  \  \  sub_preempt_count
         8413         -1         -1      -1 \  \  sub_preempt_count
    ----------- \\\\ end ----------------
    ----------- }}'}} start --------------
         8452          3          3     105 sub_preempt_count
    ----------- }}'}} end ----------------
         8464         60         13     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_append_data
         8470         36          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_alloc_send_skb
         8473         31          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_alloc_send_pskb
         8476         24          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  alloc_skb
         8479          7          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_alloc
         8481          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         8489          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kmalloc
         8492          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
         8510         11          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_generic_getfrag
         8513          5          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  csum_partial_copy_fromiovecend
         8527       1059          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_push_pending_frames
         8531       1050         12     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_push_pending_frames
         8538       1038          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_output
         8541       1030         94     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_finish_output
         8544          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8550         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         8552         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8598          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8632        934        637     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  dev_queue_xmit
         8637          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_enqueue
         8643        285        261      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  qdisc_restart
         8646          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_dequeue
         8653          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8659         17         12      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  emac_start_xmit
         8663          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __dma_sync
         8671          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8679          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- |||| start --------------
         8685         94         22      -1 do_IRQ
         8688          3          3      -1 |  ppc4xx_pic_get_irq
         8694         67         21      -1 |  __do_IRQ
         8698          2          2      -1 |  |  ppc4xx_uic0_ack
         8703          3          3      -1 |  |  sub_preempt_count
         8709         33          6      -1 |  |  handle_IRQ_event
         8712         27          9      -1 |  |  |  mal_txeob
         8715         16         10      -1 |  |  |  |  emac_txeob_dev
         8720          3          3      -1 |  |  |  |  |  raise_softirq_irqoff
         8726          3          3      -1 |  |  |  |  |  sub_preempt_count
         8734          2          2      -1 |  |  |  |  sub_preempt_count
         8745          3          3      -1 |  |  note_interrupt
         8751          2          2      -1 |  |  ppc4xx_uic0_end
         8756          3          3      -1 |  |  sub_preempt_count
         8764          2          2      -1 |  ppc4xx_pic_get_irq
    ----------- |||| end ----------------
    ----------- !!!! start --------------
         8769          2          2      -1 sub_preempt_count
    ----------- !!!! end ----------------
    ----------- @@@@ start --------------
         8774          2          2      -1 sub_preempt_count
    ----------- @@@@ end ----------------
    ----------- [[[[ start --------------
         8783        141         19      -1 do_IRQ
         8785          3          3      -1 [  ppc4xx_pic_get_irq
         8790        117         20      -1 [  __do_IRQ
         8793          2          2      -1 [  [  ppc4xx_uic0_ack
         8798          2          2      -1 [  [  sub_preempt_count
         8803         86          5      -1 [  [  handle_IRQ_event
         8805         81          8      -1 [  [  [  mal_rxeob
         8809         70         11      -1 [  [  [  [  emac_rxeob_dev
         8812         30         13      -1 [  [  [  [  [  emac_rx_clean
         8816          2          2      -1 [  [  [  [  [  [  emac_rx_csum
         8822          4          4      -1 [  [  [  [  [  [  eth_type_trans
         8828         11          7      -1 [  [  [  [  [  [  netif_rx
         8833          4          4      -1 [  [  [  [  [  [  [  get_sample_stats
         8845         26          9      -1 [  [  [  [  [  emac_rx_fill
         8848         14          9      -1 [  [  [  [  [  [  alloc_skb
         8850          3          3      -1 [  [  [  [  [  [  [  kmem_cache_alloc
         8856          2          2      -1 [  [  [  [  [  [  [  __kmalloc
         8865          3          3      -1 [  [  [  [  [  [  __dma_sync
         8873          3          3      -1 [  [  [  [  [  sub_preempt_count
         8881          3          3      -1 [  [  [  [  sub_preempt_count
         8892          2          2      -1 [  [  note_interrupt
         8897          2          2      -1 [  [  ppc4xx_uic0_end
         8901          3          3      -1 [  [  sub_preempt_count
         8909          2          2      -1 [  ppc4xx_pic_get_irq
    ----------- [[[[ end ----------------
    ----------- #### start --------------
         8914          2          2      -1 sub_preempt_count
    ----------- #### end ----------------
    ----------- ;;;; start --------------
         8919          2          2      -1 sub_preempt_count
    ----------- ;;;; end ----------------
         8930          8          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  qdisc_restart
         8933          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_dequeue
         8941          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         8946         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         8948         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9012        487          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  do_softirq
         9014        482         85     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __do_softirq
         9017         49          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  net_tx_action
         9020         43          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kfree_skb
         9023         15          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_wfree
         9027          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_write_space
         9030          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9041         20          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree_skbmem
         9044          9          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_release_data
         9047          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
         9055          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
         9069        341          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  net_rx_action
         9073        333          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  process_backlog
         9076        325         11      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  netif_receive_skb
         9081        312         13      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_rcv
         9087         14          9      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_route_input
         9089          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rt_hash_code
         9096          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9104        285         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_local_deliver
         9108        273         16      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_rcv
         9112          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_checksum_init
         9118          4          4      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_v4_lookup_longway
         9124          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9130        247         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_queue_rcv_skb
         9133          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_queue_tail
         9136          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9144        229         23      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_data_ready
         9147         15          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_recv_datagram
         9150          9          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_dequeue
         9154          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9167         21          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  csum_partial_copy_to_xdr
         9170         15          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_partial_copy_from_skb
         9173          9          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_read_and_csum_bits
         9176          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_copy_and_csum_bits
         9192         31         14      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_complete_rqst
         9194          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_adjust_cwnd
         9200          8          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_put_cong
         9203          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write_next
         9211          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_update_rtt
         9217          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_task
         9225          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9231        134          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_free_datagram
         9233        129          9      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kfree_skb
         9236          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_rfree
         9242        118          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree_skbmem
         9245        107          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_release_data
         9247        102        102      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
    ----------- (((( start --------------
         9251         95         23      -1 timer_interrupt
         9254          8          6      -1 (  profile_tick
         9257          2          2      -1 (  (  profile_hit
         9264         47         15      -1 (  update_process_times
         9267          8          5      -1 (  (  account_system_time
         9270          3          3      -1 (  (  (  update_mem_hiwater
         9278          8          5      -1 (  (  run_local_timers
         9280          3          3      -1 (  (  (  raise_softirq
         9289         14          9      -1 (  (  scheduler_tick
         9292          2          2      -1 (  (  (  sched_clock
         9298          3          3      -1 (  (  (  sub_preempt_count
         9306          2          2      -1 (  (  run_posix_cpu_timers
         9314         14          6      -1 (  do_timer
         9317          8          5      -1 (  (  update_wall_time
         9319          3          3      -1 (  (  (  update_wall_time_one_tick
         9330          3          3      -1 (  sub_preempt_count
    ----------- (((( end ----------------
    ----------- $$$$ start --------------
         9336          2          2      -1 sub_preempt_count
    ----------- $$$$ end ----------------
    ----------- //// start --------------
         9341          2          2      -1 sub_preempt_count
    ----------- //// end ----------------
         9354          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
         9368          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9384          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9396          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9413          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  run_timer_softirq
         9416          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9424         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9502          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9589         98         97     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  release_sock
         9593          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9597         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         9600         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9654          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9723          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_calc_rto
         9730         59          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_release_write
         9733         53          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write_next
         9735         24         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
         9739          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9744         12          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         9746          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9751          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9761         22          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
         9764          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9769         12          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         9771          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9776          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9792          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9797         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
         9799         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9854          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
         9900          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         9906          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         9911          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         9917          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_status
         9922          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         9927          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         9932          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
         9937         41          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  call_decode
         9941         16          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_verify
         9944          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_checkverf
         9948          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_validate
         9959         16          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_unwrap_resp
         9963          9          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  nfs_xdr_attrstat
         9965          4          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_decode_fattr
         9980          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
         9985          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
         9991        611         26     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_release_task
         9995          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10000          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        10005        529        131     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_release
        10008          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_release_write
        10013          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_put_cong
        10018         28          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mod_timer
        10021         22         14      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __mod_timer
        10026          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  internal_add_timer
        10033          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10038          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10049          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10054         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        10056         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10115          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10163        362          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_clear_backlog
        10166        339        334     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
        10169          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __rpc_wake_up_next_priority
        10174          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10179         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        10182         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10233          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- {{'{{ start --------------
        10279        222        152     105 timer_interrupt
        10281          8          6      -1 {  profile_tick
        10284          2          2      -1 {  {  profile_hit
        10292         46         12      -1 {  update_process_times
        10294          9          6      -1 {  {  account_system_time
        10297          3          3      -1 {  {  {  update_mem_hiwater
        10305          8          6      -1 {  {  run_local_timers
        10308          2          2      -1 {  {  {  raise_softirq
        10316         14          8      -1 {  {  scheduler_tick
        10318          3          3      -1 {  {  {  sched_clock
        10325          3          3      -1 {  {  {  sub_preempt_count
        10333          3          3      -1 {  {  run_posix_cpu_timers
        10341         14          6      -1 {  do_timer
        10344          8          6      -1 {  {  update_wall_time
        10347          2          2      -1 {  {  {  update_wall_time_one_tick
        10358          2          2      -1 {  sub_preempt_count
    ----------- {{'{{ end ----------------
    ----------- %%%% start --------------
        10363         -1         -1      -1 sub_preempt_count
    ----------- %%%% end ----------------
    ----------- ]]]] start --------------
        10421         73          6     105 do_softirq
        10424         67         59     105 ]  __do_softirq
        10426          9          7      -1 ]  ]  run_timer_softirq
        10430          2          2      -1 ]  ]  ]  sub_preempt_count
        10437         -1         -1      -1 ]  ]  sub_preempt_count
    ----------- ]]]] end ----------------
    ----------- **** start --------------
        10496          2          2     105 sub_preempt_count
    ----------- **** end ----------------
        10508         14          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up
        10512          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
        10517          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10528          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10537          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_unbindcred
        10540          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  put_rpccred
        10548          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_free
        10550          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
        10559         18          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_release_client
        10562         12          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up
        10564          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
        10569          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10580         18          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_default_free_task
        10582         14          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_free
        10585          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_free_slab
        10588          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
        10627         20          9     105 %  %  %  %  %  %  %  %  %  %  %  rpc_clnt_sigunmask
        10630          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending
        10633          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending_tsk
        10642          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10667         12          9     105 %  %  %  %  %  %  %  %  %  nfs_update_inode
        10671          3          3     105 %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10682         13          9     105 %  %  %  %  %  %  %  %  %  __wake_up
        10685          2          2     105 %  %  %  %  %  %  %  %  %  %  __wake_up_common
        10690          2          2     105 %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10697          3          3     105 %  %  %  %  %  %  %  %  %  unlock_kernel
        10711          8          6     105 %  %  %  %  %  %  %  %  unlock_kernel
        10714          2          2     105 %  %  %  %  %  %  %  %  %  sub_preempt_count
        10721          9          6     105 %  %  %  %  %  %  %  %  dput
        10724          3          3     105 %  %  %  %  %  %  %  %  %  _atomic_dec_and_lock
        10742          2          2     105 %  %  %  %  %  %  %  __follow_mount
        10759          3          3     105 %  %  %  %  %  %  cond_resched
        10765          2          2     105 %  %  %  %  %  %  update_atime
        10771         48         12     105 %  %  %  %  %  %  nfs_follow_link
        10774          8          5     105 %  %  %  %  %  %  %  nfs_revalidate_inode
        10776          3          3     105 %  %  %  %  %  %  %  %  nfs_attribute_timeout
        10785         25          8     105 %  %  %  %  %  %  %  read_cache_page
        10787         14          9     105 %  %  %  %  %  %  %  %  find_get_page
        10790          3          3     105 %  %  %  %  %  %  %  %  %  radix_tree_lookup
        10796          2          2     105 %  %  %  %  %  %  %  %  %  sub_preempt_count
        10804          3          3     105 %  %  %  %  %  %  %  %  mark_page_accessed
        10813          3          3     105 %  %  %  %  %  %  %  __might_sleep
        10823         -1          0     105 %  %  %  %  %  %  link_path_walk
        10826         -1          1     105 %  %  %  %  %  %  %  __link_path_walk
        10829         40          6     105 %  %  %  %  %  %  %  %  permission
        10832         34         14     105 %  %  %  %  %  %  %  %  %  nfs_permission
        10835          3          3     105 %  %  %  %  %  %  %  %  %  %  lock_kernel
        10841          7          4     105 %  %  %  %  %  %  %  %  %  %  nfs_revalidate_inode
        10843          3          3     105 %  %  %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
        10851          3          3     105 %  %  %  %  %  %  %  %  %  %  generic_permission
        10857          7          5     105 %  %  %  %  %  %  %  %  %  %  unlock_kernel
        10859          2          2     105 %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10873         -1          1     105 %  %  %  %  %  %  %  %  do_lookup
        10875         16         12     105 %  %  %  %  %  %  %  %  %  __d_lookup
        10881          2          2     105 %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10886          2          2     105 %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10894         -1          1     105 %  %  %  %  %  %  %  %  %  nfs_lookup_revalidate
        10897          2          2     105 %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10902          2          2     105 %  %  %  %  %  %  %  %  %  %  lock_kernel
        10907          3          3     105 %  %  %  %  %  %  %  %  %  %  is_bad_inode
        10913          7          5     105 %  %  %  %  %  %  %  %  %  %  nfs_revalidate_inode
        10915          2          2     105 %  %  %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
        10923          2          2     105 %  %  %  %  %  %  %  %  %  %  nfs_attribute_timeout
        10928       8164         30     105 %  %  %  %  %  %  %  %  %  %  __nfs_revalidate_inode
        10931          2          2     105 %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        10936          2          2     105 %  %  %  %  %  %  %  %  %  %  %  is_bad_inode
        10942       8093         14     105 %  %  %  %  %  %  %  %  %  %  %  nfs_proc_getattr
        10945       8079         27     105 %  %  %  %  %  %  %  %  %  %  %  %  rpc_call_sync
        10947         19          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_clnt_sigmask
        10951          7          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending
        10953          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending_tsk
        10961          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        10969         43          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_new_task
        10972         24          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_alloc_task
        10974         19          8     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_alloc
        10977          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
        10982          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_alloc_slab
        10985          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_alloc
        10998         11          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_init_task
        11004          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11015         33          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_call_setup
        11018         28          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_bindcred
        11021         22          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_lookup_cred
        11024         16         11     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_lookup_credcache
        11028          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_match
        11035          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11051       7932         16     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_execute
        11054       7916        127     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  __rpc_execute
        11056          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        11061          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        11067          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_start
        11072          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        11077          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        11082          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        11087         39          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_reserve
        11090          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_uptodatecred
        11096         27         13     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_reserve
        11100          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_request_init
        11106          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11111          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  del_timer
        11115          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11128          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        11133          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        11138          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        11143          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_reserveresult
        11148          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        11153          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        11158          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        11163         20          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_allocate
        11166         14          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_malloc
        11168          9          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kmalloc
        11172          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
        11185          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        11190          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        11195          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        11200          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_bind
        11205          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        11210          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        11215          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        11220       5701         21     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_transmit
        11223        455        444     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_prepare_transmit
        11227          9          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write
        11230          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_get_cong
        11238          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11243         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        11246         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- )))) start --------------
        11249        110         27      -1 timer_interrupt
        11252          7          5      -1 )  profile_tick
        11255          2          2      -1 )  )  profile_hit
        11262         58         13      -1 )  update_process_times
        11265          8          6      -1 )  )  account_system_time
        11268          2          2      -1 )  )  )  update_mem_hiwater
        11275          8          6      -1 )  )  run_local_timers
        11278          2          2      -1 )  )  )  raise_softirq
        11286         26         14      -1 )  )  scheduler_tick
        11288          3          3      -1 )  )  )  sched_clock
        11296          3          3      -1 )  )  )  requeue_task
        11301          3          3      -1 )  )  )  sub_preempt_count
        11306          3          3      -1 )  )  )  preempt_schedule
        11314          3          3      -1 )  )  run_posix_cpu_timers
        11322         14          5      -1 )  do_timer
        11325          9          6      -1 )  )  update_wall_time
        11328          3          3      -1 )  )  )  update_wall_time_one_tick
        11339          2          2      -1 )  sub_preempt_count
        11344          2          2      -1 )  preempt_schedule
    ----------- )))) end ----------------
    ----------- &&&& start --------------
        11349          3          3      -1 sub_preempt_count
    ----------- &&&& end ----------------
    ----------- :::: start --------------
        11354          2          2      -1 sub_preempt_count
    ----------- :::: end ----------------
        11469        109          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  do_softirq
        11472        103         91     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __do_softirq
        11475         13          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  run_timer_softirq
        11478          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11483          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        11491         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11580          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11585          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        11681         44          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_encode
        11685         26          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_header
        11688         20          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_marshcred
        11691         15          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_marshal
        11694          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_encode_opaque
        11697          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_encode_opaque_fixed
        11714          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_wrap_req
        11717          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  nfs_xdr_fhandle
        11728       5181       1067     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_transmit
        11733          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11738         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        11740         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11839          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        11844          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        11946          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_reset_majortimeo
        11953       4038         11     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_sendpages
        11956       4027         11     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kernel_sendmsg
        11959       4016         11     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_sendmsg
        11963       4005         11     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  inet_sendmsg
        11966       3994         42     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_sendmsg
        11971        231          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_route_output_flow
        11974        224        222     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __ip_route_output_key
        11977          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rt_hash_code
        11984         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        11987         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        12082          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        12087          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        12205        589        584     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_sock
        12207          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
        12213          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        12218         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        12221         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- \\\\ start --------------
        12327        345        270     105 timer_interrupt
        12329          8          6      -1 \  profile_tick
        12332          2          2      -1 \  \  profile_hit
        12339         50         14      -1 \  update_process_times
        12342          8          5      -1 \  \  account_system_time
        12345          3          3      -1 \  \  \  update_mem_hiwater
        12353          7          5      -1 \  \  run_local_timers
        12355          2          2      -1 \  \  \  raise_softirq
        12363         18         10      -1 \  \  scheduler_tick
        12365          3          3      -1 \  \  \  sched_clock
        12371          3          3      -1 \  \  \  sub_preempt_count
        12376          2          2      -1 \  \  \  preempt_schedule
        12383          3          3      -1 \  \  run_posix_cpu_timers
        12391         13          5      -1 \  do_timer
        12394          8          5      -1 \  \  update_wall_time
        12396          3          3      -1 \  \  \  update_wall_time_one_tick
        12407          2          2      -1 \  sub_preempt_count
        12412          2          2      -1 \  preempt_schedule
    ----------- \\\\ end ----------------
    ----------- }}'}} start --------------
        12417         -1         -1      -1 sub_preempt_count
    ----------- }}'}} end ----------------
    ----------- |||| start --------------
        12530        133          6     105 do_softirq
        12533        127        116     105 |  __do_softirq
        12536         12          8      -1 |  |  run_timer_softirq
        12539          2          2      -1 |  |  |  sub_preempt_count
        12544          2          2      -1 |  |  |  preempt_schedule
        12551         -1         -1      -1 |  |  sub_preempt_count
    ----------- |||| end ----------------
    ----------- !!!! start --------------
        12665          3          3     105 sub_preempt_count
    ----------- !!!! end ----------------
        12676          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        12681          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        12798         61         13     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_append_data
        12804         37          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_alloc_send_skb
        12807         32          7     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_alloc_send_pskb
        12810         25          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  alloc_skb
        12813          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_alloc
        12815          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
        12824          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kmalloc
        12827          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __might_sleep
        12845         11          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_generic_getfrag
        12848          5          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  csum_partial_copy_fromiovecend
        12862       2266         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_push_pending_frames
        12866       2256         13     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_push_pending_frames
        12872       2243         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_output
        12876       2233        245     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_finish_output
        12879          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        12885         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        12887         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        12995          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13000          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13117       1986       1520     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  dev_queue_xmit
        13121          4          4      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_enqueue
        13128        451         21      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  qdisc_restart
        13130          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_dequeue
        13137          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13142          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13148         21         12      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  emac_start_xmit
        13152          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __dma_sync
        13159          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13164          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13172        397        397      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- @@@@ start --------------
        13176        389         21      -1 do_IRQ
        13179          3          3      -1 @  ppc4xx_pic_get_irq
        13185        362         24      -1 @  __do_IRQ
        13189          2          2      -1 @  @  ppc4xx_uic0_ack
        13194          3          3      -1 @  @  sub_preempt_count
        13199          3          3      -1 @  @  preempt_schedule
        13205        319        282      -1 @  @  handle_IRQ_event
        13208         37         11      -1 @  @  @  mal_txeob
        13211         21         13      -1 @  @  @  @  emac_txeob_dev
        13216          2          2      -1 @  @  @  @  @  raise_softirq_irqoff
        13222          3          3      -1 @  @  @  @  @  sub_preempt_count
        13227          3          3      -1 @  @  @  @  @  preempt_schedule
        13235          3          3      -1 @  @  @  @  sub_preempt_count
        13240          2          2      -1 @  @  @  @  preempt_schedule
    ----------- [[[[ start --------------
        13248        103         26      -1 timer_interrupt
        13251          8          6      -1 [  profile_tick
        13254          2          2      -1 [  [  profile_hit
        13261         51         15      -1 [  update_process_times
        13264          8          5      -1 [  [  account_system_time
        13267          3          3      -1 [  [  [  update_mem_hiwater
        13275          7          4      -1 [  [  run_local_timers
        13277          3          3      -1 [  [  [  raise_softirq
        13285         19         12      -1 [  [  scheduler_tick
        13288          2          2      -1 [  [  [  sched_clock
        13294          3          3      -1 [  [  [  sub_preempt_count
        13299          2          2      -1 [  [  [  preempt_schedule
        13307          2          2      -1 [  [  run_posix_cpu_timers
        13315         13          5      -1 [  do_timer
        13318          8          5      -1 [  [  update_wall_time
        13320          3          3      -1 [  [  [  update_wall_time_one_tick
        13331          3          3      -1 [  sub_preempt_count
        13336          2          2      -1 [  preempt_schedule
    ----------- [[[[ end ----------------
    ----------- #### start --------------
        13341          2          2      -1 sub_preempt_count
    ----------- #### end ----------------
    ----------- ;;;; start --------------
        13346          2          2      -1 sub_preempt_count
    ----------- ;;;; end ----------------
    ----------- (((( start --------------
        13354        166         21      -1 do_IRQ
        13357          2          2      -1 (  ppc4xx_pic_get_irq
        13361        141         24      -1 (  __do_IRQ
        13364          3          3      -1 (  (  ppc4xx_uic0_ack
        13369          3          3      -1 (  (  sub_preempt_count
        13374          2          2      -1 (  (  preempt_schedule
        13379         98          5      -1 (  (  handle_IRQ_event
        13381         93         13      -1 (  (  (  mal_rxeob
        13385         76         14      -1 (  (  (  (  emac_rxeob_dev
        13388         29         14      -1 (  (  (  (  (  emac_rx_clean
        13392          2          2      -1 (  (  (  (  (  (  emac_rx_csum
        13398          3          3      -1 (  (  (  (  (  (  eth_type_trans
        13404         10          7      -1 (  (  (  (  (  (  netif_rx
        13409          3          3      -1 (  (  (  (  (  (  (  get_sample_stats
        13420         27         10      -1 (  (  (  (  (  emac_rx_fill
        13423         14          8      -1 (  (  (  (  (  (  alloc_skb
        13425          3          3      -1 (  (  (  (  (  (  (  kmem_cache_alloc
        13431          3          3      -1 (  (  (  (  (  (  (  __kmalloc
        13440          3          3      -1 (  (  (  (  (  (  __dma_sync
        13451          3          3      -1 (  (  (  (  (  sub_preempt_count
        13456          3          3      -1 (  (  (  (  (  preempt_schedule
        13464          2          2      -1 (  (  (  (  sub_preempt_count
        13469          2          2      -1 (  (  (  (  preempt_schedule
        13481          2          2      -1 (  (  note_interrupt
        13486          3          3      -1 (  (  ppc4xx_uic0_end
        13492          3          3      -1 (  (  sub_preempt_count
        13497          3          3      -1 (  (  preempt_schedule
        13505          2          2      -1 (  ppc4xx_pic_get_irq
    ----------- (((( end ----------------
    ----------- $$$$ start --------------
        13510          2          2      -1 sub_preempt_count
    ----------- $$$$ end ----------------
    ----------- //// start --------------
        13515          2          2      -1 sub_preempt_count
    ----------- //// end ----------------
        13526          3          3      -1 @  @  note_interrupt
        13531          3          3      -1 @  @  ppc4xx_uic0_end
        13536          3          3      -1 @  @  sub_preempt_count
        13541          2          2      -1 @  @  preempt_schedule
        13549          3          3      -1 @  ppc4xx_pic_get_irq
    ----------- @@@@ end ----------------
    ----------- {{'{{ start --------------
        13554          3          3      -1 sub_preempt_count
    ----------- {{'{{ end ----------------
    ----------- %%%% start --------------
        13559          2          2      -1 sub_preempt_count
    ----------- %%%% end ----------------
        13572          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13581          8          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  qdisc_restart
        13584          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  pfifo_fast_dequeue
        13592          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13597          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13602         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        13604         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13754       1170        648     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  do_softirq
        13757        522        180     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __do_softirq
        13760         13          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  run_timer_softirq
        13763          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13768          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13776         54          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  net_tx_action
        13779         48          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kfree_skb
        13782         20          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_wfree
        13785         14         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_write_space
        13789          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13794          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13805         20          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree_skbmem
        13807          9          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_release_data
        13811          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
        13819          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
        13833        276          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  net_rx_action
        13836        269          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  process_backlog
        13840        261         15      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  netif_receive_skb
        13845        242         11      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_rcv
        13850         19         11      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_route_input
        13852          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rt_hash_code
        13858          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13864          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13872        212         11      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  ip_local_deliver
        13876        195         20      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_rcv
        13880          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_checksum_init
        13886          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_v4_lookup_longway
        13892          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13897          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13902        165         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_queue_rcv_skb
        13906         13          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_queue_tail
        13909          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13914          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13922        142         25      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  udp_data_ready
        13925         19          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_recv_datagram
        13928         13          9      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_dequeue
        13932          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        13937          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        13949         21          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  csum_partial_copy_to_xdr
        13952         15          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_partial_copy_from_skb
        13955          9          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_read_and_csum_bits
        13958          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_copy_and_csum_bits
        13973         32         15      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_complete_rqst
        13976          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_adjust_cwnd
        13982          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_put_cong
        13984          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write_next
        13993          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_update_rtt
        13999          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_task
        14007          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        14012          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        14018         33          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_free_datagram
        14020         28          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __kfree_skb
        14023          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sock_rfree
        14028         18          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree_skbmem
        14030          8          5      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  skb_release_data
        14033          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
        14041          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
        14053          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        14058          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        14073          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        14078          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        14090          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        14095          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        14112         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- ]]]] start --------------
        14283        632        553     105 timer_interrupt
        14286          8          6      -1 ]  profile_tick
        14289          2          2      -1 ]  ]  profile_hit
        14297         51         13      -1 ]  update_process_times
        14299          8          5      -1 ]  ]  account_system_time
        14302          3          3      -1 ]  ]  ]  update_mem_hiwater
        14310          8          5      -1 ]  ]  run_local_timers
        14313          3          3      -1 ]  ]  ]  raise_softirq
        14321         19         12      -1 ]  ]  scheduler_tick
        14324          2          2      -1 ]  ]  ]  sched_clock
        14331          2          2      -1 ]  ]  ]  sub_preempt_count
        14335          3          3      -1 ]  ]  ]  preempt_schedule
        14343          3          3      -1 ]  ]  run_posix_cpu_timers
        14351         14          6      -1 ]  do_timer
        14354          8          5      -1 ]  ]  update_wall_time
        14357          3          3      -1 ]  ]  ]  update_wall_time_one_tick
        14368          3          3      -1 ]  sub_preempt_count
        14373          3          3      -1 ]  preempt_schedule
    ----------- ]]]] end ----------------
    ----------- **** start --------------
        14379         -1         -1      -1 sub_preempt_count
    ----------- **** end ----------------
    ----------- )))) start --------------
        14543        362          6     105 do_softirq
        14546        356        179     105 )  __do_softirq
        14549        142         20      -1 )  )  run_timer_softirq
        14553          2          2      -1 )  )  )  sub_preempt_count
        14558          2          2      -1 )  )  )  preempt_schedule
        14563        114         22      -1 )  )  )  serial8250_timeout
        14566          4          4      -1 )  )  )  )  serial_in
        14573          3          3      -1 )  )  )  )  serial_in
        14579          7          4      -1 )  )  )  )  check_modem_status
        14581          3          3      -1 )  )  )  )  )  serial_in
        14589         36         15      -1 )  )  )  )  transmit_chars
        14592          3          3      -1 )  )  )  )  )  serial_out
        14598          2          2      -1 )  )  )  )  )  serial_out
        14603          8          5      -1 )  )  )  )  )  uart_write_wakeup
        14606          3          3      -1 )  )  )  )  )  )  __tasklet_schedule
        14614          8          6      -1 )  )  )  )  )  serial8250_stop_tx
        14617          2          2      -1 )  )  )  )  )  )  serial_out
        14627          3          3      -1 )  )  )  )  sub_preempt_count
        14633          2          2      -1 )  )  )  )  preempt_schedule
        14638         37          6      -1 )  )  )  )  mod_timer
        14641         31         18      -1 )  )  )  )  )  __mod_timer
        14646          3          3      -1 )  )  )  )  )  )  internal_add_timer
        14652          2          2      -1 )  )  )  )  )  )  sub_preempt_count
        14657          2          2      -1 )  )  )  )  )  )  preempt_schedule
        14662          3          3      -1 )  )  )  )  )  )  sub_preempt_count
        14667          3          3      -1 )  )  )  )  )  )  preempt_schedule
        14681          2          2      -1 )  )  )  sub_preempt_count
        14686          2          2      -1 )  )  )  preempt_schedule
        14694         36          7      -1 )  )  tasklet_action
        14698         29          4      -1 )  )  )  uart_tasklet_action
        14700         25          6      -1 )  )  )  )  tty_wakeup
        14703         19         12      -1 )  )  )  )  )  __wake_up
        14707          2          2      -1 )  )  )  )  )  )  __wake_up_common
        14712          3          3      -1 )  )  )  )  )  )  sub_preempt_count
        14717          2          2      -1 )  )  )  )  )  )  preempt_schedule
        14732         -1         -1      -1 )  )  sub_preempt_count
    ----------- )))) end ----------------
    ----------- &&&& start --------------
        14907          3          3     105 sub_preempt_count
    ----------- &&&& end ----------------
        14926          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        14931          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        15131        805        804     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  release_sock
        15135          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        15140         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        15142         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- :::: start --------------
        15299        464        388     105 timer_interrupt
        15301          8          6      -1 :  profile_tick
        15304          2          2      -1 :  :  profile_hit
        15311         49         12      -1 :  update_process_times
        15314          8          5      -1 :  :  account_system_time
        15317          3          3      -1 :  :  :  update_mem_hiwater
        15324          8          6      -1 :  :  run_local_timers
        15327          2          2      -1 :  :  :  raise_softirq
        15335         18         11      -1 :  :  scheduler_tick
        15337          3          3      -1 :  :  :  sched_clock
        15343          2          2      -1 :  :  :  sub_preempt_count
        15348          2          2      -1 :  :  :  preempt_schedule
        15355          3          3      -1 :  :  run_posix_cpu_timers
        15363         13          5      -1 :  do_timer
        15365          8          5      -1 :  :  update_wall_time
        15368          3          3      -1 :  :  :  update_wall_time_one_tick
        15378          3          3      -1 :  sub_preempt_count
        15383          3          3      -1 :  preempt_schedule
    ----------- :::: end ----------------
    ----------- \\\\ start --------------
        15388         -1         -1      -1 sub_preempt_count
    ----------- \\\\ end ----------------
    ----------- }}'}} start --------------
        15559        195          6     105 do_softirq
        15562        189        177     105 }  __do_softirq
        15565         13          9      -1 }  }  run_timer_softirq
        15568          2          2      -1 }  }  }  sub_preempt_count
        15573          2          2      -1 }  }  }  preempt_schedule
        15580         -1         -1      -1 }  }  sub_preempt_count
    ----------- }}'}} end ----------------
    ----------- |||| start --------------
        15757          2          2     105 sub_preempt_count
    ----------- |||| end ----------------
        15767          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        15772          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        15996          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_calc_rto
        16002         69          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_release_write
        16005         63          8      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_lock_write_next
        16008         28          9      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
        16011          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16017         16         10      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        16019          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16024          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16029          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        16039         27          7      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
        16041          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16046         17          9      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        16049          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16053          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16058          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        16074          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16079         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        16081         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16235          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        16240          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
    ----------- !!!! start --------------
        16245        473        401     105 timer_interrupt
        16248          7          4      -1 !  profile_tick
        16250          3          3      -1 !  !  profile_hit
        16258         49         13      -1 !  update_process_times
        16260          8          5      -1 !  !  account_system_time
        16263          3          3      -1 !  !  !  update_mem_hiwater
        16271          8          6      -1 !  !  run_local_timers
        16274          2          2      -1 !  !  !  raise_softirq
        16281         18         11      -1 !  !  scheduler_tick
        16284          2          2      -1 !  !  !  sched_clock
        16290          2          2      -1 !  !  !  sub_preempt_count
        16294          3          3      -1 !  !  !  preempt_schedule
        16302          2          2      -1 !  !  run_posix_cpu_timers
        16310         12          4      -1 !  do_timer
        16312          8          6      -1 !  !  update_wall_time
        16315          2          2      -1 !  !  !  update_wall_time_one_tick
        16325          2          2      -1 !  sub_preempt_count
        16330          2          2      -1 !  preempt_schedule
    ----------- !!!! end ----------------
    ----------- @@@@ start --------------
        16335         -1         -1      -1 sub_preempt_count
    ----------- @@@@ end ----------------
    ----------- [[[[ start --------------
        16510        198          5     105 do_softirq
        16513        193        181     105 [  __do_softirq
        16515         13          7      -1 [  [  run_timer_softirq
        16518          3          3      -1 [  [  [  sub_preempt_count
        16523          3          3      -1 [  [  [  preempt_schedule
        16531         -1         -1      -1 [  [  sub_preempt_count
    ----------- [[[[ end ----------------
    ----------- #### start --------------
        16711          2          2     105 sub_preempt_count
    ----------- #### end ----------------
        16924          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        16930          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        16935          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        16940          4          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_status
        16946          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        16951          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        16956          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  lock_kernel
        16961         40         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_decode
        16965         15          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  call_verify
        16968          9          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_checkverf
        16971          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unx_validate
        16983         15          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_unwrap_resp
        16986          9          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  nfs_xdr_attrstat
        16988          5          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xdr_decode_fattr
        17003          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        17008          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        17014       1916         27     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_release_task
        17017          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        17023          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        17028          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_delete_timer
        17033       1824        866     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_release
        17036          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_release_write
        17041          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __xprt_put_cong
        17046         33          6      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mod_timer
        17049         27         16      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __mod_timer
        17052          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  internal_add_timer
        17057          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        17062          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        17067          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        17072          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        17082          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        17087         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        17089         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- ;;;; start --------------
        17248        495        418     105 timer_interrupt
        17251          8          6      -1 ;  profile_tick
        17254          2          2      -1 ;  ;  profile_hit
        17261         50         13      -1 ;  update_process_times
        17264          8          5      -1 ;  ;  account_system_time
        17267          3          3      -1 ;  ;  ;  update_mem_hiwater
        17274          8          6      -1 ;  ;  run_local_timers
        17277          2          2      -1 ;  ;  ;  raise_softirq
        17285         18         10      -1 ;  ;  scheduler_tick
        17287          3          3      -1 ;  ;  ;  sched_clock
        17294          2          2      -1 ;  ;  ;  sub_preempt_count
        17298          3          3      -1 ;  ;  ;  preempt_schedule
        17306          3          3      -1 ;  ;  run_posix_cpu_timers
        17314         13          5      -1 ;  do_timer
        17317          8          5      -1 ;  ;  update_wall_time
        17319          3          3      -1 ;  ;  ;  update_wall_time_one_tick
        17330          3          3      -1 ;  sub_preempt_count
        17335          3          3      -1 ;  preempt_schedule
    ----------- ;;;; end ----------------
    ----------- (((( start --------------
        17340         -1         -1      -1 sub_preempt_count
    ----------- (((( end ----------------
    ----------- $$$$ start --------------
        17524        210          5     105 do_softirq
        17526        205        193     105 $  __do_softirq
        17529         13          9      -1 $  $  run_timer_softirq
        17532          2          2      -1 $  $  $  sub_preempt_count
        17537          2          2      -1 $  $  $  preempt_schedule
        17544         -1         -1      -1 $  $  sub_preempt_count
    ----------- $$$$ end ----------------
    ----------- //// start --------------
        17736          3          3     105 sub_preempt_count
    ----------- //// end ----------------
        17747          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        17752          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        17927        913          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  xprt_clear_backlog
        17930        887        883     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_wake_up_next
        17933          3          3      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __rpc_wake_up_next_priority
        17939          2          2      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        17943         -1          0      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  local_bh_enable
        17946         -1         -1      -1 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        18133          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        18138          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
    ----------- {{'{{ start --------------
        18314        498        424     105 timer_interrupt
        18317          7          5      -1 {  profile_tick
        18320          2          2      -1 {  {  profile_hit
        18327         48         12      -1 {  update_process_times
        18329          8          5      -1 {  {  account_system_time
        18332          3          3      -1 {  {  {  update_mem_hiwater
        18340          7          4      -1 {  {  run_local_timers
        18342          3          3      -1 {  {  {  raise_softirq
        18350         18         11      -1 {  {  scheduler_tick
        18352          3          3      -1 {  {  {  sched_clock
        18358          2          2      -1 {  {  {  sub_preempt_count
        18363          2          2      -1 {  {  {  preempt_schedule
        18370          3          3      -1 {  {  run_posix_cpu_timers
        18378         13          6      -1 {  do_timer
        18381          7          4      -1 {  {  update_wall_time
        18383          3          3      -1 {  {  {  update_wall_time_one_tick
        18393          3          3      -1 {  sub_preempt_count
        18398          3          3      -1 {  preempt_schedule
    ----------- {{'{{ end ----------------
    ----------- %%%% start --------------
        18403         -1         -1      -1 sub_preempt_count
    ----------- %%%% end ----------------
    ----------- ]]]] start --------------
        18592        211          5     105 do_softirq
        18594        206        194     105 ]  __do_softirq
        18597         13          9      -1 ]  ]  run_timer_softirq
        18600          2          2      -1 ]  ]  ]  sub_preempt_count
        18605          2          2      -1 ]  ]  ]  preempt_schedule
        18612         -1         -1      -1 ]  ]  sub_preempt_count
    ----------- ]]]] end ----------------
    ----------- **** start --------------
        18805          3          3     105 sub_preempt_count
    ----------- **** end ----------------
        18820         17         10     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up
        18822          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
        18827          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        18832          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        18843          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        18848          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        18860          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpcauth_unbindcred
        18863          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  put_rpccred
        18871          8          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_free
        18873          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kfree
        18882         23          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_release_client
        18885         17          9     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up
        18887          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
        18892          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        18897          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        18907         19          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_default_free_task
        18910         13          5     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_free
        18913          8          6     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  mempool_free_slab
        18916          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  kmem_cache_free
        18986         25         12     105 %  %  %  %  %  %  %  %  %  %  %  %  %  rpc_clnt_sigunmask
        18990          8          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending
        18992          4          4     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  %  recalc_sigpending_tsk
        19001          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        19006          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        19039         16         10     105 %  %  %  %  %  %  %  %  %  %  %  nfs_update_inode
        19042          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        19047          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        19058         18         12     105 %  %  %  %  %  %  %  %  %  %  %  __wake_up
        19061          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  __wake_up_common
        19066          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        19071          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        19078          3          3     105 %  %  %  %  %  %  %  %  %  %  %  unlock_kernel
        19095         -1          1     105 %  %  %  %  %  %  %  %  %  %  unlock_kernel
        19098          2          2     105 %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        19103         -1          0     105 %  %  %  %  %  %  %  %  %  %  %  preempt_schedule
        19105         -1          0     105 %  %  %  %  %  %  %  %  %  %  %  %  schedule
        19108          2          2     105 %  %  %  %  %  %  %  %  %  %  %  %  %  profile_hit
        19113          3          3     105 %  %  %  %  %  %  %  %  %  %  %  %  %  sched_clock
        19123         -1         -1     105 %  %  %  %  %  %  %  %  %  %  %  %  %  __switch_to
        19236          3          3      33 %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
        19241         86         86      33 %  %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count
    ----------- )))) start --------------
        19244        320        253      33 timer_interrupt
        19247          8          6      -1 )  profile_tick
        19250          2          2      -1 )  )  profile_hit
        19257         44         13      -1 )  update_process_times
        19260          8          5      -1 )  )  account_system_time
        19262          3          3      -1 )  )  )  update_mem_hiwater
        19270          7          4      -1 )  )  run_local_timers
        19272          3          3      -1 )  )  )  raise_softirq
        19280         13          9      -1 )  )  scheduler_tick
        19283          2          2      -1 )  )  )  sched_clock
        19288          2          2      -1 )  )  )  sub_preempt_count
        19295          3          3      -1 )  )  run_posix_cpu_timers
        19303         13          5      -1 )  do_timer
        19306          8          5      -1 )  )  update_wall_time
        19308          3          3      -1 )  )  )  update_wall_time_one_tick
        19319          2          2      -1 )  sub_preempt_count
    ----------- )))) end ----------------
    ----------- &&&& start --------------
        19324         -1         -1      -1 sub_preempt_count
    ----------- &&&& end ----------------
    ----------- :::: start --------------
        19329        226          6      33 do_softirq
        19332        220        213      33 :  __do_softirq
        19335          8          6      -1 :  :  run_timer_softirq
        19338          2          2      -1 :  :  :  sub_preempt_count
        19345         -1         -1      -1 :  :  sub_preempt_count
    ----------- :::: end ----------------
    ----------- \\\\ start --------------
        19557          3          3      33 sub_preempt_count
    ----------- \\\\ end ----------------
        19922          3          3      33 %  %  %  %  %  %  %  %  %  %  %  %  sub_preempt_count


