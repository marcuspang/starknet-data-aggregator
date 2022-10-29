%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.uint256 import (Uint256, split_64)
from starkware.cairo.common.bool import FALSE, TRUE

struct NftTransactionData {
    collection_address: felt,
    token_id: Uint256,
    buyer_address: felt,
    seller_address: felt,
    price: Uint256,
    payment_token: felt,
    event_type: felt, // 0 for BUY, 1 for SALE
    tx_hash: felt,
    timestamp: felt,
    block_number: felt,
}

struct VolumeData {
    time: felt, // in minutes
    count: felt, // no. of tx
    amount: Uint256, // total amount transacted
}

struct MarketCap {
    count: felt,
    amount: Uint256,
}

struct FloorPriceData {
    price: Uint256,
}

struct WalletTransaction {
    address: felt,
    txHash: felt,
    // 0 -> buyer
    // 1 -> seller
    // 2 -> from
    // 3 -> to
    type: felt,
}

struct AveragePrice {
    time: felt,
    average_price: Uint256,
}

@storage_var
func nft_transaction_data(index: felt) -> (tx: NftTransactionData) {
}

@storage_var
func nft_transaction_data_length() -> (res: felt) {
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
func add_nft_transaction{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr} (
    collection_address: felt,
    token_id: Uint256,
    buyer_address: felt,
    seller_address: felt,
    price: Uint256,
    payment_token: felt,
    event_type: felt, // 0 for BUY, 1 for SALE
    tx_hash: felt,
    timestamp: felt,
    block_number: felt
) -> () {
    // create a array of struct pointer
    let (current_index) = nft_transaction_data_length.read();
    nft_transaction_data.write(
        index=current_index,
        value=NftTransactionData(
            collection_address=collection_address,
            token_id= token_id,
            buyer_address= buyer_address,
            seller_address= seller_address,
            price= price,
            payment_token= payment_token,
            event_type=event_type,
            tx_hash= tx_hash,
            timestamp=timestamp,
            block_number=block_number,
        )
    );
    nft_transaction_data_length.write(value=current_index + 1);

    return ();
}


@view
func get_24_hour_volume{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    // address: felt // NFT collection address
) -> (tx_len: felt, tx: VolumeData*) {
    let (total_length) = nft_transaction_data_length.read();
    let (tx: VolumeData*) = alloc();
    let (tx_len, final_tx) = get_24_hour_volume_internal(0, total_length, 0, tx);
    return (tx_len, final_tx);
}

func get_24_hour_volume_internal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    current_index: felt, total_length: felt, tx_len: felt, tx: VolumeData*
) -> (tx_len: felt, tx: VolumeData*) {
    if (current_index == total_length) {
        return (tx_len, tx);
    }
    let (nft_tx) = nft_transaction_data.read(current_index);

    assert tx[current_index] = VolumeData(
        time=nft_tx.timestamp,
        count=1,
        amount=nft_tx.price,
    );

    let (tx_len, tx) = get_24_hour_volume_internal(current_index + 1, total_length, tx_len + 1, tx);

    return (tx_len, tx);
}

@view
func get_market_cap{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    // address: felt // NFT collection address
) -> (tx_len: felt, tx: MarketCap*) {
    let (total_length) = nft_transaction_data_length.read();
    let (tx: MarketCap*) = alloc();
    let (tx_len, final_tx) = get_market_cap_internal(0, total_length, 0, tx);
    return (tx_len, final_tx);
}
func get_market_cap_internal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    current_index: felt, total_length: felt, tx_len: felt, tx: MarketCap*
) -> (tx_len: felt, tx: MarketCap*) {
    if(current_index == total_length){
        return(tx_len, tx);
    }

    let (nft_tx) = nft_transaction_data.read(current_index);


    assert tx[current_index] = MarketCap(
        count=1,
        amount=nft_tx.price,
    );

    let (tx_len, tx) = get_market_cap_internal(current_index + 1, total_length, tx_len + 1, tx);

    return (tx_len, tx);
}

@external
func get_average_price{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    //address
)-> (tx_len: felt, tx: AveragePrice*) {
    let (total_length) = nft_transaction_data_length.read();
    let (tx: AveragePrice*) = alloc();
    let (tx_len, final_tx) = get_average_price_internal(0, total_length, 0, tx);
    return (tx_len, final_tx);
}

func get_average_price_internal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    current_index: felt, total_length: felt, tx_len: felt, tx: AveragePrice*
)->(tx_len:felt, tx: AveragePrice*) {
    if(current_index == total_length){
        return(tx_len, tx);
    }

    let (nft_tx) = nft_transaction_data.read(current_index);


    assert tx[current_index] = AveragePrice(
        time=nft_tx.timestamp,
        average_price=nft_tx.price,
    );

    let (tx_len, tx) = get_average_price_internal(current_index + 1, total_length, tx_len + 1, tx);

    return (tx_len, tx);
}

//marketcap done
//floor price done
//average price (daily) 
//wallet interacted


@view
func get_floor_price{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    max: felt, min: felt
)->(tx_len: felt, tx: FloorPriceData*,max: felt, min: felt) {
    let (total_length) = nft_transaction_data_length.read();
    let (tx: FloorPriceData*) = alloc();
    let (tx_len, final_tx) = get_floor_price_internal(0, total_length, 0, tx);
    return (tx_len, final_tx,max,min);
}
func get_floor_price_internal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    current_index: felt, total_length: felt, tx_len: felt, tx: FloorPriceData*
) -> (tx_len: felt, tx: FloorPriceData*) {
    if(current_index == total_length){
        return(tx_len,tx);
    }
    let (nft_tx) = nft_transaction_data.read(current_index);


    let(tx_len,tx) = get_floor_price_internal(current_index + 1,total_length,tx_len + 1,tx);

    return(tx_len,tx);
    

}

@external
func get_24_hour_wallets_interacted{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    address: felt // NFT collection address
) -> (tx_len: felt, tx: WalletTransaction*) {
     let (total_length) = nft_transaction_data_length.read();
    let (tx: WalletTransaction*) = alloc();
    let (tx_len, final_tx) = get_24_hour_wallets_interacted_internal(0, total_length, 0, tx);
    return (tx_len, final_tx);
}


func get_24_hour_wallets_interacted_internal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    current_index: felt, total_length: felt, wallets_len: felt, wallets: WalletTransaction*
) -> (wallets_len: felt, wallets: WalletTransaction*) {
    if(current_index == total_length){
        return(wallets_len,wallets);
    }
    let(nft_tx) = nft_transaction_data.read(current_index);

    assert tx[current_index] = WalletTransaction(
        address=nft_tx.buyer_address,
        tx_hash=nft_tx.tx_hash,
        type=nft_tx.event_type,
    );

    let(wallets_len,wallets) = get_24_hour_wallets_interacted_internal(current_index + 1,total_length,wallets_len + 1,wallets);

    return(wallets_len,wallets);
}

// // average of latest price traded for every NFT in collection
// @external
// func get24HourAveragePrice{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     address: felt // NFT collection address
// ) -> (average_price: felt) {

// }

// // array of {averagePrice, time}
// @external
// func get24HourAveragePrices{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     address: felt // NFT collection address
// ) -> (avg_prices_len: felt, avg_prices: AveragePrice*) {

// }

// @external
// func get24HourFloorPrice{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     address: felt // NFT collection address
// ) -> (floor_price: felt) {

// }


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
