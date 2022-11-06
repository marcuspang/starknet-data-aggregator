import type { AppProps } from 'next/app'
import Head from 'next/head'

import Header from '../components/Header'
import '../styles/globals.css'
import '../styles/dracula-prism.css'
import { InjectedConnector, StarknetConfig } from '@starknet-react/core'

const connectors = [
  new InjectedConnector({ options: { id: 'braavos' } }),
  new InjectedConnector({ options: { id: 'argentX' } }),
]
function MyApp({ Component, pageProps }: AppProps) {
  return (
    <StarknetConfig connectors={connectors}>
      <Head>
        <title>Starknet Data Aggregator</title>
        <meta name="description" content="Starknet Data Aggregator" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Header />
      <main className="bg-neutral-900 text-neutral-100 text-lg md:text-xl">
        <Component {...pageProps} />
      </main>
    </StarknetConfig>
  )
}

export default MyApp
