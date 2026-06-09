import React, { useState, useEffect } from 'react';
import { Outlet, Link, NavLink, useNavigate, useLocation } from 'react-router-dom';
import { useApp } from '../context/AppContext';
import { ContestSidebar } from './ContestSidebar';
import { authService } from '../services/authService';

export interface ContestOverviewData {
  id: number;
  title: string;
  description: string;
  scoringRule: string;
  startTime: string;
  endTime: string;
  durations: number;
  status: 'UPCOMING' | 'ONGOING' | 'ENDED';
  creatorName: string;
  isPrivate: boolean;
  participantCount: number;
  problemCount: number;
  isUserRegistered: boolean;
}

export const Layout: React.FC = () => {
  const { user, cart, logout, updateUser } = useApp();
  const navigate = useNavigate();
  const location = useLocation();

  const [appealText, setAppealText] = useState('');
  const [appealSubmitting, setAppealSubmitting] = useState(false);
  const [appealError, setAppealError] = useState<string | null>(null);

  // Poll or retrieve the user's latest info on mount to ensure status (LOCKED/ACTIVE) is accurate
  useEffect(() => {
    if (user?.id) {
      const fetchLatestUserInfo = async () => {
        try {
          const latestInfo = await authService.getMyInfo();
          if (latestInfo) {
            updateUser({
              status: latestInfo.status,
              lockReason: latestInfo.lockReason,
              lockAppeal: latestInfo.lockAppeal,
            });
          }
        } catch (err) {
          console.warn("Failed to fetch latest user info on layout mount:", err);
        }
      };
      fetchLatestUserInfo();
    }
  }, [user?.id]);

  const handleAppealSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!appealText.trim()) return;
    setAppealSubmitting(true);
    setAppealError(null);
    try {
      await authService.submitAppeal(appealText);
      updateUser({ lockAppeal: appealText });
      setAppealText('');
    } catch (err: any) {
      setAppealError(err.message || 'Failed to submit appeal. Please try again.');
    } finally {
      setAppealSubmitting(false);
    }
  };

  const isInstructorRoute = location.pathname.startsWith('/instructor');
  const isAdminRoute = location.pathname.startsWith('/admin');
  const isProblemSolvePage = location.pathname.startsWith('/problems/');

  // Parse contestId from location pathname
  const match = location.pathname.match(/^\/contests\/(\d+)/);
  const contestId = match ? match[1] : undefined;
  const isContestPage = !!contestId;

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  // Contest State
  const [contest, setContest] = useState<ContestOverviewData | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [timeLeft, setTimeLeft] = useState<string>('--:--:--');
  const [timerLabel, setTimerLabel] = useState<string>('Ends In');
  const [password, setPassword] = useState('');
  const [registering, setRegistering] = useState(false);
  const [registrationMessage, setRegistrationMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  const fetchContest = async () => {
    if (!contestId) return;
    try {
      const response = await fetch(`http://localhost:8080/nonstopcoding/contests/${contestId}`, {
        credentials: 'include',
      });
      const data = await response.json();
      if (data && data.result) {
        setContest(data.result);
        setError(null);
      } else {
        setError(data.message || 'Failed to fetch contest details');
      }
    } catch (err) {
      console.error('Error fetching contest:', err);
      setError('Failed to fetch contest details');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (isContestPage && contestId) {
      setLoading(true);
      fetchContest();
    } else {
      setContest(null);
      setLoading(false);
      setError(null);
    }
  }, [contestId, isContestPage]);

  useEffect(() => {
    if (!contest || !isContestPage) return;

    if (contest.status === 'ENDED') {
      setTimeLeft('Ended');
      setTimerLabel('Contest Ended');
      return;
    }

    const targetTime = contest.status === 'UPCOMING' ? contest.startTime : contest.endTime;
    const label = contest.status === 'UPCOMING' ? 'Begins In' : 'Ends In';
    setTimerLabel(label);

    const updateTimer = () => {
      const now = Date.now();
      const end = new Date(targetTime).getTime();
      const diff = end - now;

      if (diff <= 0) {
        fetchContest();
        setTimeLeft('Ended');
        return;
      }

      const hrs = Math.floor(diff / (1000 * 60 * 60));
      const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
      const secs = Math.floor((diff % (1000 * 60)) / 1000);

      const pad = (n: number) => String(n).padStart(2, '0');
      setTimeLeft(`${pad(hrs)}:${pad(mins)}:${pad(secs)}`);
    };

    updateTimer();
    const timer = setInterval(updateTimer, 1000);
    return () => clearInterval(timer);
  }, [contest, isContestPage]);

  let activeTab: 'overview' | 'problems' | 'submissions' | 'ranking' = 'overview';
  if (location.pathname.includes('/problems')) {
    activeTab = 'problems';
  } else if (location.pathname.includes('/submissions')) {
    activeTab = 'submissions';
  } else if (location.pathname.includes('/ranking')) {
    activeTab = 'ranking';
  }

  const handleRegister = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!contestId) return;
    if (contest?.isPrivate && !password.trim()) {
      setRegistrationMessage({
        type: 'error',
        text: 'Please enter the contest password',
      });
      return;
    }

    setRegistering(true);
    try {
      const response = await fetch(`http://localhost:8080/nonstopcoding/contests/${contestId}/register`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ password: contest?.isPrivate ? password : null }),
        credentials: 'include',
      });
      const data = await response.json();
      if (response.ok && data.code === 1000) {
        setRegistrationMessage({
          type: 'success',
          text: 'Successfully registered for the contest!',
        });
        setPassword('');
        await fetchContest();
      } else {
        setRegistrationMessage({
          type: 'error',
          text: data.message || 'Registration failed',
        });
      }
    } catch (err) {
      console.error(err);
      setRegistrationMessage({
        type: 'error',
        text: 'Connection error. Please try again.',
      });
    } finally {
      setRegistering(false);
    }

    setTimeout(() => {
      setRegistrationMessage(null);
    }, 4000);
  };

  // Redirection / Protection logic
  const privateRoutes = ['/dashboard', '/instructor', '/shopping-cart'];
  const isPrivateRoute = privateRoutes.some(route => location.pathname.startsWith(route));

  React.useEffect(() => {
    // If not logged in and trying to access private routes, redirect to root Home page
    if (!user && isPrivateRoute) {
      navigate('/', { replace: true });
    }
  }, [user, isPrivateRoute, navigate]);

  if (user && user.status === 'LOCKED') {
    return (
      <div
        className="min-h-screen flex items-center justify-center p-4 relative overflow-hidden"
        style={{ background: 'linear-gradient(135deg, #0f0f1a 0%, #1a0a1a 50%, #0a0f1a 100%)', fontFamily: "'Inter', sans-serif" }}
      >
        {/* Animated radial glows */}
        <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden">
          <div className="absolute top-[-10%] left-[-10%] w-[600px] h-[600px] rounded-full" style={{ background: 'radial-gradient(circle, rgba(239,68,68,0.15) 0%, transparent 70%)', animation: 'pulse 4s ease-in-out infinite' }}></div>
          <div className="absolute bottom-[-15%] right-[-10%] w-[700px] h-[700px] rounded-full" style={{ background: 'radial-gradient(circle, rgba(99,102,241,0.1) 0%, transparent 70%)', animation: 'pulse 6s ease-in-out infinite reverse' }}></div>
          <div className="absolute top-[40%] left-[50%] w-[400px] h-[400px] rounded-full" style={{ background: 'radial-gradient(circle, rgba(239,68,68,0.05) 0%, transparent 70%)', transform: 'translateX(-50%)' }}></div>
          {/* Floating grid lines */}
          <div className="absolute inset-0 opacity-[0.03]" style={{ backgroundImage: 'linear-gradient(rgba(255,255,255,0.5) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.5) 1px, transparent 1px)', backgroundSize: '60px 60px' }}></div>
        </div>

        {/* Main Card */}
        <div className="relative z-10 w-full max-w-xl" style={{ animation: 'fadeInUp 0.6s ease-out' }}>

          {/* Logo */}
          <div className="flex justify-center mb-8">
            <img src={`${import.meta.env.BASE_URL}LOGO.png`} alt="Nonstop Coding" className="h-10 w-auto opacity-80 drop-shadow-md" />
          </div>

          {/* Card */}
          <div
            className="rounded-3xl overflow-hidden"
            style={{ background: 'rgba(255,255,255,0.04)', backdropFilter: 'blur(24px)', border: '1px solid rgba(239,68,68,0.2)', boxShadow: '0 32px 80px rgba(0,0,0,0.5), 0 0 0 1px rgba(255,255,255,0.05) inset, 0 0 60px rgba(239,68,68,0.08)' }}
          >
            {/* Top danger stripe */}
            <div className="h-1 w-full" style={{ background: 'linear-gradient(90deg, #ef4444, #dc2626, #b91c1c)' }}></div>

            <div className="p-8 md:p-10 space-y-7">

              {/* Icon + Heading */}
              <div className="text-center space-y-4">
                <div className="inline-flex items-center justify-center w-20 h-20 rounded-2xl mx-auto relative" style={{ background: 'linear-gradient(135deg, rgba(239,68,68,0.2), rgba(185,28,28,0.1))', border: '1px solid rgba(239,68,68,0.3)', boxShadow: '0 0 40px rgba(239,68,68,0.2)' }}>
                  <span className="material-symbols-outlined text-red-400 text-5xl" style={{ fontVariationSettings: "'FILL' 1" }}>lock</span>
                  <div className="absolute -top-1 -right-1 w-5 h-5 bg-red-500 rounded-full flex items-center justify-center">
                    <span className="material-symbols-outlined text-white text-xs" style={{ fontVariationSettings: "'FILL' 1", fontSize: '14px' }}>priority_high</span>
                  </div>
                </div>

                <div>
                  <h1 className="font-display font-black text-3xl text-white tracking-tight mb-2">Account Suspended</h1>
                  <p className="text-sm text-slate-400 leading-relaxed max-w-sm mx-auto">
                    Your account access has been temporarily restricted due to a policy violation.
                  </p>
                </div>
              </div>

              {/* Lock Reason Card */}
              <div
                className="rounded-2xl p-5 text-left space-y-2"
                style={{ background: 'rgba(239,68,68,0.08)', border: '1px solid rgba(239,68,68,0.2)' }}
              >
                <div className="flex items-center gap-2 mb-3">
                  <div className="w-1.5 h-1.5 rounded-full bg-red-400"></div>
                  <span className="text-[10px] font-black uppercase tracking-widest text-red-400">Reason for Suspension</span>
                </div>
                <p className="text-sm font-medium text-slate-200 leading-relaxed pl-3.5 border-l-2 border-red-500/40">
                  {user.lockReason || 'Violation of platform terms of service or community guidelines.'}
                </p>
              </div>

              {/* Appeal Section */}
              {user.lockAppeal ? (
                <div
                  className="rounded-2xl p-5 text-left space-y-3"
                  style={{ background: 'rgba(16,185,129,0.07)', border: '1px solid rgba(16,185,129,0.2)' }}
                >
                  <div className="flex items-center gap-2">
                    <span className="material-symbols-outlined text-emerald-400 text-lg" style={{ fontVariationSettings: "'FILL' 1" }}>check_circle</span>
                    <span className="text-xs font-black uppercase tracking-wider text-emerald-400">Appeal Submitted</span>
                  </div>
                  <div className="pl-3.5 border-l-2 border-emerald-500/40">
                    <p className="text-xs text-slate-300 italic leading-relaxed">"{user.lockAppeal}"</p>
                  </div>
                  <p className="text-[11px] text-emerald-500/80 font-semibold bg-emerald-500/10 px-3 py-2 rounded-xl">
                    ✦ Your appeal is under review. The admin will respond shortly.
                  </p>
                </div>
              ) : (
                <form onSubmit={handleAppealSubmit} className="text-left space-y-4">
                  <div>
                    <label className="block text-[10px] font-black uppercase tracking-widest text-slate-400 mb-3">
                      Submit an Appeal
                    </label>
                    <textarea
                      value={appealText}
                      onChange={(e) => setAppealText(e.target.value)}
                      placeholder="Explain why you believe this suspension was made in error, or provide context that might help the admin review your case..."
                      rows={4}
                      required
                      className="w-full resize-none rounded-2xl px-4 py-3.5 text-sm font-medium text-slate-200 placeholder-slate-600 transition-all outline-none"
                      style={{ background: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.1)', boxShadow: 'inset 0 2px 8px rgba(0,0,0,0.2)' }}
                      onFocus={(e) => { e.target.style.border = '1px solid rgba(239,68,68,0.5)'; e.target.style.boxShadow = 'inset 0 2px 8px rgba(0,0,0,0.2), 0 0 0 3px rgba(239,68,68,0.1)'; }}
                      onBlur={(e) => { e.target.style.border = '1px solid rgba(255,255,255,0.1)'; e.target.style.boxShadow = 'inset 0 2px 8px rgba(0,0,0,0.2)'; }}
                    />
                  </div>
                  {appealError && (
                    <p className="text-xs font-bold text-red-400 bg-red-500/10 p-3 rounded-xl border border-red-500/20">{appealError}</p>
                  )}
                  <button
                    type="submit"
                    disabled={appealSubmitting || !appealText.trim()}
                    className="w-full text-white font-bold text-sm py-3.5 rounded-2xl transition-all flex items-center justify-center gap-2 disabled:opacity-40 disabled:cursor-not-allowed"
                    style={{ background: 'linear-gradient(135deg, #ef4444, #b91c1c)', boxShadow: '0 8px 24px rgba(239,68,68,0.25)', border: 'none', cursor: 'pointer' }}
                    onMouseEnter={(e) => { if (!appealSubmitting && appealText.trim()) { (e.currentTarget as HTMLButtonElement).style.transform = 'translateY(-1px)'; (e.currentTarget as HTMLButtonElement).style.boxShadow = '0 12px 32px rgba(239,68,68,0.35)'; } }}
                    onMouseLeave={(e) => { (e.currentTarget as HTMLButtonElement).style.transform = 'translateY(0)'; (e.currentTarget as HTMLButtonElement).style.boxShadow = '0 8px 24px rgba(239,68,68,0.25)'; }}
                  >
                    {appealSubmitting ? (
                      <>
                        <span className="material-symbols-outlined text-lg animate-spin">autorenew</span>
                        <span>Submitting...</span>
                      </>
                    ) : (
                      <>
                        <span className="material-symbols-outlined text-lg">send</span>
                        <span>Submit Appeal</span>
                      </>
                    )}
                  </button>
                </form>
              )}

              {/* Divider */}
              <div className="flex items-center gap-3">
                <div className="flex-1 h-px" style={{ background: 'rgba(255,255,255,0.07)' }}></div>
                <span className="text-[10px] text-slate-600 uppercase tracking-wider font-semibold">or</span>
                <div className="flex-1 h-px" style={{ background: 'rgba(255,255,255,0.07)' }}></div>
              </div>

              {/* Contact + Logout */}
              <div className="space-y-4">
                <div
                  className="rounded-2xl p-4 flex items-start gap-3"
                  style={{ background: 'rgba(99,102,241,0.07)', border: '1px solid rgba(99,102,241,0.15)' }}
                >
                  <div className="w-8 h-8 rounded-xl flex items-center justify-center shrink-0" style={{ background: 'rgba(99,102,241,0.15)' }}>
                    <span className="material-symbols-outlined text-indigo-400 text-base" style={{ fontVariationSettings: "'FILL' 1" }}>mail</span>
                  </div>
                  <div className="text-left">
                    <p className="text-[10px] font-black uppercase tracking-wider text-indigo-400 mb-0.5">Contact Support</p>
                    <p className="text-xs text-slate-400 mb-1">If you need direct assistance from an administrator:</p>
                    <a
                      href="mailto:support@nonstopcoding.edu.vn"
                      className="text-sm font-bold text-indigo-300 hover:text-indigo-200 transition-colors underline underline-offset-2"
                    >
                      support@nonstopcoding.edu.vn
                    </a>
                  </div>
                </div>

                <button
                  onClick={handleLogout}
                  className="w-full flex items-center justify-center gap-2 text-sm font-bold py-3 rounded-2xl transition-all"
                  style={{ background: 'rgba(255,255,255,0.05)', border: '1px solid rgba(255,255,255,0.08)', color: '#94a3b8', cursor: 'pointer' }}
                  onMouseEnter={(e) => { (e.currentTarget as HTMLButtonElement).style.background = 'rgba(255,255,255,0.09)'; (e.currentTarget as HTMLButtonElement).style.color = '#cbd5e1'; }}
                  onMouseLeave={(e) => { (e.currentTarget as HTMLButtonElement).style.background = 'rgba(255,255,255,0.05)'; (e.currentTarget as HTMLButtonElement).style.color = '#94a3b8'; }}
                >
                  <span className="material-symbols-outlined text-lg">logout</span>
                  <span>Sign Out</span>
                </button>
              </div>

            </div>
          </div>

          {/* Footer note */}
          <p className="text-center text-[11px] text-slate-600 mt-6">
            Nonstop Coding Platform — Account access suspended
          </p>
        </div>

        <style>{`
          @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(24px); }
            to { opacity: 1; transform: translateY(0); }
          }
        `}</style>
      </div>
    );
  }

  return (
    <div className="bg-[#f0f4f9] text-text-main font-body min-h-screen flex flex-col antialiased selection:bg-primary-light selection:text-brand-blue relative">

      {/* Glowing Backdrop Circles */}
      <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden">
        <div className="absolute -top-40 -left-40 w-[500px] h-[500px] bg-primary/10 rounded-full blur-[120px]"></div>
        <div className="absolute top-1/3 -right-40 w-[500px] h-[500px] bg-brand-blue/10 rounded-full blur-[120px]"></div>
        <div className="absolute -bottom-40 left-1/4 w-[600px] h-[600px] bg-brand-green/5 rounded-full blur-[150px]"></div>
      </div>

      {/* TopAppBar */}
      {!isInstructorRoute && !isAdminRoute && (
        <header className="bg-surface/90 backdrop-blur-md shadow-sm fixed top-0 z-50 w-full border-b border-gray-100/50">
          <div className="flex justify-between items-center w-full px-8 h-16 max-w-[1440px] mx-auto relative">
          {/* Brand */}
          <Link to="/" className="shrink-0 flex items-center cursor-pointer">
            <img src={`${import.meta.env.BASE_URL}LOGO.png`} alt="Nonstop Coding Logo" className="h-16 w-auto" />
          </Link>
          <nav className="hidden lg:flex gap-6 items-center absolute left-1/2 transform -translate-x-1/2 h-full">
            {user && (
              <NavLink className={({ isActive }) => `font-body text-body-md transition-colors font-medium px-2 py-1 ${isActive ? 'text-primary' : 'text-text-main hover:text-primary'}`} to="/dashboard">My Learning</NavLink>
            )}
            <NavLink className={({ isActive }) => `font-body text-body-md transition-colors font-medium px-2 py-1 ${isActive ? 'text-primary' : 'text-text-main hover:text-primary'}`} to="/courses">Courses</NavLink>
            <NavLink className={({ isActive }) => `font-body text-body-md transition-colors font-medium px-2 py-1 ${isActive ? 'text-primary' : 'text-text-main hover:text-primary'}`} to="/problems">Problems</NavLink>
            <NavLink className={({ isActive }) => `font-body text-body-md transition-colors font-medium px-2 py-1 ${isActive ? 'text-primary' : 'text-text-main hover:text-primary'}`} to="/contests">Contests</NavLink>
            <NavLink className={({ isActive }) => `font-body text-body-md transition-colors font-medium px-2 py-1 ${isActive ? 'text-primary' : 'text-text-main hover:text-primary'}`} to="/rankings">Rankings</NavLink>
          </nav>
          <div className="flex items-center gap-4">
            {/* Instructor Capsule Link */}
            {user && user.role === 'instructor' && (
              <Link to="/instructor" className="flex items-center gap-1.5 px-3.5 py-1.5 rounded-xl bg-primary-light/40 text-primary hover:bg-primary hover:text-white font-semibold text-xs md:text-sm transition-all select-none border border-primary/20 shrink-0">
                <span className="material-symbols-outlined text-[16px] md:text-[18px] icon-fill">school</span>
                <span>Instructor</span>
              </Link>
            )}
            {user && user.role === 'admin' && (
              <Link to="/admin" className="flex items-center gap-1.5 px-3.5 py-1.5 rounded-xl bg-red-50 text-red-600 hover:bg-red-600 hover:text-white font-semibold text-xs md:text-sm transition-all select-none border border-red-200 shrink-0">
                <span className="material-symbols-outlined text-[16px] md:text-[18px] icon-fill">admin_panel_settings</span>
                <span>Admin</span>
              </Link>
            )}
            <button className="p-2 rounded-full text-text-muted hover:text-primary hover:bg-surface-gray transition-all">
              <span className="material-symbols-outlined">notifications</span>
            </button>
            <Link to="/shopping-cart" className="p-2 rounded-full text-text-muted hover:text-primary hover:bg-surface-gray transition-all relative">
              <span className="material-symbols-outlined">shopping_cart</span>
              {cart.length > 0 && (
                <span className="absolute top-1 right-0 bg-primary text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full leading-none">{cart.length}</span>
              )}
            </Link>
            {user ? (
              <div className="relative flex items-center gap-1 cursor-pointer group ml-2">
                <img
                  alt="User Avatar"
                  className="w-8 h-8 rounded-full border-2 border-transparent group-hover:border-primary transition-all object-cover"
                  src={user?.avatar || "https://ui-avatars.com/api/?name=You&background=12284C&color=fff"}
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = 'https://ui-avatars.com/api/?name=You&background=12284C&color=fff';
                  }}
                />
                <span className="material-symbols-outlined text-text-muted group-hover:text-primary transition-colors">arrow_drop_down</span>

                {/* Dropdown Menu */}
                <div className="absolute top-full right-0 mt-2 w-48 bg-surface rounded-lg shadow-lg border border-gray-100 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50 flex flex-col py-2 cursor-default text-left">
                  <Link to="/dashboard#dashboard" className="px-4 py-2 text-sm text-text-main hover:bg-surface-gray hover:text-primary transition-colors flex items-center gap-2">
                    <span className="material-symbols-outlined text-[18px]">dashboard</span> Dashboard
                  </Link>
                  <Link to="/dashboard#my-profile" className="px-4 py-2 text-sm text-text-main hover:bg-surface-gray hover:text-primary transition-colors flex items-center gap-2">
                    <span className="material-symbols-outlined text-[18px]">person</span> My Profile
                  </Link>
                  <Link to="/dashboard#deposit" className="px-4 py-2 text-sm text-text-main hover:bg-surface-gray hover:text-primary transition-colors flex items-center gap-2">
                    <span className="material-symbols-outlined text-[18px]">payments</span> Deposit
                  </Link>
                  {(user?.role === 'admin' || user?.role === 'instructor') && (
                    <div className="h-px bg-gray-100 my-1 w-full"></div>
                  )}
                  {user && user.role === 'admin' && (
                    <Link to="/admin" className="px-4 py-2 text-sm text-text-main hover:bg-surface-gray hover:text-primary transition-colors flex items-center gap-2">
                      <span className="material-symbols-outlined text-[18px]">admin_panel_settings</span> Admin Panel
                    </Link>
                  )}
                  {user && user.role === 'instructor' && (
                    <Link to="/instructor" className="px-4 py-2 text-sm text-text-main hover:bg-surface-gray hover:text-primary transition-colors flex items-center gap-2">
                      <span className="material-symbols-outlined text-[18px]">school</span> Instructor Panel
                    </Link>
                  )}
                  {user && user.role !== 'admin' && user.role !== 'instructor' && (
                    <Link to="/apply-instructor" className="px-4 py-2 text-sm text-text-main hover:bg-surface-gray hover:text-primary transition-colors flex items-center gap-2">
                      <span className="material-symbols-outlined text-[18px]">school</span> Become Instructor
                    </Link>
                  )}
                  <div className="h-px bg-gray-100 my-1 w-full"></div>
                  <button onClick={handleLogout} className="px-4 py-2 text-sm text-red-600 hover:bg-red-50 hover:text-red-700 transition-colors flex items-center gap-2 w-full text-left">
                    <span className="material-symbols-outlined text-[18px]">logout</span> Logout
                  </button>
                </div>
              </div>
            ) : (
              <Link
                to="/login"
                className="flex items-center gap-1.5 px-4 py-2.5 rounded-xl bg-gradient-to-r from-primary to-[#ff8c42] hover:from-[#d95f19] hover:to-primary text-white font-extrabold text-xs md:text-sm shadow-sm transition-all transform active:scale-95 group select-none shrink-0"
              >
                <span className="material-symbols-outlined text-[18px] group-hover:translate-x-0.5 transition-transform">login</span>
                <span>Login</span>
              </Link>
            )}
          </div>
        </div>
      </header>
      )}

      {/* Main content body with Outlet */}
      <main className={`relative z-10 flex-grow w-full min-w-0 ${(isInstructorRoute || isAdminRoute) ? '' : 'pt-16'}`}>
        {isContestPage ? (
          <div className="flex-grow flex flex-col md:flex-row w-full max-w-[1920px] mx-auto text-left relative z-10">
            {/* Main content column on the left (85%) */}
            <div className="w-full md:w-[85%] flex flex-col bg-surface-gray min-w-0">
              <Outlet context={{ contest, loading, error, fetchContest }} />
            </div>

            {/* Shared right sidebar (15%) */}
            <ContestSidebar
              contestId={contestId || ''}
              activeTab={activeTab}
              timeLeft={timeLeft}
              timerLabel={timerLabel}
              isRegistered={!!contest?.isUserRegistered}
            >
              {!loading && contest && (
                <div className="mt-8 border-t border-gray-100 pt-6">
                  {!user ? (
                    <div className="bg-blue-50 border border-blue-200 text-blue-800 rounded-xl p-4 text-center space-y-3">
                      <span className="material-symbols-outlined text-blue-600 text-3xl mb-1">account_circle</span>
                      <p className="text-sm font-bold">Authentication Required</p>
                      <p className="text-xs text-blue-600">Please login to register for this contest.</p>
                      <button
                        onClick={() => navigate('/login')}
                        className="w-full bg-primary hover:bg-primary-hover text-white text-xs font-bold py-2 rounded-lg transition-all"
                      >
                        Go to Login
                      </button>
                    </div>
                  ) : contest.isUserRegistered ? (
                    <div className="bg-green-50 border border-green-200 text-green-800 rounded-xl p-4 text-center">
                      <span className="material-symbols-outlined text-green-600 text-3xl mb-1 icon-fill">verified_user</span>
                      <p className="text-sm font-bold">Registered</p>
                      <p className="text-xs text-green-600 mt-1">You are in this arena!</p>
                    </div>
                  ) : (
                    <form onSubmit={handleRegister} className="space-y-4">
                      {contest.isPrivate && (
                        <div>
                          <label className="block text-label-md font-medium text-text-muted mb-2 tracking-wider uppercase text-center" htmlFor="contest-password">
                            Contest Password
                          </label>
                          <input
                            className="w-full bg-surface border border-gray-300 rounded-lg px-4 py-2 text-body-md focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-colors text-center"
                            id="contest-password"
                            placeholder="Enter password"
                            type="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                          />
                        </div>
                      )}
                      <button
                        disabled={registering}
                        className="w-full bg-primary text-white text-label-md font-label-md rounded-xl font-bold hover:bg-primary-hover transition-all duration-200 shadow-sm py-2.5 disabled:opacity-50"
                        type="submit"
                      >
                        {registering ? 'Registering...' : 'Register Now'}
                      </button>
                      {registrationMessage && (
                        <div
                          className={`text-xs font-bold p-2.5 rounded-lg text-center ${
                            registrationMessage.type === 'success'
                              ? 'bg-green-50 text-green-700 border border-green-200'
                              : 'bg-red-50 text-red-700 border border-red-200'
                          }`}
                        >
                          {registrationMessage.text}
                        </div>
                      )}
                    </form>
                  )}
                </div>
              )}
            </ContestSidebar>
          </div>
        ) : (
          <Outlet />
        )}
      </main>

      {/* Master Footer */}
      {!isInstructorRoute && !isAdminRoute && !isProblemSolvePage && !isContestPage && (
        <footer className="bg-brand-blue text-white mt-auto shrink-0 w-full z-40 relative">
          <div className="max-w-[1440px] mx-auto px-8 py-12">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
              <div className="flex flex-col gap-4">
                <div className="text-headline-md font-bold font-display">
                  <span>Nonstop</span><span className="text-primary">Coding</span>
                </div>
                <p className="text-body-md text-white/70 max-w-xs">
                  Empowering developers through continuous learning, practice, and competition in a global tech community.
                </p>
                <div className="flex gap-4">
                  <button className="w-10 h-10 rounded-full bg-white/10 hover:bg-primary transition-colors flex items-center justify-center">
                    <span className="material-symbols-outlined">language</span>
                  </button>
                  <button className="w-10 h-10 rounded-full bg-white/10 hover:bg-primary transition-colors flex items-center justify-center">
                    <span className="material-symbols-outlined">share</span>
                  </button>
                </div>
              </div>
              <div className="flex flex-col gap-4">
                <h4 className="text-body-lg font-bold font-display">Platform</h4>
                <nav className="flex flex-col gap-2">
                  <Link className="text-white/70 hover:text-primary transition-colors" to="/courses">Courses</Link>
                  <Link className="text-white/70 hover:text-primary transition-colors" to="/problems">Problems</Link>
                  <Link className="text-white/70 hover:text-primary transition-colors" to="/contests">Contests</Link>
                  <Link className="text-white/70 hover:text-primary transition-colors" to="/rankings">Leaderboard</Link>
                </nav>
              </div>
              <div className="flex flex-col gap-4">
                <h4 className="text-body-lg font-bold font-display">Support</h4>
                <nav className="flex flex-col gap-2">
                   <a className="text-white/70 hover:text-primary transition-colors" href="#">Help Center</a>
                  <a className="text-white/70 hover:text-primary transition-colors" href="#">FAQ</a>
                  <Link className="text-white/70 hover:text-primary transition-colors" to="/contact">Contact Us</Link>
                  <Link className="text-white/70 hover:text-primary transition-colors" to="/terms">Terms of Service</Link>
                </nav>
              </div>
              <div className="flex flex-col gap-4">
                <h4 className="text-body-lg font-bold font-display">Stay Updated</h4>
                <p className="text-body-md text-white/70">Subscribe to our newsletter for latest updates.</p>
                <div className="flex flex-col gap-2">
                  <input className="bg-white/10 border-white/20 rounded-lg py-2 px-4 text-white placeholder-white/40 focus:ring-primary focus:border-primary" placeholder="Enter your email" type="email" />
                  <button className="w-full bg-primary hover:bg-primary-hover py-2 rounded-lg font-bold transition-colors">Subscribe</button>
                </div>
              </div>
            </div>
            <div className="mt-12 pt-8 border-t border-white/10 flex flex-col md:flex-row justify-between items-center gap-4">
              <p className="text-sm text-white/60">© 2024 Nonstop Coding. All rights reserved.</p>
              <div className="flex gap-6">
                <Link className="text-sm text-white/60 hover:text-primary" to="/privacy">Privacy Policy</Link>
                <Link className="text-sm text-white/60 hover:text-primary" to="/cookies">Cookies Policy</Link>
              </div>
            </div>
          </div>
        </footer>
      )}
    </div>
  );
};
