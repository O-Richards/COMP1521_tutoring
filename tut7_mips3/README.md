# Tutorial 7 - More Mips

## Array Access in Mips

To access data in arrays:
    1. Find the address of the element of interest
    ```&arr[i] = base_address + i * sizeof(element)```
    2. If read use lb or lw on this address, if write use sb or sw

### 2D arrays
    Think of this as finding the area up to the element of interest
    I.e. if we want to retrieve element <i, j> we do:
    1. Find area/size of the rows 0...(i-1) ```size = i * sizeof(row)```
    2. Find the area/size of row i that we have used ```size = j * sizeof(element)```
    3. Add the offset(s) to the base address of the array
    ```
    &arr[i][j] = sizeof(element)*(i*num_cols + j)
    ```

### 3D arrays
    Just keep generalising!
    array has dimensions <height, width, depth>
    ```
    &arr[i][j][k] = sizeof(element)*(i*width*depth + j*depth + k)
    ```

## Functions in Mips

Remember that registers are a shared resource among *all* functions
Problems we need to solve to call functions
    1. Where should we place arguments -> in the $a* registers or on the stack
    2. Where should we place return values -> in $v0 or on the stack
    3. When the function returns what PC should it jump to -> use the $ra register to maintain this
    4. How do we backup important registers that should not change accross function calls
        i.e. my $ra, $fp, $sp, $s*
        Push them onto the stack!

See simple_functions.s


