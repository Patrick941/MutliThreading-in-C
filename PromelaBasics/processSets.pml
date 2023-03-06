//Run this code with "spin -T processSets.pml" for readable results

active [100] proctype P() {
    printf("This is process P%d\n", _pid)
}