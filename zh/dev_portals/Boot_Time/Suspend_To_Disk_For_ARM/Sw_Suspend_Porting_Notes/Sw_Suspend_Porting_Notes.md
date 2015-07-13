> From: [eLinux.org](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/Sw_Suspend_Porting_Notes/Sw_Suspend/Sw_Suspend.md_Porting_Notes "../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/Sw_Suspend_Porting_Notes/Sw_Suspend/Sw_Suspend.md_Porting_Notes")


# Sw Suspend Porting Notes



[brackets are text that you should replace when creating a new page
based on this template]

## Contents

-   [1 Description](#description)
-   [2 How to implement or use](#how-to-implement-or-use)
-   [3 Expected Improvement](#expected-improvement)
-   [4 Resources](#resources)
    -   [4.1 Projects](#projects)
    -   [4.2 Specifications](#specifications)
    -   [4.3 Patches](#patches)
-   [5 Case Studies](#case-studies)
    -   [5.1 Case 1](#case-1)
    -   [5.2 Case 2](#case-2)
    -   [5.3 Case 3](#case-3)

## Description

This document describes how to add kernel 2.6.11 [Sw
Suspend](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/Sw_Suspend_Porting_Notes/Sw_Suspend/Sw_Suspend.md "Sw Suspend") support to target architecture with
minimum effort.

Here, "xxx" denotes target architecture name which we'll add [Sw
Suspend](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/Sw_Suspend_Porting_Notes/Sw_Suspend/Sw_Suspend.md "Sw Suspend") support to,

## How to implement or use

-   Make new include file include/asm-xxx/suspend.h

<!-- -->

       in this file you should declare arch_prepare_suspend() and
       saved_context structure.
       The arch_prepare_suspend() could be a empty function
       returns zero, in most case.
       Structure saved_context would be used to hold processor
       state except caller and callee registers, just before
       suspending.

    *Add following functions into include/asm-xxx/tlbflush.h and implement those function.

    __flush_tlb_all(void)
    __flush_tlb_global(void)



    *Add following line to arc/xxx/Makefile

    drivers-$(CONFIG_PM)        += arch/xxx/power/



-   Make new directory "power" under arch/xxx.

-   Add new/arch/xxx/power/Makefile {{{

obj-\$(CONFIG\_SOFTWARE\_SUSPEND) += cpu.o swsusp.o }}}

       NOTE: we assume "standby" and "mem" require no cpu
       state saver/restore described at saved_context and
       functions on cpu.c.

-   Implement following four functions in arch/xxx/power/cpu.c and
    arch/power/swsusp.S

-   -   arch/xxx/power/cpu.c

<!-- -->

     Add save_processor_state() and restore_processor_state()


    EXPORT_SYMBOL(save_processor_state);
    EXPORT_SYMBOL(restore_processor_state);



    void save_processor_state(void)
    {
        __save_processor_state(&saved_context);
    }

    void restore_processor_state(void)
    {
        __restore_processor_state(&saved_context);
    }



-   -   And implement following functions; {{{

void \_\_save\_processor\_state(struct saved\_context \*ctxt) {

       preempt_disable();    /* save preempt state and disable it */

           Save and disable lazy fpu switching, if needed.

       Save CPU state into *ctxt, using asm statements.

} }}}

    void __restore_processor_state(struct saved_context *ctxt)
    {
        Restore CPU state from *ctxt, using asm statements.

        Restore lazy fpu switching, if needed

        preempt_enable();    /* restore preempt state */
    }



-   -   arch/xxx/power/swsusp.S

<!-- -->

     Implement following functions with asm.
     Don't use any variable on stack.



    static u32 RA;
    static struct callee_save_registers CSR;

    int swsusp_arch_suspend(void)
    {
        register u32    ret_val;

        RA = return address;
        save callee_save_registers to CSR,
            including FPU registers, if needed.
        ret_val = swsusp_save();
    }    return to RA with ret_val;


    int swsusp_arch_resume(void)
    {
        register u32    ret_val;
        register u32    *src, *dst;

        for (j = nr_copy_pages; j>0; j--) {
            src = pagedir_nosave[j].src;
            dst = pagedir_nosave[j].dst;
            for (i=0;i<1024;i++) {
            *dst++ = *src++;
            }
        }
        sync to mem

        restore callee_save_registers from CSR;

        ret_val = swsusp_restore();

        return to RA with ret_val;
    }



-   -   linker script (E.g. arch/ppc/kernel/vminux.lds.S)

-   -   -   For debug purpose, we'd like to keep following two symbols
            into beginning and ending of kernel text, respectively.

<!-- -->

           _kern_text_start, _kern_text_end



-   -   -   Add following data\_nosave section handling. We assume 4K
            page in this sample. {{{

<!-- -->

     . = ALIGN(4096);
     __nosave_begin = .;
     .data_nosave : { *(.data.nosave) }
     . = ALIGN(4096);
     __nosave_end = .;

}}}



## Expected Improvement

[describe the expected effect of using the technique]

## Resources

### Projects

[list any open source projects related to this technique]

### Specifications

[list or link to CELF specifications related to this technique]

### Patches

[list or link to any patches related to this technique]

## Case Studies

### Case 1

[put information about an actual use of this technique here. A case
study should include:]

 Hardware 
[hardware description here]

 Kernel Version 
[kernel version here]

 Configuration 
[information about the configuration used here]

 Time without change 
[put that here]

 Time with change 
[put that here]


 [Add any additional notes as you see fit.]

### Case 2

### Case 3


