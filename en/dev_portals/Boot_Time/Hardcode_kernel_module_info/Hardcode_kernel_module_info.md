> From: [eLinux.org](http://eLinux.org/Hardcode_kernel_module_info "http://eLinux.org/Hardcode_kernel_module_info")


# Hardcode kernel module info



Sony found that with the 2.4 kernel, and an extremely large kernel
loadable module, it could take the kernel module loader up to 3 seconds
just to scan the relocation table for the module in order to load it.

The following patch allows one to pass some arguments to the kernel
command line to hardcode some of the information that is detected at
module load time. This reduced the module load time significantly for
this situation.

This is a very specialized problem, but in case some one finds this
useful, here's a more detailed description of the problem, and a patch:

## Detailed problem description

We've found that `module_frob_arch_sections(ppc)` takes a long time to
find unique symbols in the relocation sections of the kernel module's
elf header.

Our particular kernel module had a relocation section with 13757
entries(2749 unique ones) in it, and for this module, we measured 3
seconds to process this section by count\_reloc function.

(There may be a way to not generate all this many entries, or not do the
relocations in insmod etc... but we don't know about it at this time.)

We made a patch to just work around this problem by just passing the
size info by the argument when insmod happens, and not do actual
counting.

-Whether we should think of fixing the count algorithm or other proper
way of fixing this. -Whether we should think of an option not to do any
relocations at all

## Patch for 2.4.17 kernel

Download the patch at:
[Elf\_plt\_info.patch](http://eLinux.org/images/3/3f/Elf_plt_info.patch "Elf plt info.patch")

This patch makes it possible to specify the core size and init size,
avoiding the call to module\_frob\_arch\_sections()


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

