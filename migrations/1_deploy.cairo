%lang starknet

@external
func up() {
    %{
        main_contract_address = deploy_contract("./build/main.json").contract_address
    %}
    return ();
}

@external
func down() {
    %{ assert False, "Not implemented" %}
    return ();
}
