> From: [eLinux.org](http://eLinux.org/Size_Tunables "http://eLinux.org/Size_Tunables")


# Size Tunables



This page has a list of items that can be configured for the Linux
kernel, which may affect the size (RAM/ROM/static/dynamic) of the
kernel.



### Options from Linux-tiny

<table>
<tbody>
<tr class="odd">
<td align="left">CONFIG option</td>
<td align="left">description</td>
<td align="left">default value</td>
<td align="left">value for small size</td>
<td align="left">Size change (ARM)</td>
<td align="left">Notes</td>
</tr>
<tr class="even">
<td align="left">CONFIG_CORE_SMALL</td>
<td align="left">tune some kernel data sizes</td>
<td align="left">N</td>
<td align="left">Y</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_NET_SMALL</td>
<td align="left">tune some net-related data sizes</td>
<td align="left">N</td>
<td align="left">Y</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">CONFIG_PRINTK</td>
<td align="left">allow disable of printk code and message data</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_BUG</td>
<td align="left">allow elimination of BUG (and BUG_ON??) code</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">CONFIG_ELF_CORE</td>
<td align="left">allow disabling of ELF core dumps</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_PROC_KCORE</td>
<td align="left">allow disabling of /proc/kcore</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">CONFIG_AIO</td>
<td align="left">allow disabling of async IO syscalls</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_XATTR</td>
<td align="left">allow disabling of xattr syscalls</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">CONFIG_FILE_LOCKING</td>
<td align="left">allow disabling of file locking syscalls</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_DIRECTIO</td>
<td align="left">allow disabling of direct IO support</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">CONFIG_MAX_SWAPFILES_SHIFT</td>
<td align="left">number of swapfiles</td>
<td align="left">5</td>
<td align="left">0</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_NR_LDISCS</td>
<td align="left">number of tty line disciplines</td>
<td align="left">16</td>
<td align="left">2?</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">CONFIG_MAX_USER_RT_PRIO</td>
<td align="left">number of RT priority levels (schedule slots)</td>
<td align="left">100</td>
<td align="left">5?</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">Other config options</td>
<td align="left">These are not in Linux-tiny, but help with size</td>
<td align="left">default</td>
<td align="left">small</td>
<td align="left">Size change (ARM)</td>
<td align="left">Notes</td>
</tr>
<tr class="even">
<td align="left">CONFIG_KALLSYMS</td>
<td align="left">load all symbols for debugging/kksymoops</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_SHMEM</td>
<td align="left">allow use of shmem filesystem</td>
<td align="left">Y</td>
<td align="left">N</td>
<td align="left"> ??</td>
<td align="left">.</td>
</tr>
</tbody>
</table>

### Options for size instrumentation

<table>
<tbody>
<tr class="odd">
<td align="left">Options for measuring size</td>
<td align="left">description</td>
<td align="left">default value</td>
<td align="left">value for instrumentation</td>
</tr>
<tr class="even">
<td align="left">CONFIG_KMALLOC_ACCOUNTING</td>
<td align="left">turn on kmalloc accounting</td>
<td align="left">N</td>
<td align="left">Y</td>
</tr>
<tr class="odd">
<td align="left">CONFIG_AUDIT_BOOTMEM</td>
<td align="left">print out all bootmem allocations</td>
<td align="left">N</td>
<td align="left">Y</td>
</tr>
<tr class="even">
<td align="left">CONFIG_DEPRECATE_INLINES</td>
<td align="left">cause compiler to emit info about inlines</td>
<td align="left">N</td>
<td align="left">Y</td>
</tr>
</tbody>
</table>

## options that should be investigated

<table>
<tbody>
<tr class="odd">
<td align="left">Option</td>
<td align="left">default value</td>
<td align="left">value for small size</td>
<td align="left">Size change</td>
<td align="left">Notes</td>
</tr>
<tr class="even">
<td align="left">CONFIG_SERIAL_8250_NR_UARTS</td>
<td align="left">4</td>
<td align="left">0</td>
<td align="left"> ??</td>
<td align="left">only useful for non-legacy ports, depends on hardware, but most embedded hardware has only legacy serial ports</td>
</tr>
</tbody>
</table>

    - by default (at least on my OSK config), several different schedulers are configured

-   only one should be used and others not compiled in.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

