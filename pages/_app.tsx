import type { AppProps } from 'next/app'
import Head from 'next/head'

import Header from '../components/Header'
import '../styles/globals.css'
import '../styles/dracula-prism.css'

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <>
      <Head>
        <title>Starknet Data Aggregator</title>
        <meta name="description" content="Starknet Data Aggregator" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Header />
      <main className="bg-neutral-900 text-neutral-100 text-lg md:text-xl">
        <Component {...pageProps} />
      </main>
    </>
  )
}

export default MyApp
