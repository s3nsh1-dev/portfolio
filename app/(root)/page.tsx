import React from "react";

const Page = () => {
  return (
    <main className="min-h-screen flex items-center justify-center bg-slate-50 dark:bg-slate-900 px-6">
      <section className="max-w-2xl w-full bg-white dark:bg-slate-800 rounded-2xl shadow-lg p-8">
        <h1 className="text-3xl md:text-4xl font-bold text-slate-900 dark:text-slate-100">
          Hello, I am Shubham Pandey
        </h1>

        <div className="mt-6">
          <a
            href="https://www.linkedin.com/in/pandey228/"
            className="inline-block rounded-md bg-sky-600 text-white px-4 py-2 hover:bg-sky-700 transition"
            target="_blank"
            rel="noopener noreferrer"
          >
            Contact me
          </a>
        </div>
      </section>
    </main>
  );
};

export default Page;
