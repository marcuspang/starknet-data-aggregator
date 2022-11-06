import { Abi } from '@shardlabs/starknet-hardhat-plugin/dist/src/starknet-types'
import { useContract } from '@starknet-react/core'
import { useStarknetCall } from '@starknet-react/core/dist/hooks'
import Image from 'next/image'
import { useEffect, useState } from 'react'
import abi from "../build/main_abi.json"

interface VolumeData {
  tx: any[];
  tx_len: number;
}

export default function Search() {
  const { contract } = useContract({
    abi: abi as any,
    address: "0x7c84ad9dbfec683c5fa0f12511ccea63b051e64e556e3abcddaef72c40ffbd6",
  })
  const { data, loading, refresh, error } = useStarknetCall({
    contract,
    method: 'get_24_hour_volume',
    args: [],
    options: {
      watch: false,
    }
  })
  
  console.log(data)

  const bannerLoader = ({ src }: { src: string }) => (`https://logo.nftscan.com/banner/${src}.png`)
  const logoLoader = ({ src }: { src: string }) => (`https://logo.nftscan.com/logo/${src}.png`)
  const collection = {
    name: 'CryptoPunks',
    by: 'C352B5',
    details: 'Items 10.0K  ·  Created Jun 2017  ·  Creator fee 0%',
    desc: 'CryptoPunks launched as a fixed set of 10,000 items in mid-2017 and became one of the inspirations for the...',
  }
  const trending = [
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
    { name: 'CrytoPunk #9998', price: '124457.068', url: 'https://opensea.io/assets/ethereum/0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb/9998' },
  ]

  return (
    <>
      <div className="h-32 md:h-56 relative">
        <Image
          loader={bannerLoader}
          src="0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb"
          layout="fill"
          alt='NFT Banner'
          className="object-cover"
        />
        <div className="h-32 md:h-56 max-w-4xl m-auto relative">
          <div className="absolute -bottom-8 md:-bottom-16 left-8 w-4xl m-auto">
            <div className="w-24 h-24 md:w-48 md:h-48 border-4 md:border-8 border-neutral-100 rounded-full relative">
              <Image
                loader={logoLoader}
                src="0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb"
                layout="fill"
                alt='NFT Logo'
                className="object-cover rounded-full"
              />
            </div>
          </div>
        </div>
      </div>
      <div className="px-4 py-2 max-w-4xl m-auto mt-12 md:mt-24">
        <div className="text-sm md:text-lg mb-4 md:mb-8">
          <h1 className="text-2xl md:text-4xl font-bold mb-2 md:mb-4">
            {collection.name}
          </h1>
          <p>By {collection.by}</p>
          <p>{collection.details}</p>
          <p>{collection.desc}</p>
        </div>
        <div className="mb-4 md:mb-8">
          <h2 className="text-xl md:text-3xl font-bold mb-2 md:mb-4">Statistics</h2>
          <div className="card-primary h-64 md:h-84 mb-4 md:mb-6">
            <h3 className="text-lg md:text-2xl font-bold">Volume (past 24 hours)</h3>
          </div>
          <div className="grid sm:grid-cols-2 gap-4 md:gap-6">
            <div className="card-secondary">
              <p className="text-lg md:font-xl font-bold">Market cap</p>
              <p className="text-2xl md:font-3xl font-bold overflow-auto">1,118,474</p>
            </div>
            <div className="card-secondary">
              <p className="text-lg md:font-xl font-bold">No. of owners</p>
              <p className="text-2xl md:font-3xl font-bold overflow-auto">3,764</p>
            </div>
          </div>
        </div>

        <div className="mb-4 md:mb-8">
          <h2 className="text-xl md:text-3xl font-bold mb-2 md:mb-4">Trending</h2>
          <div className="space-y-2 md:space-y-3">
            {trending.map((nft, id) => (
              <div
                key={id}
                className={"flex justify-between " + (id < 3 ? 'card-primary' : 'card-secondary')}
              >
                <div className="flex gap-2 md:gap-4">
                  <div className="w-8 h-8 flex items-center justify-center bg-neutral-100 bg-opacity-10 rounded-full">
                    {id + 1}
                  </div>
                  <div className="w-16 h-16 md:w-24 md:h-24 rounded-xl relative">
                    <Image
                      loader={logoLoader}
                      src="0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb"
                      layout="fill"
                      alt='NFT Logo'
                      className="object-cover rounded-xl"
                    />
                  </div>
                  <div>
                    <p className="md:text-xl font-bold">{nft.name}</p>
                    <p className="text-sm md:text-base font-medium">ETH {nft.price}</p>
                  </div>
                </div>
                <a href={nft.url}>
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M13.5 6H5.25A2.25 2.25 0 003 8.25v10.5A2.25 2.25 0 005.25 21h10.5A2.25 2.25 0 0018 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25" />
                  </svg>
                </a>
              </div>
            ))}
          </div>
        </div>
      </div>
    </>
  )
}
