import type { NextPage } from "next";
import Head from "next/head";

const Home: NextPage = () => {
  return (
    <div>
      <Head>
        <title>Starknet Data Aggregator</title>
        <meta name="description" content="Starknet Data Aggregator" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main>
        <h1 className="text-3xl font-bold underline">Hello world!</h1>
      </main>
      <footer></footer>
    </div>
  );
};

export default Home;