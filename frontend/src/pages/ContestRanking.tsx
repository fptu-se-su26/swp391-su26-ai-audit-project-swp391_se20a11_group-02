import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';

export const ContestRanking: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const [timeLeft, setTimeLeft] = useState<string>('01:24:55');

  // Tick countdown timer
  useEffect(() => {
    const timer = setInterval(() => {
      setTimeLeft(prev => {
        const parts = prev.split(':').map(Number);
        let sec = parts[2];
        let min = parts[1];
        let hr = parts[0];

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

  return (
    <div className="flex-grow flex flex-col w-full max-w-[1920px] mx-auto text-left relative z-10">
      {/* Top Section: Chart (85%) and Sidebar (15%) */}
      <div className="flex flex-col md:flex-row w-full items-stretch">
        {/* Main Content (Left 85%) */}
        <main className="w-full md:w-[85%] px-4 sm:px-8 py-8 md:py-12 bg-surface-gray">
          <div className="max-w-[1280px] mx-auto flex flex-col gap-8">
            {/* Chart Section */}
            <section className="bg-white rounded-xl p-6 shadow-sm border border-gray-200 flex flex-col gap-4 relative overflow-hidden group">
              <div className="absolute -top-24 -right-24 w-64 h-64 bg-primary/5 rounded-full blur-3xl group-hover:bg-primary/10 transition-colors duration-700 pointer-events-none"></div>
              <h2 className="font-headline text-headline-md text-text-main relative z-10 flex items-center gap-2 font-bold text-xl">
                <span className="material-symbols-outlined text-primary">monitoring</span> Top 10 Teams Progress
              </h2>
              <p className="text-body-md text-text-muted mb-2 relative z-10">Chart showing the number of solved problems and penalty points in real-time.</p>
              <div className="w-full h-[280px] md:h-[360px] rounded-lg overflow-hidden border border-gray-200 bg-white relative z-10 shadow-inner">
                <img alt="Progression Chart" className="w-full h-full object-cover opacity-90 mix-blend-multiply" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAaOPGcVS0Nyr_T2bNPQfNEdalQuiW7ZsoPZyS4sl5ZgC-vM6naki8bQFXPCsZr4TvX1dijb9DPoOmgwc8BnlcpsPE-3tmwJCvjxCv8b6EILrx1IHtligV13EME7cTK1_HBXBaQs8bPyVz9h5MgC-1p0UhUk-nBhEdjxuCqRLE8DI8osgI75m88pGv5zSaZjXvePu2wM5FuwH8qpwSfX_9pQdxYv74_f8pzW69ysbmvIoKoxXRUTU8XmU4lhSP_w_EF_1utDvN3Kvk" />
              </div>
            </section>
          </div>
        </main>

        {/* Right Sidebar (15%) */}
        <aside className="w-full md:w-[15%] min-w-[280px] bg-white border-l border-gray-200 flex flex-col relative sticky top-16 h-[calc(100vh-64px)]">
          <div className="flex-grow overflow-y-auto py-8 px-6">
            <div className="mb-10 text-center">
              <h2 className="text-xl font-black text-text-main mb-2 tracking-tight">Contest #42</h2>
              <div className="bg-surface-gray rounded-lg p-4 shadow-sm border border-gray-200">
                <p className="text-xs font-label text-text-muted uppercase tracking-wider mb-1">Ends In</p>
                <div className="font-display text-2xl font-bold text-primary tabular-nums tracking-tight">{timeLeft}</div>
              </div>
            </div>
            <nav className="space-y-2 font-label text-sm">
              <Link className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-muted font-medium hover:bg-surface-gray transition-all" to={`/contests/${id || 42}`}><span className="material-symbols-outlined">dashboard</span> Overview</Link>
              <Link className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-muted font-medium hover:bg-surface-gray transition-all" to={`/contests/${id || 42}/problems`}><span className="material-symbols-outlined">extension</span> Problems</Link>
              <Link className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-muted font-medium hover:bg-surface-gray transition-all" to={`/contests/${id || 42}/submissions`}><span className="material-symbols-outlined">list_alt</span> Submissions</Link>
              <Link className="flex items-center gap-3 py-3 px-4 rounded-lg text-primary font-bold border-l-4 border-primary bg-primary-light/40 shadow-sm translate-x-1 transition-all" to={`/contests/${id || 42}/ranking`}><span className="material-symbols-outlined icon-fill">leaderboard</span> Rankings</Link>
            </nav>
          </div>
        </aside>
      </div>

      {/* Bottom Section: Detailed Scoreboard (100%) */}
      <div className="w-full px-4 sm:px-8 pb-8 pt-4">
        <section className="bg-white rounded-xl shadow-[0_4px_20px_rgba(18,40,76,0.05)] border border-gray-200 overflow-hidden flex flex-col w-full">
          <div className="p-4 border-b border-gray-200 bg-white flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
            <h3 className="font-headline text-headline-md text-text-main font-bold text-lg">Detailed Scoreboard</h3>
            <div className="flex items-center gap-4 text-sm flex-wrap">
              <div className="flex items-center gap-1"><span className="w-3 h-3 rounded-sm block bg-brand-blue"></span> <span className="text-text-muted text-xs">First Solve</span></div>
              <div className="flex items-center gap-1"><span className="w-3 h-3 rounded-sm block bg-brand-green"></span> <span className="text-text-muted text-xs">Accepted</span></div>
              <div className="flex items-center gap-1"><span className="w-3 h-3 rounded-sm block bg-primary"></span> <span className="text-text-muted text-xs">Wrong/Penalty</span></div>
            </div>
          </div>
          <div className="overflow-x-auto w-full">
            <table className="w-max text-left border-collapse min-w-[1200px] w-full">
              <thead>
                <tr className="bg-surface-gray text-text-main font-label text-xs border-b-2 border-gray-200">
                  <th className="p-4 font-semibold w-12 text-center sticky left-0 bg-surface-gray z-25 shadow-[1px_0_0_#e2e8f0]">#</th>
                  <th className="p-4 font-semibold sticky left-[48px] bg-surface-gray z-25 min-w-[250px] w-[250px] max-w-[250px] shadow-[1px_0_0_#e2e8f0]">User</th>
                  <th className="p-2 font-semibold text-center w-16 text-xs whitespace-nowrap">AC / Total</th>
                  <th className="p-2 font-semibold text-center w-24 border-r border-gray-200 text-xs">Total Time</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem A">A</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem B">B</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem C">C</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem D">D</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem E">E</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem F">F</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem G">G</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem H">H</th>
                  <th className="p-3 font-semibold text-center w-[100px]" title="Problem I">I</th>
                </tr>
              </thead>
              <tbody className="text-sm font-body text-text-main divide-y divide-gray-200">
                <tr className="hover:bg-surface-gray transition-colors group">
                  <td className="p-4 text-center font-bold text-primary sticky left-0 bg-white group-hover:bg-surface-gray z-10 shadow-[1px_0_0_#e2e8f0]">1</td>
                  <td className="p-4 sticky left-[48px] bg-white group-hover:bg-surface-gray z-10 shadow-[1px_0_0_#e2e8f0]">
                    <div className="flex flex-col">
                      <span className="font-semibold text-text-main">mosaic14_2025</span>
                      <span className="text-xs text-text-muted">CyberKnights</span>
                    </div>
                  </td>
                  <td className="p-4 text-center font-medium whitespace-nowrap">8 / 10</td>
                  <td className="p-4 text-center text-text-muted border-r border-gray-200">12:45:00</td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-blue text-white">0:15:22<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">0:45:10<br /><span className="text-[10px] font-normal text-white/80">(-2)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">1:10:33<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">1:55:00<br /><span className="text-[10px] font-normal text-white/80">(-3)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">2:30:15<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">3:10:45<br /><span className="text-[10px] font-normal text-white/80">(-4)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">4:05:22<br /><span className="text-[10px] font-normal text-white/80">(-2)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">4:50:00<br /><span className="text-[10px] font-normal text-white/80">(-5)</span></td>
                  <td className="p-1 text-center border border-white text-xs"></td>
                  <td className="p-1 text-center border border-white text-xs"></td>
                </tr>
                <tr className="hover:bg-surface-gray transition-colors group">
                  <td className="p-4 text-center font-bold text-primary sticky left-0 bg-white group-hover:bg-surface-gray z-10 shadow-[1px_0_0_#e2e8f0]">2</td>
                  <td className="p-4 sticky left-[48px] bg-white group-hover:bg-surface-gray z-10 shadow-[1px_0_0_#e2e8f0]">
                    <div className="flex flex-col">
                      <span className="font-semibold text-text-main">BinaryBeasts</span>
                      <span className="text-xs text-text-muted">Tech Univ</span>
                    </div>
                  </td>
                  <td className="p-4 text-center font-medium whitespace-nowrap">7 / 10</td>
                  <td className="p-4 text-center text-text-muted border-r border-gray-200">11:20:15</td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">0:10:45<br /><span className="text-[10px] font-normal text-white/80">(-0)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-blue text-white">0:32:10<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">1:05:50<br /><span className="text-[10px] font-normal text-white/80">(-2)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-primary text-white">--<br /><span className="text-[10px] font-normal text-white/80">(-3)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">2:15:30<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">3:05:40<br /><span className="text-[10px] font-normal text-white/80">(-0)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">3:55:10<br /><span className="text-[10px] font-normal text-white/80">(-4)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">4:40:22<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs"></td>
                  <td className="p-1 text-center border border-white text-xs"></td>
                </tr>
                <tr className="hover:bg-surface-gray transition-colors group">
                  <td className="p-4 text-center font-bold text-primary sticky left-0 bg-white group-hover:bg-surface-gray z-10 shadow-[1px_0_0_#e2e8f0]">3</td>
                  <td className="p-4 sticky left-[48px] bg-white group-hover:bg-surface-gray z-10 shadow-[1px_0_0_#e2e8f0]">
                    <div className="flex flex-col">
                      <span className="font-semibold text-text-main">CodeMasters</span>
                      <span className="text-xs text-text-muted">Polytechnic</span>
                    </div>
                  </td>
                  <td className="p-4 text-center font-medium whitespace-nowrap">6 / 10</td>
                  <td className="p-4 text-center text-text-muted border-r border-gray-200">10:45:30</td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">0:20:15<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">0:55:40<br /><span className="text-[10px] font-normal text-white/80">(-0)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-blue text-white">1:20:10<br /><span className="text-[10px] font-normal text-white/80">(-0)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">2:10:45<br /><span className="text-[10px] font-normal text-white/80">(-2)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-primary text-white">--<br /><span className="text-[10px] font-normal text-white/80">(-4)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">3:30:15<br /><span className="text-[10px] font-normal text-white/80">(-1)</span></td>
                  <td className="p-1 text-center border border-white text-xs bg-brand-green text-white">4:15:30<br /><span className="text-[10px] font-normal text-white/80">(-3)</span></td>
                  <td className="p-1 text-center border border-white text-xs"></td>
                  <td className="p-1 text-center border border-white text-xs"></td>
                  <td className="p-1 text-center border border-white text-xs"></td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </div>
  );
};
