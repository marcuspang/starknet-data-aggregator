export default function Home() {
  return (
    <div className="px-4 py-2 md:px-0 max-w-4xl m-auto">
      <section className="flex flex-col items-center gap-8 py-8 md:py-16">
        <h1 className="text-4xl md:text-6xl font-bold text-center">
          A short and cool tagline for the project
        </h1>
        <p>Lorem ipsum put some description here</p>
        <div className="p-2 bg-secondary rounded-full text-xl flex items-center justify-between w-full md:w-3/4">
          <input 
            className="w-[calc(200%-24px)] bg-transparent border-none rounded-full focus:outline-none placeholder:text-neutral-100 placeholder:opacity-50 truncate px-2"
            placeholder="NFT collection address, e.g. 0xb47e3cd837ddf8e4c57f05d70ab865de6e193bbb"
          />
          <button class="p-3 w-28 bg-primary rounded-full flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
            </svg>
          </button>
        </div>
      </section>
      <section className="flex flex-col items-center gap-8 py-8 md:py-16 hidden">
        <h2 className="text-3xl md:text-5xl font-bold text-center">Main Features</h2>
        <div className="flex gap-4 md:gap-8">
          { [1, 2, 3].map((i) => (
            <div className="bg-secondary w-64 h-64 rounded-xl">
            </div>
          )) }
        </div>
      </section>
    </div>
  );
};

