import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';

export const ContestProblems: React.FC = () => {
  const { id = '42' } = useParams<{ id: string }>();
  
  // Interactive React State for Ticking Timer (Ends In) starting at 01:24:55
  const [timeLeft, setTimeLeft] = useState<string>('01:24:55');

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

  // Interactive React State for Status Checkmarks (Allows cycling through status when clicked)
  const [statusA, setStatusA] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('check_circle');
  const [statusB, setStatusB] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('cancel');
  const [statusC, setStatusC] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');
  const [statusD, setStatusD] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');
  const [statusE, setStatusE] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');
  const [statusF, setStatusF] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');
  const [statusG, setStatusG] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');
  const [statusH, setStatusH] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');
  const [statusI, setStatusI] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');
  const [statusJ, setStatusJ] = useState<'check_circle' | 'cancel' | 'radio_button_unchecked'>('radio_button_unchecked');

  const toggleStatus = (
    status: 'check_circle' | 'cancel' | 'radio_button_unchecked', 
    setStatus: React.Dispatch<React.SetStateAction<'check_circle' | 'cancel' | 'radio_button_unchecked'>>
  ) => {
    if (status === 'check_circle') {
      setStatus('cancel');
    } else if (status === 'cancel') {
      setStatus('radio_button_unchecked');
    } else {
      setStatus('check_circle');
    }
  };

  const renderStatusIcon = (
    status: 'check_circle' | 'cancel' | 'radio_button_unchecked', 
    onClick: () => void
  ) => {
    if (status === 'check_circle') {
      return (
        <span 
          className="material-symbols-outlined text-brand-green icon-fill cursor-pointer select-none" 
          onClick={onClick}
          data-icon="check_circle" 
          data-weight="fill"
        >
          check_circle
        </span>
      );
    } else if (status === 'cancel') {
      return (
        <span 
          className="material-symbols-outlined text-red-600 icon-fill cursor-pointer select-none" 
          onClick={onClick}
          data-icon="cancel" 
          data-weight="fill"
        >
          cancel
        </span>
      );
    } else {
      return (
        <span 
          className="material-symbols-outlined text-gray-400 cursor-pointer select-none" 
          onClick={onClick}
          data-icon="radio_button_unchecked"
        >
          radio_button_unchecked
        </span>
      );
    }
  };

  return (
    <div className="flex-grow flex flex-col md:flex-row w-full max-w-[1920px] mx-auto text-left relative z-10">
      
      {/* Main Content (Left 85%) */}
      <main className="w-full md:w-[85%] px-4 sm:px-8 py-8 md:py-12 bg-surface-gray">
        <div className="max-w-[1280px] mx-auto">
          <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
            
            <div className="p-6 border-b border-gray-200 bg-white">
              <h1 className="text-2xl font-headline font-semibold text-text-main">Problems</h1>
            </div>

            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-surface-gray border-b border-gray-200 text-text-main font-label text-sm">
                    <th className="p-4 w-16 text-center">Status</th>
                    <th className="p-4 w-16">#</th>
                    <th className="p-4">Title</th>
                    <th className="p-4 w-32 text-right">Solved&nbsp;</th>
                  </tr>
                </thead>
                <tbody className="text-base font-body divide-y divide-gray-200">
                  
                  {/* Problem A */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusA, () => toggleStatus(statusA, setStatusA))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">A</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/A`}>
                        Two Sum Challenge
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">4,215</td>
                  </tr>

                  {/* Problem B */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusB, () => toggleStatus(statusB, setStatusB))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">B</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/B`}>
                        Add Two Numbers
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">3,890</td>
                  </tr>

                  {/* Problem C */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusC, () => toggleStatus(statusC, setStatusC))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">C</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/C`}>
                        Longest Substring Without Repeating Characters
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">2,104</td>
                  </tr>

                  {/* Problem D */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusD, () => toggleStatus(statusD, setStatusD))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">D</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/D`}>
                        Median of Two Sorted Arrays
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">892</td>
                  </tr>

                  {/* Problem E */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusE, () => toggleStatus(statusE, setStatusE))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">E</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/E`}>
                        Longest Palindromic Substring
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">1,450</td>
                  </tr>

                  {/* Problem F */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusF, () => toggleStatus(statusF, setStatusF))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">F</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/F`}>
                        Zigzag Conversion
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">1,203</td>
                  </tr>

                  {/* Problem G */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusG, () => toggleStatus(statusG, setStatusG))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">G</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/G`}>
                        Reverse Integer
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">2,876</td>
                  </tr>

                  {/* Problem H */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusH, () => toggleStatus(statusH, setStatusH))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">H</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/H`}>
                        String to Integer (atoi)
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">945</td>
                  </tr>

                  {/* Problem I */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusI, () => toggleStatus(statusI, setStatusI))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">I</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/I`}>
                        Palindrome Number
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">3,120</td>
                  </tr>

                  {/* Problem J */}
                  <tr className="hover:bg-surface-gray/50 transition-colors">
                    <td className="p-4 text-center">
                      {renderStatusIcon(statusJ, () => toggleStatus(statusJ, setStatusJ))}
                    </td>
                    <td className="p-4 font-semibold text-text-main">J</td>
                    <td className="p-4">
                      <Link className="text-primary hover:underline font-bold" to={`/contests/${id}/problems/J`}>
                        Regular Expression Matching
                      </Link>
                    </td>
                    <td className="p-4 text-right text-text-muted">420</td>
                  </tr>

                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>

      {/* Right Sidebar (15%) */}
      <aside className="w-full md:w-[15%] min-w-[280px] bg-white border-l border-gray-200 flex flex-col relative sticky top-16 h-[calc(100vh-64px)]">
        
        {/* Sidebar Content */}
        <div className="flex-grow overflow-y-auto py-8 px-6">
          
          {/* Contest Header / Timer */}
          <div className="mb-10 text-center">
            <h2 className="text-xl font-black text-text-main mb-2 tracking-tight">Contest #{id}</h2>
            <div className="bg-surface-gray rounded-lg p-4 shadow-sm border border-gray-200">
              <p className="text-xs font-label text-text-muted uppercase tracking-wider mb-1">Ends In</p>
              <div className="font-display text-2xl font-bold text-primary tabular-nums tracking-tight">{timeLeft}</div>
            </div>
          </div>

          {/* Navigation Links */}
          <nav className="space-y-2 font-label text-sm">
            <Link 
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-main font-medium hover:bg-surface-gray transition-all" 
              to={`/contests/${id}`}
            >
              <span className="material-symbols-outlined">dashboard</span>
              Overview
            </Link>
            <Link 
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-primary font-bold border-l-4 border-primary bg-primary-light/20 shadow-sm translate-x-1 transition-all" 
              to={`/contests/${id}/problems`}
            >
              <span className="material-symbols-outlined icon-fill">extension</span>
              Problems
            </Link>
            <Link 
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-main font-medium hover:bg-surface-gray transition-all" 
              to={`/contests/${id}/submissions`}
            >
              <span className="material-symbols-outlined">list_alt</span>
              Submissions
            </Link>
            <Link 
              className="flex items-center gap-3 py-3 px-4 rounded-lg text-text-main font-medium hover:bg-surface-gray transition-all" 
              to={`/contests/${id}/ranking`}
            >
              <span className="material-symbols-outlined">leaderboard</span>
              Rankings
            </Link>
          </nav>
        </div>
      </aside>

    </div>
  );
};
