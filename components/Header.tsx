import Link from 'next/link';
import { useState } from 'react'

export default function Header() {
  const [isMobileNavOpen, setIsMobileNavOpen] = useState(false);

  const navs = [
    // { name: 'Search', slug: 'search' },
    { name: 'Algorithms', slug: 'algorithms' },
    // { name: 'About', slug: 'about' },
  ]

  return (
    <header className="font-medium text-lg md:text-xl bg-neutral-900 text-neutral-100 w-full">
      <nav className="h-16 px-4 py-3  flex items-center justify-between max-w-4xl m-auto">
        <Link href="/"><a>Starknet2</a></Link>
        <div className="space-x-4 hidden md:block">
          { navs.map((nav) => (
            <Link href={nav.slug} key={nav.slug} >
              <a>{ nav.name }</a>
            </Link>
          )) }
          <a href="https://github.com/marcuspang/starknet-data-aggregator">
            GitHub
          </a>
        </div>
        <button className="md:hidden" onClick={() => setIsMobileNavOpen(!isMobileNavOpen)}>
          { isMobileNavOpen 
            ? (
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                  <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
            ) : (
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                <path strokeLinecap="round" strokeLinejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
              </svg>
            )}
        </button>
      </nav>
      <div className={"md:hidden " + (isMobileNavOpen ? 'block' : 'hidden')}>
        { navs.map((nav) => (
            <Link href={nav.slug} key={nav.slug}>
              <a>
                <div className="flex hover:cursor-pointer hover:bg-neutral-800 px-3 py-2" onClick={() => setIsMobileNavOpen(false)}>
                  { nav.name }
                </div>
              </a>
            </Link>
        )) }
      </div>
    </header>
  )
}
