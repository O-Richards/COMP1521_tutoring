# Tutorial 10 - Processes

## Processes

Process - instance of an executing program

Operating System maintains a state for each process. This includes: 
    
    * Address space (page table)
    * Open file descriptors
    * process ID
    * privileges - owner, group
    * status - running, ready, suspended, exited
    * etc.

Processes execute within a *context* this includes:
    
    * arguments (argv)
    * environment variables (envp) - accessible with getenv()
    * ...


## Virtual Memory

* To allow sharing of physical memory among many processes (as well as other benefits)
* Divide physical memory into a set of page frames (fixed sized chunks)
* Virtual Memory - the processes view of its memory space
    * Consists of a set of pages which are stored in physical page frames (or on the disk, or nonexistent if unused)

### Questions

8. What is the difference between a virtual address and a physical address? 

9. Consider a process whose address space is partitioned into 4KB pages and the pages are distributed across the memory as shown in the diagram below:

![alt text][proc_memory]

The low byte address in the process is 0 (in Code1) and the top byte address in the process is 28671 (max address in page containing Stack2).

For each of the following process addresses (in decimal notation), determine what physical address it maps to.

    jal func, where the label func is at 5096
    lw $s0,($sp), where $sp contains 28668
    la $t0, msg, where the label msg is at 10192 


### Page Replacement Policy

* When using virtual memory, pages can be stored on the HDD to allow for a large virtual memory space
* Saving a page to the HDD and reading it back is *slow*!
* When our physical memory is full, we need a policy to decide which page should be kicked out and stored on the HDD
* Commonly used (and simple) policy is LRU - Least Recently Used
    * Kick out the page that was accessed the longest ago 
    * intuition - if the page hasnt been used in a while, it is unlikely to be needed soon

* Do question 4


[proc_memory]: ./resources/proc-mem.png
