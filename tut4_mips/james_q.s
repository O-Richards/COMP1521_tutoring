#int main(void) {

#int x = 65;
#
#if (x > 60) {
    // if x <= 60 then skip this part
    //    60 >= x
    #printf("60");
#} else if (x > 50) {
    #printf("50");
#} else {
    #printf("else");
#}
#return 0;
#}
main:
# x = $t0
    li  $t0, 55
    
    li  $t1, 60
    bge  $t1, $t0, if_x_gt_60_end
if_x_gt_60:
    #printf("60");
    j if_end

if_x_gt_60_end:
    li  $t1, 50
    bge  $t1, $t0, if_x_gt_50_end
elif_x_gt_50:
    # print
    j if_end

if_x_gt_50_end:
else:
    #print whatever
    j if_end

if_end:
    #return 0
    li $v0, 0
    jr $ra


