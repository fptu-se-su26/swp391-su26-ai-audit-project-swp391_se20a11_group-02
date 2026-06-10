import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useApp } from '../context/AppContext';

interface ApplicationStatusResponse {
  id: number;
  userId: number;
  fullName: string;
  email: string;
  cvUrl: string;
  introduction: string;
  status: 'PENDING' | 'APPROVED' | 'REJECTED' | 'AI_REJECTED';
  adminNote?: string;
  aiScore?: number;
  aiSummary?: string;
  aiSpecialization?: string;
  aiTechnologies?: string;
  aiExperienceYears?: number;
  aiStrengths?: string;
  aiWeaknesses?: string;
  aiRecommendation?: string;
  createdAt: string;
}

export const ApplyInstructor: React.FC = () => {
  const { user } = useApp();

  const [cvFile, setCvFile] = useState<File | null>(null);
  const [introduction, setIntroduction] = useState<string>('');
  const [loading, setLoading] = useState<boolean>(true);
  const [submitting, setSubmitting] = useState<boolean>(false);
  const [errorMsg, setErrorMsg] = useState<string>('');
  const [successMsg, setSuccessMsg] = useState<string>('');
  const [currentApp, setCurrentApp] = useState<ApplicationStatusResponse | null>(null);
  const [showRejectedPopup, setShowRejectedPopup] = useState<boolean>(false);

  const BASE_URL = 'http://localhost:8080/nonstopcoding';

  const fetchApplicationStatus = async () => {
    try {
      const response = await fetch(`${BASE_URL}/instructor-applications/my-status`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
        credentials: 'include',
      });

      if (response.ok) {
        const data = await response.json();
        if (data && data.result) {
          setCurrentApp(data.result);
        } else {
          setCurrentApp(null);
        }
      }
    } catch (err) {
      console.error('Error fetching application status:', err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (user) {
      fetchApplicationStatus();
    } else {
      setLoading(false);
    }
  }, [user]);

  useEffect(() => {
    if (currentApp && currentApp.status === 'AI_REJECTED') {
      setShowRejectedPopup(true);
    }
  }, [currentApp?.status, currentApp?.id]);

  useEffect(() => {
    let intervalId: any;
    if (user && currentApp && currentApp.status === 'PENDING' && (!currentApp.aiScore || currentApp.aiScore === 0)) {
      // Poll every 2.5 seconds to check if AI has finished evaluation
      intervalId = setInterval(() => {
        fetchApplicationStatus();
      }, 2500);
    }
    return () => {
      if (intervalId) clearInterval(intervalId);
    };
  }, [user, currentApp?.status, currentApp?.aiScore, currentApp?.id]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!cvFile || !introduction.trim()) {
      setErrorMsg('Please select a PDF or DOCX CV file and fill out the introduction.');
      return;
    }

    if (cvFile.size > 5 * 1024 * 1024) {
      setErrorMsg('CV file size must not exceed 5MB.');
      return;
    }

    if (introduction.trim().length < 50) {
      setErrorMsg('Introduction must be at least 50 characters long.');
      return;
    }

    setSubmitting(true);
    setErrorMsg('');
    setSuccessMsg('');

    try {
      const formData = new FormData();
      formData.append('cv', cvFile);
      formData.append('introduction', introduction);

      const response = await fetch(`${BASE_URL}/instructor-applications/apply`, {
        method: 'POST',
        body: formData,
        credentials: 'include',
      });

      const data = await response.json();

      if (response.ok && data.code === 1000) {
        setSuccessMsg('Instructor application submitted successfully! AI is analyzing your CV.');
        // Refresh status immediately
        await fetchApplicationStatus();
      } else {
        setErrorMsg(data.message || 'Failed to submit application.');
      }
    } catch (err) {
      console.error('Error submitting application:', err);
      setErrorMsg('Server connection error. Please try again later.');
    } finally {
      setSubmitting(false);
    }
  };

  if (!user) {
    return (
      <div className="flex-grow max-w-md mx-auto my-12 p-8 text-center bg-surface border border-gray-150 rounded-2xl shadow-sm relative z-10">
        <span className="material-symbols-outlined text-red-500 text-5xl mb-4">lock</span>
        <h3 className="font-display font-black text-xl text-brand-blue mb-2">Access Denied</h3>
        <p className="font-body text-sm text-text-muted mb-6">You must log in to apply as an instructor.</p>
        <Link to="/login" className="bg-primary hover:bg-primary-hover text-white font-bold text-sm px-6 py-3 rounded-xl transition-all shadow-md">
          Log In
        </Link>
      </div>
    );
  }

  return (
    <div className="flex-grow max-w-[1280px] w-full mx-auto px-6 md:px-16 py-12 flex flex-col gap-8 text-left relative z-10">
      
      {/* Title Header */}
      <div className="flex flex-col gap-2">
        <h1 className="text-3xl font-black font-display text-brand-blue tracking-tight">Become an Instructor</h1>
        <p className="text-sm text-text-muted max-w-2xl">
          Share your coding knowledge with the community, build your personal brand, and earn an attractive revenue share of up to 70% from your courses.
        </p>
      </div>

      {loading ? (
        <div className="flex items-center justify-center p-20 bg-white border border-gray-100 rounded-2xl shadow-sm">
          <span className="material-symbols-outlined animate-spin text-primary text-4xl">sync</span>
          <span className="ml-3 font-semibold text-text-muted text-sm">Loading application status...</span>
        </div>
      ) : currentApp && currentApp.status === 'PENDING' ? (
        /* Status Card: PENDING */
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
          <div className="lg:col-span-8 bg-white rounded-xl shadow-[0_4px_20px_rgba(26,54,93,0.06)] p-6 md:p-8 border border-gray-100 flex flex-col gap-6">
            
            <div className="flex items-start justify-between border-b border-gray-100 pb-4">
              <div className="flex items-center gap-3">
                <span className="material-symbols-outlined text-amber-500 text-3xl icon-fill animate-pulse">pending</span>
                <div>
                  <h3 className="text-lg font-bold text-brand-blue">Application Pending Review</h3>
                  <p className="text-xs text-text-muted mt-0.5">Submitted Date: {new Date(currentApp.createdAt).toLocaleDateString('vi-VN')} {new Date(currentApp.createdAt).toLocaleTimeString('vi-VN')}</p>
                </div>
              </div>
              <button 
                onClick={fetchApplicationStatus} 
                className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg border border-gray-200 text-text-muted hover:text-primary hover:border-primary text-xs font-semibold transition-all"
              >
                <span className="material-symbols-outlined text-sm">refresh</span> Refresh Status
              </button>
            </div>

            <div className="flex flex-col gap-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="bg-slate-50 p-4 rounded-xl border border-slate-100">
                  <span className="text-xs font-bold text-text-muted uppercase tracking-wider">CV Profile (PDF)</span>
                  <a href={currentApp.cvUrl} target="_blank" rel="noreferrer" className="flex items-center gap-2 text-primary hover:underline font-semibold mt-2 text-sm">
                    <span className="material-symbols-outlined text-sm text-primary">picture_as_pdf</span> View Submitted CV
                  </a>
                </div>
                <div className="bg-slate-50 p-4 rounded-xl border border-slate-100">
                  <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Approval Status</span>
                  <div className="flex items-center gap-2 mt-2">
                    <span className="px-2.5 py-1 rounded-full bg-amber-50 text-amber-600 border border-amber-200 text-xs font-bold uppercase">Pending Admin Review</span>
                  </div>
                </div>
              </div>

              <div className="bg-slate-50 p-4 rounded-xl border border-slate-100">
                <span className="text-xs font-bold text-text-muted uppercase tracking-wider block mb-2">Self Introduction</span>
                <p className="text-sm text-text-main leading-relaxed whitespace-pre-wrap">{currentApp.introduction}</p>
              </div>

              {/* AI Auto Auditing Result */}
              <div className="border border-orange-100 bg-orange-50/20 rounded-xl p-5 flex flex-col gap-3">
                <div className="flex items-center justify-between border-b border-orange-100/50 pb-2">
                  <div className="flex items-center gap-2 text-primary">
                    <span className="material-symbols-outlined text-[20px]" style={{ fontVariationSettings: "'FILL' 1" }}>precision_manufacturing</span>
                    <span className="font-bold text-sm">Automated Pre-Evaluation Result (AI Audit)</span>
                  </div>
                  {currentApp.aiScore && currentApp.aiScore > 0 ? (
                    <span className={`px-2 py-0.5 rounded text-[11px] font-extrabold border ${
                      currentApp.aiScore >= 80 ? 'bg-green-50 text-green-600 border-green-200' :
                      currentApp.aiScore >= 50 ? 'bg-amber-50 text-amber-600 border-amber-200' : 'bg-red-50 text-red-600 border-red-200'
                    }`}>
                      AI SCORE: {currentApp.aiScore}/100
                    </span>
                  ) : null}
                </div>
                
                {currentApp.aiScore && currentApp.aiScore > 0 ? (
                  <p className="text-sm text-text-main font-medium leading-relaxed italic">
                    "{currentApp.aiSummary}"
                  </p>
                ) : (
                  <div className="flex items-center gap-2.5 py-2">
                    <span className="material-symbols-outlined animate-spin text-primary text-md">sync</span>
                    <span className="text-xs text-text-muted font-bold">The AI system is scoring your CV. Please click "Refresh" in a few seconds...</span>
                  </div>
                )}
              </div>
            </div>
          </div>

          {/* Right Info Column */}
          <div className="lg:col-span-4 flex flex-col gap-6">
            <div className="bg-brand-blue text-white rounded-xl p-6 relative overflow-hidden shadow-md">
              <h3 className="font-bold text-md border-b border-white/20 pb-3 mb-3 flex items-center gap-2">
                <span className="material-symbols-outlined text-primary icon-fill">info</span> Review Process
              </h3>
              <ul className="text-sm text-white/80 space-y-3">
                <li>1. Candidates submit their application including a PDF CV and a short description.</li>
                <li>2. AI analyzes the CV instantly to provide a preliminary review for the Admin.</li>
                <li>3. Admin manually reviews the application and makes the final decision within 24-48 hours.</li>
              </ul>
            </div>
          </div>
        </div>
      ) : currentApp && currentApp.status === 'APPROVED' ? (
        /* Status Card: APPROVED */
        <div className="bg-white rounded-xl shadow-[0_4px_20px_rgba(26,54,93,0.08)] p-12 border border-gray-150 text-center flex flex-col items-center justify-center gap-4 max-w-2xl mx-auto w-full relative z-10">
          <div className="w-16 h-16 rounded-full bg-green-100 text-green-600 flex items-center justify-center border border-green-200 shadow-sm">
            <span className="material-symbols-outlined text-4xl icon-fill">check_circle</span>
          </div>
          <h3 className="text-2xl font-black text-brand-blue tracking-tight">Application Approved Successfully!</h3>
          <p className="text-sm text-text-muted max-w-md leading-relaxed">
            Congratulations! The Admin has approved your application. You now have Instructor privileges on Nonstop Coding.
          </p>
          {currentApp.adminNote && (
            <div className="bg-green-50/50 border border-green-100 rounded-xl p-4 w-full text-left my-2">
              <span className="text-xs font-bold text-green-700 block mb-1">Notes from Admin:</span>
              <p className="text-sm text-green-800 italic">"{currentApp.adminNote}"</p>
            </div>
          )}
          <div className="flex gap-4 w-full justify-center pt-4 border-t border-gray-100 mt-4">
            <button 
              onClick={() => {
                // Force page refresh or reload app state to apply new role
                window.location.href = `${import.meta.env.BASE_URL}instructor`;
              }} 
              className="bg-primary hover:bg-primary-hover text-white font-extrabold text-sm px-8 py-3 rounded-xl transition-all shadow-md flex items-center gap-2"
            >
              <span>Go to Instructor Dashboard</span>
              <span className="material-symbols-outlined text-sm">arrow_forward</span>
            </button>
          </div>
        </div>
      ) : (
        /* Form: No Application or REJECTED */
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
          
          {/* Submission Form */}
          <div className="lg:col-span-8 bg-white rounded-xl shadow-[0_4px_20px_rgba(26,54,93,0.06)] p-6 md:p-8 border border-gray-100">
            {currentApp && (currentApp.status === 'REJECTED' || currentApp.status === 'AI_REJECTED') && (
              <div className="bg-red-50 border border-red-100 text-red-600 p-5 rounded-xl flex flex-col gap-2 mb-6">
                <div className="flex items-center gap-2 font-bold text-sm">
                  <span className="material-symbols-outlined text-[20px]">cancel</span>
                  <span>
                    {currentApp.status === 'AI_REJECTED'
                      ? 'Your previous application was Auto-Rejected by AI (Score < 50)'
                      : 'Your previous application has been Rejected by Admin'}
                  </span>
                </div>
                {currentApp.adminNote && (
                  <p className="text-xs text-red-500 italic ml-7">Rejection Reason: "{currentApp.adminNote}"</p>
                )}
                <p className="text-xs text-text-muted ml-7 mt-1">You can adjust the information below and resubmit a new application.</p>
              </div>
            )}

            {successMsg && (
              <div className="bg-green-50 border border-green-200 text-green-600 p-4 rounded-xl font-bold flex items-center gap-2 mb-6 text-sm">
                <span className="material-symbols-outlined text-[20px]">check_circle</span>
                {successMsg}
              </div>
            )}

            {errorMsg && (
              <div className="bg-red-50 border border-red-200 text-red-600 p-4 rounded-xl font-bold flex items-center gap-2 mb-6 text-sm">
                <span className="material-symbols-outlined text-[20px]">error</span>
                {errorMsg}
              </div>
            )}

            <form onSubmit={handleSubmit} className="flex flex-col gap-6">
              
              <div className="flex flex-col gap-2">
                <label className="text-sm font-bold text-brand-blue" htmlFor="cvFile">Upload CV (PDF or DOCX)</label>
                <input
                  className="w-full bg-white border border-gray-300 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition-all file:mr-4 file:py-2 file:px-4 file:rounded-xl file:border-0 file:text-xs file:font-semibold file:bg-primary/10 file:text-primary hover:file:bg-primary/20"
                  id="cvFile"
                  name="cvFile"
                  accept=".pdf,.docx"
                  required
                  type="file"
                  onChange={(e) => {
                    if (e.target.files && e.target.files.length > 0) {
                      setCvFile(e.target.files[0]);
                    }
                  }}
                />
                <p className="text-xs text-text-muted mt-1">
                  Please upload your CV in PDF or DOCX format. The AI system will read data directly from this file for evaluation.
                </p>
              </div>

              <div className="flex flex-col gap-2">
                <label className="text-sm font-bold text-brand-blue" htmlFor="introduction">Introduce Yourself & Expertise</label>
                <textarea
                  className="w-full bg-white border border-gray-300 rounded-xl px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition-all min-h-[160px]"
                  id="introduction"
                  name="introduction"
                  placeholder="Introduce your coding experience, projects you have done, the expertise area you want to teach, and your tutoring/teaching experience (if any)..."
                  required
                  value={introduction}
                  onChange={(e) => setIntroduction(e.target.value)}
                />
                <p className="text-xs text-text-muted mt-1">Minimum 50 characters. This information is crucial for AI and Admin to evaluate your application.</p>
              </div>

              <div className="pt-4 border-t border-gray-150 mt-2">
                <button
                  disabled={submitting}
                  className="w-full bg-primary hover:bg-primary-hover text-white py-3.5 rounded-xl transition-all shadow-md hover:shadow-lg flex justify-center items-center gap-2 font-bold text-sm disabled:opacity-50"
                  type="submit"
                >
                  {submitting ? (
                    <>
                      <span className="material-symbols-outlined animate-spin text-sm">sync</span>
                      <span>Submitting application & Running AI CV scan...</span>
                    </>
                  ) : (
                    <>
                      <span>Submit Instructor Application</span>
                      <span className="material-symbols-outlined text-sm">send</span>
                    </>
                  )}
                </button>
              </div>
            </form>
          </div>

          {/* Right Info Column */}
          <div className="lg:col-span-4 flex flex-col gap-6">
            <div className="bg-brand-blue text-white rounded-xl p-6 relative overflow-hidden shadow-md">
              <h3 className="font-bold text-md border-b border-white/20 pb-3 mb-3 flex items-center gap-2">
                <span className="material-symbols-outlined text-primary icon-fill">school</span> Become an Instructor
              </h3>
              <p className="text-xs text-white/70 leading-relaxed mb-4">
                Nonstop Coding seeks high-caliber experts passionate about sharing technology with the younger generation.
              </p>
              <ul className="text-xs text-white/80 space-y-3">
                <li className="flex gap-2">
                  <span className="material-symbols-outlined text-primary text-sm shrink-0">check_circle</span>
                  <span>Get an attractive revenue share of up to <strong>70%</strong>.</span>
                </li>
                <li className="flex gap-2">
                  <span className="material-symbols-outlined text-primary text-sm shrink-0">check_circle</span>
                  <span>Leverage the Coding Arena ecosystem with auto-grading for students.</span>
                </li>
                <li className="flex gap-2">
                  <span className="material-symbols-outlined text-primary text-sm shrink-0">check_circle</span>
                  <span>Freely design your course structures and pricing.</span>
                </li>
              </ul>
            </div>

            <div className="bg-white border border-gray-200 rounded-xl p-5 flex items-start gap-4 shadow-sm">
              <span className="material-symbols-outlined text-primary mt-1">precision_manufacturing</span>
              <div>
                <h4 className="font-bold text-brand-blue mb-1 text-sm">Automated AI Audit System</h4>
                <p className="text-[11px] text-text-muted leading-relaxed">
                  As soon as you upload your CV, our AI system will extract information, evaluate technical skill alignment, and provide a quick profile summary directly to the Admin, significantly speeding up application processing.
                </p>
              </div>
            </div>
          </div>

        </div>
      )}

      {/* MODAL: AI REJECTION POPUP */}
      {showRejectedPopup && currentApp && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl border border-red-100 shadow-2xl max-w-md w-full p-6 animate-fade-in text-center relative">
            <button 
              onClick={() => setShowRejectedPopup(false)} 
              className="absolute top-4 right-4 material-symbols-outlined text-slate-400 hover:text-slate-600 transition-colors"
            >
              close
            </button>
            <div className="flex flex-col items-center">
              <div className="w-12 h-12 rounded-full bg-red-50 text-red-500 flex items-center justify-center mb-4 border border-red-100">
                <span className="material-symbols-outlined text-3xl font-black">cancel</span>
              </div>
              <h3 className="font-display font-black text-base text-red-600 mb-2 leading-snug">
                Your previous application was Auto-Rejected by AI (Score &lt; 50)
              </h3>
              
              {currentApp.adminNote && (
                <div className="bg-red-50/50 border border-red-100 rounded-xl p-4 w-full text-left my-3">
                  <span className="text-xs font-bold text-red-700 block mb-1">Rejection Reason:</span>
                  <p className="text-xs text-red-800 leading-relaxed italic">
                    "{currentApp.adminNote}"
                  </p>
                </div>
              )}
              
              <p className="text-xs text-text-muted mb-6">
                You can adjust the information below and resubmit a new application.
              </p>
              
              <button 
                onClick={() => setShowRejectedPopup(false)}
                className="w-full bg-primary hover:bg-primary-hover text-white font-bold text-sm py-3 rounded-xl transition-all shadow-md"
              >
                Adjust & Re-apply
              </button>
            </div>
          </div>
        </div>
      )}

    </div>
  );
};
