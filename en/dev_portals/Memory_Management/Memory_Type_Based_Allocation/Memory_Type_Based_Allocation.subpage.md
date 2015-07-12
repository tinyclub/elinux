# Memory Type Based Allocation
## Contents
## Introduction
## Purpose of Feature
## Feature Requirements
* Heap_memory
## High Level Design
### Memory Type Information in ELF Binaries and the Elfmemtypes Utility
* Heap_memory
* Heap_memory
## The MTA Config File and the Mtaconfig Script
### define\_node keyword
### tag\_elf keyword
### Load\_elf\_binary()
### load\_elf\_interp()
### The Program Interpreter (ld.so)
### memtypes\_to\_nodelist()
### The node\_list Object
### do\_mmap\_nodelist() and do\_brk\_nodelist()
### setup\_arg\_pages()
## Page Fault Exception Handler
## Allocating Pages
## Default Page Allocator
## Allocating Pages With a Node List
## Kernel API’s
### Allocating Whole Pages, alloc\_pages\_nodelist()
### Slab Allocator, kmalloc\_nodelist()
### do\_mmap\_nodelist() and do\_brk\_nodelist()
## User API’s
### Mmap\_memtypes() and brk\_memtypes()
### /proc Interface
#### /proc/nodeinfo
## Tracing MTA with Linux Trace Toolkit
# Additional Information
## Porting MTA to other Architectures
## Limitations
## Future Enhancements
## Notes
## Source Code
