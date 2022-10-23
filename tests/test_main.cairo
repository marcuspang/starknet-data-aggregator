%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from contracts.main import input_data, transaction, Transaction


@external
func test_insert{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let test = input_data(1, 1, 0);
    let (tx: Transaction) = transaction.read(0);
    assert tx.timestamp = 1;
    return ();
}
