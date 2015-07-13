# Kernel dynamic memory analysis
* Kernel_dynamic_memory_allocation_tracking_and_reduction
## Contents
## Instrumentation overview
## Using debugfs and ftrace
#### Debugfs
#### Tracing
## Obtaining accurate call sites (or The painstaking task of wrestling against gcc)
## Memory accounting
### Types of memory
### Static memory
#### The size command
#### readelf
#### objdump
### Dynamic
#### Internal fragmentation
#### Accounting with kmem events trace
#### Enabling and reading kmem trace
#### About kmem trace events
#### Pitfall: ringbuffer overrun
## Using the trace\_analyze.py post-processing script
### Getting the script
### Using trace\_analyze.py for static analysis
#### Using it
#### Under the hood
#### TODO
### Using trace\_analyze.py for dynamic analysis
#### Producing a kmem trace log file
#### Slab accounting file output
#### Producing a pretty ringchart for dynamic allocations
#### Pitfall: wrongly reported allocation (and how to fix it)
## Internal fragmentation in SLAB allocators: a simple comparison
### Kmalloc objects
#### SLOB
#### SLUB
#### SLAB
### Cache objects
#### SLOB
#### SLAB
#### SLUB
## Reporting
## Visualization
### Current dynamic footprint
### Static footprint
## Mainline status
### Accepted
### Nacked
* File:0001-Makefile-Add-option-to-disable-gcc-automatic-inlinin.patch
## Recommendations for reductions
### Move to a section of its own?
## Slab account
* File:0001-mm-sl-aou-b-Add-slab-accounting-debugging-feature-v3.6.patch
## Testing feedback
* Talk:Kernel_dynamic_memory_analysis
