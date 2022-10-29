%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from main import add_nft_transaction, nft_transaction_data, VolumeData, get_24_hour_volume, NftTransactionData, get_floor_price, get_market_cap
from starkware.cairo.common.uint256 import Uint256

@external
func test_add_nft_transaction{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr} () {
    add_nft_transaction(
        0x43a583b975a201d79c6be02d285dcd28f3d741d3,
        Uint256(low=3685, high=0),
        0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
        0x92701d42e1504ef9fce6d66a2054218b048dda43,
        Uint256(low=2, high=0),
        0,
        0, // BUY
        0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
        1665214595,
        15701918,
    );

    let (tx: NftTransactionData) = nft_transaction_data.read(0);
    assert tx.timestamp = 1665214595;
    return ();
}

@external
func test_get_24_hour_volume{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr} () {
    add_nft_transaction(
        0x43a583b975a201d79c6be02d285dcd28f3d741d3,
        Uint256(low=3685, high=0),
        0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
        0x92701d42e1504ef9fce6d66a2054218b048dda43,
        Uint256(low=2, high=0),
        0,
        0, // BUY
        0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
        1665214595,
        15701918,
    );
    add_nft_transaction(
        0x43a583b975a201d79c6be02d285dcd28f3d741d3,
        Uint256(low=3685, high=0),
        0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
        0x92701d42e1504ef9fce6d66a2054218b048dda43,
        Uint256(low=2, high=0),
        0,
        0, // BUY
        0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
        1665214595,
        15701918,
    );
    add_nft_transaction(
        0x43a583b975a201d79c6be02d285dcd28f3d741d3,
        Uint256(low=3685, high=0),
        0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
        0x92701d42e1504ef9fce6d66a2054218b048dda43,
        Uint256(low=2, high=0),
        0,
        0, // BUY
        0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
        1665214595,
        15701918,
    );

    let (tx_len, tx) = get_24_hour_volume();
    assert tx_len = 3;
    assert tx[0].time = 1665214595;
    assert tx[1].time = 1665214595;
    assert tx[2].time = 1665214595;
    return ();
}

// @external
// func test_get_floor_price{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     arguments
// ) {
//     add_nft_transaction(
//         0x43a583b975a201d79c6be02d285dcd28f3d741d3,
//         Uint256(low=3685, high=0),
//         0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
//         0x92701d42e1504ef9fce6d66a2054218b048dda43,
//         Uint256(low=2, high=0),
//         0,
//         0, // BUY
//         0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
//         1665214595,
//         15701918,
//     );
//     add_nft_transaction(
//         0x43a583b975a201d79c6be02d285dcd28f3d741d3,
//         Uint256(low=3685, high=0),
//         0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
//         0x92701d42e1504ef9fce6d66a2054218b048dda43,
//         Uint256(low=2, high=0),
//         0,
//         0, // BUY
//         0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
//         1665214595,
//         15701918,
//     );
//     add_nft_transaction(
//         0x43a583b975a201d79c6be02d285dcd28f3d741d3,
//         Uint256(low=3685, high=0),
//         0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
//         0x92701d42e1504ef9fce6d66a2054218b048dda43,
//         Uint256(low=2, high=0),
//         0,
//         0, // BUY
//         0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
//         1665214595,
//         15701918,
//     );

//     let (tx_len, tx, max, min) = get_floor_price(100,25);
//     assert tx_len = 3;
//     assert tx[0].time = 1665214595;
//     assert tx[1].time = 1665214595;
//     assert tx[2].time = 1665214595;

//     %{
//         print(ids.tx[0])
//     %}
// }

@external
func test_get_market_cap{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    
) {
    add_nft_transaction(
        0x43a583b975a201d79c6be02d285dcd28f3d741d3,
        Uint256(low=3685, high=0),
        0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
        0x92701d42e1504ef9fce6d66a2054218b048dda43,
        Uint256(low=2, high=0),
        0,
        0, // BUY
        0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
        1665214595,
        15701918,
    );
    add_nft_transaction(
        0x43a583b975a201d79c6be02d285dcd28f3d741d3,
        Uint256(low=3685, high=0),
        0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
        0x92701d42e1504ef9fce6d66a2054218b048dda43,
        Uint256(low=2, high=0),
        0,
        0, // BUY
        0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
        1665214595,
        15701918,
    );
    add_nft_transaction(
        0x43a583b975a201d79c6be02d285dcd28f3d741d3,
        Uint256(low=3685, high=0),
        0xa37c6d5979de9ac7bc6b326431fe57e5e71ea22e,
        0x92701d42e1504ef9fce6d66a2054218b048dda43,
        Uint256(low=2, high=0),
        0,
        0, // BUY
        0x004a9f199657b59366c1620939fc55cb73549de48b6805ce9638cad33ae33d01,
        1665214595,
        15701918,
    );

    let (tx_len, tx) = get_market_cap();
    assert tx_len = 3;
    assert tx[0].amount = Uint256(low=2, high=0);
    assert tx[1].amount = Uint256(low=2, high=0);
    assert tx[2].amount = Uint256(low=2, high=0);

    return();
}