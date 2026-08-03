import React from 'react';
import { useOutletContext } from 'react-router-dom';
import type { ContestOverviewData } from '../components/Layout';

export const ContestOverview: React.FC = () => {
  const { contest, loading, error } = useOutletContext<{
    contest: ContestOverviewData | null;
    loading: boolean;
    error: string | null;
  }>();

  const formatDate = (dateString?: string) => {
    if (!dateString) return '';
    return new Date(dateString).toLocaleString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  };


  if (loading) {
    return (
      <main className="w-full px-4 sm:px-8 py-8 md:py-12 bg-surface-gray flex-grow animate-pulse">
        <div className="max-w-[1280px] mx-auto flex flex-col gap-8">
          <div className="h-64 bg-gray-200 rounded-xl"></div>
          <div className="h-48 bg-gray-200 rounded-xl"></div>
        </div>
      </main>
    );
  }

  if (error || !contest) {
    return (
      <main className="w-full px-4 sm:px-8 py-8 md:py-12 bg-surface-gray flex-grow flex items-center justify-center">
        <div className="text-center p-8 bg-white rounded-xl shadow-md border border-gray-200">
          <span className="material-symbols-outlined text-red-550 text-5xl mb-2">error</span>
          <h3 className="text-lg font-bold text-brand-blue">Error Loading Contest</h3>
          <p className="text-sm text-text-muted mt-1">{error || 'Contest not found'}</p>
        </div>
      </main>
    );
  }

  return (
    <main className="w-full px-4 sm:px-8 py-8 md:py-12 bg-surface-gray flex-grow">
      <div className="max-w-[1280px] mx-auto flex flex-col gap-8">
        {/* Details Card */}
        <section className="bg-surface rounded-xl ambient-shadow p-8">
          <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
            <span className="material-symbols-outlined text-text-muted">info</span> Contest Overview
            <span className={`ml-auto text-white text-label-md font-label-md px-3 py-1 rounded-full ${
              contest.status === 'ONGOING' ? 'bg-brand-green' : contest.status === 'UPCOMING' ? 'bg-primary' : 'bg-gray-400'
            }`}>
              {contest.status}
            </span>
          </h2>
          <div className="grid grid-cols-1 gap-8 mt-6 md:flex">
            <div className="md:col-span-1" style={{ flex: '0 0 70%', maxWidth: '70%' }}>
              <div className="mb-4">
                <h3 className="text-label-md font-label-md text-text-muted uppercase tracking-wider mb-2">Contest Title</h3>
                <p className="text-headline-sm font-headline-sm text-text-main font-bold italic">
                  {contest.title}
                </p>
              </div>
            </div>
            <div className="md:col-span-1" style={{ flex: '0 0 30%', maxWidth: '30%' }}>
              <h3 className="text-label-md font-label-md text-text-muted uppercase tracking-wider mb-2">Schedule</h3>
              <ul className="text-body-md font-body-md text-text-main space-y-1">
                <li><strong>Start:</strong> {formatDate(contest.startTime)}</li>
                <li><strong>End:</strong> {formatDate(contest.endTime)}</li>
                <li><strong>Duration:</strong> {contest.durations} Minutes</li>
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
              {contest.description || 'No description provided.'}
            </p>
          </div>
        </section>

        {/* Scoring System Card */}
        <section className="bg-surface rounded-xl ambient-shadow p-8">
          <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
            <span className="material-symbols-outlined text-text-muted">score</span>Scoring System
          </h2>
          <div className="mt-6">
            <div className="bg-surface-gray p-6 rounded-lg border border-gray-200">
              <h4 className="text-label-md font-label-md text-text-muted uppercase tracking-wider mb-2">Scoring Rule</h4>
              <p className="text-body-md font-body-md text-text-main font-bold flex items-center gap-2">
                <span className="material-symbols-outlined text-primary text-[20px]">emoji_events</span>
                <span>{contest.scoringRule}</span>
              </p>
            </div>
          </div>
        </section>

        {/* Rules & Prohibitions Card */}
        <section className="bg-surface rounded-xl ambient-shadow p-8">
          <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
            <span className="material-symbols-outlined text-text-muted">gavel</span>Rules & Prohibitions
          </h2>
          <div className="mt-6">
            <p className="text-body-md font-body-md text-text-main text-text-muted italic">
              —
            </p>
          </div>
        </section>

        {/* Contest Prizes Card */}
        {((contest.reward1st || 0) > 0 || (contest.reward2nd || 0) > 0 || (contest.reward3rd || 0) > 0) && (
          <section className="bg-surface rounded-xl ambient-shadow p-8">
            <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
              <span className="material-symbols-outlined text-amber-500">emoji_events</span> Contest Prizes & Rewards
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mt-6">
              {(contest.reward1st || 0) > 0 && (
                <div className="p-4 rounded-2xl bg-gradient-to-br from-amber-500/10 via-amber-400/5 to-transparent border border-amber-300/60 shadow-xs flex items-center gap-3.5">
                  <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-amber-400 to-amber-500 text-white flex items-center justify-center font-black text-lg shadow-sm">
                    🥇
                  </div>
                  <div>
                    <p className="text-[11px] font-bold text-amber-700 uppercase tracking-wider">1st Place Prize</p>
                    <p className="text-base font-black text-slate-900 mt-0.5">
                      {contest.reward1st?.toLocaleString()} <span className="text-xs font-bold text-slate-500">VND</span>
                    </p>
                  </div>
                </div>
              )}
              {(contest.reward2nd || 0) > 0 && (
                <div className="p-4 rounded-2xl bg-gradient-to-br from-slate-200/40 via-slate-100/20 to-transparent border border-slate-300/70 shadow-xs flex items-center gap-3.5">
                  <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-slate-400 to-slate-500 text-white flex items-center justify-center font-black text-lg shadow-sm">
                    🥈
                  </div>
                  <div>
                    <p className="text-[11px] font-bold text-slate-600 uppercase tracking-wider">2nd Place Prize</p>
                    <p className="text-base font-black text-slate-900 mt-0.5">
                      {contest.reward2nd?.toLocaleString()} <span className="text-xs font-bold text-slate-500">VND</span>
                    </p>
                  </div>
                </div>
              )}
              {(contest.reward3rd || 0) > 0 && (
                <div className="p-4 rounded-2xl bg-gradient-to-br from-amber-700/10 via-amber-600/5 to-transparent border border-amber-700/30 shadow-xs flex items-center gap-3.5">
                  <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-amber-600 to-amber-700 text-white flex items-center justify-center font-black text-lg shadow-sm">
                    🥉
                  </div>
                  <div>
                    <p className="text-[11px] font-bold text-amber-800 uppercase tracking-wider">3rd Place Prize</p>
                    <p className="text-base font-black text-slate-900 mt-0.5">
                      {contest.reward3rd?.toLocaleString()} <span className="text-xs font-bold text-slate-500">VND</span>
                    </p>
                  </div>
                </div>
              )}
            </div>
          </section>
        )}

        {/* Supported Languages Card */}
        <section className="bg-surface rounded-xl ambient-shadow p-8">
          <h2 className="text-headline-md font-headline-md text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
            <span className="material-symbols-outlined text-primary">translate</span> Supported Languages
          </h2>
          <div className="flex flex-wrap gap-2.5 mt-6">
            {[
              { id: 50, name: 'C (GCC 9.2.0)' },
              { id: 54, name: 'C++ (GCC 9.2.0)' },
              { id: 62, name: 'Java (OpenJDK 13.0.1)' },
              { id: 71, name: 'Python (3.8.1)' },
              { id: 51, name: 'C# (Mono 6.6.0.161)' }
            ].map((lang) => (
              <div
                key={lang.id}
                className="flex items-center gap-2 px-3.5 py-2 rounded-xl bg-slate-50 border border-slate-200/70 text-slate-700 text-xs font-bold shadow-xs hover:border-primary/50 transition-all"
              >
                <span className="w-2 h-2 rounded-full bg-emerald-500"></span>
                {lang.name}
              </div>
            ))}
          </div>
        </section>
      </div>
    </main>
  );
};
