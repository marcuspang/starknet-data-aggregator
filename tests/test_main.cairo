%lang starknet

from src.main import insert_new_data


@external 
func test{syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(){
    let test = insert_new_data(nftDataStruct);
    %{
        print(ids.test)
    %}

    return();

}