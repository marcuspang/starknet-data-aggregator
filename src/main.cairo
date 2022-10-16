%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256

struct nftDataStruct{
    nft_id: felt,
    nft_name: felt*,
    nft_name_len: felt,
    token_id: Uint256, 
    timestamp: felt,
    purchase_price: Uint256, 
    seller_address: felt,
    buyer_address: felt,
}


@storage_var
func users() -> (users_address: felt){
}

@storage_var
func nftData(nft_id: felt, timestamp: felt) -> (data: nftDataStruct) {
}

@storage_var
func nft_hourly_volume(nft_id: felt, data_time_hour: felt) -> (volume: Uint256) {
}

// avg = volume/amount
@storage_var
func nft_hourly_purchase_amount(nft_id: felt, data_time_hour: felt) -> (volume: Uint256) {
}

@view
func insert_new_data{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(nft_data: nftDataStruct) -> (data: felt){
    let current_nft_data = nft_data.read();
    nft_data.write(current_nft_data);

    //logic 
}



// @constructor
// func constructor{
//     syscall_ptr : felt*,
//     pedersen_ptr : HashBuiltin*,
//     range_check_ptr,
// }(users_address: felt){

//     users.write(users_address);

//     return();

// }


// @view 
// func get_users_address{
//     syscall_ptr : felt*,
//     pedersen_ptr : HashBuiltin*,
//     range_check_ptr,
// }()->(users_address: felt){
//     let user_address = users.read();
//     return(user_address);
// }
    


// @external
// func increase_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     amount: felt
// ) {
//     with_attr error_message("Amount must be positive. Got: {amount}.") {
//         assert_nn(amount);
//     }

//     let (res) = balance.read();
//     balance.write(res + amount);
//     return ();
// }

// @view
// func get_balance{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
//     let (res) = balance.read();
//     return (res,);
// }

// @constructor
// func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
//     balance.write(0);
//     return ();
// }
