%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from contracts.main import input_data


@external
func test_insert{syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(){
    let test = input_data();
    %{
        print(ids.test)
    %}

    return();

}
