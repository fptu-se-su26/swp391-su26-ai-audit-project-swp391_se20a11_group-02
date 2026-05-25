import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';

export const ContestOverview: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const contestId = id || '42';

  // Password registration interactive states
  const [password, setPassword] = useState('');
  const [registrationMessage, setRegistrationMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  // Dynamic ticking countdown timer (starts from 01:24:55)
  const [timeLeft, setTimeLeft] = useState('01:24:55');

  useEffect(() => {
    const timer = setInterval(() => {
      setTimeLeft((prev) => {
        const parts = prev.split(':').map(Number);
        let hr = parts[0];
        let min = parts[1];
        let sec = parts[2];

        if (sec > 0) {
          sec--;
        } else {
          sec = 59;
          if (min > 0) {
            min--;
          } else {
            min = 59;
            if (hr > 0) hr--;
          }
        }

        const pad = (n: number) => String(n).padStart(2, '0');
        return `${pad(hr)}:${pad(min)}:${pad(sec)}`;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, []);

  const handleRegister = (e: React.FormEvent) => {
    e.preventDefault();
    if (!password.trim()) {
      setRegistrationMessage({
        type: 'error',
        text: 'Please enter the contest password',
      });
      return;
    }

    setRegistrationMessage({
      type: 'success',
      text: 'Successfully registered for the contest!',
    });
    setPassword('');

    // Clear message after 3 seconds
    setTimeout(() => {
      setRegistrationMessage(null);
    }, 3000);
  };

  return (
    <div className="flex-grow flex flex-col md:flex-row w-full max-w-[1920px] mx-auto mt-16 text-left">
      {/* Main Content (Left 85%) */}
      <main className="w-full md:w-[85%] px-4 sm:px-8 py-8 md:py-12 bg-surface-gray">
        <div className="max-w-[1280px] mx-auto flex flex-col gap-8">
          {/* Details Card */}
          <section className="bg-surface rounded-xl ambient-shadow p-8">
            <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
              <span className="material-symbols-outlined text-text-muted">info</span> Contest Details
              <span className="ml-auto bg-brand-green text-white text-label-md font-label-md px-3 py-1 rounded-full">Upcoming</span>
            </h2>
            <div className="grid grid-cols-1 gap-8 mt-6 md:flex">
              <div className="md:col-span-1" style={{ flex: '0 0 70%', maxWidth: '70%' }}>
                <div className="mb-8">
                  <h3 className="text-label-md font-label-md text-text-muted uppercase tracking-wider mb-2">Contest Title</h3>
                  <p className="text-headline-sm font-headline-sm text-text-main font-bold italic">
                    Weekly Algorithm Sprint #42
                  </p>
                </div>
                <div>
                  <h3 className="text-label-md font-label-md text-text-muted uppercase tracking-wider mb-2">SUPPORTED LANGUAGES</h3>
                  <div className="flex flex-wrap gap-2 mt-1">
                    <span className="bg-primary-light text-text-main text-label-md font-label-md px-5 py-2 rounded-full border border-primary/20">C++</span>
                    <span className="bg-primary-light text-text-main text-label-md font-label-md px-5 py-2 rounded-full border border-primary/20">Java</span>
                    <span className="bg-primary-light text-text-main text-label-md font-label-md px-5 py-2 rounded-full border border-primary/20">Python</span>
                    <span className="bg-primary-light text-text-main text-label-md font-label-md px-5 py-2 rounded-full border border-primary/20">Go</span>
                  </div>
                </div>
              </div>
              <div className="md:col-span-1" style={{ flex: '0 0 30%', maxWidth: '30%' }}>
                <h3 className="text-label-md font-label-md text-text-muted uppercase tracking-wider mb-2">Schedule</h3>
                <ul className="text-body-md font-body-md text-text-main space-y-1">
                  <li><strong>Start:</strong> Oct 28, 2024, 10:00 AM UTC</li>
                  <li><strong>End:</strong> Oct 28, 2024, 12:00 PM UTC</li>
                  <li><strong>Duration:</strong> 2 Hours</li>
                </ul>
              </div>
            </div>
          </section>

          {/* Description Card */}
          <section className="bg-surface rounded-xl ambient-shadow p-8">
            <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
              <span className="material-symbols-outlined text-text-muted">description</span>Contest Description
            </h2>
            <div className="mt-6">
              <p className="text-body-md font-body-md text-text-main">
                This weekly sprint focuses on advanced algorithmic problems, covering topics from dynamic programming to graph theory. It is designed to challenge your problem-solving speed and code efficiency.
              </p>
            </div>
          </section>

          {/* Scoring System Card */}
          <section className="bg-surface rounded-xl ambient-shadow p-8">
            <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
              <span className="material-symbols-outlined text-text-muted">score</span>Scoring System
            </h2>
            <div className="mt-6">
              <p className="text-body-md font-body-md text-text-main mb-6">
                This contest follows the official ICPC scoring rules. Rankings are determined primarily by the total number of problems solved.
              </p>
              <div className="bg-surface-gray p-6 rounded-lg border border-gray-200">
                <h4 className="text-label-md font-label-md text-text-muted uppercase tracking-wider mb-4">Penalty Calculation</h4>
                <ul className="text-body-md font-body-md text-text-main space-y-2">
                  <li className="flex items-start gap-2">
                    <span className="material-symbols-outlined text-primary text-[20px]">timer</span>
                    <span><strong>Penalty:</strong> Calculated as the time elapsed from the start of the contest to the successful submission.</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="material-symbols-outlined text-error text-[20px]">history</span>
                    <span><strong>Wrong Submissions:</strong> A penalty of 20 minutes is added for each rejected submission on a problem that is eventually solved.</span>
                  </li>
                  <li className="flex items-start gap-2">
                    <span className="material-symbols-outlined text-text-muted text-[20px]">leaderboard</span>
                    <span><strong>Tie-breaking:</strong> If multiple participants solve the same number of problems, the one with the lower total penalty is ranked higher.</span>
                  </li>
                </ul>
              </div>
            </div>
          </section>

          {/* Rules Card */}
          <section className="bg-surface rounded-xl ambient-shadow p-8">
            <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
              <span className="material-symbols-outlined text-error">gavel</span> Rules &amp; Prohibitions
            </h2>
            <div className="bg-error-container rounded-lg p-6 mt-4 border-l-4 border-error">
              <p className="text-body-md font-body-md text-on-error-container mb-4 font-medium">Strict adherence to the following rules is required. Violations will result in immediate disqualification.</p>
              <ul className="text-body-md font-body-md text-on-error-container list-disc pl-5 space-y-2">
                <li><strong>Plagiarism:</strong> Submitting code that is not entirely your own is strictly prohibited. Automated similarity checkers are active.</li>
                <li><strong>External Assistance:</strong> Communicating with others or soliciting help during the contest is forbidden.</li>
                <li><strong>Multiple Accounts:</strong> Participating with more than one account will lead to a permanent ban from the platform.</li>
              </ul>
            </div>
          </section>
        </div>
      </main>

      {/* Right Sidebar (15%) */}
      <aside className="w-full md:w-[15%] min-w-[280px] bg-surface border-l border-gray-200 flex flex-col relative sticky top-16 h-[calc(100vh-64px)]">
        {/* Sidebar Content */}
        <div className="flex-grow overflow-y-auto py-8 px-6">
          {/* Contest Header / Timer */}
          <div className="mb-10 text-center">
            <h2 className="text-xl font-black text-brand-blue mb-2 tracking-tight">Contest #42</h2>
            <div className="bg-surface-gray rounded-lg p-4 shadow-sm border border-gray-200">
              <p className="text-xs font-label text-text-muted uppercase tracking-wider mb-1">Ends In</p>
              <div className="font-display text-2xl font-bold text-primary tabular-nums tracking-tight">{timeLeft}</div>
            </div>
          </div>
          {/* Navigation Links */}
          <nav className="space-y-2 font-label text-label-md">
            <Link
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-primary font-bold border-l-4 border-primary bg-primary-light/30 shadow-sm translate-x-1 transition-all"
              to={`/contests/${contestId}`}
            >
              <span className="material-symbols-outlined icon-fill">dashboard</span>
              Overview
            </Link>
            <Link
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-muted font-medium hover:bg-surface-gray transition-all"
              to={`/contests/${contestId}/problems`}
            >
              <span className="material-symbols-outlined">extension</span>
              Problems
            </Link>
            <Link
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-muted font-medium hover:bg-surface-gray transition-all"
              to={`/contests/${contestId}/submissions`}
            >
              <span className="material-symbols-outlined">list_alt</span>
              Submissions
            </Link>
            <Link
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-muted font-medium hover:bg-surface-gray transition-all"
              to={`/contests/${contestId}/ranking`}
            >
              <span className="material-symbols-outlined">leaderboard</span>
              Rankings
            </Link>
          </nav>
          <form onSubmit={handleRegister} className="mt-8">
            <div className="mb-4">
              <label className="block text-label-md font-medium text-text-muted mb-2 tracking-wider uppercase text-center" htmlFor="contest-password">
                Contest Password
              </label>
              <input
                className="w-full bg-surface border border-gray-300 rounded-lg px-4 py-2 text-body-md focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-colors"
                id="contest-password"
                placeholder="Enter password"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>
            <button
              className="w-full bg-primary text-white text-label-md font-label-md rounded-xl font-bold hover:bg-primary-hover transition-all duration-200 shadow-sm py-2"
              type="submit"
            >
              Register Now
            </button>
            {registrationMessage && (
              <div
                className={`mt-4 text-xs font-bold p-2.5 rounded-lg text-center ${
                  registrationMessage.type === 'success'
                    ? 'bg-green-50 text-green-700 border border-green-200'
                    : 'bg-red-50 text-red-700 border border-red-200'
                }`}
              >
                {registrationMessage.text}
              </div>
            )}
          </form>
        </div>
        {/* CTA / Footer Area */}
      </aside>
    </div>
  );
};
