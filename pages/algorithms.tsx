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
      code: `function volume24Hour(
    address from,
    address to,
    uint id
) public {
    require(from == _ownerOf[id], "from != owner");
    require(to != address(0), "transfer to zero address");

    require(_isApprovedOrOwner(from, msg.sender, id), "not authorized");

    _balanceOf[from]--;
    _balanceOf[to]++;
    _ownerOf[id] = to;

    delete _approvals[id];

    emit Transfer(from, to, id);
}
      `
    },
    {
      name: 'Market Cap',
      url: 'https://stackoverflow.com',
      code: `function marketCap(
    address from,
    address to,
    uint id
) public {
    require(from == _ownerOf[id], "from != owner");
    require(to != address(0), "transfer to zero address");

    require(_isApprovedOrOwner(from, msg.sender, id), "not authorized");

    _balanceOf[from]--;
    _balanceOf[to]++;
    _ownerOf[id] = to;

    delete _approvals[id];

    emit Transfer(from, to, id);
}
      `
    },
    {
      name: 'No. of Owners',
      url: 'https://stackoverflow.com',
      code: `function marketCap(
    address from,
    address to,
    uint id
) public {
    require(from == _ownerOf[id], "from != owner");
    require(to != address(0), "transfer to zero address");

    require(_isApprovedOrOwner(from, msg.sender, id), "not authorized");

    _balanceOf[from]--;
    _balanceOf[to]++;
    _ownerOf[id] = to;

    delete _approvals[id];

    emit Transfer(from, to, id);
}
      `
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
