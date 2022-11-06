import { useEffect } from 'react'
import Prism from 'prismjs';

export default function Algorithms() {
  useEffect(() => {
    Prism.highlightAll();
  }, [])

  const algos = [
    {
      name: '24 Hour Volume',
      url: 'https://stackoverflow.com',
      code: `func get_24_hour_volume{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    address: felt // NFT collection address
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
}`
    },
    {
      name: 'Market Cap',
      url: 'https://stackoverflow.com',
      code: `func get_market_cap{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    address: felt // NFT collection address
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
}`
    },
    {
      name: 'Average Price',
      url: 'https://stackoverflow.com',
      code: `func get_average_price{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    address: felt // NFT collection address
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
}`
    },
  ]

  return (
    <div className="px-4 py-2 md:py-4 max-w-4xl m-auto">
      <h1 className="text-3xl md:text-4xl mb-2 md:mb-4 font-bold">
        Algorithms
      </h1>
      <p className="max-w-2xl mb-4">
        We value transparency, so we open-sourced our search algorithms. Our aim is to provide a trustworthy source of data for consumers.
      </p>
      <p className="max-w-2xl">
        Below are the list of algorithms that we are currently using for our data analytics. See something wrong with the algorithms or if you feel that you can improve it, feel free to
        <a href="https://github.com/marcuspang/starknet-data-aggregator" className="text-blue-300"> submit a pull request. </a>
        We welcome all contributions!
      </p>
      <div className="space-y-4 md:space-y-8 mt-4 md:mt-8">
      { algos.map((algo, id) => (
        <div key={id}>
          <h2 className="font-bold text-xl md:text-3xl">{algo.name}</h2>
          <pre className="max-h-80 overflow-y-scroll">
            <code className="language-javascript text-sm">
              {algo.code}
            </code>
          </pre>
        </div>
      )) }
      </div>
    </div>
  )
}
