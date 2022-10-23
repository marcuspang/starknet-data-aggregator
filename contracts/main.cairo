%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.uint256 import Uint256

struct NftData {
    nft_id: felt,
    nft_name: felt*,
    nft_name_len: felt,
    token_id: Uint256,
    timestamp: felt,
    purchase_price: Uint256,
    seller_address: felt,
    buyer_address: felt,
}

struct Transaction {
    timestamp: felt,
    amount: felt,
    type: felt,
}

struct TransactionData {
    time: felt,
    amount: felt,
    count: felt,
    value: felt,
}

@storage_var
func transaction(index: felt) -> (tx: Transaction) {
}

@storage_var
func transaction_length() -> (res: felt) {
}

// Sum of all price
@storage_var
func Amount() -> (res: felt) {
}

// Current time (timestamp)
@storage_var
func Time() -> (res: felt) {
}

// Time in data is split based on time_unit
@storage_var
func time_unit() -> (res: felt) {
}

// Insert data to smart contract
@external
func input_data{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    price: felt, timestamp: felt, type: felt
) -> () {
    // create a array of struct pointer
    let (current_index) = transaction_length.read();
    transaction.write(
        index=current_index,
        value=Transaction(timestamp=timestamp, amount=price, type=type)
    );

    return ();
}

// @external
// func input_data_internal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     price: felt, timestamp:felt, type: felt, current_index: felt
// )->(res_len: felt, res: Transaction*) {
//     let(map: Transaction*) = alloc();
//     assert map[current_index] = Transaction(timestamp=timestamp,amount=price,type=type);
//     store_transaction.write(current_index,map);
//     let(res_len,res) = input_data_internal(price,timestamp,type,current_index+1);
//     return(res_len,res);
// }

// @external
// func get_each_amount_internal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     current_index: felt, mapping_len: felt, mapping: Transaction*
// )->(res_len: felt, res: Transaction*){
//     //it reads the value
//     let(current_mapping) = Amount.read();
//     //it assert the value into the Transaction
//     assert mapping[current_index] = current_mapping;
//     let(res_len, res) = get_each_amount_internal(current_index+1, mapping_len-1, mapping);
//     return(res_len, res);
// }

@external
func increase_amount{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(price: felt) {
    let (res) = Amount.read();
    Amount.write(res + price);
    return ();
}

@external
func get_amount{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    let (res) = Amount.read();
    return (res=res);
}

@external
func set_time{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    milisecond: felt
) -> (res: felt) {
    let (res) = Time.read();
    Time.write(milisecond);
    return (res=res);
}
